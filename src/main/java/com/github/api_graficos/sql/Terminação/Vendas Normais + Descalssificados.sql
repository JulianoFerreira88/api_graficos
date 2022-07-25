select 
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as QTD 
from ESANMOVANIMAIS m 
where m.CDFASE = 6 
and m.FLTIPO = 'V' 
group by ANO 
