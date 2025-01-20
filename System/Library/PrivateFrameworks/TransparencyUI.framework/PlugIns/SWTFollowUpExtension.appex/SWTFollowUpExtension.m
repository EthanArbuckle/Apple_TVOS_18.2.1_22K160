uint64_t sub_100004FB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];
  v3 = v1 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  swift_beginAccess(v3, v6, 0LL, 0LL);
  v4 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t sub_10000501C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(v3, a1, v4);
  return swift_endAccess(v6);
}

uint64_t (*sub_100005088(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

id sub_1000050D0()
{
  return [objc_allocWithZone(v0) init];
}

id sub_1000050F0()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = v0;
  Logger.init(subsystem:category:)( 0xD000000000000016LL,  0x80000001000077F0LL,  0x7075776F6C6C6F66LL,  0xE800000000000000LL);
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))( (uint64_t)v5 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log,  v4,  v1);

  v6 = (objc_class *)type metadata accessor for FollowUpViewController(0LL);
  v8.receiver = v5;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, "initWithNibName:bundle:", 0, 0);
}

uint64_t type metadata accessor for FollowUpViewController(uint64_t a1)
{
  uint64_t result = qword_10000C228;
  if (!qword_10000C228) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FollowUpViewController);
  }
  return result;
}

id sub_1000052F0(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_100005330()
{
}

Swift::Void __swiftcall FollowUpViewController.viewDidLoad()()
{
}

id sub_10000542C(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v70 = *(void (**)(char *, uint64_t))(v6 - 8);
  uint64_t v71 = v6;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v11 = (char *)&v62 - v10;
  uint64_t v12 = sub_10000598C(&qword_10000C1B8);
  __chkstk_darwin(v12);
  v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for URL(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v69 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  v21 = (char *)&v62 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v62 - v22;
  URL.init(string:)(a1, a2);
  uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 32))(v23, v14, v15);
  v26 = *(void (**)(void))((swift_isaMask & *v3) + 0x58LL);
  ((void (*)(uint64_t))v26)(v25);
  v27 = *(uint64_t (**)(char *, char *, uint64_t))(v16 + 16);
  v68 = v23;
  v65 = v27;
  uint64_t v28 = v27(v21, v23, v15);
  v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.default.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  v66 = v26;
  v67 = v3;
  if (v31)
  {
    v32 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v33 = swift_slowAlloc(32LL, -1LL);
    v64 = v9;
    uint64_t v34 = v33;
    uint64_t v73 = v33;
    *(_DWORD *)v32 = 136315138;
    v63 = v32 + 4;
    uint64_t v35 = URL.description.getter();
    unint64_t v37 = v36;
    uint64_t v72 = sub_1000068AC(v35, v36, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v63, v32 + 12);
    swift_bridgeObjectRelease(v37);
    v38 = *(void (**)(char *, uint64_t))(v16 + 8);
    v38(v21, v15);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Opening URL for followup %s", v32, 0xCu);
    swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v39 = v34;
    v9 = v64;
    swift_slowDealloc(v39, -1LL, -1LL);
    v40 = v32;
    v41 = v38;
    swift_slowDealloc(v40, -1LL, -1LL);
  }

  else
  {
    v41 = *(void (**)(char *, uint64_t))(v16 + 8);
    v41(v21, v15);
  }

  v42 = (void (*)(char *, uint64_t))*((void *)v70 + 1);
  v42(v11, v71);
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  v44 = v68;
  if (result)
  {
    v45 = result;
    URL._bridgeToObjectiveC()(v43);
    v47 = v46;
    unint64_t v48 = sub_1000059CC((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v48);
    LOBYTE(v48) = [v45 openSensitiveURL:v47 withOptions:isa];

    if ((v48 & 1) == 0)
    {
      v66();
      v50 = v69;
      uint64_t v51 = v65(v69, v44, v15);
      v52 = v9;
      v53 = (os_log_s *)Logger.logObject.getter(v51);
      os_log_type_t v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        v64 = v52;
        v55 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v56 = swift_slowAlloc(32LL, -1LL);
        uint64_t v73 = v56;
        *(_DWORD *)v55 = 136315138;
        v70 = v41;
        unint64_t v57 = sub_100006EEC();
        uint64_t v58 = dispatch thunk of CustomStringConvertible.description.getter(v15, v57);
        unint64_t v60 = v59;
        uint64_t v72 = sub_1000068AC(v58, v59, &v73);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v55 + 4, v55 + 12);
        swift_bridgeObjectRelease(v60);
        v61 = (uint64_t (*)(char *, uint64_t))v70;
        v70(v50, v15);
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Could not open url %s", v55, 0xCu);
        swift_arrayDestroy(v56, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1LL, -1LL);
        swift_slowDealloc(v55, -1LL, -1LL);

        v42(v64, v71);
        return (id)v61(v68, v15);
      }

      v41(v50, v15);
      v42(v52, v71);
    }

    return (id)((uint64_t (*)(char *, uint64_t))v41)(v44, v15);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10000598C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000059CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000598C(&qword_10000C210);
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
    sub_100007334(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100006F34(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000737C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

void FollowUpViewController.processFollowUpItem(_:selectedAction:completion:)( void *a1, void *a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v5 = v4;
  v84 = a3;
  v82 = a1;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v85 = *(void *)(v8 - 8);
  uint64_t v86 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  char v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  BOOL v14 = (char *)&v81 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v81 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v81 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v81 - v21;
  if (!a2)
  {
    __break(1u);
LABEL_57:
    __break(1u);
  }

  uint64_t v83 = a4;
  uint64_t v87 = 0x6E6F69746361LL;
  unint64_t v88 = 0xE600000000000000LL;
  AnyHashable.init<A>(_:)(&v89, &v87, &type metadata for String, &protocol witness table for String);
  id v23 = [a2 userInfo];
  if (!v23) {
    goto LABEL_57;
  }
  v24 = v23;
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v23,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  if (*(void *)(v25 + 16) && (unint64_t v26 = sub_100006F98((uint64_t)&v89), (v27 & 1) != 0))
  {
    sub_100007038(*(void *)(v25 + 56) + 32 * v26, (uint64_t)&v91);
  }

  else
  {
    __int128 v91 = 0u;
    __int128 v92 = 0u;
  }

  swift_bridgeObjectRelease(v25);
  sub_100006FC8((uint64_t)&v89);
  if (!*((void *)&v92 + 1))
  {
    uint64_t v28 = sub_100006FFC((uint64_t)&v91, &qword_10000C1C8);
    goto LABEL_17;
  }

  uint64_t v28 = swift_dynamicCast(&v87, &v91, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
  if ((v28 & 1) == 0)
  {
LABEL_17:
    (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58LL))(v28);
    uint64_t v22 = a2;
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    uint64_t v5 = (void *)v36;
    if (os_log_type_enabled(v33, v36))
    {
      uint64_t v20 = (char *)swift_slowAlloc(12LL, -1LL);
      unint64_t v37 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v20 = 138412290;
      v89 = v22;
      uint64_t v22 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v20 + 4, v20 + 12);
      *unint64_t v37 = a2;

      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v5, "no action string for %@", (uint8_t *)v20, 0xCu);
      uint64_t v38 = sub_10000598C(&qword_10000C1D0);
      swift_arrayDestroy(v37, 1LL, v38);
      swift_slowDealloc(v37, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    else
    {

      uint64_t v33 = (os_log_s *)v22;
    }

    (*(void (**)(char *, uint64_t))(v85 + 8))(v11, v86);
    uint64_t v39 = v84;
    if (v84) {
      goto LABEL_53;
    }
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v30 = v87;
  unint64_t v29 = v88;
  if (v87 == 0x41736C6961746564LL && v88 == 0xED00006E6F697463LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x41736C6961746564LL, 0xED00006E6F697463LL, v87, v88, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(v29);
    uint64_t v87 = 7107189LL;
    unint64_t v88 = 0xE300000000000000LL;
    AnyHashable.init<A>(_:)(&v89, &v87, &type metadata for String, &protocol witness table for String);
    id v31 = [a2 userInfo];
    if (!v31)
    {
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }

    v32 = v31;
    uint64_t v33 = (os_log_s *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v31,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

    if (*((void *)v33 + 2))
    {
      unint64_t v34 = sub_100006F98((uint64_t)&v89);
      if ((v35 & 1) != 0)
      {
        sub_100007038(*((void *)v33 + 7) + 32 * v34, (uint64_t)&v91);
        goto LABEL_23;
      }
    }

LABEL_22:
    __int128 v91 = 0u;
    __int128 v92 = 0u;
LABEL_23:
    swift_bridgeObjectRelease(v33);
    sub_100006FC8((uint64_t)&v89);
    if (*((void *)&v92 + 1))
    {
      uint64_t v40 = swift_dynamicCast(&v87, &v91, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
      if ((v40 & 1) != 0)
      {
        uint64_t v20 = (char *)v87;
        unint64_t v41 = v88;
        (*(void (**)(void))((swift_isaMask & *v5) + 0x58LL))();
        uint64_t v42 = swift_bridgeObjectRetain_n(v41, 2LL);
        v43 = (os_log_s *)Logger.logObject.getter(v42);
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          v46 = (char *)swift_slowAlloc(32LL, -1LL);
          v89 = v46;
          *(_DWORD *)v45 = 136315138;
          swift_bridgeObjectRetain(v41);
          *(void *)&__int128 v91 = sub_1000068AC((uint64_t)v20, v41, (uint64_t *)&v89);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, (char *)&v91 + 8, v45 + 4, v45 + 12);
          swift_bridgeObjectRelease_n(v41, 3LL);
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "action, detailsActions, open URL %s", v45, 0xCu);
          swift_arrayDestroy(v46, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v46, -1LL, -1LL);
          swift_slowDealloc(v45, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v41, 2LL);
        }

        (*(void (**)(char *, uint64_t))(v85 + 8))(v22, v86);
        (*(void (**)(char *, unint64_t))((swift_isaMask & *v5) + 0x70LL))(v20, v41);
        swift_bridgeObjectRelease(v41);
        goto LABEL_52;
      }
    }

    else
    {
      uint64_t v40 = sub_100006FFC((uint64_t)&v91, &qword_10000C1C8);
    }

    uint64_t v47 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v5) + 0x58LL))(v40);
    unint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "action, detailsActions, URL missing", v50, 2u);
      swift_slowDealloc(v50, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v85 + 8))(v20, v86);
    goto LABEL_52;
  }

  if (v30 == 0x7463417261656C63LL && v29 == 0xEB000000006E6F69LL)
  {
    uint64_t v51 = swift_bridgeObjectRelease(0xEB000000006E6F69LL);
    v52 = v82;
LABEL_36:
    (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58LL))(v51);
    os_log_type_t v54 = v52;
    v55 = (os_log_s *)Logger.logObject.getter(v54);
    os_log_type_t v56 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v20 = (char *)swift_slowAlloc(12LL, -1LL);
      unint64_t v57 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v20 = 138412290;
      if (v52)
      {
        v89 = v54;
        uint64_t v58 = v54;
      }

      else
      {
        v89 = 0LL;
      }

      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v20 + 4, v20 + 12);
      *unint64_t v57 = v52;

      _os_log_impl((void *)&_mh_execute_header, v55, v56, "action, clearing item %@", (uint8_t *)v20, 0xCu);
      uint64_t v68 = sub_10000598C(&qword_10000C1D0);
      swift_arrayDestroy(v57, 1LL, v68);
      swift_slowDealloc(v57, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    else
    {

      v55 = (os_log_s *)v54;
    }

    (*(void (**)(char *, uint64_t))(v85 + 8))(v17, v86);
    if (!v52) {
      goto LABEL_60;
    }
    id v69 = [v54 uniqueIdentifier];
    if (v69)
    {
      v70 = v69;
      uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v73 = v72;

      id v74 = [objc_allocWithZone(FLFollowUpController) init];
      uint64_t v75 = sub_10000598C(&qword_10000C1D8);
      uint64_t v20 = (char *)swift_allocObject(v75, 64LL, 7LL);
      *((_OWORD *)v20 + 1) = xmmword_100007800;
      *((void *)v20 + 7) = &type metadata for String;
      *((void *)v20 + 4) = v71;
      *((void *)v20 + 5) = v73;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v20);
      v89 = 0LL;
      LODWORD(v73) = [v74 clearPendingFollowUpItemsWithUniqueIdentifiers:isa error:&v89];

      v77 = v89;
      if ((_DWORD)v73)
      {
        v78 = v89;
      }

      else
      {
        v79 = v89;
        uint64_t v80 = _convertNSErrorToError(_:)(v77);

        swift_willThrow();
        swift_errorRelease(v80);
      }
    }

    goto LABEL_52;
  }

  char v53 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7463417261656C63LL, 0xEB000000006E6F69LL, v30, v29, 0LL);
  uint64_t v51 = swift_bridgeObjectRelease(v29);
  v52 = v82;
  if ((v53 & 1) != 0) {
    goto LABEL_36;
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58LL))(v51);
  uint64_t v20 = a2;
  unint64_t v59 = (void *)Logger.logObject.getter(v20);
  os_log_type_t v60 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled((os_log_t)v59, v60))
  {

    goto LABEL_55;
  }

  v61 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v62 = (char *)swift_slowAlloc(32LL, -1LL);
  v89 = v62;
  *(_DWORD *)v61 = 136315138;
  id v63 = [v20 identifier];
  if (v63)
  {
    v64 = v63;
    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v67 = v66;

    *(void *)&__int128 v91 = sub_1000068AC(v65, v67, (uint64_t *)&v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, (char *)&v91 + 8, v61 + 4, v61 + 12);

    swift_bridgeObjectRelease(v67);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v59, v60, "missing action: %s", v61, 0xCu);
    swift_arrayDestroy(v62, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1LL, -1LL);
    swift_slowDealloc(v61, -1LL, -1LL);

