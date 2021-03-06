class AdminPluginSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :version,
             :url,
             :admin_route

  def id
    object.metadata.name
  end

  def name
    object.metadata.name
  end

  def version
    object.metadata.version
  end

  def url
    object.metadata.url
  end

  def include_url?
    url.present?
  end

  def admin_route
    route = object.admin_route
    return unless route

    ret = route.slice(:location, :label)
    ret[:full_location] = "adminPlugins.#{ret[:location]}"
    ret
  end

  def include_admin_route?
    admin_route.present?
  end
end
