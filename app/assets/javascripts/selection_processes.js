$(function () {
    $('#selection-processes-table').DataTable({
        'dom': 'T<"clear">lfrtip',
        'tableTools': {
            "aButtons": [
                {
                    "sTitle": 'Procesos de Selección',
                    "mColumns": [0, 1, 2, 3]
                }
            ]
        }
    });
});