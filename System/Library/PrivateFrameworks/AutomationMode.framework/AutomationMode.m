uint64_t sub_1000014FC()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_10000330C(v0, qword_100010A38);
  sub_1000032F4(v0, (uint64_t)qword_100010A38);
  if (qword_100010A50 != -1) {
    swift_once(&qword_100010A50, sub_1000034A0);
  }
  return Logger.init(_:)((id)qword_100010E30);
}

id sub_10000157C()
{
  v1 = v0;
  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_1000032F4(v2, (uint64_t)qword_100010A38);
  v3 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tearing down Reader", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Reader(0LL);
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_1000017D0(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

int main(int argc, const char **argv, const char **envp)
{
}

id sub_1000018CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, double a9, uint64_t a10, _BYTE *a11)
{
  v27[3] = type metadata accessor for LocalAuthenticationWrapper();
  v27[4] = &off_10000C6A0;
  v27[0] = a8;
  *(_DWORD *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_lock] = 0;
  *(void *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope] = kCFPreferencesAnyUser;
  v20 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_dataVaultPath];
  void *v20 = a1;
  v20[1] = a2;
  v21 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath];
  void *v21 = a3;
  v21[1] = a4;
  v22 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath];
  void *v22 = a5;
  v22[1] = a6;
  a11[OBJC_IVAR____TtC21automationmode_writer6Writer_enforcesClientEntitlement] = a7;
  sub_10000345C((uint64_t)v27, (uint64_t)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_authorizationManager]);
  *(double *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout] = a9;
  sub_10000338C(a10, (uint64_t)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID]);
  v26.receiver = a11;
  v26.super_class = (Class)type metadata accessor for Writer(0LL);
  v23 = (id)kCFPreferencesAnyUser;
  id v24 = objc_msgSendSuper2(&v26, "init");
  sub_1000033D4(a10);
  sub_10000343C(v27);
  return v24;
}

uint64_t sub_100001A40(void *a1, uint64_t a2)
{
  uint64_t v83 = a2;
  sub_10000334C((uint64_t *)&unk_100010BB0);
  __chkstk_darwin();
  os_log_type_t v4 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin();
  v81 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_1000032F4(v6, (uint64_t)qword_100010A38);
  v8 = a1;
  v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  v12 = &Writer;
  v82 = v4;
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)v13 = 136446210;
    v91[0] = v14;
    uint64_t v15 = *(void *)&v8[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath];
    unint64_t v16 = *(void *)&v8[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath + 8];
    swift_bridgeObjectRetain(v16);
    uint64_t v88 = sub_1000075A0(v15, v16, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, v89, v13 + 4, v13 + 12);

    unint64_t v17 = v16;
    v12 = &Writer;
    swift_bridgeObjectRelease(v17);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Reader client asked if automation mode is enabled, checking for state file at %{public}s",  v13,  0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
  }

  v18 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v19 = [v18 defaultManager];
  v20 = (uint64_t *)&v8[v12[337].count];
  uint64_t v22 = *v20;
  unint64_t v21 = v20[1];
  NSString v23 = String._bridgeToObjectiveC()();
  unsigned int v24 = [v19 fileExistsAtPath:v23];

  v25 = v8;
  objc_super v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.info.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  if (v24)
  {
    uint64_t v80 = v22;
    id v78 = v18;
    if (v28)
    {
      v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v30 = swift_slowAlloc(32LL, -1LL);
      v91[0] = v30;
      *(_DWORD *)v29 = 136446210;
      swift_bridgeObjectRetain(v21);
      uint64_t v88 = sub_1000075A0(v80, v21, v91);
      uint64_t v22 = v80;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, v89, v29 + 4, v29 + 12);

      swift_bridgeObjectRelease(v21);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "State file exists at path %{public}s", v29, 0xCu);
      swift_arrayDestroy(v30, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1LL, -1LL);
      swift_slowDealloc(v29, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v86 = 0LL;
    unint64_t v87 = 0xE000000000000000LL;
    v33 = v81;
    static String.Encoding.utf8.getter();
    uint64_t v34 = String.init(contentsOfFile:encoding:)(v22, v21, v33);
    uint64_t v79 = v7;
    uint64_t v86 = v34;
    unint64_t v87 = v36;
    v37 = (os_log_s *)Logger.logObject.getter(v34);
    uint64_t v38 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v37, (os_log_type_t)v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v40 = swift_slowAlloc(32LL, -1LL);
      v91[0] = v40;
      *(_DWORD *)v39 = 136446210;
      swift_beginAccess(&v86, &v88, 0LL, 0LL);
      uint64_t v41 = v86;
      unint64_t v42 = v87;
      swift_bridgeObjectRetain(v87);
      id v90 = (id)sub_1000075A0(v41, v42, v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, v91, v39 + 4, v39 + 12);
      swift_bridgeObjectRelease(v42);
      _os_log_impl( (void *)&_mh_execute_header,  v37,  (os_log_type_t)v38,  "Read boot session id from automation mode state file: %{public}s",  v39,  0xCu);
      swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v39, -1LL, -1LL);
    }

    uint64_t v43 = (uint64_t)v82;
    swift_beginAccess(&v86, v91, 0LL, 0LL);
    uint64_t v45 = v86;
    unint64_t v44 = v87;
    sub_10000338C((uint64_t)&v25[OBJC_IVAR____TtC21automationmode_writer6Reader_bootSessionUUID], v43);
    uint64_t v46 = type metadata accessor for UUID(0LL);
    uint64_t v47 = *(void *)(v46 - 8);
    int v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v43, 1LL, v46);
    uint64_t v49 = swift_bridgeObjectRetain(v44);
    if (v48 == 1)
    {
      sub_1000033D4(v43);
      uint64_t v50 = v86;
      unint64_t v51 = v87;
      swift_bridgeObjectRetain(v87);
    }

    else
    {
      uint64_t v50 = UUID.uuidString.getter(v49);
      unint64_t v51 = v52;
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v43, v46);
    }

    if (v45 == v50 && v44 == v51)
    {
      swift_bridgeObjectRelease_n(v44, 2LL);
    }

    else
    {
      char v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v44, v50, v51, 0LL);
      swift_bridgeObjectRelease(v51);
      swift_bridgeObjectRelease(v44);
      if ((v53 & 1) == 0)
      {
        v55 = v25;
        v56 = (os_log_s *)Logger.logObject.getter(v55);
        os_log_type_t v57 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          v59 = (void *)swift_slowAlloc(32LL, -1LL);
          id v90 = v59;
          *(_DWORD *)v58 = 136446210;
          swift_bridgeObjectRetain(v21);
          uint64_t v84 = sub_1000075A0(v80, v21, (uint64_t *)&v90);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v58 + 4, v58 + 12);

          swift_bridgeObjectRelease(v21);
          _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "Removing expired state file at path %{public}s",  v58,  0xCu);
          swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v59, -1LL, -1LL);
          swift_slowDealloc(v58, -1LL, -1LL);
        }

        else
        {
        }

        id v60 = objc_msgSend(v78, "defaultManager", v78, v79);
        NSString v61 = String._bridgeToObjectiveC()();
        id v90 = 0LL;
        unsigned int v62 = [v60 removeItemAtPath:v61 error:&v90];

        id v63 = v90;
        if (v62)
        {
          id v64 = v90;
        }

        else
        {
          id v65 = v90;
          uint64_t v66 = _convertNSErrorToError(_:)(v63);

          swift_willThrow();
          v67 = v55;
          swift_errorRetain(v66);
          v68 = v67;
          uint64_t v69 = swift_errorRetain(v66);
          v70 = (os_log_s *)Logger.logObject.getter(v69);
          os_log_type_t v71 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v70, v71))
          {
            uint64_t v72 = swift_slowAlloc(22LL, -1LL);
            v73 = (void *)swift_slowAlloc(64LL, -1LL);
            id v90 = v73;
            *(_DWORD *)uint64_t v72 = 136446466;
            swift_bridgeObjectRetain(v21);
            uint64_t v84 = sub_1000075A0(v80, v21, (uint64_t *)&v90);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v72 + 4, v72 + 12);

            swift_bridgeObjectRelease(v21);
            *(_WORD *)(v72 + 12) = 2082;
            uint64_t v84 = v66;
            swift_errorRetain(v66);
            uint64_t v74 = sub_10000334C(&qword_100010DF0);
            uint64_t v75 = String.init<A>(describing:)(&v84, v74);
            unint64_t v77 = v76;
            uint64_t v84 = sub_1000075A0(v75, v76, (uint64_t *)&v90);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v72 + 14, v72 + 22);
            swift_bridgeObjectRelease(v77);
            swift_errorRelease(v66);
            swift_errorRelease(v66);
            _os_log_impl( (void *)&_mh_execute_header,  v70,  v71,  "Failed to remove expired automation mode state file at %{public}s: %{public}s",  (uint8_t *)v72,  0x16u);
            swift_arrayDestroy(v73, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v73, -1LL, -1LL);
            swift_slowDealloc(v72, -1LL, -1LL);

            swift_errorRelease(v66);
          }

          else
          {
            swift_errorRelease(v66);

            swift_errorRelease(v66);
            swift_errorRelease(v66);
          }
        }

        v54 = *(void (**)(void))(v83 + 16);
        goto LABEL_34;
      }
    }

    v54 = *(void (**)(void))(v83 + 16);
