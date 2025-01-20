void *sub_100087C34(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a1[2];
  v7 = a2[2];
  a1[2] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  return a1;
}

void *sub_100087C98(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(a1[1]);
  uint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_100087CDC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100087D24(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t type metadata accessor for CompanionEventDefinition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100087530(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompanionEventDefinition);
}

void *sub_100087D70()
{
  return &protocol witness table for String;
}

uint64_t NCProtoContinuityCall.description.getter()
{
  uint64_t v0 = type metadata accessor for NCProtoContinuityCall.Status(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = 0LL;
  unint64_t v22 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(88LL);
  v4._countAndFlagsBits = 0xD000000000000022LL;
  v4._object = (void *)0x80000001000A5FB0LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = NCProtoContinuityCall.uuidString.getter();
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7._object = (void *)0x80000001000A5FE0LL;
  v7._countAndFlagsBits = 0xD000000000000018LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = NCProtoContinuityCall.conversationUuidString.getter();
  v9 = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v9);
  v10._countAndFlagsBits = 0x79616C7073696420LL;
  v10._object = (void *)0xED00003D656D614ELL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = NCProtoContinuityCall.displayName.getter();
  v12 = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  v13._countAndFlagsBits = 0x3D73757461747320LL;
  v13._object = (void *)0xE800000000000000LL;
  String.append(_:)(v13);
  uint64_t v14 = NCProtoContinuityCall.status.getter();
  uint64_t v15 = NCProtoContinuityCall.Status.rawValue.getter(v14);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v20[1] = v15;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 62LL;
  v18._object = (void *)0xE100000000000000LL;
  String.append(_:)(v18);
  return v21;
}

id sub_100087F3C()
{
  uint64_t v0 = type metadata accessor for NCProtoCallInfo(0LL);
  uint64_t v67 = *(void *)(v0 - 8);
  uint64_t v68 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v64 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for NCProtoContinuityCall.Status(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CE420);
  uint64_t v8 = __chkstk_darwin(v7);
  v70 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  v69 = (char *)&v64 - v11;
  __chkstk_darwin(v10);
  Swift::String v13 = (char *)&v64 - v12;
  uint64_t v14 = type metadata accessor for UUID(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v71 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  v20 = (char *)&v64 - v19;
  uint64_t v21 = NCProtoContinuityCall.uuidString.getter(v18);
  uint64_t v23 = v22;
  UUID.init(uuidString:)(v21);
  swift_bridgeObjectRelease(v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14) == 1)
  {
    sub_10001EFC4((uint64_t)v13);
    return 0LL;
  }

  uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  uint64_t v26 = v15;
  NCProtoContinuityCall.status.getter(v25);
  unint64_t v27 = sub_100088470();
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v29 = v20;
  if ((v27 & 0x100000000LL) != 0)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v14);
    return 0LL;
  }

  unint64_t v65 = v27;
  uint64_t v66 = v26;
  if ((NCProtoContinuityCall.hasInfo.getter(v28) & 1) == 0
    || (NCProtoContinuityCall.info.getter(),
        id v30 = sub_1000885FC(),
        (*(void (**)(char *, uint64_t))(v67 + 8))(v2, v68),
        !v30))
  {
    uint64_t v31 = NCProtoContinuityCall.hasDisplayName.getter();
    if ((v31 & 1) != 0)
    {
      NCProtoContinuityCall.uuidString.getter(v31);
      uint64_t v33 = v32;
      NCProtoContinuityCall.displayName.getter();
      uint64_t v35 = v34;
      unint64_t v36 = sub_100003E5C((uint64_t)_swiftEmptyArrayStorage);
      id v37 = objc_allocWithZone(&OBJC_CLASS___TUContinuityCallInfo);
      NSString v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v33);
      NSString v39 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v35);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v36);
      id v30 = [v37 initWithCallIdentifier:v38 callerIdSubstring:0 displayName:v39 isBranded:0 contactIdentifiersByHandle:isa senderIdentitySh ortName:0 senderIdentityName:0 handlesHash:0];

      goto LABEL_8;
    }

    if (qword_1000CD690 != -1) {
      swift_once(&qword_1000CD690, sub_100088E24);
    }
    uint64_t v54 = type metadata accessor for Logger(0LL);
    uint64_t v55 = sub_10000ADF4(v54, (uint64_t)qword_1000D3620);
    v56 = (os_log_s *)Logger.logObject.getter(v55);
    os_log_type_t v57 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v58 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "Invalid Continuity Call Proto: missing Both displayName and callInfo",  v58,  2u);
      swift_slowDealloc(v58, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v66 + 8))(v20, v14);
    return 0LL;
  }

unint64_t sub_100088470()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NCProtoContinuityCall.Status(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for NCProtoContinuityCall.Status.ringing(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 4LL;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.active(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 1LL;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.sending(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 3LL;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.idle(_:))
  {
    uint64_t v8 = 0LL;
    unsigned __int8 v7 = 0;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.held(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 2LL;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.disconnecting(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 5LL;
  }

  else if (v6 == enum case for NCProtoContinuityCall.Status.disconnected(_:))
  {
    unsigned __int8 v7 = 0;
    uint64_t v8 = 6LL;
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v8 = 0LL;
    unsigned __int8 v7 = 1;
  }

  return v8 | ((unint64_t)v7 << 32);
}

id sub_1000885FC()
{
  uint64_t v0 = type metadata accessor for NCProtoSenderIdentity(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v5 = NCProtoCallInfo.hasCallerIDSubstring.getter(v2);
  id result = 0LL;
  if ((v5 & 1) != 0)
  {
    if ((NCProtoCallInfo.hasCallIdentifier.getter(0LL) & 1) != 0)
    {
      uint64_t v7 = NCProtoCallInfo.hasSenderIdentity.getter();
      if ((v7 & 1) != 0)
      {
        uint64_t v8 = ((uint64_t (*)(void))NCProtoCallInfo.senderIdentity.getter)();
        uint64_t v9 = NCProtoSenderIdentity.shortName.getter(v8);
        uint64_t v11 = v10;
        uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
        uint64_t v13 = v12(v4, v0);
        uint64_t v14 = NCProtoCallInfo.senderIdentity.getter(v13);
        uint64_t v15 = NCProtoSenderIdentity.name.getter(v14);
        uint64_t v17 = v16;
        uint64_t v7 = v12(v4, v0);
      }

      else
      {
        uint64_t v15 = 0LL;
        uint64_t v17 = 0LL;
        uint64_t v9 = 0LL;
        uint64_t v11 = 0LL;
      }

      uint64_t v33 = v17;
      uint64_t v34 = v15;
      uint64_t v35 = v11;
      uint64_t v36 = v9;
      uint64_t v18 = NCProtoCallInfo.callIdentifier.getter(v7);
      uint64_t v20 = v19;
      uint64_t v21 = NCProtoCallInfo.callerIDSubstring.getter();
      uint64_t v23 = v22;
      uint64_t v24 = NCProtoCallInfo.displayName.getter();
      uint64_t v26 = v25;
      char v27 = NCProtoCallInfo.isBranded.getter();
      uint64_t v28 = NCProtoCallInfo.contactIdentifiersByHandle.getter();
      if ((NCProtoCallInfo.hasHandlesHash.getter() & 1) != 0)
      {
        uint64_t v29 = NCProtoCallInfo.handlesHash.getter();
        unint64_t v31 = v30;
      }

      else
      {
        uint64_t v29 = 0LL;
        unint64_t v31 = 0xF000000000000000LL;
      }

      id v32 = objc_allocWithZone(&OBJC_CLASS___TUContinuityCallInfo);
      return sub_1000887DC(v18, v20, v21, v23, v24, v26, v27 & 1, v28, v36, v35, v34, v33, v29, v31);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

id sub_1000887DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14)
{
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (a4)
  {
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    NSString v21 = 0LL;
  }

  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
  v23.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a8);
  if (a10)
  {
    NSString v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a10);
    unint64_t v25 = a14;
    if (a12)
    {
LABEL_6:
      NSString v26 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(a12);
      goto LABEL_9;
    }
  }

  else
  {
    NSString v24 = 0LL;
    unint64_t v25 = a14;
    if (a12) {
      goto LABEL_6;
    }
  }

  NSString v26 = 0LL;
LABEL_9:
  if (v25 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000C048(a13, v25);
  }

  id v28 = [v14 initWithCallIdentifier:v20 callerIdSubstring:v21 displayName:v22 isBranded:a7 & 1 contactIdentifiersByHandle:v23.super.isa senderIdentityShortN ame:v24 senderIdentityName:v26 handlesHash:isa];

  return v28;
}

id sub_1000889C0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v11.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  Class isa = 0LL;
  if (v14(a2, 1LL, v12) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v12);
  }

  if (v14(a3, 1LL, v12) == 1)
  {
    Class v16 = 0LL;
  }

  else
  {
    Class v16 = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  }

  id v17 = [v19 initWithUUID:v11.super.isa conversationUUID:isa callGroupUUID:v16 status:a4 isMuted:a5 isCameraEnabled:a6 callInfo:a7];

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
  return v17;
}

unint64_t sub_100088AFC()
{
  unint64_t result = qword_1000CD8C8;
  if (!qword_1000CD8C8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000CD8C8);
  }

  return result;
}

uint64_t sub_100088B38()
{
  uint64_t v0 = type metadata accessor for Defaults();
  uint64_t result = swift_allocObject(v0, 56LL, 7LL);
  *(void *)(result + 40) = &type metadata for ConversationServerBag;
  *(void *)(result + 48) = &off_1000C61D8;
  qword_1000D3618 = result;
  return result;
}

uint64_t type metadata accessor for Defaults()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_NeighborhoodActivityConduitService8Defaults);
}

void sub_100088B94(char a1)
{
  id v2 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  __asm { BR              X10 }

uint64_t sub_100088C14()
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEE006E656B6F5465LL);
  id v3 = [v0 objectForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v5);
    swift_unknownObjectRelease(v3);
    sub_1000871F0((uint64_t)v5);
    __asm { BR              X10 }
  }

  memset(v5, 0, 32);
  sub_1000871F0((uint64_t)v5);

  return 2LL;
}

char *os_log_type_t.errorWithState.unsafeMutableAddressor()
{
  if (qword_1000CD6D8 != -1) {
    swift_once(&qword_1000CD6D8, sub_1000890B0);
  }
  return &static os_log_type_t.errorWithState;
}

uint64_t sub_100088E24(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3620, 0xD000000000000018LL, 0x80000001000A60C0LL);
}

uint64_t sub_100088E48(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3638, 0xD000000000000011LL, 0x80000001000A60E0LL);
}

uint64_t sub_100088E6C(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3650, 0xD000000000000014LL, 0x80000001000A6120LL);
}

uint64_t sub_100088E90(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3668, 0x617373654D534449LL, 0xEF79786F72506567LL);
}

uint64_t sub_100088EBC(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3680, 0x4D72656863756F56LL, 0xEE00726567616E61LL);
}

uint64_t sub_100088EE8(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D3698, 0xD00000000000001ALL, 0x80000001000A6220LL);
}

uint64_t sub_100088F0C(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D36B0, 0xD000000000000014LL, 0x80000001000A6100LL);
}

uint64_t sub_100088F30(uint64_t a1)
{
  return sub_100088F54(a1, qword_1000D36C8, 0xD000000000000012LL, 0x80000001000A60A0LL);
}

uint64_t sub_100088F54(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_10003A5DC(v7, a2);
  sub_10000ADF4(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000002BLL, 0x80000001000A4D60LL, a3, a4);
}

uint64_t sub_100088FC8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  sub_10003A5DC(v4, qword_1000D0640);
  sub_10000ADF4(v4, (uint64_t)qword_1000D0640);
  if (qword_1000CD690 != -1) {
    swift_once(&qword_1000CD690, sub_100088E24);
  }
  uint64_t v5 = sub_10000ADF4(v0, (uint64_t)qword_1000D3620);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

uint64_t sub_1000890B0()
{
  uint64_t result = static os_log_type_t.error.getter();
  static os_log_type_t.errorWithState = result | 0x80;
  return result;
}

uint64_t static os_log_type_t.errorWithState.getter()
{
  if (qword_1000CD6D8 != -1) {
    swift_once(&qword_1000CD6D8, sub_1000890B0);
  }
  swift_beginAccess(&static os_log_type_t.errorWithState, v1, 0LL, 0LL);
  return static os_log_type_t.errorWithState;
}

void static os_log_type_t.errorWithState.setter(char a1)
{
  if (qword_1000CD6D8 != -1) {
    swift_once(&qword_1000CD6D8, sub_1000890B0);
  }
  swift_beginAccess(&static os_log_type_t.errorWithState, v2, 1LL, 0LL);
  static os_log_type_t.errorWithState = a1;
}

uint64_t (*static os_log_type_t.errorWithState.modify(uint64_t a1))(void)
{
  if (qword_1000CD6D8 != -1) {
    swift_once(&qword_1000CD6D8, sub_1000890B0);
  }
  swift_beginAccess(&static os_log_type_t.errorWithState, a1, 33LL, 0LL);
  return j__swift_endAccess;
}

char *sub_100089214(char *__src, char *__dst, uint64_t a3)
{
  if (__dst) {
    return strncpy(__dst, __src, a3 - (void)__dst);
  }
  __break(1u);
  return __src;
}

uint64_t sub_100089240(char a1)
{
  uint64_t v2 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  int v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = type metadata accessor for OSSignposter(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000CD6D0 != -1) {
    swift_once(&qword_1000CD6D0, sub_100088FC8);
  }
  uint64_t v13 = sub_10000ADF4(v9, (uint64_t)qword_1000D0640);
  uint64_t v30 = v10;
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v15 = off_1000C5D58[a1];
  uint64_t v16 = static OSSignpostID.exclusive.getter(v14);
  id v17 = (os_log_s *)OSSignposter.logHandle.getter(v16);
  os_signpost_type_t v18 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    id v28 = v15;
    id v19 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v19(v6, v8, v2);
    NSString v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v29 = v3;
    NSString v21 = v20;
    *(_WORD *)NSString v20 = 0;
    os_signpost_id_t v22 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, v18, v22, v28, "", v21, 2u);
    NSDictionary v23 = v21;
    uint64_t v3 = v29;
    swift_slowDealloc(v23, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

  else
  {

    id v19 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  }

  v19(v6, v8, v2);
  uint64_t v24 = type metadata accessor for OSSignpostIntervalState(0LL);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  uint64_t v25 = OSSignpostIntervalState.init(id:isOpen:)(v6, 1LL);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v9);
  return v25;
}

uint64_t sub_100089490(char a1, uint64_t a2)
{
  id v32 = (const char *)type metadata accessor for OSSignpostError(0LL);
  uint64_t v4 = *((void *)v32 - 1);
  __chkstk_darwin(v32);
  int v6 = &v29[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v33 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8);
  uint64_t v11 = &v29[-v10];
  uint64_t v12 = type metadata accessor for OSSignposter(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v29[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (qword_1000CD6D0 != -1) {
    swift_once(&qword_1000CD6D0, sub_100088FC8);
  }
  uint64_t v16 = sub_10000ADF4(v12, (uint64_t)qword_1000D0640);
  uint64_t v17 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  unint64_t v31 = off_1000C5D58[a1];
  os_signpost_type_t v18 = (os_log_s *)OSSignposter.logHandle.getter(v17);
  uint64_t v19 = OSSignpostIntervalState.signpostID.getter();
  int v30 = static os_signpost_type_t.end.getter(v19);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v20 = swift_retain(a2);
    checkForErrorAndConsumeState(state:)(v20);
    swift_release(a2);
    NSString v21 = v32;
    if ((*(unsigned int (**)(_BYTE *, const char *))(v4 + 88))(v6, v32) == enum case for OSSignpostError.doubleEnd(_:))
    {
      os_signpost_id_t v22 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(_BYTE *, const char *))(v4 + 8))(v6, v21);
      os_signpost_id_t v22 = "";
    }

    id v32 = v22;
    uint64_t v24 = v33;
    uint64_t v25 = v34;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v34 + 16))(v33, v11, v7);
    NSString v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)NSString v26 = 0;
    os_signpost_id_t v27 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, (os_signpost_type_t)v30, v27, v31, v32, v26, 2u);
    swift_slowDealloc(v26, -1LL, -1LL);

    id v28 = *(void (**)(_BYTE *, uint64_t))(v25 + 8);
    v28(v11, v7);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    return ((uint64_t (*)(_BYTE *, uint64_t))v28)(v24, v7);
  }

  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v34 + 8))(v11, v7);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
  }

uint64_t NeighborhoodActivityPublisherService.firstValue<A, B>(from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = type metadata accessor for UUID(0LL);
  v6[8] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[9] = v8;
  v6[10] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000897C8, 0LL, 0LL);
}

uint64_t sub_1000897C8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 24);
  __int128 v9 = *(_OWORD *)(v0 + 32);
  UUID.init()();
  uint64_t v5 = swift_task_alloc(64LL);
  *(void *)(v0 + 88) = v5;
  *(_OWORD *)(v5 + 16) = v9;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
  *(void *)(v5 + 48) = v1;
  *(void *)(v5 + 56) = v4;
  uint64_t v6 = swift_task_alloc(32LL);
  *(void *)(v0 + 96) = v6;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v1;
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to withTaskCancellationHandler<A>(operation:onCancel:isolation:)[1]);
  *(void *)(v0 + 104) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10008989C;
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)( *(void *)(v0 + 16),  &unk_1000D0668,  v5,  sub_10004D370,  v6,  0LL,  0LL,  *(void *)(v0 + 32));
}

uint64_t sub_10008989C()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 96LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 104LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 88LL);
  *(void *)(*(void *)v1 + 112LL) = v0;
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  if (v0) {
    uint64_t v5 = sub_10008991C;
  }
  else {
    uint64_t v5 = sub_10006FC4C;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_10008991C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 72) + 8LL))(v1, *(void *)(v0 + 64));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100089964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return swift_task_switch(sub_100089988, 0LL, 0LL);
}

uint64_t sub_100089988()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = swift_task_alloc(64LL);
  *(void *)(v0 + 72) = v3;
  __int128 v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  *(void *)(v3 + 56) = v2;
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 80) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100089A40;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( *(void *)(v0 + 16),  0LL,  0LL,  0xD000000000000011LL,  0x80000001000A4FA0LL,  sub_10008B300,  v3,  *(void *)(v0 + 48));
}

uint64_t sub_100089A40()
{
  uint64_t v2 = *(void *)(*v1 + 80);
  uint64_t v3 = *v1;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    return swift_task_switch(sub_100089AB4, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v3 + 72));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100089AB4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100089AE8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc(dword_1000D0664);
  __int128 v7 = *(_OWORD *)(v1 + 40);
  __int128 v8 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_10000C2B8;
  *(void *)(v6 + 64) = v4;
  *(_OWORD *)(v6 + 48) = v8;
  *(void *)(v6 + 40) = v5;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return swift_task_switch(sub_100089988, 0LL, 0LL);
}

uint64_t sub_100089B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v43 = a6;
  uint64_t v44 = a7;
  uint64_t v40 = a5;
  uint64_t v41 = a1;
  uint64_t v47 = a4;
  uint64_t v42 = a3;
  uint64_t v49 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v52 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v50 = *(void *)(v10 - 8);
  uint64_t v51 = v10;
  __chkstk_darwin(v10);
  uint64_t v45 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100003698(&qword_1000CF8D0);
  uint64_t v13 = type metadata accessor for CheckedContinuation(0LL, a5, v12, &protocol self-conformance witness table for Error);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v39 = v13;
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  __chkstk_darwin(v18);
  NSString v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v46 = *(void *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v42, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v41, v13);
  uint64_t v22 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v23 = (v22 + 48) & ~v22;
  uint64_t v24 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v25 = (v20 + v23 + v24) & ~v24;
  unint64_t v26 = (v15 + v25 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  os_signpost_id_t v27 = (char *)swift_allocObject(&unk_1000C5DF0, v26 + 8, v22 | v24 | 7);
  uint64_t v28 = v43;
  *((void *)v27 + 2) = v40;
  *((void *)v27 + 3) = v28;
  *((void *)v27 + 4) = v44;
  *((void *)v27 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v27[v23], v21, v18);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v27[v25], v17, v39);
  uint64_t v29 = v47;
  *(void *)&v27[v26] = v47;
  aBlock[4] = sub_10008B400;
  uint64_t v55 = v27;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000ABC8;
  aBlock[3] = &unk_1000C5E08;
  int v30 = _Block_copy(aBlock);
  swift_retain(a2);
  uint64_t v31 = swift_retain(v29);
  id v32 = v45;
  static DispatchQoS.unspecified.getter(v31);
  NSNumber v53 = _swiftEmptyArrayStorage;
  uint64_t v33 = sub_10000465C( (unint64_t *)&unk_1000CE340,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v34 = sub_10000360C((uint64_t *)&unk_1000CFBC0);
  uint64_t v35 = sub_10000C1B4(&qword_1000CE350, (uint64_t *)&unk_1000CFBC0);
  id v37 = v48;
  uint64_t v36 = v49;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v53, v34, v35, v49, v33);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v32, v37, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v36);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v51);
  return swift_release(v55);
}

uint64_t sub_100089EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v104 = a1;
  uint64_t v105 = a7;
  uint64_t v101 = a6;
  uint64_t v97 = a4;
  uint64_t v103 = a3;
  uint64_t v12 = sub_100003698(&qword_1000CF8D0);
  uint64_t v100 = a5;
  uint64_t v87 = type metadata accessor for CheckedContinuation(0LL, a5, v12, &protocol self-conformance witness table for Error);
  uint64_t v93 = *(void *)(v87 - 8);
  uint64_t v96 = *(void *)(v93 + 64);
  uint64_t v13 = __chkstk_darwin(v87);
  v91 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  v98 = (char *)&v78 - v15;
  uint64_t v16 = sub_10000360C(&qword_1000CF260);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for AnyPublisher(255LL, a5, a6, a7);
  unint64_t v20 = sub_10000F4A4();
  unint64_t v95 = v20;
  uint64_t v21 = v19;
  uint64_t v81 = v19;
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for AnyPublisher<A, B>, v19);
  v94 = (void (*)(char *, char *, uint64_t))WitnessTable;
  v82 = (void (*)(char *, uint64_t, uint64_t))sub_10000465C( &qword_1000CF288,  (uint64_t (*)(uint64_t))sub_10000F4A4,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue);
  v107[0] = v21;
  v107[1] = v20;
  v107[2] = WitnessTable;
  v107[3] = v82;
  uint64_t v23 = type metadata accessor for Publishers.ReceiveOn(0LL, v107);
  uint64_t v86 = *(void *)(v23 - 8);
  uint64_t v84 = v23;
  __chkstk_darwin(v23);
  v79 = (char *)&v78 - v24;
  uint64_t v83 = swift_getWitnessTable(&protocol conformance descriptor for Publishers.ReceiveOn<A, B>, v23);
  uint64_t v88 = type metadata accessor for Publishers.HandleEvents(0LL, v23, v83);
  uint64_t v90 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  v102 = (char *)&v78 - v25;
  uint64_t v26 = type metadata accessor for UUID(0LL);
  uint64_t v27 = *(void *)(*(void *)(v26 - 8) + 64LL);
  uint64_t v99 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  v85 = (char *)&v78 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v78 - v30;
  __chkstk_darwin(v29);
  uint64_t v89 = (uint64_t)&v78 - v32;
  uint64_t v34 = *(void (**)(void))(v33 + 16);
  uint64_t v80 = a2;
  v34();
  id v106 = *(id *)(a1 + 16);
  id v35 = v106;
  v107[0] = v97;
  uint64_t v36 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56LL))(v18, 1LL, 1LL, v36);
  id v37 = v35;
  Publisher.receive<A>(on:options:)(&v106, v18, v81, v95, v94, v82);
  sub_10008B4B0((uint64_t)v18);

  uint64_t v38 = v26;
  v92 = v34;
  ((void (*)(char *, uint64_t, uint64_t))v34)(v31, a2, v26);
  uint64_t v39 = v93;
  v82 = *(void (**)(char *, uint64_t, uint64_t))(v93 + 16);
  uint64_t v40 = v98;
  uint64_t v41 = v87;
  v82(v98, v103, v87);
  uint64_t v42 = v99;
  uint64_t v43 = *(unsigned __int8 *)(v99 + 80);
  uint64_t v44 = *(unsigned __int8 *)(v39 + 80);
  uint64_t v45 = v27 + ((v43 + 48) & ~v43);
  uint64_t v46 = (v43 + 48) & ~v43;
  uint64_t v97 = v46;
  uint64_t v81 = ((v45 + v44) & ~v44) + v96;
  unint64_t v47 = (v45 + v44) & ~v44;
  unint64_t v95 = v47;
  uint64_t v96 = v43 | v44 | 7;
  uint64_t v48 = (char *)swift_allocObject(&unk_1000C5E40, v81, v96);
  uint64_t v49 = v101;
  *((void *)v48 + 2) = v100;
  *((void *)v48 + 3) = v49;
  uint64_t v50 = v104;
  *((void *)v48 + 4) = v105;
  *((void *)v48 + 5) = v50;
  v94 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
  v94(&v48[v46], v31, v38);
  uint64_t v93 = *(void *)(v39 + 32);
  ((void (*)(char *, char *, uint64_t))v93)(&v48[v47], v40, v41);
  swift_retain(v50);
  uint64_t v51 = v84;
  uint64_t v52 = v79;
  Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)( 0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  sub_10008B4F4,  v48,  0LL,  0LL,  v84,  v83);
  swift_release(v48);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v52, v51);
  NSNumber v53 = v31;
  uint64_t v54 = v31;
  uint64_t v55 = v80;
  uint64_t v56 = v38;
  ((void (*)(char *, uint64_t, uint64_t))v92)(v53, v80, v38);
  uint64_t v57 = v103;
  uint64_t v58 = v41;
  uint64_t v59 = v41;
  char v60 = v82;
  v82(v40, v103, v58);
  uint64_t v61 = v81;
  id v62 = (char *)swift_allocObject(&unk_1000C5E68, v81, v96);
  uint64_t v64 = v100;
  uint64_t v63 = v101;
  *((void *)v62 + 2) = v100;
  *((void *)v62 + 3) = v63;
  uint64_t v65 = v104;
  *((void *)v62 + 4) = v105;
  *((void *)v62 + 5) = v65;
  v94(&v62[v97], v54, v56);
  ((void (*)(char *, char *, uint64_t))v93)(&v62[v95], v98, v59);
  uint64_t v66 = v85;
  ((void (*)(char *, uint64_t, uint64_t))v92)(v85, v55, v56);
  uint64_t v67 = v91;
  v60(v91, v57, v59);
  uint64_t v68 = (char *)swift_allocObject(&unk_1000C5E90, v61, v96);
  *((void *)v68 + 2) = v64;
  *((void *)v68 + 3) = v63;
  uint64_t v69 = v104;
  *((void *)v68 + 4) = v105;
  *((void *)v68 + 5) = v69;
  v94(&v68[v97], v66, v56);
  ((void (*)(char *, char *, uint64_t))v93)(&v68[v95], v67, v59);
  swift_retain_n(v69, 2LL);
  uint64_t v70 = v88;
  uint64_t v71 = swift_getWitnessTable(&protocol conformance descriptor for Publishers.HandleEvents<A>, v88);
  v72 = v102;
  uint64_t v73 = Publisher.sink(receiveCompletion:receiveValue:)(sub_10008B594, v62, sub_10008B680, v68, v70, v71);
  swift_release(v68);
  swift_release(v62);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v72, v70);
  swift_beginAccess(v69 + 24, v107, 33LL, 0LL);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v69 + 24));
  id v106 = *(id *)(v69 + 24);
  *(void *)(v69 + 24) = 0x8000000000000000LL;
  uint64_t v75 = v89;
  sub_100077EC8(v73, v89, isUniquelyReferenced_nonNull_native);
  uint64_t v76 = *(void *)(v69 + 24);
  *(void *)(v69 + 24) = v106;
  swift_bridgeObjectRelease(v76);
  (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v75, v56);
  return swift_endAccess(v107);
}

