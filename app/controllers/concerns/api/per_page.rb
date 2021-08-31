module Api
  module PerPage
    def per_page
      per_page = params[:per_page].presence.to_i
      return per_page if (1..50).cover?(per_page)

      25
    end

    def build_json(object, param_page = {})
      json = {}.merge(ActiveModelSerializers::SerializableResource.new(object.to_a, param_page: param_page).as_json)
      json[:pagination] = {
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page,
        total_pages: object.total_pages,
        total_count: object.total_count
      }
      json
    end
  end
end
