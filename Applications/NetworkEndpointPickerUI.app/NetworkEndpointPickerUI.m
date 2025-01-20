id sub_1000044CC()
{
  void *v0;
  objc_super v2;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for AppDelegate();
  uint64_t v4 = static CommandLine.unsafeArgv.getter();
  uint64_t v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  uint64_t v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0LL, 0LL, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC23NetworkEndpointPickerUI11AppDelegate);
}

id sub_1000045A4(void *a1)
{
  id v2 = [a1 role];
  uint64_t v3 = UISceneSessionRoleEndpointPicker;
  uint64_t v4 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  if (v4 == v7 && v6 == v8) {
    goto LABEL_11;
  }
  uint64_t v10 = v8;
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0LL);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) == 0)
  {
    id v2 = [a1 role];
    uint64_t v12 = UISceneSessionRolePeoplePicker;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v6 = v14;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    if (v13 != v15 || v6 != v16)
    {
      uint64_t v18 = v16;
      _stringCompareWithSmolCheck(_:_:expecting:)(v13, v6, v15, v16, 0LL);

      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v18);
      goto LABEL_12;
    }

LABEL_11:
    swift_bridgeObjectRelease_n(v6, 2LL);
  }

LABEL_12:
  id v19 = [a1 role];
  id v20 = objc_allocWithZone(&OBJC_CLASS___UISceneConfiguration);
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v20 initWithName:v21 sessionRole:v19];

  return v22;
}

id sub_100004824(void *a1, id a2)
{
  id v5 = [a2 _FBSScene];
  id v6 = [v5 settings];
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___DDDevicePickerSceneSettings);
  uint64_t v8 = swift_dynamicCastObjCClass(v6, v7);
  if (!v8)
  {

    sub_100006AF0(a2);
    return 0LL;
  }

  uint64_t v9 = (void *)v8;
  id v10 = [a1 role];
  uint64_t v11 = UISceneSessionRoleEndpointPicker;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  if (v12 == v15 && v14 == v16)
  {

    swift_bridgeObjectRelease_n(v14, 2LL);
  }

  else
  {
    uint64_t v18 = v16;
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, v15, v16, 0LL);

    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v18);
    if ((v19 & 1) == 0) {
      goto LABEL_17;
    }
  }

  id v20 = [v5 hostAuditToken];
  if (!v20)
  {
LABEL_17:
    sub_100006AF0(a2);

    return 0LL;
  }

  NSString v21 = v20;
  id v22 = [(id)objc_opt_self(DDUIHostViewController) makeHostViewController];
  if (!v22)
  {
    sub_100006AF0(a2);

    return v22;
  }

  [v21 realToken];
  __int128 v40 = v44;
  __int128 v41 = v43;
  v23 = (void *)objc_opt_self(&OBJC_CLASS___LSBundleRecord);
  id v42 = 0LL;
  __int128 v43 = v41;
  __int128 v44 = v40;
  id v24 = [v23 bundleRecordForAuditToken:&v43 error:&v42];
  id v25 = v42;
  if (!v24)
  {
    id v37 = v42;
    uint64_t v38 = _convertNSErrorToError(_:)(v25);

    swift_willThrow();
    swift_errorRelease(v38);
LABEL_21:
    objc_msgSend(v2, "devicePickerDidCancelWithReason:", -2, v40, v41);

    return 0LL;
  }

  v26 = v24;
  id v27 = v42;
  id v28 = [v26 bundleIdentifier];
  if (!v28)
  {

    goto LABEL_21;
  }

  v29 = v28;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  [v22 setPresenter:v2];
  id v32 = [objc_allocWithZone(DDUIRapportDeviceDiscovery) init];
  [v22 setDeviceDiscovery:v32];

  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  NSString v34 = [v9 serviceIdentifier];
  if (!v34)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v36 = v35;
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v36);
  }

  objc_msgSend(v22, "configureForBundleID:serviceIdentifier:", v33, v34, v40, v41);

  return v22;
}

