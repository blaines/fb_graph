module FbGraph
  module Connections
    module Declined
      def declined(options = {})
        members = self.connection(:declined, options)
        members.map! do |member|
          User.new(member.delete(:id), member.merge(
            :access_token => options[:access_token] || self.access_token
          ))
        end
      end

      def declined!(options = {})
        post(options.merge(:connection => :declined))
      end
    end
  end
end