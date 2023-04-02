class UsersController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    users = ::User.all
    render(json: users)
  end

  def create
    users = ::User.create!(create_request)

    render(root: :user, json: users)
  end

  private

  def create_request
    params.permit(
      :name,
      :email
    )
  end
end
