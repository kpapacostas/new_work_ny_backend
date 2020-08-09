class PostsController < ApplicationController
    
    def index
      posts = Post.all 
      if posts.length > 0
        render json:{posts: posts}
      end 
    end 
    
    def create
      post = Post.create!(
        title: params["data"]["title"],
        description: params["data"]["description"],
        start_date: params["data"]["start_date"],
        end_date: params["data"]["end_date"],
        author_id: params["data"]["author_id"],
        
      )
      if post
        render json: {
          status: :created,
          post: post
        }
      else
        render json: { status: 422, params: params }
      end
    end


  end