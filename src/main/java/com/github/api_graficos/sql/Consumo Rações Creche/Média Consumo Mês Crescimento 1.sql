select  
extract(year from r.DTLANCAMENTO) as ANO, 
avg(abs(cast(r.QTRACAO as decimal(10,2)))) as QTD 
from EFABLANCAMENTORACAO r 
where r.CDFASE = 4 
and r.CDRACAO = 7 
group by ANO  