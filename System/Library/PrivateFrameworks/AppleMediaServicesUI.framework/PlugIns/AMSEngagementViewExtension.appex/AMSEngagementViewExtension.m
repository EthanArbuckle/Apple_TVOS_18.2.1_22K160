id sub_10000519C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id result;
  uint64_t *v18;
  objc_class *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t MetatypeMetadata;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void v43[3];
  _BYTE v44[8];
  void v45[4];
  void v46[3];
  objc_class *v47;
  objc_super v48;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin();
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  objc_allocWithZone(&OBJC_CLASS____UIContentUnavailableView);
  v9 = v3;
  v10 = sub_100005F7C();
  result = sub_100005D44(v13, v14, v15, v16, v10, v11, v12);
  if (result)
  {
    *(void *)&v9[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView] = result;
    *(void *)&v9[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_error] = a1;
    v18 = (uint64_t *)&v9[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction];
    *v18 = a2;
    v18[1] = a3;
    swift_errorRetain(a1);
    sub_100005DDC(a2, a3);

    v19 = (objc_class *)type metadata accessor for ErrorViewController();
    v48.receiver = v9;
    v48.super_class = v19;
    v20 = objc_msgSendSuper2(&v48, "initWithNibName:bundle:", 0, 0);
    v21 = sub_100005DEC((uint64_t *)&unk_100011060);
    v22 = type metadata accessor for LogMessage(0LL);
    v23 = swift_allocObject( v21,  ((*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v22 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v23 + 16) = xmmword_10000A200;
    v47 = v19;
    v46[0] = v20;
    v24 = v20;
    v25 = (id)AMSLogKey(v24);
    if (v25)
    {
      v27 = v25;
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25, v26);
      v42 = a1;
      v29 = v24;
      v30 = a2;
      v31 = a3;
      v33 = v32;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      sub_100005F5C();
      sub_100005F38();
      MetatypeMetadata = swift_getMetatypeMetadata();
      sub_100005F24(MetatypeMetadata);
      sub_100005FA4();
      v35._countAndFlagsBits = 5972026LL;
      v35._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v35);
      v45[3] = &type metadata for String;
      v45[0] = v28;
      v45[1] = v33;
      a3 = v31;
      a2 = v30;
      v24 = v29;
      a1 = v42;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v45);
      sub_100005FA4();
      v36 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      sub_100005F5C();
      sub_100005F38();
      v37 = swift_getMetatypeMetadata();
      sub_100005F24(v37);
      sub_100005FA4();
      v36 = 58LL;
    }

    v38 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_100005E90(v46);
    LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010000A710LL);
    swift_getErrorValue(a1, v44, v43);
    v39 = Error.localizedDescription.getter(v43[1], v43[2]);
    v47 = (objc_class *)&type metadata for String;
    v46[0] = v39;
    v46[1] = v40;
    static LogMessage.safe(_:)(v46);
    sub_100005E50((uint64_t)v46);
    sub_100006080(v23);
    sub_100005EB0(a2, a3);
    swift_errorRelease(a1);
    swift_bridgeObjectRelease(v23);

    return v24;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1000054A4()
{
  id v1 = objc_allocWithZone(&OBJC_CLASS____UIContentUnavailableView);
  uint64_t v2 = sub_100005F7C();
  id v9 = sub_100005D44(v5, v6, v7, v8, v2, v3, v4);
  if (!v9) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView] = v9;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010000A810LL,  "AMSEngagementViewExtension/ErrorViewController.swift",  52LL,  2LL,  47LL,  0);
  __break(1u);
}

id sub_100005584(uint64_t a1)
{
  id v2 = sub_100005FAC(a1, "parentViewController");
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 navigationItem];

    return v4;
  }

  else
  {
    v6.receiver = v1;
    v6.super_class = (Class)type metadata accessor for ErrorViewController();
    return objc_msgSendSuper2(&v6, "navigationItem");
  }
}

void sub_10000560C()
{
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for ErrorViewController();
  id v7 = sub_100005F74((uint64_t)v10.super_class, "loadView", v1, v2, v3, v4, v5, v6, v10);
  id v8 = sub_100005FAC((uint64_t)v7, "view");
  id v9 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryBackground");
  sub_100005F04((uint64_t)v9, "setBackgroundColor:");
}

void sub_1000056C4()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ErrorViewController();
  sub_100005F74((uint64_t)v7.super_class, "viewDidLoad", v1, v2, v3, v4, v5, v6, v7);
  sub_100005804();
}

id sub_100005728()
{
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for ErrorViewController();
  id v7 = sub_100005F74((uint64_t)v19.super_class, "viewWillLayoutSubviews", v1, v2, v3, v4, v5, v6, v19);
  id v8 = *(void **)&v0[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView];
  id v9 = sub_100005FAC((uint64_t)v7, "view");
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  return objc_msgSend(v8, "setFrame:", v11, v13, v15, v17);
}

void sub_100005804()
{
  uint64_t v1 = sub_100005FBC(0xD000000000000015LL, (void *)0x800000010000A730LL);
  uint64_t v3 = v2;
  uint64_t v4 = sub_100005FBC(0xD000000000000014LL, (void *)0x800000010000A750LL);
  uint64_t v6 = v5;
  sub_1000058F0(v1, v3, 0LL, 0LL, v4, v5);
  swift_bridgeObjectRelease(v3);
  uint64_t v7 = swift_bridgeObjectRelease(v6);
  id v8 = sub_100005F6C(v7, "view");
  [v8 addSubview:*(void *)(v0 + OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView)];
}

