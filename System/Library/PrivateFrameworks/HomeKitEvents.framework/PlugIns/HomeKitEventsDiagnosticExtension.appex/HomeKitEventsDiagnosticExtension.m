uint64_t sub_100004920()
{
  uint64_t v0;
  v0 = type metadata accessor for DispatchTimeInterval(0LL);
  sub_1000070B8(v0, qword_10000C280);
  *(void *)sub_10000668C(v0, (uint64_t)qword_10000C280) = 300LL;
  return (*(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL))();
}

void sub_100004980(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType(v1);
  sub_100006520(&qword_10000C168);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v105 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchTime(0LL);
  uint64_t v100 = *(void *)(v9 - 8);
  v101 = (uint8_t *)v9;
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v98 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  v99 = (char *)&v91 - v12;
  uint64_t v13 = sub_100006520(&qword_10000C170);
  __chkstk_darwin(v13);
  v15 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v104 = type metadata accessor for Logger(0LL);
  v16 = *(void (**)(char *, uint64_t))(v104 - 8);
  uint64_t v17 = __chkstk_darwin(v104);
  v95 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  v94 = (char *)&v91 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v91 - v21;
  uint64_t v97 = sub_10000718C( &qword_10000C178,  v23,  (uint64_t (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension,  (uint64_t)"m\r");
  uint64_t v102 = ObjectType;
  static LoggedObject.logger.getter(ObjectType);
  uint64_t v24 = swift_bridgeObjectRetain_n(a1, 2LL);
  v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v96 = v16;
    v103 = v15;
    v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v93 = (dispatch_semaphore_s *)swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v107 = v93;
    *(_DWORD *)v27 = 136315138;
    if (!a1)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    v91 = v27 + 4;
    uint64_t v28 = swift_bridgeObjectRetain(a1);
    v92 = (char *)&type metadata for Any + 8;
    uint64_t v29 = Dictionary.description.getter(v28, &type metadata for AnyHashable);
    unint64_t v31 = v30;
    swift_bridgeObjectRelease(a1);
    *(void *)&__int128 v109 = sub_100006754(v29, v31, (uint64_t *)&v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, (char *)&v109 + 8, v91, v27 + 12);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease_n(a1, 2LL);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Starting with parameters: %s", v27, 0xCu);
    v32 = v93;
    swift_arrayDestroy(v93, 1LL, v92);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v27, -1LL, -1LL);

    v33 = (void (*)(char *, uint64_t))*((void *)v96 + 1);
    v33(v22, v104);
    v15 = v103;
LABEL_5:
    v106[0] = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(@"DEExtensionAttachmentsParamConsentProvidedKey");
    v106[1] = v34;
    AnyHashable.init<A>(_:)(&v107, v106, &type metadata for String, &protocol witness table for String);
    uint64_t v35 = v102;
    if (*(void *)(a1 + 16) && (unint64_t v36 = sub_100006D94((uint64_t)&v107), (v37 & 1) != 0))
    {
      sub_100006F0C(*(void *)(a1 + 56) + 32 * v36, (uint64_t)&v109);
    }

    else
    {
      __int128 v109 = 0u;
      __int128 v110 = 0u;
    }

    sub_1000071CC((uint64_t)&v107);
    v96 = v33;
    if (*((void *)&v110 + 1))
    {
      uint64_t v38 = sub_100006EA4(0LL, &qword_10000C198, &OBJC_CLASS___NSNumber_ptr);
      if ((swift_dynamicCast(v106, &v109, (char *)&type metadata for Any + 8, v38, 6LL) & 1) != 0)
      {
        id v39 = v106[0];
        unsigned __int8 v40 = [v106[0] BOOLValue];

        goto LABEL_14;
      }
    }

    else
    {
      sub_100007200((uint64_t)&v109, (uint64_t *)&unk_10000C1E0);
    }

    unsigned __int8 v40 = 0;
LABEL_14:
    uint64_t v41 = swift_allocObject(&unk_100008458, 32LL, 7LL);
    *(_DWORD *)(v41 + 16) = 0;
    v42 = (os_unfair_lock_s *)(v41 + 16);
    *(void *)(v41 + 24) = &_swiftEmptyArrayStorage;
    dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
    uint64_t v44 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56LL))(v15, 1LL, 1LL, v44);
    uint64_t v45 = swift_allocObject(&unk_100008480, 64LL, 7LL);
    *(void *)(v45 + 16) = 0LL;
    *(void *)(v45 + 24) = 0LL;
    *(_BYTE *)(v45 + 32) = v40;
    *(void *)(v45 + 40) = v41;
    *(void *)(v45 + 48) = v43;
    *(void *)(v45 + 56) = v35;
    v103 = (char *)v41;
    swift_retain(v41);
    v46 = v43;
    uint64_t v47 = sub_1000057A4((uint64_t)v15, (uint64_t)&unk_10000C190, v45);
    uint64_t v48 = swift_release(v47);
    v49 = v98;
    static DispatchTime.now()(v48);
    if (qword_10000C1F0 != -1) {
      swift_once(&qword_10000C1F0, sub_100004920);
    }
    uint64_t v50 = type metadata accessor for DispatchTimeInterval(0LL);
    uint64_t v51 = sub_10000668C(v50, (uint64_t)qword_10000C280);
    v52 = v99;
    DispatchTime.advanced(by:)(v51);
    v53 = v101;
    v54 = *(void (**)(char *, uint8_t *))(v100 + 8);
    v54(v49, v101);
    char v55 = OS_dispatch_semaphore.wait(timeout:)(v52);
    v54(v52, v53);
    if ((v55 & 1) != 0)
    {
      v71 = v94;
      uint64_t v72 = static LoggedObject.logger.getter(v35);
      v73 = (os_log_s *)Logger.logObject.getter(v72);
      os_log_type_t v74 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v73, v74))
      {
        v75 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v73, v74, "Timed out collecting attachments", v75, 2u);
        swift_slowDealloc(v75, -1LL, -1LL);
      }

      v96(v71, v104);
    }

    else
    {
      os_unfair_lock_lock(v42);
      uint64_t v56 = *((void *)v103 + 3);
      swift_bridgeObjectRetain(v56);
      v57 = v42;
      uint64_t v58 = v56;
      os_unfair_lock_unlock(v57);
      v59 = v95;
      static LoggedObject.logger.getter(v35);
      uint64_t v60 = swift_bridgeObjectRetain_n(v56, 2LL);
      v61 = (os_log_s *)Logger.logObject.getter(v60);
      os_log_type_t v62 = static os_log_type_t.default.getter();
      BOOL v63 = os_log_type_enabled(v61, v62);
      v93 = v46;
      if (v63)
      {
        v64 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v102 = swift_slowAlloc(32LL, -1LL);
        *(void *)&__int128 v107 = v102;
        *(_DWORD *)v64 = 136315138;
        v101 = v64 + 4;
        uint64_t v65 = swift_bridgeObjectRetain(v58);
        uint64_t v66 = Array.description.getter(v65, v6);
        unint64_t v68 = v67;
        swift_bridgeObjectRelease(v58);
        *(void *)&__int128 v109 = sub_100006754(v66, v68, (uint64_t *)&v107);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, (char *)&v109 + 8, v101, v64 + 12);
        swift_bridgeObjectRelease(v68);
        swift_bridgeObjectRelease_n(v58, 2LL);
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Finished collecting attachments: %s", v64, 0xCu);
        uint64_t v69 = v102;
        swift_arrayDestroy(v102, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v69, -1LL, -1LL);
        v46 = v93;
        swift_slowDealloc(v64, -1LL, -1LL);

        v70 = v95;
      }

      else
      {
        swift_bridgeObjectRelease_n(v58, 2LL);

        v70 = v59;
      }

      v96(v70, v104);
      int64_t v76 = *(void *)(v58 + 16);
      if (v76)
      {
        *(void *)&__int128 v109 = &_swiftEmptyArrayStorage;
        sub_100006E88(0, v76, 0);
        unint64_t v77 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
        uint64_t v104 = v58;
        unint64_t v78 = v58 + v77;
        uint64_t v79 = *(void *)(v7 + 72);
        v80 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
        while (1)
        {
          v81 = v105;
          v80(v105, v78, v6);
          v80(v5, (unint64_t)v81, v6);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0LL, 1LL, v6);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
          {
            v83 = 0LL;
          }

          else
          {
            URL._bridgeToObjectiveC()(v82);
            v83 = v84;
            (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
          }

          id v85 = [objc_allocWithZone(DEAttachmentItem) initWithPathURL:v83];

          if (!v85) {
            break;
          }
          sub_100006EA4(0LL, &qword_10000C198, &OBJC_CLASS___NSNumber_ptr);
          Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
          [v85 setShouldCompress:isa];

          Class v87 = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
          [v85 setDeleteOnAttach:v87];

          uint64_t v108 = sub_100006EA4(0LL, &qword_10000C1A0, &OBJC_CLASS___DEAttachmentItem_ptr);
          *(void *)&__int128 v107 = v85;
          (*(void (**)(char *, uint64_t))(v7 + 8))(v105, v6);
          uint64_t v88 = v109;
          if ((swift_isUniquelyReferenced_nonNull_native(v109) & 1) == 0)
          {
            sub_100006E88(0, *(void *)(v88 + 16) + 1LL, 1);
            uint64_t v88 = v109;
          }

          unint64_t v90 = *(void *)(v88 + 16);
          unint64_t v89 = *(void *)(v88 + 24);
          if (v90 >= v89 >> 1)
          {
            sub_100006E88(v89 > 1, v90 + 1, 1);
            uint64_t v88 = v109;
          }

          *(void *)(v88 + 16) = v90 + 1;
          sub_100006EDC(&v107, (_OWORD *)(v88 + 32 * v90 + 32));
          v78 += v79;
          if (!--v76)
          {

            swift_bridgeObjectRelease(v104);
            swift_release(v103);
            return;
          }
        }

        __break(1u);
        goto LABEL_38;
      }

      swift_bridgeObjectRelease(v58);
    }

    swift_release(v103);
    return;
  }

  swift_bridgeObjectRelease_n(a1, 2LL);

  v33 = (void (*)(char *, uint64_t))*((void *)v16 + 1);
  v33(v22, v104);
  if (a1) {
    goto LABEL_5;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_100005400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a5;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v7[6] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v7[7] = v10;
  v7[8] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  v7[9] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v7[10] = v12;
  uint64_t v13 = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v7[11] = v13;
  uint64_t v14 = (void *)swift_task_alloc(async function pointer to collectDiagnostics(includeSensitiveData:)[1]);
  v7[12] = v14;
  *uint64_t v14 = v7;
  v14[1] = sub_1000054B4;
  return collectDiagnostics(includeSensitiveData:)(v13, a4);
}

