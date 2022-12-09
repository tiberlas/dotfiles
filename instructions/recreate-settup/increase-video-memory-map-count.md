# Increase video memory map count

## HOW

In arch create a file `/etc/sysctl.d/90-override.conf`
And put in the file:
```90-override.conf
vm.max_map_count=2147483642
vm.swappiness=5
```

## WHY

https://fedoraproject.org/wiki/Changes/IncreaseVmMaxMapCount

