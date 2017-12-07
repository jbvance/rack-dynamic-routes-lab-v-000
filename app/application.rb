class Application

  @@items = []
  
    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item = req.path.split("/items/").last
    
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def item_price(item)
    @@items.each do |i|
      if item == i.name
        return i.price
      end
    end
    return nil
  end
  
end
