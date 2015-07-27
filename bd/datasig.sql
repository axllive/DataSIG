-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Nov-2014 às 23:16
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `datasig`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `coleta`
--

CREATE TABLE IF NOT EXISTS `coleta` (
  `id_coleta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_coleta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `coleta`
--

INSERT INTO `coleta` (`id_coleta`, `valor`) VALUES
(1, '1'),
(2, '2'),
(3, '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coleta_etiqueta`
--

CREATE TABLE IF NOT EXISTS `coleta_etiqueta` (
  `id_coleta_etiqueta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_etiqueta` int(10) unsigned NOT NULL,
  `fk_id_coleta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_coleta_etiqueta`),
  KEY `coleta_etiqueta_e` (`fk_id_etiqueta`),
  KEY `coleta_etiqueta_c` (`fk_id_coleta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `coleta_etiqueta`
--

INSERT INTO `coleta_etiqueta` (`id_coleta_etiqueta`, `fk_id_etiqueta`, `fk_id_coleta`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `etiqueta`
--

CREATE TABLE IF NOT EXISTS `etiqueta` (
  `id_etiqueta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_etiqueta` varchar(64) NOT NULL,
  `fk_id_projeto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_etiqueta`),
  KEY `etiqueta_projeto` (`fk_id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `etiqueta`
--

INSERT INTO `etiqueta` (`id_etiqueta`, `nome_etiqueta`, `fk_id_projeto`) VALUES
(1, 'H2O', 1),
(2, 'CO2', 1),
(3, 'H13', 1),
(5, 'zarabada', 1),
(6, 'Lalal', 1),
(7, 'Gabriel', 1),
(8, 'H43', 2),
(9, 'Lalal', 2),
(10, 'FidamÃ£e', 3),
(11, 'Cite', 3),
(12, 'Meu', 3),
(13, 'Nome', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `id_projeto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_projeto` varchar(45) NOT NULL,
  `descricao_projeto` text NOT NULL,
  `data_criacao_projeto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`id_projeto`, `nome_projeto`, `descricao_projeto`, `data_criacao_projeto`) VALUES
(1, 'Patos', 'Abelha', '2014-11-26 21:18:15'),
(2, 'CabeÃ§as', 'OlÃ¡r', '2014-11-26 21:18:22'),
(3, 'Curumim', 'Azedo', '2014-11-26 21:19:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `login`, `senha`, `nome`, `sobrenome`, `email`, `dt_nasc`, `data_criacao`, `instituicao`) VALUES
(1, 'joao', '202cb962ac59075b964b07152d234b70', 'Joao', 'Gabriel', 'jgabrielgb@gmail.com', '1991-06-11', '2014-11-26 19:23:37', 'UESC'),
(2, 'jovem', '202cb962ac59075b964b07152d234b70', 'jovem', 'juvenil', 'jovem@juvenil.com', '1996-06-13', '2014-11-26 21:19:17', 'UESC'),
(3, 'stefano', '202cb962ac59075b964b07152d234b70', 'stefano', 'azevedo', 'stefano@ostras.com', '2014-11-07', '2014-11-27 18:43:31', 'UESC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_projeto`
--

CREATE TABLE IF NOT EXISTS `usuario_projeto` (
  `id_usuario_projeto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int(10) unsigned NOT NULL,
  `fk_id_projeto` int(10) unsigned NOT NULL,
  `tipo_usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_usuario_projeto`),
  KEY `usuario_projeto_usuario` (`fk_id_usuario`),
  KEY `usuario_projeto_projeto` (`fk_id_projeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
(9, 1, 3, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_coleta_etiqueta`
--
CREATE TABLE IF NOT EXISTS `v_coleta_etiqueta` (
`id_etiqueta` int(10) unsigned
,`nome_etiqueta` varchar(64)
,`fk_id_projeto` int(10) unsigned
,`id_coleta_etiqueta` int(10) unsigned
,`id_coleta` int(10) unsigned
,`valor` varchar(255)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_projeto`
--
CREATE TABLE IF NOT EXISTS `v_usuario_projeto` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_coleta_etiqueta` AS select `etiqueta`.`id_etiqueta` AS `id_etiqueta`,`etiqueta`.`nome_etiqueta` AS `nome_etiqueta`,`etiqueta`.`fk_id_projeto` AS `fk_id_projeto`,`coleta_etiqueta`.`id_coleta_etiqueta` AS `id_coleta_etiqueta`,`coleta`.`id_coleta` AS `id_coleta`,`coleta`.`valor` AS `valor` from ((`etiqueta` left join `coleta_etiqueta` on((`etiqueta`.`id_etiqueta` = `coleta_etiqueta`.`fk_id_etiqueta`))) left join `coleta` on((`coleta_etiqueta`.`fk_id_coleta` = `coleta`.`id_coleta`)));

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
