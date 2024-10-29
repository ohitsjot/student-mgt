from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('home/', views.dashboard, name='dashboard'),

    # Department URLs
    path('departments/', views.department_list, name='department_list'),
    path('departments/add/', views.department_add, name='department_add'),
    path('departments/update/<int:pk>/', views.department_update, name='department_update'),
    path('departments/delete/<int:pk>/', views.department_delete, name='department_delete'),

    # Course URLs
    path('courses/', views.course_list, name='course_list'),
    path('courses/add/', views.course_add, name='course_add'),
    path('courses/update/<int:pk>/', views.course_update, name='course_update'),
    path('courses/delete/<int:pk>/', views.course_delete, name='course_delete'),

    # Instructor URLs
    path('instructors/', views.instructor_list, name='instructor_list'),
    path('instructors/add/', views.instructor_add, name='instructor_add'),
    path('instructors/<int:pk>/view/', views.instructor_view, name='instructor_view'),
    path('instructors/update/<int:pk>/', views.instructor_update, name='instructor_update'),
    path('instructors/delete/<int:pk>/', views.instructor_delete, name='instructor_delete'),

    # Student URLs
    path('students/', views.student_list, name='student_list'),
    path('students/add/', views.student_add, name='student_add'),
    path('students/<int:pk>/view/', views.student_view, name='student_view'),
    path('students/update/<int:pk>/', views.student_update, name='student_update'),
    path('students/delete/<int:pk>/', views.student_delete, name='student_delete'),

    # Subject URLs
    path('subjects/', views.subject_list, name='subject_list'),
    path('subjects/add/', views.subject_add, name='subject_add'),
    path('subjects/<int:pk>/view/', views.subject_view, name='subject_view'),
    path('subjects/update/<int:pk>/', views.subject_update, name='subject_update'),
    path('subjects/delete/<int:pk>/', views.subject_delete, name='subject_delete'),
    path('subjects/<int:pk>/students/', views.subject_student_list, name='subject_student_list'),
    path('subjects/<int:subject_id>/students/', views.student_list, name='student_list'),
    path('add_student_to_subject/<int:subject_id>/', views.add_student_to_subject, name='add_student_to_subject'),
    path('subjects/<int:subject_id>/students/remove/<int:student_id>/', views.remove_student_from_subject, name='remove_student_from_subject'),
    path('subjects/print/<int:pk>/', views.print_subject, name='print_subject'),

    # path('manage_department/', views.manage_department, name='manage_department'),
    # path('manage_course/', views.manage_course, name='manage_course'),
    # path('manage_instructor/', views.manage_instructor, name='manage_instructor'),
    # path('manage_student/', views.manage_student, name='manage_student'),
    # path('manage_subject/', views.manage_subject, name='manage_subject'),

]