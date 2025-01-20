int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;
  v3 = type metadata accessor for Configuration(0LL);
  sub_100003808(v3, qword_100019058);
  v4 = sub_100003848(v3, (uint64_t)qword_100019058);
  v5 = os_transaction_create("com.apple.intelligenceplatform.IntelligencePlatformComputeServiceDaemon.start");
  v6 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100003D34();
  v9 = objc_autoreleasePoolPush();
  v10 = type metadata accessor for Library(0LL);
  v11 = sub_100003F60();
  static UnifiedLibrary.add(library:)(v10, v11);
  objc_autoreleasePoolPop(v9);
  v12 = objc_autoreleasePoolPush();
  static IntelligencePlatformComputeSystem.start()();
  objc_autoreleasePoolPop(v12);
  if ((Configuration.isIPCSMemoryTransactionEnabled.getter() & 1) != 0)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v4, v8, v3);
    swift_unknownObjectRelease(v5);
    sub_10000EB9C(v4);
  }

  sub_10000EB9C((uint64_t)v8);
}

uint64_t *sub_100003808(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_100003848(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003860()
{
  uint64_t v0 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t v1 = __DataStorage.init(length:)(1024LL);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    uint64_t v2 = __DataStorage._bytes.getter();
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t result = __DataStorage._offset.getter();
      if (__OFSUB__(0LL, result))
      {
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }

      uint64_t v5 = v3 - result;
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
    uint64_t v6 = __DataStorage.init(bytes:length:copy:deallocator:offset:)(v5, 1024LL, 1LL, 0LL, 0LL, 0LL);
    swift_release(v1);
    uint64_t v1 = v6;
  }

  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  uint64_t v7 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v8 = -result;
  if (__OFSUB__(0LL, result))
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v9 = __DataStorage._length.getter();
  if (v9 >= 1024) {
    size_t v10 = 1024LL;
  }
  else {
    size_t v10 = v9;
  }
  bzero((void *)(v7 + v8), v10);
  uint64_t v13 = 0x40000000000LL;
  unint64_t v14 = v1 | 0x4000000000000000LL;
  sub_1000039B0((uint64_t)&v13);
  uint64_t v12 = v11;
  sub_100003FA8(v13, v14);
  return v12;
}

void sub_1000039B0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100003A0C@<X0>( uint64_t a1@<X8>, uint64_t a2, char a3, int a4, int a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  uint64_t v29 = v26;
  LOWORD(v30) = a1;
  BYTE2(v30) = BYTE2(a1);
  HIBYTE(v30) = BYTE3(a1);
  unsigned __int8 v31 = BYTE4(a1);
  unsigned __int8 v32 = BYTE5(a1);
  unsigned __int8 v33 = BYTE6(a1);
  uint64_t result = sub_10000FF34((char *)&v29, v25, &v34);
  if (!v24) {
    uint64_t result = v34;
  }
  unint64_t v28 = v30 | ((unint64_t)v31 << 32) | ((unint64_t)v32 << 40) | ((unint64_t)v33 << 48);
  void *v23 = v29;
  v23[1] = v28;
  return result;
}

uint64_t sub_100003C8C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v9 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v10 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_8;
  }

  if (__OFSUB__(a2, a1))
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }

  __DataStorage._length.getter();
  uint64_t result = sub_10000FF34((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_100003D34()
{
  uint64_t v0 = ((uint64_t (*)(void))String.utf8CString.getter)();
  int v1 = _set_user_dir_suffix(v0 + 32);
  swift_release(v0);
  if (!v1)
  {
    if (qword_100018B20 != -1) {
      swift_once(&qword_100018B20, sub_10000FEC0);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    sub_100003848(v10, (uint64_t)qword_1000190B0);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v13 = 0;
      unint64_t v14 = "_set_user_dir_suffix() failed!";
      v15 = v11;
      os_log_type_t v16 = v12;
      v17 = v13;
      uint32_t v18 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, v17, v18);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

LABEL_15:
    exit(1);
  }

  uint64_t v2 = sub_100003860();
  if (!v3)
  {
LABEL_10:
    if (qword_100018B20 != -1) {
      swift_once(&qword_100018B20, sub_10000FEC0);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    sub_100003848(v19, (uint64_t)qword_1000190B0);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v20))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v13 = 67109120;
      int v21 = 65537;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4);
      unint64_t v14 = "Unable to read _CS_DARWIN_USER_CACHE_DIR %d!";
      v15 = v11;
      os_log_type_t v16 = v20;
      v17 = v13;
      uint32_t v18 = 8;
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  uint64_t v4 = v3;
  uint64_t v5 = String.utf8CString.getter(v2);
  uint64_t v6 = realpath_DARWIN_EXTSN((const char *)(v5 + 32), 0LL);
  swift_release(v5);
  if (!v6)
  {
    swift_bridgeObjectRelease(v4);
    goto LABEL_10;
  }

  String.init(cString:)(v6);
  uint64_t v8 = v7;
  swift_slowDealloc(v6, -1LL, -1LL);
  swift_bridgeObjectRelease(v8);
  return swift_bridgeObjectRelease(v4);
}

unint64_t sub_100003F60()
{
  unint64_t result = qword_100018B28;
  if (!qword_100018B28)
  {
    uint64_t v1 = type metadata accessor for Library(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Library, v1);
    atomic_store(result, (unint64_t *)&qword_100018B28);
  }

  return result;
}

uint64_t sub_100003FA8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100003FEC()
{
  uint64_t v0 = type metadata accessor for Configuration(0LL);
  sub_100003808(v0, qword_100019078);
  uint64_t v1 = sub_100003848(v0, (uint64_t)qword_100019078);
  if (qword_100018B18 != -1) {
    swift_once(&qword_100018B18, sub_10000D1B4);
  }
  uint64_t v2 = sub_10000AF38(&qword_100018F00);
  uint64_t v3 = sub_100003848(v2, (uint64_t)qword_100019098);
  uint64_t v4 = swift_beginAccess(v3, v10, 0LL, 0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  sub_10000C9B4(v3, (uint64_t)v6);
  uint64_t v7 = *(void *)(v0 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1LL, v0);
  if ((_DWORD)result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v1, v6, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100004108()
{
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000412C()
{
  return v0;
}

uint64_t sub_10000413C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[27] = a4;
  v5[28] = v4;
  v5[25] = a2;
  v5[26] = a3;
  v5[24] = a1;
  uint64_t v6 = sub_10000AF38(&qword_100018F70);
  v5[29] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000041A0, 0LL, 0LL);
}

uint64_t sub_1000041A0()
{
  uint64_t v1 = type metadata accessor for Configuration(0LL);
  v0[30] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[31] = v2;
  uint64_t v3 = *(void *)(v2 + 64);
  v0[32] = v3;
  uint64_t v4 = swift_task_alloc((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v0[33] = v4;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.prepare(config:)[1]);
  v0[34] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100004224;
  return static IntelligencePlatformComputeSystem.prepare(config:)(v4);
}

uint64_t sub_100004224()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 272LL);
  *(void *)(*(void *)v1 + 280LL) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = v2[33];
  uint64_t v5 = v2[30];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2[31] + 8LL);
  if (v0)
  {
    v2[43] = v6;
    v6(v4, v5);
    uint64_t v7 = sub_1000045F0;
  }

  else
  {
    v2[36] = v6;
    v6(v4, v5);
    swift_task_dealloc(v4);
    uint64_t v7 = sub_1000042BC;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_1000042BC()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[25];
  uint64_t v6 = v0[26];
  uint64_t v16 = v0[24];
  uint64_t v17 = v0[28];
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v3, 1LL, 1LL, v8);
  uint64_t v9 = swift_task_alloc((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v5, v4);
  uint64_t v10 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = (v10 + 48) & ~v10;
  unint64_t v12 = (v2 + v11 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v13 = (char *)swift_allocObject(&unk_100014A00, v12 + 8, v10 | 7);
  *((void *)v13 + 2) = 0LL;
  *((void *)v13 + 3) = 0LL;
  *((void *)v13 + 4) = v16;
  *((void *)v13 + 5) = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v13[v11], v9, v4);
  *(void *)&v13[v12] = v6;
  swift_task_dealloc(v9);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v6);
  v0[37] = sub_100006344(v3, (uint64_t)&unk_100018D98, (uint64_t)v13, &qword_100018C50);
  uint64_t v14 = *(void *)(v17
                  + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[38] = v14;
  return swift_task_switch(sub_10000440C, v14, 0LL);
}

uint64_t sub_10000440C()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[25];
  uint64_t v3 = (char **)(v0[38] + 112LL);
  swift_beginAccess(v3, v0 + 8, 33LL, 0LL);
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain(v2);
  swift_retain(v1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
  *uint64_t v3 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_10000B214(0LL, *((void *)v4 + 2) + 1LL, 1, v4, &qword_100018DA8, &qword_100018DA0);
    *uint64_t v3 = v4;
  }

  unint64_t v7 = *((void *)v4 + 2);
  unint64_t v6 = *((void *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_10000B214((char *)(v6 > 1), v7 + 1, 1, v4, &qword_100018DA8, &qword_100018DA0);
    *uint64_t v3 = v4;
  }

  uint64_t v8 = v0[37];
  uint64_t v10 = v0[24];
  uint64_t v9 = v0[25];
  *((void *)v4 + 2) = v7 + 1;
  uint64_t v11 = &v4[24 * v7];
  *((void *)v11 + 4) = v8;
  *((void *)v11 + 5) = v10;
  *((void *)v11 + 6) = v9;
  swift_endAccess(v0 + 8);
  unint64_t v12 = (void *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  v0[39] = v12;
  uint64_t v13 = sub_10000AF38(&qword_100018C50);
  v0[40] = v13;
  uint64_t v14 = sub_10000AF38((uint64_t *)&unk_100018FA0);
  v0[41] = v14;
  *unint64_t v12 = v0;
  v12[1] = sub_10000458C;
  return Task.value.getter(v0 + 13, v0[37], v13, v14, &protocol self-conformance witness table for Error);
}

uint64_t sub_10000458C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 312LL);
  *(void *)(*(void *)v1 + 336LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100005DAC;
  }
  else {
    uint64_t v3 = sub_100004AAC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000045F0()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[35];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[44] = sub_100003848(v2, (uint64_t)qword_1000190B0);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[35];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v17 = v9;
    v0[12] = v7;
    swift_errorRetain(v7);
    uint64_t v10 = sub_10000AF38((uint64_t *)&unk_100018FA0);
    uint64_t v11 = String.init<A>(describing:)(v0 + 12, v10);
    unint64_t v13 = v12;
    v0[11] = sub_10000E55C(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 11, v0 + 12, v8 + 4);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: Error preparing system: %s",  v8,  0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v0[35]);
    swift_errorRelease(v7);
  }

  uint64_t v14 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[45] = v14;
  static Configuration.intelligencePlatformComputeService.getter();
  v15 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.teardown(config:)[1]);
  v0[46] = v15;
  void *v15 = v0;
  v15[1] = sub_10000481C;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v14);
}