void sub_1000058F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v14 = sub_100005F6C(a1, "buttonTitle");
  if (v14)
  {
    sub_100005F9C();
    sub_100005F18();
    if (!a6)
    {
LABEL_31:
      sub_100005F10();
      goto LABEL_32;
    }

    if (v8 == a5 && v7 == a6)
    {
      id v14 = (id)sub_100005F10();
    }

    else
    {
      char v16 = sub_100005FB4(v8, v7, a5, a6);
      id v14 = (id)sub_100005F10();
      if ((v16 & 1) == 0) {
        goto LABEL_32;
      }
    }
  }

  else if (a6)
  {
    goto LABEL_32;
  }

  id v17 = sub_100005F6C((uint64_t)v14, "message");
  if (!v17)
  {
    if (!a4) {
      goto LABEL_23;
    }
LABEL_32:
    uint64_t v22 = swift_allocObject(&unk_10000C558, 24LL, 7LL);
    swift_unknownObjectWeakInit(v22 + 16, v6);
    aBlock[4] = sub_100005EE4;
    uint64_t v33 = v22;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100007720;
    aBlock[3] = &unk_10000C570;
    v23 = _Block_copy(aBlock);
    uint64_t v24 = swift_release(v33);
    sub_100005F04(v24, "setButtonAction:");
    _Block_release(v23);
    if (a6)
    {
      NSString v25 = String._bridgeToObjectiveC()();
      v26 = v25;
    }

    else
    {
      v26 = 0LL;
    }

    sub_100005F04((uint64_t)v25, "setButtonTitle:");

    if (a4)
    {
      NSString v27 = String._bridgeToObjectiveC()();
      v28 = v27;
    }

    else
    {
      v28 = 0LL;
    }

    sub_100005F04((uint64_t)v27, "setMessage:");

    if (a2)
    {
      NSString v29 = String._bridgeToObjectiveC()();
      v30 = v29;
    }

    else
    {
      v30 = 0LL;
    }

    sub_100005F04((uint64_t)v29, "setTitle:");

    return;
  }

  sub_100005F9C();
  sub_100005F18();
  if (!a4) {
    goto LABEL_31;
  }
  if (v8 == a3 && v7 == a4)
  {
    id v17 = (id)sub_100005F10();
  }

  else
  {
    char v19 = sub_100005FB4(v8, v7, a3, a4);
    id v17 = (id)sub_100005F10();
    if ((v19 & 1) == 0) {
      goto LABEL_32;
    }
  }

LABEL_23:
  if (!sub_100005F6C((uint64_t)v17, "title"))
  {
    if (!a2) {
      return;
    }
    goto LABEL_32;
  }

  sub_100005F9C();
  sub_100005F18();
  if (!a2) {
    goto LABEL_31;
  }
  if (v8 == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease(v7);
    return;
  }

  char v21 = sub_100005FB4(v8, v7, a1, a2);
  sub_100005F10();
  if ((v21 & 1) == 0) {
    goto LABEL_32;
  }
}

void sub_100005BA0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    uint64_t v4 = *(void (**)(void))(Strong + OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction);
    uint64_t v5 = *(void *)(Strong + OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction + 8);
    sub_100005DDC((uint64_t)v4, v5);

    if (v4)
    {
      v4();
      sub_100005EB0((uint64_t)v4, v5);
    }
  }

void sub_100005C24()
{
}

void sub_100005C5C()
{
}

id sub_100005CAC()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ErrorViewController();
  return sub_100005F74((uint64_t)v8.super_class, "dealloc", v1, v2, v3, v4, v5, v6, v8);
}

uint64_t type metadata accessor for ErrorViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AMSEngagementViewExtension19ErrorViewController);
}

id sub_100005D44(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a6)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }

  else
  {
    NSString v14 = 0LL;
  }

  id v15 = objc_msgSend(v7, "initWithFrame:title:style:", v14, a7, a1, a2, a3, a4);

  return v15;
}

uint64_t sub_100005DDC(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_100005DEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_100005E2C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100005E50(uint64_t a1)
{
  uint64_t v2 = sub_100005DEC((uint64_t *)&unk_100010D20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005E90(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005EB0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100005EC0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100005EE4()
{
}

uint64_t sub_100005EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005EFC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_100005F04(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_100005F10()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_100005F18()
{
}

uint64_t sub_100005F24(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 160);
}

uint64_t sub_100005F38()
{
  uint64_t v1 = *(void *)(v0 - 104);
  uint64_t v2 = sub_100005E2C((void *)(v0 - 128), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

void sub_100005F5C()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

id sub_100005F6C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

id sub_100005F74( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_100005F7C()
{
  return 0LL;
}

uint64_t sub_100005F9C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005FA4()
{
  return sub_100005E50(v0 - 160);
}

id sub_100005FAC(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100005FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_100005FBC(uint64_t a1, void *a2)
{
  uint64_t v4 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v9._object = (void *)0xE000000000000000LL;
  v5._uint64_t countAndFlagsBits = a1;
  v5._object = a2;
  v6._uint64_t countAndFlagsBits = 0LL;
  v6._object = (void *)0xE000000000000000LL;
  v9._uint64_t countAndFlagsBits = 0LL;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, v4, v6, v9)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100006050()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for Localizations()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AMSEngagementViewExtension13Localizations);
}

uint64_t sub_100006080(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.error.getter();
  return sub_1000062C4(v2, a1);
}

uint64_t sub_1000060A0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000025LL,  0x800000010000A8A0LL,  0x6C6172656E6567LL,  0xE700000000000000LL);
  qword_100010E28 = result;
  return result;
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2)
{
  if (qword_100010CD0 != -1) {
    swift_once(&qword_100010CD0, sub_1000060A0);
  }
  uint64_t v4 = qword_100010E28;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100010E28, (os_log_type_t)a1);
  if ((_DWORD)result)
  {
    char v6 = static LogMessage.isRedactionEnabled.getter();
    uint64_t v7 = static LogMessage.describe(contentsOf:withRedaction:separator:)(a2, v6 & 1, 32LL, 0xE100000000000000LL);
    uint64_t v9 = v8;
    uint64_t v10 = sub_100005DEC(&qword_100010EC8);
    uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
    *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000A270;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10000624C();
    *(void *)(v11 + 32) = v7;
    *(void *)(v11 + 40) = v9;
    os_log(_:dso:log:type:_:)("%{public}@", 10LL, 2LL, &_mh_execute_header, v4, a1, v11);
    return swift_bridgeObjectRelease(v11);
  }

  return result;
}

uint64_t sub_10000620C(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.default.getter();
  return sub_1000062C4(v2, a1);
}

uint64_t type metadata accessor for Log()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AMSEngagementViewExtension3Log);
}

unint64_t sub_10000624C()
{
  unint64_t result = qword_100010ED0;
  if (!qword_100010ED0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010ED0);
  }

  return result;
}

unint64_t sub_100006288()
{
  unint64_t result = qword_100010ED8;
  if (!qword_100010ED8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100010ED8);
  }

  return result;
}

uint64_t sub_1000062C4(uint64_t a1, uint64_t a2)
{
  return sub_1000060FC(a1, a2);
}

uint64_t sub_1000062CC()
{
  return 1LL;
}

void sub_1000062D4()
{
}

void sub_100006300()
{
}

void sub_100006324()
{
}

void sub_100006354(uint64_t a1)
{
}

