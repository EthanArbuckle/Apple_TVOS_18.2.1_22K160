uint64_t sub_100002CF0()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_1000062E4(v0, qword_100014D38);
  sub_10000613C(v0, (uint64_t)qword_100014D38);
  if (qword_100014D58 != -1) {
    swift_once(&qword_100014D58, sub_10000B9B8);
  }
  return Logger.init(_:)((id)qword_100015AE0);
}

BOOL sub_100002D70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100002D84()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002DC8()
{
}

Swift::Int sub_100002DF0(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100002E30()
{
  if (IOHIDEventGetIntegerValue(v0, 196608LL) == 12 && IOHIDEventGetIntegerValue(v0, 196609LL) == 233) {
    return 0LL;
  }
  if (IOHIDEventGetIntegerValue(v0, 196608LL) == 12 && IOHIDEventGetIntegerValue(v0, 196609LL) == 234) {
    return 1LL;
  }
  if (IOHIDEventGetIntegerValue(v0, 196608LL) == 1 && IOHIDEventGetIntegerValue(v0, 196609LL) == 134) {
    return 3LL;
  }
  if (IOHIDEventGetIntegerValue(v0, 196608LL) == 12 && IOHIDEventGetIntegerValue(v0, 196609LL) == 64) {
    return 2LL;
  }
  return 5LL;
}

BOOL sub_100002F24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100002F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v23 = a1;
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100006028(0LL, (unint64_t *)&qword_100014FE0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v22[1] = v14;
  *(void *)(v4 + 48) = 0LL;
  *(void *)(v4 + 56) = 0LL;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(void *)(v4 + 112) = 0LL;
  static DispatchQoS.unspecified.getter(v14);
  v26 = &_swiftEmptyArrayStorage;
  uint64_t v15 = sub_100006078( &qword_100014FE8,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v16 = sub_100005FA4(&qword_100014FF0);
  uint64_t v17 = sub_1000060B8(&qword_100014FF8, &qword_100014FF0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v16, v17, v9, v15);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))( v8,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v5);
  uint64_t v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000032LL,  0x800000010000E750LL,  v13,  v11,  v8,  0LL);
  uint64_t v19 = v23;
  *(void *)(v4 + 16) = v18;
  *(void *)(v4 + 24) = v19;
  uint64_t v20 = v25;
  *(void *)(v4 + 32) = v24;
  *(void *)(v4 + 40) = v20;
  *(void *)(v4 + 64) = &_swiftEmptySetSingleton;
  *(_BYTE *)(v4 + 72) = 0;
  return v4;
}

void sub_100003144(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t v44 = a2;
  uint64_t v42 = a1;
  v50 = a3;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v47 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  ((void (*)(void))__chkstk_darwin)();
  v43 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v13 = (uint64_t *)((char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v40 - v14);
  uint64_t v16 = type metadata accessor for DispatchTime(0LL);
  uint64_t v40 = *(void *)(v16 - 8);
  uint64_t v41 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  v21 = (char *)&v40 - v20;
  uint64_t v22 = type metadata accessor for OS_dispatch_source.TimerFlags(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100006028(0LL, &qword_100015000, &OBJC_CLASS___OS_dispatch_source_ptr);
  static OS_dispatch_source.TimerFlags.strict.getter();
  uint64_t v26 = static OS_dispatch_source.makeTimerSource(flags:queue:)(v25, 0LL);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  uint64_t ObjectType = swift_getObjectType(v26);
  static DispatchTime.now()();
  double v28 = a4 * 1000.0;
  if ((~COERCE__INT64(a4 * 1000.0) & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v28 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v28 < 9.22337204e18)
  {
    *uint64_t v15 = (uint64_t)v28;
    v29 = *(void (**)(void *, void, uint64_t))(v10 + 104);
    v29(v15, enum case for DispatchTimeInterval.milliseconds(_:), v9);
    + infix(_:_:)(v19, v15);
    v30 = *(void (**)(void *, uint64_t))(v10 + 8);
    v30(v15, v9);
    v31 = *(void (**)(char *, uint64_t))(v40 + 8);
    v32 = v19;
    uint64_t v33 = v41;
    v31(v32, v41);
    v29(v15, enum case for DispatchTimeInterval.never(_:), v9);
    void *v13 = 0LL;
    v29(v13, enum case for DispatchTimeInterval.nanoseconds(_:), v9);
    OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v21, v15, v13, ObjectType);
    v30(v13, v9);
    v30(v15, v9);
    v31(v21, v33);
    uint64_t v34 = v44;
    aBlock[4] = v42;
    uint64_t v52 = v44;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100003534;
    aBlock[3] = &unk_100010B18;
    v35 = _Block_copy(aBlock);
    uint64_t v36 = swift_retain(v34);
    v37 = v43;
    static DispatchQoS.unspecified.getter(v36);
    v38 = v47;
    sub_100003538();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)(v37, v38, v35, ObjectType);
    _Block_release(v35);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v38, v49);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    swift_release(v52);
    OS_dispatch_source.activate()();
    v39 = v50;
    v50[3] = (uint64_t)&type metadata for DispatchSourceTimerWrapper;
    v39[4] = (uint64_t)&off_100010E88;
    uint64_t *v39 = v26;
    return;
  }

LABEL_7:
  __break(1u);
}

uint64_t sub_100003538()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v1 = sub_100006078( &qword_100015008,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v2 = sub_100005FA4(&qword_100015010);
  uint64_t v3 = sub_1000060B8(&qword_100015018, &qword_100015010);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

Swift::Int sub_1000035E4(uint64_t a1, uint64_t a2)
{
  return sub_100003D80();
}

uint64_t sub_100003648(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

Swift::Int sub_100003668(uint64_t a1, unsigned __int8 a2)
{
  return sub_100003D80();
}

uint64_t sub_1000036C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t result = sub_100002E30();
  if (result != 5)
  {
    LOBYTE(v5) = result;
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a1, 196610LL);
    isEscapingClosureAtFileLocation = *(dispatch_queue_s **)(v2 + 16);
    if (IntegerValue)
    {
      uint64_t v8 = swift_allocObject(&unk_100010CB8, 25LL, 7LL);
      *(void *)(v8 + 16) = v2;
      *(_BYTE *)(v8 + 24) = v5;
      uint64_t v5 = swift_allocObject(&unk_100010CE0, 32LL, 7LL);
      *(void *)(v5 + 16) = sub_100006434;
      *(void *)(v5 + 24) = v8;
      uint64_t v20 = sub_100006668;
      uint64_t v21 = v5;
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 1107296256LL;
      uint64_t v18 = sub_100003648;
      uint64_t v19 = &unk_100010CF8;
      uint64_t v9 = _Block_copy(&v16);
      uint64_t v10 = v21;
      swift_retain(v2);
      swift_retain(v5);
      swift_release(v10);
      dispatch_sync(isEscapingClosureAtFileLocation, v9);
      _Block_release(v9);
      isEscapingClosureAtFileLocation = (dispatch_queue_s *)swift_isEscapingClosureAtFileLocation( v5,  "",  97LL,  125LL,  25LL,  1LL);
      swift_release(v8);
      uint64_t result = swift_release(v5);
      __break(1u);
    }

    uint64_t v11 = swift_allocObject(&unk_100010D30, 25LL, 7LL);
    *(void *)(v11 + 16) = v2;
    *(_BYTE *)(v11 + 24) = v5;
    uint64_t v12 = swift_allocObject(&unk_100010D58, 32LL, 7LL);
    *(void *)(v12 + 16) = sub_100006450;
    *(void *)(v12 + 24) = v11;
    uint64_t v20 = sub_100006668;
    uint64_t v21 = v12;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 1107296256LL;
    uint64_t v18 = sub_100003648;
    uint64_t v19 = &unk_100010D70;
    v13 = _Block_copy(&v16);
    uint64_t v14 = v21;
    swift_retain(v2);
    swift_retain(v12);
    swift_release(v14);
    dispatch_sync(isEscapingClosureAtFileLocation, v13);
    _Block_release(v13);
    char v15 = swift_isEscapingClosureAtFileLocation(v12, "", 97LL, 132LL, 25LL, 1LL);
    swift_release(v11);
    uint64_t result = swift_release(v12);
    if ((v15 & 1) != 0) {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_100003914(uint64_t a1)
{
  uint64_t v2 = a1 + 80;
  swift_beginAccess(a1 + 80, v7, 0LL, 0LL);
  sub_10000618C(v2, (uint64_t)&v8);
  if (*((void *)&v9 + 1))
  {
    sub_10000625C((uint64_t)&v8, (uint64_t)v6);
    sub_1000061D4((uint64_t)&v8);
    uint64_t v3 = sub_1000062A0(v6, v6[3]);
    swift_getObjectType(*v3);
    OS_dispatch_source.cancel()();
    sub_1000062C4(v6);
  }

  else
  {
    sub_1000061D4((uint64_t)&v8);
  }

  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  swift_beginAccess(v2, v6, 33LL, 0LL);
  sub_100006214((uint64_t)&v8, v2);
  swift_endAccess(v6);
  *(_BYTE *)(a1 + 72) = 0;
  swift_beginAccess(a1 + 64, &v8, 1LL, 0LL);
  uint64_t v4 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = &_swiftEmptySetSingleton;
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_100003A10()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  __chkstk_darwin();
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (dispatch_queue_s *)v0[2];
  uint64_t v12 = swift_allocObject(&unk_100010C40, 32LL, 7LL);
  *(void *)(v12 + 16) = sub_100006154;
  *(void *)(v12 + 24) = v0;
  v35 = sub_100006668;
  uint64_t v36 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v32 = 1107296256LL;
  uint64_t v33 = sub_100003648;
  uint64_t v34 = &unk_100010C58;
  v13 = _Block_copy(&aBlock);
  uint64_t v14 = v36;
  swift_retain(v0);
  swift_retain(v12);
  swift_release(v14);
  dispatch_sync(v11, v13);
  _Block_release(v13);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation(v12, "", 97LL, 151LL, 25LL, 1LL);
  swift_release(v0);
  uint64_t result = swift_release(v12);
  if ((v14 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v16 = v0[6];
    if (v16)
    {
      uint64_t v17 = v0[7];
      sub_100006028(0LL, (unint64_t *)&qword_100014FE0, &OBJC_CLASS___OS_dispatch_queue_ptr);
      (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for DispatchQoS.QoSClass.userInteractive(_:),  v7);
      swift_retain(v17);
      uint64_t v18 = (void *)static OS_dispatch_queue.global(qos:)(v10);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v35 = (uint64_t (*)())v16;
      uint64_t v36 = v17;
      aBlock = _NSConcreteStackBlock;
      uint64_t v32 = 1107296256LL;
      uint64_t v33 = sub_100003534;
      uint64_t v34 = &unk_100010C80;
      uint64_t v19 = _Block_copy(&aBlock);
      uint64_t v20 = swift_retain(v17);
      static DispatchQoS.unspecified.getter(v20);
      v30 = &_swiftEmptyArrayStorage;
      uint64_t v21 = sub_100006078( &qword_100015008,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v22 = sub_100005FA4(&qword_100015010);
      uint64_t v23 = sub_1000060B8(&qword_100015018, &qword_100015010);
      uint64_t v24 = v29;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v22, v23, v29, v21);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v6, v3, v19);
      _Block_release(v19);

      sub_100006350(v16, v17);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v3, v24);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v27);
      return swift_release(v36);
    }
  }

  return result;
}

uint64_t sub_100003D54(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

Swift::Int sub_100003D80()
{
  void (*v11)(__int128 *__return_ptr, uint64_t (*)(), uint64_t);
  void v12[5];
  _BYTE v13[24];
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void **)(v1 + 16);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)(v5);
  Swift::Int result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    Swift::Int v9 = *(void *)(v1 + 24);
    swift_beginAccess(v1 + 64, v17, 0LL, 0LL);
    if ((sub_100003F9C(v9, *(void *)(v1 + 64)) & 1) != 0 && (*(_BYTE *)(v1 + 72) & 1) == 0)
    {
      uint64_t v11 = *(void (**)(__int128 *__return_ptr, uint64_t (*)(), uint64_t))(v1 + 32);
      swift_retain(v1);
      v11(&v14, sub_1000063B4, v1);
      swift_release(v1);
      sub_1000063B8((uint64_t)&v14, (uint64_t)v12);
      swift_beginAccess(v1 + 80, v13, 33LL, 0LL);
      sub_100006214((uint64_t)v12, v1 + 80);
      Swift::Int result = swift_endAccess(v13);
      *(_BYTE *)(v1 + 72) = 1;
    }

    else
    {
      Swift::Int result = sub_100003F9C(v9, *(void *)(v1 + 64));
      if ((result & 1) == 0 && *(_BYTE *)(v1 + 72) == 1)
      {
        swift_beginAccess(v1 + 80, v13, 0LL, 0LL);
        sub_10000618C(v1 + 80, (uint64_t)&v14);
        if (*((void *)&v15 + 1))
        {
          sub_10000625C((uint64_t)&v14, (uint64_t)v12);
          sub_1000061D4((uint64_t)&v14);
          uint64_t v10 = sub_1000062A0(v12, v12[3]);
          swift_getObjectType(*v10);
          OS_dispatch_source.cancel()();
          sub_1000062C4(v12);
        }

        else
        {
          sub_1000061D4((uint64_t)&v14);
        }

        uint64_t v16 = 0LL;
        uint64_t v14 = 0u;
        char v15 = 0u;
        swift_beginAccess(v1 + 80, v12, 33LL, 0LL);
        sub_100006214((uint64_t)&v14, v1 + 80);
        Swift::Int result = swift_endAccess(v12);
        *(_BYTE *)(v1 + 72) = 0;
      }
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

Swift::Int sub_100003F9C(Swift::Int result, uint64_t a2)
{
  if (result == a2) {
    return 1LL;
  }
  Swift::Int v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0LL;
  }
  int64_t v4 = 0LL;
  Swift::Int v5 = result + 56;
  uint64_t v6 = 1LL << *(_BYTE *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  else {
    uint64_t v7 = -1LL;
  }
  unint64_t v8 = v7 & *(void *)(result + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }

    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1LL))
    {
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }

    if (v13 >= v9) {
      return 1LL;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 1;
    if (v13 + 1 >= v9) {
      return 1LL;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 2;
    if (v13 + 2 >= v9) {
      return 1LL;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 3;
    if (v13 + 3 >= v9) {
      return 1LL;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v15 = v13 + 4;
    if (v15 >= v9) {
      return 1LL;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v4 = v15 + 1;
        if (__OFADD__(v15, 1LL)) {
          goto LABEL_35;
        }
        if (v4 >= v9) {
          return 1LL;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        ++v15;
        if (v14) {
          goto LABEL_24;
        }
      }
    }

    int64_t v4 = v15;
LABEL_24:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    Swift::UInt v16 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v12);
    Hasher.init(_seed:)(v21, *(void *)(a2 + 40));
    Hasher._combine(_:)(v16);
    Swift::Int result = Hasher._finalize()();
    uint64_t v17 = -1LL << *(_BYTE *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) == 0) {
      return 0LL;
    }
    uint64_t v19 = *(void *)(a2 + 48);
  }

  while (*(unsigned __int8 *)(v19 + v18) == (_DWORD)v16);
  uint64_t v20 = ~v17;
  while (1)
  {
    unint64_t v18 = (v18 + 1) & v20;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) == 0) {
      return 0LL;
    }
  }
}

