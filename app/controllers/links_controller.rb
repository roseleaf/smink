class LinksController < ApplicationController
  
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    short_extension = (0...8).map{65.+(rand(25)).chr}.join
    @link.short_url = "localhost:3000/" + short_extension
 
		if @link.long_url.match(/(^http:\/\/)|(^https:\/\/)/)  # contains http:// or https:// in the beginning
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
    @link.find(params[:id])
    @link.destroy
  end

  def go_to_link
    #select only the characters after the first "/"
    @link = Link.find(params[:short_url])
    redirect_to @link.long_url
  end

  def index
    @links = Links.where("(user_id = ? ) user.id")
  end

  # def is_owner?(user_id)
  #   user_id == current_user.id
  # end
end
