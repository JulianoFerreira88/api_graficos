select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
(
    select 
    sum(abs(mo.QTANIMAIS))
    from ESANMOVANIMAIS mo
    where mo.CDFASE = 4
    and mo.FLTIPO = 'O'
    and extract(year from mo.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO)
) *100.00/ sum(abs(m.QTANIMAIS))
from ESANMOVANIMAIS m 
where m.CDFASE = 4 
and m.FLTIPO = 'D' 
group by ANO  