select  
extract(year from f.DTLANCAMENTO) as Ano,  
sum(f.VALORTOTAL)/( 
SELECT  
sum(abs(a.PESO))  
FROM ESANMOVANIMAIS a where a.FLTIPO = 'V' and extract(year from a.DTMOVIMENTACAO) = extract(year from f.DTLANCAMENTO) 
) as "Lucro por Quilo" from ECUSCASTROLANDAFINANCEIRO f group by Ano 