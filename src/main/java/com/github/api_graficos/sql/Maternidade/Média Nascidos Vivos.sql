select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(cast(m.QTANIMAIS as decimal(10,3))))/ 
count(m.CDMOVANIMAIS) 
from ESANMOVANIMAIS m 
where m.CDFASE = 2 
and m.FLTIPO = 'P' 
group by ANO 