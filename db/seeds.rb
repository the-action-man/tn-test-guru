# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              { name: 'user_01' },
              { name: 'user_02' },
              { name: 'user_03' }
            ])
Category.create([
                  { name: 'category_01' },
                  { name: 'category_02' },
                  { name: 'category_03' }
                ])
Test.create([
              { name: 'test_01', level: 0, user_id: 1, category_id: 1 },
              { name: 'test_01', level: 1, user_id: 1, category_id: 1 },
              { name: 'test_01', level: 2, user_id: 1, category_id: 1 },
              { name: 'test_02', level: 1, user_id: 2, category_id: 2 },
              { name: 'test_03', level: 0, user_id: 3, category_id: 3 }
            ])
Question.create([
                  { text: 'question_01', test_id: 1 },
                  { text: 'question_02', test_id: 1 },
                  { text: 'question_03', test_id: 1 },
                  { text: 'question_04', test_id: 1 },
                  { text: 'question_05', test_id: 1 },
                  { text: 'question_06', test_id: 1 },
                  { text: 'question_07', test_id: 1 },
                  { text: 'question_08', test_id: 1 },
                  { text: 'question_09', test_id: 1 },
                  { text: 'question_10', test_id: 1 },
                  { text: 'question_201', test_id: 2 },
                  { text: 'question_202', test_id: 2 },
                  { text: 'question_203', test_id: 2 },
                  { text: 'question_204', test_id: 2 },
                  { text: 'question_205', test_id: 2 },
                  { text: 'question_206', test_id: 2 },
                  { text: 'question_207', test_id: 2 },
                  { text: 'question_208', test_id: 2 },
                  { text: 'question_209', test_id: 2 },
                  { text: 'question_210', test_id: 2 },
                  { text: 'question_301', test_id: 3 }
                ])
Answer.create([
                { text: 'a_01 of q_01', question_id: 1, correct: false },
                { text: 'a_01 of q_01', question_id: 1, correct: false },
                { text: 'a_01 of q_01', question_id: 1, correct: false },
                { text: 'a_01 of q_01 true', question_id: 1, correct: true },
                { text: 'a_01 of q_02', question_id: 2, correct: false },
                { text: 'a_01 of q_02', question_id: 2, correct: false },
                { text: 'a_01 of q_02', question_id: 2, correct: false },
                { text: 'a_01 of q_02 true', question_id: 2, correct: true },
                { text: 'a_01 of q_03', question_id: 3, correct: false },
                { text: 'a_01 of q_03', question_id: 3, correct: false },
                { text: 'a_01 of q_03', question_id: 3, correct: false },
                { text: 'a_01 of q_03 true', question_id: 3, correct: true }
              ])
