drop if exists schema mdm cascade;

--=================================================================         Справочники         =====================================================================
CREATE SCHEMA mdm;

CREATE SEQUENCE mdm.promotion_promotion_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 10000000
    CACHE 1;

create table mdm.promotion(
    PROMOTION_ID integer  NOT NULL DEFAULT nextval('mdm.promotion_promotion_id_seq'::regclass),
    TITLE varchar(1000),
    CODE varchar(20),
    BEGIN_DTTM timestamp,
    END_DTTM timestamp,
    DESCRIPTION text,
    CONSTRAINT promotion_pkey PRIMARY KEY (PROMOTION_ID)
);
comment on column mdm.promotion.TITLE is 'Название акции';
comment on column mdm.promotion.CODE is 'Промокод';
comment on column mdm.promotion.DESCRIPTION is 'Описание акции';


CREATE SEQUENCE mdm.partner_partner_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 100000000
    CACHE 1;

create table mdm.partner(
    partner_id integer NOT NULL DEFAULT nextval('mdm.partner_partner_id_seq'::regclass),
    VALUE varchar(1000),
    CONSTRAINT partner_pkey PRIMARY KEY (partner_id)
);

CREATE SEQUENCE mdm.product_specification_product_specification_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 100000000
    CACHE 1;

create table mdm.product_specification(
    product_specification_id integer NOT NULL DEFAULT nextval('mdm.product_specification_product_specification_id_seq'::regclass),
    product_specification_name varchar(100),
    product_specification_code varchar(20),
    type_id integer,
    g1_id integer,
    g2_id integer,
    g3_id integer,
    CONSTRAINT product_specification_pkey PRIMARY KEY (product_specification_id)
);
comment on column mdm.product_specification.product_specification_name is '[productSpecificationName] Название типа/групп/продукта (тип ~ товар, услуга, и т.п)';
comment on column mdm.product_specification.product_specification_code is '[productSpecificationCode] Код типа/групп/продукта';
comment on column mdm.product_specification.type_id is '[typeId] ID типа группы';
comment on column mdm.product_specification.g1_id is '[g1Id] ID группы 1 уровня';
comment on column mdm.product_specification.g2_id is '[g2Id] ID группы 2 уровня';
comment on column mdm.product_specification.g3_id is '[g3Id] ID группы 3 уровня';

create view mdm.product_specification_view(product_specification_id, type, type_code, g1, g1_code, g2, g2_code, g3, g3_code, g4, g4_code) as
SELECT g4.product_specification_id,
       ps_type.product_specification_name AS type,
       ps_type.product_specification_code AS type_code,
       g1.product_specification_name AS g1,
       g1.product_specification_code AS g1_code,
       g2.product_specification_name AS g2,
       g2.product_specification_code AS g2_code,
       g3.product_specification_name AS g3,
       g3.product_specification_code AS g3_code,
       g4.product_specification_name AS g4,
       g4.product_specification_code AS g4_code
FROM mdm.product_specification g4
inner JOIN mdm.product_specification g3 ON g3.product_specification_id = g4.g3_id
inner JOIN mdm.product_specification g2 ON g2.product_specification_id = g3.g2_id
inner JOIN mdm.product_specification g1 ON g1.product_specification_id = g2.g1_id
inner JOIN mdm.product_specification ps_type ON ps_type.product_specification_id = g1.g1_id;


CREATE SEQUENCE mdm.product_product_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 100000000
    CACHE 1;

create table mdm.product(
    PRODUCT_ID integer NOT NULL DEFAULT nextval('mdm.product_product_id_seq'::regclass),
    PRODUCT_NAME varchar(400),
    PRODUCT_COST numeric,
    product_specification_id integer,
    PRODUCT_BRAND varchar(200),
    PRODUCT_COUNT integer,
    PRODUCT_WEIGHT numeric,
    PRODUCT_LENGTH numeric,
    PRODUCT_VOLUME numeric,
    ORGANIZATION_ID integer,
    CONSTRAINT product_pkey PRIMARY KEY (PRODUCT_ID)
);

comment on column mdm.PRODUCT.PRODUCT_ID is '[productID] ';
comment on column mdm.PRODUCT.PRODUCT_NAME is '[productName] ';
comment on column mdm.PRODUCT.PRODUCT_COST is '[productCost] ';
comment on column mdm.PRODUCT.product_specification_id is '[productSpecificationId] FK to mdm.product_specification. Спецификациия продукта';
comment on column mdm.PRODUCT.PRODUCT_BRAND is '[productBrand] Торговая марка товара (только для товара)';
comment on column mdm.PRODUCT.PRODUCT_COUNT is '[productCount] Количество товаров (только для товара)';
comment on column mdm.PRODUCT.PRODUCT_WEIGHT is '[productWeight] Масса товара (только для товара)';
comment on column mdm.PRODUCT.PRODUCT_LENGTH is '[productLength] Длина товара (только для товара)';
comment on column mdm.PRODUCT.PRODUCT_VOLUME is '[productVolume] Объем товара (только для товара)';
comment on column mdm.PRODUCT.ORGANIZATION_ID is '[ORGANIZATION_ID] FK to Organization; Компания к которой относится продукт';
create index IDX_PRODUCT_ORGANIZATION_ID on mdm.product (ORGANIZATION_ID);


