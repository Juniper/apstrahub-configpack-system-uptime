resource "apstra_raw_json" "uptime_probe" {
  url = format("/api/blueprints/%s/probes",var.blueprint_id)
  depends_on = [
    apstra_raw_json.collector
  ]
  payload   = <<-EOT
  {
  "label": "Device Uptime",
  "description": "",
  "processors": [
    {
      "name": "System_Uptime",
      "type": "extensible_data_collector",
      "properties": {
        "service_name": "System_Uptime",
        "service_interval": "60",
        "value_map": {},
        "graph_query": [
          "match(node('system', name='system', deploy_mode='deploy', role=is_in(['leaf', 'access', 'spine', 'superspine'])).out('interface_map').node('interface_map').out('device_profile').node('device_profile', name='DP'))"
        ],
        "service_input": "''",
        "query_group_by": [],
        "Device_Profile": "str(DP.label)",
        "keys": [],
        "ingestion_filter": {},
        "data_type": "dynamic",
        "query_tag_filter": {
          "filter": {},
          "operation": "and"
        },
        "execution_count": "-1",
        "system_id": "system.system_id",
        "query_expansion": {},
        "enable_streaming": false
      },
      "inputs": {},
      "outputs": {
        "out": "System_Uptime"
      }
    },
    {
      "name": "System_Rebooted_in_Last_Day",
      "type": "range_check",
      "properties": {
        "property": "value",
        "raise_on_nan": false,
        "raise_anomaly": true,
        "graph_query": [],
        "anomaly_retention_duration": 86400,
        "range": {
          "max": 1440
        },
        "enable_streaming": false,
        "anomaly_retention_size": 1073741824,
        "enable_anomaly_logging": false
      },
      "inputs": {
        "in": {
          "stage": "System_Uptime",
          "column": "value"
        }
      },
      "outputs": {
        "out": "System_Rebooted_in_Last_Day"
      }
    },
    {
      "name": "System_Rebooted_in_Last_Hour",
      "type": "range_check",
      "properties": {
        "property": "value",
        "raise_on_nan": false,
        "raise_anomaly": true,
        "graph_query": [],
        "anomaly_retention_duration": 86400,
        "range": {
          "max": 60
        },
        "enable_streaming": false,
        "anomaly_retention_size": 1073741824,
        "enable_anomaly_logging": false
      },
      "inputs": {
        "in": {
          "stage": "System_Uptime",
          "column": "value"
        }
      },
      "outputs": {
        "out": "System_Rebooted_in_Last_Hour"
      }
    },
    {
      "name": "System_Rebooted_in_Last_Week",
      "type": "range_check",
      "properties": {
        "property": "value",
        "raise_on_nan": false,
        "raise_anomaly": true,
        "graph_query": [],
        "anomaly_retention_duration": 86400,
        "range": {
          "max": 10080
        },
        "enable_streaming": false,
        "anomaly_retention_size": 1073741824,
        "enable_anomaly_logging": false
      },
      "inputs": {
        "in": {
          "stage": "System_Uptime",
          "column": "value"
        }
      },
      "outputs": {
        "out": "System_Rebooted_in_Last_Week"
      }
    }
  ],
  "stages": [
    {
      "name": "System_Rebooted_in_Last_Hour",
      "description": "",
      "units": {
        "value": ""
      },
      "enable_metric_logging": true,
      "retention_duration": 86400,
      "retention_size": 0,
      "graph_annotation_properties": {}
    },
    {
      "name": "System_Uptime",
      "description": "",
      "units": {
        "value": ""
      },
      "enable_metric_logging": false,
      "retention_duration": 86400,
      "retention_size": 0,
      "graph_annotation_properties": {}
    },
    {
      "name": "System_Rebooted_in_Last_Week",
      "description": "",
      "units": {
        "value": ""
      },
      "enable_metric_logging": true,
      "retention_duration": 86400,
      "retention_size": 0,
      "graph_annotation_properties": {}
    },
    {
      "name": "System_Rebooted_in_Last_Day",
      "description": "",
      "units": {
        "value": ""
      },
      "enable_metric_logging": true,
      "retention_duration": 86400,
      "retention_size": 0,
      "graph_annotation_properties": {}
    }
  ]
}
EOT
}