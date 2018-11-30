var hoTen = $('#hoTen'),
    ngaySinh = $('#ngaySinh'),
    danToc = $('#danToc'),
    quocTich = $('#quocTich'),
    cMND = $('#cMND'),
    noiCapCMND = $('#noiCapCMND'),
    diaChi = $('#diaChi'),
    email = $('#email'),
    soDienThoai = $('#soDienThoai'),
    tenCongViec = $('#tenCongViec'),
    nienKhoa = $('#nienKhoa'),
    ngayKyQuyetDinh = $('#ngayKyQuyetDinh'),
    soQuyetDinhTotNghiep = $('#soQuyetDinhTotNghiep'),
    thoiGianTotNghiep = $('#thoiGianTotNghiep');

var tieuDeThongBao = $('#tieuDeThongBao'),
    noiDungThongBao = $('#noiDungThongBao'),
    thongBaoModal = $('#thongBaoModal'),
    closeModal = $('#closeModal'),

    error = 'Lỗi',
    message = '';
/*
 * Check ngày tháng khi khai báo
 */
function checkNgayThang() {
    var isOK = true;
     
    if( !validString(hoTen.val(), 'họ tên') ||
            
        !validString(danToc.val(), 'dân tộc') ||
        
        !validString(quocTich.val(), 'quốc tịch') ||
        
        !validString(noiCapCMND.val(), 'nơi cấp chứng minh nhân dân') ||
        
        !validString(diaChi.val(), 'địa chỉ') ||
        
        !validNienKhoa(nienKhoa.val()) ||
        
        !validCMND(cMND.val()) ||
        
        !validSDT(soDienThoai.val()) ||
        
        !validNienKhoa(nienKhoa.val(), 'niên khóa') ||
        
        !validDate(ngaySinh.val(), 'ngày sinh') ||
        
        !validDate(thoiGianTotNghiep.val(), 'thời gian tốt nghiệp') ||
        
        !validDate(ngayKyQuyetDinh.val(), 'ngày ký quyết định tốt nghiệp') ||
        
        !validString(soQuyetDinhTotNghiep.val(), 'số quyết định tốt nghiệp')
    )
    {
        isOK = false;
    }
    
    if($('#dangDiLam').css('display') == 'block') {
        
        if( !validString($('#tenCongViec').val(), 'tên công việc') ||
            !validDate($('#thoiGianBatDauLamViec').val(), 'thời gian bắt đầu làm việc'))
        {
            
            isOK = false;
        }
    } else if($('#dangHocNangCao').css('display') == 'block') {
        
        if(!validNienKhoa($('#nienKhoaNangCao').val(), 'niên khóa học nâng cao')) {
            isOK = false;
        }
    }
    
    if(!isOK) {
        thongBao(error, message);
    }
    return false;
}

/*
 * Validate string
 */
var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
function validString(value, subject) {
    var r = true;
    
    if(value == '') {
        message = 'Vui lòng nhập '+ subject +'!';
        r = false;
    } else if(format.test(value)) {
        message = 'Vui lòng không nhập ký tự đặc biệt vào '+ subject +'!';
        r = false;
    } else if((subject != 'địa chỉ' && subject != 'số quyết định tốt nghiệp') && /[0-9]/.test(value)) {
        message = 'Vui lòng không nhập ký tự số vào '+ subject +'!';
        r = false;
    }
    return r;
} 

/*
 * Validate date
 */
function validDate(value, subject) {
    let r = true;
    if(value == '') {
        message = 'Vui lòng nhập '+ subject +'!';
        r = false;
    }
    return r;
}

/*
 * Validate so CMND
 */
function validCMND(cmnd) {
    let r = true;
    if(cmnd == '') {
        message = 'Vui lòng nhập số chứng minh nhân dân!';
        r = false;
    } else if(/[a-z | A-Z]/.test(cmnd) || format.test(cmnd)) {
        message = 'Vui lòng không nhập ký tự đặc biệt vào số chứng minh nhân dân!';
        r = false;
    } else if(cmnd.length < 9) {
        message = 'Số chứng minh nhân dân quá ngắn!';
        r = false;
    } else if(cmnd.length > 11) {
        message = 'Số chứng minh nhân dân quá dài!';
        r = false;
    }
    return r;
}

/*
 * Check so dien thoai
 */
function validSDT(sdt) {
    let r = true;
    if(sdt == '') {
        message = 'Vui lòng nhập số điện thoại!';
        r = false;
    } else if(/[a-z | A-Z]/.test(sdt) || format.test(sdt)) {
        message = 'Vui lòng không nhập ký tự đặc biệt vào số điện thoại!';
        r = false;
    }
    return r;
}

/*
 * Check nien khoa
 */
function validNienKhoa(nienKhoa, subject) {
    let r = true;
    if(nienKhoa == '') {
        message = 'Vui lòng nhập niên khóa!';
        r = false;
    } else if(/[a-z]|[A-Z]/.test(nienKhoa)) {
        message = 'Vui lòng không nhập ký tự chữ vào '+ subject +'!';
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
 * Preview anh dai dien
 */
//*
$("#anhDaiDien").on('change', function () {

        if (typeof (FileReader) != "undefined") {

            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image-holder').css('background-image', 'url(' + e.target.result + ')');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            alert("This browser does not support FileReader.");
        }
    });
//*

/*
 * An thong bao
 */
closeModal.click(function(){
    thongBaoModal.fadeOut(100);
    closeModal.fadeOut(500);
    $('.modal-backdrop').remove();
});

/*
 * Ẩn và hiện các tab thông tin việc làm
 */
$(document).ready(function () {
    var dangDiLamOption = $("#dangDiLamOption");
    var dangHocNangCaoOption = $('#dangHocNangCaoOption');
    var thatNghiepOption = $('#thatNghiepOption');

    var dangDiLamTab = $('#dangDiLam');
    var dangHocNangCaoTab = $('#dangHocNangCao');
    var thatNghiepTab = $('#thatNghiep');

    dangDiLamOption.click(function () {
        dangDiLamTab.removeClass('fade');
        dangHocNangCaoTab.removeClass('active');
        thatNghiepTab.removeClass('active');

        dangDiLamTab.addClass('active');
        dangHocNangCaoTab.addClass('fade');
        thatNghiepTab.addClass('fade');
    });
    dangHocNangCaoOption.click(function () {
        dangDiLamTab.removeClass('active');
        dangHocNangCaoTab.removeClass('fade');
        thatNghiepTab.removeClass('active');

        dangDiLamTab.addClass('fade');
        dangHocNangCaoTab.addClass('active');
        thatNghiepTab.addClass('fade');
    });
    thatNghiepOption.click(function () {
        dangDiLamTab.removeClass('active');
        dangHocNangCaoTab.removeClass('active');
        thatNghiepTab.removeClass('fade');

        dangDiLamTab.addClass('fade');
        dangHocNangCaoTab.addClass('fade');
        thatNghiepTab.addClass('active');
    });
});