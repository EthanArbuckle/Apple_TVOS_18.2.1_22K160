uint64_t sub_2838(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return swift_task_switch(sub_2850, 0LL, 0LL);
}

uint64_t sub_2850()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_2C70(&qword_18C68);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  v0[4] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_109A0;
  *(void *)(v3 + 32) = 1701669236LL;
  *(void *)(v3 + 40) = 0xE400000000000000LL;
  uint64_t v4 = 0LL;
  if (v1)
  {
    uint64_t v4 = type metadata accessor for DialogCalendar(0LL);
  }

  else
  {
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 72) = v4;
  uint64_t v5 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  swift_retain(v1);
  v6 = (void *)swift_task_alloc(v5);
  v0[5] = v6;
  void *v6 = v0;
  v6[1] = sub_293C;
  return v8(0xD000000000000027LL, 0x8000000000011040LL, v3);
}

uint64_t sub_293C(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 40);
  uint64_t v5 = *v2;
  *(void *)(v5 + 48) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    return swift_task_switch(sub_29C4, 0LL, 0LL);
  }
  swift_bridgeObjectRelease(*(void *)(v5 + 32));
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t sub_29C4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_29F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2A3C(a1, a2, a3);
}

uint64_t sub_2A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  sub_2D48();
  uint64_t v10 = v9 - v8;
  sub_2C70(&qword_18C60);
  __chkstk_darwin();
  sub_2D48();
  uint64_t v13 = v12 - v11;
  sub_2CB0(a1, v12 - v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  uint64_t v14 = CATWrapperSimple.init(templateDir:options:globals:)(v13, v10, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_2CF8(a1);
  return v14;
}

uint64_t sub_2B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CATOption(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_2D48();
  uint64_t v8 = v7 - v6;
  sub_2D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  uint64_t v9 = CATWrapperSimple.init(useResponseMode:options:)(a1, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v9;
}

uint64_t sub_2BD0()
{
  uint64_t v0 = CATWrapperSimple.deinit();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t variable initialization expression of ShowClockIntentResponse.code()
{
  return 0LL;
}

uint64_t type metadata accessor for ShowClockCATsSimple(uint64_t a1)
{
  uint64_t result = qword_18C08;
  if (!qword_18C08) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ShowClockCATsSimple);
  }
  return result;
}

uint64_t sub_2C2C(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_194A0);
}

uint64_t sub_2C68()
{
  return type metadata accessor for ShowClockCATsSimple(0LL);
}

uint64_t sub_2C70(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_2CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2C70(&qword_18C60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_2CF8(uint64_t a1)
{
  uint64_t v2 = sub_2C70(&qword_18C60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_2D38()
{
  return swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
}

  ;
}

uint64_t sub_2D58()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_18C70);
  sub_3E10(v0, (uint64_t)qword_18C70);
  return static SiriTimeLog.clockFlow.getter();
}

void sub_2DA0(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse());
  uint64_t v5 = ShowClockIntentResponse.init(code:userActivity:)(1LL, 0LL);
  ((void (**)(void, char *))a3)[2](a3, v5);

  _Block_release(a3);
}

void ShowClockIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(void))
{
  id v3 = objc_allocWithZone((Class)sub_41F8());
  id v4 = sub_41F0(1LL);
  a2();
  sub_4188(v4);
}

void sub_2E48(void *a1, uint64_t a2, void (**a3)(void, char *))
{
  v85 = a3;
  uint64_t v4 = sub_2C70(&qword_18C88);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_2C70(&qword_18C90);
  __chkstk_darwin(v7);
  uint64_t v79 = (uint64_t)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_2C70(&qword_18C98);
  __chkstk_darwin(v9);
  uint64_t v81 = (uint64_t)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DateComponents(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v86 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  v16 = (char *)&v76 - v15;
  uint64_t v17 = sub_2C70(&qword_18CA0);
  __chkstk_darwin(v17);
  v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for Date(0LL);
  v82 = *(void (**)(char *, uint64_t))(v20 - 8);
  uint64_t v21 = __chkstk_darwin(v20);
  v80 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  v83 = (char *)&v76 - v23;
  uint64_t v87 = type metadata accessor for Calendar(0LL);
  uint64_t v84 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  v25 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18BA0 != -1) {
    swift_once(&qword_18BA0, sub_2D58);
  }
  uint64_t v26 = type metadata accessor for Logger(0LL);
  uint64_t v78 = sub_3E10(v26, (uint64_t)qword_18C70);
  v27 = (os_log_s *)Logger.logObject.getter(v78);
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    v77 = v16;
    v30 = v19;
    v31 = v6;
    uint64_t v32 = v12;
    uint64_t v33 = v11;
    uint64_t v34 = v20;
    v35 = a1;
    v36 = v25;
    v37 = v29;
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_0, v27, v28, "ShowClockIntentHandler.handle() is called", v29, 2u);
    v38 = v37;
    v25 = v36;
    a1 = v35;
    uint64_t v20 = v34;
    uint64_t v11 = v33;
    uint64_t v12 = v32;
    uint64_t v6 = v31;
    v19 = v30;
    v16 = v77;
    swift_slowDealloc(v38, -1LL, -1LL);
  }

  static Calendar.current.getter();
  id v39 = [a1 offset];
  if (v39)
  {
    v40 = v39;
    v41 = v86;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v42 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
    uint64_t v43 = v81;
    v42(v81, v41, v11);
    sub_3E28(v43, 0LL, 1LL, v11);
    if (sub_3E34(v43, 1LL, v11) != 1)
    {
      uint64_t v44 = ((uint64_t (*)(char *, uint64_t, uint64_t))v42)(v16, v43, v11);
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v43 = v81;
    sub_3E28(v81, 1LL, 1LL, v11);
  }

  uint64_t v45 = v43;
  uint64_t v46 = v79;
  sub_3E28(v79, 1LL, 1LL, v87);
  uint64_t v47 = type metadata accessor for TimeZone(0LL);
  sub_3E28((uint64_t)v6, 1LL, 1LL, v47);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v46,  v6,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL);
  uint64_t v44 = sub_3E40(v45, &qword_18C98);
LABEL_10:
  v48 = v80;
  Date.init()(v44);
  Calendar.date(byAdding:to:wrappingComponents:)(v16, v48, 0LL);
  v49 = v82;
  v50 = (void (*)(char *, uint64_t))*((void *)v82 + 1);
  v50(v48, v20);
  v51 = v25;
  v52 = *(void (**)(char *, uint64_t))(v12 + 8);
  v52(v16, v11);
  if (sub_3E34((uint64_t)v19, 1LL, v20) == 1)
  {
    uint64_t v53 = sub_3E40((uint64_t)v19, &qword_18CA0);
    v54 = (os_log_s *)Logger.logObject.getter(v53);
    os_log_type_t v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_0, v54, v55, "Failed to calucate the date.", v56, 2u);
      swift_slowDealloc(v56, -1LL, -1LL);
    }

    id v57 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse());
    v58 = ShowClockIntentResponse.init(code:userActivity:)(5LL, 0LL);
    v59 = v85;
    v85[2](v85, v58);
  }

  else
  {
    (*((void (**)(char *, char *, uint64_t))v49 + 4))(v83, v19, v20);
    id v60 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse());
    v82 = v50;
    v61 = ShowClockIntentResponse.init(code:userActivity:)(4LL, 0LL);
    uint64_t v62 = sub_2C70(&qword_18CA8);
    uint64_t v81 = v20;
    uint64_t v63 = v62;
    uint64_t v64 = type metadata accessor for Calendar.Component(0LL);
    v65 = v86;
    uint64_t v66 = *(void *)(v64 - 8);
    uint64_t v67 = *(void *)(v66 + 72);
    uint64_t v68 = *(unsigned __int8 *)(v66 + 80);
    uint64_t v69 = (v68 + 32) & ~v68;
    uint64_t v70 = swift_allocObject(v63, v69 + 9 * v67, v68 | 7);
    *(_OWORD *)(v70 + 16) = xmmword_10A00;
    uint64_t v71 = v70 + v69;
    v72 = *(void (**)(uint64_t, void, uint64_t))(v66 + 104);
    v72(v71, enum case for Calendar.Component.year(_:), v64);
    v72(v71 + v67, enum case for Calendar.Component.month(_:), v64);
    v72(v71 + 2 * v67, enum case for Calendar.Component.day(_:), v64);
    v72(v71 + 3 * v67, enum case for Calendar.Component.hour(_:), v64);
    v72(v71 + 4 * v67, enum case for Calendar.Component.minute(_:), v64);
    v72(v71 + 5 * v67, enum case for Calendar.Component.second(_:), v64);
    v72(v71 + 6 * v67, enum case for Calendar.Component.weekday(_:), v64);
    v72(v71 + 7 * v67, enum case for Calendar.Component.weekOfMonth(_:), v64);
    v72(v71 + 8 * v67, enum case for Calendar.Component.weekOfYear(_:), v64);
    uint64_t v73 = sub_3E7C(v70);
    v74 = v83;
    Calendar.dateComponents(_:from:)(v73, v83);
    swift_bridgeObjectRelease(v73);
    Class isa = DateComponents._bridgeToObjectiveC()().super.isa;
    v52(v65, v11);
    [v61 setDateTime:isa];

    v59 = v85;
    v85[2](v85, v61);

    v82(v74, v81);
  }

  (*(void (**)(char *, uint64_t))(v84 + 8))(v51, v87);
  _Block_release(v59);
}

uint64_t ShowClockIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v85 = a3;
  v86 = a2;
  sub_2C70(&qword_18C88);
  sub_4198();
  __chkstk_darwin(v4);
  sub_2D48();
  uint64_t v7 = v6 - v5;
  sub_2C70(&qword_18C90);
  sub_4198();
  __chkstk_darwin(v8);
  sub_41BC();
  uint64_t v79 = v9;
  sub_2C70(&qword_18C98);
  sub_4198();
  __chkstk_darwin(v10);
  sub_2D48();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for DateComponents(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_41D0();
  uint64_t v87 = v16;
  __chkstk_darwin(v17);
  v19 = (char *)v78 - v18;
  sub_2C70(&qword_18CA0);
  sub_4198();
  __chkstk_darwin(v20);
  sub_41BC();
  uint64_t v82 = v21;
  uint64_t v22 = type metadata accessor for Date(0LL);
  uint64_t v81 = *(void *)(v22 - 8);
  sub_4198();
  __chkstk_darwin(v23);
  sub_41D0();
  v80 = v24;
  __chkstk_darwin(v25);
  v83 = (char *)v78 - v26;
  uint64_t v88 = type metadata accessor for Calendar(0LL);
  uint64_t v84 = *(void *)(v88 - 8);
  sub_4198();
  __chkstk_darwin(v27);
  sub_2D48();
  uint64_t v30 = v29 - v28;
  if (qword_18BA0 != -1) {
    swift_once(&qword_18BA0, sub_2D58);
  }
  uint64_t v31 = type metadata accessor for Logger(0LL);
  v78[1] = sub_3E10(v31, (uint64_t)qword_18C70);
  uint64_t v32 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)sub_420C();
    v78[0] = v19;
    uint64_t v35 = v7;
    uint64_t v36 = v15;
    uint64_t v37 = v22;
    uint64_t v38 = v14;
    uint64_t v39 = v13;
    v40 = v34;
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_0, v32, v33, "ShowClockIntentHandler.handle() is called", v34, 2u);
    uint64_t v41 = (uint64_t)v40;
    uint64_t v13 = v39;
    uint64_t v14 = v38;
    uint64_t v22 = v37;
    uint64_t v15 = v36;
    uint64_t v7 = v35;
    v19 = (char *)v78[0];
    sub_4200(v41);
  }

  static Calendar.current.getter();
  id v42 = [a1 offset];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = v87;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
    v45(v13, (uint64_t)v44, v14);
    sub_41E4(v13, 0LL);
    int v46 = sub_3E34(v13, 1LL, v14);
    uint64_t v47 = v82;
    if (v46 != 1)
    {
      uint64_t v48 = ((uint64_t (*)(char *, uint64_t, uint64_t))v45)(v19, v13, v14);
      goto LABEL_10;
    }
  }

  else
  {
    sub_41E4(v13, 1LL);
    uint64_t v47 = v82;
  }

  uint64_t v49 = v13;
  uint64_t v50 = v79;
  sub_3E28(v79, 1LL, 1LL, v88);
  uint64_t v51 = type metadata accessor for TimeZone(0LL);
  sub_3E28(v7, 1LL, 1LL, v51);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v50,  v7,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL);
  uint64_t v48 = sub_3E40(v49, &qword_18C98);
LABEL_10:
  v52 = v80;
  Date.init()(v48);
  Calendar.date(byAdding:to:wrappingComponents:)(v19, v52, 0LL);
  uint64_t v53 = v81;
  v54 = *(void (**)(void, uint64_t))(v81 + 8);
  v54(v52, v22);
  os_log_type_t v55 = v19;
  v56 = *(void (**)(char *, uint64_t))(v15 + 8);
  v56(v55, v14);
  if (sub_3E34(v47, 1LL, v22) == 1)
  {
    uint64_t v57 = sub_3E40(v47, &qword_18CA0);
    v58 = (os_log_s *)Logger.logObject.getter(v57);
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      id v60 = (uint8_t *)sub_420C();
      *(_WORD *)id v60 = 0;
      _os_log_impl(&dword_0, v58, v59, "Failed to calucate the date.", v60, 2u);
      sub_4200((uint64_t)v60);
    }

    id v61 = objc_allocWithZone((Class)sub_41F8());
    uint64_t v62 = sub_41F0(5LL);
    v86();
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v83, v47, v22);
    id v63 = objc_allocWithZone((Class)sub_41F8());
    uint64_t v64 = sub_41F0(4LL);
    uint64_t v81 = v22;
    v65 = v64;
    uint64_t v66 = sub_2C70(&qword_18CA8);
    uint64_t v67 = *(void *)(type metadata accessor for Calendar.Component(0LL) - 8);
    uint64_t v82 = v30;
    v80 = v54;
    uint64_t v68 = *(void *)(v67 + 72);
    uint64_t v69 = *(unsigned __int8 *)(v67 + 80);
    uint64_t v70 = v87;
    uint64_t v71 = (v69 + 32) & ~v69;
    uint64_t v72 = swift_allocObject(v66, v71 + 9 * v68, v69 | 7);
    *(_OWORD *)(v72 + 16) = xmmword_10A00;
    uint64_t v73 = v72 + v71;
    sub_4180(v73, enum case for Calendar.Component.year(_:));
    sub_4180(v73 + v68, enum case for Calendar.Component.month(_:));
    sub_4180(v73 + 2 * v68, enum case for Calendar.Component.day(_:));
    sub_4180(v73 + 3 * v68, enum case for Calendar.Component.hour(_:));
    sub_4180(v73 + 4 * v68, enum case for Calendar.Component.minute(_:));
    sub_4180(v73 + 5 * v68, enum case for Calendar.Component.second(_:));
    sub_4180(v73 + 6 * v68, enum case for Calendar.Component.weekday(_:));
    sub_4180(v73 + 7 * v68, enum case for Calendar.Component.weekOfMonth(_:));
    uint64_t v30 = v82;
    sub_4180(v73 + 8 * v68, enum case for Calendar.Component.weekOfYear(_:));
    uint64_t v74 = sub_3E7C(v72);
    v75 = v83;
    Calendar.dateComponents(_:from:)(v74, v83);
    swift_bridgeObjectRelease(v74);
    Class isa = DateComponents._bridgeToObjectiveC()().super.isa;
    v56(v70, v14);
    [v65 setDateTime:isa];

    ((void (*)(char *))v86)(v65);
    v80(v75, v81);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 8))(v30, v88);
}

void sub_3D08(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);

  sub_4188(v10);
}

id ShowClockIntentHandler.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id ShowClockIntentHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id ShowClockIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_3E10(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_3E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_3E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_3E40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2C70(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_3E7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v34 = *(void *)(v2 - 8);
  sub_4198();
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    id v10 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_2C70(&qword_18CD8);
  uint64_t result = static _SetStorage.allocate(capacity:)(v8);
  id v10 = (void *)result;
  uint64_t v31 = *(void *)(a1 + 16);
  if (!v31)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v10;
  }

  unint64_t v11 = 0LL;
  uint64_t v33 = result + 56;
  uint64_t v12 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v29 = a1;
  uint64_t v30 = a1 + ((v12 + 32) & ~v12);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v34 + 72);
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
    v14(v7, v30 + v13 * v11, v2);
    uint64_t v15 = v10[5];
    uint64_t v16 = sub_4100(&qword_18CE0, (uint64_t)&protocol conformance descriptor for Calendar.Component);
    uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v2, v16) & ~(-1LL << *((_BYTE *)v10 + 32));
    sub_41A4();
    if ((v20 & v19) != 0)
    {
      unint64_t v32 = v11;
      uint64_t v22 = ~v21;
      while (1)
      {
        v14(v5, v10[6] + v17 * v13, v2);
        uint64_t v23 = sub_4100(&qword_18CE8, (uint64_t)&protocol conformance descriptor for Calendar.Component);
        char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v7, v2, v23);
        uint64_t v25 = *(void (**)(char *, uint64_t))(v34 + 8);
        v25(v5, v2);
        if ((v24 & 1) != 0) {
          break;
        }
        uint64_t v17 = (v17 + 1) & v22;
        sub_41A4();
        if ((v19 & v20) == 0)
        {
          a1 = v29;
          unint64_t v11 = v32;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v7, v2);
      a1 = v29;
      unint64_t v11 = v32;
    }

    else
    {
LABEL_10:
      *(void *)(v33 + 8 * v18) = v20 | v19;
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v10[6] + v17 * v13, v7, v2);
      uint64_t v26 = v10[2];
      BOOL v27 = __OFADD__(v26, 1LL);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_18;
      }
      v10[2] = v28;
    }

    if (++v11 == v31) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ShowClockIntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC15ClockFlowPlugin22ShowClockIntentHandler);
}

