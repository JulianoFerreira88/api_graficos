select   
extract(year from m.DTMOVIMENTACAO) as ANO, 
(sum(abs(m.QTANIMAIS))*100.00)/ 
( 
    select  
    sum(abs(mo.QTANIMAIS)) 
    from ESANMOVANIMAIS mo 
    where extract(year from mo.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO) 
    and mo.CDFASE = 2 
    and mo.FLTIPO = 'D' 
) 
from ESANMOVANIMAIS m  
where m.CDFASE = 2 and m.FLTIPO = 'D' 
and (m.PESO/abs(m.QTANIMAIS)) <=5.0 
group by ANO 