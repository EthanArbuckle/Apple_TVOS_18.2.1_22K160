double variable initialization expression of TVFlowcaseItemLayout.Metrics.textLayoutMargins@<D0>( uint64_t a1@<X8>)
{
  double result;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t sub_100001FE8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_10000201C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002028(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100002048(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for ResourceLoadReason(uint64_t a1)
{
}

uint64_t sub_10000209C(uint64_t a1, uint64_t a2)
{
  return sub_100002454(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000020A8(uint64_t a1, id *a2)
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

uint64_t sub_10000211C(uint64_t a1, id *a2)
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

uint64_t sub_100002198@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

void sub_1000021DC(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_1000021E4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_1000021F8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100002228(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10000223C(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_100002250(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100002264@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100002270(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000227C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000022C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000022E8(uint64_t a1)
{
  uint64_t v2 = sub_100002408(&qword_1000192D0, (uint64_t)&unk_100012C3C);
  uint64_t v3 = sub_100002408(&qword_1000192D8, (uint64_t)&unk_100012BDC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for BuildType(uint64_t a1)
{
}

void sub_10000237C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000023C0()
{
  return sub_100002408(&qword_1000192B8, (uint64_t)&unk_100012BA0);
}

uint64_t sub_1000023E4()
{
  return sub_100002408(&qword_1000192C0, (uint64_t)&unk_100012B74);
}

uint64_t sub_100002408(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BuildType(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100002448(uint64_t a1, uint64_t a2)
{
  return sub_100002454(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002454(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100002490(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000024D0(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100002540(void *a1, uint64_t *a2)
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

uint64_t sub_1000025C8()
{
  return sub_100002408(&qword_1000192C8, (uint64_t)&unk_100012C10);
}

uint64_t sub_1000025EC()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  sub_100006A0C(v4, qword_10001A0A0);
  sub_1000053B0(v4, (uint64_t)qword_10001A0A0);
  if (qword_100019290 != -1) {
    swift_once(&qword_100019290, sub_10000B288);
  }
  uint64_t v5 = sub_1000053B0(v0, (uint64_t)qword_10001A100);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSLogger.init(subsystem:category:)(v3, 0x6C65685320706F54LL, 0xE900000000000066LL);
}

void sub_1000026EC(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v117 = a3;
  v118 = a2;
  uint64_t v103 = type metadata accessor for ArcadeState(0LL);
  uint64_t v102 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  v101 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for EntitlementRefeshCondition(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v105 = v5;
  uint64_t v106 = v6;
  __chkstk_darwin(v5);
  v104 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for StoreTab.Identifier(0LL);
  uint64_t v109 = *(void *)(v8 - 8);
  uint64_t v110 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  v107 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v108 = (char *)&v97 - v11;
  uint64_t v12 = sub_10000614C(&qword_1000194D8);
  __chkstk_darwin(v12);
  v114 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v112 = *(void *)(v14 - 8);
  uint64_t v113 = v14;
  uint64_t v15 = *(void *)(v112 + 64);
  uint64_t v16 = __chkstk_darwin(v14);
  v111 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v16);
  v19 = (char *)&v97 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v97 - v20;
  uint64_t v22 = sub_10000614C(&qword_1000194E0);
  __chkstk_darwin(v22);
  v24 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = type metadata accessor for StoreTab(0LL);
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for ASKBagContract(0LL);
  uint64_t v30 = inject(_:from:)(v29, a1);
  uint64_t v31 = type metadata accessor for ArcadeSubscriptionManager(0LL);
  uint64_t v32 = a1;
  uint64_t v33 = inject(_:from:)(v31, a1);
  uint64_t v115 = v30;
  v116 = (void *)v33;
  sub_10000B2E8((uint64_t)v24);
  uint64_t v34 = v25;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1LL, v25) == 1)
  {
    v35 = &qword_1000194E0;
    uint64_t v36 = (uint64_t)v24;
LABEL_5:
    sub_100006AB8(v36, v35);
    v44 = v116;
    uint64_t v45 = v115;
    v118(0LL);
    swift_release(v45, v46);

    return;
  }

  v37 = v19;
  uint64_t v38 = v32;
  v100 = v21;
  uint64_t v39 = (*(uint64_t (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v34);
  v40 = v114;
  uint64_t v41 = v34;
  StoreTab.url.getter(v39);
  uint64_t v42 = v112;
  uint64_t v43 = v113;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v112 + 48))(v40, 1LL, v113) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v41);
    v35 = &qword_1000194D8;
    uint64_t v36 = (uint64_t)v114;
    goto LABEL_5;
  }

  uint64_t v47 = v42;
  uint64_t v98 = v26;
  uint64_t v99 = v41;
  v48 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
  v49 = v100;
  v48(v100, v114, v43);
  v50 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  v50(v37, v49, v43);
  v51 = v111;
  v50(v111, v37, v43);
  uint64_t v52 = *(unsigned __int8 *)(v47 + 80);
  uint64_t v53 = (v52 + 16) & ~v52;
  unint64_t v54 = (v15 + v53 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v55 = (v54 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v56 = swift_allocObject(&unk_100015478, v55 + 16, v52 | 7);
  v48((char *)(v56 + v53), v37, v43);
  uint64_t v57 = v38;
  *(void *)(v56 + v54) = v38;
  uint64_t v97 = v56;
  v58 = (void *)(v56 + v55);
  uint64_t v59 = v117;
  void *v58 = v118;
  v58[1] = v59;
  swift_retain(v59);
  uint64_t v60 = swift_retain(v38);
  v61 = v108;
  v114 = v28;
  StoreTab.identifier.getter(v60);
  uint64_t v63 = v109;
  uint64_t v62 = v110;
  v64 = v107;
  (*(void (**)(char *, void, uint64_t))(v109 + 104))( v107,  enum case for StoreTab.Identifier.arcade(_:),  v110);
  uint64_t v65 = sub_100006CB0( (unint64_t *)&qword_1000194E8,  (uint64_t (*)(uint64_t))&type metadata accessor for StoreTab.Identifier,  (uint64_t)&protocol conformance descriptor for StoreTab.Identifier);
  dispatch thunk of RawRepresentable.rawValue.getter(&v119, v62, v65);
  dispatch thunk of RawRepresentable.rawValue.getter(&v123, v62, v65);
  uint64_t v66 = v120;
  uint64_t v67 = v124;
  if (v119 == v123 && v120 == v124)
  {
    swift_bridgeObjectRelease_n(v120, 2LL);
    v68 = *(void (**)(char *, uint64_t))(v63 + 8);
    v68(v64, v62);
    v68(v61, v62);
    v51 = v111;
    uint64_t v69 = v105;
    uint64_t v70 = v106;
  }

  else
  {
    char v71 = _stringCompareWithSmolCheck(_:_:expecting:)(v119, v120, v123, v124, 0LL);
    swift_bridgeObjectRelease(v66);
    swift_bridgeObjectRelease(v67);
    v72 = *(void (**)(char *, uint64_t))(v63 + 8);
    v72(v64, v62);
    uint64_t v73 = ((uint64_t (*)(char *, uint64_t))v72)(v61, v62);
    uint64_t v69 = v105;
    uint64_t v70 = v106;
    if ((v71 & 1) == 0)
    {
      uint64_t v90 = (uint64_t)v51;
      uint64_t v91 = (uint64_t)v101;
      v92 = v116;
      ArcadeSubscriptionManager.subscriptionState.getter(v73);
      sub_100002E08(v91, v90, v57, (uint64_t)v118, v59);
      swift_release(v97, v93);
      swift_release(v115, v94);

      (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v91, v103);
      uint64_t v95 = v113;
      v96 = *(void (**)(uint64_t, uint64_t))(v112 + 8);
      v96(v90, v113);
      v96((uint64_t)v100, v95);
      goto LABEL_12;
    }
  }

  uint64_t v74 = v113;
  v75 = *(void (**)(char *, uint64_t))(v112 + 8);
  v75(v51, v113);
  v76 = v104;
  _BYTE *v104 = 0;
  (*(void (**)(_BYTE *, void, uint64_t))(v70 + 104))( v76,  enum case for EntitlementRefeshCondition.ifCacheIsExpired(_:),  v69);
  v77 = v116;
  uint64_t v78 = ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(v76);
  (*(void (**)(_BYTE *, uint64_t))(v70 + 8))(v76, v69);
  uint64_t v79 = swift_allocObject(&unk_1000154A0, 32LL, 7LL);
  uint64_t v80 = v97;
  *(void *)(v79 + 16) = sub_100006B84;
  *(void *)(v79 + 24) = v80;
  uint64_t v81 = swift_allocObject(&unk_1000154C8, 32LL, 7LL);
  *(void *)(v81 + 16) = v118;
  *(void *)(v81 + 24) = v59;
  unint64_t v82 = sub_10000635C();
  swift_retain(v59);
  uint64_t v83 = swift_retain(v80);
  uint64_t v84 = static OS_dispatch_queue.main.getter(v83);
  unint64_t v121 = v82;
  v122 = &protocol witness table for OS_dispatch_queue;
  uint64_t v119 = v84;
  Promise.then(perform:orCatchError:on:)(sub_100006BE4, v79, sub_100006C04, v81, &v119);
  swift_release(v80, v85);
  swift_release(v115, v86);

  swift_release(v78, v87);
  swift_release(v79, v88);
  swift_release(v81, v89);
  sub_1000069A8(&v119);
  v75(v100, v74);
LABEL_12:
  (*(void (**)(char *, uint64_t))(v98 + 8))(v114, v99);
}

uint64_t sub_100002E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for TopShelfIntent(0LL);
  uint64_t v38 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v39[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  LOBYTE(a2) = ArcadeState.isSubscribed.getter(v16);
  char v17 = ArcadeState.isTrialAvailable.getter();
  TopShelfIntent.init(url:isSubscribed:isTrialAvailable:)(v12, a2 & 1, v17 & 1);
  uint64_t v18 = type metadata accessor for JSIntentDispatcher(0LL);
  uint64_t v19 = type metadata accessor for ObjectGraph(0LL);
  inject<A, B>(_:from:)(v39, v18, a3, v18, v19);
  uint64_t v20 = v39[0];
  type metadata accessor for IntentDispatchOptions(0LL);
  uint64_t v21 = swift_retain(a3);
  uint64_t v22 = BaseObjectGraph.__allocating_init(_:)(v21);
  uint64_t v23 = IntentDispatchOptions.withGarbageCollection()();
  swift_release(v22, v24);
  uint64_t v25 = sub_100006CB0( &qword_1000194F0,  (uint64_t (*)(uint64_t))&type metadata accessor for TopShelfIntent,  (uint64_t)&protocol conformance descriptor for TopShelfIntent);
  uint64_t v26 = dispatch thunk of JSIntentDispatcher.dispatch<A>(intent:with:fileID:)( v15,  v23,  "AppStoreTopShelfExtension/TopShelfContentProvider.swift",  55LL,  2LL,  v13,  v25);
  uint64_t v27 = swift_allocObject(&unk_1000154F0, 32LL, 7LL);
  *(void *)(v27 + 16) = a4;
  *(void *)(v27 + 24) = a5;
  uint64_t v28 = swift_allocObject(&unk_100015518, 32LL, 7LL);
  *(void *)(v28 + 16) = a4;
  *(void *)(v28 + 24) = a5;
  unint64_t v29 = sub_10000635C();
  uint64_t v30 = swift_retain_n(a5, 2LL);
  uint64_t v31 = static OS_dispatch_queue.main.getter(v30);
  v39[3] = v29;
  v39[4] = &protocol witness table for OS_dispatch_queue;
  v39[0] = v31;
  Promise.then(perform:orCatchError:on:)(sub_100006C34, v27, sub_100006C3C, v28, v39);
  swift_release(v23, v32);
  swift_release(v20, v33);
  swift_release(v26, v34);
  swift_release(v27, v35);
  swift_release(v28, v36);
  sub_1000069A8(v39);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v15, v13);
}

uint64_t sub_100003074(uint64_t a1, void (*a2)(void))
{
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  sub_1000053B0(v3, (uint64_t)qword_10001A0A0);
  uint64_t v4 = sub_10000614C(&qword_100019430);
  uint64_t v5 = type metadata accessor for LogMessage(0LL);
  uint64_t v6 = swift_allocObject( v4,  ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL))
       + *(void *)(*(void *)(v5 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_100012CD0;
  LogMessage.init(stringLiteral:)(0xD00000000000001ALL, 0x8000000100011D80LL);
  Logger.info(_:)(v6, v3, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = sub_10000B5D4();
  a2();
  return swift_unknownObjectRelease(v7);
}

uint64_t sub_100003198(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  sub_1000053B0(v8, (uint64_t)qword_10001A0A0);
  uint64_t v9 = sub_10000614C(&qword_100019430);
  uint64_t v10 = type metadata accessor for LogMessage(0LL);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
        + *(void *)(*(void *)(v10 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_100012CD0;
  LogMessage.init(stringLiteral:)(a4, a5);
  Logger.error(_:)(v11, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v11);
  return a2(0LL);
}

uint64_t sub_10000345C( uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v114 = a5;
  uint64_t v115 = a6;
  uint64_t v119 = a3;
  uint64_t v120 = a4;
  uint64_t v113 = type metadata accessor for IntentDispatchTimeout(0LL);
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v111 = type metadata accessor for MetricsSystemInfo(0LL);
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  uint64_t v11 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t PurchaseIntent = type metadata accessor for TopShelfCreatePurchaseIntent(0LL);
  uint64_t v116 = *(void *)(PurchaseIntent - 8);
  uint64_t v117 = PurchaseIntent;
  __chkstk_darwin(PurchaseIntent);
  unint64_t v121 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_10000614C(&qword_100019440);
  uint64_t v15 = __chkstk_darwin(v14);
  char v17 = (char *)&v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v104 - v18;
  uint64_t v107 = type metadata accessor for ControllerRequirement(0LL);
  uint64_t v20 = *(void *)(v107 - 8);
  uint64_t v21 = __chkstk_darwin(v107);
  uint64_t v23 = (char *)&v104 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v106 = (char *)&v104 - v24;
  uint64_t v25 = type metadata accessor for Commerce(0LL);
  uint64_t v26 = type metadata accessor for ObjectGraph(0LL);
  uint64_t v108 = a1;
  uint64_t v109 = v26;
  inject<A, B>(_:from:)(v125, v25, a1, v25, v26);
  uint64_t v118 = v125[0];
  CFOptionFlags v124 = 0LL;
  uint64_t v27 = (void *)objc_opt_self(&OBJC_CLASS___TVSBluetoothRemoteUtilities);
  [v27 startConnectionMonitoring];
  unint64_t v122 = 0xD00000000000001BLL;
  unint64_t v123 = 0x80000001000119B0LL;
  AnyHashable.init<A>(_:)(v125, &v122, &type metadata for String, &protocol witness table for String);
  if (*(void *)(a2 + 16) && (unint64_t v28 = sub_1000053EC((uint64_t)v125), (v29 & 1) != 0))
  {
    sub_10000695C(*(void *)(a2 + 56) + 32 * v28, (uint64_t)&v128);
  }

  else
  {
    __int128 v128 = 0u;
    __int128 v129 = 0u;
  }

  sub_1000061D8((uint64_t)v125);
  if (!*((void *)&v129 + 1))
  {
    uint64_t v31 = &qword_100019438;
    uint64_t v32 = (char *)&v128;
    goto LABEL_10;
  }

  if ((swift_dynamicCast(&v122, &v128, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_11:
    type metadata accessor for MetricsActivity(0LL);
    uint64_t v33 = swift_bridgeObjectRetain(a2);
    uint64_t v34 = static MetricsActivity.current.getter(v33);
    uint64_t v35 = dispatch thunk of MetricsActivity.takeBuyMetrics()();
    uint64_t v37 = swift_release(v34, v36);
    uint64_t v38 = MetricsSystemInfo.init()(v37);
    uint64_t v39 = MetricsSystemInfo.dictionaryRepresentation.getter(v38);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v11, v111);
    unint64_t v40 = sub_100004274(v39);
    swift_bridgeObjectRelease(v39);
    uint64_t v41 = v121;
    TopShelfCreatePurchaseIntent.init(userInfo:metrics:systemInformation:)(a2, v35, v40);
    uint64_t v42 = type metadata accessor for JSIntentDispatcher(0LL);
    uint64_t v43 = v108;
    inject<A, B>(_:from:)(v125, v42, v108, v42, v109);
    uint64_t v110 = v125[0];
    type metadata accessor for IntentDispatchOptions(0LL);
    uint64_t v44 = swift_retain(v43);
    uint64_t v45 = BaseObjectGraph.__allocating_init(_:)(v44);
    uint64_t v46 = v112;
    uint64_t v47 = v113;
    (*(void (**)(char *, void, uint64_t))(v112 + 104))( v9,  enum case for IntentDispatchTimeout.none(_:),  v113);
    uint64_t v48 = IntentDispatchOptions.withTimeout(_:)(v9);
    uint64_t v111 = v48;
    swift_release(v45, v49);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v47);
    uint64_t v50 = sub_100006CB0( &qword_100019448,  (uint64_t (*)(uint64_t))&type metadata accessor for TopShelfCreatePurchaseIntent,  (uint64_t)&protocol conformance descriptor for TopShelfCreatePurchaseIntent);
    uint64_t v51 = v117;
    uint64_t v52 = dispatch thunk of JSIntentDispatcher.dispatch<A>(intent:with:fileID:)( v41,  v48,  "AppStoreTopShelfExtension/TopShelfContentProvider.swift",  55LL,  2LL,  v117,  v50);
    uint64_t v53 = (void *)swift_allocObject(&unk_100015388, 40LL, 7LL);
    uint64_t v55 = v114;
    uint64_t v54 = v115;
    v53[2] = v114;
    v53[3] = v54;
    uint64_t v56 = v118;
    v53[4] = v118;
    uint64_t v126 = type metadata accessor for SyncTaskScheduler(0LL);
    v127 = &protocol witness table for SyncTaskScheduler;
    sub_100006244(v125);
    swift_bridgeObjectRetain(v54);
    uint64_t v57 = swift_retain(v56);
    SyncTaskScheduler.init()(v57);
    uint64_t v58 = sub_10000614C(&qword_100019450);
    unint64_t v59 = sub_100006280();
    uint64_t v60 = Promise.flatMap<A>(on:_:)(v125, sub_100006238, v53, v58, v59);
    swift_release(v53, v61);
    sub_1000069A8(v125);
    uint64_t v62 = (void *)swift_allocObject(&unk_1000153B0, 48LL, 7LL);
    v62[2] = v55;
    v62[3] = v54;
    uint64_t v63 = v119;
    uint64_t v64 = v120;
    v62[4] = v119;
    v62[5] = v64;
    uint64_t v65 = (void *)swift_allocObject(&unk_1000153D8, 48LL, 7LL);
    v65[2] = v55;
    v65[3] = v54;
    v65[4] = v63;
    v65[5] = v64;
    unint64_t v66 = sub_10000635C();
    swift_bridgeObjectRetain_n(v54, 2LL);
    uint64_t v67 = swift_retain_n(v64, 2LL);
    uint64_t v68 = static OS_dispatch_queue.main.getter(v67);
    uint64_t v126 = v66;
    v127 = &protocol witness table for OS_dispatch_queue;
    v125[0] = v68;
    Promise.then(perform:orCatchError:on:)(sub_100006314, v62, sub_100006350, v65, v125);
    swift_release(v56, v69);
    swift_release(v111, v70);
    swift_release(v110, v71);
    swift_release(v52, v72);
    swift_release(v60, v73);
    swift_release(v62, v74);
    swift_release(v65, v75);
    sub_1000069A8(v125);
    return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v121, v51);
  }

  ControllerRequirement.init(rawValue:)(v122, v123);
  uint64_t v30 = v107;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1LL, v107) == 1)
  {
    uint64_t v31 = &qword_100019440;
    uint64_t v32 = v19;
LABEL_10:
    sub_100006AB8((uint64_t)v32, v31);
    goto LABEL_11;
  }

  v104 = v9;
  v77 = v106;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v106, v19, v30);
  uint64_t v78 = v20;
  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v79(v17, v77, v30);
  uint64_t v105 = v78;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v78 + 56))(v17, 0LL, 1LL, v30);
  unint64_t v80 = sub_100006398((uint64_t)v17);
  sub_100006AB8((uint64_t)v17, &qword_100019440);
  id v81 = [(id)objc_opt_self(TVSPreferences) sharedAppleTVServicesPreferences];
  unint64_t v82 = v81;
  if (v81) {
    unsigned int v83 = [v81 BOOLForKey:TVSBluetoothDefaultsKeyHasPairedGameController defaultValue:0];
  }
  else {
    unsigned int v83 = 0;
  }
  uint64_t v84 = v107;
  v79(v23, v106, v107);
  uint64_t v85 = v105;
  int v86 = (*(uint64_t (**)(char *, uint64_t))(v105 + 88))(v23, v84);
  uint64_t v9 = v104;
  if (v86 == enum case for ControllerRequirement.siriRemoteOrControllerRequired(_:))
  {
    if ((v83 & 1) != 0) {
      goto LABEL_22;
    }
    id v87 = [v27 connectedBluetoothRemote];
    if (!v87) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }

  if (v86 == enum case for ControllerRequirement.siriRemoteRequired(_:))
  {
    id v87 = [v27 connectedBluetoothRemote];
    if (!v87) {
      goto LABEL_25;
    }
LABEL_21:
    uint64_t v88 = v87;
    uint64_t v89 = (char *)[v87 remoteType];

LABEL_22:
    swift_bridgeObjectRelease(v80);
    goto LABEL_46;
  }

  if (v86 != enum case for ControllerRequirement.controllerRequired(_:))
  {

    swift_bridgeObjectRelease(v80);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v23, v84);
    goto LABEL_46;
  }

  if (v83) {
    goto LABEL_22;
  }
LABEL_25:
  if (!*(void *)(v80 + 16))
  {
    uint64_t v93 = 0LL;
    v92 = 0LL;
    uint64_t v94 = 0LL;
LABEL_44:
    v101 = 0LL;
    goto LABEL_45;
  }

  unint64_t v90 = sub_100005488(0x6165487472656C61LL, 0xEB00000000726564LL);
  if ((v91 & 1) != 0) {
    v92 = (__CFString *)*(id *)(*(void *)(v80 + 56) + 8 * v90);
  }
  else {
    v92 = 0LL;
  }
  if (!*(void *)(v80 + 16))
  {
    uint64_t v93 = 0LL;
    uint64_t v94 = 0LL;
    goto LABEL_44;
  }

  unint64_t v95 = sub_100005488(0x73654D7472656C61LL, 0xEC00000065676173LL);
  if ((v96 & 1) != 0) {
    uint64_t v94 = (__CFString *)*(id *)(*(void *)(v80 + 56) + 8 * v95);
  }
  else {
    uint64_t v94 = 0LL;
  }
  if (!*(void *)(v80 + 16))
  {
    uint64_t v93 = 0LL;
    goto LABEL_44;
  }

  unint64_t v97 = sub_100005488(0xD000000000000012LL, 0x8000000100011A10LL);
  if ((v98 & 1) != 0) {
    uint64_t v93 = (__CFString *)*(id *)(*(void *)(v80 + 56) + 8 * v97);
  }
  else {
    uint64_t v93 = 0LL;
  }
  if (!*(void *)(v80 + 16)) {
    goto LABEL_44;
  }
  unint64_t v99 = sub_100005488(0xD000000000000014LL, 0x8000000100011A30LL);
  if ((v100 & 1) == 0) {
    goto LABEL_44;
  }
  v101 = (__CFString *)*(id *)(*(void *)(v80 + 56) + 8 * v99);
LABEL_45:
  swift_bridgeObjectRelease(v80);
  CFUserNotificationDisplayAlert(0.0, 3uLL, 0LL, 0LL, 0LL, v92, v94, v93, v101, 0LL, &v124);

  uint64_t v84 = v107;
LABEL_46:
  (*(void (**)(char *, uint64_t))(v85 + 8))(v106, v84);
  if (v124 != 1) {
    goto LABEL_11;
  }
  id v102 = [objc_allocWithZone(TVTopShelfActionResult) init];
  [v102 setSuccess:0];
  [v102 setContentChange:0];
  v119(v102);

  return swift_release(v118, v103);
}

uint64_t sub_100003EB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000614C(&qword_1000194F8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v30 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v29 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v10 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v13 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_28;
    }

    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v15 >= v29) {
      goto LABEL_37;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    int64_t v17 = v10 + 1;
    if (!v16)
    {
      int64_t v17 = v10 + 2;
      if (v10 + 2 >= v29) {
        goto LABEL_37;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v10 + 3;
        if (v10 + 3 >= v29) {
          goto LABEL_37;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v10 + 4;
          if (v10 + 4 >= v29) {
            goto LABEL_37;
          }
          unint64_t v16 = *(void *)(v30 + 8 * v17);
          if (!v16) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    int64_t v10 = v17;
LABEL_28:
    uint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v14);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_10000695C(*(void *)(a1 + 56) + 32 * v14, (uint64_t)v42);
    *(void *)&__int128 v41 = v21;
    *((void *)&v41 + 1) = v20;
    v39[2] = v41;
    v40[0] = v42[0];
    v40[1] = v42[1];
    *(void *)&v39[0] = v21;
    *((void *)&v39[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    swift_dynamicCast(&v31, v39, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_100006998(v40, v34);
    __int128 v35 = v31;
    __int128 v36 = v32;
    uint64_t v37 = v33;
    sub_100006998(v34, v38);
    __int128 v31 = v35;
    __int128 v32 = v36;
    uint64_t v33 = v37;
    sub_100006998(v38, v39);
    sub_100006998(v39, &v35);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v22 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)&v7[8 * (v23 >> 6)]) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1LL << v23) & ~*(void *)&v7[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)&v7[8 * v24];
      }

      while (v28 == -1);
      unint64_t v11 = __clz(__rbit64(~v28)) + (v24 << 6);
    }

    *(void *)&v7[(v11 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v11;
    uint64_t v12 = v3[6] + 40 * v11;
    *(_OWORD *)uint64_t v12 = v31;
    *(_OWORD *)(v12 + 16) = v32;
    *(void *)(v12 + 32) = v33;
    uint64_t result = (uint64_t)sub_100006998(&v35, (_OWORD *)(v3[7] + 32 * v11));
    ++v3[2];
  }

  int64_t v18 = v10 + 5;
  if (v10 + 5 >= v29)
  {
LABEL_37:
    swift_release(v3, v9);
    sub_1000069C8(a1, v30);
    return (uint64_t)v3;
  }

  unint64_t v16 = *(void *)(v30 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v10 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v17 >= v29) {
      goto LABEL_37;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_100004274(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000614C(&qword_100019470);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v41 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v40 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = &v47;
  uint64_t v8 = &v49;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t i = 0LL;
  unint64_t v11 = (char *)&type metadata for Any + 8;
  uint64_t v12 = &type metadata for String;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v21 = i + 1;
  if (__OFADD__(i, 1LL)) {
    goto LABEL_35;
  }
  if (v21 >= v40) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v21);
  int64_t v23 = i + 1;
  if (!v22)
  {
    int64_t v23 = i + 2;
    if (i + 2 >= v40) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v41 + 8 * v23);
    if (!v22)
    {
      int64_t v23 = i + 3;
      if (i + 3 >= v40) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v41 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = i + 4;
        if (i + 4 >= v40) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v41 + 8 * v23);
        if (!v22)
        {
          int64_t v24 = i + 5;
          if (i + 5 < v40)
          {
            unint64_t v22 = *(void *)(v41 + 8 * v24);
            if (v22)
            {
              int64_t v23 = i + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v23 = v24 + 1;
              if (__OFADD__(v24, 1LL)) {
                goto LABEL_36;
              }
              if (v23 >= v40) {
                break;
              }
              unint64_t v22 = *(void *)(v41 + 8 * v23);
              ++v24;
              if (v22) {
                goto LABEL_26;
              }
            }
          }

LABEL_32:
          sub_1000069C8(v1, v41);
          return (unint64_t)v3;
        }
      }
    }
  }

LABEL_26:
  uint64_t v43 = (v22 - 1) & v22;
  unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
  for (i = v23; ; unint64_t v20 = __clz(__rbit64(v6)) | (i << 6))
  {
    uint64_t v25 = 16 * v20;
    unint64_t v26 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v20);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    int64_t v29 = (uint64_t *)(*(void *)(v1 + 56) + v25);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    uint64_t v45 = v28;
    uint64_t v46 = v27;
    v44[0] = v30;
    v44[1] = v31;
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRetain(v31);
    swift_dynamicCast(v7, v44, v12, v11, 7LL);
    uint64_t v32 = v45;
    uint64_t v33 = v46;
    sub_100006998(v7, v8);
    sub_100006998(v8, v50);
    sub_100006998(v50, &v48);
    unint64_t result = sub_100005488(v32, v33);
    unint64_t v34 = result;
    if ((v35 & 1) != 0)
    {
      int64_t v42 = i;
      unint64_t v13 = v8;
      unint64_t v14 = v7;
      uint64_t v15 = v1;
      unint64_t v16 = v12;
      int64_t v17 = v11;
      int64_t v18 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1]);
      *int64_t v18 = v32;
      v18[1] = v33;
      unint64_t v11 = v17;
      uint64_t v12 = v16;
      uint64_t v1 = v15;
      uint64_t v7 = v14;
      uint64_t v8 = v13;
      int64_t i = v42;
      uint64_t v19 = (void *)(v3[7] + 32 * v34);
      sub_1000069A8(v19);
      unint64_t result = (unint64_t)sub_100006998(&v48, v19);
      unint64_t v6 = v43;
      if (!v43) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    __int128 v36 = (uint64_t *)(v3[6] + 16 * result);
    *__int128 v36 = v32;
    v36[1] = v33;
    unint64_t result = (unint64_t)sub_100006998(&v48, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v37 = v3[2];
    BOOL v38 = __OFADD__(v37, 1LL);
    uint64_t v39 = v37 + 1;
    if (v38) {
      goto LABEL_34;
    }
    v3[2] = v39;
    unint64_t v6 = v43;
    if (!v43) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v43 = (v6 - 1) & v6;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1000045DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v10 = sub_1000053B0(v6, (uint64_t)qword_10001A0A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_10000614C(&qword_100019430);
  uint64_t v12 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v13 = swift_allocObject( v11,  ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
        + 2LL * *(void *)(v12 + 72),
          *(unsigned __int8 *)(v12 + 80) | 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_100012CE0;
  LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x8000000100011C90LL);
  v15[3] = &type metadata for String;
  v15[0] = a2;
  v15[1] = a3;
  swift_bridgeObjectRetain(a3);
  static LogMessage.traceableSensitive(_:)(v15);
  sub_100006AB8((uint64_t)v15, &qword_100019438);
  Logger.info(_:)(v13, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return dispatch thunk of Commerce.purchase(with:)(a1);
}

void sub_100004790(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  uint64_t v7 = type metadata accessor for OSLogger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v11 = sub_1000053B0(v7, (uint64_t)qword_10001A0A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = sub_10000614C(&qword_100019430);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_100012CE0;
  LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x8000000100011C70LL);
  v16[3] = &type metadata for String;
  v16[0] = a2;
  v16[1] = a3;
  swift_bridgeObjectRetain(a3);
  static LogMessage.traceableSensitive(_:)(v16);
  sub_100006AB8((uint64_t)v16, &qword_100019438);
  Logger.info(_:)(v14, v7, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v15 = [objc_allocWithZone(TVTopShelfActionResult) init];
  [v15 setSuccess:1];
  [v15 setContentChange:0];
  a4(v15);
}

void sub_100004988(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id), uint64_t a5)
{
  uint64_t v21 = a5;
  unint64_t v22 = a4;
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v12 = sub_1000053B0(v8, (uint64_t)qword_10001A0A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = sub_10000614C(&qword_100019430);
  uint64_t v14 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(v14 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))
        + 4LL * *(void *)(v14 + 72),
          *(unsigned __int8 *)(v14 + 80) | 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_100012CF0;
  LogMessage.init(stringLiteral:)(0xD00000000000002DLL, 0x8000000100011C40LL);
  uint64_t v27 = &type metadata for String;
  v26[0] = a2;
  v26[1] = a3;
  swift_bridgeObjectRetain(a3);
  static LogMessage.traceableSensitive(_:)(v26);
  sub_100006AB8((uint64_t)v26, &qword_100019438);
  LogMessage.init(stringLiteral:)(0x3A68746977LL, 0xE500000000000000LL);
  swift_getErrorValue(a1, v25, &v23);
  uint64_t v16 = v23;
  int64_t v17 = v24;
  uint64_t v27 = v24;
  int64_t v18 = sub_100006244(v26);
  (*(void (**)(void *, uint64_t, void *))(*(v17 - 1) + 16LL))(v18, v16, v17);
  static LogMessage.safe(_:)(v26);
  sub_100006AB8((uint64_t)v26, &qword_100019438);
  Logger.error(_:)(v15, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v19 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfActionResult);
  id v20 = objc_msgSend(v19, "init", v21);
  [v20 setSuccess:0];
  [v20 setContentChange:0];
  v22(v20);
}

void sub_100004BF4(uint64_t a1, void (*a2)(id))
{
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v8 = sub_1000053B0(v4, (uint64_t)qword_10001A0A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_10000614C(&qword_100019430);
  uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + 2LL * *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_100012CE0;
  LogMessage.init(stringLiteral:)(0xD000000000000036LL, 0x8000000100011970LL);
  swift_getErrorValue(a1, v18, &v16);
  uint64_t v12 = v16;
  uint64_t v13 = v17;
  v19[3] = v17;
  uint64_t v14 = sub_100006244(v19);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v14, v12, v13);
  static LogMessage.safe(_:)(v19);
  sub_100006AB8((uint64_t)v19, &qword_100019438);
  Logger.error(_:)(v11, v4, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v15 = [objc_allocWithZone(TVTopShelfActionResult) init];
  [v15 setSuccess:0];
  [v15 setContentChange:0];
  a2(v15);
}

unint64_t sub_100004F80(uint64_t a1)
{
  uint64_t v2 = sub_10000614C(&qword_100019500);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }

  sub_10000614C(&qword_100019508);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = &v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100006C6C(v13, (uint64_t)v5, &qword_100019500);
    unint64_t result = sub_10000541C((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for Artwork.URLTemplate.Key(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    uint64_t v21 = (void *)(v8[7] + 16 * v17);
    uint64_t v22 = *((void *)v10 + 1);
    void *v21 = *(void *)v10;
    v21[1] = v22;
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_12;
    }
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8, v20);
      uint64_t v26 = v28;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10000511C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000614C(&qword_100019468);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_100005488(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4, v12);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_10000534C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TopShelfContentProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC25AppStoreTopShelfExtension23TopShelfContentProvider);
}

uint64_t sub_1000053B0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000053C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

unint64_t sub_1000053EC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_1000054EC(a1, v4);
}

unint64_t sub_10000541C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for Artwork.URLTemplate.Key(0LL);
  uint64_t v6 = sub_100006CB0( &qword_100019510,  (uint64_t (*)(uint64_t))&type metadata accessor for Artwork.URLTemplate.Key,  (uint64_t)&protocol conformance descriptor for Artwork.URLTemplate.Key);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_1000055B0(a1, v7);
}

unint64_t sub_100005488(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000056F0(a1, a2, v5);
}

unint64_t sub_1000054EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1000069D0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000061D8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_1000055B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for Artwork.URLTemplate.Key(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      uint64_t v14 = sub_100006CB0( &qword_100019518,  (uint64_t (*)(uint64_t))&type metadata accessor for Artwork.URLTemplate.Key,  (uint64_t)&protocol conformance descriptor for Artwork.URLTemplate.Key);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

unint64_t sub_1000056F0(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

Swift::Int sub_1000057D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000614C(&qword_100019468);
  char v41 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v9 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v40 = v5 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  else {
    uint64_t v11 = -1LL;
  }
  unint64_t v12 = v11 & *(void *)(v5 + 64);
  BOOL v38 = v3;
  int64_t v39 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v16 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v22 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v23 = v22 | (v16 << 6);
      goto LABEL_34;
    }

    int64_t v24 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v24 >= v39) {
      break;
    }
    uint64_t v25 = (void *)(v5 + 64);
    unint64_t v26 = *(void *)(v40 + 8 * v24);
    ++v16;
    if (!v26)
    {
      int64_t v16 = v24 + 1;
      if (v24 + 1 >= v39) {
        goto LABEL_36;
      }
      unint64_t v26 = *(void *)(v40 + 8 * v16);
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v39)
        {
LABEL_36:
          swift_release(v5, v15);
          uint64_t v3 = v38;
          if ((v41 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v26 = *(void *)(v40 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            int64_t v16 = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              goto LABEL_45;
            }
            if (v16 >= v39) {
              goto LABEL_36;
            }
            unint64_t v26 = *(void *)(v40 + 8 * v16);
            ++v27;
            if (v26) {
              goto LABEL_33;
            }
          }
        }

        int64_t v16 = v27;
      }
    }

LABEL_33:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v16 << 6);
LABEL_34:
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v23);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    char v35 = *(void **)(*(void *)(v5 + 56) + 8 * v23);
    if ((v41 & 1) == 0)
    {
      swift_bridgeObjectRetain(v32[1]);
      id v36 = v35;
    }

    Hasher.init(_seed:)(v42, *(void *)(v9 + 40));
    String.hash(into:)(v42, v34, v33);
    Swift::Int result = Hasher._finalize()();
    uint64_t v17 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1LL << v18) & ~*(void *)(v13 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1LL << v18) & ~*(void *)(v13 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v30 = v19 == v29;
        if (v19 == v29) {
          unint64_t v19 = 0LL;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v13 + 8 * v19);
      }

      while (v31 == -1);
      unint64_t v20 = __clz(__rbit64(~v31)) + (v19 << 6);
    }

    *(void *)(v13 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
    uint64_t v21 = (void *)(*(void *)(v9 + 48) + 16 * v20);
    void *v21 = v34;
    v21[1] = v33;
    *(void *)(*(void *)(v9 + 56) + 8 * v20) = v35;
    ++*(void *)(v9 + 16);
  }

  swift_release(v5, v15);
  uint64_t v3 = v38;
  uint64_t v25 = (void *)(v5 + 64);
  if ((v41 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v37 = 1LL << *(_BYTE *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v25, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v25 = -1LL << v37;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5, v8);
  *uint64_t v3 = v9;
  return result;
}

void sub_100005ADC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100005488(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100005C38();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
    *unint64_t v22 = a2;
    v22[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v23 = v18[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }

    goto LABEL_14;
  }

  sub_1000057D0(v15, a4 & 1);
  unint64_t v20 = sub_100005488(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    unint64_t v12 = v20;
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_100005C38()
{
  uint64_t v1 = v0;
  sub_10000614C(&qword_100019468);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v5 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2, v4);
    uint64_t *v1 = v5;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1LL << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  int64_t v10 = 0LL;
  *(void *)(v5 + 16) = *(void *)(v2 + 16);
  uint64_t v11 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }

    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }

LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (void *)(*(void *)(v2 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    char v21 = *(void **)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19);
    id result = v21;
  }

  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

void sub_100005DE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  char v35 = a5;
  uint64_t v36 = a6;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t ObjectType = swift_getObjectType(v6);
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  uint64_t v31 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019270 != -1) {
    swift_once(&qword_100019270, sub_1000025EC);
  }
  uint64_t v11 = sub_1000053B0(v8, (uint64_t)qword_10001A0A0);
  uint64_t v12 = sub_10000614C(&qword_100019430);
  uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (v15 + 32) & ~v15;
  uint64_t v17 = v15 | 7;
  uint64_t v18 = swift_allocObject(v12, v16 + v14, v15 | 7);
  *(_OWORD *)(v18 + 16) = xmmword_100012CD0;
  LogMessage.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100011900LL);
  Logger.info(_:)(v18, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v18);
  if (a2)
  {
    uint64_t v19 = (void *)swift_allocObject(&unk_100015338, 64LL, 7LL);
    char v21 = v35;
    uint64_t v20 = v36;
    v19[2] = a2;
    v19[3] = v21;
    uint64_t v22 = v33;
    uint64_t v23 = v34;
    void v19[4] = v20;
    v19[5] = v22;
    uint64_t v24 = ObjectType;
    v19[6] = v23;
    v19[7] = v24;
    uint64_t v25 = swift_allocObject(&unk_100015360, 32LL, 7LL);
    *(void *)(v25 + 16) = v21;
    *(void *)(v25 + 24) = v20;
    swift_retain_n(v20, 2LL);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(v23);
    sub_10000E96C((uint64_t)sub_1000061C0, (uint64_t)v19, (uint64_t)sub_1000061D0, v25);
    swift_release(v19, v26);
    swift_release(v25, v27);
  }

  else
  {
    uint64_t v28 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v10, v11, v8);
    uint64_t v29 = swift_allocObject(v12, v16 + 3 * v14, v17);
    *(_OWORD *)(v29 + 16) = xmmword_100012D00;
    LogMessage.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100011920LL);
    v37[3] = &type metadata for String;
    v37[0] = v33;
    v37[1] = v34;
    swift_bridgeObjectRetain(v34);
    static LogMessage.traceableSensitive(_:)(v37);
    sub_100006AB8((uint64_t)v37, &qword_100019438);
    LogMessage.init(stringLiteral:)(0xD000000000000023LL, 0x8000000100011940LL);
    Logger.error(_:)(v29, v8, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v29);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
    id v30 = [objc_allocWithZone(TVTopShelfActionResult) init];
    [v30 setSuccess:0];
    [v30 setContentChange:0];
    v35(v30);
  }

uint64_t sub_10000614C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000618C()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_1000061C0(uint64_t a1)
{
  return sub_10000345C( a1,  *(void *)(v1 + 16),  *(void (**)(void))(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 48));
}

void sub_1000061D0(uint64_t a1)
{
}

uint64_t sub_1000061D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000620C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100006238(uint64_t a1)
{
  return sub_1000045DC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void *sub_100006244(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

unint64_t sub_100006280()
{
  unint64_t result = qword_100019458;
  if (!qword_100019458)
  {
    uint64_t v1 = sub_1000062CC(&qword_100019450);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100019458);
  }

  return result;
}

uint64_t sub_1000062CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void sub_100006314(uint64_t a1)
{
}

uint64_t sub_100006324()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_100006350(uint64_t a1)
{
}

unint64_t sub_10000635C()
{
  unint64_t result = qword_100019460;
  if (!qword_100019460)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019460);
  }

  return result;
}

unint64_t sub_100006398(uint64_t a1)
{
  uint64_t v2 = sub_10000614C(&qword_100019440);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ControllerRequirement(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v63 - v10;
  unint64_t v12 = sub_10000511C((uint64_t)_swiftEmptyArrayStorage);
  sub_100006C6C(a1, (uint64_t)v4, &qword_100019440);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    sub_100006AB8((uint64_t)v4, &qword_100019440);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 == enum case for ControllerRequirement.siriRemoteOrControllerRequired(_:))
    {
      v14._countAndFlagsBits = 0xD00000000000003ALL;
      v14._object = (void *)0x8000000100011B70LL;
      v15._countAndFlagsBits = 0LL;
      v15._object = (void *)0xE000000000000000LL;
      object = localizedString(_:comment:)(v14, v15)._object;
      NSString v17 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
      unint64_t v64 = v12;
      sub_100005ADC((uint64_t)v17, 0x6165487472656C61LL, 0xEB00000000726564LL, isUniquelyReferenced_nonNull_native);
      unint64_t v19 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      v20._countAndFlagsBits = 0xD000000000000040LL;
      v20._object = (void *)0x8000000100011BB0LL;
      v21._countAndFlagsBits = 0LL;
      v21._object = (void *)0xE000000000000000LL;
      uint64_t v22 = localizedStringReferencingSiriRemote(_:comment:)(v20, v21)._object;
      NSString v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v22);
      char v24 = swift_isUniquelyReferenced_nonNull_native(v19);
      unint64_t v64 = v19;
      sub_100005ADC((uint64_t)v23, 0x73654D7472656C61LL, 0xEC00000065676173LL, v24);
      unint64_t v25 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      unint64_t v26 = 0xD000000000000037LL;
      uint64_t v27 = "TV_SIRI_REMOTE_REQUIRED_OR_CONTROLLER_OPTIONAL_CONTINUE";
    }

    else if (v13 == enum case for ControllerRequirement.siriRemoteRequired(_:))
    {
      v28._countAndFlagsBits = 0xD000000000000023LL;
      v28._object = (void *)0x8000000100011AE0LL;
      v29._countAndFlagsBits = 0LL;
      v29._object = (void *)0xE000000000000000LL;
      id v30 = localizedString(_:comment:)(v28, v29)._object;
      NSString v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v30);
      char v32 = swift_isUniquelyReferenced_nonNull_native(v12);
      unint64_t v64 = v12;
      sub_100005ADC((uint64_t)v31, 0x6165487472656C61LL, 0xEB00000000726564LL, v32);
      unint64_t v33 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      v34._countAndFlagsBits = 0xD000000000000029LL;
      v34._object = (void *)0x8000000100011B10LL;
      v35._countAndFlagsBits = 0LL;
      v35._object = (void *)0xE000000000000000LL;
      uint64_t v36 = localizedStringReferencingSiriRemote(_:comment:)(v34, v35)._object;
      NSString v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v36);
      char v38 = swift_isUniquelyReferenced_nonNull_native(v33);
      unint64_t v64 = v33;
      sub_100005ADC((uint64_t)v37, 0x73654D7472656C61LL, 0xEC00000065676173LL, v38);
      unint64_t v25 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      unint64_t v26 = 0xD000000000000020LL;
      uint64_t v27 = "TV_SIRI_REMOTE_REQUIRED_CONTINUE";
    }

    else
    {
      if (v13 != enum case for ControllerRequirement.controllerRequired(_:))
      {
        uint64_t v62 = *(void (**)(char *, uint64_t))(v6 + 8);
        v62(v11, v5);
        v62(v9, v5);
        return v12;
      }

      v39._countAndFlagsBits = 0xD000000000000022LL;
      v39._object = (void *)0x8000000100011A50LL;
      v40._countAndFlagsBits = 0LL;
      v40._object = (void *)0xE000000000000000LL;
      char v41 = localizedString(_:comment:)(v39, v40)._object;
      NSString v42 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v41);
      char v43 = swift_isUniquelyReferenced_nonNull_native(v12);
      unint64_t v64 = v12;
      sub_100005ADC((uint64_t)v42, 0x6165487472656C61LL, 0xEB00000000726564LL, v43);
      unint64_t v44 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      v45._countAndFlagsBits = 0xD000000000000028LL;
      v45._object = (void *)0x8000000100011A80LL;
      v46._countAndFlagsBits = 0LL;
      v46._object = (void *)0xE000000000000000LL;
      uint64_t v47 = localizedString(_:comment:)(v45, v46)._object;
      NSString v48 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v47);
      char v49 = swift_isUniquelyReferenced_nonNull_native(v44);
      unint64_t v64 = v44;
      sub_100005ADC((uint64_t)v48, 0x73654D7472656C61LL, 0xEC00000065676173LL, v49);
      unint64_t v25 = v64;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      unint64_t v26 = 0xD000000000000025LL;
      uint64_t v27 = "TV_CONTROLLER_REQUIRED_ALERT_CONTINUE";
    }

    unint64_t v50 = (unint64_t)(v27 - 32) | 0x8000000000000000LL;
    v51._countAndFlagsBits = 0LL;
    v51._object = (void *)0xE000000000000000LL;
    uint64_t v52 = localizedString(_:comment:)(*(Swift::String *)&v26, v51)._object;
    NSString v53 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v52);
    char v54 = swift_isUniquelyReferenced_nonNull_native(v25);
    unint64_t v64 = v25;
    sub_100005ADC((uint64_t)v53, 0xD000000000000012LL, 0x8000000100011A10LL, v54);
    unint64_t v55 = v64;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    v56._countAndFlagsBits = 0x435F4E4F49544341LL;
    v56._object = (void *)0xED00004C45434E41LL;
    v57._countAndFlagsBits = 0LL;
    v57._object = (void *)0xE000000000000000LL;
    uint64_t v58 = localizedString(_:comment:)(v56, v57)._object;
    NSString v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v58);
    char v60 = swift_isUniquelyReferenced_nonNull_native(v55);
    unint64_t v64 = v55;
    sub_100005ADC((uint64_t)v59, 0xD000000000000014LL, 0x8000000100011A30LL, v60);
    unint64_t v12 = v64;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }

  return v12;
}

