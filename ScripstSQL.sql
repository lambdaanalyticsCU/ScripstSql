create procedure Actualizacion_proveedores_retenedores
as
  drop table proveedores_retenedores
begin
  select distinct(f200_nit),f200_razon_social,
  case when f050_id_valor_tercero='2' then 'Si' 
  else 'No'
  end as 'Autorretenedor'
  into dbo.proveedores_retenedores
  from t200_mm_terceros
  join t050_mm_prv_base_ret on f050_rowid_tercero=f200_rowid
end

exec Actualizacion_proveedores_retenedores
