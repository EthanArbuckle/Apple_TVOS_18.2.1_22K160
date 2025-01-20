uint64_t sub_189201FDC()
{
  uint64_t v0;
  uint64_t v1;
  v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_189202008()
{
  return 0LL;
}

uint64_t sub_189202014()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_18920321C(v1);
  return v1;
}

uint64_t sub_189202060(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_18920327C(v5);
}

uint64_t (*sub_1892020B0())()
{
  return j_j__swift_endAccess;
}

void *sub_1892020EC(uint64_t a1, uint64_t a2)
{
  result = (void *)swift_allocObject();
  result[4] = 0LL;
  result[5] = 0LL;
  result[2] = a1;
  result[3] = a2;
  return result;
}

void *sub_18920212C(uint64_t a1, uint64_t a2)
{
  v2[4] = 0LL;
  v2[5] = 0LL;
  v2[2] = a1;
  v2[3] = a2;
  return v2;
}

uint64_t sub_18920213C()
{
  return v0;
}

uint64_t sub_189202160()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18920218C()
{
  return *(void *)(v0 + 16);
}

id sub_189202194()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_18920219C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_1892021C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void *sub_189202218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t sub_189202228(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v71 = a5;
  uint64_t v70 = a4;
  v85 = a3;
  uint64_t v81 = sub_189214F08();
  uint64_t v76 = *(void *)(v81 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v81);
  v80 = (void *)((char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v7);
  v79 = (void *)((char *)v63 - v9);
  uint64_t v78 = sub_189214F50();
  uint64_t v75 = *(void *)(v78 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v78);
  v74 = (char *)v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  v77 = (char *)v63 - v12;
  uint64_t v69 = sub_189214F38();
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x1895F8858](v69);
  v67 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v65 = sub_189215100();
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x1895F8858](v65);
  v15 = (char *)v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_189214F14();
  uint64_t v66 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v16);
  v18 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_189214DC4();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1895F8858](v19);
  v22 = (char *)v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_189214D64();
  MEMORY[0x1895F8858](v23);
  (*(void (**)(char *, uint64_t))(v25 + 16))((char *)v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, a2, v19);
  sub_189214E30();
  v26 = (uint64_t (*)(uint64_t))MEMORY[0x189610510];
  swift_allocObject();
  uint64_t v73 = sub_189214E24();
  uint64_t aBlock = v73;
  sub_18920EAD8(&qword_18C789D60, v26, MEMORY[0x189610508]);
  uint64_t v72 = sub_189214E90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  uint64_t v83 = swift_allocBox();
  uint64_t v28 = v27;
  uint64_t v29 = sub_189214E78();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v28, 1LL, 1LL, v29);
  uint64_t v30 = swift_allocObject();
  uint64_t v84 = v30;
  v91 = (uint64_t (*)(uint64_t))nullsub_1;
  v92 = 0LL;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v88 = 1107296256LL;
  v89 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v90 = &block_descriptor;
  _Block_copy(&aBlock);
  uint64_t v86 = MEMORY[0x18961AFE8];
  uint64_t v31 = MEMORY[0x18961AFE8];
  v63[3] = sub_18920EAD8(&qword_18C4FF5F0, (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0], MEMORY[0x18961B6B8]);
  v63[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF5F8);
  uint64_t v32 = MEMORY[0x189618470];
  v63[1] = sub_18920E9D0(&qword_18C4FF600, &qword_18C4FF5F8, MEMORY[0x189618470]);
  sub_189215184();
  sub_189214F80();
  swift_allocObject();
  *(void *)(v30 + 16) = sub_189214F5C();
  v82 = (uint64_t *)(v30 + 16);
  sub_18920D368(0LL, (unint64_t *)&qword_18C78A4A0);
  uint64_t aBlock = v31;
  sub_18920EAD8( (unint64_t *)&unk_18C789D70,  (uint64_t (*)(uint64_t))MEMORY[0x18961B978],  MEMORY[0x18961B998]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A4B0);
  uint64_t v33 = v16;
  sub_18920E9D0(&qword_18C789D80, (uint64_t *)&unk_18C78A4B0, v32);
  uint64_t v34 = v65;
  sub_189215184();
  uint64_t v35 = sub_18921510C();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v15, v34);
  uint64_t ObjectType = swift_getObjectType();
  v37 = (void *)swift_allocObject();
  uint64_t v38 = v70;
  v37[2] = v84;
  v37[3] = v38;
  uint64_t v39 = v71;
  v37[4] = v71;
  v91 = (uint64_t (*)(uint64_t))sub_189202C40;
  v92 = v37;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v88 = 1107296256LL;
  v89 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v90 = &block_descriptor_6;
  v40 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  v41 = v67;
  sub_189214F20();
  sub_189202C44();
  sub_189215118();
  _Block_release(v40);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v33);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v41, v69);
  swift_release();
  v42 = (void *)swift_allocObject();
  v42[2] = v35;
  v42[3] = v38;
  uint64_t v43 = v83;
  v42[4] = v39;
  v42[5] = v43;
  v91 = (uint64_t (*)(uint64_t))sub_18920EB28;
  v92 = v42;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v88 = 1107296256LL;
  v89 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v90 = &block_descriptor_12;
  _Block_copy(&aBlock);
  uint64_t v86 = MEMORY[0x18961AFE8];
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_189215184();
  swift_allocObject();
  uint64_t v44 = sub_189214F5C();
  swift_release();
  v45 = v82;
  swift_beginAccess();
  uint64_t *v45 = v44;
  swift_release();
  v46 = v74;
  sub_189214F44();
  v47 = v79;
  void *v79 = 600LL;
  uint64_t v48 = v76;
  v49 = *(void (**)(void *, void, uint64_t))(v76 + 104);
  uint64_t v50 = v81;
  v49(v47, *MEMORY[0x18961B670], v81);
  v51 = v77;
  MEMORY[0x1895E38F0](v46, v47);
  v52 = *(void (**)(void *, uint64_t))(v48 + 8);
  v52(v47, v50);
  v53 = *(void (**)(char *, uint64_t))(v75 + 8);
  v54 = v46;
  uint64_t v55 = v78;
  v53(v54, v78);
  v49(v47, *MEMORY[0x18961B660], v50);
  v56 = v80;
  void *v80 = 0LL;
  v49(v56, *MEMORY[0x18961B650], v50);
  MEMORY[0x1895E3A94](v51, v47, v56, ObjectType);
  v52(v56, v50);
  v52(v47, v50);
  v53(v51, v55);
  sub_189215130();
  uint64_t v57 = *v82;
  v58 = (void *)swift_allocObject();
  v59 = v85;
  v58[2] = v83;
  v58[3] = v59;
  v58[4] = v57;
  v91 = sub_189203080;
  v92 = v58;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v88 = 1107296256LL;
  v89 = sub_18920308C;
  v90 = &block_descriptor_18;
  v60 = _Block_copy(&aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  id v61 = v59;
  swift_retain();
  swift_release();
  xpc_event_publisher_fire_with_reply();
  _Block_release(v60);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease_n();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E3F44]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_189202BB4()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E3F50](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_189202C44()
{
  return sub_189215184();
}

uint64_t sub_189202CFC(uint64_t a1)
{
  uint64_t v2 = sub_189214EB4();
  MEMORY[0x1895F8858](v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  MEMORY[0x1895F8858](v4);
  v6 = (char *)&v11 - v5;
  uint64_t v7 = swift_projectBox();
  uint64_t v8 = MEMORY[0x1895E416C](a1);
  if (v8 == sub_189214ECC())
  {
    sub_189214E60();
    uint64_t v9 = sub_189214E78();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 0LL, 1LL, v9);
    swift_beginAccess();
    sub_18920EA30((uint64_t)v6, v7, &qword_18C789D68);
  }

  return sub_1892150E8();
}

uint64_t sub_18920304C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_189203080(uint64_t a1)
{
  return sub_189202CFC(a1);
}

uint64_t sub_18920308C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1892030D4()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1892030F8()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_189203124()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32LL);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_189203154()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112LL))();
}

uint64_t sub_18920317C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120LL))();
}

uint64_t sub_1892031A4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1892031D0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_18920321C(v1);
  return v1;
}

uint64_t sub_18920321C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_18920322C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 40);
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return sub_18920327C(v5);
}

uint64_t sub_18920327C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_18920328C())()
{
  return j_j__swift_endAccess;
}

void *sub_1892032C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (void *)swift_allocObject();
  v8[6] = 0LL;
  v8[5] = 0LL;
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  swift_beginAccess();
  uint64_t v9 = v8[5];
  v8[6] = 0LL;
  v8[5] = 0LL;
  swift_unknownObjectRetain();
  sub_18920327C(v9);
  sub_189203434();
  if (v4) {
    swift_release();
  }
  swift_unknownObjectRelease();
  return v8;
}

void *sub_189203390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v4;
  v3[6] = 0LL;
  v3[5] = 0LL;
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  swift_beginAccess();
  uint64_t v6 = v3[5];
  v3[6] = 0LL;
  v3[5] = 0LL;
  swift_unknownObjectRetain();
  sub_18920327C(v6);
  sub_189203434();
  if (v5) {
    swift_release();
  }
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_189203434()
{
  uint64_t v2 = *(_xpc_connection_s **)(v0 + 16);
  v7[4] = sub_18920EAB8;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 1107296256LL;
  v7[2] = sub_18920308C;
  v7[3] = &block_descriptor_94;
  uint64_t v3 = _Block_copy(v7);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v2, v3);
  _Block_release(v3);
  xpc_connection_activate(v2);
  sub_189214E18();
  uint64_t v4 = (uint64_t (*)(uint64_t))MEMORY[0x1896104F8];
  swift_allocObject();
  v7[0] = sub_189214E0C();
  sub_18920EAD8(&qword_18C78A1F0, v4, MEMORY[0x1896104E8]);
  uint64_t v5 = (void *)sub_189214E90();
  uint64_t result = swift_release();
  if (!v1)
  {
    xpc_connection_send_message(v2, v5);
    return swift_unknownObjectRelease();
  }

  return result;
}

uint64_t sub_189203568(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v72 = a5;
  uint64_t v71 = a4;
  dispatch_queue_t v87 = a3;
  uint64_t v82 = sub_189214F08();
  uint64_t v77 = *(void *)(v82 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v82);
  uint64_t v81 = (void *)((char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v7);
  v80 = (void *)((char *)v64 - v9);
  uint64_t v79 = sub_189214F50();
  uint64_t v76 = *(void *)(v79 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v79);
  uint64_t v75 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v78 = (char *)v64 - v12;
  uint64_t v70 = sub_189214F38();
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x1895F8858](v70);
  uint64_t v68 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v66 = sub_189215100();
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x1895F8858](v66);
  v15 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_189214F14();
  uint64_t v67 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v16);
  v18 = (char *)v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_189214DC4();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1895F8858](v19);
  v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_189214D64();
  MEMORY[0x1895F8858](v23);
  (*(void (**)(char *, uint64_t))(v25 + 16))((char *)v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, a2, v19);
  sub_189214E30();
  v26 = (uint64_t (*)(uint64_t))MEMORY[0x189610510];
  swift_allocObject();
  uint64_t v74 = sub_189214E24();
  uint64_t aBlock = v74;
  sub_18920EAD8(&qword_18C789D60, v26, MEMORY[0x189610508]);
  xpc_object_t v73 = (xpc_object_t)sub_189214E90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  uint64_t v85 = swift_allocBox();
  uint64_t v28 = v27;
  uint64_t v29 = sub_189214E78();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v28, 1LL, 1LL, v29);
  uint64_t v30 = swift_allocObject();
  uint64_t v86 = v30;
  v93 = nullsub_1;
  v94 = 0LL;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v90 = 1107296256LL;
  v91 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v92 = &block_descriptor_22;
  _Block_copy(&aBlock);
  uint64_t v88 = MEMORY[0x18961AFE8];
  uint64_t v31 = MEMORY[0x18961AFE8];
  v64[3] = sub_18920EAD8(&qword_18C4FF5F0, (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0], MEMORY[0x18961B6B8]);
  v64[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF5F8);
  uint64_t v32 = MEMORY[0x189618470];
  v64[1] = sub_18920E9D0(&qword_18C4FF600, &qword_18C4FF5F8, MEMORY[0x189618470]);
  sub_189215184();
  sub_189214F80();
  swift_allocObject();
  *(void *)(v30 + 16) = sub_189214F5C();
  uint64_t v84 = (uint64_t *)(v30 + 16);
  sub_18920D368(0LL, (unint64_t *)&qword_18C78A4A0);
  uint64_t aBlock = v31;
  sub_18920EAD8( (unint64_t *)&unk_18C789D70,  (uint64_t (*)(uint64_t))MEMORY[0x18961B978],  MEMORY[0x18961B998]);
  uint64_t v33 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A4B0);
  uint64_t v34 = v16;
  sub_18920E9D0(&qword_18C789D80, (uint64_t *)&unk_18C78A4B0, v32);
  uint64_t v35 = v66;
  sub_189215184();
  uint64_t v36 = sub_18921510C();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v15, v35);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v38 = (void *)swift_allocObject();
  uint64_t v39 = v71;
  v38[2] = v86;
  v38[3] = v39;
  uint64_t v40 = v72;
  v38[4] = v72;
  v93 = sub_189202C40;
  v94 = v38;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v90 = 1107296256LL;
  v91 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v92 = &block_descriptor_28;
  v41 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  v42 = v68;
  sub_189214F20();
  sub_189202C44();
  sub_189215118();
  _Block_release(v41);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v42, v70);
  swift_release();
  uint64_t v43 = (void *)swift_allocObject();
  v43[2] = v36;
  v43[3] = v39;
  uint64_t v44 = v85;
  v43[4] = v40;
  v43[5] = v44;
  v93 = (uint64_t (*)())sub_18920413C;
  v94 = v43;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v90 = 1107296256LL;
  v91 = (uint64_t (*)(uint64_t))sub_189202BDC;
  v92 = &block_descriptor_34;
  _Block_copy(&aBlock);
  uint64_t v88 = MEMORY[0x18961AFE8];
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_189215184();
  swift_allocObject();
  uint64_t v45 = sub_189214F5C();
  swift_release();
  v46 = v84;
  swift_beginAccess();
  uint64_t *v46 = v45;
  swift_release();
  v47 = v75;
  sub_189214F44();
  uint64_t v48 = v80;
  void *v80 = 600LL;
  uint64_t v49 = v77;
  uint64_t v50 = *(void (**)(void *, void, uint64_t))(v77 + 104);
  uint64_t v51 = v82;
  v50(v48, *MEMORY[0x18961B670], v82);
  v52 = v78;
  MEMORY[0x1895E38F0](v47, v48);
  v53 = *(void (**)(void *, uint64_t))(v49 + 8);
  v53(v48, v51);
  v54 = *(void (**)(char *, uint64_t))(v76 + 8);
  uint64_t v55 = v47;
  uint64_t v56 = v79;
  v54(v55, v79);
  v50(v48, *MEMORY[0x18961B660], v51);
  uint64_t v57 = v81;
  *uint64_t v81 = 0LL;
  v50(v57, *MEMORY[0x18961B650], v51);
  MEMORY[0x1895E3A94](v52, v48, v57, ObjectType);
  v53(v57, v51);
  v53(v48, v51);
  v54(v52, v56);
  sub_189215130();
  uint64_t v58 = v83;
  v59 = *(_xpc_connection_s **)(v83 + 16);
  uint64_t v60 = *v84;
  id v61 = (void *)swift_allocObject();
  v61[2] = v85;
  v61[3] = v58;
  v61[4] = v60;
  v93 = (uint64_t (*)())sub_189204510;
  v94 = v61;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v90 = 1107296256LL;
  v91 = sub_18920308C;
  v92 = &block_descriptor_40;
  v62 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  xpc_connection_send_message_with_reply(v59, v73, v87, v62);
  _Block_release(v62);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t objectdestroy_2Tm()
{
  return swift_deallocObject();
}

void sub_189203ED0()
{
  uint64_t v1 = *(void (**)(void *))(v0 + 24);
  swift_beginAccess();
  swift_retain();
  sub_189214F68();
  swift_release();
  uint64_t v2 = sub_189214E78();
  sub_18920EAD8( (unint64_t *)&qword_18C78A4C0,  (uint64_t (*)(uint64_t))MEMORY[0x189610578],  MEMORY[0x189610588]);
  uint64_t v3 = (void *)swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104LL))( v4,  *MEMORY[0x189610570],  v2);
  v1(v3);
}

void sub_189203FA0(uint64_t a1, void (*a2)(void *))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = swift_projectBox();
  swift_getObjectType();
  sub_189215124();
  swift_beginAccess();
  sub_18920EA74(v6, (uint64_t)v5, &qword_18C789D68);
  uint64_t v7 = sub_189214E78();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) == 1)
  {
    sub_18920D830((uint64_t)v5, &qword_18C789D68);
    uint64_t v9 = 0LL;
  }

  else
  {
    sub_18920EAD8( (unint64_t *)&qword_18C78A4C0,  (uint64_t (*)(uint64_t))MEMORY[0x189610578],  MEMORY[0x189610588]);
    uint64_t v9 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v10, v5, v7);
  }

  a2(v9);
}

uint64_t objectdestroy_8Tm()
{
  return swift_deallocObject();
}

void sub_18920413C()
{
}

uint64_t sub_189204158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_189214EB4();
  MEMORY[0x1895F8858](v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = swift_projectBox();
  uint64_t v11 = MEMORY[0x1895E416C](a1);
  if (v11 == sub_189214ECC())
  {
    sub_189214E60();
    uint64_t v12 = sub_189214E78();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 0LL, 1LL, v12);
    swift_beginAccess();
    uint64_t v13 = sub_18920EA30((uint64_t)v9, v10, &qword_18C789D68);
    uint64_t v14 = (void (*)(void))(*(uint64_t (**)(uint64_t))(*(void *)a3 + 104LL))(v13);
    if (v14)
    {
      uint64_t v15 = (uint64_t)v14;
      v14();
      sub_18920327C(v15);
    }
  }

  return sub_189214F74();
}

uint64_t sub_1892044DC()
{
  return swift_deallocObject();
}

uint64_t sub_189204510(uint64_t a1)
{
  return sub_189204158(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t *sub_189204520()
{
  return v0;
}

uint64_t sub_189204558()
{
  return swift_deallocClassInstance();
}

uint64_t sub_189204598()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24LL);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1892045C8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144LL))();
}

uint64_t sub_1892045F0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152LL))();
}

uint64_t sub_189204618()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_189204620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description;
  uint64_t v4 = sub_189214D4C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t sub_189204664()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_18920321C(*v1);
  return v2;
}

uint64_t sub_1892046BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_18920327C(v6);
}

uint64_t (*sub_189204718())()
{
  return j__swift_endAccess;
}

uint64_t sub_189204760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18920D198(a1, a2);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_1892047B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_18920D198(a1, a2);
  swift_unknownObjectRelease();
  return v2;
}

void (*sub_1892047E8(uint64_t a1, uint64_t a2, const char *a3))(void)
{
  uint64_t v6 = sub_189214EB4();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895E416C](a1);
  if (v10 == sub_189214ECC())
  {
    uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)a2 + 104LL))();
    if (result)
    {
      uint64_t v19 = (uint64_t)result;
      result();
      return (void (*)(void))sub_18920327C(v19);
    }
  }

  else
  {
    uint64_t v11 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
    swift_unknownObjectRetain_n();
    uint64_t v12 = (os_log_s *)sub_189214E9C();
    os_log_type_t v13 = sub_189215094();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v21 = a3;
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v22 = a1;
      uint64_t v23 = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      uint64_t v20 = v14 + 4;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E90);
      uint64_t v16 = sub_189214FBC();
      uint64_t v22 = sub_18920C8E0(v16, v17, &v23);
      sub_189215154();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_189200000, v12, v13, v21, v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E3FF8](v15, -1LL, -1LL);
      MEMORY[0x1895E3FF8](v14, -1LL, -1LL);
    }

    else
    {

      swift_unknownObjectRelease_n();
    }

    return (void (*)(void))(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  return result;
}

uint64_t sub_189204A30()
{
  return (*((uint64_t (**)(void, void))*v0 + 14))(0LL, 0LL);
}

uint64_t sub_189204A58()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description;
  uint64_t v2 = sub_189214D4C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  sub_18920327C(*(void *)(v0 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect));
  return v0;
}

uint64_t sub_189204AC4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description;
  uint64_t v2 = sub_189214D4C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  sub_18920327C(*(void *)(v0 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect));
  return swift_deallocClassInstance();
}

uint64_t JQServer.localServer.getter()
{
  return swift_unknownObjectRetain();
}

void *JQServer.remoteServer.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void *JQServer.eventPublisher.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

id sub_189204B8C()
{
  return *(id *)(v0 + 40);
}

id sub_189204B94()
{
  return *(id *)(v0 + 48);
}

id sub_189204B9C()
{
  return *(id *)(v0 + 56);
}

uint64_t sub_189204BA4()
{
  return MEMORY[0x18961AFE8];
}

uint64_t sub_189204BB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_189204BE4(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_189204C28())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189204C64()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_189204C98(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_189204CDC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189204D18()
{
  return swift_bridgeObjectRetain();
}

void *sub_189204D4C(uint64_t a1)
{
  v1[10] = a1;
  uint64_t result = (void *)swift_bridgeObjectRelease();
  unint64_t v4 = v1[10];
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_189215208();
    uint64_t result = (void *)swift_bridgeObjectRelease();
    if (v7) {
      return result;
    }
  }

  else if (*(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    return result;
  }

  uint64_t result = (*(void *(**)(void *__return_ptr, void *))(*v1 + 272LL))(v8, result);
  uint64_t v5 = v9;
  if (v9)
  {
    uint64_t v6 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 64))(v5, v6);
    return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void (*sub_189204E28(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  return sub_189204E78;
}

void sub_189204E78(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = swift_endAccess();
  if ((a2 & 1) != 0) {
    goto LABEL_6;
  }
  unint64_t v5 = *(void *)(v3[5] + 80);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_189215208();
    uint64_t v4 = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_6;
    }
  }

  else if (*(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_6:
    free(v3);
    return;
  }

  (*(void (**)(uint64_t))(*(void *)v3[5] + 272LL))(v4);
  uint64_t v6 = v3[3];
  if (v6)
  {
    uint64_t v7 = v3[4];
    __swift_project_boxed_opaque_existential_1(v3, v3[3]);
    (*(void (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
    goto LABEL_6;
  }

  __break(1u);
}

uint64_t sub_189204F48()
{
  uint64_t v1 = sub_189214D4C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1895F8858](v1);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 240LL))(v3);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x18961AFE8];
  }

  uint64_t v7 = sub_189215208();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v15 = MEMORY[0x18961AFE8];
  uint64_t result = sub_18920CF20(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = v15;
    do
    {
      if ((v6 & 0xC000000000000001LL) != 0)
      {
        uint64_t v11 = MEMORY[0x1895E3B00](v9, v6);
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))( v5,  v11 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description,  v1);
        swift_unknownObjectRelease();
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))( v5,  *(void *)(v6 + 8 * v9 + 32) + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description,  v1);
      }

      uint64_t v15 = v10;
      unint64_t v13 = *(void *)(v10 + 16);
      unint64_t v12 = *(void *)(v10 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_18920CF20(v12 > 1, v13 + 1, 1);
        uint64_t v10 = v15;
      }

      ++v9;
      *(void *)(v10 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))( v10 + ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
      + *(void *)(v2 + 72) * v13,
        v5,
        v1);
    }

    while (v7 != v9);
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

