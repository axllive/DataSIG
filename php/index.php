<html>
 <head>
  <title>Funções</title>
 </head>
 <body>

<?php
	function calc_cf ($cf)
	{
		$a = 98.03;
		$b = -36.45;
		$c = 3.138;
		$d = 0.06776;

		$logcf = log($cf);
		$log10cf  = log10($cf);

		$res1 = pow($log10cf, 2);
		$res2 = pow($log10cf, 3);


		$res3 = $a + ($b*$log10cf) + ($c*$res1) + ($d*$res2);

		return $res3;
	}
	echo "<br />q1 - CF = " , calc_cf (50000);

	function calc_ph ($ph)
	{
		$a = 0.05421;
		$b = 1.23;
		$c = -0.09873;

		$res1 = (($b*$ph)+($c*$ph*$ph));
		$res2 = pow ($ph, $res1);
		$res3 = ($a*$res2)+5.213;

		return $res3;
	}
	echo "<br />q2 - PH = " , calc_ph (10);

	function calc_nt ($nt)
	{
		$a = 98.96;
		$b = -0.2232;
		$c = -0.006457;

		if ($nt > 100)
		{
			return (1);
		}

		else if ($nt <= 0)
		{
			return ("valor invalido");
		}

		$param = $b+$c*$nt;
		$res1 = pow ($nt, $param);
		return ($a * $res1);
	}
	echo "<br />q4 - NT = " , calc_nt (20);

	function calc_vt ($vt)
	{
		$a = 0.0003869;
		$b = 0.1815;
		$c = 0.01081;

		$res1 = $vt + $b;
		$res2 = pow($res1, 2);
		$res3 = ($a*$res2)+$c;

		return (1/$res3);
	}
	echo "<br />q6 - VT = " , calc_vt (14);
?>

 </body>
</html>