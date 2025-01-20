void type metadata accessor for VRXIdiom(uint64_t a1)
{
  sub_64CC(a1, &qword_18C98, (uint64_t)&unk_14A10);
}

void sub_50C4()
{
}

Swift::Int sub_50E4()
{
  return Hasher._finalize()();
}

uint64_t sub_5124()
{
  return 1LL;
}

Swift::Int sub_5134(uint64_t a1)
{
  return Hasher._finalize()();
}

void sub_5180(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  sub_75BC();
  uint64_t v6 = __chkstk_darwin(v5);
  v52 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v9 = (char *)&v51 - v8;
  uint64_t v10 = type metadata accessor for Context(0LL);
  uint64_t v11 = sub_73B4( &qword_18CA0,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  *(void *)(a2 + 24) = EnvironmentObject.init()(v10, v11);
  *(void *)(a2 + 32) = v12;
  v13 = (int *)type metadata accessor for WatchListButtonRichView(0LL);
  v14 = (void *)(a2 + v13[6]);
  void *v14 = swift_getKeyPath(&unk_115E8);
  uint64_t v15 = sub_5E3C(&qword_18CA8);
  swift_storeEnumTagMultiPayload(v14, v15, 0LL);
  v16 = (void *)(a2 + v13[7]);
  void *v16 = swift_getKeyPath(&unk_11618);
  uint64_t v17 = sub_5E3C(&qword_18CB0);
  v56 = v16;
  swift_storeEnumTagMultiPayload(v16, v17, 0LL);
  v18 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)&v58[0] = 0LL;
  id v20 = [v18 propertyListWithData:isa options:0 format:0 error:v58];

  uint64_t v21 = *(void *)&v58[0];
  if (v20)
  {
    id v22 = *(id *)&v58[0];
    _bridgeAnyObjectToAny(_:)(v58, v20);
    swift_unknownObjectRelease(v20);
    uint64_t v23 = sub_5E3C(&qword_18CC8);
    char v24 = swift_dynamicCast(&v57, v58, (char *)&type metadata for Any + 8, v23, 6LL);
    v53 = v14;
    if ((v24 & 1) != 0)
    {
      v25 = a1;
      uint64_t v26 = v57;
      v27.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      uint64_t v28 = v26;
      a1 = v25;
      swift_bridgeObjectRelease(v28);
    }

    else
    {
      v27.super.Class isa = 0LL;
    }

    id v30 = [(id)objc_opt_self(AceObject) aceObjectWithDictionary:v27.super.isa];

    if (v30)
    {
      uint64_t v31 = objc_opt_self(&OBJC_CLASS___SASportsMatchup);
      v32 = (void *)swift_dynamicCastObjCClass(v30, v31);
      if (v32)
      {
        v33 = v32;
        sub_6014(v32);
        uint64_t v35 = v34;
        swift_bridgeObjectRelease(v34);
        if (v35)
        {
          sub_7550();
          *(void *)(a2 + v13[8]) = v33;
          sub_6074((uint64_t)a1, (uint64_t)v58);
          uint64_t v36 = swift_allocObject(&unk_14A30, 64LL, 7LL);
          *(void *)(v36 + 16) = v33;
          sub_60E4(v58, v36 + 24);
          id v37 = v30;
          sub_5FB8(a1);
          *(void *)a2 = sub_60FC;
          *(void *)(a2 + 8) = v36;
          *(_BYTE *)(a2 + 16) = 0;
          return;
        }

        if (AFSiriLogContextConnection)
        {
          id v44 = AFSiriLogContextConnection;
          v45 = v52;
          uint64_t v46 = Logger.init(_:)(v44);
          uint64_t v47 = static os_log_type_t.error.getter(v46);
          os_log_type_t v48 = v47;
          v49 = (os_log_s *)Logger.logObject.getter(v47);
          if (os_log_type_enabled(v49, v48))
          {
            *(_WORD *)sub_75C8() = 0;
            sub_75B0(&dword_0, v49, v48, "#aceshim invalid canonicalId");
            sub_7594();
          }

          (*(void (**)(char *, uint64_t))(v54 + 8))(v45, v55);
          unint64_t v50 = sub_5FD8();
          sub_75DC((uint64_t)&type metadata for WatchListButtonRichView.Error, v50);
          sub_75A4();
          sub_7550();

LABEL_15:
          v14 = v53;
          goto LABEL_16;
        }

        goto LABEL_23;
      }
    }

    if (AFSiriLogContextConnection)
    {
      uint64_t v38 = Logger.init(_:)(AFSiriLogContextConnection);
      uint64_t v39 = static os_log_type_t.error.getter(v38);
      os_log_type_t v40 = v39;
      v41 = (os_log_s *)Logger.logObject.getter(v39);
      if (os_log_type_enabled(v41, v40))
      {
        *(_WORD *)sub_75C8() = 0;
        sub_75B0(&dword_0, v41, v40, "#aceshim unsupported model");
        sub_7594();
      }

      (*(void (**)(char *, uint64_t))(v54 + 8))(v9, v55);
      unint64_t v42 = sub_5FD8();
      sub_75DC((uint64_t)&type metadata for WatchListButtonRichView.Error, v42);
      sub_75A4();
      sub_7550();
      goto LABEL_15;
    }

    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }

  id v29 = *(id *)&v58[0];
  _convertNSErrorToError(_:)(v21);

  swift_willThrow();
  sub_7550();
LABEL_16:
  uint64_t v43 = (uint64_t)v56;
  sub_5FB8(a1);

  sub_7450((uint64_t)v14, &qword_18CB8);
  sub_7450(v43, &qword_18CC0);
}

uint64_t type metadata accessor for WatchListButtonRichView(uint64_t a1)
{
  uint64_t result = qword_18DA8;
  if (!qword_18DA8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WatchListButtonRichView);
  }
  return result;
}

uint64_t sub_56AC(void *a1, uint64_t a2)
{
  uint64_t v3 = sub_6108((uint64_t)v7, v7[3]);
  __chkstk_darwin(v3);
  (*(void (**)(void))(v4 + 16))();
  uint64_t v5 = sub_6334(a1, 5LL);
  sub_5FB8(v7);
  return v5;
}

void *sub_5748@<X0>(uint64_t a1@<X8>)
{
  v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = v2[1];
  uint64_t v6 = *((unsigned __int8 *)v2 + 16);
  uint64_t v7 = type metadata accessor for WatchListButtonStateProvider(0LL);
  uint64_t v8 = sub_73B4(&qword_18E08, type metadata accessor for WatchListButtonStateProvider, (uint64_t)&unk_11B30);
  StateObject.wrappedValue.getter(v4, v5, v6, v7, v8);
  sub_8278();
  char v10 = v9;
  sub_7570();
  if (v10)
  {
    if (v10 != 1)
    {
      sub_5908(&v21);
      uint64_t v19 = v21;
      __int16 v20 = 256;
      uint64_t v15 = sub_5E3C(&qword_18E10);
      unint64_t v16 = sub_73F4();
      uint64_t result = _ConditionalContent<>.init(storage:)( &v21,  &v19,  v15,  &type metadata for AnyView,  v16,  &protocol witness table for AnyView);
      goto LABEL_7;
    }

    sub_5A34(&v21);
    uint64_t v11 = v21;
    uint64_t v19 = v21;
    LOBYTE(v20) = 1;
  }

  else
  {
    sub_5908(&v21);
    uint64_t v11 = v21;
    uint64_t v19 = v21;
    LOBYTE(v20) = 0;
  }

  swift_retain(v11);
  _ConditionalContent<>.init(storage:)( &v21,  &v19,  &type metadata for AnyView,  &type metadata for AnyView,  &protocol witness table for AnyView,  &protocol witness table for AnyView);
  uint64_t v19 = v21;
  __int16 v20 = v22;
  uint64_t v12 = sub_5E3C(&qword_18E10);
  unint64_t v13 = sub_73F4();
  _ConditionalContent<>.init(storage:)( &v21,  &v19,  v12,  &type metadata for AnyView,  v13,  &protocol witness table for AnyView);
  uint64_t result = (void *)sub_7570();
LABEL_7:
  unsigned __int8 v17 = v22;
  char v18 = v23;
  *(void *)a1 = v21;
  *(_BYTE *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 9) = v18;
  return result;
}

uint64_t sub_5908@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SimpleItemRich(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v26[3] = &type metadata for String;
  v26[4] = &protocol witness table for String;
  v26[0] = 0LL;
  v26[1] = 0xE000000000000000LL;
  uint64_t v25 = 0LL;
  memset(v24, 0, sizeof(v24));
  uint64_t v23 = 0LL;
  memset(v22, 0, sizeof(v22));
  uint64_t v21 = 0LL;
  memset(v20, 0, sizeof(v20));
  sub_7578((__n128)0);
  uint64_t v16 = 0LL;
  v15[0] = v6;
  v15[1] = v6;
  uint64_t v14 = 0LL;
  v13[0] = v6;
  v13[1] = v6;
  uint64_t v12 = 0LL;
  v11[0] = v6;
  v11[1] = v6;
  uint64_t v8 = ((uint64_t (*)(void *, _OWORD *, _OWORD *, _OWORD *, uint64_t *, uint64_t *, uint64_t *, _OWORD *, _OWORD *, _OWORD *, void, uint64_t, void, void))SimpleItemRich.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:action:componentName:linkIdentifier:))( v26,  v24,  v22,  v20,  &v19,  &v18,  &v17,  v15,  v13,  v11,  0LL,  v7,  0LL,  0LL);
  uint64_t v9 = SimpleItemRich.view.getter(v8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v9;
  return result;
}

uint64_t sub_5A34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_5E3C((uint64_t *)&unk_18E20);
  sub_75BC();
  __chkstk_darwin();
  sub_755C();
  uint64_t v34 = v3;
  sub_5E3C((uint64_t *)&unk_19520);
  sub_75BC();
  __chkstk_darwin();
  sub_755C();
  uint64_t v33 = v4;
  uint64_t v5 = type metadata accessor for SimpleItemRich(0LL);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  sub_75BC();
  __chkstk_darwin();
  sub_755C();
  uint64_t v29 = v6;
  uint64_t v7 = type metadata accessor for WatchListButtonStateProvider(0LL);
  uint64_t v8 = sub_73B4(&qword_18E08, type metadata accessor for WatchListButtonStateProvider, (uint64_t)&unk_11B30);
  sub_7538();
  sub_83F4();
  uint64_t v10 = v9;
  unint64_t v12 = v11;
  sub_7570();
  v53[3] = &type metadata for String;
  v53[4] = &protocol witness table for String;
  if (v12) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = 0LL;
  }
  unint64_t v14 = 0xE000000000000000LL;
  if (v12) {
    unint64_t v14 = v12;
  }
  v53[0] = v13;
  v53[1] = v14;
  uint64_t v52 = 0LL;
  memset(v51, 0, sizeof(v51));
  uint64_t v15 = sub_7538();
  uint64_t v17 = *(void *)(v15 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_subLabel);
  uint64_t v16 = *(void *)(v15 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_subLabel + 8);
  swift_bridgeObjectRetain(v16);
  swift_release(v15);
  if (v16)
  {
    *((void *)&v49 + 1) = &type metadata for String;
    unint64_t v50 = &protocol witness table for String;
    *(void *)&__int128 v48 = v17;
    *((void *)&v48 + 1) = v16;
  }

  else
  {
    unint64_t v50 = 0LL;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
  }

  uint64_t v47 = 0LL;
  memset(v46, 0, sizeof(v46));
  uint64_t v45 = 0LL;
  memset(v44, 0, sizeof(v44));
  sub_7578((__n128)0);
  sub_7538();
  sub_83D8(v33);
  sub_7570();
  uint64_t v18 = type metadata accessor for VisualProperty(0LL);
  if (sub_67FC(v33, 1LL, v18) == 1)
  {
    sub_7450(v33, (uint64_t *)&unk_19520);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    os_log_type_t v40 = 0LL;
  }

  else
  {
    *((void *)&v39 + 1) = v18;
    os_log_type_t v40 = &protocol witness table for VisualProperty;
    uint64_t v19 = sub_748C(&v38);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32LL))(v19, v33, v18);
  }

  uint64_t v21 = v31;
  __int16 v20 = a1;
  uint64_t v22 = v30;
  StateObject.wrappedValue.getter(*(void *)v2, *(void *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), v7, v8);
  sub_843C(v34);
  sub_7570();
  uint64_t v23 = type metadata accessor for ActionProperty(0LL);
  if (sub_67FC(v34, 1LL, v23) == 1)
  {
    sub_7450(v34, (uint64_t *)&unk_18E20);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v37 = 0LL;
  }

  else
  {
    *((void *)&v36 + 1) = v23;
    id v37 = &protocol witness table for ActionProperty;
    char v24 = sub_748C(&v35);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32LL))(v24, v34, v23);
  }

  uint64_t v25 = v29;
  uint64_t v26 = SimpleItemRich.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:action:componentName:linkIdentifier:)( v53,  v51,  &v48,  v46,  v44,  &v43,  &v42,  &v41,  &v38,  &v35,  0LL,  0xE000000000000000LL,  0LL,  0LL,  v29,  v30,  v31,  a1,  v33);
  uint64_t v27 = SimpleItemRich.view.getter(v26);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
  *__int16 v20 = v27;
  return result;
}

uint64_t sub_5D88()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_5DA4()
{
  return EnvironmentValues.response.getter();
}

uint64_t sub_5DC4(uint64_t a1)
{
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_6404(a1, (uint64_t)v3);
  return EnvironmentValues.response.setter(v3);
}

uint64_t sub_5E3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5E7C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_5E9C(uint64_t a1)
{
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

void sub_5F18(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

  ;
}

void sub_5F50(void *a1@<X8>)
{
  *a1 = nullsub_1(*v1);
  sub_75D4();
}

uint64_t sub_5F74(uint64_t a1, unint64_t a2)
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

uint64_t sub_5FB8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_5FD8()
{
  unint64_t result = qword_18CD0;
  if (!qword_18CD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_11788, &type metadata for WatchListButtonRichView.Error);
    atomic_store(result, (unint64_t *)&qword_18CD0);
  }

  return result;
}

