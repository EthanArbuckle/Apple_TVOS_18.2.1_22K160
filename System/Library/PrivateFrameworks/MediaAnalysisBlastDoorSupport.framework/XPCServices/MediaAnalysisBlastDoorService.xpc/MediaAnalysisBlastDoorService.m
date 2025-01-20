int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  sub_10000878C(&qword_10001C098);
  v3 = __chkstk_darwin();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  register_for_dlsym_callbacks(v3);
  _CFPrefsSetDirectModeEnabled(1LL);
  _CFPrefsSetReadOnly(1LL);
  type metadata accessor for BlastDoorServer(0LL);
  qword_10001C250 = static BlastDoorServer.service.getter();
  qword_10001C258 = (uint64_t)&off_1000189E0;
  BlastDoorServer.setImageRestrictions(allowedImageFormats:increasedRestrictions:)( (Swift::OpaquePointer)&off_1000189E0,  1);
  qword_10001C260 = (uint64_t)&off_100018AA0;
  BlastDoorServer.setVideoRestrictions(codecs:)((Swift::OpaquePointer)&off_100018AA0);
  v6 = type metadata accessor for LargeImage(0LL);
  v7 = sub_1000087CC();
  BlastDoorServer.register<A, B>(unpacker:for:)(v7, v6, &type metadata for LargeImageUnpacker, v6, v7);
  v8 = type metadata accessor for MediaMetadata(0LL);
  v9 = sub_100008810();
  BlastDoorServer.register<A, B>(unpacker:for:)(v9, v8, &type metadata for MediaMetadataUnpacker, v8, v9);
  v10 = type metadata accessor for PreviewImage(0LL);
  v11 = sub_100008854();
  BlastDoorServer.register<A, B>(unpacker:for:)(v11, v10, &type metadata for PreviewImageUnpacker, v10, v11);
  v12 = type metadata accessor for VideoPreview(0LL);
  v13 = sub_100008898();
  BlastDoorServer.register<A, B>(unpacker:for:)(v13, v12, &type metadata for VideoPreviewUnpacker, v12, v13);
  v14 = type metadata accessor for SandboxID(0LL);
  sub_1000088DC(v14, qword_10001C268);
  v15 = sub_10000891C(v14, (uint64_t)qword_10001C268);
  v16 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, enum case for SandboxID.blastdoor(_:), v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v5, v15, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v5, 0LL, 1LL, v14);
  dispatch thunk of BlastDoorServer.resume(sandboxID:)(v5);
  sub_100008934((uint64_t)v5);
  return 0;
}

uint64_t sub_10000878C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000087CC()
{
  unint64_t result = qword_10001C0A0;
  if (!qword_10001C0A0)
  {
    unint64_t result = swift_getWitnessTable("-.", &type metadata for LargeImageUnpacker);
    atomic_store(result, (unint64_t *)&qword_10001C0A0);
  }

  return result;
}

unint64_t sub_100008810()
{
  unint64_t result = qword_10001C0A8;
  if (!qword_10001C0A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000160C8, &type metadata for MediaMetadataUnpacker);
    atomic_store(result, (unint64_t *)&qword_10001C0A8);
  }

  return result;
}

unint64_t sub_100008854()
{
  unint64_t result = qword_10001C0B0;
  if (!qword_10001C0B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100016128, &type metadata for PreviewImageUnpacker);
    atomic_store(result, (unint64_t *)&qword_10001C0B0);
  }

  return result;
}

unint64_t sub_100008898()
{
  unint64_t result = qword_10001C0B8;
  if (!qword_10001C0B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000161D8, &type metadata for VideoPreviewUnpacker);
    atomic_store(result, (unint64_t *)&qword_10001C0B8);
  }

  return result;
}

uint64_t *sub_1000088DC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000891C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008934(uint64_t a1)
{
  uint64_t v2 = sub_10000878C(&qword_10001C098);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100008974(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000089A8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1000089BC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000089DC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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

  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

__n128 sub_100008A28(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100008A34(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100008A54(uint64_t result, int a2, int a3)
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

__n128 sub_100008A90(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100008AA4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100008AC4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = (a2 - 1);
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

  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_100008B2C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008B70(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012LL && a2 == 0x80000001000155D0LL) {
    return 1LL;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2) & 1) != 0
    || a1 == 0x702E63696C627570LL && a2 == 0xEA0000000000676ELL)
  {
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2) & 1) != 0
    || a1 == 0xD000000000000014LL && a2 == 0x8000000100015590LL)
  {
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2) & 1) != 0
    || a1 == 0x682E63696C627570LL && a2 == 0xEB00000000666965LL)
  {
    return 1LL;
  }

  char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2);
  BOOL v5 = a1 == 0x682E63696C627570LL && a2 == 0xEB00000000636965LL;
  BOOL v6 = v5;
  if ((v4 & 1) != 0 || v6) {
    return 1LL;
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2);
  BOOL v8 = a1 == 0x682E63696C627570LL && a2 == 0xEC00000073636965LL;
  BOOL v9 = v8;
  if ((v7 & 1) != 0 || v9) {
    return 1LL;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2);
  BOOL v11 = a1 == 0xD000000000000014LL && a2 == 0x80000001000155F0LL;
  BOOL v12 = v11;
  if ((v10 & 1) != 0 || v12) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2);
  }
}

ValueMetadata *type metadata accessor for LargeImageUnpacker()
{
  return &type metadata for LargeImageUnpacker;
}

uint64_t sub_100008DC0()
{
  return sub_100009BD8( &qword_10001C0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for LargeImage,  (uint64_t)&protocol conformance descriptor for LargeImage);
}

uint64_t sub_100008DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a1;
  uint64_t v91 = a2;
  sub_10000878C(&qword_10001C0F0);
  ((void (*)(void))__chkstk_darwin)();
  v101 = (char *)v89 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Explosion(0LL);
  uint64_t v103 = *(void *)(v3 - 8);
  uint64_t v104 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v102 = (char *)v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MachImageError.Description(0LL);
  uint64_t v97 = *(void *)(v5 - 8);
  uint64_t v98 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v96 = (char *)v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for MachImageError.ErrorKind(0LL);
  uint64_t v94 = *(void *)(v7 - 8);
  uint64_t v95 = v7;
  ((void (*)(void))__chkstk_darwin)();
  v93 = (char *)v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for MediaMetadata(0LL);
  ((void (*)(void))__chkstk_darwin)();
  v90 = (char *)v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MachImageError(0LL);
  uint64_t v100 = *(void *)(v10 - 8);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v89[1] = (char *)v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v14 = __chkstk_darwin(v13);
  v99 = (char *)v89 - v15;
  __chkstk_darwin(v14);
  v17 = (char *)v89 - v16;
  uint64_t v18 = type metadata accessor for MachPort(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v22 = (char *)v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v20);
  v25 = (char *)v89 - v24;
  uint64_t v26 = static Sandbox.enableHubbleStateFlag()(v23);
  uint64_t v27 = LargeImage.Context.machPort.getter(v26);
  uint64_t v28 = LargeImage.Context.bufferSize.getter(v27);
  v105 = v25;
  uint64_t v106 = v19;
  v29 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v107 = v18;
  v29(v22, v25, v18);
  uint64_t v30 = type metadata accessor for MachImage(0LL);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  v31 = v108;
  uint64_t v32 = MachImage.init(machPort:bufferSize:)(v22, v28);
  if (!v31)
  {
    uint64_t v71 = v32;
    v72 = v90;
    v108 = (void (*)(void, void, void))v10;
    swift_retain(v32);
    uint64_t v73 = dispatch thunk of MachImage.initialize(from:)(v92);
    LargeImage.Context.metadata.getter(v73);
    LargeImage.init(image:metadata:)(v71, v72);
    swift_release(v71);
    return (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v105, v107);
  }

  v112 = v31;
  swift_errorRetain(v31);
  uint64_t v33 = sub_10000878C(&qword_10001C0F8);
  if ((swift_dynamicCast(v17, &v112, v33, v10, 0LL) & 1) == 0)
  {
    swift_errorRelease(v112);
    v75 = v102;
    Explosion.init(domain:errorType:keyPath:)( 0xD00000000000001ELL,  0x8000000100015630LL,  0xD000000000000015LL,  0x8000000100015610LL,  0LL,  0LL);
    sub_100009B18();
    v76 = (void *)static OS_os_log.largeImageUnpacker.getter();
    uint64_t v77 = sub_10000878C(&qword_10001C108);
    uint64_t v78 = swift_allocObject(v77, 72LL, 7LL);
    *(_OWORD *)(v78 + 16) = xmmword_100015F20;
    uint64_t v80 = v103;
    uint64_t v79 = v104;
    v108 = *(void (**)(void, void, void))(v103 + 16);
    uint64_t v81 = (uint64_t)v101;
    v108(v101, v75, v104);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v80 + 56))(v81, 0LL, 1LL, v79);
    uint64_t v82 = >> prefix<A>(_:)(v81, v79);
    uint64_t v84 = v83;
    sub_100009B54(v81);
    *(void *)(v78 + 56) = &type metadata for String;
    *(void *)(v78 + 64) = sub_100009B94();
    *(void *)(v78 + 32) = v82;
    *(void *)(v78 + 40) = v84;
    uint64_t v85 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("LargeImage explosion: %{public}@", 32LL, 2LL, &_mh_execute_header, v76, v85, v78);

    swift_bridgeObjectRelease(v78);
    uint64_t v86 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v79, v86, 0LL, 0LL);
    uint64_t v88 = ((uint64_t (*)(uint64_t, char *, uint64_t))v108)(v87, v75, v79);
    swift_willThrow(v88);
    swift_errorRelease(v31);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v75, v79);
    return (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v105, v107);
  }

  swift_errorRelease(v31);
  v34 = *(uint64_t (**)(char *, char *, uint64_t))(v100 + 32);
  v108 = (void (*)(void, void, void))v10;
  uint64_t v35 = v34(v99, v17, v10);
  uint64_t v110 = 0LL;
  unint64_t v111 = 0xE000000000000000LL;
  v36 = v93;
  uint64_t v37 = MachImageError.kind.getter(v35);
  uint64_t v38 = MachImageError.ErrorKind.rawValue.getter(v37);
  unint64_t v40 = v39;
  (*(void (**)(char *, uint64_t))(v94 + 8))(v36, v95);
  swift_bridgeObjectRelease(v111);
  uint64_t v110 = v38;
  unint64_t v111 = v40;
  v41._countAndFlagsBits = 8250LL;
  v41._object = (void *)0xE200000000000000LL;
  String.append(_:)(v41);
  v42 = v96;
  uint64_t v43 = MachImageError.description.getter();
  uint64_t v44 = MachImageError.Description.rawValue.getter(v43);
  v46 = v45;
  (*(void (**)(char *, uint64_t))(v97 + 8))(v42, v98);
  v47._countAndFlagsBits = v44;
  v47._object = v46;
  String.append(_:)(v47);
  uint64_t v48 = swift_bridgeObjectRelease(v46);
  uint64_t v49 = v110;
  unint64_t v50 = v111;
  uint64_t v51 = MachImageError.extraInfo.getter(v48);
  if (v51)
  {
    uint64_t v52 = v51;
    v109._countAndFlagsBits = 0LL;
    v109._object = (void *)0xE000000000000000LL;
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease(v109._object);
    strcpy((char *)&v109, ". Extra Info: ");
    HIBYTE(v109._object) = -18;
    v53._countAndFlagsBits = Dictionary.description.getter( v52,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    object = v53._object;
    String.append(_:)(v53);
    swift_bridgeObjectRelease(v52);
    swift_bridgeObjectRelease(object);
    v55 = v109._object;
    String.append(_:)(v109);
    swift_bridgeObjectRelease(v55);
    uint64_t v49 = v110;
    unint64_t v50 = v111;
  }

  v56 = v102;
  Explosion.init(domain:errorType:keyPath:)(0xD00000000000001ELL, 0x8000000100015630LL, v49, v50, 0LL, 0LL);
  sub_100009B18();
  v57 = (void *)static OS_os_log.largeImageUnpacker.getter();
  uint64_t v58 = sub_10000878C(&qword_10001C108);
  uint64_t v59 = swift_allocObject(v58, 72LL, 7LL);
  *(_OWORD *)(v59 + 16) = xmmword_100015F20;
  uint64_t v61 = v103;
  uint64_t v60 = v104;
  v62 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
  uint64_t v63 = (uint64_t)v101;
  v62(v101, v56, v104);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56))(v63, 0LL, 1LL, v60);
  uint64_t v64 = >> prefix<A>(_:)(v63, v60);
  uint64_t v66 = v65;
  sub_100009B54(v63);
  *(void *)(v59 + 56) = &type metadata for String;
  *(void *)(v59 + 64) = sub_100009B94();
  *(void *)(v59 + 32) = v64;
  *(void *)(v59 + 40) = v66;
  uint64_t v67 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("LargeImage explosion: %{public}@", 32LL, 2LL, &_mh_execute_header, v57, v67, v59);

  swift_bridgeObjectRelease(v59);
  uint64_t v68 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
  swift_allocError(v60, v68, 0LL, 0LL);
  uint64_t v70 = ((uint64_t (*)(uint64_t, char *, uint64_t))v62)(v69, v56, v60);
  swift_willThrow(v70);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v60);
  (*(void (**)(char *, void (*)(void, void, void)))(v100 + 8))(v99, v108);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v105, v107);
  return swift_errorRelease(v112);
}

uint64_t sub_100009B04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008DEC(a1, a2);
}

unint64_t sub_100009B18()
{
  unint64_t result = qword_10001C100;
  if (!qword_10001C100)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001C100);
  }

  return result;
}

uint64_t sub_100009B54(uint64_t a1)
{
  uint64_t v2 = sub_10000878C(&qword_10001C0F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100009B94()
{
  unint64_t result = qword_10001C110;
  if (!qword_10001C110)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001C110);
  }

  return result;
}

uint64_t sub_100009BD8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100009C18()
{
  return 1LL;
}

Swift::Int sub_100009C20()
{
  return Hasher._finalize()();
}

uint64_t sub_100009C64(uint64_t a1)
{
  return String.hash(into:)(a1, 0LL, 0xE000000000000000LL);
}

Swift::Int sub_100009C70(uint64_t a1)
{
  return Hasher._finalize()();
}

void sub_100009CB0(void *a1@<X8>)
{
  *a1 = &off_100018AD8;
}

uint64_t sub_100009CC0()
{
  uint64_t v0 = 85LL;
  uint64_t v1 = &byte_100018AF8;
  while (1)
  {
    char v4 = *v1++;
    char v3 = v4;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
    unint64_t v7 = sub_100013F08(0LL, 0xE000000000000000LL);
    uint64_t v8 = _swiftEmptyDictionarySingleton[2];
    BOOL v9 = (v6 & 1) == 0;
    uint64_t v10 = v8 + v9;
    if (__OFADD__(v8, v9)) {
      break;
    }
    char v11 = v6;
    if (_swiftEmptyDictionarySingleton[3] >= v10)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v6 & 1) != 0) {
          goto LABEL_2;
        }
      }

      else
      {
        sub_1000147C8();
        if ((v11 & 1) != 0) {
          goto LABEL_2;
        }
      }
    }

    else
    {
      sub_100013F6C(v10, isUniquelyReferenced_nonNull_native);
      unint64_t v12 = sub_100013F08(0LL, 0xE000000000000000LL);
      if ((v11 & 1) != (v13 & 1)) {
        goto LABEL_18;
      }
      unint64_t v7 = v12;
      if ((v11 & 1) != 0)
      {
LABEL_2:
        *(_BYTE *)(_swiftEmptyDictionarySingleton[7] + v7) = v3;
        goto LABEL_3;
      }
    }

    _swiftEmptyDictionarySingleton[(v7 >> 6) + 8] |= 1LL << v7;
    uint64_t v14 = (void *)(_swiftEmptyDictionarySingleton[6] + 16 * v7);
    *uint64_t v14 = 0LL;
    v14[1] = 0xE000000000000000LL;
    *(_BYTE *)(_swiftEmptyDictionarySingleton[7] + v7) = v3;
    uint64_t v15 = _swiftEmptyDictionarySingleton[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_17;
    }
    _swiftEmptyDictionarySingleton[2] = v17;
LABEL_3:
    uint64_t result = swift_bridgeObjectRelease(0x8000000000000000LL);
    if (!--v0)
    {
      off_10001C120 = _swiftEmptyDictionarySingleton;
      return result;
    }
  }

  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100009E4C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3 = a1[1];
  char v4 = sub_100009E9C(*a1, v3);
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

void sub_100009E90(void *a1@<X8>)
{
  *a1 = 0LL;
  a1[1] = 0xE000000000000000LL;
}

uint64_t sub_100009E9C(uint64_t a1, uint64_t a2)
{
  if (qword_10001C090 != -1) {
    swift_once(&qword_10001C090, sub_100009CC0);
  }
  char v4 = off_10001C120;
  if (*((void *)off_10001C120 + 2) && (unint64_t v5 = sub_100013F08(a1, a2), (v6 & 1) != 0)) {
    return *(unsigned __int8 *)(v4[7] + v5);
  }
  else {
    return 85LL;
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for MetadataKey(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetadataKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xAC) {
    goto LABEL_17;
  }
  if (a2 + 84 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 84) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 84;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 84;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 84;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x55;
  int v8 = v6 - 85;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

        v25 = CMSampleBufferRef.imageBuffer.getter();
        if (!v25)
        {
          uint64_t v103 = *(void **)(v0 + 1712);
          uint64_t v104 = *(void **)(v0 + 1656);
          v105 = *(void **)(v0 + 1504);
          uint64_t v106 = v13;
          uint64_t v107 = *(void **)(v0 + 1472);
          v108 = *(void *)(v0 + 1256);
          v198 = *(void *)(v0 + 1248);
          v202 = *(void *)(v0 + 1272);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          Swift::String v109 = type metadata accessor for Explosion(0LL);
          uint64_t v110 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
          swift_allocError(v109, v110, 0LL, 0LL);
          unint64_t v111 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x426567616D496F4ELL,  0xED00007265666675LL,  0xD000000000000014LL,  0x80000001000161A0LL);
          swift_willThrow(v111);

          (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v202, v198);
          goto LABEL_37;
        }

        uint64_t v26 = (void *)v25;
        v185 = v13;
        v199 = v11;
        uint64_t v27 = static os_log_type_t.info.getter(v25);
        uint64_t v28 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
        if (os_log_type_enabled(v28, v27))
        {
          v29 = swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)v29 = 134217984;
          unint64_t v12 = *v132;
          *(void *)(v29 + 4) = *v132;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v27,  "BlastDoor processing thumbnail %ld",  (uint8_t *)v29,  0xCu);
          swift_slowDealloc(v29, -1LL, -1LL);
        }

        v159 = *(unsigned __int8 *)(v0 + 1805);
        v180 = *(_DWORD *)(v0 + 1784);
        v175 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
        v163 = *(unsigned __int8 *)(v0 + 1804);
        v155 = *(void *)(v0 + 1496);
        v167 = *(void *)(v0 + 1376);
        v171 = *(void *)(v0 + 1360);
        uint64_t v30 = *(void *)(v0 + 1272);
        v31 = *(void *)(v0 + 1264);
        uint64_t v32 = *(void *)(v0 + 1248);
        uint64_t v33 = *(void *)(v0 + 1240);
        v135 = *(void *)(v0 + 1232);
        v136 = *(void *)(v0 + 1216);
        v34 = *(void *)(v0 + 1208);
        uint64_t v35 = *(void *)(v0 + 1200);
        v137 = *(void *)(v0 + 1192);
        v139 = *(void *)(v0 + 1176);
        v134 = *(void *)(v0 + 1168);
        v141 = *(void *)(v0 + 1160);
        v145 = *(void *)(v0 + 1144);

        v36 = CMSampleBufferRef.presentationTimeStamp.getter();
        uint64_t v37 = CMTime.seconds.getter(v36);
        type metadata accessor for CVBuffer(0LL);
        v203[3] = v38;
        v203[4] = &protocol witness table for CVBufferRef;
        v203[0] = v26;
        unint64_t v39 = type metadata accessor for Image.Encoding(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56LL))(v34, 1LL, 1LL, v39);
        unint64_t v40 = v26;
        Image.init(provider:maxPixelDimension:enforcedEncoding:)(v203, 0LL, 1LL, v34);
        Swift::String v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v131 + 16);
        v41(v31, v30, v32);
        VideoPreview.VideoFormat.init(trackInfo:)(v31);
        v41(v31, v30, v32);
        VideoPreview.AudioFormat.init(trackInfo:)(v31);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v195 + 16))(v135, v33, v136);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v192 + 16))(v137, v35, v139);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 16))(v141, v134, v145);
        v42 = VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)( v135,  v159,  v12,  v155,  v137,  v141,  v163,  v37);
        VideoPreview.Constraints.frameConstraints.getter(v42);
        uint64_t v43 = v175(v167, v171);
        uint64_t v44 = *(void **)(v0 + 1712);
        v133 = v40;
        if (v43 == v180)
        {
          v140 = *(void **)(v0 + 1656);
          v144 = *(void **)(v0 + 1504);
          v148 = *(void **)(v0 + 1472);
          v112 = *(void *)(v0 + 1376);
          v113 = *(void *)(v0 + 1360);
          v184 = *(void *)(v0 + 1272);
          v174 = *(void *)(v0 + 1256);
          v179 = *(void *)(v0 + 1248);
          v166 = *(void *)(v0 + 1216);
          v170 = *(void *)(v0 + 1240);
          v158 = *(void *)(v0 + 1176);
          v162 = *(void *)(v0 + 1200);
          v151 = *(void *)(v0 + 1144);
          v154 = *(void *)(v0 + 1168);
          v114 = *(void *)(v0 + 1136);
          v115 = *(void *)(v0 + 1128);
          v116 = *(void *)(v0 + 1112);
          v117 = *(void *)(v0 + 1104);
          v118 = *(void *)(v0 + 1080);
          v138 = *(void *)(v0 + 1088);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          v119 = (*(uint64_t (**)(uint64_t, uint64_t))(v130 + 8))(v112, v113);
          v120 = static os_log_type_t.info.getter(v119);
          v121 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
          os_log(_:dso:log:_:_:)( v120,  &_mh_execute_header,  v121,  "This was a single frame request - handling continuation",  55LL,  2LL,  &_swiftEmptyArrayStorage);

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v115, v114, v116);
          v122 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
          SessionSchemaResult.init(_:lastResult:)(v115, 1LL, v116, v122);
          v123 = sub_10000878C(&qword_10001C198);
          AsyncThrowingStream.Continuation.yield(_:)(v118, v123);
          (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v117, v138);
          *(void *)(v0 + 968) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 968, v123);

          (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v114, v116);
          (*(void (**)(uint64_t, uint64_t))(v189 + 8))(v154, v151);
          (*(void (**)(uint64_t, uint64_t))(v192 + 8))(v162, v158);
          (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v170, v166);
          (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v184, v179);
          goto LABEL_41;
        }

        (*(void (**)(void, void))(v130 + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
        BOOL v7 = [v44 copyNextSampleBuffer];

        v45 = *(void *)(v0 + 1016);
        v46 = __OFADD__(v45, 1LL);
        Swift::String v47 = v45 + 1;
        if (v46) {
          __break(1u);
        }
        *v132 = v47;
        if (v7) {
          uint64_t v49 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v47 == *(void *)(v0 + 1600);
        }
        else {
          uint64_t v49 = 1LL;
        }
        unint64_t v50 = *(void *)(v0 + 1128);
        uint64_t v51 = *(void *)(v0 + 1112);
        uint64_t v52 = *(void *)(v0 + 1104);
        Swift::String v53 = *(void *)(v0 + 1088);
        v54 = *(void *)(v0 + 1080);
        (*(void (**)(uint64_t, void, uint64_t))(v129 + 16))(v50, *(void *)(v0 + 1136), v51);
        v55 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
        SessionSchemaResult.init(_:lastResult:)(v50, v49, v51, v55);
        v56 = sub_10000878C(&qword_10001C198);
        AsyncThrowingStream.Continuation.yield(_:)(v54, v56);
        (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v52, v53);
        v57 = *(void *)(v0 + 1240);
        v181 = *(void *)(v0 + 1200);
        v186 = *(void *)(v0 + 1216);
        v176 = *(void *)(v0 + 1176);
        uint64_t v58 = *(void *)(v0 + 1168);
        uint64_t v59 = *(void *)(v0 + 1144);
        uint64_t v60 = *(void *)(v0 + 1136);
        uint64_t v61 = *(void *)(v0 + 1112);
        if (v49)
        {
          *(void *)(v0 + 976) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 976, v56);
        }

        (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v60, v61);
        (*(void (**)(uint64_t, uint64_t))(v189 + 8))(v58, v59);
        (*(void (**)(uint64_t, uint64_t))(v192 + 8))(v181, v176);
        (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v57, v186);
        if (!v7)
        {
          v124 = *(void **)(v0 + 1712);
          v125 = *(void *)(v0 + 1704);
          v126 = *(void **)(v0 + 1504);
          v127 = *(void **)(v0 + 1472);
          v90 = *(void *)(v0 + 1272);
          uint64_t v91 = *(void *)(v0 + 1256);
          uint64_t v92 = *(void *)(v0 + 1248);

          swift_bridgeObjectRelease(v125);
          goto LABEL_40;
        }

        v62 = *(void *)(v0 + 1600);
        uint64_t v63 = *(_DWORD *)(v0 + 1784);
        uint64_t v64 = *(_DWORD *)(v0 + 1780);
        unint64_t v12 = *(void *)(v0 + 1016);
        char v11 = (opaqueCMSampleBuffer *)v7;
        char v13 = v7;
        if (v64 != v63)
        {
          char v13 = v7;
          if (v12 == v62) {
            break;
          }
        }
      }
    }

    uint64_t v85 = *(void **)(v0 + 1712);
    uint64_t v86 = *(void *)(v0 + 1704);
    uint64_t v87 = v11;
    uint64_t v88 = *(void **)(v0 + 1504);
    v89 = *(void **)(v0 + 1472);
    v90 = *(void *)(v0 + 1272);
    uint64_t v91 = *(void *)(v0 + 1256);
    uint64_t v92 = *(void *)(v0 + 1248);

    swift_bridgeObjectRelease(v86);