CREATE SEQUENCE mdm.organization_status_organization_status_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 100
    CACHE 1;

create table mdm.organization_status(
    organization_status_id integer NOT NULL DEFAULT nextval('mdm.organization_status_organization_status_id_seq'::regclass),
    organization_status_name varchar(100),
    CONSTRAINT organization_status_pkey PRIMARY KEY (organization_status_id)
);

CREATE SEQUENCE mdm.person_type_person_type_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 1000
    CACHE 1;

create table mdm.person_type(
    person_type_id integer NOT NULL DEFAULT nextval('mdm.person_type_person_type_id_seq'::regclass),
    person_type_name varchar(100),
    CONSTRAINT person_type_pkey PRIMARY KEY (person_type_id)
);

CREATE SEQUENCE mdm.CITIZENSHIP_CITIZENSHIP_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.CITIZENSHIP(
    CITIZENSHIP_id integer NOT NULL DEFAULT nextval('mdm.CITIZENSHIP_CITIZENSHIP_id_seq'::regclass),
    CITIZENSHIP_name varchar(100),
    CONSTRAINT CITIZENSHIP_pkey PRIMARY KEY (CITIZENSHIP_id)
);

CREATE SEQUENCE mdm.MARITAL_STATUS_MARITAL_STATUS_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.MARITAL_STATUS(
    MARITAL_STATUS_id integer NOT NULL DEFAULT nextval('mdm.MARITAL_STATUS_MARITAL_STATUS_id_seq'::regclass),
    MARITAL_STATUS_name varchar(100),
    CONSTRAINT MARITAL_STATUS_pkey PRIMARY KEY (MARITAL_STATUS_id)
);

CREATE SEQUENCE mdm.EDUCATION_EDUCATION_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.EDUCATION(
    EDUCATION_id integer NOT NULL DEFAULT nextval('mdm.EDUCATION_EDUCATION_id_seq'::regclass),
    EDUCATION_name varchar(100),
    CONSTRAINT EDUCATION_pkey PRIMARY KEY (EDUCATION_id)
);

CREATE SEQUENCE mdm.document_type_document_type_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.document_type(
    document_type_id integer NOT NULL DEFAULT nextval('mdm.document_type_document_type_id_seq'::regclass),
    document_type_name varchar(100),
    CONSTRAINT document_type_pkey PRIMARY KEY (document_type_id)
);

CREATE SEQUENCE mdm.person_SEGMENT_person_SEGMENT_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.person_SEGMENT(
    person_SEGMENT_id integer NOT NULL DEFAULT nextval('mdm.person_SEGMENT_person_SEGMENT_id_seq'::regclass),
    person_SEGMENT_name varchar(100),
    CONSTRAINT person_SEGMENT_pkey PRIMARY KEY (person_SEGMENT_id)
);

CREATE SEQUENCE mdm.PHONE_TYPE_PHONE_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.PHONE_TYPE(
    PHONE_TYPE_id integer NOT NULL DEFAULT nextval('mdm.PHONE_TYPE_PHONE_TYPE_id_seq'::regclass),
    PHONE_TYPE_name varchar(100),
    CONSTRAINT PHONE_TYPE_pkey PRIMARY KEY (PHONE_TYPE_id)
);

CREATE SEQUENCE mdm.NETWORK_TYPE_NETWORK_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.NETWORK_TYPE(
    NETWORK_TYPE_id integer NOT NULL DEFAULT nextval('mdm.NETWORK_TYPE_NETWORK_TYPE_id_seq'::regclass),
    NETWORK_TYPE_name varchar(100),
    CONSTRAINT NETWORK_TYPE_pkey PRIMARY KEY (NETWORK_TYPE_id)
);

CREATE SEQUENCE mdm.MESSENGER_TYPE_MESSENGER_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.MESSENGER_TYPE(
    MESSENGER_TYPE_id integer NOT NULL DEFAULT nextval('mdm.MESSENGER_TYPE_MESSENGER_TYPE_id_seq'::regclass),
    MESSENGER_TYPE_name varchar(100),
    CONSTRAINT MESSENGER_TYPE_pkey PRIMARY KEY (MESSENGER_TYPE_id)
);

