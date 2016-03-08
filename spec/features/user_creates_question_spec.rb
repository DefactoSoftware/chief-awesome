require "spec_helper"

feature "users can create questions" do
  let(:question) { create :question }

  scenario "anonymous user cannot visit questions overview" do
    visit root_url
    click_link "Questions"

    expect(page).to have_content("Not authorized")
    expect(page).to have_content("Register")
  end

  scenario "user visits questions overview" do
    sign_in_user
    visit root_url
    click_link "Questions"

    expect(page).to have_content("Questions")
  end

  scenario "user creates question" do
    sign_in_user
    visit root_url
    click_link "Questions"
    click_link "Add Question"

    fill_in "Question", with: "What's your mother's maiden name?"
    fill_in "Description", with: "And is this question even secret?"
    click_button "Create question"

    expect(page).to have_content("What's your mother's maiden name?")
    expect(page).to have_content("And is this question even secret?")
  end

  scenario "show all questions on the index page" do
    question

    sign_in_user
    visit questions_path

    expect(page).to have_content(question.title)
  end

  scenario "answer a question found in all questions" do
    question

    sign_in_user
    visit questions_path

    click_link question.title

    answer = "Heikema"
    fill_in "Answer", with: answer

    click_button "Create answer"

    expect(page).to have_content(answer)
    expect(page).to have_content(question.answers.first.body)
    expect(page).to have_content(question.title)
  end
end
