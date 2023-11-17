with raw_listings as (select * from airbnb.raw.raw_listings)
select
    id listing_id,
    name listing_name,
    listing_url,
    room_type,
    price price_str,
    minimum_nights,
    created_at,
    host_id,
    updated_at
from raw_listings