uint64_t sub_10000695C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100006998(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000069A8(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = *(void *)(v1 - 8);
  if ((*(_BYTE *)(v2 + 82) & 2) != 0) {
    return swift_release(*a1, v1);
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_1000069C8(uint64_t a1, uint64_t a2)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL, a2);
}

uint64_t sub_1000069D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *sub_100006A0C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006A4C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_100006A5C(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

void sub_100006A80(uint64_t a1)
{
}

uint64_t sub_100006A88(uint64_t a1)
{
  return sub_100003198( a1,  *(uint64_t (**)(void))(v1 + 16),  *(void *)(v1 + 24),  0xD00000000000002ELL,  0x8000000100011CE0LL);
}

uint64_t sub_100006AB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000614C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100006AF4()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6), v8);
  swift_release(*(void *)(v0 + v7 + 8), v9);
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_100006B84(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_100002E08( a1,  v1 + v4,  *(void *)(v1 + v5),  *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8));
}

uint64_t sub_100006BE4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100006C04(uint64_t a1)
{
  return sub_100003198( a1,  *(uint64_t (**)(void))(v1 + 16),  *(void *)(v1 + 24),  0xD000000000000049LL,  0x8000000100011D10LL);
}

uint64_t sub_100006C34(uint64_t a1)
{
  return sub_100003074(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_100006C3C(uint64_t a1)
{
  return sub_100003198( a1,  *(uint64_t (**)(void))(v1 + 16),  *(void *)(v1 + 24),  0xD00000000000001CLL,  0x8000000100011D60LL);
}

uint64_t sub_100006C6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000614C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006CB0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006D10()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  sub_100006A0C(v4, qword_10001A0B8);
  sub_1000053B0(v4, (uint64_t)qword_10001A0B8);
  if (qword_100019290 != -1) {
    swift_once(&qword_100019290, sub_10000B288);
  }
  uint64_t v5 = sub_1000053B0(v0, (uint64_t)qword_10001A100);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSLogger.init(subsystem:category:)(v3, 0x50207265646E6552LL, 0xEF656E696C657069LL);
}

uint64_t sub_100006E18(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsMetricsLogger) = 0LL;
  *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsonMetricsLogger) = 0LL;
  *(void *)(v1
            + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___diagnosticsMetricsLogger) = 0LL;
  *(void *)(v1
            + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___validationMetricsLogger) = 0LL;
  uint64_t v3 = v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter_configuration;
  uint64_t v4 = type metadata accessor for MetricsLogger.Configuration(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  id v6 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  uint64_t v7 = swift_retain(v1);
  uint64_t v8 = (void *)static RenderPipelineDiagnostics.errorDidOccurNotification.getter(v7);
  [v6 addObserver:v1 selector:"errorDidOccur:" name:v8 object:0];
  swift_release(v1, v9);

  uint64_t v10 = swift_retain(v1);
  uint64_t v11 = (void *)static RenderPipelineDiagnostics.incidentsDidOccurNotification.getter(v10);
  [v6 addObserver:v1 selector:"incidentsDidOccur:" name:v11 object:0];

  swift_release(v1, v12);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v1;
}

