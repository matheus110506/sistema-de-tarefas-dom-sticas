-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/03/2026 às 23:29
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
-- Banco de dados: `homework_system`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `filhos`
--

CREATE TABLE `filhos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `mae_id` int(11) NOT NULL,
  `banido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filhos`
--

INSERT INTO `filhos` (`id`, `nome`, `email`, `senha`, `mae_id`, `banido`) VALUES
(1, 'Matheus Almeida de Lima', 'matheus110506@hotmail.com', '$2b$10$UaIRzrLbnKI667clM/3V.O4XvUAHs4mgNht7XNeEacUcC5FMjGy1C', 1, 0),
(2, 'Geronimo', 'ge@gmail.com', '$2b$10$UYYJiION2tHHd6PwNM8PC.bg2wYkE0H9c2htMzHWGWeLw1jQsomz.', 1, 0),
(3, 'Joao', 'joao@gmail.com', '$2b$10$LJNhuPjmdmYJQko5BRwF3.p/xlraBRbWajvJMxayPqO53yypBv0Pm', 1, 0),
(4, 'Jac', 'jac@gmail.com', '$2b$10$ypx34tE7F8DdIw6amdxIGuiy5zlEOsK3mEriSWfNb50QlhY5Iez6i', 1, 0),
(5, 'Aníbal', 'an@gmail.com', '$2b$10$oKL9trt.tYd15UU/nDWQqOeScrdYQ39ma0BfQOBkK1U4B8HY116CG', 3, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ips_banidos`
--

CREATE TABLE `ips_banidos` (
  `id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ips_banidos`
--

INSERT INTO `ips_banidos` (`id`, `ip`) VALUES
(1, '3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `acao` varchar(255) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id`, `acao`, `ip`, `data`) VALUES
(1, 'login da mãe', '::ffff:127.0.0.1', '2026-03-08 02:08:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maes`
--

CREATE TABLE `maes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `banido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `maes`
--

INSERT INTO `maes` (`id`, `nome`, `email`, `senha`, `banido`) VALUES
(1, 'Simone Aparecida de Almeida Lima', 'si@gmail.com', '$2b$10$6WkwDvcH.ArYUxmLE.3b4.wJaz0OQKuEkRVj2H1ogOk8cZUQ6btGS', 0),
(3, 'Simaria', 'sia@gmail.com', '$2b$10$c65.78Sokhm1GUPvGgTTFezB2/hlOKxJyY.0zy8HTabQ9SmTB9dci', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas`
--

CREATE TABLE `tarefas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `mae_id` int(11) NOT NULL,
  `filho_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tarefas`
--

INSERT INTO `tarefas` (`id`, `titulo`, `descricao`, `mae_id`, `filho_id`) VALUES
(14, 'lavar a louça', 'a', 1, 1),
(16, 'Fazer a tarefa', 'Geografia', 3, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas_concluidas`
--

CREATE TABLE `tarefas_concluidas` (
  `filho_id` int(11) NOT NULL,
  `tarefa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tarefas_concluidas`
--

INSERT INTO `tarefas_concluidas` (`filho_id`, `tarefa_id`) VALUES
(1, 14),
(5, 16);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filhos`
--
ALTER TABLE `filhos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_filho_mae` (`mae_id`);

--
-- Índices de tabela `ips_banidos`
--
ALTER TABLE `ips_banidos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `maes`
--
ALTER TABLE `maes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tarefa_mae` (`mae_id`),
  ADD KEY `fk_filho` (`filho_id`);

--
-- Índices de tabela `tarefas_concluidas`
--
ALTER TABLE `tarefas_concluidas`
  ADD PRIMARY KEY (`filho_id`,`tarefa_id`),
  ADD KEY `fk_tarefac_tarefa` (`tarefa_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filhos`
--
ALTER TABLE `filhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ips_banidos`
--
ALTER TABLE `ips_banidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `maes`
--
ALTER TABLE `maes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `filhos`
--
ALTER TABLE `filhos`
  ADD CONSTRAINT `fk_filho_mae` FOREIGN KEY (`mae_id`) REFERENCES `maes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tarefas`
--
ALTER TABLE `tarefas`
  ADD CONSTRAINT `fk_filho` FOREIGN KEY (`filho_id`) REFERENCES `filhos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tarefa_filho` FOREIGN KEY (`filho_id`) REFERENCES `filhos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tarefa_mae` FOREIGN KEY (`mae_id`) REFERENCES `maes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tarefas_concluidas`
--
ALTER TABLE `tarefas_concluidas`
  ADD CONSTRAINT `fk_tarefac_filho` FOREIGN KEY (`filho_id`) REFERENCES `filhos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tarefac_tarefa` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