uint64_t sub_10008A578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t *)(a2 + 24);
  swift_beginAccess(a2 + 24, v23, 33LL, 0LL);
  uint64_t v10 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain(v10);
  unint64_t v11 = sub_100004D38(a3);
  LOBYTE(a3) = v12;
  swift_bridgeObjectRelease(v10);
  if ((a3 & 1) == 0) {
    return swift_endAccess(v23);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v9);
  uint64_t v14 = *v9;
  uint64_t v22 = *v9;
  uint64_t *v9 = 0x8000000000000000LL;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_100078A40();
    uint64_t v14 = v22;
  }

  uint64_t v15 = *(void *)(v14 + 48);
  uint64_t v16 = type metadata accessor for UUID(0LL);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v16 - 8) + 8LL))( v15 + *(void *)(*(void *)(v16 - 8) + 72LL) * v11,  v16);
  uint64_t v17 = *(void *)(*(void *)(v22 + 56) + 8 * v11);
  sub_1000397C0(v11, v22);
  uint64_t v18 = *v9;
  uint64_t *v9 = v22;
  swift_bridgeObjectRelease(v18);
  swift_endAccess(v23);
  AnyCancellable.cancel()();
  uint64_t v19 = sub_100003698(&qword_1000CF8D0);
  uint64_t v20 = type metadata accessor for CheckedContinuation(0LL, a5, v19, &protocol self-conformance witness table for Error);
  sub_10008A6D4(a1, v20);
  return swift_release(v17);
}

uint64_t sub_10008A6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(a1);
  __int128 v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v6);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for Result(0LL, v4, v10, *(void *)(v14 + 32));
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v20 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v20 - v16, a1, v15);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v17, v10);
    return CheckedContinuation.resume(throwing:)(v13, a2);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v17, v4);
    return CheckedContinuation.resume(returning:)(v8, a2);
  }

uint64_t sub_10008A834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100003698(&qword_1000CF8D0);
  uint64_t v9 = type metadata accessor for Result(0LL, a4, v8, &protocol self-conformance witness table for Error);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v17 - v11);
  uint64_t v13 = type metadata accessor for CancellationError(0LL);
  uint64_t v14 = sub_10000465C( &qword_1000CF2A0,  (uint64_t (*)(uint64_t))&type metadata accessor for CancellationError,  (uint64_t)&protocol conformance descriptor for CancellationError);
  uint64_t v15 = swift_allocError(v13, v14, 0LL, 0LL);
  CancellationError.init()();
  uint64_t *v12 = v15;
  swift_storeEnumTagMultiPayload(v12, v9, 1LL);
  sub_10008A578((uint64_t)v12, a1, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10008A964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v44 = a2;
  uint64_t v11 = sub_100003698(&qword_1000CF8D0);
  uint64_t v42 = a5;
  uint64_t v12 = type metadata accessor for Result(0LL, a5, v11, &protocol self-conformance witness table for Error);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (uint64_t *)((char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (uint64_t *)((char *)&v39 - v18);
  uint64_t v20 = *(void *)(a6 - 8);
  uint64_t v21 = __chkstk_darwin(v17);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v39 - v24;
  uint64_t v43 = a7;
  uint64_t v26 = type metadata accessor for Subscribers.Completion(0LL, a6, a7);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v39 - v27;
  (*(void (**)(char *, uint64_t))(v29 + 16))((char *)&v39 - v27, a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v28, 1LL, a6) == 1)
  {
    *uint64_t v16 = (id)TUMakeNeighborhoodConduitError(4LL, 0LL);
    swift_storeEnumTagMultiPayload(v16, v12, 1LL);
    sub_10008A578((uint64_t)v16, v44, v45, v46, v42);
    return (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  }

  else
  {
    uint64_t v40 = v13;
    uint64_t v41 = v12;
    uint64_t v31 = v42;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v32(v25, v28, a6);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v25, a6);
    uint64_t v33 = v43;
    uint64_t v34 = _getErrorEmbeddedNSError<A>(_:)(v23, a6, v43);
    if (v34)
    {
      uint64_t v35 = v34;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, a6);
    }

    else
    {
      uint64_t v35 = swift_allocError(a6, v33, 0LL, 0LL);
      v32(v36, v23, a6);
    }

    uint64_t v37 = v46;
    uint64_t v38 = v41;
    *uint64_t v19 = v35;
    swift_storeEnumTagMultiPayload(v19, v38, 1LL);
    sub_10008A578((uint64_t)v19, v44, v45, v37, v31);
    (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v19, v38);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v25, a6);
  }

uint64_t sub_10008AC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100003698(&qword_1000CF8D0);
  uint64_t v11 = type metadata accessor for Result(0LL, a5, v10, &protocol self-conformance witness table for Error);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16LL))((char *)&v16 - v13, a1, a5);
  swift_storeEnumTagMultiPayload(v14, v11, 0LL);
  sub_10008A578((uint64_t)v14, a2, a3, a4, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_10008AD18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v25 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  v22[1] = *(void *)(a1 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))( (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a2,  v10);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 24) & ~v13;
  uint64_t v15 = swift_allocObject(&unk_1000C5DA0, v14 + v12, v13 | 7);
  *(void *)(v15 + 16) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))( v15 + v14,  (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
  aBlock[4] = sub_10008B2B8;
  uint64_t v28 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000ABC8;
  aBlock[3] = &unk_1000C5DB8;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = swift_retain(a1);
  static DispatchQoS.unspecified.getter(v17);
  uint64_t v26 = _swiftEmptyArrayStorage;
  uint64_t v18 = sub_10000465C( (unint64_t *)&unk_1000CE340,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v19 = sub_10000360C((uint64_t *)&unk_1000CFBC0);
  uint64_t v20 = sub_10000C1B4(&qword_1000CE350, (uint64_t *)&unk_1000CFBC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v6, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  return swift_release(v28);
}

void sub_10008AF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain(v4);
    unint64_t v5 = sub_100004D38(a2);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
      swift_retain(v7);
      swift_bridgeObjectRelease(v4);
      AnyCancellable.cancel()();
      swift_release(v7);
    }

    else
    {
      swift_bridgeObjectRelease(v4);
    }
  }

uint64_t NeighborhoodActivityPublisherService.deinit()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  return v0;
}

uint64_t NeighborhoodActivityPublisherService.__deallocating_deinit()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for NeighborhoodActivityPublisherService()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_NeighborhoodActivityConduitService36NeighborhoodActivityPublisherService);
}

uint64_t sub_10008B074()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v16 = sub_10000F4A4();
  static DispatchQoS.unspecified.getter(v16);
  uint64_t v17 = _swiftEmptyArrayStorage;
  uint64_t v12 = sub_10000465C( &qword_1000CD718,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_10000360C(&qword_1000CD720);
  uint64_t v14 = sub_10000C1B4((unint64_t *)&qword_1000CD728, &qword_1000CD720);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v13, v14, v6, v12);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v2);
  *(void *)(v1 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002ELL,  0x80000001000A3300LL,  v11,  v8,  v5,  0LL);
  *(void *)(v1 + 24) = sub_1000037F4((uint64_t)_swiftEmptyArrayStorage);
  return v1;
}

uint64_t sub_10008B244()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10008B2B8()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for UUID(0LL) - 8) + 80LL);
  sub_10008AF74(*(void *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_10008B2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10008B2F8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10008B300(uint64_t a1)
{
  return sub_100089B70(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

uint64_t sub_10008B310()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 48) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = sub_100003698(&qword_1000CF8D0);
  uint64_t v8 = type metadata accessor for CheckedContinuation(0LL, v1, v7, &protocol self-conformance witness table for Error);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v6 + v10) & ~v10;
  uint64_t v12 = v4 | v10 | 7;
  unint64_t v13 = (*(void *)(v9 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, v8);
  swift_release(*(void *)(v0 + v13));
  return swift_deallocObject(v0, v13 + 8, v12);
}

uint64_t sub_10008B400()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = v5 + *(void *)(v4 + 64);
  uint64_t v7 = sub_100003698(&qword_1000CF8D0);
  uint64_t v8 = *(void *)(type metadata accessor for CheckedContinuation( 0LL,  v1,  v7,  &protocol self-conformance witness table for Error)
                 - 8);
  unint64_t v9 = (v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  return sub_100089EAC( v0[5],  (uint64_t)v0 + v5,  (uint64_t)v0 + v9,  *(void *)((char *)v0 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFF8LL)),  v1,  v2,  v3);
}

uint64_t sub_10008B4B0(uint64_t a1)
{
  uint64_t v2 = sub_10000360C(&qword_1000CF260);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10008B4F4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = sub_100003698(&qword_1000CF8D0);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CheckedContinuation( 0LL,  v1,  v5,  &protocol self-conformance witness table for Error)
                                      - 8)
                          + 80LL);
  return sub_10008A834(*(void *)(v0 + 40), v0 + v3, v0 + ((v4 + v6) & ~v6), v1);
}

uint64_t sub_10008B594(uint64_t a1)
{
  return sub_10008B68C( a1,  (uint64_t (*)(uint64_t, void, char *, char *, uint64_t, uint64_t, uint64_t))sub_10008A964);
}

uint64_t sub_10008B5A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 48) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = sub_100003698(&qword_1000CF8D0);
  uint64_t v8 = type metadata accessor for CheckedContinuation(0LL, v1, v7, &protocol self-conformance witness table for Error);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v6 + v10) & ~v10;
  uint64_t v12 = v11 + *(void *)(v9 + 64);
  uint64_t v13 = v4 | v10 | 7;
  swift_release(*(void *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, v8);
  return swift_deallocObject(v0, v12, v13);
}

uint64_t sub_10008B680(uint64_t a1)
{
  return sub_10008B68C( a1,  (uint64_t (*)(uint64_t, void, char *, char *, uint64_t, uint64_t, uint64_t))sub_10008AC18);
}

uint64_t sub_10008B68C( uint64_t a1, uint64_t (*a2)(uint64_t, void, char *, char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *((void *)v2 + 2);
  uint64_t v5 = *((void *)v2 + 3);
  uint64_t v6 = *((void *)v2 + 4);
  uint64_t v7 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 48LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = v8 + *(void *)(v7 + 64);
  uint64_t v10 = sub_100003698(&qword_1000CF8D0);
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CheckedContinuation( 0LL,  v4,  v10,  &protocol self-conformance witness table for Error)
                                       - 8)
                           + 80LL);
  return a2(a1, *((void *)v2 + 5), &v2[v8], &v2[(v9 + v11) & ~v11], v4, v5, v6);
}

uint64_t sub_10008B750(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return swift_task_switch(sub_10008B768, 0LL, 0LL);
}

uint64_t sub_10008B768()
{
  if (qword_1000CD638 != -1) {
    swift_once(&qword_1000CD638, sub_10001FF5C);
  }
  return swift_task_switch(sub_10008B7C8, qword_1000D35C8, 0LL);
}

uint64_t sub_10008B7C8()
{
  if (qword_1000CD640 != -1) {
    swift_once(&qword_1000CD640, sub_1000202C4);
  }
  return swift_task_switch(sub_10008B824, 0LL, 0LL);
}

uint64_t sub_10008B824()
{
  return swift_task_switch(sub_10008B83C, qword_1000D35C8, 0LL);
}

uint64_t sub_10008B83C()
{
  *(void *)(v0 + 56) = qword_1000D35D0;
  return swift_task_switch(sub_10008B85C, 0LL, 0LL);
}

uint64_t sub_10008B85C()
{
  return swift_task_switch(sub_10008B874, qword_1000D35C8, 0LL);
}

uint64_t sub_10008B874()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  swift_beginAccess(v1 + 48, v0 + 2, 0LL, 0LL);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = swift_task_alloc(48LL);
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v2;
  *(_BYTE *)(v5 + 32) = 0;
  swift_bridgeObjectRetain(v4);
  v0[8] = sub_10003A664(sub_1000365F8, v5, v4);
  swift_bridgeObjectRelease(v4);
  swift_task_dealloc(v5);
  return swift_task_switch(sub_10008B920, 0LL, 0LL);
}

uint64_t sub_10008B920()
{
  if (*(void *)(v0 + 64)) {
    return swift_task_switch(sub_10008B9DC, qword_1000D35C8, 0LL);
  }
  uint64_t v2 = *(void *)(v0 + 48);
  id v3 = objc_allocWithZone(&OBJC_CLASS___TUNearbyDeviceHandle);
  swift_bridgeObjectRetain(v2);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  id v5 = [v3 initWithType:2 identifier:v4 name:0];

  return (*(uint64_t (**)(id))(v0 + 8))(v5);
}

uint64_t sub_10008B9DC()
{
  *(void *)(v0 + 72) = sub_10000CE6C();
  return swift_task_switch(sub_10008BA1C, 0LL, 0LL);
}

uint64_t sub_10008BA1C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 72));
}

uint64_t sub_10008BA50(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  sub_10008CDF8(a1, v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v8 = *(void *)(v1 + 64);
  uint64_t v7 = *(void *)(v1 + 72);
  uint64_t v55 = *(void *)(v1 + 80);
  uint64_t v9 = type metadata accessor for NCProtoContactHandleAnonym.AnonymType(0LL);
  *(void *)(v1 + 208) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v1 + 216) = v10;
  unint64_t v11 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v1 + 224) = swift_task_alloc(v11);
  *(void *)(v1 + 232) = swift_task_alloc(v11);
  uint64_t v12 = type metadata accessor for NCProtoContactHandleAnonym(0LL);
  *(void *)(v1 + 240) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v1 + 248) = v13;
  *(void *)(v1 + 256) = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for NCProtoContactInfo(0LL);
  *(void *)(v1 + 264) = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)(v1 + 272) = v15;
  *(void *)(v1 + 280) = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for NCProtoContinuityFavorite(0LL);
  *(void *)(v1 + 288) = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  *(void *)(v1 + 296) = v17;
  *(void *)(v1 + 304) = swift_task_alloc((*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for NCProtoConversationLetMeInRequestState(0LL);
  *(void *)(v1 + 312) = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  *(void *)(v1 + 320) = v19;
  unint64_t v20 = (*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v1 + 328) = swift_task_alloc(v20);
  *(void *)(v1 + 336) = swift_task_alloc(v20);
  uint64_t v21 = type metadata accessor for NCProtoConversationAVMode(0LL);
  *(void *)(v1 + 344) = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  *(void *)(v1 + 352) = v22;
  unint64_t v23 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v1 + 360) = swift_task_alloc(v23);
  *(void *)(v1 + 368) = swift_task_alloc(v23);
  uint64_t v24 = type metadata accessor for NCProtoConversationState(0LL);
  *(void *)(v1 + 376) = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  *(void *)(v1 + 384) = v25;
  unint64_t v26 = (*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v1 + 392) = swift_task_alloc(v26);
  *(void *)(v1 + 400) = swift_task_alloc(v26);
  uint64_t v27 = sub_10000360C((uint64_t *)&unk_1000CE420);
  *(void *)(v1 + 408) = swift_task_alloc((*(void *)(*(void *)(v27 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = type metadata accessor for UUID(0LL);
  *(void *)(v1 + 416) = v28;
  uint64_t v29 = *(void *)(v28 - 8);
  *(void *)(v1 + 424) = v29;
  unint64_t v30 = (*(void *)(v29 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v1 + 432) = swift_task_alloc(v30);
  *(void *)(v1 + 440) = swift_task_alloc(v30);
  uint64_t active = type metadata accessor for NCProtoActiveConversation(0LL);
  *(void *)(v1 + 448) = active;
  uint64_t v32 = *(void *)(active - 8);
  *(void *)(v1 + 456) = v32;
  *(void *)(v1 + 464) = swift_task_alloc((*(void *)(v32 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = type metadata accessor for NCProtoContinuityCall(0LL);
  *(void *)(v1 + 472) = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  *(void *)(v1 + 480) = v34;
  *(void *)(v1 + 488) = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10008CDF8(a1, v1 + 88);
  uint64_t v35 = *(void *)(v1 + 96);
  if (v35)
  {
    uint64_t v36 = *(void *)(v1 + 88);
    *(_BYTE *)(v1 + 552) = *(_BYTE *)(v1 + 112);
    *(void *)(v1 + 496) = *(void *)(v1 + 120);
    __int128 v37 = *(_OWORD *)(v1 + 144);
    *(_OWORD *)(v1 + 504) = *(_OWORD *)(v1 + 128);
    *(_OWORD *)(v1 + 520) = v37;
    uint64_t v38 = dword_1000D0744;
    swift_bridgeObjectRetain(v4);
    swift_retain(v3);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v55);
    uint64_t v39 = (void *)swift_task_alloc(v38);
    *(void *)(v1 + 536) = v39;
    *uint64_t v39 = v1;
    v39[1] = sub_10008BE8C;
    v39[5] = v36;
    v39[6] = v35;
    return swift_task_switch(sub_10008B768, 0LL, 0LL);
  }

  else
  {
    uint64_t v41 = *(void *)(v1 + 464);
    uint64_t v43 = *(void *)(v1 + 432);
    uint64_t v42 = *(void *)(v1 + 440);
    uint64_t v45 = *(void *)(v1 + 400);
    uint64_t v44 = *(void *)(v1 + 408);
    uint64_t v46 = *(void *)(v1 + 392);
    uint64_t v47 = *(void *)(v1 + 360);
    uint64_t v48 = *(void *)(v1 + 368);
    uint64_t v49 = *(void *)(v1 + 336);
    uint64_t v50 = *(void *)(v1 + 328);
    uint64_t v51 = *(void *)(v1 + 304);
    uint64_t v52 = *(void *)(v1 + 280);
    uint64_t v53 = *(void *)(v1 + 256);
    uint64_t v54 = *(void *)(v1 + 232);
    uint64_t v56 = *(void *)(v1 + 224);
    swift_task_dealloc(*(void *)(v1 + 488));
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v48);
    swift_task_dealloc(v47);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    swift_task_dealloc(v54);
    swift_task_dealloc(v56);
    return (*(uint64_t (**)(void))(v1 + 8))(0LL);
  }

uint64_t sub_10008BE8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 536LL);
  *(void *)(*(void *)v1 + 544LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10008BF14, 0LL, 0LL);
}

uint64_t sub_10008BF14()
{
  uint64_t v1 = *(void *)(v0 + 504);
  *(void *)(v0 + 168) = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 480);
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    swift_bridgeObjectRetain(v1);
    do
    {
      uint64_t v8 = *(void *)(v0 + 488);
      uint64_t v9 = *(void *)(v0 + 472);
      v6(v8, v4, v9);
      id v10 = sub_100087F3C();
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v8, v9);
      if (v10)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v11);
        unint64_t v13 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v12 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v13 >= v12 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1LL);
        }
        uint64_t v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v10);
        specialized Array._endMutation()(v7);
      }

      v4 += v5;
      --v2;
    }

    while (v2);
  }

  else
  {
    swift_bridgeObjectRetain(v1);
  }

  uint64_t v14 = *(void *)(v0 + 496);
  sub_10001FC00((void *)(v0 + 168));
  *(void *)(v0 + 160) = v14;
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v16 = *(void *)(v0 + 456);
    uint64_t v17 = *(void *)(v0 + 424);
    uint64_t v207 = *(void *)(v0 + 384);
    uint64_t v181 = *(void *)(v0 + 320);
    uint64_t v183 = *(void *)(v0 + 352);
    uint64_t v18 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v19 = *(void *)(v16 + 72);
    v203 = *(uint64_t (**)(void, uint64_t, void))(v16 + 16);
    int v179 = enum case for NCProtoConversationState.waiting(_:);
    int v167 = enum case for NCProtoConversationState.preparing(_:);
    int v164 = enum case for NCProtoConversationState.joining(_:);
    int v162 = enum case for NCProtoConversationState.joined(_:);
    int v160 = enum case for NCProtoConversationState.leaving(_:);
    int v177 = enum case for NCProtoConversationAVMode.none(_:);
    int v166 = enum case for NCProtoConversationAVMode.audio(_:);
    int v169 = enum case for NCProtoConversationLetMeInRequestState.noneLmiState(_:);
    int v165 = enum case for NCProtoConversationLetMeInRequestState.notRequested(_:);
    int v163 = enum case for NCProtoConversationLetMeInRequestState.requested(_:);
    int v161 = enum case for NCProtoConversationLetMeInRequestState.approved(_:);
    swift_bridgeObjectRetain_n(v14, 2LL);
    uint64_t v173 = v17;
    uint64_t v175 = v16;
    uint64_t v171 = v19;
    while (1)
    {
      uint64_t v22 = *(void *)(v0 + 408);
      uint64_t v21 = *(void *)(v0 + 416);
      uint64_t v23 = v203(*(void *)(v0 + 464), v18, *(void *)(v0 + 448));
      uint64_t active = NCProtoActiveConversation.uuidString.getter(v23);
      uint64_t v26 = v25;
      UUID.init(uuidString:)(active);
      swift_bridgeObjectRelease(v26);
      int v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v22, 1LL, v21);
      uint64_t v28 = *(void *)(v0 + 464);
      if (v27 != 1) {
        break;
      }
      uint64_t v20 = *(void *)(v0 + 448);
      sub_10001EFC4(*(void *)(v0 + 408));
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v28, v20);
LABEL_13:
      v18 += v19;
      if (!--v15)
      {
        uint64_t v76 = (void *)(v0 + 160);
        sub_10001FC00((void *)(v0 + 160));
        uint64_t v45 = (uint64_t)_swiftEmptyArrayStorage;
        goto LABEL_56;
      }
    }

    uint64_t v200 = v18;
    uint64_t v30 = *(void *)(v0 + 432);
    uint64_t v29 = *(void *)(v0 + 440);
    uint64_t v31 = *(void *)(v0 + 416);
    uint64_t v33 = *(void *)(v0 + 392);
    uint64_t v32 = *(void *)(v0 + 400);
    uint64_t v34 = *(void *)(v0 + 376);
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 32))(v29, *(void *)(v0 + 408), v31);
    uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v30, v29, v31);
    NCProtoActiveConversation.displayName.getter(v35);
    uint64_t v37 = v36;
    NCProtoActiveConversation.state.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v207 + 16))(v33, v32, v34);
    int v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v207 + 88))(v33, v34);
    if (v38 == v179)
    {
      Swift::Int v39 = 0LL;
    }

    else if (v38 == v167)
    {
      Swift::Int v39 = 1LL;
    }

    else if (v38 == v164)
    {
      Swift::Int v39 = 2LL;
    }

    else if (v38 == v162)
    {
      Swift::Int v39 = 3LL;
    }

    else
    {
      if (v38 != v160)
      {
        uint64_t v73 = *(void *)(v0 + 400);
        uint64_t v74 = *(void *)(v0 + 376);
        uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v207 + 8);
        v75(*(void *)(v0 + 392), v74);
        v75(v73, v74);
        v40.super.super.Class isa = 0LL;
LABEL_26:
        uint64_t v42 = *(void *)(v0 + 360);
        uint64_t v41 = *(void *)(v0 + 368);
        uint64_t v43 = *(void *)(v0 + 344);
        NCProtoActiveConversation.avMode.getter();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v183 + 16))(v42, v41, v43);
        int v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v183 + 88))(v42, v43);
        if (v44 == v177)
        {
          uint64_t v45 = 0LL;
          unint64_t v46 = *(void *)(v183 + 8);
          uint64_t v47 = v181;
          uint64_t v48 = ((uint64_t (*)(void, void))v46)(*(void *)(v0 + 368), *(void *)(v0 + 344));
        }

        else
        {
          unint64_t v46 = *(void *)(v183 + 8);
          uint64_t v47 = v181;
          if (v44 == v166)
          {
            uint64_t v45 = 1LL;
          }

          else
          {
            ((void (*)(void, void))v46)(*(void *)(v0 + 360), *(void *)(v0 + 344));
            uint64_t v45 = 2LL;
          }

          uint64_t v48 = ((uint64_t (*)(void, void))v46)(*(void *)(v0 + 368), *(void *)(v0 + 344));
        }

        uint64_t v49 = NCProtoActiveConversation.remoteMemberCount.getter(v48);
        if (v49 < 0)
        {
          __break(1u);
          goto LABEL_87;
        }

        uint64_t v190 = v49;
        uint64_t v192 = v45;
        Class isa = v40.super.super.isa;
        uint64_t v51 = *(void *)(v0 + 328);
        uint64_t v50 = *(void *)(v0 + 336);
        uint64_t v52 = *(void *)(v0 + 312);
        uint64_t v53 = NCProtoActiveConversation.remoteMemberContactIdentifiers.getter();
        NCProtoActiveConversation.letMeInRequestState.getter();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v51, v50, v52);
        int v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 88))(v51, v52);
        if (v54 == v169) {
          goto LABEL_34;
        }
        if (v54 == v165)
        {
          uint64_t v55 = 1LL;
        }

        else if (v54 == v163)
        {
          uint64_t v55 = 2LL;
        }

        else
        {
          if (v54 != v161)
          {
            (*(void (**)(void, void))(v47 + 8))(*(void *)(v0 + 328), *(void *)(v0 + 312));
LABEL_34:
            uint64_t v189 = 0LL;
            goto LABEL_42;
          }

          uint64_t v55 = 3LL;
        }

        uint64_t v189 = v55;
