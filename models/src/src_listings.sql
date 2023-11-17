with raw_listings as (
    select *
    from airbnb.raw.raw_listings
)
select id listing_id,
    name listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price price_str,
    created_at,
    updated_at
from raw_listings