void sub_100004BC4()
{
  v1 = v0;
  uint64_t v2 = sub_1000067DC(&qword_1000116A8);
  uint64_t v3 = __chkstk_darwin(v2);
  id v5 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v105 - v6;
  id v8 = [(id)objc_opt_self(PBSUserProfileManager) sharedInstance];
  id v9 = [v8 userProfilesSnapshot];

  id v10 = [v9 primaryUserProfile];
  if (v10)
  {
    id v11 = [objc_allocWithZone(PBSUserProfileAccountInfo) initWithUserProfile:v10];
    id v12 = [v10 iCloudAltDSID];
    if (v12)
    {
      id v106 = v12;

      return;
    }

    NSString v50 = String._bridgeToObjectiveC()();
    NSString v51 = String._bridgeToObjectiveC()();
    id v52 = (id)DDUILocalizedString(v50, v51);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    uint64_t v54 = v53;

    id v55 = [v11 personNameComponents];
    id v105 = v11;
    if (v55)
    {
      v56 = v55;
      static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)(v55);

      uint64_t v57 = type metadata accessor for PersonNameComponents(0LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56LL))(v5, 0LL, 1LL, v57);
    }

    else
    {
      uint64_t v57 = type metadata accessor for PersonNameComponents(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56LL))(v5, 1LL, 1LL, v57);
    }

    sub_10000685C((uint64_t)v5, (uint64_t)v7);
    type metadata accessor for PersonNameComponents(0LL);
    uint64_t v58 = *(void *)(v57 - 8);
    uint64_t v59 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48))(v7, 1LL, v57);
    if ((_DWORD)v59 == 1)
    {
      sub_10000691C((uint64_t)v7, &qword_1000116A8);
    }

    else
    {
      uint64_t v60 = PersonNameComponents.givenName.getter(v59);
      uint64_t v62 = v61;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v57);
      if (v62)
      {
        NSString v63 = String._bridgeToObjectiveC()();
        NSString v64 = String._bridgeToObjectiveC()();
        id v65 = (id)DDUILocalizedString(v63, v64);

        uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
        uint64_t v68 = v67;

        uint64_t v69 = sub_1000067DC(&qword_1000116B0);
        uint64_t v70 = swift_allocObject(v69, 72LL, 7LL);
        *(_OWORD *)(v70 + 16) = xmmword_100009540;
        *(void *)(v70 + 56) = &type metadata for String;
        *(void *)(v70 + 64) = sub_1000068D8();
        *(void *)(v70 + 32) = v60;
        *(void *)(v70 + 40) = v62;
        static String.localizedStringWithFormat(_:_:)(v66, v68, v70);
        uint64_t v72 = v71;
        swift_bridgeObjectRelease(v70);
        swift_bridgeObjectRelease(v68);
        goto LABEL_16;
      }
    }

    NSString v73 = String._bridgeToObjectiveC()();
    NSString v74 = String._bridgeToObjectiveC()();
    id v75 = (id)DDUILocalizedString(v73, v74);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v75);
    uint64_t v72 = v76;

