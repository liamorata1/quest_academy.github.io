<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\ClassController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\ClassSubjectController;
use App\Http\Controllers\AssignClassTeacherController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ClassTimetableController;
use App\Http\Controllers\HomeworkController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

Route::get('/', [AuthController::class,'login']);
Route::post('login', [AuthController::class,'AuthLogin']);
Route::get('logout', [AuthController::class,'logout']);
Route::get('forgot-password', [AuthController::class,'forgotpassword']);
Route::post('forgot-password', [AuthController::class,'PostForgotPassword']);
Route::get('reset/{token}', [AuthController::class,'reset']);
Route::post('reset/{token}', [AuthController::class,'PostReset']);


Route::group(['middleware' => 'admin'], function() {

    Route::get('admin/dashboard', [DashboardController::class,'dashboard']);
    Route::get('admin/admin/list', [AdminController::class,'list']);
    Route::get('admin/admin/add', [AdminController::class,'add']);
    Route::post('admin/admin/add', [AdminController::class,'insert']);
    Route::get('admin/admin/edit/{id}', [AdminController::class,'edit']);
    Route::post('admin/admin/edit/{id}', [AdminController::class,'update']);
    Route::get('admin/admin/delete/{id}', [AdminController::class,'delete']);

    //teacher
    Route::get('admin/teacher/list', [TeacherController::class,'list']);
    Route::get('admin/teacher/add', [TeacherController::class,'add']);
    Route::post('admin/teacher/add', [TeacherController::class,'insert']);
    Route::get('admin/teacher/edit/{id}', [TeacherController::class,'edit']);
    Route::post('admin/teacher/edit/{id}', [TeacherController::class,'update']);
    Route::get('admin/teacher/delete/{id}', [TeacherController::class,'delete']);

    //student
    Route::get('admin/student/list', [StudentController::class,'list']);
    Route::get('admin/student/add', [StudentController::class,'add']);
    Route::post('admin/student/add', [StudentController::class,'insert']);
    Route::get('admin/student/edit/{id}', [StudentController::class,'edit']);
    Route::post('admin/student/edit/{id}', [StudentController::class,'update']);
    Route::get('admin/student/delete/{id}', [StudentController::class,'delete']);

    //class url
    Route::get('admin/class/list', [ClassController::class,'list']);
    Route::get('admin/class/add', [ClassController::class,'add']);
    Route::post('admin/class/add', [ClassController::class,'insert']);
    Route::get('admin/class/edit/{id}', [ClassController::class,'edit']);
    Route::post('admin/class/edit/{id}', [ClassController::class,'update']);
    Route::get('admin/class/delete/{id}', [ClassController::class,'delete']);

    //subject url
    Route::get('admin/subject/list', [SubjectController::class,'list']);
    Route::get('admin/subject/add', [SubjectController::class,'add']);
    Route::post('admin/subject/add', [SubjectController::class,'insert']);
    Route::get('admin/subject/edit/{id}', [SubjectController::class,'edit']);
    Route::post('admin/subject/edit/{id}', [SubjectController::class,'update']);
    Route::get('admin/subject/delete/{id}', [SubjectController::class,'delete']);

    //assign_subject url
    Route::get('admin/assign_subject/list', [ClassSubjectController::class,'list']);
    Route::get('admin/assign_subject/add', [ClassSubjectController::class,'add']);
    Route::post('admin/assign_subject/add', [ClassSubjectController::class,'insert']);
    Route::get('admin/assign_subject/edit/{id}', [ClassSubjectController::class,'edit']);
    Route::post('admin/assign_subject/edit/{id}', [ClassSubjectController::class,'update']);
    Route::get('admin/assign_subject/delete/{id}', [ClassSubjectController::class,'delete']);
    Route::get('admin/assign_subject/edit_single/{id}', [ClassSubjectController::class,'edit_single']);
    Route::post('admin/assign_subject/edit_single/{id}', [ClassSubjectController::class,'update_single']);

    //class_timetable
    Route::get('admin/class_timetable/list', [ClassTimetableController::class,'list']);
    Route::post('admin/class_timetable/get_subject', [ClassTimetableController::class,'get_subject']);
    Route::post('admin/class_timetable/add', [ClassTimetableController::class,'insert_update']);


    //assign_course_to_teacher url
    Route::get('admin/assign_class_teacher/list', [AssignClassTeacherController::class,'list']);
    Route::get('admin/assign_class_teacher/add', [AssignClassTeacherController::class,'add']);
    Route::post('admin/assign_class_teacher/add', [AssignClassTeacherController::class,'insert']);
    Route::get('admin/assign_class_teacher/edit/{id}', [AssignClassTeacherController::class,'edit']);
    Route::post('admin/assign_class_teacher/edit/{id}', [AssignClassTeacherController::class,'update']);
    Route::get('admin/assign_class_teacher/edit_single/{id}', [AssignClassTeacherController::class,'edit_single']);
    Route::post('admin/assign_class_teacher/edit_single/{id}', [AssignClassTeacherController::class,'update_single']);
    Route::get('admin/assign_class_teacher/delete/{id}', [AssignClassTeacherController::class,'delete']);

    //admin homework
    Route::get('admin/homework/homework', [HomeworkController::class,'homework']);
    Route::get('admin/homework/homework/add', [HomeworkController::class,'add']);
    Route::post('admin/ajax_get_subject', [HomeworkController::class,'ajax_get_subject']);
    Route::post('admin/homework/homework/add', [HomeworkController::class,'insert']);
    Route::get('admin/homework/homework/edit/{id}', [HomeworkController::class,'edit']);
    Route::post('admin/homework/homework/edit/{id}', [HomeworkController::class,'update']);
    Route::get('admin/homework/homework/delete/{id}', [HomeworkController::class,'delete']);
    Route::get('admin/homework/homework/submitted/{id}', [HomeworkController::class,'submitted']);
    Route::get('admin/homework/homework_report', [HomeworkController::class,'homework_report']);

    //admin/my_account
    Route::get('admin/account', [UserController::class, 'MyAccount']);
    Route::post('admin/account', [UserController::class, 'UpdateMyAccountAdmin']);

    //admin/change password
    Route::get('admin/change_password', [UserController::class,'change_password']);
    Route::post('admin/change_password', [UserController::class,'update_change_password']);

});

