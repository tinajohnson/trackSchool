class StudentsController < InheritedResources::Base

  private

    def student_params
      params.require(:student).permit(:student_name, :standard_id, :section_id, :school_id)
    end
end

