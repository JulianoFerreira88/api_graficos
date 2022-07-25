select 
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS)) as MEDIA 
from ESANMOVANIMAIS m 
where m.CDFASE = 2 
and m.FLTIPO = 'D' 
group by ANO 