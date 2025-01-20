uint64_t sub_19EC()
{
  uint64_t v0;
  uint64_t v1;
  v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_1A20();
  return v1;
}

uint64_t sub_1A20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3338();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_3350();
  uint64_t v6 = v5 - v4;
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_3448);
  }
  uint64_t v7 = sub_2A20(v2, (uint64_t)qword_8278);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)sub_3280();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Initializing AppLaunchPlugin", v11, 2u);
    sub_3274((uint64_t)v11);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  return v1;
}

void sub_1B40(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = sub_3338();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_3350();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  __chkstk_darwin(v8);
  uint64_t v9 = sub_331C();
  uint64_t v10 = type metadata accessor for OSSignposter(v9);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_3350();
  uint64_t v14 = v13 - v12;
  if (qword_80A0 != -1) {
    swift_once(&qword_80A0, sub_3508);
  }
  uint64_t v15 = sub_2A20(v10, (uint64_t)qword_8290);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v15, v10);
  uint64_t v17 = static OSSignpostID.exclusive.getter(v16);
  v18 = (os_log_s *)OSSignposter.logHandle.getter(v17);
  os_signpost_type_t v19 = static os_signpost_type_t.event.getter();
  uint64_t v36 = v7;
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    v22 = (uint8_t *)sub_3280();
    *(_WORD *)v22 = 0;
    os_signpost_id_t v23 = OSSignpostID.rawValue.getter();
    sub_3300(&dword_0, v18, v19, v23, "AppLaunchPlugin#warmup", "", v22);
    uint64_t v24 = (uint64_t)v22;
    uint64_t v3 = v21;
    uint64_t v4 = v20;
    uint64_t v7 = v36;
    sub_3274(v24);
  }

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v2, v35);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_3448);
  }
  uint64_t v25 = sub_2A20(v3, (uint64_t)qword_8278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, v25, v3);
  uint64_t v26 = swift_bridgeObjectRetain_n(a2, 2LL);
  v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = v4;
    v30 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v31 = v3;
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    uint64_t v40 = v32;
    *(_DWORD *)v30 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v33 = a1;
    uint64_t v39 = sub_2A6C(a1, a2, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v30 + 4, v30 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v27, v28, "AppLaunchPlugin#warmup for %s", v30, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    sub_3274(v32);
    sub_3274((uint64_t)v30);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v36, v31);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
    uint64_t v33 = a1;
  }

  static AppLaunchFlowProvider.warmup(refId:)(v33, a2);
  sub_32AC();
}

