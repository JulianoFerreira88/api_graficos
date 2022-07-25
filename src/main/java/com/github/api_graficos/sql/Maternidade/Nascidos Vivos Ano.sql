select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as QTD 
from ESANMOVANIMAIS m 
where m.CDFASE = 2
and m.FLTIPO = 'P' 
group by ANO  