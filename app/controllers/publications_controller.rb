class PublicationsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to @publication
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])

    if @publication.update(publication_params)
      redirect_to @publication
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    redirect_to root_path
  end

  private
    def publication_params
      params.require(:publication).permit(:title, :body, :status)
    end
end