uint64_t sub_1000054B4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96LL);
  *(void *)(*(void *)v1 + 104LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    v3 = sub_1000055BC;
  }
  else {
    v3 = sub_100005518;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100005518()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 24);
  v5 = sub_100005A24(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
  swift_bridgeObjectRelease(*(void *)(v4 + 24));
  *(void *)(v4 + 24) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 64);
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000055BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 40);
  sub_10000718C( &qword_10000C178,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension,  (uint64_t)"m\r");
  static LoggedObject.logger.getter(v4);
  swift_errorRetain(v3);
  uint64_t v5 = swift_errorRetain(v3);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v2 + 104);
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v9 = 138412290;
    swift_errorRetain(v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(void *)(v2 + 16) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 16, v2 + 24, v9 + 4, v9 + 12);
    *uint64_t v10 = v11;
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to collect attachments: %@", v9, 0xCu);
    uint64_t v12 = sub_100006520(&qword_10000C1C8);
    swift_arrayDestroy(v10, 1LL, v12);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    swift_errorRelease(v8);
  }

  else
  {
    uint64_t v13 = *(void *)(v2 + 104);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
  }

  (*(void (**)(void, void))(*(void *)(v2 + 56) + 8LL))(*(void *)(v2 + 64), *(void *)(v2 + 48));
  uint64_t v14 = *(void *)(v2 + 88);
  uint64_t v15 = *(void *)(v2 + 64);
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000057A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100007200(a1, &qword_10000C170);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_1000084A8, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10000C1C0, v16);
}

