# Self-Signed Cert

```
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
$ openssl dhparam -out dhparam.pem 2048
$ openssl dhparam -out dhparam.pem 4096  # more secure but takes longer
```

## Files

* /etc/ssl/private/nginx-selfsigned.key
* /etc/ssl/certs/nginx-selfsigned.crt
* /etc/ssl/certs/dhparam.pem
* /etc/nginx/snippets/self-signed.conf

Or, just stuff all this at `/etc/nginx`.

ip: 3.17.43.68
domain: docker-app.otm.fearless.tech

## References

* [Create a Self-Signed SSL Certificate for Nginx](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)
* [Cipherli.st](https://cipherli.st/)
* [Let's Encrypt and Amazon Route 53](https://disjoint.ca/til/2016/03/26/lets-encrypt-tls-certificates-using-route53-dns-verification/)