LABEL_34:
    v54();
    return swift_bridgeObjectRelease(v87);
  }

  if (v28)
  {
    v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    v91[0] = v32;
    *(_DWORD *)v31 = 136446210;
    swift_bridgeObjectRetain(v21);
    uint64_t v88 = sub_1000075A0(v22, v21, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, v89, v31 + 4, v31 + 12);

    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "State file does not exist at path %{public}s", v31, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(uint64_t, void))(v83 + 16))(v83, 0LL);
}

uint64_t sub_100002680(char *a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v6 = *(void *)&a1[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath];
  unint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath + 8];
  NSString v7 = String._bridgeToObjectiveC()();
  unsigned int v8 = [v4 fileExistsAtPath:v7];

  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  sub_1000032F4(v9, (uint64_t)qword_100010A38);
  os_log_type_t v10 = a1;
  BOOL v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc(18LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136446466;
    swift_bridgeObjectRetain(v5);
    uint64_t v16 = sub_1000075A0(v6, v5, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v5);
    *(_WORD *)(v13 + 12) = 1024;
    LODWORD(v16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, (char *)&v16 + 4, v13 + 14, v13 + 18);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Reader client asked if automation mode requires user authentication, checked for file at %{public}s, exists: %{BOOL}d",  (uint8_t *)v13,  0x12u);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v8 ^ 1);
}

uint64_t sub_1000028A8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_1000032F4(v4, (uint64_t)qword_100010A38);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    unsigned int v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received reader connection request", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  [a1 setExportedObject:v2];
  id v9 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL___AutomationModeReaderProtocol];
  [a1 setExportedInterface:v9];

  [a1 resume];
  return 1LL;
}

id sub_1000029F4()
{
  uint64_t v0 = sub_10000334C((uint64_t *)&unk_100010BB0);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = (id)XAMAutomationModeDataVaultPath(v1);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v66 = v6;
  id v67 = (id)v5;

  id v7 = (id)XAMAutomationModeStateFilePath();
  uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  unint64_t v9 = v8;

  id v10 = (id)XAMAutomationModeDoesNotRequireAuthenticationFilePath();
  uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v72 = v11;

  id v12 = (id)XAMAutomationModeWriterMachServiceName();
  uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  unint64_t v14 = v13;

  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_1000032F4(v15, (uint64_t)qword_100010A38);
  swift_bridgeObjectRetain_n(v9, 2LL);
  uint64_t v17 = swift_bridgeObjectRetain_n(v14, 2LL);
  uint64_t v69 = v16;
  v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = swift_slowAlloc(64LL, -1LL);
    v75[0] = v21;
    *(_DWORD *)uint64_t v20 = 136446466;
    swift_bridgeObjectRetain(v9);
    uint64_t v73 = sub_1000075A0(v71, v9, v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease_n(v9, 3LL);
    *(_WORD *)(v20 + 12) = 2082;
    swift_bridgeObjectRetain(v14);
    uint64_t v73 = sub_1000075A0(v68, v14, v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease_n(v14, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "AutomationMode writer daemon launched with state file %{public}s, mach service name %{public}s.",  (uint8_t *)v20,  0x16u);
    swift_arrayDestroy(v21, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v14, 2LL);
    swift_bridgeObjectRelease_n(v9, 2LL);
  }

  uint64_t v22 = type metadata accessor for LocalAuthenticationWrapper();
  uint64_t v23 = swift_allocObject(v22, 16LL, 7LL);
  uint64_t v24 = qword_100010A70;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v72);
  if (v24 != -1) {
    swift_once(&qword_100010A70, sub_100005234);
  }
  double v25 = *(double *)&qword_100010E48;
  if (qword_100010A80 != -1) {
    swift_once(&qword_100010A80, sub_100006290);
  }
  uint64_t v65 = sub_1000032F4(v0, (uint64_t)qword_100010E58);
  sub_10000338C(v65, (uint64_t)v3);
  uint64_t v76 = v22;
  unint64_t v77 = &off_10000C6A0;
  v75[0] = v23;
  objc_super v26 = objc_allocWithZone((Class)type metadata accessor for Writer(0LL));
  uint64_t v27 = sub_100003414((uint64_t)v75, v76);
  __chkstk_darwin(v27);
  v29 = (uint64_t *)((char *)&v65 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  uint64_t v31 = *v29;
  swift_retain(v23);
  id v32 = sub_1000018CC((uint64_t)v67, v66, v71, v9, v70, v72, 1, v31, v25, (uint64_t)v3, v26);
  sub_10000343C(v75);
  swift_release(v23);
  v33 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v34 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  id v35 = v32;
  NSString v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  id v37 = [v34 initWithMachServiceName:v36];

  id v38 = v37;
  [v38 setDelegate:v35];

  [v38 resume];
  id v39 = (id)XAMAutomationModeReaderMachServiceName();
  uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  unint64_t v41 = v40;

  uint64_t v42 = swift_bridgeObjectRetain_n(v41, 2LL);
  uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc(12LL, -1LL);
    id v67 = v35;
    uint64_t v46 = (uint8_t *)v45;
    uint64_t v47 = swift_slowAlloc(32LL, -1LL);
    v75[0] = v47;
    *(_DWORD *)uint64_t v46 = 136446210;
    swift_bridgeObjectRetain(v41);
    uint64_t v73 = sub_1000075A0(v68, v41, v75);
    v33 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v46 + 4, v46 + 12);
    swift_bridgeObjectRelease_n(v41, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "AutomationMode reader listening to mach service name %{public}s",  v46,  0xCu);
    swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v47, -1LL, -1LL);
    int v48 = v46;
    id v35 = v67;
    swift_slowDealloc(v48, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v41, 2LL);
  }

  sub_10000338C(v65, (uint64_t)v3);
  uint64_t v49 = (objc_class *)type metadata accessor for Reader(0LL);
  uint64_t v50 = (char *)objc_allocWithZone(v49);
  unint64_t v51 = &v50[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath];
  *(void *)unint64_t v51 = v71;
  *((void *)v51 + 1) = v9;
  unint64_t v52 = &v50[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath];
  uint64_t v53 = v72;
  *(void *)unint64_t v52 = v70;
  *((void *)v52 + 1) = v53;
  sub_10000338C((uint64_t)v3, (uint64_t)&v50[OBJC_IVAR____TtC21automationmode_writer6Reader_bootSessionUUID]);
  v74.receiver = v50;
  v74.super_class = v49;
  id v54 = objc_msgSendSuper2(&v74, "init");
  sub_1000033D4((uint64_t)v3);
  id v55 = objc_allocWithZone((Class)v33[93]);
  id v56 = v54;
  NSString v57 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v41);
  id v58 = [v55 initWithMachServiceName:v57];

  id v59 = v58;
  [v59 setDelegate:v56];

  [v59 resume];
  NSString v61 = (os_log_s *)Logger.logObject.getter(v60);
  os_log_type_t v62 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v61, v62))
  {
    id v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v63 = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "Waiting for connections", v63, 2u);
    swift_slowDealloc(v63, -1LL, -1LL);
  }

  return v35;
}

uint64_t sub_100003178()
{
  return type metadata accessor for Reader(0LL);
}

uint64_t type metadata accessor for Reader(uint64_t a1)
{
  uint64_t result = qword_100010B88;
  if (!qword_100010B88) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Reader);
  }
  return result;
}

void sub_1000031BC(uint64_t a1)
{
  v4[0] = &unk_100009E90;
  v4[1] = &unk_100009E90;
  sub_100003234(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
  }
}

void sub_100003234(uint64_t a1)
{
  if (!qword_100010D50)
  {
    uint64_t v2 = type metadata accessor for UUID(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100010D50);
    }
  }

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_1000032B0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_1000032F4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000330C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000334C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000338C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000334C((uint64_t *)&unk_100010BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000033D4(uint64_t a1)
{
  uint64_t v2 = sub_10000334C((uint64_t *)&unk_100010BB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100003414(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_10000343C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000345C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000034A0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000022LL,  0x800000010000A450LL,  0x746C7561666544LL,  0xE700000000000000LL);
  qword_100010E30 = result;
  return result;
}

uint64_t sub_10000350C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000330C(v0, qword_100010C20);
  sub_1000032F4(v0, (uint64_t)qword_100010C20);
  if (qword_100010A50 != -1) {
    swift_once(&qword_100010A50, sub_1000034A0);
  }
  return Logger.init(_:)((id)qword_100010E30);
}

unint64_t sub_10000358C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000334C(&qword_100010DF8);
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
    sub_1000095B8(v7, (uint64_t)v16, &qword_100010E00);
    unint64_t result = sub_100007C44((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_100009538(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
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

unint64_t sub_1000036CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000334C(&qword_100010E08);
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
    sub_1000095B8(v7, (uint64_t)&v16, (uint64_t *)&unk_100010E10);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100007BE0(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    __int128 v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100009538(&v18, (_OWORD *)(v4[7] + 32 * result));
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

id sub_100003800(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, void *a5)
{
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    sub_1000032F4(v8, (uint64_t)qword_100010C20);
    swift_errorRetain(a2);
    uint64_t v9 = swift_errorRetain(a2);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v20 = a5;
      __int128 v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v13 = swift_slowAlloc(32LL, -1LL);
      uint64_t v21 = a2;
      uint64_t v22 = v13;
      *(_DWORD *)__int128 v12 = 136446210;
      swift_errorRetain(a2);
      uint64_t v14 = sub_10000334C(&qword_100010DF0);
      uint64_t v15 = String.init<A>(describing:)(&v21, v14);
      unint64_t v17 = v16;
      uint64_t v21 = sub_1000075A0(v15, v16, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v12 + 4, v12 + 12);
      unint64_t v18 = v17;
      a5 = v20;
      swift_bridgeObjectRelease(v18);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Provided authorization failed evaluation of device owner policy with error %{public}s",  v12,  0xCu);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);

      swift_errorRelease(a2);
    }

    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }
  }

  a3(a2);
  return [a5 invalidate];
}

uint64_t sub_100003A14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v6 = 0LL;
  }
  swift_retain(v4);
  id v7 = a3;
  v5(v6, a3);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100003AA8()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for LocalAuthenticationWrapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC21automationmode_writer26LocalAuthenticationWrapper);
}