uint64_t sub_4100(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for Calendar.Component(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t *sub_4140(uint64_t a1, uint64_t *a2)
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

uint64_t sub_4180(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

void sub_4188(id a1)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_41E4(uint64_t a1, uint64_t a2)
{
  return sub_3E28(a1, a2, 1LL, v2);
}

char *sub_41F0(uint64_t a1)
{
  return ShowClockIntentResponse.init(code:userActivity:)(a1, 0LL);
}

uint64_t sub_41F8()
{
  return type metadata accessor for ShowClockIntentResponse();
}

uint64_t sub_4200(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_420C()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_4218()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_18D50);
  sub_3E10(v0, (uint64_t)qword_18D50);
  return static SiriTimeLog.clockFlow.getter();
}

uint64_t sub_4260()
{
  uint64_t v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_4294();
  return v1;
}

uint64_t sub_4294()
{
  uint64_t v1 = type metadata accessor for ClockFlowPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
  id v3 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  static CATExecutor.registerBundle(bundle:templateDir:)();

  return v0;
}

uint64_t sub_431C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClockFlowProvider();
  swift_initStackObject(v2, v18);
  ClockFlowFactory.makeFlowFrom(parse:)(a1);
  if (v3) {
    return v3;
  }
  if (qword_18BA8 != -1) {
    swift_once(&qword_18BA8, sub_4218);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_3E10(v5, (uint64_t)qword_18D50);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)sub_420C();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "ClockFlowPlugin unable to handle input parse", v9, 2u);
    sub_4200((uint64_t)v9);
  }

  uint64_t v10 = type metadata accessor for ABCReport(0LL);
  unint64_t v11 = sub_4760(v10, (uint64_t)&protocol witness table for ABCReport, v16, v17[0], v17[1], v17[2], v17[3], v17[4]);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v10 - 8) + 104LL))( v11,  enum case for ABCReport.clockParseRejection(_:),  v10);
  static BarbaraWalters.stopThePresses(for:)(v17);
  _s20HandleIntentStrategyVwxx_0(v17);
  uint64_t v12 = type metadata accessor for NoOpFlow(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  uint64_t v13 = NoOpFlow.init()();
  v17[0] = v13;
  uint64_t v14 = sub_4720( &qword_18E18,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for NoOpFlow,  (uint64_t)&protocol conformance descriptor for NoOpFlow);
  uint64_t v4 = Flow.eraseToAnyFlow()(v12, v14);
  swift_release(v13);
  return v4;
}

uint64_t sub_44BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClockFlowProvider();
  swift_initStackObject(v2, v16);
  ClockFlowFactory.makeFlowFrom(parse:)(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    static FlowSearchResult.flow(_:)();
    return swift_release(v4);
  }

  else
  {
    if (qword_18BA8 != -1) {
      swift_once(&qword_18BA8, sub_4218);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_3E10(v6, (uint64_t)qword_18D50);
    os_log_type_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)sub_420C();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "ClockFlowPlugin unable to handle input parse", v10, 2u);
      sub_4200((uint64_t)v10);
    }

    uint64_t v11 = type metadata accessor for ABCReport(0LL);
    uint64_t v12 = sub_4760(v11, (uint64_t)&protocol witness table for ABCReport, v14, v15[0], v15[1], v15[2], v15[3], v15[4]);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104LL))( v12,  enum case for ABCReport.clockParseRejection(_:),  v11);
    static BarbaraWalters.stopThePresses(for:)(v15);
    uint64_t v13 = _s20HandleIntentStrategyVwxx_0(v15);
    return static FlowSearchResult.noFlow.getter(v13);
  }
}

uint64_t sub_460C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ClockFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC15ClockFlowPlugin15ClockFlowPlugin);
}

uint64_t sub_463C(uint64_t a1)
{
  return sub_44BC(a1);
}

uint64_t sub_4650@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_4260();
  *a1 = result;
  return result;
}

uint64_t sub_4680(uint64_t a1)
{
  return sub_431C(a1);
}

uint64_t sub_4698(uint64_t a1, uint64_t a2)
{
  return sub_4720( &qword_18E10,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for ClockFlowPlugin,  (uint64_t)")B");
}

void *sub_46C4(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t _s20HandleIntentStrategyVwxx_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4720(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_4760@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  a7 = a1;
  a8 = a2;
  return sub_46C4(&a4);
}

uint64_t _s20HandleIntentStrategyVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t _s20HandleIntentStrategyVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

void *_s20HandleIntentStrategyVwca(void *a1, void *a2)
{
  return a1;
}

void *sub_47FC(void *result, void *a2)
{
  if (result != a2)
  {
    __int128 v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v11);
        *__int128 v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 _s20HandleIntentStrategyVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s20HandleIntentStrategyVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t _s20HandleIntentStrategyVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa()
{
  return &_s20HandleIntentStrategyVN;
}

uint64_t sub_4A48()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_18E20);
  sub_3E10(v0, (uint64_t)qword_18E20);
  return static SiriTimeLog.clockFlow.getter();
}

uint64_t sub_4A90(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for SiriKitIntentHandler(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for SiriKitIntentExecutionBehavior(0LL);
  id v8 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentHandler());
  swift_retain(a1);
  [v8 init];
  type metadata accessor for ShowClockIntent();
  id v9 = a2;
  uint64_t v10 = sub_7740();
  SiriKitIntentHandler.init<A>(app:intentHandler:intent:)(v10);
  uint64_t v11 = static SiriKitIntentExecutionBehavior.embeddedIntentHandler(intentHandler:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

uint64_t sub_4B84(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  uint64_t v4 = type metadata accessor for OutputGenerationManifest(0LL);
  v3[23] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[24] = v5;
  v3[25] = sub_7408(v5);
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  v3[26] = sub_7408(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for NLContextUpdate(0LL);
  v3[27] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[28] = v8;
  v3[29] = sub_7408(v8);
  uint64_t v9 = type metadata accessor for DialogPhase(0LL);
  v3[30] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[31] = v10;
  v3[32] = sub_7408(v10);
  uint64_t v11 = type metadata accessor for ClockTimeSnippetModel(0LL);
  v3[33] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[34] = v12;
  v3[35] = sub_7408(v12);
  uint64_t v13 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[36] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[37] = v14;
  v3[38] = sub_7408(v14);
  uint64_t v15 = type metadata accessor for Logger(0LL);
  v3[39] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[40] = v16;
  v3[41] = sub_7408(v16);
  uint64_t v17 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[42] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[43] = v18;
  v3[44] = sub_7408(v18);
  uint64_t v19 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[45] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v3[46] = v20;
  v3[47] = sub_7418(v20);
  v3[48] = sub_742C();
  uint64_t v21 = type metadata accessor for Date(0LL);
  v3[49] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v3[50] = v22;
  v3[51] = sub_7418(v22);
  v3[52] = sub_742C();
  v3[53] = sub_742C();
  uint64_t v23 = type metadata accessor for Calendar.Component(0LL);
  v3[54] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v3[55] = v24;
  v3[56] = sub_7408(v24);
  uint64_t v25 = sub_2C70(&qword_18C88);
  v3[57] = sub_7408(*(void *)(v25 - 8));
  uint64_t v26 = sub_2C70(&qword_18C90);
  v3[58] = sub_7408(*(void *)(v26 - 8));
  uint64_t v27 = type metadata accessor for DateComponents(0LL);
  v3[59] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v3[60] = v28;
  v3[61] = sub_7418(v28);
  v3[62] = sub_742C();
  v3[63] = sub_742C();
  uint64_t v29 = type metadata accessor for Calendar(0LL);
  v3[64] = v29;
  uint64_t v30 = *(void *)(v29 - 8);
  v3[65] = v30;
  v3[66] = sub_7418(v30);
  v3[67] = sub_742C();
  v3[68] = sub_742C();
  uint64_t v31 = sub_2C70(&qword_18CA0);
  v3[69] = sub_7418(*(void *)(v31 - 8));
  v3[70] = sub_742C();
  v3[71] = sub_742C();
  v3[72] = sub_742C();
  v3[73] = sub_742C();
  v3[74] = sub_742C();
  uint64_t v32 = sub_2C70(&qword_18C98);
  v3[75] = v32;
  v3[76] = sub_7418(*(void *)(v32 - 8));
  v3[77] = sub_742C();
  sub_75EC();
  return sub_7490();
}

void sub_4DE4()
{
  if (qword_18BB0 != -1) {
    swift_once(&qword_18BB0, sub_4A48);
  }
  v139 = v0 + 19;
  uint64_t v1 = (os_log_s *)sub_3E10(v0[39], (uint64_t)qword_18E20);
  v0[78] = v1;
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (_WORD *)sub_75DC(2LL);
    *uint64_t v4 = 0;
    sub_75F8(&dword_0, v2, v5, "ShowClock.HandleIntentStrategy.makeIntentHandledResponse() called.");
    sub_4200((uint64_t)v4);
  }

  uint64_t v6 = sub_2C70(&qword_18E98);
  v149 = (void *)IntentResolutionRecord.intent.getter();
  v0[79] = v149;
  uint64_t v7 = (void *)IntentResolutionRecord.intentResponse.getter(v6);
  v0[80] = v7;
  id v8 = v7;
  uint64_t v9 = v1;
  Logger.logObject.getter(v8);
  os_log_type_t v10 = sub_7738();
  v150 = v1;
  if (os_log_type_enabled(v1, v10))
  {
    uint64_t v11 = (uint8_t *)sub_75DC(12LL);
    uint64_t v12 = sub_75DC(32LL);
    v152[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    id v13 = sub_771C();
    if (v13)
    {
      uint64_t v14 = v13;
      static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v15 = 1LL;
    }

    sub_3E28(v0[77], v15, 1LL, v0[59]);
    uint64_t v16 = sub_7740();
    uint64_t v18 = String.init<A>(describing:)(v16, v17);
    unint64_t v20 = v19;
    v0[19] = sub_E8EC(v18, v19, v152);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v139, v0 + 20, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v20);

    _os_log_impl(&dword_0, v9, v10, "DateTime: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    sub_4200(v12);
    sub_4200((uint64_t)v11);
  }

  else
  {
  }

  ((void (*)(void))static Calendar.current.getter)();
  id v21 = sub_771C();
  uint64_t v24 = v0[76];
  v138 = v8;
  if (v21)
  {
    uint64_t v25 = v21;
    uint64_t v26 = v0[62];
    uint64_t v28 = v0[59];
    uint64_t v27 = v0[60];
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
    v29(v24, v26, v28);
    sub_3E28(v24, 0LL, 1LL, v28);
    if (sub_3E34(v24, 1LL, v28) != 1)
    {
      v29(v0[63], v0[76], v0[59]);
      goto LABEL_16;
    }
  }

  else
  {
    sub_7660(v24, v22, v23, v0[59]);
  }

  uint64_t v33 = v0[57];
  uint64_t v32 = v0[58];
  sub_7660(v32, v30, v31, v0[64]);
  uint64_t v34 = type metadata accessor for TimeZone(0LL);
  sub_7660(v33, v35, v36, v34);
  char v137 = 1;
  uint64_t v136 = 0LL;
  char v135 = 1;
  uint64_t v134 = 0LL;
  char v133 = 1;
  uint64_t v132 = 0LL;
  char v131 = 1;
  uint64_t v130 = 0LL;
  char v129 = 1;
  uint64_t v128 = 0LL;
  char v127 = 1;
  uint64_t v126 = 0LL;
  char v125 = 1;
  uint64_t v124 = 0LL;
  uint64_t v37 = DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v32,  v33,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL);
  sub_76E0(v37, &qword_18C98);
LABEL_16:
  uint64_t v38 = v0[73];
  uint64_t v39 = v0[68];
  uint64_t v40 = v0[65];
  uint64_t v42 = v0[63];
  uint64_t v41 = v0[64];
  uint64_t v44 = v0[59];
  uint64_t v43 = v0[60];
  uint64_t v45 = v0[55];
  uint64_t v143 = v0[56];
  uint64_t v146 = v0[49];
  Calendar.date(from:)(v42);
  v148 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v148(v42, v44);
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  static Calendar.current.getter(v46);
  uint64_t v47 = v143;
  unsigned int v144 = enum case for Calendar.Component.weekOfYear(_:);
  v140 = *(void (**)(uint64_t))(v45 + 104);
  v140(v47);
  uint64_t v48 = sub_7740();
  sub_70F4(v48, v49);
  int v50 = sub_3E34(v38, 1LL, v146);
  uint64_t v51 = v0[53];
  if (v50 == 1)
  {
    uint64_t v52 = Date.init()(v51);
    sub_76E0(v52, &qword_18CA0);
  }

  else
  {
    sub_76B0(v51);
  }

  uint64_t v141 = v0[71];
  uint64_t v142 = v0[74];
  uint64_t v54 = v0[55];
  uint64_t v53 = v0[56];
  uint64_t v55 = v0[53];
  uint64_t v56 = v0[54];
  uint64_t v58 = v0[49];
  uint64_t v57 = v0[50];
  Calendar.component(_:from:)(v53, v55);
  os_log_type_t v59 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
  v0[81] = v59;
  v147 = v59;
  v59(v55, v58);
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v56);
  uint64_t v60 = sub_76D0();
  static Calendar.current.getter(v60);
  uint64_t v61 = sub_2C70(&qword_18CA8);
  uint64_t v62 = *(void *)(v54 + 72);
  uint64_t v63 = *(unsigned __int8 *)(v54 + 80);
  uint64_t v64 = (v63 + 32) & ~v63;
  uint64_t v65 = swift_allocObject(v61, v64 + 3 * v62, v63 | 7);
  *(_OWORD *)(v65 + 16) = xmmword_10AC0;
  uint64_t v66 = v65 + v64;
  ((void (*)(uint64_t, void, uint64_t))v140)(v66, enum case for Calendar.Component.calendar(_:), v56);
  ((void (*)(uint64_t, void, uint64_t))v140)( v66 + v62,  enum case for Calendar.Component.yearForWeekOfYear(_:),  v56);
  ((void (*)(uint64_t, void, uint64_t))v140)(v66 + 2 * v62, v144, v56);
  uint64_t v67 = sub_3E7C(v65);
  sub_70F4(v142, v141);
  int v68 = sub_3E34(v141, 1LL, v58);
  uint64_t v69 = v0[52];
  if (v68 == 1)
  {
    uint64_t v70 = Date.init()(v69);
    sub_76E0(v70, &qword_18CA0);
  }

  else
  {
    sub_76B0(v69);
  }

  uint64_t v145 = v0[74];
  uint64_t v71 = v0[70];
  uint64_t v72 = v0[61];
  uint64_t v73 = v0[59];
  uint64_t v74 = v0[52];
  uint64_t v75 = v0[49];
  Calendar.dateComponents(_:from:)(v67, v74);
  swift_bridgeObjectRelease(v67);
  v147(v74, v75);
  uint64_t v76 = sub_76D0();
  DateComponents.date.getter(v76);
  v148(v72, v73);
  uint64_t v77 = type metadata accessor for DialogCalendar.Builder(0LL);
  uint64_t v78 = swift_allocObject(v77, *(unsigned int *)(v77 + 48), *(unsigned __int16 *)(v77 + 52));
  uint64_t v86 = DialogCalendar.Builder.init()( v78,  v79,  v80,  v81,  v82,  v83,  v84,  v85,  v124,  v125,  v126,  v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v136,  v137);
  sub_70F4(v145, v71);
  uint64_t v87 = sub_3E34(v71, 1LL, v75);
  int v88 = v87;
  uint64_t v89 = v0[70];
  if ((_DWORD)v87 == 1)
  {
    sub_76E0(v87, &qword_18CA0);
    double v90 = 0.0;
  }

  else
  {
    uint64_t v91 = v0[49];
    double v92 = Date.timeIntervalSince1970.getter();
    v147(v89, v91);
    double v90 = v92;
  }

  v93 = (os_log_s *)dispatch thunk of DialogCalendar.Builder.withSecs(_:)(*(void *)&v90, v88 == 1);
  uint64_t v94 = swift_release(v86);
  uint64_t v151 = dispatch thunk of DialogCalendar.Builder.build()(v94);
  v0[82] = v151;
  sub_7730();
  sub_7728();
  os_log_type_t v95 = sub_7738();
  if (os_log_type_enabled(v93, v95))
  {
    v96 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)v96 = 0;
    _os_log_impl(&dword_0, v93, v95, "Hitting RF path for ShowClock flow.", v96, 2u);
    sub_4200((uint64_t)v96);
  }

  uint64_t v97 = v0[48];
  uint64_t v99 = v0[43];
  uint64_t v98 = v0[44];
  uint64_t v101 = v0[41];
  uint64_t v100 = v0[42];
  uint64_t v102 = v0[39];
  uint64_t v103 = v0[40];

  uint64_t v104 = enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:);
  v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 104);
  v0[83] = v105;
  v105(v98, v104, v100);
  v106 = *(void (**)(uint64_t, os_log_s *, uint64_t))(v103 + 16);
  v0[84] = v106;
  v106(v101, v150, v102);
  mach_absolute_time();
  uint64_t v107 = sub_7740();
  SiriTimeMeasurement.init(_:log:startTime:)(v107, v108, v109);
  v110._countAndFlagsBits = sub_713C(v149);
  if (v110._object)
  {
    v111 = (char *)&loc_5558 + dword_5AC4[sub_A1A4(v110)];
    __asm { BR              X10 }
  }

  id v112 = v149;
  v113 = (os_log_s *)sub_7728();
  os_log_type_t v114 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v113, v114))
  {
    v115 = (uint8_t *)sub_75DC(12LL);
    uint64_t v116 = sub_75DC(32LL);
    v152[0] = v116;
    *(_DWORD *)v115 = 136315138;
    v0[16] = sub_713C(v112);
    v0[17] = v117;
    uint64_t v118 = sub_2C70(&qword_18EB0);
    uint64_t v119 = String.init<A>(describing:)(v0 + 16, v118);
    uint64_t v97 = v120;
    v0[18] = sub_E8EC(v119, v120, v152);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 18, v139, v115 + 4, v115 + 12);
    swift_bridgeObjectRelease(v97);

    _os_log_impl( &dword_0,  v113,  v114,  "ShowClock.HandleIntentStrategy fail to parse clockRequestType from %s",  v115,  0xCu);
    swift_arrayDestroy(v116, 1LL, (char *)&type metadata for Any + 8);
    sub_4200(v116);
    sub_4200((uint64_t)v115);
  }

  else
  {
  }

  sub_2C70(&qword_18EA0);
  unint64_t v121 = sub_719C();
  sub_764C(v121);
  swift_willThrow();
  swift_release(v151);

  uint64_t v122 = v0[74];
  sub_7684();
  (*(void (**)(void, void))(v0[46] + 8LL))(v0[48], v0[45]);
  sub_3E40(v122, &qword_18CA0);
  sub_3E40(v97, &qword_18CA0);
  sub_74D4();
  sub_75E4();
  sub_7768();
  sub_74C4();
  sub_7488();
  sub_74CC();
  sub_7518();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_74DC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_75D4();
  sub_7510();
  sub_7450();
  __asm { BR              X0 }

uint64_t sub_5AD4()
{
  v0[86] = v2;
  v0[87] = v1;
  swift_task_dealloc();
  swift_release(v0[82]);
  sub_75EC();
  return sub_749C();
}

