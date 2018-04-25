Rails.application.routes.draw do
  root 'welcome#index'
  resources :professors do
    resources :professor_reviews, only: [:edit, :create, :update, :destroy]
  end
  resources :courses do
    resources :course_reviews, only: [:edit, :create, :update, :destroy]
  end
  resources :students

  post '/courses/:id/students', to: 'courses#add_student'
  delete '/courses/:id/students/:student_id', to: 'courses#delete_student'
  post '/courses/:id/professors', to: 'courses#add_professor'
  delete '/courses/:id/professors/:professor_id', to: 'courses#delete_professor'


  post '/students/:id/courses', to: 'students#add_course'
  delete '/students/:id/courses/:course_id', to: 'students#delete_course'
  post '/professors/:id/professors', to: 'professors#add_course'
  delete '/professors/:id/professors/:professor_id', to: 'professors#delete_course'
end
