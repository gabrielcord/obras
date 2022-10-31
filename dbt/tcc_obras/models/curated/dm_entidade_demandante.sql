with records as (
    select distinct
        sigla_orgao as sigla, 
        nome_entidade as descricao
    from {{ ref('obras_all_years') }}
    where sigla_orgao is not null 
        and nome_entidade is not null
)
select
    -1 as id,
    "Sem informação" as sigla,
    "Sem informação" as descricao
union all
select 
    row_number() over (order by sigla, descricao asc) as id,
    sigla,
    descricao
from records
