from django import forms
from .models import Department, Course, Instructor, Student, Subject

class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name', 'description', 'status']

class CourseForm(forms.ModelForm):
    class Meta:
        model = Course
        fields = ['department', 'name', 'description', 'status']

class InstructorForm(forms.ModelForm):
    class Meta:
        model = Instructor
        fields = ['department', 'name', 'status']

class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['student_id', 'course', 'name']

class SubjectForm(forms.ModelForm):
    class Meta:
        model = Subject
        fields = ['name', 'department', 'instructor', 'school_level', 'school_year']
