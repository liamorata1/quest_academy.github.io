<?php

namespace App\Http\Controllers;
use App\Models\User;
use Auth;
use Hash;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function MyAccount()
    {
        $data['getRecord'] = User::getSingle(Auth::user()->id);
        $data['header_title'] = "My Account";
        if(Auth::user()-> user_type == 1)
        {
            return view('admin.my_account', $data);
        }
        else if(Auth::user()->user_type == 2)
        {
            return view('teacher.my_account', $data);
        }
        else if(Auth::user()->user_type == 3)
        {
            return view('student.my_account', $data);
        }
        
    }

    public function UpdateMyAccountAdmin(Request $request)
    {
        $id = Auth::user()->id;
        request()->validate([
            'email' => 'required|email|unique:users,email,'.$id
        ]);

        $admin = User::getSingle($id);
        $admin->name = trim($request->name);
        $admin->email = trim($request->email);
        $admin->save();

        return redirect()->back()->with('success', "Account Successfully Updated");
    }

    public function UpdateMyAccount(Request $request)
    {
        $id = Auth::user()->id;
        request()->validate([
            'email' => 'required|email|unique:users,email,'.$id,
            'address' => 'max:255',
            'mobile_number' => 'max:15|min:8 '
        ]);

        $teacher = User::getSingle($id);
        $teacher->name = trim($request->name);
        $teacher->last_name = trim($request->last_name);

        $teacher->gender = trim($request->gender);



        if(!empty($request->file('profile_pic')))
        {
            if(!empty($teacher->getProfile()))
            {
                unlink('upload/profile/'. $teacher->profile_pic);
            }
            $ext = $request->file('profile_pic')->getClientOriginalExtension();
            $file = $request->file('profile_pic');
            $randomStr = date('Ymdhis').Str::random(20);
            $filename = strtolower($randomStr).'.'.$ext;
            $file->move('upload/profile', $filename);

            $teacher->profile_pic = $filename;
        }

        $teacher->mobile_number = trim($request->mobile_number);
        $teacher->address = trim($request->address);
        $teacher->email = trim($request->email);


        $teacher->save();

        return redirect()->back()->with('success',"Account Successfully Updated");
    }

    public function UpdateMyAccountStudent(Request $request)
    {
        $id = Auth::user()->id;

        request()->validate([
            'email' => 'required|email|unique:users',
            'blood_group' => 'max:10',
            'mobile_number' => 'max:15|min:8 ',
            'religion' => 'max:50',
            'height' => 'max:10',
            'weight' => 'max:10'
        ]);

        $student = new User();
        $student->name = trim($request->name);
        $student->last_name = trim($request->last_name);
        $student->student_number = trim($request->student_number);
        $student->class_id = trim($request->class_id);
        $student->gender = trim($request->gender);

        if(!empty($request->date_of_birth))
        {
            $student->date_of_birth = trim($request->date_of_birth);
        }

        if(!empty($request->file('profile_pic')))
        {
            $ext = $request->file('profile_pic')->getClientOriginalExtension();
            $file = $request->file('profile_pic');
            $randomStr = date('Ymdhis').Str::random(20);
            $filename = strtolower($randomStr).'.'.$ext;
            $file->move('upload/profile', $filename);

            $student->profile_pic = $filename;
        }

        $student->religion = trim($request->religion);
        $student->mobile_number = trim($request->mobile_number);



        $student->blood_group = trim($request->blood_group);
        $student->height = trim($request->height);
        $student->weight = trim($request->weight);
        $student->email = trim($request->email);
        $student->user_type = 3;
        $student->save();

        return redirect()->back()->with('success', "Account Successfully Updated");
    }
    public function change_password()
    {
        $data['header_title'] = "Change Password";
        return view('profile.change_password', $data);
    }

    public function update_change_password(Request $request)
    {
        $user = User::getSingle(Auth::user()->id);
        if(Hash::check($request->old_password, $user->password))
        {
            $user->password = Hash::make($request->new_password);
            $user->save();
            return redirect()->back()->with('success',"Password Successfully Updated");
        }
        else
        {
            return redirect()->back()->with('error', "Old Password is not Correct");
        }
    }
}
