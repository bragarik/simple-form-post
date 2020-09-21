<html>
<head>
<script type="text/javascript">
	function post() {
		// Stop form from submitting normally
		event.preventDefault();

		var form = document.getElementById("form");
		var elements = document.getElementsByClassName("form field");
		var formData = "";
		for (var i = 0; i < elements.length; i++) {
			formData += elements[i].name + "=" + elements[i].value + "&";
		}

		var xmlHttp = window.XMLHttpRequest ? new XMLHttpRequest()
				: new ActiveXObject("Microsoft.XMLHTTP");

		//Cria um evento para receber o retorno.
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var data = xmlHttp.responseText;
				// Retorno do Ajax
				alert(data);
			}
		}

		xmlHttp.open("POST", form.action, true);
		xmlHttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttp.send(formData);
	}

	function postJQuery() {
		// Stop form from submitting normally
		event.preventDefault();

		var form = $("#form");
		var url = form.attr("action");

		$.ajax({
			type : "POST",
			url : url,
			data : form.serialize(), // serializes the form's elements.
			success : function(data) {
				alert(data); // show response from the php script.
			}
		});

	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h2>Simple Form!</h2>
	<form id="form" class="ui form" action="Controller" method="post">
		<div class="field">
			<label>Código</label> <input class="form field" type='number'
				step='1'
				name="cod" placeholder="Código">
		</div>
		<div class="field">
			<label>Descrição</label> <input class="form field" type="text"
				name="desc" placeholder="Descrição">
		</div>
		<div class="field">
			<label>Valor</label> <input class="form field" type='number'
				step='0.01' name="val" placeholder="Valor">
		</div>
		<button class="ui button" type="button" onclick="post()">Salvar</button>
		<button class="ui button" type="button" onclick="postJQuery()">Salvar
			(jQuery)</button>
	</form>

</body>
</html>
