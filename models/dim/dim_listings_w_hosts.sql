with
    listings as (select * from {{ ref("dim_listings_cleansed") }}),
    hosts as (select * from {{ ref("dim_hosts_cleansed") }})
select
    listings.listing_id,
    listings.listing_name,
    listings.room_type,
    listings.minimum_nights,
    listings.price,
    listings.host_id,
    listings.created_at,
    hosts.host_name,
    greatest(listings.updated_at, hosts.updated_at) updated_at,
    hosts.is_superhost host_is_superhost
from listings
left join hosts on (hosts.host_id = listings.host_id)
