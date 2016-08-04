module ChartsHelper

  def label_builder(questions)
    question_array = []
      questions.each do |question|
        question_array.push(question.content.to_s)
      end
    question_array
  end
end