LABEL_16:
    NSString v77 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v54);
    NSString v78 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v72);
    id v79 =  [(id)objc_opt_self(UIAlertController) alertControllerWithTitle:v77 message:v78 preferredStyle:0];

    NSString v80 = String._bridgeToObjectiveC()();
    NSString v81 = String._bridgeToObjectiveC()();
    id v82 = (id)DDUILocalizedString(v80, v81);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
    uint64_t v84 = v83;

    uint64_t v85 = swift_allocObject(&unk_10000C6C0, 32LL, 7LL);
    *(void *)(v85 + 16) = v1;
    *(void *)(v85 + 24) = v10;
    id v86 = v1;
    id v106 = v10;
    NSString v87 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v84);
    v111 = sub_1000068D0;
    uint64_t v112 = v85;
    aBlock = _NSConcreteStackBlock;
    uint64_t v108 = 1107296256LL;
    v109 = sub_100005A34;
    v110 = &unk_10000C6D8;
    v88 = _Block_copy(&aBlock);
    swift_release(v112);
    v89 = (void *)objc_opt_self(&OBJC_CLASS___UIAlertAction);
    id v90 = [v89 actionWithTitle:v87 style:0 handler:v88];
    _Block_release(v88);

    NSString v91 = String._bridgeToObjectiveC()();
    NSString v92 = String._bridgeToObjectiveC()();
    id v93 = (id)DDUILocalizedString(v91, v92);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v93);
    uint64_t v95 = v94;

    uint64_t v96 = swift_allocObject(&unk_10000C710, 24LL, 7LL);
    *(void *)(v96 + 16) = v86;
    v97 = (char *)v86;
    NSString v98 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v95);
    v111 = sub_100006DD8;
    uint64_t v112 = v96;
    aBlock = _NSConcreteStackBlock;
    uint64_t v108 = 1107296256LL;
    v109 = sub_100005A34;
    v110 = &unk_10000C728;
    v99 = _Block_copy(&aBlock);
    swift_release(v112);
    id v100 = [v89 actionWithTitle:v98 style:1 handler:v99];
    _Block_release(v99);

    [v79 addAction:v90];
    [v79 addAction:v100];
    v101 = *(void **)&v97[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window];
    if (v101)
    {
      id v102 = v106;
      id v103 = [v101 rootViewController];
      if (v103)
      {
        v104 = v103;
        objc_msgSend(v103, "presentViewController:animated:completion:", v79, 1, 0, v105);
      }
    }

    else
    {
    }

    return;
  }

  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = (id)DDUILocalizedString(v13, v14);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  uint64_t v17 = v16;

  NSString v18 = String._bridgeToObjectiveC()();
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = (id)DDUILocalizedString(v18, v19);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  uint64_t v22 = v21;

  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  id v25 =  [(id)objc_opt_self(UIAlertController) alertControllerWithTitle:v23 message:v24 preferredStyle:1];

  NSString v26 = String._bridgeToObjectiveC()();
  NSString v27 = String._bridgeToObjectiveC()();
  id v28 = (id)DDUILocalizedString(v26, v27);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v30 = v29;

  uint64_t v31 = swift_allocObject(&unk_10000C620, 24LL, 7LL);
  *(void *)(v31 + 16) = v1;
  id v32 = v1;
  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  v111 = sub_10000681C;
  uint64_t v112 = v31;
  aBlock = _NSConcreteStackBlock;
  uint64_t v108 = 1107296256LL;
  v109 = sub_100005A34;
  v110 = &unk_10000C638;
  NSString v34 = _Block_copy(&aBlock);
  swift_release(v112);
  uint64_t v35 = (void *)objc_opt_self(&OBJC_CLASS___UIAlertAction);
  id v36 = [v35 actionWithTitle:v33 style:0 handler:v34];
  _Block_release(v34);

  NSString v37 = String._bridgeToObjectiveC()();
  NSString v38 = String._bridgeToObjectiveC()();
  id v39 = (id)DDUILocalizedString(v37, v38);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  uint64_t v41 = v40;

  uint64_t v42 = swift_allocObject(&unk_10000C670, 24LL, 7LL);
  *(void *)(v42 + 16) = v32;
  __int128 v43 = (char *)v32;
  NSString v44 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v41);
  v111 = sub_100006848;
  uint64_t v112 = v42;
  aBlock = _NSConcreteStackBlock;
  uint64_t v108 = 1107296256LL;
  v109 = sub_100005A34;
  v110 = &unk_10000C688;
  v45 = _Block_copy(&aBlock);
  swift_release(v112);
  id v46 = [v35 actionWithTitle:v44 style:1 handler:v45];
  _Block_release(v45);

  [v25 addAction:v36];
  [v25 addAction:v46];
  v47 = *(void **)&v43[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window];
  if (v47)
  {
    id v48 = [v47 rootViewController];
    if (v48)
    {
      v49 = v48;
      [v48 presentViewController:v25 animated:1 completion:0];
    }
  }
}

