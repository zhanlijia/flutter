/* 页面基本信息 */
var curSmallMapHeight       //当前小图高度


var smallmap_height = ($('#smallfile-div').height() / 3).toFixed(2) - 4
curSmallMapHeight = smallmap_height + 4


/* init vue data source */

var vm_basic = new Vue({
    el: '#review',
    data: {
        casemedicalid: '',
        curImgIndex: -1,
        tips: tips,
        fileinfo: [],
        patientinfo: {},
        mulitySelectedImg: [],
        selectedSmallMap: {},
        cur_display_format: 0,
    },
    watch: {
        fileinfo: function () {
            this.$nextTick(function () {
                $('#smallfile-div').find('.smallfile-img').css('height', smallmap_height)

            })
        },
        mulitySelectedImg: function () {
            this.$nextTick(function () {
            })
        }
    }
})

$(document).ready(function () {
    //h5页面加载完成
    var obj = {}
    obj.command = 'h5finishInit';
    toFlutter(obj)
    //初始化layer
    layer.config({
        resize: false,
        closeBtn: 1,
        move: false
    });
    vm_basic.casemedicalid = getQueryString('casemedicalid')
    // getExamInfo()
    vm_basic.casemedicalid = 3
    success_getExamInfo(debug_data_exam_list)
})


/*-----------------------------初始化界面信息----------------------------*/


//初始化图片
var getExamInfo = function () {
    //获取档案信息 
    var obj = {}
    obj.command = 'getExamList';
    toFlutter(obj)
};

function success_getExamInfo(data) {
    for (let i = 0; i < data.length; i++) {
        if (data[i].casemedicalid == vm_basic.casemedicalid) {
            SetPatientInfo(data[i])
            for (let j = 0; j < data[i].imageinfo.length; j++) {
                data[i].imageinfo[j].uiIndex = j + 1
            }
            vm_basic.fileinfo = data[i].imageinfo
        }
    }
}
//修改图片大小
function ChangeSize(val) {
    $('.switch-btn').removeClass('active')
    $('.switch-btn').removeClass('switch-btn-s-active')
    $('.switch-btn').removeClass('switch-btn-m-active')
    $('.switch-btn').removeClass('switch-btn-l-active')
    var totalH = $('#smallfile-div').height()
    var h
    if (val == 0) {
        $('#smallfile-div').find('.cell-warp').attr('class', 'cell-warp col-md-4')
        h = (Number(totalH) / 7).toFixed(2) - 4
    }
    if (val == 1) {
        $('#smallfile-div').find('.cell-warp').attr('class', 'cell-warp col-md-6')
        h = (Number(totalH) / 5).toFixed(2) - 4
    }
    if (val == 2) {
        $('#smallfile-div').find('.cell-warp').attr('class', 'cell-warp col-md-12')
        h = (Number(totalH) / 3).toFixed(2) - 4
    }
    $('#smallfile-div').find('.smallfile-img').css('height', h)
    curSmallMapHeight = h + 4
}

//全选图片
var SelectAllMap = function () {
    vm_basic.mulitySelectedImg = []
    for (let i = 0; i < vm_basic.fileinfo.length; i++) {
        vm_basic.mulitySelectedImg.push(vm_basic.fileinfo[i].serverPath)
    }
}

