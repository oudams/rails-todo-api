class TodosController < ApplicationController
  def index
    json_response(resources_scope)
  end

  def show
    json_response(resource)
  end

  def create
    @resource = Todo.create!(permitted_params)
    json_response(@resource, :created)
  end

  def update
    resource.update!(permitted_params)

    head :no_content
  end

  def destroy
    resource.destroy

    head :no_content
  end

  private

  def resource_chain
    Todo.all
  end

  def permitted_params
    params.permit(:title, :owner)
  end
end