id sub_100005750(uint64_t a1, char *a2)
{
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v17 - v6;
  URL.init(string:)( *(void *)&a2[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_newUserURLString],  *(void *)&a2[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_newUserURLString + 8]);
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    id v9 = result;
    sub_1000069BC((uint64_t)v7, (uint64_t)v5, &qword_1000116C0);
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = *(void *)(v10 - 8);
    NSString v13 = 0LL;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1LL, v10) != 1)
    {
      URL._bridgeToObjectiveC()(v12);
      NSString v13 = v14;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
    }

    unint64_t v15 = sub_100005900((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v15);
    [v9 openSensitiveURL:v13 withOptions:isa];

    [a2 devicePickerDidCancelWithReason:0];
    return (id)sub_10000691C((uint64_t)v7, &qword_1000116C0);
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t sub_100005900(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000067DC(&qword_1000116C8);
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
    sub_1000069BC(v7, (uint64_t)&v16, (uint64_t *)&unk_1000116D0);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100006958(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    id v12 = (uint64_t *)(v4[6] + 16 * result);
    *id v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100006A00(&v18, (_OWORD *)(v4[7] + 32 * result));
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

void sub_100005A34(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

id sub_100005A84(uint64_t a1, char *a2, void *a3)
{
  uint64_t v5 = sub_1000067DC(&qword_1000116C0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v12 = *(void *)&a2[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_signInUserURLString];
  uint64_t v11 = *(void *)&a2[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_signInUserURLString + 8];
  id v13 = [a3 identifier];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  uint64_t v16 = v15;

  uint64_t v28 = v12;
  uint64_t v29 = v11;
  swift_bridgeObjectRetain(v11);
  v17._countAndFlagsBits = v14;
  v17._object = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = v29;
  URL.init(string:)(v28, v29);
  swift_bridgeObjectRelease(v18);
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    id v20 = result;
    sub_1000069BC((uint64_t)v10, (uint64_t)v8, &qword_1000116C0);
    uint64_t v21 = type metadata accessor for URL(0LL);
    uint64_t v22 = *(void *)(v21 - 8);
    NSString v24 = 0LL;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v8, 1LL, v21) != 1)
    {
      URL._bridgeToObjectiveC()(v23);
      NSString v24 = v25;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v21);
    }

    unint64_t v26 = sub_100005900((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    [v20 openSensitiveURL:v24 withOptions:isa];

    [a2 devicePickerDidCancelWithReason:0];
    return (id)sub_10000691C((uint64_t)v10, &qword_1000116C0);
  }

  else
  {
    __break(1u);
  }

  return result;
}
}

id sub_100005E80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DevicePickerSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DevicePickerSceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate);
}

void sub_100005F30(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window);
  if (v3)
  {
    id v4 = [v3 windowScene];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = [v4 _FBSScene];

      if (v6)
      {
        uint64_t v11 = &_swiftEmptySetSingleton;
        id v7 =   [(id)objc_opt_self(DDDevicePickerDismissSceneAction) actionWithResult:a1];
        sub_100007D30((Swift::Int *)&v10, v7);

        uint64_t v8 = v11;
        sub_100006654();
        sub_100006690();
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v8);
        [v6 sendActions:isa];
      }
    }
  }

void sub_100006088(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)aBlock - v10;
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window);
  if (v12)
  {
    id v13 = [v12 windowScene];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = [v13 _FBSScene];

      if (v15)
      {
        uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
        v16(v11, a1, v5);
        v16(v9, a2, v5);
        uint64_t v17 = *(unsigned __int8 *)(v6 + 80);
        uint64_t v18 = (v17 + 16) & ~v17;
        uint64_t v19 = (v7 + v17 + v18) & ~v17;
        uint64_t v20 = swift_allocObject(&unk_10000C5A8, v19 + v7, v17 | 7);
        uint64_t v21 = v20 + v18;
        uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
        v22(v21, v11, v5);
        v22(v20 + v19, v9, v5);
        uint64_t v23 = swift_allocObject(&unk_10000C5D0, 32LL, 7LL);
        *(void *)(v23 + 16) = sub_10000675C;
        *(void *)(v23 + 24) = v20;
        aBlock[4] = sub_1000067BC;
        uint64_t v28 = v23;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256LL;
        aBlock[2] = sub_100006E24;
        aBlock[3] = &unk_10000C5E8;
        NSString v24 = _Block_copy(aBlock);
        uint64_t v25 = v28;
        swift_retain(v20);
        swift_retain(v23);
        swift_release(v25);
        [v15 updateClientSettingsWithBlock:v24];

        _Block_release(v24);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v23, "", 127LL, 220LL, 36LL, 1LL);
        swift_release_n(v20, 2LL);
        swift_release(v23);
        if ((isEscapingClosureAtFileLocation & 1) != 0) {
          __break(1u);
        }
      }
    }
  }

