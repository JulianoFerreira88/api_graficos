select    
extract(year from c.DTLANCAMENTO) as ANO,  
sum(abs(cast(c.VALORTOTAL as decimal(10,2)))) as QTD  
from ECUSCASTROLANDAFINANCEIRO c 
where c.CDCONTAFINANCEIRA in ( 
    select cod.cdconta 
    from ECUSCASTROLANDACONTA cod 
    where upper(cod.NMCONTA) like upper ('%vacinas%') 
) 
group by ANO 