uint64_t sub_5B38()
{
  uint64_t v1 = *(void *)(v0 + 552);
  uint64_t v2 = *(void *)(v0 + 392);
  sub_70F4(*(void *)(v0 + 592), v1);
  if (sub_3E34(v1, 1LL, v2) == 1)
  {
    uint64_t v3 = sub_3E40(*(void *)(v0 + 552), &qword_18CA0);
    uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (sub_76F0(v5))
    {
      uint64_t v6 = (_WORD *)sub_75DC(2LL);
      _WORD *v6 = 0;
      sub_75F8(&dword_0, v4, v7, "Can NOT retrieve Date for showTime response.");
      sub_4200((uint64_t)v6);
    }

    id v8 = *(void **)(v0 + 688);
    uint64_t v9 = *(void *)(v0 + 656);
    os_log_type_t v10 = *(void **)(v0 + 640);
    uint64_t v11 = *(void **)(v0 + 632);

    sub_2C70(&qword_18EA0);
    unint64_t v12 = sub_719C();
    sub_764C(v12);
    swift_willThrow();

    swift_release(v9);
    uint64_t v13 = *(void *)(v0 + 592);
    sub_7684();
    uint64_t v154 = v15;
    uint64_t v171 = v14;
    uint64_t v188 = *(void *)(v0 + 536);
    uint64_t v204 = *(void *)(v0 + 528);
    uint64_t v219 = *(void *)(v0 + 504);
    uint64_t v233 = *(void *)(v0 + 496);
    uint64_t v246 = *(void *)(v0 + 488);
    uint64_t v258 = *(void *)(v0 + 464);
    uint64_t v269 = *(void *)(v0 + 456);
    uint64_t v279 = *(void *)(v0 + 448);
    uint64_t v288 = *(void *)(v0 + 424);
    uint64_t v296 = *(void *)(v0 + 416);
    uint64_t v303 = *(void *)(v0 + 408);
    uint64_t v309 = *(void *)(v0 + 376);
    uint64_t v314 = *(void *)(v0 + 352);
    uint64_t v318 = *(void *)(v0 + 328);
    uint64_t v321 = *(void *)(v0 + 304);
    uint64_t v323 = *(void *)(v0 + 280);
    (*(void (**)(void, void))(*(void *)(v0 + 368) + 8LL))(*(void *)(v0 + 384), *(void *)(v0 + 360));
    sub_7470(v13);
    sub_7470(v9);
    sub_74D4();
    sub_75E4();
    sub_7530();
    sub_74C4();
    sub_7488();
    sub_74CC();
    sub_7518();
    uint64_t v16 = swift_task_dealloc();
    uint64_t v24 = sub_75B0(v16, v17, v18, v19, v20, v21, v22, v23, v154, v171);
    uint64_t v32 = sub_75A8(v24, v25, v26, v27, v28, v29, v30, v31, v155, v172, v188);
    uint64_t v40 = sub_75A0(v32, v33, v34, v35, v36, v37, v38, v39, v156, v173, v189, v204);
    uint64_t v48 = sub_7598(v40, v41, v42, v43, v44, v45, v46, v47, v157, v174, v190, v205, v219);
    uint64_t v56 = sub_7590(v48, v49, v50, v51, v52, v53, v54, v55, v158, v175, v191, v206, v220, v233);
    uint64_t v64 = sub_7588(v56, v57, v58, v59, v60, v61, v62, v63, v159, v176, v192, v207, v221, v234, v246);
    uint64_t v72 = sub_7580(v64, v65, v66, v67, v68, v69, v70, v71, v160, v177, v193, v208, v222, v235, v247, v258);
    uint64_t v80 = sub_7578(v72, v73, v74, v75, v76, v77, v78, v79, v161, v178, v194, v209, v223, v236, v248, v259, v269);
    uint64_t v88 = sub_7570(v80, v81, v82, v83, v84, v85, v86, v87, v162, v179, v195, v210, v224, v237, v249, v260, v270, v279);
    uint64_t v96 = sub_7568( v88,  v89,  v90,  v91,  v92,  v93,  v94,  v95,  v163,  v180,  v196,  v211,  v225,  v238,  v250,  v261,  v271,  v280,  v288);
    uint64_t v104 = sub_7560( v96,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  v164,  v181,  v197,  v212,  v226,  v239,  v251,  v262,  v272,  v281,  v289,  v296);
    sub_7558( v104,  v105,  v106,  v107,  v108,  v109,  v110,  v111,  v165,  v182,  v198,  v213,  v227,  v240,  v252,  v263,  v273,  v282,  v290,  v297,  v303);
    uint64_t v112 = sub_74DC();
    uint64_t v120 = sub_7550( v112,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  v166,  v183,  v199,  v214,  v228,  v241,  v253,  v264,  v274,  v283,  v291,  v298,  v304,  v309);
    uint64_t v128 = sub_7548( v120,  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v167,  v184,  v200,  v215,  v229,  v242,  v254,  v265,  v275,  v284,  v292,  v299,  v305,  v310,  v314);
    uint64_t v136 = sub_7540( v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v168,  v185,  v201,  v216,  v230,  v243,  v255,  v266,  v276,  v285,  v293,  v300,  v306,  v311,  v315,  v318);
    uint64_t v144 = sub_7538( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v169,  v186,  v202,  v217,  v231,  v244,  v256,  v267,  v277,  v286,  v294,  v301,  v307,  v312,  v316,  v319,  v321);
    sub_7608( v144,  v145,  v146,  v147,  v148,  v149,  v150,  v151,  v170,  v187,  v203,  v218,  v232,  v245,  v257,  v268,  v278,  v287,  v295,  v302,  v308,  v313,  v317,  v320,  v322,  v323);
    sub_75D4();
    sub_7528();
    sub_7510();
    sub_7520();
    return sub_7344(*(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 400) + 32LL))( *(void *)(v0 + 408),  *(void *)(v0 + 552),  *(void *)(v0 + 392));
    v153 = (void *)swift_task_alloc(dword_190E4);
    *(void *)(v0 + 704) = v153;
    void *v153 = v0;
    v153[1] = sub_5DC4;
    return sub_9688(*(void *)(v0 + 280), *(void *)(v0 + 408), *(void *)(v0 + 656));
  }

uint64_t sub_5DC4()
{
  *uint64_t v2 = *v1;
  *(void *)(v3 + 712) = v0;
  swift_task_dealloc();
  sub_75EC();
  return sub_7490();
}

uint64_t sub_5E14()
{
  uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t))v0[84];
  uint64_t v14 = (void (*)(uint64_t, void, uint64_t))v0[83];
  uint64_t v15 = v0[78];
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[34];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[33];
  uint64_t v8 = static DialogPhase.completion.getter();
  NLContextUpdate.init()(v8);
  uint64_t v9 = type metadata accessor for SiriClockSnippetModels(0LL);
  v0[5] = v9;
  v0[6] = sub_7238();
  os_log_type_t v10 = sub_46C4(v0 + 2);
  (*(void (**)(void *, uint64_t, uint64_t))(v5 + 16))(v10, v6, v7);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104LL))( v10,  enum case for SiriClockSnippetModels.timeView(_:),  v9);
  v14(v1, enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:), v3);
  v16(v2, v15, v4);
  uint64_t v11 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v1, v2, v11);
  unint64_t v12 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
  v0[90] = v12;
  *unint64_t v12 = v0;
  v12[1] = sub_5F84;
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v0[20],  v0[32],  v0[29],  v0 + 2,  v0[47],  0LL,  0LL,  0LL);
}

uint64_t sub_5F84()
{
  uint64_t v1 = *v0;
  uint64_t v3 = *(void *)(*v0 + 368);
  uint64_t v2 = *(void *)(*v0 + 376);
  uint64_t v4 = *(void *)(*v0 + 360);
  uint64_t v5 = *(void *)(*v0 + 248);
  uint64_t v15 = *(void *)(*v0 + 256);
  uint64_t v16 = *v0 + 16;
  uint64_t v7 = *(void *)(*v0 + 232);
  uint64_t v6 = *(void *)(*v0 + 240);
  uint64_t v9 = *(void *)(*v0 + 216);
  uint64_t v8 = *(void *)(*v0 + 224);
  sub_7700(*(void *)(*v0 + 720));
  os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 728) = v10;
  v10(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v15, v6);
  sub_3E40(v16, &qword_18EC0);
  sub_75EC();
  return swift_task_switch(v11, v12, v13);
}

uint64_t sub_6048()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 648);
  uint64_t v2 = *(void **)(v0 + 640);
  uint64_t v3 = *(void **)(v0 + 632);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 264);

  sub_7730();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v1(v4, v5);
  sub_7360(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 728));
  sub_76E8(v6);
  sub_76E8(v7);
  sub_7488();
  sub_74DC();
  sub_74C4();
  sub_74D4();
  sub_74CC();
  sub_7518();
  uint64_t v9 = sub_7768();
  uint64_t v17 = sub_75B0(v9, v10, v11, v12, v13, v14, v15, v16, v138, v154);
  uint64_t v25 = sub_75A8(v17, v18, v19, v20, v21, v22, v23, v24, v139, v155, v170);
  uint64_t v33 = sub_75A0(v25, v26, v27, v28, v29, v30, v31, v32, v140, v156, v171, v185);
  uint64_t v41 = sub_7598(v33, v34, v35, v36, v37, v38, v39, v40, v141, v157, v172, v186, v199);
  uint64_t v49 = sub_7590(v41, v42, v43, v44, v45, v46, v47, v48, v142, v158, v173, v187, v200, v212);
  uint64_t v57 = sub_7588(v49, v50, v51, v52, v53, v54, v55, v56, v143, v159, v174, v188, v201, v213, v224);
  uint64_t v65 = sub_7580(v57, v58, v59, v60, v61, v62, v63, v64, v144, v160, v175, v189, v202, v214, v225, v235);
  uint64_t v73 = sub_7578(v65, v66, v67, v68, v69, v70, v71, v72, v145, v161, v176, v190, v203, v215, v226, v236, v245);
  uint64_t v81 = sub_7570(v73, v74, v75, v76, v77, v78, v79, v80, v146, v162, v177, v191, v204, v216, v227, v237, v246, v254);
  uint64_t v89 = sub_7568( v81,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  v147,  v163,  v178,  v192,  v205,  v217,  v228,  v238,  v247,  v255,  v262);
  uint64_t v97 = sub_7560( v89,  v90,  v91,  v92,  v93,  v94,  v95,  v96,  v148,  v164,  v179,  v193,  v206,  v218,  v229,  v239,  v248,  v256,  v263,  v269);
  uint64_t v105 = sub_7558( v97,  v98,  v99,  v100,  v101,  v102,  v103,  v104,  v149,  v165,  v180,  v194,  v207,  v219,  v230,  v240,  v249,  v257,  v264,  v270,  v275);
  sub_7550( v105,  v106,  v107,  v108,  v109,  v110,  v111,  v112,  v150,  v166,  v181,  v195,  v208,  v220,  v231,  v241,  v250,  v258,  v265,  v271,  v276,  v280);
  uint64_t v113 = sub_7530();
  uint64_t v121 = sub_7548( v113,  v114,  v115,  v116,  v117,  v118,  v119,  v120,  v151,  v167,  v182,  v196,  v209,  v221,  v232,  v242,  v251,  v259,  v266,  v272,  v277,  v281,  v284);
  uint64_t v129 = sub_7540( v121,  v122,  v123,  v124,  v125,  v126,  v127,  v128,  v152,  v168,  v183,  v197,  v210,  v222,  v233,  v243,  v252,  v260,  v267,  v273,  v278,  v282,  v285,  v287);
  sub_7538( v129,  v130,  v131,  v132,  v133,  v134,  v135,  v136,  v153,  v169,  v184,  v198,  v211,  v223,  v234,  v244,  v253,  v261,  v268,  v274,  v279,  v283,  v286,  v288,  v289);
  sub_7528();
  sub_7510();
  sub_7520();
  sub_75CC();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_74A8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_616C(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v5 = v3;
  v3[7] = v2;
  v3[8] = a1;
  v3[9] = v1;
  sub_7770(&v5);
  v3[95] = v1;
  swift_task_dealloc();
  swift_release(v3[92]);
  sub_7488();
  sub_75EC();
  return sub_7630();
}

uint64_t sub_61DC()
{
  uint64_t v0 = sub_75B8();
  sub_7620(v0, (uint64_t)ShowClockIntentResponseCode.rawValue.getter);
  sub_74F4(v1);
  return sub_7478();
}

uint64_t sub_6230(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v5 = v3;
  v3[10] = v2;
  v3[11] = a1;
  v3[12] = v1;
  sub_7770(&v5);
  v3[99] = v1;
  swift_task_dealloc();
  swift_release(v3[96]);
  sub_7488();
  sub_75EC();
  return sub_7630();
}

uint64_t sub_62A0()
{
  uint64_t v0 = sub_75B8();
  sub_7620(v0, (uint64_t)ShowClockIntentResponseCode.rawValue.getter);
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  sub_74F4(v1);
  return sub_7478();
}

uint64_t sub_62F4()
{
  v0[13] = v2;
  v0[14] = v3;
  v0[15] = v1;
  sub_7770(v4);
  v0[102] = v1;
  swift_task_dealloc();
  swift_release(v0[100]);
  sub_75EC();
  return sub_749C();
}

uint64_t sub_6350()
{
  uint64_t v0 = sub_75B8();
  sub_7620(v0, (uint64_t)ShowClockIntentResponseCode.rawValue.getter);
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  sub_74F4(v1);
  return sub_7478();
}

uint64_t sub_63A4()
{
  v0[105] = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v0[24] + 8LL))(v0[25], v0[23]);
  sub_75EC();
  return sub_749C();
}

uint64_t sub_6400()
{
  uint64_t v5 = sub_774C();
  uint64_t v6 = *(void *)(v3 + 368);
  swift_release(v5);

  sub_7360(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  sub_76E8(v6);
  sub_76E8(v4);
  sub_7488();
  sub_74DC();
  sub_74C4();
  sub_74D4();
  sub_74CC();
  sub_7518();
  uint64_t v7 = sub_7768();
  uint64_t v15 = sub_75B0(v7, v8, v9, v10, v11, v12, v13, v14, v136, v152);
  uint64_t v23 = sub_75A8(v15, v16, v17, v18, v19, v20, v21, v22, v137, v153, v168);
  uint64_t v31 = sub_75A0(v23, v24, v25, v26, v27, v28, v29, v30, v138, v154, v169, v183);
  uint64_t v39 = sub_7598(v31, v32, v33, v34, v35, v36, v37, v38, v139, v155, v170, v184, v197);
  uint64_t v47 = sub_7590(v39, v40, v41, v42, v43, v44, v45, v46, v140, v156, v171, v185, v198, v210);
  uint64_t v55 = sub_7588(v47, v48, v49, v50, v51, v52, v53, v54, v141, v157, v172, v186, v199, v211, v222);
  uint64_t v63 = sub_7580(v55, v56, v57, v58, v59, v60, v61, v62, v142, v158, v173, v187, v200, v212, v223, v233);
  uint64_t v71 = sub_7578(v63, v64, v65, v66, v67, v68, v69, v70, v143, v159, v174, v188, v201, v213, v224, v234, v243);
  uint64_t v79 = sub_7570(v71, v72, v73, v74, v75, v76, v77, v78, v144, v160, v175, v189, v202, v214, v225, v235, v244, v252);
  uint64_t v87 = sub_7568( v79,  v80,  v81,  v82,  v83,  v84,  v85,  v86,  v145,  v161,  v176,  v190,  v203,  v215,  v226,  v236,  v245,  v253,  v260);
  uint64_t v95 = sub_7560( v87,  v88,  v89,  v90,  v91,  v92,  v93,  v94,  v146,  v162,  v177,  v191,  v204,  v216,  v227,  v237,  v246,  v254,  v261,  v267);
  uint64_t v103 = sub_7558( v95,  v96,  v97,  v98,  v99,  v100,  v101,  v102,  v147,  v163,  v178,  v192,  v205,  v217,  v228,  v238,  v247,  v255,  v262,  v268,  v273);
  sub_7550( v103,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  v148,  v164,  v179,  v193,  v206,  v218,  v229,  v239,  v248,  v256,  v263,  v269,  v274,  v278);
  uint64_t v111 = sub_7530();
  uint64_t v119 = sub_7548( v111,  v112,  v113,  v114,  v115,  v116,  v117,  v118,  v149,  v165,  v180,  v194,  v207,  v219,  v230,  v240,  v249,  v257,  v264,  v270,  v275,  v279,  v282);
  uint64_t v127 = sub_7540( v119,  v120,  v121,  v122,  v123,  v124,  v125,  v126,  v150,  v166,  v181,  v195,  v208,  v220,  v231,  v241,  v250,  v258,  v265,  v271,  v276,  v280,  v283,  v285);
  sub_7538( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v151,  v167,  v182,  v196,  v209,  v221,  v232,  v242,  v251,  v259,  v266,  v272,  v277,  v281,  v284,  v286,  v287);
  sub_7528();
  sub_7510();
  sub_7520();
  sub_75CC();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_74A8(*(uint64_t (**)(void))(v3 + 8));
}

#error "654C: call analysis failed (funcsize=49)"
#error "6640: call analysis failed (funcsize=60)"
#error "6708: call analysis failed (funcsize=49)"
#error "67D0: call analysis failed (funcsize=49)"
#error "6898: call analysis failed (funcsize=49)"
#error "6968: call analysis failed (funcsize=51)"
uint64_t sub_69D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v4 = *(int *)(type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0LL) + 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4);
  swift_retain(a2);
  swift_release(v5);
  *(uint64_t *)((char *)a1 + v4) = a2;
  type metadata accessor for SirikitApp(0LL);
  uint64_t v6 = sub_2C70(&qword_18E98);
  uint64_t v7 = IntentResolutionRecord.app.getter(v6);
  uint64_t v8 = SirikitApp.init(app:)(v7);
  __n128 result = swift_release(*a1);
  *a1 = v8;
  return result;
}

uint64_t sub_6A5C(double *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_2C70(&qword_18CA0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  double v12 = *a1;
  swift_retain(a2);
  swift_release(*(void *)&v12);
  *(void *)a1 = a2;
  a1[2] = (double)a3;
  *((_WORD *)a1 + 12) = 0;
  uint64_t v13 = type metadata accessor for DialogCalendar.Builder(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = DialogCalendar.Builder.init()();
  sub_70F4(a5, (uint64_t)v11);
  uint64_t v15 = type metadata accessor for Date(0LL);
  int v16 = sub_3E34((uint64_t)v11, 1LL, v15);
  if (v16 == 1)
  {
    sub_3E40((uint64_t)v11, &qword_18CA0);
    double v17 = 0.0;
  }

  else
  {
    double v18 = Date.timeIntervalSince1970.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8LL))(v11, v15);
    double v17 = v18;
  }

  uint64_t v19 = dispatch thunk of DialogCalendar.Builder.withSecs(_:)(*(void *)&v17, v16 == 1);
  uint64_t v20 = swift_release(v14);
  uint64_t v21 = dispatch thunk of DialogCalendar.Builder.build()(v20);
  swift_release(v19);
  uint64_t result = swift_release(*((void *)a1 + 1));
  *((void *)a1 + 1) = v21;
  return result;
}

