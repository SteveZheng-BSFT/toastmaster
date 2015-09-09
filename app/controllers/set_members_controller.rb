class SetMembersController < ApplicationController
  def edit
    user = User.find(params[:id])
    if user
      if user.admin == 0
        user.admin_set(-1) #member is -1 in admin DB
      elsif user.admin == -1
        user.admin_set(0) #visitor is 0 in admin DB
      end

      flash[:success] = 'membership changed!'
      redirect_to users_url
    end
  end
end
