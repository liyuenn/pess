<!DOCTYPE html>
<html>
<head>
<title>Log Call</title>
<script>
function validateForm() {
  var x = document.forms["frmLogCall"]["callername"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
}
</script>

<?php include '08_liyuen.php'; 

	if(isset($_POST['btnProcessCall']))
	{
		$con = mysql_connect("localhost", "liyuen", "liyuennn7");
		if(!$con)
			die("Cannot connect to database:" . mysql_error());
		mysql_select_db("pess_liyuen", $con);
		
		$sql = "INSERT INTO incident(callerName, phoneNumber, incidentTypeId, incidentLocation, incidentDesc, incidentStatusId)VALUES('$_POST[callerName]','$_POST[contactNo]','$_POST[incidentType]','$_POST[location]','$_POST[incidentDesc]','1')";
		
		if(!mysql_query($sql, $con))
			die("Error: " . mysql_error());
		
		mysql_close($con);
		
	}
?>
</head>
<body>
	<?php
				//localhost, accountName, password
		$con = mysql_connect("localhost", "liyuen", "liyuennn7");
		if(!$con)
			die("Cannot connect to database: " . mysql_error());
	
				// databaseName
		mysql_select_db("pess_liyuen", $con);
		
		$result = mysql_query("SELECT * FROM incidenttype");
		
		$incidentType;
		
		while($row = mysql_fetch_array($result))
			$incidentType[$row['incidentTypeId']] = $row['incidentTypeDesc'];
		
		mysql_close($con);
	?>
	
	<form name="frmLogCall" method="POST" onsubmit="return validateForm()" action="dispatch.php">
	<br>
	<fieldset>
	<legend>Log Call</legend>
	<table>
		<tr>
			<td>Caller's Name:</td>
			<td><p><input type="text" name="callerName" /></p></td>
		</tr>
		<tr>
			<td>Contact No:</td>
			<td><p><input type="text" name="contactNo" /></p></td>
		</tr>
		<tr>
			<td align="right">Location:</td>
			<td><p><input type="text" name="location"></p></td>
		</tr>
		<tr>
			<td align="right" class="td_label">Incident Type:</td>
			<td class="td_Date">
				<p>
				<select name="incidentType" id="incidentType">
				
			    <?php foreach($incidentType as $key => $value){ ?>
				
				<option value="<?php echo $key ?>"><?php echo $value ?></option>
				
				<?php } ?>
				
				</select>
				</p>
			</td>	
		</tr>
		<tr>
			<td>Description</td>
			<td><p><textarea name="incidentDesc" rows="5" cols="50"></textarea></p></td>
		</tr>
		<tr>
			<td><button type="reset" value="Reset">Reset</button></td>
			<td><button type="submit" name="btnProcessCall" value="Reset">Process Call</button></td>
		</tr>
	</table>
	</fieldset>
	</form>
</body>
</html>