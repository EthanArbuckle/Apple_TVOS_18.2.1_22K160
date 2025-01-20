uint64_t sub_44CC(uint64_t *a1, char a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  v3 = *a1;
  v4 = *(void *)&v2[*a1];
  if (v4)
  {
    v5 = v4;
  }

  else
  {
    v7 = v2;
    v8 = type metadata accessor for HoverTextCoordinator();
    swift_allocObject(v8, 89LL, 7LL);
    v5 = HoverTextCoordinator.init(withService:isHoverTextTyping:)(v2, a2 & 1);
    v9 = *(void *)&v7[v3];
    *(void *)&v7[v3] = v5;
    swift_retain();
    swift_release(v9);
  }

  swift_retain();
  return v5;
}

id sub_454C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for HoverTextAXUIService()) init];
  qword_CC28 = (uint64_t)result;
  return result;
}

id sub_4578()
{
  if (qword_CC20 != -1) {
    swift_once(&qword_CC20, sub_454C);
  }
  return (id)swift_dynamicCastClassUnconditional(qword_CC28, v0, 0LL, 0LL, 0LL);
}

unint64_t sub_45F0(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v44 = a3;
  v5 = v4;
  uint64_t v50 = a2;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1) {
    unint64_t v12 = a1;
  }
  else {
    unint64_t v12 = sub_4A18((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v43 = Dictionary.description.getter( v12,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  unint64_t v14 = v13;
  *(void *)&__int128 v48 = 1954047348LL;
  *((void *)&v48 + 1) = 0xE400000000000000LL;
  AnyHashable.init<A>(_:)(v47, &v48, &type metadata for String, &protocol witness table for String);
  if (*(void *)(v12 + 16) && (unint64_t v15 = sub_63C8((uint64_t)v47), (v16 & 1) != 0))
  {
    sub_6530(*(void *)(v12 + 56) + 32 * v15, (uint64_t)&v48);
  }

  else
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
  }

  swift_bridgeObjectRelease(v12);
  sub_63F8((uint64_t)v47);
  if (*((void *)&v49 + 1))
  {
    int v17 = swift_dynamicCast(&v45, &v48, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
    if (v17) {
      uint64_t v18 = v45;
    }
    else {
      uint64_t v18 = 0LL;
    }
    if (v17) {
      uint64_t v19 = v46;
    }
    else {
      uint64_t v19 = 0LL;
    }
    uint64_t v41 = v19;
    uint64_t v42 = v18;
  }

  else
  {
    sub_642C((uint64_t)&v48, &qword_CB88);
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
  }

  uint64_t v20 = HTLog.unsafeMutableAddressor();
  swift_beginAccess(v20, v47, 0LL, 0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v20, v8);
  swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v21 = swift_bridgeObjectRetain_n(v14, 2LL);
  v22 = (os_log_s *)Logger.logObject.getter(v21);
  uint64_t v23 = v8;
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    v40 = v5;
    uint64_t v26 = v25;
    uint64_t v27 = swift_slowAlloc(64LL, -1LL);
    unint64_t v28 = a4;
    uint64_t v39 = v23;
    uint64_t v29 = v27;
    *(void *)&__int128 v48 = v27;
    *(_DWORD *)uint64_t v26 = 134218498;
    uint64_t v45 = v50;
    uint64_t v38 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v26 + 4, v26 + 12);
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    uint64_t v45 = sub_5D88(v44, a4, (uint64_t *)&v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v26 + 14, v26 + 22);
    swift_bridgeObjectRelease_n(a4, 3LL);
    *(_WORD *)(v26 + 22) = 2080;
    swift_bridgeObjectRetain(v14);
    v37 = v11;
    uint64_t v30 = v43;
    uint64_t v45 = sub_5D88(v43, v14, (uint64_t *)&v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v26 + 24, v26 + 32);
    swift_bridgeObjectRelease_n(v14, 3LL);
    _os_log_impl(&dword_0, v22, v24, "Service got a message: %ld from client: %s. Payload: %s", (uint8_t *)v26, 0x20u);
    swift_arrayDestroy(v29, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1LL, -1LL);
    uint64_t v31 = v26;
    v5 = v40;
    swift_slowDealloc(v31, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v39);
  }

  else
  {

    swift_bridgeObjectRelease_n(v14, 2LL);
    swift_bridgeObjectRelease_n(a4, 2LL);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
    unint64_t v28 = a4;
    uint64_t v30 = v43;
  }

  uint64_t v33 = v41;
  uint64_t v32 = v42;
  v34 = (void *)swift_allocObject(&unk_84B8, 80LL, 7LL);
  v34[2] = v50;
  v34[3] = v5;
  v34[4] = v32;
  v34[5] = v33;
  v34[6] = v44;
  v34[7] = v28;
  v34[8] = v30;
  v34[9] = v14;
  swift_bridgeObjectRetain(v28);
  id v35 = v5;
  dispatch thunk of AXMainActorSerialQueue.async(_:)(&unk_CB98, v34);
  swift_release(v34);
  return sub_4A18((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_4A18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_5AE0(&qword_CBA8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (void *)v3;
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
    sub_6690(v7, (uint64_t)v16);
    unint64_t result = sub_63C8((uint64_t)v16);
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
    unint64_t result = (unint64_t)sub_66D8(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_4B44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = a7;
  v8[15] = a8;
  v8[12] = a5;
  v8[13] = a6;
  v8[10] = a3;
  v8[11] = a4;
  v8[8] = a1;
  v8[9] = a2;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v8[16] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[17] = v10;
  v8[18] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for MainActor(0LL);
  v8[19] = static MainActor.shared.getter();
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v8[20] = v12;
  v8[21] = v13;
  return swift_task_switch(sub_4BE4, v12, v13);
}

uint64_t sub_4BE4()
{
  switch(*(void *)(v0 + 64))
  {
    case 1LL:
      *(void *)(v0 + 192) = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator, 0);
      v1 = (void *)swift_task_alloc(async function pointer to HoverTextCoordinator.startHoverText()[1]);
      *(void *)(v0 + 200) = v1;
      uint64_t v2 = sub_5090;
      goto LABEL_7;
    case 2LL:
      *(void *)(v0 + 176) = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator, 0);
      uint64_t v3 = (void *)swift_task_alloc(async function pointer to HoverTextCoordinator.stopHoverText()[1]);
      *(void *)(v0 + 184) = v3;
      v4 = sub_5004;
      goto LABEL_9;
    case 3LL:
      uint64_t v5 = *(void *)(v0 + 88);
      swift_release(*(void *)(v0 + 152));
      if (v5)
      {
        uint64_t v7 = *(void *)(v0 + 80);
        uint64_t v6 = *(void **)(v0 + 88);
        uint64_t v8 = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator, 0);
        v9._countAndFlagsBits = v7;
        v9._object = v6;
        HoverTextCoordinator.showAlert(_:)(v9);
        swift_release(v8);
      }

      goto LABEL_13;
    case 4LL:
      *(void *)(v0 + 208) = sub_44CC( &OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator,  1);
      v1 = (void *)swift_task_alloc(async function pointer to HoverTextCoordinator.startHoverText()[1]);
      *(void *)(v0 + 216) = v1;
      uint64_t v2 = sub_50E4;
LABEL_7:
      void *v1 = v0;
      v1[1] = v2;
      return HoverTextCoordinator.startHoverText()();
    case 5LL:
      *(void *)(v0 + 224) = sub_44CC( &OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator,  1);
      uint64_t v3 = (void *)swift_task_alloc(async function pointer to HoverTextCoordinator.stopHoverText()[1]);
      *(void *)(v0 + 232) = v3;
      v4 = sub_5138;
LABEL_9:
      *uint64_t v3 = v0;
      v3[1] = v4;
      uint64_t result = HoverTextCoordinator.stopHoverText()();
      break;
    default:
      uint64_t v11 = *(void *)(v0 + 144);
      uint64_t v12 = *(void *)(v0 + 128);
      uint64_t v13 = *(void *)(v0 + 136);
      uint64_t v14 = *(void *)(v0 + 120);
      uint64_t v15 = *(void *)(v0 + 104);
      uint64_t v16 = swift_release(*(void *)(v0 + 152));
      uint64_t v17 = HTLog.unsafeMutableAddressor(v16);
      swift_beginAccess(v17, v0 + 16, 0LL, 0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v17, v12);
      swift_bridgeObjectRetain_n(v15, 2LL);
      uint64_t v18 = swift_bridgeObjectRetain_n(v14, 2LL);
      uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v20 = static os_log_type_t.error.getter();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v23 = *(void *)(v0 + 136);
      uint64_t v22 = *(void *)(v0 + 144);
      unint64_t v25 = *(void *)(v0 + 120);
      uint64_t v24 = *(void *)(v0 + 128);
      if (v21)
      {
        uint64_t v33 = *(void *)(v0 + 144);
        unint64_t v26 = *(void *)(v0 + 104);
        uint64_t v31 = *(void *)(v0 + 112);
        uint64_t v30 = *(void *)(v0 + 96);
        uint64_t v27 = *(void *)(v0 + 64);
        uint64_t v32 = *(void *)(v0 + 136);
        uint64_t v28 = swift_slowAlloc(32LL, -1LL);
        uint64_t v29 = swift_slowAlloc(64LL, -1LL);
        uint64_t v34 = v29;
        *(_DWORD *)uint64_t v28 = 134218498;
        *(void *)(v0 + 40) = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v28 + 4, v28 + 12);
        *(_WORD *)(v28 + 12) = 2080;
        swift_bridgeObjectRetain(v26);
        *(void *)(v0 + 48) = sub_5D88(v30, v26, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v28 + 14, v28 + 22);
        swift_bridgeObjectRelease_n(v26, 3LL);
        *(_WORD *)(v28 + 22) = 2080;
        swift_bridgeObjectRetain(v25);
        *(void *)(v0 + 56) = sub_5D88(v31, v25, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v28 + 24, v28 + 32);
        swift_bridgeObjectRelease_n(v25, 3LL);
        _os_log_impl( &dword_0,  v19,  v20,  "Unhandled service message: %ld from client: %s. Payload: %s",  (uint8_t *)v28,  0x20u);
        swift_arrayDestroy(v29, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v29, -1LL, -1LL);
        swift_slowDealloc(v28, -1LL, -1LL);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v24);
      }

      else
      {
        swift_bridgeObjectRelease_n(*(void *)(v0 + 104), 2LL);
        swift_bridgeObjectRelease_n(v25, 2LL);

        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
      }

LABEL_13:
      swift_task_dealloc(*(void *)(v0 + 144));
      uint64_t result = (*(uint64_t (**)(void))(v0 + 8))();
      break;
  }

  return result;
}

    uint64_t result = sub_6010(a5, a6);
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

