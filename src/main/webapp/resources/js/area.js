				function areaGangNam() {
					var form = document.createElement("form");
					form.action = "/store/areaList";
					form.method = "POST";
					
					var hiddenField = document.createElement("input");
					hiddenField.type = "hidden";
					hiddenField.name = "area1";
					hiddenField.value = "강남";
					
					var hiddenField2 = document.createElement("input");
					hiddenField2.type = "hidden";
					hiddenField2.name = "area2";
					hiddenField2.value = "서초";
					
					var hiddenField3 = document.createElement("input");
					hiddenField3.type = "hidden";
					hiddenField3.name = "area3";
					hiddenField3.value = "송파";
					
					form.appendChild(hiddenField);
					form.appendChild(hiddenField2);
					form.appendChild(hiddenField3);
					
					document.body.appendChild(form);
					form.submit();
				}
				
				function areaGangseo() {
					var form = document.createElement("form");
					form.action = "/store/areaList";
					form.method = "POST";
					
					var hiddenField = document.createElement("input");
					hiddenField.type = "hidden";
					hiddenField.name = "area1";
					hiddenField.value = "강서";
					
					var hiddenField2 = document.createElement("input");
					hiddenField2.type = "hidden";
					hiddenField2.name = "area2";
					hiddenField2.value = "양천";
					
					var hiddenField3 = document.createElement("input");
					hiddenField3.type = "hidden";
					hiddenField3.name = "area3";
					hiddenField3.value = "구로";
					
					form.appendChild(hiddenField);
					form.appendChild(hiddenField2);
					form.appendChild(hiddenField3);
					
					document.body.appendChild(form);
					form.submit();
				}
				
				function areaGangbuk() {
					var form = document.createElement("form");
					form.action = "/store/areaList";
					form.method = "POST";
					
					var hiddenField = document.createElement("input");
					hiddenField.type = "hidden";
					hiddenField.name = "area1";
					hiddenField.value = "강북";
					
					var hiddenField2 = document.createElement("input");
					hiddenField2.type = "hidden";
					hiddenField2.name = "area2";
					hiddenField2.value = "동대문";
					
					var hiddenField3 = document.createElement("input");
					hiddenField3.type = "hidden";
					hiddenField3.name = "area3";
					hiddenField3.value = "종로";
					
					form.appendChild(hiddenField);
					form.appendChild(hiddenField2);
					form.appendChild(hiddenField3);
					
					document.body.appendChild(form);
					form.submit();
				}
				
				function areaGangdong() {
					var form = document.createElement("form");
					form.action = "/store/areaList";
					form.method = "POST";
					
					var hiddenField = document.createElement("input");
					hiddenField.type = "hidden";
					hiddenField.name = "area1";
					hiddenField.value = "강동";
					
					var hiddenField2 = document.createElement("input");
					hiddenField2.type = "hidden";
					hiddenField2.name = "area2";
					hiddenField2.value = "광진";
					
					var hiddenField3 = document.createElement("input");
					hiddenField3.type = "hidden";
					hiddenField3.name = "area3";
					hiddenField3.value = "천호";
					
					form.appendChild(hiddenField);
					form.appendChild(hiddenField2);
					form.appendChild(hiddenField3);
					
					document.body.appendChild(form);
					form.submit();
				}
				
