const express = require('express');
const router = express.Router();
const tarefaController = require('../controllers/tarefaController');

router.post('/tarefas', tarefaController.criarTarefa);
router.get('/tarefas/mae/:maeId', tarefaController.listarTarefasPorMae);
router.get('/tarefas/filho/:filhoId', tarefaController.listarTarefasPorFilho);
router.put('/tarefas/concluir', tarefaController.marcarConcluida);
router.delete('/tarefas/:id', tarefaController.excluirTarefa);

module.exports = router;
