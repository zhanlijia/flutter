/* init vue data source */
var vm = new Vue({
    el: '#body-ID',
    data: {
        tips: tips,
        curcase: {},
        examList: []
    },
    mounted: function () {
    },
    methods: {
    },
    watch: {

    }
})

$(document).ready(function () {
    //初始化layer
    layer.config({
        resize: false,
        closeBtn: 1,
        move: false
    });
    initDatePicker(dateformat)
    initConfig()

    //h5页面加载完成
    var obj = {}
    obj.command = 'h5finishInit';
    toFlutter(obj)
    //获取档案信息
    var obj = {}
    obj.command = 'getExamList';
    toFlutter(obj)
//    success_getExamList(debug_data_exam_list)
});

function success_getExamList(data) {
    vm.examList = data
    for (let i = 0; i < data.length; i++) {
        if (data[i].status == 0) {
            vm.curcase = data[i]
            SetValue(data[i])
        }
    }
    if (isEmptyObject(vm.curcase)) {
        initAllInput()
    }
}

//初始化日期框
function initDatePicker(dateformat) {
    dateformat = 'yyyy/MM/dd'
    var datePicker_format = dateformat.replace(/M/ig, 'm')
    //判断字符串中有无4个y/2个y
    if (datePicker_format.indexOf("yyyy") != -1) {
        datePicker_format = datePicker_format.replace(/yyyy/ig, 'yy')
    } else if (datePicker_format.indexOf("yy") != -1) {
        datePicker_format = datePicker_format.replace(/yy/ig, 'y')
    }
    //初始化日期输入框
    $('#BOD').attr('placeholder', dateformat)

    var datePickerOpt = {
        changeYear: true,
        changeMonth: true,
        firstDay: 1,
        dateFormat: datePicker_format,
        monthNamesShort: [tips.jan, tips.feb, tips.mar, tips.apr, tips.may, tips.jun, tips.jul, tips.aug, tips.sep, tips.oct, tips.nov, tips.dec],
        dayNamesMin: [tips.sun, tips.mon, tips.tue, tips.wed, tips.thu, tips.fri, tips.sat],
        weeks: true,
        showMonthAfterYear: true,
        showAnim: 'fadeIn',
    }

    var bod_datePickerOpt = JSON.parse(JSON.stringify(datePickerOpt))
    bod_datePickerOpt.yearRange = "1900:2050"
    bod_datePickerOpt.maxDate = new Date()
    $("#BOD").datepicker(bod_datePickerOpt)

}

//初始化配置信息（AutoCreate和InitInfo）
function initConfig() {
    var data = get_local_storage('AutoIdCreation')
    if (isVaild(data)) {
        if (data == 2) {
            $("#AutoCreation").prop('checked', false)
        } else if (data == 1) {
            $("#AutoCreation").prop("checked", "checked");
        }
    } else {
        $("#AutoCreation").prop("checked", "checked");
    }
}

//获取当前所有输入框的信息
var GetInputValue = function () {
    var pid = $('#patientId').val();
    var paccessno = $('#accessNo').val();
    var plastname = $('#lastname').val();
    var pfirstname = $('#firstname').val();
    var pMI = $('#MI').val();
    if (!isVaild(pMI)) {
        pMI = ''
    }
    if (!isVaild(plastname)) {
        plastname = ''
    } if (!isVaild(pfirstname)) {
        pfirstname = ''
    }
    var name = plastname + pfirstname + pMI;
    var pgender = $('#gender').val();
    var pheight = $('#height').val();
    var pheightUnit = $('#heightUnit').val();
    var pweight = $('#weight').val();
    var pweightUnit = $('#weightUnit').val();
    var pBOD = $("#BOD").val();
    var page = $('#age').val();
    var pageUnit = $('#ageUnit').val();
    if (!isVaild(page)) {
        page = 0
        pageUnit = 0
    }
    var poperator = $(".select-menu-div[data-storagetype='Operator']").find('.select-menu-input').val();

    var patientData = {
        'patientid': pid,
        'accessno': paccessno,
        'lastname': plastname,
        'firstname': pfirstname,
        'gender': pgender,
        'height': pheight,
        'heightunit': pheightUnit,
        'weight': pweight,
        'weightunit': pweightUnit,
        'bod': pBOD,
        'mi': pMI,
        'age': page,
        'ageunit': pageUnit,
        'operator': poperator,
        'examtype': $('#examType').val(),
        'name': name,
    }
    return patientData
}