uint64_t sub_100006380(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  Swift::String v5 = v4;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  uint64_t v10 = __chkstk_darwin();
  double v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3 >> 60 == 15
    || (sub_1000076EC(v10, &qword_100011090, &OBJC_CLASS___AMSSnapshotBag_ptr),
        sub_100007414(a2, a3),
        (id v13 = sub_100006704(a2, a3)) == 0LL))
  {
    id v13 = [(id)objc_opt_self(AMSUIEngagementTask) createBagForSubProfile];
  }

  uint64_t v14 = sub_100005DEC((uint64_t *)&unk_100011060);
  uint64_t v15 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))
        - *(void *)(v15 + 72)
        + 8LL * *(void *)(v15 + 72),
          *(unsigned __int8 *)(v15 + 80) | 7LL);
  *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000A2A0;
  *((void *)&v45 + 1) = type metadata accessor for RemoteEngagementPresenter();
  *(void *)&__int128 v44 = v5;
  uint64_t v17 = swift_retain(v5);
  id v18 = (id)AMSLogKey(v17);
  if (v18)
  {
    v20 = v18;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);
    v42 = a1;
    uint64_t v22 = a4;
    uint64_t v23 = v21;
    uint64_t v25 = v24;

    sub_1000076F4();
    sub_100007670();
    sub_10000763C();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100007628(MetatypeMetadata);
    sub_1000076AC();
    sub_100007660();
    v43[3] = &type metadata for String;
    v43[0] = v23;
    v43[1] = v25;
    a4 = v22;
    a1 = v42;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
    sub_1000076AC();
    uint64_t v27 = 93LL;
  }

  else
  {
    sub_100007708();
    sub_100007670();
    sub_10000763C();
    uint64_t v28 = swift_getMetatypeMetadata();
    sub_100007628(v28);
    sub_1000076AC();
    uint64_t v27 = 58LL;
  }

  unint64_t v29 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v27);
  LogMessage.init(stringInterpolation:)(v12);
  sub_100005E90(&v44);
  uint64_t v30 = LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x800000010000A9C0LL);
  *((void *)&v45 + 1) = sub_1000076EC(v30, &qword_100011080, &OBJC_CLASS___AMSEngagementRequest_ptr);
  *(void *)&__int128 v44 = a1;
  id v31 = a1;
  sub_1000076CC();
  sub_1000076D8();
  LogMessage.init(stringLiteral:)(0x3A676162202CLL, 0xE600000000000000LL);
  if (v13)
  {
    *((void *)&v45 + 1) = swift_getObjectType(v13);
    *(void *)&__int128 v44 = v13;
    id v32 = v13;
  }

  else
  {
    id v32 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
  }

  swift_unknownObjectRetain(v32);
  sub_1000076CC();
  sub_1000076D8();
  uint64_t v33 = LogMessage.init(stringLiteral:)(0x746E65696C63202CLL, 0xEE003A6F666E6920LL);
  if (a4)
  {
    *((void *)&v45 + 1) = sub_1000076EC(v33, &qword_100011088, &OBJC_CLASS___AMSProcessInfo_ptr);
    *(void *)&__int128 v44 = a4;
  }

  else
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
  }

  type metadata accessor for Log();
  id v34 = a4;
  static LogMessage.safe(_:)(&v44);
  sub_1000076D8();
  sub_10000620C(v16);
  swift_bridgeObjectRelease(v16);
  uint64_t v35 = v5[3];
  v5[3] = v13;
  swift_unknownObjectRelease(v35);
  v36 = (void *)v5[4];
  v5[4] = a4;
  id v37 = v34;

  v38 = (void *)v5[5];
  v5[5] = v31;
  id v39 = v31;

  return 0LL;
}

id sub_100006704(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];
  sub_100007458(a1, a2);

  return v7;
}

void sub_100006778()
{
  uint64_t v2 = v0;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = (uint64_t (*)())v2[3];
  if (v5 && (char v6 = (void *)v2[5]) != 0LL)
  {
    id v7 = (void *)v2[4];
    uint64_t v8 = sub_1000076A0((uint64_t)&unk_10000C638);
    sub_100007680(v8);
    v36 = v6;
    id v37 = v5;
    uint64_t v38 = (uint64_t)v7;
    uint64_t v39 = (uint64_t)sub_100007398;
    uint64_t v40 = v1;
    char v41 = 1;
    id v9 = v7;
    swift_retain(v1);
    swift_unknownObjectRetain(v5);
    uint64_t v10 = v6;
    SyncEvent.post(_:)(&v36);
    sub_100007714();

    swift_unknownObjectRelease(v5);
  }

  else
  {
    uint64_t v11 = sub_100005DEC((uint64_t *)&unk_100011060);
    uint64_t v12 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v13 = *(void *)(v12 + 72);
    uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
    uint64_t v15 = (v14 + 32) & ~v14;
    uint64_t v16 = swift_allocObject(v11, v15 + 2 * v13, v14 | 7);
    *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000A2B0;
    uint64_t v17 = v16 + v15;
    uint64_t v39 = type metadata accessor for RemoteEngagementPresenter();
    v36 = v2;
    uint64_t v18 = swift_retain(v2);
    id v19 = (id)AMSLogKey(v18);
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);
      uint64_t v24 = v23;

      sub_1000076F4();
      sub_1000076E0();
      uint64_t v25 = v39;
      v26 = sub_100005E2C(&v36, v39);
      uint64_t DynamicType = swift_getDynamicType(v26, v25, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v42 = DynamicType;
      sub_100007690();
      sub_100007698();
      sub_100007660();
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v42 = v22;
      uint64_t v43 = v24;
      sub_100007690();
      sub_100007698();
      uint64_t v28 = 93LL;
    }

    else
    {
      sub_100007708();
      sub_1000076E0();
      uint64_t v29 = v39;
      uint64_t v30 = sub_100005E2C(&v36, v39);
      uint64_t v31 = swift_getDynamicType(v30, v29, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v42 = v31;
      sub_100007690();
      sub_100007698();
      uint64_t v28 = 58LL;
    }

    unint64_t v32 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
    LogMessage.init(stringInterpolation:)(v4);
    type metadata accessor for Log();
    sub_100005E90(&v36);
    LogMessage.init(stringLiteral:)(0xD00000000000003ALL, 0x800000010000A950LL);
    sub_100006080(v16);
    swift_bridgeObjectRelease(v16);
    unint64_t v33 = sub_100007330();
    uint64_t v34 = swift_allocError(&unk_10000C6D0, v33, 0LL, 0LL);
    uint64_t v35 = sub_1000076A0((uint64_t)&unk_10000C638);
    sub_100007680(v35);
    v36 = (void *)v34;
    id v37 = sub_100007390;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    uint64_t v38 = v17;
    char v41 = 2;
    swift_retain(v17);
    SyncEvent.post(_:)(&v36);
    swift_errorRelease(v34);
    sub_100007714();
  }

uint64_t sub_100006A60(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = sub_100007330();
    uint64_t v5 = swift_allocError(&unk_10000C6D0, v4, 0LL, 0LL);
    v6[0] = 0LL;
    v6[1] = v5;
    memset(&v6[2], 0, 24);
    char v7 = 0;
    SyncEvent.post(_:)(v6);
    swift_errorRelease(v5);
    return swift_release(v3);
  }

  return result;
}