uint64_t sub_100004190()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  swift_release(*(void *)(v0 + 40));
  sub_100006350(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  sub_1000061D4(v0 + 80);
  return swift_deallocClassInstance(v0, 120LL, 7LL);
}

uint64_t type metadata accessor for ButtonPressStateMachine()
{
  return objc_opt_self(&OBJC_CLASS____TtC16AutomationModeUI23ButtonPressStateMachine);
}

void *sub_1000041FC()
{
  uint64_t v1 = v0;
  v0[5] = 0LL;
  swift_unknownObjectWeakInit(v0 + 4, 0LL);
  v0[6] = 0LL;
  v0[2] = IOHIDEventSystemClientCreate(kCFAllocatorDefault);
  uint64_t v2 = sub_100005F1C((uint64_t)&off_1000108F8);
  uint64_t v3 = swift_allocObject(&unk_100010B00, 24LL, 7LL);
  *(void *)(v3 + 16) = 0x4000000000000000LL;
  uint64_t v4 = type metadata accessor for ButtonPressStateMachine();
  uint64_t v5 = swift_allocObject(v4, 120LL, 7LL);
  sub_100002F3C(v2, (uint64_t)sub_100005F9C, v3);
  v1[3] = v5;
  return v1;
}

void sub_1000042AC()
{
  uint64_t v1 = v0;
  if (qword_100014D30 != -1) {
    swift_once(&qword_100014D30, sub_100002CF0);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000613C(v2, (uint64_t)qword_100014D38);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting to monitor HID events", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = swift_allocObject(&unk_100010BA0, 24LL, 7LL);
  swift_weakInit(v8 + 16, v1);
  uint64_t v9 = *(void *)(v7 + 48);
  uint64_t v10 = *(void *)(v7 + 56);
  *(void *)(v7 + 48) = sub_100006348;
  *(void *)(v7 + 56) = v8;
  sub_100006350(v9, v10);
  uint64_t v11 = *(void *)(v1 + 16);
  unint64_t v12 = CFRunLoopGetCurrent();
  if (v12)
  {
    if (kCFRunLoopDefaultMode)
    {
      int64_t v13 = v12;
      IOHIDEventSystemClientScheduleWithRunLoop(v11, v12);

      v15[4] = sub_1000044D4;
      v15[5] = 0LL;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 1107296256LL;
      v15[2] = sub_100004940;
      v15[3] = &unk_100010BB8;
      unint64_t v14 = _Block_copy(v15);
      swift_retain(v1);
      IOHIDEventSystemClientRegisterEventBlock(v11, v14, v1, 0LL);
      _Block_release(v14);
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_100004468(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(result + 32);
    uint64_t result = swift_release(v3);
    if (Strong)
    {
      sub_10000C8E8();
      return swift_unknownObjectRelease(Strong);
    }
  }

  return result;
}

void sub_1000044D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (IOHIDEventGetSenderID(a4) != 0x8000000817319375LL && a1)
  {
    uint64_t v6 = *(void *)(a1 + 24);
    swift_retain(v6);
    swift_retain(a1);
    sub_1000036C8(a4);
    swift_release(v6);
    if (IOHIDEventGetType(a4) == 11)
    {
      uint64_t v7 = *(void **)(a1 + 48);
      if (v7)
      {
        [v7 invalidate];
      }

      else
      {
        if (qword_100014D30 != -1) {
          swift_once(&qword_100014D30, sub_100002CF0);
        }
        uint64_t v8 = type metadata accessor for Logger(0LL);
        uint64_t v9 = sub_10000613C(v8, (uint64_t)qword_100014D38);
        uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
        os_log_type_t v11 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v10, v11))
        {
          unint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)unint64_t v12 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Notifying delegate that user interaction (non-synthetic events) began.",  v12,  2u);
          swift_slowDealloc(v12, -1LL, -1LL);
        }

        uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1 + 32);
        if (Strong)
        {
          uint64_t v14 = Strong;
          sub_10000C4CC();
          swift_unknownObjectRelease(v14);
        }
      }

      int64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___NSTimer);
      uint64_t v16 = swift_allocObject(&unk_100010BA0, 24LL, 7LL);
      swift_weakInit(v16 + 16, a1);
      uint64_t v17 = swift_allocObject(&unk_100010BF0, 32LL, 7LL);
      *(void *)(v17 + 16) = v16;
      *(void *)(v17 + 24) = 0x4008000000000000LL;
      v21[4] = sub_100006384;
      uint64_t v22 = v17;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 1107296256LL;
      v21[2] = sub_100007404;
      v21[3] = &unk_100010C08;
      unint64_t v18 = _Block_copy(v21);
      swift_release(v22);
      id v19 = [v15 scheduledTimerWithTimeInterval:0 repeats:v18 block:3.0];
      _Block_release(v18);
      uint64_t v20 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v19;
      swift_release(a1);
    }

    else
    {
      swift_release(a1);
    }
  }

void sub_100004734(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess(a3 + 16, v20, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v4);
  if (Strong)
  {
    uint64_t v6 = Strong;
    if (qword_100014D30 != -1) {
      swift_once(&qword_100014D30, sub_100002CF0);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    uint64_t v8 = sub_10000613C(v7, (uint64_t)qword_100014D38);
    uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)os_log_type_t v11 = 134217984;
      double v19 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, v20, v11 + 4, v11 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Timer fired, notifying delegate that there's been no user interaction for %f seconds.",  v11,  0xCu);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    uint64_t v12 = swift_unknownObjectWeakLoadStrong(v6 + 32);
    if (v12)
    {
      uint64_t v13 = v12;
      sub_10000C5DC();
      swift_unknownObjectRelease(v13);
    }

    uint64_t v14 = *(os_log_s **)(v6 + 48);
    *(void *)(v6 + 48) = 0LL;
    swift_release(v6);
  }

  else
  {
    if (qword_100014D30 != -1) {
      swift_once(&qword_100014D30, sub_100002CF0);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_10000613C(v15, (uint64_t)qword_100014D38);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v17,  "Timer fired, but manager is deallocated so doing nothing.",  v18,  2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }
  }
}

void sub_100004940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  os_log_type_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  swift_retain(v9);
  id v11 = a5;
  v10(a2, a3, a4, v11);
  swift_release(v9);
}

uint64_t sub_1000049B8()
{
  uint64_t v1 = v0;
  if (qword_100014D30 != -1) {
    swift_once(&qword_100014D30, sub_100002CF0);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000613C(v2, (uint64_t)qword_100014D38);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Turning off HID event monitor", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  IOHIDEventSystemClientUnregisterEventBlock(*(void *)(v1 + 16), 0LL, 0LL, 0LL);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = *(dispatch_queue_s **)(v7 + 16);
  uint64_t v9 = swift_allocObject(&unk_100010B50, 32LL, 7LL);
  *(void *)(v9 + 16) = sub_100006154;
  *(void *)(v9 + 24) = v7;
  v13[4] = sub_10000616C;
  uint64_t v14 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256LL;
  v13[2] = sub_100003648;
  v13[3] = &unk_100010B68;
  os_log_type_t v10 = _Block_copy(v13);
  uint64_t v11 = v14;
  swift_retain(v7);
  swift_retain(v9);
  swift_release(v11);
  dispatch_sync(v8, v10);
  _Block_release(v10);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation(v9, "", 97LL, 151LL, 25LL, 1LL);
  swift_release(v7);
  uint64_t result = swift_release(v9);
  return result;
}

uint64_t sub_100004B88()
{
  swift_release(*(void *)(v0 + 24));
  sub_100006390(v0 + 32);

  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for EventManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC16AutomationModeUI12EventManager);
}

__n128 sub_100004BE4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for IOHIDEventSystemClient(uint64_t a1)
{
}

_BYTE *initializeBufferWithCopyOfBuffer for Button(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ButtonPressStateMachine.State(unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonPressStateMachine.State( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100004D04 + 4 * byte_10000D595[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100004D38 + 4 * byte_10000D590[v4]))();
}

uint64_t sub_100004D38(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004D40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100004D48LL);
  }
  return result;
}

uint64_t sub_100004D54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100004D5CLL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_100004D60(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004D68(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004D74(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100004D80(_BYTE *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ButtonPressStateMachine.State()
{
  return &type metadata for ButtonPressStateMachine.State;
}

uint64_t getEnumTagSinglePayload for Button(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for Button(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_100004E78 + 4 * byte_10000D59F[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100004EAC + 4 * byte_10000D59A[v4]))();
}

uint64_t sub_100004EAC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004EB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100004EBCLL);
  }
  return result;
}

uint64_t sub_100004EC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100004ED0LL);
  }
  *(_BYTE *)__n128 result = a2 + 5;
  return result;
}

uint64_t sub_100004ED4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004EDC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100004EE8(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Button()
{
  return &type metadata for Button;
}

unint64_t sub_100004F04()
{
  unint64_t result = qword_100014FD0;
  if (!qword_100014FD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D704, &type metadata for Button);
    atomic_store(result, (unint64_t *)&qword_100014FD0);
  }

  return result;
}

unint64_t sub_100004F4C()
{
  unint64_t result = qword_100014FD8;
  if (!qword_100014FD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D76C, &type metadata for ButtonPressStateMachine.State);
    atomic_store(result, (unint64_t *)&qword_100014FD8);
  }

  return result;
}

