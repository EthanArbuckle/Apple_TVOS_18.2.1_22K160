uint64_t sub_100002940@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  v2 = type metadata accessor for UVEnvironmentValues(0LL);
  v29 = *(void *)(v2 - 8);
  v30 = v2;
  __chkstk_darwin();
  v28 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0LL);
  __chkstk_darwin();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = type metadata accessor for MainActor(0LL);
  v27 = static MainActor.shared.getter();
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v13, &protocol witness table for MainActor);
  v16 = v15;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("uservaultd/uservaultd.swift", 27LL, 1LL, 11LL, v14, v16);
  }
  if (!sub_1000033AC()) {
    exit(1);
  }
  v17 = (char *)a1 + *(int *)(sub_100003090(&qword_100008008) + 48);
  UVEnvironmentValues.init()();
  sub_100003208();
  v18 = (*(uint64_t (**)(char *, void, uint64_t))(v10 + 104))( v12,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v9);
  static DispatchQoS.unspecified.getter(v18);
  v31 = &_swiftEmptyArrayStorage;
  v19 = sub_1000032D8( &qword_100008040,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes);
  v20 = sub_100003090(&qword_100008048);
  v21 = sub_100003318();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v20, v21, v4, v19);
  v22 = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)( 0x6E6F6D6561445655LL,  0xE800000000000000LL,  v8,  v6,  v12,  0LL);
  UVEnvironmentValues.dispatchQueue.setter(v22);
  type metadata accessor for UVDaemon(0LL);
  v23 = v28;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v28, v17, v30);
  v24 = UVDaemon.__allocating_init(environment:)(v23);
  result = swift_release(v27);
  *a1 = v24;
  return result;
}

uint64_t sub_100002BEC()
{
  v1 = (void *)swift_task_alloc(async function pointer to UVDaemon.activate()[1]);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000033A8;
  return UVDaemon.activate()();
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  uint64_t v4 = static MainActor.shared.getter(v3);
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  uint64_t v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("", 0LL, 1LL, 0LL, v5, v7);
  }
  sub_100002D8C();
  swift_release(v4);
  return 0;
}

uint64_t sub_100002CDC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100002D40;
  return v6(a1);
}

uint64_t sub_100002D40()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_100002D8C()
{
  uint64_t v0 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v0);
  uint64_t v4 = (char *)v34 - v3;
  uint64_t v5 = sub_100003090(&qword_100008008);
  __chkstk_darwin(v5);
  uint64_t v7 = (void *)((char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = type metadata accessor for UVEnvironmentValues(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for MainActor(0LL);
  ((void (*)(void))static MainActor.shared.getter)();
  uint64_t v36 = v12;
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  uint64_t v15 = v14;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("uservaultd/uservaultd.swift", 27LL, 1LL, 9LL, v13, v15);
  }
  v16 = objc_autoreleasePoolPush();
  sub_100002940(v7);
  if (!v34[1])
  {
    objc_autoreleasePoolPop(v16);
    uint64_t v17 = *v7;
    uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v11, (char *)v7 + *(int *)(v5 + 48), v8);
    uint64_t v19 = UVEnvironmentValues.dispatchQueue.getter(v18);
    uint64_t v20 = type metadata accessor for TaskPriority(0LL);
    uint64_t v21 = *(void *)(v20 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v4, 1LL, 1LL, v20);
    sub_100003180((uint64_t)v4, (uint64_t)v2);
    int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v2, 1LL, v20);
    uint64_t v23 = swift_retain(v17);
    if (v22 == 1)
    {
      sub_1000031C8((uint64_t)v2);
      uint64_t v24 = 7168LL;
    }

    else
    {
      unsigned __int8 v25 = TaskPriority.rawValue.getter(v23);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v2, v20);
      uint64_t v24 = v25 | 0x1C00LL;
    }

    uint64_t v26 = sub_1000032D8( &qword_100008020,  (uint64_t (*)(uint64_t))sub_100003208,  (uint64_t)&_sSo33OS_dispatch_queue_serial_executorCSch9UserVaultMc);
    uint64_t v27 = swift_allocObject(&unk_1000042A8, 32LL, 7LL);
    *(void *)(v27 + 16) = &unk_100008018;
    *(void *)(v27 + 24) = v17;
    v35[0] = 6LL;
    v35[1] = 0LL;
    v35[2] = v19;
    v35[3] = v26;
    uint64_t v28 = swift_task_create(v24, v35, (char *)&type metadata for () + 8, &unk_100008038, v27);
    uint64_t v29 = swift_release(v28);
    uint64_t v30 = v36;
    static MainActor.shared.getter(v29);
    uint64_t v31 = dispatch thunk of Actor.unownedExecutor.getter(v30, &protocol witness table for MainActor);
    uint64_t v33 = v32;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor("uservaultd/uservaultd.swift", 27LL, 1LL, 22LL, v31, v33);
    }
    dispatch_main();
  }

  objc_autoreleasePoolPop(v16);
  __break(1u);
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

uint64_t sub_100003090(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000030D0()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008014);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100003138;
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to UVDaemon.activate()[1]);
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000033A8;
  return UVDaemon.activate()();
}

uint64_t sub_100003138()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100003180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003090(&qword_100008000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000031C8(uint64_t a1)
{
  uint64_t v2 = sub_100003090(&qword_100008000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100003208()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue_serial);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }

  return result;
}

uint64_t sub_100003244()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100003268(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100008034);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100003138;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100008030 + dword_100008030))(a1, v4);
}

uint64_t sub_1000032D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100003318()
{
  unint64_t result = qword_100008050;
  if (!qword_100008050)
  {
    uint64_t v1 = sub_100003364(&qword_100008048);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008050);
  }

  return result;
}

uint64_t sub_100003364(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

BOOL sub_1000033AC()
{
  if ((_set_user_dir_suffix("com.apple.uservaultd") & 1) != 0)
  {
    bzero(buf, 0x400uLL);
    size_t v0 = confstr(65537, (char *)buf, 0x400uLL);
    BOOL v1 = v0 != 0;
    if (!v0)
    {
      id v2 = sub_1000034FC();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v8 = *__error();
        v9[0] = 67109120;
        v9[1] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "### confstr temp dir failed: %{darwin.errno}d",  (uint8_t *)v9,  8u);
      }
    }
  }

  else
  {
    id v4 = sub_1000034FC();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      int v11 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "### _set_user_dir_suffix failed: %{darwin.errno}d",  buf,  8u);
    }

    return 0LL;
  }

  return v1;
}

id sub_1000034FC()
{
  if (qword_100008060 != -1) {
    dispatch_once(&qword_100008060, &stru_1000042E0);
  }
  return (id)qword_100008058;
}

void sub_10000353C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.uservault", "UVDaemon");
  id v2 = (void *)qword_100008058;
  qword_100008058 = (uint64_t)v1;
}