LABEL_40:
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v90, v92);
LABEL_41:
    v93 = *(void *)(v0 + 1432);
    uint64_t v94 = *(void *)(v0 + 1408);
    uint64_t v95 = *(void *)(v0 + 1400);
    v96 = *(void *)(v0 + 1392);
    uint64_t v97 = *(void *)(v0 + 1384);
    uint64_t v98 = *(void *)(v0 + 1376);
    v99 = *(void *)(v0 + 1352);
    uint64_t v100 = *(void *)(v0 + 1328);
    v101 = *(void *)(v0 + 1320);
    v143 = *(void *)(v0 + 1312);
    v147 = *(void *)(v0 + 1304);
    v150 = *(void *)(v0 + 1296);
    v153 = *(void *)(v0 + 1272);
    v157 = *(void *)(v0 + 1264);
    v161 = *(void *)(v0 + 1240);
    v165 = *(void *)(v0 + 1232);
    v169 = *(void *)(v0 + 1208);
    v173 = *(void *)(v0 + 1200);
    v178 = *(void *)(v0 + 1192);
    v183 = *(void *)(v0 + 1168);
    v188 = *(void *)(v0 + 1160);
    v191 = *(void *)(v0 + 1136);
    v194 = *(void *)(v0 + 1128);
    v197 = *(void *)(v0 + 1104);
    v201 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v93);
    swift_task_dealloc(v94);
    swift_task_dealloc(v95);
    swift_task_dealloc(v96);
    swift_task_dealloc(v97);
    swift_task_dealloc(v98);
    swift_task_dealloc(v99);
    swift_task_dealloc(v100);
    swift_task_dealloc(v101);
    swift_task_dealloc(v143);
    swift_task_dealloc(v147);
    swift_task_dealloc(v150);
    swift_task_dealloc(v153);
    swift_task_dealloc(v157);
    swift_task_dealloc(v161);
    swift_task_dealloc(v165);
    swift_task_dealloc(v169);
    swift_task_dealloc(v173);
    swift_task_dealloc(v178);
    swift_task_dealloc(v183);
    swift_task_dealloc(v188);
    swift_task_dealloc(v191);
    swift_task_dealloc(v194);
    swift_task_dealloc(v197);
    swift_task_dealloc(v201);
    uint64_t v84 = *(uint64_t (**)(void))(v0 + 8);
  }

  else
  {
    uint64_t v65 = *(void **)(v0 + 1712);
    uint64_t v66 = *(void **)(v0 + 1656);
    uint64_t v67 = *(void **)(v0 + 1504);
    uint64_t v68 = *(void **)(v0 + 1472);
    uint64_t v69 = *(void *)(v0 + 1272);
    uint64_t v70 = *(void *)(v0 + 1256);
    uint64_t v71 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease(*(void *)(v0 + 1704));
    v72 = type metadata accessor for Explosion(0LL);
    uint64_t v73 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v72, v73, 0LL, 0LL);
    v74 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x73656D6172466F4ELL,  0xE800000000000000LL,  0xD000000000000014LL,  0x80000001000161A0LL);
    swift_willThrow(v74);

    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
LABEL_37:
    v75 = *(void *)(v0 + 1432);
    v76 = *(void *)(v0 + 1408);
    uint64_t v77 = *(void *)(v0 + 1400);
    uint64_t v78 = *(void *)(v0 + 1392);
    uint64_t v79 = *(void *)(v0 + 1384);
    uint64_t v80 = *(void *)(v0 + 1376);
    uint64_t v81 = *(void *)(v0 + 1352);
    uint64_t v82 = *(void *)(v0 + 1328);
    uint64_t v83 = *(void *)(v0 + 1320);
    v142 = *(void *)(v0 + 1312);
    v146 = *(void *)(v0 + 1304);
    v149 = *(void *)(v0 + 1296);
    v152 = *(void *)(v0 + 1272);
    v156 = *(void *)(v0 + 1264);
    v160 = *(void *)(v0 + 1240);
    v164 = *(void *)(v0 + 1232);
    v168 = *(void *)(v0 + 1208);
    v172 = *(void *)(v0 + 1200);
    v177 = *(void *)(v0 + 1192);
    v182 = *(void *)(v0 + 1168);
    v187 = *(void *)(v0 + 1160);
    v190 = *(void *)(v0 + 1136);
    v193 = *(void *)(v0 + 1128);
    v196 = *(void *)(v0 + 1104);
    v200 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v75);
    swift_task_dealloc(v76);
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    swift_task_dealloc(v142);
    swift_task_dealloc(v146);
    swift_task_dealloc(v149);
    swift_task_dealloc(v152);
    swift_task_dealloc(v156);
    swift_task_dealloc(v160);
    swift_task_dealloc(v164);
    swift_task_dealloc(v168);
    swift_task_dealloc(v172);
    swift_task_dealloc(v177);
    swift_task_dealloc(v182);
    swift_task_dealloc(v187);
    swift_task_dealloc(v190);
    swift_task_dealloc(v193);
    swift_task_dealloc(v196);
    swift_task_dealloc(v200);
    uint64_t v84 = *(uint64_t (**)(void))(v0 + 8);
  }

  return v84();
}

uint64_t storeEnumTagSinglePayload for MetadataKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 84 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 84) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xAC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xAB) {
    return ((uint64_t (*)(void))((char *)&loc_10000A004 + 4 * byte_100015FA5[v4]))();
  }
  *a1 = a2 + 84;
  return ((uint64_t (*)(void))((char *)sub_10000A038 + 4 * byte_100015FA0[v4]))();
}

uint64_t sub_10000A038(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A048LL);
  }
  return result;
}

uint64_t sub_10000A054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A05CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 84;
  return result;
}

uint64_t sub_10000A060(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A068(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A074(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A080(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MetadataKey()
{
  return &type metadata for MetadataKey;
}

unint64_t sub_10000A09C()
{
  unint64_t result = qword_10001C128;
  if (!qword_10001C128)
  {
    uint64_t v1 = sub_10000A0E8(&qword_10001C130);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001C128);
  }

  return result;
}

uint64_t sub_10000A0E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10000A130()
{
  unint64_t result = qword_10001C138;
  if (!qword_10001C138)
  {
    unint64_t result = swift_getWitnessTable(&unk_100016084, &type metadata for MetadataKey);
    atomic_store(result, (unint64_t *)&qword_10001C138);
  }

  return result;
}

ValueMetadata *type metadata accessor for MediaMetadataUnpacker()
{
  return &type metadata for MediaMetadataUnpacker;
}

unint64_t sub_10000A188()
{
  unint64_t result = qword_10001C140;
  if (!qword_10001C140)
  {
    uint64_t v1 = type metadata accessor for MediaMetadata(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for MediaMetadata, v1);
    atomic_store(result, (unint64_t *)&qword_10001C140);
  }

  return result;
}

uint64_t sub_10000A1D0()
{
  uint64_t v0 = sub_10000878C(&qword_10001C148);
  __chkstk_darwin(v0);
  int v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for MediaMetadata.LargeImageContextualInfo(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
  return MediaMetadata.init(largeImageContextualInfo:)(v2);
}

ValueMetadata *type metadata accessor for PreviewImageUnpacker()
{
  return &type metadata for PreviewImageUnpacker;
}

uint64_t sub_10000A278()
{
  return sub_100009BD8( &qword_10001C150,  (uint64_t (*)(uint64_t))&type metadata accessor for PreviewImage,  (uint64_t)&protocol conformance descriptor for PreviewImage);
}

uint64_t sub_10000A2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v170 = a2;
  uint64_t v163 = a3;
  uint64_t v155 = type metadata accessor for StickerEffect(0LL);
  uint64_t v154 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  v159 = (char *)&v149 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000878C(&qword_10001C158);
  __chkstk_darwin(v5);
  uint64_t v167 = (uint64_t)&v149 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v172 = type metadata accessor for ImageProperties(0LL);
  uint64_t v165 = *(void *)(v172 - 8);
  uint64_t v7 = __chkstk_darwin(v172);
  v164 = (char *)&v149 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v161 = (char *)&v149 - v9;
  uint64_t v10 = sub_10000878C(&qword_10001C160);
  uint64_t v11 = __chkstk_darwin(v10);
  v162 = (char *)&v149 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  v152 = (char *)&v149 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v158 = (char *)&v149 - v16;
  __chkstk_darwin(v15);
  uint64_t v177 = (uint64_t)&v149 - v17;
  uint64_t v18 = sub_10000878C(&qword_10001C168);
  __chkstk_darwin(v18);
  v166 = (char *)&v149 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v169 = type metadata accessor for Image(0LL);
  uint64_t v171 = *(void *)(v169 - 8);
  uint64_t v20 = __chkstk_darwin(v169);
  v153 = (char *)&v149 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  v157 = (char *)&v149 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v156 = (char *)&v149 - v25;
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v149 - v26;
  uint64_t v28 = type metadata accessor for Path(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  v31 = (char *)&v149 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for BlastDoorServer(0LL);
  static BlastDoorServer.disableRawDecoding()();
  unint64_t v160 = sub_100009B18();
  uint64_t v32 = (void *)((uint64_t (*)(void))static OS_os_log.image.getter)();
  uint64_t v33 = sub_10000878C(&qword_10001C108);
  uint64_t v34 = swift_allocObject(v33, 72LL, 7LL);
  *(_OWORD *)(v34 + 16) = xmmword_100015F20;
  uint64_t v35 = File.path.getter();
  *(double *)&uint64_t v36 = COERCE_DOUBLE(Path.absolutePath.getter(v35));
  double v38 = v37;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  double v173 = *(double *)&v36;
  double v174 = v38;
  uint64_t v39 = >> prefix<A>(_:)(&v173, &type metadata for String);
  uint64_t v41 = v40;
  double v42 = v38;
  uint64_t v43 = v177;
  swift_bridgeObjectRelease(*(void *)&v42);
  *(void *)(v34 + 56) = &type metadata for String;
  *(void *)(v34 + 64) = sub_100009B94();
  *(void *)(v34 + 32) = v39;
  *(void *)(v34 + 40) = v41;
  uint64_t v44 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Unpacking image at path %{public}@", 34LL, 2LL, &_mh_execute_header, v32, v44, v34);

  uint64_t v45 = v172;
  swift_bridgeObjectRelease(v34);
  uint64_t v46 = type metadata accessor for File(0LL);
  uint64_t v175 = v46;
  v176 = &protocol witness table for File;
  Swift::String v47 = sub_10000B174(&v173);
  uint64_t v48 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16LL))(v47, a1, v46);
  uint64_t v49 = PreviewImage.Constraints.maxPixelDimension.getter(v48);
  uint64_t v50 = type metadata accessor for Image.Encoding(0LL);
  uint64_t v51 = v166;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56LL))(v166, 1LL, 1LL, v50);
  Image.init(provider:maxPixelDimension:enforcedEncoding:)(&v173, v49, 0LL, v51);
  uint64_t v52 = type metadata accessor for PreviewImage(0LL);
  uint64_t v53 = *(void *)(v52 - 8);
  v54 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56);
  uint64_t v55 = v54(v43, 1LL, 1LL, v52);
  Image.provider.getter(&v173, v55);
  uint64_t v56 = v175;
  v57 = v176;
  sub_10000B1B0(&v173, v175);
  uint64_t v58 = v168;
  uint64_t v59 = v167;
  ImageProvider.withImageSource<A>(_:)(sub_10000B108, 0LL, v56, v45, v57);
  if (v58)
  {
    sub_10000B1F4(v43, &qword_10001C160);
    (*(void (**)(char *, uint64_t))(v171 + 8))(v27, v169);
    return sub_10000B1D4(&v173);
  }

  uint64_t v151 = v52;
  v166 = 0LL;
  v150 = v54;
  v168 = v27;
  uint64_t v61 = v169;
  uint64_t v63 = v164;
  uint64_t v62 = v165;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v165 + 48))(v59, 1LL, v45) == 1)
  {
    sub_10000B1F4(v59, &qword_10001C158);
    sub_10000B1D4(&v173);
    uint64_t v64 = v61;
    uint64_t v65 = v171;
    uint64_t v66 = v177;
    uint64_t v68 = (uint64_t)v162;
    uint64_t v67 = v163;
    uint64_t v69 = v151;
    goto LABEL_25;
  }

  uint64_t v70 = v161;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v161, v59, v45);
  uint64_t v71 = sub_10000B1D4(&v173);
  uint64_t v72 = ImageProperties.utTypeString.getter(v71);
  uint64_t v73 = v45;
  uint64_t v74 = v171;
  uint64_t v167 = v75;
  if (!v75)
  {
    uint64_t v82 = type metadata accessor for Explosion(0LL);
    uint64_t v83 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v82, v83, 0LL, 0LL);
    uint64_t v84 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x80000001000156F0LL,  0xD000000000000012LL,  0x8000000100015740LL,  0xD000000000000014LL,  0x8000000100015760LL);
    swift_willThrow(v84);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v70, v73);
    sub_10000B1F4(v177, &qword_10001C160);
    uint64_t v85 = *(uint64_t (**)(char *, uint64_t))(v74 + 8);
    goto LABEL_13;
  }

  uint64_t v76 = v72;
  if ((PreviewImage.Constraints.isEmojiImage.getter() & 1) != 0)
  {
    if ((v76 != 0x682E63696C627570LL || v167 != 0xEB00000000636965LL)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v76, v167) & 1) == 0)
    {
      swift_bridgeObjectRelease(v167);
      uint64_t v111 = type metadata accessor for Explosion(0LL);
      uint64_t v112 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
      swift_allocError(v111, v112, 0LL, 0LL);
      uint64_t v113 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x80000001000156F0LL,  0xD000000000000012LL,  0x8000000100015740LL,  0x636965487369LL,  0xE600000000000000LL);
      swift_willThrow(v113);
      (*(void (**)(char *, uint64_t))(v165 + 8))(v70, v172);
      sub_10000B1F4(v177, &qword_10001C160);
      return (*(uint64_t (**)(char *, uint64_t))(v171 + 8))(v168, v169);
    }

    uint64_t v77 = PreviewImage.Constraints.index.getter();
    uint64_t v78 = PreviewImage.Constraints.maxPixelDimension.getter(v77);
    double v173 = 0.0;
    double v174 = 0.0;
    uint64_t v79 = v156;
    uint64_t v80 = v168;
    uint64_t v81 = v166;
    Image.emojiStrikeImage(atIndex:maxPixelDimension:alignmentInset:)(v77, &v173, (double)v78);
    v166 = v81;
    if (v81)
    {
      swift_bridgeObjectRelease(v167);
      (*(void (**)(char *, uint64_t))(v165 + 8))(v70, v172);
      sub_10000B1F4(v177, &qword_10001C160);
      return (*(uint64_t (**)(char *, uint64_t))(v171 + 8))(v80, v169);
    }

    uint64_t v65 = v171;
    v105 = v157;
    uint64_t v64 = v169;
    (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v157, v79, v169);
    double v106 = v173;
    double v107 = v174;
    v108 = v159;
    (*(void (**)(char *, void, uint64_t))(v154 + 104))(v159, enum case for StickerEffect.none(_:), v155);
    uint64_t v109 = (uint64_t)v158;
    PreviewImage.init(image:frameCount:frameDuration:isScreenshot:stickerEffect:utTypeString:isMonoskiAsset:alignmentInset:)( v105,  1LL,  0LL,  1LL,  0LL,  v108,  v76,  v167,  v106,  v107,  0);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v79, v64);
    (*(void (**)(char *, uint64_t))(v165 + 8))(v70, v172);
    uint64_t v66 = v177;
    sub_10000B1F4(v177, &qword_10001C160);
    uint64_t v110 = v109;
    uint64_t v69 = v151;
    goto LABEL_23;
  }

  char v88 = sub_100008B70(v76, v167);
  uint64_t v89 = v165;
  v90 = v63;
  uint64_t v91 = v63;
  uint64_t v92 = v172;
  uint64_t v93 = (*(uint64_t (**)(char *, char *, uint64_t))(v165 + 16))(v91, v70, v172);
  if ((v88 & 1) != 0)
  {
    uint64_t v94 = ImageProperties.frameCount.getter(v93);
    uint64_t v95 = *(uint64_t (**)(char *, uint64_t))(v89 + 8);
    uint64_t v96 = v95(v90, v92);
    if (v94 > 1)
    {
      uint64_t v97 = (void *)static OS_os_log.image.getter(v96);
      uint64_t v98 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)( "Unpacking image with thumbnailer because it is animated",  55LL,  2LL,  &_mh_execute_header,  v97,  v98,  &_swiftEmptyArrayStorage);

      uint64_t v99 = PreviewImage.Constraints.index.getter();
      uint64_t v100 = v161;
      uint64_t v101 = ImageProperties.frameCount.getter(v99);
      uint64_t v102 = PreviewImage.Constraints.maxCount.getter();
      uint64_t v103 = v166;
      uint64_t v104 = sub_10000B2C0(v99, v101, v102);
      if (!v103)
      {
        uint64_t v135 = v104;
        v156 = (char *)v76;
        uint64_t v136 = PreviewImage.Constraints.maxPixelDimension.getter(v104);
        v137 = v153;
        uint64_t v138 = Image.thumbnailImage(maxPixelDimension:imageIndex:)(v135, (double)v136);
        uint64_t v64 = v61;
        v166 = 0LL;
        uint64_t v139 = ImageProperties.frameCount.getter(v138);
        __n128 v140 = ImageProperties.isMonoskiAsset.getter(v139);
        char v142 = v141;
        v143 = v100;
        v144 = v137;
        v145 = v159;
        (*(void (**)(char *, void, uint64_t, __n128))(v154 + 104))( v159,  enum case for StickerEffect.none(_:),  v155,  v140);
        char v148 = v142 & 1;
        uint64_t v146 = (uint64_t)v152;
        PreviewImage.init(image:frameCount:frameDuration:isScreenshot:stickerEffect:utTypeString:isMonoskiAsset:alignmentInset:)( v144,  v139,  0LL,  1LL,  0LL,  v145,  v156,  v167,  0.0,  0.0,  v148);
        v95(v143, v172);
        uint64_t v66 = v177;
        sub_10000B1F4(v177, &qword_10001C160);
        uint64_t v69 = v151;
        v150(v146, 0LL, 1LL, v151);
        sub_10000B278(v146, v66);
        uint64_t v65 = v171;
        goto LABEL_24;
      }

      swift_bridgeObjectRelease(v167);
      v95(v100, v172);
      sub_10000B1F4(v177, &qword_10001C160);
      uint64_t v85 = *(uint64_t (**)(char *, uint64_t))(v171 + 8);
LABEL_13:
      uint64_t v86 = v168;
      uint64_t v87 = v61;
      return v85(v86, v87);
    }

    v156 = (char *)v76;
  }

  else
  {
    v156 = (char *)v76;
    uint64_t v95 = *(uint64_t (**)(char *, uint64_t))(v89 + 8);
    uint64_t v96 = v95(v90, v92);
  }

  v114 = v157;
  uint64_t v115 = v169;
  uint64_t v69 = v151;
  uint64_t v116 = v171;
  v117 = (void *)static OS_os_log.image.getter(v96);
  uint64_t v118 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)( "Unpacking image with software HEIF->ASTC decoder",  48LL,  2LL,  &_mh_execute_header,  v117,  v118,  &_swiftEmptyArrayStorage);

  uint64_t v119 = (*(uint64_t (**)(char *, char *, uint64_t))(v116 + 16))(v114, v168, v115);
  v120 = v161;
  uint64_t v170 = ImageProperties.frameCount.getter(v119);
  char v121 = ImageProperties.isScreenshot.getter();
  uint64_t v122 = ImageProperties.stickerEffect.getter();
  v123 = v114;
  v124 = v159;
  uint64_t v125 = StickerEffect.init(defaultingRawValue:)(v122);
  ImageProperties.isMonoskiAsset.getter(v125);
  char v147 = v126 & 1;
  uint64_t v127 = v121 & 1;
  uint64_t v64 = v61;
  uint64_t v109 = (uint64_t)v158;
  v128 = v123;
  uint64_t v65 = v171;
  PreviewImage.init(image:frameCount:frameDuration:isScreenshot:stickerEffect:utTypeString:isMonoskiAsset:alignmentInset:)( v128,  v170,  0LL,  1LL,  v127,  v124,  v156,  v167,  0.0,  0.0,  v147);
  v95(v120, v172);
  uint64_t v66 = v177;
  sub_10000B1F4(v177, &qword_10001C160);
  uint64_t v110 = v109;
