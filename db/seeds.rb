# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable all

users = User.create!([
                       { name: 'user_01' },
                       { name: 'user_02' },
                       { name: 'user_03' }
                     ])
categories = Category.create!([
                                { name: 'category_01' },
                                { name: 'category_02' },
                                { name: 'category_03' }
                              ])
tests = Test.create!([
                       { name: 'test_01 l_0', level: 0, \
                         category_id: categories[0].id },
                       { name: 'test_01 l_1', level: 1, \
                         category_id: categories[0].id },
                       { name: 'test_01 l_2', level: 2, \
                         category_id: categories[0].id },
                       { name: 'test_02 l_2', level: 2, \
                         category_id: categories[0].id },
                       { name: 'test_03 l_2', level: 2, \
                         category_id: categories[0].id },
                       { name: 'test_04 l_1', level: 1, \
                         category_id: categories[1].id },
                       { name: 'test_05 l_0', level: 0, \
                         category_id: categories[2].id }
                     ])
tu = TestsUser.create!([
                            { user_id: users[0].id, test_id: tests[0].id },
                            { user_id: users[0].id, test_id: tests[1].id },
                            { user_id: users[0].id, test_id: tests[2].id },
                            { user_id: users[0].id, test_id: tests[3].id },
                            { user_id: users[1].id, test_id: tests[4].id },
                            { user_id: users[2].id, test_id: tests[5].id }
                           ])
questions = Question.create!([
                               { text: 'question_01', test_id: tests[0].id },
                               { text: 'question_02', test_id: tests[0].id },
                               { text: 'question_03', test_id: tests[0].id },
                               { text: 'question_04', test_id: tests[0].id },
                               { text: 'question_05', test_id: tests[0].id },
                               { text: 'question_06', test_id: tests[0].id },
                               { text: 'question_07', test_id: tests[0].id },
                               { text: 'question_08', test_id: tests[0].id },
                               { text: 'question_09', test_id: tests[0].id },
                               { text: 'question_10', test_id: tests[0].id },
                               { text: 'question_201', test_id: tests[1].id },
                               { text: 'question_202', test_id: tests[1].id },
                               { text: 'question_203', test_id: tests[1].id },
                               { text: 'question_204', test_id: tests[1].id },
                               { text: 'question_205', test_id: tests[1].id },
                               { text: 'question_206', test_id: tests[1].id },
                               { text: 'question_207', test_id: tests[1].id },
                               { text: 'question_208', test_id: tests[1].id },
                               { text: 'question_209', test_id: tests[1].id },
                               { text: 'question_210', test_id: tests[1].id },
                               { text: 'question_301', test_id: tests[2].id }
                             ])
answers = Answer.create!([
                           { text: 'a_01 of q_01', \
                             question_id: questions[0].id, correct: false },
                           { text: 'a_01 of q_01', \
                             question_id: questions[0].id, correct: false },
                           { text: 'a_01 of q_01', \
                             question_id: questions[0].id, correct: false },
                           { text: 'a_01 of q_01 true', \
                             question_id: questions[0].id, correct: true },
                           { text: 'a_01 of q_02', \
                             question_id: questions[1].id, correct: false },
                           { text: 'a_01 of q_02', \
                             question_id: questions[1].id, correct: false },
                           { text: 'a_01 of q_02', \
                             question_id: questions[1].id, correct: false },
                           { text: 'a_01 of q_02 true', \
                             question_id: questions[1].id, correct: true },
                           { text: 'a_01 of q_03', \
                             question_id: questions[2].id, correct: false },
                           { text: 'a_01 of q_03', \
                             question_id: questions[2].id, correct: false },
                           { text: 'a_01 of q_03', \
                             question_id: questions[2].id, correct: false },
                           { text: 'a_01 of q_03 true', \
                             question_id: questions[2].id, correct: true }
                         ])
# rubocop:enable all