LABEL_42:
        uint64_t v56 = (*(uint64_t (**)(void, void))(v47 + 8))(*(void *)(v0 + 336), *(void *)(v0 + 312));
        if ((NCProtoActiveConversation.hasHandlesHash.getter(v56) & 1) != 0)
        {
          uint64_t v57 = NCProtoActiveConversation.handlesHash.getter();
          unint64_t v59 = v58;
        }

        else
        {
          uint64_t v57 = 0LL;
          unint64_t v59 = 0xF000000000000000LL;
        }

        v60.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
        NSString v61 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v37);
        v62.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v53);
        uint64_t v197 = v15;
        if (v59 >> 60 == 15)
        {
          Class v63 = 0LL;
        }

        else
        {
          Class v63 = Data._bridgeToObjectiveC()().super.isa;
          sub_10000C048(v57, v59);
        }

        uint64_t v64 = *(void *)(v0 + 440);
        uint64_t v185 = *(void *)(v0 + 448);
        uint64_t v187 = *(void *)(v0 + 464);
        uint64_t v65 = *(void *)(v0 + 432);
        uint64_t v66 = *(void *)(v0 + 416);
        id v67 = [objc_allocWithZone(TUContinuityConversation) initWithUUID:v60.super.isa displayName:v61 state:isa avMode:v192 remoteMemberCount:v190 remoteMemberContactIdentifiers:v62.super.isa letMeInRequestState:v189 handlesHash:v63];

        uint64_t v17 = v173;
        uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v173 + 8);
        v68(v65, v66);
        v68(v64, v66);
        uint64_t v16 = v175;
        uint64_t v69 = (*(uint64_t (**)(uint64_t, uint64_t))(v175 + 8))(v187, v185);
        uint64_t v15 = v197;
        uint64_t v18 = v200;
        uint64_t v19 = v171;
        if (v67)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v69);
          unint64_t v71 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v70 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v71 >= v70 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v70 > 1, v71 + 1, 1LL);
          }
          uint64_t v72 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v71, v67);
          specialized Array._endMutation()(v72);
        }

        goto LABEL_13;
      }

      Swift::Int v39 = 4LL;
    }

    (*(void (**)(void, void))(v207 + 8))(*(void *)(v0 + 400), *(void *)(v0 + 376));
    sub_1000052E0(0LL, (unint64_t *)&qword_1000CD8C8, &OBJC_CLASS___NSNumber_ptr);
    v40.super.super.Class isa = NSNumber.init(integerLiteral:)(v39).super.super.isa;
    goto LABEL_26;
  }

  swift_bridgeObjectRetain(v14);
  uint64_t v45 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v76 = (void *)(v0 + 160);
LABEL_56:
  unint64_t v46 = *(void *)(v0 + 512);
  sub_10001FC00(v76);
  *(void *)(v0 + 184) = v46;
  uint64_t v49 = *(void *)(v0 + 512);
  if (v46 >> 62)
  {
LABEL_87:
    if (v49 < 0) {
      uint64_t v159 = v49;
    }
    else {
      uint64_t v159 = v46 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v49, 2LL);
    uint64_t v77 = _CocoaArrayWrapper.endIndex.getter(v159);
  }

  else
  {
    uint64_t v77 = *(void *)((v46 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n(v49, 2LL);
  }

  uint64_t v168 = v45;
  if (v77)
  {
    v208 = (void *)objc_opt_self(&OBJC_CLASS___NSKeyedArchiver);
    if (v77 < 1) {
      __break(1u);
    }
    uint64_t v78 = 0LL;
    v79 = (id *)(v0 + 176);
    uint64_t v204 = *(void *)(v0 + 512) + 32LL;
    v186 = _swiftEmptyArrayStorage;
    do
    {
      if ((v46 & 0xC000000000000001LL) != 0) {
        id v82 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v78, *(void *)(v0 + 512));
      }
      else {
        id v82 = *(id *)(v204 + 8 * v78);
      }
      uint64_t v83 = v82;
      id *v79 = 0LL;
      id v84 = [v208 archivedDataWithRootObject:v82 requiringSecureCoding:1 error:v79];
      id v85 = *v79;
      if (v84)
      {
        uint64_t v86 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v84);
        uint64_t v88 = v87;

        if ((swift_isUniquelyReferenced_nonNull_native(v186) & 1) == 0) {
          v186 = sub_1000854E4(0LL, v186[2] + 1LL, 1, v186);
        }
        unint64_t v90 = v186[2];
        unint64_t v89 = v186[3];
        if (v90 >= v89 >> 1) {
          v186 = sub_1000854E4((void *)(v89 > 1), v90 + 1, 1, v186);
        }
        v186[2] = v90 + 1;
        v91 = &v186[2 * v90];
        v91[4] = v86;
        v91[5] = v88;
      }

      else
      {
        uint64_t v80 = v85;
        uint64_t v81 = _convertNSErrorToError(_:)(v85);

        swift_willThrow();
        swift_errorRelease(v81);
      }

      ++v78;
    }

    while (v77 != v78);
  }

  else
  {
    v186 = _swiftEmptyArrayStorage;
  }

  v92 = (void *)(v0 + 192);
  uint64_t v93 = *(void *)(v0 + 528);
  sub_10001FC00((void *)(v0 + 184));
  sub_10001FC00((void *)(v0 + 184));
  *(void *)(v0 + 192) = v93;
  uint64_t v94 = *(void *)(v93 + 16);
  if (v94)
  {
    uint64_t v95 = *(void *)(v0 + 520);
    uint64_t v96 = *(void *)(v0 + 296);
    uint64_t v180 = *(void *)(v0 + 248);
    uint64_t v182 = *(void *)(v0 + 272);
    uint64_t v178 = *(void *)(v0 + 216);
    unint64_t v97 = *(void *)(v0 + 528)
        + ((*(unsigned __int8 *)(v96 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80));
    sub_10008CE40(v92);
    swift_bridgeObjectRetain(v95);
    sub_10008CE40(v92);
    uint64_t v184 = v96;
    v174 = *(uint64_t (**)(void, unint64_t, void))(v96 + 16);
    uint64_t v176 = *(void *)(v96 + 72);
    int v170 = enum case for NCProtoContactHandleAnonym.AnonymType.emailAddress(_:);
    int v172 = enum case for NCProtoContactHandleAnonym.AnonymType.phoneNumber(_:);
    do
    {
      unint64_t v205 = v97;
      uint64_t v209 = v94;
      uint64_t v98 = *(void *)(v0 + 280);
      uint64_t v99 = *(void *)(v0 + 264);
      uint64_t v100 = *(void *)(v0 + 224);
      uint64_t v101 = *(void *)(v0 + 232);
      uint64_t v102 = *(void *)(v0 + 208);
      uint64_t v103 = v174(*(void *)(v0 + 304), v97, *(void *)(v0 + 288));
      NCProtoContinuityFavorite.contactInfo.getter(v103);
      sub_10007B4D4();
      v201 = v104;
      uint64_t v105 = (*(uint64_t (**)(uint64_t, uint64_t))(v182 + 8))(v98, v99);
      NCProtoContinuityFavorite.contactIdentifier.getter(v105);
      uint64_t v107 = v106;
      uint64_t v108 = NCProtoContinuityFavorite.anonym.getter();
      NCProtoContactHandleAnonym.identifier.getter(v108);
      uint64_t v110 = v109;
      NCProtoContactHandleAnonym.label.getter();
      uint64_t v112 = v111;
      NCProtoContactHandleAnonym.localizedLabel.getter();
      uint64_t v188 = v113;
      NCProtoContactHandleAnonym.type.getter();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 16))(v100, v101, v102);
      int v114 = (*(uint64_t (**)(uint64_t, uint64_t))(v178 + 88))(v100, v102);
      uint64_t v198 = v107;
      if (v114 == v172)
      {
        v115 = *(void (**)(void, void))(v178 + 8);
        uint64_t v116 = 1LL;
      }

      else
      {
        v115 = *(void (**)(void, void))(v178 + 8);
        if (v114 == v170)
        {
          uint64_t v116 = 2LL;
        }

        else
        {
          v115(*(void *)(v0 + 224), *(void *)(v0 + 208));
          uint64_t v116 = 0LL;
        }
      }

      uint64_t v117 = *(void *)(v0 + 304);
      uint64_t v193 = *(void *)(v0 + 288);
      uint64_t v118 = *(void *)(v0 + 256);
      uint64_t v119 = *(void *)(v0 + 240);
      v115(*(void *)(v0 + 232), *(void *)(v0 + 208));
      id v120 = objc_allocWithZone(&OBJC_CLASS___TUContinuityHandleAnonym);
      NSString v121 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v110);
      NSString v122 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v112);
      NSString v123 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v188);
      id v124 = [v120 initWithIdentifier:v121 label:v122 localizedDisplayName:v123 type:v116];

      uint64_t v125 = (*(uint64_t (**)(uint64_t, uint64_t))(v180 + 8))(v118, v119);
      NCProtoContinuityFavorite.actionType.getter(v125);
      uint64_t v127 = v126;
      NSString v128 = String._bridgeToObjectiveC()();
      uint64_t v129 = swift_bridgeObjectRelease(v127);
      NCProtoContinuityFavorite.bundleIdentifier.getter(v129);
      uint64_t v131 = v130;
      id v132 = objc_allocWithZone(&OBJC_CLASS___TUContinuityFavorite);
      NSString v133 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v198);
      NSString v134 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v131);
      id v135 = [v132 initWithContact:v201 contactIdentifier:v133 anonym:v124 actionType:v128 bundleIdentifier:v134];

      uint64_t v136 = (*(uint64_t (**)(uint64_t, uint64_t))(v184 + 8))(v117, v193);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v136);
      unint64_t v138 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      unint64_t v137 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
      if (v138 >= v137 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v137 > 1, v138 + 1, 1LL);
      }
      uint64_t v139 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v138, v135);
      specialized Array._endMutation()(v139);
      unint64_t v97 = v205 + v176;
      uint64_t v94 = v209 - 1;
    }

    while (v209 != 1);
    v92 = (void *)(v0 + 192);
    sub_10001FC00((void *)(v0 + 192));
  }

  else
  {
    swift_bridgeObjectRetain(*(void *)(v0 + 520));
    sub_10008CE40(v92);
  }

  v140 = *(void **)(v0 + 544);
  uint64_t v141 = *(void *)(v0 + 520);
  v210 = *(uint64_t **)(v0 + 200);
  uint64_t v142 = *(unsigned __int8 *)(v0 + 552);
  sub_10001FC00(v92);
  id v143 = objc_allocWithZone(&OBJC_CLASS___TUContinuitySessionInfo);
  sub_1000052E0(0LL, &qword_1000D0748, &OBJC_CLASS___TUContinuityCall_ptr);
  Class v144 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  sub_1000052E0(0LL, &qword_1000D0750, &OBJC_CLASS___TUContinuityConversation_ptr);
  Class v145 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v168);
  Class v146 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v186);
  sub_1000052E0(0LL, &qword_1000CFB80, &OBJC_CLASS___CNContact_ptr);
  Class v147 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v141);
  sub_1000052E0(0LL, &qword_1000D0758, &OBJC_CLASS___TUContinuityFavorite_ptr);
  Class v148 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  id v191 = [v143 initWithDevice:v140 calls:v144 activeConversations:v145 recentCalls:v146 recentCallsContacts:v147 isDedicatedSession:v142 favorites:v148 recentCallsInfos:0];

  sub_10008CE68(v210);
  uint64_t v149 = *(void *)(v0 + 464);
  uint64_t v151 = *(void *)(v0 + 432);
  uint64_t v150 = *(void *)(v0 + 440);
  uint64_t v153 = *(void *)(v0 + 400);
  uint64_t v152 = *(void *)(v0 + 408);
  uint64_t v154 = *(void *)(v0 + 392);
  uint64_t v155 = *(void *)(v0 + 360);
  uint64_t v156 = *(void *)(v0 + 368);
  uint64_t v157 = *(void *)(v0 + 336);
  uint64_t v194 = *(void *)(v0 + 328);
  uint64_t v196 = *(void *)(v0 + 304);
  uint64_t v199 = *(void *)(v0 + 280);
  uint64_t v202 = *(void *)(v0 + 256);
  uint64_t v206 = *(void *)(v0 + 232);
  uint64_t v211 = *(void *)(v0 + 224);
  swift_task_dealloc(*(void *)(v0 + 488));
  swift_task_dealloc(v149);
  swift_task_dealloc(v150);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v153);
  swift_task_dealloc(v154);
  swift_task_dealloc(v156);
  swift_task_dealloc(v155);
  swift_task_dealloc(v157);
  swift_task_dealloc(v194);
  swift_task_dealloc(v196);
  swift_task_dealloc(v199);
  swift_task_dealloc(v202);
  swift_task_dealloc(v206);
  swift_task_dealloc(v211);
  return (*(uint64_t (**)(id))(v0 + 8))(v191);
}

uint64_t sub_10008CDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000360C(&qword_1000CE4E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_10008CE40(void *a1)
{
  return a1;
}

uint64_t *sub_10008CE68(uint64_t *a1)
{
  return a1;
}

void sub_10008CEAC(void *a1)
{
  if (a1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = qword_1000CD6C8;
    id v4 = a1;
    if (v3 != -1) {
      swift_once(&qword_1000CD6C8, sub_100088F30);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_10000ADF4(v5, (uint64_t)qword_1000D36C8);
    id v6 = v4;
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = v2;
      v18[0] = swift_slowAlloc(32LL, -1LL);
      uint64_t v10 = v18[0];
      *(_DWORD *)uint64_t v9 = 136315138;
      id v11 = [v6 description];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      unint64_t v14 = v13;

      id v19 = (id)sub_10009BE3C(v12, v14, v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v9 + 4, v9 + 12);

      swift_bridgeObjectRelease(v14);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Recording request to pull to TV: %s", v9, 0xCu);
      swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v15 = v10;
      uint64_t v2 = v17;
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }

    swift_beginAccess(v2 + 16, v18, 33LL, 0LL);
    id v16 = v6;
    sub_10008FECC( (Swift::Int *)&v19,  v16,  &qword_1000CE380,  &OBJC_CLASS___TUNearbyConversationInfo_ptr,  &qword_1000D0838);
    swift_endAccess(v18);
  }

void sub_10008D0DC(void *a1)
{
  if (a1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = qword_1000CD6C8;
    id v4 = a1;
    if (v3 != -1) {
      swift_once(&qword_1000CD6C8, sub_100088F30);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_10000ADF4(v5, (uint64_t)qword_1000D36C8);
    id v6 = v4;
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = v2;
      uint64_t v10 = swift_slowAlloc(32LL, -1LL);
      v19[0] = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      id v11 = [v6 description];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      unint64_t v14 = v13;

      uint64_t v18 = sub_10009BE3C(v12, v14, v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, v19, v9 + 4, v9 + 12);

      swift_bridgeObjectRelease(v14);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Recording finished request to pull to TV: %s", v9, 0xCu);
      swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v15 = v10;
      uint64_t v2 = v17;
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }

    swift_beginAccess(v2 + 16, v19, 33LL, 0LL);
    id v16 = (void *)sub_100094EC4(v6, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr, &qword_1000D0838);
    swift_endAccess(v19);
  }

uint64_t sub_10008D304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  uint64_t v6 = type metadata accessor for NCProtoCancelAddMemberEvent(0LL);
  void v5[12] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[13] = v7;
  v5[14] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000CD668 != -1) {
    swift_once(&qword_1000CD668, sub_100053B3C);
  }
  uint64_t v8 = qword_1000D35E0;
  v5[15] = qword_1000D35E0;
  return swift_task_switch(sub_10008D394, v8, 0LL);
}

uint64_t sub_10008D394()
{
  if (qword_1000CD6C8 != -1) {
LABEL_61:
  }
    swift_once(&qword_1000CD6C8, sub_100088F30);
  uint64_t v1 = (uint64_t *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 128) = sub_10000ADF4(v3, (uint64_t)qword_1000D36C8);
  uint64_t v4 = ((uint64_t (*)(uint64_t))swift_bridgeObjectRetain)(v2);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 80);
  unint64_t v9 = v8 & 0xC000000000000001LL;
  if (v7)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v10 = 134217984;
    uint64_t v11 = *v1;
    if (v9)
    {
      if (v11 < 0) {
        uint64_t v12 = *v1;
      }
      else {
        uint64_t v12 = v8 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v13 = __CocoaSet.count.getter(v12);
      uint64_t v11 = *v1;
    }

    else
    {
      uint64_t v13 = *(void *)(v11 + 16);
    }

    *(void *)(v0 + 72) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Cancelling all (%ld) pull to TV requests", v10, 0xCu);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(*v1);
  }

  uint64_t v14 = *v1;
  if (v9)
  {
    if (v14 < 0) {
      uint64_t v15 = *v1;
    }
    else {
      uint64_t v15 = v8 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v14);
    uint64_t v16 = __CocoaSet.makeIterator()(v15);
    uint64_t v17 = sub_1000052E0(0LL, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
    uint64_t v18 = sub_100017D34(&qword_1000CE388, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
    id v19 = Set.Iterator.init(_cocoa:)((void *)(v0 + 16), v16, v17, v18);
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v20 = *(void *)(v0 + 24);
    uint64_t v21 = *(void *)(v0 + 32);
    unint64_t v9 = *(void *)(v0 + 40);
    unint64_t v22 = *(void *)(v0 + 48);
  }

  else
  {
    uint64_t v23 = -1LL << *(_BYTE *)(v14 + 32);
    uint64_t v20 = v14 + 56;
    uint64_t v21 = ~v23;
    uint64_t v24 = -v23;
    if (v24 < 64) {
      uint64_t v25 = ~(-1LL << v24);
    }
    else {
      uint64_t v25 = -1LL;
    }
    unint64_t v22 = v25 & *(void *)(v14 + 56);
    swift_bridgeObjectRetain(v14);
  }

  uint64_t v77 = (uint64_t *)(v0 + 64);
  uint64_t v78 = (id *)(v0 + 56);
  *(void *)(v0 + 144) = v20;
  *(void *)(v0 + 152) = v21;
  for (*(void *)(v0 + 136) = v8; ; uint64_t v8 = *(void *)(v0 + 136))
  {
    if (v8 < 0)
    {
      uint64_t v30 = __CocoaSet.Iterator.next()(v19);
      if (!v30) {
        break;
      }
      uint64_t v31 = v30;
      *uint64_t v77 = v30;
      uint64_t v32 = sub_1000052E0(0LL, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
      swift_unknownObjectRetain(v31);
      swift_dynamicCast(v78, v77, (char *)&type metadata for Swift.AnyObject + 8, v32, 7LL);
      id v33 = *v78;
      swift_unknownObjectRelease(v31);
      unint64_t v29 = v9;
      uint64_t v27 = v22;
    }

    else
    {
      if (v22)
      {
        uint64_t v27 = (v22 - 1) & v22;
        unint64_t v28 = __clz(__rbit64(v22)) | (v9 << 6);
        unint64_t v29 = v9;
      }

      else
      {
        int64_t v34 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
          __break(1u);
          goto LABEL_61;
        }

        int64_t v35 = (unint64_t)(*(void *)(v0 + 152) + 64LL) >> 6;
        if (v34 >= v35) {
          break;
        }
        uint64_t v36 = *(void *)(v0 + 144);
        unint64_t v37 = *(void *)(v36 + 8 * v34);
        unint64_t v29 = v9 + 1;
        if (!v37)
        {
          unint64_t v29 = v9 + 2;
          unint64_t v37 = *(void *)(v36 + 8 * v29);
          if (!v37)
          {
            unint64_t v29 = v9 + 3;
            unint64_t v37 = *(void *)(v36 + 8 * v29);
            if (!v37)
            {
              unint64_t v29 = v9 + 4;
              unint64_t v37 = *(void *)(v36 + 8 * v29);
              if (!v37)
              {
                unint64_t v38 = v9 + 5;
                while (v35 != v38)
                {
                  unint64_t v37 = *(void *)(v36 + 8 * v38++);
                  if (v37)
                  {
                    unint64_t v29 = v38 - 1;
                    goto LABEL_41;
                  }
                }

                goto LABEL_58;
              }
            }
          }
        }

uint64_t sub_10008DB78()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 200);
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    uint64_t v4 = sub_10008E284;
  }
  else {
    uint64_t v4 = sub_10008DC40;
  }
  return swift_task_switch(v4, *(void *)(v2 + 192), 0LL);
}

uint64_t sub_10008DBDC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 232);
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    uint64_t v4 = sub_10008E914;
  }
  else {
    uint64_t v4 = sub_10008E2D0;
  }
  return swift_task_switch(v4, *(void *)(v2 + 224), 0LL);
}

uint64_t sub_10008DC40()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRelease(*(void *)(v0 + 184));
  return swift_task_switch(sub_10008DC80, v1, 0LL);
}

uint64_t sub_10008DC80()
{
  uint64_t v55 = (uint64_t *)(v0 + 64);
  unint64_t v56 = (id *)(v0 + 56);

  uint64_t v2 = *(void *)(v0 + 208);
  while (1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8LL))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    uint64_t v5 = *(void *)(v0 + 168);
    unint64_t v4 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 136);
    if (v6 < 0)
    {
      uint64_t v10 = __CocoaSet.Iterator.next()(v6);
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      *uint64_t v55 = v10;
      uint64_t v12 = sub_1000052E0(0LL, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
      swift_unknownObjectRetain(v11);
      swift_dynamicCast(v56, v55, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
      id v13 = *v56;
      swift_unknownObjectRelease(v11);
      uint64_t v9 = v5;
      uint64_t v7 = v4;
    }

    else
    {
      if (v4)
      {
        uint64_t v7 = (v4 - 1) & v4;
        unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
        uint64_t v9 = *(void *)(v0 + 168);
      }

      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1LL))
        {
          __break(1u);
LABEL_41:
          swift_once(&qword_1000CD638, sub_10001FF5C);
LABEL_32:
          *(void *)(v0 + 192) = qword_1000D35C8;
          uint64_t v44 = (void *)swift_task_alloc(dword_1000CFE44);
          *(void *)(v0 + 200) = v44;
          *uint64_t v44 = v0;
          v44[1] = sub_10008DB78;
          uint64_t v45 = *(void *)(v0 + 112);
          uint64_t v46 = v1;
          uint64_t v47 = v2;
          char v48 = 0;
          return sub_1000534D8(5, v45, v46, v47, v48);
        }

        int64_t v15 = (unint64_t)(*(void *)(v0 + 152) + 64LL) >> 6;
        if (v14 >= v15) {
          break;
        }
        uint64_t v16 = *(void *)(v0 + 144);
        unint64_t v17 = *(void *)(v16 + 8 * v14);
        uint64_t v9 = v5 + 1;
        if (!v17)
        {
          uint64_t v9 = v5 + 2;
          if (v5 + 2 >= v15) {
            break;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v9);
          if (!v17)
          {
            uint64_t v9 = v5 + 3;
            if (v5 + 3 >= v15) {
              break;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v9);
            if (!v17)
            {
              uint64_t v9 = v5 + 4;
              if (v5 + 4 >= v15) {
                break;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v9);
              if (!v17)
              {
                uint64_t v18 = v5 + 5;
                while (v15 != v18)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v18++);
                  if (v17)
                  {
                    uint64_t v9 = v18 - 1;
                    goto LABEL_22;
                  }
                }

                goto LABEL_38;
              }
            }
          }
        }

uint64_t sub_10008E284()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[15];
  swift_errorRelease(v0[26]);
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_100095730, v2, 0LL);
}

uint64_t sub_10008E2D0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRelease(*(void *)(v0 + 216));
  return swift_task_switch(sub_10008E310, v1, 0LL);
}

uint64_t sub_10008E310()
{
  uint64_t v55 = (uint64_t *)(v0 + 64);
  unint64_t v56 = (id *)(v0 + 56);

  uint64_t v2 = *(void *)(v0 + 240);
  while (1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8LL))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    uint64_t v5 = *(void *)(v0 + 168);
    unint64_t v4 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 136);
    if (v6 < 0)
    {
      uint64_t v10 = __CocoaSet.Iterator.next()(v6);
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      *uint64_t v55 = v10;
      uint64_t v12 = sub_1000052E0(0LL, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
      swift_unknownObjectRetain(v11);
      swift_dynamicCast(v56, v55, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
      id v13 = *v56;
      swift_unknownObjectRelease(v11);
      uint64_t v9 = v5;
      uint64_t v7 = v4;
    }

    else
    {
      if (v4)
      {
        uint64_t v7 = (v4 - 1) & v4;
        unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
        uint64_t v9 = *(void *)(v0 + 168);
      }

      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1LL))
        {
          __break(1u);
LABEL_41:
          swift_once(&qword_1000CD638, sub_10001FF5C);
LABEL_32:
          *(void *)(v0 + 192) = qword_1000D35C8;
          uint64_t v44 = (void *)swift_task_alloc(dword_1000CFE44);
          *(void *)(v0 + 200) = v44;
          *uint64_t v44 = v0;
          v44[1] = sub_10008DB78;
          uint64_t v45 = *(void *)(v0 + 112);
          uint64_t v46 = v1;
          uint64_t v47 = v2;
          char v48 = 0;
          return sub_1000534D8(5, v45, v46, v47, v48);
        }

        int64_t v15 = (unint64_t)(*(void *)(v0 + 152) + 64LL) >> 6;
        if (v14 >= v15) {
          break;
        }
        uint64_t v16 = *(void *)(v0 + 144);
        unint64_t v17 = *(void *)(v16 + 8 * v14);
        uint64_t v9 = v5 + 1;
        if (!v17)
        {
          uint64_t v9 = v5 + 2;
          if (v5 + 2 >= v15) {
            break;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v9);
          if (!v17)
          {
            uint64_t v9 = v5 + 3;
            if (v5 + 3 >= v15) {
              break;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v9);
            if (!v17)
            {
              uint64_t v9 = v5 + 4;
              if (v5 + 4 >= v15) {
                break;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v9);
              if (!v17)
              {
                uint64_t v18 = v5 + 5;
                while (v15 != v18)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v18++);
                  if (v17)
                  {
                    uint64_t v9 = v18 - 1;
                    goto LABEL_22;
                  }
                }

                goto LABEL_38;
              }
            }
          }
        }

uint64_t sub_10008E914()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[15];
  swift_errorRelease(v0[30]);
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_10008E960, v2, 0LL);
}

uint64_t sub_10008E960()
{
  uint64_t v55 = (uint64_t *)(v0 + 64);
  unint64_t v56 = (id *)(v0 + 56);

  uint64_t v2 = 0LL;
  while (1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8LL))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    uint64_t v5 = *(void *)(v0 + 168);
    unint64_t v4 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 136);
    if (v6 < 0)
    {
      uint64_t v10 = __CocoaSet.Iterator.next()(v6);
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      *uint64_t v55 = v10;
      uint64_t v12 = sub_1000052E0(0LL, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
      swift_unknownObjectRetain(v11);
      swift_dynamicCast(v56, v55, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
      id v13 = *v56;
      swift_unknownObjectRelease(v11);
      uint64_t v9 = v5;
      uint64_t v7 = v4;
    }

    else
    {
      if (v4)
      {
        uint64_t v7 = (v4 - 1) & v4;
        unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
        uint64_t v9 = *(void *)(v0 + 168);
      }

      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1LL))
        {
          __break(1u);
LABEL_41:
          swift_once(&qword_1000CD638, sub_10001FF5C);
LABEL_32:
          *(void *)(v0 + 192) = qword_1000D35C8;
          uint64_t v44 = (void *)swift_task_alloc(dword_1000CFE44);
          *(void *)(v0 + 200) = v44;
          *uint64_t v44 = v0;
          v44[1] = sub_10008DB78;
          uint64_t v45 = *(void *)(v0 + 112);
          uint64_t v46 = v1;
          uint64_t v47 = v2;
          char v48 = 0;
          return sub_1000534D8(5, v45, v46, v47, v48);
        }

        int64_t v15 = (unint64_t)(*(void *)(v0 + 152) + 64LL) >> 6;
        if (v14 >= v15) {
          break;
        }
        uint64_t v16 = *(void *)(v0 + 144);
        unint64_t v17 = *(void *)(v16 + 8 * v14);
        uint64_t v9 = v5 + 1;
        if (!v17)
        {
          uint64_t v9 = v5 + 2;
          if (v5 + 2 >= v15) {
            break;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v9);
          if (!v17)
          {
            uint64_t v9 = v5 + 3;
            if (v5 + 3 >= v15) {
              break;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v9);
            if (!v17)
            {
              uint64_t v9 = v5 + 4;
              if (v5 + 4 >= v15) {
                break;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v9);
              if (!v17)
              {
                uint64_t v18 = v5 + 5;
                while (v15 != v18)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v18++);
                  if (v17)
                  {
                    uint64_t v9 = v18 - 1;
                    goto LABEL_22;
                  }
                }

                goto LABEL_38;
              }
            }
          }
        }

