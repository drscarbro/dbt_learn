with raw_reviews as (
    select *
    from raw.raw_reviews
)
select listing_id,
    date review_date,
    reviewer_name,
    comments review_text,
    sentiment review_sentiment
from raw_reviews