<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script>
    var search_type_storage = "none";
    var search_keyWord = "";
    var search_repository = "";
    var select_goodsID;
    var select_repositoryID;

    $(function () {
        optionAction();
        searchAction();
        storageListInit();
        bootstrapValidatorInit();
        repositoryOptionInit();

        addStorageAction();
        editStorageAction();
        deleteStorageAction();
        importStorageAction();
        exportStorageAction();

        //物料数据初始化
        goodsAutocomplete();
    })

    // 查询方式下拉框，为search_type_storage赋值，若为所有，搜索框不能编辑
    function optionAction() {
        $(".dropOption").click(function () {
            var type = $(this).text();
            $("#search_input").val("");
            if (type == "所有") {
                $("#search_input_type").attr("readOnly", "true");
                search_type_storage = "searchAll";
            } else if (type == "货物ID") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByGoodsID";
            } else if (type == "物料描述") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByGoodsName";
            } else if (type = "物料属性") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByGoodsType";
            } else {
                $("#search_input_type").removeAttr("readOnly");
            }

            $("#search_type").text(type);
            $("#search_input_type").attr("placeholder", type);
        })
    }

    // 仓库下拉框数据初始化，页面加载时完成
    function repositoryOptionInit() {
        $.ajax({
            type: 'GET',
            url: 'repositoryManage/getRepositoryList',
            dataType: 'json',
            contentType: 'application/json',
            data: {
                searchType: "searchAll",
                keyWord: "",
                offset: -1,
                limit: -1
            },
            success: function (response) {
                //组装option
                $.each(response.rows, function (index, elem) {
                    $('#search_input_repository').append("<option value='" + elem.id + "'>" + elem.name + "</option>");
                    $('#storage_repositoryID').append("<option value='" + elem.id + "'>" + elem.name + "</option>");
                })
            },
            error: function (response) {
            }
        });
        $('#search_input_repository').append("<option value='all'>请选择仓库</option>");
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
            search_repository = $('#search_input_repository').val();
            tableRefresh();
        })
    }

    // 分页查询参数
    function queryParams(params) {
        var temp = {
            limit: params.limit,
            offset: params.offset,
            searchType: search_type_storage,
            repositoryBelong: search_repository,
            keyword: search_keyWord
        }
        return temp;
    }

    // 表格初始化
    function storageListInit() {
        $('#storageList')
            .bootstrapTable(
                {
                    columns: [
                        {
                            field: 'goodsID',
                            title: '货物ID'
                            //sortable: true
                        },
                        {
                            field: 'goodCode',
                            title: '物料编码'
                        },
                        {
                            field: 'goodsName',
                            title: '物料描述'
                        },
                        {
                            field: 'goodsSize',
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
                            field: 'goodsType',
                            title: '物料属性'
                        },
                        {
                            field: 'repoName',
                            title: '仓库名称'
                        },
                        {
                            field: 'number',
                            title: '库存数量'
                        },
                      {
                        field: 'goodImage',
                        title: '物资照片',
                        formatter: function (value, row, index) {
                          var preview;
                          if (row.goodImage) {
                            preview = '<button class="btn btn-info btn-sm preview" id="preview"><span>预览</span></button>';
                          } else {
                            preview = '没有物资照片';
                          }
                          return preview;
                        },
                            events: {
                              "click .preview": function (e, value, row, index) {
                                preview(row);
                              }
                            }
                        },
                        {
                            field: 'operation',
                            title: '操作',
                            formatter: function (value, row, index) {
                                var s = '<button class="btn btn-info btn-sm edit"><span>编辑</span></button>';
                                var d = '<button class="btn btn-danger btn-sm delete"><span>删除</span></button>';
                                var fun = '';
                                return s + ' ' + d;
                            },
                            events: {
                                // 操作列中编辑按钮的动作，rowEditOperation(row)，传入row
                                'click .edit': function (e, value,
                                                         row, index) {
                                    //selectID = row.id;
                                    rowEditOperation(row);
                                },
                                'click .delete': function (e,
                                                           value, row, index) {
                                    select_goodsID = row.goodsID;
                                    select_repositoryID = row.repositoryID
                                    $('#deleteWarning_modal').modal(
                                        'show');
                                }
                            }
                        }],
                    url: 'storageManage/getStorageListWithRepository',
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
        $('#storageList').bootstrapTable('refresh', {
            query: {}
        });
    }

    // 物资照片预览
    function preview(row) {
      // 显示预览窗口
      $('#image_preview_modal').modal("show");
      console.log("/upload/" + row.goodImage);
      $('#preview_image').attr("src", "/upload/" + row.goodImage);
      $('#image_a').attr("href", "/upload/" + row.goodImage);
    }

    // 行编辑操作模态框展示与数据填充
    function rowEditOperation(row) {
        $('#edit_modal').modal("show");

        // load info
        $('#storage_form_edit').bootstrapValidator("resetForm", true);
        $('#storage_goodsName_edit').text(row.goodsName);
        $('#storage_repositoryID_edit').text(row.repoName);
        $('#storage_number_edit').val(row.number);
        $('#goodsID').text(row.goodsID);
        $('#repositoryID').text(row.repositoryID);
    }

    // 添加库存信息模态框数据校验
    function bootstrapValidatorInit() {
        $("#storage_form").bootstrapValidator({
            message: 'This is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled'],
            fields: {
                goodName: {
                    validators: {
                        notEmpty: {
                            message: '物料描述不能为空'
                        }
                    }
                },
                storage_repositoryID: {
                    validators: {
                        notEmpty: {
                            message: '仓库名称不能为空'
                        }
                    }
                },
                storage_number: {
                    validators: {
                        notEmpty: {
                            message: '库存数量不能为空'
                        },
                        greaterThan: {
                            value: 0,
                            message: '入库数量不能小于0'
                        }
                    }
                }
            }
        })
    }

    // 编辑库存信息，表单数据提交
    function editStorageAction() {
        $('#edit_modal_submit').click(
            function () {
                $('#storage_form_edit').data('bootstrapValidator')
                    .validate();
                if (!$('#storage_form_edit').data('bootstrapValidator')
                    .isValid()) {
                    return;
                }

                var data = {
                    goodsID: $('#goodsID').text(),
                    repositoryID: $('#repositoryID').text(),
                    number: $('#storage_number_edit').val(),
                }

                // ajax
                $.ajax({
                    type: "POST",
                    url: 'storageManage/updateStorageRecord',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function (response) {
                        $('#edit_modal').modal("hide");
                        var type;
                        var msg;
                        if (response.result == "success") {
                            type = "success";
                            msg = "库存信息更新成功";
                        } else if (resposne == "error") {
                            type = "error";
                            msg = "库存信息更新失败"
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
            var data = {
                "goodsID": select_goodsID,
                "repositoryID": select_repositoryID
            }

            // ajax
            $.ajax({
                type: "GET",
                url: "storageManage/deleteStorageRecord",
                dataType: "json",
                contentType: "application/json",
                data: data,
                success: function (response) {
                    $('#deleteWarning_modal').modal("hide");
                    let type;
                    let msg;
                    if (response.result === "success") {
                        type = "success";
                        msg = "库存信息删除成功";
                    } else {
                        type = "error";
                        msg = "库存信息删除失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();
                }, error: function (response) {
                }
            })

            $('#deleteWarning_modal').modal('hide');
        })
    }

    // 添加库存信息
    function addStorageAction() {
        $('#add_storage').click(function () {
            $('#add_modal').modal("show");
        });

        $('#add_modal_submit').click(function () {
            var data = {
                goodsID: $('#goods_id').val(),
                repositoryID: $('#storage_repositoryID').val(),
                number: $('#storage_number').val()
            }
            // ajax
            $.ajax({
                type: "POST",
                url: "storageManage/addStorageRecord",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (response) {
                    $('#add_modal').modal("hide");
                    let msg;
                    let type;
                    if (response.result === "success") {
                        type = "success";
                        msg = "库存信息添加成功";
                    } else if (response.result === "error") {
                        type = "error";
                        msg = "库存信息添加失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();

                    // reset
                    $('#goods_input').val("");
                    $('#storage_repositoryID').val("");
                    $('#storage_number').val("");
                    $('#storage_form').bootstrapValidator("resetForm", true);
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
                repositoryBelong: search_repository,
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
</script>

<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>库存信息管理</li>
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
                        <li><a href="javascript:void(0)" class="dropOption">货物ID</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">物料描述</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">物料属性</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">所有</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <div>
                    <div class="col-md-3 col-sm-3">
                        <input id="search_input_type" type="text" class="form-control"
                               placeholder="货物ID">
                    </div>
                    <!--通过后台查询仓库信息-->
                    <div class="col-md-3 col-sm-4">
                        <select class="form-control" id="search_input_repository">
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
                    <span class="glyphicon glyphicon-plus"></span> <span>添加库存信息</span>
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
                <table id="storageList" class="table table-striped"></table>
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
                        <a id="image_a" href="" target="_Blank"><img src="" alt="" id="preview_image" style="width: 98%"></a>
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
                <h4 class="modal-title">添加库存记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="storage_form"
                              style="margin-top: 25px">
                            <div class="form-group">
                                <label for="goods_input" class="control-label col-md-4 col-sm-4">
                                    <span>物料描述：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" id="goods_input" name="goodName" class="form-control"
                                           placeholder="请输入物料描述" />
                                    <input type="hidden" id="goods_id" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="storage_repositoryID" class="control-label col-md-4 col-sm-4">
                                    <span>仓库名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <select name="storage_repositoryID" id="storage_repositoryID" class="form-control">
                                        <option value="">请选择仓库</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="storage_number" class="control-label col-md-4 col-sm-4">
                                    <span>数量：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="storage_number"
                                           name="storage_number" placeholder="数量">
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

<!-- 编辑库存模态框 -->
<div id="edit_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">编辑货物信息</h4>
            </div>
            <div class="modal-body">
                <!-- 模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="storage_form_edit"
                              style="margin-top: 25px">
                            <div class="form-group">
                                <label for="storage_goodsName_edit" class="control-label col-md-4 col-sm-4">
                                    <span>货物描述：</span>
                                </label>
                                <div class="col-md-4 col-sm-4">
                                    <p id="storage_goodsName_edit" class="form-control-static"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="storage_repositoryID_edit" class="control-label col-md-4 col-sm-4">
                                    <span>仓库名称：</span>
                                </label>
                                <div class="col-md-4 col-sm-4">
                                    <p id="storage_repositoryID_edit" class="form-control-static"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="storage_number_edit" class="control-label col-md-4 col-sm-4">
                                    <span>数量：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="storage_number_edit"
                                           name="storage_number" placeholder="库存数量">
                                </div>
                            </div>
                            <input type="hidden" id="goodsID" />
                            <input type="hidden" id="repositoryID" />
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="edit_modal_submit">
                    <span>确认更改</span>
                </button>
            </div>
        </div>
    </div>
</div>
<style type="text/css">.ui-autocomplete{z-index:99999;}</style>
