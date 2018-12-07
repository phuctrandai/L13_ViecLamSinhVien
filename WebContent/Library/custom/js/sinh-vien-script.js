/*
 * Preview anh dai dien
 */
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