//自动创建ID规则
var AutoCreateID = function () {
    var nowdate = new Date();
    var year = nowdate.getFullYear();
    var month = (nowdate.getMonth() + 1) > 9 ? (nowdate.getMonth() + 1).toString() : '0' + (nowdate.getMonth() + 1);
    var day = nowdate.getDate() > 9 ? nowdate.getDate().toString() : '0' + nowdate.getDate();
    var hour = nowdate.getHours() > 9 ? nowdate.getHours().toString() : '0' + nowdate.getHours();
    var minute = nowdate.getMinutes() > 9 ? nowdate.getMinutes().toString() : '0' + nowdate.getMinutes();
    var second = nowdate.getSeconds() > 9 ? nowdate.getSeconds().toString() : '0' + nowdate.getSeconds();
    var str = year + month + day + '_' + hour + minute + second;
    CheckPatientId(str)
        .then(data => {
            if (data.status == 2) {
                str = ""
            }
        })
        .catch(error => {
            console.log(error)
        })
    return str
}
//回显信息（pid和ano都不可修改）
var SetValue = function (thepatient) {
    console.log(thepatient)
    if (isVaild(thepatient)) {
        localStorage.setItem('CurCase', JSON.stringify(thepatient))
        $('#patientId').attr("disabled", true)
        $('#accessNo').attr("disabled", true)
        $('#examType').val(thepatient.examtype)
        if (isVaild(thepatient.gender)) {
            $("#gender").val(thepatient.gender)
        } else {
            $("#gender").val(0)
        }
        if (isVaild(thepatient.weight)) {
            $('#weight').val(thepatient.weight);
            $("#weightUnit").val(thepatient.weightunit)
        }
        if (isVaild(thepatient.height)) {
            $('#height').val(thepatient.height);
            $('#heightUnit').val(thepatient.heightunit);
        }
        if (thepatient.age != 0) {
            $('#age').val(thepatient.age);
            $('#ageUnit').val(thepatient.ageunit);
        } else {
            $('#age').val('');
        }
        $(".select-menu-div[data-storagetype='Operator']").find('.select-menu-input').val(thepatient.operator);
        $('#patientId').val(thepatient.patientid);
        $('#accessNo').val(thepatient.accessno);
        $('#lastname').val(thepatient.lastname);
        $('#MI').val(thepatient.mi);
        $('#firstname').val(thepatient.firstname);
        $('#BOD').val(thepatient.bod).trigger('change');
    } else {

    }
}
//清空所有输入框
function initAllInput() {
    if ($("#AutoCreation").is(":checked")) {
        var id = AutoCreateID()
        $('#patientId').attr("disabled", "disabled").val(id)
        $('#accessNo').attr("disabled", "disabled").val(id)
    } else {
        $('#patientId').removeAttr("disabled").val('').focus()
        $('#accessNo').removeAttr("disabled").val('').focus()
    }
    $('#lastname').val('');
    $('#firstname').val('');
    $('#MI').val('');
    $('#BOD').val('');
    $('#weight').val('');
    $('#height').val('');
    $('#age').val('');
    $('.select-menu-input').val('');
}
//更新storage的值（用于保存病人时更新四个输入框信息到缓存）
var UpdatestorageItem = function (storageitem, item) {
    var operatorData
    if (isVaild(get_local_storage(storageitem))) {
        operatorData = get_local_storage(storageitem)
        if (operatorData.indexOf(item) === -1) {
            operatorData.push(item);
        }
    } else {
        operatorData = [item];
    }
    set_local_storage(storageitem, operatorData);
}
//快速创建病人
function quickCreatePatient() {
    CurCase = remote.getGlobal('CurCase')
    if (!isVaild(CurCase) && $("#AutoCreation").is(":checked")) {
        var id = AutoCreateID()
        var newid = 1
        var pinfo = {
            'patientid': id,
            'accessno': id,
            'lastname': '',
            'firstname': '',
            'gender': $('#gender').val(),
            'height': '',
            'heightunit': $('#heightUnit').val(),
            'weight': '',
            'weightunit': $('#weightUnit').val(),
            'bod': '',
            'mi': '',
            'age': '',
            'ageunit': $('#ageUnit').val(),
            'operator': '',
            'examtype': $('#examType').val(),
            'name': '',
        }
        InsertOrUpdateCaseMedical(pinfo, pinfo.casemedicalid)
            .then(data => {
                if (data.status == 1) {
                    CurCase = data.caseMedical
                    //发送开始新检查消息包
                    SendPatientInfo(data.caseMedical, newid)
                    //更新smarchive列表
                    ipc.send('caseStatusChange')
                    SendPatientMediaInfo(data.caseMedical.casemedicalid);
                    SendOperateType(1)
                } else {

                }
            })
            .catch(error => {
                console.log(error)
            })
    }
}

