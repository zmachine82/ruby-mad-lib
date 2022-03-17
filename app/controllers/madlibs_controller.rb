class MadlibsController < ApplicationController
  before_action :set_madlib, only: %i[ show edit update destroy madlib libbed ]

  # GET /madlibs or /madlibs.json
  def index
    @madlibs = Madlib.all
  end

  # GET /madlibs/1 or /madlibs/1.json
  def show
  end

  # GET /madlibs/new
  def new
    @madlib = Madlib.new
  end

  # GET /madlibs/1/edit
  def edit
  end

  # POST /madlibs or /madlibs.json
  def create
    @madlib = Madlib.new(madlib_params)

    respond_to do |format|
      if @madlib.save
        format.html { redirect_to madlib_url(@madlib), notice: "Madlib was successfully created." }
        format.json { render :show, status: :created, location: @madlib }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @madlib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /madlibs/1 or /madlibs/1.json
  def update
    respond_to do |format|
      if @madlib.update(madlib_params)
        format.html { redirect_to madlib_url(@madlib), notice: "Madlib was successfully updated." }
        format.json { render :show, status: :ok, location: @madlib }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @madlib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /madlibs/1 or /madlibs/1.json
  def destroy
    @madlib.destroy

    respond_to do |format|
      format.html { redirect_to madlibs_url, notice: "Madlib was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def madlib
    @blanks = @madlib.blanks    
  end

  def libbed
    @story =  @madlib.template
    @madlib.blanks.each_with_index do |section, index|
     puts section
     puts @story
      @story.sub!(section, params[index.to_s])
    end
    respond_to do |format|
     
        format.html { render :libbed, status: :unprocessable_entity }
        format.json { render json: @madlib.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_madlib
      @madlib = Madlib.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def madlib_params
      params.require(:madlib).permit(:name, :template)
    end
end