uint64_t sub_6014(void *a1)
{
  id v1 = objc_msgSend(a1, "siritvui_canonicalIdentifier");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_6074(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_60B8()
{
  sub_5FB8((void *)(v0 + 24));
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_60E4(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_60FC()
{
  return sub_56AC(*(void **)(v0 + 16), v0 + 24);
}

uint64_t sub_6108(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_6130(void *a1, uint64_t a2, uint64_t a3)
{
  v17[3] = &type metadata for StandardWatchListKitDataProvider;
  v17[4] = &off_14C60;
  uint64_t v6 = a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryImage;
  uint64_t v7 = type metadata accessor for VisualProperty(0LL);
  sub_63F8(v6, 1LL, 1LL, v7);
  sub_63F8(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateImage, 1LL, 1LL, v7);
  uint64_t v8 = (void *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryLabel);
  *uint64_t v8 = 0LL;
  v8[1] = 0LL;
  uint64_t v9 = (void *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateLabel);
  void *v9 = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = (void *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_subLabel);
  *uint64_t v10 = 0LL;
  v10[1] = 0LL;
  uint64_t v11 = a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryAction;
  uint64_t v12 = type metadata accessor for ActionProperty(0LL);
  sub_63F8(v11, 1LL, 1LL, v12);
  sub_63F8(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateAction, 1LL, 1LL, v12);
  *(void *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_model) = a1;
  sub_6074((uint64_t)v17, a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_watchListKitProvider);
  *(void *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_idiom) = 5LL;
  *(_BYTE *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_loadingState) = 0;
  *(_BYTE *)(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_buttonStyle) = 0;
  swift_beginAccess(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider__buttonType, v16, 33LL, 0LL);
  char v15 = 0;
  id v13 = a1;
  Published.init(initialValue:)(&v15, &unk_14EB0);
  swift_endAccess(v16);
  swift_beginAccess(a3 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider__buttonState, v16, 33LL, 0LL);
  char v15 = 0;
  Published.init(initialValue:)(&v15, &unk_14E20);
  swift_endAccess(v16);
  sub_84D4(a2);

  sub_5FB8(v17);
  return a3;
}

uint64_t sub_6334(void *a1, uint64_t a2)
{
  v10[3] = &type metadata for StandardWatchListKitDataProvider;
  v10[4] = &off_14C60;
  uint64_t v4 = type metadata accessor for WatchListButtonStateProvider(0LL);
  uint64_t v5 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v6 = sub_6108((uint64_t)v10, (uint64_t)&type metadata for StandardWatchListKitDataProvider);
  __chkstk_darwin(v6);
  (*(void (**)(void))(v7 + 16))();
  uint64_t v8 = sub_6130(a1, a2, v5);
  sub_5FB8(v10);
  return v8;
}

uint64_t sub_63F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_6404(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5E3C(&qword_18CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void type metadata accessor for ComparisonResult(uint64_t a1)
{
}

__n128 sub_6460(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_6470(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_6490(uint64_t result, int a2, int a3)
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

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_64CC(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for WatchListButtonRichView.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WatchListButtonRichView.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_65A4 + 4 * byte_115D0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_65C4 + 4 * byte_115D5[v4]))();
  }
}

_BYTE *sub_65A4(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_65C4(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_65CC(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_65D4(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_65DC(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_65E4(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t sub_65F0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for WatchListButtonRichView.Error()
{
  return &type metadata for WatchListButtonRichView.Error;
}

unint64_t sub_660C(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v20 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v20);
  }

  else
  {
    uint64_t v7 = *(void *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    char v9 = *(_BYTE *)(a2 + 16);
    sub_67F4(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    uint64_t v10 = *(void **)(a2 + 24);
    uint64_t v11 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v11;
    uint64_t v12 = a3[6];
    id v13 = (uint64_t *)(a1 + v12);
    unint64_t v14 = (uint64_t *)(a2 + v12);
    id v15 = v10;
    uint64_t v16 = sub_5E3C(&qword_18CA8);
    if (swift_getEnumCaseMultiPayload(v14, v16) == 1)
    {
      uint64_t v17 = type metadata accessor for Response(0LL);
      if (sub_67FC((uint64_t)v14, 1LL, v17))
      {
        uint64_t v18 = sub_5E3C(&qword_18CD8);
        memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64LL));
        uint64_t v19 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v13, v14, v17);
        uint64_t v19 = 1LL;
        sub_63F8((uint64_t)v13, 0LL, 1LL, v17);
      }
    }

    else
    {
      uint64_t v21 = *v14;
      uint64_t *v13 = *v14;
      swift_retain(v21);
      uint64_t v19 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v16, v19);
    uint64_t v22 = a3[7];
    uint64_t v23 = (uint64_t *)(a1 + v22);
    char v24 = (uint64_t *)(a2 + v22);
    uint64_t v25 = sub_5E3C(&qword_18CB0);
    if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
    {
      uint64_t v26 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v23, v24, v26);
      uint64_t v27 = 1LL;
    }

    else
    {
      uint64_t v28 = *v24;
      *uint64_t v23 = *v24;
      swift_retain(v28);
      uint64_t v27 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v23, v25, v27);
    uint64_t v29 = a3[8];
    uint64_t v30 = *(void **)(a2 + v29);
    *(void *)(a1 + v29) = v30;
    id v31 = v30;
  }

  return a1;
}

uint64_t sub_67F4(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_67FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

void sub_6808(uint64_t a1, int *a2)
{
  uint64_t v4 = (void *)(a1 + a2[6]);
  uint64_t v5 = sub_5E3C(&qword_18CA8);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    uint64_t v6 = type metadata accessor for Response(0LL);
  }

  else
  {
    swift_release(*v4);
  }

  uint64_t v7 = (void *)(a1 + a2[7]);
  uint64_t v8 = sub_5E3C(&qword_18CB0);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v7, v9);
  }

  else
  {
    swift_release(*v7);
  }
}

uint64_t sub_6908(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t sub_6910(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(_BYTE *)(a2 + 16);
  sub_67F4(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  uint64_t v9 = *(void **)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  id v13 = (uint64_t *)(a2 + v11);
  id v14 = v9;
  uint64_t v15 = sub_5E3C(&qword_18CA8);
  if (swift_getEnumCaseMultiPayload(v13, v15) == 1)
  {
    uint64_t v16 = type metadata accessor for Response(0LL);
    if (sub_67FC((uint64_t)v13, 1LL, v16))
    {
      uint64_t v17 = sub_5E3C(&qword_18CD8);
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
      uint64_t v18 = 1LL;
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v12, v13, v16);
      uint64_t v18 = 1LL;
      sub_63F8((uint64_t)v12, 0LL, 1LL, v16);
    }
  }

  else
  {
    uint64_t v19 = *v13;
    *uint64_t v12 = *v13;
    swift_retain(v19);
    uint64_t v18 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v12, v15, v18);
  uint64_t v20 = a3[7];
  uint64_t v21 = (uint64_t *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = sub_5E3C(&qword_18CB0);
  if (swift_getEnumCaseMultiPayload(v22, v23) == 1)
  {
    uint64_t v24 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v21, v22, v24);
    uint64_t v25 = 1LL;
  }

  else
  {
    uint64_t v26 = *v22;
    *uint64_t v21 = *v22;
    swift_retain(v26);
    uint64_t v25 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v21, v23, v25);
  uint64_t v27 = a3[8];
  uint64_t v28 = *(void **)(a2 + v27);
  *(void *)(a1 + v27) = v28;
  id v29 = v28;
  return a1;
}

uint64_t sub_6ACC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(_BYTE *)(a2 + 16);
  sub_67F4(*(void *)a2, v7);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_6908(v9, v10);
  uint64_t v11 = *(void **)(a1 + 24);
  uint64_t v12 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v12;
  id v13 = v12;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = (uint64_t *)(a1 + v14);
    uint64_t v16 = (uint64_t *)(a2 + v14);
    sub_7450(a1 + v14, &qword_18CA8);
    uint64_t v17 = sub_5E3C(&qword_18CA8);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      uint64_t v18 = type metadata accessor for Response(0LL);
      if (sub_67FC((uint64_t)v16, 1LL, v18))
      {
        uint64_t v19 = sub_5E3C(&qword_18CD8);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
        uint64_t v20 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v15, v16, v18);
        uint64_t v20 = 1LL;
        sub_63F8((uint64_t)v15, 0LL, 1LL, v18);
      }
    }

    else
    {
      uint64_t v21 = *v16;
      *uint64_t v15 = *v16;
      swift_retain(v21);
      uint64_t v20 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v15, v17, v20);
    uint64_t v22 = a3[7];
    uint64_t v23 = (uint64_t *)(a1 + v22);
    uint64_t v24 = (uint64_t *)(a2 + v22);
    sub_7450(a1 + v22, &qword_18CB0);
    uint64_t v25 = sub_5E3C(&qword_18CB0);
    if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
    {
      uint64_t v26 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v23, v24, v26);
      uint64_t v27 = 1LL;
    }

    else
    {
      uint64_t v28 = *v24;
      *uint64_t v23 = *v24;
      swift_retain(v28);
      uint64_t v27 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v23, v25, v27);
  }

  uint64_t v29 = a3[8];
  uint64_t v30 = *(void **)(a2 + v29);
  id v31 = *(void **)(a1 + v29);
  *(void *)(a1 + v29) = v30;
  id v32 = v30;

  return a1;
}

uint64_t sub_6CD4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_5E3C(&qword_18CA8);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    uint64_t v10 = type metadata accessor for Response(0LL);
    if (sub_67FC((uint64_t)v8, 1LL, v10))
    {
      uint64_t v11 = sub_5E3C(&qword_18CD8);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v7, v8, v10);
      sub_63F8((uint64_t)v7, 0LL, 1LL, v10);
    }

    swift_storeEnumTagMultiPayload(v7, v9, 1LL);
  }

  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  uint64_t v12 = a3[7];
  id v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_5E3C(&qword_18CB0);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    uint64_t v16 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32LL))(v13, v14, v16);
    swift_storeEnumTagMultiPayload(v13, v15, 1LL);
  }

  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_6E78(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(_BYTE *)(a2 + 16);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_6908(v7, v8);
  uint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (const void *)(a2 + v10);
    sub_7450(a1 + v10, &qword_18CA8);
    uint64_t v13 = sub_5E3C(&qword_18CA8);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      uint64_t v14 = type metadata accessor for Response(0LL);
      if (sub_67FC((uint64_t)v12, 1LL, v14))
      {
        uint64_t v15 = sub_5E3C(&qword_18CD8);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v11, v12, v14);
        sub_63F8((uint64_t)v11, 0LL, 1LL, v14);
      }

      swift_storeEnumTagMultiPayload(v11, v13, 1LL);
    }

    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    uint64_t v16 = a3[7];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (const void *)(a2 + v16);
    sub_7450(a1 + v16, &qword_18CB0);
    uint64_t v19 = sub_5E3C(&qword_18CB0);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      uint64_t v20 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32LL))(v17, v18, v20);
      swift_storeEnumTagMultiPayload(v17, v19, 1LL);
    }

    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64LL));
    }
  }

  uint64_t v21 = a3[8];
  uint64_t v22 = *(void **)(a1 + v21);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);

  return a1;
}

uint64_t sub_706C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7078);
}

uint64_t sub_7078(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_5E3C(&qword_18CB8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a3[6];
    return sub_67FC(a1 + v8, a2, v7);
  }

  uint64_t v9 = sub_5E3C(&qword_18CC0);
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v9;
    uint64_t v8 = a3[7];
    return sub_67FC(a1 + v8, a2, v7);
  }

  unint64_t v11 = *(void *)(a1 + a3[8]);
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  return (v11 + 1);
}

uint64_t sub_7120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_712C);
}

uint64_t sub_712C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_5E3C(&qword_18CB8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a4[6];
    return sub_63F8(a1 + v10, a2, a2, v9);
  }

  uint64_t result = sub_5E3C(&qword_18CC0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = a4[7];
    return sub_63F8(a1 + v10, a2, a2, v9);
  }

  *(void *)(a1 + a4[8]) = (a2 - 1);
  return result;
}

void sub_71D0(uint64_t a1)
{
  v6[0] = &unk_116A8;
  v6[1] = &unk_116C0;
  sub_7274(319LL);
  if (v3 <= 0x3F)
  {
    v6[2] = *(void *)(v2 - 8) + 64LL;
    sub_7310(319LL);
    if (v5 <= 0x3F)
    {
      v6[3] = *(void *)(v4 - 8) + 64LL;
      v6[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
      swift_initStructMetadata(a1, 256LL, 5LL, v6, a1 + 16);
    }
  }

void sub_7274(uint64_t a1)
{
  if (!qword_18DB8)
  {
    uint64_t v2 = sub_72CC(&qword_18CD8);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_18DB8);
    }
  }

uint64_t sub_72CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void sub_7310(uint64_t a1)
{
  if (!qword_18DC0)
  {
    uint64_t v2 = type metadata accessor for ColorScheme(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_18DC0);
    }
  }

unint64_t sub_7368()
{
  unint64_t result = qword_18E00;
  if (!qword_18E00)
  {
    unint64_t result = swift_getWitnessTable(&unk_11718, &type metadata for WatchListButtonRichView.Error);
    atomic_store(result, (unint64_t *)&qword_18E00);
  }

  return result;
}

uint64_t sub_73A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_11DDC, 1LL);
}

uint64_t sub_73B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_73F4()
{
  unint64_t result = qword_18E18;
  if (!qword_18E18)
  {
    uint64_t v1 = sub_72CC(&qword_18E10);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18E18);
  }

  return result;
}

uint64_t sub_7450(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5E3C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void *sub_748C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

unint64_t sub_74CC()
{
  unint64_t result = qword_18E30;
  if (!qword_18E30)
  {
    uint64_t v1 = sub_72CC(&qword_18E38);
    sub_73F4();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18E30);
  }

  return result;
}

uint64_t sub_7538()
{
  return StateObject.wrappedValue.getter(v0, v1, v2, v3, v4);
}

uint64_t sub_7550()
{
  return sub_5F74(v1, v0);
}

  ;
}

uint64_t sub_7570()
{
  return swift_release(v0);
}

void sub_7578(__n128 a1)
{
  v1[17].n128_u64[0] = 0LL;
  v1[15] = a1;
  v1[16] = a1;
  v1[14].n128_u64[0] = 0LL;
  v1[12] = a1;
  v1[13] = a1;
  v1[11].n128_u64[0] = 0LL;
  void v1[9] = a1;
  v1[10] = a1;
}

uint64_t sub_7594()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

uint64_t sub_75A4()
{
  return swift_willThrow();
}

void sub_75B0(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

  ;
}

uint64_t sub_75C8()
{
  return swift_slowAlloc(2LL, -1LL);
}

  ;
}

uint64_t sub_75DC(uint64_t a1, uint64_t a2)
{
  return swift_allocError(a1, a2, 0LL, 0LL);
}

