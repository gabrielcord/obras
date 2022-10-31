select

    stg.idobra as id_obra,
    ifnull(dm_bem_publico.id, -1) as id_bem_publico,
    ifnull(dm_entidade_demandante.id, -1) as id_entidade_demandante,
    ifnull(dm_forma_execucao.id, -1)as id_forma_execucao,
    ifnull(dm_modalidade_contratacao.id, -1) as id_modalidade_contratacao,
    ifnull(dm_municipio.id, -1) as id_municipio,
    ifnull(dm_objeto_edital.id, -1) as id_objeto_edital,
    ifnull(dm_setor_beneficiario.id, -1) as id_setor_beneficiario,
    ifnull(dm_tipo_obra.id, -1) as id_tipo_obra,
    ifnull(dm_tipo_servico.id, -1) as id_tipo_servico,
    ifnull(dm_tipo_situacao.id, -1) as id_tipo_situacao,
    cast(left(dataassinatura, 10) as date format 'DD/MM/YYYY') as dt_assinatura_contrato,
    ifnull(cast(replace(stg.valormedicoes, ',', '.') as numeric), 0.0) as vl_medicao,
    ifnull(cast(replace(stg.valormateriais, ',', '.') as numeric), 0.0) as vl_material,
    ifnull(cast(replace(stg.valormaquinasequipamentos, ',', '.') as numeric), 0.0) as vl_equipamento,
    ifnull(cast(replace(stg.valoraditado, ',', '.') as numeric), 0.0) as vl_aditado

from {{ ref('obras_all_years') }} as stg

left join {{ ref('dm_bem_publico') }} as dm_bem_publico
    on dm_bem_publico.descricao = stg.bempublico

left join {{ ref('dm_entidade_demandante') }} as dm_entidade_demandante
    on dm_entidade_demandante.sigla = stg.sigla_orgao
        and dm_entidade_demandante.descricao = stg.nome_entidade

left join {{ ref('dm_forma_execucao') }} as dm_forma_execucao
    on dm_forma_execucao.descricao = stg.formaexecucao

left join {{ ref('dm_modalidade_contratacao') }} as dm_modalidade_contratacao
    on dm_modalidade_contratacao.descricao = stg.modalidade

left join {{ ref('dm_municipio') }} as dm_municipio
    on dm_municipio.regiao = stg.nome 
        and dm_municipio.descricao = stg.mun_nome

left join {{ ref('dm_objeto_edital') }} as dm_objeto_edital
    on dm_objeto_edital.descricao = stg.objeto

left join {{ ref('dm_setor_beneficiario') }} as dm_setor_beneficiario
    on dm_setor_beneficiario.descricao = stg.setorbeneficiario

left join {{ ref('dm_tipo_obra') }} as dm_tipo_obra
    on dm_tipo_obra.descricao = stg.tipoobra

left join {{ ref('dm_tipo_servico') }} as dm_tipo_servico
    on dm_tipo_servico.descricao = stg.tiposervico

left join {{ ref('dm_tipo_situacao') }} as dm_tipo_situacao
    on dm_tipo_situacao.descricao = stg.ultima_situacao
