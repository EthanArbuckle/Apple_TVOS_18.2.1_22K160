_TtC14SecureConfigDB10SCDataBase *secure_config_get_default_database()
{
  return objc_alloc_init(&OBJC_CLASS____TtC14SecureConfigDB10SCDataBase);
}

uint64_t secure_config_database_create_slot(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  return secure_config_database_create_slot_with_saltdata(a1, a2, a3, a4, 0LL, 0LL);
}

uint64_t secure_config_database_create_slot_with_saltdata( void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a1;
  v12 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2];
  [NSString stringWithUTF8String:a4];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v14 = @"sha256";
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }

  if (a3 == 2)
  {
    v14 = @"sha384";
    if (a5)
    {
LABEL_4:
      v15 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a5 length:a6];
      uint64_t v16 = [v11 slotWithSlotID:v12 algorithm:v14 recordType:v13 salt:v15 error:0];

      goto LABEL_10;
    }

LABEL_6:
    uint64_t v16 = [v11 slotWithSlotID:v12 algorithm:v14 recordType:v13 salt:0 error:0];
    goto LABEL_10;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    secure_config_database_create_slot_with_saltdata_cold_1();
  }
  uint64_t v16 = 0LL;
LABEL_10:

  return v16;
}

_TtC14SecureConfigDB7SCEntry *secure_config_entry_create_with_buffer(uint64_t a1, uint64_t a2)
{
  v2 = 0LL;
  if (a1 && a2)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1 length:a2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      v2 = -[SCEntry initWithData:metadata:]( objc_alloc(&OBJC_CLASS____TtC14SecureConfigDB7SCEntry),  "initWithData:metadata:",  v3,  0LL);
    }
    else {
      v2 = 0LL;
    }
  }

  return v2;
}

uint64_t secure_config_entry_set_metadata(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v8 = 0xFFFFFFFFLL;
  if (v7 && a2 && a3 && a4)
  {
    [MEMORY[0x189603F48] dataWithBytes:a3 length:a4];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [NSString stringWithUTF8String:a2];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setMetadataWithKey:v10 data:v9];

      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

uint64_t secure_config_slot_append_entry(void *a1, uint64_t a2)
{
  id v5 = 0LL;
  int v2 = [a1 append:a2 error:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    secure_config_slot_append_entry_cold_1(v3);
  }

  return v2 ^ 1u;
}

uint64_t sub_188B4608C()
{
  uint64_t v0 = sub_188B58A40();
  __swift_allocate_value_buffer(v0, qword_18C73E780);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C73E780);
  return sub_188B589E0();
}

uint64_t static SCDataBase.defaultURL.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_18C73E778 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_188B58A40();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_18C73E780);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_188B46174@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_188B461C8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  swift_beginAccess();
  void *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_188B46230()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_188B46278(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_188B462C8())()
{
  return j__swift_endAccess;
}

uint64_t SCDataBase.__allocating_init(dbURL:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SCDataBase.init(dbURL:)(a1);
}

uint64_t SCDataBase.init(dbURL:)(uint64_t a1)
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = sub_188B58BA8();
  MEMORY[0x1895F8858](v3);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_188B58A40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v18[0] = 0LL;
  v10 = v1;
  sysctlbyname("kern.bootsessionuuid", 0LL, v18, 0LL, 0LL);
  size_t v11 = v18[0];
  if ((v18[0] & 0x8000000000000000LL) != 0)
  {
    uint64_t result = sub_188B58D64();
    __break(1u);
  }

  else
  {
    if (v18[0])
    {
      uint64_t v12 = sub_188B58C68();
      *(void *)(v12 + 16) = v11;
      bzero((void *)(v12 + 32), v11);
    }

    else
    {
      uint64_t v12 = MEMORY[0x18961AFE8];
    }

    swift_bridgeObjectRetain();
    sub_188B58B90();
    sub_188B4666C(v12, v5);
    swift_bridgeObjectRelease();
    sub_188B58A04();
    swift_bridgeObjectRelease();
    v13 = &v10[OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_dbURL];
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))( &v10[OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_dbURL],  v9,  v6);
    *(void *)&v10[OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots] = sub_188B48D50(v13);

    v14 = (objc_class *)type metadata accessor for SCDataBase();
    v17.receiver = v10;
    v17.super_class = v14;
    id v15 = objc_msgSendSuper2(&v17, sel_init);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    return (uint64_t)v15;
  }

  return result;
}

uint64_t sub_188B465B4(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    uint64_t result = sub_188B58D64();
    __break(1u);
  }

  else
  {
    if (!a2) {
      return MEMORY[0x18961AFE8];
    }
    uint64_t v4 = sub_188B58C68();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }

  return result;
}

uint64_t sub_188B4666C(uint64_t a1, char *a2)
{
  uint64_t v4 = sub_188B58BA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  v10 = (char *)&v24 - v9;
  sub_188B58B84();
  char v11 = sub_188B58B78();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v10, v4);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, a2, v4);
  if ((v11 & 1) != 0)
  {
    v12(v8, v4);
    goto LABEL_4;
  }

  sub_188B58B90();
  char v13 = sub_188B58B78();
  v12(v10, v4);
  v12(v8, v4);
  if ((v13 & 1) != 0)
  {
LABEL_4:
    uint64_t v14 = sub_188B47968(0, a1);
    if ((v15 & 1) == 0)
    {
      if ((v14 & 0x8000000000000000LL) == 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_188B58BC0();
        uint64_t v18 = v17;
        swift_unknownObjectRelease();
        if (v18)
        {
          sub_188B58B84();
          char v19 = sub_188B58B78();
          v12(v10, v4);
          if ((v19 & 1) != 0 || (sub_188B58D10() & 1) != 0)
          {
            swift_bridgeObjectRelease();
LABEL_15:
            v12(a2, v4);
            return v16;
          }

          swift_bridgeObjectRelease();
        }

        goto LABEL_11;
      }

      __break(1u);
    }

    __break(1u);
    goto LABEL_18;
  }

LABEL_11:
  uint64_t v20 = sub_188B47968(0, a1);
  if ((v21 & 1) == 0)
  {
    id v22 = objc_msgSend( objc_allocWithZone(NSString),  sel_initWithBytes_length_encoding_,  a1 + 32,  v20,  sub_188B58B9C());
    swift_bridgeObjectRelease();
    if (v22)
    {
      uint64_t v16 = sub_188B58B60();
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    goto LABEL_15;
  }

    v20[(v14 >> 6) + 8] |= 1LL << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (void *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1LL);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }

    goto LABEL_14;
  }

  sub_188B51970(v17, a5 & 1);
  v23 = sub_188B47AE8(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    uint64_t v14 = v23;
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_18:
  uint64_t result = sub_188B58D70();
  __break(1u);
  return result;
}

    uint64_t v9 = (v14 - 1) & v14;
    char v11 = v15;
  }

  uint64_t v16 = v3 + 4;
  if (v3 + 4 >= v32) {
    return result;
  }
  uint64_t v14 = *(void *)(v31 + 8 * v16);
  if (v14)
  {
    char v15 = v3 + 4;
    goto LABEL_18;
  }

  while (1)
  {
    char v15 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v15 >= v32) {
      return result;
    }
    uint64_t v14 = *(void *)(v31 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_18;
    }
  }

    uint64_t v9 = (v13 - 1) & v13;
    v34 = v14;
  }

  char v15 = v3 + 4;
  if (v3 + 4 >= v30) {
    return result;
  }
  char v13 = *(void *)(v5 + 8 * v15);
  if (v13)
  {
    uint64_t v14 = v3 + 4;
    goto LABEL_18;
  }

  while (1)
  {
    uint64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v14 >= v30) {
      return result;
    }
    char v13 = *(void *)(v5 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_18;
    }
  }

    v10 = (v15 - 1) & v15;
    uint64_t v12 = v16;
  }

  uint64_t v17 = v4 + 4;
  if (v4 + 4 >= v30) {
    return (uint64_t)v3;
  }
  char v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    uint64_t v16 = v4 + 4;
    goto LABEL_18;
  }

  while (1)
  {
    uint64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v30) {
      return (uint64_t)v3;
    }
    char v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_18;
    }
  }

id SCDataBase.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SCDataBase.init()()
{
  uint64_t v0 = sub_188B58A40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18C73E778 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_18C73E780);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  id v5 = objc_allocWithZone((Class)type metadata accessor for SCDataBase());
  uint64_t v6 = SCDataBase.init(dbURL:)((uint64_t)v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

void (*sub_188B46B24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t, uint64_t)
{
  if (!a7)
  {
    uint64_t v16 = 0LL;
    unint64_t v17 = 0xF000000000000000LL;
LABEL_6:
    uint64_t v7 = sub_188B46C3C(a1, a2, a3, a4, a5, v16, v17);
    sub_188B49950(v16, v17);
    return v7;
  }

  uint64_t v13 = sub_188B58A64();
  if (v14 >> 60 != 15)
  {
    uint64_t v16 = v13;
    unint64_t v17 = v14;
    goto LABEL_6;
  }

  sub_188B499A8();
  swift_allocError();
  _BYTE *v15 = 13;
  swift_willThrow();
  return v7;
}

void (*sub_188B46C20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t, uint64_t)
{
  return sub_188B46C3C(a1, a2, a3, a4, a5, 0LL, 0xF000000000000000LL);
}

void (*sub_188B46C3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7))(uint64_t, uint64_t)
{
  uint64_t v89 = a2;
  uint64_t v90 = a4;
  uint64_t v91 = a3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E7C8);
  MEMORY[0x1895F8858](v12);
  unint64_t v14 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v87 = sub_188B58AD0();
  uint64_t v96 = *(void *)(v87 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v87);
  unint64_t v17 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v15);
  v86 = (char *)&v78 - v19;
  MEMORY[0x1895F8858](v18);
  v93 = (char *)&v78 - v20;
  uint64_t v95 = sub_188B58A40();
  uint64_t v92 = *(void *)(v95 - 8);
  uint64_t v21 = MEMORY[0x1895F8858](v95);
  v23 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v21);
  v94 = (char *)&v78 - v24;
  v25 = (uint64_t *)(v7 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  swift_beginAccess();
  v80 = v25;
  uint64_t v26 = *v25;
  if (!*(void *)(v26 + 16))
  {
LABEL_16:
    v79 = v17;
    sub_188B58AB8();
    uint64_t v83 = a6;
    unint64_t v82 = a7;
    uint64_t v85 = a1;
    uint64_t v81 = a5;
    v34 = v94;
    sub_188B58A04();
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v23;
    v36 = v14;
    uint64_t v37 = v92;
    v38 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
    uint64_t v39 = v95;
    v38(v23, v34, v95);
    v40 = *(void (**)(char *, uint64_t, uint64_t))(v96 + 16);
    v41 = v93;
    uint64_t v42 = v87;
    v40(v93, v85, v87);
    uint64_t v84 = v35;
    v38(v36, (char *)v35, v39);
    unint64_t v43 = v82;
    uint64_t v44 = v83;
    uint64_t v45 = (uint64_t)v36;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v36, 0LL, 1LL, v39);
    v46 = v86;
    v40(v86, (uint64_t)v41, v42);
    v47 = (objc_class *)type metadata accessor for SCSlot();
    v48 = (char *)objc_allocWithZone(v47);
    v78 = v40;
    v40(&v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotID], (uint64_t)v46, v42);
    uint64_t v49 = v81;
    v50 = &v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm];
    uint64_t v51 = v91;
    *(void *)v50 = v89;
    *((void *)v50 + 1) = v51;
    v52 = &v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType];
    *(void *)v52 = v90;
    *((void *)v52 + 1) = v49;
    sub_188B49A2C(v45, (uint64_t)&v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotURL]);
    v53 = (uint64_t *)&v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData];
    uint64_t *v53 = v44;
    v53[1] = v43;
    if (v43 >> 60 == 15)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v54 = v48;
      uint64_t v55 = 0LL;
      uint64_t v56 = 0LL;
    }

    else
    {
      sub_188B49A74(v44, v43);
      sub_188B49A74(v44, v43);
      sub_188B49A74(v44, v43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v57 = v48;
      uint64_t v55 = sub_188B58A7C();
    }

    uint64_t v58 = v44;
    unint64_t v59 = v43;
    v60 = (uint64_t *)&v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_salt];
    uint64_t *v60 = v55;
    v60[1] = v56;
    *(void *)&v48[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries] = MEMORY[0x18961AFE8];

    v97.receiver = v48;
    v97.super_class = v47;
    id v61 = objc_msgSendSuper2(&v97, sel_init);
    sub_188B49950(v58, v59);
    v62 = *(void (**)(char *, uint64_t))(v96 + 8);
    v62(v46, v42);
    sub_188B49E74(v45, &qword_18C73E7C8);
    id v63 = v61;
    uint64_t v64 = v84;
    uint64_t v65 = v88;
    sub_188B53C6C(v84);

    sub_188B49950(v58, v59);
    if (v65)
    {

      v62(v93, v42);
      v30 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      uint64_t v66 = v95;
      v30(v64, v95);
      v30((uint64_t)v94, v66);
    }

    else
    {
      v62(v93, v42);
      v67 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      uint64_t v68 = v95;
      v67(v64, v95);
      uint64_t v69 = (uint64_t)v79;
      v78(v79, v85, v42);
      v70 = v80;
      swift_beginAccess();
      v30 = (void (*)(uint64_t, uint64_t))v63;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v98 = *v70;
      uint64_t *v70 = 0x8000000000000000LL;
      sub_188B47DC8((uint64_t)v30, v69, isUniquelyReferenced_nonNull_native);
      uint64_t *v70 = v98;
      swift_bridgeObjectRelease();
      v62((char *)v69, v42);
      swift_endAccess();
      v67((uint64_t)v94, v68);
    }

    return v30;
  }

  swift_bridgeObjectRetain();
  unint64_t v27 = sub_188B47B4C(a1);
  if ((v28 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }

  unint64_t v29 = a7;
  v30 = (void (*)(uint64_t, uint64_t))*(id *)(*(void *)(v26 + 56) + 8 * v27);
  swift_bridgeObjectRelease();
  uint64_t v31 = v90;
  BOOL v32 = *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm) == v89
     && *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm + 8) == v91;
  if (v32 || (sub_188B58E18() & 1) != 0)
  {
    BOOL v33 = *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType) == v31
       && *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType + 8) == a5;
    if (v33 || (sub_188B58E18() & 1) != 0)
    {
      if (v29 >> 60 == 15) {
        return v30;
      }
      uint64_t v72 = *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData);
      unint64_t v73 = *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData + 8);
      if (v73 >> 60 == 15)
      {
        sub_188B49A88(a6, v29);
        sub_188B49950(v72, v73);
        sub_188B49950(a6, v29);
      }

      else
      {
        sub_188B49A74( *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData),  *(void *)((char *)v30 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData + 8));
        sub_188B49A74(a6, v29);
        sub_188B48AD8(v72, v73);
        char v75 = v74;
        sub_188B49950(a6, v29);
        sub_188B49950(v72, v73);
        if ((v75 & 1) != 0) {
          return v30;
        }
      }
    }
  }

  sub_188B499A8();
  swift_allocError();
  _BYTE *v76 = 13;
  swift_willThrow();

  return v30;
}

id SCDataBase.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SCDataBase();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double SCDataBase.makeIterator()@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)v4;
  __int128 v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = v5;
  return result;
}

double sub_188B475C4@<D0>(uint64_t a1@<X8>)
{
  __int128 v3 = *v1;
  sub_188B49ACC(v6);
  sub_188B49DEC((uint64_t)v6, (uint64_t)v8, &qword_18C73E7D0);
  sub_188B49B48((uint64_t)v8);

  double result = *(double *)v6;
  __int128 v5 = v6[1];
  *(_OWORD *)a1 = v6[0];
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_188B47624()
{
  return 0LL;
}

uint64_t sub_188B4762C()
{
  return 2LL;
}

char *sub_188B47634()
{
  uint64_t v1 = (void *)*v0;
  objc_super v2 = sub_188B48130(*v0);

  return v2;
}

void sub_188B47664(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_188B47684()
{
  return sub_188B58C14();
}

void sub_188B476EC(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_188B476F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_188B47700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_188B47760( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  uint64_t v42 = v39;
  __int16 v43 = v40;
  char v44 = BYTE2(v40);
  char v45 = BYTE3(v40);
  char v46 = BYTE4(v40);
  char v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x188B47944LL);
  }

  uint64_t result = memcmp(v38, &v42, BYTE6(v40));
  *uint64_t v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_188B47968(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0LL;
  }
  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = v2 - 2;
  while (v5 != v4)
  {
    int v6 = *(unsigned __int8 *)(a2 + 34 + v4++);
    if (v6 == a1) {
      return v4 + 1;
    }
  }

  return 0LL;
}

char *sub_188B479F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E850);
      v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      v10 = (char *)MEMORY[0x18961AFE8];
      uint64_t v12 = (char *)(MEMORY[0x18961AFE8] + 32LL);
    }

    sub_188B4886C(0LL, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

unint64_t sub_188B47AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188B58E90();
  return sub_188B47BB0(a1, a2, v4);
}

unint64_t sub_188B47B4C(uint64_t a1)
{
  uint64_t v2 = sub_188B58B3C();
  return sub_188B47C90(a1, v2);
}

unint64_t sub_188B47BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_188B58E18() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_188B58E18() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_188B47C90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v16[1] = a1;
  uint64_t v5 = sub_188B58AD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  int64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_188B49E34(&qword_18C73E848, MEMORY[0x189606F58]);
      char v14 = sub_188B58B48();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

void sub_188B47DC8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_188B58AD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_188B47B4C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }

  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }

    goto LABEL_11;
  }

  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_188B51FA4();
    goto LABEL_7;
  }

  sub_188B51604(v17, a3 & 1);
  unint64_t v22 = sub_188B47B4C(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_188B58E3C();
    __break(1u);
    return;
  }

  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if ((v18 & 1) != 0) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_188B48098(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_188B47F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_188B47AE8(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_188B521CC();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_188B49964(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }

LABEL_15:
  uint64_t result = sub_188B58E3C();
  __break(1u);
  return result;
}

uint64_t sub_188B48098(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_188B58AD0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))( v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  a2,  v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1LL);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

char *sub_188B48130(uint64_t a1)
{
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E830);
  uint64_t v2 = *(void *)(v53 - 8);
  uint64_t v3 = MEMORY[0x1895F8858](v53);
  uint64_t v51 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v3);
  uint64_t v55 = (uint64_t)&v47 - v5;
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(*v6 + 64);
  uint64_t v49 = *v6 + 64;
  uint64_t v9 = 1LL << *(_BYTE *)(v7 + 32);
  uint64_t v10 = -1LL;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  unint64_t v11 = v10 & v8;
  uint64_t v54 = v2;
  uint64_t v12 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v13 = (void *)MEMORY[0x18961AFE8];
  uint64_t v14 = MEMORY[0x18961AFE8] + ((v12 + 32) & ~v12);
  int64_t v50 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v47 = v12 | 7;
  uint64_t v48 = (v12 + 32) & ~v12;
  uint64_t v52 = v7;
  uint64_t result = (char *)swift_bridgeObjectRetain();
  uint64_t v16 = 0LL;
  int64_t v17 = 0LL;
  if (!v11) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v18 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v17 << 6))
  {
    uint64_t v23 = v52;
    uint64_t v24 = *(void *)(v52 + 48);
    uint64_t v25 = sub_188B58AD0();
    uint64_t v26 = (uint64_t)v51;
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v25 - 8) + 16LL))( v51,  v24 + *(void *)(*(void *)(v25 - 8) + 72LL) * i,  v25);
    uint64_t v27 = *(void **)(*(void *)(v23 + 56) + 8 * i);
    *(void *)(v26 + *(int *)(v53 + 48)) = v27;
    uint64_t result = (char *)sub_188B49DEC(v26, v55, &qword_18C73E830);
    if (v16)
    {
      uint64_t result = v27;
      BOOL v28 = v13;
      BOOL v29 = __OFSUB__(v16--, 1LL);
      if (v29) {
        break;
      }
      goto LABEL_43;
    }

    unint64_t v30 = v13[3];
    int64_t v31 = v30 & 0xFFFFFFFFFFFFFFFELL;
    if (v31 <= 1) {
      uint64_t v32 = 1LL;
    }
    else {
      uint64_t v32 = v31;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E838);
    uint64_t v33 = *(void *)(v54 + 72);
    uint64_t v34 = v48;
    BOOL v28 = (void *)swift_allocObject();
    uint64_t result = (char *)_swift_stdlib_malloc_size(v28);
    if (!v33) {
      goto LABEL_52;
    }
    uint64_t v35 = (uint64_t)&result[-v34];
    v28[2] = v32;
    v28[3] = 2 * (v35 / v33);
    uint64_t v37 = (char *)v28 + v34;
    uint64_t v38 = v34;
    uint64_t v39 = v13[3] >> 1;
    uint64_t v14 = (uint64_t)&v37[v39 * v33];
    uint64_t v40 = ((v35 / v33) & 0x7FFFFFFFFFFFFFFFLL) - v39;
    if (v13[2])
    {
      if (v28 < v13 || v37 >= (char *)v13 + v38 + v39 * v33)
      {
        id v43 = v27;
        swift_arrayInitWithTakeFrontToBack();
      }

      else
      {
        id v41 = v27;
        if (v28 != v13) {
          swift_arrayInitWithTakeBackToFront();
        }
      }

      v13[2] = 0LL;
    }

    else
    {
      id v42 = v27;
    }

    uint64_t result = (char *)swift_release();
    BOOL v29 = __OFSUB__(v40, 1LL);
    uint64_t v16 = v40 - 1;
    if (v29) {
      break;
    }
