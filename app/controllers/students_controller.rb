class StudentsController < InheritedResources::Base

  private

    def student_params
      params.require(:student).permit(:student_name, :class_mapping_id)
    end
end