uint64_t sub_10000481C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 368);
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 360);
  (*(void (**)(uint64_t, void))(v2 + 344))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    os_log_type_t v5 = sub_1000048E8;
  }

  else
  {
    swift_task_dealloc(v4);
    os_log_type_t v5 = sub_1000048A4;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_1000048A4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000048E8()
{
  uint64_t v1 = *(void *)(v0 + 376);
  swift_task_dealloc(*(void *)(v0 + 360));
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 376);
    BOOL v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)BOOL v6 = 136315138;
    uint64_t v16 = v7;
    *(void *)(v0 + 160) = v5;
    swift_errorRetain(v5);
    uint64_t v8 = sub_10000AF38((uint64_t *)&unk_100018FA0);
    uint64_t v9 = String.init<A>(describing:)(v0 + 160, v8);
    unint64_t v11 = v10;
    *(void *)(v0 + 112) = sub_10000E55C(v9, v10, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v6 + 4);
    swift_bridgeObjectRelease(v11);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "IntelligencePlatformComputeService: further error tearing down view system: %s",  v6,  0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 376);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

  uint64_t v13 = *(void *)(v0 + 280);
  swift_willThrow(v14);
  swift_errorRelease(v13);
  swift_task_dealloc(*(void *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004AAC()
{
  uint64_t v1 = v0[38];
  v0[48] = v0[13];
  return swift_task_switch(sub_100004AC8, v1, 0LL);
}

uint64_t sub_100004AC8()
{
  uint64_t v1 = v0[38];
  swift_beginAccess(v1 + 112, v0 + 2, 33LL, 0LL);
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[25];
  uint64_t v58 = *(void *)(v2 + 16);
  if (v58)
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = 0LL;
    for (uint64_t i = 0LL; i != v58; ++i)
    {
      uint64_t v9 = v0[40];
      uint64_t v8 = v0[41];
      uint64_t v10 = v0[37];
      uint64_t v11 = v2;
      uint64_t v12 = v2 + v5;
      uint64_t v13 = *(void *)(v2 + v5 + 32);
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v15 = *(void *)(v12 + 48);
      swift_bridgeObjectRetain(v0[25]);
      swift_retain(v10);
      swift_retain(v13);
      swift_bridgeObjectRetain(v15);
      if ((static Task.== infix(_:_:)(v13, v10, v9, v8, &protocol self-conformance witness table for Error) & 1) != 0)
      {
        uint64_t v16 = v0[25];
        uint64_t v17 = v0[37];
        if (v14 == v0[24] && v15 == v16)
        {
          swift_release(v0[37]);
          swift_bridgeObjectRelease_n(v15, 2LL);
          swift_release(v13);
LABEL_17:
          uint64_t v24 = v11;
          uint64_t result = swift_bridgeObjectRelease(v11);
          unint64_t v25 = i + 1;
          if (__OFADD__(i, 1LL)) {
            goto LABEL_49;
          }
          unint64_t v26 = *(void *)(v24 + 16);
          while (2)
          {
            if (v25 == v26) {
              goto LABEL_14;
            }
            if (v25 >= v26)
            {
              __break(1u);
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }

            unint64_t v56 = v25;
            uint64_t v59 = v24;
            uint64_t v29 = v0[40];
            uint64_t v28 = v0[41];
            uint64_t v30 = v0[37];
            unsigned __int8 v31 = (void *)(v24 + v5);
            uint64_t v33 = *(void *)(v24 + v5 + 56);
            uint64_t v32 = v31[8];
            uint64_t v34 = v31[9];
            swift_bridgeObjectRetain(v0[25]);
            swift_retain(v30);
            swift_retain(v33);
            swift_bridgeObjectRetain(v34);
            if ((static Task.== infix(_:_:)(v33, v30, v29, v28, &protocol self-conformance witness table for Error) & 1) != 0)
            {
              uint64_t v35 = v0[25];
              uint64_t v36 = v0[37];
              if (v32 == v0[24] && v34 == v35)
              {
                swift_release(v0[37]);
                swift_bridgeObjectRelease_n(v34, 2LL);
                uint64_t result = swift_release(v33);
                unint64_t v37 = v56;
                uint64_t v24 = v59;
LABEL_41:
                unint64_t v25 = v37 + 1;
                unint64_t v26 = *(void *)(v24 + 16);
                v5 += 24LL;
                continue;
              }

              char v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34);
              swift_release(v36);
              swift_bridgeObjectRelease(v35);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
              if ((v54 & 1) != 0)
              {
                uint64_t v24 = v59;
                goto LABEL_41;
              }
            }

            else
            {
              uint64_t v38 = v0[25];
              swift_release(v0[37]);
              swift_bridgeObjectRelease(v38);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
            }

            break;
          }

          if (v37 == i)
          {
            uint64_t v24 = v59;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          else
          {
            if (i < 0) {
              goto LABEL_44;
            }
            unint64_t v39 = *(void *)(v59 + 16);
            if (i >= v39) {
              goto LABEL_45;
            }
            if (v37 >= v39) {
              goto LABEL_46;
            }
            v40 = (void *)(v59 + 32 + 24 * i);
            uint64_t v41 = *v40;
            uint64_t v42 = v40[2];
            uint64_t v43 = v31[7];
            uint64_t v55 = v40[1];
            uint64_t v57 = v31[8];
            uint64_t v44 = v31[9];
            v45 = (char *)v59;
            swift_retain(*v40);
            swift_bridgeObjectRetain(v42);
            swift_retain(v43);
            swift_bridgeObjectRetain(v44);
            if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
              v45 = sub_10000B63C(v59);
            }
            v46 = &v45[24 * i];
            uint64_t v47 = *((void *)v46 + 4);
            uint64_t v48 = *((void *)v46 + 6);
            *((void *)v46 + 4) = v43;
            *((void *)v46 + 5) = v57;
            *((void *)v46 + 6) = v44;
            swift_release(v47);
            uint64_t result = swift_bridgeObjectRelease(v48);
            if (v37 >= *((void *)v45 + 2)) {
              goto LABEL_47;
            }
            v49 = v45;
            uint64_t v50 = v0[38];
            v51 = &v49[v5];
            uint64_t v52 = *(void *)&v49[v5 + 56];
            uint64_t v53 = *(void *)&v49[v5 + 72];
            *((void *)v51 + 7) = v41;
            *((void *)v51 + 8) = v55;
            *((void *)v51 + 9) = v42;
            swift_release(v52);
            uint64_t result = swift_bridgeObjectRelease(v53);
            *(void *)(v50 + 112) = v49;
            uint64_t v24 = (uint64_t)v49;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          goto LABEL_41;
        }

        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15);
        swift_release(v17);
        swift_bridgeObjectRelease(v16);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
        if ((v19 & 1) != 0) {
          goto LABEL_17;
        }
      }

      else
      {
        uint64_t v7 = v0[25];
        swift_release(v0[37]);
        swift_bridgeObjectRelease(v7);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
      }

      v5 += 24LL;
      uint64_t v2 = v11;
    }

    swift_bridgeObjectRelease(v11);
    uint64_t i = *(void *)(v11 + 16);
  }

  else
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    uint64_t i = 0LL;
  }

LABEL_14:
  uint64_t v21 = v0[37];
  uint64_t v20 = v0[38];
  swift_bridgeObjectRelease(v0[25]);
  uint64_t result = swift_release(v21);
  int64_t v23 = *(void *)(*(void *)(v20 + 112) + 16LL);
  if (v23 >= i)
  {
    sub_10000B7AC(i, v23, &qword_100018DA8, &qword_100018DA0);
    swift_endAccess(v0 + 2);
    return swift_task_switch(sub_100004F48, 0LL, 0LL);
  }

  uint64_t v21 = v0[37];
  uint64_t v20 = v0[38];
  swift_bridgeObjectRelease(v0[25]);
  uint64_t result = swift_release(v21);
  int64_t v23 = *(void *)(*(void *)(v20 + 112) + 16LL);
  if (v23 >= i)
  {
    sub_10000B7AC(i, v23, &qword_100018DA8, &qword_100018DA0);
    swift_endAccess(v0 + 5);
    return swift_task_switch(sub_100005A98, 0LL, 0LL);
  }

  uint64_t v21 = v0[37];
  uint64_t v20 = v0[38];
  swift_bridgeObjectRelease(v0[25]);
  uint64_t result = swift_release(v21);
  int64_t v23 = *(void *)(*(void *)(v20 + 112) + 16LL);
  if (v23 >= i)
  {
    sub_10000B7AC(i, v23, &qword_100018D50, &qword_100018D48);
    swift_endAccess(v0 + 2);
    return swift_task_switch(sub_100007074, 0LL, 0LL);
  }

  uint64_t v21 = v0[37];
  uint64_t v20 = v0[38];
  swift_bridgeObjectRelease(v0[25]);
  uint64_t result = swift_release(v21);
  int64_t v23 = *(void *)(*(void *)(v20 + 112) + 16LL);
  if (v23 >= i)
  {
    sub_10000B7AC(i, v23, &qword_100018D50, &qword_100018D48);
    swift_endAccess(v0 + 5);
    return swift_task_switch(sub_100007BC4, 0LL, 0LL);
  }

LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_100004F48()
{
  uint64_t v1 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[49] = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.teardown(config:)[1]);
  v0[50] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100004FB4;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100004FB4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 400);
  *(void *)(*v1 + 408) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 392);
  (*(void (**)(uint64_t, void))(v2 + 288))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v5 = sub_10000503C;
  }

  else
  {
    swift_task_dealloc(v4);
    uint64_t v5 = sub_100005440;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_10000503C()
{
  uint64_t v1 = &IntelligencePlatformComputeService;
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v2 = v0[51];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_errorRetain(v2);
  uint64_t v4 = swift_errorRetain(v2);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[51];
  if (v7)
  {
    uint64_t v9 = v0[41];
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = v3;
    v33[0] = swift_slowAlloc(32LL, -1LL);
    uint64_t v11 = v33[0];
    *(_DWORD *)uint64_t v10 = 136315138;
    v0[21] = v8;
    swift_errorRetain(v8);
    uint64_t v12 = String.init<A>(describing:)(v0 + 21, v9);
    unint64_t v14 = v13;
    v0[22] = sub_10000E55C(v12, v13, v33);
    uint64_t v1 = &IntelligencePlatformComputeService;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 22, v0 + 23, v10 + 4);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "IntelligencePlatformComputeService: further error tearing down view system: %s",  v10,  0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v15 = v11;
    uint64_t v3 = v32;
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v0[51]);
    swift_errorRelease(v8);
  }

  uint64_t v16 = v0[48];
  swift_willThrow(v17);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = v0[51];
  v0[52] = v18;
  if (v1[356].count != -1LL) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v19 = v0[25];
  v0[53] = sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain(v19);
  swift_errorRetain(v18);
  swift_bridgeObjectRetain(v19);
  uint64_t v20 = swift_errorRetain(v18);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v31 = v0[41];
    uint64_t v24 = v0[24];
    unint64_t v23 = v0[25];
    uint64_t v25 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = swift_slowAlloc(64LL, -1LL);
    v33[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    swift_bridgeObjectRetain(v23);
    v0[17] = sub_10000E55C(v24, v23, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v25 + 4);
    swift_bridgeObjectRelease_n(v23, 3LL);
    *(_WORD *)(v25 + 12) = 2080;
    v0[18] = v18;
    swift_errorRetain(v18);
    uint64_t v27 = String.init<A>(describing:)(v0 + 18, v31);
    unint64_t v29 = v28;
    v0[19] = sub_10000E55C(v27, v28, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 19, v0 + 20, v25 + 14);
    swift_bridgeObjectRelease(v29);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "IntelligencePlatformComputeService: updateView: n:%s failed: %s",  (uint8_t *)v25,  0x16u);
    swift_arrayDestroy(v26, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[25], 2LL);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
  }

  return swift_task_switch(sub_100005618, v0[38], 0LL);
}

uint64_t sub_100005440()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 296);
  unint64_t v8 = *(void *)(v0 + 200);
  if (v6)
  {
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain(v8);
    *(void *)(v0 + 184) = sub_10000E55C(v9, v8, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v10 + 4);
    swift_bridgeObjectRelease_n(v8, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: update %s returning responses",  v10,  0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 200), 2LL);
  }

  swift_release(v7);

  swift_task_dealloc(*(void *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 384));
}

uint64_t sub_100005618()
{
  uint64_t v1 = v0[38];
  swift_beginAccess(v1 + 112, v0 + 5, 33LL, 0LL);
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[25];
  uint64_t v58 = *(void *)(v2 + 16);
  if (v58)
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = 0LL;
    for (uint64_t i = 0LL; i != v58; ++i)
    {
      uint64_t v9 = v0[40];
      uint64_t v8 = v0[41];
      uint64_t v10 = v0[37];
      uint64_t v11 = v2;
      uint64_t v12 = v2 + v5;
      uint64_t v13 = *(void *)(v2 + v5 + 32);
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v15 = *(void *)(v12 + 48);
      swift_bridgeObjectRetain(v0[25]);
      swift_retain(v10);
      swift_retain(v13);
      swift_bridgeObjectRetain(v15);
      if ((static Task.== infix(_:_:)(v13, v10, v9, v8, &protocol self-conformance witness table for Error) & 1) != 0)
      {
        uint64_t v16 = v0[25];
        uint64_t v17 = v0[37];
        if (v14 == v0[24] && v15 == v16)
        {
          swift_release(v0[37]);
          swift_bridgeObjectRelease_n(v15, 2LL);
          swift_release(v13);
LABEL_17:
          uint64_t v24 = v11;
          uint64_t result = swift_bridgeObjectRelease(v11);
          unint64_t v25 = i + 1;
          if (__OFADD__(i, 1LL)) {
            goto LABEL_49;
          }
          unint64_t v26 = *(void *)(v24 + 16);
          while (2)
          {
            if (v25 == v26) {
              goto LABEL_14;
            }
            if (v25 >= v26)
            {
              __break(1u);
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }

            unint64_t v56 = v25;
            uint64_t v59 = v24;
            uint64_t v29 = v0[40];
            uint64_t v28 = v0[41];
            uint64_t v30 = v0[37];
            uint64_t v31 = (void *)(v24 + v5);
            uint64_t v33 = *(void *)(v24 + v5 + 56);
            uint64_t v32 = v31[8];
            uint64_t v34 = v31[9];
            swift_bridgeObjectRetain(v0[25]);
            swift_retain(v30);
            swift_retain(v33);
            swift_bridgeObjectRetain(v34);
            if ((static Task.== infix(_:_:)(v33, v30, v29, v28, &protocol self-conformance witness table for Error) & 1) != 0)
            {
              uint64_t v35 = v0[25];
              uint64_t v36 = v0[37];
              if (v32 == v0[24] && v34 == v35)
              {
                swift_release(v0[37]);
                swift_bridgeObjectRelease_n(v34, 2LL);
                uint64_t result = swift_release(v33);
                unint64_t v37 = v56;
                uint64_t v24 = v59;
LABEL_41:
                unint64_t v25 = v37 + 1;
                unint64_t v26 = *(void *)(v24 + 16);
                v5 += 24LL;
                continue;
              }

              char v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34);
              swift_release(v36);
              swift_bridgeObjectRelease(v35);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
              if ((v54 & 1) != 0)
              {
                uint64_t v24 = v59;
                goto LABEL_41;
              }
            }

            else
            {
              uint64_t v38 = v0[25];
              swift_release(v0[37]);
              swift_bridgeObjectRelease(v38);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
            }

            break;
          }

          if (v37 == i)
          {
            uint64_t v24 = v59;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          else
          {
            if (i < 0) {
              goto LABEL_44;
            }
            unint64_t v39 = *(void *)(v59 + 16);
            if (i >= v39) {
              goto LABEL_45;
            }
            if (v37 >= v39) {
              goto LABEL_46;
            }
            v40 = (void *)(v59 + 32 + 24 * i);
            uint64_t v41 = *v40;
            uint64_t v42 = v40[2];
            uint64_t v43 = v31[7];
            uint64_t v55 = v40[1];
            uint64_t v57 = v31[8];
            uint64_t v44 = v31[9];
            v45 = (char *)v59;
            swift_retain(*v40);
            swift_bridgeObjectRetain(v42);
            swift_retain(v43);
            swift_bridgeObjectRetain(v44);
            if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
              v45 = sub_10000B63C(v59);
            }
            v46 = &v45[24 * i];
            uint64_t v47 = *((void *)v46 + 4);
            uint64_t v48 = *((void *)v46 + 6);
            *((void *)v46 + 4) = v43;
            *((void *)v46 + 5) = v57;
            *((void *)v46 + 6) = v44;
            swift_release(v47);
            uint64_t result = swift_bridgeObjectRelease(v48);
            if (v37 >= *((void *)v45 + 2)) {
              goto LABEL_47;
            }
            v49 = v45;
            uint64_t v50 = v0[38];
            v51 = &v49[v5];
            uint64_t v52 = *(void *)&v49[v5 + 56];
            uint64_t v53 = *(void *)&v49[v5 + 72];
            *((void *)v51 + 7) = v41;
            *((void *)v51 + 8) = v55;
            *((void *)v51 + 9) = v42;
            swift_release(v52);
            uint64_t result = swift_bridgeObjectRelease(v53);
            *(void *)(v50 + 112) = v49;
            uint64_t v24 = (uint64_t)v49;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          goto LABEL_41;
        }

        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15);
        swift_release(v17);
        swift_bridgeObjectRelease(v16);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
        if ((v19 & 1) != 0) {
          goto LABEL_17;
        }
      }

      else
      {
        uint64_t v7 = v0[25];
        swift_release(v0[37]);
        swift_bridgeObjectRelease(v7);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
      }

      v5 += 24LL;
      uint64_t v2 = v11;
    }

    swift_bridgeObjectRelease(v11);
    uint64_t i = *(void *)(v11 + 16);
  }

  else
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    uint64_t i = 0LL;
  }

