class BoardsController < ApplicationController
  before_action :set_board, only: [:new, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all

  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @boards = Board.all
    # @posts = Post.where("board_id = ?", set_board).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)

    if params[:search]
      @posts = Post.where("board_id = ?", set_board).search(params[:search]).paginate(:page => params[:page], :per_page => 15)
    else
      @posts = Post.where("board_id = ?", set_board).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    end
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :user_id, posts_attributes: [:board_id, :title, :content, :user_id])
    end
    def require_permission
      @board = Board.find(params[:id])
      if current_user.id != @board.user_id
        redirect_to root_path, notice: "Sorry, you're not allowed"
      end

    end
end
