select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as QTD 
from ESANMOVANIMAIS m 
where m.CDFASE = 4 
and m.FLTIPO = 'O' 
group by ANO  