double sub_189205120@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0LL;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_189205130(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_189214F8C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v12 = (void *)v2[5];
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x18961B7F8], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_189214FA4();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v14 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
  sub_18920EA74(a1, (uint64_t)v45, (uint64_t *)&unk_18C4FF608);
  swift_retain_n();
  uint64_t v15 = (void *)sub_189214E9C();
  int v16 = sub_189215088();
  if (!os_log_type_enabled((os_log_t)v15, (os_log_type_t)v16))
  {
    swift_release_n();
    sub_18920D830((uint64_t)v45, (uint64_t *)&unk_18C4FF608);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_7:
    swift_beginAccess();
    sub_18920EA74((uint64_t)(v2 + 11), (uint64_t)v45, (uint64_t *)&unk_18C4FF608);
    uint64_t v34 = v46;
    if (v46)
    {
      uint64_t v35 = v47;
      __swift_project_boxed_opaque_existential_1(v45, v46);
      (*(void (**)(uint64_t, uint64_t))(v35 + 40))(v34, v35);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
    }

    goto LABEL_10;
  }

  int v38 = v16;
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  uint64_t v17 = swift_slowAlloc();
  uint64_t v37 = swift_slowAlloc();
  uint64_t v44 = v37;
  *(_DWORD *)uint64_t v17 = 136446466;
  swift_beginAccess();
  uint64_t v18 = v2[14];
  if (!v18)
  {
LABEL_11:
    uint64_t result = swift_release();
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v36 = v17 + 4;
  uint64_t v19 = v2[15];
  uint64_t v20 = __swift_project_boxed_opaque_existential_1(v2 + 11, v18);
  uint64_t v21 = *(void *)(v18 - 8);
  MEMORY[0x1895F8858](v20);
  uint64_t v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v21 + 16))(v23);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
  unint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v18);
  v41[0] = sub_18920C8E0(v24, v26, &v44);
  sub_189215154();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v17 + 12) = 2082;
  uint64_t result = sub_18920EA74((uint64_t)v45, (uint64_t)v41, (uint64_t *)&unk_18C4FF608);
  uint64_t v28 = v42;
  if (v42)
  {
    uint64_t v29 = v43;
    __swift_project_boxed_opaque_existential_1(v41, v42);
    uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 16))(v28, v29);
    unint64_t v32 = v31;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
    v41[0] = sub_18920C8E0(v30, v32, &v44);
    sub_189215154();
    swift_bridgeObjectRelease();
    sub_18920D830((uint64_t)v45, (uint64_t *)&unk_18C4FF608);
    _os_log_impl( &dword_189200000,  (os_log_t)v15,  (os_log_type_t)v38,  "Server state changing from <%{public}s> to <%{public}s>",  (uint8_t *)v17,  0x16u);
    uint64_t v33 = v37;
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v33, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v17, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v40);
    goto LABEL_7;
  }

LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_18920556C@<X0>(uint64_t a1@<X8>)
{
  return sub_18920EA74(v1 + 88, a1, (uint64_t *)&unk_18C4FF608);
}

uint64_t sub_1892055BC(uint64_t a1)
{
  uint64_t v3 = sub_189214F8C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (void *)((char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_189205130(a1);
  uint64_t v7 = v1 + 88;
  swift_beginAccess();
  sub_18920D320(a1, v1 + 88);
  swift_endAccess();
  uint64_t v8 = *(void **)(v1 + 40);
  void *v6 = v8;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x18961B7F8], v3);
  id v9 = v8;
  LOBYTE(v8) = sub_189214FA4();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v8 & 1) != 0)
  {
    uint64_t result = sub_18920EA74(v7, (uint64_t)v14, (uint64_t *)&unk_18C4FF608);
    uint64_t v11 = v15;
    if (v15)
    {
      uint64_t v12 = v16;
      __swift_project_boxed_opaque_existential_1(v14, v15);
      (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, v12);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      return sub_18920D830(a1, (uint64_t *)&unk_18C4FF608);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void (*sub_189205704(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  swift_beginAccess();
  sub_18920EA74(v1 + 88, (uint64_t)v3, (uint64_t *)&unk_18C4FF608);
  return sub_189205774;
}

void sub_189205774(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if ((a2 & 1) != 0)
  {
    sub_18920EA74(*a1, (uint64_t)v2 + 40, (uint64_t *)&unk_18C4FF608);
    sub_1892055BC((uint64_t)v2 + 40);
    sub_18920D830((uint64_t)v2, (uint64_t *)&unk_18C4FF608);
  }

  else
  {
    sub_1892055BC(*a1);
  }

  free(v2);
}

uint64_t sub_1892057E4()
{
  return JQClientAuthentication.__allocating_init()();
}

uint64_t sub_18920580C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 296LL))();
  *a2 = result;
  return result;
}

uint64_t sub_18920583C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 304LL);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_18920586C()
{
  return swift_retain();
}

uint64_t sub_1892058A0(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return swift_release();
}

uint64_t (*sub_1892058E4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189205920()
{
  return JQSystemInterface.__allocating_init()();
}

uint64_t sub_189205948@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320LL))();
  *a2 = result;
  return result;
}

uint64_t sub_189205978(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 328LL);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1892059A8()
{
  return swift_retain();
}

uint64_t sub_1892059DC(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  return swift_release();
}

uint64_t (*sub_189205A20())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189205A5C()
{
  return os_transaction_create();
}

uint64_t sub_189205A68()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_189205A9C(uint64_t a1)
{
  *(void *)(v1 + 144) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_189205AE0())()
{
  return j_j__swift_endAccess;
}

id sub_189205B20()
{
  return *(id *)(v0 + 152);
}

void sub_189205B50(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 152);
  *(void *)(v1 + 152) = a1;
}

uint64_t (*sub_189205B94())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189205BD0()
{
  uint64_t v0 = (uint64_t *)sub_189212454();
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  qword_18C78A718 = v2;
  unk_18C78A720 = v1;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_189205BF4()
{
  if (qword_18C78A710 != -1) {
    swift_once();
  }
  return &qword_18C78A718;
}

uint64_t static JQServer.Defaults.domain.getter()
{
  if (qword_18C78A710 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_18C78A718;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static JQServer.Defaults.enableShutdown.getter()
{
  if (qword_18C78A728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF0);
  DefaultsBackedProperty.wrappedValue.getter(v0, (uint64_t)&v2);
  return v2;
}

uint64_t static JQServer.Defaults.enableShutdown.setter(char a1)
{
  if (qword_18C78A728 != -1) {
    swift_once();
  }
  char v4 = a1;
  swift_beginAccess();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF0);
  DefaultsBackedProperty.wrappedValue.setter((uint64_t)&v4, v2);
  return swift_endAccess();
}

void (*static JQServer.Defaults.enableShutdown.modify(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x48uLL);
  *a1 = v2;
  if (qword_18C78A728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *(void *)algn_18C78A738;
  char v4 = byte_18C78A740;
  uint64_t v5 = qword_18C78A748;
  *uint64_t v2 = qword_18C78A730;
  v2[1] = v3;
  *((_BYTE *)v2 + 16) = v4;
  v2[3] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF0);
  v2[7] = v6;
  DefaultsBackedProperty.wrappedValue.getter(v6, (uint64_t)(v2 + 8));
  return sub_189205E6C;
}

void sub_189205E6C(uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 56LL);
  *uint64_t v1 = *(_BYTE *)(*(void *)a1 + 64LL);
  DefaultsBackedProperty.wrappedValue.setter((uint64_t)v1, v2);
  swift_endAccess();
  free(v1);
}

void sub_189205EC0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A1D0);
  unint64_t v1 = sub_18920E974();
  sub_18920E9D0(&qword_18C78A1E0, &qword_18C78A1D0, MEMORY[0x18961AFB0]);
  DefaultsBackedProperty<>.init(key:)(0x732D656C62616E65LL, 0xEF6E776F64747568LL, v0, v1, (char *)&qword_18C78A730);
}

uint64_t sub_189205F48()
{
  uint64_t v0 = sub_1892150D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1892150C4();
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x18961B8A8];
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = sub_189214F38();
  MEMORY[0x1895F8858](v6);
  sub_18920D368(0LL, &qword_18C4FF618);
  sub_189214F20();
  v8[1] = MEMORY[0x18961AFE8];
  sub_18920EAD8(&qword_18C4FF620, v5, MEMORY[0x18961B8C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF628);
  sub_18920E9D0(&qword_18C4FF630, &qword_18C4FF628, MEMORY[0x189618470]);
  sub_189215184();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x18961B900], v0);
  return sub_1892150F4();
}

uint64_t JQServer.__allocating_init(localServer:remoteServer:eventPublisher:queue:)( uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = sub_18920D3A0(a1, a2, a3, a4);

  swift_unknownObjectRelease();
  return v8;
}

uint64_t JQServer.init(localServer:remoteServer:eventPublisher:queue:)( uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = sub_18920D3A0(a1, a2, a3, a4);

  swift_unknownObjectRelease();
  return v7;
}

void sub_1892061E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (uint64_t *)sub_189212454();
  uint64_t v8 = *v6;
  unint64_t v7 = v6[1];
  swift_bridgeObjectRetain();
  uint64_t v9 = *(void *)sub_18921247C();
  uint64_t v10 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  swift_bridgeObjectRetain();
  uint64_t v11 = (os_log_s *)sub_189214E9C();
  os_log_type_t v12 = sub_189215088();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v1;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v9;
    uint64_t v16 = v15;
    uint64_t v23 = v15;
    *(_DWORD *)uint64_t v14 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_18920C8E0(v8, v7, &v23);
    sub_189215154();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2050;
    uint64_t v22 = v20;
    sub_189215154();
    _os_log_impl(&dword_189200000, v11, v12, "Service '%{public}s' version %{public}ld", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v16, -1LL, -1LL);
    uint64_t v17 = v14;
    uint64_t v1 = v21;
    MEMORY[0x1895E3FF8](v17, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n();
  }

  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v19 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 368LL))(v18);
  OS_dispatch_group.with(_:)((void (*)(void))sub_18920DC80);
}

uint64_t sub_18920640C(dispatch_object_t *a1)
{
  uint64_t v2 = sub_189214F14();
  uint64_t v3 = (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0];
  uint64_t v17 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_189214F38();
  uint64_t v6 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v16);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  dispatch_suspend(a1[6]);
  uint64_t v9 = (*((uint64_t (**)(void))*a1 + 69))();
  uint64_t v10 = (*((uint64_t (**)(uint64_t))*a1 + 70))(v9);
  uint64_t v11 = (*((uint64_t (**)(uint64_t))*a1 + 71))(v10);
  os_log_type_t v12 = (void *)(*((uint64_t (**)(uint64_t))*a1 + 46))(v11);
  aBlock[4] = sub_18920DC88;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_189202BDC;
  aBlock[3] = &block_descriptor_82;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_189214F20();
  uint64_t v18 = MEMORY[0x18961AFE8];
  sub_18920EAD8(&qword_18C4FF5F0, v3, MEMORY[0x18961B6B8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF5F8);
  sub_18920E9D0(&qword_18C4FF600, &qword_18C4FF5F8, MEMORY[0x189618470]);
  sub_189215184();
  sub_1892150B8();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v16);
  return swift_release();
}

uint64_t sub_189206624(dispatch_object_t *a1)
{
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = (os_log_s *)sub_189214E9C();
  os_log_type_t v8 = sub_189215088();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_189200000, v7, v8, "Uncorking client communication.", v9, 2u);
    MEMORY[0x1895E3FF8](v9, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  dispatch_resume(a1[6]);
  return (*((uint64_t (**)(void))*a1 + 44))(0LL);
}

uint64_t sub_189206744()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_189214F14();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_189214F38();
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  uint64_t v6 = MEMORY[0x1895F8858](v5);
  os_log_type_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 192LL))(v6);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = v9 + 32;
    do
    {
      sub_18920D9C0(v11, (uint64_t)aBlock);
      os_log_type_t v12 = v28;
      uint64_t v13 = v29;
      __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v28);
      (*((void (**)(void *, uint64_t (*)()))v13 + 3))(v12, v13);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
      v11 += 40LL;
      --v10;
    }

    while (v10);
  }

  uint64_t v14 = swift_bridgeObjectRelease();
  unint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 240LL))(v14);
  unint64_t v16 = v15;
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_189215208();
    uint64_t v17 = result;
    if (!result) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v17) {
      goto LABEL_13;
    }
  }

  if (v17 < 1)
  {
    __break(1u);
    return result;
  }

  for (uint64_t i = 0LL; i != v17; ++i)
  {
    if ((v16 & 0xC000000000000001LL) != 0)
    {
      uint64_t v20 = MEMORY[0x1895E3B00](i, v16);
    }

    else
    {
      uint64_t v20 = *(void *)(v16 + 8 * i + 32);
      swift_retain();
    }

    (*(void (**)(void))(*(void *)v20 + 144LL))();
    swift_release();
  }

LABEL_13:
  swift_bridgeObjectRelease_n();
  uint64_t v21 = *(_xpc_connection_s **)(v1 + 16);
  if (v21) {
    xpc_connection_cancel(v21);
  }
  if (*(void *)(v1 + 24)) {
    xpc_remote_connection_cancel();
  }
  uint64_t v29 = sub_18920D720;
  uint64_t v30 = v1;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_189202BDC;
  uint64_t v28 = &block_descriptor_43;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  sub_189214F20();
  uint64_t v26 = MEMORY[0x18961AFE8];
  sub_18920EAD8(&qword_18C4FF5F0, (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0], MEMORY[0x18961B6B8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF5F8);
  sub_18920E9D0(&qword_18C4FF600, &qword_18C4FF5F8, MEMORY[0x189618470]);
  sub_189215184();
  MEMORY[0x1895E3A34](0LL, v8, v4, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
  return swift_release();
}

    uint64_t result = sub_18920CB68(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    os_log_type_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  os_log_type_t v8 = sub_1892151C0();
  if (!v8)
  {
    sub_1892151FC();
    __break(1u);
LABEL_17:
    uint64_t result = sub_189215214();
    __break(1u);
    return result;
  }

uint64_t sub_189206A58(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_189206A84(uint64_t a1)
{
  uint64_t v3 = sub_189214F8C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (uint64_t *)((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = *(void **)(v1 + 40);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x18961B7F8], v3);
  id v8 = v7;
  LOBYTE(v7) = sub_189214FA4();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    dispatch_group_t v9 = dispatch_group_create();
    *(&v10 - 4) = MEMORY[0x1895F8858](v9);
    *(&v10 - 3) = v1;
    *(&v10 - 2) = a1;
    OS_dispatch_group.with(_:)((void (*)(void))sub_18920D780);
  }

  else
  {
    __break(1u);
  }
}

uint64_t sub_189206B80(dispatch_group_s *a1, void *a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v5 = sub_189214D64();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_189214F14();
  dispatch_group_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0];
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_189214F38();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x1895F8858](v31);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = a2[5];
  uint64_t v39 = sub_18920E8CC;
  uint64_t v40 = a2;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_189202BDC;
  int v38 = &block_descriptor_85;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  sub_189214F20();
  *(void *)&v36[0] = MEMORY[0x18961AFE8];
  sub_18920EAD8(&qword_18C4FF5F0, v9, MEMORY[0x18961B6B8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF5F8);
  sub_18920E9D0(&qword_18C4FF600, &qword_18C4FF5F8, MEMORY[0x189618470]);
  uint64_t v15 = v30;
  sub_189215184();
  sub_1892150B8();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v31);
  uint64_t v16 = swift_release();
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*a2 + 192LL))(v16);
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v31 = v17;
    uint64_t v19 = v17 + 32;
    LODWORD(v32) = *MEMORY[0x189610430];
    uint64_t v20 = v15;
    uint64_t v22 = v34;
    uint64_t v21 = v35;
    do
    {
      sub_18920D9C0(v19, (uint64_t)aBlock);
      dispatch_group_enter(a1);
      uint64_t v23 = v38;
      uint64_t v24 = v39;
      __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v38);
      (*(void (**)(char *, void, uint64_t))(v22 + 104))(v7, v32, v21);
      sub_18920D9C0((uint64_t)aBlock, (uint64_t)v36);
      uint64_t v25 = swift_allocObject();
      sub_18920D9A8(v36, v25 + 16);
      *(void *)(v25 + 56) = a1;
      uint64_t v26 = (void (*)(char *, uint64_t, uint64_t, void (*)(void *), uint64_t, void *, void *(*)()))*((void *)v24 + 2);
      uint64_t v27 = a1;
      v26(v7, v33, v20, sub_18920E968, v25, v23, v24);
      uint64_t v22 = v34;
      uint64_t v21 = v35;
      swift_release();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v21);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
      v19 += 40LL;
      --v18;
    }

    while (v18);
  }

  return swift_bridgeObjectRelease();
}

void sub_189206EB4(void *a1, uint64_t a2, dispatch_group_s *a3)
{
  uint64_t v6 = sub_189214EB4();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = sub_18920EC38();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  if (!a1)
  {
    v14(v10, v13, v6);
    sub_18920D9C0(a2, (uint64_t)v46);
    uint64_t v28 = (os_log_s *)sub_189214E9C();
    os_log_type_t v29 = sub_189215088();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v42 = v6;
      uint64_t v32 = v31;
      uint64_t v45 = v31;
      uint64_t v43 = a3;
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v41 = (uint64_t)(v30 + 4);
      uint64_t v34 = v47;
      uint64_t v33 = v48;
      __swift_project_boxed_opaque_existential_1(v46, v47);
      uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v34, v33);
      uint64_t v44 = sub_18920C8E0(v35, v36, &v45);
      a3 = v43;
      sub_189215154();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
      _os_log_impl( &dword_189200000,  v28,  v29,  "Subscriber %{public}s acknowledged quiescence notification",  v30,  0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E3FF8](v32, -1LL, -1LL);
      MEMORY[0x1895E3FF8](v30, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v42);
      goto LABEL_9;
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);

    uint64_t v37 = *(void (**)(char *, uint64_t))(v7 + 8);
    int v38 = v10;
LABEL_8:
    v37(v38, v6);
    goto LABEL_9;
  }

  v14(v12, v13, v6);
  sub_18920D9C0(a2, (uint64_t)v46);
  id v15 = a1;
  id v16 = a1;
  uint64_t v17 = (void *)sub_189214E9C();
  os_log_type_t v18 = sub_189215094();
  if (!os_log_type_enabled((os_log_t)v17, v18))
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);

    uint64_t v37 = *(void (**)(char *, uint64_t))(v7 + 8);
    int v38 = v12;
    goto LABEL_8;
  }

  uint64_t v19 = swift_slowAlloc();
  uint64_t v40 = (void *)swift_slowAlloc();
  uint64_t v41 = swift_slowAlloc();
  uint64_t v45 = v41;
  *(_DWORD *)uint64_t v19 = 136446466;
  uint64_t v42 = v6;
  uint64_t v43 = a3;
  uint64_t v20 = v47;
  uint64_t v21 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
  uint64_t v44 = sub_18920C8E0(v22, v23, &v45);
  sub_189215154();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  *(_WORD *)(v19 + 12) = 2112;
  id v24 = a1;
  uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
  uint64_t v44 = v25;
  a3 = v43;
  sub_189215154();
  uint64_t v26 = v40;
  void *v40 = v25;

  _os_log_impl( &dword_189200000,  (os_log_t)v17,  v18,  "Subscriber %{public}s FAILED to acknowledge quiescence notification with error: %@",  (uint8_t *)v19,  0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E18);
  swift_arrayDestroy();
  MEMORY[0x1895E3FF8](v26, -1LL, -1LL);
  uint64_t v27 = v41;
  swift_arrayDestroy();
  MEMORY[0x1895E3FF8](v27, -1LL, -1LL);
  MEMORY[0x1895E3FF8](v19, -1LL, -1LL);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v42);
LABEL_9:
  dispatch_group_leave(a3);
}

unint64_t sub_1892072F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF8);
  MEMORY[0x1895F8858](v26);
  uint64_t v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = sub_189214CBC();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  unint64_t v9 = (unint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_189214F8C();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (void **)((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = (void *)v2[5];
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x18961B7F8], v10);
  id v15 = v14;
  LOBYTE(v14) = sub_189214FA4();
  uint64_t v16 = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    *(void *)unint64_t v9 = (*(uint64_t (**)(uint64_t))(*v2 + 264LL))(v16);
    (*(void (**)(unint64_t, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x189610358], v6);
    sub_189214CD4();
    swift_allocObject();
    a1 = sub_189214CC8();
    unint64_t result = (*(uint64_t (**)(void))(*v2 + 216LL))();
    unint64_t v9 = result;
    uint64_t v25 = v2;
    if (!(result >> 62))
    {
      uint64_t v18 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v18) {
        goto LABEL_4;
      }
LABEL_15:
      swift_bridgeObjectRelease();
      unint64_t v23 = (void (*)(_BYTE *, void))(*(uint64_t (**)(_BYTE *))(*v25 + 232LL))(v27);
      *id v24 = MEMORY[0x18961AFE8];
      swift_bridgeObjectRelease();
      v23(v27, 0LL);
      return swift_release();
    }
  }

  else
  {
    __break(1u);
  }

  unint64_t result = sub_189215208();
  uint64_t v18 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_4:
  if (v18 >= 1)
  {
    for (uint64_t i = 0LL; i != v18; ++i)
    {
      if ((v9 & 0xC000000000000001LL) != 0)
      {
        uint64_t v20 = MEMORY[0x1895E3B00](i, v9);
      }

      else
      {
        uint64_t v20 = *(void *)(v9 + 8 * i + 32);
        swift_retain();
      }

      uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v20 + 96LL))();
      if (v21)
      {
        uint64_t v22 = (void (*)(uint64_t *))v21;
        *uint64_t v5 = a1;
        swift_storeEnumTagMultiPayload();
        swift_retain();
        v22(v5);
        swift_release();
        sub_18920327C((uint64_t)v22);
        sub_18920D830((uint64_t)v5, &qword_18C789DF8);
      }

      else
      {
        swift_release();
      }
    }

    goto LABEL_15;
  }

  __break(1u);
  return result;
}

