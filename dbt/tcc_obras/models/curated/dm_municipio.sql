with records as (
    select distinct
        nome as regiao,
        mun_nome as descricao
    from {{ ref('obras_all_years') }}
    where mun_nome is not null
        and nome is not null
)
select
    -1 as id,
    "Sem informação" as regiao,
    "Sem informação" as descricao
union all
select 
    row_number() over (order by regiao, descricao asc) as id,
    regiao,
    descricao
from records
