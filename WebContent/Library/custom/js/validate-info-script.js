/**
 * Check du lieu nhap vao
 */
// Thong tin chung
var hoTen = $('#hoTen'),    ngaySinh = $('#ngaySinh'),    gioiTinh = $('#gioiTinh'),    
danToc = $('#danToc'),    quocTich = $('#quocTich'),    cMND = $('#cMND'),    noiCapCMND = $('#noiCapCMND');
// Thong tin lien he
var diaChi = $('#diaChi'),    email = $('#email'),    soDienThoai = $('#soDienThoai');
// Thong tin dao tao
var maTruong = $('#tenTruong'),    maNganh = $('#tenNganh'),    nienKhoa = $('#nienKhoa'),    ngayKyQuyetDinh = $('#ngayKyQuyetDinh'),
    soQuyetDinhTotNghiep = $('#soQuyetDinhTotNghiep'),    thoiGianTotNghiep = $('#thoiGianTotNghiep');
// Thong tin viec lam
var tenCongViec = $('#tenCongViec');
// Thong bao
var tieuDeThongBao = $('#tieuDeThongBao'),
    noiDungThongBao = $('#noiDungThongBao'),
    thongBaoModal = $('#thongBaoModal'),
    closeModal = $('#closeModal'),

    error = 'Lỗi',
    message = '',
    capNhatThanhCong = false;

/*
 * Check thong tin khi khai báo
 */
$('#capNhatBtn').click(function() {    
    var isOK = true;
    if( !validString(hoTen.val(), 'họ tên')) { thongBao(error, message); return; }
    
    if(!validDate(ngaySinh.val(), 'ngày sinh')) { thongBao(error, message); return; }
    
    if(!validString(danToc.val(), 'dân tộc')) { thongBao(error, message); return ;}
    
    if(!validString(quocTich.val(), 'quốc tịch')) { thongBao(error, message); return; }
    
    if(!validCMND(cMND.val())) { thongBao(error, message); return ;}
    
    if(!validString(noiCapCMND.val(), 'nơi cấp chứng minh nhân dân')) { thongBao(error, message); return;}
    
    if(!validString(diaChi.val(), 'địa chỉ')) { thongBao(error, message); return ;}
    
    if(!validEmail(email.val())) { thongBao(error, message); return; }
    
    if(!validSDT(soDienThoai.val())) { thongBao(error, message); return;}
    
    if(!validNienKhoa(nienKhoa.val(), 'niên khóa')) { thongBao(error, message); return;}
    
    if(!validDate(thoiGianTotNghiep.val(), 'thời gian tốt nghiệp')) { thongBao(error, message); return;}
    
    if(!validString(soQuyetDinhTotNghiep.val(), 'số quyết định tốt nghiệp')) { thongBao(error, message); return ;}
    
    if(!validDate(ngayKyQuyetDinh.val(), 'ngày ký quyết định tốt nghiệp')) { thongBao(error, message); return;}
    
    if($('#dangDiLam').css('display') == 'block') {    
        if( !validString($('#tenCongViec').val(), 'tên công việc')) {
            thongBao(error, message); return;
        }
        if(!validDate($('#thoiGianBatDauLamViec').val(), 'thời gian bắt đầu làm việc')) {
            thongBao(error, message); return;
        }
    } else if($('#dangHocNangCao').css('display') == 'block') {
        if(!validNienKhoa($('#nienKhoaNangCao').val(), 'niên khóa học nâng cao')) {
            thongBao(error, message); return;
        }
    }
    capNhat();
});

/*
 * Gui request cap nhat
 */
