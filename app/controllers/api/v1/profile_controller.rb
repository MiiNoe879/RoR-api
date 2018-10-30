module Api
  module V1
    class ProfileController < ApplicationController
      include Secured

      def index
        tenant = Tenant.find(@tenant)
        user_service = UserService.new(@token, tenant)
        employee = user_service.employee

        if employee.present?
          render json: { data: employee.profile }, status: :ok
        else
          render json: { message: "Profile not found" }, status: :not_found
        end
      end

      def update
        tenant = Tenant.find(@tenant)
        user_service = UserService.new(@token, tenant)
        employee = user_service.employee

        if employee.present?
          employee.update_attributes!(employee_params)
          render json: { data: employee.profile }, status: :ok
        else
          render json: { message: "Profile not found" }, status: :not_found
        end
      end

      def employee_params
        params.permit(:share_depository_account)
      end
    end
  end
end