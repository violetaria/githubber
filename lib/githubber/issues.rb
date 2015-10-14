module Githubber
  class Issues
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
          "Authorization" =>  "token #{auth_token}",
          "User-Agent"    =>  "HTTParty"
      }
    end

    def list_issues_for_repo(owner,repo,options={})
      self.class.get("/repos/#{owner}/#{repo}/issues",
                     :headers => @auth,
                     :body => options.to_json)
    end

    def comment_issue(owner,repo,issue,options={})
      self.class.post("/repos/#{owner}/#{repo}/issues/#{issue}/comments",
                      :headers => @auth,
                      :body => options.to_json)
    end

    def close_issue(owner,repo,issue)
      self.class.patch("/repos/#{owner}/#{repo}/issues/#{issue}",
                      :headers => @auth,
                      :body => {:state => "closed"}.to_json)
    end

    def create_issue(owner,repo,options={})
      self.class.post("/repos/#{owner}/#{repo}/issues",
                      :headers => @auth,
                      :body => options.to_json)
    end
  end
end