class TextsController < ApplicationController
  # GET /texts
  # GET /texts.json
  def index
    @texts = this_class.all
    return forbidden if not authorized? :index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texts }
    end
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @text = this_class.find(params[:id])
    return forbidden if not authorized? :show, @text

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.json
  def new
    @text = this_class.new
    @text.type = params[:type]
    return forbidden if not authorized? :new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @text = this_class.find(params[:id])
    return forbidden if not authorized? :edit, @text
    #return forbidden if guest? or current_user.id != @text.user_id
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = this_class.new(params[:text]){|one| one.user_id = current_user.id }
    return forbidden if not authorized? :create

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @text = this_class.find(params[:id])
    return forbidden if not authorized? :update, @text
    #return forbidden if guest? or current_user.id != @text.user_id

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text = this_class.find(params[:id])
    return forbidden if not authorized? :destroy, @text
    #return forbidden if guest? or current_user.id != @text.user_id
    @text.destroy

    respond_to do |format|
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end
private
  def this_class
    Text
    #params[:type].constantize
  end
end
