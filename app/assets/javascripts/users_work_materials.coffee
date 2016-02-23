# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#users-work-materials-table').DataTable
    'dom': 'T<"clear">lfrtip'
    'tableTools':
      'sSwfPath': '/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf'
      'aButtons': [
        {
          'sExtends': 'xls'
          'sButtonText': 'Excel'
          'sTitle': 'Materiales de trabajo'
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
          'sTitle': 'Materiales de trabajo'
          'mColumns': [
            0
            1
            2
            3
          ]
        }
      ]
  return
