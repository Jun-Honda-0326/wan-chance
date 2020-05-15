json.array! @posts do |post|
  json.id post.id
  json.text post.text
  json.image post.image_url
  json.user_id post.user_id
  json.name post.user.name
  # json.tagname post.tag.tagname
  # json.tag_id post.tag.tag_id
  json.created_at post.created_at.strftime("%Y年%m月%d日 %H時%M分")
end