uint64_t sub_100004F90(uint64_t a1, uint64_t a2)
{
  return sub_1000050D8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004F9C(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100005010(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10000508C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_1000050CC(uint64_t a1, uint64_t a2)
{
  return sub_1000050D8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000050D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100005114(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100005154(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000051C4(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10000524C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100005290@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000052B8(uint64_t a1)
{
  uint64_t v2 = sub_100006078( (unint64_t *)&qword_1000150C8,  (uint64_t (*)(uint64_t))type metadata accessor for Key,  (uint64_t)&unk_10000D938);
  uint64_t v3 = sub_100006078( &qword_1000150D0,  (uint64_t (*)(uint64_t))type metadata accessor for Key,  (uint64_t)&unk_10000D88C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000533C(_BYTE *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)(v14, *(void *)(*v2 + 40LL));
  Hasher._combine(_:)(a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1LL << *(_BYTE *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v14[0] = *v2;
    *uint64_t v2 = 0x8000000000000000LL;
    sub_100005700(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t v13 = *v2;
    *uint64_t v2 = v14[0];
    swift_bridgeObjectRelease(v13);
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v9 = *(void *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }

    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }

  uint64_t result = 0LL;
  LOBYTE(a2) = *(_BYTE *)(*(void *)(*v2 + 48LL) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

Swift::Int sub_100005458(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005FA4(&qword_100015028);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  Swift::Int v6 = result;
  if (*(void *)(v3 + 16))
  {
    uint64_t v29 = v2;
    int64_t v7 = 0LL;
    unint64_t v8 = (void *)(v3 + 56);
    uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v3 + 56);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    Swift::Int v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v7 << 6);
      }

      else
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v17 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          int64_t v7 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v18 = v8[v7];
          if (!v18)
          {
            int64_t v7 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v18 = v8[v7];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_36:
                uint64_t v28 = 1LL << *(_BYTE *)(v3 + 32);
                if (v28 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v8 = -1LL << v28;
                }
                uint64_t v2 = v29;
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v7 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v7 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = v8[v7];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v7 = v19;
            }
          }
        }

LABEL_26:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
      }

      Swift::UInt v20 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v16);
      Hasher.init(_seed:)(v30, *(void *)(v6 + 40));
      Hasher._combine(_:)(v20);
      Swift::Int result = Hasher._finalize()();
      uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0LL;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v23);
        }

        while (v27 == -1);
        unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }

      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      *(_BYTE *)(*(void *)(v6 + 48) + v14) = v20;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_27:
    Swift::UInt v20 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v16);
    Hasher.init(_seed:)(v29, *(void *)(v6 + 40));
    Hasher._combine(_:)(v20);
    Swift::Int result = Hasher._finalize()();
    uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v23);
      }

      while (v27 == -1);
      unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    *(_BYTE *)(*(void *)(v6 + 48) + v14) = v20;
    ++*(void *)(v6 + 16);
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_36:
    Swift::Int result = swift_release(v3);
    uint64_t v2 = v28;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    int64_t v7 = v19;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v7 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v7);
    ++v19;
    if (v18) {
      goto LABEL_26;
    }
  }

uint64_t sub_100005700(uint64_t result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100005458(v8);
  }

  else
  {
    if (v7 > v6)
    {
      Swift::Int result = (uint64_t)sub_10000584C();
      goto LABEL_14;
    }

    sub_1000059DC(v8);
  }

  uint64_t v9 = *v3;
  Hasher.init(_seed:)(v17, *(void *)(*v3 + 40));
  Hasher._combine(_:)(v5);
  Swift::Int result = Hasher._finalize()();
  uint64_t v10 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 48);
    if (*(unsigned __int8 *)(v11 + a2) == (_DWORD)v5)
    {
LABEL_13:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Button);
      __break(1u);
    }

    else
    {
      uint64_t v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
      }
    }
  }

LABEL_14:
  uint64_t v13 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(_BYTE *)(*(void *)(v13 + 48) + a2) = v5;
  uint64_t v14 = *(void *)(v13 + 16);
  BOOL v15 = __OFADD__(v14, 1LL);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    *(void *)(v13 + 16) = v16;
  }
  return result;
}

void *sub_10000584C()
{
  __int16 v1 = v0;
  sub_100005FA4(&qword_100015028);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    *__int16 v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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

    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }

    uint64_t v6 = (v15 - 1) & v15;
    int64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v9 = v16;
LABEL_28:
    int64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    Swift::UInt v20 = *v18;
    int64_t v19 = v18[1];
    sub_10000A8EC(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&uint64_t v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_10000AE0C(v39, v33);
    uint64_t v34 = v30;
    v35 = v31;
    uint64_t v36 = v32;
    sub_10000AE0C(v33, v37);
    v30 = v34;
    v31 = v35;
    uint64_t v32 = v36;
    sub_10000AE0C(v37, v38);
    sub_10000AE0C(v38, &v34);
    Swift::Int result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v21 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      uint64_t v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      uint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    uint64_t v11 = v3[6] + 40 * v10;
    *(_OWORD *)uint64_t v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    Swift::Int result = (uint64_t)sub_10000AE0C(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  unint64_t v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10000B9A8(a1);
    return (uint64_t)v3;
  }

  unint64_t v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    int64_t v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

  Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_1000059DC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005FA4(&qword_100015028);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  Swift::Int v6 = result;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v28 = v2;
  int64_t v7 = 0LL;
  Swift::Int v8 = v3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  Swift::Int v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v7 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100005C54(unsigned __int8 a1)
{
  uint64_t v3 = *v1;
  Hasher.init(_seed:)(v14, *(void *)(*v1 + 40LL));
  Hasher._combine(_:)(a1);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
    return 6LL;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(unsigned __int8 *)(v7 + v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
        return 6LL;
      }
    }

    while (*(unsigned __int8 *)(v7 + v6) != a1);
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  uint64_t v10 = *v1;
  v14[0] = *v1;
  *__int16 v1 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000584C();
    uint64_t v10 = v14[0];
  }

  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 + 48) + v6);
  sub_100005D74(v6);
  uint64_t v12 = *v1;
  *__int16 v1 = v14[0];
  swift_bridgeObjectRelease(v12);
  return v11;
}

unint64_t sub_100005D74(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt v10 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v6);
        Hasher.init(_seed:)(v18, *(void *)(v3 + 40));
        Hasher._combine(_:)(v10);
        unint64_t v11 = Hasher._finalize()() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }

        else if (v11 >= v9)
        {
          goto LABEL_11;
        }

        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          Swift::Int v13 = (_BYTE *)(v12 + v2);
          unint64_t v14 = (_BYTE *)(v12 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _BYTE *v13 = *v14;
            int64_t v2 = v6;
          }
        }

LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    Swift::Int result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1LL);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100005F1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = sub_1000060F8();
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for Button, v3);
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v6 = *v5++;
      sub_10000533C(&v7, v6);
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_100005F8C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100005F9C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
}

