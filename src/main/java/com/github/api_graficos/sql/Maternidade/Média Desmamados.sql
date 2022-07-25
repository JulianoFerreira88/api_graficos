select  
extract(year from p.DTDESMAME) as ANO, 
avg(abs(cast(p.NUDESMAMADO as decimal(10,2)))) as MEDIA_DESMAMADOS 
from ESANDESMAME p 
group by ANO 