CREATE SEQUENCE mdm.EMPLOYMENT_POSITION_EMPLOYMENT_POSITION_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.EMPLOYMENT_POSITION(
    EMPLOYMENT_POSITION_id integer NOT NULL DEFAULT nextval('mdm.EMPLOYMENT_POSITION_EMPLOYMENT_POSITION_id_seq'::regclass),
    EMPLOYMENT_POSITION_name varchar(100),
    CONSTRAINT EMPLOYMENT_POSITION_pkey PRIMARY KEY (EMPLOYMENT_POSITION_id)
);

CREATE SEQUENCE mdm.INTEREST_TYPE_INTEREST_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.INTEREST_TYPE(
    INTEREST_TYPE_id integer NOT NULL DEFAULT nextval('mdm.INTEREST_TYPE_INTEREST_TYPE_id_seq'::regclass),
    INTEREST_TYPE_name varchar(100),
    CONSTRAINT INTEREST_TYPE_pkey PRIMARY KEY (INTEREST_TYPE_id)
);

CREATE SEQUENCE mdm.APPLICATION_STATUS_APPLICATION_STATUS_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.APPLICATION_STATUS(
    APPLICATION_STATUS_id integer NOT NULL DEFAULT nextval('mdm.APPLICATION_STATUS_APPLICATION_STATUS_id_seq'::regclass),
    APPLICATION_STATUS_name varchar(100),
    CONSTRAINT APPLICATION_STATUS_pkey PRIMARY KEY (APPLICATION_STATUS_id)
);

CREATE SEQUENCE mdm.APPLICATION_TYPE_APPLICATION_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.APPLICATION_TYPE(
    APPLICATION_TYPE_id integer NOT NULL DEFAULT nextval('mdm.APPLICATION_TYPE_APPLICATION_TYPE_id_seq'::regclass),
    APPLICATION_TYPE_name varchar(100),
    CONSTRAINT APPLICATION_TYPE_pkey PRIMARY KEY (APPLICATION_TYPE_id)
);

CREATE SEQUENCE mdm.APPLICATION_CHANNEL_APPLICATION_CHANNEL_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.APPLICATION_CHANNEL(
    APPLICATION_CHANNEL_id integer NOT NULL DEFAULT nextval('mdm.APPLICATION_CHANNEL_APPLICATION_CHANNEL_id_seq'::regclass),
    APPLICATION_CHANNEL_name varchar(100),
    CONSTRAINT APPLICATION_CHANNEL_pkey PRIMARY KEY (APPLICATION_CHANNEL_id)
);

CREATE SEQUENCE mdm.ADDRESS_TYPE_ADDRESS_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.ADDRESS_TYPE(
    ADDRESS_TYPE_id integer NOT NULL DEFAULT nextval('mdm.ADDRESS_TYPE_ADDRESS_TYPE_id_seq'::regclass),
    ADDRESS_TYPE_name varchar(100),
    CONSTRAINT ADDRESS_TYPE_pkey PRIMARY KEY (ADDRESS_TYPE_id)
);


CREATE SEQUENCE mdm.ACTION_TYPE_ACTION_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.ACTION_TYPE(
    ACTION_TYPE_id integer NOT NULL DEFAULT nextval('mdm.ACTION_TYPE_ACTION_TYPE_id_seq'::regclass),
    ACTION_TYPE_name varchar(100),
    CONSTRAINT ACTION_TYPE_pkey PRIMARY KEY (ACTION_TYPE_id)
);

CREATE SEQUENCE mdm.ACTION_RESULT_ACTION_RESULT_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.ACTION_RESULT(
    ACTION_RESULT_id integer NOT NULL DEFAULT nextval('mdm.ACTION_RESULT_ACTION_RESULT_id_seq'::regclass),
    ACTION_RESULT_name varchar(100),
    CONSTRAINT ACTION_RESULT_pkey PRIMARY KEY (ACTION_RESULT_id)
);

CREATE SEQUENCE mdm.CALL_TYPE_CALL_TYPE_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.CALL_TYPE(
    CALL_TYPE_id integer NOT NULL DEFAULT nextval('mdm.CALL_TYPE_CALL_TYPE_id_seq'::regclass),
    CALL_TYPE_name varchar(100),
    CONSTRAINT CALL_TYPE_pkey PRIMARY KEY (CALL_TYPE_id)
);

CREATE SEQUENCE mdm.REASON_CODE_TYPE_REASON_CODE_TYPE_ID_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

create table mdm.REASON_CODE_TYPE(
    REASON_CODE_TYPE_ID integer NOT NULL DEFAULT nextval('mdm.REASON_CODE_TYPE_REASON_CODE_TYPE_ID_seq'::regclass),
    REASON_CODE_DECISION integer,
    REASON_CODE_VALUE varchar(10),
    REASON_CODE_DESCRIPTION varchar(200),
    CONSTRAINT REASON_CODE_TYPE_pkey PRIMARY KEY (REASON_CODE_TYPE_ID)
);

--===================================================================================================================================================================