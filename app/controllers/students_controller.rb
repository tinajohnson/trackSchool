class StudentsController < InheritedResources::Base
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    s_id = Allotment.where(user_id: current_user.id).pluck(:school_id)
    class_ids = ClassMapping.where(school_id: s_id).pluck(:id)
    @students = Student.includes(class_mapping:[:standard, :section]).where( :class_mapping_id => class_ids)
    #class ids of selected students
    # @class_ids_students= []
    # for student in @students do
    #   @class_ids_students<<student.class_mapping_id
    # end
    # @class_mappings = ClassMapping.where( :id => @class_ids_students )
    render component: 'Students', props: { students: @students}
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
  # def create
  #   @student = Student.new(student_params)
  #   class_mapping_id = ClassMapping.where(:standard_id => params[:standard], :section_id => params[:section],
  #                                         :school_id => params[:school_id]).pluck(:id).first
  #   @student.class_mapping_id = class_mapping_id
  #
  #   respond_to do |format|
  #     if @student.save
  #       format.html { redirect_to @student, notice: 'Student was successfully created.' }
  #       format.json { render :show, status: :created, location: @student }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @student.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
    params.require(:student).permit(:name, :class_mapping_id)
  end

end

