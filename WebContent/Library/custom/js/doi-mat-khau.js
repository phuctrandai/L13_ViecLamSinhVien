var error = "", message = "";

var tieuDeThongBao = $('#tieuDeThongBao'),
noiDungThongBao = $('#noiDungThongBao'),
thongBaoModal = $('#thongBaoModal'),
closeModal = $('#closeModal'),
current = null,
capNhatThanhCong = false,
checkMatKhauCu = false;

var matKhauCu = $('#matKhauCu'),
matKhauMoi = $('#matKhauMoi'),
matKhauXacNhan = $('#matKhauXacNhan');

/*
 * validate mat khau
 */
function validateMatKhau() {    
    if(matKhauCu.val().length == 0) {
        thongBao("Lỗi", "Mật khẩu cũ không được trống!");
        current = matKhauCu;
        return false;
    }
    if(matKhauMoi.val().length == 0) {
        thongBao("Lỗi", "Mật khẩu mới không được trống!");
        current = matKhauMoi;
        return false;
    }
    if(matKhauXacNhan.val().length == 0) {
        thongBao("Lỗi", "Mật khẩu xác nhận không được trống!");
        current = matKhauXacNhan;
        return false;
    }
    if(matKhauMoi.val() != matKhauXacNhan.val()) {
        thongBao("Lỗi", "Xác nhận mật khẩu không đúng!");
        current = matKhauXacNhan;
        return false;
    }
    if(!checkMatKhauCu) {
        thongBao("Lỗi", "Mật khẩu cũ không đúng!");
        current = matKhauCu;
        return false;
    }
    luuMatKhau();
}

function luuMatKhau() {
    $("#wait").fadeIn(0);
    $('#wait').after('<div class="modal-backdrop fade show"></div>');
    $.post('taiKhoan',
    {
        command: 'luuMatKhau',
        matKhauMoi: matKhauMoi.val()
    },
    function(data, status) {
        setTimeout(function(){
            if(data == 'OK') {
                thongBao('Thông báo', 'Thay đổi thành công!');
                $('#alertMode').removeClass('alert-danger');
                $('#alertMode').addClass('alert-success');
                $('#closeModal').removeClass('btn-danger');
                $('#closeModal').addClass('btn-success');
                capNhatThanhCong = true;
            } 
            else {
                thongBao('Lỗi', data);
                capNhatThanhCong = false;
            }
        
            $("#wait").fadeOut(0);
            $('.modal-backdrop').remove();
        }, 1500);
    });
}

$(document).ajaxError(function(){
    alert("An error occurred!");
});

matKhauCu.keyup(function(){
    if(matKhauCu.val() > 0) {
        $('#nofiMatKhauCu').remove();
    }
    if(matKhauCu.val().length == 0) {
        $('#nofiMatKhauCu').remove();
        matKhauCu.after('<p id="nofiMatKhauCu" class="text-danger mt-1">Mật khẩu cũ không được trống!</p>');
        return true;
    }
    else {
        $.post('taiKhoan',
        {
            command: 'checkMatKhauCu',
            matKhauCu: matKhauCu.val(),
        }, 
        function(data, status) {
            if(data == 'NOTOK') {
                $('#nofiMatKhauCu').remove();
                matKhauCu.after('<p id="nofiMatKhauCu" class="text-danger mt-1">Mật khẩu cũ không đúng!</p>');
                checkMatKhauCu = false;
            }
            else if(data == 'OK') {
                $('#nofiMatKhauCu').remove();
                $('#matKhauCuLabel').after('<span id="nofiMatKhauCu" class="text-success mt-1 ml-4">&#10003;</span>');
                checkMatKhauCu = true;
            }
        });
    }
});
matKhauMoi.keyup(function(){
    if(matKhauMoi.val().length == 0) {
        $('#nofiMatKhauMoi').remove();
        matKhauMoi.after('<p id="nofiMatKhauMoi" class="text-danger mt-1">Mật khẩu mới không được trống!</p>');
        return false;
    }
    else if(matKhauMoi.val() == matKhauCu.val()) {
        $('#nofiMatKhauMoi').remove();
        matKhauMoi.after('<p id="nofiMatKhauMoi" class="text-danger mt-1">Mật khẩu mới không được trùng với mật khẩu cũ!</p>');
        return false;
    }
    else {
        $('#nofiMatKhauMoi').remove();
        $('#matKhauMoiLabel').after('<span id="nofiMatKhauMoi" class="text-success mt-1 ml-4">&#10003;</span>');
        return true;
    }
});
matKhauXacNhan.keyup(function(){
    if(matKhauXacNhan.val().length == 0) {
        $('#nofiMatKhauXacNhan').remove();
        matKhauXacNhan.after('<p id="nofiMatKhauXacNhan" class="text-danger mt-1">Mật khẩu xác nhận không được trống!</p>');
        return false;
    }
    else if(matKhauMoi.val() != matKhauXacNhan.val()) {
        $('#nofiMatKhauXacNhan').remove();
        matKhauXacNhan.after('<p id="nofiMatKhauXacNhan" class="text-danger mt-1">Xác nhận mật khẩu không đúng!</p>');
        return false;
    }
    else {
        $('#nofiMatKhauXacNhan').remove();
        $('#matKhauXacNhanLabel').after('<span id="nofiMatKhauXacNhan" class="text-success mt-1 ml-4">&#10003;</span>');
        return true;
    }
});

/*
 * Hien thong bao
 */
function thongBao(error, message) {    
    tieuDeThongBao.html(error);
    noiDungThongBao.html(message);
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
        window.location.replace("http://localhost:8081/L13_ViecLamSinhVien/sinhVien");
    } else {
        thongBaoModal.fadeOut(100);
        closeModal.fadeOut(500);
        $('.modal-backdrop').remove();
        current.focus();
    }
});