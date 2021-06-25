<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 하기</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
    var cnt = 1;
    function fn_addFile(){
        $("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
        cnt++;
    }
    
    $(function(){
    	$("#frm").submit(function(){
    	
   	    	var formData = new FormData($('#frm')[0]);
   	    	$.ajax({
   	    		type : 'post',
   	    		url : 'upload',
   	    		data : formData,
   	    		processData : false,
   	    		contentType : false,
   	    		success : function(data){
   	    			if(data == "ok")
   	    			alert("파일을 업로드 하였습니다");
   	    		},
   	    		error : function(error){
   	    			alert("파일 업로드에 실패하였습니다.");
   	    			console.log(error);
   	    			console.log(error.status);
   	    		}
   	    	})
    	    
    	})
    })
</script>
 
</head>
<body>
    <h1>파일 업로드 하기</h1>
    <form id="frm" method="post" 
           enctype="multipart/form-data">
        <label>아이디 : </label>
            <input type="text" name="id"><br>
        <label>이름 : </label>
            <input type="text" name="name"><br>
            <input type="button" value="파일 추가" onClick="fn_addFile()"><br>
            
            <div id="d_file">
            
            </div>
            <input type="submit" value="업로드">
    </form>
</body>
</html>