LABEL_23:
  v150(v110, 0LL, 1LL, v69);
  sub_10000B278(v109, v66);
LABEL_24:
  uint64_t v68 = (uint64_t)v162;
  uint64_t v67 = v163;
LABEL_25:
  sub_10000B230(v66, v68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v68, 1LL, v69) == 1)
  {
    uint64_t v129 = sub_10000B1F4(v68, &qword_10001C160);
    v130 = (void *)static OS_os_log.image.getter(v129);
    uint64_t v131 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)( "Failed to generate astc image",  29LL,  2LL,  &_mh_execute_header,  v130,  v131,  &_swiftEmptyArrayStorage);

    uint64_t v132 = type metadata accessor for Explosion(0LL);
    uint64_t v133 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v132, v133, 0LL, 0LL);
    uint64_t v134 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x80000001000156F0LL,  0xD000000000000013LL,  0x8000000100015720LL,  0LL,  0LL);
    swift_willThrow(v134);
    sub_10000B1F4(v66, &qword_10001C160);
    uint64_t v85 = *(uint64_t (**)(char *, uint64_t))(v65 + 8);
    uint64_t v86 = v168;
    uint64_t v87 = v64;
    return v85(v86, v87);
  }

  sub_10000B1F4(v66, &qword_10001C160);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v168, v64);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v67, v68, v69);
}

uint64_t sub_10000B108@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ImageProperties(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 0LL, 1LL, v2);
}

uint64_t sub_10000B160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000A2A4(a1, a2, a3);
}

void *sub_10000B174(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

void *sub_10000B1B0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000B1D4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B1F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000878C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000B230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000878C(&qword_10001C160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B278(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000878C(&qword_10001C160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B2C0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3)
  {
    uint64_t v4 = type metadata accessor for Explosion(0LL);
    uint64_t v5 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v4, v5, 0LL, 0LL);
    uint64_t v6 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x80000001000156F0LL,  0xD000000000000010LL,  0x8000000100015800LL,  0x4977656976657270LL,  0xEC0000007865646ELL);
    return swift_willThrow(v6);
  }

  else if (a3 < a2)
  {
    double v3 = (double)a2 / (double)a3 * (double)result;
    if ((~*(void *)&v3 & 0x7FF0000000000000LL) != 0)
    {
      if (v3 > -9.22337204e18)
      {
        if (v3 < 9.22337204e18) {
          return (uint64_t)v3;
        }
        goto LABEL_11;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
LABEL_11:
    __break(1u);
  }

  return result;
}

ValueMetadata *type metadata accessor for VideoPreviewUnpacker()
{
  return &type metadata for VideoPreviewUnpacker;
}

uint64_t sub_10000B400()
{
  return sub_100009BD8( &qword_10001C170,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
}

uint64_t sub_10000B42C@<X0>(uint8_t *a1@<X0>, uint8_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v44 = a3;
  uint64_t v43 = sub_10000878C(&qword_10001C178);
  uint64_t v40 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  double v42 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Path(0LL);
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v38 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for File(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  os_log_type_t v16 = static os_log_type_t.info.getter(v13);
  sub_100014B3C(0LL, (unint64_t *)&qword_10001C100, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v17 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  uint64_t v18 = *(void (**)(char *, uint8_t *, uint64_t))(v12 + 16);
  uint64_t v39 = a1;
  v18(v15, a1, v11);
  os_log_type_t v19 = v16;
  if (os_log_type_enabled(v17, v16))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v35 = swift_slowAlloc(32LL, -1LL);
    uint64_t v46 = v35;
    uint64_t v34 = v20;
    *(_DWORD *)uint64_t v20 = 136446210;
    uint64_t v33 = v20 + 4;
    uint64_t v21 = File.path.getter();
    Path.fileURL.getter(v21);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v37);
    uint64_t v22 = sub_100009BD8( &qword_10001C188,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter(v8, v22);
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v8);
    uint64_t v45 = sub_1000133A8(v23, v25, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v33, v20 + 12);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t v26 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  v19,  "BlastDoor processing thumbnail for video: %{public}s",  v34,  0xCu);
    uint64_t v27 = v35;
    swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }

  __chkstk_darwin(v28);
  uint64_t v29 = v41;
  *(&v33 - 2) = v39;
  *(&v33 - 1) = v29;
  uint64_t v30 = sub_10000878C(&qword_10001C180);
  v31 = v42;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))( v42,  enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:),  v43);
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)(v30, v31, sub_1000133A0, &v33 - 4, v30);
}

uint64_t sub_10000B7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v34 = a1;
  uint64_t v31 = a2;
  uint64_t v35 = sub_10000878C(&qword_10001C198);
  uint64_t v32 = *(void *)(v35 - 8);
  uint64_t v3 = *(void *)(v32 + 64);
  __chkstk_darwin(v35);
  uint64_t v30 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for VideoPreview.Constraints(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v29 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for File(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_10000878C(&qword_10001C1A0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v31, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))( (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v33,  v4);
  uint64_t v15 = v32;
  os_log_type_t v16 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v30, v34, v35);
  uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = (v9 + v19 + v18) & ~v19;
  uint64_t v21 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v22 = (v6 + v21 + v20) & ~v21;
  uint64_t v23 = swift_allocObject(&unk_100018F68, v22 + v3, v17 | v19 | v21 | 7);
  *(void *)(v23 + 16) = 0LL;
  *(void *)(v23 + 24) = 0LL;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v23 + v18, v10, v27);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v23 + v20, v29, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23 + v22, v16, v35);
  uint64_t v24 = sub_1000131A8((uint64_t)v13, (uint64_t)&unk_10001C1B0, v23);
  return swift_release(v24);
}

uint64_t sub_10000B9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  uint64_t v7 = sub_10000878C(&qword_10001C198);
  v6[8] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[9] = v8;
  uint64_t v9 = *(void *)(v8 + 64);
  v6[10] = v9;
  v6[11] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for VideoPreview.Constraints(0LL);
  v6[12] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[13] = v11;
  uint64_t v12 = *(void *)(v11 + 64);
  v6[14] = v12;
  v6[15] = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Path(0LL);
  v6[16] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[17] = v14;
  v6[18] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for URL(0LL);
  v6[19] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v6[20] = v16;
  v6[21] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for File(0LL);
  v6[22] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v6[23] = v18;
  uint64_t v19 = *(void *)(v18 + 64);
  v6[24] = v19;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v6[25] = swift_task_alloc(v20);
  v6[26] = swift_task_alloc(v20);
  return swift_task_switch(sub_10000BB20, 0LL, 0LL);
}

uint64_t sub_10000BB20(uint64_t a1)
{
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[26];
  uint64_t v4 = v1[22];
  uint64_t v5 = v1[23];
  os_log_type_t v6 = static os_log_type_t.info.getter(a1);
  v1[27] = sub_100014B3C(0LL, (unint64_t *)&qword_10001C100, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v7 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  uint64_t v53 = *(void (**)(void))(v5 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v53)(v3, v2, v4);
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = v1[21];
    uint64_t v49 = v1[23];
    uint64_t v51 = v1[22];
    uint64_t v10 = v1[19];
    uint64_t v43 = v1[26];
    uint64_t v45 = v1[20];
    uint64_t v11 = v1[18];
    uint64_t v39 = v1[17];
    uint64_t v40 = v1[16];
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v47 = swift_slowAlloc(32LL, -1LL);
    uint64_t v54 = v47;
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v13 = File.path.getter();
    Path.fileURL.getter(v13);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v11, v40);
    uint64_t v14 = sub_100009BD8( &qword_10001C188,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter(v10, v14);
    unint64_t v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v9, v10);
    v1[4] = sub_1000133A8(v15, v17, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 4, v1 + 5, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v17);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v43, v51);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Task running for video: %{public}s)", v12, 0xCu);
    swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v47, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
    uint64_t v18 = v1[26];
    uint64_t v19 = v1[22];
    uint64_t v20 = v1[23];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  }

  uint64_t v21 = v1[23];
  uint64_t v46 = v1[22];
  uint64_t v48 = v1[25];
  uint64_t v22 = v1[15];
  uint64_t v42 = v1[24];
  uint64_t v44 = v1[14];
  uint64_t v24 = v1[12];
  uint64_t v23 = v1[13];
  uint64_t v25 = v1[11];
  uint64_t v41 = v1[10];
  uint64_t v26 = v1[8];
  uint64_t v27 = v1[9];
  uint64_t v50 = v26;
  uint64_t v52 = v25;
  uint64_t v29 = v1[6];
  uint64_t v28 = v1[7];
  v53();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v29, v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v28, v26);
  uint64_t v30 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v31 = (v30 + 16) & ~v30;
  uint64_t v32 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v33 = (v42 + v32 + v31) & ~v32;
  uint64_t v34 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v35 = (v44 + v34 + v33) & ~v34;
  uint64_t v36 = swift_allocObject(&unk_100018FB8, v35 + v41, v30 | v32 | v34 | 7);
  v1[28] = v36;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v36 + v31, v48, v46);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v36 + v33, v22, v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v36 + v35, v52, v50);
  uint64_t v37 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to File.withResource<A>(_:) + 1));
  v1[29] = v37;
  *uint64_t v37 = v1;
  v37[1] = sub_10000BE94;
  return File.withResource<A>(_:)();
}

uint64_t sub_10000BE94()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 232);
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_10000BF78;
  }

  else
  {
    swift_release(*(void *)(v2 + 224));
    uint64_t v4 = sub_10000BF00;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000BF00()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 88);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BF78()
{
  uint64_t v1 = swift_release(*(void *)(v0 + 224));
  os_log_type_t v2 = static os_log_type_t.error.getter(v1);
  uint64_t v3 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  os_log_type_t v4 = v2;
  if (os_log_type_enabled(v3, v2))
  {
    uint64_t v5 = *(void *)(v0 + 240);
    swift_errorRetain(v5);
    swift_errorRetain(v5);
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)os_log_type_t v6 = 138412290;
    swift_errorRetain(v5);
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(void *)(v0 + 24) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    *uint64_t v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Caught error: %@", v6, 0xCu);
    uint64_t v9 = sub_10000878C(&qword_10001C1D8);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 64);

  *(void *)(v0 + 16) = v10;
  AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 16, v11);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v14 = *(void *)(v0 + 144);
  uint64_t v15 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 88);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[134] = a4;
  v4[133] = a3;
  v4[132] = a2;
  uint64_t v5 = sub_10000878C(&qword_10001C180);
  v4[135] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000878C(&qword_10001C1E0);
  v4[136] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[137] = v7;
  v4[138] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for VideoPreview(0LL);
  v4[139] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[140] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[141] = swift_task_alloc(v10);
  v4[142] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for VideoPreview.AudioFormat(0LL);
  v4[143] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v4[144] = v12;
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[145] = swift_task_alloc(v13);
  v4[146] = swift_task_alloc(v13);
  uint64_t v14 = type metadata accessor for VideoPreview.VideoFormat(0LL);
  v4[147] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v4[148] = v15;
  unint64_t v16 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[149] = swift_task_alloc(v16);
  v4[150] = swift_task_alloc(v16);
  uint64_t v17 = sub_10000878C(&qword_10001C168);
  v4[151] = swift_task_alloc((*(void *)(*(void *)(v17 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for Image(0LL);
  v4[152] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v4[153] = v19;
  unint64_t v20 = (*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[154] = swift_task_alloc(v20);
  v4[155] = swift_task_alloc(v20);
  uint64_t v21 = type metadata accessor for AVAssetTrack.Info(0LL);
  v4[156] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v4[157] = v22;
  unint64_t v23 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[158] = swift_task_alloc(v23);
  v4[159] = swift_task_alloc(v23);
  uint64_t v24 = type metadata accessor for VideoPreview.MultiFrameConstraints(0LL);
  v4[160] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v4[161] = v25;
  unint64_t v26 = (*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[162] = swift_task_alloc(v26);
  v4[163] = swift_task_alloc(v26);
  v4[164] = swift_task_alloc(v26);
  v4[165] = swift_task_alloc(v26);
  v4[166] = swift_task_alloc(v26);
  uint64_t v27 = type metadata accessor for VideoPreview.SingleFrameConstraints(0LL);
  v4[167] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v4[168] = v28;
  v4[169] = swift_task_alloc((*(void *)(v28 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for VideoPreview.FrameConstraints(0LL);
  v4[170] = v29;
  uint64_t v30 = *(void *)(v29 - 8);
  v4[171] = v30;
  unint64_t v31 = (*(void *)(v30 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[172] = swift_task_alloc(v31);
  v4[173] = swift_task_alloc(v31);
  v4[174] = swift_task_alloc(v31);
  v4[175] = swift_task_alloc(v31);
  v4[176] = swift_task_alloc(v31);
  uint64_t v32 = type metadata accessor for URL(0LL);
  v4[177] = v32;
  uint64_t v33 = *(void *)(v32 - 8);
  v4[178] = v33;
  v4[179] = swift_task_alloc((*(void *)(v33 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = type metadata accessor for Path(0LL);
  v4[180] = v34;
  uint64_t v35 = *(void *)(v34 - 8);
  v4[181] = v35;
  v4[182] = swift_task_alloc((*(void *)(v35 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000C458, 0LL, 0LL);
}

uint64_t sub_10000C458()
{
  uint64_t v1 = v0[182];
  uint64_t v2 = v0[181];
  uint64_t v3 = v0[180];
  uint64_t v4 = v0[179];
  uint64_t v5 = v0[178];
  uint64_t v6 = v0[177];
  uint64_t v7 = File.path.getter();
  Path.fileURL.getter(v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v8 = sub_10000878C(&qword_10001C1E8);
  v0[183] = v8;
  uint64_t inited = swift_initStackObject(v8, v0 + 32);
  *(_OWORD *)(inited + 16) = xmmword_100015F20;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(AVAssetRequiresInProcessOperationKey);
  *(void *)(inited + 40) = v10;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(_BYTE *)(inited + 48) = 1;
  unint64_t v11 = sub_100012FD8(inited);
  id v12 = objc_allocWithZone(&OBJC_CLASS___AVURLAsset);
  URL._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  id v17 = [v12 initWithURL:v15 options:isa];
  v0[184] = v17;

  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  os_log_type_t v19 = static os_log_type_t.info.getter(v18);
  v0[185] = sub_100014B3C(0LL, (unint64_t *)&qword_10001C100, &OBJC_CLASS___OS_os_log_ptr);
  unint64_t v20 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  if (os_log_type_enabled(v20, v19))
  {
    id v21 = v17;
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v29 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v22 = 138543362;
    v0[129] = v21;
    id v30 = v17;
    id v23 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 129, v0 + 130, v22 + 4, v22 + 12);
    *uint64_t v29 = v21;

    id v17 = v30;
    _os_log_impl((void *)&_mh_execute_header, v20, v19, "Created asset: %{public}@", v22, 0xCu);
    uint64_t v24 = sub_10000878C(&qword_10001C1D8);
    swift_arrayDestroy(v29, 1LL, v24);
    swift_slowDealloc(v29, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  uint64_t v26 = static os_log_type_t.info.getter(v25);
  uint64_t v27 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
  os_log(_:dso:log:_:_:)( v26,  &_mh_execute_header,  v27,  "About to query for tracks",  25LL,  2LL,  &_swiftEmptyArrayStorage);

  v0[7] = v0 + 126;
  v0[2] = v0;
  v0[3] = sub_10000C7DC;
  v0[82] = swift_continuation_init(v0 + 2, 1LL);
  v0[78] = _NSConcreteStackBlock;
  v0[79] = 0x40000000LL;
  v0[80] = sub_100013100;
  v0[81] = &unk_100018FD0;
  [v17 loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v0 + 78];
  return swift_continuation_await(v0 + 2);
}

uint64_t sub_10000C7DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 1488LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000113BC;
  }
  else {
    uint64_t v2 = sub_10000C880;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000C880(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 1008);
  uint64_t v3 = static os_log_type_t.info.getter(a1);
  uint64_t v4 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, v4, "Queried for tracks", 18LL, 2LL, &_swiftEmptyArrayStorage);

  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v11 = v2;
    }
    else {
      uint64_t v11 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(v2);
    *(void *)(v1 + 1496) = v6;
    if (v5)
    {
LABEL_3:
      unint64_t v7 = v5 - 1;
      if (__OFSUB__(v5, 1LL))
      {
        __break(1u);
      }

      else if ((v2 & 0xC000000000000001LL) == 0)
      {
        if ((v7 & 0x8000000000000000LL) != 0)
        {
          __break(1u);
        }

        else if (v7 < *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10))
        {
          id v8 = *(id *)(v2 + 8 * v7 + 32);
LABEL_8:
          uint64_t v9 = v8;
          uint64_t v10 = swift_bridgeObjectRelease(v2);
          goto LABEL_14;
        }

        __break(1u);
      }

      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v2);
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v6 = v5;
    *(void *)(v1 + 1496) = v5;
    if (v5) {
      goto LABEL_3;
    }
  }

  uint64_t v10 = swift_bridgeObjectRelease(v2);
  uint64_t v9 = 0LL;
LABEL_14:
  *(void *)(v1 + 1504) = v9;
  os_log_type_t v12 = static os_log_type_t.info.getter(v10);
  unint64_t v13 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v14 = 134349056;
    *(void *)(v1 + 1048) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1048, v1 + 1056, v14 + 4, v14 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v12, "Tracks found: %{public}ld)", v14, 0xCu);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  uint64_t v15 = *(void **)(v1 + 1472);
  if (v9)
  {
    uint64_t v16 = *(void *)(v1 + 1408);
    uint64_t v17 = *(void *)(v1 + 1368);
    uint64_t v18 = *(void *)(v1 + 1360);
    os_log_type_t v19 = (void *)objc_opt_self(&OBJC_CLASS___PFVideoMetadata);
    id v20 = v9;
    id v21 = [v19 videoAssetIsSpatial:v15];
    *(_BYTE *)(v1 + 1804) = (_BYTE)v21;
    VideoPreview.Constraints.frameConstraints.getter(v21);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 88);
    *(void *)(v1 + 1512) = v22;
    int v23 = v22(v16, v18);
    *(_DWORD *)(v1 + 1780) = v23;
    int v24 = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
    *(_DWORD *)(v1 + 1784) = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
    if (v23 == v24)
    {
      uint64_t v25 = *(void *)(v1 + 1408);
      uint64_t v26 = *(void *)(v1 + 1360);
      uint64_t v27 = *(void *)(v1 + 1352);
      uint64_t v28 = *(void *)(v1 + 1344);
      uint64_t v29 = *(void *)(v1 + 1336);
      id v30 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 1368) + 96LL);
      *(void *)(v1 + 1520) = v30;
      v30(v25, v26);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v27, v25, v29);
      sub_10000878C(&qword_10001C220);
      uint64_t v31 = static AVPartialAsyncProperty<A>.naturalSize.getter();
      *(void *)(v1 + 1528) = v31;
      uint64_t v32 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
      *(void *)(v1 + 1536) = v32;
      *uint64_t v32 = v1;
      v32[1] = sub_10000D0EC;
      return AVAsynchronousKeyValueLoading.load<A>(_:)(v1 + 936, v31);
    }

    if (v23 == enum case for VideoPreview.FrameConstraints.multiFrame(_:))
    {
      uint64_t v37 = *(void *)(v1 + 1408);
      uint64_t v38 = *(void *)(v1 + 1328);
      uint64_t v39 = *(void *)(v1 + 1320);
      uint64_t v40 = *(void *)(v1 + 1288);
      uint64_t v41 = *(void *)(v1 + 1280);
      uint64_t v42 = *(void (**)(uint64_t, void))(*(void *)(v1 + 1368) + 96LL);
      v42(v37, *(void *)(v1 + 1360));
      uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v38, v37, v41);
      uint64_t v44 = VideoPreview.MultiFrameConstraints.targetPixelWidth.getter(v43);
      uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v39, v38, v41);
      uint64_t v46 = *(void *)(v1 + 1320);
      uint64_t v47 = *(void *)(v1 + 1288);
      uint64_t v48 = *(void *)(v1 + 1280);
      if (v44 < 1)
      {
        uint64_t v50 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8);
        v50(*(void *)(v1 + 1320), *(void *)(v1 + 1280));
      }

      else
      {
        uint64_t v49 = VideoPreview.MultiFrameConstraints.targetPixelHeight.getter(v45);
        uint64_t v50 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8);
        uint64_t v51 = v50(v46, v48);
        if (v49 > 0)
        {
          uint64_t v52 = *(void *)(v1 + 1328);
          uint64_t v53 = *(void *)(v1 + 1280);
          uint64_t v54 = VideoPreview.MultiFrameConstraints.targetPixelWidth.getter(v51);
          uint64_t v55 = VideoPreview.MultiFrameConstraints.targetPixelHeight.getter(v54);
          double v56 = (double)v54;
          double v57 = (double)v55;
          uint64_t v58 = VideoPreview.MultiFrameConstraints.frameLimit.getter(v55);
          v50(v52, v53);
          *(double *)(v1 + 1616) = v56;
          *(double *)(v1 + 1608) = v57;
          *(void *)(v1 + 1600) = v58;
          *(void *)(v1 + 1592) = v42;
          uint64_t v59 = (void *)swift_task_alloc(async function pointer to AVAssetTrack.info.getter[1]);
          *(void *)(v1 + 1624) = v59;
          *uint64_t v59 = v1;
          v59[1] = sub_10000D5C0;
          return AVAssetTrack.info.getter(*(void *)(v1 + 1272));
        }
      }

      uint64_t v67 = *(void **)(v1 + 1472);
      uint64_t v68 = *(void *)(v1 + 1328);
      uint64_t v69 = *(void *)(v1 + 1280);
      uint64_t v70 = type metadata accessor for Explosion(0LL);
      uint64_t v71 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
      swift_allocError(v70, v71, 0LL, 0LL);
      uint64_t v72 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0xD00000000000001CLL,  0x8000000100015B20LL,  0xD000000000000014LL,  0x80000001000161A0LL);
      swift_willThrow(v72);

      v50(v68, v69);
    }

    else
    {
      uint64_t v60 = *(void **)(v1 + 1472);
      uint64_t v61 = *(void *)(v1 + 1408);
      uint64_t v62 = *(void *)(v1 + 1368);
      uint64_t v63 = *(void *)(v1 + 1360);
      uint64_t v64 = type metadata accessor for Explosion(0LL);
      uint64_t v65 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
      swift_allocError(v64, v65, 0LL, 0LL);
      uint64_t v66 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0xD000000000000016LL,  0x8000000100015B00LL,  0xD000000000000014LL,  0x80000001000161A0LL);
      swift_willThrow(v66);

      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
    }
  }

  else
  {
    uint64_t v34 = type metadata accessor for Explosion(0LL);
    uint64_t v35 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v34, v35, 0LL, 0LL);
    uint64_t v36 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x546F656469566F4ELL,  0xED0000736B636172LL,  0xD000000000000014LL,  0x80000001000161A0LL);
    swift_willThrow(v36);
  }

  uint64_t v73 = *(void *)(v1 + 1432);
  uint64_t v74 = *(void *)(v1 + 1408);
  uint64_t v75 = *(void *)(v1 + 1400);
  uint64_t v76 = *(void *)(v1 + 1392);
  uint64_t v77 = *(void *)(v1 + 1384);
  uint64_t v78 = *(void *)(v1 + 1376);
  uint64_t v79 = *(void *)(v1 + 1352);
  uint64_t v80 = *(void *)(v1 + 1328);
  uint64_t v81 = *(void *)(v1 + 1320);
  uint64_t v82 = *(void *)(v1 + 1312);
  uint64_t v83 = *(void *)(v1 + 1304);
  uint64_t v84 = *(void *)(v1 + 1296);
  uint64_t v85 = *(void *)(v1 + 1272);
  uint64_t v86 = *(void *)(v1 + 1264);
  uint64_t v87 = *(void *)(v1 + 1240);
  uint64_t v88 = *(void *)(v1 + 1232);
  uint64_t v89 = *(void *)(v1 + 1208);
  uint64_t v90 = *(void *)(v1 + 1200);
  uint64_t v91 = *(void *)(v1 + 1192);
  uint64_t v92 = *(void *)(v1 + 1168);
  uint64_t v93 = *(void *)(v1 + 1160);
  uint64_t v94 = *(void *)(v1 + 1136);
  uint64_t v95 = *(void *)(v1 + 1128);
  uint64_t v96 = *(void *)(v1 + 1104);
  uint64_t v97 = *(void *)(v1 + 1080);
  swift_task_dealloc(*(void *)(v1 + 1456));
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000D0EC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1536);
  *(void *)(*v1 + 1544) = v0;
  swift_task_dealloc(v3);
  swift_release(*(void *)(v2 + 1528));
  if (v0) {
    uint64_t v4 = sub_1000115A0;
  }
  else {
    uint64_t v4 = sub_10000D1A4;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000D1A4()
{
  *(_OWORD *)(v0 + 1552) = *(_OWORD *)(v0 + 936);
  sub_10000878C(&qword_10001C228);
  uint64_t v1 = static AVPartialAsyncProperty<A>.preferredTransform.getter();
  *(void *)(v0 + 1568) = v1;
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
  *(void *)(v0 + 1576) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10000D25C;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 528, v1);
}

