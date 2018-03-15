json.extract! activity, :id,
:title, :description, :polyline, :athlete_id,
:distance, :est_moving_time, :elevation, :type_of
json.owner activity.user
json.date activity.created
json.owner_img activity.user.avatar.url
json.likers activity.liker_ids
json.comments activity.comments.each do |c|
  json.author_name c.author.username
  json.author_photo image_path(c.author.avatar.url(:medium))
  json.comment c
  json.created c.creation_in_words
end

# json.comments activity.comments
