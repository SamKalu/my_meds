class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]
  layout "dashboard", only: %i[index new edit create delete]

  def index
    @tab = "documents"
    @documents = Document.all
    @documents = policy_scope(Document).order(created_at: :desc)

  end

  def show
    @tab = "documents"
  end

  def new
    @tab = "documents"
    @document = Document.new
    authorize @document
  end

  def create
    @tab = "documents"
    @document = Document.new(document_params)
    authorize @document
    @document.user = current_user
    @document.save
    if @document.save
      redirect_to documents_path
    else
      render :new
    end
  end

  def destroy

    @document.destroy
    redirect_to documents_path
  end

  def edit
    @tab = "documents"
  end

  def update
    if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :description, :photo)
  end

  def set_document
    @document = Document.find(params[:id])
    authorize @document
  end
end
