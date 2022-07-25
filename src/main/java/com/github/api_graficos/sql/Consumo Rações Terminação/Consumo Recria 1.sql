select 
extract(year from r.DTLANCAMENTO) as ANO, 
cast (sum(abs(r.QTRACAO))/( 
    select  
    sum(abs(m.QTANIMAIS)) 
    from ESANMOVANIMAIS m 
    where m.CDFASE = 6 
    and m.FLTIPO = 'V' 
    and extract(year from m.DTMOVIMENTACAO) = extract(year from r.DTLANCAMENTO) 
) as decimal(10,2)) as KG_ANIMAL 
from EFABLANCAMENTORACAO r inner join EFABRACAO racao  
on racao.CDRACAO = r.CDRACAO 
where r.CDFASE = 6 
and r.FLTIPOLANCAMENTO = 'U' 
and r.CDRACAO = 10
group by ANO 
