select 
extract(year from r.DTLANCAMENTO) as ANO, 
sum(abs(r.QTRACAO)) as QTD 
from EFABLANCAMENTORACAO r 
where r.CDFASE = 4 
group by ANO 