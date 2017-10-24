---付款单的收款单位明细use wintex
alter view gyl_cw_fkdw_V
as
select a.vdr_no,a.vdr_ab,a.vdr_name,a.contact,a.addr_2 from Ebasic_bvdr  a
union all
select b.bh,b.dwjc,dwqc,'' as contact,'' as addr from gyl_gydj_jgchwlxx b
go


select * from Ebasic_bvdr
select * from gyl_gydj_jgchwlxx b



