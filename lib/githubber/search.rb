module Githubber
 class Search
  include HTTParty
  base_uri "https://api.github.com"

  def initialize(auth_token)
    @auth= {
        "Authorization" => "token #{auth_token}",
        "User-Agent" => "HTTParty"
    }
  end
  def get_teams(org)
   self.class.get("/orgs/#{org}/teams",
                 :headers => @auth)
  end
 end
end


