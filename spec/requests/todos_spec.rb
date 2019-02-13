require 'rails_helper'

RSpec.describe "Todo API" do
  describe "/todos" do
    it "/todos returns a set of todos" do
      _todo = create(:todo)

      get "/todos"

      expect(json_response_body).not_to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe "/todo/:id" do
    it "returns a todo record" do
      todo = create(:todo)

      get todo_path(todo)

      expect(json_response_body).not_to be_empty
    end

    it "responses 404 when record not found" do
      get todo_path(:non_exist)

      expect(response).to have_http_status(404)
    end
  end

  describe "POST" do
    it "creates a todo" do
      post(
        todos_path,
        params: { title: "my first thing todo", owner: Faker::Number.number(10) }
      )

      expect(response).to have_http_status(201)
    end

    it "response 422 when validation error" do
      post(
        todos_path,
        params: { title: "todo title" }
      )

      expect(response).to have_http_status(422)
    end
  end

  describe "PUT" do
    it "updates a todo" do
      todo = create(:todo)

      put(
        todo_path(todo),
        params: { title: "edited title" }
      )

      expect(response).to have_http_status(204)
    end
  end

  describe "DELETE" do
    it "delete a todo" do
      todo = create(:todo)

      delete(todo_path(todo))

      expect(Todo.all).to be_empty
      expect(response).to have_http_status(204)
    end
  end
end
