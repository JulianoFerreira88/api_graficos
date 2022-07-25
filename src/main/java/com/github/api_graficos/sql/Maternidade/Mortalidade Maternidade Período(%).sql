select  
extract(year from m.DTMOVIMENTACAO) as ANO,
(
((
    select 
    sum(abs(ma.QTANIMAIS))
    from ESANMOVANIMAIS ma
    where ma.CDFASE = 2
    and ma.FLTIPO = 'O'
    and extract(year from ma.DTMOVIMENTACAO) = extract(year from m.DTMOVIMENTACAO)
) * 100.00) / sum(abs(m.QTANIMAIS))) as MORTALIDADE from ESANMOVANIMAIS m where m.CDFASE = 2  and m.FLTIPO = 'P' group by ANO  