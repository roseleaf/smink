class LinksController < ApplicationController
  
  def new
    @link = Link.new
  end

  def create
    @DIRTY_WORDS = ["shit","cunt","fuck","piss","damn","bitch"]

    @link = Link.new(params[:link])
    if @link.short_url.length >= 1
      if @DIRTY_WORDS.any? { |word| @link.short_url.include?(word)}
        flash[:notice] = "Clean it up, @$$hole!"
        render 'new'
        return
      else
        @link.short_url = "smink.dev/" + @link.short_url
      end
    
    else
      short_extension = (0...8).map{65.+(rand(25)).chr}.join
      @link.short_url =  @link.short_url + short_extension
    end



		
    if @link.long_url.match(/(^http:\/\/)|(^https:\/\/)/)  
			@link.long_url
		else
			@link.long_url = "http://" + @link.long_url 
		end

    if current_user
      @link.user_id = current_user.id
    end
    if @link.save
      redirect_to @link
    else
      render 'new'
    end   
  end

  def show
    @link = Link.find(params[:id])
  end

  def destroy
    @link.find(params[:link_id])
    @link.destroy
    redirect_to @user
  end

  # def go_to_link
  #   @link = Link.find(params[:short_url])
  #   #@remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
  #   @client_ip = request.remote_ip

  #   logger.info "--------"
  #   logger.info @client
  #   redirect_to @link.long_url
  # end

  def country_from_ip(ip)
    location_data = Geocoder.search(ip)
    country = location_data[0].country
  end

  def index
    @links = Links.where("(user_id = ? ) user.id")
  end


end