id sub_100003AD8()
{
  uint64_t v1 = v0;
  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_1000032F4(v2, (uint64_t)qword_100010C20);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Tearing down Writer", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for Writer(0LL);
  return objc_msgSendSuper2(&v8, "dealloc");
}

uint64_t sub_100003D50()
{
  return type metadata accessor for Writer(0LL);
}

uint64_t type metadata accessor for Writer(uint64_t a1)
{
  uint64_t result = qword_100010D40;
  if (!qword_100010D40) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Writer);
  }
  return result;
}

uint64_t sub_100003D94(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  v159 = *(os_log_s **)(v4 - 8);
  uint64_t v160 = v4;
  __chkstk_darwin(v4);
  v158 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000334C((uint64_t *)&unk_100010BB0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v148 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v157 = (uint64_t)&v148 - v10;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v162 = *(void *)(v11 - 8);
  uint64_t v163 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v148 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v148 - v15;
  uint64_t v168 = type metadata accessor for Logger(0LL);
  uint64_t v17 = *(void *)(v168 - 8);
  uint64_t v18 = __chkstk_darwin(v168);
  v155 = (char *)&v148 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  v156 = (char *)&v148 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v148 - v23;
  __chkstk_darwin(v22);
  objc_super v26 = (char *)&v148 - v25;
  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  id v161 = v24;
  v153 = v9;
  v165 = v16;
  uint64_t v27 = v168;
  uint64_t v28 = sub_1000032F4(v168, (uint64_t)qword_100010C20);
  v164 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v29 = v164(v26, v28, v27);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v166 = v28;
  v154 = v14;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc(12LL, -1LL);
    v167 = v2;
    id v34 = (uint8_t *)v33;
    int v35 = a1;
    NSString v36 = (void *)swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)id v34 = 136446210;
    id v171 = v36;
    if ((v35 & 1) != 0) {
      uint64_t v37 = 0x454C42414E45LL;
    }
    else {
      uint64_t v37 = 0x656C6261736964LL;
    }
    if ((v35 & 1) != 0) {
      unint64_t v38 = 0xE600000000000000LL;
    }
    else {
      unint64_t v38 = 0xE700000000000000LL;
    }
    uint64_t v169 = sub_1000075A0(v37, v38, (uint64_t *)&v171);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease(v38);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Executing request to %{public}s automation mode", v34, 0xCu);
    swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
    id v39 = v36;
    a1 = v35;
    uint64_t v28 = v166;
    swift_slowDealloc(v39, -1LL, -1LL);
    unint64_t v40 = v34;
    uint64_t v2 = v167;
    swift_slowDealloc(v40, -1LL, -1LL);
  }

  unint64_t v41 = *(void (**)(char *, uint64_t))(v17 + 8);
  v41(v26, v168);
  uint64_t v42 = (os_unfair_lock_s *)((char *)v2 + OBJC_IVAR____TtC21automationmode_writer6Writer_lock);
  swift_beginAccess((char *)v2 + OBJC_IVAR____TtC21automationmode_writer6Writer_lock, &v171, 33LL, 0LL);
  v167 = v42;
  os_unfair_lock_lock(v42);
  swift_endAccess(&v171);
  uint64_t v43 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v44 = [v43 defaultManager];
  uint64_t v45 = *(void *)((char *)&v2->_os_unfair_lock_opaque + OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath);
  unint64_t v46 = *(void *)((char *)&v2[2]._os_unfair_lock_opaque + OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath);
  NSString v47 = String._bridgeToObjectiveC()();
  unsigned int v48 = [v44 fileExistsAtPath:v47];

  if (((v48 ^ a1) & 1) == 0)
  {
    id v58 = v161;
    uint64_t v59 = v164((char *)v161, v28, v168);
    uint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
    os_log_type_t v61 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v60, v61))
    {
      os_log_type_t v62 = (void (*)(id, uint64_t))v41;
      id v63 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v64 = (void *)swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)id v63 = 136446210;
      id v171 = v64;
      if ((a1 & 1) != 0) {
        uint64_t v65 = 0x44454C42414E45LL;
      }
      else {
        uint64_t v65 = 0x64656C6261736964LL;
      }
      if ((a1 & 1) != 0) {
        unint64_t v66 = 0xE700000000000000LL;
      }
      else {
        unint64_t v66 = 0xE800000000000000LL;
      }
      uint64_t v169 = sub_1000075A0(v65, v66, (uint64_t *)&v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v63 + 4, v63 + 12);
      swift_bridgeObjectRelease(v66);
      _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "Requested automation mode state matches current state (%{public}s), nothing to do.",  v63,  0xCu);
      swift_arrayDestroy(v64, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1LL, -1LL);
      swift_slowDealloc(v63, -1LL, -1LL);

      v62(v58, v168);
    }

    else
    {

      v41((char *)v58, v168);
    }

    uint64_t v79 = v167;
    goto LABEL_36;
  }

  id v161 = v43;
  URL.init(fileURLWithPath:)(v45, v46);
  uint64_t v49 = v2;
  uint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
  os_log_type_t v51 = static os_log_type_t.debug.getter();
  BOOL v52 = os_log_type_enabled(v50, v51);
  v151 = v41;
  uint64_t v152 = v45;
  if (v52)
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    int v54 = a1;
    id v55 = (void *)swift_slowAlloc(32LL, -1LL);
    id v171 = v55;
    *(_DWORD *)uint64_t v53 = 136446210;
    swift_bridgeObjectRetain(v46);
    uint64_t v169 = sub_1000075A0(v45, v46, (uint64_t *)&v171);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v53 + 4, v53 + 12);

    swift_bridgeObjectRelease(v46);
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "State file path %{public}s", v53, 0xCu);
    swift_arrayDestroy(v55, 1LL, (char *)&type metadata for Any + 8);
    id v56 = v55;
    a1 = v54;
    uint64_t v28 = v166;
    swift_slowDealloc(v56, -1LL, -1LL);
    NSString v57 = v167;
    swift_slowDealloc(v53, -1LL, -1LL);
  }

  else
  {

    NSString v57 = v167;
  }

  id v67 = v165;
  id v68 = v161;
  if ((a1 & 1) != 0)
  {
    int v150 = a1;
    uint64_t v69 = v49;
    uint64_t v70 = (uint64_t)&v49[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID];
    v148 = &v49[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID];
    uint64_t v71 = v157;
    sub_1000095B8(v70, v157, (uint64_t *)&unk_100010BB0);
    uint64_t v72 = type metadata accessor for UUID(0LL);
    uint64_t v73 = *(void *)(v72 - 8);
    objc_super v74 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
    uint64_t v75 = v74(v71, 1LL, v72);
    uint64_t v149 = v72;
    if ((_DWORD)v75 == 1)
    {
      uint64_t v76 = 0x6E776F6E6B6E75LL;
      uint64_t v77 = sub_1000095FC(v71, (uint64_t *)&unk_100010BB0);
      unint64_t v78 = 0xE700000000000000LL;
    }

    else
    {
      uint64_t v76 = UUID.uuidString.getter(v75);
      unint64_t v78 = v88;
      uint64_t v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 8))(v71, v72);
    }

    id v171 = (id)v76;
    unint64_t v172 = v78;
    v89 = v158;
    static String.Encoding.utf8.getter(v77);
    unint64_t v90 = sub_1000093DC();
    StringProtocol.write(to:atomically:encoding:)(v67, 1LL, v89, &type metadata for String, v90);
    (*((void (**)(char *, uint64_t))v159 + 1))(v89, v160);
    swift_bridgeObjectRelease(v172);
    v103 = v156;
    v164(v156, v28, v168);
    uint64_t v105 = v162;
    uint64_t v104 = v163;
    v106 = v154;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v154, v67, v163);
    v107 = v69;
    v108 = (os_log_s *)Logger.logObject.getter(v107);
    LODWORD(v160) = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v108, (os_log_type_t)v160))
    {
      v159 = v108;
      uint64_t v110 = v105;
      uint64_t v111 = swift_slowAlloc(22LL, -1LL);
      v158 = (char *)swift_slowAlloc(64LL, -1LL);
      id v171 = v158;
      *(_DWORD *)uint64_t v111 = 136446466;
      uint64_t v112 = sub_100009638( &qword_100010E20,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      uint64_t v113 = dispatch thunk of CustomStringConvertible.description.getter(v104, v112);
      unint64_t v115 = v114;
      uint64_t v169 = sub_1000075A0(v113, v114, (uint64_t *)&v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v111 + 4, v111 + 12);
      swift_bridgeObjectRelease(v115);
      uint64_t v162 = *(void *)(v110 + 8);
      ((void (*)(char *, uint64_t))v162)(v106, v104);
      *(_WORD *)(v111 + 12) = 2082;
      uint64_t v116 = (uint64_t)v153;
      sub_1000095B8((uint64_t)v148, (uint64_t)v153, (uint64_t *)&unk_100010BB0);
      uint64_t v117 = v149;
      uint64_t v118 = v74(v116, 1LL, v149);
      if ((_DWORD)v118 == 1)
      {
        uint64_t v119 = 0x6E776F6E6B6E75LL;
        sub_1000095FC(v116, (uint64_t *)&unk_100010BB0);
        unint64_t v120 = 0xE700000000000000LL;
      }

      else
      {
        uint64_t v119 = UUID.uuidString.getter(v118);
        unint64_t v120 = v122;
        (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v116, v117);
      }

      a1 = v150;
      v123 = v165;
      uint64_t v169 = sub_1000075A0(v119, v120, (uint64_t *)&v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v111 + 14, v111 + 22);

      swift_bridgeObjectRelease(v120);
      os_log_t v124 = v159;
      _os_log_impl( (void *)&_mh_execute_header,  v159,  (os_log_type_t)v160,  "Created state file for automation mode at %{public}s with boot session id %{public}s",  (uint8_t *)v111,  0x16u);
      v125 = v158;
      swift_arrayDestroy(v158, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v125, -1LL, -1LL);
      swift_slowDealloc(v111, -1LL, -1LL);

      v151(v156, v168);
      ((void (*)(char *, uint64_t))v162)(v123, v163);
      NSString v57 = v167;
      id v68 = v161;
    }

    else
    {

      v121 = *(void (**)(char *, uint64_t))(v105 + 8);
      v121(v106, v104);
      v151(v103, v168);
      v121(v67, v104);
      NSString v57 = v167;
      a1 = v150;
      id v68 = v161;
    }

    goto LABEL_43;
  }

  id v80 = [v161 defaultManager];
  URL._bridgeToObjectiveC()(v81);
  uint64_t v83 = v82;
  id v171 = 0LL;
  unsigned int v84 = [v80 removeItemAtURL:v82 error:&v171];

  id v85 = v171;
  if (!v84)
  {
    id v91 = v171;
    uint64_t v92 = _convertNSErrorToError(_:)(v85);

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v162 + 8))(v67, v163);
    swift_errorRetain(v92);
    uint64_t v93 = swift_errorRetain(v92);
    v94 = (os_log_s *)Logger.logObject.getter(v93);
    int v95 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v94, (os_log_type_t)v95))
    {
      v96 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v97 = (void *)swift_slowAlloc(32LL, -1LL);
      id v171 = v97;
      *(_DWORD *)v96 = 136446210;
      uint64_t v169 = v92;
      swift_errorRetain(v92);
      uint64_t v98 = sub_10000334C(&qword_100010DF0);
      uint64_t v99 = String.init<A>(describing:)(&v169, v98);
      unint64_t v101 = v100;
      uint64_t v169 = sub_1000075A0(v99, v100, (uint64_t *)&v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v96 + 4, v96 + 12);
      swift_bridgeObjectRelease(v101);
      swift_errorRelease(v92);
      swift_errorRelease(v92);
      _os_log_impl( (void *)&_mh_execute_header,  v94,  (os_log_type_t)v95,  "Failed to change automation mode: %{public}s",  v96,  0xCu);
      swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v97, -1LL, -1LL);
      swift_slowDealloc(v96, -1LL, -1LL);

      swift_errorRelease(v92);
    }

    else
    {
      swift_errorRelease(v92);
      swift_errorRelease(v92);
      swift_errorRelease(v92);
    }

    uint64_t v79 = v167;
