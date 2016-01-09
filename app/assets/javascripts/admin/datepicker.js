// Date Picker
$( function(){
$("#admin_available_no_repeat").val(JSON.parse($("#admin_available_filter").val())["dates"].join());
var prices = JSON.parse($("#admin_available_filter").val())["prices"];
$('#datepicker').datepicker({
  multidate: true,
});
$dp = $('.date').datepicker({
  multidate: true,
  autoclose: false,
  todayBtn: true,
  todayHighlight: true,
  showOnFocus: false,
  orientation: 'top',
  prices: JSON.parse($("#admin_available_filter").val())["prices"],
  decorateDate: function(date, context){
    var i = context.dates.contains(date);
    if (i !== -1)
      return date.getUTCDate() + 
        '<div style="color: #FF6369;"> $' + 
        context._o.prices[i] + '</div>';
    var selector = 
      'input[name="admin_available[start][]"], input[name="admin_available[end][]"]';
    var ranges = $('.input-daterange');
    var prices = $('input[name="admin_available[price][]"]');
    var n = ranges.size();
    for (i = 0 ; i < n ; i++) {
      var $this = $(ranges[i]);
      var range = $this.find(selector);
      var startDate = new Date($(range[0]).val());
      var endDate   = new Date($(range[1]).val());
      startDate.setHours(8);
      endDate.setHours(8);
      if ( date >= startDate && date <= endDate ) {
        var price = $(prices[i]).val();
        if (price === "")
          price = $('#admin_bucket_price').val();
        return date.getUTCDate() + 
          '<div style="color: #FF6369;"> $' + 
          price + '</div>';
      }
    }
    return date.getUTCDate();
  },
});

$dp.data('datepicker')._toggle_multidate = 
    function(date) {
      var ix = this.dates.contains(date);
      if (!date) {
          this.dates.clear();
      } else if (ix !== -1) {
          this.dates.remove(ix);
          this._o.prices.splice(ix, 1);
      } else {
          this.dates.push(date);
          var price = $('#admin_bucket_date_price').val();
          if(isNaN(parseFloat(price))) {
              price = $('#admin_tour_price').val();
          } else {
              price = parseFloat(price).toString();
          }
          this._o.prices.push(price);
      }
      if (typeof this.o.multidate === 'number')
          while (this.dates.length > this.o.multidate)
              this.dates.remove(0);
    };

$('.date').on('changeDate', function(){
  $("#admin_available_filter").val(JSON.stringify({
    dates: $('#admin_available_no_repeat').val().split(","),
    prices: $dp.data('datepicker')._o.prices
  }));
});
$(".datepicker").datepicker({
  onSelect: function() {
    $(this).data('datepicker').inline = true;                               
  },
  onClose: function() {
    $(this).data('datepicker').inline = false;
  }
});

var datePickerVisible = false;
$("#toggle-date-pick").click(function(e){
    var visibility = datePickerVisible? 'hide' : 'show'
    $(".date").datepicker(visibility);
    datePickerVisible = !datePickerVisible;
    e.preventDefault();
});
$('.input-daterange').datepicker({
  todayBtn: "linked",
  startLabel: "admin_available[start][]",
  endLabel: "admin_available[end][]"
});
$('.input-daterange, input[name="admin_available[price][]"]').on('focusout', function(){$('.date').datepicker('update');});
});
