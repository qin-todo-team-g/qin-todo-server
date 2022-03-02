require 'rails_helper'

RSpec.describe Task, type: :model do
  it "type, is_done, title, user_idがあれば有効な状態であること" do
    task = build(:task)
    expect(task).to be_valid  # task.valid? が true になればパスする
  end
  
  # it "task_typeがなければ無効な状態であること" do
  #   task = Task.new(task_type: nil)
  #   task.valid?
  #   expect(task.errors[:task_type]).to include("can't be blank")
  # end

  # it "is_doneがなければ無効な状態であること" do
  #   task = Task.new(is_done: nil)
  #   task.valid?
  #   expect(task.errors[:is_done]).to include("can't be blank")
  # end

  # it "titleがなければ無効な状態であること" do
  #   task = Task.new(title: nil)
  #   task.valid?
  #   expect(task.errors[:title]).to include("can't be blank")
  # end

  # it "user_idがなければ無効な状態であること" do
  #   task = Task.new(user_id: nil)
  #   task.valid?
  #   expect(task.errors[:user_id]).to include("can't be blank")
  # end
end
