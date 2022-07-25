select 
extract(year from r.DTLANCAMENTO) as ANO, 
cast (sum(abs(r.QTRACAO))/( 
    select  
    sum(abs(m.QTANIMAIS)) 
    from ESANMOVANIMAIS m 
    where m.CDFASE = 4 
    and m.FLTIPO = 'F' 
    and extract(year from m.DTMOVIMENTACAO) = extract(year from r.DTLANCAMENTO) 
) as decimal(10,2)) as KG_ANIMAL 
from EFABLANCAMENTORACAO r inner join EFABRACAO racao  
on racao.CDRACAO = r.CDRACAO 
where r.CDFASE = 4 
and r.FLTIPOLANCAMENTO = 'U' 
and r.CDRACAO = 9
group by ANO 