id sub_75E8()
{
  id v0 = [(id)objc_opt_self(SiriTVUILockingCache) sharedInstance];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2
    && (_bridgeAnyObjectToAny(_:)(v8, v2),
        swift_unknownObjectRelease(v2),
        sub_777C(v8, v9),
        sub_777C(v9, v8),
        uint64_t v3 = sub_77F8(0LL, &qword_191A0, &OBJC_CLASS___WLKCanonicalPlayablesResponse_ptr),
        (swift_dynamicCast(&v7, v8, (char *)&type metadata for Any + 8, v3, 6LL) & 1) != 0))
  {
    id v4 = v7;
    id v5 = [v4 contentType];
    [v4 isWatchListable];
    [v4 isWatchListed];
    sub_778C(v4);
  }

  else
  {

    return 0LL;
  }

  return v5;
}

_OWORD *sub_777C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_778C(void *a1)
{
  id v1 = [a1 playables];
  if (!v1) {
    return 0LL;
  }
  __int128 v2 = v1;
  uint64_t v3 = sub_77F8(0LL, &qword_195E0, &OBJC_CLASS___WLKPlayable_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_77F8(uint64_t a1, unint64_t *a2, void *a3)
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

ValueMetadata *type metadata accessor for StandardWatchListKitDataProvider()
{
  return &type metadata for StandardWatchListKitDataProvider;
}

double sub_7840(uint64_t a1, uint64_t a2, char a3, char a4, double a5, double a6)
{
  return sub_7CE0(a1, a2, a3, a4, (SEL *)&selRef_onIconDynamicImage, a5, a6);
}

double sub_784C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, double a6, double a7, double a8)
{
  int v66 = a4;
  int v67 = a5;
  sub_5E3C(&qword_191A8);
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v16 = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)v62 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)v62 - v20;
  uint64_t v22 = type metadata accessor for URL(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v24);
  uint64_t v65 = (uint64_t)v62 - v27;
  uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___NSDictionary);
  uint64_t v29 = sub_7E08(a3, v28);
  if (!v29) {
    goto LABEL_16;
  }
  uint64_t v30 = v29;
  v63 = v16;
  id v31 = [objc_allocWithZone(NSNumber) initWithInteger:1];
  id v32 = sub_E550(v31, v30);

  if (!v32)
  {
    sub_804C();
LABEL_16:
    sub_8010(a1);
    uint64_t v49 = a2;
LABEL_25:
    sub_8010(v49);
    return 0.0;
  }

  if (a8 <= 2.22044605e-16)
  {
    id v33 = [(id)objc_opt_self(UIScreen) mainScreen];
    id v34 = [v33 traitCollection];
    v62[1] = v23;
    __int128 v35 = v32;
    __int128 v36 = v19;
    uint64_t v37 = a1;
    uint64_t v38 = a2;
    id v39 = v34;

    [v39 displayScale];
    a8 = v40;

    a2 = v38;
    a1 = v37;
    uint64_t v19 = v36;
    id v32 = v35;
    if (a8 <= 1.0) {
      a8 = 1.0;
    }
  }

  [v32 pixelWidth];
  double v42 = v41;
  id v43 = [v32 pixelHeight];
  uint64_t v64 = a1;
  if (v42 <= 0.0)
  {
    uint64_t v48 = a2;
  }

  else
  {
    v45.n128_f64[0] = v44;
    uint64_t v48 = a2;
    if (v44 > 0.0)
    {
      if ((v66 & 1) != 0) {
        v46.n128_f64[0] = a6;
      }
      else {
        v46.n128_f64[0] = 1.79769313e308;
      }
      if ((v67 & 1) != 0) {
        v47.n128_f64[0] = a7;
      }
      else {
        v47.n128_f64[0] = 1.79769313e308;
      }
      a6 = SiriUIAspectFitSizeInSizeWithScale(v43, v42, v45, v46, v47, a8);
    }
  }

  id v50 = sub_803C(v32, "sf_urlForSettings:size:");
  if (!v50)
  {
    sub_8010((uint64_t)v21);
    goto LABEL_24;
  }

  uint64_t v51 = v50;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_8054((uint64_t)v21, (uint64_t)v26);
  sub_8020((uint64_t)v21, 0LL);
  if (sub_67FC((uint64_t)v21, 1LL, v22) == 1)
  {
LABEL_24:

    sub_804C();
    sub_7ED8((uint64_t)v21);
    sub_8010(v64);
    uint64_t v49 = v48;
    goto LABEL_25;
  }

  uint64_t v52 = v32;
  uint64_t v53 = v65;
  sub_8054(v65, (uint64_t)v21);
  sub_8010((uint64_t)v19);
  id v54 = [objc_allocWithZone(NSNumber) initWithInteger:2];
  uint64_t v55 = sub_E550(v54, v30);

  sub_804C();
  if (v55)
  {
    sub_77F8(0LL, &qword_191B0, &OBJC_CLASS___SFDynamicURLImageResource_ptr);
    if ((static NSObject.== infix(_:_:)(v55, v52) & 1) != 0)
    {
    }

    else
    {
      id v57 = sub_803C(v55, "sf_urlForSettings:size:");
      if (v57)
      {
        v58 = v57;
        uint64_t v59 = (uint64_t)v63;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v60 = 0LL;
      }

      else
      {
        uint64_t v60 = 1LL;
        uint64_t v59 = (uint64_t)v63;
      }

      sub_7ED8((uint64_t)v19);
      sub_63F8(v59, v60, 1LL, v22);
      sub_7F18(v59, (uint64_t)v19);
    }
  }

  else
  {
  }

  uint64_t v61 = v64;
  sub_8054(v64, v53);
  sub_8020(v61, 0LL);
  sub_7F18((uint64_t)v19, v48);
  return a6;
}

double sub_7CD4(uint64_t a1, uint64_t a2, char a3, char a4, double a5, double a6)
{
  return sub_7CE0(a1, a2, a3, a4, (SEL *)&selRef_offIconDynamicImage, a5, a6);
}

double sub_7CE0(uint64_t a1, uint64_t a2, char a3, char a4, SEL *a5, double a6, double a7)
{
  uint64_t v8 = v7;
  uint64_t v15 = sub_7FB0(v8, a5);
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [(id)objc_opt_self(UIScreen) mainScreen];
    id v18 = [v17 traitCollection];

    [v18 displayScale];
    double v20 = v19;

    double v21 = sub_784C(a1, a2, v16, a3 & 1, a4 & 1, a6, a7, v20);
    swift_bridgeObjectRelease(v16);
  }

  else
  {
    type metadata accessor for URL(0LL);
    sub_802C(a1);
    sub_802C(a2);
    return 0.0;
  }

  return v21;
}

uint64_t sub_7E08(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v4 = objc_msgSend(a2, "siritvui_imageDictionaryForDynamicImageDataDictionary:", isa);

  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = sub_77F8(0LL, &qword_191B8, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v6 = sub_77F8(0LL, &qword_191B0, &OBJC_CLASS___SFDynamicURLImageResource_ptr);
  unint64_t v7 = sub_7F60();
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_7ED8(uint64_t a1)
{
  uint64_t v2 = sub_5E3C(&qword_191A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_7F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5E3C(&qword_191A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_7F60()
{
  unint64_t result = qword_191C0;
  if (!qword_191C0)
  {
    uint64_t v1 = sub_77F8(255LL, &qword_191B8, &OBJC_CLASS___NSNumber_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_191C0);
  }

  return result;
}

uint64_t sub_7FB0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  &type metadata for Data,  &protocol witness table for String);

  return v4;
}

uint64_t sub_8010(uint64_t a1)
{
  return sub_63F8(a1, 1LL, 1LL, v1);
}

uint64_t sub_8020(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

uint64_t sub_802C(uint64_t a1)
{
  return sub_63F8(a1, 1LL, 1LL, v1);
}

id sub_803C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0, v3, v2);
}

uint64_t sub_804C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_8054(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

BOOL sub_805C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_8070(uint64_t a1, char a2)
{
}

void sub_8090(uint64_t a1)
{
}

BOOL sub_80BC(char a1, char a2)
{
  return a1 == a2;
}

void sub_80CC(uint64_t a1, unsigned __int8 a2)
{
}

void sub_80EC(uint64_t a1)
{
}

BOOL sub_8118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_805C(*a1, *a2);
}

void sub_8124()
{
}

void sub_812C(uint64_t a1)
{
}

Swift::Int sub_8134(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_8174(char *a1, char *a2)
{
  return sub_80BC(*a1, *a2);
}

void sub_8180()
{
}

void sub_8198(uint64_t a1)
{
}

void sub_81A0(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  sub_E478();
  sub_E190();
}

void sub_81D4()
{
  qword_191D0 = 0x65726F7473707061LL;
  *(void *)algn_191D8 = 0xE800000000000000LL;
}

uint64_t sub_81F8(uint64_t a1)
{
  return sub_8220(a1, qword_1A0A0, &enum case for ImageElement.ImageStyle.appIcon3(_:));
}

uint64_t sub_820C(uint64_t a1)
{
  return sub_8220(a1, qword_1A0B8, &enum case for ImageElement.ImageStyle.image3(_:));
}

uint64_t sub_8220(uint64_t a1, uint64_t *a2, unsigned int *a3)
{
  uint64_t v5 = type metadata accessor for ImageElement.ImageStyle(0LL);
  sub_DAF8(v5, a2);
  uint64_t v6 = sub_DA8C(v5, (uint64_t)a2);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v5 - 8) + 104LL))(v6, *a3, v5);
}

void sub_8278()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_11BB8);
  uint64_t v2 = swift_getKeyPath(&unk_11BE0);
  sub_E030(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, SWORD2(v11), SBYTE6(v11), SHIBYTE(v11));
  swift_release(KeyPath);
  swift_release(v0);
  sub_E22C();
}

void sub_82C8(char a1)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_11BB8);
  uint64_t v4 = swift_getKeyPath(&unk_11BE0);
  char v5 = a1;
  swift_retain(v1);
  static Published.subscript.setter(&v5, v1, KeyPath, v4);
  sub_E22C();
}

void sub_8328()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_11B70);
  uint64_t v2 = swift_getKeyPath(&unk_11B98);
  sub_E030(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, SWORD2(v11), SBYTE6(v11), SHIBYTE(v11));
  swift_release(KeyPath);
  swift_release(v0);
  sub_E22C();
}

void sub_8378(char a1)
{
  char v2 = a1 & 1;
  uint64_t KeyPath = swift_getKeyPath(&unk_11B70);
  uint64_t v4 = swift_getKeyPath(&unk_11B98);
  char v5 = v2;
  swift_retain(v1);
  static Published.subscript.setter(&v5, v1, KeyPath, v4);
  sub_E22C();
}

void sub_83D8(uint64_t a1@<X8>)
{
}

void sub_83F4()
{
}

void sub_843C(uint64_t a1@<X8>)
{
}

void sub_8458(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  if (v7) {
    uint64_t v8 = *a2;
  }
  else {
    uint64_t v8 = *a1;
  }
  uint64_t v9 = v3 + v8;
  swift_beginAccess(v9, v10, 0LL, 0LL);
  sub_DD98(v9, a3);
}

void sub_84D4(uint64_t a1)
{
  uint64_t v3 = sub_E068();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_DEA0();
  if (!*(_BYTE *)(v1 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_loadingState))
  {
    *(void *)(v1 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_idiom) = a1;
    id v6 = sub_E24C(v5, "siritvui_canonicalIdentifier");
    if (v6)
    {
      char v7 = v6;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

      sub_DBA8( (void *)(v1 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_watchListKitProvider),  *(void *)(v1 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_watchListKitProvider + 24));
      sub_75E8();
      uint64_t v9 = v8;
      uint64_t v10 = sub_E048();
      if (v9)
      {
        sub_E3E4();
        sub_E3C4();
        swift_bridgeObjectRelease_n(v9, 2LL);
      }

      else
      {
        sub_E24C(v10, "isWatchlistable");
        sub_86D8();
      }
    }

    else if (AFSiriLogContextConnection)
    {
      id v11 = AFSiriLogContextConnection;
      uint64_t v12 = sub_E140();
      uint64_t v13 = static os_log_type_t.error.getter(v12);
      os_log_type_t v14 = v13;
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v13);
      if (os_log_type_enabled(v15, v14))
      {
        uint64_t v16 = (uint8_t *)sub_75C8();
        *(_WORD *)uint64_t v16 = 0;
        sub_DD90(&dword_0, v15, v14, "#aceshim missing canonical identifier", v16);
        sub_DCD4((uint64_t)v16);
      }

      uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
      sub_E24C(v17, "isWatchlistable");
      sub_E3C4();
    }

    else
    {
      __break(1u);
    }
  }

void sub_86D8()
{
  int v4 = v3;
  int64_t v6 = v5;
  int v105 = v7;
  uint64_t v9 = v8;
  uint64_t v112 = *v0;
  sub_5E3C((uint64_t *)&unk_19520);
  sub_DCC4();
  __chkstk_darwin(v10);
  sub_DCA4();
  uint64_t v108 = v11;
  sub_DCB8();
  __chkstk_darwin(v12);
  sub_DE08();
  uint64_t v109 = v13;
  sub_5E3C((uint64_t *)&unk_18E20);
  sub_DCC4();
  __chkstk_darwin(v14);
  sub_DCA4();
  uint64_t v106 = v15;
  sub_DCB8();
  __chkstk_darwin(v16);
  sub_E204();
  __chkstk_darwin(v17);
  sub_DD0C();
  uint64_t v110 = v18;
  sub_DCB8();
  __chkstk_darwin(v19);
  double v21 = (char *)&v100 - v20;
  uint64_t v22 = sub_E068();
  uint64_t v107 = *(void *)(v22 - 8);
  sub_75BC();
  __chkstk_darwin(v23);
  sub_E1CC();
  __chkstk_darwin(v24);
  sub_DD0C();
  uint64_t v104 = v25;
  sub_DCB8();
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v100 - v28;
  __chkstk_darwin(v27);
  id v31 = (char *)&v100 - v30;
  int v111 = v4;
  *((_BYTE *)v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_loadingState) = v4;
  v113 = v0;
  sub_8E30( *(void *)((char *)v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_model),  (uint64_t)v9,  0LL,  v6);
  if (!(_BYTE)v32)
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v36 = Logger.init(_:)(AFSiriLogContextConnection);
      static os_log_type_t.error.getter(v36);
      uint64_t v37 = (os_log_s *)sub_E46C();
      if (sub_DFBC(v37))
      {
        uint64_t v38 = (_WORD *)sub_75C8();
        sub_E350(v38);
        sub_DD90(&dword_0, v37, (os_log_type_t)v31, "#aceshim unable to find a suitable button type", v9);
        sub_DCD4((uint64_t)v9);
      }

      sub_E41C();
      v39(v2, v22);
      sub_E184();
      goto LABEL_46;
    }

