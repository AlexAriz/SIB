$ ->
  $('#scholarships-table').DataTable
    'dom': 'T<"clear">lfrtip'
    'tableTools':
      'sSwfPath': '/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf'
      'aButtons': [
        {
          'sExtends': 'xls'
          'sButtonText': 'Excel'
          'sTitle': 'Becas'
          'mColumns': [
            0
            1
            2
            3
          ]
        }
        {
          'sExtends': 'pdf'
          'sButtonText': 'PDF'
          'sTitle': 'Becas'
          'mColumns': [
            0
            1
            2
            3
          ]
        }
      ]
  return