uint64_t sub_1E84(uint64_t a1)
{
  uint64_t v85 = a1;
  uint64_t v2 = type metadata accessor for OSSignpostError(0LL);
  sub_3368(v2, (uint64_t)v92);
  sub_328C(v3);
  __chkstk_darwin(v4);
  sub_32C4();
  uint64_t v76 = v5;
  uint64_t v6 = type metadata accessor for FlowSearchResult(0LL);
  sub_3368(v6, (uint64_t)&v93);
  sub_328C(v7);
  __chkstk_darwin(v8);
  uint64_t v9 = sub_331C();
  uint64_t v10 = type metadata accessor for Logger(v9);
  sub_328C(*(void *)(v10 - 8));
  __chkstk_darwin(v11);
  sub_32D8();
  sub_329C();
  __chkstk_darwin(v12);
  uint64_t v14 = sub_32EC((uint64_t)&v74 - v13);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_329C();
  uint64_t v17 = __chkstk_darwin(v16);
  os_signpost_type_t v19 = (char *)&v74 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v74 - v20;
  uint64_t v22 = type metadata accessor for OSSignposter(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  sub_32D8();
  sub_329C();
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v74 - v25;
  if (qword_80A0 != -1) {
    swift_once(&qword_80A0, sub_3508);
  }
  uint64_t v84 = v1;
  uint64_t v27 = sub_2A20(v22, (uint64_t)qword_8290);
  os_log_type_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  uint64_t v79 = v27;
  uint64_t v90 = v22;
  v80 = v28;
  uint64_t v29 = ((uint64_t (*)(char *))v28)(v26);
  uint64_t v30 = static OSSignpostID.exclusive.getter(v29);
  uint64_t v31 = (os_log_s *)OSSignposter.logHandle.getter(v30);
  os_signpost_type_t v32 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v33 = (uint8_t *)sub_3280();
    uint64_t v82 = v15;
    uint64_t v34 = v10;
    uint64_t v35 = v14;
    uint64_t v36 = v33;
    *(_WORD *)uint64_t v33 = 0;
    os_signpost_id_t v37 = OSSignpostID.rawValue.getter();
    sub_3300(&dword_0, v31, v32, v37, "appLaunchPluginMakeFlow", "", v36);
    uint64_t v38 = (uint64_t)v36;
    uint64_t v14 = v35;
    uint64_t v10 = v34;
    uint64_t v15 = v82;
    sub_3274(v38);
  }

  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v14);
  uint64_t v39 = type metadata accessor for OSSignpostIntervalState(0LL);
  sub_3380(v39);
  uint64_t v40 = OSSignpostIntervalState.init(id:isOpen:)(v19, 1LL);
  sub_3360(*(uint64_t (**)(void))(v15 + 8));
  uint64_t v41 = v90;
  sub_3360(*(uint64_t (**)(void))(v23 + 8));
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_3448);
  }
  uint64_t v42 = sub_2A20(v10, (uint64_t)qword_8278);
  uint64_t v43 = v83;
  v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v83 + 16);
  uint64_t v45 = v44(v88, v42, v10);
  v46 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)sub_3280();
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_0, v46, v47, "AppLaunchPlugin#makeFlowFor", v48, 2u);
    uint64_t v49 = (uint64_t)v48;
    uint64_t v41 = v90;
    sub_3274(v49);
  }

  v50 = *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8);
  uint64_t v51 = v50(v88, v10);
  AppLaunchFlowProvider.init()(v91, v51);
  uint64_t v52 = v84;
  sub_3374();
  uint64_t v53 = sub_2A38((uint64_t)v91);
  uint64_t v54 = FlowSearchResult.flow.getter(v53);
  if (v54)
  {
    uint64_t v55 = v54;
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v52, v87);
    uint64_t v56 = v80(v89, v79, v41);
    v57 = (os_log_s *)OSSignposter.logHandle.getter(v56);
    uint64_t v58 = OSSignpostIntervalState.signpostID.getter();
    static os_signpost_type_t.end.getter(v58);
    if ((sub_338C() & 1) != 0)
    {
      uint64_t v59 = swift_retain(v40);
      uint64_t v60 = v76;
      checkForErrorAndConsumeState(state:)(v59);
      swift_release(v40);
      uint64_t v61 = v77;
      uint64_t v62 = v78;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v77 + 88))(v60, v78) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v63 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
        v63 = "";
      }

      v64 = (uint8_t *)sub_3280();
      *(_WORD *)v64 = 0;
      os_signpost_id_t v65 = OSSignpostID.rawValue.getter();
      sub_3300(&dword_0, v57, (os_signpost_type_t)v50, v65, "appLaunchPluginMakeFlow", v63, v64);
      sub_3274((uint64_t)v64);
      uint64_t v41 = v90;
    }

    sub_3398();
    v81(v89, v41);
    swift_release(v40);
    return v55;
  }

  else
  {
    uint64_t v67 = v10;
    uint64_t v68 = v44(v75, v42, v10);
    v69 = (void *)Logger.logObject.getter(v68);
    os_log_type_t v70 = static os_log_type_t.error.getter();
    if (sub_3340(v70))
    {
      v71 = (_WORD *)sub_3280();
      _WORD *v71 = 0;
      sub_3308(&dword_0, v72, v73, "Unable to create a flow. Crashing.");
      sub_3274((uint64_t)v71);
    }

    v50(v75, v67);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000017LL,  0x8000000000003A50LL,  "AppLaunchPlugin/AppLaunchPlugin.swift",  37LL,  2LL,  35LL,  0);
    __break(1u);
  }

  return result;
}

