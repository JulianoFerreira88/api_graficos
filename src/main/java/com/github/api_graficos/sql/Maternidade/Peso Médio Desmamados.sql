select  
extract(year from d.DTDESMAME) as ANO,   
cast(sum(abs(d.PESOLEITEGADA))/sum(d.NUDESMAMADO) as decimal(10,2)) as PESO_DESMAMADOS 
from ESANDESMAME d 
group by ANO  