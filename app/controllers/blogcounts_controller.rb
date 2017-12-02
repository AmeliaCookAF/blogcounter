class BlogcountsController < ApplicationController
  before_action :set_blogcount, only: [:show, :edit, :update, :destroy]
  helper_method :calculateParagraphs, :calculateWordcount
  # GET /blogcounts
  # GET /blogcounts.json
  def index
    @blogcounts = Blogcount.all
  end

  # GET /blogcounts/1
  # GET /blogcounts/1.json
  def show
  end

  # GET /blogcounts/new
  def new
    @blogcount = Blogcount.new
  end

  # GET /blogcounts/1/edit
  def edit
  end

  # POST /blogcounts
  # POST /blogcounts.json
  def create
    @blogcount = Blogcount.new(blogcount_params)

    respond_to do |format|
      if @blogcount.save
        format.html { redirect_to @blogcount, notice: 'Blogcount was successfully created.' }
        format.json { render :show, status: :created, location: @blogcount }
      else
        format.html { render :new }
        format.json { render json: @blogcount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogcounts/1
  # PATCH/PUT /blogcounts/1.json
  def update
    respond_to do |format|
      if @blogcount.update(blogcount_params)
        format.html { redirect_to @blogcount, notice: 'Blogcount was successfully updated.' }
        format.json { render :show, status: :ok, location: @blogcount }
      else
        format.html { render :edit }
        format.json { render json: @blogcount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogcounts/1
  # DELETE /blogcounts/1.json
  def destroy
    @blogcount.destroy
    respond_to do |format|
      format.html { redirect_to blogcounts_url, notice: 'Blogcount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculateParagraphs(paragraphs)
    paragraphList = paragraphs.split("\n")
    return paragraphList
  end

  def calculateWordcount(paragraphList, wordcount)
    return wordcount / paragraphList.count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogcount
      @blogcount = Blogcount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blogcount_params
      params.require(:blogcount).permit(:title, :wordcount, :paragraphs)
    end
end
