class CriteriaController < ApplicationController

  before_action :set_framework, only: %i[ edit create update destroy ]
  before_action :set_criterium, only: %i[ show update destroy ]

  def edit
    @criterium = @framework.criteria.find(params[:id])
  end

  def create
    @criterium = @framework.criteria.build(criterium_params)

    respond_to do |format|
      if @criterium.save
        format.turbo_stream { render turbo_stream: turbo_stream.append(
          "criteria", 
          partial: "criteria/criterium", 
          locals: { criterium: @criterium }) 
        }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "criteria_form", 
          partial: "criteria/form", 
          locals: { 
            criterium: @criterium, 
            framework: @criterium.framework, 
            title: "New Criterion.",
            id: "criteria_form"
          }) 
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @criterium.update(criterium_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          @criterium, 
          partial: "criteria/criterium", 
          locals: { criterium: @criterium }) 
        }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          @criterium, 
          partial: "criteria/form", 
          locals: { 
            criterium: @criterium, 
            framework: @criterium.framework, 
            title: "Edit Criterion.",
            id: "criterium_#{@criterium.id}"
          }) 
        }
      end
    end
  end

  def destroy
    @criterium.destroy

    respond_to do |format|
      format.html { redirect_to criteria_url, notice: "Criterium was successfully destroyed." }
    end
  end

  private
    def set_criterium
      @criterium = Criterium.find(params[:id])
    end

    def criterium_params
      params.require(:criterium).permit(:text, :answer_type)
    end

    def set_framework
      @framework = Framework.find(params[:framework_id])
    end
end
