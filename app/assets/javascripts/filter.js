// xu li menu filter khi load phan trang
	$("#category-name").val("<%=j params[:category_name] %>");
    var status_elm = document.getElementById("status_"+"<%=j params[:status] %>");
    if(status_elm){
    	status_elm.checked = true;
    }