LABEL_43:
    uint64_t result = (char *)sub_188B49DEC(v55, v14, &qword_18C73E830);
    v14 += *(void *)(v54 + 72);
    uint64_t v13 = v28;
    if (v11) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      goto LABEL_50;
    }
    if (v20 >= v50) {
      goto LABEL_45;
    }
    unint64_t v21 = *(void *)(v49 + 8 * v20);
    ++v17;
    if (!v21)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v50) {
        goto LABEL_45;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v17);
      if (!v21)
      {
        int64_t v17 = v20 + 2;
        if (v20 + 2 >= v50) {
          goto LABEL_45;
        }
        unint64_t v21 = *(void *)(v49 + 8 * v17);
        if (!v21)
        {
          int64_t v17 = v20 + 3;
          if (v20 + 3 >= v50) {
            goto LABEL_45;
          }
          unint64_t v21 = *(void *)(v49 + 8 * v17);
          if (!v21)
          {
            int64_t v22 = v20 + 4;
            if (v22 >= v50)
            {
LABEL_45:
              uint64_t result = (char *)swift_release();
              unint64_t v44 = v13[3];
              if (v44 >= 2)
              {
                unint64_t v45 = v44 >> 1;
                BOOL v29 = __OFSUB__(v45, v16);
                uint64_t v46 = v45 - v16;
                if (v29) {
                  goto LABEL_55;
                }
                v13[2] = v46;
              }

              return (char *)v13;
            }

            unint64_t v21 = *(void *)(v49 + 8 * v22);
            if (!v21)
            {
              while (1)
              {
                int64_t v17 = v22 + 1;
                if (__OFADD__(v22, 1LL)) {
                  goto LABEL_54;
                }
                if (v17 >= v50) {
                  goto LABEL_45;
                }
                unint64_t v21 = *(void *)(v49 + 8 * v17);
                ++v22;
                if (v21) {
                  goto LABEL_20;
                }
              }
            }

            int64_t v17 = v22;
          }
        }
      }
    }

LABEL_20:
    unint64_t v11 = (v21 - 1) & v21;
  }

  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

void sub_188B48534(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E830);
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = &v3[OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots];
  swift_beginAccess();
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v37 = v14 + 64;
  uint64_t v35 = -1LL << *(_BYTE *)(v14 + 32);
  if (-v35 < 64) {
    uint64_t v16 = ~(-1LL << -(char)v35);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  swift_bridgeObjectRetain();

  if (!a2)
  {
    int64_t v18 = 0LL;
LABEL_38:
    uint64_t v30 = ~v35;
    uint64_t v31 = v37;
    *a1 = v14;
    a1[1] = v31;
    a1[2] = v30;
    a1[3] = v18;
    a1[4] = v17;
    return;
  }

  if (!a3)
  {
    int64_t v18 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v38 = a3;
  int64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int64_t v36 = (unint64_t)(63 - v35) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v34 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    ++v19;
    uint64_t v25 = *(void *)(v14 + 48);
    uint64_t v26 = sub_188B58AD0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v26 - 8) + 16LL))( v10,  v25 + *(void *)(*(void *)(v26 - 8) + 72LL) * v21,  v26);
    uint64_t v27 = *(void **)(*(void *)(v14 + 56) + 8 * v21);
    *(void *)&v10[*(int *)(v40 + 48)] = v27;
    sub_188B49DEC((uint64_t)v10, (uint64_t)v12, &qword_18C73E830);
    sub_188B49DEC((uint64_t)v12, a2, &qword_18C73E830);
    if (v19 == v38)
    {
      id v29 = v27;
      a1 = v34;
      goto LABEL_38;
    }

    a2 += *(void *)(v39 + 72);
    id v28 = v27;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v22 >= v36) {
      goto LABEL_33;
    }
    unint64_t v23 = *(void *)(v37 + 8 * v22);
    if (!v23) {
      break;
    }
LABEL_18:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }

  v18 += 2LL;
  if (v22 + 1 >= v36)
  {
    unint64_t v17 = 0LL;
    int64_t v18 = v22;
    goto LABEL_37;
  }

  unint64_t v23 = *(void *)(v37 + 8 * v18);
  if (v23) {
    goto LABEL_14;
  }
  int64_t v24 = v22 + 2;
  if (v22 + 2 >= v36) {
    goto LABEL_33;
  }
  unint64_t v23 = *(void *)(v37 + 8 * v24);
  if (v23) {
    goto LABEL_17;
  }
  int64_t v18 = v22 + 3;
  if (v22 + 3 >= v36)
  {
    unint64_t v17 = 0LL;
    int64_t v18 = v22 + 2;
    goto LABEL_37;
  }

  unint64_t v23 = *(void *)(v37 + 8 * v18);
  if (v23)
  {
LABEL_14:
    int64_t v22 = v18;
    goto LABEL_18;
  }

  int64_t v24 = v22 + 4;
  if (v22 + 4 >= v36)
  {
LABEL_33:
    unint64_t v17 = 0LL;
LABEL_37:
    a1 = v34;
    goto LABEL_38;
  }

  unint64_t v23 = *(void *)(v37 + 8 * v24);
  if (v23)
  {
LABEL_17:
    int64_t v22 = v24;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v22 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v22 >= v36)
    {
      unint64_t v17 = 0LL;
      int64_t v18 = v33;
      goto LABEL_37;
    }

    unint64_t v23 = *(void *)(v37 + 8 * v22);
    ++v24;
    if (v23) {
      goto LABEL_18;
    }
  }

LABEL_41:
  __break(1u);
}

char *sub_188B4886C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }

  uint64_t result = (char *)sub_188B58DAC();
  __break(1u);
  return result;
}

uint64_t sub_188B48950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_188B47700((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_188B48A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_188B5898C();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_188B589A4();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v11 += a1 - result;
  }

  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v14 = sub_188B58998();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v11 + v15;
  if (v11) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  sub_188B47700(v11, v17, a4, a5);
  if (!v5) {
    char v18 = v19;
  }
  return v18 & 1;
}

void sub_188B48AD8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_188B48B24()
{
  return ((uint64_t (*)(void))((char *)&loc_188B48B58 + *((int *)qword_188B48D30 + (v0 >> 62))))();
}

uint64_t sub_188B48B68@<X0>(int a1@<W8>)
{
  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1) {
      __asm { BR              X10 }
    }

    char v3 = 1;
  }

  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

uint64_t sub_188B48D50(void *a1)
{
  v112[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E858);
  MEMORY[0x1895F8858](v2);
  v107 = (char *)v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v103 = sub_188B58AD0();
  uint64_t v106 = *(void *)(v103 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v103);
  uint64_t v92 = (char *)v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  v101 = (char *)v90 - v7;
  MEMORY[0x1895F8858](v6);
  v104 = (char *)v90 - v8;
  uint64_t v9 = sub_188B58A40();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v98 = (char *)v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  objc_super v97 = (char *)v90 - v14;
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  v102 = (char *)v90 - v16;
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  v108 = (char *)v90 - v18;
  MEMORY[0x1895F8858](v17);
  unint64_t v20 = (char *)v90 - v19;
  uint64_t v21 = sub_188B58AF4();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1895F8858](v21);
  int64_t v24 = (char *)v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188B58AE8();
  id v25 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  uint64_t v105 = v10;
  uint64_t v26 = *(void (**)(char *, void *, uint64_t))(v10 + 16);
  v109 = a1;
  v26(v20, a1, v9);
  uint64_t v27 = (os_log_s *)sub_188B58ADC();
  os_log_type_t v28 = sub_188B58CC8();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v110 = v9;
  uint64_t v94 = v21;
  uint64_t v93 = v22;
  id v95 = v25;
  if (v29)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    v112[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = sub_188B58A1C();
    uint64_t v111 = sub_188B55A58(v32, v33, (uint64_t *)v112);
    id v25 = v95;
    sub_188B58CE0();
    swift_bridgeObjectRelease();
    uint64_t v105 = *(void *)(v105 + 8);
    ((void (*)(char *, uint64_t))v105)(v20, v110);
    _os_log_impl(&dword_188B44000, v27, v28, "Loading SecureConfigDB at %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895D26F8](v31, -1LL, -1LL);
    MEMORY[0x1895D26F8](v30, -1LL, -1LL);
  }

  else
  {

    uint64_t v105 = *(void *)(v105 + 8);
    ((void (*)(char *, uint64_t))v105)(v20, v9);
  }

  uint64_t v34 = (void *)sub_188B589F8();
  v112[0] = 0LL;
  unsigned int v35 = objc_msgSend( v25,  sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_,  v34,  1,  0,  v112);

  id v36 = v112[0];
  uint64_t v38 = v106;
  uint64_t v37 = (uint64_t)v107;
  uint64_t v39 = v103;
  if (!v35) {
    goto LABEL_21;
  }
  id v40 = v112[0];
  sub_188B58A1C();
  id v41 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  v112[0] = 0LL;
  id v42 = objc_msgSend(v25, sel_contentsOfDirectoryAtPath_error_, v41, v112);

  id v36 = v112[0];
  if (v42)
  {
    v99 = v24;
    uint64_t v43 = sub_188B58C44();
    id v44 = v36;

    uint64_t v46 = *(void *)(v43 + 16);
    v90[0] = v43;
    if (v46)
    {
      uint64_t v47 = v43 + 40;
      uint64_t v98 = (char *)MEMORY[0x18961AFF0];
      *(void *)&__int128 v45 = 136315394LL;
      __int128 v91 = v45;
      v90[1] = MEMORY[0x18961AFC0] + 8LL;
      uint64_t v48 = v104;
      v100 = v26;
      while (1)
      {
        swift_bridgeObjectRetain();
        sub_188B58AAC();
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v37, 1LL, v39) == 1)
        {
          sub_188B49E74(v37, &qword_18C73E858);
        }

        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v48, v37, v39);
          sub_188B58AB8();
          uint64_t v49 = v108;
          sub_188B58A04();
          uint64_t v50 = v39;
          uint64_t v51 = (void (*)(char *, char *, uint64_t))v100;
          swift_bridgeObjectRelease();
          uint64_t v52 = (uint64_t)v102;
          v51(v102, v49, v110);
          uint64_t v53 = sub_188B570A8(v52);
          uint64_t v54 = *(void (**)(uint64_t, char *, uint64_t))(v38 + 16);
          uint64_t v55 = (uint64_t)v101;
          v54((uint64_t)v101, v48, v50);
          uint64_t v96 = v53;
          uint64_t v56 = v98;
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v112[0] = v56;
          unint64_t v59 = sub_188B47B4C(v55);
          uint64_t v60 = v56[2];
          BOOL v61 = (v58 & 1) == 0;
          uint64_t v62 = v60 + v61;
          if (__OFADD__(v60, v61)) {
            __break(1u);
          }
          char v63 = v58;
          if (v56[3] >= v62)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_188B51FA4();
            }
          }

          else
          {
            sub_188B51604(v62, isUniquelyReferenced_nonNull_native);
            unint64_t v64 = sub_188B47B4C((uint64_t)v101);
            if ((v63 & 1) != (v65 & 1))
            {
              uint64_t result = sub_188B58E3C();
              __break(1u);
              return result;
            }

            unint64_t v59 = v64;
          }

          uint64_t v37 = (uint64_t)v107;
          uint64_t v66 = (uint64_t)v101;
          v67 = v112[0];
          uint64_t v98 = (char *)v112[0];
          if ((v63 & 1) != 0)
          {
            uint64_t v68 = *((void *)v112[0] + 7);
            uint64_t v69 = 8 * v59;

            v70 = v96;
            *(void *)(v68 + v69) = v96;
            uint64_t v39 = v103;
          }

          else
          {
            uint64_t v71 = (uint64_t)v92;
            uint64_t v39 = v103;
            v54((uint64_t)v92, v101, v103);
            v70 = v96;
            sub_188B48098(v59, v71, (uint64_t)v96, v67);
          }

          swift_bridgeObjectRelease();
          uint64_t v72 = v106;
          unint64_t v73 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
          v73(v66, v39);

          uint64_t v38 = v72;
          ((void (*)(char *, uint64_t))v105)(v108, v110);
          uint64_t v48 = v104;
          v73((uint64_t)v104, v39);
        }

        v47 += 16LL;
        if (!--v46) {
          goto LABEL_26;
        }
      }
    }

    uint64_t v98 = (char *)MEMORY[0x18961AFF0];
LABEL_26:
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v93 + 8))(v99, v94);
    return (uint64_t)v98;
  }

  else
  {
LABEL_21:
    id v74 = v36;
    char v75 = (void *)sub_188B589BC();

    swift_willThrow();
    v76 = v98;
    uint64_t v77 = v110;
    v26(v98, v109, v110);
    id v78 = v75;
    id v79 = v75;
    v80 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v81 = sub_188B58CBC();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = swift_slowAlloc();
      uint64_t v83 = (void *)swift_slowAlloc();
      v109 = (void *)swift_slowAlloc();
      v112[0] = v109;
      *(_DWORD *)uint64_t v82 = 136315394;
      uint64_t v84 = sub_188B58A1C();
      uint64_t v111 = sub_188B55A58(v84, v85, (uint64_t *)v112);
      v99 = v24;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v105)(v76, v77);
      *(_WORD *)(v82 + 12) = 2112;
      id v86 = v75;
      uint64_t v87 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v111 = v87;
      sub_188B58CE0();
      *uint64_t v83 = v87;
      MEMORY[0x1895D262C](v75);
      MEMORY[0x1895D262C](v75);
      _os_log_impl(&dword_188B44000, v80, v81, "Failed to read %s with error %@", (uint8_t *)v82, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E860);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v83, -1LL, -1LL);
      uint64_t v88 = v109;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v88, -1LL, -1LL);
      MEMORY[0x1895D26F8](v82, -1LL, -1LL);

      MEMORY[0x1895D262C](v75);
      (*(void (**)(char *, uint64_t))(v93 + 8))(v99, v94);
    }

    else
    {

      MEMORY[0x1895D262C](v75);
      ((void (*)(char *, uint64_t))v105)(v76, v77);
      MEMORY[0x1895D262C](v75);
      MEMORY[0x1895D262C](v75);

      (*(void (**)(char *, uint64_t))(v93 + 8))(v24, v94);
    }

    return MEMORY[0x18961AFF0];
  }

uint64_t type metadata accessor for SCDataBase()
{
  uint64_t result = qword_18C73E810;
  if (!qword_18C73E810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_188B49950(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_188B49964(a1, a2);
  }
  return a1;
}

uint64_t sub_188B49964(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_188B499A8()
{
  unint64_t result = qword_18C73E7C0;
  if (!qword_18C73E7C0)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59E08, &type metadata for SCUtilError);
    atomic_store(result, (unint64_t *)&qword_18C73E7C0);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895D2674]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_188B49A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E7C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_188B49A74(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_188B49A88(a1, a2);
  }
  return a1;
}

uint64_t sub_188B49A88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_188B49ACC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_slots);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v6 = -1LL;
  uint64_t v7 = -1LL << *(_BYTE *)(*v3 + 32);
  *a1 = *v3;
  uint64_t v10 = *(void *)(v5 + 64);
  uint64_t v8 = v5 + 64;
  uint64_t v9 = v10;
  if (-v7 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v7);
  }
  a1[1] = v8;
  a1[2] = ~v7;
  a1[3] = 0LL;
  a1[4] = v6 & v9;
  return result;
}

uint64_t sub_188B49B48(uint64_t a1)
{
  return a1;
}

uint64_t sub_188B49B78()
{
  return swift_retain();
}

unint64_t sub_188B49B84()
{
  unint64_t result = qword_18C73E7D8;
  if (!qword_18C73E7D8)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C73E7E0);
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x1896178B0], v1);
    atomic_store(result, (unint64_t *)&qword_18C73E7D8);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895D2680](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_188B49C14()
{
  return type metadata accessor for SCDataBase();
}

uint64_t sub_188B49C1C()
{
  uint64_t result = sub_188B58A40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t method lookup function for SCDataBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SCDataBase.slots.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x60LL))();
}

uint64_t dispatch thunk of SCDataBase.slots.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x68LL))();
}

uint64_t dispatch thunk of SCDataBase.slots.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x70LL))();
}

uint64_t dispatch thunk of SCDataBase.__allocating_init(dbURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SCDataBase.slot(slotID:algorithm:recordType:salt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x88LL))();
}

{
  void *v0;
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x98LL))();
}

uint64_t dispatch thunk of SCDataBase.slot(slotID:algorithm:recordType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x90LL))();
}

void type metadata accessor for CFNumber(uint64_t a1)
{
}

void type metadata accessor for CFBoolean(uint64_t a1)
{
}

void sub_188B49DA8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_188B49DEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_188B49E34(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = sub_188B58AD0();
    uint64_t result = MEMORY[0x1895D268C](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188B49E74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

uint64_t SCEntry.data.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data);
  sub_188B49A88(v1, *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data + 8));
  return v1;
}

uint64_t sub_188B49F30(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata);
  swift_beginAccess();
  void *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_188B49F98()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_188B49FE0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_188B4A030())()
{
  return j__swift_endAccess;
}

id SCEntry.__allocating_init(data:metadata:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (char *)objc_allocWithZone(v4);
  uint64_t v9 = (uint64_t *)&v8[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data];
  uint64_t *v9 = a1;
  v9[1] = a2;
  uint64_t v10 = v8;
  sub_188B49A88(a1, a2);
  if (!a3) {
    a3 = sub_188B4A1F8(MEMORY[0x18961AFE8]);
  }
  *(void *)&v8[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata] = a3;

  v13.receiver = v8;
  v13.super_class = v4;
  id v11 = objc_msgSendSuper2(&v13, sel_init);
  sub_188B49964(a1, a2);
  return v11;
}

id SCEntry.init(data:metadata:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = (uint64_t *)&v3[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data];
  *uint64_t v6 = a1;
  v6[1] = a2;
  if (a3)
  {
    unint64_t v7 = a3;
    uint64_t v8 = v3;
    sub_188B49A88(a1, a2);
  }

  else
  {
    uint64_t v9 = v3;
    sub_188B49A88(a1, a2);
    unint64_t v7 = sub_188B4A1F8(MEMORY[0x18961AFE8]);
  }

  *(void *)&v3[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata] = v7;

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for SCEntry();
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_188B49964(a1, a2);
  return v10;
}