uint64_t sub_100006AFC(void *a1, uint64_t a2, uint64_t a3)
{
  char v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a3 += 16LL;
  swift_beginAccess(a3, v45, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a3);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = sub_100005DEC((uint64_t *)&unk_100011060);
    uint64_t v11 = type metadata accessor for LogMessage(0LL);
    uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
          + 5LL * *(void *)(*(void *)(v11 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000A2C0;
    *((void *)&v40 + 1) = type metadata accessor for RemoteEngagementPresenter();
    *(void *)&__int128 v39 = v9;
    uint64_t v13 = swift_retain(v9);
    id v14 = (id)AMSLogKey(v13);
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);
      uint64_t v19 = v18;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v20._uint64_t countAndFlagsBits = 0LL;
      v20._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v20);
      uint64_t v21 = *((void *)&v40 + 1);
      uint64_t v22 = sub_100005E2C(&v39, *((uint64_t *)&v40 + 1));
      uint64_t DynamicType = swift_getDynamicType(v22, v21, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005E50((uint64_t)v43);
      v24._uint64_t countAndFlagsBits = 5972026LL;
      v24._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v24);
      uint64_t MetatypeMetadata = &type metadata for String;
      v43[0] = v17;
      v43[1] = v19;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005E50((uint64_t)v43);
      uint64_t v25 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v26._uint64_t countAndFlagsBits = 0LL;
      v26._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v26);
      uint64_t v27 = *((void *)&v40 + 1);
      uint64_t v28 = sub_100005E2C(&v39, *((uint64_t *)&v40 + 1));
      uint64_t v29 = swift_getDynamicType(v28, v27, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = v29;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005E50((uint64_t)v43);
      uint64_t v25 = 58LL;
    }

    unint64_t v30 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v25);
    LogMessage.init(stringInterpolation:)(v7);
    sub_100005E90(&v39);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL, 0x800000010000A990LL);
    if (a1)
    {
      *((void *)&v40 + 1) = sub_1000073DC(0LL, &qword_100011078, &OBJC_CLASS___AMSEngagementResult_ptr);
      *(void *)&__int128 v39 = a1;
    }

    else
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
    }

    id v31 = a1;
    static LogMessage.safe(_:)(&v39);
    sub_100005E50((uint64_t)&v39);
    LogMessage.init(stringLiteral:)(0x3A726F727265202CLL, 0xE800000000000000LL);
    if (a2)
    {
      swift_getErrorValue(a2, v38, &v36);
      uint64_t v32 = v36;
      uint64_t v33 = v37;
      *((void *)&v40 + 1) = v37;
      uint64_t v34 = sub_1000073A0(&v39);
      (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16LL))(v34, v32, v33);
    }

    else
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
    }

    type metadata accessor for Log();
    static LogMessage.safe(_:)(&v39);
    sub_100005E50((uint64_t)&v39);
    sub_10000620C(v12);
    swift_bridgeObjectRelease(v12);
    *(void *)&__int128 v39 = a1;
    *((void *)&v39 + 1) = a2;
    uint64_t v41 = 0LL;
    __int128 v40 = 0uLL;
    char v42 = 0;
    id v35 = v31;
    swift_errorRetain(a2);
    SyncEvent.post(_:)(&v39);

    swift_errorRelease(a2);
    return swift_release(v9);
  }

  return result;
}

uint64_t sub_100006E7C()
{
  return v0;
}

uint64_t sub_100006EB0()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t type metadata accessor for RemoteEngagementPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AMSEngagementViewExtension25RemoteEngagementPresenter);
}

uint64_t sub_100006EF0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void *sub_100006F20(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v8 = result;
  switch(a6)
  {
    case 2:
      swift_errorRetain(result);
      return (void *)sub_100005DDC(a2, (uint64_t)a3);
    case 1:
      id v11 = a3;
      swift_retain(a5);
      id v12 = v8;
      return (void *)swift_unknownObjectRetain(a2);
    case 0:
      id v9 = result;
      return (void *)swift_errorRetain(a2);
  }

  return result;
}

void sub_100006FC4(uint64_t a1)
{
}

void sub_100006FDC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 2:
      swift_errorRelease(a1);
      sub_100005EB0(a2, (uint64_t)a3);
      break;
    case 1:

      swift_unknownObjectRelease(a2);
      swift_release(a5);

      break;
    case 0:

      swift_errorRelease(a2);
      break;
  }

