module Roadmap
  def get_roadmap(roadmap_id)
    response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_messages(page = 0)
    if page > 0
      request_url = "/message_threads?page=#{page}"
    else
      request_url = "/message_threads"
    end
    response = self.class.get(request_url, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def create_message(user_id, recipient_id, subject, body)
    self.class.post("/messages", body: { user_id: user_id, recipient_id: recipient_id, subject: subject, stripped: body })
  end
end
