-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2025 às 16:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tccccccccc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `loginclienteID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidadeCarrinho` int(11) NOT NULL,
  `tamanhoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `CategoriaID` int(11) NOT NULL,
  `NomeCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`CategoriaID`, `NomeCategoria`) VALUES
(1, 'Tênis'),
(2, 'Calçados'),
(3, 'Camiseta'),
(4, 'Calças'),
(5, 'Jaqueta'),
(6, 'Carro de Corrida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `EnderecoID` int(11) NOT NULL,
  `estadoEndereco` char(2) NOT NULL,
  `cidadeEndereco` varchar(250) NOT NULL,
  `bairroEndereco` varchar(250) NOT NULL,
  `ruaEndereco` varchar(250) NOT NULL,
  `numeroEndereco` int(11) NOT NULL,
  `complementoEndereco` varchar(250) DEFAULT NULL,
  `loginClienteFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`EnderecoID`, `estadoEndereco`, `cidadeEndereco`, `bairroEndereco`, `ruaEndereco`, `numeroEndereco`, `complementoEndereco`) VALUES
(1, 'SP', 'Caçapava', 'Jardim Primavera', 'General Pedro Luís Pinto Bitencourt', 255, 'Casa'),

--
-- Estrutura para tabela `itempedido`
--

CREATE TABLE `itempedido` (
  `idPedido` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qtdProduto` int(11) NOT NULL,
  `tamanhoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estrutura para tabela `logincliente`
--

CREATE TABLE `logincliente` (
  `LoginClienteID` int(11) NOT NULL,
  `CPFCliente` varchar(11) DEFAULT NULL,
  `nomeCliente` varchar(255) NOT NULL,
  `emailCliente` varchar(256) NOT NULL,
  `senhaCliente` varchar(20) NOT NULL,
  `tipoID` int(11) NOT NULL,
  `dataNascimentoCliente` date DEFAULT NULL,
  `telefoneCliente` char(11) DEFAULT NULL,
  `enderecoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `logincliente`
--

INSERT INTO `logincliente` (`LoginClienteID`, `CPFCliente`, `nomeCliente`, `emailCliente`, `senhaCliente`, `tipoID`, `dataNascimentoCliente`, `telefoneCliente`, `enderecoID`) VALUES
(1,'88888888888', 'Admin', 'admin@123', 'admin', 2,'2008-08-08','88888888888',8), 

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `PedidoID` int(11) NOT NULL,
  `dataPedido` date NOT NULL,
  `valorTotalPedido` double NOT NULL,
  `statusPedido` varchar(50) NOT NULL,
  `loginclienteIDFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `ProdutoID` int(11) NOT NULL,
  `descricaoProduto` varchar(250) NOT NULL,
  `corProduto` varchar(100) NOT NULL,
  `precoProduto` double NOT NULL,
  `quantidadeEstoqueProduto` int(11) NOT NULL,
  `ImagemProduto` varchar(250) NOT NULL,
  `CategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`ProdutoID`, `descricaoProduto`, `corProduto`, `precoProduto`, `quantidadeEstoqueProduto`, `ImagemProduto`, `CategoriaID`) VALUES
