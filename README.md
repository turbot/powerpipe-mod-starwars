# Star Wars Mod for Powerpipe

View dashboards to analyze [Star Wars](https://www.starwars.com/) characters, species, planets, spaceships, and more.

![image](https://github.com/turbot/powerpipe-mod-starwars/blob/add-dashboards/docs/starwars_dashboard_screenshot.png)

## Overview

Dashboards can help answer questions like:

- How many starships are cataloged in the database?
- What is the distribution of planet populations across the galaxy?
- Which species has the highest average height?
- What are the most common climates on planets within the Star Wars universe?
- Which manufacturers have produced the most starships?

## Documentation

- **[Dashboards →](https://hub.powerpipe.io/mods/turbot/starwars/dashboards)**

## Installation

Download and install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install turbot/tap/powerpipe
```

Install the mod:

```sh
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/powerpipe-mod-starwars
```

Download the [Datasets for Star Wars Analysis](https://www.kaggle.com/datasets/souravthe/star-war-dataset-analysis-duckdb/data?select=star_war.duckdb) (requires signup with [Kaggle](https://www.kaggle.com/))

Extract the downloaded file in the dashboards directory:

```sh
unzip ~/Downloads/archive.zip
```

## Usage

Run the dashboard and specify the DB connection string:

```sh
powerpipe server --database duckdb:star_wars.duckdb
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Powerpipe](https://powerpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://powerpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [StarWars Mod](https://github.com/turbot/powerpipe-mod-starwar/labels/help%20wanted)
