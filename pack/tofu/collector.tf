resource "apstra_raw_json" "collector" {
  depends_on = [
    apstra_raw_json.service_registry
  ]
  url = "/api/telemetry/collectors"
  id = "System_Uptime_${var.blueprint_id}"
  payload = jsonencode({
    service_name = "System_Uptime_${var.blueprint_id}",
    collectors = [
      {
        platform = {
          os_type = "junos",
          os_version =  "21.2r2",
          family = "junos,junos-ex,junos-qfx",
          model = ""
        },
        source_type = "cli",
        cli = "show system uptime",
        query = {
          accessors = {
            Clock_Source = "/system-uptime-information/time-source",
            Uptime = "/system-uptime-information/uptime-information/up-time"
          },
          keys = {
            Clock_Source = "Clock_Source",
            Uptime = "Uptime"
          },
          values = {
            value = "(int(Uptime.split('w')[0]) * 7 * 24 * 60 + int(Uptime.split('d')[0].split('w')[-1]) * 24 * 60 + int(Uptime.split(':')[0].split(' ')[-1]) * 60 + int(Uptime.split(':')[1].split(' ')[0])) if 'w' in Uptime else ((int(Uptime.split('d')[0]) * 24 * 60 + int(Uptime.split(':')[0].split(' ')[-1]) * 60 + int(Uptime.split(':')[1].split(' ')[0])) if 'd' in Uptime and 'days' not in Uptime else ((int(Uptime.split(' ')[0]) * 24 * 60 + int(Uptime.split(':')[0].split(', ')[-1]) * 60 + int(Uptime.split(':')[1])) if ' day' in Uptime else ((int(Uptime.split(':')[0]) * 60 + int(Uptime.split(':')[1]) + int(Uptime.split(':')[2]) // 60) if len(Uptime.split(':')) > 2 else ((int(Uptime.split(':')[0]) * 60 + int(Uptime.split(':')[1])) if ':' in Uptime else int(Uptime.split(' ')[0]) if ' mins' in Uptime or ' min' in Uptime else 0))))"
          },
          filter = ""
        },
        relaxed_schema_validation = true
      }
    ],
  }
  )
}