uint64_t sub_100005FA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005FE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006028(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100006060(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006070(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100006078(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000060B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100005FE4(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1000060F8()
{
  unint64_t result = qword_100015020;
  if (!qword_100015020)
  {
    unint64_t result = swift_getWitnessTable("U8", &type metadata for Button);
    atomic_store(result, (unint64_t *)&qword_100015020);
  }

  return result;
}

uint64_t sub_10000613C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006154()
{
  return sub_100003914(v0);
}

uint64_t sub_10000615C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000616C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000618C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_100015030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000061D4(uint64_t a1)
{
  uint64_t v2 = sub_100005FA4(&qword_100015030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100006214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_100015030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000625C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1000062A0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_1000062C4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_1000062E4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006324()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100006348()
{
  return sub_100004468(v0);
}

uint64_t sub_100006350(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100006360()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100006384(uint64_t a1)
{
}

uint64_t sub_100006390(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000063B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_100015030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006400()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100006410()
{
  return swift_deallocObject(v0, 25LL, 7LL);
}

Swift::Int sub_100006434()
{
  return sub_1000035E4(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_100006440()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

Swift::Int sub_100006450()
{
  return sub_100003668(*(void *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_10000645C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void type metadata accessor for BSInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_100006494(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000064C4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000064D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000064F0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for DispatchSourceTimerWrapper()
{
  return &type metadata for DispatchSourceTimerWrapper;
}

uint64_t sub_100006540()
{
  return sub_100006078( &qword_1000150B0,  (uint64_t (*)(uint64_t))type metadata accessor for Key,  (uint64_t)&unk_10000D850);
}

uint64_t sub_10000656C()
{
  return sub_100006078( &qword_1000150B8,  (uint64_t (*)(uint64_t))type metadata accessor for Key,  (uint64_t)&unk_10000D824);
}

uint64_t sub_100006598()
{
  return sub_100006078( &qword_1000150C0,  (uint64_t (*)(uint64_t))type metadata accessor for Key,  (uint64_t)&unk_10000D8C0);
}

uint64_t sub_1000065C4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000065E4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_100006620(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

double sub_1000066AC(char *a1, CGFloat a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v126.origin.double x = a4;
  v126.origin.double y = a5;
  v126.size.CGFloat width = a6;
  v126.size.CGFloat height = a7;
  CGRect v127 = CGRectInset(v126, 100.0, 100.0);
  double x = v127.origin.x;
  double y = v127.origin.y;
  CGFloat width = v127.size.width;
  CGFloat height = v127.size.height;
  if (CGRectGetWidth(v127) < a2) {
    return x;
  }
  v128.origin.double x = x;
  v128.origin.double y = y;
  v128.size.CGFloat width = width;
  v128.size.CGFloat height = height;
  if (CGRectGetHeight(v128) < a3) {
    return x;
  }
  sub_100006FE4((uint64_t)a1, (uint64_t)&v124);
  double v121 = a2;
  if ((v125 & 1) != 0)
  {
    CGFloat v15 = x;
    CGFloat v16 = y;
    goto LABEL_7;
  }

  CGFloat v17 = height;
  CGFloat v18 = width;
  CGFloat v20 = v124.origin.x;
  CGFloat v19 = v124.origin.y;
  CGFloat v21 = v124.size.height;
  v129.origin.double x = x;
  v129.origin.double y = y;
  v129.size.CGFloat width = v18;
  v129.size.CGFloat height = v17;
  CGFloat rect2 = v124.size.width;
  if (CGRectEqualToRect(v129, v124))
  {
    CGFloat v16 = y;
    CGFloat width = v18;
    CGFloat height = v17;
    CGFloat v15 = x;
LABEL_7:
    v130.origin.double x = v15;
    v130.origin.double y = v16;
    v130.size.CGFloat width = width;
    v130.size.CGFloat height = height;
    double v22 = CGRectGetWidth(v130);
    v131.origin.double x = v15;
    v131.origin.double y = v16;
    v131.size.CGFloat width = width;
    v131.size.CGFloat height = height;
    double x = CGRectGetMinX(v131);
    if (v22 > v121)
    {
      v132.origin.double x = v15;
      v132.origin.double y = v16;
      v132.size.CGFloat width = width;
      v132.size.CGFloat height = height;
      double v26 = CGRectGetMaxX(v132) - v121;
      if (x > v26)
      {
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }

      sub_100007270(v23, x, v26);
      double x = v27;
    }

    v133.origin.double x = v15;
    v133.origin.double y = v16;
    v133.size.CGFloat width = width;
    v133.size.CGFloat height = height;
    double v28 = CGRectGetHeight(v133);
    v134.origin.double x = v15;
    v134.origin.double y = v16;
    v134.size.CGFloat width = width;
    v134.size.CGFloat height = height;
    double y = CGRectGetMinY(v134);
    if (v28 <= a3) {
      return x;
    }
    v135.origin.double x = v15;
    v135.origin.double y = v16;
    v135.size.CGFloat width = width;
    v135.size.CGFloat height = height;
    double v30 = CGRectGetMaxY(v135) - a3;
    if (y <= v30)
    {
      sub_100007270(v29, y, v30);
      return x;
    }

    goto LABEL_65;
  }

  v136.origin.double x = x;
  v136.origin.double y = y;
  v136.size.CGFloat width = v18;
  v136.size.CGFloat height = v17;
  v159.origin.double x = v20;
  v159.origin.double y = v19;
  v159.size.CGFloat width = rect2;
  v159.size.CGFloat height = v21;
  if (!CGRectContainsRect(v136, v159)) {
    return x;
  }
  double v108 = a3;
  double rect = v19;
  CGFloat v119 = v20;
  v137.origin.double x = v20;
  v137.origin.double y = v19;
  v137.size.CGFloat width = rect2;
  CGFloat v16 = v21;
  v137.size.CGFloat height = v21;
  double MinX = CGRectGetMinX(v137);
  v138.origin.double x = x;
  v138.origin.double y = y;
  v138.size.CGFloat width = v18;
  v138.size.CGFloat height = v17;
  CGFloat v32 = MinX - CGRectGetMinX(v138);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  double v106 = y;
  double v107 = x;
  v139.origin.double x = x;
  v139.origin.double y = y;
  v139.size.CGFloat width = v18;
  v139.size.CGFloat height = v17;
  CGRectDivide(v139, &slice, &remainder, v32, CGRectMinXEdge);
  double x = slice.origin.x;
  double y = slice.origin.y;
  CGFloat height = slice.size.width;
  CGFloat v33 = slice.size.height;
  CGFloat v34 = remainder.origin.x;
  CGFloat width = remainder.origin.y;
  a3 = remainder.size.width;
  CGFloat v115 = remainder.size.height;
  if (CGRectIsEmpty(slice))
  {
    a1 = (char *)&_swiftEmptyArrayStorage;
    double v35 = rect;
    goto LABEL_23;
  }

  CGFloat v112 = v34;
  v140.origin.double x = x;
  v140.origin.double y = y;
  v140.size.CGFloat width = height;
  v140.size.CGFloat height = v33;
  if (CGRectGetWidth(v140) >= v121)
  {
    v141.origin.double x = x;
    v141.origin.double y = y;
    v141.size.CGFloat width = height;
    CGFloat v111 = v33;
    v141.size.CGFloat height = v33;
    if (CGRectGetHeight(v141) >= v108)
    {
      a1 = sub_100007164(0LL, 1LL, 1, (char *)&_swiftEmptyArrayStorage);
      unint64_t v7 = *((void *)a1 + 2);
      unint64_t v25 = *((void *)a1 + 3);
      int64_t v24 = v7 + 1;
      if (v7 < v25 >> 1)
      {
LABEL_21:
        double v35 = rect;
        *((void *)a1 + 2) = v24;
        v37 = (double *)&a1[32 * v7];
        v37[4] = x;
        v37[5] = y;
        v37[6] = height;
        v37[7] = v111;
        goto LABEL_22;
      }

LABEL_66:
      int64_t v110 = v24;
      v102 = sub_100007164((char *)(v25 > 1), v24, 1, a1);
      int64_t v24 = v110;
      a1 = v102;
      goto LABEL_21;
    }
  }

  a1 = (char *)&_swiftEmptyArrayStorage;
  double v35 = rect;
LABEL_22:
  CGFloat v34 = v112;
LABEL_23:
  CGFloat v38 = v119;
  CGFloat v39 = rect2;
  double v40 = v16;
  CGFloat v41 = v16;
  double MinY = CGRectGetMinY(*(CGRect *)(&v35 - 1));
  v142.origin.double x = v34;
  v142.origin.double y = width;
  v142.size.CGFloat width = a3;
  v142.size.CGFloat height = v115;
  CGFloat v43 = MinY - CGRectGetMinY(v142);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v143.origin.double x = v34;
  v143.origin.double y = width;
  v143.size.CGFloat width = a3;
  v143.size.CGFloat height = v115;
  CGRectDivide(v143, &slice, &remainder, v43, CGRectMinYEdge);
  CGFloat v44 = slice.origin.x;
  CGFloat v45 = slice.origin.y;
  CGFloat v47 = slice.size.width;
  CGFloat v46 = slice.size.height;
  CGFloat v49 = remainder.origin.x;
  CGFloat v48 = remainder.origin.y;
  CGFloat v50 = remainder.size.height;
  CGFloat v116 = remainder.size.width;
  if (CGRectIsEmpty(slice))
  {
    CGFloat v51 = v40;
    CGFloat v52 = rect2;
  }

  else
  {
    v144.origin.double x = v44;
    v144.origin.double y = v45;
    v144.size.CGFloat width = v47;
    v144.size.CGFloat height = v46;
    CGFloat v53 = CGRectGetWidth(v144);
    CGFloat v54 = v46;
    if (v53 >= v121 && (CGFloat v55 = v44, v56 = v45, v113 = v47, v57 = v47, CGRectGetHeight(*(CGRect *)(&v54 - 3)) >= v108))
    {
      CGFloat v51 = v40;
      if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
        a1 = sub_100007164(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
      }
      CGFloat v52 = rect2;
      unint64_t v59 = *((void *)a1 + 2);
      unint64_t v58 = *((void *)a1 + 3);
      unint64_t v60 = v59 + 1;
      CGFloat v61 = v113;
      if (v59 >= v58 >> 1)
      {
        v103 = sub_100007164((char *)(v58 > 1), v59 + 1, 1, a1);
        CGFloat v61 = v113;
        unint64_t v60 = v59 + 1;
        a1 = v103;
      }

      *((void *)a1 + 2) = v60;
      v62 = (CGFloat *)&a1[32 * v59];
      v62[4] = v44;
      v62[5] = v45;
      v62[6] = v61;
      v62[7] = v46;
    }

    else
    {
      CGFloat v51 = v40;
      CGFloat v52 = rect2;
    }
  }

  v145.origin.double x = v49;
  v145.origin.double y = v48;
  v145.size.CGFloat width = v116;
  v145.size.CGFloat height = v50;
  CGFloat v63 = v48;
  double MaxX = CGRectGetMaxX(v145);
  v146.origin.double y = rect;
  v146.origin.double x = v119;
  v146.size.CGFloat width = v52;
  double v65 = v51;
  v146.size.CGFloat height = v51;
  CGFloat v66 = MaxX - CGRectGetMaxX(v146);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v147.origin.double x = v49;
  v147.origin.double y = v63;
  v147.size.CGFloat width = v116;
  v147.size.CGFloat height = v50;
  CGRectDivide(v147, &slice, &remainder, v66, CGRectMaxXEdge);
  CGFloat v67 = slice.origin.x;
  CGFloat v68 = slice.origin.y;
  CGFloat v70 = slice.size.width;
  CGFloat v69 = slice.size.height;
  CGFloat v71 = remainder.origin.y;
  CGFloat v117 = remainder.origin.x;
  CGFloat v73 = remainder.size.width;
  CGFloat v72 = remainder.size.height;
  if (CGRectIsEmpty(slice)) {
    goto LABEL_36;
  }
  v148.origin.double x = v67;
  v148.origin.double y = v68;
  v148.size.CGFloat width = v70;
  v148.size.CGFloat height = v69;
  if (CGRectGetWidth(v148) < v121
    || (v149.origin.double x = v67,
        v149.origin.double y = v68,
        CGFloat v114 = v70,
        v149.size.CGFloat width = v70,
        v149.size.CGFloat height = v69,
        CGRectGetHeight(v149) < v108))
  {
LABEL_36:
    CGFloat v74 = v65;
    CGFloat v75 = rect2;
  }

  else
  {
    CGFloat v74 = v65;
    if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
      a1 = sub_100007164(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
    }
    CGFloat v97 = v114;
    CGFloat v75 = rect2;
    unint64_t v99 = *((void *)a1 + 2);
    unint64_t v98 = *((void *)a1 + 3);
    unint64_t v100 = v99 + 1;
    if (v99 >= v98 >> 1)
    {
      v105 = sub_100007164((char *)(v98 > 1), v99 + 1, 1, a1);
      CGFloat v97 = v114;
      unint64_t v100 = v99 + 1;
      a1 = v105;
    }

    *((void *)a1 + 2) = v100;
    v101 = (CGFloat *)&a1[32 * v99];
    v101[4] = v67;
    v101[5] = v68;
    v101[6] = v97;
    v101[7] = v69;
  }

  v150.origin.double x = v117;
  v150.origin.double y = v71;
  v150.size.CGFloat width = v73;
  v150.size.CGFloat height = v72;
  CGFloat v76 = v72;
  double MaxY = CGRectGetMaxY(v150);
  v151.origin.double y = rect;
  v151.origin.double x = v119;
  v151.size.CGFloat width = v75;
  v151.size.CGFloat height = v74;
  CGFloat v78 = MaxY - CGRectGetMaxY(v151);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v152.origin.double x = v117;
  v152.origin.double y = v71;
  v152.size.CGFloat width = v73;
  v152.size.CGFloat height = v76;
  CGRectDivide(v152, &slice, &remainder, v78, CGRectMaxYEdge);
  CGFloat v79 = slice.origin.x;
  double y = slice.origin.y;
  CGFloat v80 = slice.size.width;
  CGFloat v81 = slice.size.height;
  if (!CGRectIsEmpty(slice))
  {
    v153.origin.double x = v79;
    v153.origin.double y = y;
    v153.size.CGFloat width = v80;
    v153.size.CGFloat height = v81;
    if (CGRectGetWidth(v153) >= v121)
    {
      v154.origin.double x = v79;
      v154.origin.double y = y;
      v154.size.CGFloat width = v80;
      v154.size.CGFloat height = v81;
      if (CGRectGetHeight(v154) >= v108)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
          a1 = sub_100007164(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
        }
        unint64_t v83 = *((void *)a1 + 2);
        unint64_t v82 = *((void *)a1 + 3);
        unint64_t v84 = v83 + 1;
        if (v83 >= v82 >> 1)
        {
          *(void *)&CGFloat rect2 = v83 + 1;
          v104 = sub_100007164((char *)(v82 > 1), v83 + 1, 1, a1);
          unint64_t v84 = v83 + 1;
          a1 = v104;
        }

        *((void *)a1 + 2) = v84;
        v85 = (CGFloat *)&a1[32 * v83];
        v85[4] = v79;
        v85[5] = y;
        v85[6] = v80;
        v85[7] = v81;
      }
    }
  }

  uint64_t v86 = *((void *)a1 + 2);
  if (v86)
  {
    uint64_t v87 = 0LL;
    unint64_t v7 = 1LL;
    double v88 = 0.0;
    CGFloat v111 = 0.0;
    CGFloat v112 = 0.0;
    CGFloat v115 = 0.0;
LABEL_47:
    CGFloat v109 = v88;
    v89 = (CGFloat *)&a1[32 * v87 + 56];
    do
    {
      CGFloat v90 = *(v89 - 3);
      CGFloat v16 = *(v89 - 2);
      CGFloat v91 = *(v89 - 1);
      CGFloat v92 = *v89;
      v155.origin.double x = v90;
      v155.origin.double y = v16;
      v155.size.CGFloat width = v91;
      v155.size.CGFloat height = *v89;
      double v93 = CGRectGetWidth(v155);
      v156.origin.double x = v90;
      v156.origin.double y = v16;
      v156.size.CGFloat width = v91;
      v156.size.CGFloat height = v92;
      double v94 = CGRectGetHeight(v156);
      double v95 = 0.0;
      if ((v7 & 1) == 0)
      {
        double y = v111;
        v157.origin.double x = v112;
        v157.origin.double y = v111;
        CGFloat v119 = v92;
        CGFloat rect2 = v91;
        v157.size.CGFloat width = v115;
        v157.size.CGFloat height = v109;
        double rect = CGRectGetWidth(v157);
        v158.origin.double x = v112;
        v158.origin.double y = v111;
        v158.size.CGFloat width = v115;
        v158.size.CGFloat height = v109;
        double v95 = rect * CGRectGetHeight(v158);
      }

      if (v95 < v93 * v94)
      {
        unint64_t v7 = 0LL;
        CGFloat v111 = v16;
        CGFloat v112 = v90;
        CGFloat v115 = v91;
        double v88 = v92;
        if (v86 - 1 != v87++) {
          goto LABEL_47;
        }
        swift_bridgeObjectRelease(a1);
        CGFloat v15 = v90;
        CGFloat width = v91;
        CGFloat height = v92;
        a3 = v108;
        goto LABEL_7;
      }

      ++v87;
      v89 += 4;
    }

    while (v86 != v87);
    swift_bridgeObjectRelease(a1);
    double x = v107;
    a3 = v108;
    double y = v106;
    CGFloat v15 = v112;
    CGFloat width = v115;
    CGFloat height = v109;
    CGFloat v16 = v111;
    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
  }

  else
  {
    swift_bridgeObjectRelease(a1);
    return v107;
  }

  return x;
}

uint64_t sub_100006FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_1000151A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000702C(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = swift_bridgeObjectRelease(0xE000000000000000LL);
  v9._countAndFlagsBits = Double.description.getter(v8, a1);
  object = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(object);
  v11._countAndFlagsBits = 4028716LL;
  v11._object = (void *)0xE300000000000000LL;
  String.append(_:)(v11);
  v13._countAndFlagsBits = Double.description.getter(v12, a2);
  unint64_t v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v14);
  v15._countAndFlagsBits = 0x203A657A6973202CLL;
  v15._object = (void *)0xEA00000000003D77LL;
  String.append(_:)(v15);
  v17._countAndFlagsBits = Double.description.getter(v16, a3);
  CGFloat v18 = v17._object;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v18);
  v19._countAndFlagsBits = 4024364LL;
  v19._object = (void *)0xE300000000000000LL;
  String.append(_:)(v19);
  v21._countAndFlagsBits = Double.description.getter(v20, a4);
  double v22 = v21._object;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v22);
  return 0x203A6E696769726FLL;
}

char *sub_100007164(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100005FA4(&qword_1000151A8);
      Swift::String v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 1;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 5);
      unint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      Swift::String v11 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32]) {
          memmove(v14, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100007318(0LL, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100007270(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }

  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000LL) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v6 = result;
  uint64_t v7 = 0LL;
  __n128 result = swift_stdlib_random(&v7, 8LL);
  return result;
}

char *sub_100007318(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      __n128 result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    double v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  __n128 result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_100007404(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_100007454()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000062E4(v0, qword_1000151B0);
  sub_10000613C(v0, (uint64_t)qword_1000151B0);
  if (qword_100014D58 != -1) {
    swift_once(&qword_100014D58, sub_10000B9B8);
  }
  return Logger.init(_:)((id)qword_100015AE0);
}

void sub_1000074D4()
{
  uint64_t v1 = (void *)v0;
  if (qword_100014D50 != -1) {
    swift_once(&qword_100014D50, sub_100007454);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_10000613C(v2, (uint64_t)qword_1000151B0);
  uint64_t v3 = swift_retain_n(v0, 2LL);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc(18LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v95 = v7;
    *(_DWORD *)uint64_t v6 = 67109378;
    LODWORD(v96.m11) = [*(id *)(v0 + 16) displayId];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, (char *)&v96.m11 + 4, v6 + 4, v6 + 8);
    *(_WORD *)(v6 + 8) = 2080;
    uint64_t v8 = *(void *)(v0 + 48);
    if (v8) {
      id v9 = [*(id *)(v0 + 48) activeInterfaceOrientation];
    }
    else {
      id v9 = 0LL;
    }
    *(void *)&v96.m11 = v9;
    LOBYTE(v96.m12) = v8 == 0;
    uint64_t v10 = sub_100005FA4(&qword_1000153D0);
    uint64_t v11 = String.init<A>(describing:)(&v96, v10);
    unint64_t v13 = v12;
    *(void *)&v96.m11 = sub_10000A664(v11, v12, &v95);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v96.m12, v6 + 10, v6 + 18);
    swift_release_n(v0, 2LL);
    swift_bridgeObjectRelease(v13);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "Presenting overlay for display %u in orientation %s",  (uint8_t *)v6,  0x12u);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v0, 2LL);
  }

  uint64_t v14 = sub_100005FA4(&qword_1000153B8);
  uint64_t inited = swift_initStackObject(v14, v97);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_10000D9E0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCAContextDisplayable);
  *(void *)(inited + 40) = v16;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(_BYTE *)(inited + 48) = 1;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCAContextIgnoresHitTest);
  *(void *)(inited + 88) = v17;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(_BYTE *)(inited + 96) = 1;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCAContextAllowsOcclusionDetectionOverride);
  *(void *)(inited + 136) = v18;
  *(void *)(inited + 168) = &type metadata for Bool;
  *(_BYTE *)(inited + 144) = 1;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCAContextSecure);
  *(void *)(inited + 184) = v19;
  *(void *)(inited + 2swift_weakDestroy(v0 + 16) = &type metadata for Bool;
  *(_BYTE *)(inited + 192) = 1;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCAContextDisplayId);
  *(void *)(inited + 232) = v20;
  Swift::String v21 = *(void **)(v0 + 16);
  unsigned int v22 = [v21 displayId];
  *(void *)(inited + 264) = &type metadata for UInt32;
  *(_DWORD *)(inited + 240) = v22;
  unint64_t v23 = sub_100007F7C(inited);
  int64_t v24 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
  [v24 begin];
  unint64_t v25 = (void *)objc_opt_self(&OBJC_CLASS___CAContext);
  uint64_t v26 = sub_1000081DC(v23);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v28 = objc_msgSend(v25, "remoteContextWithOptions:", isa, swift_bridgeObjectRelease(v26).n128_f64[0]);

  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = swift_bridgeObjectRetain(v23);
    v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.default.getter();
    id v93 = v21;
    id v94 = v24;
    CGFloat v91 = v29;
    id v92 = v28;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc(22LL, -1LL);
      CGFloat v90 = COERCE_DOUBLE(swift_slowAlloc(64LL, -1LL));
      v96.m11 = v90;
      *(_DWORD *)uint64_t v33 = 136446466;
      id v34 = v29;
      id v35 = [v34 description];
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      unint64_t v38 = v37;

      uint64_t v95 = sub_10000A664(v36, v38, (uint64_t *)&v96);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v33 + 4, v33 + 12);

      swift_bridgeObjectRelease(v38);
      *(_WORD *)(v33 + 12) = 2082;
      uint64_t v39 = swift_bridgeObjectRetain(v23);
      uint64_t v40 = Dictionary.description.getter( v39,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      unint64_t v42 = v41;
      swift_bridgeObjectRelease(v23);
      uint64_t v43 = v40;
      Swift::String v21 = v93;
      uint64_t v95 = sub_10000A664(v43, v42, (uint64_t *)&v96);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v33 + 14, v33 + 22);
      swift_bridgeObjectRelease_n(v23, 2LL);
      swift_bridgeObjectRelease(v42);
      _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "Got remote context %{public}s with options %{public}s",  (uint8_t *)v33,  0x16u);
      swift_arrayDestroy(*(void *)&v90, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(*(void *)&v90, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v23, 2LL);
    }

    id v48 = [objc_allocWithZone(CALayer) init];
    [v48 setDisableUpdateMask:32];
    id v49 = [v21 currentMode];
    id v50 = [v49 preferredScale];

    double v51 = (double)(uint64_t)v50;
    [v21 bounds];
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;
    objc_msgSend(v48, "setBounds:", 0.0, 0.0, v56 / v51, v58 / v51);
    v98.origin.double x = v53;
    v98.origin.double y = v55;
    v98.size.CGFloat width = v57;
    v98.size.CGFloat height = v59;
    double MidX = CGRectGetMidX(v98);
    v99.origin.double x = v53;
    v99.origin.double y = v55;
    v99.size.CGFloat width = v57;
    v99.size.CGFloat height = v59;
    objc_msgSend(v48, "setPosition:", MidX, CGRectGetMidY(v99));
    CATransform3DMakeScale(&v96, (double)(uint64_t)v50, (double)(uint64_t)v50, 1.0);
    [v48 setTransform:&v96];
    [v48 setContentsScale:(double)(uint64_t)v50];
    id v61 = [v48 bounds];
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    CGFloat v70 = (os_log_s *)Logger.logObject.getter(v61);
    os_log_type_t v71 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v70, v71))
    {
      CGFloat v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      CGFloat v73 = COERCE_DOUBLE(swift_slowAlloc(32LL, -1LL));
      v96.m11 = v73;
      *(_DWORD *)CGFloat v72 = 136315138;
      uint64_t v74 = sub_10000702C(v63, v65, v67, v69);
      unint64_t v76 = v75;
      uint64_t v95 = sub_10000A664(v74, v75, (uint64_t *)&v96);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v72 + 4, v72 + 12);
      swift_bridgeObjectRelease(v76);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Display %s", v72, 0xCu);
      swift_arrayDestroy(*(void *)&v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(*(void *)&v73, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);
    }

    id v77 = [objc_allocWithZone(CALayer) init];
    [v77 setContentsScale:v51];
    CGFloat v78 = (void *)v1[4];
    v1[4] = v77;
    id v79 = v77;

    id v80 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
    NSString v81 = String._bridgeToObjectiveC()();
    unsigned __int8 v82 = [v80 BOOLForKey:v81];

    if ((v82 & 1) == 0) {
      [v79 setDisableUpdateMask:18];
    }
    [v48 bounds];
    objc_msgSend(v79, "setFrame:");
    [v48 addSublayer:v79];
    unint64_t v83 = (void *)v1[6];
    if (v83) {
      uint64_t v84 = (uint64_t)[v83 activeInterfaceOrientation];
    }
    else {
      uint64_t v84 = 1LL;
    }
    sub_1000085A0(v84);
    [v91 setLayer:v48];
    [v94 commit];
    [v94 flush];
    v85 = (void *)v1[3];
    v1[3] = v92;
    id v86 = v91;

    uint64_t v87 = swift_retain(v1);
    CGFloat v45 = (os_log_s *)Logger.logObject.getter(v87);
    os_log_type_t v88 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v45, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)v89 = 67109120;
      LODWORD(v96.m11) = [v93 displayId];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, (char *)&v96.m11 + 4, v89 + 4, v89 + 8);
      swift_release(v1);
      _os_log_impl((void *)&_mh_execute_header, v45, v88, "Finished presenting overlay for display %u", v89, 8u);
      swift_slowDealloc(v89, -1LL, -1LL);
    }

    else
    {

      swift_release(v1);
      CGFloat v45 = (os_log_s *)v86;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v23);
    CGFloat v45 = (os_log_s *)Logger.logObject.getter(v44);
    os_log_type_t v46 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v45, v46))
    {
      CGFloat v47 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)CGFloat v47 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "Failed to create remote CAContext, Automation Mode may be enabled but not indicated by UI.",  v47,  2u);
      swift_slowDealloc(v47, -1LL, -1LL);
    }
  }
}

