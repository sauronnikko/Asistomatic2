jQuery(function() {

  jQuery('#period').change(function(){
    var period_id = jQuery(this).find('option:selected').val();
    jQuery.get('/periods/' + period_id + '/dates', function(data){
      jQuery("#period_work_dates_select").html(data);
    });
    return false;

  });


  jQuery('#period_schedules_select').change(function(){
    var schedule_id = jQuery(this).find('option:selected').val();
    jQuery.get('/schedules/' + schedule_id + '/schedule_blocks', function(data){
      jQuery("#period_schedules_schedule_blocks_checkboxes").html(data);
    });
    return false;

  });

});