Route::group(['middleware' => 'teacher'], function() {
    Route::get('teacher/dashboard', [DashboardController::class,'dashboard']);

    Route::get('teacher/account', [UserController::class, 'MyAccount']);
    Route::post('teacher/account', [UserController::class, 'UpdateMyAccount']);

    Route::get('teacher/change_password', [UserController::class,'change_password']);
    Route::post('teacher/change_password', [UserController::class,'update_change_password']);

    Route::get('teacher/my_student', [StudentController::class, 'MyStudent']);

    Route::get('teacher/my_class_subject', [AssignClassTeacherController::class, 'MyClassSubject']);
    Route::get('teacher/my_class_subject/class_timetable/{class_id}/{subject_id}', [ClassTimetableController::class, 'MyTimetableTeacher']);

    Route::get('teacher/homework/homework', [HomeworkController::class,'HomeworkTeacher']);
    Route::get('teacher/homework/homework/add', [HomeworkController::class,'addTeacher']);
    Route::post('teacher/ajax_get_subject', [HomeworkController::class,'ajax_get_subject']);
    Route::post('teacher/homework/homework/add', [HomeworkController::class,'insertTeacher']);
    Route::get('teacher/homework/homework/edit/{id}', [HomeworkController::class,'editTeacher']);
    Route::post('teacher/homework/homework/edit/{id}', [HomeworkController::class,'updateTeacher']);
    Route::get('teacher/homework/homework/delete/{id}', [HomeworkController::class,'delete']);
    Route::get('teacher/homework/homework/submitted/{id}', [HomeworkController::class,'submittedTeacher']);
    

});
Route::group(['middleware' => 'student'], function() {
    Route::get('student/dashboard', [DashboardController::class,'dashboard']);

    Route::get('student/my_subject', [SubjectController::class,'MySubject']);

    Route::get('student/my_timetable', [ClassTimetableController::class,'MyTimetable']);

    Route::get('student/account', [UserController::class, 'MyAccount']);
    Route::post('student/account', [UserController::class, 'UpdateMyAccountStudent']);

    Route::get('student/change_password', [UserController::class,'change_password']);
    Route::post('student/change_password', [UserController::class,'update_change_password']);

    Route::get('student/my_homework', [HomeworkController::class,'HomeworkStudent']);
    Route::get('student/my_homework/submit_homework/{id}', [HomeworkController::class,'SubmitHomework']);
    Route::post('student/my_homework/submit_homework/{id}', [HomeworkController::class,'SubmitHomeworkInsert']);

    Route::get('student/my_submitted_homework', [HomeworkController::class,'HomeworkSubmittedStudent']);
});



