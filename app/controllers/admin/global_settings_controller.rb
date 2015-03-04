class Admin::GlobalSettingsController < ApplicationController
  def index
    @settings = policy_scope(GlobalSetting.all)
    authorize @settings
  end

  def update
    @setting = GlobalSetting.find(params[:id])
    authorize @setting

    @setting.update(setting_params)
    @setting.save
  end

  private

  def setting_params
    params.require(:global_setting).permit(:value)
  end
end
