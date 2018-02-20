class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    if current_user.role == 'Student'
      @student = current_user.student
      @general_setting = GeneralSetting.first
      @user = User.first
    else
      @students = Student.all
      @general_setting = GeneralSetting.first
      @user = User.first
    end
  end

   def view_all
      @students = Student.all
      @general_setting = GeneralSetting.first
      @user = User.first
       if params[:param1].present? && params[:param1] == 'false'
        student = Student.load(params[:id])
        student.update!(student_status: 'Active')
        elsif params[:param1].present? && params[:param1] == 'true'
           student = Student.load(params[:id])
          student.update!(student_status: 'Inactive')  
      end
   end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  def show_student
    @general_setting = GeneralSetting.first
    @student = Student.find(params[:id])
    respond_to do |format|
     format.html
     format.pdf do
     render pdf: "show_student", 
     template: "students/show_student.pdf.erb",
     layout: false
    end
   end
  end

  def admission_receipt
    @general_setting = GeneralSetting.first
    @student = Student.find(params[:id])
    respond_to do |format|
     format.html
     format.pdf do
     render pdf: "admission_receipt", 
     template: "students/admission_receipt.pdf.erb",
     layout: false
    end
   end
  end

  def student_status
    @student = Student.find(params[:id])
    @general_setting = GeneralSetting.first
    @user = User.first
  end


  # GET /students/new
  def new
    @student = Student.new
    @general_setting = GeneralSetting.first
    @user = User.first
    @student.enrollment = Student.set_enrollment_no
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
      # StudentMailer.welcome_email(@student).deliver_now 
        if current_user.role == 'Student'
          @user = current_user.update(student_id: @student.id)
        end
        format.html { redirect_to @student, notice: 'Admission Process Completed Successfully' }
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
      @general_setting = GeneralSetting.first
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:permanent_pin,:reference_student,:caste_category_id, :alternate_contact, :correspondiing_address, :employee_id, :refarence_id, :pin_code, :blood_group, :admission_letter_attachment, :mci_eligibility_criteria_certificate_attachment,:fly,:airticket,:mci_eligibility_certificate,:visa_stamping,:mci_acknowledgement,:visa_appointment,:sent_for_mci,:sent_for_visa,:all_document_sent_to_ho,:processing_fees_paid,:original_document_submission,:fees_paid,:student_status,:email,:photo,:twelth_attachment, :pg_attachment, :ug_attachment, :attachment,:enrollment,:first_name, :last_name, :middle_name, :contact_no, :alternate_contact_no, :gender, :date_of_birth, :father_name, :mother_name, :father_contact_no, :mother_contact_no, :permanent_address, :state, :country, :tenth, :twelth, :pcm, :pcmb, :graduation, :post_graduation, :passport_available, :passport_applied, :passport_not_applied, :course_id, :center_id, :university_id,:course_type_id)
    end
end