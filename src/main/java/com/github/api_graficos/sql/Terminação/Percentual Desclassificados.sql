select 
extract(year from m.DTMOVIMENTACAO) as ANO, 
sum(abs(m.QTANIMAIS))*100.000/( 
    select  
    sum(abs(ma.QTANIMAIS)) 
    from ESANMOVANIMAIS ma 
    where ma.CDFASE = 6 
    and ma.FLTIPO = 'V' 
    and extract(year from ma.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO) 
) 
from ESANMOVANIMAIS m 
where m.CDFASE = 6  
and m.FLTIPO = 'V' 
and m.FLTIPOVENDA = 'L' 
group by ANO  