select 
extract(year from r.DTLANCAMENTO) as ANO, 
sum(cast(abs(r.QTRACAO) as decimal(10,2)) )/( 
    select 
    sum(abs(m.QTANIMAIS)) 
    from ESANMOVANIMAIS m 
    where m.CDFASE = 4 
    and m.FLTIPO = 'F' 
    and extract(year from m.DTMOVIMENTACAO) = extract(year from r.DTLANCAMENTO) 
) as QTD  
from EFABLANCAMENTORACAO r 
where r.CDFASE = 4 
group by ANO 