unint64_t sub_100007F7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005FA4(&qword_1000153C0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000B964(v7, (uint64_t)&v16, &qword_1000153C8);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10000AD28(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    unint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000AE0C(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000080B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005FA4(&qword_1000153A0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000B964(v7, (uint64_t)&v14, &qword_1000153A8);
    uint64_t v8 = v14;
    unint64_t result = sub_10000AD8C(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_10000AE0C(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000081DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005FA4(&qword_1000153D8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_39:
  __break(1u);
  return result;
}

void sub_1000085A0(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  if (v2)
  {
    CGFloat v3 = 0.0;
    id v4 = v2;
    CATransform3DMakeRotation(&v25, v3, 0.0, 0.0, -1.0);
    CGFloat m11 = v25.m11;
    CGFloat m12 = v25.m12;
    CGFloat m13 = v25.m13;
    CGFloat m14 = v25.m14;
    CGFloat m21 = v25.m21;
    CGFloat m22 = v25.m22;
    CGFloat m23 = v25.m23;
    CGFloat m24 = v25.m24;
    CGFloat m31 = v25.m31;
    CGFloat m32 = v25.m32;
    CGFloat m33 = v25.m33;
    CGFloat m34 = v25.m34;
    CGFloat m41 = v25.m41;
    CGFloat m42 = v25.m42;
    CGFloat m43 = v25.m43;
    CGFloat m44 = v25.m44;
    unint64_t v13 = *(void **)(v1 + 40);
    if (v13)
    {
      id v14 = v13;
      v25.CGFloat m11 = m11;
      v25.CGFloat m12 = m12;
      v25.CGFloat m13 = m13;
      v25.CGFloat m14 = m14;
      v25.CGFloat m21 = m21;
      v25.CGFloat m22 = m22;
      v25.CGFloat m23 = m23;
      v25.CGFloat m24 = m24;
      v25.CGFloat m31 = m31;
      v25.CGFloat m32 = m32;
      v25.CGFloat m33 = m33;
      v25.CGFloat m34 = m34;
      v25.CGFloat m41 = m41;
      v25.CGFloat m42 = m42;
      v25.CGFloat m43 = m43;
      v25.CGFloat m44 = m44;
      [v14 setSublayerTransform:&v25];
      [v14 setNeedsLayout];
    }

    else
    {
      id v15 = [objc_allocWithZone((Class)type metadata accessor for OverlayLayer()) init];
      [v4 contentsScale];
      objc_msgSend(v15, "setContentsScale:");
      v25.CGFloat m11 = m11;
      v25.CGFloat m12 = m12;
      v25.CGFloat m13 = m13;
      v25.CGFloat m14 = m14;
      v25.CGFloat m21 = m21;
      v25.CGFloat m22 = m22;
      v25.CGFloat m23 = m23;
      v25.CGFloat m24 = m24;
      v25.CGFloat m31 = m31;
      v25.CGFloat m32 = m32;
      v25.CGFloat m33 = m33;
      v25.CGFloat m34 = m34;
      v25.CGFloat m41 = m41;
      v25.CGFloat m42 = m42;
      v25.CGFloat m43 = m43;
      v25.CGFloat m44 = m44;
      [v15 setSublayerTransform:&v25];
      id v16 = v15;
      [v4 bounds];
      objc_msgSend(v16, "setFrame:");

      [v16 setNeedsLayout];
      [v4 addSublayer:v16];

      id v4 = *(id *)(v1 + 40);
      *(void *)(v1 + 40) = v16;
    }
  }

id sub_1000087D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Logger.init()(v4);
  uint64_t v7 = swift_retain(v1);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v10 = 67109120;
    unsigned int v14 = [*(id *)(v1 + 16) displayId];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v10 + 4, v10 + 8);
    swift_release(v1);
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Invalidating Automation Mode UI overlay for display %u.",  v10,  8u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {

    swift_release(v1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v11 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0LL;

  return [*(id *)(v1 + 48) invalidate];
}

uint64_t sub_10000894C()
{
  return swift_deallocClassInstance(v0, 57LL, 7LL);
}

uint64_t type metadata accessor for Overlay()
{
  return objc_opt_self(&OBJC_CLASS____TtC16AutomationModeUI7Overlay);
}

char *sub_1000089B0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)uint64_t v1 = 0LL;
  *((void *)v1 + 1) = 0LL;
  v1[16] = 1;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0LL;
  v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v2 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  uint64_t v4 = v0;
  id v5 = [v3 blackColor];
  id v6 = [v5 colorWithAlphaComponent:0.4];

  *(void *)&v0[v2] = v6;
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000LL;
  id v7 = [objc_allocWithZone(CATextLayer) init];
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v7;
  [v7 setWrapped:1];
  [v7 setAlignmentMode:kCAAlignmentCenter];
  id v8 = [objc_allocWithZone(CATextLayer) init];
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel] = v8;
  [v8 setWrapped:1];
  id v9 = v8;
  [v9 setAlignmentMode:kCAAlignmentCenter];

  v22.receiver = v4;
  v22.super_class = (Class)type metadata accessor for OverlayLayer();
  unint64_t v10 = (char *)objc_msgSendSuper2(&v22, "init");
  uint64_t v11 = *(void *)&v10[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  unint64_t v12 = v10;
  [v12 addSublayer:v11];
  [v12 addSublayer:*(void *)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel]];
  uint64_t v13 = (void *)objc_opt_self(&OBJC_CLASS___NSTimer);
  double v14 = sub_10000B6F0();
  uint64_t v15 = swift_allocObject(&unk_100011028, 24LL, 7LL);
  swift_unknownObjectWeakInit(v15 + 16, v12);
  v20[4] = sub_10000B95C;
  uint64_t v21 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256LL;
  v20[2] = sub_100007404;
  v20[3] = &unk_100011040;
  id v16 = _Block_copy(v20);
  swift_release(v21);
  id v17 = [v13 scheduledTimerWithTimeInterval:1 repeats:v16 block:v14];

  _Block_release(v16);
  __int128 v18 = *(void **)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer];
  *(void *)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = v17;

  return v12;
}

void sub_100008C54(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    id v5 = (void *)Strong;
    sub_1000096A8();
  }

  else
  {
    [a1 invalidate];
  }

id sub_100008D00(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)uint64_t v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  v3[16] = 1;
  *(void *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0LL;
  v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v4 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  id v5 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v6 = v1;
  id v7 = [v5 blackColor];
  id v8 = [v7 colorWithAlphaComponent:0.4];

  *(void *)&v1[v4] = v8;
  *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000LL;
  sub_10000A8EC((uint64_t)a1, (uint64_t)v23);
  id v9 = (objc_class *)type metadata accessor for OverlayLayer();
  if ((swift_dynamicCast(&v22, v23, (char *)&type metadata for Any + 8, v9, 6LL) & 1) != 0)
  {
    unint64_t v10 = v22;
    uint64_t v11 = *(void **)&v22[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
    *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v11;
    unint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
    id v13 = v11;
    id v14 = v12;
  }

  else
  {
    id v15 = [objc_allocWithZone(CATextLayer) init];
    *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v15;
    id v14 = [objc_allocWithZone(CATextLayer) init];
  }

  *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel] = v14;

  uint64_t v16 = a1[3];
  id v17 = sub_1000062A0(a1, v16);
  uint64_t v18 = _bridgeAnythingToObjectiveC<A>(_:)(v17, v16);
  v21.receiver = v6;
  v21.super_class = v9;
  id v19 = objc_msgSendSuper2(&v21, "initWithLayer:", v18);
  swift_unknownObjectRelease(v18);
  sub_1000062C4(a1);
  return v19;
}

id sub_100008F20()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer];
  if (v1) {
    [v1 invalidate];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for OverlayLayer();
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_10000902C()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___UIFontDescriptor);
  id v2 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
  id v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  if (!v3) {
    id v3 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
  }
  id v4 = [(id)objc_opt_self(UIFont) fontWithDescriptor:v3 size:0.0];
  uint64_t v5 = sub_100005FA4(&qword_100015388);
  uint64_t inited = swift_initStackObject(v5, v31);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_10000D9F0;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v7 = sub_100006028(0LL, &qword_100015390, &OBJC_CLASS___UIFont_ptr);
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 64) = v7;
  *(void *)(inited + 72) = NSForegroundColorAttributeName;
  id v8 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v9 = NSFontAttributeName;
  id v10 = v4;
  uint64_t v11 = NSForegroundColorAttributeName;
  id v12 = [v8 whiteColor];
  id v13 = v12;
  double v14 = 0.85;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive)) {
    double v14 = 0.4;
  }
  id v15 = [v12 colorWithAlphaComponent:v14];

  uint64_t v16 = sub_100006028(0LL, &qword_100015398, &OBJC_CLASS___UIColor_ptr);
  *(void *)(inited + 80) = v15;
  *(void *)(inited + 104) = v16;
  *(void *)(inited + 112) = NSStrokeColorAttributeName;
  id v17 = *(void **)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor);
  *(void *)(inited + 120) = v17;
  *(void *)(inited + 144) = v16;
  *(void *)(inited + 152) = NSStrokeWidthAttributeName;
  *(void *)(inited + 184) = &type metadata for Double;
  *(void *)(inited + 160) = 0xBFF0000000000000LL;
  uint64_t v18 = NSStrokeColorAttributeName;
  id v19 = v17;
  uint64_t v20 = NSStrokeWidthAttributeName;
  unint64_t v21 = sub_1000080B0(inited);
  objc_super v22 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v32._object = (void *)0x800000010000EBE0LL;
  v23._object = (void *)0x800000010000EBC0LL;
  v23._countAndFlagsBits = 0xD00000000000001DLL;
  v24._countAndFlagsBits = 0LL;
  v24._object = (void *)0xE000000000000000LL;
  v32._countAndFlagsBits = 0xD00000000000001DLL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, v22, v24, v32)._object;

  id v26 = objc_allocWithZone(&OBJC_CLASS___NSAttributedString);
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  type metadata accessor for Key(0LL);
  sub_10000ACE0();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  id v29 = [v26 initWithString:v27 attributes:isa];

  return v29;
}