id sub_1000059D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeKitEventsDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HomeKitEventsDiagnosticExtension()
{
  return objc_opt_self(&OBJC_CLASS____TtC32HomeKitEventsDiagnosticExtension32HomeKitEventsDiagnosticExtension);
}

_OWORD *sub_100005A24(uint64_t a1)
{
  uint64_t v2 = sub_100006520(&qword_10000C168);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v115 = *(void *)(v5 - 8);
  uint64_t v116 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v118 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  v112 = (char *)&v103 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v117 = (char *)&v103 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v111 = (char *)&v103 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v103 - v18;
  uint64_t v121 = type metadata accessor for Logger(0LL);
  uint64_t v119 = *(void *)(v121 - 8);
  uint64_t v20 = __chkstk_darwin(v121);
  v22 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v20);
  v113 = (char *)&v103 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  __int128 v110 = (char *)&v103 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v103 - v27;
  id v29 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v120 = NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)(a1, 0LL, 0LL, 0LL, 0LL);
  if (!v120)
  {
    uint64_t v45 = type metadata accessor for HomeKitEventsDiagnosticExtension();
    sub_10000718C( &qword_10000C178,  v46,  (uint64_t (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension,  (uint64_t)"m\r");
    static LoggedObject.logger.getter(v45);
    uint64_t v47 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v118, a1, v8);
    uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc(12LL, -1LL);
      id v114 = v29;
      uint64_t v51 = (uint8_t *)v50;
      uint64_t v52 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v51 = 136315138;
      v122 = v51 + 4;
      v123[0] = v52;
      uint64_t v53 = sub_10000718C( &qword_10000C1D0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      v54 = v118;
      uint64_t v55 = dispatch thunk of CustomStringConvertible.description.getter(v8, v53);
      unint64_t v57 = v56;
      v125 = (uint8_t *)sub_100006754(v55, v56, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v122, v51 + 12);
      swift_bridgeObjectRelease(v57);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v54, v8);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Could not enumerate '%s'", v51, 0xCu);
      swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1LL, -1LL);
      uint64_t v58 = v51;
      id v29 = v114;
      swift_slowDealloc(v58, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v118, v8);
    }

    (*(void (**)(char *, uint64_t))(v119 + 8))(v22, v121);