uint64_t sub_100006F6C()
{
  id v1 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  [v1 removeObserver:v0];

  uint64_t v2 = v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter_configuration;
  uint64_t v3 = type metadata accessor for MetricsLogger.Configuration(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsMetricsLogger),  v4);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsonMetricsLogger),  v5);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___diagnosticsMetricsLogger),  v6);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___validationMetricsLogger),  v7);
  return v0;
}

uint64_t sub_100007028()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000704C()
{
  return type metadata accessor for DiagnosticsReporter(0LL);
}

uint64_t type metadata accessor for DiagnosticsReporter(uint64_t a1)
{
  uint64_t result = qword_100019570;
  if (!qword_100019570) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DiagnosticsReporter);
  }
  return result;
}

uint64_t sub_100007090(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3;
  type metadata accessor for MetricsLogger.Configuration(0LL);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v7 + v11);
  if (v12)
  {
    uint64_t v13 = *(void *)(v7 + v11);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 16))( v10,  v7 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter_configuration);
    uint64_t v14 = type metadata accessor for MetricsLogger(0LL);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    uint64_t v13 = MetricsLogger.init(loggerName:configuration:)(a2, a3, v10);
    uint64_t v15 = *(void *)(v7 + v11);
    *(void *)(v7 + v11) = v13;
    swift_retain(v13);
    swift_release(v15, v16);
    uint64_t v12 = 0LL;
  }

  swift_retain(v12);
  return v13;
}

uint64_t sub_100007180(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OSLogger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = (id)ASKBuildTypeGetCurrent(v4);
  uint64_t v8 = sub_10000614C(&qword_100019618);
  uint64_t v9 = swift_allocObject(v8, 56LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_100012D00;
  uint64_t v10 = (void *)ASKBuildTypeDebug;
  uint64_t v11 = (void *)ASKBuildTypeConvergence;
  *(void *)(v9 + 32) = ASKBuildTypeDebug;
  *(void *)(v9 + 40) = v11;
  uint64_t v12 = (void *)ASKBuildTypeInternal;
  *(void *)(v9 + 48) = ASKBuildTypeInternal;
  type metadata accessor for BuildType(0LL);
  id v13 = v10;
  id v14 = v11;
  id v15 = v12;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  LODWORD(v9) = ASKBuildTypeIsAnyOf(v7, isa);

  if ((_DWORD)v9)
  {
    *(void *)&__int128 v37 = a1;
    swift_errorRetain(a1);
    uint64_t v17 = sub_10000614C(&qword_100019620);
    uint64_t v18 = sub_10000614C(&qword_100019628);
    if ((swift_dynamicCast(&v38, &v37, v17, v18, 6LL) & 1) != 0)
    {
      sub_100007FD0(&v38, (uint64_t)v41);
      unint64_t v19 = v42;
      uint64_t v20 = v43;
      sub_100007FE8(v41, (uint64_t)v42);
      *(void *)&__int128 v37 = dispatch thunk of MetricsReportableError.metricsErrorDescription.getter(v19, v20);
      *((void *)&v37 + 1) = v21;
      uint64_t v22 = sub_100007FE8(v41, (uint64_t)v42);
      __chkstk_darwin(v22);
      *(&v36 - 2) = (uint64_t)&v37;
      dispatch thunk of MetricsReportableError.describeForMetricsEvent(using:)(sub_10000800C);
      if (qword_100019278 != -1) {
        swift_once(&qword_100019278, sub_100006D10);
      }
      uint64_t v23 = sub_1000053B0(v2, (uint64_t)qword_10001A0B8);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v23, v2);
      uint64_t v24 = sub_10000614C(&qword_100019430);
      uint64_t v25 = type metadata accessor for LogMessage(0LL);
      uint64_t v26 = swift_allocObject( v24,  ((*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL))
            + *(void *)(*(void *)(v25 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v26 + 16) = xmmword_100012CD0;
      *((void *)&v39 + 1) = &type metadata for String;
      __int128 v38 = v37;
      swift_bridgeObjectRetain(*((void *)&v37 + 1));
      static LogMessage.safe(_:)(&v38);
      sub_100006AB8((uint64_t)&v38, &qword_100019438);
      Logger.error(_:)(v26, v2, &protocol witness table for OSLogger);
      swift_bridgeObjectRelease(v26);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      swift_bridgeObjectRelease(*((void *)&v37 + 1));
      sub_1000069A8(v41);
      goto LABEL_10;
    }

    uint64_t v40 = 0LL;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    sub_100006AB8((uint64_t)&v38, (uint64_t *)&unk_100019630);
  }

  if (qword_100019278 != -1) {
    swift_once(&qword_100019278, sub_100006D10);
  }
  uint64_t v27 = sub_1000053B0(v2, (uint64_t)qword_10001A0B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v27, v2);
  uint64_t v28 = sub_10000614C(&qword_100019430);
  uint64_t v29 = type metadata accessor for LogMessage(0LL);
  uint64_t v30 = swift_allocObject( v28,  ((*(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL))
        + *(void *)(*(void *)(v29 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v30 + 16) = xmmword_100012CD0;
  swift_getErrorValue(a1, v45, v44);
  uint64_t v31 = Error.localizedDescription.getter(v44[1], v44[2]);
  NSString v42 = &type metadata for String;
  v41[0] = v31;
  v41[1] = v32;
  static LogMessage.safe(_:)(v41);
  sub_100006AB8((uint64_t)v41, &qword_100019438);
  Logger.error(_:)(v30, v2, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v30);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_10:
  uint64_t v33 = sub_100007AF8(a1);
  MetricsLogger.log(contentsOf:)(a1);
  return swift_release(v33, v34);
}

uint64_t sub_100007690(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OSLogger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100007090( &OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___validationMetricsLogger,  0x69746164696C6176LL,  0xEA00000000006E6FLL);
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    return swift_release(v6, v7);
  }
  uint64_t v9 = v6;
  uint64_t v10 = type metadata accessor for JSIncident(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v13 = qword_100019278;
  uint64_t v36 = a1;
  swift_bridgeObjectRetain(a1);
  if (v13 != -1) {
    swift_once(&qword_100019278, sub_100006D10);
  }
  uint64_t v40 = *(void *)(v11 + 72);
  __int128 v45 = xmmword_100012CE0;
  __int128 v38 = (void *)v10;
  unint64_t v39 = 0x8000000100011EB0LL;
  uint64_t v41 = v3;
  uint64_t v42 = v9;
  uint64_t v37 = v11;
  do
  {
    uint64_t v44 = v8;
    uint64_t v14 = sub_1000053B0(v2, (uint64_t)qword_10001A0B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    uint64_t v15 = sub_10000614C(&qword_100019430);
    uint64_t v43 = v15;
    uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v17 = *(void *)(v16 + 72);
    uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
    uint64_t v19 = (v18 + 32) & ~v18;
    uint64_t v20 = v18 | 7;
    uint64_t v21 = swift_allocObject(v15, v19 + 2 * v17, v18 | 7);
    *(_OWORD *)(v21 + 16) = v45;
    LogMessage.init(stringLiteral:)(0xD000000000000016LL, v39);
    uint64_t v22 = v38;
    char v49 = v38;
    uint64_t v23 = sub_100006244(&v47);
    (*(void (**)(void *, uint64_t, void *))(v37 + 16))(v23, v12, v22);
    static LogMessage.safe(_:)(&v47);
    sub_100006AB8((uint64_t)&v47, &qword_100019438);
    Logger.warning(_:)(v21, v2, &protocol witness table for OSLogger);
    uint64_t v24 = v21;
    uint64_t v3 = v41;
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v46 = v42;
    uint64_t v25 = swift_allocObject(v43, v19 + 2 * v17, v20);
    *(_OWORD *)(v25 + 16) = v45;
    uint64_t v26 = JSIncident.problemSummary.getter();
    char v49 = &type metadata for String;
    uint64_t v47 = v26;
    uint64_t v48 = v27;
    static LogMessage.safe(_:)(&v47);
    uint64_t v28 = sub_100006AB8((uint64_t)&v47, &qword_100019438);
    uint64_t v29 = v44;
    uint64_t v30 = JSIncident.contextSummary.getter(v28);
    char v49 = &type metadata for String;
    uint64_t v47 = v30;
    uint64_t v48 = v31;
    static LogMessage.safe(_:)(&v47);
    sub_100006AB8((uint64_t)&v47, &qword_100019438);
    uint64_t v32 = type metadata accessor for MetricsLogger(0LL);
    Logger.error(_:)(v25, v32, &protocol witness table for MetricsLogger);
    swift_bridgeObjectRelease(v25);
    v12 += v40;
    uint64_t v8 = v29 - 1;
  }

  while (v8);
  swift_release(v42, v33);
  return swift_bridgeObjectRelease(v36);
}

uint64_t sub_100007A7C(uint64_t a1)
{
  uint64_t result = type metadata accessor for MetricsLogger.Configuration(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "\b";
    v4[2] = "\b";
    v4[3] = "\b";
    v4[4] = "\b";
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100007AF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSError(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSONError(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1;
  swift_errorRetain(a1);
  uint64_t v10 = sub_10000614C(&qword_100019620);
  if (swift_dynamicCast(v9, &v14, v10, v6, 0LL))
  {
    uint64_t v11 = sub_100007090( &OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsonMetricsLogger,  1852797802LL,  0xE400000000000000LL);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  else
  {
    swift_errorRelease(v14);
    uint64_t v14 = a1;
    swift_errorRetain(a1);
    if (!swift_dynamicCast(v5, &v14, v10, v2, 0LL))
    {
      swift_errorRelease(v14);
      return sub_100007090( &OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___diagnosticsMetricsLogger,  0x74736F6E67616964LL,  0xEB00000000736369LL);
    }

    uint64_t v11 = sub_100007090( &OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter____lazy_storage___jsMetricsLogger,  29546LL,  0xE200000000000000LL);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  swift_errorRelease(v14);
  return v11;
}

uint64_t sub_100007CAC(uint64_t a1, void *a2, uint64_t a3)
{
  v11._countAndFlagsBits = 0LL;
  v11._object = (void *)0xE000000000000000LL;
  v6._countAndFlagsBits = 10LL;
  v6._object = (void *)0xE100000000000000LL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 8250LL;
  v8._object = (void *)0xE200000000000000LL;
  String.append(_:)(v8);
  _print_unlocked<A, B>(_:_:)( a3,  &v11,  (char *)&type metadata for Any + 8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  object = v11._object;
  String.append(_:)(v11);
  return swift_bridgeObjectRelease(object);
}

uint64_t sub_100007D64()
{
  uint64_t v0 = type metadata accessor for Notification(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = RenderPipelineDiagnostics.Recorder.snapshot()(v2);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    unint64_t v7 = (*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    uint64_t v34 = v5;
    unint64_t v8 = v5 + v7;
    uint64_t v9 = *(void *)(v1 + 72);
    uint64_t v35 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v36 = v9;
    for (uint64_t i = v35(v4, v5 + v7, v0); ; uint64_t i = v35(v4, v8, v0))
    {
      id v11 = (id)Notification.name.getter(i);
      uint64_t v12 = (void *)static RenderPipelineDiagnostics.errorDidOccurNotification.getter(v11);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v15 = v14;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v18 = v16;
      if (v13 == v17 && v15 == v16) {
        break;
      }
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v17, v16, 0LL);

      swift_bridgeObjectRelease(v15);
      uint64_t v20 = swift_bridgeObjectRelease(v18);
      if ((v19 & 1) != 0) {
        goto LABEL_9;
      }
      uint64_t v23 = (void *)static RenderPipelineDiagnostics.incidentsDidOccurNotification.getter(v20);
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      uint64_t v26 = v25;
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v29 = v27;
      if (v24 == v28 && v26 == v27)
      {

        swift_bridgeObjectRelease_n(v26, 2LL);
      }

      else
      {
        char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v26, v28, v27, 0LL);

        swift_bridgeObjectRelease(v26);
        swift_bridgeObjectRelease(v29);
        if ((v30 & 1) == 0) {
          goto LABEL_3;
        }
      }

      uint64_t v31 = static RenderPipelineDiagnostics.incidents(of:)(v4);
      if (v31)
      {
        uint64_t v32 = v31;
        sub_100007690(v31);
        swift_bridgeObjectRelease(v32);
      }

LABEL_3:
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      v8 += v36;
      if (!--v6) {
        return swift_bridgeObjectRelease(v34);
      }
    }

    swift_bridgeObjectRelease_n(v15, 2LL);
LABEL_9:

    uint64_t v21 = static RenderPipelineDiagnostics.error(of:)(v4);
    if (v21)
    {
      uint64_t v22 = v21;
      sub_100007180(v21);
      swift_errorRelease(v22);
    }

    goto LABEL_3;
  }

  return swift_bridgeObjectRelease(v5);
}

uint64_t sub_100007FD0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100007FE8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000800C(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100007CAC(a1, a2, a3);
}

uint64_t sub_100008014()
{
  uint64_t v0 = type metadata accessor for Bag.Profile(0LL);
  sub_100006A0C(v0, qword_10001A0D0);
  sub_1000053B0(v0, (uint64_t)qword_10001A0D0);
  return Bag.Profile.init(name:version:)(0x6F74537070415654LL, 0xEA00000000006572LL, 49LL, 0xE100000000000000LL);
}

uint64_t ArtworkLoader.fetchIcon(config:fallbackConfig:forReason:closestMatch:handlerKey:completionHandler:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject(&unk_100015540, 24LL, 7LL);
  swift_weakInit(v14 + 16, v7);
  uint64_t v15 = (void *)swift_allocObject(&unk_100015568, 56LL, 7LL);
  v15[2] = a6;
  v15[3] = a7;
  void v15[4] = v14;
  v15[5] = a2;
  v15[6] = a3;
  sub_1000082D8(a6, a7);
  swift_retain(v14);
  swift_retain(a2);
  ArtworkLoader.fetchArtworkFromCache(using:forReason:closestMatch:completionHandler:)(a1, a3, 1LL, sub_1000082AC, v15);
  swift_release(v14, v16);
  swift_release(v15, v17);
  return ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)( a1,  2LL,  0LL,  a5,  a6,  a7);
}

uint64_t sub_100008174()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100008198( uint64_t result, char a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, uint64_t, void), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a4)
  {
    uint64_t v12 = a7 + 16;
    swift_beginAccess(a7 + 16, v17, 0LL, 0LL);
    uint64_t result = swift_weakLoadStrong(v12);
    if (result)
    {
      uint64_t v13 = result;
      uint64_t v14 = swift_allocObject(&unk_100015590, 32LL, 7LL);
      *(void *)(v14 + swift_weakDestroy(v0 + 16) = a5;
      *(void *)(v14 + 24) = a6;
      sub_1000082D8((uint64_t)a5, a6);
      ArtworkLoader.fetchArtworkFromCache(using:forReason:closestMatch:completionHandler:)( a8,  a9,  1LL,  sub_100008314,  v14);
      swift_release(v13, v15);
      return swift_release(v14, v16);
    }
  }

  else if (a5)
  {
    return a5(result, a2 & 1, a3, 0LL);
  }

  return result;
}

uint64_t sub_100008270(uint64_t a1, uint64_t a2)
{
  if (v2[2]) {
    swift_release(v2[3], a2);
  }
  swift_release(v2[4], a2);
  swift_release(v2[5], v3);
  return swift_deallocObject(v2, 56LL, 7LL);
}

uint64_t sub_1000082AC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_100008198( a1,  a2,  a3,  a4,  *(uint64_t (**)(uint64_t, void, uint64_t, void))(v4 + 16),  *(void *)(v4 + 24),  *(void *)(v4 + 32),  *(void *)(v4 + 40),  *(void *)(v4 + 48));
}

uint64_t sub_1000082D8(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_1000082E8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(v2 + 16)) {
    swift_release(*(void *)(v2 + 24), a2);
  }
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_100008314(uint64_t result, char a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, void))(v4 + 16);
    if (v5) {
      return v5(result, a2 & 1, a3, 0LL);
    }
  }

  return result;
}

uint64_t sub_100008348()
{
  uint64_t v0 = sub_10000614C(&qword_1000196B0);
  sub_100006A0C(v0, qword_10001A0E8);
  sub_1000053B0(v0, (uint64_t)qword_10001A0E8);
  uint64_t v1 = sub_10000614C(&qword_100019840);
  return Conditional.init(_:)(sub_1000083BC, 0LL, v1, &type metadata for CGFloat);
}

void sub_1000083BC(id *a1@<X0>, double *a2@<X8>)
{
  id v3 = [*a1 traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityMedium);
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  if (v5 == v8 && v7 == v9) {
    goto LABEL_13;
  }
  uint64_t v11 = v9;
  char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 0LL);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v11);
  if ((v12 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityLarge);
  uint64_t v7 = v14;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  if (v13 == v15 && v7 == v16) {
    goto LABEL_13;
  }
  uint64_t v18 = v16;
  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v7, v15, v16, 0LL);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v18);
  if ((v19 & 1) != 0)
  {
LABEL_14:

    double v25 = 2.0;
    goto LABEL_15;
  }

  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraLarge);
  uint64_t v7 = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v24 = v22;
  if (v20 == v23 && v7 == v22)
  {
LABEL_13:
    swift_bridgeObjectRelease_n(v7, 2LL);
    goto LABEL_14;
  }

  char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v7, v23, v22, 0LL);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v24);
  if ((v26 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraLarge);
  uint64_t v29 = v28;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v32 = v30;
  if (v27 == v31 && v29 == v30)
  {
    swift_bridgeObjectRelease_n(v29, 2LL);
LABEL_21:

LABEL_22:
    double v25 = 3.0;
    goto LABEL_15;
  }

  char v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v29, v31, v30, 0LL);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v32);
  if ((v33 & 1) != 0) {
    goto LABEL_21;
  }
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraExtraLarge);
  uint64_t v36 = v35;
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v39 = v37;
  if (v34 == v38 && v36 == v37)
  {

    swift_bridgeObjectRelease_n(v36, 2LL);
    goto LABEL_22;
  }

  char v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, v38, v37, 0LL);

  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(v39);
  double v25 = 1.0;
  if ((v40 & 1) != 0) {
    double v25 = 3.0;
  }
