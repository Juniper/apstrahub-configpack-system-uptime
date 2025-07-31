# System Uptime Config Pack

## What does this Config Pack Do

This config pack creates the iba elements required to create a Dashboard showing when the devices were last rebooted.

## JunOS Compatibility
This Config Pack will work with version 21.2r2+ on JunOS families junos, junos-ex and junos-qfx

## Components

| Component | Name                         | Description                                                             |
|-----------|------------------------------|-------------------------------------------------------------------------|
|Service Registry | System_Uptime_<blueprint_id> | Service description for the System Uptime collector                     |
|Custom Collector| System_Uptime_<blueprint_id>                | Custom Collector that reads the last reboot time                        |
|Probe| System_Uptime                | Probe that consumes the collector output has stages for different times |
|Dashboard| System Uptime                | Dashboard that consumes the Probe                                       |                                              |

