class TemplatesController < ApplicationController
  before_action :set_template, only: %i[ show edit update destroy ]

  def index
    @templates = Template.all
  end

  def show
  end

  def new
    @template = Template.new
  end

  def edit
  end

  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.turbo_stream { redirect_to templates_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "modal",
          partial: "templates/form",
          locals: { template: @template, title: "Create template" }
        ) }
      end
    end
  end

  def update
    respond_to do |format|
      if @template.update(template_params)
        format.turbo_stream do
          render turbo_stream: 
            [
              turbo_stream.remove('modal'),
              turbo_stream.replace("#{@template.id}", partial: "templates/template", locals: { template: @template}) 
            ]
        end
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "modal",
          partial: "templates/form",
          locals: { template: @template, title: "Update template" }
        ) }
      end
    end
  end

  def destroy
    @template.destroy

    respond_to do |format|
      format.html { redirect_to templates_path }
    end
  end

  private
    def set_template
      @template = Template.find(params[:id])
    end

    def template_params
      params.require(:template).permit(:name, :description)
    end
end
