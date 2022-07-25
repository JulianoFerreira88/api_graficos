select  
extract(year from r.DTLANCAMENTO) as ANO, 
avg(abs(cast(r.QTRACAO as decimal(10,2)))) as QTD 
from EFABLANCAMENTORACAO r 
where r.CDFASE = 6 
and r.CDRACAO = 13
group by ANO  