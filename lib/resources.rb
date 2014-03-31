require "yajl/json_gem"

module Dribbble
  module Resources
    module Helpers
      STATUSES = {
        200 => "200 OK",
        201 => "201 Created",
        202 => "202 Accepted",
        204 => "204 No Content",
        205 => "205 Reset Content",
        301 => "301 Moved Permanently",
        302 => "302 Found",
        307 => "307 Temporary Redirect",
        304 => "304 Not Modified",
        401 => "401 Unauthorized",
        403 => "403 Forbidden",
        404 => "404 Not Found",
        405 => "405 Method not allowed",
        409 => "409 Conflict",
        422 => "422 Unprocessable Entity",
        500 => "500 Server Error",
        502 => "502 Bad Gateway"
      }

      USER = {
        id: 1,
        name: "Dan Cederholm",
        username: "simplebits",
        html_url: "https://dribbble.com/simplebits",
        bio: "Co-founder and designer of Dribbble. Principal of SimpleBits. Aspiring clawhammer banjoist.",
        location: "Salem, MA",
        website: "http://simplebits.com",
        twitter_username: "simplebits",
        followers: 29262,
        following: 1728,
        likes: 34954,
        shots: 214,
        avatar_url: "//d13yacurqjgara.cloudfront.net/users/1/avatars/normal/dc.jpg?1371675643",
        type: "User",
        created_at: "2009-07-08T02:51:22Z",
        updated_at: "2014-02-22T17:10:33Z"
      }

      TEAM = {
        id: 39,
        name: "Dribbble",
        username: "dribbble",
        html_url: "https://dribbble.com/dribbble",
        bio: "Show and tell for designers. This is Dribbble on Dribbble.",
        location: "Salem, MA",
        website: "http://dribbble.com",
        twitter_username: "dribbble",
        followers: 25011,
        following: 6120,
        likes: 44,
        shots: 91,
        avatar_url: "/assets/dev/avatars/usa_avatar_3.png",
        type: "Team",
        created_at: "2009-08-18T18:34:31Z",
        updated_at: "2014-02-14T22:32:11Z"
      }

      BUCKET = {
        id: 3294,
        name: "Great Type",
        description: "Collecting wonderful type from around the Dribbbleverse.",
        shots: 240,
        created_at: "2011-05-21T21:04:30Z",
        updated_at: "2013-10-13T21:48:27Z"
      }

      SHOT = {
        id: 471756,
        title: "Sasquatch",
        animated: false,
        html_url: "https://dribbble.com/shots/471756-Sasquatch",
        views: 4372,
        likes: 149,
        comments: 27,
        attachments: 0,
        rebounds: 2,
        buckets: 8,
        created_at: "2012-03-15T01:52:33Z",
        updated_at: "2012-03-15T02:12:57Z",
        comments_url: "https://api.dribbble.com/v1/shots/471756/comments",
        rebounds_url: "https://api.dribbble.com/v1/shots/471756/rebounds",
        user: USER
      }

      REBOUND = {
        id: 472178,
        title: "Vector Victor",
        animated: false,
        html_url: "https://dribbble.com/shots/472178-Vector-Victor",
        views: 3555,
        likes: 62,
        comments: 6,
        attachments: 0,
        rebounds: 1,
        buckets: 1,
        created_at: "2012-03-15T12:53:33Z",
        updated_at: "2012-03-15T12:54:27Z",
        comments_url: "https://api.dribbble.com/v1/shots/472178/comments",
        rebounds_url: "https://api.dribbble.com/v1/shots/472178/rebounds",
        rebound_source_url: "https://api.dribbble.com/v1/shots/471756",
        user: USER
      }

      COMMENT = {
        id: 3360155,
        body: "We're working on refining profiles, while paving the way for something we're calling \"Playbook\".",
        likes: 71,
        created_at: "2014-02-14T22:32:11Z",
        user: USER
      }

      LIKE = {
        id: 4,
        created_at: "2009-07-23T10:17:39Z",
        screenshot: SHOT
      }

      def headers(status, headers = {})
        class_name = "headers"
        class_name << " no-response" if [204, 404].include?(status)

        lines = ["Status: #{STATUSES[status]}"]

        headers.each do |key, value|
          lines << "#{key}: #{value}"
        end

        lines << "X-RateLimit-Limit: 5000"     unless headers.has_key?("X-RateLimit-Limit")
        lines << "X-RateLimit-Remaining: 4999" unless headers.has_key?("X-RateLimit-Remaining")

        %(<pre class="#{class_name}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = if key.is_a?(Hash)
                 key.inject({}) do |result, (key, value)|
                   result[key.to_s] = value
                   result
                 end
               elsif key.is_a?(Array)
                 key
               else
                 Resources.const_get(key.to_s.upcase)
               end

        if block_given?
          hash = yield(hash)
        end

        %{<pre><code class="language-javascript">#{JSON.pretty_generate(hash).gsub('":', '" :')}</code></pre>}
      end
    end
  end
end

include Dribbble::Resources::Helpers
