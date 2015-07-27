<?php
	
	/*
		Modelagem triangular
			Trecho ab : (x-a)/(b-a)
			Trecho bc : (x-c)/(b-c)

		Modelagem trapeizodal 
			Trecho cd : (x-d)/(c-d)
			Trecho ab : (x-a)/(b-a)
	*/

	//Função PH
		function calc_ph ()
	{
		$a = 0;
		$b = 4;
		$c = 7;
		$d = 10;
		$e = 14;

		$ph = 9.9622123;

		$r1 = calc_trap ($a, $a, $b, $c, $ph);
		$r2 = calc_trap ($c, $d, $e, $e, $ph);
		$r3 = calc_tria ($b, $c, $d, $ph);

		echo "<b>- PH: </b>" , $ph;
		echo "<br />muito baixo: " , $r1;
		echo "<br />otimo: " , $r3;
		echo "<br />muito alto: " , $r2;
		
	}

	function calc_no3 ()
	{
		//BOM
		$a = 0;
		$b = 30;
		$c = 45;

		//REGULAR
		$d = 42;
		$e = 50;
		$f = 60;

		//RUIM
		$g = 53;
		$h = 70;
		$i = 100;

		$no3 = 123;



		$r1 = calc_trap ($a, $a, $b, $c, $no3);
		$r2 = calc_trap ($g, $h, $i, $i, $no3);
		$r3 = calc_tria ($d, $e, $f, $no3);

		echo "<br /> <b>- NO3: </b>" , $ph;
		echo "<br />Bom: " , $r1;
		echo "<br />Regular: " , $r3;
		echo "<br />Ruim: " , $r2;

	}

		function calc_so4 ()
	{
		//BOM
		$a = 0;
		$b = 150;
		$c = 160;

		//REGULAR
		$d = 140;
		$e = 190;
		$f = 245;

		//RUIM
		$g = 230;
		$h = 250;
		$i = 300;

		$so4 = 163;

		$r1 = calc_trap ($a, $a, $b, $c, $so4);
		$r2 = calc_trap ($g, $h, $i, $i, $so4);
		$r3 = calc_tria ($d, $e, $f, $so4);

		echo "<br /><b> - SO4: </b>" , $so4;
		echo "<br />Bom: " , $r1;
		echo "<br />Regular: " , $r3;
		echo "<br />Ruim: " , $r2;

	}

		function calc_nh4 ()
	{
		//BOM
		$a = 0;
		$b = 0.55;
		$c = 0.75;

		//REGULAR
		$d = 0.5;
		$e = 0.8;
		$f = 0.98;

		//RUIM
		$g = 0.85;
		$h = 1;
		$i = 1.5;

		$nh4 = 1;

		$r1 = calc_trap ($a, $a, $b, $c, $nh4);
		$r2 = calc_trap ($g, $h, $i, $i, $nh4);
		$r3 = calc_tria ($d, $e, $f, $nh4);

		echo "<br /><b> - NH4: </b>" , $nh4;
		echo "<br />Bom: " , $r1;
		echo "<br />Regular: " , $r3;
		echo "<br />Ruim: " , $r2;

	}
	function calc_trap ($a, $b, $c, $d, $x)
	{
		 if ($x > $d | $x < $a)
		 {
		 	return 0;
		 }

		 else if ($x >= $a && $x < $b)
		 	{
		 		$temp = ($x-$a)/($b-$a);
		 		return $temp;
		 	}

		 	else if ($x >= $b && $x <= $c)
		 	{
		 		return 1;
		 	}

		 		else 
		 		{
		 			$temp = ($x-$d)/($c-$d);
		 			return $temp;
		 		} // x > c | x <= d
	}


	function calc_tria ($a, $b, $c, $x)
	{
		if ($x > $c | $x < $a)
		{
			return 0;
		}

		else if ($x >= $a && $x < $b)
			{
				$temp = ($x-$a)/($b-$a);
				return $temp;
			}

			else 
			{
				$temp = ($x-$c)/($b-$c);
				return $temp;
			}
	}

		calc_ph();
		calc_no3();
		calc_so4();
		calc_nh4();
?>