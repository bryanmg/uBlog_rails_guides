class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end

  def show 
    @publication = Publication.find params[:id]
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(title: "...", body: "...")

    if @publication.save
      redirect_to @publication
    else
      render :new
    end
  end
end
