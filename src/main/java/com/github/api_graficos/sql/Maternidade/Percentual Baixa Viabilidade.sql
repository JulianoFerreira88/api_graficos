select 
extract(year from p.DTMEDIANASCIMENTO) as ANO, 
sum( cast ( p.NULEITOESABAIXO as decimal(10,2)))*100/ 
(sum(p.NUVIVO)) 
from ESANPARTO p 
group by ANO 