void sub_1000062CC(void *a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___DDDevicePickerMutableSceneClientSettings);
  uint64_t v3 = swift_dynamicCastObjCClass(a1, v2);
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = a1;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v4 setEndpointUUID:isa];

    Class v7 = UUID._bridgeToObjectiveC()().super.isa;
    [v4 setAgentUUID:v7];
  }

void sub_100006468(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window);
  if (v3)
  {
    id v4 = [v3 windowScene];
    if (v4)
    {
      id v5 = v4;
      id v13 = [v4 _FBSScene];

      if (v13)
      {
        id v6 = [v13 hostAuditToken];
        if (v6)
        {
          id v7 = v6;
          NSString v8 = String._bridgeToObjectiveC()();
          unsigned __int8 v9 = [v7 hasEntitlement:v8];

          if ((v9 & 1) != 0)
          {
            id v15 = &_swiftEmptySetSingleton;
            id v10 =   [(id)objc_opt_self(DDDevicePickerDebugErrorAction) actionWithDebugError:a1];
            sub_100007D30((Swift::Int *)&v14, v10);

            uint64_t v11 = v15;
            sub_100006654();
            sub_100006690();
            Class isa = Set._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v11);
            [v13 sendActions:isa];

            return;
          }
        }
      }
    }
  }

unint64_t sub_100006654()
{
  unint64_t result = qword_100011840;
  if (!qword_100011840)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___BSAction);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011840);
  }

  return result;
}

unint64_t sub_100006690()
{
  unint64_t result = qword_1000116A0;
  if (!qword_1000116A0)
  {
    unint64_t v1 = sub_100006654();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000116A0);
  }

  return result;
}

uint64_t sub_1000066D8()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v0 + v4, v1);
  v9(v0 + v7, v1);
  return swift_deallocObject(v0, v8, v6);
}

void sub_10000675C(void *a1)
{
}

