class ApplicationController < ActionController::API
  include Response
  include RequestExceptionHandler

  before_action :find_resource, only: %i[show destroy update]

  private

  def resource
    @resource
  end

  def resources_scope
    @resources_scope ||= resource_chain.all
  end

  def find_resource
    @resource = resource_chain.find(params[:id]) if params[:id]
  end

  def build_resource_for_create
    @resource = Todo.new(permitted_params)
  end
end
