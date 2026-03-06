const express = require('express');
const router = express.Router();

const adminController = require('../controllers/adminController');

router.post('/login', adminController.loginAdmin);

router.get('/logs', adminController.listarLogs);

router.post('/banir-ip', adminController.banirIP);

module.exports = router;