uint64_t sub_10000D25C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1576);
  *(void *)(*v1 + 1584) = v0;
  swift_task_dealloc(v3);
  swift_release(*(void *)(v2 + 1568));
  if (v0) {
    uint64_t v4 = sub_1000117A4;
  }
  else {
    uint64_t v4 = sub_10000D314;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000D314()
{
  uint64_t v1 = *(void *)(v0 + 1560);
  uint64_t v2 = *(void *)(v0 + 1552);
  __int128 v3 = *(_OWORD *)(v0 + 544);
  __int128 v4 = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 528);
  *(_OWORD *)(v0 + 448) = v3;
  *(_OWORD *)(v0 + 464) = v4;
  uint64_t v5 = 0LL;
  *(void *)&__int128 v3 = 0LL;
  CGRect v34 = CGRectApplyAffineTransform(*(CGRect *)(&v1 - 3), (CGAffineTransform *)(v0 + 432));
  double width = v34.size.width;
  double height = v34.size.height;
  uint64_t v8 = VideoPreview.SingleFrameConstraints.maxPixelDimension.getter((__n128)v34.origin, *(__n128 *)&v34.origin.y);
  double v9 = (double)v8;
  double v10 = fmin(width / height, 1.77777778);
  if (width / height < 0.75) {
    double v11 = 0.75;
  }
  else {
    double v11 = v10;
  }
  double v12 = ceil(v9 / v11);
  if (height == 0.0 || width == 0.0)
  {
    os_log_type_t v14 = static os_log_type_t.info.getter(v8);
    uint64_t v15 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
    os_log_type_t v16 = v14;
    BOOL v17 = os_log_type_enabled(v15, v14);
    uint64_t v18 = *(void *)(v0 + 1352);
    uint64_t v19 = *(void *)(v0 + 1344);
    uint64_t v20 = *(void *)(v0 + 1336);
    if (v17)
    {
      uint64_t v32 = *(void *)(v0 + 1352);
      id v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      uint64_t v33 = v22;
      *(_DWORD *)id v21 = 136315138;
      *(double *)(v0 + 952) = v9;
      *(double *)(v0 + 960) = v12;
      type metadata accessor for CGSize(0LL);
      uint64_t v24 = String.init<A>(describing:)(v0 + 952, v23);
      unint64_t v26 = v25;
      *(void *)(v0 + 1040) = sub_1000133A8(v24, v25, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1040, v0 + 1048, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease(v26);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "video size is zero, falling back to maxPtSize: %s",  v21,  0xCu);
      swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);

      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      uint64_t v28 = v32;
    }

    else
    {

      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      uint64_t v28 = v18;
    }

    v27(v28, v20);
  }

  else
  {
    double v13 = v9 / width;
    if (v9 / width <= v12 / height) {
      double v13 = v12 / height;
    }
    double v9 = ceil(width * v13);
    double v12 = ceil(height * v13);
    (*(void (**)(void, void))(*(void *)(v0 + 1344) + 8LL))( *(void *)(v0 + 1352),  *(void *)(v0 + 1336));
  }

  uint64_t v29 = *(void *)(v0 + 1520);
  *(double *)(v0 + 1616) = v9;
  *(double *)(v0 + 1608) = v12;
  *(void *)(v0 + 1600) = 0LL;
  *(void *)(v0 + 1592) = v29;
  id v30 = (void *)swift_task_alloc(async function pointer to AVAssetTrack.info.getter[1]);
  *(void *)(v0 + 1624) = v30;
  *id v30 = v0;
  v30[1] = sub_10000D5C0;
  return AVAssetTrack.info.getter(*(void *)(v0 + 1272));
}

uint64_t sub_10000D5C0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 1624LL);
  *(void *)(*(void *)v1 + 1632LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    __int128 v3 = sub_1000119A8;
  }
  else {
    __int128 v3 = sub_10000D668;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000D668(uint64_t a1)
{
  os_log_type_t v2 = static os_log_type_t.info.getter(a1);
  __int128 v3 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
  os_log_type_t v4 = v2;
  if (os_log_type_enabled(v3, v2))
  {
    double v5 = *(double *)(v1 + 1616);
    double v6 = *(double *)(v1 + 1608);
    uint64_t v7 = swift_slowAlloc(22LL, -1LL);
    uint64_t v8 = swift_slowAlloc(64LL, -1LL);
    uint64_t v19 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = Double.description.getter(v5);
    unint64_t v11 = v10;
    *(void *)(v1 + 992) = sub_1000133A8(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 992, v1 + 1000, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v12 = Double.description.getter(v6);
    unint64_t v14 = v13;
    *(void *)(v1 + 1000) = sub_1000133A8(v12, v13, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1000, v1 + 1008, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "thumbnailFitPxSize: %s x %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  uint64_t v15 = async function pointer to AVAsset.isAutoLoop.getter[1];
  id v16 = *(id *)(v1 + 1472);
  BOOL v17 = (void *)swift_task_alloc(v15);
  *(void *)(v1 + 1640) = v17;
  void *v17 = v1;
  v17[1] = sub_10000D850;
  return AVAsset.isAutoLoop.getter();
}

uint64_t sub_10000D850(char a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 1640);
  *(_BYTE *)(v3 + 1805) = a1;
  *(void *)(v3 + 1648) = v1;
  swift_task_dealloc(v4);
  if (v1)
  {

    double v5 = sub_100011B90;
  }

  else
  {
    double v5 = sub_10000D914;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_10000D914()
{
  uint64_t v1 = *(void **)(v0 + 1472);

  id v2 = objc_allocWithZone(&OBJC_CLASS___AVAssetReader);
  *(void *)(v0 + 1024) = 0LL;
  id v3 = [v2 initWithAsset:v1 error:v0 + 1024];
  *(void *)(v0 + 1656) = v3;
  uint64_t v4 = *(void **)(v0 + 1024);
  if (!v3)
  {
    uint64_t v49 = *(void **)(v0 + 1504);
    uint64_t v50 = *(void **)(v0 + 1472);
    uint64_t v51 = *(void *)(v0 + 1272);
    uint64_t v52 = *(void *)(v0 + 1256);
    uint64_t v53 = *(void *)(v0 + 1248);
    id v54 = v4;
    _convertNSErrorToError(_:)(v4);

    swift_willThrow(v55);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);

    goto LABEL_62;
  }

  uint64_t v5 = *(void *)(v0 + 1616);
  double v6 = *(void **)(v0 + 1472);
  uint64_t v7 = *(void *)(v0 + 1464);
  id v8 = v4;

  uint64_t inited = swift_initStackObject(v7, v0 + 80);
  *(_OWORD *)(inited + 16) = xmmword_1000161B0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCVPixelBufferPixelFormatTypeKey);
  *(void *)(inited + 40) = v10;
  *(void *)(inited + 72) = sub_10000878C(&qword_10001C1F0);
  *(void *)(inited + 48) = &off_100018B50;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCVPixelBufferWidthKey);
  *(void *)(inited + 88) = v11;
  if ((~v5 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_73;
  }

  double v12 = *(double *)(v0 + 1616);
  if (v12 <= -9.22337204e18)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }

  if (v12 >= 9.22337204e18)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }

  uint64_t v13 = *(void *)(v0 + 1608);
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = (uint64_t)v12;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCVPixelBufferHeightKey);
  *(void *)(inited + 136) = v14;
  if ((~v13 & 0x7FF0000000000000LL) == 0)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }

  double v15 = *(double *)(v0 + 1608);
  if (v15 <= -9.22337204e18)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }

  if (v15 >= 9.22337204e18)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
  }

  id v16 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v17 = *(void *)(v0 + 1400);
  uint64_t v18 = *(void *)(v0 + 1360);
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = (uint64_t)v15;
  unint64_t v19 = sub_100012FD8(inited);
  VideoPreview.Constraints.frameConstraints.getter(v19);
  int v20 = v16(v17, v18);
  int v21 = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  *(_DWORD *)(v0 + 1788) = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  uint64_t v22 = *(void *)(v0 + 1360);
  if (v20 == v21)
  {
    uint64_t v23 = *(void *)(v0 + 1400);
    uint64_t v24 = *(void *)(v0 + 1312);
    uint64_t v25 = *(void *)(v0 + 1288);
    uint64_t v26 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, uint64_t))(v0 + 1592))(v23, v22);
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v24, v23, v26);
    uint64_t v28 = VideoPreview.MultiFrameConstraints.framesPerSync.getter(v27);
    if (v28 >= 1)
    {
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(AVVideoEmitSequencesAtSyncFramesOnly);
      uint64_t v31 = v30;
      uint64_t v32 = VideoPreview.MultiFrameConstraints.framesPerSync.getter(v29);
      *(void *)(v0 + 784) = &type metadata for Int;
      *(void *)(v0 + 760) = v32;
      sub_100013EF8((_OWORD *)(v0 + 760), (_OWORD *)(v0 + 728));
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v19);
      v281[0] = v19;
      sub_100014550((_OWORD *)(v0 + 728), v29, v31, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease(0x8000000000000000LL);
      uint64_t v28 = swift_bridgeObjectRelease(v31);
    }

    *(void *)(v0 + 1664) = v19;
    uint64_t v34 = *(void *)(v0 + 1312);
    uint64_t v35 = *(void *)(v0 + 1304);
    uint64_t v36 = *(void *)(v0 + 1288);
    uint64_t v37 = *(void *)(v0 + 1280);
    uint64_t v38 = VideoPreview.MultiFrameConstraints.frameLimit.getter(v28);
    uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v34, v37);
    uint64_t v40 = *(void *)(v0 + 1304);
    uint64_t v41 = *(void *)(v0 + 1288);
    uint64_t v42 = *(void *)(v0 + 1280);
    if (v38 < 1)
    {
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v44(*(void *)(v0 + 1304), *(void *)(v0 + 1280));
    }

    else
    {
      char v43 = VideoPreview.MultiFrameConstraints.uniformSampling.getter(v39);
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      *(void *)(v0 + 1672) = v44;
      v44(v40, v42);
      if ((v43 & 1) != 0)
      {
        sub_10000878C(&qword_10001C210);
        uint64_t v45 = static AVPartialAsyncProperty<A>.duration.getter();
        *(void *)(v0 + 1680) = v45;
        uint64_t v46 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
        *(void *)(v0 + 1688) = v46;
        void *v46 = v0;
        v46[1] = sub_10000ECF4;
        uint64_t v47 = v0 + 888;
        uint64_t v48 = v45;
        return AVAsynchronousKeyValueLoading.load<A>(_:)(v47, v48);
      }
    }

    v44(*(void *)(v0 + 1312), *(void *)(v0 + 1280));
  }

  else
  {
    (*(void (**)(void, uint64_t))(*(void *)(v0 + 1368) + 8LL))(*(void *)(v0 + 1400), v22);
  }

  *(void *)(v0 + 1704) = v19;
  int v56 = *(_DWORD *)(v0 + 1788);
  double v57 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v58 = *(void **)(v0 + 1504);
  uint64_t v59 = *(void *)(v0 + 1392);
  uint64_t v60 = *(void *)(v0 + 1360);
  id v61 = objc_allocWithZone(&OBJC_CLASS___AVAssetReaderTrackOutput);
  id v62 = v58;
  swift_bridgeObjectRetain(v19);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  id v64 = [v61 initWithTrack:v62 outputSettings:isa];
  *(void *)(v0 + 1712) = v64;

  VideoPreview.Constraints.frameConstraints.getter(v65);
  int v66 = v57(v59, v60);
  uint64_t v67 = *(void *)(v0 + 1360);
  if (v66 == v56)
  {
    uint64_t v68 = *(void *)(v0 + 1392);
    uint64_t v69 = *(void *)(v0 + 1296);
    uint64_t v70 = *(void *)(v0 + 1288);
    uint64_t v71 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, uint64_t))(v0 + 1592))(v68, v67);
    uint64_t v72 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v69, v68, v71);
    id v73 = [v64 setAppliesPreferredTrackTransform:VideoPreview.MultiFrameConstraints.appliesPreferredTrackTransform.getter(v72) & 1];
    (*(void (**)(void, void))(*(void *)(v0 + 1288) + 8LL))( *(void *)(v0 + 1296),  *(void *)(v0 + 1280));
  }

  else
  {
    (*(void (**)(void, uint64_t))(*(void *)(v0 + 1368) + 8LL))(*(void *)(v0 + 1392), v67);
    [v64 setAppliesPreferredTrackTransform:1];
  }

  uint64_t v74 = *(void **)(v0 + 1656);
  int v75 = *(_DWORD *)(v0 + 1784);
  uint64_t v76 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v77 = *(void *)(v0 + 1384);
  uint64_t v78 = *(void *)(v0 + 1368);
  uint64_t v79 = *(void *)(v0 + 1360);
  [v64 setAlwaysCopiesSampleData:0];
  VideoPreview.Constraints.frameConstraints.getter([v74 addOutput:v64]);
  int v80 = v76(v77, v79);
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
  if (v80 == v75)
  {
    sub_10000878C(&qword_10001C200);
    uint64_t v81 = static AVPartialAsyncProperty<A>.nominalFrameRate.getter();
    *(void *)(v0 + 1720) = v81;
    uint64_t v82 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
    *(void *)(v0 + 1728) = v82;
    *uint64_t v82 = v0;
    v82[1] = sub_100010008;
    uint64_t v47 = v0 + 1776;
    uint64_t v48 = v81;
    return AVAsynchronousKeyValueLoading.load<A>(_:)(v47, v48);
  }

  uint64_t v84 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1656) startReading];
  *(void *)(v0 + 1016) = 0LL;
  id v85 = [v84 copyNextSampleBuffer];
  if (v85)
  {
    id v86 = v85;
    uint64_t v87 = *(void *)(v0 + 1600);
    int v88 = *(_DWORD *)(v0 + 1784);
    int v89 = *(_DWORD *)(v0 + 1780);
    uint64_t v90 = (opaqueCMSampleBuffer *)v85;
    v210 = (uint64_t *)(v0 + 1016);
    swift_beginAccess(v0 + 1016, v0 + 840, 1LL, 0LL);
    uint64_t v91 = *(void *)(v0 + 1016);
    if (v89 == v88 || v91 != v87)
    {
      uint64_t v209 = *(void *)(v0 + 1368);
      uint64_t v208 = *(void *)(v0 + 1256);
      uint64_t v270 = *(void *)(v0 + 1184);
      uint64_t v273 = *(void *)(v0 + 1224);
      uint64_t v267 = *(void *)(v0 + 1152);
      uint64_t v206 = *(void *)(v0 + 1096);
      uint64_t v207 = *(void *)(v0 + 1120);
      uint64_t v92 = v86;
      while (1)
      {
        if (!CMSampleBufferGetNumSamples(v90))
        {
          uint64_t v93 = *(void *)(v0 + 1600);
          int v94 = *(_DWORD *)(v0 + 1784);
          int v95 = *(_DWORD *)(v0 + 1780);

          uint64_t v91 = *(void *)(v0 + 1016);
          uint64_t v96 = v92;
          uint64_t v97 = v96;
          if (v95 != v94 && v91 == v93)
          {
            id v86 = v92;
            uint64_t v90 = v96;
            break;
          }

          if (!CMSampleBufferGetNumSamples(v96))
          {
            while (1)
            {
              uint64_t v99 = *(void *)(v0 + 1600);
              int v100 = *(_DWORD *)(v0 + 1784);
              int v101 = *(_DWORD *)(v0 + 1780);

              uint64_t v91 = *(void *)(v0 + 1016);
              uint64_t v102 = v97;
              uint64_t v90 = v102;
              if (v101 != v100 && v91 == v99) {
                break;
              }
              if (CMSampleBufferGetNumSamples(v102)) {
                goto LABEL_42;
              }
            }

            id v86 = v92;
            break;
          }

          uint64_t v90 = v97;
        }

LABEL_42:
        uint64_t v104 = CMSampleBufferRef.imageBuffer.getter();
        if (!v104)
        {
          v181 = *(void **)(v0 + 1712);
          v182 = *(void **)(v0 + 1656);
          v183 = *(void **)(v0 + 1504);
          v184 = v92;
          v185 = *(void **)(v0 + 1472);
          uint64_t v186 = *(void *)(v0 + 1256);
          uint64_t v276 = *(void *)(v0 + 1248);
          uint64_t v280 = *(void *)(v0 + 1272);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v187 = type metadata accessor for Explosion(0LL);
          uint64_t v188 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
          swift_allocError(v187, v188, 0LL, 0LL);
          uint64_t v189 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x426567616D496F4ELL,  0xED00007265666675LL,  0xD000000000000014LL,  0x80000001000161A0LL);
          swift_willThrow(v189);

          (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v280, v276);
          goto LABEL_62;
        }

        v105 = (void *)v104;
        v263 = v92;
        v277 = v90;
        os_log_type_t v106 = static os_log_type_t.info.getter(v104);
        double v107 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
        if (os_log_type_enabled(v107, v106))
        {
          uint64_t v108 = swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v108 = 134217984;
          uint64_t v91 = *v210;
          *(void *)(v108 + 4) = *v210;
          _os_log_impl( (void *)&_mh_execute_header,  v107,  v106,  "BlastDoor processing thumbnail %ld",  (uint8_t *)v108,  0xCu);
          swift_slowDealloc(v108, -1LL, -1LL);
        }

        unsigned int v237 = *(unsigned __int8 *)(v0 + 1805);
        int v258 = *(_DWORD *)(v0 + 1784);
        v253 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
        unsigned int v241 = *(unsigned __int8 *)(v0 + 1804);
        uint64_t v233 = *(void *)(v0 + 1496);
        uint64_t v245 = *(void *)(v0 + 1376);
        uint64_t v249 = *(void *)(v0 + 1360);
        uint64_t v109 = *(void *)(v0 + 1272);
        uint64_t v110 = *(void *)(v0 + 1264);
        uint64_t v111 = *(void *)(v0 + 1248);
        uint64_t v112 = *(void *)(v0 + 1240);
        uint64_t v213 = *(void *)(v0 + 1232);
        uint64_t v214 = *(void *)(v0 + 1216);
        uint64_t v113 = *(void *)(v0 + 1208);
        uint64_t v114 = *(void *)(v0 + 1200);
        uint64_t v215 = *(void *)(v0 + 1192);
        uint64_t v217 = *(void *)(v0 + 1176);
        uint64_t v212 = *(void *)(v0 + 1168);
        uint64_t v219 = *(void *)(v0 + 1160);
        uint64_t v223 = *(void *)(v0 + 1144);

        uint64_t v115 = CMSampleBufferRef.presentationTimeStamp.getter();
        double v116 = CMTime.seconds.getter(v115);
        type metadata accessor for CVBuffer(0LL);
        v281[3] = v117;
        v281[4] = &protocol witness table for CVBufferRef;
        v281[0] = v105;
        uint64_t v118 = type metadata accessor for Image.Encoding(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v118 - 8) + 56LL))( v113,  1LL,  1LL,  v118);
        id v119 = v105;
        Image.init(provider:maxPixelDimension:enforcedEncoding:)(v281, 0LL, 1LL, v113);
        v120 = *(void (**)(uint64_t, uint64_t, uint64_t))(v208 + 16);
        v120(v110, v109, v111);
        VideoPreview.VideoFormat.init(trackInfo:)(v110);
        v120(v110, v109, v111);
        VideoPreview.AudioFormat.init(trackInfo:)(v110);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v273 + 16))(v213, v112, v214);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v270 + 16))(v215, v114, v217);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v267 + 16))(v219, v212, v223);
        uint64_t v121 = VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)( v213,  v237,  v91,  v233,  v215,  v219,  v241,  v116);
        VideoPreview.Constraints.frameConstraints.getter(v121);
        int v122 = v253(v245, v249);
        v123 = *(void **)(v0 + 1712);
        v211 = v119;
        if (v122 == v258)
        {
          v218 = *(void **)(v0 + 1656);
          v222 = *(void **)(v0 + 1504);
          v226 = *(void **)(v0 + 1472);
          uint64_t v190 = *(void *)(v0 + 1376);
          uint64_t v191 = *(void *)(v0 + 1360);
          uint64_t v262 = *(void *)(v0 + 1272);
          uint64_t v252 = *(void *)(v0 + 1256);
          uint64_t v257 = *(void *)(v0 + 1248);
          uint64_t v244 = *(void *)(v0 + 1216);
          uint64_t v248 = *(void *)(v0 + 1240);
          uint64_t v236 = *(void *)(v0 + 1176);
          uint64_t v240 = *(void *)(v0 + 1200);
          uint64_t v229 = *(void *)(v0 + 1144);
          uint64_t v232 = *(void *)(v0 + 1168);
          uint64_t v192 = *(void *)(v0 + 1136);
          uint64_t v193 = *(void *)(v0 + 1128);
          uint64_t v194 = *(void *)(v0 + 1112);
          uint64_t v195 = *(void *)(v0 + 1104);
          uint64_t v196 = *(void *)(v0 + 1080);
          uint64_t v216 = *(void *)(v0 + 1088);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v197 = (*(uint64_t (**)(uint64_t, uint64_t))(v209 + 8))(v190, v191);
          uint64_t v198 = static os_log_type_t.info.getter(v197);
          v199 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
          os_log(_:dso:log:_:_:)( v198,  &_mh_execute_header,  v199,  "This was a single frame request - handling continuation",  55LL,  2LL,  &_swiftEmptyArrayStorage);

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v207 + 16))(v193, v192, v194);
          uint64_t v200 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
          SessionSchemaResult.init(_:lastResult:)(v193, 1LL, v194, v200);
          uint64_t v201 = sub_10000878C(&qword_10001C198);
          AsyncThrowingStream.Continuation.yield(_:)(v196, v201);
          (*(void (**)(uint64_t, uint64_t))(v206 + 8))(v195, v216);
          *(void *)(v0 + 968) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 968, v201);

          (*(void (**)(uint64_t, uint64_t))(v207 + 8))(v192, v194);
          (*(void (**)(uint64_t, uint64_t))(v267 + 8))(v232, v229);
          (*(void (**)(uint64_t, uint64_t))(v270 + 8))(v240, v236);
          (*(void (**)(uint64_t, uint64_t))(v273 + 8))(v248, v244);
          (*(void (**)(uint64_t, uint64_t))(v252 + 8))(v262, v257);
          goto LABEL_66;
        }

        (*(void (**)(void, void))(v209 + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
        id v86 = [v123 copyNextSampleBuffer];

        uint64_t v124 = *(void *)(v0 + 1016);
        BOOL v125 = __OFADD__(v124, 1LL);
        uint64_t v126 = v124 + 1;
        if (v125) {
          goto LABEL_78;
        }
        uint64_t *v210 = v126;
        if (v86) {
          BOOL v128 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v126 == *(void *)(v0 + 1600);
        }
        else {
          BOOL v128 = 1LL;
        }
        uint64_t v129 = *(void *)(v0 + 1128);
        uint64_t v130 = *(void *)(v0 + 1112);
        uint64_t v131 = *(void *)(v0 + 1104);
        uint64_t v132 = *(void *)(v0 + 1088);
        uint64_t v133 = *(void *)(v0 + 1080);
        (*(void (**)(uint64_t, void, uint64_t))(v207 + 16))(v129, *(void *)(v0 + 1136), v130);
        uint64_t v134 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
        SessionSchemaResult.init(_:lastResult:)(v129, v128, v130, v134);
        uint64_t v135 = sub_10000878C(&qword_10001C198);
        AsyncThrowingStream.Continuation.yield(_:)(v133, v135);
        (*(void (**)(uint64_t, uint64_t))(v206 + 8))(v131, v132);
        uint64_t v136 = *(void *)(v0 + 1240);
        uint64_t v259 = *(void *)(v0 + 1200);
        uint64_t v264 = *(void *)(v0 + 1216);
        uint64_t v254 = *(void *)(v0 + 1176);
        uint64_t v137 = *(void *)(v0 + 1168);
        uint64_t v138 = *(void *)(v0 + 1144);
        uint64_t v139 = *(void *)(v0 + 1136);
        uint64_t v140 = *(void *)(v0 + 1112);
        if (v128)
        {
          *(void *)(v0 + 976) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 976, v135);
        }

        (*(void (**)(uint64_t, uint64_t))(v207 + 8))(v139, v140);
        (*(void (**)(uint64_t, uint64_t))(v267 + 8))(v137, v138);
        (*(void (**)(uint64_t, uint64_t))(v270 + 8))(v259, v254);
        (*(void (**)(uint64_t, uint64_t))(v273 + 8))(v136, v264);
        if (!v86)
        {
          v202 = *(void **)(v0 + 1712);
          uint64_t v203 = *(void *)(v0 + 1704);
          v204 = *(void **)(v0 + 1504);
          v205 = *(void **)(v0 + 1472);
          uint64_t v169 = *(void *)(v0 + 1272);
          uint64_t v170 = *(void *)(v0 + 1256);
          uint64_t v171 = *(void *)(v0 + 1248);

          swift_bridgeObjectRelease(v203);
          goto LABEL_65;
        }

        uint64_t v141 = *(void *)(v0 + 1600);
        int v142 = *(_DWORD *)(v0 + 1784);
        int v143 = *(_DWORD *)(v0 + 1780);
        uint64_t v91 = *(void *)(v0 + 1016);
        uint64_t v90 = (opaqueCMSampleBuffer *)v86;
        uint64_t v92 = v86;
        if (v143 != v142)
        {
          uint64_t v92 = v86;
          if (v91 == v141) {
            break;
          }
        }
      }
    }

    v164 = *(void **)(v0 + 1712);
    uint64_t v165 = *(void *)(v0 + 1704);
    v166 = v90;
    uint64_t v167 = *(void **)(v0 + 1504);
    v168 = *(void **)(v0 + 1472);
    uint64_t v169 = *(void *)(v0 + 1272);
    uint64_t v170 = *(void *)(v0 + 1256);
    uint64_t v171 = *(void *)(v0 + 1248);

    swift_bridgeObjectRelease(v165);