uint64_t sub_10008EF64(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = [a2 conversationUUID];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v9 = UUID.uuidString.getter(v8);
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return NCProtoCancelAddMemberEvent.conversationIdentifier.setter(v9, v11);
}

uint64_t type metadata accessor for PullRequestService()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_NeighborhoodActivityConduitService18PullRequestService);
}

uint64_t sub_10008F058(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      int64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
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
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_100091D30(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_10008F204(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  Hasher.init(_seed:)(v31, *(void *)(*v4 + 40LL));
  swift_bridgeObjectRetain(v10);
  unint64_t v11 = sub_10000C47C(a2, a3, a4);
  uint64_t v13 = v12;
  String.hash(into:)(v31, v11, v12);
  swift_bridgeObjectRelease(v13);
  Swift::Int v14 = Hasher._finalize()();
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v16 = v14 & ~v15;
  if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
  {
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v10 + 48);
    do
    {
      uint64_t v19 = (uint64_t *)(v18 + 24 * v16);
      uint64_t v20 = *v19;
      BOOL v21 = (void *)v19[1];
      int v22 = *((unsigned __int8 *)v19 + 16);
      if (v22)
      {
        if (v22 == 1)
        {
          if (a4 != 1) {
            goto LABEL_4;
          }
        }

        else if (a4 != 2)
        {
          goto LABEL_4;
        }
      }

      else if (a4)
      {
        goto LABEL_4;
      }

      BOOL v23 = v20 == a2 && v21 == a3;
      if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, a2, a3, 0LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(v10);
        sub_10000EF20(a2, (uint64_t)a3, a4);
        uint64_t v24 = *(void *)(*v5 + 48LL) + 24 * v16;
        uint64_t v25 = *(void *)v24;
        uint64_t v26 = *(void *)(v24 + 8);
        *(void *)a1 = *(void *)v24;
        *(void *)(a1 + 8) = v26;
        unsigned __int8 v27 = *(_BYTE *)(v24 + 16);
        *(_BYTE *)(a1 + 16) = v27;
        sub_10000EEF8(v25, v26, v27);
        return 0LL;
      }

LABEL_4:
      unint64_t v16 = (v16 + 1) & v17;
    }

    while (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0);
  }

  swift_bridgeObjectRelease(v10);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v5);
  v31[0] = *v5;
  *uint64_t v5 = 0x8000000000000000LL;
  sub_10000EEF8(a2, (uint64_t)a3, a4);
  sub_100091EC8(a2, a3, a4, v16, isUniquelyReferenced_nonNull_native);
  uint64_t v30 = *v5;
  *uint64_t v5 = v31[0];
  swift_bridgeObjectRelease(v30);
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  uint64_t result = 1LL;
  *(_BYTE *)(a1 + 16) = a4;
  return result;
}

uint64_t sub_10008F414(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *v3;
  Hasher.init(_seed:)(&__s1, *(void *)(*v3 + 40));
  swift_bridgeObjectRetain(v6);
  Data.hash(into:)(&__s1, a2, a3);
  unint64_t v7 = Hasher._finalize()() & ~(-1LL << *(_BYTE *)(v6 + 32));
  if (((*(void *)(v6 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0) {
    __asm { BR              X8 }
  }

  swift_bridgeObjectRelease(v6);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v11);
  uint64_t __s1 = *v11;
  *unint64_t v11 = 0x8000000000000000LL;
  sub_1000109D4(a2, a3);
  sub_1000920A8(a2, a3, v7, isUniquelyReferenced_nonNull_native);
  uint64_t v9 = *v11;
  *unint64_t v11 = __s1;
  swift_bridgeObjectRelease(v9);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_10008FE40(Swift::Int *a1, void *a2)
{
  return sub_10008FECC(a1, a2, &qword_1000CE358, &OBJC_CLASS___NSXPCConnection_ptr, &qword_1000D0870);
}

uint64_t sub_10008FE5C(Swift::Int *a1, void *a2)
{
  return sub_10008FECC(a1, a2, &qword_1000CE380, &OBJC_CLASS___TUNearbyConversationInfo_ptr, &qword_1000D0838);
}

uint64_t sub_10008FE78(Swift::Int *a1, void *a2)
{
  return sub_10008FECC(a1, a2, &qword_1000CE5B8, &OBJC_CLASS___TUConversationMember_ptr, &qword_1000D0840);
}

uint64_t sub_10008FE94(Swift::Int *a1, void *a2)
{
  return sub_10008FECC(a1, a2, &qword_1000CE400, &OBJC_CLASS___TUContinuitySessionContact_ptr, &qword_1000D0858);
}

uint64_t sub_10008FEB0(Swift::Int *a1, void *a2)
{
  return sub_10008FECC(a1, a2, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr, &qword_1000D0860);
}

uint64_t sub_10008FECC(Swift::Int *a1, void *a2, unint64_t *a3, void *a4, uint64_t *a5)
{
  uint64_t v9 = v5;
  uint64_t v12 = *v5;
  if ((*v5 & 0xC000000000000001LL) != 0)
  {
    if (v12 < 0) {
      uint64_t v13 = *v5;
    }
    else {
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v5);
    id v14 = a2;
    uint64_t v15 = __CocoaSet.member(for:)();

    if (v15)
    {
      swift_bridgeObjectRelease(v12);

      uint64_t v42 = v15;
      uint64_t v16 = sub_1000052E0(0LL, a3, a4);
      swift_unknownObjectRetain(v15);
      swift_dynamicCast(&v43, &v42, (char *)&type metadata for Swift.AnyObject + 8, v16, 7LL);
      *a1 = v43;
      swift_unknownObjectRelease(v15);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v13);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v29 = sub_1000907F4(v13, result + 1, a5, a3, a4);
    Swift::Int v43 = v29;
    unint64_t v30 = *(void *)(v29 + 16);
    if (*(void *)(v29 + 24) <= v30)
    {
      uint64_t v36 = v30 + 1;
      id v37 = v14;
      sub_100091268(v36, a5);
      uint64_t v31 = v43;
    }

    else
    {
      uint64_t v31 = v29;
      id v32 = v14;
    }

    sub_100091CB0((uint64_t)v14, v31);
    uint64_t v38 = *v9;
    uint64_t *v9 = v31;
    swift_bridgeObjectRelease(v38);
    *a1 = (Swift::Int)v14;
  }

  else
  {
    Swift::Int v18 = *(void *)(v12 + 40);
    swift_bridgeObjectRetain(v12);
    Swift::Int v19 = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1LL << *(_BYTE *)(v12 + 32);
    unint64_t v21 = v19 & ~v20;
    os_log_type_t v39 = a4;
    if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) != 0)
    {
      sub_1000052E0(0LL, a3, a4);
      id v22 = *(id *)(*(void *)(v12 + 48) + 8 * v21);
      char v23 = static NSObject.== infix(_:_:)(v22, a2);

      if ((v23 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v12);
        unsigned __int8 v27 = *(void **)(*(void *)(*v9 + 48) + 8 * v21);
        *a1 = (Swift::Int)v27;
        id v28 = v27;
        return 0LL;
      }

      uint64_t v24 = ~v20;
      while (1)
      {
        unint64_t v21 = (v21 + 1) & v24;
        if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) == 0) {
          break;
        }
        id v25 = *(id *)(*(void *)(v12 + 48) + 8 * v21);
        char v26 = static NSObject.== infix(_:_:)(v25, a2);

        if ((v26 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v12);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v9);
    Swift::Int v43 = *v9;
    uint64_t *v9 = 0x8000000000000000LL;
    id v34 = a2;
    sub_100092AEC((uint64_t)v34, v21, isUniquelyReferenced_nonNull_native, a5, a3, v39);
    uint64_t v35 = *v9;
    uint64_t *v9 = v43;
    swift_bridgeObjectRelease(v35);
    *a1 = (Swift::Int)v34;
  }

  return 1LL;
}

uint64_t sub_100090194(_BYTE *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = a2 & 1;
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v16, *(void *)(*v3 + 40LL));
  Hasher._combine(_:)(a2 & 1);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v16[0] = *v3;
    void *v3 = 0x8000000000000000LL;
    sub_100092C7C(v6, v10, isUniquelyReferenced_nonNull_native);
    uint64_t v15 = *v3;
    void *v3 = v16[0];
    swift_bridgeObjectRelease(v15);
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v11 = *(void *)(v7 + 48);
  if (((((_DWORD)v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }

    while (((((_DWORD)v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0);
  }

  uint64_t result = 0LL;
  LOBYTE(v6) = *(_BYTE *)(*(void *)(*v3 + 48LL) + v10);
LABEL_8:
  *a1 = v6;
  return result;
}

uint64_t sub_1000902CC(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for NCProtoMemberAssociationPrimaryInfo(0LL);
  uint64_t v54 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v47 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = sub_10000360C(&qword_1000CF828);
  __chkstk_darwin(v53);
  Swift::Int v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000360C(&qword_1000CF740);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v50 = (uint64_t)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v55 = (uint64_t)&v45 - v12;
  uint64_t v13 = (int *)type metadata accessor for NeighborhoodActivityConduit.NearbyConversationInfo(0LL);
  uint64_t v14 = *((void *)v13 - 1);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (uint64_t *)((char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v15);
  char v48 = (char *)&v45 - v18;
  unint64_t v49 = v2;
  uint64_t v19 = *v2;
  Hasher.init(_seed:)(v59, *(void *)(*v2 + 40LL));
  swift_bridgeObjectRetain(v19);
  sub_100054288((uint64_t)v59);
  Swift::Int v20 = Hasher._finalize()();
  uint64_t v21 = -1LL << *(_BYTE *)(v19 + 32);
  unint64_t v22 = v20 & ~v21;
  uint64_t v58 = v19 + 56;
  if (((*(void *)(v19 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) == 0)
  {
    swift_bridgeObjectRelease(v19);
    goto LABEL_22;
  }

  uint64_t v45 = a1;
  uint64_t v56 = ~v21;
  uint64_t v57 = *(void *)(v14 + 72);
  uint64_t v51 = v8;
  uint64_t v52 = v19;
  uint64_t v23 = v19;
  do
  {
    unint64_t v24 = v57 * v22;
    sub_10004EA38(*(void *)(v23 + 48) + v57 * v22, (uint64_t)v17);
    uint64_t v25 = v17[1];
    uint64_t v26 = a2[1];
    BOOL v27 = *v17 == *a2 && v25 == v26;
    if (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v25, *a2, v26, 0LL) & 1) == 0) {
      goto LABEL_5;
    }
    sub_1000052E0(0LL, &qword_1000CF830, &OBJC_CLASS___NSObject_ptr);
    char v28 = static NSObject.== infix(_:_:)(*(void *)((char *)v17 + v13[6]), *(void *)((char *)a2 + v13[6]));
    uint64_t v29 = v55;
    if ((v28 & 1) == 0) {
      goto LABEL_5;
    }
    uint64_t v30 = v13[7];
    uint64_t v31 = v5;
    uint64_t v32 = (uint64_t)v17 + v30;
    sub_1000956D0((uint64_t)a2 + v30, v55);
    uint64_t v33 = (uint64_t)&v8[*(int *)(v53 + 48)];
    sub_1000956D0(v32, (uint64_t)v8);
    sub_1000956D0(v29, v33);
    id v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
    if (v34((uint64_t)v8, 1LL, v31) == 1)
    {
      sub_10000BFC8(v29, &qword_1000CF740);
      int v35 = v34(v33, 1LL, v31);
      uint64_t v5 = v31;
      if (v35 != 1) {
        goto LABEL_4;
      }
      Swift::Int v8 = v51;
      sub_10000BFC8((uint64_t)v51, &qword_1000CF740);
      uint64_t v23 = v52;
LABEL_18:
      if (*(void *)((char *)v17 + v13[8]) == *(void *)((char *)a2 + v13[8]))
      {
        sub_10004EAC0((uint64_t)v17);
        swift_bridgeObjectRelease(v23);
        sub_10004EAC0((uint64_t)a2);
        sub_10004EA38(*(void *)(*v49 + 48LL) + v24, v45);
        return 0LL;
      }

      goto LABEL_5;
    }

    uint64_t v36 = v50;
    sub_1000956D0((uint64_t)v8, v50);
    if (v34(v33, 1LL, v31) == 1)
    {
      sub_10000BFC8(v55, &qword_1000CF740);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v36, v31);
      uint64_t v5 = v31;
LABEL_4:
      Swift::Int v8 = v51;
      sub_10000BFC8((uint64_t)v51, &qword_1000CF828);
      uint64_t v23 = v52;
      goto LABEL_5;
    }

    id v37 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v47, v33, v31);
    uint64_t v38 = sub_10000465C( &qword_1000CF838,  (uint64_t (*)(uint64_t))&type metadata accessor for NCProtoMemberAssociationPrimaryInfo,  (uint64_t)&protocol conformance descriptor for NCProtoMemberAssociationPrimaryInfo);
    int v46 = dispatch thunk of static Equatable.== infix(_:_:)(v36, v37, v31, v38);
    os_log_type_t v39 = *(void (**)(char *, uint64_t))(v54 + 8);
    v39(v37, v31);
    sub_10000BFC8(v55, &qword_1000CF740);
    v39((char *)v36, v31);
    sub_10000BFC8((uint64_t)v8, &qword_1000CF740);
    uint64_t v5 = v31;
    uint64_t v23 = v52;
    if ((v46 & 1) != 0) {
      goto LABEL_18;
    }
LABEL_5:
    sub_10004EAC0((uint64_t)v17);
    unint64_t v22 = (v22 + 1) & v56;
  }

  while (((*(void *)(v58 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) != 0);
  swift_bridgeObjectRelease(v23);
  a1 = v45;
LABEL_22:
  uint64_t v42 = v48;
  uint64_t v41 = v49;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v49);
  sub_10004EA38((uint64_t)a2, (uint64_t)v42);
  v59[0] = *v41;
  *uint64_t v41 = 0x8000000000000000LL;
  sub_100092DE0(v42, v22, isUniquelyReferenced_nonNull_native);
  uint64_t v44 = *v41;
  *uint64_t v41 = v59[0];
  swift_bridgeObjectRelease(v44);
  sub_100018D40((uint64_t)a2, a1);
  return 1LL;
}

Swift::Int sub_1000907F4(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, void *a5)
{
  if (a2)
  {
    sub_10000360C(a3);
    uint64_t v10 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v29 = v10;
    uint64_t v11 = __CocoaSet.makeIterator()(a1);
    uint64_t v12 = __CocoaSet.Iterator.next()(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_1000052E0(0LL, a4, a5);
      do
      {
        uint64_t v27 = v13;
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v14, 7LL);
        uint64_t v10 = v29;
        unint64_t v22 = *(void *)(v29 + 16);
        if (*(void *)(v29 + 24) <= v22)
        {
          sub_100091268(v22 + 1, a3);
          uint64_t v10 = v29;
        }

        uint64_t v15 = v28;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v10 + 40));
        uint64_t v17 = v10 + 56;
        uint64_t v18 = -1LL << *(_BYTE *)(v10 + 32);
        unint64_t v19 = result & ~v18;
        unint64_t v20 = v19 >> 6;
        if (((-1LL << v19) & ~*(void *)(v10 + 56 + 8 * (v19 >> 6))) != 0)
        {
          unint64_t v21 = __clz(__rbit64((-1LL << v19) & ~*(void *)(v10 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v23 = 0;
          unint64_t v24 = (unint64_t)(63 - v18) >> 6;
          do
          {
            if (++v20 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v25 = v20 == v24;
            if (v20 == v24) {
              unint64_t v20 = 0LL;
            }
            v23 |= v25;
            uint64_t v26 = *(void *)(v17 + 8 * v20);
          }

          while (v26 == -1);
          unint64_t v21 = __clz(__rbit64(~v26)) + (v20 << 6);
        }

        *(void *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v21;
        *(void *)(*(void *)(v10 + 48) + 8 * v21) = v15;
        ++*(void *)(v10 + 16);
        uint64_t v13 = __CocoaSet.Iterator.next()(result);
      }

      while (v13);
    }

    swift_release(v11);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v10;
}

Swift::Int sub_1000909F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000D0850);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    uint64_t v33 = (void *)(v3 + 56);
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
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v33 = -1LL << v31;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

unint64_t sub_100090CD0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFAC0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    unint64_t v28 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v29 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 56;
    unint64_t result = swift_retain(v3);
    int64_t v12 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v12 << 6);
      }

      else
      {
        int64_t v24 = v12 + 1;
        if (__OFADD__(v12, 1LL))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }

        if (v24 >= v29) {
          goto LABEL_26;
        }
        unint64_t v25 = v28[v24];
        ++v12;
        if (!v25)
        {
          int64_t v12 = v24 + 1;
          if (v24 + 1 >= v29) {
            goto LABEL_26;
          }
          unint64_t v25 = v28[v12];
          if (!v25)
          {
            int64_t v12 = v24 + 2;
            if (v24 + 2 >= v29) {
              goto LABEL_26;
            }
            unint64_t v25 = v28[v12];
            if (!v25)
            {
              int64_t v26 = v24 + 3;
              if (v26 >= v29)
              {
LABEL_26:
                swift_release(v3);
                uint64_t v27 = 1LL << *(_BYTE *)(v3 + 32);
                if (v27 > 63) {
                  bzero(v28, ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *unint64_t v28 = -1LL << v27;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v25 = v28[v26];
              if (!v25)
              {
                while (1)
                {
                  int64_t v12 = v26 + 1;
                  if (__OFADD__(v26, 1LL)) {
                    goto LABEL_32;
                  }
                  if (v12 >= v29) {
                    goto LABEL_26;
                  }
                  unint64_t v25 = v28[v12];
                  ++v26;
                  if (v25) {
                    goto LABEL_25;
                  }
                }
              }

              int64_t v12 = v26;
            }
          }
        }

Swift::Int sub_100090F80(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFB40);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    uint64_t v33 = (void *)(v3 + 56);
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
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v33 = -1LL << v31;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

Swift::Int sub_10009125C(uint64_t a1)
{
  return sub_100091268(a1, &qword_1000CFAA0);
}

Swift::Int sub_100091268(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)(*v2 + 24);
  }
  sub_10000360C(a2);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 1LL);
  uint64_t v7 = v6;
  if (*(void *)(v4 + 16))
  {
    uint64_t v31 = v3;
    uint64_t v8 = 1LL << *(_BYTE *)(v4 + 32);
    unint64_t v9 = (void *)(v4 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1LL << v8);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v4 + 56);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 56;
    Swift::Int result = swift_retain(v4);
    int64_t v15 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v15 << 6);
      }

      else
      {
        int64_t v19 = v15 + 1;
        if (__OFADD__(v15, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v19 >= v12) {
          goto LABEL_36;
        }
        unint64_t v20 = v9[v19];
        ++v15;
        if (!v20)
        {
          int64_t v15 = v19 + 1;
          if (v19 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v20 = v9[v15];
          if (!v20)
          {
            int64_t v15 = v19 + 2;
            if (v19 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v20 = v9[v15];
            if (!v20)
            {
              int64_t v21 = v19 + 3;
              if (v21 >= v12)
              {
LABEL_36:
                swift_release(v4);
                uint64_t v3 = v31;
                uint64_t v30 = 1LL << *(_BYTE *)(v4 + 32);
                if (v30 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v9 = -1LL << v30;
                }
                *(void *)(v4 + 16) = 0LL;
                break;
              }

              unint64_t v20 = v9[v21];
              if (!v20)
              {
                while (1)
                {
                  int64_t v15 = v21 + 1;
                  if (__OFADD__(v21, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v15 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v20 = v9[v15];
                  ++v21;
                  if (v20) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v15 = v21;
            }
          }
        }

Swift::Int sub_100091500(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000D0848);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  Swift::Int v6 = result;
  if (*(void *)(v3 + 16))
  {
    uint64_t v29 = v2;
    int64_t v7 = 0LL;
    uint64_t v8 = (void *)(v3 + 56);
    uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v3 + 56);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    Swift::Int v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v7 << 6);
      }

      else
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v17 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          int64_t v7 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v18 = v8[v7];
          if (!v18)
          {
            int64_t v7 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v18 = v8[v7];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_36:
                uint64_t v28 = 1LL << *(_BYTE *)(v3 + 32);
                if (v28 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v28;
                }
                uint64_t v2 = v29;
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v7 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v7 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = v8[v7];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v7 = v19;
            }
          }
        }

Swift::Int sub_1000917A8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v58 = type metadata accessor for NCProtoMemberAssociationPrimaryInfo(0LL);
  uint64_t v4 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v51 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000360C(&qword_1000CF740);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = type metadata accessor for NeighborhoodActivityConduit.NearbyConversationInfo(0LL);
  uint64_t v57 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v10 = (uint64_t *)((char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = *v1;
  if (*(void *)(*v1 + 24) > a1) {
    a1 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFA68);
  uint64_t v12 = static _SetStorage.resize(original:capacity:move:)(v11, a1, 1LL);
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_42;
  }
  uint64_t v56 = v4;
  uint64_t v50 = v1;
  uint64_t v14 = 1LL << *(_BYTE *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 56);
  uint64_t v54 = (void *)(v11 + 56);
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  int64_t v53 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12 + 56;
  Swift::Int result = swift_retain(v11);
  int64_t v20 = 0LL;
  uint64_t v21 = (int *)v52;
  uint64_t v55 = v11;
  uint64_t v22 = v56;
  while (1)
  {
    if (v17)
    {
      unint64_t v24 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      int64_t v59 = v20;
      unint64_t v25 = v24 | (v20 << 6);
      goto LABEL_26;
    }

    int64_t v26 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }

    if (v26 >= v53) {
      goto LABEL_38;
    }
    unint64_t v27 = v54[v26];
    int64_t v28 = v20 + 1;
    if (!v27)
    {
      int64_t v28 = v20 + 2;
      if (v20 + 2 >= v53) {
        goto LABEL_38;
      }
      unint64_t v27 = v54[v28];
      if (!v27)
      {
        int64_t v28 = v20 + 3;
        if (v20 + 3 >= v53) {
          goto LABEL_38;
        }
        unint64_t v27 = v54[v28];
        if (!v27) {
          break;
        }
      }
    }

LABEL_38:
  swift_release(v11);
  uint64_t v2 = v50;
  uint64_t v49 = 1LL << *(_BYTE *)(v11 + 32);
  if (v49 > 63) {
    bzero(v54, ((unint64_t)(v49 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v54 = -1LL << v49;
  }
  *(void *)(v11 + 16) = 0LL;
LABEL_42:
  Swift::Int result = swift_release(v11);
  *uint64_t v2 = v13;
  return result;
}

unint64_t sub_100091CB0(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_100091D30(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1000909F4(v11);
  }

  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_1000932BC();
      goto LABEL_22;
    }

    sub_100093D00(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  unint64_t result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    uint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
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
        int64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

uint64_t sub_100091EC8(uint64_t result, void *a2, char a3, unint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = result;
  unint64_t v11 = *(void *)(*v5 + 16);
  unint64_t v12 = *(void *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0) {
    goto LABEL_23;
  }
  uint64_t v13 = v11 + 1;
  if ((a5 & 1) != 0)
  {
    sub_100090CD0(v13);
  }

  else
  {
    if (v12 > v11)
    {
      unint64_t result = (uint64_t)sub_10009346C();
      goto LABEL_23;
    }

    sub_100093FAC(v13);
  }

  uint64_t v14 = *v5;
  Hasher.init(_seed:)(v31, *(void *)(*v5 + 40));
  unint64_t v15 = sub_10000C47C(v10, a2, a3);
  uint64_t v17 = v16;
  String.hash(into:)(v31, v15, v16);
  swift_bridgeObjectRelease(v17);
  unint64_t result = Hasher._finalize()();
  uint64_t v18 = -1LL << *(_BYTE *)(v14 + 32);
  a4 = result & ~v18;
  uint64_t v19 = v14 + 56;
  if (((*(void *)(v14 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a4) & 1) != 0)
  {
    uint64_t v20 = ~v18;
    uint64_t v21 = *(void *)(v14 + 48);
    do
    {
      uint64_t v22 = v21 + 24 * a4;
      unint64_t result = *(void *)v22;
      uint64_t v23 = *(void **)(v22 + 8);
      int v24 = *(unsigned __int8 *)(v22 + 16);
      if (v24)
      {
        if (v24 == 1)
        {
          if (a3 != 1) {
            goto LABEL_11;
          }
        }

        else if (a3 != 2)
        {
          goto LABEL_11;
        }
      }

      else if (a3)
      {
        goto LABEL_11;
      }

      BOOL v25 = result == v10 && v23 == a2;
      if (v25 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v23, v10, a2, 0LL), (result & 1) != 0))
      {
        unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for ConduitDevice.Identifier);
        __break(1u);
        break;
      }

Swift::Int sub_1000920A8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  Swift::Int v7 = result;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 <= v8 || (a4 & 1) == 0)
  {
    uint64_t v10 = v8 + 1;
    if ((a4 & 1) != 0)
    {
      sub_100090F80(v10);
    }

    else
    {
      if (v9 > v8)
      {
        unint64_t result = (Swift::Int)sub_100093628();
        goto LABEL_10;
      }

      sub_10009422C(v10);
    }

    uint64_t v11 = *v4;
    Hasher.init(_seed:)(&__s1, *(void *)(*v4 + 40));
    Data.hash(into:)(&__s1, v7, a2);
    unint64_t result = Hasher._finalize()();
    a3 = result & ~(-1LL << *(_BYTE *)(v11 + 32));
    if (((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0) {
      __asm { BR              X8 }
    }
  }

LABEL_10:
  uint64_t v12 = *v4;
  *(void *)(*v4 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v13 = (Swift::Int *)(*(void *)(v12 + 48) + 16 * a3);
  *uint64_t v13 = v7;
  v13[1] = a2;
  uint64_t v14 = *(void *)(v12 + 16);
  BOOL v15 = __OFADD__(v14, 1LL);
  uint64_t v16 = v14 + 1;
  if (v15)
  {
    __break(1u);
    JUMPOUT(0x100092A10LL);
  }

  *(void *)(v12 + 16) = v16;
  return result;
}

void sub_100092AEC(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5, void *a6)
{
  unint64_t v9 = v6;
  unint64_t v12 = *(void *)(*v6 + 16);
  unint64_t v13 = *(void *)(*v6 + 24);
  if (v13 > v12 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v14 = v12 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100091268(v14, a4);
  }

  else
  {
    if (v13 > v12)
    {
      sub_1000937D8(a4);
      goto LABEL_14;
    }

    sub_1000944DC(v14, a4);
  }

  uint64_t v15 = *v6;
  Swift::Int v16 = NSObject._rawHashValue(seed:)(*(void *)(*v6 + 40));
  uint64_t v17 = -1LL << *(_BYTE *)(v15 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = sub_1000052E0(0LL, a5, a6);
    id v19 = *(id *)(*(void *)(v15 + 48) + 8 * a2);
    char v20 = static NSObject.== infix(_:_:)(v19, a1);

    if ((v20 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v18);
      __break(1u);
    }

    else
    {
      uint64_t v21 = ~v17;
      while (1)
      {
        a2 = (a2 + 1) & v21;
        if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v15 + 48) + 8 * a2);
        char v23 = static NSObject.== infix(_:_:)(v22, a1);

        if ((v23 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

uint64_t sub_100092C7C(uint64_t result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result & 1;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100091500(v8);
  }

  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_100093978();
      goto LABEL_14;
    }

    sub_100094750(v8);
  }

  uint64_t v9 = *v3;
  Hasher.init(_seed:)(v17, *(void *)(*v3 + 40));
  Hasher._combine(_:)(v5);
  unint64_t result = Hasher._finalize()();
  uint64_t v10 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 48);
    if (((((_DWORD)v5 == 0) ^ *(unsigned __int8 *)(v11 + a2)) & 1) != 0)
    {
LABEL_13:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for NeighborhoodActivityConduit.FaceTimeProcessAssertionReason);
      __break(1u);
    }

    else
    {
      uint64_t v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
      }
    }
  }

uint64_t sub_100092DE0(void *a1, unint64_t a2, char a3)
{
  uint64_t v7 = type metadata accessor for NCProtoMemberAssociationPrimaryInfo(0LL);
  uint64_t v62 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v61 = sub_10000360C(&qword_1000CF828);
  __chkstk_darwin(v61);
  uint64_t v60 = (uint64_t)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_10000360C(&qword_1000CF740);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v58 = (uint64_t)&v50 - v15;
  uint64_t v16 = (int *)type metadata accessor for NeighborhoodActivityConduit.NearbyConversationInfo(0LL);
  uint64_t v59 = *((void *)v16 - 1);
  __chkstk_darwin(v16);
  uint64_t v18 = (uint64_t *)((char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v19 = *(void *)(*v3 + 16);
  unint64_t v20 = *(void *)(*v3 + 24);
  uint64_t v57 = v3;
  if (v20 > v19 && (a3 & 1) != 0) {
    goto LABEL_27;
  }
  uint64_t v21 = v19 + 1;
  int64_t v53 = v14;
  if ((a3 & 1) != 0)
  {
    sub_1000917A8(v21);
    uint64_t v22 = v58;
  }

  else
  {
    uint64_t v22 = v58;
    if (v20 > v19)
    {
      sub_100093B08();
      goto LABEL_27;
    }

    sub_1000949C8(v21);
  }

  uint64_t v23 = *v3;
  Hasher.init(_seed:)(v64, *(void *)(*v3 + 40));
  sub_100054288((uint64_t)v64);
  Swift::Int v24 = Hasher._finalize()();
  uint64_t v25 = -1LL << *(_BYTE *)(v23 + 32);
  a2 = v24 & ~v25;
  uint64_t v26 = v23 + 56;
  if (((*(void *)(v23 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v51 = v9;
    uint64_t v55 = v23;
    uint64_t v56 = v7;
    uint64_t v63 = ~v25;
    uint64_t v27 = v60;
    uint64_t v28 = *(void *)(v59 + 72);
    uint64_t v54 = v23 + 56;
    do
    {
      sub_10004EA38(*(void *)(v23 + 48) + v28 * a2, (uint64_t)v18);
      uint64_t v31 = v18[1];
      uint64_t v32 = a1[1];
      BOOL v33 = *v18 == *a1 && v31 == v32;
      if (!v33 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v18, v31, *a1, v32, 0LL) & 1) == 0) {
        goto LABEL_12;
      }
      sub_1000052E0(0LL, &qword_1000CF830, &OBJC_CLASS___NSObject_ptr);
      uint64_t v34 = v16[7];
      uint64_t v35 = (uint64_t)v18 + v34;
      sub_1000956D0((uint64_t)a1 + v34, v22);
      uint64_t v36 = v27 + *(int *)(v61 + 48);
      sub_1000956D0(v35, v27);
      sub_1000956D0(v22, v36);
      uint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
      uint64_t v38 = v56;
      if (v37(v27, 1LL, v56) == 1)
      {
        sub_10000BFC8(v22, &qword_1000CF740);
        if (v37(v36, 1LL, v38) != 1) {
          goto LABEL_11;
        }
        uint64_t v27 = v60;
        sub_10000BFC8(v60, &qword_1000CF740);
        uint64_t v26 = v54;
        uint64_t v23 = v55;
      }

      else
      {
        uint64_t v39 = (uint64_t)v53;
        sub_1000956D0(v27, (uint64_t)v53);
        if (v37(v36, 1LL, v38) == 1)
        {
          uint64_t v29 = v58;
          sub_10000BFC8(v58, &qword_1000CF740);
          uint64_t v30 = v39;
          uint64_t v22 = v29;
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v30, v38);
LABEL_11:
          uint64_t v27 = v60;
          sub_10000BFC8(v60, &qword_1000CF828);
          uint64_t v26 = v54;
          uint64_t v23 = v55;
          goto LABEL_12;
        }

        uint64_t v40 = v51;
        (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v51, v36, v38);
        uint64_t v41 = sub_10000465C( &qword_1000CF838,  (uint64_t (*)(uint64_t))&type metadata accessor for NCProtoMemberAssociationPrimaryInfo,  (uint64_t)&protocol conformance descriptor for NCProtoMemberAssociationPrimaryInfo);
        int v52 = dispatch thunk of static Equatable.== infix(_:_:)(v39, v40, v38, v41);
        uint64_t v42 = *(void (**)(char *, uint64_t))(v62 + 8);
        v42(v40, v38);
        uint64_t v43 = v58;
        sub_10000BFC8(v58, &qword_1000CF740);
        uint64_t v44 = v39;
        uint64_t v22 = v43;
        v42((char *)v44, v38);
        sub_10000BFC8(v27, &qword_1000CF740);
        uint64_t v26 = v54;
        uint64_t v23 = v55;
        if ((v52 & 1) == 0) {
          goto LABEL_12;
        }
      }

      if (*(void *)((char *)v18 + v16[8]) == *(void *)((char *)a1 + v16[8]))
      {
        sub_10004EAC0((uint64_t)v18);
        ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v16);
        __break(1u);
        break;
      }

void *sub_1000932BC()
{
  uint64_t v1 = v0;
  sub_10000360C(&qword_1000D0850);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
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

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }

void *sub_10009346C()
{
  uint64_t v1 = v0;
  sub_10000360C(&qword_1000CFAC0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }

void *sub_100093628()
{
  uint64_t v1 = v0;
  sub_10000360C(&qword_1000CFB40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
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

id sub_1000937D8(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000360C(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _SetStorage.copy(original:)(*v1);
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v3);
    *uint64_t v2 = v5;
    return result;
  }

  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1LL << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  int64_t v10 = 0LL;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
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

    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }

void *sub_100093978()
{
  uint64_t v1 = v0;
  sub_10000360C(&qword_1000D0848);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 56);
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

    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }

void *sub_100093B08()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NeighborhoodActivityConduit.NearbyConversationInfo(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000360C(&qword_1000CFA68);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)(*v0);
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_28:
    id result = (void *)swift_release(v6);
    *uint64_t v1 = v8;
    return result;
  }

  id result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1LL << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  int64_t v13 = 0LL;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1LL << *(_BYTE *)(v6 + 32);
  uint64_t v15 = -1LL;
  if (v14 < 64) {
    uint64_t v15 = ~(-1LL << v14);
  }
  unint64_t v16 = v15 & *(void *)(v6 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v21 >= v17) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v17) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v10 + 8 * v13);
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v17) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v10 + 8 * v13);
        if (!v22) {
          break;
        }
      }
    }

Swift::Int sub_100093D00(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000D0850);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

unint64_t sub_100093FAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFAC0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
LABEL_27:
    unint64_t result = swift_release(v3);
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v27 = v3 + 56;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v3 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = v5 + 56;
  unint64_t result = swift_retain(v3);
  int64_t v12 = 0LL;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_10;
    }

    int64_t v24 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_29;
    }

    if (v24 >= v28) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v27 + 8 * v24);
    ++v12;
    if (!v25)
    {
      int64_t v12 = v24 + 1;
      if (v24 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v27 + 8 * v12);
      if (!v25)
      {
        int64_t v12 = v24 + 2;
        if (v24 + 2 >= v28) {
          goto LABEL_26;
        }
        unint64_t v25 = *(void *)(v27 + 8 * v12);
        if (!v25) {
          break;
        }
      }
    }

LABEL_29:
  __break(1u);
  return result;
}

Swift::Int sub_10009422C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFB40);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

Swift::Int sub_1000944DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)(*v2 + 24);
  }
  sub_10000360C(a2);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 0LL);
  uint64_t v7 = v6;
  if (!*(void *)(v4 + 16))
  {
    Swift::Int result = swift_release(v4);
LABEL_38:
    uint64_t *v3 = v7;
    return result;
  }

  uint64_t v31 = v3;
  uint64_t v8 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v9 = v4 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1LL << v8);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v4 + 56);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v13 = v6 + 56;
  Swift::Int result = swift_retain(v4);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v15 << 6);
      goto LABEL_27;
    }

    int64_t v19 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v19 >= v12) {
      goto LABEL_36;
    }
    unint64_t v20 = *(void *)(v9 + 8 * v19);
    ++v15;
    if (!v20)
    {
      int64_t v15 = v19 + 1;
      if (v19 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v20 = *(void *)(v9 + 8 * v15);
      if (!v20)
      {
        int64_t v15 = v19 + 2;
        if (v19 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v20 = *(void *)(v9 + 8 * v15);
        if (!v20) {
          break;
        }
      }
    }

Swift::Int sub_100094750(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000D0848);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  Swift::Int v6 = result;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  unint64_t v28 = v2;
  int64_t v7 = 0LL;
  Swift::Int v8 = v3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  Swift::Int v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v7 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }

Swift::Int sub_1000949C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v58 = type metadata accessor for NCProtoMemberAssociationPrimaryInfo(0LL);
  uint64_t v4 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  int v52 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000360C(&qword_1000CF740);
  __chkstk_darwin(v6);
  Swift::Int v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = type metadata accessor for NeighborhoodActivityConduit.NearbyConversationInfo(0LL);
  uint64_t v57 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v10 = (uint64_t *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = *v1;
  if (*(void *)(*v1 + 24) > a1) {
    a1 = *(void *)(*v1 + 24);
  }
  sub_10000360C(&qword_1000CFA68);
  uint64_t v12 = static _SetStorage.resize(original:capacity:move:)(v11, a1, 0LL);
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16))
  {
    Swift::Int result = swift_release(v11);
LABEL_40:
    *uint64_t v2 = v13;
    return result;
  }

  uint64_t v51 = v1;
  uint64_t v14 = 1LL << *(_BYTE *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 56);
  uint64_t v54 = v11 + 56;
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  int64_t v55 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v56 = v4;
  uint64_t v18 = v12 + 56;
  Swift::Int result = swift_retain(v11);
  int64_t v20 = 0LL;
  uint64_t v21 = v11;
  unint64_t v22 = (int *)v53;
  uint64_t v23 = v56;
  while (1)
  {
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      int64_t v60 = v20;
      unint64_t v26 = v25 | (v20 << 6);
      goto LABEL_26;
    }

    int64_t v27 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }

    if (v27 >= v55) {
      goto LABEL_38;
    }
    unint64_t v28 = *(void *)(v54 + 8 * v27);
    int64_t v29 = v20 + 1;
    if (!v28)
    {
      int64_t v29 = v20 + 2;
      if (v20 + 2 >= v55) {
        goto LABEL_38;
      }
      unint64_t v28 = *(void *)(v54 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v20 + 3;
        if (v20 + 3 >= v55) {
          goto LABEL_38;
        }
        unint64_t v28 = *(void *)(v54 + 8 * v29);
        if (!v28) {
          break;
        }
      }
    }

