-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 05-Jan-2015 às 15:22
-- Versão do servidor: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `datasig`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `coleta`
--

CREATE TABLE `coleta` (
  `id_coleta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL,
  `coord` varchar(100) NOT NULL,
  PRIMARY KEY (`id_coleta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Extraindo dados da tabela `coleta`
--

INSERT INTO `coleta` (`id_coleta`, `valor`, `coord`) VALUES
(72, '45', '12.422005000000002, -112.084095'),
(73, '8', '12.422005000000002, -112.084095'),
(74, '22', '-14.813543998864064, -39.27157695512851'),
(75, '35', '-14.813543998864064, -39.27157695512851'),
(76, '55', '-14.813514108514623, -39.27154857988852'),
(77, '3', '-14.813514108514623, -39.27154857988852'),
(78, '65', '-14.813462748476649, -39.27160672422824'),
(79, '6', '-14.813462748476649, -39.27160672422824'),
(80, '25', 'Aguarde coordenadas'),
(81, '8', 'Aguarde coordenadas'),
(82, '55', '-14.798203783375914, -39.17259351298665'),
(83, '2', '-14.798203783375914, -39.17259351298665'),
(84, '865555', '-14.798330134217029, -39.172582584981846'),
(85, '45', '-14.798330134217029, -39.172582584981846'),
(86, '258', '-14.798307777162583, -39.17259733321108'),
(87, '854', '-14.798307777162583, -39.17259733321108'),
(88, '123', '-14.79827957398132, -39.17263221844196'),
(89, '12', '-14.79827957398132, -39.17263221844196'),
(90, '2', '-14.79826420856697, -39.17257378651355'),
(91, '23\n', '-14.79826420856697, -39.17257378651355');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coleta_etiqueta`
--

CREATE TABLE `coleta_etiqueta` (
  `id_coleta_etiqueta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_etiqueta` int(10) unsigned NOT NULL,
  `fk_id_coleta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_coleta_etiqueta`),
  KEY `coleta_etiqueta_e` (`fk_id_etiqueta`),
  KEY `coleta_etiqueta_c` (`fk_id_coleta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Extraindo dados da tabela `coleta_etiqueta`
--

INSERT INTO `coleta_etiqueta` (`id_coleta_etiqueta`, `fk_id_etiqueta`, `fk_id_coleta`) VALUES
(41, 16, 72),
(42, 17, 73),
(43, 16, 74),
(44, 17, 75),
(45, 16, 76),
(46, 17, 77),
(47, 16, 78),
(48, 17, 79),
(49, 16, 80),
(50, 17, 81),
(51, 16, 82),
(52, 17, 83),
(53, 16, 84),
(54, 17, 85),
(55, 16, 86),
(56, 17, 87),
(57, 16, 88),
(58, 17, 89),
(59, 16, 90),
(60, 17, 91);

-- --------------------------------------------------------

--
-- Estrutura da tabela `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id_etiqueta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_etiqueta` varchar(64) NOT NULL,
  `fk_id_projeto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_etiqueta`),
  KEY `etiqueta_projeto` (`fk_id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Extraindo dados da tabela `etiqueta`
--

INSERT INTO `etiqueta` (`id_etiqueta`, `nome_etiqueta`, `fk_id_projeto`) VALUES
(1, 'H2O', 1),
(2, 'CO2', 1),
(16, 'Coliformes', 4),
(17, 'PH', 4),
(18, 'Tamanho do Caule', 6),
(19, 'Cor da Flor', 6),
(20, 'Numeros de PÃ©talas', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `id_projeto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_projeto` varchar(45) NOT NULL,
  `descricao_projeto` text NOT NULL,
  `data_criacao_projeto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`id_projeto`, `nome_projeto`, `descricao_projeto`, `data_criacao_projeto`) VALUES