unint64_t sub_188B4A1F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8B0);
  uint64_t v2 = (void *)sub_188B58DA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_188B49A88(v7, v8);
    unint64_t result = sub_188B47AE8(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    objc_super v12 = (uint64_t *)(v2[7] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SCEntry()
{
  return objc_opt_self();
}

unint64_t sub_188B4A33C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8A0);
  uint64_t v2 = (void *)sub_188B58DA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_188B47AE8(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    objc_super v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

os_log_s *sub_188B4A578()
{
  v16[4] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v0 = sub_188B58AF4();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v16[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = (void *)objc_opt_self();
  uint64_t v5 = (void *)sub_188B58A70();
  v16[0] = 0LL;
  id v6 = objc_msgSend(v4, sel_JSONObjectWithData_options_error_, v5, 0, v16);

  if (v6)
  {
    id v7 = v16[0];
    sub_188B58CF8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8A8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      uint64_t v8 = (os_log_s *)sub_188B4AFB4(v15);
      swift_bridgeObjectRelease();
      return v8;
    }
  }

  else
  {
    id v9 = v16[0];
    uint64_t v10 = sub_188B589BC();

    swift_willThrow();
    MEMORY[0x1895D262C](v10);
  }

  sub_188B58EE4();
  sub_188B58AE8();
  uint64_t v8 = (os_log_s *)sub_188B58ADC();
  os_log_type_t v11 = sub_188B58CBC();
  if (os_log_type_enabled(v8, v11))
  {
    objc_super v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl(&dword_188B44000, v8, v11, "Could not deserialize metadata", v12, 2u);
    MEMORY[0x1895D26F8](v12, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_188B499A8();
  swift_allocError();
  _BYTE *v13 = 0;
  swift_willThrow();
  return v8;
}

uint64_t sub_188B4A7F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_188B49A88(a3, a4);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v9;
  uint64_t *v9 = 0x8000000000000000LL;
  sub_188B47F24(a3, a4, a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v9 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_188B4A9D8(uint64_t a1)
{
  v17[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = sub_188B58AF4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188B4B1F4(a1);
  id v6 = (void *)objc_opt_self();
  id v7 = (void *)sub_188B58B0C();
  swift_release();
  v17[0] = 0LL;
  id v8 = objc_msgSend(v6, sel_dataWithJSONObject_options_error_, v7, 0, v17);

  id v9 = v17[0];
  if (v8)
  {
    uint64_t v2 = sub_188B58A88();
  }

  else
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_188B589BC();

    swift_willThrow();
    sub_188B58EE4();
    sub_188B58AE8();
    uint64_t v12 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v13 = sub_188B58CBC();
    if (os_log_type_enabled(v12, v13))
    {
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v14 = 0;
      _os_log_impl(&dword_188B44000, v12, v13, "Could not serialize metadata", v14, 2u);
      MEMORY[0x1895D26F8](v14, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_188B499A8();
    swift_allocError();
    _BYTE *v15 = 1;
    swift_willThrow();
    MEMORY[0x1895D262C](v11);
  }

  return v2;
}

uint64_t sub_188B4AC2C()
{
  uint64_t v2 = sub_188B58A40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_188B58A94();
  if (!v1)
  {
    uint64_t v7 = v0 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata;
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)v7 + 16LL))
    {
      if (qword_18C73E7A0 != -1) {
        swift_once();
      }
      sub_188B58A10();
      type metadata accessor for SCEntry();
      uint64_t v8 = swift_bridgeObjectRetain();
      uint64_t v9 = sub_188B4A9D8(v8);
      unint64_t v11 = v10;
      swift_bridgeObjectRelease();
      sub_188B58A94();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return sub_188B49964(v9, v11);
    }
  }

  return result;
}

id SCEntry.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SCEntry.init()()
{
}

id SCEntry.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SCEntry();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_188B4AEAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for SCEntry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SCEntry.metadata.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x60LL))();
}

uint64_t dispatch thunk of SCEntry.metadata.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x68LL))();
}

uint64_t dispatch thunk of SCEntry.metadata.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x70LL))();
}

uint64_t dispatch thunk of SCEntry.__allocating_init(data:metadata:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SCEntry.setMetadata(key:data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x80LL))();
}

uint64_t dispatch thunk of SCEntry.write(entryURL:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x88LL))();
}

uint64_t sub_188B4AFB4(uint64_t a1)
{
  uint64_t result = sub_188B58D88();
  int64_t v3 = 0LL;
  uint64_t v35 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v5 = a1 + 64;
  uint64_t v4 = v6;
  uint64_t v7 = 1LL << *(_BYTE *)(v5 - 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & v4;
  uint64_t v31 = v5;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  unint64_t v33 = (void *)result;
  uint64_t v34 = result + 64;
  if ((v8 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  int64_t v11 = v3;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v15 << 6))
  {
    uint64_t v17 = 16 * i;
    uint64_t v18 = (uint64_t *)(*(void *)(v35 + 48) + 16 * i);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_188B58A64();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    if (v23 >> 60 == 15) {
      uint64_t v24 = 0LL;
    }
    else {
      uint64_t v24 = v21;
    }
    unint64_t v25 = 0xC000000000000000LL;
    if (v23 >> 60 != 15) {
      unint64_t v25 = v23;
    }
    uint64_t result = (uint64_t)v33;
    *(void *)(v34 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    uint64_t v26 = (void *)(v33[6] + v17);
    *uint64_t v26 = v19;
    v26[1] = v20;
    uint64_t v27 = (uint64_t *)(v33[7] + v17);
    *uint64_t v27 = v24;
    v27[1] = v25;
    uint64_t v28 = v33[2];
    BOOL v29 = __OFADD__(v28, 1LL);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }

    v33[2] = v30;
    int64_t v3 = v11;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v3 + 1;
    if (__OFADD__(v3, 1LL)) {
      goto LABEL_29;
    }
    if (v13 >= v32) {
      return result;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v15 = v3 + 1;
    if (!v14)
    {
      int64_t v15 = v3 + 2;
      if (v3 + 2 >= v32) {
        return result;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v3 + 3;
        if (v3 + 3 >= v32) {
          return result;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }

LABEL_30:
  __break(1u);
  return result;
}

        int64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }

      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      unint64_t v33 = *v31;
      int64_t v32 = v31[1];
      uint64_t v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_188B49A88(v37, *((unint64_t *)&v37 + 1));
      }

      sub_188B58E78();
      sub_188B58BE4();
      uint64_t result = sub_188B58E90();
      int64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
      uint64_t v16 = result & ~v15;
      uint64_t v17 = v16 >> 6;
      if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        uint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v26 = 0;
        uint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }

          uint64_t v28 = v17 == v27;
          if (v17 == v27) {
            uint64_t v17 = 0LL;
          }
          v26 |= v28;
          BOOL v29 = *(void *)(v12 + 8 * v17);
        }

        while (v29 == -1);
        uint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }

      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
      uint64_t v19 = 16 * v18;
      uint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *uint64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release();
  void *v3 = v8;
  return result;
}

        unint64_t v10 = (v23 - 1) & v23;
        uint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }

      BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      int64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      uint64_t v34 = *(void *)v32;
      unint64_t v33 = *(void *)(v32 + 8);
      uint64_t v35 = *(_BYTE *)(v32 + 16);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_188B4F958(v34, v33, v35);
      }

      sub_188B58E78();
      sub_188B58BE4();
      uint64_t result = sub_188B58E90();
      unint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
      int64_t v15 = result & ~v14;
      uint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        uint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        unint64_t v25 = 0;
        uint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }

          uint64_t v27 = v16 == v26;
          if (v16 == v26) {
            uint64_t v16 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }

        while (v28 == -1);
        uint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }

      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *uint64_t v18 = v30;
      v18[1] = v31;
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(void *)uint64_t v19 = v34;
      *(void *)(v19 + 8) = v33;
      *(_BYTE *)(v19 + 16) = v35;
      ++*(void *)(v7 + 16);
    }
  }

  uint64_t result = swift_release();
  void *v3 = v7;
  return result;
}

  uint64_t result = sub_188B58DAC();
  __break(1u);
  return result;
}

uint64_t sub_188B4B1F4(uint64_t a1)
{
  uint64_t result = sub_188B58D88();
  int64_t v3 = 0LL;
  int64_t v32 = (void *)result;
  uint64_t v33 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v5 = a1 + 64;
  uint64_t v4 = v6;
  uint64_t v7 = 1LL << *(_BYTE *)(v5 - 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & v4;
  int64_t v30 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v31 = result + 64;
  if ((v8 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  int64_t v34 = v3;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(v33 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = (uint64_t *)(*(void *)(v33 + 56) + 16 * i);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    swift_bridgeObjectRetain();
    sub_188B49A88(v20, v21);
    uint64_t v22 = sub_188B58A7C();
    uint64_t v24 = v23;
    sub_188B49964(v20, v21);
    uint64_t result = (uint64_t)v32;
    *(void *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    unint64_t v25 = (void *)(v32[6] + 16 * i);
    void *v25 = v17;
    v25[1] = v18;
    uint64_t v26 = (uint64_t *)(v32[7] + 16 * i);
    *uint64_t v26 = v22;
    v26[1] = v24;
    uint64_t v27 = v32[2];
    BOOL v28 = __OFADD__(v27, 1LL);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    v32[2] = v29;
    int64_t v3 = v34;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1LL)) {
      goto LABEL_24;
    }
    if (v12 >= v30) {
      return result;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    int64_t v14 = v3 + 1;
    if (!v13)
    {
      int64_t v14 = v3 + 2;
      if (v3 + 2 >= v30) {
        return result;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v3 + 3;
        if (v3 + 3 >= v30) {
          return result;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v14);
        if (!v13) {
          break;
        }
      }
    }

LABEL_25:
  __break(1u);
  return result;
}

    int64_t v14 = (v21 - 1) & v21;
    uint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    uint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void **)(*(void *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    uint64_t result = v19;
  }

  uint64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

    int64_t v12 = (v22 - 1) & v22;
    uint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_188B49A88(v24, *((unint64_t *)&v24 + 1));
  }

  uint64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  uint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    unint64_t v9 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

    int64_t v12 = (v28 - 1) & v28;
    uint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    unint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    unint64_t v25 = *(_BYTE *)(v21 + 16);
    *uint64_t v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v26 = v22;
    *(void *)(v26 + 8) = v23;
    *(_BYTE *)(v26 + 16) = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_188B4F958(v22, v23, v25);
  }

  uint64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  BOOL v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    unint64_t v9 = v29;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    BOOL v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

id sub_188B4B428(char *a1)
{
  uint64_t v3 = sub_188B58A40();
  uint64_t v71 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  v67 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v63 - v6;
  uint64_t v8 = sub_188B58AF4();
  uint64_t v69 = *(void *)(v8 - 8);
  v70 = (void *)v8;
  MEMORY[0x1895F8858](v8);
  unint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188B58AE8();
  if ((sub_188B589C8() & 1) == 0) {
    goto LABEL_11;
  }
  int64_t v11 = (void *)objc_opt_self();
  id v12 = objc_msgSend(v11, sel_defaultManager);
  sub_188B58A1C();
  uint64_t v13 = sub_188B58B54();
  uint64_t v68 = a1;
  int64_t v14 = (void *)v13;
  swift_bridgeObjectRelease();
  unsigned __int8 v15 = objc_msgSend(v12, sel_fileExistsAtPath_, v14);

  a1 = v68;
  if ((v15 & 1) == 0)
  {
LABEL_11:
    int64_t v34 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v35 = sub_188B58CBC();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = a1;
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_188B44000, v34, v35, "Entry URL doesn't exist", v37, 2u);
      uint64_t v38 = v37;
      a1 = v36;
      MEMORY[0x1895D26F8](v38, -1LL, -1LL);
    }

    sub_188B499A8();
    swift_allocError();
    *uint64_t v39 = 2;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v71 + 8))(a1, v3);
    goto LABEL_14;
  }

  uint64_t v66 = v3;
  id v16 = objc_msgSend(v11, sel_defaultManager);
  sub_188B58A1C();
  uint64_t v17 = a1;
  uint64_t v18 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_contentsAtPath_, v18);

  if (!v19)
  {

    uint64_t v43 = v71;
    uint64_t v44 = v66;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v7, v17, v66);
    __int128 v45 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v46 = sub_188B58CBC();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      uint64_t v74 = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v49 = sub_188B58A1C();
      uint64_t v73 = sub_188B55A58(v49, v50, &v74);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      uint64_t v51 = *(void (**)(char *, uint64_t))(v71 + 8);
      v51(v7, v66);
      _os_log_impl(&dword_188B44000, v45, v46, "Failed to read contents of %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v48, -1LL, -1LL);
      uint64_t v44 = v66;
      MEMORY[0x1895D26F8](v47, -1LL, -1LL);
    }

    else
    {

      uint64_t v51 = *(void (**)(char *, uint64_t))(v43 + 8);
      v51(v7, v44);
    }

    uint64_t v41 = v69;
    id v40 = v70;
    sub_188B499A8();
    swift_allocError();
    _BYTE *v52 = 3;
    swift_willThrow();
    v51(v68, v44);
    goto LABEL_15;
  }

  uint64_t v64 = sub_188B58A88();
  unint64_t v65 = v20;

  uint64_t v21 = v66;
  if (qword_18C73E7A0 != -1) {
    swift_once();
  }
  sub_188B58A10();
  if ((sub_188B589C8() & 1) == 0) {
    goto LABEL_22;
  }
  id v22 = objc_msgSend(v11, sel_defaultManager);
  sub_188B58A1C();
  uint64_t v23 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  unsigned int v24 = objc_msgSend(v22, sel_fileExistsAtPath_, v23);

  if (!v24) {
    goto LABEL_22;
  }
  id v25 = objc_msgSend(v11, sel_defaultManager);
  sub_188B58A1C();
  uint64_t v26 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v25, (SEL)&SCEntry.base_meths, v26);

  if (!v27)
  {

    uint64_t v21 = v66;
LABEL_22:
    uint64_t v53 = (char *)objc_allocWithZone((Class)type metadata accessor for SCEntry());
    uint64_t v54 = &v53[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data];
    uint64_t v56 = v64;
    unint64_t v55 = v65;
    *(void *)uint64_t v54 = v64;
    *((void *)v54 + 1) = v55;
    sub_188B49A88(v56, v55);
    v57 = v53;
    unint64_t v58 = sub_188B4A1F8(MEMORY[0x18961AFE8]);
LABEL_23:
    *(void *)&v57[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata] = v58;

    unint64_t v59 = (objc_class *)type metadata accessor for SCEntry();
    v72.receiver = v57;
    v72.super_class = v59;
    id v40 = objc_msgSendSuper2(&v72, sel_init);
    sub_188B49964(v56, v55);
    uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v60((uint64_t)v68, v21);
    v60((uint64_t)v67, v21);
    (*(void (**)(char *, void *))(v69 + 8))(v10, v70);
    return v40;
  }

  uint64_t v28 = sub_188B58A88();
  unint64_t v30 = v29;

  uint64_t v31 = (objc_class *)type metadata accessor for SCEntry();
  int64_t v32 = sub_188B4A578();
  uint64_t v21 = v66;
  if (!v1)
  {
    unint64_t v58 = (unint64_t)v32;
    sub_188B49964(v28, v30);
    BOOL v61 = (char *)objc_allocWithZone(v31);
    uint64_t v62 = &v61[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data];
    uint64_t v56 = v64;
    unint64_t v55 = v65;
    *(void *)uint64_t v62 = v64;
    *((void *)v62 + 1) = v55;
    v57 = v61;
    sub_188B49A88(v56, v55);
    goto LABEL_23;
  }

  sub_188B49964(v28, v30);
  sub_188B49964(v64, v65);
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
  v33((uint64_t)v68, v21);
  v33((uint64_t)v67, v21);
LABEL_14:
  uint64_t v41 = v69;
  id v40 = v70;
LABEL_15:
  (*(void (**)(char *, id))(v41 + 8))(v10, v40);
  return v40;
}

SecureConfigDB::SecureConfigParameters::Keys_optional __swiftcall SecureConfigParameters.Keys.init(rawValue:)( Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_188B58DD0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static SecureConfigParameters.Keys.allCases.getter()
{
  return &unk_18A2D4948;
}

uint64_t SecureConfigParameters.Keys.rawValue.getter()
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_188B4BBB4 + 4 * byte_188B595B0[*v0]))( 0xD00000000000001CLL,  0x8000000188B59EF0LL);
}

unint64_t sub_188B4BBB4()
{
  return 0xD00000000000002ALL;
}

void sub_188B4BC0C()
{
}

void sub_188B4BC24(char *a1)
{
}

void sub_188B4BC30(char a1)
{
  __asm { BR              X12 }

uint64_t sub_188B4BC80(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_188B4BD0C + 4 * byte_188B595BE[a2]))(0xD00000000000002ALL);
}

uint64_t sub_188B4BD0C(uint64_t a1)
{
  if (a1 == 0xD00000000000002ALL && v1 == 0x8000000188B59F10LL) {
    char v2 = 1;
  }
  else {
    char v2 = sub_188B58E18();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_188B4BDD4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x7974697275636573LL;
  }
  else {
    uint64_t v3 = 0x6574656D61726170LL;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000007372LL;
  }
  else {
    unint64_t v4 = 0xEE007963696C6F50LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x7974697275636573LL;
  }
  else {
    uint64_t v5 = 0x6574656D61726170LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xEE007963696C6F50LL;
  }
  else {
    unint64_t v6 = 0xEA00000000007372LL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_188B58E18();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_188B4BE84()
{
}

uint64_t sub_188B4BE90()
{
  return sub_188B58E90();
}

void sub_188B4BF20(uint64_t a1)
{
}

void sub_188B4BF28(uint64_t a1, char a2)
{
  __asm { BR              X11 }

uint64_t sub_188B4BF70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_188B4BFF4()
{
  return swift_bridgeObjectRelease();
}

void sub_188B4C05C(uint64_t a1)
{
}

uint64_t sub_188B4C064()
{
  return sub_188B58E90();
}

void sub_188B4C0F0(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_188B4C148()
{
  return sub_188B58E90();
}

SecureConfigDB::SecureConfigParameters::Keys_optional sub_188B4C1E4(Swift::String *a1)
{
  return SecureConfigParameters.Keys.init(rawValue:)(*a1);
}

uint64_t sub_188B4C1F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SecureConfigParameters.Keys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_188B4C214(void *a1@<X8>)
{
  *a1 = &unk_18A2D4948;
}

uint64_t SecureConfigParameters.securityPolicy.getter()
{
  return *(void *)(v0 + OBJC_IVAR____SecureConfigParameters_securityPolicy);
}

uint64_t SecureConfigParameters.logPolicyPath.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SecureConfigParameters_logPolicyPath);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SecureConfigParameters.metricsFilteringEnforced.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_metricsFilteringEnforced);
}

uint64_t SecureConfigParameters.logFilteringEnforced.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_logFilteringEnforced);
}

uint64_t SecureConfigParameters.crashRedactionEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_crashRedactionEnabled);
}

uint64_t SecureConfigParameters.internalRequestOptionsAllowed.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_internalRequestOptionsAllowed);
}

uint64_t SecureConfigParameters.tie_allowNonProdExceptionOptions.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_tie_allowNonProdExceptionOptions);
}

uint64_t SecureConfigParameters.research_disableAppleInfrastrucutureEnforcement.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____SecureConfigParameters_research_disableAppleInfrastrucutureEnforcement);
}

uint64_t sub_188B4C370()
{
  if (*(_BYTE *)(v0 + OBJC_IVAR____SecureConfigParameters_research_disableAppleInfrastrucutureEnforcement) == 2) {
    return 0LL;
  }
  else {
    return sub_188B58C8C();
  }
}

uint64_t sub_188B4C3A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_188B4FC28(a1, a2, *(void *)(v4 + OBJC_IVAR____SecureConfigParameters_parameters), a3, a4);
}