void sub_24B4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v57 = a2;
  uint64_t v3 = type metadata accessor for OSSignpostError(0LL);
  sub_3368(v3, (uint64_t)v65);
  sub_328C(v4);
  ((void (*)(void))__chkstk_darwin)();
  sub_32C4();
  uint64_t v60 = v5;
  uint64_t v6 = sub_3338();
  sub_3368(v6, (uint64_t)v66);
  sub_328C(v7);
  ((void (*)(void))__chkstk_darwin)();
  sub_32C4();
  uint64_t v63 = sub_32EC(v8);
  uint64_t v9 = *(void *)(v63 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_329C();
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v52 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v52 - v13;
  uint64_t v15 = type metadata accessor for OSSignposter(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  sub_32D8();
  sub_329C();
  __chkstk_darwin(v17);
  os_signpost_type_t v19 = (char *)&v52 - v18;
  if (qword_80A0 != -1) {
    swift_once(&qword_80A0, sub_3508);
  }
  uint64_t v20 = sub_2A20(v15, (uint64_t)qword_8290);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  uint64_t v54 = v20;
  uint64_t v55 = v21;
  uint64_t v22 = ((uint64_t (*)(char *))v21)(v19);
  uint64_t v23 = static OSSignpostID.exclusive.getter(v22);
  uint64_t v24 = (os_log_s *)OSSignposter.logHandle.getter(v23);
  static os_signpost_type_t.begin.getter();
  if ((sub_338C() & 1) != 0)
  {
    uint64_t v25 = (uint8_t *)sub_3280();
    *(_WORD *)uint64_t v25 = 0;
    os_signpost_id_t v26 = OSSignpostID.rawValue.getter();
    sub_3300(&dword_0, v24, v2, v26, "appLaunchPluginMakeFlow", "", v25);
    sub_3274((uint64_t)v25);
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v63);
  uint64_t v27 = type metadata accessor for OSSignpostIntervalState(0LL);
  sub_3380(v27);
  uint64_t v28 = OSSignpostIntervalState.init(id:isOpen:)(v12, 1LL);
  sub_3360(*(uint64_t (**)(void))(v9 + 8));
  uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
  v29(v19, v15);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_3448);
  }
  uint64_t v30 = v56;
  uint64_t v31 = sub_2A20(v56, (uint64_t)qword_8278);
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v61, v31, v30);
  uint64_t v33 = (void *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.default.getter();
  BOOL v35 = sub_3340(v34);
  uint64_t v36 = v60;
  os_signpost_id_t v37 = v59;
  if (v35)
  {
    uint64_t v38 = (_WORD *)sub_3280();
    *uint64_t v38 = 0;
    sub_3308(&dword_0, v39, v40, "AppLaunchPlugin#findFlowForX");
    sub_3274((uint64_t)v38);
  }

  uint64_t v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v61, v30);
  AppLaunchFlowProvider.init()(v64, v41);
  sub_3374();
  sub_2A38((uint64_t)v64);
  uint64_t v42 = v55((uint64_t)v37, v54, v15);
  uint64_t v43 = (os_log_s *)OSSignposter.logHandle.getter(v42);
  uint64_t v44 = OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v45 = static os_signpost_type_t.end.getter(v44);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v46 = swift_retain(v28);
    checkForErrorAndConsumeState(state:)(v46);
    swift_release(v28);
    uint64_t v47 = v52;
    uint64_t v48 = v53;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v52 + 88))(v36, v53) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v49 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v36, v48);
      uint64_t v49 = "";
    }

    v50 = (uint8_t *)sub_3280();
    *(_WORD *)v50 = 0;
    os_signpost_id_t v51 = OSSignpostID.rawValue.getter();
    sub_3300(&dword_0, v43, v45, v51, "appLaunchPluginMakeFlow", v49, v50);
    sub_3274((uint64_t)v50);
  }

  sub_3398();
  v29(v37, v15);
  swift_release(v28);
  sub_32AC();
}

