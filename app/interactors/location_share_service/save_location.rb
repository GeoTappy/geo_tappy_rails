class LocationShareService
  class SaveLocation
    include Interactor

    def call
      context.location.save
    end

    def rollback
      context.location.destroy
    end
  end
end