uint64_t sub_1892075D4(uint64_t a1, uint64_t a2)
{
  v24[1] = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF8);
  MEMORY[0x1895F8858](v26);
  uint64_t v5 = (void *)((char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = sub_189214CBC();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  unint64_t v9 = (unint64_t)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_189214F8C();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (void *)((char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v25 = v2;
  uint64_t v14 = *(void **)(v2 + 40);
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x18961B7F8], v10);
  id v15 = v14;
  LOBYTE(v14) = sub_189214FA4();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (a2 < 0) {
    goto LABEL_18;
  }
  *(void *)unint64_t v9 = a2;
  (*(void (**)(unint64_t, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x189610350], v6);
  sub_189214CD4();
  swift_allocObject();
  a2 = sub_189214CC8();
  unint64_t v9 = (*(uint64_t (**)(void))(*(void *)v25 + 216LL))();
  if (v9 >> 62)
  {
LABEL_15:
    uint64_t v16 = sub_189215208();
    if (v16) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v21 = (void (*)(_BYTE *, void))(*(uint64_t (**)(_BYTE *))(*(void *)v25 + 232LL))(v27);
    void *v22 = MEMORY[0x18961AFE8];
    swift_bridgeObjectRelease();
    v21(v27, 0LL);
    return swift_release();
  }

  uint64_t v16 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v16) {
    goto LABEL_16;
  }
LABEL_5:
  if (v16 >= 1)
  {
    for (uint64_t i = 0LL; i != v16; ++i)
    {
      if ((v9 & 0xC000000000000001LL) != 0)
      {
        uint64_t v18 = MEMORY[0x1895E3B00](i, v9);
      }

      else
      {
        uint64_t v18 = *(void *)(v9 + 8 * i + 32);
        swift_retain();
      }

      uint64_t v19 = (*(uint64_t (**)(void))(*(void *)v18 + 96LL))();
      if (v19)
      {
        uint64_t v20 = (void (*)(uint64_t *))v19;
        *uint64_t v5 = a2;
        swift_storeEnumTagMultiPayload();
        swift_retain();
        v20(v5);
        swift_release();
        sub_18920327C((uint64_t)v20);
        sub_18920D830((uint64_t)v5, &qword_18C789DF8);
      }

      else
      {
        swift_release();
      }
    }

    goto LABEL_16;
  }

  __break(1u);
LABEL_18:
  uint64_t result = sub_1892151FC();
  __break(1u);
  return result;
}

uint64_t sub_189207900()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_189214DC4();
  uint64_t v7 = (uint64_t (*)(uint64_t))MEMORY[0x189610498];
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189214DB8();
  sub_18920EAD8((unint64_t *)&qword_18C789E00, v7, MEMORY[0x1896104A0]);
  char v11 = sub_189215178();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  if ((v11 & 1) != 0)
  {
    if (qword_18C78A728 != -1) {
      swift_once();
    }
    swift_beginAccess();
    v20[0] = qword_18C78A730;
    v20[1] = *(void *)algn_18C78A738;
    char v21 = byte_18C78A740;
    uint64_t v22 = qword_18C78A748;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789DF0);
    uint64_t v14 = DefaultsBackedProperty.wrappedValue.getter(v13, (uint64_t)&v23);
    if (v23 == 2 || (v23 & 1) != 0)
    {
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 320LL))(v14);
      (*(void (**)(uint64_t))(*(void *)v19 + 80LL))(v19);
      return swift_release();
    }

    else
    {
      uint64_t v15 = sub_18920EC38();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
      uint64_t v16 = (os_log_s *)sub_189214E9C();
      os_log_type_t v17 = sub_1892150AC();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_189200000, v16, v17, "SKIPPING system shutdown as configured in preferences.", v18, 2u);
        MEMORY[0x1895E3FF8](v18, -1LL, -1LL);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }

  return result;
}

void *sub_189207B50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *, void))
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_189214F8C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  char v11 = (void *)((char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = (void *)v4[5];
  *char v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x18961B7F8], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_189214FA4();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    uint64_t v14 = sub_189214C8C();
    uint64_t v16 = v15;
    type metadata accessor for JQClientRequester();
    os_log_type_t v17 = (void *)swift_allocObject();
    v17[5] = 0LL;
    v17[4] = 0LL;
    v17[2] = v14;
    v17[3] = v16;
    swift_beginAccess();
    uint64_t v18 = v17[4];
    v17[4] = a2;
    v17[5] = a3;
    swift_retain();
    sub_18920327C(v18);
    uint64_t v19 = *(uint64_t (**)(void *))(*v4 + 232LL);
    swift_retain();
    a3 = (uint64_t (*)(void *, void))v19(v26);
    char v21 = v20;
    MEMORY[0x1895E3968]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8LL) + 0x10) < *(void *)((*v21 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  sub_189215028();
LABEL_3:
  sub_189215040();
  sub_18921501C();
  uint64_t v22 = a3(v26, 0LL);
  uint64_t result = (*(void *(**)(void *__return_ptr, uint64_t))(*v4 + 272LL))(v26, v22);
  uint64_t v24 = v27;
  if (v27)
  {
    uint64_t v25 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(a1, v24, v25);
    swift_release();
    return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void *sub_189207D50(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t v4 = sub_189214DA0();
  MEMORY[0x1895F8858](v4);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E08);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (void *)((char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = sub_189214F8C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  char v11 = (void *)((char *)&v19[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = (void *)v2[5];
  *char v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x18961B7F8], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_189214FA4();
  uint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    uint64_t result = (*(void *(**)(void *__return_ptr, void *))(*v2 + 272LL))(v19, result);
    uint64_t v15 = v20;
    if (v20)
    {
      uint64_t v16 = v21;
      __swift_project_boxed_opaque_existential_1(v19, v20);
      (*(void (**)(uint64_t, uint64_t))(v16 + 88))(v15, v16);
      sub_189214DAC();
      swift_allocObject();
      uint64_t v17 = sub_189214D94();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      *uint64_t v7 = v17;
      swift_storeEnumTagMultiPayload();
      a2(v7);
      return (void *)sub_18920D830((uint64_t)v7, &qword_18C789E08);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void *sub_189207F2C(void (*a1)(void *, void), void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v72 = a3;
  xpc_object_t v73 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E10);
  MEMORY[0x1895F8858](v6);
  uint64_t v71 = (void *)((char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = sub_189214EB4();
  uint64_t v74 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  uint64_t v9 = MEMORY[0x1895F8858](v8);
  char v11 = (void *)((char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v14 = (void *)((char *)v64 - v13);
  MEMORY[0x1895F8858](v12);
  uint64_t v70 = (char *)v64 - v15;
  uint64_t v16 = sub_189214F8C();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v16);
  uint64_t v19 = (void *)((char *)v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v20 = (void *)v4[5];
  *uint64_t v19 = v20;
  (*(void (**)(void *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x18961B7F8], v16);
  id v21 = v20;
  char v22 = sub_189214FA4();
  (*(void (**)(void *, uint64_t))(v17 + 8))(v19, v16);
  if ((v22 & 1) == 0)
  {
    __break(1u);
LABEL_17:
    uint64_t v14 = sub_18920C7C0(0LL, v14[2] + 1LL, 1, v14);
    *char v11 = v14;
    goto LABEL_8;
  }

  char v23 = (_xpc_endpoint_s *)sub_189214D7C();
  if (!v23)
  {
    uint64_t v30 = sub_18920EC38();
    uint64_t v32 = v74;
    uint64_t v31 = v75;
    (*(void (**)(void *, uint64_t, uint64_t))(v74 + 16))(v14, v30, v75);
    uint64_t v33 = (os_log_s *)sub_189214E9C();
    os_log_type_t v34 = sub_189215094();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = (uint64_t)v71;
    if (v35)
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_189200000, v33, v34, "Incoming subscription request contains no XPC endpoint", v37, 2u);
      MEMORY[0x1895E3FF8](v37, -1LL, -1LL);
    }

    (*(void (**)(void *, uint64_t))(v32 + 8))(v14, v31);
    uint64_t v38 = *MEMORY[0x189610540];
    uint64_t v39 = sub_189214E78();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104LL))(v36, v38, v39);
    swift_storeEnumTagMultiPayload();
    v73(v36);
    return (void *)sub_18920D830(v36, &qword_18C789E10);
  }

  uint64_t v24 = v23;
  uint64_t v25 = xpc_connection_create_from_endpoint(v23);
  xpc_connection_set_target_queue(v25, (dispatch_queue_t)v21);
  swift_unknownObjectRetain();
  uint64_t v26 = sub_189214D70();
  uint64_t v28 = v27;
  uint64_t v19 = (void *)type metadata accessor for JQClientXpcSubscriber();
  id v21 = (id)swift_allocObject();
  *((void *)v21 + 6) = 0LL;
  *((void *)v21 + 5) = 0LL;
  *((void *)v21 + 2) = v25;
  *((void *)v21 + 3) = v26;
  *((void *)v21 + 4) = v28;
  swift_beginAccess();
  uint64_t v29 = *((void *)v21 + 5);
  *((void *)v21 + 6) = 0LL;
  *((void *)v21 + 5) = 0LL;
  swift_unknownObjectRetain();
  sub_18920327C(v29);
  sub_189203434();
  uint64_t v68 = v24;
  uint64_t v69 = v25;
  swift_unknownObjectRelease();
  uint64_t v40 = *(uint64_t (**)(void *))(*v4 + 208LL);
  swift_retain_n();
  a1 = (void (*)(void *, void))v40(v76);
  char v11 = v41;
  uint64_t v14 = *v41;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *char v11 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_17;
  }
LABEL_8:
  unint64_t v44 = v14[2];
  unint64_t v43 = v14[3];
  if (v44 >= v43 >> 1)
  {
    uint64_t v14 = sub_18920C7C0((void *)(v43 > 1), v44 + 1, 1, v14);
    *char v11 = v14;
  }

  uint64_t v78 = v19;
  uint64_t v79 = &off_18A365120;
  uint64_t v67 = v19;
  *(void *)&__int128 v77 = v21;
  v14[2] = v44 + 1;
  sub_18920D9A8(&v77, (uint64_t)&v14[5 * v44 + 4]);
  a1(v76, 0LL);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v4;
  *(void *)(v45 + 24) = v21;
  uint64_t v46 = *((void *)v21 + 5);
  *((void *)v21 + 5) = sub_18920D7D8;
  *((void *)v21 + 6) = v45;
  swift_retain();
  swift_retain();
  sub_18920327C(v46);
  uint64_t v47 = sub_18920EC38();
  uint64_t v49 = v74;
  uint64_t v48 = v75;
  uint64_t v50 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v70, v47, v75);
  swift_retain();
  uint64_t v51 = (os_log_s *)sub_189214E9C();
  os_log_type_t v52 = sub_189215088();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(void *)&__int128 v77 = v66;
    uint64_t v65 = v53;
    *(_DWORD *)v53 = 136446210;
    v64[1] = v53 + 4;
    uint64_t v55 = *((void *)v21 + 3);
    unint64_t v54 = *((void *)v21 + 4);
    swift_bridgeObjectRetain();
    v76[0] = sub_18920C8E0(v55, v54, (uint64_t *)&v77);
    sub_189215154();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v56 = v65;
    _os_log_impl(&dword_189200000, v51, v52, "New subscriber %{public}s", v65, 0xCu);
    uint64_t v57 = v66;
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v57, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v56, -1LL, -1LL);

    uint64_t v58 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v70, v48);
  }

  else
  {

    swift_release();
    uint64_t v58 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v50, v48);
  }

  uint64_t result = (*(void *(**)(__int128 *__return_ptr, uint64_t))(*v4 + 272LL))(&v77, v58);
  uint64_t v60 = (uint64_t)v78;
  id v61 = v67;
  if (v78)
  {
    v62 = v79;
    __swift_project_boxed_opaque_existential_1(&v77, (uint64_t)v78);
    v76[3] = v61;
    v76[4] = &off_18A365120;
    v76[0] = v21;
    ((void (*)(void *, uint64_t, _UNKNOWN **))v62[10])(v76, v60, v62);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
    sub_189214CF8();
    swift_allocObject();
    uint64_t v63 = sub_189214CEC();
    uint64_t v36 = (uint64_t)v71;
    *uint64_t v71 = v63;
    swift_storeEnumTagMultiPayload();
    v73(v36);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    return (void *)sub_18920D830(v36, &qword_18C789E10);
  }

  __break(1u);
  return result;
}

uint64_t sub_1892087A8(void *a1, void *a2)
{
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_189214F8C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  char v11 = (uint64_t *)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = (void *)a1[5];
  *char v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x18961B7F8], v8);
  id v13 = v12;
  char v14 = sub_189214FA4();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v14 & 1) != 0)
  {
    uint64_t v16 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
    swift_retain();
    uint64_t v17 = (os_log_s *)sub_189214E9C();
    os_log_type_t v18 = sub_189215088();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      BOOL v35 = a1;
      uint64_t v21 = v20;
      v37[0] = v20;
      uint64_t v33 = v5;
      uint64_t v34 = v4;
      *(_DWORD *)uint64_t v19 = 136446210;
      uint64_t v22 = a2[3];
      unint64_t v23 = a2[4];
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_18920C8E0(v22, v23, v37);
      sub_189215154();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_189200000, v17, v18, "Subscriber %{public}s disconnected.", v19, 0xCu);
      swift_arrayDestroy();
      uint64_t v24 = v21;
      a1 = v35;
      MEMORY[0x1895E3FF8](v24, -1LL, -1LL);
      MEMORY[0x1895E3FF8](v19, -1LL, -1LL);

      uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v7, v34);
    }

    else
    {

      swift_release();
      uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    (*(void (**)(uint64_t))(*a2 + 152LL))(v25);
    uint64_t v26 = *(uint64_t (**)(uint64_t *))(*a1 + 208LL);
    swift_retain();
    uint64_t v27 = (uint64_t (*)(uint64_t *, void))v26(v37);
    uint64_t v29 = v28;
    uint64_t v30 = sub_18920DDF0(v28, (uint64_t)a2);
    uint64_t result = swift_release();
    int64_t v31 = *(void *)(*v29 + 16);
    if (v31 >= v30)
    {
      sub_18920E020(v30, v31);
      return v27(v37, 0LL);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_189208A80(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v70 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789D68);
  MEMORY[0x1895F8858](v6);
  uint64_t v64 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_189214E78();
  uint64_t v65 = *(void *)(v8 - 8);
  uint64_t v66 = v8;
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E10);
  MEMORY[0x1895F8858](v68);
  uint64_t v69 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_189214EB4();
  uint64_t v73 = *(void *)(v12 - 8);
  uint64_t v74 = v12;
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v67 = (_xpc_connection_s *)((char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x1895F8858](v15);
  v62 = (char *)&v59 - v18;
  uint64_t v19 = sub_189214D4C();
  uint64_t v71 = *(void *)(v19 - 8);
  uint64_t v72 = v19;
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  id v61 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v20);
  unint64_t v23 = (char *)&v59 - v22;
  uint64_t v24 = sub_189214F8C();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1895F8858](v24);
  uint64_t v27 = (uint64_t *)((char *)&v59 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v28 = *(void **)(v4 + 40);
  *uint64_t v27 = v28;
  (*(void (**)(void *, void, uint64_t))(v25 + 104))(v27, *MEMORY[0x18961B7F8], v24);
  id v29 = v28;
  LOBYTE(v28) = sub_189214FA4();
  uint64_t v30 = (*(uint64_t (**)(void *, uint64_t))(v25 + 8))(v27, v24);
  if ((v28 & 1) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v63 = v10;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v4 + 272LL))(v76, v30);
  uint64_t v31 = v77;
  if (v77)
  {
    uint64_t v32 = v78;
    __swift_project_boxed_opaque_existential_1(v76, v77);
    sub_189214DD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 56))(v23, v31, v32);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v23, v72);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
    uint64_t v33 = (_xpc_endpoint_s *)sub_189214DDC();
    uint64_t v25 = v74;
    if (!v33)
    {
      uint64_t v50 = sub_18920EC38();
      uint64_t v51 = v73;
      (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v17, v50, v25);
      os_log_type_t v52 = (os_log_s *)sub_189214E9C();
      os_log_type_t v53 = sub_189215094();
      if (os_log_type_enabled(v52, v53))
      {
        unint64_t v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v54 = 0;
        _os_log_impl(&dword_189200000, v52, v53, "Incoming task contains no XPC endpoint", v54, 2u);
        MEMORY[0x1895E3FF8](v54, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v17, v25);
      uint64_t v55 = v69;
      (*(void (**)(char *, void, uint64_t))(v65 + 104))(v69, *MEMORY[0x189610540], v66);
      swift_storeEnumTagMultiPayload();
      a2(v55);
      uint64_t v56 = (uint64_t)v55;
      return sub_18920D830(v56, &qword_18C789E10);
    }

    uint64_t v60 = (void (*)(uint64_t *))a2;
    uint64_t v34 = xpc_connection_create_from_endpoint(v33);
    xpc_connection_set_target_queue(v34, *(dispatch_queue_t *)(v4 + 48));
    swift_unknownObjectRetain();
    uint64_t v35 = (uint64_t)v61;
    sub_189214DD0();
    type metadata accessor for JQClientTask();
    swift_allocObject();
    a2 = (void (*)(char *))sub_18920D198((uint64_t)v34, v35);
    uint64_t v67 = v34;
    swift_unknownObjectRelease();
    uint64_t v36 = *(uint64_t (**)(uint64_t *))(*(void *)v4 + 256LL);
    swift_retain();
    unint64_t v23 = (char *)v36(v76);
    uint64_t v38 = v37;
    MEMORY[0x1895E3968]();
    if (*(void *)((*v38 & 0xFFFFFFFFFFFFFF8LL) + 0x10) < *(void *)((*v38 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1)
    {
LABEL_5:
      sub_189215040();
      sub_18921501C();
      ((void (*)(uint64_t *, void))v23)(v76, 0LL);
      uint64_t v39 = swift_allocObject();
      *(void *)(v39 + 16) = a2;
      *(void *)(v39 + 24) = v4;
      uint64_t v40 = *(void (**)(uint64_t (*)(), uint64_t))(*(void *)a2 + 112LL);
      swift_retain();
      swift_retain();
      v40(sub_18920D828, v39);
      uint64_t v41 = sub_18920EC38();
      uint64_t v42 = v73;
      unint64_t v43 = v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v62, v41, v25);
      swift_retain_n();
      unint64_t v44 = (os_log_s *)sub_189214E9C();
      os_log_type_t v45 = sub_189215088();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(_DWORD *)uint64_t v46 = 136446210;
        v76[0] = v47;
        (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))( v61,  (uint64_t)a2 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description,  v72);
        uint64_t v48 = sub_189214FBC();
        uint64_t v75 = sub_18920C8E0(v48, v49, v76);
        sub_189215154();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_189200000, v44, v45, "New task: %{public}s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E3FF8](v47, -1LL, -1LL);
        MEMORY[0x1895E3FF8](v46, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v73 + 8))(v62, v74);
      }

      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v25);
      }

      uint64_t v57 = (uint64_t *)v69;
      sub_189214CF8();
      swift_allocObject();
      *uint64_t v57 = sub_189214CEC();
      swift_storeEnumTagMultiPayload();
      v60(v57);
      swift_unknownObjectRelease();
      swift_release();
      swift_unknownObjectRelease();
      uint64_t v56 = (uint64_t)v57;
      return sub_18920D830(v56, &qword_18C789E10);
    }

LABEL_14:
    sub_189215028();
    goto LABEL_5;
  }

  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1892094B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain_n();
  uint64_t v9 = (os_log_s *)sub_189214E9C();
  os_log_type_t v10 = sub_189215088();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v26 = a2;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    v28[0] = v13;
    uint64_t v25 = v12 + 4;
    uint64_t v14 = sub_189214D40();
    uint64_t v27 = sub_18920C8E0(v14, v15, v28);
    sub_189215154();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v9, v10, "Task %{public}s completed", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v13, -1LL, -1LL);
    uint64_t v16 = v12;
    a2 = v26;
    MEMORY[0x1895E3FF8](v16, -1LL, -1LL);
  }

  else
  {

    swift_release_n();
  }

  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(uint64_t))(*(void *)a1 + 144LL))(v17);
  uint64_t v18 = *(uint64_t (**)(uint64_t *))(*(void *)a2 + 256LL);
  swift_retain();
  uint64_t v19 = (uint64_t (*)(uint64_t *, void))v18(v28);
  uint64_t v21 = v20;
  uint64_t v22 = sub_18920E288(v20, a1);
  uint64_t result = swift_release();
  if (*v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_189215208();
    uint64_t result = swift_bridgeObjectRelease();
    if (v24 >= v22) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v24 = *(void *)((*v21 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v24 >= v22)
    {
LABEL_6:
      sub_18920E5A0(v22, v24);
      return v19(v28, 0LL);
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_189209750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[1] = a4;
  uint64_t v24 = a2;
  uint64_t v7 = sub_189214E78();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  v23[0] = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)v23 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18920EAD8((unint64_t *)&qword_18C78A4C0, v17, MEMORY[0x189610588]);
  uint64_t v18 = sub_189215238();
  MEMORY[0x1895F8858](v18);
  uint64_t v20 = (char *)v23 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)v23 - v19, a1, v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v20, v7);
    (*(void (**)(char *, uint64_t))(*(void *)v4 + 488LL))(v13, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v20, a3);
    sub_189214CE0();
    xpc_dictionary_send_reply();
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, a3);
  }