uint64_t sub_100094EA8(void *a1)
{
  return sub_100094EC4(a1, &qword_1000CE358, &OBJC_CLASS___NSXPCConnection_ptr, &qword_1000D0870);
}

uint64_t sub_100094EC4(void *a1, unint64_t *a2, void *a3, uint64_t *a4)
{
  Swift::Int v8 = v4;
  uint64_t v10 = *v4;
  if ((*v4 & 0xC000000000000001LL) != 0)
  {
    if (v10 < 0) {
      uint64_t v11 = *v4;
    }
    else {
      uint64_t v11 = v10 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v10);
    id v12 = a1;
    char v13 = __CocoaSet.contains(_:)();

    if ((v13 & 1) != 0)
    {
      uint64_t v14 = sub_1000951E0(v11, (uint64_t)v12, a4, a2, a3);
      swift_bridgeObjectRelease(v10);
      return v14;
    }

uint64_t sub_1000950AC(char a1)
{
  Swift::UInt v2 = a1 & 1;
  uint64_t v3 = *v1;
  Hasher.init(_seed:)(v14, *(void *)(*v1 + 40LL));
  Hasher._combine(_:)(v2);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
    return 2LL;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (((((_DWORD)v2 == 0) ^ *(unsigned __int8 *)(v7 + v6)) & 1) == 0)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
        return 2LL;
      }
    }

    while (((((_DWORD)v2 == 0) ^ *(unsigned __int8 *)(v7 + v6)) & 1) == 0);
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  uint64_t v10 = *v1;
  v14[0] = *v1;
  *uint64_t v1 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100093978();
    uint64_t v10 = v14[0];
  }

  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 + 48) + v6);
  sub_100095528(v6);
  uint64_t v12 = *v1;
  *uint64_t v1 = v14[0];
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_1000951E0(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, void *a5)
{
  uint64_t v9 = v5;
  swift_bridgeObjectRelease(*v9);
  uint64_t v12 = __CocoaSet.count.getter(a1);
  uint64_t v13 = swift_unknownObjectRetain(a1);
  Swift::Int v14 = sub_1000907F4(v13, v12, a3, a4, a5);
  Swift::Int v25 = v14;
  Swift::Int v15 = *(void *)(v14 + 40);
  swift_retain(v14);
  Swift::Int v16 = NSObject._rawHashValue(seed:)(v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v14 + 32);
  unint64_t v18 = v16 & ~v17;
  if (((*(void *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) != 0)
  {
    sub_1000052E0(0LL, a4, a5);
    id v19 = *(id *)(*(void *)(v14 + 48) + 8 * v18);
    char v20 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v20 & 1) != 0)
    {
LABEL_6:
      swift_release(v14);
      Swift::Int v14 = *(void *)(*(void *)(v14 + 48) + 8 * v18);
      sub_100095388(v18);
      if ((static NSObject.== infix(_:_:)(a2, v14) & 1) != 0)
      {
        Swift::Int *v9 = v25;
        return v14;
      }

      __break(1u);
    }

    else
    {
      uint64_t v21 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v21;
        if (((*(void *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v14 + 48) + 8 * v18);
        char v23 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v23 & 1) != 0) {
          goto LABEL_6;
        }
      }
    }

    swift_release(v14);
    __break(1u);
  }

  uint64_t result = swift_release(v14);
  __break(1u);
  return result;
}

unint64_t sub_100095388(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            uint64_t v17 = (void *)(v16 + 8 * v2);
            unint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              void *v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }

        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    uint64_t result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1LL);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

unint64_t sub_100095528(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt v10 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v6);
        Hasher.init(_seed:)(v18, *(void *)(v3 + 40));
        Hasher._combine(_:)(v10);
        unint64_t v11 = Hasher._finalize()() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }

        else if (v11 >= v9)
        {
          goto LABEL_11;
        }

        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          Swift::Int v13 = (_BYTE *)(v12 + v2);
          Swift::Int v14 = (_BYTE *)(v12 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *Swift::Int v13 = *v14;
            int64_t v2 = v6;
          }
        }