LABEL_36:
    swift_beginAccess(v79, &v171, 33LL, 0LL);
    v102 = v79;
    goto LABEL_57;
  }

  uint64_t v86 = *(void (**)(char *, uint64_t))(v162 + 8);
  id v87 = v171;
  v86(v67, v163);
LABEL_43:
  id v126 = [v68 defaultManager];
  NSString v127 = String._bridgeToObjectiveC()();
  unsigned int v128 = [v126 fileExistsAtPath:v127];

  if (((v128 ^ a1) & 1) != 0)
  {
    v130 = (os_log_s *)Logger.logObject.getter(v129);
    os_log_type_t v131 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v132 = 0;
      _os_log_impl((void *)&_mh_execute_header, v130, v131, "Failed to change automation mode", v132, 2u);
      swift_slowDealloc(v132, -1LL, -1LL);
    }
  }

  else
  {
    v133 = v155;
    uint64_t v134 = v164(v155, v166, v168);
    v135 = (os_log_s *)Logger.logObject.getter(v134);
    os_log_type_t v136 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v135, v136))
    {
      v137 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v138 = (void *)swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)v137 = 136446210;
      id v171 = v138;
      if ((a1 & 1) != 0) {
        uint64_t v139 = 0x44454C42414E45LL;
      }
      else {
        uint64_t v139 = 0x64656C6261736964LL;
      }
      if ((a1 & 1) != 0) {
        unint64_t v140 = 0xE700000000000000LL;
      }
      else {
        unint64_t v140 = 0xE800000000000000LL;
      }
      uint64_t v169 = sub_1000075A0(v139, v140, (uint64_t *)&v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v137 + 4, v137 + 12);
      swift_bridgeObjectRelease(v140);
      _os_log_impl( (void *)&_mh_execute_header,  v135,  v136,  "Successfully set automation mode to %{public}s",  v137,  0xCu);
      swift_arrayDestroy(v138, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v138, -1LL, -1LL);
      swift_slowDealloc(v137, -1LL, -1LL);
    }

    uint64_t v141 = ((uint64_t (*)(char *, uint64_t))v151)(v133, v168);
    id v142 = (id)XAMAutomationModeStateChangedNotificationName(v141);
    uint64_t v143 = static String._unconditionallyBridgeFromObjectiveC(_:)(v142);
    uint64_t v145 = v144;

    uint64_t v146 = String.utf8CString.getter(v143, v145);
    swift_bridgeObjectRelease(v145);
    notify_post((const char *)(v146 + 32));
    swift_release(v146);
  }

  swift_beginAccess(v57, &v171, 33LL, 0LL);
  v102 = v57;
LABEL_57:
  os_unfair_lock_unlock(v102);
  return swift_endAccess(&v171);
}

void sub_100004DA0(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int32 + 64;
  v4[1] = &unk_100009F98;
  v4[2] = &unk_100009F98;
  void v4[3] = &unk_100009F98;
  v4[4] = &unk_100009FB0;
  v4[5] = &unk_100009FC8;
  sub_100003234(319LL);
  if (v3 <= 0x3F)
  {
    v4[6] = *(void *)(v2 - 8) + 64LL;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 9LL, v4, a1 + 80);
  }

uint64_t sub_100004E58()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 valueForEntitlement:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(&v15, v2);
    swift_unknownObjectRelease(v2);
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
  }

  sub_100009394((uint64_t)&v15, (uint64_t)v17);
  sub_1000095B8((uint64_t)v17, (uint64_t)&v15, &qword_100010DC8);
  if (!*((void *)&v16 + 1))
  {
    sub_1000095FC((uint64_t)&v15, &qword_100010DC8);
LABEL_9:
    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = [v0 valueForEntitlement:v7];

    if (v8)
    {
      _bridgeAnyObjectToAny(_:)(v13, v8);
      swift_unknownObjectRelease(v8);
    }

    else
    {
      *(_OWORD *)uint64_t v13 = 0u;
      __int128 v14 = 0u;
    }

    sub_100009394((uint64_t)v13, (uint64_t)&v15);
    sub_1000095B8((uint64_t)&v15, (uint64_t)v13, &qword_100010DC8);
    if (*((void *)&v14 + 1))
    {
      uint64_t v9 = sub_10000935C(0LL, &qword_100010DD0, &OBJC_CLASS___NSNumber_ptr);
      if ((swift_dynamicCast(&v12, v13, (char *)&type metadata for Any + 8, v9, 6LL) & 1) != 0)
      {
        id v10 = v12;
        id v6 = [v12 BOOLValue];

LABEL_17:
        sub_1000095FC((uint64_t)&v15, &qword_100010DC8);
        sub_1000095FC((uint64_t)v17, &qword_100010DC8);
        return (uint64_t)v6;
      }
    }

    else
    {
      sub_1000095FC((uint64_t)v13, &qword_100010DC8);
    }

    id v6 = 0LL;
    goto LABEL_17;
  }

  uint64_t v3 = sub_10000935C(0LL, &qword_100010DD0, &OBJC_CLASS___NSNumber_ptr);
  id v4 = v13[0];
  unsigned int v5 = [v13[0] BOOLValue];

  if (!v5) {
    goto LABEL_9;
  }
  sub_1000095FC((uint64_t)v17, &qword_100010DC8);
  return 1LL;
}

void sub_100005180(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

NSString sub_1000051CC()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100010E38 = (uint64_t)result;
  return result;
}

NSString sub_100005200()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100010E40 = (uint64_t)result;
  return result;
}

void sub_100005234()
{
  qword_100010E48 = sub_100005250();
}