uint64_t sub_1892099C4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_189209A2C(void *a1, uint64_t a2)
{
  uint64_t v91 = a2;
  uint64_t v94 = sub_189214E78();
  uint64_t v92 = *(void *)(v94 - 8);
  MEMORY[0x1895F8858](v94);
  v93 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  uint64_t v90 = (char *)&v85 - v8;
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v85 - v9;
  uint64_t v11 = sub_189214D34();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  uint64_t v18 = (char *)&v85 - v17;
  MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)&v85 - v19;
  xpc_object_t v96 = a1;
  sub_189214D28();
  uint64_t v21 = v10;
  uint64_t v89 = (uint64_t)v15;
  uint64_t v87 = v12;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v18, v11);
  sub_189214D1C();
  __swift_project_boxed_opaque_existential_1(v102, v103);
  swift_getDynamicType();
  uint64_t v22 = sub_189214E84();
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = v11;
  uint64_t v88 = v20;
  uint64_t v25 = v5;
  uint64_t v26 = v90;
  uint64_t v27 = v91;
  if (!v23)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v26, v29, v4);
    sub_18920D9C0((uint64_t)v102, (uint64_t)v100);
    uint64_t v30 = (os_log_s *)sub_189214E9C();
    os_log_type_t v31 = sub_189215094();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v99[0] = v33;
      *(_DWORD *)uint64_t v32 = 136446466;
      uint64_t v86 = (uint8_t *)(v32 + 4);
      __swift_project_boxed_opaque_existential_1(v100, v101);
      swift_getDynamicType();
      uint64_t v34 = sub_189215244();
      *(void *)&v97[0] = sub_18920C8E0(v34, v35, v99);
      uint64_t v89 = v25;
      sub_189215154();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v100);
      *(_WORD *)(v32 + 12) = 2082;
      uint64_t v36 = sub_189215244();
      *(void *)&v97[0] = sub_18920C8E0(v36, v37, v99);
      sub_189215154();
      swift_bridgeObjectRelease();
      _os_log_impl( &dword_189200000,  v30,  v31,  "Request '%{public}s' not permitted on connection '%{public}s'",  (uint8_t *)v32,  0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895E3FF8](v33, -1LL, -1LL);
      MEMORY[0x1895E3FF8](v32, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v26, v4);
    }

    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v100);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v4);
    }

    uint64_t v38 = v94;
    uint64_t v39 = v93;
    uint64_t v40 = v92;
    uint64_t v41 = v87;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v93, *MEMORY[0x189610530], v94);
    goto LABEL_9;
  }

  uint64_t v28 = 32LL;
  while (*(void *)(v22 + v28) != v91)
  {
    v28 += 16LL;
    if (!--v23) {
      goto LABEL_5;
    }
  }

  swift_bridgeObjectRelease();
  if (sub_189214D10() != v27)
  {
LABEL_13:
    sub_18920D9C0((uint64_t)v102, (uint64_t)v99);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789EA0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18920D9A8(v97, (uint64_t)v100);
      sub_18920D9C0((uint64_t)v100, (uint64_t)v99);
      __swift_project_boxed_opaque_existential_1(v99, v99[3]);
      swift_getDynamicType();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v99);
      sub_189214E00();
      uint64_t v48 = sub_189214FC8();
      swift_bridgeObjectRelease();
      id v49 = xpc_dictionary_get_value(v96, (const char *)(v48 + 32));
      swift_release();
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v100, v101);
      sub_189214DF4();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v100);
    }

    else
    {
      uint64_t v98 = 0LL;
      memset(v97, 0, sizeof(v97));
      sub_18920D830((uint64_t)v97, &qword_18C789EA8);
    }

    uint64_t v41 = v87;
    uint64_t v50 = (uint64_t *)v89;
    (*(void (**)(uint64_t, char *, uint64_t))(v87 + 16))(v89, v88, v24);
    int v51 = (*(uint64_t (**)(uint64_t *, uint64_t))(v41 + 88))(v50, v24);
    if (v51 == *MEMORY[0x1896103C8])
    {
      (*(void (**)(uint64_t *, uint64_t))(v41 + 96))(v50, v24);
      uint64_t v52 = *v50;
      uint64_t v53 = swift_allocObject();
      uint64_t v54 = v95;
      xpc_object_t v55 = v96;
      *(void *)(v53 + 16) = v95;
      *(void *)(v53 + 24) = v55;
      uint64_t v56 = v24;
      uint64_t v57 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(void *)v54 + 448LL);
      swift_retain();
      swift_unknownObjectRetain();
      uint64_t v58 = sub_18920D98C;
      goto LABEL_26;
    }

    if (v51 == *MEMORY[0x1896103F8])
    {
      (*(void (**)(uint64_t *, uint64_t))(v41 + 96))(v50, v24);
      uint64_t v52 = *v50;
      uint64_t v53 = swift_allocObject();
      uint64_t v59 = v95;
      xpc_object_t v60 = v96;
      *(void *)(v53 + 16) = v95;
      *(void *)(v53 + 24) = v60;
      uint64_t v56 = v24;
      uint64_t v57 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(void *)v59 + 456LL);
      swift_retain();
      swift_unknownObjectRetain();
      uint64_t v58 = sub_18920D92C;
      goto LABEL_26;
    }

    if (v51 == *MEMORY[0x189610400])
    {
      (*(void (**)(uint64_t *, uint64_t))(v41 + 96))(v50, v24);
      uint64_t v52 = *v50;
      uint64_t v53 = swift_allocObject();
      uint64_t v61 = v95;
      xpc_object_t v62 = v96;
      *(void *)(v53 + 16) = v95;
      *(void *)(v53 + 24) = v62;
      uint64_t v56 = v24;
      uint64_t v57 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(void *)v61 + 464LL);
      swift_retain();
      swift_unknownObjectRetain();
      uint64_t v58 = sub_18920D878;
      goto LABEL_26;
    }

    if (v51 == *MEMORY[0x1896103F0])
    {
      (*(void (**)(uint64_t *, uint64_t))(v41 + 96))(v50, v24);
      uint64_t v52 = *v50;
      uint64_t v53 = swift_allocObject();
      uint64_t v74 = v95;
      xpc_object_t v75 = v96;
      *(void *)(v53 + 16) = v95;
      *(void *)(v53 + 24) = v75;
      uint64_t v56 = v24;
      uint64_t v57 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(void *)v74 + 472LL);
      swift_retain();
      swift_unknownObjectRetain();
      uint64_t v58 = sub_18920D878;
LABEL_26:
      v57(v52, v58, v53);
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v88, v56);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v102);
    }

    if (v51 != *MEMORY[0x1896103E0] && v51 != *MEMORY[0x1896103D8])
    {
      uint64_t v81 = v92;
      uint64_t v82 = v93;
      uint64_t v83 = v94;
      (*(void (**)(char *, void, uint64_t))(v92 + 104))(v93, *MEMORY[0x189610548], v94);
      (*(void (**)(char *, xpc_object_t))(*(void *)v95 + 488LL))(v82, v96);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v83);
      uint64_t v84 = *(void (**)(char *, uint64_t))(v41 + 8);
      v84(v88, v24);
      v84((char *)v50, v24);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v102);
    }

    (*(void (**)(uint64_t *, uint64_t))(v41 + 96))(v50, v24);
    swift_release();
    uint64_t v40 = v92;
    uint64_t v39 = v93;
    uint64_t v38 = v94;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v93, *MEMORY[0x189610530], v94);
LABEL_9:
    (*(void (**)(char *, xpc_object_t))(*(void *)v95 + 488LL))(v39, v96);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v38);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v88, v24);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v102);
  }

  uint64_t v91 = v24;
  uint64_t v42 = swift_slowAlloc();
  xpc_dictionary_get_audit_token();
  uint64_t v43 = xpc_copy_entitlements_data_for_token();
  uint64_t v44 = v103;
  uint64_t v45 = v104;
  uint64_t v46 = __swift_project_boxed_opaque_existential_1(v102, v103);
  uint64_t v47 = (*(uint64_t (**)(void))(*(void *)v95 + 296LL))();
  LOBYTE(v44) = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)v47 + 80LL))( v46,  v43,  v44,  v45);
  swift_release();
  if ((v44 & 1) != 0)
  {
    swift_unknownObjectRelease();
    MEMORY[0x1895E3FF8](v42, -1LL, -1LL);
    uint64_t v24 = v91;
    goto LABEL_13;
  }

  uint64_t v90 = (char *)v43;
  uint64_t v63 = xpc_dictionary_get_remote_connection(v96);
  uint64_t v64 = sub_18920EC38();
  uint64_t v65 = v21;
  uint64_t v66 = v21;
  uint64_t v67 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v66, v64, v4);
  swift_unknownObjectRetain_n();
  uint64_t v68 = (os_log_s *)sub_189214E9C();
  os_log_type_t v69 = sub_189215094();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    uint64_t v89 = swift_slowAlloc();
    v100[0] = v89;
    *(_DWORD *)uint64_t v70 = 136446210;
    uint64_t v86 = v70 + 4;
    v99[0] = (uint64_t)v63;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789EB0);
    uint64_t v71 = sub_189214FBC();
    v99[0] = sub_18920C8E0(v71, v72, v100);
    sub_189215154();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v68, v69, "Peer is not appropriately entitled: %{public}s", v70, 0xCu);
    uint64_t v73 = v89;
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v73, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v70, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v25 + 8))(v65, v67);
  uint64_t v77 = v94;
  uint64_t v78 = v91;
  uint64_t v79 = v93;
  uint64_t v80 = v92;
  (*(void (**)(char *, void, uint64_t))(v92 + 104))(v93, *MEMORY[0x189610530], v94);
  (*(void (**)(char *, xpc_object_t))(*(void *)v95 + 488LL))(v79, v96);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v77);
  MEMORY[0x1895E3FF8](v42, -1LL, -1LL);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v78);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v102);
}

uint64_t sub_18920A844(uint64_t a1)
{
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_unknownObjectRetain_n();
  uint64_t v7 = (os_log_s *)sub_189214E9C();
  os_log_type_t v8 = sub_189215094();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = a1;
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    v14[1] = v9 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E90);
    uint64_t v11 = sub_189214FBC();
    uint64_t v15 = sub_18920C8E0(v11, v12, &v16);
    sub_189215154();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v7, v8, "Server error: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v10, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v9, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_18920AA24(uint64_t a1)
{
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_189214EF0();
  uint64_t result = swift_unknownObjectRelease();
  if (v6 == a1)
  {
    uint64_t v8 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = (os_log_s *)sub_189214E9C();
    os_log_type_t v10 = sub_189215094();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_189200000, v9, v10, "Client connection interrupted", v11, 2u);
      MEMORY[0x1895E3FF8](v11, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return result;
}

uint64_t sub_18920AB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_189214EB4();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  os_log_type_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = MEMORY[0x1895E416C](a1);
  if (v11 == sub_189214ECC()) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 512LL))(a1, a2, a3);
  }
  uint64_t v12 = MEMORY[0x1895E416C](a1);
  if (v12 == sub_189214EE4()) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 496LL))(a1, a2, a3);
  }
  uint64_t v13 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
  swift_unknownObjectRetain_n();
  uint64_t v14 = (os_log_s *)sub_189214E9C();
  os_log_type_t v15 = sub_189215094();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v22 = a1;
    uint64_t v23 = v17;
    *(_DWORD *)uint64_t v16 = 136446210;
    v21[1] = v16 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E90);
    uint64_t v18 = sub_189214FBC();
    uint64_t v22 = sub_18920C8E0(v18, v19, &v23);
    sub_189215154();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v14, v15, "Unexpected XPC: %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v17, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v16, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_18920AD90(_xpc_connection_s *a1)
{
  v4[4] = sub_18920DA2C;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 1107296256LL;
  v4[2] = sub_18920308C;
  v4[3] = &block_descriptor_64;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(a1, v3);
  _Block_release(v3);
  xpc_connection_set_target_queue(a1, *(dispatch_queue_t *)(v1 + 48));
  xpc_connection_activate(a1);
}

uint64_t sub_18920AE3C()
{
  v2[4] = sub_18920DA48;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 1107296256LL;
  v2[2] = sub_18920308C;
  v2[3] = &block_descriptor_67;
  uint64_t v0 = _Block_copy(v2);
  swift_retain();
  swift_release();
  xpc_remote_connection_set_event_handler();
  _Block_release(v0);
  xpc_remote_connection_set_target_queue();
  return xpc_remote_connection_activate();
}

uint64_t sub_18920AEE8()
{
  if (!*(void *)(v0 + 16)) {
    return 0LL;
  }
  uint64_t v1 = (_xpc_connection_s *)swift_unknownObjectRetain();
  xpc_endpoint_create(v1);
  sub_189214D10();
  swift_allocObject();
  uint64_t v2 = sub_189214D04();
  swift_unknownObjectRelease();
  return v2;
}

void sub_18920AF54()
{
  uint64_t v1 = *(_xpc_connection_s **)(v0 + 16);
  if (v1)
  {
    v3[4] = sub_18920DACC;
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 1107296256LL;
    v3[2] = sub_18920308C;
    v3[3] = &block_descriptor_70;
    uint64_t v2 = _Block_copy(v3);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    xpc_connection_set_event_handler(v1, v2);
    _Block_release(v2);
    xpc_connection_set_target_queue(v1, *(dispatch_queue_t *)(v0 + 48));
    xpc_connection_activate(v1);
    swift_unknownObjectRelease();
  }

uint64_t sub_18920B014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = MEMORY[0x1895E416C](a1);
  if (v8 == sub_189214ED8()) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 528LL))(a1);
  }
  uint64_t v9 = MEMORY[0x1895E416C](a1);
  if (v9 == sub_189214ECC()) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 504LL))(a1);
  }
  uint64_t v10 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  swift_unknownObjectRetain_n();
  uint64_t v11 = (os_log_s *)sub_189214E9C();
  os_log_type_t v12 = sub_189215094();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = a1;
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v18[1] = v13 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E90);
    uint64_t v15 = sub_189214FBC();
    uint64_t v19 = sub_18920C8E0(v15, v16, &v20);
    sub_189215154();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v11, v12, "XPC server got unexpected event: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v14, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v13, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_18920B24C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v4[4] = sub_18920DAD4;
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 1107296256LL;
    v4[2] = sub_18920308C;
    v4[3] = &block_descriptor_73;
    uint64_t v2 = _Block_copy(v4);
    id v3 = v1;
    swift_retain();
    swift_release();
    xpc_remote_connection_set_event_handler();
    _Block_release(v2);
    xpc_remote_connection_set_target_queue();
    xpc_remote_connection_activate();
  }

uint64_t sub_18920B308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = MEMORY[0x1895E416C](a1);
  if (v8 == sub_189214ECC()) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 504LL))(a1);
  }
  objc_opt_self();
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void (**)(uint64_t))(*(void *)a2 + 536LL);
    swift_unknownObjectRetain();
    v11(v10);
    return swift_unknownObjectRelease();
  }

  else
  {
    uint64_t v13 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
    swift_unknownObjectRetain_n();
    uint64_t v14 = (os_log_s *)sub_189214E9C();
    os_log_type_t v15 = sub_189215094();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v21 = a1;
      uint64_t v22 = v17;
      *(_DWORD *)unint64_t v16 = 136446210;
      v20[1] = v16 + 4;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C789E90);
      uint64_t v18 = sub_189214FBC();
      uint64_t v21 = sub_18920C8E0(v18, v19, &v22);
      sub_189215154();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_189200000, v14, v15, "RemoteXPC server got unexpected event: %{public}s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E3FF8](v17, -1LL, -1LL);
      MEMORY[0x1895E3FF8](v16, -1LL, -1LL);
    }

    else
    {

      swift_unknownObjectRelease_n();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

void sub_18920B57C()
{
  uint64_t v1 = sub_189214EB4();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = (void *)v0[4];
  if (v5)
  {
    uint64_t v6 = *(uint64_t (**)(void))(*v0 + 368LL);
    id v7 = v5;
    uint64_t v8 = (dispatch_group_s *)v6();
    dispatch_group_enter(v8);

    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v0;
    *(void *)(v9 + 24) = v7;
    aBlock[4] = sub_18920DB08;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_18920C67C;
    void aBlock[3] = &block_descriptor_79;
    uint64_t v10 = _Block_copy(aBlock);
    id v11 = v7;
    swift_retain();
    swift_release();
    xpc_event_publisher_set_handler();
    _Block_release(v10);
    xpc_event_publisher_activate();
  }

  else
  {
    uint64_t v12 = sub_18920EC38();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
    uint64_t v13 = (os_log_s *)sub_189214E9C();
    os_log_type_t v14 = sub_189215088();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl(&dword_189200000, v13, v14, "No XPC event publisher. Uncorking client communication.", v15, 2u);
      MEMORY[0x1895E3FF8](v15, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }

void sub_18920B740(int a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v118 = a5;
  v122 = a3;
  uint64_t v123 = a2;
  uint64_t v7 = sub_189214EB4();
  v124 = *(uint64_t (***)(void *, void *))(v7 - 8);
  v125 = (void *)v7;
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  v120 = (char *)&v113 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v113 - v11;
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  os_log_type_t v15 = (uint8_t **)((char *)&v113 - v14);
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  v121 = (uint64_t *)((char *)&v113 - v17);
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v119 = (char *)&v113 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v22 = (char *)&v113 - v21;
  MEMORY[0x1895F8858](v20);
  uint64_t v24 = (uint64_t *)((char *)&v113 - v23);
  uint64_t v25 = (void *)sub_189214F8C();
  uint64_t v26 = *(v25 - 1);
  MEMORY[0x1895F8858](v25);
  uint64_t v28 = (uint8_t **)((char *)&v113 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v29 = (void *)a4[5];
  *uint64_t v28 = v29;
  (*(void (**)(void *, void, void *))(v26 + 104))(v28, *MEMORY[0x18961B7F8], v25);
  id v30 = v29;
  LOBYTE(v29) = sub_189214FA4();
  (*(void (**)(void *, void *))(v26 + 8))(v28, v25);
  if ((v29 & 1) == 0)
  {
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }

  if (a1 == 2)
  {
    uint64_t v32 = sub_18920EC38();
    uint64_t v34 = v124;
    uint64_t v33 = v125;
    ((void (*)(void *, uint64_t, void *))v124[2])(v15, v32, v125);
    unint64_t v35 = (os_log_s *)sub_189214E9C();
    os_log_type_t v36 = sub_189215088();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl(&dword_189200000, v35, v36, "Initial XPC event subscribers all registered.", v37, 2u);
      MEMORY[0x1895E3FF8](v37, -1LL, -1LL);
    }

    uint64_t v38 = v34[1](v15, v33);
    uint64_t v39 = (dispatch_group_s *)(*(uint64_t (**)(uint64_t))(*a4 + 368LL))(v38);
    dispatch_group_leave(v39);

    return;
  }

  uint64_t v25 = v125;
  if (a1 != 1)
  {
    uint64_t v31 = v123;
    if (a1)
    {
      uint64_t v46 = sub_18920EC38();
      uint64_t v47 = (void (**)(char *, void *))v124;
      ((void (*)(char *, uint64_t, void *))v124[2])(v12, v46, v25);
      uint64_t v48 = (os_log_s *)sub_189214E9C();
      os_log_type_t v49 = sub_189215094();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        *(void *)&__int128 v128 = v51;
        *(_DWORD *)uint64_t v50 = 136446210;
        LODWORD(v127[0]) = a1;
        type metadata accessor for xpc_event_publisher_action_t();
        uint64_t v52 = sub_189214FBC();
        *(void *)&v127[0] = sub_18920C8E0(v52, v53, (uint64_t *)&v128);
        sub_189215154();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_189200000, v48, v49, "Unexpected XPC event publisher action: %{public}s", v50, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E3FF8](v51, -1LL, -1LL);
        MEMORY[0x1895E3FF8](v50, -1LL, -1LL);

        v47[1](v12, v125);
        return;
      }

      uint64_t v54 = v47[1];
      xpc_object_t v55 = (uint64_t *)v12;
    }

    else
    {
      if (v122)
      {
        sub_189214E54();
        swift_unknownObjectRetain();
        uint64_t v64 = sub_189214E48();
        swift_retain();
        id v65 = v118;
        uint64_t v66 = sub_189214D70();
        uint64_t v67 = v25;
        uint64_t v69 = v68;
        swift_release();
        uint64_t v70 = type metadata accessor for JQClientEventSubscriber();
        uint64_t v24 = (uint64_t *)swift_allocObject();
        void v24[2] = v31;
        v24[3] = (uint64_t)v65;
        v24[4] = v66;
        v24[5] = v69;
        uint64_t v71 = sub_18920EC38();
        unint64_t v72 = (void (**)(char *, void *))v124;
        ((void (*)(char *, uint64_t, void *))v124[2])(v22, v71, v67);
        swift_retain();
        uint64_t v73 = (os_log_s *)sub_189214E9C();
        os_log_type_t v74 = sub_189215088();
        BOOL v75 = os_log_type_enabled(v73, v74);
        v121 = (uint64_t *)v70;
        if (v75)
        {
          uint64_t v76 = (uint8_t *)swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          *(void *)&__int128 v128 = v77;
          uint64_t v123 = v64;
          *(_DWORD *)uint64_t v76 = 136446210;
          v120 = (char *)(v76 + 4);
          uint64_t v79 = v24[4];
          unint64_t v78 = v24[5];
          swift_bridgeObjectRetain();
          *(void *)&v127[0] = sub_18920C8E0(v79, v78, (uint64_t *)&v128);
          sub_189215154();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_189200000, v73, v74, "New XPC event stream subscriber: %{public}s", v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1895E3FF8](v77, -1LL, -1LL);
          MEMORY[0x1895E3FF8](v76, -1LL, -1LL);

          ((uint64_t (**)(char *, void *))v124)[1](v22, v125);
        }

        else
        {

          swift_release();
          v72[1](v22, v67);
        }

        uint64_t v94 = *(uint64_t (**)(__int128 *))(*a4 + 208LL);
        swift_retain();
        uint64_t v28 = (void *)v94(v127);
        uint64_t v25 = v95;
        os_log_type_t v15 = *v95;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v25 = v15;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          goto LABEL_74;
        }
        goto LABEL_31;
      }

      uint64_t v57 = sub_18920EC38();
      uint64_t v58 = v124;
      ((void (*)(uint64_t *, uint64_t, void *))v124[2])(v24, v57, v25);
      uint64_t v59 = (os_log_s *)sub_189214E9C();
      os_log_type_t v60 = sub_189215094();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = v25;
        xpc_object_t v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)xpc_object_t v62 = 0;
        _os_log_impl(&dword_189200000, v59, v60, "Event subscriber provided no descriptor.", v62, 2u);
        uint64_t v63 = v62;
        uint64_t v25 = v61;
        MEMORY[0x1895E3FF8](v63, -1LL, -1LL);
      }

      uint64_t v54 = (void (*)(char *, void *))v58[1];
      xpc_object_t v55 = v24;
    }

    v54((char *)v55, v25);
    return;
  }

  uint64_t v40 = (*(uint64_t (**)(_BYTE *))(*a4 + 208LL))(v131);
  uint64_t v28 = (void *)v40;
  v122 = v41;
  uint64_t v42 = *v41;
  os_log_type_t v15 = *(void **)(*v41 + 16LL);
  uint64_t v43 = v123;
  if (!v15)
  {
    int64_t v56 = 0LL;
    goto LABEL_39;
  }

  v120 = (char *)v40;
  swift_bridgeObjectRetain();
  unint64_t v44 = 0LL;
  uint64_t v45 = 72LL;
  uint64_t v24 = &qword_18C4FF980;
  while (1)
  {
    sub_18920D9C0(v42 + v45 - 40, (uint64_t)&v128);
    sub_18920D9C0((uint64_t)&v128, (uint64_t)v127);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF980);
    type metadata accessor for JQClientEventSubscriber();
