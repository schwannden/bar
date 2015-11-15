Date.prototype.addDays = function(days) {
    var dat = new Date(this.valueOf());
    dat.setDate(dat.getDate() + days);
    return dat;
};

var startDate;
var endDate;
var totalDays = 0;

$(function() {
    var startPicker = $('#start-date');
    var endPicker = $('#end-date');


    $('.btn-control-amount-minus').click(function() {
		var amtCtrl=$(this).parents('.control-amount').first().find('.amount');
		if (amtCtrl.val() > 0)
			amtCtrl.val(amtCtrl.val() - 1).trigger('change');
    });

    $('.btn-control-amount-plus').click(function() {
		var amtCtrl=$(this).parents('.control-amount').first().find('.amount');
		var max_str = amtCtrl.attr('max');
		if (!max_str || amtCtrl.val() < ~~max_str)
			amtCtrl.val(~~amtCtrl.val() + 1).trigger('change');
    });

	$('.control-amount').bind('input change propertychange', function() {
		startPicker.datepicker('update');
		endPicker.datepicker('update');
	});

	$('.reset').click(function() {
		$('#rent-form')[0].reset();
		startPicker.datepicker('update', '');
		endPicker.datepicker('update', '');
		startPicker.datepicker('setEndDate', new Date('9999/12/31'));
		endPicker.datepicker('setStartDate', new Date('1/1/1'));
		startDate = undefined;
		endDate = undefined;
		totalDays = 0;

		$('#total-days').text('共 0 天');
		$('#total-price').text('共 0 元');

		return false;
	});

	startPicker.datepicker({
		beforeShowDay: getDateAvailable,
		//daysOfWeekDisabled: [0,6]
	}).on('changeDate', function(e) {
		if (!endDate) {
			endDate = e.date;
			endPicker.datepicker('setDate', e.date);
		}

		if (!validateDateRange(e.date, endDate)) {
			alert('範圍中有不可租借的日期，請重選');
			startPicker.datepicker('setDate', startDate);
			return;
		}
		startDate = e.date;
		endPicker.datepicker('setStartDate', startDate);
	});
	endPicker.datepicker({
		beforeShowDay: getDateAvailable,
		//daysOfWeekDisabled: [0,6]
	}).on('changeDate', function(e) {
		if (!startDate) {
			startDate = e.date;
			startPicker.datepicker('setDate', e.date);
		}

		if (!validateDateRange(startDate, e.date)) {
			alert('範圍中有不可租借的日期，請重選');
			endPicker.datepicker('setDate', endDate);
			return;
		}
		endDate = e.date;
		startPicker.datepicker('setEndDate', endDate);
	});

});

function getDateAvailable(currentDate) {
	var buckets = {};
	for(var i = 0; i < orders.length; i++) {
		var order = orders[i];
		if (order.end_date.getTime() < currentDate.getTime() ||
			order.start_date.getTime() > currentDate.getTime())
			continue;
		for(var j = 0; j < order.buckets.length; j++) {
			var order_bucket = order.buckets[j];
			var bucket_hash = '#bucket-' + order_bucket.id;

			if (!buckets[bucket_hash]) {
				var bucketDOM = $(bucket_hash);
				buckets[bucket_hash] = {
					count: ~~bucketDOM.data('max-quantity'),
					wanted: ~~bucketDOM.find('.amount').first().val()
				};
			}

			var bucket = buckets[bucket_hash];
			bucket.count -= order_bucket.quantity;

			if (bucket.count < bucket.wanted) {
				return false;
			}
		}
	}
	return true;
}

function validateDateRange(startDate, endDate) {
    var currentDate = startDate;
    totalDays = 0;
    while (currentDate <= endDate) {
		if(!getDateAvailable(currentDate))
			return false;
		totalDays++;
        currentDate = currentDate.addDays(1);
    }
    $('#total-days').text('共 ' + totalDays + ' 天');

    var totalPrice = 0;
    $.each($('.bucket'), function(i, bucket) {
		bucket = $(bucket);
		var price = ~~bucket.data('price');
		var quantity = ~~bucket.find('.amount').val();
		totalPrice += price * quantity * totalDays;
    });
    $('#total-price').text('共 ' + totalPrice + ' 元');
    return true;
}
