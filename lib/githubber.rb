require "httparty"
require "pry"

require "githubber/version"
require "githubber/issues"

module Githubber
  puts "Enter your secret key"
  key = gets.chomp

  issue_api = Issues.new(key)
  binding.pry

  issue_api.close_issue("TIY-ATL-ROR-2015-Sep",
                        "assignments",
                        201)

  issue_api.comment_issue("TIY-ATL-ROR-2015-Sep",
                          "assignments",
                          201,
                          {body: "pull request: https://github.com/violetaria/githubber/pull/2"})end
end