uint64_t sub_5004()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 176);
  swift_task_dealloc(*(void *)(*v0 + 184));
  swift_release(v2);
  return swift_task_switch(sub_5058, *(void *)(v1 + 160), *(void *)(v1 + 168));
}

uint64_t sub_5058()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5090()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 192);
  swift_task_dealloc(*(void *)(*v0 + 200));
  swift_release(v2);
  return swift_task_switch(sub_66EC, *(void *)(v1 + 160), *(void *)(v1 + 168));
}

uint64_t sub_50E4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 208);
  swift_task_dealloc(*(void *)(*v0 + 216));
  swift_release(v2);
  return swift_task_switch(sub_66EC, *(void *)(v1 + 160), *(void *)(v1 + 168));
}

uint64_t sub_5138()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 224);
  swift_task_dealloc(*(void *)(*v0 + 232));
  swift_release(v2);
  return swift_task_switch(sub_66EC, *(void *)(v1 + 160), *(void *)(v1 + 168));
}

uint64_t sub_5334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for MainActor(0LL);
  v5[4] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_53A0, v7, v8);
}

uint64_t sub_53A0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release(*(void *)(v0 + 32));
  uint64_t result = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator, 0);
  if (v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(v0 + 24);
    HoverTextCoordinator.addSceneForExternalDisplay(_:)(v4);
    swift_release(v3);
    uint64_t v5 = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator, 1);
    HoverTextCoordinator.addSceneForExternalDisplay(_:)(v4);
    swift_release(v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_5434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_642C(a1, &qword_CB50);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10, v13);
      uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v17 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