uint64_t sub_188B4C3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0LL;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_188B47AE8(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  uint64_t v8 = *(void *)(a3 + 56) + 24 * v6;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(_BYTE *)(v8 + 16);
  sub_188B4F958(*(void *)v8, v10, v11);
  swift_bridgeObjectRelease();
  sub_188B50074(v9, v10, v11);
  sub_188B4F980(v9, v10, v11);
  sub_188B4F9A8((uint64_t)v19, (uint64_t)v18);
  uint64_t v12 = MEMORY[0x189617FA8];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return v17;
  }

  else
  {
    uint64_t v14 = sub_188B58D40();
    swift_allocError();
    id v16 = v15;
    void *v15 = v12;
    v18[0] = 0LL;
    v18[1] = 0xE000000000000000LL;
    sub_188B58D1C();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58D58();
    sub_188B58BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58D34();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104LL))( v16,  *MEMORY[0x189619358],  v14);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  }

uint64_t sub_188B4C624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (!*(void *)(a3 + 16)) {
    return 0LL;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_188B47AE8(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  uint64_t v10 = *(void *)(a3 + 56) + 24 * v8;
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(void *)(v10 + 8);
  char v13 = *(_BYTE *)(v10 + 16);
  sub_188B4F958(*(void *)v10, v12, v13);
  swift_bridgeObjectRelease();
  sub_188B50074(v11, v12, v13);
  sub_188B4F980(v11, v12, v13);
  sub_188B4F9A8((uint64_t)v20, (uint64_t)v19);
  uint64_t v14 = a4(0LL);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
    return v21;
  }

  else
  {
    uint64_t v16 = sub_188B58D40();
    swift_allocError();
    uint64_t v18 = v17;
    *uint64_t v17 = v14;
    v19[0] = 0LL;
    v19[1] = 0xE000000000000000LL;
    sub_188B58D1C();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58D58();
    sub_188B58BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58D34();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104LL))( v18,  *MEMORY[0x189619358],  v16);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  }

uint64_t sub_188B4C888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 2LL;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_188B47AE8(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  uint64_t v8 = *(void *)(a3 + 56) + 24 * v6;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(_BYTE *)(v8 + 16);
  sub_188B4F958(*(void *)v8, v10, v11);
  swift_bridgeObjectRelease();
  sub_188B50074(v9, v10, v11);
  sub_188B4F980(v9, v10, v11);
  sub_188B4F9A8((uint64_t)v18, (uint64_t)v17);
  uint64_t v12 = MEMORY[0x1896184C8];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
    return v18[47];
  }

  else
  {
    uint64_t v14 = sub_188B58D40();
    swift_allocError();
    uint64_t v16 = v15;
    void *v15 = v12;
    v17[0] = 0LL;
    v17[1] = 0xE000000000000000LL;
    sub_188B58D1C();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58D58();
    sub_188B58BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58D34();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104LL))( v16,  *MEMORY[0x189619358],  v14);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }

uint64_t sub_188B4CAD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_188B4C3CC(a1, a2, *(void *)(v2 + OBJC_IVAR____SecureConfigParameters_parameters));
  if (!v3 && !v5)
  {
    uint64_t v6 = sub_188B58D40();
    swift_allocError();
    uint64_t v8 = v7;
    *char v7 = MEMORY[0x189617FA8];
    sub_188B58D1C();
    swift_bridgeObjectRelease();
    sub_188B58BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58D34();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v6 - 8) + 104LL))( v8,  *MEMORY[0x189619368],  v6);
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_188B4CD00(uint64_t a1, uint64_t a2)
{
  return sub_188B4CD7C(a1, a2, (uint64_t (*)(void))type metadata accessor for CFBoolean);
}

uint64_t sub_188B4CD44(uint64_t a1, uint64_t a2)
{
  return sub_188B4CD7C(a1, a2, (uint64_t (*)(void))type metadata accessor for CFNumber);
}

uint64_t sub_188B4CD7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = sub_188B4C624(a1, a2, *(void *)(v3 + OBJC_IVAR____SecureConfigParameters_parameters), a3);
  if (!v4 && !result)
  {
    uint64_t v7 = sub_188B58D40();
    swift_allocError();
    uint64_t v9 = v8;
    *uint64_t v8 = a3(0LL);
    sub_188B58D1C();
    swift_bridgeObjectRelease();
    sub_188B58BF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58D34();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104LL))( v9,  *MEMORY[0x189619368],  v7);
    return swift_willThrow();
  }

  return result;
}

id sub_188B4CEF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = sub_188B58B60();
  uint64_t v9 = v8;
  id v10 = a1;
  char v11 = (void *)a5(v7, v9);
  swift_bridgeObjectRelease();

  return v11;
}

uint64_t static SecureConfigParameters.loadContents()()
{
  uint64_t v1 = sub_188B58A40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_188B4D0FC();
  if (!v0)
  {
    uint64_t v6 = sub_188B58A4C();
    unint64_t v8 = v7;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_188B58920();
    swift_allocObject();
    sub_188B58914();
    type metadata accessor for SecureConfigParameters();
    sub_188B4EF48( &qword_18C73E908,  v9,  (uint64_t (*)(uint64_t))type metadata accessor for SecureConfigParameters,  (uint64_t)&protocol conformance descriptor for SecureConfigParameters);
    sub_188B58908();
    sub_188B49964(v6, v8);
    swift_release();
    return v10[1];
  }

  return result;
}

uint64_t sub_188B4D0FC()
{
  uint64_t v1 = sub_188B589D4();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_188B58A40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_188B4E4A8();
  if (!v0)
  {
    v10[0] = 0x6574656D61726170LL;
    v10[1] = 0xEF6E6F736A2E7372LL;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x189606998], v1);
    sub_188B4FA04();
    sub_188B58A34();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return result;
}

uint64_t type metadata accessor for SecureConfigParameters()
{
  return objc_opt_self();
}

uint64_t sub_188B4D2E8(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x7974697275636573LL;
  }
  else {
    return 0x6574656D61726170LL;
  }
}

uint64_t sub_188B4D330(char *a1, char *a2)
{
  return sub_188B4BDD4(*a1, *a2);
}

uint64_t sub_188B4D33C()
{
  return sub_188B4BE90();
}

uint64_t sub_188B4D344()
{
  return sub_188B4BFF4();
}

uint64_t sub_188B4D34C()
{
  return sub_188B4C064();
}

uint64_t sub_188B4D354@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_188B58DD0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_188B4D3B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_188B4D2E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_188B4D3D8()
{
  return sub_188B4D2E8(*v0);
}

uint64_t sub_188B4D3E0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_188B58DD0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_188B4D440()
{
  return 0LL;
}

void sub_188B4D44C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_188B4D458()
{
  return sub_188B58ECC();
}

uint64_t sub_188B4D480()
{
  return sub_188B58ED8();
}

id sub_188B4D4A8(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____SecureConfigParameters_parameters] = a1;
  *(void *)&v2[OBJC_IVAR____SecureConfigParameters_securityPolicy] = a2;
  uint64_t v5 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_188B4C3CC(0xD00000000000001CLL, 0x8000000188B59EF0LL, a1);
  if (v3)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for SecureConfigParameters();
    return (id)swift_deallocPartialClassInstance();
  }

  else
  {
    unint64_t v8 = (uint64_t *)&v5[OBJC_IVAR____SecureConfigParameters_logPolicyPath];
    *unint64_t v8 = v6;
    v8[1] = v7;
    v5[OBJC_IVAR____SecureConfigParameters_metricsFilteringEnforced] = sub_188B4C888( 0xD00000000000002ALL,  0x8000000188B59F10LL,  a1);
    v5[OBJC_IVAR____SecureConfigParameters_logFilteringEnforced] = sub_188B4C888( 0xD000000000000026LL,  0x8000000188B59F40LL,  a1);
    v5[OBJC_IVAR____SecureConfigParameters_crashRedactionEnabled] = sub_188B4C888( 0xD000000000000027LL,  0x8000000188B59F70LL,  a1);
    v5[OBJC_IVAR____SecureConfigParameters_internalRequestOptionsAllowed] = sub_188B4C888( 0xD00000000000002BLL,  0x8000000188B59FA0LL,  a1);
    v5[OBJC_IVAR____SecureConfigParameters_tie_allowNonProdExceptionOptions] = sub_188B4C888( 0xD00000000000002ALL,  0x8000000188B59FD0LL,  a1);
    char v9 = sub_188B4C888(0xD00000000000003DLL, 0x8000000188B5A000LL, a1);
    swift_bridgeObjectRelease();
    v5[OBJC_IVAR____SecureConfigParameters_research_disableAppleInfrastrucutureEnforcement] = v9;

    v11.receiver = v5;
    v11.super_class = (Class)type metadata accessor for SecureConfigParameters();
    return objc_msgSendSuper2(&v11, sel_init);
  }

id SecureConfigParameters.__allocating_init(from:)(void *a1)
{
  return sub_188B4EC94(a1);
}

uint64_t sub_188B4D710(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E910);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188B4EE7C();
  sub_188B58EC0();
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____SecureConfigParameters_parameters);
  HIBYTE(v10) = 0;
  sub_188B4EEC0();
  sub_188B58DF4();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____SecureConfigParameters_securityPolicy);
    HIBYTE(v10) = 1;
    sub_188B4EF04();
    sub_188B58DF4();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_188B4D8B8()
{
  uint64_t v0 = sub_188B58950();
  uint64_t v1 = (uint64_t (*)(uint64_t))MEMORY[0x189606058];
  MEMORY[0x1895F8858](v0);
  sub_188B58980();
  swift_allocObject();
  sub_188B58974();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E930);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_188B59A90;
  sub_188B5892C();
  sub_188B58944();
  sub_188B58938();
  sub_188B4EF48((unint64_t *)&qword_18C73E938, 255LL, v1, MEMORY[0x189606070]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E940);
  sub_188B4F3E8((unint64_t *)&qword_18C73E948, &qword_18C73E940, MEMORY[0x189618470]);
  sub_188B58D04();
  sub_188B5895C();
  type metadata accessor for SecureConfigParameters();
  sub_188B4EF48( &qword_18C73E950,  v2,  (uint64_t (*)(uint64_t))type metadata accessor for SecureConfigParameters,  (uint64_t)&protocol conformance descriptor for SecureConfigParameters);
  sub_188B58968();
  __asm { BR              X10 }

id SecureConfigParameters.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SecureConfigParameters.init()()
{
}

id SecureConfigParameters.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureConfigParameters();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_188B4DEB4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = sub_188B4EC94(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_188B4DEDC(void *a1)
{
  return sub_188B4D710(a1);
}

uint64_t SecureConfigSecurityPolicy.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  return sub_188B4EFE0(a1, a2);
}

void *static SecureConfigSecurityPolicy.allCases.getter()
{
  return &unk_18A2D49F8;
}

unint64_t SecureConfigSecurityPolicy.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0LL;
  }
  return result;
}

BOOL sub_188B4DF30(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_188B4DF44()
{
  return sub_188B58E90();
}

uint64_t sub_188B4DF88()
{
  return sub_188B58E84();
}

uint64_t sub_188B4DFB0()
{
  return sub_188B58E90();
}

uint64_t *sub_188B4DFF0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_188B4E00C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_188B4E018()
{
  return sub_188B58C2C();
}

uint64_t sub_188B4E074()
{
  return sub_188B58C20();
}

void sub_188B4E0C0(void *a1@<X8>)
{
  *a1 = &unk_18A2D4A30;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SecureConfigParameters.write()()
{
  uint64_t v1 = v0;
  v32[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_188B58A40();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  uint64_t v3 = MEMORY[0x1895F8858](v2);
  unint64_t v30 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v26 - v5;
  uint64_t v7 = sub_188B58950();
  unint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x189606058];
  MEMORY[0x1895F8858](v7);
  sub_188B58980();
  swift_allocObject();
  uint64_t v9 = sub_188B58974();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E930);
  uint64_t v10 = (_OWORD *)swift_allocObject();
  v10[1] = xmmword_188B59AA0;
  sub_188B5892C();
  sub_188B58944();
  v32[0] = v10;
  sub_188B4EF48((unint64_t *)&qword_18C73E938, 255LL, v8, MEMORY[0x189606070]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E940);
  sub_188B4F3E8((unint64_t *)&qword_18C73E948, &qword_18C73E940, MEMORY[0x189618470]);
  sub_188B58D04();
  sub_188B5895C();
  v32[0] = v1;
  type metadata accessor for SecureConfigParameters();
  sub_188B4EF48( &qword_18C73E950,  v11,  (uint64_t (*)(uint64_t))type metadata accessor for SecureConfigParameters,  (uint64_t)&protocol conformance descriptor for SecureConfigParameters);
  uint64_t v12 = v31;
  uint64_t v13 = sub_188B58968();
  if (v12)
  {
    swift_release();
  }

  else
  {
    uint64_t v15 = v13;
    unint64_t v16 = v14;
    sub_188B4E4A8();
    uint64_t v17 = v6;
    uint64_t v31 = v9;
    id v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    id v19 = (void *)sub_188B589F8();
    v32[0] = 0LL;
    unsigned int v20 = objc_msgSend( v18,  sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_,  v19,  1,  0,  v32);

    if (v20)
    {
      id v21 = v32[0];
      sub_188B4D0FC();
      sub_188B58A94();
      uint64_t v24 = v27;
      uint64_t v23 = v28;

      sub_188B49964(v15, v16);
      swift_release();
      id v25 = *(void (**)(char *, uint64_t))(v24 + 8);
      v25(v30, v23);
      v25(v17, v23);
    }

    else
    {
      id v22 = v32[0];
      sub_188B589BC();

      swift_willThrow();
      sub_188B49964(v15, v16);
      swift_release();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
    }
  }

uint64_t sub_188B4E4A8()
{
  uint64_t v1 = sub_188B589D4();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_188B58A40();
  uint64_t v15 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_188B4EAFC();
  if (!v0)
  {
    uint64_t v10 = result;
    uint64_t v11 = v9;
    sub_188B589E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E9F0);
    uint64_t v12 = swift_allocObject();
    uint64_t v14 = v5;
    *(_OWORD *)(v12 + 16) = xmmword_188B59AA0;
    *(void *)(v12 + 32) = v10;
    *(void *)(v12 + 40) = v11;
    *(void *)(v12 + 48) = 0x6C75617661746164LL;
    *(void *)(v12 + 56) = 0xE900000000000074LL;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x189606998], v1);
    sub_188B4FA04();
    sub_188B58A28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }

  return result;
}

id static SecureConfigParameters.decode(parametersJson:securityPolicy:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = (id)sub_188B4EFE0(a3, a4);
  if (!v4)
  {
    uint64_t v8 = (uint64_t)result;
    sub_188B58920();
    swift_allocObject();
    sub_188B58914();
    sub_188B4F2BC();
    sub_188B58908();
    swift_release();
    id v9 = objc_allocWithZone((Class)type metadata accessor for SecureConfigParameters());
    return sub_188B4D4A8(v10, v8);
  }

  return result;
}

uint64_t sub_188B4E748()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_188B4E774(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_188B58BCC();
  swift_release();
  return v4;
}

uint64_t sub_188B4E7E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_188B58BCC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_188B4E820( uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_188B4E86C( uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_188B5898C();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_188B589A4();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v9 += a1 - result;
  }

  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v12 = sub_188B58998();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t result = (uint64_t)sub_188B4E820(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void sub_188B4E918(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_188B58AA0();
  MEMORY[0x1895F8858](v3);
  __asm { BR              X10 }

void *sub_188B4E994()
{
  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA10);
    uint64_t v4 = (void *)swift_allocObject();
    size_t v6 = _swift_stdlib_malloc_size(v4);
    _OWORD v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_188B49A88(v2, v0);
    uint64_t v7 = sub_188B58A58();
    sub_188B49964(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x188B4EA68LL);
    }
  }

  return v4;
}

uint64_t sub_188B4EA80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_188B58BCC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_188B4EAB4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    int v3 = *(unsigned __int8 *)(result + 32);
    result += 32LL;
    if (!v3) {
      return sub_188B58BCC();
    }
    uint64_t v4 = 0LL;
    uint64_t v5 = v1 - 1;
    uint64_t v6 = v2 + 33;
    while (v5 != v4)
    {
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_188B4EAFC()
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  if (!sysctlbyname("kern.bootsessionuuid", 0LL, v6, 0LL, 0LL))
  {
    uint64_t v0 = sub_188B465B4(0, v6[0]);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v0 = (uint64_t)sub_188B479F0(0LL, *(void *)(v0 + 16), 0, (char *)v0);
    }
    if (!sysctlbyname("kern.bootsessionuuid", (void *)(v0 + 32), v6, 0LL, 0LL))
    {
      uint64_t v2 = sub_188B4EAB4(v0);
      swift_bridgeObjectRelease();
      return v2;
    }

    swift_bridgeObjectRelease();
  }

  sub_188B58D1C();
  uint64_t v1 = sub_188B58BF0();
  uint64_t v5 = MEMORY[0x1895D1F78](v1);
  sub_188B58E0C();
  sub_188B58BF0();
  swift_bridgeObjectRelease();
  uint64_t v2 = HIDWORD(v5);
  sub_188B4FA48();
  swift_allocError();
  void *v3 = HIDWORD(v5);
  v3[1] = 0xE000000000000000LL;
  swift_willThrow();
  return v2;
}

id sub_188B4EC94(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA18);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188B4EE7C();
  sub_188B58EA8();
  HIBYTE(v11) = 0;
  sub_188B4F2BC();
  sub_188B58DDC();
  uint64_t v6 = v12;
  HIBYTE(v11) = 1;
  sub_188B4FA8C();
  sub_188B58DDC();
  uint64_t v7 = v12;
  id v8 = objc_allocWithZone((Class)type metadata accessor for SecureConfigParameters());
  id v9 = sub_188B4D4A8(v6, v7);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v9;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_188B4EE7C()
{
  unint64_t result = qword_18C73E918;
  if (!qword_18C73E918)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B599B8, &type metadata for SecureConfigParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C73E918);
  }

  return result;
}

unint64_t sub_188B4EEC0()
{
  unint64_t result = qword_18C73E920;
  if (!qword_18C73E920)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59B24, &type metadata for SecureConfigRawParameters);
    atomic_store(result, (unint64_t *)&qword_18C73E920);
  }

  return result;
}

unint64_t sub_188B4EF04()
{
  unint64_t result = qword_18C73E928;
  if (!qword_18C73E928)
  {
    unint64_t result = MEMORY[0x1895D268C]( &protocol conformance descriptor for SecureConfigSecurityPolicy,  &type metadata for SecureConfigSecurityPolicy);
    atomic_store(result, (unint64_t *)&qword_18C73E928);
  }

  return result;
}

uint64_t sub_188B4EF48(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = MEMORY[0x1895D268C](a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188B4EF88(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E968);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_188B4EFC8(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_188B4EFE0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = 1LL;
    if (a1 == 0x72656D6F74737563LL && a2 == 0xE800000000000000LL) {
      goto LABEL_8;
    }
    char v5 = sub_188B58E18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
    {
LABEL_12:
      swift_bridgeObjectRelease();
      return v4;
    }

    uint64_t v4 = 2LL;
    if (a2)
    {
      if (a1 == 0x7972726163LL && a2 == 0xE500000000000000LL)
      {
LABEL_8:
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }

      char v6 = sub_188B58E18();
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0) {
        goto LABEL_12;
      }
    }

    else
    {
      swift_bridgeObjectRelease();
    }

    sub_188B58D1C();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA08);
    sub_188B58BB4();
    sub_188B58BF0();
    swift_bridgeObjectRelease();
    sub_188B4FA48();
    swift_allocError();
    *uint64_t v7 = 0xD000000000000024LL;
    v7[1] = 0x8000000188B5A640LL;
    swift_willThrow();
    return v4;
  }

  return 0LL;
}

unint64_t sub_188B4F2BC()
{
  unint64_t result = qword_18C73E970;
  if (!qword_18C73E970)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59AFC, &type metadata for SecureConfigRawParameters);
    atomic_store(result, (unint64_t *)&qword_18C73E970);
  }

  return result;
}

