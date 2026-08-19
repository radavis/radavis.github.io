---
layout: post
title: "Local LLM Inference on Legacy Hardware"
date: 2026-08-19 10:00
tags: llama.cpp qwen ai ubuntu
---

# Running a 35B Model on a GTX 1080

How to run Qwen3.6 35B on hardware that's probably gathering dust somewhere.

![Prompting the llama-ui within LibreWolf browser](/assets/images/llama-ui.png)

## Background

This video **[Running a 35B AI Model on 6GB VRAM by Codacus](https://www.youtube.com/watch?v=8F_5pdcD3HY)** piqued my interest, as I've been trying out local models with LM Studio on a M4. I had to see if I could replicate their results on my old gaming PC.

I'm getting around a **~20 token/second** response rate on hardware that's about to celebrate its 10th birthday. 🎂

## Specs

- **GPU**: [Zotac GeForce GTX 1080 Mini](https://www.zotac.com/us/product/graphics_card/zotac-geforce-gtx-1080-mini) -- 8GB VRAM
- **MB**: [ASRock Z97M OC Formula](https://www.asrock.com/mb/Intel/Z97M%20OC%20Formula/) -- PCIe 3.0
- **CPU**: [Intel Core i7-4790K @ 4.40GHz](https://www.intel.com/content/www/us/en/products/sku/80807/intel-core-i74790k-processor-8m-cache-up-to-4-40-ghz/specifications.html) -- Gen. 4 (I think they're on 15, now.)
- **RAM**: [Corsair 32GB (8GBx4)](https://www.corsair.com/us/en/p/memory/cmz8gx3m1a1600c9/vengeancea-a-8gb-ddr3-memory-kit-cmz8gx3m1a1600c9) -- DDR3

In 2026, everything about this PC screams, "Please, drop me off at the closest electronics recycling center!" ♻️

We're going to use it for local model inference. 😈

## Cost

The UPS is reporting ~70W when idle, and ~230W under load. Operational cost I'll estimate to be `0.2kW * 8h * $0.15kWh`, **$0.24/day**, **$5.28/month**, assuming it's not working weekends. I'll have to pull up some old receipts to know what this rig cost when I built it oh so long ago. Considering its age, and seeing as it is pulling double-duty running old FPSes _and_ performing local model inference, I think we can safely call that line item negligible.

The remainder of the information here documents the steps on how to replicate these results on similar hardware.

## OS and Drivers

- [Ubuntu v22.04 LTS (Jammy Jellyfish)](https://releases.ubuntu.com/jammy/) -- fresh install
- NVIDIA Driver v570.211.01
- CUDA v12.6

Because [CUDA drops support](https://stackoverflow.com/a/28933055) for Compute Capability 6.1 GPUs after CUDA v12.6, and Ubuntu wants to install [`nvidia-driver-580` by default](https://docs.nvidia.com/deploy/cuda-compatibility/latest/minor-version-compatibility.html), we have to do a bit of a dance with `apt` in order to get our dependencies aligned.

1. Fall-back to the `nouveau` video drivers: `Software & Updates -> Additional Drivers -> GeForce 1080 -> Using X.Org X server -- Nouveau display driver... -> Apply Changes`. Then, reboot.
2. `dpkg -l | grep nvidia` and `sudo apt purge` the listed dependencies. Reboot.
3. Install the [cuda-keyring](https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/ubuntu.html#network-repository-enablement-amd64), and then the `nvidia-driver-pinning-570.211.01`, `cuda-drivers-570` packages.
4. [Pin the driver version](https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/version-locking.html#apt), so that `apt` won't update it past major version `570`.
5. Install the [CUDA Toolkit v12.6](https://developer.nvidia.com/cuda-12-6-3-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network)

## Build llama-cpp with turboquant

```bash
$ git clone git@github.com:TheTom/llama-cpp-turboquant
$ cd llama-cpp-turboquant
# specify CUDACXX location, or add the path to nvcc to $PATH
$ export CUDACXX=/usr/local/cuda/bin/nvcc
$ cmake -S . -B build \
    -DGGML_CUDA=ON \
    -DCMAKE_CUDA_ARCHITECTURES=61
$ cmake --build build --config Release -j $(nproc)
```

## Install hf CLI and models

```bash
$ curl -LsSf https://hf.co/cli/install.sh | bash
$ hf --install-completion
$ export HF_TOKEN=... # to auth w/ huggingface and enable faster downloads
$ hf download hf://bartowski/Qwen_Qwen3.6-35B-A3B-GGUF/Qwen_Qwen3.6-35B-A3B-Q4_K_M.gguf
```

## Run llama-server

```bash
# from llama-cpp-turboquant/build
$ ./bin/llama-server \
    -hf bartowski/Qwen_Qwen3.6-35B-A3B-GGUF:Q4_K_M \
    --host 0.0.0.0 \
    --port 8080 \
    --cache-type-k turbo4 \
    --cache-type-v turbo3 \
    --load-mode mmap+mlock \
    --n-cpu-moe 36 \
    --fit-ctx 262144
```

Open [localhost:8080](http://localhost:8080), and prompt away! 🤖

## Finally...

- [x] Connect VSCode ([VSCodium](https://github.com/VSCodium/vscodium#readme)) to your running model. I like [Continue.dev](https://docs.continue.dev/).
- [x] Setup an agent harness such as [pi.dev](https://pi.dev/) with the [pi-llama-cpp extension](https://pi.dev/packages/pi-llama-cpp).
- [x] Ask your running model about llama.cpp CLI flags. (e.g. -- `What does --cache-type-k turbo4 do when running llama.cpp?`).
- [x] Experiment with other models, such as [Gemma 4](https://huggingface.co/models?search=gemma+4).
- [x] Cancel your [Claude subscription](https://claude.com/pricing). 🤭