uint64_t sub_100005A98()
{
  uint64_t v1 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[54] = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  v0[55] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100005B04;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100005B04()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 440);
  *(void *)(*v1 + 448) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 432);
  (*(void (**)(uint64_t, void))(v2 + 288))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v5 = sub_100005BDC;
  }

  else
  {
    swift_task_dealloc(v4);
    uint64_t v5 = sub_100005B8C;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100005B8C()
{
  uint64_t v1 = *(void *)(v0 + 296);
  swift_willThrow();
  swift_release(v1);
  swift_task_dealloc(*(void *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005BDC()
{
  uint64_t v1 = *(void *)(v0 + 448);
  swift_task_dealloc(*(void *)(v0 + 432));
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 448);
    uint64_t v6 = *(void *)(v0 + 328);
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v17 = v8;
    *(void *)(v0 + 120) = v5;
    swift_errorRetain(v5);
    uint64_t v9 = String.init<A>(describing:)(v0 + 120, v6);
    unint64_t v11 = v10;
    *(void *)(v0 + 128) = sub_10000E55C(v9, v10, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v7 + 4);
    swift_bridgeObjectRelease(v11);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "IntelligencePlatformComputeService: further error tearing down view system: %s",  v7,  0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 448);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

  uint64_t v13 = *(void *)(v0 + 448);
  ((void (*)(void))swift_willThrow)();
  uint64_t v14 = swift_errorRelease(v13);
  uint64_t v15 = *(void *)(v0 + 296);
  swift_willThrow(v14);
  swift_release(v15);
  swift_task_dealloc(*(void *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005DAC()
{
  uint64_t v1 = v0[42];
  v0[52] = v1;
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v2 = v0[25];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v0[53] = sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain(v2);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  uint64_t v4 = swift_errorRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v15 = v0[41];
    uint64_t v8 = v0[24];
    unint64_t v7 = v0[25];
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v10 = swift_slowAlloc(64LL, -1LL);
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain(v7);
    v0[17] = sub_10000E55C(v8, v7, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v9 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    *(_WORD *)(v9 + 12) = 2080;
    v0[18] = v1;
    swift_errorRetain(v1);
    uint64_t v11 = String.init<A>(describing:)(v0 + 18, v15);
    unint64_t v13 = v12;
    v0[19] = sub_10000E55C(v11, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 19, v0 + 20, v9 + 14);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "IntelligencePlatformComputeService: updateView: n:%s failed: %s",  (uint8_t *)v9,  0x16u);
    swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[25], 2LL);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  return swift_task_switch(sub_100005618, v0[38], 0LL);
}

uint64_t sub_100006000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return swift_task_switch(sub_100006020, 0LL, 0LL);
}

uint64_t sub_100006020()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = v0[5];
  if (v6)
  {
    uint64_t v8 = v0[4];
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain(v7);
    v0[2] = sub_10000E55C(v8, v7, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: updateViewWithName %s begining update",  v9,  0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[5], 2LL);
  }

  uint64_t v11 = v0[6];
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  v0[8] = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v11);
  unint64_t v12 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.update(viewName:requests:)[1]);
  v0[9] = v12;
  *unint64_t v12 = v0;
  v12[1] = sub_10000625C;
  return ViewUpdate.ViewInProcessRunner.update(viewName:requests:)(v0[4], v0[5], v0[7]);
}

uint64_t sub_10000625C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 72);
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    BOOL v6 = sub_100006310;
  }

  else
  {
    *(void *)(v4 + 88) = a1;
    BOOL v6 = sub_1000062D0;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000062D0()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_release(*(void *)(v0 + 64));
  *uint64_t v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006310()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1LL, v8) == 1)
  {
    sub_10000B4D8(a1);
    uint64_t v10 = 7168LL;
    uint64_t v11 = *(void *)(a3 + 16);
    if (v11)
    {
LABEL_3:
      uint64_t v12 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v11);
      swift_unknownObjectRetain(v11, v14);
      uint64_t v15 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      uint64_t v17 = v16;
      swift_unknownObjectRelease(v11);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v18 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    uint64_t v10 = v18 | 0x1C00LL;
    uint64_t v11 = *(void *)(a3 + 16);
    if (v11) {
      goto LABEL_3;
    }
  }

  uint64_t v15 = 0LL;
  uint64_t v17 = 0LL;
LABEL_6:
  uint64_t v19 = sub_10000AF38(a4);
  if (v17 | v15)
  {
    v22[0] = 0LL;
    v22[1] = 0LL;
    uint64_t v20 = v22;
    v22[2] = v15;
    v22[3] = v17;
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  return swift_task_create(v10, v20, v19, a2, a3);
}

uint64_t sub_100006470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[27] = a4;
  v5[28] = v4;
  v5[25] = a2;
  v5[26] = a3;
  v5[24] = a1;
  uint64_t v6 = sub_10000AF38(&qword_100018F70);
  v5[29] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000064D4, 0LL, 0LL);
}

uint64_t sub_1000064D4()
{
  uint64_t v1 = type metadata accessor for Configuration(0LL);
  v0[30] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[31] = v2;
  uint64_t v3 = *(void *)(v2 + 64);
  v0[32] = v3;
  uint64_t v4 = swift_task_alloc((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v0[33] = v4;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.prepare(config:)[1]);
  v0[34] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100006558;
  return static IntelligencePlatformComputeSystem.prepare(config:)(v4);
}

uint64_t sub_100006558()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 272LL);
  *(void *)(*(void *)v1 + 280LL) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = v2[33];
  uint64_t v5 = v2[30];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2[31] + 8LL);
  if (v0)
  {
    v2[43] = v6;
    v6(v4, v5);
    unint64_t v7 = sub_100006924;
  }

  else
  {
    v2[36] = v6;
    v6(v4, v5);
    swift_task_dealloc(v4);
    unint64_t v7 = sub_1000065F0;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_1000065F0()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[25];
  uint64_t v6 = v0[26];
  uint64_t v16 = v0[24];
  uint64_t v17 = v0[28];
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v3, 1LL, 1LL, v8);
  uint64_t v9 = swift_task_alloc((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v5, v4);
  uint64_t v10 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = (v10 + 48) & ~v10;
  unint64_t v12 = (v2 + v11 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v13 = (char *)swift_allocObject(&unk_100014960, v12 + 8, v10 | 7);
  *((void *)v13 + 2) = 0LL;
  *((void *)v13 + 3) = 0LL;
  *((void *)v13 + 4) = v16;
  *((void *)v13 + 5) = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v13[v11], v9, v4);
  *(void *)&v13[v12] = v6;
  swift_task_dealloc(v9);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v6);
  v0[37] = sub_100006344(v3, (uint64_t)&unk_100018D40, (uint64_t)v13, &qword_100018C58);
  uint64_t v14 = *(void *)(v17
                  + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  v0[38] = v14;
  return swift_task_switch(sub_100006740, v14, 0LL);
}

uint64_t sub_100006740()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[25];
  uint64_t v3 = (char **)(v0[38] + 112LL);
  swift_beginAccess(v3, v0 + 8, 33LL, 0LL);
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain(v2);
  swift_retain(v1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
  *uint64_t v3 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_10000B214(0LL, *((void *)v4 + 2) + 1LL, 1, v4, &qword_100018D50, &qword_100018D48);
    *uint64_t v3 = v4;
  }

  unint64_t v7 = *((void *)v4 + 2);
  unint64_t v6 = *((void *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_10000B214((char *)(v6 > 1), v7 + 1, 1, v4, &qword_100018D50, &qword_100018D48);
    *uint64_t v3 = v4;
  }

  uint64_t v8 = v0[37];
  uint64_t v10 = v0[24];
  uint64_t v9 = v0[25];
  *((void *)v4 + 2) = v7 + 1;
  uint64_t v11 = &v4[24 * v7];
  *((void *)v11 + 4) = v8;
  *((void *)v11 + 5) = v10;
  *((void *)v11 + 6) = v9;
  swift_endAccess(v0 + 8);
  unint64_t v12 = (void *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  v0[39] = v12;
  uint64_t v13 = sub_10000AF38(&qword_100018C58);
  v0[40] = v13;
  uint64_t v14 = sub_10000AF38((uint64_t *)&unk_100018FA0);
  v0[41] = v14;
  *unint64_t v12 = v0;
  v12[1] = sub_1000068C0;
  return Task.value.getter(v0 + 13, v0[37], v13, v14, &protocol self-conformance witness table for Error);
}

uint64_t sub_1000068C0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 312LL);
  *(void *)(*(void *)v1 + 336LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100007CB8;
  }
  else {
    uint64_t v3 = sub_100006BD8;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100006924()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[35];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[44] = sub_100003848(v2, (uint64_t)qword_1000190B0);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[35];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v17 = v9;
    v0[12] = v7;
    swift_errorRetain(v7);
    uint64_t v10 = sub_10000AF38((uint64_t *)&unk_100018FA0);
    uint64_t v11 = String.init<A>(describing:)(v0 + 12, v10);
    unint64_t v13 = v12;
    v0[11] = sub_10000E55C(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 11, v0 + 12, v8 + 4);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: Error preparing system: %s",  v8,  0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v0[35]);
    swift_errorRelease(v7);
  }

  uint64_t v14 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[45] = v14;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.teardown(config:)[1]);
  v0[46] = v15;
  void *v15 = v0;
  v15[1] = sub_100006B50;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v14);
}