unint64_t sub_188B4F304()
{
  unint64_t result = qword_18C73E978;
  if (!qword_18C73E978)
  {
    unint64_t result = MEMORY[0x1895D268C]( &protocol conformance descriptor for SecureConfigParameters.Keys,  &type metadata for SecureConfigParameters.Keys);
    atomic_store(result, (unint64_t *)&qword_18C73E978);
  }

  return result;
}

uint64_t sub_188B4F348()
{
  return sub_188B4F3E8(&qword_18C73E980, &qword_18C73E988, MEMORY[0x189618488]);
}

unint64_t sub_188B4F378()
{
  unint64_t result = qword_18C73E990;
  if (!qword_18C73E990)
  {
    unint64_t result = MEMORY[0x1895D268C]( &protocol conformance descriptor for SecureConfigSecurityPolicy,  &type metadata for SecureConfigSecurityPolicy);
    atomic_store(result, (unint64_t *)&qword_18C73E990);
  }

  return result;
}

uint64_t sub_188B4F3BC()
{
  return sub_188B4F3E8(&qword_18C73E998, &qword_18C73E9A0, MEMORY[0x189618488]);
}

uint64_t sub_188B4F3E8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895D268C](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t method lookup function for SecureConfigParameters()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SecureConfigParameters.cf_research_disableAppleInfrastructureEnforcement.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x98LL))();
}

uint64_t dispatch thunk of SecureConfigParameters.unvalidatedParameter<A>(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xA0LL))();
}

uint64_t dispatch thunk of SecureConfigParameters.unvalidatedStringParameter(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xA8LL))();
}

uint64_t dispatch thunk of SecureConfigParameters.unvalidatedBooleanParameter(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xB0LL))();
}

uint64_t dispatch thunk of SecureConfigParameters.unvalidatedNumberParameter(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xB8LL))();
}

uint64_t dispatch thunk of SecureConfigParameters.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of SecureConfigParameters.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xD0LL))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SecureConfigParameters.Keys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SecureConfigParameters.Keys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_188B4F630 + 4 * byte_188B595D8[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_188B4F664 + 4 * byte_188B595D3[v4]))();
}

uint64_t sub_188B4F664(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B4F66C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188B4F674LL);
  }
  return result;
}

uint64_t sub_188B4F680(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188B4F688LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_188B4F68C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B4F694(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B4F6A0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_188B4F6AC(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecureConfigParameters.Keys()
{
  return &type metadata for SecureConfigParameters.Keys;
}

ValueMetadata *type metadata accessor for SecureConfigSecurityPolicy()
{
  return &type metadata for SecureConfigSecurityPolicy;
}

uint64_t getEnumTagSinglePayload for SecureConfigParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for SecureConfigParameters.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_188B4F7B0 + 4 * byte_188B595E2[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_188B4F7E4 + 4 * byte_188B595DD[v4]))();
}

uint64_t sub_188B4F7E4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B4F7EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188B4F7F4LL);
  }
  return result;
}

uint64_t sub_188B4F800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188B4F808LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_188B4F80C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B4F814(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_188B4F820(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SecureConfigParameters.CodingKeys()
{
  return &type metadata for SecureConfigParameters.CodingKeys;
}

unint64_t sub_188B4F840()
{
  unint64_t result = qword_18C73E9D0;
  if (!qword_18C73E9D0)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59990, &type metadata for SecureConfigParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C73E9D0);
  }

  return result;
}

unint64_t sub_188B4F888()
{
  unint64_t result = qword_18C73E9D8;
  if (!qword_18C73E9D8)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B598C8, &type metadata for SecureConfigParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C73E9D8);
  }

  return result;
}

unint64_t sub_188B4F8D0()
{
  unint64_t result = qword_18C73E9E0;
  if (!qword_18C73E9E0)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B598F0, &type metadata for SecureConfigParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C73E9E0);
  }

  return result;
}

unint64_t sub_188B4F914()
{
  unint64_t result = qword_18C73E9E8;
  if (!qword_18C73E9E8)
  {
    unint64_t result = MEMORY[0x1895D268C]( &protocol conformance descriptor for SecureConfigSecurityPolicy,  &type metadata for SecureConfigSecurityPolicy);
    atomic_store(result, (unint64_t *)&qword_18C73E9E8);
  }

  return result;
}

uint64_t sub_188B4F958(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3 || a3 == 4 || a3 == 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_188B4F980(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3 || a3 == 4 || a3 == 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_188B4F9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_188B4FA04()
{
  unint64_t result = qword_18C73E9F8;
  if (!qword_18C73E9F8)
  {
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189617FF0], MEMORY[0x189617FA8]);
    atomic_store(result, (unint64_t *)&qword_18C73E9F8);
  }

  return result;
}

unint64_t sub_188B4FA48()
{
  unint64_t result = qword_18C73EA00;
  if (!qword_18C73EA00)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59A40, &type metadata for RuntimeError);
    atomic_store(result, (unint64_t *)&qword_18C73EA00);
  }

  return result;
}

unint64_t sub_188B4FA8C()
{
  unint64_t result = qword_18C73EA20;
  if (!qword_18C73EA20)
  {
    unint64_t result = MEMORY[0x1895D268C]( &protocol conformance descriptor for SecureConfigSecurityPolicy,  &type metadata for SecureConfigSecurityPolicy);
    atomic_store(result, (unint64_t *)&qword_18C73EA20);
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for RuntimeError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RuntimeError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RuntimeError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RuntimeError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RuntimeError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RuntimeError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for RuntimeError()
{
  return &type metadata for RuntimeError;
}

ValueMetadata *type metadata accessor for SecureConfigRawParameters()
{
  return &type metadata for SecureConfigRawParameters;
}

uint64_t sub_188B4FC28@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = sub_188B58CD4();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)v28 - v13;
  if (!*(void *)(a3 + 16)) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56LL))( a5,  1LL,  1LL,  a4);
  }
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_188B47AE8(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56LL))( a5,  1LL,  1LL,  a4);
  }

  v28[1] = a1;
  uint64_t v31 = v5;
  uint64_t v17 = *(void *)(a3 + 56) + 24 * v15;
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *(void *)(v17 + 8);
  char v20 = *(_BYTE *)(v17 + 16);
  sub_188B4F958(*(void *)v17, v19, v20);
  swift_bridgeObjectRelease();
  sub_188B50074(v18, v19, v20);
  sub_188B4F980(v18, v19, v20);
  sub_188B4F9A8((uint64_t)v30, (uint64_t)v29);
  char v21 = swift_dynamicCast();
  uint64_t v22 = *(void *)(a4 - 8);
  uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56);
  if ((v21 & 1) != 0)
  {
    v23(v14, 0LL, 1LL, a4);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(a5, v14, a4);
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v23)(a5, 0LL, 1LL, a4);
  }

  else
  {
    v23(v14, 1LL, 1LL, a4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v25 = sub_188B58D40();
    swift_allocError();
    uint64_t v27 = v26;
    *uint64_t v26 = a4;
    v29[0] = 0LL;
    v29[1] = 0xE000000000000000LL;
    sub_188B58D1C();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58BF0();
    sub_188B58D58();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E900);
    sub_188B58BF0();
    sub_188B58EE4();
    sub_188B58BF0();
    swift_bridgeObjectRelease();
    sub_188B58D34();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104LL))( v27,  *MEMORY[0x189619358],  v25);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  }

uint64_t sub_188B4FF3C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void sub_188B4FF44(void *a1@<X8>)
{
  *a1 = 0LL;
  a1[1] = 0LL;
}

uint64_t sub_188B4FF4C()
{
  return sub_188B58ECC();
}

uint64_t sub_188B4FF74()
{
  return sub_188B58ED8();
}

void sub_188B4FF9C(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }

uint64_t sub_188B4FFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x189617FB0];
  v3[3] = MEMORY[0x189617FA8];
  v3[4] = v4;
  void *v3 = v2;
  v3[1] = a2;
  return swift_bridgeObjectRetain();
}

void sub_188B50074(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }

uint64_t sub_188B500B4(uint64_t a1, uint64_t a2)
{
  v2[3] = MEMORY[0x189617FA8];
  void *v2 = v3;
  v2[1] = a2;
  return swift_bridgeObjectRetain();
}

void sub_188B500E4()
{
  *(void *)(v0 + 24) = MEMORY[0x1896184C8];
  *(_BYTE *)uint64_t v0 = v1 & 1;
}

uint64_t sub_188B5022C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_188B52890(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }

  return result;
}

uint64_t sub_188B50258()
{
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_188B502D8(uint64_t a1)
{
  return sub_188B527D0(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_188B502F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_188B52AEC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_188B5031C(void *a1)
{
  uint64_t v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188B58EB4();
  uint64_t v6 = v2;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA28);
  sub_188B503F4();
  sub_188B58E24();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

unint64_t sub_188B503F4()
{
  unint64_t result = qword_18C73EA30;
  if (!qword_18C73EA30)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C73EA28);
    unint64_t v2 = sub_188B50460();
    v3[0] = MEMORY[0x189617FB0];
    v3[1] = v2;
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189617910], v1, v3);
    atomic_store(result, (unint64_t *)&qword_18C73EA30);
  }

  return result;
}

unint64_t sub_188B50460()
{
  unint64_t result = qword_18C73EA38;
  if (!qword_18C73EA38)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59C48, &type metadata for SecureConfigRawParameters.Value);
    atomic_store(result, (unint64_t *)&qword_18C73EA38);
  }

  return result;
}

uint64_t sub_188B504A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (v2)
  {
    if (a1 != a2) {
      __asm { BR              X10 }
    }
  }

  return 1LL;
}

uint64_t sub_188B50660(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = 1LL << *(_BYTE *)(a1 + 32);
    uint64_t v5 = -1LL;
    if (v4 < 64) {
      uint64_t v5 = ~(-1LL << v4);
    }
    int64_t v21 = (unint64_t)(v4 + 63) >> 6;
    if ((v5 & v3) != 0)
    {
      unint64_t v6 = __clz(__rbit64(v5 & v3));
LABEL_22:
      BOOL v10 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      uint64_t v13 = *(void *)(a1 + 56) + 24 * v6;
      uint64_t v14 = *(void *)v13;
      uint64_t v15 = *(void *)(v13 + 8);
      char v16 = *(_BYTE *)(v13 + 16);
      swift_bridgeObjectRetain();
      sub_188B4F958(v14, v15, v16);
      unint64_t v17 = sub_188B47AE8(v11, v12);
      char v19 = v18;
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0) {
        __asm { BR              X8 }
      }

      sub_188B4F980(v14, v15, v16);
      return 0LL;
    }

    if ((unint64_t)(v4 + 63) >> 6 > 1)
    {
      unint64_t v7 = *(void *)(a1 + 72);
      uint64_t v8 = 1LL;
      if (v7) {
        goto LABEL_21;
      }
      uint64_t v8 = 2LL;
      if (v21 <= 2) {
        return 1LL;
      }
      unint64_t v7 = *(void *)(a1 + 80);
      if (v7) {
        goto LABEL_21;
      }
      uint64_t v8 = 3LL;
      if (v21 <= 3) {
        return 1LL;
      }
      unint64_t v7 = *(void *)(a1 + 88);
      if (v7) {
        goto LABEL_21;
      }
      uint64_t v8 = 4LL;
      if (v21 <= 4) {
        return 1LL;
      }
      unint64_t v7 = *(void *)(a1 + 96);
      if (v7)
      {
LABEL_21:
        unint64_t v6 = __clz(__rbit64(v7)) + (v8 << 6);
        goto LABEL_22;
      }

      uint64_t v9 = 5LL;
      if (v21 > 5)
      {
        unint64_t v7 = *(void *)(a1 + 104);
        if (v7)
        {
          uint64_t v8 = 5LL;
          goto LABEL_21;
        }

        while (1)
        {
          uint64_t v8 = v9 + 1;
          if (__OFADD__(v9, 1LL))
          {
            __break(1u);
            JUMPOUT(0x188B51570LL);
          }

          if (v8 >= v21) {
            break;
          }
          unint64_t v7 = *(void *)(a1 + 64 + 8 * v8);
          ++v9;
          if (v7) {
            goto LABEL_21;
          }
        }
      }
    }

    return 1LL;
  }

  return 0LL;
}

uint64_t sub_188B51604(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_188B58AD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA78);
  int v41 = a2;
  uint64_t v10 = sub_188B58D94();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1LL << *(_BYTE *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1LL << v12);
    }
    else {
      uint64_t v14 = -1LL;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0LL;
    for (i = v9; ; uint64_t v9 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }

      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1LL))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }

        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v37;
              if ((v41 & 1) != 0)
              {
                uint64_t v35 = 1LL << *(_BYTE *)(v9 + 32);
                if (v35 >= 64) {
                  bzero(v39, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v39 = -1LL << v35;
                }
                *(void *)(v9 + 16) = 0LL;
              }

              break;
            }

            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v18 = v24;
          }
        }

LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }

      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if ((v41 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v26, v5);
        id v27 = *(id *)(*(void *)(v9 + 56) + 8 * v21);
      }

      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v26, v5);
        id v27 = *(id *)(*(void *)(v9 + 56) + 8 * v21);
      }

      sub_188B52EA0();
      uint64_t result = sub_188B58B3C();
      uint64_t v28 = -1LL << *(_BYTE *)(v11 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1LL << v29) & ~*(void *)(v16 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1LL << v29) & ~*(void *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0LL;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v16 + 8 * v30);
        }

        while (v34 == -1);
        unint64_t v19 = __clz(__rbit64(~v34)) + (v30 << 6);
      }

      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v11 + 48) + v25 * v19,  v8,  v5);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v27;
      ++*(void *)(v11 + 16);
    }
  }

  uint64_t result = swift_release();
  uint64_t *v3 = v11;
  return result;
}

uint64_t sub_188B51970(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8B0);
  char v6 = a2;
  uint64_t v7 = sub_188B58D94();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }

      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }

        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if ((v6 & 1) != 0)
              {
                uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v36 = -1LL << v34;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1LL)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }

            int64_t v14 = v25;
          }
        }

uint64_t sub_188B51C7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA58);
  char v40 = a2;
  uint64_t v6 = sub_188B58D94();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
    int64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1LL << v8);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0LL;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }

      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }

        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if ((v40 & 1) != 0)
              {
                uint64_t v36 = 1LL << *(_BYTE *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v38 = -1LL << v36;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }

            int64_t v13 = v24;
          }
        }

id sub_188B51FA4()
{
  uint64_t v1 = sub_188B58AD0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA78);
  int64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_188B58D88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *int64_t v24 = v7;
    return result;
  }

  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v25 = v5 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_188B521CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_188B58D88();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }

void *sub_188B52390()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_188B58D88();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }

uint64_t sub_188B52568(uint64_t a1)
{
  uint64_t result = sub_188B58D88();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0LL;
  uint64_t v34 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1LL << *(_BYTE *)(v6 - 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v29 = v6;
  int64_t v30 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v31 = (void *)result;
  uint64_t v32 = result + 64;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  int64_t v12 = v4;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v16 << 6))
  {
    uint64_t v18 = (uint64_t *)(*(void *)(v34 + 48) + 16 * i);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = *(void *)(v34 + 56) + 24 * i;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    char v24 = *(_BYTE *)(v21 + 16);
    swift_bridgeObjectRetain();
    sub_188B4F958(v22, v23, v24);
    sub_188B50074(v22, v23, v24);
    sub_188B4F980(v22, v23, v24);
    uint64_t v3 = v31;
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    char v25 = (void *)(v31[6] + 16 * i);
    void *v25 = v19;
    v25[1] = v20;
    uint64_t result = (uint64_t)sub_188B52E90(&v33, (_OWORD *)(v31[7] + 32 * i));
    uint64_t v26 = v31[2];
    BOOL v27 = __OFADD__(v26, 1LL);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    v31[2] = v28;
    int64_t v4 = v12;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      goto LABEL_24;
    }
    if (v14 >= v30) {
      return (uint64_t)v3;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v4 + 1;
    if (!v15)
    {
      int64_t v16 = v4 + 2;
      if (v4 + 2 >= v30) {
        return (uint64_t)v3;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v4 + 3;
        if (v4 + 3 >= v30) {
          return (uint64_t)v3;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15) {
          break;
        }
      }
    }

uint64_t sub_188B527B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_188B562C0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_188B527D0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return ((uint64_t (*)(void))((char *)sub_188B527EC + 4 * byte_188B59ABF[a3]))();
}

uint64_t sub_188B527EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6) {
    return 0LL;
  }
  if (a1 == a4 && a2 == a5) {
    return 1LL;
  }
  return sub_188B58E18();
}

uint64_t sub_188B52890(uint64_t a1)
{
  uint64_t v3 = sub_188B58BD8();
  if (v1)
  {
    MEMORY[0x1895D262C](v1);
    sub_188B531A0(a1, (uint64_t)v6);
    uint64_t v4 = sub_188B58C98() & 1;
  }

  else
  {
    uint64_t v4 = v3;
  }

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v4;
}

uint64_t sub_188B52AEC(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA40);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188B52E08();
  sub_188B58EA8();
  uint64_t v8 = v1;
  if (v1)
  {
LABEL_2:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v2;
  }

  uint64_t v35 = v5;
  uint64_t v36 = a1;
  uint64_t v9 = sub_188B58DE8();
  uint64_t v10 = *(void *)(v9 + 16);
  uint64_t v34 = v9;
  if (!v10)
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
LABEL_18:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
    return (uint64_t)v2;
  }

  uint64_t v11 = v9;
  unint64_t v39 = sub_188B52E4C();
  int64_t v12 = (uint64_t *)(v11 + 40);
  uint64_t v2 = (void *)MEMORY[0x18961AFF0];
  int64_t v37 = v7;
  uint64_t v38 = v4;
  while (1)
  {
    uint64_t v14 = *(v12 - 1);
    uint64_t v15 = *v12;
    uint64_t v43 = v14;
    uint64_t v44 = v15;
    swift_bridgeObjectRetain();
    sub_188B58DDC();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      a1 = v36;
      goto LABEL_2;
    }

    char v40 = v12;
    uint64_t v41 = v10;
    uint64_t v42 = 0LL;
    uint64_t v16 = v46;
    uint64_t v48 = v45;
    char v17 = v47;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    __int128 v45 = v2;
    unint64_t v20 = sub_188B47AE8(v14, v15);
    uint64_t v21 = v2[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v2[3] >= v23)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_188B52390();
      }
    }

    else
    {
      sub_188B51C7C(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_188B47AE8(v14, v15);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_23;
      }
      unint64_t v20 = v25;
    }

    BOOL v27 = v48;
    uint64_t v2 = v45;
    if ((v24 & 1) != 0)
    {
      uint64_t v13 = v45[7] + 24 * v20;
      sub_188B4F980(*(void *)v13, *(void *)(v13 + 8), *(_BYTE *)(v13 + 16));
      *(void *)uint64_t v13 = v27;
      *(void *)(v13 + 8) = v16;
      *(_BYTE *)(v13 + 16) = v17;
    }

    else
    {
      v45[(v20 >> 6) + 8] |= 1LL << v20;
      uint64_t v28 = (uint64_t *)(v2[6] + 16 * v20);
      *uint64_t v28 = v14;
      v28[1] = v15;
      uint64_t v29 = v2[7] + 24 * v20;
      *(void *)uint64_t v29 = v27;
      *(void *)(v29 + 8) = v16;
      *(_BYTE *)(v29 + 16) = v17;
      uint64_t v30 = v2[2];
      BOOL v31 = __OFADD__(v30, 1LL);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_22;
      }
      v2[2] = v32;
      swift_bridgeObjectRetain();
    }

    int64_t v12 = v40 + 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v42;
    uint64_t v10 = v41 - 1;
    uint64_t v7 = v37;
    uint64_t v4 = v38;
    if (v41 == 1) {
      goto LABEL_18;
    }
  }

  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t result = sub_188B58E3C();
  __break(1u);
  return result;
}

unint64_t sub_188B52E08()
{
  unint64_t result = qword_18C73EA48;
  if (!qword_18C73EA48)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59BF8, &type metadata for SecureConfigRawParameters.Key);
    atomic_store(result, (unint64_t *)&qword_18C73EA48);
  }

  return result;
}

