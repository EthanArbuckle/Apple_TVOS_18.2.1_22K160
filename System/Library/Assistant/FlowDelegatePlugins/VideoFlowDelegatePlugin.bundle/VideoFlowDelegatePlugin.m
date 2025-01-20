uint64_t sub_26C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  v0 = type metadata accessor for Logger(0LL);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4 = type metadata accessor for OSSignposter(0LL);
  sub_27A8(v4, qword_8168);
  sub_27E8(v4, (uint64_t)qword_8168);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_2800);
  }
  v5 = sub_27E8(v0, (uint64_t)qword_8180);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

uint64_t *sub_27A8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_27E8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2800()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_27A8(v0, qword_8180);
  sub_27E8(v0, (uint64_t)qword_8180);
  if (qword_80A0 != -1) {
    swift_once(&qword_80A0, sub_2880);
  }
  return Logger.init(_:)((id)qword_8198);
}

uint64_t sub_2880()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000000003BE0LL,  0xD000000000000017LL,  0x8000000000003C00LL);
  qword_8198 = result;
  return result;
}

unint64_t sub_28E4()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_80A8);
  }

  return result;
}

uint64_t sub_2920()
{
  uint64_t v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_2954();
  return v1;
}

uint64_t sub_2954()
{
  uint64_t v1 = sub_38B4();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_38DC();
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_2800);
  }
  uint64_t v3 = sub_27E8(v1, (uint64_t)qword_8180);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)sub_383C();
    *(_WORD *)v7 = 0;
    sub_38AC(&dword_0, v5, v6, "Initializing VideoFlowDelegatePlugin", v7);
    sub_3848((uint64_t)v7);
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return v0;
}

uint64_t sub_2A68(uint64_t a1)
{
  uint64_t v68 = a1;
  uint64_t v64 = type metadata accessor for OSSignpostError(0LL);
  sub_389C(*(void *)(v64 - 8));
  __chkstk_darwin(v1);
  uint64_t v3 = sub_3854(v2, v60);
  uint64_t v69 = type metadata accessor for FlowSearchResult(v3);
  sub_389C(*(void *)(v69 - 8));
  __chkstk_darwin(v4);
  sub_38CC();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_38B4();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_3878(v10, v60);
  __chkstk_darwin(v11);
  v13 = (char *)&v60 - v12;
  uint64_t v72 = sub_3918();
  uint64_t v14 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  sub_394C();
  v70 = v15;
  uint64_t v17 = __chkstk_darwin(v16);
  v19 = (char *)&v60 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v60 - v20;
  if (qword_8090 != -1) {
    swift_once(&qword_8090, sub_26C0);
  }
  uint64_t v71 = v8;
  uint64_t v22 = type metadata accessor for OSSignposter(0LL);
  uint64_t v23 = sub_27E8(v22, (uint64_t)qword_8168);
  uint64_t v24 = static OSSignpostID.exclusive.getter();
  uint64_t v65 = v23;
  v25 = (os_log_s *)OSSignposter.logHandle.getter(v24);
  os_signpost_type_t v26 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    v27 = (uint8_t *)sub_383C();
    *(_WORD *)v27 = 0;
    os_signpost_id_t v28 = OSSignpostID.rawValue.getter();
    sub_3904(&dword_0, v25, v26, v28, "makeFlowFor", "", v27);
    sub_3848((uint64_t)v27);
  }

  uint64_t v29 = v72;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v19, v21, v72);
  uint64_t v30 = type metadata accessor for OSSignpostIntervalState(0LL);
  sub_3938(v30);
  uint64_t v31 = OSSignpostIntervalState.init(id:isOpen:)(v19, 1LL);
  v66 = *(void (**)(char *, uint64_t))(v14 + 8);
  v66(v21, v29);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_2800);
  }
  uint64_t v32 = v71;
  sub_27E8(v71, (uint64_t)qword_8180);
  uint64_t v33 = sub_3920((uint64_t)v13);
  v34 = (os_log_s *)Logger.logObject.getter(v33);
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)sub_383C();
    *(_WORD *)v36 = 0;
    sub_38AC(&dword_0, v34, v35, "VideoFlowDelegatePlugin#makeFlowFor", v36);
    uint64_t v37 = (uint64_t)v36;
    uint64_t v32 = v71;
    sub_3848(v37);
  }

  v38 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v39 = v38(v13, v32);
  VideoFlowProvider.init()(v73, v39);
  VideoFlowProvider.findFlow(for:)(v68);
  uint64_t v40 = sub_3808((uint64_t)v73);
  uint64_t v41 = FlowSearchResult.flow.getter(v40);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v67 + 8))(v7, v69);
    v44 = (os_log_s *)OSSignposter.logHandle.getter(v43);
    v45 = v70;
    uint64_t v46 = OSSignpostIntervalState.signpostID.getter();
    os_signpost_type_t v47 = static os_signpost_type_t.end.getter(v46);
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v48 = swift_retain(v31);
      uint64_t v49 = v62;
      checkForErrorAndConsumeState(state:)(v48);
      swift_release(v31);
      uint64_t v50 = v63;
      uint64_t v51 = v64;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v63 + 88))(v49, v64) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v52 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
        v52 = "";
      }

      v53 = (uint8_t *)sub_383C();
      *(_WORD *)v53 = 0;
      os_signpost_id_t v54 = OSSignpostID.rawValue.getter();
      sub_3904(&dword_0, v44, v47, v54, "makeFlowFor", v52, v53);
      sub_3848((uint64_t)v53);
    }

    v66(v45, v72);
    swift_release(v31);
    return v42;
  }

  else
  {
    uint64_t v56 = sub_3920((uint64_t)v61);
    v57 = (os_log_s *)Logger.logObject.getter(v56);
    os_log_type_t v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)sub_383C();
      *(_WORD *)v59 = 0;
      sub_38AC(&dword_0, v57, v58, "Unable to create a flow. Crashing.", v59);
      sub_3848((uint64_t)v59);
    }

    v38(v61, v71);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000017LL,  0x8000000000003D00LL,  "VideoFlowDelegatePlugin/VideoFlowDelegatePlugin.swift",  53LL,  2LL,  31LL,  0);
    __break(1u);
  }

  return result;
}

