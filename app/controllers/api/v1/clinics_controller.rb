module Api
    module V1
        class ClinicsController < ApplicationController
          def find_ubs_geo
            lat, lng = params[:query].split(/,/)
            @clinics = Clinic.within(2, :units => :kms, :origin => [lat, lng])
            render json: @clinics
          end
        end
    end
end
