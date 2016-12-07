class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?




  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :fullname, :email, :password, :password_confirmation, :remember_me, :country, :city, :school, :major, :schoolemail, :admin, :state, :status) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :username, :fullname, :description, :password, :current_password, :avatar, :country, :city, :school, :major, :school_description, :occupation, :company_name, :sharecontact, :occupation_details, :access, :kakao, :state,:schoolemail, :status, :contact, :institute, :admin, :languages_attributes => [:id, :_destroy, :language], :specialties_attributes => [:id, :specialty, :_destroy], :scholarships_attributes => [:id, :name, :amount, :_destroy], :educations_attributes => [:id, :education, :_destroy], :works_attributes => [:id, :work, :_destroy], :revisers_attributes => [:id, :active]) }
  end
end
