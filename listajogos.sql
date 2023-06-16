SELECT partida_id, time_casa, time_fora, data_jogo, estadio, valor_ingresso
FROM partidas
WHERE data_jogo > CURDATE();


# codigo para obter a lista de todos os jogos que ainda estão disponiveis, portanto não ocorreram