(10, 'Chuteira Umbro', 'azul', 225.9, 0, './img/chuteira umbro.jpg', 2),
(11, 'Camiseta Corinthians', 'Branca', 459.9, 0, './img/corinthians.jpg', 3),
(17, ' Tênis Nike Air Force 1 \"07', 'Branco', 759.99, 0, 'img/nike1.avif', 2),
(18, 'Tênis Nike Metcon 9', 'Preto', 528.19, 0, 'img/nike2.avif', 2),
(19, 'Tênis Nike Zoom Fly 6', 'Vermelho', 854.99, 0, 'img/nike3.jpg', 2),
(20, 'Tênis Nike Court Borough Mid 2', 'Preto e Vermelho', 674.99, 0, 'img/nike4.jpg', 2),
(21, 'Tênis Nike Dunk Low Retro SE', 'Bege', 560.49, 0, 'img/nike5.avif', 2),
(22, 'Camiseta São paulo 2025', 'Branco', 208.99, 0, 'img/sao paulo.webp', 3),
(23, 'Camiseta adidas 3S TEE', 'Amarelo', 179.99, 0, 'img/adidas.avif', 3),
(24, 'Camiseta adidas TOUR TRÊS LISTRAS', 'azul', 150, 0, 'img/33rrfd.avif', 3),
(26, 'Camiseta Babi ', 'Marrom', 149.75, 0, 'img/ousus.webp', 3),
(27, 'Camiseta Mãozinha Ö ', 'Rosa', 199.99, 0, 'img/ous.webp', 3),
(28, 'Jaqueta Red bull f1 ', 'azul ', 519, 0, 'img/red bull.webp', 5),
(29, 'Jaqueta militar ', 'Verde', 200, 0, 'img/nvxkokon.jpg', 5),
(30, 'Jaqueta Boxy em Jeans', 'Preto', 199.99, 0, 'img/gnsesgh.webp', 5),
(31, 'Jaqueta Boxy ', 'Bege', 299.99, 0, 'img/kjafjozi.webp', 5),
(32, 'Jaqueta Trucker Boxy', 'Bege', 259.99, 0, 'img/jaqurfdhu9ahbf.webp', 5),
(33, 'Calça Baggy em Jeans Vintage', 'azul', 159.99, 0, 'img/dsfgojihjbgngnokafjb.webp', 4),
(34, 'Calça Baggy Jeans ', 'Preto', 199.99, 0, 'img/fadsadadssAD.webp', 4),
(35, 'Calça Relaxed Oxford', 'Cinza', 179.99, 0, 'img/dfshdfbgadfhf.webp', 4),
(36, 'Calça Barrel em Jeans', 'Preto', 239.9, 0, 'img/hhjgdffdfjigod.webp', 4),
(37, 'Calça Super Baggy', 'Cinza', 199.99, 0, 'img/kkkkkkkkkdsga.webp', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quantidade`
--

CREATE TABLE `quantidade` (
  `IDqntd` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `tamanhoFKID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quantidade`
--

INSERT INTO `quantidade` (`IDqntd`, `quantidade`, `tamanhoFKID`) VALUES
(1, 45, 1),
(2, 45, 2),
(3, 43, 3),
(4, 49, 4),
(5, 50, 5),
(6, 50, 6),
(7, 4, 7),
(8, 10, 8),
(9, 12, 9),
(10, 12, 10),
(11, 7, 11),
(12, 5, 12),
(13, 2, 13),
(14, 13, 14),
(15, 5, 15),
(16, 6, 16),
(17, 10, 17),
(18, 1, 18),
(19, 2, 19),
(20, 3, 20),
(21, 5, 21),
(22, 6, 22),
(23, 17, 23),
(24, 23, 24),
(25, 1, 25),
(26, 3, 26),
(27, 7, 27),
(28, 10, 28),
(29, 6, 29),
(30, 8, 30),
(31, 7, 31),
(32, 4, 32),
(33, 3, 33),
(34, 6, 34),
(35, 5, 35);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `tamanhoID` int(11) NOT NULL,
  `tamanho` varchar(10) NOT NULL,
  `produtoFKID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tamanho`
--

INSERT INTO `tamanho` (`tamanhoID`, `tamanho`, `produtoFKID`) VALUES
(1, '40', 10),
(2, 'GG', 11),
(3, 'G', 11),
(4, 'M', 11),
(5, 'P', 11),
(6, 'PP', 11),
(7, 'GG', 29),
(8, 'M', 29),
(9, 'G', 29),
(10, 'M', 28),
(11, 'GG', 28),
(12, 'G', 28),
(13, 'P', 28),
(14, 'M', 27),
(15, 'GG', 27),
(16, 'G', 27),
(17, 'P', 27),
(18, 'GG', 26),
(19, 'M', 26),
(20, 'G', 26),
(21, 'P', 26),
(22, 'GG', 24),
(23, 'M', 24),
(24, 'G', 24),
(25, 'P', 24),
(26, 'GG', 23),
(27, 'G', 23),
(28, 'M', 22),
(29, 'GG', 22),
(30, 'G', 22),
(31, '41', 21),
(32, '31', 21),
(33, '32', 21),
(34, '33', 21),
(35, '35', 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipoperfil`
--

CREATE TABLE `tipoperfil` (
  `tipoID` int(11) NOT NULL,
  `rolename` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tipoperfil`
--

INSERT INTO `tipoperfil` (`tipoID`, `rolename`) VALUES
(1, 'user'),
(2, 'admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD KEY `loginclienteID` (`loginclienteID`),
  ADD KEY `produtoID` (`produtoID`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`EnderecoID`);

--
-- Índices de tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices de tabela `logincliente`
--
ALTER TABLE `logincliente`
  ADD PRIMARY KEY (`LoginClienteID`),
  ADD UNIQUE KEY `emailCliente` (`emailCliente`),
  ADD UNIQUE KEY `CPFCliente` (`CPFCliente`),
  ADD KEY `tipoID` (`tipoID`),
  ADD KEY `enderecoID` (`enderecoID`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`PedidoID`),
  ADD KEY `loginclienteIDFK` (`loginclienteIDFK`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ProdutoID`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Índices de tabela `quantidade`
--
ALTER TABLE `quantidade`
  ADD PRIMARY KEY (`IDqntd`),
  ADD KEY `tamanhoFKID` (`tamanhoFKID`);

--
-- Índices de tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`tamanhoID`),
  ADD KEY `produtoFKID` (`produtoFKID`);

--
-- Índices de tabela `tipoperfil`
--
ALTER TABLE `tipoperfil`
  ADD PRIMARY KEY (`tipoID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `EnderecoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `logincliente`
--
ALTER TABLE `logincliente`
  MODIFY `LoginClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `PedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ProdutoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `quantidade`
--
ALTER TABLE `quantidade`
  MODIFY `IDqntd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `tamanhoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`loginclienteID`) REFERENCES `logincliente` (`LoginClienteID`),
  ADD CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`produtoID`) REFERENCES `produto` (`ProdutoID`),
  ADD CONSTRAINT `carrinho_ibfk_3` FOREIGN KEY (`produtoID`) REFERENCES `produto` (`ProdutoID`);