LABEL_15:
  *a2 = v25;
}

uint64_t TVFlowcaseItemLayout.init(metrics:artworkView:captionText:titleText:subtitleText:)@<X0>( uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v11 = type metadata accessor for Locale(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for TVFlowcaseItemLayout(0LL);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008878(a1, (uint64_t)&v18[*(int *)(v16 + 32)]);
  uint64_t v19 = sub_100008AB8((uint64_t)a2, (uint64_t)v18);
  uint64_t v20 = static Locale.storefront.getter(v19);
  char v21 = Locale.hasExtraTallWritingSystem.getter(v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if ((v21 & 1) != 0)
  {
    uint64_t v22 = a3[3];
    uint64_t v23 = a3[4];
    sub_100007FE8(a3, v22);
    LayoutTextView.withLanguageAwareOutsets.getter(v22, v23);
    uint64_t v24 = a4[3];
    uint64_t v25 = a4[4];
    sub_100007FE8(a4, v24);
    LayoutTextView.withLanguageAwareOutsets.getter(v24, v25);
    uint64_t v26 = a5[3];
    uint64_t v27 = a5[4];
    sub_100007FE8(a5, v26);
    LayoutTextView.withLanguageAwareOutsets.getter(v26, v27);
    sub_1000069A8(a2);
    sub_100008904(a1);
    sub_100007FD0(&v30, (uint64_t)(v18 + 120));
  }

  else
  {
    sub_1000069A8(a2);
    sub_100008904(a1);
    sub_100008AB8((uint64_t)a3, (uint64_t)(v18 + 40));
    sub_100008AB8((uint64_t)a4, (uint64_t)(v18 + 80));
    sub_100008AB8((uint64_t)a5, (uint64_t)(v18 + 120));
  }

  sub_100008E1C((uint64_t)v18, v29, type metadata accessor for TVFlowcaseItemLayout);
  sub_1000069A8(a5);
  sub_1000069A8(a4);
  return sub_1000069A8(a3);
}

uint64_t type metadata accessor for TVFlowcaseItemLayout(uint64_t a1)
{
  return sub_1000088D0(a1, qword_100019748, (uint64_t)&nominal type descriptor for TVFlowcaseItemLayout);
}

uint64_t sub_100008878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for TVFlowcaseItemLayout.Metrics(uint64_t a1)
{
  return sub_1000088D0(a1, qword_1000197E8, (uint64_t)&nominal type descriptor for TVFlowcaseItemLayout.Metrics);
}

uint64_t sub_1000088D0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_100008904(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t TVFlowcaseItemLayout.Metrics.captionSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AB8(v1, a1);
}

uint64_t TVFlowcaseItemLayout.captionText.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AB8(v1 + 40, a1);
}

uint64_t TVFlowcaseItemLayout.subtitleText.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AB8(v1 + 120, a1);
}

uint64_t TVFlowcaseItemLayout.Metrics.init(captionSpace:titleSpace:subtitleSpace:textArtworkMargin:artworkAspectRatio:bottomSpace:textLayoutMargins:)@<X0>( __int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X4>, __int128 *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v17 = a8 + v16[10];
  sub_100007FD0(a1, a8);
  sub_100007FD0(a2, a8 + 40);
  sub_100007FD0(a3, a8 + 80);
  sub_100007FD0(a4, a8 + 120);
  uint64_t v18 = a8 + v16[8];
  uint64_t v19 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32LL))(v18, a5, v19);
  sub_100007FD0(a6, a8 + v16[9]);
  return sub_100008A70(a7, v17);
}

uint64_t sub_100008A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000614C(&qword_100019640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TVFlowcaseItemLayout.Metrics.captionSpace.setter(__int128 *a1)
{
  return sub_100007FD0(a1, (uint64_t)v1);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.captionSpace.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.titleSpace.setter(__int128 *a1)
{
  uint64_t v3 = (void *)(v1 + 40);
  sub_1000069A8(v3);
  return sub_100007FD0(a1, (uint64_t)v3);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.titleSpace.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.subtitleSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AB8(v1 + 80, a1);
}

uint64_t TVFlowcaseItemLayout.Metrics.subtitleSpace.setter(__int128 *a1)
{
  uint64_t v3 = (void *)(v1 + 80);
  sub_1000069A8(v3);
  return sub_100007FD0(a1, (uint64_t)v3);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.subtitleSpace.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.textArtworkMargin.setter(__int128 *a1)
{
  uint64_t v3 = (void *)(v1 + 120);
  sub_1000069A8(v3);
  return sub_100007FD0(a1, (uint64_t)v3);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.textArtworkMargin.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.artworkAspectRatio.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL) + 32);
  uint64_t v4 = type metadata accessor for AspectRatio(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t TVFlowcaseItemLayout.Metrics.artworkAspectRatio.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL) + 32);
  uint64_t v4 = type metadata accessor for AspectRatio(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(v3, a1, v4);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.artworkAspectRatio.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.bottomSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  return sub_100008AB8(v1 + *(int *)(v3 + 36), a1);
}

uint64_t TVFlowcaseItemLayout.Metrics.bottomSpace.setter(__int128 *a1)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL) + 36));
  sub_1000069A8(v3);
  return sub_100007FD0(a1, (uint64_t)v3);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.bottomSpace.modify())()
{
  return nullsub_2;
}

__n128 TVFlowcaseItemLayout.Metrics.textLayoutMargins.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL) + 40);
  char v4 = *(_BYTE *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  __int128 v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

uint64_t TVFlowcaseItemLayout.Metrics.textLayoutMargins.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL) + 40);
  return sub_100008A70(a1, v3);
}

uint64_t (*TVFlowcaseItemLayout.Metrics.textLayoutMargins.modify())()
{
  return nullsub_2;
}

uint64_t TVFlowcaseItemLayout.Metrics.init(byCopying:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008E1C(a1, a2, type metadata accessor for TVFlowcaseItemLayout.Metrics);
}

uint64_t sub_100008E1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t TVFlowcaseItemLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout(0LL) + 32);
  return sub_100008878(v3, a1);
}

uint64_t TVFlowcaseItemLayout.metrics.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TVFlowcaseItemLayout(0LL) + 32);
  return sub_100008EC0(a1, v3);
}

uint64_t sub_100008EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t (*TVFlowcaseItemLayout.metrics.modify())()
{
  return nullsub_2;
}

void *TVFlowcaseItemLayout.placeChildren(relativeTo:in:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v7 = v6;
  uint64_t v148 = a2;
  uint64_t v143 = type metadata accessor for VerticalSplitLayout.Position(0LL);
  uint64_t v142 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v145 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v147 = type metadata accessor for VerticalSplitLayout(0LL);
  uint64_t v146 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  v144 = (char *)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_10000614C(&qword_100019648);
  __chkstk_darwin(v15);
  v135 = (char *)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v141 = type metadata accessor for AspectFitLayout(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  v139 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for VerticalStackLayout.ExclusionCondition(0LL);
  uint64_t v131 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v133 = (char *)&v120 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v153 = type metadata accessor for VerticalStackLayout.Child.Alignment(0LL);
  uint64_t v130 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  v132 = (char *)&v120 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v152 = (void (*)(void))type metadata accessor for VerticalStackLayout.Alignment(0LL);
  uint64_t v20 = *((void *)v152 - 1);
  __chkstk_darwin(v152);
  v154 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for VerticalStackLayout(0LL);
  uint64_t v137 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  v136 = (char *)&v120 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = v6 + 5;
  uint64_t v28 = v6[8];
  uint64_t v29 = v6[9];
  sub_100007FE8(v6 + 5, v28);
  dispatch thunk of LayoutTextView.numberOfLines.setter(1LL, v28, v29);
  if (qword_100019288 != -1) {
    swift_once(&qword_100019288, sub_100008348);
  }
  uint64_t v30 = sub_10000614C(&qword_1000196B0);
  sub_1000053B0(v30, (uint64_t)qword_10001A0E8);
  static Dimensions.defaultRoundingRule.getter();
  double v31 = Conditional<>.value(in:rounded:)(a1, v26);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  uint64_t v32 = v6[18];
  uint64_t v33 = v6[19];
  __n128 result = sub_100007FE8(v6 + 15, v32);
  if ((~*(void *)&v31 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v31 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v31 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return result;
  }

  uint64_t v35 = (uint64_t)v6;
  uint64_t v149 = a1;
  dispatch thunk of LayoutTextView.numberOfLines.setter((uint64_t)v31, v32, v33);
  uint64_t v36 = v6[18];
  uint64_t v37 = v6[19];
  sub_100007FE8(v7 + 15, v7[18]);
  LOBYTE(v36) = dispatch thunk of LayoutView.hasContent.getter(v36, *(void *)(v37 + 8));
  uint64_t v38 = v7 + 15;
  uint64_t v39 = v7[13];
  uint64_t v40 = v7[14];
  sub_100007FE8(v7 + 10, v39);
  dispatch thunk of LayoutTextView.numberOfLines.setter(2LL, v39, v40);
  __int128 v129 = v7 + 15;
  if ((v36 & 1) != 0)
  {
    double v151 = a3;
    double v41 = a4;
    uint64_t v42 = v7[13];
    uint64_t v43 = v7[14];
    sub_100007FE8(v7 + 10, v42);
    double v44 = dispatch thunk of Measurable.measurements(fitting:in:)( v149,  v42,  *(void *)(*(void *)(v43 + 8) + 8LL),  a5,  a6);
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    uint64_t v51 = v7[13];
    uint64_t v52 = v7[14];
    sub_100007FE8(v7 + 10, v51);
    if (LayoutTextView.estimatedNumberOfLines(from:)(v51, v52, v44, v46, v48, v50) < 2)
    {
      uint64_t v63 = v7[13];
      uint64_t v64 = v7[14];
      sub_100007FE8(v7 + 10, v63);
      dispatch thunk of LayoutTextView.numberOfLines.setter(1LL, v63, v64);
      uint64_t v53 = v7[18];
      uint64_t v65 = v7[19];
      sub_100007FE8(v38, v53);
      uint64_t v55 = *(void *)(v65 + 8);
      uint64_t v56 = 0LL;
    }

    else
    {
      uint64_t v53 = v7[18];
      uint64_t v54 = v7[19];
      sub_100007FE8(v38, v53);
      uint64_t v55 = *(void *)(v54 + 8);
      uint64_t v56 = 1LL;
    }

    dispatch thunk of LayoutView.isHidden.setter(v56, v53, v55);
    uint64_t v66 = v7[13];
    uint64_t v67 = v7[14];
    sub_100007FE8(v7 + 10, v66);
    LayoutView.withMeasurements(_:)(v162, v66, *(void *)(v67 + 8), v44, v46, v48, v50);
    a4 = v41;
    a3 = v151;
  }

  else
  {
    uint64_t v57 = v7[18];
    uint64_t v58 = v7[19];
    sub_100007FE8(v38, v57);
    dispatch thunk of LayoutView.isHidden.setter(1LL, v57, *(void *)(v58 + 8));
    uint64_t v59 = v7[13];
    uint64_t v60 = v7[14];
    uint64_t v61 = sub_100007FE8(v7 + 10, v59);
    v162[3] = v59;
    v162[4] = *(void *)(v60 + 8);
    uint64_t v62 = sub_100006244(v162);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v59 - 8) + 16LL))(v62, v61, v59);
  }

  (*(void (**)(char *, void, void (*)(void)))(v20 + 104))( v154,  enum case for VerticalStackLayout.Alignment.firstBaseline(_:),  v152);
  uint64_t v68 = sub_10000614C(&qword_1000196B8);
  uint64_t v69 = *(void *)(type metadata accessor for VerticalStackLayout.Child(0LL) - 8);
  uint64_t v126 = *(void *)(v69 + 72);
  uint64_t v70 = *(unsigned __int8 *)(v69 + 80);
  uint64_t v71 = (v70 + 32) & ~v70;
  uint64_t v127 = 2 * v126;
  uint64_t v72 = swift_allocObject(v68, v71 + 3 * v126, v70 | 7);
  uint64_t v128 = v72;
  *(_OWORD *)(v72 + swift_weakDestroy(v0 + 16) = xmmword_100012D00;
  uint64_t v73 = v72 + v71;
  uint64_t v74 = v7[8];
  uint64_t v75 = v7[9];
  v76 = sub_100007FE8(v27, v74);
  uint64_t v159 = v74;
  v160 = *(void **)(v75 + 8);
  v77 = sub_100006244(&v158);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v74 - 8) + 16LL))(v77, v76, v74);
  v150 = (char *)v7 + *(int *)(type metadata accessor for TVFlowcaseItemLayout(0LL) + 32);
  LODWORD(v151) = enum case for VerticalStackLayout.Child.Alignment.left(_:);
  uint64_t v78 = v130;
  v152 = *(void (**)(void))(v130 + 104);
  uint64_t v79 = v132;
  v152(v132);
  v157[0] = _swiftEmptyArrayStorage;
  uint64_t v80 = sub_100006CB0( &qword_1000196C0,  (uint64_t (*)(uint64_t))&type metadata accessor for VerticalStackLayout.ExclusionCondition,  (uint64_t)&protocol conformance descriptor for VerticalStackLayout.ExclusionCondition);
  uint64_t v123 = v80;
  uint64_t v81 = sub_10000614C(&qword_1000196C8);
  unint64_t v82 = sub_10000A054();
  unsigned int v83 = v133;
  uint64_t v124 = v81;
  unint64_t v125 = v82;
  uint64_t v84 = v134;
  dispatch thunk of SetAlgebra.init<A>(_:)(v157, v81, v82, v134, v80);
  uint64_t v120 = v73;
  uint64_t v85 = v150;
  static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)( &v158,  v150,  v79,  v83,  1.0);
  unint64_t v122 = *(void (**)(char *, uint64_t))(v131 + 8);
  v122(v83, v84);
  unint64_t v121 = *(void (**)(char *, uint64_t))(v78 + 8);
  uint64_t v86 = v153;
  v121(v79, v153);
  sub_1000069A8(&v158);
  ((void (*)(char *, void, uint64_t))v152)(v79, LODWORD(v151), v86);
  v158 = _swiftEmptyArrayStorage;
  unint64_t v87 = v82;
  uint64_t v88 = v123;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v158, v81, v87, v84, v123);
  static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)( v162,  v85 + 40,  v79,  v83,  1.0);
  uint64_t v89 = v122;
  v122(v83, v84);
  unint64_t v90 = v121;
  v121(v79, v86);
  uint64_t v130 = v120 + v127;
  uint64_t v131 = v35;
  uint64_t v91 = *(void *)(v35 + 144);
  uint64_t v92 = *(void *)(v35 + 152);
  uint64_t v93 = sub_100007FE8(v129, v91);
  uint64_t v159 = v91;
  v160 = *(void **)(v92 + 8);
  uint64_t v94 = sub_100006244(&v158);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v91 - 8) + 16LL))(v94, v93, v91);
  unint64_t v95 = v150;
  ((void (*)(char *, void, uint64_t))v152)(v79, LODWORD(v151), v86);
  v157[0] = _swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(v157, v124, v125, v84, v88);
  static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)( &v158,  v95 + 80,  v79,  v83,  v31);
  char v96 = v83;
  unint64_t v97 = v95;
  v89(v96, v84);
  v90(v79, v86);
  sub_1000069A8(&v158);
  uint64_t v159 = type metadata accessor for ZeroDimension(0LL);
  v160 = &protocol witness table for ZeroDimension;
  sub_100006244(&v158);
  static ZeroDimension.zero.getter();
  char v98 = v136;
  VerticalStackLayout.init(alignment:spacing:children:)(v154, &v158, v128);
  uint64_t v99 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  char v100 = &v97[*(int *)(v99 + 40)];
  if ((v100[32] & 1) != 0)
  {
    uint64_t v101 = v138;
    uint64_t v159 = v138;
    v160 = &protocol witness table for VerticalStackLayout;
    v161 = &protocol witness table for VerticalStackLayout;
    id v102 = sub_100006244(&v158);
    uint64_t v103 = v137;
    (*(void (**)(void *, char *, uint64_t))(v137 + 16))(v102, v98, v101);
  }

  else
  {
    double v105 = *((double *)v100 + 2);
    double v104 = *((double *)v100 + 3);
    double v107 = *(double *)v100;
    double v106 = *((double *)v100 + 1);
    uint64_t v101 = v138;
    v157[3] = v138;
    v157[4] = &protocol witness table for VerticalStackLayout;
    v157[5] = &protocol witness table for VerticalStackLayout;
    uint64_t v108 = sub_100006244(v157);
    uint64_t v103 = v137;
    (*(void (**)(void *, char *, uint64_t))(v137 + 16))(v108, v98, v101);
    uint64_t v159 = type metadata accessor for InsetLayout(0LL);
    v160 = (void *)sub_100006CB0( &qword_1000196D8,  (uint64_t (*)(uint64_t))&type metadata accessor for InsetLayout,  (uint64_t)&protocol conformance descriptor for InsetLayout);
    v161 = (void *)sub_100006CB0( &qword_1000196E0,  (uint64_t (*)(uint64_t))&type metadata accessor for InsetLayout,  (uint64_t)&protocol conformance descriptor for InsetLayout);
    sub_100006244(&v158);
    InsetLayout.init(sublayout:layoutMargins:)(v157, v107, v106, v105, v104);
  }

  uint64_t v109 = v149;
  sub_100008AB8(v131, (uint64_t)v157);
  uint64_t v110 = &v97[*(int *)(v99 + 32)];
  uint64_t v111 = type metadata accessor for AspectRatio(0LL);
  uint64_t v112 = *(void *)(v111 - 8);
  uint64_t v113 = v135;
  (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v135, v110, v111);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v112 + 56))(v113, 0LL, 1LL, v111);
  uint64_t v114 = v139;
  AspectFitLayout.init(view:aspectRatio:anchorPoint:)(v157, v113, 0.5, 0.0);
  sub_10000A0A0((uint64_t)&v158, (uint64_t)v157);
  uint64_t v115 = v141;
  v156[3] = v141;
  v156[4] = &protocol witness table for AspectFitLayout;
  v156[5] = &protocol witness table for AspectFitLayout;
  uint64_t v116 = sub_100006244(v156);
  uint64_t v117 = v140;
  (*(void (**)(void *, char *, uint64_t))(v140 + 16))(v116, v114, v115);
  uint64_t v118 = v145;
  (*(void (**)(char *, void, uint64_t))(v142 + 104))( v145,  enum case for VerticalSplitLayout.Position.top(_:),  v143);
  sub_100008AB8((uint64_t)(v97 + 120), (uint64_t)v155);
  uint64_t v119 = v144;
  VerticalSplitLayout.init(prioritySublayout:otherSublayout:priorityPosition:spacing:useLastBaseline:)( v157,  v156,  v118,  v155,  0LL);
  VerticalSplitLayout.placeChildren(relativeTo:in:)(v109, a3, a4, a5, a6);
  (*(void (**)(char *, uint64_t))(v146 + 8))(v119, v147);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v114, v115);
  sub_1000069A8(&v158);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v98, v101);
  return (void *)sub_1000069A8(v162);
}

uint64_t sub_100009C28(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10 = sub_100006CB0( &qword_100019838,  type metadata accessor for TVFlowcaseItemLayout,  (uint64_t)&protocol conformance descriptor for TVFlowcaseItemLayout);
  return EstimatedMeasurable<>.measurements(fitting:in:)(a1, a2, v10, a3, a4, a5);
}

uint64_t sub_100009C98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008878(v2 + *(int *)(a1 + 32), a2);
}