id sub_100009374()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___UIFontDescriptor);
  id v2 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2];
  id v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  if (!v3) {
    id v3 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2];
  }
  id v4 = [(id)objc_opt_self(UIFont) fontWithDescriptor:v3 size:0.0];
  uint64_t v5 = sub_100005FA4(&qword_100015388);
  uint64_t inited = swift_initStackObject(v5, v31);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_10000D9F0;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v7 = sub_100006028(0LL, &qword_100015390, &OBJC_CLASS___UIFont_ptr);
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 64) = v7;
  *(void *)(inited + 72) = NSForegroundColorAttributeName;
  id v8 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v9 = NSFontAttributeName;
  id v10 = v4;
  uint64_t v11 = NSForegroundColorAttributeName;
  id v12 = [v8 whiteColor];
  id v13 = v12;
  double v14 = 0.4;
  if (!*(_BYTE *)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive)) {
    double v14 = 0.5;
  }
  id v15 = [v12 colorWithAlphaComponent:v14];

  uint64_t v16 = sub_100006028(0LL, &qword_100015398, &OBJC_CLASS___UIColor_ptr);
  *(void *)(inited + 80) = v15;
  *(void *)(inited + 104) = v16;
  *(void *)(inited + 112) = NSStrokeColorAttributeName;
  id v17 = *(void **)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor);
  *(void *)(inited + 120) = v17;
  *(void *)(inited + 144) = v16;
  *(void *)(inited + 152) = NSStrokeWidthAttributeName;
  *(void *)(inited + 184) = &type metadata for Double;
  *(void *)(inited + 160) = 0xBFF0000000000000LL;
  uint64_t v18 = NSStrokeColorAttributeName;
  id v19 = v17;
  uint64_t v20 = NSStrokeWidthAttributeName;
  unint64_t v21 = sub_1000080B0(inited);
  objc_super v22 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v32._object = (void *)0xE300000000000000LL;
  v23._object = (void *)0x800000010000EB90LL;
  v23._countAndFlagsBits = 0xD000000000000025LL;
  v24._countAndFlagsBits = 0LL;
  v24._object = (void *)0xE000000000000000LL;
  v32._countAndFlagsBits = 7104878LL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, v22, v24, v32)._object;

  id v26 = objc_allocWithZone(&OBJC_CLASS___NSAttributedString);
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  type metadata accessor for Key(0LL);
  sub_10000ACE0();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  id v29 = [v26 initWithString:v27 attributes:isa];

  return v29;
}

void sub_1000096A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  CGFloat v3 = *(double *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  [v1 bounds];
  CGFloat v62 = v6;
  CGFloat v61 = v7;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = *(double *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  [*(id *)&v12 bounds];
  double Width = CGRectGetWidth(v68);
  double v14 = *(void **)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  [v14 bounds];
  double v15 = CGRectGetWidth(v69);
  if (Width <= v15) {
    double Width = v15;
  }
  [*(id *)&v12 bounds];
  double Height = CGRectGetHeight(v70);
  [v14 bounds];
  double v17 = Height + CGRectGetHeight(v71);
  [*(id *)&v12 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [v14 frame];
  v75.origin.CGFloat x = v26;
  v75.origin.CGFloat y = v27;
  v75.size.CGFloat width = v28;
  v75.size.CGFloat height = v29;
  v72.origin.CGFloat x = v19;
  v72.origin.CGFloat y = v21;
  v72.size.CGFloat width = v23;
  v72.size.CGFloat height = v25;
  CGRect v66 = CGRectUnion(v72, v75);
  char v67 = 0;
  v73.origin.CGFloat x = sub_1000066AC((char *)&v66, Width, v17, v62, v61, v9, v11);
  CGFloat x = v73.origin.x;
  CGFloat y = v73.origin.y;
  CGFloat v32 = v73.size.width;
  CGFloat v33 = v73.size.height;
  CGFloat MidX = CGRectGetMidX(v73);
  v74.origin.CGFloat x = x;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = v32;
  v74.size.CGFloat height = v33;
  CGFloat MidY = CGRectGetMidY(v74);
  uint64_t v36 = (CGFloat *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *uint64_t v36 = MidX;
  v36[1] = MidY;
  *((_BYTE *)v36 + swift_weakDestroy(v0 + 16) = 0;
  if (qword_100014D50 != -1) {
    swift_once(&qword_100014D50, sub_100007454);
  }
  uint64_t v37 = sub_10000613C(v2, (uint64_t)qword_1000151B0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)&v3 + 16LL))(v5, v37, v2);
  unint64_t v38 = v1;
  uint64_t v39 = (void *)Logger.logObject.getter(v38);
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v39, v40))
  {

    (*(void (**)(char *, uint64_t))(*(void *)&v3 + 8LL))(v5, v2);
    goto LABEL_9;
  }

  CGFloat v61 = v3;
  CGFloat v62 = v12;
  unint64_t v41 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v42 = swift_slowAlloc(32LL, -1LL);
  aBlock[0] = v42;
  *(_DWORD *)unint64_t v41 = 136315138;
  if (((_BYTE)v36[2] & 1) == 0)
  {
    uint64_t v43 = v42;
    uint64_t v44 = CGPoint.debugDescription.getter(*v36, v36[1]);
    unint64_t v46 = v45;
    uint64_t v63 = sub_10000A664(v44, v45, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, aBlock, v41 + 4, v41 + 12);

    swift_bridgeObjectRelease(v46);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v39, v40, "Moving Automation Mode text group to %s", v41, 0xCu);
    swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1LL, -1LL);
    swift_slowDealloc(v41, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(*(void *)&v61 + 8LL))(v5, v2);
    double v12 = v62;
