# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  is_done    :boolean          default(FALSE), not null
#  task_type  :integer          not null
#  title      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    context 'is_done' do
      example '表示名が正しい' do
        expect(Task.human_attribute_name(:is_done)).to eq('完了')
      end
      example '空は無効' do
        task = FactoryBot.build(:task, is_done: nil)
        task.valid?
        expect(task.errors[:is_done]).to include('は一覧にありません')
      end
    end

    context 'task_type' do
      example '表示名が正しい' do
        expect(Task.human_attribute_name(:task_type)).to eq('タイプ')
      end
      example '空は無効' do
        task = FactoryBot.build(:task, task_type: nil)
        task.valid?
        expect(task.errors[:task_type]).to include('を入力してください')
      end
    end

    context 'title' do
      example '表示名が正しい' do
        expect(Task.human_attribute_name(:title)).to eq('タイトル')
      end
      example '空は無効' do
        task = FactoryBot.build(:task, title: nil)
        task.valid?
        expect(task.errors[:title]).to include('を入力してください')
      end
      example '1000文字は無効' do
        task = FactoryBot.build(:task, title: 'a' * 1000)
        task.valid?
        expect(task.errors[:title]).to include('は999文字以内で入力してください')
      end
      example '999文字は有効' do
        task = FactoryBot.build(:task, title: 'a' * 999)
        task.valid?
        expect(task).to be_valid
      end
    end
  end

  describe 'association' do
    context 'Userモデルとの関係' do
      example 'N:1となっている' do
        expect(Task.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
