select     
extract(year from c.DTLANCAMENTO) as ANO,  
cast(sum(abs(c.VALORTOTAL ))/ ( 
    select 
    sum(abs(m.peso)) 
    from ESANMOVANIMAIS m 
    where m.FLTIPO = 'V' 
    and m.CDFASE = 6 
    and extract(year from m.DTMOVIMENTACAO) = extract(year from c.DTLANCAMENTO) 
) as decimal(10,2)) 
from ECUSCASTROLANDAFINANCEIRO c 
where c.CDCONTAFINANCEIRA = 17 
group by ANO 