<html>
 <head>
  <title>PHP Teste</title>
 </head>
 <body>
 	<?php 
	 	function calc_nt ($nt)
		{
			$a = 98.96;
			$b = -0.2232;
			$c = -0,006457;
			$res1 = pow ($nt, $b+$c*$nt);
			return ($a * $nt);
		}

	echo "<p>Ola</p>";
 	?>
 </body>
</html>