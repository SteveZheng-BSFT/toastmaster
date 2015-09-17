class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost posted!'
      redirect_to root_url
    else
      @feed_items = Micropost.paginate(page: params[:page])
      render 'static_pages/home' #just re-render this page without through controller, so have to provide feed_items here
      #if use redirect_to, then no errors report
      #now problem is: paginate make link to micropost controller, not static_pages, but there's no microposts get path TODO
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referrer || root_url #referrer is the previous link, because here micropost shows in both home page and profile page
    #root_url just for test, referrer may nil in tests
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