LABEL_12:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v128);
    ++v44;
    v45 += 40LL;
    if (v15 == (void *)v44)
    {
      swift_bridgeObjectRelease();
      int64_t v56 = *(void *)(*v122 + 16LL);
      goto LABEL_38;
    }
  }

  uint64_t v28 = (void *)v126;
  if (*(void *)(v126 + 16) != v43)
  {
    swift_release();
    goto LABEL_12;
  }

  uint64_t v80 = (void *)sub_18920EC38();
  uint64_t v81 = (void (*)(void))v124[2];
  uint64_t v82 = v119;
  id v118 = v80;
  v117 = (void (*)(uint64_t *, id, void *))v81;
  v81(v119);
  swift_retain();
  uint64_t v83 = (os_log_s *)sub_189214E9C();
  os_log_type_t v84 = sub_189215088();
  v116 = v83;
  LODWORD(v115) = v84;
  if (os_log_type_enabled(v83, v84))
  {
    uint64_t v85 = (uint8_t *)swift_slowAlloc();
    uint64_t v114 = swift_slowAlloc();
    *(void *)&v127[0] = v114;
    *(_DWORD *)uint64_t v85 = 136446210;
    v113 = v85 + 4;
    uint64_t v87 = v28[4];
    unint64_t v86 = v28[5];
    swift_bridgeObjectRetain();
    uint64_t v88 = v87;
    uint64_t v89 = v125;
    uint64_t v126 = sub_18920C8E0(v88, v86, (uint64_t *)v127);
    uint64_t v25 = v89;
    uint64_t v43 = v123;
    sub_189215154();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v90 = v85;
    _os_log_impl( &dword_189200000,  v116,  (os_log_type_t)v115,  "Removing XPC event stream subscriber: %{public}s",  v85,  0xCu);
    uint64_t v91 = v114;
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v91, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v90, -1LL, -1LL);
    swift_release();

    uint64_t v92 = (uint64_t (**)(void *, void *))v124[1];
    v93 = v119;
  }

  else
  {

    swift_release_n();
    uint64_t v92 = (uint64_t (**)(void *, void *))v124[1];
    v93 = v82;
  }

  v124 = v92;
  ((void (*)(char *, void *))v92)(v93, v25);
  uint64_t v24 = v121;
  os_log_type_t v15 = v122;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v128);
  swift_bridgeObjectRelease();
  int64_t v56 = v44 + 1;
  if (__OFADD__(v44, 1LL))
  {
    __break(1u);
    return;
  }

  uint64_t v100 = *v15;
  unint64_t v101 = *(void *)(*v15 + 16LL);
  if (v56 != v101)
  {
    unint64_t v102 = v44 + 1;
    *(void *)&__int128 v99 = 136446210LL;
    __int128 v115 = v99;
    uint64_t v114 = MEMORY[0x18961AFC0] + 8LL;
    do
    {
      if (v102 >= v101) {
        goto LABEL_65;
      }
      sub_18920D9C0(v100 + v45, (uint64_t)&v128);
      sub_18920D9C0((uint64_t)&v128, (uint64_t)v127);
      if (swift_dynamicCast())
      {
        uint64_t v28 = (void *)v126;
        if (*(void *)(v126 + 16) == v43)
        {
          v117(v24, v118, v25);
          swift_retain();
          uint64_t v103 = (os_log_s *)sub_189214E9C();
          os_log_type_t v104 = sub_189215088();
          if (os_log_type_enabled(v103, v104))
          {
            uint64_t v105 = swift_slowAlloc();
            v119 = (char *)swift_slowAlloc();
            *(void *)&v127[0] = v119;
            *(_DWORD *)uint64_t v105 = v115;
            unint64_t v106 = v28[5];
            v116 = (os_log_s *)v28[4];
            swift_bridgeObjectRetain();
            *(void *)(v105 + 4) = sub_18920C8E0((uint64_t)v116, v106, (uint64_t *)v127);
            swift_release();
            v107 = v125;
            swift_bridgeObjectRelease();
            _os_log_impl( &dword_189200000,  v103,  v104,  "Removing XPC event stream subscriber: %{public}s",  (uint8_t *)v105,  0xCu);
            v108 = v119;
            swift_arrayDestroy();
            MEMORY[0x1895E3FF8](v108, -1LL, -1LL);
            uint64_t v109 = v105;
            uint64_t v25 = v107;
            uint64_t v43 = v123;
            MEMORY[0x1895E3FF8](v109, -1LL, -1LL);
            swift_release();
          }

          else
          {

            swift_release_n();
          }

          uint64_t v24 = v121;
          ((void (*)(uint64_t *, void *))v124)(v121, v25);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v128);
          os_log_type_t v15 = v122;
          int64_t v56 = v102 + 1;
          if (__OFADD__(v102, 1LL)) {
            goto LABEL_66;
          }
          goto LABEL_62;
        }

        swift_release();
      }

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v128);
      if (v102 != v44)
      {
        if ((v44 & 0x8000000000000000LL) != 0) {
          goto LABEL_68;
        }
        uint64_t v28 = (void *)*v15;
        os_log_type_t v15 = *(void **)(*v15 + 16LL);
        sub_18920D9C0((uint64_t)&v28[5 * v44 + 4], (uint64_t)&v128);
        sub_18920D9C0((uint64_t)&v28[(unint64_t)v45 / 8], (uint64_t)v127);
        char v110 = swift_isUniquelyReferenced_nonNull_native();
        os_log_type_t v15 = v122;
        void *v122 = v28;
        if ((v110 & 1) == 0)
        {
          uint64_t v28 = sub_18920D11C(v28);
          void *v15 = v28;
        }

        if (v44 >= v28[2]) {
          goto LABEL_71;
        }
        v28 += 5 * v44 + 4;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
        sub_18920D9A8(v127, (uint64_t)v28);
        uint64_t v111 = *v15;
        void *v15 = *v15;
        if (v102 >= *(void *)(v111 + 16)) {
          goto LABEL_72;
        }
        uint64_t v28 = (void *)(v111 + v45);
        __swift_destroy_boxed_opaque_existential_1Tm(v111 + v45);
        sub_18920D9A8(&v128, (uint64_t)v28);
      }

      if (__OFADD__(v44++, 1LL)) {
        goto LABEL_67;
      }
      int64_t v56 = v102 + 1;
      if (__OFADD__(v102, 1LL)) {
        goto LABEL_66;
      }
LABEL_62:
      uint64_t v100 = *v15;
      unint64_t v101 = *(void *)(*v15 + 16LL);
      ++v102;
      v45 += 40LL;
    }

    while (v56 != v101);
  }

  os_log_type_t v15 = (void *)v44;
LABEL_38:
  uint64_t v28 = v120;
  if (v56 >= (uint64_t)v15)
  {
LABEL_39:
    sub_18920E020((uint64_t)v15, v56);
    ((void (*)(_BYTE *, void))v28)(v131, 0LL);
    return;
  }

LABEL_73:
  __break(1u);
LABEL_74:
  os_log_type_t v15 = sub_18920C7C0(0LL, v15[2] + 1LL, 1, v15);
  *uint64_t v25 = v15;
LABEL_31:
  unint64_t v98 = v15[2];
  unint64_t v97 = v15[3];
  if (v98 >= v97 >> 1)
  {
    os_log_type_t v15 = sub_18920C7C0((void *)(v97 > 1), v98 + 1, 1, v15);
    *uint64_t v25 = v15;
  }

  v129 = v121;
  v130 = &off_18A365100;
  *(void *)&__int128 v128 = v24;
  v15[2] = v98 + 1;
  sub_18920D9A8(&v128, (uint64_t)&v15[5 * v98 + 4]);
  ((void (*)(__int128 *, void))v28)(v127, 0LL);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

uint64_t sub_18920C67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v7(a2, a3, a4);
  swift_release();
  return swift_unknownObjectRelease();
}

id *JQServer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18920D830((uint64_t)(v0 + 11), (uint64_t *)&unk_18C4FF608);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t JQServer.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

BOOL sub_18920C790(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_18920C7A4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_18920C7B4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_18920C7C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF988);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v10 = (void *)MEMORY[0x18961AFE8];
      uint64_t v12 = (void *)(MEMORY[0x18961AFE8] + 32LL);
    }

    sub_18920DCE4(0LL, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

uint64_t sub_18920C8E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18920C9B0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_18920E88C((uint64_t)v12, *a3);
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
      sub_18920E88C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_18920C9B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_189215160();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
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

uint64_t sub_18920CB68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18920CBFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18920CDD4(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18920CDD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18920CBFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_18920CD70(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18921519C();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1892151FC();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_189214FE0();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_189215214();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1892151FC();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_18920CD70(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A1C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18920CDD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A1C0);
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

LABEL_30:
  uint64_t result = sub_189215214();
  __break(1u);
  return result;
}

uint64_t sub_18920CF20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_18920CF3C(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_18920CF3C(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
    goto LABEL_19;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A1E8);
  uint64_t v10 = *(void *)(sub_189214D4C() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v14 - v12 == 0x8000000000000000LL && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_189214D4C() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }

    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }

LABEL_36:
  uint64_t result = sub_189215214();
  __break(1u);
  return result;
}

void *sub_18920D11C(void *a1)
{
  return sub_18920C7C0(0LL, a1[2], 0, a1);
}

void sub_18920D130(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_189215208();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1895E3B0CLL);
}

uint64_t sub_18920D198(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)(v2 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect);
  void *v4 = 0LL;
  v4[1] = 0LL;
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = v2 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_description;
  uint64_t v6 = sub_189214D4C();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC19JobQuiescenceServer12JQClientTask_onDisconnect);
  swift_beginAccess();
  uint64_t v9 = *v8;
  *uint64_t v8 = 0LL;
  v8[1] = 0LL;
  swift_unknownObjectRetain();
  sub_18920327C(v9);
  uint64_t v10 = *(_xpc_connection_s **)(v2 + 16);
  aBlock[4] = sub_18920EA10;
  uint64_t v15 = v2;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_18920308C;
  void aBlock[3] = &block_descriptor_91;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v10, v11);
  _Block_release(v11);
  xpc_connection_activate(v10);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_connection_send_message(v10, empty);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_18920D320(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4FF608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18920D368(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_18920D3A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v32 = sub_1892150D0();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x1895F8858](v32);
  uint64_t v29 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_1892150C4();
  MEMORY[0x1895F8858](v11);
  uint64_t v12 = sub_189214F38();
  MEMORY[0x1895F8858](v12);
  uint64_t v13 = MEMORY[0x18961AFE8];
  *(void *)(v4 + 64) = MEMORY[0x18961AFE8];
  *(void *)(v4 + 72) = v13;
  *(void *)(v4 + 80) = v13;
  uint64_t v14 = v13;
  type metadata accessor for JQClientAuthentication();
  *(_OWORD *)(v4 + 104) = 0u;
  *(void *)(v4 + 120) = 0LL;
  *(_OWORD *)(v4 + 88) = 0u;
  uint64_t v31 = v4 + 88;
  *(void *)(v4 + 128) = JQClientAuthentication.__allocating_init()();
  type metadata accessor for JQSystemInterface();
  *(void *)(v4 + 136) = JQSystemInterface.__allocating_init()();
  *(void *)(v4 + 144) = os_transaction_create();
  *(void *)(v4 + 152) = dispatch_group_create();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 40) = a4;
  v28[3] = a4;
  v28[0] = sub_18920D368(0LL, &qword_18C4FF618);
  id v15 = a3;
  id v16 = a4;
  swift_unknownObjectRetain();
  id v17 = a2;
  sub_189214F20();
  v33[0] = v14;
  v28[2] = sub_18920EAD8(&qword_18C4FF620, (uint64_t (*)(uint64_t))MEMORY[0x18961B8A8], MEMORY[0x18961B8C0]);
  v28[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF628);
  sub_18920E9D0(&qword_18C4FF630, &qword_18C4FF628, MEMORY[0x189618470]);
  sub_189215184();
  uint64_t v18 = *MEMORY[0x18961B900];
  uint64_t v19 = v29;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 104);
  v20(v29, v18, v32);
  uint64_t v21 = (void *)sub_1892150F4();
  *(void *)(v4 + 48) = v21;
  sub_189214F2C();
  v33[0] = MEMORY[0x18961AFE8];
  id v22 = v21;
  sub_189215184();
  v20(v19, v18, v32);
  *(void *)(v4 + 56) = sub_1892150F4();
  uint64_t v23 = type metadata accessor for JQServerStateIdle();
  uint64_t v24 = swift_retain();
  uint64_t v25 = sub_189211538(v24);
  v33[3] = v23;
  v33[4] = &off_18A3654E8;
  v33[0] = v25;
  uint64_t v26 = v31;
  swift_beginAccess();
  sub_18920EA30((uint64_t)v33, v26, (uint64_t *)&unk_18C4FF608);
  swift_endAccess();
  sub_1892061E4();
  return v5;
}

uint64_t sub_18920D720()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for JQServerStateIdle();
  uint64_t v3 = swift_retain();
  v5[3] = v2;
  v5[4] = &off_18A3654E8;
  v5[0] = sub_189211538(v3);
  return (*(uint64_t (**)(void *))(*(void *)v1 + 280LL))(v5);
}

uint64_t sub_18920D780()
{
  return sub_189206B80(*(dispatch_group_s **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t type metadata accessor for JQClientRequester()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for JQClientXpcSubscriber()
{
  return objc_opt_self();
}

uint64_t sub_18920D7CC()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B3C8]);
}

uint64_t sub_18920D7D8()
{
  return sub_1892087A8(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t type metadata accessor for JQClientTask()
{
  uint64_t result = qword_18C78A750;
  if (!qword_18C78A750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18920D81C()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B3C8]);
}

uint64_t sub_18920D828()
{
  return sub_1892094B8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_18920D830(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_18920D86C()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B458]);
}

uint64_t sub_18920D878(uint64_t a1)
{
  return sub_18920D8A0(a1, (uint64_t (*)(uint64_t))MEMORY[0x1896103A0], &qword_18C78A1B8, MEMORY[0x189610390]);
}

uint64_t sub_18920D894()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B458]);
}

uint64_t sub_18920D8A0(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v10 = *(void *)(v4 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 480LL);
  uint64_t v12 = a2(0LL);
  uint64_t v13 = sub_18920EAD8(a3, a2, a4);
  return v11(a1, v9, v12, v13);
}

uint64_t sub_18920D920()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B458]);
}

uint64_t sub_18920D92C(uint64_t a1)
{
  return sub_18920D8A0(a1, (uint64_t (*)(uint64_t))MEMORY[0x189610480], &qword_18C78A1B0, MEMORY[0x189610478]);
}

uint64_t sub_18920D948()
{
  return objectdestroy_45Tm((void (*)(void))MEMORY[0x18961B458]);
}

uint64_t objectdestroy_45Tm(void (*a1)(void))
{
  return swift_deallocObject();
}

uint64_t sub_18920D98C(uint64_t a1)
{
  return sub_18920D8A0(a1, (uint64_t (*)(uint64_t))MEMORY[0x189610378], &qword_18C78A1A8, MEMORY[0x189610370]);
}

uint64_t sub_18920D9A8(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_18920D9C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_18920DA2C(uint64_t a1)
{
  return sub_18920DA64(a1, (uint64_t (*)(uint64_t))MEMORY[0x1896103C0], &qword_18C78A1A0, MEMORY[0x1896103B8]);
}

uint64_t sub_18920DA48(uint64_t a1)
{
  return sub_18920DA64(a1, MEMORY[0x1896104B0], &qword_18C78A198, MEMORY[0x1896104A8]);
}

uint64_t sub_18920DA64(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v9 = a2(0LL);
  uint64_t v10 = sub_18920EAD8(a3, a2, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v4 + 520LL))(a1, v9, v10);
}

uint64_t sub_18920DACC(uint64_t a1)
{
  return sub_18920B014(a1, v1);
}

uint64_t sub_18920DAD4(uint64_t a1)
{
  return sub_18920B308(a1, v1);
}

uint64_t sub_18920DADC()
{
  return swift_deallocObject();
}

void sub_18920DB08(int a1, uint64_t a2, void *a3)
{
}

uint64_t sub_18920DB10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_18920DB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t sub_18920DB20(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for JQClientEventSubscriber()
{
  return objc_opt_self();
}

uint64_t sub_18920DB48()
{
  return type metadata accessor for JQClientTask();
}

uint64_t sub_18920DB50()
{
  uint64_t result = sub_189214D4C();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for JQServer()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQServer.clientAuth.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296LL))();
}

uint64_t dispatch thunk of JQServer.clientAuth.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304LL))();
}

uint64_t dispatch thunk of JQServer.clientAuth.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312LL))();
}

uint64_t dispatch thunk of JQServer.systemInterface.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320LL))();
}

uint64_t dispatch thunk of JQServer.systemInterface.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328LL))();
}

uint64_t dispatch thunk of JQServer.systemInterface.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336LL))();
}

uint64_t dispatch thunk of JQServer.__allocating_init(localServer:remoteServer:eventPublisher:queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of JQServer.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408LL))();
}

uint64_t dispatch thunk of JQServer.handle(remoteClient:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536LL))();
}

uint64_t dispatch thunk of JQServer.createJQXPCConnection()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544LL))();
}

ValueMetadata *type metadata accessor for JQServer.Defaults()
{
  return &type metadata for JQServer.Defaults;
}

uint64_t sub_18920DC80()
{
  return sub_18920640C(v0);
}

uint64_t sub_18920DC88()
{
  return sub_189206624(v0);
}

void type metadata accessor for xpc_event_publisher_action_t()
{
  if (!qword_18C78A1F8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C78A1F8);
    }
  }

uint64_t sub_18920DCE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF980);
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_189215214();
  __break(1u);
  return result;
}

uint64_t sub_18920DDF0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  if (!v3) {
    return 0LL;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = 0LL;
  for (uint64_t i = 56LL; ; i += 40LL)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v2 + i - 24), *(void *)(v2 + i));
    uint64_t v8 = sub_18921522C();
    swift_unknownObjectRelease();
    if (v8 == a2) {
      break;
    }
    if (v3 == ++v6)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v2 + 16);
    }
  }

  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1LL))
  {
    unint64_t v10 = *(void *)(v2 + 16);
    if (v6 + 1 == v10) {
      return v6;
    }
    uint64_t v11 = i + 16;
    for (unint64_t j = v6 + 1; j < v10; ++j)
    {
      sub_18920D9C0(v2 + v11, (uint64_t)&v22);
      __swift_project_boxed_opaque_existential_1(&v22, v23);
      uint64_t v13 = sub_18921522C();
      swift_unknownObjectRelease();
      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v22);
      if (v13 != a2)
      {
        if (j != v6)
        {
          if ((v6 & 0x8000000000000000LL) != 0) {
            goto LABEL_29;
          }
          uint64_t v14 = (void *)*a1;
          unint64_t v15 = *(void *)(*a1 + 16);
          if (v6 >= v15) {
            goto LABEL_30;
          }
          uint64_t result = sub_18920D9C0((uint64_t)&v14[5 * v6 + 4], (uint64_t)&v22);
          if (j >= v15) {
            goto LABEL_31;
          }
          sub_18920D9C0((uint64_t)v14 + v11, (uint64_t)v21);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          *a1 = (uint64_t)v14;
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_18920D11C(v14);
            uint64_t v14 = (void *)result;
            *a1 = result;
          }

          if (v6 >= v14[2]) {
            goto LABEL_32;
          }
          uint64_t v16 = (uint64_t)&v14[5 * v6 + 4];
          __swift_destroy_boxed_opaque_existential_1Tm(v16);
          uint64_t result = sub_18920D9A8(v21, v16);
          uint64_t v17 = *a1;
          if (j >= *(void *)(*a1 + 16)) {
            goto LABEL_33;
          }
          uint64_t v18 = v17 + v11;
          __swift_destroy_boxed_opaque_existential_1Tm(v17 + v11);
          uint64_t result = sub_18920D9A8(&v22, v18);
        }

        if (__OFADD__(v6++, 1LL)) {
          goto LABEL_28;
        }
      }

      unint64_t v20 = j + 1;
      if (__OFADD__(j, 1LL)) {
        goto LABEL_27;
      }
      uint64_t v2 = *a1;
      unint64_t v10 = *(void *)(*a1 + 16);
      v11 += 40LL;
      if (v20 == v10) {
        return v6;
      }
    }

    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_18920E020(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16LL);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0LL, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_18920C7C0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF980);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000LL) == 0)
  {
    uint64_t v16 = (char *)&v4[5 * a2 + 4];
    if (a1 != a2 || &v4[5 * a1 + 4] >= (void *)&v16[40 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[5 * a1 + 4], v16, 40 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }

    goto LABEL_27;
  }

LABEL_28:
  uint64_t result = sub_189215214();
  __break(1u);
  return result;
}

uint64_t sub_18920E19C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v6 = MEMORY[0x1895E3B00](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }

      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }

      if (__OFADD__(v5, 1LL)) {
        break;
      }
      if (++v5 == v4) {
        return 0LL;
      }
    }

    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_189215208();
    swift_bridgeObjectRelease();
  }

  return 0LL;
}

