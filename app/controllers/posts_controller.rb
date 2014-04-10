class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.sort{ |x,y| y.created_at <=> x.created_at }
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        @ultimo_post = Post.last
        @historico_post = HistoricoPost.new(id_post: @ultimo_post.id, title: @ultimo_post.title, text: @ultimo_post.text)
        @historico_post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def pantalla_principal
    @posts = Post.all.sort{ |x,y| y.created_at <=> x.created_at }
  end

  def aniadir_like
    @post = Post.find(params[:id])
    @post.like = @post.like ? @post.like+1 : 1
    #@post.like += 1 #esto me daria error por que like esta en nill 
    #otra manera: @movie.like = @movie.like? @movie.like+1 : 1 esto aplicara si esta definido le suma, y si no le asigna 1

    @post.save # siempre hay q validar el save.
    #@posts = Post.all
    redirect_to '/posts/pantalla_principal'
  end

  def search_by_text
    #@posts = Post.where("text LIKE ?", "%#{params[:texto_comentario]}%") cual es mas seguro??
    # Client.where("first_name LIKE '%#{params[:first_name]}%'")
    @posts = Post.where(Post.arel_table[:text].matches("%#{params[:texto_comentario]}%"))
  end

  def post_comentarios
    @post = Post.find(params[:id])
  end

  def reducir_like
    @post=Post.find(params[:id])
    if(@post.like>0)
      @post.like=@post.like-1 
    else
      @post.like = 0
    end
    @post.save
    redirect_to '/posts/pantalla_principal'
  end

  def search_by_category
     @posts = Post.where(Post.arel_table[:category].matches("%#{params[:texto_categoria]}%"))
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :category)
    end
end