uint64_t sub_100006B50()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 368);
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 360);
  (*(void (**)(uint64_t, void))(v2 + 344))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    os_log_type_t v5 = sub_10000D19C;
  }

  else
  {
    swift_task_dealloc(v4);
    os_log_type_t v5 = sub_10000D188;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100006BD8()
{
  uint64_t v1 = v0[38];
  v0[48] = v0[13];
  return swift_task_switch(sub_100006BF4, v1, 0LL);
}

uint64_t sub_100006BF4()
{
  uint64_t v1 = v0[38];
  swift_beginAccess(v1 + 112, v0 + 2, 33LL, 0LL);
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[25];
  uint64_t v58 = *(void *)(v2 + 16);
  if (v58)
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = 0LL;
    for (uint64_t i = 0LL; i != v58; ++i)
    {
      uint64_t v9 = v0[40];
      uint64_t v8 = v0[41];
      uint64_t v10 = v0[37];
      uint64_t v11 = v2;
      uint64_t v12 = v2 + v5;
      uint64_t v13 = *(void *)(v2 + v5 + 32);
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v15 = *(void *)(v12 + 48);
      swift_bridgeObjectRetain(v0[25]);
      swift_retain(v10);
      swift_retain(v13);
      swift_bridgeObjectRetain(v15);
      if ((static Task.== infix(_:_:)(v13, v10, v9, v8, &protocol self-conformance witness table for Error) & 1) != 0)
      {
        uint64_t v16 = v0[25];
        uint64_t v17 = v0[37];
        if (v14 == v0[24] && v15 == v16)
        {
          swift_release(v0[37]);
          swift_bridgeObjectRelease_n(v15, 2LL);
          swift_release(v13);
LABEL_17:
          uint64_t v24 = v11;
          uint64_t result = swift_bridgeObjectRelease(v11);
          unint64_t v25 = i + 1;
          if (__OFADD__(i, 1LL)) {
            goto LABEL_49;
          }
          unint64_t v26 = *(void *)(v24 + 16);
          while (2)
          {
            if (v25 == v26) {
              goto LABEL_14;
            }
            if (v25 >= v26)
            {
              __break(1u);
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }

            unint64_t v56 = v25;
            uint64_t v59 = v24;
            uint64_t v29 = v0[40];
            uint64_t v28 = v0[41];
            uint64_t v30 = v0[37];
            uint64_t v31 = (void *)(v24 + v5);
            uint64_t v33 = *(void *)(v24 + v5 + 56);
            uint64_t v32 = v31[8];
            uint64_t v34 = v31[9];
            swift_bridgeObjectRetain(v0[25]);
            swift_retain(v30);
            swift_retain(v33);
            swift_bridgeObjectRetain(v34);
            if ((static Task.== infix(_:_:)(v33, v30, v29, v28, &protocol self-conformance witness table for Error) & 1) != 0)
            {
              uint64_t v35 = v0[25];
              uint64_t v36 = v0[37];
              if (v32 == v0[24] && v34 == v35)
              {
                swift_release(v0[37]);
                swift_bridgeObjectRelease_n(v34, 2LL);
                uint64_t result = swift_release(v33);
                unint64_t v37 = v56;
                uint64_t v24 = v59;
LABEL_41:
                unint64_t v25 = v37 + 1;
                unint64_t v26 = *(void *)(v24 + 16);
                v5 += 24LL;
                continue;
              }

              char v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34);
              swift_release(v36);
              swift_bridgeObjectRelease(v35);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
              if ((v54 & 1) != 0)
              {
                uint64_t v24 = v59;
                goto LABEL_41;
              }
            }

            else
            {
              uint64_t v38 = v0[25];
              swift_release(v0[37]);
              swift_bridgeObjectRelease(v38);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
            }

            break;
          }

          if (v37 == i)
          {
            uint64_t v24 = v59;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          else
          {
            if (i < 0) {
              goto LABEL_44;
            }
            unint64_t v39 = *(void *)(v59 + 16);
            if (i >= v39) {
              goto LABEL_45;
            }
            if (v37 >= v39) {
              goto LABEL_46;
            }
            v40 = (void *)(v59 + 32 + 24 * i);
            uint64_t v41 = *v40;
            uint64_t v42 = v40[2];
            uint64_t v43 = v31[7];
            uint64_t v55 = v40[1];
            uint64_t v57 = v31[8];
            uint64_t v44 = v31[9];
            v45 = (char *)v59;
            swift_retain(*v40);
            swift_bridgeObjectRetain(v42);
            swift_retain(v43);
            swift_bridgeObjectRetain(v44);
            if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
              v45 = sub_10000B670(v59);
            }
            v46 = &v45[24 * i];
            uint64_t v47 = *((void *)v46 + 4);
            uint64_t v48 = *((void *)v46 + 6);
            *((void *)v46 + 4) = v43;
            *((void *)v46 + 5) = v57;
            *((void *)v46 + 6) = v44;
            swift_release(v47);
            uint64_t result = swift_bridgeObjectRelease(v48);
            if (v37 >= *((void *)v45 + 2)) {
              goto LABEL_47;
            }
            v49 = v45;
            uint64_t v50 = v0[38];
            v51 = &v49[v5];
            uint64_t v52 = *(void *)&v49[v5 + 56];
            uint64_t v53 = *(void *)&v49[v5 + 72];
            *((void *)v51 + 7) = v41;
            *((void *)v51 + 8) = v55;
            *((void *)v51 + 9) = v42;
            swift_release(v52);
            uint64_t result = swift_bridgeObjectRelease(v53);
            *(void *)(v50 + 112) = v49;
            uint64_t v24 = (uint64_t)v49;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          goto LABEL_41;
        }

        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15);
        swift_release(v17);
        swift_bridgeObjectRelease(v16);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
        if ((v19 & 1) != 0) {
          goto LABEL_17;
        }
      }

      else
      {
        uint64_t v7 = v0[25];
        swift_release(v0[37]);
        swift_bridgeObjectRelease(v7);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
      }

      v5 += 24LL;
      uint64_t v2 = v11;
    }

    swift_bridgeObjectRelease(v11);
    uint64_t i = *(void *)(v11 + 16);
  }

  else
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    uint64_t i = 0LL;
  }

uint64_t sub_100007074()
{
  uint64_t v1 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[49] = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.teardown(config:)[1]);
  v0[50] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000070E0;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_1000070E0()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 400);
  *(void *)(*v1 + 408) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 392);
  (*(void (**)(uint64_t, void))(v2 + 288))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v5 = sub_100007168;
  }

  else
  {
    swift_task_dealloc(v4);
    uint64_t v5 = sub_10000756C;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100007168()
{
  uint64_t v1 = &IntelligencePlatformComputeService;
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v2 = v0[51];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_errorRetain(v2);
  uint64_t v4 = swift_errorRetain(v2);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[51];
  if (v7)
  {
    uint64_t v9 = v0[41];
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = v3;
    v33[0] = swift_slowAlloc(32LL, -1LL);
    uint64_t v11 = v33[0];
    *(_DWORD *)uint64_t v10 = 136315138;
    v0[21] = v8;
    swift_errorRetain(v8);
    uint64_t v12 = String.init<A>(describing:)(v0 + 21, v9);
    unint64_t v14 = v13;
    v0[22] = sub_10000E55C(v12, v13, v33);
    uint64_t v1 = &IntelligencePlatformComputeService;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 22, v0 + 23, v10 + 4);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "IntelligencePlatformComputeService: further error tearing down view system: %s",  v10,  0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v15 = v11;
    uint64_t v3 = v32;
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v0[51]);
    swift_errorRelease(v8);
  }

  uint64_t v16 = v0[48];
  swift_willThrow(v17);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = v0[51];
  v0[52] = v18;
  if (v1[356].count != -1LL) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v19 = v0[25];
  v0[53] = sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain(v19);
  swift_errorRetain(v18);
  swift_bridgeObjectRetain(v19);
  uint64_t v20 = swift_errorRetain(v18);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v31 = v0[41];
    uint64_t v24 = v0[24];
    unint64_t v23 = v0[25];
    uint64_t v25 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = swift_slowAlloc(64LL, -1LL);
    v33[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    swift_bridgeObjectRetain(v23);
    v0[17] = sub_10000E55C(v24, v23, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v25 + 4);
    swift_bridgeObjectRelease_n(v23, 3LL);
    *(_WORD *)(v25 + 12) = 2080;
    v0[18] = v18;
    swift_errorRetain(v18);
    uint64_t v27 = String.init<A>(describing:)(v0 + 18, v31);
    unint64_t v29 = v28;
    v0[19] = sub_10000E55C(v27, v28, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 19, v0 + 20, v25 + 14);
    swift_bridgeObjectRelease(v29);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "IntelligencePlatformComputeService: updateGroup: n:%s failed: %s",  (uint8_t *)v25,  0x16u);
    swift_arrayDestroy(v26, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[25], 2LL);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
  }

  return swift_task_switch(sub_100007744, v0[38], 0LL);
}

uint64_t sub_10000756C()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 296);
  unint64_t v8 = *(void *)(v0 + 200);
  if (v6)
  {
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain(v8);
    *(void *)(v0 + 184) = sub_10000E55C(v9, v8, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v10 + 4);
    swift_bridgeObjectRelease_n(v8, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: updateGroupWithName %s returning responses",  v10,  0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 200), 2LL);
  }

  swift_release(v7);

  swift_task_dealloc(*(void *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 384));
}

uint64_t sub_100007744()
{
  uint64_t v1 = v0[38];
  swift_beginAccess(v1 + 112, v0 + 5, 33LL, 0LL);
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[25];
  uint64_t v58 = *(void *)(v2 + 16);
  if (v58)
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = 0LL;
    for (uint64_t i = 0LL; i != v58; ++i)
    {
      uint64_t v9 = v0[40];
      uint64_t v8 = v0[41];
      uint64_t v10 = v0[37];
      uint64_t v11 = v2;
      uint64_t v12 = v2 + v5;
      uint64_t v13 = *(void *)(v2 + v5 + 32);
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v15 = *(void *)(v12 + 48);
      swift_bridgeObjectRetain(v0[25]);
      swift_retain(v10);
      swift_retain(v13);
      swift_bridgeObjectRetain(v15);
      if ((static Task.== infix(_:_:)(v13, v10, v9, v8, &protocol self-conformance witness table for Error) & 1) != 0)
      {
        uint64_t v16 = v0[25];
        uint64_t v17 = v0[37];
        if (v14 == v0[24] && v15 == v16)
        {
          swift_release(v0[37]);
          swift_bridgeObjectRelease_n(v15, 2LL);
          swift_release(v13);
LABEL_17:
          uint64_t v24 = v11;
          uint64_t result = swift_bridgeObjectRelease(v11);
          unint64_t v25 = i + 1;
          if (__OFADD__(i, 1LL)) {
            goto LABEL_49;
          }
          unint64_t v26 = *(void *)(v24 + 16);
          while (2)
          {
            if (v25 == v26) {
              goto LABEL_14;
            }
            if (v25 >= v26)
            {
              __break(1u);
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }

            unint64_t v56 = v25;
            uint64_t v59 = v24;
            uint64_t v29 = v0[40];
            uint64_t v28 = v0[41];
            uint64_t v30 = v0[37];
            uint64_t v31 = (void *)(v24 + v5);
            uint64_t v33 = *(void *)(v24 + v5 + 56);
            uint64_t v32 = v31[8];
            uint64_t v34 = v31[9];
            swift_bridgeObjectRetain(v0[25]);
            swift_retain(v30);
            swift_retain(v33);
            swift_bridgeObjectRetain(v34);
            if ((static Task.== infix(_:_:)(v33, v30, v29, v28, &protocol self-conformance witness table for Error) & 1) != 0)
            {
              uint64_t v35 = v0[25];
              uint64_t v36 = v0[37];
              if (v32 == v0[24] && v34 == v35)
              {
                swift_release(v0[37]);
                swift_bridgeObjectRelease_n(v34, 2LL);
                uint64_t result = swift_release(v33);
                unint64_t v37 = v56;
                uint64_t v24 = v59;
LABEL_41:
                unint64_t v25 = v37 + 1;
                unint64_t v26 = *(void *)(v24 + 16);
                v5 += 24LL;
                continue;
              }

              char v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34);
              swift_release(v36);
              swift_bridgeObjectRelease(v35);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
              if ((v54 & 1) != 0)
              {
                uint64_t v24 = v59;
                goto LABEL_41;
              }
            }

            else
            {
              uint64_t v38 = v0[25];
              swift_release(v0[37]);
              swift_bridgeObjectRelease(v38);
              swift_release(v33);
              uint64_t result = swift_bridgeObjectRelease(v34);
              unint64_t v37 = v56;
            }

            break;
          }

          if (v37 == i)
          {
            uint64_t v24 = v59;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          else
          {
            if (i < 0) {
              goto LABEL_44;
            }
            unint64_t v39 = *(void *)(v59 + 16);
            if (i >= v39) {
              goto LABEL_45;
            }
            if (v37 >= v39) {
              goto LABEL_46;
            }
            v40 = (void *)(v59 + 32 + 24 * i);
            uint64_t v41 = *v40;
            uint64_t v42 = v40[2];
            uint64_t v43 = v31[7];
            uint64_t v55 = v40[1];
            uint64_t v57 = v31[8];
            uint64_t v44 = v31[9];
            v45 = (char *)v59;
            swift_retain(*v40);
            swift_bridgeObjectRetain(v42);
            swift_retain(v43);
            swift_bridgeObjectRetain(v44);
            if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
              v45 = sub_10000B670(v59);
            }
            v46 = &v45[24 * i];
            uint64_t v47 = *((void *)v46 + 4);
            uint64_t v48 = *((void *)v46 + 6);
            *((void *)v46 + 4) = v43;
            *((void *)v46 + 5) = v57;
            *((void *)v46 + 6) = v44;
            swift_release(v47);
            uint64_t result = swift_bridgeObjectRelease(v48);
            if (v37 >= *((void *)v45 + 2)) {
              goto LABEL_47;
            }
            v49 = v45;
            uint64_t v50 = v0[38];
            v51 = &v49[v5];
            uint64_t v52 = *(void *)&v49[v5 + 56];
            uint64_t v53 = *(void *)&v49[v5 + 72];
            *((void *)v51 + 7) = v41;
            *((void *)v51 + 8) = v55;
            *((void *)v51 + 9) = v42;
            swift_release(v52);
            uint64_t result = swift_bridgeObjectRelease(v53);
            *(void *)(v50 + 112) = v49;
            uint64_t v24 = (uint64_t)v49;
            BOOL v27 = __OFADD__(i++, 1LL);
            if (v27) {
              goto LABEL_43;
            }
          }

          goto LABEL_41;
        }

        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15);
        swift_release(v17);
        swift_bridgeObjectRelease(v16);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
        if ((v19 & 1) != 0) {
          goto LABEL_17;
        }
      }

      else
      {
        uint64_t v7 = v0[25];
        swift_release(v0[37]);
        swift_bridgeObjectRelease(v7);
        swift_release(v13);
        swift_bridgeObjectRelease(v15);
      }

      v5 += 24LL;
      uint64_t v2 = v11;
    }

    swift_bridgeObjectRelease(v11);
    uint64_t i = *(void *)(v11 + 16);
  }

  else
  {
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    uint64_t i = 0LL;
  }

uint64_t sub_100007BC4()
{
  uint64_t v1 = swift_task_alloc((v0[32] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[54] = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to static IntelligencePlatformComputeSystem.teardown(config:)[1]);
  v0[55] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100007C30;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100007C30()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 440);
  *(void *)(*v1 + 448) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 432);
  (*(void (**)(uint64_t, void))(v2 + 288))(v4, *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v5 = sub_10000D1B0;
  }

  else
  {
    swift_task_dealloc(v4);
    uint64_t v5 = sub_10000D1AC;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100007CB8()
{
  uint64_t v1 = v0[42];
  v0[52] = v1;
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v2 = v0[25];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v0[53] = sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain(v2);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  uint64_t v4 = swift_errorRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v15 = v0[41];
    uint64_t v8 = v0[24];
    unint64_t v7 = v0[25];
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v10 = swift_slowAlloc(64LL, -1LL);
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain(v7);
    v0[17] = sub_10000E55C(v8, v7, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v9 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    *(_WORD *)(v9 + 12) = 2080;
    v0[18] = v1;
    swift_errorRetain(v1);
    uint64_t v11 = String.init<A>(describing:)(v0 + 18, v15);
    unint64_t v13 = v12;
    v0[19] = sub_10000E55C(v11, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 19, v0 + 20, v9 + 14);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "IntelligencePlatformComputeService: updateGroup: n:%s failed: %s",  (uint8_t *)v9,  0x16u);
    swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[25], 2LL);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  return swift_task_switch(sub_100007744, v0[38], 0LL);
}

