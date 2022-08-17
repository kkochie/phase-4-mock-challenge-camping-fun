class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  #POST /signups
  def create
    signup = Signup.create!(signup_params)
    render json: signup.activity, status: :created
  end

  private

  def signup_params
    params.permit(:time, :activity_id, :camper_id)
  end

  def render_unprocessable_entity(exception)
    render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
