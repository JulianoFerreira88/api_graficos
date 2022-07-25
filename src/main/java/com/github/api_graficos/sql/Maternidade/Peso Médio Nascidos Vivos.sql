select 
extract(year from p.DTMEDIANASCIMENTO) as ANO, 
cast(sum(abs(p.PESOLEITEGADA))/ sum(abs(p.NUVIVO)) as decimal(10,2)) as PESO_MEDIO_NASCIDOS 
from ESANPARTO p 
group by ANO 