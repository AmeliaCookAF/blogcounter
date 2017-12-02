json.extract! blogcount, :id, :title, :wordcount, :paragraphs, :created_at, :updated_at
json.url blogcount_url(blogcount, format: :json)
