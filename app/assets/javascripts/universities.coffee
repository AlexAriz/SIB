$ ->
  $('#universities-table').DataTable
    'dom': 'T<"clear">lfrtip'
    'tableTools':
      'sSwfPath': '/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf'
      'aButtons': [
        {
          'sExtends': 'xls'
          'sButtonText': 'Excel'
          'sTitle': 'Universidades'
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
          'sTitle': 'Universidades'
          'mColumns': [
            0
            1
            2
            3
          ]
        }
      ]
  return
