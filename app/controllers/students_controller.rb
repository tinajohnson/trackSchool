class StudentsController < InheritedResources::Base
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def list_students
    std = params["standard"]
    sec = params["section"]

    @mapping_id = 0

    std_id = Standard.find_by_standard_name(std)
    sec_id = Section.find_by_section_name(sec)


    c_map = ClassMapping.all
    c_map.each do |c_map|
      if (c_map.standard_id == std_id.id && c_map.section_id == sec_id.id)
        @mapping_id = c_map.id
        end
      end

     if(@mapping_id == 0)
       render template: "students/error"
     end

    end

  def show_selected_id

    t = Attendance.uniq

    value = params[:date]

    stud = Student.all
    stud.each do |stud|
      id = stud.id.to_s
      val = params[id]
      if (!val.nil?)
        t =  Attendance.new
        t.attendance = val
        t.student_id = id
        t.Date = value
        t.save
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end


  private

    def student_params
      params.require(:student).permit(:student_name, :standard_id, :section_id, :school_id)
    end
end

