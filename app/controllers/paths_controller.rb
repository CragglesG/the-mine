class PathsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_path, only: %i[ show edit update destroy ]

  def index
    @paths = Path.all
  end

  def show
  end

  def new
    @path = Path.new
  end

  def create
    @path = Path.new(path_params)
    if @path.save
      redirect_to @path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @path.update(path_params)
      redirect_to @path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @path.destroy
    redirect_to paths_path
  end

  private
    def set_path
      @path = Path.find(params[:id])
    end

    def path_params
      params.expect(path: [ :name, :description ])
    end
end