double sub_100005250()
{
  id v0 = [(id)objc_opt_self(NSProcessInfo) processInfo];
  id v1 = [v0 environment];

  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_100007BE0(0xD00000000000002ELL, 0x800000010000A6F0LL), (v4 & 1) != 0))
  {
    unsigned int v5 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v3);
    uint64_t v7 = *v5;
    unint64_t v6 = v5[1];
    swift_bridgeObjectRetain(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
    unint64_t v6 = 0xE000000000000000LL;
  }

  uint64_t v8 = swift_bridgeObjectRelease(v2);
  double v19 = 0.0;
  __chkstk_darwin(v8);
  _OWORD v16[2] = &v19;
  if ((v6 & 0x1000000000000000LL) != 0 || !(v6 & 0x2000000000000000LL | v7 & 0x1000000000000000LL))
  {
    _StringGuts._slowWithCString<A>(_:)(&v18, sub_100009678, v16, v7, v6, &type metadata for Bool);
    swift_bridgeObjectRelease(v6);
    if ((v18 & 1) == 0) {
      goto LABEL_15;
    }
    return v19;
  }

  if ((v6 & 0x2000000000000000LL) != 0)
  {
    v17[0] = v7;
    v17[1] = v6 & 0xFFFFFFFFFFFFFFLL;
    if (v7 <= 0x20u && ((1LL << v7) & 0x100003E01LL) != 0
      || (__int128 v14 = (unsigned __int8 *)_swift_stdlib_strtod_clocale(v17, &v19)) == 0LL)
    {
      swift_bridgeObjectRelease(v6);
      goto LABEL_15;
    }

    int v15 = *v14;
    swift_bridgeObjectRelease(v6);
    if (v15) {
      goto LABEL_15;
    }
    return v19;
  }

  if ((v7 & 0x1000000000000000LL) != 0) {
    uint64_t v9 = (_BYTE *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    uint64_t v9 = (_BYTE *)_StringObject.sharedUTF8.getter(v7, v6);
  }
  sub_100009678(v9, (BOOL *)v17);
  int v10 = LOBYTE(v17[0]);
  swift_bridgeObjectRelease(v6);
  if (v10) {
    return v19;
  }
LABEL_15:
  if (qword_100010A68 != -1) {
    swift_once(&qword_100010A68, sub_100005200);
  }
  id v12 = (const __CFString *)qword_100010E40;
  uint64_t v13 = (__CFString *)sub_100007E18();
  LODWORD(v12) = CFPreferencesGetAppBooleanValue(v12, v13, 0LL);

  double result = 2419200.0;
  if (!(_DWORD)v12) {
    return 28800.0;
  }
  return result;
}

uint64_t sub_1000054E0()
{
  if (qword_100010A60 != -1) {
    swift_once(&qword_100010A60, sub_1000051CC);
  }
  uint64_t v1 = qword_100010E38;
  NSString v2 = sub_100007E18();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = _CFPreferencesCopyValueWithContainer(v1, v2, v3, kCFPreferencesCurrentHost, v4);

  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSNumber);
    uint64_t v7 = (void *)swift_dynamicCastObjCClass(v5, v6);
    if (v7)
    {
      [v7 doubleValue];
      uint64_t v9 = v8;
      swift_unknownObjectRelease(v5);
      return v9;
    }

    swift_unknownObjectRelease(v5);
  }

  return 0LL;
}

void sub_1000055F0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = v2;
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    uint64_t v6 = sub_1000032F4(v5, (uint64_t)qword_100010C20);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v9 = 134217984;
      uint64_t v15 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4, v9 + 12);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Storing credential creation time:  %f", v9, 0xCu);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    if (qword_100010A60 != -1) {
      swift_once(&qword_100010A60, sub_1000051CC);
    }
    uint64_t v10 = qword_100010E38;
    id v11 = [objc_allocWithZone(NSNumber) initWithDouble:*(double *)&a1];
    NSString v12 = sub_100007E18();
    uint64_t v13 = *(void *)(v3 + OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope);
    NSString v14 = String._bridgeToObjectiveC()();
    _CFPreferencesSetValueWithContainer(v10, v11, v12, v13, kCFPreferencesCurrentHost, v14);
  }

NSString sub_1000057BC()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100010E50 = (uint64_t)result;
  return result;
}

uint64_t sub_1000057F0()
{
  if (qword_100010A78 != -1) {
    swift_once(&qword_100010A78, sub_1000057BC);
  }
  uint64_t v1 = qword_100010E50;
  NSString v2 = sub_100007E18();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = _CFPreferencesCopyValueWithContainer(v1, v2, v3, kCFPreferencesCurrentHost, v4);

  if (!v5) {
    return 0LL;
  }
  uint64_t v8 = v5;
  if (swift_dynamicCast( &v7,  &v8,  (char *)&type metadata for Swift.AnyObject + 8,  &type metadata for String,  6LL)) {
    return v7;
  }
  else {
    return 0LL;
  }
}

void sub_1000058F4(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = v2;
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    sub_1000032F4(v6, (uint64_t)qword_100010C20);
    uint64_t v7 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v11 = swift_slowAlloc(32LL, -1LL);
      uint64_t v18 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v17 = sub_1000075A0(a1, a2, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Storing credential boot session UUID:  %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1LL, -1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    if (qword_100010A78 != -1) {
      swift_once(&qword_100010A78, sub_1000057BC);
    }
    uint64_t v12 = qword_100010E50;
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    NSString v14 = sub_100007E18();
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope);
    NSString v16 = String._bridgeToObjectiveC()();
    _CFPreferencesSetValueWithContainer(v12, v13, v14, v15, kCFPreferencesCurrentHost, v16);
  }

BOOL sub_100005B48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000334C((uint64_t *)&unk_100010BB0);
  __chkstk_darwin(v2);
  NSString v4 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v62 - v10;
  *(double *)&uint64_t v12 = COERCE_DOUBLE(sub_1000054E0());
  if ((v13 & 1) != 0)
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_1000032F4(v19, (uint64_t)qword_100010C20);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_14;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v23 = 0;
    uint64_t v24 = "No previous credential exists";
    goto LABEL_13;
  }

  double v14 = *(double *)&v12;
  uint64_t v15 = sub_1000057F0();
  if (!v16)
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v25 = type metadata accessor for Logger(0LL);
    uint64_t v26 = sub_1000032F4(v25, (uint64_t)qword_100010C20);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v22 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_14;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v23 = 0;
    uint64_t v24 = "Previous credential did not record boot session, will require new authorization";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v21, v22, v24, v23, 2u);
    swift_slowDealloc(v23, -1LL, -1LL);
LABEL_14:

    return 0LL;
  }

  uint64_t v17 = v15;
  unint64_t v18 = v16;
  sub_1000095B8( (uint64_t)v0 + OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID,  (uint64_t)v4,  (uint64_t *)&unk_100010BB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    swift_bridgeObjectRelease(v18);
    sub_1000095FC((uint64_t)v4, (uint64_t *)&unk_100010BB0);
  }

  else
  {
    uint64_t v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    uint64_t v29 = UUID.uuidString.getter(v28);
    uint64_t v31 = v30;
    if (v17 == v29 && v18 == v30)
    {
      swift_bridgeObjectRelease(v30);
    }

    else
    {
      char v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, v29, v30, 0LL);
      swift_bridgeObjectRelease(v31);
      if ((v33 & 1) == 0)
      {
        if (qword_100010A58 != -1) {
          swift_once(&qword_100010A58, sub_10000350C);
        }
        uint64_t v34 = type metadata accessor for Logger(0LL);
        sub_1000032F4(v34, (uint64_t)qword_100010C20);
        (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
        uint64_t v35 = swift_bridgeObjectRetain(v18);
        NSString v36 = (os_log_s *)Logger.logObject.getter(v35);
        os_log_type_t v37 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = swift_slowAlloc(22LL, -1LL);
          uint64_t v63 = swift_slowAlloc(64LL, -1LL);
          double v65 = *(double *)&v63;
          *(_DWORD *)uint64_t v38 = 136315394;
          swift_bridgeObjectRetain(v18);
          uint64_t v64 = sub_1000075A0(v17, v18, (uint64_t *)&v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v38 + 4, v38 + 12);
          uint64_t v39 = swift_bridgeObjectRelease_n(v18, 3LL);
          *(_WORD *)(v38 + 12) = 2080;
          uint64_t v40 = UUID.uuidString.getter(v39);
          unint64_t v42 = v41;
          uint64_t v64 = sub_1000075A0(v40, v41, (uint64_t *)&v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v38 + 14, v38 + 22);
          swift_bridgeObjectRelease(v42);
          uint64_t v43 = *(void (**)(char *, uint64_t))(v6 + 8);
          v43(v9, v5);
          _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "Previous credential boot session does not match current (%s != %s, will require new authorization",  (uint8_t *)v38,  0x16u);
          uint64_t v44 = v63;
          swift_arrayDestroy(v63, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v44, -1LL, -1LL);
          swift_slowDealloc(v38, -1LL, -1LL);

          v43(v11, v5);
        }

        else
        {

          os_log_type_t v61 = *(void (**)(char *, uint64_t))(v6 + 8);
          v61(v9, v5);
          swift_bridgeObjectRelease_n(v18, 2LL);
          v61(v11, v5);
        }

        return 0LL;
      }
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_bridgeObjectRelease(v18);
  }

  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v45 = type metadata accessor for Logger(0LL);
  uint64_t v46 = sub_1000032F4(v45, (uint64_t)qword_100010C20);
  NSString v47 = (os_log_s *)Logger.logObject.getter(v46);
  os_log_type_t v48 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v49 = 134217984;
    double v65 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v49 + 4, v49 + 12);
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Last credential created at %f", v49, 0xCu);
    swift_slowDealloc(v49, -1LL, -1LL);
  }

  uint64_t v50 = TMGetKernelMonotonicClock();
  uint64_t v52 = *(void *)&v51;
  double v53 = v51 - v14;
  int v54 = (os_log_s *)Logger.logObject.getter(v50);
  os_log_type_t v55 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)uint64_t v56 = 134218240;
    double v65 = *(double *)&v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v56 + 4, v56 + 12);
    *(_WORD *)(v56 + 12) = 2048;
    double v65 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v56 + 14, v56 + 22);
    _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "Credential age based on current time %f is %f",  (uint8_t *)v56,  0x16u);
    swift_slowDealloc(v56, -1LL, -1LL);
  }

  NSString v57 = v1;
  id v58 = (os_log_s *)Logger.logObject.getter(v57);
  os_log_type_t v59 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v60 = 134217984;
    double v65 = *(double *)&v57[OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v60 + 4, v60 + 12);

    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Credential timeout: %f", v60, 0xCu);
    swift_slowDealloc(v60, -1LL, -1LL);
  }

  else
  {

    id v58 = (os_log_s *)v57;
  }

  if (v53 < 0.0) {
    return 0LL;
  }
  return v53 < *(double *)&v57[OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout];
}

