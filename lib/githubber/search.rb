module Githubber
 class Search
  include HTTParty
  base_uri "https://api.github.com"

  def initialize(auth_token)
    @header= {
        "Authorization" => "token #{auth_token}",
        "User-Agent" => "HTTParty",
        "Accept"    => "application/vnd.github.ironman-preview+json"
    }
  end
  def get_teams(org)
   self.class.get("/orgs/#{org}/teams",
                    :headers => @header)
  end

   def get_members(id, options={})
     self.class.get("/teams/#{id}/members",
                    :headers => @header,
                    :query => options)
   end
   def get_gist(id)
     data= self.class.get("/gists/#{id}",
                    :headers  => @auth)
     data["files"].values[0]["content"]
   end
 end
end


