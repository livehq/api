class Api::V1::AggregatesController < Api::V1::BaseController
  def all
    @all = {
        links: Link.all,
    }
  end
end