double _s25AppStoreTopShelfExtension20TVFlowcaseItemLayoutV21estimatedMeasurements7fitting5using2inSo14JUMeasurementsVSo6CGSizeV_AC7MetricsVSo18UITraitEnvironment_ptFZ_0( uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = type metadata accessor for StackMeasurable.Axis(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for StackMeasurable(0LL);
  uint64_t v31 = *(void *)(v12 - 8);
  uint64_t v32 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100019288 != -1) {
    swift_once(&qword_100019288, sub_100008348);
  }
  uint64_t v19 = sub_10000614C(&qword_1000196B0);
  sub_1000053B0(v19, (uint64_t)qword_10001A0E8);
  static Dimensions.defaultRoundingRule.getter();
  uint64_t v33 = a2;
  double v20 = Conditional<>.value(in:rounded:)(a2, v18);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v21 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v22 = a1 + *(int *)(v21 + 40);
  double v23 = 0.0;
  if ((*(_BYTE *)(v22 + 32) & 1) == 0) {
    double v23 = *(double *)(v22 + 16) + *(double *)v22;
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for StackMeasurable.Axis.vertical(_:), v8);
  uint64_t v24 = sub_10000614C(&qword_100019848);
  uint64_t v25 = swift_allocObject(v24, 312LL, 7LL);
  *(_OWORD *)(v25 + swift_weakDestroy(v0 + 16) = xmmword_100012DB0;
  uint64_t v35 = &type metadata for CGFloat;
  uint64_t v36 = &protocol witness table for CGFloat;
  *(double *)uint64_t v34 = v23;
  uint64_t v26 = type metadata accessor for VerticalSpaceMeasurable(0LL);
  *(void *)(v25 + 56) = v26;
  *(void *)(v25 + 64) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 32));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  sub_100008AB8(a1, (uint64_t)v34);
  *(void *)(v25 + 96) = v26;
  *(void *)(v25 + 104) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 72));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  sub_100008AB8(a1 + 40, (uint64_t)v34);
  *(void *)(v25 + 136) = v26;
  *(void *)(v25 + 144) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 112));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  sub_100008AB8(a1 + 80, (uint64_t)v34);
  *(void *)(v25 + 176) = v26;
  *(void *)(v25 + 184) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 152));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, v20);
  sub_100008AB8(a1 + 120, (uint64_t)v34);
  *(void *)(v25 + 2swift_weakDestroy(v0 + 16) = v26;
  *(void *)(v25 + 224) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 192));
  uint64_t v27 = VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  double v28 = AspectRatio.height(fromWidth:)(v27, a3);
  uint64_t v35 = &type metadata for CGFloat;
  uint64_t v36 = &protocol witness table for CGFloat;
  *(double *)uint64_t v34 = v28;
  *(void *)(v25 + 256) = v26;
  *(void *)(v25 + 264) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 232));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  sub_100008AB8(a1 + *(int *)(v21 + 36), (uint64_t)v34);
  *(void *)(v25 + 296) = v26;
  *(void *)(v25 + 304) = &protocol witness table for VerticalSpaceMeasurable;
  sub_100006244((void *)(v25 + 272));
  VerticalSpaceMeasurable.init(_:multiplier:)(v34, 1.0);
  StackMeasurable.init(axis:skipEmptyChildren:children:)(v11, 1LL, v25);
  double v29 = StackMeasurable.measurements(fitting:in:)(v33, a3, a4);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v32);
  return v29;
}

unint64_t sub_10000A054()
{
  unint64_t result = qword_1000196D0;
  if (!qword_1000196D0)
  {
    uint64_t v1 = sub_1000062CC(&qword_1000196C8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000196D0);
  }

  return result;
}

uint64_t sub_10000A0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A0E4()
{
  return sub_100006CB0( &qword_1000196E8,  type metadata accessor for TVFlowcaseItemLayout,  (uint64_t)&protocol conformance descriptor for TVFlowcaseItemLayout);
}

uint64_t initializeBufferWithCopyOfBuffer for TVFlowcaseItemLayout(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v29 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v29);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    __int128 v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    __int128 v9 = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(v4 + 104) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(v4 + 80, (uint64_t)(a2 + 10));
    __int128 v10 = *((_OWORD *)a2 + 9);
    *(_OWORD *)(v4 + 144) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(v4 + 120, (uint64_t)(a2 + 15));
    uint64_t v11 = *(int *)(a3 + 32);
    uint64_t v12 = (_OWORD *)(v4 + v11);
    uint64_t v13 = (_OWORD *)((char *)a2 + v11);
    __int128 v14 = *(_OWORD *)((char *)v13 + 24);
    *(_OWORD *)(v4 + v11 + 24) = v14;
    (**(void (***)(uint64_t, _OWORD *))(v14 - 8))(v4 + v11, v13);
    __int128 v15 = v13[4];
    v12[4] = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)v12 + 40, (uint64_t)v13 + 40);
    __int128 v16 = *(_OWORD *)((char *)v13 + 104);
    *(_OWORD *)((char *)v12 + 104) = v16;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)(v12 + 5), (uint64_t)(v13 + 5));
    __int128 v17 = v13[9];
    v12[9] = v17;
    (**(void (***)(uint64_t, uint64_t))(v17 - 8))((uint64_t)v12 + 120, (uint64_t)v13 + 120);
    uint64_t v18 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
    uint64_t v19 = v18[8];
    double v20 = (char *)v12 + v19;
    uint64_t v21 = (char *)v13 + v19;
    uint64_t v22 = type metadata accessor for AspectRatio(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16LL))(v20, v21, v22);
    uint64_t v23 = v18[9];
    __int128 v24 = *(_OWORD *)((char *)v13 + v23 + 24);
    *(_OWORD *)((char *)v12 + v23 + 24) = v24;
    (**(void (***)(void))(v24 - 8))();
    uint64_t v25 = v18[10];
    uint64_t v26 = (char *)v12 + v25;
    uint64_t v27 = (char *)v13 + v25;
    __int128 v28 = *((_OWORD *)v27 + 1);
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    *((_OWORD *)v26 + 1) = v28;
    v26[32] = v27[32];
  }

  return v4;
}

uint64_t destroy for TVFlowcaseItemLayout(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)((char *)a1 + *(int *)(a2 + 32));
  sub_1000069A8(v4);
  sub_1000069A8(v4 + 5);
  sub_1000069A8(v4 + 10);
  sub_1000069A8(v4 + 15);
  uint64_t v5 = type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  __int128 v6 = (char *)v4 + *(int *)(v5 + 32);
  uint64_t v7 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  return sub_1000069A8((void *)((char *)v4 + *(int *)(v5 + 36)));
}

_OWORD *initializeWithCopy for TVFlowcaseItemLayout(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  __int128 v7 = a2[4];
  a1[4] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  __int128 v8 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  __int128 v9 = a2[9];
  a1[9] = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (_OWORD *)((char *)a1 + v10);
  uint64_t v12 = (_OWORD *)((char *)a2 + v10);
  __int128 v13 = *(_OWORD *)((char *)v12 + 24);
  *(_OWORD *)((char *)a1 + v10 + 24) = v13;
  (**(void (***)(char *, _OWORD *))(v13 - 8))((char *)a1 + v10, v12);
  __int128 v14 = v12[4];
  v11[4] = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))((uint64_t)v11 + 40, (uint64_t)v12 + 40);
  __int128 v15 = *(_OWORD *)((char *)v12 + 104);
  *(_OWORD *)((char *)v11 + 104) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)(v11 + 5), (uint64_t)(v12 + 5));
  __int128 v16 = v12[9];
  v11[9] = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)v11 + 120, (uint64_t)v12 + 120);
  __int128 v17 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v18 = v17[8];
  uint64_t v19 = (char *)v11 + v18;
  double v20 = (char *)v12 + v18;
  uint64_t v21 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
  uint64_t v22 = v17[9];
  __int128 v23 = *(_OWORD *)((char *)v12 + v22 + 24);
  *(_OWORD *)((char *)v11 + v22 + 24) = v23;
  (**(void (***)(void))(v23 - 8))();
  uint64_t v24 = v17[10];
  uint64_t v25 = (char *)v11 + v24;
  uint64_t v26 = (char *)v12 + v24;
  __int128 v27 = *((_OWORD *)v26 + 1);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *((_OWORD *)v25 + 1) = v27;
  v25[32] = v26[32];
  return a1;
}

void *assignWithCopy for TVFlowcaseItemLayout(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 32);
  __int128 v7 = (void *)((char *)a1 + v6);
  __int128 v8 = (void *)((char *)a2 + v6);
  sub_10000A654((void *)((char *)a1 + v6), v8);
  sub_10000A654(v7 + 5, v8 + 5);
  sub_10000A654(v7 + 10, v8 + 10);
  sub_10000A654(v7 + 15, v8 + 15);
  __int128 v9 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v10 = v9[8];
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = (char *)v8 + v10;
  uint64_t v13 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  sub_10000A654((void *)((char *)v7 + v9[9]), (void *)((char *)v8 + v9[9]));
  uint64_t v14 = v9[10];
  __int128 v15 = (char *)v7 + v14;
  __int128 v16 = (char *)v8 + v14;
  __int128 v17 = *(_OWORD *)v16;
  __int128 v18 = *((_OWORD *)v16 + 1);
  v15[32] = v16[32];
  *(_OWORD *)__int128 v15 = v17;
  *((_OWORD *)v15 + 1) = v18;
  return a1;
}

void *sub_10000A654(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v12 = *result;
        uint64_t v13 = *a2;
        swift_retain(*a2);
        unint64_t result = (void *)swift_release(v12, v14);
        *uint64_t v3 = v13;
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
          uint64_t v16 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v16);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10, v11);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v17, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v15 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v15);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v17, v4);
      }
    }
  }

  return result;
}

uint64_t initializeWithTake for TVFlowcaseItemLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  __int128 v9 = *(_OWORD *)(a2 + v6 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a2 + v6);
  *(_OWORD *)(v7 + swift_weakDestroy(v0 + 16) = v9;
  *(void *)(v7 + 32) = *(void *)(a2 + v6 + 32);
  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a2 + v6 + 40);
  *(_OWORD *)(v7 + 56) = *(_OWORD *)(a2 + v6 + 56);
  *(void *)(v7 + 72) = *(void *)(a2 + v6 + 72);
  __int128 v10 = *(_OWORD *)(a2 + v6 + 80);
  __int128 v11 = *(_OWORD *)(a2 + v6 + 96);
  *(void *)(v7 + 112) = *(void *)(a2 + v6 + 112);
  *(_OWORD *)(v7 + 80) = v10;
  *(_OWORD *)(v7 + 96) = v11;
  __int128 v12 = *(_OWORD *)(a2 + v6 + 120);
  __int128 v13 = *(_OWORD *)(a2 + v6 + 136);
  *(void *)(v7 + 152) = *(void *)(a2 + v6 + 152);
  *(_OWORD *)(v7 + 136) = v13;
  *(_OWORD *)(v7 + 120) = v12;
  uint64_t v14 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v15 = v14[8];
  uint64_t v16 = v7 + v15;
  uint64_t v17 = v8 + v15;
  uint64_t v18 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32LL))(v16, v17, v18);
  uint64_t v19 = v14[9];
  uint64_t v20 = v7 + v19;
  uint64_t v21 = v8 + v19;
  __int128 v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = v22;
  *(void *)(v20 + 32) = *(void *)(v21 + 32);
  uint64_t v23 = v14[10];
  uint64_t v24 = v7 + v23;
  uint64_t v25 = v8 + v23;
  __int128 v26 = *(_OWORD *)(v25 + 16);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = v26;
  *(_BYTE *)(v24 + 32) = *(_BYTE *)(v25 + 32);
  return a1;
}

uint64_t assignWithTake for TVFlowcaseItemLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_1000069A8((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_1000069A8((void *)(a1 + 80));
  __int128 v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  sub_1000069A8((void *)(a1 + 120));
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  sub_1000069A8((void *)(a1 + v8));
  __int128 v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  sub_1000069A8((void *)(v9 + 40));
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v10 + 40);
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
  *(void *)(v9 + 72) = *(void *)(v10 + 72);
  sub_1000069A8((void *)(v9 + 80));
  __int128 v12 = *(_OWORD *)(v10 + 96);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 96) = v12;
  *(void *)(v9 + 112) = *(void *)(v10 + 112);
  sub_1000069A8((void *)(v9 + 120));
  *(_OWORD *)(v9 + 120) = *(_OWORD *)(v10 + 120);
  *(_OWORD *)(v9 + 136) = *(_OWORD *)(v10 + 136);
  *(void *)(v9 + 152) = *(void *)(v10 + 152);
  __int128 v13 = (int *)type metadata accessor for TVFlowcaseItemLayout.Metrics(0LL);
  uint64_t v14 = v13[8];
  uint64_t v15 = v9 + v14;
  uint64_t v16 = v10 + v14;
  uint64_t v17 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40LL))(v15, v16, v17);
  uint64_t v18 = v13[9];
  uint64_t v19 = v9 + v18;
  uint64_t v20 = v10 + v18;
  sub_1000069A8((void *)(v9 + v18));
  __int128 v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = v21;
  *(void *)(v19 + 32) = *(void *)(v20 + 32);
  uint64_t v22 = v13[10];
  uint64_t v23 = v9 + v22;
  uint64_t v24 = v10 + v22;
  *(_BYTE *)(v23 + 32) = *(_BYTE *)(v24 + 32);
  __int128 v25 = *(_OWORD *)(v24 + 16);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *(_OWORD *)(v23 + swift_weakDestroy(v0 + 16) = v25;
  return a1;
}

uint64_t getEnumTagSinglePayload for TVFlowcaseItemLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000AAAC);
}

uint64_t sub_10000AAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B0F0(a1, a2, a3, type metadata accessor for TVFlowcaseItemLayout.Metrics);
}

uint64_t storeEnumTagSinglePayload for TVFlowcaseItemLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000AAC4);
}

uint64_t sub_10000AAC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_10000B184(a1, a2, a3, a4, type metadata accessor for TVFlowcaseItemLayout.Metrics);
}

uint64_t sub_10000AAD0(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = "(";
  v4[2] = "(";
  v4[3] = "(";
  uint64_t result = type metadata accessor for TVFlowcaseItemLayout.Metrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TVFlowcaseItemLayout.Metrics(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v21 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v21);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    __int128 v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    __int128 v9 = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(v4 + 104) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(v4 + 80, (uint64_t)(a2 + 10));
    __int128 v10 = *((_OWORD *)a2 + 9);
    *(_OWORD *)(v4 + 144) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(v4 + 120, (uint64_t)(a2 + 15));
    uint64_t v11 = a3[8];
    uint64_t v12 = v4 + v11;
    uint64_t v13 = (uint64_t)a2 + v11;
    uint64_t v14 = type metadata accessor for AspectRatio(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
    uint64_t v15 = a3[9];
    __int128 v16 = *(_OWORD *)((char *)a2 + v15 + 24);
    *(_OWORD *)(v4 + v15 + 24) = v16;
    (**(void (***)(void))(v16 - 8))();
    uint64_t v17 = a3[10];
    uint64_t v18 = v4 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    __int128 v20 = *(_OWORD *)(v19 + 16);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *(_OWORD *)(v18 + swift_weakDestroy(v0 + 16) = v20;
    *(_BYTE *)(v18 + 32) = *(_BYTE *)(v19 + 32);
  }

  return v4;
}

uint64_t destroy for TVFlowcaseItemLayout.Metrics(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  return sub_1000069A8((void *)((char *)a1 + *(int *)(a2 + 36)));
}

_OWORD *initializeWithCopy for TVFlowcaseItemLayout.Metrics(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  __int128 v7 = a2[4];
  a1[4] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  __int128 v8 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  __int128 v9 = a2[9];
  a1[9] = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
  uint64_t v14 = a3[9];
  __int128 v15 = *(_OWORD *)((char *)a2 + v14 + 24);
  *(_OWORD *)((char *)a1 + v14 + 24) = v15;
  (**(void (***)(void))(v15 - 8))();
  uint64_t v16 = a3[10];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  __int128 v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  v17[32] = v18[32];
  return a1;
}

void *assignWithCopy for TVFlowcaseItemLayout.Metrics(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a3[8];
  __int128 v7 = (char *)a1 + v6;
  __int128 v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24LL))(v7, v8, v9);
  sub_10000A654((void *)((char *)a1 + a3[9]), (void *)((char *)a2 + a3[9]));
  uint64_t v10 = a3[10];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  __int128 v13 = *(_OWORD *)v12;
  __int128 v14 = *((_OWORD *)v12 + 1);
  v11[32] = v12[32];
  *(_OWORD *)uint64_t v11 = v13;
  *((_OWORD *)v11 + 1) = v14;
  return a1;
}

uint64_t initializeWithTake for TVFlowcaseItemLayout.Metrics(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __int128 v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v11 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  __int128 v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = v16;
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  __int128 v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = v19;
  *(_BYTE *)(v17 + 32) = *(_BYTE *)(v18 + 32);
  return a1;
}

uint64_t assignWithTake for TVFlowcaseItemLayout.Metrics(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_1000069A8((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_1000069A8((void *)(a1 + 80));
  __int128 v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  sub_1000069A8((void *)(a1 + 120));
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for AspectRatio(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  sub_1000069A8((void *)(a1 + v12));
  __int128 v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + swift_weakDestroy(v0 + 16) = v15;
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  __int128 v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = v19;
  *(_BYTE *)(v17 + 32) = *(_BYTE *)(v18 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVFlowcaseItemLayout.Metrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B0E4);
}

uint64_t sub_10000B0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B0F0(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for AspectRatio);
}

uint64_t sub_10000B0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 24);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }

  else
  {
    uint64_t v9 = a4(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48LL))( a1 + *(int *)(a3 + 32),  a2,  v9);
  }

uint64_t storeEnumTagSinglePayload for TVFlowcaseItemLayout.Metrics( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B178);
}

uint64_t sub_10000B178(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_10000B184(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for AspectRatio);
}

uint64_t sub_10000B184(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v8 = a5(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))( v6 + *(int *)(a4 + 32),  a2,  a2,  v8);
  }

  return result;
}

uint64_t sub_10000B1F8(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = "(";
  v4[2] = "(";
  v4[3] = "(";
  uint64_t result = type metadata accessor for AspectRatio(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    void v4[5] = "(";
    v4[6] = "!";
    swift_initStructMetadata(a1, 256LL, 7LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_10000B288()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  sub_100006A0C(v0, qword_10001A100);
  sub_1000053B0(v0, (uint64_t)qword_10001A100);
  return OSLogger.Subsystem.init(rawValue:)(0xD00000000000002ELL, 0x8000000100011ED0LL);
}

uint64_t sub_10000B2E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for StoreTab.Identifier(0LL);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  __int128 v7 = (char *)&v28 - v6;
  uint64_t v8 = type metadata accessor for StoreTab(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = ASKBagContract.tabs.getter(v10);
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 + 16);
  if (v15)
  {
    uint64_t v29 = v13;
    uint64_t v30 = a1;
    uint64_t v16 = v9;
    unint64_t v17 = v13 + ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    unsigned int v34 = enum case for StoreTab.Identifier.discover(_:);
    uint64_t v31 = *(void *)(v16 + 72);
    uint64_t v32 = v8;
    uint64_t v35 = v16;
    uint64_t v33 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v16 + 16);
    while (1)
    {
      uint64_t v18 = v33(v12, v17, v8);
      StoreTab.identifier.getter(v18);
      uint64_t v19 = v36;
      (*(void (**)(char *, void, uint64_t))(v36 + 104))(v5, v34, v2);
      unint64_t v20 = sub_10000B58C();
      dispatch thunk of RawRepresentable.rawValue.getter(&v40, v2, v20);
      dispatch thunk of RawRepresentable.rawValue.getter(&v38, v2, v20);
      uint64_t v21 = v41;
      uint64_t v22 = v39;
      if (v40 == v38 && v41 == v39) {
        break;
      }
      int v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, v38, v39, 0LL);
      swift_bridgeObjectRelease(v21);
      swift_bridgeObjectRelease(v22);
      uint64_t v24 = *(void (**)(char *, uint64_t))(v19 + 8);
      v24(v5, v2);
      v24(v7, v2);
      if ((v37 & 1) != 0) {
        goto LABEL_12;
      }
      uint64_t v8 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v32);
      v17 += v31;
      if (!--v15)
      {
        uint64_t v25 = 1LL;
        uint64_t v14 = v29;
        a1 = v30;
        uint64_t v9 = v35;
        goto LABEL_13;
      }
    }

    swift_bridgeObjectRelease_n(v41, 2LL);
    __int128 v26 = *(void (**)(char *, uint64_t))(v19 + 8);
    v26(v5, v2);
    v26(v7, v2);
LABEL_12:
    uint64_t v9 = v35;
    a1 = v30;
    uint64_t v8 = v32;
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v30, v12, v32);
    uint64_t v25 = 0LL;
    uint64_t v14 = v29;
  }

  else
  {
    uint64_t v25 = 1LL;
  }

LABEL_13:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v25, 1LL, v8);
  return swift_bridgeObjectRelease(v14);
}

unint64_t sub_10000B58C()
{
  unint64_t result = qword_1000194E8;
  if (!qword_1000194E8)
  {
    uint64_t v1 = type metadata accessor for StoreTab.Identifier(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StoreTab.Identifier, v1);
    atomic_store(result, (unint64_t *)&qword_1000194E8);
  }

  return result;
}

