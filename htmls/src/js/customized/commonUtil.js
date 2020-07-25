
//生成随机id
function generateUUID() {
    var d = new Date().getTime();
    if (window.performance && typeof window.performance.now === "function") {
        d += performance.now(); //use high-precision timer if available
    }
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
    return uuid;
}
//时间戳转时间
function timestampToTime(timestamp) {
    var date = new Date(timestamp); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
    Y = date.getFullYear() + '-';
    M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    D = (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + ' ';
    h = (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ':';
    m = (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ':';
    s = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
    return Y + M + D + h + m + s;
}

//判断空对象
var isEmptyObject = function (obj) {
    var name;
    for (name in obj) {
        return false;
    }
    return true;
}
//是否为空
var isVaild = function (val) {
    if (val != null && typeof (val) != "undefined" && val != "" && val != "undefined" && val != "null") {
        return true
    } else {
        return false
    }
}
//日期加减
function addDate(date, days) {
    if (isVaild(date) && isVaild(days)) {
        var d = new Date(date);
        d.setDate(d.getDate() + days);
        var month = d.getMonth() + 1;
        var day = d.getDate();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        var val = d.format(dateformat);
        return val;

    }
}
//日期距离
function DateDiff(sDate1, sDate2) {
    var firstDate = new Date(sDate1);
    var secondDate = new Date(sDate2);
    var diff = Math.abs(firstDate.getTime() - secondDate.getTime())
    if (diff != 0) {
        var result = parseInt(diff / (1000 * 60 * 60 * 24));
    } else {
        result = 0
    }
    return result
}

/*根据出生日期算出年龄*/
function getAgeByDate(date) {
    var firstDate = new Date(date);
    var birthYear = firstDate.getFullYear();
    var birthMonth = firstDate.getMonth() + 1;
    var birthDay = firstDate.getDate();
    d = new Date();
    var nowYear = d.getFullYear();
    var nowMonth = d.getMonth() + 1;
    var nowDay = d.getDate();
    var ageUnit
    var age
    if (nowYear == birthYear) {
        if (nowMonth == birthMonth) {
            ageUnit = 1
            age = nowDay - birthDay + 1
        }
        else {
            ageUnit = 2
            age = nowMonth - birthMonth
        }
    }
    else {
        ageUnit = 3
        age = nowYear - birthYear; //年之差
    }
    var result = {
        age: age,
        ageUnit: ageUnit
    }
    console.log(result)
    return result;//返回周岁年龄
}
//日期对比
function compareDate(dateTime1, dateTime2) {
    if (!(dateTime1 instanceof Date)) {
        dateTime1 = new Date(dateTime1)
    }
    if (!(dateTime2 instanceof Date)) {
        dateTime2 = new Date(dateTime2)
    }
    if (dateTime1 > dateTime2) {
        return true;
    }
    else {
        return false;
    }
}

//格式化byte单位
function formatBytes(a, b, unit) {
    if (0 == a) return "0";
    var c = 1024,
        d = b || 2,
        e = ["Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"],
        f = Math.floor(Math.log(a) / Math.log(c));
    if (isVaild(unit)) {
        return parseFloat((a / Math.pow(c, unit)).toFixed(d)) + " " + e[unit]
    }
    return parseFloat((a / Math.pow(c, f)).toFixed(d)) + " " + e[f]
}

function numberOnly(e) {
    e.value = e.value.replace(/[^\d]/g, '')
}

function imgError(e) {
    e.src = 'src/img/noimg.jpg';
}


Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

Array.prototype.indexOf = function (val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};

Array.prototype.remove = function (val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};


var tips = {
    "patientID": "Patient ID",
    "autoIDCreation": "Auto ID Creation",
    "accessNo": "Access. No.",
    "lastName": "Last Name",
    "firstName": "First Name",
    "name": "Name",
    "MI": "M.I.",
    "gender": "Gender",
    "unknown": "unKnown",
    "male": "Male",
    "female": "Female",
    "age": "Age",
    "year": "Y",
    "month": "M",
    "day": "D",
    "height": "Height",
    "cm": "cm",
    "m": "m",
    "weight": "Weight",
    "kg": "kg",
    "g": "g",
    "mon": "MON",
    "tue": "TUE",
    "wed": "WED",
    "thu": "THU",
    "fri": "FRI",
    "sat": "SAT",
    "sun": "SUN",
    "jan": "Jan",
    "feb": "Feb",
    "mar": "Mar",
    "apr": "Apr",
    "may": "May",
    "jun": "Jun",
    "jul": "Jul",
    "aug": "Aug",
    "sep": "Sep",
    "oct": "Oct",
    "nov": "Nov",
    "dec": "Dec",
    "dob": "DOB",
    "bsa": "BSA",
    "operator": "Operator",
    "physician": "Physician",
    "refPhysician": "Ref. Physician",
    "diagnostician": "Diagnostician",
    "studyDescription": "Study Description",
    "description": "Description",
    "examType": "Exam Type",
    "lmp": "LMP",
    "ivf": "IVF",
    "ga": "GA",
    "gaw": "W",
    "gad": "D",
    "edd": "EDD",
    "gravida": "Gravida",
    "abort": "Abort",
    "para": "Para",
    "ectopic": "ectopic",
    "fetusNo": "Fetus No.",
    "psa": "PSA",
    "hr": "HR",
    "bp": "BP",
    "comments": "Comments",
    "dataSource": "Data Source",
    "smarchive": "Smarchive",
    "other": "other",
    "professionalPatientInfo": "Professional Information",
    "basicPatientInfo": "Basic Information",
    "search": "Search",
    "patientName": "Patient Name",
    "examDateTime": "Exam Date/Time",
    "status": "Status",
    "creatNewPatient": "Creat New Patient",
    "creatNewExam": "Creat New Exam",
    "reactivateExam": "Reactivate Exam",
    "pauseExam": "Pause Exam",
    "endExam": "End Exam",
    "clearEntries": "Clear Entries",
    "saveAndStart": "Save and Start",
    "reviewExam": "Review Exam",
    "toSmarchive": "To Smarchive",
    "toWorksheet": "To Worksheet",
    "back": "Back",
    "active": "Active",
    "pause": "Pause",
    "end": "End",
    "continue": "Continue",
    "comfirmation": "Comfirmation",
    "ob": "OB",
    "obMulitple": "OB(Mulitple)",
    "gynecology": "Gynecology",
    "urology": "Urology",
    "cardiology": "Cardiology",
    "vascular": "Vascular",
    "smallPart": "Small Part",
    "abdomen": "Abdomen",
    "tcd": "TCD",
    "examDate": "Exam Date",
    "to": "to",
    "clear": "Clear",
    "capacity": "Capacity",
    "selected": "Selected",
    "localSmarchive": "Local Smarchive",
    "systemTemporaryStorage": "System Temporary Storage",
    "data": "Data",
    "exam": "Exam",
    "close": "Close",
    "files": "Files",
    "image": "Image",
    "toServer": "To Server",
    "patientInfo": "Patient Info",
    "patientInformation": "Patient Information",
    "smarchive_placeholder_search": "Search: Input ID/Name",
    "smarchive_placeholder_dateBegin": "Begin Time",
    "smarchive_placeholder_dateEnd": "End Time",
    "smarchive_placeholder_searchFile": "Search: Input file name",
    "smarchive_placeholder_beginTime": "Begin Time",
    "smarchive_placeholder_endTime": "End Time",
    "importPatient": "Import Patient",
    "comparison": "Comparison mode",
    "browse": "Browse",
    "deleteExam": "Delete Exam",
    "selectAll": "Select All",
    "deselectAll": "Deselect All",
    "transfer": "Transfer",
    "layoutSize": "Layout Size",
    "delete": "Delete",
    "displayFormat": "Display Format",
    "filesFormat": "Files Format",
    "deleteImage": "Delete Image",
    "bySequence": "By Sequence",
    "byUserSelection": "By User Selection",
    "displayLayout": "Display Layout",
    "insertImage": "Insert Image",
    "commentAndFinding": "Comment and Finding",
    "measurementResult": "Measurement Result",
    "conclusion": "Conclusion",
    "signOff": "Sign-off",
    "date": "Date",
    "reportTemplate": "Report Template",
    "reportImage": "Image",
    "selectPackage": "Select Package",
    "findingEditor": "Finding Editor",
    "fontsize": "Fontsize",
    "fontFamily": "Font Family",
    "report_placeholder_width": "Width...",
    "report_placeholder_height": "Height...",
    "report_placeholder_length": "Length...",
    "report_placeholder_size": "Size...",
    "finding": "Finding",
    "printAndPDF": "Print and PDF",
    "reportComparison": "Comparison",
    "sent": "Send",
    "worksheet_win_title": "Worksheet",
    "taskManager_win_title": "Task Manager",
    "transfer_win_title": "Transfer",
    "transfer_export": "Export",
    "transfer_case_win_title": "Patient Data Transfer",
    "transfer_tempStorage_win_title": "TempStorage Data Transfer",
    "transfer_file_win_title": "File Transfer",
    "transfer_report_win_title": "Report Transfer",
    "import_win_title": "Patient Data Import",
    "transfer_target_destination": "Destination",
    "transfer_target_network": "Network",
    "transfer_target_printer": "Printer",
    "transfer_target_CD": "CD",
    "transfer_target_dicomStorage": "DICOM Storage Server",
    "transfer_target_dicomPrinter": "DICOM Printer",
    "transfer_selection": "Selection",
    "transfer_selection_cd": "CD/DVD ROM",
    "transfer_selection_dataInfo": "Data Info.",
    "transfer_selection_CDInfo": "CD/DVD Info.",
    "transfer_button_format": "Format",
    "transfer_button_refresh": "Refresh",
    "transfer_button_layoutPreview": "Layout&Preview",
    "transfer_selection_copy": "Copy",
    "transfer_button_toPeripheralSetup": "to Peripheral Setup",
    "transfer_button_formatCD": "Format",
    "transfer_outputPatientFiles": "Output patient files",
    "transfer_backupPatientFiles": "Backup patient files",
    "transfer_outputImage": "Output image&cineloop",
    "transfer_output_image": "Image",
    "transfer_output_type_original": "Original",
    "transfer_output_type_BMP": "BMP",
    "transfer_output_type_JPG": "JPG",
    "transfer_output_type_DCM": "DCM",
    "transfer_outputCineloop": "Cineloop",
    "transfer_output_type_AVI": "AVI",
    "transfer_output_type_WMV": "WMV",
    "transfer_output_type_MP4": "MP4",
    "transfer_output_imageSize": "Image Size:",
    "transfer_output_type_imageArea": "Image Area",
    "transfer_output_type_imageAndPatientInfo": "Image+Patient Info",
    "transfer_output_quality": "Quality:",
    "transfer_output_type_high": "High",
    "transfer_output_type_general": "General",
    "transfer_output_type_low": "Low",
    "transfer_output_outputReport": "Output Report",
    "transfer_output_report": "Report:",
    "transfer_output_type_PDF": "PDF",
    "transfer_output_type_HTML": "HTML",
    "transfer_output_type_DICOMSR": "DICOM SR",
    "transfer_output_keepFile": "Keep Files After Transfer",
    "transfer_output_deleteFile": "Delete Files After Transfer",
    "transfer_output_desensitization": "Desensitization",
    "transfer_output_includeInfo": "Output Image Including Patient Info",
    "transfer_send": "Send",
    "transfer_import": "Import",
    "transfer_close": "Close",
    "transfer_printerLayout_insertLayout": "Storaged Image",
    "transfer_printerLayout_storagedImage": "Insert Layout",
    "transfer_printerLayout_selectPatient": "Select Patient",
    "transfer_printerLayout_selectExam": "Select Exam",
    "transfer_printerLayout_insertPage": "Insert Page",
    "transfer_printerLayout_pageLayout": "Page Layout",
    "transfer_printerLayout_button_autoInsert": "Auto Insert",
    "transfer_printerLayout_button_clearImage": "Clear All Images",
    "transfer_printerLayout_button_applyAll": "Apply All",
    "transfer_printerLayout_page": "Page:",
    "transfer_printerLayout_button_pageUp": "Page Up",
    "transfer_printerLayout_button_pageDn": "Page Dn",
    "transfer_button_createDir": "Add new folder",
    "transfer_button_dirName": "Folder Name",
    "cadiology": "Cadiology",
    "openEditor": "Open Editor",
    "submit": "Submit",
    "editor": "Editor",
    "new": "New",
    "edit": "Edit",
    "diagnose": "Diagnosis",
    "save": "Save",
    "update": "Update",
    "editWord": "Edit content",
    "nodeName": "Directory name",
    "isCatalogue": "Set as directory",
    "tips_createFinding": "We suggest do not use same name of new classify for better differentiating  ",
    "no": "No",
    "yes": "Yes",
    "confirm": "Confirm",
    "cancel": "Cancel",
    "importExam": "Import exam",
    "tips_failedToLoad": "Failed to load",
    "taskManager_storage": "Storage",
    "taskManager_printer": "Printer",
    "taskManager_burn": "Burn",
    "taskManager_processing": "Processing",
    "taskManager_destination": "Destination",
    "taskManager_transferType": "Transfer Type",
    "taskManager_createDate": "Create date",
    "taskManager_page": "Page",
    "taskManager_log": "Log",
    "taskManager_failed": "Failed",
    "taskManager_completed": "Completed",
    "taskManager_activing": "Activing",
    "taskManager_pauseTask": "Pause task",
    "taskManager_deleteTask": "Delete task",
    "taskManager_restartTask": "Restart task",
    "taskManager_clearAll": "Clear all",
    "report_calcResult": "Calc.Result",
    "report_comment": "Comment",
    "report_conclusion": "Conclusion",
    "reportEditor_reportEditor": "Report Editor",
    "reportEditor_delete": "Delete",
    "reportEditor_pre": "Pre",
    "reportEditor_next": "Next",
    "reportEditor_save": "Save",
    "reportEditor_back": "Back",
    "reportEditor_titleContentEdit": "Report title content editing",
    "reportEditor_templateManage": "Template list",
    "reportEditor_title": "Title",
    "reportEditor_imageAndText": "Image and Text",
    "reportEditor_splitLine": "Insert split line",
    "reportEditor_editLogo": "Edit Logo:",
    "reportEditor_changeLogo": "Change Logo",
    "reportEditor_inProportion": "Constrain proportios",
    "reportEditor_editTitle": "Edit title:",
    "reportEditor_btn_createTitle": "Create title",
    "reportEditor_content": "Content:",
    "reportEditor_fontsize": "Fontsize:",
    "reportEditor_patientInfoEdit": "Report patient information editing",
    "reportEditor_createItem": "Create item",
    "reportEditor_insertImgEdit": "Report inserted image editing",
    "reportEditor_insertImgSize": "Image size:",
    "reportEditor_insert": "Insert",
    "reportEditor_textEdit": "Report text editing",
    "reportEditor_createTextBox": "Create text box",
    "reportEditor_createTemplate": "Creat new template",
    "reportEditor_inputName": "Input template name",
    "reportEditor_cancel": "Cancel",
    "reportEditor_create": "Create",
    "reportEditor_createTitle": "Creat new title",
    "reportEditor_inputTitle": "Input title",
    "reportEditor_inputItemName": "Input item name",
    "reportEditor_textOnly": "Text Only",
    "reportEditor_selection": "Selection",
    "reportEditor_textAndSelection": "Text and Selection",
    "reportEditor_inputSelectionName": "Input Selection Name",
    "reLogin": "Re-login",
    "tips_chooseToOperator": "please choose a file to operator",
    "tips_failedAcquirePreview": "Failed to acquire the preview image",
    "tips_failedTranscode": "Failed to convert, please try again",
    "tips_videoDoesntExit": "Video does’t exit",
    "addAnnotation": "Adding annotation",
    "submitChange": "Submit changes",
    "saved": "Saved",
    "deleted": "Deleted",
    "tips_failedSave": "Failed to save",
    "tips_inputID": "Please input the patient ID",
    "createExam": "Create exam",
    "tips_pauseOrEndExam": "Pause or end the current exam?",
    "tips_activeExam": "Activate exam",
    "IDExit": "ID already exists",
    "tips_selectToCreate": "Please select a record to create a new exam",
    "tips_selectToActivate": "Please select the exam that needs to be activated",
    "tips_selectToEnd": "Please select the exam that needs to be end",
    "tips_selectToPause": "Please select the exam that needs to be pause",
    "tips_endCurExam": "Do you want to end the current exam?",
    "tips_pauseCurExam": "Do you want to pause the current exam?",
    "tips_IDExit": "The input ID already exists, please re-enter",
    "tips_failedCreateRecord": "Failed to create an ID record",
    "tips_failedLoadList": "Failed to load list",
    "tips_faileToImportData": "Failed to Import Data",
    "tips_faileToExportData": "Failed to Export Data",
    "tips_failedLoadThesaurus": "Failed to load thesaurus",
    "tips_failedUpdateReport": "Failed to update report",
    "tips_failedUpdateReportHtml": "Failed to update report html",
    "tips_failedUpdateThesaurus": "Failed to update thesaurus",
    "tips_failedDelete": "Failed to delete",
    "tips_repeatItem": "repeated item!",
    "tips_failedRenew": "Failed to renew",
    "tips_failedAcquirePatientInfo": "Failed to acquire the patient information",
    "tips_failedUpdatePatientInfo": "Failed to update patient information",
    "tips_failedAcquireReportInfo": "Failed to acquire the report information",
    "tips_templateEmpty": "The system without report template，please create a template",
    "tips_inputWidthHeight": "Input the value of width and high",
    "tips_logoEmpty": "The Loge can not be empty",
    "tips_failedAcquireTemplate": "Failed to acquire template list",
    "tips_failedAcquireTemplateInfo": "Failed to acquire template Information",
    "tips_failedUpdateTemplate": "Failed to update template",
    "tips_operateTimeout": "Operate Timeout",
    "tips_unableDeletePage": "The current page is not allowed to delete!",
    "saveTemplate": "Save template",
    "tips_saveTemplate": "Saving the modification of the report template?",
    "tips_templateNameEmpty": "The report template name can not be empty!",
    "tips_failedUpdateTemplateImage": "Failed to update template image",
    "tips_noFileInfo": "Failed to load, no file information",
    "tips_failedAcquireArchiveInfo": "Failed to acquire archive information",
    "deleteImg": "Delete image",
    "tips_deleteImg": "Do you want to delete the selected image?",
    "tips_failedAcquireDriveInfo": "Failed to acquire drive letter information",
    "tips_failedAcquireWorksheet": "Failed to acquire worksheet",
    "tips_failedOperate": "Failed to operate, please try again",
    "tips_deleteExam": "Do you want to delete the selected exam?",
    "tips_examActivated": "Exam activated",
    "tips_selectToComparison": "Please select the archive for comparison",
    "tips_NoProgressArchive": "No archive is currently in progress",
    "tips_continueArchive": "There is an uncompleted exam, do you want to continue?",
    "tips_failedAcquireHistoricalArchive": "Failed to access the media file of the historical patient archive",
    "tips_failedSavedPDF": "Failed to generate PDF",
    "tips_selectToTransfer": "Please select file to transmit.",
    "tips_pauseExamToTransferAndDelete": "There is a task on processing，can not be delete，please try again！",
    "tips_successAddTask": "Task added successfully.",
    "tips_selectPathToTransfer": "Please select the transmit path."
}

var dateformat = 'yyyy-MM-dd'


//判断是安卓还是IOS
function checkSystem() {
    var u = window.navigator.userAgent, app = window.navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
    var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    if (isAndroid) {
        return 'android';
    }
    if (isIOS) {
        return 'ios';
    }
}

//JS调用Flutter中的方法
function toFlutter(obj) {
    var json = JSON.stringify(obj);
//    var sys = checkSystem();
//     if (sys === 'ios') {
//         controll.otherJsMethodCall(json);
//     } else {
//         otherJsMethodCall(json);
//     }
    Toaster.postMessage(json);
}

function get_local_storage(itemname) {
    var result = localStorage.getItem(itemname)
    try {
        result = JSON.parse(result)
    } catch (err) {

    }
    return result
}

function set_local_storage(itemname, data) {
    try {
        data = JSON.stringify(data)
    } catch (err) {

    }
    localStorage.setItem(itemname, data)
}

function getQueryString(name) {
    const reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    const urlObj = window.location;
    var r = urlObj.href.indexOf('#') > -1 ? urlObj.hash.split("?")[1].match(reg) : urlObj.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}


function flutter_recv(result) {
    console.log('++++ flutter_recv  '+result);

    alert('flutter_recv  '+result)
    if (result.command == 'getExamList') {
    console.log('++++ getExamList in ');
    success_getExamList(result.data)
    }
    if (result.command == 'updateExamList') {
        var obj = {}
        obj.command = 'getExamList';
        toFlutter(obj)
    }
}

var debug_data_exam_list = [{
    "casemedicalid": 1,
    "patientid": "20191219-192336",
    "examid": "20191219192336",
    "accessno": "20191219-192336",
    "name": "ererer",
    "lastname": "ererer",
    "firstname": "",
    "mi": "",
    "bod": "",
    "gender": "0",
    "height": "166",
    "heightunit": "cm",
    "weight": "55",
    "weightunit": "kg",
    "age": "22",
    "ageunit": "0",
    "operator": "fafafa",
    "createdate": 1576754616000,
    "examtype": "0",
    "imgcount": 2,
    "status":0,
    "filedir": "D:/TempTransFile/csh/194",
    "imageinfo": [{ "previewPath": "D:/TempTransFile/csh/194/1594276502940.jpg", "serverpath": "D:/TempTransFile/csh/194/1594276752785.mp4", "type": 1 },
    { "previewPath": "D:/TempTransFile/csh/194/1594276503048.jpg", "serverpath": "D:/TempTransFile/csh/194/1594277514728.mp4", "type": 1 },
    ]
},
{
    "casemedicalid": 2,
    "patientid": "20191219-192343",
    "examid": "20191219192343",
    "accessno": "20191219-192343",
    "name": "ffgfgfdsdsee",
    "lastname": "ererer",
    "firstname": "",
    "mi": "",
    "bod": "",
    "gender": "0",
    "height": "166",
    "heightunit": "cm",
    "weight": "55",
    "weightunit": "kg",
    "age": "22",
    "ageunit": "0",
    "operator": "fafafa",
    "createdate": 1576754616000,
    "examtype": "0",
    "imgcount": 2,
    "status":2,
    "filedir": "D:/TempTransFile/csh/194",
    "imageinfo": [{ "previewPath": "D:/TempTransFile/csh/194/1594276503102.jpg", "serverpath": "", "type": 0 },
    { "previewPath": "D:/TempTransFile/csh/194/1594276503169.jpg", "serverpath": "", "type": 0 },
    { "previewPath": "D:/TempTransFile/csh/194/1594899518356.jpg", "serverpath": "", "type": 0 },
    ]
},
{
    "casemedicalid": 3,
    "patientid": "20191219-19443",
    "examid": "2019121919243",
    "accessno": "20191219-19443",
    "name": "ffgfgf",
    "lastname": "",
    "firstname": "",
    "mi": "",
    "bod": "",
    "gender": "0",
    "height": "166",
    "heightunit": "cm",
    "weight": "55",
    "weightunit": "kg",
    "age": "22",
    "ageunit": "0",
    "operator": "fafafa",
    "createdate": 1576754616000,
    "examtype": "0",
    "imgcount": 2,
    "status":2,
    "filedir": "D:/TempTransFile/csh/195",
    "imageinfo": [{ "previewPath": "D:/TempTransFile/csh/195/1594276794464.jpg", "serverpath": "", "type": 0 },
    { "previewPath": "D:/TempTransFile/csh/195/1594276794553.jpg", "serverpath": "", "type": 0 },
    { "previewPath": "D:/TempTransFile/csh/195/1594276794646.jpg", "serverpath": "", "type": 0 },
    ]
}]