uint64_t sub_100007F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return swift_task_switch(sub_100007F2C, 0LL, 0LL);
}

uint64_t sub_100007F2C()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = v0[5];
  if (v6)
  {
    uint64_t v8 = v0[4];
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain(v7);
    v0[2] = sub_10000E55C(v8, v7, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: updateGroupWithName %s begining update",  v9,  0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[5], 2LL);
  }

  uint64_t v11 = v0[6];
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  v0[8] = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v11);
  unint64_t v12 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.update(groupName:namesAndRequests:)[1]);
  v0[9] = v12;
  *unint64_t v12 = v0;
  v12[1] = sub_100008168;
  return ViewUpdate.ViewInProcessRunner.update(groupName:namesAndRequests:)(v0[4], v0[5], v0[7]);
}

uint64_t sub_100008168(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 72);
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    BOOL v6 = sub_10000D184;
  }

  else
  {
    *(void *)(v4 + 88) = a1;
    BOOL v6 = sub_10000D1A8;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000081DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch(sub_1000081F8, 0LL, 0LL);
}

uint64_t sub_1000081F8()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = v0[4];
  if (v6)
  {
    uint64_t v8 = v0[3];
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain(v7);
    v0[2] = sub_10000E55C(v8, v7, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: updateViewWithName %s called",  v9,  0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[4], 2LL);
  }

  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v11 = type metadata accessor for Configuration(0LL);
  uint64_t v12 = sub_100003848(v11, (uint64_t)qword_100019078);
  unint64_t v13 = (void *)swift_task_alloc(dword_100018D8C);
  v0[7] = v13;
  *unint64_t v13 = v0;
  v13[1] = sub_10000841C;
  return sub_10000413C(v0[3], v0[4], v0[5], v12);
}

uint64_t sub_10000841C(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 56);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_1000085A8(uint64_t a1, uint64_t a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;
  v4[4] = v9;
  uint64_t v11 = sub_10000CD20(0LL, &qword_100018F30, &OBJC_CLASS___GDViewUpdateSourceRequest_ptr);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
  v4[5] = v12;
  uint64_t v13 = dword_100018E4C;
  id v14 = a4;
  uint64_t v15 = (void *)swift_task_alloc(v13);
  v4[6] = v15;
  void *v15 = v4;
  v15[1] = sub_100008680;
  v15[5] = v12;
  v15[6] = v14;
  v15[3] = v8;
  v15[4] = v10;
  return swift_task_switch(sub_1000081F8, 0LL, 0LL);
}

uint64_t sub_100008680(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void *)(*v2 + 40);
  uint64_t v6 = *(void *)(*v2 + 48);
  uint64_t v8 = *(void *)(*v2 + 32);
  uint64_t v9 = *(void **)(*v2 + 16);
  uint64_t v10 = *v2;
  swift_task_dealloc(v6);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  if (v3)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    uint64_t v13 = (void *)v11;
  }

  else
  {
    sub_10000CD20(0LL, &qword_100018D80, &OBJC_CLASS___GDViewUpdateSourceResponse_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v11 = 0LL;
    uint64_t v13 = isa;
  }

  id v14 = *(void (***)(void, void, void))(v5 + 24);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_100008778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch(sub_100008794, 0LL, 0LL);
}

uint64_t sub_100008794()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = swift_bridgeObjectRetain_n(v2, 2LL);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v9 = v0[5];
  unint64_t v8 = v0[6];
  if (v7)
  {
    uint64_t v10 = v0[4];
    uint64_t v11 = swift_slowAlloc(22LL, -1LL);
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain(v9);
    v0[2] = sub_10000E55C(v10, v9, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v11 + 4);
    swift_bridgeObjectRelease_n(v9, 3LL);
    *(_WORD *)(v11 + 12) = 2048;
    if (v8 >> 62)
    {
      uint64_t v18 = v0[6];
      if (v18 < 0) {
        uint64_t v19 = v0[6];
      }
      else {
        uint64_t v19 = v8 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v0[6]);
      uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v19);
      swift_bridgeObjectRelease(v18);
    }

    else
    {
      uint64_t v12 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v13 = v0[6];
    swift_bridgeObjectRelease(v13);
    v0[3] = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v11 + 14);
    swift_bridgeObjectRelease(v13);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "IntelligencePlatformComputeService: updateGroupWithName %s called with %ld namesAndRequests",  (uint8_t *)v11,  0x16u);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[6], 2LL);
    swift_bridgeObjectRelease_n(v9, 2LL);
  }

  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v14 = type metadata accessor for Configuration(0LL);
  uint64_t v15 = sub_100003848(v14, (uint64_t)qword_100019078);
  uint64_t v16 = (void *)swift_task_alloc(dword_100018D34);
  v0[8] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_100008A48;
  return sub_100006470(v0[4], v0[5], v0[6], v15);
}

uint64_t sub_100008A48(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 64);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_100008BD4(uint64_t a1, uint64_t a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;
  v4[4] = v9;
  uint64_t v11 = sub_10000CD20(0LL, &qword_100018F40, &OBJC_CLASS___GDViewUpdateNameAndRequests_ptr);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
  v4[5] = v12;
  uint64_t v13 = dword_100018E24;
  id v14 = a4;
  uint64_t v15 = (void *)swift_task_alloc(v13);
  v4[6] = v15;
  void *v15 = v4;
  v15[1] = sub_100008CAC;
  v15[6] = v12;
  v15[7] = v14;
  v15[4] = v8;
  v15[5] = v10;
  return swift_task_switch(sub_100008794, 0LL, 0LL);
}

uint64_t sub_100008CAC(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void *)(*v2 + 40);
  uint64_t v6 = *(void *)(*v2 + 48);
  uint64_t v8 = *(void *)(*v2 + 32);
  uint64_t v9 = *(void **)(*v2 + 16);
  uint64_t v10 = *v2;
  swift_task_dealloc(v6);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  if (v3)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    uint64_t v13 = (void *)v11;
  }

  else
  {
    sub_10000CD20(0LL, &qword_100018D28, &OBJC_CLASS___GDViewUpdateNameAndResponses_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v11 = 0LL;
    uint64_t v13 = isa;
  }

  id v14 = *(void (***)(void, void, void))(v5 + 24);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_100008EDC(uint64_t a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;
  v4[4] = v9;
  uint64_t v11 = unk_100018DFC;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, char))((char *)&dword_100018DF8 + dword_100018DF8);
  id v12 = a4;
  uint64_t v13 = (void *)swift_task_alloc(v11);
  v4[5] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_10000D18C;
  return v15(v8, v10, a2);
}

uint64_t sub_1000090C0(uint64_t a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;
  v4[4] = v9;
  uint64_t v11 = unk_100018DD4;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, char))((char *)&dword_100018DD0 + dword_100018DD0);
  id v12 = a4;
  uint64_t v13 = (void *)swift_task_alloc(v11);
  v4[5] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_10000916C;
  return v15(v8, v10, a2);
}

uint64_t sub_10000916C(char a1)
{
  uint64_t v5 = *(void *)(*v2 + 32);
  uint64_t v4 = *(void *)(*v2 + 40);
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc(v4);

  swift_bridgeObjectRelease(v5);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v1)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)(v1);
    swift_errorRelease(v1);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v9);
  }

  else
  {
    (*(void (**)(void, void, void))(v8 + 16))(*(void *)(v7 + 24), a1 & 1, 0LL);
  }

  _Block_release(*(const void **)(v7 + 24));
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_100009228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return swift_task_switch(sub_100009248, 0LL, 0LL);
}

uint64_t sub_100009248()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain_n(v2, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[7];
  unint64_t v8 = v0[5];
  if (v6)
  {
    uint64_t v9 = v0[4];
    uint64_t v10 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = swift_slowAlloc(64LL, -1LL);
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain(v8);
    v0[2] = sub_10000E55C(v9, v8, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v10 + 4);
    swift_bridgeObjectRelease_n(v8, 3LL);
    *(_WORD *)(v10 + 12) = 2080;
    id v11 = [v7 identifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    unint64_t v14 = v13;

    v0[3] = sub_10000E55C(v12, v14, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v10 + 14);
    swift_bridgeObjectRelease(v14);

    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: updateViewWithName %s account: %s called",  (uint8_t *)v10,  0x16u);
    swift_arrayDestroy(v21, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v0[5], 2LL);
  }

  uint64_t v15 = type metadata accessor for Configuration(0LL);
  v0[9] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v0[10] = v16;
  uint64_t v17 = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[11] = v17;
  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v18 = v0[7];
  sub_100003848(v15, (uint64_t)qword_100019078);
  Configuration.copyConfiguration(for:)(v18);
  uint64_t v19 = (void *)swift_task_alloc(dword_100018D8C);
  v0[12] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_100009530;
  return sub_10000413C(v0[4], v0[5], v0[6], v17);
}

uint64_t sub_100009530(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 96);
  uint64_t v5 = *v2;
  *(void *)(v5 + 104) = v1;
  swift_task_dealloc(v4);
  uint64_t v6 = *(void *)(v5 + 88);
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 80) + 8LL))(v6, *(void *)(v5 + 72));
  if (v1) {
    return swift_task_switch(sub_1000095CC, 0LL, 0LL);
  }
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t sub_1000095CC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000974C(uint64_t a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[2] = a3;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = v11;
  v5[5] = v11;
  uint64_t v13 = sub_10000CD20(0LL, &qword_100018F30, &OBJC_CLASS___GDViewUpdateSourceRequest_ptr);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v13);
  v5[6] = v14;
  uint64_t v15 = dword_100018D7C;
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = (void *)swift_task_alloc(v15);
  v5[7] = v18;
  *uint64_t v18 = v5;
  v18[1] = sub_100009834;
  v18[7] = v16;
  v18[8] = v17;
  v18[5] = v12;
  v18[6] = v14;
  v18[4] = v10;
  return swift_task_switch(sub_100009248, 0LL, 0LL);
}

uint64_t sub_100009834(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void *)(*v2 + 48);
  uint64_t v6 = *(void *)(*v2 + 56);
  uint64_t v8 = *(void *)(*v2 + 40);
  uint64_t v10 = *(void **)(*v2 + 16);
  uint64_t v9 = *(void **)(*v2 + 24);
  uint64_t v11 = *v2;
  swift_task_dealloc(v6);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  if (v3)
  {
    uint64_t v12 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    uint64_t v14 = (void *)v12;
  }

  else
  {
    sub_10000CD20(0LL, &qword_100018D80, &OBJC_CLASS___GDViewUpdateSourceResponse_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v12 = 0LL;
    uint64_t v14 = isa;
  }

  uint64_t v15 = *(void (***)(void, void, void))(v5 + 32);
  ((void (**)(void, Class, uint64_t))v15)[2](v15, isa, v12);

  _Block_release(v15);
  return (*(uint64_t (**)(void))(v11 + 8))();
}

uint64_t sub_100009938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  return swift_task_switch(sub_100009958, 0LL, 0LL);
}

uint64_t sub_100009958()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100003848(v4, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain_n(v3, 2LL);
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v29 = v6;
    uint64_t v28 = v0 + 4;
    uint64_t v7 = v0[5];
    unint64_t v8 = v0[6];
    unint64_t v9 = v0[7];
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v30 = swift_slowAlloc(64LL, -1LL);
    uint64_t v31 = v30;
    *(_DWORD *)uint64_t v10 = 136315650;
    swift_bridgeObjectRetain(v8);
    v0[2] = sub_10000E55C(v7, v8, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v10 + 4);
    swift_bridgeObjectRelease_n(v8, 3LL);
    *(_WORD *)(v10 + 12) = 2048;
    if (v9 >> 62)
    {
      uint64_t v26 = v0[7];
      if (v26 < 0) {
        uint64_t v27 = v0[7];
      }
      else {
        uint64_t v27 = v9 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v0[7]);
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v27);
      swift_bridgeObjectRelease(v26);
    }

    else
    {
      uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v12 = v0[7];
    uint64_t v13 = (void *)v0[8];
    swift_bridgeObjectRelease(v12);
    v0[3] = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v28, v10 + 14);
    swift_bridgeObjectRelease(v12);
    *(_WORD *)(v10 + 22) = 2080;
    id v14 = [v13 identifier];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    unint64_t v17 = v16;

    v0[4] = sub_10000E55C(v15, v17, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v28, v0 + 5, v10 + 24);
    swift_bridgeObjectRelease(v17);

    _os_log_impl( (void *)&_mh_execute_header,  v5,  v29,  "IntelligencePlatformComputeService: updateGroupWithName %s called with %ld namesAndRequests account: %s",  (uint8_t *)v10,  0x20u);
    swift_arrayDestroy(v30, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    uint64_t v18 = (void *)v0[8];
    uint64_t v19 = v0[6];
    swift_bridgeObjectRelease_n(v0[7], 2LL);
    swift_bridgeObjectRelease_n(v19, 2LL);
  }

  uint64_t v20 = type metadata accessor for Configuration(0LL);
  v0[10] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v0[11] = v21;
  uint64_t v22 = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[12] = v22;
  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v23 = v0[8];
  sub_100003848(v20, (uint64_t)qword_100019078);
  Configuration.copyConfiguration(for:)(v23);
  uint64_t v24 = (void *)swift_task_alloc(dword_100018D34);
  v0[13] = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_100009CDC;
  return sub_100006470(v0[5], v0[6], v0[7], v22);
}