uint64_t sub_10000B5D4()
{
  uint64_t v0 = type metadata accessor for OSLogger(0LL);
  uint64_t v57 = *(void *)(v0 - 8);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v56 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v56 - v3;
  uint64_t v5 = type metadata accessor for TopShelf.Style(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v56 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v56 - v14;
  uint64_t v16 = TopShelf.items.getter(v13);
  uint64_t v17 = (uint64_t)sub_10000BCEC(v16);
  uint64_t v18 = swift_bridgeObjectRelease(v16);
  TopShelf.style.getter(v18);
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v15, v5);
  if ((_DWORD)v19 == enum case for TopShelf.Style.inset(_:))
  {
    if (qword_100019270 != -1) {
      swift_once(&qword_100019270, sub_1000025EC);
    }
    uint64_t v20 = sub_1000053B0(v0, (uint64_t)qword_10001A0A0);
    uint64_t v21 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v4, v20, v0);
    uint64_t v22 = sub_10000614C(&qword_100019430);
    uint64_t v23 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v24 = swift_allocObject( v22,  ((*(unsigned __int8 *)(v23 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))
          + 3LL * *(void *)(v23 + 72),
            *(unsigned __int8 *)(v23 + 80) | 7LL);
    *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = xmmword_100012D00;
    LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100011F60LL);
    if ((unint64_t)v17 >> 62)
    {
      if (v17 < 0) {
        uint64_t v53 = v17;
      }
      else {
        uint64_t v53 = v17 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v17);
      uint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v53);
      swift_bridgeObjectRelease(v17);
    }

    else
    {
      uint64_t v25 = *(void *)((v17 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v60 = &type metadata for Int;
    uint64_t v58 = v25;
    static LogMessage.safe(_:)(&v58);
    sub_100006AB8((uint64_t)&v58, &qword_100019438);
    LogMessage.init(stringLiteral:)(0x2E2973286D657469LL, 0xE800000000000000LL);
    Logger.info(_:)(v24, v0, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v0);
    id v26 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfInsetContent);
    sub_10000E8F0(0LL, &qword_100019860, &OBJC_CLASS___TVTopShelfItem_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v17);
    id v28 = [v26 initWithItems:isa];
  }

  else
  {
    uint64_t v29 = enum case for TopShelf.Style.carouselActions(_:);
    if ((_DWORD)v19 != enum case for TopShelf.Style.carouselActions(_:)
      && (_DWORD)v19 != enum case for TopShelf.Style.carouselDetails(_:))
    {
      uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v5, v5);
      __break(1u);
      return result;
    }

    TopShelf.style.getter(v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 104))(v9, v29, v5);
    unint64_t v31 = sub_10000BE10();
    dispatch thunk of RawRepresentable.rawValue.getter(&v58, v5, v31);
    dispatch thunk of RawRepresentable.rawValue.getter(&v61, v5, v31);
    unint64_t v32 = v59;
    uint64_t v33 = v62;
    if (v58 == v61 && v59 == v62)
    {
      swift_bridgeObjectRelease_n(v59, 2LL);
      uint64_t v34 = 0LL;
    }

    else
    {
      int v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v58, v59, v61, v62, 0LL);
      swift_bridgeObjectRelease(v32);
      swift_bridgeObjectRelease(v33);
      uint64_t v34 = ~v35 & 1LL;
    }

    uint64_t v36 = v56;
    int v37 = *(void (**)(char *, uint64_t))(v6 + 8);
    v37(v9, v5);
    v37(v12, v5);
    uint64_t v38 = (uint64_t)sub_10000BE58(v17);
    swift_bridgeObjectRelease(v17);
    id v39 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselContent);
    sub_10000E8F0(0LL, &qword_100019858, &OBJC_CLASS___TVTopShelfCarouselItem_ptr);
    swift_bridgeObjectRetain(v38);
    Class v40 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v38);
    id v28 = [v39 initWithStyle:v34 items:v40];

    uint64_t v41 = (void *)TopShelf.promotionItem.getter();
    if (v41)
    {
      uint64_t v42 = (void *)sub_10000C030();
      swift_release(v41, v43);
      uint64_t v44 = objc_opt_self(&OBJC_CLASS___TVTopShelfPromotionCarouselItem);
      uint64_t v41 = (void *)swift_dynamicCastObjCClass(v42, v44);
      uint64_t v45 = v57;
      if (!v41) {
    }
      }

    else
    {
      uint64_t v45 = v57;
    }

    [v28 _setPromotionItem:v41];

    if (qword_100019270 != -1) {
      swift_once(&qword_100019270, sub_1000025EC);
    }
    uint64_t v46 = sub_1000053B0(v0, (uint64_t)qword_10001A0A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v36, v46, v0);
    uint64_t v47 = sub_10000614C(&qword_100019430);
    uint64_t v48 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v49 = swift_allocObject( v47,  ((*(unsigned __int8 *)(v48 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))
          + 5LL * *(void *)(v48 + 72),
            *(unsigned __int8 *)(v48 + 80) | 7LL);
    *(_OWORD *)(v49 + swift_weakDestroy(v0 + 16) = xmmword_100012F20;
    LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x8000000100011F00LL);
    id v50 = [v28 _promotionItem];

    uint64_t v51 = 48LL;
    if (v50) {
      uint64_t v51 = 49LL;
    }
    uint64_t v60 = &type metadata for String;
    uint64_t v58 = v51;
    unint64_t v59 = 0xE100000000000000LL;
    static LogMessage.safe(_:)(&v58);
    sub_100006AB8((uint64_t)&v58, &qword_100019438);
    LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x8000000100011F20LL);
    if ((unint64_t)v38 >> 62)
    {
      if (v38 < 0) {
        uint64_t v54 = v38;
      }
      else {
        uint64_t v54 = v38 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v38);
      uint64_t v52 = _CocoaArrayWrapper.endIndex.getter(v54);
      swift_bridgeObjectRelease(v38);
    }

    else
    {
      uint64_t v52 = *(void *)((v38 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    swift_bridgeObjectRelease(v38);
    uint64_t v60 = &type metadata for Int;
    uint64_t v58 = v52;
    static LogMessage.safe(_:)(&v58);
    sub_100006AB8((uint64_t)&v58, &qword_100019438);
    LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100011F40LL);
    Logger.info(_:)(v49, v0, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v49);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v36, v0);
  }

  return (uint64_t)v28;
}

void *sub_10000BCEC(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v11 = a1;
    }
    else {
      uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v4 = 0LL;
      do
      {
        if ((a1 & 0xC000000000000001LL) != 0)
        {
          uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
        }

        else
        {
          uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
          swift_retain(v5);
        }

        ++v4;
        uint64_t v6 = sub_10000C030();
        uint64_t v8 = swift_release(v5, v7);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v8);
        uint64_t v9 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
        uint64_t v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v6);
        specialized ContiguousArray._endMutation()(v10);
      }

      while (v2 != v4);
      return _swiftEmptyArrayStorage;
    }
  }

  return result;
}

unint64_t sub_10000BE10()
{
  unint64_t result = qword_100019850;
  if (!qword_100019850)
  {
    uint64_t v1 = type metadata accessor for TopShelf.Style(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for TopShelf.Style, v1);
    atomic_store(result, (unint64_t *)&qword_100019850);
  }

  return result;
}

void *sub_10000BE58(uint64_t a1)
{
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t result = (void *)swift_bridgeObjectRetain(a1);
    if (v2) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease(a1);
    return &_swiftEmptyArrayStorage;
  }

  if (a1 < 0) {
    uint64_t v20 = a1;
  }
  else {
    uint64_t v20 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  unint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v20);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_3:
  if (v2 >= 1)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        uint64_t v6 = objc_opt_self(&OBJC_CLASS___TVTopShelfCarouselItem);
        uint64_t v7 = swift_dynamicCastObjCClass(v5, v6);
        if (v7)
        {
          uint64_t v8 = v7;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v7);
          unint64_t v10 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v9 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v10 >= v9 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v9 > 1, v10 + 1, 1LL);
          }
          uint64_t v11 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v8);
          specialized Array._endMutation()(v11);
        }

        else
        {
          swift_unknownObjectRelease(v5);
        }
      }
    }

    else
    {
      for (uint64_t j = 0LL; j != v2; ++j)
      {
        uint64_t v14 = *(void **)(a1 + 8 * j + 32);
        uint64_t v15 = objc_opt_self(&OBJC_CLASS___TVTopShelfCarouselItem);
        uint64_t v16 = swift_dynamicCastObjCClass(v14, v15);
        if (v16)
        {
          uint64_t v17 = v16;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v14);
          unint64_t v19 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v18 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v19 >= v18 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1LL);
          }
          uint64_t v13 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v17);
          specialized Array._endMutation()(v13);
        }
      }
    }

    goto LABEL_22;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000C030()
{
  uint64_t v1 = v0;
  uint64_t v258 = type metadata accessor for TopShelfInsetItem.TintStyle(0LL);
  uint64_t v260 = *(void *)(v258 - 8);
  __chkstk_darwin(v258);
  v261 = (char *)&v257 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v267 = type metadata accessor for TopShelfPromotionItem.TintStyle(0LL);
  uint64_t v265 = *(void *)(v267 - 8);
  __chkstk_darwin(v267);
  v266 = (char *)&v257 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v276 = type metadata accessor for ControllerRequirement(0LL);
  v279 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v276 - 8);
  uint64_t v4 = __chkstk_darwin(v276);
  v268 = (char *)&v257 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  v274 = (char *)&v257 - v6;
  uint64_t v7 = sub_10000614C(&qword_100019440);
  uint64_t v8 = __chkstk_darwin(v7);
  v273 = (char *)&v257 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  v275 = (char *)&v257 - v10;
  uint64_t v11 = sub_10000614C(&qword_100019868);
  __chkstk_darwin(v11);
  v278 = (char *)&v257 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_10000614C(&qword_1000194D8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v259 = (uint64_t)&v257 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v14);
  v264 = (char *)&v257 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v257 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)&v257 - v22);
  uint64_t v24 = __chkstk_darwin(v21);
  id v26 = (char *)&v257 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v257 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  v272 = (char *)&v257 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v271 = (char *)&v257 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v270 = (char *)&v257 - v35;
  __chkstk_darwin(v34);
  uint64_t v269 = (uint64_t)&v257 - v36;
  uint64_t v277 = type metadata accessor for URL(0LL);
  uint64_t v280 = *(void *)(v277 - 8);
  uint64_t v37 = __chkstk_darwin(v277);
  id v39 = (char *)&v257 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = __chkstk_darwin(v37);
  uint64_t v42 = (char *)&v257 - v41;
  uint64_t v43 = __chkstk_darwin(v40);
  uint64_t v45 = (char *)&v257 - v44;
  uint64_t v46 = __chkstk_darwin(v43);
  uint64_t v48 = (char *)&v257 - v47;
  uint64_t v49 = __chkstk_darwin(v46);
  v263 = (char *)&v257 - v50;
  __chkstk_darwin(v49);
  v262 = (char *)&v257 - v51;
  uint64_t v52 = type metadata accessor for TopShelfCarouselItem(0LL);
  uint64_t v53 = swift_dynamicCastClass(v1, v52);
  uint64_t v281 = v1;
  if (!v53)
  {
    v273 = v45;
    v274 = v48;
    v275 = v29;
    uint64_t v276 = (uint64_t)v42;
    v279 = v23;
    uint64_t v75 = type metadata accessor for TopShelfPromotionItem();
    uint64_t v76 = swift_dynamicCastClass(v1, v75);
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = swift_retain(v1);
      TopShelfItem.identifier.getter(v78);
      uint64_t v80 = v79;
      id v81 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfPromotionCarouselItem);
      NSString v82 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v80);
      id v83 = [v81 initWithIdentifier:v82];

      sub_10000DF10(v83);
      uint64_t v85 = TopShelfItem.image.getter(v84);
      uint64_t v86 = v77;
      if (v85)
      {
        uint64_t v87 = v85;
        uint64_t v88 = type metadata accessor for Artwork.Crop(0LL);
        uint64_t v89 = (uint64_t)v278;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56LL))(v278, 1LL, 1LL, v88);
        uint64_t v90 = (uint64_t)v275;
        sub_10000E11C(1LL, v89, 0LL, (uint64_t)v275, 1920.0, 1080.0);
        swift_release(v87, v91);
        sub_100006AB8(v89, &qword_100019868);
        uint64_t v92 = v277;
        int v93 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v280 + 48))(v90, 1LL, v277);
        uint64_t v94 = v276;
        if (v93 != 1)
        {
          uint64_t v95 = v280;
          char v96 = v274;
          (*(void (**)(char *, uint64_t, uint64_t))(v280 + 32))(v274, v90, v92);
          URL._bridgeToObjectiveC()(v97);
          uint64_t v99 = v98;
          [v83 setImageURL:v98 forTraits:1];

          uint64_t v100 = (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v96, v92);
          goto LABEL_45;
        }
      }

      else
      {
        uint64_t v90 = (uint64_t)v275;
        uint64_t v92 = v277;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v280 + 56))(v275, 1LL, 1LL, v277);
        uint64_t v94 = v276;
      }

      uint64_t v100 = sub_100006AB8(v90, &qword_1000194D8);
LABEL_45:
      uint64_t v168 = TopShelfItem.image.getter(v100);
      v169 = v20;
      if (v168)
      {
        uint64_t v170 = v168;
        uint64_t v171 = type metadata accessor for Artwork.Crop(0LL);
        uint64_t v172 = (uint64_t)v278;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v171 - 8) + 56LL))(v278, 1LL, 1LL, v171);
        uint64_t v173 = (uint64_t)v279;
        sub_10000E11C(2LL, v172, 0LL, (uint64_t)v279, 1920.0, 1080.0);
        swift_release(v170, v174);
        sub_100006AB8(v172, &qword_100019868);
        uint64_t v175 = v280;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v280 + 48))(v173, 1LL, v92) != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v175 + 32))(v94, v173, v92);
          URL._bridgeToObjectiveC()(v176);
          v178 = v177;
          [v83 setImageURL:v177 forTraits:2];

          (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v94, v92);
LABEL_50:
          uint64_t v179 = v281;
          swift_retain(v281);
          id v180 = v83;
          TopShelfItem.title.getter(v180);
          unint64_t v182 = v181;
          swift_release(v179, v181);
          if (v182) {
            unint64_t v183 = v182;
          }
          else {
            unint64_t v183 = 0xE000000000000000LL;
          }
          NSString v184 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v183);
          [v180 setTitle:v184];

          TopShelfPromotionItem.promotionText.getter();
          if (v185)
          {
            uint64_t v186 = v185;
            NSString v187 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v186);
          }

          else
          {
            NSString v187 = 0LL;
          }

          [v180 setPromotionText:v187];

          id v188 = v180;
          TopShelfPromotionItem.contextTitle.getter();
          if (v189)
          {
            uint64_t v190 = v189;
            NSString v191 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v190);
          }

          else
          {
            NSString v191 = 0LL;
          }

          [v188 setContextTitle:v191];

          TopShelfPromotionItem.promotionImageName.getter();
          if (v192)
          {
            uint64_t v193 = v192;
            NSString v194 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v193);
          }

          else
          {
            NSString v194 = 0LL;
          }

          [v188 setPromotionImageName:v194];

          id v195 = v188;
          TopShelfPromotionItem.contextImageName.getter();
          if (v196)
          {
            uint64_t v197 = v196;
            NSString v198 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v197);
          }

          else
          {
            NSString v198 = 0LL;
          }

          objc_msgSend(v195, "set_contextImageName:", v198);

          id v199 = v195;
          TopShelfPromotionItem.previewVideoUrl.getter();
          v200 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v175 + 48);
          if (v200(v169, 1LL, v92) == 1)
          {
            v202 = 0LL;
          }

          else
          {
            URL._bridgeToObjectiveC()(v201);
            v202 = v203;
            (*(void (**)(char *, uint64_t))(v175 + 8))(v169, v92);
          }

          [v199 setPreviewVideoURL:v202];

          id v204 = v199;
          v205 = v264;
          TopShelfPromotionItem.cinemagraphUrl.getter();
          if (v200(v205, 1LL, v92) == 1)
          {
            v207 = 0LL;
          }

          else
          {
            URL._bridgeToObjectiveC()(v206);
            v207 = v208;
            (*(void (**)(char *, uint64_t))(v175 + 8))(v205, v92);
          }

          uint64_t v210 = v265;
          v209 = v266;
          [v204 setCinemagraphURL:v207];

          id v154 = v204;
          TopShelfPromotionItem.termsAndConditionsText.getter();
          if (v211)
          {
            uint64_t v212 = v211;
            NSString v213 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v212);
          }

          else
          {
            NSString v213 = 0LL;
          }

          [v154 _setTermsAndConditionsText:v213];

          uint64_t v145 = v86;
          TopShelfPromotionItem.promotionHeadingTintStyle.getter();
          uint64_t v214 = v267;
          int v215 = (*(uint64_t (**)(char *, uint64_t))(v210 + 88))(v209, v267);
          if (v215 == enum case for TopShelfPromotionItem.TintStyle.light(_:))
          {
            [v154 setPromotionTitleTintColor:0];
LABEL_113:
            swift_release(v281, v216);
            return (uint64_t)v154;
          }

          if (v215 == enum case for TopShelfPromotionItem.TintStyle.dark(_:))
          {
            [v154 setPromotionTitleTintColor:1];
            goto LABEL_113;
          }

LABEL_115:
          _diagnoseUnexpectedEnumCase<A>(type:)(v214, v214);
          __break(1u);
          goto LABEL_116;
        }
      }

      else
      {
        uint64_t v173 = (uint64_t)v279;
        uint64_t v175 = v280;
        (*(void (**)(unsigned int (**)(uint64_t, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v280 + 56))( v279,  1LL,  1LL,  v92);
      }

      sub_100006AB8(v173, &qword_1000194D8);
      goto LABEL_50;
    }

    ((void (*)(void))TopShelfItem.identifier.getter)();
    uint64_t v151 = v150;
    id v152 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfItem);
    NSString v153 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v151);
    id v154 = [v152 initWithIdentifier:v153];

    sub_10000DF10(v154);
    uint64_t v155 = ((uint64_t (*)(void))TopShelfItem.image.getter)();
    if (v155)
    {
      uint64_t v156 = v155;
      uint64_t v157 = type metadata accessor for Artwork.Crop(0LL);
      uint64_t v158 = (uint64_t)v278;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v157 - 8) + 56LL))(v278, 1LL, 1LL, v157);
      sub_10000E11C(1LL, v158, 1LL, (uint64_t)v26, 1740.0, 620.0);
      swift_release(v156, v159);
      sub_100006AB8(v158, &qword_100019868);
      uint64_t v160 = v280;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v280 + 48))(v26, 1LL, v277) != 1)
      {
        v161 = v273;
        v162 = v26;
        uint64_t v163 = v277;
        (*(void (**)(char *, char *, uint64_t))(v160 + 32))(v273, v162, v277);
        URL._bridgeToObjectiveC()(v164);
        v166 = v165;
        [v154 setImageURL:v165 forTraits:1];

        uint64_t v167 = (*(uint64_t (**)(char *, uint64_t))(v160 + 8))(v161, v163);
        goto LABEL_82;
      }
    }

    else
    {
      uint64_t v160 = v280;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v280 + 56))(v26, 1LL, 1LL, v277);
    }

    uint64_t v167 = sub_100006AB8((uint64_t)v26, &qword_1000194D8);
    uint64_t v163 = v277;
LABEL_82:
    uint64_t v217 = TopShelfItem.image.getter(v167);
    if (v217)
    {
      uint64_t v218 = v217;
      uint64_t v219 = type metadata accessor for Artwork.Crop(0LL);
      uint64_t v220 = (uint64_t)v278;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v219 - 8) + 56LL))(v278, 1LL, 1LL, v219);
      uint64_t v221 = v259;
      sub_10000E11C(2LL, v220, 1LL, v259, 1740.0, 620.0);
      swift_release(v218, v222);
      sub_100006AB8(v220, &qword_100019868);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v160 + 48))(v221, 1LL, v163) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v160 + 32))(v39, v221, v163);
        URL._bridgeToObjectiveC()(v223);
        v225 = v224;
        [v154 setImageURL:v224 forTraits:2];

        (*(void (**)(char *, uint64_t))(v160 + 8))(v39, v163);
        goto LABEL_87;
      }
    }

    else
    {
      uint64_t v221 = v259;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v160 + 56))(v259, 1LL, 1LL, v163);
    }

    sub_100006AB8(v221, &qword_1000194D8);
LABEL_87:
    uint64_t v226 = v260;
    v227 = v261;
    uint64_t v228 = type metadata accessor for TopShelfInsetItem(0LL);
    uint64_t v229 = swift_dynamicCastClass(v281, v228);
    if (!v229) {
      return (uint64_t)v154;
    }
    uint64_t v145 = v229;
    id v230 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfInsetItemTextOverlay);
    swift_retain(v281);
    id v231 = [v230 init];
    [v154 _setInsetItemTextOverlay:v231];

    id v232 = [v154 _insetItemTextOverlay];
    if (v232)
    {
      v233 = v232;
      TopShelfInsetItem.heading.getter();
      if (v234) {
        unint64_t v235 = v234;
      }
      else {
        unint64_t v235 = 0xE000000000000000LL;
      }
      NSString v236 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v235);
      [v233 setHeading:v236];
    }

    id v237 = [v154 _insetItemTextOverlay];
    if (v237)
    {
      v238 = v237;
      uint64_t v239 = v281;
      uint64_t v240 = swift_retain(v281);
      TopShelfItem.title.getter(v240);
      unint64_t v242 = v241;
      swift_release(v239, v241);
      if (v242) {
        unint64_t v243 = v242;
      }
      else {
        unint64_t v243 = 0xE000000000000000LL;
      }
      NSString v244 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v243);
      [v238 setTitle:v244];
    }

    id v245 = [v154 _insetItemTextOverlay];
    if (v245)
    {
      v246 = v245;
      TopShelfInsetItem.subheading.getter();
      if (v247) {
        unint64_t v248 = v247;
      }
      else {
        unint64_t v248 = 0xE000000000000000LL;
      }
      NSString v249 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v248);
      [v246 setSubheading:v249];
    }

    TopShelfInsetItem.tintStyle.getter();
    uint64_t v214 = v258;
    int v250 = (*(uint64_t (**)(char *, uint64_t))(v226 + 88))(v227, v258);
    if (v250 == enum case for TopShelfInsetItem.TintStyle.light(_:))
    {
      v251 = (objc_class *)[v154 _insetItemTextOverlay];
      if (!v251) {
        goto LABEL_113;
      }
      Class isa = v251;
      -[objc_class setTintColor:](v251, "setTintColor:", 0LL);
    }

    else
    {
      v253 = (objc_class *)[v154 _insetItemTextOverlay];
      if (!v253) {
        goto LABEL_113;
      }
      Class isa = v253;
      -[objc_class setTintColor:](v253, "setTintColor:", 1LL);
    }

LABEL_112:
    goto LABEL_113;
  }

  uint64_t v54 = swift_retain(v1);
  TopShelfItem.identifier.getter(v54);
  uint64_t v56 = v55;
  id v57 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAppStoreCarouselItem);
  NSString v58 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v56);
  id v59 = [v57 initWithIdentifier:v58];

  sub_10000DF10(v59);
  uint64_t v61 = TopShelfItem.image.getter(v60);
  if (v61)
  {
    uint64_t v62 = type metadata accessor for Artwork.Crop(0LL);
    uint64_t v63 = (uint64_t)v278;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56LL))(v278, 1LL, 1LL, v62);
    uint64_t v64 = v269;
    sub_10000E11C(1LL, v63, 0LL, v269, 1920.0, 1080.0);
    swift_release(v61, v65);
    sub_100006AB8(v63, &qword_100019868);
    uint64_t v66 = v280;
    uint64_t v67 = v277;
    int v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v280 + 48))(v64, 1LL, v277);
    uint64_t v69 = (uint64_t)v270;
    if (v68 != 1)
    {
      uint64_t v70 = v262;
      (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v262, v64, v67);
      URL._bridgeToObjectiveC()(v71);
      uint64_t v73 = v72;
      [v59 setImageURL:v72 forTraits:1];

      uint64_t v74 = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v70, v67);
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v66 = v280;
    uint64_t v64 = v269;
    uint64_t v67 = v277;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v280 + 56))(v269, 1LL, 1LL, v277);
    uint64_t v69 = (uint64_t)v270;
  }

  uint64_t v74 = sub_100006AB8(v64, &qword_1000194D8);
LABEL_11:
  uint64_t v101 = v272;
  uint64_t v102 = TopShelfItem.image.getter(v74);
  if (!v102)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v69, 1LL, 1LL, v67);
    goto LABEL_15;
  }

  uint64_t v103 = v102;
  uint64_t v104 = type metadata accessor for Artwork.Crop(0LL);
  uint64_t v105 = (uint64_t)v278;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56LL))(v278, 1LL, 1LL, v104);
  sub_10000E11C(2LL, v105, 0LL, v69, 1920.0, 1080.0);
  swift_release(v103, v106);
  sub_100006AB8(v105, &qword_100019868);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v69, 1LL, v67) == 1)
  {
LABEL_15:
    sub_100006AB8(v69, &qword_1000194D8);
    goto LABEL_16;
  }

  double v107 = v263;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v263, v69, v67);
  URL._bridgeToObjectiveC()(v108);
  uint64_t v110 = v109;
  [v59 setImageURL:v109 forTraits:2];

  (*(void (**)(char *, uint64_t))(v66 + 8))(v107, v67);
