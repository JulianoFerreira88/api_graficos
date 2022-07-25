select  
extract(year from m.DTMOVIMENTACAO) as ANO,
((
    select 
    cast (sum(abs(ma.QTANIMAIS)) as numeric (10,2))
    from ESANMOVANIMAIS ma
    where ma.CDFASE = 6
    and ma.FLTIPO = 'O'
    and extract(year from ma.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO)
)  *100) 
/ 
(sum(abs(m.QTANIMAIS)))  from ESANMOVANIMAIS m where m.CDFASE = 6  and m.FLTIPO = 'F' group by ANO  