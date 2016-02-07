class HomeController < ApplicationController
  def index
  	@post=Post.new
  	@Post=Post.all
  end

  def creat

 #render :text => params[:articulo].inspect
 	uploaded_io = param[:Imag];
  	
  	@post=Post.new
  	@post.Titutlo=param[:Titulo]
  	@post.body=param[:body]
  	@post.imag=uploaded_io.original_filename

  	if @post.save()
  			FileUpload(uploaded_io,@post.imag);
  		  redirect_to :controller=> :home,:action => :index
  	else
  		render "new"
  	end
  end

  def param
  		params.require(:articulo).permit(:Titulo, :body, :Imag)
  end


  def FileUpload(fileup,filename)

	  	File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
	    file.write(fileup.read)
  
  end

  	
  end

end
