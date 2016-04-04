module BitBucket
  class Repos::DefaultReviewers < API

    # List default reviewers
    #
    # = Examples
    #  bitbucket = BitBucket.new
    #  bitbucket.repos.default_reviewers.list 'user-name', 'repo-name'
    #  bitbucket.repos.default_reviewers.list 'user-name', 'repo-name' { |reviewer| ... }
    #
    def list(user_name, repo_name, params={})
      _update_user_repo_params(user_name, repo_name)
      _validate_user_repo_params(user, repo) unless user? && repo?
      normalize! params

      response = get_request("/2.0/repositories/#{user_name}/#{repo_name}/default-reviewers", params)
      return response unless block_given?
      response.each { |el| yield el }
    end
    alias :all :list

  end
end
