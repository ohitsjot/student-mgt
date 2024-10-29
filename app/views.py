from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponseRedirect

def login(request):
    if request.user.is_authenticated:
        return redirect('dashboard')

    if request.method == 'POST':
        user = authenticate(
            username=request.POST.get('username'),
            password=request.POST.get('password'),
            request=request
        )

        if user is not None and user.is_staff:
            auth_login(request, user)
            return JsonResponse({'data': 'Success'})

        return JsonResponse({'error': 'Invalid username/password.'})

    return render(request, 'login.html')


@login_required
def logout(request):
    request.session.flush()
    auth_logout(request)
    return HttpResponseRedirect('/')


@login_required
def dashboard(request):
    department_count = Department.objects.count()
    courses_count = Course.objects.count()
    instructors_count = Instructor.objects.count()
    students_count = Student.objects.count()
    subjects_count = Subject.objects.count()
    context = {
        'page': 'dashboard',
        'department_count': department_count,
        'courses_count': courses_count,
        'instructors_count': instructors_count,
        'students_count': students_count,
        'subjects_count': subjects_count,
    }
    return render(request, 'dashboard.html', context)

from django.shortcuts import get_object_or_404
from .models import Department, Course, Instructor, Student, Subject
from .forms import DepartmentForm, CourseForm, InstructorForm, StudentForm, SubjectForm
from django.contrib import messages

# List all departments
def department_list(request):
    departments = Department.objects.all()
    context = {
        'page': 'department_list',
        'departments' : departments,
    }
    return render(request, 'departments/list.html', context)

# Add a new department
def department_add(request):
    if request.method == 'POST':
        form = DepartmentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('department_list')
    else:
        form = DepartmentForm()
    return render(request, 'departments/add.html', {'form': form})

# Update an existing department
def department_update(request, pk):
    department = get_object_or_404(Department, pk=pk)
    if request.method == 'POST':
        form = DepartmentForm(request.POST, instance=department)
        if form.is_valid():
            form.save()
            return redirect('department_list')
    else:
        form = DepartmentForm(instance=department)
    return render(request, 'departments/update.html', {'form': form})

# Delete a department
def department_delete(request, pk):
    department = get_object_or_404(Department, pk=pk)
    if request.method == 'POST':
        department.delete()
        return redirect('department_list')
    return render(request, 'departments/delete.html', {'department': department})

# List all courses
def course_list(request):
    courses = Course.objects.all()
    context = {
        'page': 'course_list',
        'courses': courses,
    }
    return render(request, 'courses/list.html', context)

# Add a new course
def course_add(request):
    if request.method == 'POST':
        form = CourseForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('course_list')
    else:
        form = CourseForm()
    return render(request, 'courses/add.html', {'form': form})

# Update an existing course
def course_update(request, pk):
    course = get_object_or_404(Course, pk=pk)
    if request.method == 'POST':
        form = CourseForm(request.POST, instance=course)
        if form.is_valid():
            form.save()
            return redirect('course_list')
    else:
        form = CourseForm(instance=course)
    return render(request, 'courses/update.html', {'form': form})

# Delete a course
def course_delete(request, pk):
    course = get_object_or_404(Course, pk=pk)
    if request.method == 'POST':
        course.delete()
        return redirect('course_list')
    return render(request, 'courses/delete.html', {'course': course})

# List all instructors
def instructor_list(request):
    instructors = Instructor.objects.all()
    context = {
        'page': 'instructor_list',
        'instructors': instructors,
    }
    return render(request, 'instructors/list.html', context)

# Add a new instructor
def instructor_add(request):
    if request.method == 'POST':
        form = InstructorForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Instructor added successfully!')
            return redirect('instructor_list')
    else:
        form = InstructorForm()
    return render(request, 'instructors/add.html', {'form': form})

# View instructor details
def instructor_view(request, pk):
    instructor = get_object_or_404(Instructor, pk=pk)
    return render(request, 'instructors/view.html', {'instructor': instructor})

# Update an existing instructor
def instructor_update(request, pk):
    instructor = get_object_or_404(Instructor, pk=pk)
    if request.method == 'POST':
        form = InstructorForm(request.POST, instance=instructor)
        if form.is_valid():
            form.save()
            messages.success(request, 'Instructor updated successfully!')
            return redirect('instructor_list')
    else:
        form = InstructorForm(instance=instructor)
    return render(request, 'instructors/update.html', {'form': form})

