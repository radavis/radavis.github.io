```
$ mame -listxml > mame.xml
$ xmllint --shell mame.xml
/ > help
/ > ls
/ > xpath /mame/machine/description
```

## mame.xml sample

```
<mame build="0.196 (unknown)" debug="no" mameconfig="10">
        <machine name="11beat" sourcefile="aleck64.cpp" romof="aleck64">
                <description>Eleven Beat</description>
                <year>1998</year>
                <manufacturer>Hudson</manufacturer>
                <rom name="pifdata.bin" merge="pifdata.bin" size="2048" crc="5ec82be9" sha1="9174eadc0f0ea2654c95fd941406ab46b9dc9bdd" region="user1" offset="0"/>
                <rom name="nus-zhaj.u3" size="8388608" crc="02faa8a7" sha1="824911452639cedf6a8186c05cd046e61fc98896" region="user2" offset="0"/>
                <rom name="normpnt.rom" merge="normpnt.rom" size="128" crc="e7f2a005" sha1="c27b4a364a24daeee6e99fd286753fd6216362b4" region="normpoint" offset="0"/>
                <rom name="normslp.rom" merge="normslp.rom" size="128" crc="4f2ae525" sha1="eab43f8cc52c8551d9cff6fced18ef80eaba6f05" region="normslope" offset="0"/>
                <device_ref name="vr4300be"/>
                <device_ref name="rsp"/>
                <device_ref name="screen"/>
                <chip type="cpu" tag="maincpu" name="Hitachi SH-4 (little)" clock="200000000"/>
                <display tag="screen" type="raster" rotate="0" width="640" height="480" refresh="60.000000" />

                <!-- ... -->
        </machine>

        <!-- ... -->
</mame>
```


## Interesting xpath attributes

# /mame/machine[@name]
* /mame/machine/description
* /mame/machine/year
* /mame/machine/display[@rotate]


## Vertical Games

```
/ > xpath //machine/display[@rotate=90 or @rotate=270]
```

## Parsing w/ Ruby

```
$ touch vertical_games
$ $EDITOR vertical_games
```

```
#!/usr/bin/env ruby
require "nokogiri"
doc = Nokogiri::XML(open("mame.xml"))

puts "rom, name, description, year, manufacturer"
doc.xpath("//machine/display[@rotate=90]").each do |el|
  machine = el.parent
  rom = machine["romof"]
  name = machine["name"]
  description = machine.xpath("description").text
  year = machine.xpath("year").text
  manufacturer = machine.xpath("manufacturer").text

  puts "#{rom}, #{name}, #{description}, #{year}, #{manufacturer}"
end
```

```
$ chmod +x vertical_games
$ ./vertical_games > vertical_games.csv
```

[source](https://stackoverflow.com/a/11219941)
