module LinksHelper
  def is_owner?(user_id)
    @link = Link.find(params[:id])
    @link.user_id == current_user.id
  end

end