uint64_t sub_6BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_18E8C);
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_6C24;
  return sub_4B84(a1, a2);
}

uint64_t sub_6C24()
{
  uint64_t v2 = *v1;
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_7640(*(uint64_t (**)(void))(v2 + 8));
  }
  sub_75EC();
  return sub_7490();
}

uint64_t sub_6C74()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_2C70(&qword_18E90);
  uint64_t v3 = static BarbaraWalters.logAndReturnError<A>(context:_:)( 0xD00000000000005BLL,  0x80000000000111D0LL,  v0 + 24,  v2,  &protocol self-conformance witness table for Error);
  swift_willThrow(v3);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makePromptForDeviceUnlock(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7288;
  return HandleIntentFlowStrategyAsync.makePromptForDeviceUnlock(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_6D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makeHandoffForAuthenticationResponse(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7288;
  return HandleIntentFlowStrategyAsync.makeHandoffForAuthenticationResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_6E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makePreHandleIntentOutput(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7288;
  return HandleIntentFlowStrategyAsync.makePreHandleIntentOutput(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_6E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_18E84);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_7288;
  return sub_6BC4(a1, a2);
}

uint64_t sub_6EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makeContinueInAppResponse(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7288;
  return HandleIntentFlowStrategyAsync.makeContinueInAppResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_6F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makeInProgressResponse(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7288;
  return HandleIntentFlowStrategyAsync.makeInProgressResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_6FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makeFailureHandlingIntentResponse(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_7050;
  return HandleIntentFlowStrategyAsync.makeFailureHandlingIntentResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_7050()
{
  return sub_7640(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_707C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_4A90(a1, a2);
  return sub_7278(*(uint64_t (**)(uint64_t))(v2 + 8), v2, v3);
}

unint64_t sub_70B4()
{
  unint64_t result = qword_18E40[0];
  if (!qword_18E40[0])
  {
    unint64_t result = swift_getWitnessTable("QB", &_s20HandleIntentStrategyVN);
    atomic_store(result, qword_18E40);
  }

  return result;
}

uint64_t sub_70F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2C70(&qword_18CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_713C(void *a1)
{
  id v1 = [a1 clockRequestType];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t sub_719C()
{
  unint64_t result = qword_18EA8;
  if (!qword_18EA8)
  {
    uint64_t v1 = sub_71E0(&qword_18EA0);
    unint64_t result = swift_getWitnessTable(&unk_10E98, v1);
    atomic_store(result, (unint64_t *)&qword_18EA8);
  }

  return result;
}

uint64_t sub_71E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_7224(double *a1)
{
  return sub_6A5C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_7230(uint64_t *a1)
{
  return sub_69D0(a1, *(void *)(v1 + 16));
}

unint64_t sub_7238()
{
  unint64_t result = qword_18EB8;
  if (!qword_18EB8)
  {
    uint64_t v1 = type metadata accessor for SiriClockSnippetModels(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriClockSnippetModels, v1);
    atomic_store(result, (unint64_t *)&qword_18EB8);
  }

  return result;
}

uint64_t sub_7278(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_728C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 88) = a1;
  uint64_t v3 = v1[48];
  uint64_t v4 = v1[45];
  uint64_t v5 = v1[46];
  uint64_t v6 = v1[32];
  *(void *)(v2 - 128) = v1[35];
  *(void *)(v2 - 120) = v6;
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v8 = v1[26];
  *(void *)(v2 - 112) = v1[29];
  *(void *)(v2 - 104) = v8;
  *(void *)(v2 - 96) = v1[25];
  return v7(v3, v4);
}

uint64_t sub_7344(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_7360@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v3 = v1[48];
  uint64_t v4 = v1[45];
  uint64_t v5 = v1[35];
  *(void *)(v2 - 120) = v1[38];
  *(void *)(v2 - 112) = v5;
  uint64_t v6 = v1[29];
  *(void *)(v2 - 104) = v1[32];
  *(void *)(v2 - 96) = v6;
  uint64_t v7 = v1[25];
  *(void *)(v2 - 88) = v1[26];
  *(void *)(v2 - 80) = v7;
  return a1(v3, v4);
}

uint64_t sub_7408@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_7418@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_742C()
{
  return swift_task_alloc(v0);
}

  ;
}

  ;
}

uint64_t sub_7470(uint64_t a1)
{
  return sub_3E40(a1, v1);
}

uint64_t sub_7478()
{
  return ((uint64_t (*)(void))PatternExecutionResult.generatePatternOutput(manifest:measure:))();
}

uint64_t sub_7488()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_7490()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_749C()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_74A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_74C4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_74CC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_74D4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_74DC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_74E4()
{
  return swift_release(*(void *)(v0 + 656));
}

uint64_t sub_74F4(void *a1)
{
  *(void *)(v2 + 832) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 160);
}

uint64_t sub_7510()
{
  return swift_task_dealloc(*(void *)(v0 - 112));
}

uint64_t sub_7518()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_7520()
{
  return swift_task_dealloc(*(void *)(v0 - 104));
}

uint64_t sub_7528()
{
  return swift_task_dealloc(*(void *)(v0 - 120));
}

uint64_t sub_7530()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_7538( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  return swift_task_dealloc(a25);
}

uint64_t sub_7540( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  return swift_task_dealloc(a24);
}

uint64_t sub_7548( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  return swift_task_dealloc(a23);
}

uint64_t sub_7550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  return swift_task_dealloc(a22);
}

uint64_t sub_7558( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return swift_task_dealloc(a21);
}

uint64_t sub_7560( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return swift_task_dealloc(a20);
}

uint64_t sub_7568( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return swift_task_dealloc(a19);
}

uint64_t sub_7570( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return swift_task_dealloc(a18);
}

uint64_t sub_7578( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_task_dealloc(a17);
}

uint64_t sub_7580( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return swift_task_dealloc(a16);
}

uint64_t sub_7588( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return swift_task_dealloc(a15);
}

uint64_t sub_7590( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return swift_task_dealloc(a14);
}

uint64_t sub_7598( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return swift_task_dealloc(a13);
}

uint64_t sub_75A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return swift_task_dealloc(a12);
}

uint64_t sub_75A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return swift_task_dealloc(a11);
}

uint64_t sub_75B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_task_dealloc(a10);
}

uint64_t sub_75B8()
{
  *(void *)(v1 + 824) = v0;
  return static DialogPhase.completion.getter();
}

uint64_t sub_75CC()
{
  return swift_task_dealloc(*(void *)(v0 - 96));
}

uint64_t sub_75D4()
{
  return swift_task_dealloc(*(void *)(v0 - 128));
}

uint64_t sub_75DC(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_75E4()
{
  return swift_task_dealloc(v0);
}

  ;
}

void sub_75F8(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_7608( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  return swift_task_dealloc(a26);
}

uint64_t sub_7610()
{
  return CATWrapper.__allocating_init(options:globals:)(v0, 0LL);
}

uint64_t sub_7620(uint64_t a1, uint64_t a2)
{
  return OutputGenerationManifest.init(dialogPhase:_:)(v2, a2, 0LL);
}

uint64_t sub_7630()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_7640(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_764C(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_7660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_3E28(a1, 1LL, 1LL, a4);
}

uint64_t sub_766C()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_7678()
{
  return static CATOption.defaultMode.getter();
}

  ;
}

void sub_76A0()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_76B0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v2 + 400) + 32LL))( a1,  v1,  *(void *)(v2 + 392));
}

void sub_76C0()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_76D0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 112))(v0, v1);
}

uint64_t sub_76E0(uint64_t a1, uint64_t *a2)
{
  return sub_3E40(v2, a2);
}

uint64_t sub_76E8(uint64_t a1)
{
  return sub_3E40(a1, v1);
}

BOOL sub_76F0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_7700(uint64_t a1)
{
  *(void *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_7710()
{
  return swift_retain(*(void *)(v0 - 112));
}

id sub_771C()
{
  return [v1 *(SEL *)(v0 + 1920)];
}

uint64_t sub_7728()
{
  return Logger.logObject.getter();
}

uint64_t sub_7730()
{
  return swift_release(v0);
}

uint64_t sub_7738()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_7740()
{
  return v0;
}

uint64_t sub_774C()
{
  return *(void *)(v0 + 656);
}

uint64_t sub_7760()
{
  return type metadata accessor for ShowClockCATPatternsExecutor(0LL);
}

uint64_t sub_7768()
{
  return swift_task_dealloc(v0);
}

void sub_7770(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_777C()
{
  uint64_t v0 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for ShowClockCATsSimple(0LL);
  static CATOption.defaultMode.getter();
  uint64_t result = CATWrapperSimple.__allocating_init(options:globals:)(v2, 0LL);
  qword_194B0 = result;
  return result;
}

uint64_t type metadata accessor for ShowClockCATPatternsExecutor(uint64_t a1)
{
  return sub_81BC(a1, (uint64_t *)&unk_18EC8, (uint64_t)&nominal type descriptor for ShowClockCATPatternsExecutor);
}

uint64_t sub_7808(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_194B8);
}

uint64_t sub_7844(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  uint64_t v8 = sub_2C70(&qword_18C68);
  uint64_t v9 = sub_8A44(v8, 224LL);
  *(_OWORD *)(v9 + 16) = xmmword_10BA0;
  *(void *)(v9 + 32) = 0x44746E6572727563LL;
  *(void *)(v9 + 40) = 0xEB00000000657461LL;
  if (a1)
  {
    uint64_t v10 = sub_8A34();
    uint64_t v11 = a1;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
    *(void *)(v9 + 56) = 0LL;
    *(void *)(v9 + 64) = 0LL;
  }

  *(void *)(v9 + 48) = v11;
  *(void *)(v9 + 72) = v10;
  strcpy((char *)(v9 + 80), "weekStartDate");
  *(_WORD *)(v9 + 94) = -4864;
  if (a2)
  {
    uint64_t v12 = sub_8A34();
    uint64_t v13 = a2;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    *(void *)(v9 + 104) = 0LL;
    *(void *)(v9 + 112) = 0LL;
  }

  *(void *)(v9 + 96) = v13;
  *(void *)(v9 + 120) = v12;
  *(void *)(v9 + 128) = 0x626D754E6B656577LL;
  *(void *)(v9 + 136) = 0xEA00000000007265LL;
  if ((a4 & 1) != 0)
  {
    a3 = 0LL;
    uint64_t v14 = 0LL;
    *(void *)(v9 + 152) = 0LL;
    *(void *)(v9 + 160) = 0LL;
  }

  else
  {
    uint64_t v14 = &type metadata for Double;
  }

  *(void *)(v9 + 144) = a3;
  uint64_t v15 = (void *)(v9 + 192);
  *(void *)(v9 + 168) = v14;
  *(void *)(v9 + 176) = 0xD000000000000011LL;
  *(void *)(v9 + 184) = 0x80000000000112A0LL;
  if ((a4 & 0xFF00) == 0x200)
  {
    int v16 = 0LL;
    *uint64_t v15 = 0LL;
    *(void *)(v9 + 200) = 0LL;
    *(void *)(v9 + 208) = 0LL;
  }

  else
  {
    *(_BYTE *)uint64_t v15 = HIBYTE(a4) & 1;
    int v16 = &type metadata for Bool;
  }

  *(void *)(v9 + 216) = v16;
  sub_8A58();
  swift_retain(a1);
  return v9;
}

uint64_t sub_79CC()
{
  uint64_t v1 = sub_2C70(&qword_18F28);
  __chkstk_darwin(v1);
  sub_2D48();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_2C70(&qword_18C68);
  uint64_t v6 = sub_8A44(v5, 176LL);
  *(_OWORD *)(v6 + 16) = xmmword_10AC0;
  *(void *)(v6 + 32) = 7368801LL;
  *(void *)(v6 + 40) = 0xE300000000000000LL;
  uint64_t v7 = *v0;
  if (*v0)
  {
    uint64_t v8 = type metadata accessor for SirikitApp(0LL);
    uint64_t v9 = v7;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    *(void *)(v6 + 56) = 0LL;
    *(void *)(v6 + 64) = 0LL;
  }

  *(void *)(v6 + 48) = v9;
  *(void *)(v6 + 72) = v8;
  *(void *)(v6 + 80) = 0x7463416B636F6C63LL;
  *(void *)(v6 + 88) = 0xEB000000006E6F69LL;
  uint64_t v10 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0LL);
  sub_8228((uint64_t)v0 + *(int *)(v10 + 20), v4, &qword_18F28);
  uint64_t v11 = type metadata accessor for SpeakableString(0LL);
  if (sub_3E34(v4, 1LL, v11) == 1)
  {
    swift_retain(v7);
    sub_3E40(v4, &qword_18F28);
    *(_OWORD *)(v6 + 96) = 0u;
    *(_OWORD *)(v6 + 112) = 0u;
  }

  else
  {
    *(void *)(v6 + 120) = v11;
    uint64_t v12 = sub_46C4((void *)(v6 + 96));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32LL))(v12, v4, v11);
    swift_retain(v7);
  }

  *(void *)(v6 + 128) = 1701669236LL;
  *(void *)(v6 + 136) = 0xE400000000000000LL;
  uint64_t v13 = *(uint64_t *)((char *)v0 + *(int *)(v10 + 24));
  if (v13)
  {
    uint64_t v14 = sub_8A34();
  }

  else
  {
    uint64_t v14 = 0LL;
    *(void *)(v6 + 152) = 0LL;
    *(void *)(v6 + 160) = 0LL;
  }

  *(void *)(v6 + 144) = v13;
  *(void *)(v6 + 168) = v14;
  sub_8A58();
  return v6;
}

uint64_t sub_7B84(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  return sub_8A14((uint64_t)sub_7B98);
}