LABEL_72:
    __break(1u);
    goto LABEL_73;
  }

  uint64_t v33 = v32;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0) {
      uint64_t v99 = v6;
    }
    else {
      uint64_t v99 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_E400();
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter(v99);
  }

  else
  {
    uint64_t v34 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8LL));
    sub_E400();
  }

  uint64_t v103 = v22;
  if (v34)
  {
    if ((v6 & 0xC000000000000001LL) != 0)
    {
      id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v6);
      goto LABEL_8;
    }

    if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8LL)))
    {
      id v35 = *(id *)(v6 + 32);
LABEL_8:
      sub_DD6C();
      goto LABEL_17;
    }

    __break(1u);
    goto LABEL_72;
  }

  sub_DD6C();
  if (!AFSiriLogContextConnection)
  {
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }

  uint64_t v40 = Logger.init(_:)(AFSiriLogContextConnection);
  uint64_t v41 = static os_log_type_t.error.getter(v40);
  os_log_type_t v42 = v41;
  id v43 = (os_log_s *)Logger.logObject.getter(v41);
  if (os_log_type_enabled(v43, v42))
  {
    double v44 = (uint8_t *)sub_75C8();
    *(_WORD *)double v44 = 0;
    sub_DD90(&dword_0, v43, v42, "#aceshim unable to find a suitable playable", v44);
    uint64_t v45 = (uint64_t)v44;
    uint64_t v22 = v103;
    sub_DCD4(v45);
  }

  sub_E41C();
  v46(v31, v22);
  id v35 = 0LL;
LABEL_17:
  if (v111 == 2)
  {
    sub_E01C();
    sub_91A0();
    sub_DD98((uint64_t)v21, v1);
    uint64_t v47 = sub_E280();
    int v48 = sub_67FC(v1, 1LL, v47);
    sub_DCE0(v1);
    if (v48 == 1)
    {
      if (AFSiriLogContextConnection)
      {
        uint64_t v49 = Logger.init(_:)(AFSiriLogContextConnection);
        uint64_t v50 = static os_log_type_t.error.getter(v49);
        uint64_t v37 = (os_log_s *)Logger.logObject.getter(v50);
        if (sub_DFBC(v37))
        {
          uint64_t v51 = (_WORD *)sub_75C8();
          sub_E350(v51);
          sub_DD90( &dword_0,  v37,  (os_log_type_t)v50,  "#aceshim unable to find a suitable primary command",  (uint8_t *)v33);
          sub_DCD4(v33);
        }

        sub_E41C();
        v52(v29, v103);
        sub_E184();

        uint64_t v53 = (uint64_t)v21;
LABEL_45:
        sub_DAD0(v53, (uint64_t *)&unk_18E20);
LABEL_46:
        *((_BYTE *)v37 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_buttonStyle) = 0;
LABEL_47:
        sub_DCE8();
        return;
      }

      goto LABEL_74;
    }

    v101 = v21;
    sub_E008();
    sub_91A0();
  }

  else
  {
    sub_E280();
    v101 = v21;
    sub_DF24((uint64_t)v21, 1LL);
    sub_DF24(v110, 1LL);
  }

  char v54 = sub_E01C();
  sub_96F8(v54);
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  char v59 = sub_E008();
  sub_96F8(v59);
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  sub_9914(v33, v62, v35);
  uint64_t v100 = v64;
  uint64_t v102 = v65;
  uint64_t v66 = sub_E01C();
  sub_9994(v66, v67, v68, v69, v70);
  uint64_t v71 = sub_E008();
  sub_9994(v71, v72, v73, v74, v75);
  uint64_t v76 = v63;
  if (((1 << v33) & 0x56) != 0)
  {
    uint64_t v77 = v61;
    char v78 = 0;
    if (v58) {
      uint64_t v79 = v56;
    }
    else {
      uint64_t v79 = 0LL;
    }
    if (!v58) {
      uint64_t v58 = 0xE000000000000000LL;
    }
    int v80 = 1;
    uint64_t v81 = (uint64_t)v101;
    goto LABEL_32;
  }

  uint64_t v81 = (uint64_t)v101;
  if (v33 == 3)
  {
    if (v58)
    {
      uint64_t v79 = v56;
      uint64_t v77 = v61;
      char v78 = 0;
      int v80 = 1;
      LODWORD(v33) = 3;
    }

    else
    {
      uint64_t v77 = v61;
      LODWORD(v33) = 4;
      sub_96F8(4);
      char v78 = 0;
      if (v98) {
        uint64_t v79 = v97;
      }
      else {
        uint64_t v79 = 0LL;
      }
      if (v98) {
        uint64_t v58 = v98;
      }
      else {
        uint64_t v58 = 0xE000000000000000LL;
      }
      int v80 = 1;
    }

LABEL_32:
    else {
      unsigned int v82 = 0;
    }
    uint64_t v83 = v110;
    uint64_t v84 = v108;
    uint64_t v85 = v109;
    sub_BD54(v82, v78 & 1, v33, v79, v58, v77, v76, v100, v102, v109, v108, v81, v110);

    sub_E048();
    swift_bridgeObjectRelease(v58);
    sub_DD6C();
    sub_DCE0(v84);
    sub_DCE0(v85);
    sub_DCE0(v83);
    sub_DCE0(v81);
    goto LABEL_47;
  }

  uint64_t v86 = v106;
  sub_DBCC(v110, v106, (uint64_t *)&unk_18E20);
  uint64_t v87 = sub_E280();
  uint64_t v88 = sub_DD74(v86, 1LL, v87);
  if (!v89)
  {
    sub_E0DC(v88, (uint64_t *)&unk_18E20);
    char v78 = v105 ^ 1;
    if (v58) {
      uint64_t v79 = v56;
    }
    else {
      uint64_t v79 = 0LL;
    }
    if (!v58) {
      uint64_t v58 = 0xE000000000000000LL;
    }
    if (v63) {
      uint64_t v77 = v61;
    }
    else {
      uint64_t v77 = 0LL;
    }
    if (!v63) {
      uint64_t v76 = 0xE000000000000000LL;
    }
    int v80 = 2;
    LODWORD(v33) = 5;
    goto LABEL_32;
  }

  swift_bridgeObjectRelease(v102);
  sub_DD6C();
  uint64_t v90 = swift_bridgeObjectRelease(v58);
  sub_E0DC(v90, (uint64_t *)&unk_18E20);
  if (AFSiriLogContextConnection)
  {
    id v91 = AFSiriLogContextConnection;
    uint64_t v92 = v104;
    uint64_t v93 = Logger.init(_:)(v91);
    uint64_t v94 = static os_log_type_t.error.getter(v93);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v94);
    if (sub_DFBC(v37))
    {
      v95 = (_WORD *)sub_75C8();
      sub_E350(v95);
      sub_DD90( &dword_0,  v37,  (os_log_type_t)v94,  "#aceshim unable to find a suitable secondary command",  (uint8_t *)v33);
      sub_DCD4(v33);
    }

    sub_E41C();
    v96(v92, v103);
    sub_E184();

    sub_DCE0(v108);
    sub_DCE0(v109);
    sub_DCE0(v110);
    uint64_t v53 = v81;
    goto LABEL_45;
  }

LABEL_75:
  __break(1u);
}

void sub_8E30(uint64_t a1, uint64_t a2, uint64_t a3, int64_t a4)
{
  uint64_t v7 = sub_E068();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_DEA0();
  if (a2 != 5)
  {
    if (AFSiriLogContextConnection)
    {
      id v18 = AFSiriLogContextConnection;
      uint64_t v19 = sub_E140();
      uint64_t v20 = static os_log_type_t.debug.getter(v19);
      os_log_type_t v21 = v20;
      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v20);
      if (os_log_type_enabled(v22, v21))
      {
        uint64_t v23 = (uint8_t *)sub_75C8();
        *(_WORD *)uint64_t v23 = 0;
        sub_DD90(&dword_0, v22, v21, "#aceshim only sporting events are currently supported", v23);
        sub_DCD4((uint64_t)v23);
      }

      sub_E1FC(v4, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
      return;
    }

LABEL_54:
    __break(1u);
    return;
  }

  if (!((unint64_t)a4 >> 62))
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFF8LL));
    sub_E3E4();
    if (v9) {
      goto LABEL_4;
    }
LABEL_21:
    sub_DE70();
    uint64_t v11 = 0LL;
    goto LABEL_22;
  }

  if (a4 < 0) {
    uint64_t v24 = a4;
  }
  else {
    uint64_t v24 = a4 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_E3E4();
  if (!_CocoaArrayWrapper.endIndex.getter(v24)) {
    goto LABEL_21;
  }
LABEL_4:
  if ((a4 & 0xC000000000000001LL) != 0)
  {
    id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a4);
    goto LABEL_7;
  }

  if (!*(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFF8LL)))
  {
    __break(1u);
    goto LABEL_54;
  }

  id v10 = *(id *)(a4 + 32);
LABEL_7:
  uint64_t v11 = v10;
  uint64_t v12 = sub_DE70();
  if ((sub_E24C(v12, "isAppInstalled") & 1) != 0)
  {
    id v13 = v11;
    id v14 = sub_E624();

    if (v14)
    {
      id v15 = v13;
      unsigned __int8 v16 = sub_E7B4();

      if (v16)
      {

        return;
      }
    }
  }

LABEL_22:
  sub_DB74(0LL, &qword_195E0, &OBJC_CLASS___WLKPlayable_ptr);
  sub_EAB4(a4);
  unint64_t v26 = v25;
  if (!((unint64_t)v25 >> 62))
  {
LABEL_32:
    sub_DFC8();
    uint64_t v17 = sub_DE70();
    goto LABEL_33;
  }

  if (v25 < 0) {
    uint64_t v28 = v25;
  }
  else {
    uint64_t v28 = v25 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v25);
  uint64_t v29 = _CocoaArrayWrapper.endIndex.getter(v28);
  sub_DFC8();
  if (!v29) {
    goto LABEL_32;
  }
LABEL_24:
  uint64_t v27 = sub_EC34(v26);
  sub_DFC8();
  uint64_t v17 = sub_DE70();
  if (v27 == 1 || v27 >= 2) {
    goto LABEL_25;
  }
LABEL_33:
  id v30 = sub_E17C(v17, "liveTuneInButton");
  if (v30 && (sub_D920(v30, (SEL *)&selRef_liveTuneInButtonType), v32))
  {
    uint64_t v33 = v31;
    unint64_t v34 = v32;
  }

  else
  {
    swift_bridgeObjectRelease(0LL);
    uint64_t v33 = 0LL;
    unint64_t v34 = 0xE000000000000000LL;
  }

  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(SALCMLiveTuneInButtonTypeWatchNowValue);
  if (v33 == v35 && v34 == v36) {
    goto LABEL_50;
  }
  char v38 = sub_DF4C(v35, v36);
  sub_DFC8();
  if ((v38 & 1) != 0)
  {
    sub_E0D4();
LABEL_25:

    return;
  }

  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(SALCMLiveTuneInButtonTypeGetAppValue);
  if (v33 == v39 && v34 == v40)
  {
LABEL_50:
    swift_bridgeObjectRelease_n(v34, 2LL);
    goto LABEL_25;
  }

  char v42 = sub_DF4C(v39, v40);
  sub_DFC8();
  uint64_t v43 = sub_E0D4();
  if ((v42 & 1) != 0) {
    goto LABEL_25;
  }
  id v44 = sub_E17C(v43, "getAppsCommand");

  if (v44)
  {
    uint64_t v45 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
    sub_E0A0(v45);
    sub_E168();
  }

  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *uint64_t v24 = v8;
  v24[1] = a2;
  uint64_t v25 = *(void *)(v23 + 16);
  unint64_t v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

