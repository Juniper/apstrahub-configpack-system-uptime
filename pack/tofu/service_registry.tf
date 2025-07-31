resource "apstra_raw_json" "service_registry" {
  url = "/api/telemetry-service-registry"
  id = "System_Uptime_${var.blueprint_id}"
  payload = jsonencode(
    {
      description        = "Uptime service registry"
      application_schema = {
        properties = {
          key = {
            properties = {
              Clock_Source ={
                type = "string"
              },
              Uptime = {
                type = "string"
              }
            },
            required = [
              "Clock_Source",
              "Uptime"
            ],
            type = "object"
          },
          value = {
            type = "integer"
          }
        }
          required = [
            "key",
            "value"
          ],
          type = "object"
        },
        service_name = "System_Uptime_${var.blueprint_id}",
        storage_schema_path = "aos.sdk.telemetry.schemas.iba_integer_data",
      }
  )
}