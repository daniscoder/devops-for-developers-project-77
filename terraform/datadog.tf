resource "datadog_monitor" "redmine_http" {
  name    = "Redmine HTTP Check"
  type    = "service check"
  message = "Redmine is down on {{host.name}}"

  query = "\"http.can_connect\".over(\"*\").by(\"host\").last(2).count_by_status()"

  monitor_thresholds {
    critical = 1
    warning  = 1
    ok       = 1
  }

  notify_no_data    = true
  no_data_timeframe = 10
}
