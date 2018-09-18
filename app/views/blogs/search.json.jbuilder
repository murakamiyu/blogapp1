json.array! @blogs do |blog|
  json.id blog.id
  json.name blog.name
  json.image blog.image
end