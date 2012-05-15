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

    @words = @text.words.page params[:page]
    #if not dictionary?
      #@similars = @words.map{|w| w.similar }.to_a
      #@translations = @words.map do |word|
        #Word.where()
        #select() 
      #end
    #end



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
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = this_class.new(params[this_key]){|one| one.user_id = current_user.id }
    #@text.user_id = current_user.id
    #raise [params, @text].to_yaml
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

    respond_to do |format|
      if @text.update_attributes(params[this_key])
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
  def dictionary?
    params[:type] == 'dictionary'
  end
  def this_key
    params[:type].to_sym
  end
  def this_class
    params[:type].camelize.constantize
  end
end
