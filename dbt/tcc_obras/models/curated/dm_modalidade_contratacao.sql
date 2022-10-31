with records as (
    select distinct
        modalidade as descricao
    from {{ ref('obras_all_years') }}
    where modalidade is not null
)
select
    -1 as id,
    "Sem informação" as descricao
union all
select 
    row_number() over (order by descricao asc) as id,
    descricao
from records