LABEL_65:
    (*(void (**)(uint64_t, uint64_t))(v170 + 8))(v169, v171);
LABEL_66:
    uint64_t v172 = *(void *)(v0 + 1432);
    uint64_t v173 = *(void *)(v0 + 1408);
    uint64_t v174 = *(void *)(v0 + 1400);
    uint64_t v175 = *(void *)(v0 + 1392);
    uint64_t v176 = *(void *)(v0 + 1384);
    uint64_t v177 = *(void *)(v0 + 1376);
    uint64_t v178 = *(void *)(v0 + 1352);
    uint64_t v179 = *(void *)(v0 + 1328);
    uint64_t v180 = *(void *)(v0 + 1320);
    uint64_t v221 = *(void *)(v0 + 1312);
    uint64_t v225 = *(void *)(v0 + 1304);
    uint64_t v228 = *(void *)(v0 + 1296);
    uint64_t v231 = *(void *)(v0 + 1272);
    uint64_t v235 = *(void *)(v0 + 1264);
    uint64_t v239 = *(void *)(v0 + 1240);
    uint64_t v243 = *(void *)(v0 + 1232);
    uint64_t v247 = *(void *)(v0 + 1208);
    uint64_t v251 = *(void *)(v0 + 1200);
    uint64_t v256 = *(void *)(v0 + 1192);
    uint64_t v261 = *(void *)(v0 + 1168);
    uint64_t v266 = *(void *)(v0 + 1160);
    uint64_t v269 = *(void *)(v0 + 1136);
    uint64_t v272 = *(void *)(v0 + 1128);
    uint64_t v275 = *(void *)(v0 + 1104);
    uint64_t v279 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v172);
    swift_task_dealloc(v173);
    swift_task_dealloc(v174);
    swift_task_dealloc(v175);
    swift_task_dealloc(v176);
    swift_task_dealloc(v177);
    swift_task_dealloc(v178);
    swift_task_dealloc(v179);
    swift_task_dealloc(v180);
    swift_task_dealloc(v221);
    swift_task_dealloc(v225);
    swift_task_dealloc(v228);
    swift_task_dealloc(v231);
    swift_task_dealloc(v235);
    swift_task_dealloc(v239);
    swift_task_dealloc(v243);
    swift_task_dealloc(v247);
    swift_task_dealloc(v251);
    swift_task_dealloc(v256);
    swift_task_dealloc(v261);
    swift_task_dealloc(v266);
    swift_task_dealloc(v269);
    swift_task_dealloc(v272);
    swift_task_dealloc(v275);
    swift_task_dealloc(v279);
    uint64_t v163 = *(uint64_t (**)(void))(v0 + 8);
    return v163();
  }

  v144 = *(void **)(v0 + 1712);
  v145 = *(void **)(v0 + 1656);
  uint64_t v146 = *(void **)(v0 + 1504);
  char v147 = *(void **)(v0 + 1472);
  uint64_t v148 = *(void *)(v0 + 1272);
  uint64_t v149 = *(void *)(v0 + 1256);
  uint64_t v150 = *(void *)(v0 + 1248);
  swift_bridgeObjectRelease(*(void *)(v0 + 1704));
  uint64_t v151 = type metadata accessor for Explosion(0LL);
  uint64_t v152 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
  swift_allocError(v151, v152, 0LL, 0LL);
  uint64_t v153 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x73656D6172466F4ELL,  0xE800000000000000LL,  0xD000000000000014LL,  0x80000001000161A0LL);
  swift_willThrow(v153);

  (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v148, v150);
LABEL_62:
  uint64_t v154 = *(void *)(v0 + 1432);
  uint64_t v155 = *(void *)(v0 + 1408);
  uint64_t v156 = *(void *)(v0 + 1400);
  uint64_t v157 = *(void *)(v0 + 1392);
  uint64_t v158 = *(void *)(v0 + 1384);
  uint64_t v159 = *(void *)(v0 + 1376);
  uint64_t v160 = *(void *)(v0 + 1352);
  uint64_t v161 = *(void *)(v0 + 1328);
  uint64_t v162 = *(void *)(v0 + 1320);
  uint64_t v220 = *(void *)(v0 + 1312);
  uint64_t v224 = *(void *)(v0 + 1304);
  uint64_t v227 = *(void *)(v0 + 1296);
  uint64_t v230 = *(void *)(v0 + 1272);
  uint64_t v234 = *(void *)(v0 + 1264);
  uint64_t v238 = *(void *)(v0 + 1240);
  uint64_t v242 = *(void *)(v0 + 1232);
  uint64_t v246 = *(void *)(v0 + 1208);
  uint64_t v250 = *(void *)(v0 + 1200);
  uint64_t v255 = *(void *)(v0 + 1192);
  uint64_t v260 = *(void *)(v0 + 1168);
  uint64_t v265 = *(void *)(v0 + 1160);
  uint64_t v268 = *(void *)(v0 + 1136);
  uint64_t v271 = *(void *)(v0 + 1128);
  uint64_t v274 = *(void *)(v0 + 1104);
  uint64_t v278 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v160);
  swift_task_dealloc(v161);
  swift_task_dealloc(v162);
  swift_task_dealloc(v220);
  swift_task_dealloc(v224);
  swift_task_dealloc(v227);
  swift_task_dealloc(v230);
  swift_task_dealloc(v234);
  swift_task_dealloc(v238);
  swift_task_dealloc(v242);
  swift_task_dealloc(v246);
  swift_task_dealloc(v250);
  swift_task_dealloc(v255);
  swift_task_dealloc(v260);
  swift_task_dealloc(v265);
  swift_task_dealloc(v268);
  swift_task_dealloc(v271);
  swift_task_dealloc(v274);
  swift_task_dealloc(v278);
  uint64_t v163 = *(uint64_t (**)(void))(v0 + 8);
  return v163();
}

        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }

      ++v15;
    }

