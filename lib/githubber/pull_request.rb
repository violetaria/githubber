module Githubber
 class PullRequest
 	include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
    	@auth= {
    		"Authorization" => "token #{auth_token}",
    		"User-Agent" => "HTTParty"
    	}
    end
    def get_request(owner, repo, number)
    PullRequest.get("/repos/#{owner}/#{repo}/pulls","#{number}"
     :headers => @auth)	
    end  

    def create_request(owner, repo, options= {})
    PullRequest.post("/repos/#{owner}/#{repo}/pulls",
     :headers => @auth, :body => options.to_json)
    end 
    
    def has_merged(owner, repo, number )
    PullRequest.put("/repos/#{owner}/#{repo}/pulls/#{number}/merge",	
     :headers => @auth)
    end
  end
end
