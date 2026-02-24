-- to get lastest info from snapshot table, DBT_VALID_TO will be null

{% snapshot patient_snapshot %}

{{
    config
    (
        strategy = 'check',
        unique_key = 'PATIENT_ID',
        check_cols = ['PATIENT_NAME','PATIENT_CONTACT_NUMBER','PATIENT_EMAIL_ID','PATIENT_ADDRESS']
    )
}}

select * from {{source('patient','PATIENT_SRC')}}

{% endsnapshot %}

