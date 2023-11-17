{{ config(materialized="table") }}
with
    fct_reviews as (select * from {{ ref("fct_reviews") }}),
    full_moon_dates as (select * from {{ ref("seed_full_moon_dates") }})
select
    reviews.*,
    case
        when fullmoon.full_moon_date is null then 'not full moon' else 'full moon'
    end is_full_moon
from fct_reviews reviews
left join
    full_moon_dates fullmoon
    on (to_date(reviews.review_date) = dateadd(day, 1, fullmoon.full_moon_date))