LABEL_6:
  uint64_t v18 = swift_allocObject(&unk_8468, 32LL, 7LL);
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    uint64_t v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &unk_CB70, v18);
}

uint64_t sub_55F0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v6 = v4;
  sub_5AE0(&qword_CB50);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin();
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = HTLog.unsafeMutableAddressor(v12);
  swift_beginAccess(v15, v30, 0LL, 0LL);
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v15, v10);
  unsigned __int8 v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v17, v18, a2, v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  uint64_t v20 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v9, 1LL, 1LL, v20);
  type metadata accessor for MainActor(0LL);
  id v21 = a1;
  id v22 = v6;
  uint64_t v23 = static MainActor.shared.getter();
  uint64_t v24 = (void *)swift_allocObject(v28, 48LL, 7LL);
  v24[2] = v23;
  v24[3] = &protocol witness table for MainActor;
  v24[4] = v22;
  v24[5] = a1;
  uint64_t v25 = sub_5434((uint64_t)v9, v29, (uint64_t)v24);
  return swift_release(v25);
}

uint64_t sub_57CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for MainActor(0LL);
  v5[4] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_5838, v7, v8);
}

uint64_t sub_5838()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release(*(void *)(v0 + 32));
  uint64_t result = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator, 0);
  if (v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(v0 + 24);
    HoverTextCoordinator.removeSceneForExternalDisplay(_:)(v4);
    swift_release(v3);
    uint64_t v5 = sub_44CC(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator, 1);
    HoverTextCoordinator.removeSceneForExternalDisplay(_:)(v4);
    swift_release(v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    __break(1u);
  }

  return result;
}