LABEL_16:
  uint64_t v111 = v281;
  swift_retain(v281);
  id v112 = v59;
  TopShelfItem.title.getter(v112);
  unint64_t v114 = v113;
  swift_release(v111, v113);
  if (v114) {
    unint64_t v115 = v114;
  }
  else {
    unint64_t v115 = 0xE000000000000000LL;
  }
  NSString v116 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v115);
  [v112 setTitle:v116];

  id v117 = v112;
  TopShelfCarouselItem.genre.getter();
  uint64_t v119 = (uint64_t)v273;
  if (v118)
  {
    uint64_t v120 = v118;
    NSString v121 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v120);
  }

  else
  {
    NSString v121 = 0LL;
  }

  [v117 setGenre:v121];

  id v122 = v117;
  TopShelfCarouselItem.summary.getter();
  if (v123)
  {
    uint64_t v124 = v123;
    NSString v125 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v124);
  }

  else
  {
    NSString v125 = 0LL;
  }

  [v122 setSummary:v125];

  id v126 = v122;
  uint64_t v127 = v271;
  TopShelfCarouselItem.previewVideoUrl.getter();
  uint64_t v128 = v127;
  __int128 v129 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48);
  if (v129(v128, 1LL, v67) == 1)
  {
    uint64_t v131 = 0LL;
  }

  else
  {
    uint64_t v132 = v66;
    v133 = v128;
    URL._bridgeToObjectiveC()(v130);
    uint64_t v131 = v134;
    (*(void (**)(char *, uint64_t))(v132 + 8))(v133, v67);
  }

  [v126 setPreviewVideoURL:v131];

  id v135 = v126;
  TopShelfCarouselItem.cinemagraphUrl.getter();
  if (v129(v101, 1LL, v67) == 1)
  {
    uint64_t v137 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v136);
    uint64_t v137 = v138;
    (*(void (**)(char *, uint64_t))(v280 + 8))(v101, v67);
  }

  v139 = v274;
  [v135 setCinemagraphURL:v137];

  uint64_t v140 = TopShelfCarouselItem.installAction.getter();
  if (v140)
  {
    uint64_t v141 = v140;
    uint64_t v142 = (void *)sub_10000DB70();
    swift_release(v141, v143);
  }

  else
  {
    uint64_t v142 = 0LL;
  }

  [v135 setInstallApplicationAction:v142];

  uint64_t v144 = (uint64_t)v275;
  TopShelfCarouselItem.remoteControllerRequirement.getter();
  sub_100006C6C(v144, v119, &qword_100019440);
  uint64_t v145 = v276;
  if (v279[6](v119, 1LL, v276) == 1)
  {
    sub_100006AB8(v119, &qword_100019440);
    uint64_t v146 = 0LL;
LABEL_111:
    sub_100006AB8(v144, &qword_100019440);
    objc_msgSend( v135,  "setAppleArcadeGame:",  TopShelfCarouselItem.isAppleArcadeGame.getter(objc_msgSend(v135, "setGameControllerOptions:", v146)) & 1);
    id v154 = v135;
    uint64_t v254 = TopShelfCarouselItem.namedAttributes.getter();
    v255 = sub_10000D650(v254);
    swift_bridgeObjectRelease(v254);
    sub_10000E8F0(0LL, &qword_100019870, &OBJC_CLASS___TVTopShelfNamedAttribute_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v255);
    [v154 setNamedAttributes:isa];

    goto LABEL_112;
  }

  uint64_t v147 = (uint64_t)v279;
  v279[4]((uint64_t)v139, v119, v145);
  uint64_t v148 = v268;
  (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v268, v139, v145);
  int v149 = (*(uint64_t (**)(char *, uint64_t))(v147 + 88))(v148, v145);
  if (v149 == enum case for ControllerRequirement.siriRemoteOrControllerRequired(_:))
  {
    ((void (*)(char *, uint64_t))v279[1])(v139, v145);
    uint64_t v146 = 3LL;
    goto LABEL_111;
  }

  if (v149 == enum case for ControllerRequirement.siriRemoteRequired(_:))
  {
    ((void (*)(char *, uint64_t))v279[1])(v139, v145);
    uint64_t v146 = 2LL;
    goto LABEL_111;
  }

  if (v149 == enum case for ControllerRequirement.controllerRequired(_:))
  {
    ((void (*)(char *, uint64_t))v279[1])(v139, v145);
    uint64_t v146 = 1LL;
    goto LABEL_111;
  }

  if (v149 == enum case for ControllerRequirement.controllerOptional(_:))
  {
    ((void (*)(char *, uint64_t))v279[1])(v139, v145);
    uint64_t v146 = 4LL;
    goto LABEL_111;
  }

LABEL_116:
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v145, v145);
  __break(1u);
  return result;
}

void *sub_10000D650(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v4 = 0LL;
      do
      {
        if ((a1 & 0xC000000000000001LL) != 0)
        {
          uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
        }

        else
        {
          uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
          swift_retain(v5);
        }

        ++v4;
        TopShelfNamedAttribute.name.getter();
        uint64_t v7 = v6;
        uint64_t v8 = TopShelfNamedAttribute.values.getter();
        id v9 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
        NSString v10 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v7);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v8);
        id v12 = [v9 initWithName:v10 values:isa];
        swift_release(v5, v13);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        uint64_t v14 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
        uint64_t v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
        specialized ContiguousArray._endMutation()(v15);
      }

      while (v2 != v4);
      return _swiftEmptyArrayStorage;
    }
  }

  return result;
}

uint64_t sub_10000D7F4()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for TopShelfAction.Target(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TopShelfAction.target.getter(v6);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v9 == enum case for TopShelfAction.Target.url(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v8, v0);
    id v10 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v11);
    uint64_t v13 = v12;
    id v14 = [v10 initWithURL:v12];

    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }

  else
  {
    if (v9 == enum case for TopShelfAction.Target.installApplication(_:))
    {
      (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
      uint64_t v16 = *((void *)v8 + 1);
      uint64_t v17 = (objc_class *)&OBJC_CLASS___TVTopShelfInstallApplicationAction;
    }

    else
    {
      if (v9 != enum case for TopShelfAction.Target.openApplication(_:))
      {
        uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v4, v4);
        __break(1u);
        return result;
      }

      (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
      uint64_t v16 = *((void *)v8 + 1);
      uint64_t v17 = (objc_class *)&OBJC_CLASS___TVTopShelfOpenApplicationAction;
    }

    id v18 = objc_allocWithZone(v17);
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    id v14 = [v18 initWithApplicationBundleIdentifier:v19];
  }

  TopShelfAction.title.getter(v15);
  if (v20)
  {
    uint64_t v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
  }

  else
  {
    NSString v22 = 0LL;
  }

  [v14 _setTitle:v22];

  uint64_t v23 = TopShelfAction.userInfo.getter();
  Class isa = (Class)v23;
  if (v23)
  {
    uint64_t v25 = sub_100003EB0(v23);
    swift_bridgeObjectRelease(isa);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
  }

  [v14 _setUserInfo:isa];

  TopShelfAction.imageName.getter();
  if (v26)
  {
    uint64_t v27 = v26;
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
  }

  else
  {
    NSString v28 = 0LL;
  }

  NSString v29 =  [(id)objc_opt_self(AppStoreTopShelfActionImageName) internalNameTranslatedFromName:v28];

  if (!v29)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v31 = v30;
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
  }

  [v14 _setImageName:v29];

  id v32 = v14;
  TopShelfAction.accessibilityLabel.getter();
  if (v33)
  {
    uint64_t v34 = v33;
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
  }

  else
  {
    NSString v35 = 0LL;
  }

  [v32 setAccessibilityLabel:v35];

  return (uint64_t)v32;
}

uint64_t sub_10000DB70()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for TopShelfAction.Target(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TopShelfAction.target.getter(v6);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v9 == enum case for TopShelfAction.Target.url(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v8, v0);
    id v10 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v11);
    uint64_t v13 = v12;
    id v14 = [v10 initWithURL:v12];

    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }

  else
  {
    if (v9 == enum case for TopShelfAction.Target.installApplication(_:))
    {
      (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
      uint64_t v16 = *((void *)v8 + 1);
      uint64_t v17 = (objc_class *)&OBJC_CLASS___TVTopShelfInstallApplicationAction;
    }

    else
    {
      if (v9 != enum case for TopShelfAction.Target.openApplication(_:))
      {
        uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v4, v4);
        __break(1u);
        return result;
      }

      (*(void (**)(char *, uint64_t))(v5 + 96))(v8, v4);
      uint64_t v16 = *((void *)v8 + 1);
      uint64_t v17 = (objc_class *)&OBJC_CLASS___TVTopShelfOpenApplicationAction;
    }

    id v18 = objc_allocWithZone(v17);
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    id v14 = [v18 initWithApplicationBundleIdentifier:v19];
  }

  TopShelfAction.title.getter(v15);
  if (v20)
  {
    uint64_t v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
  }

  else
  {
    NSString v22 = 0LL;
  }

  [v14 _setTitle:v22];

  uint64_t v23 = TopShelfAction.userInfo.getter();
  Class isa = (Class)v23;
  if (v23)
  {
    uint64_t v25 = sub_100003EB0(v23);
    swift_bridgeObjectRelease(isa);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
  }

  [v14 _setUserInfo:isa];

  TopShelfAction.imageName.getter();
  if (v26)
  {
    uint64_t v27 = v26;
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
  }

  else
  {
    NSString v28 = 0LL;
  }

  NSString v29 =  [(id)objc_opt_self(AppStoreTopShelfActionImageName) internalNameTranslatedFromName:v28];

  if (!v29)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v31 = v30;
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
  }

  [v14 _setImageName:v29];

  id v32 = v14;
  TopShelfAction.accessibilityLabel.getter();
  if (v33)
  {
    uint64_t v34 = v33;
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
  }

  else
  {
    NSString v35 = 0LL;
  }

  [v32 setAccessibilityLabel:v35];

  uint64_t v36 = objc_opt_self(&OBJC_CLASS___TVTopShelfInstallApplicationAction);
  uint64_t result = swift_dynamicCastObjCClass(v32, v36);
  if (!result)
  {

    return 0LL;
  }

  return result;
}

void sub_10000DF10(void *a1)
{
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = TopShelfItem.playAction.getter(v2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)sub_10000D7F4();
    swift_release(v6, v8);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  [a1 setPlayAction:v7];

  uint64_t v9 = TopShelfItem.displayAction.getter();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)sub_10000D7F4();
    swift_release(v10, v12);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  [a1 setDisplayAction:v11];

  TopShelfItem.expirationDate.getter();
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1LL, v13) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v13);
  }

  [a1 setExpirationDate:isa];

  uint64_t v16 = TopShelfItem.userInfo.getter();
  Class v17 = (Class)v16;
  if (v16)
  {
    uint64_t v18 = sub_100003EB0(v16);
    swift_bridgeObjectRelease(v17);
    Class v17 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v18);
  }

  [a1 _setUserInfo:v17];

  TopShelfItem.accessibilityLabel.getter();
  if (v19)
  {
    uint64_t v20 = v19;
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
  }

  else
  {
    NSString v21 = 0LL;
  }

  [a1 setAccessibilityLabel:v21];
}

uint64_t sub_10000E11C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v110 = a2;
  uint64_t v114 = a4;
  uint64_t v109 = type metadata accessor for Artwork.Format(0LL);
  uint64_t v108 = *(void *)(v109 - 8);
  ((void (*)(void))__chkstk_darwin)();
  double v107 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Artwork.Crop(0LL);
  uint64_t v111 = *(char **)(v12 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v105 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000614C(&qword_100019868);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v15 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for Artwork.URLTemplate.Key(0LL);
  unint64_t v115 = *(char **)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v18 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for Artwork.URLTemplate(0LL);
  uint64_t v117 = *(void *)(v19 - 8);
  uint64_t v118 = v19;
  uint64_t v20 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v22 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v103 - v23;
  uint64_t v25 = type metadata accessor for Artwork.Variant(0LL);
  uint64_t v112 = *(void *)(v25 - 8);
  uint64_t v113 = v25;
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v116 = v6;
  uint64_t v28 = dispatch thunk of Artwork.bestVariant(prefersLayeredImage:)(a3);
  if (a1 == 1)
  {
    int v29 = 0;
    double v30 = 1.0;
  }

  else
  {
    if (a1 != 2)
    {
      (*(void (**)(char *, uint64_t))(v112 + 8))(v27, v113);
      uint64_t v34 = type metadata accessor for URL(0LL);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56LL))( v114,  1LL,  1LL,  v34);
    }

    int v29 = Artwork.Variant.supportsWideGamut.getter(v28);
    double v30 = 1.5;
  }

  uint64_t v31 = ((uint64_t (*)(void))Artwork.Variant.quality.getter)();
  uint64_t v106 = v24;
  if ((v32 & 1) == 0 || (v29 & 1) != 0)
  {
    int v104 = v29;
    uint64_t v124 = 46LL;
    unint64_t v125 = 0xE100000000000000LL;
    uint64_t v36 = v115;
    uint64_t v37 = (*((uint64_t (**)(char *, void, uint64_t))v115 + 13))( v18,  enum case for Artwork.URLTemplate.Key.format(_:),  v16);
    uint64_t v38 = Artwork.URLTemplate.Key.rawValue.getter(v37);
    uint64_t v40 = v39;
    (*((void (**)(char *, uint64_t))v36 + 1))(v18, v16);
    v41._countAndFlagsBits = v38;
    v41._object = v40;
    String.append(_:)(v41);
    uint64_t v42 = swift_bridgeObjectRelease(v40);
    uint64_t v43 = v124;
    uint64_t v44 = (void *)v125;
    uint64_t v45 = Artwork.template.getter(v42);
    uint64_t v46 = Artwork.URLTemplate.rawValue.getter(v45);
    unint64_t v48 = v47;
    uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v22, v118);
    uint64_t v50 = Artwork.Variant.quality.getter(v49);
    uint64_t v103 = v43;
    if ((v51 & 1) == 0)
    {
      uint64_t v124 = v46;
      unint64_t v125 = v48;
      uint64_t v122 = v43;
      uint64_t v123 = v44;
      uint64_t v119 = v50;
      uint64_t v120 = 45LL;
      unint64_t v121 = 0xE100000000000000LL;
      v52._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
      object = v52._object;
      String.append(_:)(v52);
      swift_bridgeObjectRelease(object);
      v54._countAndFlagsBits = v43;
      v54._object = v44;
      String.append(_:)(v54);
      unint64_t v55 = v121;
      unint64_t v56 = sub_10000E928();
      uint64_t v46 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v122,  &v120,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v56,  v56,  v56);
      unint64_t v58 = v57;
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v55);
      unint64_t v48 = v58;
    }

    if ((v104 & 1) != 0)
    {
      uint64_t v124 = v46;
      unint64_t v125 = v48;
      v59._countAndFlagsBits = v103;
      uint64_t v122 = v103;
      uint64_t v123 = v44;
      uint64_t v120 = 3362861LL;
      unint64_t v121 = 0xE300000000000000LL;
      v59._object = v44;
      String.append(_:)(v59);
      unint64_t v60 = v121;
      unint64_t v61 = sub_10000E928();
      uint64_t v46 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v122,  &v120,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v61,  v61,  v61);
      unint64_t v63 = v62;
      swift_bridgeObjectRelease(v44);
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v60);
      unint64_t v48 = v63;
    }

    else
    {
      swift_bridgeObjectRelease(v44);
    }

    unint64_t v64 = v48;
    uint64_t v24 = v106;
    Artwork.URLTemplate.init(rawValue:)(v46, v64);
  }

  else
  {
    uint64_t v33 = Artwork.template.getter(v31);
  }

  double v65 = CGSize.scaled(_:)(v33, v30, a5, a6);
  double v67 = v66;
  sub_100006C6C(v110, (uint64_t)v15, &qword_100019868);
  int v68 = v111;
  uint64_t v69 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v111 + 6))(v15, 1LL, v12);
  if ((_DWORD)v69 == 1)
  {
    uint64_t v70 = sub_100006AB8((uint64_t)v15, &qword_100019868);
    uint64_t v15 = v105;
    uint64_t v69 = Artwork.crop.getter(v70);
  }

  uint64_t v116 = Artwork.Crop.rawValue.getter(v69);
  uint64_t v72 = v71;
  (*((void (**)(char *, uint64_t))v68 + 1))(v15, v12);
  (*(void (**)(char *, char *, uint64_t))(v117 + 16))(v22, v24, v118);
  uint64_t v73 = sub_10000614C(&qword_100019878);
  uint64_t v74 = sub_10000614C(&qword_100019500);
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = *(void *)(v75 + 72);
  uint64_t v77 = *(unsigned __int8 *)(v75 + 80);
  uint64_t v78 = (v77 + 32) & ~v77;
  uint64_t v79 = swift_allocObject(v73, v78 + 4 * v76, v77 | 7);
  *(_OWORD *)(v79 + swift_weakDestroy(v0 + 16) = xmmword_100012CF0;
  uint64_t v80 = v79 + v78;
  uint64_t v81 = *(int *)(v74 + 48);
  NSString v82 = (void (*)(void))*((void *)v115 + 13);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t))v82)( v80,  enum case for Artwork.URLTemplate.Key.width(_:),  v16);
  if ((~*(void *)&v65 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }

  if (v65 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (v65 >= 9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  uint64_t v111 = v27;
  unint64_t v115 = v22;
  uint64_t v83 = v72;
  uint64_t v84 = (void *)(v80 + v81);
  uint64_t v124 = (uint64_t)v65;
  *uint64_t v84 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v84[1] = v85;
  uint64_t v86 = *(int *)(v74 + 48);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t))v82)( v80 + v76,  enum case for Artwork.URLTemplate.Key.height(_:),  v16);
  if ((~*(void *)&v67 & 0x7FF0000000000000LL) == 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  if (v67 <= -9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  if (v67 < 9.22337204e18)
  {
    uint64_t v87 = (void *)(v80 + v76 + v86);
    uint64_t v124 = (uint64_t)v67;
    *uint64_t v87 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    v87[1] = v88;
    uint64_t v89 = (uint64_t *)(v80 + 2 * v76 + *(int *)(v74 + 48));
    v82();
    *uint64_t v89 = v116;
    v89[1] = v83;
    uint64_t v90 = (uint64_t *)(v80 + 3 * v76 + *(int *)(v74 + 48));
    uint64_t v91 = ((uint64_t (*)(void))v82)();
    uint64_t v92 = v107;
    int v93 = v111;
    uint64_t v94 = Artwork.Variant.format.getter(v91);
    uint64_t v95 = Artwork.Format.rawValue.getter(v94);
    uint64_t v97 = v96;
    (*(void (**)(char *, uint64_t))(v108 + 8))(v92, v109);
    *uint64_t v90 = v95;
    v90[1] = v97;
    unint64_t v98 = sub_100004F80(v79);
    uint64_t v99 = v115;
    Artwork.URLTemplate.makeURL(withSubstitutions:)();
    swift_bridgeObjectRelease(v98);
    uint64_t v100 = *(void (**)(char *, uint64_t))(v117 + 8);
    uint64_t v101 = v99;
    uint64_t v102 = v118;
    v100(v101, v118);
    v100(v106, v102);
    return (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v93, v113);
  }

LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_10000E8F0(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_10000E928()
{
  unint64_t result = qword_100019880;
  if (!qword_100019880)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019880);
  }

  return result;
}

uint64_t sub_10000E96C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = a4;
  uint64_t v56 = a1;
  uint64_t v57 = a3;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v52 = *(void *)(v8 - 8);
  uint64_t v53 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unsigned int v15 = [(id)objc_opt_self(NSThread) isMainThread];
  uint64_t v16 = sub_10000E8F0(0LL, (unint64_t *)&qword_100019460, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v17 = static OS_dispatch_queue.main.getter(v16);
  uint64_t v18 = (void *)v17;
  if (v15)
  {
    uint64_t v20 = v57;
    uint64_t v19 = v58;
    uint64_t v21 = a2;
    uint64_t v22 = v59;
    *uint64_t v14 = v17;
    (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))( v14,  enum case for DispatchPredicate.onQueue(_:),  v11);
    char v23 = _dispatchPreconditionTest(_:)(v14);
    uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
    if ((v23 & 1) != 0)
    {
      uint64_t v25 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise;
      uint64_t v26 = v19;
      uint64_t v27 = *(void *)(v19 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise);
      uint64_t v28 = swift_retain(v27);
      char v29 = Promise.isResolved.getter(v28);
      swift_release(v27, v30);
      if ((v29 & 1) != 0)
      {
        uint64_t v31 = *(void *)(v26 + v25);
        swift_retain(v31);
      }

      else
      {
        uint64_t v31 = sub_10000F218();
      }

      uint64_t v45 = v21;
      uint64_t v46 = v56;
      uint64_t v47 = swift_allocObject(&unk_100015668, 32LL, 7LL);
      *(void *)(v47 + swift_weakDestroy(v0 + 16) = v46;
      *(void *)(v47 + 24) = v45;
      uint64_t v48 = swift_retain(v45);
      uint64_t v49 = static OS_dispatch_queue.main.getter(v48);
      unint64_t v61 = (void *)v16;
      unint64_t v62 = (uint64_t (*)())&protocol witness table for OS_dispatch_queue;
      aBlock[0] = v49;
      Promise.then(perform:orCatchError:on:)(sub_1000104B0, v47, v20, v22, aBlock);
      swift_release(v31, v50);
      swift_release(v47, v51);
      return sub_1000069A8(aBlock);
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    char v32 = (void *)swift_allocObject(&unk_100015618, 56LL, 7LL);
    uint64_t v34 = v58;
    uint64_t v33 = v59;
    uint64_t v35 = v56;
    v32[2] = v58;
    v32[3] = v35;
    uint64_t v36 = v57;
    v32[4] = a2;
    v32[5] = v36;
    v32[6] = v33;
    unint64_t v62 = sub_100010408;
    unint64_t v63 = v32;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10000F1EC;
    unint64_t v61 = &unk_100015630;
    uint64_t v37 = _Block_copy(aBlock);
    uint64_t v38 = v63;
    swift_retain(a2);
    swift_retain(v34);
    swift_retain(v33);
    uint64_t v40 = swift_release(v38, v39);
    static DispatchQoS.unspecified.getter(v40);
    aBlock[0] = _swiftEmptyArrayStorage;
    uint64_t v41 = sub_100006CB0( &qword_100019A78,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v42 = sub_10000614C(&qword_100019A80);
    uint64_t v43 = sub_10001044C(&qword_100019A88, &qword_100019A80);
    uint64_t v44 = v55;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v42, v43, v55, v41);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v10, v7, v37);
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v7, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v10, v53);
  }

  return result;
}

