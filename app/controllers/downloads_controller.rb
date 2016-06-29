class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :edit, :update, :destroy]

  # GET /downloads/1
  # GET /downloads/1.json
  def show
  end

  # GET /downloads/new
  def new
    @download = Download.new
    @submission = Submission.find(params[:submission_id])
    @download_form = [@submission, @download]
  end

  # GET /downloads/1/edit
  def edit
    @download_form = @download
  end

  # POST /downloads
  # POST /downloads.json
  def create
    @download = Download.new(download_params)

    @submission = Submission.find(params[:submission_id])
    @download.submission_id = @submission.id;
    @download_form = [@submission, @download]

    respond_to do |format|
      if @download.save
        format.html { redirect_to @submission, notice: 'Download was successfully created.' }
        format.json { render :show, status: :created, location: @download }
      else
        format.html { render :new }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /downloads/1
  # PATCH/PUT /downloads/1.json
  def update
    respond_to do |format|
      if @download.update(download_params)
        format.html { redirect_to @download, notice: 'Download was successfully updated.' }
        format.json { render :show, status: :ok, location: @download }
      else
        format.html { render :edit }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.json
  def destroy
    @download.destroy
    respond_to do |format|
      format.html { redirect_to @submission, notice: 'Download was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find(params[:id])
      @submission = @download.submission
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def download_params
      params.require(:download).permit(:name, :platforms, :link, :file, :description)
    end
end
