jQuery ->
	$('#fileupload').fileupload()
	add: (e, data) ->
	    data.context = $(tmpl("template-upload", data.files[0]))
	    $('#fileupload').append(data.context)
	    data.submit()
	progress: (e, data) ->
		if data.context
			progress = parseInt(data.loaded / data.total * 100, 100)
			data.context.find('.bar').css('width', progress + '%')