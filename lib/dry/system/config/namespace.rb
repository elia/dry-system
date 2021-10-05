# frozen_string_literal: true

require "dry/core/equalizer"

module Dry
  module System
    module Config
      class Namespace
        ROOT_PATH = nil

        include Dry::Equalizer(:path, :key_namespace, :const_namespace)

        attr_reader :path

        attr_reader :key_namespace

        attr_reader :const_namespace

        def self.default_root
          new(
            path: ROOT_PATH,
            key_namespace: nil,
            const_namespace: nil
          )
        end

        def initialize(path:, key_namespace:, const_namespace:)
          @path = path
          @key_namespace = key_namespace
          @const_namespace = const_namespace
        end

        def root?
          path == ROOT_PATH
        end

        def path?
          !root?
        end

        def default_key_namespace?
          key_namespace == path
        end
      end
    end
  end
end