uint64_t sub_18920E288(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_18920E19C(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1LL)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_189215208();
      swift_bridgeObjectRelease();
      if (v9 != v22) {
        goto LABEL_6;
      }
    }

    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001LL) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000LL) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
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
          goto LABEL_55;
        }

        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1LL)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_189215208();
          swift_bridgeObjectRelease();
        }

        else
        {
          uint64_t v18 = *(void *)((*a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        }

        if (v9 == v18) {
          return v6;
        }
      }

      uint64_t v19 = MEMORY[0x1895E3B00](i - 4);
      swift_unknownObjectRelease();
      if (v19 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1LL)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }

      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v13 = MEMORY[0x1895E3B00](v6, *a1);
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001LL) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000LL) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v14 = *(void *)(v9 + 8 * i);
          swift_retain();
          goto LABEL_19;
        }
      }

      else
      {
        if ((v6 & 0x8000000000000000LL) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v13 = *(void *)(v9 + 8 * v6 + 32);
        swift_retain();
        if ((v9 & 0xC000000000000001LL) == 0) {
          goto LABEL_16;
        }
      }

      uint64_t v14 = MEMORY[0x1895E3B00](i - 4, v9);
      unint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000LL) != 0
        || (v9 & 0x4000000000000000LL) != 0)
      {
        sub_18920D130(v9);
      }

      *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 8 * v6 + 0x20) = v14;
      swift_release();
      sub_18921501C();
      unint64_t v9 = *a1;
      int v16 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v16 || (v9 & 0x8000000000000000LL) != 0 || (v9 & 0x4000000000000000LL) != 0) {
        sub_18920D130(v9);
      }
      if ((v11 & 0x8000000000000000LL) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 8 * i) = v13;
      swift_release();
      sub_18921501C();
      goto LABEL_30;
    }

    return v6;
  }

  unint64_t v20 = *a1;
  if (!(v20 >> 62)) {
    return *(void *)((v20 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_189215208();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_18920E5A0(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    unint64_t v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }

  swift_bridgeObjectRetain();
  uint64_t v19 = sub_189215208();
  swift_bridgeObjectRelease();
  if (v19 < v2) {
    goto LABEL_31;
  }
LABEL_4:
  uint64_t v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  uint64_t v6 = v4 - v2;
  if (__OFSUB__(0LL, v7))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_189215208();
    swift_bridgeObjectRelease();
    uint64_t v9 = v8 + v6;
    if (!__OFADD__(v8, v6)) {
      goto LABEL_8;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_189215208();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }

  unint64_t v5 = *v3;
  if (*v3 >> 62) {
    goto LABEL_34;
  }
  uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  uint64_t v9 = v8 - v7;
  if (__OFADD__(v8, v6)) {
    goto LABEL_36;
  }
LABEL_8:
  unint64_t v5 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v5;
  uint64_t v8 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000LL) == 0 && (v5 & 0x4000000000000000LL) == 0)
  {
    uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8LL;
    if (v9 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v8 = 1LL;
  }

  if (v5 >> 62) {
    goto LABEL_37;
  }
  uint64_t v12 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
LABEL_15:
  if (v12 <= v9) {
    uint64_t v12 = v9;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = MEMORY[0x1895E3B0C](v8, v12, 1LL, v5);
  swift_bridgeObjectRelease();
  *uint64_t v3 = v5;
  uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8LL;
LABEL_18:
  type metadata accessor for JQClientTask();
  swift_arrayDestroy();
  if (!v6) {
    return sub_18921501C();
  }
  if (!(v5 >> 62))
  {
    uint64_t v13 = *(void *)(v11 + 16);
    uint64_t v14 = v13 - v2;
    if (!__OFSUB__(v13, v2)) {
      goto LABEL_21;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  swift_bridgeObjectRetain();
  uint64_t v20 = sub_189215208();
  swift_bridgeObjectRelease();
  uint64_t v14 = v20 - v2;
  if (__OFSUB__(v20, v2)) {
    goto LABEL_40;
  }
LABEL_21:
  if ((v14 & 0x8000000000000000LL) == 0)
  {
    uint64_t v15 = (const void *)(v11 + 32 + 8 * v2);
    if (!(v5 >> 62))
    {
      uint64_t v16 = *(void *)(v11 + 16);
      uint64_t v17 = v16 + v6;
      if (!__OFADD__(v16, v6))
      {
LABEL_27:
        *(void *)(v11 + 16) = v17;
        return sub_18921501C();
      }

      goto LABEL_43;
    }

LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_189215208();
    swift_bridgeObjectRelease();
    uint64_t v17 = v21 + v6;
    if (!__OFADD__(v21, v6)) {
      goto LABEL_27;
    }
LABEL_43:
    __break(1u);
  }

  uint64_t result = sub_189215214();
  __break(1u);
  return result;
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

uint64_t sub_18920E88C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_18920E8CC()
{
  uint64_t result = (*(void *(**)(void *__return_ptr))(*(void *)v0 + 272LL))(v4);
  uint64_t v2 = v5;
  if (v5)
  {
    uint64_t v3 = v6;
    __swift_project_boxed_opaque_existential_1(v4, v5);
    (*(void (**)(uint64_t, uint64_t))(v3 + 72))(v2, v3);
    return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18920E93C()
{
  return swift_deallocObject();
}

void sub_18920E968(void *a1)
{
}

unint64_t sub_18920E974()
{
  unint64_t result = qword_18C78A1D8;
  if (!qword_18C78A1D8)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C78A1D0);
    uint64_t v2 = &protocol witness table for Bool;
    unint64_t result = MEMORY[0x1895E3F5C](&protocol conformance descriptor for <A> A?, v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C78A1D8);
  }

  return result;
}

uint64_t sub_18920E9D0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E3F5C](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void (*sub_18920EA10(uint64_t a1))(void)
{
  return sub_1892047E8(a1, v1, "Unexpected message from task: %{public}s");
}

uint64_t sub_18920EA30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_18920EA74(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

void (*sub_18920EAB8(uint64_t a1))(void)
{
  return sub_1892047E8(a1, v1, "Unexpected message from subscriber: %{public}s");
}

uint64_t sub_18920EAD8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E3F5C](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_18920EB18()
{
}

uint64_t sub_18920EBBC()
{
  uint64_t v0 = sub_189214EB4();
  __swift_allocate_value_buffer(v0, qword_18C4FFBC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C4FFBC8);
  sub_18921242C();
  swift_bridgeObjectRetain();
  return sub_189214EA8();
}

uint64_t sub_18920EC38()
{
  if (qword_18C4FFBC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_189214EB4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_18C4FFBC8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t static Array<A>.transformForDefaultsRead(_:)(uint64_t a1)
{
  if (!v5[3])
  {
    sub_18920D830((uint64_t)v5, &qword_18C78A2C0);
    return 0LL;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2C8);
  uint64_t v1 = swift_dynamicCast();
  if ((v1 & 1) == 0) {
    return 0LL;
  }
  v5[0] = v4;
  MEMORY[0x1895F8858](v1);
  sub_18920EE90();
  uint64_t v2 = sub_189214FEC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_18920EDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18920EE1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  sub_18920E88C(a1, (uint64_t)v5);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v2, v3);
  return sub_18920D830((uint64_t)v5, &qword_18C78A2C0);
}

unint64_t sub_18920EE90()
{
  unint64_t result = qword_18C78A2D0;
  if (!qword_18C78A2D0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C78A2C8);
    unint64_t result = MEMORY[0x1895E3F5C](MEMORY[0x189618470], v1);
    atomic_store(result, (unint64_t *)&qword_18C78A2D0);
  }

  return result;
}

uint64_t Array<A>.transformForDefaultsWrite()@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v11[5] = a1;
  v11[2] = a2;
  v11[3] = a3;
  uint64_t v5 = sub_18921504C();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2D8);
  uint64_t v7 = MEMORY[0x1895E3F5C](MEMORY[0x189618488], v5);
  uint64_t v9 = sub_18920F074( (void (*)(char *, char *))sub_18920EF88,  (uint64_t)v11,  v5,  v6,  MEMORY[0x18961A520],  v7,  MEMORY[0x18961A528],  v8);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2E0);
  a4[3] = result;
  *a4 = v9;
  return result;
}

uint64_t sub_18920EF88@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = sub_18920EFC0(a1, *(void *)(v2 + 16), *(void *)(v2 + 24));
  *a2 = sub_189210CD0;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_18920EFC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return v9;
}

uint64_t sub_18920F074( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a5;
  uint64_t v31 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v29 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v29 - v13;
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v32 = *(void *)(v17 - 8);
  uint64_t v33 = v17;
  MEMORY[0x1895F8858](v17);
  uint64_t v19 = (char *)&v29 - v18;
  uint64_t v20 = sub_189215064();
  if (!v20) {
    return sub_189215034();
  }
  uint64_t v36 = AssociatedTypeWitness;
  uint64_t v21 = v20;
  uint64_t v44 = sub_1892151E4();
  uint64_t v34 = sub_1892151F0();
  sub_1892151CC();
  uint64_t v37 = v8;
  uint64_t result = sub_189215058();
  if ((v21 & 0x8000000000000000LL) == 0)
  {
    uint64_t v23 = v21;
    unint64_t v35 = v16;
    while (v23)
    {
      uint64_t v41 = v23;
      uint64_t v24 = (void (*)(char *, void))sub_18921507C();
      uint64_t v25 = *(void (**)(char *))(v11 + 16);
      uint64_t v26 = v11;
      uint64_t v27 = v36;
      v25(v14);
      v24(v43, 0LL);
      uint64_t v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }

      uint64_t v42 = 0LL;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_1892151D8();
      uint64_t result = sub_189215070();
      uint64_t v23 = v41 - 1;
      uint64_t v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_18920F364@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return Array<A>.transformForDefaultsWrite()(*v3, *(void *)(a1 + 16), *(void *)(a2 - 8), a3);
}

uint64_t sub_18920F378@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Array<A>.transformForDefaultsRead(_:)(a1);
  *a2 = result;
  return result;
}

uint64_t static Optional<A>.transformForDefaultsRead(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_189215148();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)v21 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18920EDD4(a1, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2C0);
  int v16 = swift_dynamicCast();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v16)
  {
    v17(v12, 0LL, 1LL, a2);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a2);
    v21[3] = a2;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(boxed_opaque_existential_0, v15, a2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(a3 + 16))(v21, a2, a3);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a2);
    sub_18920D830((uint64_t)v21, &qword_18C78A2C0);
    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v19 = 1LL;
    v17(v12, 1LL, 1LL, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, v19, 1LL, v8);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }

  return v1;
}

uint64_t Optional<A>.transformForDefaultsWrite()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v7[2] = *(void *)(a1 + 16);
  v7[3] = a2;
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2C0);
  uint64_t v4 = swift_allocObject();
  *a3 = v4;
  return sub_18920F658( (void (*)(char *, char *))sub_18920F624,  (uint64_t)v7,  MEMORY[0x18961A520],  MEMORY[0x18961AFC0] + 8LL,  v5,  v4 + 16);
}

uint64_t sub_18920F624()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 8LL))(*(void *)(v0 + 16));
}

uint64_t sub_18920F658@<X0>( void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v26 = a5;
  uint64_t v27 = a2;
  uint64_t v28 = a1;
  uint64_t v29 = a6;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v10);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1LL, v14) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56LL))( v29,  1LL,  1LL,  a4);
  }
  uint64_t v25 = a3;
  uint64_t v24 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v12, v25);
  }
  return result;
}

uint64_t sub_18920F7F0()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  }
  return swift_deallocObject();
}

uint64_t sub_18920F81C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return Optional<A>.transformForDefaultsWrite()(a1, *(void *)(a2 - 8), a3);
}

uint64_t sub_18920F824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return static Optional<A>.transformForDefaultsRead(_:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), a4);
}

uint64_t static PrimitiveDefaultsValueTransformable.transformForDefaultsRead(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))( a3,  v5 ^ 1u,  1LL,  a2);
}

uint64_t PrimitiveDefaultsValueTransformable.transformForDefaultsWrite()@<X0>( uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = a1;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))( boxed_opaque_existential_0,  v2,  a1);
}

uint64_t sub_18920F8D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  a2[3] = a1;
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18920F8EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = swift_dynamicCast();
  uint64_t v4 = v6[4];
  uint64_t v5 = v6[5];
  if (!(_DWORD)result)
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
  }

  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_18920F954@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  a2[3] = result;
  *a2 = v3;
  return result;
}

double sub_18920F968@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = *v2;
  *(void *)(a2 + 24) = a1;
  *(double *)a2 = result;
  return result;
}

uint64_t sub_18920F978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = swift_dynamicCast();
  uint64_t v4 = v5[4];
  if (!(_DWORD)result) {
    uint64_t v4 = 0LL;
  }
  *(void *)a2 = v4;
  *(_BYTE *)(a2 + 8) = result ^ 1;
  return result;
}

uint64_t sub_18920F9E4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v3 = *v2;
  *(void *)(a2 + 24) = result;
  *(_BYTE *)a2 = v3;
  return result;
}

uint64_t sub_18920F9F4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t result = swift_dynamicCast();
  char v4 = v5[39];
  if (!(_DWORD)result) {
    char v4 = 2;
  }
  *a2 = v4;
  return result;
}

uint64_t sub_18920FA5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  a2[3] = a1;
  *a2 = v4;
  a2[1] = v3;
  return sub_189210C34(v4, v3);
}

double sub_18920FA70@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if ((swift_dynamicCast() & 1) == 0)
  {
    double result = 0.0;
    *a2 = xmmword_189215B00;
  }

  return result;
}

BOOL Optional.isNil.getter(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 48LL))(v1, 1LL) == 1;
}

uint64_t sub_18920FB08()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_18920FB34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 36));
}

uint64_t DefaultsBackedProperty.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v20 = a2;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(v6 + 16);
  uint64_t v10 = sub_189215148();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v19 - v12;
  uint64_t v14 = *(void **)(v3 + *(int *)(a1 + 40));
  uint64_t v15 = (void *)sub_189214FB0();
  id v16 = objc_msgSend(v14, sel_valueForKey_, v15);

  if (v16)
  {
    sub_18921516C();
    swift_unknownObjectRelease();
  }

  else
  {
    memset(v21, 0, sizeof(v21));
  }

  (*(void (**)(_OWORD *, uint64_t))(*(void *)(a1 + 24) + 16LL))(v21, v9);
  sub_18920D830((uint64_t)v21, &qword_18C78A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v3, a1);
  uint64_t v17 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 1LL, v9) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 16))(v20, &v8[*(int *)(a1 + 36)], v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v20, v13, v9);
  }

uint64_t sub_18920FD1C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5 = type metadata accessor for DefaultsBackedProperty(0LL, *(void *)(a2 + a1 - 16), *(void *)(a2 + a1 - 8), a3);
  return DefaultsBackedProperty.wrappedValue.getter(v5, a4);
}

uint64_t sub_18920FD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + a3 - 16);
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v12 - v6;
  (*(void (**)(char *))(v8 + 16))((char *)&v12 - v6);
  uint64_t v10 = type metadata accessor for DefaultsBackedProperty(0LL, v4, v5, v9);
  return DefaultsBackedProperty.wrappedValue.setter((uint64_t)v7, v10);
}

uint64_t DefaultsBackedProperty.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C78A2E8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_18920D9A8(v16, (uint64_t)v18);
    uint64_t v8 = v19;
    uint64_t v9 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9) & 1) != 0)
    {
      uint64_t v10 = *(void **)(v2 + *(int *)(a2 + 40));
      uint64_t v11 = (void *)sub_189214FB0();
      objc_msgSend(v10, sel_removeObjectForKey_, v11);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }

  else
  {
    uint64_t v17 = 0LL;
    memset(v16, 0, sizeof(v16));
    sub_18920D830((uint64_t)v16, qword_18C78A2F0);
  }

  uint64_t v13 = *(void **)(v2 + *(int *)(a2 + 40));
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)(a2 + 24) + 8LL))(v18, v5);
  __swift_project_boxed_opaque_existential_1(v18, v19);
  uint64_t v14 = sub_18921522C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  uint64_t v15 = (void *)sub_189214FB0();
  objc_msgSend(v13, sel_setValue_forKey_, v14, v15);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
}

void (*DefaultsBackedProperty.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 + 16);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  void v5[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  void v5[5] = v9;
  DefaultsBackedProperty.wrappedValue.getter(a2, (uint64_t)v9);
  return sub_189210038;
}

void sub_189210038(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    DefaultsBackedProperty.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }

  else
  {
    DefaultsBackedProperty.wrappedValue.setter((*a1)[5], *v2);
  }

  free(v4);
  free(v3);
  free(v2);
}

void sub_1892100D0()
{
  id v0 = objc_allocWithZone(MEMORY[0x189604038]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_189214FB0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2) {
    __break(1u);
  }
}

void sub_189210150( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  *(void *)a6 = a1;
  *((void *)a6 + 1) = a2;
  uint64_t v9 = type metadata accessor for DefaultsBackedProperty(0LL, a4, a5, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(&a6[*(int *)(v9 + 36)], a3, a4);
  sub_189212454();
  id v10 = objc_allocWithZone(MEMORY[0x189604038]);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_189214FB0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithSuiteName_, v11);

  if (v12) {
    *(void *)&a6[*(int *)(v9 + 40)] = v12;
  }
  else {
    __break(1u);
  }
}

uint64_t type metadata accessor for DefaultsBackedProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for DefaultsBackedProperty);
}

void DefaultsBackedProperty<>.init(key:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189215220();
  sub_189210150(a1, a2, (uint64_t)v11, a3, a4, a5);
}

uint64_t static DefaultsValueTransformable<>.transformForDefaultsRead(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v22 = a5;
  uint64_t v21 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_189215148();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v11);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v15);
  uint64_t v19 = (char *)&v21 - v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a1, AssociatedTypeWitness, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1LL, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))( v22,  1LL,  1LL,  a2);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v13, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, AssociatedTypeWitness);
    sub_189215004();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, AssociatedTypeWitness);
  }

uint64_t DefaultsValueTransformable<>.transformForDefaultsWrite()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  size_t v8 = (char *)&v10 - v7;
  sub_189214FF8();
  (*(void (**)(uint64_t, uint64_t))(a4 + 8))(AssociatedTypeWitness, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
}

uint64_t sub_189210538()
{
  return 16LL;
}

__n128 sub_189210544(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of DefaultsValueTransformable.transformForDefaultsWrite()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DefaultsValueTransformable.transformForDefaultsRead(_:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of AnyOptional.isNil.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_189210568()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_189210570()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1892105F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7LL;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8LL) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }

  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    uint64_t v15 = *(void **)((v7 + v13) & 0xFFFFFFFFFFFFF8LL);
    *(void *)((v7 + v12) & 0xFFFFFFFFFFFFF8LL) = v15;
    id v16 = v15;
  }

  return a1;
}

void sub_1892106DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  unint64_t v5 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
}

void *sub_189210744(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  uint64_t v11 = *(void *)(v6 + 64) + 7LL;
  uint64_t v12 = (void *)((v11 + v8) & 0xFFFFFFFFFFFFF8LL);
  uint64_t v13 = *(void **)((v11 + v9) & 0xFFFFFFFFFFFFF8LL);
  *uint64_t v12 = v13;
  id v14 = v13;
  return a1;
}

void *sub_1892107D8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  uint64_t v10 = *(void *)(v6 + 64) + 7LL;
  uint64_t v11 = (void **)((v10 + v8) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v12 = *(void **)((v10 + v9) & 0xFFFFFFFFFFFFF8LL);
  uint64_t v13 = *v11;
  *uint64_t v11 = v12;
  id v14 = v12;

  return a1;
}

_OWORD *sub_189210884(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  uint64_t v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(void *)((*(void *)(v4 + 64) + 7LL + v6) & 0xFFFFFFFFFFFFF8LL) = *(void *)((*(void *)(v4 + 64) + 7LL + v7) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

void *sub_189210904(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 64) + 7LL;
  uint64_t v12 = (void **)((v11 + v9) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v13 = *v12;
  *uint64_t v12 = *(void **)((v11 + v10) & 0xFFFFFFFFFFFFF8LL);

  return a1;
}

uint64_t sub_18921099C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 16) & ~v7);
    }

    else
    {
      unint64_t v12 = *(void *)(a1 + 8);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }
  }

  else
  {
    if (((((*(void *)(v4 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_189210A28 + 4 * byte_189215B10[v10]))();
  }

void sub_189210AA8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    int v10 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v8 = a3 - v6 + 1;
    }
    else {
      unsigned int v8 = 2;
    }
    if (v8 >= 0x10000) {
      int v9 = 4;
    }
    else {
      int v9 = 2;
    }
    if (v8 < 0x100) {
      int v9 = 1;
    }
    if (v8 >= 2) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X13 }
  }

  if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v11 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8);
    *a1 = v11;
  }

  __asm { BR              X10 }

void sub_189210BB0()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x189210C1CLL);
}

void sub_189210BB8(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x189210BC0LL);
  }
  JUMPOUT(0x189210C1CLL);
}

void sub_189210BD4()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x189210C1CLL);
}

void sub_189210BDC()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x189210C1CLL);
}

void sub_189210BE4(uint64_t a1, int a2, int a3)
{
  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if (a3 < 0) {
      JUMPOUT(0x189210BF0LL);
    }
    if (a2 < 0) {
      JUMPOUT(0x189210C14LL);
    }
    *(void *)(v3 + 8) = (a2 - 1);
  }

  JUMPOUT(0x189210C1CLL);
}

uint64_t sub_189210C34(uint64_t a1, unint64_t a2)
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

uint64_t sub_189210C78()
{
  return swift_deallocObject();
}

uint64_t sub_189210CD0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 8LL))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E3F14](a1, v6, a5);
}

uint64_t sub_189210D34()
{
  uint64_t v0 = sub_189214EB4();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1895F8858](v0);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v2);
  unsigned int v6 = (char *)v18 - v5;
  uint64_t v7 = sub_18920EC38();
  unsigned int v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v8(v6, v7, v0);
  int v9 = (os_log_s *)sub_189214E9C();
  os_log_type_t v10 = sub_1892150AC();
  if (os_log_type_enabled(v9, v10))
  {
    unsigned int v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v11 = 0;
    _os_log_impl(&dword_189200000, v9, v10, "Initiating system shutdown.", v11, 2u);
    MEMORY[0x1895E3FF8](v11, -1LL, -1LL);
  }

  unint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v6, v0);
  uint64_t result = reboot(8);
  if ((_DWORD)result)
  {
    int v14 = MEMORY[0x1895E3854]();
    v8(v4, v7, v0);
    uint64_t v15 = (os_log_s *)sub_189214E9C();
    os_log_type_t v16 = sub_1892150A0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 67109120;
      void v18[3] = v14;
      sub_189215154();
      _os_log_impl(&dword_189200000, v15, v16, "Failed to initiate shutdown: %d", v17, 8u);
      MEMORY[0x1895E3FF8](v17, -1LL, -1LL);
    }

    return ((uint64_t (*)(char *, uint64_t))v12)(v4, v0);
  }

  return result;
}

