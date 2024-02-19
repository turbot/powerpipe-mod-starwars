dashboard "star_wars_analysis_dashboard" {

  title = "Star Wars Data Analysis Dashboard"

  container {

    title = "Overview"

    card {
      query = query.total_starships
      width = 3
    }

    card {
      query = query.total_planets
      width = 3
    }

    card {
      query = query.total_species
      width = 3
    }

    card {
      query = query.total_characters
      width = 3
    }
  }

  container {

    title = "Planets Analysis"

    chart {
      title = "Planets Population Distribution"
      query = query.planet_population_distribution
      type  = "pie"
      width = 4
    }

    chart {
      title = "Top 10 Largest Planets"
      query = query.top_10_largest_planets
      type  = "column"
      series "diameter" {
        title = "Diameter in km"
        color = "darkred"
      }
      axes {
        y {
          title {
            value = "Diameter in km"
          }
        }
      }
      width = 4
    }

    chart {
      title = "Planets Climate Distribution"
      query = query.planet_climate_distribution
      type  = "donut"
      width = 4
    }
  }
  container {

    title = "Starships Analysis"

    chart {
      title = "Starship Cost in Credits Distribution"
      query = query.starship_cost_distribution
      type  = "donut"
      width = 4
    }

    chart {
      title = "Starship Manufacturer Distribution"
      query = query.starship_manufacturer_distribution
      type  = "column"
      width = 4
      series "Number of Starships" {
        title = "Number of Starships"
        color = "darkorange"
      }
      axes {
        y {
          title {
            value = "Number of Starships"
          }
        }
      }
    }

    chart {
      title = "Starship Passenger Distribution"
      query = query.starship_passenger_distribution
      type  = "pie"
      width = 4
    }
  }

  container {

    title = "Species Analysis"

    chart {
      title = "Top 10 Species with Highest Average Height"
      query = query.average_height_of_species
      type  = "column"
      width = 4
      series "average_height" {
        title = "Average Height"
        color = "purple"
      }
      axes {
        y {
          title {
            value = "Average Height in cm"
          }
        }
      }
    }

    chart {
      title = "Species Classification Distribution"
      query = query.species_classification_distribution
      type  = "column"
      width = 4
      series "Number of Species" {
        title = "Number of Species"
        color = "darkgreen"
      }
      axes {
        y {
          title {
            value = "Number of Species"
          }
        }
      }
    }

    chart {
      title = "Top 10 Species with Highest Average Lifespan"
      query = query.species_lifespan_distribution
      type  = "column"
      width = 4
      series "average_lifespan" {
        title = "Average Lifespan in years"
        color = "darkblue"
      }
      axes {
        y {
          title {
            value = "Average Lifespan"
          }
        }
      }
    }
  }

  container {

    title = "Vehicles Insights"

    chart {
      title = "Top 10 Fastest Vehicles(Atmosphering Speed)"
      query = query.fastest_vehicles
      type  = "column"
      width = 6
      series "max_atmosphering_speed" {
        title = "Max Atmosphering Speed"
        color = "#F1B9F6"
      }
      axes {
        y {
          title {
            value = "Max Atmosphering Speed"
          }
        }
      }
    }

    chart {
      title = "Top 10 Vehicle with Highest Cargo Capacity"
      query = query.vehicle_cargo_capacity_comparison
      type  = "column"
      width = 6
      series "cargo_capacity" {
        title = "Cargo Capacity"
        color = "#09AC9A"
      }
    }
  }

}

# Card Queries

query "total_starships" {
  sql = <<-EOQ
    select
      count(*) as "Total Starships"
    from
      starships;
  EOQ
}

query "total_planets" {
  sql = <<-EOQ
    select
      count(*) as "Total Planets"
    from
      planets;
  EOQ
}

query "total_species" {
  sql = <<-EOQ
    select
      count(*) as "Total Species"
    from
      species;
  EOQ
}

query "total_characters" {
  sql = <<-EOQ
    select
      count(*) as "Total Characters"
    from
      characters;
  EOQ
}

# Chart Queries

query "top_10_largest_planets" {
  sql = <<-EOQ
    select
      name,
      cast(diameter as integer) as diameter
    from
      planets
    where
      diameter not in ('N/A', 'NA')
    order by
      diameter desc
    limit 10;
  EOQ
}

query "planet_population_distribution" {
  sql = <<-EOQ
    select
      cast(population as long) as population,
      name
    from
      planets
    where
      population not in ('N/A', 'NA')
    order by
      population desc;
  EOQ
}

query "planet_climate_distribution" {
  sql = <<-EOQ
    select
      climate,
      count(*) as "Number of Planets"
    from
      planets
    group by
      climate;
  EOQ
}

query "starship_manufacturer_distribution" {
  sql = <<-EOQ
    select
      manufacturer,
      count(*) as "Number of Starships"
    from
      starships
    group by
      manufacturer;
  EOQ
}

query "starship_cost_distribution" {
  sql = <<-EOQ
    select
      name as "Starships",
      cast(cost_in_credits as long) as cost_in_credits
    from
      starships
    where 
      cost_in_credits not in ('N/A', 'NA')
    order by
      cost_in_credits desc;
  EOQ
}

query "starship_passenger_distribution" {
  sql = <<-EOQ
    select
      passengers,
      name as "Starships"
    from
      starships
    where
      passengers not in ('N/A', 'NA');
  EOQ
}

query "average_height_of_species" {
  sql = <<-EOQ
    select
      name,
      cast(average_height as integer) as average_height
    from
      species
    where
      average_height not in ('N/A', 'NA')
    order by
      average_height desc
    limit 10;
  EOQ
}

query "species_classification_distribution" {
  sql = <<-EOQ
    select
      classification,
      count(*) as "Number of Species"
    from
      species
    where
      classification not in ('N/A', 'NA')
    group by
      classification
    order by
      count(*) desc;
  EOQ
}

query "species_lifespan_distribution" {
  sql = <<-EOQ
    select
      name,
      cast(average_lifespan as integer) as average_lifespan
    from
      species
    where 
      average_lifespan not in ('N/A', 'NA', 'indefinite')
    order by
      average_lifespan desc
    limit 10;
  EOQ
}

query "fastest_vehicles" {
  sql = <<-EOQ
    select
      name,
      cast(max_atmosphering_speed as integer) as max_atmosphering_speed
    from
      vehicles
    where 
      max_atmosphering_speed not in ('N/A', 'NA')
    order by
      max_atmosphering_speed desc
    limit 10;
  EOQ
}

query "vehicle_cargo_capacity_comparison" {
  sql = <<-EOQ
    select
      name,
      cast(cargo_capacity as integer) as cargo_capacity
    from
      vehicles
    where 
      cargo_capacity not in ('N/A', 'NA', 'none')
    order by
      cargo_capacity desc
    limit 10;
  EOQ
}

