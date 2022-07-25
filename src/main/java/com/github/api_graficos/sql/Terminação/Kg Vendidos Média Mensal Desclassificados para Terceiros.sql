select 
extract(year from m.DTMOVIMENTACAO) as ANO, 
avg(abs(m.PESO)) as QTD 
from ESANMOVANIMAIS m  
where m.CDFASE = 6 
and m.FLTIPOVENDA = 'L' 
and m.CDENTIDADE = 523 
group by ANO 