function capNhat() {
    $("#wait").fadeIn(0);
    $('#wait').after('<div class="modal-backdrop fade show"></div>');
    
    var maSinhVien = $('#maSinhVien').val();    
    if($('#dangDiLam').css('display') == 'block') {
        $.post('sinhVien',
        {
            command : "capNhat",
            maSinhVien : maSinhVien,
            
            hoVaTen : hoTen.val(),  ngaySinh : ngaySinh.val(),  gioiTinh : gioiTinh.val(),
            danToc : danToc.val(),  quocTich : quocTich.val(),  soCMND : cMND.val(),
            noiCapCMND : noiCapCMND.val(),  ngayCapCMND : ngaySinh.val(),
            
            diaChi : diaChi.val(),  email : email.val(),    soDienThoai : soDienThoai.val(),
            
            maTruong : maTruong.val(),  maNganh : maNganh.val(),    nienKhoa : nienKhoa.val(),
            soQuyetDinh : soQuyetDinhTotNghiep.val(),   ngayKyQuyetDinh : ngayKyQuyetDinh.val(),
            thoiGianTotNghiep : thoiGianTotNghiep.val(),
            
            tinhTrangViecLam : 'dangDiLam',
            tenCongViec : tenCongViec.val(),
            viTriCongTac : $('#viTriCongTac').val(),
            tenCoQuan : $('#tenCoQuan').val(),
            diaChiCoQuan : $('#diaChiCoQuan').val(),
            mucDoPhuHopChuyenMon : $('#mucDoPhuHopChuyenMon').val(),
            mucDoDapUngKTCM : $('#mucDoDapUngKTCM').val(),
            loaiHinhCoQuan : $('#loaiHinhCoQuan').val(),
            thoiGianBatDauLamViec : $('#thoiGianBatDauLamViec').val(),
            mucThuNhapTBThang : $('#mucThuNhapTBThang').val()
            
        }, function(data, status) {
            callBack(data, status);
        }); 
        
    } else if($('#dangHocNangCao').css('display') == 'block') {
        $.post('sinhVien',
        {
            command : 'capNhat',
            maSinhVien : maSinhVien,
            
            hoVaTen : hoTen.val(),  ngaySinh : ngaySinh.val(),  gioiTinh : gioiTinh.val(),
            danToc : danToc.val(),  quocTich : quocTich.val(),  soCMND : cMND.val(),
            noiCapCMND : noiCapCMND.val(),  ngayCapCMND : ngaySinh.val(),
            
            diaChi : diaChi.val(),  email : email.val(),    soDienThoai : soDienThoai.val(),
            
            maTruong : maTruong.val(),  maNganh : maNganh.val(),    nienKhoa : nienKhoa.val(),
            soQuyetDinh : soQuyetDinhTotNghiep.val(),   ngayKyQuyetDinh : ngayKyQuyetDinh.val(),
            thoiGianTotNghiep : thoiGianTotNghiep.val(),
            
            maTruong : $('#tenTruongNangCao').val(),  
            maNganh : $('#tenNganhNangCao').val(),    
            nienKhoa : $('#nienKhoaNangCao').val(),
            trinhDoDaoTaoNangCao : $('#trinhDoDaoTaoNangCao').val(),
            hinhThucDaoTaoNangCao : $('#hinhThucDaoTaoNangCao').val(),
            
            tinhTrangViecLam : 'dangHocNangCao'
        }, function(data, status) {
            callBack(data, status);
        });
    } else {
        
        $.post('sinhVien',
        {
            command : 'capNhat',
            maSinhVien : maSinhVien,
            
            hoVaTen : hoTen.val(),  ngaySinh : ngaySinh.val(),  gioiTinh : gioiTinh.val(),
            danToc : danToc.val(),  quocTich : quocTich.val(),  soCMND : cMND.val(),
            noiCapCMND : noiCapCMND.val(),  ngayCapCMND : ngaySinh.val(),
            
            diaChi : diaChi.val(),  email : email.val(),    soDienThoai : soDienThoai.val(),
            
            maTruong : maTruong.val(),  maNganh : maNganh.val(),    nienKhoa : nienKhoa.val(),
            soQuyetDinh : soQuyetDinhTotNghiep.val(),   ngayKyQuyetDinh : ngayKyQuyetDinh.val(),
            thoiGianTotNghiep : thoiGianTotNghiep.val(),
            
            tinhTrangViecLam : 'thatNghiep'
        }, function(data, status) {
            callBack(data, status);
        }
        );
    }
    
    $(document).ajaxError(function(){
        alert("An error occurred!");
    });
}
/*
 * Callback
 */
function callBack(data, status) {
    setTimeout(function(){
        if(data == 'true') {
            thongBao('Thông báo', 'Cập nhật thông tin thành công!');
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
 * Validate date
 */
function validDate(value, subject) {
    let r = true;
    if(value == '') {
        message = 'Vui lòng chọn '+ subject +'!';
        r = false;
    }
    return r;
}/*
 /*
  * Validate email
  */
function validEmail(value) {
    let r = true;
    if(value == '') {
        message = 'Vui lòng nhập email !';
        r = false;
    } else {
        var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(!reg.test(value)) {
            message = 'Vui lòng nhập email đúng định dạng!';
            r = false;
        }
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
        message = 'Vui lòng nhập ' + subject + '!';
        r = false;
    } else if(/[a-z]|[A-Z]/.test(nienKhoa)) {
        message = 'Vui lòng không nhập ký tự chữ vào '+ subject +'!';
        r = false;
    }
    return r;
}/*
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
    }
});