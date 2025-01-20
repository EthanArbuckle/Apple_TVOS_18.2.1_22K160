void sub_100002F3C(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (__cdecl *v16)(int);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void v26[5];
  v2 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  v4 = (char *)&v26[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  v6 = (char *)&v26[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v26[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = type metadata accessor for MainActor(0LL);
  v12 = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19LL, 1LL, 11LL, v13, v15);
  }
  if (!sub_1000034DC()) {
    exit(1);
  }
  v16 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(13, v16);
  sub_10000334C();
  v17 = (*(uint64_t (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v7);
  static DispatchQoS.unspecified.getter(v17);
  v26[0] = &_swiftEmptyArrayStorage;
  v18 = sub_100003388();
  v19 = sub_1000033D0(&qword_100008010);
  v20 = sub_100003410();
  dispatch thunk of SetAlgebra.init<A>(_:)(v26, v19, v20, v2, v18);
  v21 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0x6E6F6D656144584ELL,  0xE800000000000000LL,  v6,  v4,  v10,  0LL);
  v26[3] = type metadata accessor for NXDaemonEnvironmentDarwin(0LL);
  v26[4] = &protocol witness table for NXDaemonEnvironmentDarwin;
  sub_1000034A0(v26);
  v22 = v21;
  NXDaemonEnvironmentDarwin.init()();
  v23 = type metadata accessor for NXDaemon(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = NXDaemon.init(dispatchQueue:environment:)(v22, v26);
  NXDaemon.activate()();
  swift_release(v12);

  *a1 = v24;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  uint64_t v4 = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  uint64_t v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("", 0LL, 1LL, 0LL, v5, v7);
  }
  sub_100003258();
  swift_release(v4);
  return 0;
}

void sub_100003258()
{
  uint64_t v1 = type metadata accessor for MainActor(0LL);
  static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  uint64_t v4 = v3;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19LL, 1LL, 10LL, v2, v4);
  }
  uint64_t v5 = objc_autoreleasePoolPush();
  sub_100002F3C(&v9);
  if (!v0)
  {
    objc_autoreleasePoolPop(v5);
    static MainActor.shared.getter();
    uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
    uint64_t v8 = v7;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19LL, 1LL, 25LL, v6, v8);
    }
    dispatch_main();
  }

  objc_autoreleasePoolPop(v5);
  __break(1u);
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

unint64_t sub_10000334C()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }

  return result;
}

unint64_t sub_100003388()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }

  return result;
}

uint64_t sub_1000033D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003410()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    uint64_t v1 = sub_10000345C(&qword_100008010);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008018);
  }

  return result;
}

uint64_t sub_10000345C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void *sub_1000034A0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

BOOL sub_1000034DC()
{
  if ((_set_user_dir_suffix("com.apple.nexusd") & 1) != 0)
  {
    bzero(buf, 0x400uLL);
    size_t v0 = confstr(65537, (char *)buf, 0x400uLL);
    BOOL v1 = v0 != 0;
    if (!v0)
    {
      id v2 = sub_10000362C();
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
    id v4 = sub_10000362C();
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

id sub_10000362C()
{
  if (qword_100008028 != -1) {
    dispatch_once(&qword_100008028, &stru_100004290);
  }
  return (id)qword_100008020;
}

void sub_10000366C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nexus", "NXDaemon");
  id v2 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v1;
}