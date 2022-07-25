select  
extract(year from m.DTMOVIMENTACAO) as ANO, 
( 
    select sum(abs(ma.qtanimais))  
    from ESANMOVANIMAIS ma 
    where ma.CDFASE = 6 
    and ma.FLTIPO = 'V' 
    and ma.FLTIPOVENDA = 'N' 
    and extract(year from ma.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO) 
) as QUANTIDADE from ESANMOVANIMAIS m 
where m.CDFASE = 6 
and m.FLTIPO = 'V' 
and m.FLTIPOVENDA = 'N' 
group by ANO 