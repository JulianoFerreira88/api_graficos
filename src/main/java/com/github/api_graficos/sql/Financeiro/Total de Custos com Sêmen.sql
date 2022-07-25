select    
extract(year from c.DTLANCAMENTO) as ANO,  
sum(abs(cast(c.VALORTOTAL as decimal(10,2)))) as QTD  
from ECUSCASTROLANDAFINANCEIRO c 
where c.CDCONTAFINANCEIRA = 25
group by ANO 