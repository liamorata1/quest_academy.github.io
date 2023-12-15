<?php

namespace App\Http\Controllers;

use App\Models\HomeworkSubmitModel;
use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use App\Models\ClassModel;
use App\Models\SubjectModel;
use App\Models\AssignClassTeacherModel;
use App\Models\ClassSubjectModel;
use App\Models\HomeworkModel;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $data['header_title'] = 'Dashboard';
        if(Auth::user()->user_type == 1)
        {

            $data['TotalStudent'] = User::getTotalUser(3);
            $data['TotalTeacher'] = User::getTotalUser(2);
            $data['TotalAdmin'] = User::getTotalUser(1);
            $data['TotalClass'] = ClassModel::getTotalClass();
            $data['TotalSubject'] = SubjectModel::getTotalSubject();
            return view('admin/dashboard', $data);
        }
        else if(Auth::user()->user_type == 2)
        {
            $data['TotalStudent'] = User::getTeacherStudentCount(Auth::user()->id);
            $data['TotalClass'] = AssignClassTeacherModel::getMyClassSubjectGroupCount(Auth::user()->id);
            $data['TotalSubject'] = AssignClassTeacherModel::getMyClassSubjectCount(Auth::user()->id);
            return view('teacher/dashboard', $data);
        }
        else if(Auth::user()->user_type == 3)
        {
            $data['TotalSubject'] = ClassSubjectModel::getMySubjectCount(Auth::user()->class_id);
            $data['TotalHomework'] = HomeworkModel::HomeworkCount(Auth::user()->class_id, Auth::user()->id);
            $data['TotalSubmittedHomework'] = HomeworkSubmitModel::SubmittedHomeworkCount(Auth::user()->id);
            return view('student/dashboard', $data);
        }
    }
}
