// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require bootstrap/dist/js/bootstrap
//= require data-confirm-modal
//= require bootstrap-select
//= require is_js_rails
//= require turbolinks
//= require_tree .
$(function () {
    //Para el Modal
    dataConfirmModal.setDefaults({
        title: 'Confirmar Acción',
        commit: 'Confirmar',
        cancel: 'Cerrar'
    });

    $('#example-data-table').DataTable({
        'dom': 'T<"clear">lfrtip',
        'tableTools': {
            'sSwfPath': '/swf/copy_csv_xls_pdf.swf',
            "aButtons": [
                {
                    "sExtends": "xls",
                    "sButtonText": "Excel",
                    "sTitle": 'Clientes',
                    "mColumns": [1, 2, 3]
                },
                {
                    "sExtends": "pdf",
                    "sButtonText": "PDF",
                    "sTitle": 'Clientes',
                    "mColumns": [1, 2, 3]
                }
            ]
        }
    });


});