--
-- Restrições para tabelas `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `itempedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`PedidoID`),
  ADD CONSTRAINT `itempedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`PedidoID`),
  ADD CONSTRAINT `itempedido_ibfk_3` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`ProdutoID`);

--
-- Restrições para tabelas `logincliente`
--
ALTER TABLE `logincliente`
  ADD CONSTRAINT `logincliente_ibfk_1` FOREIGN KEY (`enderecoID`) REFERENCES `endereco` (`enderecoID`),
  ADD CONSTRAINT `logincliente_ibfk_2` FOREIGN KEY (`tipoID`) REFERENCES `tipoperfil` (`tipoID`),
  ADD CONSTRAINT `logincliente_ibfk_3` FOREIGN KEY (`enderecoID`) REFERENCES `endereco` (`enderecoID`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`loginclienteIDFK`) REFERENCES `logincliente` (`LoginClienteID`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`loginclienteIDFK`) REFERENCES `logincliente` (`LoginClienteID`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`CategoriaID`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`CategoriaID`);

--
-- Restrições para tabelas `quantidade`
--
ALTER TABLE `quantidade`
  ADD CONSTRAINT `quantidade_ibfk_1` FOREIGN KEY (`tamanhoFKID`) REFERENCES `tamanho` (`tamanhoID`);

--
-- Restrições para tabelas `tamanho`
--
ALTER TABLE `tamanho`
  ADD CONSTRAINT `tamanho_ibfk_1` FOREIGN KEY (`produtoFKID`) REFERENCES `produto` (`ProdutoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
