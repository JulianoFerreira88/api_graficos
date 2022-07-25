select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS))/12 as QTD 
from ESANMOVANIMAIS m 
where m.CDFASE = 6 
and m.FLTIPO = 'O' 
group by ANO  