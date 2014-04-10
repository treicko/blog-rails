class HistoricoPostsController < ApplicationController
  before_action :set_historico_post, only: [:show, :edit, :update, :destroy]

  # GET /historico_posts
  # GET /historico_posts.json
  def index
    @historico_posts = HistoricoPost.all
  end

  # GET /historico_posts/1
  # GET /historico_posts/1.json
  def show
  end

  # GET /historico_posts/new
  def new
    @historico_post = HistoricoPost.new
  end

  # GET /historico_posts/1/edit
  def edit
  end

  # POST /historico_posts
  # POST /historico_posts.json
  def create
    @historico_post = HistoricoPost.new(historico_post_params)

    respond_to do |format|
      if @historico_post.save
        format.html { redirect_to @historico_post, notice: 'Historico post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @historico_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @historico_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historico_posts/1
  # PATCH/PUT /historico_posts/1.json
  def update
    respond_to do |format|
      if @historico_post.update(historico_post_params)
        format.html { redirect_to @historico_post, notice: 'Historico post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historico_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_posts/1
  # DELETE /historico_posts/1.json
  def destroy
    @historico_post.destroy
    respond_to do |format|
      format.html { redirect_to historico_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_post
      @historico_post = HistoricoPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historico_post_params
      params.require(:historico_post).permit(:id_post, :title, :text)
    end
end