unint64_t sub_188B52E4C()
{
  unint64_t result = qword_18C73EA50;
  if (!qword_18C73EA50)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59BD0, &type metadata for SecureConfigRawParameters.Value);
    atomic_store(result, (unint64_t *)&qword_18C73EA50);
  }

  return result;
}

_OWORD *sub_188B52E90(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_188B52EA0()
{
  unint64_t result = qword_18C73E840;
  if (!qword_18C73E840)
  {
    uint64_t v1 = sub_188B58AD0();
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189606F48], v1);
    atomic_store(result, (unint64_t *)&qword_18C73E840);
  }

  return result;
}

ValueMetadata *type metadata accessor for SecureConfigRawParameters.Key()
{
  return &type metadata for SecureConfigRawParameters.Key;
}

uint64_t destroy for SecureConfigRawParameters.Value(uint64_t a1)
{
  return sub_188B4F980(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s14SecureConfigDB25SecureConfigRawParametersV5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_188B4F958(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SecureConfigRawParameters.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_188B4F958(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_188B4F980(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecureConfigRawParameters.Value(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_188B4F980(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecureConfigRawParameters.Value(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SecureConfigRawParameters.Value( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_188B5308C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_188B53094(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecureConfigRawParameters.Value()
{
  return &type metadata for SecureConfigRawParameters.Value;
}

unint64_t sub_188B530B0()
{
  unint64_t result = qword_18C73EA80;
  if (!qword_18C73EA80)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59B80, &type metadata for SecureConfigRawParameters.Key);
    atomic_store(result, (unint64_t *)&qword_18C73EA80);
  }

  return result;
}

unint64_t sub_188B530F8()
{
  unint64_t result = qword_18C73EA88;
  if (!qword_18C73EA88)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59BA8, &type metadata for SecureConfigRawParameters.Key);
    atomic_store(result, (unint64_t *)&qword_18C73EA88);
  }

  return result;
}

unint64_t sub_188B5313C()
{
  unint64_t result = qword_18C73EA98;
  if (!qword_18C73EA98)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C73EA90);
    unint64_t v2 = sub_188B50460();
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189618448], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C73EA98);
  }

  return result;
}

uint64_t sub_188B531A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t SCAlgorithm.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0LL;
  }
  return result;
}

uint64_t SCAlgorithm.description.getter(unint64_t a1)
{
  if (a1 < 3) {
    return *(void *)&aInvalid[8 * a1];
  }
  uint64_t result = sub_188B58E30();
  __break(1u);
  return result;
}

uint64_t sub_188B5325C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = _s14SecureConfigDB11SCAlgorithmOyACSScfC_0(a1, a2);
  *(void *)a3 = result;
  *(_BYTE *)(a3 + 8) = 0;
  return result;
}

uint64_t sub_188B53284()
{
  return SCAlgorithm.description.getter(*v0);
}

BOOL sub_188B5328C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_188B532A0()
{
  return sub_188B58E90();
}

uint64_t sub_188B532E4()
{
  return sub_188B58E84();
}

uint64_t sub_188B5330C()
{
  return sub_188B58E90();
}

void sub_188B5334C()
{
  qword_18C73EB40 = 1953459315LL;
  *(void *)algn_18C73EB48 = 0xE400000000000000LL;
}

void sub_188B53368()
{
  qword_18C73EB50 = 1635018093LL;
  *(void *)algn_18C73EB58 = 0xE400000000000000LL;
}

void sub_188B53384()
{
  qword_18C73EB60 = 0x687469726F676C61LL;
  qword_18C73EB68 = 0xE90000000000006DLL;
}

void sub_188B533AC()
{
  qword_18C73EB70 = 1701869940LL;
  qword_18C73EB78 = 0xE400000000000000LL;
}

void sub_188B533C8()
{
  qword_18C73EB80 = 1953259891LL;
  qword_18C73EB88 = 0xE400000000000000LL;
}

uint64_t _s14SecureConfigDB11SCAlgorithmOyACSScfC_0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x363532616873LL && a2 == 0xE600000000000000LL;
  if (v3 || (sub_188B58E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x343833616873LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_188B58E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 0LL;
    }
  }

unint64_t sub_188B534BC()
{
  unint64_t result = qword_18C73EAA0;
  if (!qword_18C73EAA0)
  {
    unint64_t result = MEMORY[0x1895D268C](&protocol conformance descriptor for SCAlgorithm, &type metadata for SCAlgorithm);
    atomic_store(result, (unint64_t *)&qword_18C73EAA0);
  }

  return result;
}

unint64_t sub_188B53504()
{
  unint64_t result = qword_18C73EAA8;
  if (!qword_18C73EAA8)
  {
    unint64_t result = MEMORY[0x1895D268C](&protocol conformance descriptor for SCAlgorithm, &type metadata for SCAlgorithm);
    atomic_store(result, (unint64_t *)&qword_18C73EAA8);
  }

  return result;
}

ValueMetadata *type metadata accessor for SCAlgorithm()
{
  return &type metadata for SCAlgorithm;
}

uint64_t getEnumTagSinglePayload for SCUtilError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 13;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }

uint64_t storeEnumTagSinglePayload for SCUtilError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF2) {
    return ((uint64_t (*)(void))((char *)&loc_188B53634 + 4 * byte_188B59C75[v4]))();
  }
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_188B53668 + 4 * byte_188B59C70[v4]))();
}

uint64_t sub_188B53668(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B53670(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188B53678LL);
  }
  return result;
}

uint64_t sub_188B53684(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188B5368CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 13;
  return result;
}

uint64_t sub_188B53690(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188B53698(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCUtilError()
{
  return &type metadata for SCUtilError;
}

unint64_t sub_188B536B8()
{
  unint64_t result = qword_18C73EAB0;
  if (!qword_18C73EAB0)
  {
    unint64_t result = MEMORY[0x1895D268C](&unk_188B59DE0, &type metadata for SCUtilError);
    atomic_store(result, (unint64_t *)&qword_18C73EAB0);
  }

  return result;
}

void (*SCSlot.__allocating_init(slotURL:)(uint64_t a1))(char *, uint64_t)
{
  return sub_188B570A8(a1);
}

id SCSlot.__allocating_init(createAtSlotURL:slotID:algorithm:recordType:salt:)( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v44 = a7;
  uint64_t v45 = a3;
  uint64_t v47 = a5;
  uint64_t v48 = a6;
  uint64_t v46 = a4;
  uint64_t v11 = sub_188B58AD0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E7C8);
  MEMORY[0x1895F8858](v15);
  char v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_188B58A40();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v54 = a1;
  v20(v17, a1, v18);
  uint64_t v50 = v19;
  uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  uint64_t v43 = v18;
  v21(v17, 0LL, 1LL, v18);
  uint64_t v49 = v12;
  BOOL v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v23 = v44;
  uint64_t v52 = a2;
  v22(v14, (uint64_t)a2, v11);
  char v24 = (objc_class *)type metadata accessor for SCSlot();
  unint64_t v25 = (char *)objc_allocWithZone(v24);
  v22(&v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotID], (uint64_t)v14, v11);
  char v26 = &v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm];
  uint64_t v27 = v46;
  *(void *)char v26 = v45;
  *((void *)v26 + 1) = v27;
  uint64_t v28 = &v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType];
  uint64_t v29 = v48;
  *(void *)uint64_t v28 = v47;
  *((void *)v28 + 1) = v29;
  sub_188B49A2C((uint64_t)v17, (uint64_t)&v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotURL]);
  uint64_t v30 = (uint64_t *)&v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData];
  *uint64_t v30 = v23;
  v30[1] = a8;
  if (a8 >> 60 == 15)
  {
    BOOL v31 = v25;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
  }

  else
  {
    sub_188B49A74(v23, a8);
    sub_188B49A74(v23, a8);
    uint64_t v34 = v25;
    uint64_t v32 = sub_188B58A7C();
  }

  uint64_t v35 = v43;
  uint64_t v36 = (uint64_t *)&v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_salt];
  uint64_t *v36 = v32;
  v36[1] = v33;
  *(void *)&v25[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries] = MEMORY[0x18961AFE8];

  v53.receiver = v25;
  v53.super_class = v24;
  id v37 = objc_msgSendSuper2(&v53, sel_init);
  sub_188B49950(v23, a8);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v49 + 8);
  v38(v14, v11);
  sub_188B49E74((uint64_t)v17, &qword_18C73E7C8);
  id v39 = v37;
  uint64_t v40 = v54;
  uint64_t v41 = v51;
  sub_188B53C6C(v54);

  sub_188B49950(v23, a8);
  if (v41) {

  }
  v38(v52, v11);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v40, v35);
  return v39;
}

uint64_t sub_188B539F0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  int v3 = (void *)(*a2 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries);
  swift_beginAccess();
  void *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_188B53A58()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_188B53AA0(uint64_t a1)
{
  int v3 = (void *)(v1 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_188B53AF0())()
{
  return j__swift_endAccess;
}

uint64_t SCSlot.slotID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotID;
  uint64_t v4 = sub_188B58AD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t SCSlot.algorithm.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SCSlot.recordType.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SCSlot.salt.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_salt);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_188B53C20()
{
  return sub_188B58AE8();
}

void sub_188B53C6C(uint64_t a1)
{
  v73[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t ObjectType = (void *)swift_getObjectType();
  uint64_t v3 = sub_188B58AF4();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  unint64_t v65 = (uint64_t *)((char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v4);
  BOOL v7 = (char *)&v63 - v6;
  uint64_t v71 = sub_188B58A40();
  uint64_t v8 = *(void *)(v71 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v71);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v14 = (char *)&v63 - v13;
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v63 - v15;
  id v17 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_18C73E798 != -1) {
    swift_once();
  }
  v70 = v16;
  sub_188B58A04();
  uint64_t v18 = (void *)sub_188B589F8();
  v73[0] = 0LL;
  id v69 = v17;
  unsigned int v19 = objc_msgSend( v17,  sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_,  v18,  0,  0,  v73);

  if (v19)
  {
    id v20 = v73[0];
    uint64_t v21 = sub_188B55428();
    if (!v1)
    {
      uint64_t v43 = v21;
      unint64_t v44 = v22;
      uint64_t v45 = v70;
      sub_188B58A94();
      id v46 = v69;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v45, v71);
      sub_188B49964(v43, v44);

      return;
    }

    id v24 = v69;
    uint64_t v23 = v70;
    unint64_t v25 = v65;
    sub_188B58EE4();
    sub_188B58AE8();
    uint64_t v47 = v71;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v23, v71);
    id v48 = v1;
    id v49 = v1;
    uint64_t v50 = v25;
    uint64_t v51 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v52 = sub_188B58CBC();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v54 = swift_slowAlloc();
      os_log_t v64 = (os_log_t)swift_slowAlloc();
      uint64_t ObjectType = (void *)swift_slowAlloc();
      v73[0] = ObjectType;
      *(_DWORD *)uint64_t v54 = 136315394;
      uint64_t v55 = sub_188B58A1C();
      uint64_t v72 = sub_188B55A58(v55, v56, (uint64_t *)v73);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
      v35(v11, v71);
      *(_WORD *)(v54 + 12) = 2112;
      id v57 = v1;
      uint64_t v58 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v72 = v58;
      sub_188B58CE0();
      os_log_t v59 = v64;
      *(void *)os_log_t v64 = v58;
      id v24 = v69;
      uint64_t v23 = v70;
      MEMORY[0x1895D262C](v1);
      MEMORY[0x1895D262C](v1);
      _os_log_impl(&dword_188B44000, v51, v52, "Failed to write slot info at %s with %@", (uint8_t *)v54, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E860);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v59, -1LL, -1LL);
      uint64_t v60 = ObjectType;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v60, -1LL, -1LL);
      uint64_t v61 = v54;
      uint64_t v47 = v71;
      MEMORY[0x1895D26F8](v61, -1LL, -1LL);

      (*(void (**)(void *, uint64_t))(v67 + 8))(v65, v68);
    }

    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
      v35(v11, v47);
      MEMORY[0x1895D262C](v1);
      MEMORY[0x1895D262C](v1);

      (*(void (**)(void *, uint64_t))(v67 + 8))(v50, v68);
    }

    sub_188B499A8();
    swift_allocError();
    *uint64_t v62 = 8;
    swift_willThrow();

    MEMORY[0x1895D262C](v1);
  }

  else
  {
    id v26 = v73[0];
    uint64_t v27 = (void *)sub_188B589BC();

    swift_willThrow();
    sub_188B58EE4();
    sub_188B58AE8();
    uint64_t v47 = v71;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v14, a1, v71);
    id v28 = v27;
    id v29 = v27;
    uint64_t v30 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v31 = sub_188B58CBC();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      unint64_t v65 = (void *)swift_slowAlloc();
      uint64_t ObjectType = (void *)swift_slowAlloc();
      v73[0] = ObjectType;
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v33 = sub_188B58A1C();
      uint64_t v72 = sub_188B55A58(v33, v34, (uint64_t *)v73);
      os_log_t v64 = v30;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
      v35(v14, v71);
      *(_WORD *)(v32 + 12) = 2112;
      id v36 = v27;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v72 = v37;
      sub_188B58CE0();
      uint64_t v38 = v65;
      *unint64_t v65 = v37;
      MEMORY[0x1895D262C](v27);
      MEMORY[0x1895D262C](v27);
      os_log_t v39 = v64;
      _os_log_impl(&dword_188B44000, v64, v31, "Failed to create slot directory at %s with %@", (uint8_t *)v32, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E860);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v38, -1LL, -1LL);
      uint64_t v40 = ObjectType;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v40, -1LL, -1LL);
      uint64_t v41 = v32;
      uint64_t v47 = v71;
      MEMORY[0x1895D26F8](v41, -1LL, -1LL);
    }

    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
      v35(v14, v47);
      MEMORY[0x1895D262C](v27);
      MEMORY[0x1895D262C](v27);
    }

    (*(void (**)(char *, uint64_t))(v67 + 8))(v7, v68);
    sub_188B499A8();
    swift_allocError();
    *uint64_t v42 = 6;
    swift_willThrow();

    MEMORY[0x1895D262C](v27);
    uint64_t v23 = v70;
  }

  v35(v23, v47);
}

uint64_t sub_188B54410(uint64_t a1)
{
  uint64_t v56 = a1;
  os_log_t ObjectType = (os_log_t)swift_getObjectType();
  uint64_t v3 = sub_188B58AF4();
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  MEMORY[0x1895F8858](v3);
  uint64_t v54 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E7C8);
  MEMORY[0x1895F8858](v5);
  BOOL v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_188B58A40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v51 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  id v49 = (char *)&v49 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  id v57 = (char *)&v49 - v15;
  MEMORY[0x1895F8858](v14);
  uint64_t v55 = (char *)&v49 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EAC0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_188B59E80;
  uint64_t v18 = (void *)(v1 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries);
  swift_beginAccess();
  if (*v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_188B58D7C();
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v19 = *(void *)((*v18 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v20 = MEMORY[0x1896187B0];
  *(void *)(v17 + 56) = MEMORY[0x189618740];
  *(void *)(v17 + 64) = v20;
  *(void *)(v17 + 32) = v19;
  sub_188B58B6C();
  sub_188B49A2C(v1 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotURL, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    swift_bridgeObjectRelease();
    sub_188B49E74((uint64_t)v7, &qword_18C73E7C8);
    uint64_t v21 = (char *)v56;
LABEL_5:
    swift_beginAccess();
    unint64_t v22 = v21;
    MEMORY[0x1895D20B0]();
    if (*(void *)((*v18 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*v18 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_188B58C5C();
    }
    sub_188B58C74();
    sub_188B58C50();
    return swift_endAccess();
  }

  id v24 = v55;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v55, v7, v8);
  sub_188B58A04();
  swift_bridgeObjectRelease();
  uint64_t v21 = (char *)v56;
  sub_188B58A94();
  if (!v2)
  {
    uint64_t v41 = &v21[OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata];
    swift_beginAccess();
    if (*(void *)(*(void *)v41 + 16LL))
    {
      if (qword_18C73E7A0 != -1) {
        swift_once();
      }
      sub_188B58A10();
      type metadata accessor for SCEntry();
      uint64_t v42 = swift_bridgeObjectRetain();
      uint64_t v43 = sub_188B4A9D8(v42);
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      id v46 = v49;
      sub_188B58A94();
      uint64_t v47 = v46;
      id v48 = *(void (**)(char *, uint64_t))(v9 + 8);
      v48(v47, v8);
      sub_188B49964(v43, v45);
      uint64_t v21 = (char *)v56;
    }

    else
    {
      id v48 = *(void (**)(char *, uint64_t))(v9 + 8);
    }

    v48(v57, v8);
    v48(v24, v8);
    goto LABEL_5;
  }

  unint64_t v25 = v54;
  id v26 = v51;
  sub_188B58EE4();
  sub_188B58AE8();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v26, v57, v8);
  id v27 = v2;
  id v28 = v2;
  id v29 = (os_log_s *)sub_188B58ADC();
  os_log_type_t v30 = sub_188B58CBC();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v51 = (char *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    v58[0] = v56;
    *(_DWORD *)uint64_t v31 = 136315394;
    os_log_t ObjectType = v29;
    uint64_t v32 = sub_188B58A1C();
    uint64_t v59 = sub_188B55A58(v32, v33, v58);
    sub_188B58CE0();
    swift_bridgeObjectRelease();
    unint64_t v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v26, v8);
    *(_WORD *)(v31 + 12) = 2112;
    id v35 = v2;
    uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v59 = v36;
    id v24 = v55;
    sub_188B58CE0();
    uint64_t v37 = v51;
    *(void *)uint64_t v51 = v36;
    MEMORY[0x1895D262C](v2);
    MEMORY[0x1895D262C](v2);
    os_log_t v38 = ObjectType;
    _os_log_impl(&dword_188B44000, ObjectType, v30, "Failed to write to %s with %@", (uint8_t *)v31, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E860);
    swift_arrayDestroy();
    MEMORY[0x1895D26F8](v37, -1LL, -1LL);
    uint64_t v39 = v56;
    swift_arrayDestroy();
    MEMORY[0x1895D26F8](v39, -1LL, -1LL);
    MEMORY[0x1895D26F8](v31, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
  }

  else
  {
    unint64_t v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v26, v8);
    MEMORY[0x1895D262C](v2);
    MEMORY[0x1895D262C](v2);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v25, v53);
  }

  sub_188B499A8();
  swift_allocError();
  *uint64_t v40 = 10;
  swift_willThrow();
  MEMORY[0x1895D262C](v2);
  v34(v57, v8);
  return ((uint64_t (*)(char *, uint64_t))v34)(v24, v8);
}

