
  CREATE TABLE "C##TEAM03"."COMMUNITY_RECIPE_BOARD" 
   (	"COMMU_NUM" NUMBER NOT NULL ENABLE, 
	"COMMU_TITLE" VARCHAR2(150 BYTE) NOT NULL ENABLE, 
	"MEM_NUM" NUMBER NOT NULL ENABLE, 
	"COMMU_CONTENT" CLOB NOT NULL ENABLE, 
	"COMMU_DATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"COMMU_MODIFY_DATE" DATE, 
	"COMMU_HIT" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"UPLOADFILE" BLOB, 
	"FILENAME" VARCHAR2(100 BYTE), 
	"UPLOADFILE2" BLOB, 
	"FILENAME2" VARCHAR2(100 BYTE), 
	"UPLOADFILE3" BLOB, 
	"FILENAME3" VARCHAR2(100 BYTE), 
	"COMMU_FOOD" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"COMMU_INGREDIENT" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"COMMU_LEVEL" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"COMMU_TIME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"COMMU_CONTENT2" VARCHAR2(500 BYTE) DEFAULT NULL NOT NULL ENABLE, 
	"COMMU_CONTENT3" VARCHAR2(500 BYTE) DEFAULT NULL NOT NULL ENABLE, 
	"COMMU_CONTENT4" VARCHAR2(500 BYTE) DEFAULT NULL, 
	"COMMU_CONTENT5" VARCHAR2(500 BYTE) DEFAULT NULL, 
	"UPLOADFILE4" BLOB, 
	"FILENAME4" VARCHAR2(100 BYTE), 
	"UPLOADFILE5" BLOB, 
	"FILENAME5" VARCHAR2(100 BYTE), 
	"UPLOADFILE6" BLOB, 
	"FILENAME6" VARCHAR2(100 BYTE), 
	 CONSTRAINT "COMMUNITY_RECIPE_PK" PRIMARY KEY ("COMMU_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "COMMUNITY_RECIPE_FK1" FOREIGN KEY ("MEM_NUM")
	  REFERENCES "C##TEAM03"."MEMBER" ("MEM_NUM") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("COMMU_CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE2") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE3") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE4") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE5") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("UPLOADFILE6") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

