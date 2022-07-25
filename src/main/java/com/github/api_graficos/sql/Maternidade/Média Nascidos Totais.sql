select  
extract(year from p.DTMEDIANASCIMENTO) as ANO, 
sum(abs(cast(p.NUVIVO+p.NUNATIMORTO+p.NUMUMIFICADO+p.NUMORTOAONASCER as decimal(10,3))))/ count(p.CDPARTO) 
from ESANPARTO p 
group by ANO 