void sub_91A0()
{
  char v1 = v0;
  sub_E4A0();
  sub_75BC();
  __chkstk_darwin(v2);
  sub_755C();
  sub_5E3C(&qword_19530);
  sub_DCC4();
  __chkstk_darwin(v3);
  sub_E2A8();
  sub_5E3C((uint64_t *)&unk_18E20);
  sub_DCC4();
  __chkstk_darwin(v4);
  sub_DCA4();
  sub_DCB8();
  __chkstk_darwin(v5);
  sub_E204();
  __chkstk_darwin(v6);
  sub_E068();
  sub_75BC();
  __chkstk_darwin(v7);
  sub_E070();
  uint64_t v9 = __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  sub_E280();
  sub_DDAC();
  sub_E320(v10, v11, v12);
  __asm { BR              X9 }

void sub_9304()
{
  if (!v0 || (v1 = v0, (id v6 = sub_E624()) == 0LL))
  {
    if (!AFSiriLogContextConnection)
    {
      __break(1u);
      JUMPOUT(0x96D4LL);
    }

    uint64_t v7 = Logger.init(_:)(AFSiriLogContextConnection);
    static os_log_type_t.error.getter(v7);
    uint64_t v8 = (os_log_s *)sub_E46C();
    if (sub_DF3C(v8))
    {
      uint64_t v9 = (uint8_t *)sub_75C8();
      *(_WORD *)uint64_t v9 = 0;
      sub_DD90(&dword_0, v0, v1, "#aceshim invalid AppPunchoutCommand", v9);
      sub_DCD4((uint64_t)v9);
    }

    (*(void (**)(uint64_t, void))(*(void *)(v5 - 112) + 8LL))(v4, *(void *)(v5 - 104));
    id v6 = 0LL;
  }

  uint64_t v10 = *(void *)(v5 - 88);
  sub_DBCC(v10, v3, (uint64_t *)&unk_18E20);
  uint64_t v11 = sub_DD74(v3, 1LL, v2);
  if (v12)
  {
    sub_E3F8(v11, (uint64_t *)&unk_18E20);
    if (v6)
    {
      uint64_t v13 = *(void *)(v5 - 128);
      uint64_t v14 = *(void *)(v5 - 120);
      *(void *)uint64_t v13 = v6;
      *(_BYTE *)(v13 + 8) = 0;
      uint64_t v15 = *(void *)(v5 - 96);
      (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for Command.aceCommand(_:), v15);
      ActionPropertyConvertible<>.asActionProperty()( v15,  &protocol witness table for Command,  &protocol witness table for Command);
      sub_E0CC(v13, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
      sub_DCE0(v10);
      uint64_t v16 = sub_E4D0();
      sub_E2F8(v16, v10);
    }
  }

  else
  {

    sub_E3F8(v17, (uint64_t *)&unk_18E20);
  }

  sub_DCE8();
}

void sub_96F8(char a1)
{
  __asm { BR              X9 }

uint64_t sub_972C()
{
  return sub_E25C();
}

void sub_9914(unsigned __int8 a1, uint64_t a2, void *a3)
{
  if (a1 - 3 < 0xFFFFFFFE || a3 == 0LL)
  {
    sub_E0C4();
  }

  else
  {
    id v4 = sub_E39C(a1, "channelDetails", a3);
    if (v4)
    {
      sub_D920(v4, (SEL *)&selRef_name);
      if (v6)
      {
        uint64_t v7 = HIBYTE(v6) & 0xF;
        if ((v6 & 0x2000000000000000LL) == 0) {
          uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
        }
        if (!v7) {
          swift_bridgeObjectRelease(v6);
        }
      }
    }
  }

void sub_9994(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v113 = a4;
  uint64_t v120 = a3;
  v111[6] = a2;
  uint64_t v122 = a1;
  uint64_t v6 = type metadata accessor for ImageElement.AppIcon(0LL);
  sub_DE14(v6, (uint64_t)v118);
  v111[0] = v7;
  sub_75BC();
  __chkstk_darwin(v8);
  sub_755C();
  uint64_t v10 = sub_DD18(v9);
  uint64_t v127 = type metadata accessor for ImageElement.SourceType(v10);
  uint64_t v121 = *(void *)(v127 - 8);
  sub_75BC();
  __chkstk_darwin(v11);
  sub_755C();
  uint64_t v13 = sub_DD18(v12);
  uint64_t v14 = type metadata accessor for ImageElement(v13);
  sub_DE14(v14, (uint64_t)v130);
  uint64_t v116 = v15;
  sub_75BC();
  __chkstk_darwin(v16);
  sub_755C();
  uint64_t v18 = sub_DD18(v17);
  uint64_t v125 = type metadata accessor for ImageElement.Background(v18);
  uint64_t v123 = *(void *)(v125 - 8);
  sub_75BC();
  __chkstk_darwin(v19);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v20);
  sub_DE08();
  uint64_t v22 = sub_DD18(v21);
  uint64_t v23 = type metadata accessor for Logger(v22);
  sub_DE14(v23, (uint64_t)v128);
  v111[7] = v24;
  sub_75BC();
  __chkstk_darwin(v25);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v26);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v27);
  sub_DE08();
  uint64_t v29 = sub_DD18(v28);
  uint64_t v30 = type metadata accessor for ImageElement.Url(v29);
  sub_DE14(v30, (uint64_t)v111);
  sub_75BC();
  __chkstk_darwin(v31);
  sub_755C();
  sub_DED4(v32);
  sub_5E3C(&qword_191A8);
  sub_DCC4();
  __chkstk_darwin(v33);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v34);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v35);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v36);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v37);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v38);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v39);
  sub_5E3C(&qword_19560);
  sub_DCC4();
  __chkstk_darwin(v40);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v41);
  sub_E4BC();
  __chkstk_darwin(v42);
  sub_DE08();
  sub_DED4(v43);
  sub_5E3C(&qword_19568);
  sub_DCC4();
  __chkstk_darwin(v44);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v45);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v46);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v47);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v48);
  sub_DE08();
  sub_DED4(v49);
  sub_5E3C(&qword_19570);
  sub_DCC4();
  __chkstk_darwin(v50);
  sub_755C();
  uint64_t v124 = v51;
  uint64_t v52 = type metadata accessor for ImageElement.Symbol(0LL);
  sub_DE14(v52, (uint64_t)v129);
  v111[9] = v53;
  sub_75BC();
  __chkstk_darwin(v54);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v55);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v56);
  sub_DE08();
  uint64_t v58 = sub_DD18(v57);
  uint64_t v59 = type metadata accessor for ImageElement.CornerRoundingMode(v58);
  sub_DE14(v59, (uint64_t)v115);
  sub_75BC();
  __chkstk_darwin(v60);
  sub_755C();
  uint64_t v62 = sub_DD18(v61);
  uint64_t v63 = type metadata accessor for ImageElement.RenderingMode(v62);
  sub_DE14(v63, (uint64_t)v114);
  sub_75BC();
  __chkstk_darwin(v64);
  sub_755C();
  uint64_t v66 = sub_DD18(v65);
  uint64_t v67 = type metadata accessor for ImageElement.ContentMode(v66);
  sub_DE14(v67, (uint64_t)v112);
  sub_75BC();
  __chkstk_darwin(v68);
  sub_755C();
  sub_DED4(v69);
  sub_5E3C(&qword_19578);
  sub_DCC4();
  __chkstk_darwin(v70);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v71);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v72);
  sub_DE08();
  sub_DED4(v73);
  sub_5E3C(&qword_19580);
  sub_DCC4();
  __chkstk_darwin(v74);
  sub_DCA4();
  sub_DC94();
  __chkstk_darwin(v75);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v76);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v77);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v78);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v79);
  sub_DD0C();
  uint64_t v126 = v80;
  sub_DCB8();
  __chkstk_darwin(v81);
  sub_DE08();
  uint64_t v83 = sub_DD18(v82);
  uint64_t v84 = type metadata accessor for ImageElement.ImageStyle(v83);
  sub_DE14(v84, (uint64_t)&v132);
  sub_75BC();
  __chkstk_darwin(v85);
  sub_755C();
  sub_DED4(v86);
  sub_5E3C(&qword_19588);
  sub_DCC4();
  __chkstk_darwin(v87);
  sub_755C();
  sub_DED4(v88);
  sub_5E3C((uint64_t *)&unk_19520);
  sub_DCC4();
  __chkstk_darwin(v89);
  sub_755C();
  uint64_t v91 = sub_DD18(v90);
  uint64_t v92 = type metadata accessor for URL(v91);
  sub_DE14(v92, (uint64_t)&v131);
  v111[1] = v93;
  sub_75BC();
  __chkstk_darwin(v94);
  sub_DCA4();
  sub_DC94();
  uint64_t v96 = __chkstk_darwin(v95);
  __chkstk_darwin(v96);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v97);
  sub_DD0C();
  sub_DC94();
  __chkstk_darwin(v98);
  sub_DE08();
  sub_DED4(v99);
  sub_5E3C(&qword_19590);
  sub_DCC4();
  __chkstk_darwin(v100);
  sub_E070();
  uint64_t v102 = __chkstk_darwin(v101);
  uint64_t v103 = __chkstk_darwin(v102);
  __chkstk_darwin(v103);
  sub_DD0C();
  sub_DC94();
  uint64_t v105 = __chkstk_darwin(v104);
  __chkstk_darwin(v105);
  uint64_t v106 = sub_E2DC();
  type metadata accessor for VisualProperty(v106);
  uint64_t v119 = a5;
  sub_DDAC();
  uint64_t v117 = v107;
  sub_63F8(v108, v109, v110, v107);
  __asm { BR              X10 }

void sub_BD54( unsigned int a1, char a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v41 = __PAIR64__(a3, a1);
  HIDWORD(v36) = a2 & 1;
  uint64_t v17 = (void *)(v13 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryLabel);
  *uint64_t v17 = a4;
  v17[1] = a5;
  swift_bridgeObjectRetain(a5);
  sub_DE70();
  uint64_t v18 = (void *)(v13 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateLabel);
  void *v18 = a6;
  v18[1] = a7;
  swift_bridgeObjectRetain(a7);
  sub_DE70();
  uint64_t v19 = (void *)(v13 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_subLabel);
  *uint64_t v19 = a8;
  v19[1] = a9;
  swift_bridgeObjectRetain(a9);
  sub_DD6C();
  sub_DD4C(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryImage, v32, v36, v41);
  sub_DF30(a10);
  sub_E224(v20, v21, v22);
  sub_DD4C(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateImage, v33, v37, v42);
  sub_DF30(a11);
  sub_E224(v23, v24, v25);
  sub_DD4C(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryAction, v34, v38, v43);
  sub_DF30(a12);
  sub_E224(v26, v27, v28);
  sub_DD4C(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateAction, v35, v39, v44);
  sub_DF30(a13);
  sub_E224(v29, v30, v31);
  sub_82C8(v45);
  sub_8378(v40);
  *(_BYTE *)(v13 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_buttonStyle) = v46;
}

void sub_BEA8()
{
  unint64_t v2 = v1;
  uint64_t v61 = v3;
  uint64_t v60 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  sub_DE90();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_E068();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_E070();
  uint64_t v12 = v10 - v11;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v58 - v14;
  sub_5E3C(&qword_19530);
  sub_DCC4();
  __chkstk_darwin(v16);
  sub_DE90();
  uint64_t v19 = v18 - v17;
  if (!(v2 >> 62))
  {
    uint64_t v20 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    if (v20) {
      goto LABEL_3;
    }
LABEL_19:
    if (AFSiriLogContextConnection)
    {
      uint64_t v53 = Logger.init(_:)(AFSiriLogContextConnection);
      os_log_type_t v54 = static os_log_type_t.error.getter(v53);
      uint64_t v55 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
      os_log_type_t v56 = v54;
      if (os_log_type_enabled(v55, v54))
      {
        uint64_t v57 = (uint8_t *)sub_75C8();
        *(_WORD *)uint64_t v57 = 0;
        sub_DD90(&dword_0, v55, v56, "#aceshim unexpected empty command array", v57);
        sub_DCD4((uint64_t)v57);
      }

      sub_E23C(v12, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      sub_E4A0();
      sub_DDAC();
      goto LABEL_23;
    }

    goto LABEL_27;
  }

  sub_E1E8();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v0);
  sub_E048();
  if (!v20) {
    goto LABEL_19;
  }
LABEL_3:
  uint64_t v21 = sub_E4A0();
  sub_8020(v19, 1LL);
  if (v2 >> 62)
  {
    sub_E1E8();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v20);
    sub_E048();
  }

  else
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v22 != 1)
  {
    id v38 = [objc_allocWithZone(SAAddResultObjects) init];
    uint64_t v39 = sub_5E3C(&qword_19538);
    uint64_t v40 = swift_allocObject(v39, 112LL, 7LL);
    *(_OWORD *)(v40 + 16) = xmmword_11890;
    *(void *)(v40 + 56) = &type metadata for String;
    unint64_t v41 = sub_DA50();
    *(void *)(v40 + 64) = v41;
    *(void *)(v40 + 32) = 0xD000000000000010LL;
    *(void *)(v40 + 40) = 0x8000000000013700LL;
    id v25 = v38;
    uint64_t v42 = UUID.init()();
    uint64_t v43 = UUID.uuidString.getter(v42);
    uint64_t v45 = v44;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v60);
    *(void *)(v40 + 96) = &type metadata for String;
    *(void *)(v40 + 104) = v41;
    *(void *)(v40 + 72) = v43;
    *(void *)(v40 + 80) = v45;
    uint64_t v46 = String.init(format:_:)(0x40252D4025LL, 0xE500000000000000LL, v40);
    sub_D80C(v46, v47, v25);

    sub_D85C(v2, v25);
    goto LABEL_15;
  }

  if ((v2 & 0xC000000000000001LL) == 0)
  {
    if (*(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL)))
    {
      uint64_t v23 = *(void *)(v2 + 32);
      swift_unknownObjectRetain(v23);
      goto LABEL_10;
    }

    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  swift_bridgeObjectRetain(v2);
  uint64_t v23 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
  sub_E048();
LABEL_10:
  uint64_t v24 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
  id v25 = (id)swift_dynamicCastObjCClass(v23, v24);
  if (v25)
  {
LABEL_15:
    sub_DCE0(v19);
    *(void *)uint64_t v19 = v25;
    *(_BYTE *)(v19 + 8) = 0;
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 104LL))( v19,  enum case for Command.aceCommand(_:),  v21);
    sub_8020(v19, 0LL);
    sub_E2F8(v19, v61);
LABEL_24:
    sub_DCE8();
    return;
  }

  if (AFSiriLogContextConnection)
  {
    id v26 = AFSiriLogContextConnection;
    uint64_t v27 = sub_E140();
    os_log_type_t v28 = static os_log_type_t.error.getter(v27);
    uint64_t v29 = swift_unknownObjectRetain_n(v23, 2LL);
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = v28;
    if (os_log_type_enabled(v30, v28))
    {
      uint64_t v32 = (uint8_t *)sub_DD64(12LL);
      uint64_t v60 = sub_DD64(32LL);
      uint64_t v62 = v23;
      uint64_t v63 = v60;
      uint64_t v59 = v32;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v58 = v32 + 4;
      swift_unknownObjectRetain(v23);
      uint64_t v33 = sub_5E3C(&qword_19548);
      uint64_t v34 = String.init<A>(describing:)(&v62, v33);
      uint64_t v62 = sub_1031C(v34, v35, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v58, v32 + 12);
      swift_unknownObjectRelease_n(v23, 2LL);
      sub_DD6C();
      uint64_t v36 = v59;
      _os_log_impl(&dword_0, v30, v31, "#aceshim unsupported command found: %s", v59, 0xCu);
      uint64_t v37 = v60;
      swift_arrayDestroy(v60, 1LL, (char *)&type metadata for Any + 8);
      sub_DCD4(v37);
      sub_DCD4((uint64_t)v36);
      swift_unknownObjectRelease(v23);
    }

    else
    {
      swift_unknownObjectRelease_n(v23, 3LL);
    }

    uint64_t v48 = sub_E23C((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    sub_E154(v48, &qword_19530);
    uint64_t v49 = v61;
    uint64_t v50 = 1LL;
    uint64_t v51 = 1LL;
    uint64_t v52 = v21;
LABEL_23:
    sub_63F8(v49, v50, v51, v52);
    goto LABEL_24;
  }

LABEL_28:
  __break(1u);
}

void sub_C394()
{
  uint64_t v22 = v2;
  sub_5E3C(&qword_19570);
  sub_DCC4();
  __chkstk_darwin(v3);
  sub_DEA0();
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_E2A8();
  uint64_t v6 = type metadata accessor for ImageElement.RenderingMode(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_DE90();
  uint64_t v10 = v9 - v8;
  sub_5E3C(&qword_19578);
  sub_DCC4();
  __chkstk_darwin(v11);
  sub_DE90();
  uint64_t v14 = v13 - v12;
  if (qword_18C80 != -1) {
    swift_once(&qword_18C80, sub_81D4);
  }
  uint64_t v15 = qword_191D0;
  uint64_t v16 = *(void *)algn_191D8;
  uint64_t v17 = sub_DE88();
  sub_DD00(v14, v18, v19, v17);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))( v10,  enum case for ImageElement.RenderingMode.template(_:),  v6);
  uint64_t v20 = qword_18C88;
  swift_bridgeObjectRetain(v16);
  if (v20 != -1) {
    swift_once(&qword_18C88, sub_81F8);
  }
  uint64_t v21 = sub_DA8C(v4, (uint64_t)qword_1A0A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v21, v4);
  sub_DBCC(v22, v0, &qword_19570);
  ImageElement.Symbol.init(_:darkModeName:tintColor:renderingMode:imageStyle:background:punchesThroughBackground:)( v15,  v16,  0LL,  0LL,  v14,  v10,  v1,  v0,  0);
  sub_DCE8();
}