uint64_t sub_100009CDC(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 104);
  uint64_t v5 = *v2;
  *(void *)(v5 + 112) = v1;
  swift_task_dealloc(v4);
  uint64_t v6 = *(void *)(v5 + 96);
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 88) + 8LL))(v6, *(void *)(v5 + 80));
  if (v1) {
    return swift_task_switch(sub_100009D78, 0LL, 0LL);
  }
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t sub_100009D78()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009EF8(uint64_t a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[2] = a3;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = v11;
  v5[5] = v11;
  uint64_t v13 = sub_10000CD20(0LL, &qword_100018F40, &OBJC_CLASS___GDViewUpdateNameAndRequests_ptr);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v13);
  v5[6] = v14;
  uint64_t v15 = dword_100018D24;
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = (void *)swift_task_alloc(v15);
  v5[7] = v18;
  *uint64_t v18 = v5;
  v18[1] = sub_100009FE0;
  v18[8] = v16;
  v18[9] = v17;
  v18[6] = v12;
  v18[7] = v14;
  v18[5] = v10;
  return swift_task_switch(sub_100009958, 0LL, 0LL);
}

uint64_t sub_100009FE0(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void *)(*v2 + 48);
  uint64_t v6 = *(void *)(*v2 + 56);
  uint64_t v8 = *(void *)(*v2 + 40);
  uint64_t v10 = *(void **)(*v2 + 16);
  unint64_t v9 = *(void **)(*v2 + 24);
  uint64_t v11 = *v2;
  swift_task_dealloc(v6);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  if (v3)
  {
    uint64_t v12 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    uint64_t v14 = (void *)v12;
  }

  else
  {
    sub_10000CD20(0LL, &qword_100018D28, &OBJC_CLASS___GDViewUpdateNameAndResponses_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v12 = 0LL;
    uint64_t v14 = isa;
  }

  uint64_t v15 = *(void (***)(void, void, void))(v5 + 32);
  ((void (**)(void, Class, uint64_t))v15)[2](v15, isa, v12);

  _Block_release(v15);
  return (*(uint64_t (**)(void))(v11 + 8))();
}

uint64_t sub_10000A230(uint64_t a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[2] = a3;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = v11;
  v5[5] = v11;
  uint64_t v13 = unk_100018CFC;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, id))((char *)&dword_100018CF8 + dword_100018CF8);
  id v14 = a3;
  id v15 = a5;
  id v16 = (void *)swift_task_alloc(v13);
  v5[6] = v16;
  *id v16 = v5;
  v16[1] = sub_10000D1A4;
  return v18(v10, v12, a2, v14);
}

uint64_t sub_10000A43C(uint64_t a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[2] = a3;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = v11;
  v5[5] = v11;
  uint64_t v13 = unk_100018CD4;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, id))((char *)&dword_100018CD0 + dword_100018CD0);
  id v14 = a3;
  id v15 = a5;
  id v16 = (void *)swift_task_alloc(v13);
  v5[6] = v16;
  *id v16 = v5;
  v16[1] = sub_10000A4FC;
  return v18(v10, v12, a2, v14);
}

uint64_t sub_10000A4FC(char a1)
{
  uint64_t v5 = *(void *)(*v2 + 40);
  uint64_t v4 = *(void *)(*v2 + 48);
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v6 = *(void **)(*v2 + 24);
  uint64_t v8 = *v2;
  swift_task_dealloc(v4);

  swift_bridgeObjectRelease(v5);
  uint64_t v9 = *(void *)(v8 + 32);
  if (v1)
  {
    uint64_t v10 = (void *)_convertErrorToNSError(_:)(v1);
    swift_errorRelease(v1);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0LL, v10);
  }

  else
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(v8 + 32), a1 & 1, 0LL);
  }

  _Block_release(*(const void **)(v8 + 32));
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_10000A5BC()
{
  *(void *)(v1 + 64) = v0;
  return swift_task_switch(sub_10000A5D4, 0LL, 0LL);
}

uint64_t sub_10000A5D4()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003848(v1, (uint64_t)qword_1000190B0);
  v0[9] = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: stop called", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = v0[8];

  uint64_t v7 = *(void *)(v6
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v7;
  return swift_task_switch(sub_10000A6D0, v7, 0LL);
}

uint64_t sub_10000A6D0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 16, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      id v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        uint64_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v20 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v20);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C50);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_10000A8FC, 0LL, 0LL);
}

uint64_t sub_10000A8FC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return swift_task_switch(sub_10000A920, v1, 0LL);
}

uint64_t sub_10000A920()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 40, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v20 = v0;
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      id v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        uint64_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v21 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v21);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        uint64_t v0 = v20;
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C58);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1LL);
}

uint64_t sub_10000AC64(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_100018C4C;
  id v5 = a2;
  uint64_t v6 = (void *)swift_task_alloc(v4);
  v2[4] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10000ACDC;
  v6[8] = v5;
  return swift_task_switch(sub_10000A5D4, 0LL, 0LL);
}

uint64_t sub_10000ACDC(char a1)
{
  uint64_t v4 = *(void *)(*v2 + 32);
  id v5 = *(void **)(*v2 + 16);
  uint64_t v6 = *v2;
  swift_task_dealloc(v4);

  uint64_t v7 = *(void *)(v6 + 24);
  if (v1)
  {
    uint64_t v8 = (void *)_convertErrorToNSError(_:)(v1);
    swift_errorRelease(v1);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v8);
  }

  else
  {
    (*(void (**)(void, void, void))(v7 + 16))(*(void *)(v6 + 24), a1 & 1, 0LL);
  }

  _Block_release(*(const void **)(v6 + 24));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id IntelligencePlatformComputeServiceXPC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntelligencePlatformComputeService()
{
  return objc_opt_self(&OBJC_CLASS____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService);
}

uint64_t sub_10000AEE0(uint64_t a1)
{
  v2[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  return swift_initClassMetadata2(a1, 0LL, 2LL, v2, a1 + 88);
}

uint64_t type metadata accessor for IntelligencePlatformComputeService.TaskRegister( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D154( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for IntelligencePlatformComputeService.TaskRegister);
}

uint64_t sub_10000AF38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000AF78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000D194;
  return v6();
}

uint64_t sub_10000AFCC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_10000D194;
  return v7();
}

uint64_t sub_10000B020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000B4D8(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_1000147D0, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100018CA8, v17);
}

uint64_t sub_10000B164(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B1C8;
  return v6(a1);
}

uint64_t sub_10000B1C8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_10000B214(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_10000AF38(a5);
      uint64_t v14 = (char *)swift_allocObject(v13, 24 * v12 + 32, 7LL);
      size_t v15 = j__malloc_size(v14);
      *((void *)v14 + 2) = v11;
      *((void *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 24);
      unsigned __int8 v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[24 * v11 + 32]) {
          memmove(v16, a4 + 32, 24 * v11);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      unsigned __int8 v16 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    sub_10000B6A4(0LL, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000B344()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B370()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100018C74);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000D194;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_100018C70 + dword_100018C70))(v2, v3);
}

uint64_t sub_10000B3D8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc(dword_100018C84);
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100018C80 + dword_100018C80))(v2, v3, v4);
}

uint64_t sub_10000B454(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100018C94);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100018C90 + dword_100018C90))( a1,  v4,  v5,  v6);
}

uint64_t sub_10000B4D8(uint64_t a1)
{
  uint64_t v2 = sub_10000AF38(&qword_100018F70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000B518()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B53C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100018CA4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100018CA0 + dword_100018CA0))(a1, v4);
}

uint64_t sub_10000B5B0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  uint64_t v6 = *(void **)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc(dword_100018CB4);
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *, void *))((char *)&dword_100018CB0 + dword_100018CB0))( v2,  v3,  v4,  v5,  v6);
}

char *sub_10000B63C(uint64_t a1)
{
  return sub_10000B214(0LL, *(void *)(a1 + 16), 0, (char *)a1, &qword_100018DA8, &qword_100018DA0);
}

char *sub_10000B670(uint64_t a1)
{
  return sub_10000B214(0LL, *(void *)(a1 + 16), 0, (char *)a1, &qword_100018D50, &qword_100018D48);
}

uint64_t sub_10000B6A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 24 * a1 + 32;
  unint64_t v8 = a3 + 24 * v5;
  if (v7 >= v8 || v7 + 24 * v5 <= a3)
  {
    uint64_t v10 = sub_10000AF38(a5);
    swift_arrayInitWithCopy(a3, v7, v5, v10);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_10000B7AC(uint64_t a1, int64_t a2, uint64_t *a3, uint64_t *a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v10 = a1 - a2;
  if (__OFSUB__(0LL, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  int64_t v11 = v7 - v9;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t v6 = sub_10000B214(isUniquelyReferenced_nonNull_native, v15, 1, v6, a3, a4);
  }

  uint64_t v16 = sub_10000AF38(a4);
  uint64_t result = (void *)swift_arrayDestroy(&v6[24 * a1 + 32], v9, v16);
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v18 = *((void *)v6 + 2);
  BOOL v19 = __OFSUB__(v18, a2);
  uint64_t v20 = v18 - a2;
  if (v19) {
    goto LABEL_26;
  }
  if ((v20 & 0x8000000000000000LL) == 0)
  {
    uint64_t v21 = &v6[24 * a2 + 32];
    if (a1 != a2 || &v6[24 * a1 + 32] >= &v21[24 * v20]) {
      uint64_t result = memmove(&v6[24 * a1 + 32], v21, 24 * v20);
    }
    uint64_t v22 = *((void *)v6 + 2);
    BOOL v19 = __OFADD__(v22, v10);
    uint64_t v23 = v22 - v9;
    if (!v19)
    {
      *((void *)v6 + 2) = v23;
LABEL_20:
      *uint64_t v4 = v6;
      return result;
    }

    goto LABEL_27;
  }

LABEL_28:
  char v24 = 2;
  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v24,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000B93C(uint64_t a1, uint64_t a2, char a3)
{
  *(_BYTE *)(v3 + 92) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return swift_task_switch(sub_10000B958, 0LL, 0LL);
}

uint64_t sub_10000B958()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 24);
    int v16 = *(unsigned __int8 *)(v0 + 92);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = swift_slowAlloc(18LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain(v7);
    *(void *)(v0 + 16) = sub_10000E55C(v6, v7, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v8 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    *(_WORD *)(v8 + 12) = 1024;
    *(_DWORD *)(v0 + 88) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 92, v8 + 14);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: clearViewWithName called [name: %s, fullRebuild: %{BOOL}d]",  (uint8_t *)v8,  0x12u);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 32), 2LL);
  }

  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v10 = type metadata accessor for Configuration(0LL);
  *(void *)(v0 + 40) = v10;
  sub_100003848(v10, (uint64_t)qword_100019078);
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v0 + 48) = v11;
  uint64_t v12 = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 56) = v12;
  uint64_t v13 = (*(uint64_t (**)(void))(v11 + 16))();
  static Task<>.checkCancellation()(v13);
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  *(void *)(v0 + 64) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v12);
  uint64_t v14 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.clear(viewName:fullRebuild:)[1]);
  *(void *)(v0 + 72) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_10000BC54;
  return ViewUpdate.ViewInProcessRunner.clear(viewName:fullRebuild:)( *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(unsigned __int8 *)(v0 + 92));
}

uint64_t sub_10000BC54()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  *(void *)(*(void *)v1 + 80LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000D190;
  }
  else {
    uint64_t v3 = sub_10000D1A0;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000BCB8(uint64_t a1, uint64_t a2, char a3)
{
  *(_BYTE *)(v3 + 92) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return swift_task_switch(sub_10000BCD4, 0LL, 0LL);
}

uint64_t sub_10000BCD4()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 24);
    int v16 = *(unsigned __int8 *)(v0 + 92);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = swift_slowAlloc(18LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain(v7);
    *(void *)(v0 + 16) = sub_10000E55C(v6, v7, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v8 + 4);
    swift_bridgeObjectRelease_n(v7, 3LL);
    *(_WORD *)(v8 + 12) = 1024;
    *(_DWORD *)(v0 + 88) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 92, v8 + 14);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: truncateViewWithName called [name: %s, fullRebuild: %{BOOL}d]",  (uint8_t *)v8,  0x12u);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 32), 2LL);
  }

  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v10 = type metadata accessor for Configuration(0LL);
  *(void *)(v0 + 40) = v10;
  sub_100003848(v10, (uint64_t)qword_100019078);
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v0 + 48) = v11;
  uint64_t v12 = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 56) = v12;
  uint64_t v13 = (*(uint64_t (**)(void))(v11 + 16))();
  static Task<>.checkCancellation()(v13);
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  *(void *)(v0 + 64) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v12);
  uint64_t v14 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.truncate(viewName:fullRebuild:)[1]);
  *(void *)(v0 + 72) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_10000BFD0;
  return ViewUpdate.ViewInProcessRunner.truncate(viewName:fullRebuild:)( *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(unsigned __int8 *)(v0 + 92));
}

uint64_t sub_10000BFD0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  *(void *)(*(void *)v1 + 80LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000C090;
  }
  else {
    uint64_t v3 = sub_10000C034;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000C034()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  swift_release(*(void *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1LL);
}

uint64_t sub_10000C090()
{
  uint64_t v1 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 48) + 8LL))(v1, *(void *)(v0 + 40));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_10000C0E4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a4;
  *(_BYTE *)(v4 + 108) = a3;
  *(void *)(v4 + 32) = a1;
  return swift_task_switch(sub_10000C104, 0LL, 0LL);
}

