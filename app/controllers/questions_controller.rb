class QuestionsController < ApplicationController
  #skip_before_action :verify_authenticity_token

before_action :set_question, only: %i[ update show destroy edit]
  def create
  #question = Question.create(
      #body: params[:question][:body],єти два парметра заменяются Хешем с данними
      #user_id: params[:question][:user_id]
      #params[:questions] 2 вариант, он небезопасен
          #)
  #в привате опишем метод  question_params = params.require(:question).permit(:body, :user_id)
    question = Question.create(question_params)

    #flash[:notice] = 'создан'# - можно так

    redirect_to question_path(question), notice: "created neeew"
  end

  def update
    #@question = Question.find(params[:id])
    @question.update(
      body: params[:question][:body],
    user_id: params[:question][:user_id]
       )
          redirect_to question_path(@question), notice: "зберегли ваше питання"
    end

    def destroy
    #  @question = Question.find(params[:id])
      @question.destroy
      redirect_to questions_path, notice: "видалили ваше питання"

    end

    def show
#      @question = Question.find(params[:id])
    end

    def index
      @questions = Question.all
      @question = Question.new
    end

    def new
      @question = Question.new
    end

    def edit
      #@question = Question.find(params[:id]) закинем также в приват
      #redirect_to question_path(@question) после создания гзвфеу перенаправление не надо
    end

    private
      def question_params
         params.require(:question).permit(:body, :user_id)
          end
      def set_question
        @question = Question.find(params[:id])
      end

end