LABEL_55:
    (*(void (**)(char *, uint64_t))(v85 + 8))(v14, v86);
LABEL_52:
    uint64_t v39 = v84;
    if (v84)
    {
LABEL_53:
      v39(1LL);
      return;
    }

    __break(1u);
    goto LABEL_59;
  }

LABEL_61:
  __break(1u);
}

id FollowUpViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v7 = 0LL;
  }

  id v8 = [objc_allocWithZone(v4) initWithNibName:v7 bundle:a3];

  return v8;
}

void FollowUpViewController.init(nibName:bundle:)()
{
}

id FollowUpViewController.__deallocating_deinit()
{
  return sub_100006834((SEL *)&selRef_dealloc);
}

id sub_100006834(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FollowUpViewController(0LL);
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t sub_1000068AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000697C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007038((uint64_t)v12, *a3);
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
      sub_100007038((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100007310(v12);
  return v7;
}

uint64_t sub_10000697C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100006B34(a5, a6);
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

uint64_t sub_100006B34(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006BC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006DA0(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006DA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006BC8(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100006D3C(v4, 0LL);
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
      LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100007980LL,  "SWTFollowUpExtension/FollowUpViewController.swift",  49LL,  2LL,  22LL, 0) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100007980LL,  "SWTFollowUpExtension/FollowUpViewController.swift",  49LL,  2LL,  22LL, 0) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100007980LL,  "SWTFollowUpExtension/FollowUpViewController.swift",  49LL,  2LL,  22LL, 0) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100006D3C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_10000598C(&qword_10000C208);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006DA0(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000598C(&qword_10000C208);
    char v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    char v11 = (char *)&_swiftEmptyArrayStorage;
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

unint64_t sub_100006EEC()
{
  unint64_t result = qword_10000C1C0;
  if (!qword_10000C1C0)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_10000C1C0);
  }

  return result;
}

unint64_t sub_100006F34(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100007130(a1, a2, v5);
}

unint64_t sub_100006F98(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100007210(a1, v4);
}

uint64_t sub_100006FC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006FFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000598C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100007038(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007074()
{
  return type metadata accessor for FollowUpViewController(0LL);
}

uint64_t sub_10000707C(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000070E8(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_1000070F8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000711C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16LL))(*(void *)(v1 + 16), a1 & 1);
}

unint64_t sub_100007130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100007210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1000072D4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100006FC8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_1000072D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007310(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000598C(&qword_10000C218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000737C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}