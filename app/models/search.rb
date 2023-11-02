class Search
  
  def initialize(query, options = {})
    @query = query
    @category_id = options[:category_id]
    @manufacturer_id = options[:manufacturer_id]
  end

  def results
    devices = Device.where("name LIKE '%#{@query}%'")

    if @category_id.present?
      devices = devices.where(:category_id => @category_id)
    end

    if @manufacturer_id.present?
      devices = devices.where(:manufacturer_id => @manufacturer_id)
    end

    devices
  end
end