uint64_t sub_10000ECF4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1688);
  *(void *)(*v1 + 1696) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 1680);
  if (v0)
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 1664));
    swift_release(v4);
    uint64_t v5 = sub_100011D94;
  }

  else
  {
    swift_release(*(void *)(v2 + 1680));
    uint64_t v5 = sub_10000EDC0;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_10000EDC0()
{
  uint64_t v1 = *(void *)(v0 + 904);
  uint64_t v2 = *(void *)(v0 + 896);
  *(void *)(v0 + 912) = *(void *)(v0 + 888);
  *(void *)(v0 + 920) = v2;
  *(void *)(v0 + 928) = v1;
  double Seconds = CMTimeGetSeconds((CMTime *)(v0 + 912));
  uint64_t v4 = VideoPreview.MultiFrameConstraints.frameLimit.getter();
  if (__OFSUB__(v4, 1LL))
  {
    __break(1u);
LABEL_62:
    __break(1u);
  }

  double v5 = Seconds / ((double)(v4 - 1) + 0.1);
  if (v5 <= 0.0)
  {
    (*(void (**)(void, void))(v0 + 1672))(*(void *)(v0 + 1312), *(void *)(v0 + 1280));
    CMTimeValue value = *(void *)(v0 + 1664);
  }

  else
  {
    CMTimeMakeWithSeconds(&v254, v5, 1000);
    CMTimeEpoch epoch = v254.epoch;
    uint64_t v7 = *(void *)&v254.timescale;
    *(void *)(v0 + 864) = v254.value;
    *(void *)(v0 + 872) = v7;
    *(void *)(v0 + 880) = epoch;
    CFDictionaryRef v8 = CMTimeCopyAsDictionary((CMTime *)(v0 + 864), kCFAllocatorDefault);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1672);
    CMTimeValue v10 = *(void *)(v0 + 1664);
    if (!v8)
    {
      double v107 = *(void **)(v0 + 1656);
      uint64_t v108 = *(void **)(v0 + 1504);
      uint64_t v109 = *(void **)(v0 + 1472);
      uint64_t v110 = *(void *)(v0 + 1312);
      uint64_t v111 = *(void *)(v0 + 1280);
      uint64_t v112 = *(void *)(v0 + 1256);
      uint64_t v246 = *(void *)(v0 + 1248);
      uint64_t v250 = *(void *)(v0 + 1272);
      swift_bridgeObjectRelease(v10);
      uint64_t v113 = type metadata accessor for Explosion(0LL);
      uint64_t v114 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
      swift_allocError(v113, v114, 0LL, 0LL);
      uint64_t v115 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0xD00000000000001ALL,  0x8000000100015B80LL,  0xD000000000000014LL,  0x80000001000161A0LL);
      swift_willThrow(v115);

      v9(v110, v111);
      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v250, v246);
      goto LABEL_51;
    }

    CFDictionaryRef v11 = v8;
    uint64_t v12 = *(void *)(v0 + 1312);
    uint64_t v13 = *(void *)(v0 + 1280);
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(AVVideoAverageIntervalForSyncFramesKey);
    uint64_t v16 = v15;
    *(void *)(v0 + 720) = sub_100014B3C(0LL, &qword_10001C218, &OBJC_CLASS___NSDictionary_ptr);
    *(void *)(v0 + 696) = v11;
    sub_100013EF8((_OWORD *)(v0 + 696), (_OWORD *)(v0 + 664));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
    v254.CMTimeValue value = v10;
    sub_100014550((_OWORD *)(v0 + 664), v14, v16, isUniquelyReferenced_nonNull_native);
    CMTimeValue value = v254.value;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    swift_bridgeObjectRelease(v16);
    v9(v12, v13);
  }

  *(void *)(v0 + 1704) = value;
  int v19 = *(_DWORD *)(v0 + 1788);
  int v20 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  int v21 = *(void **)(v0 + 1504);
  uint64_t v22 = *(void *)(v0 + 1392);
  uint64_t v23 = *(void *)(v0 + 1360);
  id v24 = objc_allocWithZone(&OBJC_CLASS___AVAssetReaderTrackOutput);
  id v25 = v21;
  swift_bridgeObjectRetain(value);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(value);
  id v27 = [v24 initWithTrack:v25 outputSettings:isa];
  *(void *)(v0 + 1712) = v27;

  VideoPreview.Constraints.frameConstraints.getter(v28);
  int v29 = v20(v22, v23);
  uint64_t v30 = *(void *)(v0 + 1360);
  if (v29 == v19)
  {
    uint64_t v31 = *(void *)(v0 + 1392);
    uint64_t v32 = *(void *)(v0 + 1296);
    uint64_t v33 = *(void *)(v0 + 1288);
    uint64_t v34 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, uint64_t))(v0 + 1592))(v31, v30);
    uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v32, v31, v34);
    id v36 = [v27 setAppliesPreferredTrackTransform:VideoPreview.MultiFrameConstraints.appliesPreferredTrackTransform.getter(v35) & 1];
    (*(void (**)(void, void))(*(void *)(v0 + 1288) + 8LL))( *(void *)(v0 + 1296),  *(void *)(v0 + 1280));
  }

  else
  {
    (*(void (**)(void, uint64_t))(*(void *)(v0 + 1368) + 8LL))(*(void *)(v0 + 1392), v30);
    [v27 setAppliesPreferredTrackTransform:1];
  }

  uint64_t v37 = *(void **)(v0 + 1656);
  int v38 = *(_DWORD *)(v0 + 1784);
  uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v40 = *(void *)(v0 + 1384);
  uint64_t v41 = *(void *)(v0 + 1368);
  uint64_t v42 = *(void *)(v0 + 1360);
  [v27 setAlwaysCopiesSampleData:0];
  VideoPreview.Constraints.frameConstraints.getter([v37 addOutput:v27]);
  int v43 = v39(v40, v42);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  if (v43 == v38)
  {
    sub_10000878C(&qword_10001C200);
    uint64_t v44 = static AVPartialAsyncProperty<A>.nominalFrameRate.getter();
    *(void *)(v0 + 1720) = v44;
    uint64_t v45 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
    *(void *)(v0 + 1728) = v45;
    void *v45 = v0;
    v45[1] = sub_100010008;
    return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 1776, v44);
  }

  uint64_t v47 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1656) startReading];
  *(void *)(v0 + 1016) = 0LL;
  id v48 = [v47 copyNextSampleBuffer];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)(v0 + 1600);
    int v51 = *(_DWORD *)(v0 + 1784);
    int v52 = *(_DWORD *)(v0 + 1780);
    uint64_t v53 = (opaqueCMSampleBuffer *)v48;
    v182 = (uint64_t *)(v0 + 1016);
    swift_beginAccess(v0 + 1016, v0 + 840, 1LL, 0LL);
    uint64_t v54 = *(void *)(v0 + 1016);
    if (v52 == v51 || v54 != v50)
    {
      uint64_t v180 = *(void *)(v0 + 1368);
      uint64_t v181 = *(void *)(v0 + 1256);
      uint64_t v242 = *(void *)(v0 + 1184);
      uint64_t v245 = *(void *)(v0 + 1224);
      uint64_t v239 = *(void *)(v0 + 1152);
      uint64_t v178 = *(void *)(v0 + 1096);
      uint64_t v179 = *(void *)(v0 + 1120);
      uint64_t v55 = v49;
      while (1)
      {
        uint64_t v235 = v55;
        if (!CMSampleBufferGetNumSamples(v53))
        {
          uint64_t v56 = *(void *)(v0 + 1600);
          int v57 = *(_DWORD *)(v0 + 1784);
          int v58 = *(_DWORD *)(v0 + 1780);

          uint64_t v54 = *(void *)(v0 + 1016);
          uint64_t v59 = v55;
          uint64_t v60 = v59;
          if (v58 != v57 && v54 == v56)
          {
            id v49 = v55;
            uint64_t v53 = v59;
            break;
          }

          if (!CMSampleBufferGetNumSamples(v59))
          {
            while (1)
            {
              uint64_t v62 = *(void *)(v0 + 1600);
              int v63 = *(_DWORD *)(v0 + 1784);
              int v64 = *(_DWORD *)(v0 + 1780);

              uint64_t v54 = *(void *)(v0 + 1016);
              uint64_t v65 = v60;
              uint64_t v53 = v65;
              if (v64 != v63 && v54 == v62) {
                break;
              }
              if (CMSampleBufferGetNumSamples(v65)) {
                goto LABEL_29;
              }
            }

            id v49 = v55;
            break;
          }

          uint64_t v53 = v60;
        }

LABEL_29:
        uint64_t v67 = CMSampleBufferRef.imageBuffer.getter();
        if (!v67)
        {
          uint64_t v153 = *(void **)(v0 + 1712);
          uint64_t v154 = *(void **)(v0 + 1656);
          uint64_t v155 = *(void **)(v0 + 1504);
          uint64_t v156 = *(void **)(v0 + 1472);
          uint64_t v253 = *(void *)(v0 + 1272);
          uint64_t v157 = *(void *)(v0 + 1256);
          uint64_t v158 = *(void *)(v0 + 1248);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v159 = type metadata accessor for Explosion(0LL);
          uint64_t v160 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
          swift_allocError(v159, v160, 0LL, 0LL);
          uint64_t v161 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x426567616D496F4ELL,  0xED00007265666675LL,  0xD000000000000014LL,  0x80000001000161A0LL);
          swift_willThrow(v161);

          (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v253, v158);
          goto LABEL_51;
        }

        uint64_t v68 = (void *)v67;
        uint64_t v249 = v53;
        os_log_type_t v69 = static os_log_type_t.info.getter(v67);
        uint64_t v70 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
        if (os_log_type_enabled(v70, v69))
        {
          uint64_t v71 = swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v71 = 134217984;
          uint64_t v54 = *v182;
          *(void *)(v71 + 4) = *v182;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  v69,  "BlastDoor processing thumbnail %ld",  (uint8_t *)v71,  0xCu);
          swift_slowDealloc(v71, -1LL, -1LL);
        }

        unsigned int v209 = *(unsigned __int8 *)(v0 + 1805);
        int v230 = *(_DWORD *)(v0 + 1784);
        uint64_t v225 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
        unsigned int v213 = *(unsigned __int8 *)(v0 + 1804);
        uint64_t v205 = *(void *)(v0 + 1496);
        uint64_t v217 = *(void *)(v0 + 1376);
        uint64_t v221 = *(void *)(v0 + 1360);
        uint64_t v72 = *(void *)(v0 + 1272);
        uint64_t v73 = *(void *)(v0 + 1264);
        uint64_t v74 = *(void *)(v0 + 1248);
        uint64_t v75 = *(void *)(v0 + 1240);
        uint64_t v185 = *(void *)(v0 + 1232);
        uint64_t v186 = *(void *)(v0 + 1216);
        uint64_t v76 = *(void *)(v0 + 1208);
        uint64_t v77 = *(void *)(v0 + 1200);
        uint64_t v187 = *(void *)(v0 + 1192);
        uint64_t v189 = *(void *)(v0 + 1176);
        uint64_t v184 = *(void *)(v0 + 1168);
        uint64_t v191 = *(void *)(v0 + 1160);
        uint64_t v195 = *(void *)(v0 + 1144);

        uint64_t v78 = CMSampleBufferRef.presentationTimeStamp.getter();
        double v79 = CMTime.seconds.getter(v78);
        type metadata accessor for CVBuffer(0LL);
        uint64_t v255 = v80;
        uint64_t v256 = &protocol witness table for CVBufferRef;
        v254.CMTimeValue value = (CMTimeValue)v68;
        uint64_t v81 = type metadata accessor for Image.Encoding(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56LL))(v76, 1LL, 1LL, v81);
        id v82 = v68;
        Image.init(provider:maxPixelDimension:enforcedEncoding:)(&v254, 0LL, 1LL, v76);
        uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v181 + 16);
        v83(v73, v72, v74);
        VideoPreview.VideoFormat.init(trackInfo:)(v73);
        v83(v73, v72, v74);
        VideoPreview.AudioFormat.init(trackInfo:)(v73);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v245 + 16))(v185, v75, v186);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v242 + 16))(v187, v77, v189);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v239 + 16))(v191, v184, v195);
        uint64_t v84 = VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)( v185,  v209,  v54,  v205,  v187,  v191,  v213,  v79);
        VideoPreview.Constraints.frameConstraints.getter(v84);
        int v85 = v225(v217, v221);
        id v86 = *(void **)(v0 + 1712);
        v183 = v82;
        if (v85 == v230)
        {
          uint64_t v190 = *(void **)(v0 + 1656);
          uint64_t v194 = *(void **)(v0 + 1504);
          uint64_t v198 = *(void **)(v0 + 1472);
          uint64_t v162 = *(void *)(v0 + 1376);
          uint64_t v163 = *(void *)(v0 + 1360);
          uint64_t v234 = *(void *)(v0 + 1272);
          uint64_t v224 = *(void *)(v0 + 1256);
          uint64_t v229 = *(void *)(v0 + 1248);
          uint64_t v216 = *(void *)(v0 + 1216);
          uint64_t v220 = *(void *)(v0 + 1240);
          uint64_t v208 = *(void *)(v0 + 1176);
          uint64_t v212 = *(void *)(v0 + 1200);
          uint64_t v201 = *(void *)(v0 + 1144);
          uint64_t v204 = *(void *)(v0 + 1168);
          uint64_t v164 = *(void *)(v0 + 1136);
          uint64_t v165 = *(void *)(v0 + 1128);
          uint64_t v166 = *(void *)(v0 + 1112);
          uint64_t v167 = *(void *)(v0 + 1104);
          uint64_t v168 = *(void *)(v0 + 1080);
          uint64_t v188 = *(void *)(v0 + 1088);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v169 = (*(uint64_t (**)(uint64_t, uint64_t))(v180 + 8))(v162, v163);
          uint64_t v170 = static os_log_type_t.info.getter(v169);
          uint64_t v171 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
          os_log(_:dso:log:_:_:)( v170,  &_mh_execute_header,  v171,  "This was a single frame request - handling continuation",  55LL,  2LL,  &_swiftEmptyArrayStorage);

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v179 + 16))(v165, v164, v166);
          uint64_t v172 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
          SessionSchemaResult.init(_:lastResult:)(v165, 1LL, v166, v172);
          uint64_t v173 = sub_10000878C(&qword_10001C198);
          AsyncThrowingStream.Continuation.yield(_:)(v168, v173);
          (*(void (**)(uint64_t, uint64_t))(v178 + 8))(v167, v188);
          *(void *)(v0 + 968) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 968, v173);

          (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v164, v166);
          (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v204, v201);
          (*(void (**)(uint64_t, uint64_t))(v242 + 8))(v212, v208);
          (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v220, v216);
          (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v234, v229);
          goto LABEL_55;
        }

        (*(void (**)(void, void))(v180 + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
        id v49 = [v86 copyNextSampleBuffer];

        uint64_t v87 = *(void *)(v0 + 1016);
        BOOL v88 = __OFADD__(v87, 1LL);
        uint64_t v89 = v87 + 1;
        if (v88) {
          goto LABEL_62;
        }
        uint64_t *v182 = v89;
        if (v49) {
          BOOL v91 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v89 == *(void *)(v0 + 1600);
        }
        else {
          BOOL v91 = 1LL;
        }
        uint64_t v92 = *(void *)(v0 + 1128);
        uint64_t v93 = *(void *)(v0 + 1112);
        uint64_t v94 = *(void *)(v0 + 1104);
        uint64_t v95 = *(void *)(v0 + 1088);
        uint64_t v96 = *(void *)(v0 + 1080);
        (*(void (**)(uint64_t, void, uint64_t))(v179 + 16))(v92, *(void *)(v0 + 1136), v93);
        uint64_t v97 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
        SessionSchemaResult.init(_:lastResult:)(v92, v91, v93, v97);
        uint64_t v98 = sub_10000878C(&qword_10001C198);
        AsyncThrowingStream.Continuation.yield(_:)(v96, v98);
        (*(void (**)(uint64_t, uint64_t))(v178 + 8))(v94, v95);
        uint64_t v99 = *(void *)(v0 + 1240);
        uint64_t v231 = *(void *)(v0 + 1200);
        uint64_t v236 = *(void *)(v0 + 1216);
        uint64_t v226 = *(void *)(v0 + 1176);
        uint64_t v100 = *(void *)(v0 + 1168);
        uint64_t v101 = *(void *)(v0 + 1144);
        uint64_t v102 = *(void *)(v0 + 1136);
        uint64_t v103 = *(void *)(v0 + 1112);
        if (v91)
        {
          *(void *)(v0 + 976) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 976, v98);
        }

        (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v102, v103);
        (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v100, v101);
        (*(void (**)(uint64_t, uint64_t))(v242 + 8))(v231, v226);
        (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v99, v236);
        if (!v49)
        {
          uint64_t v174 = *(void **)(v0 + 1712);
          uint64_t v175 = *(void *)(v0 + 1704);
          uint64_t v176 = *(void **)(v0 + 1504);
          uint64_t v177 = *(void **)(v0 + 1472);
          uint64_t v141 = *(void *)(v0 + 1272);
          uint64_t v142 = *(void *)(v0 + 1256);
          uint64_t v143 = *(void *)(v0 + 1248);

          swift_bridgeObjectRelease(v175);
          goto LABEL_54;
        }

        uint64_t v104 = *(void *)(v0 + 1600);
        int v105 = *(_DWORD *)(v0 + 1784);
        int v106 = *(_DWORD *)(v0 + 1780);
        uint64_t v54 = *(void *)(v0 + 1016);
        uint64_t v53 = (opaqueCMSampleBuffer *)v49;
        uint64_t v55 = v49;
        if (v106 != v105)
        {
          uint64_t v55 = v49;
          if (v54 == v104) {
            break;
          }
        }
      }
    }

    uint64_t v136 = *(void **)(v0 + 1712);
    uint64_t v137 = *(void *)(v0 + 1704);
    uint64_t v138 = v53;
    uint64_t v139 = *(void **)(v0 + 1504);
    uint64_t v140 = *(void **)(v0 + 1472);
    uint64_t v141 = *(void *)(v0 + 1272);
    uint64_t v142 = *(void *)(v0 + 1256);
    uint64_t v143 = *(void *)(v0 + 1248);

    swift_bridgeObjectRelease(v137);
LABEL_54:
    (*(void (**)(uint64_t, uint64_t))(v142 + 8))(v141, v143);
LABEL_55:
    uint64_t v144 = *(void *)(v0 + 1432);
    uint64_t v145 = *(void *)(v0 + 1408);
    uint64_t v146 = *(void *)(v0 + 1400);
    uint64_t v147 = *(void *)(v0 + 1392);
    uint64_t v148 = *(void *)(v0 + 1384);
    uint64_t v149 = *(void *)(v0 + 1376);
    uint64_t v150 = *(void *)(v0 + 1352);
    uint64_t v151 = *(void *)(v0 + 1328);
    uint64_t v152 = *(void *)(v0 + 1320);
    uint64_t v193 = *(void *)(v0 + 1312);
    uint64_t v197 = *(void *)(v0 + 1304);
    uint64_t v200 = *(void *)(v0 + 1296);
    uint64_t v203 = *(void *)(v0 + 1272);
    uint64_t v207 = *(void *)(v0 + 1264);
    uint64_t v211 = *(void *)(v0 + 1240);
    uint64_t v215 = *(void *)(v0 + 1232);
    uint64_t v219 = *(void *)(v0 + 1208);
    uint64_t v223 = *(void *)(v0 + 1200);
    uint64_t v228 = *(void *)(v0 + 1192);
    uint64_t v233 = *(void *)(v0 + 1168);
    uint64_t v238 = *(void *)(v0 + 1160);
    uint64_t v241 = *(void *)(v0 + 1136);
    uint64_t v244 = *(void *)(v0 + 1128);
    uint64_t v248 = *(void *)(v0 + 1104);
    uint64_t v252 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v144);
    swift_task_dealloc(v145);
    swift_task_dealloc(v146);
    swift_task_dealloc(v147);
    swift_task_dealloc(v148);
    swift_task_dealloc(v149);
    swift_task_dealloc(v150);
    swift_task_dealloc(v151);
    swift_task_dealloc(v152);
    swift_task_dealloc(v193);
    swift_task_dealloc(v197);
    swift_task_dealloc(v200);
    swift_task_dealloc(v203);
    swift_task_dealloc(v207);
    swift_task_dealloc(v211);
    swift_task_dealloc(v215);
    swift_task_dealloc(v219);
    swift_task_dealloc(v223);
    swift_task_dealloc(v228);
    swift_task_dealloc(v233);
    swift_task_dealloc(v238);
    swift_task_dealloc(v241);
    swift_task_dealloc(v244);
    swift_task_dealloc(v248);
    swift_task_dealloc(v252);
    uint64_t v135 = *(uint64_t (**)(void))(v0 + 8);
    return v135();
  }

  double v116 = *(void **)(v0 + 1712);
  uint64_t v117 = *(void **)(v0 + 1656);
  uint64_t v118 = *(void **)(v0 + 1504);
  id v119 = *(void **)(v0 + 1472);
  uint64_t v120 = *(void *)(v0 + 1272);
  uint64_t v121 = *(void *)(v0 + 1256);
  uint64_t v122 = *(void *)(v0 + 1248);
  swift_bridgeObjectRelease(*(void *)(v0 + 1704));
  uint64_t v123 = type metadata accessor for Explosion(0LL);
  uint64_t v124 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
  swift_allocError(v123, v124, 0LL, 0LL);
  uint64_t v125 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x73656D6172466F4ELL,  0xE800000000000000LL,  0xD000000000000014LL,  0x80000001000161A0LL);
  swift_willThrow(v125);

  (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v120, v122);
LABEL_51:
  uint64_t v126 = *(void *)(v0 + 1432);
  uint64_t v127 = *(void *)(v0 + 1408);
  uint64_t v128 = *(void *)(v0 + 1400);
  uint64_t v129 = *(void *)(v0 + 1392);
  uint64_t v130 = *(void *)(v0 + 1384);
  uint64_t v131 = *(void *)(v0 + 1376);
  uint64_t v132 = *(void *)(v0 + 1352);
  uint64_t v133 = *(void *)(v0 + 1328);
  uint64_t v134 = *(void *)(v0 + 1320);
  uint64_t v192 = *(void *)(v0 + 1312);
  uint64_t v196 = *(void *)(v0 + 1304);
  uint64_t v199 = *(void *)(v0 + 1296);
  uint64_t v202 = *(void *)(v0 + 1272);
  uint64_t v206 = *(void *)(v0 + 1264);
  uint64_t v210 = *(void *)(v0 + 1240);
  uint64_t v214 = *(void *)(v0 + 1232);
  uint64_t v218 = *(void *)(v0 + 1208);
  uint64_t v222 = *(void *)(v0 + 1200);
  uint64_t v227 = *(void *)(v0 + 1192);
  uint64_t v232 = *(void *)(v0 + 1168);
  uint64_t v237 = *(void *)(v0 + 1160);
  uint64_t v240 = *(void *)(v0 + 1136);
  uint64_t v243 = *(void *)(v0 + 1128);
  uint64_t v247 = *(void *)(v0 + 1104);
  uint64_t v251 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v126);
  swift_task_dealloc(v127);
  swift_task_dealloc(v128);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v192);
  swift_task_dealloc(v196);
  swift_task_dealloc(v199);
  swift_task_dealloc(v202);
  swift_task_dealloc(v206);
  swift_task_dealloc(v210);
  swift_task_dealloc(v214);
  swift_task_dealloc(v218);
  swift_task_dealloc(v222);
  swift_task_dealloc(v227);
  swift_task_dealloc(v232);
  swift_task_dealloc(v237);
  swift_task_dealloc(v240);
  swift_task_dealloc(v243);
  swift_task_dealloc(v247);
  swift_task_dealloc(v251);
  uint64_t v135 = *(uint64_t (**)(void))(v0 + 8);
  return v135();
}

uint64_t sub_100010008()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1728);
  *(void *)(*v1 + 1736) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 1720);
  if (v0)
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 1704));
    swift_release(v4);
    double v5 = sub_100011FB8;
  }

  else
  {
    swift_release(*(void *)(v2 + 1720));
    double v5 = sub_1000100D4;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_1000100D4()
{
  float v1 = ceilf(*(float *)(v0 + 1776));
  *(float *)(v0 + 1792) = v1;
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v1 <= -2147500000.0)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }

  if (v1 >= 2147500000.0) {
    goto LABEL_7;
  }
  *(void *)(v0 + 1744) = kCMTimeZero.value;
  *(void *)(v0 + 1796) = *(void *)&kCMTimeZero.timescale;
  *(void *)(v0 + 1752) = kCMTimeZero.epoch;
  sub_10000878C(&qword_10001C208);
  uint64_t v2 = static AVPartialAsyncProperty<A>.segments.getter();
  *(void *)(v0 + 1760) = v2;
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
  *(void *)(v0 + 1768) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000101EC;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 984, v2);
}

