with

source as (

    select * from {{ source('ecom', 'raw_supplies') }}

),

renamed as (

    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(['id', 'sku']) }} as supply_uuid,
        id as supply_id,
        sku as product_id,
        sku as product_id1,
    
        ---------- text
        LOWER(name) as supply_name,
        name as supply_name7,
        name as supply_name2,
        LOWER(name) as upper_name,
        --UPPER(name) as upper_name2,

        ---------- numerics
        {{ cents_to_dollars('cost') }} as supply_cost,

        ---------- booleans
        perishable as is_perishable_supply,

        1 as id

    from source
    where id is not null

)

select * from renamed
