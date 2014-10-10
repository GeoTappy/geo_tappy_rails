class TokenAuthentication
  class FetchData
    include Interactor

    def call
      begin
        fetcher = FetchStrategy.from_params(token: context.token, provider: context.provider)
        context.fetcher    = fetcher
        context.account_id = fetcher.account_id
      rescue Koala::KoalaError => e
        context.fail!(error: e.message)
      end
    end
  end
end
