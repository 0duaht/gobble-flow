module Gobble
  module Shortener
    module Test
      shared_context "shared stuff" do
        let(:urls) do
          [
            "https://docs.google.com/document/d/1V1YFusbUsG8rBd"\
            "-XcS9gc31xI45s4DMQIrheMIeRqb8/edit",
            "http://static.springsource.com/projects/tc-server/6.0/"\
            "getstart/rgsindexhtml.html",
          ]
        end
        let(:name) { "testmaster" }
        let(:email) { "testmaster@test.com" }
        let(:password) { "testmaster" }
        let(:max) { 40 }

        before(:all) do
          DatabaseCleaner.strategy = :truncation
        end

        after(:all) do
          DatabaseCleaner.clean
        end
      end
    end
  end
end
