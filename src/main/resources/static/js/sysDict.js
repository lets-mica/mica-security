var systemDicts = {};
$(function() {
    // 加载字典
    initDicts();
});

function initDicts() {
    $.ajax({
        type: "GET",
        url: basePath + '/sysDict/list',
        dataType: "json",
        success: function (data) {
            if ($.isArray(data) && data.length > 0) {
                systemDicts = data;
            } else {
                showWarnMsg("获取字典数据失败")
            }
        }
    });
}

function getAllDictType() {
    var types = [];
    $.each(systemDicts, function (index, e) {
        types.push(e["dictType"]);
    });
    return types;
}

function getSystemDicts(dictType) {
    var types = [];
    $.each(systemDicts, function (index, e) {
        if (e["dictType"] == dictType) {
            types.push(e);
        }
    });
    return types;
}

function getSystemDicts(dictType, key) {
    var dictValue = "";
    $.each(systemDicts, function (index, e) {
        if (e["dictType"] == dictType && e["dictKey"] == key) {
            dictValue = e["dictValue"];
            return false;
        }
    });
    return dictValue;
}

function columnsDictFormat(dictType, key) {
    return getSystemDicts(dictType, key);
}
