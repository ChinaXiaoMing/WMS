<%--
  Created by IntelliJ IDEA.
  User: xiaoming
  Date: 2021/11/14
  Time: 16:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<script>

    var search_type_storage = "none";
    var search_keyWord = "";
    var goods_type;
    var select_id;
    var radioValue;

    $(function () {
        optionAction();
        searchAction();
        goodsStaticsListInit();
        bootstrapValidatorInit();
        moveBootstrapValidatorInit()

        addStorageAction();
        moveStorageAction();
        deleteStorageAction();
        importStorageAction();
        exportStorageAction();

        // 物料数据初始化
        goodsAutocomplete();
        // 仓库下拉数据加载
        repositorySelectorInit();
        triggerBtnGroup();
        goodsRepoTableInit();
    })

    // 查询方式下拉框，为search_type_storage赋值，若为所有，搜索框不能编辑
    function optionAction() {
        $(".dropOption").click(function () {
            var type = $(this).text();
            $("#search_input").val("");
            if (type == "所有") {
                $("#search_input_type").val("");
                $("#search_input_type").attr("readOnly", "true");
                search_type_storage = "searchAll";
            } else if (type == "物料描述") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByName";
            } else {
                $("#search_input_type").removeAttr("readOnly");
            }

            $("#search_type").text(type);
            $("#search_input_type").attr("placeholder", type);
        })
    }

    // 仓库下拉列表初始化
    function repositorySelectorInit() {
        $.ajax({
            type: 'GET',
            url: 'repositoryManage/getRepositoryList',
            dataType: 'json',
            contentType: 'application/json',
            data: {
                searchType: 'searchAll',
                keyWord: '',
                offset: -1,
                limit: -1
            },
            success: function (response) {
                $.each(response.rows, function (index, elem) {
                    $('.move').append("<option value='" + elem.id + "'>" + elem.name + "</option>");
                });
            },
            error: function (response) {
                $('.move').append("<option value='-1'>加载失败</option>");
            }

        })
    }

    // 货物信息自动匹配
    function goodsAutocomplete() {
        $('#goods_input').autocomplete({
            minLength: 0,
            delay: 500,
            source: function (request, response) {
                $.ajax({
                    type: 'GET',
                    url: 'goodsManage/getGoodsList',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: {
                        offset: -1,
                        limit: -1,
                        keyWord: request.term,
                        searchType: 'searchByName'
                    },
                    success: function (data) {
                        let autoCompleteInfo = [];
                        $.each(data.rows, function (index, elem) {
                            autoCompleteInfo.push({label: elem.name, value: elem.id});
                        });
                        response(autoCompleteInfo);
                    }
                });
            },
            focus: function (event, ui) {
                $('#goods_input').val(ui.item.label);
                $('#goods_id').val(ui.item.value);
                return false;
            },
            select: function (event, ui) {
                $('#goods_input').val(ui.item.label);
                $('#goods_id').val(ui.item.value);
                return false;
            }
        })
    }

    // 搜索动作
    function searchAction() {
        $('#search_button').click(function () {
            search_keyWord = $('#search_input_type').val();
            goods_type = $('#search_goods_type').val();
            if (radioValue === '库存汇总') {
                tableRefresh();
            }
            if (radioValue === '物资库') {
                goodsRepoTableRefresh()
            }
            if (radioValue === '一线') {
                firstRepoTableRefresh()
            }
            if (radioValue === '二线') {
                secondRepoTableRefresh()
            }

        })
    }

    // 分页查询参数
    function queryParams(params) {
        let temp = {
            limit: params.limit,
            offset: params.offset,
            searchType: search_type_storage,
            goodsType: goods_type,
            keyWord: search_keyWord
        }
        return temp;
    }

    // 表格初始化
    function goodsStaticsListInit() {
        $('#goodsStaticsList')
            .bootstrapTable(
                {
                    columns: [
                        {
                            field: 'goodCode',
                            title: '物料编码'
                        },
                        {
                            field: 'name',
                            title: '物料描述'
                        },
                        {
                            field: 'size',
                            title: '单位'
                        },
                        {
                            field: 'carNumber',
                            title: '车号'
                        },
                        {
                            field: 'goodImportance',
                            title: '重要性'
                        },
                        {
                            field: 'type',
                            title: '物料属性'
                        },
                        {
                            field: 'allNumber',
                            title: '总数'
                        },
                        {
                            field: 'availableNumber',
                            title: '可用'
                        },
                        {
                            field: 'faultNumber',
                            title: '故障件'
                        },
                        {
                            field: 'scrapNumber',
                            title: '报废'
                        },
                        {
                            field: 'operation',
                            title: '操作',
                            formatter: function (value, row, index) {
                                var s = '<button class="btn btn-info btn-sm edit"><span>移库</span></button>';
                                var d = '<button class="btn btn-danger btn-sm delete"><span>删除</span></button>';
                                return s + ' ' + d;
                            },
                            events: {
                                // 操作列中编辑按钮的动作，rowEditOperation(row)，传入row
                                'click .edit': function (e, value, row, index) {
                                    rowEditOperation(row);
                                },
                                'click .delete': function (e, value, row, index) {
                                    select_id = row.id;
                                    $('#deleteWarning_modal').modal('show');
                                }
                            }
                        }],
                    url: 'goodsStatistics/getGoodsStaticsList',
                    method: 'GET',
                    queryParams: queryParams,
                    sidePagination: "server",
                    dataType: 'json',
                    pagination: true,
                    pageNumber: 1,
                    pageSize: 5,
                    pageList: [5, 10, 25, 50, 100],
                    clickToSelect: true
                });
    }

    // 表格初始化
    function goodsRepoTableInit() {
        $('#goodsRepoTable')
                .bootstrapTable(
                        {
                            columns: [
                                {
                                    field: 'goodCode',
                                    title: '物料编码'
                                },
                                {
                                    field: 'name',
                                    title: '物料描述'
                                },
                                {
                                    field: 'size',
                                    title: '单位'
                                },
                                {
                                    field: 'carNumber',
                                    title: '车号'
                                },
                                {
                                    field: 'goodImportance',
                                    title: '重要性'
                                },
                                {
                                    field: 'type',
                                    title: '物料属性'
                                },
                                {
                                    field: 'allNumber',
                                    title: '总数'
                                },
                                {
                                    field: 'availableNumber',
                                    title: '借出'
                                },
                                {
                                    field: 'faultNumber',
                                    title: '库余'
                                },
                                {
                                    field: 'operation',
                                    title: '操作',
                                    formatter: function (value, row, index) {
                                        var s = '<button class="btn btn-info btn-sm edit"><span>移库</span></button>';
                                        var d = '<button class="btn btn-danger btn-sm delete"><span>删除</span></button>';
                                        return s + ' ' + d;
                                    },
                                    events: {
                                        // 操作列中编辑按钮的动作，rowEditOperation(row)，传入row
                                        'click .edit': function (e, value, row, index) {
                                            rowEditOperation(row);
                                        },
                                        'click .delete': function (e, value, row, index) {
                                            select_id = row.id;
                                            $('#deleteWarning_modal').modal('show');
                                        }
                                    }
                                }],
                            url: 'goodsStatistics/getGoodsStaticsList',
                            method: 'GET',
                            queryParams: queryParams,
                            sidePagination: "server",
                            dataType: 'json',
                            pagination: true,
                            pageNumber: 1,
                            pageSize: 5,
                            pageList: [5, 10, 25, 50, 100],
                            clickToSelect: true
                        });
    }

    // 表格刷新
    function tableRefresh() {
        $('#goodsStaticsList').bootstrapTable('refresh', {
            query: {}
        });
    }

    // 表格刷新
    function goodsRepoTableRefresh() {
        $('#goodsRepoTable').bootstrapTable('refresh', {
            query: {}
        });
    }

    // 表格刷新
    function firstRepoTableRefresh() {
        $('#firstRepoTable').bootstrapTable('refresh', {
            query: {}
        });
    }

    // 表格刷新
    function secondRepoTableRefresh() {
        $('#secondRepoTable').bootstrapTable('refresh', {
            query: {}
        });
    }

    // 行编辑操作模态框展示与数据填充
    function rowEditOperation(row) {
        $('#edit_modal').modal("show");

        // load info
        $('#storage_form_edit').bootstrapValidator("resetForm", true);
        $('#goods_code').text(row.goodCode);
        $('#goods_name').text(row.name);
        $('#move_goods_id').val(row.goodsId);
    }

    // 添加库存信息模态框数据校验
    function bootstrapValidatorInit() {
        $("#goods_statistics_form").bootstrapValidator({
            message: 'This is not valid',
            fields: {
                goodName: {
                    validators: {
                        notEmpty: {
                            message: '物料描述不能为空'
                        },
                        remote: {
                            url: 'goodsStatistics/checkGoodName',
                            message: '该物料描述已存在',
                            delay: 1000
                        }
                    }
                }
            }
        })
    }

    // 移库模态框数据校验
    function moveBootstrapValidatorInit() {
        $("#move_goods_form").bootstrapValidator({
            message: 'This is not valid',
            fields: {
                goodName: {
                    validators: {
                        notEmpty: {
                            message: '物料描述不能为空'
                        }
                    }
                }
            }
        })
    }

    // 移库，表单数据提交
    function moveStorageAction() {
        $('#edit_modal_submit').click(
            function () {
                $('#move_goods_form').data('bootstrapValidator').validate();
                if (!$('#move_goods_form').data('bootstrapValidator').isValid()) {
                    return;
                }

                let data = $('#move_goods_form').serializeArray();
                let dataObj = {};
                $.each(data, function (index, element) {
                    dataObj[element.name] = element.value;
                })

                // ajax
                $.ajax({
                    type: "POST",
                    url: 'goodsStatistics/moveGoods',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(dataObj),
                    success: function (response) {
                        $('#edit_modal').modal("hide");
                        let type;
                        let msg;
                        if (response.result === "success") {
                            type = "success";
                            msg = "移库操作成功";
                        } else if (response.result === "error") {
                            type = "error";
                            msg = response.data;
                        }
                        infoModal(type, msg);
                        tableRefresh();
                    },
                    error: function (response) {
                    }
                });
            });
    }

    // 刪除库存信息
    function deleteStorageAction() {
        $('#delete_confirm').click(function () {
            let data = {
                "id": select_id
            }

            $.ajax({
                type: "GET",
                url: "goodsStatistics/deleteGoodsStatics",
                dataType: "json",
                contentType: "application/json",
                data: data,
                success: function (response) {
                    $('#deleteWarning_modal').modal("hide");
                    let type;
                    let msg;
                    if (response.result === "success") {
                        type = "success";
                        msg = "库存汇总记录删除成功";
                    } else {
                        type = "error";
                        msg = "库存汇总记录删除失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();
                }, error: function (response) {
                }
            })

            $('#deleteWarning_modal').modal('hide');
        })
    }

    // 添加库存汇总记录信息
    function addStorageAction() {
        $('#add_storage').click(function () {
            $('#add_modal').modal("show");
        });

        $('#add_modal_submit').click(function () {
            $('#goods_statistics_form').data('bootstrapValidator').validate();
            if (!$('#goods_statistics_form').data('bootstrapValidator').isValid()) {
                return;
            }

            let data = $('#goods_statistics_form').serializeArray();
            let dataObj = {};
            $.each(data, function (index, element) {
                dataObj[element.name] = element.value;
            })

            $.ajax({
                type: "POST",
                url: "goodsStatistics/addGoodsStatics",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(dataObj),
                success: function (response) {
                    $('#add_modal').modal("hide");
                    var msg;
                    var type;
                    if (response.result === "success") {
                        type = "success";
                        msg = "库存汇总记录添加成功";
                    } else if (response.result === "error") {
                        type = "error";
                        msg = "库存汇总记录添加失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();

                    // reset
                    $('#goods_statistics_form')[0].reset();
                },
                error: function (response) {
                }
            })
        })
    }

    var import_step = 1;
    var import_start = 1;
    var import_end = 3;

    // 导入库存信息
    function importStorageAction() {
        $('#import_storage').click(function () {
            $('#import_modal').modal("show");
        });

        $('#previous').click(function () {
            if (import_step > import_start) {
                var preID = "step" + (import_step - 1)
                var nowID = "step" + import_step;

                $('#' + nowID).addClass("hide");
                $('#' + preID).removeClass("hide");
                import_step--;
            }
        })

        $('#next').click(function () {
            if (import_step < import_end) {
                var nowID = "step" + import_step;
                var nextID = "step" + (import_step + 1);

                $('#' + nowID).addClass("hide");
                $('#' + nextID).removeClass("hide");
                import_step++;
            }
        })

        $('#file').on("change", function () {
            $('#previous').addClass("hide");
            $('#next').addClass("hide");
            $('#submit').removeClass("hide");
        })

        $('#submit').click(function () {
            var nowID = "step" + import_end;
            $('#' + nowID).addClass("hide");
            $('#uploading').removeClass("hide");

            // next
            $('#confirm').removeClass("hide");
            $('#submit').addClass("hide");

            // ajax
            $.ajaxFileUpload({
                url: "storageManage/importStorageRecord",
                secureuri: false,
                dataType: 'json',
                fileElementId: "file",
                success: function (data, status) {
                    var total = 0;
                    var available = 0;
                    var msg1 = "库存信息导入成功";
                    var msg2 = "库存信息导入失败";
                    var info;

                    $('#import_progress_bar').addClass("hide");
                    if (data.result == "success") {
                        total = data.total;
                        available = data.available;
                        info = msg1;
                        $('#import_success').removeClass('hide');
                    } else {
                        info = msg2
                        $('#import_error').removeClass('hide');
                    }
                    info = info + ",总条数：" + total + ",有效条数:" + available;
                    $('#import_result').removeClass('hide');
                    $('#import_info').text(info);
                    $('#confirm').removeClass('disabled');
                }, error: function (data, status) {
                }
            })
        })

        $('#confirm').click(function () {
            importModalReset();
        })
    }

    // 导出库存信息
    function exportStorageAction() {
        $('#export_storage').click(function () {
            $('#export_modal').modal("show");
        })

        $('#export_storage_download').click(function () {
            var data = {
                searchType: search_type_storage,
                keyword: search_keyWord
            }
            var url = "storageManage/exportStorageRecord?" + $.param(data)
            window.open(url, '_blank');
            $('#export_modal').modal("hide");
        })
    }

    // 导入库存信息模态框重置
    function importModalReset() {
        var i;
        for (i = import_start; i <= import_end; i++) {
            var step = "step" + i;
            $('#' + step).removeClass("hide")
        }
        for (i = import_start; i <= import_end; i++) {
            var step = "step" + i;
            $('#' + step).addClass("hide")
        }
        $('#step' + import_start).removeClass("hide");

        $('#import_progress_bar').removeClass("hide");
        $('#import_result').removeClass("hide");
        $('#import_success').removeClass('hide');
        $('#import_error').removeClass('hide');
        $('#import_progress_bar').addClass("hide");
        $('#import_result').addClass("hide");
        $('#import_success').addClass('hide');
        $('#import_error').addClass('hide');
        $('#import_info').text("");
        $('#file').val("");

        $('#previous').removeClass("hide");
        $('#next').removeClass("hide");
        $('#submit').removeClass("hide");
        $('#confirm').removeClass("hide");
        $('#submit').addClass("hide");
        $('#confirm').addClass("hide");

        $('#file').on("change", function () {
            $('#previous').addClass("hide");
            $('#next').addClass("hide");
            $('#submit').removeClass("hide");
        })

        import_step = 1;
    }

    // 操作结果提示模态框
    function infoModal(type, msg) {
        $('#info_success').removeClass("hide");
        $('#info_error').removeClass("hide");
        if (type == "success") {
            $('#info_error').addClass("hide");
        } else if (type == "error") {
            $('#info_success').addClass("hide");
        }
        $('#info_content').text(msg);
        $('#info_modal').modal("show");
    }

    // table切换
    function triggerBtnGroup() {
        $('.goodsStatics').addClass('hide');
        $('#goodsStaticsList').removeClass('hide');
        $('input[type=radio]').change(function () {
            $('.goodsStatics').addClass('hide');
            radioValue = $(this).val();
            console.log(radioValue);
            if (radioValue === '库存汇总') {
                $('#goodsStaticsList').removeClass('hide');
            }
            if (radioValue === '物资库') {
                $('#goodsRepoTable').removeClass('hide');
            }
            if (radioValue === '一线') {
                $('#firstRepoTable').removeClass('hide');
            }
            if (radioValue === '二线') {
                $('#secondRepoTable').removeClass('hide');
            }
        })
    }

</script>

<div class="panel panel-default">
    <ol class="breadcrumb">
        <div class="btn-group" role="group" data-toggle="buttons">
            <label class="btn btn-default active">
                <input type="radio" name="radioBtn" checked value="库存汇总">库存汇总
            </label>
            <label class="btn btn-default">
                <input type="radio" name="radioBtn" value="物资库">物资库
            </label>
            <label class="btn btn-default">
                <input type="radio" name="radioBtn" value="一线">一线
            </label>
            <label class="btn btn-default">
                <input type="radio" name="radioBtn" value="二线">二线
            </label>
        </div>
    </ol>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-1  col-sm-2">
                <div class="btn-group">
                    <button class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
                        <span id="search_type">查询方式</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:void(0)" class="dropOption">物料描述</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">所有</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <div>
                    <div class="col-md-3 col-sm-3">
                        <input id="search_input_type" type="text" class="form-control" placeholder="" readonly />
                    </div>
                    <!--通过后台查询信息-->
                    <div class="col-md-3 col-sm-4">
                        <select class="form-control" id="search_goods_type">
                            <option value="">请选择物料属性</option>
                            <option value="可维修">可维修</option>
                            <option value="不可维修">不可维修</option>
                        </select>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <button id="search_button" class="btn btn-success">
                            <span class="glyphicon glyphicon-search"></span> <span>查询</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 25px">
            <div class="col-md-5">
                <button class="btn btn-sm btn-default" id="add_storage">
                    <span class="glyphicon glyphicon-plus"></span> <span>添加库存汇总</span>
                </button>
                <button class="btn btn-sm btn-default" id="import_storage">
                    <span class="glyphicon glyphicon-import"></span> <span>导入</span>
                </button>
                <button class="btn btn-sm btn-default" id="export_storage">
                    <span class="glyphicon glyphicon-export"></span> <span>导出</span>
                </button>
            </div>
            <div class="col-md-5"></div>
        </div>

        <div class="row" style="margin-top: 15px">
            <div class="col-md-12">
                <table id="goodsStaticsList" class="table table-striped goodsStatics"></table>
                <table id="goodsRepoTable" class="table table-striped goodsStatics"></table>
                <table id="firstRepoTable" class="table table-striped goodsStatics"></table>
                <table id="secondRepoTable" class="table table-striped goodsStatics"></table>
            </div>
        </div>
    </div>
</div>

<!-- 预览图片模态框 -->
<div class="modal fade" id="image_preview_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">物资照片</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div style="text-align: center;">
                        <img src="" alt="" id="preview_image" style="width: 98%">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加库存信息模态框 -->
<div id="add_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">添加库存汇总记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="goods_statistics_form"
                              style="margin-top: 25px">
                            <div class="form-group">
                                <label for="goods_input" class="control-label col-md-4 col-sm-4">
                                    <span>物料描述：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" id="goods_input" name="goodName" class="form-control"
                                           placeholder="请输入物料描述" />
                                    <input type="hidden" id="goods_id" name="goodsId"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>总数：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="totalNumber" placeholder="请输入总数" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>借出：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="outNumber" placeholder="请输入借出" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>库余：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="leaveNumber" placeholder="请输入库余" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>湖湘：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="xianghuNumber" placeholder="请输入湖湘" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>南阳：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="nanyangNumber" placeholder="请输入南阳" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>七堡：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="qibaoNumber" placeholder="请输入七堡" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>故障件（一线）：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="faultOneNumber" placeholder="请输入故障件（一线）" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>故障件（二线）：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="faultTwoNumber" placeholder="请输入故障件（二线）" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>返修中：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="reworkingNumber" placeholder="请输入返修中" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>返修回：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="reworkNumber" placeholder="请输入返修回" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>大修拆回：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="overhaulNumber" placeholder="请输入大修拆回" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">
                                    <span>报废：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" name="scrapNumber" placeholder="请输入报废" />
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="add_modal_submit">
                    <span>提交</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 导入库存信息模态框 -->
<div class="modal fade" id="import_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">导入库存信息</h4>
            </div>
            <div class="modal-body">
                <div id="step1">
                    <div class="row" style="margin-top: 15px">
                        <div class="col-md-1 col-sm-1"></div>
                        <div class="col-md-10 col-sm-10">
                            <div>
                                <h4>点击下面的下载按钮，下载库存信息电子表格</h4>
                            </div>
                            <div style="margin-top: 30px; margin-buttom: 15px">
                                <!--下载本地表格，被FileSourceHandler拦截-->
                                <a class="btn btn-info"
                                   href="commons/fileSource/download/storageRecord.xlsx"
                                   target="_blank"> <span class="glyphicon glyphicon-download"></span>
                                    <span>下载</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="step2" class="hide">
                    <div class="row" style="margin-top: 15px">
                        <div class="col-md-1 col-sm-1"></div>
                        <div class="col-md-10 col-sm-10">
                            <div>
                                <h4>请按照库存信息电子表格中指定的格式填写需要添加的一个或多个库存信息</h4>
                            </div>
                            <div class="alert alert-info"
                                 style="margin-top: 10px; margin-buttom: 30px">
                                <p>注意：表格中各个列均不能为空，若存在未填写的项，则该条信息将不能成功导入</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="step3" class="hide">
                    <div class="row" style="margin-top: 15px">
                        <div class="col-md-1 col-sm-1"></div>
                        <div class="col-md-8 col-sm-10">
                            <div>
                                <div>
                                    <h4>请点击下面上传文件按钮，上传填写好的库存信息电子表格</h4>
                                </div>
                                <div style="margin-top: 30px; margin-buttom: 15px">
									<span class="btn btn-info btn-file"> <span> <span
                                            class="glyphicon glyphicon-upload"></span> <span>上传文件</span>
									</span>
									<form id="import_file_upload"><input type="file" id="file" name="file"></form>
									</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hide" id="uploading">
                    <div class="row" style="margin-top: 15px" id="import_progress_bar">
                        <div class="col-md-1 col-sm-1"></div>
                        <div class="col-md-10 col-sm-10"
                             style="margin-top: 30px; margin-bottom: 30px">
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-success"
                                     role="progreessbar" aria-valuenow="60" aria-valuemin="0"
                                     aria-valuemax="100" style="width: 100%;">
                                    <span class="sr-only">请稍后...</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 col-sm-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4"></div>
                        <div class="col-md-4 col-sm-4">
                            <div id="import_result" class="hide">
                                <div id="import_success" class="hide" style="text-align: center;">
                                    <img src="media/icons/success-icon.png" alt=""
                                         style="width: 100px; height: 100px;">
                                </div>
                                <div id="import_error" class="hide" style="text-align: center;">
                                    <img src="media/icons/error-icon.png" alt=""
                                         style="width: 100px; height: 100px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4"></div>
                    </div>
                    <div class="row" style="margin-top: 10px">
                        <div class="col-md-3 col-sm-3"></div>
                        <div class="col-md-6 col-sm-6" style="text-align: center;">
                            <h4 id="import_info"></h4>
                        </div>
                        <div class="col-md-3 col-sm-3"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn ben-default" type="button" id="previous">
                    <span>上一步</span>
                </button>
                <button class="btn btn-success" type="button" id="next">
                    <span>下一步</span>
                </button>
                <button class="btn btn-success hide" type="button" id="submit">
                    <span>&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;</span>
                </button>
                <button class="btn btn-success hide disabled" type="button"
                        id="confirm" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;确认&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 导出库存信息模态框 -->
<div class="modal fade" id="export_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">导出库存信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3" style="text-align: center;">
                        <img src="media/icons/warning-icon.png" alt=""
                             style="width: 70px; height: 70px; margin-top: 20px;">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3>是否确认导出库存信息</h3>
                        <p>(注意：请确定要导出的库存信息，导出的内容为当前列表的搜索结果)</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="export_storage_download">
                    <span>确认下载</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 提示消息模态框 -->
<div class="modal fade" id="info_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4">
                        <div id="info_success" class=" hide" style="text-align: center;">
                            <img src="media/icons/success-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                        <div id="info_error" style="text-align: center;">
                            <img src="media/icons/error-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4" style="text-align: center;">
                        <h4 id="info_content"></h4>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 删除提示模态框 -->
<div class="modal fade" id="deleteWarning_modal" table-index="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">警告</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3" style="text-align: center;">
                        <img src="media/icons/warning-icon.png" alt=""
                             style="width: 70px; height: 70px; margin-top: 20px;">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3>是否确认删除该条库存信息</h3>
                        <p>(注意：一旦删除该条库存信息，将不能恢复)</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-danger" type="button" id="delete_confirm">
                    <span>确认删除</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 物料移库模态框 -->
<div id="edit_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">移库</h4>
            </div>
            <div class="modal-body">
                <!-- 模态框的内容 -->
                <form class="form-horizontal" role="form" id="move_goods_form">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>货物编码：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <p id="goods_code" class="form-control-static"></p>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>货物描述：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <p id="goods_name" class="form-control-static"></p>
                            </div>
                        </div>
                        <input type="hidden" id="move_goods_id" name="goodsId" />
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>移出仓库：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <select name="outRepoId" class="form-control move">
                                    <option value="">请选择仓库</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>移入仓库：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <select name="inRepoId" class="form-control move">
                                    <option value="">请选择仓库</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>数量：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <input type="text" class="form-control" placeholder="请输入数量" name="moveGoodsNumber" />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6">
                            <label class="control-label col-md-5 col-sm-5">
                                <span>备注：</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <input type="text" class="form-control" placeholder="请输入备注" name="remark" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="edit_modal_submit">
                    <span>确认移库</span>
                </button>
            </div>
        </div>
    </div>
</div>

<style type="text/css">.ui-autocomplete{z-index:99999;}</style>
