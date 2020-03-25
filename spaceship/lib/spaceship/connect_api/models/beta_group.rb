require_relative '../model'
module Spaceship
  class ConnectAPI
    class BetaGroup
      include Spaceship::ConnectAPI::Model

      attr_accessor :name
      attr_accessor :created_date
      attr_accessor :is_internal_group
      attr_accessor :public_link_enabled
      attr_accessor :public_link_id
      attr_accessor :public_link_limit_enabled
      attr_accessor :public_link_limit
      attr_accessor :public_link

      attr_mapping({
        "name" => "name",
        "createdDate" => "created_date",
        "isInternalGroup" => "is_internal_group",
        "publicLinkEnabled" => "public_link_enabled",
        "publicLinkId" => "public_link_id",
        "publicLinkLimitEnabled" => "public_link_limit_enabled",
        "publicLinkLimit" => "public_link_limit",
        "publicLink" => "public_link"
      })

      def self.type
        return "betaGroups"
      end

      def self.all(filter: {}, includes: nil, limit: nil, sort: nil)
        resps = Spaceship::ConnectAPI.get_beta_groups(filter: filter, includes: includes, limit: limit, sort: sort).all_pages
        return resps.flat_map(&:to_models)
      end

      def self.get(group_id: nil, includes: nil)
        return Spaceship::ConnectAPI.get_beta_group(group_id: group_id, includes: includes).first
      end

      def self.create(app_id: nil, name: nil, build_ids: [])
        return Spaceship::ConnectAPI.post_beta_group(app_id: app_id, name: name, public_link: true, build_ids: build_ids).first
      end

      #
      # API
      #

      def enable_public_link
        return Spaceship::ConnectAPI.enable_public_link(group_id: id).first
      end

      def destroy
        return Spaceship::ConnectAPI.delete_beta_group(group_id: id)
      end

      # beta_testers - [{email: "", firstName: "", lastName: ""}]
      def post_bulk_beta_tester_assignments(beta_testers: nil)
        return Spaceship::ConnectAPI.post_bulk_beta_tester_assignments(beta_group_id: id, beta_testers: beta_testers)
      end
    end
  end
end
