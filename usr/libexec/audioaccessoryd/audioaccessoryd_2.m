uint64_t sub_10016600C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for SoundProfileRecord(0LL);
  v7 = *(void *)(*(void *)(result - 8) + 72LL);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000LL && v7 == -1) {
    goto LABEL_14;
  }
  v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
    __break(1u);
    return result;
  }

  if (v3 < v4 || v3 >= v4 + v10 * v7) {
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  }
  if (v3 != v4) {
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  }
  return result;
}

char *sub_100166118(void **a1, const void **a2, void *a3)
{
  v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    char v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7]) {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }

  return result;
}

char *sub_1001661C0(uint64_t a1)
{
  return sub_100165F14(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_1001661D4( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100166254(v6, a2, a3);
  return sub_100166228;
}

void sub_100166228(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_100166254(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)v3 = v4;
    return sub_1001662C0;
  }

  __break(1u);
  return result;
}

void sub_1001662C0(id *a1)
{
}

uint64_t sub_1001662C8(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_1000A4318( (unint64_t *)&unk_100236EA0,  &qword_1002365A0,  (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_100098CD8(&qword_1002365A0);
          v13 = sub_1001661D4(v18, i, a3);
          id v15 = *v14;
          ((void (*)(void (**)(id *), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

uint64_t sub_1001664E4(void *a1)
{
  return sub_100161388(0, a1[2], 0, a1, (uint64_t *)&unk_100236F20, type metadata accessor for SoundProfileRecord);
}

uint64_t sub_100166518(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16),  0LL,  a1);
}

void *sub_10016652C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(void *)(a4 + 48) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }

    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

uint64_t sub_100166724(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  *(_BYTE *)(v5 + 16) = 0;
  *(void *)(v5 + 32) = 0LL;
  uint64_t v9 = swift_unknownObjectWeakInit(v5 + 24, 0LL);
  *(void *)(v5 + 40) = 0LL;
  *(void *)(v5 + 48) = 0LL;
  *(void *)(v5 + 56) = 1LL;
  *(_BYTE *)(v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_networkUp) = 1;
  *(void *)(v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore____lazy_storage___fileManager) = 0LL;
  *(void *)(v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_retryTimer) = 0LL;
  uint64_t v10 = (void *)(v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore____lazy_storage___cloudCoordinator);
  *uint64_t v10 = 0LL;
  v10[1] = 0LL;
  uint64_t v11 = static os_log_type_t.default.getter(v9);
  if (qword_100234C18 != -1) {
    swift_once(&qword_100234C18, sub_10018A920);
  }
  uint64_t v12 = qword_10023DFB8;
  uint64_t v13 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_1001A5EA0;
  uint64_t v15 = URL.absoluteString.getter();
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_10009914C();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "DeviceStore init with directory: %@", 35LL, 2LL, v14);
  swift_bridgeObjectRelease(v14);
  *(void *)(v5 + 32) = a2;
  swift_unknownObjectWeakAssign(v5 + 24, a1);
  uint64_t v18 = v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_directoryURL;
  uint64_t v19 = type metadata accessor for URL(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, a3, v19);
  *(void *)(v5 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue) = a4;
  id v21 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter);
  id v22 = a4;
  id v23 = [v21 defaultCenter];
  aBlock[4] = sub_1001898EC;
  uint64_t v30 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10013D2A4;
  aBlock[3] = &unk_1002106D8;
  v24 = _Block_copy(aBlock);
  uint64_t v25 = v30;
  swift_retain(v5);
  swift_release(v25);
  id v26 =  [v23 addObserverForName:@"com.apple.bluetooth.services.BTNetworkMonitor.networkChanged" object:0 queue:0 usingBlock:v24];
  _Block_release(v24);
  swift_unknownObjectRelease(v26);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a3, v19);
  return v5;
}

char *sub_1001669B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v8; uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    BOOL v10 = a4 == 0x6563697665444141LL && a5 == 0xEE0064726F636552LL;
    uint64_t v11 = 4LL;
    while (1)
    {
      uint64_t v12 = (a1 & 0xC000000000000001LL) != 0
      uint64_t v13 = v12;
      uint64_t v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1LL)) {
        break;
      }
      uint64_t v15 = *(void *)&v12[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
      uint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
      BOOL v17 = v15 == a2 && v16 == a3;
      if ((v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, a2, a3, 0LL) & 1) != 0)
        && (v10
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6563697665444141LL, 0xEE0064726F636552LL, a4, a5, 0LL) & 1) != 0))
      {
        swift_bridgeObjectRelease(a1);
        return v13;
      }

      ++v11;
      if (v14 == v8) {
        goto LABEL_29;
      }
    }

    __break(1u);
LABEL_25:
    if (a1 < 0) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

char *sub_100166B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v8; uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    BOOL v10 = a4 == 0xD000000000000011LL && a5 == 0x80000001001D2A80LL;
    BOOL v20 = v10;
    uint64_t v11 = 4LL;
    while (1)
    {
      uint64_t v12 = (a1 & 0xC000000000000001LL) != 0
      uint64_t v13 = v12;
      uint64_t v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1LL)) {
        break;
      }
      uint64_t v15 = *(void *)&v12[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
      uint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
      BOOL v17 = v15 == a2 && v16 == a3;
      if ((v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, a2, a3, 0LL) & 1) != 0)
        && (v20
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x80000001001D2A80LL, a4, a5, 0LL) & 1) != 0))
      {
        swift_bridgeObjectRelease(a1);
        return v13;
      }

      ++v11;
      if (v14 == v8) {
        goto LABEL_29;
      }
    }

    __break(1u);
LABEL_25:
    if (a1 < 0) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

char *sub_100166D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v8; uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    BOOL v10 = a4 == 0xD000000000000013LL && a5 == 0x80000001001CB4E0LL;
    BOOL v20 = v10;
    uint64_t v11 = 4LL;
    while (1)
    {
      uint64_t v12 = (a1 & 0xC000000000000001LL) != 0
      uint64_t v13 = v12;
      uint64_t v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1LL)) {
        break;
      }
      uint64_t v15 = *(void *)&v12[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
      uint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
      BOOL v17 = v15 == a2 && v16 == a3;
      if ((v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, a2, a3, 0LL) & 1) != 0)
        && (v20
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x80000001001CB4E0LL, a4, a5, 0LL) & 1) != 0))
      {
        swift_bridgeObjectRelease(a1);
        return v13;
      }

      ++v11;
      if (v14 == v8) {
        goto LABEL_29;
      }
    }

    __break(1u);
LABEL_25:
    if (a1 < 0) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

uint64_t sub_100166EC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for DeviceRecord,  (unint64_t *)&unk_100235860,  (uint64_t)&unk_1001A69AC,  (uint64_t *)&unk_100236E20,  a1);
}

uint64_t sub_100166EFC@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for MagicPairingSettingsRecord,  &qword_1002359D8,  (uint64_t)&unk_1001A7E74,  (uint64_t *)&unk_100236E30,  a1);
}

uint64_t sub_100166F34@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for DeviceSupportInformationRecord,  &qword_100235838,  (uint64_t)&unk_1001A8A8C,  &qword_100236E40,  a1);
}

uint64_t sub_100166F6C@<X0>(uint64_t *a1@<X8>)
{
  return sub_100187178( type metadata accessor for AADeviceRecord,  &qword_100236E50,  (uint64_t)&protocol conformance descriptor for AADeviceRecord,  &qword_100236E58,  a1);
}

void *sub_100166FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v28 = a2;
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v7)
  {
    id v23 = a5;
    uint64_t v8 = 4LL;
    while (1)
    {
      id v10 = (a1 & 0xC000000000000001LL) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a1)
          : *(id *)(a1 + 8 * v8);
      a5 = v10;
      uint64_t v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1LL)) {
        break;
      }
      id v12 = [v10 encryptedValues];
      uint64_t ObjectType = swift_getObjectType();
      CKRecordKeyValueSetting.subscript.getter( &v26,  0xD000000000000010LL,  0x80000001001CAB00LL,  ObjectType,  &type metadata for String,  &protocol witness table for String);
      swift_unknownObjectRelease(v12);
      uint64_t v14 = v27;
      if (v27)
      {
        if (v26 == v28 && v27 == a3)
        {
          uint64_t v15 = swift_bridgeObjectRelease(v27);
        }

        else
        {
          char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v27, v28, a3, 0LL);
          uint64_t v15 = swift_bridgeObjectRelease(v14);
          if ((v16 & 1) == 0) {
            goto LABEL_5;
          }
        }

        uint64_t v17 = CKRecord.recordType.getter(v15);
        uint64_t v19 = v18;
        uint64_t v20 = (uint64_t)v23;
        if (v17 == a4 && v18 == v23)
        {
          swift_bridgeObjectRelease(a1);
LABEL_20:
          swift_bridgeObjectRelease(v20);
          return a5;
        }

        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, a4, v23, 0LL);
        swift_bridgeObjectRelease(v19);
        if ((v9 & 1) != 0)
        {
          uint64_t v20 = a1;
          goto LABEL_20;
        }
      }

uint64_t sub_1001671C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100167254( a1,  a2,  a3,  a4,  a5,  (unint64_t)sub_10018A7FC,  (uint64_t)sub_10018A84C,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000B3F2C,  (uint64_t)&unk_100212128,  (uint64_t)sub_10018A86C);
}

uint64_t sub_10016720C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100167254( a1,  a2,  a3,  a4,  a5,  (unint64_t)sub_10018A7FC,  (uint64_t)sub_10018A84C,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000B49A8,  (uint64_t)&unk_1002120B0,  (uint64_t)sub_10018A2AC);
}

uint64_t sub_100167254( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10)
{
  v148 = a8;
  uint64_t v146 = a7;
  unint64_t v155 = a6;
  uint64_t v156 = a3;
  uint64_t v157 = a4;
  uint64_t v158 = a5;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v12);
  v142 = (char *)&v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v138 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  v150 = (char *)&v138 - v19;
  __chkstk_darwin(v20);
  id v22 = (char *)&v138 - v21;
  uint64_t v151 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v151);
  v152 = (uint64_t *)((char *)&v138 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v153 = *(void *)(v24 - 8);
  uint64_t v154 = v24;
  __chkstk_darwin(v24);
  uint64_t v140 = (uint64_t)&v138 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v26);
  uint64_t v139 = (uint64_t)&v138 - v27;
  __chkstk_darwin(v28);
  v141 = (uint64_t *)((char *)&v138 - v29);
  __chkstk_darwin(v30);
  uint64_t v143 = (uint64_t)&v138 - v31;
  __chkstk_darwin(v32);
  uint64_t v144 = a2;
  v145 = (uint64_t *)((char *)&v138 - v33);
  uint64_t v34 = sub_10013A76C();
  v147 = a1;
  id v35 = [a1 bluetoothAddress];
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
  uint64_t v38 = v37;

  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v39 = sub_100098D58(v14, (uint64_t)qword_10023DCC0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v22, v39, v14);
  v40 = objc_autoreleasePoolPush();
  uint64_t v42 = URL.path.getter(v41);
  v149 = v22;
  uint64_t v44 = v43;
  URL.appendingPathComponent(_:)(v42);
  swift_bridgeObjectRelease(v44);
  v45 = v150;
  URL.appendingPathComponent(_:)(v36);
  v46 = *(void (**)(char *, uint64_t))(v15 + 8);
  v46(v17, v14);
  objc_autoreleasePoolPop(v40);
  v47 = objc_autoreleasePoolPush();
  __chkstk_darwin(v47);
  *(&v138 - 2) = (uint64_t)v45;
  *(&v138 - 1) = v34;
  v48 = v152;
  OS_dispatch_queue.sync<A>(execute:)(v152, v155, &v138 - 4, v151);
  objc_autoreleasePoolPop(v47);
  v46(v45, v14);
  swift_release(v34);
  swift_bridgeObjectRelease(v38);
  v46(v149, v14);
  BOOL v49 = (*(unsigned int (**)(void *, uint64_t, uint64_t))(v153 + 48))(v48, 1LL, v154) == 1;
  unint64_t v155 = 0LL;
  if (v49)
  {
    uint64_t v50 = sub_100099358((uint64_t)v48, &qword_100235848);
    uint64_t v51 = static os_log_type_t.default.getter(v50);
    v52 = v147;
    v53 = v148;
    uint64_t v54 = v144;
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v55 = qword_10023DFC8;
    uint64_t v56 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v57 = swift_allocObject(v56, 72LL, 7LL);
    *(_OWORD *)(v57 + 16) = xmmword_1001A5EA0;
    id v58 = v52;
    id v59 = [v58 description];
    uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
    uint64_t v62 = v61;

    *(void *)(v57 + 56) = &type metadata for String;
    *(void *)(v57 + 64) = sub_10009914C();
    *(void *)(v57 + 32) = v60;
    *(void *)(v57 + 40) = v62;
    os_log(_:dso:log:_:_:)(v51, &_mh_execute_header, v55, "Add device record: %@", 21LL, 2LL, v57);
    swift_bridgeObjectRelease(v57);
    id v63 = v58;
    uint64_t v64 = (uint64_t)v142;
    UUID.init()(v63);
    v65 = v145;
    sub_1000953D8(v64, 0LL, 0xC000000000000000LL, v63, v145);
  }

  else
  {
    uint64_t v66 = v143;
    sub_1000C998C((uint64_t)v48, v143, type metadata accessor for DeviceRecord);
    v67 = v147;
    char v68 = sub_100097458(v147);
    v69 = v141;
    sub_1000A7C90(v66, (uint64_t)v141, type metadata accessor for DeviceRecord);
    if ((v68 & 1) == 0)
    {
      v70 = objc_autoreleasePoolPush();
      uint64_t v71 = *v69;
      unint64_t v72 = v69[1];
      sub_1000991CC(*v69, v72);
      sub_100118B60(v71, v72);
      Class isa = v73;
      sub_100099394(v71, v72);
      uint64_t v75 = v139;
      sub_1000A7C90((uint64_t)v69, v139, type metadata accessor for DeviceRecord);
      if (!isa) {
        Class isa = sub_1000A35AC().super.isa;
      }
      sub_1000A7CD4(v75, type metadata accessor for DeviceRecord);
      v159[0] = isa;
      sub_100096A48(v159);
      objc_autoreleasePoolPop(v70);
      id v76 = -[objc_class recordChangeTag](isa, "recordChangeTag");

      if (v76)
      {

        uint64_t v77 = sub_1000A7CD4((uint64_t)v69, type metadata accessor for DeviceRecord);
        uint64_t v78 = static os_log_type_t.default.getter(v77);
        if (qword_100234C28 != -1) {
          swift_once(&qword_100234C28, sub_10018A9E0);
        }
        uint64_t v79 = qword_10023DFC8;
        uint64_t v80 = sub_100098CD8((uint64_t *)&unk_100234E00);
        uint64_t v81 = swift_allocObject(v80, 112LL, 7LL);
        *(_OWORD *)(v81 + 16) = xmmword_1001A6F30;
        uint64_t v82 = sub_100094CA4();
        uint64_t v84 = v83;
        *(void *)(v81 + 56) = &type metadata for String;
        unint64_t v85 = sub_10009914C();
        *(void *)(v81 + 64) = v85;
        *(void *)(v81 + 32) = v82;
        *(void *)(v81 + 40) = v84;
        id v86 = v67;
        id v87 = [v86 description];
        uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(v87);
        uint64_t v90 = v89;

        *(void *)(v81 + 96) = &type metadata for String;
        *(void *)(v81 + 104) = v85;
        *(void *)(v81 + 72) = v88;
        *(void *)(v81 + 80) = v90;
        os_log(_:dso:log:_:_:)(v78, &_mh_execute_header, v79, "No change from cached %@ [to] %@", 32LL, 2LL, v81);
        swift_bridgeObjectRelease(v81);
        v148(0LL, v156, v157, v158);
        v65 = (uint64_t *)v66;
        return sub_1000A7CD4((uint64_t)v65, type metadata accessor for DeviceRecord);
      }
    }

    uint64_t v91 = sub_1000A7CD4((uint64_t)v69, type metadata accessor for DeviceRecord);
    uint64_t v92 = static os_log_type_t.default.getter(v91);
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v93 = qword_10023DFC8;
    uint64_t v94 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v95 = swift_allocObject(v94, 112LL, 7LL);
    *(_OWORD *)(v95 + 16) = xmmword_1001A6F30;
    uint64_t v96 = sub_100094CA4();
    uint64_t v98 = v97;
    *(void *)(v95 + 56) = &type metadata for String;
    unint64_t v99 = sub_10009914C();
    *(void *)(v95 + 64) = v99;
    *(void *)(v95 + 32) = v96;
    *(void *)(v95 + 40) = v98;
    id v100 = v67;
    id v101 = [v100 description];
    uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)(v101);
    uint64_t v104 = v103;

    *(void *)(v95 + 96) = &type metadata for String;
    *(void *)(v95 + 104) = v99;
    *(void *)(v95 + 72) = v102;
    *(void *)(v95 + 80) = v104;
    os_log(_:dso:log:_:_:)(v92, &_mh_execute_header, v93, "Updating cached device record: %@ with %@", 41LL, 2LL, v95);
    swift_bridgeObjectRelease(v95);
    v65 = v145;
    sub_1000A7C90(v66, (uint64_t)v145, type metadata accessor for DeviceRecord);
    sub_100097028(v100);
    sub_1000A7CD4(v66, type metadata accessor for DeviceRecord);
    v53 = v148;
    uint64_t v54 = v144;
  }

  uint64_t v105 = sub_10013A76C();
  __chkstk_darwin(v105);
  *(&v138 - 2) = v106;
  *(&v138 - 1) = (uint64_t)v65;
  unint64_t v107 = v155;
  OS_dispatch_queue.sync<A>(execute:)(&type metadata for (), v146, &v138 - 4, &type metadata for () + 1);
  if (v107)
  {
    uint64_t v108 = swift_release(v105);
    uint64_t v109 = static os_log_type_t.error.getter(v108);
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v110 = qword_10023DFC8;
    uint64_t v111 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v112 = swift_allocObject(v111, 72LL, 7LL);
    *(_OWORD *)(v112 + 16) = xmmword_1001A5EA0;
    v159[0] = (id)v107;
    swift_errorRetain(v107);
    uint64_t v113 = sub_100098CD8(&qword_1002357C0);
    uint64_t v114 = String.init<A>(describing:)(v159, v113);
    uint64_t v116 = v115;
    *(void *)(v112 + 56) = &type metadata for String;
    *(void *)(v112 + 64) = sub_10009914C();
    *(void *)(v112 + 32) = v114;
    *(void *)(v112 + 40) = v116;
    os_log(_:dso:log:_:_:)( v109,  &_mh_execute_header,  v110,  "Unable to enocde device record with error: %@",  45LL,  2LL,  v112);
    swift_bridgeObjectRelease(v112);
    unint64_t v117 = sub_1000DB8A4();
    uint64_t v118 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v117, 0LL, 0LL);
    unint64_t *v119 = v107 | 0x4000000000000000LL;
    swift_errorRetain(v107);
    v53(v118, v156, v157, v158);
    swift_errorRelease(v118);
    swift_errorRelease(v107);
  }

  else
  {
    swift_release(v105);
    uint64_t v120 = ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t))v53)(0LL, v156, v157, v158);
    uint64_t v121 = static os_log_type_t.default.getter(v120);
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v122 = qword_10023DFC8;
    uint64_t v123 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v124 = swift_allocObject(v123, 72LL, 7LL);
    *(_OWORD *)(v124 + 16) = xmmword_1001A5EA0;
    uint64_t v125 = sub_100094CA4();
    uint64_t v127 = v126;
    *(void *)(v124 + 56) = &type metadata for String;
    *(void *)(v124 + 64) = sub_10009914C();
    *(void *)(v124 + 32) = v125;
    *(void *)(v124 + 40) = v127;
    os_log(_:dso:log:_:_:)(v121, &_mh_execute_header, v122, "Syncing DeviceRecord - %@", 25LL, 2LL, v124);
    swift_bridgeObjectRelease(v124);
    v128 = objc_autoreleasePoolPush();
    uint64_t v129 = *v65;
    unint64_t v130 = v65[1];
    sub_1000991CC(*v65, v130);
    sub_100118B60(v129, v130);
    Class v132 = v131;
    sub_100099394(v129, v130);
    uint64_t v133 = v140;
    sub_1000A7C90((uint64_t)v65, v140, type metadata accessor for DeviceRecord);
    if (!v132) {
      Class v132 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v133, type metadata accessor for DeviceRecord);
    v159[0] = v132;
    sub_100096A48(v159);
    objc_autoreleasePoolPop(v128);
    uint64_t v134 = sub_10013B740();
    uint64_t v135 = swift_allocObject(a9, 32LL, 7LL);
    *(void *)(v135 + 16) = v54;
    *(void *)(v135 + 24) = v132;
    swift_retain(v54);
    v136 = v132;
    sub_1001051E0(v136, 1, a10, v135);

    swift_unknownObjectRelease(v134);
    swift_release(v135);
  }

  return sub_1000A7CD4((uint64_t)v65, type metadata accessor for DeviceRecord);
}

void sub_100167DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a4;
  uint64_t v150 = a5;
  uint64_t v148 = a3;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  Class v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  unint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  uint64_t v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000B5BC0(0LL, v148, v149, v150);
  }

  else
  {
    id v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    unint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    unint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    uint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    uint64_t v94 = (void *)(v70 + v93[7]);
    *uint64_t v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    uint64_t v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100212060, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100212088, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000B5BC0(0LL, v148, v149, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_1001689AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a4;
  uint64_t v150 = a5;
  uint64_t v148 = a3;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  Class v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  unint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  uint64_t v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000B5BDC(0LL, v148, v149, v150);
  }

  else
  {
    id v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    unint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    unint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    uint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    uint64_t v94 = (void *)(v70 + v93[7]);
    *uint64_t v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    uint64_t v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100212010, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100212038, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000B5BDC(0LL, v148, v149, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_100169594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  Class v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  unint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  uint64_t v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000B63B4(0LL, v149, v148, v150);
  }

  else
  {
    id v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    unint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    unint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    uint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    uint64_t v94 = (void *)(v70 + v93[7]);
    *uint64_t v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    uint64_t v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100211C50, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100211C78, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000B63B4(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_10016A184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_100211CA0, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  uint64_t v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  uint64_t v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_100211CC8, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_100189C94;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    aBlock[3] = (Class)&unk_100211CE0;
    id v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  unint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100211D18, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100211D40, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000B63B4(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_10016AE4C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000B63B4(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_100211D68, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_100211D90, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000B63B4(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_10016BAC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100211DB8, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000B63B4(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_100211DE0, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A584;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100211DF8;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100211E30, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_100211E58, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000B63B4(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_10016C650(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_100211E80, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000B63B4(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_100211EA8, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A584;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_100211EC0;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100211EF8, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100211F20, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000B63B4(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_10016D1C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100211F48, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_100211F70, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A584;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_100211F88;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_100211FC0, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100211FE8, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000B63B4(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_10016DCB8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_100169594,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000B63B4,  sub_10018A7E8,  sub_10016A184,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10016AE4C,  sub_10016BAC8,  sub_10016C650,  sub_10016D1C8);
}

void sub_10016DD38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __int128 v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  uint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  Class v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  uint64_t v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000B63D0(0LL, v149, v148, v150);
  }

  else
  {
    uint64_t v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    uint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    uint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    unint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    id v94 = (void *)(v70 + v93[7]);
    *id v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    id v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100211890, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_1002118B8, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000B63D0(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_10016E928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_1002118E0, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  uint64_t v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  Class v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  uint64_t v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  uint64_t v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_100211908, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_100189C38;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    void aBlock[3] = (Class)&unk_100211920;
    uint64_t v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  uint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100211958, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100211980, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000B63D0(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_10016F5F0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  uint64_t v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000B63D0(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_1002119A8, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_1002119D0, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000B63D0(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_10017026C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_1002119F8, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000B63D0(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_100211A20, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A580;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100211A38;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100211A70, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_100211A98, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000B63D0(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_100170DF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_100211AC0, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000B63D0(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_100211AE8, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A580;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_100211B00;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100211B38, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100211B60, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000B63D0(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_10017196C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100211B88, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_100211BB0, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A580;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_100211BC8;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_100211C00, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100211C28, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000B63D0(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_10017245C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_10016DD38,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000B63D0,  sub_10018A7E8,  sub_10016E928,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10016F5F0,  sub_10017026C,  sub_100170DF4,  sub_10017196C);
}

uint64_t sub_1001724DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017256C( a1,  a2,  a3,  a4,  a5,  (uint64_t)sub_10018A7E8,  (uint64_t)sub_10018A838,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BA130,  (uint64_t)&unk_1002117C8,  (uint64_t)sub_10018A868);
}

uint64_t sub_100172524(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017256C( a1,  a2,  a3,  a4,  a5,  (uint64_t)sub_10018A7E8,  (uint64_t)sub_10018A838,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BA114,  (uint64_t)&unk_1002117A0,  (uint64_t)sub_10018A868);
}

uint64_t sub_10017256C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10)
{
  uint64_t v120 = a8;
  uint64_t v121 = a5;
  uint64_t v106 = a7;
  uint64_t v116 = a6;
  uint64_t v118 = a3;
  uint64_t v119 = a4;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v12);
  uint64_t v104 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v103 - v19;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v103 - v22;
  uint64_t v112 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v112);
  unint64_t v115 = (uint64_t *)((char *)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v25 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v113 = *(void *)(v25 - 8);
  uint64_t v114 = v25;
  __chkstk_darwin(v25);
  uint64_t v103 = (uint64_t)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v27);
  uint64_t v105 = (uint64_t)&v103 - v28;
  __chkstk_darwin(v29);
  uint64_t v107 = a2;
  uint64_t v108 = (uint64_t)&v103 - v30;
  uint64_t v31 = sub_10013A76C();
  uint64_t v117 = a1;
  id v32 = [a1 bluetoothAddress];
  uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  uint64_t v34 = v33;

  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v35 = sub_100098D58(v14, (uint64_t)qword_10023DF00);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v23, v35, v14);
  uint64_t v36 = objc_autoreleasePoolPush();
  uint64_t v111 = v23;
  uint64_t v37 = v36;
  uint64_t v39 = URL.path.getter(v38);
  uint64_t v41 = v40;
  URL.appendingPathComponent(_:)(v39);
  swift_bridgeObjectRelease(v41);
  uint64_t v109 = v34;
  URL.appendingPathComponent(_:)(v110);
  unint64_t v42 = *(void (**)(char *, uint64_t))(v15 + 8);
  v42(v17, v14);
  objc_autoreleasePoolPop(v37);
  uint64_t v43 = objc_autoreleasePoolPush();
  __chkstk_darwin(v43);
  *(&v103 - 2) = (uint64_t)v20;
  *(&v103 - 1) = v31;
  uint64_t v44 = v115;
  OS_dispatch_queue.sync<A>(execute:)(v115, v116, &v103 - 4, v112);
  objc_autoreleasePoolPop(v43);
  v42(v20, v14);
  swift_release(v31);
  swift_bridgeObjectRelease(v109);
  v42(v111, v14);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v113 + 48))(v44, 1LL, v114) == 1)
  {
    uint64_t v45 = sub_100099358((uint64_t)v44, &qword_100235828);
    uint64_t v46 = static os_log_type_t.default.getter(v45);
    uint64_t v47 = v117;
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v48 = qword_10023DFC8;
    uint64_t v49 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v50 = swift_allocObject(v49, 72LL, 7LL);
    *(_OWORD *)(v50 + 16) = xmmword_1001A5EA0;
    id v51 = v47;
    id v52 = [v51 description];
    uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    uint64_t v55 = v54;

    *(void *)(v50 + 56) = &type metadata for String;
    *(void *)(v50 + 64) = sub_10009914C();
    *(void *)(v50 + 32) = v53;
    *(void *)(v50 + 40) = v55;
    os_log(_:dso:log:_:_:)(v46, &_mh_execute_header, v48, "Add DeviceSupportInformationRecord: %@", 38LL, 2LL, v50);
    swift_bridgeObjectRelease(v50);
    id v56 = v51;
    uint64_t v57 = (uint64_t)v104;
    UUID.init()(v56);
    uint64_t v58 = v108;
    sub_1000E7C54(v57, v56, v108);
LABEL_15:
    uint64_t v94 = v107;
    uint64_t v95 = sub_10013A76C();
    __chkstk_darwin(v95);
    *(&v103 - 2) = v96;
    *(&v103 - 1) = v58;
    OS_dispatch_queue.sync<A>(execute:)(&type metadata for (), v106, &v103 - 4, &type metadata for () + 1);
    swift_release(v95);
    v120(0LL, v118, v119, v121);
    uint64_t v97 = objc_autoreleasePoolPush();
    sub_1000E95EC(v58, v122);
    objc_autoreleasePoolPop(v97);
    Class v98 = v122[0];
    uint64_t v99 = sub_10013B740();
    uint64_t v100 = swift_allocObject(a9, 32LL, 7LL);
    *(void *)(v100 + 16) = v94;
    *(void *)(v100 + 24) = v98;
    swift_retain(v94);
    uint64_t v101 = v98;
    sub_1001051E0(v101, 1, a10, v100);

    swift_unknownObjectRelease(v99);
    swift_release(v100);
    return sub_1000A7CD4(v58, type metadata accessor for DeviceSupportInformationRecord);
  }

  uint64_t v59 = v105;
  sub_1000C998C((uint64_t)v44, v105, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v60 = v117;
  unsigned __int8 v61 = sub_1000EAD44(v117);
  uint64_t v62 = v103;
  sub_1000A7C90(v59, v103, type metadata accessor for DeviceSupportInformationRecord);
  if ((v61 & 1) != 0
    || (uint64_t v63 = objc_autoreleasePoolPush(),
        sub_1000E95EC(v62, v122),
        objc_autoreleasePoolPop(v63),
        Class v64 = v122[0],
        id v65 = -[objc_class recordChangeTag](v122[0], "recordChangeTag"),
        v64,
        !v65))
  {
    uint64_t v80 = sub_1000A7CD4(v62, type metadata accessor for DeviceSupportInformationRecord);
    LODWORD(v116) = static os_log_type_t.default.getter(v80);
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v81 = qword_10023DFC8;
    uint64_t v82 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v83 = swift_allocObject(v82, 112LL, 7LL);
    *(_OWORD *)(v83 + 16) = xmmword_1001A6F30;
    Class v84 = sub_1000E7430();
    uint64_t v86 = v85;
    uint64_t v87 = v59;
    *(void *)(v83 + 56) = &type metadata for String;
    unint64_t v88 = sub_10009914C();
    *(void *)(v83 + 64) = v88;
    *(void *)(v83 + 32) = v84;
    *(void *)(v83 + 40) = v86;
    id v89 = v60;
    id v90 = [v89 description];
    uint64_t v91 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
    uint64_t v93 = v92;

    *(void *)(v83 + 96) = &type metadata for String;
    *(void *)(v83 + 104) = v88;
    *(void *)(v83 + 72) = v91;
    *(void *)(v83 + 80) = v93;
    os_log(_:dso:log:_:_:)( v116,  &_mh_execute_header,  v81,  "Updating cached DeviceSupportInformationRecord: %@ with %@",  58LL,  2LL,  v83);
    swift_bridgeObjectRelease(v83);
    uint64_t v58 = v108;
    sub_1000A7C90(v87, v108, type metadata accessor for DeviceSupportInformationRecord);
    sub_1000EA220(v89);
    sub_1000A7CD4(v87, type metadata accessor for DeviceSupportInformationRecord);
    goto LABEL_15;
  }

  uint64_t v66 = sub_1000A7CD4(v62, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v67 = static os_log_type_t.default.getter(v66);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v68 = qword_10023DFC8;
  uint64_t v69 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v70 = swift_allocObject(v69, 112LL, 7LL);
  *(_OWORD *)(v70 + 16) = xmmword_1001A6F30;
  Class v71 = sub_1000E7430();
  uint64_t v73 = v72;
  *(void *)(v70 + 56) = &type metadata for String;
  unint64_t v74 = sub_10009914C();
  *(void *)(v70 + 64) = v74;
  *(void *)(v70 + 32) = v71;
  *(void *)(v70 + 40) = v73;
  id v75 = v60;
  id v76 = [v75 description];
  uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
  uint64_t v79 = v78;

  *(void *)(v70 + 96) = &type metadata for String;
  *(void *)(v70 + 104) = v74;
  *(void *)(v70 + 72) = v77;
  *(void *)(v70 + 80) = v79;
  os_log(_:dso:log:_:_:)(v67, &_mh_execute_header, v68, "No change from cached %@ [to] %@", 32LL, 2LL, v70);
  swift_bridgeObjectRelease(v70);
  v120(0LL, v118, v119, v121);
  uint64_t v58 = v59;
  return sub_1000A7CD4(v58, type metadata accessor for DeviceSupportInformationRecord);
}

uint64_t sub_100172F18(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017256C( a1,  a2,  a3,  a4,  a5,  (uint64_t)sub_10018A7E8,  (uint64_t)sub_10018A838,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BABAC,  (uint64_t)&unk_100211728,  (uint64_t)sub_100189BC4);
}

void sub_100172F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __int128 v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  uint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  uint64_t v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  id v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  id v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  uint64_t v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000BB338(0LL, v149, v148, v150);
  }

  else
  {
    uint64_t v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    Class v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    uint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    uint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    id v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    uint64_t v94 = (void *)(v70 + v93[7]);
    *uint64_t v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    uint64_t v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    Class v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100211368, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100211390, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000BB338(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_100173B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_1002113B8, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  uint64_t v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  id v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  id v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_1002113E0, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_100189B70;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    void aBlock[3] = (Class)&unk_1002113F8;
    uint64_t v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  uint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100211430, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100211458, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000BB338(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_100174818(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  id v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000BB338(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_100211480, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_1002114A8, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000BB338(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_100175494(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_1002114D0, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000BB338(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_1002114F8, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A57C;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100211510;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100211548, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_100211570, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000BB338(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_10017601C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_100211598, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000BB338(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_1002115C0, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A57C;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_1002115D8;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100211610, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100211638, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000BB338(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_100176B94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100211660, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_100211688, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A57C;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_1002116A0;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_1002116D8, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100211700, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000BB338(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_100177684( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_100172F60,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BB338,  sub_10018A7E8,  sub_100173B50,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100174818,  sub_100175494,  sub_10017601C,  sub_100176B94);
}

void sub_100177704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __int128 v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  uint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  Class v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  uint64_t v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000BB354(0LL, v149, v148, v150);
  }

  else
  {
    uint64_t v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    uint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    uint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    unint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    id v94 = (void *)(v70 + v93[7]);
    *id v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    id v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100210FA8, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100210FD0, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000BB354(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_1001782F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_100210FF8, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  uint64_t v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  Class v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  uint64_t v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  uint64_t v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_100211020, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_100189B14;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    void aBlock[3] = (Class)&unk_100211038;
    uint64_t v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  uint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100211070, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100211098, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000BB354(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_100178FBC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  uint64_t v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000BB354(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_1002110C0, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_1002110E8, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000BB354(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_100179C38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100211110, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000BB354(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_100211138, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A578;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100211150;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100211188, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_1002111B0, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000BB354(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_10017A7C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_1002111D8, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000BB354(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_100211200, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A578;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_100211218;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100211250, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100211278, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000BB354(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_10017B338(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_1002112A0, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_1002112C8, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A578;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_1002112E0;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_100211318, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100211340, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000BB354(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_10017BE28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_100177704,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BB354,  sub_10018A7E8,  sub_1001782F4,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100178FBC,  sub_100179C38,  sub_10017A7C0,  sub_10017B338);
}

uint64_t sub_10017BEA8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017BF38( a1,  a2,  a3,  a4,  a5,  (unint64_t)sub_10018A7D4,  (uint64_t)sub_10018A824,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BDFA4,  (uint64_t)&unk_100210F80,  (uint64_t)sub_10018A864);
}

uint64_t sub_10017BEF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017BF38( a1,  a2,  a3,  a4,  a5,  (unint64_t)sub_10018A7D4,  (uint64_t)sub_10018A824,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BDF88,  (uint64_t)&unk_100210F58,  (uint64_t)sub_10018A864);
}

uint64_t sub_10017BF38( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10)
{
  uint64_t v193 = a5;
  v194 = a8;
  uint64_t v185 = a7;
  unint64_t v200 = a6;
  uint64_t v191 = a3;
  uint64_t v192 = a4;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v12);
  v182 = (char *)&v182 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v182 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v182 - v19;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v182 - v22;
  uint64_t v197 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v197);
  v199 = (char **)((char *)&v182 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v202 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v198 = *(void *)(v202 - 8);
  __chkstk_darwin(v202);
  uint64_t v183 = (uint64_t)&v182 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v26);
  uint64_t v188 = (uint64_t)&v182 - v27;
  __chkstk_darwin(v28);
  uint64_t v184 = (uint64_t)&v182 - v29;
  __chkstk_darwin(v30);
  uint64_t v187 = (uint64_t)&v182 - v31;
  __chkstk_darwin(v32);
  uint64_t v190 = (uint64_t)&v182 - v33;
  __chkstk_darwin(v34);
  uint64_t v186 = (uint64_t)&v182 - v35;
  uint64_t v189 = a2;
  uint64_t v36 = sub_10013A76C();
  v201 = a1;
  id v37 = [a1 bluetoothAddress];
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
  uint64_t v196 = v39;

  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v40 = sub_100098D58(v14, (uint64_t)qword_10023DD70);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v23, v40, v14);
  uint64_t v41 = objc_autoreleasePoolPush();
  v195 = v23;
  unint64_t v42 = v41;
  uint64_t v44 = URL.path.getter(v43);
  uint64_t v46 = v45;
  URL.appendingPathComponent(_:)(v44);
  swift_bridgeObjectRelease(v46);
  uint64_t v47 = v38;
  uint64_t v48 = v196;
  URL.appendingPathComponent(_:)(v47);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v15 + 8);
  v49(v17, v14);
  objc_autoreleasePoolPop(v42);
  Class v50 = objc_autoreleasePoolPush();
  __chkstk_darwin(v50);
  *(&v182 - 2) = v20;
  *(&v182 - 1) = (char *)v36;
  uint64_t v51 = v199;
  OS_dispatch_queue.sync<A>(execute:)(v199, v200, &v182 - 4, v197);
  objc_autoreleasePoolPop(v50);
  v49(v20, v14);
  swift_release(v36);
  swift_bridgeObjectRelease(v48);
  v49(v195, v14);
  uint64_t v52 = v202;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v198 + 48))(v51, 1LL, v202) != 1)
  {
    uint64_t v92 = v190;
    sub_1000C998C((uint64_t)v51, v190, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v93 = v201;
    unsigned __int8 v94 = sub_1000D1540(v201);
    uint64_t v95 = v187;
    sub_1000A7C90(v92, v187, type metadata accessor for MagicPairingSettingsRecord);
    if ((v94 & 1) == 0)
    {
      id v96 = objc_autoreleasePoolPush();
      uint64_t v97 = (uint64_t *)(v95 + *(int *)(v52 + 20));
      uint64_t v98 = *v97;
      unint64_t v99 = v97[1];
      sub_1000991CC(*v97, v99);
      sub_100118B60(v98, v99);
      Class isa = v100;
      sub_100099394(v98, v99);
      uint64_t v102 = v184;
      sub_1000A7C90(v95, v184, type metadata accessor for MagicPairingSettingsRecord);
      if (!isa) {
        Class isa = sub_1000A33B8(v102).super.isa;
      }
      sub_1000A7CD4(v102, type metadata accessor for MagicPairingSettingsRecord);
      v203[0] = isa;
      sub_1000CEB74(v203);
      objc_autoreleasePoolPop(v96);
      id v103 = -[objc_class recordChangeTag](isa, "recordChangeTag");

      if (v103)
      {

        uint64_t v104 = sub_1000A7CD4(v95, type metadata accessor for MagicPairingSettingsRecord);
        LODWORD(v202) = static os_log_type_t.default.getter(v104);
        if (qword_100234C28 != -1) {
          swift_once(&qword_100234C28, sub_10018A9E0);
        }
        uint64_t v105 = qword_10023DFC8;
        uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100234E00);
        uint64_t v107 = swift_allocObject(v106, 112LL, 7LL);
        *(_OWORD *)(v107 + 16) = xmmword_1001A6F30;
        uint64_t v108 = v190;
        uint64_t v109 = v188;
        sub_1000A7C90(v190, v188, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v110 = sub_1000CB0DC();
        uint64_t v112 = v111;
        sub_1000A7CD4(v109, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v107 + 56) = &type metadata for String;
        unint64_t v113 = sub_10009914C();
        *(void *)(v107 + 64) = v113;
        *(void *)(v107 + 32) = v110;
        *(void *)(v107 + 40) = v112;
        id v114 = v93;
        id v115 = [v114 description];
        uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)(v115);
        uint64_t v118 = v117;

        *(void *)(v107 + 96) = &type metadata for String;
        *(void *)(v107 + 104) = v113;
        *(void *)(v107 + 72) = v116;
        *(void *)(v107 + 80) = v118;
        os_log(_:dso:log:_:_:)( v202,  &_mh_execute_header,  v105,  "No change from cached %@ [to] %@",  32LL,  2LL,  v107);
        swift_bridgeObjectRelease(v107);
        v194(0LL, v191, v192, v193);
        uint64_t v119 = v108;
        return sub_1000A7CD4(v119, type metadata accessor for MagicPairingSettingsRecord);
      }
    }

    unint64_t v200 = 0LL;
    uint64_t v133 = sub_1000A7CD4(v95, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v134 = static os_log_type_t.default.getter(v133);
    if (qword_100234C28 != -1) {
      swift_once(&qword_100234C28, sub_10018A9E0);
    }
    uint64_t v135 = qword_10023DFC8;
    uint64_t v136 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v137 = swift_allocObject(v136, 72LL, 7LL);
    *(_OWORD *)(v137 + 16) = xmmword_1001A5EA0;
    uint64_t v138 = v190;
    uint64_t v139 = v188;
    sub_1000A7C90(v190, v188, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v140 = sub_1000CB0DC();
    uint64_t v142 = v141;
    sub_1000A7CD4(v139, type metadata accessor for MagicPairingSettingsRecord);
    *(void *)(v137 + 56) = &type metadata for String;
    unint64_t v143 = sub_10009914C();
    *(void *)(v137 + 64) = v143;
    *(void *)(v137 + 32) = v140;
    *(void *)(v137 + 40) = v142;
    os_log(_:dso:log:_:_:)( v134,  &_mh_execute_header,  v135,  "Updating cached MagicPairingSettingsRecord: %@ ",  47LL,  2LL,  v137);
    uint64_t v144 = swift_bridgeObjectRelease(v137);
    uint64_t v145 = static os_log_type_t.default.getter(v144);
    uint64_t v146 = qword_10023DFC8;
    uint64_t v147 = swift_allocObject(v136, 112LL, 7LL);
    *(_OWORD *)(v147 + 16) = xmmword_1001A6F30;
    uint64_t v148 = (uint64_t *)(v138 + *(int *)(v202 + 24));
    uint64_t v150 = *v148;
    uint64_t v149 = v148[1];
    *(void *)(v147 + 56) = &type metadata for String;
    *(void *)(v147 + 64) = v143;
    *(void *)(v147 + 32) = v150;
    *(void *)(v147 + 40) = v149;
    swift_bridgeObjectRetain(v149);
    unint64_t v151 = v201;
    id v152 = [v151 description];
    uint64_t v153 = static String._unconditionallyBridgeFromObjectiveC(_:)(v152);
    uint64_t v155 = v154;

    *(void *)(v147 + 96) = &type metadata for String;
    *(void *)(v147 + 104) = v143;
    *(void *)(v147 + 72) = v153;
    *(void *)(v147 + 80) = v155;
    os_log(_:dso:log:_:_:)( v145,  &_mh_execute_header,  v146,  "Updating cached MagicPairingSettingsRecord %@ with %@",  53LL,  2LL,  v147);
    swift_bridgeObjectRelease(v147);
    uint64_t v91 = v186;
    sub_1000A7C90(v138, v186, type metadata accessor for MagicPairingSettingsRecord);
    sub_1000CFEA4(v151);
    sub_1000A7CD4(v138, type metadata accessor for MagicPairingSettingsRecord);
LABEL_26:
    uint64_t v156 = sub_10013A76C();
    __chkstk_darwin(v156);
    *(&v182 - 2) = v157;
    *(&v182 - 1) = (char *)v91;
    unint64_t v158 = v200;
    OS_dispatch_queue.sync<A>(execute:)(&type metadata for (), v185, &v182 - 4, &type metadata for () + 1);
    if (v158)
    {
      uint64_t v159 = swift_release(v156);
      uint64_t v160 = static os_log_type_t.error.getter(v159);
      if (qword_100234C28 != -1) {
        swift_once(&qword_100234C28, sub_10018A9E0);
      }
      uint64_t v161 = qword_10023DFC8;
      uint64_t v162 = sub_100098CD8((uint64_t *)&unk_100234E00);
      uint64_t v163 = swift_allocObject(v162, 72LL, 7LL);
      *(_OWORD *)(v163 + 16) = xmmword_1001A5EA0;
      v203[0] = (id)v158;
      swift_errorRetain(v158);
      uint64_t v164 = sub_100098CD8(&qword_1002357C0);
      uint64_t v165 = String.init<A>(describing:)(v203, v164);
      uint64_t v167 = v166;
      *(void *)(v163 + 56) = &type metadata for String;
      *(void *)(v163 + 64) = sub_10009914C();
      *(void *)(v163 + 32) = v165;
      *(void *)(v163 + 40) = v167;
      os_log(_:dso:log:_:_:)( v160,  &_mh_execute_header,  v161,  "Unable to enocde MagicPairingSettingsRecord with error: %@",  58LL,  2LL,  v163);
      swift_bridgeObjectRelease(v163);
      unint64_t v168 = sub_1000DB8A4();
      uint64_t v169 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v168, 0LL, 0LL);
      *uint64_t v170 = v158 | 0x4000000000000000LL;
      swift_errorRetain(v158);
      v194(v169, v191, v192, v193);
      swift_errorRelease(v169);
      swift_errorRelease(v158);
    }

    else
    {
      swift_release(v156);
      v194(0LL, v191, v192, v193);
      uint64_t v171 = objc_autoreleasePoolPush();
      Class v172 = (uint64_t *)(v91 + *(int *)(v202 + 20));
      uint64_t v173 = *v172;
      unint64_t v174 = v172[1];
      sub_1000991CC(*v172, v174);
      sub_100118B60(v173, v174);
      Class v176 = v175;
      sub_100099394(v173, v174);
      uint64_t v177 = v183;
      sub_1000A7C90(v91, v183, type metadata accessor for MagicPairingSettingsRecord);
      if (!v176) {
        Class v176 = sub_1000A33B8(v177).super.isa;
      }
      sub_1000A7CD4(v177, type metadata accessor for MagicPairingSettingsRecord);
      v203[0] = v176;
      sub_1000CEB74(v203);
      objc_autoreleasePoolPop(v171);
      uint64_t v178 = v189;
      uint64_t v179 = sub_10013B740();
      uint64_t v180 = swift_allocObject(a9, 32LL, 7LL);
      *(void *)(v180 + 16) = v178;
      *(void *)(v180 + 24) = v176;
      swift_retain(v178);
      v181 = v176;
      sub_1001051E0(v181, 1, a10, v180);

      swift_unknownObjectRelease(v179);
      swift_release(v180);
    }

    uint64_t v119 = v91;
    return sub_1000A7CD4(v119, type metadata accessor for MagicPairingSettingsRecord);
  }

  unint64_t v200 = 0LL;
  sub_100099358((uint64_t)v51, (uint64_t *)&unk_100235810);
  uint64_t v53 = v201;
  id v54 = [v201 masterKey];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
    unint64_t v58 = v57;

    sub_100099394(v56, v58);
    id v54 = [v53 masterHint];
    if (v54)
    {
      uint64_t v59 = v54;
      uint64_t v60 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
      unint64_t v62 = v61;

      sub_100099394(v60, v62);
      id v54 = [v53 accessoryKey];
      if (v54)
      {
        uint64_t v63 = v54;
        uint64_t v64 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
        unint64_t v66 = v65;

        sub_100099394(v64, v66);
        id v54 = [v53 accessoryHint];
        if (v54)
        {
          double v67 = v54;
          uint64_t v68 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
          unint64_t v70 = v69;

          sub_100099394(v68, v70);
          id v54 = [v53 encryptionKey];
          if (v54)
          {
            uint64_t v71 = v54;
            uint64_t v72 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
            unint64_t v74 = v73;

            sub_100099394(v72, v74);
            id v54 = [v53 irk];
            if (v54)
            {
              uint64_t v75 = v54;
              uint64_t v76 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
              unint64_t v78 = v77;

              uint64_t v79 = sub_100099394(v76, v78);
              uint64_t v80 = static os_log_type_t.default.getter(v79);
              if (qword_100234C28 != -1) {
                swift_once(&qword_100234C28, sub_10018A9E0);
              }
              uint64_t v81 = qword_10023DFC8;
              uint64_t v82 = sub_100098CD8((uint64_t *)&unk_100234E00);
              uint64_t v83 = swift_allocObject(v82, 72LL, 7LL);
              *(_OWORD *)(v83 + 16) = xmmword_1001A5EA0;
              id v84 = v53;
              id v85 = [v84 description];
              uint64_t v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
              uint64_t v88 = v87;

              *(void *)(v83 + 56) = &type metadata for String;
              *(void *)(v83 + 64) = sub_10009914C();
              *(void *)(v83 + 32) = v86;
              *(void *)(v83 + 40) = v88;
              os_log(_:dso:log:_:_:)( v80,  &_mh_execute_header,  v81,  "Add MagicPairingSettingsRecord: %@",  34LL,  2LL,  v83);
              swift_bridgeObjectRelease(v83);
              id v89 = v84;
              uint64_t v90 = (uint64_t)v182;
              UUID.init()(v89);
              uint64_t v91 = v186;
              sub_1000CBDD8(v90, v89, v186);
              goto LABEL_26;
            }
          }
        }
      }
    }
  }

  uint64_t v120 = static os_log_type_t.error.getter(v54);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v121 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v123 = swift_allocObject(v122, 72LL, 7LL);
  *(_OWORD *)(v123 + 16) = xmmword_1001A5EA0;
  id v124 = v53;
  id v125 = [v124 description];
  uint64_t v126 = static String._unconditionallyBridgeFromObjectiveC(_:)(v125);
  uint64_t v128 = v127;

  *(void *)(v123 + 56) = &type metadata for String;
  *(void *)(v123 + 64) = sub_10009914C();
  *(void *)(v123 + 32) = v126;
  *(void *)(v123 + 40) = v128;
  os_log(_:dso:log:_:_:)( v120,  &_mh_execute_header,  v121,  "Invalid magic keys unable to add MagicPairingSettingsRecord: %@",  63LL,  2LL,  v123);
  swift_bridgeObjectRelease(v123);
  unint64_t v129 = sub_1000DB8A4();
  uint64_t v130 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v129, 0LL, 0LL);
  void *v131 = 0x8000000000000028LL;
  v194(v130, v191, v192, v193);
  return swift_errorRelease(v130);
}

uint64_t sub_10017CD98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10017BF38( a1,  a2,  a3,  a4,  a5,  (unint64_t)sub_10018A7D4,  (uint64_t)sub_10018A824,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BEDF4,  (uint64_t)&unk_100210EE0,  (uint64_t)sub_100189A7C);
}

void sub_10017CDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  unint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  uint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  __n128 v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  id v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  Class v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  uint64_t v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  id v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000BFB10(0LL, v149, v148, v150);
  }

  else
  {
    uint64_t v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    uint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    id v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    uint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    unsigned __int8 v94 = (void *)(v70 + v93[7]);
    *unsigned __int8 v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    id v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100210B20, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100210B48, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000BFB10(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_10017D9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  unint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  uint64_t v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_100210B70, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  __n128 v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  Class v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  uint64_t v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  uint64_t v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_100210B98, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_100189A28;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    void aBlock[3] = (Class)&unk_100210BB0;
    uint64_t v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    unint64_t v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  uint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100210BE8, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100210C10, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000BFB10(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_10017E698(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  uint64_t v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  unint64_t v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  uint64_t v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  uint64_t v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000BFB10(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_100210C38, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_100210C60, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000BFB10(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_10017F314(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100210C88, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000BFB10(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_100210CB0, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A574;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100210CC8;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100210D00, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_100210D28, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000BFB10(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_10017FE9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_100210D50, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000BFB10(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_100210D78, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A574;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_100210D90;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100210DC8, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100210DF0, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000BFB10(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_100180A14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100210E18, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_100210E40, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A574;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_100210E58;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_100210E90, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100210EB8, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000BFB10(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_100181504( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_10017CDE0,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BFB10,  sub_10018A7E8,  sub_10017D9D0,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10017E698,  sub_10017F314,  sub_10017FE9C,  sub_100180A14);
}

void sub_100181584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a3;
  uint64_t v150 = a5;
  uint64_t v148 = a4;
  uint64_t v141 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (uint64_t *)((char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v138 = type metadata accessor for Date(0LL);
  uint64_t v136 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v137 = type metadata accessor for UUID(0LL);
  uint64_t v135 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v132 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v134);
  uint64_t v144 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __int128 v153 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v154 = (char *)&v125 - v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v125 - v17;
  uint64_t v155 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v155);
  uint64_t v156 = (uint64_t *)((char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v159 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v157 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v128 = (uint64_t)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v126 = (uint64_t)&v125 - v22;
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v125 - v24;
  __chkstk_darwin(v25);
  uint64_t v129 = (uint64_t)&v125 - v26;
  uint64_t v127 = v27;
  __chkstk_darwin(v28);
  uint64_t v143 = (uint64_t *)((char *)&v125 - v29);
  uint64_t v31 = static os_log_type_t.default.getter(v30);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v32 = qword_10023DFC8;
  uint64_t v146 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v33 = swift_allocObject(v146, 72LL, 7LL);
  __int128 v145 = xmmword_1001A5EA0;
  *(_OWORD *)(v33 + 16) = xmmword_1001A5EA0;
  uint64_t v34 = sub_100094CA4();
  uint64_t v36 = v35;
  *(void *)(v33 + 56) = &type metadata for String;
  unint64_t v147 = sub_10009914C();
  *(void *)(v33 + 64) = v147;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "CloudSync: Remove device record: %@", 35LL, 2LL, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v142 = a2;
  uint64_t v37 = sub_10013A76C();
  uint64_t v38 = *(int *)(v159 + 24);
  uint64_t v158 = a1;
  uint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v151 = *v39;
  uint64_t v130 = v39;
  if (qword_100234B30 != -1) {
    swift_once(&qword_100234B30, sub_100094AFC);
  }
  uint64_t v40 = sub_100098D58(v11, (uint64_t)qword_10023DCC0);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v152 = v18;
  v43(v18, v40, v41);
  uint64_t v44 = objc_autoreleasePoolPush();
  uint64_t v46 = URL.path.getter(v45);
  uint64_t v48 = v47;
  uint64_t v49 = v37;
  Class v50 = v153;
  URL.appendingPathComponent(_:)(v46);
  swift_bridgeObjectRelease(v48);
  uint64_t v51 = v154;
  URL.appendingPathComponent(_:)(v151);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v42 + 8);
  v52(v50, v41);
  objc_autoreleasePoolPop(v44);
  uint64_t v53 = objc_autoreleasePoolPush();
  __chkstk_darwin(v53);
  *(&v125 - 2) = (uint64_t)v51;
  *(&v125 - 1) = v49;
  uint64_t v54 = v156;
  OS_dispatch_queue.sync<A>(execute:)(v156, sub_10018A7FC, &v125 - 4, v155);
  objc_autoreleasePoolPop(v53);
  v52(v51, v41);
  swift_release(v49);
  v52(v152, v41);
  uint64_t v55 = v159;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v157 + 48))(v54, 1LL, v159) == 1)
  {
    uint64_t v56 = sub_100099358((uint64_t)v54, &qword_100235848);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = qword_10023DFC8;
    uint64_t v59 = swift_allocObject(v146, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = v145;
    uint64_t v60 = sub_100094CA4();
    unint64_t v61 = v147;
    *(void *)(v59 + 56) = &type metadata for String;
    *(void *)(v59 + 64) = v61;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v58, "Record not found to remove: %@", 30LL, 2LL, v59);
    swift_bridgeObjectRelease(v59);
    sub_1000BFB2C(0LL, v149, v148, v150);
  }

  else
  {
    uint64_t v63 = v143;
    sub_1000C998C((uint64_t)v54, (uint64_t)v143, type metadata accessor for DeviceRecord);
    uint64_t v64 = objc_autoreleasePoolPush();
    uint64_t v65 = *v63;
    unint64_t v66 = v63[1];
    sub_1000991CC(*v63, v66);
    sub_100118B60(v65, v66);
    Class isa = v67;
    sub_100099394(v65, v66);
    uint64_t v69 = v129;
    sub_1000A7C90((uint64_t)v63, v129, type metadata accessor for DeviceRecord);
    if (!isa) {
      Class isa = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v69, type metadata accessor for DeviceRecord);
    uint64_t v70 = (uint64_t)v144;
    Class v160 = isa;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v64);
    id v71 = -[objc_class recordID](isa, "recordID");

    uint64_t v72 = objc_autoreleasePoolPush();
    uint64_t v73 = *v63;
    unint64_t v74 = v63[1];
    sub_1000991CC(*v63, v74);
    sub_100118B60(v73, v74);
    Class v76 = v75;
    sub_100099394(v73, v74);
    uint64_t v77 = v131;
    sub_1000A7C90((uint64_t)v63, v131, type metadata accessor for DeviceRecord);
    if (!v76) {
      Class v76 = sub_1000A35AC().super.isa;
    }
    sub_1000A7CD4(v77, type metadata accessor for DeviceRecord);
    uint64_t v78 = v142;
    Class v160 = v76;
    sub_100096A48((id *)&v160);
    objc_autoreleasePoolPop(v72);
    uint64_t v80 = CKRecord.recordType.getter(v79);
    uint64_t v82 = v81;

    sub_10014C090(v71, v80, v82, 0);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = v158 + *(int *)(v55 + 20);
    uint64_t v84 = v135;
    uint64_t v85 = v132;
    uint64_t v86 = v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v83, v137);
    uint64_t v88 = *v130;
    uint64_t v87 = v130[1];
    uint64_t v89 = swift_bridgeObjectRetain(v87);
    unint64_t v90 = v133;
    uint64_t v91 = Date.init()(v89);
    double v92 = Date.timeIntervalSince1970.getter(v91);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v90, v138);
    *(_BYTE *)uint64_t v70 = 1;
    strcpy((char *)(v70 + 8), "DeviceRecord");
    *(_BYTE *)(v70 + 21) = 0;
    *(_WORD *)(v70 + 22) = -5120;
    uint64_t v93 = (int *)v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v70 + *(int *)(v134 + 24), v85, v86);
    id v94 = (void *)(v70 + v93[7]);
    *id v94 = v88;
    v94[1] = v87;
    *(double *)(v70 + v93[8]) = v92;
    *(_OWORD *)(v70 + v93[9]) = xmmword_1001A9700;
    uint64_t v95 = objc_autoreleasePoolPush();
    sub_10015802C(v78, v70);
    objc_autoreleasePoolPop(v95);
    id v96 = (void *)sub_10013B740();
    uint64_t v97 = (void *)v96[9];
    uint64_t v98 = v139;
    *uint64_t v139 = v97;
    uint64_t v99 = v140;
    uint64_t v100 = v141;
    (*(void (**)(void *, void, uint64_t))(v140 + 104))( v98,  enum case for DispatchPredicate.notOnQueue(_:),  v141);
    id v101 = v97;
    LOBYTE(v88) = _dispatchPreconditionTest(_:)(v98);
    (*(void (**)(void *, uint64_t))(v99 + 8))(v98, v100);
    if ((v88 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v160, sub_100187664, v96, &type metadata for Bool);
      uint64_t v102 = swift_unknownObjectRelease(v96);
      if ((v160 & 1) != 0)
      {
        uint64_t v103 = sub_10013B740();
        uint64_t v104 = objc_autoreleasePoolPush();
        uint64_t v105 = *v63;
        unint64_t v106 = v63[1];
        sub_1000991CC(*v63, v106);
        sub_100118B60(v105, v106);
        Class v108 = v107;
        sub_100099394(v105, v106);
        uint64_t v109 = v126;
        sub_1000A7C90((uint64_t)v63, v126, type metadata accessor for DeviceRecord);
        if (!v108) {
          Class v108 = sub_1000A35AC().super.isa;
        }
        sub_1000A7CD4(v109, type metadata accessor for DeviceRecord);
        Class v160 = v108;
        sub_100096A48((id *)&v160);
        objc_autoreleasePoolPop(v104);
        id v110 = -[objc_class recordID](v108, "recordID");

        uint64_t v111 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v111 + 16, v78);
        uint64_t v112 = v128;
        sub_1000A7C90((uint64_t)v63, v128, type metadata accessor for DeviceRecord);
        uint64_t v113 = *(unsigned __int8 *)(v157 + 80);
        uint64_t v114 = (v113 + 16) & ~v113;
        unint64_t v115 = (v127 + v114 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v116 = swift_allocObject(&unk_100210760, v115 + 8, v113 | 7);
        sub_1000C998C(v112, v116 + v114, type metadata accessor for DeviceRecord);
        *(void *)(v116 + v115) = v111;
        uint64_t v117 = swift_allocObject(&unk_100210788, 49LL, 7LL);
        *(void *)(v117 + 16) = v103;
        *(void *)(v117 + 24) = v110;
        *(void *)(v117 + 32) = sub_100187CD0;
        *(void *)(v117 + 40) = v116;
        *(_BYTE *)(v117 + 48) = 1;
        swift_retain(v111);
        swift_unknownObjectRetain(v103);
        id v118 = v110;
        swift_retain(v116);
        sub_100104BA4((uint64_t)sub_10018749C, v117);
        swift_release(v111);
        swift_release(v116);
        swift_unknownObjectRelease(v103);

        swift_release(v117);
      }

      else
      {
        uint64_t v119 = static os_log_type_t.error.getter(v102);
        uint64_t v120 = qword_10023DFC8;
        uint64_t v121 = swift_allocObject(v146, 72LL, 7LL);
        *(_OWORD *)(v121 + 16) = v145;
        uint64_t v122 = sub_100094CA4();
        unint64_t v123 = v147;
        *(void *)(v121 + 56) = &type metadata for String;
        *(void *)(v121 + 64) = v123;
        *(void *)(v121 + 32) = v122;
        *(void *)(v121 + 40) = v124;
        os_log(_:dso:log:_:_:)( v119,  &_mh_execute_header,  v120,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v121);
        swift_bridgeObjectRelease(v121);
      }

      sub_1000BFB2C(0LL, v149, v148, v150);
      sub_1000A7CD4(v70, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4((uint64_t)v63, type metadata accessor for DeviceRecord);
    }

    else
    {
      __break(1u);
      swift_release(v150);
      swift_release(v149);
      objc_autoreleasePoolPop(v96);
      __break(1u);
    }
  }

void sub_100182174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v152 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v151 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  uint64_t v150 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v148 = type metadata accessor for Date(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  uint64_t v143 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for UUID(0LL);
  uint64_t v146 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v144 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v145 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v145);
  uint64_t v154 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v140 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v137 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v161 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Class v160 = (char *)&v130 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v163 = (char *)&v130 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v130 - v21;
  uint64_t v162 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v162);
  uint64_t v164 = (uint64_t *)((char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v166 = *(void *)(v24 - 8);
  uint64_t v167 = v24;
  __chkstk_darwin(v24);
  uint64_t v156 = (uint64_t)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = v25;
  __chkstk_darwin(v26);
  uint64_t v153 = (uint64_t)&v130 - v27;
  uint64_t v28 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_1002107B0, 40LL, 7LL);
  *((void *)v28 + 2) = a3;
  *((void *)v28 + 3) = a4;
  uint64_t v134 = a4;
  uint64_t v158 = v28;
  *((void *)v28 + 4) = a5;
  uint64_t v136 = a3;
  swift_retain(a3);
  uint64_t v135 = a5;
  uint64_t v29 = swift_retain(a5);
  uint64_t v30 = static os_log_type_t.default.getter(v29);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v31 = qword_10023DFC8;
  uint64_t v133 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v32 = swift_allocObject(v133, 72LL, 7LL);
  __int128 v132 = xmmword_1001A5EA0;
  *(_OWORD *)(v32 + 16) = xmmword_1001A5EA0;
  Class v33 = sub_1000E7430();
  uint64_t v35 = v34;
  *(void *)(v32 + 56) = &type metadata for String;
  unint64_t v131 = sub_10009914C();
  *(void *)(v32 + 64) = v131;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v35;
  os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, v31, "Remove device record: %@", 24LL, 2LL, v32);
  swift_bridgeObjectRelease(v32);
  uint64_t v165 = a2;
  uint64_t v36 = sub_10013A76C();
  uint64_t v37 = *(int *)(v167 + 24);
  uint64_t v157 = a1;
  uint64_t v38 = *(void *)(a1 + v37);
  if (qword_100234BC8 != -1) {
    swift_once(&qword_100234BC8, sub_1000E72E4);
  }
  uint64_t v39 = sub_100098D58(v16, (uint64_t)qword_10023DF00);
  uint64_t v40 = v16;
  uint64_t v41 = v161;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v161 + 16);
  uint64_t v159 = v22;
  v42(v22, v39, v40);
  uint64_t v43 = objc_autoreleasePoolPush();
  uint64_t v45 = URL.path.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = v160;
  URL.appendingPathComponent(_:)(v45);
  swift_bridgeObjectRelease(v47);
  uint64_t v49 = v163;
  URL.appendingPathComponent(_:)(v38);
  Class v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v48, v40);
  objc_autoreleasePoolPop(v43);
  uint64_t v51 = objc_autoreleasePoolPush();
  __chkstk_darwin(v51);
  *(&v130 - 2) = (uint64_t)v49;
  *(&v130 - 1) = v36;
  uint64_t v52 = v164;
  OS_dispatch_queue.sync<A>(execute:)(v164, sub_10018A7E8, &v130 - 4, v162);
  objc_autoreleasePoolPop(v51);
  v50(v49, v40);
  swift_release(v36);
  v50(v159, v40);
  uint64_t v53 = v166;
  uint64_t v54 = v167;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v166 + 48))(v52, 1LL, v167) == 1)
  {
    sub_100099358((uint64_t)v52, &qword_100235828);
    uint64_t v55 = *(void **)(v165 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v56 = v156;
    sub_1000A7C90(v157, v156, type metadata accessor for DeviceSupportInformationRecord);
    uint64_t v57 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v58 = (v57 + 16) & ~v57;
    unint64_t v59 = (v155 + v58 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_1002107D8, v59 + 16, v57 | 7);
    sub_1000C998C(v56, v60 + v58, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v61 = (uint64_t (**)(uint64_t))(v60 + v59);
    uint64_t v62 = v158;
    *unint64_t v61 = sub_1001899CC;
    v61[1] = v62;
    aBlock[4] = (Class)sub_100187CAC;
    uint64_t v170 = v60;
    aBlock[0] = (Class)_NSConcreteStackBlock;
    aBlock[1] = (Class)1107296256;
    aBlock[2] = (Class)sub_1000F2C54;
    void aBlock[3] = (Class)&unk_1002107F0;
    uint64_t v63 = _Block_copy(aBlock);
    id v64 = v55;
    uint64_t v65 = swift_retain(v62);
    unint64_t v66 = v137;
    static DispatchQoS.unspecified.getter(v65);
    unint64_t v168 = _swiftEmptyArrayStorage;
    uint64_t v67 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v68 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v69 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v70 = v140;
    uint64_t v71 = v68;
    uint64_t v72 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v168, v71, v69, v142, v67);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v66, v70, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v141 + 8))(v70, v72);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v66, v139);
    uint64_t v73 = v170;
    swift_release(v62);
    unint64_t v74 = (void *)v73;
LABEL_12:
    swift_release(v74);
    return;
  }

  uint64_t v75 = (uint64_t)v52;
  uint64_t v76 = v153;
  sub_1000C998C(v75, v153, type metadata accessor for DeviceSupportInformationRecord);
  uint64_t v77 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v78 = v165;
  uint64_t v79 = v54;
  objc_autoreleasePoolPop(v77);
  Class v80 = aBlock[0];
  id v81 = -[objc_class recordID](aBlock[0], "recordID");

  uint64_t v82 = objc_autoreleasePoolPush();
  sub_1000E95EC(v76, aBlock);
  uint64_t v83 = (uint64_t)v154;
  objc_autoreleasePoolPop(v82);
  Class v84 = aBlock[0];
  uint64_t v86 = CKRecord.recordType.getter(v85);
  uint64_t v88 = v87;

  uint64_t v89 = v78;
  sub_10014C090(v81, v86, v88, 0);

  swift_bridgeObjectRelease(v88);
  uint64_t v90 = v146;
  uint64_t v91 = v144;
  uint64_t v92 = v149;
  (*(void (**)(char *, uint64_t, uint64_t))(v146 + 16))(v144, v76, v149);
  uint64_t v93 = *(int *)(v79 + 24);
  uint64_t v94 = v89;
  uint64_t v95 = (uint64_t *)(v76 + v93);
  uint64_t v97 = *v95;
  uint64_t v96 = v95[1];
  uint64_t v98 = swift_bridgeObjectRetain(v96);
  uint64_t v99 = v143;
  uint64_t v100 = Date.init()(v98);
  double v101 = Date.timeIntervalSince1970.getter(v100);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v99, v148);
  *(_BYTE *)uint64_t v83 = 1;
  *(void *)(v83 + 8) = 0xD00000000000001ELL;
  *(void *)(v83 + 16) = 0x80000001001CABA0LL;
  uint64_t v102 = (int *)v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v83 + *(int *)(v145 + 24), v91, v92);
  uint64_t v103 = (void *)(v83 + v102[7]);
  *uint64_t v103 = v97;
  v103[1] = v96;
  *(double *)(v83 + v102[8]) = v101;
  *(_OWORD *)(v83 + v102[9]) = xmmword_1001A9700;
  uint64_t v104 = objc_autoreleasePoolPush();
  sub_10015802C(v94, v83);
  objc_autoreleasePoolPop(v104);
  uint64_t v105 = (void *)sub_10013B740();
  unint64_t v106 = (void *)v105[9];
  uint64_t v107 = v150;
  void *v150 = v106;
  uint64_t v108 = v151;
  uint64_t v109 = v152;
  (*(void (**)(void *, void, uint64_t))(v151 + 104))( v107,  enum case for DispatchPredicate.notOnQueue(_:),  v152);
  id v110 = v106;
  LOBYTE(v97) = _dispatchPreconditionTest(_:)(v107);
  (*(void (**)(void *, uint64_t))(v108 + 8))(v107, v109);
  if ((v97 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v105, &type metadata for Bool);
    uint64_t v111 = swift_unknownObjectRelease(v105);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v112 = sub_10013B740();
      uint64_t v113 = objc_autoreleasePoolPush();
      sub_1000E95EC(v76, aBlock);
      objc_autoreleasePoolPop(v113);
      Class v114 = aBlock[0];
      id v115 = -[objc_class recordID](aBlock[0], "recordID");

      uint64_t v116 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v116 + 16, v94);
      uint64_t v117 = v156;
      sub_1000A7C90(v76, v156, type metadata accessor for DeviceSupportInformationRecord);
      uint64_t v118 = *(unsigned __int8 *)(v166 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      unint64_t v120 = (v155 + v119 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v121 = swift_allocObject(&unk_100210828, v120 + 8, v118 | 7);
      sub_1000C998C(v117, v121 + v119, type metadata accessor for DeviceSupportInformationRecord);
      *(void *)(v121 + v120) = v116;
      uint64_t v122 = swift_allocObject(&unk_100210850, 49LL, 7LL);
      *(void *)(v122 + 16) = v112;
      *(void *)(v122 + 24) = v115;
      *(void *)(v122 + 32) = sub_100187CB4;
      *(void *)(v122 + 40) = v121;
      *(_BYTE *)(v122 + 48) = 1;
      swift_retain(v116);
      swift_unknownObjectRetain(v112);
      id v123 = v115;
      swift_retain(v121);
      sub_100104BA4((uint64_t)sub_10018749C, v122);
      swift_release(v116);
      swift_release(v121);
      swift_unknownObjectRelease(v112);

      swift_release(v122);
    }

    else
    {
      uint64_t v124 = static os_log_type_t.error.getter(v111);
      uint64_t v125 = qword_10023DFC8;
      uint64_t v126 = swift_allocObject(v133, 72LL, 7LL);
      *(_OWORD *)(v126 + 16) = v132;
      Class v127 = sub_1000E7430();
      unint64_t v128 = v131;
      *(void *)(v126 + 56) = &type metadata for String;
      *(void *)(v126 + 64) = v128;
      *(void *)(v126 + 32) = v127;
      *(void *)(v126 + 40) = v129;
      os_log(_:dso:log:_:_:)( v124,  &_mh_execute_header,  v125,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v126);
      swift_bridgeObjectRelease(v126);
    }

    sub_1000BFB2C(0LL, v136, v134, v135);
    sub_1000A7CD4(v83, type metadata accessor for BTDeferredRecord);
    sub_1000A7CD4(v76, type metadata accessor for DeviceSupportInformationRecord);
    unint64_t v74 = v158;
    goto LABEL_12;
  }

  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v105);
  __break(1u);
  swift_release(v135);
  swift_release(v136);
  objc_autoreleasePoolPop(v110);
  __break(1u);
}

void sub_100182E3C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v160 = a4;
  uint64_t v161 = a6;
  uint64_t v159 = a5;
  int v140 = a2;
  uint64_t v150 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v148 = (uint64_t *)((char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v147 = type metadata accessor for Date(0LL);
  uint64_t v145 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  uint64_t v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for UUID(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v141 = (char *)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v143 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v143);
  uint64_t v152 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v166 = v13;
  __chkstk_darwin(v12);
  uint64_t v164 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  unint64_t v168 = (char *)&v135 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v135 - v18;
  uint64_t v167 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v167);
  uint64_t v169 = (uint64_t *)((char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v170 = *(void *)(v21 - 8);
  uint64_t v171 = v21;
  __chkstk_darwin(v21);
  uint64_t v136 = (uint64_t)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v139 = (uint64_t)&v135 - v24;
  __chkstk_darwin(v25);
  uint64_t v138 = (uint64_t)&v135 - v26;
  __chkstk_darwin(v27);
  uint64_t v151 = (uint64_t)&v135 - v28;
  uint64_t v137 = v29;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v135 - v31;
  uint64_t v34 = static os_log_type_t.default.getter(v33);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v35 = qword_10023DFC8;
  uint64_t v154 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v36 = swift_allocObject(v154, 72LL, 7LL);
  __int128 v153 = xmmword_1001A5EA0;
  *(_OWORD *)(v36 + 16) = xmmword_1001A5EA0;
  sub_1000A7C90(a1, (uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  uint64_t v37 = sub_1000CB0DC();
  uint64_t v39 = v38;
  uint64_t v158 = v32;
  sub_1000A7CD4((uint64_t)v32, type metadata accessor for MagicPairingSettingsRecord);
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v155 = sub_10009914C();
  *(void *)(v36 + 64) = v155;
  *(void *)(v36 + 32) = v37;
  *(void *)(v36 + 40) = v39;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Remove magic device record: %@", 30LL, 2LL, v36);
  swift_bridgeObjectRelease(v36);
  uint64_t v157 = a3;
  uint64_t v40 = sub_10013A76C();
  uint64_t v41 = *(int *)(v171 + 24);
  uint64_t v156 = a1;
  uint64_t v42 = (uint64_t *)(a1 + v41);
  uint64_t v43 = *v42;
  uint64_t v162 = v42[1];
  uint64_t v163 = v43;
  if (qword_100234B70 != -1) {
    swift_once(&qword_100234B70, sub_1000CAF84);
  }
  uint64_t v44 = v165;
  uint64_t v45 = sub_100098D58(v165, (uint64_t)qword_10023DD70);
  uint64_t v46 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v19, v45, v44);
  uint64_t v47 = objc_autoreleasePoolPush();
  uint64_t v49 = URL.path.getter(v48);
  uint64_t v51 = v50;
  uint64_t v52 = v164;
  URL.appendingPathComponent(_:)(v49);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v168;
  URL.appendingPathComponent(_:)(v163);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v52, v44);
  objc_autoreleasePoolPop(v47);
  uint64_t v55 = objc_autoreleasePoolPush();
  __chkstk_darwin(v55);
  *(&v135 - 2) = (uint64_t)v53;
  *(&v135 - 1) = v40;
  uint64_t v56 = v169;
  OS_dispatch_queue.sync<A>(execute:)(v169, sub_10018A7D4, &v135 - 4, v167);
  objc_autoreleasePoolPop(v55);
  v54(v53, v44);
  swift_release(v40);
  v54(v19, v44);
  uint64_t v57 = v171;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v170 + 48))(v56, 1LL, v171) == 1)
  {
    uint64_t v58 = sub_100099358((uint64_t)v56, (uint64_t *)&unk_100235810);
    uint64_t v59 = static os_log_type_t.error.getter(v58);
    uint64_t v60 = qword_10023DFC8;
    uint64_t v61 = swift_allocObject(v154, 72LL, 7LL);
    *(_OWORD *)(v61 + 16) = v153;
    uint64_t v62 = (uint64_t)v158;
    sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v63 = sub_1000CB0DC();
    uint64_t v65 = v64;
    sub_1000A7CD4(v62, type metadata accessor for MagicPairingSettingsRecord);
    unint64_t v66 = v155;
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 64) = v66;
    *(void *)(v61 + 32) = v63;
    *(void *)(v61 + 40) = v65;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v60, "Magic Record not found to remove: %@", 36LL, 2LL, v61);
    swift_bridgeObjectRelease(v61);
    sub_1000BFB2C(0LL, v160, v159, v161);
  }

  else
  {
    uint64_t v67 = v151;
    sub_1000C998C((uint64_t)v56, v151, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v68 = objc_autoreleasePoolPush();
    uint64_t v69 = (uint64_t *)(v67 + *(int *)(v57 + 20));
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    sub_1000991CC(*v69, v71);
    sub_100118B60(v70, v71);
    Class isa = v72;
    sub_100099394(v70, v71);
    uint64_t v74 = v138;
    sub_1000A7C90(v67, v138, type metadata accessor for MagicPairingSettingsRecord);
    if (!isa) {
      Class isa = sub_1000A33B8(v74).super.isa;
    }
    sub_1000A7CD4(v74, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v75 = (uint64_t)v152;
    Class v172 = isa;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v68);
    id v76 = -[objc_class recordID](isa, "recordID");

    uint64_t v77 = objc_autoreleasePoolPush();
    uint64_t v78 = *v69;
    unint64_t v79 = v69[1];
    sub_1000991CC(*v69, v79);
    sub_100118B60(v78, v79);
    Class v81 = v80;
    sub_100099394(v78, v79);
    uint64_t v82 = v139;
    sub_1000A7C90(v67, v139, type metadata accessor for MagicPairingSettingsRecord);
    uint64_t v169 = v69;
    if (!v81) {
      Class v81 = sub_1000A33B8(v82).super.isa;
    }
    sub_1000A7CD4(v82, type metadata accessor for MagicPairingSettingsRecord);
    Class v172 = v81;
    sub_1000CEB74((id *)&v172);
    objc_autoreleasePoolPop(v77);
    uint64_t v84 = CKRecord.recordType.getter(v83);
    uint64_t v86 = v85;

    uint64_t v87 = v84;
    uint64_t v88 = v157;
    sub_10014C090(v76, v87, v86, v140 & 1);

    uint64_t v89 = v86;
    uint64_t v90 = v88;
    swift_bridgeObjectRelease(v89);
    uint64_t v91 = v144;
    uint64_t v92 = v141;
    uint64_t v93 = v146;
    (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v141, v67, v146);
    uint64_t v94 = (uint64_t *)(v67 + *(int *)(v171 + 24));
    uint64_t v96 = *v94;
    uint64_t v95 = v94[1];
    uint64_t v97 = swift_bridgeObjectRetain(v95);
    uint64_t v98 = v142;
    uint64_t v99 = Date.init()(v97);
    double v100 = Date.timeIntervalSince1970.getter(v99);
    (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v147);
    *(_BYTE *)uint64_t v75 = 1;
    strcpy((char *)(v75 + 8), "MagicSettings");
    *(_WORD *)(v75 + 22) = -4864;
    double v101 = (int *)v143;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v75 + *(int *)(v143 + 24), v92, v93);
    uint64_t v102 = (void *)(v75 + v101[7]);
    *uint64_t v102 = v96;
    v102[1] = v95;
    *(double *)(v75 + v101[8]) = v100;
    *(_OWORD *)(v75 + v101[9]) = xmmword_1001A9700;
    uint64_t v103 = objc_autoreleasePoolPush();
    sub_10015802C(v90, v75);
    objc_autoreleasePoolPop(v103);
    uint64_t v104 = (void *)sub_10013B740();
    uint64_t v105 = (void *)v104[9];
    unint64_t v106 = v148;
    *uint64_t v148 = v105;
    uint64_t v107 = v149;
    uint64_t v108 = v150;
    (*(void (**)(void *, void, uint64_t))(v149 + 104))( v106,  enum case for DispatchPredicate.notOnQueue(_:),  v150);
    id v109 = v105;
    LOBYTE(v96) = _dispatchPreconditionTest(_:)(v106);
    (*(void (**)(void *, uint64_t))(v107 + 8))(v106, v108);
    if ((v96 & 1) != 0)
    {
      OS_dispatch_queue.sync<A>(execute:)(&v172, sub_100187664, v104, &type metadata for Bool);
      uint64_t v110 = swift_unknownObjectRelease(v104);
      if ((v172 & 1) != 0)
      {
        uint64_t v111 = sub_10013B740();
        uint64_t v112 = objc_autoreleasePoolPush();
        uint64_t v113 = *v169;
        unint64_t v114 = v169[1];
        sub_1000991CC(*v169, v114);
        sub_100118B60(v113, v114);
        Class v116 = v115;
        sub_100099394(v113, v114);
        uint64_t v117 = v136;
        sub_1000A7C90(v67, v136, type metadata accessor for MagicPairingSettingsRecord);
        if (!v116) {
          Class v116 = sub_1000A33B8(v117).super.isa;
        }
        sub_1000A7CD4(v117, type metadata accessor for MagicPairingSettingsRecord);
        Class v172 = v116;
        sub_1000CEB74((id *)&v172);
        objc_autoreleasePoolPop(v112);
        id v118 = -[objc_class recordID](v116, "recordID");

        uint64_t v119 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
        swift_weakInit(v119 + 16, v157);
        uint64_t v120 = (uint64_t)v158;
        sub_1000A7C90(v67, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v121 = *(unsigned __int8 *)(v170 + 80);
        uint64_t v122 = (v121 + 16) & ~v121;
        unint64_t v123 = (v137 + v122 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v124 = swift_allocObject(&unk_100210878, v123 + 8, v121 | 7);
        sub_1000C998C(v120, v124 + v122, type metadata accessor for MagicPairingSettingsRecord);
        *(void *)(v124 + v123) = v119;
        uint64_t v125 = swift_allocObject(&unk_1002108A0, 49LL, 7LL);
        *(void *)(v125 + 16) = v111;
        *(void *)(v125 + 24) = v118;
        *(void *)(v125 + 32) = sub_100187680;
        *(void *)(v125 + 40) = v124;
        *(_BYTE *)(v125 + 48) = 1;
        swift_retain(v119);
        swift_unknownObjectRetain(v111);
        id v126 = v118;
        swift_retain(v124);
        sub_100104BA4((uint64_t)sub_10018749C, v125);
        swift_release(v119);
        swift_release(v124);
        swift_unknownObjectRelease(v111);

        swift_release(v125);
      }

      else
      {
        uint64_t v127 = static os_log_type_t.error.getter(v110);
        uint64_t v128 = qword_10023DFC8;
        uint64_t v129 = swift_allocObject(v154, 72LL, 7LL);
        *(_OWORD *)(v129 + 16) = v153;
        uint64_t v130 = (uint64_t)v158;
        sub_1000A7C90(v156, (uint64_t)v158, type metadata accessor for MagicPairingSettingsRecord);
        uint64_t v131 = sub_1000CB0DC();
        uint64_t v133 = v132;
        sub_1000A7CD4(v130, type metadata accessor for MagicPairingSettingsRecord);
        unint64_t v134 = v155;
        *(void *)(v129 + 56) = &type metadata for String;
        *(void *)(v129 + 64) = v134;
        *(void *)(v129 + 32) = v131;
        *(void *)(v129 + 40) = v133;
        os_log(_:dso:log:_:_:)( v127,  &_mh_execute_header,  v128,  "CloudCoordinator not available. Defer deleting magic record - %@",  64LL,  2LL,  v129);
        swift_bridgeObjectRelease(v129);
      }

      sub_1000BFB2C(0LL, v160, v159, v161);
      sub_1000A7CD4(v75, type metadata accessor for BTDeferredRecord);
      sub_1000A7CD4(v67, type metadata accessor for MagicPairingSettingsRecord);
    }

    else
    {
      __break(1u);
      swift_release(v161);
      swift_release(v160);
      objc_autoreleasePoolPop(v104);
      __break(1u);
    }
  }

void sub_100183AB8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v145 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v142 = *(void *)(v9 - 8);
  uint64_t v143 = v9;
  __chkstk_darwin(v9);
  uint64_t v141 = (uint64_t *)((char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  uint64_t v135 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for UUID(0LL);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v136 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v136);
  uint64_t v144 = (uint64_t *)((char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_1002108C8, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  uint64_t v148 = &type metadata for AudioAccessoryFeatures;
  unint64_t v149 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v22 = isFeatureEnabled(_:)(aBlock);
  uint64_t v23 = sub_10009A498(aBlock);
  if ((v22 & 1) == 0)
  {
    unint64_t v90 = sub_1000DB8A4();
    uint64_t v91 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v90, 0LL, 0LL);
    *uint64_t v92 = 0x8000000000000038LL;
    sub_1000BFB2C(v91, a3, a4, a5);
    swift_errorRelease(v91);
    uint64_t v93 = v21;
LABEL_20:
    swift_release(v93);
    return;
  }

  uint64_t v125 = v13;
  uint64_t v126 = a4;
  uint64_t v123 = a3;
  uint64_t v124 = a5;
  uint64_t v128 = v21;
  uint64_t v24 = static os_log_type_t.default.getter(v23);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v25 = qword_10023DFC8;
  uint64_t v122 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v26 = swift_allocObject(v122, 72LL, 7LL);
  __int128 v121 = xmmword_1001A5EA0;
  *(_OWORD *)(v26 + 16) = xmmword_1001A5EA0;
  uint64_t v27 = a1;
  id v28 = [v27 description];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  *(void *)(v26 + 56) = &type metadata for String;
  unint64_t v120 = sub_10009914C();
  *(void *)(v26 + 64) = v120;
  *(void *)(v26 + 32) = v29;
  *(void *)(v26 + 40) = v31;
  os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Remove AADeviceRecord: %@", 25LL, 2LL, v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v32 = sub_10013A76C();
  id v127 = v27;
  uint64_t v33 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v27[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  if (qword_100234BF8 != -1) {
    swift_once(&qword_100234BF8, sub_100113FD8);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DF40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, &qword_100236E48, (uint64_t)sub_100166F6C);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v94 = *(void **)(v145 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v95 = (void *)swift_allocObject(&unk_1002108F0, 40LL, 7LL);
    id v96 = v127;
    v95[2] = v127;
    v95[3] = sub_10018A570;
    uint64_t v97 = v128;
    v95[4] = v128;
    unint64_t v149 = (unint64_t)sub_10018A860;
    uint64_t v150 = v95;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    uint64_t v148 = (ValueMetadata *)&unk_100210908;
    uint64_t v98 = _Block_copy(aBlock);
    id v99 = v96;
    id v100 = v94;
    uint64_t v101 = swift_retain(v97);
    uint64_t v102 = v129;
    static DispatchQoS.unspecified.getter(v101);
    uint64_t v146 = _swiftEmptyArrayStorage;
    uint64_t v103 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v104 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v105 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v106 = v132;
    uint64_t v107 = v104;
    uint64_t v108 = v134;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v146, v107, v105, v134, v103);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v102, v106, v98);
    _Block_release(v98);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v108);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v102, v131);
    id v109 = v150;
    swift_release(v97);
    uint64_t v93 = v109;
    goto LABEL_20;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3964((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v144;
  aBlock[0] = isa;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  uint64_t v144 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3964((uint64_t)v51).super.isa;
  }

  aBlock[0] = v50;
  sub_100116DE8(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v145;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v137;
  uint64_t v58 = v125;
  uint64_t v59 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))( v125,  &v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier],  v139);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v135;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v63, v140);
  *(_BYTE *)uint64_t v44 = 1;
  strcpy((char *)v44 + 8, "AADeviceRecord");
  *((_BYTE *)v44 + 23) = -18;
  unint64_t v66 = (int *)v136;
  (*(void (**)(_BYTE *, char *, uint64_t))(v57 + 32))((_BYTE *)v44 + *(int *)(v136 + 24), v58, v59);
  uint64_t v67 = (uint64_t *)((char *)v44 + v66[7]);
  void *v67 = v61;
  v67[1] = v60;
  *(double *)((char *)v44 + v66[8]) = v65;
  *(_OWORD *)((char *)v44 + v66[9]) = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v56, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  unint64_t v71 = v141;
  uint64_t v72 = v142;
  void *v141 = v70;
  uint64_t v73 = v143;
  (*(void (**)(void *, void, uint64_t))(v72 + 104))( v71,  enum case for DispatchPredicate.notOnQueue(_:),  v143);
  id v74 = v70;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v71);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v75 = v126;
  if ((v59 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v76 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v77 = sub_10013B740();
      uint64_t v78 = objc_autoreleasePoolPush();
      uint64_t v79 = *v144;
      unint64_t v80 = v144[1];
      sub_1000991CC(*v144, v80);
      sub_100118B60(v79, v80);
      Class v82 = v81;
      sub_100099394(v79, v80);
      if (!v82)
      {
        uint64_t v83 = v36;
        Class v82 = sub_1000A3964((uint64_t)v83).super.isa;
      }

      aBlock[0] = v82;
      sub_100116DE8(aBlock);
      objc_autoreleasePoolPop(v78);
      id v84 = -[objc_class recordID](v82, "recordID");

      uint64_t v85 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v85 + 16, v145);
      uint64_t v86 = swift_allocObject(&unk_100210940, 32LL, 7LL);
      *(void *)(v86 + 16) = v36;
      *(void *)(v86 + 24) = v85;
      uint64_t v87 = swift_allocObject(&unk_100210968, 49LL, 7LL);
      *(void *)(v87 + 16) = v77;
      *(void *)(v87 + 24) = v84;
      *(void *)(v87 + 32) = sub_10018A870;
      *(void *)(v87 + 40) = v86;
      *(_BYTE *)(v87 + 48) = 1;
      uint64_t v88 = v36;
      swift_retain(v85);
      swift_unknownObjectRetain(v77);
      id v89 = v84;
      swift_retain(v86);
      sub_100104BA4((uint64_t)sub_10018749C, v87);
      swift_unknownObjectRelease(v77);

      swift_release(v85);
      swift_release(v86);
      swift_release(v87);
    }

    else
    {
      uint64_t v110 = static os_log_type_t.error.getter(v76);
      uint64_t v111 = qword_10023DFC8;
      uint64_t v112 = swift_allocObject(v122, 72LL, 7LL);
      *(_OWORD *)(v112 + 16) = v121;
      id v113 = v127;
      id v114 = [v113 description];
      uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      uint64_t v117 = v116;

      unint64_t v118 = v120;
      *(void *)(v112 + 56) = &type metadata for String;
      *(void *)(v112 + 64) = v118;
      *(void *)(v112 + 32) = v115;
      *(void *)(v112 + 40) = v117;
      os_log(_:dso:log:_:_:)( v110,  &_mh_execute_header,  v111,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v112);
      swift_bridgeObjectRelease(v112);
    }

    sub_1000BFB2C(0LL, v123, v75, v124);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v93 = v128;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v124);
  swift_release(v123);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

void sub_100184640(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t *)((char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  __chkstk_darwin(v11);
  uint64_t v137 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v142 = type metadata accessor for UUID(0LL);
  uint64_t v139 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v138);
  uint64_t v146 = (uint64_t *)((char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v136 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v135 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v134 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v22 = (void *)swift_allocObject(&unk_100210990, 40LL, 7LL);
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  uint64_t v150 = &type metadata for AudioAccessoryFeatures;
  unint64_t v151 = sub_10009E740();
  LOBYTE(aBlock[0]) = 0;
  swift_retain(a3);
  swift_retain(a5);
  char v23 = isFeatureEnabled(_:)(aBlock);
  uint64_t v24 = sub_10009A498(aBlock);
  if ((v23 & 1) == 0)
  {
    unint64_t v92 = sub_1000DB8A4();
    uint64_t v93 = swift_allocError(&type metadata for DeviceStore.DeviceStoreError, v92, 0LL, 0LL);
    *uint64_t v94 = 0x8000000000000038LL;
    sub_1000BFB2C(v93, a3, a4, a5);
    swift_errorRelease(v93);
    uint64_t v95 = v22;
LABEL_20:
    swift_release(v95);
    return;
  }

  id v127 = v14;
  uint64_t v128 = a4;
  uint64_t v125 = a3;
  uint64_t v126 = a5;
  uint64_t v130 = v22;
  uint64_t v25 = static os_log_type_t.default.getter(v24);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v26 = qword_10023DFC8;
  uint64_t v124 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v27 = swift_allocObject(v124, 72LL, 7LL);
  __int128 v123 = xmmword_1001A5EA0;
  *(_OWORD *)(v27 + 16) = xmmword_1001A5EA0;
  id v28 = a1;
  id v29 = [v28 description];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  *(void *)(v27 + 56) = &type metadata for String;
  unint64_t v122 = sub_10009914C();
  *(void *)(v27 + 64) = v122;
  *(void *)(v27 + 32) = v30;
  *(void *)(v27 + 40) = v32;
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Remove AAProxCardsRecord: %@", 28LL, 2LL, v27);
  swift_bridgeObjectRelease(v27);
  uint64_t v33 = v147;
  uint64_t v34 = sub_10013A76C();
  id v129 = v28;
  uint64_t v35 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v36 = *(void *)&v28[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  if (qword_100234B40 != -1) {
    swift_once(&qword_100234B40, sub_10009F940);
  }
  uint64_t v37 = sub_100098D58(v18, (uint64_t)qword_10023DCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v37, v18);
  uint64_t v38 = (char *)sub_100138608(v35, v36, (uint64_t)v21, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (!v38)
  {
    id v96 = *(void **)(v33 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    uint64_t v97 = (void *)swift_allocObject(&unk_1002109B8, 40LL, 7LL);
    id v98 = v129;
    v97[2] = v129;
    v97[3] = sub_10018A570;
    id v99 = v130;
    v97[4] = v130;
    unint64_t v151 = (unint64_t)sub_10018A860;
    uint64_t v152 = v97;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000F2C54;
    uint64_t v150 = (ValueMetadata *)&unk_1002109D0;
    id v100 = _Block_copy(aBlock);
    id v101 = v98;
    id v102 = v96;
    uint64_t v103 = swift_retain(v99);
    uint64_t v104 = v131;
    static DispatchQoS.unspecified.getter(v103);
    uint64_t v148 = _swiftEmptyArrayStorage;
    uint64_t v105 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v106 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v107 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v108 = v134;
    uint64_t v109 = v106;
    uint64_t v110 = v136;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v148, v109, v107, v136, v105);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v104, v108, v100);
    _Block_release(v100);

    (*(void (**)(char *, uint64_t))(v135 + 8))(v108, v110);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v104, v133);
    uint64_t v111 = v152;
    swift_release(v99);
    uint64_t v95 = v111;
    goto LABEL_20;
  }

  uint64_t v39 = objc_autoreleasePoolPush();
  unint64_t v40 = (uint64_t *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  uint64_t v41 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata];
  unint64_t v42 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata + 8];
  sub_1000991CC(v41, v42);
  sub_100118B60(v41, v42);
  Class isa = v43;
  sub_100099394(v41, v42);
  if (!isa)
  {
    id v45 = v38;
    Class isa = sub_1000A3798((uint64_t)v45).super.isa;
  }

  uint64_t v46 = (uint64_t)v146;
  aBlock[0] = isa;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v39);
  id v47 = -[objc_class recordID](isa, "recordID");

  unint64_t v48 = objc_autoreleasePoolPush();
  uint64_t v49 = *v40;
  unint64_t v50 = v40[1];
  uint64_t v146 = v40;
  sub_1000991CC(v49, v50);
  sub_100118B60(v49, v50);
  Class v52 = v51;
  sub_100099394(v49, v50);
  if (!v52)
  {
    uint64_t v53 = v38;
    Class v52 = sub_1000A3798((uint64_t)v53).super.isa;
  }

  aBlock[0] = v52;
  sub_1000A233C((unint64_t)aBlock);
  objc_autoreleasePoolPop(v48);
  uint64_t v55 = CKRecord.recordType.getter(v54);
  uint64_t v57 = v56;

  uint64_t v58 = v147;
  sub_10014C090(v47, v55, v57, 0);

  swift_bridgeObjectRelease(v57);
  uint64_t v59 = v139;
  uint64_t v60 = v127;
  uint64_t v61 = v142;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))( v127,  &v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier],  v142);
  uint64_t v63 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress];
  uint64_t v62 = *(void *)&v38[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress + 8];
  uint64_t v64 = swift_bridgeObjectRetain(v62);
  double v65 = v137;
  uint64_t v66 = Date.init()(v64);
  double v67 = Date.timeIntervalSince1970.getter(v66);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v65, v141);
  *(_BYTE *)uint64_t v46 = 1;
  *(void *)(v46 + 8) = 0xD000000000000011LL;
  *(void *)(v46 + 16) = 0x80000001001D2A80LL;
  uint64_t v68 = (int *)v138;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v46 + *(int *)(v138 + 24), v60, v61);
  uint64_t v69 = (void *)(v46 + v68[7]);
  void *v69 = v63;
  v69[1] = v62;
  *(double *)(v46 + v68[8]) = v67;
  *(_OWORD *)(v46 + v68[9]) = xmmword_1001A9700;
  uint64_t v70 = objc_autoreleasePoolPush();
  sub_10015802C(v58, v46);
  objc_autoreleasePoolPop(v70);
  unint64_t v71 = (void *)sub_10013B740();
  uint64_t v72 = (void *)v71[9];
  uint64_t v73 = v143;
  uint64_t v74 = v144;
  *uint64_t v143 = v72;
  uint64_t v75 = v145;
  (*(void (**)(void *, void, uint64_t))(v74 + 104))( v73,  enum case for DispatchPredicate.notOnQueue(_:),  v145);
  id v76 = v72;
  LOBYTE(v61) = _dispatchPreconditionTest(_:)(v73);
  (*(void (**)(void *, uint64_t))(v74 + 8))(v73, v75);
  uint64_t v77 = v128;
  if ((v61 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v71, &type metadata for Bool);
    uint64_t v78 = swift_unknownObjectRelease(v71);
    if ((aBlock[0] & 1) != 0)
    {
      uint64_t v79 = sub_10013B740();
      unint64_t v80 = objc_autoreleasePoolPush();
      uint64_t v81 = *v146;
      unint64_t v82 = v146[1];
      sub_1000991CC(*v146, v82);
      sub_100118B60(v81, v82);
      Class v84 = v83;
      sub_100099394(v81, v82);
      if (!v84)
      {
        uint64_t v85 = v38;
        Class v84 = sub_1000A3798((uint64_t)v85).super.isa;
      }

      aBlock[0] = v84;
      sub_1000A233C((unint64_t)aBlock);
      objc_autoreleasePoolPop(v80);
      id v86 = -[objc_class recordID](v84, "recordID");

      uint64_t v87 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v87 + 16, v147);
      uint64_t v88 = swift_allocObject(&unk_100210A08, 32LL, 7LL);
      *(void *)(v88 + 16) = v38;
      *(void *)(v88 + 24) = v87;
      uint64_t v89 = swift_allocObject(&unk_100210A30, 49LL, 7LL);
      *(void *)(v89 + 16) = v79;
      *(void *)(v89 + 24) = v86;
      *(void *)(v89 + 32) = sub_10018A874;
      *(void *)(v89 + 40) = v88;
      *(_BYTE *)(v89 + 48) = 1;
      unint64_t v90 = v38;
      swift_retain(v87);
      swift_unknownObjectRetain(v79);
      id v91 = v86;
      swift_retain(v88);
      sub_100104BA4((uint64_t)sub_10018749C, v89);
      swift_unknownObjectRelease(v79);

      swift_release(v87);
      swift_release(v88);
      swift_release(v89);
    }

    else
    {
      uint64_t v112 = static os_log_type_t.error.getter(v78);
      uint64_t v113 = qword_10023DFC8;
      uint64_t v114 = swift_allocObject(v124, 72LL, 7LL);
      *(_OWORD *)(v114 + 16) = v123;
      id v115 = v129;
      id v116 = [v115 description];
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
      uint64_t v119 = v118;

      unint64_t v120 = v122;
      *(void *)(v114 + 56) = &type metadata for String;
      *(void *)(v114 + 64) = v120;
      *(void *)(v114 + 32) = v117;
      *(void *)(v114 + 40) = v119;
      os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v113,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v114);
      swift_bridgeObjectRelease(v114);
    }

    sub_1000BFB2C(0LL, v125, v77, v126);

    sub_1000A7CD4(v46, type metadata accessor for BTDeferredRecord);
    uint64_t v95 = v130;
    goto LABEL_20;
  }

  __break(1u);
  swift_release(v126);
  swift_release(v125);
  objc_autoreleasePoolPop(v71);
  __break(1u);
}

void sub_1001851B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a2;
  uint64_t v9 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v135 = *(void *)(v9 - 8);
  uint64_t v136 = v9;
  __chkstk_darwin(v9);
  uint64_t v134 = (uint64_t *)((char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v131 = *(void *)(v11 - 8);
  uint64_t v132 = v11;
  __chkstk_darwin(v11);
  id v127 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v133 = type metadata accessor for UUID(0LL);
  uint64_t v130 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = type metadata accessor for BTDeferredRecord(0LL);
  __chkstk_darwin(v129);
  uint64_t v137 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v123 = (uint64_t *)type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v122 = *(v123 - 1);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)swift_allocObject(&unk_100210A58, 40LL, 7LL);
  v21[2] = a3;
  v21[3] = a4;
  uint64_t v124 = a4;
  uint64_t v138 = v21;
  v21[4] = a5;
  uint64_t v126 = a3;
  swift_retain(a3);
  uint64_t v125 = a5;
  uint64_t v22 = swift_retain(a5);
  uint64_t v23 = static os_log_type_t.default.getter(v22);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v24 = qword_10023DFC8;
  uint64_t v117 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v25 = swift_allocObject(v117, 72LL, 7LL);
  __int128 v116 = xmmword_1001A5EA0;
  *(_OWORD *)(v25 + 16) = xmmword_1001A5EA0;
  uint64_t v26 = a1;
  id v27 = [v26 description];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v115 = sub_10009914C();
  *(void *)(v25 + 64) = v115;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Remove HMDeviceCloudRecord: %@", 30LL, 2LL, v25);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v139;
  uint64_t v32 = sub_10013A76C();
  uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v34 = *(void *)&v26[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  if (qword_100234BC0 != -1) {
    swift_once(&qword_100234BC0, sub_1000DD8E4);
  }
  uint64_t v35 = sub_100098D58(v17, (uint64_t)qword_10023DE08);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v35, v17);
  uint64_t v36 = (char *)sub_100138608(v33, v34, (uint64_t)v20, (uint64_t *)&unk_100236E78, (uint64_t)sub_100187144);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v36)
  {
    uint64_t v89 = *(void **)(v31 + OBJC_IVAR____TtC15audioaccessoryd11DeviceStore_clientQueue);
    unint64_t v90 = (void *)swift_allocObject(&unk_100210A80, 40LL, 7LL);
    v90[2] = v26;
    v90[3] = sub_10018A570;
    id v91 = v138;
    v90[4] = v138;
    aBlock[4] = sub_10018A860;
    uint64_t v142 = v90;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000F2C54;
    void aBlock[3] = &unk_100210A98;
    unint64_t v92 = _Block_copy(aBlock);
    uint64_t v93 = v26;
    id v94 = v89;
    uint64_t v95 = swift_retain(v91);
    id v96 = v118;
    static DispatchQoS.unspecified.getter(v95);
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v97 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v98 = sub_100098CD8((uint64_t *)&unk_100235790);
    uint64_t v99 = sub_1000A4318( (unint64_t *)&qword_100236EF0,  (uint64_t *)&unk_100235790,  (uint64_t)&protocol conformance descriptor for [A]);
    id v100 = v121;
    uint64_t v101 = v98;
    id v102 = v123;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v140, v101, v99, v123, v97);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v96, v100, v92);
    _Block_release(v92);

    (*(void (**)(char *, uint64_t *))(v122 + 8))(v100, v102);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v96, v120);
    uint64_t v103 = v142;
    swift_release(v91);
    uint64_t v104 = v103;
LABEL_18:
    swift_release(v104);
    return;
  }

  uint64_t v37 = objc_autoreleasePoolPush();
  uint64_t v38 = (uint64_t *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  uint64_t v39 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata];
  unint64_t v40 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata + 8];
  sub_1000991CC(v39, v40);
  sub_100118B60(v39, v40);
  Class isa = v41;
  sub_100099394(v39, v40);
  if (!isa)
  {
    uint64_t v43 = v36;
    Class isa = sub_1000A3774((uint64_t)v43).super.isa;
  }

  uint64_t v44 = v137;
  aBlock[0] = isa;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v37);
  id v45 = -[objc_class recordID](isa, "recordID");

  uint64_t v46 = objc_autoreleasePoolPush();
  uint64_t v47 = *v38;
  unint64_t v48 = v38[1];
  __int128 v123 = v38;
  sub_1000991CC(v47, v48);
  sub_100118B60(v47, v48);
  Class v50 = v49;
  sub_100099394(v47, v48);
  if (!v50)
  {
    uint64_t v51 = v36;
    Class v50 = sub_1000A3774((uint64_t)v51).super.isa;
  }

  uint64_t v137 = v26;
  aBlock[0] = v50;
  sub_1000E329C(aBlock);
  objc_autoreleasePoolPop(v46);
  uint64_t v53 = CKRecord.recordType.getter(v52);
  uint64_t v55 = v54;

  uint64_t v56 = v31;
  sub_10014C090(v45, v53, v55, 0);

  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v130;
  uint64_t v58 = v128;
  uint64_t v59 = v133;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))( v128,  &v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier],  v133);
  uint64_t v61 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  uint64_t v60 = *(void *)&v36[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress + 8];
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  uint64_t v63 = v127;
  uint64_t v64 = Date.init()(v62);
  double v65 = Date.timeIntervalSince1970.getter(v64);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v63, v132);
  *uint64_t v44 = 1;
  *((void *)v44 + 1) = 0xD000000000000013LL;
  *((void *)v44 + 2) = 0x80000001001CB4E0LL;
  uint64_t v66 = (int *)v129;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v44[*(int *)(v129 + 24)], v58, v59);
  double v67 = &v44[v66[7]];
  *(void *)double v67 = v61;
  *((void *)v67 + 1) = v60;
  *(double *)&v44[v66[8]] = v65;
  *(_OWORD *)&v44[v66[9]] = xmmword_1001A9700;
  uint64_t v68 = objc_autoreleasePoolPush();
  sub_10015802C(v31, (uint64_t)v44);
  objc_autoreleasePoolPop(v68);
  uint64_t v69 = (void *)sub_10013B740();
  uint64_t v70 = (void *)v69[9];
  uint64_t v72 = v134;
  uint64_t v71 = v135;
  *uint64_t v134 = v70;
  uint64_t v73 = v136;
  (*(void (**)(void *, void, uint64_t))(v71 + 104))( v72,  enum case for DispatchPredicate.notOnQueue(_:),  v136);
  id v74 = v70;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v72);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v73);
  if ((v57 & 1) != 0)
  {
    OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100187664, v69, &type metadata for Bool);
    uint64_t v75 = swift_unknownObjectRelease(v69);
    if (((uint64_t)aBlock[0] & 1) != 0)
    {
      uint64_t v76 = sub_10013B740();
      uint64_t v77 = objc_autoreleasePoolPush();
      uint64_t v78 = *v123;
      unint64_t v79 = v123[1];
      sub_1000991CC(*v123, v79);
      sub_100118B60(v78, v79);
      Class v81 = v80;
      sub_100099394(v78, v79);
      if (!v81)
      {
        unint64_t v82 = v36;
        Class v81 = sub_1000A3774((uint64_t)v82).super.isa;
      }

      aBlock[0] = v81;
      sub_1000E329C(aBlock);
      objc_autoreleasePoolPop(v77);
      id v83 = -[objc_class recordID](v81, "recordID");

      uint64_t v84 = swift_allocObject(&unk_10020F900, 24LL, 7LL);
      swift_weakInit(v84 + 16, v56);
      uint64_t v85 = swift_allocObject(&unk_100210AD0, 32LL, 7LL);
      *(void *)(v85 + 16) = v36;
      *(void *)(v85 + 24) = v84;
      uint64_t v86 = swift_allocObject(&unk_100210AF8, 49LL, 7LL);
      *(void *)(v86 + 16) = v76;
      *(void *)(v86 + 24) = v83;
      *(void *)(v86 + 32) = sub_10018A878;
      *(void *)(v86 + 40) = v85;
      *(_BYTE *)(v86 + 48) = 1;
      uint64_t v87 = v36;
      swift_retain(v84);
      swift_unknownObjectRetain(v76);
      id v88 = v83;
      swift_retain(v85);
      sub_100104BA4((uint64_t)sub_10018749C, v86);
      swift_unknownObjectRelease(v76);

      swift_release(v84);
      swift_release(v85);
      swift_release(v86);
    }

    else
    {
      uint64_t v105 = static os_log_type_t.error.getter(v75);
      uint64_t v106 = qword_10023DFC8;
      uint64_t v107 = swift_allocObject(v117, 72LL, 7LL);
      *(_OWORD *)(v107 + 16) = v116;
      uint64_t v108 = v137;
      id v109 = [v108 description];
      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
      uint64_t v112 = v111;

      unint64_t v113 = v115;
      *(void *)(v107 + 56) = &type metadata for String;
      *(void *)(v107 + 64) = v113;
      *(void *)(v107 + 32) = v110;
      *(void *)(v107 + 40) = v112;
      os_log(_:dso:log:_:_:)( v105,  &_mh_execute_header,  v106,  "CloudCoordinator not available. Defer deleting record - %@",  58LL,  2LL,  v107);
      swift_bridgeObjectRelease(v107);
    }

    sub_1000BFB2C(0LL, v126, v124, v125);

    sub_1000A7CD4((uint64_t)v44, type metadata accessor for BTDeferredRecord);
    uint64_t v104 = v138;
    goto LABEL_18;
  }

  __break(1u);
  swift_release(v125);
  swift_release(v126);
  objc_autoreleasePoolPop(v69);
  __break(1u);
}

uint64_t sub_100185CA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100185D28( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  sub_10018A7FC,  sub_100181584,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000BFB2C,  sub_10018A7E8,  sub_100182174,  sub_10018A7D4,  (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100182E3C,  sub_100183AB8,  sub_100184640,  sub_1001851B8);
}

uint64_t sub_100185D28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void (*a10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a11)(void, uint64_t, uint64_t, uint64_t), void *a12, void (*a13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void *a14, void (*a15)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t), void (*a16)(void *, uint64_t, uint64_t, uint64_t, uint64_t), void (*a17)(void *, uint64_t, uint64_t, uint64_t, uint64_t), void (*a18)(void *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v180 = a7;
  uint64_t v185 = a5;
  uint64_t v159 = sub_100098CD8((uint64_t *)&unk_100235810);
  __chkstk_darwin(v159);
  uint64_t v162 = (uint64_t *)((char *)&v155 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v161 = type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v160 = *(void *)(v161 - 8);
  __chkstk_darwin(v161);
  uint64_t v158 = (uint64_t)&v155 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v164 = sub_100098CD8(&qword_100235828);
  __chkstk_darwin(v164);
  uint64_t v171 = (uint64_t *)((char *)&v155 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v166 = type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v165 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v163 = (char *)&v155 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = type metadata accessor for URL(0LL);
  uint64_t v178 = *(void *)(v28 - 8);
  uint64_t v179 = v28;
  __chkstk_darwin(v28);
  Class v176 = (char *)&v155 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v30);
  uint64_t v177 = (char *)&v155 - v31;
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)&v155 - v33;
  uint64_t v172 = sub_100098CD8(&qword_100235848);
  __chkstk_darwin(v172);
  v175 = (uint64_t *)((char *)&v155 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v36 = type metadata accessor for DeviceRecord(0LL);
  uint64_t v173 = *(void *)(v36 - 8);
  uint64_t v174 = v36;
  __chkstk_darwin(v36);
  uint64_t v167 = (char *)&v155 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v181 = a6;
  swift_retain_n(a6, 6LL);
  uint64_t v182 = a8;
  uint64_t v38 = swift_retain_n(a8, 6LL);
  uint64_t v39 = static os_log_type_t.default.getter(v38);
  if (qword_100234C28 != -1) {
    swift_once(&qword_100234C28, sub_10018A9E0);
  }
  uint64_t v170 = a11;
  uint64_t v40 = qword_10023DFC8;
  uint64_t v168 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v41 = swift_allocObject(v168, 112LL, 7LL);
  __int128 v157 = xmmword_1001A6F30;
  *(_OWORD *)(v41 + 16) = xmmword_1001A6F30;
  *(void *)(v41 + 56) = &type metadata for String;
  unint64_t v42 = sub_10009914C();
  *(void *)(v41 + 32) = a3;
  *(void *)(v41 + 40) = a4;
  *(void *)(v41 + 96) = &type metadata for String;
  *(void *)(v41 + 104) = v42;
  unint64_t v169 = v42;
  *(void *)(v41 + 64) = v42;
  *(void *)(v41 + 72) = a1;
  *(void *)(v41 + 80) = a2;
  swift_bridgeObjectRetain(a4);
  uint64_t v184 = a2;
  swift_bridgeObjectRetain(a2);
  os_log(_:dso:log:_:_:)( v39,  &_mh_execute_header,  v40,  "CloudSync: Remove device record type: %@ with address: %@",  57LL,  2LL,  v41);
  swift_bridgeObjectRelease(v41);
  uint64_t v43 = a3;
  uint64_t v183 = a1;
  if (a3 == 0x6552656369766544LL && a4 == 0xEC00000064726F63LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6552656369766544LL, 0xEC00000064726F63LL, a3, a4, 0LL) & 1) != 0)
  {
    uint64_t v44 = v34;
    uint64_t v171 = a9;
    uint64_t v45 = sub_10013A76C();
    if (qword_100234B30 != -1) {
      swift_once(&qword_100234B30, sub_100094AFC);
    }
    uint64_t v46 = v179;
    uint64_t v47 = sub_100098D58(v179, (uint64_t)qword_10023DCC0);
    uint64_t v48 = v178;
    (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v44, v47, v46);
    uint64_t v49 = objc_autoreleasePoolPush();
    uint64_t v51 = URL.path.getter(v50);
    uint64_t v53 = v52;
    uint64_t v54 = v176;
    URL.appendingPathComponent(_:)(v51);
    swift_bridgeObjectRelease(v53);
    uint64_t v55 = v177;
    URL.appendingPathComponent(_:)(v183);
    uint64_t v56 = *(void (**)(char *, uint64_t))(v48 + 8);
    v56(v54, v46);
    objc_autoreleasePoolPop(v49);
    uint64_t v57 = objc_autoreleasePoolPush();
    __chkstk_darwin(v57);
    *(&v155 - 2) = (uint64_t)v55;
    *(&v155 - 1) = v45;
    uint64_t v58 = v175;
    OS_dispatch_queue.sync<A>(execute:)(v175, v171, &v155 - 4, v172);
    objc_autoreleasePoolPop(v57);
    v56(v55, v46);
    swift_release(v45);
    v56(v44, v46);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v173 + 48))(v58, 1LL, v174) == 1)
    {
      uint64_t v59 = sub_100099358((uint64_t)v58, &qword_100235848);
      uint64_t v60 = static os_log_type_t.error.getter(v59);
      uint64_t v61 = qword_10023DFC8;
      uint64_t v62 = swift_allocObject(v168, 72LL, 7LL);
      *(_OWORD *)(v62 + 16) = xmmword_1001A5EA0;
      unint64_t v63 = v169;
      *(void *)(v62 + 56) = &type metadata for String;
      *(void *)(v62 + 64) = v63;
      *(void *)(v62 + 32) = v183;
      uint64_t v64 = v184;
      *(void *)(v62 + 40) = v184;
      swift_bridgeObjectRetain(v64);
      os_log(_:dso:log:_:_:)(v60, &_mh_execute_header, v61, "Device Record not found to remove: %@", 37LL, 2LL, v62);
LABEL_28:
      swift_bridgeObjectRelease(v62);
      uint64_t v110 = v180;
      uint64_t v89 = v181;
      uint64_t v111 = v181;
      uint64_t v90 = v182;
LABEL_29:
      v170(0LL, v111, v110, v90);
      goto LABEL_30;
    }

    uint64_t v66 = type metadata accessor for DeviceRecord;
    uint64_t v67 = (uint64_t)v58;
    uint64_t v68 = &v190;
LABEL_19:
    uint64_t v88 = *(v68 - 32);
    sub_1000C998C(v67, v88, v66);
    uint64_t v89 = v181;
    swift_retain(v181);
    uint64_t v90 = v182;
    swift_retain(v182);
    a10(v88, v185, v89, v180, v90);
    goto LABEL_20;
  }

  if (a3 == 0xD00000000000001ELL && a4 == 0x80000001001CABA0LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ELL, 0x80000001001CABA0LL, a3, a4, 0LL) & 1) != 0)
  {
    v175 = a12;
    uint64_t v69 = sub_10013A76C();
    if (qword_100234BC8 != -1) {
      swift_once(&qword_100234BC8, sub_1000E72E4);
    }
    uint64_t v70 = v179;
    uint64_t v71 = sub_100098D58(v179, (uint64_t)qword_10023DF00);
    uint64_t v72 = v178;
    (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v34, v71, v70);
    uint64_t v73 = objc_autoreleasePoolPush();
    uint64_t v75 = URL.path.getter(v74);
    uint64_t v77 = v76;
    uint64_t v78 = v176;
    URL.appendingPathComponent(_:)(v75);
    swift_bridgeObjectRelease(v77);
    unint64_t v79 = v177;
    URL.appendingPathComponent(_:)(v183);
    unint64_t v80 = *(void (**)(char *, uint64_t))(v72 + 8);
    v80(v78, v70);
    objc_autoreleasePoolPop(v73);
    Class v81 = objc_autoreleasePoolPush();
    __chkstk_darwin(v81);
    *(&v155 - 2) = (uint64_t)v79;
    *(&v155 - 1) = v69;
    unint64_t v82 = v171;
    OS_dispatch_queue.sync<A>(execute:)(v171, v175, &v155 - 4, v164);
    objc_autoreleasePoolPop(v81);
    v80(v79, v70);
    swift_release(v69);
    v80(v34, v70);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v165 + 48))(v82, 1LL, v166) == 1)
    {
      uint64_t v83 = sub_100099358((uint64_t)v82, &qword_100235828);
      uint64_t v84 = static os_log_type_t.error.getter(v83);
      uint64_t v85 = qword_10023DFC8;
      uint64_t v62 = swift_allocObject(v168, 72LL, 7LL);
      *(_OWORD *)(v62 + 16) = xmmword_1001A5EA0;
      unint64_t v86 = v169;
      *(void *)(v62 + 56) = &type metadata for String;
      *(void *)(v62 + 64) = v86;
      *(void *)(v62 + 32) = v183;
      uint64_t v87 = v184;
      *(void *)(v62 + 40) = v184;
      swift_bridgeObjectRetain(v87);
      os_log(_:dso:log:_:_:)( v84,  &_mh_execute_header,  v85,  "Support Info Record not found to remove: %@",  43LL,  2LL,  v62);
      goto LABEL_28;
    }

    a10 = a13;
    uint64_t v66 = type metadata accessor for DeviceSupportInformationRecord;
    uint64_t v67 = (uint64_t)v82;
    uint64_t v68 = &v189;
    goto LABEL_19;
  }

  if ((a3 != 0x746553636967614DLL || a4 != 0xED000073676E6974LL)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(0x746553636967614DLL, 0xED000073676E6974LL, a3, a4, 0LL) & 1) == 0)
  {
    uint64_t v114 = a1;
    uint64_t v115 = (uint64_t)v34;
    if (v43 == 0x6563697665444141LL && a4 == 0xEE0064726F636552LL
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6563697665444141LL, 0xEE0064726F636552LL, v43, a4, 0LL) & 1) != 0)
    {
      uint64_t v187 = &type metadata for AudioAccessoryFeatures;
      unint64_t v188 = sub_10009E740();
      LOBYTE(v186[0]) = 0;
      char v116 = isFeatureEnabled(_:)(v186);
      sub_10009A498(v186);
      uint64_t v89 = v181;
      uint64_t v90 = v182;
      if ((v116 & 1) != 0)
      {
        uint64_t v117 = sub_10013A76C();
        if (qword_100234BF8 != -1) {
          swift_once(&qword_100234BF8, sub_100113FD8);
        }
        uint64_t v118 = v179;
        uint64_t v119 = sub_100098D58(v179, (uint64_t)qword_10023DF40);
        uint64_t v120 = v178;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 16))(v115, v119, v118);
        uint64_t v121 = v184;
        uint64_t v122 = (void *)sub_100138608(v114, v184, v115, &qword_100236E48, (uint64_t)sub_100166F6C);
        swift_release(v117);
        uint64_t v123 = (*(uint64_t (**)(uint64_t, uint64_t))(v120 + 8))(v115, v118);
        if (v122) {
          goto LABEL_58;
        }
        uint64_t v132 = static os_log_type_t.error.getter(v123);
        uint64_t v133 = qword_10023DFC8;
        uint64_t v134 = swift_allocObject(v168, 72LL, 7LL);
        *(_OWORD *)(v134 + 16) = xmmword_1001A5EA0;
        unint64_t v135 = v169;
        *(void *)(v134 + 56) = &type metadata for String;
        *(void *)(v134 + 64) = v135;
        *(void *)(v134 + 32) = v114;
        *(void *)(v134 + 40) = v121;
        swift_bridgeObjectRetain(v121);
        os_log(_:dso:log:_:_:)( v132,  &_mh_execute_header,  v133,  "AADeviceRecord not found to remove: %@",  38LL,  2LL,  v134);
        goto LABEL_60;
      }
    }

    else
    {
      uint64_t v89 = v181;
      uint64_t v90 = v182;
      if ((v43 != 0xD000000000000011LL || a4 != 0x80000001001D2A80LL)
        && (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x80000001001D2A80LL, v43, a4, 0LL) & 1) == 0)
      {
        if (v43 != 0xD000000000000013LL || a4 != 0x80000001001CB4E0LL)
        {
          uint64_t v139 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x80000001001CB4E0LL, v43, a4, 0LL);
          if ((v139 & 1) == 0)
          {
            uint64_t v150 = static os_log_type_t.error.getter(v139);
            uint64_t v151 = qword_10023DFC8;
            uint64_t v152 = swift_allocObject(v168, 112LL, 7LL);
            *(_OWORD *)(v152 + 16) = v157;
            unint64_t v153 = v169;
            *(void *)(v152 + 56) = &type metadata for String;
            *(void *)(v152 + 64) = v153;
            *(void *)(v152 + 32) = v43;
            *(void *)(v152 + 40) = a4;
            *(void *)(v152 + 96) = &type metadata for String;
            *(void *)(v152 + 104) = v153;
            uint64_t v154 = v184;
            *(void *)(v152 + 72) = v114;
            *(void *)(v152 + 80) = v154;
            swift_bridgeObjectRetain(a4);
            swift_bridgeObjectRetain(v154);
            os_log(_:dso:log:_:_:)( v150,  &_mh_execute_header,  v151,  "Unknown record type: %@ for address: %@",  39LL,  2LL,  v152);
            uint64_t v149 = v152;
            goto LABEL_61;
          }
        }

        goto LABEL_54;
      }
    }

    uint64_t v187 = &type metadata for AudioAccessoryFeatures;
    unint64_t v188 = sub_10009E740();
    LOBYTE(v186[0]) = 0;
    char v125 = isFeatureEnabled(_:)(v186);
    sub_10009A498(v186);
    if ((v125 & 1) != 0)
    {
      uint64_t v126 = sub_10013A76C();
      if (qword_100234B40 != -1) {
        swift_once(&qword_100234B40, sub_10009F940);
      }
      uint64_t v127 = v179;
      uint64_t v128 = sub_100098D58(v179, (uint64_t)qword_10023DCE0);
      uint64_t v129 = v178;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 16))(v115, v128, v127);
      uint64_t v130 = v184;
      uint64_t v122 = (void *)sub_100138608(v114, v184, v115, (uint64_t *)&unk_100236E60, (uint64_t)sub_100186EC4);
      swift_release(v126);
      uint64_t v131 = (*(uint64_t (**)(uint64_t, uint64_t))(v129 + 8))(v115, v127);
      if (v122)
      {
        a16 = a17;
LABEL_58:
        swift_retain(v89);
        swift_retain(v90);
        a16(v122, v185, v89, v180, v90);

        swift_release_n(v89, 4LL);
        uint64_t v112 = v90;
        goto LABEL_31;
      }

      uint64_t v136 = static os_log_type_t.error.getter(v131);
      uint64_t v137 = qword_10023DFC8;
      uint64_t v134 = swift_allocObject(v168, 72LL, 7LL);
      *(_OWORD *)(v134 + 16) = xmmword_1001A5EA0;
      unint64_t v138 = v169;
      *(void *)(v134 + 56) = &type metadata for String;
      *(void *)(v134 + 64) = v138;
      *(void *)(v134 + 32) = v114;
      *(void *)(v134 + 40) = v130;
      swift_bridgeObjectRetain(v130);
      os_log(_:dso:log:_:_:)( v136,  &_mh_execute_header,  v137,  "AAProxCardsRecord not found to remove: %@",  41LL,  2LL,  v134);
      goto LABEL_60;
    }

uint64_t sub_100186EC4@<X0>(uint64_t *a1@<X8>)
{
  return sub_100187178( type metadata accessor for AAProxCardsRecord,  (unint64_t *)&unk_100235210,  (uint64_t)&protocol conformance descriptor for AAProxCardsRecord,  &qword_100236E70,  a1);
}

uint64_t sub_100186EF8( uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  id v11 = [(id)objc_opt_self(BTSystemConfiguration) isFirstUnlocked];
  if ((v11 & 1) != 0)
  {
    uint64_t v12 = Data.init(contentsOf:options:)(a1, 0LL);
    if (v5)
    {
      swift_errorRelease(v5);
      return 0LL;
    }

    else
    {
      uint64_t v15 = v12;
      unint64_t v16 = v13;
      uint64_t v17 = objc_autoreleasePoolPush();
      uint64_t v18 = sub_100133AA4(v15, v16, a2, a3, a4, a5);
      objc_autoreleasePoolPop(v17);
      sub_100099394(v15, v16);
    }
  }

  else
  {
    uint64_t v14 = static os_log_type_t.default.getter(v11);
    if (qword_100234C30 != -1) {
      swift_once(&qword_100234C30, sub_10018AA44);
    }
    os_log(_:dso:log:_:_:)( v14,  &_mh_execute_header,  qword_10023DFD0,  "record call failed because in device is in beforeFirstUnlock state",  66LL,  2LL,  _swiftEmptyArrayStorage);
    return 0LL;
  }

  return v18;
}

uint64_t sub_100187144@<X0>(uint64_t *a1@<X8>)
{
  return sub_100187178( type metadata accessor for HMDeviceCloudRecord,  &qword_100235D80,  (uint64_t)&protocol conformance descriptor for HMDeviceCloudRecord,  (uint64_t *)&unk_100236E88,  a1);
}

uint64_t sub_100187178@<X0>( uint64_t (*a1)(uint64_t)@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = sub_100186EF8(*(void *)(v5 + 16), a1, a2, a3, a4);
  if (!v6) {
    *a5 = result;
  }
  return result;
}

uint64_t sub_1001871B4(void *a1)
{
  return sub_10015BBA0(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_1001871D4(void *a1)
{
  return sub_10015BC60(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_1001871F4(void *a1)
{
  return sub_10015BD08(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_100187214()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100187238()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_100187264(uint64_t a1)
{
}

uint64_t sub_100187270()
{
  uint64_t v1 = *(void *)(v0 + 48);
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(*(void *)(v0 + 64));
  }

  swift_release(*(void *)(v0 + 80));
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t sub_1001872C0(uint64_t a1, uint64_t a2)
{
  return sub_100109A28(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9], v2[10]);
}

uint64_t sub_1001872F8()
{
  return sub_1000DA468();
}

uint64_t sub_100187310()
{
  uint64_t v1 = (int *)type metadata accessor for SoundProfileRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v9 = v0 + v4;
  sub_100099394(*(void *)(v0 + v4), *(void *)(v0 + v4 + 8));
  uint64_t v10 = v9 + v1[5];
  uint64_t v11 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);
  uint64_t v12 = v9 + v1[6];
  uint64_t v13 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8LL))(v12, v13);
  uint64_t v14 = v9 + v1[7];
  uint64_t v15 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8LL))(v14, v15);
  swift_release(*(void *)(v0 + v6));
  swift_release(*(void *)(v0 + v7 + 8));

  return swift_deallocObject(v0, v8 + 8, v5);
}

uint64_t sub_10018742C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for SoundProfileRecord(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_1001599F0( a1,  v1 + v4,  *(void *)(v1 + v5),  *(void (**)(uint64_t))(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8),  *(void **)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFF8LL)));
}

void sub_1001874A0()
{
}

uint64_t sub_1001874B8(void *a1)
{
  return static UUID.== infix(_:_:)(*a1 + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier) & 1;
}

uint64_t sub_1001874F8(void *a1)
{
  return static UUID.== infix(_:_:)(*a1 + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier) & 1;
}

uint64_t sub_100187538(void *a1)
{
  return static UUID.== infix(_:_:)(*a1 + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier) & 1;
}

uint64_t sub_100187578(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100187588(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100187590@<X0>(char *a1@<X8>)
{
  return sub_1000D9D70(*(void *)(v1 + 24), *(char **)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_1001875AC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void *sub_1001875D4()
{
  return sub_100130AE0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1001875E0()
{
  return sub_10012D4E4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_1001875EC()
{
  return sub_1001301F0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_1001875F8()
{
  return sub_10012F900(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_100187604()
{
  return sub_10012EFF4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100187610()
{
  return sub_10012E710(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_10018761C()
{
  return sub_10012DDC8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100187624()
{
  return sub_1000D93A8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10018763C()
{
}

void sub_100187658(void *a1, char a2)
{
}

uint64_t sub_100187664@<X0>(_BYTE *a1@<X8>)
{
  return sub_1000F45C8(v1, a1);
}

uint64_t sub_100187680(uint64_t a1)
{
  return sub_10018A234( a1,  type metadata accessor for MagicPairingSettingsRecord,  (uint64_t (*)(uint64_t, unint64_t, void))sub_100157CB4);
}

void *sub_10018769C()
{
  return sub_100123088(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1001876A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for LegacyAccountMagicKeysRecord,  &qword_1002355D8,  (uint64_t)&unk_1001A7828,  (uint64_t *)&unk_100236F60,  a1);
}

uint64_t sub_1001876E4(uint64_t a1)
{
  return sub_100155DF0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1001876F0()
{
}

uint64_t sub_100187710(void *a1, char a2)
{
  return sub_100156BC4( a1,  a2 & 1,  *(void *)(v2 + 16),  *(void **)(v2 + 24),  (uint64_t)&unk_10020FE28,  (uint64_t)sub_100187748,  (uint64_t)&unk_10020FE40);
}

void sub_100187748()
{
}

uint64_t sub_100187764@<X0>(_BYTE *a1@<X8>)
{
  return sub_1000F3F14(v1, a1);
}

void sub_10018777C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  uint64_t v8 = sub_100098CD8(&qword_1002365B8);
  uint64_t inited = swift_initStackObject(v8, v22);
  *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1001A8EE0;
  *(void *)(inited + 32) = 0x726F727245LL;
  *(void *)(inited + 40) = 0xE500000000000000LL;
  id v10 = objc_allocWithZone(&OBJC_CLASS___NSString);
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 initWithString:v11];

  *(void *)(inited + 48) = v12;
  *(void *)(inited + 56) = 0x6D69547473726946LL;
  *(void *)(inited + 64) = 0xE900000000000065LL;
  id v13 = [objc_allocWithZone(NSNumber) initWithBool:a2 & 1];
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 80) = 0x795464726F636552LL;
  *(void *)(inited + 88) = 0xEA00000000006570LL;
  CKRecord.recordType.getter(v13);
  uint64_t v15 = v14;
  id v16 = objc_allocWithZone(&OBJC_CLASS___NSString);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  id v18 = [v16 initWithString:v17];

  *(void *)(inited + 96) = v18;
  *(void *)(inited + 104) = 0x73736563637553LL;
  *(void *)(inited + 112) = 0xE700000000000000LL;
  *(void *)(inited + 120) = [objc_allocWithZone(NSNumber) initWithBool:a5 == 0];
  strcpy((char *)(inited + 128), "SyncDuration");
  *(_BYTE *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = [objc_allocWithZone(NSNumber) initWithDouble:Date.timeIntervalSince(_:)(a3)];
  strcpy((char *)(inited + 152), "UploadDuration");
  *(_BYTE *)(inited + 167) = -18;
  *(void *)(inited + 168) = [objc_allocWithZone(NSNumber) initWithDouble:0.0];
  strcpy((char *)(inited + 176), "UserInitiated");
  *(_WORD *)(inited + 190) = -4864;
  *(void *)(inited + 192) = [objc_allocWithZone(NSNumber) initWithBool:0];
  unint64_t v19 = sub_10009F23C(inited);
  sub_1000A4A64(0LL, &qword_1002365C0, &OBJC_CLASS___NSObject_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  CUMetricsLog(v7, isa);
}

uint64_t sub_100187A80(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return a2;
}

uint64_t sub_100187A98@<X0>(void *a1@<X8>)
{
  return sub_10015E998(*(void **)(v1 + 16), a1);
}

uint64_t sub_100187AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100187AF4()
{
}

uint64_t sub_100187B40()
{
  return sub_1001282EC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100187B48()
{
}

void *sub_100187B64()
{
  return sub_100126778(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100187B6C()
{
}

void *sub_100187BB8()
{
  return sub_100124C00(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100187BC0()
{
}

void sub_100187C08()
{
}

uint64_t sub_100187C28()
{
  return sub_10012BB0C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100187C30()
{
}

uint64_t sub_100187C50()
{
  return sub_10012A134(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_100187C5C()
{
  return sub_1001286F0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100187C6C(uint64_t a1)
{
  return sub_100154860(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100187C7C()
{
  return sub_100155CC8(*(void **)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

uint64_t sub_100187C9C(uint64_t a1)
{
  return sub_100153B3C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100187CB4(uint64_t a1)
{
  return sub_10018A234( a1,  type metadata accessor for DeviceSupportInformationRecord,  (uint64_t (*)(uint64_t, unint64_t, void))sub_100152E20);
}

uint64_t sub_100187CD0(uint64_t a1)
{
  return sub_10018A234( a1,  type metadata accessor for DeviceRecord,  (uint64_t (*)(uint64_t, unint64_t, void))sub_10014E400);
}

uint64_t sub_100187CE8()
{
  return sub_10013E19C(v0);
}

void sub_100187CF0(void *a1, char a2)
{
}

uint64_t sub_100187CFC(void *a1)
{
  return sub_10014134C(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress) & 1;
}

uint64_t sub_100187D20(void *a1)
{
  return sub_10014134C(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress) & 1;
}

uint64_t sub_100187D44()
{
  uint64_t v1 = (int *)type metadata accessor for BTDeferredRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 16));
  uint64_t v6 = v0 + v4 + v1[6];
  uint64_t v7 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + v1[7] + 8));
  uint64_t v8 = (uint64_t *)(v0 + v4 + v1[9]);
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15) {
    sub_100099394(*v8, v9);
  }
  unint64_t v10 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v11 = v10 + 8;
  swift_release(*(void *)(v0 + v10));
  return swift_deallocObject(v0, v11, v3 | 7);
}

uint64_t sub_100187E1C(uint64_t a1)
{
  return sub_10018A234( a1,  type metadata accessor for BTDeferredRecord,  (uint64_t (*)(uint64_t, unint64_t, void))sub_100140F14);
}

uint64_t sub_100187E34(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_100210300, (uint64_t)sub_100187E6C, (uint64_t)&unk_100210318);
}

void sub_100187E6C()
{
}

uint64_t sub_100187E98(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_100210350, (uint64_t)sub_100187ED0, (uint64_t)&unk_100210368);
}

void sub_100187ED0()
{
}

uint64_t sub_100187EFC(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_1002103A0, (uint64_t)sub_100187F34, (uint64_t)&unk_1002103B8);
}

void sub_100187F34()
{
}

uint64_t sub_100187F60(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_1002103F0, (uint64_t)sub_100187F98, (uint64_t)&unk_100210408);
}

void sub_100187F98()
{
}

uint64_t sub_100187FC4(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_100210440, (uint64_t)sub_100187FFC, (uint64_t)&unk_100210458);
}

void sub_100187FFC()
{
}

uint64_t sub_100188028(void *a1, char a2)
{
  return sub_100149AF4(a1, a2 & 1, v2, (uint64_t)&unk_100210490, (uint64_t)sub_100188090, (uint64_t)&unk_1002104A8);
}

uint64_t sub_100188060()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_100188090()
{
}

void sub_1001880BC()
{
}

uint64_t sub_1001880C4(void *a1)
{
  return sub_10013DB78(a1, v1);
}

void sub_1001880CC()
{
}

uint64_t sub_1001880D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for SoundProfileRecord,  &qword_1002353D0,  (uint64_t)&unk_1001A70FC,  (uint64_t *)&unk_100237000,  a1);
}

uint64_t sub_10018810C@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for LegacyMagicPairingSettingsRecords,  &qword_100235FF8,  (uint64_t)&unk_1001A8D68,  (uint64_t *)&unk_100237010,  a1);
}

uint64_t sub_100188144@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for BTDeferredRecord,  &qword_100237020,  (uint64_t)&unk_1001A736C,  &qword_100237028,  a1);
}

uint64_t sub_10018817C@<X0>(uint64_t a1@<X8>)
{
  return sub_100138768( *(void *)(v1 + 16),  type metadata accessor for CloudCoordinatorConfiguration,  &qword_100237050,  (uint64_t)&unk_1001A82E8,  &qword_100237058,  a1);
}

uint64_t sub_1001881B4()
{
  return sub_1000DAC54();
}

uint64_t sub_1001881CC()
{
  return sub_1000DA620();
}

uint64_t sub_1001881E8()
{
  return sub_100131E4C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1001881F4()
{
  return sub_10013262C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_100188200()
{
  return sub_100131600(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10018820C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void *sub_100188238()
{
  return sub_100132E20(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100188240(uint64_t a1, uint64_t a2)
{
  uint64_t v187 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v186 = *(void *)(v187 - 8);
  __chkstk_darwin(v187);
  uint64_t v185 = (char *)&v166 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v184 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v183 = *(void *)(v184 - 8);
  __chkstk_darwin(v184);
  uint64_t v182 = (char *)&v166 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100098CD8(&qword_100234E20);
  __chkstk_darwin(v6);
  v175 = (__int128 *)((char *)&v166 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v172 = 0LL;
  uint64_t v8 = (void *)type metadata accessor for UUID(0LL);
  uint64_t v9 = *(v8 - 1);
  __chkstk_darwin(v8);
  uint64_t v11 = (uint64_t)&v166 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v13 = (id)static os_log_type_t.default.getter(v12);
  if (qword_100234C28 != -1) {
    goto LABEL_140;
  }
  while (1)
  {
    uint64_t v14 = qword_10023DFC8;
    uint64_t v174 = sub_100098CD8((uint64_t *)&unk_100234E00);
    uint64_t v15 = swift_allocObject(v174, 72LL, 7LL);
    __int128 v176 = xmmword_1001A5EA0;
    *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1001A5EA0;
    unint64_t v16 = *(void *)(a1 + 16);
    *(void *)(v15 + 56) = &type metadata for Int;
    *(void *)(v15 + 64) = &protocol witness table for Int;
    *(void *)(v15 + 32) = v16;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v14, "databaseUpdated recordsDeleted: %d.", v166);
    uint64_t v17 = swift_bridgeObjectRelease(v15);
    unint64_t v191 = v16;
    unint64_t v169 = (unint64_t)a2 >> 62;
    if (!v16) {
      break;
    }
    if ((unint64_t)a2 >> 62)
    {
      if (a2 < 0) {
        uint64_t v165 = a2;
      }
      else {
        uint64_t v165 = a2 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      swift_bridgeObjectRetain(a2);
      uint64_t v197 = (char *)_CocoaArrayWrapper.endIndex.getter(v165);
      swift_bridgeObjectRelease(a2);
    }

    else
    {
      uint64_t v197 = *(char **)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      swift_bridgeObjectRetain(a1);
    }

    unint64_t v18 = 0LL;
    unint64_t v190 = a1 + 32;
    unint64_t v196 = a2 & 0xC000000000000001LL;
    uint64_t v189 = _swiftEmptyArrayStorage;
    unint64_t v178 = (unint64_t)"gCustomKeyBlobZone";
    unint64_t v177 = 0x80000001001CB4C0LL;
    unint64_t v170 = 0x80000001001CAB00LL;
    unint64_t v173 = (unint64_t)"Updating main device record: %@";
    unint64_t v171 = 0x80000001001CABE0LL;
    unint64_t v168 = (unint64_t)"debugDescription";
    unint64_t v167 = 0x80000001001CB350LL;
    unint64_t v188 = (unint64_t)v8;
    uint64_t v179 = v9;
    unint64_t v19 = v191;
    uint64_t v180 = a1;
    uint64_t v181 = v11;
    while (1)
    {
      if (v18 == v19) {
        goto LABEL_139;
      }
      unint64_t v193 = v18;
      uint64_t v25 = (const char *)(v190 + 24 * v18);
      uint64_t v27 = *(char **)v25;
      uint64_t v26 = *((void *)v25 + 1);
      v194 = *(char **)v25;
      uint64_t v195 = v26;
      uint64_t v28 = (void *)*((void *)v25 + 2);
      unint64_t v198 = (unint64_t)v28;
      if (v197) {
        break;
      }
      uint64_t v45 = v27;
      swift_bridgeObjectRetain(v28);
LABEL_29:
      id v46 = [v27 zoneID];
      id v47 = [v46 zoneName];

      uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
      unint64_t v50 = v49;

      if (v48 == 0xD000000000000012LL && v50 == v177)
      {
        swift_bridgeObjectRelease(v178 | 0x8000000000000000LL);
        uint64_t v11 = v181;
LABEL_34:
        v203 = &type metadata for AudioAccessoryFeatures;
        unint64_t v204 = sub_10009E740();
        LOBYTE(aBlock[0]) = 0;
        char v52 = isFeatureEnabled(_:)(aBlock);
        sub_10009A498(aBlock);
        if ((v52 & 1) != 0) {
          goto LABEL_44;
        }
        uint64_t v20 = swift_bridgeObjectRelease(v28);
        uint64_t v21 = static os_log_type_t.error.getter(v20);
        id v13 = (id)qword_10023DFC8;
        uint64_t v22 = swift_allocObject(v174, 72LL, 7LL);
        *(_OWORD *)(v22 + swift_unknownObjectWeakDestroy(v0 + 16) = v176;
        *(void *)(v22 + 56) = sub_1000A4A64(0LL, &qword_100235E10, &OBJC_CLASS___CKRecordID_ptr);
        *(void *)(v22 + 64) = sub_1000C934C( (unint64_t *)&unk_100236ED0,  &qword_100235E10,  &OBJC_CLASS___CKRecordID_ptr);
        uint64_t v23 = v194;
        *(void *)(v22 + 32) = v194;
        id v24 = v23;
        os_log(_:dso:log:_:_:)( v21,  &_mh_execute_header,  v13,  "Ignoring delete record from unknown zone: %@",  44LL,  2LL,  v22);
        swift_bridgeObjectRelease(v22);

        goto LABEL_7;
      }

      char v51 = _stringCompareWithSmolCheck(_:_:expecting:)( 0xD000000000000012LL,  v178 | 0x8000000000000000LL,  v48,  v50,  0LL);
      uint64_t v11 = v181;
      if ((v51 & 1) != 0)
      {
        swift_bridgeObjectRelease(v50);
        goto LABEL_34;
      }

      if (v48 == 0xD00000000000001ELL && v50 == v171)
      {
        unint64_t v53 = v173 | 0x8000000000000000LL;
LABEL_43:
        swift_bridgeObjectRelease(v53);
LABEL_44:
        id v54 = [v194 recordName];
        uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
        uint64_t v57 = v56;

        uint64_t v58 = v175;
        UUID.init(uuidString:)(v55, v57);
        swift_bridgeObjectRelease(v57);
        if ((*(unsigned int (**)(__int128 *, uint64_t, void *))(v9 + 48))(v58, 1LL, v8) == 1)
        {
          uint64_t v59 = v58;
          uint64_t v60 = &qword_100234E20;
          goto LABEL_58;
        }

        (*(void (**)(uint64_t, __int128 *, void *))(v9 + 32))(v11, v58, v8);
        double v61 = sub_10015A9D0(v11, v195, (uint64_t)v28, &v200);
        if (v201)
        {
          sub_100187A80(&v200, (uint64_t)aBlock);
          uint64_t v62 = v203;
          unint64_t v63 = v204;
          sub_10009A430(aBlock, (uint64_t)v203);
          uint64_t v64 = (void *)(*(uint64_t (**)(ValueMetadata *, unint64_t))(v63 + 56))(v62, v63);
          id v65 = [v64 encryptedValues];

          NSString v66 = String._bridgeToObjectiveC()();
          id v67 = [v65 objectForKeyedSubscript:v66];
          swift_unknownObjectRelease(v65);

          if (v67
            && (id v199 = v67,
                uint64_t v68 = sub_100098CD8(&qword_100234E40),
                (swift_dynamicCast(&v200, &v199, v68, &type metadata for String, 6LL) & 1) != 0))
          {
            uint64_t v11 = *((void *)&v200 + 1);
            uint64_t v69 = v200;
            swift_bridgeObjectRetain(v28);
            swift_bridgeObjectRetain(v11);
            uint64_t v70 = v172;
            uint64_t v71 = sub_100166FA0(a2, v69, v11, v195, v28);
            uint64_t v172 = v70;
            swift_bridgeObjectRelease_n(v11, 2LL);
            swift_bridgeObjectRelease(v28);
            if (v71)
            {
              uint64_t v72 = swift_bridgeObjectRelease(v28);
              uint64_t v73 = static os_log_type_t.debug.getter(v72);
              uint64_t v74 = qword_10023DFC8;
              uint64_t v75 = v174;
              uint64_t v76 = swift_allocObject(v174, 72LL, 7LL);
              *(_OWORD *)(v76 + swift_unknownObjectWeakDestroy(v0 + 16) = v176;
              sub_100187AB0((uint64_t)aBlock, (uint64_t)&v200);
              uint64_t v77 = sub_100098CD8((uint64_t *)&unk_100236F80);
              uint64_t v78 = String.init<A>(describing:)(&v200, v77);
              uint64_t v80 = v79;
              *(void *)(v76 + 56) = &type metadata for String;
              *(void *)(v76 + 64) = sub_10009914C();
              *(void *)(v76 + 32) = v78;
              *(void *)(v76 + 40) = v80;
              os_log(_:dso:log:_:_:)( v73,  &_mh_execute_header,  v74,  "Stale record about to be overwritten: %@",  40LL,  2LL,  v76);
              uint64_t v81 = swift_bridgeObjectRelease(v76);
              uint64_t v82 = static os_log_type_t.default.getter(v81);
              uint64_t v83 = qword_10023DFC8;
              uint64_t v84 = swift_allocObject(v75, 72LL, 7LL);
              *(_OWORD *)(v84 + swift_unknownObjectWeakDestroy(v0 + 16) = v176;
              *(void *)(v84 + 56) = sub_1000A4A64( 0LL,  (unint64_t *)&qword_100234E30,  &OBJC_CLASS___CKRecord_ptr);
              *(void *)(v84 + 64) = sub_1000C934C( (unint64_t *)&qword_1002352D0,  (unint64_t *)&qword_100234E30,  &OBJC_CLASS___CKRecord_ptr);
              *(void *)(v84 + 32) = v71;
              id v13 = v71;
              os_log(_:dso:log:_:_:)( v82,  &_mh_execute_header,  v83,  "Dont delete this record we have an update for it: %@",  52LL,  2LL,  v84);
              swift_bridgeObjectRelease(v84);
              sub_100187AB0((uint64_t)aBlock, (uint64_t)&v200);
              if ((swift_isUniquelyReferenced_nonNull_native(v189) & 1) == 0) {
                uint64_t v189 = sub_10018BA80(0LL, v189[2] + 1LL, 1, v189);
              }
              unint64_t v86 = v189[2];
              unint64_t v85 = v189[3];
              a1 = v180;
              uint64_t v8 = (void *)v188;
              uint64_t v9 = v179;
              uint64_t v11 = v181;
              if (v86 >= v85 >> 1) {
                uint64_t v189 = sub_10018BA80((void *)(v85 > 1), v86 + 1, 1, v189);
              }
              uint64_t v87 = v189;
              v189[2] = v86 + 1;
              sub_100187A80(&v200, (uint64_t)&v87[5 * v86 + 4]);

              (*(void (**)(uint64_t, void *))(v9 + 8))(v11, v8);
              sub_10009A498(aBlock);
              goto LABEL_7;
            }

            (*(void (**)(uint64_t, void *))(v9 + 8))(v181, v8);
          }

          else
          {
            (*(void (**)(uint64_t, void *))(v9 + 8))(v11, v8);
          }

          sub_10009A498(aBlock);
        }

        else
        {
          (*(void (**)(uint64_t, void *, double))(v9 + 8))(v11, v8, v61);
          uint64_t v59 = &v200;
          uint64_t v60 = (uint64_t *)&unk_100236F78;
LABEL_58:
          sub_100099358((uint64_t)v59, v60);
        }

        uint64_t v88 = v194;
        id v13 = v192;
        sub_10014C090(v194, v195, (uint64_t)v28, 1);
        swift_bridgeObjectRelease(v28);

        goto LABEL_7;
      }

      if ((_stringCompareWithSmolCheck(_:_:expecting:)( 0xD00000000000001ELL,  v173 | 0x8000000000000000LL,  v48,  v50,  0LL) & 1) != 0)
      {
        unint64_t v53 = v50;
        goto LABEL_43;
      }

      if (v48 == 0xD000000000000010LL && v50 == v167)
      {
        swift_bridgeObjectRelease(v168 | 0x8000000000000000LL);
      }

      else
      {
        char v89 = _stringCompareWithSmolCheck(_:_:expecting:)( 0xD000000000000010LL,  v168 | 0x8000000000000000LL,  v48,  v50,  0LL);
        swift_bridgeObjectRelease(v50);
        if ((v89 & 1) == 0)
        {
          uint64_t v97 = swift_bridgeObjectRelease(v28);
          uint64_t v98 = static os_log_type_t.error.getter(v97);
          id v13 = (id)qword_10023DFC8;
          uint64_t v99 = swift_allocObject(v174, 72LL, 7LL);
          *(_OWORD *)(v99 + swift_unknownObjectWeakDestroy(v0 + 16) = v176;
          *(void *)(v99 + 56) = sub_1000A4A64(0LL, &qword_100235E10, &OBJC_CLASS___CKRecordID_ptr);
          *(void *)(v99 + 64) = sub_1000C934C( (unint64_t *)&unk_100236ED0,  &qword_100235E10,  &OBJC_CLASS___CKRecordID_ptr);
          id v100 = v194;
          *(void *)(v99 + 32) = v194;
          id v101 = v100;
          os_log(_:dso:log:_:_:)( v98,  &_mh_execute_header,  v13,  "Ignoring delete record from unknown zone: %@",  44LL,  2LL,  v99);
          swift_bridgeObjectRelease(v99);

          uint64_t v8 = (void *)v188;
          goto LABEL_7;
        }
      }

      if (v197)
      {
        uint64_t v8 = (void *)v188;
        if (v196)
        {
          swift_bridgeObjectRetain(a2);
          id v91 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
        }

        else
        {
          uint64_t v90 = *(void **)(a2 + 32);
          swift_bridgeObjectRetain(a2);
          id v91 = v90;
        }

        id v13 = v91;
        uint64_t v92 = CKRecord.recordType.getter(v91);
        uint64_t v94 = v93;
        if (v92 == v195 && v93 == v28)
        {

          swift_bridgeObjectRelease(a2);
          uint64_t v95 = (uint64_t)v28;
          goto LABEL_76;
        }

        char v102 = _stringCompareWithSmolCheck(_:_:expecting:)(v92, v93, v195, v28, 0LL);

        swift_bridgeObjectRelease(v94);
        if ((v102 & 1) != 0)
        {

          uint64_t v95 = a2;
LABEL_76:
          swift_bridgeObjectRelease(v95);
LABEL_77:
          swift_bridgeObjectRelease(v28);
          goto LABEL_7;
        }

        uint64_t v96 = (uint64_t)v194;
        if (v197 != (char *)1)
        {
          uint64_t v103 = a1;
          if (v196)
          {
            uint64_t v104 = 1LL;
            while (1)
            {
              uint64_t v105 = specialized _ArrayBuffer._getElementSlowPath(_:)(v104, a2);
              uint64_t v106 = (char *)(v104 + 1);
              if (__OFADD__(v104, 1LL)) {
                goto LABEL_152;
              }
              id v13 = (id)v105;
              uint64_t v107 = CKRecord.recordType.getter(v105);
              uint64_t v109 = v108;
              uint64_t v110 = (void *)v198;
              if (v107 == v195 && v108 == v198) {
                break;
              }
              uint64_t v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v107, v108, v195, v198, 0LL);
              swift_unknownObjectRelease(v13);
              swift_bridgeObjectRelease(v109);
              if ((v11 & 1) != 0) {
                goto LABEL_97;
              }
              ++v104;
              uint64_t v96 = (uint64_t)v194;
              if (v106 == v197) {
                goto LABEL_96;
              }
            }

            swift_bridgeObjectRelease(a2);
            swift_unknownObjectRelease(v13);
            swift_bridgeObjectRelease(v110);
            a1 = v103;
            uint64_t v28 = v110;
          }

          else
          {
            uint64_t v11 = 5LL;
            while (1)
            {
              uint64_t v111 = (char *)(v11 - 3);
              if (__OFADD__(v11 - 4, 1LL)) {
                goto LABEL_153;
              }
              id v13 = *(id *)(a2 + 8 * v11);
              uint64_t v112 = CKRecord.recordType.getter(v13);
              uint64_t v114 = (void *)v198;
              if (v112 == v195 && v113 == v198) {
                break;
              }
              uint64_t v116 = v113;
              char v117 = _stringCompareWithSmolCheck(_:_:expecting:)(v112, v113, v195, v198, 0LL);

              swift_bridgeObjectRelease(v116);
              if ((v117 & 1) != 0)
              {
LABEL_97:

                swift_bridgeObjectRelease(a2);
                a1 = v103;
                uint64_t v28 = (void *)v198;
                goto LABEL_77;
              }

              ++v11;
              uint64_t v96 = (uint64_t)v194;
              if (v111 == v197)
              {
LABEL_96:
                swift_bridgeObjectRelease(a2);
                a1 = v103;
                uint64_t v28 = (void *)v198;
                goto LABEL_72;
              }
            }

            swift_bridgeObjectRelease(a2);
            swift_bridgeObjectRelease(v114);
            a1 = v103;
            uint64_t v28 = v114;
          }

          goto LABEL_77;
        }

        swift_bridgeObjectRelease(a2);
      }

      else
      {
        uint64_t v96 = (uint64_t)v194;
        uint64_t v8 = (void *)v188;
      }

LABEL_72:
      id v13 = v192;
      sub_10014C090((void *)v96, v195, (uint64_t)v28, 1);
      swift_bridgeObjectRelease(v28);

LABEL_7:
      unint64_t v18 = v193 + 1;
      unint64_t v19 = v191;
      if (v193 + 1 == v191)
      {
        uint64_t v17 = swift_bridgeObjectRelease(a1);
        goto LABEL_103;
      }
    }

    swift_bridgeObjectRetain(a2);
    uint64_t v29 = v27;
    swift_bridgeObjectRetain(v28);
    a1 = 4LL;
    while (1)
    {
      id v30 = v196 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a1 - 4, a2) : *(id *)(a2 + 8 * a1);
      id v13 = v30;
      uint64_t v31 = (char *)(a1 - 3);
      if (__OFADD__(a1 - 4, 1LL)) {
        break;
      }
      uint64_t v32 = a2;
      id v33 = [v30 recordID];
      id v34 = [v33 recordName];

      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      uint64_t v11 = v35;

      uint64_t v8 = [v29 recordName];
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      uint64_t v38 = v37;

      if (v9 == v36 && v11 == v38)
      {
        uint64_t v40 = swift_bridgeObjectRelease_n(v11, 2LL);
        a2 = v32;
      }

      else
      {
        uint64_t v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v11, v36, v38, 0LL);
        swift_bridgeObjectRelease(v11);
        uint64_t v40 = swift_bridgeObjectRelease(v38);
        a2 = v32;
        if ((v9 & 1) == 0)
        {

          uint64_t v28 = (void *)v198;
          goto LABEL_12;
        }
      }

      uint64_t v41 = CKRecord.recordType.getter(v40);
      uint64_t v43 = v42;
      uint64_t v28 = (void *)v198;
      if (v41 == v195 && v42 == v198)
      {
        swift_bridgeObjectRelease(a2);

        uint64_t v44 = (uint64_t)v28;
LABEL_37:
        swift_bridgeObjectRelease(v28);
        swift_bridgeObjectRelease(v44);

        a1 = v180;
        uint64_t v8 = (void *)v188;
        uint64_t v9 = v179;
        goto LABEL_7;
      }

      uint64_t v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, v195, v198, 0LL);

      swift_bridgeObjectRelease(v43);
      if ((v11 & 1) != 0)
      {
        uint64_t v44 = a2;
        goto LABEL_37;
      }

uint64_t sub_100189884()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1001898B8()
{
  return sub_1001418AC(*(char **)(v0 + 24), *(void *)(v0 + 32), 1);
}

uint64_t sub_1001898E4(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1001898EC(uint64_t a1)
{
  return sub_10013CE08(a1, v1);
}

uint64_t sub_1001898F4()
{
  uint64_t v1 = type metadata accessor for Notification(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100189968()
{
  uint64_t v1 = *(void *)(type metadata accessor for Notification(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_10013D090(v0 + v2, *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_1001899A8@<X0>(_BYTE *a1@<X8>)
{
  return sub_1000F3F20(v1, a1);
}

uint64_t sub_1001899CC(uint64_t a1)
{
  return sub_1000BFB2C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189A28(uint64_t a1)
{
  return sub_1000BFB10(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189A7C(void *a1, char a2)
{
  return sub_100156BC4( a1,  a2 & 1,  *(void *)(v2 + 16),  *(void **)(v2 + 24),  (uint64_t)&unk_100210F08,  (uint64_t)sub_100189AB4,  (uint64_t)&unk_100210F20);
}

void sub_100189AB4()
{
}

void sub_100189AD0(const char *a1, uint64_t a2, const char *a3, uint64_t a4)
{
}

uint64_t sub_100189B14(uint64_t a1)
{
  return sub_1000BB354(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189B70(uint64_t a1)
{
  return sub_1000BB338(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189BC4(void *a1, char a2)
{
  return sub_100156BC4( a1,  a2 & 1,  *(void *)(v2 + 16),  *(void **)(v2 + 24),  (uint64_t)&unk_100211750,  (uint64_t)sub_100189BFC,  (uint64_t)&unk_100211768);
}

void sub_100189BFC()
{
}

uint64_t sub_100189C38(uint64_t a1)
{
  return sub_1000B63D0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189C94(uint64_t a1)
{
  return sub_1000B63B4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100189CA4()
{
  uint64_t v1 = *(void *)(type metadata accessor for DeviceSupportInformationRecord(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_100152D24( v0 + v2,  *(uint64_t (**)(void))(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL)));
}

uint64_t sub_100189CEC()
{
  uint64_t v1 = (int *)type metadata accessor for DeviceSupportInformationRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  sub_100099394(*(void *)(v7 + v1[5]), *(void *)(v7 + v1[5] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[6] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[7] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[8] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[9] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[10] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[11] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[12] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[13] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[14] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[15] + 8));
  uint64_t v9 = v7 + v1[16];
  uint64_t v10 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100189E58()
{
  uint64_t v1 = (int *)type metadata accessor for MagicPairingSettingsRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  sub_100099394(*(void *)(v7 + v1[5]), *(void *)(v7 + v1[5] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[6] + 8));
  sub_100099394(*(void *)(v7 + v1[7]), *(void *)(v7 + v1[7] + 8));
  sub_100099394(*(void *)(v7 + v1[8]), *(void *)(v7 + v1[8] + 8));
  sub_100099394(*(void *)(v7 + v1[9]), *(void *)(v7 + v1[9] + 8));
  sub_100099394(*(void *)(v7 + v1[10]), *(void *)(v7 + v1[10] + 8));
  sub_100099394(*(void *)(v7 + v1[11]), *(void *)(v7 + v1[11] + 8));
  sub_100099394(*(void *)(v7 + v1[12]), *(void *)(v7 + v1[12] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[13] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[14] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[15] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[16] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[17] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[18] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[19] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[20] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[21] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[22] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[23] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[24] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[25] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[26] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[27] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[28] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[29] + 8));
  uint64_t v9 = v7 + v1[30];
  uint64_t v10 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10018A0C8()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10018A108()
{
  uint64_t v1 = (int *)type metadata accessor for DeviceRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = v0 + v4;
  sub_100099394(*(void *)(v0 + v4), *(void *)(v0 + v4 + 8));
  uint64_t v8 = v7 + v1[5];
  uint64_t v9 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  swift_bridgeObjectRelease(*(void *)(v7 + v1[6] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[7] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[8] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[9] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[10] + 8));
  swift_bridgeObjectRelease(*(void *)(v7 + v1[11] + 8));
  uint64_t v10 = v7 + v1[12];
  uint64_t v11 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10018A234( uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, unint64_t, void))
{
  uint64_t v5 = *(void *)(a2(0LL) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return a3(a1, v3 + v6, *(void *)(v3 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10018A298(uint64_t a1, uint64_t a2)
{
  return sub_1001085C4( a1,  a2,  *(void *)(v2 + 16),  *(void **)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(_BYTE *)(v2 + 48));
}

uint64_t sub_10018A2AC(void *a1, char a2)
{
  return sub_100156BC4( a1,  a2 & 1,  *(void *)(v2 + 16),  *(void **)(v2 + 24),  (uint64_t)&unk_1002120D8,  (uint64_t)sub_10018A31C,  (uint64_t)&unk_1002120F0);
}

uint64_t sub_10018A2E4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_10018A31C()
{
}

unint64_t *initializeBufferWithCopyOfBuffer for DeviceStore.DeviceStoreError( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10018A36C(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_10018A36C(unint64_t result)
{
  if (result >> 62)
  {
    if (result >> 62 != 1) {
      return result;
    }
    result &= 0x3FFFFFFFFFFFFFFFuLL;
  }

  return swift_errorRetain(result);
}

unint64_t destroy for DeviceStore.DeviceStoreError(unint64_t *a1)
{
  return sub_10018A390(*a1);
}

unint64_t sub_10018A390(unint64_t result)
{
  if (result >> 62)
  {
    if (result >> 62 != 1) {
      return result;
    }
    result &= 0x3FFFFFFFFFFFFFFFuLL;
  }

  return swift_errorRelease(result);
}

unint64_t *assignWithCopy for DeviceStore.DeviceStoreError( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10018A36C(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_10018A390(v4);
  return a1;
}

unint64_t *assignWithTake for DeviceStore.DeviceStoreError( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_10018A390(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceStore.DeviceStoreError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DeviceStore.DeviceStoreError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7E) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t sub_10018A4C0(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_10018A4DC(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_10018A4EC(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8LL;
    unint64_t v3 = a2 << 62;
  }

  else
  {
    uint64_t v2 = 8LL * (a2 - 2);
    unint64_t v3 = 0x8000000000000000LL;
  }

  char *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for DeviceStore.DeviceStoreError()
{
  return &type metadata for DeviceStore.DeviceStoreError;
}

unint64_t sub_10018A52C()
{
  unint64_t result = qword_100237070;
  if (!qword_100237070)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001A9674, &type metadata for DeviceStore.DeviceStoreError);
    atomic_store(result, (unint64_t *)&qword_100237070);
  }

  return result;
}

void sub_10018A588()
{
}

uint64_t sub_10018A6A0@<X0>(char *a1@<X8>)
{
  return sub_100187590(a1);
}

void sub_10018A7C0()
{
}

uint64_t sub_10018A7D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100166EFC(a1);
}

uint64_t sub_10018A7E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100166F34(a1);
}

uint64_t sub_10018A7FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100166EC4(a1);
}

void sub_10018A810()
{
}

void sub_10018A824()
{
}

void sub_10018A838()
{
}

void sub_10018A84C()
{
}

uint64_t sub_10018A87C()
{
  uint64_t result = OS_os_log.init(subsystem:category:)(0xD000000000000026LL, 0x80000001001D5A90LL, 95LL, 0xE100000000000000LL);
  qword_10023DFA8 = result;
  return result;
}

uint64_t sub_10018A8CC()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  7565409LL,  0xE300000000000000LL);
  qword_10023DFB0 = result;
  return result;
}

uint64_t sub_10018A920()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x64756F6C63LL,  0xE500000000000000LL);
  qword_10023DFB8 = result;
  return result;
}

uint64_t sub_10018A978()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x614D656369766564LL,  0xED0000726567616ELL);
  qword_10023DFC0 = result;
  return result;
}

uint64_t sub_10018A9E0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x7453656369766564LL,  0xEB0000000065726FLL);
  qword_10023DFC8 = result;
  return result;
}

uint64_t sub_10018AA44()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x616E614D656C6966LL,  0xEB00000000726567LL);
  qword_10023DFD0 = result;
  return result;
}

unint64_t sub_10018AAA8()
{
  unint64_t result = qword_100237078;
  if (!qword_100237078)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100237078);
  }

  return result;
}

uint64_t sub_10018AAE4()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x6D75646574617473LL,  0xE900000000000070LL);
  qword_10023DFD8 = result;
  return result;
}

uint64_t sub_10018AB44()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0x746361736E617274LL,  0xEB000000006E6F69LL);
  qword_10023DFE0 = result;
  return result;
}

void Data.hexString.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Data.Iterator(0LL);
  __chkstk_darwin(v3);
  sub_10018C270(0xD000000000000010LL, 0x80000001001D5AC0LL);
  __asm { BR              X9 }

uint64_t sub_10018AC40()
{
  if (BYTE6(v3) + 0x4000000000000000LL < 0) {
    goto LABEL_20;
  }
  uint64_t v7 = sub_10018B49C(0LL, (2LL * BYTE6(v3)) & ~((2LL * BYTE6(v3)) >> 63), 0, _swiftEmptyArrayStorage);
  if (v5)
  {
    if (v5 == 1) {
      uint64_t v8 = (int)v4;
    }
    else {
      uint64_t v8 = *(void *)(v4 + 16);
    }
    sub_1000991CC(v4, v3);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  ((void (*)(uint64_t, unint64_t, uint64_t))Data.Iterator.init(_:at:))(v4, v3, v8);
  Swift::UInt8_optional v9 = Data.Iterator.next()();
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
    Swift::UInt8 value = v9.value;
    uint64_t v11 = v2 + 32;
    while (1)
    {
      unint64_t v12 = value >> 4;
      if (v12 >= *(void *)(v2 + 16)) {
        break;
      }
      __int16 v13 = *(_WORD *)(v11 + 2 * v12);
      unint64_t v15 = v7[2];
      unint64_t v14 = v7[3];
      unint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1) {
        uint64_t v7 = sub_10018B49C((void *)(v14 > 1), v15 + 1, 1, v7);
      }
      v7[2] = v16;
      *((_WORD *)v7 + v15 + swift_unknownObjectWeakDestroy(v0 + 16) = v13;
      __int16 v17 = *(_WORD *)(v11 + 2LL * (value & 0xF));
      unint64_t v18 = v7[3];
      v7[2] = v15 + 2;
      *((_WORD *)v7 + v16 + swift_unknownObjectWeakDestroy(v0 + 16) = v17;
      Swift::UInt8_optional v19 = Data.Iterator.next()();
      Swift::UInt8 value = v19.value;
      if ((*(_WORD *)&v19 & 0x100) != 0) {
        goto LABEL_17;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    JUMPOUT(0x10018AE20LL);
  }

uint64_t Data.write(to:excludeFromBackup:options:)( uint64_t a1, int a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  int v25 = a2;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  __chkstk_darwin();
  __int16 v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v14 = type metadata accessor for URLResourceValues(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  __int16 v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if ((a4 & 1) != 0) {
    uint64_t v18 = 1073741825LL;
  }
  else {
    uint64_t v18 = a3 | 1;
  }
  uint64_t v19 = v28;
  uint64_t result = Data.write(to:options:)(a1, v18, a5, a6);
  if (!v19)
  {
    URLResourceValues.init()(result);
    URLResourceValues.isExcludedFromBackup.setter(v25 & 1);
    uint64_t v21 = v26;
    uint64_t v22 = a1;
    uint64_t v23 = v27;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v26 + 16))(v13, v22, v27);
    URL.setResourceValues(_:)(v17);
    (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v13, v23);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
  }

  return result;
}

uint64_t Data.init(hexString:)(uint64_t a1, uint64_t a2)
{
  if ((String.count.getter(a1) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  Swift::String v4 = String.uppercased()();
  int v5 = sub_10018BC98(v4._countAndFlagsBits, (unint64_t)v4._object);
  swift_bridgeObjectRelease(v4._object);
  uint64_t v6 = String.count.getter(a1);
  if (v6 >= 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  uint64_t v8 = sub_10018B198(0, v7 >> 1);
  uint64_t v9 = String.count.getter(a1);
  uint64_t result = swift_bridgeObjectRelease(a2);
  if (v9 < 1)
  {
LABEL_31:
    swift_release(v5);
    uint64_t v22 = sub_10018CDB0((uint64_t)v8);
    swift_bridgeObjectRelease(v8);
    return v22;
  }

  unint64_t v11 = 0LL;
  uint64_t v12 = v5 + 4;
  while (1)
  {
    uint64_t v13 = __OFADD__(v11, 2LL) ? 0x7FFFFFFFFFFFFFFFLL : v11 + 2;
    if ((v11 & 0x8000000000000000LL) != 0) {
      break;
    }
    unint64_t v14 = v5[2];
    if (v11 >= v14) {
      goto LABEL_36;
    }
    if (v11 + 1 >= v14) {
      goto LABEL_37;
    }
    unsigned int v15 = *((unsigned __int8 *)v12 + v11);
    unsigned int v16 = *((unsigned __int8 *)v12 + v11 + 1);
    if (!isxdigit(v15) || (uint64_t result = isxdigit(v16), !(_DWORD)result))
    {
      swift_bridgeObjectRelease(v8);
      swift_release(v5);
      return 0LL;
    }

    if (v15 >= 0x41) {
      int v17 = 55;
    }
    else {
      int v17 = 48;
    }
    unsigned int v18 = v15 - v17;
    if ((v18 & 0xFFFFFF00) != 0) {
      goto LABEL_38;
    }
    if (v16 >= 0x41) {
      int v19 = 55;
    }
    else {
      int v19 = 48;
    }
    unsigned int v20 = v16 - v19;
    if ((v20 & 0xFFFFFF00) != 0) {
      goto LABEL_39;
    }
    char v21 = 16 * (v18 & 0xF) + v20;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10018BE88(v8);
      uint64_t v8 = (void *)result;
    }

    if (v11 >> 1 >= v8[2]) {
      goto LABEL_42;
    }
    *((_BYTE *)v8 + (v11 >> 1) + 32) = v21;
    unint64_t v11 = v13;
    if (v13 >= v9) {
      goto LABEL_31;
    }
  }

  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_10018B198(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
  }

  else
  {
    if (!a2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v4 = static Array._allocateBufferUninitialized(minimumCapacity:)(a2, &type metadata for UInt8);
    *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return (void *)v4;
  }

  return result;
}

void Data.intValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = HIBYTE(v3) & 0xF;
  uint64_t v6 = v2 & 0xFFFFFFFFFFFFLL;
  if ((v4 & 0x2000000000000000LL) != 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    if ((v4 & 0x1000000000000000LL) != 0)
    {
      sub_10018BF10(v2, v4, 16LL);
LABEL_46:
      swift_bridgeObjectRelease(v4);
      return;
    }

    if ((v4 & 0x2000000000000000LL) == 0)
    {
      if ((v2 & 0x1000000000000000LL) != 0) {
        uint64_t v8 = (unsigned __int8 *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v2, v4);
      }
      sub_10018BFF4(v8, v6, 16LL);
      goto LABEL_46;
    }

    v24[0] = v2;
    v24[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    if (v2 == 43)
    {
      if (v5)
      {
        uint64_t v15 = v5 - 1;
        if (v15)
        {
          uint64_t v16 = 0LL;
          int v17 = (unsigned __int8 *)v24 + 1;
          do
          {
            int v18 = *v17;
            unsigned __int8 v19 = v18 - 48;
            if ((v18 - 48) >= 0xA)
            {
              if ((v18 - 65) < 6)
              {
                unsigned __int8 v19 = v18 - 55;
              }

              else
              {
                unsigned __int8 v19 = v18 - 87;
              }
            }

            BOOL v14 = __OFADD__(16 * v16, v19);
            uint64_t v16 = 16 * v16 + v19;
            if (v14) {
              break;
            }
            ++v17;
            --v15;
          }

          while (v15);
        }

        goto LABEL_46;
      }
    }

    else
    {
      if (v2 != 45)
      {
        if (v5)
        {
          uint64_t v20 = 0LL;
          char v21 = (unsigned __int8 *)v24;
          do
          {
            int v22 = *v21;
            unsigned __int8 v23 = v22 - 48;
            if ((v22 - 48) >= 0xA)
            {
              if ((v22 - 65) < 6)
              {
                unsigned __int8 v23 = v22 - 55;
              }

              else
              {
                unsigned __int8 v23 = v22 - 87;
              }
            }

            BOOL v14 = __OFADD__(16 * v20, v23);
            uint64_t v20 = 16 * v20 + v23;
            if (v14) {
              break;
            }
            ++v21;
            --v5;
          }

          while (v5);
        }

        goto LABEL_46;
      }

      if (v5)
      {
        uint64_t v9 = v5 - 1;
        if (v9)
        {
          uint64_t v10 = 0LL;
          unint64_t v11 = (unsigned __int8 *)v24 + 1;
          do
          {
            int v12 = *v11;
            unsigned __int8 v13 = v12 - 48;
            if ((v12 - 48) >= 0xA)
            {
              if ((v12 - 65) < 6)
              {
                unsigned __int8 v13 = v12 - 55;
              }

              else
              {
                unsigned __int8 v13 = v12 - 87;
              }
            }

            BOOL v14 = __OFSUB__(16 * v10, v13);
            uint64_t v10 = 16 * v10 - v13;
            if (v14) {
              break;
            }
            ++v11;
            --v9;
          }

          while (v9);
        }

        goto LABEL_46;
      }

      __break(1u);
    }

    __break(1u);
  }

  else
  {
    swift_bridgeObjectRelease(v4);
  }

void *sub_10018B49C(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_100098CD8((uint64_t *)&unk_1002370B0);
      unint64_t v11 = (void *)swift_allocObject(v10, 2 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      int64_t v13 = v12 - 32;
      if (v12 < 32) {
        int64_t v13 = v12 - 31;
      }
      v11[2] = v8;
      v11[3] = v13 & 0xFFFFFFFFFFFFFFFELL;
      BOOL v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v11 = _swiftEmptyArrayStorage;
      BOOL v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10018C6F0(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10018B5A4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, &qword_100236F10, type metadata accessor for MagicPairingSettingsRecord);
}

uint64_t sub_10018B5B8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, &qword_100236EF8, type metadata accessor for DeviceRecord);
}

uint64_t sub_10018B5CC( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v10 = a2;
  }

  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    int v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_100098CD8(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  int v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15) {
    goto LABEL_29;
  }
  if (v19 - v17 == 0x8000000000000000LL && v15 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    unint64_t v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(void *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }

    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23, v25);
    }

    *(void *)(a4 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
  }

  else
  {
    sub_10018C8C8(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10018B7D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, &qword_100236F18, type metadata accessor for DeviceSupportInformationRecord);
}

uint64_t sub_10018B7EC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, (uint64_t *)&unk_100236F20, type metadata accessor for SoundProfileRecord);
}

uint64_t sub_10018B800(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, &qword_100237080, type metadata accessor for CloudCoordinatorConfiguration);
}

void *sub_10018B814(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_100098CD8(&qword_100236658);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
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

    sub_10018C7D8(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10018B920(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC( a1,  a2,  a3,  a4,  (uint64_t *)&unk_100236FB0,  type metadata accessor for LegacyAccountMagicKeysRecord);
}

uint64_t sub_10018B934(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, (uint64_t *)&unk_100236F50, type metadata accessor for BTDeferredRecord);
}

uint64_t sub_10018B948(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10018B5CC(a1, a2, a3, a4, &qword_100236F70, type metadata accessor for LegacyMagicPairingSettingsRecords);
}

void *sub_10018B95C(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_100098CD8(&qword_100237090);
      uint64_t v11 = (void *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 24);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[3 * v8 + 4]) {
          memmove(v13, a4 + 4, 24 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_10018C9E0(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_10018BA80(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_100098CD8(&qword_100237088);
      uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[5 * v8 + 4]) {
          memmove(v13, a4 + 4, 40 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_10018CAEC(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_10018BBA0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100098CD8(&qword_100236FA0);
      uint64_t v11 = (void *)swift_allocObject(v10, v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * v12 - 64;
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_10018CE48(0LL, v8, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_10018BC98(uint64_t a1, unint64_t a2)
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
      char v5 = sub_10016104C(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      unint64_t v6 = v5;
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

void *sub_10018BE0C(void *a1)
{
  return sub_10018B814(0LL, a1[2], 0, a1);
}

uint64_t sub_10018BE20(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0LL, v2, 0LL, a1);
}

void *sub_10018BE88(void *a1)
{
  return sub_10018BBA0(0LL, a1[2], 0, a1);
}

_BYTE *sub_10018BE9C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    uint64_t result = (_BYTE *)sub_10018CBF8(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)sub_10018CCB8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)sub_10018CD30((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

unsigned __int8 *sub_10018BF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v4 = String.init<A>(_:)( &v14,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000LL) == 0)
  {
    if ((v5 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }

  uint64_t v6 = sub_100161D50(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease(v7);
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }

unsigned __int8 *sub_10018BFF4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0LL;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
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

              uint64_t v14 = v9 * a3;
              uint64_t v9 = v14 - (v11 + v12);
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
      goto LABEL_66;
    }

    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }

      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }

      if (result)
      {
        uint64_t v26 = 0LL;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0LL;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }

            else
            {
              char v28 = -55;
            }
          }

          else
          {
            char v28 = -48;
          }

          uint64_t v29 = v26 * a3;
          uint64_t v26 = v29 + (v27 + v28);
          ++result;
          --v3;
        }

        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }

      return 0LL;
    }

    return 0LL;
  }

  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }

  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0LL;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }

  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }

  if (!result) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  size_t v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0LL;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }

      else
      {
        char v21 = -55;
      }
    }

    else
    {
      char v21 = -48;
    }

    uint64_t v22 = v9 * a3;
    uint64_t v9 = v22 + (v20 + v21);
    ++v19;
    --v15;
  }

  while (v15);
  return (unsigned __int8 *)v9;
}

void *sub_10018C270(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_7;
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v4 = a1;
  }
  Swift::Int v5 = String.UTF16View._nativeGetOffset(for:)((v4 << 16) | 7, a1, a2);
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    unsigned __int8 v6 = sub_10018C680(v5, 0LL);
    swift_bridgeObjectRetain(v2);
    unint64_t v2 = sub_10018C340((uint64_t)v8, (uint64_t)(v6 + 4), v5, a1, v2);
    swift_bridgeObjectRelease(v9);
    if (v2 == v5) {
      break;
    }
    __break(1u);
LABEL_7:
    Swift::Int v5 = String.UTF16View._foreignCount()();
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
  }

  return v6;
}

uint64_t sub_10018C340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if ((a5 & 0x2000000000000000LL) != 0) {
    uint64_t v8 = HIBYTE(a5) & 0xF;
  }
  else {
    uint64_t v8 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (!a2)
  {
    uint64_t v11 = 0LL;
    __int16 v12 = 0;
    a3 = 0LL;
    char v15 = 1;
    goto LABEL_31;
  }

  swift_bridgeObjectRetain(a5);
  if (!a3)
  {
    uint64_t v11 = 0LL;
    __int16 v12 = 0;
    char v15 = 1;
    goto LABEL_30;
  }

  if (a3 < 0)
  {
    __break(1u);
    JUMPOUT(0x10018C660LL);
  }

  uint64_t v11 = 0LL;
  __int16 v12 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = a5 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v30 = a1;
  char v15 = 1;
  unsigned __int8 v16 = qword_10018C670;
  unsigned __int8 v17 = qword_10018C660;
  while (1)
  {
    if ((v15 & 1) == 0)
    {
      char v15 = 1;
      LOWORD(v18) = v12;
      __int16 v12 = 0;
      goto LABEL_9;
    }

    if (v11 >= v8) {
      break;
    }
    if ((a5 & 0x1000000000000000LL) != 0)
    {
      uint64_t v21 = v14;
      uint64_t v22 = v16;
      uint64_t v23 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)(v11 << 16, a4, a5);
      unsigned __int8 v17 = qword_10018C660;
      unsigned __int8 v16 = v22;
      uint64_t v14 = v21;
      uint64_t v18 = v23;
    }

    else
    {
      if ((a5 & 0x2000000000000000LL) == 0)
      {
        uint64_t v19 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((a4 & 0x1000000000000000LL) == 0)
        {
          uint64_t v26 = v14;
          unsigned int v27 = v16;
          uint64_t v19 = _StringObject.sharedUTF8.getter(a4, a5);
          unsigned __int8 v17 = qword_10018C660;
          unsigned __int8 v16 = v27;
          uint64_t v14 = v26;
        }

        LODWORD(v18) = *(unsigned __int8 *)(v19 + v11);
        if (*(char *)(v19 + v11) < 0) {
          __asm { BR              X9 }
        }

        ++v11;
        char v15 = 1;
        goto LABEL_9;
      }

      v31[0] = a4;
      v31[1] = v14;
      uint64_t v18 = *((unsigned __int8 *)v31 + v11);
      if (*((char *)v31 + v11) < 0) {
        __asm { BR              X9 }
      }

      uint64_t v20 = 1LL;
    }

    v11 += v20;
    if (WORD1(v18))
    {
      uint64_t v29 = v14;
      unsigned __int8 v24 = v17;
      __int16 v12 = Unicode.Scalar.UTF16View.subscript.getter(1LL, v18);
      __int16 v25 = Unicode.Scalar.UTF16View.subscript.getter(0LL, v18);
      unsigned __int8 v17 = v24;
      unsigned __int8 v16 = qword_10018C670;
      uint64_t v14 = v29;
      LOWORD(v18) = v25;
      char v15 = 0;
    }

    else
    {
      char v15 = 1;
    }

void *sub_10018C680(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100098CD8((uint64_t *)&unk_1002370B0);
  Swift::Int v5 = (void *)swift_allocObject(v4, 2 * v2 + 32, 7LL);
  int64_t v6 = j__malloc_size(v5);
  int64_t v7 = v6 - 32;
  if (v6 < 32) {
    int64_t v7 = v6 - 31;
  }
  v5[2] = a1;
  v5[3] = v7 & 0xFFFFFFFFFFFFFFFELL;
  return v5;
}

char *sub_10018C6F0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

    Swift::Int v5 = (char *)(a4 + 2 * a1 + 32);
    size_t v6 = 2 * v4;
    int64_t v7 = &__dst[v6];
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

uint64_t sub_10018C7D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10018C8C8( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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

  uint64_t v9 = *(void *)(a5(0LL) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10018C9E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v6 = a4 + 24 * a1 + 32;
  unint64_t v7 = a3 + 24 * v4;
  if (v6 >= v7 || v6 + 24 * v4 <= a3)
  {
    sub_100098CD8(&qword_100237098);
    swift_arrayInitWithCopy(a3);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10018CAEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    sub_100098CD8((uint64_t *)&unk_100236F80);
    swift_arrayInitWithCopy(a3);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10018CBF8(_BYTE *__src, _BYTE *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10018CCB8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = type metadata accessor for Data.RangeReference(0LL);
    uint64_t result = swift_allocObject(v6, 32LL, 7LL);
    *(void *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 24) = v3;
  }

  return result;
}

uint64_t sub_10018CD30(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v3 & 0x80000000) == 0) {
    return v3 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_10018CDB0(uint64_t a1)
{
  uint64_t v9 = sub_100098CD8(&qword_1002370A0);
  unint64_t v10 = sub_10018CF2C();
  v8[0] = a1;
  unint64_t v2 = sub_10009A430(v8, v9);
  uint64_t v3 = (_BYTE *)(*v2 + 32LL);
  uint64_t v4 = &v3[*(void *)(*v2 + 16LL)];
  swift_bridgeObjectRetain(a1);
  sub_10018BE9C(v3, v4, &v7);
  uint64_t v5 = v7;
  sub_10009A498(v8);
  return v5;
}

char *sub_10018CE48(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if ((v4 & 0x8000000000000000LL) != 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

unint64_t sub_10018CF2C()
{
  unint64_t result = qword_1002370A8;
  if (!qword_1002370A8)
  {
    uint64_t v1 = sub_10009E910(&qword_1002370A0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002370A8);
  }

  return result;
}

uint64_t LocalDispatchTimer.__allocating_init(deadline:repeating:leeway:queue:block:)( void *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v13 = swift_allocObject(v6, 72LL, 7LL);
  LocalDispatchTimer.init(deadline:repeating:leeway:queue:block:)(a1, a2, a3, a4, a5, a6);
  return v13;
}

uint64_t sub_10018CFF4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100098D18(v0, qword_10023DFE8);
  sub_100098D58(v0, (uint64_t)qword_10023DFE8);
  return Logger.init(subsystem:category:)( 0xD000000000000026LL,  0x80000001001D5A90LL,  0xD000000000000012LL,  0x80000001001D5D70LL);
}

uint64_t LocalDispatchTimer.isCancelled.getter()
{
  uint64_t ObjectType = swift_getObjectType(*(void *)(v0 + 40));
  return OS_dispatch_source.isCancelled.getter(ObjectType) & 1;
}

uint64_t LocalDispatchTimer.init(deadline:repeating:leeway:queue:block:)( void *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v98 = *(void *)(v14 - 8);
  uint64_t v99 = v14;
  __n128 v15 = __chkstk_darwin(v14);
  uint64_t v97 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v102 = type metadata accessor for DispatchTimeInterval(0LL, v15);
  uint64_t v94 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  uint64_t v93 = (uint64_t *)((char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __n128 v19 = __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v84 - v20);
  uint64_t v103 = type metadata accessor for DispatchTime(0LL, v19);
  uint64_t v96 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v95 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __n128 v24 = __chkstk_darwin(v23);
  uint64_t v104 = (char *)&v84 - v25;
  uint64_t v26 = type metadata accessor for OS_dispatch_source.TimerFlags(0LL, v24);
  uint64_t v27 = *(void *)(v26 - 8);
  __n128 v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v84 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v89 = (void *)type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL, v28);
  uint64_t v88 = *(v89 - 1);
  __chkstk_darwin(v89);
  uint64_t v90 = (char *)&v84 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v86 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v86);
  uint64_t v87 = (char *)&v84 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v33);
  id v101 = (char *)&v84 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = 0x408F400000000000LL;
  double v37 = a4 * 1000.0;
  double v38 = fmin(v37, 2147483650.0);
  if ((~*(void *)&v38 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }

  if (v38 <= -2147483650.0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (v38 >= 2147483650.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  a5 = a5 * 1000.0;
  *(_DWORD *)(v6 + 24) = (int)v38;
  double v39 = fmin(a5, 2147483650.0);
  if ((~*(void *)&v39 & 0x7FF0000000000000LL) == 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  if (v39 <= -2147483650.0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  if (v39 >= 2147483650.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  a6 = a6 * 1000.0;
  *(_DWORD *)(v6 + 28) = (int)v39;
  double v40 = fmin(a6, 2147483650.0);
  if ((~*(void *)&v40 & 0x7FF0000000000000LL) == 0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  if (v40 <= -2147483650.0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  if (v40 >= 2147483650.0)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    swift_once(&qword_100234C48, sub_10018CFF4);
    goto LABEL_14;
  }

  uint64_t v91 = v35;
  uint64_t v92 = v34;
  *(_DWORD *)(v6 + 32) = (int)v40;
  uint64_t v100 = a3;
  if (v37 <= 2147483650.0 && a5 <= 2147483650.0 && a6 <= 2147483650.0) {
    goto LABEL_17;
  }
  if (qword_100234C48 != -1) {
    goto LABEL_33;
  }
LABEL_14:
  uint64_t v41 = type metadata accessor for Logger(0LL);
  sub_100098D58(v41, (uint64_t)qword_10023DFE8);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.error.getter(v42);
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (_DWORD *)swift_slowAlloc(42LL, -1LL);
    uint64_t v84 = a2;
    uint64_t v45 = v44;
    *uint64_t v44 = 134218752;
    double aBlock = 2147483650.0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v106, v44 + 1, v44 + 3);
    unint64_t v85 = (void *)v26;
    *((_WORD *)v45 + 6) = 2048;
    double aBlock = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v106, (char *)v45 + 14, (char *)v45 + 22);
    *((_WORD *)v45 + 11) = 2048;
    double aBlock = a5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v106, v45 + 6, v45 + 8);
    *((_WORD *)v45 + swift_unknownObjectWeakDestroy(v0 + 16) = 2048;
    uint64_t v26 = (uint64_t)v85;
    double aBlock = a6;
    a3 = v100;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v106, (char *)v45 + 34, (char *)v45 + 42);
    _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "LocalDispatchTimer: Exceeded maximum value of %f: deadline: %f, repeating: %f, leeway: %f",  (uint8_t *)v45,  0x2Au);
    id v46 = v45;
    a2 = v84;
    swift_slowDealloc(v46, -1LL, -1LL);
  }

LABEL_17:
  *(void *)(v7 + 48) = a2;
  *(void *)(v7 + 56) = a3;
  if (a1)
  {
    swift_retain(a3);
    id v47 = a1;
  }

  else
  {
    uint64_t v84 = sub_1000A4A64(0LL, (unint64_t *)&qword_1002365E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v48 = swift_retain(a3);
    unint64_t v85 = 0LL;
    uint64_t v49 = v27;
    unint64_t v50 = v21;
    uint64_t v51 = v7;
    char v52 = v101;
    static DispatchQoS.unspecified.getter(v48);
    double aBlock = COERCE_DOUBLE(_swiftEmptyArrayStorage);
    uint64_t v53 = sub_100098C98( (unint64_t *)&unk_100237030,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    uint64_t v54 = sub_100098CD8((uint64_t *)&unk_100235870);
    uint64_t v55 = sub_1000C9F38((unint64_t *)&qword_100237040, (uint64_t *)&unk_100235870);
    uint64_t v56 = v87;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v54, v55, v86, v53);
    uint64_t v57 = v90;
    (*(void (**)(char *, void, void *))(v88 + 104))( v90,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v89);
    uint64_t v58 = v52;
    uint64_t v7 = v51;
    uint64_t v21 = v50;
    uint64_t v27 = v49;
    a1 = v85;
    id v47 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000041LL,  0x80000001001D5CA0LL,  v58,  v56,  v57,  0LL);
  }

  *(void *)(v7 + 64) = v47;
  sub_1000A4A64(0LL, &qword_1002370C0, &OBJC_CLASS___OS_dispatch_source_ptr);
  double aBlock = COERCE_DOUBLE(_swiftEmptyArrayStorage);
  uint64_t v59 = sub_100098C98( &qword_1002370C8,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags,  (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  uint64_t v90 = a1;
  char v89 = v47;
  uint64_t v60 = sub_100098CD8(&qword_1002370D0);
  uint64_t v61 = sub_1000C9F38(&qword_1002370D8, &qword_1002370D0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v60, v61, v26, v59);
  uint64_t v62 = static OS_dispatch_source.makeTimerSource(flags:queue:)(v30, v47);
  uint64_t v63 = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  *(void *)(v7 + 40) = v62;
  uint64_t v64 = v95;
  static DispatchTime.now()(v63);
  *uint64_t v21 = *(int *)(v7 + 24);
  uint64_t v65 = enum case for DispatchTimeInterval.milliseconds(_:);
  uint64_t v66 = v94;
  id v67 = *(void (**)(void *, uint64_t, uint64_t))(v94 + 104);
  uint64_t v68 = v102;
  v67(v21, enum case for DispatchTimeInterval.milliseconds(_:), v102);
  + infix(_:_:)(v64, v21);
  uint64_t v69 = *(void (**)(void *, uint64_t))(v66 + 8);
  v69(v21, v68);
  uint64_t v96 = *(void *)(v96 + 8);
  ((void (*)(char *, uint64_t))v96)(v64, v103);
  uint64_t v70 = v7;
  uint64_t v71 = *(unsigned int *)(v7 + 28);
  if ((int)v71 < 1)
  {
    uint64_t v73 = enum case for DispatchTimeInterval.never(_:);
    uint64_t v72 = v93;
  }

  else
  {
    uint64_t v72 = v93;
    *uint64_t v93 = v71;
    uint64_t v73 = v65;
  }

  uint64_t v74 = v102;
  v67(v72, v73, v102);
  uint64_t ObjectType = swift_getObjectType(*(void *)(v70 + 40));
  *uint64_t v21 = *(int *)(v70 + 32);
  v67(v21, v65, v74);
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v104, v72, v21, ObjectType);
  v69(v21, v74);
  uint64_t v76 = swift_getObjectType(*(void *)(v70 + 40));
  uint64_t v77 = swift_allocObject(&unk_100212238, 24LL, 7LL);
  swift_weakInit(v77 + 16, v70);
  v106[3] = sub_10018DAC4;
  uint64_t v107 = v77;
  double aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
  v106[0] = 1107296256LL;
  v106[1] = sub_1000F2C54;
  v106[2] = &unk_100212250;
  uint64_t v78 = _Block_copy(&aBlock);
  uint64_t v79 = swift_retain(v77);
  uint64_t v80 = v101;
  static DispatchQoS.unspecified.getter(v79);
  uint64_t v81 = v97;
  sub_10018DAE4();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v80, v81, v78, v76);
  _Block_release(v78);

  swift_release(v100);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v81, v99);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v80, v92);
  v69(v72, v74);
  ((void (*)(char *, uint64_t))v96)(v104, v103);
  uint64_t v82 = v107;
  swift_release(v77);
  swift_release(v82);
  return v70;
}

uint64_t sub_10018DA30()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10018DA54(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v5 = *(void (**)(uint64_t))(result + 48);
    uint64_t v4 = *(void *)(result + 56);
    swift_retain(v4);
    uint64_t v6 = swift_release(v3);
    v5(v6);
    return swift_release(v4);
  }

  return result;
}

uint64_t sub_10018DAC4()
{
  return sub_10018DA54(v0);
}

uint64_t sub_10018DACC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10018DADC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10018DAE4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = _swiftEmptyArrayStorage;
  uint64_t v1 = sub_100098C98( (unint64_t *)&qword_100236EE0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v2 = sub_100098CD8((uint64_t *)&unk_100235790);
  uint64_t v3 = sub_1000C9F38((unint64_t *)&qword_100236EF0, (uint64_t *)&unk_100235790);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

Swift::Void __swiftcall LocalDispatchTimer.resume()()
{
}

Swift::Void __swiftcall LocalDispatchTimer.cancel()()
{
}

uint64_t LocalDispatchTimer.deinit()
{
  return v0;
}

uint64_t LocalDispatchTimer.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t sub_10018DC40(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10018DC50( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_10018DC84(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  char *result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for LocalDispatchTimer()
{
  return objc_opt_self(&OBJC_CLASS____TtC15audioaccessoryd18LocalDispatchTimer);
}

void sub_10018DCB4()
{
}

void sub_10018DCE0()
{
}

void sub_10018DD0C()
{
}

void sub_10018DD70()
{
  uint64_t v2 = &off_100219110;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "XPC Version Check Failure, recieved version: %@, current version: %@",  v1,  0x16u);
  sub_10005EDE8();
}

void sub_10018DDE8(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10005ED60((void *)&_mh_execute_header, a2, a3, "Error checking in with bluetoothd: %@", (uint8_t *)&v4);
  sub_10005EDE8();
}

void sub_10018DE54()
{
}

void sub_10018DEB8()
{
}

void sub_10018DEE4(uint64_t a1, uint64_t a2)
{
  id v6 = objc_msgSend((id)sub_10005EE0C(a1, a2), "loginID");
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  id v9 = sub_10005EE2C(v7, v8);
  *(_DWORD *)uint64_t v4 = 136380675;
  void *v3 = v9;
  sub_10005EDA0( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Bad Account details %{private}s can't send!",  v4);

  sub_10005EE20();
}

void sub_10018DF44(uint64_t a1, uint64_t a2)
{
  id v6 = objc_msgSend((id)sub_10005EE0C(a1, a2), "loginID");
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  id v9 = sub_10005EE2C(v7, v8);
  *(_DWORD *)uint64_t v4 = 136380675;
  void *v3 = v9;
  sub_10005EDA0((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Account %{private}s can't send!", v4);

  sub_10005EE20();
}

void sub_10018DFA4(uint64_t a1, uint64_t a2)
{
  id v6 = objc_msgSend((id)sub_10005EE0C(a1, a2), "loginID");
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  id v9 = sub_10005EE2C(v7, v8);
  *(_DWORD *)uint64_t v4 = 136380675;
  void *v3 = v9;
  sub_10005EDA0((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Account %{private}s is not active!", v4);

  sub_10005EE20();
}

void sub_10018E004(void *a1, uint64_t a2, os_log_s *a3)
{
  id v5 = [a1 totalCloudDeviceCount];
  uint64_t v6 = (int)a2;
  uint64_t v7 = _IDSStringFromIDSRegistrationStatus(a2);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = 134218498;
  id v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "No devices found even though IDS Account registered, C: %ld, R: %ld %@",  (uint8_t *)&v9,  0x20u);
}

void sub_10018E0CC()
{
}

void sub_10018E0F8()
{
  id v2 = objc_claimAutoreleasedReturnValue([v0 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDB4();
  sub_10005ED4C((void *)&_mh_execute_header, v4, v5, "Message %s failed with error %s", v6, v7, v8, v9, 2u);

  sub_10005ED6C();
}

void sub_10018E190(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"DeviceName"]);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v2,  v3,  "Ignoring %@ since it is not in our cloudPaired devices list.",  v4,  v5,  v6,  v7,  v8);

  sub_10005EDA8();
}

void sub_10018E210(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"MessageType"]);
  sub_10005EDDC();
  sub_10005ED38((void *)&_mh_execute_header, v2, v3, "Ignoring message with unknown type %@", v4, v5, v6, v7, v8);

  sub_10005EDA8();
}

void sub_10018E290(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v4,  v5,  "Ignoring cloud pairing message from IDS device %{private}s containing no supported versions",  v6,  v7,  v8,  v9,  v10);

  sub_10005EDA8();
}

void sub_10018E30C()
{
  id v2 = objc_claimAutoreleasedReturnValue([v1 description]);
  sub_10005EDF0(v2, v3);
  [(id) sub_10005EE34() UTF8String];
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v4,  v5,  "Ignoring cloud pairing message from IDS device %{private}s with unknown type %s",  v6,  v7,  v8,  v9,  v10);

  sub_10005ED6C();
}

void sub_10018E398(void *a1, void *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v4, v5);
  id v6 = objc_claimAutoreleasedReturnValue([a2 cloudIdentifier]);
  sub_10005EE2C(v6, v7);
  sub_10005EDB4();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Received 'InitiatorPairingKeys' message from IDS device %{private}s, but we aren't responder (%s)",  v10,  v11,  v12,  v13,  3u);

  sub_10005ED6C();
}

void sub_10018E444(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10005ED60((void *)&_mh_execute_header, a2, a3, "Error generating keys: %@", (uint8_t *)&v4);
  sub_10005EDE8();
}

void sub_10018E4B0()
{
  uint64_t v3 = v0;
  sub_10005ED94( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Error completing pairing: %{private}@ with error: %@",  v2);
  sub_10005EDE8();
}

void sub_10018E51C(uint64_t a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38((void *)&_mh_execute_header, v4, v5, "Invalid cloud pairing ID %{private}s", v6, v7, v8, v9, v10);

  sub_10005EDA8();
}

void sub_10018E59C(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v4,  v5,  "Unknown role with IDS device %{private}s as we have no local iCloud identifier",  v6,  v7,  v8,  v9,  v10);

  sub_10005EDA8();
}

void sub_10018E618(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v4,  v5,  "Unknown role with IDS device %{private}s as they have no iCloud identifier",  v6,  v7,  v8,  v9,  v10);

  sub_10005EDA8();
}

void sub_10018E694()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10005EDF0(v3, v4);
  id v5 = [(id)sub_10005EE34() cloudIdentifier];
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  sub_10005EDD4(v6, v7);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Received 'ResponderPairingKeys' message from IDS device %{private}s, but we aren't responder (%s)",  v10,  v11,  v12,  v13,  v14);

  sub_10005ED6C();
}

void sub_10018E72C()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10005EDF0(v3, v4);
  id v5 = [(id)sub_10005EE34() cloudIdentifier];
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  sub_10005EDD4(v6, v7);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Received 'security request' message from IDS device %{private}s, but we aren't initiator (%s)",  v10,  v11,  v12,  v13,  v14);

  sub_10005ED6C();
}

void sub_10018E7C4()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10005EDF0(v3, v4);
  id v5 = [(id)sub_10005EE34() cloudIdentifier];
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  sub_10005EDD4(v6, v7);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Received 'pairing request' message from IDS device %{private}s, but we aren't responder (%s)",  v10,  v11,  v12,  v13,  v14);

  sub_10005ED6C();
}

void sub_10018E85C()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10005EDF0(v3, v4);
  id v5 = [(id)sub_10005EE34() cloudIdentifier];
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  sub_10005EDD4(v6, v7);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Received 'pairing response' message from IDS device %{private}s, but we aren't initiator (%s)",  v10,  v11,  v12,  v13,  v14);

  sub_10005ED6C();
}

void sub_10018E8F4()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10005EDF0(v3, v4);
  id v5 = objc_claimAutoreleasedReturnValue([v0 objectForKeyedSubscript:@"FailureReason"]);
  sub_10005EDD4(v5, v6);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v7,  v8,  "Received 'pairing failure' message from IDS device %{private}s - %s",  v9,  v10,  v11,  v12,  v13);

  sub_10005ED6C();
}

void sub_10018E998(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v4,  v5,  "Dropping pairing initiation message to IDS device %{private}s as our role is unknown",  v6,  v7,  v8,  v9,  v10);

  sub_10005EDA8();
}

void sub_10018EA14(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v4,  v5,  "Dropping pairing initiation message to IDS device %{private}s as our role is unknown",  v6,  v7,  v8,  v9,  v10);

  sub_10005EDA8();
}

void sub_10018EA94(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 idsDevice]);
  id v7 = objc_claimAutoreleasedReturnValue([v6 cpDescription]);
  id v9 = sub_10005EE2C(v7, v8);
  id v10 = objc_claimAutoreleasedReturnValue([a2 description]);
  sub_10005EDF0(v10, v11);
  int v13 = 136380931;
  id v14 = v9;
  sub_10005EDB4();
  sub_10005ED94( (void *)&_mh_execute_header,  a3,  v12,  "Failed to create destination identifier to IDS device %{private}s - cannot send message %s",  (uint8_t *)&v13);
}

void sub_10018EB68(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10005EDD4(v2, v3);
  sub_10005EDDC();
  sub_10005ED38((void *)&_mh_execute_header, v4, v5, "Failed to send message with error %s", v6, v7, v8, v9, v10);

  sub_10005EDA8();
}

void sub_10018EBE4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "cloudpaird: sendRePairRequest: Failed to find existing CloudDevice - Maybe a new device - do we still allow repairing?",  buf,  2u);
}

void sub_10018EC20()
{
}

void sub_10018EC4C()
{
}

void sub_10018EC78()
{
  id v3 = objc_claimAutoreleasedReturnValue([v2 cpDescription]);
  sub_10005EDF0(v3, v4);
  id v5 = [(id)sub_10005EE34() description];
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  sub_10005EDD4(v6, v7);
  sub_10005ED7C();
  sub_10005ED4C( (void *)&_mh_execute_header,  v8,  v9,  "Failed to create destination identifier to IDS device %{private}s - cannot send message %s",  v10,  v11,  v12,  v13,  v14);

  sub_10005ED6C();
}

void sub_10018ED10()
{
}

void sub_10018ED74(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10005ED94( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unable to unpair Cloud Device: %@ with error: %@",  (uint8_t *)&v4);
  sub_10005EDE8();
}

void sub_10018EDF0(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) idsDevice]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 uniqueID]);
  sub_10005EDDC();
  sub_10005ED38( (void *)&_mh_execute_header,  v3,  v4,  "Error unpairing Cloud Device properly for - %@",  v5,  v6,  v7,  v8,  v9);

  sub_10005ED6C();
}

void sub_10018EE80()
{
}

void sub_10018EEEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10018EF54( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10018EFBC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10018F024()
{
}

void sub_10018F098()
{
}

void sub_10018F10C()
{
}

void sub_10018F138()
{
}

void sub_10018F198()
{
}

void sub_10018F1C4()
{
}

void sub_10018F224()
{
}

void sub_10018F284()
{
}

void sub_10018F2F4()
{
}

void sub_10018F354()
{
}

void sub_10018F3B4()
{
}

void sub_10018F414()
{
}

void sub_10018F474()
{
}

void sub_10018F4D4()
{
}

void sub_10018F534()
{
}

void sub_10018F594()
{
}

void sub_10018F5F4()
{
}

void sub_10018F654()
{
}

void sub_10018F6B4()
{
}

void sub_10018F714()
{
}

void sub_10018F780()
{
}

void sub_10018F7E0()
{
}

void sub_10018F840()
{
}

void sub_10018F8A0()
{
}

void sub_10018F900()
{
}

void sub_10018F960()
{
}

void sub_10018F9C0()
{
}

void sub_10018F9EC()
{
}

void sub_10018FA4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10018FAB4()
{
}

void sub_10018FB14()
{
}

void sub_10018FB74()
{
}

void sub_10018FBA0()
{
}

void sub_10018FBCC()
{
}

void sub_10018FBF8()
{
}

void sub_10018FC24()
{
}

void sub_10018FC50()
{
}

void sub_10018FC7C()
{
}

void sub_10018FCDC()
{
}

void sub_10018FD3C(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10006CC68( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Started monitoring for removal of directory: %@",  (uint8_t *)a2);

  sub_10006CC9C();
}

void sub_10018FD8C(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10006CC68( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Started monitoring changes to directory: %@",  (uint8_t *)a2);

  sub_10006CC9C();
}

void sub_10018FDDC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open %@", buf, 0xCu);

  sub_10006CC9C();
}

void sub_10018FE2C(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Starting to watch for existence of %@/%@",  buf,  0x16u);

  sub_10006CC9C();
}

void sub_10018FE94(uint64_t a1, void *a2)
{
  id v3 = [(id)sub_10006CC80() directoryURL];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  sub_10005EDDC();
  sub_10006CC54((void *)&_mh_execute_header, v6, v7, "Monitored directory changed: %@", v8, v9, v10, v11, v12);

  sub_10005ED6C();
}

void sub_10018FF24(uint64_t a1, void *a2)
{
  id v3 = [(id)sub_10006CC80() directoryURL];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  sub_10005EDDC();
  sub_10006CC54((void *)&_mh_execute_header, v6, v7, "Monitored directory went away: %@", v8, v9, v10, v11, v12);

  sub_10005ED6C();
}

void sub_10018FFB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10018FFE8(void *a1)
{
  id v2 = [(id)sub_10006CC80() targetFilename];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10005EDDC();
  sub_10006CC54((void *)&_mh_execute_header, v4, v5, "File was not found in the directory yet: %@", v6, v7, v8, v9, v10);

  sub_10005EDA8();
}

void sub_100190068(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_10006CCA4(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 directoryURL]);
  sub_10005EDDC();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error while trying to read the contents of directory %@: %@",  v7,  0x16u);

  sub_10005ED6C();
}

void sub_100190110(void *a1)
{
  id v2 = [(id)sub_10006CC80() targetFilename];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10005EDDC();
  sub_10006CC54((void *)&_mh_execute_header, v4, v5, "Found file being watched: %@", v6, v7, v8, v9, v10);

  sub_10005EDA8();
}

void sub_100190190( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001901C4()
{
}

void sub_1001901F0()
{
}

void sub_10019021C()
{
}

void sub_100190248()
{
}

void sub_100190274()
{
}

void sub_1001902D4()
{
}

void sub_100190334()
{
}

void sub_100190394()
{
}

void sub_1001903FC()
{
}

void sub_10019045C()
{
}

void sub_1001904BC()
{
}

void sub_100190520()
{
}

void sub_100190584()
{
}

void sub_1001905EC()
{
}

void sub_10019064C()
{
}

void sub_1001906AC()
{
}

void sub_10019070C()
{
}

void sub_10019076C()
{
}

void sub_1001907CC()
{
}

void sub_100190838()
{
}

void sub_100190870()
{
}

void sub_1001908D0()
{
}

void sub_1001908FC(void *a1)
{
}

void sub_100190970(void *a1)
{
}

void sub_1001909E4()
{
}

void sub_100190A50()
{
}

void sub_100190AB0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = byte_100237280;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isBuddyComplete: %i", (uint8_t *)v1, 8u);
}

void sub_100190B30(os_log_t log)
{
  if (byte_100237281) {
    uint64_t v1 = @"YES";
  }
  else {
    uint64_t v1 = @"NO";
  }
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Unlocked since boot = %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100190BC8()
{
}

void sub_100190BF4()
{
}

void sub_100190C20()
{
}

void sub_100190C4C()
{
}

void sub_100190C78()
{
}

void sub_100190CA4()
{
}

void sub_100190CD0()
{
}

void sub_100190D30()
{
}

void sub_100190D90()
{
}

void sub_100190DF0()
{
}

void sub_100190E60()
{
  sub_10006BC04( (void *)&_mh_execute_header,  v0,  v1,  "Manatee: Updating master key failed with error %@, retry count = %lu");
  sub_10005EDE8();
}

void sub_100190ECC()
{
}

void sub_100190F2C()
{
}

void sub_100190F8C()
{
}

void sub_100190FEC()
{
}

void sub_10019104C()
{
}

void sub_1001910AC()
{
}

void sub_10019110C()
{
}

void sub_10019116C()
{
}

void sub_1001911CC()
{
}

void sub_10019122C()
{
}

void sub_10019128C()
{
}

void sub_1001912EC()
{
}

void sub_10019134C()
{
}

void sub_1001913AC()
{
}

void sub_10019140C()
{
}

void sub_10019146C()
{
}

void sub_1001914CC()
{
}

void sub_10019152C()
{
}

void sub_10019158C()
{
}

void sub_1001915EC()
{
}

void sub_10019164C()
{
}

id objc_msgSend_CPAddressMapping(void *a1, const char *a2, ...)
{
  return _[a1 CPAddressMapping];
}

id objc_msgSend_CloudDevice(void *a1, const char *a2, ...)
{
  return _[a1 CloudDevice];
}

id objc_msgSend_CloudDeviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 CloudDeviceAddress];
}

id objc_msgSend_SRConnectedSetCount(void *a1, const char *a2, ...)
{
  return _[a1 SRConnectedSetCount];
}

id objc_msgSend_TUCallMap(void *a1, const char *a2, ...)
{
  return _[a1 TUCallMap];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__TUMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _TUMonitorEnsureStopped];
}

id objc_msgSend__aaControllerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _aaControllerEnsureStarted];
}

id objc_msgSend__aaControllerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _aaControllerEnsureStopped];
}

id objc_msgSend__aacpConnectedCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aacpConnectedCheck:");
}

id objc_msgSend__accessoryDeviceFound_withChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDeviceFound:withChange:");
}

id objc_msgSend__accessoryDevicePerformActionsOnChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDevicePerformActionsOnChange:");
}

id objc_msgSend__accessoryDeviceRemoveOffListeningModeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDeviceRemoveOffListeningModeIfNeeded:");
}

id objc_msgSend__accessoryDeviceUpdateCloudRecord_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDeviceUpdateCloudRecord:config:");
}

id objc_msgSend__activate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activate:");
}

id objc_msgSend__activateCDSession(void *a1, const char *a2, ...)
{
  return _[a1 _activateCDSession];
}

id objc_msgSend__activateDirect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateDirect:");
}

id objc_msgSend__activateXPC_reactivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateXPC:reactivate:");
}

id objc_msgSend__activityMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _activityMonitorEnsureStopped];
}

id objc_msgSend__anyPairedDeviceSupportsSmartRouting(void *a1, const char *a2, ...)
{
  return _[a1 _anyPairedDeviceSupportsSmartRouting];
}

id objc_msgSend__arbitrationTimeout_withScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_arbitrationTimeout:withScore:");
}

id objc_msgSend__asyncAudioSessionDuckWithLevel_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asyncAudioSessionDuckWithLevel:completion:");
}

id objc_msgSend__audioSessionEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _audioSessionEnsureStopped];
}

id objc_msgSend__bluetoothProductDefaultAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductDefaultAsset:");
}

id objc_msgSend__bluetoothProductIDNoEarDetect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductIDNoEarDetect:");
}

id objc_msgSend__bluetoothProductIDNoUTP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductIDNoUTP:");
}

id objc_msgSend__bluetoothProductIDToAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductIDToAsset:");
}

id objc_msgSend__bluetoothProductIDToCaseAsset_andAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductIDToCaseAsset:andAddress:");
}

id objc_msgSend__bluetoothProductIDToColorAsset_withColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothProductIDToColorAsset:withColor:");
}

id objc_msgSend__budSwapDetectionStartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_budSwapDetectionStartTimer:");
}

id objc_msgSend__cacheBudswapInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheBudswapInfo:");
}

id objc_msgSend__cacheInfo_andAddress_andName_andVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheInfo:andAddress:andName:andVersion:");
}

id objc_msgSend__calibrateDuckingLevelForVolumeLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calibrateDuckingLevelForVolumeLevel:");
}

id objc_msgSend__cancelRingtoneTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelRingtoneTimer];
}

id objc_msgSend__cancelTriangleRecoveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTriangleRecoveryTimer];
}

id objc_msgSend__cbConnectedDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbConnectedDiscoveryEnsureStarted];
}

id objc_msgSend__cbConnectedDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbConnectedDiscoveryEnsureStopped];
}

id objc_msgSend__cbControllerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbControllerEnsureStarted];
}

id objc_msgSend__cbControllerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbControllerEnsureStopped];
}

id objc_msgSend__cbDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cbDiscoveryEnsureStarted];
}

id objc_msgSend__cbDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cbDiscoveryEnsureStopped];
}

id objc_msgSend__cdSessionEnsureActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cdSessionEnsureActivated:");
}

id objc_msgSend__cdSessionEnsureDeactivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cdSessionEnsureDeactivated:");
}

id objc_msgSend__checkTickswithinWindow_withWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkTickswithinWindow:withWindow:");
}

id objc_msgSend__checkTriangleRecovery(void *a1, const char *a2, ...)
{
  return _[a1 _checkTriangleRecovery];
}

id objc_msgSend__checkValidBatteryValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkValidBatteryValue:");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return _[a1 _cleanup];
}

id objc_msgSend__clearCallSession(void *a1, const char *a2, ...)
{
  return _[a1 _clearCallSession];
}

id objc_msgSend__cloudSyncEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _cloudSyncEnsureStarted];
}

id objc_msgSend__cloudSyncEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _cloudSyncEnsureStopped];
}

id objc_msgSend__connectedDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectedDeviceLost:");
}

id objc_msgSend__connectedDeviceMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _connectedDeviceMonitorEnsureStarted];
}

id objc_msgSend__connectedDeviceMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _connectedDeviceMonitorEnsureStopped];
}

id objc_msgSend__conversationDetectMessageReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationDetectMessageReceived:fromDevice:");
}

id objc_msgSend__conversationDetectMessageReceived_fromDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationDetectMessageReceived:fromDeviceIdentifier:");
}

id objc_msgSend__createBannerSessionMuteActionForIOS_auditToken_appName_appBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:");
}

id objc_msgSend__deregisterFromAVAudioSessionSpeechDetectionStyleChanges(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVAudioSessionSpeechDetectionStyleChanges];
}

id objc_msgSend__deregisterFromAVSystemControllerDeathNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVSystemControllerDeathNotifications];
}

id objc_msgSend__deregisterFromAVSystemControllerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAVSystemControllerStateNotifications];
}

id objc_msgSend__deregisterFromAudioSessionResetNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromAudioSessionResetNotifications];
}

id objc_msgSend__deregisterFromWirelessSplitterStateChanges(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterFromWirelessSplitterStateChanges];
}

id objc_msgSend__descriptionWithLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionWithLevel:");
}

id objc_msgSend__deviceSupportsHijackV2_withDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSupportsHijackV2:withDevice:");
}

id objc_msgSend__diagnosticControlShareAudioBanner(void *a1, const char *a2, ...)
{
  return _[a1 _diagnosticControlShareAudioBanner];
}

id objc_msgSend__disconnectOtherTipiDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectOtherTipiDevice:");
}

id objc_msgSend__duckingLevelForCoefficients_volume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duckingLevelForCoefficients:volume:");
}

id objc_msgSend__ensureXPCStarted(void *a1, const char *a2, ...)
{
  return _[a1 _ensureXPCStarted];
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitledAndReturnError:");
}

id objc_msgSend__evaluatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _evaluatorEnsureStopped];
}

id objc_msgSend__evaluatorRun(void *a1, const char *a2, ...)
{
  return _[a1 _evaluatorRun];
}

id objc_msgSend__evaluatorRunTipiElection_nearbyInfoDevicesMap_localScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:");
}

id objc_msgSend__evaluatorRunforTVOS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluatorRunforTVOS:");
}

id objc_msgSend__fetchAccessoryKeyBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAccessoryKeyBlob:");
}

id objc_msgSend__fetchArrayOfCloudDevicesForPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchArrayOfCloudDevicesForPeripheral:");
}

id objc_msgSend__fetchCloudPairingIdentifierForPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCloudPairingIdentifierForPeripheral:");
}

id objc_msgSend__fetchKeyBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchKeyBlob:");
}

id objc_msgSend__fileRadar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fileRadar:");
}

id objc_msgSend__findActiveWxDevice(void *a1, const char *a2, ...)
{
  return _[a1 _findActiveWxDevice];
}

id objc_msgSend__getActiveNearbyWxAdress(void *a1, const char *a2, ...)
{
  return _[a1 _getActiveNearbyWxAdress];
}

id objc_msgSend__getCDTunings_FromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCDTunings:FromData:");
}

id objc_msgSend__getCurrentRoute(void *a1, const char *a2, ...)
{
  return _[a1 _getCurrentRoute];
}

id objc_msgSend__getIDSDeviceFromBtAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getIDSDeviceFromBtAddress:");
}

id objc_msgSend__getInEarSrWxDevice(void *a1, const char *a2, ...)
{
  return _[a1 _getInEarSrWxDevice];
}

id objc_msgSend__getJsonStringFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getJsonStringFromDictionary:");
}

id objc_msgSend__getPauseMessage(void *a1, const char *a2, ...)
{
  return _[a1 _getPauseMessage];
}

id objc_msgSend__getResetMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getResetMessage:");
}

id objc_msgSend__getRssiNearby_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRssiNearby:");
}

id objc_msgSend__getSignalTypeFromData_signal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSignalTypeFromData:signal:");
}

id objc_msgSend__getWxColorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getWxColorCode:");
}

id objc_msgSend__getWxFWVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getWxFWVersion:");
}

id objc_msgSend__getWxProductID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getWxProductID:");
}

id objc_msgSend__handleHRMSessionChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHRMSessionChanged:");
}

id objc_msgSend__handlePhoneOwnershipTriangleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _handlePhoneOwnershipTriangleTimer];
}

id objc_msgSend__handleProactiveRoutingRouteCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleProactiveRoutingRouteCheck:");
}

id objc_msgSend__handleSessionEnded_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSessionEnded:error:");
}

id objc_msgSend__handleSmartRoutingDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSmartRoutingDisabled:");
}

id objc_msgSend__hijackBackoffReset_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hijackBackoffReset:withReason:");
}

id objc_msgSend__hijackBlockingModeChangedFromClient_mode_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hijackBlockingModeChangedFromClient:mode:completion:");
}

id objc_msgSend__idsScheduleUpdateIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _idsScheduleUpdateIdentities];
}

id objc_msgSend__inCaseLidClosed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inCaseLidClosed:");
}

id objc_msgSend__inEarConnectedCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inEarConnectedCheck:");
}

id objc_msgSend__inEarNearbyCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inEarNearbyCheck:");
}

id objc_msgSend__interrupted(void *a1, const char *a2, ...)
{
  return _[a1 _interrupted];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return _[a1 _invalidate];
}

id objc_msgSend__invalidateCDSession(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateCDSession];
}

id objc_msgSend__invalidateDirect(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateDirect];
}

id objc_msgSend__invalidateMuteBanner(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateMuteBanner];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return _[a1 _invalidated];
}

id objc_msgSend__isAddDeviceToBackoffDueToDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 _isAddDeviceToBackoffDueToDisconnect];
}

id objc_msgSend__isAnyConnectedWxInEarCheck(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyConnectedWxInEarCheck];
}

id objc_msgSend__isAnyHRMEnabledDeviceConnected(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyHRMEnabledDeviceConnected];
}

id objc_msgSend__isConnectionTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 _isConnectionTipiv2];
}

id objc_msgSend__isDevicePairedCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDevicePairedCheck:");
}

id objc_msgSend__isEligibleForTipiV2_firstDeviceTipiScore_secondDeviceTipiScore_currentDeviceScore_sourceDeviceCount_isOnDemandConnect_address_lastConnectedHost_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:sourceDeviceCount:isOnDema ndConnect:address:lastConnectedHost:");
}

id objc_msgSend__isForceRejectPipe(void *a1, const char *a2, ...)
{
  return _[a1 _isForceRejectPipe];
}

id objc_msgSend__isForceTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 _isForceTipiv2];
}

id objc_msgSend__isInEarDetectionDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInEarDetectionDisabled:");
}

id objc_msgSend__isInEarToOutOfEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInEarToOutOfEar:");
}

id objc_msgSend__isInHijackBlockingMode(void *a1, const char *a2, ...)
{
  return _[a1 _isInHijackBlockingMode];
}

id objc_msgSend__isInTipi(void *a1, const char *a2, ...)
{
  return _[a1 _isInTipi];
}

id objc_msgSend__isManualConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isManualConnection:");
}

id objc_msgSend__isMyAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isMyAddress:");
}

id objc_msgSend__isOnDemandConnectInProgress(void *a1, const char *a2, ...)
{
  return _[a1 _isOnDemandConnectInProgress];
}

id objc_msgSend__isOtherTipiDeviceBeforeTrain_withIOS_withMacOS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:");
}

id objc_msgSend__isPhoneCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPhoneCall:");
}

id objc_msgSend__isReceivedLegacyTipiConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isReceivedLegacyTipiConnect:");
}

id objc_msgSend__isSmartRoutingCapableDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSmartRoutingCapableDevice:");
}

id objc_msgSend__languageChangeMonitoringEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _languageChangeMonitoringEnsureStarted];
}

id objc_msgSend__languageChangeMonitoringEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _languageChangeMonitoringEnsureStopped];
}

id objc_msgSend__lastConnectIsWatchCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastConnectIsWatchCheck:");
}

id objc_msgSend__loadDeviceRecordForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadDeviceRecordForDevice:");
}

id objc_msgSend__logEvalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logEvalError:");
}

id objc_msgSend__logEvalWxError_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logEvalWxError:withError:");
}

id objc_msgSend__logPreemptiveBannerEvalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logPreemptiveBannerEvalError:");
}

id objc_msgSend__lowBatteryClearSFDevice_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowBatteryClearSFDevice:reason:");
}

id objc_msgSend__lowBatteryDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowBatteryDeviceLost:");
}

id objc_msgSend__lowBatteryLoad(void *a1, const char *a2, ...)
{
  return _[a1 _lowBatteryLoad];
}

id objc_msgSend__lowBatteryReset(void *a1, const char *a2, ...)
{
  return _[a1 _lowBatteryReset];
}

id objc_msgSend__lowBatterySave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowBatterySave:");
}

id objc_msgSend__lowBatteryShowAlertWithLowBatteryDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowBatteryShowAlertWithLowBatteryDevice:");
}

id objc_msgSend__lowBatteryTrackSFDevice_batteryLevel_batteryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowBatteryTrackSFDevice:batteryLevel:batteryType:");
}

id objc_msgSend__lowestBatteryInfoForCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowestBatteryInfoForCBDevice:");
}

id objc_msgSend__lowestBatteryInfoForSFDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lowestBatteryInfoForSFDevice:");
}

id objc_msgSend__mediaRouteDiscoveryStarted(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteDiscoveryStarted];
}

id objc_msgSend__mediaRouteDiscoveryStopped(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteDiscoveryStopped];
}

id objc_msgSend__mediaRouteHijackResponseHandlerFor_allowedToHijack_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:");
}

id objc_msgSend__mediaRouteHijackWithAudioScore_wxAddress_andAudioResponseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:");
}

id objc_msgSend__mediaRouteMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorEnsureStarted];
}

id objc_msgSend__mediaRouteMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorEnsureStopped];
}

id objc_msgSend__mediaRouteMonitorSpeakRoute(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteMonitorSpeakRoute];
}

id objc_msgSend__multimodalContextMessageReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_multimodalContextMessageReceived:fromDevice:");
}

id objc_msgSend__muteStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 _muteStateChanged];
}

id objc_msgSend__myBluetoothAddressString(void *a1, const char *a2, ...)
{
  return _[a1 _myBluetoothAddressString];
}

id objc_msgSend__nearbyDeviceInfoTriangleRecoveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyDeviceInfoTriangleRecoveryTimer];
}

id objc_msgSend__nearbyInfoActivityChanged(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoActivityChanged];
}

id objc_msgSend__nearbyInfoActivityCriticalStart(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoActivityCriticalStart];
}

id objc_msgSend__nearbyInfoActivityDelayCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyInfoActivityDelayCheck:");
}

id objc_msgSend__nearbyInfoDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyInfoDeviceLost:");
}

id objc_msgSend__nearbyInfoDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoDiscoveryEnsureStopped];
}

id objc_msgSend__nearbyInfoSetAudioRoutingScore(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyInfoSetAudioRoutingScore];
}

id objc_msgSend__nearbyMacAddressTranslate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyMacAddressTranslate:");
}

id objc_msgSend__nearbyWxChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyWxChanged:");
}

id objc_msgSend__notifyOtherTipiDeviceTipiScoreChanged_andNewScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:");
}

id objc_msgSend__otherTipiDeviceTipiScoreChanged_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_otherTipiDeviceTipiScoreChanged:withOptions:");
}

id objc_msgSend__pairedDeviceMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _pairedDeviceMonitorEnsureStarted];
}

id objc_msgSend__pickableRoutesChanged(void *a1, const char *a2, ...)
{
  return _[a1 _pickableRoutesChanged];
}

id objc_msgSend__pipeCleanup(void *a1, const char *a2, ...)
{
  return _[a1 _pipeCleanup];
}

id objc_msgSend__pipeConnectionComplete_andWxHeadset_isSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pipeConnectionComplete:andWxHeadset:isSender:");
}

id objc_msgSend__pipeDone(void *a1, const char *a2, ...)
{
  return _[a1 _pipeDone];
}

id objc_msgSend__pipeEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _pipeEnsureStopped];
}

id objc_msgSend__pipeRequestCompleted_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pipeRequestCompleted:error:");
}

id objc_msgSend__pipeRequestResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pipeRequestResponse:error:");
}

id objc_msgSend__pipeSendRouteRequestToSFDevice_andWxHeadset_newPipe_connectionResult_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:");
}

id objc_msgSend__playChime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playChime:");
}

id objc_msgSend__pmeConfigDataReceived_fromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pmeConfigDataReceived:fromDevice:");
}

id objc_msgSend__postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotification:");
}

id objc_msgSend__powerLogSmartIncomingConnection(void *a1, const char *a2, ...)
{
  return _[a1 _powerLogSmartIncomingConnection];
}

id objc_msgSend__powerLogSmartRoutingScanStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_powerLogSmartRoutingScanStarted:");
}

id objc_msgSend__powerLogSmartRoutingScanStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_powerLogSmartRoutingScanStopped:");
}

id objc_msgSend__powerMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorEnsureStarted];
}

id objc_msgSend__powerMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorEnsureStopped];
}

id objc_msgSend__powerMonitorScreenLockChanged(void *a1, const char *a2, ...)
{
  return _[a1 _powerMonitorScreenLockChanged];
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _prefsChanged];
}

id objc_msgSend__proactivelyTakeOwnership(void *a1, const char *a2, ...)
{
  return _[a1 _proactivelyTakeOwnership];
}

id objc_msgSend__processBannerRequestForMuteAction_auditToken_bundleIdentifier_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:");
}

id objc_msgSend__productColorAssetExists_withColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_productColorAssetExists:withColor:");
}

id objc_msgSend__productColorAssetLookup_andAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_productColorAssetLookup:andAddress:");
}

id objc_msgSend__productHasColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_productHasColors:");
}

id objc_msgSend__receivedAudioCategory_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedAudioCategory:withOptions:");
}

id objc_msgSend__receivedRelinquishOwnership_wxAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedRelinquishOwnership:wxAddress:");
}

id objc_msgSend__registerForAVAudioSessionSpeechDetectionStyleChanges(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVAudioSessionSpeechDetectionStyleChanges];
}

id objc_msgSend__registerForAVSystemControllerDeathNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVSystemControllerDeathNotifications];
}

id objc_msgSend__registerForAVSystemControllerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAVSystemControllerStateNotifications];
}

id objc_msgSend__registerForAudioSessionResetNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAudioSessionResetNotifications];
}

id objc_msgSend__relayConduitMessageReceived_andSourceDevice_messageType_messageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayConduitMessageReceived:andSourceDevice:messageType:messageData:");
}

id objc_msgSend__relayConduitMessageSend_withOptions_andWxAddress_andOtherAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:");
}

id objc_msgSend__relayConduitMessageStartTimer_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayConduitMessageStartTimer:withOptions:");
}

id objc_msgSend__removeTiPiState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeTiPiState:");
}

id objc_msgSend__reportError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportError:");
}

id objc_msgSend__reportProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportProgress:");
}

id objc_msgSend__reportProgress_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportProgress:info:");
}

id objc_msgSend__reportProgressTriggeredDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportProgressTriggeredDevice:");
}

id objc_msgSend__resetInUserBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 _resetInUserBannerShown];
}

id objc_msgSend__respondRoutingRequest_withResponseHandler_wxAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_respondRoutingRequest:withResponseHandler:wxAddress:");
}

id objc_msgSend__reverseMuteActionForToken_shouldMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reverseMuteActionForToken:shouldMute:");
}

id objc_msgSend__routeIndicationConnectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_routeIndicationConnectDevice:");
}

id objc_msgSend__routeIndicationShowBanner_withDevice_andCentralContentItemTxt_andTimeout_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_routeIndicationShowBanner:withDevice:andCentralContentItemTxt:andTimeout:");
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return _[a1 _run];
}

id objc_msgSend__runAdvertiser(void *a1, const char *a2, ...)
{
  return _[a1 _runAdvertiser];
}

id objc_msgSend__runConfirm(void *a1, const char *a2, ...)
{
  return _[a1 _runConfirm];
}

id objc_msgSend__runConnectGuestHeadphones(void *a1, const char *a2, ...)
{
  return _[a1 _runConnectGuestHeadphones];
}

id objc_msgSend__runGuestiOSConnect(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSConnect];
}

id objc_msgSend__runGuestiOSPairSetupPublic(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSPairSetupPublic];
}

id objc_msgSend__runGuestiOSShareAudio(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudio];
}

id objc_msgSend__runGuestiOSShareAudioConnect(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioConnect];
}

id objc_msgSend__runGuestiOSShareAudioConnectSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioConnectSendRequest];
}

id objc_msgSend__runGuestiOSShareAudioSendRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runGuestiOSShareAudioSendRequest];
}

id objc_msgSend__runInit(void *a1, const char *a2, ...)
{
  return _[a1 _runInit];
}

id objc_msgSend__runPipeStates(void *a1, const char *a2, ...)
{
  return _[a1 _runPipeStates];
}

id objc_msgSend__runScannerNearbyInfo(void *a1, const char *a2, ...)
{
  return _[a1 _runScannerNearbyInfo];
}

id objc_msgSend__runScannerProxPairing(void *a1, const char *a2, ...)
{
  return _[a1 _runScannerProxPairing];
}

id objc_msgSend__runShareAudioServiceConfigRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runShareAudioServiceConfigRequest:responseHandler:");
}

id objc_msgSend__runShareAudioServiceConfigResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runShareAudioServiceConfigResponse:");
}

id objc_msgSend__runShareAudioServiceConnectRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runShareAudioServiceConnectRequest:responseHandler:");
}

id objc_msgSend__runShareAudioServiceStart(void *a1, const char *a2, ...)
{
  return _[a1 _runShareAudioServiceStart];
}

id objc_msgSend__runShowHeadphonesPairingInstructions(void *a1, const char *a2, ...)
{
  return _[a1 _runShowHeadphonesPairingInstructions];
}

id objc_msgSend__runWaitForConfigRequestOrProxTrigger(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForConfigRequestOrProxTrigger];
}

id objc_msgSend__runWaitForConnectRequest(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForConnectRequest];
}

id objc_msgSend__runWaitForGuestHeadphones(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForGuestHeadphones];
}

id objc_msgSend__runWaitForGuestHeadphonesPairingMode(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForGuestHeadphonesPairingMode];
}

id objc_msgSend__runWaitForProxTrigger(void *a1, const char *a2, ...)
{
  return _[a1 _runWaitForProxTrigger];
}

id objc_msgSend__scheduleUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleUpdate];
}

id objc_msgSend__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:");
}

id objc_msgSend__sendAudioCategory_withAudioCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAudioCategory:withAudioCategory:");
}

id objc_msgSend__sendAudioCategoryToAllTipiDevices(void *a1, const char *a2, ...)
{
  return _[a1 _sendAudioCategoryToAllTipiDevices];
}

id objc_msgSend__sendCloudConfigsToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendCloudConfigsToDevice:");
}

id objc_msgSend__sendConfigOverAAController_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendConfigOverAAController:device:completion:");
}

id objc_msgSend__sendConfigOverCBController_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendConfigOverCBController:device:completion:");
}

id objc_msgSend__sendConversationDetectMessage_destinationIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendConversationDetectMessage:destinationIdentifier:completion:");
}

id objc_msgSend__sendDeviceConfig_identifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDeviceConfig:identifier:completion:");
}

id objc_msgSend__sendSiriMultitoneConfigToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendSiriMultitoneConfigToDevice:");
}

id objc_msgSend__sendTipiHealingRequest_andOtherTipiAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendTipiHealingRequest:andOtherTipiAddress:");
}

id objc_msgSend__sendTipiScoreUpdateToWx(void *a1, const char *a2, ...)
{
  return _[a1 _sendTipiScoreUpdateToWx];
}

id objc_msgSend__setBtAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBtAddress:");
}

id objc_msgSend__setCDSignalAudioTunings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCDSignalAudioTunings:");
}

id objc_msgSend__setConnectedBannerTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConnectedBannerTick:");
}

id objc_msgSend__setConnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConnectionState:");
}

id objc_msgSend__setFirstBannerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstBannerShown:");
}

id objc_msgSend__setHighPriorityTag_withHighPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHighPriorityTag:withHighPriority:");
}

id objc_msgSend__setHijackBackoffTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHijackBackoffTick:");
}

id objc_msgSend__setInUseBannerBackoffReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInUseBannerBackoffReason:");
}

id objc_msgSend__setIncomingCallRingtoneState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIncomingCallRingtoneState:");
}

id objc_msgSend__setIsFirstConnentionAfterSREnable_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIsFirstConnentionAfterSREnable:forDevice:");
}

id objc_msgSend__setIsNearby_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIsNearby:");
}

id objc_msgSend__setManualRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualRoute:");
}

id objc_msgSend__setManualRouteChangeInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualRouteChangeInProgress:");
}

id objc_msgSend__setManualRouteFlag_withManualRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualRouteFlag:withManualRoute:");
}

id objc_msgSend__setNearbyConnectedSourceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyConnectedSourceCount:");
}

id objc_msgSend__setNearbyInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyInEar:");
}

id objc_msgSend__setNearbyLastRouteHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyLastRouteHost:");
}

id objc_msgSend__setNearbyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyName:");
}

id objc_msgSend__setNearbyOutOfCaseTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyOutOfCaseTime:");
}

id objc_msgSend__setNearbyPaired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyPaired:");
}

id objc_msgSend__setNearbyPrevInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyPrevInEar:");
}

id objc_msgSend__setNearbyProductID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyProductID:");
}

id objc_msgSend__setNearbyStreamState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyStreamState:");
}

id objc_msgSend__setNearbyWxDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyWxDevice:");
}

id objc_msgSend__setNearbyiCloudSignIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNearbyiCloudSignIn:");
}

id objc_msgSend__setOtherTipiAudioCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiAudioCategory:");
}

id objc_msgSend__setOtherTipiDeviceBTAddress_andName_sourceVersion_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiDeviceBTAddress:andName:sourceVersion:withResult:");
}

id objc_msgSend__setOtherTipiDeviceBuildVersion_andMinorBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:");
}

id objc_msgSend__setOtherTipiDeviceInfo_andName_andVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiDeviceInfo:andName:andVersion:");
}

id objc_msgSend__setOtherTipiDeviceIsWatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiDeviceIsWatch:");
}

id objc_msgSend__setOtherTipiManuallyRouteTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiManuallyRouteTick:");
}

id objc_msgSend__setOtherTipiPlayingApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOtherTipiPlayingApp:");
}

id objc_msgSend__setOwnership_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOwnership:");
}

id objc_msgSend__setPhase1ConnectConfig_andType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPhase1ConnectConfig:andType:");
}

id objc_msgSend__setPipeMessageStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPipeMessageStats:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setRouteToWxAfterUnhide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRouteToWxAfterUnhide:");
}

id objc_msgSend__setRoutedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoutedState:");
}

id objc_msgSend__setRoutingAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoutingAction:");
}

id objc_msgSend__setRoutingInitialized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoutingInitialized:");
}

id objc_msgSend__setRoutingUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoutingUI:");
}

id objc_msgSend__setShouldStayOnVirtual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldStayOnVirtual:");
}

id objc_msgSend__setTipiAndRoutedStateFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTipiAndRoutedStateFlags:");
}

id objc_msgSend__setTipiAndRoutedStateFlags_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTipiAndRoutedStateFlags:forDevice:");
}

id objc_msgSend__setTipiElectionInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTipiElectionInProgress:");
}

id objc_msgSend__setTipiElectionReceivedLePipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTipiElectionReceivedLePipe:");
}

id objc_msgSend__setTipiElectionType_withDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTipiElectionType:withDevice:");
}

id objc_msgSend__setUserConnectedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserConnectedState:");
}

id objc_msgSend__shareAudioActionScannerDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareAudioActionScannerDeviceLost:");
}

id objc_msgSend__shareAudioActionScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _shareAudioActionScannerEnsureStarted];
}

id objc_msgSend__shareAudioActionScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _shareAudioActionScannerEnsureStopped];
}

id objc_msgSend__shareAudioSessionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareAudioSessionEnded:");
}

id objc_msgSend__shareAudioSessionStartWithDarwinDevice_wxDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareAudioSessionStartWithDarwinDevice:wxDevice:");
}

id objc_msgSend__shareAudioShowConnectBanner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareAudioShowConnectBanner:");
}

id objc_msgSend__shouldSendXPCMessage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendXPCMessage];
}

id objc_msgSend__showHIDIntervalBannerIfEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showHIDIntervalBannerIfEnabled:");
}

id objc_msgSend__showHIDLagBannerIfEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showHIDLagBannerIfEnabled:");
}

id objc_msgSend__smartRoutingAddWxMapDevice_routingAction_otherAddress_otherName_otherSourceVersion_isRoutingInitialized_newWx_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:");
}

id objc_msgSend__smartRoutingAddWxMapDeviceFromConnectedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smartRoutingAddWxMapDeviceFromConnectedDevice:");
}

id objc_msgSend__smartRoutingAudioRoutingRequest_withResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smartRoutingAudioRoutingRequest:withResponseHandler:");
}

id objc_msgSend__smartRoutingChangeRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smartRoutingChangeRoute:");
}

id objc_msgSend__smartRoutingConnectionCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smartRoutingConnectionCompleted:");
}

id objc_msgSend__smartRoutingLowerRateScan(void *a1, const char *a2, ...)
{
  return _[a1 _smartRoutingLowerRateScan];
}

id objc_msgSend__smartRoutingModeCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smartRoutingModeCheck:");
}

id objc_msgSend__startHighActivityLevelTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startHighActivityLevelTimer:");
}

id objc_msgSend__startHijackMetricSubmission_wxAddress_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startHijackMetricSubmission:wxAddress:version:");
}

id objc_msgSend__startManualRouteChangeDetectionTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startManualRouteChangeDetectionTimer:");
}

id objc_msgSend__startPlaybackTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startPlaybackTimer];
}

id objc_msgSend__startQueuedRampForDuration_startLevel_endLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startQueuedRampForDuration:startLevel:endLevel:");
}

id objc_msgSend__startRingtoneTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRingtoneTimer];
}

id objc_msgSend__startRouteChangeDetectionTimer_andAnswer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRouteChangeDetectionTimer:andAnswer:");
}

id objc_msgSend__startRouteCheckTimer_andType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRouteCheckTimer:andType:");
}

id objc_msgSend__startTipiHealing_withLastConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTipiHealing:withLastConnect:");
}

id objc_msgSend__startTipiSetupTicks(void *a1, const char *a2, ...)
{
  return _[a1 _startTipiSetupTicks];
}

id objc_msgSend__statedumpAndRecordDailyMetric(void *a1, const char *a2, ...)
{
  return _[a1 _statedumpAndRecordDailyMetric];
}

id objc_msgSend__statsEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _statsEnsureStarted];
}

id objc_msgSend__submitConnectionMetric_andError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitConnectionMetric:andError:");
}

id objc_msgSend__submitHijackBlockMetric_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitHijackBlockMetric:withReason:");
}

id objc_msgSend__submitManualConnectionMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitManualConnectionMetric:");
}

id objc_msgSend__submitManualRouteDetectionMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitManualRouteDetectionMetric:");
}

id objc_msgSend__submitMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitMetric:");
}

id objc_msgSend__submitMetricTipiHealingforDevice_withDuration_andLegacy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitMetricTipiHealingforDevice:withDuration:andLegacy:");
}

id objc_msgSend__submitMetricsForMuteAction_auditTokenBundleID_appName_appBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitMetricsForMuteAction:auditTokenBundleID:appName:appBundleID:");
}

id objc_msgSend__submitNearbyDeviceMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitNearbyDeviceMetric:");
}

id objc_msgSend__submitRouteChangeDetectionMetric_andAnswer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitRouteChangeDetectionMetric:andAnswer:");
}

id objc_msgSend__submitUIMetricforTVOS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitUIMetricforTVOS:");
}

id objc_msgSend__supportsSR_andProductID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsSR:andProductID:");
}

id objc_msgSend__supportsTipi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsTipi:");
}

id objc_msgSend__tipiHealing_withDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tipiHealing:withDevice:");
}

id objc_msgSend__tipiHealingAttempt(void *a1, const char *a2, ...)
{
  return _[a1 _tipiHealingAttempt];
}

id objc_msgSend__tipiHealingHijackTimerStart_withScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tipiHealingHijackTimerStart:withScore:");
}

id objc_msgSend__tipiHealingStartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tipiHealingStartTimer:");
}

id objc_msgSend__tipihHealingV2Handling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tipihHealingV2Handling:");
}

id objc_msgSend__triggerTipiTableUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerTipiTableUpdate:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateAccessoriesWithPauseState(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccessoriesWithPauseState];
}

id objc_msgSend__updateAccessoryID_connectionDeviceAddresses_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAccessoryID:connectionDeviceAddresses:completion:");
}

id objc_msgSend__updateAudioRoute_withUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAudioRoute:withUUID:");
}

id objc_msgSend__updateBannerChimeSuppressionState(void *a1, const char *a2, ...)
{
  return _[a1 _updateBannerChimeSuppressionState];
}

id objc_msgSend__updateConversationDetectSignal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConversationDetectSignal:");
}

id objc_msgSend__updateHijackBlockingClientWithBundleID_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateHijackBlockingClientWithBundleID:mode:");
}

id objc_msgSend__updateLocalAudioCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalAudioCategory:");
}

id objc_msgSend__updateMasterZoneBlob_accessoryblob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMasterZoneBlob:accessoryblob:");
}

id objc_msgSend__updateMuteAction_auditToken_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMuteAction:auditToken:bundleIdentifier:");
}

id objc_msgSend__updateNearbyDeviceState_withAddress_withEasyPairing_withState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:");
}

id objc_msgSend__updateOtherTipiBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOtherTipiBuildVersion:");
}

id objc_msgSend__updateOtherTipiDevice_otherAddress_otherName_otherVersion_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:");
}

id objc_msgSend__updateOtherTipiDevicewithAudioCategory_otherAddress_otherName_otherVersion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:");
}

id objc_msgSend__updatePauseState(void *a1, const char *a2, ...)
{
  return _[a1 _updatePauseState];
}

id objc_msgSend__updateRoutingActionForManuallyRoute(void *a1, const char *a2, ...)
{
  return _[a1 _updateRoutingActionForManuallyRoute];
}

id objc_msgSend__updateSRDiscoveredDeviceForCBDeviceChanged_connectionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:");
}

id objc_msgSend__updateSRDiscoveredDeviceForNearbyWxChanged_isNearby_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:");
}

id objc_msgSend__verifyWxConnectedBTAddress_withVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyWxConnectedBTAddress:withVersion:");
}

id objc_msgSend__verifyWxConnectedRouted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyWxConnectedRouted:");
}

id objc_msgSend__wxDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wxDeviceLost:");
}

id objc_msgSend__wxDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryEnsureStarted];
}

id objc_msgSend__wxDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _wxDiscoveryEnsureStopped];
}

id objc_msgSend__wxDiscoveryWatchRecoveryLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wxDiscoveryWatchRecoveryLostDevice:");
}

id objc_msgSend__xpcConnectionInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcConnectionInvalidated:");
}

id objc_msgSend__xpcReceivedAccessoryEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcReceivedAccessoryEvent:");
}

id objc_msgSend__xpcReceivedAudioAccessoryDeviceInfoChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcReceivedAudioAccessoryDeviceInfoChange:");
}

id objc_msgSend__xpcReceivedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcReceivedMessage:");
}

id objc_msgSend_aaServicesRequireReset(void *a1, const char *a2, ...)
{
  return _[a1 aaServicesRequireReset];
}

id objc_msgSend_acceptReplyPlayPauseConfig(void *a1, const char *a2, ...)
{
  return _[a1 acceptReplyPlayPauseConfig];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAvailable(void *a1, const char *a2, ...)
{
  return _[a1 accountAvailable];
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return _[a1 accountStatus];
}

id objc_msgSend_accountStatusAvailable_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStatusAvailable:force:");
}

id objc_msgSend_accountStatusDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStatusDidChange:");
}

id objc_msgSend_accountStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStatusWithCompletionHandler:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_aclPriority(void *a1, const char *a2, ...)
{
  return _[a1 aclPriority];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAssertionWithIdentifier:");
}

id objc_msgSend_activateAudioSessionControl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAudioSessionControl:completion:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeCallCount(void *a1, const char *a2, ...)
{
  return _[a1 activeCallCount];
}

id objc_msgSend_activePlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 activePlayingApp];
}

id objc_msgSend_activeTransactions(void *a1, const char *a2, ...)
{
  return _[a1 activeTransactions];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityHandler(void *a1, const char *a2, ...)
{
  return _[a1 activityHandler];
}

id objc_msgSend_adaptiveVolumeConfig(void *a1, const char *a2, ...)
{
  return _[a1 adaptiveVolumeConfig];
}

id objc_msgSend_addAccountMagicKeysWithCloudRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountMagicKeysWithCloudRecord:");
}

id objc_msgSend_addActionWithIdentifier_title_flags_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActionWithIdentifier:title:flags:handler:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDeviceMagicSettingsWithRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceMagicSettingsWithRecord:completion:");
}

id objc_msgSend_addDeviceSupportInformationWithRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceSupportInformationWithRecord:completion:");
}

id objc_msgSend_addDeviceWithRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceWithRecord:completion:");
}

id objc_msgSend_addLegacyMagicPairingRecordsWithCloudRecord_userInitiated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLegacyMagicPairingRecordsWithCloudRecord:userInitiated:completion:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_addSoundProfileRecordWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSoundProfileRecordWithURL:completion:");
}

id objc_msgSend_addWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWithDelegate:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_addressData(void *a1, const char *a2, ...)
{
  return _[a1 addressData];
}

id objc_msgSend_addressString(void *a1, const char *a2, ...)
{
  return _[a1 addressString];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return _[a1 advertisementFields];
}

id objc_msgSend_allDevicesStarSky(void *a1, const char *a2, ...)
{
  return _[a1 allDevicesStarSky];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowHijackWithAudioScore_hijackRoute_hijackDeniedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:");
}

id objc_msgSend_allowNoiseManagementOff(void *a1, const char *a2, ...)
{
  return _[a1 allowNoiseManagementOff];
}

id objc_msgSend_allowsAutoRoute(void *a1, const char *a2, ...)
{
  return _[a1 allowsAutoRoute];
}

id objc_msgSend_appBundleID(void *a1, const char *a2, ...)
{
  return _[a1 appBundleID];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appleIDAddProof_dispatchQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleIDAddProof:dispatchQueue:completion:");
}

id objc_msgSend_appleIDVerifyProof_dispatchQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleIDVerifyProof:dispatchQueue:completion:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedDevices(void *a1, const char *a2, ...)
{
  return _[a1 associatedDevices];
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_audioDestination(void *a1, const char *a2, ...)
{
  return _[a1 audioDestination];
}

id objc_msgSend_audioRoute(void *a1, const char *a2, ...)
{
  return _[a1 audioRoute];
}

id objc_msgSend_audioRouteHidden(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteHidden];
}

id objc_msgSend_audioRoutingClientID(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingClientID];
}

id objc_msgSend_audioRoutingRequest(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingRequest];
}

id objc_msgSend_audioRoutingResponse(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingResponse];
}

id objc_msgSend_audioRoutingScore(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingScore];
}

id objc_msgSend_audioScore(void *a1, const char *a2, ...)
{
  return _[a1 audioScore];
}

id objc_msgSend_audioSession(void *a1, const char *a2, ...)
{
  return _[a1 audioSession];
}

id objc_msgSend_audioSessionControlActivate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioSessionControlActivate:completion:");
}

id objc_msgSend_audioSessionControlUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioSessionControlUpdate:");
}

id objc_msgSend_audioState(void *a1, const char *a2, ...)
{
  return _[a1 audioState];
}

id objc_msgSend_audioStreamState(void *a1, const char *a2, ...)
{
  return _[a1 audioStreamState];
}

id objc_msgSend_audiogramCreationTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 audiogramCreationTimestamp];
}

id objc_msgSend_audiogramEnrolledTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 audiogramEnrolledTimestamp];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoANCStrength(void *a1, const char *a2, ...)
{
  return _[a1 autoANCStrength];
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return _[a1 availableDevices];
}

id objc_msgSend_bannerAction(void *a1, const char *a2, ...)
{
  return _[a1 bannerAction];
}

id objc_msgSend_bannerTrigger(void *a1, const char *a2, ...)
{
  return _[a1 bannerTrigger];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_batteryInfo(void *a1, const char *a2, ...)
{
  return _[a1 batteryInfo];
}

id objc_msgSend_batteryLeft(void *a1, const char *a2, ...)
{
  return _[a1 batteryLeft];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevel];
}

id objc_msgSend_batteryLevelLeft(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelLeft];
}

id objc_msgSend_batteryLevelMain(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelMain];
}

id objc_msgSend_batteryLevelRight(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelRight];
}

id objc_msgSend_batteryMain(void *a1, const char *a2, ...)
{
  return _[a1 batteryMain];
}

id objc_msgSend_batteryRight(void *a1, const char *a2, ...)
{
  return _[a1 batteryRight];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _[a1 batteryState];
}

id objc_msgSend_batteryType(void *a1, const char *a2, ...)
{
  return _[a1 batteryType];
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction:");
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _[a1 bleDevice];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAddress];
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothIdentifier];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _[a1 btAddressData];
}

id objc_msgSend_btXID(void *a1, const char *a2, ...)
{
  return _[a1 btXID];
}

id objc_msgSend_buddySetupDone(void *a1, const char *a2, ...)
{
  return _[a1 buddySetupDone];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedIsNetworkUp(void *a1, const char *a2, ...)
{
  return _[a1 cachedIsNetworkUp];
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCenterWithQueue:");
}

id objc_msgSend_callConnected(void *a1, const char *a2, ...)
{
  return _[a1 callConnected];
}

id objc_msgSend_callCountIncomingConnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountIncomingConnected];
}

id objc_msgSend_callCountIncomingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountIncomingUnconnected];
}

id objc_msgSend_callCountOutgoingConnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountOutgoingConnected];
}

id objc_msgSend_callCountOutgoingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callCountOutgoingUnconnected];
}

id objc_msgSend_callIncomingUnconnected(void *a1, const char *a2, ...)
{
  return _[a1 callIncomingUnconnected];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUID];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 callbackQueue];
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _[a1 canSend];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cdSignalAudioInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 cdSignalAudioInterrupted];
}

id objc_msgSend_centerContentItemsText(void *a1, const char *a2, ...)
{
  return _[a1 centerContentItemsText];
}

id objc_msgSend_checkFirstUnlockForIDS(void *a1, const char *a2, ...)
{
  return _[a1 checkFirstUnlockForIDS];
}

id objc_msgSend_clickHoldModeLeft(void *a1, const char *a2, ...)
{
  return _[a1 clickHoldModeLeft];
}

id objc_msgSend_clickHoldModeRight(void *a1, const char *a2, ...)
{
  return _[a1 clickHoldModeRight];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_clientReportHMDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientReportHMDeviceCloudRecordInfosUpdated:");
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return _[a1 clients];
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeAndReturnError:");
}

id objc_msgSend_cloudAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 cloudAccountInfo];
}

id objc_msgSend_cloudContainerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudContainerIdentifier];
}

id objc_msgSend_cloudDevices(void *a1, const char *a2, ...)
{
  return _[a1 cloudDevices];
}

id objc_msgSend_cloudIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudIdentifier];
}

id objc_msgSend_cloudKitConnection(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitConnection];
}

id objc_msgSend_cloudKitContainer(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitContainer];
}

id objc_msgSend_cloudKitDatabase(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitDatabase];
}

id objc_msgSend_cloudPairingCompletedWithResponse_localKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:");
}

id objc_msgSend_cloudPairingQueue(void *a1, const char *a2, ...)
{
  return _[a1 cloudPairingQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_colorCode(void *a1, const char *a2, ...)
{
  return _[a1 colorCode];
}

id objc_msgSend_colorCodeBest(void *a1, const char *a2, ...)
{
  return _[a1 colorCodeBest];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_conduitDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 conduitDeviceID];
}

id objc_msgSend_conduitMessageTicks(void *a1, const char *a2, ...)
{
  return _[a1 conduitMessageTicks];
}

id objc_msgSend_conduitMessageTimer(void *a1, const char *a2, ...)
{
  return _[a1 conduitMessageTimer];
}

id objc_msgSend_conferencingCallSets(void *a1, const char *a2, ...)
{
  return _[a1 conferencingCallSets];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return _[a1 connected];
}

id objc_msgSend_connectedCallCount(void *a1, const char *a2, ...)
{
  return _[a1 connectedCallCount];
}

id objc_msgSend_connectedServices(void *a1, const char *a2, ...)
{
  return _[a1 connectedServices];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_connectionUpdatedForBluetoothIdentifier_connected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionUpdatedForBluetoothIdentifier:connected:");
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_controllerInfoAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerInfoAndReturnError:");
}

id objc_msgSend_conversationDetectCapability(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectCapability];
}

id objc_msgSend_conversationDetectConfig(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectConfig];
}

id objc_msgSend_conversationDetectSignal(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectSignal];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_coreBluetoothDevice(void *a1, const char *a2, ...)
{
  return _[a1 coreBluetoothDevice];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_counterpartIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 counterpartIdentifier];
}

id objc_msgSend_cpDescription(void *a1, const char *a2, ...)
{
  return _[a1 cpDescription];
}

id objc_msgSend_createDeviceRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDeviceRecord:completion:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createSoundProfileRecordStagingURL(void *a1, const char *a2, ...)
{
  return _[a1 createSoundProfileRecordStagingURL];
}

id objc_msgSend_createSubscritionForRecordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSubscritionForRecordType:");
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return _[a1 criteria];
}

id objc_msgSend_crownRotationDirection(void *a1, const char *a2, ...)
{
  return _[a1 crownRotationDirection];
}

id objc_msgSend_cuFilteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cuFilteredArrayUsingBlock:");
}

id objc_msgSend_cuValueForEntitlementNoCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cuValueForEntitlementNoCache:");
}

id objc_msgSend_currentCDDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentCDDeviceIdentifier];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_declineDismissSkipConfig(void *a1, const char *a2, ...)
{
  return _[a1 declineDismissSkipConfig];
}

id objc_msgSend_defaultAudioTunings(void *a1, const char *a2, ...)
{
  return _[a1 defaultAudioTunings];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteCloudKitAccessoryZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteCloudKitAccessoryZone];
}

id objc_msgSend_deleteLegacyMagicPairingRecordsWithUserInitiated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteLegacyMagicPairingRecordsWithUserInitiated:completion:");
}

id objc_msgSend_deleteLegacyMasterKey(void *a1, const char *a2, ...)
{
  return _[a1 deleteLegacyMasterKey];
}

id objc_msgSend_deleteRecordWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordWithID:completionHandler:");
}

id objc_msgSend_deleteRecordZoneWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordZoneWithID:completionHandler:");
}

id objc_msgSend_deleteSubscriptionWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSubscriptionWithID:completionHandler:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return _[a1 deviceActionType];
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 deviceAddress];
}

id objc_msgSend_deviceConnectedWithAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceConnectedWithAddress:");
}

id objc_msgSend_deviceDisconnectedWithAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDisconnectedWithAddress:");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForFromID:");
}

id objc_msgSend_deviceForIDSDevice_createNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForIDSDevice:createNew:");
}

id objc_msgSend_deviceHeadGestureDetected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceHeadGestureDetected:");
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return _[a1 deviceManager];
}

id objc_msgSend_deviceManagerFoundDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagerFoundDevice:");
}

id objc_msgSend_deviceManagerLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagerLostDevice:");
}

id objc_msgSend_deviceManagerReportDeviceFound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagerReportDeviceFound:");
}

id objc_msgSend_deviceManagerReportDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagerReportDeviceLost:");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_deviceTypeToString(void *a1, const char *a2, ...)
{
  return _[a1 deviceTypeToString];
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return _[a1 deviceVersion];
}

id objc_msgSend_deviceWithIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceWithIDSDevice:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_diagnosticControl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticControl:completion:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_directoryChanged(void *a1, const char *a2, ...)
{
  return _[a1 directoryChanged];
}

id objc_msgSend_directoryURL(void *a1, const char *a2, ...)
{
  return _[a1 directoryURL];
}

id objc_msgSend_disableCount(void *a1, const char *a2, ...)
{
  return _[a1 disableCount];
}

id objc_msgSend_discoverableState(void *a1, const char *a2, ...)
{
  return _[a1 discoverableState];
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _[a1 discoveredDevices];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_dispatchSourceAbort(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceAbort];
}

id objc_msgSend_dispatchSourceChange(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceChange];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleTapActionLeft(void *a1, const char *a2, ...)
{
  return _[a1 doubleTapActionLeft];
}

id objc_msgSend_doubleTapActionRight(void *a1, const char *a2, ...)
{
  return _[a1 doubleTapActionRight];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_duetActivitySchedulerData(void *a1, const char *a2, ...)
{
  return _[a1 duetActivitySchedulerData];
}

id objc_msgSend_enableCount(void *a1, const char *a2, ...)
{
  return _[a1 enableCount];
}

id objc_msgSend_enableHearingAidGainSwipe(void *a1, const char *a2, ...)
{
  return _[a1 enableHearingAidGainSwipe];
}

id objc_msgSend_enableHearingAssist(void *a1, const char *a2, ...)
{
  return _[a1 enableHearingAssist];
}

id objc_msgSend_enableHeartRateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 enableHeartRateMonitor];
}

id objc_msgSend_enableSiriMultitone(void *a1, const char *a2, ...)
{
  return _[a1 enableSiriMultitone];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValues];
}

id objc_msgSend_endCallConfig(void *a1, const char *a2, ...)
{
  return _[a1 endCallConfig];
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction:");
}

id objc_msgSend_entitled(void *a1, const char *a2, ...)
{
  return _[a1 entitled];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishBluetoothdXPCWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishBluetoothdXPCWithCompletion:");
}

id objc_msgSend_evalPreemptiveBannerResult(void *a1, const char *a2, ...)
{
  return _[a1 evalPreemptiveBannerResult];
}

id objc_msgSend_evalResult(void *a1, const char *a2, ...)
{
  return _[a1 evalResult];
}

id objc_msgSend_evalTicks(void *a1, const char *a2, ...)
{
  return _[a1 evalTicks];
}

id objc_msgSend_evalWxMap(void *a1, const char *a2, ...)
{
  return _[a1 evalWxMap];
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return _[a1 evaluator];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_falseRouteCheckForceDisconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckForceDisconnectTimer];
}

id objc_msgSend_falseRouteCheckHijackAwayTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckHijackAwayTimer];
}

id objc_msgSend_falseRouteCheckHijackTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckHijackTimer];
}

id objc_msgSend_falseRouteCheckOnDemandTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckOnDemandTimer];
}

id objc_msgSend_falseRouteCheckOwnLostTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckOwnLostTimer];
}

id objc_msgSend_falseRouteCheckProactiveRoutingTimer(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckProactiveRoutingTimer];
}

id objc_msgSend_falseRouteCheckReason(void *a1, const char *a2, ...)
{
  return _[a1 falseRouteCheckReason];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return _[a1 fd];
}

id objc_msgSend_fetchAADeviceRecordSyncWithAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAADeviceRecordSyncWithAddress:");
}

id objc_msgSend_fetchAAProxCardsInfoWithAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAAProxCardsInfoWithAddress:completion:");
}

id objc_msgSend_fetchAccessoryKeyBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccessoryKeyBlob:");
}

id objc_msgSend_fetchAccountMagicKeysBlobWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccountMagicKeysBlobWithCompletion:");
}

id objc_msgSend_fetchAccountStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccountStatusWithCompletion:");
}

id objc_msgSend_fetchAllSubscriptionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllSubscriptionsWithCompletionHandler:");
}

id objc_msgSend_fetchCached(void *a1, const char *a2, ...)
{
  return _[a1 fetchCached];
}

id objc_msgSend_fetchCloudPairingIdentifierForPeripheral_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCloudPairingIdentifierForPeripheral:withCompletion:");
}

id objc_msgSend_fetchDeviceList(void *a1, const char *a2, ...)
{
  return _[a1 fetchDeviceList];
}

id objc_msgSend_fetchDeviceRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceRecordsWithCompletion:");
}

id objc_msgSend_fetchDeviceSupportInformationRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceSupportInformationRecordWithAddress:completion:");
}

id objc_msgSend_fetchDeviceSupportInformationRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceSupportInformationRecordsWithCompletion:");
}

id objc_msgSend_fetchDeviceSyncWithAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceSyncWithAddress:");
}

id objc_msgSend_fetchDeviceWithAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceWithAddress:completion:");
}

id objc_msgSend_fetchHMDeviceCloudRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHMDeviceCloudRecordWithAddress:completion:");
}

id objc_msgSend_fetchIDSDevicesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIDSDevicesWithCompletion:");
}

id objc_msgSend_fetchInCallUIState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchInCallUIState:");
}

id objc_msgSend_fetchKeyBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchKeyBlob:");
}

id objc_msgSend_fetchLegacyMagicPairingRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLegacyMagicPairingRecordsWithCompletion:");
}

id objc_msgSend_fetchMagicPairingSettingsRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMagicPairingSettingsRecordsWithCompletion:");
}

id objc_msgSend_fetchMagicSettingsRecordWithAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMagicSettingsRecordWithAddress:completion:");
}

id objc_msgSend_fetchNicknameDevice(void *a1, const char *a2, ...)
{
  return _[a1 fetchNicknameDevice];
}

id objc_msgSend_fetchPublicAddressWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPublicAddressWithCompletion:");
}

id objc_msgSend_fetchRecordWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordWithID:completionHandler:");
}

id objc_msgSend_fetchSoundProfileRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSoundProfileRecordWithCompletion:");
}

id objc_msgSend_fetchSubscriptionWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSubscriptionWithID:completionHandler:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileDiscovered(void *a1, const char *a2, ...)
{
  return _[a1 fileDiscovered];
}

id objc_msgSend_fileHandleForWritingToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForWritingToURL:error:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredDevicesForIDSDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredDevicesForIDSDevices:");
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 firmwareVersion];
}

id objc_msgSend_firstBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 firstBannerShown];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPipeMessageRTT(void *a1, const char *a2, ...)
{
  return _[a1 firstPipeMessageRTT];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 forceAccountStatus];
}

id objc_msgSend_generateKeyDictForTypes_keyLength_forAddress_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:");
}

id objc_msgSend_getAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 getAccountStatus];
}

id objc_msgSend_getActiveCategoryVolume_andName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveCategoryVolume:andName:");
}

id objc_msgSend_getHijackAudioInfo_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHijackAudioInfo:appCount:playingApp:route:remote:");
}

id objc_msgSend_getHijackedAwayAudioInfo_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHijackedAwayAudioInfo:appCount:playingApp:route:remote:");
}

id objc_msgSend_getLocalAudioInfofromSnapshot_appCount_playingApp_route_remote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalAudioInfofromSnapshot:appCount:playingApp:route:remote:");
}

id objc_msgSend_getSmartRoutingStateForDeviceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSmartRoutingStateForDeviceAddress:");
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 gracePeriod];
}

id objc_msgSend_handleAccessoryKeyModifyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccessoryKeyModifyError:forBlob:withRetryCount:");
}

id objc_msgSend_handleAccessoryModifyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccessoryModifyError:forBlob:withRetryCount:");
}

id objc_msgSend_handleActivity(void *a1, const char *a2, ...)
{
  return _[a1 handleActivity];
}

id objc_msgSend_handleActivityScoreUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleActivityScoreUpdate:");
}

id objc_msgSend_handleCloudPairingMessage_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCloudPairingMessage:from:");
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnection:");
}

id objc_msgSend_handleConnection_XPCMessage_userID_processID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnection:XPCMessage:userID:processID:");
}

id objc_msgSend_handleDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleDisconnection];
}

id objc_msgSend_handleEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEvent:");
}

id objc_msgSend_handleInitiatorPairingKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInitiatorPairingKeys:from:forProtocolID:");
}

id objc_msgSend_handleKeyDistribution_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyDistribution:from:");
}

id objc_msgSend_handleModifyMasterKeyError_forBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleModifyMasterKeyError:forBlob:withRetryCount:");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMsg:");
}

id objc_msgSend_handlePairingFailure_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairingFailure:from:");
}

id objc_msgSend_handlePairingRequest_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairingRequest:from:");
}

id objc_msgSend_handlePairingResponse_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairingResponse:from:");
}

id objc_msgSend_handleRepairRequest_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRepairRequest:from:");
}

id objc_msgSend_handleResponderPairingKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResponderPairingKeys:from:forProtocolID:");
}

id objc_msgSend_handleSecurityRequest_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSecurityRequest:from:");
}

id objc_msgSend_handleUnpairCommand_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUnpairCommand:from:");
}

id objc_msgSend_hardwareAddressData(void *a1, const char *a2, ...)
{
  return _[a1 hardwareAddressData];
}

id objc_msgSend_hasOwnership(void *a1, const char *a2, ...)
{
  return _[a1 hasOwnership];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_headGestureMode(void *a1, const char *a2, ...)
{
  return _[a1 headGestureMode];
}

id objc_msgSend_headGestureToggle(void *a1, const char *a2, ...)
{
  return _[a1 headGestureToggle];
}

id objc_msgSend_headGestureUpdateFlags(void *a1, const char *a2, ...)
{
  return _[a1 headGestureUpdateFlags];
}

id objc_msgSend_hearingAidEnrolled(void *a1, const char *a2, ...)
{
  return _[a1 hearingAidEnrolled];
}

id objc_msgSend_hearingAidToggle(void *a1, const char *a2, ...)
{
  return _[a1 hearingAidToggle];
}

id objc_msgSend_hijackActiveRemoteScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackActiveRemoteScore];
}

id objc_msgSend_hijackAmbientTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackAmbientTick];
}

id objc_msgSend_hijackAnswer(void *a1, const char *a2, ...)
{
  return _[a1 hijackAnswer];
}

id objc_msgSend_hijackAwayLocalScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackAwayLocalScore];
}

id objc_msgSend_hijackAwayRemoteScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackAwayRemoteScore];
}

id objc_msgSend_hijackBackoffTicks(void *a1, const char *a2, ...)
{
  return _[a1 hijackBackoffTicks];
}

id objc_msgSend_hijackBlockingClientSet(void *a1, const char *a2, ...)
{
  return _[a1 hijackBlockingClientSet];
}

id objc_msgSend_hijackCallTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackCallTick];
}

id objc_msgSend_hijackContinuousTimeoutCount(void *a1, const char *a2, ...)
{
  return _[a1 hijackContinuousTimeoutCount];
}

id objc_msgSend_hijackInputTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackInputTick];
}

id objc_msgSend_hijackMediaTick(void *a1, const char *a2, ...)
{
  return _[a1 hijackMediaTick];
}

id objc_msgSend_hijackPlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 hijackPlayingApp];
}

id objc_msgSend_hijackPlayingCategory(void *a1, const char *a2, ...)
{
  return _[a1 hijackPlayingCategory];
}

id objc_msgSend_hijackRelaySent(void *a1, const char *a2, ...)
{
  return _[a1 hijackRelaySent];
}

id objc_msgSend_hijackRoundTripTime(void *a1, const char *a2, ...)
{
  return _[a1 hijackRoundTripTime];
}

id objc_msgSend_hijackScore(void *a1, const char *a2, ...)
{
  return _[a1 hijackScore];
}

id objc_msgSend_hijackVersion(void *a1, const char *a2, ...)
{
  return _[a1 hijackVersion];
}

id objc_msgSend_hmDeviceCloudRecordInfo(void *a1, const char *a2, ...)
{
  return _[a1 hmDeviceCloudRecordInfo];
}

id objc_msgSend_hmDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hmDeviceCloudRecordInfosUpdated:");
}

id objc_msgSend_iCloudAccount(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsDevice(void *a1, const char *a2, ...)
{
  return _[a1 idsDevice];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsIdentifier];
}

id objc_msgSend_inEar(void *a1, const char *a2, ...)
{
  return _[a1 inEar];
}

id objc_msgSend_inEarDisabled(void *a1, const char *a2, ...)
{
  return _[a1 inEarDisabled];
}

id objc_msgSend_inUseBannerBackoffTick(void *a1, const char *a2, ...)
{
  return _[a1 inUseBannerBackoffTick];
}

id objc_msgSend_incomingCallRingtone(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallRingtone];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initProxyForProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initProxyForProcess:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBluetoothAddress:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:error:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSDevice:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithName_date_gracePeriod_priority_options_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:date:gracePeriod:priority:options:block:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithRecordIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordIDs:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithURL_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:action:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithXPCObject_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCObject:error:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_initializeCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 initializeCloudKit];
}

id objc_msgSend_initializeIDS(void *a1, const char *a2, ...)
{
  return _[a1 initializeIDS];
}

id objc_msgSend_initializedCKAfterFirstUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 initializedCKAfterFirstUnlockedSinceBoot];
}

id objc_msgSend_initiatePairing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatePairing:");
}

id objc_msgSend_initiatePairingAgainIfNoAckReceived_attempt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatePairingAgainIfNoAckReceived:attempt:");
}

id objc_msgSend_inquiryState(void *a1, const char *a2, ...)
{
  return _[a1 inquiryState];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalFlags(void *a1, const char *a2, ...)
{
  return _[a1 internalFlags];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAudioSessionControl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAudioSessionControl:completion:");
}

id objc_msgSend_isAccountActive(void *a1, const char *a2, ...)
{
  return _[a1 isAccountActive];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isBuddyComplete(void *a1, const char *a2, ...)
{
  return _[a1 isBuddyComplete];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isDeviceClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceClass:");
}

id objc_msgSend_isEndpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 isEndpointOnCurrentDevice];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFetchInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isFetchInProgress];
}

id objc_msgSend_isFetchMasterKeyInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isFetchMasterKeyInProgress];
}

id objc_msgSend_isFirstConnectionAfterSREnable(void *a1, const char *a2, ...)
{
  return _[a1 isFirstConnectionAfterSREnable];
}

id objc_msgSend_isFirstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isFirstUnlocked];
}

id objc_msgSend_isHSATrusted(void *a1, const char *a2, ...)
{
  return _[a1 isHSATrusted];
}

id objc_msgSend_isInAnyTipi(void *a1, const char *a2, ...)
{
  return _[a1 isInAnyTipi];
}

id objc_msgSend_isInEar(void *a1, const char *a2, ...)
{
  return _[a1 isInEar];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _[a1 isIncoming];
}

id objc_msgSend_isMicIndicatorVisible(void *a1, const char *a2, ...)
{
  return _[a1 isMicIndicatorVisible];
}

id objc_msgSend_isMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 isMonitoring];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isNetworkUp(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkUp];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 isOutgoing];
}

id objc_msgSend_isPTT(void *a1, const char *a2, ...)
{
  return _[a1 isPTT];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return _[a1 isReady];
}

id objc_msgSend_isRoutingActionInitialized(void *a1, const char *a2, ...)
{
  return _[a1 isRoutingActionInitialized];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSystemProvider];
}

id objc_msgSend_isTipiHealingV2Eligible(void *a1, const char *a2, ...)
{
  return _[a1 isTipiHealingV2Eligible];
}

id objc_msgSend_isUTPConnected(void *a1, const char *a2, ...)
{
  return _[a1 isUTPConnected];
}

id objc_msgSend_isWatchingBuddy(void *a1, const char *a2, ...)
{
  return _[a1 isWatchingBuddy];
}

id objc_msgSend_isWriteMasterKeysInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isWriteMasterKeysInProgress];
}

id objc_msgSend_keyLength(void *a1, const char *a2, ...)
{
  return _[a1 keyLength];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_lastBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 lastBatteryLevel];
}

id objc_msgSend_lastBatteryType(void *a1, const char *a2, ...)
{
  return _[a1 lastBatteryType];
}

id objc_msgSend_lastConnectHost(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectHost];
}

id objc_msgSend_lastConnectResult(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectResult];
}

id objc_msgSend_lastConnectTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectTicks];
}

id objc_msgSend_lastConnectionTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectionTicks];
}

id objc_msgSend_lastEvalResult(void *a1, const char *a2, ...)
{
  return _[a1 lastEvalResult];
}

id objc_msgSend_lastEvalTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastEvalTicks];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPlay(void *a1, const char *a2, ...)
{
  return _[a1 lastPlay];
}

id objc_msgSend_lastSeenTime(void *a1, const char *a2, ...)
{
  return _[a1 lastSeenTime];
}

id objc_msgSend_lastWxAdvTicks(void *a1, const char *a2, ...)
{
  return _[a1 lastWxAdvTicks];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lidClosed(void *a1, const char *a2, ...)
{
  return _[a1 lidClosed];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return _[a1 listeningMode];
}

id objc_msgSend_listeningModeConfigs(void *a1, const char *a2, ...)
{
  return _[a1 listeningModeConfigs];
}

id objc_msgSend_listeningModeOffAllowed(void *a1, const char *a2, ...)
{
  return _[a1 listeningModeOffAllowed];
}

id objc_msgSend_localAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 localAudioScore];
}

id objc_msgSend_localDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceName];
}

id objc_msgSend_localDeviceRandomAddress(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceRandomAddress];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStandardContainsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardContainsString:");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_magnetConnected(void *a1, const char *a2, ...)
{
  return _[a1 magnetConnected];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_manateeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 manateeAvailable];
}

id objc_msgSend_manateeZoneAvailable(void *a1, const char *a2, ...)
{
  return _[a1 manateeZoneAvailable];
}

id objc_msgSend_manateeZoneUpgraded(void *a1, const char *a2, ...)
{
  return _[a1 manateeZoneUpgraded];
}

id objc_msgSend_manualRouteChangeDetectionTimer(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteChangeDetectionTimer];
}

id objc_msgSend_manualRouteChangeInProgress(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteChangeInProgress];
}

id objc_msgSend_manualRouteDestination(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteDestination];
}

id objc_msgSend_manualRouteInputOutput(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteInputOutput];
}

id objc_msgSend_manualRouteUISource(void *a1, const char *a2, ...)
{
  return _[a1 manualRouteUISource];
}

id objc_msgSend_manuallyRouted(void *a1, const char *a2, ...)
{
  return _[a1 manuallyRouted];
}

id objc_msgSend_markLegacyNonManateeContainerMigrated(void *a1, const char *a2, ...)
{
  return _[a1 markLegacyNonManateeContainerMigrated];
}

id objc_msgSend_masterBlob(void *a1, const char *a2, ...)
{
  return _[a1 masterBlob];
}

id objc_msgSend_mediaPlaying(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlaying];
}

id objc_msgSend_messageIdentifiersWaitingForAck(void *a1, const char *a2, ...)
{
  return _[a1 messageIdentifiersWaitingForAck];
}

id objc_msgSend_microphoneMode(void *a1, const char *a2, ...)
{
  return _[a1 microphoneMode];
}

id objc_msgSend_minRSSIHeadset(void *a1, const char *a2, ...)
{
  return _[a1 minRSSIHeadset];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_modifiedByDevice(void *a1, const char *a2, ...)
{
  return _[a1 modifiedByDevice];
}

id objc_msgSend_modifyAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyAccessoryBlob:withRetryCount:");
}

id objc_msgSend_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:");
}

id objc_msgSend_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:");
}

id objc_msgSend_modifyDevice_settings_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyDevice:settings:completion:");
}

id objc_msgSend_modifyKeyBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyKeyBlob:withRetryCount:");
}

id objc_msgSend_modifyOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 modifyOperationQueue];
}

id objc_msgSend_modifyOperationTimer(void *a1, const char *a2, ...)
{
  return _[a1 modifyOperationTimer];
}

id objc_msgSend_monitorBuddyStateWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorBuddyStateWithAction:");
}

id objc_msgSend_monitorFirstUnlockWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorFirstUnlockWithAction:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_muteControlConfig(void *a1, const char *a2, ...)
{
  return _[a1 muteControlConfig];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nearbyDeviceNoTipiScoreCount(void *a1, const char *a2, ...)
{
  return _[a1 nearbyDeviceNoTipiScoreCount];
}

id objc_msgSend_nearbyInEar(void *a1, const char *a2, ...)
{
  return _[a1 nearbyInEar];
}

id objc_msgSend_needsSetup(void *a1, const char *a2, ...)
{
  return _[a1 needsSetup];
}

id objc_msgSend_needsUpdateToAAController(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdateToAAController];
}

id objc_msgSend_needsUpdateToDeviceCloudRecord(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdateToDeviceCloudRecord];
}

id objc_msgSend_networkMonitor(void *a1, const char *a2, ...)
{
  return _[a1 networkMonitor];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_nicknameDevice(void *a1, const char *a2, ...)
{
  return _[a1 nicknameDevice];
}

id objc_msgSend_noNearbyDeviceFoundCount(void *a1, const char *a2, ...)
{
  return _[a1 noNearbyDeviceFoundCount];
}

id objc_msgSend_notificationFromRemoteNotificationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationFromRemoteNotificationDictionary:");
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return _[a1 nsuuid];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onDemandCategory(void *a1, const char *a2, ...)
{
  return _[a1 onDemandCategory];
}

id objc_msgSend_oneSourceLastRouteHost(void *a1, const char *a2, ...)
{
  return _[a1 oneSourceLastRouteHost];
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersion];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_otherTipiAudioCategory(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiAudioCategory];
}

id objc_msgSend_otherTipiDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceAudioScore];
}

id objc_msgSend_otherTipiDeviceBTAddress(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceBTAddress];
}

id objc_msgSend_otherTipiDeviceBTName(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceBTName];
}

id objc_msgSend_otherTipiDeviceIdleTick(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceIdleTick];
}

id objc_msgSend_otherTipiDeviceIsWatch(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceIsWatch];
}

id objc_msgSend_otherTipiDeviceLastPlay(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceLastPlay];
}

id objc_msgSend_otherTipiDeviceMajorBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceMajorBuildVersion];
}

id objc_msgSend_otherTipiDeviceMinorBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceMinorBuildVersion];
}

id objc_msgSend_otherTipiDevicePlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDevicePlayingApp];
}

id objc_msgSend_otherTipiDeviceVersion(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiDeviceVersion];
}

id objc_msgSend_otherTipiManuallyRouteTicks(void *a1, const char *a2, ...)
{
  return _[a1 otherTipiManuallyRouteTicks];
}

id objc_msgSend_outOfCaseTime(void *a1, const char *a2, ...)
{
  return _[a1 outOfCaseTime];
}

id objc_msgSend_overrideScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 overrideScreenOff];
}

id objc_msgSend_pairSetupWithFlags_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairSetupWithFlags:completion:");
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return _[a1 paired];
}

id objc_msgSend_pairingDeriveKeyForIdentifier_keyLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingDeriveKeyForIdentifier:keyLength:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pauseErrorReason(void *a1, const char *a2, ...)
{
  return _[a1 pauseErrorReason];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_pipePendingRequest(void *a1, const char *a2, ...)
{
  return _[a1 pipePendingRequest];
}

id objc_msgSend_pipeStartTime(void *a1, const char *a2, ...)
{
  return _[a1 pipeStartTime];
}

id objc_msgSend_placementMode(void *a1, const char *a2, ...)
{
  return _[a1 placementMode];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predictiveRouteTicks(void *a1, const char *a2, ...)
{
  return _[a1 predictiveRouteTicks];
}

id objc_msgSend_preemptiveBannerShown(void *a1, const char *a2, ...)
{
  return _[a1 preemptiveBannerShown];
}

id objc_msgSend_primaryAppleIDIsHSA2(void *a1, const char *a2, ...)
{
  return _[a1 primaryAppleIDIsHSA2];
}

id objc_msgSend_primaryInCase(void *a1, const char *a2, ...)
{
  return _[a1 primaryInCase];
}

id objc_msgSend_primaryInEar(void *a1, const char *a2, ...)
{
  return _[a1 primaryInEar];
}

id objc_msgSend_primaryPlacement(void *a1, const char *a2, ...)
{
  return _[a1 primaryPlacement];
}

id objc_msgSend_printDebug(void *a1, const char *a2, ...)
{
  return _[a1 printDebug];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_proactiveRoutingBackoff(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingBackoff];
}

id objc_msgSend_proactiveRoutingTrigger(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingTrigger];
}

id objc_msgSend_proactiveRoutingWxRSSI(void *a1, const char *a2, ...)
{
  return _[a1 proactiveRoutingWxRSSI];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processingIDSPush(void *a1, const char *a2, ...)
{
  return _[a1 processingIDSPush];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 productBuildVersion];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 productIdentifier];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _[a1 productName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_progressStarted(void *a1, const char *a2, ...)
{
  return _[a1 progressStarted];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_publicAddress(void *a1, const char *a2, ...)
{
  return _[a1 publicAddress];
}

id objc_msgSend_publicAddressForIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicAddressForIDSDevice:");
}

id objc_msgSend_pushEnable(void *a1, const char *a2, ...)
{
  return _[a1 pushEnable];
}

id objc_msgSend_pushQueue(void *a1, const char *a2, ...)
{
  return _[a1 pushQueue];
}

id objc_msgSend_pushTimer(void *a1, const char *a2, ...)
{
  return _[a1 pushTimer];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_readUserPreference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUserPreference:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reconnectionState(void *a1, const char *a2, ...)
{
  return _[a1 reconnectionState];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return _[a1 recordType];
}

id objc_msgSend_recordZoneAccessoryDatabase(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneAccessoryDatabase];
}

id objc_msgSend_recordZoneBlob(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneBlob];
}

id objc_msgSend_recordZoneID(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneID];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registrationStatus(void *a1, const char *a2, ...)
{
  return _[a1 registrationStatus];
}

id objc_msgSend_reinitAfterBuddy(void *a1, const char *a2, ...)
{
  return _[a1 reinitAfterBuddy];
}

id objc_msgSend_relinquishAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 relinquishAudioRoute];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remotePID(void *a1, const char *a2, ...)
{
  return _[a1 remotePID];
}

id objc_msgSend_remoteUID(void *a1, const char *a2, ...)
{
  return _[a1 remoteUID];
}

id objc_msgSend_removeAAProxCardsInfoWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAAProxCardsInfoWithBluetoothAddress:completion:");
}

id objc_msgSend_removeAllActions(void *a1, const char *a2, ...)
{
  return _[a1 removeAllActions];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConnection:");
}

id objc_msgSend_removeDeviceMagicSettingsWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceMagicSettingsWithBluetoothAddress:completion:");
}

id objc_msgSend_removeDeviceNickname(void *a1, const char *a2, ...)
{
  return _[a1 removeDeviceNickname];
}

id objc_msgSend_removeDeviceSupportInformationWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceSupportInformationWithBluetoothAddress:completion:");
}

id objc_msgSend_removeDeviceWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceWithBluetoothAddress:completion:");
}

id objc_msgSend_removeDeviceWithRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceWithRecord:completion:");
}

id objc_msgSend_removeHMDeviceCloudRecordWithBluetoothAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeHMDeviceCloudRecordWithBluetoothAddress:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeSoundProfileRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSoundProfileRecordWithCompletion:");
}

id objc_msgSend_removeWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWithDelegate:");
}

id objc_msgSend_removeuserPreference_sync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeuserPreference:sync:");
}

id objc_msgSend_reportDeviceFound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDeviceFound:");
}

id objc_msgSend_reportDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDeviceLost:");
}

id objc_msgSend_reportHMDeviceCloudRecordInfosRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportHMDeviceCloudRecordInfosRemoved:");
}

id objc_msgSend_reportHMDeviceCloudRecordInfosUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportHMDeviceCloudRecordInfosUpdated:");
}

id objc_msgSend_reportTime(void *a1, const char *a2, ...)
{
  return _[a1 reportTime];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestedKeyTypes(void *a1, const char *a2, ...)
{
  return _[a1 requestedKeyTypes];
}

id objc_msgSend_resetAccessoryZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAccessoryZone:");
}

id objc_msgSend_resetCachedData(void *a1, const char *a2, ...)
{
  return _[a1 resetCachedData];
}

id objc_msgSend_resetCachedDataWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCachedDataWithCompletion:");
}

id objc_msgSend_resetCloudContainerManateeIdentityLost(void *a1, const char *a2, ...)
{
  return _[a1 resetCloudContainerManateeIdentityLost];
}

id objc_msgSend_resetCloudDataWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCloudDataWithCompletion:");
}

id objc_msgSend_resetOldZones(void *a1, const char *a2, ...)
{
  return _[a1 resetOldZones];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return _[a1 responseHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryIDSSetup(void *a1, const char *a2, ...)
{
  return _[a1 retryIDSSetup];
}

id objc_msgSend_reverseRouteReason(void *a1, const char *a2, ...)
{
  return _[a1 reverseRouteReason];
}

id objc_msgSend_roleWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roleWithDevice:");
}

id objc_msgSend_routeCheckHijackTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckHijackTimer];
}

id objc_msgSend_routeCheckInUseBannerTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckInUseBannerTimer];
}

id objc_msgSend_routeCheckOnDemandTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckOnDemandTimer];
}

id objc_msgSend_routeCheckOwnLostTimer(void *a1, const char *a2, ...)
{
  return _[a1 routeCheckOwnLostTimer];
}

id objc_msgSend_routed(void *a1, const char *a2, ...)
{
  return _[a1 routed];
}

id objc_msgSend_routingAction(void *a1, const char *a2, ...)
{
  return _[a1 routingAction];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_rssiEstimate(void *a1, const char *a2, ...)
{
  return _[a1 rssiEstimate];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveRecord_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecord:completionHandler:");
}

id objc_msgSend_saveRecordZone_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecordZone:completionHandler:");
}

id objc_msgSend_saveSubscription_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSubscription:completionHandler:");
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _[a1 scanRate];
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return _[a1 screenLocked];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _[a1 screenOn];
}

id objc_msgSend_screenSaverActive(void *a1, const char *a2, ...)
{
  return _[a1 screenSaverActive];
}

id objc_msgSend_secondaryInCase(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInCase];
}

id objc_msgSend_secondaryInEar(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInEar];
}

id objc_msgSend_secondaryPlacement(void *a1, const char *a2, ...)
{
  return _[a1 secondaryPlacement];
}

id objc_msgSend_selectiveSpeechListeningConfig(void *a1, const char *a2, ...)
{
  return _[a1 selectiveSpeechListeningConfig];
}

id objc_msgSend_sendCloudKitMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCloudKitMsg:args:");
}

id objc_msgSend_sendCloudKitMsg_args_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCloudKitMsg:args:withReply:");
}

id objc_msgSend_sendCloudKitMsg_argsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCloudKitMsg:argsObject:");
}

id objc_msgSend_sendCloudKitPush(void *a1, const char *a2, ...)
{
  return _[a1 sendCloudKitPush];
}

id objc_msgSend_sendCloudPairingResponseMessage_toDevice_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCloudPairingResponseMessage:toDevice:version:");
}

id objc_msgSend_sendConversationDetectMessage_destinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendConversationDetectMessage:destinationIdentifier:completionHandler:");
}

id objc_msgSend_sendDeviceConfig_destinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeviceConfig:destinationIdentifier:completionHandler:");
}

id objc_msgSend_sendDeviceConfig_identifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeviceConfig:identifier:completion:");
}

id objc_msgSend_sendErrorMessageToDevice_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendErrorMessageToDevice:reason:");
}

id objc_msgSend_sendGetTipiTableMessageToDestinationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendGetTipiTableMessageToDestinationIdentifier:completionHandler:");
}

id objc_msgSend_sendInitialPairingIDSMessage_forDevice_withRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInitialPairingIDSMessage:forDevice:withRole:");
}

id objc_msgSend_sendMessage_fromAccount_toDestinations_priority_options_identifier_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendRePairCloudPairingMessage_toDevice_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRePairCloudPairingMessage:toDevice:bundleID:");
}

id objc_msgSend_sendRePairRequest_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRePairRequest:forBundleID:");
}

id objc_msgSend_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:");
}

id objc_msgSend_sendRequestID_options_request_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:options:request:responseHandler:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_sendSmartRoutingInformation_device_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSmartRoutingInformation:device:completionHandler:");
}

id objc_msgSend_senderIDS(void *a1, const char *a2, ...)
{
  return _[a1 senderIDS];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _[a1 serverConnection];
}

id objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverPreferredPushEnvironmentWithCompletionHandler:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_service_activeAccountsChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service:activeAccountsChanged:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAaDeviceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAaDeviceDelegate:");
}

id objc_msgSend_setAcceptReplyPlayPauseConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptReplyPlayPauseConfig:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountAvailable:");
}

id objc_msgSend_setAclPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAclPriority:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:error:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setActivePlayingApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivePlayingApp:");
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setAdaptiveVolumeConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdaptiveVolumeConfig:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAggregate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggregate:");
}

id objc_msgSend_setAllowOffListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowOffListeningMode:");
}

id objc_msgSend_setAllowsAutoRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAutoRoute:");
}

id objc_msgSend_setAssociatedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociatedDevices:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAudioDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioDestination:");
}

id objc_msgSend_setAudioRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoute:");
}

id objc_msgSend_setAudioRouteHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRouteHidden:");
}

id objc_msgSend_setAudioRoutingClientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingClientID:");
}

id objc_msgSend_setAudioRoutingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingRequest:");
}

id objc_msgSend_setAudioRoutingResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingResponse:");
}

id objc_msgSend_setAudioRoutingScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingScore:");
}

id objc_msgSend_setAudioRoutingScore_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingScore:completion:");
}

id objc_msgSend_setAudioState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioState:");
}

id objc_msgSend_setAudiogramEnrolledTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudiogramEnrolledTimestamp:");
}

id objc_msgSend_setAutoANCStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoANCStrength:");
}

id objc_msgSend_setBannerAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerAction:");
}

id objc_msgSend_setBannerAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerAppID:");
}

id objc_msgSend_setBannerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerType:");
}

id objc_msgSend_setBatteryLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryLeft:");
}

id objc_msgSend_setBatteryMain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryMain:");
}

id objc_msgSend_setBatteryRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryRight:");
}

id objc_msgSend_setBleClientUseCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleClientUseCase:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBluetoothIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothIdentifier:");
}

id objc_msgSend_setBluetoothState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothState:");
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothStateChangedHandler:");
}

id objc_msgSend_setBodyArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodyArguments:");
}

id objc_msgSend_setBodyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodyKey:");
}

id objc_msgSend_setBtXID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtXID:");
}

id objc_msgSend_setBuddyStateWatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuddyStateWatcher:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setCDTunings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCDTunings:");
}

id objc_msgSend_setCPAddressMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCPAddressMapping:");
}

id objc_msgSend_setCallChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallChangedHandler:");
}

id objc_msgSend_setCallConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallConnected:");
}

id objc_msgSend_setCallIncomingUnconnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallIncomingUnconnected:");
}

id objc_msgSend_setCallStartTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStartTicks:");
}

id objc_msgSend_setCallbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallbackQueue:");
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:withOptions:error:");
}

id objc_msgSend_setCategoryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryID:");
}

id objc_msgSend_setCdSignalAudioInterrupted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCdSignalAudioInterrupted:");
}

id objc_msgSend_setCenterContentItemsIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterContentItemsIcon:");
}

id objc_msgSend_setCenterContentItemsText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterContentItemsText:");
}

id objc_msgSend_setCenterContentText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterContentText:");
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeFlags:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClickHoldModeLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickHoldModeLeft:");
}

id objc_msgSend_setClickHoldModeRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickHoldModeRight:");
}

id objc_msgSend_setClientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientID:");
}

id objc_msgSend_setClientQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientQueue:");
}

id objc_msgSend_setCloudIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudIdentifier:");
}

id objc_msgSend_setCloudKitConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitConnection:");
}

id objc_msgSend_setCloudPairingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudPairingQueue:");
}

id objc_msgSend_setCloudSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSubscription:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConduitDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConduitDeviceID:");
}

id objc_msgSend_setConduitMessageTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConduitMessageTicks:");
}

id objc_msgSend_setConduitMessageTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConduitMessageTimer:");
}

id objc_msgSend_setConferencingCallSets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferencingCallSets:");
}

id objc_msgSend_setConfigRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigRequestHandler:");
}

id objc_msgSend_setConnectOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectOnly:");
}

id objc_msgSend_setConnectRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectRequestHandler:");
}

id objc_msgSend_setConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnected:");
}

id objc_msgSend_setConnectionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionFlags:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setConversationDetectConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationDetectConfig:");
}

id objc_msgSend_setConversationDetectMessageHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationDetectMessageHandler:");
}

id objc_msgSend_setConversationDetectSignal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationDetectSignal:");
}

id objc_msgSend_setCrownRotationDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrownRotationDirection:");
}

id objc_msgSend_setCurrentCDDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCDDeviceIdentifier:");
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemon:");
}

id objc_msgSend_setDarwinDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarwinDevice:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDeclineDismissSkipConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeclineDismissSkipConfig:");
}

id objc_msgSend_setDefaultConfigurationForSharedDeviceOnMultiUserSystem(void *a1, const char *a2, ...)
{
  return _[a1 setDefaultConfigurationForSharedDeviceOnMultiUserSystem];
}

id objc_msgSend_setDefaultConfigurationsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 setDefaultConfigurationsIfNeeded];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDestinationPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationPeer:");
}

id objc_msgSend_setDeviceActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceActionType:");
}

id objc_msgSend_setDeviceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceAddress:");
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceChangedHandler:");
}

id objc_msgSend_setDeviceConnectedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceConnectedHandler:");
}

id objc_msgSend_setDeviceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceDelegate:");
}

id objc_msgSend_setDeviceDisconnectedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceDisconnectedHandler:");
}

id objc_msgSend_setDeviceFlagsMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFlagsMask:");
}

id objc_msgSend_setDeviceFlagsValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFlagsValue:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceInfoChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceInfoChangeHandler:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDeviceManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceManager:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceVersion:");
}

id objc_msgSend_setDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectoryURL:");
}

id objc_msgSend_setDisableCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableCount:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDispatchSourceAbort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchSourceAbort:");
}

id objc_msgSend_setDispatchSourceChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchSourceChange:");
}

id objc_msgSend_setDoubleTapActionLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoubleTapActionLeft:");
}

id objc_msgSend_setDoubleTapActionRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoubleTapActionRight:");
}

id objc_msgSend_setDuckToLevelScalar_unduckToLevelScalar_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuckToLevelScalar:unduckToLevelScalar:error:");
}

id objc_msgSend_setDuckingFadeOutDuration_fadeInDuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuckingFadeOutDuration:fadeInDuration:error:");
}

id objc_msgSend_setEnableCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableCount:");
}

id objc_msgSend_setEnableHearingAidGainSwipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableHearingAidGainSwipe:");
}

id objc_msgSend_setEnableHearingAssist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableHearingAssist:");
}

id objc_msgSend_setEnableHeartRateMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableHeartRateMonitor:");
}

id objc_msgSend_setEnableSiriMultitone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSiriMultitone:");
}

id objc_msgSend_setEndCallConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndCallConfig:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setEvalPreemptiveBannerResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvalPreemptiveBannerResult:");
}

id objc_msgSend_setEvalResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvalResult:");
}

id objc_msgSend_setEvalWxMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvalWxMap:");
}

id objc_msgSend_setEvaluator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvaluator:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFalseRouteCheckForceDisconnectTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckForceDisconnectTimer:");
}

id objc_msgSend_setFalseRouteCheckHijackAwayTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckHijackAwayTimer:");
}

id objc_msgSend_setFalseRouteCheckHijackTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckHijackTimer:");
}

id objc_msgSend_setFalseRouteCheckOnDemandTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckOnDemandTimer:");
}

id objc_msgSend_setFalseRouteCheckOwnLostTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckOwnLostTimer:");
}

id objc_msgSend_setFalseRouteCheckProactiveRoutingTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckProactiveRoutingTimer:");
}

id objc_msgSend_setFalseRouteCheckReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFalseRouteCheckReason:");
}

id objc_msgSend_setFd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFd:");
}

id objc_msgSend_setFirstPipeMessageRTT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPipeMessageRTT:");
}

id objc_msgSend_setFirstPreemptiveBannerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPreemptiveBannerShown:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setFirstUnlockStateWatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockStateWatcher:");
}

id objc_msgSend_setFixedPIN_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFixedPIN:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setGracePeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGracePeriod:");
}

id objc_msgSend_setGuestAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuestAddress:");
}

id objc_msgSend_setGuestKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuestKey:");
}

id objc_msgSend_setGuestMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuestMode:");
}

id objc_msgSend_setGuestPermanent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuestPermanent:");
}

id objc_msgSend_setHeadGestureToggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadGestureToggle:");
}

id objc_msgSend_setHeadGestureUpdateFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadGestureUpdateFlags:");
}

id objc_msgSend_setHearingAidEnrolled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHearingAidEnrolled:");
}

id objc_msgSend_setHearingAidToggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHearingAidToggle:");
}

id objc_msgSend_setHijackActiveRemoteScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackActiveRemoteScore:");
}

id objc_msgSend_setHijackAmbientTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackAmbientTick:");
}

id objc_msgSend_setHijackAnswer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackAnswer:");
}

id objc_msgSend_setHijackAwayLocalScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackAwayLocalScore:");
}

id objc_msgSend_setHijackAwayRemoteScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackAwayRemoteScore:");
}

id objc_msgSend_setHijackCallTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackCallTick:");
}

id objc_msgSend_setHijackContinuousTimeoutCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackContinuousTimeoutCount:");
}

id objc_msgSend_setHijackInputTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackInputTick:");
}

id objc_msgSend_setHijackMediaTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackMediaTick:");
}

id objc_msgSend_setHijackPlayingApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackPlayingApp:");
}

id objc_msgSend_setHijackPlayingCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackPlayingCategory:");
}

id objc_msgSend_setHijackRelaySent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackRelaySent:");
}

id objc_msgSend_setHijackRoundTripTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackRoundTripTime:");
}

id objc_msgSend_setHijackScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackScore:");
}

id objc_msgSend_setHijackVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHijackVersion:");
}

id objc_msgSend_setHmDeviceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHmDeviceDelegate:");
}

id objc_msgSend_setIcloudSignedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcloudSignedIn:");
}

id objc_msgSend_setIconAppIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconAppIdentifier:");
}

id objc_msgSend_setIconName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconName:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdleTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTime:");
}

id objc_msgSend_setIdsDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsDeviceID:");
}

id objc_msgSend_setIgnoreBTRestart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreBTRestart:");
}

id objc_msgSend_setIgnoreManualConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreManualConnect:");
}

id objc_msgSend_setInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInEar:");
}

id objc_msgSend_setInEarDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInEarDisabled:");
}

id objc_msgSend_setInputMuted_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputMuted:error:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAccountActive:");
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsConnected:");
}

id objc_msgSend_setIsFetchInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFetchInProgress:");
}

id objc_msgSend_setIsFetchMasterKeyInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFetchMasterKeyInProgress:");
}

id objc_msgSend_setIsFirstConnectionAfterSREnable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFirstConnectionAfterSREnable:");
}

id objc_msgSend_setIsInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInEar:");
}

id objc_msgSend_setIsReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsReady:");
}

id objc_msgSend_setIsTipiHealingV2Eligible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTipiHealingV2Eligible:");
}

id objc_msgSend_setIsUTPConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUTPConnected:");
}

id objc_msgSend_setIsWatchingBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWatchingBuddy:");
}

id objc_msgSend_setIsWriteMasterKeysInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWriteMasterKeysInProgress:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBatteryLevel:");
}

id objc_msgSend_setLastBatteryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBatteryType:");
}

id objc_msgSend_setLastConnectHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastConnectHost:");
}

id objc_msgSend_setLastEvalResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastEvalResult:");
}

id objc_msgSend_setLastEvalTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastEvalTicks:");
}

id objc_msgSend_setLastPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlay:");
}

id objc_msgSend_setLastSeenTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSeenTime:");
}

id objc_msgSend_setLastWxAdvTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastWxAdvTicks:");
}

id objc_msgSend_setLeadingAccessoryImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingAccessoryImageName:");
}

id objc_msgSend_setLeadingAccessoryImagePID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingAccessoryImagePID:");
}

id objc_msgSend_setLeeway_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeeway:");
}

id objc_msgSend_setLidClosed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLidClosed:");
}

id objc_msgSend_setListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningMode:");
}

id objc_msgSend_setListeningModeConfigs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningModeConfigs:");
}

id objc_msgSend_setListeningModeOffAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningModeOffAllowed:");
}

id objc_msgSend_setLocalDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceName:");
}

id objc_msgSend_setLocalDeviceRandomAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceRandomAddress:");
}

id objc_msgSend_setLowBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowBatteryLevel:");
}

id objc_msgSend_setLowestBudBatteryInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowestBudBatteryInfo:");
}

id objc_msgSend_setMXSessionProperty_value_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMXSessionProperty:value:error:");
}

id objc_msgSend_setMagnetConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagnetConnected:");
}

id objc_msgSend_setManualRouteChangeDetectionTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualRouteChangeDetectionTimer:");
}

id objc_msgSend_setManualRouteDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualRouteDestination:");
}

id objc_msgSend_setManualRouteInputOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualRouteInputOutput:");
}

id objc_msgSend_setMasterBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasterBlob:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxDelay:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMediaPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaPlaying:");
}

id objc_msgSend_setMessageIdentifiersWaitingForAck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageIdentifiersWaitingForAck:");
}

id objc_msgSend_setMicrophoneMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicrophoneMode:");
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDelay:");
}

id objc_msgSend_setMinRSSIHeadset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinRSSIHeadset:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModifyOperationTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyOperationTimer:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setMuteAction_auditToken_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuteAction:auditToken:bundleIdentifier:");
}

id objc_msgSend_setMuteControlConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuteControlConfig:");
}

id objc_msgSend_setNSUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNSUUID:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNearbyDeviceNoTipiScoreCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyDeviceNoTipiScoreCount:");
}

id objc_msgSend_setNeedsSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsSetup:");
}

id objc_msgSend_setNetworkMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkMonitor:");
}

id objc_msgSend_setNickname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNickname:");
}

id objc_msgSend_setNoNearbyDeviceFoundCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoNearbyDeviceFoundCount:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnDemandCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnDemandCategory:");
}

id objc_msgSend_setOneSourceLastRouteHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneSourceLastRouteHost:");
}

id objc_msgSend_setOnlyDiscoversBluetoothDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnlyDiscoversBluetoothDevices:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOtherTipiDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherTipiDeviceAudioScore:");
}

id objc_msgSend_setOtherTipiDeviceIdleTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherTipiDeviceIdleTick:");
}

id objc_msgSend_setOtherTipiDeviceLastPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherTipiDeviceLastPlay:");
}

id objc_msgSend_setOutOfCaseTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutOfCaseTime:");
}

id objc_msgSend_setOverrideScreenOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideScreenOff:");
}

id objc_msgSend_setPairSetupDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairSetupDisabled:");
}

id objc_msgSend_setPaired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaired:");
}

id objc_msgSend_setPauseErrorReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseErrorReason:");
}

id objc_msgSend_setPeerDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerDevice:");
}

id objc_msgSend_setPerRecordCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerRecordCompletionBlock:");
}

id objc_msgSend_setPipePendingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipePendingRequest:");
}

id objc_msgSend_setPipeStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipeStartTime:");
}

id objc_msgSend_setPlacementMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlacementMode:");
}

id objc_msgSend_setPreemptiveBannerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreemptiveBannerShown:");
}

id objc_msgSend_setPrimaryAppleIDChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryAppleIDChangedHandler:");
}

id objc_msgSend_setPrimaryInCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryInCase:");
}

id objc_msgSend_setPrimaryInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryInEar:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProactiveRoutingBackoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProactiveRoutingBackoff:");
}

id objc_msgSend_setProactiveRoutingTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProactiveRoutingTrigger:");
}

id objc_msgSend_setProactiveRoutingWxRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProactiveRoutingWxRSSI:");
}

id objc_msgSend_setProcessingIDSPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessingIDSPush:");
}

id objc_msgSend_setProductID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductID:");
}

id objc_msgSend_setProgressHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressHandler:");
}

id objc_msgSend_setProgressStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressStarted:");
}

id objc_msgSend_setPublicAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicAddress:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setPushQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushQueue:");
}

id objc_msgSend_setPushTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushTimer:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setReconnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReconnectionState:");
}

id objc_msgSend_setRelayMessageHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayMessageHandler:");
}

id objc_msgSend_setRelinquishAudioRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelinquishAudioRoute:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemotePID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemotePID:");
}

id objc_msgSend_setRemoteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteUID:");
}

id objc_msgSend_setReportTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportTime:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestedKeyTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedKeyTypes:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_setReverseRouteReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReverseRouteReason:");
}

id objc_msgSend_setRouteCheckHijackTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteCheckHijackTimer:");
}

id objc_msgSend_setRouteCheckInUseBannerTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteCheckInUseBannerTimer:");
}

id objc_msgSend_setRouteCheckOnDemandTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteCheckOnDemandTimer:");
}

id objc_msgSend_setRouteCheckOwnLostTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteCheckOwnLostTimer:");
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiThreshold:");
}

id objc_msgSend_setSRConnectedSetCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSRConnectedSetCount:");
}

id objc_msgSend_setScanFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanFlags:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenLockedChangedHandler:");
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenOnChangedHandler:");
}

id objc_msgSend_setScreenSaverChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSaverChangedHandler:");
}

id objc_msgSend_setSecondaryInCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryInCase:");
}

id objc_msgSend_setSecondaryInEar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryInEar:");
}

id objc_msgSend_setSelectiveSpeechListeningConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectiveSpeechListeningConfig:");
}

id objc_msgSend_setSenderIDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderIDS:");
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerConnection:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceIdentifier:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setSessionEndedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionEndedHandler:");
}

id objc_msgSend_setSessionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionFlags:");
}

id objc_msgSend_setSessionStartedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionStartedHandler:");
}

id objc_msgSend_setSetupSupportsTipiv2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupSupportsTipiv2:");
}

id objc_msgSend_setShouldPauseFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPauseFetch:");
}

id objc_msgSend_setSigningIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSigningIdentity:");
}

id objc_msgSend_setSiriMultitoneEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriMultitoneEnabled:");
}

id objc_msgSend_setSleepWakeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepWakeHandler:");
}

id objc_msgSend_setSmartRoutingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartRoutingMode:");
}

id objc_msgSend_setSmartRoutingStateFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartRoutingStateFlags:");
}

id objc_msgSend_setSnapshotLocalDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotLocalDeviceAudioScore:");
}

id objc_msgSend_setSnapshotRemoteDeviceAudioScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotRemoteDeviceAudioScore:");
}

id objc_msgSend_setSourceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceCount:");
}

id objc_msgSend_setSpatialAudioAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpatialAudioAllowed:");
}

id objc_msgSend_setSpatialAudioMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpatialAudioMode:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatusMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusMonitor:");
}

id objc_msgSend_setSubtitleArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleArguments:");
}

id objc_msgSend_setSubtitleKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleKey:");
}

id objc_msgSend_setSupportsVirtualAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsVirtualAddress:");
}

id objc_msgSend_setTUCallMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTUCallMap:");
}

id objc_msgSend_setTargetFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetFilename:");
}

id objc_msgSend_setThV2Ticks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThV2Ticks:");
}

id objc_msgSend_setThV2WxCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThV2WxCount:");
}

id objc_msgSend_setTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutSeconds:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTipiChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipiChangedHandler:");
}

id objc_msgSend_setTipiHealingBackoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipiHealingBackoff:");
}

id objc_msgSend_setTipitableUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipitableUpdated:");
}

id objc_msgSend_setTitleArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleArguments:");
}

id objc_msgSend_setTitleKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleKey:");
}

id objc_msgSend_setTotalCloudDeviceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalCloudDeviceCount:");
}

id objc_msgSend_setTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggered:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnpairedIDSCloudIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnpairedIDSCloudIdentifiers:");
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return _[a1 setUp];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserNotInContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserNotInContacts:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWxAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWxAddress:");
}

id objc_msgSend_setWxDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWxDevice:");
}

id objc_msgSend_setWxStreamState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWxStreamState:");
}

id objc_msgSend_setWxTipiScore1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWxTipiScore1:");
}

id objc_msgSend_setWxTipiScore2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWxTipiScore2:");
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcCnx:");
}

id objc_msgSend_setZeroSourceLastRouteHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroSourceLastRouteHost:");
}

id objc_msgSend_setupSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 setupSubscriptions];
}

id objc_msgSend_setupSupportsTipiv2(void *a1, const char *a2, ...)
{
  return _[a1 setupSupportsTipiv2];
}

id objc_msgSend_setuserPreference_value_sync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setuserPreference:value:sync:");
}

id objc_msgSend_sfSession(void *a1, const char *a2, ...)
{
  return _[a1 sfSession];
}

id objc_msgSend_shareAudioProgressEvent_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareAudioProgressEvent:info:");
}

id objc_msgSend_shareAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 shareAudioSession];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAADeviceManagerDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedAADeviceManagerDaemon];
}

id objc_msgSend_sharedAAServicesDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedAAServicesDaemon];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedBTIdentityDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTIdentityDaemon];
}

id objc_msgSend_sharedBTServicesDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTServicesDaemon];
}

id objc_msgSend_sharedBTSmartRoutingDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedBTSmartRoutingDaemon];
}

id objc_msgSend_sharedCDSessionManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedCDSessionManager];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedHMServiceDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedHMServiceDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldClientWithAudioScore_hijackRoute_hijackDeniedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldClientWithAudioScore:hijackRoute:hijackDeniedReason:");
}

id objc_msgSend_shouldConnectToAudioDeviceWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldConnectToAudioDeviceWithCompletionHandler:");
}

id objc_msgSend_shouldPauseFetch(void *a1, const char *a2, ...)
{
  return _[a1 shouldPauseFetch];
}

id objc_msgSend_showCrashBannerIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showCrashBannerIfNeeded:");
}

id objc_msgSend_signingIdentity(void *a1, const char *a2, ...)
{
  return _[a1 signingIdentity];
}

id objc_msgSend_singleton(void *a1, const char *a2, ...)
{
  return _[a1 singleton];
}

id objc_msgSend_siriMultitoneCapability(void *a1, const char *a2, ...)
{
  return _[a1 siriMultitoneCapability];
}

id objc_msgSend_siriMultitoneEnabled(void *a1, const char *a2, ...)
{
  return _[a1 siriMultitoneEnabled];
}

id objc_msgSend_smartRoutingMode(void *a1, const char *a2, ...)
{
  return _[a1 smartRoutingMode];
}

id objc_msgSend_smartRoutingStateFlags(void *a1, const char *a2, ...)
{
  return _[a1 smartRoutingStateFlags];
}

id objc_msgSend_smartRoutingStateUpdated_ForDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartRoutingStateUpdated:ForDeviceIdentifier:");
}

id objc_msgSend_smoothedRSSI(void *a1, const char *a2, ...)
{
  return _[a1 smoothedRSSI];
}

id objc_msgSend_snapshotLocalDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalDeviceAudioScore];
}

id objc_msgSend_snapshotLocalNumOfApps(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalNumOfApps];
}

id objc_msgSend_snapshotLocalPlayingApp(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalPlayingApp];
}

id objc_msgSend_snapshotLocalRoute(void *a1, const char *a2, ...)
{
  return _[a1 snapshotLocalRoute];
}

id objc_msgSend_snapshotRemoteDeviceAudioScore(void *a1, const char *a2, ...)
{
  return _[a1 snapshotRemoteDeviceAudioScore];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sourceCount(void *a1, const char *a2, ...)
{
  return _[a1 sourceCount];
}

id objc_msgSend_spatialAudioAllowed(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioAllowed];
}

id objc_msgSend_spatialAudioMode(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioMode];
}

id objc_msgSend_speakText_flags_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speakText:flags:completion:");
}

id objc_msgSend_speechDetectionStyle(void *a1, const char *a2, ...)
{
  return _[a1 speechDetectionStyle];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return _[a1 standardizedURL];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startMonitoringWithCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringWithCallback:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateString(void *a1, const char *a2, ...)
{
  return _[a1 stateString];
}

id objc_msgSend_statedumpAndRecordDailyMetric(void *a1, const char *a2, ...)
{
  return _[a1 statedumpAndRecordDailyMetric];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stopHeadGestureManager(void *a1, const char *a2, ...)
{
  return _[a1 stopHeadGestureManager];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoring];
}

id objc_msgSend_storePublicAddressMapping_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePublicAddressMapping:message:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submitHijackMetric_withV1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitHijackMetric:withV1:");
}

id objc_msgSend_submitRouteActivityMetric_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitRouteActivityMetric:activity:");
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionID];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return _[a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_supportsVirtualAddress(void *a1, const char *a2, ...)
{
  return _[a1 supportsVirtualAddress];
}

id objc_msgSend_supportsiCloudPairing(void *a1, const char *a2, ...)
{
  return _[a1 supportsiCloudPairing];
}

id objc_msgSend_systemAttentionState(void *a1, const char *a2, ...)
{
  return _[a1 systemAttentionState];
}

id objc_msgSend_targetFilename(void *a1, const char *a2, ...)
{
  return _[a1 targetFilename];
}

id objc_msgSend_thV2Ticks(void *a1, const char *a2, ...)
{
  return _[a1 thV2Ticks];
}

id objc_msgSend_thV2WxCount(void *a1, const char *a2, ...)
{
  return _[a1 thV2WxCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return _[a1 timeStamp];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_tipiAndRoutedState(void *a1, const char *a2, ...)
{
  return _[a1 tipiAndRoutedState];
}

id objc_msgSend_tipiConnectionStatus(void *a1, const char *a2, ...)
{
  return _[a1 tipiConnectionStatus];
}

id objc_msgSend_tipiDevices(void *a1, const char *a2, ...)
{
  return _[a1 tipiDevices];
}

id objc_msgSend_tipiHealingBackoff(void *a1, const char *a2, ...)
{
  return _[a1 tipiHealingBackoff];
}

id objc_msgSend_tipiState(void *a1, const char *a2, ...)
{
  return _[a1 tipiState];
}

id objc_msgSend_tipitableUpdated(void *a1, const char *a2, ...)
{
  return _[a1 tipitableUpdated];
}

id objc_msgSend_toggleInputMute(void *a1, const char *a2, ...)
{
  return _[a1 toggleInputMute];
}

id objc_msgSend_toggleInputMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleInputMute:");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_totalCloudDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 totalCloudDeviceCount];
}

id objc_msgSend_trailingAccessoryText(void *a1, const char *a2, ...)
{
  return _[a1 trailingAccessoryText];
}

id objc_msgSend_transactionIdentifierForActionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionIdentifierForActionIdentifier:");
}

id objc_msgSend_transactionQueue(void *a1, const char *a2, ...)
{
  return _[a1 transactionQueue];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggered(void *a1, const char *a2, ...)
{
  return _[a1 triggered];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uiDataSource(void *a1, const char *a2, ...)
{
  return _[a1 uiDataSource];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_unpairedIDSCloudIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 unpairedIDSCloudIdentifiers];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateAADeviceRecordWithRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAADeviceRecordWithRecord:completion:");
}

id objc_msgSend_updateAAProxCardsInfoWithProxCardsInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAAProxCardsInfoWithProxCardsInfo:completion:");
}

id objc_msgSend_updateActiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActiveAccount:");
}

id objc_msgSend_updateCloudKitAccessoryZone_delete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudKitAccessoryZone:delete:");
}

id objc_msgSend_updateCloudKitBlobZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudKitBlobZone:");
}

id objc_msgSend_updateCloudPairings_newDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudPairings:newDevices:");
}

id objc_msgSend_updateDeviceMagicSettingsWithMagicPairingSettings_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeviceMagicSettingsWithMagicPairingSettings:completion:");
}

id objc_msgSend_updateDeviceSupportInformationWithDevice_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeviceSupportInformationWithDevice:completion:");
}

id objc_msgSend_updateHMDeviceCloudRecordInfoWithRecordInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHMDeviceCloudRecordInfoWithRecordInfo:completion:");
}

id objc_msgSend_updateIdentities_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIdentities:completion:");
}

id objc_msgSend_updateWithAADeviceInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithAADeviceInfo:");
}

id objc_msgSend_updateWithAADeviceRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithAADeviceRecord:");
}

id objc_msgSend_updateWithCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithCBDevice:");
}

id objc_msgSend_upgradeAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeAccessoryBlob:withRetryCount:");
}

id objc_msgSend_upgradeLegacyNonManateeContainerToManatee(void *a1, const char *a2, ...)
{
  return _[a1 upgradeLegacyNonManateeContainerToManatee];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userConfirmed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userConfirmed:");
}

id objc_msgSend_userConnectedState(void *a1, const char *a2, ...)
{
  return _[a1 userConnectedState];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateCloudPairing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateCloudPairing:");
}

id objc_msgSend_validateKeys_requestedTypes_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateKeys:requestedTypes:from:");
}

id objc_msgSend_validateMessage_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateMessage:from:");
}

id objc_msgSend_valuesByKey(void *a1, const char *a2, ...)
{
  return _[a1 valuesByKey];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_verifyAndCacheSubscriptionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAndCacheSubscriptionID:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_writeAccessoryBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeAccessoryBlob:withRetryCount:");
}

id objc_msgSend_writeKeyBlob_withRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeKeyBlob:withRetryCount:");
}

id objc_msgSend_wxAddress(void *a1, const char *a2, ...)
{
  return _[a1 wxAddress];
}

id objc_msgSend_wxStreamState(void *a1, const char *a2, ...)
{
  return _[a1 wxStreamState];
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return _[a1 xpcCnx];
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnectionInvalidated];
}

id objc_msgSend_xpcObjectRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 xpcObjectRepresentation];
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return _[a1 xpcQueue];
}

id objc_msgSend_xpcUpdateCloudPairings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcUpdateCloudPairings:");
}

id objc_msgSend_zeroSourceLastRouteHost(void *a1, const char *a2, ...)
{
  return _[a1 zeroSourceLastRouteHost];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}