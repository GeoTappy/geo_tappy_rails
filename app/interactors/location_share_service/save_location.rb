class LocationShareService
  class SaveLocation < BaseInteractor
    def call
      location.save
    end

    def rollback
      location.destroy
    end
  end
end