uint64_t sub_7B98()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 48);
  *(void *)(v0 + 24) = 0LL;
  *(void *)(v0 + 32) = 0LL;
  *(void *)(v0 + 16) = 0LL;
  *(_WORD *)(v0 + 40) = 513;
  v1(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v3;
  *(void *)(v0 + 88) = sub_7844( v2,  v3,  v4,  *(unsigned __int8 *)(v0 + 40) | (unsigned __int16)(*(unsigned __int8 *)(v0 + 41) << 8));
  uint64_t v5 = (void *)sub_8A20((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 96) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_7C2C;
  unint64_t v6 = sub_89C8();
  return sub_89F4(v6, v7, v8, v9);
}

uint64_t sub_7C2C()
{
  *uint64_t v4 = *v2;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  sub_8A3C();
  if (!v1) {
    *(void *)(v3 + 112) = v0;
  }
  sub_75EC();
  return sub_89B8();
}

uint64_t sub_7C88()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release(*(void *)(v0 + 72));
  swift_release(v1);
  return sub_89E8(*(void *)(v0 + 112), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7CC0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release(*(void *)(v0 + 72));
  swift_release(v1);
  return sub_7640(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7CF4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_8A14((uint64_t)sub_7D04);
}

uint64_t sub_7D04()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_2C70(&qword_18C68);
  uint64_t v3 = sub_8A44(v2, 80LL);
  v0[4] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_109A0;
  *(void *)(v3 + 32) = 1702125924LL;
  *(void *)(v3 + 40) = 0xE400000000000000LL;
  *(void *)(v3 + 72) = sub_8A34();
  *(void *)(v3 + 48) = v1;
  sub_8A58();
  uint64_t v5 = (void *)swift_task_alloc(v4);
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_7DB4;
  unint64_t v6 = sub_89C8();
  return sub_89F4(v6, v7, v8, v9);
}

uint64_t sub_7DB4()
{
  *uint64_t v4 = *v2;
  *(void *)(v3 + 48) = v1;
  swift_task_dealloc();
  sub_8A3C();
  if (!v1) {
    *(void *)(v3 + 56) = v0;
  }
  sub_75EC();
  return sub_89B8();
}

uint64_t sub_7E10()
{
  return sub_89E8(*(void *)(v0 + 56), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7E40()
{
  return sub_7640(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7E6C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0LL);
  v3[5] = v4;
  v3[6] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  sub_75EC();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_7EC8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = (void (*)(void *))v0[2];
  *uint64_t v1 = 0LL;
  uint64_t v4 = (uint64_t)v1 + *(int *)(v2 + 20);
  uint64_t v5 = type metadata accessor for SpeakableString(0LL);
  sub_3E28(v4, 1LL, 1LL, v5);
  *(void *)((char *)v1 + *(int *)(v2 + swift_release(*(void *)(v0 + 24)) = 0LL;
  v3(v1);
  v0[7] = sub_79CC();
  uint64_t v6 = (void *)sub_8A20((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[8] = v6;
  void *v6 = v0;
  v6[1] = sub_7F78;
  unint64_t v7 = sub_89C8();
  return v8(v7);
}

uint64_t sub_7F78()
{
  *uint64_t v4 = *v2;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  sub_8A3C();
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_75EC();
  return sub_89B8();
}

uint64_t sub_7FD4()
{
  return sub_89E8(*(void *)(v0 + 80), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8008()
{
  return sub_7640(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_8088(a1, a2, a3);
}

uint64_t sub_8088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_2D48();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2C70(&qword_18C60);
  __chkstk_darwin(v11);
  sub_2D48();
  uint64_t v14 = v13 - v12;
  sub_8228(a1, v13 - v12, &qword_18C60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  uint64_t v15 = CATWrapper.init(templateDir:options:globals:)(v14, v10, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_3E40(a1, &qword_18C60);
  return v15;
}

uint64_t sub_818C()
{
  uint64_t v0 = CATWrapper.deinit();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(uint64_t a1)
{
  return sub_81BC( a1,  (uint64_t *)&unk_18F88,  (uint64_t)&nominal type descriptor for ShowClockIntentHandledResponseShowTimeParameters);
}

uint64_t sub_81BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_81EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_8228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2C70(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t *sub_826C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16LL) & ~(unint64_t)v3));
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SpeakableString(0LL);
    swift_retain(v4);
    if (sub_3E34((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_2C70(&qword_18F28);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_3E28((uint64_t)v9, 0LL, 1LL, v11);
    }

    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v4 = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)v7 + v13) = v4;
  }

  swift_retain(v4);
  return v7;
}

uint64_t sub_836C(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for SpeakableString(0LL);
  return swift_release(*(void *)((char *)a1 + *(int *)(a2 + 24)));
}

uint64_t *sub_83E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for SpeakableString(0LL);
  swift_retain(v6);
  if (sub_3E34((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_2C70(&qword_18F28);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    sub_3E28((uint64_t)v8, 0LL, 1LL, v10);
  }

  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = *(uint64_t *)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = v13;
  swift_retain(v13);
  return a1;
}

uint64_t *sub_84BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for SpeakableString(0LL);
  int v12 = sub_3E34((uint64_t)v9, 1LL, v11);
  int v13 = sub_3E34((uint64_t)v10, 1LL, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }

  if (v13)
  {
LABEL_6:
    uint64_t v15 = sub_2C70(&qword_18F28);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  sub_3E28((uint64_t)v9, 0LL, 1LL, v11);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = *(uint64_t *)((char *)a1 + v16);
  uint64_t v18 = *(uint64_t *)((char *)a2 + v16);
  *(uint64_t *)((char *)a1 + v16) = v18;
  swift_retain(v18);
  swift_release(v17);
  return a1;
}

void *sub_85F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SpeakableString(0LL);
  if (sub_3E34((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_2C70(&qword_18F28);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    sub_3E28((uint64_t)v7, 0LL, 1LL, v9);
  }

  *(void *)((char *)a1 + *(int *)(a3 + swift_release(*(void *)(v0 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t *sub_86BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for SpeakableString(0LL);
  int v11 = sub_3E34((uint64_t)v8, 1LL, v10);
  int v12 = sub_3E34((uint64_t)v9, 1LL, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }

  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_2C70(&qword_18F28);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  sub_3E28((uint64_t)v8, 0LL, 1LL, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = *(uint64_t *)((char *)a1 + v15);
  *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
  swift_release(v16);
  return a1;
}

uint64_t sub_87E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_87F0);
}

uint64_t sub_87F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }

  else
  {
    uint64_t v9 = sub_2C70(&qword_18F28);
    return sub_3E34((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }

uint64_t sub_8874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8880);
}

void *sub_8880(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }

  else
  {
    uint64_t v7 = sub_2C70(&qword_18F28);
    return (void *)sub_3E28((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

void sub_88F0(uint64_t a1)
{
  v4[0] = "\b";
  sub_8964(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    v4[2] = "\b";
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

void sub_8964(uint64_t a1)
{
  if (!qword_18F98)
  {
    uint64_t v2 = type metadata accessor for SpeakableString(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_18F98);
    }
  }

uint64_t sub_89B8()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

unint64_t sub_89C8()
{
  return 0xD000000000000027LL;
}

uint64_t sub_89E8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_89F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

void sub_8A00()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_8A14(uint64_t a1)
{
  return swift_task_switch(a1, 0LL, 0LL);
}

uint64_t sub_8A20@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc(*(unsigned int *)(a1 + 4));
}

uint64_t sub_8A34()
{
  return type metadata accessor for DialogCalendar(0LL);
}

uint64_t sub_8A3C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_8A44(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_8A4C()
{
  return sub_81EC(*(void *)(v0 + 48));
}

uint64_t sub_8A58()
{
  return swift_retain(v0);
}

uint64_t sub_8A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 16LL);
}

uint64_t _s12FlowStrategyVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_94EC(a1, a2, a3, a4, (uint64_t)&_s12FlowStrategyVMn);
}

uint64_t sub_8A74()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_18FD8);
  sub_3E10(v0, (uint64_t)qword_18FD8);
  return static SiriTimeLog.clockFlow.getter();
}

void sub_8ABC()
{
  if (qword_18BC0 != -1) {
    swift_once(&qword_18BC0, sub_8A74);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_3E10(v0, (uint64_t)qword_18FD8);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "ClockIntents.FlowStrategy.actionForInput() called.", v4, 2u);
    sub_4200((uint64_t)v4);
  }

  sub_A1EC();
}

uint64_t sub_8BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  void v4[3] = a1;
  return swift_task_switch(sub_8BBC, 0LL, 0LL);
}

uint64_t sub_8BBC()
{
  if (qword_18BC0 != -1) {
    swift_once(&qword_18BC0, sub_8A74);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_3E10(v1, (uint64_t)qword_18FD8);
  v0[6] = v2;
  os_log_type_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "ClockIntents.FlowStrategy.makeIntentFromParse() called.", v5, 2u);
    sub_4200((uint64_t)v5);
  }

  uint64_t v6 = (uint64_t **)swift_task_alloc(dword_191CC);
  v0[7] = (uint64_t)v6;
  void *v6 = v0;
  v6[1] = (uint64_t *)sub_8CB4;
  return sub_CF54(v0[3]);
}

uint64_t sub_8CB4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  swift_task_dealloc();
  if (v1) {
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else {
    return sub_7490();
  }
}

uint64_t sub_8D20(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2)
  {
    if (swift_dynamicCastUnknownClass(*(void *)(v1 + 64), *(void *)(v1 + 32))) {
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
  }

  os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v1 + 32);
    uint64_t v7 = (uint8_t *)sub_75DC(12LL);
    uint64_t v8 = sub_75DC(32LL);
    uint64_t v17 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = _typeName(_:qualified:)(v6, 0LL);
    unint64_t v11 = v10;
    *(void *)(v1 + 16) = sub_E8EC(v9, v10, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    _os_log_impl(&dword_0, v4, v5, "Intent is nil, or cannot cast converted intent to IntentType %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    sub_4200(v8);
    sub_4200((uint64_t)v7);
  }

  uint64_t v13 = type metadata accessor for ClockIntents.FlowError(0LL, *(void *)(v1 + 32), *(void *)(v1 + 40), v12);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_10E98, v13);
  swift_allocError(v13, WitnessTable, 0LL, 0LL);
  uint64_t v16 = static BarbaraWalters.logAndReturnError<A>(context:_:)( 0xD00000000000005ALL,  0x80000000000112F0LL,  v15,  v13,  WitnessTable);
  swift_willThrow(v16);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_8F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for SiriKitIntentHandler(0LL);
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return sub_7490();
}

uint64_t sub_8F64()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void **)(v0 + 24);
  type metadata accessor for SiriKitIntentExecutionBehavior(0LL);
  id v6 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentHandler());
  swift_retain(v4);
  [v6 init];
  id v7 = v5;
  SiriKitIntentHandler.init<A>(app:intentHandler:intent:)(v4);
  uint64_t v8 = static SiriKitIntentExecutionBehavior.embeddedIntentHandler(intentHandler:)(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

void sub_9030()
{
}

uint64_t sub_9038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)swift_task_alloc(dword_190B4);
  *(void *)(v3 + 16) = v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(a3 + 24);
  void *v6 = v3;
  v6[1] = sub_908C;
  return sub_8BA0(a1, v9, v7, v8);
}

uint64_t sub_908C(uint64_t a1)
{
  uint64_t v4 = sub_951C();
  if (!v1) {
    uint64_t v4 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_90C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to RCHFlowStrategyAsync.makeErrorResponse(error:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_9518;
  return RCHFlowStrategyAsync.makeErrorResponse(error:)(a1, a2, a3, a4);
}

uint64_t sub_9144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *unint64_t v11 = v5;
  v11[1] = sub_9518;
  return ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_91C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *unint64_t v11 = v5;
  v11[1] = sub_9518;
  return ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_924C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *unint64_t v11 = v5;
  v11[1] = sub_9518;
  return ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_92D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_9364;
  return ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_9364()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_9390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_9518;
  return RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t sub_9424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_190BC);
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = *(void *)(a3 + 16);
  *uint64_t v7 = v3;
  v7[1] = sub_9488;
  return sub_8F08(a1, a2, v8);
}

uint64_t sub_9488(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_94BC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10C90, a1);
}

uint64_t sub_94CC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10CC0, a1);
}

uint64_t sub_94DC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10CF8, a1);
}

uint64_t sub_94EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_951C()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_953C()
{
  uint64_t v0 = type metadata accessor for SiriTimeAppBundleId(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = (*(uint64_t (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for SiriTimeAppBundleId.clockApp(_:),  v0);
  uint64_t v5 = SiriTimeAppBundleId.rawValue.getter(v4);
  uint64_t v7 = v6;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_194C8 = v5;
  unk_194D0 = v7;
  return result;
}

uint64_t sub_95E4()
{
  if (qword_18BC8 != -1) {
    swift_once(&qword_18BC8, sub_953C);
  }
  uint64_t v0 = qword_194C8;
  uint64_t v1 = unk_194D0;
  uint64_t v2 = type metadata accessor for App(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  swift_bridgeObjectRetain(v1);
  uint64_t result = App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)( v0,  v1,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
  qword_194D8 = result;
  return result;
}

uint64_t sub_9688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  uint64_t v4 = sub_2C70(&qword_18C60);
  v3[11] = sub_7408(*(void *)(v4 - 8));
  uint64_t v5 = type metadata accessor for PunchOutApp(0LL);
  v3[12] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[13] = v6;
  v3[14] = sub_7408(v6);
  uint64_t v7 = type metadata accessor for Locale(0LL);
  v3[15] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[16] = v8;
  v3[17] = sub_7408(v8);
  uint64_t v9 = type metadata accessor for Date(0LL);
  v3[18] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[19] = v10;
  v3[20] = sub_7408(v10);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  v3[21] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[22] = v12;
  v3[23] = sub_7408(v12);
  sub_75EC();
  return sub_7490();
}

uint64_t sub_9740()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[9];
  uint64_t v6 = UUID.init()();
  v0[6] = UUID.uuidString.getter(v6);
  v0[7] = v7;
  v0[24] = v7;
  sub_9EFC(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  uint64_t v8 = (void *)swift_task_alloc(dword_190EC);
  v0[25] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_97DC;
  return sub_9AD4();
}

uint64_t sub_97DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  void v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[26] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = v4[24];
    (*(void (**)(void, void))(v4[19] + 8LL))(v4[20], v4[18]);
    swift_bridgeObjectRelease(v5);
  }

  sub_75EC();
  return swift_task_switch(v6, v7, v8);
}

uint64_t sub_9860()
{
  uint64_t v1 = sub_9D6C();
  uint64_t v18 = v2;
  uint64_t v19 = v1;
  if (qword_18BD8 != -1) {
    swift_once(&qword_18BD8, sub_9A14);
  }
  uint64_t v16 = *(void *)(v0 + 32);
  uint64_t v17 = *(void *)(v0 + 24);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = sub_3E10(v7, (uint64_t)qword_190C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v11, v7);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 104))(v6, enum case for PunchOutApp.clock(_:), v9);
  PunchOutApp.url.getter(v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  ClockTimeSnippetModel.init(id:date:currentTimeStaticTitle:timeDescriptiveAbsolute:locale:punchoutURL:)( v14,  v15,  v3,  v17,  v16,  v19,  v18,  v5,  v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_7530();
  sub_74C4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_99B0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_9A14()
{
  uint64_t v0 = type metadata accessor for Locale(0LL);
  sub_4140(v0, qword_190C0);
  sub_3E10(v0, (uint64_t)qword_190C0);
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_9A5C()
{
  uint64_t v0 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for ShowClockCATs_Async(0LL);
  static CATOption.defaultMode.getter();
  uint64_t result = CATWrapper.__allocating_init(options:globals:)(v2, 0LL);
  qword_190D8 = result;
  return result;
}

uint64_t sub_9AD4()
{
  uint64_t v1 = type metadata accessor for TemplatingText(0LL);
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = sub_7408(v2);
  uint64_t v3 = type metadata accessor for TemplatingResult(0LL);
  v0[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[6] = v4;
  v0[7] = sub_7408(v4);
  uint64_t v5 = sub_2C70(&qword_190F0);
  v0[8] = sub_7408(*(void *)(v5 - 8));
  sub_75EC();
  return sub_7490();
}

uint64_t sub_9B4C()
{
  if (qword_18BE0 != -1) {
    swift_once(&qword_18BE0, sub_9A5C);
  }
  uint64_t v1 = (void *)swift_task_alloc(dword_1910C);
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9BC8;
  return sub_9F7C(*(void *)(v0 + 56));
}

uint64_t sub_9BC8()
{
  *(void *)(*(void *)v1 + 80LL) = v0;
  swift_task_dealloc();
  sub_75EC();
  return sub_7490();
}

uint64_t sub_9C20()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = TemplatingResult.sections.getter();
  sub_9EFC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_9E84(v3, v1);
  swift_bridgeObjectRelease(v3);
  uint64_t v4 = type metadata accessor for TemplatingSection(0LL);
  if (sub_3E34(v1, 1LL, v4) == 1)
  {
    sub_3E40(*(void *)(v0 + 64), &qword_190F0);
    uint64_t v5 = 0LL;
    unint64_t v6 = 0xE000000000000000LL;
  }

  else
  {
    uint64_t v8 = *(void *)(v0 + 24);
    uint64_t v7 = *(void *)(v0 + 32);
    uint64_t v9 = *(void *)(v0 + 16);
    TemplatingSection.content.getter();
    uint64_t v10 = sub_9EFC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL));
    uint64_t v5 = TemplatingText.text.getter(v10);
    unint64_t v6 = v11;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  sub_74C4();
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v5, v6);
}

uint64_t sub_9D28()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_9D6C()
{
  uint64_t v0 = sub_2C70(&qword_18F28);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SpeakableString(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  dispatch thunk of DialogCalendar.timeDescriptiveAbsolute.getter(v5);
  if (sub_3E34((uint64_t)v2, 1LL, v3) == 1)
  {
    sub_3E40((uint64_t)v2, &qword_18F28);
    return 0LL;
  }

  else
  {
    uint64_t v9 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v7, v2, v3);
    uint64_t v8 = SpeakableString.print.getter(v9);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  return v8;
}

uint64_t sub_9E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for TemplatingSection(0LL);
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))( a2,  a1 + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL)),  v5);
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 1LL;
  }

  return sub_3E28(a2, v7, 1LL, v6);
}

uint64_t sub_9EFC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t type metadata accessor for ShowClockCATs_Async(uint64_t a1)
{
  uint64_t result = qword_190F8;
  if (!qword_190F8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ShowClockCATs_Async);
  }
  return result;
}

uint64_t sub_9F40(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_194E0);
}

uint64_t sub_9F7C(uint64_t a1)
{
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A004;
  return v5(a1, 0xD000000000000020LL, 0x8000000000011380LL, &_swiftEmptyArrayStorage);
}

uint64_t sub_A004()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_A04C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A09C(a1, a2, a3);
}

uint64_t sub_A09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_2C70(&qword_18C60);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_2CB0(a1, (uint64_t)v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v13 = CATWrapper.init(templateDir:options:globals:)(v12, v9, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_2CF8(a1);
  return v13;
}

uint64_t sub_A19C()
{
  return type metadata accessor for ShowClockCATs_Async(0LL);
}

unint64_t sub_A1A4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_14BE0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

void sub_A1EC()
{
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for Input(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_2D48();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for Parse(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_CD84();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - v12;
  Input.parse.getter(v11);
  sub_A4C4();
  char v15 = v14;
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v16 = v39(v13, v8);
  if ((v15 & 1) != 0)
  {
    Input.parse.getter(v16);
    int v17 = sub_CF24(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88));
    if (v17 == enum case for Parse.NLv4IntentOnly(_:))
    {
      sub_CF24(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 96));
      uint64_t v18 = swift_unknownObjectRelease(*v0);
LABEL_7:
      static ActionForInput.handle()(v18);
      goto LABEL_14;
    }

    if (v17 == enum case for Parse.uso(_:))
    {
      uint64_t v18 = sub_CE74();
      goto LABEL_7;
    }

    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v19 = sub_CBA0();
    int v20 = sub_3E10(v19, (uint64_t)qword_19150);
    uint64_t v21 = sub_CDB4(v7, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    Logger.logObject.getter(v21);
    os_log_type_t v22 = sub_CC50();
    if (sub_CB30(v22))
    {
      os_log_t v37 = (os_log_t)v9;
      int v38 = v20;
      uint64_t v23 = (uint8_t *)sub_75DC(12LL);
      uint64_t v24 = sub_75DC(32LL);
      uint64_t v36 = v24;
      uint64_t v40 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v35 = v23 + 4;
      Input.parse.getter(v24);
      uint64_t v25 = String.init<A>(describing:)(v13, v8);
      unint64_t v27 = v26;
      uint64_t v28 = sub_E8EC(v25, v26, &v40);
      uint64_t v29 = sub_CF40(v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, v30, v35, v23 + 12);
      swift_bridgeObjectRelease(v27);
      sub_CD04(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      os_log_t v31 = v37;
      _os_log_impl(&dword_0, v37, (os_log_type_t)v38, "Received unexpected NL parse: %s", v23, 0xCu);
      uint64_t v32 = v36;
      swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
      sub_4200(v32);
      sub_4200((uint64_t)v23);
    }

    else
    {
      sub_CD04(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    }

    static ActionForInput.ignore()(v33);
    sub_CE74();
  }

  else
  {
    static ActionForInput.ignore()(v16);
  }

LABEL_14:
  sub_CC7C();
}

uint64_t sub_A47C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_19150);
  sub_3E10(v0, (uint64_t)qword_19150);
  return static SiriTimeLog.clockFlow.getter();
}

void sub_A4C4()
{
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = sub_CD4C();
  uint64_t v8 = type metadata accessor for USOParse(v7);
  uint64_t v57 = *(uint8_t **)(v8 - 8);
  uint64_t v58 = v8;
  sub_4198();
  __chkstk_darwin(v9);
  sub_41BC();
  uint64_t v56 = v10;
  uint64_t v11 = type metadata accessor for Parse(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_CD68();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v55 - v15;
  __chkstk_darwin(v14);
  sub_CDE8();
  int v17 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 16);
  sub_CEEC((uint64_t)v0);
  uint64_t v18 = sub_CE9C();
  int v20 = v19(v18);
  if (v20 == enum case for Parse.NLv3IntentOnly(_:))
  {
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v21 = sub_CBA0();
    sub_CB5C(v21, (uint64_t)qword_19150);
    os_log_type_t v22 = sub_CE94();
    if (os_log_type_enabled(v4, v22))
    {
      uint64_t v23 = (uint8_t *)sub_420C();
      *(_WORD *)uint64_t v23 = 0;
      sub_CC10(&dword_0, v4, v22, "On-Device Clock received an NLv3 parse – this is unsupported", v23);
      sub_4200((uint64_t)v23);
    }

    uint64_t v24 = sub_CE9C();
    v25(v24);
  }

  else if (v20 == enum case for Parse.NLv4IntentOnly(_:))
  {
    sub_CE4C();
    unint64_t v26 = *v0;
    uint64_t ObjectType = swift_getObjectType(*v0);
    if (SIRINLUUserDialogAct.firstUsoTask.getter(ObjectType))
    {
      sub_A96C();
      sub_CF08();
      sub_CD20();
    }

    else
    {
      if (qword_18BE8 != -1) {
        swift_once(&qword_18BE8, sub_A47C);
      }
      uint64_t v46 = sub_CBA0();
      sub_CB5C(v46, (uint64_t)qword_19150);
      os_log_type_t v47 = sub_CE94();
      if (sub_CEA8(v47))
      {
        uint64_t v48 = (_WORD *)sub_420C();
        sub_CEC4(v48);
        sub_CC10( &dword_0,  v26,  (os_log_type_t)v0,  "ClockFlowUtils.makeIntentFromParse USO task is empty",  (uint8_t *)v6);
        sub_4200(v6);
        sub_CF08();
      }

      else
      {

        sub_CF08();
      }
    }
  }

  else if (v20 == enum case for Parse.uso(_:))
  {
    sub_CE4C();
    uint64_t v29 = v56;
    uint64_t v28 = v57;
    uint64_t v30 = sub_CDB4(v56, (uint64_t)v0, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))v57 + 4));
    uint64_t v31 = USOParse.userParse.getter(v30);
    uint64_t v32 = Siri_Nlu_External_UserParse.firstUsoTask.getter(v31);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
    if (v32)
    {
      sub_A96C();
      sub_CCFC();
      sub_CD04(v29, *((uint64_t (**)(uint64_t, uint64_t))v28 + 1));
    }

    else
    {
      if (qword_18BE8 != -1) {
        swift_once(&qword_18BE8, sub_A47C);
      }
      uint64_t v50 = sub_CBA0();
      sub_CB5C(v50, (uint64_t)qword_19150);
      os_log_type_t v51 = sub_CC50();
      if (sub_CB30(v51))
      {
        uint64_t v52 = (_WORD *)sub_420C();
        sub_CC58(v52);
        sub_CB1C(&dword_0, v53, v54, "ClockFlowUtils.makeIntentFromParse USO task is empty");
        sub_4200((uint64_t)v0);
      }

      (*((void (**)(uint64_t))v28 + 1))(v29);
    }
  }

  else
  {
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v33 = sub_CBA0();
    uint64_t v34 = (os_log_s *)sub_3E10(v33, (uint64_t)qword_19150);
    uint64_t v35 = sub_CEEC((uint64_t)v16);
    uint64_t v36 = v34;
    Logger.logObject.getter(v35);
    os_log_type_t v37 = sub_CE94();
    if (os_log_type_enabled(v34, v37))
    {
      int v38 = (uint8_t *)sub_75DC(12LL);
      uint64_t v58 = sub_75DC(32LL);
      uint64_t v59 = v58;
      *(_DWORD *)int v38 = 136315138;
      uint64_t v57 = v38 + 4;
      v17(v1, v16, v11);
      uint64_t v39 = String.init<A>(describing:)(v1, v11);
      unint64_t v41 = v40;
      uint64_t v42 = sub_E8EC(v39, v40, &v59);
      uint64_t v43 = sub_CF40(v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v43, v44, v57, v38 + 12);
      swift_bridgeObjectRelease(v41);
      sub_CDF8();
      _os_log_impl(&dword_0, v36, v37, "Received invalid timer parse: %s", v38, 0xCu);
      uint64_t v45 = v58;
      swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
      sub_4200(v45);
      sub_4200((uint64_t)v38);
    }

    else
    {
      sub_CDF8();
    }

    uint64_t v49 = sub_CE9C();
    ((void (*)(uint64_t))v17)(v49);
  }

  sub_CC7C();
}