//设置病人信息
var SetPatientInfo = function (patientinfo) {
    //pack gender
    var gen = patientinfo.gender;
    if (gen == 0) {
        patientinfo.ui_gender = tips.unknown
    } else if (gen == 1) {
        patientinfo.ui_gender = tips.male
    } else if (gen == 2) {
        patientinfo.ui_gender = tips.female
    }
    //pack age
    if (patientinfo.age == 0) {
        patientinfo.ui_age = ''
    } else {
        var aunit = patientinfo.ageunit;
        if (aunit == 3) {
            aunit = tips.year
        } else if (aunit == 2) {
            aunit = tips.month
        } else if (aunit == 1) {
            aunit = tips.day
        }
        patientinfo.ui_age = patientinfo.age + aunit
    }
    //pack weight and height
    var heightunit, weightunit;
    if (isVaild(patientinfo.weight)) {
        if (patientinfo.weightunit == 0) {
            weightunit = tips.kg
        } else if (patientinfo.weightunit == 1) {
            weightunit = tips.g
        }
        patientinfo.ui_weight = patientinfo.weight + weightunit
    } else {
        patientinfo.ui_weight = ''
    }
    if (isVaild(patientinfo.height)) {
        if (patientinfo.heightunit == 0) {
            heightunit = tips.cm
        } else if (patientinfo.heightunit == 1) {
            heightunit = tips.m
        }
        patientinfo.ui_height = patientinfo.height + heightunit
    } else {
        patientinfo.ui_height = ''
    }
    vm_basic.patientinfo = patientinfo
}


/*-----------------------------元素操作----------------------------*/

//返回
$('#back').on('click', function (e) {
    Back();
})
//大图 
$('.switch-btn-l').on('click', function () {
    ChangeSize(2)
    $(this).addClass('active')
    $(this).addClass('switch-btn-l-active')
})
//中图
$('.switch-btn-m').on('click', function () {
    ChangeSize(1)
    $(this).addClass('active')
    $(this).addClass('switch-btn-m-active')
})
//小图
$('.switch-btn-s').on('click', function () {
    ChangeSize(0)
    $(this).addClass('active')
    $(this).addClass('switch-btn-s-active')
})
//全选
$('#selectAll').on('click', function () {
    SelectAllMap();
})
$('#deselectAll').on('click', function () {
    vm_basic.mulitySelectedImg = []
})

//删除图片
$('#deleteImage').on('click', function () {
    layer.confirm(tips.deleteImg, {
        title: tips.tips_deleteImg,
        btn: [tips.confirm, tips.cancel],
    },
        function (index) {
            var idArr = []
            for (var i = 0; i < vm_basic.mulitySelectedImg.length; i++) {
                idArr.push(vm_basic.mulitySelectedImg[i].serverPath)
            }
            if (idArr.length > 0) {
                //删除文件
                var obj = {}
                obj.command = 'fileOpr';
                obj.oprType = 1;
                obj.data = {}
                obj.data.files = idArr
                toFlutter(pak)


                layer.close(index);
            } else {
                layer.msg(tips.tips_chooseToOperator, {
                    time: 2000,
                    icon: 0
                });
            }
        }, function () { },
    );
})
function success_del_file() {
    layer.msg(tips.deleted, {
        time: 2000,
        icon: 1
    })
}
function pre() {
    var index = vm_basic.curImgIndex - 1
    if (index < 0) {
        vm_basic.curImgIndex = vm_basic.fileinfo.length - 1;
    } else {
        vm_basic.curImgIndex--;
    }
}
function next() {
    var index = vm_basic.curImgIndex + 1
    if (index == vm_basic.fileinfo.length) {
        vm_basic.curImgIndex = 0
    } else {
        vm_basic.curImgIndex++;
    }
}


/*长按某一图片编辑所有*/
var timeOutEvent;
$(document).on("touchstart", "body .smallfile-img", function (e) {
    timeOutEvent = setTimeout("longPress()", 500);
})
$(document).on("touchmove", "body .smallfile-img", function (e) {
    clearTimeout(timeOutEvent);
    timeOutEvent = 0;
})
$(document).on("touchend", "body .smallfile-img", function (e) {
    clearTimeout(timeOutEvent);
    if (timeOutEvent != 0) {
        var src = $(this).attr('src')
        for (let i = 0; i < vm_basic.fileinfo.length; i++) {
            if (vm_basic.fileinfo[i].previewPath == src) {
                vm_basic.curImgIndex = i
            }
        }
    }
    return false;
})

function longPress() {
    timeOutEvent = 0;
    //出现checkbox框

}


/*图片滑动翻页*/