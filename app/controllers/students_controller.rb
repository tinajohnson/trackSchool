class StudentsController < InheritedResources::Base
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    s_id = Allotment.where(user_id: current_user.id).pluck(:school_id)
    class_ids = ClassMapping.where(school_id: s_id).pluck(:id)
    @all_students = Student.includes(class_mapping:[:standard, :section]).where( :class_mapping_id => class_ids)
    students = @all_students.map  do |student|
        { id:student.id, name: student.name, standard: student.class_mapping.standard.name, section: student.class_mapping.section.name,
        school: s_id}
    end
    render component: 'Students', props: { students: students}
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  def create
    s_id = Allotment.where(user_id: current_user.id).pluck(:school_id)
    standard_id = Standard.where(name: params[:student][:standard]).pluck(:id)
    section_id = Section.where(name: params[:student][:section]).pluck(:id)
    class_id = ClassMapping.where(school_id: s_id, standard_id: standard_id, section_id: section_id ).pluck(:id).first
    @student = Student.new({:name => params[:student][:name], :class_mapping_id => class_id})
    @saved_student = {id:@student.id, name: params[:student][:name], standard: params[:student][:standard], section: params[:student][:section],
                      school: s_id, class_mapping_id: class_id}
    if @student.save
      render :json => @saved_student
    end
  end

  # GET /students/1/edit
  def edit
  end

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