/*-----------------------------元素操作----------------------------*/

//点击保存并开始检查按钮
$('#saveExam').on('click', function () {
    var pinfo = GetInputValue()
    if (isVaild(pinfo.operator)) {
        UpdatestorageItem('Operator', poperator);
    }
    if (!isEmptyObject(vm.curcase)) {
        //修改
        pinfo.casemedicalid = vm.curcase.casemedicalid
        for (let i = 0; i < vm.examList.length; i++) {
            if (vm.examList[i].casemedicalid == pinfo.casemedicalid) {
                vm.examList[i] = pinfo
            }
        }
    } else {
        //新增
        pinfo.casemedicalid = generateUUID()
        vm.examList.push(pinfo)
    }
    update_exam_list()

})
function success_saved() {
    //获取激活中的档案信息
    var obj = {}
    obj.command = 'getActivingExam';
    toFlutter(obj)
}

//点击新建病人按钮
$('#creatNewPatient').on('click', function () {
    if (!isEmptyObject(vm.curcase)) {
        layer.confirm(tips.tips_pauseOrEndExam, {
            title: tips.createExam,
            btn: [tips.end, tips.cancel],
        },
            function (index) {
                endExam()
                layer.close(index);
            }, function () { },
        );
    } else {
        initAllInput()
    }
})
//点击结束检查按钮
$('#endExam').on('click', function () {
    if (!isEmptyObject(vm.curcase)) {
        layer.confirm(tips.tips_endCurExam, {
            title: tips.endExam,
            btn: [tips.confirm, tips.cancel],
        },
            function (index) {
                endExam()
                layer.close(index);
            }, function () { },
        );
    } else {
        layer.msg(tips.tips_NoProgressArchive, { icon: 0 });
    }
})
//结束检查
var endExam = function () {
    for (let i = 0; i < vm.examList.length; i++) {
        if (vm.examList[i].casemedicalid == vm.curcase.casemedicalid) {
            vm.examList[i].status = 2
        }
    }
    update_exam_list()
}
function update_exam_list() {
    //更新列表
    var obj = {}
    obj.command = 'updateExamList'
    obj.data = vm.examList
    toFlutter(obj)
}

//点击清除所有按钮
$('#clearEntries').on('click', function () {
    $('#lastname').val('');
    $('#firstname').val('');
    $('#MI').val('');
    $('#BOD').val('');
    $('#weight').val('');
    $('#height').val('');
    $('#age').val('');
    $('.select-menu-input').val('');
})
//检查的某项改变时触发的事件
$('#BOD').change(function () {
    var pBOD = $(this).val();
    if (isNaN(pBOD) && !isNaN(Date.parse(pBOD))) {
        var result = getAgeByDate(pBOD)
        $('#age').val(result.age);
        $("#ageUnit").val(result.ageUnit).trigger('change')
    }
})
//当自动创建ID选框状态改变时
$('#AutoCreation').on('change', function () {
    //存储当前档案配置项
    var AutoIdCreation = 2;
    if ($(this).is(":checked")) {
        AutoIdCreation = 1
    }
    set_local_storage('AutoIdCreation', AutoIdCreation)
})
//清除日期框
$('#clearBOD_Datepicker').on('click', function () {
    $('#BOD').val('');
    $('#age').val('');
})
$("#patientId").focus(function () {
    $('#req').css("display", "none");
});
//点击退出按钮
$('#exit').on('click', function () {
    Back()
})