LABEL_9:
    CGFloat v47 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
    [v47 begin];
    uint64_t v48 = swift_allocObject(&unk_100010FD8, 24LL, 7LL);
    *(void *)(v48 + swift_weakDestroy(v0 + 16) = v38;
    aBlock[4] = (uint64_t)sub_10000A644;
    uint64_t v65 = v48;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100003534;
    aBlock[3] = (uint64_t)&unk_100010FF0;
    id v49 = _Block_copy(aBlock);
    uint64_t v50 = v65;
    double v51 = v38;
    swift_release(v50);
    [v47 setCompletionBlock:v49];
    _Block_release(v49);
    id v52 = [objc_allocWithZone(CABasicAnimation) init];
    NSString v53 = String._bridgeToObjectiveC()();
    [v52 setKeyPath:v53];

    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    [v52 setFromValue:isa];

    Class v55 = Double._bridgeToObjectiveC()().super.super.isa;
    [v52 setToValue:v55];

    [v52 setDuration:0.3];
    [v52 setBeginTime:0.0];
    LODWORD(v56) = 0;
    [*(id *)&v12 setOpacity:v56];
    LODWORD(v57) = 0;
    [v14 setOpacity:v57];
    NSString v58 = String._bridgeToObjectiveC()();
    [*(id *)&v12 addAnimation:v52 forKey:v58];

    NSString v59 = String._bridgeToObjectiveC()();
    [v14 addAnimation:v52 forKey:v59];

    [v47 commit];
    return;
  }

  __break(1u);
}

void sub_100009C50(char *a1)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
  [v2 begin];
  [v2 setDisableActions:1];
  [a1 layoutSublayers];
  [v2 commit];
  [v2 begin];
  id v12 = [objc_allocWithZone(CABasicAnimation) init];
  NSString v3 = String._bridgeToObjectiveC()();
  [v12 setKeyPath:v3];

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v12 setFromValue:isa];

  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v12 setToValue:v5];

  [v12 setDuration:0.3];
  [v12 setBeginTime:0.5];
  double v6 = *(void **)&a1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 addAnimation:v12 forKey:v7];

  double v8 = *(void **)&a1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 addAnimation:v12 forKey:v9];

  LODWORD(v10) = 1.0;
  [v6 setOpacity:v10];
  LODWORD(v11) = 1.0;
  [v8 setOpacity:v11];
  [v2 commit];
}

id sub_100009E64()
{
  uint64_t v1 = v0;
  id v2 = [(id)objc_opt_self(UIColor) blackColor];
  NSString v3 = v2;
  double v4 = 0.6;
  if (v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive]) {
    double v4 = 0.15;
  }
  id v5 = [v2 colorWithAlphaComponent:v4];

  id v6 = [v5 CGColor];
  [v1 setBackgroundColor:v6];

  NSString v7 = *(void **)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  [v1 contentsScale];
  objc_msgSend(v7, "setContentsScale:");
  id v8 = sub_10000902C();
  [v7 setString:v8];

  id v9 = sub_10000902C();
  [v1 bounds];
  CGRect v83 = CGRectInset(v82, 6.0, 6.0);
  double width = v83.size.width;
  double height = v83.size.height;
  id v12 = [objc_allocWithZone(NSMutableParagraphStyle) init];
  [v12 setLineBreakMode:0];
  id v13 = [v9 attributesAtIndex:0 effectiveRange:0];
  type metadata accessor for Key(0LL);
  uint64_t v77 = v14;
  sub_10000ACE0();
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, v77);

  uint64_t v74 = sub_100006028(0LL, &qword_1000153B0, &OBJC_CLASS___NSMutableParagraphStyle_ptr);
  *((void *)&v80 + 1) = v74;
  *(void *)&__int128 v79 = v12;
  sub_10000AE0C(&v79, v78);
  uint64_t v16 = NSParagraphStyleAttributeName;
  id v75 = v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
  sub_10000B3A8(v78, v16, isUniquelyReferenced_nonNull_native);
  uint64_t v18 = v15;

  swift_bridgeObjectRelease(0x8000000000000000LL);
  NSString v19 = [v9 string];
  if (!v19)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v21 = v20;
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
  }

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 1, isa, 0, width, height);
  double v24 = v23;
  double v26 = v25;

  id v76 = v7;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v24, v26);
  CGFloat v27 = *(void **)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  [v1 contentsScale];
  objc_msgSend(v27, "setContentsScale:");
  id v28 = sub_100009374();
  [v27 setString:v28];

  id v29 = sub_100009374();
  [v1 bounds];
  CGRect v85 = CGRectInset(v84, 6.0, 6.0);
  double v30 = v85.size.width;
  double v31 = v85.size.height;
  id v32 = [objc_allocWithZone(NSMutableParagraphStyle) init];
  [v32 setLineBreakMode:0];
  id v33 = [v29 attributesAtIndex:0 effectiveRange:0];
  uint64_t v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v33, v77);

  *((void *)&v80 + 1) = v74;
  *(void *)&__int128 v79 = v32;
  sub_10000AE0C(&v79, v78);
  __int128 v35 = v16;
  id v36 = v32;
  char v37 = swift_isUniquelyReferenced_nonNull_native(v34);
  sub_10000B3A8(v78, v35, v37);
  uint64_t v38 = v34;

  NSString v39 = objc_msgSend(v29, "string", swift_bridgeObjectRelease(0x8000000000000000).n128_f64[0]);
  if (!v39)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v41 = v40;
    NSString v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
  }

  Class v42 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  objc_msgSend(v39, "boundingRectWithSize:options:attributes:context:", 1, v42, 0, v30, v31);
  double v44 = v43;
  double v46 = v45;

  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v44, v46);
  CGFloat v47 = (double *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  if ((v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition + 16] & 1) != 0)
  {
    [v1 bounds];
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    double v56 = v76;
    [v76 bounds];
    double v57 = CGRectGetWidth(v86);
    [v27 bounds];
    double v58 = CGRectGetWidth(v87);
    if (v57 <= v58) {
      double v57 = v58;
    }
    [v76 bounds];
    double v59 = CGRectGetHeight(v88);
    [v27 bounds];
    CGFloat v60 = CGRectGetHeight(v89);
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    char v81 = 1;
    v90.origin.CGFloat x = sub_1000066AC((char *)&v79, v57, v59 + v60, v49, v51, v53, v55);
    CGFloat x = v90.origin.x;
    CGFloat y = v90.origin.y;
    CGFloat v63 = v90.size.width;
    CGFloat v64 = v90.size.height;
    double MidX = CGRectGetMidX(v90);
    v91.origin.CGFloat x = x;
    v91.origin.CGFloat y = y;
    v91.size.double width = v63;
    v91.size.double height = v64;
    double MidY = CGRectGetMidY(v91);
    double *v47 = MidX;
    v47[1] = MidY;
    *((_BYTE *)v47 + swift_weakDestroy(v0 + 16) = 0;
  }

  else
  {
    double MidX = *v47;
    double MidY = v47[1];
    double v56 = v76;
  }

  [v56 bounds];
  objc_msgSend(v27, "bounds", CGRectGetWidth(v92));
  objc_msgSend(v56, "bounds", CGRectGetWidth(v93));
  double v67 = CGRectGetHeight(v94);
  [v27 bounds];
  double v68 = (v67 + CGRectGetHeight(v95)) * 0.5;
  [v56 bounds];
  id result = objc_msgSend(v56, "setPosition:", MidX, MidY - (v68 - CGRectGetHeight(v96) * 0.5 + 2.0));
  if (((_BYTE)v47[2] & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    double v70 = *v47;
    double v71 = v47[1];
    [v56 bounds];
    objc_msgSend(v27, "bounds", CGRectGetWidth(v97));
    objc_msgSend(v56, "bounds", CGRectGetWidth(v98));
    double v72 = CGRectGetHeight(v99);
    [v27 bounds];
    double v73 = (v72 + CGRectGetHeight(v100)) * 0.5;
    [v27 bounds];
    return objc_msgSend(v27, "setPosition:", v70, v71 + v73 - CGRectGetHeight(v101) * 0.5 + 2.0);
  }

  return result;
}

uint64_t type metadata accessor for OverlayLayer()
{
  return objc_opt_self(&OBJC_CLASS____TtC16AutomationModeUI12OverlayLayer);
}

uint64_t sub_10000A620()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000A644()
{
}

uint64_t sub_10000A64C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A65C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000A664(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A734(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A8EC((uint64_t)v12, *a3);
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
      sub_10000A8EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000062C4(v12);
  return v7;
}

uint64_t sub_10000A734(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000A928(a5, a6);
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

uint64_t sub_10000A8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A928(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A9BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_10000AB94(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000AB94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A9BC(uint64_t a1, unint64_t a2)
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
      id v5 = sub_10000AB30(v4, 0LL);
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

void *sub_10000AB30(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005FA4(&qword_100015380);
  id v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000AB94(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005FA4(&qword_100015380);
    double v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    double v11 = (char *)&_swiftEmptyArrayStorage;
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

unint64_t sub_10000ACE0()
{
  unint64_t result = qword_1000150C8;
  if (!qword_1000150C8)
  {
    type metadata accessor for Key(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10000D938, v1);
    atomic_store(result, (unint64_t *)&qword_1000150C8);
  }

  return result;
}

unint64_t sub_10000AD28(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000AE1C(a1, a2, v5);
}

unint64_t sub_10000AD8C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10000AEFC(a1, v7);
}

_OWORD *sub_10000AE0C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000AE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_10000AEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

_OWORD *sub_10000B070(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005FA4(&qword_1000153A0);
  char v40 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v38 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  unint64_t result = (_OWORD *)swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_25;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v18 >= v38) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v39 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v38) {
        goto LABEL_37;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v38)
        {
LABEL_37:
          swift_release(v5);
          if ((v40 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v20 = *(void *)(v39 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1LL)) {
              goto LABEL_46;
            }
            if (v14 >= v38) {
              goto LABEL_37;
            }
            unint64_t v20 = *(void *)(v39 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_24;
            }
          }
        }

        int64_t v14 = v21;
      }
    }

LABEL_24:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_25:
    char v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    double v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if ((v40 & 1) != 0)
    {
      sub_10000AE0C(v23, v42);
    }

    else
    {
      sub_10000A8EC((uint64_t)v23, (uint64_t)v42);
      id v24 = v22;
    }

    uint64_t v25 = *(void *)(v8 + 40);
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    uint64_t v28 = v27;
    Hasher.init(_seed:)(v41, v25);
    String.hash(into:)(v41, v26, v28);
    Swift::Int v29 = Hasher._finalize()();
    unint64_t result = (_OWORD *)swift_bridgeObjectRelease(v28);
    uint64_t v30 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1LL << v31) & ~*(void *)(v12 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1LL << v31) & ~*(void *)(v12 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0LL;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v12 + 8 * v32);
      }

      while (v36 == -1);
      unint64_t v15 = __clz(__rbit64(~v36)) + (v32 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v8 + 48) + 8 * v15) = v22;
    unint64_t result = sub_10000AE0C(v42, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v19 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v37 = 1LL << *(_BYTE *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v19, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v19 = -1LL << v37;
  }
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = 0LL;
LABEL_44:
  unint64_t result = (_OWORD *)swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

_OWORD *sub_10000B3A8(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_10000AD8C((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }

  else
  {
    char v13 = v8;
    uint64_t v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      unint64_t v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        unint64_t v16 = (void *)(v15[7] + 32 * v9);
        sub_1000062C4(v16);
        return sub_10000AE0C(a1, v16);
      }

      goto LABEL_11;
    }

    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_10000B52C();
      goto LABEL_7;
    }

    sub_10000B070(v12, a3 & 1);
    unint64_t v18 = sub_10000AD8C((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if ((v13 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10000B4C8(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }

  type metadata accessor for Key(0LL);
  unint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *sub_10000B4C8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  unint64_t result = sub_10000AE0C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_10000B52C()
{
  uint64_t v1 = v0;
  sub_100005FA4(&qword_1000153A0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = *(void *)(v2 + 16);
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

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10000A8EC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + vswift_weakDestroy(v0 + 16) = v17;
    sub_10000AE0C(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }

  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

double sub_10000B6F0()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSUserDefaults);
  id v1 = [v0 standardUserDefaults];
  uint64_t v2 = sub_100005FA4(&qword_1000153B8);
  uint64_t inited = swift_initStackObject(v2, &v11);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_10000DA00;
  *(void *)(inited + 32) = 0xD00000000000001DLL;
  *(void *)(inited + 40) = 0x800000010000EC60LL;
  *(void *)(inited + 72) = &type metadata for Double;
  *(void *)(inited + 48) = 0x403E000000000000LL;
  unint64_t v4 = sub_100007F7C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  [v1 registerDefaults:isa];

  id v6 = [v0 standardUserDefaults];
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 doubleForKey:v7];
  double v9 = v8;

  return v9;
}

void sub_10000B840()
{
  id v1 = &v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)id v1 = 0LL;
  *((void *)v1 + 1) = 0LL;
  v1[16] = 1;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0LL;
  v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v2 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  id v3 = [(id)objc_opt_self(UIColor) blackColor];
  id v4 = [v3 colorWithAlphaComponent:0.4];

  *(void *)&v0[v2] = v4;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010000EC30LL,  "AutomationModeUI/Overlay~embedded.swift",  39LL,  2LL,  175LL,  0);
  __break(1u);
}

uint64_t sub_10000B938()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000B95C(void *a1)
{
}

uint64_t sub_10000B964(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005FA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B9A8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000B9B8()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD00000000000001DLL,  0x800000010000ECA0LL,  0x746C7561666544LL,  0xE700000000000000LL);
  qword_100015AE0 = result;
  return result;
}

unint64_t sub_10000BA14()
{
  unint64_t result = qword_1000153E0;
  if (!qword_1000153E0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000153E0);
  }

  return result;
}

