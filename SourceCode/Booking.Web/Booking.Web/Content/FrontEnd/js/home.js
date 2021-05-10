$(document).ready(function() {
    btnck()
    GuestRoom();
    ChangePeople();
    ChangeRoom();
    //ChangeTitle();
    ChangeTickets()
    ChangeForm()
    $("#startdate").datepicker({
        numberOfMonths: 2,
        dateFormat: "D-dd/mm/yy",
        minDate: 0,
        onSelect: function(date) {
            var dt2 = $('#enddate');
            var startDate = $(this).datepicker('getDate');
            var minDate = $(this).datepicker('getDate');
            maxDate = $(this).datepicker('getDate');
            maxDate.setDate(maxDate.getDate() + 1);
            dt2.datepicker('setDate', maxDate);
            startDate.setDate(startDate.getDate() + 30);
            //sets dt2 maxDate to the last day of 30 days window
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker('option', 'minDate', maxDate);
            $(this).datepicker('option', 'minDate', minDate);
        }
    });
    $('#enddate').datepicker({
        numberOfMonths: 2,
        dateFormat: "D-dd/mm/yy",
    });
    $("#fromdate").datepicker({
        numberOfMonths: 2,
        dateFormat: "D-dd/mm/yy",
        minDate: 0,
        onSelect: function(date) {
            var dt2 = $('#todate');
            var startDate = $(this).datepicker('getDate');
            var minDate = $(this).datepicker('getDate');
            maxDate = $(this).datepicker('getDate');
            maxDate.setDate(maxDate.getDate() + 1);
            dt2.datepicker('setDate', maxDate);
            startDate.setDate(startDate.getDate() + 30);
            //sets dt2 maxDate to the last day of 30 days window
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker('option', 'minDate', maxDate);
            $(this).datepicker('option', 'minDate', minDate);
        }
    });
    $('#todate').datepicker({
        numberOfMonths: 2,
        dateFormat: "D-dd/mm/yy",
    });
    $('.test-room').click(function(e) {
        e.preventDefault();
        DateCount();
    });

    ChangeTym();
    DetailPicture();
    Utilities();
    BookNow();
    Review();
});

function btnck() {
    k = $('#ck-box').is(':checked');
    if (k == true) {
        $('.plane').show()
    } else {
        $('.plane').hide()
    }
}
///thay doi form
function ChangeForm() {
    $('.category  button').on('click', function() {
        $('.category  button').removeClass('active');
        $(this).addClass('active');
    });
    $('.btn-ht-location-ul  li').on('click', function() {
        $('.btn-ht-location-ul  li').removeClass('activity2');
        $(this).addClass('activity2');
        var id = $(this).attr('id');
        $('.isotope-item').removeClass('aclist')
        $('.iso-' + id).addClass('aclist')
        $('.aclist').addClass('animate__animated animate__zoomIn')
    });
}

function GuestRoom() {
    var mouse_is_inside = false;
    $('.guests-room').hide()
    $('.occupancy').click(function() {
        $('.guests-room').show();
    })

    $('.guests-room').hover(function() {
        mouse_is_inside = true;
    }, function() {
        mouse_is_inside = false;
    });
    $('body').mouseup(function() {
        if (!mouse_is_inside) $('.guests-room').hide();
    })
}

///tang giam nguoi
function ChangePeople() {
    $('.decrease-adult').click(function() {
        let val = $(this).siblings('input').val();
        if (val > 1) {
            $(this).siblings().val(--val)
            $('.number-adults').text(val);
        }

    });
    $('.increase-adult').click(function(e) {
        let val = $(this).siblings('input').val();
        $(this).siblings().val(++val)
        $('.number-adults').text(val);
    });
}

function ChangeRoom() {
    $('.decrease-room').click(function() {
        let val = $(this).siblings('input').val();
        if (val > 1) {
            $(this).siblings().val(--val)
            $('.number-room').text(val);
        }

    });
    $('.increase-room').click(function(e) {
        let val = $(this).siblings('input').val();
        $(this).siblings().val(++val)
        $('.number-room').text(val);
    });
}

