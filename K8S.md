# Running ElastiFlow&trade; on Kubernetes

[![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

> SUPPORTING ElastiFlow&trade; - Today literally 1000s of users leverage ElastiFlow&trade; As a powerful alternative to expensive commercial flow collecting solutions. As its popularity has increased, so has the time commitment necessary to support users and provide further enhancements. If you are one of the organizations who appreciate the value of ElastiFlow&trade;, I would like to ask you to consider becoming a sponsor. The support from sponsors allows me dedicate more time and energy to the project. To become a sponsor, please visit ElastiFlow on [![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow).


## Setting up ElastiFlow&trade; on Kubernetes

ElastiFlow and a single node elasticsearch database is defined in `k8s.yaml`.
To get a basic configuration up and running, just run `kubectl apply -f k8s.yaml`. If you want to put everything in its own namespace:
```
$ kubectl create namespace elastiflow
$ kubectl apply --namespace=elastiflow -f k8s.yaml
```

## Accessing Kibana

The kibana dashboard does not have an ingress in this configuration. To setup port forwarding, run:
```
kubectl -n elastiflow port-forward $(kubectl -n elastiflow get pod -l app=elasticsearch -l type=kibana -o jsonpath="{.items[0].metadata.name}") 5601`
```
While this command is running, you can access the Kibana dashboard via <http://localhost:5601>


## Import Dashboards into Kibana

The Index Patterns, vizualizations and dashboards can be loaded into Kibana by importing the `elastiflow.kibana.<VER>.json` file from within the Kibana UI. This is done from the `Management -> Saved Objects` page.

You may also want to configure the recommend advanced Kibana settings discussed in `INSTALL.md`.
