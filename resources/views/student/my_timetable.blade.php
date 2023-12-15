@extends('layouts.app')

@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>My Timetable</h1>
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

            @include('_message')

            @foreach($getRecord as $value)
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">{{ $value['name'] }}</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Week</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Room Number</th>
                        </tr>
                    </thead>
                  <tbody>
                    @foreach($value['week'] as $valueW)
                        <tr>
                            <td>{{ $valueW['week_name'] }}</td>
                            <td>{{ !empty($valueW['start_time']) ? date('h:i A', strtotime($valueW['start_time'])) : '' }}</td>
                            <td>{{ !empty($valueW['end_time']) ? date('h:i A', strtotime($valueW['end_time'])) : '' }}</td>
                            <td>{{ $valueW['room_number'] }}</td>
                        </tr>
                    @endforeach
                  </tbody>
                </table>
              </div> 
              </div>
              @endforeach
          

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

  @section('script')

  <script type="text/javascript">
    // Store the currently selected value
    var selectedValue = $('.getSubject').val(); // Store currently selected value

$('.getClass').change(function(){
    var class_id = $(this).val();
    $.ajax({
        url: "{{ url('admin/class_timetable/get_subject') }}",
        type: "POST",
        data:{
            "_token": "{{ csrf_token() }}",
            class_id: class_id,
        },
        dataType: "json",
        success: function(response){
            // Repopulate dropdown with new options
            $('.getSubject').empty().append(response.html);

            // Re-select the previously selected value, if it exists in the new options
            if (selectedValue && $('.getSubject option[value="' + selectedValue + '"]').length > 0) {
                $('.getSubject').val(selectedValue);
            }
        },
        error: function(xhr, status, error) {
            // Handle errors, if any
            console.log(xhr.responseText);
        }
    });
});


</script>


  @endsection