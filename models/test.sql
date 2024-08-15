{{ config(materialized='table') }}

with source_data as (

    select 24 as id, 25 as dog, 26 as cat
    union all

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

where id is not null
