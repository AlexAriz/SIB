$(function () {
    $('#users-table').DataTable({
        'dom': 'T<"clear">lfrtip',
        'tableTools': {
            'sSwfPath': '/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf',
            "aButtons": [
                {
                    "sExtends": "xls",
                    "sButtonText": "Excel",
                    "sTitle": 'Usuarios',
                    "mColumns": [0, 1, 2, 3]
                },
                {
                    "sExtends": "pdf",
                    "sButtonText": "PDF",
                    "sTitle": 'Usuarios',
                    "mColumns": [0, 1, 2, 3]
                }
            ]
        }
    });
});