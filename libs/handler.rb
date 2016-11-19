require 'ritm'

Ritm.on_request do |req|
  if req.request_uri.host.start_with? 'ui-dev.horizon'
    puts '#'*10
    puts 'this is HORIZZZON'
  end

  puts req.request_uri

  if req.request_uri.host.include?('addresses?')
    puts "THIS IS ADDRESSES!!!"
    req.request_uri.host = 'http://korrespondent.net'
  end

end

my_picture = File.read('this_is_me.jpg')

Ritm.on_response do |_req, res|

  # content_type = res.header['content-type']
  # puts res.header
  # puts content_type
  # if content_type && content_type.include?('image')
  #   res.header['content-type'] = 'image/jpeg'
  #   res.body = my_picture
  # end

  # if _req.request_uri.include?('images')
  #   puts "YES!"
  #   res.header['content-type'] = 'image/jpeg'
  #   res.body = my_picture
  # end

  # if _req.header['Accept'].include?('images')
  #   puts "YES, IMAGE!!!"
  #   res.header['content-type'] = 'image/jpeg'
  #   res.body = my_picture
  # end

end

#A single answer for all your google searches
# Ritm.on_request do |req|
#   # if req.request_uri.host.start_with? 'www.google.'
#   #   puts '#'*10
#   #   puts req.request_uri
#   #   req.request_uri = 'http://www.pb.com'
#   # end
#
#   puts req.request_uri
#
#   if req.request_uri.host.include?('addresses?')
#     puts "THIS IS ADDRESSES!!!"
#     req.request_uri.host = 'http://korrespondent.net'
#   end
#
# end
#
# my_picture = File.read('this_is_me.jpg')
#
# # Replaces every picture on the web with my pretty face
# Ritm.on_response do |_req, res|
#
#   # content_type = res.header['content-type']
#   # puts res.header
#   # puts content_type
#   # if content_type && content_type.include?('image')
#   #   res.header['content-type'] = 'image/jpeg'
#   #   res.body = my_picture
#   # end
#
#   # if _req.request_uri.include?('images')
#   #   puts "YES!"
#   #   res.header['content-type'] = 'image/jpeg'
#   #   res.body = my_picture
#   # end
#
#   # if _req.header['Accept'].include?('images')
#   #   puts "YES, IMAGE!!!"
#   #   res.header['content-type'] = 'image/jpeg'
#   #   res.body = my_picture
#   # end
#
# end