uint64_t sub_10000C104()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void **)(v0 + 48);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void **)(v0 + 48);
  if (v6)
  {
    uint64_t v8 = *(void *)(v0 + 32);
    int v22 = *(unsigned __int8 *)(v0 + 108);
    unint64_t v9 = *(void *)(v0 + 40);
    uint64_t v10 = swift_slowAlloc(28LL, -1LL);
    uint64_t v23 = swift_slowAlloc(64LL, -1LL);
    v24[0] = v23;
    *(_DWORD *)uint64_t v10 = 136315650;
    swift_bridgeObjectRetain(v9);
    *(void *)(v0 + 16) = sub_10000E55C(v8, v9, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v10 + 4);
    swift_bridgeObjectRelease_n(v9, 3LL);
    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 104) = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 108, v10 + 14);
    *(_WORD *)(v10 + 18) = 2080;
    id v11 = [v7 identifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    unint64_t v14 = v13;

    *(void *)(v0 + 24) = sub_10000E55C(v12, v14, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v10 + 20);
    swift_bridgeObjectRelease(v14);

    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: clearViewWithName called [name: %s, fullRebuild: %{BOOL}d] account: %s",  (uint8_t *)v10,  0x1Cu);
    swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 40), 2LL);
  }

  uint64_t v15 = type metadata accessor for Configuration(0LL);
  *(void *)(v0 + 56) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v0 + 64) = v16;
  uint64_t v17 = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 72) = v17;
  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v18 = *(void *)(v0 + 48);
  sub_100003848(v15, (uint64_t)qword_100019078);
  uint64_t v19 = Configuration.copyConfiguration(for:)(v18);
  static Task<>.checkCancellation()(v19);
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  *(void *)(v0 + 80) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v17);
  uint64_t v20 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.clear(viewName:fullRebuild:)[1]);
  *(void *)(v0 + 88) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_10000C490;
  return ViewUpdate.ViewInProcessRunner.clear(viewName:fullRebuild:)( *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(unsigned __int8 *)(v0 + 108));
}

uint64_t sub_10000C490()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 88LL);
  *(void *)(*(void *)v1 + 96LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000D180;
  }
  else {
    uint64_t v3 = sub_10000D198;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000C4F4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a4;
  *(_BYTE *)(v4 + 108) = a3;
  *(void *)(v4 + 32) = a1;
  return swift_task_switch(sub_10000C514, 0LL, 0LL);
}

uint64_t sub_10000C514()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void **)(v0 + 48);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003848(v3, (uint64_t)qword_1000190B0);
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void **)(v0 + 48);
  if (v6)
  {
    uint64_t v8 = *(void *)(v0 + 32);
    int v22 = *(unsigned __int8 *)(v0 + 108);
    unint64_t v9 = *(void *)(v0 + 40);
    uint64_t v10 = swift_slowAlloc(28LL, -1LL);
    uint64_t v23 = swift_slowAlloc(64LL, -1LL);
    v24[0] = v23;
    *(_DWORD *)uint64_t v10 = 136315650;
    swift_bridgeObjectRetain(v9);
    *(void *)(v0 + 16) = sub_10000E55C(v8, v9, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v10 + 4);
    swift_bridgeObjectRelease_n(v9, 3LL);
    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 104) = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 108, v10 + 14);
    *(_WORD *)(v10 + 18) = 2080;
    id v11 = [v7 identifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    unint64_t v14 = v13;

    *(void *)(v0 + 24) = sub_10000E55C(v12, v14, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v10 + 20);
    swift_bridgeObjectRelease(v14);

    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "IntelligencePlatformComputeService: truncateViewWithName called [name: %s, fullRebuild: %{BOOL}d] account: %s",  (uint8_t *)v10,  0x1Cu);
    swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(*(void *)(v0 + 40), 2LL);
  }

  uint64_t v15 = type metadata accessor for Configuration(0LL);
  *(void *)(v0 + 56) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v0 + 64) = v16;
  uint64_t v17 = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 72) = v17;
  if (qword_100018B10 != -1) {
    swift_once(&qword_100018B10, sub_100003FEC);
  }
  uint64_t v18 = *(void *)(v0 + 48);
  sub_100003848(v15, (uint64_t)qword_100019078);
  uint64_t v19 = Configuration.copyConfiguration(for:)(v18);
  static Task<>.checkCancellation()(v19);
  type metadata accessor for ViewUpdate.ViewInProcessRunner(0LL);
  *(void *)(v0 + 80) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)(v17);
  uint64_t v20 = (void *)swift_task_alloc(async function pointer to ViewUpdate.ViewInProcessRunner.truncate(viewName:fullRebuild:)[1]);
  *(void *)(v0 + 88) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_10000C8A0;
  return ViewUpdate.ViewInProcessRunner.truncate(viewName:fullRebuild:)( *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(unsigned __int8 *)(v0 + 108));
}

uint64_t sub_10000C8A0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 88LL);
  *(void *)(*(void *)v1 + 96LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000C960;
  }
  else {
    uint64_t v3 = sub_10000C904;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000C904()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_release(*(void *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1LL);
}

uint64_t sub_10000C960()
{
  uint64_t v1 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 64) + 8LL))(v1, *(void *)(v0 + 56));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_10000C9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000AF38(&qword_100018F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CA00()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10000CA3C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  os_log_type_t v5 = *(void **)(v0 + 40);
  BOOL v6 = *(void **)(v0 + 48);
  unint64_t v7 = (void *)swift_task_alloc(dword_100018CDC);
  *(void *)(v1 + 16) = v7;
  *unint64_t v7 = v1;
  v7[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *, void *))((char *)&dword_100018CD8 + dword_100018CD8))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_10000CACC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  os_log_type_t v5 = (void *)v0[5];
  BOOL v6 = (void *)v0[6];
  unint64_t v7 = (void *)swift_task_alloc(dword_100018D04);
  *(void *)(v1 + 16) = v7;
  *unint64_t v7 = v1;
  v7[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *, void *))((char *)&dword_100018D00 + dword_100018D00))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_10000CB58(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for Configuration(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v10 = (void *)swift_task_alloc(dword_100018D3C);
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000D194;
  v10[6] = v8;
  v10[7] = v9;
  v10[4] = v6;
  v10[5] = v7;
  v10[3] = a1;
  return swift_task_switch(sub_100007F2C, 0LL, 0LL);
}

uint64_t sub_10000CC0C()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10000CC50()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  unint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc(dword_100018D5C);
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10000CCD0;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *, void *))((char *)&dword_100018D58 + dword_100018D58))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_10000CCD0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000CD20(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_10000CD5C()
{
  uint64_t v1 = type metadata accessor for Configuration(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10000CDF4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for Configuration(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v10 = (void *)swift_task_alloc(dword_100018D94);
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000CCD0;
  v10[6] = v8;
  v10[7] = v9;
  v10[4] = v6;
  v10[5] = v7;
  v10[3] = a1;
  return swift_task_switch(sub_100006020, 0LL, 0LL);
}

uint64_t sub_10000CEA4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(_BYTE *)(v0 + 24);
  unint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc(dword_100018DB4);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, char, void *, void *))((char *)&dword_100018DB0 + dword_100018DB0))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000CF2C()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000CF60()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(_BYTE *)(v0 + 24);
  unint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc(dword_100018DDC);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, char, void *, void *))((char *)&dword_100018DD8 + dword_100018DD8))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000CFE8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100018E04);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *))((char *)&dword_100018E00 + dword_100018E00))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000D06C()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000D0A8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100018E2C);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000D194;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *))((char *)&dword_100018E28 + dword_100018E28))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000D128()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000D154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10000D1B4()
{
  uint64_t v0 = sub_10000AF38(&qword_100018F00);
  sub_100003808(v0, qword_100019098);
  uint64_t v1 = sub_100003848(v0, (uint64_t)qword_100019098);
  uint64_t v2 = type metadata accessor for Configuration(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v1, 1LL, 1LL, v2);
}

uint64_t sub_10000D21C(void *a1)
{
  uint64_t v2 = sub_10000AF38(&qword_100018F70);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_100003848(v5, (uint64_t)qword_1000190B0);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "XPC connection is invalid, stopping work", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v4, 1LL, 1LL, v10);
  id v11 = (void *)swift_allocObject(&unk_100014D08, 40LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = a1;
  id v12 = a1;
  uint64_t v13 = sub_10000D914((uint64_t)v4, (uint64_t)&unk_100018FC0, (uint64_t)v11);
  return swift_release(v13);
}

uint64_t sub_10000D390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  return swift_task_switch(sub_10000D3A8, 0LL, 0LL);
}

uint64_t sub_10000D3A8()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003848(v1, (uint64_t)qword_1000190B0);
  v0[9] = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: stop called", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = v0[8];

  uint64_t v7 = *(void *)(v6
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v7;
  return swift_task_switch(sub_10000D4A4, v7, 0LL);
}

uint64_t sub_10000D4A4()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 16, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        os_log_type_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v20 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v20);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C50);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_10000D6D0, 0LL, 0LL);
}

uint64_t sub_10000D6D0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return swift_task_switch(sub_10000D6F4, v1, 0LL);
}

uint64_t sub_10000D6F4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 40, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v20 = v0;
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        os_log_type_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v21 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v21);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        uint64_t v0 = v20;
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C58);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000FB94(a1, &qword_100018F70);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100014CE0, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100018F90, v17);
}

uint64_t sub_10000DA60(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10000DA8C(void *a1)
{
  uint64_t v2 = sub_10000AF38(&qword_100018F70);
  __chkstk_darwin(v2);
  uint64_t v4 = &v24[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (qword_100018B18 != -1) {
    swift_once(&qword_100018B18, sub_10000D1B4);
  }
  uint64_t v5 = sub_10000AF38(&qword_100018F00);
  uint64_t v6 = sub_100003848(v5, (uint64_t)qword_100019098);
  uint64_t v7 = swift_beginAccess(v6, v24, 0LL, 0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  sub_10000C9B4(v6, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for Configuration(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10) == 1)
  {
    __break(1u);
LABEL_11:
    _exit(1);
  }

  char v12 = Configuration.isIPCSMemoryTransactionEnabled.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_100003848(v13, (uint64_t)qword_1000190B0);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: Recieved SIGTERM, stopping work",  v17,  2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v4, 1LL, 1LL, v18);
  uint64_t v19 = (void *)swift_allocObject(&unk_100014CB8, 40LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = a1;
  id v20 = a1;
  uint64_t v21 = sub_10000D914((uint64_t)v4, (uint64_t)&unk_100018F80, (uint64_t)v19);
  return swift_release(v21);
}

uint64_t sub_10000DCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  return swift_task_switch(sub_10000DD10, 0LL, 0LL);
}

uint64_t sub_10000DD10()
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003848(v1, (uint64_t)qword_1000190B0);
  v0[9] = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: stop called", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = v0[8];

  uint64_t v7 = *(void *)(v6
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v7;
  return swift_task_switch(sub_10000DE0C, v7, 0LL);
}

uint64_t sub_10000DE0C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 16, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        uint64_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v20 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v20);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C50);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_10000E038, 0LL, 0LL);
}

uint64_t sub_10000E038()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return swift_task_switch(sub_10000E05C, v1, 0LL);
}

uint64_t sub_10000E05C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess(v1 + 112, v0 + 40, 1LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v19 = (void *)(v1 + 112);
    uint64_t v18 = swift_bridgeObjectRetain(v3);
    uint64_t v5 = (unint64_t *)(v18 + 48);
    uint64_t v6 = (uint64_t *)&unk_100018FA0;
    do
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v12 = *(v5 - 1);
      unint64_t v13 = *v5;
      swift_bridgeObjectRetain_n(*v5, 2LL);
      uint64_t v14 = swift_retain(v11);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v7 = swift_slowAlloc(12LL, -1LL);
        uint64_t v8 = v6;
        uint64_t v9 = swift_slowAlloc(32LL, -1LL);
        uint64_t v20 = v9;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain(v13);
        *(void *)(v7 + 4) = sub_10000E55C(v12, v13, &v20);
        swift_bridgeObjectRelease_n(v13, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "IntelligencePlatformComputeService: cancelling task %s",  (uint8_t *)v7,  0xCu);
        swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v10 = v9;
        uint64_t v6 = v8;
        swift_slowDealloc(v10, -1LL, -1LL);
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v13, 2LL);
      }

      sub_10000AF38(&qword_100018C58);
      sub_10000AF38(v6);
      Task.cancel()();
      swift_release(v11);
      v5 += 3;
      --v4;
    }

    while (v4);
    swift_bridgeObjectRelease(v18);
    uint64_t v2 = v19;
    uint64_t v3 = *v19;
  }

  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_10000E288, 0LL, 0LL);
}

uint64_t sub_10000E288()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000E34C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id BMDaemonLibraryLoader.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id IntelligencePlatformComputeServiceXPC.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for IntelligencePlatformComputeServiceXPC()
{
  return objc_opt_self(&OBJC_CLASS____TtC34IntelligencePlatformComputeService37IntelligencePlatformComputeServiceXPC);
}

uint64_t type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtCC34IntelligencePlatformComputeService37IntelligencePlatformComputeServiceXPC15ServiceDelegate);
}

