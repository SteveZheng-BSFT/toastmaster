class SetAdminsController < ApplicationController
  def edit
    user = User.find(params[:id])
    if user
      if user.admin != 2
        user.admin_set(2)#office is 2 in admin DB
      else
        user.admin_set(-1)#member is -1 in admin DB
      end

      flash[:success] = 'Role changed!'
      redirect_to users_url
    end
  end
end
