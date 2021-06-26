<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript">
 var maxFileNum = document.frm.posblAtchFileNumber.value;
 if(maxFileNum==null || maxFileNum==""){
   maxFileNum = 3;
  }     
 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );			
</script>  


<body>

<table width="680px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
   <tr>
    <td><input name="file_1" id="egovComFileUploader" type="file" /></td>
   </tr>
   <tr>
    <td>
     <div id="egovComFileList"></div>
    </td>
   </tr>
  </table>
  
</body>
</html>