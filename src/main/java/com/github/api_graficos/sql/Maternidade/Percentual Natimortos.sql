select 
extract(year from p.DTMEDIANASCIMENTO) as ANO, 
sum( cast ( p.NUNATIMORTO as decimal(10,2)))*100/ 
(sum(p.NUVIVO+p.NUNATIMORTO+p.NUMORTOAONASCER+p.NUMUMIFICADO)) 
from ESANPARTO p 
group by ANO 