void sub_A96C()
{
  uint64_t v2 = v1;
  uint64_t v51 = type metadata accessor for UsoEntity_common_Date.DefinedValues(0LL);
  v50[8] = *(void *)(v51 - 8);
  sub_4198();
  __chkstk_darwin(v3);
  sub_41BC();
  v50[2] = v4;
  v50[5] = sub_2C70(&qword_19168);
  sub_CB70();
  __chkstk_darwin(v5);
  sub_41BC();
  v50[9] = v6;
  sub_2C70(&qword_19170);
  sub_CB70();
  __chkstk_darwin(v7);
  sub_41BC();
  v50[6] = v8;
  sub_2C70(&qword_19178);
  sub_CB70();
  __chkstk_darwin(v9);
  sub_41D0();
  v50[3] = v10;
  sub_CDC8();
  __chkstk_darwin(v11);
  v50[11] = (char *)v50 - v12;
  sub_CDC8();
  __chkstk_darwin(v13);
  v50[7] = (char *)v50 - v14;
  sub_CDC8();
  __chkstk_darwin(v15);
  v50[10] = (char *)v50 - v16;
  uint64_t v17 = sub_CEB8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v52 = v17;
  uint64_t v53 = v18;
  sub_4198();
  __chkstk_darwin(v19);
  sub_41BC();
  v50[4] = v20;
  sub_2C70(&qword_19180);
  sub_CB70();
  __chkstk_darwin(v21);
  sub_41D0();
  v50[12] = v22;
  sub_CDC8();
  __chkstk_darwin(v23);
  sub_2C70(&qword_19188);
  sub_CB70();
  __chkstk_darwin(v24);
  sub_CD68();
  __chkstk_darwin(v25);
  sub_CE2C();
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v30 = (char *)v50 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  __chkstk_darwin(v31);
  sub_CDE8();
  sub_2C70(&qword_18C98);
  sub_CB70();
  __chkstk_darwin(v32);
  sub_2D48();
  static UsoTask_CodegenConverter.convert(task:)(&v55, v2);
  if (v56)
  {
    sub_C994(&v55, &v57);
    sub_CCA8();
    uint64_t v33 = type metadata accessor for UsoTask_request_common_DateTime(0LL);
    if (swift_dynamicCast(v54, &v55, (char *)&type metadata for Any + 8, v33, 6LL))
    {
      v50[1] = v54[0];
      uint64_t v34 = (char *)&loc_AC4C + 4 * byte_10DC0[sub_BA00()];
      __asm { BR              X10 }
    }

    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v40 = sub_CBA0();
    sub_3E10(v40, (uint64_t)qword_19150);
    uint64_t v41 = sub_CCA8();
    Logger.logObject.getter(v41);
    os_log_type_t v42 = sub_CC50();
    if (sub_CCC4(v42))
    {
      uint64_t v43 = sub_75DC(12LL);
      uint64_t v44 = sub_75DC(32LL);
      v54[4] = v44;
      sub_CC2C(4.8149e-34);
      uint64_t v45 = sub_CCB4();
      uint64_t v47 = sub_CDBC(v45, v46);
      sub_CC64(v47);
      sub_CEE4();
      sub_CD28();
      sub_CDD4(&dword_0, v48, v49, "Receiving unsupported uso task: %s");
      sub_CE84();
      sub_4200(v44);
      sub_4200(v43);
    }

    else
    {

      sub_CD28();
    }

    sub_CE14();
  }

  else
  {
    sub_CA5C((uint64_t)&v55, &qword_19190);
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v35 = sub_CBA0();
    sub_CB5C(v35, (uint64_t)qword_19150);
    os_log_type_t v36 = sub_CCDC();
    if (sub_CB30(v36))
    {
      os_log_type_t v37 = (_WORD *)sub_420C();
      sub_CC58(v37);
      sub_CB1C(&dword_0, v38, v39, "Task is invalid, returning isValidClockTask = false");
      sub_4200(v0);
    }
  }

  sub_CC7C();
}

uint64_t sub_BA00()
{
  uint64_t v0 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_2D48();
  uint64_t v2 = sub_CC9C();
  if (v17
    && (uint64_t v3 = dispatch thunk of UsoEntity_common_DateTime.date.getter(v2), v4 = sub_CC48(), v3)
    && (uint64_t v5 = dispatch thunk of UsoEntity_common_Date.monthOfYear.getter(v4), sub_7730(), v5))
  {
    sub_CC48();
  }

  else
  {
    uint64_t v6 = sub_CC9C();
    if (v17)
    {
      uint64_t v7 = dispatch thunk of UsoEntity_common_DateTime.time.getter(v6);
      sub_7730();
      if (v7)
      {
        sub_CC48();
        return 0LL;
      }
    }

    uint64_t v9 = sub_CC9C();
    if (v17)
    {
      uint64_t v10 = dispatch thunk of UsoEntity_common_DateTime.date.getter(v9);
      uint64_t v11 = sub_CC48();
      if (v10)
      {
        uint64_t v12 = dispatch thunk of UsoEntity_common_Date.weekOfYear.getter(v11);
        sub_7730();
        if (v12)
        {
          uint64_t v13 = sub_CC48();
          static SiriTimeFeatureFlagsImpl.instance.getter(v13);
          Swift::Bool v14 = SiriTimeFeatureFlagsImpl.isWeekOfYearEnabled()();
          sub_CF24(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
          if (v14) {
            return 2LL;
          }
        }
      }
    }

    uint64_t v15 = sub_CC9C();
    if (v17)
    {
      uint64_t v16 = dispatch thunk of UsoEntity_common_DateTime.date.getter(v15);
      sub_7730();
      if (v16)
      {
        sub_CCFC();
        return 1LL;
      }
    }
  }

  return 3LL;
}

void sub_BB4C()
{
  uint64_t v148 = v3;
  sub_2C70(&qword_18C98);
  sub_CB70();
  __chkstk_darwin(v4);
  sub_41BC();
  uint64_t v139 = v5;
  sub_2C70(&qword_191A8);
  sub_CB70();
  __chkstk_darwin(v6);
  sub_41BC();
  uint64_t v136 = v7;
  uint64_t v8 = ((uint64_t (*)(void))type metadata accessor for UsoEntity_common_OffsetDirection.DefinedValues)(0LL);
  uint64_t v137 = *(void *)(v8 - 8);
  uint64_t v138 = (void *)v8;
  sub_4198();
  __chkstk_darwin(v9);
  sub_41BC();
  uint64_t v143 = v10;
  uint64_t v11 = sub_CEB8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v145 = v11;
  uint64_t v146 = v12;
  sub_4198();
  __chkstk_darwin(v13);
  sub_41BC();
  uint64_t v134 = v14;
  uint64_t v15 = sub_2C70(&qword_19180);
  sub_CB70();
  __chkstk_darwin(v16);
  sub_41BC();
  uint64_t v144 = v17;
  sub_2C70(&qword_19188);
  sub_CB70();
  __chkstk_darwin(v18);
  sub_41D0();
  uint64_t v135 = v19;
  sub_CDC8();
  __chkstk_darwin(v20);
  sub_CE2C();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v132 - v22;
  sub_2C70(&qword_18C88);
  sub_CB70();
  __chkstk_darwin(v24);
  sub_41BC();
  uint64_t v141 = v25;
  sub_2C70(&qword_18C90);
  sub_CB70();
  __chkstk_darwin(v26);
  sub_41BC();
  uint64_t v140 = v27;
  uint64_t v147 = type metadata accessor for DateComponents(0LL);
  uint64_t v28 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  sub_41D0();
  uint64_t v133 = v29;
  sub_CDC8();
  __chkstk_darwin(v30);
  uint64_t v142 = (char *)&v132 - v31;
  sub_2C70(&qword_19178);
  sub_CB70();
  __chkstk_darwin(v32);
  uint64_t v33 = sub_CD30();
  uint64_t v34 = (void (*)(uint64_t, uint64_t))((uint64_t (*)(uint64_t))type metadata accessor for UsoEntity_common_Date.DefinedValues)(v33);
  uint64_t v35 = *((void *)v34 - 1);
  sub_4198();
  __chkstk_darwin(v36);
  sub_CD84();
  uint64_t v38 = __chkstk_darwin(v37);
  uint64_t v40 = (char *)&v132 - v39;
  uint64_t v41 = ((void *(*)(char **__return_ptr, uint64_t))dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter)( &v149,  v38);
  os_log_type_t v42 = v149;
  if (!v149)
  {
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v53 = sub_CBA0();
    sub_CB5C(v53, (uint64_t)qword_19150);
    os_log_type_t v54 = sub_CCDC();
    BOOL v55 = sub_CB30(v54);
    uint64_t v49 = v147;
    if (v55)
    {
      uint64_t v56 = (_WORD *)sub_420C();
      sub_CC58(v56);
      sub_CB1C(&dword_0, v57, v58, "ClockFlowPlugin task contains no reference");
      sub_4200((uint64_t)v34);
    }

    goto LABEL_15;
  }

  uint64_t v132 = v28;
  uint64_t v43 = dispatch thunk of UsoEntity_common_DateTime.date.getter(v41);
  if (!v43)
  {
    uint64_t v142 = v42;
    if (((uint64_t (*)(void))dispatch thunk of UsoEntity_common_DateTime.offsetReference.getter)())
    {
      ((void (*)(void))dispatch thunk of UsoEntity_common_DateTime.definedValue.getter)();
      sub_7730();
      uint64_t v63 = v147;
      uint64_t v64 = v132;
      uint64_t v65 = v145;
    }

    else
    {
      sub_CD0C();
      uint64_t v65 = v145;
      sub_3E28(v78, v79, v80, v145);
      uint64_t v63 = v147;
      uint64_t v64 = v132;
    }

    (*(void (**)(uint64_t, void, uint64_t))(v146 + 104))( v2,  enum case for UsoEntity_common_DateTime.DefinedValues.common_DateTime_Now(_:),  v65);
    sub_CE08();
    sub_3E28(v81, v82, v83, v65);
    uint64_t v84 = *(int *)(v15 + 48);
    uint64_t v85 = v144;
    uint64_t v86 = v144 + v84;
    sub_CD18((uint64_t)v23, v144);
    sub_CD18(v2, v86);
    sub_CC18(v85, 1LL, v65);
    if (v90)
    {
      sub_CC08(v2);
      sub_CC08((uint64_t)v23);
      uint64_t v87 = sub_CC18(v86, 1LL, v65);
      if (v90)
      {
        sub_CE3C(v87, &qword_19188);
        uint64_t v88 = v143;
        goto LABEL_35;
      }
    }

    else
    {
      uint64_t v89 = v135;
      sub_C9E0(v85, v135, &qword_19188);
      sub_CC18(v86, 1LL, v65);
      if (!v90)
      {
        uint64_t v92 = v146;
        uint64_t v93 = v134;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 32))(v134, v86, v65);
        sub_CA20( &qword_191A0,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_DateTime.DefinedValues,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_DateTime.DefinedValues);
        LODWORD(v147) = dispatch thunk of static Equatable.== infix(_:_:)(v89, v93, v65, v94);
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
        v34(v93, v65);
        sub_CC08(v2);
        sub_CC08((uint64_t)v23);
        v34(v89, v65);
        sub_CC08(v85);
        uint64_t v88 = v143;
        if ((v147 & 1) != 0) {
          goto LABEL_35;
        }
        goto LABEL_32;
      }

      sub_CC94(v2);
      sub_CC94((uint64_t)v23);
      uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v146 + 8))(v89, v65);
    }

    sub_CE3C(v87, &qword_19180);
    uint64_t v88 = v143;
LABEL_32:
    uint64_t v91 = (void *)((uint64_t (*)(void))dispatch thunk of UsoEntity_common_DateTime.offsetReference.getter)();
    swift_release(v91);
    if (v91) {
      goto LABEL_45;
    }
LABEL_35:
    uint64_t v95 = ((uint64_t (*)(void))dispatch thunk of UsoEntity_common_DateTime.direction.getter)();
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = v136;
      ((void (*)(void))dispatch thunk of UsoEntity_common_OffsetDirection.definedValue.getter)();
      uint64_t v98 = v96;
      uint64_t v99 = v97;
      swift_release(v98);
      uint64_t v100 = v97;
      uint64_t v91 = v138;
      sub_CC18(v100, 1LL, (uint64_t)v138);
      uint64_t v34 = v139;
      uint64_t v101 = v137;
      if (!v90)
      {
        uint64_t v102 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v137 + 32))(v88, v99, v91);
LABEL_40:
        if (((uint64_t (*)(uint64_t))dispatch thunk of UsoEntity_common_DateTime.offsetValue.getter)(v102))
        {
          ((void (*)(uint64_t))UsoEntity_common_Duration.dateComponents(direction:))(v88);
          sub_7730();
          sub_CE1C();
          sub_CE08();
          sub_3E28(v106, v107, v108, v63);
          uint64_t v109 = sub_CC18((uint64_t)v34, 1LL, v63);
          if (!v90)
          {
            swift_release(v142);
            uint64_t v110 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(v64 + 32);
            uint64_t v111 = v133;
            v110((uint64_t)v133, v34, v63);
            uint64_t v112 = v148;
            v110(v148, (void (*)(uint64_t, uint64_t))v111, v63);
            uint64_t v59 = v112;
            uint64_t v60 = 0LL;
LABEL_50:
            uint64_t v61 = 1LL;
            uint64_t v62 = v63;
            goto LABEL_58;
          }
        }

        else
        {
          sub_CE1C();
          sub_CD0C();
          uint64_t v109 = sub_3E28(v113, v114, v115, v63);
        }

        sub_CF38(v109, &qword_18C98);