void sub_C554()
{
  uint64_t v61 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_5E3C(&qword_19568);
  sub_DCC4();
  __chkstk_darwin(v8);
  sub_E1CC();
  __chkstk_darwin(v9);
  sub_E4BC();
  __chkstk_darwin(v10);
  uint64_t v11 = sub_E2DC();
  uint64_t v12 = type metadata accessor for ImageElement.SourceType(v11);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_DCA4();
  uint64_t v60 = v14;
  sub_DCB8();
  __chkstk_darwin(v15);
  sub_DD0C();
  uint64_t v17 = v16;
  sub_DCB8();
  __chkstk_darwin(v18);
  sub_DE08();
  uint64_t v20 = v19;
  sub_DD98(v7, v0);
  sub_DD74(v0, 1LL, v12);
  if (v33)
  {
    sub_DCE0(v0);
    sub_DD98(v5, v1);
    sub_DD74(v1, 1LL, v12);
    if (v33)
    {
      sub_DAD0(v1, &qword_19568);
      uint64_t v21 = sub_5E3C(&qword_195B8);
      uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
      uint64_t v23 = (v22 + 32) & ~v22;
      uint64_t v24 = swift_allocObject(v21, v23 + *(void *)(v13 + 72), v22 | 7);
      *(_OWORD *)(v24 + 16) = xmmword_11880;
      sub_E2C8(v24 + v23, v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
      uint64_t v25 = sub_5E3C(&qword_195C0);
      uint64_t v26 = *(void *)(type metadata accessor for _ProtoIdiom(0LL) - 8);
      uint64_t v27 = *(unsigned __int8 *)(v26 + 80);
      uint64_t v28 = (v27 + 32) & ~v27;
      uint64_t v29 = swift_allocObject(v25, v28 + *(void *)(v26 + 72), v27 | 7);
      *(_OWORD *)(v29 + 16) = xmmword_11880;
      sub_E244( v29 + v28,  enum case for _ProtoIdiom.default(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 104));
      sub_D584(v29);
      uint64_t v30 = sub_E25C();
      static ImageElement.sources(_:idioms:)(v30, v31);
      sub_DD6C();
      sub_E0D4();
    }

    else
    {
      sub_E2C8(v60, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
      uint64_t v43 = sub_5E3C(&qword_195B8);
      uint64_t v44 = (__n128 *)sub_DEB8(v43);
      uint64_t v45 = sub_E3B0(v44, (__n128)xmmword_11890);
      sub_E080((uint64_t)v45, v60);
      sub_E080((uint64_t)&qword_19568 + v0, v61);
      sub_5E3C(&qword_195C0);
      uint64_t v46 = sub_E114();
      uint64_t v47 = sub_DDB8(v46);
      *(_OWORD *)(v47 + 16) = xmmword_11880;
      sub_E244( v47 + v1,  enum case for _ProtoIdiom.default(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 104));
      uint64_t v48 = sub_E408();
      sub_E100(v48);
      sub_DFC8();
      sub_DD6C();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v60, v12);
    }
  }

  else
  {
    uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
    v32(v20, v0, v12);
    sub_DBCC(v5, v2, &qword_19568);
    sub_DD74(v2, 1LL, v12);
    if (v33)
    {
      sub_DAD0(v2, &qword_19568);
      uint64_t v34 = sub_5E3C(&qword_195B8);
      uint64_t v35 = sub_DEB8(v34);
      *(_OWORD *)(v35 + 16) = xmmword_11890;
      uint64_t v36 = (char *)v32 + v35;
      uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      v37(v36, v20, v12);
      v37(&v36[v0], v61, v12);
      sub_5E3C(&qword_195C0);
      uint64_t v38 = *(void *)(sub_E114() - 8);
      uint64_t v39 = *(unsigned __int8 *)(v38 + 80);
      uint64_t v40 = (v39 + 32) & ~v39;
      uint64_t v41 = swift_allocObject(v36, v40 + *(void *)(v38 + 72), v39 | 7);
      *(_OWORD *)(v41 + 16) = xmmword_11880;
      sub_E244( v41 + v40,  enum case for _ProtoIdiom.default(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 104));
      uint64_t v42 = sub_E408();
      sub_E100(v42);
      sub_DFC8();
      sub_DD6C();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v20, v12);
    }

    else
    {
      uint64_t v49 = v17;
      v32(v17, v2, v12);
      uint64_t v50 = sub_5E3C(&qword_195B8);
      uint64_t v51 = *(void *)(v13 + 72);
      uint64_t v52 = *(unsigned __int8 *)(v13 + 80);
      uint64_t v53 = (v52 + 32) & ~v52;
      os_log_type_t v54 = (__n128 *)swift_allocObject(v50, v53 + 3 * v51, v52 | 7);
      uint64_t v55 = sub_E3B0(v54, (__n128)xmmword_118A0);
      sub_E080((uint64_t)v55, v20);
      sub_E080(v53 + v51, v49);
      sub_E080(v53 + 2 * v51, v61);
      sub_5E3C(&qword_195C0);
      uint64_t v56 = sub_E114();
      uint64_t v57 = sub_DDB8(v56);
      *(_OWORD *)(v57 + 16) = xmmword_11880;
      sub_E244( v57 + v1,  enum case for _ProtoIdiom.default(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 104));
      uint64_t v58 = sub_E408();
      static ImageElement.sources(_:idioms:)(v54, v58);
      sub_E048();
      sub_DD6C();
      uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v59(v49, v12);
      v59(v20, v12);
    }
  }

  sub_DCE8();
}

id sub_C9F0(uint64_t a1, unint64_t a2)
{
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_E070();
  sub_E204();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v14 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14) {
    return 0LL;
  }
  sub_DB74(0LL, &qword_195B0, &OBJC_CLASS___LSApplicationProxy_ptr);
  swift_bridgeObjectRetain(a2);
  id v15 = sub_CC60(a1, a2);
  if (!v15) {
    return 0LL;
  }
  uint64_t v16 = v15;
  id v17 = [v15 bundleURL];
  if (!v17)
  {
    sub_DF18(v8, 1LL);
    goto LABEL_10;
  }

  uint64_t v18 = v17;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  v19(v8, v2, v9);
  sub_DF18(v8, 0LL);
  sub_DD74(v8, 1LL, v9);
  if (v20)
  {
LABEL_10:

    sub_E2C0(v34, &qword_191A8);
    return 0LL;
  }

  v19((uint64_t)v13, v8, v9);
  sub_DA00(v16, (SEL *)&selRef__tvsui_applicationIconName);
  if (!v22)
  {
    sub_E0CC((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));

    return 0LL;
  }

  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t v25 = (void *)objc_opt_self(&OBJC_CLASS___UIImage);
  URL._bridgeToObjectiveC()(v26);
  uint64_t v28 = v27;
  id v29 = [(id)objc_opt_self(UIScreen) mainScreen];
  id v30 = [v29 traitCollection];

  [v30 displayScale];
  double v32 = v31;

  id v33 = sub_D980((uint64_t)v28, v32, v23, v24, v25);
  sub_E0CC((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  return v33;
}

id sub_CC60(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [(id)swift_getObjCClassFromMetadata(v2) applicationProxyForIdentifier:v4];

  return v5;
}

void sub_CCCC()
{
  uint64_t v1 = sub_5E3C(&qword_195E8);
  sub_DE20(v1);
  uint64_t v2 = sub_5E3C((uint64_t *)&unk_195F0);
  sub_DE20(v2);
  sub_DCE0(v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryImage);
  sub_DCE0(v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateImage);
  sub_E088(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryLabel);
  sub_E088(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateLabel);
  sub_E088(OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_subLabel);
  sub_DCE0(v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_primaryAction);
  sub_DCE0(v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_alternateAction);

  sub_5FB8((void *)(v0 + OBJC_IVAR____TtC12SiriTVPlugin28WatchListButtonStateProvider_watchListKitProvider));
  sub_75D4();
}

uint64_t sub_CDB0()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_CDD4()
{
  return type metadata accessor for WatchListButtonStateProvider(0LL);
}

uint64_t type metadata accessor for WatchListButtonStateProvider(uint64_t a1)
{
  uint64_t result = qword_19260;
  if (!qword_19260) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WatchListButtonStateProvider);
  }
  return result;
}

void sub_CE14(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v10[0] = *(void *)(v2 - 8) + 64LL;
    sub_CF5C(319LL, &qword_19278, (uint64_t)&unk_14E20);
    if (v5 <= 0x3F)
    {
      v10[1] = *(void *)(v4 - 8) + 64LL;
      v10[2] = &unk_11900;
      v10[3] = &unk_11918;
      sub_CF9C(319LL, &qword_19280, (uint64_t (*)(uint64_t))&type metadata accessor for VisualProperty);
      if (v7 <= 0x3F)
      {
        uint64_t v11 = *(void *)(v6 - 8) + 64LL;
        uint64_t v12 = v11;
        uint64_t v13 = &unk_11930;
        uint64_t v14 = &unk_11930;
        id v15 = &unk_11930;
        sub_CF9C( 319LL,  (unint64_t *)&unk_19288,  (uint64_t (*)(uint64_t))&type metadata accessor for ActionProperty);
        if (v9 <= 0x3F)
        {
          uint64_t v16 = *(void *)(v8 - 8) + 64LL;
          uint64_t v17 = v16;
          uint64_t v18 = (char *)&value witness table for Builtin.UnknownObject + 64;
          uint64_t v19 = &unk_11948;
          char v20 = (char *)&value witness table for Builtin.Int64 + 64;
          swift_updateClassMetadata2(a1, 256LL, 14LL, v10, a1 + 80);
        }
      }
    }
  }

void sub_CF5C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t v4 = type metadata accessor for Published(a1, a3);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }

  sub_75D4();
}

void sub_CF9C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  if (!*a2)
  {
    uint64_t v5 = a3(255LL);
    unint64_t v6 = type metadata accessor for Optional(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

  sub_75D4();
}

_BYTE *sub_CFE4(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_CFF0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_D078(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_D0C4 + 4 * byte_118C5[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_D0F8 + 4 * byte_118C0[v4]))();
}

uint64_t sub_D0F8(uint64_t result)
{
  *(_BYTE *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D100(uint64_t result, int a2)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (a2) {
    JUMPOUT(0xD108LL);
  }
  return result;
}

uint64_t sub_D114(uint64_t result, int a2)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (!a2) {
    JUMPOUT(0xD11CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_D120(uint64_t result)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D128(uint64_t result)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

void type metadata accessor for WatchListButtonStateProvider.ButtonStyle()
{
}

uint64_t sub_D148(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_D150(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for WatchListButtonStateProvider.LoadingState()
{
}

uint64_t sub_D164(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }

uint64_t sub_D1EC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_D238 + 4 * byte_118CF[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_D26C + 4 * byte_118CA[v4]))();
}

uint64_t sub_D26C(uint64_t result)
{
  *(_BYTE *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D274(uint64_t result, int a2)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (a2) {
    JUMPOUT(0xD27CLL);
  }
  return result;
}

uint64_t sub_D288(uint64_t result, int a2)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (!a2) {
    JUMPOUT(0xD290LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_D294(uint64_t result)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D29C(uint64_t result)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

_BYTE *sub_D2A8(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for WatchListButtonStateProvider.ButtonState()
{
}

uint64_t sub_D2C0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }

uint64_t sub_D348(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_D394 + 4 * byte_118D9[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_D3C8 + 4 * byte_118D4[v4]))();
}

uint64_t sub_D3C8(uint64_t result)
{
  *(_BYTE *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D3D0(uint64_t result, int a2)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (a2) {
    JUMPOUT(0xD3D8LL);
  }
  return result;
}

uint64_t sub_D3E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (!a2) {
    JUMPOUT(0xD3ECLL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_D3F0(uint64_t result)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_D3F8(uint64_t result)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

void type metadata accessor for WatchListButtonStateProvider.ButtonType()
{
}

unint64_t sub_D414()
{
  unint64_t result = qword_19500;
  if (!qword_19500)
  {
    unint64_t result = swift_getWitnessTable(&unk_119D0, &unk_14EB0);
    atomic_store(result, (unint64_t *)&qword_19500);
  }

  return result;
}

unint64_t sub_D454()
{
  unint64_t result = qword_19508;
  if (!qword_19508)
  {
    unint64_t result = swift_getWitnessTable(&unk_11A38, &unk_14E20);
    atomic_store(result, (unint64_t *)&qword_19508);
  }

  return result;
}

unint64_t sub_D494()
{
  unint64_t result = qword_19510;
  if (!qword_19510)
  {
    unint64_t result = swift_getWitnessTable(&unk_11AA0, &unk_14D90);
    atomic_store(result, (unint64_t *)&qword_19510);
  }

  return result;
}

unint64_t sub_D4D4()
{
  unint64_t result = qword_19518;
  if (!qword_19518)
  {
    unint64_t result = swift_getWitnessTable(&unk_11B08, &unk_14D00);
    atomic_store(result, (unint64_t *)&qword_19518);
  }

  return result;
}

void *sub_D510()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_D51C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WatchListButtonStateProvider(0LL);
  uint64_t result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

void sub_D558(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_DF78(a1, a2, a3);
  sub_E170(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24LL));
  sub_75D4();
}

uint64_t sub_D584(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  int v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)&v30 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    uint64_t v10 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_5E3C(&qword_195C8);
  uint64_t result = static _SetStorage.allocate(capacity:)(v8);
  uint64_t v10 = (void *)result;
  uint64_t v32 = *(void *)(a1 + 16);
  if (!v32)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v10;
  }

  unint64_t v11 = 0LL;
  uint64_t v34 = result + 56;
  uint64_t v12 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v30 = a1;
  uint64_t v31 = a1 + ((v12 + 32) & ~v12);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v35 + 72);
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
    v14(v7, v31 + v13 * v11, v2);
    uint64_t v15 = v10[5];
    sub_DB38(&qword_195D0, (uint64_t)&protocol conformance descriptor for _ProtoIdiom);
    uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v2, v16);
    uint64_t v18 = -1LL << *((_BYTE *)v10 + 32);
    unint64_t v19 = v17 & ~v18;
    unint64_t v20 = v19 >> 6;
    uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
    uint64_t v22 = 1LL << v19;
    if (((1LL << v19) & v21) != 0)
    {
      unint64_t v33 = v11;
      uint64_t v23 = ~v18;
      while (1)
      {
        v14(v5, v10[6] + v19 * v13, v2);
        sub_DB38(&qword_195D8, (uint64_t)&protocol conformance descriptor for _ProtoIdiom);
        char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v7, v2, v24);
        uint64_t v26 = *(void (**)(char *, uint64_t))(v35 + 8);
        v26(v5, v2);
        if ((v25 & 1) != 0) {
          break;
        }
        unint64_t v19 = (v19 + 1) & v23;
        unint64_t v20 = v19 >> 6;
        uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
        uint64_t v22 = 1LL << v19;
        if ((v21 & (1LL << v19)) == 0)
        {
          a1 = v30;
          unint64_t v11 = v33;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v7, v2);
      a1 = v30;
      unint64_t v11 = v33;
    }

    else
    {
LABEL_10:
      *(void *)(v34 + 8 * v20) = v22 | v21;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v35 + 32))(v10[6] + v19 * v13, v7, v2);
      uint64_t v27 = v10[2];
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_18;
      }
      v10[2] = v29;
    }

    if (++v11 == v32) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void sub_D80C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setAceId:v5];
}