uint64_t sub_100007080(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(_BYTE *)(a2 + 40);
  sub_100006F20(*(void **)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_1000070F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(_BYTE *)(a2 + 40);
  sub_100006F20(*(void **)a2, v4, v5, v6, v7, v8);
  id v9 = *(void **)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  id v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_100006FDC(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_10000717C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t sub_100007190(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(_BYTE *)(a2 + 40);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_100006FDC(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_1000071E0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t sub_100007220(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 41) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 41) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 40) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100007270(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_10000727C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.State()
{
}

unint64_t sub_100007294()
{
  unint64_t result = qword_100011050;
  if (!qword_100011050)
  {
    uint64_t v1 = type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable(&unk_10000A388, v1);
    atomic_store(result, (unint64_t *)&qword_100011050);
  }

  return result;
}

void *sub_1000072D0()
{
  uint64_t v1 = sub_100005DEC(&qword_1000111D0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v0[2] = SyncEvent.init()();
  v0[3] = 0LL;
  v0[4] = 0LL;
  v0[5] = 0LL;
  return v0;
}

unint64_t sub_100007330()
{
  unint64_t result = qword_100011070;
  if (!qword_100011070)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000A4E4, &unk_10000C6D0);
    atomic_store(result, (unint64_t *)&qword_100011070);
  }

  return result;
}

uint64_t sub_10000736C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100007390()
{
  return sub_100006A60(v0);
}

uint64_t sub_100007398(void *a1, uint64_t a2)
{
  return sub_100006AFC(a1, a2, v2);
}

void *sub_1000073A0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_1000073DC(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100007414(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100007458(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000074AC()
{
  return 0LL;
}

void type metadata accessor for RemoteEngagementPresenter.CompletionError()
{
}

uint64_t getEnumTagSinglePayload for RemoteEngagementViewController.RemoteViewControllerProxyError( unsigned int *a1, int a2)
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

uint64_t sub_100007510(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100007550 + 4 * byte_10000A2D0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100007570 + 4 * byte_10000A2D5[v4]))();
  }
}

_BYTE *sub_100007550(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_100007570(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100007578(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100007580(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100007588(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100007590(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ConfigurationError()
{
}

unint64_t sub_1000075AC()
{
  unint64_t result = qword_100011098;
  if (!qword_100011098)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000A454, &unk_10000C760);
    atomic_store(result, (unint64_t *)&qword_100011098);
  }

  return result;
}

unint64_t sub_1000075EC()
{
  unint64_t result = qword_1000110A0;
  if (!qword_1000110A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000A4BC, &unk_10000C6D0);
    atomic_store(result, (unint64_t *)&qword_1000110A0);
  }

  return result;
}

uint64_t sub_100007628(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 144);
}

uint64_t sub_10000763C()
{
  uint64_t v1 = *(void *)(v0 - 88);
  uint64_t v2 = sub_100005E2C((void *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

void sub_100007660()
{
  v0._uint64_t countAndFlagsBits = 5972026LL;
  v0._object = (void *)0xE300000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

void sub_100007670()
{
  v0._uint64_t countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100007680(uint64_t a1)
{
  return swift_weakInit(a1 + 16, v1);
}

uint64_t sub_100007690()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 96);
}

uint64_t sub_100007698()
{
  return sub_100005E50(v0 - 96);
}

uint64_t sub_1000076A0(uint64_t a1)
{
  return swift_allocObject(a1, 24LL, 7LL);
}

uint64_t sub_1000076AC()
{
  return sub_100005E50(v0 - 144);
}

  ;
}

void sub_1000076C0()
{
}

uint64_t sub_1000076CC()
{
  return static LogMessage.safe(_:)(v0 - 112);
}

uint64_t sub_1000076D8()
{
  return sub_100005E50(v0 - 112);
}

void sub_1000076E0()
{
  v0._uint64_t countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_1000076EC(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_1000073DC(0LL, a2, a3);
}

uint64_t sub_1000076F4()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

  ;
}

uint64_t sub_100007708()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

uint64_t sub_100007714()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_100007720(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

Swift::Int sub_10000774C()
{
  return Hasher._finalize()();
}

Swift::Int sub_100007794(uint64_t a1)
{
  return Hasher._finalize()();
}

void sub_1000077D0()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v1, "viewDidLoad");
  sub_100007B84();
  sub_100009AB0();
  sub_100009B44();
  ViewControllerPresenter.viewDidLoad()();
  sub_100009B38();
}

void sub_1000078A8(char a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v3, "viewDidAppear:", a1 & 1);
  sub_100007CE8();
  sub_100009AB0();
  sub_100009B44();
  ViewControllerPresenter.viewDidAppear()();
  sub_100009B38();
}

uint64_t sub_100007944(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ViewWillDisappearReason(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = (objc_class *)type metadata accessor for RemoteEngagementViewController();
  v10.receiver = v1;
  v10.super_class = v7;
  objc_msgSendSuper2(&v10, "viewWillDisappear:", a1 & 1);
  static ViewWillDisappearReason.inferred(for:)(v1);
  sub_100009AB0();
  unint64_t v8 = sub_100009B44();
  ViewControllerPresenter.viewWillDisappear(forReason:)(v6, a1, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100007A50(char a1, SEL *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v10, *a2, a1 & 1);
  uint64_t v7 = sub_100009AB0();
  unint64_t v8 = sub_100009970();
  return a3(v7, v8);
}

id sub_100007B2C(void *a1)
{
  return [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:*a1];
}

void sub_100007B84()
{
  uint64_t v1 = sub_100005DEC(&qword_1000111C8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v10[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = *(void *)(*(void *)(v0
                             + OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter)
                 + 16LL);
  uint64_t v6 = sub_100009A9C((uint64_t)&unk_10000C850, 24LL);
  sub_100009AA4(v6);
  uint64_t v7 = sub_100005DEC(&qword_1000111D0);
  unint64_t v8 = sub_1000098E8();
  swift_retain(v5);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v10, v7, v8);
  EventEmitter.addObserver(on:singleUse:_:)(v10, 0LL, sub_1000098E0, v6, v7, v8);
  sub_100009B54();
  sub_100009B08();
  sub_100005E90(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100009ACC();
}

void sub_100007C88(uint64_t a1, uint64_t a2)
{
  a2 += 16LL;
  swift_beginAccess(a2, v5, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_100008B40((uint64_t)v6);
  }

void sub_100007CE8()
{
  id v1 = [v0 view];
  id v2 = [v1 window];

  if (v2)
  {
    uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
    id v4 = v2;
    id v5 = [v3 systemBlueColor];
    [v4 setTintColor:v5];

    id v6 = [v4 _rootSheetPresentationController];
    if (v6)
    {
      uint64_t v19 = v6;
      [v6 _setShouldScaleDownBehindDescendantSheets:0];
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    uint64_t v7 = sub_100005DEC((uint64_t *)&unk_100011060);
    uint64_t v8 = type metadata accessor for LogMessage(0LL);
    uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
         + 2LL * *(void *)(*(void *)(v8 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_10000A2B0;
    uint64_t v21 = type metadata accessor for RemoteEngagementViewController();
    v20[0] = v0;
    id v10 = (id)AMSLogKey(v0);
    if (v10)
    {
      uint64_t v12 = v10;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

      sub_100009B10();
      sub_1000076E0();
      uint64_t v13 = v21;
      char v14 = sub_100005E2C(v20, v21);
      sub_100009B00((uint64_t)v14, v13);
      swift_getMetatypeMetadata();
      sub_100009B4C();
      sub_100009AF8();
      sub_100007660();
      sub_100009B4C();
      sub_100009AF8();
      uint64_t v15 = 93LL;
    }

    else
    {
      sub_100009B20();
      sub_1000076E0();
      uint64_t v16 = v21;
      uint64_t v17 = sub_100005E2C(v20, v21);
      sub_100009B00((uint64_t)v17, v16);
      swift_getMetatypeMetadata();
      sub_100009B4C();
      sub_100009AF8();
      uint64_t v15 = 58LL;
    }

    unint64_t v18 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
    LogMessage.init(stringInterpolation:)(v0);
    type metadata accessor for Log();
    sub_100005E90(v20);
    LogMessage.init(stringLiteral:)(0xD000000000000032LL, 0x800000010000AB30LL);
    sub_100006080(v9);
    swift_bridgeObjectRelease(v9);
    sub_100009ACC();
  }

uint64_t sub_100007F90()
{
  id v1 = v0;
  sub_100005DEC(&qword_1000111B0);
  uint64_t v2 = Promise.__allocating_init()();
  id v3 = [v1 _remoteViewControllerProxy];
  if (v3)
  {
    id v4 = v3;
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    memset(v11, 0, sizeof(v11));
  }

  sub_10000985C((uint64_t)v11, (uint64_t)v12);
  if (!v12[3])
  {
    sub_100005E50((uint64_t)v12);
    goto LABEL_8;
  }

  uint64_t v5 = sub_100005DEC(&qword_1000111C0);
  if ((swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, v5, 6LL) & 1) == 0)
  {
LABEL_8:
    unint64_t v7 = sub_1000098A4();
    uint64_t v8 = swift_allocError( &type metadata for RemoteEngagementViewController.RemoteViewControllerProxyError,  v7,  0LL,  0LL);
    Promise.reject(_:)();
    swift_errorRelease(v8);
    return v2;
  }

  uint64_t v6 = v10;
  v12[0] = v10;
  Promise.resolve(_:)(v12);
  swift_unknownObjectRelease(v6);
  return v2;
}

void sub_1000080A0(char a1, void *a2, uint64_t a3)
{
  id v7 = [v3 presentedViewController];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2)
    {
      v9[4] = a2;
      v9[5] = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256LL;
      v9[2] = sub_100007720;
      v9[3] = &unk_10000C930;
      a2 = _Block_copy(v9);
      swift_retain(a3);
      sub_100009B08();
    }

    [v8 dismissViewControllerAnimated:a1 & 1 completion:a2];
    _Block_release(a2);
  }

  else if (a2)
  {
    ((void (*)(void))a2)();
  }

  sub_100009AB8();
}

void sub_100008170(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F90();
  uint64_t v5 = sub_100009A9C((uint64_t)&unk_10000C8F0, 32LL);
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = sub_100009A9C((uint64_t)&unk_10000C850, 24LL);
  sub_100009AA4(v6);
  uint64_t v7 = sub_1000073DC(0LL, &qword_100011148, &OBJC_CLASS___OS_dispatch_queue_ptr);
  id v8 = a1;
  swift_errorRetain(a2);
  uint64_t v9 = swift_retain(v6);
  v10[3] = v7;
  v10[4] = &protocol witness table for OS_dispatch_queue;
  v10[0] = static OS_dispatch_queue.main.getter(v9);
  Promise.then(perform:orCatchError:on:)(sub_10000984C, v5, sub_100009854, v6, v10);
  swift_release(v4);
  swift_release(v5);
  sub_100009B54();
  sub_100005E90(v10);
  sub_100009B54();
  sub_100009AB8();
}

void sub_100008258(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (a3) {
    uint64_t v5 = (void *)_convertErrorToNSError(_:)(a3);
  }
  else {
    uint64_t v5 = 0LL;
  }
  v7[4] = nullsub_1;
  v7[5] = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256LL;
  v7[2] = sub_100007720;
  v7[3] = &unk_10000C908;
  uint64_t v6 = _Block_copy(v7);
  [v4 engagementTaskDidFinishWithResult:a2 error:v5 completion:v6];
  _Block_release(v6);
}

uint64_t sub_10000830C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2 += 16LL;
  swift_beginAccess(a2, v59, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(a2);
  if (result)
  {
    uint64_t v7 = (void *)result;
    uint64_t v8 = sub_100005DEC((uint64_t *)&unk_100011060);
    uint64_t v9 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
          + 3LL * *(void *)(v9 + 72),
            *(unsigned __int8 *)(v9 + 80) | 7LL);
    *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10000A200;
    uint64_t v58 = type metadata accessor for RemoteEngagementViewController();
    v57[0] = v7;
    id v11 = v7;
    id v12 = (id)((uint64_t (*)(void))AMSLogKey)();
    if (v12)
    {
      char v14 = v12;
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);
      uint64_t v17 = v16;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v18._uint64_t countAndFlagsBits = 0LL;
      v18._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v18);
      uint64_t v19 = v58;
      Swift::String v20 = sub_100005E2C(v57, v58);
      uint64_t DynamicType = swift_getDynamicType(v20, v19, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v54 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      v22._uint64_t countAndFlagsBits = 5972026LL;
      v22._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v22);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v54 = v15;
      uint64_t v55 = v17;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      uint64_t v23 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v24._uint64_t countAndFlagsBits = 0LL;
      v24._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v24);
      uint64_t v25 = v58;
      Swift::String v26 = sub_100005E2C(v57, v58);
      uint64_t v27 = swift_getDynamicType(v26, v25, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v54 = v27;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      uint64_t v23 = 58LL;
    }

    unint64_t v28 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v23);
    LogMessage.init(stringInterpolation:)(v5);
    sub_100005E90(v57);
    LogMessage.init(stringLiteral:)(0xD000000000000037LL, 0x800000010000AAF0LL);
    swift_getErrorValue(a1, v53, &v51);
    uint64_t v29 = v51;
    uint64_t v30 = v52;
    uint64_t v58 = v52;
    id v31 = sub_1000073A0(v57);
    uint64_t v32 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16LL))(v31, v29, v30);
    id v33 = (id)AMSLogKey(v32);
    if (v33)
    {
      id v35 = v33;
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33, v34);
      uint64_t v38 = v37;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v39._uint64_t countAndFlagsBits = 0LL;
      v39._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v39);
      uint64_t v40 = v58;
      uint64_t v41 = sub_100005E2C(v57, v58);
      uint64_t v42 = swift_getDynamicType(v41, v40, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v54 = v42;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      v43._uint64_t countAndFlagsBits = 5972026LL;
      v43._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v43);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v54 = v36;
      uint64_t v55 = v38;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      uint64_t v44 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v45._uint64_t countAndFlagsBits = 0LL;
      v45._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v45);
      uint64_t v46 = v58;
      v47 = sub_100005E2C(v57, v58);
      uint64_t v48 = swift_getDynamicType(v47, v46, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v54 = v48;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v54);
      sub_100005E50((uint64_t)&v54);
      uint64_t v44 = 58LL;
    }

    unint64_t v49 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v44);
    LogMessage.init(stringInterpolation:)(v5);
    type metadata accessor for Log();
    sub_100005E90(v57);
    sub_100006080(v10);

    return swift_bridgeObjectRelease(v10);
  }

  return result;
}

uint64_t sub_1000086E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009A9C((uint64_t)&unk_10000C850, 24LL);
  sub_100009AA4(v6);
  uint64_t v7 = (void *)sub_100009A9C((uint64_t)&unk_10000C8C8, 48LL);
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  swift_retain(v6);
  swift_errorRetain(a1);
  sub_100005DDC(a2, a3);
  sub_1000080A0(1, sub_100009814, (uint64_t)v7);
  sub_100009B08();
  return swift_release(v7);
}