LABEL_27:
    unint64_t v89 = &_swiftEmptyArrayStorage;
    goto LABEL_28;
  }

  id v114 = v29;
  uint64_t v30 = type metadata accessor for HomeKitEventsDiagnosticExtension();
  uint64_t v107 = sub_10000718C( &qword_10000C178,  v31,  (uint64_t (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension,  (uint64_t)"m\r");
  uint64_t v108 = v30;
  static LoggedObject.logger.getter(v30);
  v118 = *(char **)(v9 + 16);
  uint64_t v32 = ((uint64_t (*)(char *, uint64_t, uint64_t))v118)(v19, a1, v8);
  v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.info.getter();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v109 = a1;
  if (v35)
  {
    unint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(void *)&__int128 v105 = swift_slowAlloc(32LL, -1LL);
    v123[0] = v105;
    uint64_t v104 = v36;
    *(_DWORD *)unint64_t v36 = 136315138;
    char v37 = v36 + 12;
    v106 = (void (*)(char *, uint64_t))(v36 + 4);
    uint64_t v38 = sub_10000718C( &qword_10000C1D0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v39 = dispatch thunk of CustomStringConvertible.description.getter(v8, v38);
    unint64_t v41 = v40;
    v125 = (uint8_t *)sub_100006754(v39, v40, v123);
    v42 = v37;
    a1 = v109;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v106, v42);
    swift_bridgeObjectRelease(v41);
    v106 = *(void (**)(char *, uint64_t))(v9 + 8);
    v106(v19, v8);
    dispatch_semaphore_t v43 = v104;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Enumerating '%s' for attachments", v104, 0xCu);
    uint64_t v44 = v105;
    swift_arrayDestroy(v105, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1LL, -1LL);
    swift_slowDealloc(v43, -1LL, -1LL);
  }

  else
  {
    v106 = *(void (**)(char *, uint64_t))(v9 + 8);
    v106(v19, v8);
  }

  uint64_t v119 = *(void *)(v119 + 8);
  uint64_t v59 = ((uint64_t (*)(char *, uint64_t))v119)(v28, v121);
  uint64_t v60 = (void *)v120;
  v61 = v117;
  uint64_t v62 = NSEnumerator.makeIterator()(v59);
  NSFastEnumerationIterator.next()(v123, v62);
  if (!v124)
  {
    (*(void (**)(char *, uint64_t))(v115 + 8))(v7, v116);
LABEL_21:
    unint64_t v90 = v113;
    static LoggedObject.logger.getter(v108);
    v91 = v112;
    uint64_t v92 = ((uint64_t (*)(char *, uint64_t, uint64_t))v118)(v112, a1, v8);
    v93 = (os_log_s *)Logger.logObject.getter(v92);
    os_log_type_t v94 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = v91;
      v96 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v97 = swift_slowAlloc(32LL, -1LL);
      v123[0] = v97;
      *(_DWORD *)v96 = 136315138;
      uint64_t v98 = sub_10000718C( &qword_10000C1D0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      uint64_t v99 = dispatch thunk of CustomStringConvertible.description.getter(v8, v98);
      unint64_t v101 = v100;
      v125 = (uint8_t *)sub_100006754(v99, v100, v123);
      uint64_t v60 = (void *)v120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v96 + 4, v96 + 12);
      swift_bridgeObjectRelease(v101);
      v106(v95, v8);
      _os_log_impl((void *)&_mh_execute_header, v93, v94, "Directory '%s' is empty", v96, 0xCu);
      swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v97, -1LL, -1LL);
      swift_slowDealloc(v96, -1LL, -1LL);
    }

    else
    {
      v106(v91, v8);
    }

    ((void (*)(char *, uint64_t))v119)(v90, v121);
    id v29 = v114;

    goto LABEL_27;
  }

  char v64 = 1;
  *(void *)&__int128 v63 = 136315138LL;
  __int128 v105 = v63;
  do
  {
    while (1)
    {
      int v66 = swift_dynamicCast(v4, v123, (char *)&type metadata for Any + 8, v8, 6LL);
      unint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      if (!v66)
      {
        v67(v4, 1LL, 1LL, v8);
        break;
      }

      v67(v4, 0LL, 1LL, v8);
      unint64_t v68 = v111;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v111, v4, v8);
      static LoggedObject.logger.getter(v108);
      uint64_t v69 = ((uint64_t (*)(char *, char *, uint64_t))v118)(v61, v68, v8);
      v70 = v61;
      v71 = (os_log_s *)Logger.logObject.getter(v69);
      os_log_type_t v72 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = swift_slowAlloc(12LL, -1LL);
        uint64_t v104 = (uint8_t *)swift_slowAlloc(32LL, -1LL);
        v125 = v104;
        *(_DWORD *)uint64_t v73 = v105;
        os_log_t v103 = v71;
        os_log_type_t v74 = v70;
        uint64_t v75 = URL.lastPathComponent.getter();
        unint64_t v77 = v76;
        *(void *)(v73 + 4) = sub_100006754(v75, v76, (uint64_t *)&v125);
        swift_bridgeObjectRelease(v77);
        unint64_t v78 = (uint64_t (*)(char *, uint64_t))v106;
        v106(v74, v8);
        os_log_t v79 = v103;
        os_log_type_t v80 = v72;
        uint64_t v81 = v73;
        _os_log_impl((void *)&_mh_execute_header, v103, v80, "Adding '%s' to attachments", (uint8_t *)v73, 0xCu);
        v82 = v104;
        swift_arrayDestroy(v104, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v82, -1LL, -1LL);
        uint64_t v60 = (void *)v120;
        swift_slowDealloc(v81, -1LL, -1LL);

        ((void (*)(char *, uint64_t))v119)(v110, v121);
        uint64_t v83 = v78(v111, v8);
        v61 = v117;
      }

      else
      {

        v84 = v70;
        v61 = v70;
        id v85 = (uint64_t (*)(char *, uint64_t))v106;
        v106(v84, v8);
        ((void (*)(char *, uint64_t))v119)(v110, v121);
        uint64_t v83 = v85(v111, v8);
        uint64_t v60 = (void *)v120;
      }

      NSFastEnumerationIterator.next()(v123, v83);
      char v64 = 0;
      if (!v124)
      {
        (*(void (**)(char *, uint64_t))(v115 + 8))(v7, v116);
        a1 = v109;
        goto LABEL_19;
      }
    }

    uint64_t v65 = sub_100007200((uint64_t)v4, &qword_10000C168);
    NSFastEnumerationIterator.next()(v123, v65);
  }

  while (v124);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v7, v116);
  a1 = v109;
  if ((v64 & 1) != 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v86 = sub_100006520(&qword_10000C1D8);
  uint64_t v87 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v88 = (v87 + 32) & ~v87;
  unint64_t v89 = (_OWORD *)swift_allocObject(v86, v88 + *(void *)(v9 + 72), v87 | 7);
  v89[1] = xmmword_100007720;
  ((void (*)(char *, uint64_t, uint64_t))v118)((char *)v89 + v88, a1, v8);

  id v29 = v114;
LABEL_28:

  return v89;
}

