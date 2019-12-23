# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = '123456'

users = User.create!([
                       { email: 'u_01@email.org', password: password },
                       { email: 'u_02@email.org', password: password },
                       { email: 'u_03@email.org', password: password }
                     ])
categories = Category.create!([
                                { title: 'category_01' },
                                { title: 'category_02' },
                                { title: 'category_03' }
                              ])
tests = Test
  .create!([
    { title: 'test_01 l_1', level: 1, category: categories[0], author: users[0] },
    { title: 'test_01 l_2', level: 2, category: categories[0], author: users[0] },
    { title: 'test_02 l_2', level: 2, category: categories[0], author: users[0] },
    { title: 'test_03 l_2', level: 2, category: categories[0], author: users[0] },
    { title: 'test_04 l_1', level: 1, category: categories[1], author: users[0] },
    { title: 'test_05 l_0', level: 1, category: categories[2], author: users[1] }
  ])
# test_passage = TestPassage
#   .create!([
#     { user: users[0], test: tests[0] },
#     { user: users[0], test: tests[1] },
#     { user: users[0], test: tests[2] },
#     { user: users[0], test: tests[3] },
#     { user: users[1], test: tests[4] },
#     { user: users[2], test: tests[5] }
#   ])
questions = Question
  .create!([
    { body: 'question_01', test: tests[0] },
    { body: 'question_02', test: tests[0] },
    { body: 'question_03', test: tests[0] },
    { body: 'question_201', test: tests[1] },
    { body: 'question_202', test: tests[1] },
    { body: 'question_203', test: tests[1] },
    { body: 'question_301', test: tests[2] }
  ])
answers = Answer
  .create!([
    { body: 'a_01 of q_01', question: questions[0], correct: false },
    { body: 'a_01 of q_01', question: questions[0], correct: false },
    { body: 'a_01 of q_01', question: questions[0], correct: false },
    { body: 'a_01 of q_01 true', question: questions[0], correct: true },
    { body: 'a_01 of q_02', question: questions[1], correct: false },
    { body: 'a_01 of q_02', question: questions[1], correct: false },
    { body: 'a_01 of q_02', question: questions[1], correct: false },
    { body: 'a_01 of q_02 true', question: questions[1], correct: true },
    { body: 'a_01 of q_03', question: questions[2], correct: false },
    { body: 'a_01 of q_03', question: questions[2], correct: false },
    { body: 'a_01 of q_03', question: questions[2], correct: false },
    { body: 'a_01 of q_03 true', question: questions[2], correct: true }
  ])