void sub_100008780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_errorRetain(a2);
    sub_100005DDC(a3, a4);
    id v10 = sub_10000519C(a2, a3, a4);
    [v9 presentViewController:v10 animated:1 completion:0];
  }

uint64_t sub_100008844(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100009A9C((uint64_t)&unk_10000C850, 24LL);
  sub_100009AA4(v10);
  id v11 = (void *)sub_100009A9C((uint64_t)&unk_10000C878, 64LL);
  _OWORD v11[2] = v10;
  v11[3] = a1;
  v11[4] = a2;
  v11[5] = a3;
  v11[6] = a4;
  v11[7] = a5;
  id v12 = a3;
  swift_retain(a5);
  swift_retain(v10);
  id v13 = a1;
  swift_unknownObjectRetain(a2);
  sub_1000080A0(1, sub_1000097B0, (uint64_t)v11);
  swift_release(v10);
  return swift_release(v11);
}

void sub_100008900(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a1 + 16;
  swift_beginAccess(a1 + 16, v22, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v11);
  if (Strong)
  {
    id v13 = (void *)Strong;
    sub_1000073DC(0LL, &qword_100011140, &OBJC_CLASS___AMSUIEngagementTask_ptr);
    id v14 = a2;
    swift_unknownObjectRetain(a3);
    id v15 = v13;
    id v16 = sub_100008A64(v14, a3, v15);
    [v16 setClientInfo:a4];
    id v17 = [v16 presentEngagement];
    aBlock[4] = a5;
    uint64_t v21 = a6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100008ACC;
    aBlock[3] = &unk_10000C890;
    Swift::String v18 = _Block_copy(aBlock);
    uint64_t v19 = v21;
    swift_retain(a6);
    swift_release(v19);
    [v17 addFinishBlock:v18];
    _Block_release(v18);
  }

id sub_100008A64(void *a1, uint64_t a2, void *a3)
{
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) initWithRequest:a1 bag:a2 presentingViewController:a3];

  swift_unknownObjectRelease(a2);
  return v7;
}

