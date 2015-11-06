class PostsController < ApplicationController

before_filter :authorize

def index
	@posts= Post.all
	@posts= Post.all.order('created_at DESC')
end

def new
	@post= Post.new
end

def create
	@post = Post.new(post_params)

	if @post.save

	redirect_to@post
else
	render 'new'
end
end

def show
	@post = Post.find(params[:id])
end

def edit
@post = Post.find(params[:id])

end

def update
	@post = Post.find(params[:id])
	if @post.update(post_params)
	redirect_to @post
else
	render 'edit'
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy

	redirect_to posts_path
end

def map

end

def resize_to_fit
end

private
def post_params
	params.require(:post).permit(:title, :body, :photos, :avatar, :remote_avatar_url, :country, :city)
end

end