uint64_t sub_1000101EC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 1768));
  uint64_t v3 = *(void *)(v2 + 1760);
  if (v0)
  {
    swift_errorRelease(v0);
    swift_release(v3);
    uint64_t v4 = sub_1000121CC;
  }

  else
  {
    swift_release(v3);
    uint64_t v4 = sub_1000102B4;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000102B4()
{
  uint64_t v1 = *(void *)(v0 + 984);
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    uint64_t v3 = (uint64_t *)(v0 + 1796);
    if (!v2) {
      break;
    }
    unint64_t v4 = 0LL;
    unint64_t v5 = v1 & 0xC000000000000001LL;
    uint64_t v234 = v1 + 32;
    uint64_t v238 = v1 & 0xFFFFFFFFFFFFFF8LL;
    double v6 = &selRef_initWithURL_options_;
    unint64_t v225 = v1 & 0xC000000000000001LL;
    uint64_t v230 = v2;
    while (1)
    {
      if (v5)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }

      else
      {
        if (v4 >= *(void *)(v238 + 16)) {
          goto LABEL_70;
        }
        id v7 = *(id *)(v234 + 8 * v4);
      }

      CFDictionaryRef v8 = v7;
      BOOL v9 = __OFADD__(v4++, 1LL);
      if (v9) {
        break;
      }
      if (([v7 v6[11]] & 1) == 0)
      {
        CMTimeValue v10 = *(void **)(v0 + 1504);
        [v8 timeMapping];
        uint64_t v11 = v248;
        uint64_t v12 = v247;
        *(void *)(v0 + 792) = v246;
        *(void *)(v0 + 800) = v12;
        *(void *)(v0 + 808) = v11;
        id v13 = [v10 makeSampleCursorWithPresentationTimeStamp:v0 + 792];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = v1;
          do
          {
            if ([v14 stepInPresentationOrderByCount:1] != (id)1) {
              break;
            }
            [v14 presentationTimeStamp];
            uint64_t v16 = v246;
            uint64_t v17 = v247;
            uint64_t v18 = v248;
            id v19 = [v8 timeMapping];
            uint64_t v20 = v250;
            uint64_t v21 = v247;
            uint64_t v22 = v249;
            __int128 v23 = v248;
            *(void *)(v0 + 480) = v246;
            *(void *)(v0 + 488) = v21;
            *(_OWORD *)(v0 + 496) = v23;
            *(void *)(v0 + 512) = v22;
            *(void *)(v0 + 520) = v20;
            uint64_t v24 = CMTimeRange.end.getter(v19);
          }

          while ((static CMTime.> infix(_:_:)(v16, v17, v18, v24, v25, v26) & 1) == 0);
          if (([v14 currentSampleDependencyInfo] & 0x1000000) == 0)
          {
            swift_bridgeObjectRelease(v15);
            [v14 presentationTimeStamp];
            uint64_t v110 = v246;
            uint64_t v111 = v248;
            uint64_t v112 = v247;
            [v8 timeMapping];
            uint64_t v113 = v246;
            unint64_t v115 = *((void *)&v248 + 1);
            unint64_t v114 = v248;
            uint64_t v116 = v250;
            uint64_t v117 = v247;
            uint64_t v118 = v249;
            [v8 timeMapping];
            uint64_t v119 = v251;
            uint64_t v120 = v255;
            uint64_t v121 = v252;
            uint64_t v122 = v254;
            __int128 v123 = v253;
            *(void *)(v0 + 816) = v110;
            *(void *)(v0 + 824) = v112;
            *(void *)(v0 + 832) = v111;
            *(void *)(v0 + 576) = v113;
            *(void *)(v0 + 584) = v117;
            *(_OWORD *)(v0 + 592) = __PAIR128__(v115, v114);
            *(void *)(v0 + 608) = v118;
            *(void *)(v0 + 616) = v116;
            *(void *)(v0 + 336) = v119;
            *(void *)(v0 + 344) = v121;
            *(_OWORD *)(v0 + 352) = v123;
            *(void *)(v0 + 368) = v122;
            *(void *)(v0 + 376) = v120;
            CMTimeMapTimeFromRangeToRange( (CMTime *)&v246,  (CMTime *)(v0 + 816),  (CMTimeRange *)(v0 + 576),  (CMTimeRange *)(v0 + 336));
            int v29 = v246;
            uint64_t v28 = v247;
            uint64_t v27 = v248;

            uint64_t v3 = (uint64_t *)(v0 + 1796);
            goto LABEL_22;
          }

          uint64_t v1 = v15;
          unint64_t v5 = v225;
          uint64_t v2 = v230;
          double v6 = &selRef_initWithURL_options_;
        }
      }

      if (v4 == v2)
      {
        swift_bridgeObjectRelease(v1);
        uint64_t v27 = *(void *)(v0 + 1752);
        uint64_t v3 = (uint64_t *)(v0 + 1796);
        goto LABEL_21;
      }
    }

    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    if (v1 < 0) {
      uint64_t v167 = v1;
    }
    else {
      uint64_t v167 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v167);
    swift_bridgeObjectRelease(v1);
  }

  swift_bridgeObjectRelease(v1);
  uint64_t v27 = *(void *)(v0 + 1752);
LABEL_21:
  uint64_t v28 = *v3;
  int v29 = *(void **)(v0 + 1744);
LABEL_22:
  uint64_t v30 = *(void **)(v0 + 1656);
  __C::CMTime v256 = CMTime.init(value:timescale:)(1LL, (int)*(float *)(v0 + 1792));
  *(void *)(v0 + 384) = v29;
  *(void *)(v0 + 392) = v28;
  *(void *)(v0 + 400) = v27;
  *(__C::CMTime *)(v0 + 408) = v256;
  [v30 setTimeRange:v0 + 384];
  uint64_t v31 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1656) startReading];
  *(void *)(v0 + 1016) = 0LL;
  id v32 = [v31 copyNextSampleBuffer];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)(v0 + 1600);
    int v35 = *(_DWORD *)(v0 + 1784);
    int v36 = *(_DWORD *)(v0 + 1780);
    uint64_t v37 = (opaqueCMSampleBuffer *)v32;
    uint64_t v172 = (uint64_t *)(v0 + 1016);
    swift_beginAccess(v0 + 1016, v0 + 840, 1LL, 0LL);
    uint64_t v38 = *(void *)(v0 + 1016);
    if (v36 == v35 || v38 != v34)
    {
      uint64_t v170 = *(void *)(v0 + 1256);
      uint64_t v171 = *(void *)(v0 + 1368);
      uint64_t v235 = *(void *)(v0 + 1184);
      uint64_t v239 = *(void *)(v0 + 1224);
      uint64_t v231 = *(void *)(v0 + 1152);
      uint64_t v168 = *(void *)(v0 + 1096);
      uint64_t v169 = *(void *)(v0 + 1120);
      uint64_t v39 = v33;
      while (1)
      {
        uint64_t v226 = v39;
        if (!CMSampleBufferGetNumSamples(v37))
        {
          uint64_t v40 = *(void *)(v0 + 1600);
          int v41 = *(_DWORD *)(v0 + 1784);
          int v42 = *(_DWORD *)(v0 + 1780);

          uint64_t v38 = *(void *)(v0 + 1016);
          int v43 = v39;
          uint64_t v44 = v43;
          if (v42 != v41 && v38 == v40)
          {
            id v33 = v39;
            uint64_t v37 = v43;
            break;
          }

          if (!CMSampleBufferGetNumSamples(v43))
          {
            while (1)
            {
              uint64_t v46 = *(void *)(v0 + 1600);
              int v47 = *(_DWORD *)(v0 + 1784);
              int v48 = *(_DWORD *)(v0 + 1780);

              uint64_t v38 = *(void *)(v0 + 1016);
              id v49 = v44;
              uint64_t v37 = v49;
              if (v48 != v47 && v38 == v46) {
                break;
              }
              if (CMSampleBufferGetNumSamples(v49)) {
                goto LABEL_38;
              }
            }

            id v33 = v39;
            break;
          }

          uint64_t v37 = v44;
        }

LABEL_38:
        uint64_t v51 = CMSampleBufferRef.imageBuffer.getter();
        if (!v51)
        {
          uint64_t v142 = *(void **)(v0 + 1712);
          uint64_t v143 = *(void **)(v0 + 1656);
          uint64_t v144 = *(void **)(v0 + 1504);
          uint64_t v145 = *(void **)(v0 + 1472);
          uint64_t v245 = *(void *)(v0 + 1272);
          uint64_t v146 = *(void *)(v0 + 1256);
          uint64_t v147 = *(void *)(v0 + 1248);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v148 = type metadata accessor for Explosion(0LL);
          uint64_t v149 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
          swift_allocError(v148, v149, 0LL, 0LL);
          uint64_t v150 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x426567616D496F4ELL,  0xED00007265666675LL,  0xD000000000000014LL,  0x80000001000161A0LL);
          swift_willThrow(v150);

          (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v245, v147);
          goto LABEL_58;
        }

        int v52 = (void *)v51;
        uint64_t v242 = v37;
        os_log_type_t v53 = static os_log_type_t.info.getter(v51);
        uint64_t v54 = (os_log_s *)static OS_os_log.videoPreviewUnpacker.getter();
        if (os_log_type_enabled(v54, v53))
        {
          uint64_t v55 = swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v55 = 134217984;
          uint64_t v38 = *v172;
          *(void *)(v55 + 4) = *v172;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  v53,  "BlastDoor processing thumbnail %ld",  (uint8_t *)v55,  0xCu);
          swift_slowDealloc(v55, -1LL, -1LL);
        }

        unsigned int v196 = *((unsigned __int8 *)v3 + 9);
        int toRangea = *(_DWORD *)(v0 + 1784);
        unsigned int v200 = *((unsigned __int8 *)v3 + 8);
        uint64_t v192 = *(void *)(v0 + 1496);
        uint64_t v204 = *(void *)(v0 + 1376);
        uint64_t v208 = *(void *)(v0 + 1360);
        uint64_t v212 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
        uint64_t v56 = *(void *)(v0 + 1272);
        uint64_t v57 = *(void *)(v0 + 1264);
        uint64_t v58 = *(void *)(v0 + 1248);
        uint64_t v59 = *(void *)(v0 + 1240);
        uint64_t v175 = *(void *)(v0 + 1232);
        uint64_t v176 = *(void *)(v0 + 1216);
        uint64_t v60 = *(void *)(v0 + 1208);
        uint64_t v61 = *(void *)(v0 + 1200);
        uint64_t v177 = *(void *)(v0 + 1192);
        uint64_t v178 = *(void *)(v0 + 1176);
        uint64_t v174 = *(void *)(v0 + 1168);
        uint64_t v180 = *(void *)(v0 + 1160);
        uint64_t v182 = *(void *)(v0 + 1144);

        uint64_t v62 = CMSampleBufferRef.presentationTimeStamp.getter();
        double v63 = CMTime.seconds.getter(v62);
        type metadata accessor for CVBuffer(0LL);
        *((void *)&v248 + 1) = v64;
        uint64_t v249 = &protocol witness table for CVBufferRef;
        uint64_t v246 = v52;
        uint64_t v65 = type metadata accessor for Image.Encoding(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56LL))(v60, 1LL, 1LL, v65);
        id v66 = v52;
        Image.init(provider:maxPixelDimension:enforcedEncoding:)(&v246, 0LL, 1LL, v60);
        uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v170 + 16);
        v67(v57, v56, v58);
        VideoPreview.VideoFormat.init(trackInfo:)(v57);
        v67(v57, v56, v58);
        VideoPreview.AudioFormat.init(trackInfo:)(v57);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v239 + 16))(v175, v59, v176);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v235 + 16))(v177, v61, v178);
        uint64_t v1 = v180;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v231 + 16))(v180, v174, v182);
        uint64_t v68 = VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)( v175,  v196,  v38,  v192,  v177,  v180,  v200,  v63);
        VideoPreview.Constraints.frameConstraints.getter(v68);
        int v69 = v212(v204, v208);
        uint64_t v70 = *(void **)(v0 + 1712);
        uint64_t v173 = v66;
        if (v69 == toRangea)
        {
          uint64_t v181 = *(void **)(v0 + 1656);
          uint64_t v185 = *(void **)(v0 + 1504);
          uint64_t v151 = *(void *)(v0 + 1376);
          uint64_t v152 = *(void *)(v0 + 1360);
          toRanged = *(CMTimeRange **)(v0 + 1248);
          uint64_t v224 = *(void *)(v0 + 1272);
          uint64_t v211 = *(void *)(v0 + 1240);
          uint64_t v216 = *(void *)(v0 + 1256);
          uint64_t v203 = *(void *)(v0 + 1200);
          uint64_t v207 = *(void *)(v0 + 1216);
          uint64_t v195 = *(void *)(v0 + 1168);
          uint64_t v199 = *(void *)(v0 + 1176);
          uint64_t v188 = *(void **)(v0 + 1472);
          uint64_t v191 = *(void *)(v0 + 1144);
          uint64_t v153 = *(void *)(v0 + 1136);
          uint64_t v154 = *(void *)(v0 + 1128);
          uint64_t v155 = *(void *)(v0 + 1112);
          uint64_t v156 = *(void *)(v0 + 1104);
          uint64_t v157 = *(void *)(v0 + 1080);
          uint64_t v179 = *(void *)(v0 + 1088);
          swift_bridgeObjectRelease(*(void *)(v0 + 1704));
          uint64_t v158 = (*(uint64_t (**)(uint64_t, uint64_t))(v171 + 8))(v151, v152);
          uint64_t v159 = static os_log_type_t.info.getter(v158);
          uint64_t v160 = (void *)static OS_os_log.videoPreviewUnpacker.getter();
          os_log(_:dso:log:_:_:)( v159,  &_mh_execute_header,  v160,  "This was a single frame request - handling continuation",  55LL,  2LL,  &_swiftEmptyArrayStorage);

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v169 + 16))(v154, v153, v155);
          uint64_t v161 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
          SessionSchemaResult.init(_:lastResult:)(v154, 1LL, v155, v161);
          uint64_t v162 = sub_10000878C(&qword_10001C198);
          AsyncThrowingStream.Continuation.yield(_:)(v157, v162);
          (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v156, v179);
          *(void *)(v0 + 968) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 968, v162);

          (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v153, v155);
          (*(void (**)(uint64_t, uint64_t))(v231 + 8))(v195, v191);
          (*(void (**)(uint64_t, uint64_t))(v235 + 8))(v203, v199);
          (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v211, v207);
          (*(void (**)(uint64_t, CMTimeRange *))(v216 + 8))(v224, toRanged);
          goto LABEL_63;
        }

        (*(void (**)(void, void))(v171 + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
        id v33 = [v70 copyNextSampleBuffer];

        uint64_t v71 = *(void *)(v0 + 1016);
        BOOL v9 = __OFADD__(v71, 1LL);
        uint64_t v72 = v71 + 1;
        if (v9) {
          goto LABEL_71;
        }
        *uint64_t v172 = v72;
        if (v33) {
          BOOL v74 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v72 == *(void *)(v0 + 1600);
        }
        else {
          BOOL v74 = 1LL;
        }
        uint64_t v75 = *(void *)(v0 + 1128);
        uint64_t v76 = *(void *)(v0 + 1112);
        uint64_t v77 = *(void *)(v0 + 1104);
        uint64_t v78 = *(void *)(v0 + 1088);
        uint64_t v79 = *(void *)(v0 + 1080);
        (*(void (**)(uint64_t, void, uint64_t))(v169 + 16))(v75, *(void *)(v0 + 1136), v76);
        uint64_t v80 = sub_100009BD8( &qword_10001C1F8,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoPreview,  (uint64_t)&protocol conformance descriptor for VideoPreview);
        SessionSchemaResult.init(_:lastResult:)(v75, v74, v76, v80);
        uint64_t v81 = sub_10000878C(&qword_10001C198);
        AsyncThrowingStream.Continuation.yield(_:)(v79, v81);
        (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v77, v78);
        uint64_t v82 = *(void *)(v0 + 1240);
        uint64_t v227 = *(void *)(v0 + 1216);
        uint64_t v213 = *(void *)(v0 + 1176);
        toRange = *(CMTimeRange **)(v0 + 1200);
        uint64_t v83 = *(void *)(v0 + 1168);
        uint64_t v84 = *(void *)(v0 + 1144);
        uint64_t v85 = *(void *)(v0 + 1136);
        uint64_t v86 = *(void *)(v0 + 1112);
        if (v74)
        {
          *(void *)(v0 + 976) = 0LL;
          AsyncThrowingStream.Continuation.finish(throwing:)(v0 + 976, v81);
        }

        (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v85, v86);
        (*(void (**)(uint64_t, uint64_t))(v231 + 8))(v83, v84);
        (*(void (**)(CMTimeRange *, uint64_t))(v235 + 8))(toRange, v213);
        (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v82, v227);
        uint64_t v3 = (uint64_t *)(v0 + 1796);
        if (!v33)
        {
          uint64_t v163 = *(void **)(v0 + 1712);
          uint64_t v164 = *(void *)(v0 + 1704);
          uint64_t v165 = *(void **)(v0 + 1504);
          uint64_t v166 = *(void **)(v0 + 1472);
          uint64_t v129 = *(void *)(v0 + 1272);
          uint64_t v130 = *(void *)(v0 + 1256);
          uint64_t v131 = *(void *)(v0 + 1248);

          swift_bridgeObjectRelease(v164);
          goto LABEL_62;
        }

        uint64_t v87 = *(void *)(v0 + 1600);
        int v88 = *(_DWORD *)(v0 + 1784);
        int v89 = *(_DWORD *)(v0 + 1780);
        uint64_t v38 = *(void *)(v0 + 1016);
        uint64_t v37 = (opaqueCMSampleBuffer *)v33;
        uint64_t v39 = v33;
        if (v89 != v88)
        {
          uint64_t v39 = v33;
          if (v38 == v87) {
            break;
          }
        }
      }
    }

    uint64_t v124 = *(void **)(v0 + 1712);
    uint64_t v125 = *(void *)(v0 + 1704);
    uint64_t v126 = *(void **)(v0 + 1504);
    uint64_t v127 = v37;
    uint64_t v128 = *(void **)(v0 + 1472);
    uint64_t v129 = *(void *)(v0 + 1272);
    uint64_t v130 = *(void *)(v0 + 1256);
    uint64_t v131 = *(void *)(v0 + 1248);

    swift_bridgeObjectRelease(v125);
LABEL_62:
    (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v129, v131);
LABEL_63:
    uint64_t v132 = *(void *)(v0 + 1432);
    uint64_t v133 = *(void *)(v0 + 1408);
    uint64_t v134 = *(void *)(v0 + 1400);
    uint64_t v135 = *(void *)(v0 + 1392);
    uint64_t v136 = *(void *)(v0 + 1384);
    uint64_t v137 = *(void *)(v0 + 1376);
    uint64_t v138 = *(void *)(v0 + 1352);
    uint64_t v139 = *(void *)(v0 + 1328);
    uint64_t v140 = *(void *)(v0 + 1320);
    uint64_t v184 = *(void *)(v0 + 1312);
    uint64_t v187 = *(void *)(v0 + 1304);
    uint64_t v190 = *(void *)(v0 + 1296);
    uint64_t v194 = *(void *)(v0 + 1272);
    uint64_t v198 = *(void *)(v0 + 1264);
    uint64_t v202 = *(void *)(v0 + 1240);
    uint64_t v206 = *(void *)(v0 + 1232);
    uint64_t v210 = *(void *)(v0 + 1208);
    uint64_t v215 = *(void *)(v0 + 1200);
    toRangec = *(CMTimeRange **)(v0 + 1192);
    uint64_t v223 = *(void *)(v0 + 1168);
    uint64_t v229 = *(void *)(v0 + 1160);
    uint64_t v233 = *(void *)(v0 + 1136);
    uint64_t v237 = *(void *)(v0 + 1128);
    uint64_t v241 = *(void *)(v0 + 1104);
    uint64_t v244 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v132);
    swift_task_dealloc(v133);
    swift_task_dealloc(v134);
    swift_task_dealloc(v135);
    swift_task_dealloc(v136);
    swift_task_dealloc(v137);
    swift_task_dealloc(v138);
    swift_task_dealloc(v139);
    swift_task_dealloc(v140);
    swift_task_dealloc(v184);
    swift_task_dealloc(v187);
    swift_task_dealloc(v190);
    swift_task_dealloc(v194);
    swift_task_dealloc(v198);
    swift_task_dealloc(v202);
    swift_task_dealloc(v206);
    swift_task_dealloc(v210);
    swift_task_dealloc(v215);
    swift_task_dealloc(toRangec);
    swift_task_dealloc(v223);
    swift_task_dealloc(v229);
    swift_task_dealloc(v233);
    swift_task_dealloc(v237);
    swift_task_dealloc(v241);
    swift_task_dealloc(v244);
    uint64_t v109 = *(uint64_t (**)(void))(v0 + 8);
  }

  else
  {
    uint64_t v90 = *(void **)(v0 + 1712);
    BOOL v91 = *(void **)(v0 + 1656);
    uint64_t v92 = *(void **)(v0 + 1504);
    uint64_t v93 = *(void **)(v0 + 1472);
    uint64_t v94 = *(void *)(v0 + 1272);
    uint64_t v95 = *(void *)(v0 + 1256);
    uint64_t v96 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease(*(void *)(v0 + 1704));
    uint64_t v97 = type metadata accessor for Explosion(0LL);
    uint64_t v98 = sub_100009BD8( &qword_10001C118,  (uint64_t (*)(uint64_t))&type metadata accessor for Explosion,  (uint64_t)&protocol conformance descriptor for Explosion);
    swift_allocError(v97, v98, 0LL, 0LL);
    uint64_t v99 = Explosion.init(domain:errorType:keyPath:)( 0xD000000000000020LL,  0x8000000100015AD0LL,  0x73656D6172466F4ELL,  0xE800000000000000LL,  0xD000000000000014LL,  0x80000001000161A0LL);
    swift_willThrow(v99);

    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v96);
LABEL_58:
    uint64_t v100 = *(void *)(v0 + 1432);
    uint64_t v101 = *(void *)(v0 + 1408);
    uint64_t v102 = *(void *)(v0 + 1400);
    uint64_t v103 = *(void *)(v0 + 1392);
    uint64_t v104 = *(void *)(v0 + 1384);
    uint64_t v105 = *(void *)(v0 + 1376);
    uint64_t v106 = *(void *)(v0 + 1352);
    uint64_t v107 = *(void *)(v0 + 1328);
    uint64_t v108 = *(void *)(v0 + 1320);
    uint64_t v183 = *(void *)(v0 + 1312);
    uint64_t v186 = *(void *)(v0 + 1304);
    uint64_t v189 = *(void *)(v0 + 1296);
    uint64_t v193 = *(void *)(v0 + 1272);
    uint64_t v197 = *(void *)(v0 + 1264);
    uint64_t v201 = *(void *)(v0 + 1240);
    uint64_t v205 = *(void *)(v0 + 1232);
    uint64_t v209 = *(void *)(v0 + 1208);
    uint64_t v214 = *(void *)(v0 + 1200);
    toRangeb = *(CMTimeRange **)(v0 + 1192);
    uint64_t v222 = *(void *)(v0 + 1168);
    uint64_t v228 = *(void *)(v0 + 1160);
    uint64_t v232 = *(void *)(v0 + 1136);
    uint64_t v236 = *(void *)(v0 + 1128);
    uint64_t v240 = *(void *)(v0 + 1104);
    uint64_t v243 = *(void *)(v0 + 1080);
    swift_task_dealloc(*(void *)(v0 + 1456));
    swift_task_dealloc(v100);
    swift_task_dealloc(v101);
    swift_task_dealloc(v102);
    swift_task_dealloc(v103);
    swift_task_dealloc(v104);
    swift_task_dealloc(v105);
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v183);
    swift_task_dealloc(v186);
    swift_task_dealloc(v189);
    swift_task_dealloc(v193);
    swift_task_dealloc(v197);
    swift_task_dealloc(v201);
    swift_task_dealloc(v205);
    swift_task_dealloc(v209);
    swift_task_dealloc(v214);
    swift_task_dealloc(toRangeb);
    swift_task_dealloc(v222);
    swift_task_dealloc(v228);
    swift_task_dealloc(v232);
    swift_task_dealloc(v236);
    swift_task_dealloc(v240);
    swift_task_dealloc(v243);
    uint64_t v109 = *(uint64_t (**)(void))(v0 + 8);
  }

  return v109();
}