char *sub_100006290()
{
  uint64_t v0 = sub_10000334C((uint64_t *)&unk_100010BB0);
  sub_10000330C(v0, qword_100010E58);
  uint64_t v1 = sub_1000032F4(v0, (uint64_t)qword_100010E58);
  return sub_1000062DC(v1);
}

char *sub_1000062DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000334C((uint64_t *)&unk_100010BB0);
  __chkstk_darwin(v2);
  NSString v4 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v71 - v10;
  uint64_t v12 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v12);
  double v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  size_t v77 = 37LL;
  uint64_t v15 = static Array._allocateBufferUninitialized(minimumCapacity:)(37LL, &type metadata for Int8);
  *(void *)(v15 + 16) = 37LL;
  *(_OWORD *)(v15 + 48) = 0u;
  *(void *)(v15 + 61) = 0LL;
  *(_OWORD *)(v15 + 32) = 0u;
  uint64_t v76 = v15;
  if (!sysctlbyname("kern.bootsessionuuid", (void *)(v15 + 32), &v77, 0LL, 0LL))
  {
    uint64_t v30 = swift_bridgeObjectRetain(v15);
    static String.Encoding.ascii.getter(v30);
    uint64_t v31 = sub_100006B80(v15, v14);
    if (!v32)
    {
      if (qword_100010A58 != -1) {
        swift_once(&qword_100010A58, sub_10000350C);
      }
      uint64_t v42 = type metadata accessor for Logger(0LL);
      uint64_t v43 = sub_1000032F4(v42, (uint64_t)qword_100010C20);
      uint64_t v24 = (os_log_s *)Logger.logObject.getter(v43);
      os_log_type_t v44 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v24, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v74 = swift_slowAlloc(32LL, -1LL);
        uint64_t v79 = v74;
        *(_DWORD *)uint64_t v45 = 136315138;
        uint64_t v73 = v45 + 4;
        swift_beginAccess(&v76, v78, 0LL, 0LL);
        uint64_t v46 = v5;
        uint64_t v47 = v6;
        uint64_t v48 = a1;
        uint64_t v49 = v76;
        uint64_t v50 = swift_bridgeObjectRetain(v76);
        uint64_t v51 = Array.description.getter(v50, &type metadata for Int8);
        unint64_t v53 = v52;
        uint64_t v54 = v49;
        a1 = v48;
        uint64_t v6 = v47;
        uint64_t v5 = v46;
        swift_bridgeObjectRelease(v54);
        uint64_t v75 = sub_1000075A0(v51, v53, &v79);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v73, v45 + 12);
        swift_bridgeObjectRelease(v53);
        _os_log_impl( (void *)&_mh_execute_header,  v24,  v44,  "Unable to convert kern.bootsessionuuid value %s to ascii string.",  v45,  0xCu);
        uint64_t v28 = 1LL;
        uint64_t v55 = v74;
        swift_arrayDestroy(v74, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v55, -1LL, -1LL);
        uint64_t v29 = (uint64_t)v45;
        goto LABEL_13;
      }

LABEL_22:
      uint64_t v28 = 1LL;
      goto LABEL_35;
    }

    uint64_t v33 = v31;
    unint64_t v34 = v32;
    UUID.init(uuidString:)();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) != 1)
    {
      swift_bridgeObjectRelease(v34);
      uint64_t v56 = *(uint8_t **)(v6 + 32);
      ((void (*)(char *, char *, uint64_t))v56)(v11, v4, v5);
      if (qword_100010A58 != -1) {
        swift_once(&qword_100010A58, sub_10000350C);
      }
      uint64_t v57 = type metadata accessor for Logger(0LL);
      sub_1000032F4(v57, (uint64_t)qword_100010C20);
      uint64_t v58 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
      os_log_type_t v59 = (os_log_s *)Logger.logObject.getter(v58);
      os_log_type_t v60 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc(12LL, -1LL);
        uint64_t v73 = v56;
        uint64_t v62 = (uint8_t *)v61;
        uint64_t v63 = swift_slowAlloc(32LL, -1LL);
        uint64_t v74 = a1;
        uint64_t v64 = v63;
        v78[0] = v63;
        *(_DWORD *)uint64_t v62 = 136446210;
        uint64_t v72 = v62 + 4;
        uint64_t v65 = sub_100009638( &qword_100010E28,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v66 = dispatch thunk of CustomStringConvertible.description.getter(v5, v65);
        unint64_t v68 = v67;
        uint64_t v79 = sub_1000075A0(v66, v67, v78);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v72, v62 + 12);
        swift_bridgeObjectRelease(v68);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "Boot session UUID is %{public}s", v62, 0xCu);
        swift_arrayDestroy(v64, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v69 = v64;
        a1 = v74;
        swift_slowDealloc(v69, -1LL, -1LL);
        uint64_t v70 = v62;
        uint64_t v56 = v73;
        swift_slowDealloc(v70, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }

      ((void (*)(uint64_t, char *, uint64_t))v56)(a1, v11, v5);
      uint64_t v28 = 0LL;
      goto LABEL_35;
    }

    sub_1000095FC((uint64_t)v4, (uint64_t *)&unk_100010BB0);
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v35 = type metadata accessor for Logger(0LL);
    sub_1000032F4(v35, (uint64_t)qword_100010C20);
    uint64_t v36 = swift_bridgeObjectRetain(v34);
    os_log_type_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v40 = swift_slowAlloc(32LL, -1LL);
      v78[0] = v40;
      uint64_t v74 = v5;
      *(_DWORD *)uint64_t v39 = 136446210;
      swift_bridgeObjectRetain(v34);
      uint64_t v79 = sub_1000075A0(v33, v34, v78);
      uint64_t v5 = v74;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v39 + 4, v39 + 12);
      swift_bridgeObjectRelease_n(v34, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "Unable to convert kern.bootsessionuuid value %{public}s to UUID",  v39,  0xCu);
      uint64_t v28 = 1LL;
      swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v39, -1LL, -1LL);

      goto LABEL_35;
    }

    unint64_t v41 = v34;
LABEL_21:
    swift_bridgeObjectRelease_n(v41, 2LL);
    goto LABEL_22;
  }

  int v16 = errno.getter();
  NSString result = strerror(v16);
  if (result)
  {
    uint64_t v18 = String.init(utf8String:)();
    if (v19) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = 0x6E776F6E6B6E55LL;
    }
    if (v19) {
      unint64_t v21 = v19;
    }
    else {
      unint64_t v21 = 0xE700000000000000LL;
    }
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    sub_1000032F4(v22, (uint64_t)qword_100010C20);
    uint64_t v23 = swift_bridgeObjectRetain(v21);
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc(18LL, -1LL);
      uint64_t v27 = swift_slowAlloc(32LL, -1LL);
      v78[0] = v27;
      *(_DWORD *)uint64_t v26 = 67109378;
      LODWORD(v79) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, (char *)&v79 + 4, v26 + 4, v26 + 8);
      *(_WORD *)(v26 + 8) = 2082;
      swift_bridgeObjectRetain(v21);
      uint64_t v79 = sub_1000075A0(v20, v21, v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v26 + 10, v26 + 18);
      swift_bridgeObjectRelease_n(v21, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Error %d from sysctlbyname: %{public}s",  (uint8_t *)v26,  0x12u);
      uint64_t v28 = 1LL;
      swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1LL, -1LL);
      uint64_t v29 = v26;
LABEL_13:
      swift_slowDealloc(v29, -1LL, -1LL);

LABEL_35:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v28, 1LL, v5);
      return (char *)swift_bridgeObjectRelease(v76);
    }

    unint64_t v41 = v21;
    goto LABEL_21;
  }

  __break(1u);
  return result;
}