uint64_t sub_1000956D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000360C(&qword_1000CF740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100095718(uint64_t a1)
{
  return sub_10008EF64(a1, *(void **)(v1 + 16));
}

id (*sub_100095734(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = [v3 flags];
  return sub_100095774;
}

id sub_100095774(uint64_t a1)
{
  return [*(id *)a1 setFlags:*(unsigned int *)(a1 + 8)];
}

id sub_10009578C(uint64_t a1)
{
  return [*v1 setControlFlags:a1];
}

id (*sub_1000957A0(void *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = [v3 controlFlags];
  return sub_1000957E0;
}

id sub_1000957E0(uint64_t a1)
{
  return [*(id *)(a1 + 8) setControlFlags:*(void *)a1];
}

uint64_t sub_1000957F4()
{
  id v1 = [*v0 activeDevices];
  unint64_t v2 = sub_1000963C8();
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  return v3;
}

void sub_100095848(void *a1)
{
}

void sub_10009587C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100095898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

id sub_1000958B4()
{
  return [*v0 invalidate];
}

uint64_t sub_1000958C4()
{
  unint64_t v2 = v1 + 2;
  uint64_t v3 = *v0;
  v1[2] = v1;
  v1[3] = sub_100095950;
  uint64_t v4 = swift_continuation_init(v1 + 2, 1LL);
  v1[10] = _NSConcreteStackBlock;
  uint64_t v5 = v1 + 10;
  v5[1] = 0x40000000LL;
  v5[2] = sub_1000209D8;
  v5[3] = &unk_1000C6130;
  v5[4] = v4;
  [v3 activateWithCompletion:v5];
  return swift_continuation_await(v2);
}

uint64_t sub_100095950()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 48)) {
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000959A4(uint64_t a1, uint64_t a2, objc_class *a3, uint64_t a4, uint64_t a5)
{
  return sub_100095BD0( a1,  a2,  a3,  a4,  a5,  (uint64_t)sub_1000959DC,  (uint64_t)&unk_1000C60E0,  (SEL *)&selRef_registerRequestID_options_handler_);
}

uint64_t sub_1000959DC(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, objc_class *, uint64_t), uint64_t))(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  if (a3) {
    a3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  unint64_t v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject(&unk_1000C6118, 24LL, 7LL);
  *(void *)(v10 + 16) = v9;
  swift_retain(v6);
  v7(v8, a3, sub_1000963C0, v10);
  swift_release(v6);
  swift_bridgeObjectRelease(v8);
  swift_release(v10);
  return swift_bridgeObjectRelease(a3);
}

void sub_100095AC8(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4)
{
  Class isa = a2;
  if (a1)
  {
    v7.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    if (!isa) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  v7.super.Class isa = 0LL;
  if (a2) {
LABEL_3:
  }
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
LABEL_4:
  if (a3) {
    uint64_t v8 = _convertErrorToNSError(_:)(a3);
  }
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = (id)v8;
  (*(void (**)(uint64_t, Class, Class))(a4 + 16))(a4, v7.super.isa, isa);
}

uint64_t sub_100095B98(uint64_t a1, uint64_t a2, objc_class *a3, uint64_t a4, uint64_t a5)
{
  return sub_100095BD0( a1,  a2,  a3,  a4,  a5,  (uint64_t)sub_100095CB8,  (uint64_t)&unk_1000C60B8,  (SEL *)&selRef_registerEventID_options_handler_);
}

uint64_t sub_100095BD0( uint64_t a1, uint64_t a2, Class isa, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  NSString v15 = String._bridgeToObjectiveC()();
  if (isa) {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  v18[4] = a4;
  uint64_t v19 = a5;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256LL;
  v18[2] = a6;
  uint64_t v18[3] = a7;
  BOOL v16 = _Block_copy(v18);
  swift_retain(a5);
  objc_msgSend(v8, *a8, v15, isa, v16);
  _Block_release(v16);

  return swift_release(v19);
}

uint64_t sub_100095CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  if (a3) {
    a3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  swift_retain(v4);
  v5(v6, a3);
  swift_release(v4);
  swift_bridgeObjectRelease(v6);
  return swift_bridgeObjectRelease(a3);
}

uint64_t sub_100095D64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, objc_class *a6, uint64_t a7, uint64_t a8)
{
  return sub_100095D84(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100095D84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, Class isa, uint64_t a7, uint64_t a8)
{
  NSString v12 = String._bridgeToObjectiveC()();
  v13.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  NSString v14 = String._bridgeToObjectiveC()();
  if (isa) {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  v17[4] = a7;
  uint64_t v18 = a8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256LL;
  v17[2] = sub_100095ECC;
  v17[3] = &unk_1000C6090;
  NSString v15 = _Block_copy(v17);
  swift_retain(a8);
  [v8 sendRequestID:v12 request:v13.super.isa destinationID:v14 options:isa responseHandler:v15];
  _Block_release(v15);

  return swift_release(v18);
}

uint64_t sub_100095ECC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  NSDictionary v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!a2)
  {
    uint64_t v8 = 0LL;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v5,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
LABEL_4:
  swift_retain(v6);
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release(v6);

  swift_bridgeObjectRelease(v5);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100095F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, objc_class *a6)
{
  NSString v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Class))((char *)&dword_1000D0890
                                                                                   + dword_1000D0890);
  NSDictionary v13 = (void *)swift_task_alloc(unk_1000D0894);
  *(void *)(v6 + 16) = v13;
  *NSDictionary v13 = v6;
  v13[1] = sub_10000C2B8;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10009603C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, Class isa)
{
  id v9 = (objc_class *)String._bridgeToObjectiveC()();
  v7[15].super.Class isa = v9;
  v10.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v7[16].super.Class isa = v10.super.isa;
  unint64_t v11 = (objc_class *)String._bridgeToObjectiveC()();
  v7[17].super.Class isa = v11;
  if (isa) {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  NSString v12 = v7 + 2;
  v7[18].super.Class isa = isa;
  v7[2].super.Class isa = (Class)v7;
  v7[3].super.Class isa = (Class)sub_100096174;
  uint64_t v13 = swift_continuation_init(&v7[2], 1LL);
  v7[10].super.Class isa = (Class)_NSConcreteStackBlock;
  NSString v14 = v7 + 10;
  v14[1].super.Class isa = (Class)0x40000000;
  v14[2].super.Class isa = (Class)sub_1000209D8;
  v14[3].super.Class isa = (Class)&unk_1000C6078;
  v14[4].super.Class isa = (Class)v13;
  [v6 sendEventID:v9 event:v10.super.isa destinationID:v11 options:isa completion:v14];
  return swift_continuation_await(v12);
}

uint64_t sub_100096174()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *(void **)(v1 + 136);
  uint64_t v3 = *(void **)(v1 + 144);
  uint64_t v4 = *(void **)(v1 + 120);
  uint64_t v5 = *(void **)(v1 + 128);
  if (*(void *)(v1 + 48)) {
    swift_willThrow();
  }

  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000961F0()
{
  id v1 = [*v0 peerDeviceIdentifier];
  if (!v1) {
    return 0LL;
  }
  unint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

void sub_100096254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100096270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  id v9 = *v7;
  if (a1)
  {
    v11[4] = a1;
    uint64_t v12 = a2;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256LL;
    v11[2] = a5;
    v11[3] = a6;
    NSDictionary v10 = _Block_copy(v11);
    swift_release(v12);
  }

  else
  {
    NSDictionary v10 = 0LL;
  }

  objc_msgSend(v9, *a7, v10);
  _Block_release(v10);
}

uint64_t sub_1000962F8()
{
  unint64_t v2 = v1 + 2;
  uint64_t v3 = *v0;
  v1[2] = v1;
  v1[3] = sub_100096418;
  uint64_t v4 = swift_continuation_init(v1 + 2, 1LL);
  v1[10] = _NSConcreteStackBlock;
  uint64_t v5 = v1 + 10;
  v5[1] = 0x40000000LL;
  v5[2] = sub_1000209D8;
  v5[3] = &unk_1000C6038;
  v5[4] = v4;
  [v3 activateWithCompletion:v5];
  return swift_continuation_await(v2);
}

uint64_t sub_100096384(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100096394(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10009639C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000963C0(uint64_t a1, objc_class *a2, uint64_t a3)
{
}

unint64_t sub_1000963C8()
{
  unint64_t result = qword_1000CE128;
  if (!qword_1000CE128)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___RPCompanionLinkDevice);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000CE128);
  }

  return result;
}

unint64_t sub_100096430()
{
  uint64_t v0 = sub_10000360C(&qword_1000D08C0);
  uint64_t inited = swift_initStackObject(v0, v10);
  *(_OWORD *)(inited + 16) = xmmword_1000AAED0;
  *(void *)(inited + 32) = 0xD00000000000001BLL;
  *(void *)(inited + 40) = 0x80000001000A6420LL;
  uint64_t v2 = sub_10000360C(&qword_1000D08C8);
  uint64_t v3 = swift_initStackObject(v2, v9);
  *(_OWORD *)(v3 + 16) = xmmword_1000AAEE0;
  *(void *)(v3 + 32) = 5459817LL;
  *(void *)(v3 + 40) = 0xE300000000000000LL;
  strcpy((char *)(v3 + 48), "com.apple.tv");
  *(_BYTE *)(v3 + 61) = 0;
  *(_WORD *)(v3 + 62) = -5120;
  *(void *)(v3 + 64) = 0x534F63616DLL;
  *(void *)(v3 + 72) = 0xE500000000000000LL;
  strcpy((char *)(v3 + 80), "com.apple.TV");
  *(_BYTE *)(v3 + 93) = 0;
  *(_WORD *)(v3 + 94) = -5120;
  *(void *)(v3 + 96) = 1397716596LL;
  *(void *)(v3 + 104) = 0xE400000000000000LL;
  *(void *)(v3 + 112) = 0xD000000000000015LL;
  *(void *)(v3 + 120) = 0x80000001000A6440LL;
  *(void *)(v3 + 128) = 0x6B6361626C6C6166LL;
  *(void *)(v3 + 136) = 0xE800000000000000LL;
  strcpy((char *)(v3 + 144), "com.apple.tv");
  *(_BYTE *)(v3 + 157) = 0;
  *(_WORD *)(v3 + 158) = -5120;
  *(void *)(inited + 48) = sub_100003E5C(v3);
  *(void *)(inited + 56) = 0xD00000000000001ELL;
  *(void *)(inited + 64) = 0x80000001000A6460LL;
  uint64_t v4 = swift_initStackObject(v2, v8);
  *(_OWORD *)(v4 + 16) = xmmword_1000AAEE0;
  *(void *)(v4 + 32) = 5459817LL;
  *(void *)(v4 + 40) = 0xE300000000000000LL;
  *(void *)(v4 + 48) = 0x6C7070612E6D6F63LL;
  *(void *)(v4 + 56) = 0xEF636973754D2E65LL;
  *(void *)(v4 + 64) = 0x534F63616DLL;
  *(void *)(v4 + 72) = 0xE500000000000000LL;
  *(void *)(v4 + 80) = 0x6C7070612E6D6F63LL;
  *(void *)(v4 + 88) = 0xEF636973754D2E65LL;
  *(void *)(v4 + 96) = 1397716596LL;
  *(void *)(v4 + 104) = 0xE400000000000000LL;
  *(void *)(v4 + 112) = 0xD000000000000011LL;
  *(void *)(v4 + 120) = 0x80000001000A6480LL;
  *(void *)(v4 + 128) = 0x6B6361626C6C6166LL;
  *(void *)(v4 + 136) = 0xE800000000000000LL;
  *(void *)(v4 + 144) = 0x6C7070612E6D6F63LL;
  *(void *)(v4 + 152) = 0xEF636973754D2E65LL;
  *(void *)(inited + 72) = sub_100003E5C(v4);
  *(void *)(inited + 80) = 0xD000000000000024LL;
  *(void *)(inited + 88) = 0x80000001000A64A0LL;
  uint64_t v5 = swift_initStackObject(v2, v7);
  *(_OWORD *)(v5 + 16) = xmmword_1000AAEE0;
  *(void *)(v5 + 32) = 5459817LL;
  *(void *)(v5 + 40) = 0xE300000000000000LL;
  *(void *)(v5 + 48) = 0xD000000000000015LL;
  *(void *)(v5 + 56) = 0x80000001000A64D0LL;
  *(void *)(v5 + 64) = 0x534F63616DLL;
  *(void *)(v5 + 72) = 0xE500000000000000LL;
  *(void *)(v5 + 80) = 0x6C7070612E6D6F63LL;
  *(void *)(v5 + 88) = 0xEF7365746F4E2E65LL;
  *(void *)(v5 + 96) = 1397716596LL;
  *(void *)(v5 + 104) = 0xE400000000000000LL;
  *(void *)(v5 + 112) = 0xD000000000000015LL;
  *(void *)(v5 + 120) = 0x80000001000A64D0LL;
  *(void *)(v5 + 128) = 0x6B6361626C6C6166LL;
  *(void *)(v5 + 136) = 0xE800000000000000LL;
  *(void *)(v5 + 144) = 0xD000000000000015LL;
  *(void *)(v5 + 152) = 0x80000001000A64D0LL;
  *(void *)(inited + 96) = sub_100003E5C(v5);
  unint64_t result = sub_100003F7C(inited);
  qword_1000D0898 = result;
  return result;
}

void sub_100096694()
{
  qword_1000D08A0 = v0;
}

void sub_1000966CC(uint64_t a1, unint64_t a2, double a3)
{
  id v6 = [(id)objc_opt_self(FTServerBag) sharedInstance];
  if (v6)
  {
    NSDictionary v7 = v6;
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      _bridgeAnyObjectToAny(_:)(v29);
      swift_unknownObjectRelease(v9);
      sub_100004E20(v29, v30);
    }

    else
    {
      memset(v30, 0, sizeof(v30));
    }

    uint64_t v10 = sub_10000360C(&qword_1000CE540);
    if (swift_dynamicCast(v29, v30, v10, &type metadata for Double, 6LL))
    {
      uint64_t v11 = *(void *)&v29[0];
      sub_100096FE8();
      uint64_t v12 = swift_bridgeObjectRetain_n(a2, 2LL);
      uint64_t v13 = (os_log_s *)static OS_os_log.default.getter(v12);
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v13, v14))
      {
        swift_bridgeObjectRelease_n(a2, 2LL);
        goto LABEL_14;
      }

      uint64_t v15 = swift_slowAlloc(22LL, -1LL);
      uint64_t v16 = swift_slowAlloc(64LL, -1LL);
      *(void *)&v30[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      swift_bridgeObjectRetain(a2);
      *(void *)&v29[0] = sub_10009BE3C(a1, a2, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, (char *)v29 + 8, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      *(_WORD *)(v15 + 12) = 2080;
      *(void *)&v29[0] = v11;
      uint64_t v17 = String.init<A>(reflecting:)(v29, &type metadata for Double);
      unint64_t v19 = v18;
      *(void *)&v29[0] = sub_10009BE3C(v17, v18, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, (char *)v29 + 8, v15 + 14, v15 + 22);
      swift_bridgeObjectRelease(v19);
      BOOL v20 = "Got %s from server bag with a value of: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v20, (uint8_t *)v15, 0x16u);
      swift_arrayDestroy(v16, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
LABEL_14:

      return;
    }

    if (qword_1000CD690 != -1) {
      swift_once(&qword_1000CD690, sub_100088E24);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_10000ADF4(v21, (uint64_t)qword_1000D3620);
    uint64_t v22 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc(22LL, -1LL);
      uint64_t v16 = swift_slowAlloc(64LL, -1LL);
      *(void *)&v29[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)&v30[0] = a1;
      *((void *)&v30[0] + 1) = a2;
      swift_bridgeObjectRetain(a2);
      uint64_t v23 = String.init<A>(reflecting:)(v30, &type metadata for String);
      unint64_t v25 = v24;
      *(void *)&v30[0] = sub_10009BE3C(v23, v24, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v30, (char *)v30 + 8, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease_n(a2, 2LL);
      swift_bridgeObjectRelease(v25);
      *(_WORD *)(v15 + 12) = 2080;
      *(double *)uint64_t v30 = a3;
      uint64_t v26 = String.init<A>(reflecting:)(v30, &type metadata for Double);
      unint64_t v28 = v27;
      *(void *)&v30[0] = sub_10009BE3C(v26, v27, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v30, (char *)v30 + 8, v15 + 14, v15 + 22);
      swift_bridgeObjectRelease(v28);
      BOOL v20 = "Server bag does not have a value for %s, so returning the default one of %s seconds.";
      goto LABEL_12;
    }

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  else
  {
    __break(1u);
  }

id sub_100096ABC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id result = [(id)objc_opt_self(FTServerBag) sharedInstance];
  if (result)
  {
    NSDictionary v7 = result;
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      _bridgeAnyObjectToAny(_:)(v32);
      swift_unknownObjectRelease(v9);
      sub_100004E20(v32, v33);
    }

    else
    {
      memset(v33, 0, sizeof(v33));
    }

    uint64_t v10 = sub_10000360C(&qword_1000CE540);
    uint64_t v11 = sub_10000360C(&qword_1000D08B0);
    if (swift_dynamicCast(v32, v33, v10, v11, 6LL))
    {
      a3 = *(void *)&v32[0];
      sub_100096FE8();
      swift_bridgeObjectRetain_n(a3, 2LL);
      uint64_t v12 = swift_bridgeObjectRetain_n(a2, 2LL);
      uint64_t v13 = (os_log_s *)static OS_os_log.default.getter(v12);
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = swift_slowAlloc(22LL, -1LL);
        uint64_t v16 = swift_slowAlloc(64LL, -1LL);
        *(void *)&v33[0] = v16;
        *(_DWORD *)uint64_t v15 = 136315394;
        swift_bridgeObjectRetain(a2);
        *(void *)&v32[0] = sub_10009BE3C(a1, a2, (uint64_t *)v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, (char *)v32 + 8, v15 + 4, v15 + 12);
        swift_bridgeObjectRelease_n(a2, 3LL);
        *(_WORD *)(v15 + 12) = 2080;
        *(void *)&v32[0] = a3;
        swift_bridgeObjectRetain(a3);
        uint64_t v17 = String.init<A>(reflecting:)(v32, v11);
        unint64_t v19 = v18;
        *(void *)&v32[0] = sub_10009BE3C(v17, v18, (uint64_t *)v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, (char *)v32 + 8, v15 + 14, v15 + 22);
        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease(v19);
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Got %s from server bag with a value of: %s",  (uint8_t *)v15,  0x16u);
        swift_arrayDestroy(v16, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v16, -1LL, -1LL);
        swift_slowDealloc(v15, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease_n(a2, 2LL);
      }
    }

    else
    {
      if (qword_1000CD690 != -1) {
        swift_once(&qword_1000CD690, sub_100088E24);
      }
      uint64_t v20 = type metadata accessor for Logger(0LL);
      sub_10000ADF4(v20, (uint64_t)qword_1000D3620);
      swift_bridgeObjectRetain_n(a2, 2LL);
      uint64_t v21 = swift_bridgeObjectRetain_n(a3, 2LL);
      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = swift_slowAlloc(22LL, -1LL);
        uint64_t v25 = swift_slowAlloc(64LL, -1LL);
        *(void *)&v32[0] = v25;
        *(_DWORD *)uint64_t v24 = 136315394;
        *(void *)&v33[0] = a1;
        *((void *)&v33[0] + 1) = a2;
        swift_bridgeObjectRetain(a2);
        uint64_t v26 = String.init<A>(reflecting:)(v33, &type metadata for String);
        unint64_t v28 = v27;
        *(void *)&v33[0] = sub_10009BE3C(v26, v27, (uint64_t *)v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v33, (char *)v33 + 8, v24 + 4, v24 + 12);
        swift_bridgeObjectRelease_n(a2, 2LL);
        swift_bridgeObjectRelease(v28);
        *(_WORD *)(v24 + 12) = 2080;
        *(void *)&v33[0] = a3;
        swift_bridgeObjectRetain(a3);
        uint64_t v29 = String.init<A>(reflecting:)(v33, v11);
        unint64_t v31 = v30;
        *(void *)&v33[0] = sub_10009BE3C(v29, v30, (uint64_t *)v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v33, (char *)v33 + 8, v24 + 14, v24 + 22);
        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease(v31);
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "Server bag does not have a value for %s, so returning the default one of %s seconds.",  (uint8_t *)v24,  0x16u);
        swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1LL, -1LL);
        swift_slowDealloc(v24, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease_n(a2, 2LL);
      }

      swift_bridgeObjectRetain(a3);
    }

    return (id)a3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100096F64()
{
  if (qword_1000CD6E0 != -1) {
    swift_once(&qword_1000CD6E0, sub_100096430);
  }
  uint64_t v0 = qword_1000D0898;
  swift_bridgeObjectRetain(qword_1000D0898);
  id v1 = sub_100096ABC(0xD000000000000020LL, 0x80000001000A63F0LL, v0);
  uint64_t result = swift_bridgeObjectRelease(v0);
  qword_1000D08A8 = (uint64_t)v1;
  return result;
}

unint64_t sub_100096FE8()
{
  unint64_t result = qword_1000D08B8;
  if (!qword_1000D08B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D08B8);
  }

  return result;
}

ValueMetadata *type metadata accessor for ConversationServerBag()
{
  return &type metadata for ConversationServerBag;
}

uint64_t sub_100097034(uint64_t a1)
{
  if (qword_1000CD6F0 != -1) {
LABEL_43:
  }
    swift_once(&qword_1000CD6F0, sub_100096F64);
  uint64_t v2 = qword_1000D08A8;
  uint64_t v3 = swift_bridgeObjectRetain(qword_1000D08A8);
  uint64_t v4 = sub_10000B2FC(v3);
  swift_bridgeObjectRelease(v2);
  if (qword_1000CD690 != -1) {
    swift_once(&qword_1000CD690, sub_100088E24);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_10000ADF4(v5, (uint64_t)qword_1000D3620);
  uint64_t v6 = swift_bridgeObjectRetain(a1);
  NSDictionary v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  uint64_t v34 = a1;
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)id v9 = 134217984;
    uint64_t v42 = *(void *)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received %ld policy settings", v9, 0xCu);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(a1);
  }

  uint64_t v35 = a1 + 64;
  uint64_t v10 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(a1 + 64);
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v37 = OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationManager;
  swift_bridgeObjectRetain(a1);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_25;
    }

    if (__OFADD__(v13++, 1LL))
    {
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }

    if (v13 >= v36) {
      goto LABEL_40;
    }
    unint64_t v19 = *(void *)(v35 + 8 * v13);
    if (!v19) {
      break;
    }
LABEL_24:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_25:
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 16 * v17 + 8);
    unsigned int v41 = *(unsigned __int8 *)(*(void *)(a1 + 56) + v17);
    uint64_t v22 = *(void **)(v38 + v37);
    uint64_t v23 = v4[2];
    swift_bridgeObjectRetain(v21);
    id v24 = v22;
    if (v23)
    {
      int64_t v39 = v13;
      unint64_t v40 = v12;
      uint64_t v25 = swift_retain(v4);
      uint64_t v26 = 0LL;
      while (1)
      {
        uint64_t v27 = v4[v26 + 4];
        __chkstk_darwin(v25);
        uint64_t v28 = swift_bridgeObjectRetain(v27);
        if ((sub_10009888C(v28, sub_100098A6C) & 1) != 0) {
          break;
        }
        ++v26;
        uint64_t v25 = swift_bridgeObjectRelease(v27);
        if (v23 == v26)
        {
          swift_release(v4);
          a1 = v34;
          int64_t v13 = v39;
          goto LABEL_10;
        }
      }

      swift_release(v4);
      a1 = v34;
      int64_t v13 = v39;
      uint64_t v14 = v41;
      if (*(void *)(v27 + 16)
        && ((unint64_t v29 = sub_100004CD4(1397716596LL, 0xE400000000000000LL), (v30 & 1) != 0)
         || *(void *)(v27 + 16) && (unint64_t v29 = sub_100004CD4(0x6B6361626C6C6166LL, 0xE800000000000000LL), (v31 & 1) != 0)))
      {
        uint64_t v32 = *(void *)(*(void *)(v27 + 56) + 16 * v29 + 8);
        swift_bridgeObjectRetain(v32);
        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v27);
        uint64_t v21 = v32;
        unint64_t v12 = v40;
      }

      else
      {
        swift_bridgeObjectRelease(v27);
      }
    }

    else
    {
LABEL_10:
      uint64_t v14 = v41;
    }

    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    [v24 setActivityAuthorization:v14 forBundleIdentifier:v15];
  }

  int64_t v20 = v13 + 1;
  if (v13 + 1 >= v36) {
    goto LABEL_40;
  }
  unint64_t v19 = *(void *)(v35 + 8 * v20);
  if (v19) {
    goto LABEL_23;
  }
  int64_t v20 = v13 + 2;
  if (v13 + 2 >= v36) {
    goto LABEL_40;
  }
  unint64_t v19 = *(void *)(v35 + 8 * v20);
  if (v19)
  {
LABEL_23:
    int64_t v13 = v20;
    goto LABEL_24;
  }

  int64_t v20 = v13 + 3;
  if (v13 + 3 < v36)
  {
    unint64_t v19 = *(void *)(v35 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v13 = v20 + 1;
        if (__OFADD__(v20, 1LL)) {
          goto LABEL_42;
        }
        if (v13 >= v36) {
          goto LABEL_40;
        }
        unint64_t v19 = *(void *)(v35 + 8 * v13);
        ++v20;
        if (v19) {
          goto LABEL_24;
        }
      }
    }

    goto LABEL_23;
  }

void sub_100097488()
{
  uint64_t v1 = v0;
  if (qword_1000CD690 != -1) {
LABEL_30:
  }
    swift_once(&qword_1000CD690, sub_100088E24);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000ADF4(v2, (uint64_t)qword_1000D3620);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Clearing policy info", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationManager;
  id v8 =  [*(id *)(v1 + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationManager) activityAuthorizedBundleIdentifiers];
  unint64_t v9 = sub_100088AFC();
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v8,  &type metadata for String,  v9,  &protocol witness table for String);

  int64_t v11 = 0LL;
  uint64_t v12 = v10 + 64;
  uint64_t v13 = 1LL << *(_BYTE *)(v10 + 32);
  uint64_t v14 = -1LL;
  if (v13 < 64) {
    uint64_t v14 = ~(-1LL << v13);
  }
  unint64_t v15 = v14 & *(void *)(v10 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v11 << 6);
      goto LABEL_8;
    }

    int64_t v23 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v23 >= v16) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v12 + 8 * v23);
    ++v11;
    if (!v24)
    {
      int64_t v11 = v23 + 1;
      if (v23 + 1 >= v16) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v12 + 8 * v11);
      if (!v24)
      {
        int64_t v11 = v23 + 2;
        if (v23 + 2 >= v16) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v12 + 8 * v11);
        if (!v24)
        {
          int64_t v11 = v23 + 3;
          if (v23 + 3 >= v16) {
            goto LABEL_28;
          }
          unint64_t v24 = *(void *)(v12 + 8 * v11);
          if (!v24)
          {
            int64_t v11 = v23 + 4;
            if (v23 + 4 >= v16) {
              goto LABEL_28;
            }
            unint64_t v24 = *(void *)(v12 + 8 * v11);
            if (!v24) {
              break;
            }
          }
        }
      }
    }

uint64_t sub_100097734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  unint64_t v7 = (*(void *)(*(void *)(sub_10000360C(&qword_1000CDE48) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[12] = swift_task_alloc(v7);
  v6[13] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  v6[14] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[15] = v9;
  v6[16] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for HandoffState(0LL);
  v6[17] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[18] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[19] = swift_task_alloc(v12);
  v6[20] = swift_task_alloc(v12);
  v6[21] = swift_task_alloc(v12);
  v6[22] = swift_task_alloc(v12);
  uint64_t v13 = sub_10000360C(&qword_1000CF8C8);
  v6[23] = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for HandoffInfo(0LL);
  v6[24] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v6[25] = v15;
  v6[26] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000CD668 != -1) {
    swift_once(&qword_1000CD668, sub_100053B3C);
  }
  uint64_t v16 = qword_1000D35E0;
  v6[27] = qword_1000D35E0;
  return swift_task_switch(sub_100097898, v16, 0LL);
}

uint64_t sub_100097898()
{
  uint64_t v1 = v0 + 16;
  if (qword_1000CD690 != -1) {
    swift_once(&qword_1000CD690, sub_100088E24);
  }
  uint64_t v2 = v0 + 56;
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 80);
  *(void *)(v0 + 224) = sub_10000ADF4(*(void *)(v0 + 112), (uint64_t)qword_1000D3620);
  swift_retain_n(v3, 2LL);
  uint64_t v5 = swift_bridgeObjectRetain_n(v4, 2LL);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 80);
  if (v8)
  {
    uint64_t v11 = swift_slowAlloc(22LL, -1LL);
    uint64_t v67 = swift_slowAlloc(64LL, -1LL);
    uint64_t v70 = v67;
    *(_DWORD *)uint64_t v11 = 136315394;
    os_log_type_t typea = v7;
    uint64_t v13 = *(void *)(v9 + 16);
    unint64_t v12 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain(v12);
    uint64_t v14 = v13;
    uint64_t v2 = v0 + 56;
    *(void *)(v0 + 56) = sub_10009BE3C(v14, v12, &v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v12);
    swift_release_n(v9, 2LL);
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v15 = swift_bridgeObjectRetain(v10);
    uint64_t v16 = Dictionary.Keys.description.getter( v15,  &type metadata for String,  &type metadata for Bool,  &protocol witness table for String);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease(v10);
    *(void *)(v0 + 64) = sub_10009BE3C(v16, v18, &v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease_n(v10, 2LL);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  typea,  "Received SharePlay policy updates from %s for bundle IDs: %s",  (uint8_t *)v11,  0x16u);
    swift_arrayDestroy(v67, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v67, -1LL, -1LL);
    uint64_t v19 = v11;
    uint64_t v1 = v0 + 16;
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  else
  {
    swift_release_n(*(void *)(v0 + 72), 2LL);
    swift_bridgeObjectRelease_n(v10, 2LL);
  }

  uint64_t v20 = *(void *)(v0 + 136);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v22 = *(void *)(v0 + 88);
  uint64_t v23 = OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffState;
  *(void *)(v0 + 232) = OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffState;
  uint64_t v24 = v22 + v23;
  __n128 v25 = swift_beginAccess(v22 + v23, v1, 0LL, 0LL);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, __n128))(v21 + 48);
  *(void *)(v0 + 240) = v26;
  if (v26(v24, 1LL, v20, v25))
  {
    uint64_t v27 = *(void *)(v0 + 184);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56LL))( v27,  1LL,  1LL,  *(void *)(v0 + 192));
    sub_10000BFC8(v27, &qword_1000CF8C8);
    uint64_t v28 = *(void **)(v0 + 88);
    uint64_t v29 = *(void *)(v0 + 72);
    (*(void (**)(void, void, void))(*(void *)(v0 + 120) + 16LL))( *(void *)(v0 + 128),  *(void *)(v0 + 224),  *(void *)(v0 + 112));
    id v30 = v28;
    swift_retain(v29);
    char v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      os_log_type_t v68 = v32;
      uint64_t v69 = v2;
      uint64_t v63 = *(void *)(v0 + 136);
      uint64_t v64 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
      uint64_t v33 = *(void *)(v0 + 96);
      uint64_t v34 = *(void *)(v0 + 104);
      uint64_t v35 = *(void *)(v0 + 72);
      uint64_t v62 = *(void *)(v0 + 88) + *(void *)(v0 + 232);
      uint64_t v36 = swift_slowAlloc(22LL, -1LL);
      uint64_t type = swift_slowAlloc(64LL, -1LL);
      uint64_t v70 = type;
      *(_DWORD *)uint64_t v36 = 136315394;
      uint64_t v38 = *(void *)(v35 + 16);
      unint64_t v37 = *(void *)(v35 + 24);
      swift_bridgeObjectRetain(v37);
      *(void *)(v0 + 40) = sub_10009BE3C(v38, v37, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v36 + 4, v36 + 12);
      swift_bridgeObjectRelease(v37);
      swift_release(v35);
      *(_WORD *)(v36 + 12) = 2080;
      sub_100098800(v62, v34);
      sub_100098800(v34, v33);
      if (v64(v33, 1LL, v63) == 1)
      {
        sub_10000BFC8(*(void *)(v0 + 96), &qword_1000CDE48);
        unint64_t v39 = 0xE300000000000000LL;
        uint64_t v40 = 7104878LL;
      }

      else
      {
        uint64_t v46 = *(void *)(v0 + 152);
        uint64_t v47 = *(void *)(v0 + 160);
        uint64_t v48 = *(void *)(v0 + 136);
        sub_10004EA7C(*(void *)(v0 + 96), v47, type metadata accessor for HandoffState);
        sub_100098848(v47, v46);
        uint64_t v40 = String.init<A>(reflecting:)(v46, v48);
        unint64_t v39 = v49;
        sub_10000BF5C(v47, type metadata accessor for HandoffState);
      }

      uint64_t v50 = *(void *)(v0 + 120);
      uint64_t v51 = *(void *)(v0 + 128);
      uint64_t v52 = *(void *)(v0 + 112);
      uint64_t v53 = *(void **)(v0 + 88);
      sub_10000BFC8(*(void *)(v0 + 104), &qword_1000CDE48);
      *(void *)(v0 + 48) = sub_10009BE3C(v40, v39, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v69, v36 + 14, v36 + 22);
      swift_bridgeObjectRelease(v39);

      _os_log_impl( (void *)&_mh_execute_header,  v31,  v68,  "Ignoring SharePlay policy updates because senderID (%s) does not match current session state: %s",  (uint8_t *)v36,  0x16u);
      swift_arrayDestroy(type, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(type, -1LL, -1LL);
      swift_slowDealloc(v36, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
    }

    else
    {
      uint64_t v43 = *(void *)(v0 + 120);
      uint64_t v42 = *(void *)(v0 + 128);
      uint64_t v44 = *(void *)(v0 + 112);
      unint64_t v45 = *(void **)(v0 + 88);
      swift_release(*(void *)(v0 + 72));

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    }

    uint64_t v54 = *(void *)(v0 + 176);
    uint64_t v55 = *(void *)(v0 + 184);
    uint64_t v57 = *(void *)(v0 + 160);
    uint64_t v56 = *(void *)(v0 + 168);
    uint64_t v58 = *(void *)(v0 + 152);
    uint64_t v59 = *(void *)(v0 + 128);
    uint64_t v61 = *(void *)(v0 + 96);
    uint64_t v60 = *(void *)(v0 + 104);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v55);
    swift_task_dealloc(v54);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    sub_100098848(v24, *(void *)(v0 + 176));
    return swift_task_switch(sub_100097EC8, 0LL, 0LL);
  }

uint64_t sub_100097EC8()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[17];
  sub_100098848(v0[22], v1);
  if (swift_getEnumCaseMultiPayload(v1, v2) == 1)
  {
    sub_10004EA7C(v0[21], v0[23], type metadata accessor for HandoffInfo);
    uint64_t v3 = v0[27];
    sub_10000BF5C(v0[22], type metadata accessor for HandoffState);
    return swift_task_switch(sub_100098438, v3, 0LL);
  }

  else
  {
    uint64_t v5 = *(void *)v0[21];
    v0[31] = v5;
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to Task.value.getter[1]);
    v0[32] = v6;
    uint64_t v7 = sub_10000360C(&qword_1000CF8D0);
    void *v6 = v0;
    v6[1] = sub_100097FAC;
    return Task.value.getter(v0[23], v5, v0[24], v7, &protocol self-conformance witness table for Error);
  }

uint64_t sub_100097FAC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 256LL);
  *(void *)(*(void *)v1 + 264LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100098060;
  }
  else {
    uint64_t v3 = sub_100098010;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100098010()
{
  uint64_t v1 = v0[27];
  sub_10000BF5C(v0[22], type metadata accessor for HandoffState);
  return swift_task_switch(sub_100098438, v1, 0LL);
}

uint64_t sub_100098060()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[22];
  swift_release(v0[31]);
  swift_errorRelease(v1);
  sub_10000BF5C(v3, type metadata accessor for HandoffState);
  return swift_task_switch(sub_1000980C8, v2, 0LL);
}

