SELECT ingressos.ingresso_id, partidas.time_casa, partidas.time_fora, partidas.data_jogo, partidas.estadio, ingressos.setor, ingressos.valor
FROM ingressos
INNER JOIN partidas ON ingressos.partida_id = partidas.partida_id
WHERE partidas.time_casa = 'Nome do Time da Casa'
  AND partidas.time_fora = 'Nome do Time Visitante'
  AND partidas.data_jogo = 'YYYY-MM-DD'
  AND partidas.estadio = 'Nome do Estádio';


#codigo feito para ver os ingressos disponiveis