(1, 'Patos', 'Abelha', '2014-11-26 21:18:15'),
(2, 'CabeÃ§as', 'OlÃ¡r', '2014-11-26 21:18:22'),
(3, 'Curumim', 'Azedo', '2014-11-26 21:19:27'),
(4, 'Coleta Ãgua', 'Este projeto tem como intuito a coleta de Ã¡gua do Rio Cachoeira para avaliar as condiÃ§Ãµes da mesma e verificar a poluiÃ§Ã£o ao longo do rio.', '2014-11-28 03:53:30'),
(5, 'BALABA', 'IOASJEOISAJE', '2014-11-28 11:26:28'),
(6, 'BotÃ¢nica UESC', 'Projeto com fins de catalogar as plantas da UESC', '2014-12-08 10:10:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(28) NOT NULL,
  `senha` varchar(48) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `email` varchar(64) NOT NULL,
  `dt_nasc` date NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `instituicao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `login`, `senha`, `nome`, `sobrenome`, `email`, `dt_nasc`, `data_criacao`, `instituicao`) VALUES
(1, 'joao', '202cb962ac59075b964b07152d234b70', 'Joao', 'Gabriel', 'jgabrielgb@gmail.com', '1991-06-11', '2014-11-26 19:23:37', 'UESC'),
(2, 'jovem', '202cb962ac59075b964b07152d234b70', 'jovem', 'juvenil', 'jovem@juvenil.com', '1996-06-13', '2014-11-26 21:19:17', 'UESC'),
(3, 'stefano', '202cb962ac59075b964b07152d234b70', 'stefano', 'azevedo', 'stefano@ostras.com', '2014-11-07', '2014-11-27 18:43:31', 'UESC'),
(4, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'ADMIN', 'DS', 'jgabrielgb@gmail.com', '2014-11-19', '2014-11-28 03:52:19', 'UESC'),
(5, 'tamira', 'e10adc3949ba59abbe56e057f20f883e', 'Tamira', 'Ito', 'tamiraito@hotmail.com', '1989-01-30', '2014-12-08 14:59:27', 'UESC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_projeto`
--

CREATE TABLE `usuario_projeto` (
  `id_usuario_projeto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int(10) unsigned NOT NULL,
  `fk_id_projeto` int(10) unsigned NOT NULL,
  `tipo_usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_usuario_projeto`),
  KEY `usuario_projeto_usuario` (`fk_id_usuario`),
  KEY `usuario_projeto_projeto` (`fk_id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `usuario_projeto`
--

INSERT INTO `usuario_projeto` (`id_usuario_projeto`, `fk_id_usuario`, `fk_id_projeto`, `tipo_usuario`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 1, 3, 2),
(5, 3, 2, 2),
(6, 3, 1, 2),
(7, 3, 3, 2),
(8, 3, 2, 2),
(9, 1, 3, 2),
(10, 1, 1, 2),
(11, 4, 4, 1),
(12, 1, 5, 1),
(13, 4, 6, 1),
(14, 1, 5, 2),
(15, 4, 6, 2),
(16, 1, 6, 2),
(17, 5, 6, 2),
(18, 4, 6, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_coleta_etiqueta`
--
CREATE TABLE `v_coleta_etiqueta` (
`id_etiqueta` int(10) unsigned
,`nome_etiqueta` varchar(64)
,`fk_id_projeto` int(10) unsigned
,`id_coleta_etiqueta` int(10) unsigned
,`id_coleta` int(10) unsigned
,`valor` varchar(255)
,`coord` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_projeto`
--
CREATE TABLE `v_usuario_projeto` (
`id_projeto` int(10) unsigned
,`nome_projeto` varchar(45)
,`descricao_projeto` text
,`data_criacao_projeto` timestamp
,`id_usuario` int(10) unsigned
,`login` varchar(28)
,`nome` varchar(255)
,`sobrenome` varchar(255)
,`email` varchar(64)
,`dt_nasc` date
,`instituicao` varchar(255)
,`id_usuario_projeto` int(10) unsigned
,`fk_id_usuario` int(10) unsigned
,`fk_id_projeto` int(10) unsigned
,`tipo_usuario` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Structure for view `v_coleta_etiqueta`
--
DROP TABLE IF EXISTS `v_coleta_etiqueta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_coleta_etiqueta` AS select `etiqueta`.`id_etiqueta` AS `id_etiqueta`,`etiqueta`.`nome_etiqueta` AS `nome_etiqueta`,`etiqueta`.`fk_id_projeto` AS `fk_id_projeto`,`coleta_etiqueta`.`id_coleta_etiqueta` AS `id_coleta_etiqueta`,`coleta`.`id_coleta` AS `id_coleta`,`coleta`.`valor` AS `valor`,`coleta`.`coord` AS `coord` from ((`etiqueta` left join `coleta_etiqueta` on((`etiqueta`.`id_etiqueta` = `coleta_etiqueta`.`fk_id_etiqueta`))) left join `coleta` on((`coleta_etiqueta`.`fk_id_coleta` = `coleta`.`id_coleta`)));

-- --------------------------------------------------------

--
-- Structure for view `v_usuario_projeto`
--
DROP TABLE IF EXISTS `v_usuario_projeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario_projeto` AS select `p`.`id_projeto` AS `id_projeto`,`p`.`nome_projeto` AS `nome_projeto`,`p`.`descricao_projeto` AS `descricao_projeto`,`p`.`data_criacao_projeto` AS `data_criacao_projeto`,`u`.`id_usuario` AS `id_usuario`,`u`.`login` AS `login`,`u`.`nome` AS `nome`,`u`.`sobrenome` AS `sobrenome`,`u`.`email` AS `email`,`u`.`dt_nasc` AS `dt_nasc`,`u`.`instituicao` AS `instituicao`,`up`.`id_usuario_projeto` AS `id_usuario_projeto`,`up`.`fk_id_usuario` AS `fk_id_usuario`,`up`.`fk_id_projeto` AS `fk_id_projeto`,`up`.`tipo_usuario` AS `tipo_usuario` from (`usuario` `u` left join (`projeto` `p` left join `usuario_projeto` `up` on((`up`.`fk_id_projeto` = `p`.`id_projeto`))) on((`up`.`fk_id_usuario` = `u`.`id_usuario`)));

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `coleta_etiqueta`
--
ALTER TABLE `coleta_etiqueta`
  ADD CONSTRAINT `coleta_etiqueta_c` FOREIGN KEY (`fk_id_coleta`) REFERENCES `coleta` (`id_coleta`) ON DELETE CASCADE,
  ADD CONSTRAINT `coleta_etiqueta_e` FOREIGN KEY (`fk_id_etiqueta`) REFERENCES `etiqueta` (`id_etiqueta`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD CONSTRAINT `etiqueta_projeto` FOREIGN KEY (`fk_id_projeto`) REFERENCES `projeto` (`id_projeto`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `usuario_projeto`
--
ALTER TABLE `usuario_projeto`
  ADD CONSTRAINT `usuario_projeto_projeto` FOREIGN KEY (`fk_id_projeto`) REFERENCES `projeto` (`id_projeto`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_projeto_usuario` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;
