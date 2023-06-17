SELECT hc.compra_id, p.time_casa, p.time_fora, p.data_jogo, p.estadio, hc.quantidade_ingressos, hc.valor_total, hc.data_compra
FROM historico_compras hc
INNER JOIN partidas p ON hc.partida_id = p.partida_id
WHERE hc.user_id = <id_do_usuario>;

#mostra o historico de compras 
