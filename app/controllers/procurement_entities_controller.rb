class ProcurementEntitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_procurement_entity, only: [:edit, :update, :destroy]
  layout "administrator"
  def index
    @procurement_entities = ProcurementEntity.all
  end
  def edit
  end
  def update
    if @procurement_entity.update_attributes(procurement_entity_param)
      flash[:notice] = "Update success"
      redirect_to procurement_entities_path
    else
      flash[:notice] = "unable to update"
      render "edit"
    end
  end
  def new
    @procurement_entity = ProcurementEntity.new
  end
  def create
    @procurement_entity = ProcurementEntity.new(procurement_entity_param)
    if @procurement_entity.save 
      flash[:notice] = "Create successfully"
      redirect_to procurement_entities_path
    else
      flash[:notice] = "Create unsuccess"
      render "new"
    end
  end
  def destroy
    if Announcement.where(procurement_entity_id: @procurement_entity.id).empty?
      # it's related with announcement
      @procurement_entity.destroy
      flash[:notice] = "Delete success"
      redirect_to procurement_entities_path
    else 
      flash[:notice] = "Can't not delete, this using in announcment"
      redirect_to procurement_entities_path
    end
  end

  private
    def set_procurement_entity
      @procurement_entity = ProcurementEntity.find(params[:id])
    end
    def procurement_entity_param
      params.require(:procurement_entity).permit(:name)
    end


end
