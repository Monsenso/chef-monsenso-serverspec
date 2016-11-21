module Serverspec
    module Type

        class CouchbaseDocument < Base

            def initialize(key, config)
                require 'couchbase'
                v, _, _ = couchbase_connection(config)
                    .get(key, quiet: true, extended: true, format: :plain)

                @content = JSONCompat.from_json v if v.is_a? String
            end

            def content
                @content
            end

            def exists?
                !@content.nil?
            end

            def couchbase_connection(config)
                Couchbase.connect(hostname: config.hostname || 'localhost',
                                  port: config.part || 8091,
                                  bucket: config.bucket,
                                  password: config.bucket_password)
            end

        end

        def couchbase_document(document_key, config = nil)
            if config.nil?
                config = RSpec.configuration.couchbase
                raise 'Couchbase configuration not found' unless config
            end
            MultiFile.new(document_key, config)
        end
    end
end

include Serverspec::Type