uint64_t sub_1000067AC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000067BC(uint64_t a1)
{
  return sub_100006E04(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1000067C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000067D4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000067DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

id sub_10000681C(uint64_t a1)
{
  return sub_100005750(a1, *(char **)(v1 + 16));
}

uint64_t sub_100006824()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_100006848()
{
  return [*(id *)(v0 + 16) devicePickerDidCancelWithReason:0];
}

uint64_t sub_10000685C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000067DC(&qword_1000116A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000068A4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_1000068D0(uint64_t a1)
{
  return sub_100005A84(a1, *(char **)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_1000068D8()
{
  unint64_t result = qword_1000116B8;
  if (!qword_1000116B8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000116B8);
  }

  return result;
}

uint64_t sub_10000691C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000067DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_100006958(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100006A10(a1, a2, v5);
}

uint64_t sub_1000069BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000067DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006A00(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        id v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

void sub_100006AF0(void *a1)
{
  uint64_t v7 = &_swiftEmptySetSingleton;
  id v5 = [(id)objc_opt_self(DDDevicePickerDismissSceneAction) actionWithResult:-1];
  sub_100007D30((Swift::Int *)&v6, v5);

  id v2 = [a1 _FBSScene];
  uint64_t v3 = v7;
  sub_100006654();
  sub_100006690();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  [v2 sendActions:isa];
}

void sub_100006BD8(void *a1, void *a2)
{
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t v6 = swift_dynamicCastObjCClass(a1, v5);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_allocWithZone(&OBJC_CLASS___UIWindow);
    id v21 = a1;
    id v9 = [v8 initWithWindowScene:v7];
    id v10 = *(void **)(v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window) = v9;
    id v11 = v9;

    id v12 = [(id)objc_opt_self(PBSUserProfileManager) sharedInstance];
    id v13 = [v12 uncachedUserProfilesSnapshot];

    if (v13)
    {
      id v14 = [v13 primaryUserProfile];

      if (v14 && (id v15 = [v14 iCloudAltDSID], v14, v15))
      {

        id v16 = sub_100004824(a2, v21);
        uint64_t v17 = v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_hostViewController;
        swift_unknownObjectWeakAssign(v17, v16);

        Strong = (void *)swift_unknownObjectWeakLoadStrong(v17, v18);
        [v11 setRootViewController:Strong];

        [v11 makeKeyAndVisible];
      }

      else
      {
        id v20 = [objc_allocWithZone(UIViewController) init];
        [v11 setRootViewController:v20];

        [v11 makeKeyAndVisible];
        sub_100004BC4();
      }
    }

    else
    {
      __break(1u);
    }
  }

uint64_t sub_100006E04(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_100006E24(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_100006E58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = type metadata accessor for Logger(0LL, a2);
  sub_100008CAC(v2, qword_1000118F8);
  sub_100008C94(v2, (uint64_t)qword_1000118F8);
  return Logger.init(subsystem:category:)( 0xD00000000000001BLL,  0x8000000100009B00LL,  0xD000000000000019LL,  0x80000001000095A0LL);
}

void *sub_100006F1C(void *a1, id a2)
{
  id v5 = [a2 _FBSScene];
  id v6 = [a1 role];
  uint64_t v7 = UISceneSessionRolePeoplePicker;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  if (v8 == v11 && v10 == v12)
  {

    swift_bridgeObjectRelease_n(v10, 2LL);
  }

  else
  {
    uint64_t v14 = v12;
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, v11, v12, 0LL);

    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v14);
    if ((v15 & 1) == 0) {
      goto LABEL_15;
    }
  }

  id v16 = [v5 hostAuditToken];
  if (!v16)
  {
LABEL_15:
    sub_100008B64(a2);

    return 0LL;
  }

  uint64_t v17 = v16;
  uint64_t v18 = sub_100008C5C(0LL, &qword_100011858, &OBJC_CLASS___DDUIPeopleHostViewController_ptr);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v18);
  id v20 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [(id)objc_opt_self(UIStoryboard) storyboardWithName:v21 bundle:v20];

  id v23 = [v22 instantiateInitialViewController];
  if (!v23)
  {
LABEL_17:
    sub_100008B64(a2);

    return 0LL;
  }

  NSString v24 = v23;
  uint64_t v25 = objc_opt_self(&OBJC_CLASS___DDUIPeopleHostViewController);
  uint64_t v26 = swift_dynamicCastObjCClass(v24, v25);
  if (!v26)
  {

    goto LABEL_17;
  }

  NSString v27 = (void *)v26;
  [v17 realToken];
  __int128 v42 = v46;
  __int128 v43 = v45;
  uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___LSBundleRecord);
  id v44 = 0LL;
  __int128 v45 = v43;
  __int128 v46 = v42;
  id v29 = [v28 bundleRecordForAuditToken:&v45 error:&v44];
  id v30 = v44;
  if (!v29)
  {
    id v39 = v44;
    uint64_t v40 = _convertNSErrorToError(_:)(v30);

    swift_willThrow();
    swift_errorRelease(v40);
LABEL_20:
    objc_msgSend(v2, "devicePickerDidCancelWithReason:", -2, v42, v43);

    return 0LL;
  }

  uint64_t v31 = v29;
  id v32 = v44;
  id v33 = [v31 bundleIdentifier];
  if (!v33)
  {

    goto LABEL_20;
  }

  [v27 setPresenter:v2];
  [v27 setBundleAuditToken:v17];
  id v34 = [v5 settings];
  uint64_t v35 = objc_opt_self(&OBJC_CLASS___DDPeoplePickerSceneSettings);
  id v36 = (void *)swift_dynamicCastObjCClass(v34, v35);
  NSString v37 = v36;
  if (v36)
  {
    id v38 = [v36 isDedicatedDevicePicker];
  }

  else
  {

    id v38 = 0LL;
  }

  objc_msgSend(v27, "setShowDedicatedPickerUI:", v38, v42, v43);

  return v27;
}

id sub_100007514()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeoplePickerSceneDelegate(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000075A8()
{
  return type metadata accessor for PeoplePickerSceneDelegate(0LL);
}

uint64_t type metadata accessor for PeoplePickerSceneDelegate(uint64_t a1)
{
  uint64_t result = qword_1000117D0;
  if (!qword_1000117D0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PeoplePickerSceneDelegate);
  }
  return result;
}

uint64_t sub_1000075EC(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for Logger(319LL, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = "\b";
    v5[2] = &unk_1000095F8;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v5, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void sub_10000766C(uint64_t a1)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window);
  if (v3)
  {
    id v4 = [v3 windowScene];
    if (v4)
    {
      id v5 = v4;
      id v6 = [v4 _FBSScene];

      if (v6)
      {
        uint64_t v11 = &_swiftEmptySetSingleton;
        id v7 =   [(id)objc_opt_self(DDDevicePickerDismissSceneAction) actionWithResult:a1];
        sub_100007D30((Swift::Int *)&v10, v7);

        uint64_t v8 = v11;
        sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
        sub_100006690();
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v8);
        [v6 sendActions:isa];
      }
    }
  }

void sub_1000077D4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window);
  if (v6)
  {
    id v7 = [v6 windowScene];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 _FBSScene];

      if (v9)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))( (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v3);
        uint64_t v10 = *(unsigned __int8 *)(v4 + 80);
        uint64_t v11 = (v10 + 16) & ~v10;
        uint64_t v12 = swift_allocObject(&unk_10000C760, v11 + v5, v10 | 7);
        (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))( v12 + v11,  (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v3);
        uint64_t v13 = swift_allocObject(&unk_10000C788, 32LL, 7LL);
        *(void *)(v13 + 16) = sub_100008AE0;
        *(void *)(v13 + 24) = v12;
        aBlock[4] = sub_100008B2C;
        uint64_t v18 = v13;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256LL;
        aBlock[2] = sub_100006E24;
        aBlock[3] = &unk_10000C7A0;
        uint64_t v14 = _Block_copy(aBlock);
        uint64_t v15 = v18;
        swift_retain(v12);
        swift_retain(v13);
        swift_release(v15);
        [v9 updateClientSettingsWithBlock:v14];

        _Block_release(v14);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v13, "", 127LL, 152LL, 36LL, 1LL);
        swift_release_n(v12, 2LL);
        swift_release(v13);
        if ((isEscapingClosureAtFileLocation & 1) != 0) {
          __break(1u);
        }
      }
    }
  }