uint64_t sub_2944()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for AppLaunchPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC15AppLaunchPlugin15AppLaunchPlugin);
}

void sub_2974(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_2988@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19EC();
  *a1 = result;
  return result;
}

void sub_29B0(uint64_t a1, unint64_t a2)
{
}

uint64_t sub_29C8(uint64_t a1)
{
  return sub_1E84(a1);
}

unint64_t sub_29E4()
{
  unint64_t result = qword_8158;
  if (!qword_8158)
  {
    uint64_t v1 = type metadata accessor for AppLaunchPlugin();
    unint64_t result = swift_getWitnessTable("9\n", v1);
    atomic_store(result, (unint64_t *)&qword_8158);
  }

  return result;
}

uint64_t sub_2A20(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2A38(uint64_t a1)
{
  return a1;
}

uint64_t sub_2A6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2B3C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_31F4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_31F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_31D4(v12);
  return v7;
}

void *sub_2B3C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2C90((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    unint64_t result = sub_2D54(a5, a6);
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

void *sub_2C90(char *__src, size_t __n, char *__dst)
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

void *sub_2D54(uint64_t a1, unint64_t a2)
{
  os_signpost_type_t v2 = sub_2DE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    os_signpost_type_t v2 = sub_2FBC(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    os_signpost_type_t v2 = sub_2FBC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_2DE8(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_2F58(v4, 0LL);
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

void *sub_2F58(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_3230(&qword_8160);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_2FBC(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_3230(&qword_8160);
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
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_3154(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_3090(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_3090(char *__src, size_t __n, char *__dst)
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

char *sub_3154(char *__src, size_t __len, char *__dst)
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

uint64_t sub_31D4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_31F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3230(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_3274(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_3280()
{
  return swift_slowAlloc(2LL, -1LL);
}

void sub_328C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void sub_329C()
{
  *(void *)(v1 - 256) = v0;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_32EC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 312) = a1;
  return type metadata accessor for OSSignpostID(0LL);
}

void sub_3300( void *a1, os_log_s *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6, uint8_t *a7)
{
}

void sub_3308(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_331C()
{
  return 0LL;
}

uint64_t sub_3338()
{
  return type metadata accessor for Logger(0LL);
}

BOOL sub_3340(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_3360@<X0>(uint64_t (*a1)(void)@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return a1();
}

uint64_t sub_3368@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t sub_3374()
{
  return AppLaunchFlowProvider.findFlow(for:)(*(void *)(v0 - 344));
}

uint64_t sub_3380(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_338C()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3398()
{
  return (*(uint64_t (**)(void))(v0 - 368))();
}

uint64_t sub_33A4()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000018LL,  0x8000000000003D90LL,  0x636E75614C707041LL,  0xEF6E6967756C5068LL);
  qword_8270 = result;
  return result;
}

unint64_t sub_340C()
{
  unint64_t result = qword_8168;
  if (!qword_8168)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_8168);
  }

  return result;
}

uint64_t sub_3448()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_34C8(v0, qword_8278);
  sub_2A20(v0, (uint64_t)qword_8278);
  if (qword_8090 != -1) {
    swift_once(&qword_8090, sub_33A4);
  }
  return Logger.init(_:)((id)qword_8270);
}

uint64_t *sub_34C8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_3508()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  sub_34C8(v4, qword_8290);
  sub_2A20(v4, (uint64_t)qword_8290);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_3448);
  }
  uint64_t v5 = sub_2A20(v0, (uint64_t)qword_8278);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}