resource "apstra_raw_json" "ddos_dashboard" {
  url = format("/api/blueprints/%s/iba/dashboards",var.blueprint_id)
  payload = jsonencode({
    label = "System Uptime",
    description = "",
    grid = [
      [
        {
          label = "System_Rebooted_in_Last_Hour",
          description = "",
          type = "stage",
          probe_id = "ee270ebf-e055-4b5e-8c46-84662bbf2f61",
          stage_name = "System_Rebooted_in_Last_Hour",
          filter = "value = \"true\"",
          visible_columns = [
            "properties.system_id",
            "properties.Clock_Source",
            "properties.Device_Profile",
            "anomaly"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = false,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ],
      [
        {
          label = "System_Rebooted_in_Last_Day",
          description = "",
          type = "stage",
          probe_id = "ee270ebf-e055-4b5e-8c46-84662bbf2f61",
          stage_name = "System_Rebooted_in_Last_Day",
          filter = "value = \"true\"",
          visible_columns = [
            "properties.system_id",
            "properties.Clock_Source",
            "properties.Device_Profile",
            "anomaly"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = false,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ],
      [
        {
          label = "System_Rebooted_in_Last_Week",
          description = "",
          type = "stage",
          probe_id = "ee270ebf-e055-4b5e-8c46-84662bbf2f61",
          stage_name = "System_Rebooted_in_Last_Week",
          filter = "value = \"true\"",
          visible_columns = [
            "properties.system_id",
            "properties.Clock_Source",
            "properties.Device_Profile",
            "anomaly"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = false,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ]
    ],
    default = false,
  }
  )
}