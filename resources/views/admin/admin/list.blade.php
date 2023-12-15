@extends('layouts.app')

@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Admin List (Total : {{ $getRecord->total() }})</h1>
          </div>
        <div class="col-sm-6" style="text-align: right;">
          <a href="{{ url('admin/admin/add') }}" class="btn btn-primary">Add New Admin</a>
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
                <h3 class="card-title">Search Admin</h3>
              </div>
              <form method="get" action="">
                <div class="card-body">
                <div class="row">
                <div class="form-group col-md-2">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" value="{{ Request::get('name') }}" placeholder="Name">
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
                    <a href="{{ url('admin/admin/list') }}" class="btn btn-success" style="margin-top: 31px;">Reset</a>
                  </div>
                </div>
                </div>
              </form>
            </div>

                @include('_message')
                <!-- /.card -->
                <div class="card">
              <div class="card-header">
                <h3 class="card-title">Admin List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Created Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                   @foreach($getRecord as $value)
                   <tr>
                    <td>{{ $value->id }}</td>
                    <td>{{ $value->name }}</td>
                    <td>{{ $value->email }}</td>
                    <td>{{ date('d-m-Y H:i A', strtotime ($value->created_at)) }}</td>
                    <td style="min-width: 150px">
                      <a href="{{ url('admin/admin/edit/'.$value->id) }}" class="btn btn-primary btn-sm">Edit</a>
                      <a href="{{ url('admin/admin/delete/'.$value->id) }}" class="btn btn-danger btn-sm">Delete</a>
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