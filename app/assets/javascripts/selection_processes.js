$(function () {
    $('#selection-processes-table').DataTable({
        'dom': 'T<"clear">lfrtip',
        'tableTools': {
            'sSwfPath': '/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf',
            "aButtons": [
                {
                    "sExtends": "xls",
                    "sButtonText": "Excel",
                    "sTitle": 'Procesos de selección',
                    "mColumns": [0, 1, 2]
                },
                {
                    "sExtends": "pdf",
                    "sButtonText": "PDF",
                    "sTitle": 'Procesos de selección',
                    "mColumns": [0, 1, 2]
                }
            ]
        }
    });
});