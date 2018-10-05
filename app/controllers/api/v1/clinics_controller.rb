module Api
    module V1
        class ClinicsController < ApplicationController
          def find_ubs_geo
            lat, lng = params[:query].split(/,/)
            if params[:page]
              @clinics = Clinic
                         .within(2, :units => :kms, :origin => [lat, lng])
                         .paginate(page: params[:page], per_page: params[:per_page]||10)
            else
              @clinics = Clinic
                         .within(2, :units => :kms, :origin => [lat, lng])
            end

            render json: @clinics
          end
        end
    end
end