void sub_D85C(uint64_t a1, void *a2)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [a2 setObjects:isa];
}

uint64_t sub_D8B8(void *a1)
{
  id v2 = [a1 commands];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = sub_5E3C((uint64_t *)&unk_19550);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

void sub_D920(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  }

  sub_E3A4();
}

id sub_D980(uint64_t a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v10 = objc_msgSend(a5, "tvsui_applicationIconImageForBundleURL:iconName:scale:", a1, v9, a2);

  return v10;
}

void sub_DA00(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    id v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_E25C();
  sub_E3A4();
}

unint64_t sub_DA50()
{
  unint64_t result = qword_19540;
  if (!qword_19540)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_19540);
  }

  return result;
}

uint64_t sub_DA8C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_DAA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_DF78(a1, a2, a3);
  sub_E170(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_75D4();
}

void sub_DAD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_5E3C(a2);
  sub_DE20(v2);
  sub_75D4();
}

uint64_t *sub_DAF8(uint64_t a1, uint64_t *a2)
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

void sub_DB38(unint64_t *a1, uint64_t a2)
{
  if (!*a1)
  {
    uint64_t v4 = type metadata accessor for _ProtoIdiom(255LL);
    atomic_store(swift_getWitnessTable(a2, v4), a1);
  }

  sub_75D4();
}

void sub_DB74(uint64_t a1, unint64_t *a2, void *a3)
{
  if (!*a2)
  {
    uint64_t v4 = objc_opt_self(*a3);
    atomic_store(swift_getObjCClassMetadata(v4), a2);
  }

  sub_75D4();
}

void *sub_DBA8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

void sub_DBCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_DF78(a1, a2, a3);
  sub_E170(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_75D4();
}

void sub_DBF8(_BYTE *a1@<X8>)
{
  *a1 = v2;
  sub_75D4();
}

void sub_DC1C(char *a1)
{
}

void sub_DC3C(_BYTE *a1@<X8>)
{
  *a1 = v2;
  sub_75D4();
}

void sub_DC60(char *a1)
{
}

void sub_DC94()
{
  *(void *)(v1 - 256) = v0;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_DCD4(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

void sub_DCE0(uint64_t a1)
{
}

  ;
}

uint64_t sub_DD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_63F8(a1, 1LL, 1LL, a4);
}

  ;
}

uint64_t sub_DD18@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0LL;
}

uint64_t sub_DD28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v2 - 672) + 104LL))( *(void *)(v2 - 624),  a2,  *(void *)(v2 - 664));
}

uint64_t sub_DD4C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  return swift_beginAccess(v4 + a1, va, 33LL, 0LL);
}

uint64_t sub_DD64(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_DD6C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_DD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_67FC(a1, a2, a3);
}

uint64_t sub_DD88@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, void)@<X8>)
{
  return a3(a1, a2, *(void *)(v3 - 256));
}

void sub_DD90(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

void sub_DD98(uint64_t a1, uint64_t a2)
{
}

  ;
}

  ;
}

uint64_t sub_DDB8(uint64_t a1)
{
  return swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL))
         + *(void *)(*(void *)(a1 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) | 7LL);
}

uint64_t sub_DDE0(uint64_t a1, uint64_t a2)
{
  return ImageElement.Url.init(_:darkModeSource:loadingImage:contentMode:imageStyle:aspectRatio:fixedWidth:fixedHeight:renderingMode:backgroundColor:cornerRoundingMode:insetPadding:)( *(void *)(v5 - 544),  a2,  *(void *)(v5 - 568),  v4,  v3,  v2,  2LL,  2LL);
}

  ;
}

uint64_t sub_DE14@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t sub_DE20(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_DE34(uint64_t a1)
{
  return *(void *)(v1 - 520);
}

uint64_t sub_DE70()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_DE78(uint64_t a1)
{
}

void sub_DE80(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_DE88()
{
  return type metadata accessor for Color(0LL);
}

  ;
}

  ;
}

uint64_t sub_DEB8(uint64_t a1)
{
  return swift_allocObject( a1,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
         + 2LL * *(void *)(v1 + 72),
           *(unsigned __int8 *)(v1 + 80) | 7LL);
}

void sub_DED4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

double sub_DEE0()
{
  *(void *)(v0 - 144) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  *(void *)(v0 - 192) = 0LL;
  *(_OWORD *)(v0 - 224) = 0u;
  *(_OWORD *)(v0 - 208) = 0u;
  return result;
}

uint64_t sub_DF04@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_DF0C(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

uint64_t sub_DF18(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

uint64_t sub_DF24(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

void sub_DF30(uint64_t a1)
{
}

BOOL sub_DF3C(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_DF4C(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(v3, v2, a1, a2, 0LL);
}

id sub_DF68()
{
  return [*(id *)(v1 - 456) *(SEL *)(v0 + 2800)];
}

uint64_t sub_DF78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_5E3C(a3);
}

void sub_DF88(uint64_t a1, uint64_t *a2)
{
}

void sub_DF90()
{
}

BOOL sub_DFBC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_DFC8()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_DFE8()
{
  return v0;
}

  ;
}

uint64_t sub_E008()
{
  return v0;
}

uint64_t sub_E01C()
{
  return v0;
}

void *sub_E030( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  return static Published.subscript.getter(&a13, v14, v13, a1);
}

uint64_t sub_E048()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_E050()
{
  return ImageElement.AspectRatio.init(width:height:)(v1, v0);
}

uint64_t sub_E068()
{
  return type metadata accessor for Logger(0LL);
}

  ;
}

uint64_t sub_E080(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_E088@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

uint64_t sub_E094(uint64_t a1)
{
  return static ImageElement.size(for:idiom:)(a1, *(void *)(v1 - 416));
}

uint64_t sub_E0A0(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_E0AC(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

uint64_t sub_E0B8(uint64_t a1, uint64_t a2)
{
  return sub_63F8(a1, a2, 1LL, v2);
}

  ;
}

uint64_t sub_E0CC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_E0D4()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_E0DC(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_E0E4()
{
  return *(void *)(v0 - 520);
}

uint64_t sub_E100(uint64_t a1)
{
  return static ImageElement.sources(_:idioms:)(v1, a1);
}

uint64_t sub_E114()
{
  return type metadata accessor for _ProtoIdiom(0LL);
}

uint64_t sub_E120(uint64_t a1, uint64_t a2)
{
  return sub_DA8C(*(void *)(v2 - 280), a2);
}

uint64_t sub_E12C(uint64_t a1)
{
  return sub_63F8(a1, 0LL, 1LL, *(void *)(v1 - 352));
}

uint64_t sub_E140()
{
  return Logger.init(_:)();
}

uint64_t sub_E148(uint64_t a1)
{
  return swift_allocObject(a1, 72LL, 7LL);
}

void sub_E154(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_E15C()
{
  return *(void *)(v0 - 544);
}

uint64_t sub_E168()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_E170@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

id sub_E17C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_E184()
{
}

  ;
}

uint64_t sub_E19C()
{
  return type metadata accessor for ImageElement.AspectRatio(0LL);
}

uint64_t sub_E1A4()
{
  return *(void *)(v0 - 400);
}

uint64_t sub_E1C0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, void)@<X8>)
{
  return a3(a1, a2, *(void *)(v3 - 256));
}

  ;
}

uint64_t sub_E1E8()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_E1FC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

  ;
}

uint64_t sub_E214@<X0>(uint64_t (*a1)(void, void)@<X8>)
{
  return a1(*(void *)(v1 - 256), *(void *)(v2 - 368));
}

uint64_t sub_E224(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return swift_endAccess(va);
}

  ;
}

uint64_t sub_E23C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_E244@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

id sub_E24C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_E254(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_E25C()
{
  return v0;
}

double sub_E268()
{
  return v0;
}

uint64_t sub_E280()
{
  return type metadata accessor for ActionProperty(0LL);
}

uint64_t sub_E288()
{
  return type metadata accessor for ImageElement.SourceType.LoadingImage(0LL);
}

uint64_t sub_E290()
{
  return type metadata accessor for Localizer();
}

void *sub_E298(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, 0LL);
}

  ;
}

void sub_E2C0(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_E2C8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_E2D0()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_E2DC()
{
  return 0LL;
}

uint64_t sub_E2F0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

void sub_E2F8(uint64_t a1, uint64_t a2)
{
}

  ;
}

  ;
}

uint64_t sub_E320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_63F8(a1, a2, a3, v3);
}

void sub_E328()
{
}

uint64_t sub_E334@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_E33C()
{
  return v0;
}

_WORD *sub_E350(_WORD *result)
{
  *double result = 0;
  return result;
}

  ;
}

void *sub_E368@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 56) = *(void *)(v3 - 232);
  *(void *)(v2 + 64) = a2;
  return sub_748C(a1);
}

void sub_E374(uint64_t a1)
{
}

uint64_t sub_E37C()
{
  return VisualProperty.init(_:safeForLogging:focusAction:selectedAction:)(v0, 0LL);
}

  ;
}

id sub_E39C(int a1, const char *a2, id a3)
{
  return [a3 a2];
}

  ;
}

char *sub_E3B0(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return (char *)a1 + v2;
}

void sub_E3C4()
{
}

  ;
}

uint64_t sub_E3E4()
{
  return swift_bridgeObjectRetain(v0);
}

void sub_E3EC()
{
}

void sub_E3F8(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_E400()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_E408()
{
  return sub_D584(v0);
}

  ;
}

  ;
}

uint64_t sub_E428(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

  ;
}

uint64_t sub_E458()
{
  return v0;
}

uint64_t sub_E46C()
{
  return Logger.logObject.getter();
}

Swift::Int sub_E478()
{
  return Hasher._finalize()();
}

  ;
}

double sub_E494()
{
  return result;
}

uint64_t sub_E4A0()
{
  return type metadata accessor for Command(0LL);
}

  ;
}

  ;
}

uint64_t sub_E4D0()
{
  return v0;
}

uint64_t sub_E4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ImageElement.Background.init(color:aspectRatio:fixedWidth:fixedHeight:)(a1, a2, a3, 2LL);
}

uint64_t sub_E4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0LL;
  }
  unint64_t v4 = sub_F0BC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0LL;
  }
  uint64_t v6 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v4);
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain(v6[1]);
  return v7;
}

void *sub_E550(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001LL) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v7 = sub_F120((uint64_t)a1);
      if ((v8 & 1) != 0)
      {
        uint64_t v6 = *(void **)(*(void *)(a2 + 56) + 8 * v7);
        id v9 = v6;
        return v6;
      }
    }

    return 0LL;
  }

  id v3 = a1;
  uint64_t v4 = __CocoaDictionary.lookup(_:)();

  if (!v4) {
    return 0LL;
  }
  uint64_t v11 = v4;
  uint64_t v5 = sub_77F8(0LL, &qword_191B0, &OBJC_CLASS___SFDynamicURLImageResource_ptr);
  swift_unknownObjectRetain(v4);
  swift_dynamicCast(&v12, &v11, (char *)&type metadata for Swift.AnyObject + 8, v5, 7LL);
  uint64_t v6 = v12;
  swift_unknownObjectRelease(v4);
  return v6;
}

id sub_E624()
{
  uint64_t v2 = v0;
  sub_5E3C(&qword_191A8);
  sub_DCC4();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_FE98();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_FDD8(v2);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(WLKPlayablePunchoutUrlKeyPlay);
  uint64_t v12 = v11;
  uint64_t v13 = sub_E4FC(v10, v11, v9);
  unint64_t v15 = v14;
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v9);
  if (!v15) {
    return 0LL;
  }
  uint64_t v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (!v16)
  {
    swift_bridgeObjectRelease(v15);
    return 0LL;
  }

  URL.init(string:)(v13, v15);
  swift_bridgeObjectRelease(v15);
  sub_FEEC(v1);
  if (v17)
  {
    sub_7450(v1, &qword_191A8);
    return 0LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v1, v4);
  id v19 = [objc_allocWithZone(SAUIAppPunchOut) init];
  URL._bridgeToObjectiveC()(v20);
  uint64_t v22 = v21;
  [v19 setPunchOutUri:v21];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v19;
}