uint64_t sub_1000980C8()
{
  uint64_t v1 = *(void *)(v0 + 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56LL))( v1,  1LL,  1LL,  *(void *)(v0 + 192));
  sub_10000BFC8(v1, &qword_1000CF8C8);
  uint64_t v2 = *(void **)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  (*(void (**)(void, void, void))(*(void *)(v0 + 120) + 16LL))( *(void *)(v0 + 128),  *(void *)(v0 + 224),  *(void *)(v0 + 112));
  id v4 = v2;
  swift_retain(v3);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v39 = v6;
    uint64_t v36 = *(void *)(v0 + 136);
    unint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v35 = *(void *)(v0 + 88) + *(void *)(v0 + 232);
    uint64_t v10 = swift_slowAlloc(22LL, -1LL);
    uint64_t v40 = swift_slowAlloc(64LL, -1LL);
    uint64_t v41 = v40;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = *(void *)(v9 + 16);
    unint64_t v12 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain(v12);
    *(void *)(v0 + 40) = sub_10009BE3C(v11, v12, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v12);
    swift_release(v9);
    *(_WORD *)(v10 + 12) = 2080;
    sub_100098800(v35, v8);
    sub_100098800(v8, v7);
    if (v37(v7, 1LL, v36) == 1)
    {
      sub_10000BFC8(*(void *)(v0 + 96), &qword_1000CDE48);
      unint64_t v13 = 0xE300000000000000LL;
      uint64_t v14 = 7104878LL;
    }

    else
    {
      uint64_t v20 = *(void *)(v0 + 152);
      uint64_t v19 = *(void *)(v0 + 160);
      uint64_t v21 = *(void *)(v0 + 136);
      sub_10004EA7C(*(void *)(v0 + 96), v19, type metadata accessor for HandoffState);
      sub_100098848(v19, v20);
      uint64_t v14 = String.init<A>(reflecting:)(v20, v21);
      unint64_t v13 = v22;
      sub_10000BF5C(v19, type metadata accessor for HandoffState);
    }

    uint64_t v23 = *(void *)(v0 + 120);
    uint64_t v38 = *(void *)(v0 + 128);
    uint64_t v24 = *(void *)(v0 + 112);
    __n128 v25 = *(void **)(v0 + 88);
    sub_10000BFC8(*(void *)(v0 + 104), &qword_1000CDE48);
    *(void *)(v0 + 48) = sub_10009BE3C(v14, v13, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease(v13);

    _os_log_impl( (void *)&_mh_execute_header,  v5,  v39,  "Ignoring SharePlay policy updates because senderID (%s) does not match current session state: %s",  (uint8_t *)v10,  0x16u);
    swift_arrayDestroy(v40, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v38, v24);
  }

  else
  {
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v17 = *(void *)(v0 + 112);
    unint64_t v18 = *(void **)(v0 + 88);
    swift_release(*(void *)(v0 + 72));

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }

  uint64_t v26 = *(void *)(v0 + 176);
  uint64_t v27 = *(void *)(v0 + 184);
  uint64_t v29 = *(void *)(v0 + 160);
  uint64_t v28 = *(void *)(v0 + 168);
  uint64_t v30 = *(void *)(v0 + 152);
  uint64_t v31 = *(void *)(v0 + 128);
  uint64_t v33 = *(void *)(v0 + 96);
  uint64_t v32 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v27);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100098438()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t, void, uint64_t, void))(*(void *)(v0 + 200) + 56LL))( v2,  0LL,  1LL,  *(void *)(v0 + 192));
  sub_10004EA7C(v2, v1, type metadata accessor for HandoffInfo);
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(void *)(v1 + 8);
  uint64_t v7 = *(void *)(v1 + 16);
  BOOL v8 = v4 == v6 && v5 == v7;
  if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v6, v7, 0LL) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v0 + 208);
    sub_100097034(*(void *)(v0 + 80));
    sub_10000BF5C(v9, type metadata accessor for HandoffInfo);
  }

  else
  {
    sub_10000BF5C(*(void *)(v0 + 208), type metadata accessor for HandoffInfo);
    uint64_t v10 = *(void **)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 72);
    (*(void (**)(void, void, void))(*(void *)(v0 + 120) + 16LL))( *(void *)(v0 + 128),  *(void *)(v0 + 224),  *(void *)(v0 + 112));
    id v12 = v10;
    swift_retain(v11);
    unint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v48 = v14;
      uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
      uint64_t v15 = *(void *)(v0 + 96);
      uint64_t v16 = *(void *)(v0 + 104);
      uint64_t v17 = *(void *)(v0 + 72);
      uint64_t v44 = *(void *)(v0 + 88) + *(void *)(v0 + 232);
      uint64_t v45 = *(void *)(v0 + 136);
      uint64_t v18 = swift_slowAlloc(22LL, -1LL);
      uint64_t v47 = swift_slowAlloc(64LL, -1LL);
      uint64_t v49 = v47;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v19 = *(void *)(v17 + 16);
      unint64_t v20 = *(void *)(v17 + 24);
      swift_bridgeObjectRetain(v20);
      *(void *)(v0 + 40) = sub_10009BE3C(v19, v20, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease(v20);
      swift_release(v17);
      *(_WORD *)(v18 + 12) = 2080;
      sub_100098800(v44, v16);
      sub_100098800(v16, v15);
      if (v46(v15, 1LL, v45) == 1)
      {
        sub_10000BFC8(*(void *)(v0 + 96), &qword_1000CDE48);
        unint64_t v21 = 0xE300000000000000LL;
        uint64_t v22 = 7104878LL;
      }

      else
      {
        uint64_t v28 = *(void *)(v0 + 152);
        uint64_t v27 = *(void *)(v0 + 160);
        uint64_t v29 = *(void *)(v0 + 136);
        sub_10004EA7C(*(void *)(v0 + 96), v27, type metadata accessor for HandoffState);
        sub_100098848(v27, v28);
        uint64_t v22 = String.init<A>(reflecting:)(v28, v29);
        unint64_t v21 = v30;
        sub_10000BF5C(v27, type metadata accessor for HandoffState);
      }

      uint64_t v31 = *(void *)(v0 + 120);
      uint64_t v32 = *(void *)(v0 + 128);
      uint64_t v33 = *(void *)(v0 + 112);
      uint64_t v34 = *(void **)(v0 + 88);
      sub_10000BFC8(*(void *)(v0 + 104), &qword_1000CDE48);
      *(void *)(v0 + 48) = sub_10009BE3C(v22, v21, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v18 + 14, v18 + 22);
      swift_bridgeObjectRelease(v21);

      _os_log_impl( (void *)&_mh_execute_header,  v13,  v48,  "Ignoring SharePlay policy updates because senderID (%s) does not match current session state: %s",  (uint8_t *)v18,  0x16u);
      swift_arrayDestroy(v47, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v18, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
    }

    else
    {
      uint64_t v24 = *(void *)(v0 + 120);
      uint64_t v23 = *(void *)(v0 + 128);
      uint64_t v25 = *(void *)(v0 + 112);
      uint64_t v26 = *(void **)(v0 + 88);
      swift_release(*(void *)(v0 + 72));

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    }
  }

  uint64_t v35 = *(void *)(v0 + 176);
  uint64_t v36 = *(void *)(v0 + 184);
  uint64_t v38 = *(void *)(v0 + 160);
  uint64_t v37 = *(void *)(v0 + 168);
  uint64_t v39 = *(void *)(v0 + 152);
  uint64_t v40 = *(void *)(v0 + 128);
  uint64_t v42 = *(void *)(v0 + 96);
  uint64_t v41 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v36);
  swift_task_dealloc(v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100098800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000360C(&qword_1000CDE48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100098848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HandoffState(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10009888C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v23 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      break;
    }
    if (v19 >= v23) {
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v4 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v23) {
        goto LABEL_24;
      }
      unint64_t v20 = *(void *)(v4 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v23) {
          goto LABEL_24;
        }
        unint64_t v20 = *(void *)(v4 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v23) {
            goto LABEL_24;
          }
          unint64_t v20 = *(void *)(v4 + 8 * v9);
          if (!v20)
          {
            int64_t v21 = v19 + 4;
            if (v21 >= v23)
            {
LABEL_24:
              uint64_t v22 = 0LL;
              goto LABEL_25;
            }

            unint64_t v20 = *(void *)(v4 + 8 * v21);
            if (!v20)
            {
              while (1)
              {
                int64_t v9 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_27;
                }
                if (v9 >= v23) {
                  goto LABEL_24;
                }
                unint64_t v20 = *(void *)(v4 + 8 * v9);
                ++v21;
                if (v20) {
                  goto LABEL_22;
                }
              }
            }

            int64_t v9 = v21;
          }
        }
      }
    }

uint64_t sub_100098A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(v4 + 16);
  if (v6 == a3 && *(void *)(v4 + 24) == a4) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(a3, a4, v6, *(void *)(v4 + 24), 0LL);
  }
}

uint64_t *sub_100098A98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v27 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v27);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      uint64_t v7 = a2[2];
      a1[1] = a2[1];
      a1[2] = v7;
      BOOL v8 = (int *)type metadata accessor for HandoffInfo(0LL);
      uint64_t v9 = v8[6];
      unint64_t v10 = (char *)a1 + v9;
      unint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = type metadata accessor for UUID(0LL);
      unint64_t v13 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v12 - 8) + 16LL);
      __n128 v14 = swift_bridgeObjectRetain(v7);
      v13(v10, v11, v12, v14);
      ((void (*)(char *, char *, uint64_t))v13)((char *)a1 + v8[7], (char *)a2 + v8[7], v12);
      uint64_t v15 = v8[8];
      uint64_t v16 = *(uint64_t *)((char *)a2 + v15);
      *(uint64_t *)((char *)a1 + v15) = v16;
      uint64_t v17 = v8[9];
      uint64_t v18 = *(void **)((char *)a2 + v17);
      *(uint64_t *)((char *)a1 + v17) = (uint64_t)v18;
      uint64_t v19 = v8[10];
      unint64_t v20 = (char *)a1 + v19;
      int64_t v21 = (char *)a2 + v19;
      uint64_t v22 = type metadata accessor for Date(0LL);
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      swift_retain(v16);
      id v25 = v18;
      if (v24(v21, 1LL, v22))
      {
        uint64_t v26 = sub_10000360C(&qword_1000CE5B0);
        memcpy(v20, v21, *(void *)(*(void *)(v26 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0LL, 1LL, v22);
      }

      uint64_t v29 = a1;
      uint64_t v30 = a3;
      uint64_t v31 = 1LL;
    }

    else
    {
      uint64_t v28 = *a2;
      *a1 = *a2;
      swift_retain(v28);
      uint64_t v29 = a1;
      uint64_t v30 = a3;
      uint64_t v31 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v29, v30, v31);
  }

  return a1;
}

uint64_t type metadata accessor for HandoffInfo(uint64_t a1)
{
  return sub_100005920(a1, (uint64_t *)&unk_1000D09D8, (uint64_t)&nominal type descriptor for HandoffInfo);
}

uint64_t sub_100098C70(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)type metadata accessor for HandoffInfo(0LL);
  uint64_t v4 = &a1[v3[6]];
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL);
  v6(v4, v5);
  v6(&a1[v3[7]], v5);
  swift_release(*(void *)&a1[v3[8]]);

  uint64_t v7 = &a1[v3[10]];
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  return result;
}

uint64_t sub_100098D74(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    uint64_t v7 = (int *)type metadata accessor for HandoffInfo(0LL);
    uint64_t v8 = v7[6];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for UUID(0LL);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v11 - 8) + 16LL);
    __n128 v13 = swift_bridgeObjectRetain(v6);
    v12(v9, v10, v11, v13);
    ((void (*)(uint64_t, char *, uint64_t))v12)(a1 + v7[7], (char *)a2 + v7[7], v11);
    uint64_t v14 = v7[8];
    uint64_t v15 = *(uint64_t *)((char *)a2 + v14);
    *(void *)(a1 + v14) = v15;
    uint64_t v16 = v7[9];
    uint64_t v17 = *(void **)((char *)a2 + v16);
    *(void *)(a1 + v16) = v17;
    uint64_t v18 = v7[10];
    uint64_t v19 = (void *)(a1 + v18);
    unint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = type metadata accessor for Date(0LL);
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
    swift_retain(v15);
    id v24 = v17;
    if (v23(v20, 1LL, v21))
    {
      uint64_t v25 = sub_10000360C(&qword_1000CE5B0);
      memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64LL));
      uint64_t v26 = 1LL;
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      uint64_t v26 = 1LL;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 1LL, v21);
    }
  }

  else
  {
    uint64_t v27 = *a2;
    *(void *)a1 = *a2;
    swift_retain(v27);
    uint64_t v26 = 0LL;
  }

  swift_storeEnumTagMultiPayload(a1, a3, v26);
  return a1;
}

uint64_t sub_100098F0C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  if ((uint64_t *)a1 != a2)
  {
    sub_10000BF5C(a1, type metadata accessor for HandoffState);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(void *)(a1 + 8) = a2[1];
      uint64_t v6 = a2[2];
      *(void *)(a1 + 16) = v6;
      uint64_t v7 = (int *)type metadata accessor for HandoffInfo(0LL);
      uint64_t v8 = v7[6];
      uint64_t v9 = a1 + v8;
      uint64_t v10 = (uint64_t)a2 + v8;
      uint64_t v11 = type metadata accessor for UUID(0LL);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v11 - 8) + 16LL);
      __n128 v13 = swift_bridgeObjectRetain(v6);
      v12(v9, v10, v11, v13);
      ((void (*)(uint64_t, char *, uint64_t))v12)(a1 + v7[7], (char *)a2 + v7[7], v11);
      uint64_t v14 = v7[8];
      uint64_t v15 = *(uint64_t *)((char *)a2 + v14);
      *(void *)(a1 + v14) = v15;
      uint64_t v16 = v7[9];
      uint64_t v17 = *(void **)((char *)a2 + v16);
      *(void *)(a1 + v16) = v17;
      uint64_t v18 = v7[10];
      uint64_t v19 = (void *)(a1 + v18);
      unint64_t v20 = (char *)a2 + v18;
      uint64_t v21 = type metadata accessor for Date(0LL);
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
      swift_retain(v15);
      id v24 = v17;
      if (v23(v20, 1LL, v21))
      {
        uint64_t v25 = sub_10000360C(&qword_1000CE5B0);
        memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64LL));
        uint64_t v26 = 1LL;
      }

      else
      {
        (*(void (**)(void *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
        uint64_t v26 = 1LL;
        (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 1LL, v21);
      }
    }

    else
    {
      uint64_t v27 = *a2;
      *(void *)a1 = *a2;
      swift_retain(v27);
      uint64_t v26 = 0LL;
    }

    swift_storeEnumTagMultiPayload(a1, a3, v26);
  }

  return a1;
}

uint64_t type metadata accessor for HandoffState(uint64_t a1)
{
  return sub_100005920(a1, qword_1000D0948, (uint64_t)&nominal type descriptor for HandoffState);
}

char *sub_1000990D8(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    uint64_t v6 = (int *)type metadata accessor for HandoffInfo(0LL);
    uint64_t v7 = v6[6];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = type metadata accessor for UUID(0LL);
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL);
    v11(v8, v9, v10);
    v11(&a1[v6[7]], &a2[v6[7]], v10);
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
    uint64_t v12 = v6[10];
    __n128 v13 = &a1[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = type metadata accessor for Date(0LL);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1LL, v15))
    {
      uint64_t v17 = sub_10000360C(&qword_1000CE5B0);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
    }

    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

char *sub_100099250(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000BF5C((uint64_t)a1, type metadata accessor for HandoffState);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *a1 = *a2;
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      uint64_t v6 = (int *)type metadata accessor for HandoffInfo(0LL);
      uint64_t v7 = v6[6];
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = type metadata accessor for UUID(0LL);
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL);
      v11(v8, v9, v10);
      v11(&a1[v6[7]], &a2[v6[7]], v10);
      *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
      *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
      uint64_t v12 = v6[10];
      __n128 v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      uint64_t v15 = type metadata accessor for Date(0LL);
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1LL, v15))
      {
        uint64_t v17 = sub_10000360C(&qword_1000CE5B0);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
      }

      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_1000993E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_1000993EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_1000993FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_10009940C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for HandoffInfo(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t *sub_100099480(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v26 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v26);
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for UUID(0LL);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v11 - 8) + 16LL);
    __n128 v13 = swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11, v13);
    ((void (*)(char *, char *, uint64_t))v12)((char *)v4 + a3[7], (char *)a2 + a3[7], v11);
    uint64_t v14 = a3[8];
    uint64_t v15 = a3[9];
    uint64_t v16 = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = v16;
    uint64_t v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + v15) = (uint64_t)v17;
    uint64_t v18 = a3[10];
    uint64_t v19 = (char *)v4 + v18;
    unint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = type metadata accessor for Date(0LL);
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_retain(v16);
    id v24 = v17;
    if (v23(v20, 1LL, v21))
    {
      uint64_t v25 = sub_10000360C(&qword_1000CE5B0);
      memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 1LL, v21);
    }
  }

  return v4;
}

uint64_t sub_1000995EC(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL);
  v6(v4, v5);
  v6(a1 + a2[7], v5);
  swift_release(*(void *)(a1 + a2[8]));

  uint64_t v7 = a1 + a2[10];
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  return result;
}

uint64_t sub_1000996C4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v10 - 8) + 16LL);
  __n128 v12 = swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10, v12);
  ((void (*)(uint64_t, uint64_t, uint64_t))v11)(a1 + a3[7], a2 + a3[7], v10);
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = *(void *)(a2 + v13);
  *(void *)(a1 + v13) = v15;
  uint64_t v16 = *(void **)(a2 + v14);
  *(void *)(a1 + v14) = v16;
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
  swift_retain(v15);
  id v23 = v16;
  if (v22(v19, 1LL, v20))
  {
    uint64_t v24 = sub_10000360C(&qword_1000CE5B0);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0LL, 1LL, v20);
  }

  return a1;
}

uint64_t sub_100099804(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  __n128 v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24LL);
  v12(v9, v10, v11);
  v12(a1 + a3[7], a2 + a3[7], v11);
  uint64_t v13 = a3[8];
  uint64_t v14 = *(void *)(a2 + v13);
  uint64_t v15 = *(void *)(a1 + v13);
  *(void *)(a1 + v13) = v14;
  swift_retain(v14);
  swift_release(v15);
  uint64_t v16 = a3[9];
  uint64_t v17 = *(void **)(a2 + v16);
  uint64_t v18 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = v17;
  id v19 = v17;

  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = type metadata accessor for Date(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v10) = v25(v21, 1LL, v23);
  int v26 = v25(v22, 1LL, v23);
  if (!(_DWORD)v10)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_6;
  }

  if (v26)
  {
LABEL_6:
    uint64_t v27 = sub_10000360C(&qword_1000CE5B0);
    memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0LL, 1LL, v23);
  return a1;
}

uint64_t sub_1000999AC(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL);
  v10(v7, v8, v9);
  v10(a1 + a3[7], a2 + a3[7], v9);
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1LL, v15))
  {
    uint64_t v17 = sub_10000360C(&qword_1000CE5B0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
  }

  return a1;
}

uint64_t sub_100099AD8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL);
  v12(v9, v10, v11);
  v12(a1 + a3[7], a2 + a3[7], v11);
  uint64_t v13 = a3[8];
  uint64_t v14 = *(void *)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_release(v14);
  uint64_t v15 = a3[9];
  uint64_t v16 = *(void **)(a1 + v15);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);

  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  id v19 = (void *)(a2 + v17);
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v10) = v22(v18, 1LL, v20);
  int v23 = v22(v19, 1LL, v20);
  if (!(_DWORD)v10)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v18, v19, v20);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_6;
  }

  if (v23)
  {
LABEL_6:
    uint64_t v24 = sub_10000360C(&qword_1000CE5B0);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0LL, 1LL, v20);
  return a1;
}

uint64_t sub_100099C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100099C70);
}

uint64_t sub_100099C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for UUID(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 24);
    }

    else
    {
      uint64_t v10 = sub_10000360C(&qword_1000CE5B0);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a3 + 40);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }

uint64_t sub_100099D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100099D20);
}

uint64_t sub_100099D20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for UUID(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 24);
    }

    else
    {
      uint64_t v10 = sub_10000360C(&qword_1000CE5B0);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 40);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }

  return result;
}

void sub_100099DC0(uint64_t a1)
{
  v6[0] = &unk_1000AAFB8;
  v6[1] = &unk_1000AAFD0;
  uint64_t v2 = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v7 = *(void *)(v2 - 8) + 64LL;
    uint64_t v8 = v7;
    uint64_t v9 = (char *)&value witness table for Builtin.NativeObject + 64;
    uint64_t v10 = (char *)&value witness table for Builtin.UnknownObject + 64;
    sub_100099E74(319LL);
    if (v5 <= 0x3F)
    {
      uint64_t v11 = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 7LL, v6, a1 + 16);
    }
  }

void sub_100099E74(uint64_t a1)
{
  if (!qword_1000D09E8)
  {
    uint64_t v2 = type metadata accessor for Date(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000D09E8);
    }
  }

uint64_t sub_100099EC8()
{
  v1[3] = v0;
  uint64_t v2 = sub_10000360C((uint64_t *)&unk_1000CF840);
  v1[4] = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for HandoffInfo(0LL);
  v1[5] = v3;
  v1[6] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for HandoffState(0LL);
  v1[7] = v4;
  v1[8] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100099F6C, 0LL, 0LL);
}

uint64_t sub_100099F6C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_100098848(*(void *)(v0 + 24), v2);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v2, v1);
  uint64_t v4 = *(void **)(v0 + 64);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 32);
    sub_10000BEA4((uint64_t)v4, v5);
    uint64_t v8 = *(void *)(v5 + 8);
    uint64_t v7 = *(void *)(v5 + 16);
    *(void *)(v0 + 72) = v7;
    uint64_t v9 = type metadata accessor for TaskPriority(0LL);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL);
    swift_bridgeObjectRetain(v7);
    v10(v6, 1LL, 1LL, v9);
    uint64_t v11 = qword_1000CD638;
    swift_bridgeObjectRetain(v7);
    if (v11 != -1) {
      swift_once(&qword_1000CD638, sub_10001FF5C);
    }
    uint64_t v12 = *(void *)(v0 + 32);
    uint64_t v13 = qword_1000D35C8;
    uint64_t v14 = sub_10000465C( &qword_1000CEC58,  (uint64_t (*)(uint64_t))type metadata accessor for ConduitDeviceActor,  (uint64_t)&unk_1000AA028);
    uint64_t v15 = (void *)swift_allocObject(&unk_1000C6220, 48LL, 7LL);
    v15[2] = v13;
    v15[3] = v14;
    v15[4] = v8;
    v15[5] = v7;
    swift_retain(v13);
    uint64_t v16 = sub_10004ED88(v12, (uint64_t)&unk_1000D0A40, (uint64_t)v15);
    *(void *)(v0 + 80) = v16;
    uint64_t v17 = (void *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    *(void *)(v0 + 88) = v17;
    uint64_t v18 = sub_10000360C(&qword_1000CFF18);
    void *v17 = v0;
    v17[1] = sub_10009A14C;
    return Task<>.value.getter(v0 + 16, v16, v18);
  }

  else
  {
    swift_release(*v4);
    uint64_t v20 = *(void *)(v0 + 48);
    uint64_t v21 = *(void *)(v0 + 32);
    swift_task_dealloc(*(void *)(v0 + 64));
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

uint64_t sub_10009A14C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 88LL));
  swift_release(v1);
  return swift_task_switch(sub_10009A1A8, 0LL, 0LL);
}

uint64_t sub_10009A1A8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 48);
  if (v1)
  {
    uint64_t v3 = *(void **)(v2 + *(int *)(*(void *)(v0 + 40) + 36LL));
    id v4 = objc_allocWithZone(&OBJC_CLASS___TUSplitSessionInfo);
    id v5 = v3;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v7 = [v4 initWithConversationID:isa device:v1 handoffContext:v5];

    sub_10000BF5C(v2, type metadata accessor for HandoffInfo);
  }

  else
  {
    sub_10000BF5C(*(void *)(v0 + 48), type metadata accessor for HandoffInfo);
    id v7 = 0LL;
  }

  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v9 = *(void *)(v0 + 32);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_10009A2A0(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x616E7567616C2ELL;
  }
  else {
    return 0x65736E617078652ELL;
  }
}

uint64_t sub_10009A2D8()
{
  return sub_10009A2A0(*v0);
}

uint64_t sub_10009A2E0()
{
  v1._object = (void *)0x80000001000A6560LL;
  v1._countAndFlagsBits = 0xD000000000000012LL;
  String.append(_:)(v1);
  if (*(_BYTE *)v0) {
    uint64_t v2 = 0x616E7567616C2ELL;
  }
  else {
    uint64_t v2 = 0x65736E617078652ELL;
  }
  if (*(_BYTE *)v0) {
    unint64_t v3 = 0xE700000000000000LL;
  }
  else {
    unint64_t v3 = 0xE800000000000000LL;
  }
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease(v3);
  v5._object = (void *)0x80000001000A6580LL;
  v5._countAndFlagsBits = 0xD000000000000012LL;
  String.append(_:)(v5);
  type metadata accessor for HandoffInfo(0LL);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = sub_10000465C( &qword_1000CE780,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v6, v7);
  object = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(object);
  v10._countAndFlagsBits = 0xD000000000000015LL;
  v10._object = (void *)0x80000001000A65A0LL;
  String.append(_:)(v10);
  uint64_t v12 = *(void *)(v0 + 8);
  uint64_t v11 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain(v11);
  v13._countAndFlagsBits = v12;
  v13._object = v11;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  v14._countAndFlagsBits = 62LL;
  v14._object = (void *)0xE100000000000000LL;
  String.append(_:)(v14);
  return 0LL;
}

unint64_t sub_10009A46C()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000014LL;
  uint64_t v3 = type metadata accessor for HandoffInfo(0LL);
  __chkstk_darwin(v3);
  Swift::String v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for HandoffState(0LL);
  __chkstk_darwin(v6);
  Swift::String v8 = (unint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_100098848(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload(v8, v6) == 1)
  {
    sub_10000BEA4((uint64_t)v8, (uint64_t)v5);
    unint64_t v13 = 0LL;
    unint64_t v14 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(23LL);
    swift_bridgeObjectRelease(v14);
    unint64_t v13 = 0xD000000000000014LL;
    unint64_t v14 = 0x80000001000A6520LL;
    v9._countAndFlagsBits = sub_10009A2E0();
    object = v9._object;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(object);
    v11._countAndFlagsBits = 41LL;
    v11._object = (void *)0xE100000000000000LL;
    String.append(_:)(v11);
    unint64_t v2 = v13;
    sub_10000BF5C((uint64_t)v5, type metadata accessor for HandoffInfo);
  }

  else
  {
    swift_release(*v8);
  }

  return v2;
}

uint64_t sub_10009A5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  if (qword_1000CD638 != -1) {
    swift_once(&qword_1000CD638, sub_10001FF5C);
  }
  return swift_task_switch(sub_10009A63C, qword_1000D35C8, 0LL);
}

uint64_t sub_10009A63C()
{
  if (qword_1000CD640 != -1) {
    swift_once(&qword_1000CD640, sub_1000202C4);
  }
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = qword_1000D35D0;
  swift_beginAccess(qword_1000D35D0 + 48, v0 + 16, 0LL, 0LL);
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = swift_task_alloc(48LL);
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v1;
  *(_BYTE *)(v5 + 32) = 0;
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = sub_10003A664(sub_1000365F8, v5, v4);
  swift_bridgeObjectRelease(v4);
  swift_task_dealloc(v5);
  if (v6)
  {
    uint64_t v7 = sub_10000CE6C();
    swift_release(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  **(void **)(v0 + 40) = v7;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10009A730()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10009A75C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  Swift::String v8 = (void *)swift_task_alloc(dword_1000D0A3C);
  *(void *)(v2 + 16) = v8;
  *Swift::String v8 = v2;
  v8[1] = sub_10000C2B8;
  return sub_10009A5D4(a1, v4, v5, v7, v6);
}

uint64_t storeEnumTagSinglePayload for HandoffType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10009A820 + 4 * byte_1000AAF85[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10009A854 + 4 * byte_1000AAF80[v4]))();
}

uint64_t sub_10009A854(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009A85C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10009A864LL);
  }
  return result;
}

uint64_t sub_10009A870(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10009A878LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10009A87C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009A884(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HandoffType()
{
  return &type metadata for HandoffType;
}

unint64_t sub_10009A8A4()
{
  unint64_t result = qword_1000D0A48;
  if (!qword_1000D0A48)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000AB0AC, &type metadata for HandoffType);
    atomic_store(result, (unint64_t *)&qword_1000D0A48);
  }

  return result;
}