uint64_t sub_10000BA50()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000062E4(v0, qword_1000153E8);
  sub_10000613C(v0, (uint64_t)qword_1000153E8);
  if (qword_100014D58 != -1) {
    swift_once(&qword_100014D58, sub_10000B9B8);
  }
  return Logger.init(_:)((id)qword_100015AE0);
}

void sub_10000BAD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005FA4(&qword_100015540);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  NSString v7 = (char *)aBlock - v6;
  sub_10000C8AC();
  double v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject(&unk_1000110C0, 24LL, 7LL);
  swift_weakInit(v9 + 16, v1);
  aBlock[4] = sub_10000CBC0;
  uint64_t v16 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000BD04;
  aBlock[3] = &unk_1000110D8;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release(v16);
  id v11 = (id)XAMRegisterAutomationModeChangeHandler(v8, v10);
  _Block_release(v10);

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v12 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v7, 0LL, 1LL, v12);
  sub_10000CBC8((uint64_t)v7, (uint64_t)v5);
  uint64_t v13 = v1 + OBJC_IVAR____TtC16AutomationModeUI16AutomationModeUI_observationToken;
  swift_beginAccess(v13, aBlock, 33LL, 0LL);
  sub_10000CC10((uint64_t)v5, v13);
  swift_endAccess(aBlock);
  id v14 = [(id)objc_opt_self(NSRunLoop) currentRunLoop];
  [v14 run];
}

uint64_t sub_10000BCA8(char a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v3);
  if (result)
  {
    uint64_t v5 = result;
    sub_10000BD40(a1 & 1);
    return swift_release(v5);
  }

  return result;
}

uint64_t sub_10000BD04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_10000BD40(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSString v7 = &v40[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = &v40[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  sub_10000C8AC();
  void *v11 = static OS_dispatch_queue.main.getter();
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  char v12 = _dispatchPreconditionTest(_:)(v11);
  uint64_t v13 = (*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
    return;
  }

  uint64_t v14 = Logger.init()(v13);
  unint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  if ((a1 & 1) != 0)
  {
    if (v17)
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Handling transition to automation mode ENABLED", v18, 2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    uint64_t v19 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0LL;
    if (v19)
    {
      sub_1000087D0();
      swift_release(v19);
    }

    uint64_t v20 = type metadata accessor for EventManager();
    swift_allocObject(v20, 56LL, 7LL);
    int64_t v21 = sub_1000041FC();
    uint64_t v22 = *(void *)(v2 + 16);
    *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v21;
    swift_release(v22);
    uint64_t v23 = *(void *)(v2 + 16);
    if (v23)
    {
      *(void *)(v23 + 40) = &off_100011068;
      swift_unknownObjectWeakAssign(v23 + 32, v2);
      swift_retain(v23);
      sub_1000042AC();
      swift_release(v23);
    }

    if ((sub_10000CA0C() & 1) == 0) {
      goto LABEL_29;
    }
    id v24 = [(id)objc_opt_self(CADisplay) mainDisplay];
    if (!v24)
    {
      char v33 = (os_log_s *)Logger.logObject.getter(0LL);
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        BOOL v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)BOOL v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "No main display (CADisplay.main() returned nil).", v35, 2u);
        swift_slowDealloc(v35, -1LL, -1LL);
      }

      goto LABEL_29;
    }

    id v25 = v24;
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v28 = 67109120;
      unsigned int v41 = [v25 displayId];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v28 + 4, v28 + 8);

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Creating overlay for main display with id %u", v28, 8u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v36 = type metadata accessor for Overlay();
    uint64_t v37 = swift_allocObject(v36, 57LL, 7LL);
    *(_OWORD *)(v37 + 24) = 0u;
    *(_OWORD *)(v37 + 40) = 0u;
    *(_BYTE *)(v37 + 56) = 0;
    *(void *)(v37 + swift_unknownObjectWeakDestroy(v0 + 16) = v25;
    uint64_t v38 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = v37;
    id v39 = v25;
    swift_retain(v37);
    if (v38)
    {
      sub_1000087D0();
      swift_release(v38);
    }

    swift_release(v37);
    uint64_t v32 = *(void *)(v2 + 24);
    if (!v32)
    {
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);

      return;
    }

    swift_retain(*(void *)(v2 + 24));
    sub_1000074D4();
  }

  else
  {
    if (v17)
    {
      Swift::Int v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)Swift::Int v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Handling transition to automation mode disabled", v29, 2u);
      swift_slowDealloc(v29, -1LL, -1LL);
    }

    uint64_t v30 = *(void *)(v2 + 16);
    if (v30)
    {
      swift_retain(*(void *)(v2 + 16));
      sub_1000049B8();
      swift_release(v30);
      uint64_t v31 = *(void *)(v2 + 16);
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
    swift_release(v31);
    uint64_t v32 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0LL;
    if (!v32) {
      goto LABEL_29;
    }
    sub_1000087D0();
  }

  swift_release(v32);
LABEL_29:
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10000C1DC(uint64_t a1)
{
  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    if (qword_100014D60 != -1) {
      swift_once(&qword_100014D60, sub_10000BA50);
    }
    uint64_t v2 = type metadata accessor for Logger(0LL);
    sub_10000613C(v2, (uint64_t)qword_1000153E8);
    swift_errorRetain(a1);
    uint64_t v3 = swift_errorRetain(a1);
    oslog = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v6 = swift_slowAlloc(32LL, -1LL);
      uint64_t v18 = v6;
      *(_DWORD *)uint64_t v5 = 136446210;
      swift_getErrorValue(a1, v17, v16);
      uint64_t v7 = Error.localizedDescription.getter(v16[1], v16[2]);
      unint64_t v9 = v8;
      uint64_t v15 = sub_10000A664(v7, v8, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v5 + 4, v5 + 12);
      swift_bridgeObjectRelease(v9);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v4,  "Request to disable automation mode failed with error %{public}s",  v5,  0xCu);
      swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v6, -1LL, -1LL);
      swift_slowDealloc(v5, -1LL, -1LL);

      swift_errorRelease(a1);
      return;
    }

    swift_errorRelease(a1);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  else
  {
    if (qword_100014D60 != -1) {
      swift_once(&qword_100014D60, sub_10000BA50);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_10000613C(v10, (uint64_t)qword_1000153E8);
    oslog = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Request to disable automation mode succeeded.", v13, 2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }
  }
}

void sub_10000C478(uint64_t a1, void *a2)
{
  os_log_type_t v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

void sub_10000C4CC()
{
  uint64_t v1 = v0;
  if (qword_100014D60 != -1) {
    swift_once(&qword_100014D60, sub_10000BA50);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000613C(v2, (uint64_t)qword_1000153E8);
  os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "User did become active, updating UI, fading overlay for main display",  v6,  2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v1 + 24);
  if (v7)
  {
    *(_BYTE *)(v7 + 56) = 1;
    unint64_t v8 = *(_BYTE **)(v7 + 40);
    if (v8)
    {
      v8[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 1;
      [v8 layoutSublayers];
    }
  }

void sub_10000C5DC()
{
  uint64_t v1 = v0;
  if (qword_100014D60 != -1) {
    swift_once(&qword_100014D60, sub_10000BA50);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000613C(v2, (uint64_t)qword_1000153E8);
  os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "User did become inactive, updating UI, darkening overlay for main display",  v6,  2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v1 + 24);
  if (v7)
  {
    *(_BYTE *)(v7 + 56) = 0;
    unint64_t v8 = *(_BYTE **)(v7 + 40);
    if (v8)
    {
      v8[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
      [v8 layoutSublayers];
    }
  }

uint64_t sub_10000C6E8()
{
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for AutomationModeUI(0LL);
  uint64_t v4 = swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
  *(void *)(v4 + 24) = 0LL;
  uint64_t v5 = v4 + OBJC_IVAR____TtC16AutomationModeUI16AutomationModeUI_observationToken;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  sub_10000BAD0();
  swift_release(v4);
  return 0;
}

uint64_t type metadata accessor for AutomationModeUI(uint64_t a1)
{
  uint64_t result = qword_100015428;
  if (!qword_100015428) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AutomationModeUI);
  }
  return result;
}

uint64_t sub_10000C7D8()
{
  return type metadata accessor for AutomationModeUI(0LL);
}

void sub_10000C7E0(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = "\b";
  sub_10000C858(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
  }

void sub_10000C858(uint64_t a1)
{
  if (!qword_100015438)
  {
    uint64_t v2 = type metadata accessor for UUID(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100015438);
    }
  }

unint64_t sub_10000C8AC()
{
  unint64_t result = qword_100014FE0;
  if (!qword_100014FE0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100014FE0);
  }

  return result;
}

void sub_10000C8E8()
{
  if (qword_100014D60 != -1) {
    swift_once(&qword_100014D60, sub_10000BA50);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_10000613C(v0, (uint64_t)qword_1000153E8);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "User invoked gesture for stopping automation.", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  v6[4] = sub_10000C1DC;
  void v6[5] = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_10000C478;
  v6[3] = &unk_100011088;
  uint64_t v5 = _Block_copy(v6);
  XAMDisableAutomationModeWithCompletion();
  _Block_release(v5);
}

uint64_t sub_10000CA0C()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned int v2 = [v0 BOOLForKey:v1];

  if (v2)
  {
    if (qword_100014D60 != -1) {
      swift_once(&qword_100014D60, sub_10000BA50);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_10000613C(v3, (uint64_t)qword_1000153E8);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Overlay displayed for local development because of LocalAutomationModeUIDevelopment user default.",  v7,  2u);
      swift_slowDealloc(v7, -1LL, -1LL);
    }
  }

  return 1LL;
}

uint64_t sub_10000CB44(uint64_t a1)
{
  uint64_t v2 = sub_100005FA4(&qword_100015540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000CB84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000CB94(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000CB9C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000CBC0(char a1)
{
  return sub_10000BCA8(a1, v1);
}

uint64_t sub_10000CBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_100015540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FA4(&qword_100015540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CC60()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC16AutomationModeUIP33_75CFB59487EB05C89D32E53AEB9D623519ResourceBundleClass);
}