uint64_t sub_E7B4()
{
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v34 - v5;
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_FED0();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  unint64_t v15 = (char *)&v34 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v34 - v17;
  id v19 = sub_E24C(v16, "startAirTime");
  if (v19)
  {
    unint64_t v20 = v19;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v21(v6, v15, v7);
    sub_DF18((uint64_t)v6, 0LL);
    uint64_t v22 = sub_FEEC((uint64_t)v6);
    if (!v23)
    {
      uint64_t v24 = ((uint64_t (*)(char *, char *, uint64_t))v21)(v18, v6, v7);
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v22 = sub_DF18((uint64_t)v6, 1LL);
  }

  static Date.distantFuture.getter(v22);
  uint64_t v24 = sub_7450((uint64_t)v6, &qword_19600);
LABEL_6:
  static Date.now.getter(v24);
  unint64_t v25 = Date.compare(_:)(v18);
  if (v25 >= 2)
  {
    unint64_t v30 = v25;
    if (v25 == -1LL)
    {
      sub_FEB4((uint64_t)v12);
      sub_FEB4((uint64_t)v18);
      return 3LL;
    }

    else
    {
      type metadata accessor for ComparisonResult(0LL);
      unint64_t v35 = v30;
      uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v33, &v35, v33, &type metadata for Int);
      __break(1u);
    }

    return result;
  }

  id v26 = sub_E24C(v25, "endAirTime");
  if (!v26)
  {
    uint64_t v29 = sub_DF18((uint64_t)v4, 1LL);
    goto LABEL_13;
  }

  uint64_t v27 = v26;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  BOOL v28 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v28(v4, v15, v7);
  sub_DF18((uint64_t)v4, 0LL);
  uint64_t v29 = sub_FEEC((uint64_t)v4);
  if (v23)
  {
LABEL_13:
    static Date.distantFuture.getter(v29);
    sub_7450((uint64_t)v4, &qword_19600);
    goto LABEL_14;
  }

  v28((char *)v0, v4, v7);
LABEL_14:
  if (Date.compare(_:)(v0) == -1)
  {
    unint64_t v32 = (unint64_t)sub_E24C(-1LL, "airingType");
    sub_FF18(v0);
    sub_FF18((uint64_t)v12);
    sub_FF18((uint64_t)v18);
    if (v32 < 3) {
      return 0x20102u >> (8 * v32);
    }
  }

  else
  {
    sub_FEB4(v0);
    sub_FEB4((uint64_t)v12);
    sub_FEB4((uint64_t)v18);
  }

  return 0LL;
}

void *sub_EAB4(unint64_t a1)
{
  unint64_t v14 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!(a1 >> 62))
  {
    uint64_t result = (void *)sub_FF08();
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    sub_DD6C();
    return &_swiftEmptyArrayStorage;
  }

  sub_FEBC();
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v1);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        uint64_t v6 = (void *)sub_FF34();
      }
      else {
        uint64_t v6 = sub_FF20();
      }
      uint64_t v7 = v6;
      unsigned int v8 = objc_msgSend(v6, "isAppInstalled", v14);
      id v9 = v7;
      if (v8)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v11 = *(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v10 = *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
        if (v11 >= v10 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1LL);
        }
      }

      else
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v11 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v12 = *(void *)((char *)&dword_18 + (v14 & 0xFFFFFFFFFFFFFF8LL));
        if (v11 >= v12 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v11 + 1, 1LL);
        }
      }

      uint64_t v13 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
      specialized Array._endMutation()(v13);
    }

    goto LABEL_15;
  }

  __break(1u);
  return result;
}

uint64_t sub_EC34(unint64_t a1)
{
  uint64_t v17 = &_swiftEmptySetSingleton;
  if (!(a1 >> 62))
  {
    uint64_t result = sub_FF08();
    if (v2) {
      goto LABEL_3;
    }
LABEL_18:
    sub_DD6C();
    unint64_t v14 = &_swiftEmptySetSingleton;
LABEL_19:
    uint64_t v15 = v14[2];
    swift_bridgeObjectRelease(v14);
    return v15;
  }

  sub_FEBC();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v1);
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        uint64_t v6 = (void *)sub_FF34();
      }
      else {
        uint64_t v6 = sub_FF20();
      }
      uint64_t v7 = v6;
      id v8 = [v6 channelDetails];
      if (v8 && (id v9 = (void *)sub_FE38(v8)) != 0LL)
      {
        unint64_t v10 = v9;
        if (v9[2])
        {
          uint64_t v11 = v9[4];
          uint64_t v12 = v9[5];
          swift_bridgeObjectRetain(v12);
          swift_bridgeObjectRelease(v10);
          sub_F348(v16, v11, v12);

          uint64_t v13 = v16[1];
        }

        else
        {

          uint64_t v13 = (uint64_t)v10;
        }

        swift_bridgeObjectRelease(v13);
      }

      else
      {
      }
    }

    sub_DD6C();
    unint64_t v14 = v17;
    goto LABEL_19;
  }

  __break(1u);
  return result;
}

double sub_ED74(uint64_t a1, char a2, char a3, double a4, double a5, double a6)
{
  id v9 = v6;
  sub_5E3C(&qword_191A8);
  sub_DCC4();
  __chkstk_darwin(v16);
  uint64_t v17 = sub_FE98();
  __chkstk_darwin(v17);
  sub_FED0();
  __chkstk_darwin(v18);
  unint64_t v20 = (char *)&v45 - v19;
  if (a6 <= 2.22044605e-16)
  {
    id v21 = [(id)objc_opt_self(UIScreen) mainScreen];
    id v22 = [v21 traitCollection];
    uint64_t v46 = v9;
    char v23 = v20;
    uint64_t v24 = a1;
    char v25 = a2;
    char v26 = a3;
    id v27 = v22;

    [v27 displayScale];
    a6 = v28;

    a3 = v26;
    a2 = v25;
    a1 = v24;
    unint64_t v20 = v23;
    id v9 = v46;
    if (a6 <= 1.0) {
      a6 = 1.0;
    }
  }

  id v29 = [v9 channelDetails];
  if (!v29) {
    goto LABEL_24;
  }
  unint64_t v30 = v29;
  id v31 = [v29 images];

  if (!v31) {
    goto LABEL_24;
  }
  id v32 = objc_msgSend(v31, "bestArtworkVariantOfType:forSize:", 10, a6 * a4, a6 * a5);

  if (!v32) {
    goto LABEL_24;
  }
  id v33 = [v32 artworkSize];
  double v38 = a5;
  double v39 = a4;
  if (v34 > 0.0)
  {
    double v38 = a5;
    double v39 = a4;
    if (v35.n128_f64[0] > 0.0)
    {
      v37.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      if ((a2 & 1) != 0) {
        v36.n128_f64[0] = a4;
      }
      else {
        v36.n128_f64[0] = 1.79769313e308;
      }
      if ((a3 & 1) != 0) {
        v37.n128_f64[0] = a5;
      }
      double v39 = SiriUIAspectFitSizeInSizeWithScale(v33, v34, v35, v36, v37, a6);
      double v38 = v40;
    }
  }

  id v41 = objc_msgSend(v32, "artworkURLForSize:", v39, v38);
  if (!v41)
  {
    sub_DF24(v7, 1LL);
    goto LABEL_23;
  }

  uint64_t v42 = v41;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_FF2C(v7, v8);
  sub_DF24(v7, 0LL);
  if (sub_67FC(v7, 1LL, v17) == 1)
  {
LABEL_23:

    sub_7450(v7, &qword_191A8);
LABEL_24:
    sub_DF24(a1, 1LL);
    return 0.0;
  }

  sub_FF2C((uint64_t)v20, v7);

  double v43 = floor(v39 / a6);
  if (v38 <= 0.0) {
    double v43 = a4;
  }
  if (v39 > 0.0) {
    a4 = v43;
  }
  sub_FF2C(a1, (uint64_t)v20);
  sub_DF24(a1, 0LL);
  return a4;
}

unint64_t sub_F0BC(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_F150(a1, a2, v5);
}

unint64_t sub_F120(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_F230(a1, v4);
}

unint64_t sub_F150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        unint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_F230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    sub_77F8(0LL, &qword_191B8, &OBJC_CLASS___NSNumber_ptr);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

uint64_t sub_F348(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    BOOL v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_F7CC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_F4F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5E3C(&qword_19608);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    id v32 = v2;
    id v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v20, v21);
      Swift::Int result = Hasher._finalize()();
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0LL;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
      unint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
      *unint64_t v30 = v20;
      v30[1] = v21;
      ++*(void *)(v6 + 16);
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1LL)) {
        goto LABEL_41;
      }
      if (v16 >= v10) {
        goto LABEL_35;
      }
      unint64_t v17 = v33[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v10) {
          goto LABEL_35;
        }
        unint64_t v17 = v33[v13];
        if (!v17)
        {
          int64_t v13 = v16 + 2;
          if (v16 + 2 >= v10) {
            goto LABEL_35;
          }
          unint64_t v17 = v33[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 3;
            if (v18 >= v10)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v32;
              uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
              if (v31 > 63) {
                sub_F964(0LL, (unint64_t)(v31 + 63) >> 6, v33);
              }
              else {
                void *v33 = -1LL << v31;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v17 = v33[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1LL)) {
                  goto LABEL_42;
                }
                if (v13 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v17 = v33[v13];
                ++v18;
                if (v17) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v13 = v18;
          }
        }
      }

LABEL_23:
      unint64_t v9 = (v17 - 1) & v17;
    }
  }

  Swift::Int result = swift_release(v3);
  uint64_t *v2 = v6;
  return result;
}

    int64_t v10 = (v17 - 1) & v17;
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v32)
  {
LABEL_35:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_37;
  }

  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
    int64_t v13 = v18;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v13 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v13);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }

uint64_t sub_F7CC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_F4F4(v11);
  }

  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (uint64_t)sub_F980();
      goto LABEL_22;
    }

    sub_FB30(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  Swift::Int result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    int64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

uint64_t sub_F964(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

void *sub_F980()
{
  uint64_t v1 = v0;
  sub_5E3C(&qword_19608);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    Swift::Int result = (void *)swift_bridgeObjectRetain(v21);
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_FB30(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5E3C(&qword_19608);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    uint64_t *v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  uint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    int64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v33, v20, v21);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    unint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
    *unint64_t v30 = v20;
    v30[1] = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      goto LABEL_39;
    }
    if (v16 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v32) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v16 + 2;
        if (v16 + 2 >= v32) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        if (!v17) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_FDD8(void *a1)
{
  id v1 = [a1 punchoutUrls];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);

  return v3;
}

uint64_t sub_FE38(void *a1)
{
  id v2 = [a1 appBundleIDs];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);

  return v3;
}

uint64_t sub_FE98()
{
  return type metadata accessor for URL(0LL);
}

uint64_t sub_FEB4(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_FEBC()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

uint64_t sub_FEEC(uint64_t a1)
{
  return sub_67FC(a1, 1LL, v1);
}

uint64_t sub_FF08()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_FF18(uint64_t a1)
{
  return v2(a1, v1);
}

id sub_FF20()
{
  return *(id *)(v0 + 8 * v1 + 32);
}

uint64_t sub_FF2C(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_FF34()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

void sub_FF40()
{
}

void sub_FF68(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for WatchListButtonRichView(0LL);
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = a1;
  Swift::String v15 = String.lowercased()();
  if (v15._countAndFlagsBits == 0xD000000000000013LL && v15._object == (void *)0x80000000000137F0LL)
  {
    swift_bridgeObjectRelease(0x80000000000137F0LL);
    goto LABEL_5;
  }

  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)( 0xD000000000000013LL,  0x80000000000137F0LL,  v15._countAndFlagsBits,  v15._object,  0LL);
  swift_bridgeObjectRelease(v15._object);
  if ((v16 & 1) != 0)
  {
LABEL_5:
    v29[3] = (uint64_t)&type metadata for StandardWatchListKitDataProvider;
    v29[4] = (uint64_t)&off_14C60;
    sub_10A84(a3, a4);
    sub_5180(v29, (uint64_t)v14);
    if (!v4)
    {
      unint64_t v17 = sub_10AC8();
      AnyView.init<A>(_:)(v14, v12, v17);
    }

    return;
  }

  if (AFSiriLogContextConnection)
  {
    uint64_t v18 = Logger.init(_:)(AFSiriLogContextConnection);
    os_log_type_t v19 = static os_log_type_t.error.getter(v18);
    uint64_t v20 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = v19;
    if (os_log_type_enabled(v21, v19))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v24 = swift_slowAlloc(32LL, -1LL);
      v29[0] = v24;
      *(_DWORD *)unint64_t v23 = 136446210;
      swift_bridgeObjectRetain(a2);
      uint64_t v30 = sub_1031C(v26, a2, v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl(&dword_0, v21, v22, "#aceshim unhandled view ID: %{public}s", v23, 0xCu);
      swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
      sub_DCD4(v24);
      sub_DCD4((uint64_t)v23);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
    unint64_t v25 = sub_102E0();
    swift_allocError(&type metadata for SiriTVPlugin.Error, v25, 0LL, 0LL);
    swift_willThrow();
  }

  else
  {
    __break(1u);
  }

uint64_t sub_10268()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SiriTVPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC12SiriTVPlugin12SiriTVPlugin);
}

uint64_t sub_10298()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_102A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10298();
  *a1 = result;
  return result;
}

void sub_102CC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
}

unint64_t sub_102E0()
{
  unint64_t result = qword_196A8;
  if (!qword_196A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_11CC8, &type metadata for SiriTVPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_196A8);
  }

  return result;
}

uint64_t sub_1031C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_103EC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10B08((uint64_t)v12, *a3);
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
      sub_10B08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_5FB8(v12);
  return v7;
}

void *sub_103EC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10540((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    unint64_t result = sub_10604(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_10540(char *__src, size_t __n, char *__dst)
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

void *sub_10604(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10698(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1086C(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1086C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10698(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_10808(v4, 0LL);
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

void *sub_10808(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5E3C(&qword_196B8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1086C(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_5E3C(&qword_196B8);
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
  unint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10A04(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10940(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_10940(char *__src, size_t __n, char *__dst)
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

char *sub_10A04(char *__src, size_t __len, char *__dst)
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

uint64_t sub_10A84(uint64_t result, unint64_t a2)
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

unint64_t sub_10AC8()
{
  unint64_t result = qword_196B0;
  if (!qword_196B0)
  {
    uint64_t v1 = type metadata accessor for WatchListButtonRichView(255LL);
    unint64_t result = swift_getWitnessTable(&unk_117C8, v1);
    atomic_store(result, (unint64_t *)&qword_196B0);
  }

  return result;
}

uint64_t sub_10B08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for SiriTVPlugin.Error(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(sub_63F8(v3, v1, 1LL, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10B88 + 4 * byte_11C10[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10BA8 + 4 * byte_11C15[v4]))();
  }
}

_BYTE *sub_10B88(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10BA8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10BB0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10BB8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10BC0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10BC8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriTVPlugin.Error()
{
  return &type metadata for SiriTVPlugin.Error;
}

unint64_t sub_10BE8()
{
  unint64_t result = qword_196C0;
  if (!qword_196C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_11CA0, &type metadata for SiriTVPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_196C0);
  }

  return result;
}

uint64_t sub_10C24()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id v2 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 siriUILocalizedStringForKey:v3];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  return v5;
}

uint64_t type metadata accessor for Localizer()
{
  return objc_opt_self(&OBJC_CLASS____TtC12SiriTVPlugin9Localizer);
}