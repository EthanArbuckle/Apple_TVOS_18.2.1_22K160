int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  sub_100002FF8(&qword_100008010);
  __chkstk_darwin();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = type metadata accessor for Daemon(0LL);
  sub_100003038(v5, qword_100008040);
  sub_100003078(v5, (uint64_t)qword_100008040);
  v6 = objc_autoreleasePoolPush();
  Daemon.init()();
  objc_autoreleasePoolPop(v6);
  TaskPriority.init(rawValue:)(21LL);
  v7 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v4, 0LL, 1LL, v7);
  v8 = swift_allocObject(&unk_100004240, 32LL, 7LL);
  *(void *)(v8 + 16) = 0LL;
  *(void *)(v8 + 24) = 0LL;
  v9 = sub_1000033E4((uint64_t)v4, (uint64_t)&unk_100008020, v8);
  swift_release(v9);
  sub_10000356C((uint64_t)v4);
  v10 = [(id)objc_opt_self(NSRunLoop) currentRunLoop];
  [v10 run];

  return 0;
}

uint64_t sub_100002FF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_100003038(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003078(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003090()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[3] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[4] = v2;
  v0[5] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Daemon(0LL);
  sub_100003078(v3, (uint64_t)qword_100008040);
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to Daemon.start()[1]);
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100003118;
  return Daemon.start()();
}

uint64_t sub_100003118()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *v1;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    return swift_task_switch(sub_10000318C, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v3 + 40));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_10000318C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  static AISLogger.daemon.getter();
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 56);
    v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(void *)(v0 + 16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v6 + 4, v6 + 12);
    uint64_t *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to start daemon: %@", v6, 0xCu);
    uint64_t v9 = sub_100002FF8(&qword_100008038);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    swift_errorRelease(v5);
  }

  else
  {
    uint64_t v10 = *(void *)(v0 + 56);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }

  (*(void (**)(void, void))(*(void *)(v0 + 32) + 8LL))(*(void *)(v0 + 40), *(void *)(v0 + 24));
  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003334()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100003358()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000801C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000339C;
  return sub_100003090();
}

uint64_t sub_10000339C()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000033E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000035AC(a1, (uint64_t)v7);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    sub_10000356C((uint64_t)v7);
    uint64_t v10 = 4096LL;
    uint64_t v11 = *(void *)(a3 + 16);
    if (v11)
    {
LABEL_3:
      uint64_t v12 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v11);
      swift_unknownObjectRetain(v11);
      uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      uint64_t v16 = v15;
      swift_unknownObjectRelease(v11);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v10 = v17 | 0x1000LL;
    uint64_t v11 = *(void *)(a3 + 16);
    if (v11) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
LABEL_6:
  uint64_t v18 = swift_allocObject(&unk_100004268, 32LL, 7LL);
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }

  else
  {
    v19 = 0LL;
  }

  return swift_task_create(v10, v19, (char *)&type metadata for () + 8, &unk_100008030, v18);
}

uint64_t sub_10000356C(uint64_t a1)
{
  uint64_t v2 = sub_100002FF8(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000035AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FF8(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000035F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003658;
  return v6(a1);
}

uint64_t sub_100003658()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000036A4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000036C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000802C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000339C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100008028 + dword_100008028))(a1, v4);
}