uint64_t sub_2F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a1;
  uint64_t v87 = a2;
  uint64_t v81 = type metadata accessor for OSSignpostError(0LL);
  uint64_t v88 = *(void *)(v81 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_3878(v2, v72);
  ((void (*)(void))__chkstk_darwin)();
  v75 = (char *)&v72 - v3;
  uint64_t v74 = sub_38B4();
  sub_389C(*(void *)(v74 - 8));
  ((void (*)(void))__chkstk_darwin)();
  v82 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v80 = type metadata accessor for ControlsFlowProvider(0LL);
  sub_389C(*(void *)(v80 - 8));
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = sub_3854(v5, v72);
  uint64_t v7 = type metadata accessor for Parse(v6);
  uint64_t v8 = *(void *)(v7 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_38CC();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = (uint8_t *)sub_3918();
  uint64_t v13 = *((void *)v12 - 1);
  ((void (*)(void))__chkstk_darwin)();
  sub_394C();
  v84 = v14;
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  v76 = (char *)&v72 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&v72 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v72 - v20;
  if (qword_8090 != -1) {
    swift_once(&qword_8090, sub_26C0);
  }
  uint64_t v22 = type metadata accessor for OSSignposter(0LL);
  uint64_t v23 = sub_27E8(v22, (uint64_t)qword_8168);
  uint64_t v24 = static OSSignpostID.exclusive.getter();
  uint64_t v85 = v23;
  v25 = (os_log_s *)OSSignposter.logHandle.getter(v24);
  os_signpost_type_t v26 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    v27 = (uint8_t *)sub_383C();
    v73 = v12;
    os_signpost_id_t v28 = v27;
    *(_WORD *)v27 = 0;
    os_signpost_id_t v29 = OSSignpostID.rawValue.getter();
    sub_3904(&dword_0, v25, v26, v29, "makeFlowFor", "", v28);
    uint64_t v30 = (uint64_t)v28;
    uint64_t v12 = v73;
    sub_3848(v30);
  }

  (*(void (**)(char *, char *, uint8_t *))(v13 + 16))(v19, v21, v12);
  uint64_t v31 = type metadata accessor for OSSignpostIntervalState(0LL);
  sub_3938(v31);
  uint64_t v32 = OSSignpostIntervalState.init(id:isOpen:)(v19, 1LL);
  uint64_t v33 = *(void (**)(char *, uint8_t *))(v13 + 8);
  v33(v21, v12);
  uint64_t v34 = v86;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v86, v7);
  int v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v11, v7);
  int v36 = enum case for Parse.NLv3IntentOnly(_:);
  uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  if (v35 == v36
    && (uint64_t v38 = v78,
        ControlsFlowProvider.init()(v37),
        uint64_t v11 = ControlsFlowProvider.makeFlow(for:)(v34),
        uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v79 + 8))(v38, v80),
        v11))
  {
    uint64_t v39 = v88;
    if (qword_8098 != -1) {
      swift_once(&qword_8098, sub_2800);
    }
    uint64_t v40 = v74;
    uint64_t v41 = sub_27E8(v74, (uint64_t)qword_8180);
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v83 + 16))(v82, v41, v40);
    uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.default.getter();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = v76;
    if (v45)
    {
      os_signpost_type_t v47 = (uint8_t *)sub_383C();
      *(_WORD *)os_signpost_type_t v47 = 0;
      sub_38AC(&dword_0, v43, v44, "Got frame from controls project, using it", v47);
      sub_3848((uint64_t)v47);
    }

    (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v40);
    static FlowSearchResult.flow(_:)(v11);
    uint64_t v48 = swift_release(v11);
    uint64_t v49 = v85;
    uint64_t v50 = (os_log_s *)OSSignposter.logHandle.getter(v48);
    uint64_t v51 = sub_392C();
    static os_signpost_type_t.end.getter(v51);
    char v52 = sub_390C();
    uint64_t v53 = (uint64_t)v75;
    if ((v52 & 1) != 0)
    {
      uint64_t v54 = swift_retain(v32);
      checkForErrorAndConsumeState(state:)(v54);
      sub_3944();
      v55 = v12;
      if (sub_38F4(v53, *(uint64_t (**)(uint64_t, void))(v39 + 88)) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v56 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v53, v49);
        uint64_t v56 = "";
      }

      v70 = (_WORD *)sub_383C();
      os_signpost_id_t v66 = sub_38BC(v70);
      os_signpost_type_t v67 = v11;
      uint64_t v68 = v50;
      uint64_t v69 = v56;