LABEL_45:
        if (qword_18BE8 != -1) {
          swift_once(&qword_18BE8, sub_A47C);
        }
        uint64_t v116 = sub_CBA0();
        sub_CB5C(v116, (uint64_t)qword_19150);
        os_log_type_t v117 = sub_CCDC();
        if (sub_CB30(v117))
        {
          uint64_t v118 = (_WORD *)sub_420C();
          sub_CC58(v118);
          sub_CB1C(&dword_0, v119, v120, "ClockFlowPlugin Could not find reference offset");
          sub_4200((uint64_t)v34);
        }

        swift_release(v142);
        uint64_t v59 = v148;
        uint64_t v60 = 1LL;
        goto LABEL_50;
      }
    }

    else
    {
      uint64_t v99 = v136;
      sub_CD0C();
      uint64_t v91 = v138;
      sub_3E28(v103, v104, v105, (uint64_t)v138);
      uint64_t v34 = v139;
      uint64_t v101 = v137;
    }

    (*(void (**)(uint64_t, void, void *))(v101 + 104))( v88,  enum case for UsoEntity_common_OffsetDirection.DefinedValues.common_OffsetDirection_After(_:),  v91);
    sub_CA5C(v99, &qword_191A8);
    goto LABEL_40;
  }

  uint64_t v44 = (char *)v43;
  ((void (*)(void))dispatch thunk of UsoEntity_common_Date.definedValue.getter)();
  uint64_t v45 = sub_CC18((uint64_t)v0, 1LL, (uint64_t)v34);
  if (v90)
  {
    sub_CE6C(v45, &qword_19178);
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v46 = sub_CBA0();
    sub_CB5C(v46, (uint64_t)qword_19150);
    os_log_type_t v47 = sub_CC50();
    BOOL v48 = sub_CB30(v47);
    uint64_t v49 = v147;
    if (v48)
    {
      uint64_t v50 = (_WORD *)sub_420C();
      sub_CC58(v50);
      sub_CB1C(&dword_0, v51, v52, "ClockFlowPlugin does not yet support arbitrary absolute date references");
      sub_4200((uint64_t)v34);
    }

    sub_CC48();
    sub_CE44();
LABEL_15:
    sub_CD0C();
    uint64_t v62 = v49;
    goto LABEL_58;
  }

  (*(void (**)(char *, void *, void (*)(uint64_t, uint64_t)))(v35 + 32))(v40, v0, v34);
  (*(void (**)(char *, char *, void (*)(uint64_t, uint64_t)))(v35 + 16))(v1, v40, v34);
  int v66 = sub_CF24(*(uint64_t (**)(uint64_t, uint64_t))(v35 + 88));
  if (v66 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_Tomorrow(_:))
  {
    uint64_t v67 = sub_CCD4();
    uint64_t v68 = v140;
    uint64_t v71 = sub_CB80(v67, v69, v70, v67);
    uint64_t v72 = v141;
    sub_3E28(v141, 1LL, 1LL, v71);
    sub_CBA8();
    uint64_t v44 = v142;
    sub_CB40(v68, v72);
    uint64_t v73 = 1LL;
LABEL_57:
    ((void (*)(uint64_t, void))DateComponents.day.setter)(v73, 0LL);
    sub_CC48();
    sub_CE44();
    sub_CE5C();
    (*(void (**)(uint64_t, char *, uint64_t))(v132 + 32))(v148, v44, v147);
    uint64_t v59 = sub_CF10();
    goto LABEL_58;
  }

  if (v66 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_DayBeforeYesterday(_:))
  {
    uint64_t v74 = sub_CCD4();
    uint64_t v77 = sub_CB80(v74, v75, v76, v74);
    sub_3E28(v141, 1LL, 1LL, v77);
    sub_CA94();
    uint64_t v73 = -2LL;
    goto LABEL_57;
  }

  if (v66 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_DayAfterTomorrow(_:))
  {
    uint64_t v121 = sub_CCD4();
    uint64_t v124 = sub_CB80(v121, v122, v123, v121);
    sub_3E28(v141, 1LL, 1LL, v124);
    sub_CA94();
    uint64_t v73 = 2LL;
    goto LABEL_57;
  }

  if (v66 != enum case for UsoEntity_common_Date.DefinedValues.common_Date_Today(_:))
  {
    if (v66 != enum case for UsoEntity_common_Date.DefinedValues.common_Date_Yesterday(_:))
    {
      uint64_t v129 = *(void (**)(char *, void *))(v35 + 8);
      v129(v40, v34);
      sub_CC48();
      sub_CE44();
      sub_7660(v148, v130, v131, v147);
      v129(v1, v34);
      goto LABEL_59;
    }

    uint64_t v125 = sub_CCD4();
    uint64_t v128 = sub_CB80(v125, v126, v127, v125);
    sub_3E28(v141, 1LL, 1LL, v128);
    sub_CA94();
    uint64_t v73 = -1LL;
    goto LABEL_57;
  }

  sub_CE5C();
  sub_CC48();
  sub_CE44();
  sub_CD0C();
LABEL_58:
  sub_3E28(v59, v60, v61, v62);
LABEL_59:
  sub_CC7C();
}

void sub_C4F0()
{
  uint64_t v74 = v4;
  uint64_t v75 = v5;
  uint64_t v72 = v6;
  sub_2C70(&qword_18C88);
  sub_CB70();
  __chkstk_darwin(v7);
  sub_2D48();
  uint64_t v10 = v9 - v8;
  sub_2C70(&qword_18C90);
  sub_CB70();
  __chkstk_darwin(v11);
  uint64_t v12 = sub_CD4C();
  uint64_t v13 = type metadata accessor for DateComponents(v12);
  uint64_t v70 = *(void *)(v13 - 8);
  uint64_t v71 = v13;
  sub_4198();
  __chkstk_darwin(v14);
  sub_2D48();
  uint64_t v17 = v16 - v15;
  sub_2C70(&qword_19170);
  sub_CB70();
  __chkstk_darwin(v18);
  uint64_t v19 = sub_CD30();
  uint64_t v20 = ((uint64_t (*)(uint64_t))type metadata accessor for UsoEntity_common_ListPosition.DefinedValues)(v19);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  sub_CE2C();
  __chkstk_darwin(v22);
  sub_CDE8();
  uint64_t v23 = ((void *(*)(uint64_t *__return_ptr))dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter)(&v73);
  if (!v73)
  {
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v48 = sub_CBA0();
    sub_CB5C(v48, (uint64_t)qword_19150);
    os_log_type_t v49 = sub_CCDC();
    if (sub_CB30(v49))
    {
      uint64_t v50 = (_WORD *)sub_420C();
      sub_CC58(v50);
      sub_CB1C(&dword_0, v51, v52, "ClockFlowPlugin task contains no reference");
      sub_4200(v1);
    }

    goto LABEL_20;
  }

  uint64_t v69 = v1;
  uint64_t v24 = dispatch thunk of UsoEntity_common_DateTime.date.getter(v23);
  if (!v24
    || (uint64_t v1 = v24, v25 = dispatch thunk of UsoEntity_common_Date.weekOfYear.getter(v24), v26 = sub_CD20(), !v25)
    || (uint64_t v1 = ((uint64_t (*)(uint64_t))dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter)(v26),
        uint64_t v27 = sub_7730(),
        !v1))
  {
    sub_CD0C();
    uint64_t v28 = sub_3E28(v40, v41, v42, v20);
    goto LABEL_9;
  }

  ((void (*)(uint64_t))dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter)(v27);
  sub_CD20();
  uint64_t v28 = sub_CC18((uint64_t)v0, 1LL, v20);
  if (v29)
  {
LABEL_9:
    sub_CE6C(v28, &qword_19170);
    if (qword_18BE8 != -1) {
      swift_once(&qword_18BE8, sub_A47C);
    }
    uint64_t v43 = sub_CBA0();
    sub_CB5C(v43, (uint64_t)qword_19150);
    os_log_type_t v44 = sub_CCDC();
    if (sub_CB30(v44))
    {
      uint64_t v45 = (_WORD *)sub_420C();
      sub_CC58(v45);
      sub_CB1C(&dword_0, v46, v47, "Could not find listPosition in ClockFlowPlugin task");
      sub_4200(v1);
    }

    goto LABEL_14;
  }

  uint64_t v30 = v69;
  uint64_t v31 = sub_CE9C();
  sub_CDB4(v31, v32, v33);
  sub_CDB4(v3, v69, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16));
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v3, v20);
  if (v34 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Previous(_:))
  {
    uint64_t v35 = sub_CCD4();
    uint64_t v38 = sub_CB80(v35, v36, v37, v35);
    sub_3E28(v10, 1LL, 1LL, v38);
    sub_CB40(v2, v10);
    uint64_t v39 = -1LL;
LABEL_27:
    ((void (*)(uint64_t, void))DateComponents.weekOfYear.setter)(v39, 0LL);
    sub_CF30();
    sub_CD04(v69, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v72, v17, v71);
    uint64_t v53 = sub_CF10();
    goto LABEL_21;
  }

  if (v34 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Current(_:))
  {
    sub_CD04(v69, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
LABEL_14:
    sub_CF30();
LABEL_20:
    sub_CD0C();
LABEL_21:
    sub_3E28(v53, v54, v55, v56);
    goto LABEL_22;
  }

  if (v34 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Next(_:))
  {
    uint64_t v57 = sub_CCD4();
    uint64_t v60 = sub_CB80(v57, v58, v59, v57);
    sub_3E28(v10, 1LL, 1LL, v60);
    sub_CBA8();
    sub_CB40(v2, v10);
    uint64_t v39 = 1LL;
    goto LABEL_27;
  }

  if (qword_18BE8 != -1) {
    swift_once(&qword_18BE8, sub_A47C);
  }
  uint64_t v61 = sub_CBA0();
  sub_CB5C(v61, (uint64_t)qword_19150);
  os_log_type_t v62 = sub_CC50();
  if (sub_CB30(v62))
  {
    uint64_t v63 = (_WORD *)sub_420C();
    sub_CC58(v63);
    sub_CB1C(&dword_0, v64, v65, "ClockFlowPlugin does not yet support arbitrary absolute date references");
    uint64_t v30 = v69;
    sub_4200(v69);
  }

  sub_CF30();
  int v66 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v66(v30, v20);
  sub_7660(v72, v67, v68, v71);
  v66(v3, v20);
LABEL_22:
  sub_CC7C();
}

_OWORD *sub_C994(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_C9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_C9E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2C70(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_CF00();
}

void sub_CA20(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_CF00();
}

void sub_CA5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2C70(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_CF00();
}

uint64_t sub_CA94()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v1,  v0,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL);
}

void sub_CB1C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

BOOL sub_CB30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_CB40(uint64_t a1, uint64_t a2)
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( a1,  a2,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL);
}

uint64_t sub_CB5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_3E10(a1, a2);
  return Logger.logObject.getter(v2);
}

  ;
}

uint64_t sub_CB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for TimeZone(0LL);
}

uint64_t sub_CBA0()
{
  return type metadata accessor for Logger(0LL);
}

  ;
}

void sub_CC08(uint64_t a1)
{
}

void sub_CC10(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_CC18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E34(a1, a2, a3);
}

uint64_t sub_CC2C(float a1)
{
  *uint64_t v1 = a1;
  return sub_C9A4(v2 - 152, v2 - 192);
}

uint64_t sub_CC48()
{
  return swift_release(v0);
}

uint64_t sub_CC50()
{
  return static os_log_type_t.error.getter();
}

_WORD *sub_CC58(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_CC64(uint64_t a1)
{
  *(void *)(v4 - 192) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v4 - 192, v3 + 8, v2, v1);
}

  ;
}

void sub_CC94(uint64_t a1)
{
}

uint64_t sub_CC9C()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter();
}

uint64_t sub_CCA8()
{
  return sub_C9A4(v0 - 120, v0 - 152);
}

uint64_t sub_CCB4()
{
  return String.init<A>(describing:)(v1 - 192, v0 + 8);
}

BOOL sub_CCC4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_CCD4()
{
  return type metadata accessor for Calendar(0LL);
}

uint64_t sub_CCDC()
{
  return static os_log_type_t.default.getter();
}

  ;
}

uint64_t sub_CCFC()
{
  return swift_release(v0);
}

uint64_t sub_CD04@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

  ;
}

void sub_CD18(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_CD20()
{
  return swift_release(v0);
}

uint64_t sub_CD28()
{
  return _s20HandleIntentStrategyVwxx_0((void *)(v0 - 152));
}

uint64_t sub_CD30()
{
  return 0LL;
}

uint64_t sub_CD4C()
{
  return 0LL;
}

  ;
}

  ;
}

uint64_t sub_CDA0()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter();
}

uint64_t sub_CDAC()
{
  return swift_release(v0);
}

uint64_t sub_CDB4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_CDBC(uint64_t a1, unint64_t a2)
{
  return sub_E8EC(a1, a2, (uint64_t *)(v2 - 160));
}

  ;
}

void sub_CDD4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

uint64_t sub_CDF8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

  ;
}

uint64_t sub_CE14()
{
  return _s20HandleIntentStrategyVwxx_0((void *)(v0 - 120));
}

uint64_t sub_CE1C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

  ;
}

void sub_CE3C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_CE44()
{
  return swift_release(v0);
}

uint64_t sub_CE4C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

uint64_t sub_CE5C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

void sub_CE6C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_CE74()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 104))(v1, v0);
}

uint64_t sub_CE84()
{
  return swift_arrayDestroy(v0, 1LL, v1);
}

uint64_t sub_CE94()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_CE9C()
{
  return v0;
}

BOOL sub_CEA8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_CEB8()
{
  return type metadata accessor for UsoEntity_common_DateTime.DefinedValues(0LL);
}

_WORD *sub_CEC4(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_CED0()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter();
}

uint64_t sub_CEDC()
{
  return swift_retain(v0);
}

uint64_t sub_CEE4()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_CEEC(uint64_t a1)
{
  return v3(a1, v2, v1);
}

void sub_CEF8(uint64_t a1)
{
}

  ;
}

uint64_t sub_CF08()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_CF10()
{
  return v0;
}

uint64_t sub_CF24@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_CF30()
{
  return swift_release(v0);
}

void sub_CF38(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_CF40(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_CF54(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  v1[4] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[5] = v3;
  v1[6] = sub_7408(v3);
  uint64_t v4 = type metadata accessor for USOParse(0LL);
  v1[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[8] = v5;
  v1[9] = sub_7408(v5);
  uint64_t v6 = type metadata accessor for Parse(0LL);
  v1[10] = v6;
  v1[11] = *(void *)(v6 - 8);
  v1[12] = sub_742C();
  v1[13] = sub_742C();
  v1[14] = sub_742C();
  return swift_task_switch(sub_CFFC, 0LL, 0LL);
}

uint64_t sub_CFFC()
{
  if (qword_18BF0 != -1) {
    swift_once(&qword_18BF0, sub_D490);
  }
  uint64_t v2 = sub_CBA0();
  uint64_t v3 = sub_3E10(v2, (uint64_t)qword_191B0);
  os_log_type_t v4 = v3;
  uint64_t v5 = (os_log_s *)v3;
  Logger.logObject.getter(v3);
  os_log_type_t v6 = sub_7738();
  if (sub_CEA8(v6))
  {
    uint64_t v7 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v0, "ClockFlowUtils.makeIntentFromParse() called.", v7, 2u);
    sub_4200((uint64_t)v7);
  }

  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = *(void *)(v1 + 112);
  uint64_t v10 = *(void *)(v1 + 80);
  uint64_t v11 = *(void *)(v1 + 88);

  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v12(v9, v8, v10);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 88))(v9, v10);
  uint64_t v14 = *(void *)(v1 + 80);
  if (v13 == enum case for Parse.NLv4IntentOnly(_:))
  {
    uint64_t v15 = *(void **)(v1 + 112);
    sub_DE1C(v14, *(void *)(v1 + 88));
    uint64_t v16 = (void *)*v15;
    uint64_t ObjectType = swift_getObjectType(*v15);
    if (SIRINLUUserDialogAct.firstUsoTask.getter(ObjectType))
    {
      type metadata accessor for ShowClockIntent();
      uint64_t v18 = sub_DDF4();
      swift_unknownObjectRelease(v16);
LABEL_11:
      sub_DDCC();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(uint64_t))(v1 + 8))(v18);
    }

    sub_DE70();
    os_log_type_t v43 = sub_CE94();
    if (sub_76F0(v43))
    {
      os_log_type_t v44 = (_WORD *)sub_75DC(2LL);
      *os_log_type_t v44 = 0;
      sub_DDB8(&dword_0, v45, v46, "ClockFlowUtils.makeIntentFromParse USO task is empty");
      sub_4200((uint64_t)v44);
    }

    sub_2C70(&qword_18EA0);
    unint64_t v47 = sub_DE5C();
    sub_764C(v47);
    sub_DDAC();
    swift_unknownObjectRelease(v16);
  }

  else if (v13 == enum case for Parse.uso(_:))
  {
    uint64_t v19 = *(void *)(v1 + 112);
    uint64_t v21 = *(void *)(v1 + 64);
    uint64_t v20 = *(void *)(v1 + 72);
    uint64_t v23 = *(void *)(v1 + 48);
    uint64_t v22 = *(void *)(v1 + 56);
    uint64_t v24 = *(void *)(v1 + 32);
    uint64_t v25 = *(void *)(v1 + 40);
    sub_DE1C(v14, *(void *)(v1 + 88));
    uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v20, v19, v22);
    uint64_t v27 = USOParse.userParse.getter(v26);
    uint64_t v28 = Siri_Nlu_External_UserParse.firstUsoTask.getter(v27);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    if (v28)
    {
      uint64_t v30 = *(void *)(v1 + 64);
      uint64_t v29 = *(void *)(v1 + 72);
      uint64_t v31 = *(void *)(v1 + 56);
      type metadata accessor for ShowClockIntent();
      uint64_t v18 = sub_DDF4();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      goto LABEL_11;
    }

    sub_DE70();
    os_log_type_t v51 = sub_CE94();
    if (sub_76F0(v51))
    {
      uint64_t v52 = (_WORD *)sub_75DC(2LL);
      *uint64_t v52 = 0;
      sub_DDB8(&dword_0, v53, v54, "ClockFlowUtils.makeIntentFromParse USO task is empty");
      sub_4200((uint64_t)v52);
    }

    uint64_t v56 = *(void *)(v1 + 64);
    uint64_t v55 = *(void *)(v1 + 72);
    uint64_t v57 = *(void *)(v1 + 56);

    sub_2C70(&qword_18EA0);
    unint64_t v58 = sub_DE5C();
    sub_764C(v58);
    sub_DDAC();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  }

  else
  {
    v12(*(void *)(v1 + 104), *(void *)(v1 + 24), v14);
    sub_DE70();
    os_log_type_t v33 = sub_CE94();
    BOOL v34 = sub_76F0(v33);
    uint64_t v35 = *(void *)(v1 + 104);
    if (v34)
    {
      uint64_t v36 = *(void *)(v1 + 96);
      uint64_t v59 = *(void *)(v1 + 88);
      uint64_t v37 = *(void *)(v1 + 80);
      uint64_t v38 = (uint8_t *)sub_75DC(12LL);
      uint64_t v60 = sub_75DC(32LL);
      uint64_t v61 = v60;
      *(_DWORD *)uint64_t v38 = 136315138;
      v12(v36, v35, v37);
      uint64_t v39 = String.init<A>(describing:)(v36, v37);
      unint64_t v41 = v40;
      *(void *)(v1 + 16) = sub_E8EC(v39, v40, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v38 + 4, v38 + 12);
      swift_bridgeObjectRelease(v41);
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      v42(v35, v37);
      sub_DE2C(&dword_0, v5, v4, "ClockFlowUtils.makeIntentFromParse Received unsupported parse: %s", v38);
      swift_arrayDestroy(v60, 1LL, (char *)&type metadata for Any + 8);
      sub_4200(v60);
      sub_4200((uint64_t)v38);
    }

    else
    {
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 88) + 8LL);
      v42(*(void *)(v1 + 104), *(void *)(v1 + 80));
    }

    uint64_t v48 = *(void *)(v1 + 112);
    uint64_t v49 = *(void *)(v1 + 80);
    sub_2C70(&qword_18EA0);
    unint64_t v50 = sub_DE5C();
    sub_764C(v50);
    sub_DDAC();
    v42(v48, v49);
  }

  sub_DDCC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_D490()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_191B0);
  sub_3E10(v0, (uint64_t)qword_191B0);
  return static SiriTimeLog.clockFlow.getter();
}