uint64_t sub_100006B80(uint64_t a1, char *a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v29 - v10;
  static String.Encoding.utf8.getter(v9);
  char v12 = static String.Encoding.== infix(_:_:)(a2, v11);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v11, v4);
  uint64_t v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 16))(v8, a2, v4);
  if ((v12 & 1) != 0)
  {
    v13(v8, v4);
    goto LABEL_4;
  }

  static String.Encoding.ascii.getter(v14);
  char v15 = static String.Encoding.== infix(_:_:)(v8, v11);
  v13(v11, v4);
  v13(v8, v4);
  if ((v15 & 1) != 0)
  {
LABEL_4:
    uint64_t v16 = sub_100007518(0, a1);
    if ((v17 & 1) == 0)
    {
      if ((v16 & 0x8000000000000000LL) == 0)
      {
        uint64_t v18 = *(void *)(a1 + 16);
        if (v18 >= v16) {
          uint64_t v18 = v16;
        }
        if (v16) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0LL;
        }
        swift_bridgeObjectRetain(a1);
        uint64_t v20 = static String._tryFromUTF8(_:)(a1 + 32, v19);
        uint64_t v22 = v21;
        uint64_t v23 = swift_unknownObjectRelease(a1);
        if (v22)
        {
          static String.Encoding.utf8.getter(v23);
          char v24 = static String.Encoding.== infix(_:_:)(a2, v11);
          v13(v11, v4);
          if ((v24 & 1) != 0 || (_StringGuts._isContiguousASCII.getter(v20, v22) & 1) != 0)
          {
            swift_bridgeObjectRelease(a1);
LABEL_20:
            v13(a2, v4);
            return v20;
          }

          swift_bridgeObjectRelease(v22);
        }

        goto LABEL_16;
      }

      __break(1u);
    }

    __break(1u);
    goto LABEL_23;
  }

LABEL_16:
  uint64_t v25 = sub_100007518(0, a1);
  if ((v26 & 1) == 0)
  {
    id v27 = [objc_allocWithZone(NSString) initWithBytes:a1 + 32 length:v25 encoding:String.Encoding.rawValue.getter()];
    swift_bridgeObjectRelease(a1);
    if (v27)
    {
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    goto LABEL_20;
  }

LABEL_23:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000003FLL,  0x800000010000A6B0LL,  "Foundation/arm64-apple-tvos.private.swiftinterface",  50LL,  2LL,  11704LL,  0);
  __break(1u);
  return result;
}

id sub_100006E18()
{
  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  sub_1000032F4(v1, (uint64_t)qword_100010C20);
  uint64_t v2 = v0;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v14 = v6;
    uint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath];
    unint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8];
    swift_bridgeObjectRetain(v8);
    uint64_t v13 = sub_1000075A0(v7, v8, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);

    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking for '%s'", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }

  id v9 = [(id)objc_opt_self(NSFileManager) defaultManager];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 fileExistsAtPath:v10];

  return v11;
}

uint64_t sub_100007018()
{
  id v0 = [objc_allocWithZone(LAContext) init];
  unsigned __int8 v1 = [v0 canEvaluatePolicy:2 error:0];

  if ((v1 & 1) == 0)
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    uint64_t v9 = sub_1000032F4(v8, (uint64_t)qword_100010C20);
    os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_22;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "Unable to evaluate device owner authentication policy, probably no passcode set.";
    goto LABEL_21;
  }

  if ((sub_100008540() & 1) != 0)
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v2 = type metadata accessor for Logger(0LL);
    uint64_t v3 = sub_1000032F4(v2, (uint64_t)qword_100010C20);
    os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_22;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "Authentication not required for privileged connection";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v7, v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
LABEL_22:

    return 0LL;
  }

  if (sub_100005B48())
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_1000032F4(v10, (uint64_t)qword_100010C20);
    os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_22;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "Previous authentication has not expired";
    goto LABEL_21;
  }

  if ((sub_100006E18() & 1) != 0)
  {
    if (qword_100010A58 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_1000032F4(v12, (uint64_t)qword_100010C20);
    os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_22;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "Waiving the requirement for authentication because of the existence of the no-auth-required cookie";
    goto LABEL_21;
  }

  return 1LL;
}

uint64_t sub_1000072E8(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_10000334C((uint64_t *)&unk_100010BB0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    swift_errorRetain(a1);
    a2(a1);
    return swift_errorRelease(a1);
  }

  else
  {
    *(double *)&uint64_t v12 = TMGetKernelMonotonicClock(v8);
    sub_1000055F0(v12, 0);
    sub_1000095B8( a4 + OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID,  (uint64_t)v10,  (uint64_t *)&unk_100010BB0);
    uint64_t v13 = type metadata accessor for UUID(0LL);
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1LL, v13);
    if ((_DWORD)v15 == 1)
    {
      sub_1000095FC((uint64_t)v10, (uint64_t *)&unk_100010BB0);
      unint64_t v16 = 0xE700000000000000LL;
      uint64_t v17 = 0x6E776F6E6B6E75LL;
    }

    else
    {
      uint64_t v17 = UUID.uuidString.getter(v15);
      unint64_t v16 = v18;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
    }

    sub_1000058F4(v17, v16);
    sub_100003D94(1);
    return ((uint64_t (*)(void))a2)(0LL);
  }

uint64_t sub_100007518(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0LL;
  }
  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = v2 - 2;
  while (v5 != v4)
  {
    int v6 = *(unsigned __int8 *)(a2 + 34 + v4++);
    if (v6 == a1) {
      return v4 + 1;
    }
  }

  return 0LL;
}

uint64_t sub_1000075A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007670(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000931C((uint64_t)v12, *a3);
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
      sub_10000931C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000343C(v12);
  return v7;
}

