class LinksController < ApplicationController
  
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    short_extension = (0...8).map{65.+(rand(25)).chr}.join
    @link.short_url = "localhost:3000/" + short_extension
    @link.long_url = "http://" + @link.long_url 

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


  # def generate_short_path(long_url)
  #  @link.short_url = (0...8).map{65.+(rand(25)).chr}.join
        #append short_url to root_path
  # end

  def go_to_link
    #select only the characters after the first "/"
    @link = Link.find(params[:short_url])
    redirect_to @link.long_url
  end


end