uint64_t sub_10000ED1C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v25 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CompoundLogger(0LL);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise;
  sub_10000614C(&qword_100019A10);
  *(void *)(v1 + v10) = Promise.__allocating_init()();
  uint64_t v11 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingMetricsLogger;
  uint64_t v12 = type metadata accessor for ReplayLogger(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  uint64_t v13 = ReplayLogger.init()();
  *(void *)(v1 + v11) = v13;
  uint64_t v14 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_diagnosticsRecorder;
  uint64_t v15 = type metadata accessor for RenderPipelineDiagnostics.Recorder(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  *(void *)(v1 + v14) = RenderPipelineDiagnostics.Recorder.init()();
  *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents) = _swiftEmptyArrayStorage;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_isBootstrapping) = 0;
  uint64_t v16 = v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_bagProfile;
  uint64_t v17 = type metadata accessor for Bag.Profile(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  uint64_t v28 = a1;
  v19(v16, a1, v17);
  uint64_t v20 = sub_10000614C(&qword_100019A70);
  uint64_t v21 = swift_allocObject(v20, 112LL, 7LL);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_100012CE0;
  *(void *)(v21 + 56) = v12;
  *(void *)(v21 + 64) = &protocol witness table for ReplayLogger;
  *(void *)(v21 + 32) = v13;
  uint64_t v22 = qword_100019290;
  swift_retain(v13);
  if (v22 != -1) {
    swift_once(&qword_100019290, sub_10000B288);
  }
  uint64_t v23 = sub_1000053B0(v4, (uint64_t)qword_10001A100);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v6, v23, v4);
  *(void *)(v21 + 96) = type metadata accessor for OSLogger(0LL);
  *(void *)(v21 + 104) = &protocol witness table for OSLogger;
  sub_100006244((void *)(v21 + 72));
  OSLogger.init(subsystem:category:)(v6, 0x61727473746F6F42LL, 0xE900000000000070LL);
  CompoundLogger.init(loggers:)(v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))( v2 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_logger,  v9,  v27);
  [(id)objc_opt_self(AMSMetrics) setFlushTimerEnabled:0];
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v28, v17);
  return v2;
}

uint64_t sub_10000EFD0(uint64_t a1)
{
  uint64_t v29 = a1;
  uint64_t v2 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  __chkstk_darwin();
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MetricsData(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin();
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents;
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents);
  if (!((unint64_t)v11 >> 62))
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
      return result;
    }
LABEL_3:
    uint64_t v12 = *(void *)(v1 + v10);
    if ((unint64_t)v12 >> 62)
    {
      if (v12 < 0) {
        uint64_t v22 = *(void *)(v1 + v10);
      }
      else {
        uint64_t v22 = v12 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*(void *)(v1 + v10));
      uint64_t result = _CocoaArrayWrapper.endIndex.getter(v22);
      uint64_t v13 = result;
      if (result) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      uint64_t result = swift_bridgeObjectRetain(*(void *)(v1 + v10));
      if (v13)
      {
LABEL_5:
        if (v13 < 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v25 = v10;
        uint64_t v26 = v1;
        uint64_t v14 = 0LL;
        do
        {
          if ((v12 & 0xC000000000000001LL) != 0)
          {
            uint64_t v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v12);
          }

          else
          {
            uint64_t v15 = *(void *)(v12 + 8 * v14 + 32);
            swift_retain(v15);
          }

          ++v14;
          uint64_t v16 = dispatch thunk of MetricsEvent.metricsData.getter();
          static MetricsFieldsContext.emptyContext.getter(v16);
          uint64_t v17 = MetricsPipeline.process(_:using:)(v9, v4);
          swift_release(v15, v18);
          swift_release(v17, v19);
          (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v28);
          (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        }

        while (v13 != v14);
        swift_bridgeObjectRelease(v12);
        uint64_t v10 = v25;
        uint64_t v1 = v26;
        goto LABEL_22;
      }
    }

    swift_bridgeObjectRelease(v12);
LABEL_22:
    uint64_t v23 = *(void *)(v1 + v10);
    *(void *)(v1 + v10) = _swiftEmptyArrayStorage;
    return swift_bridgeObjectRelease(v23);
  }

  if (v11 < 0) {
    uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents);
  }
  else {
    uint64_t v20 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents));
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v20);
  uint64_t result = swift_bridgeObjectRelease(v11);
  if (v21) {
    goto LABEL_3;
  }
  return result;
}

uint64_t sub_10000F1EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2, v4);
}

uint64_t sub_10000F218()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ASKBootstrap.TargetType(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_isBootstrapping) == 1)
  {
    uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise);
    swift_retain(v6);
  }

  else
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_isBootstrapping) = 1;
    uint64_t v7 = v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_bagProfile;
    uint64_t v17 = &type metadata for ModernAppStateControllerFactory;
    uint64_t v18 = (void *)sub_10000FC08();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for ASKBootstrap.TargetType.topShelf(_:),  v2);
    static ASKBootstrapFactory.make(bagProfile:appStateControllerFactory:targetType:)(v19, v7, v16, v5);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_1000069A8(v16);
    uint64_t v8 = v20;
    uint64_t v9 = v21;
    sub_100007FE8(v19, v20);
    uint64_t v10 = dispatch thunk of ASKBootstrapProtocol.start()(v8, v9);
    uint64_t v11 = sub_10000E8F0(0LL, (unint64_t *)&qword_100019460, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v12 = swift_retain_n(v1, 2LL);
    uint64_t v13 = static OS_dispatch_queue.main.getter(v12);
    uint64_t v17 = (ValueMetadata *)v11;
    uint64_t v18 = &protocol witness table for OS_dispatch_queue;
    v16[0] = v13;
    Promise.then(perform:orCatchError:on:)(sub_10000FC4C, v1, sub_10000FC54, v1, v16);
    swift_release(v10, v14);
    swift_release_n(v1, 2LL);
    sub_1000069A8(v16);
    uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise);
    swift_retain(v6);
    sub_1000069A8(v19);
  }

  return v6;
}

uint64_t sub_10000F3E0(uint64_t *a1)
{
  uint64_t v1 = (void *)sub_10000F7C8(*a1);
  uint64_t v2 = (void *)sub_10000FC58(v1);
  dispatch thunk of BaseObjectGraph.name.setter(0xD000000000000011LL, 0x8000000100012090LL);
  sub_10000F454(v2);
  swift_release(v1, v3);
  return swift_release(v2, v4);
}

uint64_t sub_10000F454(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10000614C(&qword_100019430);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_100012CD0;
  LogMessage.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100012070LL);
  uint64_t v11 = type metadata accessor for CompoundLogger(0LL);
  Logger.info(_:)(v10, v11, &protocol witness table for CompoundLogger);
  swift_bridgeObjectRelease(v10);
  inject(_:from:)(a1);
  sub_10000EFD0((uint64_t)v7);
  uint64_t v12 = sub_10000E8F0(0LL, &qword_100019A18, &OBJC_CLASS___AMSURLSession_ptr);
  uint64_t v13 = type metadata accessor for ObjectGraph(0LL);
  inject<A, B>(_:from:)(&v21, v12, a1, v12, v13);
  uint64_t v14 = v21;
  uint64_t v15 = type metadata accessor for URLProtocolDelegate(0LL);
  inject<A, B>(_:from:)(&v21, v15, a1, v15, v13);
  uint64_t v16 = v21;
  [v14 setDelegate:v21];
  *(_BYTE *)(v2 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_isBootstrapping) = 0;
  uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise);
  uint64_t v21 = a1;
  swift_retain(v17);
  Promise.resolve(_:)(&v21);

  swift_release(v17, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000F644(uint64_t a1)
{
  uint64_t v3 = sub_10000614C(&qword_100019430);
  uint64_t v4 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
       + 2LL * *(void *)(v4 + 72),
         *(unsigned __int8 *)(v4 + 80) | 7LL);
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_100012CE0;
  LogMessage.init(stringLiteral:)(0xD000000000000030LL, 0x8000000100012030LL);
  swift_getErrorValue(a1, v20, &v18);
  uint64_t v6 = v18;
  uint64_t v7 = v19;
  v21[3] = v19;
  uint64_t v8 = sub_100006244(v21);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16LL))(v8, v6, v7);
  static LogMessage.safe(_:)(v21);
  sub_10000FBC8((uint64_t)v21);
  uint64_t v9 = type metadata accessor for CompoundLogger(0LL);
  Logger.error(_:)(v5, v9, &protocol witness table for CompoundLogger);
  swift_bridgeObjectRelease(v5);
  uint64_t v10 = OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise;
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise);
  sub_10000614C(&qword_100019A10);
  uint64_t v12 = swift_retain(v11);
  uint64_t v13 = Promise.__allocating_init()(v12);
  uint64_t v14 = *(void *)(v1 + v10);
  *(void *)(v1 + v10) = v13;
  swift_release(v14, v15);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_isBootstrapping) = 0;
  Promise.reject(_:)(a1);
  return swift_release(v11, v16);
}

uint64_t sub_10000F7C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Dependency(0LL);
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MetricsLogger.Configuration(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100006CB0(&qword_100019A08, v9, (uint64_t)&protocol conformance descriptor for MetricsLogger.Configuration);
  inject<A>(_:from:)(v5, a1, v5, v10);
  uint64_t v11 = type metadata accessor for DiagnosticsReporter(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = sub_100006E18((uint64_t)v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))( v8,  v12 + OBJC_IVAR____TtC25AppStoreTopShelfExtension19DiagnosticsReporter_configuration,  v5);
  uint64_t v13 = type metadata accessor for MetricsLogger(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = MetricsLogger.init(loggerName:configuration:)(0x61727473746F6F62LL, 0xE900000000000070LL, v8);
  void v26[3] = v13;
  v26[4] = &protocol witness table for MetricsLogger;
  v26[0] = v14;
  swift_retain(v14);
  ReplayLogger.replay(last:messagesInto:)(20LL, v26);
  swift_release(v14, v15);
  sub_1000069A8(v26);
  sub_100007D64();
  type metadata accessor for ObjectGraph(0LL);
  uint64_t v16 = swift_retain(a1);
  uint64_t v17 = BaseObjectGraph.__allocating_init(_:)(v16);
  v26[0] = v12;
  swift_retain(v12);
  Dependency.init<A>(satisfying:with:)(v11, v26, v11);
  uint64_t v18 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v4);
  swift_release(v17, v19);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v25);
  swift_retain(v18);
  dispatch thunk of BaseObjectGraph.name.setter(1701998403LL, 0xE400000000000000LL);
  swift_release(v12, v20);
  swift_release(v18, v21);
  return v18;
}

uint64_t sub_10000FA1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_logger;
  uint64_t v2 = type metadata accessor for CompoundLogger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_promise), v3);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingMetricsLogger),  v4);
  swift_release( *(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_diagnosticsRecorder),  v5);
  swift_bridgeObjectRelease(*(void *)(v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_pendingEvents));
  uint64_t v6 = v0 + OBJC_IVAR____TtC25AppStoreTopShelfExtension17TopShelfBootstrap_bagProfile;
  uint64_t v7 = type metadata accessor for Bag.Profile(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000FAD4()
{
  return type metadata accessor for TopShelfBootstrap(0LL);
}

uint64_t type metadata accessor for TopShelfBootstrap(uint64_t a1)
{
  uint64_t result = qword_1000198D0;
  if (!qword_1000198D0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TopShelfBootstrap);
  }
  return result;
}

uint64_t sub_10000FB18(uint64_t a1)
{
  uint64_t result = type metadata accessor for CompoundLogger(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    uint64_t result = type metadata accessor for Bag.Profile(319LL);
    if (v4 <= 0x3F)
    {
      v5[5] = *(void *)(result - 8) + 64LL;
      v5[6] = &unk_100012F78;
      uint64_t result = swift_updateClassMetadata2(a1, 256LL, 7LL, v5, a1 + 80);
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_10000FBC8(uint64_t a1)
{
  uint64_t v2 = sub_10000614C(&qword_100019438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_10000FC08()
{
  unint64_t result = qword_100019A20;
  if (!qword_100019A20)
  {
    unint64_t result = swift_getWitnessTable(&unk_100012FD0, &type metadata for ModernAppStateControllerFactory);
    atomic_store(result, (unint64_t *)&qword_100019A20);
  }

  return result;
}

uint64_t sub_10000FC4C(uint64_t *a1)
{
  return sub_10000F3E0(a1);
}

uint64_t sub_10000FC58(void *a1)
{
  uint64_t v78 = *a1;
  uint64_t v2 = sub_10000614C(&qword_100019A28);
  __chkstk_darwin(v2);
  uint64_t v90 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v85 = (void *)type metadata accessor for MetricsFieldInclusionRequest(0LL);
  uint64_t v84 = *(v85 - 1);
  __chkstk_darwin(v85);
  uint64_t v77 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v81 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v93 = type metadata accessor for ArcadeSubscriptionFieldsProvider(0LL);
  uint64_t v96 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v92 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MetricsFieldsAggregator(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  uint64_t v95 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v83 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v91 = (char *)&v76 - v12;
  uint64_t v13 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v87 = *(void *)(v13 - 8);
  uint64_t v88 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v86 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v14);
  NSString v82 = (char *)&v76 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v76 - v18;
  uint64_t v20 = type metadata accessor for EntitlementRefeshCondition(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = type metadata accessor for ASKBagContract(0LL);
  uint64_t v89 = inject(_:from:)(v24, a1);
  uint64_t v25 = ASKBagContract.arcadeProductFamilyId.getter();
  uint64_t v27 = v26;
  id v28 = [(id)objc_opt_self(ASDSubscriptionEntitlements) sharedInstance];
  uint64_t v101 = sub_10000E8F0(0LL, &qword_100019A30, &OBJC_CLASS___ASDSubscriptionEntitlements_ptr);
  uint64_t v102 = &protocol witness table for ASDSubscriptionEntitlements;
  v100[0] = v28;
  uint64_t v98 = sub_10000E8F0(0LL, &qword_100019A38, &OBJC_CLASS___ACAccountStore_ptr);
  uint64_t v99 = &protocol witness table for ACAccountStore;
  uint64_t v29 = a1;
  inject<A, B>(_:from:)(v97, v98, a1, v98, v78);
  uint64_t v30 = (objc_class *)type metadata accessor for ArcadeSubscriptionManager(0LL);
  id v31 = objc_allocWithZone(v30);
  char v32 = (void *)ArcadeSubscriptionManager.init(arcadeSubscriptionFamilyId:subscriptionEntitlements:activeStoreAccountProvider:)( v25,  v27,  v100,  v97);
  *uint64_t v23 = 0;
  (*(void (**)(_BYTE *, void, uint64_t))(v21 + 104))( v23,  enum case for EntitlementRefeshCondition.ifCacheIsExpired(_:),  v20);
  uint64_t v33 = ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(v23);
  swift_release(v33, v34);
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v23, v20);
  uint64_t v35 = v19;
  uint64_t v36 = v29;
  uint64_t v79 = v29;
  uint64_t v37 = inject(_:from:)(v29);
  uint64_t v38 = v91;
  uint64_t v39 = v35;
  MetricsPipeline.aggregator.getter(v37);
  id v40 = v32;
  uint64_t v41 = v92;
  ArcadeSubscriptionFieldsProvider.init(arcadeSubscriptionManager:)();
  uint64_t v42 = v93;
  uint64_t v101 = v93;
  uint64_t v102 = (void *)sub_100006CB0( &qword_100019A40,  (uint64_t (*)(uint64_t))&type metadata accessor for ArcadeSubscriptionFieldsProvider,  (uint64_t)&protocol conformance descriptor for ArcadeSubscriptionFieldsProvider);
  uint64_t v43 = sub_100006244(v100);
  uint64_t v44 = (*(uint64_t (**)(void *, char *, uint64_t))(v96 + 16))(v43, v41, v42);
  static MetricsFieldExclusionRequest.arcadeSubscription.getter(v44);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v100, v6);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v6, v81);
  sub_1000069A8(v100);
  uint64_t v45 = inject(_:from:)(v36);
  uint64_t v47 = v46;
  uint64_t v101 = type metadata accessor for ArcadeButtonNameFieldsProvider(0LL);
  uint64_t v102 = (void *)sub_100006CB0( &qword_100019A48,  (uint64_t (*)(uint64_t))&type metadata accessor for ArcadeButtonNameFieldsProvider,  (uint64_t)&protocol conformance descriptor for ArcadeButtonNameFieldsProvider);
  sub_100006244(v100);
  id v48 = v40;
  uint64_t v81 = v45;
  swift_unknownObjectRetain(v45);
  uint64_t v49 = ArcadeButtonNameFieldsProvider.init(arcadeSubscriptionManager:appStateController:)(v48, v45, v47);
  uint64_t v50 = v77;
  static MetricsFieldInclusionRequest.arcadeButtonName.getter(v49);
  MetricsFieldsAggregator.addOptInProvider(_:forRequest:)(v100, v50);
  (*(void (**)(char *, void *))(v84 + 8))(v50, v85);
  sub_1000069A8(v100);
  uint64_t v51 = type metadata accessor for AppStoreMetricsFieldsBuilder(0LL);
  uint64_t v52 = sub_100006CB0( &qword_100019A50,  (uint64_t (*)(uint64_t))&type metadata accessor for AppStoreMetricsFieldsBuilder,  (uint64_t)&protocol conformance descriptor for AppStoreMetricsFieldsBuilder);
  uint64_t v53 = v83;
  uint64_t v54 = (*(uint64_t (**)(char *, char *, uint64_t))(v95 + 16))(v83, v38, v94);
  uint64_t v76 = v39;
  uint64_t v55 = MetricsPipeline.linter.getter(v100, v54);
  MetricsPipeline.recorder.getter(v97, v55);
  uint64_t v56 = v82;
  MetricsPipeline.init(builderType:aggregator:linter:recorder:)(v51, v52, v53, v100, v97);
  uint64_t v57 = sub_10000614C(&qword_100019A58);
  uint64_t v58 = *(void *)(type metadata accessor for Dependency(0LL) - 8);
  uint64_t v59 = swift_allocObject( v57,  ((*(unsigned __int8 *)(v58 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))
        + 3LL * *(void *)(v58 + 72),
          *(unsigned __int8 *)(v58 + 80) | 7LL);
  *(_OWORD *)(v59 + swift_weakDestroy(v0 + 16) = xmmword_100012D00;
  v100[0] = v48;
  uint64_t v85 = v48;
  Dependency.init<A>(satisfying:with:)(v30, v100, v30);
  unint64_t v61 = v86;
  uint64_t v60 = v87;
  unint64_t v62 = v56;
  uint64_t v63 = v88;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v86, v56, v88);
  Dependency.init<A>(satisfying:with:)(v63, v61, v63);
  unint64_t v64 = (objc_class *)type metadata accessor for URLProtocolDelegate(0LL);
  uint64_t v65 = enum case for URLProtocolDelegate.DialogStyle.system(_:);
  uint64_t v66 = type metadata accessor for URLProtocolDelegate.DialogStyle(0LL);
  uint64_t v67 = *(void *)(v66 - 8);
  int v68 = v90;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 104))(v90, v65, v66);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v67 + 56))(v68, 0LL, 1LL, v66);
  id v69 = objc_allocWithZone(v64);
  v100[0] = URLProtocolDelegate.init(dialogStyle:)(v68);
  Dependency.init<A>(satisfying:with:)(v64, v100, v64);
  v100[0] = v59;
  uint64_t v70 = sub_10000614C(&qword_100019A60);
  uint64_t v71 = sub_10001044C(&qword_100019A68, &qword_100019A60);
  uint64_t v72 = dispatch thunk of BaseObjectGraph.adding<A>(allDependencies:)(v100, v70, v71);
  swift_bridgeObjectRelease(v59);

  swift_unknownObjectRelease(v81);
  swift_release(v89, v73);
  uint64_t v74 = *(void (**)(char *, uint64_t))(v60 + 8);
  v74(v62, v63);
  (*(void (**)(char *, uint64_t))(v96 + 8))(v92, v93);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v91, v94);
  v74(v76, v63);
  return v72;
}

uint64_t sub_1000103D4(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 56LL, 7LL);
}

uint64_t sub_100010408()
{
  return sub_10000E96C(v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_100010434(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010444(uint64_t a1, uint64_t a2)
{
  return swift_release(*(void *)(a1 + 40), a2);
}

uint64_t sub_10001044C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_1000062CC(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10001048C(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_1000104B0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

ValueMetadata *type metadata accessor for ModernAppStateControllerFactory()
{
  return &type metadata for ModernAppStateControllerFactory;
}

uint64_t sub_1000104E8()
{
  uint64_t v0 = sub_10000614C(&qword_100019A90);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + swift_weakDestroy(v0 + 16) = xmmword_100012CD0;
  uint64_t v2 = type metadata accessor for DefaultAppStateDataSource(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = DefaultAppStateDataSource.init()();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = &protocol witness table for DefaultAppStateDataSource;
  *(void *)(v1 + 32) = v3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unint64_t v11 = 0LL;
  v12[3] = type metadata accessor for ASDDeviceAppFetcher(0LL);
  v12[4] = &protocol witness table for ASDDeviceAppFetcher;
  sub_100006244(v12);
  ASDDeviceAppFetcher.init(regulatoryLogger:)(&v9);
  *((void *)&v10 + 1) = type metadata accessor for EmptyUpdateRegistry(0LL);
  unint64_t v11 = sub_1000105F8();
  uint64_t v4 = sub_100006244(&v9);
  EmptyUpdateRegistry.init()(v4, v5, v6);
  uint64_t v7 = makeModernAppStateController(deviceAppFetcher:updateRegistry:dataSources:)(v12, &v9, v1);
  swift_bridgeObjectRelease(v1);
  sub_1000069A8(&v9);
  sub_1000069A8(v12);
  return v7;
}

unint64_t sub_1000105F8()
{
  unint64_t result = qword_100019A98;
  if (!qword_100019A98)
  {
    uint64_t updated = type metadata accessor for EmptyUpdateRegistry(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EmptyUpdateRegistry, updated);
    atomic_store(result, (unint64_t *)&qword_100019A98);
  }

  return result;
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}