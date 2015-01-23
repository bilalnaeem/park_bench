class NumberAPI
  API_END_POINT = 'https://numbersapi.p.mashape.com/%s/%s?fragment=true&json=true&notfound=floor'
  API_KEY = 'ntVAcevJaKmshB9gmiWkMcoAtllnp1hdriNjsnMSLxKwBltzA0'
  # type of numbers
  NUMBER_TYPES = %w{math trivia year}

  def self.get_number_facts(number = 0)
    Rails.cache.fetch("number-api-#{number}", expires_in: 12.hours) do
      facts = []
      # call API multiple times to get more results, API it self only return 1 result against a single call
      4.times do
        NUMBER_TYPES.each do |type|
          response = Unirest.get(API_END_POINT % [number, type], headers:{ "X-Mashape-Key" => API_KEY, "Accept" => "text/plain" })
          facts << response.body['text']
        end
      end
      facts.uniq!
    end
  end

end