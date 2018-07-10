#!/bin/bash

set -euo pipefail

beat=$1

until curl -s http://kibana:5601 > /dev/null; do
    sleep 2
done
sleep 5

curl -X POST http://kibana:5601/api/saved_objects/index-pattern/elastiflow-* -H "Content-Type: application/json" -H "kbn-xsrf: true" -d @/data/elastiflow.index_pattern.json
curl -X POST http://kibana:5601/api/kibana/dashboards/import -H "Content-Type: application/json" -H "kbn-xsrf: true" -d @/data/elastiflow.dashboards.curl.json

curl -X POST -H "Content-Type: application/json" -H "kbn-xsrf: true" -d '{"value":"false"}' http://kibana:5601/api/kibana/settings/doc_table:highlight
curl -X POST -H "Content-Type: application/json" -H "kbn-xsrf: true" -d '{"value":"true"}' http://kibana:5601/api/kibana/settings/filters:pinnedByDefault
curl -X POST -H "Content-Type: application/json" -H "kbn-xsrf: true" -d '{"value":"true"}' http://kibana:5601/api/kibana/settings/state:storeInSessionStorage
curl -X POST -H "Content-Type: application/json" -H "kbn-xsrf: true" -d '{"value":"[{"from": "now/d", "to": "now/d", "display": "Today", "section": 0}, {"from": "now/w", "to": "now/w", "display": "This week", "section": 0}, {"from": "now/M", "to": "now/M", "display": "This month", "section": 0},{"from": "now/d", "to": "now", "display": "Today so far", "section": 0}, {"from": "now/w", "to": "now", "display": "Week to date", "section": 0},{"from": "now/M", "to": "now", "display": "Month to date", "section": 0}, {"from": "now-15m", "to": "now", "display": "Last 15 minutes", "section": 1},{"from": "now-30m", "to": "now", "display": "Last 30 minutes", "section": 1}, {"from": "now-1h", "to": "now", "display": "Last 1 hour", "section": 1},{"from": "now-2h", "to": "now", "display": "Last 2 hours", "section": 1}, {"from": "now-4h", "to": "now", "display": "Last 4 hours", "section": 2},{"from": "now-12h", "to": "now", "display": "Last 12 hours", "section": 2}, {"from": "now-24h", "to": "now", "display": "Last 24 hours", "section": 2},{"from": "now-48h", "to": "now", "display": "Last 48 hours", "section": 2}, {"from": "now-7d", "to": "now", "display": "Last 7 days", "section": 3},{"from": "now-30d", "to": "now", "display": "Last 30 days", "section": 3}, {"from": "now-60d", "to": "now", "display": "Last 60 days", "section": 3},{"from": "now-90d", "to": "now", "display": "Last 90 days", "section": 3}]"}' http://kibana:5601/api/kibana/settings/timepicker:quickRanges
