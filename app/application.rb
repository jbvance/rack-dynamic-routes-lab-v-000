
class Application

  @@items = []

    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item = req.path.split("/items/").last
      f_item = found_item(item, resp)
      if f_item
        resp.write "Price for #{f_item.name} is #{f_item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def found_item(item, resp)
    @@items.each do |i|
      resp.write resp.write "item = #{item} and i.name = #{i.name}\n"
      if item == i.name
        i
      end
    end
    return nil
  end

end
