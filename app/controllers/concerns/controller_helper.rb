module ControllerHelper
  def authorize_user
    return true if current_user.id == @bucketlist.user_id

    render json: { errors: no_access }, status: :forbidden
  end

  def create_resource(resource)
    if resource.save
      render json: resource, status: :created
    else
      render json: { errors: not_created(resource.class.name) },
             status: :bad_request
    end
  end

  def update_resource(resource, params)
    if resource.update(params)
      render json: resource, status: :ok
    else
      render json: { errors: not_updated(resource.class.name) }, \
             status: :bad_request
    end
  end
end