uint64_t sub_10000E450(uint64_t result, _BYTE **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000E460( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000E494@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

_BYTE **sub_10000E4BC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000E4CC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000E4EC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_10000E55C(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_10000E55C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E62C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000FC84((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000FC84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000FC64(v12);
  return v7;
}

uint64_t sub_10000E62C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_10000E7E4(a5, a6);
    *a1 = v13;
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

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_10000E7E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E878(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EA50(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EA50(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E878(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_10000E9EC(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10000E9EC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10000AF38(&qword_100018FB0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000EA50(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000AF38(&qword_100018FB0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_10000EB9C(uint64_t a1)
{
  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003848(v2, (uint64_t)qword_1000190B0);
  unint64_t v3 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeServiceXPC: starting...", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  if (qword_100018B18 != -1) {
    swift_once(&qword_100018B18, sub_10000D1B4);
  }
  uint64_t v6 = sub_10000AF38(&qword_100018F00);
  uint64_t v7 = sub_100003848(v6, (uint64_t)qword_100019098);
  __chkstk_darwin();
  int64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v10 = type metadata accessor for Configuration(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0LL, 1LL, v10);
  swift_beginAccess(v7, v15, 33LL, 0LL);
  sub_10000FD50((uint64_t)v9, v7);
  swift_endAccess(v15);
  id v12 = [objc_allocWithZone((Class)type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate()) init];
  id v13 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  [v13 setDelegate:v12];
  [v13 resume];

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000039LL,  0x8000000100011080LL,  "IntelligencePlatformComputeService/IntelligencePlatformComputeServiceXPC.swift",  78LL,  2LL,  30LL,  0);
  __break(1u);
}

uint64_t sub_10000EDF0(void *a1)
{
  if (qword_100018B18 != -1) {
    swift_once(&qword_100018B18, sub_10000D1B4);
  }
  id ObjectType = a1;
  uint64_t v2 = sub_10000AF38(&qword_100018F00);
  uint64_t v3 = sub_100003848(v2, (uint64_t)qword_100019098);
  uint64_t v4 = swift_beginAccess(v3, v100, 0LL, 0LL);
  *(void *)&__int128 v91 = &v87;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000C9B4(v3, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for Configuration(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }

  uint64_t v10 = type metadata accessor for Options(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  unint64_t v14 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  Configuration.options.getter(v13);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  uint64_t v16 = __chkstk_darwin(v15);
  static Options.noOperation.getter(v16);
  uint64_t v17 = sub_10000FA60( &qword_100018F08,  (uint64_t (*)(uint64_t))&type metadata accessor for Options,  (uint64_t)&protocol conformance descriptor for Options);
  char v18 = dispatch thunk of SetAlgebra.isSuperset(of:)((char *)&v87 - v14, v10, v17);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  v19((char *)&v87 - v14, v10);
  v19((char *)&v87 - v14, v10);
  if ((v18 & 1) != 0)
  {
    if (qword_100018B20 != -1) {
      swift_once(&qword_100018B20, sub_10000FEC0);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    uint64_t v21 = sub_100003848(v20, (uint64_t)qword_1000190B0);
    id v22 = (id)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled((os_log_t)v22, v23))
    {
      uint64_t v29 = 0LL;
LABEL_41:

      return v29;
    }

    char v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v24 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v23,  "IntelligencePlatformComputeService: service is in no-op mode.",  v24,  2u);
    unint64_t v25 = v24;
LABEL_25:
    swift_slowDealloc(v25, -1LL, -1LL);
    uint64_t v29 = 0LL;
    goto LABEL_41;
  }

  id v26 = ObjectType;
  id v27 = [ObjectType valueForEntitlement:kGDCComputeServiceName];
  if (v27)
  {
    id v28 = v27;
    _bridgeAnyObjectToAny(_:)(v99);
    swift_unknownObjectRelease(v28);
  }

  else
  {
    memset(v99, 0, sizeof(v99));
  }

  sub_10000F9CC((uint64_t)v99, (uint64_t)&aBlock);
  if (!v95)
  {
    sub_10000FB94((uint64_t)&aBlock, &qword_100018F10);
LABEL_21:
    if (qword_100018B20 != -1) {
      swift_once(&qword_100018B20, sub_10000FEC0);
    }
    uint64_t v35 = type metadata accessor for Logger(0LL);
    sub_100003848(v35, (uint64_t)qword_1000190B0);
    id v36 = v26;
    id v22 = (id)Logger.logObject.getter(v36);
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled((os_log_t)v22, v37))
    {

      uint64_t v29 = 0LL;
      id v22 = v36;
      goto LABEL_41;
    }

    uint64_t v38 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v38 = 67109120;
    LODWORD(aBlock) = [v36 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v38 + 4);

    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v37,  "IntelligencePlatformComputeService: Rejecting connection from %d: lacking entitlement",  v38,  8u);
    unint64_t v25 = v38;
    goto LABEL_25;
  }

  if (!swift_dynamicCast(&v98, &aBlock, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL)
    || (v98 & 1) == 0)
  {
    goto LABEL_21;
  }

  if (qword_100018B20 != -1) {
    swift_once(&qword_100018B20, sub_10000FEC0);
  }
  uint64_t v30 = type metadata accessor for Logger(0LL);
  sub_100003848(v30, (uint64_t)qword_1000190B0);
  id v31 = v26;
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v34 = 67109120;
    LODWORD(aBlock) = [v31 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v34 + 4);

    _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "IntelligencePlatformComputeService: connection from %d",  v34,  8u);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  else
  {

    uint64_t v32 = (os_log_s *)v31;
  }

  id v39 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL___GDCIntelligencePlatformComputeServiceProtocol];
  [v31 setExportedInterface:v39];

  uint64_t v40 = sub_10000AF38(&qword_100018F18);
  uint64_t v41 = swift_allocObject(v40, 96LL, 7LL);
  __int128 v91 = xmmword_100010910;
  *(_OWORD *)(v41 + 16) = xmmword_100010910;
  uint64_t v42 = sub_10000CD20(0LL, &qword_100018F20, &OBJC_CLASS___NSArray_ptr);
  uint64_t v43 = sub_10000AF38(&qword_100018F28);
  *(void *)(v41 + 56) = v43;
  *(void *)(v41 + 32) = v42;
  uint64_t v44 = sub_10000CD20(0LL, &qword_100018F30, &OBJC_CLASS___GDViewUpdateSourceRequest_ptr);
  *(void *)(v41 + 88) = sub_10000AF38(&qword_100018F38);
  *(void *)(v41 + 64) = v44;
  id v45 = objc_allocWithZone(&OBJC_CLASS___NSSet);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v41);
  id v47 = [v45 initWithArray:isa];

  aBlock = 0LL;
  uint64_t result = static Set._forceBridgeFromObjectiveC(_:result:)( v47,  &aBlock,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  uint64_t v48 = aBlock;
  if (!aBlock) {
    goto LABEL_43;
  }

  id v49 = [v31 exportedInterface];
  if (v49)
  {
    uint64_t v50 = v49;
    Class v51 = Set._bridgeToObjectiveC()().super.isa;
    [v50 setClasses:v51 forSelector:"updateViewWithName:viewUpdateSourceRequests:reply:" argumentIndex:1 ofReply:0];
  }

  id v52 = [v31 exportedInterface];
  if (v52)
  {
    uint64_t v53 = v52;
    Class v54 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v48);
    [v53 setClasses:v54 forSelector:"updateViewWithName:viewUpdateSourceRequests:account:reply:" argumentIndex:1 ofReply:0];
  }

  else
  {
    swift_bridgeObjectRelease(v48);
  }

  uint64_t v55 = swift_allocObject(v40, 96LL, 7LL);
  *(_OWORD *)(v55 + 16) = v91;
  *(void *)(v55 + 56) = v43;
  *(void *)(v55 + 32) = v42;
  uint64_t v56 = sub_10000CD20(0LL, &qword_100018F40, &OBJC_CLASS___GDViewUpdateNameAndRequests_ptr);
  *(void *)(v55 + 88) = sub_10000AF38(&qword_100018F48);
  *(void *)(v55 + 64) = v56;
  id v57 = objc_allocWithZone(&OBJC_CLASS___NSSet);
  Class v58 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v55);
  id v59 = [v57 initWithArray:v58];

  aBlock = 0LL;
  uint64_t result = static Set._forceBridgeFromObjectiveC(_:result:)( v59,  &aBlock,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  v60 = aBlock;
  if (aBlock)
  {

    id v61 = [v31 exportedInterface];
    if (v61)
    {
      v62 = v61;
      Class v63 = Set._bridgeToObjectiveC()().super.isa;
      [v62 setClasses:v63 forSelector:"updateGroupWithName:namesAndRequests:reply:" argumentIndex:1 ofReply:0];
    }

    id v64 = [v31 exportedInterface];
    if (v64)
    {
      v65 = v64;
      Class v66 = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v60);
      [v65 setClasses:v66 forSelector:"updateGroupWithName:namesAndRequests:account:reply:" argumentIndex:1 ofReply:0];
    }

    else
    {
      swift_bridgeObjectRelease(v60);
    }

    id v67 = [objc_allocWithZone((Class)type metadata accessor for IntelligencePlatformComputeService()) init];
    [v31 setExportedObject:v67];
    uint64_t v68 = swift_allocObject(&unk_100014C18, 24LL, 7LL);
    *(void *)(v68 + 16) = v67;
    v96 = sub_10000FA38;
    uint64_t v97 = v68;
    aBlock = _NSConcreteStackBlock;
    uint64_t v93 = 1107296256LL;
    v94 = sub_10000DA60;
    v95 = &unk_100014C30;
    v69 = _Block_copy(&aBlock);
    uint64_t v70 = v97;
    id v71 = v67;
    swift_release(v70);
    [v31 setInvalidationHandler:v69];
    _Block_release(v69);
    sub_10000CD20(0LL, &qword_100018F50, &OBJC_CLASS___OS_dispatch_source_ptr);
    uint64_t v72 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, 0LL);
    id ObjectType = (id)swift_getObjectType(v72);
    uint64_t v73 = swift_allocObject(&unk_100014C68, 24LL, 7LL);
    *(void *)(v73 + 16) = v71;
    v96 = sub_10000FA58;
    uint64_t v97 = v73;
    aBlock = _NSConcreteStackBlock;
    uint64_t v93 = 1107296256LL;
    v94 = sub_10000DA60;
    v95 = &unk_100014C80;
    v74 = _Block_copy(&aBlock);
    *(void *)&__int128 v91 = v31;
    v75 = v74;
    uint64_t v88 = type metadata accessor for DispatchQoS(0LL);
    v89 = &v87;
    uint64_t v76 = *(void *)(v88 - 8);
    __chkstk_darwin(v88);
    v78 = (char *)&v87 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v22 = v71;
    static DispatchQoS.unspecified.getter();
    uint64_t v79 = type metadata accessor for DispatchWorkItemFlags(0LL);
    uint64_t v87 = (uint64_t)&v87;
    uint64_t v80 = *(void *)(v79 - 8);
    __chkstk_darwin(v79);
    v82 = (char *)&v87 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    *(void *)&v99[0] = &_swiftEmptyArrayStorage;
    uint64_t v84 = sub_10000FA60(&qword_100018F58, v83, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v85 = sub_10000AF38(&qword_100018F60);
    unint64_t v86 = sub_10000FAA0();
    dispatch thunk of SetAlgebra.init<A>(_:)(v99, v85, v86, v79, v84);
    OS_dispatch_source.setEventHandler(qos:flags:handler:)(v78, v82, v75, ObjectType);
    _Block_release(v75);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v82, v79);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v88);
    swift_release(v97);
    OS_dispatch_source.resume()();
    [(id)v91 resume];
    swift_unknownObjectRelease(v72);
    uint64_t v29 = 1LL;
    goto LABEL_41;
  }

LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_10000F9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000AF38(&qword_100018F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FA14()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000FA38()
{
  return sub_10000D21C(*(void **)(v0 + 16));
}

uint64_t sub_10000FA40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FA50(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000FA58()
{
  return sub_10000DA8C(*(void **)(v0 + 16));
}

uint64_t sub_10000FA60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10000FAA0()
{
  unint64_t result = qword_100018F68;
  if (!qword_100018F68)
  {
    uint64_t v1 = sub_10000FAEC(&qword_100018F60);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100018F68);
  }

  return result;
}

uint64_t sub_10000FAEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000FB34()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_100018F7C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000CCD0;
  v3[8] = v2;
  return swift_task_switch(sub_10000DD10, 0LL, 0LL);
}

uint64_t sub_10000FB94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000AF38(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000FBD0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000FBF4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100018F8C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000CCD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100018F88 + dword_100018F88))(a1, v4);
}

uint64_t sub_10000FC64(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000FC84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000FCC4()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000FCF0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_100018FBC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000D194;
  v3[8] = v2;
  return swift_task_switch(sub_10000D3A8, 0LL, 0LL);
}

uint64_t sub_10000FD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000AF38(&qword_100018F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t static BMDaemonLibraryLoader.loadRootLibrary()()
{
  uint64_t v0 = type metadata accessor for Library(0LL);
  unint64_t v1 = sub_100003F60();
  return static UnifiedLibrary.add(library:)(v0, v1);
}

id BMDaemonLibraryLoader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for BMDaemonLibraryLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34IntelligencePlatformComputeService21BMDaemonLibraryLoader);
}

id BMDaemonLibraryLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000FEC0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100003808(v0, qword_1000190B0);
  sub_100003848(v0, (uint64_t)qword_1000190B0);
  return Logger.init(subsystem:category:)( 0xD000000000000041LL,  0x8000000100010A70LL,  0x746C7561666544LL,  0xE700000000000000LL);
}

uint64_t sub_10000FF34@<X0>(char *a1@<X0>, int a2@<W2>, void *a3@<X8>)
{
  uint64_t result = confstr(a2, a1, 0x400uLL);
  if (result >= 1 && a1)
  {
    uint64_t result = String.init(cString:)(a1);
    *a3 = result;
    a3[1] = v6;
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  return result;
}

uint64_t String.realpath.getter()
{
  uint64_t v0 = String.utf8CString.getter();
  unint64_t v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0LL);
  swift_release(v0);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = String.init(cString:)(v1);
  swift_slowDealloc(v1, -1LL, -1LL);
  return v2;
}