function ChangeTitle() {
    $('.btn-private-harbourage').click(function() {
        $('.welcome-message-up').text("TÌM TỔ ẤM VỚI AGODA HOMES")
        $('.welcome-message-down').text("Rộng rãi hơn, chân thực hơn, nhiều lý do để đi du lịch hơn.")
    })
    $('.btn-hotel-home').click(function() {
        $('.welcome-message-up').text("KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA")
        $('.welcome-message-down').text("Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu")
    })
    $('.btn-plane-hotel').click(function() {
        $('.welcome-message-up').text("KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA")
        $('.welcome-message-down').text("Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu")
    })
    $('.btn-flight').click(function() {
        $('.welcome-message-up').text("ĐẶT VÉ MÁY BAY TỐT NHẤT TRÊN AGODA NGAY HÔM NAY")
        $('.welcome-message-down').text("Nhanh chóng tìm và đặt hơn 200 hãng hàng không trên toàn thế giới")
    })
    $('.btn-by-month').click(function() {
        $('.welcome-message-up').text("KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA")
        $('.welcome-message-down').text("Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu")
    })
}

///lua chon loai ve
function ChangeTickets() {
    $('.btn-common').click(function() {
        $('.txt-type-ticket').text("Phổ Thông")
    })
    $('.btn-economy').click(function() {
        $('.txt-type-ticket').text("Phổ Thông cao cấp")
    })
    $('.btn-business').click(function() {
        $('.txt-type-ticket').text("Thương gia")
    })
    $('.btn-vip-ticket').click(function() {
        $('.txt-type-ticket').text("Hạng nhất")
    })
}

//tym
function ChangeTym() {
    $('.btn-heart').click(function() {
        $('.fa-heart').toggleClass('fas heart');
    })
}

//Book now 
function BookNow() {
    $('.btn-book-now').click(function() {
        $('html, body').animate({
            scrollTop: $(".hp-section-header").offset().top
        }, 1);
        $(".btn-book-now").tooltip('close');
    })
    $(".btn-book-now").tooltip({
        show: { duration: 2000 }
    });
}
//chi tiet anh 
function DetailPicture() {
    $('.btn-addwish-b2').on('click', function(e) {
        e.preventDefault();
        $('.wrap-modal1').addClass('show-modal1')
    });
    $('.overlay-modal1 , .js-hide-modal1').on('click', function(e) {
        e.preventDefault();
        $('.wrap-modal1').removeClass('show-modal1')
    });
}

//Tiện ích
function Utilities() {
    $('.btn-utilities').on('click', function(e) {
        e.preventDefault();
        $('.wrap-modal2').addClass('show-modal2')
    });
    $('.overlay-modal2 , .btn-close-fac').on('click', function(e) {
        e.preventDefault();
        $('.wrap-modal2').removeClass('show-modal2')
    });
}

//Đánh giá
function Review() {
    $('.li-guest-reviews').on('click', function() {
        $('html, body').animate({
            scrollTop: $(".evaluate-guest").offset().top
        }, 0);
    });
    $('.li-general-rules').on('click', function() {
        $('html, body').animate({
            scrollTop: $(".general-rules").offset().top
        }, 0);
    });

}
//Tính ngày
function DateCount() {
    const priceday = []
    var start = $('#startdate').datepicker("getDate")
    var end = $('#enddate').datepicker("getDate")
    var diff = new Date(end - start)
    var days = diff / 1000 / 60 / 60 / 24;
    if (days >= 1) {
        $('.number-night').text(Math.round(days));
        for (var i = 0; i < $('.price-room-td').length; i++) {
            priceday.push($('#price-room-' + (i + 1)).text())
        }
        for (var i = 0; i < $('.price-room-td').length; i++) {
            $('#price-room-' + (i + 1)).text(priceday[i] * days);
        }
    }

}

//tinh tien 
function validateSelectBox(obj) {
    let total = []
    let item
    let s = 0
    roomId = $(obj).attr('id');
    roomNum = $("#" + roomId).val()
    priceNum = ($('#price-room-' + roomId).text());
    item = roomNum * priceNum
    total.push(item)
    for (let i = 0; i < total.length; i++) {
        s += total[i];
    }
    $('.price-text').text(item.toLocaleString());
}