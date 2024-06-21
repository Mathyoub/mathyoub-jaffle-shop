{{ config(materialized='table') }}

with source_data as (

    select {{ env_var('DBT_ONE') }} as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

where id is not null
