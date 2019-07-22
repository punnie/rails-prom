# Instrumenting a Rails application

Hi there! This is the application used in the talk [Instrumenting a Rails application](https://ethereal.io/2019-07-22/instrumenting-a-rails-application/).

Feel more than welcome to clone this repository and experiemnt with it as you please.

## Prerequisites 

To run and explore this example it is recommended you do it using docker-compose, and for that you'll need a recent version of docker and docker-compose installed in your computer. Here are the installation guides for [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/).

If you want to further develop and experiment with this example then it is recommended you have Ruby installed in your computer, and a nice text editor.

Before running you want to make sure you do **not** have anything running on the ports `9090`, `5000`, `9394` and `3000` on your computer. If you do the example will still run, but you might not be able to reach some of the components.

## Running and stopping the application

To run the example type this in your terminal, in the directory of this project:

```bash
docker-compose up -d
```

If you want to generate more traffic to your application (i.e. more users), increase the number of generators as so:

```bash
docker-compose up -d --scale generator=10
```

You may run this at any time.

To shut down all components type:

```bash
docker-compose down
```

You will keep your settings and data when you shut down. If you want to clear all data and settings delete the `data/prometheus` and `data/grafana` directories.


## Stuff worth exploring

### Grafana

Grafana, the service that will help you visualize your metrics with the help of graphs and charts, is available at `http://localhost:5000`. The default username/password combination for it is `admin/admin`.

You'll find two dashboards already populated with graphs. Feel free to play around with them.

Grafana offers an exchange where you can download pre-made dashboards. One that may be interesting is [this one](https://grafana.com/grafana/dashboards/10306).

A couple of good exercises you might want to do to flex your Grafana and statistics skills are:

1. What do the 1% slowest requests of the application look like? How slow are them?
1. Plot a graph with the distribution of results for the dice roll of `2d6`. Which result are you most likely to achieve?

If you wish to further explore Grafana the documentation is available [here](https://grafana.com/docs/).


### Prometheus

Prometheus, the database that will store your metrics, is available at `http://localhost:9090`. 

This dashboard may be interesting to explore to get acquainted with how Prometheus works internally.

Here you may:

* Query the database and get the results in a raw table-like format, unlike with Grafana in which you will get a chart
* Check the database status and various information such as build version, data retention period (the number of days Prometheus will hold your metrics)
* See the status of the services your Prometheus is checking, and see how many metrics it gathers from them
* Gather information about the alerts you define in Prometheus' Alert Manager
* Check your configuration and confirm Prometheus is running according to what you expect

Two good exercises you might want to do to explore this technology further are:

1. The application is using SQLite3 as the main database. Try changing it to a PostgreSQL or MySQL database and get Prometheus to monitor it
1. Read more about AlertManager and make it alert you via email when your application experiences an error rate above 5% over 5 minutes

Documentation for Prometheus is available [here](https://prometheus.io/docs/).


### The application

The Rails application has two controllers with two endpoints each.

```
            Prefix Verb   URI Pattern                            Controller#Action
                   POST   /cointosses(.:format)                  cointosses#create
          cointoss GET    /cointosses/:id(.:format)              cointosses#show
                   POST   /dicerolls(.:format)                   dicerolls#create
          diceroll GET    /dicerolls/:id(.:format)               dicerolls#show
```

The `CointossesController` POST action takes a `num` parameter that specifies the number of coin tosses to happen. The result looks like this:

```json
{
    "id": 832,
    "created_at": "2019-07-22T11:03:00.774Z",
    "updated_at": "2019-07-22T11:03:00.774Z",
    "parameters": "3",
    "result": [
        "heads",
        "tails",
        "heads"
    ],
    "url": "http://localhost:3000/cointosses/832.json"
}
```

The `DicerollsController` POST action takes a `spec` parameter that specifies the dice roll to happen in the `d20` format. This format lets you tell how many dice with how many sides you want to roll. For example, `2d6` is the spec to roll **2** dice with **6** sides each. The result is the sum of all rolls and looks like this:

```json
{
    "id": 828,
    "created_at": "2019-07-22T10:59:53.359Z",
    "updated_at": "2019-07-22T10:59:53.359Z",
    "parameters": "1d20",
    "result": "20",
    "url": "http://localhost:3000/dicerolls/828.json"
}
```

## Mandatory production notice

This is not production ready software. If for some reason you consider deploying it live, please take caution. There is no access control, so everyone will be able to do everything with your components, including deleting data or changing configuration. All ports are open to the Internet which is a security risk, and the configuration of the components may not be adequate to your load or use case.
