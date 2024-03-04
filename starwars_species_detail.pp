dashboard "starwars_species_detail" {

  title = "StarWars Species Detail"
  documentation = file("./docs/starwars_species_detail.md")

  input "species_name" {
    title = "Select a Species:"
    query = query.starwars_species_input
    width = 4
  }

  container {

    card {
      query = query.starwars_species_classification
      width = 3
      type  = "info"
      args  = [self.input.species_name.value]
    }

    card {
      query = query.starwars_average_species_height
      width = 3
      type  = "info"
      args  = [self.input.species_name.value]
    }

    card {
      query = query.starwars_species_most_common_skin_color
      width = 3
      type  = "info"
      args  = [self.input.species_name.value]
    }

    card {
      query = query.starwars_species_average_lifespan
      width = 3
      type  = "info"
      args  = [self.input.species_name.value]
    }

  }

  container {

    container {
      width = 12
      table {
        title = "Species Overview"
        width = 6
        type  = "line"
        query = query.starwars_species_overview
        args  = [self.input.species_name.value]
      }

      table {
        title = "Homeworld Details Overview"
        width = 6
        type  = "line"
        query = query.starwars_species_homeworld_details_overview
        args  = [self.input.species_name.value]
      }
    }

    container {
      width = 12

      table {
        title = "Characters from this Species"
        width = 12
        query = query.starwars_species_characters_overview
        args  = [self.input.species_name.value]
      }
    }
  }

}

# Input query

query "starwars_species_input" {
  sql = <<-EOQ
    select
      name as label,
      name as value
    from
      species
    order by
      name;
  EOQ
}

# Card queries

query "starwars_species_classification" {
  sql = <<-EOQ
    select
      'Classification' as label,
      classification as value
    from
      species
    where
      name = $1;
  EOQ
}

query "starwars_average_species_height" {
  sql = <<-EOQ
    select
      'Average Height in cm' as label,
      avg(cast(nullif(average_height, 'NA') as float)) as value
    from
      species
    where
      name = $1;
  EOQ
}

query "starwars_species_most_common_skin_color" {
  sql = <<-EOQ
    select
      'Most Common Skin Color' as label,
      skin_colors as value
    from
      species
    where
      name = $1;
  EOQ
}

query "starwars_species_average_lifespan" {
  sql = <<-EOQ
    select
      'Average Lifespan in years' as label,
      avg(case
          when average_lifespan not in ('NA', 'indefinite') then cast(average_lifespan as float)
          else null
      end) as value
    from
      species
    where
      name = $1;
  EOQ
}

# Other detail page queries

query "starwars_species_overview" {
  sql = <<-EOQ
    select
      name as 'Species Name',
      designation as 'Designation',
      skin_colors as 'Skin Colors',
      hair_colors as 'Hair Colors',
      eye_colors as 'Eye Colors',
      homeworld as 'Homeworld',
      language as 'Language'
    from
      species
    where
      name = $1;
  EOQ
}

query "starwars_species_homeworld_details_overview" {
  sql = <<-EOQ
    select
      name as 'Homeworld Name',
      rotation_period as 'Rotation Period in Hours',
      orbital_period as 'Orbital Period in Days',
      diameter as 'Diameter in km',
      climate as 'Climate',
      gravity as 'Gravity',
      terrain as 'Terrain',
      surface_water as 'Surface Water',
      population as 'Population'
    from
      planets
    where
      name = (select homeworld from species where name = $1);
  EOQ
}

query "starwars_species_characters_overview" {
  sql = <<-EOQ
    select
      name as 'Character Name',
      height as 'Height in cm',
      mass as 'Mass in kg',
      hair_color as 'Hair Colors',
      eye_color as 'Eye Colors',
      birth_year as 'Birth Year',
      skin_color as 'Skin Colors',
      gender as 'Gender',
      homeworld as 'Homeworld'
    from
      characters
    where
      species = $1;
  EOQ
}