void sub_1000079C4(void *a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___DDPeoplePickerMutableSceneClientSettings);
  uint64_t v3 = swift_dynamicCastObjCClass(a1, v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = a1;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v4 setConnectedDeviceUUID:isa];
  }

void sub_100007B34(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window);
  if (v3)
  {
    id v4 = [v3 windowScene];
    if (v4)
    {
      id v5 = v4;
      id v13 = [v4 _FBSScene];

      if (v13)
      {
        id v6 = [v13 hostAuditToken];
        if (v6)
        {
          id v7 = v6;
          NSString v8 = String._bridgeToObjectiveC()();
          unsigned __int8 v9 = [v7 hasEntitlement:v8];

          if ((v9 & 1) != 0)
          {
            uint64_t v15 = &_swiftEmptySetSingleton;
            id v10 =   [(id)objc_opt_self(DDDevicePickerDebugErrorAction) actionWithDebugError:a1];
            sub_100007D30((Swift::Int *)&v14, v10);

            uint64_t v11 = v15;
            sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
            sub_100006690();
            Class isa = Set._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v11);
            [v13 sendActions:isa];

            return;
          }
        }
      }
    }
  }

uint64_t sub_100007D30(Swift::Int *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v2);
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      uint64_t v31 = v9;
      uint64_t v10 = sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v23 = sub_100007FCC(v7, result + 1);
    Swift::Int v32 = v23;
    unint64_t v24 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v24)
    {
      uint64_t v29 = v24 + 1;
      id v30 = v8;
      sub_1000081C0(v29);
      uint64_t v25 = v32;
    }

    else
    {
      uint64_t v25 = v23;
      id v26 = v8;
    }

    sub_10000845C((uint64_t)v8, v25);
    uint64_t v28 = *v3;
    *uint64_t v3 = v25;
  }

  else
  {
    Swift::Int v12 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v13 = NSObject._rawHashValue(seed:)(v12);
    uint64_t v14 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v15 = v13 & ~v14;
    if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
    {
      sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
      id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
      char v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        NSString v21 = *(void **)(*(void *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        id v22 = v21;
        return 0LL;
      }

      uint64_t v18 = ~v14;
      while (1)
      {
        unint64_t v15 = (v15 + 1) & v18;
        if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
          break;
        }
        id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
        char v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v32 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_1000084DC((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v28 = *v3;
    *uint64_t v3 = v32;
  }

  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_100007FCC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000067DC(&qword_100011850);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_1000081C0(v16 + 1);
          uint64_t v4 = v23;
        }

        uint64_t v9 = v22;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v11 = v4 + 56;
        uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v13 = result & ~v12;
        unint64_t v14 = v13 >> 6;
        if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v17 = 0;
          unint64_t v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v19 = v14 == v18;
            if (v14 == v18) {
              unint64_t v14 = 0LL;
            }
            v17 |= v19;
            uint64_t v20 = *(void *)(v11 + 8 * v14);
          }

          while (v20 == -1);
          unint64_t v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }

        *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()();
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v4;
}

