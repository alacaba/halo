class Response
  attr_accessor :result

  def self.result(response)
    response.body == '' ?
      response.to_hash['location'][0] :
      JSON.parse(response.body)
  end
end
