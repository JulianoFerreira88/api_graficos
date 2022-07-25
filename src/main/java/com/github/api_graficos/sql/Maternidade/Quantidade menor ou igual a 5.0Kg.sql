select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as QTD 
from ESANMOVANIMAIS m 
where m.CDFASE = 2 and m.FLTIPO = 'D' 
and (m.PESO/abs(m.QTANIMAIS)) <=5.0 
group by ANO 