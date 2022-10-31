select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2008') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2009') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2010') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2011') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2012') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2013') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2014') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2015') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2016') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2017') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2018') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2019') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2020') }}
union all 
select idobra, bempublico, sigla_orgao, nome_entidade, formaexecucao, modalidade, mun_nome, objeto, nome, setorbeneficiario, tipoobra, tiposervico, ultima_situacao, dataassinatura, valormedicoes, valormateriais, valormaquinasequipamentos, valoraditado
from {{ source('raw', 'obras_2021') }}