uint64_t sub_188B54BCC(uint64_t a1)
{
  uint64_t v2 = v1;
  v83[3] = *(id *)MEMORY[0x1895F89C0];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v75 = sub_188B58A40();
  uint64_t v4 = *(void *)(v75 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v75);
  id v69 = (char *)v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  uint64_t v73 = (char *)v65 - v8;
  MEMORY[0x1895F8858](v7);
  os_log_t v81 = (os_log_t)((char *)v65 - v9);
  uint64_t v76 = sub_188B58AF4();
  uint64_t v10 = *(void (***)(char *, uint64_t))(v76 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v76);
  uint64_t v13 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)v65 - v14;
  id v16 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  uint64_t v78 = a1;
  sub_188B58A1C();
  uint64_t v17 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  v83[0] = 0LL;
  id v18 = objc_msgSend(v16, sel_contentsOfDirectoryAtPath_error_, v17, v83);

  id v19 = v83[0];
  if (v18)
  {
    id v70 = v16;
    uint64_t v20 = (void *)sub_188B58C44();
    id v21 = v19;

    v83[0] = v20;
    swift_bridgeObjectRetain();
    sub_188B5642C((uint64_t *)v83);
    swift_bridgeObjectRelease();
    uint64_t v23 = *((void *)v83[0] + 2);
    if (v23)
    {
      v80 = 0LL;
      uint64_t v66 = v13;
      uint64_t v71 = (void *)(v2 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries);
      v65[1] = v83[0];
      id v24 = (unint64_t *)((char *)v83[0] + 40);
      unint64_t v72 = 0x8000000188B5A1D0LL;
      *(void *)&__int128 v22 = 136315138LL;
      __int128 v68 = v22;
      uint64_t v67 = MEMORY[0x18961AFC0] + 8LL;
      uint64_t v25 = v75;
      uint64_t v74 = v15;
      uint64_t v79 = v4;
      do
      {
        uint64_t v27 = *(v24 - 1);
        unint64_t v26 = *v24;
        uint64_t v28 = qword_18C73E7A0;
        swift_bridgeObjectRetain();
        if (v28 != -1) {
          swift_once();
        }
        if ((sub_188B58C08() & 1) != 0) {
          goto LABEL_4;
        }
        if (qword_18C73E798 != -1) {
          swift_once();
        }
        BOOL v29 = v27 == qword_18C73EB40 && v26 == *(void *)algn_18C73EB48;
        if (v29 || (sub_188B58E18() & 1) != 0)
        {
LABEL_4:
          swift_bridgeObjectRelease();
        }

        else
        {
          sub_188B58EE4();
          sub_188B58AE8();
          swift_bridgeObjectRetain_n();
          os_log_type_t v30 = (os_log_s *)sub_188B58ADC();
          os_log_type_t v31 = sub_188B58CC8();
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v32 = swift_slowAlloc();
            unint64_t v33 = v10;
            unint64_t v34 = (void *)swift_slowAlloc();
            v83[0] = v34;
            *(_DWORD *)uint64_t v32 = v68;
            swift_bridgeObjectRetain();
            *(void *)(v32 + 4) = sub_188B55A58(v27, v26, (uint64_t *)v83);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_188B44000, v30, v31, "Parsing sorted slot %s", (uint8_t *)v32, 0xCu);
            swift_arrayDestroy();
            id v35 = v34;
            uint64_t v10 = v33;
            uint64_t v25 = v75;
            MEMORY[0x1895D26F8](v35, -1LL, -1LL);
            MEMORY[0x1895D26F8](v32, -1LL, -1LL);

            v10[1](v74, v76);
          }

          else
          {

            swift_bridgeObjectRelease_n();
            v10[1](v15, v76);
          }

          os_log_t v36 = v81;
          sub_188B58A04();
          swift_bridgeObjectRelease();
          uint64_t v4 = v79;
          uint64_t v37 = v73;
          (*(void (**)(char *, os_log_t, uint64_t))(v79 + 16))(v73, v36, v25);
          os_log_t v38 = v80;
          id v39 = sub_188B4B428(v37);
          v80 = v38;
          if (v38)
          {
            uint64_t v74 = (char *)v10;
            (*(void (**)(os_log_t, uint64_t))(v4 + 8))(v81, v25);
            swift_release();
            uint64_t v13 = v66;
            id v16 = v70;
            unint64_t v44 = v80;
            goto LABEL_24;
          }

          uint64_t v40 = v39;
          uint64_t v41 = v71;
          swift_beginAccess();
          id v42 = v40;
          MEMORY[0x1895D20B0]();
          if (*(void *)((*v41 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*v41 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
            sub_188B58C5C();
          }
          sub_188B58C74();
          sub_188B58C50();
          swift_endAccess();

          (*(void (**)(os_log_t, uint64_t))(v79 + 8))(v81, v25);
          uint64_t v15 = v74;
        }

        v24 += 2;
        --v23;
      }

      while (v23);
    }

    return swift_release();
  }

  else
  {
    uint64_t v74 = (char *)v10;
    id v43 = v83[0];
    unint64_t v44 = (void *)sub_188B589BC();

    swift_willThrow();
    uint64_t v25 = v75;
LABEL_24:
    sub_188B58EE4();
    sub_188B58AE8();
    unint64_t v45 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v69, v78, v25);
    id v46 = v44;
    id v47 = v44;
    uint64_t v48 = v25;
    id v49 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v50 = sub_188B58CBC();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      os_log_t v81 = v49;
      uint64_t v52 = v44;
      uint64_t v53 = v45;
      uint64_t v54 = v51;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v66 = v13;
      uint64_t v56 = (void *)v55;
      id v57 = (void *)swift_slowAlloc();
      id v70 = v16;
      v80 = v57;
      v83[0] = v57;
      *(_DWORD *)uint64_t v54 = 136315394;
      uint64_t v58 = sub_188B58A1C();
      uint64_t v82 = sub_188B55A58(v58, v59, (uint64_t *)v83);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v53, v48);
      *(_WORD *)(v54 + 12) = 2112;
      id v60 = v52;
      uint64_t v61 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v82 = v61;
      sub_188B58CE0();
      *uint64_t v56 = v61;
      MEMORY[0x1895D262C](v52);
      MEMORY[0x1895D262C](v52);
      os_log_t v62 = v81;
      _os_log_impl(&dword_188B44000, v81, v50, "Failed to read files at %s with error %@", (uint8_t *)v54, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E860);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v56, -1LL, -1LL);
      uint64_t v63 = v80;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v63, -1LL, -1LL);
      MEMORY[0x1895D26F8](v54, -1LL, -1LL);

      MEMORY[0x1895D262C](v52);
      return (*((uint64_t (**)(char *, uint64_t))v74 + 1))(v66, v76);
    }

    else
    {

      MEMORY[0x1895D262C](v44);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v45, v48);
      MEMORY[0x1895D262C](v44);
      MEMORY[0x1895D262C](v44);

      return (*((uint64_t (**)(char *, uint64_t))v74 + 1))(v13, v76);
    }
  }

uint64_t sub_188B55428()
{
  uint64_t v1 = sub_188B58950();
  MEMORY[0x1895F8858](v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData);
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EB08);
  if (v3 >> 60 == 15)
  {
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_188B59AA0;
    if (qword_18C73E7A8 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_18C73EB68;
    *(void *)(inited + 32) = qword_18C73EB60;
    *(void *)(inited + 40) = v5;
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm + 8);
    *(void *)(inited + 48) = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm);
    *(void *)(inited + 56) = v6;
    uint64_t v7 = qword_18C73E7B0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_18C73EB78;
    *(void *)(inited + 64) = qword_18C73EB70;
    *(void *)(inited + 72) = v8;
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType + 8);
    *(void *)(inited + 80) = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType);
    *(void *)(inited + 88) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_188B4A33C(inited);
  }

  else
  {
    uint64_t v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_188B59A90;
    sub_188B49A88(v2, v3);
    if (qword_18C73E7A8 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_18C73EB68;
    *(void *)(v10 + 32) = qword_18C73EB60;
    *(void *)(v10 + 40) = v11;
    uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm + 8);
    *(void *)(v10 + 48) = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm);
    *(void *)(v10 + 56) = v12;
    uint64_t v13 = qword_18C73E7B0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_18C73EB78;
    *(void *)(v10 + 64) = qword_18C73EB70;
    *(void *)(v10 + 72) = v14;
    uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType + 8);
    *(void *)(v10 + 80) = *(void *)(v0 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType);
    *(void *)(v10 + 88) = v15;
    uint64_t v16 = qword_18C73E7B8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v17 = qword_18C73EB88;
    *(void *)(v10 + 96) = qword_18C73EB80;
    *(void *)(v10 + 104) = v17;
    swift_bridgeObjectRetain();
    *(void *)(v10 + 112) = sub_188B58A7C();
    *(void *)(v10 + 120) = v18;
    sub_188B4A33C(v10);
    sub_188B49950(v2, v3);
  }

  sub_188B58980();
  swift_allocObject();
  sub_188B58974();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E930);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_188B59E80;
  sub_188B5892C();
  sub_188B58720();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E940);
  sub_188B58768();
  sub_188B58D04();
  sub_188B5895C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8A8);
  sub_188B587B4(&qword_18C73EB10, MEMORY[0x189617FB0], MEMORY[0x189617910]);
  uint64_t v19 = sub_188B58968();
  swift_release();
  swift_bridgeObjectRelease();
  return v19;
}

id SCSlot.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SCSlot.init()()
{
}

id SCSlot.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SCSlot();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_188B55964(uint64_t result, _BYTE **a2)
{
  objc_super v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_188B55974( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_188B559A8(void (*a1)(void))
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_188B559C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_188B559E8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_188B55A58(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_188B58CE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_188B55A58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_188B55B28(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_188B4F9A8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_188B4F9A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_188B55B28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_188B58CEC();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_188B55CE0(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = sub_188B58D4C();
  if (!v8)
  {
    sub_188B58D64();
    __break(1u);
LABEL_17:
    uint64_t result = sub_188B58DAC();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_188B55CE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_188B55D74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_188B55F4C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_188B55F4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_188B55D74(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_188B55EE8(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_188B58D28();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_188B58D64();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_188B58BFC();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_188B58DAC();
    __break(1u);
LABEL_14:
    uint64_t result = sub_188B58D64();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_188B55EE8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_188B55F4C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EA10);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

_BYTE **sub_188B56098(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_188B560A8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_188B58CE0();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }

  else
  {
  }

uint64_t sub_188B56158(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E9F0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

LABEL_32:
  uint64_t result = sub_188B58DAC();
  __break(1u);
  return result;
}

  uint64_t result = sub_188B58DAC();
  __break(1u);
  return result;
}

uint64_t sub_188B562C0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EB20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

uint64_t sub_188B5642C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_188B57094(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_188B56494(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_188B56494(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_188B58E00();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_188B56B7C(0LL, v3, 1LL, a1);
    }
    return result;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x18961AFE8];
    __dst = (char *)(MEMORY[0x18961AFE8] + 32LL);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x18961AFE8] + 16LL);
      int64_t v11 = (char *)MEMORY[0x18961AFE8];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          objc_super v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_188B56C48( (char *)(v95 + 16 * v98),  (char *)(v95 + 16LL * *(void *)&v94[16 * v12 + 16]),  v95 + 16 * v99,  __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            objc_super v97 = sub_188B57080((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }

        while (v101 > 2);
      }

LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0LL;
      return swift_bridgeObjectRelease();
    }

    uint64_t v104 = MEMORY[0x18961AFE8];
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_188B58C68();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  int64_t v11 = (char *)MEMORY[0x18961AFE8];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }

    else
    {
      int v19 = sub_188B58E18();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    id v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v19 ^ sub_188B58E18()) & 1) != 0)
      {
        goto LABEL_36;
      }

      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }

    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }

          ++v28;
          v25 -= 16LL;
          v26 += 16LL;
        }

        while (v28 < v27);
      }

LABEL_45:
      uint64_t v9 = v20;
    }

LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }

LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_188B56EE0(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      int64_t v11 = sub_188B56EE0((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    id v42 = v11 + 32;
    id v43 = &v11[16 * v41 + 32];
    *(void *)id v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          id v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          id v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }

        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }

          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }

        if ((v48 & 1) != 0) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        os_log_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        __int128 v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }

LABEL_99:
        if ((v67 & 1) != 0) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }

        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        unint64_t v85 = v11;
        id v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_188B56C48( (char *)(v84 + 16LL * *(void *)v86),  (char *)(v84 + 16LL * *(void *)v90),  v84 + 16 * v91,  __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)id v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        int64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        id v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }

    unint64_t v12 = 1LL;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }

  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      unint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        unint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        os_log_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_188B58E18() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)os_log_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }

        while (v9 != v37);
        ++v9;
        v33 += 2;
      }

      while (v9 != v32);
      uint64_t v9 = v32;
    }

    goto LABEL_67;
  }

LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_188B58D64();
  __break(1u);
  return result;
}

uint64_t sub_188B56B7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_188B58E18(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_188B56C48(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_188B58E18() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }

          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_188B58E18() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }

        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }

      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }

LABEL_50:
    sub_188B56FD8((void **)&v27, (const void **)&v26, &v25);
    return 1LL;
  }

  uint64_t result = sub_188B58DAC();
  __break(1u);
  return result;
}

char *sub_188B56EE0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C73EB18);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_188B56FD8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_188B58DAC();
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_188B57080(uint64_t a1)
{
  return sub_188B56EE0(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_188B57094(uint64_t a1)
{
  return sub_188B56158(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_188B570A8(uint64_t a1))(char *, uint64_t)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E7C8);
  MEMORY[0x1895F8858](v2);
  v195 = (char *)&v187 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_188B58A40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  unint64_t v201 = (unint64_t)&v187 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  v190 = (char *)&v187 - v9;
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  v196 = (char *)&v187 - v11;
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v197 = (char *)&v187 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v198 = (uint64_t)&v187 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v203 = (char *)&v187 - v17;
  MEMORY[0x1895F8858](v16);
  v208 = (char *)&v187 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E858);
  MEMORY[0x1895F8858](v19);
  uint64_t v21 = (char *)&v187 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = sub_188B58AD0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  v194 = (char *)&v187 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v24);
  uint64_t v27 = (char *)&v187 - v26;
  uint64_t v28 = sub_188B58AF4();
  uint64_t v204 = *(void *)(v28 - 8);
  uint64_t v205 = v28;
  MEMORY[0x1895F8858](v28);
  uint64_t v30 = (char *)&v187 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188B58AE8();
  sub_188B589EC();
  sub_188B58AAC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1LL, v22) == 1)
  {
    sub_188B49E74((uint64_t)v21, &qword_18C73E858);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v208, a1, v4);
    uint64_t v31 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v32 = sub_188B58CBC();
    uint64_t v33 = v4;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v34 = swift_slowAlloc();
      v207 = (char *)a1;
      uint64_t v202 = v5;
      uint64_t v35 = (uint8_t *)v34;
      uint64_t v36 = swift_slowAlloc();
      v206 = v30;
      uint64_t v37 = v36;
      v211 = (char *)v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      uint64_t v38 = v4;
      BOOL v39 = v208;
      uint64_t v40 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v40, v41, (uint64_t *)&v211);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      id v42 = *(void (**)(char *, uint64_t))(v202 + 8);
      v42(v39, v38);
      _os_log_impl(&dword_188B44000, v31, v32, "Invalid slot path %s", v35, 0xCu);
      swift_arrayDestroy();
      uint64_t v43 = v37;
      uint64_t v30 = v206;
      MEMORY[0x1895D26F8](v43, -1LL, -1LL);
      a1 = (uint64_t)v207;
      MEMORY[0x1895D26F8](v35, -1LL, -1LL);
    }

    else
    {

      id v42 = *(void (**)(char *, uint64_t))(v5 + 8);
      v42(v208, v4);
    }

    uint64_t v68 = v204;
    uint64_t v67 = v205;
    sub_188B499A8();
    uint64_t v69 = swift_allocError();
    _BYTE *v70 = 12;
    v208 = (char *)v69;
    swift_willThrow();
    v42((char *)a1, v33);
    goto LABEL_42;
  }

  uint64_t v202 = v5;
  v206 = v30;
  v207 = (char *)a1;
  uint64_t v199 = v4;
  uint64_t v192 = v22;
  uint64_t v193 = v23;
  unint64_t v44 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  v191 = v27;
  v44(v27, v21, v22);
  if (qword_18C73E798 != -1) {
    swift_once();
  }
  uint64_t v45 = v203;
  sub_188B58A04();
  id v46 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_188B58A1C();
  uint64_t v47 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  id v48 = objc_msgSend(v46, sel_contentsAtPath_, v47);

  unint64_t v49 = v201;
  if (!v48)
  {

    uint64_t v71 = v202;
    uint64_t v73 = v198;
    uint64_t v72 = v199;
    (*(void (**)(uint64_t, char *, uint64_t))(v202 + 16))(v198, v45, v199);
    uint64_t v74 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v75 = sub_188B58CBC();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = v71;
      uint64_t v77 = (uint8_t *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      v211 = (char *)v78;
      *(_DWORD *)uint64_t v77 = 136315138;
      uint64_t v79 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v79, v80, (uint64_t *)&v211);
      uint64_t v72 = v199;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      id v42 = *(void (**)(char *, uint64_t))(v76 + 8);
      v42((char *)v73, v72);
      _os_log_impl(&dword_188B44000, v74, v75, "No info file at %s", v77, 0xCu);
      swift_arrayDestroy();
      uint64_t v81 = v78;
      uint64_t v45 = v203;
      MEMORY[0x1895D26F8](v81, -1LL, -1LL);
      MEMORY[0x1895D26F8](v77, -1LL, -1LL);
    }

    else
    {

      id v42 = *(void (**)(char *, uint64_t))(v71 + 8);
      v42((char *)v73, v72);
    }

    uint64_t v116 = (uint64_t)v207;
    uint64_t v68 = v204;
    uint64_t v67 = v205;
    sub_188B499A8();
    uint64_t v117 = swift_allocError();
    _BYTE *v118 = 11;
    v208 = (char *)v117;
    swift_willThrow();
    v42((char *)v116, v72);
    v119 = v45;
    goto LABEL_39;
  }

  uint64_t v50 = sub_188B58A88();
  unint64_t v52 = v51;

  sub_188B58920();
  swift_allocObject();
  sub_188B58914();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C73E8A8);
  sub_188B587B4(&qword_18C73EB28, MEMORY[0x189617FD8], MEMORY[0x189617928]);
  uint64_t v53 = v200;
  sub_188B58908();
  v208 = v53;
  if (v53)
  {
    unint64_t v54 = v52;
    swift_release();
    uint64_t v55 = v202;
    uint64_t v56 = v199;
    (*(void (**)(unint64_t, char *, uint64_t))(v202 + 16))(v49, v45, v199);
    id v57 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v58 = sub_188B58CBC();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v211 = (char *)v60;
      *(_DWORD *)uint64_t v59 = 136315138;
      uint64_t v198 = v50;
      uint64_t v61 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v61, v62, (uint64_t *)&v211);
      unint64_t v63 = v54;
      uint64_t v64 = v198;
      uint64_t v56 = v199;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      id v42 = *(void (**)(char *, uint64_t))(v202 + 8);
      v42((char *)v49, v56);
      _os_log_impl(&dword_188B44000, v57, v58, "Failed to decode contents of %s to [String: String]", v59, 0xCu);
      swift_arrayDestroy();
      uint64_t v65 = v60;
      uint64_t v45 = v203;
      MEMORY[0x1895D26F8](v65, -1LL, -1LL);
      MEMORY[0x1895D26F8](v59, -1LL, -1LL);

      unint64_t v66 = v63;
    }

    else
    {

      id v42 = *(void (**)(char *, uint64_t))(v55 + 8);
      v42((char *)v49, v56);
      unint64_t v66 = v54;
      uint64_t v64 = v50;
    }

    sub_188B499A8();
    uint64_t v114 = swift_allocError();
    _BYTE *v115 = 7;
    swift_willThrow();
    sub_188B49964(v64, v66);
    MEMORY[0x1895D262C](v208);
    v42(v207, v56);
    v42(v45, v56);
    (*(void (**)(char *, uint64_t))(v193 + 8))(v191, v192);
    v208 = (char *)v114;
    uint64_t v68 = v204;
    uint64_t v67 = v205;
    goto LABEL_41;
  }

  swift_release();
  uint64_t v82 = (uint64_t)v211;
  uint64_t v83 = v202;
  if (qword_18C73E7A8 != -1) {
    swift_once();
  }
  uint64_t v84 = *(void *)(v82 + 16);
  uint64_t v198 = v50;
  if (!v84)
  {
    unint64_t v201 = v52;
    swift_bridgeObjectRelease();
LABEL_35:
    v120 = v197;
    uint64_t v72 = v199;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v197, v45, v199);
    v121 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v122 = sub_188B58CBC();
    if (os_log_type_enabled(v121, v122))
    {
      uint64_t v123 = swift_slowAlloc();
      uint64_t v124 = swift_slowAlloc();
      v211 = (char *)v124;
      *(_DWORD *)uint64_t v123 = 136315394;
      uint64_t v125 = qword_18C73EB60;
      unint64_t v126 = qword_18C73EB68;
      swift_bridgeObjectRetain();
      uint64_t v210 = sub_188B55A58(v125, v126, (uint64_t *)&v211);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v123 + 12) = 2080;
      uint64_t v127 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v127, v128, (uint64_t *)&v211);
      uint64_t v72 = v199;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      id v42 = *(void (**)(char *, uint64_t))(v202 + 8);
      v42(v120, v72);
      _os_log_impl(&dword_188B44000, v121, v122, "No %s in file at %s", (uint8_t *)v123, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v124, -1LL, -1LL);
      MEMORY[0x1895D26F8](v123, -1LL, -1LL);
    }

    else
    {

      id v42 = *(void (**)(char *, uint64_t))(v83 + 8);
      v42(v120, v72);
    }

    uint64_t v129 = (uint64_t)v207;
    uint64_t v68 = v204;
    uint64_t v67 = v205;
    sub_188B499A8();
    uint64_t v130 = swift_allocError();
    _BYTE *v131 = 5;
    v208 = (char *)v130;
    swift_willThrow();
    sub_188B49964(v198, v201);
    v42((char *)v129, v72);
    v119 = v203;