id sub_5A44(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for HoverTextAXUIService()
{
  return objc_opt_self(&OBJC_CLASS___HoverTextAXUIService);
}

uint64_t sub_5AE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5B24()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  objc_super v4 = (void *)swift_task_alloc(dword_CB5C);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_66E8;
  return sub_57CC((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_5B74(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_5BD8;
  return v6(a1);
}

uint64_t sub_5BD8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_5C24()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_5C48(uint64_t a1)
{
  objc_super v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_CB6C);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_5CB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_CB68 + dword_CB68))(a1, v4);
}

uint64_t sub_5CB8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_5D04()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_5D38()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  objc_super v4 = (void *)swift_task_alloc(dword_CB7C);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_66E8;
  return sub_5334((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_5D88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5E58(v13, 0LL, 0LL, 1, a1, a2);
  uint64_t v8 = v13[0];
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_6530((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v11 = *a3;
    if (*a3)
    {
      sub_6530((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_656C(v13);
  return v8;
}

uint64_t sub_5E58(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_6010(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_60A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_627C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_627C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_60A4(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_6218(v4, 0LL);
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

void *sub_6218(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5AE0(&qword_CBA0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_627C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5AE0(&qword_CBA0);
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

unint64_t sub_63C8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_6590(a1, v4);
}

uint64_t sub_63F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_642C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5AE0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_6468()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  swift_bridgeObjectRelease(*(void *)(v0 + 56));
  swift_bridgeObjectRelease(*(void *)(v0 + 72));
  return swift_deallocObject(v0, 80LL, 7LL);
}

uint64_t sub_64A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v10 = (void *)swift_task_alloc(dword_CB94);
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_5CB8;
  return sub_4B44(v2, v3, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_6530(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_656C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_6590(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_6654(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_63F8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_6654(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_6690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5AE0((uint64_t *)&unk_CBB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_66D8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}