Swift::Int sub_1000081C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_1000067DC(&qword_100011850);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    id v30 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v8 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1LL << v7);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v3 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }

      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_36;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_36;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v30;
                uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
                if (v29 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v8 = -1LL << v29;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v14 >= v11) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v14 = v20;
            }
          }
        }

LABEL_26:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
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
            goto LABEL_41;
          }

          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    uint64_t v21 = *(void *)(v6 + 40);
    uint64_t v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    Swift::Int result = NSObject._rawHashValue(seed:)(v21);
    unint64_t v23 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v24 = result & ~v23;
    char v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      unint64_t v26 = 0;
      BOOL v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v28 = v25 == v27;
        if (v25 == v27) {
          char v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

unint64_t sub_10000845C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1000084DC(uint64_t a1, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000081C0(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_100008660();
      goto LABEL_14;
    }

    sub_100008808(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
    id v14 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
    char v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
        char v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

LABEL_14:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}

id sub_100008660()
{
  uint64_t v1 = v0;
  sub_1000067DC(&qword_100011850);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    id v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100008808(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_1000067DC(&qword_100011850);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  id v30 = v2;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100008A80()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100008AE0(void *a1)
{
}

uint64_t sub_100008B1C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100008B2C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100008B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008B5C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100008B64(void *a1)
{
  uint64_t v7 = &_swiftEmptySetSingleton;
  id v5 = [(id)objc_opt_self(DDDevicePickerDismissSceneAction) actionWithResult:-1];
  sub_100007D30((Swift::Int *)&v6, v5);

  id v2 = [a1 _FBSScene];
  uint64_t v3 = v7;
  sub_100008C5C(0LL, (unint64_t *)&qword_100011840, &OBJC_CLASS___BSAction_ptr);
  sub_100006690();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  [v2 sendActions:isa];
}

uint64_t sub_100008C5C(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100008C94(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008CAC(uint64_t a1, uint64_t *a2)
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

void sub_100008CEC(void *a1, void *a2)
{
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t v6 = swift_dynamicCastObjCClass(a1, v5);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_allocWithZone(&OBJC_CLASS___UIWindow);
    id v9 = a1;
    id v10 = [v8 initWithWindowScene:v7];
    int64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window) = v10;
    id v16 = v10;

    uint64_t v12 = sub_100006F1C(a2, v9);
    uint64_t v13 = v2 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_peopleHostViewController;
    swift_unknownObjectWeakAssign(v13, v12);

    Strong = (void *)swift_unknownObjectWeakLoadStrong(v13, v14);
    [v16 setRootViewController:Strong];

    [v16 makeKeyAndVisible];
  }

uint64_t sub_100008E0C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC23NetworkEndpointPickerUIP33_51ADEFA7FF6128C019A10B3D93FC738519ResourceBundleClass);
}