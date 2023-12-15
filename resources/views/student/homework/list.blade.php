@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>My Homework</h1>
                </div>
           
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">

                <div class="card">
              <div class="card-header">
                <h3 class="card-title">Search My Homework</h3>
              </div>
              <form method="get" action="">
                <div class="card-body">
                <div class="row">
                
                  <div class="form-group col-md-3">
                    <label>Subject</label>
                    <input type="text" class="form-control" name="subject_name" value="{{ Request::get('subject_name') }}" placeholder="Subject Name">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Homework Date From</label>
                    <input type="date" class="form-control" name="from_homework_date" value="{{ Request::get('from_homework_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Homework Date To</label>
                    <input type="date" class="form-control" name="to_homework_date" value="{{ Request::get('to_homework_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Submission Date From</label>
                    <input type="date" class="form-control" name="from_submission_date" value="{{ Request::get('from_submission_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Submission Date To</label>
                    <input type="date" class="form-control" name="to_submission_date" value="{{ Request::get('to_submission_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Created Date From</label>
                    <input type="date" class="form-control" name="from_created_date" value="{{ Request::get('from_created_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <label>Created Date To</label>
                    <input type="date" class="form-control" name="to_created_date" value="{{ Request::get('to_created_date') }}">
                  </div>
                  <div class="form-group col-md-2">
                    <button class="btn btn-primary" type="submit" style="margin-top: 31px;">Search</button>
                    <a href="{{ url('student/my_homework') }}" class="btn btn-success" style="margin-top: 31px;">Reset</a>
                  </div>
                </div>
                </div>
              </form>
            </div>

                @include('_message')
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Homework List</h3>
                    </div>
                    <div class="card-body p-0">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Course</th>
                                    <th>Subject</th>
                                    <th>Homework Date</th>
                                    <th>Submission Date</th>
                                    <th>Document</th>
                                    <th>Description</th>
                                    <th>Created By</th>
                                    <th>Created Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            @forelse($getRecord as $value)
                                    <tr>
                                        <td>{{ $value->id }}</td>
                                        <td>{{ $value->class_name }}</td>
                                        <td>{{ $value->subject_name }}</td>
                                        <td>{{ date('d-m-Y', strtotime($value->homework_date)) }}</td>
                                        <td>{{ date('d-m-Y', strtotime($value->submission_date)) }}</td>
                                        <td>
                                            @if(!empty($value->getDocument()))
                                                <a href="{{ $value->getDocument() }}" class="btn btn-primary" download="">Download</a>
                                            @endif
                                        </td>
                                        <td>
                                          {!! $value->description !!}
                                        </td>
                                        <td>{{ $value->created_by_name }}</td>
                                        <td>{{ date('d-m-Y', strtotime($value->created_at)) }}</td>
                                        <td>
                                          <a href="{{ url('student/my_homework/submit_homework/' . $value->id) }}" class="btn btn-primary btn-sm">Submit Homework</a>

                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="100%">Record not found</td>
                                    </tr>
                                @endforelse
                            </tbody>
                            
                        </table>
                        <div style="padding: 10px; float: right;">
                        {!! $getRecord->appends(Illuminate\Support\Facades\Request::except('page'))->links() !!}
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </section>
</div> 
@endsection   