uint64_t JQSystemInterface.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t JQSystemInterface.init()()
{
  return v0;
}

uint64_t JQSystemInterface.deinit()
{
  return v0;
}

uint64_t JQSystemInterface.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JQSystemInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQSystemInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQSystemInterface.shutdown()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80LL))();
}

uint64_t dispatch thunk of JQSystemInterface.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t JQServerStateIdle.server.getter()
{
  return swift_retain();
}

uint64_t sub_189210FA0()
{
  return 1701602409LL;
}

uint64_t JQServerStateIdle.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_189210FDC(uint64_t a1)
{
  uint64_t v46 = sub_189214DC4();
  uint64_t v2 = *(void *)(v46 - 8);
  MEMORY[0x1895F8858](v46);
  uint64_t v4 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_189214C80();
  MEMORY[0x1895F8858](v5);
  uint64_t v43 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for QuiesceContext();
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v44 = (uint64_t)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  unsigned int v11 = (char *)v38 - v10;
  uint64_t v12 = sub_189214EB4();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_18920EC38();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v42 = v12;
  v17(v15, v16, v12);
  swift_retain_n();
  uint64_t v18 = (os_log_s *)sub_189214E9C();
  os_log_type_t v19 = sub_189215088();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v39 = v11;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v40 = v4;
    uint64_t v23 = v22;
    v48[0] = v22;
    uint64_t v41 = v2;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v24 = sub_189214C8C();
    v38[1] = v7;
    uint64_t v47 = sub_18920C8E0(v24, v25, v48);
    uint64_t v2 = v41;
    sub_189215154();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189200000, v18, v19, "Client %s initiated quiescence.", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v23;
    uint64_t v4 = v40;
    MEMORY[0x1895E3FF8](v26, -1LL, -1LL);
    uint64_t v27 = v21;
    unsigned int v11 = v39;
    MEMORY[0x1895E3FF8](v27, -1LL, -1LL);
  }

  else
  {

    swift_release_n();
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v42);
  uint64_t v28 = *(void *)(v45 + 16);
  uint64_t v29 = *(uint64_t (**)(uint64_t))(*(void *)v28 + 192LL);
  uint64_t v30 = swift_retain();
  uint64_t v31 = *(void *)(v29(v30) + 16);
  swift_bridgeObjectRelease();
  uint64_t v32 = (uint64_t)v43;
  sub_189211DF4();
  sub_189211DF8(v32, a1, v31, (uint64_t)v11);
  uint64_t v33 = type metadata accessor for JQServerStateNotifySubscribers();
  uint64_t v34 = v44;
  sub_18921137C((uint64_t)v11, v44);
  uint64_t v35 = swift_retain();
  uint64_t v36 = sub_189214A38(v35, v34);
  v48[3] = v33;
  v48[4] = (uint64_t)&off_18A365690;
  v48[0] = (uint64_t)v36;
  (*(void (**)(uint64_t *))(*(void *)v28 + 280LL))(v48);
  swift_retain();
  sub_189214C98();
  swift_release();
  (*(void (**)(char *))(*(void *)v28 + 416LL))(v4);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v46);
  return sub_1892113C0((uint64_t)v11);
}

uint64_t sub_18921137C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuiesceContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1892113C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuiesceContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1892113FC()
{
  uint64_t v0 = sub_189214EB4();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = (os_log_s *)sub_189214E9C();
  os_log_type_t v6 = sub_1892150A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_189200000, v5, v6, "State machine received unexpected event", v7, 2u);
    MEMORY[0x1895E3FF8](v7, -1LL, -1LL);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1892114F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x189610460];
  uint64_t v3 = sub_189214DA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104LL))(a1, v2, v3);
}

void *sub_189211538(uint64_t a1)
{
  uint64_t result = (void *)swift_allocObject();
  result[3] = 1701602409LL;
  result[4] = 0xE400000000000000LL;
  result[2] = a1;
  return result;
}

void *sub_189211578(uint64_t a1)
{
  v1[3] = 1701602409LL;
  v1[4] = 0xE400000000000000LL;
  v1[2] = a1;
  return v1;
}

uint64_t JQServerStateIdle.deinit()
{
  return v0;
}

uint64_t JQServerStateIdle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1892115E4()
{
  return swift_retain();
}

uint64_t sub_1892115F0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104LL))();
}

uint64_t sub_189211618()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128LL))();
}

uint64_t sub_189211640()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136LL))();
}

uint64_t sub_189211668()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96LL))();
}

uint64_t sub_189211690()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160LL))();
}

uint64_t type metadata accessor for JQServerStateIdle()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQServerStateIdle()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_1892116E4()
{
  return 0xD000000000000018LL;
}

uint64_t sub_189211760(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_189214DC4();
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v7);
  uint64_t v12 = (char *)v44 - v11;
  uint64_t v13 = *(void *)(a3 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v10);
  uint64_t v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  os_log_type_t v19 = (char *)v44 - v18;
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  uint64_t v22 = (char *)v44 - v21;
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  uint64_t v26 = (char *)v44 - v25;
  if (!a2) {
    return 0LL;
  }
  uint64_t v46 = v24;
  uint64_t v47 = v23;
  uint64_t v48 = a3;
  uint64_t v27 = a1;
  uint64_t v28 = swift_unknownObjectRetain();
  uint64_t v29 = a2;
  uint64_t v30 = MEMORY[0x1895E416C](v28);
  if (v30 != sub_189214EC0()) {
    goto LABEL_3;
  }
  if (!xpc_data_get_bytes_ptr(v29)) {
    goto LABEL_3;
  }
  xpc_data_get_length(v29);
  xpc_object_t v45 = (xpc_object_t)xpc_create_from_plist();
  if (!v45) {
    goto LABEL_3;
  }
  v44[1] = v29;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v34 = v27;
  uint64_t v35 = v27;
  uint64_t v36 = v48;
  v33(v26, v35, v48);
  sub_189214CB0();
  if (!swift_dynamicCast())
  {
    v33(v22, v34, v36);
    sub_189214D58();
    if (swift_dynamicCast())
    {
      swift_release();
      uint64_t v49 = 0LL;
      unint64_t v50 = 0xE000000000000000LL;
      sub_189215190();
      swift_bridgeObjectRelease();
      uint64_t v41 = "com.apple.jobquiescence.initiate";
LABEL_17:
      BOOL v31 = xpc_dictionary_get_BOOL(v45, v41);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return v31;
    }

    v33(v19, v34, v36);
    sub_189214D88();
    if (swift_dynamicCast())
    {
      swift_release();
      uint64_t v49 = 0LL;
      unint64_t v50 = 0xE000000000000000LL;
      sub_189215190();
      swift_bridgeObjectRelease();
      uint64_t v41 = "com.apple.jobquiescence.subscribe";
      goto LABEL_17;
    }

    v33(v16, v34, v36);
    sub_189214DE8();
    int v42 = swift_dynamicCast();
    xpc_object_t v43 = v45;
    if (v42)
    {
      swift_release();
      uint64_t v49 = 0LL;
      unint64_t v50 = 0xE000000000000000LL;
      sub_189215190();
      swift_bridgeObjectRelease();
      BOOL v31 = xpc_dictionary_get_BOOL(v43, "com.apple.jobquiescence.subscribe");
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return v31;
    }

    swift_unknownObjectRelease();
LABEL_3:
    swift_unknownObjectRelease();
    return 0LL;
  }

  uint64_t v49 = 0LL;
  unint64_t v50 = 0xE000000000000000LL;
  sub_189215190();
  swift_bridgeObjectRelease();
  xpc_object_t v37 = v45;
  if (!xpc_dictionary_get_BOOL(v45, "com.apple.jobquiescence.initiate"))
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    return 0LL;
  }

  sub_189214C98();
  sub_189214DB8();
  sub_189211BC0();
  uint64_t v38 = v47;
  char v39 = sub_189215178();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v46 + 8);
  v40(v9, v38);
  v40(v12, v38);
  if ((v39 & 1) != 0)
  {
    uint64_t v49 = 0LL;
    unint64_t v50 = 0xE000000000000000LL;
    sub_189215190();
    swift_bridgeObjectRelease();
    BOOL v31 = xpc_dictionary_get_BOOL(v37, "com.apple.jobquiescence.initiate.shutdown");
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
  }

  else
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    return 1LL;
  }

  return v31;
}

unint64_t sub_189211BC0()
{
  unint64_t result = qword_18C789E00;
  if (!qword_18C789E00)
  {
    uint64_t v1 = sub_189214DC4();
    unint64_t result = MEMORY[0x1895E3F5C](MEMORY[0x1896104A0], v1);
    atomic_store(result, (unint64_t *)&qword_18C789E00);
  }

  return result;
}

uint64_t JQClientAuthentication.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t JQClientAuthentication.init()()
{
  return v0;
}

uint64_t JQClientAuthentication.deinit()
{
  return v0;
}

uint64_t JQClientAuthentication.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JQClientAuthentication()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQClientAuthentication()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQClientAuthentication.authenticate<A>(request:clientEntitlementsData:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80LL))();
}

uint64_t dispatch thunk of JQClientAuthentication.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void OS_dispatch_group.with(_:)(void (*a1)(void))
{
}

uint64_t sub_189211CB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_189214C80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_189211CEC()
{
  return swift_retain();
}

uint64_t type metadata accessor for QuiesceContext()
{
  uint64_t result = qword_18C78A9E0;
  if (!qword_18C78A9E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_189211D48()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for QuiesceContext() + 24));
}

uint64_t sub_189211D68()
{
  return 0LL;
}

uint64_t sub_189211D70()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_189211D90(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for QuiesceContext() + 28);
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_189211DCC())()
{
  return nullsub_1;
}

uint64_t sub_189211DF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for QuiesceContext();
  uint64_t v9 = v8[7];
  *(void *)(a4 + v9) = 0LL;
  uint64_t v10 = sub_189214C80();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a4, a1, v10);
  *(void *)(a4 + v8[5]) = a2;
  *(void *)(a4 + v8[6]) = a3;
  swift_retain();
  sub_189215190();
  swift_bridgeObjectRelease();
  sub_189214C8C();
  sub_189214FD4();
  swift_bridgeObjectRelease();
  sub_189214FD4();
  sub_189214FC8();
  swift_bridgeObjectRelease();
  uint64_t v12 = os_transaction_create();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  swift_release();
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(a4 + v9) = v12;
  return result;
}

uint64_t sub_189211F44(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_189211F4C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_189211F54(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_189211F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_189211F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_189211F7C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_189211F84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_189211F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t sub_189211F94(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t *sub_189211F9C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_189214C80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_retain();
    swift_unknownObjectRetain();
  }

  return a1;
}

uint64_t sub_189212044(uint64_t a1)
{
  uint64_t v2 = sub_189214C80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_189212094(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_189214C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_189212110(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_189214C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1892121A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_189214C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_189212214(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_189214C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  uint64_t v7 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_189212294()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1892122A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_189214C80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_18921231C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_189212328(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_189214C80();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_1892123A0()
{
  uint64_t result = sub_189214C80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

void *sub_18921242C()
{
  return &unk_18A365550;
}

unint64_t JQDLogSubsystem.getter()
{
  return 0xD000000000000017LL;
}

void *sub_189212454()
{
  return &unk_18A365560;
}

unint64_t JQDServiceName.getter()
{
  return 0xD000000000000017LL;
}

void *sub_18921247C()
{
  return &unk_189215E60;
}

uint64_t JQDServiceVersion.getter()
{
  return 1LL;
}

uint64_t JQServerStatePermanentlyQuiesced.server.getter()
{
  return swift_retain();
}

unint64_t sub_189212498()
{
  return 0xD000000000000014LL;
}

uint64_t JQServerStatePermanentlyQuiesced.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1892124E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_context;
  swift_beginAccess();
  return sub_18921137C(v3, a1);
}

uint64_t sub_189212530(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_context;
  swift_beginAccess();
  sub_189212588(a1, v3);
  return swift_endAccess();
}

uint64_t sub_189212588(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuiesceContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1892125CC())()
{
  return j__swift_endAccess;
}

double sub_189212610()
{
  return *(double *)(v0 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_timeElapsed);
}

uint64_t sub_189212620()
{
  uint64_t v1 = (uint64_t (*)(_BYTE *, void))(*(uint64_t (**)(_BYTE *))(*(void *)v0 + 128LL))(v4);
  *(void *)(v2 + *(int *)(type metadata accessor for QuiesceContext() + 28)) = 0LL;
  swift_unknownObjectRelease();
  return v1(v4, 0LL);
}

uint64_t sub_18921267C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for QuiesceContext();
  MEMORY[0x1895F8858](v2);
  uint64_t v25 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_189214EB4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain_n();
  uint64_t v9 = (os_log_s *)sub_189214E9C();
  os_log_type_t v10 = sub_189215088();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v4;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v13;
    uint64_t v23 = v2;
    uint64_t v24 = v0;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = sub_189214C8C();
    uint64_t v26 = sub_18920C8E0(v14, v15, &v27);
    uint64_t v2 = v23;
    uint64_t v1 = v24;
    sub_189215154();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl( &dword_189200000,  v9,  v10,  "Client %s requested to initiate quiescence after quiescence was already achieved.",  v12,  0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v13, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v12, -1LL, -1LL);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v22);
  }

  else
  {

    swift_release_n();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  double v17 = *(double *)((char *)v1 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_timeElapsed);
  if ((~*(void *)&v17 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v17 <= -1.0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if (v17 < 1.84467441e19)
  {
    uint64_t v18 = v1[2];
    unint64_t v19 = (unint64_t)v17;
    uint64_t v20 = (uint64_t)v25;
    (*(void (**)(uint64_t))(*v1 + 112LL))(result);
    uint64_t v21 = *(void *)(v20 + *(int *)(v2 + 24));
    sub_1892113C0(v20);
    return (*(uint64_t (**)(unint64_t, uint64_t))(*(void *)v18 + 432LL))(v19, v21);
  }

LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_189212928()
{
  uint64_t v0 = sub_189214E78();
  sub_189212C10();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  *MEMORY[0x189610558],  v0);
  return swift_willThrow();
}

void *sub_189212994(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  void v6[3] = 0xD000000000000014LL;
  v6[4] = 0x8000000189216770LL;
  v6[2] = a1;
  sub_189212C58(a2, (uint64_t)v6 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_context);
  *(double *)((char *)v6 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_timeElapsed) = a3;
  return v6;
}

void *sub_189212A20(uint64_t a1, uint64_t a2, double a3)
{
  v3[3] = 0xD000000000000014LL;
  v3[4] = 0x8000000189216770LL;
  v3[2] = a1;
  sub_189212C58(a2, (uint64_t)v3 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_context);
  *(double *)((char *)v3 + OBJC_IVAR____TtC19JobQuiescenceServer32JQServerStatePermanentlyQuiesced_timeElapsed) = a3;
  return v3;
}

uint64_t JQServerStatePermanentlyQuiesced.deinit()
{
  return v0;
}

uint64_t JQServerStatePermanentlyQuiesced.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_189212AF8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160LL))();
}

uint64_t sub_189212B20()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 168LL))();
}

uint64_t sub_189212B48()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 176LL))();
}

uint64_t sub_189212B70()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 184LL))();
}

uint64_t sub_189212B98()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 192LL))();
}

uint64_t sub_189212BC0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136LL))();
}

uint64_t sub_189212BE8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 200LL))();
}

unint64_t sub_189212C10()
{
  unint64_t result = qword_18C78A4C0;
  if (!qword_18C78A4C0)
  {
    uint64_t v1 = sub_189214E78();
    unint64_t result = MEMORY[0x1895E3F5C](MEMORY[0x189610588], v1);
    atomic_store(result, (unint64_t *)&qword_18C78A4C0);
  }

  return result;
}

uint64_t sub_189212C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuiesceContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_189212C9C()
{
  return type metadata accessor for JQServerStatePermanentlyQuiesced();
}

uint64_t type metadata accessor for JQServerStatePermanentlyQuiesced()
{
  uint64_t result = qword_18C78A9F0;
  if (!qword_18C78A9F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_189212CE0()
{
  uint64_t result = type metadata accessor for QuiesceContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t method lookup function for JQServerStatePermanentlyQuiesced()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_189212D7C()
{
  return swift_retain();
}

unint64_t sub_189212D84()
{
  return 0xD000000000000011LL;
}

uint64_t sub_189212DA0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_189212DD4(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_189212E18())()
{
  return j__swift_endAccess;
}

uint64_t sub_189212E54@<X0>(uint64_t a1@<X8>)
{
  return sub_18921137C(v1 + OBJC_IVAR____TtC19JobQuiescenceServer25JQServerStateWaitForTasks_context, a1);
}

uint64_t sub_189212E68()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_189214C80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_189214EB4();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v22[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = (os_log_s *)sub_189214E9C();
  os_log_type_t v12 = sub_189215094();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_189200000, v11, v12, "Server timed out waiting for quiescence tasks.", v13, 2u);
    MEMORY[0x1895E3FF8](v13, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_189214C74();
  sub_189214C68();
  double v15 = v14;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((~*(void *)&v15 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  if (v15 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (v15 < 1.84467441e19)
  {
    uint64_t v17 = *(void *)(v1 + 16);
    (*(void (**)(unint64_t))(*(void *)v17 + 424LL))((unint64_t)v15);
    uint64_t v18 = type metadata accessor for JQServerStateIdle();
    uint64_t v19 = swift_retain();
    uint64_t v20 = sub_189211538(v19);
    v22[3] = v18;
    v22[4] = &off_18A3654E8;
    v22[0] = v20;
    return (*(uint64_t (**)(void *))(*(void *)v17 + 280LL))(v22);
  }

LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_189213074()
{
  uint64_t v43 = sub_189214F08();
  uint64_t v38 = *(void *)(v43 - 8);
  uint64_t v1 = MEMORY[0x1895F8858](v43);
  int v42 = (uint64_t *)((char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v1);
  uint64_t v41 = (uint64_t *)((char *)&v36 - v3);
  uint64_t v40 = sub_189214F50();
  uint64_t v37 = *(void *)(v40 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v40);
  unint64_t v50 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  char v39 = (char *)&v36 - v6;
  uint64_t v7 = sub_189214F14();
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  MEMORY[0x1895F8858](v7);
  xpc_object_t v45 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_189214F38();
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_189215100();
  uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x18961B978];
  uint64_t v14 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v44 = sub_189213FC4();
  uint64_t v17 = *(void **)(*(void *)(v0 + 16) + 40LL);
  aBlock[0] = MEMORY[0x18961AFE8];
  sub_18920EAD8((unint64_t *)&unk_18C789D70, v13, MEMORY[0x18961B998]);
  id v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A4B0);
  sub_1892140F8(&qword_18C789D80, (uint64_t *)&unk_18C78A4B0);
  sub_189215184();
  sub_18921510C();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
  uint64_t ObjectType = swift_getObjectType();
  aBlock[4] = sub_189214000;
  uint64_t v52 = v0;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_189202BDC;
  void aBlock[3] = &block_descriptor_0;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  sub_189214F20();
  uint64_t v21 = v45;
  sub_189202C44();
  sub_189215118();
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v21, v49);
  uint64_t v22 = v11;
  uint64_t v23 = v50;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v22, v47);
  swift_release();
  sub_189214F44();
  uint64_t v49 = v0;
  type metadata accessor for QuiesceContext();
  uint64_t result = sub_189214CA4();
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v25 = v41;
    uint64_t *v41 = result;
    uint64_t v26 = v38;
    uint64_t v27 = *(void (**)(uint64_t *, void, uint64_t))(v38 + 104);
    uint64_t v28 = v43;
    v27(v25, *MEMORY[0x18961B670], v43);
    uint64_t v29 = v39;
    MEMORY[0x1895E38F0](v23, v25);
    uint64_t v48 = ObjectType;
    uint64_t v30 = *(void (**)(uint64_t *, uint64_t))(v26 + 8);
    v30(v25, v28);
    BOOL v31 = *(void (**)(char *, uint64_t))(v37 + 8);
    uint64_t v32 = v40;
    v31(v23, v40);
    v27(v25, *MEMORY[0x18961B660], v28);
    uint64_t v33 = v42;
    uint64_t *v42 = 0LL;
    v27(v33, *MEMORY[0x18961B650], v28);
    MEMORY[0x1895E3A94](v29, v25, v33, v48);
    v30(v33, v28);
    v30(v25, v28);
    v31(v29, v32);
    sub_189215130();
    uint64_t v34 = *(void (**)(uint64_t))(*(void *)v49 + 120LL);
    uint64_t v35 = swift_unknownObjectRetain();
    v34(v35);
    return swift_unknownObjectRelease();
  }

  return result;
}

uint64_t sub_1892134DC()
{
  if ((*(uint64_t (**)(void))(*(void *)v0 + 112LL))())
  {
    swift_getObjectType();
    sub_189215124();
    swift_unknownObjectRelease();
  }

  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))(0LL);
}

uint64_t sub_189213528()
{
  uint64_t v0 = sub_189214EB4();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  swift_retain_n();
  uint64_t v5 = (os_log_s *)sub_189214E9C();
  os_log_type_t v6 = sub_189215088();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v14 = v0;
    uint64_t v8 = (uint8_t *)v7;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_189214C8C();
    uint64_t v15 = sub_18920C8E0(v10, v11, &v16);
    sub_189215154();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl( &dword_189200000,  v5,  v6,  "Client %s requested to initiate quiescence after quiescence was already in progress.",  v8,  0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v9, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v8, -1LL, -1LL);

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v14);
  }

  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }

uint64_t sub_189213700()
{
  uint64_t v0 = sub_189214E78();
  sub_18920EAD8( (unint64_t *)&qword_18C78A4C0,  (uint64_t (*)(uint64_t))MEMORY[0x189610578],  MEMORY[0x189610588]);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  *MEMORY[0x189610558],  v0);
  return swift_willThrow();
}

