class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET /activities
  def index
    render json: Activity.all
  end

  # DELETE /activities/:id
  def destroy
    activity = find_activity
    activity.destroy
    head :no_content
  end

  private

  def find_activity
    Activity.find(params[:id])
  end

  def render_not_found
    render json: { error: "Activity not found" }, status: :not_found
  end
end
