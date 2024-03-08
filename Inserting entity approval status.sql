set role gdgsgom;

select *
from individual
where id not in (
    select entity_id
    from entity_approval_status
)
  and is_voided = false;
 
select * from approval_status as2 ; 

insert into entity_approval_status (uuid, entity_id, entity_type, approval_status_id, approval_status_comment,
                                    organisation_id, status_date_time, created_by_id, last_modified_by_id,
                                    created_date_time, last_modified_date_time, address_id, sync_concept_1_value,
                                    sync_concept_2_value,individual_id)
select uuid_generate_v4(),
       id,
       'Subject',
       1,
       'Marked the status as pending from backend as entry not present in db',
       organisation_id,
       now(),
       (select id from users where username = 'taqi@gdgsgom'),
       (select id from users where username = 'taqi@gdgsgom'),
       now(),
       now(),
       address_id,
       sync_concept_1_value,
       sync_concept_2_value,
       id
from individual
where id in (
1452400,1452401,1452402,1452403,1452404,1452406,1452407,1464340,
1464341,1464342,1464343,1464406,1464407,
1464408,1464409,1464410,1464411,1464412,1464413,1464414,1464415,1464420
)
  and individual.is_voided = false;
