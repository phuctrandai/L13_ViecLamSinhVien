var tieuDeThongBao = $('#tieuDeThongBao'),
    noiDungThongBao = $('#noiDungThongBao'),
    thongBaoModal = $('#thongBaoModal'),
    closeModal = $('#closeModal'),

    error = 'Lỗi',
    message = '',
    checkMa = false;
    capNhatThanhCong = false;

var maTruong = $('#maTruong'),
tenTruong = $('#tenTruong'),
diaChi = $('#diaChi'),
email = $('#email'),
soDienThoai = $('#soDienThoai'),
soFax = $('#soFax');


/*
 * Check thong tin khi khai báo
 */
$('#saveBtn').click(function() {
    var isOK = true;
    $("#wait").css("display", "flex");
    if(     !validString(maTruong.val(), 'mã trường') ||
            
            !checkMaTruong(maTruong.val()) ||
                        
            !validString(tenTruong.val(), 'tên trường') ||
            
            !validString(diaChi.val(), 'địa chỉ') ||
            
            !validSDT(soDienThoai.val(), 'số điện thoại') ||
            
            !validSDT(soFax.val(), 'số fax')
        )
        {
            isOK = false;
        }
        
        if(!isOK) {
            setTimeout(function(){ 
                thongBao(error, message);
                $("#wait").css("display", "none");
            }, 1000);
        } else {
            capNhat();
        }
});

/*
 * Gui request cap nhat
 */
function capNhat() {
//    $("#wait").css("display", "flex");
        
    $.post('truong',
    {
        command : "save",
        matruong : maTruong.val(),
        tentruong : tenTruong.val(),
        diachi : diaChi.val(),
        loaitruong : $('#loaiTruong').val(),
        email : email.val(),
        loaihinh : $('#loaiHinh').val(),
        sdt : soDienThoai.val(),
        sofax : soFax.val(),
        tinhthanhtructhuoc : $('#tinhThanh').val(),
        website : $('#website').val()            
        
    }, function(data, status) {
        if(data === '1' && status === 'success') {
            
            setTimeout(function(){ 
                thongBao('Thông báo', 'Cập nhật thông tin thành công!');
                $('#alertMode').removeClass('alert-danger');
                $('#alertMode').addClass('alert-success');
                $('#closeModal').removeClass('btn-danger');
                $('#closeModal').addClass('btn-success');
                $("#wait").css("display", "none");
                capNhatThanhCong = true;
            }, 3000);
            
        } else {
            thongBao('Lỗi', 'Có lỗi khi khai báo trường!');
        }
    });
}

/*
 * Check ma truong ton tai chua
 */
function checkMaTruong() {
//    $("#wait").css("display", "flex");
    
    $.post('truong',
        {
            command : "checkMaTruong",
            matruong : maTruong.val()
        },
        function(data, status) {
            if(data === '1') {
                error = 'Thông báo';
                message = 'Mã trường đã tồn tại, vui lòng nhập mã khác!';
                checkMa = false;
            }
            else {
                checkMa = true;
            }
//            $("#wait").css("display", "none");
        }
    );
    return checkMa;
}

/*
 * Validate string
 */
var format = /[!@#$%^&*()_+\=\[\]{};':"\\|,.<>\/?]/;
function validString(value, subject) {
    var r = true;
    
    if(value == '') {
        message = 'Vui lòng nhập '+ subject +'!';
        r = false;
    } else if(format.test(value)) {
        message = 'Vui lòng không nhập ký tự đặc biệt vào '+ subject +'!';
        r = false;
    } else if((subject != 'địa chỉ' && subject != 'mã trường') && /[0-9]/.test(value)) {
        message = 'Vui lòng không nhập ký tự số vào '+ subject +'!';
        r = false;
    }
    return r;
}

/*
 * Check so dien thoai
 */
function validSDT(sdt, subject) {
    let r = true;
    if(sdt == '') {
        message = 'Vui lòng nhập '+ subject +'!';
        r = false;
    } else if(/[a-z | A-Z]/.test(sdt) || format.test(sdt)) {
        message = 'Vui lòng không nhập ký tự đặc biệt vào '+ subject +'!';
        r = false;
    }
    return r;
}

/*
 * Hien thong bao
 */
function thongBao(tieuDe, noiDung) {    
    tieuDeThongBao.html(tieuDe);
    noiDungThongBao.html(noiDung);
    thongBaoModal.fadeIn(200);
    thongBaoModal.after('<div class="modal-backdrop fade show"></div>');
    closeModal.fadeIn(1);
}

/*
 * An thong bao
 */
closeModal.click(function(){
    if(capNhatThanhCong) {
        capNhatThanhCong = false;
        window.location.replace("http://localhost:8081/L13_ViecLamSinhVien/truong");
    } else {
        thongBaoModal.fadeOut(100);
        closeModal.fadeOut(500);
        $('.modal-backdrop').remove();
    }
});