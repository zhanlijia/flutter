
var isAllChecked = 0; //1为全选，0为取消全选
/* init vue data source */
var vm = new Vue({
    el: '#smarchive',
    data: {
        patientInfo: [],
        tips: tips,
        selectedPatients: [],
        selectedPatient: '',
    },
    mounted: function () {
    },
    methods: {
    },
    watch: {
        patientInfo: function () {
            this.$nextTick(function () {
                table = $('#data-table').DataTable({
                    "columnDefs": [{
                        "orderable": false,
                        "targets": [0]
                    }],
                    "destroy": true,
                    "aaSorting": [[3, "desc"]],
                    "dom": 'Brtip',
                    "oLanguage": {
                        "sLengthMenu": "每页显示 _MENU_ 条记录",
                        "sZeroRecords": "没有检索到数据",
                        "sInfo": "总共有 _TOTAL_ 条记录",
                        "sInfoEmtpy": "没有数据",
                        "sInfoFiltered": '',
                        "sProcessing": "正在加载数据...",
                        "oPaginate": {
                            "sFirst": "首页",
                            "sLast": "尾页"
                        }
                    },
                });
            })
        },
        selectedPatient: function () {
            this.$nextTick(function () {


            })
        },
        selectedPatients: function () {
            this.$nextTick(function () {
            })
        }
    }
})
var table;
$(document).ready(function () {
    //初始化layer
    layer.config({
        resize: false,
        closeBtn: 1,
        move: false
    });
    
    //h5页面加载完成
    var obj = {}
    obj.command = 'h5finishInit';
    toFlutter(obj)
    //获取表格数据
    var obj = {}
    obj.command = 'getExamList';
    toFlutter(obj)

    success_getExamInfo(debug_data_exam_list)
});

//初始化表格
function success_getExamInfo(data) {
    console.log(data)
    //handle patient info
    for (let i = 0; i < data.length; i++) {
        var thepatient = JSON.parse(JSON.stringify(data[i]))
        data[i] = handleMedicalListToShow(thepatient)
    }
    vm.patientInfo = data
}


//获取选中档案信息
function GetSelectedExam() {

    var arr = [];
    //多选
    if (vm.selectedPatients.length != 0) {
        arr = vm.selectedPatients.slice(0);
    }
    //单选
    else {
        var data = JSON.parse(JSON.stringify(vm.selectedPatient));
        arr.push(data)
    }
    // console.log(JSON.stringify(arr))
    return arr
}

//结束检查
var PostToChangeExamStatus = function () {
    //
}

//处理删除档案操作
function handleDeleteExam(casemedicalid) {
    //更新数据，除了数据库删除之外
    for (var j = 0; j < vm.patientInfo.length; j++) {
        if (vm.patientInfo[j].casemedicalid == casemedicalid) {
            vm.patientInfo.splice(j, 1);
        }
    }
    //更新选中数据
    for (let i = 0; i < vm.selectedPatients.length; i++) {
        if (vm.selectedPatients[i] == casemedicalid) {
            vm.selectedPatients.splice(i, 1)
        }
    }
    if (vm.selectedPatient.casemedicalid == casemedicalid) {
        $('#data-tbody > tr:first').trigger("click")
    }
}
//处理档案列表信息以显示
function handleMedicalListToShow(patientinfo) {
    if (isVaild(patientinfo.createdate)) {
        patientinfo.ui_createdate = timestampToTime(patientinfo.createdate)
    }
    if (isVaild(patientinfo.examtype)) {
        if (patientinfo.examtype == 0) {
            patientinfo.ui_examtype = tips.ob
        } else if (patientinfo.examtype == 1) {
            patientinfo.ui_examtype = tips.obMulitple
        } else if (patientinfo.examtype == 2) {
            patientinfo.ui_examtype = tips.gynecology
        } else if (patientinfo.examtype == 3) {
            patientinfo.ui_examtype = tips.urology
        } else if (patientinfo.examtype == 4) {
            patientinfo.ui_examtype = tips.cardiology
        } else if (patientinfo.examtype == 5) {
            patientinfo.ui_examtype = tips.vascular
        } else if (patientinfo.examtype == 6) {
            patientinfo.ui_examtype = tips.smallPart
        } else if (patientinfo.examtype == 7) {
            patientinfo.ui_examtype = tips.abdomen
        } else if (patientinfo.examtype == 8) {
            patientinfo.ui_examtype = tips.tcd
        }
    }
    if (isVaild(patientinfo.examtypejson)) {
        try {
            var examObj = JSON.parse(patientinfo.examtypejson)
            patientinfo.lmp = examObj.LMP
            patientinfo.ga = examObj.GA_W + tips.gaw + examObj.GA_D + tips.gad
            patientinfo.edd = examObj.EDD
            patientinfo.gravida = examObj.gravida
            patientinfo.abort = examObj.abort
            patientinfo.para = examObj.para
            patientinfo.ectopic = examObj.ectopic
            patientinfo.fetusNo = examObj.fetusNo
            patientinfo.psa = examObj.PSA + 'ng/ml'
            patientinfo.hr = examObj.HR + 'bpm'
            patientinfo.bp = examObj.BP_L + '/' + examObj.BP_R + 'mmHg'
        }
        catch (err) {
            console.log(err)
        }
    }
    if (isVaild(patientinfo.gender)) {
        if (patientinfo.gender == 0) {
            patientinfo.ui_gender = tips.unknown
        } else if (patientinfo.gender == 1) {
            patientinfo.ui_gender = tips.male
        } else if (patientinfo.gender == 2) {
            patientinfo.ui_gender = tips.female
        }
    }
    if (isVaild(patientinfo.age) && patientinfo.age != 0) {
        if (patientinfo.ageunit == 3) {
            patientinfo.ui_age = patientinfo.age + tips.year
        } else if (patientinfo.ageunit == 2) {
            patientinfo.ui_age = patientinfo.age + tips.month
        } else if (patientinfo.ageunit == 1) {
            patientinfo.ui_age = patientinfo.age + tips.day
        }
    }
    if (isVaild(patientinfo.status)) {
        if (patientinfo.status == 0) {
            patientinfo.ui_status = tips.active
        } else if (patientinfo.status == 1) {
            patientinfo.ui_status = tips.pause
        } else if (patientinfo.status == 2) {
            patientinfo.ui_status = tips.end
        }
    }
    if (isVaild(patientinfo.weight)) {
        if (patientinfo.weightunit == 0) {
            patientinfo.ui_weight = patientinfo.weight + tips.kg
        } else if (patientinfo.weightunit == 1) {
            patientinfo.ui_weight = patientinfo.weight + tips.g
        }
    }
    if (isVaild(patientinfo.height)) {
        if (patientinfo.heightunit == 0) {
            patientinfo.ui_height = patientinfo.height + tips.cm
        } else if (patientinfo.heightunit == 1) {
            patientinfo.ui_height = patientinfo.height + tips.m
        }
    }
    return patientinfo
}


