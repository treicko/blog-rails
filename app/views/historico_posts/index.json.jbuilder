json.array!(@historico_posts) do |historico_post|
  json.extract! historico_post, :id, :id_post, :title, :text
  json.url historico_post_url(historico_post, format: :json)
end