unint64_t sub_100006504()
{
  return 0xD000000000000013LL;
}

uint64_t sub_100006520(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006560()
{
  uint64_t v1 = sub_100006520(&qword_10000C180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0 + 24, v1);
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000065A8()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_1000065DC()
{
  uint64_t v2 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = (void *)swift_task_alloc(dword_10000C18C);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100006644;
  return sub_100005400((uint64_t)v6, v7, v8, v2, v3, v4, v5);
}

uint64_t sub_100006644()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000668C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000066A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006708;
  return v6(a1);
}

uint64_t sub_100006708()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100006754(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006824(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006F0C((uint64_t)v12, *a3);
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
      sub_100006F0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006EEC(v12);
  return v7;
}

uint64_t sub_100006824(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000069DC(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_1000069DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006A70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006C48(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006C48(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006A70(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100006BE4(v4, 0LL);
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

void *sub_100006BE4(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100006520(&qword_10000C1A8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006C48(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006520(&qword_10000C1A8);
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

unint64_t sub_100006D94(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100006DC4(a1, v4);
}

unint64_t sub_100006DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_10000723C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000071CC((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_100006E88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006F4C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100006EA4(uint64_t a1, unint64_t *a2, void *a3)
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

_OWORD *sub_100006EDC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006EEC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006F4C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100006520(&qword_10000C1B0);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  int v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t *sub_1000070B8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000070F8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000711C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C1BC);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100006644;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000C1B8 + dword_10000C1B8))(a1, v4);
}

uint64_t sub_10000718C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_1000071CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007200(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006520(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000723C(uint64_t a1, uint64_t a2)
{
  return a2;
}