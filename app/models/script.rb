require 'httparty'

threads = []

threads << Thread.new do
  2.times do |id|
    body =
      {
        "like": {
          "user_id": id,
          "post_id": 1
        }
      }

    HTTParty.post('http://localhost:3000/likes', body: body.to_json,
                                                 headers: { 'Content-Type' => 'application/json' }).parsed_response
  end
end

threads << Thread.new do
  2.times do |id|
    body =
      {
        "like": {
          "user_id": id,
          "post_id": 1
        }
      }

    HTTParty.post('http://localhost:3000/likes', body: body.to_json,
                                                 headers: { 'Content-Type' => 'application/json' }).parsed_response
  end
end

threads.each(&:join)
sleep 320