uint64_t sub_D4D8(uint64_t a1)
{
  LOBYTE(v2) = (_BYTE)v1;
  uint64_t v4 = sub_2C70(&qword_18C98);
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DateComponents(0LL);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v8 = __chkstk_darwin(v7);
  os_log_type_t v33 = (char *)&v30 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  id v11 = [objc_allocWithZone(v1) init];
  if (a1)
  {
    swift_retain(a1);
    id v2 = v11;
    static UsoTask_CodegenConverter.convert(task:)(&v36, a1);
    if (v37)
    {
      sub_C994(&v36, v38);
      sub_CCA8();
      uint64_t v12 = type metadata accessor for UsoTask_request_common_DateTime(0LL);
      if ((swift_dynamicCast(v34, &v36, (char *)&type metadata for Any + 8, v12, 6LL) & 1) != 0)
      {
        uint64_t v32 = v34[0];
        uint64_t v31 = sub_BA00();
        __asm { BR              X10 }
      }

      if (qword_18BF0 != -1) {
        swift_once(&qword_18BF0, sub_D490);
      }
      uint64_t v17 = sub_CBA0();
      uint64_t v18 = (os_log_s *)sub_3E10(v17, (uint64_t)qword_191B0);
      uint64_t v19 = sub_CCA8();
      Logger.logObject.getter(v19);
      os_log_type_t v20 = sub_CE94();
      if (os_log_type_enabled(v18, v20))
      {
        uint64_t v21 = (uint8_t *)sub_75DC(12LL);
        uint64_t v22 = sub_75DC(32LL);
        uint64_t v35 = v22;
        *(_DWORD *)uint64_t v21 = 136315138;
        sub_C9A4((uint64_t)&v36, (uint64_t)v34);
        uint64_t v23 = String.init<A>(describing:)(v34, (char *)&type metadata for Any + 8);
        unint64_t v25 = v24;
        uint64_t v26 = sub_E8EC(v23, v24, &v35);
        uint64_t v27 = sub_DD98(v26);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v27, v28, v21 + 4, v21 + 12);
        swift_bridgeObjectRelease(v25);
        _s20HandleIntentStrategyVwxx_0(&v36);
        sub_DE2C(&dword_0, v18, v20, "Receiving unsupported uso task: %s", v21);
        swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
        sub_4200(v22);
        sub_4200((uint64_t)v21);

        sub_DDE0();
      }

      else
      {

        sub_CCFC();
        _s20HandleIntentStrategyVwxx_0(&v36);
        sub_CCFC();
      }

      _s20HandleIntentStrategyVwxx_0(v38);
      return 0LL;
    }

    sub_CCFC();
    sub_3E40((uint64_t)&v36, &qword_19190);
  }

  if (qword_18BF0 != -1) {
    swift_once(&qword_18BF0, sub_D490);
  }
  uint64_t v13 = sub_CBA0();
  uint64_t v14 = (os_log_s *)sub_3E10(v13, (uint64_t)qword_191B0);
  Logger.logObject.getter(v14);
  os_log_type_t v15 = sub_7738();
  if (sub_CEA8(v15))
  {
    uint64_t v16 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_0, v14, (os_log_type_t)v2, "Task is nil, returning empty ShowClockIntent", v16, 2u);
    sub_4200((uint64_t)v16);
  }

  sub_CCFC();
  return 0LL;
}

void sub_DD08(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setClockRequestType:v5];
}

unint64_t sub_DD58()
{
  unint64_t result = qword_191D0[0];
  if (!qword_191D0[0])
  {
    uint64_t v1 = type metadata accessor for DateComponents(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DateComponents, v1);
    atomic_store(result, qword_191D0);
  }

  return result;
}

uint64_t sub_DD98(uint64_t a1)
{
  *(void *)(v1 - 192) = a1;
  return v1 - 192;
}

uint64_t sub_DDAC()
{
  return swift_willThrow();
}

void sub_DDB8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_DDCC()
{
  return swift_task_dealloc(*(void *)(v0 + 112));
}

uint64_t sub_DDE0()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_DDEC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_DDF4()
{
  return sub_D4D8(v0);
}

uint64_t sub_DE04()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_DE14()
{
  return swift_bridgeObjectRelease(0xE800000000000000LL);
}

uint64_t sub_DE1C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 96))(v2, a1);
}

void sub_DE2C(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

void sub_DE34()
{
  *(void *)(v0 - 224) = 0x656D6954776F6873LL;
}

uint64_t sub_DE4C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

unint64_t sub_DE5C()
{
  return sub_719C();
}

uint64_t sub_DE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_arrayDestroy(v3, 1LL, a3);
}

uint64_t sub_DE70()
{
  return Logger.logObject.getter();
}

id sub_DE78(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_DE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, 0xE800000000000000LL, 0LL);
}

uint64_t sub_DE90(uint64_t a1, unint64_t a2)
{
  return sub_E8EC(a1, a2, (uint64_t *)(v2 - 152));
}

uint64_t static ShowClockIntent.shouldSkipDefaultSchemaCheck()()
{
  return 1LL;
}

uint64_t type metadata accessor for ClockIntents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_94EC(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ClockIntents);
}

uint64_t sub_DEC0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t sub_DF10(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_DF50 + 4 * aShowtimeshowda[v4 + 24]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_DF70 + 4 * byte_10DED[v4]))();
  }
}

_BYTE *sub_DF50(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_DF70(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_DF78(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_DF80(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_DF88(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_DF90(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_DF9C()
{
  return 0LL;
}

uint64_t type metadata accessor for ClockIntents.FlowError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_94EC(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ClockIntents.FlowError);
}

uint64_t sub_DFB0(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10E70, a1);
}

void sub_DFC0()
{
}

Swift::Int sub_DFE4()
{
  return Hasher._finalize()();
}

Swift::Int sub_E02C(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_E074()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_192D8);
  sub_3E10(v0, (uint64_t)qword_192D8);
  return static SiriTimeLog.clockFlow.getter();
}

void *sub_E0BC(void *a1)
{
  uint64_t v2 = type metadata accessor for ShowClockIntent();
  uint64_t v3 = type metadata accessor for ShowClockIntentResponse();
  RCHChildFlowProducersAsync.init()(v2, v3);
  if (qword_18BD0 != -1) {
    swift_once(&qword_18BD0, sub_95E4);
  }
  uint64_t v4 = static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)(qword_194D8, v2, v3);
  uint64_t v6 = v5;
  uint64_t v7 = sub_2C70(&qword_192F0);
  RCHChildFlowProducersAsync.appResolutionFlowProducer.setter(v4, v6, v7);
  if (qword_18BF8 != -1) {
    swift_once(&qword_18BF8, sub_E074);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_3E10(v8, (uint64_t)qword_192D8);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "AppResolution completion set.", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  sub_E270((uint64_t)a1, (uint64_t)v16);
  unint64_t v13 = sub_E2B4();
  uint64_t v14 = static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)( v16,  &_s20HandleIntentStrategyVN,  v13);
  RCHChildFlowProducersAsync.handleIntentFlowProducer.setter(v14);
  _s20HandleIntentStrategyVwxx_0(a1);
  return sub_E2F0(v16);
}

uint64_t sub_E270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_E2B4()
{
  unint64_t result = qword_192F8;
  if (!qword_192F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10B18, &_s20HandleIntentStrategyVN);
    atomic_store(result, (unint64_t *)&qword_192F8);
  }

  return result;
}

void *sub_E2F0(void *a1)
{
  return a1;
}

void ClockFlowFactory.makeFlowFrom(parse:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Parse(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (void *)((char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)v30 - v8;
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)v30 - v10;
  if (qword_18C00 != -1) {
    swift_once(&qword_18C00, sub_E60C);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_3E10(v12, (uint64_t)qword_19300);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v15 = sub_F0E4((uint64_t)v11);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = sub_75DC(12LL);
    v30[1] = a1;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = sub_75DC(32LL);
    v30[0] = v13;
    uint64_t v32 = v14;
    uint64_t v21 = v20;
    uint64_t v34 = v20;
    uint64_t v31 = v6;
    *(_DWORD *)uint64_t v19 = 136315138;
    v32(v9, v11, v2);
    uint64_t v22 = String.init<A>(describing:)(v9, v2);
    unint64_t v24 = v23;
    uint64_t v33 = sub_E8EC(v22, v23, &v34);
    uint64_t v6 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v24);
    sub_F0C8();
    _os_log_impl(&dword_0, v16, v17, "Making flow from parse: %s", v19, 0xCu);
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    sub_4200(v21);
    sub_4200((uint64_t)v19);
  }

  else
  {
    sub_F0C8();
  }

  sub_F0E4((uint64_t)v6);
  uint64_t v25 = (*(uint64_t (**)(void *, uint64_t))(v3 + 88))(v6, v2);
  if ((_DWORD)v25 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(void *, uint64_t))(v3 + 96))(v6, v2);
    swift_unknownObjectRelease(*v6);
    goto LABEL_10;
  }

  if ((_DWORD)v25 == enum case for Parse.uso(_:))
  {
    sub_F0D8();
LABEL_10:
    sub_A4C4();
    if ((v26 & 1) != 0) {
      sub_E654();
    }
    goto LABEL_15;
  }

  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_0, v27, v28, "ClockFlowPlugin cannot make flow from the provided parse. Exiting.", v29, 2u);
    sub_4200((uint64_t)v29);
  }

  sub_F0D8();
LABEL_15:
  sub_CC7C();
}

uint64_t sub_E60C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_4140(v0, qword_19300);
  sub_3E10(v0, (uint64_t)qword_19300);
  return static SiriTimeLog.clockFlow.getter();
}

void sub_E654()
{
  uint64_t v0 = sub_2C70(&qword_193C0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v25[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_2C70(&qword_192F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25[-1] - v9;
  if (qword_18C00 != -1) {
    swift_once(&qword_18C00, sub_E60C);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = sub_3E10(v11, (uint64_t)qword_19300);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)sub_75DC(2LL);
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "ClockFlowFactory: making showClockFlow.", v15, 2u);
    sub_4200((uint64_t)v15);
  }

  type metadata accessor for ApplicationContext(0LL);
  uint64_t v16 = static ApplicationContext.shared.getter();
  ApplicationContext.deviceState.getter(v25);
  swift_release(v16);
  sub_E0BC(v25);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v17 = sub_2C70(&qword_193C8);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = RCHChildFlowFactory.init(producers:)(v8);
  swift_retain(v18);
  uint64_t v19 = sub_2C70(&qword_193D0);
  uint64_t v20 = sub_F088(&qword_193D8, &qword_193D0, (uint64_t)&unk_10D48);
  RCHFlowFactory.init(strategy:childFlowFactory:)(v20, v18, v19, v20);
  uint64_t v21 = RCHFlowFactory.makeAppResolvingRCHFlow()(v0);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v25[0] = v21;
  uint64_t v22 = sub_2C70(&qword_193E0);
  uint64_t v23 = sub_F088(&qword_193E8, &qword_193E0, (uint64_t)&protocol conformance descriptor for AnyValueFlow<A>);
  Flow.eraseToAnyFlow()(v22, v23);
  swift_release(v21);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  sub_CC7C();
}

uint64_t sub_E8EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_E9BC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_C9A4((uint64_t)v12, *a3);
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
      sub_C9A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  _s20HandleIntentStrategyVwxx_0(v12);
  return v7;
}

void *sub_E9BC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_EB10((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      unint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    unint64_t result = sub_EBD4(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_EB10(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_EBD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_EC68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_EE3C(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_EE3C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_EC68(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  uint64_t v5 = sub_EDD8(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_EDD8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_2C70(&qword_193B8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_EE3C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_2C70(&qword_193B8);
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
  os_log_type_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_EFD4(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_EF10(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_EF10(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_EFD4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

ValueMetadata *type metadata accessor for ClockFlowFactory()
{
  return &type metadata for ClockFlowFactory;
}

uint64_t type metadata accessor for ClockFlowProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC15ClockFlowPlugin17ClockFlowProvider);
}

uint64_t sub_F088(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_71E0(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_F0C8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_F0D8()
{
  return v1(v2, v0);
}

uint64_t sub_F0E4(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t type metadata accessor for TimeSuggestionsCATsSimple(uint64_t a1)
{
  uint64_t result = qword_193F0;
  if (!qword_193F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TimeSuggestionsCATsSimple);
  }
  return result;
}

uint64_t sub_F128(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_194F0);
}

uint64_t sub_F164()
{
  return type metadata accessor for TimeSuggestionsCATsSimple(0LL);
}

BOOL sub_F16C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int sub_F178(Swift::UInt a1)
{
  return Hasher._finalize()();
}

void sub_F1BC(int a1, Swift::UInt a2)
{
}

Swift::Int sub_F1E0(uint64_t a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

void ShowClockIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
}

id ShowClockIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntent();
  return objc_msgSendSuper2(&v2, "init");
}

void ShowClockIntent.init(coder:)()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ShowClockIntent();
  sub_FC34((uint64_t)v7.super_class, "initWithCoder:", v1, v2, v3, v4, v5, v6, v7);
  sub_FC2C();
  sub_FC54();
}

void ShowClockIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    sub_FC84();
  }

  else
  {
    NSString v6 = 0LL;
  }

  [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  sub_FC48();
}

void ShowClockIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    sub_FC84();
  }

  else
  {
    NSString v5 = 0LL;
  }

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ShowClockIntent();
  objc_msgSendSuper2(&v6, "initWithIdentifier:backingStore:", v5, a3);

  sub_FC74();
}

uint64_t ShowClockIntent.__allocating_init(domain:verb:parametersByName:)()
{
  if (v3)
  {
    v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_FC84();
  }

  else
  {
    v4.super.Class isa = 0LL;
  }

  [sub_FC40() initWithDomain:v0 verb:v2 parametersByName:v4.super.isa];
  sub_FC2C();

  return v1;
}

void *ShowClockIntent.init(domain:verb:parametersByName:)()
{
  if (v3)
  {
    v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_FC84();
  }

  else
  {
    v4.super.Class isa = 0LL;
  }

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ShowClockIntent();
  objc_msgSendSuper2(&v6, "initWithDomain:verb:parametersByName:", v0, v2, v4.super.isa);
  sub_FC2C();

  return v1;
}

id ShowClockIntent.__deallocating_deinit()
{
  return sub_FB58(type metadata accessor for ShowClockIntent);
}

unint64_t ShowClockIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0LL;
  }
  return result;
}

BOOL sub_F630(uint64_t *a1, uint64_t *a2)
{
  return sub_F16C(*a1, *a2);
}

Swift::Int sub_F63C()
{
  return sub_F178(*v0);
}

void sub_F644(int a1)
{
}

Swift::Int sub_F64C(uint64_t a1)
{
  return sub_F1E0(a1, *v1);
}

unint64_t sub_F654@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ShowClockIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_F684(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ShowClockIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ShowClockIntentResponse_code;
  sub_FC8C(v0 + OBJC_IVAR___ShowClockIntentResponse_code, (uint64_t)v3, 0LL);
  return *(void *)v1;
}

uint64_t sub_F714(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___ShowClockIntentResponse_code);
  uint64_t result = sub_FC8C((uint64_t)v3, (uint64_t)v5, 1LL);
  *uint64_t v3 = a1;
  return result;
}

char *ShowClockIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  objc_super v6 = &v5[OBJC_IVAR___ShowClockIntentResponse_code];
  sub_FC8C((uint64_t)&v5[OBJC_IVAR___ShowClockIntentResponse_code], (uint64_t)v9, 1LL);
  *(void *)objc_super v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for ShowClockIntent()
{
  return objc_opt_self(&OBJC_CLASS___ShowClockIntent);
}

id ShowClockIntentResponse.__allocating_init()()
{
  return [sub_FC40() init];
}

id ShowClockIntentResponse.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)sub_FCC0(OBJC_IVAR___ShowClockIntentResponse_code);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for ShowClockIntentResponse()
{
  return objc_opt_self(&OBJC_CLASS___ShowClockIntentResponse);
}

uint64_t ShowClockIntentResponse.__allocating_init(coder:)()
{
  id v1 = sub_FC40();
  sub_FC94(v1, "initWithCoder:");
  sub_FC2C();
  return v0;
}

void ShowClockIntentResponse.init(coder:)()
{
  v7.receiver = v0;
  v7.super_class = (Class)sub_FCC0(OBJC_IVAR___ShowClockIntentResponse_code);
  sub_FC34((uint64_t)v7.super_class, "initWithCoder:", v1, v2, v3, v4, v5, v6, v7);
  sub_FC2C();
  sub_FC54();
}

uint64_t ShowClockIntentResponse.__allocating_init(backingStore:)()
{
  id v1 = sub_FC40();
  sub_FC94(v1, "initWithBackingStore:");
  sub_FC2C();
  return v0;
}

void ShowClockIntentResponse.init(backingStore:)()
{
  v7.receiver = v0;
  v7.super_class = (Class)sub_FCC0(OBJC_IVAR___ShowClockIntentResponse_code);
  sub_FC34((uint64_t)v7.super_class, "initWithBackingStore:", v1, v2, v3, v4, v5, v6, v7);
  sub_FC2C();
  sub_FC54();
}

void ShowClockIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    Dictionary._bridgeToObjectiveC()();
    sub_FCA8();
  }

  id v1 = sub_FC40();
  sub_FC94(v1, "initWithPropertiesByName:");
  sub_FC2C();
  sub_FC48();
}

void ShowClockIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ShowClockIntentResponse_code] = 0LL;
  if (a1)
  {
    Dictionary._bridgeToObjectiveC()();
    sub_FCA8();
  }

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  id v8 = sub_FC34((uint64_t)v9.super_class, "initWithPropertiesByName:", v2, v3, v4, v5, v6, v7, v9);
  sub_FC2C();
  if (v1) {

  }
  sub_FC74();
}

id ShowClockIntentResponse.__deallocating_deinit()
{
  return sub_FB58(type metadata accessor for ShowClockIntentResponse);
}

id sub_FB58(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_FB8C()
{
  unint64_t result = qword_19448;
  if (!qword_19448)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ShowClockIntentResponseCode,  &type metadata for ShowClockIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_19448);
  }

  return result;
}

uint64_t sub_FBC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ShowClockIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_FBF0(uint64_t *a1)
{
  return sub_F714(*a1);
}

ValueMetadata *type metadata accessor for ShowClockIntentResponseCode()
{
  return &type metadata for ShowClockIntentResponseCode;
}

void sub_FC2C()
{
}

id sub_FC34( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

id sub_FC40()
{
  return objc_allocWithZone(v0);
}

  ;
}

  ;
}

NSString sub_FC60()
{
  return String._bridgeToObjectiveC()();
}

  ;
}

uint64_t sub_FC84()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_FC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

id sub_FC94(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

NSString sub_FC9C()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_FCA8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_FCB4()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_FCC0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0LL;
  return type metadata accessor for ShowClockIntentResponse();
}

uint64_t sub_FCC8()
{
  return swift_bridgeObjectRelease(v0);
}