/*-----------------------------元素操作----------------------------*/
var search_delay
$('#reportSearch').on('keyup', function () {
    clearTimeout(search_delay)
    search_delay = setTimeout(() => {
        table.search(this.value).draw();
    }, 350);
})

//单击表格行
$('#data-tbody').on('click', '.enable-enter-review', function (e) {
    window.location.href = 'review.html?casemedicalid=' + vm.selectedPatient.casemedicalid;
})

//全选当前页
$('#cb_curpage').on('change', function () {
    vm.selectedPatients = []
    if ($(this).is(':checked')) {
        for (let i = 0; i < vm.patientInfo.length; i++) {
            vm.selectedPatients.push(vm.patientInfo[i].casemedicalid)
        }
    }
})
//删除档案
$('#deleteExam').on('click', function () {
    var idArr = []
    if (vm.selectedPatients.length > 0) {
        for (let i = 0; i < vm.selectedPatients.length; i++) {
            idArr.push(vm.selectedPatients[i])
        }
    } else {
        idArr.push(vm.selectedPatient.casemedicalid)
    }
    layer.confirm(tips.deleteExam, {
        title: tips.tips_deleteExam,
        btn: [tips.confirm, tips.cancel],
    },
        function (index) {
            //删除档案
            for (let i = 0; i < vm.patientInfo.length; i++) {
                for (let j = 0; j < vm.selectedPatients.length; j++) {
                    if(vm.patientInfo[i].casemedicalid==vm.selectedPatients[j]){
                        vm.patientInfo.splice(i,1)
                    }                    
                }
                //更新examlist
                var obj={}
                obj.command='updateExamList'
                obj.data=vm.patientInfo
                toFlutter(obj)
            }
            layer.close(index);
        }, function () { },
    );

})
//新建检查
$('#creatNewExam').on('click', function () {
    var CurCase = get_local_storage('CurCase')
    if (isVaild(CurCase) && CurCase.status == 0) {
        layer.confirm(tips.tips_pauseOrEndExam, {
            title: tips.createExam,
            btn: [tips.end, tips.cancel]
        },
            function (index) {
                //结束检查
                endExam()

                layer.close(index);
            }, function () { },
        );
    } else {

    }
})
//导出档案
$('#btn-transferPatient').on('click', function () {
    //当前为导出模态框且导出类型为档案
    var selected_item_info = getSelectedItemInfo()
    ipc.send('SendToOpenTransferWin', 1, 0, selected_item_info, 0)
})
//返回
$('.back').on('click', function () {
    Back()
})