void destroy for CaptureDeviceManager(uint64_t a1)
{
}

uint64_t *_s44com_apple_NeighborhoodActivityConduitService20CaptureDeviceManagerVwCP_0( uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = (uint64_t)v4;
  uint64_t v5 = (void *)a2[2];
  a1[2] = (uint64_t)v5;
  swift_retain(v3);
  id v6 = v4;
  id v7 = v5;
  return a1;
}

uint64_t *assignWithCopy for CaptureDeviceManager(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  id v6 = (void *)a1[1];
  id v7 = (void *)a2[1];
  a1[1] = (uint64_t)v7;
  id v8 = v7;

  Swift::String v9 = (void *)a2[2];
  Swift::String v10 = (void *)a1[2];
  a1[2] = (uint64_t)v9;
  id v11 = v9;

  return a1;
}

void *assignWithTake for CaptureDeviceManager(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = (void *)a1[2];
  a1[2] = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for CaptureDeviceManager(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureDeviceManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CaptureDeviceManager()
{
  return &type metadata for CaptureDeviceManager;
}

uint64_t sub_10009AAB0()
{
  uint64_t result = sub_10009AED4();
  qword_1000D36E8 = result;
  unk_1000D36F0 = v1;
  qword_1000D36F8 = v2;
  return result;
}

void sub_10009AAD4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 devices];
  unint64_t v4 = sub_10009B0E0();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  *a2 = v5;
}

void sub_10009AB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a3 += 16LL;
  swift_beginAccess(a3, v34, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a3);
  if (!Strong) {
    return;
  }
  uint64_t v10 = Strong;
  uint64_t v11 = sub_10000360C(&qword_1000D0A58);
  NSKeyValueObservedChange.newValue.getter(&v33, v11);
  uint64_t v12 = v33;
  if (!v33)
  {
    swift_release(v10);
    return;
  }

  if (qword_1000CD690 != -1) {
    swift_once(&qword_1000CD690, sub_100088E24);
  }
  uint64_t v13 = sub_10000ADF4(v5, (uint64_t)qword_1000D3620);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
  uint64_t v14 = swift_bridgeObjectRetain_n(v12, 2LL);
  uint64_t v15 = (void *)Logger.logObject.getter(v14);
  LOBYTE(v16) = static os_log_type_t.default.getter();
  unint64_t v17 = (unint64_t)v12 >> 62;
  if (!os_log_type_enabled((os_log_t)v15, (os_log_type_t)v16))
  {

    swift_bridgeObjectRelease_n(v12, 2LL);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_20;
  }

  id v3 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v30 = swift_slowAlloc(32LL, -1LL);
  uint64_t v33 = v30;
  *(_DWORD *)id v3 = 136315138;
  unint64_t v31 = (unint64_t)v12 >> 62;
  if (v17)
  {
    if (v12 >= 0) {
      uint64_t v25 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v25 = v12;
    }
    swift_bridgeObjectRetain(v12);
    if (_CocoaArrayWrapper.endIndex.getter(v25)) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease(v12);
    unint64_t v24 = 0xE300000000000000LL;
    uint64_t v22 = 7104878LL;
    goto LABEL_19;
  }

  uint64_t v18 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(v12);
  if (!v18) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v12 & 0xC000000000000001LL) != 0) {
    goto LABEL_35;
  }
  if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8LL) + 0x10))
  {
    __break(1u);
    return;
  }

  for (id i = *(id *)(v12 + 32); ; id i = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v12))
  {
    uint64_t v20 = (uint64_t)i;
    swift_bridgeObjectRelease(v12);
    uint64_t v32 = v20;
    unint64_t v21 = sub_10009B0E0();
    uint64_t v22 = String.init<A>(reflecting:)(&v32, v21);
    unint64_t v24 = v23;
LABEL_19:
    uint64_t v32 = sub_10009BE3C(v22, v24, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v3 + 4, v3 + 12);
    swift_bridgeObjectRelease_n(v12, 2LL);
    swift_bridgeObjectRelease(v24);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, (os_log_type_t)v16, "Updated capture device: %s", v3, 0xCu);
    uint64_t v16 = v30;
    swift_arrayDestroy(v30, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v3, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    unint64_t v17 = v31;
LABEL_20:
    uint64_t v5 = v12 & 0xFFFFFFFFFFFFFF8LL;
    if (v17) {
      break;
    }
    uint64_t v15 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    if (!v15) {
      goto LABEL_30;
    }
LABEL_22:
    if ((v12 & 0xC000000000000001LL) != 0)
    {
      id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v12);
      goto LABEL_25;
    }

    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8LL) + 0x10))
    {
      id v26 = *(id *)(v12 + 32);
LABEL_25:
      uint64_t v27 = v26;
      swift_bridgeObjectRelease(v12);
      goto LABEL_31;
    }

    __break(1u);
LABEL_35:
    ;
  }

  if (v12 >= 0) {
    uint64_t v28 = v12 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v28 = v12;
  }
  swift_bridgeObjectRetain(v12);
  uint64_t v15 = (void *)_CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v12);
  if (v15) {
    goto LABEL_22;
  }
LABEL_30:
  swift_bridgeObjectRelease(v12);
  uint64_t v27 = 0LL;
LABEL_31:
  uint64_t v33 = (uint64_t)v27;
  CurrentValueSubject.send(_:)(&v33);
  swift_release(v10);
}

uint64_t sub_10009AED4()
{
  id v15 = 0LL;
  uint64_t v0 = sub_10000360C(&qword_1000CF220);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t v1 = CurrentValueSubject.init(_:)(&v15);
  uint64_t v2 = sub_10000360C(&qword_1000D0A50);
  uint64_t v3 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_1000A9840;
  *(void *)(v3 + 32) = AVCaptureDeviceTypeContinuityCamera;
  *(void *)(v3 + 40) = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  type metadata accessor for DeviceType(0LL);
  swift_retain(v1);
  unint64_t v4 = AVCaptureDeviceTypeContinuityCamera;
  uint64_t v5 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  uint64_t v6 = AVMediaTypeVideo;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  id v8 =  [(id)objc_opt_self(AVCaptureDeviceDiscoverySession) discoverySessionWithDeviceTypes:isa mediaType:v6 position:0];

  id v15 = v8;
  uint64_t KeyPath = swift_getKeyPath(&unk_1000AB100);
  uint64_t v10 = swift_allocObject(&unk_1000C63A8, 24LL, 7LL);
  swift_weakInit(v10 + 16, v1);
  id v11 = v8;
  swift_retain(v1);
  id v12 = v11;
  _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)( KeyPath,  5LL,  sub_10009B0D8,  v10,  &protocol witness table for NSObject);
  swift_release(v1);
  swift_release(KeyPath);
  swift_release(v10);
  uint64_t v13 = v15;

  swift_release(v1);
  return v1;
}

const char *sub_10009B0A4()
{
  return "devices";
}

uint64_t sub_10009B0B4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10009B0D8(uint64_t a1, uint64_t a2)
{
}

unint64_t sub_10009B0E0()
{
  unint64_t result = qword_1000D0A60;
  if (!qword_1000D0A60)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AVCaptureDevice);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D0A60);
  }

  return result;
}

uint64_t sub_10009B11C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10003A5DC(v0, qword_1000D0A70);
  sub_10000ADF4(v0, (uint64_t)qword_1000D0A70);
  return Logger.init(subsystem:category:)( 0xD00000000000002BLL,  0x80000001000A4D60LL,  0xD000000000000016LL,  0x80000001000AB140LL);
}

id sub_10009B19C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ConversationPublishers()) init];
  qword_1000D3700 = (uint64_t)result;
  return result;
}

char *sub_10009B1C8()
{
  ObjectType = (objc_class *)swift_getObjectType(v0);
  uint64_t v2 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationJoinedSubject;
  uint64_t v7 = sub_10000360C(&qword_1000D0AF0);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  id v8 = v0;
  *(void *)&v0[v6] = PassthroughSubject.init()(v8);
  uint64_t v9 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationLeftSubject;
  uint64_t v10 = swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  *(void *)&v8[v9] = PassthroughSubject.init()(v10);
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000LL) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    sub_10009CFAC((uint64_t)_swiftEmptyArrayStorage);
  }

  else
  {
    id v11 = &_swiftEmptySetSingleton;
  }

  uint64_t v12 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_activeConversationsSubject;
  uint64_t v29 = v11;
  uint64_t v13 = sub_10000360C(&qword_1000CFD28);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  *(void *)&v8[v12] = CurrentValueSubject.init(_:)(&v29);
  uint64_t v14 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_joinedConversationSubject;
  uint64_t v29 = 0LL;
  uint64_t v15 = sub_10000360C(&qword_1000CF910);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  *(void *)&v8[v14] = CurrentValueSubject.init(_:)(&v29);
  uint64_t v16 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager;
  id v17 = [(id)objc_opt_self(TUCallCenter) sharedInstance];
  id v18 = [v17 conversationManager];

  *(void *)&v8[v16] = v18;
  v28.receiver = v8;
  v28.super_class = ObjectType;
  id v19 = (char *)objc_msgSendSuper2(&v28, "init");
  uint64_t v20 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager;
  unint64_t v21 = *(void **)&v19[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager];
  sub_1000052E0(0LL, (unint64_t *)&qword_1000CD710, &OBJC_CLASS___OS_dispatch_queue_ptr);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for DispatchQoS.QoSClass.userInteractive(_:),  v2);
  uint64_t v22 = v19;
  id v23 = v21;
  unint64_t v24 = (void *)static OS_dispatch_queue.global(qos:)(v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  [v23 addDelegate:v22 queue:v24];

  id v25 = *(id *)&v19[v20];
  [v25 registerWithCompletionHandler:0];

  return v22;
}

uint64_t type metadata accessor for ConversationPublishers()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers);
}

void sub_10009B518(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = [a1 activeConversations];
  uint64_t v11 = sub_1000052E0(0LL, (unint64_t *)&unk_1000CE790, &OBJC_CLASS___TUConversation_ptr);
  unint64_t v12 = sub_10000BEE8();
  uint64_t v83 = v11;
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v10, v11, v12);

  sub_10001AE44(v13);
  uint64_t v15 = v14;
  if (qword_1000CD700 != -1) {
    goto LABEL_43;
  }
  while (1)
  {
    uint64_t v16 = sub_10000ADF4(v6, (uint64_t)qword_1000D0A70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(isUniquelyReferenced_nonNull_native, v16, v6);
    id v17 = v15;
    swift_bridgeObjectRetain_n(v13, 2LL);
    id v18 = v17;
    id v19 = (void *)Logger.logObject.getter(v18);
    int v85 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled((os_log_t)v19, (os_log_type_t)v85))
    {

      swift_bridgeObjectRelease_n(v13, 2LL);
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(isUniquelyReferenced_nonNull_native, v6);
LABEL_41:
      uint64_t v89 = v13;
      CurrentValueSubject.send(_:)(&v89);
      swift_bridgeObjectRelease(v13);
      uint64_t v89 = (uint64_t)v15;
      CurrentValueSubject.send(_:)(&v89);

      return;
    }

    uint64_t v81 = v6;
    id v82 = v18;
    id v84 = v15;
    uint64_t v79 = isUniquelyReferenced_nonNull_native;
    uint64_t v80 = v7;
    uint64_t v20 = (_DWORD *)swift_slowAlloc(22LL, -1LL);
    uint64_t v76 = swift_slowAlloc(64LL, -1LL);
    v95[0] = v76;
    uint64_t v77 = v20;
    _DWORD *v20 = 136315394;
    uint64_t v15 = (void *)(v13 & 0xC000000000000001LL);
    os_log_t v78 = (os_log_t)v19;
    if ((v13 & 0xC000000000000001LL) != 0)
    {
      if (v13 < 0) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = v13 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v6 = __CocoaSet.count.getter(v21);
    }

    else
    {
      uint64_t v6 = *(void *)(v13 + 16);
    }

    uint64_t v22 = _swiftEmptyArrayStorage;
    if (!v6)
    {
LABEL_37:
      uint64_t v64 = v77;
      uint64_t v65 = Array.description.getter(v22, &type metadata for String);
      unint64_t v67 = v66;
      swift_bridgeObjectRelease(v22);
      uint64_t v89 = sub_10009BE3C(v65, v67, v95);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v64 + 1, v64 + 3);
      swift_bridgeObjectRelease_n(v13, 2LL);
      swift_bridgeObjectRelease(v67);
      *((_WORD *)v64 + 6) = 2080;
      id v18 = v82;
      if (v84)
      {
        uint64_t v89 = (uint64_t)v82;
        id v68 = v82;
        uint64_t v69 = String.init<A>(reflecting:)(&v89, v83);
        unint64_t v71 = v70;
      }

      else
      {
        unint64_t v71 = 0xE300000000000000LL;
        uint64_t v69 = 7104878LL;
      }

      os_log_type_t v72 = v85;
      uint64_t v89 = sub_10009BE3C(v69, v71, v95);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, (char *)v64 + 14, (char *)v64 + 22);

      swift_bridgeObjectRelease(v71);
      os_log_t v73 = v78;
      _os_log_impl( (void *)&_mh_execute_header,  v78,  v72,  "Conversations changed with active conversations: %s, joinedConversation: %s",  (uint8_t *)v64,  0x16u);
      uint64_t v74 = v76;
      swift_arrayDestroy(v76, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_slowDealloc(v64, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v81);
      uint64_t v15 = v84;
      goto LABEL_41;
    }

    uint64_t v94 = _swiftEmptyArrayStorage;
    sub_10009C450(0, v6 & ~(v6 >> 63), 0);
    if (v15)
    {
      uint64_t v23 = v13 < 0 ? v13 : v13 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v24 = __CocoaSet.startIndex.getter(v23);
      unsigned __int8 v26 = 1;
    }

    else
    {
      uint64_t v24 = sub_10009CC90(v13);
      unsigned __int8 v26 = v27 & 1;
    }

    uint64_t v91 = v24;
    uint64_t v92 = v25;
    unsigned __int8 v93 = v26;
    if (v6 < 0) {
      break;
    }
    uint64_t v28 = v13 & 0xFFFFFFFFFFFFFF8LL;
    if (v13 < 0) {
      uint64_t v28 = v13;
    }
    unint64_t v86 = v13 & 0xC000000000000001LL;
    uint64_t v87 = v28;
    while (v6)
    {
      sub_10009C9D8(v91, v92, v93, v13, (unint64_t *)&unk_1000CE790, &OBJC_CLASS___TUConversation_ptr);
      uint64_t v41 = v40;
      uint64_t v89 = 91LL;
      v90[0] = 0xE100000000000000LL;
      id v42 = [v40 UUID];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v42);

      uint64_t v43 = sub_10000465C( &qword_1000CE780,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v43);
      object = v44._object;
      String.append(_:)(v44);
      swift_bridgeObjectRelease(object);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v46._countAndFlagsBits = 8250LL;
      v46._object = (void *)0xE200000000000000LL;
      String.append(_:)(v46);
      unint64_t v47 = (unint64_t)[v41 state];
      uint64_t v88 = v6;
      if (v47 > 4)
      {
        unint64_t v50 = 0xE900000000000029LL;
        uint64_t v49 = 0x6E776F6E6B6E5528LL;
      }

      else
      {
        uint64_t v48 = 8 * v47;
        uint64_t v49 = *(void *)&aWaitingPrepari_1[8 * v47];
        unint64_t v50 = *(void *)&aWaitingPrepari_1[v48 + 40];
      }

      unint64_t v51 = v50;
      String.append(_:)(*(Swift::String *)&v49);
      swift_bridgeObjectRelease(v50);
      v52._countAndFlagsBits = 93LL;
      v52._object = (void *)0xE100000000000000LL;
      String.append(_:)(v52);

      uint64_t v53 = v89;
      uint64_t v54 = v90[0];
      uint64_t v55 = v94;
      if ((swift_isUniquelyReferenced_nonNull_native(v94) & 1) == 0)
      {
        sub_10009C450(0, v55[2] + 1LL, 1);
        uint64_t v55 = v94;
      }

      unint64_t v57 = v55[2];
      unint64_t v56 = v55[3];
      uint64_t v7 = v57 + 1;
      if (v57 >= v56 >> 1)
      {
        sub_10009C450(v56 > 1, v57 + 1, 1);
        uint64_t v55 = v94;
      }

      v55[2] = v7;
      uint64_t v58 = &v55[2 * v57];
      v58[4] = v53;
      v58[5] = v54;
      if (v15)
      {
        if ((v93 & 1) == 0) {
          goto LABEL_45;
        }
        uint64_t v59 = __CocoaSet.Index.handleBitPattern.getter(v91, v92);
        uint64_t v60 = v88;
        if (v59) {
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v59);
        }
        else {
          uint64_t isUniquelyReferenced_nonNull_native = 1LL;
        }
        uint64_t v61 = sub_10000360C((uint64_t *)&unk_1000D0AE0);
        uint64_t v62 = (void (*)(uint64_t *, void))Set.Index._asCocoa.modify(&v89, v61);
        __CocoaSet.formIndex(after:isUnique:)(v63, isUniquelyReferenced_nonNull_native, v87);
        v62(&v89, 0LL);
        uint64_t v6 = v60 - 1;
        if (!v6)
        {
LABEL_36:
          sub_100018054(v91, v92, v93);
          uint64_t v22 = v94;
          goto LABEL_37;
        }
      }

      else
      {
        uint64_t v29 = v91;
        uint64_t v7 = v92;
        uint64_t isUniquelyReferenced_nonNull_native = v93;
        int64_t v30 = sub_10009C8CC(v91, v92, v93, v13);
        unint64_t v31 = v5;
        uint64_t v32 = v2;
        uint64_t v33 = v13;
        uint64_t v34 = v3;
        uint64_t v35 = v30;
        uint64_t v37 = v36;
        char v39 = v38;
        sub_100018054(v29, v7, isUniquelyReferenced_nonNull_native);
        uint64_t v91 = v35;
        uint64_t v92 = v37;
        uint64_t v3 = v34;
        uint64_t v13 = v33;
        uint64_t v2 = v32;
        uint64_t v5 = v31;
        uint64_t v15 = (void *)v86;
        unsigned __int8 v93 = v39 & 1;
        uint64_t v6 = v88 - 1;
        if (v88 == 1) {
          goto LABEL_36;
        }
      }
    }

    __break(1u);
LABEL_43:
    swift_once(&qword_1000CD700, sub_10009B11C);
  }

  __break(1u);
LABEL_45:
  swift_bridgeObjectRelease(v13);

  __break(1u);
}

void *sub_10009BD60(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10000360C(&qword_1000D0AD8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10009BDC4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  unint64_t v6 = a1 >> 16;
  uint64_t v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v13 = String.UTF16View.index(_:offsetBy:)(15LL, v6, a2);
    uint64_t v14 = v13 + (v7 << 16);
    unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v16 = v14 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v16 = v15;
    }
    return v16 | 4;
  }

  else
  {
    uint64_t v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15LL, v6);
    uint64_t v9 = v8 + (v7 << 16);
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v11 = v9 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v11 = v10;
    }
    return v11 | 8;
  }

uint64_t sub_10009BE3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10009BF0C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100036EA0((uint64_t)v12, *a3);
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
      sub_100036EA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000F2F0(v12);
  return v7;
}

uint64_t sub_10009BF0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

uint64_t sub_10009C0C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10009C158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10009C2CC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10009C2CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10009C158(uint64_t a1, unint64_t a2)
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
      char v5 = sub_10009BD60(v4, 0LL);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_10009C2CC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000360C(&qword_1000D0AD8);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_10009C418(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10009C46C(a1, a2, a3, *v3);
  uint8_t *v3 = (char *)result;
  return result;
}

uint64_t sub_10009C434(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10009C5D8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10009C450(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10009C760(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_10009C46C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000360C(&qword_1000D0B10);
    unint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
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
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  int v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
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
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10009C5D8(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000360C(&qword_1000D0B18);
    unint64_t v11 = (void *)swift_allocObject(v10, (v9 << 6) | 0x20, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 + 31;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 6);
  }

  else
  {
    unint64_t v11 = _swiftEmptyArrayStorage;
  }

  int v14 = v11 + 4;
  unint64_t v15 = a4 + 4;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v11 + 4, a4 + 4, v8 << 6);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    sub_10000360C((uint64_t *)&unk_1000D0B20);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10009C760(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000360C(&qword_1000CDE20);
    unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  int v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

int64_t sub_10009C8CC(int64_t result, int a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1LL << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }

  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }

  unint64_t v8 = v7 & (-2LL << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0LL;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

void sub_10009C9B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_10009C9C4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_10009C9D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, void *a6)
{
  unint64_t v10 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v14 = __CocoaSet.Index.element.getter(v10, a2);
        uint64_t v24 = v14;
        uint64_t v15 = sub_1000052E0(0LL, a5, a6);
        swift_unknownObjectRetain(v14);
        swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v15, 7LL);
        a5 = v25;
        swift_unknownObjectRelease(v14);
        Swift::Int v16 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v17 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v10 = v16 & ~v17;
        if (((*(void *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
        {
          id v18 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
          char v19 = static NSObject.== infix(_:_:)(v18, a5);

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = ~v17;
            do
            {
              unint64_t v10 = (v10 + 1) & v20;
              if (((*(void *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
                goto LABEL_24;
              }
              id v21 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
              char v22 = static NSObject.== infix(_:_:)(v21, a5);
            }

            while ((v22 & 1) == 0);
          }

LABEL_20:
          id v23 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
          return;
        }

uint64_t sub_10009CC38(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1LL << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(unsigned __int8 *)(*(void *)(a4 + 48) + result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10009CC90(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  unint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

uint64_t sub_10009CD18(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0) {
      uint64_t v6 = result;
    }
    else {
      uint64_t v6 = result & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(result);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    uint64_t result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_10000360C(&qword_1000D0AF8);
      uint64_t result = static _SetStorage.allocate(capacity:)(v3);
      unint64_t v4 = (void *)result;
      uint64_t v24 = v1;
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  unint64_t v4 = &_swiftEmptySetSingleton;
  uint64_t v24 = v1;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v5) {
      return (uint64_t)v4;
    }
    goto LABEL_15;
  }

void sub_10009CFAC(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_10000360C(&qword_1000CFAA0);
      unint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  unint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  unint64_t v8 = (char *)(v4 + 7);
  uint64_t v45 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v43 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
        BOOL v11 = __OFADD__(v9++, 1LL);
        if (v11)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v12 = v10;
        Swift::Int v13 = NSObject._rawHashValue(seed:)(v4[5]);
        uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v15 = v13 & ~v14;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
        uint64_t v18 = 1LL << v15;
        if (((1LL << v15) & v17) != 0) {
          break;
        }
LABEL_26:
        *(void *)&v8[8 * v16] = v18 | v17;
        *(void *)(v4[6] + 8 * v15) = v12;
        uint64_t v24 = v4[2];
        BOOL v11 = __OFADD__(v24, 1LL);
        uint64_t v25 = v24 + 1;
        if (v11) {
          goto LABEL_43;
        }
        void v4[2] = v25;
        if (v9 == v5) {
          return;
        }
      }

      sub_1000052E0(0LL, (unint64_t *)&unk_1000CE790, &OBJC_CLASS___TUConversation_ptr);
      id v19 = *(id *)(v4[6] + 8 * v15);
      char v20 = static NSObject.== infix(_:_:)(v19, v12);

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = ~v14;
        while (1)
        {
          unint64_t v15 = (v15 + 1) & v21;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
          uint64_t v18 = 1LL << v15;
          if ((v17 & (1LL << v15)) == 0) {
            break;
          }
          id v22 = *(id *)(v4[6] + 8 * v15);
          char v23 = static NSObject.== infix(_:_:)(v22, v12);

          if ((v23 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v43;
        uint64_t v5 = v45;
        goto LABEL_26;
      }

uint64_t sub_10009D308(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = (unint64_t)[a1 state];
  unint64_t v14 = (unint64_t)[a2 state];
  if (qword_1000CD700 != -1) {
    swift_once(&qword_1000CD700, sub_10009B11C);
  }
  uint64_t v15 = sub_10000ADF4(v9, (uint64_t)qword_1000D0A70);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
  id v16 = a1;
  uint64_t v17 = v10;
  id v18 = v16;
  id v19 = (os_log_s *)Logger.logObject.getter(v16);
  int v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    int v37 = v20;
    uint64_t v39 = v17;
    uint64_t v40 = v3;
    unint64_t v43 = v13;
    unint64_t v21 = 0xE900000000000029LL;
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v36 = swift_slowAlloc(96LL, -1LL);
    uint64_t v45 = v36;
    *(_DWORD *)uint64_t v22 = 136315650;
    uint64_t v23 = 0x6E776F6E6B6E5528LL;
    unint64_t v24 = 0xE900000000000029LL;
    if (v14 <= 4)
    {
      uint64_t v23 = *(void *)&aWaitingPrepari_1[8 * v14];
      unint64_t v24 = *(void *)&aWaitingPrepari_1[8 * v14 + 40];
    }

    unint64_t v38 = v14;
    uint64_t v44 = sub_10009BE3C(v23, v24, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v24);
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v25 = 0x6E776F6E6B6E5528LL;
    if (v43 <= 4)
    {
      uint64_t v25 = *(void *)&aWaitingPrepari_1[8 * v43];
      unint64_t v21 = *(void *)&aWaitingPrepari_1[8 * v43 + 40];
    }

    uint64_t v44 = sub_10009BE3C(v25, v21, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v22 + 22) = 2080;
    uint64_t v35 = v22 + 24;
    id v26 = [v18 UUID];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v26);

    uint64_t v27 = sub_10000465C( &qword_1000CE780,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v28 = v42;
    uint64_t v29 = dispatch thunk of CustomStringConvertible.description.getter(v42, v27);
    unint64_t v31 = v30;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v28);
    uint64_t v44 = sub_10009BE3C(v29, v31, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v35, v22 + 32);

    swift_bridgeObjectRelease(v31);
    _os_log_impl( (void *)&_mh_execute_header,  v19,  (os_log_type_t)v37,  "Conversation state changed from %s to %s for %s",  (uint8_t *)v22,  0x20u);
    uint64_t v32 = v36;
    swift_arrayDestroy(v36, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v12, v9);
    unint64_t v13 = v43;
    unint64_t v14 = v38;
    if (v43 != 3) {
      goto LABEL_12;
    }
  }

  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v12, v9);
    if (v13 != 3) {
      goto LABEL_12;
    }
  }

  if (v14 != 3)
  {
LABEL_15:
    uint64_t v45 = (uint64_t)v18;
    return PassthroughSubject.send(_:)(&v45);
  }

uint64_t sub_10009D750(void *a1)
{
  if (qword_1000CD700 != -1) {
    swift_once(&qword_1000CD700, sub_10009B11C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_10000ADF4(v2, (uint64_t)qword_1000D0A70);
  id v3 = a1;
  unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v6 = 138412290;
    id v11 = v3;
    id v8 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    *uint64_t v7 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removed active conversation %@.", v6, 0xCu);
    uint64_t v9 = sub_10000360C(&qword_1000CE7A0);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
  }

  id v11 = v3;
  return PassthroughSubject.send(_:)(&v11);
}