uint64_t sub_1000113BC()
{
  uint64_t v1 = *(void **)(v0 + 1472);
  swift_willThrow();

  uint64_t v2 = *(void *)(v0 + 1432);
  uint64_t v3 = *(void *)(v0 + 1408);
  uint64_t v4 = *(void *)(v0 + 1400);
  uint64_t v5 = *(void *)(v0 + 1392);
  uint64_t v6 = *(void *)(v0 + 1384);
  uint64_t v7 = *(void *)(v0 + 1376);
  uint64_t v8 = *(void *)(v0 + 1352);
  uint64_t v9 = *(void *)(v0 + 1328);
  uint64_t v10 = *(void *)(v0 + 1320);
  uint64_t v12 = *(void *)(v0 + 1312);
  uint64_t v13 = *(void *)(v0 + 1304);
  uint64_t v14 = *(void *)(v0 + 1296);
  uint64_t v15 = *(void *)(v0 + 1272);
  uint64_t v16 = *(void *)(v0 + 1264);
  uint64_t v17 = *(void *)(v0 + 1240);
  uint64_t v18 = *(void *)(v0 + 1232);
  uint64_t v19 = *(void *)(v0 + 1208);
  uint64_t v20 = *(void *)(v0 + 1200);
  uint64_t v21 = *(void *)(v0 + 1192);
  uint64_t v22 = *(void *)(v0 + 1168);
  uint64_t v23 = *(void *)(v0 + 1160);
  uint64_t v24 = *(void *)(v0 + 1136);
  uint64_t v25 = *(void *)(v0 + 1128);
  uint64_t v26 = *(void *)(v0 + 1104);
  uint64_t v27 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000115A0()
{
  uint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1352);
  uint64_t v3 = *(void *)(v0 + 1344);
  uint64_t v4 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v0 + 1432);
  uint64_t v6 = *(void *)(v0 + 1408);
  uint64_t v7 = *(void *)(v0 + 1400);
  uint64_t v8 = *(void *)(v0 + 1392);
  uint64_t v9 = *(void *)(v0 + 1384);
  uint64_t v10 = *(void *)(v0 + 1376);
  uint64_t v11 = *(void *)(v0 + 1352);
  uint64_t v12 = *(void *)(v0 + 1328);
  uint64_t v13 = *(void *)(v0 + 1320);
  uint64_t v15 = *(void *)(v0 + 1312);
  uint64_t v16 = *(void *)(v0 + 1304);
  uint64_t v17 = *(void *)(v0 + 1296);
  uint64_t v18 = *(void *)(v0 + 1272);
  uint64_t v19 = *(void *)(v0 + 1264);
  uint64_t v20 = *(void *)(v0 + 1240);
  uint64_t v21 = *(void *)(v0 + 1232);
  uint64_t v22 = *(void *)(v0 + 1208);
  uint64_t v23 = *(void *)(v0 + 1200);
  uint64_t v24 = *(void *)(v0 + 1192);
  uint64_t v25 = *(void *)(v0 + 1168);
  uint64_t v26 = *(void *)(v0 + 1160);
  uint64_t v27 = *(void *)(v0 + 1136);
  uint64_t v28 = *(void *)(v0 + 1128);
  uint64_t v29 = *(void *)(v0 + 1104);
  uint64_t v30 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000117A4()
{
  uint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1352);
  uint64_t v3 = *(void *)(v0 + 1344);
  uint64_t v4 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v0 + 1432);
  uint64_t v6 = *(void *)(v0 + 1408);
  uint64_t v7 = *(void *)(v0 + 1400);
  uint64_t v8 = *(void *)(v0 + 1392);
  uint64_t v9 = *(void *)(v0 + 1384);
  uint64_t v10 = *(void *)(v0 + 1376);
  uint64_t v11 = *(void *)(v0 + 1352);
  uint64_t v12 = *(void *)(v0 + 1328);
  uint64_t v13 = *(void *)(v0 + 1320);
  uint64_t v15 = *(void *)(v0 + 1312);
  uint64_t v16 = *(void *)(v0 + 1304);
  uint64_t v17 = *(void *)(v0 + 1296);
  uint64_t v18 = *(void *)(v0 + 1272);
  uint64_t v19 = *(void *)(v0 + 1264);
  uint64_t v20 = *(void *)(v0 + 1240);
  uint64_t v21 = *(void *)(v0 + 1232);
  uint64_t v22 = *(void *)(v0 + 1208);
  uint64_t v23 = *(void *)(v0 + 1200);
  uint64_t v24 = *(void *)(v0 + 1192);
  uint64_t v25 = *(void *)(v0 + 1168);
  uint64_t v26 = *(void *)(v0 + 1160);
  uint64_t v27 = *(void *)(v0 + 1136);
  uint64_t v28 = *(void *)(v0 + 1128);
  uint64_t v29 = *(void *)(v0 + 1104);
  uint64_t v30 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000119A8()
{
  uint64_t v1 = *(void **)(v0 + 1504);

  uint64_t v2 = *(void *)(v0 + 1432);
  uint64_t v3 = *(void *)(v0 + 1408);
  uint64_t v4 = *(void *)(v0 + 1400);
  uint64_t v5 = *(void *)(v0 + 1392);
  uint64_t v6 = *(void *)(v0 + 1384);
  uint64_t v7 = *(void *)(v0 + 1376);
  uint64_t v8 = *(void *)(v0 + 1352);
  uint64_t v9 = *(void *)(v0 + 1328);
  uint64_t v10 = *(void *)(v0 + 1320);
  uint64_t v12 = *(void *)(v0 + 1312);
  uint64_t v13 = *(void *)(v0 + 1304);
  uint64_t v14 = *(void *)(v0 + 1296);
  uint64_t v15 = *(void *)(v0 + 1272);
  uint64_t v16 = *(void *)(v0 + 1264);
  uint64_t v17 = *(void *)(v0 + 1240);
  uint64_t v18 = *(void *)(v0 + 1232);
  uint64_t v19 = *(void *)(v0 + 1208);
  uint64_t v20 = *(void *)(v0 + 1200);
  uint64_t v21 = *(void *)(v0 + 1192);
  uint64_t v22 = *(void *)(v0 + 1168);
  uint64_t v23 = *(void *)(v0 + 1160);
  uint64_t v24 = *(void *)(v0 + 1136);
  uint64_t v25 = *(void *)(v0 + 1128);
  uint64_t v26 = *(void *)(v0 + 1104);
  uint64_t v27 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011B90()
{
  uint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1272);
  uint64_t v3 = *(void *)(v0 + 1256);
  uint64_t v4 = *(void *)(v0 + 1248);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v0 + 1432);
  uint64_t v6 = *(void *)(v0 + 1408);
  uint64_t v7 = *(void *)(v0 + 1400);
  uint64_t v8 = *(void *)(v0 + 1392);
  uint64_t v9 = *(void *)(v0 + 1384);
  uint64_t v10 = *(void *)(v0 + 1376);
  uint64_t v11 = *(void *)(v0 + 1352);
  uint64_t v12 = *(void *)(v0 + 1328);
  uint64_t v13 = *(void *)(v0 + 1320);
  uint64_t v15 = *(void *)(v0 + 1312);
  uint64_t v16 = *(void *)(v0 + 1304);
  uint64_t v17 = *(void *)(v0 + 1296);
  uint64_t v18 = *(void *)(v0 + 1272);
  uint64_t v19 = *(void *)(v0 + 1264);
  uint64_t v20 = *(void *)(v0 + 1240);
  uint64_t v21 = *(void *)(v0 + 1232);
  uint64_t v22 = *(void *)(v0 + 1208);
  uint64_t v23 = *(void *)(v0 + 1200);
  uint64_t v24 = *(void *)(v0 + 1192);
  uint64_t v25 = *(void *)(v0 + 1168);
  uint64_t v26 = *(void *)(v0 + 1160);
  uint64_t v27 = *(void *)(v0 + 1136);
  uint64_t v28 = *(void *)(v0 + 1128);
  uint64_t v29 = *(void *)(v0 + 1104);
  uint64_t v30 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011D94()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1672);
  uint64_t v2 = *(void **)(v0 + 1504);
  uint64_t v3 = *(void **)(v0 + 1472);
  uint64_t v4 = *(void *)(v0 + 1312);
  uint64_t v5 = *(void *)(v0 + 1280);
  uint64_t v6 = *(void *)(v0 + 1272);
  uint64_t v7 = *(void *)(v0 + 1256);
  uint64_t v8 = *(void *)(v0 + 1248);

  v1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = *(void *)(v0 + 1432);
  uint64_t v10 = *(void *)(v0 + 1408);
  uint64_t v11 = *(void *)(v0 + 1400);
  uint64_t v12 = *(void *)(v0 + 1392);
  uint64_t v13 = *(void *)(v0 + 1384);
  uint64_t v14 = *(void *)(v0 + 1376);
  uint64_t v15 = *(void *)(v0 + 1352);
  uint64_t v16 = *(void *)(v0 + 1328);
  uint64_t v17 = *(void *)(v0 + 1320);
  uint64_t v19 = *(void *)(v0 + 1312);
  uint64_t v20 = *(void *)(v0 + 1304);
  uint64_t v21 = *(void *)(v0 + 1296);
  uint64_t v22 = *(void *)(v0 + 1272);
  uint64_t v23 = *(void *)(v0 + 1264);
  uint64_t v24 = *(void *)(v0 + 1240);
  uint64_t v25 = *(void *)(v0 + 1232);
  uint64_t v26 = *(void *)(v0 + 1208);
  uint64_t v27 = *(void *)(v0 + 1200);
  uint64_t v28 = *(void *)(v0 + 1192);
  uint64_t v29 = *(void *)(v0 + 1168);
  uint64_t v30 = *(void *)(v0 + 1160);
  uint64_t v31 = *(void *)(v0 + 1136);
  uint64_t v32 = *(void *)(v0 + 1128);
  uint64_t v33 = *(void *)(v0 + 1104);
  uint64_t v34 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011FB8()
{
  uint64_t v1 = *(void **)(v0 + 1712);
  uint64_t v2 = *(void **)(v0 + 1504);
  uint64_t v3 = *(void **)(v0 + 1472);
  uint64_t v4 = *(void *)(v0 + 1272);
  uint64_t v5 = *(void *)(v0 + 1256);
  uint64_t v6 = *(void *)(v0 + 1248);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v7 = *(void *)(v0 + 1432);
  uint64_t v8 = *(void *)(v0 + 1408);
  uint64_t v9 = *(void *)(v0 + 1400);
  uint64_t v10 = *(void *)(v0 + 1392);
  uint64_t v11 = *(void *)(v0 + 1384);
  uint64_t v12 = *(void *)(v0 + 1376);
  uint64_t v13 = *(void *)(v0 + 1352);
  uint64_t v14 = *(void *)(v0 + 1328);
  uint64_t v15 = *(void *)(v0 + 1320);
  uint64_t v17 = *(void *)(v0 + 1312);
  uint64_t v18 = *(void *)(v0 + 1304);
  uint64_t v19 = *(void *)(v0 + 1296);
  uint64_t v20 = *(void *)(v0 + 1272);
  uint64_t v21 = *(void *)(v0 + 1264);
  uint64_t v22 = *(void *)(v0 + 1240);
  uint64_t v23 = *(void *)(v0 + 1232);
  uint64_t v24 = *(void *)(v0 + 1208);
  uint64_t v25 = *(void *)(v0 + 1200);
  uint64_t v26 = *(void *)(v0 + 1192);
  uint64_t v27 = *(void *)(v0 + 1168);
  uint64_t v28 = *(void *)(v0 + 1160);
  uint64_t v29 = *(void *)(v0 + 1136);
  uint64_t v30 = *(void *)(v0 + 1128);
  uint64_t v31 = *(void *)(v0 + 1104);
  uint64_t v32 = *(void *)(v0 + 1080);
  swift_task_dealloc(*(void *)(v0 + 1456));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000121CC()
{
  uint64_t v1 = *(void *)(v0 + 1752);
  uint64_t v2 = *(void *)(v0 + 1744);
  uint64_t v3 = *(void **)(v0 + 1656);
  uint64_t v4 = *(void *)(v0 + 1796);
  __C::CMTime v204 = CMTime.init(value:timescale:)(1LL, (int)*(float *)(v0 + 1792));
  *(void *)(v0 + 384) = v2;
  *(void *)(v0 + 392) = v4;
  *(void *)(v0 + 400) = v1;
  *(__C::CMTime *)(v0 + 408) = v204;
  [v3 setTimeRange:v0 + 384];
  uint64_t v5 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1656) startReading];
  *(void *)(v0 + 1016) = 0LL;
  id v6 = [v5 copyNextSampleBuffer];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)(v0 + 1600);
    int v9 = *(_DWORD *)(v0 + 1784);
    int v10 = *(_DWORD *)(v0 + 1780);
    uint64_t v11 = (opaqueCMSampleBuffer *)v6;
    uint64_t v132 = (uint64_t *)(v0 + 1016);
    swift_beginAccess(v0 + 1016, v0 + 840, 1LL, 0LL);
    uint64_t v12 = *(void *)(v0 + 1016);
    if (v10 == v9 || v12 != v8)
    {
      uint64_t v130 = *(void *)(v0 + 1368);
      uint64_t v131 = *(void *)(v0 + 1256);
      uint64_t v192 = *(void *)(v0 + 1184);
      uint64_t v195 = *(void *)(v0 + 1224);
      uint64_t v189 = *(void *)(v0 + 1152);
      uint64_t v128 = *(void *)(v0 + 1096);
      uint64_t v129 = *(void *)(v0 + 1120);
      uint64_t v13 = v7;
      while (1)
      {
        if (!CMSampleBufferGetNumSamples(v11))
        {
          uint64_t v14 = *(void *)(v0 + 1600);
          int v15 = *(_DWORD *)(v0 + 1784);
          int v16 = *(_DWORD *)(v0 + 1780);

          uint64_t v12 = *(void *)(v0 + 1016);
          uint64_t v17 = v13;
          uint64_t v18 = v17;
          if (v16 != v15 && v12 == v14)
          {
            id v7 = v13;
            uint64_t v11 = v17;
            break;
          }

          if (!CMSampleBufferGetNumSamples(v17))
          {
            while (1)
            {
              uint64_t v20 = *(void *)(v0 + 1600);
              int v21 = *(_DWORD *)(v0 + 1784);
              int v22 = *(_DWORD *)(v0 + 1780);

              uint64_t v12 = *(void *)(v0 + 1016);
              uint64_t v23 = v18;
              uint64_t v11 = v23;
              if (v22 != v21 && v12 == v20) {
                break;
              }
              if (CMSampleBufferGetNumSamples(v23)) {
                goto LABEL_17;
              }
            }

            id v7 = v13;
            break;
          }

          uint64_t v11 = v18;
        }

unint64_t sub_100012FD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000878C(&qword_10001C230);
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
    sub_100014B74(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100013F08(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100013EF8(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_100013100(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_10000878C(&qword_10001C0F8);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v11 = sub_100014B3C(0LL, &qword_10001C238, &OBJC_CLASS___AVAssetTrack_ptr);
    **(void **)(*(void *)(v3 + 64) + 4Hasher.init(_seed:)(v1, 0LL) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
    return swift_continuation_throwingResume(v3);
  }

uint64_t sub_1000131A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100013C54(a1);
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
  uint64_t v16 = swift_allocObject(&unk_100018F90, 32LL, 7LL);
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

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10001C1C0, v16);
}

uint64_t sub_1000132F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100013354;
  return v6(a1);
}

uint64_t sub_100013354()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000133A0(uint64_t a1)
{
  return sub_10000B7B8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000133A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100013478(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000139E8((uint64_t)v12, *a3);
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
      sub_1000139E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000B1D4(v12);
  return v7;
}

uint64_t sub_100013478(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100013630(a5, a6);
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

uint64_t sub_100013630(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000136C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_10001389C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001389C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000136C4(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100013838(v4, 0LL);
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

void *sub_100013838(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_10000878C(&qword_10001C190);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10001389C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000878C(&qword_10001C190);
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

  __break(1u);
  return result;
}

uint64_t sub_1000139E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100013A28()
{
  uint64_t v17 = type metadata accessor for File(0LL);
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = type metadata accessor for VideoPreview.Constraints(0LL);
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_10000878C(&qword_10001C198);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);
  return swift_deallocObject(v0, v15, v13);
}

uint64_t sub_100013B2C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for File(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for VideoPreview.Constraints(0LL) - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_10000878C(&qword_10001C198) - 8) + 80LL);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = v1 + v8;
  uint64_t v16 = v1 + (v11 & ~v10);
  uint64_t v17 = (void *)swift_task_alloc(dword_10001C1AC);
  *(void *)(v2 + 16) = v17;
  void *v17 = v2;
  v17[1] = sub_100013C0C;
  return sub_10000B9FC(a1, v12, v13, v14, v15, v16);
}

uint64_t sub_100013C0C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100013C54(uint64_t a1)
{
  uint64_t v2 = sub_10000878C(&qword_10001C1A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100013C94()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100013CB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_10001C1BC);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100014BBC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001C1B8 + dword_10001C1B8))(a1, v4);
}

uint64_t sub_100013D28()
{
  uint64_t v17 = type metadata accessor for File(0LL);
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = type metadata accessor for VideoPreview.Constraints(0LL);
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_10000878C(&qword_10001C198);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);
  return swift_deallocObject(v0, v15, v13);
}

uint64_t sub_100013E24(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for File(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for VideoPreview.Constraints(0LL) - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_10000878C(&qword_10001C198) - 8) + 80LL);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = v1 + v5;
  uint64_t v13 = v1 + v8;
  uint64_t v14 = v1 + (v11 & ~v10);
  uint64_t v15 = (void *)swift_task_alloc(dword_10001C1CC);
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = sub_100013C0C;
  return sub_10000C130(a1, v12, v13, v14);
}

_OWORD *sub_100013EF8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100013F08(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000146E8(a1, a2, v5);
}

Swift::Int sub_100013F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000878C(&qword_10001C248);
  char v38 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v3;
  uint64_t v37 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_24;
    }

    if (__OFADD__(v15++, 1LL)) {
      goto LABEL_43;
    }
    if (v15 >= v12) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v15);
    if (!v25)
    {
      int64_t v26 = v15 + 1;
      if (v15 + 1 >= v12)
      {
LABEL_34:
        swift_release(v5);
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_41;
        }
        goto LABEL_37;
      }

      unint64_t v25 = *(void *)(v37 + 8 * v26);
      if (!v25)
      {
        while (1)
        {
          int64_t v15 = v26 + 1;
          if (__OFADD__(v26, 1LL)) {
            break;
          }
          if (v15 >= v12) {
            goto LABEL_34;
          }
          unint64_t v25 = *(void *)(v37 + 8 * v15);
          ++v26;
          if (v25) {
            goto LABEL_23;
          }
        }

LABEL_23:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_24:
    os_log_type_t v27 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    char v30 = *(_BYTE *)(*(void *)(v5 + 56) + v22);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain(v27[1]);
    }
    Hasher.init(_seed:)(v39, *(void *)(v8 + 40));
    String.hash(into:)(v39, v29, v28);
    Swift::Int result = Hasher._finalize()();
    uint64_t v16 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v33 = v18 == v32;
        if (v18 == v32) {
          unint64_t v18 = 0LL;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v13 + 8 * v18);
      }

      while (v34 == -1);
      unint64_t v19 = __clz(__rbit64(~v34)) + (v18 << 6);
    }

    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t v20 = (void *)(*(void *)(v8 + 48) + 16 * v19);
    *uint64_t v20 = v29;
    v20[1] = v28;
    *(_BYTE *)(*(void *)(v8 + 56) + v19) = v30;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v24 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_41:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_100014254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000878C(&qword_10001C230);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      unint64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_100013EF8(v25, v38);
      }

      else
      {
        sub_1000139E8((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *uint64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_100013EF8(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

_OWORD *sub_100014550(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100013F08(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        int64_t v19 = (void *)(v18[7] + 32 * v12);
        sub_10000B1D4(v19);
        return sub_100013EF8(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100014958();
      goto LABEL_7;
    }

    sub_100014254(v15, a4 & 1);
    unint64_t v21 = sub_100013F08(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_100014680(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_100014680(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100013EF8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_1000146E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15) & 1) == 0);
    }
  }

  return v6;
}

void *sub_1000147C8()
{
  uint64_t v1 = v0;
  sub_10000878C(&qword_10001C248);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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

    if (__OFADD__(v9++, 1LL)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    BOOL v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(void *)(v2 + 56) + v15);
    int64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *int64_t v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain(v17);
  }

  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_100014958()
{
  uint64_t v1 = v0;
  sub_10000878C(&qword_10001C230);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }

  unint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1000139E8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_100013EF8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

uint64_t sub_100014B3C(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100014B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000878C(&qword_10001C240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}