@extends('layouts.app')

@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Student List (Total : {{ $getRecord->total() }})</h1>
          </div>
        <div class="col-sm-6" style="text-align: right;">
          <a href="{{ url('admin/student/add') }}" class="btn btn-primary">Add New Student</a>
        </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main Content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
            <!-- /.col -->
            <div class="col-md-12">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Search Student</h3>
              </div>
              <form method="get" action="">
                <div class="card-body">
                <div class="row">
                <div class="form-group col-md-2">
                    <label>First Name</label>
                    <input type="text" class="form-control" name="name" value="{{ Request::get('name') }}" placeholder="First Name">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Last Name</label>
                    <input type="text" class="form-control" name="last_name" value="{{ Request::get('last_name') }}" placeholder="Last Name">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Student Number</label>
                    <input type="text" class="form-control" name="student_number" value="{{ Request::get('student_number') }}" placeholder="Student Number">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Gender</label>
                    <select class="form-control" name="gender">
                      <option  value="">Select Gender</option>
                      <option {{ (Request::get('gender') == 'Male') ? 'selected' : '' }} value="Male">Male</option>
                      <option {{ (Request::get('gender') == 'Female') ? 'selected' : '' }} value="Female">Female</option>
                      <option {{ (Request::get('gender') == 'Other') ? 'selected' : '' }} value="Other">Other</option>
                    </select>
                  </div>
                  <div class="form-group col-md-2">
                    <label>Course</label>
                    <input type="text" class="form-control" name="class" value="{{ Request::get('class') }}" placeholder="Course">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Select Status</label>
                    <select class="form-control" name="status">
                      <option  value="">Status</option>
                      <option {{ (Request::get('status') == 100) ? 'selected' : '' }} value="100">Active</option>
                      <option {{ (Request::get('status') == 1) ? 'selected' : '' }} value="1">Inactive</option>
                    </select>
                  </div>
                  <div class="form-group col-md-2">
                    <label>Email</label>
                    <input type="text" class="form-control" name="email" value="{{ Request::get('email') }}" placeholder="Email">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Date</label>
                    <input type="date" class="form-control" name="date" value="{{ Request::get('date') }}" placeholder="Date">
                  </div>
                  <div class="form-group col-md-2">
                    <button class="btn btn-primary" type="submit" style="margin-top: 31px;">Search</button>
                    <a href="{{ url('admin/student/list') }}" class="btn btn-success" style="margin-top: 31px;">Reset</a>
                  </div>
                </div>
                </div>
              </form>
            </div>

                @include('_message')
                <!-- /.card -->
                <div class="card">
              <div class="card-header">
                <h3 class="card-title">Student List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0" style="overflow: auto;">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Profile Picture</th>
                      <th>Full Name</th>
                      <th>Student Number</th>
                      <th>Gender</th>
                      <th>Course</th>
                      <th>Admission Date</th>
                      <th>Status</th>
                      <th>Email</th>
                      <th>Created Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                   @foreach($getRecord as $value)
                   <tr>
                    <td>{{ $value->id }}</td>
                    <td>
                      @if(!empty($value->getProfile()))
                      <img src="{{ $value->getProfile() }}" style="height: 50px; width: 50px; border-radius: 50px">
                      @endif
                    </td>
                    <td>{{ $value->name }} {{ $value->last_name }}</td>
                    <td>{{ $value->student_number }}</td>
                    <td>{{ $value->gender }}</td>
                    <td>{{ $value->class_name }}</td>
                    <td>{{ $value->admission_date }}</td>
                    <td>{{ ($value->status == 0) ? 'Active' : 'Inactive'  }}</td>
                    <td>{{ $value->email }}</td>
                    <td>{{ date('d-m-Y H:i A', strtotime ($value->created_at)) }}</td>
                    <td style="min-width: 150px">
                      <a href="{{ url('admin/student/edit/'.$value->id) }}" class="btn btn-primary btn-sm">Edit</a>
                      <a href="{{ url('admin/student/delete/'.$value->id) }}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                   </tr>
                   @endforeach
                  </tbody>
                </table>
              <div style="padding: 10px; float: right;">
                {!! $getRecord->appends(Illuminate\Support\Facades\Request::except('page'))->links() !!}
              </div>
              </div>

              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

  @endsection