void sub_100008ACC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

void sub_100008B40(uint64_t a1)
{
  uint64_t v3 = sub_100005DEC((uint64_t *)&unk_100011060);
  uint64_t v4 = type metadata accessor for LogMessage(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + 3LL * *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_10000A200;
  id v31 = (void *)type metadata accessor for RemoteEngagementViewController();
  id v28 = v1;
  id v6 = (id)AMSLogKey(v1);
  if (v6)
  {
    id v8 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    sub_100009B10();
    sub_1000076E0();
    uint64_t v9 = (uint64_t)v31;
    uint64_t v10 = sub_100005E2C(&v28, (uint64_t)v31);
    sub_100009B00((uint64_t)v10, v9);
    swift_getMetatypeMetadata();
    sub_100009B30();
    sub_100005FA4();
    sub_100007660();
    sub_100009B30();
    sub_100005FA4();
    uint64_t v11 = 93LL;
  }

  else
  {
    sub_100009B20();
    sub_1000076E0();
    uint64_t v12 = (uint64_t)v31;
    id v13 = sub_100005E2C(&v28, (uint64_t)v31);
    sub_100009B00((uint64_t)v13, v12);
    swift_getMetatypeMetadata();
    sub_100009B30();
    sub_100005FA4();
    uint64_t v11 = 58LL;
  }

  unint64_t v14 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v11);
  LogMessage.init(stringInterpolation:)(v1);
  type metadata accessor for Log();
  sub_100005E90(&v28);
  LogMessage.init(stringLiteral:)(0x6863206574617453LL, 0xEE003A6465676E61LL);
  id v31 = &unk_10000C618;
  id v28 = (id)sub_100009A9C((uint64_t)&unk_10000C828, 57LL);
  sub_1000096D8(a1, (uint64_t)v28 + 16);
  sub_100009714(a1);
  static LogMessage.safe(_:)(&v28);
  sub_100009AF8();
  sub_10000620C(v5);
  swift_bridgeObjectRelease(v5);
  sub_1000096D8(a1, (uint64_t)&v28);
  if (v33)
  {
    if (v33 == 1)
    {
      id v16 = v28;
      uint64_t v15 = v29;
      id v17 = v30;
      uint64_t v18 = (uint64_t)v31;
      uint64_t v19 = v32;
      id v20 = v30;
      swift_retain(v19);
      id v21 = v16;
      swift_unknownObjectRetain(v15);
      sub_100008844(v21, v15, v17, v18, v19);

      swift_unknownObjectRelease(v15);
      sub_100009B08();
    }

    else
    {
      uint64_t v25 = (uint64_t)v28;
      uint64_t v26 = v29;
      uint64_t v27 = (uint64_t)v30;
      swift_errorRetain(v28);
      sub_100005DDC(v26, v27);
      sub_1000086E0(v25, v26, v27);
      sub_100005EB0(v26, v27);
      swift_errorRelease(v25);
    }
  }

  else
  {
    id v22 = v28;
    uint64_t v23 = v29;
    id v24 = v28;
    swift_errorRetain(v23);
    sub_100008170(v22, v23);
    swift_errorRelease(v23);
  }

id sub_100008E6C()
{
  uint64_t v1 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  uint64_t v2 = sub_100009AB0();
  sub_100009A9C(v2, 48LL);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = sub_1000072D0();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return objc_msgSendSuper2(&v5, "init");
}

id sub_100008EFC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  uint64_t v7 = sub_100009AB0();
  sub_100009A9C(v7, 48LL);
  id v8 = v3;
  *(void *)&v3[v6] = sub_1000072D0();

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v9 = 0LL;
  }

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_100009020(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  uint64_t v4 = sub_100009AB0();
  sub_100009A9C(v4, 48LL);
  objc_super v5 = v1;
  *(void *)&v1[v3] = sub_1000072D0();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_1000090D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteEngagementViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AMSEngagementViewExtension30RemoteEngagementViewController);
}