LABEL_21:
      sub_3904(&dword_0, v68, v67, v66, "makeFlowFor", v69, v12);
      sub_3848((uint64_t)v12);
      uint64_t v12 = v55;
    }
  }

  else
  {
    VideoFlowProvider.init()(v89, v37);
    VideoFlowProvider.findFlow(for:)(v34);
    uint64_t v57 = sub_3808((uint64_t)v89);
    uint64_t v58 = v85;
    uint64_t v50 = (os_log_s *)OSSignposter.logHandle.getter(v57);
    uint64_t v46 = v84;
    uint64_t v59 = sub_392C();
    static os_signpost_type_t.end.getter(v59);
    char v60 = sub_390C();
    uint64_t v61 = v88;
    if ((v60 & 1) != 0)
    {
      uint64_t v62 = swift_retain(v32);
      uint64_t v63 = v77;
      checkForErrorAndConsumeState(state:)(v62);
      sub_3944();
      v55 = v12;
      if (sub_38F4(v63, *(uint64_t (**)(uint64_t, void))(v61 + 88)) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v64 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v63, v58);
        uint64_t v64 = "";
      }

      uint64_t v65 = (_WORD *)sub_383C();
      os_signpost_id_t v66 = sub_38BC(v65);
      os_signpost_type_t v67 = v11;
      uint64_t v68 = v50;
      uint64_t v69 = v64;
      goto LABEL_21;
    }
  }

  v33(v46, v12);
  return sub_3944();
}

uint64_t sub_3578()
{
  uint64_t v1 = sub_38B4();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_38DC();
  uint64_t v3 = sub_3918();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_38CC();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = static os_signpost_type_t.event.getter();
  if (qword_80A0 != -1) {
    swift_once(&qword_80A0, sub_2880);
  }
  uint64_t v9 = qword_8198;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v8, &dword_0, v9, "VideoFlowDelegatePlugin.warmup", 30LL, 2LL, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_2800);
  }
  uint64_t v10 = sub_27E8(v1, (uint64_t)qword_8180);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v10, v1);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)sub_383C();
    *(_WORD *)uint64_t v14 = 0;
    sub_38AC(&dword_0, v12, v13, "Plugin received warmup signal", v14);
    sub_3848((uint64_t)v14);
  }

  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return static VideoFlowProvider.prewarm()(v15);
}

uint64_t sub_372C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for VideoFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC23VideoFlowDelegatePlugin23VideoFlowDelegatePlugin);
}

uint64_t sub_375C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2F94(a1, a2);
}

uint64_t sub_3770@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2920();
  *a1 = result;
  return result;
}

uint64_t sub_3798()
{
  return sub_3578();
}

uint64_t sub_37B0(uint64_t a1)
{
  return sub_2A68(a1);
}

unint64_t sub_37CC()
{
  unint64_t result = qword_8160;
  if (!qword_8160)
  {
    uint64_t v1 = type metadata accessor for VideoFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable(&unk_3D58, v1);
    atomic_store(result, (unint64_t *)&qword_8160);
  }

  return result;
}

uint64_t sub_3808(uint64_t a1)
{
  return a1;
}

uint64_t sub_383C()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_3848(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_3854@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 304) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return 0LL;
}

void sub_3878(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 312) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_389C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void sub_38AC(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_38B4()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_38BC(_WORD *a1)
{
  *a1 = 0;
  return OSSignpostID.rawValue.getter();
}

  ;
}

  ;
}

uint64_t sub_38F4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void)@<X8>)
{
  return a2(a1, *(void *)(v2 - 280));
}

void sub_3904( void *a1, os_log_s *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6, uint8_t *a7)
{
}

uint64_t sub_390C()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3918()
{
  return type metadata accessor for OSSignpostID(0LL);
}

uint64_t sub_3920(uint64_t a1)
{
  return v2(a1, v3, v1);
}

uint64_t sub_392C()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_3938(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_3944()
{
  return swift_release(v0);
}

  ;
}