uint64_t sub_100007670(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100007828(a5, a6);
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

uint64_t sub_100007828(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000078BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007A94(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007A94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000078BC(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100007A30(v4, 0LL);
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

void *sub_100007A30(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_10000334C(&qword_100010DB8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100007A94(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000334C(&qword_100010DB8);
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

unint64_t sub_100007BE0(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100007C74(a1, a2, v5);
}

unint64_t sub_100007C44(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100007D54(a1, v4);
}

unint64_t sub_100007C74(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100007D54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100009548(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100009584((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

NSString sub_100007E18()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(NSProcessInfo) processInfo];
  id v2 = [v1 environment];

  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_100007BE0(0xD00000000000002ELL, 0x800000010000A560LL), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(v3 + 56) + 16 * v4 + 8);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRelease(v3);
    NSString v7 = String._bridgeToObjectiveC()();

    swift_bridgeObjectRelease(v6);
    return v7;
  }

  else
  {
    swift_bridgeObjectRelease(v3);
    return v0;
  }

void sub_100007F34(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = swift_allocObject(&unk_10000C6C8, 24LL, 7LL);
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = (void *)swift_allocObject(&unk_10000C6F0, 40LL, 7LL);
  v9[2] = sub_100009488;
  v9[3] = v8;
  v9[4] = a3;
  id v10 = objc_allocWithZone(&OBJC_CLASS___LAContext);
  _Block_copy(a4);
  swift_retain(v8);
  id v11 = a3;
  sub_1000094A0(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100009420(a1, a2);
  id v13 = [v10 initWithExternalizedContext:isa];

  if (v13)
  {
    uint64_t v14 = sub_10000334C(&qword_100010DE8);
    uint64_t inited = swift_initStackObject(v14, v35);
    *(_OWORD *)(inited + 16) = xmmword_100009F20;
    aBlock[0] = 1000LL;
    AnyHashable.init<A>(_:)(aBlock, &type metadata for Int, &protocol witness table for Int);
    *(void *)(inited + 96) = &type metadata for Bool;
    *(_BYTE *)(inited + 72) = 1;
    unint64_t v16 = sub_10000358C(inited);
    v17.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v16);
    unint64_t v18 = (void *)swift_allocObject(&unk_10000C718, 40LL, 7LL);
    v18[2] = sub_100009494;
    v18[3] = v9;
    v18[4] = v13;
    aBlock[4] = sub_100009514;
    unint64_t v34 = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100003A14;
    aBlock[3] = &unk_10000C730;
    a4 = _Block_copy(aBlock);
    uint64_t v19 = v34;
    uint64_t v20 = (objc_class *)v13;
    swift_retain(v9);
    swift_release(v19);
    -[objc_class evaluatePolicy:options:reply:](v20, "evaluatePolicy:options:reply:", 2LL, v17.super.isa, a4);
  }

  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.dt.AutomationMode.writer.error");
    uint64_t v22 = v21;
    uint64_t v23 = sub_10000334C(&qword_100010DE0);
    uint64_t v24 = swift_initStackObject(v23, v36);
    *(_OWORD *)(v24 + 16) = xmmword_100009F20;
    *(void *)(v24 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(v24 + 40) = v25;
    *(void *)(v24 + 72) = &type metadata for String;
    *(void *)(v24 + 48) = 0xD000000000000036LL;
    *(void *)(v24 + 56) = 0x800000010000A4C0LL;
    unint64_t v26 = sub_1000036CC(v24);
    id v27 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
    Class v29 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    id v30 = [v27 initWithDomain:v28 code:2 userInfo:v29];

    id v31 = v30;
    _Block_copy(a4);
    uint64_t v20 = (objc_class *)v31;
    unint64_t v32 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))a4 + 2))(a4, v32);

    v17.super.Class isa = v20;
  }

  _Block_release(a4);
  swift_release(v8);
  swift_release(v9);
}

uint64_t sub_1000082C4(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_1000032F4(v4, (uint64_t)qword_100010C20);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received connection request", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC21automationmode_writer6Writer_enforcesClientEntitlement) == 1
    && (uint64_t v9 = sub_100004E58(), (v9 & 1) == 0))
  {
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      uint64_t v16 = sub_1000075A0(0xD000000000000031LL, 0x800000010000A5F0LL, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 4, v14 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "Rejecting connection from client lacking entitlement %{public}s",  v14,  0xCu);
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    return 0LL;
  }

  else
  {
    [a1 setExportedObject:v2];
    id v10 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL___AutomationModeWriterProtocol];
    [a1 setExportedInterface:v10];

    [a1 resume];
    return 1LL;
  }

id sub_100008540()
{
  id v0 = [(id)objc_opt_self(NSXPCConnection) currentConnection];
  if (v0)
  {
    uint64_t v1 = v0;
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = [v1 valueForEntitlement:v2];

    if (v3)
    {
      _bridgeAnyObjectToAny(_:)(&v9, v3);
      swift_unknownObjectRelease(v3);
    }

    else
    {
      __int128 v9 = 0u;
      __int128 v10 = 0u;
    }

    sub_100009394((uint64_t)&v9, (uint64_t)v11);
  }

  else
  {
    memset(v11, 0, sizeof(v11));
  }

  sub_1000095B8((uint64_t)v11, (uint64_t)&v9, &qword_100010DC8);
  if (!*((void *)&v10 + 1))
  {
    sub_1000095FC((uint64_t)&v9, &qword_100010DC8);
    goto LABEL_11;
  }

  uint64_t v4 = sub_10000935C(0LL, &qword_100010DD0, &OBJC_CLASS___NSNumber_ptr);
  if ((swift_dynamicCast(&v8, &v9, (char *)&type metadata for Any + 8, v4, 6LL) & 1) == 0)
  {
LABEL_11:
    id v6 = 0LL;
    goto LABEL_12;
  }

  id v5 = v8;
  id v6 = [v8 BOOLValue];

LABEL_12:
  sub_1000095FC((uint64_t)v11, &qword_100010DC8);
  return v6;
}

void sub_1000086B4(uint64_t a1, uint64_t a2)
{
  if ((sub_100007018() & 1) != 0)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.dt.AutomationMode.writer.error");
    uint64_t v4 = v3;
    id v5 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    id v7 = [v5 initWithDomain:v6 code:1 userInfo:0];

    id v8 = v7;
    id v9 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v9);
  }

  else
  {
    sub_100003D94(1);
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0LL);
  }

void sub_1000087A0(uint64_t a1, unint64_t a2, void *a3, void *aBlock)
{
  if (qword_100010A58 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_1000032F4(v8, (uint64_t)qword_100010C20);
  __int128 v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Handling request to enable automation mode with serialized authorization.",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  _Block_copy(aBlock);
  id v13 = a3;
  sub_100007F34(a1, a2, v13, aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_1000088C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (void *)type metadata accessor for URL(0LL);
  uint64_t v9 = *(v8 - 1);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_100008540() & 1) != 0)
  {
    uint64_t v42 = v9;
    id v44 = v8;
    uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath);
    unint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8);
    uint64_t v14 = qword_100010A58;
    swift_bridgeObjectRetain(v12);
    if (v14 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_1000032F4(v15, (uint64_t)qword_100010C20);
    uint64_t v17 = swift_bridgeObjectRetain_n(v12, 2LL);
    uint64_t v41 = v16;
    unint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v43 = v5;
    if (v20)
    {
      uint64_t v39 = v4;
      uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      uint64_t v40 = a2;
      uint64_t v23 = v22;
      uint64_t v47 = v22;
      *(_DWORD *)uint64_t v21 = 136446210;
      swift_bridgeObjectRetain(v12);
      uint64_t v45 = sub_1000075A0(v13, v12, &v47);
      uint64_t v4 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease_n(v12, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "no-auth-required cookie file path %{public}s", v21, 0xCu);
      swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v24 = v23;
      a2 = v40;
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    id v31 = v44;
    uint64_t v47 = 0LL;
    unint64_t v48 = 0xE000000000000000LL;
    uint64_t v32 = URL.init(fileURLWithPath:)(v13, v12);
    static String.Encoding.utf8.getter(v32);
    unint64_t v33 = sub_1000093DC();
    StringProtocol.write(to:atomically:encoding:)(v11, 1LL, v7, &type metadata for String, v33);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v4);
    (*(void (**)(char *, id))(v42 + 8))(v11, v31);
    swift_bridgeObjectRelease(v48);
    uint64_t v34 = swift_bridgeObjectRetain(v12);
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v47 = v38;
      *(_DWORD *)os_log_type_t v37 = 136446210;
      swift_bridgeObjectRetain(v12);
      uint64_t v45 = sub_1000075A0(v13, v12, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease_n(v12, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "Created no-auth-required cookie file for automation mode at %{public}s",  v37,  0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0LL);
  }

  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.dt.AutomationMode.writer.error");
    uint64_t v26 = v25;
    id v27 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v26);
    id v29 = [v27 initWithDomain:v28 code:3 userInfo:0];

    id v30 = v29;
    id v44 = (id)_convertErrorToNSError(_:)(v30);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v44);
  }

void sub_100008DF4(uint64_t a1, void (**a2)(id))
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_100008540() & 1) != 0)
  {
    uint64_t v9 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath);
    unint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8);
    uint64_t v10 = qword_100010A58;
    swift_bridgeObjectRetain(v8);
    if (v10 != -1) {
      swift_once(&qword_100010A58, sub_10000350C);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    sub_1000032F4(v11, (uint64_t)qword_100010C20);
    uint64_t v12 = swift_bridgeObjectRetain_n(v8, 2LL);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v43 = v4;
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v16 = (void *)swift_slowAlloc(32LL, -1LL);
      id v44 = a2;
      uint64_t v17 = v16;
      id v47 = v16;
      uint64_t v42 = v5;
      *(_DWORD *)uint64_t v15 = 136446210;
      swift_bridgeObjectRetain(v8);
      uint64_t v45 = sub_1000075A0(v9, v8, (uint64_t *)&v47);
      uint64_t v5 = v42;
      uint64_t v4 = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease_n(v8, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "no-auth-required cookie file path %{public}s", v15, 0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      unint64_t v18 = v17;
      a2 = v44;
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v8, 2LL);
    }

    id v27 = [(id)objc_opt_self(NSFileManager) defaultManager];
    URL.init(fileURLWithPath:)(v9, v8);
    URL._bridgeToObjectiveC()(v28);
    id v30 = v29;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id v47 = 0LL;
    unsigned int v31 = [v27 removeItemAtURL:v30 error:&v47];

    id v32 = v47;
    if (v31)
    {
      uint64_t v33 = swift_bridgeObjectRetain(v8);
      uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v34, v35))
      {
        os_log_type_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        os_log_type_t v37 = (void *)swift_slowAlloc(32LL, -1LL);
        id v47 = v37;
        *(_DWORD *)os_log_type_t v36 = 136446210;
        swift_bridgeObjectRetain(v8);
        uint64_t v45 = sub_1000075A0(v9, v8, (uint64_t *)&v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease_n(v8, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Removed no-auth-required cookie file for automation mode at %{public}s",  v36,  0xCu);
        swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v8, 2LL);
      }

      ((void (*)(void (**)(id), void))a2[2])(a2, 0LL);
    }

    else
    {
      uint64_t v38 = v32;
      swift_bridgeObjectRelease(v8);
      uint64_t v39 = _convertNSErrorToError(_:)(v38);

      swift_willThrow();
      swift_errorRetain(v39);
      uint64_t v40 = (void *)_convertErrorToNSError(_:)(v39);
      ((void (*)(void (**)(id), void *))a2[2])(a2, v40);

      swift_errorRelease(v39);
      swift_errorRelease(v39);
    }
  }

  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.dt.AutomationMode.writer.error");
    uint64_t v20 = v19;
    id v21 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    id v23 = [v21 initWithDomain:v22 code:3 userInfo:0];

    id v24 = v23;
    uint64_t v25 = (void (**)(id))_convertErrorToNSError(_:)(v24);
    uint64_t v26 = a2[2];
    id v44 = v25;
    v26(a2);
  }

uint64_t sub_10000931C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000935C(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100009394(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000334C(&qword_100010DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000093DC()
{
  unint64_t result = qword_100010DD8;
  if (!qword_100010DD8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010DD8);
  }

  return result;
}

uint64_t sub_100009420(uint64_t result, unint64_t a2)
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

uint64_t sub_100009464()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100009488(uint64_t a1)
{
}

uint64_t sub_100009494(uint64_t a1)
{
  return sub_1000072E8(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000094A0(uint64_t result, unint64_t a2)
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

uint64_t sub_1000094E8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

id sub_100009514(uint64_t a1, uint64_t a2)
{
  return sub_100003800(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_100009520(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009530(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

_OWORD *sub_100009538(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100009548(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009584(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000095B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000334C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000095FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000334C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100009638(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

_BYTE *sub_100009678@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1LL << v3) & 0x100003E01LL;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0LL && *result == 0;
  *a2 = v7;
  return result;
}