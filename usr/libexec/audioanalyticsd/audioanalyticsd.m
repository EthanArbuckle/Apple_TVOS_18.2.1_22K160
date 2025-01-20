int main(int argc, const char **argv, const char **envp)
{
  id v3;
  v3 = objc_allocWithZone((Class)type metadata accessor for Server(0LL));
  qword_100042340 = (uint64_t)sub_100013718(0LL);
  dispatch_main();
}

unint64_t sub_1000057C0(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_100041688);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }

  sub_100005EA4(&qword_100041690);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  v10 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100006654(v13, (uint64_t)v5, &qword_100041688);
    uint64_t v15 = *v5;
    uint64_t v16 = v5[1];
    unint64_t result = sub_10001F324(*v5, v16);
    if ((v18 & 1) != 0) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    uint64_t *v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = type metadata accessor for SimpleType(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32LL))( v21 + *(void *)(*(void *)(v22 - 8) + 72LL) * v19,  v10,  v22);
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
      swift_release(v8);
      uint64_t v26 = v28;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100005960(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_1000416C0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }

  sub_100005EA4(&qword_1000416C8);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v27 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100006654(v13, (uint64_t)v5, &qword_1000416C0);
    unint64_t result = sub_10001F3E0((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for FeatureInfo(0LL);
    sub_100006698( (uint64_t)v5,  v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  type metadata accessor for FeatureInfo);
    uint64_t v20 = v8[7];
    uint64_t v21 = type metadata accessor for FeatureState(0LL);
    unint64_t result = sub_100006698( v10,  v20 + *(void *)(*(void *)(v21 - 8) + 72LL) * v17,  type metadata accessor for FeatureState);
    uint64_t v22 = v8[2];
    BOOL v23 = __OFADD__(v22, 1LL);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_12;
    }
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v25 = v27;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100005B18(uint64_t a1)
{
  return sub_100005C50(a1, &qword_1000416A8);
}

unint64_t sub_100005B24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005EA4(&qword_1000416A0);
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
  uint64_t v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v10 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    unint64_t result = sub_10001F324(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    uint64_t v14 = (void *)(v4[7] + 16 * result);
    *uint64_t v14 = v10;
    v14[1] = v9;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
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

unint64_t sub_100005C44(uint64_t a1)
{
  return sub_100005C50(a1, &qword_100041698);
}

unint64_t sub_100005C50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005EA4(a2);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v8 = (uint64_t)*(v7 - 2);
    uint64_t v9 = (uint64_t)*(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    id v11 = v10;
    unint64_t result = sub_10001F324(v8, v9);
    if ((v13 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v14 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v14 = v8;
    v14[1] = v9;
    *(void *)(v5[7] + 8 * result) = v11;
    uint64_t v15 = v5[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of MobileAssetsHandler.downloadedCallback()
{
  return 0LL;
}

id variable initialization expression of MobileAssetsHandler.downloadOptions()
{
  id v0 = [objc_allocWithZone(MADownloadOptions) init];
  [v0 setAllowsCellularAccess:1];
  [v0 setRequiresPowerPluggedIn:1];
  [v0 setCanUseLocalCacheServer:1];
  if (qword_100041620 != -1) {
    swift_once(&qword_100041620, sub_100011174);
  }
  [v0 setTimeoutIntervalForResource:qword_100041838];
  return v0;
}

unint64_t variable initialization expression of MobileAssetsHandler.assetType()
{
  return 0xD000000000000024LL;
}

unint64_t variable initialization expression of MobileAssetsHandler.xpcActivityRefreshID()
{
  return 0xD000000000000028LL;
}

uint64_t variable initialization expression of SystemMonitor.currentFeatureStates()
{
  unint64_t v0 = sub_100005960((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v1 = sub_100005EA4(&qword_100041648);
  uint64_t result = swift_allocObject(v1, 28LL, 7LL);
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t sub_100005EA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of SystemMonitor.notificationQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100006080();
  static DispatchQoS.default.getter();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))( v6,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v3);
  uint64_t v15 = _swiftEmptyArrayStorage;
  uint64_t v10 = sub_1000061B8( (unint64_t *)&unk_100041C10,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v11 = sub_100005EA4(&qword_100041658);
  unint64_t v12 = sub_1000060BC();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v0, v10);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002FLL,  0x8000000100036640LL,  v9,  v2,  v6,  0LL);
}

unint64_t sub_100006080()
{
  unint64_t result = qword_100041650;
  if (!qword_100041650)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100041650);
  }

  return result;
}

unint64_t sub_1000060BC()
{
  unint64_t result = qword_100041C20;
  if (!qword_100041C20)
  {
    uint64_t v1 = sub_100006108(&qword_100041658);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100041C20);
  }

  return result;
}

uint64_t sub_100006108(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void type metadata accessor for AudioEventCategory(uint64_t a1)
{
}

void type metadata accessor for AudioServiceType(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_10000618C()
{
  return sub_1000061B8( &qword_100041678,  (uint64_t (*)(uint64_t))type metadata accessor for AudioEventCategory,  (uint64_t)&unk_100035700);
}

uint64_t sub_1000061B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void sub_1000061F8(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100006204@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

_WORD *sub_100006214@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

void sub_100006224(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_100006230@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_100006240(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_10000624C()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006290()
{
}

Swift::Int sub_1000062B8(uint64_t a1)
{
  Swift::UInt32 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int sub_1000062F8()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000633C()
{
}

Swift::Int sub_100006364(uint64_t a1)
{
  Swift::UInt16 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_1000063A4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_1000063B8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1000063CC(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_1000416B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (Swift::UInt32 *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100005EA4(&qword_1000416B8);
    uint64_t v7 = (void *)static _DictionaryStorage.allocate(capacity:)(v6);
    uint64_t v8 = (char *)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_100006654(v9, (uint64_t)v5, &qword_1000416B0);
      Swift::UInt32 v11 = *v5;
      unint64_t result = sub_10001F388(*v5);
      if ((v13 & 1) != 0) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
      *(_DWORD *)(v7[6] + 4 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for Message(0LL);
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32LL))( v15 + *(void *)(*(void *)(v16 - 8) + 72LL) * v14,  v8,  v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1LL);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }

    __break(1u);
LABEL_10:
    __break(1u);
  }

  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }

  return result;
}

unint64_t sub_100006534(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100005EA4(&qword_100041680);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v1);
  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 36);
  uint64_t v6 = *(void *)(a1 + 40);
  unint64_t result = sub_10001F59C(v4 | (v5 << 32));
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(v6);
    return (unint64_t)v3;
  }

  uint64_t v9 = (uint64_t *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v10 = v3[6] + 8 * result;
    *(_DWORD *)uint64_t v10 = v4;
    *(_WORD *)(v10 + 4) = v5;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 2;
    uint64_t v4 = *((unsigned int *)v9 - 2);
    uint64_t v5 = *((unsigned __int16 *)v9 - 2);
    uint64_t v15 = *v9;
    swift_retain(v6);
    unint64_t result = sub_10001F59C(v4 | (v5 << 32));
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if ((v16 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100006654(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006698(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
}

void type metadata accessor for AudioEventType(uint64_t a1)
{
}

void sub_100006704(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006748()
{
  return sub_1000061B8( &qword_1000416E0,  (uint64_t (*)(uint64_t))type metadata accessor for AudioEventType,  (uint64_t)&unk_1000357D4);
}

void sub_100006784(uint64_t a1, void **a2)
{
  uint64_t v4 = type metadata accessor for TraceArgs(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TraceCode(0LL);
  uint64_t v67 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v73, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    char v16 = (void *)Strong;
    uint64_t v64 = v8;
    uint64_t v65 = v5;
    uint64_t v66 = v4;
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v19 = 134217984;
      v71 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v19 + 4, v19 + 12);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "createSession() called. { reporterID=%lld }", v19, 0xCu);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    uint64_t v20 = (void *)((char *)v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess( (char *)v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID,  &v71,  0LL,  0LL);
    if (*(void *)(*v20 + 16) > 0x63uLL)
    {
      uint64_t v25 = (void *)Logger.logObject.getter(v21);
      os_log_type_t v36 = static os_log_type_t.fault.getter();
      if (!os_log_type_enabled((os_log_t)v25, v36))
      {
LABEL_17:
        swift_release(v16);

        return;
      }

      uint64_t v28 = swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v28 = 134217984;
      uint64_t v69 = 100LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v28 + 4, v28 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  v36,  "Not creating session. Client has exceeded max number of sessions. { maxNumberOfSessions=%ld }",  (uint8_t *)v28,  0xCu);
LABEL_16:
      swift_slowDealloc(v28, -1LL, -1LL);
      goto LABEL_17;
    }

    double v22 = static Double.now()(v21);
    *(double *)((char *)v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v22 + 30.0;
    swift_beginAccess(v20, &v69, 32LL, 0LL);
    if (*(void *)(*v20 + 16) && (sub_10001F56C((uint64_t)a2), (v23 & 1) != 0))
    {
      swift_endAccess(&v69);
      uint64_t v24 = swift_retain_n(v16, 3LL);
      uint64_t v25 = (void *)Logger.logObject.getter(v24);
      os_log_type_t v26 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled((os_log_t)v25, v26))
      {
        uint64_t v27 = a2;
        uint64_t v28 = swift_slowAlloc(28LL, -1LL);
        uint64_t v29 = swift_slowAlloc(32LL, -1LL);
        uint64_t v68 = (uint64_t)v27;
        uint64_t v69 = v29;
        *(_DWORD *)uint64_t v28 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v28 + 4, v28 + 12);
        *(_WORD *)(v28 + 12) = 1024;
        LODWORD(v68) = *(_DWORD *)((char *)v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, (char *)&v68 + 4, v28 + 14, v28 + 18);
        swift_release(v16);
        *(_WORD *)(v28 + 18) = 2081;
        uint64_t v30 = v16[3];
        unint64_t v31 = v16[4];
        swift_bridgeObjectRetain(v31);
        uint64_t v68 = sub_100028CC4(v30, v31, &v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v28 + 20, v28 + 28);
        swift_release_n(v16, 2LL);
        swift_bridgeObjectRelease(v31);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  v26,  "createSession skipped, session already exists. { reporterID=%lld, pid=%d, processName=%{private}s }",  (uint8_t *)v28,  0x1Cu);
        swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v29, -1LL, -1LL);
        goto LABEL_16;
      }

      swift_release_n(v16, 4LL);
    }

    else
    {
      v62 = v7;
      swift_endAccess(&v69);
      uint64_t v61 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      int v37 = *(_DWORD *)((char *)v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
      uint64_t v38 = v16[3];
      unint64_t v39 = v16[4];
      uint64_t v40 = v16[2];
      uint64_t v41 = type metadata accessor for Session(0LL);
      swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
      swift_bridgeObjectRetain(v39);
      swift_retain(v40);
      uint64_t v42 = sub_1000241D0(a2, v37, v38, v39, v40, 0);
      swift_beginAccess(v20, &v69, 33LL, 0LL);
      swift_retain(v42);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v20);
      uint64_t v68 = *v20;
      uint64_t *v20 = 0x8000000000000000LL;
      sub_100020520(v42, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
      uint64_t v44 = *v20;
      uint64_t *v20 = v68;
      swift_bridgeObjectRelease(v44);
      swift_endAccess(&v69);
      uint64_t v45 = swift_retain_n(v16, 3LL);
      v46 = (os_log_s *)Logger.logObject.getter(v45);
      os_log_type_t v47 = static os_log_type_t.debug.getter();
      BOOL v48 = os_log_type_enabled(v46, v47);
      uint64_t v63 = v42;
      if (v48)
      {
        uint64_t v49 = swift_slowAlloc(28LL, -1LL);
        uint64_t v50 = swift_slowAlloc(32LL, -1LL);
        uint64_t v68 = (uint64_t)a2;
        uint64_t v69 = v50;
        *(_DWORD *)uint64_t v49 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v49 + 4, v49 + 12);
        *(_WORD *)(v49 + 12) = 1024;
        LODWORD(v68) = *(_DWORD *)((char *)v16 + v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, (char *)&v68 + 4, v49 + 14, v49 + 18);
        swift_release(v16);
        *(_WORD *)(v49 + 18) = 2081;
        uint64_t v61 = (uint64_t)a2;
        uint64_t v51 = v16[3];
        unint64_t v52 = v16[4];
        swift_bridgeObjectRetain(v52);
        uint64_t v68 = sub_100028CC4(v51, v52, &v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v49 + 20, v49 + 28);
        swift_release_n(v16, 2LL);
        swift_bridgeObjectRelease(v52);
        _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "Created session. { reporterID=%lld, pid=%d, processName=%{private}s }",  (uint8_t *)v49,  0x1Cu);
        swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1LL, -1LL);
        swift_slowDealloc(v49, -1LL, -1LL);

        uint64_t v53 = v61;
      }

      else
      {
        swift_release_n(v16, 3LL);

        uint64_t v53 = (uint64_t)a2;
      }

      uint64_t v55 = v65;
      uint64_t v54 = v66;
      uint64_t v56 = v64;
      uint64_t v57 = v67;
      v58 = v62;
      (*(void (**)(char *, void, uint64_t))(v67 + 104))(v10, enum case for TraceCode.serverCreate(_:), v64);
      uint64_t v59 = static Utilities.positiveReporterID(_:)(v53);
      TraceArgs.init(arg1:arg2:arg3:arg4:)(v59, 0LL, 0LL, 0LL);
      static Trace.post(_:args:)(v10, v58);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v58, v54);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v56);
      sub_10000B8D0();
      swift_release(v16);
      swift_release(v63);
    }
  }

  else
  {
    uint64_t v32 = static Logger.service.getter(0LL);
    v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v35 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "ClientServerInstance is gone. { action=createSession }",  v35,  2u);
      swift_slowDealloc(v35, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

uint64_t sub_100006F80(__int16 a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = swift_allocObject(&unk_10003D2C0, 24LL, 7LL);
  swift_weakInit(v14 + 16, v3);
  uint64_t v15 = swift_allocObject(&unk_10003D720, 34LL, 7LL);
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = a2;
  *(_WORD *)(v15 + 32) = a1;
  aBlock[4] = sub_10000B774;
  uint64_t v27 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003D738;
  char v16 = _Block_copy(aBlock);
  id v17 = v13;
  uint64_t v18 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v18);
  uint64_t v25 = _swiftEmptyArrayStorage;
  unint64_t v19 = sub_10000B4F4();
  uint64_t v20 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v21 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v20, v21, v6, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = v27;
  swift_release(v14);
  return swift_release(v22);
}

void sub_1000071A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v68, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v14 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v66, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "setServiceType() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    double v16 = static Double.now()(v15);
    *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v16 + 1.0;
    uint64_t v17 = sub_10000BE60(a2, 0, 0x6976726553746573LL, 0xEE00657079546563LL);
    if (v17)
    {
      uint64_t v18 = v17;
      int v19 = *(unsigned __int16 *)(v17 + 64);
      if (v19 == (unsigned __int16)a3)
      {
        uint64_t v20 = (os_log_s *)Logger.logObject.getter(v17);
        os_log_type_t v21 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = swift_slowAlloc(22LL, -1LL);
          char v23 = (void **)swift_slowAlloc(32LL, -1LL);
          aBlock = v23;
          *(_DWORD *)uint64_t v22 = 136446466;
          uint64_t v24 = static Utilities.serviceTypeDescription(from:)(a3);
          unint64_t v26 = v25;
          uint64_t v64 = sub_100028CC4(v24, v25, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v22 + 4, v22 + 12);
          swift_bridgeObjectRelease(v26);
          *(_WORD *)(v22 + 12) = 2048;
          uint64_t v64 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v22 + 14, v22 + 22);
          uint64_t v27 = "ServiceType did not change. { serviceType=%{public}s, reporterID=%lld }";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v27, (uint8_t *)v22, 0x16u);
          swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v23, -1LL, -1LL);
          swift_slowDealloc(v22, -1LL, -1LL);
          goto LABEL_21;
        }

        goto LABEL_21;
      }

      if (v19 == 0xFFFF)
      {
        sub_100028210(a3);
        *(_WORD *)(v18 + 64) = a3;
        uint64_t v20 = (os_log_s *)Logger.logObject.getter(v56);
        os_log_type_t v21 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = swift_slowAlloc(22LL, -1LL);
          char v23 = (void **)swift_slowAlloc(32LL, -1LL);
          aBlock = v23;
          *(_DWORD *)uint64_t v22 = 136446466;
          uint64_t v57 = static Utilities.serviceTypeDescription(from:)(a3);
          unint64_t v59 = v58;
          uint64_t v64 = sub_100028CC4(v57, v58, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v22 + 4, v22 + 12);
          swift_bridgeObjectRelease(v59);
          *(_WORD *)(v22 + 12) = 2048;
          uint64_t v64 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v22 + 14, v22 + 22);
          uint64_t v27 = "Received serviceType for reporterID. { serviceType=%{public}s, reporterID=%lld }";
          goto LABEL_20;
        }

LABEL_21:
        swift_release(v18);
        swift_release(v11);

        return;
      }

      v33 = *(dispatch_queue_s **)(v17 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      uint64_t v34 = swift_allocObject(&unk_10003D770, 25LL, 7LL);
      *(void *)(v34 + 16) = v18;
      *(_BYTE *)(v34 + 24) = 0;
      uint64_t v35 = swift_allocObject(&unk_10003D798, 32LL, 7LL);
      *(void *)(v35 + 16) = sub_10000B840;
      *(void *)(v35 + 24) = v34;
      v66[3] = sub_10000B83C;
      uint64_t v67 = v35;
      aBlock = _NSConcreteStackBlock;
      v66[0] = 1107296256LL;
      v66[1] = sub_100016C50;
      v66[2] = &unk_10003D7B0;
      os_log_type_t v36 = _Block_copy(&aBlock);
      uint64_t v37 = v67;
      swift_retain(v18);
      swift_retain(v35);
      swift_release(v37);
      dispatch_sync(v33, v36);
      _Block_release(v36);
      LOBYTE(v33) = swift_isEscapingClosureAtFileLocation(v35, "", 111LL, 96LL, 24LL, 1LL);
      swift_release(v34);
      swift_release(v35);
      if ((v33 & 1) != 0)
      {
        __break(1u);
        return;
      }

      uint64_t v38 = (void *)swift_retain(v18);
      uint64_t v39 = sub_10002CEA0(v38);
      sub_100028210(a3);
      *(_WORD *)(v39 + 64) = a3;
      uint64_t v40 = (uint64_t *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
      swift_beginAccess( v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID,  &aBlock,  33LL,  0LL);
      swift_retain(v39);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v40);
      uint64_t v64 = *v40;
      *uint64_t v40 = 0x8000000000000000LL;
      sub_100020520(v39, a2, isUniquelyReferenced_nonNull_native);
      uint64_t v42 = *v40;
      *uint64_t v40 = v64;
      swift_bridgeObjectRelease(v42);
      swift_endAccess(&aBlock);
      uint64_t v43 = static Utilities.serviceTypeDescription(from:)(*(unsigned __int16 *)(v18 + 64));
      unint64_t v45 = v44;
      uint64_t v46 = static Utilities.serviceTypeDescription(from:)(a3);
      unint64_t v48 = v47;
      swift_bridgeObjectRetain(v47);
      swift_bridgeObjectRetain(v45);
      uint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
      os_log_type_t v51 = static os_log_type_t.debug.getter();
      uint64_t v63 = v50;
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = v46;
        uint64_t v53 = swift_slowAlloc(32LL, -1LL);
        v62 = (void **)swift_slowAlloc(64LL, -1LL);
        aBlock = v62;
        *(_DWORD *)uint64_t v53 = 136446722;
        uint64_t v61 = v43;
        swift_bridgeObjectRetain(v48);
        uint64_t v64 = sub_100028CC4(v52, v48, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v53 + 4, v53 + 12);
        swift_bridgeObjectRelease_n(v48, 3LL);
        *(_WORD *)(v53 + 12) = 2082;
        swift_bridgeObjectRetain(v45);
        uint64_t v64 = sub_100028CC4(v61, v45, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v53 + 14, v53 + 22);
        swift_bridgeObjectRelease_n(v45, 3LL);
        *(_WORD *)(v53 + 22) = 2048;
        uint64_t v64 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &aBlock, v53 + 24, v53 + 32);
        uint64_t v54 = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  v51,  "setServiceType() { serviceType=%{public}s, prevServiceType=%{public}s, reporterID=%lld }",  (uint8_t *)v53,  0x20u);
        uint64_t v55 = v62;
        swift_arrayDestroy(v62, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v55, -1LL, -1LL);
        swift_slowDealloc(v53, -1LL, -1LL);
        swift_release(v18);
        swift_release(v11);
      }

      else
      {
        swift_bridgeObjectRelease_n(v45, 2LL);
        swift_bridgeObjectRelease_n(v48, 2LL);
        swift_release(v18);
        swift_release(v11);
      }

      uint64_t v32 = v39;
    }

    else
    {
      uint64_t v32 = v11;
    }

    swift_release(v32);
  }

  else
  {
    uint64_t v28 = static Logger.service.getter(0LL);
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "ClientServerInstance is gone. { action=set:serviceType }",  v31,  2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    os_log_type_t v21 = *v20;
    uint64_t v22 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    os_log_type_t v21 = (-1LL << result) - 1;
  }

  os_log_s *v20 = v22 & v21;
  char v23 = *(void *)(a2 + 16);
  uint64_t v24 = __OFSUB__(v23, 1LL);
  unint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

      uint64_t v68 = v159;
      sub_10001E188(a1, v159, type metadata accessor for FeatureInfo);
      uint64_t v69 = type metadata accessor for FeatureState(0LL);
      uint64_t v70 = (void *)(v68 + *(int *)(v69 + 20));
      v71 = (void *)(a1 + v4[8]);
      uint64_t v72 = v71[1];
      *uint64_t v70 = *v71;
      v70[1] = v72;
      (*(void (**)(void))(v157 + 104))();
      *(_DWORD *)(v68 + *(int *)(v69 + 24)) = -1;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56LL))(v68, 0LL, 1LL, v69);
      swift_bridgeObjectRetain(v72);
      return;
    }

    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.int(_:))
    {
      unint64_t v48 = (uint64_t *)(a1 + v4[5]);
      uint64_t v49 = *v48;
      uint64_t v50 = v48[1];
      os_log_type_t v51 = (uint64_t *)(a1 + v4[6]);
      uint64_t v52 = *v51;
      uint64_t v53 = v51[1];
      uint64_t v54 = static DefaultsUtilities.platformDefaultUserName.getter();
      uint64_t v56 = v55;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)( &state64,  v49,  v50,  v52,  v53,  v54,  v55,  &type metadata for Int64);
      swift_bridgeObjectRelease(v56);
      if ((v162 & 1) == 0)
      {
        v98 = state64;
        v99 = a1;
        uint64_t v42 = v159;
        sub_10001E188(v99, v159, type metadata accessor for FeatureInfo);
        uint64_t v43 = type metadata accessor for FeatureState(0LL);
        *(void *)(v42 + *(int *)(v43 + 20)) = v98;
        goto LABEL_58;
      }

      uint64_t v57 = v155;
      sub_10001E188(a1, v155, type metadata accessor for FeatureInfo);
      unint64_t v58 = (uint64_t *)(a1 + v4[8]);
      unint64_t v59 = *v58;
      uint64_t v60 = v58[1];
      uint64_t v61 = HIBYTE(v60) & 0xF;
      v62 = v59 & 0xFFFFFFFFFFFFLL;
      if ((v60 & 0x2000000000000000LL) != 0) {
        uint64_t v63 = HIBYTE(v60) & 0xF;
      }
      else {
        uint64_t v63 = v59 & 0xFFFFFFFFFFFFLL;
      }
      if (!v63)
      {
        v139 = 0LL;
LABEL_84:
        v140 = v154;
        *v154 = v139;
        v142 = v157;
        v141 = v158;
        (*(void (**)(uint64_t *, void, uint64_t))(v157 + 104))(v140, enum case for SimpleType.int(_:), v158);
        v116 = v159;
        sub_100006698(v57, v159, type metadata accessor for FeatureInfo);
        uint64_t v43 = type metadata accessor for FeatureState(0LL);
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(v142 + 32))(v116 + *(int *)(v43 + 20), v140, v141);
        goto LABEL_85;
      }

      if ((v60 & 0x1000000000000000LL) != 0)
      {
        swift_bridgeObjectRetain(v60);
        uint64_t v65 = (uint64_t)sub_1000328C4(v59, v60, 10LL);
        uint64_t v67 = v148;
        swift_bridgeObjectRelease(v60);
LABEL_81:
        if ((v67 & 1) != 0) {
          v139 = 0LL;
        }
        else {
          v139 = v65;
        }
        goto LABEL_84;
      }

      if ((v60 & 0x2000000000000000LL) == 0)
      {
        if ((v59 & 0x1000000000000000LL) != 0) {
          uint64_t v64 = (unsigned __int8 *)((v60 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          uint64_t v64 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v59, v60);
        }
        uint64_t v65 = (uint64_t)sub_1000329A8(v64, v62, 10LL);
        uint64_t v67 = v66 & 1;
        goto LABEL_81;
      }

      state64 = v59;
      v162 = v60 & 0xFFFFFFFFFFFFFFLL;
      if (v59 == 43)
      {
        if (!v61) {
          goto LABEL_102;
        }
        uint64_t v65 = (BYTE1(v59) - 48);
        v134 = v61 - 2;
        if (v134)
        {
          v135 = (unsigned __int8 *)&state64 + 2;
          while (1)
          {
            v136 = *v135 - 48;
            if (v136 > 9) {
              goto LABEL_78;
            }
            v137 = 10 * v65;
            uint64_t v65 = v137 + v136;
            uint64_t v67 = 0;
            ++v135;
            if (!--v134) {
              goto LABEL_81;
            }
          }
        }
      }

      else
      {
        if (v59 == 45)
        {
          if (v61)
          {
            if (v61 != 1 && (BYTE1(v59) - 48) <= 9u)
            {
              uint64_t v65 = -(uint64_t)(BYTE1(v59) - 48);
              v122 = v61 - 2;
              if (v122)
              {
                v123 = (unsigned __int8 *)&state64 + 2;
                while (1)
                {
                  v124 = *v123 - 48;
                  if (v124 > 9) {
                    goto LABEL_78;
                  }
                  v125 = 10 * v65;
                  uint64_t v65 = v125 - v124;
                  uint64_t v67 = 0;
                  ++v123;
                  if (!--v122) {
                    goto LABEL_81;
                  }
                }
              }

              goto LABEL_80;
            }

uint64_t sub_1000079C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v26[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  a1 += 16LL;
  swift_beginAccess(a1, v26, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v11 = Strong;
    double v13 = static Double.now()(Strong);
    *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v13 + 1.0;
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)double v16 = 134217984;
      uint64_t v25 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v16 + 4, v16 + 12);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "getServiceName() called. { reporterID=%lld }", v16, 0xCu);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    uint64_t v17 = sub_10000BE60(a2, 0, 0x4E65636976726573LL, 0xEB00000000656D61LL);
    if (!v17 || (uint64_t v18 = *(unsigned __int16 *)(v17 + 64), swift_release(v17), (_DWORD)v18 == 0xFFFF))
    {
      uint64_t v19 = static Utilities.generateError(with:code:)(0xD00000000000002DLL, 0x8000000100036740LL, -1LL);
      uint64_t v18 = 0xFFFFLL;
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    a3(v19, v18);
    swift_errorRelease(v19);
    return swift_release(v11);
  }

  else
  {
    uint64_t v21 = static Logger.service.getter(0LL);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "ClientServerInstance is gone. { action=getServiceName }",  v24,  2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }

void sub_100007CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v4 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = (id)v4;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100007D38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = swift_allocObject(&unk_10003D2C0, 24LL, 7LL);
  swift_weakInit(v14 + 16, v3);
  os_log_type_t v15 = (void *)swift_allocObject(&unk_10003D5E0, 40LL, 7LL);
  v15[2] = v14;
  v15[3] = a2;
  v15[4] = a1;
  aBlock[4] = sub_10000B6A8;
  uint64_t v27 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003D5F8;
  double v16 = _Block_copy(aBlock);
  id v17 = v13;
  swift_retain(v14);
  swift_bridgeObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v18);
  uint64_t v25 = _swiftEmptyArrayStorage;
  unint64_t v19 = sub_10000B4F4();
  uint64_t v20 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v21 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v20, v21, v6, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = v27;
  swift_release(v14);
  return swift_release(v22);
}

void sub_100007F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v55, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v11 = Strong;
    double v13 = static Double.now()(Strong);
    *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v13 + 1.0;
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)double v16 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v52, v16 + 4, v16 + 12);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "setConfiguration() called. { reporterID=%lld }", v16, 0xCu);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    uint64_t v17 = Dictionary<>.asSimpleType()(a3);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = swift_bridgeObjectRetain_n(a3, 2LL);
      uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = swift_slowAlloc(22LL, -1LL);
        os_log_type_t v23 = (void **)swift_slowAlloc(32LL, -1LL);
        aBlock = v23;
        *(_DWORD *)uint64_t v22 = 136380931;
        uint64_t v49 = v22 + 4;
        __n128 v24 = swift_bridgeObjectRetain(a3);
        uint64_t v50 = (char *)&type metadata for Any + 8;
        uint64_t v25 = Dictionary.description.getter(v24);
        unint64_t v27 = v26;
        swift_bridgeObjectRelease(a3);
        uint64_t v54 = sub_100028CC4(v25, v27, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v49, v22 + 12);
        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease(v27);
        *(_WORD *)(v22 + 12) = 2048;
        uint64_t v54 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v22 + 14, v22 + 22);
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Setting configuration { configuration=%{private}s, reporterID=%lld }",  (uint8_t *)v22,  0x16u);
        swift_arrayDestroy(v23, 1LL, v50);
        swift_slowDealloc(v23, -1LL, -1LL);
        swift_slowDealloc(v22, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a3, 2LL);
      }

      uint64_t v42 = sub_10000BE60(a2, 0, 0x69666E6F43746573LL, 0xE900000000000067LL);
      if (v42)
      {
        uint64_t v43 = v42;
        unint64_t v44 = *(dispatch_queue_s **)(v42 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v45 = swift_allocObject(&unk_10003D630, 32LL, 7LL);
        *(void *)(v45 + 16) = v43;
        *(void *)(v45 + 24) = v18;
        uint64_t v46 = swift_allocObject(&unk_10003D658, 32LL, 7LL);
        *(void *)(v46 + 16) = sub_10000B6E0;
        *(void *)(v46 + 24) = v45;
        v52[3] = sub_10000B83C;
        uint64_t v53 = v46;
        aBlock = _NSConcreteStackBlock;
        v52[0] = 1107296256LL;
        v52[1] = sub_100016C50;
        v52[2] = &unk_10003D670;
        unint64_t v47 = _Block_copy(&aBlock);
        uint64_t v48 = v53;
        swift_retain(v43);
        swift_bridgeObjectRetain(v18);
        swift_retain(v46);
        swift_release(v48);
        dispatch_sync(v44, v47);
        _Block_release(v47);
        LOBYTE(v44) = swift_isEscapingClosureAtFileLocation(v46, "", 111LL, 100LL, 24LL, 1LL);
        swift_release(v43);
        swift_release(v11);
        swift_bridgeObjectRelease(v18);
        swift_release(v45);
        swift_release(v46);
        __break(1u);
      }

      swift_release(v11);
      swift_bridgeObjectRelease(v18);
    }

    else
    {
      uint64_t v32 = swift_bridgeObjectRetain_n(a3, 2LL);
      v33 = (os_log_s *)Logger.logObject.getter(v32);
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc(22LL, -1LL);
        os_log_type_t v36 = (void **)swift_slowAlloc(32LL, -1LL);
        aBlock = v36;
        *(_DWORD *)uint64_t v35 = 136380931;
        __n128 v37 = swift_bridgeObjectRetain(a3);
        uint64_t v50 = (char *)&type metadata for Any + 8;
        uint64_t v38 = a2;
        uint64_t v39 = Dictionary.description.getter(v37);
        unint64_t v41 = v40;
        swift_bridgeObjectRelease(a3);
        uint64_t v54 = sub_100028CC4(v39, v41, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v35 + 4, v35 + 12);
        swift_bridgeObjectRelease_n(a3, 2LL);
        swift_bridgeObjectRelease(v41);
        *(_WORD *)(v35 + 12) = 2048;
        uint64_t v54 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v35 + 14, v35 + 22);
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "Error converting session configuration. { configuration=%{private}s, reporterID=%lld }",  (uint8_t *)v35,  0x16u);
        swift_arrayDestroy(v36, 1LL, v50);
        swift_slowDealloc(v36, -1LL, -1LL);
        swift_slowDealloc(v35, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a3, 2LL);
      }

      swift_release(v11);
    }
  }

  else
  {
    uint64_t v28 = static Logger.service.getter(0LL);
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "ClientServerInstance is gone. { action=set:configuration }",  v31,  2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

uint64_t sub_100008624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v32 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v30 = *(void *)(v14 - 8);
  uint64_t v31 = v14;
  __chkstk_darwin(v14);
  double v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = swift_allocObject(&unk_10003D2C0, 24LL, 7LL);
  swift_weakInit(v18 + 16, v6);
  uint64_t v19 = (void *)swift_allocObject(a4, 48LL, 7LL);
  v19[2] = v18;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a3;
  aBlock[4] = v28;
  uint64_t v35 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = v29;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v17;
  swift_retain(v18);
  uint64_t v22 = swift_retain(a3);
  static DispatchQoS.unspecified.getter(v22);
  v33 = _swiftEmptyArrayStorage;
  unint64_t v23 = sub_10000B4F4();
  uint64_t v24 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v25 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v33, v24, v25, v11, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v16, v13, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
  unint64_t v26 = v35;
  swift_release(v18);
  return swift_release(v26);
}

uint64_t sub_100008848(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t))
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  a1 += 16LL;
  swift_beginAccess(a1, v31, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v11 = Strong;
    double v13 = static Double.now()(Strong);
    *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v13 + 1.0;
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)double v16 = 134217984;
      uint64_t v29 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v16 + 4, v16 + 12);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "validate() called. { reporterID=%lld }", v16, 0xCu);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    uint64_t v17 = sub_10000BE60(a2, 0, 0x65746164696C6176LL, 0xE800000000000000LL);
    uint64_t v18 = sub_100005EA4(&qword_100041708);
    uint64_t inited = swift_initStackObject(v18, v30);
    *(_OWORD *)(inited + 16) = xmmword_1000358C0;
    *(void *)(inited + 32) = 0x726574726F706572LL;
    *(void *)(inited + 40) = 0xEA00000000004449LL;
    if (v17)
    {
      *(void *)(inited + 48) = [objc_allocWithZone(NSNumber) initWithLongLong:*(void *)(v17 + 16)];
      *(void *)(inited + 56) = 0x5465636976726573LL;
      *(void *)(inited + 64) = 0xEB00000000657079LL;
      uint64_t v20 = *(unsigned __int16 *)(v17 + 64);
    }

    else
    {
      *(void *)(inited + 48) = [objc_allocWithZone(NSNumber) initWithLongLong:0];
      *(void *)(inited + 56) = 0x5465636976726573LL;
      *(void *)(inited + 64) = 0xEB00000000657079LL;
      uint64_t v20 = 0xFFFFLL;
    }

    *(void *)(inited + 72) = [objc_allocWithZone(NSNumber) initWithUnsignedShort:v20];
    unint64_t v26 = sub_100005B18(inited);
    sub_100011A24(v26);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease(v26);
    a3(0LL, v28);
    swift_release(v11);
    swift_release(v17);
    return swift_bridgeObjectRelease(v28);
  }

  else
  {
    uint64_t v21 = static Logger.service.getter(0LL);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "ClientServerInstance is gone. { action=validate }", v24, 2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }

void sub_100008C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v4 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0LL;
  }
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, void *, Class))(a3 + 16))(a3, v4, isa);
}

uint64_t sub_100008CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  a1 += 16LL;
  swift_beginAccess(a1, v23, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v12 = 134217984;
      uint64_t v22 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v12 + 4, v12 + 12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "startSession() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    double v14 = static Double.now()(v13);
    *(double *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v14 + 5.0;
    uint64_t v15 = sub_10000BE60(a2, 0, 0x7472617473LL, 0xE500000000000000LL);
    if (v15)
    {
      uint64_t v16 = v15;
      sub_100022B14();
      swift_release(v16);
    }

    return swift_release(v9);
  }

  else
  {
    uint64_t v18 = static Logger.service.getter(0LL);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "ClientServerInstance is gone. { action=startSession }",  v21,  2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }

uint64_t sub_100008EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return swift_release(a1);
}

uint64_t sub_100008F54(uint64_t a1, int a2, __int16 a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v29 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v27 = *(void *)(v13 - 8);
  uint64_t v28 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_allocObject(&unk_10003D2C0, 24LL, 7LL);
  swift_weakInit(v17 + 16, v5);
  uint64_t v18 = swift_allocObject(&unk_10003D4C8, 48LL, 7LL);
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = a4;
  *(_DWORD *)(v18 + 32) = a2;
  *(_WORD *)(v18 + 36) = a3;
  *(void *)(v18 + 40) = a1;
  aBlock[4] = sub_10000B640;
  uint64_t v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003D4E0;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v16;
  swift_retain(v17);
  swift_bridgeObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v21);
  uint64_t v30 = _swiftEmptyArrayStorage;
  unint64_t v22 = sub_10000B4F4();
  uint64_t v23 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v24 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v15, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v28);
  uint64_t v25 = v32;
  swift_release(v17);
  return swift_release(v25);
}

void sub_10000918C(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v75 = a5;
  unsigned int v76 = a3;
  uint64_t v77 = a2;
  uint64_t v7 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v7);
  v73 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Message(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v74 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for TraceArgs(0LL);
  uint64_t v71 = *(void *)(v12 - 8);
  uint64_t v72 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for TraceCode(0LL);
  uint64_t v69 = *(void *)(v15 - 8);
  uint64_t v70 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v80, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v23 = Strong;
    uint64_t v67 = v14;
    unsigned int v68 = a4;
    uint64_t v24 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v66 = v24;
    if (v27)
    {
      uint64_t v28 = swift_slowAlloc(32LL, -1LL);
      uint64_t v29 = swift_slowAlloc(64LL, -1LL);
      *(_DWORD *)uint64_t v28 = 134284035;
      uint64_t v78 = v77;
      uint64_t v79 = v29;
      uint64_t v64 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v28 + 4, v28 + 12);
      *(_WORD *)(v28 + 12) = 2082;
      uint64_t v65 = v9;
      uint64_t v30 = static Utilities.eventCategoryDescription(from:)(v76);
      unint64_t v32 = v31;
      uint64_t v78 = sub_100028CC4(v30, v31, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v28 + 14, v28 + 22);
      swift_bridgeObjectRelease(v32);
      *(_WORD *)(v28 + 22) = 2082;
      uint64_t v33 = static Utilities.eventTypeDescription(from:)(v68);
      unint64_t v35 = v34;
      uint64_t v78 = sub_100028CC4(v33, v34, &v79);
      uint64_t v10 = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v28 + 24, v28 + 32);
      unint64_t v36 = v35;
      uint64_t v9 = v65;
      swift_bridgeObjectRelease(v36);
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "sendMessage() called. { reporterID=%{private}lld, category=%{public}s, type=%{public}s }",  (uint8_t *)v28,  0x20u);
      swift_arrayDestroy(v29, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    __n128 v37 = v67;
    uint64_t v38 = v75;
    double v40 = static Double.now()(v39);
    *(double *)(v23 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v40 + 1.0;
    uint64_t v41 = Dictionary<>.asSimpleType()(v38);
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = (os_log_s *)Logger.logObject.getter(v41);
      os_log_type_t v44 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v45 = 134217984;
        uint64_t v79 = v77;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, v80, v45 + 4, v45 + 12);
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "sendMessage { reporterID=%lld }", v45, 0xCu);
        swift_slowDealloc(v45, -1LL, -1LL);
      }

      uint64_t v47 = v69;
      uint64_t v46 = v70;
      (*(void (**)(char *, void, uint64_t))(v69 + 104))( v17,  enum case for TraceCode.serverSendMessage(_:),  v70);
      uint64_t v48 = v77;
      uint64_t v49 = static Utilities.positiveReporterID(_:)(v77);
      TraceArgs.init(arg1:arg2:arg3:arg4:)(v49, 0LL, 0LL, 0LL);
      static Trace.post(_:args:)(v17, v37);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v37, v72);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v17, v46);
      uint64_t v50 = type metadata accessor for Message.Metadata(0LL);
      os_log_type_t v51 = v73;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56LL))(v73, 1LL, 1LL, v50);
      uint64_t v52 = (uint64_t)v74;
      Message.init(category:type:content:metadata:)(v76, v68, v42, v51);
      uint64_t v53 = sub_10000C250(v52, v48);
      if ((v53 & 1) != 0)
      {
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v52, v9);
        swift_release(v23);
      }

      else
      {
        uint64_t v61 = (os_log_s *)Logger.logObject.getter(v53);
        os_log_type_t v62 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v63 = 134217984;
          uint64_t v79 = v77;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, v80, v63 + 4, v63 + 12);
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "Message not sent. { reporterID=%lld }", v63, 0xCu);
          swift_slowDealloc(v63, -1LL, -1LL);
        }

        swift_release(v23);

        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v52, v9);
      }
    }

    else
    {
      unint64_t v58 = (os_log_s *)Logger.logObject.getter(0LL);
      os_log_type_t v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v60 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  v59,  "Message cannot be converted to simple type. Aborting send.",  v60,  2u);
        swift_slowDealloc(v60, -1LL, -1LL);
      }

      swift_release(v23);
    }
  }

  else
  {
    uint64_t v54 = static Logger.service.getter(0LL);
    uint64_t v55 = (os_log_s *)Logger.logObject.getter(v54);
    os_log_type_t v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "ClientServerInstance is gone. { action=send }", v57, 2u);
      swift_slowDealloc(v57, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }

void sub_1000098A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TraceArgs(0LL);
  uint64_t v44 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TraceCode(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v48, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v16 = Strong;
    uint64_t v43 = v4;
    uint64_t v42 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (void **)a2;
      uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v20 = 134217984;
      aBlock = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v20 + 4, v20 + 12);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "stopSession() called. { reporterID=%lld }", v20, 0xCu);
      uint64_t v21 = v20;
      a2 = (uint64_t)v19;
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    double v23 = static Double.now()(v22);
    *(double *)(v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v23 + 5.0;
    uint64_t v24 = sub_10000BE60(a2, 0, 1886352499LL, 0xE400000000000000LL);
    if (!v24) {
      goto LABEL_8;
    }
    uint64_t v25 = v24;
    uint64_t v41 = a2;
    os_log_type_t v26 = *(dispatch_queue_s **)(v24 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
    uint64_t v27 = swift_allocObject(&unk_10003D478, 32LL, 7LL);
    *(void *)(v27 + 16) = sub_10000B61C;
    *(void *)(v27 + 24) = v25;
    v46[3] = sub_10000B83C;
    uint64_t v47 = v27;
    aBlock = _NSConcreteStackBlock;
    v46[0] = 1107296256LL;
    v46[1] = sub_100016C50;
    v46[2] = &unk_10003D490;
    uint64_t v28 = _Block_copy(&aBlock);
    uint64_t v29 = v47;
    swift_retain(v25);
    swift_retain(v27);
    swift_release(v29);
    uint64_t v30 = v26;
    a2 = v41;
    dispatch_sync(v30, v28);
    _Block_release(v28);
    LOBYTE(v29) = swift_isEscapingClosureAtFileLocation(v27, "", 111LL, 92LL, 24LL, 1LL);
    swift_release_n(v25, 2LL);
    swift_release(v27);
    if ((v29 & 1) != 0)
    {
      __break(1u);
    }

    else
    {
LABEL_8:
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for TraceCode.serverStop(_:), v7);
      uint64_t v31 = static Utilities.positiveReporterID(_:)(a2);
      TraceArgs.init(arg1:arg2:arg3:arg4:)(v31, 0LL, 0LL, 0LL);
      static Trace.post(_:args:)(v10, v6);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v6, v43);
      uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
      os_log_type_t v34 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)unint64_t v35 = 134217984;
        aBlock = (void **)a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v35 + 4, v35 + 12);
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Session stop signaled. { reporterID=%lld }", v35, 0xCu);
        swift_slowDealloc(v35, -1LL, -1LL);
      }

      swift_release(v16);
    }
  }

  else
  {
    uint64_t v36 = static Logger.service.getter(0LL);
    __n128 v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "ClientServerInstance is gone. { action=stopSession }",  v39,  2u);
      swift_slowDealloc(v39, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

uint64_t sub_100009D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v29 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v27 = *(void *)(v13 - 8);
  uint64_t v28 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_allocObject(&unk_10003D2C0, 24LL, 7LL);
  swift_weakInit(v17 + 16, v8);
  uint64_t v18 = swift_allocObject(a2, 32LL, 7LL);
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = a1;
  aBlock[4] = a3;
  uint64_t v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = a4;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v16;
  uint64_t v21 = swift_retain(v17);
  static DispatchQoS.unspecified.getter(v21);
  uint64_t v30 = _swiftEmptyArrayStorage;
  unint64_t v22 = sub_10000B4F4();
  uint64_t v23 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v24 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v15, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v28);
  uint64_t v25 = v32;
  swift_release(v17);
  return swift_release(v25);
}

uint64_t sub_100009F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TraceArgs(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TraceCode(0LL);
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v51, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v16 = Strong;
    uint64_t v45 = v5;
    uint64_t v17 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)id v20 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v49, v20 + 4, v20 + 12);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "destroySession() called. { reporterID=%lld }", v20, 0xCu);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    uint64_t v21 = sub_10000BE60(a2, 0, 0x796F7274736564LL, 0xE700000000000000LL);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v43 = v17;
      uint64_t v44 = v4;
      char v23 = *(_BYTE *)(v21 + 66);
      unint64_t v24 = *(dispatch_queue_s **)(v21 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      uint64_t v25 = swift_allocObject(&unk_10003D248, 25LL, 7LL);
      *(void *)(v25 + 16) = v22;
      *(_BYTE *)(v25 + 24) = v23;
      uint64_t v26 = swift_allocObject(&unk_10003D270, 32LL, 7LL);
      *(void *)(v26 + 16) = sub_10000B2CC;
      *(void *)(v26 + 24) = v25;
      v49[3] = sub_10000B2E8;
      uint64_t v50 = v26;
      aBlock = _NSConcreteStackBlock;
      v49[0] = 1107296256LL;
      v49[1] = sub_100016C50;
      v49[2] = &unk_10003D288;
      uint64_t v27 = _Block_copy(&aBlock);
      uint64_t v28 = v50;
      swift_retain(v22);
      swift_retain(v26);
      swift_release(v28);
      dispatch_sync(v24, v27);
      _Block_release(v27);
      LOBYTE(v24) = swift_isEscapingClosureAtFileLocation(v26, "", 111LL, 96LL, 24LL, 1LL);
      swift_release(v25);
      uint64_t result = swift_release(v26);
      if ((v24 & 1) != 0)
      {
        __break(1u);
        return result;
      }

      swift_beginAccess( v16 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID,  &aBlock,  33LL,  0LL);
      uint64_t v30 = sub_10000B308(a2);
      swift_endAccess(&aBlock);
      uint64_t v31 = swift_release(v30);
      uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
      os_log_type_t v33 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v32, v33))
      {
        os_log_type_t v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)os_log_type_t v34 = 134217984;
        aBlock = (void **)a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v49, v34 + 4, v34 + 12);
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "Removing from session list. { reporterID=%lld }",  v34,  0xCu);
        swift_slowDealloc(v34, -1LL, -1LL);
      }

      uint64_t v36 = v46;
      uint64_t v35 = v47;
      (*(void (**)(char *, void, uint64_t))(v46 + 104))(v10, enum case for TraceCode.serverDestroy(_:), v47);
      uint64_t v37 = static Utilities.positiveReporterID(_:)(a2);
      TraceArgs.init(arg1:arg2:arg3:arg4:)(v37, 0LL, 0LL, 0LL);
      static Trace.post(_:args:)(v10, v7);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v7, v44);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v35);
      sub_10000B8D0();
      swift_release(v16);
      uint64_t v38 = v22;
    }

    else
    {
      uint64_t v38 = v16;
    }

    return swift_release(v38);
  }

  else
  {
    uint64_t v39 = static Logger.service.getter(0LL);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "ClientServerInstance is gone. { action=destroySession }",  v42,  2u);
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

uint64_t sub_10000A460(uint64_t a1, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v29 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v27 = *(void *)(v15 - 8);
  uint64_t v28 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = swift_allocObject(&unk_10003D3D8, 56LL, 7LL);
  *(void *)(v19 + 16) = v6;
  *(void *)(v19 + 24) = a1;
  *(_DWORD *)(v19 + 32) = a2;
  *(_WORD *)(v19 + 36) = a3;
  *(void *)(v19 + 40) = a4;
  *(void *)(v19 + 48) = a5;
  aBlock[4] = sub_10000B600;
  uint64_t v32 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003D3F0;
  id v20 = _Block_copy(aBlock);
  id v21 = v18;
  swift_retain(v6);
  uint64_t v22 = swift_retain(a5);
  static DispatchQoS.unspecified.getter(v22);
  uint64_t v30 = _swiftEmptyArrayStorage;
  unint64_t v23 = sub_10000B4F4();
  uint64_t v24 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v25 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v24, v25, v12, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v17, v14, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v12);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
  return swift_release(v32);
}

void sub_10000A66C( uint64_t a1, uint64_t a2, uint64_t a3, int a4, void (*a5)(id, void), uint64_t a6)
{
  LODWORD(v7) = a4;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  int v48 = a3;
  if (os_log_type_enabled(v10, v11))
  {
    unsigned int v47 = v7;
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = swift_slowAlloc(64LL, -1LL);
    uint64_t v50 = a2;
    uint64_t v51 = v12;
    *(_DWORD *)uint64_t v7 = 134218498;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2082;
    uint64_t v13 = static Utilities.eventCategoryDescription(from:)(a3);
    unint64_t v15 = v14;
    uint64_t v50 = sub_100028CC4(v13, v14, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v7 + 22) = 2082;
    uint64_t v16 = static Utilities.eventTypeDescription(from:)(v47);
    unint64_t v18 = v17;
    uint64_t v50 = sub_100028CC4(v16, v17, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v7 + 24, v7 + 32);
    swift_bridgeObjectRelease(v18);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "requestMessage() called. { reporterID=%lld, category=%{public}s, type=%{public}s }",  (uint8_t *)v7,  0x20u);
    swift_arrayDestroy(v12, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    uint64_t v19 = v7;
    LOWORD(v7) = v47;
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  uint64_t v20 = sub_10000BE60(a2, 0, 0x4D74736575716572LL, 0xEE00656761737365LL);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Registering callback until message arrives.", v24, 2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    sub_100022C4C((uint64_t)a5, a6, v48, v7);
    swift_release(v21);
  }

  else
  {
    uint64_t v25 = a2;
    uint64_t v26 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
    v53._object = (void *)0xE000000000000000LL;
    v27._object = (void *)0x8000000100036720LL;
    v28._countAndFlagsBits = 0x2064696C61766E49LL;
    v28._object = (void *)0xEF6E6F6973736553LL;
    v27._countAndFlagsBits = 0xD000000000000016LL;
    v53._countAndFlagsBits = 0LL;
    Swift::String v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, (Swift::String_optional)0, v26, v27, v53);

    uint64_t v30 = sub_100005EA4(&qword_1000416F8);
    uint64_t inited = swift_initStackObject(v30, v52);
    *(_OWORD *)(inited + 16) = xmmword_1000358D0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v32;
    *(Swift::String *)(inited + 48) = v29;
    unint64_t v33 = sub_100005B24(inited);
    static Constants.machServiceName.getter();
    uint64_t v35 = v34;
    sub_10001213C(v33);
    uint64_t v37 = v36;
    swift_bridgeObjectRelease(v33);
    id v38 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v35);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v37);
    id v41 = [v38 initWithDomain:v39 code:-1 userInfo:isa];

    uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v45 = 134217984;
      uint64_t v51 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52, v45 + 4, v45 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "requestMessage(): Session does not exist. Returning nil. { reporterID=%lld }",  v45,  0xCu);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    id v46 = v41;
    a5(v41, 0LL);
  }

void sub_10000ABC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1)
  {
    uint64_t v5 = 0LL;
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    v6.super.Class isa = 0LL;
    goto LABEL_6;
  }

  uint64_t v5 = (void *)_convertErrorToNSError(_:)();
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  v6.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
LABEL_6:
  Class isa = v6.super.isa;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_10000AC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = (void *)swift_allocObject(&unk_10003D360, 48LL, 7LL);
  v16[2] = v4;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_10000B5C0;
  Swift::String v27 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003D378;
  unint64_t v17 = _Block_copy(aBlock);
  id v18 = v15;
  swift_retain(v4);
  uint64_t v19 = swift_retain(a3);
  static DispatchQoS.unspecified.getter(v19);
  uint64_t v25 = _swiftEmptyArrayStorage;
  unint64_t v20 = sub_10000B4F4();
  uint64_t v21 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  unint64_t v22 = sub_10000B53C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v21, v22, v8, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v14, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release(v27);
}

void sub_10000AE58(uint64_t a1, uint64_t a2, void (*a3)(id, void, void))
{
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v7 = 134217984;
    uint64_t v41 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "getTailspinSessionID() called. { reporterID=%lld }", v7, 0xCu);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  if (static Constants.unknownReporterID.getter(v8) == a2)
  {
    uint64_t v9 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
    v43._object = (void *)0xE000000000000000LL;
    v10._object = (void *)0x80000001000366F0LL;
    v11._countAndFlagsBits = 0x2064696C61766E49LL;
    v11._object = (void *)0xEF6E6F6973736553LL;
    v10._countAndFlagsBits = 0xD000000000000024LL;
    v43._countAndFlagsBits = 0LL;
    Swift::String v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, v9, v10, v43);

    uint64_t v13 = sub_100005EA4(&qword_1000416F8);
    uint64_t inited = swift_initStackObject(v13, v42);
    *(_OWORD *)(inited + 16) = xmmword_1000358D0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v15;
    *(Swift::String *)(inited + 48) = v12;
    unint64_t v16 = sub_100005B24(inited);
    static Constants.machServiceName.getter();
    uint64_t v18 = v17;
    sub_10001213C(v16);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease(v16);
    id v21 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    id v24 = [v21 initWithDomain:v22 code:-1 userInfo:isa];

    id v25 = v24;
    a3(v24, 0LL, 0LL);
  }

  else
  {
    uint64_t v26 = (void (*)(void, uint64_t, void))a3;
    uint64_t v27 = static TailspinKeys.all.getter();
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)(v27 + 16);
    if (v29)
    {
      swift_bridgeObjectRetain(v27);
      uint64_t v30 = (void *)(v28 + 40);
      while (1)
      {
        uint64_t v32 = *(v30 - 1);
        uint64_t v31 = *v30;
        __n128 v33 = swift_bridgeObjectRetain(*v30);
        uint64_t v34 = static DefaultsUtilities.reportingDomain.getter(v33);
        uint64_t v36 = v35;
        uint64_t v37 = static DefaultsUtilities.platformDefaultUserName.getter();
        uint64_t v39 = v38;
        static DefaultsUtilities.get<A>(key:applicationID:userName:)( &v41,  v32,  v31,  v34,  v36,  v37,  v38,  &type metadata for Bool);
        swift_bridgeObjectRelease(v31);
        swift_bridgeObjectRelease(v36);
        swift_bridgeObjectRelease(v39);
        v30 += 2;
        if (!--v29)
        {
          swift_bridgeObjectRelease_n(v28, 2LL);
          goto LABEL_13;
        }
      }

      swift_bridgeObjectRelease_n(v28, 2LL);
      uint64_t v40 = 0LL;
    }

    else
    {
      swift_bridgeObjectRelease(v27);
LABEL_13:
      uint64_t v40 = 1LL;
    }

    v26(0LL, v40, 0LL);
  }

void sub_10000B244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
}

uint64_t sub_10000B2A8()
{
  return swift_deallocObject(v0, 25LL, 7LL);
}

uint64_t sub_10000B2CC()
{
  return sub_100025204(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_10000B2D8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B2E8()
{
  return sub_100016C30(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B2F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B300(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000B308(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_10001F56C(a1);
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  uint64_t v7 = *v1;
  uint64_t v11 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100021564();
    uint64_t v7 = v11;
  }

  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v5);
  sub_10002937C(v5, v7);
  uint64_t v9 = *v2;
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease(v9);
  return v8;
}

uint64_t sub_10000B39C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_10001F3E0(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v10 = *v3;
    uint64_t v19 = *v3;
    *unint64_t v3 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100021D30();
      uint64_t v10 = v19;
    }

    uint64_t v11 = *(void *)(v10 + 48);
    uint64_t v12 = type metadata accessor for FeatureInfo(0LL);
    sub_10000B7BC(v11 + *(void *)(*(void *)(v12 - 8) + 72LL) * v7);
    uint64_t v13 = *(void *)(v10 + 56);
    uint64_t v14 = type metadata accessor for FeatureState(0LL);
    uint64_t v15 = *(void *)(v14 - 8);
    sub_10000B7F8(v13 + *(void *)(v15 + 72) * v7, a2);
    sub_1000296F0(v7, v10);
    uint64_t v16 = *v3;
    *unint64_t v3 = v10;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a2, 0LL, 1LL, v14);
  }

  else
  {
    uint64_t v18 = type metadata accessor for FeatureState(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( a2,  1LL,  1LL,  v18);
  }

uint64_t sub_10000B4C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000B4EC()
{
  return sub_100009F64(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10000B4F4()
{
  unint64_t result = qword_1000416E8;
  if (!qword_1000416E8)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000416E8);
  }

  return result;
}

unint64_t sub_10000B53C()
{
  unint64_t result = qword_1000416F0;
  if (!qword_1000416F0)
  {
    uint64_t v1 = sub_100006108((uint64_t *)&unk_100041BC0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000416F0);
  }

  return result;
}

uint64_t sub_10000B588()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000B5AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10000B5B4()
{
  return sub_10000B70C((void (*)(void))&_swift_release);
}

void sub_10000B5C0()
{
}

void sub_10000B5CC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000B5D4()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_10000B600()
{
}

void sub_10000B614()
{
}

void sub_10000B61C()
{
}

uint64_t sub_10000B624()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B634()
{
  return sub_10000B70C((void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_10000B640()
{
}

uint64_t sub_10000B654()
{
  return sub_100008CB4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000B65C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000B664()
{
  return sub_10000B70C((void (*)(void))&_swift_release);
}

uint64_t sub_10000B670()
{
  return sub_100008848(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void, uint64_t))(v0 + 32));
}

uint64_t sub_10000B67C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_10000B6A8()
{
}

uint64_t sub_10000B6B4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B6E0()
{
  return sub_100025940(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000B6E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10000B6F8(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000B700()
{
  return sub_10000B70C((void (*)(void))&_swift_release);
}

uint64_t sub_10000B70C(void (*a1)(void))
{
  return swift_deallocObject(v1, 48LL, 7LL);
}

uint64_t sub_10000B744()
{
  return sub_1000079C4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t, uint64_t))(v0 + 32));
}

uint64_t sub_10000B750()
{
  return swift_deallocObject(v0, 34LL, 7LL);
}

void sub_10000B774()
{
}

uint64_t sub_10000B780()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B790()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10000B7B4()
{
}

uint64_t sub_10000B7BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FeatureInfo(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000B7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_10000B8D0()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (void **)((char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v56 = v0;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  uint64_t v6 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  unint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *uint64_t v4 = v7;
  uint64_t v8 = enum case for DispatchPredicate.onQueue(_:);
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t))(v2 + 104);
  v9(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  id v10 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v4);
  uint64_t v11 = *(void (**)(void *, uint64_t))(v2 + 8);
  v11(v4, v1);
  if ((v7 & 1) == 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  uint64_t v12 = *(void **)(v5 + v6);
  *uint64_t v4 = v12;
  v9(v4, v8, v1);
  id v13 = v12;
  char v14 = _dispatchPreconditionTest(_:)(v4);
  v11(v4, v1);
  if ((v14 & 1) == 0)
  {
LABEL_32:
    __break(1u);
    return;
  }

  uint64_t v15 = v56;
  uint64_t v16 = (void *)(v56 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v56 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v60, 0LL, 0LL);
  uint64_t v17 = *v16;
  swift_bridgeObjectRetain(*v16);
  uint64_t v19 = sub_10000DED0(v18);
  swift_bridgeObjectRelease(v17);
  uint64_t v20 = (void *)v19[2];
  swift_retain(v15);
  if (v20)
  {
    id v21 = 0LL;
    uint64_t v55 = (void *)((char *)v20 - 1);
    uint64_t v57 = _swiftEmptyArrayStorage;
    do
    {
      if (v21 <= v20) {
        NSString v22 = v20;
      }
      else {
        NSString v22 = v21;
      }
      os_log_type_t v23 = v21;
      while (1)
      {
        if (v22 == v23)
        {
          __break(1u);
          goto LABEL_31;
        }

        uint64_t v24 = v19[(void)v23 + 4];
        uint64_t v25 = sub_10000BE60(v24, 0, 0x7669746341746567LL, 0xE900000000000065LL);
        if (v25)
        {
          int v26 = *(unsigned __int8 *)(v25 + 66);
          swift_release(v25);
          if (v26 == 1) {
            break;
          }
        }

        os_log_type_t v23 = (void *)((char *)v23 + 1);
        if (v20 == v23) {
          goto LABEL_20;
        }
      }

      uint64_t v27 = v57;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
      os_log_type_t v59 = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_100029AE8(0, v27[2] + 1LL, 1);
        uint64_t v27 = v59;
      }

      unint64_t v30 = v27[2];
      unint64_t v29 = v27[3];
      if (v30 >= v29 >> 1)
      {
        sub_100029AE8(v29 > 1, v30 + 1, 1);
        uint64_t v27 = v59;
      }

      id v21 = (void *)((char *)v23 + 1);
      v27[2] = v30 + 1;
      uint64_t v57 = v27;
      v27[v30 + 4] = v24;
      uint64_t v15 = v56;
    }

    while (v55 != v23);
  }

  else
  {
    uint64_t v57 = _swiftEmptyArrayStorage;
  }

LABEL_20:
  uint64_t v55 = v16;
  swift_release(v19);
  swift_release(v15);
  int64_t v31 = v57[2];
  if (v31)
  {
    os_log_type_t v59 = _swiftEmptyArrayStorage;
    sub_100029ACC(0, v31, 0);
    uint64_t v32 = v57;
    uint64_t v33 = 0LL;
    uint64_t v34 = v59;
    do
    {
      uint64_t v58 = v32[v33 + 4];
      uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
      uint64_t v37 = v36;
      os_log_type_t v59 = v34;
      unint64_t v39 = v34[2];
      unint64_t v38 = v34[3];
      if (v39 >= v38 >> 1)
      {
        sub_100029ACC(v38 > 1, v39 + 1, 1);
        uint64_t v34 = v59;
      }

      ++v33;
      v34[2] = v39 + 1;
      uint64_t v40 = &v34[2 * v39];
      v40[4] = v35;
      v40[5] = v37;
      uint64_t v32 = v57;
    }

    while (v31 != v33);
    swift_release(v57);
  }

  else
  {
    swift_release(v57);
    uint64_t v34 = _swiftEmptyArrayStorage;
  }

  os_log_type_t v59 = v34;
  uint64_t v41 = sub_100005EA4(&qword_100041800);
  uint64_t v42 = sub_10000E4B0(&qword_100041808, &qword_100041800, (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v43 = BidirectionalCollection<>.joined(separator:)(44LL, 0xE100000000000000LL, v41, v42);
  unint64_t v45 = v44;
  swift_bridgeObjectRelease(v34);
  uint64_t v46 = v56;
  swift_retain_n(v56, 4LL);
  swift_bridgeObjectRetain(v45);
  int v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v51 = (void *)swift_slowAlloc(64LL, -1LL);
    os_log_type_t v59 = v51;
    *(_DWORD *)uint64_t v50 = 136381187;
    uint64_t v52 = *(void *)(v46 + 24);
    unint64_t v53 = *(void *)(v46 + 32);
    swift_bridgeObjectRetain(v53);
    uint64_t v58 = sub_100028CC4(v52, v53, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 4, v50 + 12);
    swift_release_n(v46, 2LL);
    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v50 + 12) = 2048;
    uint64_t v54 = *(void *)(*v55 + 16LL);
    swift_release(v46);
    uint64_t v58 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 14, v50 + 22);
    swift_release(v46);
    *(_WORD *)(v50 + 22) = 2081;
    swift_bridgeObjectRetain(v45);
    uint64_t v58 = sub_100028CC4(v43, v45, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 24, v50 + 32);
    swift_bridgeObjectRelease_n(v45, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v48,  v49,  "Active reporting sessions. { clientProcessName=%{private}s, sessionCount=%ld, activeSessions=%{private}s }",  (uint8_t *)v50,  0x20u);
    swift_arrayDestroy(v51, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v45, 2LL);

    swift_release_n(v46, 4LL);
  }

    char v14 = (v28 - 1) & v28;
    unint64_t v45 = v29;
    uint64_t v20 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_5:
    id v21 = (uint64_t *)(v44[6] + 16 * v20);
    NSString v22 = *v21;
    os_log_type_t v23 = v21[1];
    uint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    v24(v17, v44[7] + *(void *)(v15 + 72) * v20, v16);
    *uint64_t v18 = v22;
    v18[1] = v23;
    v24((char *)v18 + *(int *)(v42 + 48), (unint64_t)v17, v16);
    uint64_t v25 = swift_bridgeObjectRetain_n(v23, 2LL);
    int v26 = Config.neededPreviousFields.getter(v25);
    LOBYTE(v22) = sub_10002409C(v22, v23, v26);
    swift_bridgeObjectRelease(v26);
    sub_10002D838((uint64_t)v18, &qword_100042028);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v16);
    unint64_t result = swift_bridgeObjectRelease(v23);
    id v10 = v45;
    if ((v22 & 1) != 0)
    {
      *(unint64_t *)((char *)v34 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
      if (__OFADD__(v35++, 1LL))
      {
        __break(1u);
        return sub_10002BFCC(v34, v33, v35, v44);
      }
    }
  }

  unint64_t v30 = v10 + 4;
  if (v10 + 4 >= v37) {
    return sub_10002BFCC(v34, v33, v35, v44);
  }
  uint64_t v28 = *(void *)(v36 + 8 * v30);
  if (v28)
  {
    unint64_t v29 = v10 + 4;
    goto LABEL_20;
  }

  while (1)
  {
    unint64_t v29 = v30 + 1;
    if (__OFADD__(v30, 1LL)) {
      break;
    }
    if (v29 >= v37) {
      return sub_10002BFCC(v34, v33, v35, v44);
    }
    uint64_t v28 = *(void *)(v36 + 8 * v29);
    ++v30;
    if (v28) {
      goto LABEL_20;
    }
  }

uint64_t sub_10000BE60(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (uint64_t *)((char *)&v34[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *id v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    uint64_t v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v34, 32LL, 0LL);
    uint64_t v18 = *v17;
    if (*(void *)(v18 + 16) && (unint64_t v19 = sub_10001F56C(a1), (v20 & 1) != 0))
    {
      uint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
      swift_endAccess(v34);
      swift_retain(v21);
    }

    else
    {
      swift_endAccess(v34);
      if ((a2 & 1) != 0 || (uint64_t v22 = sub_100017F34(a1, v5)) == 0)
      {
        uint64_t v28 = swift_bridgeObjectRetain_n(a4, 2LL);
        unint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
        os_log_type_t v30 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = swift_slowAlloc(22LL, -1LL);
          uint64_t v32 = swift_slowAlloc(32LL, -1LL);
          uint64_t v33 = a1;
          v34[0] = v32;
          *(_DWORD *)uint64_t v31 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v31 + 4, v31 + 12);
          *(_WORD *)(v31 + 12) = 2081;
          swift_bridgeObjectRetain(a4);
          uint64_t v33 = sub_100028CC4(a3, a4, v34);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v31 + 14, v31 + 22);
          swift_bridgeObjectRelease_n(a4, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "Session not found. { reporterID=%lld, action=%{private}s }",  (uint8_t *)v31,  0x16u);
          swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v32, -1LL, -1LL);
          swift_slowDealloc(v31, -1LL, -1LL);
        }

        else
        {
          swift_bridgeObjectRelease_n(a4, 2LL);
        }

        return 0LL;
      }

      else
      {
        uint64_t v21 = v22;
        uint64_t v23 = swift_bridgeObjectRetain_n(a4, 2LL);
        uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
        os_log_type_t v25 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = swift_slowAlloc(22LL, -1LL);
          uint64_t v27 = swift_slowAlloc(32LL, -1LL);
          uint64_t v33 = a1;
          v34[0] = v27;
          *(_DWORD *)uint64_t v26 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v26 + 4, v26 + 12);
          *(_WORD *)(v26 + 12) = 2081;
          swift_bridgeObjectRetain(a4);
          uint64_t v33 = sub_100028CC4(a3, a4, v34);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v26 + 14, v26 + 22);
          swift_bridgeObjectRelease_n(a4, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Found session on another instance. { reporterID=%lld, action=%{private}s }",  (uint8_t *)v26,  0x16u);
          swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v27, -1LL, -1LL);
          swift_slowDealloc(v26, -1LL, -1LL);
        }

        else
        {
          swift_bridgeObjectRelease_n(a4, 2LL);
        }
      }
    }

    return v21;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10000C250(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Message.Metadata(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *id v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    if (static Constants.unknownReporterID.getter(result) == a2)
    {
      char v17 = sub_10000C8CC(a1);
      return v17 & 1;
    }

    uint64_t v18 = sub_10000BE60(a2, 0, 0x737365636F7270LL, 0xE700000000000000LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = Message.metadata.getter(v18);
      char v21 = Message.Metadata.isBroadcast.getter(v20);
      uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) == 0 || *(_BYTE *)(v19 + 66) == 1)
      {
        char v17 = sub_10000CBE8(a1, v19);
        swift_release(v19);
        return v17 & 1;
      }

      uint64_t v26 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v27 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v28 = 134217984;
        uint64_t v30 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v28 + 4, v28 + 12);
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Session is not started. Abandoning broadcast message. { reporterID=%lld }",  v28,  0xCu);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      swift_release(v19);
    }

    else
    {
      uint64_t v23 = (os_log_s *)Logger.logObject.getter(0LL);
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        os_log_type_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)os_log_type_t v25 = 134217984;
        uint64_t v30 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v25 + 4, v25 + 12);
        _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Session not found! Abandoning message. { reporterID=%lld }",  v25,  0xCu);
        swift_slowDealloc(v25, -1LL, -1LL);
      }
    }

    char v17 = 0;
    return v17 & 1;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000C568()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v22, 0LL, 0LL);
  uint64_t v3 = *v2;
  uint64_t v4 = *v2 + 64LL;
  uint64_t v5 = 1LL << *(_BYTE *)(*v2 + 32LL);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(*v2 + 64LL);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(*v2);
  int64_t v10 = 0LL;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }

    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_27;
    }

    if (v15 >= v8) {
      goto LABEL_25;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v8) {
        goto LABEL_25;
      }
      unint64_t v16 = *(void *)(v4 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v8) {
          goto LABEL_25;
        }
        unint64_t v16 = *(void *)(v4 + 8 * v10);
        if (!v16)
        {
          int64_t v10 = v15 + 3;
          if (v15 + 3 >= v8) {
            goto LABEL_25;
          }
          unint64_t v16 = *(void *)(v4 + 8 * v10);
          if (!v16)
          {
            int64_t v10 = v15 + 4;
            if (v15 + 4 >= v8) {
              goto LABEL_25;
            }
            unint64_t v16 = *(void *)(v4 + 8 * v10);
            if (!v16) {
              break;
            }
          }
        }
      }
    }

LABEL_24:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    Swift::Int64 v13 = *(void *)(*(void *)(v3 + 48) + 8 * v12);
    type metadata accessor for OsTransactionHandler(0LL);
    uint64_t v14 = static OsTransactionHandler.shared.getter();
    OsTransactionHandler.sessionStopped(for:)(v13);
    uint64_t result = swift_release(v14);
  }

  int64_t v17 = v15 + 5;
  if (v17 >= v8)
  {
LABEL_25:
    swift_release(v3);
    swift_release(*(void *)(v1 + 16));
    swift_bridgeObjectRelease(*(void *)(v1 + 32));
    uint64_t v18 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v19 = type metadata accessor for Logger(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8LL))(v18, v19);
    swift_unknownObjectRelease(*(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server));
    uint64_t v20 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate;
    uint64_t v21 = type metadata accessor for Date(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8LL))(v20, v21);
    swift_bridgeObjectRelease(*v2);
    return v1;
  }

  unint64_t v16 = *(void *)(v4 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_24;
  }

  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_25;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_24;
    }
  }

    uint64_t v40 = (v21 - 1) & v21;
    uint64_t v41 = v22;
  }

  uint64_t v23 = v20 + 4;
  if (v23 >= v39) {
    return 1LL;
  }
  uint64_t v21 = *(void *)(v38 + 8 * v23);
  if (v21)
  {
    uint64_t v22 = v23;
    goto LABEL_24;
  }

  while (1)
  {
    uint64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v22 >= v39) {
      return 1LL;
    }
    uint64_t v21 = *(void *)(v38 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_24;
    }
  }

      if (v140 < v138)
      {
        if (v13 < v15) {
          goto LABEL_137;
        }
        if (v15 < v13)
        {
          uint64_t v42 = v12;
          uint64_t v43 = 40 * v13 - 40;
          unint64_t v44 = 40 * v15;
          unint64_t v45 = v13;
          uint64_t v46 = v15;
          do
          {
            if (v46 != --v45)
            {
              if (!v136) {
                goto LABEL_142;
              }
              uint64_t v47 = v136 + v44;
              int v48 = v136 + v43;
              sub_10002D514((__int128 *)(v136 + v44), (uint64_t)&v154);
              os_log_type_t v49 = *(void *)(v48 + 32);
              uint64_t v50 = *(_OWORD *)(v48 + 16);
              *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
              *(_OWORD *)(v47 + swift_weakDestroy(v0 + 16) = v50;
              *(void *)(v47 + 32) = v49;
              sub_10002D514(&v154, v48);
            }

            ++v46;
            v43 -= 40LL;
            v44 += 40LL;
          }

          while (v46 < v45);
          unint64_t v12 = v42;
          a1 = v141;
          uint64_t v6 = v145;
        }
      }
    }

    if (v13 < v6)
    {
      if (__OFSUB__(v13, v15)) {
        goto LABEL_135;
      }
      if (v13 - v15 < v135) {
        break;
      }
    }

      int64_t v15 = (v23 - 1) & v23;
      uint64_t v50 = v24;
      uint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }

    uint64_t v26 = a4[7];
    os_log_type_t v27 = (uint64_t *)(a4[6] + 16 * v21);
    uint64_t v28 = *v27;
    uint64_t v29 = v27[1];
    uint64_t v30 = v49;
    uint64_t v31 = *(void *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    Hasher.init(_seed:)(v52, *(void *)(v14 + 40));
    swift_bridgeObjectRetain(v29);
    String.hash(into:)(v52, v28, v29);
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1LL << *(_BYTE *)(v14 + 32);
    uint64_t v34 = result & ~v33;
    uint64_t v35 = v34 >> 6;
    if (((-1LL << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      uint64_t v36 = __clz(__rbit64((-1LL << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0LL;
      uint64_t v18 = v47;
    }

    else
    {
      uint64_t v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      uint64_t v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        unint64_t v39 = v35 == v38;
        if (v35 == v38) {
          uint64_t v35 = 0LL;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }

      while (v40 == -1);
      uint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }

    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v36;
    uint64_t v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    *uint64_t v41 = v28;
    v41[1] = v29;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)( *(void *)(v14 + 56) + v36 * v31,  v51,  v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1LL)) {
      break;
    }
    a4 = v46;
    unint64_t v16 = v50;
    if (!a3) {
      return v14;
    }
  }

  uint64_t v46 = v17;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1LL, 1LL, v3);
  uint64_t v20 = 0LL;
LABEL_25:
  *uint64_t v1 = v13;
  v1[1] = v14;
  uint64_t v34 = v46;
  v1[2] = v16;
  v1[3] = v34;
  v1[4] = v20;
  uint64_t v35 = (void (*)(uint64_t))v1[5];
  sub_10002D644((uint64_t)v12, (uint64_t)v10, &qword_100042038);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1LL, v3) == 1)
  {
    uint64_t v36 = sub_100005EA4(&qword_100041688);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56LL))( a1,  1LL,  1LL,  v36);
  }

  else
  {
    unint64_t v38 = (uint64_t)v10;
    unint64_t v39 = (uint64_t)v41;
    sub_10002D644(v38, (uint64_t)v41, &qword_100042028);
    v35(v39);
    sub_10002D838(v39, &qword_100042028);
    uint64_t v40 = sub_100005EA4(&qword_100041688);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56LL))( a1,  0LL,  1LL,  v40);
  }

LABEL_27:
  __break(1u);
  return result;
}

    uint64_t v6 = (v15 - 1) & v15;
    Swift::Int64 v13 = __clz(__rbit64(v15)) + (v16 << 6);
    uint64_t v9 = v16;
LABEL_28:
    uint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_100013338(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&uint64_t v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_100013374(v39, v33);
    uint64_t v34 = v30;
    uint64_t v35 = v31;
    uint64_t v36 = v32;
    sub_100013374(v33, v37);
    uint64_t v30 = v34;
    uint64_t v31 = v35;
    uint64_t v32 = v36;
    sub_100013374(v37, v38);
    sub_100013374(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v21 = -1LL << *((_BYTE *)v3 + 32);
    uint64_t v22 = result & ~v21;
    uint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      int64_t v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      os_log_type_t v24 = 0;
      os_log_type_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        uint64_t v26 = v23 == v25;
        if (v23 == v25) {
          uint64_t v23 = 0LL;
        }
        v24 |= v26;
        os_log_type_t v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      int64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    unint64_t v11 = v3[6] + 40 * v10;
    *(_OWORD *)unint64_t v11 = v30;
    *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    uint64_t result = (uint64_t)sub_100013374(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  int64_t v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10000E404(a1);
    return (uint64_t)v3;
  }

  int64_t v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    unint64_t v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    unint64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    int64_t v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
  }

      v73 = v65;
      v74 = *(void (**)(char *, uint64_t))(v64 + 8);
      v74(v73, v16);
      uint64_t v75 = v91;
      unsigned int v76 = v49(v91, v104, v67);
      if ((v72 & 1) != 0)
      {
        uint64_t v77 = v84;
        uint64_t v78 = Message.metadata.getter(v76);
        Message.Metadata.isBroadcast.getter(v78);
        (*(void (**)(char *, uint64_t))(v85 + 8))(v77, v86);
        v55(v75, v106);
        if ((v101 & 1) != 0
          && (unsigned __int16)v48 == (unsigned __int16)v100
          && (_DWORD)v57 == v97
          && ((v96 ^ 1) & 1) == 0
          && ((v95 ^ 1) & 1) == 0
          && ((v94 ^ 1) & 1) == 0)
        {
          goto LABEL_46;
        }
      }

      else
      {
        v55(v75, v67);
        if ((v101 & 1) != 0
          && (unsigned __int16)v48 == (unsigned __int16)v100
          && (_DWORD)v57 == v97
          && ((v96 ^ 1) & 1) == 0
          && ((v95 ^ 1) & 1) == 0
          && ((v94 ^ 1) & 1) == 0)
        {
LABEL_46:
          uint64_t v79 = swift_bridgeObjectRelease(v83);
          v80 = RouterConfig.workers.getter(v79);
          RouterConfig.discard.getter();
          v74(v22, v16);
          return v80;
        }
      }

      v74(v22, v16);
      uint64_t v26 = v98 + v87;
      os_log_type_t v24 = v99 - 1;
      os_log_type_t v27 = v102;
      a3 = v103;
      int64_t v8 = v89;
      uint64_t v14 = v88;
      if (v99 == 1)
      {
        uint64_t v23 = v83;
        goto LABEL_43;
      }
    }

    sub_10000E410((uint64_t)v111);
    uint64_t v66 = v102(v65, v22, v16);
    uint64_t v67 = v106;
LABEL_24:
    uint64_t v72 = RouterConfig.broadcast.getter(v66);
    goto LABEL_27;
  }

    unint64_t v12 = (v19 - 1) & v19;
    int64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = 8 * v15;
    int64_t v17 = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + vswift_weakDestroy(v0 + 16) = v17;
    uint64_t result = (void *)swift_retain(v17);
  }

  uint64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  uint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    uint64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    uint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

    unint64_t v12 = (v19 - 1) & v19;
    int64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + vswift_weakDestroy(v0 + 16) = v17;
    uint64_t result = v17;
  }

  uint64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  uint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    uint64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    uint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

  __break(1u);
  return result;
}

    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      unint64_t v11 = a3;
      goto LABEL_33;
    }

    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000C79C()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000C7C0()
{
  return type metadata accessor for ClientServerInstance(0LL);
}

uint64_t type metadata accessor for ClientServerInstance(uint64_t a1)
{
  uint64_t result = qword_100041738;
  if (!qword_100041738) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ClientServerInstance);
  }
  return result;
}

uint64_t sub_10000C804(uint64_t a1)
{
  v5[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v5[1] = &unk_100035938;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v5[2] = *(void *)(result - 8) + 64LL;
    v5[3] = &unk_100035938;
    v5[4] = (char *)&value witness table for Builtin.Int32 + 64;
    uint64_t result = type metadata accessor for Date(319LL);
    if (v4 <= 0x3F)
    {
      v5[5] = *(void *)(result - 8) + 64LL;
      v5[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v5[7] = (char *)&value witness table for Builtin.Int64 + 64;
      return swift_updateClassMetadata2(a1, 256LL, 8LL, v5, a1 + 80);
    }
  }

  return result;
}

uint64_t sub_10000C8CC(uint64_t a1)
{
  uint64_t v42 = a1;
  uint64_t v2 = type metadata accessor for Message.Metadata(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v41 = v1;
  uint64_t v10 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v40 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  unint64_t v11 = *(void **)(v40 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *uint64_t v9 = v11;
  uint64_t v12 = enum case for DispatchPredicate.onQueue(_:);
  Swift::Int64 v13 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 104);
  v13(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  id v14 = v11;
  LOBYTE(v11) = _dispatchPreconditionTest(_:)(v9);
  int64_t v15 = *(uint64_t (**)(void *, uint64_t))(v7 + 8);
  uint64_t result = v15(v9, v6);
  if ((v11 & 1) != 0)
  {
    uint64_t v17 = Message.metadata.getter(result);
    char v18 = Message.Metadata.isBroadcast.getter(v17);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v18 & 1) == 0)
    {
      uint64_t v30 = v42;
      uint64_t v31 = *(void *)(v41 + 16);
      uint64_t v44 = 0LL;
      memset(v43, 0, sizeof(v43));
      uint64_t v32 = sub_100012A4C(v31, v42, (uint64_t)v43, 1);
      __int16 v34 = v33;
      sub_10000E410((uint64_t)v43);
      uint64_t v35 = swift_bridgeObjectRelease(v32);
      if ((v34 & 0x100) != 0)
      {
        uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
        os_log_type_t v37 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v36, v37))
        {
          unint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)unint64_t v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "Discarding single message", v38, 2u);
          swift_slowDealloc(v38, -1LL, -1LL);
        }

        char v29 = 0;
      }

      else if ((v34 & 1) != 0)
      {
        sub_100015150(v30);
        char v29 = 1;
      }

      else
      {
        char v29 = 0;
      }

      return v29 & 1;
    }

    uint64_t v19 = v42;
    uint64_t v20 = *(void **)(v40 + v10);
    *uint64_t v9 = v20;
    v13(v9, v12, v6);
    id v21 = v20;
    LOBYTE(v20) = _dispatchPreconditionTest(_:)(v9);
    uint64_t result = v15(v9, v6);
    if ((v20 & 1) != 0)
    {
      uint64_t v22 = v41;
      uint64_t v23 = (uint64_t *)(v41 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
      swift_beginAccess( v41 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID,  v43,  0LL,  0LL);
      uint64_t v24 = *v23;
      swift_bridgeObjectRetain(v24);
      uint64_t v26 = sub_10000DED0(v25);
      uint64_t v27 = swift_bridgeObjectRelease(v24);
      __chkstk_darwin(v27);
      *(&v39 - 2) = v22;
      *(&v39 - 1) = v19;
      uint64_t v28 = sub_10000D398( (void (*)(uint64_t *__return_ptr, uint64_t *))sub_10000E450,  (uint64_t)(&v39 - 4),  (uint64_t)v26);
      swift_release(v26);
      char v29 = sub_10000DBEC(1LL, (uint64_t)v28);
      swift_bridgeObjectRelease(v28);
      return v29 & 1;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000CBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  sub_100022E60((uint64_t)&v14);
  uint64_t v6 = sub_100012A4C(v5, a1, (uint64_t)&v14, 0);
  LOWORD(v5) = v7;
  sub_10000E410((uint64_t)&v14);
  uint64_t v8 = swift_bridgeObjectRelease(v6);
  if ((v5 & 0x100) != 0)
  {
    uint64_t v10 = swift_retain(a2);
    unint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      Swift::Int64 v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)Swift::Int64 v13 = 134217984;
      uint64_t v14 = *(void *)(a2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v13 + 4, v13 + 12);
      swift_release(a2);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Discarding message { reporterID=%lld }", v13, 0xCu);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    else
    {
      swift_release(a2);
    }

    return 0LL;
  }

  else
  {
    __chkstk_darwin(v8);
    OS_dispatch_queue.sync<A>(execute:)(&v14, sub_10000E498);
    return v14;
  }

uint64_t sub_10000CD80()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v77 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (uint64_t *)((char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server];
  uint64_t v78 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v79 = v13;
  uint64_t v14 = *(void **)(v13 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *os_log_type_t v12 = v14;
  uint64_t v15 = *(void (**)(void))(v10 + 104);
  LODWORD(v75) = enum case for DispatchPredicate.onQueue(_:);
  v80 = v15;
  v15(v12);
  id v16 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v12);
  v74 = *(uint64_t (**)(void *, uint64_t))(v10 + 8);
  uint64_t result = v74(v12, v9);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v18 = swift_retain_n(v1, 2LL);
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  int v72 = static os_log_type_t.debug.getter();
  BOOL v20 = os_log_type_enabled(v19, (os_log_type_t)v72);
  uint64_t v76 = v2;
  if (v20)
  {
    os_log_t v70 = v19;
    uint64_t v71 = v7;
    id v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v69 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v69;
    *(_DWORD *)id v21 = 136380675;
    uint64_t v22 = *(void **)(v79 + v78);
    *os_log_type_t v12 = v22;
    ((void (*)(void *, void, uint64_t))v80)(v12, v75, v9);
    id v23 = v22;
    char v24 = _dispatchPreconditionTest(_:)(v12);
    uint64_t result = v74(v12, v9);
    if ((v24 & 1) == 0)
    {
LABEL_14:
      __break(1u);
      return result;
    }

    unsigned int v68 = v21 + 4;
    uint64_t v25 = &v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID];
    swift_beginAccess(&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID], v81, 0LL, 0LL);
    uint64_t v26 = *(void *)v25;
    swift_bridgeObjectRetain(v26);
    uint64_t v28 = v6;
    char v29 = v5;
    uint64_t v30 = v3;
    uint64_t v31 = sub_10000DED0(v27);
    swift_bridgeObjectRelease(v26);
    uint64_t v32 = Array.description.getter(v31, &type metadata for Int64);
    unint64_t v34 = v33;
    uint64_t v35 = v31;
    uint64_t v3 = v30;
    uint64_t v5 = v29;
    uint64_t v6 = v28;
    uint64_t v36 = v79;
    swift_release(v35);
    uint64_t v85 = sub_100028CC4(v32, v34, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v68, v21 + 12);
    swift_release_n(v1, 2LL);
    swift_bridgeObjectRelease(v34);
    os_log_t v37 = v70;
    _os_log_impl( (void *)&_mh_execute_header,  v70,  (os_log_type_t)v72,  "destroyAllSessions() { sessionIDs=%{private}s }",  v21,  0xCu);
    uint64_t v38 = v69;
    swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);

    uint64_t v7 = v71;
  }

  else
  {
    swift_release_n(v1, 2LL);

    uint64_t v36 = v79;
  }

  uint64_t v39 = *(void **)(v36 + v78);
  *os_log_type_t v12 = v39;
  ((void (*)(void *, void, uint64_t))v80)(v12, v75, v9);
  id v40 = v39;
  LOBYTE(v39) = _dispatchPreconditionTest(_:)(v12);
  uint64_t result = v74(v12, v9);
  if ((v39 & 1) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v41 = &v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID];
  swift_beginAccess(&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID], &v85, 0LL, 0LL);
  uint64_t v42 = *(void *)v41;
  swift_bridgeObjectRetain(v42);
  uint64_t v44 = sub_10000DED0(v43);
  swift_bridgeObjectRelease(v42);
  v80 = v44;
  uint64_t v45 = v44[2];
  if (v45)
  {
    swift_retain(v80);
    v74 = (uint64_t (*)(void *, uint64_t))v1;
    uint64_t v46 = 0LL;
    uint64_t v75 = v45;
    uint64_t v73 = v6;
    do
    {
      uint64_t v47 = v80[v46++ + 4];
      int v48 = *(void **)(v79 + v78);
      uint64_t v49 = swift_allocObject(&unk_10003D838, 24LL, 7LL);
      swift_weakInit(v49 + 16, v74);
      uint64_t v50 = swift_allocObject(&unk_10003D860, 32LL, 7LL);
      *(void *)(v50 + swift_weakDestroy(v0 + 16) = v49;
      *(void *)(v50 + 24) = v47;
      aBlock[4] = (uint64_t)sub_10000B4EC;
      uint64_t v84 = v50;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = (uint64_t)sub_1000172EC;
      aBlock[3] = (uint64_t)&unk_10003D878;
      uint64_t v51 = v3;
      uint64_t v52 = _Block_copy(aBlock);
      id v53 = v48;
      uint64_t v54 = swift_retain(v49);
      static DispatchQoS.unspecified.getter(v54);
      v82 = _swiftEmptyArrayStorage;
      uint64_t v55 = v7;
      uint64_t v56 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v57 = sub_100005EA4((uint64_t *)&unk_100041BC0);
      uint64_t v58 = sub_10000E4B0( (unint64_t *)&qword_1000416F0,  (uint64_t *)&unk_100041BC0,  (uint64_t)&protocol conformance descriptor for [A]);
      uint64_t v59 = v76;
      uint64_t v60 = v56;
      uint64_t v7 = v55;
      uint64_t v61 = v77;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v82, v57, v58, v76, v60);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v61, v5, v52);
      os_log_type_t v62 = v52;
      uint64_t v3 = v51;
      uint64_t v63 = v73;
      _Block_release(v62);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v59);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v61, v63);
      uint64_t v64 = v84;
      swift_release(v49);
      uint64_t v65 = v64;
      uint64_t v66 = v75;
      swift_release(v65);
    }

    while (v66 != v46);
    swift_release(v80);
  }

  return swift_release(v80);
}

void *sub_10000D398(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = _swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v17 = _swiftEmptyArrayStorage;
    sub_100029B04(0, v5, 0);
    uint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      uint64_t v15 = v10;
      a1(&v16, &v15);
      if (v4) {
        break;
      }
      uint64_t v4 = 0LL;
      char v11 = v16;
      uint64_t v17 = v6;
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_100029B04(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v17;
      }

      v6[2] = v13 + 1;
      *((_BYTE *)v6 + v13 + 32) = v11;
      if (!--v5) {
        return v6;
      }
    }

    swift_release(v6);
  }

  return v6;
}

uint64_t sub_10000D4A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (uint64_t *)((char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  uint64_t v7 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  void *v5 = v8;
  uint64_t v9 = enum case for DispatchPredicate.onQueue(_:);
  uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v10(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v11 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v5);
  unint64_t v12 = *(uint64_t (**)(void *, uint64_t))(v3 + 8);
  uint64_t result = v12(v5, v2);
  if ((v8 & 1) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }

  uint64_t v14 = (void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v88, 0LL, 0LL);
  v81 = v14;
  uint64_t v15 = *v14;
  uint64_t v16 = swift_bridgeObjectRetain(v15);
  uint64_t v17 = sub_10000DED0(v16);
  swift_bridgeObjectRelease(v15);
  uint64_t v18 = *(void **)(v6 + v7);
  void *v5 = v18;
  v10(v5, v9, v2);
  id v19 = v18;
  LOBYTE(v18) = _dispatchPreconditionTest(_:)(v5);
  uint64_t result = v12(v5, v2);
  if ((v18 & 1) == 0)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }

  v82 = v10;
  uint64_t v79 = v6;
  uint64_t v80 = v2;
  BOOL v20 = (os_log_s *)v17[2];
  uint64_t result = swift_retain(v1);
  if (v20)
  {
    id v21 = 0LL;
    os_log_t v78 = (os_log_s *)((char *)v20 - 1);
    uint64_t v22 = &_swiftEmptyArrayStorage;
    uint64_t v85 = v7;
    unsigned int v84 = v9;
    v83 = v12;
    do
    {
      if (v21 <= v20) {
        id v23 = v20;
      }
      else {
        id v23 = v21;
      }
      os_log_t v24 = v21;
      while (1)
      {
        if (v23 == v24)
        {
          __break(1u);
          goto LABEL_50;
        }

        uint64_t v25 = v17[(void)v24 + 4];
        uint64_t result = sub_10000BE60(v25, 0, 0x7669746341746567LL, 0xE900000000000065LL);
        if (result)
        {
          int v26 = *(unsigned __int8 *)(result + 66);
          uint64_t result = swift_release(result);
          if (v26 == 1) {
            break;
          }
        }

        os_log_t v24 = (os_log_t)((char *)v24 + 1);
        if (v20 == v24)
        {
          uint64_t v7 = v85;
          uint64_t v9 = v84;
          unint64_t v12 = v83;
          goto LABEL_22;
        }
      }

      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v22);
      v87 = v22;
      if ((result & 1) == 0)
      {
        uint64_t result = sub_100029AE8(0, v22[2] + 1LL, 1);
        uint64_t v22 = v87;
      }

      unint64_t v28 = v22[2];
      unint64_t v27 = v22[3];
      unint64_t v29 = v28 + 1;
      if (v28 >= v27 >> 1)
      {
        uint64_t result = sub_100029AE8(v27 > 1, v28 + 1, 1);
        unint64_t v29 = v28 + 1;
        uint64_t v22 = v87;
      }

      id v21 = (os_log_t)((char *)v24 + 1);
      v22[2] = v29;
      v22[v28 + 4] = v25;
      BOOL v30 = v78 == v24;
      uint64_t v7 = v85;
      uint64_t v9 = v84;
      unint64_t v12 = v83;
    }

    while (!v30);
  }

  else
  {
    uint64_t v22 = &_swiftEmptyArrayStorage;
  }

LABEL_22:
  swift_release(v17);
  swift_release(v1);
  uint64_t v31 = v22[2];
  uint64_t v32 = swift_release(v22);
  if (v31
    || *(double *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) >= static Double.now()(v32))
  {
    return 0LL;
  }

  uint64_t v33 = swift_retain_n(v1, 5LL);
  unint64_t v34 = (void *)Logger.logObject.getter(v33);
  int v35 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled((os_log_t)v34, (os_log_type_t)v35))
  {
    swift_release_n(v1, 5LL);

    return 1LL;
  }

  int v77 = v35;
  os_log_t v78 = (os_log_t)v34;
  uint64_t v36 = swift_slowAlloc(38LL, -1LL);
  uint64_t v76 = swift_slowAlloc(32LL, -1LL);
  v87 = (void *)v76;
  *(_DWORD *)uint64_t v36 = 136381443;
  uint64_t v37 = v7;
  uint64_t v38 = *(void *)(v1 + 24);
  unint64_t v39 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain(v39);
  uint64_t v86 = sub_100028CC4(v38, v39, (uint64_t *)&v87);
  id v40 = v12;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 4, v36 + 12);
  swift_bridgeObjectRelease(v39);
  *(_WORD *)(v36 + 12) = 1024;
  LODWORD(v86) = *(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 4, v36 + 14, v36 + 18);
  swift_release(v1);
  *(_WORD *)(v36 + 18) = 2048;
  uint64_t v85 = v37;
  uint64_t v41 = v79;
  uint64_t v42 = *(void **)(v79 + v37);
  void *v5 = v42;
  unsigned int v84 = v9;
  uint64_t v43 = v80;
  v82(v5, v9, v80);
  id v44 = v42;
  LOBYTE(v39) = _dispatchPreconditionTest(_:)(v5);
  v83 = v40;
  uint64_t result = v40(v5, v43);
  if ((v39 & 1) == 0)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }

  uint64_t v45 = *v81;
  uint64_t v46 = swift_bridgeObjectRetain(*v81);
  uint64_t v47 = sub_10000DED0(v46);
  swift_bridgeObjectRelease(v45);
  uint64_t v48 = v47[2];
  swift_release(v1);
  swift_release(v47);
  uint64_t v86 = v48;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 20, v36 + 28);
  swift_release(v1);
  *(_WORD *)(v36 + 28) = 2048;
  uint64_t v49 = v85;
  uint64_t v50 = v41;
  uint64_t v51 = *(void **)(v41 + v85);
  void *v5 = v51;
  uint64_t v52 = v84;
  v82(v5, v84, v43);
  id v53 = v51;
  LOBYTE(v51) = _dispatchPreconditionTest(_:)(v5);
  uint64_t v54 = v83;
  uint64_t result = v83(v5, v43);
  if ((v51 & 1) == 0)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }

  uint64_t v55 = v43;
  uint64_t v56 = *v81;
  uint64_t v57 = swift_bridgeObjectRetain(*v81);
  uint64_t v58 = sub_10000DED0(v57);
  swift_bridgeObjectRelease(v56);
  uint64_t v59 = *(void **)(v50 + v49);
  void *v5 = v59;
  v82(v5, v52, v55);
  id v60 = v59;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v5);
  uint64_t result = v54(v5, v55);
  if ((v59 & 1) != 0)
  {
    unint64_t v61 = v58[2];
    uint64_t result = swift_retain(v1);
    if (v61)
    {
      unint64_t v62 = 0LL;
      uint64_t v85 = v61 - 1;
      uint64_t v63 = &_swiftEmptyArrayStorage;
LABEL_30:
      if (v62 <= v61) {
        unint64_t v64 = v61;
      }
      else {
        unint64_t v64 = v62;
      }
      unint64_t v65 = v62;
      while (v64 != v65)
      {
        uint64_t v66 = v58[v65 + 4];
        uint64_t result = sub_10000BE60(v66, 0, 0x7669746341746567LL, 0xE900000000000065LL);
        if (result)
        {
          int v67 = *(unsigned __int8 *)(result + 66);
          uint64_t result = swift_release(result);
          if (v67 == 1)
          {
            uint64_t result = swift_isUniquelyReferenced_nonNull_native(v63);
            uint64_t v86 = (uint64_t)v63;
            if ((result & 1) == 0)
            {
              uint64_t result = sub_100029AE8(0, v63[2] + 1LL, 1);
              uint64_t v63 = (void *)v86;
            }

            unint64_t v69 = v63[2];
            unint64_t v68 = v63[3];
            unint64_t v70 = v69 + 1;
            if (v69 >= v68 >> 1)
            {
              uint64_t result = sub_100029AE8(v68 > 1, v69 + 1, 1);
              unint64_t v70 = v69 + 1;
              uint64_t v63 = (void *)v86;
            }

            unint64_t v62 = v65 + 1;
            v63[2] = v70;
            v63[v69 + 4] = v66;
            if (v85 != v65) {
              goto LABEL_30;
            }
            goto LABEL_48;
          }
        }

        if (v61 == ++v65) {
          goto LABEL_48;
        }
      }

  if (v21 < 0) {
    uint64_t v38 = v21;
  }
  else {
    uint64_t v38 = v21 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v21);
  uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v38);
  swift_bridgeObjectRelease(v21);
  if (!v22)
  {
LABEL_26:
    swift_bridgeObjectRelease(v21);
LABEL_27:
    countAndFlagsBits = 0LL;
    goto LABEL_28;
  }

    int64_t v5 = (v13 - 1) & v13;
    uint64_t v9 = __clz(__rbit64(v13)) + (v7 << 6);
LABEL_5:
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
    swift_beginAccess(v10 + 16, v15, 0LL, 0LL);
    swift_bridgeObjectRetain(*(void *)(v10 + 16));
    sub_100021FC8(v11);
  }

  uint64_t v14 = v12 + 4;
  if (v14 >= v6)
  {
LABEL_23:
    swift_release(a1);
    return;
  }

  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    uint64_t v7 = v14;
    goto LABEL_22;
  }

  while (1)
  {
    uint64_t v7 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v7 >= v6) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v7);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }

        uint64_t v18 = (v25 - 1) & v25;
        id v23 = __clz(__rbit64(v25)) + (v21 << 6);
      }

      unint64_t v27 = *(void *)(v13 + 48) + *(void *)(v10 + 72) * v23;
      if ((v14 & 1) != 0)
      {
        sub_100006698(v27, (uint64_t)v12, type metadata accessor for FeatureInfo);
        sub_100006698( *(void *)(v13 + 56) + *(void *)(v31 + 72) * v23,  (uint64_t)v8,  type metadata accessor for FeatureState);
      }

      else
      {
        sub_10001E188(v27, (uint64_t)v12, type metadata accessor for FeatureInfo);
        sub_10001E188( *(void *)(v13 + 56) + *(void *)(v31 + 72) * v23,  (uint64_t)v8,  type metadata accessor for FeatureState);
      }

      uint64_t result = sub_100020B4C((uint64_t)v12, (uint64_t)v8, v32);
    }
  }

  uint64_t result = swift_release(v13);
LABEL_32:
  *uint64_t v3 = v32;
  return result;
}

    uint64_t v16 = (v22 - 1) & v22;
    uint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    id v19 = *(void *)(v28 + 72) * v18;
    sub_10001E188(*(void *)(v8 + 48) + v19, (uint64_t)v7, type metadata accessor for FeatureInfo);
    BOOL v20 = *(void *)(v29 + 72) * v18;
    sub_10001E188(*(void *)(v8 + 56) + v20, (uint64_t)v4, type metadata accessor for FeatureState);
    sub_100006698((uint64_t)v7, *(void *)(v10 + 48) + v19, type metadata accessor for FeatureInfo);
    uint64_t result = (void *)sub_100006698((uint64_t)v4, *(void *)(v10 + 56) + v20, type metadata accessor for FeatureState);
  }

  id v23 = v21 + 2;
  if (v23 >= v27)
  {
LABEL_23:
    uint64_t result = (void *)swift_release(v8);
    uint64_t v1 = v25;
    goto LABEL_25;
  }

  uint64_t v22 = *(void *)(v26 + 8 * v23);
  if (v22)
  {
    unint64_t v13 = v23;
    goto LABEL_22;
  }

  while (1)
  {
    unint64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_23;
    }
    uint64_t v22 = *(void *)(v26 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }

LABEL_50:
      __break(1u);
      goto LABEL_51;
    }

    uint64_t v63 = &_swiftEmptyArrayStorage;
LABEL_48:
    swift_release(v58);
    swift_release(v1);
    uint64_t v72 = v63[2];
    swift_release(v1);
    swift_release(v63);
    uint64_t v86 = v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 30, v36 + 38);
    swift_release(v1);
    os_log_t v73 = v78;
    _os_log_impl( (void *)&_mh_execute_header,  v78,  (os_log_type_t)v77,  "ClientServerInstance should be invalidated. { clientProcessName=%{private}s, pid=%d, sessionCount=%ld, activeSessions=%ld }",  (uint8_t *)v36,  0x26u);
    uint64_t v71 = 1LL;
    uint64_t v74 = v76;
    swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1LL, -1LL);
    swift_slowDealloc(v36, -1LL, -1LL);

    return v71;
  }

LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_10000DBEC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return v2 & 1;
  }
  if (*(_BYTE *)(a2 + 32) == (result & 1)) {
    return 1LL;
  }
  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v3 = 33LL;
  while (1)
  {
    uint64_t v4 = v3 - 31;
    if (__OFADD__(v3 - 32, 1LL)) {
      break;
    }
    char v5 = *(_BYTE *)(a2 + v3) ^ result;
    if ((v5 & 1) != 0)
    {
      ++v3;
      if (v4 != v2) {
        continue;
      }
    }

    LOBYTE(v2) = v5 ^ 1;
    return v2 & 1;
  }

  __break(1u);
  return result;
}

Swift::Int sub_10000DC5C()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v5, 0LL);
  Hasher._combine(_:)(*(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000DCD4(uint64_t a1)
{
  uint64_t v3 = *v1;
  Hasher._combine(_:)(*(_DWORD *)(*v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000DD30(uint64_t a1)
{
  uint64_t v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(*(_DWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 32);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000DDA4(uint64_t *a1, uint64_t *a2)
{
  return sub_10000E354(*a1, *a2);
}

uint64_t sub_10000DDB0()
{
  return sub_1000061B8(&qword_1000417F8, type metadata accessor for ClientServerInstance, (uint64_t)&unk_100035950);
}

void *sub_10000DDDC(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v4 = _swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v3 = sub_100005EA4(&qword_100041820);
      uint64_t v4 = (void *)swift_allocObject(v3, 8 * v2 + 32, 7LL);
      int64_t v5 = j__malloc_size(v4);
      uint64_t v6 = v5 - 32;
      if (v5 < 32) {
        uint64_t v6 = v5 - 25;
      }
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }

    swift_bridgeObjectRetain(v1);
    uint64_t v7 = sub_10000DFB4((unint64_t)(v4 + 4), v2, v1);
    uint64_t v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    if (v1 < 0) {
      uint64_t v9 = v1;
    }
    else {
      uint64_t v9 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }

  return v4;
}

void *sub_10000DED0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100005EA4(&qword_100041810);
  uint64_t v4 = (void *)swift_allocObject(v3, 8 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 25;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 3);
  uint64_t v7 = sub_10000E1C0(&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10000E404(v8);
  if (v7 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

uint64_t sub_10000DFB4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return a3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v7) {
      return a3;
    }
  }

  if (!a1) {
    goto LABEL_25;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  if (v6)
  {
    if (a3 < 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000E4B0(&qword_100041830, &qword_100041828, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_100005EA4(&qword_100041828);
          unint64_t v13 = sub_10001BAC0(v18, i, a3);
          uint64_t v15 = *v14;
          swift_retain(*v14);
          ((void (*)(uint64_t **, void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for Config(0LL);
    swift_arrayInitWithCopy(a1);
    return a3;
  }

    uint64_t v14 = (v23 - 1) & v23;
    id v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    uint64_t v25 = *(void *)(v8 + 56);
    int v26 = v8;
    unint64_t v27 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    unint64_t v29 = *v27;
    unint64_t v28 = v27[1];
    BOOL v30 = *(void *)(v6 + 72);
    uint64_t v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v47, *(void *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    uint64_t result = Hasher._finalize()();
    uint64_t v32 = -1LL << *(_BYTE *)(v10 + 32);
    uint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      uint64_t v18 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      int v35 = 0;
      uint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0LL;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v15 + 8 * v34);
      }

      while (v38 == -1);
      uint64_t v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    id v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *id v19 = v29;
    v19[1] = v28;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 56) + v30 * v18,  v45,  v46);
    ++*(void *)(v10 + 16);
    uint64_t v8 = v26;
  }

  os_log_t v24 = v22 + 2;
  if (v24 < v42)
  {
    id v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        uint64_t v17 = v24 + 1;
        if (__OFADD__(v24, 1LL)) {
          goto LABEL_43;
        }
        if (v17 >= v42) {
          goto LABEL_36;
        }
        id v23 = v43[v17];
        ++v24;
        if (v23) {
          goto LABEL_23;
        }
      }
    }

    uint64_t v17 = v24;
    goto LABEL_23;
  }

  __break(1u);
LABEL_24:
  uint64_t v16 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v16,  1092LL,  0);
  __break(1u);
  return result;
}

    uint64_t v17 = (v23 - 1) & v23;
    uint64_t v43 = v24;
    id v21 = __clz(__rbit64(v23)) + (v24 << 6);
LABEL_24:
    sub_10001E188( *(void *)(v42 + 56) + *(void *)(v40 + 72) * v21,  (uint64_t)v12,  type metadata accessor for FeatureState);
    sub_100006698((uint64_t)v12, (uint64_t)v10, type metadata accessor for FeatureState);
    int v26 = sub_10001E188((uint64_t)v10, (uint64_t)v7, type metadata accessor for FeatureState);
    unint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
    unint64_t v28 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v29 = v36.n128_u32[0];
      BOOL v30 = v12;
      uint64_t v31 = v4;
      uint64_t v32 = *(_DWORD *)&v7[*(int *)(v4 + 24)];
      sub_100033640((uint64_t)v7, type metadata accessor for FeatureState);
      *(_DWORD *)(v29 + 4) = v32;
      uint64_t v4 = v31;
      unint64_t v12 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "notify_cancel(%{public}d)", (uint8_t *)v29, 8u);
      uint64_t v33 = v29;
      uint64_t v10 = v37;
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {
      sub_100033640((uint64_t)v7, type metadata accessor for FeatureState);
    }

    id v19 = v43;

    notify_cancel(*(_DWORD *)&v10[*(int *)(v4 + 24)]);
    sub_100033640((uint64_t)v10, type metadata accessor for FeatureState);
  }

  uint64_t v25 = v19 + 5;
  if (v19 + 5 >= v39)
  {
LABEL_26:
    swift_release(v42);
    unint64_t v34 = v35;
    swift_bridgeObjectRelease(*v35);
    *unint64_t v34 = &_swiftEmptyDictionarySingleton;
    return;
  }

  id v23 = *(void *)(v38 + 8 * v25);
  if (v23)
  {
    os_log_t v24 = v19 + 5;
    goto LABEL_23;
  }

  while (1)
  {
    os_log_t v24 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v24 >= v39) {
      goto LABEL_26;
    }
    id v23 = *(void *)(v38 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_23;
    }
  }

    __break(1u);
    goto LABEL_24;
  }

  sub_10001F8B8(v27, v65 & 1);
  unint64_t v29 = sub_10001F324(v20, v19);
  if ((v28 & 1) == (v30 & 1))
  {
    os_log_t v24 = v29;
    if ((v28 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v32 = swift_allocError(&type metadata for _MergeError, &protocol witness table for _MergeError, 0LL, 0LL);
    swift_willThrow(v32);
    uint64_t v74 = v32;
    swift_errorRetain(v32);
    uint64_t v33 = sub_100005EA4(&qword_1000422B8);
    if ((swift_dynamicCast(v33, &v74, v33, &type metadata for _MergeError, 0LL) & 1) == 0)
    {
      unint64_t v34 = v64;
      swift_bridgeObjectRelease(v64);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v69, v68);
      int v35 = v73;
      swift_bridgeObjectRelease(v34);
      swift_bridgeObjectRelease(v35);
      return swift_errorRelease(v74);
    }

    goto LABEL_26;
  }

LABEL_26:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  unint64_t v6 = (v21 - 1) & v21;
  id v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; id v19 = v18 | (i << 6))
  {
    os_log_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v25 = v24[1];
    int v26 = *(void **)(*(void *)(v1 + 56) + 8 * v19);
    uint64_t v42 = *v24;
    uint64_t v43 = v25;
    uint64_t v41 = v26;
    unint64_t v27 = sub_1000133A4();
    swift_bridgeObjectRetain(v25);
    unint64_t v28 = v26;
    swift_dynamicCast(v7, &v41, v27, v10, 7LL);
    unint64_t v29 = v42;
    BOOL v30 = v43;
    sub_100013374(v7, v8);
    sub_100013374(v8, v47);
    sub_100013374(v47, &v45);
    uint64_t v31 = sub_10001F324(v29, v30);
    uint64_t v32 = v31;
    if ((v33 & 1) != 0)
    {
      id v40 = v6;
      uint64_t v11 = v8;
      unint64_t v12 = v7;
      unint64_t v13 = v1;
      uint64_t v14 = i;
      uint64_t v15 = v10;
      uint64_t v16 = (uint64_t *)(v3[6] + 16 * v31);
      swift_bridgeObjectRelease(v16[1]);
      *uint64_t v16 = v29;
      v16[1] = v30;
      uint64_t v10 = v15;
      unint64_t i = v14;
      uint64_t v1 = v13;
      uint64_t v7 = v12;
      uint64_t v8 = v11;
      unint64_t v6 = v40;
      uint64_t v17 = (void *)(v3[7] + 32 * v32);
      sub_100013384(v17);
      sub_100013374(&v45, v17);
      if (!v40) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v31;
    unint64_t v34 = (uint64_t *)(v3[6] + 16 * v31);
    *unint64_t v34 = v29;
    v34[1] = v30;
    sub_100013374(&v45, (_OWORD *)(v3[7] + 32 * v31));
    int v35 = v3[2];
    uint64_t v36 = __OFADD__(v35, 1LL);
    uint64_t v37 = v35 + 1;
    if (v36) {
      goto LABEL_34;
    }
    v3[2] = v37;
    if (!v6) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v18 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

  uint64_t v43 = (v21 - 1) & v21;
  id v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; id v19 = __clz(__rbit64(v6)) | (i << 6))
  {
    os_log_t v24 = 16 * v19;
    uint64_t v25 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    unint64_t v27 = *v25;
    int v26 = v25[1];
    unint64_t v28 = (uint64_t *)(*(void *)(v1 + 56) + v24);
    unint64_t v29 = *v28;
    BOOL v30 = v28[1];
    uint64_t v45 = v27;
    uint64_t v46 = v26;
    v44[0] = v29;
    v44[1] = v30;
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v30);
    swift_dynamicCast(v7, v44, v11, v10, 7LL);
    uint64_t v31 = v45;
    uint64_t v32 = v46;
    sub_100013374(v7, v8);
    sub_100013374(v8, v50);
    sub_100013374(v50, &v48);
    uint64_t v33 = sub_10001F324(v31, v32);
    unint64_t v34 = v33;
    if ((v35 & 1) != 0)
    {
      uint64_t v42 = i;
      unint64_t v12 = v8;
      unint64_t v13 = v7;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v3[6] + 16 * v33);
      swift_bridgeObjectRelease(v17[1]);
      *uint64_t v17 = v31;
      v17[1] = v32;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v7 = v13;
      uint64_t v8 = v12;
      unint64_t i = v42;
      uint64_t v18 = (void *)(v3[7] + 32 * v34);
      sub_100013384(v18);
      sub_100013374(&v48, v18);
      unint64_t v6 = v43;
      if (!v43) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v33;
    uint64_t v36 = (uint64_t *)(v3[6] + 16 * v33);
    *uint64_t v36 = v31;
    v36[1] = v32;
    sub_100013374(&v48, (_OWORD *)(v3[7] + 32 * v33));
    uint64_t v37 = v3[2];
    uint64_t v38 = __OFADD__(v37, 1LL);
    unint64_t v39 = v37 + 1;
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
}

        uint64_t v9 = (v18 - 1) & v18;
        uint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }

      BOOL v20 = *(void *)(*(void *)(v3 + 48) + 8 * v16);
      Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
      Hasher._combine(_:)(*(_DWORD *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
      id v21 = *(void *)(v20 + 24);
      uint64_t v22 = *(void *)(v20 + 32);
      swift_bridgeObjectRetain(v22);
      String.hash(into:)(v33, v21, v22);
      swift_bridgeObjectRelease(v22);
      uint64_t result = Hasher._finalize()();
      id v23 = -1LL << *(_BYTE *)(v6 + 32);
      os_log_t v24 = result & ~v23;
      uint64_t v25 = v24 >> 6;
      if (((-1LL << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) != 0)
      {
        uint64_t v14 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        int v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          unint64_t v28 = v25 == v27;
          if (v25 == v27) {
            uint64_t v25 = 0LL;
          }
          v26 |= v28;
          unint64_t v29 = *(void *)(v11 + 8 * v25);
        }

        while (v29 == -1);
        uint64_t v14 = __clz(__rbit64(~v29)) + (v25 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      *(void *)(*(void *)(v6 + 48) + 8 * v14) = v20;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        uint64_t v10 = (v19 - 1) & v19;
        uint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      id v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      id v23 = result & ~v22;
      os_log_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        uint64_t v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v25 = 0;
        int v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          unint64_t v27 = v24 == v26;
          if (v24 == v26) {
            os_log_t v24 = 0LL;
          }
          v25 |= v27;
          unint64_t v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        uint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    uint64_t v10 = (v18 - 1) & v18;
    uint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
LABEL_27:
    BOOL v20 = *(void *)(*(void *)(v3 + 48) + 8 * v16);
    Hasher.init(_seed:)(v32, *(void *)(v6 + 40));
    Hasher._combine(_:)(*(_DWORD *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    id v21 = *(void *)(v20 + 24);
    uint64_t v22 = *(void *)(v20 + 32);
    swift_retain(v20);
    swift_bridgeObjectRetain(v22);
    String.hash(into:)(v32, v21, v22);
    swift_bridgeObjectRelease(v22);
    uint64_t result = Hasher._finalize()();
    id v23 = -1LL << *(_BYTE *)(v6 + 32);
    os_log_t v24 = result & ~v23;
    uint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      uint64_t v14 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      int v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        unint64_t v28 = v25 == v27;
        if (v25 == v27) {
          uint64_t v25 = 0LL;
        }
        v26 |= v28;
        unint64_t v29 = *(void *)(v11 + 8 * v25);
      }

      while (v29 == -1);
      uint64_t v14 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    *(void *)(*(void *)(v6 + 48) + 8 * v14) = v20;
    ++*(void *)(v6 + 16);
  }

  id v19 = v17 + 3;
  if (v19 >= v31)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  uint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    unint64_t v13 = v19;
    goto LABEL_26;
  }

  while (1)
  {
    unint64_t v13 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v13 >= v31) {
      goto LABEL_36;
    }
    uint64_t v18 = *(void *)(v8 + 8 * v13);
    ++v19;
    if (v18) {
      goto LABEL_26;
    }
  }

    uint64_t v10 = (v19 - 1) & v19;
    uint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    id v21 = *(void *)(v6 + 40);
    uint64_t v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    uint64_t result = NSObject._rawHashValue(seed:)(v21);
    id v23 = -1LL << *(_BYTE *)(v6 + 32);
    os_log_t v24 = result & ~v23;
    uint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      uint64_t v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      int v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        unint64_t v28 = v25 == v27;
        if (v25 == v27) {
          uint64_t v25 = 0LL;
        }
        v26 |= v28;
        unint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      uint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  BOOL v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  id v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    uint64_t v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    id v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

  __break(1u);
  return result;
}

void *sub_10000E1C0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1LL;
  uint64_t v6 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0LL;
    a3 = 0LL;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }

  if (!a3)
  {
    int64_t v8 = 0LL;
    goto LABEL_35;
  }

  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  int64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }

  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
    goto LABEL_37;
  }

  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2LL;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13;
    goto LABEL_34;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }

  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }

  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0LL;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0LL;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }

    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }

LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000E354(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2
                                                                                                  + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
    return 0LL;
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t sub_10000E3A4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000E3C8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000E3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E3FC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000E404(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E410(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_100041818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000E450@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_10000C250(*(void *)(v2 + 24), *a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_10000E498@<X0>(_BYTE *a1@<X8>)
{
  return sub_100025AC4(*(void *)(v1 + 24), a1);
}

uint64_t sub_10000E4B0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100006108(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_10000E4F0(void *a1)
{
  uint64_t v2 = v1;
  v1[2] = 0LL;
  v1[3] = 0LL;
  id v4 = [objc_allocWithZone(MADownloadOptions) init];
  [v4 setAllowsCellularAccess:1];
  [v4 setRequiresPowerPluggedIn:1];
  [v4 setCanUseLocalCacheServer:1];
  if (qword_100041620 != -1) {
    swift_once(&qword_100041620, sub_100011174);
  }
  id v5 = [v4 setTimeoutIntervalForResource:qword_100041838];
  v2[4] = v4;
  v2[5] = 0xD000000000000024LL;
  v2[6] = 0x80000001000365E0LL;
  v2[7] = 0xD000000000000028LL;
  v2[8] = 0x8000000100036610LL;
  uint64_t v6 = static Logger.mobileAsset.getter(v5);
  unint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MobileAssetsHandler init", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  id v10 = [(id)objc_opt_self(BGSystemTaskScheduler) sharedScheduler];
  uint64_t v11 = v2[8];
  swift_bridgeObjectRetain(v11);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v17[4] = sub_1000114F4;
  uint64_t v18 = v2;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256LL;
  v17[2] = sub_10000E8E8;
  v17[3] = &unk_10003D9A0;
  int64_t v13 = _Block_copy(v17);
  unint64_t v14 = v18;
  id v15 = a1;
  swift_retain(v2);
  swift_release(v14);
  [v10 registerForTaskWithIdentifier:v12 usingQueue:v15 launchHandler:v13];

  _Block_release(v13);
  return v2;
}

id sub_10000E758(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_retain_n(a2, 2LL);
  id v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v8;
    *(_DWORD *)unint64_t v7 = 136380675;
    uint64_t v9 = *(void *)(a2 + 56);
    unint64_t v10 = *(void *)(a2 + 64);
    swift_bridgeObjectRetain(v10);
    uint64_t v13 = sub_100028CC4(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);
    swift_release_n(a2, 2LL);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ScheduledActivity { activity=%{private}s }", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
    swift_release_n(a2, 2LL);
  }

  sub_10000F214(v11);
  return [a1 setTaskCompleted];
}

void sub_10000E8E8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

os_log_s *sub_10000E938(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + 48);
  id v8 = objc_allocWithZone(&OBJC_CLASS___MAAssetQuery);
  swift_bridgeObjectRetain(v7);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  unint64_t v10 = (os_log_s *)[v8 initWithType:v9];

  if (!v10)
  {
    unint64_t v10 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v15, "Failed to create query", v16, 2u);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    goto LABEL_20;
  }

  -[os_log_s returnTypes:](v10, "returnTypes:", a1);
  -[os_log_s setDoNotBlockBeforeFirstUnlock:](v10, "setDoNotBlockBeforeFirstUnlock:", 1LL);
  if (-[os_log_s queryMetaDataSync](v10, "queryMetaDataSync") == (id)5)
  {
    uint64_t v11 = (void *)Logger.logObject.getter(5LL);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled((os_log_t)v11, v12))
    {
LABEL_19:

LABEL_20:
      return 0LL;
    }

    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, v12, "Missing entitlement!", v13, 2u);
    uint64_t v14 = v13;
LABEL_17:
    swift_slowDealloc(v14, -1LL, -1LL);
    goto LABEL_19;
  }

  id v17 = -[os_log_s results](v10, "results");
  if (!v17)
  {
    uint64_t v28 = swift_bridgeObjectRetain_n(a3, 2LL);
    uint64_t v11 = (void *)Logger.logObject.getter(v28);
    LOBYTE(v24) = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v11, (os_log_type_t)v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v26 = swift_slowAlloc(32LL, -1LL);
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v25 = 136380675;
      swift_bridgeObjectRetain(a3);
      uint64_t v30 = sub_100028CC4(a2, a3, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(a3, 3LL);
      unint64_t v27 = "query.results is nil { errorNote=%{private}s }";
      goto LABEL_16;
    }

LABEL_18:
    swift_bridgeObjectRelease_n(a3, 2LL);
    goto LABEL_19;
  }

  uint64_t result = (os_log_s *)-[os_log_s results](v10, "results");
  if (result)
  {
    id v19 = result;
    unint64_t v20 = sub_10000F198();
    uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);

    if ((unint64_t)v21 >> 62)
    {
      if (v21 < 0) {
        uint64_t v29 = v21;
      }
      else {
        uint64_t v29 = v21 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v21);
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v29);
      swift_bridgeObjectRelease(v21);
    }

    else
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    swift_bridgeObjectRelease(v21);
    if (v22) {
      return v10;
    }
    uint64_t v23 = swift_bridgeObjectRetain_n(a3, 2LL);
    uint64_t v11 = (void *)Logger.logObject.getter(v23);
    uint64_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v11, (os_log_type_t)v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v26 = swift_slowAlloc(32LL, -1LL);
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v25 = 136380675;
      swift_bridgeObjectRetain(a3);
      uint64_t v30 = sub_100028CC4(a2, a3, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(a3, 3LL);
      unint64_t v27 = "query.results.isEmpty! { errorNote=%{private}s }";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, (os_log_type_t)v24, v27, v25, 0xCu);
      swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      uint64_t v14 = v25;
      goto LABEL_17;
    }

    goto LABEL_18;
  }

  __break(1u);
  return result;
}

  uint64_t v22 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v22 + 48) + 8 * a2) = v6;
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = __OFADD__(v23, 1LL);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
LABEL_21:
    uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v3);
    __break(1u);
  }

  else
  {
    *(void *)(v22 + swift_weakDestroy(v0 + 16) = v25;
  }

  return result;
}

Swift::String_optional __swiftcall MobileAssetsHandler.getMobileAssetsConfigPath()()
{
  p_ivar_lyt = (void **)type metadata accessor for URL.DirectoryHint(0LL);
  unint64_t v1 = (unint64_t)*(p_ivar_lyt - 1);
  __chkstk_darwin(p_ivar_lyt);
  uint64_t v3 = (uint64_t)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100005EA4(&qword_100041840);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  NSString v9 = (char *)&v42 - v8;
  unint64_t v10 = (void **)type metadata accessor for URL(0LL);
  uint64_t v11 = (void (**)(char *, uint64_t, uint64_t, void **))*(v10 - 1);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v42 - v15;
  id v17 = sub_10000E938(1LL, 0xD000000000000011LL, 0x80000001000369D0LL);
  object = v17;
  if (!v17)
  {
    id countAndFlagsBits = 0LL;
    goto LABEL_29;
  }

  uint64_t v49 = v16;
  id countAndFlagsBits = -[os_log_s results](v17, "results");

  if (!countAndFlagsBits)
  {
LABEL_28:
    object = 0LL;
    goto LABEL_29;
  }

  uint64_t v46 = v14;
  unint64_t v20 = sub_10000F198();
  uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(countAndFlagsBits, v20);

  if (!((unint64_t)v21 >> 62))
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v22) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }

LABEL_5:
  uint64_t v47 = v11;
  uint64_t v48 = v10;
  uint64_t v43 = v3;
  unint64_t v44 = v1;
  uint64_t v45 = p_ivar_lyt;
  unint64_t v1 = v21 & 0xC000000000000001LL;
  swift_bridgeObjectRetain(v21);
  uint64_t v3 = 4LL;
  p_ivar_lyt = &CLISignalHandler__classData.ivar_lyt;
  unint64_t v10 = &CLISignalHandler__classData.ivar_lyt;
  while (1)
  {
    if (v1) {
      uint64_t v23 = (void (**)(char *, uint64_t, uint64_t, void **))specialized _ArrayBuffer._getElementSlowPath(_:)( v3 - 4,  v21);
    }
    else {
      uint64_t v23 = (void (**)(char *, uint64_t, uint64_t, void **))*(id *)(v21 + 8 * v3);
    }
    uint64_t v11 = v23;
    uint64_t v24 = v3 - 3;
    if (__OFADD__(v3 - 4, 1LL))
    {
      __break(1u);
      goto LABEL_22;
    }

    ++v3;
    if (v24 == v22)
    {
      swift_bridgeObjectRelease_n(v21, 2LL);
      v47[7](v9, 1LL, 1LL, v48);
LABEL_19:
      sub_10000F1D4((uint64_t)v9);
      goto LABEL_27;
    }
  }

  swift_bridgeObjectRelease_n(v21, 2LL);
  id v25 = [v11 getLocalUrl];

  if (v25)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v25);

    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = 1LL;
  }

  unint64_t v28 = v44;
  unint64_t v27 = v45;
  uint64_t v30 = v47;
  uint64_t v29 = v48;
  uint64_t v31 = v43;
  uint64_t v32 = v46;
  v47[7](v7, v26, 1LL, v48);
  sub_1000112AC((uint64_t)v7, (uint64_t)v9);
  uint64_t v33 = v49;
  ((void (*)(char *, char *, void **))v30[4])(v49, v9, v29);
  type metadata accessor for Config(0LL);
  uint64_t v50 = static Config.distributedConfigName.getter();
  uint64_t v51 = v34;
  (*(void (**)(uint64_t, void, void **))(v28 + 104))( v31,  enum case for URL.DirectoryHint.inferFromPath(_:),  v27);
  unint64_t v35 = sub_1000112F4();
  URL.appending<A>(component:directoryHint:)(&v50, v31, &type metadata for String, v35);
  (*(void (**)(uint64_t, void **))(v28 + 8))(v31, v27);
  swift_bridgeObjectRelease(v51);
  Swift::String v36 = URL.path(percentEncoded:)(0);
  id countAndFlagsBits = (id)v36._countAndFlagsBits;
  object = v36._object;
  uint64_t v37 = v30[1];
  ((void (*)(char *, void **))v37)(v32, v29);
  ((void (*)(char *, void **))v37)(v33, v29);
LABEL_29:
  uint64_t v39 = (uint64_t)countAndFlagsBits;
  id v40 = object;
  result.value._object = v40;
  result.value._id countAndFlagsBits = v39;
  return result;
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    Swift::String_optional result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v18 = *(void *)(v3 + 16);
  id v19 = __OFSUB__(v18, 1LL);
  unint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + swift_weakDestroy(v0 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  NSString v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  sub_100005EA4(&qword_100041E10);
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    Swift::String_optional result = swift_bridgeObjectRelease(a1);
    *unint64_t v1 = v3;
    return result;
  }

  uint64_t v11 = *((void *)v3 + 2);
  uint64_t v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

unint64_t sub_10000F198()
{
  unint64_t result = qword_100041848;
  if (!qword_100041848)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___MAAsset);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100041848);
  }

  return result;
}

uint64_t sub_10000F1D4(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_100041840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_10000F214(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Updating assets.", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = swift_retain_n(v1, 2LL);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v7, v8))
  {
    swift_release_n(v2, 2LL);
    goto LABEL_7;
  }

  NSString v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v10 = swift_slowAlloc(32LL, -1LL);
  aBlock[0] = v10;
  *(_DWORD *)NSString v9 = 136380675;
  id v11 = [*(id *)(v2 + 32) tightSummaryIncludingAdditional:1];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;

    uint64_t v21 = sub_100028CC4(v13, v15, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, aBlock, v9 + 4, v9 + 12);
    swift_release_n(v2, 2LL);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Options summary. { summary=%{private}s }", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
LABEL_7:

    unint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___MAAsset);
    NSString v17 = String._bridgeToObjectiveC()();
    uint64_t v18 = *(void *)(v2 + 32);
    aBlock[4] = (uint64_t)sub_10001141C;
    uint64_t v23 = v2;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100011138;
    aBlock[3] = (uint64_t)&unk_10003D8D8;
    id v19 = _Block_copy(aBlock);
    uint64_t v20 = v23;
    swift_retain(v2);
    swift_release(v20);
    [v16 startCatalogDownload:v17 options:v18 then:v19];
    _Block_release(v19);

    return;
  }

  swift_release(v2);
  __break(1u);
}

void sub_10000F4C0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v168 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  v160 = (char *)&v155 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v167 = (char *)&v155 - v7;
  uint64_t v8 = sub_100005EA4(&qword_100041840);
  uint64_t v9 = __chkstk_darwin(v8);
  v161 = (char *)&v155 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  v158 = (char *)&v155 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v157 = (char *)&v155 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v164 = (char *)&v155 - v16;
  NSString v17 = (char *)a2 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v173 = v17;
  uint64_t v174 = v4;
  v169 = a2;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v22 = (void **)swift_slowAlloc(32LL, -1LL);
    uint64_t v178 = a1;
    aBlock = v22;
    *(_DWORD *)uint64_t v21 = 136380675;
    type metadata accessor for MADownloadResult(0LL);
    uint64_t v24 = String.init<A>(describing:)(&v178, v23);
    unint64_t v26 = v25;
    uint64_t v178 = sub_100028CC4(v24, v25, (uint64_t *)&aBlock);
    unint64_t v27 = v173;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, &aBlock, v21 + 4, v21 + 12);
    a2 = v169;
    uint64_t v28 = v174;
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got the download metadata { reply=%{private}s }", v21, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v29 = v22;
    NSString v17 = v27;
    swift_slowDealloc(v29, -1LL, -1LL);
    uint64_t v30 = v21;
    uint64_t v4 = v28;
    swift_slowDealloc(v30, -1LL, -1LL);
  }

  uint64_t v31 = sub_10000E938(4LL, 0xD00000000000001CLL, 0x8000000100036A80LL);
  if (!v31) {
    return;
  }
  v155 = v31;
  id v32 = -[os_log_s results](v31, "results");
  if (!v32) {
    goto LABEL_72;
  }
  uint64_t v33 = v32;
  unint64_t v34 = sub_10000F198();
  uint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v33, v34);

  if ((unint64_t)v35 >> 62)
  {
LABEL_54:
    if (v35 < 0) {
      uint64_t v154 = v35;
    }
    else {
      uint64_t v154 = v35 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v35);
    uint64_t v37 = _CocoaArrayWrapper.endIndex.getter(v154);
    swift_bridgeObjectRelease(v35);
    if (v37) {
      goto LABEL_7;
    }
LABEL_58:

    swift_bridgeObjectRelease(v35);
    return;
  }

  uint64_t v37 = *(void *)((v35 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v37) {
    goto LABEL_58;
  }
LABEL_7:
  unint64_t v172 = v35 & 0xC000000000000001LL;
  p_aBlock = &aBlock;
  uint64_t v38 = 4LL;
  *(void *)&__int128 v36 = 136381187LL;
  __int128 v165 = v36;
  v163 = (char *)&type metadata for Any + 8;
  *(void *)&__int128 v36 = 136380675LL;
  __int128 v162 = v36;
  *(void *)&__int128 v36 = 136380931LL;
  __int128 v159 = v36;
  uint64_t v166 = v35;
  uint64_t v171 = v37;
  while (1)
  {
    uint64_t v40 = v38 - 4;
    if (v172)
    {
      id v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v38 - 4, v35);
      uint64_t v42 = (void **)(v38 - 3);
      if (__OFADD__(v40, 1LL)) {
        goto LABEL_53;
      }
    }

    else
    {
      id v41 = *(id *)(v35 + 8 * v38);
      uint64_t v42 = (void **)(v38 - 3);
      if (__OFADD__(v40, 1LL))
      {
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
    }

    uint64_t v177 = v38;
    uint64_t v43 = (void **)v41;
    unint64_t v44 = (void *)Logger.logObject.getter(v43);
    int v45 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled((os_log_t)v44, (os_log_type_t)v45))
    {

      goto LABEL_22;
    }

    LODWORD(v170) = v45;
    v176 = v42;
    uint64_t v46 = swift_slowAlloc(32LL, -1LL);
    uint64_t v47 = (void **)swift_slowAlloc(96LL, -1LL);
    aBlock = v47;
    *(_DWORD *)uint64_t v46 = v165;
    id v48 = [v43 assetType];
    if (!v48) {
      break;
    }
    uint64_t v49 = v48;
    uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v52 = v51;

    uint64_t v178 = sub_100028CC4(v50, v52, (uint64_t *)&aBlock);
    uint64_t v35 = (uint64_t)p_aBlock;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, p_aBlock, v46 + 4, v46 + 12);

    swift_bridgeObjectRelease(v52);
    uint64_t v4 = 2081LL;
    *(_WORD *)(v46 + 12) = 2081;
    id v53 = [v43 assetId];
    if (!v53) {
      goto LABEL_61;
    }
    uint64_t v54 = v53;
    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v57 = v56;

    uint64_t v178 = sub_100028CC4(v55, v57, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, v35, v46 + 14, v46 + 22);

    swift_bridgeObjectRelease(v57);
    *(_WORD *)(v46 + 22) = 2081;
    id v58 = [v43 assetServerUrl];
    if (!v58) {
      goto LABEL_62;
    }
    uint64_t v59 = v58;
    id v60 = v167;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v61 = v168;
    unint64_t v62 = v164;
    uint64_t v4 = v174;
    (*(void (**)(char *, char *, uint64_t))(v168 + 32))(v164, v60, v174);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v62, 0LL, 1LL, v4);
    uint64_t v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 48))(v62, 1LL, v4);
    if ((_DWORD)v63 == 1) {
      goto LABEL_63;
    }
    uint64_t v64 = URL.absoluteString.getter(v63);
    unint64_t v66 = v65;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v4);
    uint64_t v178 = sub_100028CC4(v64, v66, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, p_aBlock, v46 + 24, v46 + 32);

    swift_bridgeObjectRelease(v66);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v44,  (os_log_type_t)v170,  "Found asset to download. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }",  (uint8_t *)v46,  0x20u);
    swift_arrayDestroy(v47, 3LL, v163);
    swift_slowDealloc(v47, -1LL, -1LL);
    swift_slowDealloc(v46, -1LL, -1LL);

    a2 = v169;
    NSString v17 = v173;
    uint64_t v35 = v166;
    uint64_t v37 = v171;
    uint64_t v42 = v176;
LABEL_22:
    double v67 = static Double.now()();
    id v68 = [v43 state];
    if (v68 == (id)4)
    {
      uint64_t v96 = swift_retain_n(a2, 2LL);
      v97 = (os_log_s *)Logger.logObject.getter(v96);
      os_log_type_t v98 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = swift_slowAlloc(12LL, -1LL);
        v100 = (void **)swift_slowAlloc(32LL, -1LL);
        aBlock = v100;
        *(_DWORD *)uint64_t v99 = v162;
        v176 = v42;
        v101 = v17;
        uint64_t v102 = a2[5];
        unint64_t v103 = a2[6];
        swift_bridgeObjectRetain(v103);
        uint64_t v104 = v102;
        NSString v17 = v101;
        uint64_t v42 = v176;
        *(void *)(v99 + 4) = sub_100028CC4(v104, v103, (uint64_t *)&aBlock);
        swift_release_n(a2, 2LL);
        swift_bridgeObjectRelease(v103);
        _os_log_impl( (void *)&_mh_execute_header,  v97,  v98,  "Downloading { assetType=%{private}s }",  (uint8_t *)v99,  0xCu);
        swift_arrayDestroy(v100, 1LL, (char *)&type metadata for Any + 8);
        v105 = v100;
        uint64_t v4 = v174;
        swift_slowDealloc(v105, -1LL, -1LL);
        swift_slowDealloc(v99, -1LL, -1LL);
      }

      else
      {
        swift_release_n(a2, 2LL);
      }

      uint64_t v39 = v177;
      uint64_t v37 = v171;
      goto LABEL_9;
    }

    if (v68 != (id)2)
    {
      if (v68 != (id)1)
      {
        swift_retain_n(a2, 2LL);
        v120 = v43;
        v121 = (os_log_s *)Logger.logObject.getter(v120);
        os_log_type_t v122 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v121, v122))
        {
          uint64_t v123 = swift_slowAlloc(22LL, -1LL);
          v176 = (void **)swift_slowAlloc(32LL, -1LL);
          aBlock = v176;
          *(_DWORD *)uint64_t v123 = v159;
          v170 = v120;
          v124 = v42;
          v125 = v17;
          uint64_t v126 = a2[5];
          unint64_t v127 = a2[6];
          swift_bridgeObjectRetain(v127);
          uint64_t v128 = v126;
          NSString v17 = v125;
          uint64_t v42 = v124;
          *(void *)(v123 + 4) = sub_100028CC4(v128, v127, (uint64_t *)&aBlock);
          swift_release_n(a2, 2LL);
          swift_bridgeObjectRelease(v127);
          *(_WORD *)(v123 + 12) = 2049;
          v120 = v170;
          *(void *)(v123 + 14) = [v170 state];

          _os_log_impl( (void *)&_mh_execute_header,  v121,  v122,  "Unknown asset state { assetType=%{private}s, state=%{private}ld }",  (uint8_t *)v123,  0x16u);
          v129 = v176;
          swift_arrayDestroy(v176, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v129, -1LL, -1LL);
          uint64_t v130 = v123;
          uint64_t v4 = v174;
          swift_slowDealloc(v130, -1LL, -1LL);
        }

        else
        {
          swift_release_n(a2, 2LL);
        }

        uint64_t v39 = v177;
        goto LABEL_9;
      }

      uint64_t v69 = v37;
      unsigned int v70 = [v43 nonUserInitiatedDownloadsAllowed];
      uint64_t v71 = v43;
      uint64_t v47 = v71;
      if (v70)
      {
        uint64_t v43 = v71;
        uint64_t v72 = (void **)Logger.logObject.getter(v43);
        int v73 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled((os_log_t)v72, (os_log_type_t)v73))
        {
          int v156 = v73;
          v170 = v72;
          v176 = v42;
          uint64_t v74 = swift_slowAlloc(32LL, -1LL);
          uint64_t v47 = (void **)swift_slowAlloc(96LL, -1LL);
          aBlock = v47;
          *(_DWORD *)uint64_t v74 = v165;
          id v75 = [v43 assetType];
          if (!v75) {
            goto LABEL_66;
          }
          uint64_t v76 = v75;
          uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v79 = v78;

          uint64_t v178 = sub_100028CC4(v77, v79, (uint64_t *)&aBlock);
          uint64_t v80 = p_aBlock;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, p_aBlock, v74 + 4, v74 + 12);

          swift_bridgeObjectRelease(v79);
          *(_WORD *)(v74 + 12) = 2081;
          id v81 = [v43 assetId];
          if (!v81) {
            goto LABEL_67;
          }
          v82 = v81;
          uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v85 = v84;

          uint64_t v178 = sub_100028CC4(v83, v85, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, v80, v74 + 14, v74 + 22);

          swift_bridgeObjectRelease(v85);
          *(_WORD *)(v74 + 22) = 2081;
          id v86 = [v43 assetServerUrl];
          if (!v86) {
            goto LABEL_68;
          }
          v87 = v86;
          v88 = v167;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v89 = v168;
          v90 = v157;
          uint64_t v35 = v174;
          (*(void (**)(char *, char *, uint64_t))(v168 + 32))(v157, v88, v174);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v89 + 56))(v90, 0LL, 1LL, v35);
          uint64_t v91 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v89 + 48))(v90, 1LL, v35);
          if ((_DWORD)v91 == 1) {
            goto LABEL_69;
          }
          uint64_t v92 = URL.absoluteString.getter(v91);
          unint64_t v94 = v93;
          (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v35);
          uint64_t v178 = sub_100028CC4(v92, v94, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, p_aBlock, v74 + 24, v74 + 32);

          swift_bridgeObjectRelease(v94);
          v95 = v170;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v170,  (os_log_type_t)v156,  "Downloading asset. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }",  (uint8_t *)v74,  0x20u);
          swift_arrayDestroy(v47, 3LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v47, -1LL, -1LL);
          swift_slowDealloc(v74, -1LL, -1LL);

          a2 = v169;
          uint64_t v35 = v166;
          uint64_t v69 = v171;
          NSString v17 = v173;
          uint64_t v42 = v176;
        }

        else
        {
        }

        v145 = (double *)swift_allocObject(&unk_10003D910, 40LL, 7LL);
        *((void *)v145 + 2) = a2;
        v145[3] = v67;
        *((void *)v145 + 4) = v43;
        v183 = sub_1000114B0;
        v184 = v145;
        aBlock = _NSConcreteStackBlock;
        uint64_t v180 = 1107296256LL;
        v181 = sub_100010BEC;
        v182 = &unk_10003D928;
        v146 = _Block_copy(&aBlock);
        v147 = v184;
        v148 = v43;
        swift_retain(a2);
        swift_release(v147);
        [v148 attachProgressCallBack:v146];
        _Block_release(v146);
        uint64_t v149 = a2[4];
        uint64_t v150 = swift_allocObject(&unk_10003D960, 32LL, 7LL);
        *(void *)(v150 + swift_weakDestroy(v0 + 16) = v148;
        *(void *)(v150 + 24) = a2;
        v183 = sub_1000114EC;
        v184 = (double *)v150;
        aBlock = _NSConcreteStackBlock;
        uint64_t v180 = 1107296256LL;
        v181 = sub_100011138;
        v182 = &unk_10003D978;
        v151 = _Block_copy(&aBlock);
        v152 = v184;
        v153 = v148;
        swift_retain(a2);
        swift_release(v152);
        [v153 startDownload:v149 then:v151];

        _Block_release(v151);
        uint64_t v39 = v177;
        uint64_t v4 = v174;
        goto LABEL_52;
      }

      uint64_t v131 = v35;
      uint64_t v35 = v4;
      v132 = (void *)Logger.logObject.getter(v71);
      os_log_type_t v133 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled((os_log_t)v132, v133))
      {

        uint64_t v39 = v177;
        uint64_t v4 = v35;
        NSString v17 = v173;
        uint64_t v35 = v131;
LABEL_52:
        uint64_t v37 = v69;
        goto LABEL_9;
      }

      uint64_t v134 = swift_slowAlloc(12LL, -1LL);
      v135 = (void **)swift_slowAlloc(32LL, -1LL);
      aBlock = v135;
      *(_DWORD *)uint64_t v134 = v162;
      id v136 = [v47 assetServerUrl];
      if (!v136) {
        goto LABEL_70;
      }
      v137 = v136;
      v176 = v42;
      v138 = v167;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v139 = v168;
      v140 = v158;
      (*(void (**)(char *, char *, uint64_t))(v168 + 32))(v158, v138, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v139 + 56))(v140, 0LL, 1LL, v35);
      uint64_t v141 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v139 + 48))(v140, 1LL, v35);
      if ((_DWORD)v141 == 1) {
        goto LABEL_71;
      }
      uint64_t v142 = URL.absoluteString.getter(v141);
      unint64_t v144 = v143;
      (*(void (**)(char *, uint64_t))(v139 + 8))(v140, v35);
      *(void *)(v134 + 4) = sub_100028CC4(v142, v144, (uint64_t *)&aBlock);

      swift_bridgeObjectRelease(v144);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v132,  v133,  "Cannot download asset, as nonUserInitiatedDownloadsAllowed is false. { url=%{private}s }",  (uint8_t *)v134,  0xCu);
      swift_arrayDestroy(v135, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v135, -1LL, -1LL);
      swift_slowDealloc(v134, -1LL, -1LL);

      uint64_t v37 = v171;
      uint64_t v39 = v177;
      uint64_t v4 = v35;
      uint64_t v35 = v166;
      goto LABEL_44;
    }

    uint64_t v106 = v35;
    uint64_t v35 = v43;
    v107 = (os_log_s *)Logger.logObject.getter(v35);
    uint64_t v108 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v107, (os_log_type_t)v108))
    {
      uint64_t v47 = (void **)v108;
      v176 = v42;
      uint64_t v43 = (void **)swift_slowAlloc(12LL, -1LL);
      v109 = (void **)swift_slowAlloc(32LL, -1LL);
      aBlock = v109;
      *(_DWORD *)uint64_t v43 = v162;
      id v110 = [(id)v35 getLocalUrl];
      if (!v110) {
        goto LABEL_64;
      }
      v111 = v110;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v112 = v168;
      v113 = *(void (**)(void))(v168 + 32);
      v114 = v161;
      v113();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v112 + 56))(v114, 0LL, 1LL, v4);
      v115 = v160;
      ((void (*)(char *, char *, uint64_t))v113)(v160, v114, v4);
      unint64_t v116 = sub_10001143C();
      uint64_t v117 = dispatch thunk of CustomStringConvertible.description.getter(v4, v116);
      unint64_t v119 = v118;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v115, v4);
      *(void **)((char *)v43 + 4) = (void *)sub_100028CC4(v117, v119, (uint64_t *)&aBlock);

      swift_bridgeObjectRelease(v119);
      _os_log_impl( (void *)&_mh_execute_header,  v107,  (os_log_type_t)v47,  "Installed { assetType=%{private}s }",  (uint8_t *)v43,  0xCu);
      swift_arrayDestroy(v109, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v109, -1LL, -1LL);
      swift_slowDealloc(v43, -1LL, -1LL);

      uint64_t v35 = v166;
      uint64_t v37 = v171;
      uint64_t v39 = v177;
LABEL_44:
      NSString v17 = v173;
      uint64_t v42 = v176;
      a2 = v169;
      goto LABEL_9;
    }

    uint64_t v39 = v177;
    NSString v17 = v173;
    uint64_t v35 = v106;
LABEL_9:
    uint64_t v38 = v39 + 1;
  }

  __break(1u);
LABEL_61:

  __break(1u);
LABEL_62:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v164, 1LL, 1LL, v174);
  __break(1u);
LABEL_63:

  __break(1u);
LABEL_64:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v161, 1LL, 1LL, v4);
  __break(1u);
LABEL_65:

  __break(1u);
LABEL_66:

  __break(1u);
LABEL_67:

  __break(1u);
LABEL_68:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v157, 1LL, 1LL, v174);
  __break(1u);
LABEL_69:

  __break(1u);
LABEL_70:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v158, 1LL, 1LL, v35);
  __break(1u);
LABEL_71:

  __break(1u);
LABEL_72:
  __break(1u);
}

void sub_10001073C(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005EA4(&qword_100041840);
  uint64_t v11 = __chkstk_darwin();
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1)
  {
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v28 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v28, "Progress callback, but nil update object.", v29, 2u);
      swift_slowDealloc(v29, -1LL, -1LL);
    }

    goto LABEL_13;
  }

  uint64_t v33 = a1;
  id v14 = a4;
  uint64_t v15 = (void *)Logger.logObject.getter(v14);
  uint64_t v16 = (uint64_t *)static os_log_type_t.debug.getter();
  if (!os_log_type_enabled((os_log_t)v15, (os_log_type_t)v16))
  {

LABEL_13:
    return;
  }

  uint64_t v17 = swift_slowAlloc(52LL, -1LL);
  uint64_t v18 = swift_slowAlloc(32LL, -1LL);
  uint64_t v35 = v18;
  *(_DWORD *)uint64_t v17 = 134219011;
  uint64_t v19 = v17 + 4;
  double v20 = static Double.now()() - a2;
  if ((~*(void *)&v20 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (v20 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if (v20 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v31 = v18;
  int v32 = (int)v16;
  id v34 = (id)(uint64_t)v20;
  uint64_t v16 = &v35;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v17 + 4, v17 + 12);
  LOWORD(v18) = 2048;
  *(_WORD *)(v17 + 12) = 2048;
  uint64_t v19 = v17 + 14;
  if (qword_100041620 != -1) {
LABEL_17:
  }
    swift_once(&qword_100041620, sub_100011174);
  id v34 = (id)qword_100041838;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v16, v19, v17 + 22);
  *(_WORD *)(v17 + 22) = v18;
  id v34 = -[os_log_s totalWritten](v33, "totalWritten");
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v16, v17 + 24, v17 + 32);
  *(_WORD *)(v17 + 32) = v18;
  id v21 = -[os_log_s totalExpected](v33, "totalExpected");

  id v34 = v21;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v16, v17 + 34, v17 + 42);

  *(_WORD *)(v17 + 42) = 2081;
  id v22 = [v14 assetServerUrl];
  if (v22)
  {
    uint64_t v23 = v22;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0LL, 1LL, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1LL, v7) != 1)
    {
      uint64_t v24 = URL.absoluteString.getter();
      unint64_t v26 = v25;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      id v34 = (id)sub_100028CC4(v24, v26, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v17 + 44, v17 + 52);

      swift_bridgeObjectRelease(v26);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  (os_log_type_t)v32,  "Progress callback. { runningTime=%ld, timeout=%ld, totalWritten=%lld, totalExpected=%lld, url=%{private}s }",  (uint8_t *)v17,  0x34u);
      uint64_t v27 = v31;
      swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);

      return;
    }
  }

  else
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1LL, 1LL, v7);
    __break(1u);
  }

  __break(1u);
}

void sub_100010BEC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

void sub_100010C40(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100010FA0(a2);
  unint64_t v12 = v10;
  if (a1)
  {
    static Logger.mobileAsset.getter();
    uint64_t v13 = swift_bridgeObjectRetain(v12);
    id v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc(22LL, -1LL);
      uint64_t v31 = swift_slowAlloc(64LL, -1LL);
      uint64_t v33 = v31;
      *(_DWORD *)uint64_t v16 = 136380931;
      swift_bridgeObjectRetain(v12);
      uint64_t v32 = sub_100028CC4(v11, v12, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease_n(v12, 3LL);
      *(_WORD *)(v16 + 12) = 2081;
      uint64_t v32 = a1;
      type metadata accessor for MADownloadResult(0LL);
      uint64_t v18 = String.init<A>(describing:)(&v32, v17);
      unint64_t v20 = v19;
      uint64_t v32 = sub_100028CC4(v18, v19, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v16 + 14, v16 + 22);
      swift_bridgeObjectRelease(v20);
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Download failed. { url=%{private}s, result=%{private}s }",  (uint8_t *)v16,  0x16u);
      uint64_t v21 = v31;
      swift_arrayDestroy(v31, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  else
  {
    uint64_t v22 = swift_bridgeObjectRetain(v10);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    uint64_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, (os_log_type_t)v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v26 = swift_slowAlloc(32LL, -1LL);
      uint64_t v33 = v26;
      *(_DWORD *)unint64_t v25 = 136380675;
      swift_bridgeObjectRetain(v12);
      uint64_t v32 = sub_100028CC4(v11, v12, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v12, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v23,  (os_log_type_t)v24,  "Downloaded asset. Calling downloadedCallback. { url=%{private}s }",  v25,  0xCu);
      swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    uint64_t v27 = *(void (**)(uint64_t))(a3 + 16);
    if (v27)
    {
      uint64_t v28 = *(void *)(a3 + 24);
      uint64_t v29 = swift_retain(v28);
      v27(v29);
      sub_100011338((uint64_t)v27, v28);
    }
  }

uint64_t sub_100010FA0(void *a1)
{
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v17 - v9;
  id v11 = [a1 assetServerUrl];
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1LL, 1LL, v4);
    goto LABEL_5;
  }

  unint64_t v12 = v11;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0LL, 1LL, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1LL, v4) == 1)
  {
LABEL_5:
    sub_10000F1D4((uint64_t)v3);
    return 560753006LL;
  }

  uint64_t v14 = ((uint64_t (*)(char *, char *, uint64_t))v13)(v10, v3, v4);
  uint64_t v15 = URL.absoluteString.getter(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v15;
}

uint64_t sub_100011138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_100011174()
{
  double v0 = static Double.minutes(_:)(30.0);
  if ((~*(void *)&v0 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v0 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v0 < 9.22337204e18)
  {
    qword_100041838 = (uint64_t)v0;
    return;
  }

LABEL_7:
  __break(1u);
}

  uint64_t v13 = sub_1000329A8(v9, v10, a3);
  swift_bridgeObjectRelease(v8);
  return v13;
}

uint64_t MobileAssetsHandler.deinit()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return v0;
}

uint64_t MobileAssetsHandler.__deallocating_deinit()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000112AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EA4(&qword_100041840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000112F4()
{
  unint64_t result = qword_100041850;
  if (!qword_100041850)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100041850);
  }

  return result;
}

uint64_t sub_100011338(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100011348()
{
  return type metadata accessor for MobileAssetsHandler(0LL);
}

uint64_t type metadata accessor for MobileAssetsHandler(uint64_t a1)
{
  uint64_t result = qword_100041888;
  if (!qword_100041888) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MobileAssetsHandler);
  }
  return result;
}

uint64_t sub_10001138C(uint64_t a1)
{
  v4[0] = &unk_100035A08;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = &unk_100035A20;
  v4[3] = &unk_100035A20;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void sub_10001141C(uint64_t a1)
{
}

uint64_t sub_100011424(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011434(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10001143C()
{
  unint64_t result = qword_100041960;
  if (!qword_100041960)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100041960);
  }

  return result;
}

uint64_t sub_100011484()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1000114B0(void *a1)
{
}

uint64_t sub_1000114C0()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000114EC(uint64_t a1)
{
}

id sub_1000114F4(void *a1)
{
  return sub_10000E758(a1, v1);
}

uint64_t sub_100011514()
{
  uint64_t v1 = sub_100005EA4(&qword_100041A80);
  __chkstk_darwin(v1);
  unint64_t v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v4 = type metadata accessor for Keys(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t Strong = swift_weakLoadStrong(v0 + 56);
  if (Strong)
  {
    uint64_t v9 = Strong;
    swift_beginAccess(Strong + 72, v16, 0LL, 0LL);
    unint64_t v10 = *(void *)(v9 + 72);
    swift_bridgeObjectRetain(v10);
    swift_release(v9);
  }

  else
  {
    unint64_t v10 = sub_1000057C0((uint64_t)_swiftEmptyArrayStorage);
  }

  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  Dictionary<>.subscript.getter(v7, v10);
  swift_bridgeObjectRelease(v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v11 = type metadata accessor for SimpleType(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1LL, v11) == 1)
  {
    sub_1000119E4((uint64_t)v3);
LABEL_9:
    uint64_t v13 = *(void *)(v0 + 16);
    swift_bridgeObjectRetain(*(void *)(v0 + 24));
    return v13;
  }

  if ((*(unsigned int (**)(char *, uint64_t))(v12 + 88))(v3, v11) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
    goto LABEL_9;
  }

  (*(void (**)(char *, uint64_t))(v12 + 96))(v3, v11);
  return *(void *)v3;
}

uint64_t sub_1000116E4()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for NonOwningSession()
{
  return objc_opt_self(&OBJC_CLASS____TtC15audioanalyticsd16NonOwningSession);
}

uint64_t sub_100011738()
{
  uint64_t Strong = swift_weakLoadStrong(*v0 + 56LL);
  if (!Strong) {
    return 0xFFFFLL;
  }
  uint64_t v2 = *(unsigned __int16 *)(Strong + 64);
  swift_release(Strong);
  return v2;
}

uint64_t sub_100011774(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong(*v1 + 56LL);
  if (result)
  {
    uint64_t v4 = result;
    sub_100028210(a1);
    *(_WORD *)(v4 + 64) = a1;
    return swift_release(v4);
  }

  return result;
}

uint64_t (*sub_1000117C0(uint64_t *a1))(uint64_t a1)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  unint64_t v3 = (__int16 *)(a1 + 1);
  uint64_t Strong = swift_weakLoadStrong(v2 + 56);
  if (Strong)
  {
    __int16 v5 = *(_WORD *)(Strong + 64);
    swift_release(Strong);
  }

  else
  {
    __int16 v5 = -1;
  }

  *unint64_t v3 = v5;
  return sub_100011810;
}

uint64_t sub_100011810(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int16 *)(a1 + 8);
  uint64_t result = swift_weakLoadStrong(*(void *)a1 + 56LL);
  if (result)
  {
    uint64_t v3 = result;
    sub_100028210(v1);
    *(_WORD *)(v3 + 64) = v1;
    return swift_release(v3);
  }

  return result;
}

uint64_t sub_10001185C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 24LL));
  return v1;
}

uint64_t sub_10001188C()
{
  return *(void *)(*(void *)v0 + 32LL);
}

uint64_t sub_100011898()
{
  return *(unsigned __int8 *)(*(void *)v0 + 40LL);
}

uint64_t sub_1000118A4()
{
  return sub_100011514();
}

unint64_t sub_1000118C4()
{
  uint64_t Strong = swift_weakLoadStrong(*v0 + 56LL);
  if (!Strong) {
    return sub_1000057C0((uint64_t)_swiftEmptyArrayStorage);
  }
  uint64_t v2 = Strong;
  swift_beginAccess(Strong + 72, v5, 0LL, 0LL);
  uint64_t v3 = *(void *)(v2 + 72);
  swift_bridgeObjectRetain(v3);
  swift_release(v2);
  return v3;
}

uint64_t sub_10001193C()
{
  return *(unsigned int *)(*(void *)v0 + 44LL);
}

uint64_t sub_100011948()
{
  return swift_retain(*(void *)(*(void *)v0 + 48LL));
}

uint64_t sub_100011954(unint64_t a1)
{
  uint64_t result = swift_weakLoadStrong(*v1 + 56LL);
  if (result)
  {
    uint64_t v4 = result;
    char v5 = sub_100022FC4(a1);
    swift_release(v4);
    return v5 & 1;
  }

  return result;
}

uint64_t sub_10001199C(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong(*v1 + 56LL);
  if (result)
  {
    uint64_t v4 = result;
    sub_100023CC8(a1);
    return swift_release(v4);
  }

  return result;
}

uint64_t sub_1000119E4(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4(&qword_100041A80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_100011A24(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005EA4(&qword_100041A98);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v39 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v38 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = &v44;
  uint64_t v8 = &v46;
  swift_bridgeObjectRetain(v1);
  int64_t i = 0LL;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1LL)) {
    goto LABEL_35;
  }
  if (v20 >= v38) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v39 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v38) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v39 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v38) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v39 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v38) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v39 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v38)
          {
            unint64_t v21 = *(void *)(v39 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1LL)) {
                goto LABEL_36;
              }
              if (v22 >= v38) {
                break;
              }
              unint64_t v21 = *(void *)(v39 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }

LABEL_32:
          sub_10000E404(v1);
          return;
        }
      }
    }
  }

          sub_10000E404(v1);
          return;
        }
      }
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100011D78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005EA4(&qword_100041A90);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_39:
  __break(1u);
  return result;
}

  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void sub_10001213C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005EA4(&qword_100041A98);
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
  swift_bridgeObjectRetain(v1);
  int64_t i = 0LL;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for String;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1LL)) {
    goto LABEL_35;
  }
  if (v20 >= v40) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v41 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v40) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v41 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v40) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v41 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v40) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v41 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v40)
          {
            unint64_t v21 = *(void *)(v41 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1LL)) {
                goto LABEL_36;
              }
              if (v22 >= v40) {
                break;
              }
              unint64_t v21 = *(void *)(v41 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }

void sub_1000124A4()
{
  qword_100042378 = (uint64_t)&_swiftEmptySetSingleton;
  word_100042380 = 0;
}

uint64_t static MessageRuleResult.__derived_struct_equals(_:_:)(uint64_t a1, __int16 a2, uint64_t a3, int a4)
{
  return sub_100012510(a1, a3) & (((a2 & 1) == 0) ^ a4) & (((a2 & 0x100) == 0) ^ ((unsigned __int16)(a4 & 0x100) >> 8));
}

uint64_t sub_100012510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v36 - v9;
  uint64_t result = __chkstk_darwin(v8);
  unint64_t v13 = (char *)&v36 - v12;
  if (a1 == a2) {
    return 1LL;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0LL;
  }
  int64_t v14 = 0LL;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v37 = a1;
  uint64_t v38 = a1 + 56;
  uint64_t v16 = 1LL << *(_BYTE *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1LL << v16);
  }
  else {
    uint64_t v17 = -1LL;
  }
  unint64_t v18 = v17 & v15;
  int64_t v39 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = a2 + 56;
  uint64_t v36 = (char *)&v36 - v12;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v24 = v43;
    uint64_t v25 = *(void *)(v43 + 72);
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    uint64_t v27 = *(void *)(a2 + 40);
    uint64_t v28 = sub_1000133E0(&qword_100041AA8, (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
    uint64_t v29 = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    uint64_t v30 = -1LL << *(_BYTE *)(a2 + 32);
    unint64_t v31 = v29 & ~v30;
    if (((*(void *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v31) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v4);
      return 0LL;
    }

    uint64_t v32 = ~v30;
    while (1)
    {
      v26(v7, *(void *)(a2 + 48) + v31 * v25, v4);
      uint64_t v33 = sub_1000133E0( (unint64_t *)&unk_100041AB0,  (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
      char v34 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v10, v4, v33);
      char v35 = *(void (**)(char *, uint64_t))(v43 + 8);
      v35(v7, v4);
      if ((v34 & 1) != 0) {
        break;
      }
      unint64_t v31 = (v31 + 1) & v32;
      if (((*(void *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v31) & 1) == 0)
      {
        v35(v10, v4);
        return 0LL;
      }
    }

    uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v10, v4);
    unint64_t v13 = v36;
    a1 = v37;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v20 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
      __break(1u);
      goto LABEL_35;
    }

    if (v20 >= v39) {
      return 1LL;
    }
    unint64_t v21 = *(void *)(v38 + 8 * v20);
    int64_t v22 = v14 + 1;
    if (!v21)
    {
      int64_t v22 = v20 + 1;
      if (v20 + 1 >= v39) {
        return 1LL;
      }
      unint64_t v21 = *(void *)(v38 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v20 + 2 >= v39) {
          return 1LL;
        }
        unint64_t v21 = *(void *)(v38 + 8 * v22);
        if (!v21)
        {
          int64_t v22 = v20 + 3;
          if (v20 + 3 >= v39) {
            return 1LL;
          }
          unint64_t v21 = *(void *)(v38 + 8 * v22);
          if (!v21) {
            break;
          }
        }
      }
    }

LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100012870(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 9);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 9);
  return sub_100012510(*(void *)a1, *(void *)a2) & ~(v2 ^ v4) & ~(v3 ^ v5) & 1;
}

uint64_t destroy for MessageRuleResult(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t _s15audioanalyticsd17MessageRuleResultVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for MessageRuleResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  return a1;
}

uint64_t initializeWithTake for MessageRuleResult(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t *assignWithTake for MessageRuleResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageRuleResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 10)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageRuleResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 10) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 10) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MessageRuleResult()
{
  return &type metadata for MessageRuleResult;
}

uint64_t sub_100012A4C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v92 = a4;
  uint64_t v86 = type metadata accessor for Message.Metadata(0LL);
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  unint64_t v84 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Message(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  int64_t v14 = (char *)&v82 - v13;
  __chkstk_darwin(v12);
  v105 = (char *)&v82 - v15;
  uint64_t v16 = type metadata accessor for RouterConfig(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v93 = (char *)&v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  int64_t v22 = (char *)&v82 - v21;
  uint64_t v23 = Config.routerConfigs.getter(v20);
  uint64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v91 = v11;
    uint64_t v104 = a2;
    unint64_t v25 = (*(unsigned __int8 *)(v17 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v83 = v23;
    unint64_t v26 = v23 + v25;
    uint64_t v87 = *(void *)(v17 + 72);
    uint64_t v90 = v17;
    uint64_t v27 = *(uint64_t (**)(char *, char *, uint64_t))(v17 + 16);
    __int128 v107 = xmmword_1000358D0;
    uint64_t v106 = v7;
    v88 = v14;
    uint64_t v103 = a3;
    uint64_t v89 = v8;
    uint64_t v102 = v27;
    while (1)
    {
      uint64_t v99 = v24;
      v27(v22, (char *)v26, v16);
      sub_100013290(a3, (uint64_t)v111);
      uint64_t v28 = v112;
      unint64_t v98 = v26;
      if (v112)
      {
        uint64_t v29 = v113;
        sub_100013314(v111, v112);
        unsigned __int16 v30 = dispatch thunk of SessionProtocol.serviceType.getter(v28, v29);
        sub_100013384(v111);
      }

      else
      {
        sub_10000E410((uint64_t)v111);
        unsigned __int16 v30 = 0;
      }

      int v31 = v28 == 0;
      uint64_t v32 = sub_100005EA4(&qword_100041A88);
      uint64_t v33 = swift_allocObject(v32, 72LL, 7LL);
      *(_OWORD *)(v33 + swift_weakDestroy(v0 + 16) = v107;
      *(void *)(v33 + swift_weakDestroy(v0 + 56) = v16;
      *(void *)(v33 + 64) = &protocol witness table for RouterConfig;
      char v34 = (char *)sub_1000132D8((void *)(v33 + 32));
      v27(v34, v22, v16);
      int v101 = static ConfigCommon.matches(audioServiceType:config:)(v30 | (v31 << 16), v33);
      swift_bridgeObjectRelease(v33);
      sub_100013290(a3, (uint64_t)v111);
      uint64_t v35 = v112;
      if (v112)
      {
        uint64_t v36 = v113;
        sub_100013314(v111, v112);
        uint64_t v35 = dispatch thunk of SessionProtocol.clientProcessName.getter(v35, v36);
        uint64_t v38 = v37;
        sub_100013384(v111);
      }

      else
      {
        sub_10000E410((uint64_t)v111);
        uint64_t v38 = 0LL;
      }

      uint64_t v39 = swift_allocObject(v32, 72LL, 7LL);
      *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = v107;
      *(void *)(v39 + swift_weakDestroy(v0 + 56) = v16;
      *(void *)(v39 + 64) = &protocol witness table for RouterConfig;
      uint64_t v40 = (char *)sub_1000132D8((void *)(v39 + 32));
      v27(v40, v22, v16);
      int v95 = static ConfigCommon.matches(sessionProcessName:config:)(v35, v38, v39);
      swift_bridgeObjectRelease(v39);
      swift_bridgeObjectRelease(v38);
      sub_100013290(a3, (uint64_t)v111);
      uint64_t v41 = v112;
      if (v112)
      {
        uint64_t v42 = v113;
        sub_100013314(v111, v112);
        uint64_t v41 = dispatch thunk of SessionProtocol.appName.getter(v41, v42);
        uint64_t v44 = v43;
        sub_100013384(v111);
      }

      else
      {
        sub_10000E410((uint64_t)v111);
        uint64_t v44 = 0LL;
      }

      uint64_t v45 = swift_allocObject(v32, 72LL, 7LL);
      *(_OWORD *)(v45 + swift_weakDestroy(v0 + 16) = v107;
      *(void *)(v45 + swift_weakDestroy(v0 + 56) = v16;
      *(void *)(v45 + 64) = &protocol witness table for RouterConfig;
      uint64_t v46 = (char *)sub_1000132D8((void *)(v45 + 32));
      v27(v46, v22, v16);
      int v94 = static ConfigCommon.matches(sessionAppName:config:)(v41, v44, v45);
      swift_bridgeObjectRelease(v45);
      uint64_t v47 = swift_bridgeObjectRelease(v44);
      int v48 = RouterConfig.audioEventType.getter(v47);
      uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
      uint64_t v51 = v104;
      uint64_t v50 = v105;
      uint64_t v52 = v106;
      uint64_t v53 = v49(v105, v104, v106);
      if ((v48 & 0x10000) != 0)
      {
        __int16 v54 = Message.type.getter(v53);
        uint64_t v50 = v105;
        LOWORD(v48) = v54;
      }

      uint64_t v55 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
      uint64_t v56 = v55(v50, v52);
      int v100 = Message.type.getter(v56);
      uint64_t v57 = RouterConfig.audioEventCategory.getter();
      uint64_t v58 = v49(v14, v51, v52);
      if ((v57 & 0x100000000LL) != 0) {
        LODWORD(v57) = Message.category.getter(v58);
      }
      uint64_t v59 = v55(v14, v52);
      int v97 = Message.category.getter(v59);
      uint64_t v60 = RouterConfig.predicate.getter();
      if (v60)
      {
        uint64_t v61 = (void *)v60;
        uint64_t v62 = Message.flattenToAnyDictionary()();
        uint64_t v63 = sub_100011D78(v62);
        swift_bridgeObjectRelease(v62);
        int v96 = static Predicate.evaluate(_:with:)(v61, v63);

        swift_bridgeObjectRelease(v63);
      }

      else
      {
        int v96 = 1;
      }

      uint64_t v64 = v90;
      unint64_t v65 = v93;
      sub_100013290(v103, (uint64_t)v111);
      if ((v92 & 1) != 0) {
        break;
      }
      sub_100013290((uint64_t)v111, (uint64_t)v108);
      uint64_t v68 = v109;
      if (v109)
      {
        uint64_t v69 = v110;
        sub_100013314(v108, v109);
        uint64_t v70 = v69;
        unint64_t v65 = v93;
        char v71 = dispatch thunk of SessionProtocol.isSingleMessageSession.getter(v68, v70);
        sub_10000E410((uint64_t)v111);
        sub_100013384(v108);
        uint64_t v66 = v102(v65, v22, v16);
        uint64_t v67 = v106;
        if ((v71 & 1) != 0) {
          goto LABEL_24;
        }
        char v72 = 0;
      }

      else
      {
        sub_10000E410((uint64_t)v111);
        sub_10000E410((uint64_t)v108);
        v102(v65, v22, v16);
        char v72 = 0;
        uint64_t v67 = v106;
      }

LABEL_43:
  swift_bridgeObjectRelease(v23);
  if (qword_100041628 != -1) {
    swift_once(&qword_100041628, sub_1000124A4);
  }
  uint64_t v80 = qword_100042378;
  swift_bridgeObjectRetain(qword_100042378);
  return v80;
}

  swift_bridgeObjectRetain(v11);
  uint64_t v47 = sub_10001C6F0(v15, v17, v22 & 1, v11);
  int v48 = sub_10000BE60(v88, 1LL, 0xD000000000000011LL, v87);
  swift_bridgeObjectRelease(v11);
  swift_release(v47);
  swift_release(v48);
  if (v48)
  {
    if (v40)
    {
      uint64_t v76 = __CocoaSet.endIndex.getter(v21);
      if ((v22 & 1) == 0) {
        goto LABEL_94;
      }
      goto LABEL_73;
    }

    if ((v22 & 1) != 0) {
      goto LABEL_94;
    }
    uint64_t v46 = *(_DWORD *)(v11 + 36);
    goto LABEL_77;
  }

  int v92 = v15;
  unint64_t v93 = v17;
  int v94 = v22 & 1;
  if (v40)
  {
    uint64_t v49 = __CocoaSet.endIndex.getter(v21);
    if ((v22 & 1) != 0)
    {
      uint64_t v51 = v49;
      uint64_t v52 = v50;
      uint64_t v53 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v49, v50);
      sub_10001DBC4(v51, v52, 1);
      if ((v53 & 1) == 0) {
        goto LABEL_53;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
  }

  else if ((v22 & 1) == 0)
  {
    if (*(_DWORD *)(v11 + 36) != (_DWORD)v17) {
      goto LABEL_84;
    }
    if (v15 != 1LL << *(_BYTE *)(v11 + 32))
    {
      while (1)
      {
LABEL_53:
        if (v40)
        {
          if ((v94 & 1) == 0) {
            goto LABEL_89;
          }
          if (__CocoaSet.Index.handleBitPattern.getter(v92, v93)) {
            __int16 v54 = swift_isUniquelyReferenced_nonNull_native();
          }
          else {
            __int16 v54 = 1LL;
          }
          uint64_t v62 = sub_100005EA4(&qword_100041BE8);
          uint64_t v63 = (void (*)(_BYTE *, void))Set.Index._asCocoa.modify(v91, v62);
          __CocoaSet.formIndex(after:isUnique:)(v64, v54, v21);
          v63(v91, 0LL);
          unint64_t v65 = v92;
          uint64_t v66 = v93;
          uint64_t v67 = v94;
          uint64_t v68 = __CocoaSet.endIndex.getter(v21);
          if ((v67 & 1) == 0) {
            goto LABEL_87;
          }
          uint64_t v70 = v68;
          char v71 = v69;
          char v72 = static __CocoaSet.Index.== infix(_:_:)(v65, v66, v68, v69);
          sub_10001DBC4(v70, v71, 1);
          uint64_t v15 = v92;
          uint64_t v17 = v93;
          int64_t v22 = v94;
          if ((v72 & 1) != 0) {
            goto LABEL_36;
          }
        }

        else
        {
          uint64_t v55 = v92;
          uint64_t v56 = v93;
          uint64_t v57 = v94;
          uint64_t v15 = sub_10001C60C(v92, v93, v94, v11);
          uint64_t v17 = v58;
          uint64_t v60 = v59;
          uint64_t v61 = v59 & 1;
          sub_10001DBC4(v55, v56, v57);
          int v92 = v15;
          unint64_t v93 = v17;
          int v94 = v61;
          uint64_t v40 = v89;
          if ((v60 & 1) != 0) {
            goto LABEL_87;
          }
          if (*(_DWORD *)(v11 + 36) != (_DWORD)v17)
          {
            __break(1u);
            goto LABEL_82;
          }

          int64_t v22 = 0;
          if (v15 == 1LL << *(_BYTE *)(v11 + 32)) {
            goto LABEL_36;
          }
        }

        swift_bridgeObjectRetain(v11);
        int v73 = sub_10001C6F0(v15, v17, v22, v11);
        swift_bridgeObjectRelease(v11);
        if (*(_DWORD *)(v73 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v90))
        {
          swift_release(v73);
          goto LABEL_36;
        }

        if (*(void *)(v73 + 24) == *(void *)(a2 + 24) && *(void *)(v73 + 32) == *(void *)(a2 + 32))
        {
          swift_release(v73);
        }

        else
        {
          id v75 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_release(v73);
          if ((v75 & 1) == 0) {
            goto LABEL_36;
          }
        }
      }
    }

    goto LABEL_82;
  }

    sub_10002BA58((void **)&v32, (const void **)&v31, &v30);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100013290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EA4(&qword_100041818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void *sub_1000132D8(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

void *sub_100013314(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100013338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100013374(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100013384(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000133A4()
{
  unint64_t result = qword_100041AA0;
  if (!qword_100041AA0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100041AA0);
  }

  return result;
}

uint64_t sub_1000133E0(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for Config.WorkerConfigs(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100013420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10001F3E0(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for FeatureState(0LL);
    uint64_t v10 = *(void *)(v9 - 8);
    sub_10001E188(v8 + *(void *)(v10 + 72) * v7, a3, type metadata accessor for FeatureState);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    uint64_t v12 = a3;
    uint64_t v13 = 0LL;
    uint64_t v14 = v9;
  }

  else
  {
    uint64_t v14 = type metadata accessor for FeatureState(0LL);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL);
    uint64_t v12 = a3;
    uint64_t v13 = 1LL;
  }

  return v11(v12, v13, 1LL, v14);
}

uint64_t sub_1000134C8(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001LL;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 >= 0) {
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t v3 = __CocoaSet.count.getter(a1);
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 16);
  }

  uint64_t result = (uint64_t)&_swiftEmptyArrayStorage;
  if (v3)
  {
    uint64_t v33 = &_swiftEmptyArrayStorage;
    sub_100029B58(0, v3 & ~(v3 >> 63), 0);
    if (v2)
    {
      if (v1 < 0) {
        uint64_t v5 = v1;
      }
      else {
        uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t result = __CocoaSet.startIndex.getter(v5);
      char v7 = 1;
    }

    else
    {
      uint64_t result = sub_10001C978(v1);
      char v7 = v8 & 1;
    }

    uint64_t v30 = result;
    uint64_t v31 = v6;
    char v32 = v7;
    if (v3 < 0)
    {
      __break(1u);
LABEL_31:
      __break(1u);
    }

    else
    {
      uint64_t v9 = v1 & 0xFFFFFFFFFFFFFF8LL;
      if (v1 < 0) {
        uint64_t v9 = v1;
      }
      uint64_t v28 = v9;
      do
      {
        while (1)
        {
          int64_t v16 = v30;
          uint64_t v15 = v31;
          char v17 = v32;
          uint64_t v18 = sub_10001C6F0(v30, v31, v32, v1);
          uint64_t v19 = *(void *)(v18 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
          swift_release(v18);
          uint64_t v20 = v33;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native(v33);
          if ((result & 1) == 0)
          {
            uint64_t result = sub_100029B58(0, v20[2] + 1LL, 1);
            uint64_t v20 = v33;
          }

          unint64_t v22 = v20[2];
          unint64_t v21 = v20[3];
          if (v22 >= v21 >> 1)
          {
            uint64_t result = sub_100029B58(v21 > 1, v22 + 1, 1);
            uint64_t v20 = v33;
          }

          v20[2] = v22 + 1;
          v20[v22 + 4] = v19;
          if (v2) {
            break;
          }
          int64_t v10 = sub_10001C60C(v16, v15, v17, v1);
          uint64_t v12 = v11;
          char v14 = v13;
          sub_10001DBC4(v16, v15, v17);
          uint64_t v30 = v10;
          uint64_t v31 = v12;
          char v32 = v14 & 1;
          if (!--v3) {
            goto LABEL_28;
          }
        }

        if ((v17 & 1) == 0) {
          goto LABEL_31;
        }
        uint64_t v23 = __CocoaSet.Index.handleBitPattern.getter(v16, v15);
        if (v23) {
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v23);
        }
        else {
          uint64_t isUniquelyReferenced_nonNull_native = 1LL;
        }
        uint64_t v25 = sub_100005EA4(&qword_100041BE8);
        unint64_t v26 = (void (*)(_BYTE *, void))Set.Index._asCocoa.modify(v29, v25);
        __CocoaSet.formIndex(after:isUnique:)(v27, isUniquelyReferenced_nonNull_native, v28);
        v26(v29, 0LL);
        --v3;
      }

      while (v3);
LABEL_28:
      sub_10001DBC4(v30, v31, v32);
      return (uint64_t)v33;
    }
  }

  return result;
}

char *sub_100013718(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v149 = a1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_systemMonitor] = 0LL;
  uint64_t v148 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v146 = sub_10001DC24(0LL, (unint64_t *)&qword_100041650, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v3 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v151 = *(void *)(*(void *)(v3 - 8) + 64LL);
  __chkstk_darwin(v3);
  unint64_t v150 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = (char *)&v138 - v150;
  v147 = v1;
  static DispatchQoS.default.getter();
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  v152 = *(char **)(*(void *)(v6 - 8) + 64LL);
  __chkstk_darwin(v6);
  unint64_t v145 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  char v8 = (char *)&v138 - v145;
  v156[0] = _swiftEmptyArrayStorage;
  uint64_t v10 = sub_1000061B8( (unint64_t *)&unk_100041C10,  v9,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v155 = v10;
  uint64_t v11 = sub_100005EA4(&qword_100041658);
  id v154 = (id)v11;
  uint64_t v153 = sub_10001DC5C((unint64_t *)&qword_100041C20, &qword_100041658);
  dispatch thunk of SetAlgebra.init<A>(_:)(v156, v11, v153, v6, v10);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v141 = v12;
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v142 = v14;
  unint64_t v143 = v15;
  uint64_t v16 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v140 = *(void (**)(char *, void))(v17 + 104);
  unsigned int v144 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v140((char *)&v138 - v15, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  uint64_t v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000030LL,  0x8000000100036D30LL,  v5,  v8,  (char *)&v138 - v15,  0LL);
  *(void *)&v2[v148] = v18;
  uint64_t v19 = OBJC_IVAR____TtC15audioanalyticsd6Server_mobileAssetsQueue;
  uint64_t v20 = __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v138 - v150;
  uint64_t v22 = static DispatchQoS.background.getter(v20);
  __chkstk_darwin(v22);
  unint64_t v23 = v145;
  v156[0] = _swiftEmptyArrayStorage;
  uint64_t v24 = dispatch thunk of SetAlgebra.init<A>(_:)(v156, v154, v153, v6, v155);
  __chkstk_darwin(v24);
  uint64_t v25 = (char *)&v138 - v15;
  unint64_t v26 = (char *)&v138 - v15;
  uint64_t v28 = (void (*)(char *, void, uint64_t))v140;
  uint64_t v27 = v141;
  ((void (*)(char *, uint64_t, uint64_t))v140)(v26, v16, v141);
  uint64_t v29 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002ALL,  0x8000000100036D70LL,  v21,  (char *)&v138 - v23,  v25,  0LL);
  uint64_t v148 = v19;
  uint64_t v30 = v147;
  *(void *)&v147[v19] = v29;
  *(void *)&v30[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances] = &_swiftEmptySetSingleton;
  *(void *)&v30[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections] = &_swiftEmptySetSingleton;
  *(void *)&v30[OBJC_IVAR____TtC15audioanalyticsd6Server_activeReporterIDs] = &_swiftEmptySetSingleton;
  uint64_t v31 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue;
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v138 - v150;
  uint64_t v34 = static DispatchQoS.unspecified.getter(v32);
  uint64_t v35 = v30;
  __chkstk_darwin(v34);
  v156[0] = _swiftEmptyArrayStorage;
  uint64_t v36 = dispatch thunk of SetAlgebra.init<A>(_:)(v156, v154, v153, v6, v155);
  __chkstk_darwin(v36);
  uint64_t v37 = (char *)&v138 - v143;
  v28((char *)&v138 - v143, v144, v27);
  *(void *)&v35[v31] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000031LL,  0x8000000100036DA0LL,  v33,  (char *)&v138 - v23,  v37,  0LL);
  uint64_t v38 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency;
  uint64_t v39 = static Double.seconds(_:)(10.0);
  *(void *)&v35[v38] = v40;
  uint64_t v41 = static Logger.service.getter(v39);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v43 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Starting Server.", v44, 2u);
    swift_slowDealloc(v44, -1LL, -1LL);
  }

  uint64_t v45 = v149;
  if (v149)
  {
    id v46 = v149;
  }

  else
  {
    static Constants.machServiceName.getter();
    uint64_t v48 = v47;
    id v49 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
    NSString v50 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v48);
    id v46 = [v49 initWithMachServiceName:v50];
  }

  uint64_t v51 = v148;
  *(void *)&v35[OBJC_IVAR____TtC15audioanalyticsd6Server_listener] = v46;
  uint64_t v52 = *(void **)&v35[v51];
  uint64_t v53 = type metadata accessor for MobileAssetsHandler(0LL);
  swift_allocObject(v53, *(unsigned int *)(v53 + 48), *(unsigned __int16 *)(v53 + 52));
  id v54 = v52;
  id v55 = v45;
  uint64_t v56 = sub_10000E4F0(v54);
  Swift::String_optional v57 = MobileAssetsHandler.getMobileAssetsConfigPath()();
  if (!v57.value._object)
  {
    uint64_t v59 = _swiftEmptyArrayStorage;
    if ((static DeviceUtilities.isInternalBuild.getter(v57.value._countAndFlagsBits) & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }

  uint64_t v58 = sub_100028734(0LL, 1LL, 1, _swiftEmptyArrayStorage);
  uint64_t v59 = v58;
  unint64_t v61 = v58[2];
  unint64_t v60 = v58[3];
  if (v61 >= v60 >> 1)
  {
    uint64_t v58 = sub_100028734((void *)(v60 > 1), v61 + 1, 1, v58);
    uint64_t v59 = v58;
  }

  v59[2] = v61 + 1;
  *(Swift::String_optional *)&v59[2 * v61 + 4] = v57;
  if ((static DeviceUtilities.isInternalBuild.getter(v58) & 1) != 0)
  {
LABEL_12:
    type metadata accessor for Config(0LL);
    uint64_t v62 = static Config.assetConfigPath.getter();
    uint64_t v64 = v63;
    if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
      uint64_t v59 = sub_100028734(0LL, v59[2] + 1LL, 1, v59);
    }
    unint64_t v66 = v59[2];
    unint64_t v65 = v59[3];
    if (v66 >= v65 >> 1) {
      uint64_t v59 = sub_100028734((void *)(v65 > 1), v66 + 1, 1, v59);
    }
    v59[2] = v66 + 1;
    uint64_t v67 = &v59[2 * v66];
    v67[4] = v62;
    v67[5] = v64;
  }

LABEL_17:
  swift_bridgeObjectRetain(v59);
  uint64_t v69 = sub_10001CCE4(v68);
  swift_bridgeObjectRelease(v59);
  if (!v69)
  {
    uint64_t v129 = type metadata accessor for Logger(0LL);
    uint64_t v130 = *(void *)(v129 - 8);
    uint64_t v131 = __chkstk_darwin(v129);
    os_log_type_t v133 = (char *)&v138 - ((v132 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v134 = static Logger.config.getter(v131);
    v135 = (os_log_s *)Logger.logObject.getter(v134);
    os_log_type_t v136 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v135, v136))
    {
      v137 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v137 = 0;
      _os_log_impl((void *)&_mh_execute_header, v135, v136, "Failed to find a config! Exiting.", v137, 2u);
      swift_slowDealloc(v137, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v130 + 8))(v133, v129);
    exit(-1);
  }

  swift_bridgeObjectRelease(v59);
  uint64_t v70 = OBJC_IVAR____TtC15audioanalyticsd6Server_config;
  *(void *)&v35[OBJC_IVAR____TtC15audioanalyticsd6Server_config] = v69;
  type metadata accessor for Config(0LL);
  uint64_t v71 = swift_retain(v69);
  uint64_t v72 = Config.sortableConfigVersion.getter(v71);
  static Config.configVersion.setter(v72);
  uint64_t v73 = qword_100041630;
  swift_retain(v69);
  if (v73 != -1) {
    swift_once(&qword_100041630, sub_1000337FC);
  }
  Config.updateNeededPreviousFields(workers:)((Swift::OpaquePointer)qword_100042390);
  uint64_t v155 = v69;
  uint64_t v74 = swift_release(v69);
  id v75 = (void **)static Constants.unknownReporterID.getter(v74);
  id v76 = [objc_allocWithZone(NSProcessInfo) init];
  int v77 = [v76 processIdentifier];

  uint64_t v78 = *(void *)&v35[v70];
  uint64_t v79 = type metadata accessor for Session(0LL);
  swift_allocObject(v79, *(unsigned int *)(v79 + 48), *(unsigned __int16 *)(v79 + 52));
  swift_retain(v78);
  *(void *)&v35[OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession] = sub_1000241D0( v75,  v77,  0xD000000000000014LL,  0x8000000100036C70LL,  v78,  1);

  v157.receiver = v35;
  v157.super_class = ObjectType;
  uint64_t v80 = (char *)objc_msgSendSuper2(&v157, "init");
  sub_10001433C();
  uint64_t v81 = OBJC_IVAR____TtC15audioanalyticsd6Server_config;
  uint64_t v82 = *(void *)&v80[OBJC_IVAR____TtC15audioanalyticsd6Server_config];
  swift_beginAccess(&static SystemMonitor.shared, v156, 1LL, 0LL);
  uint64_t v83 = static SystemMonitor.shared;
  if (static SystemMonitor.shared)
  {
    unint64_t v84 = v80;
    swift_retain(v82);
    uint64_t v85 = swift_retain(v83);
    sub_10002E43C(v85);
    swift_release(v83);
  }

  else
  {
    uint64_t v86 = v80;
    swift_retain(v82);
  }

  uint64_t v87 = type metadata accessor for SystemMonitor(0LL);
  v88 = (void *)swift_allocObject(v87, *(unsigned int *)(v87 + 48), *(unsigned __int16 *)(v87 + 52));
  uint64_t v89 = v80;
  uint64_t v90 = swift_retain(v82);
  uint64_t v91 = sub_10001BBB4(v90, v89, v88);
  uint64_t v92 = static SystemMonitor.shared;
  static SystemMonitor.shared = (uint64_t)v91;
  swift_release(v82);

  swift_release(v92);
  type metadata accessor for TailspinWorker(0LL);
  uint64_t v93 = *(void *)&v80[v81];
  uint64_t v94 = swift_retain(v93);
  static TailspinWorker.initialize(config:)(v94);
  swift_release(v93);
  if (&type metadata accessor for ABCManager) {
    BOOL v95 = &type metadata for ABCManager == 0LL;
  }
  else {
    BOOL v95 = 1;
  }
  if (!v95 && &nominal type descriptor for ABCManager != 0LL && &metaclass for ABCManager != 0LL)
  {
    type metadata accessor for ABCManager(0LL);
    uint64_t v98 = *(void *)&v80[v81];
    uint64_t v99 = swift_retain(v98);
    static ABCManager.initialize(config:)(v99);
    swift_release(v98);
  }

  id v154 = v55;
  int v100 = *(void **)&v89[OBJC_IVAR____TtC15audioanalyticsd6Server_listener];
  [v100 setDelegate:v89];
  [v100 activate];
  uint64_t v101 = swift_allocObject(&unk_10003DDD0, 24LL, 7LL);
  *(void *)(v101 + swift_weakDestroy(v0 + 16) = v89;
  uint64_t v102 = v56[2];
  uint64_t v103 = v56[3];
  v56[2] = sub_10001DC9C;
  v56[3] = v101;
  uint64_t v153 = (uint64_t)v56;
  uint64_t v104 = v89;
  uint64_t v105 = sub_100011338(v102, v103);
  v152 = &v104[OBJC_IVAR____TtC15audioanalyticsd6Server_logger];
  uint64_t v106 = (os_log_s *)Logger.logObject.getter(v105);
  os_log_type_t v107 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v106, v107))
  {
    uint64_t v108 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v108 = 0;
    _os_log_impl((void *)&_mh_execute_header, v106, v107, "Server created", v108, 2u);
    swift_slowDealloc(v108, -1LL, -1LL);
  }

  uint64_t v109 = type metadata accessor for ServerConfig(0LL);
  uint64_t v110 = *(void *)(v109 - 8);
  uint64_t v111 = *(void *)(v110 + 64);
  uint64_t v112 = __chkstk_darwin(v109);
  unint64_t v113 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v114 = Config.serverConfig.getter(v112);
  char v115 = ServerConfig.monitorClientConnections.getter(v114);
  unint64_t v116 = *(uint64_t (**)(char *, uint64_t))(v110 + 8);
  uint64_t v117 = v116((char *)&v138 - v113, v109);
  if ((v115 & 1) != 0) {
    uint64_t v117 = sub_10001481C();
  }
  uint64_t v118 = __chkstk_darwin(v117);
  uint64_t v119 = Config.serverConfig.getter(v118);
  double v120 = COERCE_DOUBLE(ServerConfig.osTransactionTimeout.getter(v119));
  char v122 = v121;
  uint64_t v123 = v116((char *)&v138 - v113, v109);
  if ((v122 & 1) != 0)
  {
    v124 = (os_log_s *)Logger.logObject.getter(v123);
    os_log_type_t v125 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v124, v125))
    {
      uint64_t v126 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v126 = 0;
      _os_log_impl((void *)&_mh_execute_header, v124, v125, "No osTransactionTimeout found!", v126, 2u);
      swift_slowDealloc(v126, -1LL, -1LL);
    }

    swift_release(v153);
  }

  else
  {
    sub_100014AC0(v120);
    swift_release(v153);
  }

  unint64_t v127 = v154;
  swift_release(v155);

  return v104;
}

    swift_bridgeObjectRelease(v3);
    return 0LL;
  }

  Hasher.init(_seed:)(v25, *(void *)(v3 + 40));
  char v8 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v8);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v10);
  String.hash(into:)(v25, v9, v10);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = Hasher._finalize()();
  uint64_t v12 = -1LL << *(_BYTE *)(v3 + 32);
  uint64_t v13 = v11 & ~v12;
  if (((*(void *)(v3 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v14 = ~v12;
  unint64_t v15 = *(void *)(v3 + 48);
  uint64_t v16 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v17 = *(void *)(v15 + 8 * v13);
    if (*(_DWORD *)(v17 + v16) == v8) {
      break;
    }
LABEL_9:
    uint64_t v13 = (v13 + 1) & v14;
    if (((*(void *)(v3 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
      goto LABEL_17;
    }
  }

  uint64_t v18 = *(void *)(v17 + 24);
  uint64_t v19 = *(void *)(v17 + 32);
  uint64_t v20 = v18 == v9 && v19 == v10;
  if (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v19) & 1) == 0)
  {
    uint64_t v16 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_9;
  }

  swift_bridgeObjectRelease(v3);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  unint64_t v23 = *v1;
  v25[0] = *v1;
  *uint64_t v1 = 0x8000000000000000LL;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_10001A748();
    unint64_t v23 = v25[0];
  }

  uint64_t v7 = *(void *)(*(void *)(v23 + 48) + 8 * v13);
  sub_10001B72C(v13);
  uint64_t v24 = *v1;
  *uint64_t v1 = v25[0];
  swift_bridgeObjectRelease(v24);
  return v7;
}

void sub_10001433C()
{
  id v1 = [objc_allocWithZone((Class)CLISignalHandler) initWithSignal:15];
  uint64_t v2 = swift_allocObject(&unk_10003E070, 24LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v0;
  v9[4] = sub_10001E294;
  uint64_t v10 = v2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_100011138;
  v9[3] = &unk_10003E088;
  uint64_t v3 = _Block_copy(v9);
  uint64_t v4 = v10;
  id v5 = v0;
  swift_release(v4);
  [v1 setExecutionBlock:v3];
  _Block_release(v3);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter([v1 setEnabled:1]);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    char v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Listening for SIGTERM.", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }
}

uint64_t sub_1000144A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = a2;
  uint64_t v38 = a1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4);
  os_log_type_t v43 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  __chkstk_darwin(v6);
  uint64_t v40 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (void *)((char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v39 = type metadata accessor for DispatchTime(0LL);
  uint64_t v12 = *(void *)(v39 - 8);
  uint64_t v13 = __chkstk_darwin(v39);
  unint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)v36 - v17;
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Scheduling server exit.", v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  v36[1] = *(void *)&v3[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  static DispatchTime.now()();
  *uint64_t v11 = 1LL;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))( v11,  enum case for DispatchTimeInterval.seconds(_:),  v8);
  + infix(_:_:)(v15, v11);
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  unint64_t v23 = v15;
  uint64_t v24 = v39;
  v22(v23, v39);
  uint64_t v25 = (void *)swift_allocObject(&unk_10003DEE8, 48LL, 7LL);
  uint64_t v26 = v37;
  v25[2] = v3;
  v25[3] = v26;
  v25[4] = v38;
  v25[5] = 1LL;
  aBlock[4] = sub_10001DD68;
  uint64_t v48 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003DF00;
  uint64_t v27 = _Block_copy(aBlock);
  uint64_t v28 = v3;
  uint64_t v29 = v40;
  static DispatchQoS.unspecified.getter(v28);
  id v46 = &_swiftEmptyArrayStorage;
  uint64_t v30 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v31 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v32 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  uint64_t v33 = v43;
  uint64_t v34 = v45;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v46, v31, v32, v45, v30);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v18, v29, v33, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v42);
  v22(v18, v24);
  return swift_release(v48);
}

uint64_t sub_10001481C()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v27 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchTime(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v23 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue);
  static DispatchTime.now()(v12);
  + infix(_:_:)(v11, *(double *)(v0 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency));
  uint64_t v24 = *(void (**)(char *, uint64_t))(v8 + 8);
  v24(v11, v7);
  uint64_t v15 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
  swift_unknownObjectWeakInit(v15 + 16, v0);
  aBlock[4] = sub_10001DCC4;
  uint64_t v30 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003DDE8;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = swift_retain(v15);
  static DispatchQoS.unspecified.getter(v17);
  uint64_t v28 = &_swiftEmptyArrayStorage;
  uint64_t v18 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v19 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v20 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v19, v20, v1, v18);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v14, v6, v3, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
  v24(v14, v7);
  uint64_t v21 = v30;
  swift_release(v15);
  return swift_release(v21);
}

uint64_t sub_100014AC0(double a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v30 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchTime(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v26 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue);
  static DispatchTime.now()(v14);
  + infix(_:_:)(v13, *(double *)(v1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency));
  uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  v27(v13, v9);
  uint64_t v17 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
  swift_unknownObjectWeakInit(v17 + 16, v1);
  uint64_t v18 = swift_allocObject(&unk_10003DE48, 32LL, 7LL);
  *(void *)(v18 + swift_weakDestroy(v0 + 16) = v17;
  *(double *)(v18 + 24) = a1;
  aBlock[4] = sub_10001DD2C;
  uint64_t v33 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003DE60;
  uint64_t v19 = _Block_copy(aBlock);
  uint64_t v20 = swift_retain(v17);
  static DispatchQoS.unspecified.getter(v20);
  uint64_t v31 = &_swiftEmptyArrayStorage;
  uint64_t v21 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v22 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v23 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v22, v23, v3, v21);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v8, v5, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
  v27(v16, v9);
  uint64_t v24 = v33;
  swift_release(v17);
  return swift_release(v24);
}

uint64_t sub_100014D8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v28 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Message(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v25[1] = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v14 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
  swift_unknownObjectWeakInit(v14 + 16, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  uint64_t v15 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v16 = (v15 + 24) & ~v15;
  uint64_t v17 = swift_allocObject(&unk_10003E020, v16 + v12, v15 | 7);
  *(void *)(v17 + swift_weakDestroy(v0 + 16) = v14;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v17 + v16, v13, v10);
  aBlock[4] = sub_10001E240;
  uint64_t v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003E038;
  uint64_t v18 = _Block_copy(aBlock);
  uint64_t v19 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v19);
  uint64_t v29 = _swiftEmptyArrayStorage;
  uint64_t v20 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v21 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v22 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v4, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v6, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  uint64_t v23 = v31;
  swift_release(v14);
  return swift_release(v23);
}

void sub_100015020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  a1 += 16LL;
  swift_beginAccess(a1, v15, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    sub_100015150(a2);
  }

  else
  {
    uint64_t v10 = static Logger.service.getter();
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Server is gone. {action=broadcast}", v13, 2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

void sub_100015150(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Message(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v58 - v9;
  uint64_t v11 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (void *)((char *)v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  id v16 = v15;
  LOBYTE(v15) = _dispatchPreconditionTest(_:)(v14);
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  uint64_t v63 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v63(v10, a1, v4);
  unint64_t v65 = v10;
  uint64_t v17 = (void (*)(void *, void))Message.metadata.modify(aBlock);
  Message.Metadata.isBroadcast.setter(1LL);
  v17(aBlock, 0LL);
  uint64_t v18 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v69, 0LL, 0LL);
  uint64_t v19 = *v18;
  BOOL v20 = (*v18 & 0xC000000000000001LL) == 0;
  uint64_t v64 = v5;
  if (v20)
  {
    uint64_t v29 = -1LL << *(_BYTE *)(v19 + 32);
    uint64_t v30 = *(void *)(v19 + 56);
    uint64_t v62 = v19 + 56;
    uint64_t v31 = ~v29;
    uint64_t v32 = -v29;
    if (v32 < 64) {
      uint64_t v33 = ~(-1LL << v32);
    }
    else {
      uint64_t v33 = -1LL;
    }
    unint64_t v28 = v33 & v30;
    swift_bridgeObjectRetain(v19);
    uint64_t v26 = v31;
    uint64_t v27 = 0LL;
  }

  else
  {
    if (v19 < 0) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = v19 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v19);
    uint64_t v22 = __CocoaSet.makeIterator()(v21);
    uint64_t v23 = type metadata accessor for ClientServerInstance(0LL);
    uint64_t v24 = sub_1000061B8( (unint64_t *)&unk_100041C00,  type metadata accessor for ClientServerInstance,  (uint64_t)&unk_100035978);
    uint64_t v25 = Set.Iterator.init(_cocoa:)(v70, v22, v23, v24);
    uint64_t v19 = v70[0];
    uint64_t v62 = v70[1];
    uint64_t v26 = v70[2];
    uint64_t v27 = v70[3];
    unint64_t v28 = v70[4];
  }

  v58[0] = v2;
  char v34 = 0;
  uint64_t v60 = v19 & 0x7FFFFFFFFFFFFFFFLL;
  v58[1] = v26;
  int64_t v61 = (unint64_t)(v26 + 64) >> 6;
  uint64_t v59 = (char *)&type metadata for Swift.AnyObject + 8;
  if (v19 < 0) {
    goto LABEL_14;
  }
  while (1)
  {
    if (v28)
    {
      uint64_t v35 = (v28 - 1) & v28;
      unint64_t v36 = __clz(__rbit64(v28)) | (v27 << 6);
      uint64_t v37 = v27;
      goto LABEL_31;
    }

    int64_t v43 = v27 + 1;
    if (__OFADD__(v27, 1LL))
    {
      __break(1u);
      goto LABEL_39;
    }

    if (v43 >= v61) {
      goto LABEL_34;
    }
    unint64_t v44 = *(void *)(v62 + 8 * v43);
    uint64_t v37 = v27 + 1;
    if (!v44)
    {
      uint64_t v37 = v27 + 2;
      if (v27 + 2 >= v61) {
        goto LABEL_34;
      }
      unint64_t v44 = *(void *)(v62 + 8 * v37);
      if (!v44)
      {
        uint64_t v37 = v27 + 3;
        if (v27 + 3 >= v61) {
          goto LABEL_34;
        }
        unint64_t v44 = *(void *)(v62 + 8 * v37);
        if (!v44)
        {
          uint64_t v37 = v27 + 4;
          if (v27 + 4 >= v61) {
            goto LABEL_34;
          }
          unint64_t v44 = *(void *)(v62 + 8 * v37);
          if (!v44) {
            break;
          }
        }
      }
    }

LABEL_30:
    uint64_t v35 = (v44 - 1) & v44;
    unint64_t v36 = __clz(__rbit64(v44)) + (v37 << 6);
LABEL_31:
    uint64_t v42 = *(void *)(*(void *)(v19 + 48) + 8 * v36);
    swift_retain(v42);
    if (!v42) {
      goto LABEL_34;
    }
    while (1)
    {
      uint64_t v46 = ((uint64_t (*)(char *, char *, uint64_t))v63)(v8, v65, v4);
      uint64_t v47 = static Constants.unknownReporterID.getter(v46);
      char v48 = sub_10000C250((uint64_t)v8, v47);
      swift_release(v42);
      uint64_t v25 = (void *)(*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v8, v4);
      v34 |= v48;
      uint64_t v27 = v37;
      unint64_t v28 = v35;
      if ((v19 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_14:
      uint64_t v38 = __CocoaSet.Iterator.next()(v25);
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v66 = v38;
        uint64_t v40 = type metadata accessor for ClientServerInstance(0LL);
        swift_unknownObjectRetain(v39, v41);
        swift_dynamicCast(aBlock, &v66, v59, v40, 7LL);
        uint64_t v42 = aBlock[0];
        swift_unknownObjectRelease(v39);
        uint64_t v37 = v27;
        uint64_t v35 = v28;
        if (v42) {
          continue;
        }
      }

      goto LABEL_34;
    }
  }

  uint64_t v45 = v27 + 5;
  while (v61 != v45)
  {
    unint64_t v44 = *(void *)(v62 + 8 * v45++);
    if (v44)
    {
      uint64_t v37 = v45 - 1;
      goto LABEL_30;
    }
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

LABEL_34:
  sub_10000E404(v19);
  if ((v34 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v4);
    return;
  }

  uint64_t v49 = *(void *)(v58[0] + OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession);
  sub_100022B14();
  NSString v50 = v65;
  uint64_t v51 = ((uint64_t (*)(char *, char *, uint64_t))v63)(v8, v65, v4);
  uint64_t v52 = OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue;
  __chkstk_darwin(v51);
  v58[-2] = v49;
  v58[-1] = v8;
  OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_10000E498);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v64 + 8);
  v53(v8, v4);
  id v54 = *(dispatch_queue_s **)(v49 + v52);
  uint64_t v55 = swift_allocObject(&unk_10003DD80, 32LL, 7LL);
  *(void *)(v55 + swift_weakDestroy(v0 + 16) = sub_10000B61C;
  *(void *)(v55 + 24) = v49;
  aBlock[4] = sub_10001E29C;
  uint64_t v68 = v55;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100016C50;
  aBlock[3] = &unk_10003DD98;
  uint64_t v56 = _Block_copy(aBlock);
  uint64_t v57 = v68;
  swift_retain(v49);
  swift_retain(v55);
  swift_release(v57);
  dispatch_sync(v54, v56);
  _Block_release(v56);
  LOBYTE(v54) = swift_isEscapingClosureAtFileLocation(v55, "", 111LL, 92LL, 24LL, 1LL);
  swift_release(v49);
  swift_release(v55);
  if ((v54 & 1) == 0)
  {
    v53(v50, v4);
    return;
  }

  uint64_t v40 = v89;
  uint64_t v86 = (unint64_t)"@NSDictionary8@?0";
  uint64_t v87 = 0x8000000100036CF0LL;
LABEL_36:
  if (v40)
  {
    uint64_t v41 = __CocoaSet.endIndex.getter(v21);
    if ((v22 & 1) != 0)
    {
      int64_t v43 = v41;
      unint64_t v44 = v42;
      uint64_t v45 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v41, v42);
      sub_10001DBC4(v43, v44, 1);
      if ((v45 & 1) != 0)
      {
        id v76 = __CocoaSet.endIndex.getter(v21);
LABEL_73:
        uint64_t v78 = v76;
        uint64_t v79 = v77;
        uint64_t v80 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v76, v77);
        uint64_t v81 = 1;
        sub_10001DBC4(v78, v79, 1);
        if ((v80 & 1) != 0)
        {
LABEL_74:
          uint64_t v82 = 0LL;
LABEL_80:
          sub_10001DBC4(v15, v17, v81);
          swift_bridgeObjectRelease(v11);
          swift_release(a2);
          return v82;
        }

        goto LABEL_79;
      }

      goto LABEL_43;
    }

LABEL_40:
  __break(1u);
}

  uint64_t result = sub_10000E404(v4);
  uint64_t v3 = v46;
  if (!(v46 >> 62))
  {
    unint64_t v36 = *(void *)((v46 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v36) {
      goto LABEL_42;
    }
LABEL_53:

    return swift_bridgeObjectRelease(v3);
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_100015730(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v28 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (id *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = *(void **)&v2[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v26 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    sub_10000CD80();
    uint64_t v16 = swift_allocObject(&unk_10003DCE0, 32LL, 7LL);
    *(void *)(v16 + swift_weakDestroy(v0 + 16) = v2;
    *(void *)(v16 + 24) = a1;
    aBlock[4] = sub_10001DBBC;
    uint64_t v31 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000172EC;
    aBlock[3] = &unk_10003DCF8;
    uint64_t v17 = _Block_copy(aBlock);
    uint64_t v18 = v2;
    uint64_t v19 = swift_retain(a1);
    static DispatchQoS.unspecified.getter(v19);
    uint64_t v29 = _swiftEmptyArrayStorage;
    uint64_t v20 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v21 = sub_100005EA4((uint64_t *)&unk_100041BC0);
    uint64_t v22 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v4, v20);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v6, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
    swift_release(v31);
    uint64_t v23 = (uint64_t *)&v18[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances];
    swift_beginAccess(&v18[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances], aBlock, 0LL, 0LL);
    uint64_t v24 = *v23;
    swift_bridgeObjectRetain(v24);
    char v25 = sub_100023F2C(a1, v24);
    swift_bridgeObjectRelease(v24);
    return v25 & 1;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1000159FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10001AFE0(a2);
  swift_endAccess(v5);
  return swift_release(v3);
}

uint64_t sub_100015A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = static OsTransactionHandler.shared.getter();
  Swift::Bool v8 = OsTransactionHandler.inactive()();
  uint64_t v9 = swift_release(v7);
  if (v8)
  {
LABEL_10:
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Exit requested, and no active transaction. Calling exit.",  v17,  2u);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    exit(0);
  }

  if (__OFSUB__(a3, a4))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  if (a3 - a4 <= a2)
  {
    if (v12)
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Exit requested, and timeout reached. Calling exit.", v18, 2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    exit(0);
  }

  if (v12)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Exit requested, but active transactions. Will try again in 10 seconds.",  v13,  2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  if (__OFADD__(a2, a4)) {
    goto LABEL_9;
  }
  return sub_1000144A0(a3, a2 + a4);
}

void sub_100015C40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v29, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    os_log_type_t v11 = (void *)Strong;
    uint64_t v25 = *(void *)(Strong + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
    uint64_t v12 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    uint64_t v24 = v3;
    uint64_t v13 = v12;
    swift_unknownObjectWeakInit(v12 + 16, v11);
    aBlock[4] = sub_10001DCCC;
    uint64_t v28 = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000172EC;
    aBlock[3] = &unk_10003DE10;
    uint64_t v14 = _Block_copy(aBlock);
    uint64_t v15 = swift_retain(v13);
    static DispatchQoS.unspecified.getter(v15);
    id v26 = &_swiftEmptyArrayStorage;
    uint64_t v16 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v17 = sub_100005EA4((uint64_t *)&unk_100041BC0);
    uint64_t v23 = v6;
    uint64_t v18 = v17;
    uint64_t v19 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v18, v19, v2, v16);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v5, v14);
    _Block_release(v14);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
    uint64_t v20 = v28;
    swift_release(v13);
    uint64_t v21 = swift_release(v20);
    sub_10001481C(v21);
  }

uint64_t sub_100015E80(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v47, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v1);
  if (!result) {
    return result;
  }
  unint64_t v46 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v41 = (char *)result;
  uint64_t v3 = result + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances;
  swift_beginAccess(result + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v45, 0LL, 0LL);
  uint64_t v4 = *(void *)v3;
  if ((*(void *)v3 & 0xC000000000000001LL) != 0)
  {
    if (v4 < 0) {
      uint64_t v5 = *(void *)v3;
    }
    else {
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v3 = __CocoaSet.makeIterator()(v5);
    uint64_t v6 = type metadata accessor for ClientServerInstance(0LL);
    uint64_t v7 = sub_1000061B8( (unint64_t *)&unk_100041C00,  type metadata accessor for ClientServerInstance,  (uint64_t)&unk_100035978);
    uint64_t v8 = Set.Iterator.init(_cocoa:)(v48, v3, v6, v7);
    uint64_t v4 = v48[0];
    uint64_t v9 = v48[1];
    uint64_t v10 = v48[2];
    int64_t v11 = v48[3];
    unint64_t v12 = v48[4];
  }

  else
  {
    uint64_t v13 = -1LL << *(_BYTE *)(v4 + 32);
    uint64_t v9 = v4 + 56;
    uint64_t v10 = ~v13;
    uint64_t v14 = -v13;
    if (v14 < 64) {
      uint64_t v15 = ~(-1LL << v14);
    }
    else {
      uint64_t v15 = -1LL;
    }
    unint64_t v12 = v15 & *(void *)(v4 + 56);
    uint64_t v8 = (void *)swift_bridgeObjectRetain(*(void *)v3);
    int64_t v11 = 0LL;
  }

  int64_t v16 = (unint64_t)(v10 + 64) >> 6;
  while (v4 < 0)
  {
    uint64_t v21 = __CocoaSet.Iterator.next()(v8);
    if (!v21) {
      goto LABEL_40;
    }
    uint64_t v22 = v21;
    uint64_t v42 = v21;
    uint64_t v23 = type metadata accessor for ClientServerInstance(0LL);
    swift_unknownObjectRetain(v22, v24);
    swift_dynamicCast(&v43, &v42, (char *)&type metadata for Swift.AnyObject + 8, v23, 7LL);
    uint64_t v25 = v43;
    swift_unknownObjectRelease(v22);
    int64_t v20 = v11;
    uint64_t v18 = v12;
    if (!v25) {
      goto LABEL_40;
    }
LABEL_30:
    uint64_t v3 = v25;
    if ((sub_10000D4A0() & 1) != 0)
    {
      uint64_t v28 = &v41[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections];
      swift_beginAccess(&v41[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections], v44, 0LL, 0LL);
      uint64_t v29 = *(void *)v28;
      swift_retain(v25);
      uint64_t v30 = swift_bridgeObjectRetain(v29);
      sub_10001D188(v30, v25);
      uint64_t v3 = v31;
      swift_bridgeObjectRelease(v29);
      swift_release(v25);
      if (v3)
      {
        id v32 = (id)v3;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v34 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v33 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v34 >= v33 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1LL);
        }
        uint64_t v17 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v32);
        uint64_t v3 = (uint64_t)&v46;
        specialized Array._endMutation()(v17);
      }
    }

    uint64_t v8 = (void *)swift_release(v25);
    int64_t v11 = v20;
    unint64_t v12 = v18;
  }

  if (v12)
  {
    uint64_t v18 = (v12 - 1) & v12;
    unint64_t v19 = __clz(__rbit64(v12)) | (v11 << 6);
    int64_t v20 = v11;
    goto LABEL_29;
  }

  int64_t v20 = v11 + 1;
  if (__OFADD__(v11, 1LL))
  {
    __break(1u);
    goto LABEL_49;
  }

  if (v20 >= v16) {
    goto LABEL_40;
  }
  unint64_t v26 = *(void *)(v9 + 8 * v20);
  if (v26)
  {
LABEL_28:
    uint64_t v18 = (v26 - 1) & v26;
    unint64_t v19 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_29:
    uint64_t v25 = *(void *)(*(void *)(v4 + 48) + 8 * v19);
    swift_retain(v25);
    if (!v25) {
      goto LABEL_40;
    }
    goto LABEL_30;
  }

  int64_t v27 = v11 + 2;
  if (v11 + 2 >= v16) {
    goto LABEL_40;
  }
  unint64_t v26 = *(void *)(v9 + 8 * v27);
  if (v26) {
    goto LABEL_27;
  }
  int64_t v27 = v11 + 3;
  if (v11 + 3 >= v16) {
    goto LABEL_40;
  }
  unint64_t v26 = *(void *)(v9 + 8 * v27);
  if (v26)
  {
LABEL_27:
    int64_t v20 = v27;
    goto LABEL_28;
  }

  int64_t v20 = v11 + 4;
  if (v11 + 4 >= v16) {
    goto LABEL_40;
  }
  unint64_t v26 = *(void *)(v9 + 8 * v20);
  if (v26) {
    goto LABEL_28;
  }
  int64_t v35 = v11 + 5;
  while (v16 != v35)
  {
    unint64_t v26 = *(void *)(v9 + 8 * v35++);
    if (v26)
    {
      int64_t v20 = v35 - 1;
      goto LABEL_28;
    }
  }

LABEL_49:
  if (v3 < 0) {
    uint64_t v40 = v3;
  }
  else {
    uint64_t v40 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v3);
  uint64_t v36 = _CocoaArrayWrapper.endIndex.getter(v40);
  uint64_t result = swift_bridgeObjectRelease(v3);
  if (!v36) {
    goto LABEL_53;
  }
LABEL_42:
  if (v36 >= 1)
  {
    for (uint64_t i = 0LL; i != v36; ++i)
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
      }
      else {
        id v38 = *(id *)(v3 + 8 * i + 32);
      }
      uint64_t v39 = v38;
      [v38 invalidate];
    }

    goto LABEL_53;
  }

  __break(1u);
  return result;
}

void sub_1000162AC(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v40, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v17 = (void *)Strong;
    uint64_t v36 = *(void *)(Strong + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
    uint64_t v18 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    swift_unknownObjectWeakInit(v18 + 16, v17);
    uint64_t v19 = swift_allocObject(&unk_10003DE98, 32LL, 7LL);
    *(void *)(v19 + swift_weakDestroy(v0 + 16) = v18;
    *(double *)(v19 + 24) = a2;
    aBlock[4] = sub_10001DD38;
    uint64_t v39 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000172EC;
    aBlock[3] = &unk_10003DEB0;
    int64_t v20 = _Block_copy(aBlock);
    uint64_t v34 = v5;
    uint64_t v35 = v8;
    uint64_t v21 = v20;
    uint64_t v22 = swift_retain(v18);
    static DispatchQoS.unspecified.getter(v22);
    uint64_t v37 = &_swiftEmptyArrayStorage;
    uint64_t v23 = v9;
    uint64_t v24 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v25 = sub_100005EA4((uint64_t *)&unk_100041BC0);
    uint64_t v26 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v37, v25, v26, v4, v24);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v35);
    uint64_t v27 = v39;
    swift_release(v18);
    uint64_t v28 = swift_release(v27);
    sub_100014AC0(v28, a2);
  }

  else
  {
    uint64_t v29 = static Logger.service.getter();
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Server is gone. { action=osTransactionTimeout }", v32, 2u);
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

void sub_1000165D8(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v37, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v9 = (char *)Strong;
    type metadata accessor for OsTransactionHandler(0LL);
    uint64_t v10 = ((uint64_t (*)(void))static OsTransactionHandler.shared.getter)();
    Swift::Bool v11 = OsTransactionHandler.inactive()();
    swift_release(v10);
    if (!v11)
    {
      uint64_t v12 = &v9[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances];
      swift_beginAccess(&v9[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances], v36, 0LL, 0LL);
      uint64_t v13 = *(void *)v12;
      uint64_t v14 = swift_bridgeObjectRetain(*(void *)v12);
      uint64_t v15 = sub_1000134C8(v14);
      swift_bridgeObjectRelease(v13);
      uint64_t v16 = *(void *)(v15 + 16);
      if (v16)
      {
        double v17 = *(double *)(v15 + 32);
        uint64_t v18 = v16 - 1;
        if (v18)
        {
          uint64_t v19 = (double *)(v15 + 40);
          do
          {
            double v20 = *v19++;
            double v21 = v20;
            if (v17 < v20) {
              double v17 = v21;
            }
            --v18;
          }

          while (v18);
        }

        uint64_t v22 = swift_bridgeObjectRelease(v15);
        double v23 = v17 + a2;
        if (static Double.now()(v22) < v23)
        {
          uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
          os_log_type_t v26 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v25, v26))
          {
            uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            *(_DWORD *)uint64_t v27 = 134283521;
            double v34 = v23 - static Double.now()(v27);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v27 + 4, v27 + 12);
            _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "osTransaction timeout. { seconds=%{private}f }",  v27,  0xCu);
            swift_slowDealloc(v27, -1LL, -1LL);
          }

          return;
        }
      }

      else
      {
        uint64_t v24 = swift_bridgeObjectRelease(v15);
      }

      uint64_t v32 = static OsTransactionHandler.shared.getter(v24);
      OsTransactionHandler.expire()();
      swift_release(v32);
    }

    return;
  }

  uint64_t v28 = static Logger.service.getter();
  uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Server is gone. { action=osTransactionTimeout }", v31, 2u);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100016890(uint64_t a1)
{
  uint64_t v1 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Got SIGTERM. Should die within 2 seconds.", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  return sub_1000144A0(2LL, 0LL);
}

id sub_100016968()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100016A7C()
{
  return type metadata accessor for Server(0LL);
}

uint64_t type metadata accessor for Server(uint64_t a1)
{
  uint64_t result = qword_100041B48;
  if (!qword_100041B48) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Server);
  }
  return result;
}

uint64_t sub_100016AC0(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
  void v4[5] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[8] = *(void *)(result - 8) + 64LL;
    void v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[10] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[11] = (char *)&value witness table for Builtin.NativeObject + 64;
    return swift_updateClassMetadata2(a1, 256LL, 12LL, v4, a1 + 80);
  }

  return result;
}

void sub_100016B74(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_100016C30(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100016C50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100016C70(uint64_t a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v42 = a3;
  int v41 = a2;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::Bool v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v46, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(a1);
  if (result)
  {
    double v17 = (void *)result;
    uint64_t v36 = v8;
    uint64_t v37 = a5;
    uint64_t v38 = v13;
    uint64_t v39 = v12;
    uint64_t v40 = v9;
    uint64_t v18 = swift_bridgeObjectRetain_n(a4, 2LL);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc(18LL, -1LL);
      uint64_t v35 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v35;
      *(_DWORD *)uint64_t v21 = 67109379;
      int v22 = v41;
      LODWORD(v43) = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, (char *)&v43 + 4, v21 + 4, v21 + 8);
      *(_WORD *)(v21 + 8) = 2081;
      swift_bridgeObjectRetain(a4);
      uint64_t v23 = v42;
      uint64_t v43 = (void *)sub_100028CC4(v42, a4, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, aBlock, v21 + 10, v21 + 18);
      swift_bridgeObjectRelease_n(a4, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "XPC connection was interrupted. { pid=%d, clientProcessName=%{private}s }",  (uint8_t *)v21,  0x12u);
      uint64_t v24 = v35;
      swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(a4, 2LL);

      uint64_t v23 = v42;
      int v22 = v41;
    }

    uint64_t v25 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    swift_unknownObjectWeakInit(v25 + 16, v17);
    uint64_t v26 = swift_allocObject(&unk_10003DD30, 56LL, 7LL);
    uint64_t v27 = v37;
    *(void *)(v26 + swift_weakDestroy(v0 + 16) = v25;
    *(void *)(v26 + 24) = v27;
    *(_DWORD *)(v26 + 32) = v22;
    *(void *)(v26 + 40) = v23;
    *(void *)(v26 + 48) = a4;
    aBlock[4] = (uint64_t)sub_10001DC04;
    uint64_t v45 = v26;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_1000172EC;
    aBlock[3] = (uint64_t)&unk_10003DD48;
    uint64_t v28 = _Block_copy(aBlock);
    swift_bridgeObjectRetain(a4);
    swift_retain(v25);
    uint64_t v29 = swift_retain(v27);
    static DispatchQoS.unspecified.getter(v29);
    uint64_t v43 = _swiftEmptyArrayStorage;
    uint64_t v30 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v31 = sub_100005EA4((uint64_t *)&unk_100041BC0);
    uint64_t v32 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
    uint64_t v33 = v36;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v43, v31, v32, v36, v30);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v15, v11, v28);
    _Block_release(v28);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v33);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v39);

    uint64_t v34 = v45;
    swift_release(v25);
    return swift_release(v34);
  }

  return result;
}

void sub_100017058(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v28, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v15 = (void *)Strong;
    if ((sub_100015730(a2) & 1) != 0)
    {
    }

    else
    {
      uint64_t v20 = swift_bridgeObjectRetain_n(a5, 2LL);
      uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
      os_log_type_t v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc(18LL, -1LL);
        uint64_t v24 = swift_slowAlloc(32LL, -1LL);
        uint64_t v27 = v24;
        *(_DWORD *)uint64_t v23 = 67109379;
        LODWORD(v26) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, (char *)&v26 + 4, v23 + 4, v23 + 8);
        *(_WORD *)(v23 + 8) = 2081;
        swift_bridgeObjectRetain(a5);
        uint64_t v26 = sub_100028CC4(a4, a5, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v23 + 10, v23 + 18);
        swift_bridgeObjectRelease_n(a5, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "Failed to remove client. { pid=%d, clientProcessName=%{private}s }",  (uint8_t *)v23,  0x12u);
        swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1LL, -1LL);
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a5, 2LL);
      }
    }
  }

  else
  {
    uint64_t v16 = static Logger.service.getter(0LL);
    double v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Server is gone. { action=interruptionHandler }", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

uint64_t sub_1000172EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100017318(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, int a6)
{
  int v62 = a6;
  unint64_t v68 = a5;
  uint64_t v61 = a4;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v67 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v66 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v76, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    os_log_type_t v22 = (void *)Strong;
    uint64_t v60 = v9;
    Date.init()(Strong);
    double v23 = Date.timeIntervalSince(_:)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    id v24 = a3;
    swift_bridgeObjectRetain_n(v68, 2LL);
    id v25 = v24;
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc(28LL, -1LL);
      uint64_t v59 = (void **)swift_slowAlloc(32LL, -1LL);
      aBlock = v59;
      *(_DWORD *)uint64_t v28 = 67175171;
      unsigned int v29 = [v25 processIdentifier];

      LODWORD(v69) = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, (char *)&v69 + 4, v28 + 4, v28 + 8);

      *(_WORD *)(v28 + 8) = 2081;
      unint64_t v30 = v68;
      swift_bridgeObjectRetain(v68);
      uint64_t v31 = v61;
      double v69 = COERCE_DOUBLE(sub_100028CC4(v61, v30, (uint64_t *)&aBlock));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &aBlock, v28 + 10, v28 + 18);
      unint64_t v32 = v30;
      uint64_t v33 = v31;
      swift_bridgeObjectRelease_n(v32, 3LL);
      *(_WORD *)(v28 + 18) = 2049;
      double v69 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &aBlock, v28 + 20, v28 + 28);
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "XPC connection was invalidated. { pid=%{private}d, clientProcessName=%{private}s, uptimeSeconds=%{private}f }",  (uint8_t *)v28,  0x1Cu);
      uint64_t v34 = v59;
      swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v68, 2LL);

      uint64_t v33 = v61;
    }

    NSString v40 = String._bridgeToObjectiveC()();
    uint64_t v41 = swift_allocObject(&unk_10003DC40, 32LL, 7LL);
    *(void *)(v41 + swift_weakDestroy(v0 + 16) = a2;
    *(double *)(v41 + 24) = v23;
    uint64_t v74 = sub_10001DB34;
    uint64_t v75 = v41;
    aBlock = _NSConcreteStackBlock;
    uint64_t v71 = 1107296256LL;
    uint64_t v72 = sub_100017A4C;
    uint64_t v73 = &unk_10003DC58;
    uint64_t v42 = _Block_copy(&aBlock);
    uint64_t v43 = v75;
    swift_retain(a2);
    swift_release(v43);
    AnalyticsSendEventLazy(v40, v42);
    _Block_release(v42);

    uint64_t v44 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    swift_unknownObjectWeakInit(v44 + 16, v22);
    uint64_t v45 = swift_allocObject(&unk_10003DC90, 64LL, 7LL);
    *(void *)(v45 + swift_weakDestroy(v0 + 16) = v44;
    *(void *)(v45 + 24) = a2;
    *(_DWORD *)(v45 + 32) = v62;
    unint64_t v46 = v68;
    *(void *)(v45 + 40) = v33;
    *(void *)(v45 + 48) = v46;
    *(void *)(v45 + swift_weakDestroy(v0 + 56) = v25;
    uint64_t v74 = sub_10001DB7C;
    uint64_t v75 = v45;
    aBlock = _NSConcreteStackBlock;
    uint64_t v71 = 1107296256LL;
    uint64_t v72 = sub_1000172EC;
    uint64_t v73 = &unk_10003DCA8;
    uint64_t v47 = _Block_copy(&aBlock);
    id v48 = v25;
    swift_bridgeObjectRetain(v46);
    swift_retain(a2);
    uint64_t v49 = swift_retain(v44);
    NSString v50 = v63;
    static DispatchQoS.unspecified.getter(v49);
    double v69 = COERCE_DOUBLE(_swiftEmptyArrayStorage);
    uint64_t v51 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v52 = sub_100005EA4((uint64_t *)&unk_100041BC0);
    uint64_t v53 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
    id v54 = v66;
    uint64_t v55 = v52;
    uint64_t v56 = v60;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v69, v55, v53, v60, v51);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v50, v54, v47);
    _Block_release(v47);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v54, v56);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v50, v65);

    uint64_t v57 = v75;
    swift_release(v44);
    return swift_release(v57);
  }

  else
  {
    uint64_t v35 = static Logger.service.getter(0LL);
    uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Server is gone. { action=invalidationHandler }", v38, 2u);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }

unint64_t sub_10001793C(uint64_t a1, double a2)
{
  uint64_t v4 = sub_100005EA4(&qword_100041BF8);
  uint64_t inited = swift_initStackObject(v4, &v11);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000358C0;
  *(void *)(inited + 32) = 0x4E737365636F7270LL;
  *(void *)(inited + 40) = 0xEB00000000656D61LL;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = objc_allocWithZone(&OBJC_CLASS___NSString);
  swift_bridgeObjectRetain(v6);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  id v9 = [v7 initWithString:v8];

  *(void *)(inited + 48) = v9;
  *(void *)(inited + swift_weakDestroy(v0 + 56) = 0x73646E6F636573LL;
  *(void *)(inited + 64) = 0xE700000000000000LL;
  *(void *)(inited + 72) = [objc_allocWithZone(NSNumber) initWithDouble:a2];
  return sub_100005C44(inited);
}

Class sub_100017A4C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10001DC24(0LL, &qword_100041BF0, &OBJC_CLASS___NSObject_ptr);
    v5.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.Class isa = 0LL;
  }

  return v5.super.isa;
}

void sub_100017AD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, void *a6)
{
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v35, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v17 = (char *)Strong;
    if ((sub_100015730(a2) & 1) == 0)
    {
      uint64_t v18 = swift_bridgeObjectRetain_n(a5, 2LL);
      uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = swift_slowAlloc(18LL, -1LL);
        uint64_t v22 = swift_slowAlloc(32LL, -1LL);
        v34[0] = v22;
        *(_DWORD *)uint64_t v21 = 67174915;
        LODWORD(v33) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 4, v21 + 4, v21 + 8);
        *(_WORD *)(v21 + 8) = 2081;
        swift_bridgeObjectRetain(a5);
        uint64_t v33 = sub_100028CC4(a4, a5, v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v21 + 10, v21 + 18);
        swift_bridgeObjectRelease_n(a5, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Failed to remove client. { pid=%{private}d, clientProcessName=%{private}s }",  (uint8_t *)v21,  0x12u);
        swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1LL, -1LL);
        swift_slowDealloc(v21, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a5, 2LL);
      }
    }

    swift_beginAccess(&v17[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections], v34, 33LL, 0LL);
    os_log_type_t v27 = (os_log_s *)sub_10001B1E0(a6);
    swift_endAccess(v34);
    if (!v27)
    {
      uint64_t v28 = swift_bridgeObjectRetain_n(a5, 2LL);
      os_log_type_t v27 = (os_log_s *)Logger.logObject.getter(v28);
      os_log_type_t v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v29))
      {
        uint64_t v30 = swift_slowAlloc(18LL, -1LL);
        uint64_t v31 = swift_slowAlloc(32LL, -1LL);
        v34[0] = v31;
        *(_DWORD *)uint64_t v30 = 67109379;
        LODWORD(v33) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 4, v30 + 4, v30 + 8);
        *(_WORD *)(v30 + 8) = 2081;
        swift_bridgeObjectRetain(a5);
        uint64_t v33 = sub_100028CC4(a4, a5, v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v30 + 10, v30 + 18);
        swift_bridgeObjectRelease_n(a5, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v29,  "Failed to remove connection. { pid=%d, clientProcessName=%{private}s }",  (uint8_t *)v30,  0x12u);
        swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1LL, -1LL);
        swift_slowDealloc(v30, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a5, 2LL);
      }
    }
  }

  else
  {
    uint64_t v23 = static Logger.service.getter(0LL);
    id v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Server is gone. { action=invalidationHandler }", v26, 2u);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

uint64_t sub_100017F34(uint64_t a1, uint64_t a2)
{
  uint64_t v88 = a1;
  uint64_t v4 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (uint64_t *)((char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  NSString v8 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *id v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v7);
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
LABEL_86:
    __break(1u);
LABEL_87:
    swift_release(a2);
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    swift_release(a2);
    __break(1u);
    goto LABEL_90;
  }

  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess(v10, v95, 0LL, 0LL);
  uint64_t v11 = *v10;
  unint64_t v12 = *v10 & 0xC000000000000001LL;
  if (v12)
  {
    uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8LL;
    if (v11 < 0) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = v11 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v15 = __CocoaSet.startIndex.getter(v14);
    uint64_t v17 = v16;
    char v18 = 1;
  }

  else
  {
    uint64_t v15 = sub_10001C978(*v10);
    uint64_t v17 = v19;
    char v18 = v20 & 1;
    uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }

  int64_t v92 = v15;
  uint64_t v93 = v17;
  char v94 = v18;
  uint64_t v90 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  if (v11 < 0) {
    uint64_t v21 = v11;
  }
  else {
    uint64_t v21 = v13;
  }
  swift_bridgeObjectRetain(v11);
  swift_retain(a2);
  unint64_t v89 = v12;
  char v22 = v18;
  if (!v12) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v23 = __CocoaSet.endIndex.getter(v21);
  if ((v22 & 1) == 0) {
    goto LABEL_92;
  }
  uint64_t v25 = v23;
  uint64_t v26 = v24;
  char v27 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v23, v24);
  sub_10001DBC4(v25, v26, 1);
  if ((v27 & 1) != 0)
  {
    char v22 = 1;
  }

  else
  {
    do
    {
      swift_bridgeObjectRetain(v11);
      uint64_t v28 = sub_10001C6F0(v15, v17, v22 & 1, v11);
      swift_bridgeObjectRelease(v11);
      if (*(_DWORD *)(v28 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v90))
      {
        swift_release(v28);
        goto LABEL_34;
      }

      if (*(void *)(v28 + 24) == *(void *)(a2 + 24) && *(void *)(v28 + 32) == *(void *)(a2 + 32))
      {
        swift_release(v28);
      }

      else
      {
        char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release(v28);
        if ((v29 & 1) == 0) {
          goto LABEL_34;
        }
      }

      unint64_t v30 = v89;
      if (v89)
      {
        if ((v18 & 1) == 0) {
          goto LABEL_95;
        }
        if (__CocoaSet.Index.handleBitPattern.getter(v15, v17)) {
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        }
        else {
          uint64_t isUniquelyReferenced_nonNull_native = 1LL;
        }
        uint64_t v37 = sub_100005EA4(&qword_100041BE8);
        uint64_t v38 = (void (*)(_BYTE *, void))Set.Index._asCocoa.modify(v91, v37);
        __CocoaSet.formIndex(after:isUnique:)(v39, isUniquelyReferenced_nonNull_native, v21);
        v38(v91, 0LL);
        char v18 = v94;
        uint64_t v15 = v92;
        uint64_t v17 = v93;
        char v22 = v94;
        if (v30) {
          goto LABEL_12;
        }
      }

      else
      {
        int64_t v31 = sub_10001C60C(v15, v17, v22 & 1, v11);
        uint64_t v33 = v32;
        char v35 = v34;
        sub_10001DBC4(v15, v17, v22 & 1);
        int64_t v92 = v31;
        uint64_t v93 = v33;
        char v94 = v35 & 1;
        uint64_t v17 = v33;
        uint64_t v15 = v31;
        char v22 = v35;
        if (v89) {
          goto LABEL_12;
        }
      }

LABEL_15:
      if ((v22 & 1) != 0) {
        goto LABEL_92;
      }
      if (*(_DWORD *)(v11 + 36) != (_DWORD)v17) {
        goto LABEL_85;
      }
    }

    while (v15 != 1LL << *(_BYTE *)(v11 + 32));
    char v22 = 0;
  }

    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  id v9 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  uint64_t v10 = NSObject._rawHashValue(seed:)(v9);
  uint64_t v11 = -1LL << *(_BYTE *)(v4 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
    goto LABEL_15;
  }
  sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
  uint64_t v13 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
  uint64_t v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = ~v11;
    do
    {
      unint64_t v12 = (v12 + 1) & v15;
      if (((*(void *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v16 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
      uint64_t v17 = static NSObject.== infix(_:_:)(v16, a1);
    }

    while ((v17 & 1) == 0);
  }

  swift_bridgeObjectRelease(v4);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v19 = *v2;
  char v22 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10001A8F0();
    uint64_t v19 = v22;
  }

  NSString v8 = *(void *)(*(void *)(v19 + 48) + 8 * v12);
  sub_10001B920(v12);
  char v20 = *v2;
  *uint64_t v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

    uint64_t v14 = sub_100028994(0LL, *((void *)v14 + 2) + 1LL, 1, v14);
    *uint64_t v25 = v14;
    goto LABEL_5;
  }

  uint64_t v36 = a1;
  static Logger.session.getter(v19);
  char v20 = swift_retain(v5);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  char v22 = static os_log_type_t.default.getter();
  uint64_t v23 = os_log_type_enabled(v21, v22);
  char v35 = a2;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v24 = 134217984;
    uint64_t v39 = *(void *)(v5 + 24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v24 + 4, v24 + 12);
    swift_release(v5);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "requestMessage(): Registered callback found message. Calling callback. { reporterID=%lld }",  v24,  0xCu);
    swift_slowDealloc(v24, -1LL, -1LL);
  }

  else
  {

    swift_release(v5);
  }

  (*((void (**)(char *, uint64_t))v14 + 1))(v16, v13);
  unint64_t v30 = swift_beginAccess(v18, &v39, 33LL, 0LL);
  uint64_t v25 = v36;
  if (!*(void *)(*v18 + 16LL))
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v32 = v37;
  int64_t v31 = v38;
  (*(void (**)(char *, unint64_t, uint64_t, __n128))(v37 + 16))( v12,  *v18 + ((*(unsigned __int8 *)(v37 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80)),  v38,  v30);
  sub_100022404(0LL, 1LL);
  uint64_t v33 = swift_endAccess(&v39);
  if (*(void *)(*v18 + 16LL) < 0xBuLL)
  {
LABEL_13:
    char v34 = Message.flattenToAnyDictionary()(v33);
    ((void (*)(void, uint64_t))v25)(0LL, v34);
    swift_release(v17);
    swift_bridgeObjectRelease(v34);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v31);
    return;
  }

  swift_beginAccess(v18, &v39, 33LL, 0LL);
  if (*(void *)(*v18 + 16LL))
  {
    sub_100022404(0LL, 1LL);
    uint64_t v33 = swift_endAccess(&v39);
    goto LABEL_13;
  }

  __break(1u);
}

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int64);
  __break(1u);
  return result;
}

LABEL_90:
    swift_release(a2);
    __break(1u);
    goto LABEL_91;
  }

  if ((v22 & 1) != 0) {
    goto LABEL_90;
  }
  int v46 = *(_DWORD *)(v11 + 36);
  if (v46 != (_DWORD)v17)
  {
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }

  if (v15 == 1LL << *(_BYTE *)(v11 + 32))
  {
LABEL_77:
    if (v46 == (_DWORD)v17)
    {
      char v81 = 0;
      if (v15 == 1LL << *(_BYTE *)(v11 + 32)) {
        goto LABEL_74;
      }
LABEL_79:
      uint64_t v83 = sub_10001C6F0(v15, v17, v81, v11);
      uint64_t v82 = sub_10000BE60(v88, 1LL, 0xD000000000000011LL, v86 | 0x8000000000000000LL);
      swift_release(v83);
      if (v82) {
        goto LABEL_80;
      }
      goto LABEL_93;
    }

    goto LABEL_88;
  }

LABEL_91:
  swift_release(a2);
  __break(1u);
LABEL_92:
  swift_release(a2);
  __break(1u);
LABEL_93:
  swift_release(a2);
  __break(1u);
LABEL_94:
  swift_release(a2);
  __break(1u);
LABEL_95:
  uint64_t result = swift_release(a2);
  __break(1u);
  return result;
}

uint64_t sub_1000186F4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10002C390(v2);
    *a1 = v2;
  }

  uint64_t v4 = *(void *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  Swift::Int v5 = sub_10001887C(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

uint64_t sub_10001876C(uint64_t a1, uint64_t a2)
{
  return sub_10003337C(a2, a1);
}

Swift::Int sub_10001877C()
{
  return sub_100032008();
}

uint64_t sub_10001879C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100013420(a2, *a1, a3);
}

uint64_t sub_1000187AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100005EA4((uint64_t *)&unk_100041C30);
  __chkstk_darwin(v5);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for FeatureInfo(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001E188(a3, (uint64_t)v10, v11);
  sub_10001E140(a1, (uint64_t)v7);
  return sub_1000229C4((uint64_t)v7, (uint64_t)v10);
}

Swift::Int sub_10001887C(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_100018FA0(0LL, v3, 1LL, v2);
      }
      return result;
    }

    goto LABEL_134;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_142;
  }
  Swift::Int v6 = result;
  uint64_t v98 = v2;
  if (v3 < 2)
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v107 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v104 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 32);
    if (v3 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
LABEL_101:
      unint64_t v89 = v11;
      if (v14 < 2) {
        goto LABEL_98;
      }
      uint64_t v91 = *v98;
      while (1)
      {
        unint64_t v92 = v14 - 2;
        if (v14 < 2) {
          goto LABEL_129;
        }
        if (!v91) {
          goto LABEL_141;
        }
        uint64_t v88 = v89;
        uint64_t v93 = *(void *)&v89[16 * v92 + 32];
        uint64_t v94 = *(void *)&v89[16 * v14 + 24];
        sub_100019098( (char *)(v91 + 8 * v93),  (char *)(v91 + 8LL * *(void *)&v89[16 * v14 + 16]),  v91 + 8 * v94,  v104);
        if (v1) {
          goto LABEL_97;
        }
        if (v94 < v93) {
          goto LABEL_130;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v88) & 1) == 0) {
          uint64_t v88 = sub_10002BBB8((uint64_t)v88);
        }
        if (v92 >= *((void *)v88 + 2)) {
          goto LABEL_131;
        }
        BOOL v95 = &v88[16 * v92 + 32];
        *(void *)BOOL v95 = v93;
        *((void *)v95 + 1) = v94;
        unint64_t v96 = *((void *)v88 + 2);
        if (v14 > v96) {
          goto LABEL_132;
        }
        memmove(&v88[16 * v14 + 16], &v88[16 * v14 + 32], 16 * (v96 - v14));
        unint64_t v89 = v88;
        *((void *)v88 + 2) = v96 - 1;
        unint64_t v14 = v96 - 1;
        if (v96 <= 2) {
          goto LABEL_98;
        }
      }
    }
  }

  else
  {
    id v7 = v2;
    uint64_t v8 = v5 >> 1;
    uint64_t v9 = type metadata accessor for Config(0LL);
    uint64_t v10 = static Array._allocateBufferUninitialized(minimumCapacity:)(v8, v9);
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8LL) + 0x10) = v8;
    uint64_t v2 = v7;
    uint64_t v104 = (char *)((v10 & 0xFFFFFFFFFFFFFF8LL) + 32);
    uint64_t v107 = v10;
  }

  Swift::Int v12 = 0LL;
  uint64_t v13 = *v2;
  uint64_t v100 = *v2 + 16;
  Swift::Int v101 = v6;
  uint64_t v99 = *v2 - 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v102 = v3;
  uint64_t v103 = *v2;
  while (1)
  {
    Swift::Int v15 = v12++;
    if (v12 >= v3) {
      goto LABEL_31;
    }
    uint64_t v16 = *(void *)(v13 + 8 * v15);
    uint64_t v106 = *(void *)(v13 + 8 * v12);
    uint64_t v105 = v16;
    uint64_t v17 = type metadata accessor for Config(0LL);
    uint64_t v18 = sub_1000061B8( &qword_100041C48,  (uint64_t (*)(uint64_t))&type metadata accessor for Config,  (uint64_t)&protocol conformance descriptor for Config);
    int v19 = dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v17, v18);
    Swift::Int v12 = v15 + 2;
    if (v15 + 2 >= v3) {
      goto LABEL_21;
    }
    char v20 = (uint64_t *)(v100 + 8 * v15);
    do
    {
      uint64_t v21 = *(v20 - 1);
      uint64_t v106 = *v20;
      uint64_t v105 = v21;
      if (((v19 ^ dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v17, v18)) & 1) != 0)
      {
        Swift::Int v3 = v102;
        if ((v19 & 1) == 0) {
          goto LABEL_31;
        }
LABEL_24:
        if (v12 >= v15)
        {
          if (v15 < v12)
          {
            char v22 = (uint64_t *)(v99 + 8 * v12);
            Swift::Int v23 = v12;
            Swift::Int v24 = v15;
            uint64_t v25 = (uint64_t *)(v13 + 8 * v15);
            while (1)
            {
              if (v24 != --v23)
              {
                if (!v13) {
                  goto LABEL_140;
                }
                uint64_t v26 = *v25;
                *uint64_t v25 = *v22;
                *char v22 = v26;
              }

              ++v24;
              --v22;
              ++v25;
              if (v24 >= v23) {
                goto LABEL_31;
              }
            }
          }

          goto LABEL_31;
        }

        goto LABEL_135;
      }

      ++v12;
      ++v20;
    }

    while (v102 != v12);
    Swift::Int v3 = v102;
    Swift::Int v12 = v102;
LABEL_21:
    if ((v19 & 1) != 0) {
      goto LABEL_24;
    }
LABEL_31:
    if (v12 >= v3) {
      goto LABEL_48;
    }
    if (__OFSUB__(v12, v15)) {
      goto LABEL_133;
    }
    if (v12 - v15 >= v101) {
      goto LABEL_48;
    }
    if (__OFADD__(v15, v101)) {
      goto LABEL_136;
    }
    if (v15 + v101 >= v3) {
      Swift::Int v27 = v3;
    }
    else {
      Swift::Int v27 = v15 + v101;
    }
    if (v27 < v15) {
      goto LABEL_137;
    }
    if (v12 != v27)
    {
      int v97 = v11;
      uint64_t v28 = type metadata accessor for Config(0LL);
      uint64_t v29 = sub_1000061B8( &qword_100041C48,  (uint64_t (*)(uint64_t))&type metadata accessor for Config,  (uint64_t)&protocol conformance descriptor for Config);
      unint64_t v30 = (uint64_t *)(v99 + 8 * v12);
      do
      {
        uint64_t v31 = *(void *)(v13 + 8 * v12);
        Swift::Int v32 = v15;
        Swift::Int v33 = v15;
        char v34 = v30;
        do
        {
          uint64_t v35 = *v34;
          uint64_t v106 = v31;
          uint64_t v105 = v35;
          if ((dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v28, v29) & 1) == 0) {
            break;
          }
          if (!v13) {
            goto LABEL_138;
          }
          uint64_t v36 = *v34;
          uint64_t v31 = v34[1];
          *char v34 = v31;
          v34[1] = v36;
          --v34;
          ++v33;
        }

        while (v12 != v33);
        ++v12;
        ++v30;
        Swift::Int v15 = v32;
      }

      while (v12 != v27);
      Swift::Int v12 = v27;
      uint64_t v11 = v97;
    }

LABEL_48:
    if (v12 < v15)
    {
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
      __break(1u);
      return result;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_10002B960(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v38 = *((void *)v11 + 2);
    unint64_t v37 = *((void *)v11 + 3);
    unint64_t v14 = v38 + 1;
    if (v38 >= v37 >> 1) {
      uint64_t v11 = sub_10002B960((char *)(v37 > 1), v38 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v14;
    uint64_t v39 = v11 + 32;
    unint64_t v40 = &v11[16 * v38 + 32];
    *(void *)unint64_t v40 = v15;
    *((void *)v40 + 1) = v12;
    if (v38) {
      break;
    }
    unint64_t v14 = 1LL;
    uint64_t v13 = v103;
LABEL_14:
    Swift::Int v3 = v102;
    if (v12 >= v102) {
      goto LABEL_101;
    }
  }

  uint64_t v13 = v103;
  while (1)
  {
    unint64_t v41 = v14 - 1;
    if (v14 >= 4)
    {
      int v46 = &v39[16 * v14];
      uint64_t v47 = *((void *)v46 - 8);
      uint64_t v48 = *((void *)v46 - 7);
      BOOL v52 = __OFSUB__(v48, v47);
      uint64_t v49 = v48 - v47;
      if (v52) {
        goto LABEL_117;
      }
      uint64_t v51 = *((void *)v46 - 6);
      uint64_t v50 = *((void *)v46 - 5);
      BOOL v52 = __OFSUB__(v50, v51);
      uint64_t v44 = v50 - v51;
      char v45 = v52;
      if (v52) {
        goto LABEL_118;
      }
      unint64_t v53 = v14 - 2;
      uint64_t v54 = &v39[16 * v14 - 32];
      uint64_t v56 = *(void *)v54;
      uint64_t v55 = *((void *)v54 + 1);
      BOOL v52 = __OFSUB__(v55, v56);
      uint64_t v57 = v55 - v56;
      if (v52) {
        goto LABEL_120;
      }
      BOOL v52 = __OFADD__(v44, v57);
      uint64_t v58 = v44 + v57;
      if (v52) {
        goto LABEL_123;
      }
      if (v58 >= v49)
      {
        uint64_t v76 = &v39[16 * v41];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v52 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v52) {
          goto LABEL_127;
        }
        BOOL v69 = v44 < v79;
        goto LABEL_86;
      }
    }

    else
    {
      if (v14 != 3)
      {
        uint64_t v70 = *((void *)v11 + 4);
        uint64_t v71 = *((void *)v11 + 5);
        BOOL v52 = __OFSUB__(v71, v70);
        uint64_t v63 = v71 - v70;
        char v64 = v52;
        goto LABEL_80;
      }

      uint64_t v43 = *((void *)v11 + 4);
      uint64_t v42 = *((void *)v11 + 5);
      BOOL v52 = __OFSUB__(v42, v43);
      uint64_t v44 = v42 - v43;
      char v45 = v52;
    }

    if ((v45 & 1) != 0) {
      goto LABEL_119;
    }
    unint64_t v53 = v14 - 2;
    char v59 = &v39[16 * v14 - 32];
    uint64_t v61 = *(void *)v59;
    uint64_t v60 = *((void *)v59 + 1);
    BOOL v62 = __OFSUB__(v60, v61);
    uint64_t v63 = v60 - v61;
    char v64 = v62;
    if (v62) {
      goto LABEL_122;
    }
    int64_t v65 = &v39[16 * v41];
    uint64_t v67 = *(void *)v65;
    uint64_t v66 = *((void *)v65 + 1);
    BOOL v52 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v52) {
      goto LABEL_125;
    }
    if (__OFADD__(v63, v68)) {
      goto LABEL_126;
    }
    if (v63 + v68 >= v44)
    {
      BOOL v69 = v44 < v68;
LABEL_86:
      if (v69) {
        unint64_t v41 = v53;
      }
      goto LABEL_88;
    }

LABEL_80:
    if ((v64 & 1) != 0) {
      goto LABEL_121;
    }
    char v72 = &v39[16 * v41];
    uint64_t v74 = *(void *)v72;
    uint64_t v73 = *((void *)v72 + 1);
    BOOL v52 = __OFSUB__(v73, v74);
    uint64_t v75 = v73 - v74;
    if (v52) {
      goto LABEL_124;
    }
    if (v75 < v63) {
      goto LABEL_14;
    }
LABEL_88:
    unint64_t v80 = v41 - 1;
    if (v41 - 1 >= v14)
    {
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
      goto LABEL_128;
    }

    if (!v13) {
      goto LABEL_139;
    }
    char v81 = v11;
    uint64_t v82 = v13;
    uint64_t v83 = &v39[16 * v80];
    uint64_t v84 = *(void *)v83;
    uint64_t v85 = &v39[16 * v41];
    uint64_t v86 = *((void *)v85 + 1);
    sub_100019098((char *)(v82 + 8LL * *(void *)v83), (char *)(v82 + 8LL * *(void *)v85), v82 + 8 * v86, v104);
    if (v1) {
      break;
    }
    if (v86 < v84) {
      goto LABEL_114;
    }
    if (v41 > *((void *)v81 + 2)) {
      goto LABEL_115;
    }
    *(void *)uint64_t v83 = v84;
    *(void *)&v39[16 * v80 + 8] = v86;
    unint64_t v87 = *((void *)v81 + 2);
    if (v41 >= v87) {
      goto LABEL_116;
    }
    uint64_t v11 = v81;
    unint64_t v14 = v87 - 1;
    memmove(&v39[16 * v41], v85 + 16, 16 * (v87 - 1 - v41));
    *((void *)v81 + 2) = v87 - 1;
    BOOL v69 = v87 > 2;
    uint64_t v13 = v103;
    if (!v69) {
      goto LABEL_14;
    }
  }

  uint64_t v88 = v81;
LABEL_97:
  unint64_t v89 = v88;
LABEL_98:
  uint64_t v90 = swift_bridgeObjectRelease(v89);
  *(void *)((v107 & 0xFFFFFFFFFFFFF8LL) + 0x10) = 0LL;
  specialized Array._endMutation()(v90);
  return swift_bridgeObjectRelease(v107);
}

      uint64_t v67 = 0;
      goto LABEL_81;
    }

    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.double(_:))
    {
      uint64_t v77 = (uint64_t *)(a1 + v4[5]);
      uint64_t v78 = *v77;
      uint64_t v79 = v77[1];
      unint64_t v80 = (uint64_t *)(a1 + v4[6]);
      char v81 = *v80;
      uint64_t v82 = v80[1];
      uint64_t v83 = static DefaultsUtilities.platformDefaultUserName.getter();
      uint64_t v85 = v84;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)( &state64,  v78,  v79,  v81,  v82,  v83,  v84,  &type metadata for Double);
      swift_bridgeObjectRelease(v85);
      if ((v162 & 1) != 0)
      {
        uint64_t v86 = v153;
        unint64_t v87 = sub_10001E188(a1, v153, type metadata accessor for FeatureInfo);
        uint64_t v88 = (uint64_t *)(a1 + v4[8]);
        unint64_t v89 = *v88;
        uint64_t v90 = v88[1];
        v160 = 0.0;
        __chkstk_darwin(v87);
        *(&v150 - 2) = (uint64_t)&v160;
        if ((v90 & 0x1000000000000000LL) != 0 || !(v90 & 0x2000000000000000LL | v89 & 0x1000000000000000LL))
        {
          uint64_t v149 = swift_bridgeObjectRetain(v90);
          _StringGuts._slowWithCString<A>(_:)( &state64,  sub_1000335D4,  &v150 - 4,  v89,  v90,  &type metadata for Bool,  v149);
          swift_bridgeObjectRelease(v90);
          uint64_t v93 = state64;
          goto LABEL_63;
        }

        if ((v90 & 0x2000000000000000LL) != 0)
        {
          state64 = v89;
          __int128 v162 = v90 & 0xFFFFFFFFFFFFFFLL;
          switch((char)v89)
          {
            case 0:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 32:
              swift_bridgeObjectRetain(v90);
              goto LABEL_61;
            default:
              uint64_t v146 = swift_bridgeObjectRetain(v90);
              v147 = (_BYTE *)_swift_stdlib_strtod_clocale(&state64, &v160, v146);
              if (v147) {
                uint64_t v93 = *v147 == 0;
              }
              else {
LABEL_61:
              }
                uint64_t v93 = 0;
              swift_bridgeObjectRelease(v90);
              break;
          }

          goto LABEL_63;
        }

        if ((v89 & 0x1000000000000000LL) != 0)
        {
          uint64_t v91 = (v90 & 0xFFFFFFFFFFFFFFFLL) + 32;
          swift_bridgeObjectRetain(v90);
        }

        else
        {
          uint64_t v91 = _StringObject.sharedUTF8.getter(v89, v90);
          swift_bridgeObjectRetain(v90);
          if (!v91)
          {
            unint64_t v92 = 0LL;
            goto LABEL_33;
          }
        }

        unint64_t v92 = (_BYTE *)v91;
LABEL_33:
        sub_1000335D4(v92, (BOOL *)&state64);
        uint64_t v93 = state64;
        swift_bridgeObjectRelease(v90);
LABEL_63:
        uint64_t v130 = v160;
        if (!v93) {
          uint64_t v130 = 0.0;
        }
        uint64_t v131 = v152;
        char *v152 = v130;
        os_log_type_t v133 = v157;
        uint64_t v132 = v158;
        (*(void (**)(double *, void, uint64_t))(v157 + 104))( v131,  enum case for SimpleType.double(_:),  v158);
        unint64_t v116 = v159;
        sub_100006698(v86, v159, type metadata accessor for FeatureInfo);
        uint64_t v43 = type metadata accessor for FeatureState(0LL);
        (*(void (**)(uint64_t, double *, uint64_t))(v133 + 32))(v116 + *(int *)(v43 + 20), v131, v132);
        goto LABEL_85;
      }

      uint64_t v117 = state64;
      unint64_t v116 = v159;
      sub_10001E188(a1, v159, type metadata accessor for FeatureInfo);
      uint64_t v43 = type metadata accessor for FeatureState(0LL);
      *(void *)(v116 + *(int *)(v43 + 20)) = v117;
      (*(void (**)(void))(v157 + 104))();
LABEL_85:
      *(_DWORD *)(v116 + *(int *)(v43 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = -1;
      uint64_t v128 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL);
      uint64_t v129 = v116;
      goto LABEL_86;
    }

    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.BOOL(_:))
    {
      uint64_t v100 = (uint64_t *)(a1 + v4[5]);
      Swift::Int v101 = *v100;
      Swift::Int v102 = v100[1];
      uint64_t v103 = (uint64_t *)(a1 + v4[6]);
      uint64_t v104 = *v103;
      uint64_t v105 = v103[1];
      uint64_t v106 = static DefaultsUtilities.platformDefaultUserName.getter();
      uint64_t v108 = v107;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)( &state64,  v101,  v102,  v104,  v105,  v106,  v107,  &type metadata for Bool);
      swift_bridgeObjectRelease(v108);
      if (state64 != 2)
      {
        uint64_t v126 = state64 & 1;
        unint64_t v127 = a1;
        uint64_t v42 = v159;
        sub_10001E188(v127, v159, type metadata accessor for FeatureInfo);
        uint64_t v43 = type metadata accessor for FeatureState(0LL);
        *(_BYTE *)(v42 + *(int *)(v43 + 20)) = v126;
        goto LABEL_58;
      }

      uint64_t v109 = (void *)(a1 + v4[8]);
      uint64_t v110 = v109[1];
      *int v19 = *v109;
      v19[1] = v110;
      uint64_t v112 = v157;
      uint64_t v111 = v158;
      unint64_t v113 = *(void (**)(_BYTE *, void, uint64_t))(v157 + 104);
      v113(v19, enum case for SimpleType.string(_:), v158);
      uint64_t v114 = a1;
      char v115 = v151;
      sub_10001E188(v114, v151, type metadata accessor for FeatureInfo);
      swift_bridgeObjectRetain(v110);
      LOBYTE(v110) = SimpleType.isTrue()();
      (*(void (**)(void *, uint64_t))(v112 + 8))(v19, v111);
      *uint64_t v17 = v110 & 1;
      v113(v17, enum case for SimpleType.BOOL(_:), v111);
      unint64_t v116 = v159;
      sub_100006698(v115, v159, type metadata accessor for FeatureInfo);
      uint64_t v43 = type metadata accessor for FeatureState(0LL);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v112 + 32))(v116 + *(int *)(v43 + 20), v17, v111);
      goto LABEL_85;
    }

    uint64_t v118 = (os_log_s *)Logger.logObject.getter(v29);
    uint64_t v119 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v118, v119))
    {
      double v120 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)double v120 = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, v119, "Unknown featureInfo dataType received.", v120, 2u);
      swift_slowDealloc(v120, -1LL, -1LL);
    }

    char v121 = type metadata accessor for FeatureState(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56LL))(v159, 1LL, 1LL, v121);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }

  else if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.notify(_:))
  {
    char v45 = v156;
    if ((v156 & 0x100000000LL) == 0)
    {
      state64 = 0LL;
      if (!notify_get_state(v156, &state64))
      {
        int v46 = v159;
        sub_10001E188(a1, v159, type metadata accessor for FeatureInfo);
        uint64_t v47 = type metadata accessor for FeatureState(0LL);
        *(_BYTE *)(v46 + *(int *)(v47 + 20)) = state64 == 1;
        (*(void (**)(void))(v157 + 104))();
        *(_DWORD *)(v46 + *(int *)(v47 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = v45;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))(v46, 0LL, 1LL, v47);
        return;
      }

      goto LABEL_21;
    }

    uint64_t v73 = (os_log_s *)Logger.logObject.getter(v28);
    uint64_t v74 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v75 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "cachedToken is nil.", v75, 2u);
      swift_slowDealloc(v75, -1LL, -1LL);
    }

    uint64_t v76 = type metadata accessor for FeatureState(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56LL))(v159, 1LL, 1LL, v76);
  }

  else
  {
    if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.other(_:)) {
      goto LABEL_21;
    }
    uint64_t v94 = (os_log_s *)Logger.logObject.getter(v28);
    BOOL v95 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v94, v95))
    {
      unint64_t v96 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v96 = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, v95, "Unknown featureInfo monitorType received.", v96, 2u);
      swift_slowDealloc(v96, -1LL, -1LL);
    }

    int v97 = type metadata accessor for FeatureState(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56LL))(v159, 1LL, 1LL, v97);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  }

uint64_t sub_100018FA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = type metadata accessor for Config(0LL);
    uint64_t v9 = sub_1000061B8( &qword_100041C48,  (uint64_t (*)(uint64_t))&type metadata accessor for Config,  (uint64_t)&protocol conformance descriptor for Config);
    uint64_t v10 = v7 + 8 * v4 - 8;
LABEL_5:
    uint64_t v11 = *(void *)(v7 + 8 * v4);
    uint64_t v12 = v6;
    uint64_t v13 = (uint64_t *)v10;
    while (1)
    {
      uint64_t v14 = *v13;
      uint64_t v17 = v11;
      uint64_t v16 = v14;
      Swift::Int result = dispatch thunk of static Comparable.< infix(_:_:)(&v17, &v16, v8, v9);
      if ((result & 1) == 0)
      {
LABEL_4:
        ++v4;
        v10 += 8LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      uint64_t v15 = *v13;
      uint64_t v11 = v13[1];
      *uint64_t v13 = v11;
      v13[1] = v15;
      --v13;
      if (v4 == ++v12) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_100019098(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = (uint64_t *)__dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  uint64_t v13 = v12 >> 3;
  Swift::Int v32 = __src;
  uint64_t v31 = (uint64_t *)__dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      int v19 = &v4[v13];
      unint64_t v30 = v19;
      Swift::Int v32 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v20 = type metadata accessor for Config(0LL);
        uint64_t v27 = sub_1000061B8( &qword_100041C48,  (uint64_t (*)(uint64_t))&type metadata accessor for Config,  (uint64_t)&protocol conformance descriptor for Config);
        uint64_t v21 = (char *)(a3 - 8);
        char v22 = v6;
        while (1)
        {
          uint64_t v23 = *(v19 - 1);
          uint64_t v24 = *((void *)v22 - 1);
          v22 -= 8;
          uint64_t v25 = v21 + 8;
          uint64_t v28 = v24;
          uint64_t v29 = v23;
          if ((dispatch thunk of static Comparable.< infix(_:_:)(&v29, &v28, v20, v27) & 1) != 0)
          {
            if (v25 != v6 || v21 >= v6) {
              *(void *)uint64_t v21 = *(void *)v22;
            }
            Swift::Int v32 = v22;
            if (v22 <= v7) {
              goto LABEL_43;
            }
          }

          else
          {
            unint64_t v30 = v19 - 1;
            char v22 = v6;
            --v19;
            if (v6 <= v7) {
              goto LABEL_43;
            }
          }

          v21 -= 8;
          uint64_t v6 = v22;
          if (v19 <= v4) {
            goto LABEL_43;
          }
        }
      }

      goto LABEL_43;
    }
  }

  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[v10];
    unint64_t v30 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      uint64_t v15 = type metadata accessor for Config(0LL);
      uint64_t v16 = sub_1000061B8( &qword_100041C48,  (uint64_t (*)(uint64_t))&type metadata accessor for Config,  (uint64_t)&protocol conformance descriptor for Config);
      do
      {
        uint64_t v17 = *(void *)v6;
        uint64_t v28 = *v4;
        uint64_t v29 = v17;
        if ((dispatch thunk of static Comparable.< infix(_:_:)(&v29, &v28, v15, v16) & 1) != 0)
        {
          uint64_t v18 = v6 + 8;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }

        else
        {
          uint64_t v31 = ++v4;
          uint64_t v18 = v6;
        }

        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      Swift::Int v32 = v7;
    }

uint64_t sub_100019390(Swift::Int *a1, void *a2)
{
  Swift::Int v3 = v2;
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

      uint64_t v32 = v9;
      uint64_t v10 = sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v24 = sub_100019B24(v7, result + 1);
    Swift::Int v33 = v24;
    unint64_t v25 = *(void *)(v24 + 16);
    if (*(void *)(v24 + 24) <= v25)
    {
      uint64_t v30 = v25 + 1;
      id v31 = v8;
      sub_10001A018(v30);
      uint64_t v26 = v33;
    }

    else
    {
      uint64_t v26 = v24;
      id v27 = v8;
    }

    sub_10001A384((uint64_t)v8, v26);
    uint64_t v29 = *v3;
    *Swift::Int v3 = v26;
  }

  else
  {
    Swift::Int v13 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v14 = NSObject._rawHashValue(seed:)(v13);
    uint64_t v15 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v16 = v14 & ~v15;
    if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
    {
      sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
      id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
      char v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        char v22 = *(void **)(*(void *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        id v23 = v22;
        return 0LL;
      }

      uint64_t v19 = ~v15;
      while (1)
      {
        unint64_t v16 = (v16 + 1) & v19;
        if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
        char v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v33 = *v3;
    *Swift::Int v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_10001A404((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    *Swift::Int v3 = v33;
  }

  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

uint64_t sub_10001962C(uint64_t *a1, uint64_t a2)
{
  Swift::Int v3 = v2;
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
    uint64_t v8 = swift_retain(a2);
    uint64_t v9 = __CocoaSet.member(for:)(v8, v7);
    swift_release(a2);
    if (v9)
    {
      swift_bridgeObjectRelease(v6);
      swift_release(a2);
      uint64_t v34 = v9;
      uint64_t v10 = type metadata accessor for ClientServerInstance(0LL);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(v33, &v34, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v33[0];
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v28 = sub_1000198F0(v7, result + 1);
    v33[0] = v28;
    unint64_t v29 = *(void *)(v28 + 16);
    if (*(void *)(v28 + 24) <= v29)
    {
      uint64_t v32 = v29 + 1;
      swift_retain(a2);
      sub_100019D18(v32);
      uint64_t v30 = v33[0];
    }

    else
    {
      uint64_t v30 = v28;
      swift_retain(a2);
    }

    sub_10001A2B4(a2, v30);
    uint64_t v27 = *v3;
    *Swift::Int v3 = v30;
  }

  else
  {
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    uint64_t v13 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    uint64_t v14 = *(void *)(a2 + 24);
    uint64_t v15 = *(void *)(a2 + 32);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v15);
    String.hash(into:)(v33, v14, v15);
    swift_bridgeObjectRelease(v15);
    Swift::Int v16 = Hasher._finalize()();
    uint64_t v17 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v18 = v16 & ~v17;
    if (((*(void *)(v6 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) != 0)
    {
      uint64_t v19 = ~v17;
      uint64_t v20 = *(void *)(v6 + 48);
      int v21 = *(_DWORD *)(a2 + v13);
      uint64_t v22 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        uint64_t v23 = *(void *)(v20 + 8 * v18);
        if (*(_DWORD *)(v23 + v22) == v21)
        {
          BOOL v24 = *(void *)(v23 + 24) == *(void *)(a2 + 24) && *(void *)(v23 + 32) == *(void *)(a2 + 32);
          if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_release(a2);
            swift_bridgeObjectRelease(v6);
            uint64_t v31 = *(void *)(*(void *)(*v3 + 48) + 8 * v18);
            *a1 = v31;
            swift_retain(v31);
            return 0LL;
          }

          uint64_t v22 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }

        unint64_t v18 = (v18 + 1) & v19;
      }

      while (((*(void *)(v6 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v18) & 1) != 0);
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33[0] = *v3;
    *Swift::Int v3 = 0x8000000000000000LL;
    uint64_t v26 = swift_retain(a2);
    sub_10001A588(v26, v18, isUniquelyReferenced_nonNull_native);
    uint64_t v27 = *v3;
    *Swift::Int v3 = v33[0];
  }

  swift_bridgeObjectRelease(v27);
  *a1 = a2;
  return 1LL;
}

Swift::Int sub_1000198F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005EA4(&qword_100041BE0);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v25 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for ClientServerInstance(0LL);
      do
      {
        v23[0] = v7;
        swift_dynamicCast(&v24, v23, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v25;
        unint64_t v18 = *(void *)(v25 + 16);
        if (*(void *)(v25 + 24) <= v18)
        {
          sub_100019D18(v18 + 1);
          uint64_t v4 = v25;
        }

        uint64_t v9 = v24;
        Hasher.init(_seed:)(v23, *(void *)(v4 + 40));
        Hasher._combine(_:)(*(_DWORD *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        uint64_t v10 = *(void *)(v9 + 24);
        uint64_t v11 = *(void *)(v9 + 32);
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v23, v10, v11);
        swift_bridgeObjectRelease(v11);
        Swift::Int result = Hasher._finalize()();
        uint64_t v13 = v4 + 56;
        uint64_t v14 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v15 = result & ~v14;
        unint64_t v16 = v15 >> 6;
        if (((-1LL << v15) & ~*(void *)(v4 + 56 + 8 * (v15 >> 6))) != 0)
        {
          unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v4 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v19 = 0;
          unint64_t v20 = (unint64_t)(63 - v14) >> 6;
          do
          {
            if (++v16 == v20 && (v19 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v21 = v16 == v20;
            if (v16 == v20) {
              unint64_t v16 = 0LL;
            }
            v19 |= v21;
            uint64_t v22 = *(void *)(v13 + 8 * v16);
          }

          while (v22 == -1);
          unint64_t v17 = __clz(__rbit64(~v22)) + (v16 << 6);
        }

        *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
        *(void *)(*(void *)(v4 + 48) + 8 * v17) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()(result);
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

Swift::Int sub_100019B24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005EA4(&qword_100041BD8);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_10001A018(v16 + 1);
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
        uint64_t v7 = __CocoaSet.Iterator.next()(result);
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

Swift::Int sub_100019D18(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005EA4(&qword_100041BE0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v31 = v2;
    uint64_t v32 = (void *)(v3 + 56);
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
        unint64_t v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }

      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v17 >= v10) {
          goto LABEL_36;
        }
        unint64_t v18 = v32[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v18 = v32[v13];
          if (!v18)
          {
            int64_t v13 = v17 + 2;
            if (v17 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v18 = v32[v13];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v31;
                uint64_t v30 = 1LL << *(_BYTE *)(v3 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v32 = -1LL << v30;
                }
                *(void *)(v3 + swift_weakDestroy(v0 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v32[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v13 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = v32[v13];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v19;
            }
          }
        }

Swift::Int sub_10001A018(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005EA4(&qword_100041BD8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v30 = v2;
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
                *(void *)(v3 + swift_weakDestroy(v0 + 16) = 0LL;
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

unint64_t sub_10001A2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v8, v4, v5);
  swift_bridgeObjectRelease(v5);
  Swift::Int v6 = Hasher._finalize()();
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v6 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t sub_10001A384(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_10001A404(uint64_t a1, unint64_t a2, char a3)
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
    sub_10001A018(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_10001A8F0();
      goto LABEL_14;
    }

    sub_10001AD68(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
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
    *(void *)(v19 + swift_weakDestroy(v0 + 16) = v22;
  }
}

uint64_t sub_10001A588(uint64_t result, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    uint64_t v9 = v7 + 1;
    if ((a3 & 1) != 0)
    {
      sub_100019D18(v9);
    }

    else
    {
      if (v8 > v7)
      {
        unint64_t result = (uint64_t)sub_10001A748();
        goto LABEL_18;
      }

      sub_10001AA98(v9);
    }

    uint64_t v10 = *v3;
    Hasher.init(_seed:)(v26, *(void *)(*v3 + 40));
    uint64_t v11 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    uint64_t v12 = *(void *)(v6 + 24);
    uint64_t v13 = *(void *)(v6 + 32);
    swift_bridgeObjectRetain(v13);
    String.hash(into:)(v26, v12, v13);
    swift_bridgeObjectRelease(v13);
    uint64_t v3 = v26;
    unint64_t result = Hasher._finalize()();
    uint64_t v14 = -1LL << *(_BYTE *)(v10 + 32);
    a2 = result & ~v14;
    uint64_t v15 = v10 + 56;
    if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
    {
      uint64_t v16 = ~v14;
      unint64_t result = type metadata accessor for ClientServerInstance(0LL);
      uint64_t v3 = (uint64_t *)result;
      uint64_t v17 = *(void *)(v10 + 48);
      int v18 = *(_DWORD *)(v6 + v11);
      uint64_t v19 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        uint64_t v20 = *(void *)(v17 + 8 * a2);
        if (*(_DWORD *)(v20 + v19) == v18)
        {
          if (*(void *)(v20 + 24) == *(void *)(v6 + 24) && *(void *)(v20 + 32) == *(void *)(v6 + 32)) {
            goto LABEL_21;
          }
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) != 0) {
            goto LABEL_21;
          }
          uint64_t v19 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }

        a2 = (a2 + 1) & v16;
      }

      while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
    }
  }

void *sub_10001A748()
{
  uint64_t v1 = v0;
  sub_100005EA4(&qword_100041BE0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = *(void *)(v2 + 16);
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

id sub_10001A8F0()
{
  uint64_t v1 = v0;
  sub_100005EA4(&qword_100041BD8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = *(void *)(v2 + 16);
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

Swift::Int sub_10001AA98(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005EA4(&qword_100041BE0);
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
  uint64_t v30 = v2;
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v31) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v31) {
        goto LABEL_36;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v13);
      if (!v18)
      {
        int64_t v13 = v17 + 2;
        if (v17 + 2 >= v31) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v13);
        if (!v18) {
          break;
        }
      }
    }

Swift::Int sub_10001AD68(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005EA4(&qword_100041BD8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v30 = v2;
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

uint64_t sub_10001AFE0(uint64_t a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001LL) != 0)
  {
    if (v3 < 0) {
      uint64_t v4 = *v1;
    }
    else {
      uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v5 = swift_retain(a1);
    char v6 = __CocoaSet.contains(_:)(v5, v4);
    swift_release(a1);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = sub_10001B3B4(v4, a1);
      swift_bridgeObjectRelease(v3);
      return v7;
    }

uint64_t sub_10001B1E0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001LL) != 0)
  {
    if (v4 < 0) {
      uint64_t v5 = *v1;
    }
    else {
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    id v6 = a1;
    char v7 = __CocoaSet.contains(_:)(v6, v5);

    if ((v7 & 1) != 0)
    {
      uint64_t v8 = sub_10001B594(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }

uint64_t sub_10001B3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRelease(*v3);
  uint64_t v6 = __CocoaSet.count.getter(a1);
  uint64_t v8 = swift_unknownObjectRetain(a1, v7);
  Swift::Int v9 = sub_1000198F0(v8, v6);
  Swift::Int v24 = v9;
  Hasher.init(_seed:)(v23, *(void *)(v9 + 40));
  Swift::UInt32 v10 = *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v10);
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  swift_retain(v9);
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(v23, v11, v12);
  swift_bridgeObjectRelease(v12);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1LL << *(_BYTE *)(v9 + 32);
  unint64_t v15 = v13 & ~v14;
  if (((*(void *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v16 = ~v14;
  uint64_t v17 = *(void *)(v9 + 48);
  uint64_t v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v19 = *(void *)(v17 + 8 * v15);
    if (*(_DWORD *)(v19 + v18) == v10) {
      break;
    }
LABEL_3:
    unint64_t v15 = (v15 + 1) & v16;
    if (((*(void *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
      goto LABEL_20;
    }
  }

  BOOL v20 = *(void *)(v19 + 24) == v11 && *(void *)(v19 + 32) == v12;
  if (!v20 && (((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))() & 1) == 0)
  {
    uint64_t v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_3;
  }

  swift_release(v9);
  Swift::Int v9 = *(void *)(*(void *)(v9 + 48) + 8 * v15);
  sub_10001B72C(v15);
  if (v10 == *(_DWORD *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
  {
    BOOL v21 = v11 == *(void *)(v9 + 24) && v12 == *(void *)(v9 + 32);
    if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(v11, v12) & 1) != 0)
    {
      *uint64_t v3 = v24;
      return v9;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
LABEL_20:
  swift_release(v9);
  __break(1u);
LABEL_21:
  uint64_t result = swift_release(v9);
  __break(1u);
  return result;
}

uint64_t sub_10001B594(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRelease(*v3);
  uint64_t v6 = __CocoaSet.count.getter(a1);
  uint64_t v8 = swift_unknownObjectRetain(a1, v7);
  Swift::Int v9 = sub_100019B24(v8, v6);
  Swift::Int v20 = v9;
  Swift::Int v10 = *(void *)(v9 + 40);
  swift_retain(v9);
  Swift::Int v11 = NSObject._rawHashValue(seed:)(v10);
  uint64_t v12 = -1LL << *(_BYTE *)(v9 + 32);
  unint64_t v13 = v11 & ~v12;
  if (((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) != 0)
  {
    sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
    id v14 = *(id *)(*(void *)(v9 + 48) + 8 * v13);
    char v15 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v15 & 1) != 0)
    {
LABEL_6:
      swift_release(v9);
      Swift::Int v9 = *(void *)(*(void *)(v9 + 48) + 8 * v13);
      sub_10001B920(v13);
      if ((static NSObject.== infix(_:_:)(a2, v9) & 1) != 0)
      {
        *uint64_t v3 = v20;
        return v9;
      }

      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v9 + 48) + 8 * v13);
        char v18 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v18 & 1) != 0) {
          goto LABEL_6;
        }
      }
    }

    swift_release(v9);
    __break(1u);
  }

  uint64_t result = swift_release(v9);
  __break(1u);
  return result;
}

unint64_t sub_10001B72C(unint64_t result)
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
        uint64_t v10 = *(void *)(*(void *)(v3 + 48) + 8 * v6);
        Hasher.init(_seed:)(v21, *(void *)(v3 + 40));
        Hasher._combine(_:)(*(_DWORD *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        uint64_t v11 = *(void *)(v10 + 24);
        uint64_t v12 = *(void *)(v10 + 32);
        swift_retain(v10);
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v21, v11, v12);
        swift_bridgeObjectRelease(v12);
        Swift::Int v13 = Hasher._finalize()();
        swift_release(v10);
        unint64_t v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9) {
            goto LABEL_5;
          }
        }

        else if (v14 >= v9)
        {
          goto LABEL_11;
        }

        if (v2 >= (uint64_t)v14)
        {
LABEL_11:
          uint64_t v15 = *(void *)(v3 + 48);
          uint64_t v16 = (void *)(v15 + 8 * v2);
          id v17 = (void *)(v15 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
          {
            *uint64_t v16 = *v17;
            int64_t v2 = v6;
          }
        }

unint64_t sub_10001B920(unint64_t result)
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
            id v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *id v17 = *v18;
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
    *(void *)(v3 + swift_weakDestroy(v0 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

void (*sub_10001BAC0(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_10001BB40(v6, a2, a3);
  return sub_10001BB14;
}

void sub_10001BB14(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t *sub_10001BB40(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain(*(void *)(a3 + 8 * a2 + 32));
LABEL_5:
    *uint64_t v3 = v4;
    return (uint64_t *)sub_10001BBAC;
  }

  __break(1u);
  return result;
}

uint64_t sub_10001BBAC(void *a1)
{
  return swift_release(*a1);
}

void *sub_10001BBB4(uint64_t a1, void *a2, void *a3)
{
  id v109 = a2;
  uint64_t v5 = sub_100005EA4((uint64_t *)&unk_100041C30);
  __chkstk_darwin(v5);
  uint64_t v103 = (uint64_t)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v112 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v107 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v102 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v114 = *(void *)(v102 - 8);
  uint64_t v8 = __chkstk_darwin(v102);
  uint64_t v117 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v105 = (char *)&v91 - v11;
  uint64_t v106 = v12;
  __chkstk_darwin(v10);
  uint64_t v104 = (uint64_t)&v91 - v13;
  uint64_t v14 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  BOOL v20 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v24 = sub_100005960((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v25 = sub_100005EA4(&qword_100041648);
  uint64_t v26 = swift_allocObject(v25, 28LL, 7LL);
  *(_DWORD *)(v26 + 24) = 0;
  *(void *)(v26 + swift_weakDestroy(v0 + 16) = v24;
  a3[2] = v26;
  uint64_t v118 = sub_10001DC24(0LL, (unint64_t *)&qword_100041650, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.default.getter();
  (*(void (**)(char *, void, uint64_t))(v18 + 104))( v20,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v17);
  aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v27 = sub_1000061B8( (unint64_t *)&unk_100041C10,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v28 = sub_100005EA4(&qword_100041658);
  uint64_t v29 = sub_10001DC5C((unint64_t *)&qword_100041C20, &qword_100041658);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v28, v29, v14, v27);
  uint64_t v30 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002FLL,  0x8000000100036640LL,  v23,  v16,  v20,  0LL);
  a3[5] = v30;
  uint64_t v31 = static Logger.service.getter(v30);
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "SystemMonitor.init()", v34, 2u);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  a3[4] = a1;
  swift_retain(a1);
  uint64_t v93 = a1;
  uint64_t v35 = sub_100033168();
  a3[3] = v35;
  uint64_t v36 = v35[2];
  unint64_t v92 = v35;
  if (v36)
  {
    uint64_t v111 = (char *)a3 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
    uint64_t v37 = *(unsigned __int8 *)(v114 + 80);
    uint64_t v38 = (v37 + 32) & ~v37;
    uint64_t v39 = (uint64_t)v35 + v38;
    int v116 = enum case for SystemMonitorConfig.MonitorType.defaults(_:);
    int v115 = enum case for SystemMonitorConfig.MonitorType.notify(_:);
    int v100 = enum case for SystemMonitorConfig.MonitorType.other(_:);
    uint64_t v99 = v37 | 7;
    uint64_t v101 = v38;
    unint64_t v98 = (v106 + v38 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v97 = v98 + 8;
    uint64_t v114 = *(void *)(v114 + 72);
    __n128 v40 = swift_bridgeObjectRetain(v35);
    v40.n128_u64[0] = 67109376LL;
    __n128 v96 = v40;
    v40.n128_u64[0] = 136380675LL;
    __n128 v95 = v40;
    uint64_t v94 = (char *)&type metadata for Any + 8;
    unint64_t v41 = a3;
    uint64_t v110 = a3;
    uint64_t v42 = v112;
    uint64_t v43 = v107;
    uint64_t v44 = v108;
    uint64_t v45 = v104;
    uint64_t v46 = (uint64_t)v105;
    while (1)
    {
      sub_10001E188(v39, v45, type metadata accessor for FeatureInfo);
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v43, v45, v44);
      int v56 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v43, v44);
      if (v56 != v116 && v56 != v115)
      {
        if (v56 == v100)
        {
          sub_10000B7BC(v45);
        }

        else
        {
          uint64_t v118 = v36;
          uint64_t v80 = sub_10001E188(v45, v46, type metadata accessor for FeatureInfo);
          char v81 = (os_log_s *)Logger.logObject.getter(v80);
          os_log_type_t v82 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v81, v82))
          {
            uint64_t v83 = swift_slowAlloc(12LL, -1LL);
            uint64_t v84 = swift_slowAlloc(32LL, -1LL);
            aBlock[0] = v84;
            *(_DWORD *)uint64_t v83 = v95.n128_u32[0];
            uint64_t v85 = SystemMonitorConfig.MonitorType.rawValue.getter();
            unint64_t v87 = v86;
            *(void *)(v83 + 4) = sub_100028CC4(v85, v86, aBlock);
            swift_bridgeObjectRelease(v87);
            sub_10000B7BC(v46);
            _os_log_impl( (void *)&_mh_execute_header,  v81,  v82,  "Encountered unknown monitorType. { monitorType=%{private}s }",  (uint8_t *)v83,  0xCu);
            swift_arrayDestroy(v84, 1LL, v94);
            uint64_t v88 = v84;
            unint64_t v41 = v110;
            swift_slowDealloc(v88, -1LL, -1LL);
            swift_slowDealloc(v83, -1LL, -1LL);
          }

          else
          {
            sub_10000B7BC(v46);
          }

          sub_10000B7BC(v45);
          uint64_t v36 = v118;
          uint64_t v42 = v112;
          (*(void (**)(char *, uint64_t))(v112 + 8))(v43, v44);
        }

        goto LABEL_7;
      }

      uint64_t v118 = v36;
      uint64_t v58 = swift_allocObject(&unk_10003DF38, 20LL, 7LL);
      *(_DWORD *)(v58 + swift_weakDestroy(v0 + 16) = -1;
      char v59 = (uint64_t *)(v45 + *(int *)(v102 + 28));
      uint64_t v113 = *v59;
      uint64_t v60 = v45;
      uint64_t v61 = v59[1];
      BOOL v62 = (void *)v41[5];
      uint64_t v63 = swift_allocObject(&unk_10003DF60, 24LL, 7LL);
      swift_weakInit(v63 + 16, v41);
      uint64_t v64 = swift_allocObject(&unk_10003DF88, 32LL, 7LL);
      *(void *)(v64 + 24) = &off_10003DAC8;
      swift_unknownObjectWeakInit(v64 + 16, v109);
      uint64_t v65 = v60;
      uint64_t v66 = v117;
      sub_10001E188(v65, v117, type metadata accessor for FeatureInfo);
      uint64_t v67 = swift_allocObject(&unk_10003DFB0, v97, v99);
      *(void *)(v67 + swift_weakDestroy(v0 + 16) = v63;
      *(void *)(v67 + 24) = v64;
      sub_10001DED0(v66, v67 + v101);
      *(void *)(v67 + v98) = v58;
      aBlock[4] = (uint64_t)sub_10001DF14;
      uint64_t v120 = v67;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = (uint64_t)sub_100011138;
      aBlock[3] = (uint64_t)&unk_10003DFC8;
      uint64_t v68 = _Block_copy(aBlock);
      uint64_t v69 = v120;
      swift_bridgeObjectRetain(v61);
      uint64_t v70 = v62;
      swift_retain(v58);
      swift_release(v69);
      uint64_t v71 = String.utf8CString.getter(v113, v61);
      swift_bridgeObjectRelease(v61);
      swift_beginAccess(v58 + 16, aBlock, 33LL, 0LL);
      uint32_t v72 = notify_register_dispatch((const char *)(v71 + 32), (int *)(v58 + 16), v70, v68);
      swift_endAccess(aBlock);
      swift_release(v71);
      _Block_release(v68);

      uint64_t v73 = swift_retain(v58);
      uint64_t v74 = (os_log_s *)Logger.logObject.getter(v73);
      if (v72)
      {
        os_log_type_t v75 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v76 = swift_slowAlloc(14LL, -1LL);
          *(_DWORD *)uint64_t v76 = v96.n128_u32[0];
          *(_DWORD *)(v76 + 4) = v72;
          *(_WORD *)(v76 + 8) = 1024;
          *(_DWORD *)(v76 + 10) = *(_DWORD *)(v58 + 16);
          swift_release(v58);
          uint64_t v77 = v74;
          os_log_type_t v78 = v75;
          uint64_t v79 = "Notify setup result is not OK! { result=%u, token=%d }";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v77, v78, v79, (uint8_t *)v76, 0xEu);
          swift_slowDealloc(v76, -1LL, -1LL);
          goto LABEL_6;
        }
      }

      else
      {
        int v89 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v74, (os_log_type_t)v89))
        {
          uint64_t v76 = swift_slowAlloc(14LL, -1LL);
          *(void *)uint64_t v76 = v96.n128_u32[0];
          *(_WORD *)(v76 + 8) = 1024;
          *(_DWORD *)(v76 + 10) = *(_DWORD *)(v58 + 16);
          swift_release(v58);
          uint64_t v77 = v74;
          os_log_type_t v78 = v89;
          uint64_t v79 = "Notify setup result. { result=%u, token=%d }";
          goto LABEL_22;
        }
      }

      swift_release(v58);
LABEL_6:
      unint64_t v41 = v110;

      uint64_t v47 = *(unsigned int *)(v58 + 16);
      LOBYTE(aBlock[0]) = 0;
      uint64_t v48 = v103;
      uint64_t v49 = v104;
      sub_10002F5D8(v104, v47, v103);
      uint64_t v50 = v41[2];
      uint64_t v51 = v117;
      uint64_t v52 = sub_10001E188(v49, v117, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v52);
      uint64_t v54 = (char *)&v91 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_10001DED0(v51, (uint64_t)v54);
      uint64_t KeyPath = swift_getKeyPath(&unk_100035BC0, v54);
      swift_retain(v50);
      OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)(KeyPath, v48, v50);
      swift_release(v50);
      swift_release(KeyPath);
      uint64_t v45 = v49;
      sub_10001E100(v48);
      sub_10000B7BC(v49);
      swift_release(v58);
      uint64_t v43 = v107;
      uint64_t v44 = v108;
      uint64_t v46 = (uint64_t)v105;
      uint64_t v36 = v118;
      uint64_t v42 = v112;
LABEL_7:
      v39 += v114;
      if (!--v36) {
        goto LABEL_26;
      }
    }
  }

  swift_bridgeObjectRetain(v35);
  unint64_t v41 = a3;
LABEL_26:
  swift_release(v93);

  swift_bridgeObjectRelease(v92);
  return v41;
}

int64_t sub_10001C60C(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_10001C6F0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = a2;
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001LL) != 0)
  {
    if ((a3 & 1) != 0)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v8 = __CocoaSet.element(at:)(a1, a2, v7);
      uint64_t v28 = v8;
      uint64_t v9 = type metadata accessor for ClientServerInstance(0LL);
      swift_unknownObjectRetain(v8, v10);
      swift_dynamicCast(v27, &v28, (char *)&type metadata for Swift.AnyObject + 8, v9, 7LL);
      uint64_t v11 = v27[0];
      swift_unknownObjectRelease(v8);
      return v11;
    }

    goto LABEL_31;
  }

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_28;
    }

    if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
      goto LABEL_25;
    }
    __break(1u);
  }

  if (__CocoaSet.Index.age.getter(a1, a2) != *(_DWORD *)(a4 + 36))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    swift_release(v5);
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  uint64_t v12 = __CocoaSet.Index.element.getter(v6, v5);
  uint64_t v28 = v12;
  uint64_t v13 = type metadata accessor for ClientServerInstance(0LL);
  swift_unknownObjectRetain(v12, v14);
  swift_dynamicCast(v27, &v28, (char *)&type metadata for Swift.AnyObject + 8, v13, 7LL);
  uint64_t v5 = v27[0];
  swift_unknownObjectRelease(v12);
  Hasher.init(_seed:)(v27, *(void *)(a4 + 40));
  uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  Hasher._combine(_:)(*(_DWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  uint64_t v16 = *(void *)(v5 + 24);
  uint64_t v17 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v27, v16, v17);
  swift_bridgeObjectRelease(v17);
  Swift::Int v18 = Hasher._finalize()();
  uint64_t v19 = -1LL << *(_BYTE *)(a4 + 32);
  unint64_t v6 = v18 & ~v19;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0)
  {
LABEL_32:
    uint64_t result = swift_release(v5);
    __break(1u);
    return result;
  }

  uint64_t v20 = ~v19;
  int v21 = *(_DWORD *)(v5 + v15);
  uint64_t v22 = *(void *)(a4 + 48);
  uint64_t v23 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v24 = *(void *)(v22 + 8 * v6);
    if (*(_DWORD *)(v24 + v23) == v21) {
      break;
    }
LABEL_16:
    unint64_t v6 = (v6 + 1) & v20;
    if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
      goto LABEL_30;
    }
  }

  BOOL v25 = *(void *)(v24 + 24) == *(void *)(v5 + 24) && *(void *)(v24 + 32) == *(void *)(v5 + 32);
  if (!v25 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v23 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_16;
  }

  swift_release(v5);
LABEL_25:
  uint64_t v11 = *(void *)(*(void *)(a4 + 48) + 8 * v6);
  swift_retain(v11);
  return v11;
}

uint64_t sub_10001C978(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

void *sub_10001CA00(int a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = static Logger.service.getter(v14);
  *(void *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID) = &_swiftEmptyDictionarySingleton;
  uint64_t v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation;
  *(double *)((char *)a6 + v18) = static Double.now()(v17);
  uint64_t v19 = a2;
  uint64_t v20 = a4;
  *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) = a1;
  a6[3] = v19;
  a6[4] = a3;
  int v21 = (void *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  *int v21 = a5;
  v21[1] = &off_10003DAC8;
  a6[2] = a4;
  swift_bridgeObjectRetain(a3);
  id v22 = a5;
  uint64_t v23 = swift_retain(a4);
  Date.init()(v23);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))( (uint64_t)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate,  v16,  v12);
  swift_retain_n(a6, 2LL);
  swift_bridgeObjectRetain(a3);
  BOOL v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc(18LL, -1LL);
    uint64_t v28 = swift_slowAlloc(32LL, -1LL);
    uint64_t v32 = v28;
    *(_DWORD *)uint64_t v27 = 136380931;
    swift_bridgeObjectRetain(a3);
    uint64_t v31 = sub_100028CC4(v19, a3, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v27 + 4, v27 + 12);
    swift_bridgeObjectRelease_n(a3, 3LL);
    *(_WORD *)(v27 + 12) = 1024;
    int v29 = *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
    swift_release(a6);
    LODWORD(v31) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, v27 + 14, v27 + 18);
    swift_release(a6);
    _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "ClientServerInstance created. { processName=%{private}s, pid=%d",  (uint8_t *)v27,  0x12u);
    swift_arrayDestroy(v28, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v27, -1LL, -1LL);

    swift_release(v20);
  }

  else
  {
    swift_bridgeObjectRelease_n(a3, 2LL);

    swift_release(a4);
    swift_release_n(a6, 2LL);
  }

  return a6;
}

uint64_t sub_10001CCE4(uint64_t a1)
{
  uint64_t v56 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  unint64_t v4 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v5 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v60 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain(a1);
    unint64_t v7 = (void *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v7 - 1);
      uint64_t v10 = *v7;
      swift_bridgeObjectRetain_n(*v7, 2LL);
      v11._id countAndFlagsBits = 1668179246LL;
      v11._object = (void *)0xE400000000000000LL;
      Swift::Bool v12 = String.hasSuffix(_:)(v11);
      uint64_t v13 = static DeviceUtilities.currentPlatform.getter();
      uint64_t v15 = v14;
      uint64_t v16 = type metadata accessor for Config(0LL);
      swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
      uint64_t v17 = Config.init(configPath:allowUnknownFields:platform:encrypted:)(v9, v10, 1LL, v13, v15, v12);
      uint64_t v18 = swift_bridgeObjectRelease(v10);
      if (v17)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
        unint64_t v20 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v19 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v20 >= v19 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1LL);
        }
        uint64_t v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v17);
        specialized Array._endMutation()(v8);
      }

      v7 += 2;
      --v6;
    }

    while (v6);
    swift_bridgeObjectRelease(a1);
    unint64_t v5 = v60;
  }

  unint64_t v60 = v5;
  uint64_t v21 = type metadata accessor for Config(0LL);
  uint64_t v22 = static Config.defaultConfigPathEncrypted.getter();
  uint64_t v24 = v23;
  uint64_t v25 = static DeviceUtilities.currentPlatform.getter();
  uint64_t v27 = v26;
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  uint64_t v28 = Config.init(configPath:allowUnknownFields:platform:encrypted:)(v22, v24, 0LL, v25, v27, 1LL);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = swift_retain(v28);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v30);
    unint64_t v32 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v31 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    if (v32 >= v31 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1LL);
    }
    uint64_t v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v29);
    specialized Array._endMutation()(v33);
    swift_release(v29);
    unint64_t v5 = v60;
  }

  if ((v5 & 0x8000000000000000LL) != 0 || (v5 & 0x4000000000000000LL) != 0)
  {
    swift_bridgeObjectRetain(v5);
    uint64_t v34 = (uint64_t)sub_10000DDDC(v52);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v34 = v5 & 0xFFFFFFFFFFFFFF8LL;
    swift_bridgeObjectRetain(v5);
  }

  uint64_t v59 = v34;
  sub_1000186F4(&v59);
  swift_bridgeObjectRelease(v5);
  uint64_t v35 = v59;
  if ((v59 & 0x8000000000000000LL) == 0 && (v59 & 0x4000000000000000LL) == 0)
  {
    uint64_t v36 = *(void *)(v59 + 16);
    if (v36) {
      goto LABEL_19;
    }
LABEL_30:
    swift_release(v35);
    return 0LL;
  }

  swift_bridgeObjectRetain(v59);
  uint64_t v36 = _CocoaArrayWrapper.endIndex.getter(v53);
  swift_release(v35);
  if (!v36) {
    goto LABEL_30;
  }
LABEL_19:
  unint64_t v37 = v36 - 1;
  if (__OFSUB__(v36, 1LL))
  {
    __break(1u);
    goto LABEL_33;
  }

  if ((v35 & 0xC000000000000001LL) != 0)
  {
LABEL_33:
    uint64_t v38 = specialized _ArrayBuffer._getElementSlowPath(_:)(v37, v35);
    goto LABEL_24;
  }

  if ((v37 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (v37 < *(void *)(v35 + 16))
  {
    uint64_t v38 = *(void *)(v35 + 8 * v37 + 32);
    swift_retain(v38);
LABEL_24:
    uint64_t v39 = swift_release(v35);
    static Logger.config.getter(v39);
    uint64_t v40 = swift_retain_n(v38, 4LL);
    unint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc(22LL, -1LL);
      uint64_t v44 = swift_slowAlloc(64LL, -1LL);
      uint64_t v59 = v44;
      *(_DWORD *)uint64_t v43 = 136380931;
      uint64_t v45 = Config.configPath.getter();
      unint64_t v47 = v46;
      uint64_t v57 = sub_100028CC4(v45, v46, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, v43 + 4, v43 + 12);
      swift_release_n(v38, 2LL);
      uint64_t v48 = swift_bridgeObjectRelease(v47);
      *(_WORD *)(v43 + 12) = 2081;
      uint64_t v49 = Config.sortableConfigVersion.getter(v48);
      unint64_t v51 = v50;
      uint64_t v57 = sub_100028CC4(v49, v50, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, v43 + 14, v43 + 22);
      swift_release_n(v38, 2LL);
      swift_bridgeObjectRelease(v51);
      _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "Server.findConfig returning. { path=%{private}s, configVersion=%{private}s }",  (uint8_t *)v43,  0x16u);
      swift_arrayDestroy(v44, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1LL, -1LL);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    else
    {

      swift_release_n(v38, 4LL);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v56);
    return v38;
  }

  __break(1u);
  uint64_t result = swift_release(v59);
  __break(1u);
  return result;
}

void sub_10001D188(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = __CocoaSet.makeIterator()(v4);
    uint64_t v6 = sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
    unint64_t v7 = sub_10001DCD4();
    uint64_t v8 = Set.Iterator.init(_cocoa:)(v30, v5, v6, v7);
    uint64_t v3 = v30[0];
    uint64_t v28 = v30[1];
    uint64_t v9 = v30[2];
    uint64_t v10 = v30[3];
    unint64_t v11 = v30[4];
  }

  else
  {
    uint64_t v12 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v28 = a1 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1LL << v13);
    }
    else {
      uint64_t v14 = -1LL;
    }
    unint64_t v11 = v14 & *(void *)(a1 + 56);
    uint64_t v8 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v10 = 0LL;
  }

  int64_t v27 = (unint64_t)(v9 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_13;
  }
LABEL_11:
  if (v11)
  {
    uint64_t v15 = (v11 - 1) & v11;
    unint64_t v16 = __clz(__rbit64(v11)) | (v10 << 6);
    uint64_t v17 = v10;
    goto LABEL_32;
  }

  int64_t v23 = v10 + 1;
  if (!__OFADD__(v10, 1LL))
  {
    if (v23 < v27)
    {
      unint64_t v24 = *(void *)(v28 + 8 * v23);
      uint64_t v17 = v10 + 1;
      if (v24) {
        goto LABEL_31;
      }
      uint64_t v17 = v10 + 2;
      if (v10 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v17);
      if (v24) {
        goto LABEL_31;
      }
      uint64_t v17 = v10 + 3;
      if (v10 + 3 >= v27) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v17);
      if (v24) {
        goto LABEL_31;
      }
      uint64_t v17 = v10 + 4;
      if (v10 + 4 >= v27) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v17);
      if (v24)
      {
LABEL_31:
        uint64_t v15 = (v24 - 1) & v24;
        unint64_t v16 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_32:
        for (i = *(id *)(*(void *)(v3 + 48) + 8 * v16); i; uint64_t v15 = v11)
        {
          unsigned int v26 = [i processIdentifier];
          if (v26 == *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid)) {
            break;
          }

          uint64_t v10 = v17;
          unint64_t v11 = v15;
          if ((v3 & 0x8000000000000000LL) == 0) {
            goto LABEL_11;
          }
LABEL_13:
          uint64_t v18 = __CocoaSet.Iterator.next()(v8);
          if (!v18) {
            break;
          }
          uint64_t v19 = v18;
          uint64_t v29 = v18;
          uint64_t v20 = sub_10001DC24(0LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
          swift_unknownObjectRetain(v19, v21);
          swift_dynamicCast(&v31, &v29, (char *)&type metadata for Swift.AnyObject + 8, v20, 7LL);
          id i = v31;
          swift_unknownObjectRelease(v19);
          uint64_t v17 = v10;
        }

        goto LABEL_36;
      }

      uint64_t v17 = v10 + 5;
      if (v10 + 5 < v27)
      {
        unint64_t v24 = *(void *)(v28 + 8 * v17);
        if (!v24)
        {
          uint64_t v25 = v10 + 6;
          while (v27 != v25)
          {
            unint64_t v24 = *(void *)(v28 + 8 * v25++);
            if (v24)
            {
              uint64_t v17 = v25 - 1;
              goto LABEL_31;
            }
          }

          goto LABEL_36;
        }

        goto LABEL_31;
      }
    }

LABEL_36:
    sub_10000E404(v3);
    return;
  }

  __break(1u);
}

  swift_release(v8);
  uint64_t v3 = v41;
  if ((v44 & 1) != 0)
  {
    uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
    if (v39 >= 64) {
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      *uint64_t v43 = -1LL << v39;
    }
    *(void *)(v8 + swift_weakDestroy(v0 + 16) = 0LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10001D478(void *a1)
{
  unsigned int v34 = [a1 processIdentifier];
  uint64_t v35 = static Utilities.processName(for:)([a1 processIdentifier]);
  if (!v3) {
    uint64_t v35 = static Constants.unknown.getter();
  }
  unint64_t v4 = v3;
  int v5 = [a1 processIdentifier];
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_config];
  uint64_t v7 = type metadata accessor for ClientServerInstance(0LL);
  uint64_t v8 = (void *)swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  swift_bridgeObjectRetain(v4);
  swift_retain(v6);
  uint64_t v9 = v1;
  uint64_t v10 = sub_10001CA00(v5, v35, v4, v6, v9, v8);
  id v11 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP15audioanalyticsd14ServerProtocol_];
  [a1 setExportedInterface:v11];

  [a1 setExportedObject:v10];
  uint64_t v12 = *(dispatch_queue_s **)&v9[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  uint64_t v13 = (void *)swift_allocObject(&unk_10003DB00, 40LL, 7LL);
  v13[2] = v9;
  v13[3] = v10;
  v13[4] = a1;
  uint64_t v14 = swift_allocObject(&unk_10003DB28, 32LL, 7LL);
  *(void *)(v14 + swift_weakDestroy(v0 + 16) = sub_10001DA00;
  *(void *)(v14 + 24) = v13;
  unint64_t v41 = sub_10001DA1C;
  uint64_t v42 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256LL;
  uint64_t v39 = sub_100016C50;
  uint64_t v40 = &unk_10003DB40;
  uint64_t v15 = _Block_copy(&aBlock);
  uint64_t v16 = v42;
  uint64_t v17 = v9;
  swift_retain(v10);
  id v18 = a1;
  swift_retain(v14);
  swift_release(v16);
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation(v14, "", 99LL, 356LL, 26LL, 1LL);
  uint64_t result = swift_release(v14);
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v20 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    swift_unknownObjectWeakInit(v20 + 16, v17);
    uint64_t v21 = swift_allocObject(&unk_10003DBA0, 56LL, 7LL);
    *(void *)(v21 + swift_weakDestroy(v0 + 16) = v20;
    *(_DWORD *)(v21 + 24) = v34;
    *(void *)(v21 + 32) = v35;
    *(void *)(v21 + 40) = v4;
    *(void *)(v21 + 48) = v10;
    unint64_t v41 = sub_10001DAAC;
    uint64_t v42 = v21;
    aBlock = _NSConcreteStackBlock;
    uint64_t v38 = 1107296256LL;
    uint64_t v39 = sub_1000172EC;
    uint64_t v40 = &unk_10003DBB8;
    uint64_t v22 = _Block_copy(&aBlock);
    uint64_t v23 = v42;
    swift_bridgeObjectRetain(v4);
    swift_retain(v10);
    swift_release(v23);
    [v18 setInterruptionHandler:v22];
    _Block_release(v22);
    uint64_t v24 = swift_allocObject(&unk_10003DB78, 24LL, 7LL);
    swift_unknownObjectWeakInit(v24 + 16, v17);
    uint64_t v25 = swift_allocObject(&unk_10003DBF0, 60LL, 7LL);
    *(void *)(v25 + swift_weakDestroy(v0 + 16) = v24;
    *(void *)(v25 + 24) = v10;
    *(void *)(v25 + 32) = v18;
    *(void *)(v25 + 40) = v35;
    *(void *)(v25 + 48) = v4;
    *(_DWORD *)(v25 + swift_weakDestroy(v0 + 56) = v34;
    unint64_t v41 = sub_10001DAFC;
    uint64_t v42 = v25;
    aBlock = _NSConcreteStackBlock;
    uint64_t v38 = 1107296256LL;
    uint64_t v39 = sub_1000172EC;
    uint64_t v40 = &unk_10003DC08;
    unsigned int v26 = _Block_copy(&aBlock);
    uint64_t v27 = v42;
    swift_bridgeObjectRetain(v4);
    swift_retain(v10);
    id v28 = v18;
    swift_release(v27);
    [v28 setInvalidationHandler:v26];
    _Block_release(v26);
    swift_bridgeObjectRetain(v4);
    id v29 = v28;
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc(18LL, -1LL);
      uint64_t v33 = (void **)swift_slowAlloc(32LL, -1LL);
      aBlock = v33;
      *(_DWORD *)uint64_t v32 = 67174915;
      LODWORD(v36) = [v29 processIdentifier];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, (char *)&v36 + 4, v32 + 4, v32 + 8);

      *(_WORD *)(v32 + 8) = 2081;
      swift_bridgeObjectRetain(v4);
      uint64_t v36 = sub_100028CC4(v35, v4, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &aBlock, v32 + 10, v32 + 18);
      swift_bridgeObjectRelease_n(v4, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "New connection. { pid=%{private}d, clientProcessName=%{private}s }",  (uint8_t *)v32,  0x12u);
      swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1LL, -1LL);
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v4, 2LL);
    }

    [v29 activate];
    swift_release(v13);
    swift_release(v10);
    return 1LL;
  }

  return result;
}

uint64_t sub_10001D9CC()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_10001DA00()
{
}

uint64_t sub_10001DA0C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001DA1C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001DA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001DA4C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10001DA54()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001DA78()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10001DAAC()
{
  return sub_100016C70( *(void *)(v0 + 16),  *(_DWORD *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(void *)(v0 + 48));
}

uint64_t sub_10001DAC0()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 60LL, 7LL);
}

uint64_t sub_10001DAFC()
{
  return sub_100017318( *(void *)(v0 + 16),  *(void *)(v0 + 24),  *(void **)(v0 + 32),  *(void *)(v0 + 40),  *(void *)(v0 + 48),  *(_DWORD *)(v0 + 56));
}

uint64_t sub_10001DB10()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

unint64_t sub_10001DB34()
{
  return sub_10001793C(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_10001DB40()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_10001DB7C()
{
}

uint64_t sub_10001DB90()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001DBBC()
{
  return sub_1000159FC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001DBC4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_10001DBD0()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_10001DC04()
{
}

uint64_t sub_10001DC14()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001DC24(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10001DC5C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100006108(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10001DC9C()
{
  return sub_1000144A0(60LL, 0LL);
}

void sub_10001DCC4()
{
}

uint64_t sub_10001DCCC()
{
  return sub_100015E80(v0);
}

unint64_t sub_10001DCD4()
{
  unint64_t result = qword_100041C28;
  if (!qword_100041C28)
  {
    uint64_t v1 = sub_10001DC24(255LL, &qword_100041BD0, &OBJC_CLASS___NSXPCConnection_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100041C28);
  }

  return result;
}

void sub_10001DD2C()
{
}

void sub_10001DD38()
{
}

uint64_t sub_10001DD44()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10001DD68()
{
  return sub_100015A5C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10001DD74()
{
  return swift_deallocObject(v0, 20LL, 7LL);
}

uint64_t sub_10001DD84()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001DDA8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001DDCC()
{
  uint64_t v1 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 24));
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  swift_bridgeObjectRelease(*(void *)(v7 + v1[5] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[6] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[7] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[8] + 8));
  uint64_t v9 = v7 + v1[9];
  uint64_t v10 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10001DED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureInfo(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001DF14(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for FeatureInfo(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_10002E518( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  v1 + v4,  *(char **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10001DF68()
{
  return sub_1000061B8(&qword_100041C40, type metadata accessor for FeatureInfo, (uint64_t)&unk_100035E88);
}

uint64_t sub_10001DF94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100013420(a2, *a1, a3);
}

unint64_t sub_10001DFA8()
{
  return (*(void *)(*(void *)(type metadata accessor for FeatureInfo(0LL) - 8) + 64LL) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
}

uint64_t sub_10001DFDC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  uint64_t v3 = (int *)type metadata accessor for FeatureInfo(0LL);
  swift_bridgeObjectRelease(*(void *)(a1 + v3[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[8] + 8));
  uint64_t v4 = a1 + v3[9];
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_10001E080(uint64_t a1, uint64_t a2)
{
  return type metadata accessor for FeatureInfo(0LL);
}

uint64_t sub_10001E0A0(uint64_t a1, uint64_t a2)
{
  return sub_10003337C(a2, a1);
}

Swift::Int sub_10001E0B0()
{
  return sub_100032008();
}

uint64_t sub_10001E0D0(uint64_t a1, uint64_t a2)
{
  return sub_10001DED0(a1, a2);
}

uint64_t sub_10001E100(uint64_t a1)
{
  uint64_t v2 = sub_100005EA4((uint64_t *)&unk_100041C30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001E140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EA4((uint64_t *)&unk_100041C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E188(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001E1CC()
{
  uint64_t v1 = type metadata accessor for Message(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10001E240()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Message(0LL) - 8) + 80LL);
  sub_100015020(*(void *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_10001E270()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001E294(uint64_t a1)
{
  return sub_100016890(a1);
}

uint64_t sub_10001E324()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Logger.session.getter(v4);
  uint64_t v7 = swift_retain(v1);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v10 = 134217984;
    uint64_t v22 = *(void *)(v1 + 24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v10 + 4, v10 + 12);
    swift_release(v1);
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "requestMessage(): Flushing all requests. { reporterID=%lld }",  v10,  0xCu);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {

    swift_release(v1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  swift_beginAccess(v1 + 16, &v22, 0LL, 0LL);
  uint64_t v11 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain(v11);
  sub_10001EDAC(v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease(v11);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain(v14);
    uint64_t v16 = (uint64_t *)(v14 + 40);
    do
    {
      id v18 = (void (*)(uint64_t *, uint64_t *))*(v16 - 1);
      uint64_t v17 = *v16;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      swift_retain(v17);
      v18(&v21, &v20);
      swift_release(v17);
      v16 += 2;
      --v15;
    }

    while (v15);
    swift_bridgeObjectRelease(v14);
  }

  return swift_bridgeObjectRelease(v14);
}

uint64_t sub_10001E4F0()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t _s16RetainedMessagesCMa()
{
  return objc_opt_self(&OBJC_CLASS____TtCC15audioanalyticsd7Session16RetainedMessages);
}

uint64_t sub_10001E538(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Message(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (uint8_t *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v15 = v14((char *)&v36 - v12, a1, v7);
  uint64_t v16 = Message.category.getter(v15);
  unsigned int v17 = v16;
  unsigned __int16 v18 = Message.type.getter(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  uint64_t v19 = sub_10001E8F0(v17 | ((unint64_t)v18 << 32));
  uint64_t v20 = v19 + 2;
  uint64_t v21 = swift_beginAccess(v19 + 2, v42, 0LL, 0LL);
  if (*(void *)(v19[2] + 16LL))
  {
    static Logger.session.getter(v21);
    uint64_t v22 = swift_retain(v2);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.default.getter();
    uint64_t v7 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v11 = 134217984;
      uint64_t v40 = *(void *)(v2 + 24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v11 + 4, v11 + 12);
      swift_release(v2);
      _os_log_impl( (void *)&_mh_execute_header,  v23,  (os_log_type_t)v7,  "sendMesssage(): Stored message found callback. Calling callback. { reporterID=%lld }",  v11,  0xCu);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    else
    {

      swift_release(v2);
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v38);
    swift_beginAccess(v20, &v40, 33LL, 0LL);
    uint64_t v31 = *v20;
    if (*(void *)(*v20 + 16LL))
    {
      uint64_t v33 = *(void (**)(uint64_t *, uint64_t *))(v31 + 32);
      uint64_t v32 = *(void **)(v31 + 40);
      swift_retain(v32);
      sub_100022294(0LL, 1LL);
      swift_endAccess(&v40);
      uint64_t v34 = sub_10001F044();
      uint64_t v35 = Message.flattenToAnyDictionary()(v34);
      uint64_t v39 = v35;
      uint64_t v40 = 0LL;
      v33(&v40, &v39);
      swift_bridgeObjectRelease(v35);
      swift_release(v19);
      uint64_t v30 = v32;
      return swift_release(v30);
    }

    __break(1u);
  }

  else
  {
    v14((char *)v11, a1, v7);
    uint64_t v23 = (os_log_s *)(v19 + 3);
    swift_beginAccess(v19 + 3, &v40, 33LL, 0LL);
    a1 = v19[3];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a1);
    v19[3] = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0) {
      goto LABEL_5;
    }
  }

  a1 = sub_100028ABC(0, *(void *)(a1 + 16) + 1LL, 1, a1);
  *(void *)uint64_t v23 = a1;
LABEL_5:
  unint64_t v27 = *(void *)(a1 + 16);
  unint64_t v26 = *(void *)(a1 + 24);
  if (v27 >= v26 >> 1)
  {
    a1 = sub_100028ABC(v26 > 1, v27 + 1, 1, a1);
    *(void *)uint64_t v23 = a1;
  }

  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v27 + 1;
  (*(void (**)(unint64_t, uint8_t *, uint64_t))(v8 + 32))( a1 + ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
  + *(void *)(v8 + 72) * v27,
    v11,
    v7);
  uint64_t v28 = *(void *)v23;
  swift_endAccess(&v40);
  if (*(void *)(v28 + 16) < 0xBuLL) {
    goto LABEL_10;
  }
  uint64_t result = swift_beginAccess(v23, &v40, 33LL, 0LL);
  if (*(void *)(*(void *)v23 + 16LL))
  {
    sub_100022404(0LL, 1LL);
    swift_endAccess(&v40);
LABEL_10:
    uint64_t v30 = v19;
    return swift_release(v30);
  }

  __break(1u);
  return result;
}

void *sub_10001E8F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + 16;
  swift_beginAccess(v1 + 16, v16, 32LL, 0LL);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (*(void *)(v5 + 16) && (unint64_t v7 = sub_10001F59C(v6), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void **)(*(void *)(v5 + 56) + 8 * v7);
    swift_endAccess(v16);
    swift_retain(v9);
  }

  else
  {
    swift_endAccess(v16);
    uint64_t v10 = *(void *)(v2 + 24);
    uint64_t v11 = _s16RetainedMessagesC12MessageQueueCMa();
    uint64_t v9 = (void *)swift_allocObject(v11, 40LL, 7LL);
    v9[4] = v10;
    v9[2] = &_swiftEmptyArrayStorage;
    v9[3] = &_swiftEmptyArrayStorage;
    swift_beginAccess(v4, v16, 33LL, 0LL);
    swift_retain(v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v2 + 16));
    uint64_t v15 = *(void *)(v2 + 16);
    *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = 0x8000000000000000LL;
    sub_100020658((uint64_t)v9, v6, isUniquelyReferenced_nonNull_native);
    uint64_t v13 = *(void *)(v2 + 16);
    *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v15;
    swift_bridgeObjectRelease(v13);
    swift_endAccess(v16);
  }

  return v9;
}

void sub_10001EA0C(char **a1, uint64_t a2, unsigned int a3, unsigned __int16 a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Message(0LL);
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v38 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = *(char **)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v17 = sub_10001E8F0(a3 | ((unint64_t)a4 << 32));
  unsigned __int16 v18 = v17 + 3;
  swift_beginAccess(v17 + 3, v41, 0LL, 0LL);
  if (!*(void *)(v17[3] + 16LL))
  {
    uint64_t v21 = (os_log_s *)swift_allocObject(&unk_10003E150, 32LL, 7LL);
    *((void *)v21 + 2) = a1;
    *((void *)v21 + 3) = a2;
    uint64_t v25 = (char **)(v17 + 2);
    swift_beginAccess(v17 + 2, &v39, 33LL, 0LL);
    uint64_t v14 = (char *)v17[2];
    swift_retain(a2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
    v17[2] = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
LABEL_5:
      unint64_t v28 = *((void *)v14 + 2);
      unint64_t v27 = *((void *)v14 + 3);
      if (v28 >= v27 >> 1)
      {
        uint64_t v14 = sub_100028994((char *)(v27 > 1), v28 + 1, 1, v14);
        *uint64_t v25 = v14;
      }

      *((void *)v14 + 2) = v28 + 1;
      id v29 = &v14[16 * v28];
      *((void *)v29 + 4) = sub_100022780;
      *((void *)v29 + 5) = v21;
      swift_endAccess(&v39);
      sub_10001F044();
      swift_release(v17);
      return;
    }

void sub_10001EDAC(uint64_t a1)
{
  uint64_t v16 = _swiftEmptyArrayStorage;
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v7 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }

    int64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v12 >= v6) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v7;
    if (!v13)
    {
      int64_t v7 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v7);
      if (!v13)
      {
        int64_t v7 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v2 + 8 * v7);
        if (!v13)
        {
          int64_t v7 = v12 + 3;
          if (v12 + 3 >= v6) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v2 + 8 * v7);
          if (!v13) {
            break;
          }
        }
      }
    }

LABEL_25:
  __break(1u);
}

        uint64_t v16 = (v23 - 1) & v23;
        uint64_t v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }

      uint64_t v25 = *(_DWORD *)(*(void *)(v9 + 48) + 4 * v21);
      unint64_t v26 = *(void *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(void *)(v9 + 56) + v26 * v21, v41);
      Hasher.init(_seed:)(v42, *(void *)(v11 + 40));
      Hasher._combine(_:)(v25);
      uint64_t result = Hasher._finalize()();
      unint64_t v27 = -1LL << *(_BYTE *)(v11 + 32);
      unint64_t v28 = result & ~v27;
      id v29 = v28 >> 6;
      if (((-1LL << v28) & ~*(void *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        uint64_t v19 = __clz(__rbit64((-1LL << v28) & ~*(void *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        __n128 v30 = 0;
        uint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          uint64_t v32 = v29 == v31;
          if (v29 == v31) {
            id v29 = 0LL;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v17 + 8 * v29);
        }

        while (v33 == -1);
        uint64_t v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }

      *(void *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
      *(_DWORD *)(*(void *)(v11 + 48) + 4 * v19) = v25;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v11 + 56) + v26 * v19,  v8,  v41);
      ++*(void *)(v11 + 16);
    }
  }

  uint64_t result = swift_release(v9);
LABEL_42:
  *uint64_t v3 = v11;
  return result;
}

    int64_t v12 = (v19 - 1) & v19;
    uint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unsigned int v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + vswift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + vswift_unknownObjectWeakDestroy(v0 + 16) = v17;
    uint64_t result = (void *)swift_retain(v17);
  }

  uint64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  uint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    unint64_t v9 = v20;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }

    int64_t v14 = (v26 - 1) & v26;
    unsigned int v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    unsigned __int16 v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v17);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    os_log_type_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v22, v15);
    BOOL v23 = v35;
    os_log_type_t v24 = (void *)(*(void *)(v35 + 48) + v18);
    *os_log_type_t v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v3, v15);
    uint64_t result = (void *)swift_bridgeObjectRetain(v20);
  }

  unint64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v4);
    unint64_t v28 = v31;
    id v29 = v35;
    goto LABEL_28;
  }

  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    uint64_t v11 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

    int64_t v12 = (v22 - 1) & v22;
    uint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unsigned int v17 = *(void *)(v2 + 48) + v16;
    unsigned __int16 v18 = *(_DWORD *)v17;
    LOWORD(v17) = *(_WORD *)(v17 + 4);
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(_DWORD *)uint64_t v20 = v18;
    *(_WORD *)(v20 + 4) = v17;
    *(void *)(*(void *)(v4 + 56) + vswift_unknownObjectWeakDestroy(v0 + 16) = v19;
    uint64_t result = (void *)swift_retain(v19);
  }

  BOOL v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  os_log_type_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    unint64_t v9 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    os_log_type_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

    int64_t v14 = (v21 - 1) & v21;
    uint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    unsigned int v17 = 4 * v16;
    unsigned __int16 v18 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v16);
    uint64_t v19 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v19, v1);
    *(_DWORD *)(*(void *)(v7 + 48) + v17) = v18;
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))( *(void *)(v7 + 56) + v19,  v4,  v1);
  }

  os_log_type_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  uint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    uint64_t v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    uint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

  uint64_t v21 = 2;
  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v21,  1046LL,  0);
  __break(1u);
  return result;
}

  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
LABEL_26:
  uint64_t v70 = 0LL;
  uint64_t v71 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(30LL);
  v59._object = (void *)0x8000000100037490LL;
  v59._id countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v59);
  _print_unlocked<A, B>(_:_:)( &v72,  &v70,  &type metadata for String,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v60._id countAndFlagsBits = 39LL;
  v60._object = (void *)0xE100000000000000LL;
  String.append(_:)(v60);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v70,  v71,  "Swift/NativeDictionary.swift",  28LL,  2LL,  783LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_10001EF34()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  Swift::UInt16 v2 = *(_WORD *)(v0 + 4);
  Hasher.init(_seed:)(v4, 0LL);
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10001EF90()
{
  Swift::UInt16 v1 = *(_WORD *)(v0 + 4);
  Hasher._combine(_:)(*(_DWORD *)v0);
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10001EFCC(uint64_t a1)
{
  Swift::UInt32 v2 = *(_DWORD *)v1;
  Swift::UInt16 v3 = *(_WORD *)(v1 + 4);
  Hasher.init(_seed:)(v5, a1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

BOOL sub_10001F024(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(unsigned __int16 *)(a1 + 4) == *(unsigned __int16 *)(a2 + 4);
}

uint64_t sub_10001F044()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v6 = (uint64_t *)(v0 + 16);
  uint64_t result = swift_beginAccess(v6, v20, 0LL, 0LL);
  if (*(void *)(*(void *)(v1 + 16) + 16LL) >= 0xBuLL)
  {
    uint64_t result = swift_beginAccess(v6, &v18, 33LL, 0LL);
    uint64_t v8 = *v6;
    if (*(void *)(*v6 + 16))
    {
      uint64_t v10 = *(void (**)(uint64_t *, uint64_t *))(v8 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      swift_retain(v9);
      sub_100022294(0LL, 1LL);
      uint64_t v11 = swift_endAccess(&v18);
      static Logger.session.getter(v11);
      uint64_t v12 = swift_retain(v1);
      unint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
      os_log_type_t v14 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v15 = 134217984;
        uint64_t v18 = *(void *)(v1 + 32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v15 + 4, v15 + 12);
        swift_release(v1);
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "requestMessage(): Exceeded stored callback cache. Flushing oldest callback. { reporterID=%lld }",  v15,  0xCu);
        swift_slowDealloc(v15, -1LL, -1LL);
      }

      else
      {

        swift_release(v1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      v10(&v18, &v17);
      return swift_release(v9);
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_10001F21C()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t _s16RetainedMessagesC12MessageQueueCMa()
{
  return objc_opt_self(&OBJC_CLASS____TtCCC15audioanalyticsd7Session16RetainedMessages12MessageQueue);
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwCP(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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

  *(_BYTE *)(result + 6) = v3;
  return result;
}

ValueMetadata *_s16RetainedMessagesC16CategoryTypePairVMa()
{
  return &_s16RetainedMessagesC16CategoryTypePairVN;
}

unint64_t sub_10001F2E0()
{
  unint64_t result = qword_100041E08;
  if (!qword_100041E08)
  {
    unint64_t result = swift_getWitnessTable("݄", &_s16RetainedMessagesC16CategoryTypePairVN);
    atomic_store(result, (unint64_t *)&qword_100041E08);
  }

  return result;
}

unint64_t sub_10001F324(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100020F9C(a1, a2, v5);
}

unint64_t sub_10001F388(Swift::UInt32 a1)
{
  Swift::Int v3 = Hasher._finalize()();
  return sub_10002107C(a1, v3);
}

unint64_t sub_10001F3E0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v4 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v22, v3, v4);
  Swift::Int v5 = (int *)type metadata accessor for FeatureInfo(0LL);
  int64_t v6 = (uint64_t *)(a1 + v5[5]);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(v22, v7, v8);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = (uint64_t *)(a1 + v5[6]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v22, v10, v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = (uint64_t *)(a1 + v5[7]);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v22, v13, v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = (uint64_t *)(a1 + v5[8]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v22, v16, v17);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v19 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v22, v18, v19);
  Swift::Int v20 = Hasher._finalize()();
  return sub_100021118(a1, v20);
}

unint64_t sub_10001F56C(uint64_t a1)
{
  uint64_t v3 = static Hasher._hash(seed:_:)(*(void *)(v1 + 40), a1);
  return sub_100021444(a1, v3);
}

unint64_t sub_10001F59C(unint64_t a1)
{
  unint64_t v3 = HIDWORD(a1);
  Hasher.init(_seed:)(v6, *(void *)(v1 + 40));
  Hasher._combine(_:)(a1);
  Hasher._combine(_:)(v3);
  Swift::Int v4 = Hasher._finalize()();
  return sub_1000214E0(a1 & 0xFFFFFFFFFFFFLL, v4);
}

uint64_t sub_10001F604(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005EA4(&qword_100041E18);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v9 = 0LL;
    uint64_t v10 = (uint64_t *)(v5 + 64);
    uint64_t v11 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v33 = -1LL << v11;
    uint64_t v34 = v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v13 = v12 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }

      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v22 >= v35) {
          goto LABEL_36;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_36;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v34 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v35);
                }
                else {
                  uint64_t *v10 = v33;
                }
                *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_44;
                }
                if (v9 >= v35) {
                  goto LABEL_36;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v9 = v24;
          }
        }

LABEL_33:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }

      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(v5 + 56);
      uint64_t v31 = *(void *)(*(void *)(v5 + 48) + v29);
      uint64_t v32 = *(void *)(v30 + v29);
      if ((a2 & 1) == 0) {
        swift_retain(*(void *)(v30 + v29));
      }
      uint64_t result = static Hasher._hash(seed:_:)(*(void *)(v8 + 40), v31);
      uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }

        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }

      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v31;
      *(void *)(*(void *)(v8 + 56) + v19) = v32;
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *unint64_t v3 = v8;
  return result;
}

        uint64_t v12 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }

      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(v5 + 48) + v29;
      uint64_t v31 = *(_DWORD *)v30;
      uint64_t v32 = *(_WORD *)(v30 + 4);
      uint64_t v33 = *(void *)(*(void *)(v5 + 56) + v29);
      if ((v37 & 1) == 0) {
        swift_retain(v33);
      }
      Hasher.init(_seed:)(v38, *(void *)(v8 + 40));
      Hasher._combine(_:)(v31);
      Hasher._combine(_:)(v32);
      uint64_t result = Hasher._finalize()();
      uint64_t v14 = -1LL << *(_BYTE *)(v8 + 32);
      uint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v16);
        }

        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }

      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      unint64_t v18 = 8 * v17;
      uint64_t v19 = *(void *)(v8 + 48) + v18;
      *(_DWORD *)uint64_t v19 = v31;
      *(_WORD *)(v19 + 4) = v32;
      *(void *)(*(void *)(v8 + 56) + v18) = v33;
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *unint64_t v3 = v8;
  return result;
}

  unint64_t v26 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v26,  1046LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_10001F8B8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v46 = type metadata accessor for SimpleType(0LL);
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100005EA4(&qword_100041690);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v41 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v42) {
      goto LABEL_36;
    }
    unint64_t v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v23 = v43[v17];
      if (!v23) {
        break;
      }
    }

LABEL_41:
  Swift::Int result = swift_release(v8);
  *unint64_t v3 = v10;
  return result;
}

Swift::Int sub_10001FC20(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  Swift::Int v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005EA4(&qword_100041680);
  char v37 = a2;
  Swift::Int result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  Swift::Int v8 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v9 = 0LL;
    unint64_t v36 = (void *)(v5 + 64);
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    Swift::Int v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v20 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }

      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        Swift::Int result = v5 + 64;
        if (v22 >= v35) {
          goto LABEL_36;
        }
        unint64_t v23 = v36[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_36;
          }
          unint64_t v23 = v36[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((v37 & 1) != 0)
              {
                uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *unint64_t v36 = -1LL << v34;
                }
                *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_44;
                }
                if (v9 >= v35) {
                  goto LABEL_36;
                }
                unint64_t v23 = v36[v9];
                ++v24;
                if (v23) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v9 = v24;
          }
        }

Swift::Int sub_10001FF20(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v41 = type metadata accessor for Message(0LL);
  uint64_t v6 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  Swift::Int v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Swift::Int v9 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100005EA4(&qword_1000416B8);
  Swift::Int result = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  Swift::Int v11 = result;
  if (*(void *)(v9 + 16))
  {
    unint64_t v36 = v3;
    int64_t v12 = 0LL;
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    uint64_t v14 = 1LL << *(_BYTE *)(v9 + 32);
    if (v14 < 64) {
      uint64_t v15 = ~(-1LL << v14);
    }
    else {
      uint64_t v15 = -1LL;
    }
    unint64_t v16 = v15 & v13;
    int64_t v38 = (unint64_t)(v14 + 63) >> 6;
    Swift::Int v17 = result + 64;
    int v37 = a2;
    uint64_t v18 = 16LL;
    if ((a2 & 1) != 0) {
      uint64_t v18 = 32LL;
    }
    uint64_t v40 = v18;
    while (1)
    {
      if (v16)
      {
        unint64_t v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        unint64_t v21 = v20 | (v12 << 6);
      }

      else
      {
        int64_t v22 = v12 + 1;
        if (__OFADD__(v12, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        Swift::Int result = (Swift::Int)v39;
        if (v22 >= v38) {
          goto LABEL_35;
        }
        unint64_t v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          int64_t v12 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_35;
          }
          unint64_t v23 = v39[v12];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_35:
              if ((v37 & 1) == 0)
              {
                Swift::Int result = swift_release(v9);
                unint64_t v3 = v36;
                goto LABEL_42;
              }

              uint64_t v34 = 1LL << *(_BYTE *)(v9 + 32);
              if (v34 >= 64) {
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                *uint64_t v39 = -1LL << v34;
              }
              unint64_t v3 = v36;
              *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
              break;
            }

            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v12 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_44;
                }
                if (v12 >= v38) {
                  goto LABEL_35;
                }
                unint64_t v23 = v39[v12];
                ++v24;
                if (v23) {
                  goto LABEL_25;
                }
              }
            }

            int64_t v12 = v24;
          }
        }

uint64_t sub_10002025C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for FeatureState(0LL);
  uint64_t v31 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::Int v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  int64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100005EA4(&qword_1000416C8);
  char v14 = a2;
  uint64_t v32 = static _DictionaryStorage.resize(original:capacity:move:)(v13, a1, a2);
  if (*(void *)(v13 + 16))
  {
    char v30 = v3;
    uint64_t v15 = 1LL << *(_BYTE *)(v13 + 32);
    unint64_t v16 = (void *)(v13 + 64);
    uint64_t v17 = -1LL;
    if (v15 < 64) {
      uint64_t v17 = ~(-1LL << v15);
    }
    unint64_t v18 = v17 & *(void *)(v13 + 64);
    int64_t v19 = (unint64_t)(v15 + 63) >> 6;
    uint64_t result = swift_retain(v13);
    int64_t v21 = 0LL;
    while (1)
    {
      if (v18)
      {
        unint64_t v22 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        unint64_t v23 = v22 | (v21 << 6);
      }

      else
      {
        int64_t v24 = v21 + 1;
        if (__OFADD__(v21, 1LL))
        {
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }

        if (v24 >= v19) {
          goto LABEL_25;
        }
        unint64_t v25 = v16[v24];
        ++v21;
        if (!v25)
        {
          int64_t v21 = v24 + 1;
          if (v24 + 1 >= v19) {
            goto LABEL_25;
          }
          unint64_t v25 = v16[v21];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v19)
            {
LABEL_25:
              swift_release(v13);
              if ((v14 & 1) == 0)
              {
                uint64_t result = swift_release(v13);
                unint64_t v3 = v30;
                goto LABEL_32;
              }

              uint64_t v28 = 1LL << *(_BYTE *)(v13 + 32);
              if (v28 >= 64) {
                bzero((void *)(v13 + 64), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                *unint64_t v16 = -1LL << v28;
              }
              unint64_t v3 = v30;
              *(void *)(v13 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
              break;
            }

            unint64_t v25 = v16[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v21 = v26 + 1;
                if (__OFADD__(v26, 1LL)) {
                  goto LABEL_34;
                }
                if (v21 >= v19) {
                  goto LABEL_25;
                }
                unint64_t v25 = v16[v21];
                ++v26;
                if (v25) {
                  goto LABEL_22;
                }
              }
            }

            int64_t v21 = v26;
          }
        }

uint64_t sub_100020520(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10001F56C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100021564();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release(*(void *)(v17 + 8 * v10));
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }

LABEL_11:
    v16[(v10 >> 6) + 8] |= 1LL << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1LL);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }

    goto LABEL_14;
  }

  sub_10001F604(result, a3 & 1);
  uint64_t result = sub_10001F56C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

      unint64_t v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10) {
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
      goto LABEL_5;
    }

    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }

uint64_t sub_100020658(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFLL;
  unint64_t v10 = sub_10001F59C(a2 & 0xFFFFFFFFFFFFLL);
  uint64_t v11 = v7[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }

  else
  {
    char v14 = v9;
    uint64_t v15 = v7[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      unint64_t v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        uint64_t v17 = v16[7];
        uint64_t result = swift_release(*(void *)(v17 + 8 * v10));
        *(void *)(v17 + 8 * v10) = a1;
        return result;
      }

      return sub_100020D74(v10, v8, a1, v16);
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100021960();
      goto LABEL_7;
    }

    sub_10001FC20(v13, a3 & 1);
    unint64_t v19 = sub_10001F59C(v8);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
      return sub_100020D74(v10, v8, a1, v16);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&_s16RetainedMessagesC16CategoryTypePairVN);
  __break(1u);
  return result;
}

uint64_t sub_10002076C(uint64_t a1, Swift::UInt32 a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10001F388(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }

  else
  {
    char v14 = v9;
    uint64_t v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      unint64_t v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        uint64_t v17 = v16[7];
        uint64_t v18 = type metadata accessor for Message(0LL);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40LL))( v17 + *(void *)(*(void *)(v18 - 8) + 72LL) * v10,  a1,  v18);
      }

      return sub_100020DC8(v10, a2, a1, v16);
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100021B10();
      goto LABEL_7;
    }

    sub_10001FF20(v13, a3 & 1);
    unint64_t v20 = sub_10001F388(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      unint64_t v16 = *v4;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
      return sub_100020DC8(v10, a2, a1, v16);
    }
  }

  type metadata accessor for AudioEventCategory(0LL);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v22);
  __break(1u);
  return result;
}

void sub_100020890(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  Swift::Int v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10001F324(a2, a3);
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
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t v20 = type metadata accessor for SimpleType(0LL);
        (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))( v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v12,  a1,  v20);
        return;
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100021704();
      goto LABEL_7;
    }

    sub_10001F8B8(v15, a4 & 1);
    unint64_t v21 = sub_10001F324(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_100020E54(v12, a2, a3, a1, v18);
      swift_bridgeObjectRetain(a3);
      return;
    }
  }

  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

uint64_t sub_1000209CC(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for FeatureInfo(0LL);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_10001F3E0(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }

  else
  {
    char v17 = v12;
    uint64_t v18 = v11[3];
    if (v18 >= v16 && (a3 & 1) != 0)
    {
LABEL_7:
      uint64_t v19 = *v4;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        uint64_t v20 = v19[7];
        uint64_t v21 = type metadata accessor for FeatureState(0LL);
        return sub_1000227A8(a1, v20 + *(void *)(*(void *)(v21 - 8) + 72LL) * v13);
      }

      goto LABEL_11;
    }

    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_100021D30();
      goto LABEL_7;
    }

    sub_10002025C(v16, a3 & 1);
    unint64_t v23 = sub_10001F3E0(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      uint64_t v19 = *v4;
      if ((v17 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10001E188(a2, (uint64_t)v10, type metadata accessor for FeatureInfo);
      return sub_100020EE4(v13, (uint64_t)v10, a1, v19);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

uint64_t sub_100020B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v7 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v28, v6, v7);
  uint64_t v8 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v9 = (uint64_t *)(a1 + v8[5]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v28, v10, v11);
  swift_bridgeObjectRelease(v11);
  char v12 = (uint64_t *)(a1 + v8[6]);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v28, v13, v14);
  swift_bridgeObjectRelease(v14);
  BOOL v15 = (uint64_t *)(a1 + v8[7]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v28, v16, v17);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = (uint64_t *)(a1 + v8[8]);
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  swift_bridgeObjectRetain(v20);
  String.hash(into:)(v28, v19, v20);
  swift_bridgeObjectRelease(v20);
  uint64_t v21 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v22 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v28, v21, v22);
  Swift::Int v23 = Hasher._finalize()();
  unint64_t v24 = _HashTable.nextHole(atOrAfter:)(v23 & ~(-1LL << *(_BYTE *)(a3 + 32)), a3 + 64, ~(-1LL << *(_BYTE *)(a3 + 32)));
  *(void *)(a3 + 64 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v24;
  sub_100006698( a1,  *(void *)(a3 + 48) + *(void *)(*((void *)v8 - 1) + 72LL) * v24,  type metadata accessor for FeatureInfo);
  uint64_t v25 = *(void *)(a3 + 56);
  uint64_t v26 = type metadata accessor for FeatureState(0LL);
  uint64_t result = sub_100006698( a2,  v25 + *(void *)(*(void *)(v26 - 8) + 72LL) * v24,  type metadata accessor for FeatureState);
  ++*(void *)(a3 + 16);
  return result;
}

unint64_t sub_100020D74(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  uint64_t v4 = a4[6] + 8 * result;
  *(_DWORD *)uint64_t v4 = a2;
  *(_WORD *)(v4 + 4) = WORD2(a2);
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1LL);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_100020DC8(unint64_t a1, int a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  *(_DWORD *)(a4[6] + 4 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for Message(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))( v7 + *(void *)(*(void *)(v8 - 8) + 72LL) * a1,  a3,  v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1LL);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_100020E54(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for SimpleType(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1,  a4,  v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_100020EE4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for FeatureInfo(0LL);
  sub_100006698(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1, type metadata accessor for FeatureInfo);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for FeatureState(0LL);
  uint64_t result = sub_100006698( a3,  v10 + *(void *)(*(void *)(v11 - 8) + 72LL) * a1,  type metadata accessor for FeatureState);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1LL);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

unint64_t sub_100020F9C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10002107C(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

unint64_t sub_100021118(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v6 = (int *)type metadata accessor for FeatureInfo(0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = v2 + 64;
  uint64_t v11 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v12 = a2 & ~v11;
  if (((*(void *)(v2 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
    return v12;
  }
  uint64_t v13 = ~v11;
  uint64_t v14 = *(void *)(v7 + 72);
  uint64_t v46 = v2;
  uint64_t v47 = v14;
  while (1)
  {
    sub_10001E188(*(void *)(v3 + 48) + v47 * v12, (uint64_t)v9, type metadata accessor for FeatureInfo);
    uint64_t v16 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
    uint64_t v17 = sub_1000061B8( &qword_100041E40,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
    dispatch thunk of RawRepresentable.rawValue.getter(&v50, v16, v17);
    dispatch thunk of RawRepresentable.rawValue.getter(&v48, v16, v17);
    uint64_t v18 = v51;
    uint64_t v19 = v49;
    if (v50 == v48 && v51 == v49)
    {
      swift_bridgeObjectRelease_n(v51, 2LL);
    }

    else
    {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v19);
      if ((v21 & 1) == 0) {
        goto LABEL_4;
      }
    }

    uint64_t v22 = v6[5];
    uint64_t v23 = *(void *)&v9[v22];
    uint64_t v24 = *(void *)&v9[v22 + 8];
    uint64_t v25 = (void *)(a1 + v22);
    BOOL v26 = v23 == *v25 && v24 == v25[1];
    if (!v26 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v27 = v6[6];
    uint64_t v28 = *(void *)&v9[v27];
    uint64_t v29 = *(void *)&v9[v27 + 8];
    char v30 = (void *)(a1 + v27);
    if ((v28 != *v30 || v29 != v30[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v31 = v6[7];
    uint64_t v32 = *(void *)&v9[v31];
    uint64_t v33 = *(void *)&v9[v31 + 8];
    uint64_t v34 = (void *)(a1 + v31);
    if ((v32 != *v34 || v33 != v34[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v35 = v6[8];
    uint64_t v36 = *(void *)&v9[v35];
    uint64_t v37 = *(void *)&v9[v35 + 8];
    int64_t v38 = (void *)(a1 + v35);
    if ((v36 != *v38 || v37 != v38[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v39 = v10;
    uint64_t v40 = v13;
    uint64_t v41 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
    uint64_t v42 = sub_1000061B8( &qword_100041E48,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
    dispatch thunk of RawRepresentable.rawValue.getter(&v50, v41, v42);
    dispatch thunk of RawRepresentable.rawValue.getter(&v48, v41, v42);
    uint64_t v43 = v51;
    uint64_t v44 = v49;
    if (v50 == v48 && v51 == v49) {
      break;
    }
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v44);
    uint64_t v13 = v40;
    uint64_t v10 = v39;
    uint64_t v3 = v46;
    if ((v15 & 1) != 0) {
      goto LABEL_29;
    }
LABEL_4:
    sub_10000B7BC((uint64_t)v9);
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
      return v12;
    }
  }

  swift_bridgeObjectRelease_n(v51, 2LL);
LABEL_29:
  sub_10000B7BC((uint64_t)v9);
  return v12;
}

unint64_t sub_100021444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

unint64_t sub_1000214E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v6 = ~v4;
    do
    {
      if (__PAIR64__( *(unsigned __int16 *)(*(void *)(v2 + 48) + 8 * result + 4),  *(_DWORD *)(*(void *)(v2 + 48) + 8 * result)) == __PAIR64__(WORD2(a1), a1)) {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0);
  }

  return result;
}

void *sub_100021564()
{
  uint64_t v1 = v0;
  sub_100005EA4(&qword_100041E18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v2 + 16);
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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  uint64_t v23 = 2;
  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v23,  1046LL,  0);
  __break(1u);
  return result;
}

  int64_t v20 = 2;
  unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v20,  1046LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
}

void *sub_100021704()
{
  uint64_t v34 = type metadata accessor for SimpleType(0LL);
  uint64_t v1 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005EA4(&qword_100041690);
  uint64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release(v4);
    uint64_t v29 = v35;
    uint64_t v28 = v31;
LABEL_28:
    *uint64_t v28 = v29;
    return result;
  }

  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }

  uint64_t v32 = v4 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v34;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }

void *sub_100021960()
{
  uint64_t v1 = v0;
  sub_100005EA4(&qword_100041680);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v2 + 16);
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

    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }

void *sub_100021B10()
{
  uint64_t v1 = type metadata accessor for Message(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005EA4(&qword_1000416B8);
  uint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release(v5);
    *uint64_t v24 = v7;
    return result;
  }

  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  int64_t v11 = 0LL;
  *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v25 = v5 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

void *sub_100021D30()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for FeatureState(0LL);
  uint64_t v29 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005EA4(&qword_1000416C8);
  uint64_t v8 = *v0;
  uint64_t v9 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    unint64_t result = (void *)swift_release(v8);
LABEL_25:
    *uint64_t v1 = v10;
    return result;
  }

  uint64_t v25 = v1;
  unint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1LL << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  int64_t v13 = 0LL;
  *(void *)(v10 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v15 = -1LL;
  if (v14 < 64) {
    uint64_t v15 = ~(-1LL << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v26 = v8 + 64;
  int64_t v27 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_27;
    }

    if (v21 >= v27) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v26 + 8 * v13);
      if (!v22) {
        break;
      }
    }

uint64_t sub_100021FC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100028994(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

char *sub_100022128(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1LL, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)result || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t result = sub_100028720(result, v15, 1, v6);
    uint64_t v6 = result;
  }

  char v16 = &v6[16 * a1 + 32];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_26;
  }
  if ((v19 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = v16 + 16;
    unint64_t v20 = &v6[16 * a2 + 32];
    if (v16 + 16 != v20 || result >= &v20[16 * v19]) {
      uint64_t result = (char *)memmove(result, v20, 16 * v19);
    }
    uint64_t v21 = *((void *)v6 + 2);
    BOOL v18 = __OFADD__(v21, v10);
    uint64_t v22 = v21 + v10;
    if (!v18)
    {
      *((void *)v6 + 2) = v22;
LABEL_20:
      *(void *)char v16 = a3;
      *((void *)v16 + 1) = a4;
      *int64_t v4 = v6;
      return result;
    }

    goto LABEL_27;
  }

void *sub_100022294(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }

  int64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0LL, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    int64_t v4 = sub_100028994(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }

  uint64_t v12 = sub_100005EA4(&qword_100041E10);
  uint64_t result = (void *)swift_arrayDestroy(&v4[16 * a1 + 32], v7, v12);
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v14 = *((void *)v4 + 2);
  BOOL v15 = __OFSUB__(v14, a2);
  uint64_t v16 = v14 - a2;
  if (v15) {
    goto LABEL_26;
  }
  if ((v16 & 0x8000000000000000LL) == 0)
  {
    uint64_t v17 = &v4[16 * a2 + 32];
    if (a1 != a2 || &v4[16 * a1 + 32] >= &v17[16 * v16]) {
      uint64_t result = memmove(&v4[16 * a1 + 32], v17, 16 * v16);
    }
    uint64_t v18 = *((void *)v4 + 2);
    BOOL v15 = __OFADD__(v18, v8);
    uint64_t v19 = v18 - v7;
    if (!v15)
    {
      *((void *)v4 + 2) = v19;
LABEL_20:
      *uint64_t v2 = v4;
      return result;
    }

    goto LABEL_27;
  }

uint64_t sub_100022404(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }

  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0LL, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_100028ABC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }

  uint64_t v12 = type metadata accessor for Message(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = v4 + ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v15 = *(void *)(v13 + 72);
  uint64_t v16 = v15 * a1;
  unint64_t v17 = v14 + v15 * a1;
  uint64_t result = swift_arrayDestroy(v17, v7, v12);
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(v4 + 16);
  uint64_t v20 = v19 - a2;
  if (__OFSUB__(v19, a2)) {
    goto LABEL_31;
  }
  if ((v20 & 0x8000000000000000LL) == 0)
  {
    unint64_t v21 = v14 + v15 * a2;
    if (v16 < v15 * a2 || v17 >= v21 + v20 * v15)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack(v17, v21, v20, v12);
    }

    else if (v16 != v15 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront(v17);
    }

    uint64_t v23 = *(void *)(v4 + 16);
    BOOL v24 = __OFADD__(v23, v8);
    uint64_t v25 = v23 - v7;
    if (!v24)
    {
      *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v25;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }

    goto LABEL_32;
  }

void *sub_1000225AC(uint64_t a1, uint64_t a2)
{
  return sub_1000225D4(a1, a2, (uint64_t (*)(void))sub_100028840, &qword_100041E20);
}

void *sub_1000225C0(uint64_t a1, uint64_t a2)
{
  return sub_1000225D4(a1, a2, (uint64_t (*)(void))sub_100028854, &qword_100041E28);
}

void *sub_1000225D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t *a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v10 = a1 - a2;
  if (__OFSUB__(0LL, v9))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (__OFADD__(v7, v10))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  uint64_t v13 = sub_100005EA4(a4);
  uint64_t result = (void *)swift_arrayDestroy(v6 + 32 + 40 * a1, v9, v13);
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v15 = *(void *)(v6 + 16);
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16) {
    goto LABEL_23;
  }
  if ((v17 & 0x8000000000000000LL) == 0)
  {
    uint64_t v18 = (const void *)(v6 + 32 + 40 * a2);
    uint64_t v19 = *(void *)(v6 + 16);
    BOOL v16 = __OFADD__(v19, v10);
    uint64_t v20 = v19 - v9;
    if (!v16)
    {
      *(void *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = v20;
LABEL_17:
      *unint64_t v4 = v6;
      return result;
    }

    goto LABEL_24;
  }

uint64_t sub_10002275C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100022780(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1000227A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000227EC(uint64_t a1, Swift::UInt32 a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005EA4(&qword_100041FF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Message(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1LL, v9) == 1)
  {
    sub_10002D838(a1, &qword_100041FF0);
    unint64_t v13 = sub_10001F388(a2);
    if ((v14 & 1) != 0)
    {
      unint64_t v15 = v13;
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
      uint64_t v17 = *v3;
      uint64_t v24 = *v3;
      *uint64_t v3 = 0x8000000000000000LL;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_100021B10();
        uint64_t v17 = v24;
      }

      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))( v8,  *(void *)(v17 + 56) + *(void *)(v10 + 72) * v15,  v9);
      sub_100029510(v15, v17);
      uint64_t v18 = *v3;
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease(v18);
      uint64_t v19 = 0LL;
    }

    else
    {
      uint64_t v19 = 1LL;
    }

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v19, 1LL, v9);
    return sub_10002D838((uint64_t)v8, &qword_100041FF0);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char v20 = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v24 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10002076C((uint64_t)v12, a2, v20);
    uint64_t v21 = *v3;
    *uint64_t v3 = v24;
    return swift_bridgeObjectRelease(v21);
  }

uint64_t sub_1000229C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005EA4((uint64_t *)&unk_100041C30);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for FeatureState(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1LL) == 1)
  {
    sub_10002D838(a1, (uint64_t *)&unk_100041C30);
    sub_10000B39C(a2, (uint64_t)v8);
    sub_10000B7BC(a2);
    return sub_10002D838((uint64_t)v8, (uint64_t *)&unk_100041C30);
  }

  else
  {
    sub_10000B7F8(a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v17 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_1000209CC((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    uint64_t v15 = *v3;
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease(v15);
    return sub_10000B7BC(a2);
  }

uint64_t sub_100022B14()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OsTransactionHandler(0LL);
  uint64_t v3 = static OsTransactionHandler.shared.getter(v2);
  OsTransactionHandler.sessionStarted(for:)(*(void *)(v1 + 16));
  swift_release(v3);
  uint64_t v4 = *(dispatch_queue_s **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v5 = swift_allocObject(&unk_10003E2F8, 32LL, 7LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_10002D7D0;
  *(void *)(v5 + 24) = v1;
  v9[4] = sub_10000B2E8;
  uint64_t v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_100016C50;
  v9[3] = &unk_10003E310;
  uint64_t v6 = _Block_copy(v9);
  uint64_t v7 = v10;
  swift_retain(v1);
  swift_retain(v5);
  swift_release(v7);
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v5, "", 111LL, 88LL, 24LL, 1LL);
  swift_release(v1);
  uint64_t result = swift_release(v5);
  return result;
}

uint64_t sub_100022C4C(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v25 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v24[1] = *(void *)(v5 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v17 = swift_allocObject(&unk_10003E208, 46LL, 7LL);
  *(void *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(v17 + 24) = a1;
  *(void *)(v17 + 32) = a2;
  *(_DWORD *)(v17 + 40) = a3;
  *(_WORD *)(v17 + 44) = a4;
  aBlock[4] = sub_10002D73C;
  uint64_t v28 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003E220;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain(v5);
  uint64_t v19 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v19);
  char v26 = _swiftEmptyArrayStorage;
  uint64_t v20 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v21 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v22 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v21, v22, v10, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v16, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release(v28);
}

uint64_t sub_100022E60@<X0>(uint64_t a1@<X8>)
{
  if (!v12)
  {
    sub_10002D838((uint64_t)&v11, &qword_100041818);
    uint64_t v3 = type metadata accessor for NonOwningSession();
    uint64_t v4 = swift_allocObject(v3, 64LL, 7LL);
    uint64_t v5 = swift_weakInit(v4 + 56, 0LL);
    uint64_t v6 = *(void *)(v1 + 40);
    *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v1 + 32);
    *(void *)(v4 + 24) = v6;
    *(void *)(v4 + 32) = *(void *)(v1 + 16);
    *(_BYTE *)(v4 + 40) = *(_BYTE *)(v1 + 24);
    *(_DWORD *)(v4 + 44) = *(_DWORD *)(v1 + 48);
    uint64_t v7 = *(void *)(v1 + 56);
    *(void *)(v4 + 48) = v7;
    swift_weakAssign(v5, v1);
    uint64_t v12 = v3;
    uint64_t v13 = sub_1000061B8( &qword_100042050,  (uint64_t (*)(uint64_t))type metadata accessor for NonOwningSession,  (uint64_t)&unk_100035A84);
    *(void *)&__int128 v11 = v4;
    sub_10002D688((uint64_t)&v11, (uint64_t)v10);
    swift_beginAccess(v1 + 96, v9, 33LL, 0LL);
    swift_bridgeObjectRetain(v6);
    swift_retain(v7);
    sub_10002D6CC((uint64_t)v10, v1 + 96, &qword_100041818);
    swift_endAccess(v9);
  }

  return sub_10002D514(&v11, a1);
}

uint64_t sub_100022FC4(unint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v110 = a1;
  uint64_t v116 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v115 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v114 = (char *)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100005EA4(&qword_100041FF0);
  __chkstk_darwin(v4);
  uint64_t v106 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OperatingSystem(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Message.Metadata(0LL);
  uint64_t v118 = *(void **)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v108 = (char *)&v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v121 = type metadata accessor for Message(0LL);
  uint64_t v117 = *(void *)(v121 - 8);
  uint64_t v12 = __chkstk_darwin(v121);
  uint64_t v113 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v120 = (char *)&v104 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v104 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  v112.n128_u64[0] = (unint64_t)&v104 - v20;
  __chkstk_darwin(v19);
  v124 = (char *)&v104 - v21;
  uint64_t v22 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (uint64_t *)((char *)&v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  char v26 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v25 = v26;
  (*(void (**)(void *, void, uint64_t))(v23 + 104))(v25, enum case for DispatchPredicate.onQueue(_:), v22);
  id v27 = v26;
  LOBYTE(v26) = _dispatchPreconditionTest(_:)(v25);
  (*(void (**)(void *, uint64_t))(v23 + 8))(v25, v22);
  if ((v26 & 1) == 0)
  {
    __break(1u);
LABEL_44:
    swift_once(&qword_100041638, sub_100033DB0);
    goto LABEL_4;
  }

  uint64_t v23 = OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled;
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) & 1) != 0) {
    goto LABEL_5;
  }
  if (qword_100041638 != -1) {
    goto LABEL_44;
  }
LABEL_4:
  sub_100025B04(qword_100042398);
  *(_BYTE *)(v2 + v23) = 1;
LABEL_5:
  uint64_t v28 = v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  uint64_t v29 = swift_retain_n(v2, 2LL);
  uint64_t v119 = v28;
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v123 = v2;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc(18LL, -1LL);
    *(_DWORD *)uint64_t v33 = 134218240;
    uint64_t v127 = *(void *)(v2 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, v128, v33 + 4, v33 + 12);
    *(_WORD *)(v33 + 12) = 1024;
    int v34 = *(unsigned __int8 *)(v123 + 24);
    swift_release(v123);
    LODWORD(v127) = v34;
    uint64_t v2 = v123;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, (char *)&v127 + 4, v33 + 14, v33 + 18);
    swift_release(v2);
    _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "Processing message. { reporterID=%lld, singleServerSession=%{BOOL}d }",  (uint8_t *)v33,  0x12u);
    swift_slowDealloc(v33, -1LL, -1LL);
  }

  else
  {
    swift_release_n(v2, 2LL);
  }

  uint64_t v35 = v110;
  uint64_t v36 = v117;

  uint64_t v37 = *(void *)(v2 + 56);
  sub_100022E60((uint64_t)&v127);
  uint64_t v38 = sub_100012A4C(v37, v35, (uint64_t)&v127, 0);
  int v40 = v39;
  sub_10002D838((uint64_t)&v127, &qword_100041818);
  int v109 = v40;
  if ((v40 & 0x100) == 0)
  {
    uint64_t v111 = (char *)v38;
    uint64_t v107 = v10;
    char v122 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
    v122(v124, v35, v121);
    char v41 = sub_100026714(v35);
    uint64_t v42 = (void (*)(uint64_t *, void))Message.metadata.modify(&v127);
    Message.Metadata.isRedundant.setter(v41 & 1);
    v42(&v127, 0LL);
    uint64_t v43 = *(unsigned __int8 *)(v2 + 66);
    uint64_t v44 = (uint64_t (*)(uint64_t *, void))Message.metadata.modify(&v127);
    Message.Metadata.isSessionStarted.setter(v43);
    uint64_t v45 = v44(&v127, 0LL);
    uint64_t v46 = Message.appName.getter(v45);
    if (!v47) {
      uint64_t v46 = sub_100026A98();
    }
    uint64_t v48 = v107;
    uint64_t v49 = Message.appName.setter(v46);
    uint64_t v50 = v108;
    uint64_t v51 = Message.metadata.getter(v49);
    char v52 = Message.Metadata.requiresSummaryDecoration.getter(v51);
    uint64_t v105 = (void (*)(char *, uint64_t))v118[1];
    v105(v50, v48);
    uint64_t v53 = v121;
    uint64_t v54 = v117;
    if ((v52 & 1) != 0)
    {
      uint64_t v55 = v124;
      uint64_t v56 = (void (*)(uint64_t *, void))Message.metadata.modify(&v127);
      Message.Metadata.requiresSummaryDecoration.setter(0LL);
      v56(&v127, 0LL);
      uint64_t v57 = v111;
      swift_bridgeObjectRetain(v111);
      uint64_t v59 = sub_100026C50(v58);
      swift_bridgeObjectRelease(v57);
      v122(v18, (uint64_t)v55, v53);
      uint64_t v60 = v59[2];
      if (v60)
      {
        uint64_t v61 = (uint64_t)(v59 + 4);
        uint64_t v118 = v59;
        swift_bridgeObjectRetain(v59);
        do
        {
          sub_10002D688(v61, (uint64_t)&v127);
          uint64_t v63 = v129;
          uint64_t v62 = v130;
          sub_100013314(&v127, v129);
          static DeviceUtilities.currentOperatingSystem.getter();
          dispatch thunk of SummaryDecorator.addDecoratorData(_:operatingSystem:)(v18, v9, v63, v62);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          sub_100013384(&v127);
          v61 += 40LL;
          --v60;
        }

        while (v60);
        uint64_t v59 = v118;
        swift_bridgeObjectRelease(v118);
        uint64_t v2 = v123;
      }

      uint64_t v54 = v117;
      unint64_t v64 = v112.n128_u64[0];
      (*(void (**)(unint64_t, char *, uint64_t))(v117 + 32))(v112.n128_u64[0], v18, v53);
      swift_bridgeObjectRelease(v59);
      (*(void (**)(char *, unint64_t, uint64_t))(v54 + 40))(v124, v64, v53);
    }

    swift_beginAccess(v2 + 88, v126, 0LL, 0LL);
    uint64_t v65 = *(void *)(v2 + 88);
    uint64_t v66 = (uint64_t)v111;
    uint64_t v67 = *((void *)v111 + 2);
    swift_bridgeObjectRetain(v65);
    if (v67)
    {
      uint64_t v68 = sub_10002D128(v65, v66);
      swift_bridgeObjectRelease(v65);
      uint64_t v65 = (uint64_t)v68;
    }

    swift_bridgeObjectRelease(v66);
    uint64_t v76 = *(void *)(v65 + 16);
    uint64_t v77 = v120;
    if (v76)
    {
      uint64_t v104 = v65;
      uint64_t v78 = v65 + 32;
      __n128 v79 = swift_beginAccess(v124, v125, 0LL, 0LL);
      v79.n128_u64[0] = 136381187LL;
      __n128 v112 = v79;
      uint64_t v111 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10002D688(v78, (uint64_t)&v127);
        uint64_t v80 = v129;
        uint64_t v81 = v130;
        sub_100013314(&v127, v129);
        v122(v77, (uint64_t)v124, v53);
        dispatch thunk of WorkerProtocol.process(message:)(v77, v80, v81);
        (*(void (**)(char *, uint64_t))(v54 + 8))(v77, v53);
        sub_100013384(&v127);
        v78 += 40LL;
        --v76;
      }

      while (v76);
      uint64_t v82 = v104;
    }

    else
    {
      uint64_t v82 = v65;
    }

    uint64_t v83 = swift_bridgeObjectRelease(v82);
    unint64_t v84 = v110;
    if ((Message.shouldRetain.getter(v83) & 1) != 0)
    {
      uint64_t v85 = sub_100026E8C();
      sub_10001E538(v84);
      swift_release(v85);
    }

    swift_beginAccess(v124, &v127, 32LL, 0LL);
    unint64_t v86 = v108;
    uint64_t v88 = Message.metadata.getter(v87);
    char v89 = Message.Metadata.isRedundant.getter(v88);
    v105(v86, v107);
    uint64_t result = swift_endAccess(&v127);
    if ((v89 & 1) == 0)
    {
      Swift::UInt32 v91 = Message.category.getter(result);
      uint64_t v92 = (uint64_t)v106;
      v122(v106, v84, v53);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v92, 0LL, 1LL, v53);
      swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory, &v127, 33LL, 0LL);
      sub_1000227EC(v92, v91);
      uint64_t result = swift_endAccess(&v127);
      uint64_t v93 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
      BOOL v94 = __CFADD__(v93, 1LL);
      uint64_t v95 = v93 + 1;
      if (v94) {
        goto LABEL_46;
      }
      *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = v95;
    }

    uint64_t v96 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    BOOL v94 = __CFADD__(v96, 1LL);
    uint64_t v97 = v96 + 1;
    if (!v94)
    {
      *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = v97;
      uint64_t v98 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v124, v53);
      uint64_t v73 = Message.content.getter(v98);
      swift_retain(v2);
      uint64_t v74 = v73;
      uint64_t v75 = v2;
      goto LABEL_36;
    }

    __break(1u);
LABEL_46:
    __break(1u);
    return result;
  }

  swift_bridgeObjectRelease(v38);
  uint64_t v69 = swift_retain(v2);
  uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
  os_log_type_t v71 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v70, v71))
  {
    uint32_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint32_t v72 = 134217984;
    uint64_t v127 = *(void *)(v2 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, v128, v72 + 4, v72 + 12);
    swift_release(v2);
    _os_log_impl((void *)&_mh_execute_header, v70, v71, "Discarding message. { reporterID=%lld }", v72, 0xCu);
    swift_slowDealloc(v72, -1LL, -1LL);
  }

  else
  {
    swift_release(v2);
  }

  uint64_t v73 = ((uint64_t (*)(void))Message.content.getter)();
  swift_retain(v2);
  uint64_t v74 = v73;
  uint64_t v75 = v2;
LABEL_36:
  uint64_t v99 = sub_10002CCEC(v74, v75);
  swift_release(v2);
  if (*(void *)(v99 + 16))
  {
    uint64_t v100 = *(void *)(v2 + 80);
    if (v100)
    {
      swift_bridgeObjectRetain(*(void *)(v2 + 80));
      uint64_t v101 = sub_100025A48(v99, v100);
      uint64_t v102 = *(void *)(v2 + 80);
      *(void *)(v2 + 80) = v101;
      swift_bridgeObjectRelease(v73);
      uint64_t v103 = v102;
    }

    else
    {
      *(void *)(v2 + 80) = v99;
      swift_bridgeObjectRelease(v73);
      uint64_t v103 = 0LL;
    }

    swift_bridgeObjectRelease(v103);
  }

  else
  {
    swift_bridgeObjectRelease(v73);
    swift_release(v99);
  }

  return (v109 & 0x100) == 0;
}

uint64_t sub_100023CC8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Message(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  v21[1] = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))( (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v9);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 24) & ~v12;
  uint64_t v14 = swift_allocObject(&unk_10003E1B8, v13 + v11, v12 | 7);
  *(void *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))( v14 + v13,  (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
  aBlock[4] = sub_1000286C8;
  uint64_t v27 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000172EC;
  aBlock[3] = &unk_10003E1D0;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = swift_retain(v1);
  static DispatchQoS.unspecified.getter(v16);
  uint64_t v25 = _swiftEmptyArrayStorage;
  uint64_t v17 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v18 = sub_100005EA4((uint64_t *)&unk_100041BC0);
  uint64_t v19 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v18, v19, v3, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v5, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
  return swift_release(v27);
}

uint64_t sub_100023F2C(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001LL) != 0)
  {
    if (a2 < 0) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v5 = swift_retain(a1);
    char v6 = __CocoaSet.contains(_:)(v5, v4);
    swift_release(a1);
    return v6 & 1;
  }

  else
  {
    if (*(void *)(a2 + 16))
    {
      Hasher.init(_seed:)(v20, *(void *)(a2 + 40));
      Swift::UInt32 v8 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
      Hasher._combine(_:)(v8);
      uint64_t v9 = *(void *)(a1 + 24);
      uint64_t v10 = *(void *)(a1 + 32);
      swift_bridgeObjectRetain(v10);
      String.hash(into:)(v20, v9, v10);
      swift_bridgeObjectRelease(v10);
      Swift::Int v11 = Hasher._finalize()();
      uint64_t v12 = -1LL << *(_BYTE *)(a2 + 32);
      unint64_t v13 = v11 & ~v12;
      uint64_t v14 = a2 + 56;
      if (((*(void *)(a2 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) != 0)
      {
        uint64_t v15 = ~v12;
        uint64_t v16 = *(void *)(a2 + 48);
        uint64_t v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        do
        {
          uint64_t v18 = *(void *)(v16 + 8 * v13);
          if (*(_DWORD *)(v18 + v17) == v8)
          {
            BOOL v19 = *(void *)(v18 + 24) == v9 && *(void *)(v18 + 32) == v10;
            if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              return 1LL;
            }
            uint64_t v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
          }

          unint64_t v13 = (v13 + 1) & v15;
        }

        while (((*(void *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) != 0);
      }
    }

    return 0LL;
  }

uint64_t sub_10002409C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v18, *(void *)(a3 + 40));
    String.hash(into:)(v18, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      Swift::Int v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1LL;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000241D0(void **a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7 = v6;
  int v74 = a6;
  uint64_t v70 = a3;
  unint64_t v71 = a4;
  uint64_t v11 = type metadata accessor for Keys(0LL);
  uint64_t v68 = *(void *)(v11 - 8);
  uint64_t v69 = v11;
  __chkstk_darwin(v11);
  uint64_t v67 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v13);
  unint64_t v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v72 = *(void *)(v16 - 8);
  uint64_t v73 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(_WORD *)(v7 + 64) = -1;
  *(_BYTE *)(v7 + 66) = 0;
  unint64_t v22 = sub_1000057C0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v7 + 72) = v22;
  *(void *)(v7 + 80) = 0LL;
  *(void *)(v7 + 88) = _swiftEmptyArrayStorage;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(_OWORD *)(v7 + 128) = 0u;
  static Logger.session.getter(v22);
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers) = _swiftEmptyArrayStorage;
  uint64_t v23 = v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  uint64_t v24 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56LL))(v23, 1LL, 1LL, v24);
  uint64_t v25 = OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory;
  *(void *)(v7 + v25) = sub_1000063CC((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = 0LL;
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = 0LL;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
  *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(_DWORD *)(v7 + 48) = a2;
  unint64_t v26 = v71;
  *(void *)(v7 + 32) = v70;
  *(void *)(v7 + 40) = v26;
  *(void *)(v7 + swift_weakDestroy(v0 + 56) = a5;
  LOBYTE(v26) = v74;
  *(_BYTE *)(v7 + 24) = v74;
  BOOL v27 = (v26 & 1) == 0;
  uint64_t v28 = 5LL;
  if (v27) {
    uint64_t v28 = 1LL;
  }
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime) = v28;
  unint64_t v29 = sub_100006080();
  uint64_t v70 = a5;
  unint64_t v71 = v29;
  aBlock = 0LL;
  v76[0] = 0xE000000000000000LL;
  swift_retain(a5);
  _StringGuts.grow(_:)(39LL);
  swift_bridgeObjectRelease(v76[0]);
  aBlock = (void **)0xD000000000000025LL;
  v76[0] = 0x8000000100037370LL;
  uint64_t v66 = a1;
  uint64_t v78 = a1;
  v30._id countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  object = v30._object;
  String.append(_:)(v30);
  uint64_t v32 = swift_bridgeObjectRelease(object);
  int v34 = aBlock;
  uint64_t v33 = v76[0];
  static DispatchQoS.userInteractive.getter(v32);
  (*(void (**)(char *, void, uint64_t))(v72 + 104))( v18,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v73);
  aBlock = (void **)_swiftEmptyArrayStorage;
  uint64_t v35 = sub_1000061B8( (unint64_t *)&unk_100041C10,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v36 = sub_100005EA4(&qword_100041658);
  uint64_t v37 = sub_10001DC5C((unint64_t *)&qword_100041C20, &qword_100041658);
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v36, v37, v13, v35);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v34, v33, v21, v15, v18, 0LL);
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue) = result;
  if ((v74 & 1) == 0) {
    goto LABEL_6;
  }
  *(_WORD *)(v7 + 64) = 5;
  uint64_t v39 = sub_100005EA4(&qword_100042088);
  uint64_t v40 = sub_100005EA4(&qword_100041688);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(void *)(v41 + 72);
  uint64_t v43 = *(unsigned __int8 *)(v41 + 80);
  uint64_t v44 = (v43 + 32) & ~v43;
  uint64_t v45 = swift_allocObject(v39, v44 + v42, v43 | 7);
  *(_OWORD *)(v45 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000358D0;
  uint64_t v46 = (uint64_t *)(v45 + v44);
  uint64_t v47 = (void *)(v45 + v44 + *(int *)(v40 + 48));
  uint64_t v49 = v67;
  uint64_t v48 = v68;
  uint64_t v50 = v69;
  uint64_t v51 = (*(uint64_t (**)(char *, void, uint64_t))(v68 + 104))( v67,  enum case for Keys.applicationName(_:),  v69);
  uint64_t v52 = Keys.rawValue.getter(v51);
  uint64_t v54 = v53;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  uint64_t *v46 = v52;
  v46[1] = v54;
  *uint64_t v47 = 0x6E776F6E6B6E55LL;
  v47[1] = 0xE700000000000000LL;
  uint64_t v55 = enum case for SimpleType.string(_:);
  uint64_t v56 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v56 - 8) + 104LL))(v47, v55, v56);
  unint64_t v57 = sub_1000057C0(v45);
  uint64_t v58 = *(dispatch_queue_s **)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v59 = swift_allocObject(&unk_10003E3C0, 32LL, 7LL);
  *(void *)(v59 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *(void *)(v59 + 24) = v57;
  uint64_t v60 = swift_allocObject(&unk_10003E3E8, 32LL, 7LL);
  *(void *)(v60 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_10002D8B8;
  *(void *)(v60 + 24) = v59;
  v76[3] = sub_10000B83C;
  uint64_t v77 = v60;
  aBlock = _NSConcreteStackBlock;
  v76[0] = 1107296256LL;
  v76[1] = sub_100016C50;
  v76[2] = &unk_10003E400;
  uint64_t v61 = _Block_copy(&aBlock);
  uint64_t v62 = v77;
  swift_retain(v7);
  swift_bridgeObjectRetain(v57);
  swift_retain(v60);
  swift_release(v62);
  dispatch_sync(v58, v61);
  _Block_release(v61);
  LOBYTE(v58) = swift_isEscapingClosureAtFileLocation(v60, "", 111LL, 100LL, 24LL, 1LL);
  swift_bridgeObjectRelease(v57);
  swift_release(v59);
  uint64_t result = swift_release(v60);
  if ((v58 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
LABEL_6:
    uint64_t v63 = (os_log_s *)Logger.logObject.getter(result);
    os_log_type_t v64 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v65 = 134217984;
      aBlock = v66;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v76, v65 + 4, v65 + 12);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Created reporting session. { reporterID=%lld }", v65, 0xCu);
      swift_slowDealloc(v65, -1LL, -1LL);
    }

    swift_release(v70);
    return v7;
  }

  return result;
}

void sub_1000247F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TraceArgs(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TraceCode(0LL);
  uint64_t v32 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v31 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100005EA4(&qword_100042070);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  id v16 = v15;
  LOBYTE(v15) = _dispatchPreconditionTest(_:)(v14);
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v17 = swift_retain(v1);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v20 = 134217984;
    uint64_t v33 = *(void *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v20 + 4, v20 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "startOnQueue() called. { reporterID=%lld }", v20, 0xCu);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {
    swift_release(v1);
  }

  uint64_t v21 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v10, 1LL, 1LL, v21);
  uint64_t v22 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v33, 33LL, 0LL);
  sub_10002D6CC((uint64_t)v10, v22, &qword_100042070);
  swift_endAccess(&v33);
  if (*(_BYTE *)(v1 + 66) != 1)
  {
    *(_BYTE *)(v1 + 66) = 1;
    if (qword_100041640 == -1)
    {
LABEL_9:
      sub_100025B04(qword_1000423A0);
      sub_100026F08();
      uint64_t v28 = v31;
      uint64_t v27 = v32;
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, enum case for TraceCode.sessionCreate(_:), v6);
      uint64_t v29 = static Utilities.positiveReporterID(_:)(*(void *)(v1 + 16));
      TraceArgs.init(arg1:arg2:arg3:arg4:)(v29, *(unsigned __int16 *)(v1 + 64), 0LL, 0LL);
      static Trace.post(_:args:)(v28, v5);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v6);
      return;
    }

LABEL_13:
    swift_once(&qword_100041640, sub_100033F00);
    goto LABEL_9;
  }

  uint64_t v23 = swift_retain(v1);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)unint64_t v26 = 134217984;
    uint64_t v33 = *(void *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v26 + 4, v26 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Session already started. { reporterID=%lld }", v26, 0xCu);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {
    swift_release(v1);
  }
}

    uint64_t result = sub_100028F4C(a5, a6);
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

    uint64_t v36 = (void *)*a3;
    *(void *)(*a3 + 8 * (v24 >> 6) + 64) |= 1LL << v24;
    uint64_t v37 = (uint64_t *)(v36[6] + 16 * v24);
    *uint64_t v37 = v20;
    v37[1] = v19;
    uint64_t v38 = v36[7];
    uint64_t v65 = *(void *)(v63 + 72);
    uint64_t v39 = v68;
    v21((char *)(v38 + v65 * v24), v69, v68);
    uint64_t v40 = v36[2];
    uint64_t v41 = __OFADD__(v40, 1LL);
    uint64_t v42 = v40 + 1;
    if (v41)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    void v36[2] = v42;
    uint64_t v43 = v62 - 1;
    if (v62 == 1) {
      return swift_bridgeObjectRelease_n(v64, 2LL);
    }
    uint64_t v44 = v64 + v67 + v61[0];
    while (1)
    {
      sub_100006654(v44, (uint64_t)v15, &qword_100041688);
      uint64_t v46 = v15[1];
      uint64_t v72 = *v15;
      uint64_t v45 = v72;
      uint64_t v73 = v46;
      v21(v69, v66, v39);
      uint64_t v47 = (void *)*a3;
      uint64_t v48 = sub_10001F324(v45, v46);
      uint64_t v50 = v47[2];
      uint64_t v51 = (v49 & 1) == 0;
      uint64_t v41 = __OFADD__(v50, v51);
      uint64_t v52 = v50 + v51;
      if (v41) {
        break;
      }
      uint64_t v53 = v49;
      if (v47[3] < v52)
      {
        sub_10001F8B8(v52, 1LL);
        uint64_t v48 = sub_10001F324(v45, v46);
        if ((v53 & 1) != (v54 & 1)) {
          goto LABEL_25;
        }
      }

      if ((v53 & 1) != 0) {
        goto LABEL_10;
      }
      uint64_t v55 = (void *)*a3;
      *(void *)(*a3 + 8 * (v48 >> 6) + 64) |= 1LL << v48;
      uint64_t v56 = (uint64_t *)(v55[6] + 16 * v48);
      *uint64_t v56 = v45;
      v56[1] = v46;
      uint64_t v39 = v68;
      v21((char *)(v55[7] + v65 * v48), v69, v68);
      unint64_t v57 = v55[2];
      uint64_t v41 = __OFADD__(v57, 1LL);
      uint64_t v58 = v57 + 1;
      if (v41) {
        goto LABEL_24;
      }
      v55[2] = v58;
      v44 += v67;
      if (!--v43) {
        return swift_bridgeObjectRelease_n(v64, 2LL);
      }
    }

void sub_100024C00()
{
}

void sub_100024C20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005EA4(&qword_100042070);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v50 - v6;
  uint64_t v8 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v8);
  uint64_t v53 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Message(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v18 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  id v19 = v18;
  LOBYTE(v18) = _dispatchPreconditionTest(_:)(v17);
  (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) != 0)
  {
    uint64_t v20 = swift_retain_n(v1, 2LL);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (_DWORD *)swift_slowAlloc(18LL, -1LL);
      uint64_t v51 = v5;
      uint64_t v52 = v10;
      uint64_t v24 = v23;
      *uint64_t v23 = 67174913;
      LODWORD(v57) = *(unsigned __int8 *)(v1 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, (char *)&v57 + 4, v23 + 1, v23 + 2);
      *((_WORD *)v24 + 4) = 2048;
      os_log_type_t v25 = v13;
      unint64_t v26 = v7;
      uint64_t v27 = *(void *)(v1 + 16);
      swift_release(v1);
      uint64_t v57 = v27;
      uint64_t v7 = v26;
      uint64_t v13 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, (char *)v24 + 10, (char *)v24 + 18);
      swift_release(v1);
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "signalStop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }",  (uint8_t *)v24,  0x12u);
      uint64_t v28 = v24;
      uint64_t v5 = v51;
      uint64_t v10 = v52;
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v1, 2LL);
    }

    if ((*(_BYTE *)(v1 + 24) & 1) == 0)
    {
      if (*(_BYTE *)(v1 + 66) == 1)
      {
        uint64_t v29 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
        uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
        uint64_t v31 = *(void *)(v1 + 16);
        uint64_t v32 = *(void *)(v1 + 32);
        uint64_t v33 = *(void *)(v1 + 40);
        LOBYTE(v57) = 1;
        v58[0] = v29;
        v58[1] = v30;
        void v58[2] = v31;
        char v59 = 1;
        uint64_t v60 = v32;
        uint64_t v61 = v33;
        char v62 = 0;
        swift_bridgeObjectRetain(v33);
        unint64_t v34 = sub_10002D8F4();
        swift_bridgeObjectRelease(v33);
        uint64_t v35 = type metadata accessor for Message.Metadata(0LL);
        uint64_t v36 = v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56LL))(v53, 1LL, 1LL, v35);
        Message.init(category:type:content:metadata:)(8LL, 2LL, v34, v36);
        if ((sub_100022FC4((unint64_t)v13) & 1) == 0)
        {
          uint64_t v53 = v13;
          uint64_t v37 = swift_retain(v1);
          uint64_t v38 = (os_log_s *)Logger.logObject.getter(v37);
          os_log_type_t v39 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            *(_DWORD *)uint64_t v40 = 134217984;
            uint64_t v55 = v31;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v40 + 4, v40 + 12);
            swift_release(v1);
            _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "signalStop message dropped. { reporterID=%lld }",  v40,  0xCu);
            swift_slowDealloc(v40, -1LL, -1LL);
          }

          else
          {

            swift_release(v1);
          }

          uint64_t v13 = v53;
        }

        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      }

      else
      {
        uint64_t v41 = swift_retain(v1);
        uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
        os_log_type_t v43 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v44 = 134217984;
          uint64_t v57 = *(void *)(v1 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v44 + 4, v44 + 12);
          swift_release(v1);
          _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Not sending stop message, because !isStarted. { reporterID=%lld }",  v44,  0xCu);
          swift_slowDealloc(v44, -1LL, -1LL);
        }

        else
        {
          swift_release(v1);
        }
      }
    }

    if (*(_BYTE *)(v1 + 66) == 1)
    {
      uint64_t v45 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v55, 0LL, 0LL);
      sub_100006654(v45, (uint64_t)v7, &qword_100042070);
      uint64_t v46 = type metadata accessor for Date(0LL);
      uint64_t v47 = *(void *)(v46 - 8);
      int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v7, 1LL, v46);
      uint64_t v49 = sub_10002D838((uint64_t)v7, &qword_100042070);
      if (v48 == 1)
      {
        Date.init()(v49);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v5, 0LL, 1LL, v46);
        swift_beginAccess(v45, v54, 33LL, 0LL);
        sub_10002D6CC((uint64_t)v5, v45, &qword_100042070);
        swift_endAccess(v54);
        sub_100027650();
      }
    }
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100025204(uint64_t a1, int a2)
{
  return sub_100025228(a2);
}

uint64_t sub_100025228(int a1)
{
  uint64_t v2 = v1;
  int v66 = a1;
  uint64_t v3 = type metadata accessor for TraceArgs(0LL);
  uint64_t v71 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v70 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for TraceCode(0LL);
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v69 = v5;
  __chkstk_darwin(v5);
  uint64_t v67 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Message(0LL);
  uint64_t v64 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v63 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100005EA4(&qword_100042070);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (uint64_t *)((char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  id v19 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v18, enum case for DispatchPredicate.onQueue(_:), v15);
  id v20 = v19;
  char v21 = _dispatchPreconditionTest(_:)(v18);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v16 + 8))(v18, v15);
  if ((v21 & 1) != 0)
  {
    uint64_t v23 = swift_retain_n(v2, 2LL);
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.debug.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v65 = v3;
    uint64_t v62 = v10;
    if (v26)
    {
      uint64_t v27 = swift_slowAlloc(18LL, -1LL);
      *(_DWORD *)uint64_t v27 = 67174913;
      LODWORD(v73) = *(unsigned __int8 *)(v2 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, (char *)&v73 + 4, v27 + 4, v27 + 8);
      *(_WORD *)(v27 + 8) = 2048;
      uint64_t v28 = *(void *)(v2 + 16);
      swift_release(v2);
      uint64_t v73 = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, v74, v27 + 10, v27 + 18);
      swift_release(v2);
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "stop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }",  (uint8_t *)v27,  0x12u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v2, 2LL);
    }

    uint64_t v29 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v14, 1LL, 1LL, v29);
    uint64_t v30 = v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v73, 33LL, 0LL);
    sub_10002D6CC((uint64_t)v14, v30, &qword_100042070);
    swift_endAccess(&v73);
    uint64_t v31 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages;
    uint64_t v32 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    uint64_t v33 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique;
    uint64_t v34 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    Swift::Int64 v35 = *(void *)(v2 + 16);
    int v36 = *(unsigned __int8 *)(v2 + 66);
    uint64_t v37 = *(void *)(v2 + 32);
    uint64_t v38 = *(void *)(v2 + 40);
    LOBYTE(v73) = 2;
    v74[0] = v32;
    v74[1] = v34;
    v74[2] = v35;
    char v75 = v36;
    uint64_t v76 = v37;
    uint64_t v77 = v38;
    char v78 = v66 & 1;
    if (v36 == 1)
    {
      swift_bridgeObjectRetain(v38);
      unint64_t v39 = sub_10002D8F4();
      swift_bridgeObjectRelease(v38);
      uint64_t v40 = type metadata accessor for Message.Metadata(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56LL))(v9, 1LL, 1LL, v40);
      unint64_t v41 = (unint64_t)v63;
      Message.init(category:type:content:metadata:)(8LL, 2LL, v39, v9);
      if ((sub_100022FC4(v41) & 1) == 0)
      {
        uint64_t v42 = swift_retain(v2);
        os_log_type_t v43 = (os_log_s *)Logger.logObject.getter(v42);
        os_log_type_t v44 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v45 = 134217984;
          Swift::Int64 v72 = v35;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v45 + 4, v45 + 12);
          swift_release(v2);
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "Stop message dropped. { reporterID=%lld }", v45, 0xCu);
          swift_slowDealloc(v45, -1LL, -1LL);
        }

        else
        {

          swift_release(v2);
        }
      }

      (*(void (**)(unint64_t, uint64_t))(v64 + 8))(v41, v62);
    }

    else
    {
      uint64_t v46 = swift_retain(v2);
      uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      os_log_type_t v48 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v49 = 134217984;
        Swift::Int64 v72 = v35;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v49 + 4, v49 + 12);
        swift_release(v2);
        _os_log_impl( (void *)&_mh_execute_header,  v47,  v48,  "Not sending stop message, because !isStarted. { reporterID=%lld }",  v49,  0xCu);
        swift_slowDealloc(v49, -1LL, -1LL);
      }

      else
      {
        swift_release(v2);
      }
    }

    uint64_t v50 = swift_retain(v2);
    uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
    os_log_type_t v52 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v53 = 134217984;
      Swift::Int64 v72 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v53 + 4, v53 + 12);
      swift_release(v2);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Ending session. { reporterID=%lld }", v53, 0xCu);
      swift_slowDealloc(v53, -1LL, -1LL);
    }

    else
    {
      swift_release(v2);
    }

    uint64_t v54 = v65;

    uint64_t v56 = v67;
    uint64_t v55 = v68;
    uint64_t v57 = v69;
    (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, enum case for TraceCode.sessionStop(_:), v69);
    uint64_t v58 = static Utilities.positiveReporterID(_:)(v35);
    char v59 = v70;
    TraceArgs.init(arg1:arg2:arg3:arg4:)(v58, *(unsigned __int16 *)(v2 + 64), 0LL, 0LL);
    static Trace.post(_:args:)(v56, v59);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v59, v54);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
    sub_100027278();
    *(_BYTE *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
    *(void *)(v2 + v31) = 0LL;
    *(void *)(v2 + v33) = 0LL;
    *(_BYTE *)(v2 + 66) = 0;
    uint64_t v60 = type metadata accessor for OsTransactionHandler(0LL);
    uint64_t v61 = static OsTransactionHandler.shared.getter(v60);
    OsTransactionHandler.sessionStopped(for:)(v35);
    return swift_release(v61);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100025940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v8 = *(void **)(a1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v7);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    swift_beginAccess(a1 + 72, v16, 1LL, 0LL);
    uint64_t v11 = *(void *)(a1 + 72);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(a2);
    uint64_t v13 = sub_100025A48(v12, v11);
    uint64_t v14 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = v13;
    return swift_bridgeObjectRelease(v14);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100025A48(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a2);
  uint64_t v8 = a2;
  sub_10002BC50(a1, (uint64_t)sub_10002BBCC, 0LL, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  if (v2) {
    swift_bridgeObjectRelease(v6);
  }
  return v6;
}

uint64_t sub_100025AC4@<X0>(unint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_100022FC4(a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_100025B04(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v97 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v96 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  uint64_t v95 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v102 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
    uint64_t v99 = (void *)(v1 + 88);
    uint64_t v93 = (void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    int v101 = *(unsigned __int8 *)(v1 + 24);
    uint64_t v90 = v105;
    __n128 v6 = swift_bridgeObjectRetain(a1);
    uint64_t v7 = 0LL;
    v6.n128_u64[0] = 136380931LL;
    __n128 v100 = v6;
    Swift::UInt32 v91 = (char *)&type metadata for Any + 8;
    v6.n128_u64[0] = 136315394LL;
    __n128 v92 = v6;
    uint64_t v94 = a1;
    uint64_t v98 = v5;
    while (1)
    {
      __int128 v103 = *(_OWORD *)(a1 + 16 * v7 + 32);
      if (v101
        && ((uint64_t v8 = v103, swift_conformsToProtocol2(v103, &protocol descriptor for RunOnSingleMessageSession))
          ? (uint64_t v9 = v8)
          : (uint64_t v9 = 0LL),
            !v9))
      {
        uint64_t v63 = swift_retain_n(v2, 2LL);
        uint64_t v17 = (os_log_s *)Logger.logObject.getter(v63);
        os_log_type_t v64 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v64))
        {
          uint64_t v19 = swift_slowAlloc(22LL, -1LL);
          uint64_t v20 = swift_slowAlloc(32LL, -1LL);
          *(void *)&__int128 v110 = v20;
          *(_DWORD *)uint64_t v19 = v100.n128_u32[0];
          __int128 v112 = v103;
          uint64_t v65 = sub_100005EA4(&qword_100042058);
          uint64_t v66 = String.init<A>(describing:)(&v112, v65);
          unint64_t v68 = v67;
          *(void *)(v19 + 4) = sub_100028CC4(v66, v67, (uint64_t *)&v110);
          swift_bridgeObjectRelease(v68);
          *(_WORD *)(v19 + 12) = 2048;
          uint64_t v69 = *(void *)(v2 + 16);
          swift_release(v2);
          *(void *)(v19 + 14) = v69;
          swift_release(v2);
          _os_log_impl( (void *)&_mh_execute_header,  v17,  v64,  "Skipping worker on singleMessageSession. { worker=%{private}s, reporterID=%lld }",  (uint8_t *)v19,  0x16u);
          uint64_t v27 = v20;
          BOOL v26 = v91;
          goto LABEL_25;
        }
      }

      else
      {
        sub_100022E60((uint64_t)&v107);
        uint64_t v10 = v103;
        uint64_t v11 = type metadata accessor for Optional(0LL, v103);
        uint64_t v12 = *(void *)(v11 - 8);
        __chkstk_darwin(v11);
        uint64_t v14 = (char *)&v90 - v13;
        dispatch thunk of WorkerProtocol.init(with:)(&v107, v10, *((void *)&v103 + 1));
        uint64_t v15 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1LL, v10) != 1)
        {
          __int128 v111 = v103;
          uint64_t v28 = sub_1000132D8(&v110);
          (*(void (**)(void *, char *, uint64_t))(v15 + 32))(v28, v14, v10);
          sub_10002D514(&v110, (uint64_t)&v112);
          uint64_t v29 = v113;
          uint64_t v30 = v114;
          sub_100013314(&v112, v113);
          if ((dispatch thunk of WorkerProtocol.start()(v29, v30) & 1) != 0)
          {
            sub_10002D688((uint64_t)&v112, (uint64_t)&v110);
            uint64_t v31 = v99;
            swift_beginAccess(v99, &v107, 33LL, 0LL);
            uint64_t v32 = (void *)*v31;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v31);
            *uint64_t v31 = v32;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v32 = sub_100028868(0LL, v32[2] + 1LL, 1, v32, &qword_100042008, &qword_100041E20);
              *uint64_t v99 = v32;
            }

            unint64_t v35 = v32[2];
            unint64_t v34 = v32[3];
            if (v35 >= v34 >> 1)
            {
              uint64_t v32 = sub_100028868((void *)(v34 > 1), v35 + 1, 1, v32, &qword_100042008, &qword_100041E20);
              *uint64_t v99 = v32;
            }

            v32[2] = v35 + 1;
            sub_10002D514(&v110, (uint64_t)&v32[5 * v35 + 4]);
            swift_endAccess(&v107);
            sub_10002D688((uint64_t)&v112, (uint64_t)&v107);
            uint64_t v36 = sub_100005EA4(&qword_100041E20);
            uint64_t v37 = sub_100005EA4(&qword_100041E28);
            if ((swift_dynamicCast(v105, &v107, v36, v37, 6LL) & 1) != 0)
            {
              sub_10002D514(v105, (uint64_t)&v110);
              sub_10002D688((uint64_t)&v112, (uint64_t)&v107);
              uint64_t v38 = swift_retain_n(v2, 2LL);
              unint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
              os_log_type_t v40 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v39, v40))
              {
                uint64_t v41 = swift_slowAlloc(22LL, -1LL);
                uint64_t v42 = swift_slowAlloc(32LL, -1LL);
                *(void *)&v105[0] = v42;
                *(_DWORD *)uint64_t v41 = v100.n128_u32[0];
                *(void *)&__int128 v103 = v41 + 4;
                uint64_t v44 = v108;
                uint64_t v43 = v109;
                sub_100013314(&v107, v108);
                uint64_t v45 = v95;
                uint64_t v46 = dispatch thunk of WorkerProtocol.workerConfig.getter(v44, v43);
                uint64_t v47 = Config.WorkerConfigs.rawValue.getter(v46);
                unint64_t v49 = v48;
                (*(void (**)(char *, uint64_t))(v96 + 8))(v45, v97);
                uint64_t v104 = sub_100028CC4(v47, v49, (uint64_t *)v105);
                uint64_t v50 = v90;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v90, v103, v41 + 12);
                swift_bridgeObjectRelease(v49);
                sub_100013384(&v107);
                *(_WORD *)(v41 + 12) = 2048;
                uint64_t v51 = *(void *)(v2 + 16);
                swift_release(v2);
                uint64_t v104 = v51;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v50, v41 + 14, v41 + 22);
                swift_release(v2);
                _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "Adding decorator worker. { worker=%{private}s, reporterID=%lld }",  (uint8_t *)v41,  0x16u);
                swift_arrayDestroy(v42, 1LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v42, -1LL, -1LL);
                uint64_t v52 = v41;
                a1 = v94;
                swift_slowDealloc(v52, -1LL, -1LL);
              }

              else
              {

                swift_release(v2);
                sub_100013384(&v107);
                swift_release(v2);
              }

              sub_10002D688((uint64_t)&v110, (uint64_t)&v107);
              uint64_t v70 = v93;
              swift_beginAccess(v93, v105, 33LL, 0LL);
              uint64_t v71 = (void *)*v70;
              char v72 = swift_isUniquelyReferenced_nonNull_native(*v70);
              *uint64_t v70 = v71;
              if ((v72 & 1) == 0)
              {
                uint64_t v71 = sub_100028868(0LL, v71[2] + 1LL, 1, v71, &qword_100042000, &qword_100041E28);
                *uint64_t v93 = v71;
              }

              unint64_t v74 = v71[2];
              unint64_t v73 = v71[3];
              if (v74 >= v73 >> 1)
              {
                uint64_t v71 = sub_100028868((void *)(v73 > 1), v74 + 1, 1, v71, &qword_100042000, &qword_100041E28);
                *uint64_t v93 = v71;
              }

              v71[2] = v74 + 1;
              sub_10002D514(&v107, (uint64_t)&v71[5 * v74 + 4]);
              swift_endAccess(v105);
              sub_100013384(&v110);
            }

            else
            {
              uint64_t v106 = 0LL;
              memset(v105, 0, sizeof(v105));
              sub_10002D838((uint64_t)v105, &qword_100041FF8);
            }

            sub_10002D688((uint64_t)&v112, (uint64_t)&v110);
            uint64_t v75 = swift_retain_n(v2, 2LL);
            uint64_t v76 = (os_log_s *)Logger.logObject.getter(v75);
            os_log_type_t v77 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v76, v77))
            {
              uint64_t v78 = swift_slowAlloc(22LL, -1LL);
              uint64_t v79 = swift_slowAlloc(32LL, -1LL);
              *(void *)&__int128 v107 = v79;
              *(_DWORD *)uint64_t v78 = v92.n128_u32[0];
              __int128 v80 = v111;
              sub_100013314(&v110, v111);
              uint64_t v81 = v95;
              uint64_t v82 = dispatch thunk of WorkerProtocol.workerConfig.getter(v80, *((void *)&v80 + 1));
              uint64_t v83 = Config.WorkerConfigs.rawValue.getter(v82);
              unint64_t v85 = v84;
              (*(void (**)(char *, uint64_t))(v96 + 8))(v81, v97);
              *(void *)(v78 + 4) = sub_100028CC4(v83, v85, (uint64_t *)&v107);
              swift_bridgeObjectRelease(v85);
              sub_100013384(&v110);
              *(_WORD *)(v78 + 12) = 2048;
              uint64_t v86 = *(void *)(v2 + 16);
              swift_release(v2);
              *(void *)(v78 + 14) = v86;
              swift_release(v2);
              _os_log_impl( (void *)&_mh_execute_header,  v76,  v77,  "Started worker. { worker=%s, reporterID=%lld }",  (uint8_t *)v78,  0x16u);
              swift_arrayDestroy(v79, 1LL, (char *)&type metadata for Any + 8);
              uint64_t v87 = v79;
              a1 = v94;
              swift_slowDealloc(v87, -1LL, -1LL);
              swift_slowDealloc(v78, -1LL, -1LL);
            }

            else
            {

              swift_release(v2);
              sub_100013384(&v110);
              swift_release(v2);
            }

            uint64_t v5 = v98;
          }

          else
          {
            uint64_t v53 = swift_retain_n(v2, 2LL);
            uint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
            os_log_type_t v55 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v54, v55))
            {
              uint64_t v56 = swift_slowAlloc(22LL, -1LL);
              uint64_t v57 = swift_slowAlloc(32LL, -1LL);
              *(void *)&__int128 v107 = v57;
              *(_DWORD *)uint64_t v56 = v100.n128_u32[0];
              __int128 v110 = v103;
              uint64_t v58 = sub_100005EA4(&qword_100042058);
              uint64_t v59 = String.init<A>(describing:)(&v110, v58);
              unint64_t v61 = v60;
              *(void *)(v56 + 4) = sub_100028CC4(v59, v60, (uint64_t *)&v107);
              swift_bridgeObjectRelease(v61);
              *(_WORD *)(v56 + 12) = 2048;
              uint64_t v62 = *(void *)(v2 + 16);
              swift_release(v2);
              *(void *)(v56 + 14) = v62;
              swift_release(v2);
              _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "Unable to start worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }",  (uint8_t *)v56,  0x16u);
              swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v57, -1LL, -1LL);
              swift_slowDealloc(v56, -1LL, -1LL);
            }

            else
            {

              swift_release_n(v2, 2LL);
            }
          }

          sub_100013384(&v112);
          goto LABEL_4;
        }

        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        uint64_t v16 = swift_retain_n(v2, 2LL);
        uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
        os_log_type_t v18 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = swift_slowAlloc(22LL, -1LL);
          uint64_t v20 = swift_slowAlloc(32LL, -1LL);
          *(void *)&__int128 v110 = v20;
          *(_DWORD *)uint64_t v19 = v100.n128_u32[0];
          __int128 v112 = v103;
          uint64_t v21 = sub_100005EA4(&qword_100042058);
          uint64_t v22 = String.init<A>(describing:)(&v112, v21);
          unint64_t v24 = v23;
          *(void *)(v19 + 4) = sub_100028CC4(v22, v23, (uint64_t *)&v110);
          swift_bridgeObjectRelease(v24);
          *(_WORD *)(v19 + 12) = 2048;
          uint64_t v25 = *(void *)(v2 + 16);
          swift_release(v2);
          *(void *)(v19 + 14) = v25;
          swift_release(v2);
          _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "Unable to initialize worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }",  (uint8_t *)v19,  0x16u);
          BOOL v26 = (char *)&type metadata for Any + 8;
          uint64_t v27 = v20;
LABEL_25:
          swift_arrayDestroy(v27, 1LL, v26);
          swift_slowDealloc(v20, -1LL, -1LL);
          swift_slowDealloc(v19, -1LL, -1LL);

          goto LABEL_4;
        }
      }

      swift_release_n(v2, 2LL);
LABEL_4:
      if (v5 == ++v7)
      {
        swift_bridgeObjectRelease(a1);
        break;
      }
    }
  }

  uint64_t v88 = (void *)(v2 + 88);
  swift_beginAccess(v88, &v112, 33LL, 0LL);
  sub_100027204(v88, (uint64_t (*)(uint64_t))&Config.WorkerConfigs.messageProcessOrder.getter);
  return swift_endAccess(&v112);
}

uint64_t sub_100026714(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Message(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v35 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100005EA4(&qword_100042040);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100005EA4(&qword_100041FF0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v36 = (uint64_t)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v34 - v16;
  Swift::UInt32 v18 = Message.category.getter(v15);
  uint64_t v19 = (uint64_t *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory);
  swift_beginAccess(v19, v37, 32LL, 0LL);
  uint64_t v20 = *v19;
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_10001F388(v18), (v22 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))( v17,  *(void *)(v20 + 56) + *(void *)(v4 + 72) * v21,  v3);
    unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 0LL, 1LL, v3);
  }

  else
  {
    unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 1LL, 1LL, v3);
  }

  swift_endAccess(v37);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v14, a1, v3);
  v23(v14, 0LL, 1LL, v3);
  uint64_t v24 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_100006654((uint64_t)v17, (uint64_t)v8, &qword_100041FF0);
  sub_100006654((uint64_t)v14, v24, &qword_100041FF0);
  uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v25((uint64_t)v8, 1LL, v3) == 1)
  {
    sub_10002D838((uint64_t)v14, &qword_100041FF0);
    sub_10002D838((uint64_t)v17, &qword_100041FF0);
    int v26 = v25(v24, 1LL, v3);
    if (v26 == 1) {
      uint64_t v27 = &qword_100041FF0;
    }
    else {
      uint64_t v27 = &qword_100042040;
    }
    if (v26 == 1) {
      char v28 = -1;
    }
    else {
      char v28 = 0;
    }
  }

  else
  {
    uint64_t v29 = v36;
    sub_100006654((uint64_t)v8, v36, &qword_100041FF0);
    if (v25(v24, 1LL, v3) == 1)
    {
      sub_10002D838((uint64_t)v14, &qword_100041FF0);
      sub_10002D838((uint64_t)v17, &qword_100041FF0);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v29, v3);
      char v28 = 0;
      uint64_t v27 = &qword_100042040;
    }

    else
    {
      uint64_t v30 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v35, v24, v3);
      uint64_t v31 = sub_1000061B8( &qword_100042048,  (uint64_t (*)(uint64_t))&type metadata accessor for Message,  (uint64_t)&protocol conformance descriptor for Message);
      char v28 = dispatch thunk of static Equatable.== infix(_:_:)(v29, v30, v3, v31);
      uint64_t v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v30, v3);
      uint64_t v27 = &qword_100041FF0;
      sub_10002D838((uint64_t)v14, &qword_100041FF0);
      sub_10002D838((uint64_t)v17, &qword_100041FF0);
      v32((char *)v29, v3);
    }
  }

  sub_10002D838((uint64_t)v8, v27);
  return v28 & 1;
}

uint64_t sub_100026A98()
{
  uint64_t v1 = sub_100005EA4(&qword_100041A80);
  __chkstk_darwin(v1);
  uint64_t v3 = (uint64_t *)&v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v4 = type metadata accessor for Keys(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  (*(void (**)(_BYTE *, void, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  swift_beginAccess(v0 + 9, v13, 32LL, 0LL);
  Dictionary<>.subscript.getter(v7, v0[9]);
  uint64_t v8 = type metadata accessor for SimpleType(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(v3, 1LL, v8) == 1)
  {
    sub_10002D838((uint64_t)v3, &qword_100041A80);
LABEL_6:
    swift_endAccess(v13);
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v10 = v0[4];
    swift_bridgeObjectRetain(v0[5]);
    return v10;
  }

  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v3, v8) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v3, v8);
    goto LABEL_6;
  }

  (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v3, v8);
  uint64_t v10 = *v3;
  swift_endAccess(v13);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void *sub_100026C50(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers, v21, 0LL, 0LL);
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain(*v3);
  uint64_t v6 = sub_1000280D8(v5);
  swift_bridgeObjectRelease(v4);
  if (a1 && *(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain(a1);
    uint64_t v7 = sub_10002D128((uint64_t)v6, a1);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(a1);
    uint64_t v6 = v7;
  }

  uint64_t v8 = v6[2];
  if (v8)
  {
    uint64_t v9 = (uint64_t)(v6 + 4);
    swift_bridgeObjectRetain(v6);
    uint64_t v10 = _swiftEmptyArrayStorage;
    do
    {
      sub_10002D688(v9, (uint64_t)v20);
      sub_10002D688((uint64_t)v20, (uint64_t)v19);
      uint64_t v11 = sub_100005EA4(&qword_100041E20);
      uint64_t v12 = sub_100005EA4(&qword_100041E28);
      if ((swift_dynamicCast(&v16, v19, v11, v12, 6LL) & 1) == 0)
      {
        uint64_t v18 = 0LL;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
      }

      sub_100013384(v20);
      if (*((void *)&v17 + 1))
      {
        sub_10002D514(&v16, (uint64_t)v19);
        sub_10002D514(v19, (uint64_t)&v16);
        if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0) {
          uint64_t v10 = sub_100028868(0LL, v10[2] + 1LL, 1, v10, &qword_100042000, &qword_100041E28);
        }
        unint64_t v14 = v10[2];
        unint64_t v13 = v10[3];
        if (v14 >= v13 >> 1) {
          uint64_t v10 = sub_100028868((void *)(v13 > 1), v14 + 1, 1, v10, &qword_100042000, &qword_100041E28);
        }
        v10[2] = v14 + 1;
        sub_10002D514(&v16, (uint64_t)&v10[5 * v14 + 4]);
      }

      else
      {
        sub_10002D838((uint64_t)&v16, &qword_100041FF8);
      }

      v9 += 40LL;
      --v8;
    }

    while (v8);
    swift_bridgeObjectRelease_n(v6, 2LL);
  }

  else
  {
    swift_bridgeObjectRelease(v6);
    return _swiftEmptyArrayStorage;
  }

  return v10;
}

uint64_t sub_100026E8C()
{
  uint64_t v1 = *(void *)(v0 + 136);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 136);
  }

  else
  {
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v4 = _s16RetainedMessagesCMa();
    uint64_t v2 = swift_allocObject(v4, 32LL, 7LL);
    *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_100006534((uint64_t)_swiftEmptyArrayStorage);
    *(void *)(v2 + 24) = v3;
    uint64_t v5 = *(void *)(v0 + 136);
    *(void *)(v0 + 136) = v2;
    swift_retain(v2);
    swift_release(v5);
    uint64_t v1 = 0LL;
  }

  swift_retain(v1);
  return v2;
}

uint64_t sub_100026F08()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v2);
  uint64_t v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v5 = type metadata accessor for Message(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    uint64_t v12 = *(void **)(v0 + 16);
    char v13 = *(_BYTE *)(v0 + 66);
    uint64_t v14 = *(void *)(v0 + 32);
    uint64_t v15 = *(void *)(v0 + 40);
    v30[24] = 0;
    uint64_t v31 = v10;
    uint64_t v32 = v11;
    uint64_t v33 = v12;
    char v34 = v13;
    uint64_t v35 = v14;
    uint64_t v36 = v15;
    char v37 = 0;
    swift_bridgeObjectRetain(v15);
    unint64_t v16 = sub_10002D8F4();
    swift_bridgeObjectRelease(v15);
    uint64_t v17 = type metadata accessor for Message.Metadata(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v4, 1LL, 1LL, v17);
    Message.init(category:type:content:metadata:)(8LL, 1LL, v16, v4);
    uint64_t v18 = *(void *)(v1 + 80);
    if (v18 && *(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain(*(void *)(v1 + 80));
      uint64_t v20 = Config.neededPreviousFields.getter(v19);
      Message.copyPrevious(fields:from:)(v20, v18);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v20);
    }

    swift_beginAccess(&static SystemMonitor.shared, v30, 0LL, 0LL);
    uint64_t v21 = static SystemMonitor.shared;
    if (static SystemMonitor.shared)
    {
      uint64_t v22 = *(void *)(static SystemMonitor.shared + 16);
      swift_retain(static SystemMonitor.shared);
      swift_retain(v22);
      os_unfair_lock_lock((os_unfair_lock_t)(v22 + 24));
      sub_100030554((void *)(v22 + 16), &v29);
      os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 24));
      v23._rawValue = v29;
      swift_release(v21);
      swift_release(v22);
      Message.addToContent(from:)(v23);
      swift_bridgeObjectRelease(v23._rawValue);
    }

    if ((sub_100022FC4((unint64_t)v9) & 1) == 0)
    {
      uint64_t v24 = swift_retain(v1);
      uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
      os_log_type_t v26 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v27 = 134217984;
        uint64_t v29 = v12;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v27 + 4, v27 + 12);
        swift_release(v1);
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Start message dropped. { reporterID=%lld }", v27, 0xCu);
        swift_slowDealloc(v27, -1LL, -1LL);
      }

      else
      {

        swift_release(v1);
      }
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
  }

  return result;
}

Swift::Int sub_100027204(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = (void *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v4 = sub_10002C6EC(v4);
  }
  uint64_t v5 = v4[2];
  v7[0] = v4 + 4;
  v7[1] = v5;
  Swift::Int result = sub_10002A7C0(v7, a2);
  *a1 = v4;
  return result;
}

void sub_100027278()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  __chkstk_darwin(v2);
  unint64_t v39 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = (void *)(v0 + 88);
  swift_beginAccess(v0 + 88, v51, 0LL, 0LL);
  if (*(void *)(*(void *)(v0 + 88) + 16LL))
  {
    swift_beginAccess(v0 + 88, v48, 33LL, 0LL);
    sub_100027204((void *)(v0 + 88), (uint64_t (*)(uint64_t))&Config.WorkerConfigs.stopOrder.getter);
    swift_endAccess(v48);
    uint64_t v5 = *v4;
    uint64_t v6 = *(void *)(*v4 + 16LL);
    if (v6)
    {
      uint64_t v36 = (void *)(v0 + 88);
      uint64_t v7 = v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
      uint64_t v8 = v5 + 32;
      uint64_t v35 = v5;
      __n128 v9 = swift_bridgeObjectRetain(v5);
      v9.n128_u64[0] = 136315394LL;
      __n128 v38 = v9;
      char v37 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10002D688(v8, (uint64_t)v48);
        sub_10002D688((uint64_t)v48, (uint64_t)v45);
        uint64_t v12 = swift_retain_n(v1, 2LL);
        char v13 = (os_log_s *)Logger.logObject.getter(v12);
        os_log_type_t v14 = static os_log_type_t.debug.getter();
        int v15 = v14;
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v16 = swift_slowAlloc(22LL, -1LL);
          uint64_t v43 = swift_slowAlloc(32LL, -1LL);
          uint64_t v44 = v43;
          *(_DWORD *)uint64_t v16 = v38.n128_u32[0];
          uint64_t v17 = v46;
          uint64_t v18 = v47;
          sub_100013314(v45, v46);
          uint64_t v19 = v7;
          uint64_t v20 = v1;
          uint64_t v21 = v39;
          int v42 = v15;
          uint64_t v22 = dispatch thunk of WorkerProtocol.workerConfig.getter(v17, v18);
          uint64_t v23 = Config.WorkerConfigs.rawValue.getter(v22);
          unint64_t v25 = v24;
          os_log_type_t v26 = v21;
          uint64_t v1 = v20;
          uint64_t v7 = v19;
          (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v41);
          *(void *)(v16 + 4) = sub_100028CC4(v23, v25, &v44);
          swift_bridgeObjectRelease(v25);
          sub_100013384(v45);
          *(_WORD *)(v16 + 12) = 2048;
          uint64_t v27 = *(void *)(v1 + 16);
          swift_release(v1);
          *(void *)(v16 + 14) = v27;
          swift_release(v1);
          _os_log_impl( (void *)&_mh_execute_header,  v13,  (os_log_type_t)v42,  "Stopping worker { worker=%s, reporterID=%lld  }",  (uint8_t *)v16,  0x16u);
          uint64_t v28 = v43;
          swift_arrayDestroy(v43, 1LL, v37);
          swift_slowDealloc(v28, -1LL, -1LL);
          swift_slowDealloc(v16, -1LL, -1LL);
        }

        else
        {

          swift_release(v1);
          sub_100013384(v45);
          swift_release(v1);
        }

        uint64_t v10 = v49;
        uint64_t v11 = v50;
        sub_100013314(v48, v49);
        dispatch thunk of WorkerProtocol.stop()(v10, v11);
        sub_100013384(v48);
        v8 += 40LL;
        --v6;
      }

      while (v6);
      swift_bridgeObjectRelease(v35);
      uint64_t v4 = v36;
    }

    swift_beginAccess(v4, v48, 33LL, 0LL);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v30 = *v4;
    if (isUniquelyReferenced_nonNull_native)
    {
      sub_1000225AC(0LL, *(void *)(v30 + 16));
    }

    else
    {
      *uint64_t v4 = sub_10002C314(0LL, *(void *)(v30 + 24) >> 1, &qword_100042008);
      swift_bridgeObjectRelease(v30);
    }

    swift_endAccess(v48);
    uint64_t v31 = (void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers, v48, 33LL, 0LL);
    int v32 = swift_isUniquelyReferenced_nonNull_native(*v31);
    uint64_t v33 = *v31;
    if (v32)
    {
      sub_1000225C0(0LL, *(void *)(v33 + 16));
    }

    else
    {
      *uint64_t v31 = sub_10002C314(0LL, *(void *)(v33 + 24) >> 1, &qword_100042000);
      swift_bridgeObjectRelease(v33);
    }

    swift_endAccess(v48);
  }

void sub_100027650()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  __chkstk_darwin(v2);
  uint64_t v50 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  __chkstk_darwin(v4);
  uint64_t v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  __n128 v9 = (uint64_t *)((char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v46 = type metadata accessor for DispatchTime(0LL);
  uint64_t v44 = *(void *)(v46 - 8);
  uint64_t v10 = __chkstk_darwin(v46);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v53 = (char *)&v43 - v13;
  uint64_t v14 = sub_100005EA4(&qword_100042070);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (uint64_t *)((char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  void *v20 = v21;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, enum case for DispatchPredicate.onQueue(_:), v17);
  id v45 = v21;
  LOBYTE(v21) = _dispatchPreconditionTest(_:)(v20);
  (*(void (**)(void *, uint64_t))(v18 + 8))(v20, v17);
  if ((v21 & 1) != 0)
  {
    uint64_t v22 = swift_retain(v1);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)unint64_t v25 = 134217984;
      aBlock = *(void ***)(v1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v56, v25 + 4, v25 + 12);
      swift_release(v1);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "enqueueStop() called. { reporterID=%lld }", v25, 0xCu);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      swift_release(v1);
    }

    if (*(_BYTE *)(v1 + 66) == 1)
    {
      uint64_t v26 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, v58, 0LL, 0LL);
      sub_100006654(v26, (uint64_t)v16, &qword_100042070);
      uint64_t v27 = type metadata accessor for Date(0LL);
      LODWORD(v26) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48LL))(v16, 1LL, v27);
      uint64_t v28 = sub_10002D838((uint64_t)v16, &qword_100042070);
      if ((_DWORD)v26 != 1)
      {
        static DispatchTime.now()(v28);
        *__n128 v9 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
        (*(void (**)(void *, void, uint64_t))(v7 + 104))( v9,  enum case for DispatchTimeInterval.seconds(_:),  v6);
        + infix(_:_:)(v12, v9);
        (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
        uint64_t v29 = *(void (**)(char *, uint64_t))(v44 + 8);
        uint64_t v30 = v46;
        v29(v12, v46);
        uint64_t v31 = swift_allocObject(&unk_10003E258, 24LL, 7LL);
        swift_weakInit(v31 + 16, v1);
        v56[3] = sub_10002D7BC;
        uint64_t v57 = v31;
        aBlock = _NSConcreteStackBlock;
        v56[0] = 1107296256LL;
        v56[1] = sub_1000172EC;
        v56[2] = &unk_10003E270;
        int v32 = _Block_copy(&aBlock);
        uint64_t v33 = swift_retain(v31);
        uint64_t v34 = v47;
        static DispatchQoS.unspecified.getter(v33);
        uint64_t v54 = _swiftEmptyArrayStorage;
        uint64_t v35 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        uint64_t v36 = sub_100005EA4((uint64_t *)&unk_100041BC0);
        uint64_t v37 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
        __n128 v38 = v50;
        uint64_t v39 = v36;
        uint64_t v40 = v52;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v54, v39, v37, v52, v35);
        uint64_t v41 = v53;
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v53, v34, v38, v32);
        _Block_release(v32);
        (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v40);
        (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v49);
        v29(v41, v30);
        uint64_t v42 = v57;
        swift_release(v31);
        swift_release(v42);
      }
    }
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100027B6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v43 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v42 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v41 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100005EA4(&qword_100042070);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v50, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a1);
  if (result)
  {
    uint64_t v18 = result;
    uint64_t v40 = v4;
    uint64_t v19 = result + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess(result + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, v49, 0LL, 0LL);
    sub_100006654(v19, (uint64_t)v12, &qword_100042070);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
    {
      swift_release(v18);
      return sub_10002D838((uint64_t)v12, &qword_100042070);
    }

    else
    {
      uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      double v21 = fabs(Date.timeIntervalSinceNow.getter(v20));
      double v22 = (double)*(uint64_t *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
      uint64_t v23 = swift_retain(v18);
      os_log_type_t v24 = (os_log_s *)Logger.logObject.getter(v23);
      os_log_type_t v25 = static os_log_type_t.debug.getter();
      BOOL v26 = os_log_type_enabled(v24, v25);
      uint64_t v39 = v2;
      if (v21 <= v22)
      {
        if (v26)
        {
          uint64_t v28 = swift_slowAlloc(22LL, -1LL);
          *(_DWORD *)uint64_t v28 = 134218240;
          double aBlock = v22 - v21;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v28 + 4, v28 + 12);
          *(_WORD *)(v28 + 12) = 2048;
          double aBlock = *(double *)(v18 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v28 + 14, v28 + 22);
          swift_release(v18);
          _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Not stopping session from timer. { remainingTime=%f, reporterID=%lld }",  (uint8_t *)v28,  0x16u);
          swift_slowDealloc(v28, -1LL, -1LL);
        }

        else
        {
          swift_release(v18);
        }

        uint64_t v38 = *(void *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v47 = sub_10002D7C4;
        uint64_t v48 = v18;
        double aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        v46[0] = 1107296256LL;
        uint64_t v29 = &unk_10003E298;
      }

      else
      {
        if (v26)
        {
          uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)uint64_t v27 = 134217984;
          double aBlock = *(double *)(v18 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v27 + 4, v27 + 12);
          swift_release(v18);
          _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Calling stop on session from timer. { reporterID=%lld }",  v27,  0xCu);
          swift_slowDealloc(v27, -1LL, -1LL);
        }

        else
        {
          swift_release(v18);
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v10, 1LL, 1LL, v13);
        swift_beginAccess(v19, &aBlock, 33LL, 0LL);
        sub_10002D6CC((uint64_t)v10, v19, &qword_100042070);
        swift_endAccess(&aBlock);
        uint64_t v38 = *(void *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v47 = sub_10002D7C8;
        uint64_t v48 = v18;
        double aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        v46[0] = 1107296256LL;
        uint64_t v29 = &unk_10003E2C0;
      }

      v46[1] = sub_1000172EC;
      v46[2] = v29;
      uint64_t v30 = _Block_copy(&aBlock);
      uint64_t v31 = swift_retain(v18);
      static DispatchQoS.unspecified.getter(v31);
      uint64_t v44 = _swiftEmptyArrayStorage;
      uint64_t v32 = sub_1000061B8( (unint64_t *)&qword_1000416E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v33 = sub_100005EA4((uint64_t *)&unk_100041BC0);
      uint64_t v34 = sub_10001DC5C((unint64_t *)&qword_1000416F0, (uint64_t *)&unk_100041BC0);
      uint64_t v35 = v42;
      uint64_t v36 = v33;
      uint64_t v37 = v39;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v44, v36, v34, v39, v32);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v6, v35, v30);
      _Block_release(v30);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v37);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v40);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      swift_release(v18);
      return swift_release(v48);
    }
  }

  return result;
}

void *sub_1000280D8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v12 = _swiftEmptyArrayStorage;
    sub_100029B3C(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = _swiftEmptyArrayStorage;
    do
    {
      sub_10002D688(v4, (uint64_t)v10);
      uint64_t v5 = sub_100005EA4(&qword_100041E28);
      uint64_t v6 = sub_100005EA4(&qword_100041E20);
      swift_dynamicCast(v11, v10, v5, v6, 7LL);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_100029B3C(0, v2[2] + 1LL, 1);
        uint64_t v2 = v12;
      }

      unint64_t v8 = v2[2];
      unint64_t v7 = v2[3];
      if (v8 >= v7 >> 1)
      {
        sub_100029B3C(v7 > 1, v8 + 1, 1);
        uint64_t v2 = v12;
      }

      v2[2] = v8 + 1;
      sub_10002D514(v11, (uint64_t)&v2[5 * v8 + 4]);
      v4 += 40LL;
      --v1;
    }

    while (v1);
  }

  return v2;
}

void sub_100028210(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = swift_retain_n(v1, 2LL);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc(22LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v8;
    *(_DWORD *)uint64_t v7 = 136380931;
    uint64_t v9 = static Utilities.serviceTypeDescription(from:)(a1);
    unint64_t v11 = v10;
    uint64_t v13 = sub_100028CC4(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v7 + 12) = 2048;
    uint64_t v12 = *(void *)(v2 + 16);
    swift_release(v2);
    uint64_t v13 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 14, v7 + 22);
    swift_release(v2);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "serviceType set. { serviceType=%{private}s, reporterID=%lld }",  (uint8_t *)v7,  0x16u);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v1, 2LL);
  }

void *sub_1000283A4()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  swift_bridgeObjectRelease(*(void *)((char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers));
  sub_10002D838((uint64_t)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &qword_100042070);
  swift_bridgeObjectRelease(*(void *)((char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory));
  return v0;
}

uint64_t sub_100028470()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100028494()
{
  return type metadata accessor for Session(0LL);
}

uint64_t type metadata accessor for Session(uint64_t a1)
{
  uint64_t result = qword_100041EC0;
  if (!qword_100041EC0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Session);
  }
  return result;
}

void sub_1000284D8(uint64_t a1)
{
  v6[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[1] = &unk_100035D80;
  v6[2] = &unk_100035D98;
  v6[3] = (char *)&value witness table for Builtin.Int32 + 64;
  v6[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v6[5] = (char *)&value witness table for Builtin.Int16 + 64;
  v6[6] = &unk_100035D80;
  v6[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[8] = &unk_100035DB0;
  void v6[9] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[10] = &unk_100035DC8;
  v6[11] = &unk_100035DB0;
  uint64_t v2 = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v6[12] = *(void *)(v2 - 8) + 64LL;
    v6[13] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[14] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[15] = (char *)&value witness table for Builtin.BridgeObject + 64;
    sub_100028600(319LL);
    if (v5 <= 0x3F)
    {
      v6[16] = *(void *)(v4 - 8) + 64LL;
      v6[17] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v6[18] = (char *)&value witness table for Builtin.Int64 + 64;
      v6[19] = (char *)&value witness table for Builtin.Int64 + 64;
      v6[20] = &unk_100035D80;
      swift_updateClassMetadata2(a1, 256LL, 21LL, v6, a1 + 80);
    }
  }

void sub_100028600(uint64_t a1)
{
  if (!qword_100041ED0)
  {
    uint64_t v2 = type metadata accessor for Date(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100041ED0);
    }
  }

uint64_t sub_100028654()
{
  uint64_t v1 = type metadata accessor for Message(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000286C8()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Message(0LL) - 8) + 80LL);
  return sub_100022FC4(v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_100028708(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100028718(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

char *sub_100028720(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1000289A8( a1,  a2,  a3,  a4,  &qword_100042068,  (void (*)(void, int64_t, char *, char *))sub_10002C810);
}

void *sub_100028734(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100005EA4(&qword_100042078);
      unint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      __int128 v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10002C720(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_100028840(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_100028868(a1, a2, a3, a4, &qword_100042008, &qword_100041E20);
}

void *sub_100028854(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_100028868(a1, a2, a3, a4, &qword_100042000, &qword_100041E28);
}

void *sub_100028868(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_100005EA4(a5);
      uint64_t v14 = (void *)swift_allocObject(v13, 40 * v12 + 32, 7LL);
      size_t v15 = j__malloc_size(v14);
      v14[2] = v11;
      v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
      uint64_t v16 = v14 + 4;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[5 * v11 + 4]) {
          memmove(v16, a4 + 4, 40 * v11);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v14 = _swiftEmptyArrayStorage;
      uint64_t v16 = &_swiftEmptyArrayStorage[4];
    }

    sub_10002D40C(0LL, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

char *sub_100028994(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1000289A8( a1,  a2,  a3,  a4,  &qword_100042020,  (void (*)(void, int64_t, char *, char *))sub_10002C8F8);
}

char *sub_1000289A8( char *result, int64_t a2, char a3, char *a4, uint64_t *a5, void (*a6)(void, int64_t, char *, char *))
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = *((void *)a4 + 3);
  int64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      int64_t v12 = *((void *)a4 + 2);
    }
    else {
      int64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_100005EA4(a5);
      uint64_t v14 = (char *)swift_allocObject(v13, 16 * v12 + 32, 7LL);
      int64_t v15 = j__malloc_size(v14);
      uint64_t v16 = v15 - 32;
      if (v15 < 32) {
        uint64_t v16 = v15 - 17;
      }
      *((void *)v14 + 2) = v11;
      *((void *)v14 + 3) = 2 * (v16 >> 4);
      uint64_t v17 = v14 + 32;
      if ((v8 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v17 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v14 != a4 || v17 >= &a4[16 * v11 + 32]) {
          memmove(v17, a4 + 32, 16 * v11);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    a6(0LL, v11, v17, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

uint64_t sub_100028ABC(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100005EA4(&qword_100042018);
  uint64_t v11 = *(void *)(type metadata accessor for Message(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  int64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_29;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for Message(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    unint64_t v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(void *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }

    else if (v15 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }

    *(void *)(a4 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
  }

  else
  {
    sub_10002D52C(0LL, v8, v21, a4);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_100028CC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100028D94(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100013338((uint64_t)v12, *a3);
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
      sub_100013338((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100013384(v12);
  return v7;
}

uint64_t sub_100028D94(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

uint64_t sub_100028F4C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100028FE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100029230(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100029230(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100028FE0(uint64_t a1, unint64_t a2)
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
      char v5 = sub_100029154(v4, 0LL);
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

void *sub_100029154(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005EA4(&qword_100042010);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000291B8(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100029230(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100042010);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
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

unint64_t sub_10002937C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)(*(void *)(a2 + 40), *v10);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }

        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1LL << result) - 1;
  }

  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1LL);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

unint64_t sub_100029510(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Swift::UInt32 v9 = *(_DWORD *)(*(void *)(a2 + 48) + 4 * v6);
        Hasher.init(_seed:)(v26, *(void *)(a2 + 40));
        Hasher._combine(_:)(v9);
        uint64_t result = Hasher._finalize()();
        unint64_t v10 = result & v7;
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        size_t v12 = (_DWORD *)(v11 + 4 * v3);
        uint64_t v13 = (_DWORD *)(v11 + 4 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *size_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for Message(0LL) - 8) + 72LL);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }

        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }

        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }

      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      goto LABEL_12;
    }

unint64_t sub_1000296F0(int64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v5 = *((void *)v4 - 1);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1LL << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v50 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    uint64_t v12 = v50;
    if ((*(void *)(v50 + 8 * (v10 >> 6)) & (1LL << v10)) != 0)
    {
      uint64_t v48 = v11;
      unint64_t v49 = (result + 1) & v11;
      uint64_t v13 = *(void *)(v5 + 72);
      do
      {
        uint64_t v14 = v13;
        int64_t v15 = v13 * v10;
        sub_10002D874(*(void *)(a2 + 48) + v13 * v10, (uint64_t)v8);
        Hasher.init(_seed:)(v51, *(void *)(a2 + 40));
        uint64_t v16 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
        uint64_t v17 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
        dispatch thunk of Hashable.hash(into:)(v51, v16, v17);
        unint64_t v18 = &v8[v4[5]];
        uint64_t v19 = *(void *)v18;
        uint64_t v20 = *((void *)v18 + 1);
        swift_bridgeObjectRetain(v20);
        String.hash(into:)(v51, v19, v20);
        swift_bridgeObjectRelease(v20);
        uint64_t v21 = &v8[v4[6]];
        uint64_t v22 = *(void *)v21;
        uint64_t v23 = *((void *)v21 + 1);
        swift_bridgeObjectRetain(v23);
        String.hash(into:)(v51, v22, v23);
        swift_bridgeObjectRelease(v23);
        BOOL v24 = &v8[v4[7]];
        uint64_t v25 = *(void *)v24;
        uint64_t v26 = *((void *)v24 + 1);
        swift_bridgeObjectRetain(v26);
        String.hash(into:)(v51, v25, v26);
        swift_bridgeObjectRelease(v26);
        uint64_t v27 = &v8[v4[8]];
        uint64_t v28 = *(void *)v27;
        uint64_t v29 = *((void *)v27 + 1);
        swift_bridgeObjectRetain(v29);
        String.hash(into:)(v51, v28, v29);
        swift_bridgeObjectRelease(v29);
        uint64_t v30 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
        uint64_t v31 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
        dispatch thunk of Hashable.hash(into:)(v51, v30, v31);
        Swift::Int v32 = Hasher._finalize()();
        unint64_t result = sub_10000B7BC((uint64_t)v8);
        Swift::Int v33 = v32 & v11;
        if (a1 >= (uint64_t)v49)
        {
          if (v33 < v49)
          {
            uint64_t v13 = v14;
          }

          else
          {
            uint64_t v13 = v14;
            if (a1 >= v33) {
              goto LABEL_12;
            }
          }
        }

        else
        {
          uint64_t v13 = v14;
          if (v33 >= v49 || a1 >= v33)
          {
LABEL_12:
            uint64_t v34 = *(void *)(a2 + 48);
            unint64_t v35 = v34 + v13 * a1;
            uint64_t v36 = v34 + v15;
            if (v13 * a1 < v15 || v35 >= v36 + v13)
            {
              swift_arrayInitWithTakeFrontToBack(v35, v36, 1LL, v4);
            }

            else if (v13 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront(v35);
            }

            uint64_t v37 = *(void *)(a2 + 56);
            uint64_t v38 = type metadata accessor for FeatureState(0LL);
            uint64_t v39 = *(void *)(*(void *)(v38 - 8) + 72LL);
            int64_t v40 = v39 * a1;
            unint64_t result = v37 + v39 * a1;
            uint64_t v41 = v37 + v39 * v10;
            if (v39 * a1 < (uint64_t)(v39 * v10) || result >= v41 + v39)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack(result, v41, 1LL, v38);
              a1 = v10;
              uint64_t v11 = v48;
            }

            else
            {
              a1 = v10;
              uint64_t v11 = v48;
              if (v40 != v39 * v10)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront(result);
                a1 = v10;
              }
            }
          }
        }

        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v50;
      }

      while (((*(void *)(v50 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
    }

    uint64_t v42 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v43 = *v42;
    uint64_t v44 = (-1LL << a1) - 1;
  }

  else
  {
    uint64_t v42 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v44 = *v42;
    uint64_t v43 = (-1LL << a1) - 1;
  }

  *uint64_t v42 = v44 & v43;
  uint64_t v45 = *(void *)(a2 + 16);
  BOOL v46 = __OFSUB__(v45, 1LL);
  uint64_t v47 = v45 - 1;
  if (v46)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v47;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_100029AB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100029B90(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_100029ACC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100029D70(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100029AE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100029ED8(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100029B04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A034(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100029B20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A180(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100029B3C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A2DC(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_100029B58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A47C(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100029B74(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A5D8(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_100029B90(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    int64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100005EA4(&qword_100042098);
  uint64_t v11 = *(void *)(type metadata accessor for FeatureInfo(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  int64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  BOOL v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

uint64_t sub_100029D70(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100042078);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
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

uint64_t sub_100029ED8(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100041810);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002A034(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100042080);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
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
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002A180(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100042068);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
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
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002A2DC(char a1, int64_t a2, char a3, void *a4)
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
        goto LABEL_30;
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
    uint64_t v10 = sub_100005EA4(&qword_100042008);
    uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    __int128 v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v13 = (unint64_t)(v11 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 40 * v8) {
      memmove(v11 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v14 >= v13 + 40 * v8 || v13 >= v14 + 40 * v8)
  {
    sub_100005EA4(&qword_100041E20);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002A47C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005EA4(&qword_100042090);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002A5D8(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    int64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100005EA4(&qword_100042088);
  uint64_t v11 = *(void *)(sub_100005EA4(&qword_100041688) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  int64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = sub_100005EA4(&qword_100041688);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  BOOL v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

Swift::Int sub_10002A7C0(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v149 = a2;
  uint64_t v148 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v144 = *(void *)(v148 - 8);
  uint64_t v3 = __chkstk_darwin(v148);
  v147 = (char *)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v146 = (char *)&v132 - v5;
  Swift::Int v6 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v6);
  if (result >= v6)
  {
    if (v6 < 0) {
      goto LABEL_136;
    }
    if (v6) {
      return sub_10002B230(0LL, v6, 1LL, a1, v149);
    }
    return result;
  }

  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_144;
  }
  uint64_t v141 = a1;
  if (v6 < 2)
  {
    uint64_t v12 = (char *)_swiftEmptyArrayStorage;
    uint64_t v142 = (char *)&_swiftEmptyArrayStorage[4];
    uint64_t v134 = _swiftEmptyArrayStorage;
    if (v6 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
LABEL_102:
      uint64_t v123 = v143;
      if (v14 >= 2)
      {
        uint64_t v124 = *v141;
        do
        {
          unint64_t v125 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_131;
          }
          if (!v124) {
            goto LABEL_143;
          }
          uint64_t v113 = v12;
          uint64_t v126 = v12 + 32;
          uint64_t v127 = *(void *)&v12[16 * v125 + 32];
          uint64_t v128 = *(void *)&v12[16 * v14 + 24];
          sub_10002B45C( (char *)(v124 + 40 * v127),  (char *)(v124 + 40LL * *(void *)&v126[16 * v14 - 16]),  v124 + 40 * v128,  v142,  v149);
          if (v123) {
            goto LABEL_99;
          }
          if (v128 < v127) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v113) & 1) == 0) {
            uint64_t v113 = sub_10002BBB8((uint64_t)v113);
          }
          if (v125 >= *((void *)v113 + 2)) {
            goto LABEL_133;
          }
          uint64_t v129 = &v113[16 * v125 + 32];
          *(void *)uint64_t v129 = v127;
          *((void *)v129 + 1) = v128;
          unint64_t v130 = *((void *)v113 + 2);
          if (v14 > v130) {
            goto LABEL_134;
          }
          uint64_t v12 = v113;
          memmove(&v113[16 * v14 + 16], &v113[16 * v14 + 32], 16 * (v130 - v14));
          *((void *)v113 + 2) = v130 - 1;
          unint64_t v14 = v130 - 1;
        }

        while (v130 > 2);
      }

      char v122 = v12;
LABEL_114:
      swift_bridgeObjectRelease(v122);
      uint64_t v131 = v134;
      v134[2] = 0LL;
      return swift_bridgeObjectRelease(v131);
    }

    Swift::Int v135 = result;
  }

  else
  {
    Swift::Int v135 = result;
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = sub_100005EA4(&qword_100041E20);
    uint64_t v11 = static Array._allocateBufferUninitialized(minimumCapacity:)(v9, v10);
    *(void *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = v9;
    uint64_t v134 = (void *)v11;
    uint64_t v142 = (char *)(v11 + 32);
  }

  Swift::Int v13 = 0LL;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    Swift::Int v15 = v13++;
    Swift::Int v139 = v15;
    if (v13 < v6)
    {
      uint64_t v136 = *a1;
      uint64_t v16 = v136;
      sub_10002D688(v136 + 40 * v13, (uint64_t)&v154);
      sub_10002D688(v16 + 40 * v15, (uint64_t)v151);
      uint64_t v18 = v155;
      uint64_t v17 = v156;
      sub_100013314(&v154, v155);
      Swift::Int v145 = v6;
      uint64_t v19 = v146;
      uint64_t v20 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v17);
      uint64_t v21 = v149;
      LODWORD(v140) = v149(v20);
      uint64_t v22 = *(void (**)(char *, uint64_t))(v144 + 8);
      uint64_t v23 = v19;
      uint64_t v24 = v148;
      v22(v23, v148);
      uint64_t v25 = v152;
      uint64_t v157 = v153;
      sub_100013314(v151, v152);
      uint64_t v26 = v147;
      uint64_t v27 = dispatch thunk of WorkerProtocol.workerConfig.getter(v25, v157);
      LODWORD(v138) = v21(v27);
      Swift::Int v6 = v145;
      v137 = v22;
      v22(v26, v24);
      sub_100013384(v151);
      sub_100013384(&v154);
      Swift::Int v13 = v15 + 2;
      if (v15 + 2 < v6)
      {
        os_log_type_t v133 = v12;
        uint64_t v28 = v136 + 40 * v15 + 40;
        while (1)
        {
          Swift::Int v29 = v13;
          LODWORD(v157) = v140 < v138;
          sub_10002D688(v28 + 40, (uint64_t)&v154);
          sub_10002D688(v28, (uint64_t)v151);
          uint64_t v30 = v155;
          uint64_t v31 = v156;
          sub_100013314(&v154, v155);
          Swift::Int v32 = v146;
          uint64_t v33 = dispatch thunk of WorkerProtocol.workerConfig.getter(v30, v31);
          uint64_t v34 = v149;
          LOBYTE(v150) = v149(v33);
          LODWORD(v150) = v150;
          unint64_t v35 = v32;
          uint64_t v36 = v148;
          uint64_t v37 = v137;
          v137(v35, v148);
          uint64_t v38 = v152;
          uint64_t v39 = v153;
          sub_100013314(v151, v152);
          int64_t v40 = v147;
          uint64_t v41 = dispatch thunk of WorkerProtocol.workerConfig.getter(v38, v39);
          LOBYTE(v38) = v34(v41);
          v37(v40, v36);
          LODWORD(v38) = v150 >= v38;
          sub_100013384(v151);
          sub_100013384(&v154);
          if ((_DWORD)v157 == (_DWORD)v38) {
            break;
          }
          Swift::Int v13 = v29 + 1;
          v28 += 40LL;
          Swift::Int v6 = v145;
          if (v145 == v29 + 1)
          {
            Swift::Int v13 = v145;
            uint64_t v12 = v133;
            a1 = v141;
            Swift::Int v15 = v139;
            goto LABEL_24;
          }
        }

        a1 = v141;
        Swift::Int v13 = v29;
        uint64_t v12 = v133;
        Swift::Int v15 = v139;
        Swift::Int v6 = v145;
      }

LABEL_52:
    if (v13 < v15) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
      uint64_t v12 = sub_10002B960(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
    }
    unint64_t v71 = *((void *)v12 + 2);
    unint64_t v70 = *((void *)v12 + 3);
    unint64_t v14 = v71 + 1;
    if (v71 >= v70 >> 1) {
      uint64_t v12 = sub_10002B960((char *)(v70 > 1), v71 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v14;
    char v72 = v12 + 32;
    unint64_t v73 = &v12[16 * v71 + 32];
    *(void *)unint64_t v73 = v15;
    *((void *)v73 + 1) = v13;
    if (v71)
    {
      while (1)
      {
        unint64_t v74 = v14 - 1;
        if (v14 >= 4)
        {
          uint64_t v79 = &v72[16 * v14];
          uint64_t v80 = *((void *)v79 - 8);
          uint64_t v81 = *((void *)v79 - 7);
          BOOL v85 = __OFSUB__(v81, v80);
          uint64_t v82 = v81 - v80;
          if (v85) {
            goto LABEL_119;
          }
          uint64_t v84 = *((void *)v79 - 6);
          uint64_t v83 = *((void *)v79 - 5);
          BOOL v85 = __OFSUB__(v83, v84);
          uint64_t v77 = v83 - v84;
          char v78 = v85;
          if (v85) {
            goto LABEL_120;
          }
          unint64_t v86 = v14 - 2;
          uint64_t v87 = &v72[16 * v14 - 32];
          uint64_t v89 = *(void *)v87;
          uint64_t v88 = *((void *)v87 + 1);
          BOOL v85 = __OFSUB__(v88, v89);
          uint64_t v90 = v88 - v89;
          if (v85) {
            goto LABEL_122;
          }
          BOOL v85 = __OFADD__(v77, v90);
          uint64_t v91 = v77 + v90;
          if (v85) {
            goto LABEL_125;
          }
          if (v91 >= v82)
          {
            uint64_t v109 = &v72[16 * v74];
            uint64_t v111 = *(void *)v109;
            uint64_t v110 = *((void *)v109 + 1);
            BOOL v85 = __OFSUB__(v110, v111);
            uint64_t v112 = v110 - v111;
            if (v85) {
              goto LABEL_129;
            }
            BOOL v102 = v77 < v112;
            goto LABEL_89;
          }
        }

        else
        {
          if (v14 != 3)
          {
            uint64_t v103 = *((void *)v12 + 4);
            uint64_t v104 = *((void *)v12 + 5);
            BOOL v85 = __OFSUB__(v104, v103);
            uint64_t v96 = v104 - v103;
            char v97 = v85;
            goto LABEL_83;
          }

          uint64_t v76 = *((void *)v12 + 4);
          uint64_t v75 = *((void *)v12 + 5);
          BOOL v85 = __OFSUB__(v75, v76);
          uint64_t v77 = v75 - v76;
          char v78 = v85;
        }

        if ((v78 & 1) != 0) {
          goto LABEL_121;
        }
        unint64_t v86 = v14 - 2;
        __n128 v92 = &v72[16 * v14 - 32];
        uint64_t v94 = *(void *)v92;
        uint64_t v93 = *((void *)v92 + 1);
        BOOL v95 = __OFSUB__(v93, v94);
        uint64_t v96 = v93 - v94;
        char v97 = v95;
        if (v95) {
          goto LABEL_124;
        }
        uint64_t v98 = &v72[16 * v74];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v85 = __OFSUB__(v99, v100);
        uint64_t v101 = v99 - v100;
        if (v85) {
          goto LABEL_127;
        }
        if (__OFADD__(v96, v101)) {
          goto LABEL_128;
        }
        if (v96 + v101 >= v77)
        {
          BOOL v102 = v77 < v101;
LABEL_89:
          if (v102) {
            unint64_t v74 = v86;
          }
          goto LABEL_91;
        }

LABEL_83:
        if ((v97 & 1) != 0) {
          goto LABEL_123;
        }
        uint64_t v105 = &v72[16 * v74];
        uint64_t v107 = *(void *)v105;
        uint64_t v106 = *((void *)v105 + 1);
        BOOL v85 = __OFSUB__(v106, v107);
        uint64_t v108 = v106 - v107;
        if (v85) {
          goto LABEL_126;
        }
        if (v108 < v96) {
          goto LABEL_15;
        }
LABEL_91:
        uint64_t v113 = v12;
        unint64_t v114 = v74 - 1;
        if (v74 - 1 >= v14)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }

        uint64_t v115 = *a1;
        if (!*a1) {
          goto LABEL_141;
        }
        uint64_t v116 = &v72[16 * v114];
        uint64_t v117 = *(void *)v116;
        uint64_t v118 = &v72[16 * v74];
        uint64_t v119 = *((void *)v118 + 1);
        uint64_t v120 = v143;
        sub_10002B45C( (char *)(v115 + 40LL * *(void *)v116),  (char *)(v115 + 40LL * *(void *)v118),  v115 + 40 * v119,  v142,  v149);
        uint64_t v143 = v120;
        if (v120)
        {
LABEL_99:
          char v122 = v113;
          goto LABEL_114;
        }

        if (v119 < v117) {
          goto LABEL_116;
        }
        if (v74 > *((void *)v113 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v116 = v117;
        *(void *)&v72[16 * v114 + 8] = v119;
        unint64_t v121 = *((void *)v113 + 2);
        if (v74 >= v121) {
          goto LABEL_118;
        }
        uint64_t v12 = v113;
        unint64_t v14 = v121 - 1;
        memmove(&v72[16 * v74], v118 + 16, 16 * (v121 - 1 - v74));
        *((void *)v113 + 2) = v121 - 1;
        a1 = v141;
        if (v121 <= 2) {
          goto LABEL_15;
        }
      }
    }

    unint64_t v14 = 1LL;
LABEL_15:
    Swift::Int v6 = a1[1];
    if (v13 >= v6) {
      goto LABEL_102;
    }
  }

  if (__OFADD__(v15, v135)) {
    goto LABEL_138;
  }
  if (v15 + v135 >= v6) {
    Swift::Int v51 = v6;
  }
  else {
    Swift::Int v51 = v15 + v135;
  }
  if (v51 >= v15)
  {
    if (v13 != v51)
    {
      os_log_type_t v133 = v12;
      uint64_t v52 = 40 * v13 - 40;
      Swift::Int v138 = v51;
      do
      {
        uint64_t v140 = v52;
        Swift::Int v145 = v13;
        while (1)
        {
          Swift::Int v150 = v15;
          uint64_t v54 = *a1 + v52;
          sub_10002D688(v54 + 40, (uint64_t)&v154);
          sub_10002D688(v54, (uint64_t)v151);
          uint64_t v55 = v155;
          uint64_t v56 = v156;
          sub_100013314(&v154, v155);
          uint64_t v57 = v146;
          uint64_t v58 = dispatch thunk of WorkerProtocol.workerConfig.getter(v55, v56);
          uint64_t v59 = v149;
          LOBYTE(v157) = v149(v58);
          LODWORD(v157) = v157;
          unint64_t v60 = *(void (**)(char *, uint64_t))(v144 + 8);
          unint64_t v61 = v57;
          uint64_t v62 = v148;
          v60(v61, v148);
          uint64_t v63 = v152;
          uint64_t v64 = v153;
          sub_100013314(v151, v152);
          uint64_t v65 = v147;
          uint64_t v66 = dispatch thunk of WorkerProtocol.workerConfig.getter(v63, v64);
          LOBYTE(v63) = v59(v66);
          v60(v65, v62);
          sub_100013384(v151);
          sub_100013384(&v154);
          uint64_t v67 = *a1;
          if (!*a1) {
            goto LABEL_140;
          }
          uint64_t v68 = v67 + v52;
          sub_10002D514((__int128 *)(v67 + v52 + 40), (uint64_t)&v154);
          __int128 v69 = *(_OWORD *)(v68 + 16);
          *(_OWORD *)(v68 + 40) = *(_OWORD *)v68;
          *(_OWORD *)(v68 + swift_weakDestroy(v0 + 56) = v69;
          *(void *)(v68 + 72) = *(void *)(v68 + 32);
          sub_10002D514(&v154, v68);
          v52 -= 40LL;
          Swift::Int v15 = v150 + 1;
          Swift::Int v53 = v145;
          if (v145 == v150 + 1) {
            goto LABEL_45;
          }
        }

        Swift::Int v53 = v145;
LABEL_45:
        Swift::Int v13 = v53 + 1;
        uint64_t v52 = v140 + 40;
        Swift::Int v15 = v139;
      }

      while (v13 != v138);
      Swift::Int v13 = v138;
      uint64_t v12 = v133;
    }

    goto LABEL_52;
  }

LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10002B230(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  int64_t v40 = a5;
  uint64_t v33 = a1;
  uint64_t v8 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v37 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v36 = (char *)&v31 - v12;
  uint64_t v41 = a3;
  uint64_t v32 = a2;
  if (a3 != a2)
  {
    Swift::Int v13 = v40;
    uint64_t v14 = 40 * v41 - 40;
    unint64_t v35 = a4;
LABEL_5:
    uint64_t v15 = v33;
    uint64_t v34 = v14;
    while (1)
    {
      uint64_t v16 = *a4 + v14;
      sub_10002D688(v16 + 40, (uint64_t)&v45);
      sub_10002D688(v16, (uint64_t)v42);
      uint64_t v18 = v46;
      uint64_t v17 = v47;
      sub_100013314(&v45, v46);
      uint64_t v19 = v36;
      uint64_t v20 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v17);
      LOBYTE(v48) = v13(v20);
      unsigned int v48 = v48;
      uint64_t v21 = *(void (**)(char *, uint64_t))(v38 + 8);
      uint64_t v22 = v19;
      uint64_t v23 = v39;
      v21(v22, v39);
      uint64_t v24 = v43;
      uint64_t v25 = v44;
      sub_100013314(v42, v43);
      uint64_t v26 = v37;
      uint64_t v27 = dispatch thunk of WorkerProtocol.workerConfig.getter(v24, v25);
      LOBYTE(vswift_unknownObjectWeakDestroy(v0 + 16) = v13(v27);
      v21(v26, v23);
      sub_100013384(v42);
      uint64_t result = sub_100013384(&v45);
      a4 = v35;
      if (v48 >= v16)
      {
LABEL_4:
        uint64_t v14 = v34 + 40;
        if (++v41 == v32) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v28 = *v35;
      if (!*v35) {
        break;
      }
      uint64_t v29 = v28 + v14;
      sub_10002D514((__int128 *)(v28 + v14 + 40), (uint64_t)&v45);
      __int128 v30 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)(v29 + 40) = *(_OWORD *)v29;
      *(_OWORD *)(v29 + swift_weakDestroy(v0 + 56) = v30;
      *(void *)(v29 + 72) = *(void *)(v29 + 32);
      uint64_t result = sub_10002D514(&v45, v29);
      v14 -= 40LL;
      if (v41 == ++v15) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_10002B45C(char *a1, char *a2, unint64_t a3, char *a4, uint64_t (*a5)(uint64_t))
{
  char v72 = a5;
  uint64_t v9 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v70 = *(void *)(v9 - 8);
  uint64_t v71 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  __int128 v69 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  unint64_t v67 = a3;
  uint64_t v68 = (char *)&v62 - v12;
  uint64_t v13 = a2 - a1;
  uint64_t v14 = (a2 - a1) / 40;
  uint64_t v15 = a3 - (void)a2;
  uint64_t v16 = v15 / 40;
  uint64_t v81 = a1;
  uint64_t v80 = a4;
  if (v14 >= v15 / 40)
  {
    if (v15 < -39) {
      goto LABEL_43;
    }
    if (a4 != a2 || &a2[40 * v16] <= a4) {
      memmove(a4, a2, 40 * v16);
    }
    uint64_t v37 = &a4[40 * v16];
    unint64_t v79 = (unint64_t)v37;
    uint64_t v81 = a2;
    if (v15 < 40 || a1 >= a2) {
      goto LABEL_42;
    }
    unint64_t v38 = v67 - 40;
    uint64_t v64 = a4;
    uint64_t v63 = a1;
    uint64_t v39 = v72;
    while (1)
    {
      unint64_t v66 = (unint64_t)a2;
      unint64_t v67 = v38 + 40;
      sub_10002D688((uint64_t)(v37 - 40), (uint64_t)v76);
      int64_t v40 = a2 - 40;
      sub_10002D688((uint64_t)(a2 - 40), (uint64_t)v73);
      uint64_t v41 = v77;
      uint64_t v42 = v78;
      sub_100013314(v76, v77);
      uint64_t v43 = v68;
      uint64_t v44 = dispatch thunk of WorkerProtocol.workerConfig.getter(v41, v42);
      LOBYTE(v65) = v39(v44);
      unsigned int v65 = v65;
      __int128 v45 = *(void (**)(char *, uint64_t))(v70 + 8);
      uint64_t v46 = v43;
      uint64_t v47 = v71;
      v45(v46, v71);
      uint64_t v48 = v74;
      uint64_t v49 = v75;
      sub_100013314(v73, v74);
      __int128 v50 = v69;
      uint64_t v51 = dispatch thunk of WorkerProtocol.workerConfig.getter(v48, v49);
      LOBYTE(v48) = v39(v51);
      v45(v50, v47);
      sub_100013384(v73);
      sub_100013384(v76);
      if (v65 >= v48)
      {
        int64_t v40 = (char *)v66;
        unint64_t v54 = v79;
        uint64_t v37 = (char *)(v79 - 40);
        v79 -= 40LL;
        if (v67 >= v54 && v38 < v54)
        {
          uint64_t v55 = v64;
          uint64_t v56 = v63;
          if (v67 != v54)
          {
            __int128 v57 = *(_OWORD *)v37;
            __int128 v58 = *((_OWORD *)v37 + 1);
            *(void *)(v38 + 32) = *((void *)v37 + 4);
            *(_OWORD *)unint64_t v38 = v57;
            *(_OWORD *)(v38 + swift_unknownObjectWeakDestroy(v0 + 16) = v58;
          }

          goto LABEL_40;
        }

        __int128 v59 = *(_OWORD *)v37;
        __int128 v60 = *(_OWORD *)(v54 - 24);
        *(void *)(v38 + 32) = *(void *)(v54 - 8);
        *(_OWORD *)unint64_t v38 = v59;
        *(_OWORD *)(v38 + swift_unknownObjectWeakDestroy(v0 + 16) = v60;
      }

      else
      {
        if (v67 != v66 || v38 >= v66)
        {
          __int128 v52 = *(_OWORD *)v40;
          __int128 v53 = *((_OWORD *)v40 + 1);
          *(void *)(v38 + 32) = *((void *)v40 + 4);
          *(_OWORD *)unint64_t v38 = v52;
          *(_OWORD *)(v38 + swift_unknownObjectWeakDestroy(v0 + 16) = v53;
        }

        v81 -= 40;
        uint64_t v37 = (char *)v79;
      }

      uint64_t v55 = v64;
      uint64_t v56 = v63;
LABEL_40:
      if (v37 > v55)
      {
        v38 -= 40LL;
        a2 = v40;
        if (v40 > v56) {
          continue;
        }
      }

      goto LABEL_42;
    }
  }

  if (v13 >= -39)
  {
    if (a4 != a1 || &a1[40 * v14] <= a4) {
      memmove(a4, a1, 40 * v14);
    }
    unint64_t v66 = (unint64_t)&a4[40 * v14];
    unint64_t v79 = v66;
    if (v13 >= 40 && (unint64_t)a2 < v67)
    {
      uint64_t v17 = v71;
      do
      {
        sub_10002D688((uint64_t)a2, (uint64_t)v76);
        sub_10002D688((uint64_t)a4, (uint64_t)v73);
        uint64_t v18 = v77;
        uint64_t v19 = v78;
        sub_100013314(v76, v77);
        uint64_t v20 = v68;
        uint64_t v21 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v19);
        uint64_t v22 = v72;
        unsigned int v23 = v72(v21);
        uint64_t v24 = a2;
        uint64_t v25 = *(void (**)(char *, uint64_t))(v70 + 8);
        v25(v20, v17);
        uint64_t v26 = v74;
        uint64_t v27 = v75;
        sub_100013314(v73, v74);
        uint64_t v28 = v69;
        uint64_t v29 = dispatch thunk of WorkerProtocol.workerConfig.getter(v26, v27);
        LOBYTE(v26) = v22(v29);
        v25(v28, v17);
        sub_100013384(v73);
        sub_100013384(v76);
        __int128 v30 = v81;
        if (v23 >= v26)
        {
          uint64_t v34 = v80 + 40;
          if (v81 != v80 || v81 >= v34)
          {
            __int128 v35 = *(_OWORD *)v80;
            __int128 v36 = *((_OWORD *)v80 + 1);
            *((void *)v81 + 4) = *((void *)v80 + 4);
            *__int128 v30 = v35;
            v30[1] = v36;
          }

          uint64_t v80 = v34;
          unint64_t v31 = (unint64_t)v24;
        }

        else
        {
          unint64_t v31 = (unint64_t)(v24 + 40);
          if (v81 >= v24 && (unint64_t)v81 < v31 && v81 == v24)
          {
            __int128 v30 = v24;
          }

          else
          {
            __int128 v32 = *(_OWORD *)v24;
            __int128 v33 = *((_OWORD *)v24 + 1);
            *((void *)v81 + 4) = *((void *)v24 + 4);
            *__int128 v30 = v32;
            v30[1] = v33;
          }
        }

        uint64_t v81 = (char *)v30 + 40;
        a4 = v80;
        a2 = (char *)v31;
      }

      while (v31 < v67);
    }

LABEL_42:
    sub_10002BB00((void **)&v81, (const void **)&v80, &v79);
    return 1LL;
  }

char *sub_10002B960(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100005EA4(&qword_100042060);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10002BA58(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7]) {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }

  return result;
}

char *sub_10002BB00(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    char v7 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v7,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6]) {
      return (char *)memmove(result, v3, 40 * v6);
    }
  }

  return result;
}

char *sub_10002BBB8(uint64_t a1)
{
  return sub_10002B960(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002BBCC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (char *)a1 + *(int *)(sub_100005EA4(&qword_100042028) + 48);
  uint64_t v5 = (char *)a2 + *(int *)(sub_100005EA4(&qword_100041688) + 48);
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v5, v4, v8);
  *a2 = v7;
  a2[1] = v6;
  return swift_bridgeObjectRetain(v6);
}

uint64_t sub_10002BC50(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  __int128 v57 = a5;
  uint64_t v9 = type metadata accessor for SimpleType(0LL);
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v44 - v12;
  uint64_t v14 = sub_100005EA4(&qword_100042030);
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = -1LL << *(_BYTE *)(a1 + 32);
  uint64_t v18 = ~v17;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v20 = -v17;
  uint64_t v50 = a1;
  uint64_t v51 = a1 + 64;
  if (v20 < 64) {
    uint64_t v21 = ~(-1LL << v20);
  }
  else {
    uint64_t v21 = -1LL;
  }
  uint64_t v52 = v18;
  uint64_t v53 = 0LL;
  uint64_t v54 = v21 & v19;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  uint64_t v46 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v45 = a3;
  swift_retain(a3);
  sub_10002C3A4((uint64_t)v16);
  uint64_t v22 = sub_100005EA4(&qword_100041688);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48LL))(v16, 1LL, v22) == 1)
  {
LABEL_5:
    swift_release(v45);
    swift_bridgeObjectRelease(v46);
    sub_10000E404(v50);
    return swift_release(v56);
  }

  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  while (1)
  {
    uint64_t v26 = (char *)v16 + *(int *)(v22 + 48);
    uint64_t v27 = *v16;
    uint64_t v28 = v16[1];
    uint64_t v29 = v13;
    v49(v13, v26, v9);
    uint64_t v30 = *v57;
    unint64_t v32 = sub_10001F324(v27, v28);
    uint64_t v33 = *(void *)(v30 + 16);
    BOOL v34 = (v31 & 1) == 0;
    uint64_t v35 = v33 + v34;
    if (__OFADD__(v33, v34)) {
      break;
    }
    char v36 = v31;
    if (*(void *)(v30 + 24) >= v35)
    {
      if ((a4 & 1) != 0)
      {
        if ((v31 & 1) != 0) {
          goto LABEL_7;
        }
      }

      else
      {
        sub_100021704();
        if ((v36 & 1) != 0) {
          goto LABEL_7;
        }
      }
    }

    else
    {
      sub_10001F8B8(v35, a4 & 1);
      unint64_t v37 = sub_10001F324(v27, v28);
      if ((v36 & 1) != (v38 & 1)) {
        goto LABEL_22;
      }
      unint64_t v32 = v37;
      if ((v36 & 1) != 0)
      {
LABEL_7:
        uint64_t v25 = v47;
        uint64_t v24 = v48;
        uint64_t v13 = v29;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v47, v29, v9);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v29, v9);
        swift_bridgeObjectRelease(v28);
        (*(void (**)(unint64_t, char *, uint64_t))(v24 + 40))( *(void *)(*v57 + 56) + *(void *)(v24 + 72) * v32,  v25,  v9);
        goto LABEL_8;
      }
    }

    uint64_t v39 = (void *)*v57;
    *(void *)(*v57 + 8 * (v32 >> 6) + 64) |= 1LL << v32;
    int64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
    *int64_t v40 = v27;
    v40[1] = v28;
    uint64_t v13 = v29;
    v49((char *)(v39[7] + *(void *)(v48 + 72) * v32), v29, v9);
    uint64_t v41 = v39[2];
    BOOL v42 = __OFADD__(v41, 1LL);
    uint64_t v43 = v41 + 1;
    if (v42) {
      goto LABEL_21;
    }
    _OWORD v39[2] = v43;
LABEL_8:
    sub_10002C3A4((uint64_t)v16);
    uint64_t v22 = sub_100005EA4(&qword_100041688);
    a4 = 1;
  }

  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

Swift::Int sub_10002BFCC(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for SimpleType(0LL);
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v48 = (char *)&v43 - v12;
  if (!a3) {
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (Swift::Int)a4;
  }

  uint64_t v47 = v11;
  sub_100005EA4(&qword_100041690);
  Swift::Int result = static _DictionaryStorage.allocate(capacity:)(a3);
  Swift::Int v14 = result;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0LL;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0LL;
  Swift::Int v17 = result + 64;
  uint64_t v18 = v47;
  uint64_t v19 = v48;
  uint64_t v46 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v50 = v16;
      unint64_t v21 = v20 | (v16 << 6);
    }

    else
    {
      uint64_t v22 = v16 + 1;
      if (__OFADD__(v16, 1LL)) {
        goto LABEL_40;
      }
      if (v22 >= v45) {
        return v14;
      }
      unint64_t v23 = v44[v22];
      uint64_t v24 = v16 + 1;
      if (!v23)
      {
        uint64_t v24 = v16 + 2;
        if (v16 + 2 >= v45) {
          return v14;
        }
        unint64_t v23 = v44[v24];
        if (!v23)
        {
          uint64_t v24 = v16 + 3;
          if (v16 + 3 >= v45) {
            return v14;
          }
          unint64_t v23 = v44[v24];
          if (!v23)
          {
            uint64_t v25 = v16 + 4;
            if (v16 + 4 >= v45) {
              return v14;
            }
            unint64_t v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                uint64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1LL)) {
                  goto LABEL_41;
                }
                if (v24 >= v45) {
                  return v14;
                }
                unint64_t v23 = v44[v24];
                ++v25;
                if (v23) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v24 = v16 + 4;
          }
        }
      }

void *sub_10002C314(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (a2 <= a1) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = a2;
  }
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = sub_100005EA4(a3);
  uint64_t v6 = (void *)swift_allocObject(v5, 40 * v3 + 32, 7LL);
  size_t v7 = j__malloc_size(v6);
  v6[2] = a1;
  v6[3] = 2 * ((uint64_t)(v7 - 32) / 40);
  return v6;
}

uint64_t sub_10002C390(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16),  0LL,  a1);
}

uint64_t sub_10002C3A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005EA4(&qword_100042028);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100005EA4(&qword_100042038);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = *v1;
  uint64_t v14 = v1[1];
  uint64_t v16 = v1[2];
  int64_t v15 = v1[3];
  int64_t v17 = v15;
  unint64_t v18 = v1[4];
  uint64_t v41 = v6;
  if (v18)
  {
    uint64_t v45 = a1;
    int64_t v46 = v15;
    uint64_t v42 = v16;
    uint64_t v43 = v14;
    uint64_t v44 = v10;
    uint64_t v19 = v4;
    uint64_t v20 = (v18 - 1) & v18;
    unint64_t v21 = __clz(__rbit64(v18)) | (v15 << 6);
LABEL_3:
    uint64_t v22 = *(void *)(v13 + 56);
    unint64_t v23 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v21);
    uint64_t v24 = v13;
    uint64_t v26 = *v23;
    uint64_t v25 = v23[1];
    uint64_t v27 = type metadata accessor for SimpleType(0LL);
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v27 - 8) + 16LL))( &v12[*(int *)(v3 + 48)],  v22 + *(void *)(*(void *)(v27 - 8) + 72LL) * v21,  v27);
    *(void *)uint64_t v12 = v26;
    *((void *)v12 + 1) = v25;
    uint64_t v4 = v19;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v12, 0LL, 1LL, v3);
    uint64_t v28 = v25;
    uint64_t v13 = v24;
    swift_bridgeObjectRetain(v28);
    uint64_t v10 = v44;
    a1 = v45;
    uint64_t v16 = v42;
    uint64_t v14 = v43;
    goto LABEL_25;
  }

  int64_t v29 = v15 + 1;
  if (__OFADD__(v15, 1LL))
  {
    __break(1u);
LABEL_23:
    int64_t v17 = v11;
    goto LABEL_24;
  }

  int64_t v30 = (unint64_t)(v16 + 64) >> 6;
  if (v29 < v30)
  {
    unint64_t v31 = *(void *)(v14 + 8 * v29);
    if (v31)
    {
LABEL_7:
      uint64_t v42 = v16;
      uint64_t v43 = v14;
      uint64_t v44 = v10;
      uint64_t v45 = a1;
      uint64_t v19 = v4;
      uint64_t v20 = (v31 - 1) & v31;
      unint64_t v21 = __clz(__rbit64(v31)) + (v29 << 6);
      int64_t v46 = v29;
      goto LABEL_3;
    }

    int64_t v32 = v15 + 2;
    int64_t v17 = v15 + 1;
    if (v15 + 2 < v30)
    {
      unint64_t v31 = *(void *)(v14 + 8 * v32);
      if (v31)
      {
LABEL_10:
        int64_t v29 = v32;
        goto LABEL_7;
      }

      int64_t v17 = v15 + 2;
      if (v15 + 3 < v30)
      {
        unint64_t v31 = *(void *)(v14 + 8 * (v15 + 3));
        if (v31)
        {
          int64_t v29 = v15 + 3;
          goto LABEL_7;
        }

        int64_t v32 = v15 + 4;
        int64_t v17 = v15 + 3;
        if (v15 + 4 < v30)
        {
          unint64_t v31 = *(void *)(v14 + 8 * v32);
          if (v31) {
            goto LABEL_10;
          }
          int64_t v29 = v15 + 5;
          int64_t v17 = v15 + 4;
          if (v15 + 5 < v30)
          {
            unint64_t v31 = *(void *)(v14 + 8 * v29);
            if (v31) {
              goto LABEL_7;
            }
            int64_t v11 = v30 - 1;
            uint64_t v33 = v15 + 6;
            while (v30 != v33)
            {
              unint64_t v31 = *(void *)(v14 + 8 * v33++);
              if (v31)
              {
                int64_t v29 = v33 - 1;
                goto LABEL_7;
              }
            }

            goto LABEL_23;
          }
        }
      }
    }
  }

void *sub_10002C6EC(void *a1)
{
  return sub_100028868(0LL, a1[2], 0, a1, &qword_100042008, &qword_100041E20);
}

uint64_t sub_10002C720(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

char *sub_10002C810(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002C8F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v6 = a4 + 16 * a1 + 32;
    unint64_t v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_100005EA4(&qword_100041E10);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002CA00(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a2;
  uint64_t v43 = a4;
  int64_t v34 = a1;
  uint64_t v42 = sub_100005EA4(&qword_100042028);
  __chkstk_darwin(v42);
  uint64_t v38 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = type metadata accessor for SimpleType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  uint64_t result = __chkstk_darwin(v6);
  uint64_t v39 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v10 = 0LL;
  uint64_t v44 = (void *)a3;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v35 = 0LL;
  uint64_t v36 = a3 + 64;
  uint64_t v12 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v37 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v40;
  uint64_t v15 = v41;
  unint64_t v18 = v38;
  int64_t v17 = v39;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      int64_t v45 = v10;
      unint64_t v20 = v19 | (v10 << 6);
      goto LABEL_5;
    }

    int64_t v27 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v27 >= v37) {
      return sub_10002BFCC(v34, v33, v35, v44);
    }
    unint64_t v28 = *(void *)(v36 + 8 * v27);
    int64_t v29 = v10 + 1;
    if (!v28)
    {
      int64_t v29 = v10 + 2;
      if (v10 + 2 >= v37) {
        return sub_10002BFCC(v34, v33, v35, v44);
      }
      unint64_t v28 = *(void *)(v36 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v10 + 3;
        if (v10 + 3 >= v37) {
          return sub_10002BFCC(v34, v33, v35, v44);
        }
        unint64_t v28 = *(void *)(v36 + 8 * v29);
        if (!v28) {
          break;
        }
      }
    }

uint64_t sub_10002CCEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v6 = *(_BYTE *)(a1 + 32);
  unsigned int v7 = v6 & 0x3F;
  unint64_t v8 = (unint64_t)((1LL << v6) + 63) >> 6;
  size_t v9 = 8 * v8;
  uint64_t isStackAllocationSafe = swift_retain_n(a2, 2LL);
  if (v7 <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v9, 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0LL), v9);
    swift_retain(a2);
    uint64_t v11 = sub_10002CA00((unint64_t *)((char *)&v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v8, a1, a2);
    uint64_t v12 = swift_release(a2);
    if (v3) {
      swift_willThrow(v12);
    }
    swift_release_n(a2, 2LL);
  }

  else
  {
    uint64_t v13 = (void *)swift_slowAlloc(v9, -1LL);
    bzero(v13, v9);
    swift_retain(a2);
    uint64_t v11 = sub_10002CA00((unint64_t *)v13, v8, a1, a2);
    swift_release(a2);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_release_n(a2, 2LL);
  }

  return v11;
}

uint64_t sub_10002CEA0(void *a1)
{
  uint64_t v2 = (void **)a1[2];
  int v3 = *((_DWORD *)a1 + 12);
  uint64_t v4 = a1[4];
  unint64_t v5 = a1[5];
  uint64_t v6 = a1[7];
  int v7 = *((unsigned __int8 *)a1 + 24);
  uint64_t v8 = swift_allocObject(*a1, *(unsigned int *)(*a1 + 48LL), *(unsigned __int16 *)(*a1 + 52LL));
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  sub_1000241D0(v2, v3, v4, v5, v6, v7);
  swift_beginAccess(a1 + 9, v25, 0LL, 0LL);
  uint64_t v9 = a1[9];
  int64_t v10 = *(dispatch_queue_s **)(v8 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v11 = swift_allocObject(&unk_10003E348, 32LL, 7LL);
  *(void *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = swift_allocObject(&unk_10003E370, 32LL, 7LL);
  *(void *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_10000B6E0;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_10000B83C;
  uint64_t v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100016C50;
  aBlock[3] = &unk_10003E388;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = v24;
  swift_retain_n(v8, 2LL);
  swift_bridgeObjectRetain_n(v9, 2LL);
  swift_retain(v12);
  swift_release(v14);
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v12, "", 111LL, 100LL, 24LL, 1LL);
  swift_bridgeObjectRelease(v9);
  swift_release(v11);
  uint64_t result = swift_release(v12);
  if ((v10 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v16 = a1[10];
    if (v16)
    {
      swift_retain(v8);
      swift_bridgeObjectRetain(v16);
      uint64_t v18 = sub_10002CCEC(v17, v8);
      swift_release(v8);
      if (*(void *)(v18 + 16))
      {
        uint64_t v19 = *(void *)(v8 + 80);
        if (v19)
        {
          swift_bridgeObjectRetain(*(void *)(v8 + 80));
          uint64_t v20 = sub_100025A48(v18, v19);
          uint64_t v21 = *(void *)(v8 + 80);
          *(void *)(v8 + 80) = v20;
          swift_release(v8);
          swift_release(a1);
          uint64_t v22 = v21;
        }

        else
        {
          *(void *)(v8 + 80) = v18;
          swift_release(v8);
          swift_release(a1);
          uint64_t v22 = 0LL;
        }

        swift_bridgeObjectRelease(v22);
      }

      else
      {
        swift_release(v8);
        swift_release(a1);
        swift_release(v18);
      }

      swift_bridgeObjectRelease(v16);
    }

    else
    {
      swift_release(v8);
      swift_release(a1);
    }

    return v8;
  }

  return result;
}

void *sub_10002D128(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Config.WorkerConfigs(0LL);
  uint64_t v35 = *(void **)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  int64_t v10 = (char *)v30 - v9;
  uint64_t result = _swiftEmptyArrayStorage;
  uint64_t v41 = _swiftEmptyArrayStorage;
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32)
  {
    uint64_t v12 = 0LL;
    v30[1] = v2;
    uint64_t v31 = a1 + 32;
    uint64_t v36 = a2;
    uint64_t v34 = a2 + 56;
    do
    {
      uint64_t v33 = v12;
      sub_10002D688(v31 + 40 * v12, (uint64_t)&v38);
      uint64_t v14 = v39;
      uint64_t v13 = v40;
      sub_100013314(&v38, v39);
      dispatch thunk of WorkerProtocol.workerConfig.getter(v14, v13);
      if (*(void *)(v36 + 16)
        && (uint64_t v15 = *(void *)(v36 + 40),
            uint64_t v16 = sub_1000061B8( &qword_100041AA8,  (uint64_t (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs,  (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs),  v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v5, v16),  v18 = v36,  v19 = -1LL << *(_BYTE *)(v36 + 32),  v20 = v17 & ~v19,  ((*(void *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v20) & 1) != 0))
      {
        uint64_t v21 = ~v19;
        uint64_t v22 = v35[9];
        uint64_t v23 = (void (*)(char *, unint64_t, uint64_t))v35[2];
        while (1)
        {
          v23(v8, *(void *)(v18 + 48) + v22 * v20, v5);
          uint64_t v24 = sub_1000061B8( (unint64_t *)&unk_100041AB0,  (uint64_t (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs,  (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
          char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v10, v5, v24);
          uint64_t v26 = (void (*)(char *, uint64_t))v35[1];
          v26(v8, v5);
          if ((v25 & 1) != 0) {
            break;
          }
          unint64_t v20 = (v20 + 1) & v21;
          uint64_t v18 = v36;
          if (((*(void *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v20) & 1) == 0) {
            goto LABEL_3;
          }
        }

        v26(v10, v5);
        sub_10002D514(&v38, (uint64_t)v37);
        int64_t v27 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native(v41) & 1) == 0)
        {
          sub_100029B3C(0, v27[2] + 1LL, 1);
          int64_t v27 = v41;
        }

        unint64_t v29 = v27[2];
        unint64_t v28 = v27[3];
        if (v29 >= v28 >> 1)
        {
          sub_100029B3C(v28 > 1, v29 + 1, 1);
          int64_t v27 = v41;
        }

        v27[2] = v29 + 1;
        sub_10002D514(v37, (uint64_t)&v27[5 * v29 + 4]);
      }

      else
      {
LABEL_3:
        ((void (*)(char *, uint64_t))v35[1])(v10, v5);
        sub_100013384(&v38);
      }

      uint64_t v12 = v33 + 1;
    }

    while (v33 + 1 != v32);
    return v41;
  }

  return result;
}

uint64_t sub_10002D40C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 40 * a1 + 32;
  unint64_t v8 = a3 + 40 * v5;
  if (v7 >= v8 || v7 + 40 * v5 <= a3)
  {
    sub_100005EA4(a5);
    swift_arrayInitWithCopy(a3);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002D514(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return a2;
}

uint64_t sub_10002D52C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(type metadata accessor for Message(0LL) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002D644(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002D688(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002D6CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002D710()
{
  return swift_deallocObject(v0, 46LL, 7LL);
}

uint64_t sub_10002D73C()
{
  uint64_t v1 = *(char ***)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  unsigned int v3 = *(_DWORD *)(v0 + 40);
  unsigned __int16 v4 = *(_WORD *)(v0 + 44);
  uint64_t v5 = sub_100026E8C();
  sub_10001EA0C(v1, v2, v3, v4);
  return swift_release(v5);
}

uint64_t sub_10002D798()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002D7BC()
{
  return sub_100027B6C(v0);
}

uint64_t sub_10002D7C8()
{
  return sub_100025228(0);
}

uint64_t sub_10002D7D4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002D7E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002D7FC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002D828()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002D838(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005EA4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10002D874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureInfo(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002D8F4()
{
  uint64_t v1 = type metadata accessor for SimpleType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v83 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v81 = (char *)&v81 - v5;
  uint64_t v90 = type metadata accessor for Keys(0LL);
  __n128 v92 = *(void **)(v90 - 8);
  uint64_t v6 = __chkstk_darwin(v90);
  uint64_t v91 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v89 = (char *)&v81 - v8;
  uint64_t v9 = sub_100005EA4(&qword_100042088);
  uint64_t v10 = sub_100005EA4(&qword_100041688);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = swift_allocObject(v9, v14 + 6 * v12, v13 | 7);
  *(_OWORD *)(v15 + swift_weakDestroy(v0 + 16) = xmmword_100035DE0;
  uint64_t v93 = v15;
  uint64_t v16 = (void *)(v15 + v14);
  *uint64_t v16 = 0x646F6874656DLL;
  v16[1] = 0xE600000000000000LL;
  uint64_t v96 = v0;
  int v17 = *v0;
  uint64_t v82 = v2;
  int v95 = v17;
  if (v17 == 2)
  {
    uint64_t v18 = 1886352499LL;
    uint64_t v23 = *(int *)(v10 + 48);
    uint64_t v19 = (int *)(v10 + 48);
    uint64_t v21 = (void *)((char *)v16 + v23);
    uint64_t v22 = (void *)0xE400000000000000LL;
    goto LABEL_5;
  }

  if (v17 == 1)
  {
    uint64_t v18 = 0x735F6C616E676973LL;
    uint64_t v20 = *(int *)(v10 + 48);
    uint64_t v19 = (int *)(v10 + 48);
    uint64_t v21 = (void *)((char *)v16 + v20);
    uint64_t v22 = (void *)0xEB00000000706F74LL;
LABEL_5:
    *uint64_t v21 = v18;
    v21[1] = (uint64_t)v22;
    uint64_t v24 = *(void (**)(void))(v2 + 104);
    unsigned int v88 = enum case for SimpleType.string(_:);
    uint64_t v25 = v1;
    char v97 = v24;
    v24();
    unint64_t v98 = 0x7373656D5F6D756ELL;
    goto LABEL_7;
  }

  uint64_t v25 = v1;
  uint64_t v26 = *(int *)(v10 + 48);
  uint64_t v19 = (int *)(v10 + 48);
  int64_t v27 = (void *)((char *)v16 + v26);
  uint64_t v22 = (void *)0xE500000000000000LL;
  *int64_t v27 = 0x7472617473LL;
  v27[1] = 0xE500000000000000LL;
  unint64_t v28 = *(void (**)(void))(v2 + 104);
  unsigned int v88 = enum case for SimpleType.string(_:);
  char v97 = v28;
  v28();
  unint64_t v98 = 0x7373656D5F6D756ELL;
  uint64_t v18 = 0x7472617473LL;
LABEL_7:
  uint64_t v87 = v19;
  unint64_t v99 = 0xED00005F73656761LL;
  unint64_t v29 = (void *)((char *)v16 + v12);
  uint64_t v30 = *v19;
  uint64_t v94 = v12;
  uint64_t v31 = (void *)((char *)v16 + v12 + v30);
  v32._id countAndFlagsBits = v18;
  v32._object = v22;
  String.append(_:)(v32);
  swift_bridgeObjectRelease(v22);
  unint64_t v33 = v99;
  *unint64_t v29 = v98;
  v29[1] = v33;
  uint64_t v34 = v96;
  *uint64_t v31 = *((void *)v96 + 1);
  LODWORD(v86) = enum case for SimpleType.uint(_:);
  ((void (*)(void *))v97)(v31);
  unint64_t v98 = 0LL;
  unint64_t v99 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(22LL);
  swift_bridgeObjectRelease(v99);
  unint64_t v98 = 0xD000000000000014LL;
  unint64_t v99 = 0x80000001000373A0LL;
  uint64_t v35 = 0x735F6C616E676973LL;
  unint64_t v36 = 0xEB00000000706F74LL;
  if (v95 != 1)
  {
    uint64_t v35 = 1886352499LL;
    unint64_t v36 = 0xE400000000000000LL;
  }

  if (v95) {
    uint64_t v37 = v35;
  }
  else {
    uint64_t v37 = 0x7472617473LL;
  }
  if (v95) {
    unint64_t v38 = v36;
  }
  else {
    unint64_t v38 = 0xE500000000000000LL;
  }
  uint64_t v39 = v25;
  uint64_t v40 = v94;
  uint64_t v41 = (void *)((char *)v16 + 2 * v94);
  uint64_t v42 = v87;
  uint64_t v43 = (unint64_t *)((char *)v41 + *v87);
  unint64_t v44 = v38;
  String.append(_:)(*(Swift::String *)&v37);
  swift_bridgeObjectRelease(v38);
  unint64_t v45 = v99;
  *uint64_t v41 = v98;
  v41[1] = v45;
  *uint64_t v43 = *((void *)v34 + 2);
  uint64_t v85 = v39;
  ((void (*)(void *, void, uint64_t))v97)(v43, v86, v39);
  int64_t v46 = (void *)((char *)v16 + 3 * v40);
  uint64_t v47 = (uint64_t *)((char *)v46 + *v42);
  uint64_t v48 = v92;
  unint64_t v86 = (uint64_t (*)(char *, void, uint64_t))v92[13];
  uint64_t v49 = v89;
  uint64_t v50 = v90;
  uint64_t v51 = v86(v89, enum case for Keys.reporterID(_:), v90);
  uint64_t v52 = Keys.rawValue.getter(v51);
  uint64_t v54 = v53;
  uint64_t v84 = (void (*)(char *, uint64_t))v48[1];
  v84(v49, v50);
  uint64_t *v46 = v52;
  v46[1] = v54;
  uint64_t v55 = (uint64_t)v96;
  *uint64_t v47 = *((void *)v96 + 3);
  uint64_t v56 = v85;
  ((void (*)(void *, void, uint64_t))v97)(v47, enum case for SimpleType.int(_:), v85);
  __n128 v92 = v16;
  __int128 v57 = (void *)((char *)v16 + 4 * v40);
  __int128 v58 = v42;
  __int128 v59 = (_OWORD *)((char *)v57 + *v42);
  __int128 v60 = v91;
  uint64_t v61 = v86(v91, enum case for Keys.applicationName(_:), v50);
  uint64_t v62 = Keys.rawValue.getter(v61);
  uint64_t v64 = v63;
  v84(v60, v50);
  *__int128 v57 = v62;
  v57[1] = v64;
  *__int128 v59 = *(_OWORD *)(v55 + 40);
  unsigned int v65 = v97;
  ((void (*)(_OWORD *, void, uint64_t))v97)(v59, v88, v56);
  unint64_t v98 = 0x5F676E696E6E7572LL;
  unint64_t v99 = 0xEB000000005F7461LL;
  unint64_t v66 = v58;
  if (v95)
  {
    uint64_t v67 = v56;
    if (v95 == 1)
    {
      uint64_t v68 = 0x735F6C616E676973LL;
      __int128 v69 = (void *)0xEB00000000706F74LL;
    }

    else
    {
      __int128 v69 = (void *)0xE400000000000000LL;
      uint64_t v68 = 1886352499LL;
    }

    uint64_t v70 = v55;
  }

  else
  {
    uint64_t v67 = v56;
    __int128 v69 = (void *)0xE500000000000000LL;
    uint64_t v70 = v55;
    uint64_t v68 = 0x7472617473LL;
  }

  uint64_t v71 = (void *)((char *)v92 + 5 * v94);
  char v72 = (char *)v71 + *v66;
  sub_10002DF20(v70);
  v73._id countAndFlagsBits = v68;
  v73._object = v69;
  String.append(_:)(v73);
  swift_bridgeObjectRelease(v69);
  unint64_t v74 = v99;
  *uint64_t v71 = v98;
  v71[1] = v74;
  *char v72 = *(_BYTE *)(v70 + 32);
  uint64_t v75 = enum case for SimpleType.BOOL(_:);
  ((void (*)(_BYTE *, void, uint64_t))v65)(v72, enum case for SimpleType.BOOL(_:), v67);
  unint64_t v76 = sub_1000057C0(v93);
  if ((*(_BYTE *)(v70 + 56) & 1) != 0)
  {
    uint64_t v77 = v81;
    _BYTE *v81 = *(_BYTE *)(v70 + 56);
    ((void (*)(_BYTE *, uint64_t, uint64_t))v65)(v77, v75, v67);
    uint64_t v78 = (uint64_t)v83;
    (*(void (**)(char *, _BYTE *, uint64_t))(v82 + 32))(v83, v77, v67);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v76);
    unint64_t v98 = v76;
    sub_100020890(v78, 0xD000000000000014LL, 0x80000001000373C0LL, isUniquelyReferenced_nonNull_native);
    unint64_t v76 = v98;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  return v76;
}

uint64_t sub_10002DF20(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002DF48(uint64_t a1)
{
  uint64_t v58 = sub_100005EA4(&qword_1000422C0);
  uint64_t v3 = __chkstk_darwin(v58);
  uint64_t v57 = (uint64_t)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v56 = (uint64_t)v46 - v6;
  __chkstk_darwin(v5);
  uint64_t v55 = (char *)v46 - v7;
  uint64_t v8 = sub_100005EA4(&qword_100041688);
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v54 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (uint64_t)v12;
  }
  v46[1] = v1;
  uint64_t v61 = _swiftEmptyArrayStorage;
  sub_100029B74(0, v11, 0);
  uint64_t result = sub_1000330E0(a1);
  uint64_t v15 = result;
  uint64_t v16 = 0LL;
  uint64_t v17 = a1 + 64;
  uint64_t v47 = a1 + 80;
  int64_t v48 = v11;
  uint64_t v51 = v10;
  uint64_t v52 = a1;
  uint64_t v49 = v14;
  uint64_t v50 = a1 + 64;
  while ((v15 & 0x8000000000000000LL) == 0 && v15 < 1LL << *(_BYTE *)(a1 + 32))
  {
    unint64_t v20 = (unint64_t)v15 >> 6;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v14) {
      goto LABEL_26;
    }
    uint64_t v59 = v16;
    uint64_t v60 = 1LL << v15;
    uint64_t v21 = v58;
    uint64_t v22 = (uint64_t)v55;
    uint64_t v23 = (uint64_t)&v55[*(int *)(v58 + 48)];
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = type metadata accessor for FeatureInfo(0LL);
    sub_10001E188(v24 + *(void *)(*(void *)(v25 - 8) + 72LL) * v15, v22, type metadata accessor for FeatureInfo);
    uint64_t v26 = *(void *)(a1 + 56);
    uint64_t v27 = type metadata accessor for FeatureState(0LL);
    sub_10001E188(v26 + *(void *)(*(void *)(v27 - 8) + 72LL) * v15, v23, type metadata accessor for FeatureState);
    uint64_t v28 = v56;
    sub_10001E188(v22, v56, type metadata accessor for FeatureInfo);
    sub_10001E188(v23, v28 + *(int *)(v21 + 48), type metadata accessor for FeatureState);
    uint64_t v29 = v28;
    uint64_t v30 = v57;
    sub_10002D644(v29, v57, &qword_1000422C0);
    sub_10002D838(v22, &qword_1000422C0);
    uint64_t v31 = *(int *)(v21 + 48);
    Swift::String v32 = v51;
    unint64_t v33 = (char *)v51 + *(int *)(v54 + 48);
    uint64_t v34 = (uint64_t *)(v30 + *(int *)(v25 + 20));
    uint64_t v36 = *v34;
    uint64_t v35 = v34[1];
    uint64_t v37 = v30 + v31 + *(int *)(v27 + 20);
    uint64_t v38 = type metadata accessor for SimpleType(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16LL))(v33, v37, v38);
    *Swift::String v32 = v36;
    v32[1] = v35;
    swift_bridgeObjectRetain(v35);
    sub_10002D838(v30, &qword_1000422C0);
    uint64_t v12 = v61;
    if ((swift_isUniquelyReferenced_nonNull_native(v61) & 1) == 0)
    {
      sub_100029B74(0, v12[2] + 1LL, 1);
      uint64_t v12 = v61;
    }

    unint64_t v40 = v12[2];
    unint64_t v39 = v12[3];
    a1 = v52;
    if (v40 >= v39 >> 1)
    {
      sub_100029B74(v39 > 1, v40 + 1, 1);
      uint64_t v12 = v61;
    }

    v12[2] = v40 + 1;
    uint64_t result = sub_10002D644( (uint64_t)v32,  (uint64_t)v12 + ((*(unsigned __int8 *)(v53 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))
             + *(void *)(v53 + 72) * v40,
               &qword_100041688);
    int64_t v18 = 1LL << *(_BYTE *)(a1 + 32);
    if (v15 >= v18) {
      goto LABEL_27;
    }
    uint64_t v17 = v50;
    uint64_t v41 = *(void *)(v50 + 8 * v20);
    if ((v41 & v60) == 0) {
      goto LABEL_28;
    }
    LODWORD(v14) = v49;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v49) {
      goto LABEL_29;
    }
    unint64_t v42 = v41 & (-2LL << (v15 & 0x3F));
    if (v42)
    {
      int64_t v18 = __clz(__rbit64(v42)) | v15 & 0xFFFFFFFFFFFFFFC0LL;
      int64_t v19 = v48;
    }

    else
    {
      unint64_t v43 = v20 + 1;
      unint64_t v44 = (unint64_t)(v18 + 63) >> 6;
      int64_t v19 = v48;
      if (v20 + 1 < v44)
      {
        unint64_t v45 = *(void *)(v50 + 8 * v43);
        if (v45)
        {
LABEL_22:
          int64_t v18 = __clz(__rbit64(v45)) + (v43 << 6);
        }

        else
        {
          while (v44 - 2 != v20)
          {
            unint64_t v45 = *(void *)(v47 + 8 * v20++);
            if (v45)
            {
              unint64_t v43 = v20 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }

    uint64_t v16 = v59 + 1;
    uint64_t v15 = v18;
    if (v59 + 1 == v19) {
      return (uint64_t)v12;
    }
  }

  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t *SystemMonitor.shared.unsafeMutableAddressor()
{
  return &static SystemMonitor.shared;
}

uint64_t SystemMonitor.currentMessageContents.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain(v1);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_100030554((void *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  uint64_t v2 = v4;
  swift_release(v1);
  return v2;
}

uint64_t static SystemMonitor.shared.getter()
{
  return swift_retain(static SystemMonitor.shared);
}

uint64_t sub_10002E43C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SystemMonitor.shutdown()", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = *(void *)(v2 + 16);
  swift_retain(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  sub_10003062C((void *)(v6 + 16), v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
  return swift_release(v6);
}

uint64_t sub_10002E518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  v169 = a5;
  uint64_t v171 = a4;
  uint64_t v172 = a3;
  uint64_t v6 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v6);
  v158 = &v147[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v161 = type metadata accessor for Message(0LL);
  uint64_t v160 = *(void *)(v161 - 8);
  __chkstk_darwin(v161);
  __int128 v159 = &v147[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v163 = sub_100005EA4(&qword_1000422C8);
  __chkstk_darwin(v163);
  v164 = &v147[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v165 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v10 = *(void *)(*(void *)(v165 - 8) + 64LL);
  uint64_t v11 = __chkstk_darwin(v165);
  uint64_t v168 = &v147[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v11);
  uint64_t v13 = &v147[-v12];
  uint64_t v14 = sub_100005EA4((uint64_t *)&unk_100041C30);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v156 = &v147[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v155 = &v147[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v166 = &v147[-v20];
  uint64_t v21 = __chkstk_darwin(v19);
  v167 = &v147[-v22];
  __chkstk_darwin(v21);
  uint64_t v24 = &v147[-v23];
  uint64_t v25 = type metadata accessor for FeatureState(0LL);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  __int128 v154 = &v147[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v153 = &v147[-v30];
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v157 = &v147[-v32];
  uint64_t v33 = __chkstk_darwin(v31);
  __int128 v162 = &v147[-v34];
  uint64_t v35 = __chkstk_darwin(v33);
  Swift::Int v150 = &v147[-v36];
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v151 = &v147[-v38];
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v152 = &v147[-v40];
  __chkstk_darwin(v39);
  v170 = &v147[-v41];
  uint64_t v42 = type metadata accessor for Logger(0LL);
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = __chkstk_darwin(v42);
  int64_t v46 = &v147[-((v45 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v44);
  int64_t v48 = &v147[-v47];
  a2 += 16LL;
  swift_beginAccess(a2, v177, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a2);
  if (Strong)
  {
    uint64_t v50 = Strong;
    uint64_t v51 = v172 + 16;
    swift_beginAccess(v172 + 16, v176, 0LL, 0LL);
    uint64_t v52 = swift_unknownObjectWeakLoadStrong(v51);
    if (v52)
    {
      uint64_t v172 = v52;
      uint64_t v53 = (unsigned int *)(v169 + 16);
      swift_beginAccess(v169 + 16, v175, 0LL, 0LL);
      uint64_t v54 = *v53;
      LOBYTE(v174) = 0;
      uint64_t v55 = v171;
      sub_10002F5D8(v171, v54, (uint64_t)v24);
      uint64_t v56 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v26 + 48);
      uint64_t v57 = v25;
      if (v56(v24, 1LL, v25) == 1)
      {
        sub_10002D838((uint64_t)v24, (uint64_t *)&unk_100041C30);
        uint64_t v58 = sub_10001E188(v55, (uint64_t)v13, type metadata accessor for FeatureInfo);
        uint64_t v59 = (os_log_s *)Logger.logObject.getter(v58);
        os_log_type_t v60 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v62 = swift_slowAlloc(32LL, -1LL);
          *(_DWORD *)uint64_t v61 = 136380675;
          uint64_t v174 = v62;
          uint64_t v63 = (uint64_t *)&v13[*(int *)(v165 + 28)];
          uint64_t v64 = *v63;
          unint64_t v65 = v63[1];
          swift_bridgeObjectRetain(v65);
          uint64_t v173 = sub_100028CC4(v64, v65, &v174);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, &v174, v61 + 4, v61 + 12);
          swift_bridgeObjectRelease(v65);
          sub_100033640((uint64_t)v13, type metadata accessor for FeatureInfo);
          _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "No value found, even though we received a notification! { notification=%{private}s }",  v61,  0xCu);
          swift_arrayDestroy(v62, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v62, -1LL, -1LL);
          swift_slowDealloc(v61, -1LL, -1LL);
          swift_release(v50);

          return swift_unknownObjectRelease(v172);
        }

        swift_release(v50);

        swift_unknownObjectRelease(v172);
        uint64_t v89 = type metadata accessor for FeatureInfo;
        goto LABEL_32;
      }

      uint64_t v75 = v170;
      sub_100006698((uint64_t)v24, (uint64_t)v170, type metadata accessor for FeatureState);
      unint64_t v76 = v167;
      sub_10001E188((uint64_t)v75, (uint64_t)v167, type metadata accessor for FeatureState);
      uint64_t v77 = v55;
      uint64_t v78 = *(char **)(v26 + 56);
      ((void (*)(_BYTE *, void, uint64_t, uint64_t))v78)(v76, 0LL, 1LL, v57);
      uint64_t v149 = v50;
      uint64_t v79 = *(void *)(v50 + 16);
      uint64_t v80 = v77;
      uint64_t v81 = v168;
      uint64_t v82 = sub_10001E188(v80, (uint64_t)v168, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v82);
      sub_100006698( (uint64_t)v81,  (uint64_t)&v147[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  type metadata accessor for FeatureInfo);
      uint64_t KeyPath = swift_getKeyPath(&unk_100035EF0, &v147[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)]);
      swift_retain(v79);
      uint64_t v84 = v166;
      OSAllocatedUnfairLock<A>.load<A>(_:)(KeyPath, v79);
      swift_release(KeyPath);
      swift_release(v79);
      uint64_t v85 = v164;
      uint64_t v86 = (uint64_t)&v164[*(int *)(v163 + 48)];
      sub_100006654((uint64_t)v76, (uint64_t)v164, (uint64_t *)&unk_100041C30);
      sub_100006654((uint64_t)v84, v86, (uint64_t *)&unk_100041C30);
      uint64_t v87 = v57;
      if (v56(v85, 1LL, v57) == 1)
      {
        sub_10002D838((uint64_t)v84, (uint64_t *)&unk_100041C30);
        sub_10002D838((uint64_t)v76, (uint64_t *)&unk_100041C30);
        if (v56((_BYTE *)v86, 1LL, v57) == 1)
        {
          sub_10002D838((uint64_t)v85, (uint64_t *)&unk_100041C30);
          uint64_t v88 = v149;
          uint64_t v13 = v170;
LABEL_21:
          uint64_t v100 = v153;
          sub_10001E188((uint64_t)v13, (uint64_t)v153, type metadata accessor for FeatureState);
          uint64_t v101 = v154;
          uint64_t v102 = sub_10001E188((uint64_t)v13, (uint64_t)v154, type metadata accessor for FeatureState);
          uint64_t v103 = (os_log_s *)Logger.logObject.getter(v102);
          os_log_type_t v104 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v103, v104))
          {
            uint64_t v105 = swift_slowAlloc(22LL, -1LL);
            uint64_t v171 = swift_slowAlloc(64LL, -1LL);
            uint64_t v174 = v171;
            *(_DWORD *)uint64_t v105 = 136380931;
            uint64_t v106 = (uint64_t *)&v100[*(int *)(v165 + 20)];
            uint64_t v107 = (uint64_t)v100;
            uint64_t v108 = *v106;
            unint64_t v109 = v106[1];
            swift_bridgeObjectRetain(v109);
            uint64_t v173 = sub_100028CC4(v108, v109, &v174);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, &v174, v105 + 4, v105 + 12);
            swift_bridgeObjectRelease(v109);
            sub_100033640(v107, type metadata accessor for FeatureState);
            *(_WORD *)(v105 + 12) = 2081;
            uint64_t v110 = v154;
            uint64_t v111 = v13;
            uint64_t v112 = type metadata accessor for SimpleType(0LL);
            uint64_t v113 = sub_1000061B8( &qword_1000422D0,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleType,  (uint64_t)&protocol conformance descriptor for SimpleType);
            uint64_t v114 = dispatch thunk of CustomStringConvertible.description.getter(v112, v113);
            unint64_t v116 = v115;
            uint64_t v173 = sub_100028CC4(v114, v115, &v174);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, &v174, v105 + 14, v105 + 22);
            swift_bridgeObjectRelease(v116);
            sub_100033640((uint64_t)v110, type metadata accessor for FeatureState);
            _os_log_impl( (void *)&_mh_execute_header,  v103,  v104,  "Value did not change. { feature=%{private}s, value=%{private}s }",  (uint8_t *)v105,  0x16u);
            uint64_t v117 = v171;
            swift_arrayDestroy(v171, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v117, -1LL, -1LL);
            swift_slowDealloc(v105, -1LL, -1LL);
            swift_unknownObjectRelease(v172);
            swift_release(v149);

            uint64_t v118 = (uint64_t)v111;
          }

          else
          {
            swift_unknownObjectRelease(v172);
            sub_100033640((uint64_t)v100, type metadata accessor for FeatureState);
            sub_100033640((uint64_t)v101, type metadata accessor for FeatureState);
            swift_release(v88);

            uint64_t v118 = (uint64_t)v13;
          }

          uint64_t v89 = type metadata accessor for FeatureState;
          return sub_100033640(v118, v89);
        }

        uint64_t v91 = &qword_1000422C8;
        uint64_t v88 = v149;
        uint64_t v92 = (uint64_t)v162;
        uint64_t v13 = v170;
      }

      else
      {
        uint64_t v90 = v155;
        sub_100006654((uint64_t)v85, (uint64_t)v155, (uint64_t *)&unk_100041C30);
        if (v56((_BYTE *)v86, 1LL, v87) == 1)
        {
          uint64_t v91 = &qword_1000422C8;
          uint64_t v92 = (uint64_t)v162;
          uint64_t v93 = v167;
          uint64_t v13 = v170;
        }

        else
        {
          uint64_t v163 = v87;
          v169 = v78;
          uint64_t v94 = v152;
          sub_100006698(v86, (uint64_t)v152, type metadata accessor for FeatureState);
          char v95 = sub_10003337C((uint64_t)v90, (uint64_t)v94);
          uint64_t v96 = v151;
          sub_10001E188((uint64_t)v90, (uint64_t)v151, type metadata accessor for FeatureState);
          char v97 = v150;
          sub_10001E188((uint64_t)v94, (uint64_t)v150, type metadata accessor for FeatureState);
          uint64_t v92 = (uint64_t)v162;
          uint64_t v13 = v170;
          if ((v95 & 1) != 0)
          {
            uint64_t v98 = v163;
            int v148 = static SimpleType.== infix(_:_:)(&v96[*(int *)(v163 + 20)], &v97[*(int *)(v163 + 20)]);
            uint64_t v99 = (uint64_t)v97;
            uint64_t v87 = v98;
            sub_100033640(v99, type metadata accessor for FeatureState);
            sub_100033640((uint64_t)v96, type metadata accessor for FeatureState);
            sub_100033640((uint64_t)v94, type metadata accessor for FeatureState);
            sub_10002D838((uint64_t)v166, (uint64_t *)&unk_100041C30);
            sub_10002D838((uint64_t)v167, (uint64_t *)&unk_100041C30);
            sub_100033640((uint64_t)v90, type metadata accessor for FeatureState);
            sub_10002D838((uint64_t)v85, (uint64_t *)&unk_100041C30);
            uint64_t v88 = v149;
            uint64_t v78 = v169;
            if ((v148 & 1) != 0) {
              goto LABEL_21;
            }
LABEL_28:
            uint64_t v119 = *(void *)(v88 + 16);
            uint64_t v120 = v168;
            uint64_t v121 = sub_10001E188(v171, (uint64_t)v168, type metadata accessor for FeatureInfo);
            __chkstk_darwin(v121);
            char v122 = &v147[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            sub_100006698((uint64_t)v120, (uint64_t)v122, type metadata accessor for FeatureInfo);
            uint64_t v123 = swift_getKeyPath(&unk_100035EF0, v122);
            uint64_t v124 = v156;
            sub_10001E188((uint64_t)v13, (uint64_t)v156, type metadata accessor for FeatureState);
            ((void (*)(_BYTE *, void, uint64_t, uint64_t))v78)(v124, 0LL, 1LL, v87);
            swift_retain(v119);
            OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)(v123, v124, v119);
            swift_release(v119);
            swift_release(v123);
            sub_10002D838((uint64_t)v124, (uint64_t *)&unk_100041C30);
            sub_10001E188((uint64_t)v13, v92, type metadata accessor for FeatureState);
            unint64_t v125 = v157;
            uint64_t v126 = sub_10001E188((uint64_t)v13, (uint64_t)v157, type metadata accessor for FeatureState);
            uint64_t v127 = (os_log_s *)Logger.logObject.getter(v126);
            os_log_type_t v128 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v127, v128))
            {
              uint64_t v129 = swift_slowAlloc(22LL, -1LL);
              uint64_t v130 = swift_slowAlloc(64LL, -1LL);
              uint64_t v174 = v130;
              *(_DWORD *)uint64_t v129 = 136380931;
              uint64_t v131 = (uint64_t *)(v92 + *(int *)(v165 + 20));
              uint64_t v132 = *v131;
              unint64_t v133 = v131[1];
              swift_bridgeObjectRetain(v133);
              uint64_t v173 = sub_100028CC4(v132, v133, &v174);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, &v174, v129 + 4, v129 + 12);
              swift_bridgeObjectRelease(v133);
              sub_100033640(v92, type metadata accessor for FeatureState);
              *(_WORD *)(v129 + 12) = 2081;
              uint64_t v134 = type metadata accessor for SimpleType(0LL);
              uint64_t v135 = sub_1000061B8( &qword_1000422D0,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleType,  (uint64_t)&protocol conformance descriptor for SimpleType);
              uint64_t v136 = v134;
              uint64_t v13 = v170;
              uint64_t v137 = dispatch thunk of CustomStringConvertible.description.getter(v136, v135);
              unint64_t v139 = v138;
              uint64_t v173 = sub_100028CC4(v137, v138, &v174);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, &v174, v129 + 14, v129 + 22);
              swift_bridgeObjectRelease(v139);
              sub_100033640((uint64_t)v125, type metadata accessor for FeatureState);
              _os_log_impl( (void *)&_mh_execute_header,  v127,  v128,  "Broadcasting new value. { feature=%{private}s, value=%{private}s }",  (uint8_t *)v129,  0x16u);
              swift_arrayDestroy(v130, 2LL, (char *)&type metadata for Any + 8);
              uint64_t v140 = v130;
              uint64_t v88 = v149;
              swift_slowDealloc(v140, -1LL, -1LL);
              swift_slowDealloc(v129, -1LL, -1LL);
            }

            else
            {

              sub_100033640(v92, type metadata accessor for FeatureState);
              sub_100033640((uint64_t)v125, type metadata accessor for FeatureState);
            }

            uint64_t v141 = *(void *)(v88 + 16);
            swift_retain(v141);
            os_unfair_lock_lock((os_unfair_lock_t)(v141 + 24));
            sub_100030554((void *)(v141 + 16), &v174);
            os_unfair_lock_unlock((os_unfair_lock_t)(v141 + 24));
            uint64_t v142 = v174;
            swift_release(v141);
            uint64_t v143 = type metadata accessor for Message.Metadata(0LL);
            uint64_t v144 = v158;
            (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v143 - 8) + 56LL))( v158,  1LL,  1LL,  v143);
            uint64_t v145 = (uint64_t)v159;
            Message.init(category:type:content:metadata:)(8LL, 5LL, v142, v144);
            uint64_t v146 = v172;
            sub_100014D8C(v145);
            swift_release(v88);
            swift_unknownObjectRelease(v146);
            (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v145, v161);
            uint64_t v89 = type metadata accessor for FeatureState;
LABEL_32:
            uint64_t v118 = (uint64_t)v13;
            return sub_100033640(v118, v89);
          }

          sub_100033640((uint64_t)v97, type metadata accessor for FeatureState);
          sub_100033640((uint64_t)v96, type metadata accessor for FeatureState);
          sub_100033640((uint64_t)v94, type metadata accessor for FeatureState);
          uint64_t v91 = (uint64_t *)&unk_100041C30;
          uint64_t v93 = v167;
          uint64_t v78 = v169;
          uint64_t v87 = v163;
        }

        sub_10002D838((uint64_t)v166, (uint64_t *)&unk_100041C30);
        sub_10002D838((uint64_t)v93, (uint64_t *)&unk_100041C30);
        sub_100033640((uint64_t)v90, type metadata accessor for FeatureState);
        uint64_t v88 = v149;
      }

      sub_10002D838((uint64_t)v85, v91);
      goto LABEL_28;
    }

    uint64_t v71 = static Logger.service.getter();
    char v72 = (os_log_s *)Logger.logObject.getter(v71);
    os_log_type_t v73 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v72, v73))
    {
      unint64_t v74 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v74 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Somehow Server no longer exists!", v74, 2u);
      swift_slowDealloc(v74, -1LL, -1LL);
    }

    swift_release(v50);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v43 + 8))(v46, v42);
  }

  else
  {
    uint64_t v67 = static Logger.service.getter();
    uint64_t v68 = (os_log_s *)Logger.logObject.getter(v67);
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v70 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Somehow SystemMonitor no longer exists!", v70, 2u);
      swift_slowDealloc(v70, -1LL, -1LL);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v43 + 8))(v48, v42);
  }

void sub_10002F5D8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v156 = a2;
  uint64_t v159 = a3;
  os_log_type_t v4 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v153 = (uint64_t)&v150 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v155 = (uint64_t)&v150 - v8;
  __chkstk_darwin(v7);
  uint64_t v151 = (uint64_t)&v150 - v9;
  uint64_t v10 = type metadata accessor for SimpleType(0LL);
  uint64_t v157 = *(void *)(v10 - 8);
  uint64_t v158 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v152 = (double *)((char *)&v150 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = __chkstk_darwin(v11);
  __int128 v154 = (uint64_t *)((char *)&v150 - v14);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v150 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (uint64_t *)((char *)&v150 - v18);
  uint64_t v20 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v150 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v150 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a1, v24);
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v27, v24);
  if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.defaults(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, a1 + v4[9], v20);
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.string(_:))
    {
      uint64_t v30 = (uint64_t *)(a1 + v4[5]);
      uint64_t v31 = *v30;
      uint64_t v32 = v30[1];
      uint64_t v33 = (uint64_t *)(a1 + v4[6]);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      uint64_t v36 = static DefaultsUtilities.platformDefaultUserName.getter();
      uint64_t v38 = v37;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)( &state64,  v31,  v32,  v34,  v35,  v36,  v37,  &type metadata for String);
      swift_bridgeObjectRelease(v38);
      uint64_t v39 = v162;
      if (v162)
      {
        uint64_t v40 = state64;
        uint64_t v41 = a1;
        uint64_t v42 = v159;
        sub_10001E188(v41, v159, type metadata accessor for FeatureInfo);
        uint64_t v43 = type metadata accessor for FeatureState(0LL);
        uint64_t v44 = (uint64_t *)(v42 + *(int *)(v43 + 20));
        *uint64_t v44 = v40;
        v44[1] = v39;
LABEL_58:
        (*(void (**)(void))(v157 + 104))();
        *(_DWORD *)(v42 + *(int *)(v43 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = -1;
        os_log_type_t v128 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL);
        uint64_t v129 = v42;
LABEL_86:
        v128(v129, 0LL, 1LL, v43);
        return;
      }

LABEL_78:
            uint64_t v65 = 0LL;
            char v67 = 1;
            goto LABEL_81;
          }

          __break(1u);
LABEL_102:
          __break(1u);
        }

        uint64_t v65 = (v59 - 48);
        uint64_t v138 = v61 - 1;
        if (v138)
        {
          uint64_t v143 = (unsigned __int8 *)&state64 + 1;
          while (1)
          {
            unsigned int v144 = *v143 - 48;
            if (v144 > 9) {
              goto LABEL_78;
            }
            uint64_t v145 = 10 * v65;
            uint64_t v65 = v145 + v144;
            char v67 = 0;
            ++v143;
            if (!--v138) {
              goto LABEL_81;
            }
          }
        }
      }

uint64_t SystemMonitor.currentMessage.getter()
{
  uint64_t v1 = sub_100005EA4(&qword_100041700);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(v0 + 16);
  swift_retain(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  sub_100030554((void *)(v4 + 16), &v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  uint64_t v5 = v9;
  swift_release(v4);
  uint64_t v6 = type metadata accessor for Message.Metadata(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v3, 1LL, 1LL, v6);
  return Message.init(category:type:content:metadata:)(8LL, 5LL, v5, v3);
}

uint64_t sub_100030554@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain(*a1);
  uint64_t v6 = sub_10002DF48(v5);
  swift_bridgeObjectRelease(v4);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    sub_100005EA4(&qword_100041690);
    uint64_t v8 = (void *)static _DictionaryStorage.allocate(capacity:)(v7);
  }

  else
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v11 = v8;
  swift_bridgeObjectRetain(v6);
  sub_100032410(v9, 1, &v11);
  if (v2)
  {
    uint64_t result = swift_unexpectedError(v2, "Swift/Dictionary.swift", 22LL, 1LL, 489LL);
    __break(1u);
  }

  else
  {
    uint64_t result = swift_bridgeObjectRelease(v6);
    *a2 = v11;
  }

  return result;
}

void sub_10003062C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0LL);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v35 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v35 = a1;
  uint64_t v13 = *a1;
  uint64_t v14 = *(void *)(*a1 + 64LL);
  uint64_t v38 = *a1 + 64LL;
  uint64_t v15 = 1LL << *(_BYTE *)(v13 + 32);
  uint64_t v16 = -1LL;
  if (v15 < 64) {
    uint64_t v16 = ~(-1LL << v15);
  }
  unint64_t v17 = v16 & v14;
  uint64_t v41 = a2 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v42 = v13;
  int64_t v39 = (unint64_t)(v15 + 63) >> 6;
  __n128 v18 = swift_bridgeObjectRetain(v13);
  int64_t v19 = 0LL;
  v18.n128_u64[0] = 67240192LL;
  __n128 v36 = v18;
  uint64_t v37 = v10;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      int64_t v43 = v19;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v39) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v38 + 8 * v22);
    int64_t v24 = v19 + 1;
    if (!v23)
    {
      int64_t v24 = v19 + 2;
      if (v19 + 2 >= v39) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v38 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v19 + 3;
        if (v19 + 3 >= v39) {
          goto LABEL_26;
        }
        unint64_t v23 = *(void *)(v38 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v19 + 4;
          if (v19 + 4 >= v39) {
            goto LABEL_26;
          }
          unint64_t v23 = *(void *)(v38 + 8 * v24);
          if (!v23) {
            break;
          }
        }
      }
    }

uint64_t sub_100030990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for SystemMonitorConfig(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v45 - v8;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v49 = *(void *)(v10 - 8);
  uint64_t v50 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Logger.service.getter(v11);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v51 = a1;
  uint64_t v15 = v14(v9, a1, v3);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    __n128 v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v48 = swift_slowAlloc(32LL, -1LL);
    uint64_t v55 = v48;
    uint64_t v47 = v18;
    *(_DWORD *)__n128 v18 = 136380675;
    uint64_t v46 = v18 + 4;
    v14(v7, (uint64_t)v9, v3);
    uint64_t v19 = String.init<A>(describing:)(v7, v3);
    unint64_t v21 = v20;
    uint64_t v53 = sub_100028CC4(v19, v20, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v46, v18 + 12);
    swift_bridgeObjectRelease(v21);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    int64_t v22 = v47;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "SystemMonitor.buildFeatureInfos. { config=%{private}s }",  v47,  0xCu);
    uint64_t v23 = v48;
    swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }

  uint64_t v24 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v13, v50);
  uint64_t v25 = v52;
  uint64_t v26 = SystemMonitorConfig.monitorType.getter(v24);
  uint64_t v27 = SystemMonitorConfig.name.getter(v26);
  uint64_t v49 = v28;
  uint64_t v50 = v27;
  uint64_t v29 = SystemMonitorConfig.domain.getter();
  uint64_t v31 = v30;
  uint64_t v32 = SystemMonitorConfig.notification.getter();
  uint64_t v34 = v33;
  uint64_t v35 = SystemMonitorConfig.defaultValue.getter();
  uint64_t v37 = v36;
  uint64_t v38 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t result = SystemMonitorConfig.dataType.getter();
  uint64_t v40 = (uint64_t *)(v25 + v38[5]);
  uint64_t v41 = v49;
  *uint64_t v40 = v50;
  v40[1] = v41;
  uint64_t v42 = (uint64_t *)(v25 + v38[6]);
  *uint64_t v42 = v29;
  v42[1] = v31;
  int64_t v43 = (uint64_t *)(v25 + v38[7]);
  *int64_t v43 = v32;
  v43[1] = v34;
  uint64_t v44 = (uint64_t *)(v25 + v38[8]);
  *uint64_t v44 = v35;
  v44[1] = v37;
  return result;
}

uint64_t SystemMonitor.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return v0;
}

uint64_t SystemMonitor.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100030D30()
{
  return type metadata accessor for SystemMonitor(0LL);
}

uint64_t type metadata accessor for SystemMonitor(uint64_t a1)
{
  return sub_100031660(a1, qword_1000420D0, (uint64_t)&nominal type descriptor for SystemMonitor);
}

uint64_t sub_100030D4C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t *sub_100030DE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v34 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v34);
  }

  else
  {
    uint64_t v7 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for FeatureInfo(0LL);
    uint64_t v9 = v8[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = v8[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v8[7];
    __n128 v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *__n128 v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v8[8];
    int64_t v22 = (uint64_t *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *int64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v8[9];
    uint64_t v36 = (char *)a1 + v25;
    uint64_t v26 = (char *)a2 + v25;
    uint64_t v27 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
    uint64_t v28 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v27 - 8) + 16LL);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v20);
    __n128 v29 = swift_bridgeObjectRetain(v24);
    v28(v36, v26, v27, v29);
    uint64_t v30 = *(int *)(a3 + 20);
    uint64_t v31 = (char *)a1 + v30;
    uint64_t v32 = (char *)a2 + v30;
    uint64_t v33 = type metadata accessor for SimpleType(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16LL))(v31, v32, v33);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  }

  return a1;
}

uint64_t type metadata accessor for FeatureInfo(uint64_t a1)
{
  return sub_100031660(a1, qword_100042268, (uint64_t)&nominal type descriptor for FeatureInfo);
}

uint64_t sub_100030F78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  int v5 = (int *)type metadata accessor for FeatureInfo(0LL);
  swift_bridgeObjectRelease(*(void *)(a1 + v5[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v5[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v5[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v5[8] + 8));
  uint64_t v6 = a1 + v5[9];
  uint64_t v7 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  uint64_t v9 = type metadata accessor for SimpleType(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
}

uint64_t sub_10003104C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v7 = v6[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = v6[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v6[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v6[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = v6[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v26 - 8) + 16LL);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v18);
  __n128 v28 = swift_bridgeObjectRetain(v22);
  v27(v24, v25, v26, v28);
  uint64_t v29 = *(int *)(a3 + 20);
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  uint64_t v32 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16LL))(v30, v31, v32);
  *(_DWORD *)(a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000311A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v8 = v7[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v12 = v9[1];
  v9[1] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = v7[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v17 = v14[1];
  v14[1] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = v7[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  uint64_t v21 = v20[1];
  uint64_t v22 = v19[1];
  v19[1] = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  uint64_t v23 = v7[8];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *uint64_t v24 = *v25;
  uint64_t v26 = v25[1];
  uint64_t v27 = v24[1];
  v24[1] = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  uint64_t v28 = v7[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 24LL))(v29, v30, v31);
  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 24LL))(v33, v34, v35);
  *(_DWORD *)(a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100031318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0LL);
  *(_OWORD *)(a1 + v7[5]) = *(_OWORD *)(a2 + v7[5]);
  *(_OWORD *)(a1 + v7[6]) = *(_OWORD *)(a2 + v7[6]);
  *(_OWORD *)(a1 + v7[7]) = *(_OWORD *)(a2 + v7[7]);
  *(_OWORD *)(a1 + v7[8]) = *(_OWORD *)(a2 + v7[8]);
  uint64_t v8 = v7[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))(v13, v14, v15);
  *(_DWORD *)(a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10003140C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v8 = v7[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v13 = v9[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = v7[6];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  uint64_t v19 = v15[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = v7[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  uint64_t v25 = v21[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease(v25);
  uint64_t v26 = v7[8];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  uint64_t v31 = v27[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease(v31);
  uint64_t v32 = v7[9];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 40LL))(v33, v34, v35);
  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = type metadata accessor for SimpleType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 40LL))(v37, v38, v39);
  *(_DWORD *)(a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100031544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031550);
}

uint64_t sub_100031550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for SimpleType(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_1000315C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000315D0);
}

uint64_t sub_1000315D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for SimpleType(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for FeatureState(uint64_t a1)
{
  return sub_100031660(a1, qword_1000421D0, (uint64_t)&nominal type descriptor for FeatureState);
}

uint64_t sub_100031660(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_100031694(uint64_t a1)
{
  uint64_t result = type metadata accessor for FeatureInfo(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for SimpleType(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      v5[2] = (char *)&value witness table for Builtin.Int32 + 64;
      swift_initStructMetadata(a1, 256LL, 3LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t *sub_100031724(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v30);
  }

  else
  {
    uint64_t v7 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)a1 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)a1 + v17);
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v25 = a3[9];
    uint64_t v26 = (char *)a2 + v25;
    uint64_t v27 = (char *)a1 + v25;
    *uint64_t v21 = v23;
    v21[1] = v24;
    uint64_t v28 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16LL);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v24);
    v29(v27, v26, v28);
  }

  return a1;
}

uint64_t sub_100031850(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[8] + 8));
  uint64_t v5 = a1 + a2[9];
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_1000318EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (uint64_t *)(a2 + v16);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  uint64_t v24 = a3[9];
  uint64_t v25 = a2 + v24;
  uint64_t v26 = a1 + v24;
  void *v20 = v22;
  v20[1] = v23;
  uint64_t v27 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16LL);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v23);
  v28(v26, v25, v27);
  return a1;
}

uint64_t sub_1000319EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  uint64_t v20 = v19[1];
  uint64_t v21 = v18[1];
  v18[1] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  uint64_t v25 = v24[1];
  uint64_t v26 = v23[1];
  v23[1] = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24LL))(v28, v29, v30);
  return a1;
}

uint64_t sub_100031B18(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  return a1;
}

uint64_t sub_100031BBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v14[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v24 = v20[1];
  void *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = a3[8];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  uint64_t v30 = v26[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease(v30);
  uint64_t v31 = a3[9];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 40LL))(v32, v33, v34);
  return a1;
}

uint64_t sub_100031CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031CB4);
}

uint64_t sub_100031CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
    return v9(v10, a2, v8);
  }

  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
    return v9(v10, a2, v8);
  }

  unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  return (v11 + 1);
}

uint64_t sub_100031D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031D6C);
}

uint64_t sub_100031D6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }

    uint64_t v10 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 36);
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_100031E14(uint64_t a1)
{
  uint64_t result = type metadata accessor for SystemMonitorConfig.MonitorType(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = &unk_100035E48;
    v5[2] = &unk_100035E48;
    void v5[3] = &unk_100035E48;
    v5[4] = &unk_100035E48;
    uint64_t result = type metadata accessor for SystemMonitorConfig.DataType(319LL);
    if (v4 <= 0x3F)
    {
      v5[5] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 6LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100031EA8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v4 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(a1, v3, v4);
  uint64_t v5 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v6 = (uint64_t *)(v1 + v5[5]);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(a1, v7, v8);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = (uint64_t *)(v1 + v5[6]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(a1, v10, v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = (uint64_t *)(v1 + v5[7]);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(a1, v13, v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = (uint64_t *)(v1 + v5[8]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(a1, v16, v17);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v19 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  return dispatch thunk of Hashable.hash(into:)(a1, v18, v19);
}

Swift::Int sub_100032008()
{
  uint64_t v1 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v2 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v19, v1, v2);
  uint64_t v3 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v4 = (uint64_t *)(v0 + v3[5]);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v19, v5, v6);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = (uint64_t *)(v0 + v3[6]);
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  swift_bridgeObjectRetain(v9);
  String.hash(into:)(v19, v8, v9);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = (uint64_t *)(v0 + v3[7]);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(v19, v11, v12);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = (uint64_t *)(v0 + v3[8]);
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  swift_bridgeObjectRetain(v15);
  String.hash(into:)(v19, v14, v15);
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v17 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v19, v16, v17);
  return Hasher._finalize()();
}

Swift::Int sub_100032180(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v5 = sub_1000061B8( &qword_100041E30,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v21, v4, v5);
  uint64_t v6 = (uint64_t *)(v2 + a2[5]);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(v21, v7, v8);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = (uint64_t *)(v2 + a2[6]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v21, v10, v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = (uint64_t *)(v2 + a2[7]);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v21, v13, v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = (uint64_t *)(v2 + a2[8]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v21, v16, v17);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  uint64_t v19 = sub_1000061B8( &qword_100041E38,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v21, v18, v19);
  return Hasher._finalize()();
}

uint64_t sub_1000322E8()
{
  return sub_1000061B8(&qword_1000422B0, type metadata accessor for FeatureInfo, (uint64_t)&unk_100035E60);
}

uint64_t sub_100032314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v16 - v10;
  char v13 = sub_10003337C(v9, v12);
  sub_10001E188(a1, (uint64_t)v11, type metadata accessor for FeatureState);
  sub_10001E188(a2, (uint64_t)v8, type metadata accessor for FeatureState);
  if ((v13 & 1) != 0) {
    char v14 = static SimpleType.== infix(_:_:)(&v11[*(int *)(a3 + 20)], &v8[*(int *)(a3 + 20)]);
  }
  else {
    char v14 = 0;
  }
  sub_100033640((uint64_t)v8, type metadata accessor for FeatureState);
  sub_100033640((uint64_t)v11, type metadata accessor for FeatureState);
  return v14 & 1;
}

uint64_t sub_100032410(uint64_t a1, int a2, void *a3)
{
  uint64_t v7 = type metadata accessor for SimpleType(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100005EA4(&qword_100041688);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v15 = (void *)((char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return swift_bridgeObjectRelease(a1);
  }
  LODWORD(v65) = a2;
  v61[1] = v3;
  uint64_t v62 = v16;
  uint64_t v17 = (char *)v15 + *(int *)(v12 + 48);
  v61[0] = (*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = a1 + v61[0];
  uint64_t v67 = *(void *)(v13 + 72);
  uint64_t v64 = a1;
  swift_bridgeObjectRetain(a1);
  sub_100006654(v18, (uint64_t)v15, &qword_100041688);
  uint64_t v19 = v15[1];
  uint64_t v72 = *v15;
  uint64_t v20 = v72;
  uint64_t v73 = v19;
  uint64_t v63 = v8;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v68 = v7;
  uint64_t v69 = v10;
  char v66 = v17;
  v21(v10, v17, v7);
  uint64_t v22 = (void *)*a3;
  unint64_t v24 = sub_10001F324(v20, v19);
  uint64_t v25 = v22[2];
  BOOL v26 = (v23 & 1) == 0;
  uint64_t v27 = v25 + v26;
  if (__OFADD__(v25, v26)) {
    goto LABEL_23;
  }
  char v28 = v23;
  if (v22[3] >= v27)
  {
    if ((v65 & 1) != 0)
    {
      if ((v23 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
      sub_100021704();
      if ((v28 & 1) != 0) {
        goto LABEL_10;
      }
    }

unsigned __int8 *sub_1000328C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  __n128 v4 = swift_bridgeObjectRetain(a2);
  uint64_t v5 = String.init<A>(_:)( &v15,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String,  v4);
  uint64_t v7 = v5;
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000LL) == 0)
  {
    if ((v6 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }

  uint64_t v7 = sub_100032C24(v5, v6);
  unint64_t v12 = v11;
  swift_bridgeObjectRelease(v8);
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000LL) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v9 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v7, v8);
  }

unsigned __int8 *sub_1000329A8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }

          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }

          if (result)
          {
            uint64_t v9 = 0LL;
            for (id i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0LL;
                  }
                  char v12 = -87;
                }

                else
                {
                  char v12 = -55;
                }
              }

              else
              {
                char v12 = -48;
              }

              uint64_t v13 = v9 * a3;
              uint64_t v9 = v13 - (v11 + v12);
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }

          return 0LL;
        }

        return 0LL;
      }

      __break(1u);
      goto LABEL_65;
    }

    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }

      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }

      if (result)
      {
        uint64_t v25 = 0LL;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0LL;
              }
              char v27 = -87;
            }

            else
            {
              char v27 = -55;
            }
          }

          else
          {
            char v27 = -48;
          }

          uint64_t v28 = v25 * a3;
          uint64_t v25 = v28 + (v26 + v27);
          ++result;
          --v3;
        }

        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }

      return 0LL;
    }

    return 0LL;
  }

  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }

  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0LL;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }

  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }

  if (!result) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0LL;
        }
        char v20 = -87;
      }

      else
      {
        char v20 = -55;
      }
    }

    else
    {
      char v20 = -48;
    }

    uint64_t v21 = v9 * a3;
    uint64_t v9 = v21 + (v19 + v20);
    ++v18;
    --v14;
  }

  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100032C24(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v2 = a1;
  }
  uint64_t v3 = 7LL;
  if (((a2 >> 60) & ((a1 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v3 = 11LL;
  }
  unint64_t v4 = String.subscript.getter(15LL, v3 | (v2 << 16), a1, a2);
  unint64_t v6 = v5;
  uint64_t v9 = sub_100032CA0(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_100032CA0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = a3;
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v12 = sub_100032DE4(a1, a2, a3, a4);
    if (v12)
    {
      uint64_t v9 = v12;
      unint64_t v8 = (unint64_t)sub_100029154(v12, 0LL);
      unint64_t v5 = sub_100032ED0((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      uint64_t v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }

    else
    {
      unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
    }

    uint64_t v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(void *)(v8 + 16));
    swift_release(v8);
    return v14;
  }

  else
  {
    unint64_t v8 = a1 >> 16;
    uint64_t v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000LL) == 0)
    {
      if ((a3 & 0x1000000000000000LL) != 0)
      {
        uint64_t v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }

unint64_t sub_100032DE4( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((result & 0xC) == 4LL << v8)
  {
    uint64_t result = sub_1000291B8(result, a3, a4);
    unint64_t v7 = result;
  }

  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_1000291B8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000LL) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }

  else if ((a4 & 0x1000000000000000LL) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }

  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }

  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }

  __break(1u);
  return result;
}

unint64_t sub_100032ED0( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0LL;
    goto LABEL_33;
  }

  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }

  uint64_t v11 = 0LL;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000LL) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4LL << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1000291B8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000LL) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000LL) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter(a6, a7);
        }
        char v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000LL) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }

    uint64_t result = sub_1000291B8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

uint64_t sub_1000330E0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

void *sub_100033168()
{
  uint64_t v0 = type metadata accessor for SystemMonitorConfig(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for FeatureInfo(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = Config.systemMonitorConfigs.getter(v6);
  uint64_t v10 = v9;
  int64_t v11 = *(void *)(v9 + 16);
  if (v11)
  {
    unint64_t v23 = _swiftEmptyArrayStorage;
    sub_100029AB0(0, v11, 0);
    unint64_t v12 = (*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    uint64_t v19 = v10;
    unint64_t v13 = v10 + v12;
    uint64_t v14 = *(void *)(v1 + 72);
    char v20 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v21 = v14;
    uint64_t v22 = v1;
    do
    {
      v20(v3, v13, v0);
      sub_100030990((uint64_t)v3, (uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      uint64_t v15 = v23;
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
      {
        sub_100029AB0(0, v15[2] + 1LL, 1);
        uint64_t v15 = v23;
      }

      unint64_t v17 = v15[2];
      unint64_t v16 = v15[3];
      if (v17 >= v16 >> 1)
      {
        sub_100029AB0(v16 > 1, v17 + 1, 1);
        uint64_t v15 = v23;
      }

      v15[2] = v17 + 1;
      sub_100006698( (uint64_t)v8,  (uint64_t)v15 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
      + *(void *)(v5 + 72) * v17,
        type metadata accessor for FeatureInfo);
      uint64_t v1 = v22;
      v13 += v21;
      --v11;
    }

    while (v11);
    swift_bridgeObjectRelease(v19);
  }

  else
  {
    swift_bridgeObjectRelease(v9);
    return _swiftEmptyArrayStorage;
  }

  return v15;
}

uint64_t sub_10003337C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  uint64_t v5 = sub_1000061B8( &qword_100041E40,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v37, v4, v5);
  dispatch thunk of RawRepresentable.rawValue.getter(&v35, v4, v5);
  uint64_t v6 = v38;
  uint64_t v7 = v36;
  if (v37 == v35 && v38 == v36)
  {
    swift_bridgeObjectRelease_n(v38, 2LL);
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v7);
    char v10 = 0;
    if ((v9 & 1) == 0) {
      return v10 & 1;
    }
  }

  int64_t v11 = (int *)type metadata accessor for FeatureInfo(0LL);
  uint64_t v12 = v11[5];
  uint64_t v13 = *(void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  BOOL v16 = v13 == *v15 && v14 == v15[1];
  if (v16 || (char v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    uint64_t v17 = v11[6];
    uint64_t v18 = *(void *)(a1 + v17);
    uint64_t v19 = *(void *)(a1 + v17 + 8);
    char v20 = (void *)(a2 + v17);
    BOOL v21 = v18 == *v20 && v19 == v20[1];
    if (v21 || (char v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
    {
      if ((uint64_t v22 = v11[7],
            uint64_t v23 = *(void *)(a1 + v22),
            uint64_t v24 = *(void *)(a1 + v22 + 8),
            uint64_t v25 = (void *)(a2 + v22),
            v23 == *v25)
        && v24 == v25[1]
        || (char v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        if ((uint64_t v26 = v11[8],
              uint64_t v27 = *(void *)(a1 + v26),
              uint64_t v28 = *(void *)(a1 + v26 + 8),
              unint64_t v29 = (void *)(a2 + v26),
              v27 == *v29)
          && v28 == v29[1]
          || (char v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
        {
          uint64_t v30 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
          uint64_t v31 = sub_1000061B8( &qword_100041E48,  (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType,  (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
          dispatch thunk of RawRepresentable.rawValue.getter(&v37, v30, v31);
          dispatch thunk of RawRepresentable.rawValue.getter(&v35, v30, v31);
          uint64_t v32 = v38;
          uint64_t v33 = v36;
          if (v37 == v35 && v38 == v36)
          {
            char v10 = 1;
            uint64_t v33 = v38;
          }

          else
          {
            char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
          }

          swift_bridgeObjectRelease(v32);
          swift_bridgeObjectRelease(v33);
        }
      }
    }
  }

  return v10 & 1;
}

_BYTE *sub_1000335D4@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1LL << v3) & 0x100003E01LL;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0LL && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_100033640(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10003367C()
{
  return sub_1000061B8(&qword_100041C40, type metadata accessor for FeatureInfo, (uint64_t)&unk_100035E88);
}

unint64_t sub_1000336B0()
{
  return (*(void *)(*(void *)(type metadata accessor for FeatureInfo(0LL) - 8) + 64LL) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
}

uint64_t sub_1000336E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemMonitorConfig.MonitorType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  uint64_t v3 = (int *)type metadata accessor for FeatureInfo(0LL);
  swift_bridgeObjectRelease(*(void *)(a1 + v3[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v3[8] + 8));
  uint64_t v4 = a1 + v3[9];
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.DataType(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_100033788(uint64_t a1, uint64_t a2)
{
  return type metadata accessor for FeatureInfo(0LL);
}

uint64_t sub_1000337B0(uint64_t a1, uint64_t a2)
{
  return sub_100006698(a1, a2, type metadata accessor for FeatureInfo);
}

ValueMetadata *type metadata accessor for Workers()
{
  return &type metadata for Workers;
}

char *sub_1000337FC()
{
  uint64_t result = sub_100033818();
  qword_100042390 = (uint64_t)result;
  return result;
}

char *sub_100033818()
{
  uint64_t v0 = sub_100005EA4(&qword_100042068);
  uint64_t v1 = swift_allocObject(v0, 176LL, 7LL);
  *(_OWORD *)(v1 + swift_weakDestroy(v0 + 16) = xmmword_100035F40;
  uint64_t v2 = type metadata accessor for CoreAnalyticsWorker(0LL);
  uint64_t v3 = sub_1000061B8( &qword_1000422D8,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreAnalyticsWorker,  (uint64_t)&protocol conformance descriptor for CoreAnalyticsWorker);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = type metadata accessor for RTCWorker(0LL);
  uint64_t v5 = sub_1000061B8( &qword_1000422E0,  (uint64_t (*)(uint64_t))&type metadata accessor for RTCWorker,  (uint64_t)&protocol conformance descriptor for RTCWorker);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + swift_weakDestroy(v0 + 56) = v5;
  uint64_t v6 = type metadata accessor for TailspinWorker(0LL);
  uint64_t v7 = sub_1000061B8( &qword_1000422E8,  (uint64_t (*)(uint64_t))&type metadata accessor for TailspinWorker,  (uint64_t)&protocol conformance descriptor for TailspinWorker);
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 72) = v7;
  uint64_t v8 = type metadata accessor for SummaryDecoratorWorker(0LL);
  uint64_t v9 = sub_1000061B8( &qword_1000422F0,  (uint64_t (*)(uint64_t))&type metadata accessor for SummaryDecoratorWorker,  (uint64_t)&protocol conformance descriptor for SummaryDecoratorWorker);
  *(void *)(v1 + 80) = v8;
  *(void *)(v1 + 88) = v9;
  uint64_t v10 = type metadata accessor for SessionSummaryWorker(0LL);
  uint64_t v11 = sub_1000061B8( &qword_1000422F8,  (uint64_t (*)(uint64_t))&type metadata accessor for SessionSummaryWorker,  (uint64_t)&protocol conformance descriptor for SessionSummaryWorker);
  *(void *)(v1 + 96) = v10;
  *(void *)(v1 + 104) = v11;
  uint64_t v12 = type metadata accessor for DurationSummaryWorker(0LL);
  uint64_t v13 = sub_1000061B8( &qword_100042300,  (uint64_t (*)(uint64_t))&type metadata accessor for DurationSummaryWorker,  (uint64_t)&protocol conformance descriptor for DurationSummaryWorker);
  *(void *)(v1 + 112) = v12;
  *(void *)(v1 + 120) = v13;
  uint64_t v14 = type metadata accessor for DriverSnapshotWorker(0LL);
  uint64_t v15 = sub_1000061B8( &qword_100042308,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverSnapshotWorker,  (uint64_t)&protocol conformance descriptor for DriverSnapshotWorker);
  *(void *)(v1 + 128) = v14;
  *(void *)(v1 + 136) = v15;
  uint64_t v16 = type metadata accessor for PowerLogWorker(0LL);
  uint64_t v17 = sub_1000061B8( &qword_100042310,  (uint64_t (*)(uint64_t))&type metadata accessor for PowerLogWorker,  (uint64_t)&protocol conformance descriptor for PowerLogWorker);
  *(void *)(v1 + 144) = v16;
  *(void *)(v1 + 152) = v17;
  uint64_t v18 = type metadata accessor for AirPodWorker(0LL);
  uint64_t v19 = sub_1000061B8( &qword_100042318,  (uint64_t (*)(uint64_t))&type metadata accessor for AirPodWorker,  (uint64_t)&protocol conformance descriptor for AirPodWorker);
  *(void *)(v1 + 160) = v18;
  *(void *)(v1 + 168) = v19;
  uint64_t v64 = v1;
  if (&protocol conformance descriptor for JsonFileWorker) {
    BOOL v20 = &type metadata accessor for JsonFileWorker == 0LL;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20
    && &type metadata for JsonFileWorker != 0LL
    && &nominal type descriptor for JsonFileWorker != 0LL
    && &metaclass for JsonFileWorker != 0LL)
  {
    uint64_t v24 = type metadata accessor for JsonFileWorker(0LL);
    uint64_t v25 = sub_1000061B8( &qword_100042330,  (uint64_t (*)(uint64_t))&type metadata accessor for JsonFileWorker,  (uint64_t)&protocol conformance descriptor for JsonFileWorker);
    sub_100022128(0LL, 0LL, v24, v25);
    id v26 = [(id)objc_opt_self(NSProcessInfo) processInfo];
    id v27 = [v26 environment];

    uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v27,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
    uint64_t v29 = static Constants.loadTestWorkerEnv.getter();
    uint64_t v31 = v30;
    if (*(void *)(v28 + 16) && (unint64_t v32 = sub_10001F324(v29, v30), (v33 & 1) != 0))
    {
      uint64_t v34 = *(void *)(*(void *)(v28 + 56) + 16 * v32 + 8);
      swift_bridgeObjectRetain(v34);
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v28);
      NSString v35 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v34);
      unsigned __int8 v36 = [v35 BOOLValue];

      if ((v36 & 1) != 0)
      {
        uint64_t v37 = (char *)v64;
        if ((swift_isUniquelyReferenced_nonNull_native(v64) & 1) == 0) {
          uint64_t v37 = sub_100028720(0LL, *(void *)(v64 + 16) + 1LL, 1, (char *)v64);
        }
        unint64_t v39 = *((void *)v37 + 2);
        unint64_t v38 = *((void *)v37 + 3);
        if (v39 >= v38 >> 1) {
          uint64_t v37 = sub_100028720((char *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = type metadata accessor for TestWorker(0LL);
        uint64_t v41 = sub_1000061B8( &qword_100042338,  (uint64_t (*)(uint64_t))&type metadata accessor for TestWorker,  (uint64_t)&protocol conformance descriptor for TestWorker);
        *((void *)v37 + 2) = v39 + 1;
        uint64_t v42 = &v37[16 * v39];
        *((void *)v42 + 4) = v40;
        *((void *)v42 + 5) = v41;
        uint64_t v64 = (uint64_t)v37;
      }
    }

    else
    {
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v28);
    }
  }

  uint64_t v43 = (char *)v64;
  if (&protocol conformance descriptor for ABCWorker) {
    BOOL v44 = &type metadata accessor for ABCWorker == 0LL;
  }
  else {
    BOOL v44 = 1;
  }
  if (!v44
    && &type metadata for ABCWorker != 0LL
    && &nominal type descriptor for ABCWorker != 0LL
    && &metaclass for ABCWorker != 0LL)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v64) & 1) == 0) {
      uint64_t v43 = sub_100028720(0LL, *(void *)(v64 + 16) + 1LL, 1, (char *)v64);
    }
    unint64_t v49 = *((void *)v43 + 2);
    unint64_t v48 = *((void *)v43 + 3);
    if (v49 >= v48 >> 1) {
      uint64_t v43 = sub_100028720((char *)(v48 > 1), v49 + 1, 1, v43);
    }
    uint64_t v50 = type metadata accessor for ABCWorker(0LL);
    uint64_t v51 = sub_1000061B8( &qword_100042328,  (uint64_t (*)(uint64_t))&type metadata accessor for ABCWorker,  (uint64_t)&protocol conformance descriptor for ABCWorker);
    *((void *)v43 + 2) = v49 + 1;
    uint64_t v52 = &v43[16 * v49];
    *((void *)v52 + 4) = v50;
    *((void *)v52 + 5) = v51;
  }

  if (&protocol conformance descriptor for AudioCaptureLogsWorker) {
    BOOL v53 = &protocol conformance descriptor for AudioCaptureLogsWorker == 0LL;
  }
  else {
    BOOL v53 = 1;
  }
  if (!v53
    && &type metadata accessor for AudioCaptureLogsWorker != 0LL
    && &type metadata for AudioCaptureLogsWorker != 0LL
    && &nominal type descriptor for AudioCaptureLogsWorker != 0LL
    && &metaclass for AudioCaptureLogsWorker != 0LL)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v43) & 1) == 0) {
      uint64_t v43 = sub_100028720(0LL, *((void *)v43 + 2) + 1LL, 1, v43);
    }
    unint64_t v59 = *((void *)v43 + 2);
    unint64_t v58 = *((void *)v43 + 3);
    if (v59 >= v58 >> 1) {
      uint64_t v43 = sub_100028720((char *)(v58 > 1), v59 + 1, 1, v43);
    }
    uint64_t v60 = type metadata accessor for AudioCaptureLogsWorker(0LL);
    uint64_t v61 = sub_1000061B8( &qword_100042320,  (uint64_t (*)(uint64_t))&type metadata accessor for AudioCaptureLogsWorker,  (uint64_t)&protocol conformance descriptor for AudioCaptureLogsWorker);
    *((void *)v43 + 2) = v59 + 1;
    uint64_t v62 = &v43[16 * v59];
    *((void *)v62 + 4) = v60;
    *((void *)v62 + 5) = v61;
  }

  return v43;
}

void sub_100033DB0()
{
  if (qword_100041630 != -1) {
    swift_once(&qword_100041630, sub_1000337FC);
  }
  uint64_t v0 = qword_100042390;
  uint64_t v1 = *(void *)(qword_100042390 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain(qword_100042390);
    for (uint64_t i = 0LL; i != v1; ++i)
    {
      __int128 v7 = *(_OWORD *)(v0 + 16 * i + 32);
      uint64_t v5 = *(void *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2(v5, &protocol descriptor for StartOnFirstMessage)) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0LL;
      }
      if (v6)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
          sub_100029B20(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
        }
        unint64_t v4 = _swiftEmptyArrayStorage[2];
        unint64_t v3 = _swiftEmptyArrayStorage[3];
        if (v4 >= v3 >> 1) {
          sub_100029B20(v3 > 1, v4 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v4 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v4 + 4] = v7;
      }
    }

    swift_bridgeObjectRelease(v0);
  }

  qword_100042398 = (uint64_t)_swiftEmptyArrayStorage;
}

void sub_100033F00()
{
  if (qword_100041630 != -1) {
    swift_once(&qword_100041630, sub_1000337FC);
  }
  uint64_t v0 = qword_100042390;
  uint64_t v1 = *(void *)(qword_100042390 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain(qword_100042390);
    for (uint64_t i = 0LL; i != v1; ++i)
    {
      __int128 v8 = *(_OWORD *)(v0 + 16 * i + 32);
      uint64_t v6 = *(void *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2(v6, &protocol descriptor for StartOnFirstMessage)) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0LL;
      }
      if (!v7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
          sub_100029B20(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
        }
        __int128 v3 = v8;
        unint64_t v5 = _swiftEmptyArrayStorage[2];
        unint64_t v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1)
        {
          sub_100029B20(v4 > 1, v5 + 1, 1);
          __int128 v3 = v8;
        }

        _swiftEmptyArrayStorage[2] = v5 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v5 + 4] = v3;
      }
    }

    swift_bridgeObjectRelease(v0);
  }

  qword_1000423A0 = (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_100034154(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

void sub_100034278(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v2 = (void *)qword_100042CB0;
  qword_100042CB0 = (uint64_t)v1;
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExecutionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutionBlock:");
}