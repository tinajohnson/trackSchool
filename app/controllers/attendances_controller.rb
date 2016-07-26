class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

   def summary_show
     @id
     @name
     if(params["Filter"]=="By Name")
       temp = Student.find_by_name(params["student"]["id"])
       @name = params["student"]["id"]
       @id = temp.id
     end

     if(params["Filter"]=="By Roll Number")
       student_id = params["student"]["id"]
       @id = student_id
       t = Student.find(@id)
       @name = t.name
     end

      t = Attendance.uniq.pluck(:Date)
      @Working_days = t.count
      @Present = 0
      @Uninformed = 0
      @informed = 0
      attend = Attendance.all
      attend.each do |attend|
          if attend.student_id == @id.to_s
              if(attend.attendance == "Present")
                  @Present = @Present+1;
              end
              if(attend.attendance == "Half")
                @Present = @Present+ 0.5;
              end
              if(attend.attendance == "Uninformed")
                @Uninformed = @Uninformed+1;
              end
              if(attend.attendance == "Informed")
                @informed = @informed+1
              end
          end
          @att_per = @Present/@Working_days
          @att_per = @att_per * 100
      end



  end

  def view_summary

  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:student_id, :attendance, :Date)
    end
end
