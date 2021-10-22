require 'httparty'

threads = Array.new(500) do |id|
  Thread.new do
    body =
      {
        "like": {
          "user_id": id,
          "post_id": 1
        }
      }

    HTTParty.post('http://localhost:3000/likes',
                  body: body.to_json,
                  headers: { 'Content-Type' => 'application/json' }).parsed_response
  end
end

threads.each(&:join)
