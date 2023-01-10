json.extract! usercommentrating, :id, :rating, :user_id, :comment_id, :created_at, :updated_at
json.url usercommentrating_url(usercommentrating, format: :json)
