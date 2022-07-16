class FrameworksController < ApplicationController

  before_action :set_framework, only: %i[ show edit update destroy ]

  def index
    @frameworks = Framework.all.order(created_at: :desc)
    @framework = Framework.new
  end

  def show
    @criterium = Criterium.new
  end

  def new
    @framework = Framework.new
  end

  def edit
  end

  def create
    @framework = Framework.new(framework_params)

    respond_to do |format|
      if @framework.save
        FrameworkMailer.framework_creation(@framework).deliver_later
        format.turbo_stream {
          redirect_to frameworks_path(@framework)
        }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "frameworks_form", 
          partial: "frameworks/form", 
          locals: { framework: @framework, title: "Create framework" }) 
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @framework.update(framework_params)
        FrameworkMailer.framework_update(@framework).deliver_later
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "framework_show", 
          partial: "frameworks/framework_show", 
          locals: { framework: @framework }) 
          }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "frameworks_form", 
          partial: "frameworks/form", 
          locals: { framework: @framework, title: "Update framework" }) 
        }
      end
    end
  end

  def destroy
    respond_to do |format|
      @framework.destroy
      format.turbo_stream { redirect_to frameworks_path }
    end
  end

  private
    def set_framework
      @framework = Framework.find(params[:id])
    end

    def framework_params
      params.require(:framework).permit(:name, :description)
    end
end
