select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as QUANTIDADE 
from ESANMOVANIMAIS m 
where m.CDFASE = 6 
and m.FLTIPO = 'V' 
and m.FLTIPOVENDA = 'L' 
group by ANO 