# Delete an instructor
def instructor_delete(request, pk):
    instructor = get_object_or_404(Instructor, pk=pk)
    if request.method == 'POST':
        instructor.delete()
        messages.success(request, 'Instructor deleted successfully!')
        return redirect('instructor_list')
    return render(request, 'instructors/delete.html', {'instructor': instructor})

# List all students
def student_list(request):
    students = Student.objects.all()
    context = {
        'page': 'student_list',
        'students': students,
    }
    return render(request, 'students/list.html', context)

# Add a new student
def student_add(request):
    if request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('student_list')
    else:
        form = StudentForm()
    return render(request, 'students/add.html', {'form': form})

def student_view(request, pk):
    student = get_object_or_404(Student, pk=pk)
    return render(request, 'students/view.html', {'student': student})

# Update an existing student
def student_update(request, pk):
    student = get_object_or_404(Student, pk=pk)
    if request.method == 'POST':
        form = StudentForm(request.POST, instance=student)
        if form.is_valid():
            form.save()
            return redirect('student_list')
    else:
        form = StudentForm(instance=student)
    return render(request, 'students/update.html', {'form': form})

# Delete a student
def student_delete(request, pk):
    student = get_object_or_404(Student, pk=pk)
    if request.method == 'POST':
        student.delete()
        return redirect('student_list')
    return render(request, 'students/delete.html', {'student': student})

# List all subjects
def subject_list(request):
    subjects = Subject.objects.all()
    context = {
        'page': 'subject_list',
        'subjects': subjects,
    }
    return render(request, 'subjects/list.html', context)


def subject_add(request):
    if request.method == 'POST':
        form = SubjectForm(request.POST)
        if form.is_valid():
            subject = form.save()
            student_ids = request.POST.getlist('students')
            for student_id in student_ids:
                student = Student.objects.get(id=student_id)
                subject.students.add(student)
            subject.save()
            return redirect('subject_list')
    else:
        form = SubjectForm()

    students = Student.objects.all()
    return render(request, 'subjects/add.html', {'form': form, 'students': students})

def subject_view(request, pk):
    subject = get_object_or_404(Subject, pk=pk)
    return render(request, 'subjects/view.html', {'subject': subject})

# Update an existing subject
def subject_update(request, pk):
    subject = get_object_or_404(Subject, pk=pk)
    if request.method == 'POST':
        form = SubjectForm(request.POST, instance=subject)
        if form.is_valid():
            form.save()
            return redirect('subject_list')
    else:
        form = SubjectForm(instance=subject)
    return render(request, 'subjects/update.html', {'form': form})

# Delete a subject
def subject_delete(request, pk):
    subject = get_object_or_404(Subject, pk=pk)
    if request.method == 'POST':
        subject.delete()
        return redirect('subject_list')
    return render(request, 'subjects/delete.html', {'subject': subject})

# List students for a subject
def subject_student_list(request, pk):
    subject = get_object_or_404(Subject, pk=pk)
    return render(request, 'subjects/student_list.html', {'subject': subject})


def print_subject(request, pk):
    context = {
        'subject': Subject.objects.filter(id=pk).first()
    }
    return render(request, 'subjects/print_subject.html', context)


def add_student_to_subject(request, subject_id):
    subject = Subject.objects.get(id=subject_id)

    if request.method == "POST":
        student_id = request.POST.get('student_id')
        student = Student.objects.get(id=student_id)
        subject.students.add(student)  # Add student to subject
        return redirect('subject_list')  # Redirect to subject list after adding

    students = Student.objects.all()  # Retrieve all students
    return render(request, 'subjects/students_to_subject.html', {
        'subject': subject,
        'students': students,
    })

def remove_student_from_subject(request, subject_id, student_id):
    subject = get_object_or_404(Subject, id=subject_id)
    student = get_object_or_404(Student, id=student_id)

    subject.students.remove(student)

    return redirect('student_list', subject_id=subject_id)

# def manage_department(request):
#     return render(request, 'manage_department.html')
#
# def manage_course(request):
#     return render(request, 'manage_course.html')
#
# def manage_instructor(request):
#     return render(request, 'manage_instructor.html')
#
# def manage_student(request):
#     return render(request, 'manage_student.html')
#
# def manage_subject(request):
#     return render(request, 'manage_subject.html')