void sub_100009130( void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5, void (**a6)(void, void))
{
  id v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  LOBYTE(a3) = sub_100006380(a1, a2, a3, a4);
  uint64_t v14 = sub_100005DEC((uint64_t *)&unk_100011060);
  uint64_t v15 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = v17 | 7;
  if ((a3 & 1) != 0)
  {
    uint64_t v33 = swift_allocObject(v14, v18 + 3 * v16, v19);
    *(_OWORD *)(v33 + swift_weakDestroy(v0 + 16) = xmmword_10000A200;
    v60 = (void *)type metadata accessor for RemoteEngagementViewController();
    v59[0] = a5;
    id v34 = (id)AMSLogKey(a5);
    if (v34)
    {
      uint64_t v36 = v34;
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);
      uint64_t v39 = v38;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v40._uint64_t countAndFlagsBits = 0LL;
      v40._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v40);
      uint64_t v41 = v60;
      uint64_t v42 = sub_100005E2C(v59, (uint64_t)v60);
      uint64_t DynamicType = swift_getDynamicType(v42, v41, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v56 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      v44._uint64_t countAndFlagsBits = 5972026LL;
      v44._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v44);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v56 = v37;
      uint64_t v57 = v39;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      uint64_t v45 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v51._uint64_t countAndFlagsBits = 0LL;
      v51._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v51);
      uint64_t v52 = v60;
      v53 = sub_100005E2C(v59, (uint64_t)v60);
      uint64_t v54 = swift_getDynamicType(v53, v52, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v56 = v54;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      uint64_t v45 = 58LL;
    }

    unint64_t v55 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v45);
    LogMessage.init(stringInterpolation:)(v13);
    type metadata accessor for Log();
    sub_100005E90(v59);
    LogMessage.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010000AA80LL);
    v60 = &unk_10000C760;
    static LogMessage.safe(_:)(v59);
    sub_100005E50((uint64_t)v59);
    sub_100006080(v33);
    swift_bridgeObjectRelease(v33);
  }

  else
  {
    uint64_t v20 = swift_allocObject(v14, v18 + 2 * v16, v19);
    *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10000A2B0;
    v60 = (void *)type metadata accessor for RemoteEngagementViewController();
    v59[0] = a5;
    id v21 = (id)AMSLogKey(a5);
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);
      uint64_t v26 = v25;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v27._uint64_t countAndFlagsBits = 0LL;
      v27._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      id v28 = v60;
      uint64_t v29 = sub_100005E2C(v59, (uint64_t)v60);
      uint64_t v30 = swift_getDynamicType(v29, v28, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v56 = v30;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      v31._uint64_t countAndFlagsBits = 5972026LL;
      v31._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v56 = v24;
      uint64_t v57 = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      uint64_t v32 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v46._uint64_t countAndFlagsBits = 0LL;
      v46._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v46);
      v47 = v60;
      uint64_t v48 = sub_100005E2C(v59, (uint64_t)v60);
      uint64_t v49 = swift_getDynamicType(v48, v47, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v56 = v49;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
      sub_100005E50((uint64_t)&v56);
      uint64_t v32 = 58LL;
    }

    unint64_t v50 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
    LogMessage.init(stringInterpolation:)(v13);
    type metadata accessor for Log();
    sub_100005E90(v59);
    LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010000AAA0LL);
    sub_10000620C(v20);
    swift_bridgeObjectRelease(v20);
    sub_100006778();
  }

  a6[2](a6, 0LL);
  _Block_release(a6);
}

uint64_t sub_100009694(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007458(result, a2);
  }
  return result;
}

uint64_t sub_1000096A8()
{
  return swift_deallocObject(v0, 57LL, 7LL);
}

uint64_t sub_1000096D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009714(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009748()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000976C()
{
  swift_unknownObjectRelease(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 56));
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_1000097B0()
{
}

uint64_t sub_1000097C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000097D0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000097D8()
{
  if (v0[4]) {
    swift_release(v0[5]);
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_100009814()
{
}

uint64_t sub_100009820()
{
  swift_errorRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10000984C(void **a1)
{
}

uint64_t sub_100009854(uint64_t a1)
{
  return sub_10000830C(a1, v1);
}

uint64_t sub_10000985C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005DEC((uint64_t *)&unk_100010D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000098A4()
{
  unint64_t result = qword_1000111B8;
  if (!qword_1000111B8)
  {
    unint64_t result = swift_getWitnessTable( &unk_10000A618,  &type metadata for RemoteEngagementViewController.RemoteViewControllerProxyError);
    atomic_store(result, (unint64_t *)&qword_1000111B8);
  }

  return result;
}

void sub_1000098E0(uint64_t a1)
{
}

unint64_t sub_1000098E8()
{
  unint64_t result = qword_1000111D8;
  if (!qword_1000111D8)
  {
    uint64_t v1 = sub_10000992C(&qword_1000111D0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SyncEvent<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000111D8);
  }

  return result;
}

uint64_t sub_10000992C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100009970()
{
  unint64_t result = qword_1000111E0;
  if (!qword_1000111E0)
  {
    uint64_t v1 = type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable("I$", v1);
    atomic_store(result, (unint64_t *)&qword_1000111E0);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for RemoteEngagementViewController.RemoteViewControllerProxyError( uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000099F0 + 4 * byte_10000A530[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100009A10 + 4 * byte_10000A535[v4]))();
  }
}

_BYTE *sub_1000099F0(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_100009A10(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100009A18(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100009A20(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100009A28(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100009A30(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RemoteEngagementViewController.RemoteViewControllerProxyError()
{
  return &type metadata for RemoteEngagementViewController.RemoteViewControllerProxyError;
}

unint64_t sub_100009A50()
{
  unint64_t result = qword_1000111E8;
  if (!qword_1000111E8)
  {
    unint64_t result = swift_getWitnessTable( &unk_10000A5F0,  &type metadata for RemoteEngagementViewController.RemoteViewControllerProxyError);
    atomic_store(result, (unint64_t *)&qword_1000111E8);
  }

  return result;
}

uint64_t sub_100009A9C(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_100009AA4(uint64_t a1)
{
  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

uint64_t sub_100009AB0()
{
  return type metadata accessor for RemoteEngagementPresenter();
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100009AF8()
{
  return sub_100005E50(v0 - 128);
}

uint64_t sub_100009B00(uint64_t a1, uint64_t a2)
{
  return swift_getDynamicType(a1, a2, 1LL);
}

uint64_t sub_100009B08()
{
  return swift_release(v0);
}

uint64_t sub_100009B10()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

uint64_t sub_100009B20()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

uint64_t sub_100009B30()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 160);
}

  ;
}

unint64_t sub_100009B44()
{
  return sub_100009970();
}

uint64_t sub_100009B4C()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 128);
}

uint64_t sub_100009B54()
{
  return swift_release(v0);
}