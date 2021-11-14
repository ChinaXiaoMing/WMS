<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script>
    var stockout_repository = null;
    var stockout_customer = null;
    var stockout_goods = null;
    var stockout_number = null;

    var customerCache = [];
    var goodsCache = [];

    $(function () {
        dataValidateInit();
        repositorySelectorInit();
        detilInfoToggle();
        stockoutOperation();

        fetchStorage();
        goodsAutocomplete();
    })

    function dataValidateInit() {
        $('#stockout_form').bootstrapValidator({
            message: 'This is not valid',
            fields: {
                goods_name: {
                    validators: {
                        notEmpty: {
                            message: '货物不能为空'
                        }
                    }
                },
                repository_id: {
                    validators: {
                        callback: {
                            message: '请选择出库仓库',
                            callback: function (value) {
                                return value !== "";
                            }
                        }
                    }
                },
                stockout_number: {
                    validators: {
                        notEmpty: {
                            message: '入库数量不能为空'
                        },
                        greaterThan: {
                            value: 0,
                            message: '入库数量不能小于0'
                        }
                    }
                }
            }
        });
    }

    //货物信息自动匹配
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
                        var autoCompleteInfo = [];
                        $.each(data.rows, function (index, elem) {
                            goodsCache.push(elem);
                            autoCompleteInfo.push({label: elem.name, value: elem.id});
                        });
                        response(autoCompleteInfo);
                    }
                });
            },
            focus: function (event, ui) {
                $('#goods_input').val(ui.item.label);
                return false;
            },
            select: function (event, ui) {
                $('#goods_input').val(ui.item.label);
                stockout_goods = ui.item.value;
                goodsInfoSet(stockout_goods);
                loadStorageInfo();
                return false;
            }
        })
    }

    // 填充货物详细信息
    function goodsInfoSet(goods_id) {
        var detailInfo;
        $.each(goodsCache, function (index, elem) {
            if (elem.id === goods_id) {
                detailInfo = elem;
                if (detailInfo.goodCode == null)
                    $('#goods_code').text('-');
                else
                    $('#goods_code').text(detailInfo.goodCode);

                if (detailInfo.name == null)
                    $('#goods_name').text('-');
                else
                    $('#goods_name').text(detailInfo.name);

                if (detailInfo.type == null)
                    $('#goods_type').text('-');
                else
                    $('#goods_type').text(detailInfo.type);

                if (detailInfo.size == null)
                    $('#goods_size').text('-');
                else
                    $('#goods_size').text(detailInfo.size);

                if (detailInfo.carNumber == null)
                    $('#goods_car_number').text('-');
                else
                    $('#goods_car_number').text(detailInfo.carNumber);
                if (detailInfo.goodImportance == null)
                    $('#goods_importance').text('-');
                else
                    $('#goods_importance').text(detailInfo.goodImportance);
            }
        })
    }

    function detilInfoToggle() {
        $('#info-show').click(function () {
            $('#detailInfo').removeClass('hide');
            $(this).addClass('hide');
            $('#info-hidden').removeClass('hide');
            $('#hide_div').addClass('hide');
        });

        $('#info-hidden').click(function () {
            $('#detailInfo').removeClass('hide').addClass('hide');
            $(this).addClass('hide');
            $('#info-show').removeClass('hide');
            $('#hide_div').removeClass('hide');
        });
    }

    //仓库下拉列表初始化
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
                    $('#repository_selector').append("<option value='" + elem.id + "'>" + elem.name + "</option>");
                });
            },
            error: function (response) {
                $('#repository_selector').append("<option value='-1'>加载失败</option>");
            }

        })
    }

    function fetchStorage() {
        $('#repository_selector').change(function () {
            stockout_repository = $(this).val();
            loadStorageInfo();
        });
    }

    function loadStorageInfo() {
        if (stockout_repository != null && stockout_goods != null) {
            $.ajax({
                type: 'GET',
                url: 'storageManage/getStorageListWithRepository',
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    offset: -1,
                    limit: -1,
                    searchType: 'searchByGoodsID',
                    repositoryBelong: stockout_repository,
                    keyword: stockout_goods
                },
                success: function (response) {
                    if (response.total > 0) {
                        data = response.rows[0].number;
                        $('#info_storage').text(data);
                    } else {
                        $('#info_storage').text('0');
                    }
                },
                error: function (response) {

                }
            })
        }
    }

    //执行货物出库操作
    function stockoutOperation() {
        $('#submit').click(function () {
            // data validate
            $('#stockout_form').data('bootstrapValidator').validate();
            if (!$('#stockout_form').data('bootstrapValidator').isValid()) {
                return;
            }

            data = {
                goodsId: stockout_goods,
                repositoryId: stockout_repository,
                number: $('#stockout_number').val(),
                remark: $('#stockout_remark').val()
            }

            $.ajax({
                type: 'POST',
                url: 'stockRecordManage/stockOut',
                dataType: 'json',
                content: 'application/json',
                data: data,
                success: function (response) {
                    var msg;
                    var type;

                    if (response.result == "success") {
                        type = 'success';
                        msg = '货物出库成功';
                        inputReset();
                    } else {
                        type = 'error';
                        msg = '货物出库失败'
                    }
                    infoModal(type, msg);
                },
                error: function (response) {
                    var msg = "服务器错误";
                    var type = "error";
                    infoModal(type, msg);
                }
            })
        });
    }

    function inputReset() {
        $('#goods_input').val('');
        $('#stockout_input').val('');
        $('#goods_Id').text('-');
        $('#goods_name').text('-');
        $('#goods_size').text('-');
        $('#goods_type').text('-');
        $('#goods_car_number').text('-');
        $('#storage').text('-');
        $('#goods_importance').text('-');
        $('#stockout_form').bootstrapValidator("resetForm", true);
    }

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
        <li>货物出库</li>
    </ol>
    <div class="panel-body">
        <div class="col-md-8 col-sm-8 col-md-offset-4 col-sm-offset-4">
            <form class="form-horizontal" role="form" id="stockout_form">
                <div class="row">
                    <div class="form-group col-md-6 col-sm-6">
                        <label for="goods_input" class="control-label col-md-4 col-sm-4">出库货物：</label>
                        <div class="col-md-8 col-sm-8">
                            <input type="text" class="form-control" id="goods_input" name="goods_name" placeholder="请输入物料描述">
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6"></div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-6" id="hide_div" style="margin-bottom:15px"></div>
                    <div class="hide col-md-6 col-sm-6" id="detailInfo" style="margin-bottom:15px">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <label class="text-info" style="margin-left:7%">货物信息</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>物料编码：<span id="goods_code">-</span></span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>物料描述：<span id="goods_name">-</span></span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>单位：<span id="goods_size">-</span></span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>车号：<span id="goods_car_number">-</span></span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>重要性：<span id="goods_importance">-</span></span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
                                <span>物料属性：<span id="goods_type">-</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="visible-md visible-lg col-md-6 col-sm-6">
                        <div class='pull-right' style="cursor:pointer" id="info-show">
                            <span>显示详细信息</span>
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </div>
                        <div class='pull-right hide' style="cursor:pointer" id="info-hidden">
                            <span>隐藏详细信息</span>
                            <span class="glyphicon glyphicon-chevron-up"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6 col-sm-6">
                        <label for="repository_selector" class="control-label col-md-4 col-sm-4">出库仓库：</label>
                        <div class="col-md-8 col-sm-8">
                            <select name="repository_id" id="repository_selector" class="form-control">
                                <option value="">请选择仓库</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6"></div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6 col-sm-6">
                        <label for="stockout_number" class="control-label col-md-4 col-sm-4">出库数量：</label>
                        <div class="col-md-8 col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入数量" id="stockout_number"
                                   name="stockout_number">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6" style="padding-top:7px;">
                        <span>(当前库存量：</span>
                        <span id="info_storage">-</span>
                        <span>)</span>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6 col-sm-6">
                        <label for="stockout_remark" class="control-label col-md-4 col-sm-4">备注：</label>
                        <div class="col-md-8 col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入备注" id="stockout_remark"
                                   name="remark">
                        </div>
                    </div>
                    <div class="form-group col-md-6 col-sm-6"></div>
                </div>
            </form>
        </div>
        <div class="row" style="margin-top:80px"></div>
    </div>
    <div class="panel-footer">
        <div style="text-align:center">
            <button class="btn btn-success" id="submit">提交出库</button>
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
                <h4 class="modal-title" id="myModalLabel">信息</h4>
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