LABEL_39:
    uint64_t v132 = v72;
LABEL_40:
    v42(v119, v132);
    (*(void (**)(char *, uint64_t))(v193 + 8))(v191, v192);
LABEL_41:
    uint64_t v30 = v206;
LABEL_42:
    (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v67);
    return v42;
  }

  uint64_t v85 = qword_18C73EB68;
  uint64_t v86 = qword_18C73EB60;
  swift_bridgeObjectRetain();
  unint64_t v87 = sub_188B47AE8(v86, v85);
  if ((v88 & 1) == 0)
  {
    unint64_t v201 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v83 = v202;
    goto LABEL_35;
  }

  unint64_t v89 = (uint64_t *)(*(void *)(v82 + 56) + 16 * v87);
  uint64_t v90 = *v89;
  uint64_t v91 = (char *)v89[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_18C73E7B0 == -1)
  {
    if (*(void *)(v82 + 16)) {
      goto LABEL_20;
    }
LABEL_56:
    unint64_t v134 = v52;
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }

  swift_once();
  if (!*(void *)(v82 + 16)) {
    goto LABEL_56;
  }
LABEL_20:
  uint64_t v92 = qword_18C73EB78;
  uint64_t v93 = qword_18C73EB70;
  swift_bridgeObjectRetain();
  unint64_t v94 = sub_188B47AE8(v93, v92);
  if ((v95 & 1) == 0)
  {
    unint64_t v134 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_57:
    swift_bridgeObjectRelease();
    uint64_t v173 = v202;
    v174 = v196;
    uint64_t v175 = v199;
    (*(void (**)(char *, char *, uint64_t))(v202 + 16))(v196, v45, v199);
    v176 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v177 = sub_188B58CBC();
    if (os_log_type_enabled(v176, v177))
    {
      uint64_t v178 = swift_slowAlloc();
      v208 = (char *)swift_slowAlloc();
      v211 = v208;
      *(_DWORD *)uint64_t v178 = 136315394;
      uint64_t v179 = qword_18C73EB70;
      unint64_t v180 = qword_18C73EB78;
      swift_bridgeObjectRetain();
      uint64_t v210 = sub_188B55A58(v179, v180, (uint64_t *)&v211);
      unint64_t v181 = v134;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v178 + 12) = 2080;
      uint64_t v182 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v182, v183, (uint64_t *)&v211);
      uint64_t v45 = v203;
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      id v42 = *(void (**)(char *, uint64_t))(v202 + 8);
      v42(v174, v175);
      _os_log_impl(&dword_188B44000, v176, v177, "No %s in file at %s", (uint8_t *)v178, 0x16u);
      v184 = v208;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v184, -1LL, -1LL);
      MEMORY[0x1895D26F8](v178, -1LL, -1LL);

      uint64_t v68 = v204;
      uint64_t v67 = v205;
    }

    else
    {

      id v42 = *(void (**)(char *, uint64_t))(v173 + 8);
      v42(v174, v175);
      uint64_t v68 = v204;
      uint64_t v67 = v205;
      unint64_t v181 = v134;
    }

    sub_188B499A8();
    uint64_t v185 = swift_allocError();
    _BYTE *v186 = 4;
    v208 = (char *)v185;
    swift_willThrow();
    sub_188B49964(v198, v181);
    v42(v207, v175);
    v119 = v45;
    uint64_t v132 = v175;
    goto LABEL_40;
  }

  unint64_t v96 = (char **)(*(void *)(v82 + 56) + 16 * v94);
  objc_super v97 = v96[1];
  v196 = *v96;
  v197 = v91;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_18C73E7B8 != -1) {
    swift_once();
  }
  uint64_t v98 = *(void *)(v82 + 16);
  uint64_t v99 = v199;
  uint64_t v189 = v90;
  v200 = v97;
  if (!v98) {
    goto LABEL_46;
  }
  uint64_t v100 = qword_18C73EB88;
  uint64_t v101 = qword_18C73EB80;
  swift_bridgeObjectRetain();
  sub_188B47AE8(v101, v100);
  if ((v102 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_46:
    unint64_t v201 = v52;
    swift_bridgeObjectRelease();
    uint64_t v135 = v202;
    v136 = *(void (**)(char *, char *, uint64_t))(v202 + 16);
    v137 = v190;
    v138 = v45;
    uint64_t v139 = v99;
    v136(v190, v138, v99);
    v140 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v141 = sub_188B58CB0();
    if (os_log_type_enabled(v140, v141))
    {
      uint64_t v142 = swift_slowAlloc();
      uint64_t v188 = swift_slowAlloc();
      v211 = (char *)v188;
      *(_DWORD *)uint64_t v142 = 136315394;
      uint64_t v143 = qword_18C73EB80;
      unint64_t v144 = qword_18C73EB88;
      swift_bridgeObjectRetain();
      uint64_t v210 = sub_188B55A58(v143, v144, (uint64_t *)&v211);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v142 + 12) = 2080;
      uint64_t v145 = sub_188B58A1C();
      uint64_t v210 = sub_188B55A58(v145, v146, (uint64_t *)&v211);
      sub_188B58CE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v135 + 8))(v137, v199);
      _os_log_impl(&dword_188B44000, v140, v141, "No %s in file at %s", (uint8_t *)v142, 0x16u);
      uint64_t v147 = v188;
      swift_arrayDestroy();
      MEMORY[0x1895D26F8](v147, -1LL, -1LL);
      uint64_t v139 = v199;
      MEMORY[0x1895D26F8](v142, -1LL, -1LL);
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v135 + 8))(v137, v139);
    }

    uint64_t v103 = 0LL;
    unint64_t v105 = 0xF000000000000000LL;
    goto LABEL_50;
  }

  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v103 = sub_188B58A64();
  unint64_t v105 = v104;
  swift_bridgeObjectRelease();
  if (v105 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = v206;
    uint64_t v106 = (os_log_s *)sub_188B58ADC();
    os_log_type_t v107 = sub_188B58CBC();
    id v42 = (void (*)(char *, uint64_t))v107;
    BOOL v108 = os_log_type_enabled(v106, v107);
    uint64_t v109 = v199;
    if (v108)
    {
      uint64_t v110 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v110 = 0;
      _os_log_impl( &dword_188B44000,  v106,  (os_log_type_t)v42,  "Failed to decode salt as base64-encoded string",  v110,  2u);
      MEMORY[0x1895D26F8](v110, -1LL, -1LL);
    }

    sub_188B499A8();
    uint64_t v111 = swift_allocError();
    _BYTE *v112 = 7;
    v208 = (char *)v111;
    swift_willThrow();
    sub_188B49964(v198, v52);
    v113 = *(void (**)(uint64_t, uint64_t))(v202 + 8);
    v113((uint64_t)v207, v109);
    v113((uint64_t)v45, v109);
    (*(void (**)(char *, uint64_t))(v193 + 8))(v191, v192);
    uint64_t v68 = v204;
    uint64_t v67 = v205;
    goto LABEL_42;
  }

  unint64_t v201 = v52;
  uint64_t v135 = v202;
  v136 = *(void (**)(char *, char *, uint64_t))(v202 + 16);
  uint64_t v139 = v199;
LABEL_50:
  v148 = v191;
  uint64_t v149 = v192;
  v150 = v197;
  uint64_t v151 = (uint64_t)v195;
  v136(v195, v207, v139);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v135 + 56))(v151, 0LL, 1LL, v139);
  v152 = v194;
  v153 = *(void (**)(char *, char *, uint64_t))(v193 + 16);
  v153(v194, v148, v149);
  v154 = (objc_class *)type metadata accessor for SCSlot();
  v155 = (char *)objc_allocWithZone(v154);
  uint64_t v156 = v149;
  v157 = v155;
  v153(&v155[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotID], v152, v156);
  v158 = &v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_algorithm];
  *(void *)v158 = v189;
  *((void *)v158 + 1) = v150;
  v159 = (char **)&v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_recordType];
  v160 = v200;
  *v159 = v196;
  v159[1] = v160;
  sub_188B49A2C(v151, (uint64_t)&v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotURL]);
  v161 = (uint64_t *)&v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData];
  uint64_t *v161 = v103;
  v161[1] = v105;
  if (v105 >> 60 == 15)
  {
    v162 = v157;
    uint64_t v163 = 0LL;
    uint64_t v164 = 0LL;
  }

  else
  {
    sub_188B49A74(v103, v105);
    sub_188B49A74(v103, v105);
    v165 = v157;
    uint64_t v163 = sub_188B58A7C();
  }

  v166 = (uint64_t *)&v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_salt];
  uint64_t *v166 = v163;
  v166[1] = v164;
  *(void *)&v157[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries] = MEMORY[0x18961AFE8];

  v209.receiver = v157;
  v209.super_class = v154;
  id v167 = objc_msgSendSuper2(&v209, sel_init);
  sub_188B49950(v103, v105);
  uint64_t v168 = v192;
  v169 = *(void (**)(char *, uint64_t))(v193 + 8);
  v169(v152, v192);
  sub_188B49E74((uint64_t)v195, &qword_18C73E7C8);
  id v42 = (void (*)(char *, uint64_t))v167;
  uint64_t v170 = (uint64_t)v207;
  sub_188B54BCC((uint64_t)v207);
  sub_188B49964(v198, v201);

  sub_188B49950(v103, v105);
  v171 = *(void (**)(uint64_t, uint64_t))(v202 + 8);
  uint64_t v172 = v199;
  v171(v170, v199);
  v171((uint64_t)v203, v172);
  v169(v191, v168);
  (*(void (**)(char *, uint64_t))(v204 + 8))(v206, v205);
  return v42;
}

uint64_t type metadata accessor for SCSlot()
{
  uint64_t result = qword_18C73EAF0;
  if (!qword_18C73EAF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_188B58528@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_entries);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_188B58580()
{
  return type metadata accessor for SCSlot();
}

void sub_188B58588()
{
  if (v0 <= 0x3F)
  {
    sub_188B586CC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }

uint64_t method lookup function for SCSlot()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SCSlot.entries.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x88LL))();
}

uint64_t dispatch thunk of SCSlot.entries.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x90LL))();
}

uint64_t dispatch thunk of SCSlot.entries.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x98LL))();
}

uint64_t dispatch thunk of SCSlot.append(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xB0LL))();
}

void sub_188B586CC()
{
  if (!qword_18C73EB00)
  {
    sub_188B58A40();
    unint64_t v0 = sub_188B58CD4();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18C73EB00);
    }
  }

unint64_t sub_188B58720()
{
  unint64_t result = qword_18C73E938;
  if (!qword_18C73E938)
  {
    uint64_t v1 = sub_188B58950();
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189606070], v1);
    atomic_store(result, (unint64_t *)&qword_18C73E938);
  }

  return result;
}

unint64_t sub_188B58768()
{
  unint64_t result = qword_18C73E948;
  if (!qword_18C73E948)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C73E940);
    unint64_t result = MEMORY[0x1895D268C](MEMORY[0x189618470], v1);
    atomic_store(result, (unint64_t *)&qword_18C73E948);
  }

  return result;
}

uint64_t sub_188B587B4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C73E8A8);
    v8[0] = a2;
    v8[1] = a2;
    uint64_t result = MEMORY[0x1895D268C](a3, v7, v8);
    atomic_store(result, a1);
  }

  return result;
}

void secure_config_database_create_slot_with_saltdata_cold_1()
{
  *(_WORD *)unint64_t v0 = 0;
  _os_log_error_impl(&dword_188B44000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Unexpected algorithm", v0, 2u);
}

void secure_config_slot_append_entry_cold_1(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = [a1 code];
  [a1 domain];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_188B44000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to append to secure config slot: %tu %@",  (uint8_t *)&v4,  0x16u);
}

uint64_t sub_188B58908()
{
  return MEMORY[0x189606000]();
}

uint64_t sub_188B58914()
{
  return MEMORY[0x189606018]();
}

uint64_t sub_188B58920()
{
  return MEMORY[0x189606028]();
}

uint64_t sub_188B5892C()
{
  return MEMORY[0x189606040]();
}

uint64_t sub_188B58938()
{
  return MEMORY[0x189606048]();
}

uint64_t sub_188B58944()
{
  return MEMORY[0x189606050]();
}

uint64_t sub_188B58950()
{
  return MEMORY[0x189606058]();
}

uint64_t sub_188B5895C()
{
  return MEMORY[0x189606080]();
}

uint64_t sub_188B58968()
{
  return MEMORY[0x1896060A8]();
}

uint64_t sub_188B58974()
{
  return MEMORY[0x1896060C0]();
}

uint64_t sub_188B58980()
{
  return MEMORY[0x1896060D0]();
}

uint64_t sub_188B5898C()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_188B58998()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_188B589A4()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_188B589B0()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_188B589BC()
{
  return MEMORY[0x189606940]();
}

uint64_t sub_188B589C8()
{
  return MEMORY[0x189606980]();
}

uint64_t sub_188B589D4()
{
  return MEMORY[0x1896069A0]();
}

uint64_t sub_188B589E0()
{
  return MEMORY[0x1896069D8]();
}

uint64_t sub_188B589EC()
{
  return MEMORY[0x1896069E0]();
}

uint64_t sub_188B589F8()
{
  return MEMORY[0x1896069E8]();
}

uint64_t sub_188B58A04()
{
  return MEMORY[0x189606A08]();
}

uint64_t sub_188B58A10()
{
  return MEMORY[0x189606A10]();
}

uint64_t sub_188B58A1C()
{
  return MEMORY[0x189606A60]();
}

uint64_t sub_188B58A28()
{
  return MEMORY[0x189606A78]();
}

uint64_t sub_188B58A34()
{
  return MEMORY[0x189606A88]();
}

uint64_t sub_188B58A40()
{
  return MEMORY[0x189606A90]();
}

uint64_t sub_188B58A4C()
{
  return MEMORY[0x189606B18]();
}

uint64_t sub_188B58A58()
{
  return MEMORY[0x189606B90]();
}

uint64_t sub_188B58A64()
{
  return MEMORY[0x189606B98]();
}

uint64_t sub_188B58A70()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_188B58A7C()
{
  return MEMORY[0x189606C68]();
}

uint64_t sub_188B58A88()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_188B58A94()
{
  return MEMORY[0x189606CE0]();
}

uint64_t sub_188B58AA0()
{
  return MEMORY[0x189606D08]();
}

uint64_t sub_188B58AAC()
{
  return MEMORY[0x189606EB8]();
}

uint64_t sub_188B58AB8()
{
  return MEMORY[0x189606EC8]();
}

uint64_t sub_188B58AC4()
{
  return MEMORY[0x189606EF0]();
}

uint64_t sub_188B58AD0()
{
  return MEMORY[0x189606F20]();
}

uint64_t sub_188B58ADC()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_188B58AE8()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_188B58AF4()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_188B58B00()
{
  return MEMORY[0x18961D120]();
}

uint64_t sub_188B58B0C()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_188B58B18()
{
  return MEMORY[0x189607078]();
}

uint64_t sub_188B58B24()
{
  return MEMORY[0x1896178F8]();
}

uint64_t sub_188B58B30()
{
  return MEMORY[0x189617930]();
}

uint64_t sub_188B58B3C()
{
  return MEMORY[0x1896179F8]();
}

uint64_t sub_188B58B48()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_188B58B54()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_188B58B60()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_188B58B6C()
{
  return MEMORY[0x189607138]();
}

uint64_t sub_188B58B78()
{
  return MEMORY[0x189607148]();
}

uint64_t sub_188B58B84()
{
  return MEMORY[0x189607150]();
}

uint64_t sub_188B58B90()
{
  return MEMORY[0x189607160]();
}

uint64_t sub_188B58B9C()
{
  return MEMORY[0x189607170]();
}

uint64_t sub_188B58BA8()
{
  return MEMORY[0x189607178]();
}

uint64_t sub_188B58BB4()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_188B58BC0()
{
  return MEMORY[0x189617CC8]();
}

uint64_t sub_188B58BCC()
{
  return MEMORY[0x189617D78]();
}

uint64_t sub_188B58BD8()
{
  return MEMORY[0x189617DD0]();
}

uint64_t sub_188B58BE4()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_188B58BF0()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_188B58BFC()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_188B58C08()
{
  return MEMORY[0x189617F80]();
}

uint64_t sub_188B58C14()
{
  return MEMORY[0x1896180F8]();
}

uint64_t sub_188B58C20()
{
  return MEMORY[0x189618250]();
}

uint64_t sub_188B58C2C()
{
  return MEMORY[0x1896182B0]();
}

uint64_t sub_188B58C38()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_188B58C44()
{
  return MEMORY[0x1896071E0]();
}

uint64_t sub_188B58C50()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_188B58C5C()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_188B58C68()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_188B58C74()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_188B58C80()
{
  return MEMORY[0x189618430]();
}

uint64_t sub_188B58C8C()
{
  return MEMORY[0x189607208]();
}

uint64_t sub_188B58C98()
{
  return MEMORY[0x1896184B0]();
}

uint64_t sub_188B58CA4()
{
  return MEMORY[0x189618528]();
}

uint64_t sub_188B58CB0()
{
  return MEMORY[0x18961D220]();
}

uint64_t sub_188B58CBC()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_188B58CC8()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_188B58CD4()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_188B58CE0()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_188B58CEC()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_188B58CF8()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_188B58D04()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_188B58D10()
{
  return MEMORY[0x1896191C8]();
}

uint64_t sub_188B58D1C()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_188B58D28()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_188B58D34()
{
  return MEMORY[0x189619378]();
}

uint64_t sub_188B58D40()
{
  return MEMORY[0x1896193A0]();
}

uint64_t sub_188B58D4C()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_188B58D58()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_188B58D64()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_188B58D70()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_188B58D7C()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_188B58D88()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_188B58D94()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_188B58DA0()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_188B58DAC()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_188B58DB8()
{
  return MEMORY[0x1896199A0]();
}

uint64_t sub_188B58DC4()
{
  return MEMORY[0x1896199A8]();
}

uint64_t sub_188B58DD0()
{
  return MEMORY[0x189619A40]();
}

uint64_t sub_188B58DDC()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_188B58DE8()
{
  return MEMORY[0x189619B58]();
}

uint64_t sub_188B58DF4()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_188B58E00()
{
  return MEMORY[0x189619CA8]();
}

uint64_t sub_188B58E0C()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_188B58E18()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_188B58E24()
{
  return MEMORY[0x18961A0F0]();
}

uint64_t sub_188B58E30()
{
  return MEMORY[0x18961A2F0]();
}

uint64_t sub_188B58E3C()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_188B58E48()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_188B58E54()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_188B58E60()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_188B58E6C()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_188B58E78()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_188B58E84()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_188B58E90()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_188B58E9C()
{
  return MEMORY[0x18961A930]();
}

uint64_t sub_188B58EA8()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_188B58EB4()
{
  return MEMORY[0x18961A968]();
}

uint64_t sub_188B58EC0()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_188B58ECC()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_188B58ED8()
{
  return MEMORY[0x18961AF68]();
}

uint64_t sub_188B58EE4()
{
  return MEMORY[0x18961AF88]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}