select 
extract(year from m.DTMOVIMENTACAO) as ANO, 
(sum(abs(m.PESO)))/sum(abs(m.QTANIMAIS)) 
from ESANMOVANIMAIS m 
where m.CDFASE = 6 
and m.FLTIPO = 'V'
and m.FLTIPOVENDA = 'N' 
group by ANO 
