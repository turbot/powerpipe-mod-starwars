# Star Wars Data Analysis Mod for PowerPipe

Analyze characters, species, planets, spaceships and vehicle performance data using DuckDb and PowerPipe.

![star-wars-analysis-dashboard](https://github.com/turbot/powerpipe-mod-star-wars/assets/72413708/f5c5d90b-da23-4cb9-94a5-5614d6e642a2)

## Installation

Download and install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install turbot/tap/powerpipe
```

## Clone the Mod Repository

```sh
git clone https://github.com/turbot/powerpipe-mod-star-wars.git
cd powerpipe-mod-star-wars
```

## Install the Dataset

- Visit the [Datasets for Star Wars Analysis (DuckDB)](https://www.kaggle.com/datasets/souravthe/star-war-dataset-analysis-duckdb/data?select=star_war.duckdb).

- Click on `Download` (Free signup to Kaggle is required).

- Unzip the Downloaded File:

  - For Mac/Linux:
    - Use the command `unzip ~/Downloads/archive.zip` to extract the file.

  - For Windows:
    - Navigate to the folder containing the downloaded ZIP file, usually the Downloads folder.
    - Right-click on the ZIP file and choose `Extract All...` or `Extract Here` depending on your preference. Follow the on-screen instructions to complete the extraction.

## Usage

Run the dashboard and specify the DB connection string:

```sh
powerpipe server --database duckdb:star_wars.duckdb
```

If you have extracted the file in any other location then you need to provide the full path like below:

```sh
powerpipe server --database duckdb:///path/to/the/file/file.duckdb
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Powerpipe](https://powerpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://powerpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [Star Wars Mod](https://github.com/turbot/powerpipe-mod-star-wars/labels/help%20wanted)