select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
cast( sum(abs(m.PESO)) / sum(abs(m.QTANIMAIS)) as decimal(10,2)) 
from ESANMOVANIMAIS m 
where m.CDFASE = 4 
and m.FLTIPO = 'D' 
group by ANO  