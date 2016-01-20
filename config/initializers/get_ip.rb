class GetIP

  attr_reader :request

  def initialize request
    @request = request
  end

  def remote_ip
    if forwarded = request.env["HTTP_X_FORWARDED_FOR"]
      forwarded.split(",").first
    elsif addr = request.env["REMOTE_ADDR"]
      addr
    end
  end
  
end