uint64_t sub_189213784()
{
  uint64_t v0 = type metadata accessor for QuiesceContext();
  MEMORY[0x1895F8858](v0);
  uint64_t v2 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_189214DC4();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  uint64_t v40 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_189214C80();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_189214EB4();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v16 = (os_log_s *)sub_189214E9C();
  os_log_type_t v17 = sub_189215088();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = v3;
    uint64_t v19 = v0;
    uint64_t v20 = v2;
    uint64_t v21 = v18;
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_189200000, v16, v17, "Zero tasks remaining. Quiescence achieved.", v18, 2u);
    uint64_t v22 = v21;
    uint64_t v2 = v20;
    uint64_t v0 = v19;
    uint64_t v3 = v38;
    MEMORY[0x1895E3FF8](v22, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_189214C74();
  uint64_t v23 = v43;
  uint64_t v24 = v43 + OBJC_IVAR____TtC19JobQuiescenceServer25JQServerStateWaitForTasks_context;
  sub_189214C68();
  double v26 = v25;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v42);
  if ((~*(void *)&v26 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }

  if (v26 <= -1.0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v26 >= 1.84467441e19)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  uint64_t v28 = *(void *)(v23 + 16);
  (*(void (**)(unint64_t, void))(*(void *)v28 + 432LL))( (unint64_t)v26,  *(void *)(v24 + *(int *)(v0 + 24)));
  sub_189214C98();
  (*(void (**)(char *))(*(void *)v28 + 440LL))(v7);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v39 + 8);
  v29(v7, v3);
  sub_189214C98();
  uint64_t v30 = v40;
  sub_189214DB8();
  sub_18920EAD8( (unint64_t *)&qword_18C789E00,  (uint64_t (*)(uint64_t))MEMORY[0x189610498],  MEMORY[0x1896104A0]);
  char v31 = sub_189215178();
  v29(v30, v3);
  v29(v7, v3);
  if ((v31 & 1) != 0)
  {
    uint64_t v32 = type metadata accessor for JQServerStatePermanentlyQuiesced();
    sub_18921137C(v24, (uint64_t)v2);
    uint64_t v33 = swift_retain();
    uint64_t v34 = sub_189212994(v33, (uint64_t)v2, v26);
    uint64_t v35 = &off_18A365570;
  }

  else
  {
    uint64_t v32 = type metadata accessor for JQServerStateIdle();
    uint64_t v36 = swift_retain();
    uint64_t v34 = sub_189211538(v36);
    uint64_t v35 = &off_18A3654E8;
  }

  v44[3] = v32;
  v44[4] = v35;
  v44[0] = v34;
  return (*(uint64_t (**)(void *))(*(void *)v28 + 280LL))(v44);
}

uint64_t sub_189213B24(uint64_t a1)
{
  uint64_t v2 = sub_189214EB4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_18920D9C0(a1, (uint64_t)v21);
  uint64_t v7 = (os_log_s *)sub_189214E9C();
  os_log_type_t v8 = sub_189215094();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v2;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    v17[1] = v10 + 4;
    uint64_t v13 = v22;
    uint64_t v12 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v13, v12);
    uint64_t v19 = sub_18920C8E0(v14, v15, &v20);
    sub_189215154();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
    _os_log_impl( &dword_189200000,  v7,  v8,  "Subscriber %{public}s subscribed after quiescence had already been kicked off. It will not be notified.",  v10,  0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E3FF8](v11, -1LL, -1LL);
    MEMORY[0x1895E3FF8](v10, -1LL, -1LL);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }

  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

uint64_t sub_189213D14@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_189214C80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189214C74();
  sub_189214C68();
  double v9 = v8;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((~*(void *)&v9 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v9 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v9 < 1.84467441e19)
  {
    *a1 = (*(uint64_t (**)(uint64_t))(**(void **)(v2 + 16) + 264LL))(result);
    a1[1] = (unint64_t)v9;
    uint64_t v11 = *MEMORY[0x189610468];
    uint64_t v12 = sub_189214DA0();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104LL))(a1, v11, v12);
  }

LABEL_7:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_189213E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  v4[4] = 0x80000001892167F0LL;
  void v4[5] = 0LL;
  v4[2] = a1;
  void v4[3] = 0xD000000000000011LL;
  sub_189212C58(a2, (uint64_t)v4 + OBJC_IVAR____TtC19JobQuiescenceServer25JQServerStateWaitForTasks_context);
  return v4;
}

void *sub_189213EA4(uint64_t a1, uint64_t a2)
{
  v2[4] = 0x80000001892167F0LL;
  void v2[5] = 0LL;
  v2[2] = a1;
  v2[3] = 0xD000000000000011LL;
  sub_189212C58(a2, (uint64_t)v2 + OBJC_IVAR____TtC19JobQuiescenceServer25JQServerStateWaitForTasks_context);
  return v2;
}

uint64_t sub_189213EF0()
{
  return v0;
}

uint64_t sub_189213F2C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_189213F74()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 168LL))();
}

uint64_t sub_189213F9C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 176LL))();
}

unint64_t sub_189213FC4()
{
  unint64_t result = qword_18C78A4A0;
  if (!qword_18C78A4A0)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C78A4A0);
  }

  return result;
}

uint64_t sub_189214000()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_189214024()
{
  return type metadata accessor for JQServerStateWaitForTasks();
}

uint64_t type metadata accessor for JQServerStateWaitForTasks()
{
  uint64_t result = qword_18C78AA00;
  if (!qword_18C78AA00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_189214068()
{
  uint64_t result = type metadata accessor for QuiesceContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1892140F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E3F5C](MEMORY[0x189618470], v4);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_189214138()
{
  return &unk_189215FB0;
}

uint64_t sub_189214144()
{
  return 60LL;
}

unint64_t sub_18921414C()
{
  return 0xD000000000000015LL;
}

uint64_t sub_189214168@<X0>(uint64_t a1@<X8>)
{
  return sub_18921137C(v1 + OBJC_IVAR____TtC19JobQuiescenceServer30JQServerStateNotifySubscribers_context, a1);
}

void *sub_18921417C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for QuiesceContext();
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v24[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_189214EB4();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  double v8 = (char *)&v24[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_18920EC38();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = (os_log_s *)sub_189214E9C();
  os_log_type_t v11 = sub_189215094();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_189200000, v10, v11, "Server timed out notifying subscribers of quiescence.", v12, 2u);
    MEMORY[0x1895E3FF8](v12, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = *(void *)(v1 + 16);
  uint64_t v14 = type metadata accessor for JQServerStateWaitForTasks();
  sub_18921137C(v1 + OBJC_IVAR____TtC19JobQuiescenceServer30JQServerStateNotifySubscribers_context, (uint64_t)v4);
  uint64_t v15 = swift_retain();
  uint64_t v16 = sub_189213E30(v15, (uint64_t)v4);
  uint64_t v25 = v14;
  double v26 = &off_18A365600;
  v24[0] = v16;
  uint64_t v17 = (*(uint64_t (**)(void *))(*(void *)v13 + 280LL))(v24);
  unint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 240LL))(v17);
  if (v18 >> 62) {
    uint64_t v19 = sub_189215208();
  }
  else {
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (!v19)
  {
    uint64_t result = (*(void *(**)(void *__return_ptr, void *))(*(void *)v13 + 272LL))(v24, result);
    uint64_t v21 = v25;
    if (v25)
    {
      uint64_t v22 = v26;
      __swift_project_boxed_opaque_existential_1(v24, v25);
      ((void (*)(uint64_t, _UNKNOWN **))v22[8])(v21, v22);
      return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_1892143A0()
{
  uint64_t v47 = sub_189214F08();
  uint64_t v45 = *(void *)(v47 - 8);
  uint64_t v1 = MEMORY[0x1895F8858](v47);
  uint64_t v48 = (void *)((char *)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (void *)((char *)v36 - v3);
  uint64_t v46 = sub_189214F50();
  uint64_t v44 = *(void *)(v46 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v46);
  uint64_t v42 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v5);
  uint64_t v43 = (char *)v36 - v7;
  uint64_t v8 = sub_189214F14();
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  MEMORY[0x1895F8858](v8);
  uint64_t v37 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_189214F38();
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v39 = v10;
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_189215100();
  uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x18961B978];
  uint64_t v15 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v36[1] = sub_189213FC4();
  unint64_t v18 = *(void **)(*(void *)(v0 + 16) + 40LL);
  aBlock[0] = MEMORY[0x18961AFE8];
  sub_18920EAD8((unint64_t *)&unk_18C789D70, v14, MEMORY[0x18961B998]);
  id v19 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C78A4B0);
  sub_1892140F8(&qword_18C789D80, (uint64_t *)&unk_18C78A4B0);
  sub_189215184();
  sub_18921510C();

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
  uint64_t ObjectType = swift_getObjectType();
  aBlock[4] = sub_189214000;
  void aBlock[5] = v49;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_189202BDC;
  void aBlock[3] = &block_descriptor_1;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  sub_189214F20();
  uint64_t v22 = v37;
  sub_189202C44();
  sub_189215118();
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v41);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v39);
  swift_release();
  uint64_t v23 = v42;
  sub_189214F44();
  void *v4 = 60LL;
  uint64_t v24 = v45;
  uint64_t v25 = *(void (**)(void *, void, uint64_t))(v45 + 104);
  uint64_t v26 = v47;
  v25(v4, *MEMORY[0x18961B670], v47);
  uint64_t v27 = v43;
  MEMORY[0x1895E38F0](v23, v4);
  uint64_t v28 = *(void (**)(void *, uint64_t))(v24 + 8);
  uint64_t v29 = v26;
  v28(v4, v26);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v44 + 8);
  uint64_t v31 = v46;
  v30(v23, v46);
  v25(v4, *MEMORY[0x18961B660], v29);
  uint64_t v32 = v48;
  *uint64_t v48 = 0LL;
  v25(v32, *MEMORY[0x18961B650], v29);
  MEMORY[0x1895E3A94](v27, v4, v32, ObjectType);
  v28(v32, v29);
  v28(v4, v29);
  v30(v27, v31);
  sub_189215130();
  uint64_t v33 = *(void (**)(uint64_t))(*(void *)v49 + 120LL);
  uint64_t v34 = swift_unknownObjectRetain();
  v33(v34);
  return swift_unknownObjectRelease();
}

void *sub_1892147D4()
{
  uint64_t v1 = type metadata accessor for QuiesceContext();
  MEMORY[0x1895F8858](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = type metadata accessor for JQServerStateWaitForTasks();
  sub_18921137C(v0 + OBJC_IVAR____TtC19JobQuiescenceServer30JQServerStateNotifySubscribers_context, (uint64_t)v3);
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_189213E30(v6, (uint64_t)v3);
  uint64_t v16 = v5;
  uint64_t v17 = &off_18A365600;
  v15[0] = v7;
  uint64_t v8 = (*(uint64_t (**)(void *))(*(void *)v4 + 280LL))(v15);
  unint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 240LL))(v8);
  if (v9 >> 62) {
    uint64_t v10 = sub_189215208();
  }
  else {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (!v10)
  {
    uint64_t result = (*(void *(**)(void *__return_ptr, void *))(*(void *)v4 + 272LL))(v15, result);
    uint64_t v12 = v16;
    if (v16)
    {
      uint64_t v13 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      ((void (*)(uint64_t, _UNKNOWN **))v13[8])(v12, v13);
      return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_18921491C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_189214C80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189214C74();
  sub_189214C68();
  double v9 = v8;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((~*(void *)&v9 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v9 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v9 < 1.84467441e19)
  {
    *a1 = (*(uint64_t (**)(uint64_t))(**(void **)(v2 + 16) + 264LL))(result);
    a1[1] = (unint64_t)v9;
    uint64_t v11 = *MEMORY[0x189610468];
    uint64_t v12 = sub_189214DA0();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104LL))(a1, v11, v12);
  }

void *sub_189214A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  v4[4] = 0x8000000189216870LL;
  void v4[5] = 0LL;
  v4[2] = a1;
  void v4[3] = 0xD000000000000015LL;
  sub_189212C58(a2, (uint64_t)v4 + OBJC_IVAR____TtC19JobQuiescenceServer30JQServerStateNotifySubscribers_context);
  return v4;
}

void *sub_189214AAC(uint64_t a1, uint64_t a2)
{
  v2[4] = 0x8000000189216870LL;
  void v2[5] = 0LL;
  v2[2] = a1;
  v2[3] = 0xD000000000000015LL;
  sub_189212C58(a2, (uint64_t)v2 + OBJC_IVAR____TtC19JobQuiescenceServer30JQServerStateNotifySubscribers_context);
  return v2;
}

uint64_t sub_189214AF8()
{
  return v0;
}

uint64_t sub_189214B34()
{
  return swift_deallocClassInstance();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_189214B94()
{
  return type metadata accessor for JQServerStateNotifySubscribers();
}

uint64_t type metadata accessor for JQServerStateNotifySubscribers()
{
  uint64_t result = qword_18C78AA10;
  if (!qword_18C78AA10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_189214BD8()
{
  uint64_t result = type metadata accessor for QuiesceContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_189214C68()
{
  return MEMORY[0x189606DE8]();
}

uint64_t sub_189214C74()
{
  return MEMORY[0x189606E40]();
}

uint64_t sub_189214C80()
{
  return MEMORY[0x189606E60]();
}

uint64_t sub_189214C8C()
{
  return MEMORY[0x189610328]();
}

uint64_t sub_189214C98()
{
  return MEMORY[0x189610330]();
}

uint64_t sub_189214CA4()
{
  return MEMORY[0x189610338]();
}

uint64_t sub_189214CB0()
{
  return MEMORY[0x189610340]();
}

uint64_t sub_189214CBC()
{
  return MEMORY[0x189610360]();
}

uint64_t sub_189214CC8()
{
  return MEMORY[0x189610368]();
}

uint64_t sub_189214CD4()
{
  return MEMORY[0x189610378]();
}

uint64_t sub_189214CE0()
{
  return MEMORY[0x189610388]();
}

uint64_t sub_189214CEC()
{
  return MEMORY[0x189610398]();
}

uint64_t sub_189214CF8()
{
  return MEMORY[0x1896103A0]();
}

uint64_t sub_189214D04()
{
  return MEMORY[0x1896103B0]();
}

uint64_t sub_189214D10()
{
  return MEMORY[0x1896103C0]();
}

uint64_t sub_189214D1C()
{
  return MEMORY[0x1896103D0]();
}

uint64_t sub_189214D28()
{
  return MEMORY[0x1896103E8]();
}

uint64_t sub_189214D34()
{
  return MEMORY[0x189610408]();
}

uint64_t sub_189214D40()
{
  return MEMORY[0x189610410]();
}

uint64_t sub_189214D4C()
{
  return MEMORY[0x189610418]();
}

uint64_t sub_189214D58()
{
  return MEMORY[0x189610428]();
}

uint64_t sub_189214D64()
{
  return MEMORY[0x189610438]();
}

uint64_t sub_189214D70()
{
  return MEMORY[0x189610440]();
}

uint64_t sub_189214D7C()
{
  return MEMORY[0x189610448]();
}

uint64_t sub_189214D88()
{
  return MEMORY[0x189610450]();
}

uint64_t sub_189214D94()
{
  return MEMORY[0x189610458]();
}

uint64_t sub_189214DA0()
{
  return MEMORY[0x189610470]();
}

uint64_t sub_189214DAC()
{
  return MEMORY[0x189610480]();
}

uint64_t sub_189214DB8()
{
  return MEMORY[0x189610490]();
}

uint64_t sub_189214DC4()
{
  return MEMORY[0x189610498]();
}

uint64_t sub_189214DD0()
{
  return MEMORY[0x1896104B8]();
}

uint64_t sub_189214DDC()
{
  return MEMORY[0x1896104C0]();
}

uint64_t sub_189214DE8()
{
  return MEMORY[0x1896104C8]();
}

uint64_t sub_189214DF4()
{
  return MEMORY[0x1896104D8]();
}

uint64_t sub_189214E00()
{
  return MEMORY[0x1896104E0]();
}

uint64_t sub_189214E0C()
{
  return MEMORY[0x1896104F0]();
}

uint64_t sub_189214E18()
{
  return MEMORY[0x1896104F8]();
}

uint64_t sub_189214E24()
{
  return MEMORY[0x189610500]();
}

uint64_t sub_189214E30()
{
  return MEMORY[0x189610510]();
}

uint64_t sub_189214E3C()
{
  return MEMORY[0x189610518]();
}

uint64_t sub_189214E48()
{
  return MEMORY[0x189610520]();
}

uint64_t sub_189214E54()
{
  return MEMORY[0x189610528]();
}

uint64_t sub_189214E60()
{
  return MEMORY[0x189610560]();
}

uint64_t sub_189214E6C()
{
  return MEMORY[0x189610568]();
}

uint64_t sub_189214E78()
{
  return MEMORY[0x189610578]();
}

uint64_t sub_189214E84()
{
  return MEMORY[0x189610598]();
}

uint64_t sub_189214E90()
{
  return MEMORY[0x1896105A0]();
}

uint64_t sub_189214E9C()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_189214EA8()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_189214EB4()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_189214EC0()
{
  return MEMORY[0x18961BC18]();
}

uint64_t sub_189214ECC()
{
  return MEMORY[0x18961BC20]();
}

uint64_t sub_189214ED8()
{
  return MEMORY[0x18961BC30]();
}

uint64_t sub_189214EE4()
{
  return MEMORY[0x18961BC38]();
}

uint64_t sub_189214EF0()
{
  return MEMORY[0x18961BC50]();
}

uint64_t sub_189214EFC()
{
  return MEMORY[0x18961D120]();
}

uint64_t sub_189214F08()
{
  return MEMORY[0x18961B680]();
}

uint64_t sub_189214F14()
{
  return MEMORY[0x18961B6A0]();
}

uint64_t sub_189214F20()
{
  return MEMORY[0x18961B6E8]();
}

uint64_t sub_189214F2C()
{
  return MEMORY[0x18961B6F8]();
}

uint64_t sub_189214F38()
{
  return MEMORY[0x18961B708]();
}

uint64_t sub_189214F44()
{
  return MEMORY[0x18961B778]();
}

uint64_t sub_189214F50()
{
  return MEMORY[0x18961B788]();
}

uint64_t sub_189214F5C()
{
  return MEMORY[0x18961B7A8]();
}

uint64_t sub_189214F68()
{
  return MEMORY[0x18961B7B0]();
}

uint64_t sub_189214F74()
{
  return MEMORY[0x18961B7C0]();
}

uint64_t sub_189214F80()
{
  return MEMORY[0x18961B7D0]();
}

uint64_t sub_189214F8C()
{
  return MEMORY[0x18961B800]();
}

uint64_t sub_189214F98()
{
  return MEMORY[0x18961B810]();
}

uint64_t sub_189214FA4()
{
  return MEMORY[0x18961B828]();
}

uint64_t sub_189214FB0()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_189214FBC()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_189214FC8()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_189214FD4()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_189214FE0()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_189214FEC()
{
  return MEMORY[0x1896180D0]();
}

uint64_t sub_189214FF8()
{
  return MEMORY[0x189618220]();
}

uint64_t sub_189215004()
{
  return MEMORY[0x189618230]();
}

uint64_t sub_189215010()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_18921501C()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_189215028()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_189215034()
{
  return MEMORY[0x189618378]();
}

uint64_t sub_189215040()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_18921504C()
{
  return MEMORY[0x189618410]();
}

uint64_t sub_189215058()
{
  return MEMORY[0x189618828]();
}

uint64_t sub_189215064()
{
  return MEMORY[0x189618848]();
}

uint64_t sub_189215070()
{
  return MEMORY[0x189618890]();
}

uint64_t sub_18921507C()
{
  return MEMORY[0x189618950]();
}

uint64_t sub_189215088()
{
  return MEMORY[0x18961D210]();
}

uint64_t sub_189215094()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_1892150A0()
{
  return MEMORY[0x18961D238]();
}

uint64_t sub_1892150AC()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_1892150B8()
{
  return MEMORY[0x18961B888]();
}

uint64_t sub_1892150C4()
{
  return MEMORY[0x18961B8A8]();
}

uint64_t sub_1892150D0()
{
  return MEMORY[0x18961B920]();
}

uint64_t sub_1892150DC()
{
  return MEMORY[0x18961B948]();
}

uint64_t sub_1892150E8()
{
  return MEMORY[0x18961B950]();
}

uint64_t sub_1892150F4()
{
  return MEMORY[0x18961B958]();
}

uint64_t sub_189215100()
{
  return MEMORY[0x18961B978]();
}

uint64_t sub_18921510C()
{
  return MEMORY[0x18961B9B8]();
}

uint64_t sub_189215118()
{
  return MEMORY[0x18961B9D8]();
}

uint64_t sub_189215124()
{
  return MEMORY[0x18961B9F0]();
}

uint64_t sub_189215130()
{
  return MEMORY[0x18961BA10]();
}

uint64_t sub_18921513C()
{
  return MEMORY[0x18961BA50]();
}

uint64_t sub_189215148()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_189215154()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_189215160()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_18921516C()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_189215178()
{
  return MEMORY[0x189618FF0]();
}

uint64_t sub_189215184()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_189215190()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_18921519C()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1892151A8()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1892151B4()
{
  return MEMORY[0x189619308]();
}

uint64_t sub_1892151C0()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1892151CC()
{
  return MEMORY[0x1896194D0]();
}

uint64_t sub_1892151D8()
{
  return MEMORY[0x189619510]();
}

uint64_t sub_1892151E4()
{
  return MEMORY[0x189619530]();
}

uint64_t sub_1892151F0()
{
  return MEMORY[0x189619538]();
}

uint64_t sub_1892151FC()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_189215208()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_189215214()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_189215220()
{
  return MEMORY[0x189619CD0]();
}

uint64_t sub_18921522C()
{
  return MEMORY[0x18961A040]();
}

uint64_t sub_189215238()
{
  return MEMORY[0x18961A788]();
}

uint64_t sub_189215244()
{
  return MEMORY[0x18961AF88]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

int reboot(int a1)
{
  return MEMORY[0x1895FCC90](*(void *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x18961B170]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x18961B1A8]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x18961B248]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x18961B388]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x18961B3C0]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x18961B460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_entitlements_data_for_token()
{
  return MEMORY[0x1895FDAB8]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1895FDAE0]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1895FDC78]();
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1895FDDA0]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x1895FDDC8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1895FDDE0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x189612008]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x189612020]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1896120A8]();
}