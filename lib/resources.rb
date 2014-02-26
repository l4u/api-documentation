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
        bio: "Co-founder and designer of Dribbble. Principal of SimpleBits. Aspiring clawhammer banjoist.",
        location: "Salem, MA",
        website: "http://simplebits.com",
        hireable: false,
        screenshots: 214,
        followers: 29262,
        following: 1728,
        avatar_url: "//d13yacurqjgara.cloudfront.net/users/1/avatars/normal/dc.jpg?1371675643",
        type: "User",
        created_at: "2009-07-08T02:51:22Z",
        updated_at: "2014-02-22T17:10:33Z"
      }

      TEAM = {
        id: 39,
        name: "Dribbble",
        username: "dribbble",
        bio: "Show and tell for designers. This is Dribbble on Dribbble.",
        location: "Salem, MA",
        website: "http://dribbble.com",
        hireable: false,
        screenshots: 91,
        followers: 25011,
        following: 6120,
        avatar_url: "//d13yacurqjgara.cloudfront.net/users/39/avatars/normal/apple-flat-precomposed.png?1388523974",
        type: "Team",
        created_at: "2009-08-18T18:34:31Z",
        updated_at: "2014-02-14T22:32:11Z"
      }

      BUCKET = {
        id: 3294,
        name: "Great Type",
        description: "Collecting wonderful type from around the Dribbbleverse.",
        screenshots: 240,
        created_at: "2011-05-21T21:04:30Z",
        updated_at: "2013-10-13T21:48:27Z"
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
