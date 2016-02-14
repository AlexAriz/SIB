# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#scholarships-table').DataTable
    'dom': 'T<"clear">lfrtip'
    'tableTools':
      'sSwfPath': '/swf/copy_csv_xls_pdf.swf'
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
            4
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
            4
          ]
        }
      ]
  return