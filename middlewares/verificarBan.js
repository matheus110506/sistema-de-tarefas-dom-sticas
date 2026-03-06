const db = require('../db');

module.exports = async (req,res,next)=>{

    const ip = req.ip;

    const [resultado] = await db.query(
        "SELECT * FROM ips_banidos WHERE ip = ?",
        [ip]
    );

    if(resultado.length > 0){
        return res.status(403).json({
            erro:"Seu IP está banido"
        });
    }

    next();
}