unint64_t sub_1001AE440()
{
  unint64_t result;
  uint64_t v1;
  result = qword_1002B9140;
  if (!qword_1002B9140)
  {
    v1 = type metadata accessor for EmbeddedScheduledTask();
    result = swift_getWitnessTable(byte_10020B264, v1);
    atomic_store(result, (unint64_t *)&qword_1002B9140);
  }

  return result;
}

uint64_t sub_1001AE480()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_100034DB8(*(void *)(v0 + 16), *(void *)(v0 + 24), v1 & 1);
  }
  return swift_deallocObject(v0, 33LL, 7LL);
}

uint64_t sub_1001AE4B4()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255) {
    sub_100034F08(*(void *)(v0 + 16), v1 & 1);
  }
  return swift_deallocObject(v0, 25LL, 7LL);
}

uint64_t sub_1001AE4E8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1001AE510(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (HIBYTE(a4) != 255) {
    return sub_10009ADA0(result, a2, a3, a4, HIBYTE(a4) & 1);
  }
  return result;
}

uint64_t sub_1001AE528(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (HIBYTE(a3) != 255) {
    return sub_10009AE88(result, a2, a3, HIBYTE(a3) & 1);
  }
  return result;
}

void *sub_1001AE56C()
{
  return malloc(0x28uLL);
}

uint64_t sub_1001AE580(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1001AE59C(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t sub_1001AE5B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11LL, 2LL, 0xD000000000000033LL, a5, a6, 36LL, 2LL);
}

uint64_t sub_1001AE5CC()
{
  return specialized ContiguousArray._endMutation()();
}

  ;
}

uint64_t sub_1001AE5F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

uint64_t sub_1001AE5FC()
{
  return sub_1000F2BE4(v0);
}

unint64_t sub_1001AE604()
{
  unint64_t v3 = sub_1001A937C(v0, v1);
  sub_1001A937C(v2, v1);
  return v3;
}

uint64_t sub_1001AE634@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 16) = a1 - 1;
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1001AE64C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 16) = a1 - 1;
  return specialized ContiguousArray._endMutation()();
}

  ;
}

uint64_t sub_1001AE678()
{
  return EmbeddedChannel._readFromBuffer<A>(buffer:)(v2, v0, v1);
}

uint64_t sub_1001AE68C()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1001AE694(uint64_t a1, ...)
{
  return swift_beginAccess(v1, va, 33LL, 0LL);
}

uint64_t sub_1001AE6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return EventLoop.assertInEventLoop(file:line:)(a1, 117LL, 2LL, 769LL, a5, v5);
}

uint64_t sub_1001AE6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return EventLoop.assertInEventLoop(file:line:)(a1, 117LL, 2LL, 1149LL, a5, v5);
}

void sub_1001AE6D0()
{
}

  ;
}

uint64_t sub_1001AE6E8()
{
  return sub_1000FF2F0();
}

uint64_t sub_1001AE6F8()
{
  return v0;
}

uint64_t sub_1001AE704()
{
  return v0;
}

unint64_t sub_1001AE714()
{
  return sub_1001A937C(*(void *)(v0 + 16) - 1LL, v0);
}

uint64_t sub_1001AE724()
{
  return v0;
}

uint64_t sub_1001AE734(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

  ;
}

void sub_1001AE74C()
{
}

uint64_t sub_1001AE75C()
{
  return type metadata accessor for EmbeddedScheduledTask();
}

void sub_1001AE764()
{
}

uint64_t sub_1001AE774()
{
  return swift_retain(*(void *)(v0 + 8 * v1 + 32));
}

id sub_1001AE780()
{
  return *(id *)(v0 + 8 * v1 + 32);
}

void sub_1001AE78C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 1LL;
  *(_BYTE *)(a2 + 8) = 3;
}

uint64_t sub_1001AE7A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  return sub_10002B550((uint64_t *)(v16 - 192), (uint64_t)va);
}

uint64_t sub_1001AE7AC(uint64_t a1)
{
  return static NIODeadline.+ infix(_:_:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_1001AE7B8()
{
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_1001AE7D4()
{
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_1001AE7F0()
{
  return sub_100034E8C(v0, v1);
}

uint64_t sub_1001AE7FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t))
{
  return a12(v12);
}

void sub_1001AE808()
{
}

uint64_t sub_1001AE814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = v3;
  return swift_retain(v2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1001AE820(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t sub_1001AE82C()
{
  return sub_1000F2BE4(v0);
}

void sub_1001AE834()
{
}

uint64_t sub_1001AE840()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_1001AE848()
{
  return sub_1000F2BE4(v0);
}

void sub_1001AE850()
{
}

uint64_t sub_1001AE85C(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return swift_endAccess(va);
}

void sub_1001AE864()
{
}

unint64_t sub_1001AE870()
{
  return sub_1001A937C(v1, v0);
}

uint64_t sub_1001AE87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100098A70(0LL, 0LL, a3);
}

uint64_t sub_1001AE888()
{
  return v0;
}

uint64_t sub_1001AE89C()
{
  return sub_1000324E8(v0 - 128);
}

uint64_t sub_1001AE8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, a6, 40LL, 2LL);
}

  ;
}

uint64_t sub_1001AE8C4(uint64_t a1, ...)
{
  return swift_endAccess(va);
}

uint64_t destroy for OctaneSimulatedError(void *a1)
{
  uint64_t result = a1[4];
  if (result)
  {
    swift_bridgeObjectRelease(result);
    return swift_bridgeObjectRelease(a1[5]);
  }

  return result;
}

uint64_t initializeWithCopy for OctaneSimulatedError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  if (v6)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v6;
    uint64_t v8 = *(void *)(a2 + 40);
    uint64_t v7 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v7;
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v8);
  }

  else
  {
    __int128 v9 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v9;
  }

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for OctaneSimulatedError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 24);
  uint64_t v5 = (_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v6)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
    }

    else
    {
      sub_1001AEAC0(a1 + 24);
      __int128 v7 = *(_OWORD *)(a2 + 40);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 40) = v7;
    }
  }

  else if (v6)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  else
  {
    __int128 v8 = *(_OWORD *)(a2 + 40);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 40) = v8;
  }

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t sub_1001AEAC0(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for OctaneSimulatedError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a2 + 32);
  if (!v5)
  {
    sub_1001AEAC0(a1 + 24);
LABEL_5:
    __int128 v6 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v6;
    goto LABEL_6;
  }

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
LABEL_6:
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for OctaneSimulatedError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 57))
    {
      LODWORD(sub_100018AD4(v1, v0, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_100018AD4(v1, v0, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_100018AD4(v1, v0, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OctaneSimulatedError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 57) = 1;
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

    *(_BYTE *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError()
{
  return &type metadata for OctaneSimulatedError;
}

void *initializeWithCopy for OctaneSimulatedError.CurrentError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *assignWithCopy for OctaneSimulatedError.CurrentError(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  return a1;
}

void *assignWithTake for OctaneSimulatedError.CurrentError(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(a1[1]);
  uint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  a1[3] = *(void *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError.CurrentError()
{
  return &type metadata for OctaneSimulatedError.CurrentError;
}

uint64_t sub_1001AED38()
{
  if (qword_1002A8DA8 != -1) {
    swift_once(&qword_1002A8DA8, sub_1001AF0B8);
  }
  uint64_t v1 = qword_1002EB9F0;
  sub_1001B1070(v0);
  uint64_t v2 = swift_bridgeObjectRetain(v1);
  sub_1001AEEDC(v2, v0);
  uint64_t v4 = v3;
  if (v3[2])
  {
    uint64_t v5 = (void *)v3[6];
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRelease(v4);
    if (v5[2])
    {
      uint64_t v6 = v5[4];
      unint64_t v7 = v5[5];
      swift_bridgeObjectRetain(v7);
      sub_100019390();
      return sub_100116BB0(v6, v7);
    }

    uint64_t v3 = v5;
  }

  swift_bridgeObjectRelease(v3);
  return 0LL;
}

double sub_1001AEE10(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    sub_1001B1800();
    double result = 0.0;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
  }

  else
  {
    uint64_t v3 = sub_100116708(a1);
    uint64_t v5 = sub_1001AFEC8(v3, v4);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    sub_1001B1800();
    *(void *)(v2 + 24) = v5;
    *(void *)(v2 + 32) = v7;
    *(void *)(v2 + 40) = v9;
    *(void *)(v2 + 48) = v11;
  }

  return result;
}

uint64_t sub_1001AEE74(uint64_t a1)
{
  uint64_t result = 1LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      uint64_t result = 11LL;
      break;
    case 2LL:
      uint64_t result = 13LL;
      break;
    case 3LL:
      uint64_t result = 14LL;
      break;
    case 4LL:
      uint64_t result = 12LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void sub_1001AEEDC(uint64_t a1, void *a2)
{
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23)
  {
    unint64_t v3 = 0LL;
    uint64_t v22 = a1 + 32;
    while (v3 < *(void *)(a1 + 16))
    {
      uint64_t v4 = v3++;
      uint64_t v5 = (void *)a2[2];
      uint64_t v6 = v5[2];
      if (v6)
      {
        uint64_t v7 = (uint64_t *)(v22 + 24 * v4);
        uint64_t v8 = *v7;
        __int128 v9 = *(_OWORD *)(v7 + 1);
        uint64_t v10 = v5[4];
        uint64_t v11 = v5[5];
        __int128 v24 = v9;
        uint64_t v12 = v7[1];
        BOOL v13 = v10 == *v7 && v11 == (void)v9;
        if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v8, v9, 0LL) & 1) != 0)
        {
LABEL_20:
          swift_bridgeObjectRetain(v12);
          swift_bridgeObjectRetain(*((void *)&v24 + 1));
          if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
            sub_1000320E4();
          }
          unint64_t v20 = _swiftEmptyArrayStorage[2];
          if (v20 >= _swiftEmptyArrayStorage[3] >> 1) {
            sub_1000320E4();
          }
          _swiftEmptyArrayStorage[2] = v20 + 1;
          v21 = &_swiftEmptyArrayStorage[3 * v20];
          v21[4] = v8;
          *(_OWORD *)(v21 + 5) = v24;
        }

        else if (v6 != 1)
        {
          v14 = v5 + 7;
          uint64_t v15 = 1LL;
          while (1)
          {
            uint64_t v16 = v15 + 1;
            if (__OFADD__(v15, 1LL)) {
              break;
            }
            uint64_t v17 = *(v14 - 1);
            uint64_t v18 = *v14;
            BOOL v19 = v17 == v8 && v18 == v12;
            if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, v8, v12, 0LL) & 1) != 0) {
              goto LABEL_20;
            }
            v14 += 2;
            ++v15;
            if (v16 == v6) {
              goto LABEL_25;
            }
          }

          __break(1u);
          break;
        }
      }

void sub_1001AF0B8()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OctaneConfiguration();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
  id v6 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v6 pathForResource:v7 ofType:v8];

  if (v9)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    URL.init(fileURLWithPath:)(v10, v12);
    swift_bridgeObjectRelease(v12);
    uint64_t v13 = Data.init(contentsOf:options:)(v3, 0LL);
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v16 = type metadata accessor for PropertyListDecoder(0LL);
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    uint64_t v17 = PropertyListDecoder.init()();
    uint64_t v18 = sub_1000175B0(&qword_1002B91B8);
    sub_100190660( &qword_1002B91C0,  &qword_1002B91B8,  (uint64_t (*)(void))sub_1001B1034,  (const char *)&protocol conformance descriptor for <A> [A]);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v18, v13, v15, v18);
    sub_10003A9EC(v13, v15);
    swift_release(v17);
    BOOL v19 = v20;
  }

  else
  {
    BOOL v19 = _swiftEmptyArrayStorage;
  }

  qword_1002EB9F0 = (uint64_t)v19;
}

uint64_t sub_1001AF2FC(Swift::String a1)
{
  v1._rawValue = &off_100274508;
  return sub_1001B0094(a1, v1);
}

uint64_t sub_1001AF318(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x736E6F6974706FLL;
  }
  else {
    return 1701869940LL;
  }
}

void sub_1001AF348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v8 = a1 == a4 && a2 == a5;
  if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0LL) & 1) != 0) {
    sub_10018C3B0(a3, a6);
  }
}

void sub_1001AF3A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1000175B0(&qword_1002B9228);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_1000728A4();
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001B14C4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedErrorType.CodingKeys,  &type metadata for OctaneSimulatedErrorType.CodingKeys,  v11,  v9,  v10);
  char v18 = 0;
  sub_1001B17D8(a2, v12, (uint64_t)&v18);
  if (!v4)
  {
    uint64_t v16 = a4;
    char v17 = 1;
    uint64_t v13 = sub_1000175B0(&qword_1002A93B8);
    sub_1001B1500( (unint64_t *)&qword_1002A93C0,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    sub_1001B1818((uint64_t)&v16, (uint64_t)&v17, v7, v13, v14);
  }

  sub_1000522F8(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_10001DAB8();
}

uint64_t sub_1001AF4C0(void *a1)
{
  uint64_t v3 = sub_1000175B0(&qword_1002B9218);
  __chkstk_darwin(v3);
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  sub_100019F58(a1, v4);
  unint64_t v6 = sub_1001B14C4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedErrorType.CodingKeys,  &type metadata for OctaneSimulatedErrorType.CodingKeys,  v6,  v4,  v5);
  if (v1)
  {
    sub_10001DC08();
  }

  else
  {
    char v10 = 0;
    uint64_t v5 = KeyedDecodingContainer.decode(_:forKey:)(&v10, v3);
    uint64_t v8 = sub_1000175B0(&qword_1002A93B8);
    char v9 = 1;
    sub_1001B1500( &qword_1002A93E0,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v8, &v9, v3, v8);
    sub_10001DBBC();
    swift_bridgeObjectRetain();
    sub_10001DC08();
    swift_bridgeObjectRelease();
    sub_10001DC10();
  }

  return v5;
}

void sub_1001AF664(char *a1, unsigned __int8 *a2)
{
}

void sub_1001AF670()
{
}

uint64_t sub_1001AF678(uint64_t a1)
{
  return sub_1000B151C(a1, *v1);
}

void sub_1001AF680(uint64_t a1)
{
}

uint64_t sub_1001AF688@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  v3._rawValue = &off_100274508;
  uint64_t result = sub_1001B0094(*a1, v3);
  *a2 = result;
  return result;
}

void sub_1001AF6BC()
{
  char v1 = sub_100052340();
  *uint64_t v0 = sub_1001AF318(v1);
  v0[1] = v2;
  sub_10001945C();
}

uint64_t sub_1001AF6DC()
{
  return sub_1001AF318(*v0);
}

uint64_t sub_1001AF6E4@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001AF2FC(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001AF708(uint64_t a1)
{
  unint64_t v2 = sub_1001B14C4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001AF730(uint64_t a1)
{
  unint64_t v2 = sub_1001B14C4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001AF758@<X0>(uint64_t *a1@<X8>)
{
  return sub_1001AFD28((uint64_t (*)(void))sub_1001AF4C0, a1);
}

void sub_1001AF774(void *a1)
{
}

void sub_1001AF790(uint64_t *a1, uint64_t *a2)
{
}

void sub_1001AF7AC()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::OpaquePointer v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OctaneConfiguration();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
  id v6 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v6 pathForResource:v7 ofType:v8];

  if (v9)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    URL.init(fileURLWithPath:)(v10, v12);
    swift_bridgeObjectRelease();
    uint64_t v13 = Data.init(contentsOf:options:)(v3, 0LL);
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v16 = type metadata accessor for PropertyListDecoder(0LL);
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    uint64_t v17 = PropertyListDecoder.init()();
    uint64_t v18 = sub_1000175B0(&qword_1002B9178);
    sub_100190660( &qword_1002B9180,  &qword_1002B9178,  (uint64_t (*)(void))sub_1001B0ED8,  (const char *)&protocol conformance descriptor for <A> [A]);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v18, v13, v15, v18);
    sub_10003A9EC(v13, v15);
    swift_release(v17);
    BOOL v19 = v20;
  }

  else
  {
    BOOL v19 = _swiftEmptyArrayStorage;
  }

  off_1002B9148 = v19;
}

uint64_t sub_1001AF9E8(Swift::String a1)
{
  v1._rawValue = &off_100274558;
  return sub_1001B0094(a1, v1);
}

uint64_t sub_1001AFA04(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000010LL;
  }
  else {
    return 1701667182LL;
  }
}

void sub_1001AFA38(char *a1, unsigned __int8 *a2)
{
}

void sub_1001AFA44()
{
}

uint64_t sub_1001AFA4C(uint64_t a1)
{
  return sub_1000B1564(a1, *v1);
}

void sub_1001AFA54(uint64_t a1)
{
}

uint64_t sub_1001AFA5C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  v3._rawValue = &off_100274558;
  uint64_t result = sub_1001B0094(*a1, v3);
  *a2 = result;
  return result;
}

void sub_1001AFA90()
{
  char v1 = sub_100052340();
  *uint64_t v0 = sub_1001AFA04(v1);
  v0[1] = v2;
  sub_10001945C();
}

uint64_t sub_1001AFAB0()
{
  return sub_1001AFA04(*v0);
}

uint64_t sub_1001AFAB8@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001AF9E8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001AFADC(uint64_t a1)
{
  unint64_t v2 = sub_1001B1488();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001AFB04(uint64_t a1)
{
  unint64_t v2 = sub_1001B1488();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001AFB2C(void *a1)
{
  uint64_t v3 = sub_1000175B0(&qword_1002B9208);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100019F58(a1, v7);
  unint64_t v9 = sub_1001B1488();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedErrorData.CodingKeys,  &type metadata for OctaneSimulatedErrorData.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_100019F7C(a1);
  }

  else
  {
    char v14 = 0;
    uint64_t v8 = KeyedDecodingContainer.decode(_:forKey:)(&v14, v3);
    uint64_t v11 = sub_1000175B0(&qword_1002A93B8);
    char v13 = 1;
    sub_1001B1500( &qword_1002A93E0,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v11, &v13, v3, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_100019F7C(a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v8;
}

uint64_t sub_1001AFD0C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1001AFD28((uint64_t (*)(void))sub_1001AFB2C, a1);
}

uint64_t sub_1001AFD28@<X0>(uint64_t (*a1)(void)@<X4>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }

  return result;
}

void sub_1001AFD58()
{
  if (qword_1002A8DB0 != -1) {
    swift_once(&qword_1002A8DB0, sub_1001AF7AC);
  }
  uint64_t v0 = (char *)off_1002B9148;
  uint64_t v1 = *((void *)off_1002B9148 + 2);
  if (v1)
  {
    swift_bridgeObjectRetain_n(off_1002B9148, 2LL);
    uint64_t v2 = (uint64_t *)(v0 + 48);
    uint64_t v3 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v5 = *(v2 - 2);
      uint64_t v4 = *(v2 - 1);
      uint64_t v6 = *v2;
      swift_bridgeObjectRetain_n(v4, 4LL);
      swift_bridgeObjectRetain_n(v6, 4LL);
      uint64_t v7 = sub_1001B17B0();
      sub_10007ED7C(v7, v8, v9);
      sub_10001EDE8(v6);
      sub_10001EDE8(v4);
      uint64_t v10 = sub_1001B17B0();
      sub_100077AF0(v10, v11, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_1001B180C();
        uint64_t v3 = v15;
      }

      unint64_t v13 = v3[2];
      if (v13 >= v3[3] >> 1)
      {
        sub_1001B180C();
        uint64_t v3 = v16;
      }

      v3[2] = v13 + 1;
      char v14 = &v3[8 * v13];
      v14[4] = v5;
      v14[5] = v4;
      v14[6] = v6;
      *(_OWORD *)(v14 + 7) = 0u;
      *(_OWORD *)(v14 + 9) = 0u;
      v2 += 3;
      *((_BYTE *)v14 + 88) = 0;
      --v1;
    }

    while (v1);
    sub_10001EDE8((uint64_t)v0);
  }

  else
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
  }

  qword_1002EB9F8 = (uint64_t)v3;
}

uint64_t sub_1001AFEC8(uint64_t a1, uint64_t a2)
{
  if (qword_1002A8DA8 != -1) {
LABEL_27:
  }
    swift_once(&qword_1002A8DA8, sub_1001AF0B8);
  uint64_t v22 = *(void *)(qword_1002EB9F0 + 16);
  if (v22)
  {
    uint64_t v23 = qword_1002EB9F0 + 32;
    uint64_t v21 = qword_1002EB9F0;
    swift_bridgeObjectRetain_n(qword_1002EB9F0, 2LL);
    uint64_t v4 = 0LL;
    while (1)
    {
      uint64_t v5 = (uint64_t *)(v23 + 24 * v4);
      uint64_t v6 = (void *)v5[2];
      uint64_t v7 = v6[2];
      if (v7)
      {
        uint64_t v8 = *v5;
        uint64_t v9 = v6[4];
        uint64_t v10 = v6[5];
        BOOL v11 = v9 == a1 && v10 == a2;
        if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, a1, a2, 0LL) & 1) != 0)
        {
LABEL_21:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease_n(v21, 2LL);
          sub_1000CB9A8(a1, a2, v6);
          char v19 = v18;
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0) {
            return v8;
          }
          swift_bridgeObjectRelease();
          break;
        }

        if (v7 != 1)
        {
          uint64_t v12 = v6 + 7;
          uint64_t v13 = 1LL;
          while (1)
          {
            uint64_t v14 = v13 + 1;
            if (__OFADD__(v13, 1LL)) {
              break;
            }
            uint64_t v15 = *(v12 - 1);
            uint64_t v16 = *v12;
            BOOL v17 = v15 == a1 && v16 == a2;
            if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, a1, a2, 0LL) & 1) != 0) {
              goto LABEL_21;
            }
            v12 += 2;
            ++v13;
            if (v14 == v7) {
              goto LABEL_19;
            }
          }

          __break(1u);
          goto LABEL_27;
        }
      }

uint64_t sub_1001B0094(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  sub_100019390();
  if (v5 == 1) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 2;
  }
  if (v5) {
    return v6;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1001B00DC(Swift::String a1)
{
  v1._rawValue = &off_1002745A8;
  return sub_1001B0094(a1, v1);
}

uint64_t sub_1001B00F8(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x7865646E69LL;
  }
  else {
    return 1701869940LL;
  }
}

void sub_1001B0124(char *a1, unsigned __int8 *a2)
{
}

void sub_1001B0130()
{
}

uint64_t sub_1001B0138(uint64_t a1)
{
  return sub_1000B18F8(a1, *v1);
}

void sub_1001B0140(uint64_t a1)
{
}

uint64_t sub_1001B0148@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  v3._rawValue = &off_1002745A8;
  uint64_t result = sub_1001B0094(*a1, v3);
  *a2 = result;
  return result;
}

void sub_1001B017C()
{
  char v1 = sub_100052340();
  *uint64_t v0 = sub_1001B00F8(v1);
  v0[1] = v2;
  sub_10001945C();
}

uint64_t sub_1001B019C()
{
  return sub_1001B00F8(*v0);
}

uint64_t sub_1001B01A4@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001B00DC(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001B01C8(uint64_t a1)
{
  unint64_t v2 = sub_1001B0FF8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001B01F0(uint64_t a1)
{
  unint64_t v2 = sub_1001B0FF8();
  return CodingKey.debugDescription.getter(a1, v2);
}

char *sub_1001B0218(void *a1)
{
  uint64_t v3 = sub_1000175B0(&qword_1002B91A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100019F58(a1, v7);
  unint64_t v9 = sub_1001B0FF8();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedError.CurrentError.CodingKeys,  &type metadata for OctaneSimulatedError.CurrentError.CodingKeys,  v9,  v7,  v8);
  if (v1) {
    goto LABEL_13;
  }
  char v28 = 0;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)(&v28, v3);
  uint64_t v12 = v11;
  uint64_t v24 = v4;
  v25 = v6;
  uint64_t v26 = v3;
  if (qword_1002A8DA8 != -1) {
    swift_once(&qword_1002A8DA8, sub_1001AF0B8);
  }
  uint64_t v13 = *(void *)(qword_1002EB9F0 + 16);
  if (!v13)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v16 = type metadata accessor for OctaneError(0LL);
    unint64_t v17 = sub_10006E28C();
    swift_allocError(v16, v17, 0LL, 0LL);
    uint64_t v19 = swift_storeEnumTagMultiPayload(v18, v16, 3LL);
    swift_willThrow(v19);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
LABEL_13:
    sub_100019F7C(a1);
    return v6;
  }

  uint64_t v14 = qword_1002EB9F0 + 48;
  while (1)
  {
    unsigned int v6 = *(char **)(v14 - 16);
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)(v14 - 16), *(void *)(v14 - 8), v10, v12, 0LL) & 1) != 0) {
      goto LABEL_16;
    }
    v14 += 24LL;
    if (!--v13) {
      goto LABEL_12;
    }
  }

  unsigned int v6 = (char *)v10;
LABEL_16:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v27 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = v25;
  uint64_t v22 = v26;
  KeyedDecodingContainer.decode(_:forKey:)(&v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v22);
  sub_100019F7C(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1001B04D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = a5;
  uint64_t v9 = sub_1000175B0(&qword_1002B91D0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_100019F58(a1, v13);
  unint64_t v15 = sub_1001B0FF8();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedError.CurrentError.CodingKeys,  &type metadata for OctaneSimulatedError.CurrentError.CodingKeys,  v15,  v13,  v14);
  char v20 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, &v20, v9);
  if (!v5)
  {
    char v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v18, &v19, v9);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

char *sub_1001B05FC@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  uint64_t result = sub_1001B0218(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }

  return result;
}

uint64_t sub_1001B0628(void *a1)
{
  return sub_1001B04D4(a1, *v1, v1[1], v1[2], v1[3]);
}

unint64_t sub_1001B0644(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1002745F8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001B0690(char a1)
{
  if (!a1) {
    return 1701667182LL;
  }
  if (a1 == 1) {
    return 0x746E6572727563LL;
  }
  return 0x64656C62616E65LL;
}

void sub_1001B06E0(char *a1, unsigned __int8 *a2)
{
}

void sub_1001B06EC()
{
}

uint64_t sub_1001B06F4(uint64_t a1)
{
  return sub_1000B1890(a1, *v1);
}

void sub_1001B06FC(uint64_t a1)
{
}

unint64_t sub_1001B0704@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001B0644(*a1);
  *a2 = result;
  return result;
}

void sub_1001B0730()
{
  char v1 = sub_100052340();
  *uint64_t v0 = sub_1001B0690(v1);
  v0[1] = v2;
  sub_10001945C();
}

uint64_t sub_1001B0750()
{
  return sub_1001B0690(*v0);
}

uint64_t sub_1001B0758@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001B068C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001B077C(uint64_t a1)
{
  unint64_t v2 = sub_1001B0E1C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001B07A4(uint64_t a1)
{
  unint64_t v2 = sub_1001B0E1C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_1001B07CC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000175B0(&qword_1002B9150);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001B0E1C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedError.CodingKeys,  &type metadata for OctaneSimulatedError.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    goto LABEL_13;
  }
  LOBYTE(v50) = 0;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v50, v5);
  uint64_t v14 = v13;
  v46 = a2;
  uint64_t v47 = v6;
  uint64_t v48 = v5;
  v49 = v8;
  if (qword_1002A8DB0 != -1) {
    swift_once(&qword_1002A8DB0, sub_1001AF7AC);
  }
  uint64_t v15 = *((void *)off_1002B9148 + 2);
  if (!v15)
  {
LABEL_12:
    char v54 = 0;
    unint64_t v50 = 0LL;
    uint64_t v51 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(19LL);
    swift_bridgeObjectRelease();
    unint64_t v50 = 0xD000000000000011LL;
    uint64_t v51 = 0x8000000100222340LL;
    v21._countAndFlagsBits = v12;
    v21._object = v14;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    unint64_t v22 = v50;
    uint64_t v23 = v51;
    uint64_t v24 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v24, &protocol witness table for DecodingError, 0LL, 0LL);
    unint64_t v25 = sub_1001B0E58();
    uint64_t v26 = v49;
    unint64_t v27 = v22;
    uint64_t v28 = v48;
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)(&v54, v49, v27, v23, v48, v25);
    uint64_t v29 = swift_bridgeObjectRelease();
    swift_willThrow(v29);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v28);
LABEL_13:
    sub_10001DC08();
    uint64_t v30 = sub_1001B17B0();
    sub_100077AF0(v30, v31, v32);
    goto LABEL_14;
  }

  uint64_t v16 = (uint64_t *)((char *)off_1002B9148 + 48);
  while (1)
  {
    uint64_t v17 = *(v16 - 2);
    uint64_t v18 = (void *)*(v16 - 1);
    uint64_t v19 = *v16;
    if (v17 == v12 && v18 == v14) {
      break;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(*(v16 - 2), *(v16 - 1), v12, v14, 0LL) & 1) != 0) {
      goto LABEL_16;
    }
    v16 += 3;
    if (!--v15) {
      goto LABEL_12;
    }
  }

  uint64_t v17 = v12;
  uint64_t v18 = v14;
LABEL_16:
  sub_1000931C8();
  sub_10005231C();
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_1000175B0(&qword_1002ADCE8);
  char v54 = 1;
  sub_100190660( &qword_1002B9168,  &qword_1002ADCE8,  (uint64_t (*)(void))sub_1001B0E9C,  (const char *)&protocol conformance descriptor for <A> A?);
  sub_1000931C8();
  sub_10005231C();
  uint64_t v34 = v48;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v33, &v54, v48, v33);
  uint64_t v35 = v50;
  uint64_t v36 = v53;
  LOBYTE(v50) = 2;
  uint64_t v44 = v51;
  uint64_t v45 = v35;
  uint64_t v43 = v52;
  sub_10007ED7C(v35, v51, v52);
  char v37 = KeyedDecodingContainer.decode(_:forKey:)(&v50, v34);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v34);
  LODWORD(v49) = v37 & 1;
  sub_1000931C8();
  sub_10005231C();
  uint64_t v39 = v44;
  uint64_t v38 = v45;
  uint64_t v40 = v43;
  sub_10007ED7C(v45, v44, v43);
  sub_1001B17C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001DC08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1001B17C4();
  v41 = v46;
  uint64_t *v46 = v17;
  v41[1] = (uint64_t)v18;
  v41[2] = v19;
  v41[3] = v38;
  v41[4] = v39;
  v41[5] = v40;
  v41[6] = v36;
  *((_BYTE *)v41 + 56) = (_BYTE)v49;
LABEL_14:
  sub_10001DAB8();
}

uint64_t sub_1001B0BA0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000175B0(&qword_1002B9190);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_1000728A4();
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  sub_100019F58(a1, v6);
  unint64_t v8 = sub_1001B0E1C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OctaneSimulatedError.CodingKeys,  &type metadata for OctaneSimulatedError.CodingKeys,  v8,  v6,  v7);
  uint64_t v9 = *(void *)v2;
  v16[0] = 0;
  swift_bridgeObjectRetain();
  sub_1001B17D8(v9, v10, (uint64_t)v16);
  if (v9)
  {
    sub_1000522F8(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    return sub_10001DC10();
  }

  else
  {
    sub_10001DC10();
    sub_1001B0F14(v2 + 24, (uint64_t)v17);
    sub_1001B0F14((uint64_t)v17, (uint64_t)v16);
    char v15 = 1;
    sub_1001B0F5C(v17);
    uint64_t v12 = sub_1000175B0(&qword_1002ADCE8);
    sub_100190660( &qword_1002B9198,  &qword_1002ADCE8,  (uint64_t (*)(void))sub_1001B0F8C,  (const char *)&protocol conformance descriptor for <A> A?);
    sub_1001B1818((uint64_t)v16, (uint64_t)&v15, v4, v12, v13);
    sub_1001B0FC8(v17);
    uint64_t v14 = *(unsigned __int8 *)(v2 + 56);
    v16[0] = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v16, v4);
    return sub_1000522F8(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  }

uint64_t sub_1001B0D40(uint64_t a1)
{
  switch(a1)
  {
    case 11LL:
      uint64_t result = 1LL;
      break;
    case 12LL:
      uint64_t result = 4LL;
      break;
    case 13LL:
      uint64_t result = 2LL;
      break;
    case 14LL:
      uint64_t result = 3LL;
      break;
    default:
      if (a1 == 1) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = 5LL;
      }
      break;
  }

  return result;
}

double sub_1001B0D94@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }

  return result;
}

uint64_t sub_1001B0DDC(void *a1)
{
  return sub_1001B0BA0(a1);
}

unint64_t sub_1001B0E1C()
{
  unint64_t result = qword_1002B9158;
  if (!qword_1002B9158)
  {
    unint64_t result = swift_getWitnessTable("-Q\b", &type metadata for OctaneSimulatedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9158);
  }

  return result;
}

unint64_t sub_1001B0E58()
{
  unint64_t result = qword_1002B9160;
  if (!qword_1002B9160)
  {
    uint64_t v1 = sub_100018EC0(&qword_1002B9150);
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for KeyedDecodingContainer<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1002B9160);
  }

  return result;
}

unint64_t sub_1001B0E9C()
{
  unint64_t result = qword_1002B9170;
  if (!qword_1002B9170)
  {
    unint64_t result = swift_getWitnessTable("5T\b", &type metadata for OctaneSimulatedError.CurrentError);
    atomic_store(result, (unint64_t *)&qword_1002B9170);
  }

  return result;
}

unint64_t sub_1001B0ED8()
{
  unint64_t result = qword_1002B9188;
  if (!qword_1002B9188)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B6D4, &type metadata for OctaneSimulatedErrorData);
    atomic_store(result, (unint64_t *)&qword_1002B9188);
  }

  return result;
}

uint64_t sub_1001B0F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002ADCE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1001B0F5C(uint64_t *a1)
{
  return a1;
}

unint64_t sub_1001B0F8C()
{
  unint64_t result = qword_1002B91A0;
  if (!qword_1002B91A0)
  {
    unint64_t result = swift_getWitnessTable("MT\b", &type metadata for OctaneSimulatedError.CurrentError);
    atomic_store(result, (unint64_t *)&qword_1002B91A0);
  }

  return result;
}

uint64_t *sub_1001B0FC8(uint64_t *a1)
{
  return a1;
}

unint64_t sub_1001B0FF8()
{
  unint64_t result = qword_1002B91B0;
  if (!qword_1002B91B0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B684, &type metadata for OctaneSimulatedError.CurrentError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91B0);
  }

  return result;
}

unint64_t sub_1001B1034()
{
  unint64_t result = qword_1002B91C8;
  if (!qword_1002B91C8)
  {
    unint64_t result = swift_getWitnessTable("EQ\b", &type metadata for OctaneSimulatedErrorType);
    atomic_store(result, (unint64_t *)&qword_1002B91C8);
  }

  return result;
}

void *sub_1001B1070(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  swift_bridgeObjectRetain(a1[1]);
  swift_bridgeObjectRetain(v2);
  sub_10007ED7C(v3, v4, v5);
  return a1;
}

void *sub_1001B10D0(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(v2);
  sub_100077AF0(v3, v4, v5);
  return a1;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError.CurrentError.CodingKeys()
{
  return &type metadata for OctaneSimulatedError.CurrentError.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for OctaneSimulatedError.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1001B118C + 4 * byte_10020B2EE[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001B11C0 + 4 * byte_10020B2E9[v4]))();
}

uint64_t sub_1001B11C0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001B11C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001B11D0LL);
  }
  return result;
}

uint64_t sub_1001B11DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001B11E4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1001B11E8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001B11F0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError.CodingKeys()
{
  return &type metadata for OctaneSimulatedError.CodingKeys;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorData()
{
  return &type metadata for OctaneSimulatedErrorData;
}

void *_s25ASOctaneSupportXPCService24OctaneSimulatedErrorDataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t _s25ASOctaneSupportXPCService24OctaneSimulatedErrorDataVwca_0(void *a1, void *a2)
{
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  sub_100019390();
  return v3;
}

uint64_t _s25ASOctaneSupportXPCService24OctaneSimulatedErrorDataVwta_0(void *a1, void *a2)
{
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  return v3;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorType()
{
  return &type metadata for OctaneSimulatedErrorType;
}

unint64_t sub_1001B130C()
{
  unint64_t result = qword_1002B91D8;
  if (!qword_1002B91D8)
  {
    unint64_t result = swift_getWitnessTable("mR\b", &type metadata for OctaneSimulatedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91D8);
  }

  return result;
}

unint64_t sub_1001B134C()
{
  unint64_t result = qword_1002B91E0;
  if (!qword_1002B91E0)
  {
    unint64_t result = swift_getWitnessTable("}Q\b", &type metadata for OctaneSimulatedError.CurrentError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91E0);
  }

  return result;
}

unint64_t sub_1001B138C()
{
  unint64_t result = qword_1002B91E8;
  if (!qword_1002B91E8)
  {
    unint64_t result = swift_getWitnessTable("UR\b", &type metadata for OctaneSimulatedError.CurrentError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91E8);
  }

  return result;
}

unint64_t sub_1001B13CC()
{
  unint64_t result = qword_1002B91F0;
  if (!qword_1002B91F0)
  {
    unint64_t result = swift_getWitnessTable("=R\b", &type metadata for OctaneSimulatedError.CurrentError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91F0);
  }

  return result;
}

unint64_t sub_1001B140C()
{
  unint64_t result = qword_1002B91F8;
  if (!qword_1002B91F8)
  {
    unint64_t result = swift_getWitnessTable("ES\b", &type metadata for OctaneSimulatedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B91F8);
  }

  return result;
}

unint64_t sub_1001B144C()
{
  unint64_t result = qword_1002B9200;
  if (!qword_1002B9200)
  {
    unint64_t result = swift_getWitnessTable("-S\b", &type metadata for OctaneSimulatedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9200);
  }

  return result;
}

unint64_t sub_1001B1488()
{
  unint64_t result = qword_1002B9210;
  if (!qword_1002B9210)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B97C, &type metadata for OctaneSimulatedErrorData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9210);
  }

  return result;
}

unint64_t sub_1001B14C4()
{
  unint64_t result = qword_1002B9220;
  if (!qword_1002B9220)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B92C, &type metadata for OctaneSimulatedErrorType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9220);
  }

  return result;
}

void sub_1001B1500(unint64_t *a1, uint64_t a2, const char *a3)
{
  if (!*a1)
  {
    uint64_t v6 = sub_100018EC0(&qword_1002A93B8);
    uint64_t v7 = a2;
    atomic_store(swift_getWitnessTable(a3, v6, &v7), a1);
  }

  sub_10001DBAC();
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorType.CodingKeys()
{
  return &type metadata for OctaneSimulatedErrorType.CodingKeys;
}

uint64_t _s25ASOctaneSupportXPCService20OctaneSimulatedErrorV12CurrentErrorV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001B15B0 + 4 * byte_10020B2F8[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001B15E4 + 4 * byte_10020B2F3[v4]))();
}

uint64_t sub_1001B15E4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001B15EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001B15F4LL);
  }
  return result;
}

uint64_t sub_1001B1600(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001B1608LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1001B160C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001B1614(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorData.CodingKeys()
{
  return &type metadata for OctaneSimulatedErrorData.CodingKeys;
}

unint64_t sub_1001B1634()
{
  unint64_t result = qword_1002B9230;
  if (!qword_1002B9230)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B814, &type metadata for OctaneSimulatedErrorData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9230);
  }

  return result;
}

unint64_t sub_1001B1674()
{
  unint64_t result = qword_1002B9238;
  if (!qword_1002B9238)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B904, &type metadata for OctaneSimulatedErrorType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9238);
  }

  return result;
}

unint64_t sub_1001B16B4()
{
  unint64_t result = qword_1002B9240;
  if (!qword_1002B9240)
  {
    unint64_t result = swift_getWitnessTable(byte_10020B83C, &type metadata for OctaneSimulatedErrorType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9240);
  }

  return result;
}

unint64_t sub_1001B16F4()
{
  unint64_t result = qword_1002B9248;
  if (!qword_1002B9248)
  {
    unint64_t result = swift_getWitnessTable("mO\b", &type metadata for OctaneSimulatedErrorType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9248);
  }

  return result;
}

unint64_t sub_1001B1734()
{
  unint64_t result = qword_1002B9250;
  if (!qword_1002B9250)
  {
    unint64_t result = swift_getWitnessTable("uP\b", &type metadata for OctaneSimulatedErrorData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9250);
  }

  return result;
}

unint64_t sub_1001B1774()
{
  unint64_t result = qword_1002B9258;
  if (!qword_1002B9258)
  {
    unint64_t result = swift_getWitnessTable("]P\b", &type metadata for OctaneSimulatedErrorData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9258);
  }

  return result;
}

uint64_t sub_1001B17B0()
{
  return 0LL;
}

uint64_t sub_1001B17C4()
{
  return sub_100077AF0(v1, v2, v0);
}

uint64_t sub_1001B17D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, v4, a3, v3);
}

void *sub_1001B17EC(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_1001B1800()
{
  return sub_100077AF0(v0[3], v0[4], v0[5]);
}

void sub_1001B180C()
{
}

uint64_t sub_1001B1818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

uint64_t static NSJSONSerialization.jsonObject(with:options:)@<X0>( unint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  unint64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  uint64_t v9 = swift_retain();
  Data.init(buffer:byteTransferStrategy:)(v9, a1, a2 & 0xFFFFFFFFFFFFFFLL, 2);
  uint64_t v11 = v10;
  unint64_t v13 = v12;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10003A9EC(v11, v13);
  id v20 = 0LL;
  id v15 = [v8 JSONObjectWithData:isa options:a3 error:&v20];

  id v16 = v20;
  if (v15)
  {
    _bridgeAnyObjectToAny(_:)(a4, v15);
    return swift_unknownObjectRelease(v15);
  }

  else
  {
    uint64_t v18 = v16;
    _convertNSErrorToError(_:)(v16);

    return swift_willThrow(v19);
  }

BOOL static _UInt24.== infix(_:_:)(int a1, int a2)
{
  return (a1 & 0xFFFFFF) == (a2 & 0xFFFFFF);
}

Swift::UInt32 __swiftcall UInt32.init(_:)(ASOctaneSupportXPCService::_UInt24 a1)
{
  return v1 | (a1._backing._0 << 8);
}

void *_UInt24.max.unsafeMutableAddressor()
{
  return &static _UInt24.max;
}

uint64_t _UInt24._backing.getter(int a1)
{
  return a1 & 0xFFFFFF;
}

uint64_t _UInt24._backing.setter(uint64_t result, char a2)
{
  *(_WORD *)uint64_t v2 = result;
  *(_BYTE *)(v2 + 2) = a2;
  return result;
}

uint64_t static _UInt24.max.getter()
{
  return 0xFFFFFFLL;
}

void *_UInt24.min.unsafeMutableAddressor()
{
  return &static _UInt24.min;
}

BOOL sub_1001B19B0(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return static _UInt24.== infix(_:_:)( *a1 | (*((unsigned __int8 *)a1 + 2) << 16),  *a2 | (*((unsigned __int8 *)a2 + 2) << 16));
}

void _UInt24.description.getter()
{
  unint64_t v0 = sub_1001B1A08();
  BinaryInteger.description.getter(&type metadata for UInt32, v0);
  sub_10011A79C();
}

unint64_t sub_1001B1A08()
{
  unint64_t result = qword_1002B9260;
  if (!qword_1002B9260)
  {
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(result, (unint64_t *)&qword_1002B9260);
  }

  return result;
}

void sub_1001B1A44()
{
}

uint64_t initializeBufferWithCopyOfBuffer for _UInt24(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for _UInt24(unsigned __int16 *a1, int a2)
{
  if (a2)
  {
    if ((a2 + 0x1FFFFFF) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 0xFFFFFF;
      }
    }

    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
    }
  }

  return 0LL;
}

uint64_t storeEnumTagSinglePayload for _UInt24(uint64_t result, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  if (!a3) {
    int v3 = 0;
  }
  if (a2)
  {
    *(_WORD *)unint64_t result = a2 - 1;
    *(_BYTE *)(result + 2) = (a2 - 1) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 1) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(_BYTE *)(result + 3) = v4;
      }
    }
  }

  else if (v3)
  {
    if (v3 == 2) {
      *(_WORD *)(result + 3) = 0;
    }
    else {
      *(_BYTE *)(result + 3) = 0;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for _UInt24()
{
  return &type metadata for _UInt24;
}

ValueMetadata *type metadata accessor for _UInt56()
{
  return &type metadata for _UInt56;
}

void sub_1001B1B44()
{
  unint64_t v0 = sub_10011A354();
  BinaryInteger.description.getter(&type metadata for UInt64, v0);
  sub_10011A79C();
}

void sub_1001B1B7C()
{
}

uint64_t sub_1001B1B94(uint64_t *a1)
{
  uint64_t v2 = a1[12];
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_1000F168C(0x44497465737361LL, 0xE700000000000000LL), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(*(void *)(v2 + 56) + 16 * v3);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1001BCBC8();
    sub_10012A314(6580578LL, 0xE300000000000000LL, v6);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_100038FD4(a1);
    if (!v8)
    {
      swift_bridgeObjectRelease();
      return 0LL;
    }
  }

  else
  {
    sub_100038FD4(a1);
    return 0LL;
  }

  return v5;
}

_UNKNOWN **sub_1001B1C78()
{
  return &off_100290980;
}

void sub_1001B1C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100034728((_OWORD *)a1, v5);
    sub_1001B7FF0(v5, a2, a3);
    sub_100019390();
  }

  else
  {
    sub_1001B99E4(a1);
    sub_1001B79EC(a2, a3, v5);
    sub_100019390();
    sub_1001B99E4((uint64_t)v5);
  }

  sub_100013858();
}

void sub_1001B1CF8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_100034728((_OWORD *)a1, v3);
    sub_1001B8024(v3, a2);
  }

  else
  {
    sub_100034F14(a1, (uint64_t *)&unk_1002B9380);
    sub_1001B7B10(a2, v3);
    sub_100034F14((uint64_t)v3, (uint64_t *)&unk_1002B9380);
  }

  sub_100013858();
}

void sub_1001B1D60(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10002A118((__int128 *)a1, (uint64_t)v5);
    sub_1001B82C0(v5, a2, a3);
    sub_1001B9ACC();
  }

  else
  {
    sub_1001B99E4(a1);
    sub_1001B7EBC(a2, (uint64_t)v5);
    sub_1001B9ACC();
    sub_1001B99E4((uint64_t)v5);
  }

void sub_1001B1DE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_1000175B0((uint64_t *)&unk_1002B93A0);
    unint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    unint64_t v3 = _swiftEmptyDictionarySingleton;
  }

  uint64_t v33 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v32 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = v3 + 8;
  sub_100019320();
  sub_100041B5C();
  int64_t v8 = 0LL;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_10002C010(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v45);
    *(void *)&__int128 v44 = v21;
    *((void *)&v44 + 1) = v20;
    v42[2] = v44;
    v43[0] = v45[0];
    v43[1] = v45[1];
    *(void *)&v42[0] = v21;
    *((void *)&v42[0] + 1) = v20;
    swift_bridgeObjectRetain();
    swift_dynamicCast(&v34, v42, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_100034728(v43, v37);
    __int128 v38 = v34;
    __int128 v39 = v35;
    uint64_t v40 = v36;
    sub_100034728(v37, v41);
    __int128 v34 = v38;
    __int128 v35 = v39;
    uint64_t v36 = v40;
    sub_100034728(v41, v42);
    sub_100034728(v42, &v38);
    Swift::Int v22 = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v23 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v24 = v22 & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~v7[v24 >> 6]) == 0)
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      while (++v25 != v28 || (v27 & 1) == 0)
      {
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = v7[v25];
        if (v30 != -1)
        {
          unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
          goto LABEL_38;
        }
      }

      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }

    unint64_t v26 = __clz(__rbit64((-1LL << v24) & ~v7[v24 >> 6])) | v24 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_38:
    *(void *)((char *)v7 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v26;
    uint64_t v31 = v3[6] + 40 * v26;
    *(_OWORD *)uint64_t v31 = v34;
    *(_OWORD *)(v31 + 16) = v35;
    *(void *)(v31 + 32) = v36;
    sub_100034728(&v38, (_OWORD *)(v3[7] + 32 * v26));
    ++v3[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1LL)) {
      goto LABEL_42;
    }
    if (v11 >= v32) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v33 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      sub_1001B9AFC();
      if (v14 == v15) {
        goto LABEL_40;
      }
      sub_1001B9AF0();
      if (!v12)
      {
        sub_1001B9AFC();
        if (v14 == v15) {
          goto LABEL_40;
        }
        sub_1001B9AF0();
        if (!v12)
        {
          sub_1001B9AFC();
          if (v14 == v15) {
            goto LABEL_40;
          }
          sub_1001B9AF0();
          if (!v12) {
            break;
          }
        }
      }
    }

void sub_1001B2174(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
}

void sub_1001B2190()
{
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = *(void (**)(void *, void *, uint64_t))(v6 + 32);
  id v9 = v4;
  id v8 = v3;
  v7(v5, v3, v1);

  sub_1001B9468(v9);
}

void sub_1001B21F0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
}

void sub_1001B220C()
{
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = *(void (**)(void *, void *))(v4 + 32);
  id v7 = v2;
  id v6 = v1;
  v5(v3, v1);

  sub_1001B9468(v7);
}

uint64_t sub_1001B2264(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1001B22A0(char a1)
{
  return qword_10020BBC8[a1];
}

void sub_1001B22B4(uint64_t *a1@<X8>)
{
  *a1 = sub_1001B22A0(*v1);
  sub_10001945C();
}

void sub_1001B22D8()
{
  id v0 = [(id)objc_opt_self(OctaneStorage) persistedDataPath];
  if (v0)
  {
    NSString v1 = String._bridgeToObjectiveC()();
    id v2 = [v0 stringByAppendingPathComponent:v1];

    id v0 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v4 = v3;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  qword_1002B9270 = (uint64_t)v0;
  qword_1002B9278 = v4;
}

uint64_t sub_1001B238C()
{
  uint64_t v0 = type metadata accessor for Date(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [(id)objc_opt_self(OctaneStorage) persistedDataPath];
  if (!v4) {
    return (uint64_t)v4;
  }
  v16[0] = 0LL;
  v16[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(19LL);
  uint64_t v5 = swift_bridgeObjectRelease(v16[1]);
  strcpy((char *)v16, "store-corrupt-");
  HIBYTE(v16[1]) = -18;
  uint64_t v6 = static Date.now.getter(v5);
  double v7 = Date.timeIntervalSinceReferenceDate.getter(v6);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((~*(void *)&v7 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  if (v7 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (v7 < 9.22337204e18)
  {
    v15[1] = (uint64_t)v7;
    v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v9._object;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(object);
    v11._countAndFlagsBits = 6448174LL;
    v11._object = (void *)0xE300000000000000LL;
    String.append(_:)(v11);
    uint64_t v12 = v16[1];
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
    id v14 = [v4 stringByAppendingPathComponent:v13];

    id v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    return (uint64_t)v4;
  }

void sub_1001B256C()
{
  id v0 = sub_1001B25B8();
  id v1 = [objc_allocWithZone((Class)SQLiteDatabase) initWithConnectionOptions:v0];

  qword_1002B9280 = (uint64_t)v1;
}

id sub_1001B25B8()
{
  if (qword_1002A8DC0 != -1) {
    swift_once(&qword_1002A8DC0, sub_1001B22D8);
  }
  uint64_t v0 = qword_1002B9278;
  if (!qword_1002B9278)
  {
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_100018F68(v3, (uint64_t)qword_1002EB9D0);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)double v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "StoreKit Testing in Xcode is unavailable. Please file a bug and attach a sysdiagnose.",  v7,  2u);
      swift_slowDealloc(v7, -1LL, -1LL);
    }

    exit(1);
  }

  uint64_t v1 = qword_1002B9270;
  sub_1001B9290();
  swift_bridgeObjectRetain(v0);
  return sub_1001B26EC(v1, v0);
}

id sub_1001B26EC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithDatabasePath:v5];

  return v6;
}

void sub_1001B275C()
{
  if (qword_1002A8DC8 != -1) {
    swift_once(&qword_1002A8DC8, sub_1001B256C);
  }
  uint64_t v0 = (void *)qword_1002B9280;
  id v1 = objc_allocWithZone((Class)type metadata accessor for DatabaseStore());
  id v2 = v0;
  id v3 = [v1 initWithDatabase:v2];

  qword_1002EBA00 = (uint64_t)v3;
  sub_10001945C();
}

void sub_1001B27D8()
{
  v0._countAndFlagsBits = 0xD00000000000001BLL;
  v0._object = (void *)0x80000001002224C0LL;
  String.append(_:)(v0);
  id v1 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  id v4 = v3;

  v5._countAndFlagsBits = v2;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x80000001002224E0LL;
  v6._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = 0x6E6F69746361LL;
  v7._object = (void *)0xE600000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0xD000000000000010LL;
  v8._object = (void *)0x8000000100222500LL;
  String.append(_:)(v8);
  v9._object = (void *)0xEA00000000007375LL;
  v9._countAndFlagsBits = 0x746174735F627461LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 0x52454745544E4920LL;
  v10._object = (void *)0xEA00000000000A2CLL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = 0x695F656C646E7562LL;
  v11._object = (void *)0xE900000000000064LL;
  String.append(_:)(v11);
  v12._countAndFlagsBits = 0xD000000000000010LL;
  v12._object = (void *)0x8000000100222500LL;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0x645F6C65636E6163LL;
  v13._object = (void *)0xEB00000000657461LL;
  String.append(_:)(v13);
  v14._countAndFlagsBits = 0xA2C4C41455220LL;
  v14._object = (void *)0xE700000000000000LL;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 0x6974617269707865LL;
  v15._object = (void *)0xEF657461645F6E6FLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = 0xA2C4C41455220LL;
  v16._object = (void *)0xE700000000000000LL;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0x64656873696E6966LL;
  v17._object = (void *)0xE800000000000000LL;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0xD00000000000001DLL;
  v18._object = (void *)0x8000000100222520LL;
  String.append(_:)(v18);
  v19._countAndFlagsBits = 0xD000000000000012LL;
  v19._object = (void *)0x8000000100217560LL;
  String.append(_:)(v19);
  v20._countAndFlagsBits = 0xD00000000000001DLL;
  v20._object = (void *)0x8000000100222520LL;
  String.append(_:)(v20);
  v21._countAndFlagsBits = 25705LL;
  v21._object = (void *)0xE200000000000000LL;
  String.append(_:)(v21);
  v22._countAndFlagsBits = 0xD000000000000013LL;
  v22._object = (void *)0x8000000100222540LL;
  String.append(_:)(v22);
  v23._countAndFlagsBits = 0x6C616E696769726FLL;
  v23._object = (void *)0xEB0000000064695FLL;
  String.append(_:)(v23);
  v24._countAndFlagsBits = 0x52454745544E4920LL;
  v24._object = (void *)0xEA00000000000A2CLL;
  String.append(_:)(v24);
  v25._countAndFlagsBits = 0xD000000000000016LL;
  v25._object = (void *)0x80000001002175B0LL;
  String.append(_:)(v25);
  v26._countAndFlagsBits = 0xA2C4C41455220LL;
  v26._object = (void *)0xE700000000000000LL;
  String.append(_:)(v26);
  v27._countAndFlagsBits = 0x5F746375646F7270LL;
  v27._object = (void *)0xEA00000000006469LL;
  String.append(_:)(v27);
  v28._countAndFlagsBits = 0xD000000000000010LL;
  v28._object = (void *)0x8000000100222500LL;
  String.append(_:)(v28);
  v29._countAndFlagsBits = 0xD000000000000011LL;
  v29._object = (void *)0x8000000100217590LL;
  String.append(_:)(v29);
  v30._countAndFlagsBits = 0xA2C5458455420LL;
  v30._object = (void *)0xE700000000000000LL;
  String.append(_:)(v30);
  v31._countAndFlagsBits = 0x6573616863727570LL;
  v31._object = (void *)0xED0000657461645FLL;
  String.append(_:)(v31);
  v32._object = (void *)0x8000000100222560LL;
  v32._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v32);
  v33._countAndFlagsBits = 0x797469746E617571LL;
  v33._object = (void *)0xE800000000000000LL;
  String.append(_:)(v33);
  v34._object = (void *)0x8000000100222580LL;
  v34._countAndFlagsBits = 0xD00000000000001DLL;
  String.append(_:)(v34);
  v35._countAndFlagsBits = 0x6574617473LL;
  v35._object = (void *)0xE500000000000000LL;
  String.append(_:)(v35);
  v36._countAndFlagsBits = 0xD00000000000001DLL;
  v36._object = (void *)0x8000000100222520LL;
  String.append(_:)(v36);
  v37._countAndFlagsBits = 0xD000000000000015LL;
  v37._object = (void *)0x80000001002175E0LL;
  String.append(_:)(v37);
  v38._countAndFlagsBits = 0xA2C5458455420LL;
  v38._object = (void *)0xE700000000000000LL;
  String.append(_:)(v38);
  v39._countAndFlagsBits = 1701869940LL;
  v39._object = (void *)0xE400000000000000LL;
  String.append(_:)(v39);
  v40._countAndFlagsBits = 0xD000000000000010LL;
  v40._object = (void *)0x8000000100222500LL;
  String.append(_:)(v40);
  v41._object = (void *)0xEA0000000000646ELL;
  v41._countAndFlagsBits = 0x756665725F646964LL;
  String.append(_:)(v41);
  v42._countAndFlagsBits = 0xD00000000000001DLL;
  v42._object = (void *)0x8000000100222520LL;
  String.append(_:)(v42);
  v43._countAndFlagsBits = 0x64695F726566666FLL;
  v43._object = (void *)0xE800000000000000LL;
  String.append(_:)(v43);
  v44._countAndFlagsBits = 0xA2C5458455420LL;
  v44._object = (void *)0xE700000000000000LL;
  String.append(_:)(v44);
  v45._object = (void *)0x8000000100217610LL;
  v45._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v45);
  v46._countAndFlagsBits = 0xD00000000000001ALL;
  v46._object = (void *)0x80000001002225A0LL;
  String.append(_:)(v46);
  qword_1002EBA08 = 0LL;
  unk_1002EBA10 = 0xE000000000000000LL;
}

unint64_t sub_1001B2D30()
{
  if (qword_1002A8DC0 != -1) {
    swift_once(&qword_1002A8DC0, sub_1001B22D8);
  }
  if (qword_1002B9278) {
    unint64_t v0 = qword_1002B9270;
  }
  else {
    unint64_t v0 = 0xD000000000000012LL;
  }
  swift_bridgeObjectRetain(qword_1002B9278);
  return v0;
}

void sub_1001B2DC0()
{
  id v0 = [objc_allocWithZone((Class)SQLiteDatabaseStoreDescriptor) init];
  NSString v1 = String._bridgeToObjectiveC()();
  sub_1001B9A1C(v0, "setSchemaName:");

  uint64_t v2 = type metadata accessor for DatabaseSession();
  [v0 setSessionClass:swift_getObjCClassFromMetadata(v2)];
  uint64_t v3 = type metadata accessor for DatabaseTransaction();
  [v0 setTransactionClass:swift_getObjCClassFromMetadata(v3)];
  sub_10001945C();
}

void sub_1001B2E60()
{
  char v2 = v0;
  sub_1001B9A60();
  uint64_t v3 = sub_100019310((uint64_t)&unk_100290A38, 32LL);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v0;
  uint64_t v4 = sub_100019310((uint64_t)&unk_100290A60, 32LL);
  *(void *)(v4 + 16) = sub_1001B7478;
  *(void *)(v4 + 24) = v3;
  sub_1001B98CC((uint64_t)sub_1001B2F9C, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v6, v7);
  sub_1001B99EC();
  uint64_t v5 = sub_10002A524();
  sub_1001B9AC0(v5, "readUsingSession:");
  sub_100160804();
  sub_1001A42B8(v4, (uint64_t)"", 115LL, 104LL, 28LL);
  sub_1001B9A24();
  sub_100024F0C();
  if ((v2 & 1) != 0) {
    __break(1u);
  }
  else {
    sub_10010D9C8();
  }
}

uint64_t sub_1001B2F3C(void *a1, void (*a2)(void *))
{
  v6[3] = type metadata accessor for DatabaseSession();
  v6[4] = &off_10027FF18;
  v6[0] = a1;
  id v4 = a1;
  a2(v6);
  return sub_100019F7C(v6);
}

void sub_1001B2F9C(uint64_t a1, void *a2)
{
  char v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_1001B2FD0()
{
  char v2 = v0;
  sub_1001B9A60();
  uint64_t v3 = sub_100019310((uint64_t)&unk_1002909C0, 32LL);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v0;
  uint64_t v4 = sub_100019310((uint64_t)&unk_1002909E8, 32LL);
  *(void *)(v4 + 16) = sub_1001B741C;
  *(void *)(v4 + 24) = v3;
  sub_1001B98CC((uint64_t)sub_1001B3114, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v6, v7);
  sub_1001B99EC();
  uint64_t v5 = sub_10002A524();
  sub_1001B9AC0(v5, "modifyUsingTransaction:");
  sub_100160804();
  sub_1001A42B8(v4, (uint64_t)"", 115LL, 110LL, 34LL);
  sub_1001B9A24();
  sub_100024F0C();
  if ((v2 & 1) != 0) {
    __break(1u);
  }
  else {
    sub_10010D9C8();
  }
}

uint64_t sub_1001B30AC(void *a1, uint64_t (*a2)(void *))
{
  v6[3] = type metadata accessor for DatabaseTransaction();
  v6[4] = &off_10028F990;
  v6[0] = a1;
  id v4 = a1;
  LOBYTE(a2) = a2(v6);
  sub_100019F7C(v6);
  return a2 & 1;
}

uint64_t sub_1001B3114(uint64_t a1, void *a2)
{
  char v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

uint64_t sub_1001B3150(id a1)
{
  uint64_t v3 = v2;
  uint64_t v139 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  sub_10009291C();
  uint64_t v151 = v6;
  sub_100092978();
  __chkstk_darwin(v7);
  sub_100092AF0();
  uint64_t v161 = v8;
  sub_100092978();
  __chkstk_darwin(v9);
  sub_100092AF0();
  uint64_t v140 = v10;
  sub_100092978();
  __chkstk_darwin(v11);
  sub_100092AF0();
  uint64_t v155 = v12;
  sub_100092978();
  __chkstk_darwin(v13);
  uint64_t v163 = (uint64_t)&v133 - v14;
  uint64_t v15 = sub_1000175B0((uint64_t *)&unk_1002B9350);
  __chkstk_darwin(v15);
  sub_1000227D0();
  v164 = (int *)v16;
  uint64_t v153 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v138 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  sub_1000227D0();
  uint64_t v137 = v17;
  uint64_t v18 = sub_1000175B0(&qword_1002A9720);
  __chkstk_darwin(v18);
  sub_10009291C();
  v158 = v19;
  sub_100092978();
  __chkstk_darwin(v20);
  sub_100092AF0();
  uint64_t v157 = v21;
  sub_100092978();
  uint64_t v23 = __chkstk_darwin(v22);
  v136 = (char *)&v133 - v24;
  LOBYTE(sub_100018AD4(v1, v0, v2) = 1;
  Swift::String v25 = (const char **)&unk_1002A6000;
  unsigned int v149 = enum case for URL.DirectoryHint.inferFromPath(_:);
  *((void *)&v26 + 1) = 6LL;
  __int128 v148 = xmmword_1001FCE90;
  *(void *)&__int128 v26 = 136315394LL;
  __int128 v147 = v26;
  v146 = (char *)&type metadata for Any + 8;
  id v135 = a1;
  uint64_t v134 = v3;
  uint64_t v162 = v5;
  while (2)
  {
    id v27 = sub_1001B9A30(v23, v25[279]);
    switch((unint64_t)v27)
    {
      case 0x3A98uLL:
        uint64_t v28 = sub_1000D6B98((uint64_t)&unk_100290DD0);
        *(void *)(v28 + 16) = v3;
        sub_1001B93FC(v28, (uint64_t)sub_1001B794C);
        sub_1001B93D8((uint64_t)&unk_100290DE8);
        sub_1001B93E4();
        unsigned __int8 v29 = [a1 migrateToVersion:15001 usingBlock:v1];
        goto LABEL_57;
      case 0x3A99uLL:
        uint64_t v120 = sub_1000D6B98((uint64_t)&unk_100290D80);
        *(void *)(v120 + 16) = v3;
        sub_1001B93FC(v120, (uint64_t)sub_1001B792C);
        sub_1001B93D8((uint64_t)&unk_100290D98);
        sub_1001B93E4();
        unsigned __int8 v29 = [a1 migrateToVersion:15002 usingBlock:v1];
        goto LABEL_57;
      case 0x3A9AuLL:
        uint64_t v121 = sub_1000D6B98((uint64_t)&unk_100290D30);
        *(void *)(v121 + 16) = v3;
        sub_1001B93FC(v121, (uint64_t)sub_1001B78F8);
        sub_1001B93D8((uint64_t)&unk_100290D48);
        sub_1001B93E4();
        unsigned __int8 v29 = [a1 migrateToVersion:15003 usingBlock:v1];
        goto LABEL_57;
      case 0x3A9BuLL:
        uint64_t v122 = sub_1000D6B98((uint64_t)&unk_100290CE0);
        *(void *)(v122 + 16) = v3;
        sub_1001B93FC(v122, (uint64_t)sub_1001B78D8);
        sub_1001B93D8((uint64_t)&unk_100290CF8);
        sub_1001B93E4();
        unsigned __int8 v29 = [a1 migrateToVersion:15004 usingBlock:v1];
        goto LABEL_57;
      case 0x3A9CuLL:
        uint64_t v123 = sub_1000D6B98((uint64_t)&unk_100290C90);
        *(void *)(v123 + 16) = v3;
        sub_1001B93FC(v123, (uint64_t)sub_1001B78A4);
        sub_1001B93D8((uint64_t)&unk_100290CA8);
        sub_1001B93E4();
        unsigned __int8 v29 = [a1 migrateToVersion:15200 usingBlock:v1];
        goto LABEL_57;
      default:
        if (v27 == (id)18000)
        {
          if ((v2 & 1) != 0) {
            goto LABEL_58;
          }
          goto LABEL_16;
        }

        if (v27 == (id)14000)
        {
          uint64_t v113 = sub_1000D6B98((uint64_t)&unk_100290E70);
          *(void *)(v113 + 16) = v3;
          sub_1001B93FC(v113, (uint64_t)sub_1001B798C);
          sub_1001B93D8((uint64_t)&unk_100290E88);
          sub_1001B93E4();
LABEL_46:
          unsigned __int8 v29 = [a1 migrateToVersion:14001 usingBlock:v1];
          goto LABEL_57;
        }

        if (v27 == (id)14001)
        {
          uint64_t v114 = sub_1000D6B98((uint64_t)&unk_100290E20);
          *(void *)(v114 + 16) = v3;
          sub_1001B93FC(v114, (uint64_t)sub_1001B796C);
          sub_1001B93D8((uint64_t)&unk_100290E38);
          sub_1001B93E4();
          unsigned __int8 v29 = [a1 migrateToVersion:15000 usingBlock:v1];
        }

        else if (v27 == (id)15200)
        {
          uint64_t v115 = sub_1000D6B98((uint64_t)&unk_100290C40);
          *(void *)(v115 + 16) = v3;
          sub_1001B93FC(v115, (uint64_t)sub_1001B7884);
          sub_1001B93D8((uint64_t)&unk_100290C58);
          sub_1001B93E4();
          unsigned __int8 v29 = [a1 migrateToVersion:15400 usingBlock:v1];
        }

        else if (v27 == (id)15400)
        {
          uint64_t v116 = sub_1000D6B98((uint64_t)&unk_100290BF0);
          *(void *)(v116 + 16) = v3;
          sub_1001B93FC(v116, (uint64_t)sub_1001B785C);
          sub_1001B93D8((uint64_t)&unk_100290C08);
          sub_1001B93E4();
          unsigned __int8 v29 = [a1 migrateToVersion:16000 usingBlock:v1];
        }

        else if (v27 == (id)16000)
        {
          uint64_t v117 = sub_1000D6B98((uint64_t)&unk_100290BA0);
          *(void *)(v117 + 16) = v3;
          sub_1001B93FC(v117, (uint64_t)sub_1001B7828);
          sub_1001B93D8((uint64_t)&unk_100290BB8);
          sub_1001B93E4();
          unsigned __int8 v29 = [a1 migrateToVersion:16400 usingBlock:v1];
        }

        else if (v27 == (id)16400)
        {
          uint64_t v118 = sub_1000D6B98((uint64_t)&unk_100290B50);
          *(void *)(v118 + 16) = v3;
          sub_1001B93FC(v118, (uint64_t)sub_1001B7808);
          sub_1001B93D8((uint64_t)&unk_100290B68);
          sub_1001B93E4();
          unsigned __int8 v29 = [a1 migrateToVersion:17200 usingBlock:v1];
        }

        else
        {
          if (v27 != (id)17200)
          {
            if (v27)
            {
              if (qword_1002A8D90 != -1) {
                swift_once(&qword_1002A8D90, sub_100183E34);
              }
              uint64_t v129 = type metadata accessor for Logger(0LL);
              sub_100018F68(v129, (uint64_t)qword_1002EB9D0);
              id v73 = a1;
              v76 = (os_log_s *)Logger.logObject.getter(v73);
              os_log_type_t v131 = static os_log_type_t.error.getter(v76, v130);
              if (sub_100160870(v131))
              {
                uint64_t v132 = sub_100019464(22LL);
                *(_DWORD *)uint64_t v132 = 134218240;
                uint64_t v166 = (uint64_t)sub_1001A41E0(v132, v25[279]);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v166, &v167, v132 + 4);

                *(_WORD *)(v132 + 12) = 2048;
                uint64_t v166 = 18000LL;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v166, &v167, v132 + 14);
                _os_log_impl( (void *)&_mh_execute_header,  v76,  (os_log_type_t)v1,  "Error: No database migration for %lld to %lld",  (uint8_t *)v132,  0x16u);
                uint64_t v127 = v132;
                goto LABEL_63;
              }

void sub_1001B41D8(void *a1)
{
  if (qword_1002A8DD8 != -1) {
    swift_once(&qword_1002A8DD8, sub_1001B27D8);
  }
  id v2 = String._bridgeToObjectiveC()();
  [a1 executeStatement:v2];
}

uint64_t sub_1001B4250(void *a1)
{
  id v110 = [a1 connection];
  uint64_t v132 = _swiftEmptyArrayStorage;
  char v131 = 0;
  _StringGuts.grow(_:)(16LL);
  swift_bridgeObjectRelease();
  sub_1001B97EC();
  id v2 = (void *)sub_1000B8300();
  sub_1001B94E4((uint64_t)[v2 databaseTable]);
  sub_1001B9534();
  sub_1001B94D8();
  sub_100023EEC();
  NSString v3 = String._bridgeToObjectiveC()();
  sub_10001A3F8();
  uint64_t v4 = sub_100019310((uint64_t)&unk_100290EE8, 32LL);
  *(void *)(v4 + 16) = &v131;
  *(void *)(v4 + 24) = &v132;
  uint64_t v5 = sub_100019310((uint64_t)&unk_100290F10, 32LL);
  *(void *)(v5 + 16) = sub_1001B79AC;
  *(void *)(v5 + 24) = v4;
  uint64_t v129 = sub_1000413B8;
  uint64_t v130 = v5;
  *(void *)&__int128 aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  *(void *)&__int128 v128 = sub_1001B220C;
  *((void *)&v128 + 1) = &unk_100290F28;
  uint64_t v6 = (char **)_Block_copy(&aBlock);
  sub_100041B5C();
  sub_10002A524();
  [a1 executeOptionalQuery:v3 withResults:v6];

  sub_100160804();
  LOBYTE(v3) = sub_1001A42B8(v5, (uint64_t)"", 115LL, 230LL, 93LL);
  sub_10002A51C();
  if ((v3 & 1) != 0)
  {
    __break(1u);
LABEL_56:
    swift_once(&qword_1002A8DD8, sub_1001B27D8);
    goto LABEL_4;
  }

  if ((v131 & 1) != 0)
  {
LABEL_53:

    goto LABEL_54;
  }

  sub_1001B9868();
  *(void *)&__int128 aBlock = v7;
  *((void *)&aBlock + 1) = v8;
  sub_1001B94E4((uint64_t)[v2 databaseTable]);
  sub_1001B9534();
  sub_1001B94D8();
  sub_100023EEC();
  NSString v9 = sub_1001B9540();
  sub_10001EDA0();
  uint64_t v6 = &selRef_endTransporationAndRemoveDatabase;
  [a1 executeStatement:v9];

  if (qword_1002A8DD8 != -1) {
    goto LABEL_56;
  }
LABEL_4:
  NSString v10 = String._bridgeToObjectiveC()();
  sub_1001B9A1C(a1, v6[153]);

  uint64_t v11 = v132;
  uint64_t v12 = v110;
  uint64_t v123 = v132[2];
  if (!v123) {
    goto LABEL_53;
  }
  uint64_t v107 = v4;
  sub_10001ED74();
  uint64_t v13 = 0LL;
  uint64_t v118 = 0LL;
  uint64_t v116 = (char *)&type metadata for Any + 8;
  uint64_t v122 = "subscription_period";
  uint64_t v114 = "up_id";
  uint64_t v108 = 0x8000000100217610LL;
  uint64_t v120 = 0x800000010021DB30LL;
  uint64_t v121 = 0x800000010021DB50LL;
  uint64_t v115 = "ion_date";
  uint64_t v119 = 0x8000000100217560LL;
  __int128 v113 = xmmword_1001F3C00;
  uint64_t v112 = (uint64_t)"NonRenewingSubscription";
  os_log_type_t v111 = (void *)0x8000000100216A10LL;
  uint64_t v117 = (uint64_t)v11;
  do
  {
    uint64_t v126 = v11[v13 + 4];
    *((void *)&v128 + 1) = &type metadata for Bool;
    LOBYTE(aBlock) = 0;
    swift_bridgeObjectRetain();
    sub_1001B9664();
    sub_1001B9614(1701869940LL, 0xE400000000000000LL, &aBlock);
    if (*((void *)&v128 + 1))
    {
      if ((sub_10003556C( (uint64_t)&v125,  (uint64_t)&aBlock,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for String) & 1) != 0)
      {
        if (v125._countAndFlagsBits == 0xD000000000000015LL && v125._object == v111)
        {
          swift_bridgeObjectRelease();
        }

        else
        {
          char v85 = _stringCompareWithSmolCheck(_:_:expecting:)( v125._countAndFlagsBits,  v125._object,  0xD000000000000015LL,  v112 | 0x8000000000000000LL,  0LL);
          sub_100023EEC();
          if ((v85 & 1) == 0)
          {
            uint64_t v86 = sub_1001B98A0();
            sub_1001B9614(v86, v87, v88);
            uint64_t v89 = *((void *)&v128 + 1);
            sub_1001B93F0();
            if (v89)
            {
              *((void *)&v128 + 1) = &type metadata for Bool;
              LOBYTE(aBlock) = 1;
              sub_1001B9664();
            }
          }
        }
      }
    }

    else
    {
      sub_1001B93F0();
    }

    sub_1001B9614(0x666F5F6F6D6F7270LL, 0xEB00000000726566LL, &aBlock);
    if (*((void *)&v128 + 1))
    {
      uint64_t v22 = sub_1001B9838( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v107,  v108,  (uint64_t)v109,  (uint64_t)v110,  (uint64_t)v111,  v112,  v113,  *((uint64_t *)&v113 + 1),  (uint64_t)v114,  (uint64_t)v115,  (uint64_t)v116,  v117,  v118,  v119,  v120,  v121,  (uint64_t)v122,  v123,  v124,  v125._countAndFlagsBits);
      if ((sub_10003556C((uint64_t)v22, v23, v24, (uint64_t)&type metadata for Data) & 1) != 0)
      {
        Swift::String v25 = v2;
        uint64_t countAndFlagsBits = v125._countAndFlagsBits;
        object = v125._object;
        uint64_t v28 = type metadata accessor for JSONDecoder(0LL);
        swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
        JSONDecoder.init()();
        uint64_t v29 = _s10AdHocOfferCMa();
        sub_100046F3C(&qword_1002A9D08, (uint64_t (*)(uint64_t))_s10AdHocOfferCMa, "Y[\b");
        dispatch thunk of JSONDecoder.decode<A>(_:from:)(v29, countAndFlagsBits, object, v29);
        if (v118)
        {
          sub_100042958();
          swift_errorRelease(v118);
          sub_100024F0C();
          uint64_t v118 = 0LL;
        }

        else
        {
          sub_100024F0C();
          uint64_t v90 = aBlock;
          sub_1001B9510();
          uint64_t v118 = 0LL;
          if (*((void *)&v128 + 1))
          {
            os_log_type_t v99 = sub_1001B9838( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v107,  v108,  (uint64_t)v109,  (uint64_t)v110,  (uint64_t)v111,  v112,  v113,  *((uint64_t *)&v113 + 1),  (uint64_t)v114,  (uint64_t)v115,  (uint64_t)v116,  v117,  0LL,  v119,  v120,  v121,  (uint64_t)v122,  v123,  v124,  v125._countAndFlagsBits);
            if ((sub_10003556C((uint64_t)v99, v100, v101, (uint64_t)&type metadata for String) & 1) != 0)
            {
              uint64_t v102 = v125._countAndFlagsBits;
              uint64_t v109 = v125._object;
              uint64_t v104 = *(void *)(v90 + 96);
              uint64_t v103 = *(void *)(v90 + 104);
              *((void *)&v128 + 1) = &unk_10027FB38;
              uint64_t v105 = sub_100019310((uint64_t)&unk_100290F60, 49LL);
              *(void *)&__int128 aBlock = v105;
              *(void *)(v105 + 16) = v102;
              uint64_t v12 = v110;
              *(void *)(v105 + 24) = v109;
              *(void *)(v105 + 32) = v104;
              *(void *)(v105 + 40) = v103;
              *(_BYTE *)(v105 + 48) = 1;
              swift_bridgeObjectRetain();
              sub_1001B9778();
              sub_100042958();
              sub_10009B770();
              id v2 = v25;
              uint64_t v11 = (void *)v117;
              goto LABEL_23;
            }

            sub_100042958();
            sub_10009B770();
          }

          else
          {
            sub_100042958();
            sub_10009B770();
            sub_1001B93F0();
          }
        }

        id v2 = v25;
        uint64_t v11 = (void *)v117;
      }
    }

    else
    {
      sub_1001B93F0();
    }

    sub_1001B9614(0x666F5F6F72746E69LL, 0xEB00000000726566LL, &aBlock);
    uint64_t v30 = *((void *)&v128 + 1);
    sub_1001B93F0();
    if (v30)
    {
      sub_1001B9510();
      if (*((void *)&v128 + 1))
      {
        if ((sub_10003556C((uint64_t)&v125, (uint64_t)&aBlock, (uint64_t)v116, (uint64_t)&type metadata for String) & 1) != 0)
        {
          *(void *)&__int128 aBlock = 0x3A6F72746E69LL;
          *((void *)&aBlock + 1) = 0xE600000000000000LL;
          String.append(_:)(v125);
          sub_100023EEC();
          *((void *)&v128 + 1) = &type metadata for String;
          sub_1001B9778();
        }
      }

      else
      {
        sub_1001B93F0();
      }
    }

#error "1001B4C90: call analysis failed (funcsize=63)"
void sub_1001B4D90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSString v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  sub_1001B97D0();
  sub_1001B968C(v0, v1, v2, v3, v4, v5, v6, v7, v36, (uint64_t)v40, 0LL, 0xE000000000000000LL);
  uint64_t v8 = [(id)sub_1001B9470() databaseTable];
  sub_1001B94E4((uint64_t)v8);
  sub_1001B95F4();
  sub_1001B940C(v9, v10, v11, v12, v13, v14, v15, v16, v37, (uint64_t)v41, v45);
  sub_10003561C();
  sub_1001B936C();
  sub_100156710(20LL, 0x8000000100217630LL);
  sub_1001B94BC();
  uint64_t v17 = sub_1001B93CC();
  uint64_t v18 = sub_10001EDA0();
  sub_1001B9640(v18, "executeStatement:");

  _StringGuts.grow(_:)(52LL);
  sub_1001B943C();
  uint64_t v20 = sub_1001A41E0(v19, "databaseTable");
  sub_1001B94E4((uint64_t)v20);
  sub_1001B9534();
  sub_1000ABF3C(v21, v22, v23, v24, v25, v26, v27, v28, v38, (uint64_t)v42, 0);
  sub_100023EEC();
  sub_1001B936C();
  sub_1001B94B4(0x6470755F7473616CLL, 1684370529LL);
  sub_10011D030(0xD000000000000018LL, (uint64_t)" REAL DEFAULT 0 NOT NULL");
  uint64_t v43 = sub_1001B93CC();
  uint64_t v29 = sub_10001EDA0();
  sub_1001B9580(v29, "executeStatement:", v30, v31, v32, v33, v34, v35, v39, (uint64_t)v43);
}

void sub_1001B4ED0()
{
  id v0 = [(id)sub_1000B8300() databaseTable];
  sub_1001B94E4((uint64_t)v0);
  sub_1001B9534();
  sub_1000ABF3C(v1, v2, v3, v4, v5, v6, v7, v8, v17, v19, v22);
  sub_100023EEC();
  sub_1001B936C();
  sub_1001B96FC();
  sub_1001B9858();
  sub_100156710(27LL, v9);
  NSString v20 = sub_1001B93CC();
  int v10 = sub_10001EDA0();
  sub_1001B9580(v10, "executeStatement:", v11, v12, v13, v14, v15, v16, v18, (uint64_t)v20);
  sub_1001B9468(v21);
}

void sub_1001B4F68(uint64_t a1)
{
}

void sub_1001B4F80()
{
  id v0 = [(id)sub_1000B8300() databaseTable];
  sub_1001B94E4((uint64_t)v0);
  sub_1001B9534();
  sub_1000ABF3C(v1, v2, v3, v4, v5, v6, v7, v8, v16, v18, v21);
  sub_100023EEC();
  sub_1001B936C();
  sub_100156710(21LL, 0x8000000100217680LL);
  sub_10011D030(0xD00000000000001ELL, (uint64_t)" STRING DEFAULT '1.0' NOT NULL");
  NSString v19 = sub_1001B93CC();
  int v9 = sub_10001EDA0();
  sub_1001B9580(v9, "executeStatement:", v10, v11, v12, v13, v14, v15, v17, (uint64_t)v19);
  sub_1001B9468(v20);
}

void sub_1001B5034(uint64_t a1)
{
}

#error "1001B5074: call analysis failed (funcsize=146)"
uint64_t sub_1001B52F4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v6;
  Swift::String v7;
  NSString v8;
  uint64_t v9;
  id v10;
  Swift::String v11;
  NSString v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t result;
  void v18[6];
  int v4 = v1;
  _StringGuts.grow(_:)(33LL);
  swift_bridgeObjectRelease();
  strcpy((char *)v18, "ALTER TABLE ");
  BYTE5(v18[1]) = 0;
  HIWORD(v18[1]) = -5120;
  int v6 = (void *)sub_1000B8300();
  sub_1001B94E4((uint64_t)objc_msgSend(v6, "databaseTable", v18[0], v18[1]));
  sub_1001B9AE4();
  v7._uint64_t countAndFlagsBits = v2;
  v7._object = v3;
  String.append(_:)(v7);
  sub_10001A420();
  sub_1001B94B4(0x4C4F432044444120LL, 542002517LL);
  sub_100156710(30LL, 0x8000000100217760LL);
  sub_1001B958C();
  int v8 = sub_1001B9540();
  sub_10001EDA0();
  [a1 executeStatement:v8];

  _StringGuts.grow(_:)(16LL);
  swift_bridgeObjectRelease();
  sub_1001B97EC();
  int v10 = sub_1001B9A30(v9, "databaseTable");
  sub_1001B94E4((uint64_t)v10);
  sub_1001B95F4();
  v11._uint64_t countAndFlagsBits = (uint64_t)v6;
  v11._object = v8;
  String.append(_:)(v11);
  sub_10003561C();
  int v12 = sub_1001B9540();
  sub_10001EDA0();
  int v13 = sub_100019310((uint64_t)&unk_100291000, 32LL);
  *(void *)(v13 + 16) = v4;
  *(void *)(v13 + 24) = a1;
  int v14 = sub_100019310((uint64_t)&unk_100291028, 32LL);
  *(void *)(v14 + 16) = sub_1001B8F50;
  *(void *)(v14 + 24) = v13;
  v18[4] = sub_10010D7D4;
  v18[5] = v14;
  int v15 = sub_1001B98CC((uint64_t)sub_1001B220C, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v18[2], v18[3]);
  uint64_t v16 = a1;
  sub_100041B5C();
  swift_release();
  [v16 executeOptionalQuery:v12 withResults:v15];

  _Block_release(v15);
  LOBYTE(v16) = sub_1001A42B8(v14, (uint64_t)"", 115LL, 358LL, 82LL);
  sub_100024F0C();
  uint64_t result = sub_10002A51C();
  return result;
}

void sub_1001B5550(uint64_t a1)
{
}

void sub_1001B5568(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = [(id)sub_1001B9470() databaseTable];
  sub_1001B94E4((uint64_t)v13);
  sub_1001B9AE4();
  sub_1001B9694(v14, v15, v16, v17, v18, v19, v20, v21, v31, (uint64_t)v34, v38);
  sub_10001A420();
  sub_1001B936C();
  v22._uint64_t countAndFlagsBits = a2;
  v22._object = a3;
  String.append(_:)(v22);
  sub_1001B95C4();
  id v35 = sub_1001B93CC();
  int v23 = sub_10001EDA0();
  sub_1001B9580(v23, "executeStatement:", v24, v25, v26, v27, v28, v29, v32, (uint64_t)v35);
}

void sub_1001B5610()
{
  id v8 = [(id)sub_1001B9470() databaseTable];
  sub_1001B94E4((uint64_t)v8);
  sub_1001B9534();
  sub_1000ABF3C(v9, v10, v11, v12, v13, v14, v15, v16, v26, v29, v33);
  sub_100023EEC();
  sub_1001B936C();
  sub_1001B9858();
  sub_100156710(18LL, v17);
  sub_1001B94BC();
  NSString v30 = sub_1001B93CC();
  int v18 = sub_10001EDA0();
  sub_1001B9580(v18, "executeStatement:", v19, v20, v21, v22, v23, v24, v27, (uint64_t)v30);
  sub_1001B9468(v31);
}

#error "1001B5710: call analysis failed (funcsize=293)"
void sub_1001B5CF8()
{
  char v0;
  id v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  id v21;
  char v22;
  sub_1001B9868();
  int v22 = v0;
  uint64_t v1 = [(id)sub_1000B8300() databaseTable];
  sub_1001B94E4((uint64_t)v1);
  sub_1001B9534();
  sub_1000ABF3C(v2, v3, v4, v5, v6, v7, v8, v9, v17, v19, v22);
  sub_100023EEC();
  int v20 = sub_1001B93CC();
  int v10 = sub_10001EDA0();
  sub_1001B9580(v10, "executeStatement:", v11, v12, v13, v14, v15, v16, v18, (uint64_t)v20);
  sub_1001B9468(v21);
}

void sub_1001B5DA8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    if (!a1) {
      goto LABEL_10;
    }
    a3 = swift_allocObject(&unk_100290F88, 24LL, 7LL);
    *(void *)(a3 + 16) = a4;
    uint64_t v17 = swift_allocObject(&unk_100290FB0, 32LL, 7LL);
    *(void *)(v17 + 16) = sub_1001B8F20;
    *(void *)(v17 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1000413B8;
    aBlock[5] = v17;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_1001B2190;
    aBlock[3] = (uint64_t)&unk_100290FC8;
    int v18 = _Block_copy(aBlock);
    id v8 = a1;
    swift_retain();
    swift_release();
    [v8 enumerateRowsUsingBlock:v18];

    _Block_release(v18);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v17, "", 115LL, 238LL, 35LL, 1LL);
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return;
    }
    __break(1u);
LABEL_9:
    swift_errorRelease(isEscapingClosureAtFileLocation);
    swift_errorRelease(isEscapingClosureAtFileLocation);
    swift_errorRelease(isEscapingClosureAtFileLocation);

    goto LABEL_10;
  }

  uint64_t isEscapingClosureAtFileLocation = a2;
  swift_errorRetain(a2);
  if (qword_1002A8D90 != -1) {
    swift_once(&qword_1002A8D90, sub_100183E34);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_100018F68(v6, (uint64_t)qword_1002EB9D0);
  swift_errorRetain(isEscapingClosureAtFileLocation);
  uint64_t v7 = swift_errorRetain(isEscapingClosureAtFileLocation);
  id v8 = (id)Logger.logObject.getter(v7);
  os_log_type_t v10 = static os_log_type_t.error.getter(v8, v9);
  if (!os_log_type_enabled((os_log_t)v8, v10)) {
    goto LABEL_9;
  }
  int v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v12 = swift_slowAlloc(32LL, -1LL);
  aBlock[0] = v12;
  *(_DWORD *)int v11 = 136446210;
  swift_getErrorValue(isEscapingClosureAtFileLocation, v21, v20);
  uint64_t v13 = Error.localizedDescription.getter(v20[1], v20[2]);
  uint64_t v19 = sub_1000CF360(v13, v14, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, v20, v11 + 4);
  swift_bridgeObjectRelease();
  swift_errorRelease(isEscapingClosureAtFileLocation);
  swift_errorRelease(isEscapingClosureAtFileLocation);
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  v10,  "Failed to read from current table: %{public}s",  v11,  0xCu);
  swift_arrayDestroy(v12, 1LL);
  swift_slowDealloc(v12, -1LL, -1LL);
  swift_slowDealloc(v11, -1LL, -1LL);

  swift_errorRelease(isEscapingClosureAtFileLocation);
LABEL_10:
  *(_BYTE *)a3 = 1;
}

void sub_1001B609C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a1)
  {
    id v9 = a1;
    id v5 = [v9 dictionaryWithValuesForColumns];
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    sub_10002E898();
    uint64_t v7 = *(void *)(*a4 + 16);
    sub_10002EA64();
    uint64_t v8 = *a4;
    *(void *)(v8 + 16) = v7 + 1;
    *(void *)(v8 + 8 * v7 + 32) = v6;
  }

void sub_1001B6144(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_100018F68(v5, (uint64_t)qword_1002EB9D0);
    swift_errorRetain(a2);
    uint64_t v6 = swift_errorRetain(a2);
    oslog = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.error.getter(oslog, v7);
    if (os_log_type_enabled(oslog, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v10 = swift_slowAlloc(32LL, -1LL);
      uint64_t v24 = v10;
      *(_DWORD *)id v9 = 136446210;
      swift_getErrorValue(a2, v23, v22);
      uint64_t v11 = Error.localizedDescription.getter(v22[1], v22[2]);
      uint64_t v21 = sub_1000CF360(v11, v12, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 4);
      swift_bridgeObjectRelease();
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v8,  "[DatabaseStore.self migrate15400To16000(migrator:)] Failed to read from current table: %{public}s",  v9,  0xCu);
      swift_arrayDestroy(v10, 1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);

      swift_errorRelease(a2);
      return;
    }

    swift_errorRelease(a2);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  else if (a1)
  {
    id v14 = a4;
    oslog = a1;
    sub_1001B6738((uint64_t)oslog, v14);
  }

  else
  {
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_100018F68(v15, (uint64_t)qword_1002EB9D0);
    oslog = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter(oslog, v17);
    if (os_log_type_enabled(oslog, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v18,  "[DatabaseStore.self migrate15400To16000(migrator:)] No results found for SQL query desipte not encountering an explicit error",  v19,  2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }
  }
}

id sub_1001B6408(uint64_t a1, id a2, double a3)
{
  id v5 = [a2 connection];
  _StringGuts.grow(_:)(59LL);
  v6._uint64_t countAndFlagsBits = 0x20455441445055LL;
  v6._object = (void *)0xE700000000000000LL;
  String.append(_:)(v6);
  id v7 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v10 = v9;

  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._object = (void *)0x8000000100222620LL;
  v12._uint64_t countAndFlagsBits = 0xD00000000000002CLL;
  String.append(_:)(v12);
  v13._uint64_t countAndFlagsBits = 25705LL;
  v13._object = (void *)0xE200000000000000LL;
  String.append(_:)(v13);
  v14._uint64_t countAndFlagsBits = 1059077408LL;
  v14._object = (void *)0xE400000000000000LL;
  String.append(_:)(v14);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v16 = swift_allocObject(&unk_100291078, 32LL, 7LL);
  *(double *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a1;
  uint64_t v17 = (void *)swift_allocObject(&unk_1002910A0, 32LL, 7LL);
  v17[2] = sub_1001B926C;
  v17[3] = v16;
  aBlock[4] = sub_10010D7D4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1001B2264;
  aBlock[3] = &unk_1002910B8;
  os_log_type_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0LL;
  unsigned int v19 = [v5 executeStatement:v15 error:aBlock bindings:v18];
  _Block_release(v18);

  id result = aBlock[0];
  if (v19)
  {
    swift_release();
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v17, "", 115LL, 368LL, 167LL, 1LL);
    id result = (id)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
  }

  uint64_t v22 = (uint64_t)result;
  _convertNSErrorToError(_:)(result);

  swift_willThrow(v23);
  swift_release();
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation(v17, "", 115LL, 368LL, 167LL, 1LL);
  id result = (id)swift_release();
  if ((v22 & 1) != 0) {
    __break(1u);
  }
  return result;
}

id sub_1001B66EC(void *a1, uint64_t a2)
{
  id result = objc_msgSend(a1, "bindDouble:atPosition:", 1);
  if ((a2 & 0x8000000000000000LL) == 0) {
    return [a1 bindInt64:a2 atPosition:2];
  }
  __break(1u);
  return result;
}

uint64_t sub_1001B6738(uint64_t a1, void *a2)
{
  uint64_t v15 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for Double);
  Swift::String v13 = _swiftEmptyArrayStorage;
  uint64_t v14 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for Double);
  uint64_t v10 = &v14;
  Swift::String v11 = &v15;
  Swift::String v12 = &v13;
  id v7 = sub_1001B9224;
  uint64_t v8 = &v9;
  sub_1001B748C((uint64_t)sub_1001B9230, (uint64_t)v6);
  uint64_t v3 = v13[2];
  if (v3)
  {
    uint64_t v4 = (double *)(swift_bridgeObjectRetain() + 40);
    do
    {
      sub_1001B6408(*((void *)v4 - 1), a2, *v4);
      v4 += 2;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1001B6A14(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    sub_100018F68(v7, (uint64_t)qword_1002EB9D0);
    swift_errorRetain(a2);
    uint64_t v8 = swift_errorRetain(a2);
    oslog = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.error.getter(oslog, v9);
    if (os_log_type_enabled(oslog, v10))
    {
      Swift::String v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v12 = swift_slowAlloc(32LL, -1LL);
      v66[0] = v12;
      *(_DWORD *)Swift::String v11 = 136446210;
      swift_getErrorValue(a2, v63, v62);
      uint64_t v13 = Error.localizedDescription.getter(v62[1], v62[2]);
      *(double *)&uint64_t v64 = COERCE_DOUBLE(sub_1000CF360(v13, v14, v66));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v11 + 4);
      swift_bridgeObjectRelease();
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v10,  "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Error while enumerating table rows: %{public}s",  v11,  0xCu);
      swift_arrayDestroy(v12, 1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
      swift_slowDealloc(v11, -1LL, -1LL);

      swift_errorRelease(a2);
      return;
    }

    swift_errorRelease(a2);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    goto LABEL_24;
  }

  if (!a1)
  {
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_100018F68(v38, (uint64_t)qword_1002EB9D0);
    oslog = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.error.getter(oslog, v40);
    if (os_log_type_enabled(oslog, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v42 = 0;
      swift_slowDealloc(v42, -1LL, -1LL);
    }

id sub_1001B72FC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DatabaseStore();
  id v3 = objc_msgSendSuper2(&v5, "initWithDatabase:", a1);

  return v3;
}

id sub_1001B736C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DatabaseStore();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1001B73BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DatabaseStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DatabaseStore()
{
  return objc_opt_self(&OBJC_CLASS____TtC25ASOctaneSupportXPCService13DatabaseStore);
}

uint64_t sub_1001B7410()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B741C(void *a1)
{
  return sub_1001B30AC(a1, *(uint64_t (**)(void *))(v1 + 16));
}

uint64_t sub_1001B7424()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B7430()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1001B7454(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1001B7464(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1001B746C()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B7478(void *a1)
{
  return sub_1001B2F3C(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_1001B7480()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B748C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(&unk_1002910F0, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v8[4] = sub_10010D7D4;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_1001B2190;
  v8[3] = &unk_100291108;
  Swift::String v6 = _Block_copy(v8);
  swift_retain();
  [v2 enumerateRowsUsingBlock:v6];
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation(v5, "", 0LL, 0LL, 0LL, 1LL);
  uint64_t result = swift_release();
  return result;
}

uint64_t sub_1001B757C(uint64_t a1)
{
  if (a1) {
    v2.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  }
  else {
    v2.super.Class isa = 0LL;
  }
  id v3 = [v1 dictionaryWithValuesForColumnNames:v2.super.isa];

  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  return v4;
}

uint64_t sub_1001B7604(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_1001B7624()
{
  return sub_1001B7664(&qword_1002B9420);
}

uint64_t sub_1001B7630()
{
  uint64_t v1 = sub_10010E20C();
  return swift_deallocClassInstance(v1, v2, v3);
}

uint64_t sub_1001B7658()
{
  return sub_1001B7664(&qword_1002B9470);
}

uint64_t sub_1001B7664(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  sub_1000175B0(a1);
  swift_arrayDestroy(v1 + 32, v2);
  uint64_t v3 = sub_10010E20C();
  return swift_deallocClassInstance(v3, v4, v5);
}

uint64_t sub_1001B76A4()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for URL(0LL) - 8) + 80LL);
  swift_arrayDestroy(v0 + ((v1 + 32) & ~v1), *(void *)(v0 + 16));
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_1001B76E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3);
}

void sub_1001B770C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *a1;
  uint64_t v9 = *a1 + 8;
  if (v6) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8);
  *a1 = v9;
  os_log_type_t v10 = *a2;
  if (*a2)
  {
    *os_log_type_t v10 = v7;
    *a2 = v10 + 1;
  }

  else
  {
  }

uint64_t sub_1001B77BC()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B77C8()
{
}

uint64_t sub_1001B77DC()
{
  return sub_1000C0330(v0, 24LL);
}

uint64_t sub_1001B77E8()
{
  return sub_1001B56A8();
}

uint64_t sub_1001B77FC()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B7808()
{
}

uint64_t sub_1001B781C()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B7828(uint64_t a1)
{
}

uint64_t sub_1001B7850()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B785C(void *a1)
{
}

uint64_t sub_1001B7878()
{
  return sub_1000C0330(v0, 24LL);
}

uint64_t sub_1001B7884()
{
  return sub_1001B504C();
}

uint64_t sub_1001B7898()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B78A4(uint64_t a1)
{
}

uint64_t sub_1001B78CC()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B78D8()
{
}

uint64_t sub_1001B78EC()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B78F8(uint64_t a1)
{
}

uint64_t sub_1001B7920()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B792C()
{
}

uint64_t sub_1001B7940()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B794C()
{
}

uint64_t sub_1001B7960()
{
  return sub_1000C0330(v0, 24LL);
}

uint64_t sub_1001B796C()
{
  return sub_1001B4C6C();
}

uint64_t sub_1001B7980()
{
  return sub_1000C0330(v0, 24LL);
}

uint64_t sub_1001B798C(void *a1)
{
  return sub_1001B4250(a1);
}

uint64_t sub_1001B79A0()
{
  return sub_1000C0330(v0, 32LL);
}

void sub_1001B79AC(void *a1, uint64_t a2)
{
}

uint64_t sub_1001B79B4()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B79C0()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

double sub_1001B79EC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_1000F168C(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v16 = *v4;
    uint64_t v12 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    Swift::Int v13 = *(void *)(v12 + 24);
    sub_1000175B0(&qword_1002B3648);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(void *)(*(void *)(v16 + 48) + 16 * v9 + 8));
    sub_100034728((_OWORD *)(*(void *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)( v9,  v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    uint64_t v14 = *v4;
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

double sub_1001B7B10@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_1000F16E0(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v15 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    Swift::Int v11 = *(void *)(v10 + 24);
    sub_1000175B0(&qword_1002B9478);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11);
    sub_100034728((_OWORD *)(*(void *)(v15 + 56) + 32 * v7), a2);
    unint64_t v12 = sub_100092564();
    _NativeDictionary._delete(at:)( v7,  v15,  &type metadata for TransactionEntity.Key,  (char *)&type metadata for Any + 8,  v12);
    uint64_t v13 = *v3;
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

#error "1001B7C7C: call analysis failed (funcsize=48)"
#error "1001B7D1C: call analysis failed (funcsize=41)"
uint64_t sub_1001B7D94(uint64_t a1, uint64_t a2)
{
  return sub_1001B7DBC( a1,  a2,  &qword_1002B9438,  (uint64_t (*)(void))type metadata accessor for OctaneConfigurationOverrides);
}

uint64_t sub_1001B7DA8(uint64_t a1, uint64_t a2)
{
  return sub_1001B7DBC( a1,  a2,  (uint64_t *)&unk_1002B9440,  (uint64_t (*)(void))type metadata accessor for OctaneConfiguration);
}

uint64_t sub_1001B7DBC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  char v8 = (uint64_t *)v4;
  sub_1001B9A60();
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_1000F168C(v5, v4);
  char v11 = v10;
  sub_10001A420();
  if ((v11 & 1) == 0) {
    return 0LL;
  }
  char v12 = sub_1001B99DC();
  uint64_t v18 = *v8;
  uint64_t v13 = *v8;
  *char v8 = 0x8000000000000000LL;
  Swift::Int v14 = *(void *)(v13 + 24);
  sub_1000175B0(a3);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(v12, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(*(void *)(v18 + 56) + 8 * v9);
  uint64_t v16 = a4(0LL);
  _NativeDictionary._delete(at:)(v9, v18, &type metadata for String, v16, &protocol witness table for String);
  sub_1001B9914();
  return v15;
}

double sub_1001B7EBC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  swift_bridgeObjectRetain(*v2);
  unint64_t v7 = sub_1000F1760(a1);
  char v9 = v8;
  swift_bridgeObjectRelease(v6);
  if ((v9 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v17 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_1000175B0(&qword_1002B9458);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    sub_10005A704(*(void *)(*(void *)(v17 + 48) + 16 * v7), *(void *)(*(void *)(v17 + 48) + 16 * v7 + 8));
    sub_10002A118((__int128 *)(*(void *)(v17 + 56) + 40 * v7), a2);
    uint64_t v13 = sub_1000175B0(&qword_1002B9420);
    unint64_t v14 = sub_100124984();
    _NativeDictionary._delete(at:)(v7, v17, &type metadata for HTTPMethod, v13, v14);
    uint64_t v15 = *v3;
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease(v15);
  }

  else
  {
    *(void *)(a2 + 32) = 0LL;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return result;
}

#error "1001B8018: call analysis failed (funcsize=13)"
uint64_t sub_1001B8024(_OWORD *a1, uint64_t a2)
{
  void *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  char v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  sub_1001B848C(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *uint64_t v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

#error "1001B80DC: call analysis failed (funcsize=22)"
uint64_t sub_1001B80E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  sub_1001B9A60();
  uint64_t v6 = sub_1001B99DC();
  uint64_t v17 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  unint64_t v7 = sub_1001B8680(v4, (unint64_t)v3 & 0xFFFFFFFF0000FFFFLL, a3, v6);
  sub_1001B9820(v7, v8, v9, v10, v11, v12, v13, v14, v16, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1001B814C()
{
  return sub_1001B8164();
}

uint64_t sub_1001B8158()
{
  return sub_1001B8164();
}

uint64_t sub_1001B8164()
{
  uint64_t v4 = v3;
  uint64_t v5 = sub_1001B97DC();
  uint64_t v8 = *v0;
  *uint64_t v0 = 0x8000000000000000LL;
  v4(v2, v1, v5);
  uint64_t v6 = *v0;
  *uint64_t v0 = v8;
  return sub_1001B941C(v6);
}

#error "1001B81E4: call analysis failed (funcsize=13)"
uint64_t sub_1001B81F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001B8240(a1, a2, a3, (uint64_t)&qword_1002B9438, sub_1001B8A98);
}

uint64_t sub_1001B8204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001B8240(a1, a2, a3, (uint64_t)&unk_1002B9440, sub_1001B8A98);
}

uint64_t sub_1001B8218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001B8240(a1, a2, a3, (uint64_t)&unk_1002B9490, sub_1001B8C1C);
}

uint64_t sub_1001B822C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001B8240(a1, a2, a3, (uint64_t)&unk_1002B9468, sub_1001B8A98);
}

uint64_t sub_1001B8240( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = *v5;
  *uint64_t v5 = v12;
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_1001B82C0(__int128 *a1, uint64_t a2, unint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_1001B8CA4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1001B833C(uint64_t a1, uint64_t a2, double a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_1001B8DC8(a1, a2, isUniquelyReferenced_nonNull_native, a3);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_1001B83B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v9)
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v10 = v7;
  char v11 = v8;
  sub_1000175B0(&qword_1002B3648);
  if (!sub_1001B96A4()) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_1001B9810();
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v10 = v12;
LABEL_5:
  uint64_t v14 = *v6;
  if ((v11 & 1) != 0)
  {
    uint64_t v15 = (void *)(*(void *)(v14 + 56) + 32 * v10);
    sub_100019F7C(v15);
    return sub_100034728(v3, v15);
  }

  else
  {
    sub_1001B8ED8(v10, v5, v4, (uint64_t)v3, v14);
    return (_OWORD *)swift_bridgeObjectRetain(v4);
  }

_OWORD *sub_1001B848C(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_1000F16E0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_1000175B0(&qword_1002B9478);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_1000F16E0(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for TransactionEntity.Key);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if ((v15 & 1) == 0) {
    return sub_1001B8F64(v14, a2, a1, v18);
  }
  uint64_t v19 = (void *)(v18[7] + 32 * v14);
  sub_100019F7C(v19);
  return sub_100034728(a1, v19);
}

void sub_1001B8590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  Swift::Int v12 = *v5;
  sub_1000F168C(a3, a4);
  sub_1001B9600();
  if (v15)
  {
    __break(1u);
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  unint64_t v16 = v13;
  char v17 = v14;
  sub_1000175B0(&qword_1002AA9A0);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(a5 & 1, v12))
  {
    sub_1000F168C(a3, a4);
    sub_1001B9A0C();
    if (!v19) {
      goto LABEL_10;
    }
    unint64_t v16 = v18;
  }

  uint64_t v20 = (void *)*v6;
  if ((v17 & 1) != 0)
  {
    uint64_t v21 = (uint64_t *)(v20[7] + 16 * v16);
    swift_bridgeObjectRelease();
    uint64_t *v21 = a1;
    v21[1] = a2;
    sub_10002A580();
  }

  else
  {
    sub_1001B8FC8(v16, a3, a4, a1, a2, v20);
    sub_1001B9548(a4);
  }

unint64_t sub_1001B8680(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_1000F1730(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_1000175B0(&qword_1002B6E58);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000F1730(a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if ((v17 & 1) == 0) {
    return sub_1001B9014(v16, a3, a1, a2 & 0xFFFFFFFF0000FFFFLL, v20);
  }
  uint64_t v21 = v20[7] + 16 * v16;
  unint64_t result = j__swift_release(*(void *)v21);
  *(void *)uint64_t v21 = a1;
  *(_WORD *)(v21 + 8) = a2;
  *(_DWORD *)(v21 + 12) = HIDWORD(a2);
  return result;
}

unint64_t sub_1001B87A0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  uint64_t v9 = sub_1000F1818(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_1000175B0((uint64_t *)&unk_1002B94B0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  uint64_t v16 = sub_1000F1818(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    type metadata accessor for ASDOctaneEventType(0LL);
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v21);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  unint64_t v18 = *v4;
  if ((v15 & 1) == 0) {
    return sub_1001B9070(v14, a2, a1, v18);
  }
  uint64_t v19 = v18[7];
  unint64_t result = swift_bridgeObjectRelease();
  *(void *)(v19 + 8 * v14) = a1;
  return result;
}

unint64_t sub_1001B889C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  uint64_t v9 = sub_1000F1818(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_1000175B0(&qword_1002AB3E8);
  unint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t result = sub_1000F1818(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    type metadata accessor for ASDOctaneValueIdentifier(0LL);
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v19);
    __break(1u);
    return result;
  }

  unint64_t v14 = result;
LABEL_5:
  unint64_t v18 = *v4;
  if ((v15 & 1) == 0) {
    return sub_1001B9070(v14, a2, a1, v18);
  }
  *(void *)(v18[7] + 8 * v14) = a1;
  return result;
}

unint64_t sub_1001B8990(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  uint64_t v11 = sub_1000F1818(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_1000175B0(&qword_1002B9498);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  uint64_t v18 = sub_1000F1818(a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    type metadata accessor for ASDOctaneValueIdentifier(0LL);
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v23);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if ((v17 & 1) == 0) {
    return sub_1001B90B4(v16, a3, a1, a2, v20);
  }
  uint64_t v21 = (uint64_t *)(v20[7] + 16 * v16);
  unint64_t result = swift_bridgeObjectRelease();
  uint64_t *v21 = a1;
  v21[1] = a2;
  return result;
}

void sub_1001B8A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v7)
  {
    __break(1u);
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  sub_1001B99FC();
  BOOL v8 = sub_1001B96A4();
  if (v8)
  {
    sub_1001B9810();
    sub_1001B9A0C();
    if (!v12) {
      goto LABEL_10;
    }
    BOOL v5 = v8;
  }

  uint64_t v13 = *v4;
  if ((v6 & 1) != 0)
  {
    uint64_t v14 = *(void *)(v13 + 56);
    swift_release(*(void *)(v14 + 8 * v5));
    *(void *)(v14 + 8 * v5) = v3;
    sub_10002A580();
  }

  else
  {
    uint64_t v15 = sub_1001B9A9C(v8, v9, v10, v11, v13);
    sub_1001B9548(v15);
  }

unint64_t sub_1001B8B20(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v8 = *v3;
  sub_1000F16E0(a2);
  sub_1001B9600();
  if (v11)
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v12 = v9;
  char v13 = v10;
  sub_1000175B0(&qword_1002B9488);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v8)) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_1000F16E0(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for TransactionEntity.Key);
    __break(1u);
    return result;
  }

  unint64_t v12 = v14;
LABEL_5:
  unint64_t v16 = (void *)*v4;
  if ((v13 & 1) == 0) {
    return sub_1001B90FC(v12, a2, a1, v16);
  }
  uint64_t v17 = v16[7];
  unint64_t result = swift_bridgeObjectRelease(*(void *)(v17 + 8 * v12));
  *(void *)(v17 + 8 * v12) = a1;
  return result;
}

void sub_1001B8C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1001B8C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v7)
  {
    __break(1u);
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  sub_1001B99FC();
  BOOL v8 = sub_1001B96A4();
  if (v8)
  {
    sub_1001B9810();
    sub_1001B9A0C();
    if (!v12) {
      goto LABEL_10;
    }
    BOOL v5 = v8;
  }

  uint64_t v13 = *v4;
  if ((v6 & 1) != 0)
  {
    uint64_t v14 = *(void *)(v13 + 56);

    *(void *)(v14 + 8 * v5) = v3;
    sub_10002A580();
  }

  else
  {
    uint64_t v15 = sub_1001B9A9C(v8, v9, v10, v11, v13);
    sub_1001B9548(v15);
  }

uint64_t sub_1001B8CA4(__int128 *a1, uint64_t a2, unint64_t a3, char a4)
{
  BOOL v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000F1760(a2);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_1000175B0(&qword_1002B9458);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000F1760(a2);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for HTTPMethod);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if ((v17 & 1) != 0)
  {
    uint64_t v21 = (void *)(v20[7] + 40 * v16);
    sub_100019F7C(v21);
    return sub_10002A118(a1, (uint64_t)v21);
  }

  else
  {
    sub_1001B9168(v16, a2, a3, a1, v20);
    return sub_10005A6F0(a2, a3);
  }

uint64_t sub_1001B8DC8(uint64_t a1, uint64_t a2, char a3, double a4)
{
  BOOL v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000F168C(a1, a2);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_1000175B0((uint64_t *)&unk_1002B9410);
  uint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_1000F168C(a1, a2);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = result;
LABEL_5:
  uint64_t v20 = *v5;
  if ((v17 & 1) != 0)
  {
    *(double *)(v20[7] + 8 * v16) = a4;
  }

  else
  {
    sub_1001B91D4(v16, a1, a2, v20, a4);
    return swift_bridgeObjectRetain();
  }

  return result;
}

void sub_1001B8ED8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = sub_1001B9798(a1, a2, a3, a4, a5);
  sub_100034728(v8, (_OWORD *)(v7 + 32 * v6));
  uint64_t v9 = *(void *)(a5 + 16);
  BOOL v10 = __OFADD__(v9, 1LL);
  uint64_t v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a5 + 16) = v11;
    sub_10001945C();
  }

uint64_t sub_1001B8F14()
{
  return sub_1000C0330(v0, 24LL);
}

void sub_1001B8F20(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1001B8F28()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B8F34()
{
  uint64_t v1 = sub_10010E20C();
  return swift_deallocObject(v1, v2, v3);
}

void sub_1001B8F50(void *a1, uint64_t a2)
{
}

uint64_t sub_1001B8F58()
{
  return sub_1000C0330(v0, 32LL);
}

_OWORD *sub_1001B8F64(unint64_t a1, char a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  uint64_t result = sub_100034728(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_1001B8FC8( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1LL << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  *BOOL v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_1001B9014(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = a5[7] + 16 * result;
  *(void *)uint64_t v5 = a3;
  *(_WORD *)(v5 + 8) = a4;
  *(_DWORD *)(v5 + 12) = HIDWORD(a4);
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_1001B9070(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1LL);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_1001B90B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  *(void *)(a5[6] + 8 * result) = a2;
  BOOL v5 = (void *)(a5[7] + 16 * result);
  *BOOL v5 = a3;
  v5[1] = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_1001B90FC(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  *(_BYTE *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1LL);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_1001B9140(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = sub_1001B9798(a1, a2, a3, a4, a5);
  *(void *)(v8 + 8 * result) = v7;
  uint64_t v9 = *(void *)(v6 + 16);
  BOOL v10 = __OFADD__(v9, 1LL);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    *(void *)(v6 + 16) = v11;
  }
  return result;
}

uint64_t sub_1001B9168(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10002A118(a4, a5[7] + 40 * a1);
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

unint64_t sub_1001B91D4(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  BOOL v5 = (void *)(a4[6] + 16 * result);
  *BOOL v5 = a2;
  v5[1] = a3;
  *(double *)(a4[7] + 8 * result) = a5;
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void sub_1001B921C(void **a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
}

void sub_1001B9224(void **a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1001B9230(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1001B9260()
{
  return sub_1000C0330(v0, 32LL);
}

id sub_1001B926C(void *a1)
{
  return sub_1001B66EC(a1, *(void *)(v1 + 24));
}

uint64_t sub_1001B9278()
{
  return sub_1000C0330(v0, 32LL);
}

uint64_t sub_1001B9284()
{
  return sub_1000C0330(v0, 32LL);
}

unint64_t sub_1001B9290()
{
  unint64_t result = qword_1002B9428;
  if (!qword_1002B9428)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SQLiteConnectionOptions);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1002B9428);
  }

  return result;
}

void sub_1001B936C()
{
  v0._uint64_t countAndFlagsBits = 0x4C4F432044444120LL;
  v0._object = (void *)0xEC000000204E4D55LL;
  String.append(_:)(v0);
}

void sub_1001B9390()
{
  v0._uint64_t countAndFlagsBits = 0x52454745544E4920LL;
  v0._object = (void *)0xEA00000000000A2CLL;
  String.append(_:)(v0);
}

void sub_1001B93B0()
{
  v0._uint64_t countAndFlagsBits = 0xA2C4C41455220LL;
  v0._object = (void *)0xE700000000000000LL;
  String.append(_:)(v0);
}

NSString sub_1001B93CC()
{
  return String._bridgeToObjectiveC()();
}

void *sub_1001B93D8@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 144) = v1;
  *(void *)(v2 - 136) = a1;
  return _Block_copy((const void *)(v2 - 160));
}

uint64_t sub_1001B93E4()
{
  return swift_release(*(void *)(v0 - 120));
}

void sub_1001B93F0()
{
}

uint64_t sub_1001B93FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 128) = a2;
  *(void *)(v3 - 120) = result;
  *(void *)(v3 - 160) = v2;
  *(void *)(v3 - 152) = v4;
  return result;
}

void sub_1001B940C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  v13._uint64_t countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
}

uint64_t sub_1001B941C(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

void sub_1001B9430(uint64_t a1)
{
  v1._uint64_t countAndFlagsBits = a1 & 0xFFFFFFFFFFFFLL | 0xA000000000000LL;
  v1._object = (void *)0xE700000000000000LL;
  String.append(_:)(v1);
}

void sub_1001B943C()
{
  v0._uint64_t countAndFlagsBits = 0x4154205245544C41LL;
  v0._object = (void *)0xEC00000020454C42LL;
  String.append(_:)(v0);
}

void sub_1001B9468(id a1)
{
}

uint64_t sub_1001B9470()
{
  return type metadata accessor for TransactionEntity();
}

void sub_1001B9498(id a1)
{
}

void sub_1001B94B4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

void sub_1001B94BC()
{
  v0._uint64_t countAndFlagsBits = 0x474E4952545320LL;
  v0._object = (void *)0xE700000000000000LL;
  String.append(_:)(v0);
}

void sub_1001B94D8()
{
  v2._uint64_t countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

uint64_t sub_1001B94E4(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

unint64_t sub_1001B94EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000F168C(a2, a3);
}

void sub_1001B9510()
{
}

void sub_1001B9534()
{
}

NSString sub_1001B9540()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1001B9548(uint64_t a1)
{
  return swift_bridgeObjectRetain(a1);
}

void sub_1001B9560()
{
  v0._uint64_t countAndFlagsBits = 0x2C474E4952545320LL;
  v0._object = (void *)0xE90000000000000ALL;
  String.append(_:)(v0);
}

id sub_1001B9580( int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(v10, a2, a10);
}

void sub_1001B958C()
{
  v0._uint64_t countAndFlagsBits = 0x4C41455220LL;
  v0._object = (void *)0xE500000000000000LL;
  String.append(_:)(v0);
}

void sub_1001B95A0(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

void sub_1001B95B4( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  v13._uint64_t countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
}

void sub_1001B95C4()
{
  v0._uint64_t countAndFlagsBits = 0x52454745544E4920LL;
  v0._object = (void *)0xE800000000000000LL;
  String.append(_:)(v0);
}

void sub_1001B95E0()
{
  v1._uint64_t countAndFlagsBits = 0xD000000000000010LL;
  v1._object = v0;
  String.append(_:)(v1);
}

void sub_1001B95F4()
{
}

  ;
}

void sub_1001B9614(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
}

void sub_1001B961C(uint64_t a1@<X8>)
{
  v1._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v1._uint64_t countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v1);
}

uint64_t sub_1001B9634(uint64_t a1, uint64_t a2)
{
  return URL.init(filePath:directoryHint:relativeTo:)(a1, a2, v3, v2);
}

id sub_1001B9640(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void sub_1001B964C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFLL | 0xEA00000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

  ;
}

void sub_1001B9664()
{
}

uint64_t sub_1001B968C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return swift_bridgeObjectRelease(a12);
}

void sub_1001B9694( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  v13._uint64_t countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
}

BOOL sub_1001B96A4()
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v1 & 1, v0);
}

void sub_1001B96B8(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

void sub_1001B96CC(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

void sub_1001B96E0(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

void sub_1001B96F4(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_1001B96FC()
{
  v0._uint64_t countAndFlagsBits = 0x61726770755F7369LL;
  v0._object = (void *)0xEB00000000646564LL;
  String.append(_:)(v0);
}

void sub_1001B9720()
{
  v0._uint64_t countAndFlagsBits = 0x735F736568737570LL;
  v0._object = (void *)0xEB00000000746E65LL;
  String.append(_:)(v0);
}

uint64_t sub_1001B9744()
{
  *Swift::String v0 = 0x8000000000000000LL;
  return v1;
}

uint64_t sub_1001B976C()
{
  return v0 - 160;
}

void sub_1001B9778()
{
}

unint64_t sub_1001B9798(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a5 + 8 * (result >> 6) + 64) |= 1LL << result;
  Swift::String v5 = (void *)(*(void *)(a5 + 48) + 16 * result);
  *Swift::String v5 = a2;
  v5[1] = a3;
  return result;
}

void sub_1001B97C8(uint64_t a1)
{
  unint64_t v1 = 0xE500000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

void sub_1001B97D0()
{
}

uint64_t sub_1001B97DC()
{
  return swift_isUniquelyReferenced_nonNull_native(*v0);
}

  ;
}

unint64_t sub_1001B9810()
{
  return sub_1000F168C(v1, v0);
}

uint64_t sub_1001B9820( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result = *v10;
  *uint64_t v10 = a10;
  return result;
}

uint64_t sub_1001B9830(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

char *sub_1001B9838( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
  return &a28;
}

void sub_1001B9848(uint64_t a1)
{
  unint64_t v1 = 0xE800000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_1001B9850(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

  ;
}

  ;
}

void sub_1001B9888(uint64_t a1, unsigned int a2)
{
}

uint64_t sub_1001B98A0()
{
  return 0x645F6C65636E6163LL;
}

void sub_1001B98C0(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

void *sub_1001B98CC@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

BOOL sub_1001B98D8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v10, v11);
}

void sub_1001B98EC(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

void sub_1001B9900(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4)
{
  v5._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v5._uint64_t countAndFlagsBits = v4;
  String.append(_:)(v5);
}

uint64_t sub_1001B9914()
{
  uint64_t v2 = *v0;
  *uint64_t v0 = v1;
  return swift_bridgeObjectRelease(v2);
}

void sub_1001B9920(uint64_t a1)
{
  unint64_t v1 = 0xE400000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

void sub_1001B9928()
{
}

void sub_1001B9934()
{
}

void sub_1001B9940()
{
}

void sub_1001B994C()
{
  *uint64_t v0 = 0x8000000000000000LL;
}

  ;
}

uint64_t sub_1001B997C()
{
  return v0;
}

uint64_t sub_1001B998C()
{
  return v1;
}

uint64_t sub_1001B99B4(uint64_t a1)
{
  return sub_10001762C(a1, 0LL, 1LL, v1);
}

void sub_1001B99C4()
{
  *uint64_t v0 = 0x8000000000000000LL;
}

uint64_t sub_1001B99DC()
{
  return swift_isUniquelyReferenced_nonNull_native(*v0);
}

void sub_1001B99E4(uint64_t a1)
{
}

uint64_t sub_1001B99EC()
{
  return swift_retain(v0);
}

uint64_t sub_1001B99FC()
{
  return sub_1000175B0(v0);
}

  ;
}

id sub_1001B9A1C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_1001B9A24()
{
  return swift_release(v0);
}

id sub_1001B9A30(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_1001B9A38(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

  ;
}

uint64_t sub_1001B9A54()
{
  return Logger.logObject.getter();
}

  ;
}

uint64_t sub_1001B9A6C()
{
  return v0 - 160;
}

NSString sub_1001B9A80()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1001B9A8C(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_1001B9A94()
{
  return swift_errorRetain(v0);
}

uint64_t sub_1001B9A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return v6;
}

id sub_1001B9AC0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1001B9ACC()
{
  return sub_10005A704(v1, v0);
}

void sub_1001B9AD8()
{
}

void sub_1001B9AE4()
{
}

  ;
}

  ;
}

uint64_t NIOCloseOnErrorHandler.__allocating_init()()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

void NIOCloseOnErrorHandler.errorCaught(context:error:)()
{
}

void sub_1001B9B48()
{
}

uint64_t type metadata accessor for NIOCloseOnErrorHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC25ASOctaneSupportXPCService22NIOCloseOnErrorHandler);
}

ValueMetadata *type metadata accessor for OctaneKeyPair()
{
  return &type metadata for OctaneKeyPair;
}

uint64_t sub_1001B9B8C(uint64_t a1, unint64_t a2)
{
  if (a1 == 25705 && a2 == 0xE200000000000000LL)
  {
    unint64_t v5 = 0xE200000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(25705LL, 0xE200000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x4B65746176697270LL && a2 == 0xEA00000000007965LL)
  {
    unint64_t v8 = 0xEA00000000007965LL;
    goto LABEL_16;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4B65746176697270LL, 0xEA00000000007965LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1LL;
  }

  if (a1 == 0x654B63696C627570LL && a2 == 0xE900000000000079LL)
  {
    swift_bridgeObjectRelease(0xE900000000000079LL);
    return 2LL;
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x654B63696C627570LL, 0xE900000000000079LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_1001B9CD8(char a1)
{
  if (!a1) {
    return 25705LL;
  }
  if (a1 == 1) {
    return 0x4B65746176697270LL;
  }
  return 0x654B63696C627570LL;
}

uint64_t sub_1001B9D2C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B95B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001BA0F4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OctaneKeyPair.CodingKeys,  &type metadata for OctaneKeyPair.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v22 = 0;
  sub_1000B0E84(v12, v13, (uint64_t)&v22);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v21 = 1;
    sub_1000B0E84(v14, v15, (uint64_t)&v21);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v20 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, &v20, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1001B9E50@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000175B0(&qword_1002B95A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100019F58(a1, v7);
  unint64_t v9 = sub_1001BA0F4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneKeyPair.CodingKeys,  &type metadata for OctaneKeyPair.CodingKeys,  v9,  v7,  v8);
  if (v2) {
    return sub_10001DC08();
  }
  char v26 = 0;
  uint64_t v10 = sub_1001BA2BC((uint64_t)&v26);
  uint64_t v12 = v11;
  uint64_t v23 = v10;
  char v25 = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1001BA2BC((uint64_t)&v25);
  uint64_t v15 = v14;
  uint64_t v21 = v13;
  char v24 = 2;
  swift_bridgeObjectRetain();
  uint64_t v22 = v15;
  uint64_t v16 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v24, v5);
  uint64_t v18 = v17;
  uint64_t v19 = v16;
  sub_1000C752C(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  swift_bridgeObjectRetain();
  sub_10001DC08();
  sub_10001EDA0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10001DC10();
  *a2 = v23;
  a2[1] = v12;
  a2[2] = v21;
  a2[3] = v22;
  a2[4] = v19;
  a2[5] = v18;
  return result;
}

uint64_t sub_1001BA024()
{
  return sub_1001B9CD8(*v0);
}

uint64_t sub_1001BA02C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001B9B8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001BA050(uint64_t a1)
{
  unint64_t v2 = sub_1001BA0F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001BA078(uint64_t a1)
{
  unint64_t v2 = sub_1001BA0F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1001BA0A0@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }

  return result;
}

uint64_t sub_1001BA0E0(void *a1)
{
  return sub_1001B9D2C(a1);
}

unint64_t sub_1001BA0F4()
{
  unint64_t result = qword_1002B95B0;
  if (!qword_1002B95B0)
  {
    unint64_t result = swift_getWitnessTable("MU\b", &type metadata for OctaneKeyPair.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B95B0);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for OctaneKeyPair.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1001BA17C + 4 * byte_10020BCC5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001BA1B0 + 4 * asc_10020BCC0[v4]))();
}

uint64_t sub_1001BA1B0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BA1B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BA1C0LL);
  }
  return result;
}

uint64_t sub_1001BA1CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BA1D4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1001BA1D8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BA1E0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneKeyPair.CodingKeys()
{
  return &type metadata for OctaneKeyPair.CodingKeys;
}

unint64_t sub_1001BA200()
{
  unint64_t result = qword_1002B95C0;
  if (!qword_1002B95C0)
  {
    unint64_t result = swift_getWitnessTable("eU\b", &type metadata for OctaneKeyPair.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B95C0);
  }

  return result;
}

unint64_t sub_1001BA240()
{
  unint64_t result = qword_1002B95C8;
  if (!qword_1002B95C8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020BD54, &type metadata for OctaneKeyPair.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B95C8);
  }

  return result;
}

unint64_t sub_1001BA280()
{
  unint64_t result = qword_1002B95D0;
  if (!qword_1002B95D0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020BD7C, &type metadata for OctaneKeyPair.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B95D0);
  }

  return result;
}

uint64_t sub_1001BA2BC(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_1001BA2CC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B97D8);
  __chkstk_darwin(v5);
  sub_10001DAD0();
  *(void *)(v1 + 64) = 1363432531LL;
  *(void *)(v1 + 72) = 0xE400000000000000LL;
  *(void *)(v1 + 96) = 0LL;
  *(void *)(v1 + 104) = 0LL;
  *(void *)(v1 + 120) = 0LL;
  *(void *)(v1 + 128) = 0LL;
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  sub_100019F58(a1, v6);
  unint64_t v8 = sub_1001BB208();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OctaneIAP.CodingKeys,  &type metadata for OctaneIAP.CodingKeys,  v8,  v6,  v7);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = type metadata accessor for OctaneIAP();
    swift_deallocPartialClassInstance(v1, v9, 136LL, 7LL);
  }

  else
  {
    *(void *)(v1 + 16) = sub_1001BB4A8();
    *(void *)(v1 + 24) = v11;
    LOBYTE(v20) = 1;
    *(_BYTE *)(v1 + 32) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5) & 1;
    LOBYTE(v20) = 2;
    *(void *)(v1 + 40) = sub_1001BB4A8();
    *(void *)(v1 + 48) = v12;
    uint64_t v13 = sub_1000175B0(&qword_1002B4610);
    char v19 = 3;
    sub_1001BB244( &qword_1002B4618,  &qword_1002B4620,  byte_100208F04,  (const char *)&protocol conformance descriptor for <A> [A]);
    sub_1001BB500(v13, (uint64_t)&v19, v5, v13);
    *(void *)(v3 + 56) = v20;
    LOBYTE(v20) = 4;
    *(void *)(v3 + 80) = sub_1001BB4A8();
    *(void *)(v3 + 88) = v14;
    *(void *)(v3 + 96) = sub_1001BB4CC(5);
    *(void *)(v3 + 104) = v15;
    swift_bridgeObjectRelease();
    char v19 = 6;
    sub_100074FC4();
    sub_1001BB500( (uint64_t)&type metadata for OctaneIAPType,  (uint64_t)&v19,  v5,  (uint64_t)&type metadata for OctaneIAPType);
    *(_BYTE *)(v3 + 112) = v20;
    uint64_t v16 = sub_1001BB4CC(7);
    uint64_t v18 = v17;
    sub_100023E48();
    *(void *)(v3 + 120) = v16;
    *(void *)(v3 + 128) = v18;
    swift_bridgeObjectRelease();
  }

  sub_100019F7C(a1);
  return v3;
}

uint64_t sub_1001BA5DC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000175B0(&qword_1002B97E8);
  __chkstk_darwin(v4);
  sub_10001DAD0();
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_100019F58(a1, v5);
  unint64_t v7 = sub_1001BB208();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OctaneIAP.CodingKeys,  &type metadata for OctaneIAP.CodingKeys,  v7,  v5,  v6);
  uint64_t v8 = *(void *)(v2 + 16);
  LOBYTE(v21) = 0;
  swift_bridgeObjectRetain();
  sub_1001BB48C();
  if (v8) {
    goto LABEL_2;
  }
  sub_10001DC10();
  uint64_t v10 = *(unsigned __int8 *)(v2 + 32);
  LOBYTE(v21) = 1;
  KeyedEncodingContainer.encode(_:forKey:)(v10, &v21, v4);
  uint64_t v11 = *(void *)(v2 + 40);
  sub_1001BB4E4(2);
  sub_1001BB48C();
  if (v11) {
    goto LABEL_2;
  }
  sub_10001DC10();
  uint64_t v21 = *(void *)(v2 + 56);
  char v20 = 3;
  uint64_t v12 = sub_1000175B0(&qword_1002B4610);
  uint64_t v13 = sub_1001BB244( &qword_1002B4648,  &qword_1002B4650,  byte_100208EDC,  (const char *)&protocol conformance descriptor for <A> [A]);
  sub_10001DB44((uint64_t)&v21, (uint64_t)&v20, v4, v12, v13);
  uint64_t v14 = *(void *)(v2 + 80);
  sub_1001BB4E4(4);
  sub_1001BB48C();
  if (v14
    || (sub_10001DC10(),
        uint64_t v15 = *(void *)(v2 + 96),
        uint64_t v16 = *(void *)(v2 + 104),
        sub_1001BB4E4(5),
        sub_1001BB4F0(v15, v16, (uint64_t)&v21),
        v15))
  {
LABEL_2:
    sub_1001BB4BC();
  }

  else
  {
    sub_10001DC10();
    LOBYTE(v21) = *(_BYTE *)(v2 + 112);
    char v20 = 6;
    unint64_t v17 = sub_100075234();
    sub_10001DB44((uint64_t)&v21, (uint64_t)&v20, v4, (uint64_t)&type metadata for OctaneIAPType, v17);
    uint64_t v18 = *(void *)(v2 + 120);
    uint64_t v19 = *(void *)(v2 + 128);
    LOBYTE(v21) = 7;
    swift_bridgeObjectRetain();
    sub_1001BB4F0(v18, v19, (uint64_t)&v21);
    sub_1001BB4BC();
  }

  return swift_bridgeObjectRelease();
}

void *sub_1001BA81C()
{
  return v0;
}

uint64_t sub_1001BA868()
{
  unint64_t v1 = v0[13];
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v2 = v0[12];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000LL) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v2 = v0[10];
    unint64_t v1 = v0[11];
  }

  swift_bridgeObjectRetain(v1);
  return v2;
}

uint64_t sub_1001BA8BC()
{
  uint64_t v1 = sub_1000175B0(&qword_1002AAFF0);
  __chkstk_darwin(v1);
  sub_10001DAD0();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = type metadata accessor for Locale(0LL);
  sub_10001762C(v4, 1LL, 1LL, v7);
  swift_bridgeObjectRetain();
  uint64_t v8 = NSDecimal.init(string:locale:)(v5, v6, v4);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_10013BBC0(v4);
  if ((v10 & 0x100000000LL) != 0)
  {
    NSDecimal.init(floatLiteral:)(v11, 0.0);
    return v12;
  }

  return v8;
}

uint64_t sub_1001BA990()
{
  uint64_t v0 = sub_1001BB50C();
  return ((uint64_t (*)(uint64_t))((char *)sub_1001BA9B4 + 4 * byte_10020BE60[v1]))(v0);
}

uint64_t sub_1001BA9B4()
{
  return 0x75736E6F436E6F4ELL;
}

unint64_t sub_1001BA9D8()
{
  return 0xD000000000000017LL;
}

unint64_t sub_1001BA9F8()
{
  return 0xD000000000000015LL;
}

unint64_t sub_1001BAA14(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100270038, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

void sub_1001BAA5C(char *a1)
{
}

void sub_1001BAA68()
{
}

void sub_1001BAA70(uint64_t a1)
{
}

void sub_1001BAA78(uint64_t a1)
{
}

unint64_t sub_1001BAA80@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001BAA14(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BAAAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001BA990();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1001BAAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001BB1CC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1001BAB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001BB1CC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_1001BAB7C()
{
  uint64_t v0 = sub_1001BB50C();
  return ((uint64_t (*)(uint64_t))((char *)sub_1001BABA0 + 4 * byte_10020BE64[v1]))(v0);
}

uint64_t sub_1001BABA0()
{
  return 0x736E6F432D6E6F4ELL;
}

unint64_t sub_1001BABC4()
{
  return 0xD000000000000019LL;
}

unint64_t sub_1001BABE0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1001BAC00()
{
  return sub_1001BAB7C();
}

uint64_t sub_1001BAC08()
{
  return swift_deallocClassInstance(v0, 136LL, 7LL);
}

uint64_t type metadata accessor for OctaneIAP()
{
  return objc_opt_self(&OBJC_CLASS____TtC25ASOctaneSupportXPCService9OctaneIAP);
}

uint64_t sub_1001BAC48(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 136LL, 7LL);
  sub_1001BA2CC(a1);
  return v3;
}

uint64_t storeEnumTagSinglePayload for OctaneIAPType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001BACE0 + 4 * byte_10020BE6D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001BAD14 + 4 * byte_10020BE68[v4]))();
}

uint64_t sub_1001BAD14(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BAD1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BAD24LL);
  }
  return result;
}

uint64_t sub_1001BAD30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BAD38LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001BAD3C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BAD44(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneIAPType()
{
  return &type metadata for OctaneIAPType;
}

unint64_t sub_1001BAD64()
{
  unint64_t result = qword_1002B97C8;
  if (!qword_1002B97C8)
  {
    unint64_t result = swift_getWitnessTable("=U\b", &type metadata for OctaneIAPType);
    atomic_store(result, (unint64_t *)&qword_1002B97C8);
  }

  return result;
}

unint64_t sub_1001BADA0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1002746D0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 8) {
    return 8LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001BADEC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001BAE28 + 4 * byte_10020BE72[a1]))( 0x5079616C70736964LL,  0xEC00000065636972LL);
}

uint64_t sub_1001BAE28()
{
  return 0x6853796C696D6166LL;
}

uint64_t sub_1001BAE4C()
{
  return 0x6C616E7265746E69LL;
}

uint64_t sub_1001BAE68()
{
  return 0x617A696C61636F6CLL;
}

uint64_t sub_1001BAE8C()
{
  return 0x49746375646F7270LL;
}

uint64_t sub_1001BAEA8()
{
  return 0x636E657265666572LL;
}

uint64_t sub_1001BAECC()
{
  return 1701869940LL;
}

unint64_t sub_1001BAEDC()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1001BAEF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001BAF34 + 4 * byte_10020BE7A[a1]))( 0x5079616C70736964LL,  0xEC00000065636972LL);
}

uint64_t sub_1001BAF34()
{
  return 0x6853796C696D6166LL;
}

uint64_t sub_1001BAF58()
{
  return 0x6C616E7265746E69LL;
}

uint64_t sub_1001BAF74()
{
  return 0x617A696C61636F6CLL;
}

uint64_t sub_1001BAF98()
{
  return 0x49746375646F7270LL;
}

uint64_t sub_1001BAFB4()
{
  return 0x636E657265666572LL;
}

uint64_t sub_1001BAFD8()
{
  return 1701869940LL;
}

unint64_t sub_1001BAFE8()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1001BB004@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 424))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1001BB030()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 416LL))();
}

void sub_1001BB058(char *a1)
{
}

void sub_1001BB064()
{
}

void sub_1001BB06C(uint64_t a1)
{
}

void sub_1001BB074(uint64_t a1)
{
}

unint64_t sub_1001BB07C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001BADA0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BB0A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001BADEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1001BB0D0()
{
  return sub_1001BAEF8(*v0);
}

uint64_t sub_1001BB0D8@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001BADE8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BB0FC(uint64_t a1)
{
  unint64_t v2 = sub_1001BB208();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001BB124(uint64_t a1)
{
  unint64_t v2 = sub_1001BB208();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001BB14C(uint64_t a1, uint64_t a2)
{
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  if (v5 == v7 && v6 == v8) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0LL);
  }
}

uint64_t sub_1001BB1AC(uint64_t *a1, uint64_t *a2)
{
  return sub_1001BB14C(*a1, *a2) & 1;
}

unint64_t sub_1001BB1CC()
{
  unint64_t result = qword_1002B97D0;
  if (!qword_1002B97D0)
  {
    unint64_t result = swift_getWitnessTable("mU\b", &type metadata for OctaneIAPType);
    atomic_store(result, (unint64_t *)&qword_1002B97D0);
  }

  return result;
}

unint64_t sub_1001BB208()
{
  unint64_t result = qword_1002B97E0;
  if (!qword_1002B97E0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020C1A0, &type metadata for OctaneIAP.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B97E0);
  }

  return result;
}

uint64_t sub_1001BB244(unint64_t *a1, unint64_t *a2, const char *a3, const char *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = sub_100018EC0(&qword_1002B4610);
    uint64_t v10 = sub_1001BB2C0(a2, a3);
    uint64_t result = swift_getWitnessTable(a4, v9, &v10);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1001BB2C0(unint64_t *a1, const char *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for OctaneLocalization();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for OctaneIAP.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF8) {
    return ((uint64_t (*)(void))((char *)&loc_1001BB34C + 4 * byte_10020BE87[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1001BB380 + 4 * byte_10020BE82[v4]))();
}

uint64_t sub_1001BB380(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BB388(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BB390LL);
  }
  return result;
}

uint64_t sub_1001BB39C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BB3A4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 7;
  return result;
}

uint64_t sub_1001BB3A8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BB3B0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneIAP.CodingKeys()
{
  return &type metadata for OctaneIAP.CodingKeys;
}

unint64_t sub_1001BB3D0()
{
  unint64_t result = qword_1002B97F0;
  if (!qword_1002B97F0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020C178, &type metadata for OctaneIAP.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B97F0);
  }

  return result;
}

unint64_t sub_1001BB410()
{
  unint64_t result = qword_1002B97F8;
  if (!qword_1002B97F8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020C0B0, &type metadata for OctaneIAP.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B97F8);
  }

  return result;
}

unint64_t sub_1001BB450()
{
  unint64_t result = qword_1002B9800;
  if (!qword_1002B9800)
  {
    unint64_t result = swift_getWitnessTable("QT\b", &type metadata for OctaneIAP.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9800);
  }

  return result;
}

uint64_t sub_1001BB48C()
{
  return KeyedEncodingContainer.encode(_:forKey:)(v1, v2, v3 - 72, v0);
}

uint64_t sub_1001BB4A8()
{
  return KeyedDecodingContainer.decode(_:forKey:)(v1 - 72, v0);
}

uint64_t sub_1001BB4BC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1001BB4CC@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v2 - 72) = a1;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_1001BB4E4@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v2 - 72) = a1;
  return swift_bridgeObjectRetain(v1);
}

uint64_t sub_1001BB4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_1001BB500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)(a1, a2, a3, a4);
}

uint64_t sub_1001BB50C()
{
  return 0x62616D75736E6F43LL;
}

void sub_1001BB530()
{
  uint64_t v1 = sub_100047A48(v0, (uint64_t)v26);
  sub_1001BC138(v1, v2, v3, v4);
  uint64_t v5 = v27;
  if (!v27) {
    goto LABEL_47;
  }
  sub_100162BEC();
  if (!v7) {
    goto LABEL_47;
  }
  if ((v5 & 0x1000000000000000LL) != 0)
  {
    sub_100047A90((uint64_t)v26);
    uint64_t v22 = sub_1001BC11C();
    sub_100162BDC(v22, v23, v24, v25);
LABEL_47:
    sub_1000BC0CC();
    return;
  }

  if ((v5 & 0x2000000000000000LL) == 0)
  {
    if ((v0 & 0x1000000000000000LL) != 0) {
      uint64_t v8 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v8 = (unsigned __int8 *)sub_10016F2D0();
    }
    sub_1001BC12C(v8, v6);
    goto LABEL_47;
  }

  sub_10016F2A8();
  if (v11)
  {
    if (v9)
    {
      if (v9 != 1)
      {
        sub_10016F1D0();
        if (!(!v11 & v13) && v14 != 2)
        {
          sub_100162A90();
          if (!(!v11 & v13))
          {
            sub_100162B74();
            if (!v11)
            {
              sub_100162AF0();
              do
              {
                sub_100024EAC();
                if (!v11 & v13) {
                  break;
                }
                sub_100162A7C();
                if (!v11) {
                  break;
                }
                if (__OFADD__(v16, v15)) {
                  break;
                }
                sub_10005769C();
              }

              while (!v11);
            }
          }
        }
      }

      goto LABEL_47;
    }
  }

  else
  {
    if (v10 != 45)
    {
      if (v9)
      {
        sub_100162A90();
        if (!(!v11 & v13) && v17 != 1)
        {
          sub_10016F1D0();
          if (!(!v11 & v13))
          {
            sub_100162B60();
            while (!v11)
            {
              sub_100024EAC();
              if (!v11 & v13) {
                break;
              }
              sub_100162A7C();
              if (!v11) {
                break;
              }
              if (__OFADD__(v19, v18)) {
                break;
              }
              sub_10005769C();
            }
          }
        }
      }

      goto LABEL_47;
    }

    if (v9)
    {
      if (v9 != 1)
      {
        sub_10016F1D0();
        if (!(!v11 & v13) && v12 != 2)
        {
          sub_100162B4C();
          if (!(!v11 & v13))
          {
            sub_100162B18();
            if (!v11)
            {
              sub_100162AF0();
              do
              {
                sub_100024EAC();
                if (!v11 & v13) {
                  break;
                }
                sub_100162A7C();
                if (!v11) {
                  break;
                }
                if (__OFSUB__(v21, v20)) {
                  break;
                }
                sub_10005769C();
              }

              while (!v11);
            }
          }
        }
      }

      goto LABEL_47;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_1001BB70C()
{
  uint64_t v1 = sub_100047A48(v0 + 16, (uint64_t)v26);
  sub_1001BC138(v1, v2, v3, v4);
  uint64_t v5 = v27;
  if (!v27) {
    goto LABEL_47;
  }
  sub_100162BEC();
  if (!v7) {
    goto LABEL_47;
  }
  if ((v5 & 0x1000000000000000LL) != 0)
  {
    sub_100047A90((uint64_t)v26);
    uint64_t v22 = sub_1001BC11C();
    sub_100162BDC(v22, v23, v24, v25);
LABEL_47:
    sub_1000BC0CC();
    return;
  }

  if ((v5 & 0x2000000000000000LL) == 0)
  {
    if ((v0 & 0x1000000000000000LL) != 0) {
      uint64_t v8 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v8 = (unsigned __int8 *)sub_10016F2D0();
    }
    sub_1001BC12C(v8, v6);
    goto LABEL_47;
  }

  sub_10016F2A8();
  if (v11)
  {
    if (v9)
    {
      if (v9 != 1)
      {
        sub_10016F1D0();
        if (!(!v11 & v13) && v14 != 2)
        {
          sub_100162A90();
          if (!(!v11 & v13))
          {
            sub_100162B74();
            if (!v11)
            {
              sub_100162AF0();
              do
              {
                sub_100024EAC();
                if (!v11 & v13) {
                  break;
                }
                sub_100162A7C();
                if (!v11) {
                  break;
                }
                if (__OFADD__(v16, v15)) {
                  break;
                }
                sub_10005769C();
              }

              while (!v11);
            }
          }
        }
      }

      goto LABEL_47;
    }
  }

  else
  {
    if (v10 != 45)
    {
      if (v9)
      {
        sub_100162A90();
        if (!(!v11 & v13) && v17 != 1)
        {
          sub_10016F1D0();
          if (!(!v11 & v13))
          {
            sub_100162B60();
            while (!v11)
            {
              sub_100024EAC();
              if (!v11 & v13) {
                break;
              }
              sub_100162A7C();
              if (!v11) {
                break;
              }
              if (__OFADD__(v19, v18)) {
                break;
              }
              sub_10005769C();
            }
          }
        }
      }

      goto LABEL_47;
    }

    if (v9)
    {
      if (v9 != 1)
      {
        sub_10016F1D0();
        if (!(!v11 & v13) && v12 != 2)
        {
          sub_100162B4C();
          if (!(!v11 & v13))
          {
            sub_100162B18();
            if (!v11)
            {
              sub_100162AF0();
              do
              {
                sub_100024EAC();
                if (!v11 & v13) {
                  break;
                }
                sub_100162A7C();
                if (!v11) {
                  break;
                }
                if (__OFSUB__(v21, v20)) {
                  break;
                }
                sub_10005769C();
              }

              while (!v11);
            }
          }
        }
      }

      goto LABEL_47;
    }

    __break(1u);
  }

  __break(1u);
}

unint64_t sub_1001BB8E8(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1002747B0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001BB934(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001BB960 + 4 * byte_10020C1F0[a1]))( 1684632420LL,  0xE400000000000000LL);
}

unint64_t sub_1001BB968()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1001BB984(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001BB9B0 + 4 * byte_10020C1F4[a1]))( 1684632420LL,  0xE400000000000000LL);
}

unint64_t sub_1001BB9B8()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1001BB9D4(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B9818);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001BBF44();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for StatusRequest.CodingKeys,  &type metadata for StatusRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v25 = 0;
  sub_100048728(v12, v13, (uint64_t)&v25);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v24 = 1;
    sub_100048728(v14, v15, (uint64_t)&v24);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v23 = 2;
    sub_1000B0E84(v16, v17, (uint64_t)&v23);
    uint64_t v18 = v3[6];
    uint64_t v19 = v3[7];
    char v22 = 3;
    sub_1000B0E84(v18, v19, (uint64_t)&v22);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1001BBB08@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000175B0(&qword_1002B9808);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001BBF44();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for StatusRequest.CodingKeys,  &type metadata for StatusRequest.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_10001DC08();
  }
  char v35 = 0;
  uint64_t v12 = sub_1001BC10C((uint64_t)&v35);
  uint64_t v14 = v13;
  uint64_t v30 = v12;
  char v34 = 1;
  sub_100075D08(v12, v13);
  uint64_t v15 = sub_1001BC10C((uint64_t)&v34);
  uint64_t v31 = v16;
  uint64_t v29 = v15;
  char v33 = 2;
  sub_100075D08(v15, v16);
  uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)(&v33, v5);
  uint64_t v28 = v17;
  char v32 = 3;
  sub_100075D08(v27, v17);
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)(&v32, v5);
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v18;
  v21(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v23 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10003561C();
  swift_bridgeObjectRelease();
  sub_10001DC08();
  swift_bridgeObjectRelease();
  uint64_t v24 = v28;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10003561C();
  *a2 = v30;
  a2[1] = v14;
  a2[2] = v29;
  a2[3] = v23;
  a2[4] = v27;
  a2[5] = v24;
  a2[6] = v22;
  a2[7] = v20;
  return result;
}

void sub_1001BBD5C()
{
}

void sub_1001BBD68()
{
}

void sub_1001BBD70()
{
}

void sub_1001BBD78(uint64_t a1)
{
}

unint64_t sub_1001BBD80@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001BB8E8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BBDAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001BB934(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1001BBDD4()
{
  return sub_1001BB984(*v0);
}

uint64_t sub_1001BBDDC@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001BB930(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BBE00(uint64_t a1)
{
  unint64_t v2 = sub_1001BBF44();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001BBE28(uint64_t a1)
{
  unint64_t v2 = sub_1001BBF44();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1001BBE50@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    __int128 v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }

  return result;
}

uint64_t sub_1001BBE90(void *a1)
{
  return sub_1001BB9D4(a1);
}

uint64_t getEnumTagSinglePayload for StatusRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 64) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for StatusRequest()
{
  return &type metadata for StatusRequest;
}

unint64_t sub_1001BBF44()
{
  unint64_t result = qword_1002B9810;
  if (!qword_1002B9810)
  {
    unint64_t result = swift_getWitnessTable(byte_10020C384, &type metadata for StatusRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9810);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for StatusRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001BBFCC + 4 * byte_10020C1FD[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001BC000 + 4 * byte_10020C1F8[v4]))();
}

uint64_t sub_1001BC000(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BC008(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BC010LL);
  }
  return result;
}

uint64_t sub_1001BC01C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BC024LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001BC028(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BC030(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StatusRequest.CodingKeys()
{
  return &type metadata for StatusRequest.CodingKeys;
}

unint64_t sub_1001BC050()
{
  unint64_t result = qword_1002B9820;
  if (!qword_1002B9820)
  {
    unint64_t result = swift_getWitnessTable(byte_10020C35C, &type metadata for StatusRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9820);
  }

  return result;
}

unint64_t sub_1001BC090()
{
  unint64_t result = qword_1002B9828;
  if (!qword_1002B9828)
  {
    unint64_t result = swift_getWitnessTable("%T\b", &type metadata for StatusRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9828);
  }

  return result;
}

unint64_t sub_1001BC0D0()
{
  unint64_t result = qword_1002B9830;
  if (!qword_1002B9830)
  {
    unint64_t result = swift_getWitnessTable("\rT\b", &type metadata for StatusRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9830);
  }

  return result;
}

uint64_t sub_1001BC10C(uint64_t a1)
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(a1, v1);
}

uint64_t sub_1001BC11C()
{
  return sub_100161AEC(v1, v0, 10LL);
}

unsigned __int8 *sub_1001BC12C(unsigned __int8 *a1, uint64_t a2)
{
  return sub_100161AC4(a1, a2);
}

uint64_t sub_1001BC138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  return sub_100047A48((uint64_t)va, (uint64_t)va1);
}

void sub_1001BC144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1001BC170(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1001BC1A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *v4;
  uint64_t v29 = a3;
  uint64_t v9 = *(void *)(a4 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(a1);
  sub_100025FF8();
  uint64_t v12 = sub_1000C0EFC(v11);
  char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v12, v5);
  sub_10002A338();
  sub_100025FF8();
  uint64_t v15 = sub_1000C0EFC(v14);
  if ((v13 & 1) != 0)
  {
    uint64_t v16 = EventLoop.makePromise<A>(of:file:line:)( (uint64_t)&type metadata for ()[8],  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StoreKit/ASOctaneSupportXPCService/Octane Server/SwiftNIO/Bas eSocketChannel+SocketOptionProvider.swift",  140LL,  2LL,  24LL,  v15,  (uint64_t)&type metadata for ()[8],  v5);
    sub_10002A338();
    swift_retain();
    sub_1001BC144(a1, a2, v29, a4);
    sub_100098A70(0LL, 0LL, v16);
  }

  else
  {
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v18 = v29;
    uint64_t v29 = v15;
    v17((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v18, a4);
    uint64_t v19 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v27 = v5;
    int v20 = a2;
    uint64_t v21 = (v19 + 56) & ~v19;
    uint64_t v22 = swift_allocObject(&unk_1002917D0, v21 + v10, v19 | 7);
    uint64_t v23 = v28;
    *(void *)(v22 + 16) = *(void *)(v28 + 80);
    *(void *)(v22 + 24) = a4;
    *(void *)(v22 + 32) = *(void *)(v23 + 88);
    *(void *)(v22 + 40) = v4;
    *(_DWORD *)(v22 + 48) = a1;
    *(_DWORD *)(v22 + 52) = v20;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))( v22 + v21,  (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a4);
    uint64_t v24 = v27;
    char v25 = *(uint64_t (**)(void (*)(), uint64_t, char *, uint64_t, uint64_t))(v27 + 32);
    swift_retain();
    uint64_t v16 = v25(sub_1001BC650, v22, &type metadata for ()[8], v29, v24);
    sub_10002A338();
  }

  swift_release();
  return v16;
}

uint64_t sub_1001BC3B0(int a1, int a2, uint64_t a3)
{
  uint64_t v9 = sub_1000C0F4C(v8);
  char v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v9, v4);
  sub_10002A338();
  sub_100025FF8();
  uint64_t v12 = sub_1000C0F4C(v11);
  if ((v10 & 1) != 0)
  {
    uint64_t v13 = EventLoop.makePromise<A>(of:file:line:)( a3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StoreKit/ASOctaneSupportXPCService/Octane Server/SwiftNIO/Bas eSocketChannel+SocketOptionProvider.swift",  140LL,  2LL,  44LL,  v12,  a3,  v4);
    uint64_t v14 = sub_10002A338();
    __chkstk_darwin(v14);
    v20[2] = a3;
    void v20[3] = v3;
    int v21 = a1;
    int v22 = a2;
    uint64_t v15 = swift_retain();
    sub_100026E84(v15, (uint64_t)sub_1001BC5AC, (uint64_t)v20, a3);
    swift_release();
    return v13;
  }

  else
  {
    uint64_t v17 = swift_allocObject(&unk_1002917A8, 40LL, 7LL);
    *(void *)(v17 + 16) = a3;
    *(void *)(v17 + 24) = v3;
    *(_DWORD *)(v17 + 32) = a1;
    *(_DWORD *)(v17 + 36) = a2;
    uint64_t v18 = *(uint64_t (**)(void (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 32);
    swift_retain();
    uint64_t v19 = v18(sub_1001BC5AC, v17, a3, v12, v4);
    sub_10002A338();
    swift_release();
    return v19;
  }

uint64_t sub_1001BC508()
{
  return sub_1001BC19C();
}

uint64_t sub_1001BC528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1001BC1A0(a1, a2, a3, a4);
}

uint64_t sub_1001BC548()
{
  return sub_1001BC3AC();
}

uint64_t sub_1001BC568(int a1, int a2, uint64_t a3)
{
  return sub_1001BC3B0(a1, a2, a3);
}

uint64_t sub_1001BC588()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1001BC5AC()
{
}

void sub_1001BC5C0()
{
}

uint64_t sub_1001BC5E4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1001BC650()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL);
  sub_1001BC144(*(unsigned int *)(v0 + 48), *(unsigned int *)(v0 + 52), v0 + ((v2 + 56) & ~v2), v1);
  sub_10002A814();
}

uint64_t destroy for HTTPRequest(void *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >= 2) {
    swift_bridgeObjectRelease(v2);
  }
  swift_unknownObjectRelease(a1[2]);
  swift_release(a1[4]);
  swift_bridgeObjectRelease(a1[5]);
  uint64_t v3 = a1[9];
  if (v3)
  {
    uint64_t v4 = a1[8];
    swift_release(v3);
    swift_bridgeObjectRelease(v4);
  }

  return swift_bridgeObjectRelease(a1[12]);
}

uint64_t initializeWithCopy for HTTPRequest(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 2)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain(v4);
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  __int128 v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 72);
  swift_unknownObjectRetain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = v8;
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a1 + 91) = *(_DWORD *)(a2 + 91);
    swift_bridgeObjectRetain(v9);
    swift_retain(v8);
  }

  else
  {
    __int128 v10 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v10;
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
  }

  uint64_t v11 = *(void *)(a2 + 96);
  *(void *)(a1 + 96) = v11;
  swift_bridgeObjectRetain(v11);
  return a1;
}

uint64_t assignWithCopy for HTTPRequest(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) < 2uLL)
  {
    if (v4 >= 2)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  if (v4 < 2)
  {
    sub_1001BC9C8(a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  swift_unknownObjectRetain(v5);
  swift_unknownObjectRelease(v7);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v8 = (_OWORD *)(a1 + 56);
  uint64_t v9 = (_OWORD *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72))
  {
    if (v10)
    {
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_retain();
      swift_release();
      *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
      *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
      *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
      *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
      *(_BYTE *)(a1 + 94) = *(_BYTE *)(a2 + 94);
    }

    else
    {
      sub_10012B580(a1 + 56);
      uint64_t v12 = *(void *)(a2 + 87);
      __int128 v13 = *(_OWORD *)(a2 + 72);
      *uint64_t v8 = *v9;
      *(_OWORD *)(a1 + 72) = v13;
      *(void *)(a1 + 87) = v12;
    }
  }

  else if (v10)
  {
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
    *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
    int v11 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a1 + 91) = *(_DWORD *)(a2 + 91);
    *(_DWORD *)(a1 + 88) = v11;
    swift_bridgeObjectRetain();
    swift_retain();
  }

  else
  {
    __int128 v14 = *v9;
    __int128 v15 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
    *uint64_t v8 = v14;
    *(_OWORD *)(a1 + 72) = v15;
  }

  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1001BC9C8(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for HTTPRequest(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 2uLL) {
    goto LABEL_4;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 2)
  {
    sub_1001BC9C8(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRelease(v5);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  if (!*(void *)(a1 + 72))
  {
LABEL_10:
    __int128 v8 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v8;
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
    goto LABEL_11;
  }

  uint64_t v6 = *(void *)(a2 + 72);
  if (!v6)
  {
    sub_10012B580(a1 + 56);
    goto LABEL_10;
  }

  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = v6;
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
  *(_BYTE *)(a1 + 94) = *(_BYTE *)(a2 + 94);
LABEL_11:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
    {
      LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 104) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HTTPRequest()
{
  return &type metadata for HTTPRequest;
}

uint64_t sub_1001BCBC8()
{
  uint64_t v1 = type metadata accessor for URLQueryItem(0LL);
  uint64_t v59 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v56 = (char *)v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_1000175B0(&qword_1002B3958);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  __int128 v8 = (char *)v53 - v7;
  uint64_t v9 = *(void *)(v0 + 32);
  uint64_t v10 = *(void *)(v9 + 32);
  uint64_t v11 = *(void *)(v9 + 40);
  swift_bridgeObjectRetain();
  URLComponents.init(string:)(v10, v11);
  sub_10001EDA0();
  sub_100196470((uint64_t)v8, (uint64_t)v6);
  uint64_t v12 = type metadata accessor for URLComponents(0LL);
  if (sub_10001D158((uint64_t)v6, 1LL, v12) == 1)
  {
    sub_1001964B8((uint64_t)v6);
LABEL_22:
    __int128 v14 = (void *)sub_1001BD694((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&type metadata for String);
    sub_1001964B8((uint64_t)v8);
    return (uint64_t)v14;
  }

  uint64_t v13 = URLComponents.queryItems.getter();
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8LL))(v6, v12);
  if (!v13) {
    goto LABEL_22;
  }
  __int128 v14 = (void *)sub_1001BD694((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&type metadata for String);
  uint64_t v15 = *(void *)(v13 + 16);
  if (!v15)
  {
LABEL_21:
    sub_1001964B8((uint64_t)v8);
    sub_10001EDA0();
    return (uint64_t)v14;
  }

  v53[1] = v13;
  char v54 = v8;
  unint64_t v16 = v13 + ((*(unsigned __int8 *)(v59 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80));
  uint64_t v17 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v59 + 16);
  uint64_t v57 = *(void *)(v59 + 72);
  uint64_t v58 = v17;
  swift_bridgeObjectRetain();
  uint64_t v55 = v1;
  uint64_t v18 = v56;
  while (1)
  {
    uint64_t v19 = v58(v18, v16, v1);
    uint64_t v20 = URLQueryItem.name.getter(v19);
    uint64_t v22 = v21;
    uint64_t v23 = URLQueryItem.value.getter();
    if (!v24)
    {
      swift_bridgeObjectRetain();
      unint64_t v40 = sub_1001BD69C(v20);
      char v42 = v41;
      swift_bridgeObjectRelease();
      if ((v42 & 1) != 0)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
        uint64_t v61 = v14;
        Swift::Int v44 = v14[3];
        sub_1000175B0(&qword_1002AA9A0);
        Swift::Bool v45 = isUniquelyReferenced_nonNull_native;
        Swift::Int v46 = v44;
        uint64_t v1 = v55;
        uint64_t v18 = v56;
        _NativeDictionary.ensureUnique(isUnique:capacity:)(v45, v46);
        __int128 v14 = v61;
        swift_bridgeObjectRelease();
        _NativeDictionary._delete(at:)( v40,  v14,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
        sub_10001EDA0();
        swift_bridgeObjectRelease();
      }

      swift_bridgeObjectRelease();
      goto LABEL_19;
    }

    uint64_t v25 = v24;
    uint64_t v60 = v15;
    uint64_t v26 = v23;
    char v27 = swift_isUniquelyReferenced_nonNull_native(v14);
    uint64_t v61 = v14;
    uint64_t v28 = v22;
    unint64_t v29 = sub_1001BD69C(v20);
    uint64_t v31 = v14[2];
    BOOL v32 = (v30 & 1) == 0;
    Swift::Int v33 = v31 + v32;
    if (__OFADD__(v31, v32)) {
      break;
    }
    unint64_t v34 = v29;
    char v35 = v30;
    sub_1000175B0(&qword_1002AA9A0);
    Swift::Bool v36 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v27, v33);
    uint64_t v1 = v55;
    if (v36)
    {
      unint64_t v37 = sub_1000F168C(v20, v28);
      if ((v35 & 1) != (v38 & 1)) {
        goto LABEL_26;
      }
      unint64_t v34 = v37;
    }

    __int128 v14 = v61;
    if ((v35 & 1) != 0)
    {
      uint64_t v39 = (uint64_t *)(v61[7] + 16 * v34);
      swift_bridgeObjectRelease();
      *uint64_t v39 = v26;
      v39[1] = v25;
    }

    else
    {
      v61[(v34 >> 6) + 8] |= 1LL << v34;
      uint64_t v47 = (uint64_t *)(v14[6] + 16 * v34);
      *uint64_t v47 = v20;
      v47[1] = v28;
      uint64_t v48 = (uint64_t *)(v14[7] + 16 * v34);
      *uint64_t v48 = v26;
      v48[1] = v25;
      uint64_t v49 = v14[2];
      BOOL v50 = __OFADD__(v49, 1LL);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_25;
      }
      v14[2] = v51;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v56;
    uint64_t v15 = v60;
LABEL_19:
    (*(void (**)(char *, uint64_t))(v59 + 8))(v18, v1);
    v16 += v57;
    if (!--v15)
    {
      sub_10001EDA0();
      __int128 v8 = v54;
      goto LABEL_21;
    }
  }

  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_1001BD000()
{
  v0._object = (void *)0x800000010021C450LL;
  v0._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  Swift::String_optional v2 = HTTPHeaders.first(name:)(v0);
  uint64_t result = v2.value._countAndFlagsBits;
  if (!v2.value._object) {
    return 3157553LL;
  }
  return result;
}

uint64_t sub_1001BD04C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17 = sub_1001BD694((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&type metadata for String);
  if (a6) {
    uint64_t v18 = a7;
  }
  else {
    uint64_t v18 = 0LL;
  }
  if (a6) {
    uint64_t v19 = a8;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v26 = v17;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain(a1);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1001BD63C();
  swift_retain();
  v20._uint64_t countAndFlagsBits = 0x2D746E65746E6F43LL;
  v20._object = (void *)0xEC00000065707954LL;
  if ((unint64_t)HTTPHeaders.first(name:)(v20).value._object)
  {
    uint64_t v21 = sub_1001BD204();
    uint64_t v23 = v22;
    swift_release();
  }

  else
  {
    swift_release();
    uint64_t v21 = 0LL;
    uint64_t v23 = 1LL;
  }

  sub_1001BD688();
  sub_1001BD688();
  swift_unknownObjectRetain(a1);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1001BD63C();
  swift_unknownObjectRelease(a1);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1001BD654();
  sub_1001BD67C();
  sub_1001BD67C();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease(a1);
  sub_1001BD654();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a9 = v21;
  *(void *)(a9 + 8) = v23;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(_BYTE *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = 0LL;
  *(void *)(a9 + 64) = 0LL;
  *(void *)(a9 + 72) = a6;
  *(void *)(a9 + 80) = v18;
  *(_BYTE *)(a9 + 94) = BYTE6(v19);
  *(_WORD *)(a9 + 92) = WORD2(v19);
  *(_DWORD *)(a9 + 88) = v19;
  *(void *)(a9 + 96) = v26;
  return result;
}

uint64_t sub_1001BD204()
{
  uint64_t countAndFlagsBits = String.lowercased()()._countAndFlagsBits;
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000010021B780LL;
  v2._uint64_t countAndFlagsBits = 0xD000000000000010LL;
  if (sub_1001BD6A8(v2)
    || (v3._uint64_t countAndFlagsBits = 0xD000000000000019LL, v3._object = (void *)0x8000000100222870LL, sub_1001BD6A8(v3)))
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  return countAndFlagsBits;
}

uint64_t sub_1001BD2AC(uint64_t a1, uint64_t a2)
{
  return sub_1001BD304( a1,  a2,  (uint64_t (*)(void))&type metadata accessor for JSONEncoder,  (uint64_t (*)(void))&JSONEncoder.init(),  (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of JSONEncoder.encode<A>(_:));
}

uint64_t sub_1001BD2D8(uint64_t a1, uint64_t a2)
{
  return sub_1001BD304( a1,  a2,  (uint64_t (*)(void))&type metadata accessor for PropertyListEncoder,  (uint64_t (*)(void))&PropertyListEncoder.init(),  (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of PropertyListEncoder.encode<A>(_:));
}

uint64_t sub_1001BD304( uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = v5;
  uint64_t v11 = a3(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = a4();
  uint64_t v13 = a5(v8, a1, a2);
  swift_release(v12);
  return v13;
}

double sub_1001BD3A0@<D0>( uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v9 + 16))(v11);
  sub_100178A98(a2, &v23);
  uint64_t v12 = sub_100178A98(&v23, &v24);
  if (v24.n128_u64[1])
  {
    sub_1001BD66C( (uint64_t)v12,  v13,  (uint64_t (*)(void))&type metadata accessor for PropertyListEncoder,  (uint64_t (*)(void))&PropertyListEncoder.init(),  (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of PropertyListEncoder.encode<A>(_:));
    if (a4) {
      swift_errorRelease(a4);
    }
  }

  else
  {
    sub_1001BD66C( (uint64_t)v12,  v13,  (uint64_t (*)(void))&type metadata accessor for JSONEncoder,  (uint64_t (*)(void))&JSONEncoder.init(),  (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of JSONEncoder.encode<A>(_:));
    if (a4) {
      swift_errorRelease(a4);
    }
  }

  sub_1001BD6B4();
  sub_1000AD058(v14, v15);
  uint64_t v16 = *(void *)(a4 + 16);
  int v17 = *(_DWORD *)(a4 + 32);
  __int16 v18 = *(_WORD *)(a4 + 36);
  char v19 = *(_BYTE *)(a4 + 38);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)a4;
  uint64_t v20 = *(void *)(a4 + 24);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a3);
  double result = v22[0];
  *(_OWORD *)a5 = *(_OWORD *)v22;
  *(void *)(a5 + 16) = v16;
  *(void *)(a5 + 24) = v20;
  *(_DWORD *)(a5 + 32) = v17;
  *(_WORD *)(a5 + 36) = v18;
  *(_BYTE *)(a5 + 38) = v19;
  return result;
}

uint64_t sub_1001BD534(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain(v3);
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPContentType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for HTTPContentType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)double result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)double result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HTTPContentType()
{
  return &type metadata for HTTPContentType;
}

uint64_t sub_1001BD63C()
{
  return sub_1000555E4(0LL, 0LL, v0);
}

uint64_t sub_1001BD654()
{
  return sub_100039090(0LL, 0LL, v0);
}

uint64_t sub_1001BD66C( uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  return sub_1001BD304(v6, v5, a3, a4, a5);
}

uint64_t sub_1001BD67C()
{
  return sub_10003907C(v1, v0);
}

uint64_t sub_1001BD688()
{
  return sub_1000555D0(v1, v0);
}

uint64_t sub_1001BD694(uint64_t a1, uint64_t a2)
{
  return Dictionary.init(dictionaryLiteral:)(a1, a2, a2);
}

unint64_t sub_1001BD69C(uint64_t a1)
{
  return sub_1000F168C(a1, v1);
}

BOOL sub_1001BD6A8(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

  ;
}

uint64_t sub_1001BD6C8()
{
  char v4 = 23;
  unint64_t v0 = sub_100092564();
  return sub_1001BD8AC(v0, (uint64_t)&v4, v1, (uint64_t)&type metadata for TransactionEntity.Key, v2, v0);
}

uint64_t sub_1001BD71C()
{
  HIBYTE(v5[6]) = 0;
  v5[7] = -5120;
  unint64_t v0 = AnyHashable.init<A>(_:)(v6, v5, &type metadata for String, &protocol witness table for String);
  uint64_t v3 = sub_1001BD8AC( (uint64_t)v0,  (uint64_t)v6,  v1,  (uint64_t)&type metadata for AnyHashable,  v2,  (uint64_t)&protocol witness table for AnyHashable);
  sub_1001BD878((uint64_t)v6);
  return v3;
}

uint64_t sub_1001BD7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __chkstk_darwin(a1);
  uint64_t v11 = (char *)&v18[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = v9;
  (*(void (**)(char *))(v12 + 16))(v11);
  uint64_t v13 = swift_bridgeObjectRetain(a1);
  double v14 = static Date.timeIntervalSinceReferenceDate.getter(v13);
  v18[3] = &type metadata for Double;
  *(double *)__int16 v18 = v14;
  uint64_t v15 = type metadata accessor for Dictionary(0LL, a4, (char *)&type metadata for Any + 8, a6);
  Dictionary.subscript.setter(v18, v11, v15);
  return v19;
}

uint64_t sub_1001BD878(uint64_t a1)
{
  return a1;
}

uint64_t sub_1001BD8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1001BD7B4(v8, a2, v7, a4, v6, a6);
}

uint64_t getEnumTagSinglePayload for OctaneSubscriptionPeriod(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(_BYTE *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      BOOL v4 = v3 >= 7;
      int v2 = v3 - 7;
      if (!v4) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OctaneSubscriptionPeriod( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)double result = a2 - 250;
    if (a3 >= 0xFA) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFA) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = a2 + 6;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OctaneSubscriptionPeriod()
{
  return &type metadata for OctaneSubscriptionPeriod;
}

uint64_t sub_1001BD94C(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v87[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v87[-v9];
  uint64_t v89 = a1;
  uint64_t v90 = (uint64_t)a2;
  v88[0] = 32LL;
  v88[1] = 0xE100000000000000LL;
  unint64_t v11 = sub_10001B4A0();
  uint64_t v12 = StringProtocol.contains<A>(_:)(v88, &type metadata for String, &type metadata for String, v11, v11);
  if ((v12 & 1) != 0)
  {
    uint64_t v89 = 32LL;
    uint64_t v90 = 0xE100000000000000LL;
    __chkstk_darwin(v12);
    *(void *)&v87[-16] = &v89;
    sub_100019320();
    uint64_t v13 = sub_10018DFF4(0x7FFFFFFFFFFFFFFFLL, 1u, sub_10006E270, (uint64_t)&v87[-32], a1, (unint64_t)a2);
    sub_100019390();
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      uint64_t v89 = (uint64_t)_swiftEmptyArrayStorage;
      sub_100032050();
      a2 = (void *)v89;
      uint64_t v15 = (void *)(v13 + 56);
      do
      {
        uint64_t v16 = *(v15 - 3);
        uint64_t v17 = *v15;
        swift_bridgeObjectRetain(*v15);
        uint64_t v18 = static String._fromSubstring(_:)(v16);
        uint64_t v20 = v19;
        swift_bridgeObjectRelease(v17);
        uint64_t v89 = (uint64_t)a2;
        unint64_t v21 = a2[2];
        if (v21 >= a2[3] >> 1)
        {
          sub_100032050();
          a2 = (void *)v89;
        }

        a2[2] = v21 + 1;
        uint64_t v22 = &a2[2 * v21];
        v22[4] = v18;
        v22[5] = v20;
        v15 += 4;
        --v14;
      }

      while (v14);
      sub_10001A3F8();
    }

    else
    {
      sub_10001A3F8();
      a2 = _swiftEmptyArrayStorage;
    }

    if (a2[2] == 2LL)
    {
      uint64_t v38 = a2[4];
      uint64_t v39 = a2[5];
      swift_bridgeObjectRetain(v39);
      uint64_t result = sub_100160A58(v38, v39);
      if ((v40 & 1) == 0)
      {
        if (a2[2] >= 2uLL)
        {
          uint64_t v33 = result;
          uint64_t v42 = a2[6];
          uint64_t v41 = a2[7];
          swift_bridgeObjectRetain(v41);
          sub_100019390();
          uint64_t v89 = v42;
          uint64_t v90 = v41;
          swift_bridgeObjectRetain(v41);
          v43._uint64_t countAndFlagsBits = 115LL;
          v43._object = (void *)0xE100000000000000LL;
          Swift::Bool v44 = String.hasSuffix(_:)(v43);
          sub_10001EDA0();
          if (v44)
          {
            sub_1001A9288();
            swift_bridgeObjectRelease(v45);
          }

          Swift::String v46 = String.lowercased()();
          sub_10001EDA0();
          return 0LL;
        }

        __break(1u);
        goto LABEL_95;
      }
    }

    goto LABEL_77;
  }

  uint64_t v89 = a1;
  uint64_t v90 = (uint64_t)a2;
  uint64_t v23 = CharacterSet.init(charactersIn:)(0x3736353433323130LL, 0xEA00000000003938LL);
  CharacterSet.inverted.getter(v23);
  __n128 v24 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v24(v10, v4);
  uint64_t v25 = StringProtocol.trimmingCharacters(in:)(v8, &type metadata for String, v11);
  unint64_t v27 = (unint64_t)v26;
  uint64_t result = ((uint64_t (*)(_BYTE *, uint64_t))v24)(v8, v4);
  uint64_t v29 = HIBYTE(v27) & 0xF;
  uint64_t v30 = v25 & 0xFFFFFFFFFFFFLL;
  if ((v27 & 0x2000000000000000LL) != 0) {
    uint64_t v31 = HIBYTE(v27) & 0xF;
  }
  else {
    uint64_t v31 = v25 & 0xFFFFFFFFFFFFLL;
  }
  if (!v31)
  {
    sub_100019390();
    uint64_t v78 = (void *)v27;
    goto LABEL_78;
  }

  if ((v27 & 0x1000000000000000LL) != 0)
  {
    uint64_t v83 = sub_1001BEF50();
    uint64_t v33 = sub_100161AEC(v83, v84, 10LL);
    LOBYTE(v25) = v85;
    goto LABEL_61;
  }

  if ((v27 & 0x2000000000000000LL) == 0)
  {
    if ((v25 & 0x1000000000000000LL) != 0)
    {
      BOOL v32 = (unsigned __int8 *)((v27 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }

    else
    {
      uint64_t v86 = sub_1001BEF50();
      BOOL v32 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v86);
    }

    uint64_t v33 = (uint64_t)sub_100161AC4(v32, v30);
    LOBYTE(v25) = v34 & 1;
LABEL_61:
    sub_10001EDA0();
    if ((v25 & 1) != 0) {
      goto LABEL_77;
    }
    uint64_t v57 = sub_10007A010();
    if (String.count.getter(v57, v58) < 3) {
      goto LABEL_77;
    }
    sub_100019320();
    uint64_t v59 = sub_10007A010();
    sub_100083094(v59, v60);
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    sub_100019390();
    if (!v64) {
      goto LABEL_77;
    }
    BOOL v65 = v62 == 80 && v64 == 0xE100000000000000LL;
    if (v65)
    {
      sub_10001EDA0();
    }

    else
    {
      uint64_t v66 = sub_1001BEF50();
      char v68 = sub_100048720(v66, v67, 80LL, 0xE100000000000000LL);
      sub_10001EDA0();
      if ((v68 & 1) == 0)
      {
LABEL_77:
        uint64_t v78 = a2;
LABEL_78:
        swift_bridgeObjectRelease(v78);
        return 0LL;
      }
    }

    sub_100019320();
    uint64_t v69 = sub_10007A010();
    sub_1000B792C(v69, v70);
    uint64_t v72 = v71;
    sub_100019390();
    if (v72)
    {
      uint64_t v73 = String.index(_:offsetBy:)(15LL, 1LL, a1, a2);
      uint64_t v74 = String.subscript.getter(v73, a1, a2);
      uint64_t v76 = v75;
      sub_100019390();
      if (v74 == 84 && v76 == 0xE100000000000000LL)
      {
        swift_bridgeObjectRelease(0xE100000000000000LL);
      }

      else
      {
        sub_100048720(v74, v76, 84LL, 0xE100000000000000LL);
        sub_100023EEC();
      }

      sub_1001BEF50();
      sub_1001BEB18();
      int v80 = v79;
      sub_10001EDA0();
      if (v80 != 7) {
        return v33;
      }
      return 0LL;
    }

    goto LABEL_77;
  }

  uint64_t v89 = v25;
  uint64_t v90 = v27 & 0xFFFFFFFFFFFFFFLL;
  if (v25 != 43)
  {
    if (v25 == 45)
    {
      if (!v29)
      {
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }

      if (v29 != 1)
      {
        sub_10005768C();
        if (!(!v65 & v37))
        {
          if (v35 == 2)
          {
            LOBYTE(v25) = 0;
            uint64_t v33 = -(uint64_t)v36;
            goto LABEL_61;
          }

          if ((BYTE2(v25) - 48) <= 9u)
          {
            uint64_t v33 = -10LL * v36 - (BYTE2(v25) - 48);
            if (v35 == 3) {
              goto LABEL_60;
            }
            while (1)
            {
              sub_100024EAC();
              if (!v65 & v37) {
                break;
              }
              sub_100173D98();
              if (!v65) {
                break;
              }
              uint64_t v33 = v82 - v81;
              if (__OFSUB__(v82, v81)) {
                break;
              }
              sub_1001964F8();
              if (v65) {
                goto LABEL_61;
              }
            }
          }
        }
      }

LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_1001BDFBC(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = a2;
  char v3 = sub_1001BE5DC(a2, (uint64_t)&off_100270840);
  BOOL v4 = (v3 & 1) == 0;
  if ((v3 & 1) != 0) {
    uint64_t v5 = 84LL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (v4) {
    unint64_t v6 = 0xE000000000000000LL;
  }
  else {
    unint64_t v6 = 0xE100000000000000LL;
  }
  unint64_t v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  sub_100023EEC();
  v8._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  String.append(_:)(v8);
  sub_10001A3F8();
  uint64_t v9 = sub_1001BE548(v2);
  sub_100083094(v9, v10);
  uint64_t v12 = v11;
  uint64_t result = sub_10001A3F8();
  if (v12)
  {
    Swift::String v14 = Character.uppercased()();
    sub_100019390();
    String.append(_:)(v14);
    sub_100023EEC();
    return 80LL;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1001BE0AC(uint64_t a1, char a2, uint64_t a3)
{
  if (a1 == a3) {
    __asm { BR              X10 }
  }

  sub_1000193B8();
}

void sub_1001BE220(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_1001BE2B4()
{
  uint64_t v4 = sub_1001BEF38();
  uint64_t v5 = sub_1001BEE5C(v4);
  sub_10001762C(v0, 1LL, 1LL, v5);
  char v17 = v3;
  char v16 = v3;
  char v15 = v3;
  char v14 = v3;
  char v13 = v3;
  char v12 = v3;
  char v11 = v3;
  char v10 = 0;
  char v9 = v3;
  char v8 = v3;
  char v7 = v3;
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, void, uint64_t, void, uint64_t, void, char, void, char, void, char, uint64_t, char, void, char, void, char, void, char, void, char, void, char, void, char, void, char))DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:))( v2,  v0,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v7,  0LL,  v8,  0LL,  v9,  v1,  v10,  0LL,  v11,  0LL,  v12,  0LL,  v13,  0LL,  v14,  0LL,  v15,  0LL,  v16,  0LL,  v17);
}

void sub_1001BE4E8()
{
  uint64_t v1 = sub_1001BEF38();
  uint64_t v2 = sub_1001BEE5C(v1);
  sub_10001762C(v0, 1LL, 1LL, v2);
  sub_1001BEE84();
  JUMPOUT(0x1001BE4C8LL);
}

void sub_1001BE51C()
{
  uint64_t v1 = sub_1001BEF38();
  uint64_t v2 = sub_1001BEE5C(v1);
  sub_10001762C(v0, 1LL, 1LL, v2);
  sub_1001BEE84();
  JUMPOUT(0x1001BE4C0LL);
}

uint64_t sub_1001BE548(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001BE578 + 4 * byte_10020C4C5[a1]))( 0x646E6F636573LL,  0xE600000000000000LL);
}

uint64_t sub_1001BE578()
{
  return 0x6574756E696DLL;
}

uint64_t sub_1001BE588()
{
  return 1920298856LL;
}

uint64_t sub_1001BE598()
{
  return 7954788LL;
}

uint64_t sub_1001BE5A8()
{
  return 1801807223LL;
}

uint64_t sub_1001BE5B8()
{
  return 0x68746E6F6DLL;
}

uint64_t sub_1001BE5CC()
{
  return 1918985593LL;
}

uint64_t sub_1001BE5DC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain(a2);
    __asm { BR              X9 }
  }

  return 0LL;
}

uint64_t sub_1001BE7C0(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v3._uint64_t countAndFlagsBits = 45LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = sub_1001BE548(a2);
  String.append(_:)(v4);
  sub_100019390();
  return v6;
}

uint64_t sub_1001BE830(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v45) = a3;
  uint64_t v44 = a2;
  uint64_t v4 = type metadata accessor for DateComponents(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  Swift::String v43 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  char v9 = (char *)&v41 - v8;
  sub_1000175B0((uint64_t *)&unk_1002AFCD0);
  sub_100043FD8();
  __chkstk_darwin(v10);
  sub_10001DAD0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v48 = *(void *)(v14 - 8);
  sub_100043FD8();
  __chkstk_darwin(v15);
  sub_10001DAD0();
  uint64_t v42 = v17 - v16;
  uint64_t v18 = type metadata accessor for Calendar.Identifier(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_10001DAD0();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_1001BEF38();
  uint64_t v46 = *(void *)(v23 - 8);
  uint64_t v47 = v23;
  sub_100043FD8();
  __chkstk_darwin(v24);
  sub_10001DAD0();
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))( v22,  enum case for Calendar.Identifier.gregorian(_:),  v18);
  Calendar.init(identifier:)(v22);
  uint64_t v25 = v22;
  uint64_t v26 = v4;
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v25, v18);
  sub_1001BE220(v44, v45);
  uint64_t v45 = a1;
  Calendar.date(byAdding:to:wrappingComponents:)(v9, a1, 0LL);
  unint64_t v27 = *(void (**)(uint64_t))(v5 + 8);
  uint64_t v28 = sub_10007A010();
  v27(v28);
  if (sub_10001D158(v13, 1LL, v14) == 1)
  {
    sub_1001BEF40();
    sub_100049980(v13);
    return 0LL;
  }

  else
  {
    uint64_t v30 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32))(v42, v13, v14);
    uint64_t v31 = sub_1000175B0(&qword_1002B9848);
    uint64_t v32 = type metadata accessor for Calendar.Component(0LL);
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
    uint64_t v35 = (v34 + 32) & ~v34;
    uint64_t v36 = swift_allocObject(v31, v35 + *(void *)(v33 + 72), v34 | 7);
    *(_OWORD *)(v36 + 16) = xmmword_1001F3C00;
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))( v36 + v35,  enum case for Calendar.Component.day(_:),  v32);
    sub_100187028();
    char v37 = v43;
    Calendar.dateComponents(_:from:to:)();
    uint64_t v38 = sub_100023EEC();
    uint64_t v39 = DateComponents.day.getter(v38);
    LOBYTE(v32) = v40;
    ((void (*)(char *, uint64_t))v27)(v37, v26);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v30, v14);
    sub_1001BEF40();
    if ((v32 & 1) != 0) {
      return 0LL;
    }
    else {
      return v39;
    }
  }

void sub_1001BEB18()
{
  Swift::String v0 = String.uppercased()();
  if (v0._countAndFlagsBits == 83 && v0._object == (void *)0xE100000000000000LL)
  {
    object = (void *)0xE100000000000000LL;
    goto LABEL_8;
  }

  if ((sub_1001BEEF8(83LL) & 1) != 0)
  {
    object = v0._object;
LABEL_8:
    swift_bridgeObjectRelease(object);
    goto LABEL_9;
  }

  if (v0._countAndFlagsBits == 77 && v0._object == (void *)0xE100000000000000LL)
  {
    object = (void *)0xE100000000000000LL;
    goto LABEL_8;
  }

  if ((sub_1001BEEF8(77LL) & 1) != 0)
  {
    object = v0._object;
    goto LABEL_8;
  }

  if (v0._countAndFlagsBits == 72 && v0._object == (void *)0xE100000000000000LL)
  {
    object = (void *)0xE100000000000000LL;
    goto LABEL_8;
  }

  if ((sub_1001BEEF8(72LL) & 1) != 0)
  {
    object = v0._object;
    goto LABEL_8;
  }

  if (v0._countAndFlagsBits == 68 && v0._object == (void *)0xE100000000000000LL)
  {
    object = (void *)0xE100000000000000LL;
    goto LABEL_8;
  }

  if ((sub_1001BEEF8(68LL) & 1) != 0)
  {
    object = v0._object;
    goto LABEL_8;
  }

  if (v0._countAndFlagsBits == 87 && v0._object == (void *)0xE100000000000000LL)
  {
    object = (void *)0xE100000000000000LL;
    goto LABEL_8;
  }

  if ((sub_1001BEEF8(87LL) & 1) != 0)
  {
    object = v0._object;
    goto LABEL_8;
  }

  if (v0._countAndFlagsBits == 89 && v0._object == (void *)0xE100000000000000LL)
  {
    swift_bridgeObjectRelease(0xE100000000000000LL);
  }

  else
  {
    sub_1001BEEF8(89LL);
    sub_100019390();
  }

unint64_t sub_1001BEC7C(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100270390, v2);
  sub_100019390();
  if (v3 >= 7) {
    return 7LL;
  }
  else {
    return v3;
  }
}

void sub_1001BECC0(char *a1)
{
}

void sub_1001BECCC()
{
}

void sub_1001BECD4(uint64_t a1)
{
}

void sub_1001BECDC(uint64_t a1)
{
}

unint64_t sub_1001BECE4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001BEC7C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001BED10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001BE548(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1001BED38(uint64_t a1, uint64_t *a2)
{
}

uint64_t storeEnumTagSinglePayload for OctaneSubscriptionPeriod.Unit( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_1001BED9C + 4 * byte_10020C4DF[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1001BEDD0 + 4 * byte_10020C4DA[v4]))();
}

uint64_t sub_1001BEDD0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BEDD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BEDE0LL);
  }
  return result;
}

uint64_t sub_1001BEDEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BEDF4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_1001BEDF8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BEE00(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OctaneSubscriptionPeriod.Unit()
{
  return &type metadata for OctaneSubscriptionPeriod.Unit;
}

unint64_t sub_1001BEE20()
{
  unint64_t result = qword_1002B9850[0];
  if (!qword_1002B9850[0])
  {
    unint64_t result = swift_getWitnessTable("MT\b", &type metadata for OctaneSubscriptionPeriod.Unit);
    atomic_store(result, qword_1002B9850);
  }

  return result;
}

uint64_t sub_1001BEE5C(uint64_t a1)
{
  return type metadata accessor for TimeZone(0LL);
}

uint64_t sub_1001BEE84()
{
  return v0;
}

uint64_t sub_1001BEEF8(uint64_t a1)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, 0xE100000000000000LL, v2, v1, 0LL);
}

  ;
}

uint64_t sub_1001BEF38()
{
  return type metadata accessor for Calendar(0LL);
}

uint64_t sub_1001BEF40()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 104) + 8LL))(v0, *(void *)(v1 - 96));
}

uint64_t sub_1001BEF50()
{
  return v0;
}

uint64_t IOError.init(errnoCode:reason:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IOError.reason.getter(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t IOError.init(errnoCode:function:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return StaticString.description.getter(a2, a3, a4);
}

uint64_t sub_1001BEFDC(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = strerror(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    _StringGuts.grow(_:)(18LL);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v18 = a2;
    v7._uint64_t countAndFlagsBits = 8250LL;
    v7._object = (void *)0xE200000000000000LL;
    String.append(_:)(v7);
    v8._uint64_t countAndFlagsBits = String.init(cString:)(v6);
    object = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(object);
    v10._uint64_t countAndFlagsBits = 0x3A6F6E7272652820LL;
    v10._object = (void *)0xE900000000000020LL;
    String.append(_:)(v10);
    v11._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    uint64_t v12 = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(v12);
    v13._uint64_t countAndFlagsBits = 41LL;
    v13._object = (void *)0xE100000000000000LL;
    String.append(_:)(v13);
  }

  else
  {
    _StringGuts.grow(_:)(38LL);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v18 = a2;
    v14._object = (void *)0x8000000100222890LL;
    v14._uint64_t countAndFlagsBits = 0xD000000000000022LL;
    String.append(_:)(v14);
    v15._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    uint64_t v16 = v15._object;
    String.append(_:)(v15);
    swift_bridgeObjectRelease(v16);
  }

  return v18;
}

uint64_t sub_1001BF164()
{
  return IOError.localizedDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned int *)(v0 + 16));
}

uint64_t sub_1001BF174(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for IOError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for IOError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IOError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IOError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 20))
    {
      LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IOError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 20) = 1;
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

    *(_BYTE *)(result + 20) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for IOError()
{
  return &type metadata for IOError;
}

uint64_t sub_1001BF2E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for IOError.FailureDescription(uint64_t a1)
{
  return sub_1001BF304(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(_BYTE *)(a1 + 17));
}

uint64_t sub_1001BF304(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t _s25ASOctaneSupportXPCService7IOErrorV18FailureDescriptionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  sub_1001BF2E0(*(void *)a2, v4, v6, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = v5;
  return a1;
}

uint64_t assignWithCopy for IOError.FailureDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  sub_1001BF2E0(*(void *)a2, v4, v6, v5);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(_BYTE *)(a1 + 17);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  uint64_t v10 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = v5;
  sub_1001BF304(v7, v8, v10, v9);
  return a1;
}

__n128 initializeWithTake for IOError.FailureDescription(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IOError.FailureDescription(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  char v4 = *(_BYTE *)(a2 + 17);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(_BYTE *)(a1 + 17);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 17) = v4;
  sub_1001BF304(v5, v6, v8, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for IOError.FailureDescription(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 18))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IOError.FailureDescription( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 18) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 18) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 17) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1001BF4C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 17);
}

uint64_t sub_1001BF4CC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 17) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IOError.FailureDescription()
{
  return &type metadata for IOError.FailureDescription;
}

_DWORD *initializeBufferWithCopyOfBuffer for IOError.Error(_DWORD *result, _DWORD *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for IOError.Error()
{
  return &type metadata for IOError.Error;
}

uint64_t _s25ASOctaneSupportXPCService7IOErrorV20localizedDescriptionSSvg_0(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1001BEFDC(a3, a1, a2);
}

void NIOSingleStepByteToMessageDecoder.decode(context:buffer:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = (char *)a2;
  v20[1] = a1;
  v20[0] = *(void *)(a4 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v20[0],  a3,  &protocol requirements base descriptor for ByteToMessageDecoder,  &associated type descriptor for ByteToMessageDecoder.InboundOut);
  uint64_t v8 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v9 = *(void *)(v8 - 8);
  sub_100067F88();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v21 = AssociatedTypeWitness;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  sub_100067F88();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v20 - v15;
  uint64_t v17 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 16))(v22, a3, a4);
  if (!v17)
  {
    uint64_t v22 = v16;
    uint64_t v24 = v4;
    uint64_t v18 = v21;
    if (sub_10001D158((uint64_t)v12, 1LL, v21) == 1)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }

    else
    {
      uint64_t v19 = (uint64_t)v22;
      sub_1001C0404((uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
      ByteToMessageDecoder.wrapInboundOut(_:)(v19, a3, v20[0]);
      ChannelHandlerContext.fireChannelRead(_:)();
      sub_1000324E8((uint64_t)v23);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v18);
    }
  }

  sub_10001DAB8();
}

void NIOSingleStepByteToMessageDecoder.decodeLast(context:buffer:seenEOF:)( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v23 = a3;
  uint64_t v21 = a1;
  uint64_t v22 = *(void *)(a5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v22,  a4,  &protocol requirements base descriptor for ByteToMessageDecoder,  &associated type descriptor for ByteToMessageDecoder.InboundOut);
  uint64_t v9 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v10 = *(void *)(v9 - 8);
  sub_100067F88();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  sub_100067F88();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v21 - v16;
  uint64_t v18 = v24;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a5 + 24))(a2, v23, a4, a5);
  if (!v18)
  {
    uint64_t v24 = v14;
    uint64_t v19 = v22;
    if (sub_10001D158((uint64_t)v13, 1LL, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }

    else
    {
      uint64_t v20 = v24;
      sub_1001C0404((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 32));
      ByteToMessageDecoder.wrapInboundOut(_:)((uint64_t)v17, a4, v19);
      ChannelHandlerContext.fireChannelRead(_:)();
      sub_1000324E8((uint64_t)v25);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v17, AssociatedTypeWitness);
    }
  }

  sub_10001DAB8();
}

void NIOSingleStepByteToMessageProcessor.__allocating_init(_:maximumBufferSize:)( uint64_t a1, uint64_t a2, char a3)
{
  char v6 = a3 & 1;
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  NIOSingleStepByteToMessageProcessor.init(_:maximumBufferSize:)(a1, a2, v6);
  sub_1000193B8();
}

void NIOSingleStepByteToMessageProcessor.init(_:maximumBufferSize:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = *v3;
  char v7 = (uint64_t *)((char *)v3 + *(void *)(*v3 + 112));
  *char v7 = 0LL;
  v7[1] = 0LL;
  *(void *)((char *)v7 + 15) = 0LL;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 80) - 8LL) + 32LL))( (uint64_t)v3 + *(void *)(*v3 + 96),  a1);
  uint64_t v8 = (uint64_t)v3 + *(void *)(*v3 + 104);
  *(void *)uint64_t v8 = a2;
  *(_BYTE *)(v8 + 8) = a3 & 1;
  sub_1000193B8();
}

uint64_t sub_1001BF8DC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v7 = HIDWORD(a3);
  uint64_t v8 = v3 + *(void *)(*(void *)v3 + 112LL);
  swift_beginAccess(v8, v21, 1LL, 0LL);
  uint64_t result = *(void *)v8;
  if (!*(void *)v8) {
    goto LABEL_5;
  }
  unsigned int v10 = *(_DWORD *)(v8 + 8);
  unsigned int v11 = *(_DWORD *)(v8 + 12);
  if (v11 < v10)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if (v11 == v10)
  {
LABEL_5:
    *(void *)uint64_t v8 = a1;
    *(void *)(v8 + 8) = a2;
    *(_DWORD *)(v8 + 16) = a3;
    *(_BYTE *)(v8 + 22) = BYTE6(a3);
    *(_WORD *)(v8 + 20) = v7;
    swift_release();
    return swift_retain();
  }

  uint64_t result = swift_beginAccess(v8, v20, 33LL, 0LL);
  if (!*(void *)v8) {
    goto LABEL_14;
  }
  Swift::UInt32 v12 = *(_DWORD *)(v8 + 12);
  uint64_t result = swift_beginAccess(a1 + 24, v19, 0LL, 0LL);
  unsigned int v13 = HIDWORD(a2) - a2;
  uint64_t v14 = *(void *)(a1 + 24) + (BYTE6(a3) | ((unint64_t)(unsigned __int16)v7 << 8)) + a2;
  uint64_t v15 = v14 + v13;
  swift_retain();
  uint64_t result = ByteBuffer._setBytes(_:at:)(v14, v15, v12);
  int v16 = *(_DWORD *)(v8 + 12);
  BOOL v17 = __CFADD__(v16, (_DWORD)result);
  int v18 = v16 + result;
  if (v17)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }

  *(_DWORD *)(v8 + 12) = v18;
  swift_endAccess(v20);
  return swift_release();
}

uint64_t sub_1001BFA20@<X0>(void (*a1)(uint64_t *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v5 = *v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  *(void *)(*(void *)(*v2 + 88) + 8LL),  *(void *)(*v2 + 80),  &protocol requirements base descriptor for ByteToMessageDecoder,  &associated type descriptor for ByteToMessageDecoder.InboundOut);
  uint64_t v7 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unsigned int v10 = &v22[-v9];
  unsigned int v11 = (uint64_t *)((char *)v2 + *(void *)(v5 + 112));
  uint64_t result = swift_beginAccess(v11, v22, 1LL, 0LL);
  if (!*v11) {
    return sub_10001762C(a2, 1LL, 1LL, AssociatedTypeWitness);
  }
  __int16 v13 = *((_WORD *)v11 + 10);
  unsigned int v15 = *((_DWORD *)v11 + 3);
  int v14 = *((_DWORD *)v11 + 4);
  unsigned int v16 = *((_DWORD *)v11 + 2);
  char v17 = *((_BYTE *)v11 + 22);
  uint64_t v23 = *v11;
  unint64_t v24 = __PAIR64__(v15, v16);
  int v25 = v14;
  __int16 v26 = v13;
  char v27 = v17;
  if (v15 < v16)
  {
    __break(1u);
    return result;
  }

  if (v15 == v16) {
    return sub_10001762C(a2, 1LL, 1LL, AssociatedTypeWitness);
  }
  *unsigned int v11 = 0LL;
  v11[1] = 0LL;
  *(uint64_t *)((char *)v11 + 15) = 0LL;
  v28(&v23);
  if (v3) {
    return swift_release();
  }
  unint64_t v18 = v24;
  int v19 = v25;
  __int16 v20 = v26;
  char v21 = v27;
  *unsigned int v11 = v23;
  v11[1] = v18;
  *((_BYTE *)v11 + 22) = v21;
  *((_WORD *)v11 + 10) = v20;
  *((_DWORD *)v11 + 4) = v19;
  swift_release();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
}

uint64_t sub_1001BFBB8(char a1, int a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v61 = a4;
  uint64_t v62 = a3;
  int v58 = a2;
  uint64_t v7 = *(void **)v4;
  uint64_t v8 = v7[11];
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v57 = v7[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v9,  v57,  &protocol requirements base descriptor for ByteToMessageDecoder,  &associated type descriptor for ByteToMessageDecoder.InboundOut);
  uint64_t v11 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v55 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  int v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v56 = (char *)&v54 - v16;
  uint64_t v60 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  int v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17);
  unsigned __int8 v54 = (char *)&v54 - v21;
  if ((a1 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v22 = &v5[v7[14]];
  uint64_t v20 = swift_beginAccess(v22, v63, 0LL, 0LL);
  if (*(void *)v22)
  {
    unsigned int v23 = *((_DWORD *)v22 + 2);
    unsigned int v24 = *((_DWORD *)v22 + 3);
    if (v24 >= v23)
    {
      if (v24 == v23)
      {
        unint64_t v25 = *((unsigned int *)v22 + 4) | ((unint64_t)(*((unsigned __int16 *)v22 + 10) | (v22[22] << 16)) << 32);
        uint64_t v26 = HIDWORD(v25) & 0xFFFFFF;
        char v27 = BYTE6(v25);
        int32x2_t v28 = vdup_n_s32(v23);
        uint64_t v29 = *(void *)v22;
        goto LABEL_12;
      }

uint64_t sub_1001C00AC(uint64_t a1, uint64_t *a2, char a3, char a4)
{
  uint64_t v6 = *(void *)(*a2 + 80);
  uint64_t v7 = *(void *)(*a2 + 88);
  uint64_t v8 = (char *)a2 + *(void *)(*a2 + 96);
  if ((a3 & 1) != 0)
  {
    swift_beginAccess(v8, v11, 33LL, 0LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 24))(a1, a4 & 1, v6, v7);
  }

  else
  {
    swift_beginAccess(v8, v11, 33LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, v6, v7);
  }

  swift_endAccess(v11);
  return sub_1001C0198(a1, a2);
}

uint64_t sub_1001C0198(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  uint64_t v3 = *(unsigned int *)(result + 12);
  if (v3 < v2)
  {
    __break(1u);
  }

  else if ((_DWORD)v3 != (_DWORD)v2)
  {
    uint64_t v4 = *a2;
    uint64_t v13 = *(unsigned int *)(result + 16);
    uint64_t v5 = *(unsigned __int16 *)(result + 20);
    uint64_t v6 = *(unsigned __int8 *)(result + 22);
    swift_beginAccess((char *)a2 + *(void *)(*a2 + 96), v14, 33LL, 0LL);
    uint64_t v8 = v4 + 80;
    uint64_t v7 = *(void *)(v4 + 80);
    uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 8LL);
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
    uint64_t v11 = swift_retain();
    char v12 = v10(v11, v2 | (v3 << 32), v13 | (v5 << 32) | (v6 << 48), v7, v9);
    swift_endAccess(v14);
    uint64_t result = swift_release();
    if ((v12 & 1) != 0) {
      return ByteBuffer.discardReadBytes()();
    }
  }

  return result;
}

uint64_t NIOSingleStepByteToMessageProcessor.deinit()
{
  return v0;
}

uint64_t NIOSingleStepByteToMessageProcessor.__deallocating_deinit()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t NIOSingleStepByteToMessageProcessor.process(buffer:_:)( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5)
{
  return sub_1001BFBB8(0, 0, a4, a5);
}

uint64_t NIOSingleStepByteToMessageProcessor.finishProcessing(seenEOF:_:)( int a1, void (*a2)(char *), uint64_t a3)
{
  return sub_1001BFBB8(1, a1, a2, a3);
}

uint64_t sub_1001C0354(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "\t";
    v4[2] = &unk_10020C750;
    uint64_t result = swift_initClassMetadata2(a1, 0LL, 3LL, v4, a1 + 96);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for NIOSingleStepByteToMessageProcessor( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002A160(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NIOSingleStepByteToMessageProcessor);
}

uint64_t sub_1001C03E4(uint64_t a1)
{
  return sub_1001C00AC(a1, *(uint64_t **)(v1 + 16), *(_BYTE *)(v1 + 24), *(_BYTE *)(v1 + 25));
}

uint64_t sub_1001C0404@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v3, v2);
}

#error "1001C0450: call analysis failed (funcsize=132)"
double sub_1001C0640()
{
  _OWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void v43[3];
  _BYTE v44[8];
  uint64_t v45;
  uint64_t v46;
  __n128 v47;
  _BYTE v48[80];
  _BYTE v49[16];
  uint64_t v50;
  uint64_t v51;
  uint64_t v3 = sub_1001C492C();
  sub_1001C48A8(v3, (uint64_t)v48);
  sub_1001C48A8((uint64_t)v48, (uint64_t)v49);
  if (v50)
  {
    uint64_t v4 = sub_1001C47F8();
    uint64_t v6 = v5;
    sub_1001C4998(v4, &v47);
    sub_1001C487C(&v47);
    if (v51)
    {
      uint64_t v7 = sub_1001C4874();
      sub_1001793E0(v7);
      sub_1001C485C();
      sub_1001C44E8();
      sub_1001C4704((uint64_t)&type metadata for StatusRequest, v4, v6);
      if (v1)
      {
LABEL_4:
        sub_100024F0C();
        if (qword_1002A8D90 != -1) {
          swift_once(&qword_1002A8D90, sub_100183E34);
        }
        uint64_t v8 = sub_100077D08();
        sub_100018F68(v8, (uint64_t)qword_1002EB9D0);
        sub_1001C4740();
        sub_1001C4740();
        sub_1001C4740();
        sub_10002A710();
        sub_1001C4740();
        uint64_t v9 = sub_10002A710();
        unsigned int v10 = Logger.logObject.getter(v9);
        char v12 = sub_1001C4990(v10, v11);
        if (sub_1001C484C(v12))
        {
          uint64_t v13 = sub_100019464(32LL);
          char v40 = sub_100019464(96LL);
          unsigned int v46 = v40;
          *(_DWORD *)uint64_t v13 = 136446722;
          int v14 = swift_bridgeObjectRetain();
          BOOL v45 = sub_1001C48E0(v14, v15, &v46);
          sub_1001C46E4((uint64_t)&v45);
          sub_100023EEC();
          sub_1001C4658();
          sub_1001C4658();
          uint64_t v16 = sub_1001C47B0();
          BOOL v45 = sub_1001C4818(v16, v17, v18, v19, v20, v21, v22, v23, v36, v4, v40);
          sub_1001C476C((uint64_t)&v45);
          sub_10001EDA0();
          sub_1001C4658();
          sub_1001C4658();
          *(_WORD *)(v13 + 22) = v4;
          swift_getErrorValue(v1, v44, v43);
          unsigned int v24 = Error.localizedDescription.getter(v43[1], v43[2]);
          BOOL v45 = sub_1001C4818(v24, v25, v26, v27, v28, v29, v30, v31, v37, v38, v41);
          sub_1001C476C((uint64_t)&v45);
          sub_10001EDA0();
          sub_10002A47C();
          sub_10002A47C();
          sub_1001C479C( (void *)&_mh_execute_header,  v32,  v33,  "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
          sub_1001C48A0(v42);
          sub_10001A408(v42);
          sub_10001A408(v13);
          sub_10003A9EC(v39, v6);

          sub_10002A47C();
        }

        else
        {
          sub_100042958();
          sub_10002A47C();
          sub_1001C4658();
          sub_1001C4658();
          sub_1001C4658();
          sub_1001C4658();
          sub_10002A47C();
          sub_10002A47C();
        }

        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v34 = sub_1001C486C();
      sub_1001793E0(v34);
      sub_1001C4864();
      sub_1001C44E8();
      sub_1001C4710((uint64_t)&type metadata for StatusRequest, v4, v6);
      if (v1) {
        goto LABEL_4;
      }
    }

    sub_100042958();
    sub_100024F0C();
    return result;
  }

void sub_1001C0904()
{
  uint64_t v3 = sub_1001C492C();
  sub_1001C48A8(v3, (uint64_t)v107);
  sub_1001C48A8((uint64_t)v107, (uint64_t)v109);
  if (!v110)
  {
LABEL_11:
    sub_1001C4264(v105);
    sub_1001C4578((uint64_t)v105, v0, &qword_1002AECA8);
    goto LABEL_12;
  }

  sub_1001C493C((uint64_t)v108);
  uint64_t v4 = sub_1000ACD2C();
  uint64_t v6 = v5;
  sub_1001C4998(v4, &v106);
  sub_1001C487C(&v106);
  if (v111)
  {
    uint64_t v7 = sub_1001C4874();
    sub_1001793E0(v7);
    sub_1001C485C();
    sub_1001C426C();
    sub_1001C4704((uint64_t)&type metadata for InAppBuyRequest, v4, v6);
    if (v1)
    {
LABEL_4:
      sub_100024F0C();
      if (qword_1002A8D90 != -1) {
        swift_once(&qword_1002A8D90, sub_100183E34);
      }
      uint64_t v8 = sub_100077D08();
      sub_100018F68(v8, (uint64_t)qword_1002EB9D0);
      sub_1001C4740();
      sub_1001C4740();
      sub_1001C4740();
      sub_10002A710();
      sub_1001C4740();
      uint64_t v9 = sub_10002A710();
      uint64_t v10 = Logger.logObject.getter(v9);
      os_log_type_t v12 = sub_1001C4990(v10, v11);
      if (sub_1001C484C(v12))
      {
        uint64_t v13 = sub_100019464(32LL);
        uint64_t v80 = sub_100019464(96LL);
        v105[0] = v80;
        uint64_t v14 = sub_1001C4830(4.8754e-34);
        uint64_t v16 = sub_1001C48E0(v14, v15, v105);
        sub_1001C463C(v16, v17, v18, v13 + 12, v19, v20, v21, v22);
        sub_100023EEC();
        sub_1001C4658();
        sub_1001C4658();
        uint64_t v23 = sub_1001C47B0();
        uint64_t v31 = sub_1001C4818(v23, v24, v25, v26, v27, v28, v29, v30, v4, v80, v86);
        sub_1001C46F0(v31, v32, v33, v13 + 22, v34, v35, v36, v37, v75, v81, v87, v92, v95, v98, v101, v103);
        sub_10001EDA0();
        sub_1001C4658();
        uint64_t v38 = sub_1001C4658();
        *(_WORD *)(v13 + 22) = v4;
        uint64_t v41 = sub_1001C4730((uint64_t)v38, v39, v40);
        uint64_t v49 = sub_1001C47EC(v41, v42, v43, v44, v45, v46, v47, v48, v76, v82, v88, v93, v96, v99);
        uint64_t v57 = sub_1001C4818(v49, v50, v51, v52, v53, v54, v55, v56, v77, v83, v89);
        sub_1001C46F0(v57, v58, v59, v13 + 32, v60, v61, v62, v63, v78, v84, v90, v94, v97, v100, v102, v104);
        sub_10001EDA0();
        sub_10002A47C();
        sub_10002A47C();
        sub_1001C479C( (void *)&_mh_execute_header,  v64,  v65,  "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        sub_1001C48A0(v85);
        sub_10001A408(v85);
        uint64_t v66 = sub_10001A408(v13);
        sub_1001C49B4(v66, v67, v68, v69, v70, v71, v72, v73, v79, v85, v91);

        sub_10002A47C();
      }

      else
      {
        sub_100042958();
        sub_10002A47C();
        sub_1001C4658();
        sub_1001C4658();
        sub_1001C4658();
        sub_1001C4658();
        sub_10002A47C();
        sub_10002A47C();
      }

      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v74 = sub_1001C486C();
    sub_1001793E0(v74);
    sub_1001C4864();
    sub_1001C426C();
    sub_1001C4710((uint64_t)&type metadata for InAppBuyRequest, v4, v6);
    if (v1) {
      goto LABEL_4;
    }
  }

  sub_100042958();
  sub_100024F0C();
  debugOnly(_:)(v0);
LABEL_12:
  sub_10002A580();
}

uint64_t sub_1001C0B84()
{
  uint64_t v3 = sub_1001C49A8();
  sub_1001C47D0(v3, (uint64_t)v121);
  sub_1001C47D0((uint64_t)v121, (uint64_t)v123);
  if (!v124)
  {
LABEL_11:
    uint64_t v117 = 0LL;
    uint64_t v118 = 0LL;
    char v119 = 0;
    return v117;
  }

  sub_1001C493C((uint64_t)v122);
  uint64_t v4 = sub_1000ACD2C();
  uint64_t v6 = v5;
  sub_100178A98(v1, &v120);
  sub_1001C487C(&v120);
  if (v125)
  {
    uint64_t v7 = sub_1001C4874();
    sub_1001793E0(v7);
    sub_1001C485C();
    sub_1001C42E4();
    sub_1001C4704((uint64_t)&type metadata for RefundRequestRequest, v4, v6);
    if (v0)
    {
LABEL_4:
      sub_100024F0C();
      if (qword_1002A8D90 != -1) {
        swift_once(&qword_1002A8D90, sub_100183E34);
      }
      uint64_t v8 = sub_100077D08();
      sub_100018F68(v8, (uint64_t)qword_1002EB9D0);
      sub_1001C4690();
      sub_1001C4690();
      sub_1001C4690();
      sub_10002A710();
      sub_1001C4690();
      uint64_t v9 = sub_10002A710();
      uint64_t v10 = Logger.logObject.getter(v9);
      os_log_type_t v12 = sub_1001C4924(v10, v11);
      if (sub_100092FC4(v12))
      {
        uint64_t v13 = sub_100019464(32LL);
        uint64_t v99 = sub_100019464(96LL);
        uint64_t v116 = v99;
        uint64_t v14 = sub_1001C4678(4.8754e-34);
        uint64_t v16 = sub_1001C4824(v14, v15, &v116);
        sub_1001C463C(v16, v17, v18, v13 + 12, v19, v20, v21, v22);
        sub_100056ADC();
        sub_10003A3EC();
        sub_10003A3EC();
        uint64_t v23 = sub_1001C46D0();
        uint64_t v31 = sub_1001C4698(v23, v24, v25, v26, v27, v28, v29, v30, v86, v6);
        sub_1001C4748(v31, v32, v33, v34, v35, v36, v37, v38, v87, v93, v99, v103, v106, v109, v112, v114);
        sub_10001EDA0();
        sub_10003A3EC();
        uint64_t v39 = sub_10003A3EC();
        *(_WORD *)(v13 + 22) = v6;
        uint64_t v42 = sub_1001C4730((uint64_t)v39, v40, v41);
        uint64_t v50 = sub_1001C47EC(v42, v43, v44, v45, v46, v47, v48, v49, v88, v94, v100, v104, v107, v110);
        uint64_t v58 = sub_1001C4698(v50, v51, v52, v53, v54, v55, v56, v57, v89, v95);
        sub_1001C4784(v58, v59, v60, v61, v62, v63, v64, v65, v90, v96, v101, v105, v108, v111, v113, v115);
        sub_10001EDA0();
        sub_10002A47C();
        sub_10002A47C();
        sub_1001C471C( (void *)&_mh_execute_header,  v66,  v67,  "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        sub_1001C47D8(v68, v69, v70, v71, v72, v73, v74, v75, v91, v97, v102);
        sub_10001A408(v6);
        uint64_t v76 = sub_10001A408(v13);
        sub_1001C4908(v76, v77, v78, v79, v80, v81, v82, v83, v92, v98);

        sub_10002A47C();
      }

      else
      {
        sub_1001C46C4();
        sub_10002A47C();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10002A47C();
        sub_10002A47C();
      }

      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v84 = sub_1001C486C();
    sub_1001793E0(v84);
    sub_1001C4864();
    sub_1001C42E4();
    sub_1001C4710((uint64_t)&type metadata for RefundRequestRequest, v4, v6);
    if (v0) {
      goto LABEL_4;
    }
  }

  sub_1001C46C4();
  sub_100024F0C();
  return v117;
}

uint64_t sub_1001C0DF4()
{
  uint64_t v4 = sub_1001C49A8();
  sub_1001C47D0(v4, (uint64_t)v47);
  sub_1001C47D0((uint64_t)v47, (uint64_t)v48);
  if (!v49)
  {
LABEL_11:
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    return v44;
  }

  uint64_t v5 = sub_1001C47F8();
  uint64_t v7 = v6;
  sub_100178A98(v1, &v46);
  sub_1001C487C(&v46);
  if (v50)
  {
    uint64_t v8 = sub_1001C4874();
    sub_1001793E0(v8);
    sub_1001C485C();
    sub_1001C43D0();
    sub_1001C4704((uint64_t)&type metadata for DisableSubscriptionRequest, v5, v7);
    if (v0)
    {
LABEL_4:
      sub_100024F0C();
      if (qword_1002A8D90 != -1) {
        swift_once(&qword_1002A8D90, sub_100183E34);
      }
      uint64_t v9 = sub_100077D08();
      sub_100018F68(v9, (uint64_t)qword_1002EB9D0);
      sub_1001C4690();
      sub_1001C4690();
      sub_1001C4690();
      sub_10002A710();
      sub_1001C4690();
      uint64_t v10 = sub_10002A710();
      uint64_t v11 = Logger.logObject.getter(v10);
      os_log_type_t v13 = sub_1001C4924(v11, v12);
      if (sub_100092FC4(v13))
      {
        uint64_t v14 = sub_100019464(32LL);
        uint64_t v39 = sub_100019464(96LL);
        v43[0] = v39;
        uint64_t v15 = sub_1001C4678(4.8754e-34);
        uint64_t v42 = sub_1001C4824(v15, v16, v43);
        sub_1001C46E4((uint64_t)&v42);
        sub_100056ADC();
        sub_10003A3EC();
        sub_10003A3EC();
        uint64_t v17 = sub_1001C46D0();
        uint64_t v42 = sub_1001C4970(v17, v18, v19, v20, v21, v22, v23, v24, v7);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v3);
        sub_10001EDA0();
        sub_10003A3EC();
        sub_10003A3EC();
        *(_WORD *)(v14 + 22) = v7;
        swift_getErrorValue(v0, v41, v40);
        uint64_t v25 = Error.localizedDescription.getter(v40[1], v40[2]);
        uint64_t v42 = sub_1001C4970(v25, v26, v27, v28, v29, v30, v31, v32, v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v14 + 24);
        sub_10001EDA0();
        sub_10002A47C();
        sub_10002A47C();
        sub_1001C471C( (void *)&_mh_execute_header,  v33,  v34,  "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        sub_1001C48A0(v39);
        sub_10001A408(v39);
        sub_10001A408(v14);
        sub_10003A9EC(v5, v38);

        sub_10002A47C();
      }

      else
      {
        sub_1001C46C4();
        sub_10002A47C();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10003A3EC();
        sub_10002A47C();
        sub_10002A47C();
      }

      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v35 = sub_1001C486C();
    sub_1001793E0(v35);
    sub_1001C4864();
    sub_1001C43D0();
    sub_1001C4710((uint64_t)&type metadata for DisableSubscriptionRequest, v5, v7);
    if (v0) {
      goto LABEL_4;
    }
  }

  sub_1001C46C4();
  sub_100024F0C();
  return v44;
}

double sub_1001C10B0@<D0>(uint64_t a1@<X8>)
{
  if (*(void *)v14)
  {
    __int128 v11 = v13;
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v14;
    *(void *)&v12[15] = *(void *)&v14[15];
    uint64_t v3 = sub_1000ACD2C();
    unint64_t v5 = v4;
    sub_100178A98(v1, &v9);
    sub_100178A98(&v9, &v15);
    if (v15.n128_u64[1])
    {
      uint64_t v6 = type metadata accessor for PropertyListDecoder(0LL);
      swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
      PropertyListDecoder.init()();
      sub_1001C34D8();
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)( &type metadata for TransactionHistoryRequest,  v3,  v5,  &type metadata for TransactionHistoryRequest);
    }

    else
    {
      uint64_t v7 = type metadata accessor for JSONDecoder(0LL);
      swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
      JSONDecoder.init()();
      sub_1001C34D8();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)( &type metadata for TransactionHistoryRequest,  v3,  v5,  &type metadata for TransactionHistoryRequest);
    }

    sub_10003A9EC(v3, v5);
    swift_release();
  }

  else
  {
    *(void *)(a1 + 96) = 0LL;
    double result = 0.0;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

double sub_1001C14D4()
{
  uint64_t v115 = v3;
  uint64_t v116 = v4;
  uint64_t v5 = sub_1001C492C();
  sub_1001C48A8(v5, (uint64_t)v113);
  sub_1001C48A8((uint64_t)v113, (uint64_t)v114);
  if (!v114[2])
  {
LABEL_11:
    char v111 = 0;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    goto LABEL_12;
  }

  uint64_t v6 = sub_1001C46A4();
  uint64_t v8 = v7;
  sub_1001C4998(v6, &v112);
  sub_1001C487C(&v112);
  if (v114[6])
  {
    uint64_t v9 = sub_1001C4874();
    sub_1001793E0(v9);
    sub_1001C485C();
    sub_1001C4160();
    sub_1001C4704((uint64_t)&type metadata for PriceIncreaseHelperRoute.Request, v6, v8);
    if (v1)
    {
LABEL_4:
      sub_100024F0C();
      if (qword_1002A8D90 != -1) {
        swift_once(&qword_1002A8D90, sub_100183E34);
      }
      uint64_t v10 = sub_100077D08();
      sub_100018F68(v10, (uint64_t)qword_1002EB9D0);
      sub_1001C4740();
      sub_1001C4740();
      sub_1001C4740();
      sub_10002A710();
      sub_1001C4740();
      uint64_t v11 = sub_10002A710();
      uint64_t v12 = Logger.logObject.getter(v11);
      os_log_type_t v14 = sub_1001C4990(v12, v13);
      if (sub_1001C484C(v14))
      {
        uint64_t v15 = sub_100019464(32LL);
        uint64_t v85 = sub_100019464(96LL);
        uint64_t v108 = v85;
        uint64_t v16 = sub_1001C4830(4.8754e-34);
        uint64_t v18 = sub_1001C48E0(v16, v17, &v108);
        sub_1001C463C(v18, v19, v20, v15 + 12, v21, v22, v23, v24);
        sub_100023EEC();
        sub_1001C4658();
        sub_1001C4658();
        uint64_t v25 = sub_1001C47B0();
        uint64_t v33 = sub_1001C4698(v25, v26, v27, v28, v29, v30, v31, v32, v6, v85);
        sub_1001C46F0(v33, v34, v35, v15 + 22, v36, v37, v38, v39, v80, v86, v91, v95, v98, v101, v104, v106);
        sub_10001EDA0();
        sub_1001C4658();
        uint64_t v40 = sub_1001C4658();
        *(_WORD *)(v15 + 22) = v6;
        uint64_t v43 = sub_1001C4730((uint64_t)v40, v41, v42);
        uint64_t v51 = sub_1001C47EC(v43, v44, v45, v46, v47, v48, v49, v50, v81, v87, v92, v96, v99, v102);
        uint64_t v59 = sub_1001C4698(v51, v52, v53, v54, v55, v56, v57, v58, v82, v88);
        sub_1001C46F0(v59, v60, v61, v15 + 32, v62, v63, v64, v65, v83, v89, v93, v97, v100, v103, v105, v107);
        sub_10001EDA0();
        sub_10002A47C();
        sub_10002A47C();
        sub_1001C479C( (void *)&_mh_execute_header,  v66,  v67,  "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        sub_1001C48A0(v90);
        sub_10001A408(v90);
        uint64_t v68 = sub_10001A408(v15);
        sub_1001C49B4(v68, v69, v70, v71, v72, v73, v74, v75, v84, v90, v94);

        sub_10002A47C();
      }

      else
      {
        sub_100042958();
        sub_10002A47C();
        sub_1001C4658();
        sub_1001C4658();
        sub_1001C4658();
        sub_1001C4658();
        sub_10002A47C();
        sub_10002A47C();
      }

      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v76 = sub_1001C486C();
    sub_1001793E0(v76);
    sub_1001C4864();
    sub_1001C4160();
    sub_1001C4710((uint64_t)&type metadata for PriceIncreaseHelperRoute.Request, v6, v8);
    if (v1) {
      goto LABEL_4;
    }
  }

  sub_100042958();
  sub_100024F0C();
LABEL_12:
  char v77 = v111;
  double result = *(double *)&v109;
  __int128 v79 = v110;
  *(_OWORD *)uint64_t v0 = v109;
  *(_OWORD *)(v0 + 16) = v79;
  *(_BYTE *)(v0 + 32) = v77;
  return result;
}

#error "1001C1788: call analysis failed (funcsize=132)"
void *sub_1001C1978(unint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *result;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v6)
  {
    while (1)
    {
      double result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v6);
      if (v6 < 0) {
        break;
      }
      uint64_t v8 = 0LL;
      uint64_t v17 = v5 & 0xC000000000000001LL;
      uint64_t v9 = v5;
      while (v6 != v8)
      {
        if (v17) {
          uint64_t v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v5);
        }
        else {
          uint64_t v10 = *(id *)(v5 + 8 * v8 + 32);
        }
        uint64_t v11 = v10;
        ++v8;
        sub_100019F58(a2 + 11, a2[14]);
        sub_100019F58(a2 + 6, a2[9]);
        sub_100075EE8(a3, a4);
        uint64_t v12 = sub_1001C25DC(v11);

        uint64_t v13 = swift_release();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
        os_log_type_t v14 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
        uint64_t v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
        specialized ContiguousArray._endMutation()(v15);
        uint64_t v5 = v9;
        if (v6 == v8) {
          goto LABEL_16;
        }
      }

      __break(1u);
LABEL_12:
      if (v5 < 0) {
        uint64_t v16 = v5;
      }
      else {
        uint64_t v16 = v5 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v16);
      swift_bridgeObjectRelease();
      if (!v6) {
        goto LABEL_16;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void sub_1001C1B3C(const void *a1)
{
  uint64_t v4 = sub_1001C48D8();
  sub_1001793E0(v4);
  sub_1001C48D0();
  sub_1001C47C4();
  sub_1001C48EC();
  sub_1001C4448();
  uint64_t v5 = sub_1001C48C8();
  if (v1)
  {
    sub_10002A47C();
    sub_1001C4660();
    sub_100024F0C();
  }

  else
  {
    sub_100196FCC(v5, v6);
    sub_1001C4618();
    sub_100024F0C();
    sub_100196FD8();
  }

  sub_1001C4484((uint64_t)a1);
  sub_1001C45E0();
  sub_10002A3D4();
}

void sub_1001C1BEC()
{
  uint64_t v2 = sub_1001C48D8();
  sub_1001793E0(v2);
  sub_1001C48D0();
  sub_1001C47C4();
  sub_1001C48EC();
  sub_1001C440C();
  uint64_t v3 = sub_1001C48C8();
  if (v0)
  {
    sub_10002A47C();
    sub_1001C4660();
    sub_100023EEC();
    sub_100024F0C();
  }

  else
  {
    sub_100196FCC(v3, v4);
    sub_1001C4618();
    sub_100024F0C();
    sub_100196FD8();
    sub_100023EEC();
  }

  sub_1001C45E0();
  sub_10002A3D4();
}

void sub_1001C1C90()
{
  uint64_t v2 = sub_1001C48D8();
  sub_1001793E0(v2);
  sub_1001C48D0();
  sub_1001C47C4();
  sub_1001C48EC();
  sub_1001C42A8();
  uint64_t v3 = sub_1001C48C8();
  if (v0)
  {
    sub_10002A47C();
    sub_1001C4660();
    sub_100024F0C();
  }

  else
  {
    uint64_t v5 = v3;
    unint64_t v6 = v4;
    sub_10003AA88(v3, v4);
    sub_1001C4760(v5, v6);
    sub_100024F0C();
    sub_10003A9EC(v5, v6);
  }

  sub_1001C45E0();
  sub_10002A3D4();
}

void sub_1001C1D54(uint64_t *a1)
{
  uint64_t v3 = sub_1001C48D8();
  sub_1001793E0(v3);
  sub_1001C48D0();
  sub_1001C47C4();
  sub_1001C48EC();
  uint64_t v4 = sub_1000175B0(&qword_1002B99E0);
  sub_1001C419C();
  uint64_t v5 = sub_1001C48C8();
  if (v4)
  {
    sub_10002A47C();
    sub_1001C4660();
    sub_100024F0C();
  }

  else
  {
    sub_100196FCC(v5, v6);
    sub_1001C4618();
    sub_100024F0C();
    sub_100196FD8();
  }

  sub_1001C41E0(a1);
  sub_1001C45E0();
  sub_10002A3D4();
}

double sub_1001C1E18(uint64_t a1)
{
  *(void *)&double result = sub_1001C207C(a1, type metadata accessor for CreateAppReceiptResponse, &qword_1002B9A10, "1&\b").n128_u64[0];
  return result;
}

void sub_1001C1E34(void *a1)
{
  uint64_t v4 = sub_1001C48D8();
  sub_1001793E0(v4);
  sub_1001C48D0();
  sub_1001C47C4();
  sub_1001C48EC();
  sub_1001C4320();
  uint64_t v5 = sub_1001C48C8();
  if (v1)
  {
    sub_10002A47C();
    sub_1001C4660();
    sub_100024F0C();
  }

  else
  {
    sub_100196FCC(v5, v6);
    sub_1001C4618();
    sub_100024F0C();
    sub_100196FD8();
  }

  sub_1001C435C(a1);
  sub_1001C45E0();
  sub_10002A3D4();
}

double sub_1001C1EE4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  __chkstk_darwin(v4);
  unint64_t v6 = &__dst[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  memcpy(__dst, a1, 0x61uLL);
  uint64_t v7 = type metadata accessor for JSONEncoder(0LL);
  uint64_t v8 = swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  JSONEncoder.init()(v8);
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter(v6);
  unint64_t v9 = sub_1001C344C();
  uint64_t v10 = dispatch thunk of JSONEncoder.encode<A>(_:)(__dst, &type metadata for TransactionHistoryResponse, v9);
  unint64_t v12 = v11;
  sub_10003AA88(v10, v11);
  sub_1000AD058(v10, v12);
  swift_release();
  sub_10003A9EC(v10, v12);
  sub_1001C3488(a1);
  uint64_t v13 = v21;
  int v14 = v23;
  __int16 v15 = v24;
  char v16 = v25;
  double result = v22;
  *(_OWORD *)a2 = v20;
  *(void *)(a2 + 16) = v13;
  *(double *)(a2 + 24) = result;
  *(_DWORD *)(a2 + 32) = v14;
  *(_WORD *)(a2 + 36) = v15;
  *(_BYTE *)(a2 + 38) = v16;
  return result;
}

double sub_1001C2060(uint64_t a1)
{
  *(void *)&double result = sub_1001C207C(a1, type metadata accessor for BagResponse, &qword_1002B9A18, asc_1001F3EA0).n128_u64[0];
  return result;
}

__n128 sub_1001C207C(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, const char *a4)
{
  uint64_t v11 = sub_1001C48D8();
  sub_1001793E0(v11);
  sub_1001C48D0();
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter(v5);
  a2(0LL);
  sub_100046F3C(a3, a2, a4);
  uint64_t v12 = sub_1001C48C8();
  if (a4)
  {
    sub_10002A47C();
    sub_1000ACB64(0LL, 0xE000000000000000LL, 6u, (uint64_t)&v23);
    sub_100024F0C();
  }

  else
  {
    uint64_t v14 = v12;
    unint64_t v15 = v13;
    sub_10003AA88(v12, v13);
    sub_1001C4760(v14, v15);
    sub_100024F0C();
    sub_10003A9EC(v14, v15);
  }

  unint64_t v16 = v24;
  unsigned __int32 v17 = v26;
  unsigned __int16 v18 = v27;
  unsigned __int8 v19 = v28;
  __n128 v22 = v23;
  unint64_t v20 = v25;
  sub_10004739C(a1, a2);
  __n128 result = v22;
  *uint64_t v4 = v22;
  v4[1].n128_u64[0] = v16;
  v4[1].n128_u64[1] = v20;
  v4[2].n128_u32[0] = v17;
  v4[2].n128_u16[2] = v18;
  v4[2].n128_u8[6] = v19;
  return result;
}

void sub_1001C21DC(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
}

void sub_1001C21F0(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
}

void sub_1001C2204(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
}

void sub_1001C2218( uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t (*a4)(void)@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a6;
  uint64_t v34 = a5;
  uint64_t v32 = a2;
  uint64_t v9 = a4(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v31 - v10;
  sub_1000175B0(&qword_1002B6208);
  sub_1000226C8();
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for P256.Signing.PrivateKey(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  unsigned __int8 v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v31 - v20;
  if (qword_1002A8D30 != -1) {
    swift_once(&qword_1002A8D30, sub_10014BE60);
  }
  sub_10014BEF8((uint64_t)v14);
  if (sub_10001D158((uint64_t)v14, 1LL, v15) == 1)
  {
    sub_1001C4120((uint64_t)v14);
    uint64_t v22 = sub_1000175B0(v34);
    sub_10001762C(v33, 1LL, 1LL, v22);
  }

  else
  {
    char v23 = a3 & 1;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v14, v15);
    sub_1001C4524(a1, (uint64_t)v11, a4);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    uint64_t v24 = sub_10014BE9C();
    if (v25)
    {
      uint64_t v26 = v24;
      uint64_t v27 = v25;
      uint64_t v28 = sub_1000175B0(&qword_1002A9098);
      uint64_t v29 = (void *)swift_allocObject(v28, 48LL, 7LL);
      *((_OWORD *)v29 + 1) = xmmword_1001F3C00;
      v29[4] = v26;
      v29[5] = v27;
    }

    else
    {
      uint64_t v29 = _swiftEmptyArrayStorage;
    }

    sub_100019F58((void *)(v31 + 16), *(void *)(v31 + 40));
    sub_100076F60();
    sub_1001C2454((uint64_t)v11, (uint64_t)v19, v29, v30, v32, v23, v34, a4, v33);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  }

  sub_10002A580();
}

void sub_1001C2454( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, Swift::Int a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t *a7@<X6>, uint64_t (*a8)(void)@<X7>, uint64_t a9@<X8>)
{
  uint64_t v16 = (int *)sub_1000175B0(a7);
  sub_1000226C8();
  __chkstk_darwin(v17);
  sub_1000C78A4();
  v9[*(int *)(v18 + 48)] = 0;
  if ((a6 & 1) != 0) {
    goto LABEL_6;
  }
  if (a5 == 22)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v19 = 0LL;
    goto LABEL_7;
  }

  if (a5 == 20)
  {
    uint64_t v20 = 0x3635325352LL;
    unsigned __int8 v19 = a3;
    goto LABEL_8;
  }

  if (a5 != 18)
  {
LABEL_6:
    unsigned __int8 v19 = a3;
  }

  else
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v19 = _swiftEmptyArrayStorage;
  }

void *sub_1001C25DC(void *a1)
{
  if (v9 != 255)
  {
    sub_1000AF7D4(v8, (uint64_t)v10);
    sub_1000B8DE8();
    if (v2 == 4)
    {
      uint64_t v3 = sub_1000B3DDC();
      sub_1000D868C(v3, v4);
      swift_bridgeObjectRelease();
      sub_1000AF7D4(v10, (uint64_t)v11);
      __asm { BR              X10 }
    }

    sub_1000C01EC((uint64_t)v7);
  }

  id v5 = a1;
  return a1;
}

void sub_1001C27A0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, Swift::Int a4@<X3>, void *a5@<X8>)
{
  if (a4 < 1)
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
LABEL_8:
    *a5 = a2;
    a5[1] = a3;
    a5[2] = 0x63585F656C707041LL;
    a5[3] = 0xEF79654B5F65646FLL;
    a5[4] = 5527370LL;
    a5[5] = 0xE300000000000000LL;
    a5[6] = a1;
    a5[7] = v14;
    a5[8] = v15;
  }

  else
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = 0xE000000000000000LL;
    String.reserveCapacity(_:)(a4);
    uint64_t v10 = 0LL;
    while (v10 != a4)
    {
      do
      {
        uint64_t v16 = 0LL;
        swift_stdlib_random(&v16, 8LL);
        unsigned int v11 = 96 * v16;
      }

      while ((v11 & 0xC0) == 0);
      ++v10;
      uint64_t v16 = (v11 >> 8) + 32;
      v12._uint64_t countAndFlagsBits = static String._uncheckedFromUTF8(_:)(&v16, 1LL);
      object = v12._object;
      String.append(_:)(v12);
      swift_bridgeObjectRelease(object);
      if (v10 == a4)
      {
        uint64_t v14 = v17;
        unint64_t v15 = v18;
        goto LABEL_8;
      }
    }

    __break(1u);
  }

BOOL sub_1001C28C4(uint64_t a1, char a2)
{
  if ((a1 & 1) != 0) {
    uint64_t v3 = 12918LL;
  }
  else {
    uint64_t v3 = 12662LL;
  }
  unint64_t v4 = sub_1001C49D4(a1, v3);
  uint64_t v8 = v7;
  if (!((v4 ^ v5) >> 14))
  {
    uint64_t v16 = sub_100023EEC();
    goto LABEL_9;
  }

  uint64_t v9 = v4;
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = sub_1001C3BCC(v4, v5, v6, v7, 10LL);
  if ((v13 & 0x100) != 0)
  {
    uint64_t v14 = sub_1001C35E0(v9, v10, v11, v8, 10LL, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_1001C36D4);
    char v18 = v17;
    uint64_t v16 = sub_100023EEC();
    if ((v18 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v14 = v12;
  char v15 = v13;
  uint64_t v16 = sub_100023EEC();
  if ((v15 & 1) != 0) {
LABEL_9:
  }
    uint64_t v14 = 0LL;
LABEL_10:
  if ((a2 & 1) != 0) {
    uint64_t v19 = 12918LL;
  }
  else {
    uint64_t v19 = 12662LL;
  }
  unint64_t v20 = sub_1001C49D4(v16, v19);
  uint64_t v24 = v23;
  if (!((v20 ^ v21) >> 14))
  {
    sub_10001EDA0();
    goto LABEL_18;
  }

  uint64_t v25 = v20;
  uint64_t v26 = v21;
  uint64_t v27 = v22;
  uint64_t v28 = sub_1001C3BCC(v20, v21, v22, v23, 10LL);
  if ((v29 & 0x100) == 0)
  {
    uint64_t v30 = v28;
    char v31 = v29;
    sub_10001EDA0();
    if ((v31 & 1) == 0) {
      return v14 < v30;
    }
    goto LABEL_18;
  }

  uint64_t v30 = sub_1001C35E0(v25, v26, v27, v24, 10LL, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_1001C36D4);
  char v33 = v32;
  sub_10001EDA0();
  if ((v33 & 1) != 0) {
LABEL_18:
  }
    uint64_t v30 = 0LL;
  return v14 < v30;
}

uint64_t sub_1001C2A2C(char a1)
{
  if ((a1 & 1) != 0) {
    return 12918LL;
  }
  else {
    return 12662LL;
  }
}

uint64_t sub_1001C2A44(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100270ED0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

BOOL sub_1001C2A94(unsigned __int8 *a1, char *a2)
{
  return sub_1001C28C4(*a1, *a2);
}

void sub_1001C2AA0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v6 = v2;
  sub_1001C10B0((uint64_t)&v29);
  uint64_t v9 = v36;
  if (v36)
  {
    uint64_t v10 = v34;
    uint64_t v11 = v37;
    uint64_t v12 = v38;
    uint64_t v5 = v39;
    uint64_t v13 = v40;
    uint64_t v14 = v41;
    uint64_t v26 = v30;
    uint64_t v27 = v29;
    v48[0] = v29;
    v48[1] = v30;
    uint64_t v24 = v32;
    uint64_t v25 = v31;
    v48[2] = v31;
    v48[3] = v32;
    uint64_t v22 = v35;
    uint64_t v23 = v33;
    v48[4] = v33;
    v48[5] = v34;
    v48[6] = v35;
    v48[7] = v36;
    v48[8] = v37;
    v48[9] = v38;
    char v49 = v39 & 1;
    uint64_t v50 = v40;
    uint64_t v51 = v41;
    sub_10012A314(0x6E6F6973726576LL, 0xE700000000000000LL, *(void *)(a1 + 96));
    if (v15._object) {
      LOBYTE(v15._object) = sub_1001C2A44(v15) & 1;
    }
    __int16 v6 = 0;
    sub_1001C2D04((uint64_t)v48, (char)v15._object, (uint64_t)&v29);
    sub_1001C33F0(v27, v26, v25, v24, v23, v10, v22, v9, v11, v12, v5, v13, v14);
    sub_1001C1EE4(&v29, (uint64_t)&v42);
    __int128 v28 = v42;
    uint64_t v9 = v43;
    uint64_t v3 = v44;
    unint64_t v4 = v45 | ((unint64_t)v46 << 32) | ((unint64_t)v47 << 48);
    sub_10001ED94();
    uint64_t v17 = sub_100058954();
    uint64_t v18 = sub_10001ED7C(v17);
    __int128 v19 = v28;
    uint64_t v20 = v18;
    *(void *)(v18 + 16) = 0LL;
    *(void *)(v18 + 24) = 0LL;
    uint64_t v21 = 3LL;
  }

  else
  {
    sub_10001ED94();
    uint64_t v16 = sub_100058954();
    uint64_t v20 = sub_10001ED7C(v16);
    *(double *)&__int128 v19 = sub_1001C497C(v20);
    uint64_t v21 = 21LL;
  }

  *(void *)(v18 + 32) = v21;
  *(_WORD *)(v18 + 40) = v6;
  *(_WORD *)(v18 + 42) = v5;
  *(void *)a2 = v20;
  *(void *)(a2 + 8) = _swiftEmptyArrayStorage;
  *(_BYTE *)(a2 + 16) = 2;
  *(_OWORD *)(a2 + 24) = v19;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v3;
  *(_BYTE *)(a2 + 62) = BYTE6(v4);
  *(_WORD *)(a2 + 60) = WORD2(v4);
  *(_DWORD *)(a2 + 56) = v4;
}

uint64_t sub_1001C2D04@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v68 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = swift_allocObject(&unk_100291D48, 128LL, 7LL);
  *(void *)(v12 + 16) = v5;
  memcpy((void *)(v12 + 24), (const void *)a1, 0x68uLL);
  unint64_t v13 = *(void *)(a1 + 24);
  if (v13)
  {
    uint64_t v63 = v10;
    uint64_t v69 = *(void *)(a1 + 16);
    unint64_t v14 = *(void *)(a1 + 72);
    if (*(_BYTE *)(a1 + 80)) {
      double v15 = 0.0;
    }
    else {
      double v15 = *(double *)(a1 + 64);
    }
    if (*(_BYTE *)(a1 + 80)) {
      unint64_t v14 = 0LL;
    }
    unint64_t v71 = v14;
    *(void *)&__int128 v66 = v5;
    swift_retain();
    sub_1001C49A0();
    if (qword_1002A8D90 != -1) {
      swift_once(&qword_1002A8D90, sub_100183E34);
    }
    uint64_t v65 = a3;
    unsigned int v64 = a2 & 1;
    uint64_t v16 = type metadata accessor for Logger(0LL);
    sub_100018F68(v16, (uint64_t)qword_1002EB9D0);
    uint64_t v17 = swift_bridgeObjectRetain_n(v13, 2LL);
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.default.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v70 = v4;
    uint64_t v67 = v12;
    if (v20)
    {
      uint64_t v21 = swift_slowAlloc(22LL, -1LL);
      uint64_t v62 = v9;
      uint64_t v22 = v21;
      uint64_t v61 = swift_slowAlloc(64LL, -1LL);
      uint64_t v73 = v61;
      *(_DWORD *)uint64_t v22 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_1000CF360(v69, v13, &v73);
      sub_1001C4914();
      swift_bridgeObjectRelease_n(v13, 3LL);
      *(_WORD *)(v22 + 12) = 2080;
      unint64_t v23 = v71;
      uint64_t v24 = sub_100156AA8(v15);
      uint64_t v72 = sub_1000CF360(v24, v25, &v73);
      sub_1001C4914();
      swift_bridgeObjectRelease();
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Handling in-app receipts request for %s from revision %s.",  (uint8_t *)v22,  0x16u);
      uint64_t v26 = v61;
      swift_arrayDestroy(v61, 2LL);
      sub_10001A408(v26);
      uint64_t v27 = v22;
      uint64_t v9 = v62;
      sub_10001A408(v27);
    }

    else
    {

      uint64_t v28 = swift_bridgeObjectRelease_n(v13, 2LL);
      unint64_t v23 = v71;
    }

    uint64_t v33 = (void *)v66;
    if (v23 <= 3)
    {
      uint64_t v34 = v68;
      uint64_t v35 = static Date.distantPast.getter(v28);
      Date.timeIntervalSinceReferenceDate.getter(v35);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v34, v9);
    }

    uint64_t v36 = v33 + 11;
    sub_100019F58(v33 + 11, v33[14]);
    sub_1001C28C4(v64, 1);
    sub_100161190();
    uint64_t v37 = v69;
    uint64_t v38 = sub_100089568();
    char v40 = v39;
    uint64_t v41 = v65;
    if (v71 <= 3)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v42 = v70;
      uint64_t v43 = sub_1001C1978((unint64_t)v38, v33, v37, v13);
      uint64_t v70 = v42;
      swift_bridgeObjectRelease();
      uint64_t v38 = v43;
    }

    sub_1001C49A0();
    sub_1000A7B20( (void *)a1,  (unint64_t)v38,  v40 & 1,  (void (*)(void))sub_1001C3560,  (uint64_t)v74);
    sub_1001C4578((uint64_t)v74, (uint64_t)&v75, &qword_1002B99C8);
    uint64_t v44 = v80;
    if (v80)
    {
      unsigned int v45 = v33;
      uint64_t v46 = v75;
      char v47 = v76;
      uint64_t v48 = v77;
      uint64_t v49 = v78;
      uint64_t v50 = v79;
      uint64_t v68 = v81;
      unsigned int v64 = v82;
      uint64_t v63 = v83;
      unint64_t v71 = v85;
      LODWORD(v69) = v86;
      uint64_t v51 = v45[14];
      __int128 v66 = v84;
      unint64_t v52 = sub_100019F58(v36, v51);
      uint64_t v53 = *v52;
      uint64_t v54 = *(os_unfair_lock_s **)(*(void *)(*v52 + 128LL) + 16LL);
      swift_retain();
      os_unfair_lock_lock(v54);
      *(_BYTE *)(v53 + 112) = 1;
      os_unfair_lock_unlock(v54);
      swift_release();
      uint64_t result = swift_release();
      *(void *)uint64_t v41 = v46;
      *(_BYTE *)(v41 + 8) = v47;
      *(void *)(v41 + 16) = v48;
      *(void *)(v41 + 24) = v49;
      *(void *)(v41 + 32) = v50;
      uint64_t v56 = v68;
      *(void *)(v41 + 40) = v44;
      *(void *)(v41 + 48) = v56;
      *(_BYTE *)(v41 + 56) = v64;
      *(void *)(v41 + 64) = v63;
      *(_OWORD *)(v41 + 72) = v66;
      *(void *)(v41 + 88) = v71;
      *(_BYTE *)(v41 + 96) = v69;
      return result;
    }

    unint64_t v57 = sub_10001FD38();
    uint64_t v58 = sub_1000252D0((uint64_t)&type metadata for HTTPResponseStatus, v57);
    sub_1001C49C0(v58, v59);
  }

  else
  {
    unint64_t v29 = sub_10001FD38();
    uint64_t v30 = sub_1000252D0((uint64_t)&type metadata for HTTPResponseStatus, v29);
    sub_1001C49C0(v30, v31);
    swift_retain();
    uint64_t v32 = sub_1001C49A0();
  }

  swift_willThrow(v32);
  return swift_release();
}

void sub_1001C3298(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for CheddarTransaction(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = sub_1000B3DEC();
  uint64_t v11 = v10;
  sub_100019F58(a2 + 6, a2[9]);
  sub_1000765E4(2uLL, v9, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = v17;
  LOBYTE(v9) = v19;
  swift_bridgeObjectRelease();
  id v20 = a1;
  swift_bridgeObjectRetain();
  sub_10011FE9C((uint64_t)v20, v8);
  sub_100019F58(a2 + 11, a2[14]);
  sub_1001C2218((uint64_t)v8, v18, v9 & 1, type metadata accessor for CheddarTransaction, &qword_1002AA328, a3);
  sub_10004739C((uint64_t)v8, type metadata accessor for CheddarTransaction);
}

uint64_t type metadata accessor for TransactionHistoryRoute()
{
  return objc_opt_self(&OBJC_CLASS____TtC25ASOctaneSupportXPCService23TransactionHistoryRoute);
}

uint64_t sub_1001C33F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a8)
  {
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a13);
  }

  return result;
}

unint64_t sub_1001C344C()
{
  unint64_t result = qword_1002B99B8;
  if (!qword_1002B99B8)
  {
    unint64_t result = swift_getWitnessTable("U8\b", &type metadata for TransactionHistoryResponse);
    atomic_store(result, (unint64_t *)&qword_1002B99B8);
  }

  return result;
}

void *sub_1001C3488(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[9];
  uint64_t v4 = a1[10];
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

unint64_t sub_1001C34D8()
{
  unint64_t result = qword_1002B99C0;
  if (!qword_1002B99C0)
  {
    unint64_t result = swift_getWitnessTable(byte_100205584, &type metadata for TransactionHistoryRequest);
    atomic_store(result, (unint64_t *)&qword_1002B99C0);
  }

  return result;
}

uint64_t sub_1001C3514()
{
  return swift_deallocObject(v0, 128LL, 7LL);
}

void sub_1001C3560(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void *sub_1001C356C(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  swift_bridgeObjectRetain(a1[12]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t sub_1001C35D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1001C35E0(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_1001C3950);
}

uint64_t sub_1001C35E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, uint64_t, uint64_t))
{
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  unint64_t v8 = sub_1001C3CA4();
  swift_bridgeObjectRetain();
  uint64_t v9 = String.init<A>(_:)(&v19, &type metadata for Substring, &protocol witness table for Substring, v8);
  uint64_t v11 = v9;
  unint64_t v12 = v10;
  if ((v10 & 0x1000000000000000LL) == 0)
  {
    if ((v10 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = HIBYTE(v12) & 0xF;
    uint64_t v19 = v11;
    uint64_t v20 = v12 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v13 = &v19;
    goto LABEL_7;
  }

  uint64_t v11 = sub_1001620E4(v9, v10);
  unint64_t v16 = v15;
  sub_100023EEC();
  unint64_t v12 = v16;
  if ((v16 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v11 & 0x1000000000000000LL) != 0)
  {
    uint64_t v13 = (uint64_t *)((v12 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v13 = (uint64_t *)_StringObject.sharedUTF8.getter(v11);
  }

unsigned __int8 *sub_1001C36D4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
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

        if (result)
        {
          uint64_t v9 = 0LL;
          uint64_t v19 = result + 1;
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

        return 0LL;
      }

      return 0LL;
    }
  }

  else
  {
    if (v4 != 45)
    {
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
          for (i = result + 1; ; ++i)
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
  }

  __break(1u);
  return result;
}

unsigned __int8 *sub_1001C3950(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v17 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v18 = a3 + 48;
        unsigned __int8 v19 = a3 + 55;
        unsigned __int8 v20 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = 58;
        }

        else
        {
          unsigned __int8 v20 = 97;
          unsigned __int8 v19 = 65;
        }

        if (result)
        {
          unint64_t v9 = 0LL;
          char v21 = result + 1;
          do
          {
            unsigned int v22 = *v21;
            if (v22 < 0x30 || v22 >= v18)
            {
              if (v22 < 0x41 || v22 >= v19)
              {
                uint64_t v13 = 0LL;
                if (v22 < 0x61 || v22 >= v20) {
                  return (unsigned __int8 *)v13;
                }
                char v23 = -87;
              }

              else
              {
                char v23 = -55;
              }
            }

            else
            {
              char v23 = -48;
            }

            if (!is_mul_ok(v9, a3)) {
              return 0LL;
            }
            unint64_t v24 = v9 * a3;
            unsigned __int8 v25 = v22 + v23;
            BOOL v16 = __CFADD__(v24, v25);
            unint64_t v9 = v24 + v25;
            if (v16) {
              return 0LL;
            }
            ++v21;
            --v17;
          }

          while (v17);
          return (unsigned __int8 *)v9;
        }

        return 0LL;
      }

      return 0LL;
    }
  }

  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v26 = a3 + 48;
        unsigned __int8 v27 = a3 + 55;
        unsigned __int8 v28 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = 58;
        }

        else
        {
          unsigned __int8 v28 = 97;
          unsigned __int8 v27 = 65;
        }

        if (result)
        {
          unint64_t v29 = 0LL;
          do
          {
            unsigned int v30 = *result;
            if (v30 < 0x30 || v30 >= v26)
            {
              if (v30 < 0x41 || v30 >= v27)
              {
                uint64_t v13 = 0LL;
                if (v30 < 0x61 || v30 >= v28) {
                  return (unsigned __int8 *)v13;
                }
                char v31 = -87;
              }

              else
              {
                char v31 = -55;
              }
            }

            else
            {
              char v31 = -48;
            }

            if (!is_mul_ok(v29, a3)) {
              return 0LL;
            }
            unint64_t v32 = v29 * a3;
            unsigned __int8 v33 = v30 + v31;
            BOOL v16 = __CFADD__(v32, v33);
            unint64_t v29 = v32 + v33;
            if (v16) {
              return 0LL;
            }
            ++result;
            --v3;
          }

          while (v3);
          return (unsigned __int8 *)v29;
        }

        return 0LL;
      }

      return 0LL;
    }

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
          unint64_t v9 = 0LL;
          for (i = result + 1; ; ++i)
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

            if (!is_mul_ok(v9, a3)) {
              return 0LL;
            }
            unint64_t v14 = v9 * a3;
            unsigned __int8 v15 = v11 + v12;
            BOOL v16 = v14 >= v15;
            unint64_t v9 = v14 - v15;
            if (!v16) {
              return 0LL;
            }
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
  }

  __break(1u);
  return result;
}

uint64_t sub_1001C3BCC( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    uint64_t result = 0LL;
    goto LABEL_8;
  }

  if ((a4 & 0x2000000000000000LL) != 0)
  {
    uint64_t v12 = HIBYTE(a4) & 0xF;
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    unsigned int v11 = v15;
  }

  else if ((a3 & 0x1000000000000000LL) != 0)
  {
    unsigned int v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    unsigned int v11 = (void *)_StringObject.sharedUTF8.getter(a3);
  }

  uint64_t result = sub_1001C3CE0((uint64_t)v11, v12, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v16 = v14 & 1;
LABEL_8:
    LOBYTE(v15[0]) = (a4 & 0x1000000000000000LL) != 0;
  }

  return result;
}

unint64_t sub_1001C3CA4()
{
  unint64_t result = qword_1002B99D0;
  if (!qword_1002B99D0)
  {
    unint64_t result = swift_getWitnessTable( (const char *)&protocol conformance descriptor for Substring,  &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_1002B99D0);
  }

  return result;
}

uint64_t sub_1001C3CE0( uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11 = a3;
  uint64_t v12 = result;
  uint64_t v13 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000LL) == 0) {
    LOBYTE(v13) = 1;
  }
  uint64_t v14 = 4LL << v13;
  unint64_t v15 = a3 & 0xC;
  unint64_t v16 = a3;
  if (v15 == 4LL << v13)
  {
    unint64_t result = sub_1000CF8B0(a3, a5, a6);
    unint64_t v16 = result;
  }

  uint64_t v17 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x1000000000000000LL) != 0)
  {
    unint64_t v19 = a5 & 0xFFFFFFFFFFFFLL;
    if ((a6 & 0x2000000000000000LL) != 0) {
      unint64_t v19 = HIBYTE(a6) & 0xF;
    }
    if (v19 < v16 >> 16) {
      goto LABEL_96;
    }
    unint64_t result = String.UTF8View._foreignDistance(from:to:)(15LL, v16, a5, a6);
    uint64_t v18 = result;
    uint64_t v17 = HIBYTE(a6) & 0xF;
  }

  else
  {
    uint64_t v18 = v16 >> 16;
  }

  if (v15 == v14)
  {
    uint64_t v20 = v17;
    unint64_t result = sub_1000CF8B0(v11, a5, a6);
    uint64_t v17 = v20;
    unint64_t v11 = result;
  }

  if ((a4 & 0xC) == v14)
  {
    unint64_t v21 = a4;
    uint64_t v22 = v17;
    unint64_t result = sub_1000CF8B0(v21, a5, a6);
    uint64_t v17 = v22;
    a4 = result;
    if ((a6 & 0x1000000000000000LL) == 0) {
      goto LABEL_11;
    }
  }

  else if ((a6 & 0x1000000000000000LL) == 0)
  {
LABEL_11:
    unint64_t result = (a4 >> 16) - (v11 >> 16);
    goto LABEL_22;
  }

  unint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000LL) != 0) {
    unint64_t v23 = v17;
  }
  if (v23 < v11 >> 16) {
    goto LABEL_92;
  }
  if (v23 < a4 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }

  unint64_t result = String.UTF8View._foreignDistance(from:to:)(v11, a4, a5, a6);
LABEL_22:
  uint64_t v24 = v18 + result;
  if (__OFADD__(v18, result))
  {
    __break(1u);
    goto LABEL_91;
  }

  if (v24 < v18)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }

  unsigned __int8 v25 = (unsigned __int8 *)(v12 + v18);
  if (!v12) {
    unsigned __int8 v25 = 0LL;
  }
  int v26 = *v25;
  if (v26 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v37 = a7 + 48;
        unsigned __int8 v38 = a7 + 55;
        unsigned __int8 v39 = a7 + 87;
        if (a7 > 10)
        {
          unsigned __int8 v37 = 58;
        }

        else
        {
          unsigned __int8 v39 = 97;
          unsigned __int8 v38 = 65;
        }

        if (v25)
        {
          uint64_t v30 = 0LL;
          char v40 = v25 + 1;
          uint64_t v41 = result - 1;
          do
          {
            unsigned int v42 = *v40;
            if (v42 < 0x30 || v42 >= v37)
            {
              if (v42 < 0x41 || v42 >= v38)
              {
                uint64_t v35 = 0LL;
                if (v42 < 0x61 || v42 >= v39) {
                  return v35;
                }
                char v43 = -87;
              }

              else
              {
                char v43 = -55;
              }
            }

            else
            {
              char v43 = -48;
            }

            uint64_t v44 = v30 * a7;
            uint64_t v30 = v44 + (v42 + v43);
            ++v40;
            --v41;
          }

          while (v41);
          return v30;
        }

        return 0LL;
      }

      return 0LL;
    }

    goto LABEL_95;
  }

  if (v26 != 45)
  {
    if (v24 != v18)
    {
      unsigned __int8 v45 = a7 + 48;
      unsigned __int8 v46 = a7 + 55;
      unsigned __int8 v47 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v45 = 58;
      }

      else
      {
        unsigned __int8 v47 = 97;
        unsigned __int8 v46 = 65;
      }

      if (v25)
      {
        uint64_t v48 = 0LL;
        do
        {
          unsigned int v49 = *v25;
          if (v49 < 0x30 || v49 >= v45)
          {
            if (v49 < 0x41 || v49 >= v46)
            {
              uint64_t v35 = 0LL;
              if (v49 < 0x61 || v49 >= v47) {
                return v35;
              }
              char v50 = -87;
            }

            else
            {
              char v50 = -55;
            }
          }

          else
          {
            char v50 = -48;
          }

          uint64_t v51 = v48 * a7;
          uint64_t v48 = v51 + (v49 + v50);
          ++v25;
          --result;
        }

        while (result);
        return v51 + (v49 + v50);
      }

      return 0LL;
    }

    return 0LL;
  }

  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v27 = a7 + 48;
      unsigned __int8 v28 = a7 + 55;
      unsigned __int8 v29 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v27 = 58;
      }

      else
      {
        unsigned __int8 v29 = 97;
        unsigned __int8 v28 = 65;
      }

      if (v25)
      {
        uint64_t v30 = 0LL;
        char v31 = v25 + 1;
        uint64_t v32 = result - 1;
        while (1)
        {
          unsigned int v33 = *v31;
          if (v33 < 0x30 || v33 >= v27)
          {
            if (v33 < 0x41 || v33 >= v28)
            {
              uint64_t v35 = 0LL;
              if (v33 < 0x61 || v33 >= v29) {
                return v35;
              }
              char v34 = -87;
            }

            else
            {
              char v34 = -55;
            }
          }

          else
          {
            char v34 = -48;
          }

          uint64_t v36 = v30 * a7;
          uint64_t v30 = v36 - (v33 + v34);
          ++v31;
          if (!--v32) {
            return v30;
          }
        }
      }

      return 0LL;
    }

    return 0LL;
  }

uint64_t sub_1001C4120(uint64_t a1)
{
  uint64_t v2 = sub_1000175B0(&qword_1002B6208);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_1001C4160()
{
  unint64_t result = qword_1002B99D8;
  if (!qword_1002B99D8)
  {
    unint64_t result = swift_getWitnessTable(byte_100208B2C, &type metadata for PriceIncreaseHelperRoute.Request);
    atomic_store(result, (unint64_t *)&qword_1002B99D8);
  }

  return result;
}

unint64_t sub_1001C419C()
{
  unint64_t result = qword_1002B99E8;
  if (!qword_1002B99E8)
  {
    uint64_t v1 = sub_100018EC0(&qword_1002B99E0);
    unint64_t result = swift_getWitnessTable(byte_100201F38, v1);
    atomic_store(result, (unint64_t *)&qword_1002B99E8);
  }

  return result;
}

uint64_t *sub_1001C41E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return a1;
}

unint64_t sub_1001C4228()
{
  unint64_t result = qword_1002B99F0;
  if (!qword_1002B99F0)
  {
    unint64_t result = swift_getWitnessTable( byte_100206DFC,  &type metadata for ConfirmPurchaseEngagementHelperRoute.CancelRequest);
    atomic_store(result, (unint64_t *)&qword_1002B99F0);
  }

  return result;
}

void sub_1001C4264(void *a1)
{
}

unint64_t sub_1001C426C()
{
  unint64_t result = qword_1002B99F8;
  if (!qword_1002B99F8)
  {
    unint64_t result = swift_getWitnessTable(byte_100206364, &type metadata for InAppBuyRequest);
    atomic_store(result, (unint64_t *)&qword_1002B99F8);
  }

  return result;
}

unint64_t sub_1001C42A8()
{
  unint64_t result = qword_1002B9A00;
  if (!qword_1002B9A00)
  {
    unint64_t result = swift_getWitnessTable(byte_100209B00, &type metadata for RefundRequestResponse);
    atomic_store(result, (unint64_t *)&qword_1002B9A00);
  }

  return result;
}

unint64_t sub_1001C42E4()
{
  unint64_t result = qword_1002B9A08;
  if (!qword_1002B9A08)
  {
    unint64_t result = swift_getWitnessTable(byte_1001F73E0, &type metadata for RefundRequestRequest);
    atomic_store(result, (unint64_t *)&qword_1002B9A08);
  }

  return result;
}

unint64_t sub_1001C4320()
{
  unint64_t result = qword_1002B9A20;
  if (!qword_1002B9A20)
  {
    unint64_t result = swift_getWitnessTable("iY\b", &type metadata for EditSubscriptionsHelperResponse);
    atomic_store(result, (unint64_t *)&qword_1002B9A20);
  }

  return result;
}

void *sub_1001C435C(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[12];
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v6);
  return a1;
}

unint64_t sub_1001C43D0()
{
  unint64_t result = qword_1002B9A28;
  if (!qword_1002B9A28)
  {
    unint64_t result = swift_getWitnessTable(byte_100207010, &type metadata for DisableSubscriptionRequest);
    atomic_store(result, (unint64_t *)&qword_1002B9A28);
  }

  return result;
}

unint64_t sub_1001C440C()
{
  unint64_t result = qword_1002B9A30;
  if (!qword_1002B9A30)
  {
    unint64_t result = swift_getWitnessTable("u8\b", &unk_1002805E8);
    atomic_store(result, (unint64_t *)&qword_1002B9A30);
  }

  return result;
}

unint64_t sub_1001C4448()
{
  unint64_t result = qword_1002B9A38;
  if (!qword_1002B9A38)
  {
    unint64_t result = swift_getWitnessTable(byte_1001F6AAC, &unk_100278B40);
    atomic_store(result, (unint64_t *)&qword_1002B9A38);
  }

  return result;
}

uint64_t sub_1001C4484(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  char v5 = *(_BYTE *)(a1 + 88);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100051528(v2, v3, v4, v5);
  return a1;
}

unint64_t sub_1001C44E8()
{
  unint64_t result = qword_1002B9A40;
  if (!qword_1002B9A40)
  {
    unint64_t result = swift_getWitnessTable("IT\b", &type metadata for StatusRequest);
    atomic_store(result, (unint64_t *)&qword_1002B9A40);
  }

  return result;
}

void sub_1001C4524(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_1000E56C8(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(v3, v4, v5);
  sub_10001945C();
}

void sub_1001C4558(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_1000E56C8(a1, a2, a3);
  sub_1001C48B0(v3);
  sub_10001945C();
}

void sub_1001C4578(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_1000175B0(a3);
  sub_1001C48B0(v3);
  sub_10001945C();
}

unint64_t sub_1001C45A4()
{
  unint64_t result = qword_1002B9A48;
  if (!qword_1002B9A48)
  {
    unint64_t result = swift_getWitnessTable(byte_1001F3C88, &type metadata for BillingErrorHelperRoute.Request);
    atomic_store(result, (unint64_t *)&qword_1002B9A48);
  }

  return result;
}

double sub_1001C45E0()
{
  uint64_t v2 = *(void *)(v1 + 16);
  int v3 = *(_DWORD *)(v1 + 32);
  __int16 v4 = *(_WORD *)(v1 + 36);
  char v5 = *(_BYTE *)(v1 + 38);
  double result = *(double *)(v1 + 24);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v1;
  *(void *)(v0 + 16) = v2;
  *(double *)(v0 + 24) = result;
  *(_DWORD *)(v0 + 32) = v3;
  *(_WORD *)(v0 + 36) = v4;
  *(_BYTE *)(v0 + 38) = v5;
  return result;
}

void sub_1001C4618()
{
}

uint64_t sub_1001C463C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v10 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)((uint64_t *)va, va1, v8);
}

uint64_t *sub_1001C4658()
{
  return sub_100038FD4(v0);
}

uint64_t sub_1001C4660()
{
  return sub_1000ACB64(0LL, 0xE000000000000000LL, 6u, v0 - 88);
}

uint64_t sub_1001C4678(float a1)
{
  *uint64_t v2 = a1;
  return swift_bridgeObjectRetain(*(void *)(*(void *)(v1 + 32) + 40LL));
}

uint64_t *sub_1001C4690()
{
  return sub_100055528(v0);
}

uint64_t sub_1001C4698( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return sub_1000CF360(a1, a2, (uint64_t *)va);
}

uint64_t sub_1001C46A4()
{
  return sub_1000ACD2C();
}

uint64_t sub_1001C46C4()
{
  return sub_10003A9EC(v1, v0);
}

uint64_t sub_1001C46D0()
{
  *(_WORD *)(v0 + 12) = 2082;
  return sub_1001BD000();
}

uint64_t sub_1001C46E4(uint64_t a1)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, v2, v1);
}

uint64_t sub_1001C46F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  a16 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a16, v17, v16);
}

uint64_t sub_1001C4704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(a1, a2, a3, a1);
}

uint64_t sub_1001C4710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)(a1, a2, a3, a1);
}

void sub_1001C471C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_1001C4730(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  return swift_getErrorValue(v3, va1, (uint64_t *)va);
}

uint64_t *sub_1001C4740()
{
  return sub_100055528(v0);
}

uint64_t sub_1001C4748( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  a16 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a16, v17, v16);
}

void sub_1001C4760(uint64_t a1, unint64_t a2)
{
}

uint64_t sub_1001C476C(uint64_t a1)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, v2, v1);
}

uint64_t sub_1001C4778()
{
  return type metadata accessor for JSONEncoder.OutputFormatting(0LL);
}

uint64_t sub_1001C4784( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  a16 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a16, v17, v16);
}

void sub_1001C479C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_1001C47B0()
{
  *(_WORD *)(v0 + 12) = 2082;
  return sub_1001BD000();
}

uint64_t sub_1001C47C4()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

void sub_1001C47D0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1001C47D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return swift_arrayDestroy(a11, 3LL);
}

uint64_t sub_1001C47EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return Error.localizedDescription.getter(a13, a14);
}

uint64_t sub_1001C47F8()
{
  return sub_1000ACD2C();
}

uint64_t sub_1001C4818( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  return sub_1000CF360(a1, a2, (uint64_t *)va);
}

uint64_t sub_1001C4824(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000CF360(v4, v3, a3);
}

uint64_t sub_1001C4830(float a1)
{
  *uint64_t v2 = a1;
  return swift_bridgeObjectRetain(*(void *)(*(void *)(v1 + 32) + 40LL));
}

BOOL sub_1001C484C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1001C485C()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_1001C4864()
{
  return JSONDecoder.init()();
}

uint64_t sub_1001C486C()
{
  return type metadata accessor for JSONDecoder(0LL);
}

uint64_t sub_1001C4874()
{
  return type metadata accessor for PropertyListDecoder(0LL);
}

__n128 *sub_1001C487C(__n128 *a1)
{
  return sub_100178A98(a1, (__n128 *)(v1 - 112));
}

  ;
}

uint64_t sub_1001C48A0(uint64_t a1)
{
  return swift_arrayDestroy(a1, 3LL);
}

void sub_1001C48A8(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1001C48B0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 32LL))(v1, v2, a1);
}

uint64_t sub_1001C48C8()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_1001C48D0()
{
  return JSONEncoder.init()();
}

uint64_t sub_1001C48D8()
{
  return type metadata accessor for JSONEncoder(0LL);
}

uint64_t sub_1001C48E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000CF360(v4, v3, a3);
}

uint64_t sub_1001C48EC()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter(v0);
}

__n128 *sub_1001C48F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, __n128 a24)
{
  return sub_100178A98(v24, &a24);
}

uint64_t sub_1001C4908( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  return sub_10003A9EC(v10, a10);
}

uint64_t sub_1001C4914()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 320, v1, v0);
}

uint64_t sub_1001C4924(uint64_t a1, uint64_t a2)
{
  return static os_log_type_t.error.getter(a1, a2);
}

uint64_t sub_1001C492C()
{
  return v0 + 56;
}

__n128 sub_1001C493C@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 - 152);
  __int128 v3 = *(_OWORD *)(v1 - 136);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 31) = *(void *)(a1 + 71);
  return result;
}

  ;
}

uint64_t sub_1001C4970( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  return sub_1000CF360(a1, a2, (uint64_t *)va);
}

double sub_1001C497C(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1001C4990(uint64_t a1, uint64_t a2)
{
  return static os_log_type_t.error.getter(a1, a2);
}

__n128 *sub_1001C4998(uint64_t a1, __n128 *a2)
{
  return sub_100178A98(v2, a2);
}

void *sub_1001C49A0()
{
  return sub_1001C356C(v0);
}

uint64_t sub_1001C49A8()
{
  return v0 + 56;
}

uint64_t sub_1001C49B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  return sub_10003A9EC(a9, a11);
}

void sub_1001C49C0(uint64_t a1, void *a2)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 21LL;
}

unint64_t sub_1001C49D4(uint64_t a1, uint64_t a2)
{
  return sub_10005B078(1uLL, a2, 0xE200000000000000LL);
}

uint64_t AuditToken.rawValue.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t v4 = result;
  v4[1] = a2;
  v4[2] = a3;
  void v4[3] = a4;
  return result;
}

uint64_t AuditToken.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = static AuditToken.decode<A>(data:)(a1, a2, a3);
  if (!v4) {
    uint64_t v3 = v7;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  return v3;
}

uint64_t static AuditToken.decode<A>(data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_1001C4BA4((uint64_t)v7, 1LL, a2, a3, &v6);
  if (v3) {
    return swift_willThrow(v4);
  }
  else {
    return v6;
  }
}

uint64_t AuditToken.data.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a1;
  v6[1] = a2;
  _OWORD v6[2] = a3;
  v6[3] = a4;
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  __DataStorage.init(bytes:length:)(v6, 32LL);
  return 0x2000000000LL;
}

uint64_t sub_1001C4BA4@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _OWORD *a5@<X8>)
{
  if (!result)
  {
    unint64_t v12 = sub_1001C4E68();
    uint64_t v13 = swift_allocError(&type metadata for AuditTokenDecodingError, v12, 0LL, 0LL);
    *(void *)uint64_t v14 = 0LL;
    *(void *)(v14 + 8) = 0LL;
    *(_BYTE *)(v14 + 16) = 1;
    return swift_willThrow(v13);
  }

  if ((unint64_t)(a2 - 0x400000000000000LL) >> 59 == 31)
  {
    uint64_t v8 = (_OWORD *)result;
    uint64_t v9 = 32 * a2;
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 8) + 8LL) + 8LL);
    if (32 * a2 == dispatch thunk of Collection.count.getter(a3, v10))
    {
      double result = dispatch thunk of DataProtocol.copyBytes(to:count:)(v8, &v8[(unint64_t)v9 / 0x10], v9, a3, a4);
      __int128 v11 = v8[1];
      *a5 = *v8;
      a5[1] = v11;
      return result;
    }

    uint64_t v15 = dispatch thunk of Collection.count.getter(a3, v10);
    unint64_t v16 = sub_1001C4E68();
    uint64_t v13 = swift_allocError(&type metadata for AuditTokenDecodingError, v16, 0LL, 0LL);
    *(void *)uint64_t v17 = v9;
    *(void *)(v17 + 8) = v15;
    *(_BYTE *)(v17 + 16) = 0;
    return swift_willThrow(v13);
  }

  __break(1u);
  return result;
}

__n128 sub_1001C4CC4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  __int128 v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_BYTE *)(a2 + 32) = 0;
  return result;
}

__n128 sub_1001C4CD4@<Q0>(_OWORD *a1@<X8>)
{
  __n128 result = *(__n128 *)v1;
  __int128 v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

uint64_t variable initialization expression of ClientOverride.requestAuditTokenData()
{
  return 0LL;
}

uint64_t variable initialization expression of ClientOverride.vendorID@<X0>(uint64_t a1@<X8>)
{
  return sub_1001C4D04((uint64_t (*)(void))&type metadata accessor for UUID, a1);
}

uint64_t variable initialization expression of AcknowledgeMessageRequest.clientOverride@<X0>(uint64_t a1@<X8>)
{
  return sub_1001C4D04(type metadata accessor for ClientOverride, a1);
}

uint64_t sub_1001C4D04@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(a2, 1LL, 1LL, v3);
}

__n128 initializeWithCopy for AuditToken(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

__n128 initializeBufferWithCopyOfBuffer for AuditTokenDecodingError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditTokenDecodingError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for AuditTokenDecodingError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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

  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_1001C4DC8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1001C4DE4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 16) = 1;
  }

  else
  {
    *(_BYTE *)(result + 16) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for AuditTokenDecodingError()
{
  return &type metadata for AuditTokenDecodingError;
}

void type metadata accessor for audit_token_t()
{
  if (!qword_1002B9A60)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100292348);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1002B9A60);
    }
  }

unint64_t sub_1001C4E68()
{
  unint64_t result = qword_1002B9A68;
  if (!qword_1002B9A68)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for AuditTokenDecodingError,  &type metadata for AuditTokenDecodingError);
    atomic_store(result, (unint64_t *)&qword_1002B9A68);
  }

  return result;
}

uint64_t sub_1001C4EB8()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001C4EEC + 4 * byte_10020C8A0[*v0]))( 0x6974616D6F747561LL,  0xE900000000000063LL);
}

uint64_t sub_1001C4EEC()
{
  return 0x69746375646F7270LL;
}

uint64_t sub_1001C4F08()
{
  return 0x786F62646E6173LL;
}

uint64_t sub_1001C4F20()
{
  return 0x73655465646F6378LL;
}

uint64_t sub_1001C4F38@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001C953C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001C4F5C(uint64_t a1)
{
  unint64_t v2 = sub_1001C5E80();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C4F84(uint64_t a1)
{
  unint64_t v2 = sub_1001C5E80();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_1001C4FAC()
{
  return 0xD000000000000010LL;
}

uint64_t sub_1001C4FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001C9710(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_1001C4FF0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1001C4FFC(uint64_t a1)
{
  unint64_t v2 = sub_1001C5F08();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C5024(uint64_t a1)
{
  unint64_t v2 = sub_1001C5F08();
  return CodingKey.debugDescription.getter(a1, v2);
}

void ClientOverride.Server.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for ClientOverride.Server(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1001C7890(v1, (uint64_t)v5, v6);
  uint64_t v7 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v8 = (char *)sub_1001C5140
     + 4
     * byte_10020C8A4[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))( v5,  3LL,  v7)];
  __asm { BR              X10 }

uint64_t sub_1001C5140()
{
  *(void *)(v4 - 64) = 0x73655465646F6358LL;
  *(void *)(v4 - 56) = 0xEA00000000002874LL;
  uint64_t v5 = sub_1000221A8( &qword_1002B9A78,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
  v6._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v0, v5);
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 41LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  uint64_t v8 = *(void *)(v4 - 64);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v0);
  return v8;
}

uint64_t type metadata accessor for ClientOverride.Server(uint64_t a1)
{
  return sub_1001C696C(a1, (uint64_t *)&unk_1002B9C90, (uint64_t)&nominal type descriptor for ClientOverride.Server);
}

void sub_1001C5238(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for ClientOverride.Server(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1001C7890(a1, (uint64_t)v5, v6);
  uint64_t v7 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v8 = (char *)sub_1001C5330
     + 4
     * byte_10020C8A8[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))( v5,  3LL,  v7)];
  __asm { BR              X10 }

uint64_t sub_1001C5330()
{
  *(void *)(v5 - 80) = 0x73655465646F6358LL;
  *(void *)(v5 - 72) = 0xEA00000000002874LL;
  uint64_t v6 = sub_1000221A8( &qword_1002B9A78,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
  v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v1, v6);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 41LL;
  v8._object = (void *)0xE100000000000000LL;
  String.append(_:)(v8);
  uint64_t v9 = *(void *)(v5 - 80);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
  sub_1000A77B0(v0, type metadata accessor for ClientOverride.Server);
  return v9;
}

uint64_t ClientOverride.Server.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002B9A80);
  __chkstk_darwin(v3);
  unsigned int v64 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002B9A88);
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  __chkstk_darwin(v5);
  uint64_t v63 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = sub_1000175B0(&qword_1002B9A90);
  uint64_t v65 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v68 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v74 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  __chkstk_darwin(v8);
  uint64_t v73 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v70 = sub_1000175B0(&qword_1002B9A98);
  uint64_t v10 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  unint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_1000175B0(&qword_1002B9AA0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_1000175B0(&qword_1002B9AA8);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v62 = (char *)&v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v72 = (uint64_t)&v61 - v23;
  uint64_t v25 = a1[3];
  uint64_t v24 = a1[4];
  uint64_t v80 = a1;
  sub_100019F58(a1, v25);
  unint64_t v26 = sub_1001C5E80();
  unsigned __int8 v27 = v76;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ClientOverride.Server.CodingKeys,  &type metadata for ClientOverride.Server.CodingKeys,  v26,  v25,  v24);
  if (v27)
  {
    swift_errorRelease(v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1LL, 1LL, v16);
    sub_100043F40((uint64_t)v15, &qword_1002B9AA0);
  }

  else
  {
    char v76 = v12;
    uint64_t v61 = v10;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0LL, 1LL, v16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    uint64_t v33 = KeyedDecodingContainer.allKeys.getter(v16);
    if (*(void *)(v33 + 16))
    {
      uint64_t v34 = *(unsigned __int8 *)(v33 + 32);
      swift_bridgeObjectRelease();
      __asm { BR              X9 }
    }

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

  unsigned __int8 v28 = v80;
  uint64_t v29 = v80[3];
  sub_100019F58(v80, v29);
  dispatch thunk of Decoder.singleValueContainer()(v29);
  uint64_t v30 = v79;
  sub_100019F58(v78, v79);
  uint64_t v31 = dispatch thunk of SingleValueDecodingContainer.decode(_:)(v30);
  uint64_t v35 = v31;
  uint64_t v36 = v32;
  if (v31 == 1869903201 && v32 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = v72;
LABEL_15:
    uint64_t v39 = sub_1000175B0(&qword_1002B9A70);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56LL))(v37, 1LL, 3LL, v39);
    goto LABEL_16;
  }

  char v38 = _stringCompareWithSmolCheck(_:_:expecting:)(1869903201LL, 0xE400000000000000LL, v31, v32, 0LL);
  uint64_t v37 = v72;
  if ((v38 & 1) != 0
    || v35 == 0x6974616D6F747561LL && v36 == 0xE900000000000063LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6974616D6F747561LL, 0xE900000000000063LL, v35, v36, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }

  if (v35 == 1685025392 && v36 == 0xE400000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(1685025392LL, 0xE400000000000000LL, v35, v36, 0LL) & 1) != 0
    || v35 == 0x69746375646F7270LL && v36 == 0xEA00000000006E6FLL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x69746375646F7270LL, 0xEA00000000006E6FLL, v35, v36, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_1000175B0(&qword_1002B9A70);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56LL))(v37, 2LL, 3LL, v41);
  }

  else if (v35 == 0x786F62646E6173LL && v36 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x786F62646E6173LL, 0xE700000000000000LL, v35, v36, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_1000175B0(&qword_1002B9A70);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56LL))(v37, 3LL, 3LL, v42);
  }

  else
  {
    uint64_t v43 = sub_1000175B0(&qword_1002B9AB8);
    Regex.init(_regexString:version:)(0xD000000000000013LL, 0x80000001002229D0LL, 1LL, v43);
    uint64_t v44 = (uint64_t)v64;
    Regex.wholeMatch(in:)(v35, v36, v69);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v44, 1LL, v67) == 1)
    {
      sub_100043F40(v44, &qword_1002B9A80);
      uint64_t v45 = type metadata accessor for DecodingError(0LL);
      swift_allocError(v45, &protocol witness table for DecodingError, 0LL, 0LL);
      uint64_t v47 = v46;
      unsigned __int8 v28 = v80;
      uint64_t v48 = v80[3];
      uint64_t v49 = v80[4];
      sub_100019F58(v80, v48);
      uint64_t v50 = dispatch thunk of Decoder.codingPath.getter(v48, v49);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v50,  0xD000000000000056LL,  0x80000001002229F0LL,  0LL);
      uint64_t v51 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v45 - 8) + 104LL))( v47,  enum case for DecodingError.dataCorrupted(_:),  v45);
      swift_willThrow(v51);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v69);
      sub_100019F7C(v78);
      return sub_100019F7C(v28);
    }

    uint64_t v53 = v66;
    uint64_t v52 = v67;
    uint64_t v54 = v63;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v63, v44, v67);
    swift_getKeyPath(&unk_10020C8E0);
    Regex.Match.subscript.getter(&v77);
    swift_release();
    uint64_t v55 = static String._fromSubstring(_:)(v77);
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v58 = v62;
    URL.init(fileURLWithPath:)(v55, v57);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v52);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v69);
    uint64_t v59 = sub_1000175B0(&qword_1002B9A70);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56LL))(v58, 0LL, 3LL, v59);
    uint64_t v60 = (uint64_t)v58;
    uint64_t v37 = v72;
    sub_1001C5EC4(v60, v72);
    unsigned __int8 v28 = v80;
  }

unint64_t sub_1001C5E80()
{
  unint64_t result = qword_1002B9AB0;
  if (!qword_1002B9AB0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CF8C, &type metadata for ClientOverride.Server.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9AB0);
  }

  return result;
}

uint64_t sub_1001C5EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride.Server(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1001C5F08()
{
  unint64_t result = qword_1002B9AC0;
  if (!qword_1002B9AC0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CF3C, &type metadata for ClientOverride.Server.XcodeTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9AC0);
  }

  return result;
}

uint64_t sub_1001C5F4C(uint64_t a1)
{
  unint64_t v2 = sub_1001C6510();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C5F74(uint64_t a1)
{
  unint64_t v2 = sub_1001C6510();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001C5F9C(uint64_t a1)
{
  unint64_t v2 = sub_1001C64CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C5FC4(uint64_t a1)
{
  unint64_t v2 = sub_1001C64CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001C5FEC@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_1001C6018(uint64_t a1)
{
  unint64_t v2 = sub_1001C6488();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C6040(uint64_t a1)
{
  unint64_t v2 = sub_1001C6488();
  return CodingKey.debugDescription.getter(a1, v2);
}

void ClientOverride.Server.encode(to:)(void *a1)
{
  uint64_t v2 = sub_1000175B0(&qword_1002B9AD0);
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  __chkstk_darwin(v2);
  unint64_t v26 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for URL(0LL);
  uint64_t v25 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v24 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002B9AD8);
  uint64_t v22 = *(void *)(v5 - 8);
  uint64_t v23 = v5;
  __chkstk_darwin(v5);
  uint64_t v21 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002B9AE0);
  uint64_t v19 = *(void *)(v7 - 8);
  uint64_t v20 = v7;
  __chkstk_darwin(v7);
  uint64_t v18 = sub_1000175B0(&qword_1002B9AE8);
  __chkstk_darwin(v18);
  uint64_t v8 = type metadata accessor for ClientOverride.Server(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_1000175B0(&qword_1002B9AF0);
  uint64_t v30 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = a1[3];
  uint64_t v12 = a1[4];
  sub_100019F58(a1, v13);
  unint64_t v14 = sub_1001C5E80();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ClientOverride.Server.CodingKeys,  &type metadata for ClientOverride.Server.CodingKeys,  v14,  v13,  v12);
  sub_1001C7890(v31, (uint64_t)v10, type metadata accessor for ClientOverride.Server);
  uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v16 = (char *)sub_1001C62C8
      + 4
      * byte_10020C8B0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))( v10,  3LL,  v15)];
  __asm { BR              X10 }

uint64_t sub_1001C62C8()
{
  uint64_t v3 = *(void *)(v2 - 144);
  uint64_t v4 = *(void *)(v2 - 152);
  uint64_t v5 = *(void *)(v2 - 128);
  (*(void (**)(void))(v3 + 32))();
  *(_BYTE *)(v2 - 65) = 3;
  sub_1001C5F08();
  uint64_t v6 = *(void *)(v2 - 136);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ClientOverride.Server.XcodeTestCodingKeys,  v2 - 65,  v0,  &type metadata for ClientOverride.Server.XcodeTestCodingKeys);
  uint64_t v7 = sub_1000221A8( &qword_1002B9AF8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
  uint64_t v8 = *(void *)(v2 - 112);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v4, v9, v8, v5, v7);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 120) + 8LL))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 104) + 8LL))(v1, v0);
}

unint64_t sub_1001C6488()
{
  unint64_t result = qword_1002B9B00;
  if (!qword_1002B9B00)
  {
    unint64_t result = swift_getWitnessTable("eW\b", &type metadata for ClientOverride.Server.SandboxCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9B00);
  }

  return result;
}

unint64_t sub_1001C64CC()
{
  unint64_t result = qword_1002B9B08;
  if (!qword_1002B9B08)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CE9C, &type metadata for ClientOverride.Server.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9B08);
  }

  return result;
}

unint64_t sub_1001C6510()
{
  unint64_t result = qword_1002B9B10;
  if (!qword_1002B9B10)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CE4C, &type metadata for ClientOverride.Server.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9B10);
  }

  return result;
}

uint64_t sub_1001C6558@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverride.Server.init(from:)(a1, a2);
}

void sub_1001C656C(void *a1)
{
}

uint64_t ClientOverride.description.getter()
{
  uint64_t v1 = type metadata accessor for ClientOverride.Server(0LL);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1000175B0(&qword_1002B9B18);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = 0LL;
  unint64_t v35 = 0xE000000000000000LL;
  uint64_t v11 = v0[3];
  if (v11)
  {
    uint64_t v12 = v0[2];
    v33._uint64_t countAndFlagsBits = 0x2864696272LL;
    v33._object = (void *)0xE500000000000000LL;
    String.append(_:)(*(Swift::String *)(&v11 - 1));
    v13._uint64_t countAndFlagsBits = 8233LL;
    v13._object = (void *)0xE200000000000000LL;
    String.append(_:)(v13);
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }

  uint64_t v14 = v0[5];
  if (v14)
  {
    uint64_t v15 = v0[4];
    v33._uint64_t countAndFlagsBits = 0x287372766272LL;
    v33._object = (void *)0xE600000000000000LL;
    String.append(_:)(*(Swift::String *)(&v14 - 1));
    v16._uint64_t countAndFlagsBits = 8233LL;
    v16._object = (void *)0xE200000000000000LL;
    String.append(_:)(v16);
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }

  uint64_t v17 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v18 = (char *)v0 + v17[9];
  if ((v18[8] & 1) == 0)
  {
    uint64_t v19 = *(void *)v18;
    v33._uint64_t countAndFlagsBits = 0x2864496D616461LL;
    v33._object = (void *)0xE700000000000000LL;
    uint64_t v32 = v19;
    v20._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt64,  &protocol witness table for UInt64);
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    v21._uint64_t countAndFlagsBits = 8233LL;
    v21._object = (void *)0xE200000000000000LL;
    String.append(_:)(v21);
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }

  uint64_t v22 = (char *)v0 + v17[8];
  if ((v22[8] & 1) == 0)
  {
    uint64_t v23 = *(void *)v22;
    v33._uint64_t countAndFlagsBits = 0x6449737256747865LL;
    v33._object = (void *)0xE900000000000028LL;
    uint64_t v32 = v23;
    v24._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt64,  &protocol witness table for UInt64);
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._uint64_t countAndFlagsBits = 8233LL;
    v25._object = (void *)0xE200000000000000LL;
    String.append(_:)(v25);
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }

  sub_1001C69A0((uint64_t)v0 + v17[10], (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
  {
    sub_100043F40((uint64_t)v6, &qword_1002B9B18);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v33._uint64_t countAndFlagsBits = 677669238LL;
    v33._object = (void *)0xE400000000000000LL;
    uint64_t v26 = sub_1000221A8( &qword_1002B9B20,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    v27._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v7, v26);
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    v28._uint64_t countAndFlagsBits = 8233LL;
    v28._object = (void *)0xE200000000000000LL;
    String.append(_:)(v28);
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  v33._uint64_t countAndFlagsBits = 0x28726576726573LL;
  v33._object = (void *)0xE700000000000000LL;
  sub_1001C7890((uint64_t)v0 + v17[7], (uint64_t)v3, type metadata accessor for ClientOverride.Server);
  sub_1001C5238((uint64_t)v3);
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  String.append(_:)(v33);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t type metadata accessor for ClientOverride(uint64_t a1)
{
  return sub_1001C696C(a1, (uint64_t *)&unk_1002B9BC8, (uint64_t)&nominal type descriptor for ClientOverride);
}

uint64_t sub_1001C696C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_1001C69A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002B9B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t ClientOverride.requestAuditTokenData.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_10003AA74(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t ClientOverride.requestAuditTokenData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10003AACC(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t LazyJWS.rawValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t ClientOverride.requestBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t AcknowledgeMessageRequest.offerID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain(*(void *)(v0 + 40));
  return v1;
}

uint64_t ClientOverride.requestBundleVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ClientOverride.requestBundleVersion.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.server.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientOverride(0LL);
  return sub_1001C7890(v1 + *(int *)(v3 + 28), a1, type metadata accessor for ClientOverride.Server);
}

uint64_t ClientOverride.server.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0LL) + 28);
  return sub_1001C6B88(a1, v3);
}

uint64_t sub_1001C6B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride.Server(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t (*ClientOverride.server.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.storeExternalVersion.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ClientOverride(0LL) + 32));
}

uint64_t ClientOverride.storeExternalVersion.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for ClientOverride(0LL);
  uint64_t v6 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*ClientOverride.storeExternalVersion.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.storeItemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ClientOverride(0LL) + 36));
}

uint64_t ClientOverride.storeItemID.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for ClientOverride(0LL);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*ClientOverride.storeItemID.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.vendorID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0LL) + 40);
  return sub_1001C69A0(v3, a1);
}

uint64_t ClientOverride.vendorID.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0LL) + 40);
  return sub_1001C6D7C(a1, v3);
}

uint64_t sub_1001C6D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002B9B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t (*ClientOverride.vendorID.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.init(requestAuditTokenData:requestBundleID:requestBundleVersion:server:storeItemID:storeExternalVersion:vendorID:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char a10, uint64_t a11, char a12, uint64_t a13)
{
  uint64_t v19 = (int *)type metadata accessor for ClientOverride(0LL);
  Swift::String v20 = (char *)a9 + v19[8];
  Swift::String v21 = (char *)a9 + v19[9];
  uint64_t v22 = (uint64_t)a9 + v19[10];
  uint64_t v23 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v22, 1LL, 1LL, v23);
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  sub_1001C5EC4(a7, (uint64_t)a9 + v19[7]);
  *(void *)Swift::String v20 = a11;
  v20[8] = a12 & 1;
  *(void *)Swift::String v21 = a8;
  _BYTE v21[8] = a10 & 1;
  return sub_1001C6D7C(a13, v22);
}

uint64_t sub_1001C6F00(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1001C6F3C + 4 * byte_10020C8B4[a1]))( 0xD000000000000015LL,  0x8000000100222A70LL);
}

uint64_t sub_1001C6F3C()
{
  return 0x4274736575716572LL;
}

unint64_t sub_1001C6F60()
{
  return 0xD000000000000014LL;
}

uint64_t sub_1001C6F9C()
{
  return 0x65744965726F7473LL;
}

uint64_t sub_1001C6FBC()
{
  return 0x4449726F646E6576LL;
}

BOOL sub_1001C6FD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1001C6FE8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1001C702C()
{
}

uint64_t sub_1001C7054()
{
  return sub_1001C6F00(*v0);
}

uint64_t sub_1001C705C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001C9794(a1, a2);
  *a3 = result;
  return result;
}

void sub_1001C7080(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1001C708C(uint64_t a1)
{
  unint64_t v2 = sub_1001C7364();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001C70B4(uint64_t a1)
{
  unint64_t v2 = sub_1001C7364();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverride.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B9B28);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001C7364();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ClientOverride.CodingKeys,  &type metadata for ClientOverride.CodingKeys,  v11,  v9,  v10);
  __int128 v33 = *v3;
  char v32 = 0;
  unint64_t v12 = sub_1001C73A8();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v33, &v32, v5, &type metadata for Data, v12);
  if (!v2)
  {
    uint64_t v13 = *((void *)v3 + 2);
    uint64_t v14 = *((void *)v3 + 3);
    LOBYTE(v33) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v13, v14, &v33, v5);
    uint64_t v15 = *((void *)v3 + 4);
    uint64_t v16 = *((void *)v3 + 5);
    LOBYTE(v33) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v15, v16, &v33, v5);
    uint64_t v17 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v18 = (uint64_t)v3 + v17[7];
    LOBYTE(v33) = 3;
    uint64_t v19 = type metadata accessor for ClientOverride.Server(0LL);
    uint64_t v20 = sub_1000221A8( &qword_1002B9B40,  type metadata accessor for ClientOverride.Server,  (uint64_t)&protocol conformance descriptor for ClientOverride.Server);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v18, &v33, v5, v19, v20);
    Swift::String v21 = (uint64_t *)((char *)v3 + v17[8]);
    uint64_t v22 = *v21;
    uint64_t v23 = *((unsigned __int8 *)v21 + 8);
    LOBYTE(v33) = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v22, v23, &v33, v5);
    Swift::String v24 = (uint64_t *)((char *)v3 + v17[9]);
    uint64_t v25 = *v24;
    uint64_t v26 = *((unsigned __int8 *)v24 + 8);
    LOBYTE(v33) = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v25, v26, &v33, v5);
    uint64_t v27 = (uint64_t)v3 + v17[10];
    LOBYTE(v33) = 6;
    uint64_t v28 = type metadata accessor for UUID(0LL);
    uint64_t v29 = sub_1000221A8( &qword_1002B9B48,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v27, &v33, v5, v28, v29);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1001C7364()
{
  unint64_t result = qword_1002B9B30;
  if (!qword_1002B9B30)
  {
    unint64_t result = swift_getWitnessTable("UX\b", &type metadata for ClientOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9B30);
  }

  return result;
}

unint64_t sub_1001C73A8()
{
  unint64_t result = qword_1002B9B38;
  if (!qword_1002B9B38)
  {
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1002B9B38);
  }

  return result;
}

uint64_t ClientOverride.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002B9B18);
  __chkstk_darwin(v3);
  uint64_t v45 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = type metadata accessor for ClientOverride.Server(0LL);
  __chkstk_darwin(v42);
  uint64_t v43 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v46 = sub_1000175B0(&qword_1002B9B50);
  uint64_t v44 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ClientOverride(0LL);
  uint64_t v9 = (int *)__chkstk_darwin(v8);
  unint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *(_OWORD *)unint64_t v11 = xmmword_1001F6080;
  unint64_t v12 = &v11[v9[8]];
  *(void *)unint64_t v12 = 0LL;
  v12[8] = 1;
  uint64_t v13 = &v11[v9[9]];
  *(void *)uint64_t v13 = 0LL;
  v13[8] = 1;
  uint64_t v47 = v9;
  uint64_t v14 = (uint64_t)&v11[v9[10]];
  uint64_t v15 = type metadata accessor for UUID(0LL);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL);
  uint64_t v48 = v14;
  v16(v14, 1LL, 1LL, v15);
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  uint64_t v49 = a1;
  sub_100019F58(a1, v17);
  unint64_t v19 = sub_1001C7364();
  uint64_t v20 = v7;
  Swift::String v21 = v50;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ClientOverride.CodingKeys,  &type metadata for ClientOverride.CodingKeys,  v19,  v17,  v18);
  if (v21)
  {
    uint64_t v30 = v48;
    sub_100019F7C(v49);
    sub_10003AACC(*(void *)v11, *((void *)v11 + 1));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_100043F40(v30, &qword_1002B9B18);
  }

  else
  {
    uint64_t v50 = (uint64_t *)v12;
    char v40 = (uint64_t *)v13;
    uint64_t v22 = v44;
    uint64_t v23 = (uint64_t)v45;
    char v52 = 0;
    unint64_t v24 = sub_1001C784C();
    uint64_t v25 = v46;
    uint64_t v26 = v20;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( &type metadata for Data,  &v52,  v46,  &type metadata for Data,  v24);
    *(_OWORD *)unint64_t v11 = v51;
    LOBYTE(v51) = 1;
    *((void *)v11 + 2) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v51, v25);
    *((void *)v11 + 3) = v27;
    LOBYTE(v51) = 2;
    *((void *)v11 + 4) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v51, v25);
    *((void *)v11 + 5) = v28;
    LOBYTE(v51) = 3;
    sub_1000221A8( &qword_1002B9B60,  type metadata accessor for ClientOverride.Server,  (uint64_t)&protocol conformance descriptor for ClientOverride.Server);
    uint64_t v29 = (uint64_t)v43;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v42, &v51, v25, v42);
    sub_1001C5EC4(v29, (uint64_t)&v11[v47[7]]);
    LOBYTE(v51) = 4;
    uint64_t v31 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v51, v25);
    char v32 = v50;
    *uint64_t v50 = v31;
    *((_BYTE *)v32 + 8) = v33 & 1;
    LOBYTE(v51) = 5;
    uint64_t v34 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v51, v25);
    unint64_t v35 = v40;
    *char v40 = v34;
    *((_BYTE *)v35 + 8) = v36 & 1;
    LOBYTE(v51) = 6;
    uint64_t v37 = sub_1000221A8( &qword_1002B9B68,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v15, &v51, v25, v15, v37);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v25);
    sub_1001C6D7C(v23, v48);
    sub_1001C7890((uint64_t)v11, v41, type metadata accessor for ClientOverride);
    sub_100019F7C(v49);
    return sub_1000A77B0((uint64_t)v11, type metadata accessor for ClientOverride);
  }

unint64_t sub_1001C784C()
{
  unint64_t result = qword_1002B9B58;
  if (!qword_1002B9B58)
  {
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1002B9B58);
  }

  return result;
}

uint64_t sub_1001C7890(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1001C78D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverride.init(from:)(a1, a2);
}

uint64_t sub_1001C78EC(void *a1)
{
  return ClientOverride.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverride(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    unint64_t v7 = a2[1];
    if (v7 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }

    else
    {
      uint64_t v9 = *a2;
      sub_10003AA88(*a2, a2[1]);
      *uint64_t v4 = v9;
      v4[1] = v7;
    }

    uint64_t v10 = a2[3];
    v4[2] = a2[2];
    void v4[3] = v10;
    uint64_t v11 = a2[5];
    v4[4] = a2[4];
    v4[5] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (char *)a2 + v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3LL, v15))
    {
      uint64_t v17 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
    }

    else
    {
      uint64_t v18 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v13, v14, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 3LL, v15);
    }

    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    Swift::String v21 = (char *)v4 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(void *)Swift::String v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = (char *)v4 + v20;
    unint64_t v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    _BYTE v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = type metadata accessor for UUID(0LL);
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1LL, v28))
    {
      uint64_t v30 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0LL, 1LL, v28);
    }
  }

  return v4;
}

uint64_t destroy for ClientOverride(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15) {
    sub_10003A9EC(*a1, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v5 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(v5, 3LL, v6))
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v5, v7);
  }

  uint64_t v8 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1LL, v9);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  return result;
}

uint64_t initializeWithCopy for ClientOverride(uint64_t a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    uint64_t v7 = *a2;
    sub_10003AA88(*a2, a2[1]);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v6;
  }

  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (char *)a2 + v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3LL, v13))
  {
    uint64_t v15 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    uint64_t v16 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v11, v12, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 3LL, v13);
  }

  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(_BYTE *)(v19 + 8) = v20[8];
  uint64_t v21 = a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(_BYTE *)(v21 + 8) = v22[8];
  uint64_t v23 = a3[10];
  unint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = type metadata accessor for UUID(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26))
  {
    uint64_t v28 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0LL, 1LL, v26);
  }

  return a1;
}

uint64_t *assignWithCopy for ClientOverride(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if ((unint64_t)a1[1] >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v7 = *a2;
      sub_10003AA88(*a2, a2[1]);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  if (v6 >> 60 == 15)
  {
    sub_100047E84((uint64_t)a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }

  uint64_t v8 = *a2;
  sub_10003AA88(*a2, a2[1]);
  uint64_t v9 = *a1;
  unint64_t v10 = a1[1];
  *a1 = v8;
  a1[1] = v6;
  sub_10003A9EC(v9, v10);
LABEL_8:
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 3LL, v14);
  int v18 = v16(v13, 3LL, v14);
  if (v17)
  {
    if (!v18)
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v12, v13, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 3LL, v14);
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  if (v18)
  {
    sub_100043F40((uint64_t)v12, &qword_1002B9A70);
LABEL_13:
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v12, v13, *(void *)(*(void *)(v20 - 8) + 64LL));
    goto LABEL_14;
  }

  uint64_t v39 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 24LL))(v12, v13, v39);
LABEL_14:
  uint64_t v21 = a3[8];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  double v22[8] = v23[8];
  *(void *)uint64_t v22 = v24;
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = a3[10];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = type metadata accessor for UUID(0LL);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1LL, v32);
  int v36 = v34(v31, 1LL, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_19;
  }

  if (v36)
  {
LABEL_19:
    uint64_t v37 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v30, v31, *(void *)(*(void *)(v37 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0LL, 1LL, v32);
  return a1;
}

_OWORD *initializeWithTake for ClientOverride(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 3LL, v10))
  {
    uint64_t v12 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    uint64_t v13 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v8, v9, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 3LL, v10);
  }

  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = (char *)a1 + v14;
  int v17 = (char *)a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  int v18 = (char *)a1 + v15;
  uint64_t v19 = (char *)a2 + v15;
  *(void *)int v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[10];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = type metadata accessor for UUID(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1LL, v23))
  {
    uint64_t v25 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0LL, 1LL, v23);
  }

  return a1;
}

uint64_t assignWithTake for ClientOverride(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7 >> 60 == 15)
  {
    sub_100047E84(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }

  uint64_t v8 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  sub_10003A9EC(v8, v6);
LABEL_6:
  uint64_t v9 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 3LL, v14);
  int v18 = v16(v13, 3LL, v14);
  if (v17)
  {
    if (!v18)
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 32LL))(v12, v13, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 3LL, v14);
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if (v18)
  {
    sub_100043F40((uint64_t)v12, &qword_1002B9A70);
LABEL_11:
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v12, v13, *(void *)(*(void *)(v20 - 8) + 64LL));
    goto LABEL_12;
  }

  uint64_t v37 = type metadata accessor for URL(0LL);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 40LL))(v12, v13, v37);
LABEL_12:
  uint64_t v21 = a3[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = a1 + v21;
  uint64_t v24 = a2 + v21;
  *(void *)uint64_t v23 = *(void *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  uint64_t v25 = a1 + v22;
  uint64_t v26 = a2 + v22;
  *(void *)uint64_t v25 = *(void *)v26;
  *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  uint64_t v30 = type metadata accessor for UUID(0LL);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v31 + 48);
  int v33 = v32(v28, 1LL, v30);
  int v34 = v32(v29, 1LL, v30);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 40))(v28, v29, v30);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_17;
  }

  if (v34)
  {
LABEL_17:
    uint64_t v35 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v28, v29, *(void *)(*(void *)(v35 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v31 + 32))(v28, v29, v30);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0LL, 1LL, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientOverride(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001C84C4);
}

uint64_t sub_1001C84C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }

  else
  {
    uint64_t v9 = type metadata accessor for ClientOverride.Server(0LL);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 28);
    }

    else
    {
      uint64_t v11 = sub_1000175B0(&qword_1002B9B18);
      uint64_t v10 = *(void *)(v11 - 8);
      uint64_t v12 = *(int *)(a3 + 40);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }

uint64_t storeEnumTagSinglePayload for ClientOverride(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001C8580);
}

uint64_t sub_1001C8580(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }

  else
  {
    uint64_t v8 = type metadata accessor for ClientOverride.Server(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 28);
    }

    else
    {
      uint64_t v10 = sub_1000175B0(&qword_1002B9B18);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 40);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }

  return result;
}

void sub_1001C8620(uint64_t a1)
{
  v6[0] = &unk_10020CA10;
  v6[1] = &unk_10020CA28;
  _OWORD v6[2] = &unk_10020CA28;
  uint64_t v2 = type metadata accessor for ClientOverride.Server(319LL);
  if (v3 <= 0x3F)
  {
    v6[3] = *(void *)(v2 - 8) + 64LL;
    void v6[4] = &unk_10020CA40;
    void v6[5] = &unk_10020CA40;
    sub_1001C86C8(319LL);
    if (v5 <= 0x3F)
    {
      v6[6] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 7LL, v6, a1 + 16);
    }
  }

void sub_1001C86C8(uint64_t a1)
{
  if (!qword_1002B9BD8)
  {
    uint64_t v2 = type metadata accessor for UUID(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1002B9BD8);
    }
  }

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverride.Server(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3LL, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      uint64_t v10 = type metadata accessor for URL(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 3LL, v7);
    }
  }

  return a1;
}

uint64_t destroy for ClientOverride.Server(uint64_t a1)
{
  uint64_t v2 = sub_1000175B0(&qword_1002B9A70);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(a1, 3LL, v2);
  if (!(_DWORD)result)
  {
    uint64_t v4 = type metadata accessor for URL(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  }

  return result;
}

void *initializeWithCopy for ClientOverride.Server(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 3LL, v6);
  }

  return a1;
}

void *assignWithCopy for ClientOverride.Server(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3LL, v6);
  int v10 = v8(a2, 3LL, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24LL))(a1, a2, v13);
      return a1;
    }

    sub_100043F40((uint64_t)a1, &qword_1002B9A70);
    goto LABEL_6;
  }

  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  uint64_t v11 = type metadata accessor for URL(0LL);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 3LL, v6);
  return a1;
}

void *initializeWithTake for ClientOverride.Server(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 3LL, v6);
  }

  return a1;
}

void *assignWithTake for ClientOverride.Server(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3LL, v6);
  int v10 = v8(a2, 3LL, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40LL))(a1, a2, v13);
      return a1;
    }

    sub_100043F40((uint64_t)a1, &qword_1002B9A70);
    goto LABEL_6;
  }

  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  uint64_t v11 = type metadata accessor for URL(0LL);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 3LL, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientOverride.Server(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001C8BE8);
}

uint64_t sub_1001C8BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002B9A70);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ClientOverride.Server(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001C8C44);
}

uint64_t sub_1001C8C44(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = sub_1000175B0(&qword_1002B9A70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(a1, v5, a3, v6);
}

uint64_t sub_1001C8C9C(uint64_t a1)
{
  uint64_t v2 = sub_1000175B0(&qword_1002B9A70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(a1, 3LL, v2);
}

uint64_t sub_1001C8CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002B9A70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, 3LL, v4);
}

uint64_t sub_1001C8D1C(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256LL, *(void *)(result - 8) + 64LL, 3LL);
    return 0LL;
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ClientOverride.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClientOverride.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

uint64_t storeEnumTagSinglePayload for ClientOverride.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_1001C8E58 + 4 * byte_10020C8C0[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1001C8E8C + 4 * byte_10020C8BB[v4]))();
}

uint64_t sub_1001C8E8C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001C8E94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001C8E9CLL);
  }
  return result;
}

uint64_t sub_1001C8EA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001C8EB0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_1001C8EB4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001C8EBC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClientOverride.CodingKeys()
{
  return &type metadata for ClientOverride.CodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.AutomaticCodingKeys()
{
  return &type metadata for ClientOverride.Server.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.ProductionCodingKeys()
{
  return &type metadata for ClientOverride.Server.ProductionCodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.SandboxCodingKeys()
{
  return &type metadata for ClientOverride.Server.SandboxCodingKeys;
}

uint64_t getEnumTagSinglePayload for ClientOverride.Server.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

uint64_t storeEnumTagSinglePayload for ClientOverride.Server.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001C8FE4 + 4 * byte_10020C8CA[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001C9018 + 4 * byte_10020C8C5[v4]))();
}

uint64_t sub_1001C9018(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001C9020(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001C9028LL);
  }
  return result;
}

uint64_t sub_1001C9034(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001C903CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001C9040(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001C9048(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.CodingKeys()
{
  return &type metadata for ClientOverride.Server.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ClientOverride.Server.XcodeTestCodingKeys(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1001C90A8 + 4 * byte_10020C8CF[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1001C90C8 + 4 * byte_10020C8D4[v4]))();
  }
}

_BYTE *sub_1001C90A8(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1001C90C8(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1001C90D0(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1001C90D8(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1001C90E0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1001C90E8(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.XcodeTestCodingKeys()
{
  return &type metadata for ClientOverride.Server.XcodeTestCodingKeys;
}

unint64_t sub_1001C9108()
{
  unint64_t result = qword_1002B9CA0;
  if (!qword_1002B9CA0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CB74, &type metadata for ClientOverride.Server.XcodeTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CA0);
  }

  return result;
}

unint64_t sub_1001C9150()
{
  unint64_t result = qword_1002B9CA8;
  if (!qword_1002B9CA8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CC2C, &type metadata for ClientOverride.Server.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CA8);
  }

  return result;
}

unint64_t sub_1001C9198()
{
  unint64_t result = qword_1002B9CB0;
  if (!qword_1002B9CB0)
  {
    unint64_t result = swift_getWitnessTable("mX\b", &type metadata for ClientOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CB0);
  }

  return result;
}

unint64_t sub_1001C91E0()
{
  unint64_t result = qword_1002B9CB8;
  if (!qword_1002B9CB8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CD44, &type metadata for ClientOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CB8);
  }

  return result;
}

unint64_t sub_1001C9228()
{
  unint64_t result = qword_1002B9CC0;
  if (!qword_1002B9CC0)
  {
    unint64_t result = swift_getWitnessTable("mX\b", &type metadata for ClientOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CC0);
  }

  return result;
}

unint64_t sub_1001C9270()
{
  unint64_t result = qword_1002B9CC8;
  if (!qword_1002B9CC8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CCF4, &type metadata for ClientOverride.Server.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CC8);
  }

  return result;
}

unint64_t sub_1001C92B8()
{
  unint64_t result = qword_1002B9CD0;
  if (!qword_1002B9CD0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CD1C, &type metadata for ClientOverride.Server.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CD0);
  }

  return result;
}

unint64_t sub_1001C9300()
{
  unint64_t result = qword_1002B9CD8;
  if (!qword_1002B9CD8)
  {
    unint64_t result = swift_getWitnessTable("eY\b", &type metadata for ClientOverride.Server.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CD8);
  }

  return result;
}

unint64_t sub_1001C9348()
{
  unint64_t result = qword_1002B9CE0;
  if (!qword_1002B9CE0)
  {
    unint64_t result = swift_getWitnessTable("\rY\b", &type metadata for ClientOverride.Server.ProductionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CE0);
  }

  return result;
}

unint64_t sub_1001C9390()
{
  unint64_t result = qword_1002B9CE8;
  if (!qword_1002B9CE8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CC54, &type metadata for ClientOverride.Server.SandboxCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CE8);
  }

  return result;
}

unint64_t sub_1001C93D8()
{
  unint64_t result = qword_1002B9CF0;
  if (!qword_1002B9CF0)
  {
    unint64_t result = swift_getWitnessTable("]Y\b", &type metadata for ClientOverride.Server.SandboxCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CF0);
  }

  return result;
}

unint64_t sub_1001C9420()
{
  unint64_t result = qword_1002B9CF8;
  if (!qword_1002B9CF8)
  {
    unint64_t result = swift_getWitnessTable("%[\b", &type metadata for ClientOverride.Server.XcodeTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9CF8);
  }

  return result;
}

unint64_t sub_1001C9468()
{
  unint64_t result = qword_1002B9D00;
  if (!qword_1002B9D00)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CB0C, &type metadata for ClientOverride.Server.XcodeTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D00);
  }

  return result;
}

unint64_t sub_1001C94B0()
{
  unint64_t result = qword_1002B9D08;
  if (!qword_1002B9D08)
  {
    unint64_t result = swift_getWitnessTable("mZ\b", &type metadata for ClientOverride.Server.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D08);
  }

  return result;
}

unint64_t sub_1001C94F8()
{
  unint64_t result = qword_1002B9D10;
  if (!qword_1002B9D10)
  {
    unint64_t result = swift_getWitnessTable(byte_10020CBC4, &type metadata for ClientOverride.Server.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D10);
  }

  return result;
}

uint64_t sub_1001C953C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6974616D6F747561LL && a2 == 0xE900000000000063LL)
  {
    unint64_t v5 = 0xE900000000000063LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6974616D6F747561LL, 0xE900000000000063LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x69746375646F7270LL && a2 == 0xEA00000000006E6FLL)
  {
    unint64_t v7 = 0xEA00000000006E6FLL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x69746375646F7270LL, 0xEA00000000006E6FLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x786F62646E6173LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v8 = 0xE700000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x786F62646E6173LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x73655465646F6378LL && a2 == 0xE900000000000074LL)
  {
    swift_bridgeObjectRelease(0xE900000000000074LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73655465646F6378LL, 0xE900000000000074LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_1001C9710(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100222A50LL)
  {
    swift_bridgeObjectRelease(0x8000000100222A50LL);
    char v3 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100222A50LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v3 = v4 ^ 1;
  }

  return v3 & 1;
}

uint64_t sub_1001C9794(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000015LL)
  {
    unint64_t v4 = 0x8000000100222A70LL;
    if (a2 == 0x8000000100222A70LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100222A70LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x4274736575716572LL && a2 == 0xEF4449656C646E75LL)
  {
    unint64_t v6 = 0xEF4449656C646E75LL;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4274736575716572LL, 0xEF4449656C646E75LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
    goto LABEL_11;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v7 = 0x8000000100222A90LL;
    if (a2 == 0x8000000100222A90LL) {
      goto LABEL_16;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100222A90LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v7);
    return 2LL;
  }

  if (a1 == 0x726576726573LL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_22:
    swift_bridgeObjectRelease(v8);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726576726573LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_22;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v9 = 0x8000000100222AB0LL;
    if (a2 == 0x8000000100222AB0LL) {
      goto LABEL_27;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100222AB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
LABEL_27:
    swift_bridgeObjectRelease(v9);
    return 4LL;
  }

  if (a1 == 0x65744965726F7473LL && a2 == 0xEB0000000044496DLL)
  {
    unint64_t v10 = 0xEB0000000044496DLL;
LABEL_33:
    swift_bridgeObjectRelease(v10);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65744965726F7473LL, 0xEB0000000044496DLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_33;
  }

  if (a1 == 0x4449726F646E6576LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 6LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x4449726F646E6576LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 6LL;
    }
    else {
      return 7LL;
    }
  }

Swift::Bool __swiftcall NSFileManager.isDirectory(atPath:)(Swift::String atPath)
{
  Swift::Bool v4 = 0;
  NSString v2 = String._bridgeToObjectiveC()();
  [v1 fileExistsAtPath:v2 isDirectory:&v4];

  return v4;
}

uint64_t NSFileManager.fileExists(at:)()
{
  __int16 v1 = v0;
  char v7 = 0;
  object = URL.path(percentEncoded:)(0)._object;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  unsigned int v4 = [v1 fileExistsAtPath:v3 isDirectory:&v7];

  if (v7) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  return v5 | v4;
}

BOOL ExternalGatewayMode.isLink.getter(char a1)
{
  return (a1 & 0xFD) == 0;
}

uint64_t ExternalGatewayMode.description.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1001C9C10 + 4 * byte_10020CFE0[a1]))( 0xD000000000000016LL,  0x8000000100222B30LL);
}

unint64_t sub_1001C9C10()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1001C9C2C()
{
  return v0 + 3;
}

unint64_t sub_1001C9C58@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = _s15StoreKit_Shared19ExternalGatewayModeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1001C9C80(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1001C9C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001CBA0C();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1001C9CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001CBA0C();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_1001C9D34(char a1)
{
  unint64_t v2 = 0xD000000000000013LL;
  Hasher.init(_seed:)(v5);
  if (a1)
  {
    if (a1 == 1)
    {
      unint64_t v2 = 0xD000000000000015LL;
      unint64_t v3 = 0x8000000100222930LL;
    }

    else
    {
      unint64_t v3 = 0x8000000100222950LL;
    }
  }

  else
  {
    unint64_t v3 = 0x8000000100222910LL;
  }

  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1001C9DD8(uint64_t a1, char a2)
{
  unint64_t v3 = 0xD000000000000013LL;
  if (a2)
  {
    if (a2 == 1)
    {
      unint64_t v3 = 0xD000000000000015LL;
      unint64_t v4 = 0x8000000100222930LL;
    }

    else
    {
      unint64_t v4 = 0x8000000100222950LL;
    }
  }

  else
  {
    unint64_t v4 = 0x8000000100222910LL;
  }

  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_1001C9E54(uint64_t a1, char a2)
{
  unint64_t v3 = 0xD000000000000013LL;
  Hasher.init(_seed:)(v6);
  if (a2)
  {
    if (a2 == 1)
    {
      unint64_t v3 = 0xD000000000000015LL;
      unint64_t v4 = 0x8000000100222930LL;
    }

    else
    {
      unint64_t v4 = 0x8000000100222950LL;
    }
  }

  else
  {
    unint64_t v4 = 0x8000000100222910LL;
  }

  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t ExternalGatewayOptionsKey.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013LL;
  if (a1 == 1) {
    return 0xD000000000000015LL;
  }
  return result;
}

uint64_t sub_1001C9F54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1001CF3AC(*a1, *a2);
}

Swift::Int sub_1001C9F60()
{
  return sub_1001C9D34(*v0);
}

uint64_t sub_1001C9F68(uint64_t a1)
{
  return sub_1001C9DD8(a1, *v1);
}

Swift::Int sub_1001C9F70(uint64_t a1)
{
  return sub_1001C9E54(a1, *v1);
}

unint64_t sub_1001C9F78@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = _s15StoreKit_Shared25ExternalGatewayOptionsKeyO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_1001C9FA4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ExternalGatewayOptionsKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ExternalGatewaySheetRequest.generateToken.getter()
{
  return *v0;
}

uint64_t ExternalGatewaySheetRequest.kind.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ExternalGatewaySheetRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain(*(void *)(v0 + 16));
  return v1;
}

uint64_t ExternalGatewaySheetRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t ExternalGatewaySheetRequest.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 24));
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t ExternalGatewaySheetRequest.presentSheet.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t ExternalGatewaySheetRequest.hostSceneID.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain(*(void *)(v0 + 48));
  return v1;
}

uint64_t ExternalGatewaySheetRequest.init(kind:options:presentSheet:hostSceneID:generateToken:logKey:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(_BYTE *)a9 = a6;
  *(_BYTE *)(a9 + 1) = result;
  *(void *)(a9 + 8) = a7;
  *(void *)(a9 + 16) = a8;
  *(void *)(a9 + 24) = a2;
  *(_BYTE *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  return result;
}

uint64_t ExternalGatewaySheetRequest.subscript.getter@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for Optional(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v22 - v9;
  sub_1000390C8(v3 + 24, (uint64_t)v24, &qword_1002B9D18);
  sub_1000390C8((uint64_t)v24, (uint64_t)&v25, &qword_1002B9D18);
  uint64_t v11 = v25;
  if (!v25)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    goto LABEL_14;
  }

  uint64_t v12 = 0xD000000000000013LL;
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v12 = 0xD000000000000015LL;
      uint64_t v13 = 0x8000000100222930LL;
    }

    else
    {
      uint64_t v13 = 0x8000000100222950LL;
    }

    if (!*(void *)(v25 + 16)) {
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v13 = 0x8000000100222910LL;
    if (!*(void *)(v25 + 16))
    {
LABEL_12:
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      goto LABEL_13;
    }
  }

  unint64_t v14 = sub_1001CA790(v12, v13);
  if ((v15 & 1) == 0) {
    goto LABEL_12;
  }
  sub_10002C010(*(void *)(v11 + 56) + 32 * v14, (uint64_t)&v22);
LABEL_13:
  swift_bridgeObjectRelease();
LABEL_14:
  uint64_t v16 = sub_1000175B0(&qword_1002B9D20);
  int v17 = swift_dynamicCast(v10, &v22, v16, a2, 6LL);
  uint64_t v18 = *(void *)(a2 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if (v17)
  {
    v19(v10, 0LL, 1LL, a2);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a3, v10, a2);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
    v19(v10, 1LL, 1LL, a2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19)(a3, v20, 1LL, a2);
}

double ExternalGatewaySheetRequest.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }

  return result;
}

uint64_t ExternalGatewaySheetRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B9D28);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001CAF24();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ExternalGatewaySheetRequest.CodingKeys,  &type metadata for ExternalGatewaySheetRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  LOBYTE(v31[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v31, v5);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  LOBYTE(v31[0]) = v3[1];
  HIBYTE(v30) = 1;
  unint64_t v13 = sub_1001CAF68();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v31, (char *)&v30 + 7, v5, &type metadata for ExternalGatewayMode, v13);
  uint64_t v14 = *((void *)v3 + 1);
  uint64_t v15 = *((void *)v3 + 2);
  LOBYTE(v31[0]) = 2;
  KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v31, v5);
  uint64_t v16 = v3[32];
  LOBYTE(v31[0]) = 4;
  KeyedEncodingContainer.encode(_:forKey:)(v16, v31, v5);
  sub_1000390C8((uint64_t)(v3 + 40), (uint64_t)v33, &qword_1002B9D40);
  sub_1000390C8((uint64_t)v33, (uint64_t)v31, &qword_1002B9D40);
  HIBYTE(v30) = 5;
  uint64_t v17 = sub_1000175B0(&qword_1002B9D40);
  unint64_t v18 = sub_1001CAFAC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v31, (char *)&v30 + 7, v5, v17, v18);
  sub_1000390C8((uint64_t)(v3 + 24), (uint64_t)v32, &qword_1002B9D18);
  sub_1000390C8((uint64_t)v32, (uint64_t)&v34, &qword_1002B9D18);
  if (!v34) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v31[0] = 0LL;
  id v22 = [v20 dataWithJSONObject:isa options:0 error:v31];

  id v23 = v31[0];
  if (!v22)
  {
    uint64_t v28 = v23;
    _convertNSErrorToError(_:)(v23);

    swift_willThrow(v29);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  uint64_t v24 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v26 = v25;

  v31[0] = v24;
  v31[1] = v26;
  HIBYTE(v30) = 3;
  unint64_t v27 = sub_1001C73A8();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v31, (char *)&v30 + 7, v5, &type metadata for Data, v27);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_10003A9EC((uint64_t)v24, (unint64_t)v26);
}

uint64_t sub_1001CA624()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001CA660 + 4 * byte_10020CFE4[*v0]))( 0x65746172656E6567LL,  0xED00006E656B6F54LL);
}

uint64_t sub_1001CA660()
{
  return 1684957547LL;
}

uint64_t sub_1001CA670()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001CA684()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_1001CA69C()
{
  return 0x53746E6573657270LL;
}

uint64_t sub_1001CA6BC()
{
  return 0x6E65635374736F68LL;
}

uint64_t sub_1001CA6DC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001CB750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001CA700(uint64_t a1)
{
  unint64_t v2 = sub_1001CAF24();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CA728(uint64_t a1)
{
  unint64_t v2 = sub_1001CAF24();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CA750(void *a1)
{
  return ExternalGatewaySheetRequest.encode(to:)(a1);
}

unint64_t sub_1001CA790(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = Hasher._finalize()();
  return sub_1000F1874(a1, a2, v4);
}

unint64_t sub_1001CA7F4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_1001CA824(a1, v4);
}

unint64_t sub_1001CA824(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1001CBA50(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1001BD878((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t _s15StoreKit_Shared19ExternalGatewayModeO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 4) {
    return 4LL;
  }
  return result;
}

unint64_t _s15StoreKit_Shared25ExternalGatewayOptionsKeyO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100291DF0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001CA940@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v57 = type metadata accessor for DecodingError.Context(0LL);
  uint64_t v3 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000175B0(&qword_1002B9D80);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v59 = a1;
  sub_100019F58(a1, v10);
  unint64_t v12 = sub_1001CAF24();
  uint64_t v13 = v60;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ExternalGatewaySheetRequest.CodingKeys,  &type metadata for ExternalGatewaySheetRequest.CodingKeys,  v12,  v10,  v11);
  if (v13)
  {
    sub_100019F7C(v59);
    return swift_bridgeObjectRelease();
  }

  uint64_t v14 = v7;
  LOBYTE(v62) = 0;
  uint64_t v15 = v6;
  LODWORD(v60) = KeyedDecodingContainer.decode(_:forKey:)(&v62, v6);
  LOBYTE(v61) = 1;
  sub_1001CBA8C();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for ExternalGatewayMode,  &v61,  v6,  &type metadata for ExternalGatewayMode);
  int v16 = v62;
  LOBYTE(v62) = 2;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)(&v62, v15);
  uint64_t v56 = v18;
  uint64_t v54 = v17;
  int v55 = v16;
  LOBYTE(v62) = 4;
  swift_bridgeObjectRetain();
  int v52 = KeyedDecodingContainer.decode(_:forKey:)(&v62, v15);
  LOBYTE(v62) = 5;
  uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v62, v15);
  LOBYTE(v61) = 3;
  uint64_t v22 = v21;
  unint64_t v23 = sub_1001C784C();
  uint64_t v53 = v22;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&type metadata for Data, &v61, v15, &type metadata for Data, v23);
  uint64_t v51 = v20;
  unint64_t v24 = v63;
  if (v63 >> 60 != 15)
  {
    uint64_t v26 = (uint64_t)v62;
    unint64_t v27 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
    uint64_t v49 = v26;
    id v50 = v27;
    unint64_t v48 = v24;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v62 = 0LL;
    id v29 = [v50 JSONObjectWithData:isa options:0 error:&v62];

    if (v29)
    {
      id v30 = v62;
      _bridgeAnyObjectToAny(_:)(&v62, v29);
      swift_unknownObjectRelease(v29);
      uint64_t v31 = sub_1000175B0(&qword_1002B9D90);
      if ((swift_dynamicCast(&v61, &v62, (char *)&type metadata for Any + 8, v31, 6LL) & 1) != 0)
      {
        sub_10003AACC(v49, v48);
        uint64_t v25 = v61;
        (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v15);
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v40 = sub_1000175B0(&qword_1002B9D98);
      uint64_t v41 = swift_allocObject(v40, 72LL, 7LL);
      *(_OWORD *)(v41 + 16) = xmmword_1001F3C00;
      *(void *)(v41 + 56) = &type metadata for ExternalGatewaySheetRequest.CodingKeys;
      *(void *)(v41 + 64) = v12;
      *(_BYTE *)(v41 + 32) = 3;
      id v62 = 0LL;
      unint64_t v63 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(28LL);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v41,  0xD000000000000031LL,  0x8000000100222B50LL,  0LL);
      uint64_t v42 = type metadata accessor for DecodingError(0LL);
      swift_allocError(v42, &protocol witness table for DecodingError, 0LL, 0LL);
      uint64_t v44 = v43;
      uint64_t v45 = v57;
      (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v43, v5, v57);
      uint64_t v46 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v42 - 8) + 104LL))( v44,  enum case for DecodingError.dataCorrupted(_:),  v42);
      swift_willThrow(v46);
      sub_10003AACC(v49, v48);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v45);
    }

    else
    {
      id v37 = v62;
      id v38 = v62;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _convertNSErrorToError(_:)(v37);

      swift_willThrow(v39);
      sub_10003AACC(v49, v48);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v15);
    sub_100019F7C(v59);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v15);
  swift_bridgeObjectRelease();
  uint64_t v25 = 0LL;
LABEL_10:
  char v32 = v60 & 1;
  char v33 = v52 & 1;
  swift_bridgeObjectRetain();
  sub_100019F7C(v59);
  uint64_t v34 = v53;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = v56;
  uint64_t result = swift_bridgeObjectRelease();
  int v36 = v58;
  *uint64_t v58 = v32;
  v36[1] = v55;
  *((void *)v36 + 1) = v54;
  *((void *)v36 + 2) = v35;
  *((void *)v36 + 3) = v25;
  v36[32] = v33;
  *((void *)v36 + 5) = v51;
  *((void *)v36 + 6) = v34;
  return result;
}

unint64_t sub_1001CAF24()
{
  unint64_t result = qword_1002B9D30;
  if (!qword_1002B9D30)
  {
    unint64_t result = swift_getWitnessTable("AV\b", &type metadata for ExternalGatewaySheetRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D30);
  }

  return result;
}

unint64_t sub_1001CAF68()
{
  unint64_t result = qword_1002B9D38;
  if (!qword_1002B9D38)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ExternalGatewayMode,  &type metadata for ExternalGatewayMode);
    atomic_store(result, (unint64_t *)&qword_1002B9D38);
  }

  return result;
}

unint64_t sub_1001CAFAC()
{
  unint64_t result = qword_1002B9D48;
  if (!qword_1002B9D48)
  {
    uint64_t v1 = sub_100018EC0(&qword_1002B9D40);
    Swift::String v2 = &protocol witness table for String;
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for <A> A?, v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1002B9D48);
  }

  return result;
}

unint64_t sub_1001CB00C()
{
  unint64_t result = qword_1002B9D50;
  if (!qword_1002B9D50)
  {
    unint64_t result = swift_getWitnessTable("yX\b", &type metadata for ExternalGatewayMode);
    atomic_store(result, (unint64_t *)&qword_1002B9D50);
  }

  return result;
}

unint64_t sub_1001CB054()
{
  unint64_t result = qword_1002B9D58;
  if (!qword_1002B9D58)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ExternalGatewayOptionsKey,  &type metadata for ExternalGatewayOptionsKey);
    atomic_store(result, (unint64_t *)&qword_1002B9D58);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for ExternalGatewayMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001CB0E4 + 4 * byte_10020CFEF[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001CB118 + 4 * byte_10020CFEA[v4]))();
}

uint64_t sub_1001CB118(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB120(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001CB128LL);
  }
  return result;
}

uint64_t sub_1001CB134(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001CB13CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001CB140(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB148(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewayMode()
{
  return &type metadata for ExternalGatewayMode;
}

uint64_t getEnumTagSinglePayload for ExternalGatewayOptionsKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t storeEnumTagSinglePayload for ExternalGatewayOptionsKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1001CB240 + 4 * byte_10020CFF9[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001CB274 + 4 * byte_10020CFF4[v4]))();
}

uint64_t sub_1001CB274(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB27C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001CB284LL);
  }
  return result;
}

uint64_t sub_1001CB290(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001CB298LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1001CB29C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB2A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewayOptionsKey()
{
  return &type metadata for ExternalGatewayOptionsKey;
}

uint64_t destroy for ExternalGatewaySheetRequest(void *a1)
{
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t initializeWithCopy for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease(*(void *)(a1 + 16));
  uint64_t v4 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v4);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExternalGatewaySheetRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExternalGatewaySheetRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewaySheetRequest()
{
  return &type metadata for ExternalGatewaySheetRequest;
}

uint64_t getEnumTagSinglePayload for ExternalGatewaySheetRequest.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for ExternalGatewaySheetRequest.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_1001CB5F8 + 4 * byte_10020D003[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1001CB62C + 4 * byte_10020CFFE[v4]))();
}

uint64_t sub_1001CB62C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB634(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001CB63CLL);
  }
  return result;
}

uint64_t sub_1001CB648(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001CB650LL);
  }
  *(_BYTE *)__n128 result = a2 + 5;
  return result;
}

uint64_t sub_1001CB654(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CB65C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewaySheetRequest.CodingKeys()
{
  return &type metadata for ExternalGatewaySheetRequest.CodingKeys;
}

unint64_t sub_1001CB67C()
{
  unint64_t result = qword_1002B9D60;
  if (!qword_1002B9D60)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D2F8, &type metadata for ExternalGatewaySheetRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D60);
  }

  return result;
}

unint64_t sub_1001CB6C4()
{
  unint64_t result = qword_1002B9D68;
  if (!qword_1002B9D68)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D268, &type metadata for ExternalGatewaySheetRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D68);
  }

  return result;
}

unint64_t sub_1001CB70C()
{
  unint64_t result = qword_1002B9D70;
  if (!qword_1002B9D70)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D290, &type metadata for ExternalGatewaySheetRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9D70);
  }

  return result;
}

uint64_t sub_1001CB750(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x65746172656E6567LL && a2 == 0xED00006E656B6F54LL)
  {
    unint64_t v5 = 0xED00006E656B6F54LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65746172656E6567LL, 0xED00006E656B6F54LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v7 = 0xE400000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000LL)
  {
    unint64_t v9 = 0xE700000000000000LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x736E6F6974706FLL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x53746E6573657270LL && a2 == 0xEC00000074656568LL)
  {
    unint64_t v10 = 0xEC00000074656568LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x53746E6573657270LL, 0xEC00000074656568LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0x6E65635374736F68LL && a2 == 0xEB00000000444965LL)
  {
    swift_bridgeObjectRelease(0xEB00000000444965LL);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E65635374736F68LL, 0xEB00000000444965LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

unint64_t sub_1001CBA0C()
{
  unint64_t result = qword_1002B9D78;
  if (!qword_1002B9D78)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ExternalGatewayMode,  &type metadata for ExternalGatewayMode);
    atomic_store(result, (unint64_t *)&qword_1002B9D78);
  }

  return result;
}

uint64_t sub_1001CBA50(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1001CBA8C()
{
  unint64_t result = qword_1002B9D88;
  if (!qword_1002B9D88)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ExternalGatewayMode,  &type metadata for ExternalGatewayMode);
    atomic_store(result, (unint64_t *)&qword_1002B9D88);
  }

  return result;
}

uint64_t sub_1001CBAD0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001CBB10 + 4 * byte_10020D380[a1]))( 0x4465727574616566LL,  0xEF64656C62617369LL);
}

uint64_t sub_1001CBB10()
{
  return 0x4164696C61766E69LL;
}

unint64_t sub_1001CBB2C()
{
  return 0xD000000000000018LL;
}

uint64_t sub_1001CBB4C()
{
  return 0x7469746E45746F6ELL;
}

uint64_t sub_1001CBB6C()
{
  return 0x746E6F4349556F6ELL;
}

unint64_t sub_1001CBB8C()
{
  return 0xD000000000000011LL;
}

uint64_t sub_1001CBBB4()
{
  return 0x6E776F6E6B6E75LL;
}

uint64_t sub_1001CBBCC()
{
  return 0x636E614372657375LL;
}

uint64_t sub_1001CBBF0()
{
  return 0x4D746E756F636361LL;
}

uint64_t sub_1001CBC14(uint64_t a1)
{
  unint64_t v2 = sub_1001CC66C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBC3C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC66C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBC64()
{
  return sub_1001CBAD0(*v0);
}

uint64_t sub_1001CBC6C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001CCB98(a1, a2);
  *a3 = result;
  return result;
}

void sub_1001CBC90(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_1001CBC9C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC628();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBCC4(uint64_t a1)
{
  unint64_t v2 = sub_1001CC628();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBCEC(uint64_t a1)
{
  unint64_t v2 = sub_1001CC8D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBD14(uint64_t a1)
{
  unint64_t v2 = sub_1001CC8D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBD3C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC88C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBD64(uint64_t a1)
{
  unint64_t v2 = sub_1001CC88C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBD8C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC7C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBDB4(uint64_t a1)
{
  unint64_t v2 = sub_1001CC7C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBDDC(uint64_t a1)
{
  unint64_t v2 = sub_1001CC848();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBE04(uint64_t a1)
{
  unint64_t v2 = sub_1001CC848();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBE2C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC804();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBE54(uint64_t a1)
{
  unint64_t v2 = sub_1001CC804();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBE7C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC77C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBEA4(uint64_t a1)
{
  unint64_t v2 = sub_1001CC77C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBECC(uint64_t a1)
{
  unint64_t v2 = sub_1001CC738();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBEF4(uint64_t a1)
{
  unint64_t v2 = sub_1001CC738();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBF1C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC6F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBF44(uint64_t a1)
{
  unint64_t v2 = sub_1001CC6F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CBF6C(uint64_t a1)
{
  unint64_t v2 = sub_1001CC6B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CBF94(uint64_t a1)
{
  unint64_t v2 = sub_1001CC6B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

void StoreKitInternalError.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002B9DA0);
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  __chkstk_darwin(v3);
  uint64_t v42 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002B9DA8);
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  __chkstk_darwin(v5);
  uint64_t v39 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002B9DB0);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  __chkstk_darwin(v7);
  int v36 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002B9DB8);
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  __chkstk_darwin(v9);
  char v33 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_1000175B0(&qword_1002B9DC0);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  __chkstk_darwin(v11);
  id v30 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = sub_1000175B0(&qword_1002B9DC8);
  uint64_t v28 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  unint64_t v27 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = sub_1000175B0(&qword_1002B9DD0);
  uint64_t v25 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  unint64_t v24 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_1000175B0(&qword_1002B9DD8);
  v22[2] = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  v22[1] = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v22[0] = sub_1000175B0(&qword_1002B9DE0);
  __chkstk_darwin(v22[0]);
  uint64_t v16 = sub_1000175B0(&qword_1002B9DE8);
  __chkstk_darwin(v16);
  uint64_t v48 = sub_1000175B0(&qword_1002B9DF0);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  sub_100019F58(a1, v19);
  unint64_t v21 = sub_1001CC628();
  uint64_t v47 = v18;
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for StoreKitInternalError.CodingKeys,  &type metadata for StoreKitInternalError.CodingKeys,  v21,  v19,  v20);
  __asm { BR              X10 }

uint64_t sub_1001CC32C()
{
  *(_BYTE *)(v3 - 90) = 0;
  sub_1001CC8D0();
  uint64_t v5 = *(void *)(v3 - 112);
  uint64_t v4 = *(void *)(v3 - 104);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys,  v3 - 90,  v4,  &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 120) + 8LL))(v5, v4);
}

unint64_t sub_1001CC628()
{
  unint64_t result = qword_1002B9DF8;
  if (!qword_1002B9DF8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DEA4, &type metadata for StoreKitInternalError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9DF8);
  }

  return result;
}

unint64_t sub_1001CC66C()
{
  unint64_t result = qword_1002B9E00;
  if (!qword_1002B9E00)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DE54, &type metadata for StoreKitInternalError.AccountMissingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E00);
  }

  return result;
}

unint64_t sub_1001CC6B0()
{
  unint64_t result = qword_1002B9E08;
  if (!qword_1002B9E08)
  {
    unint64_t result = swift_getWitnessTable("EO\b", &type metadata for StoreKitInternalError.UserCancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E08);
  }

  return result;
}

unint64_t sub_1001CC6F4()
{
  unint64_t result = qword_1002B9E10;
  if (!qword_1002B9E10)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DDB4, &type metadata for StoreKitInternalError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E10);
  }

  return result;
}

unint64_t sub_1001CC738()
{
  unint64_t result = qword_1002B9E18;
  if (!qword_1002B9E18)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DD64, &type metadata for StoreKitInternalError.UnimplementedFlowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E18);
  }

  return result;
}

unint64_t sub_1001CC77C()
{
  unint64_t result = qword_1002B9E20;
  if (!qword_1002B9E20)
  {
    unint64_t result = swift_getWitnessTable("5P\b", &type metadata for StoreKitInternalError.PurchasesDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E20);
  }

  return result;
}

unint64_t sub_1001CC7C0()
{
  unint64_t result = qword_1002B9E28;
  if (!qword_1002B9E28)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DCC4, &type metadata for StoreKitInternalError.NoUIContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E28);
  }

  return result;
}

unint64_t sub_1001CC804()
{
  unint64_t result = qword_1002B9E30;
  if (!qword_1002B9E30)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DC74, &type metadata for StoreKitInternalError.NotEntitledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E30);
  }

  return result;
}

unint64_t sub_1001CC848()
{
  unint64_t result = qword_1002B9E38;
  if (!qword_1002B9E38)
  {
    unint64_t result = swift_getWitnessTable("%Q\b", &type metadata for StoreKitInternalError.NotAvailableInStorefrontCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E38);
  }

  return result;
}

unint64_t sub_1001CC88C()
{
  unint64_t result = qword_1002B9E40;
  if (!qword_1002B9E40)
  {
    unint64_t result = swift_getWitnessTable("uQ\b", &type metadata for StoreKitInternalError.InvalidAppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E40);
  }

  return result;
}

unint64_t sub_1001CC8D0()
{
  unint64_t result = qword_1002B9E48;
  if (!qword_1002B9E48)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DB84, &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E48);
  }

  return result;
}

uint64_t StoreKitInternalError.init(from:)(void *a1)
{
  return sub_1001CD034(a1);
}

uint64_t sub_1001CC928@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001CD034(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_1001CC950(void *a1)
{
}

uint64_t StoreKitServerError.rawValue.getter(char a1)
{
  return qword_10020DEF8[a1];
}

BOOL sub_1001CC980(char *a1, char *a2)
{
  return qword_10020DEF8[*a1] == qword_10020DEF8[*a2];
}

Swift::Int sub_1001CC9A4()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(qword_10020DEF8[v1]);
  return Hasher._finalize()();
}

void sub_1001CC9F0()
{
}

Swift::Int sub_1001CCA24()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(qword_10020DEF8[v1]);
  return Hasher._finalize()();
}

uint64_t sub_1001CCA6C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = _s15StoreKit_Shared0aB11ServerErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1001CCA94(void *a1@<X8>)
{
  *a1 = qword_10020DEF8[*v1];
}

uint64_t sub_1001CCAAC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1001CE4BC();
  unint64_t v5 = sub_1001CE500();
  return Error<>._code.getter(a1, a2, v4, v5);
}

uint64_t sub_1001CCAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001CE4BC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1001CCB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001CE4BC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_1001CCB98(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x4465727574616566LL && a2 == 0xEF64656C62617369LL)
  {
    unint64_t v5 = 0xEF64656C62617369LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4465727574616566LL, 0xEF64656C62617369LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x4164696C61766E69LL && a2 == 0xEA00000000007070LL)
  {
    unint64_t v7 = 0xEA00000000007070LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4164696C61766E69LL, 0xEA00000000007070LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0xD000000000000018LL && a2 == 0x8000000100222B90LL)
  {
    unint64_t v8 = 0x8000000100222B90LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x8000000100222B90LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x7469746E45746F6ELL && a2 == 0xEB0000000064656CLL)
  {
    unint64_t v9 = 0xEB0000000064656CLL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7469746E45746F6ELL, 0xEB0000000064656CLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x746E6F4349556F6ELL && a2 == 0xEB00000000747865LL)
  {
    unint64_t v10 = 0xEB00000000747865LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x746E6F4349556F6ELL, 0xEB00000000747865LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v11 = 0x8000000100222BB0LL;
    if (a2 == 0x8000000100222BB0LL) {
      goto LABEL_37;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100222BB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
LABEL_37:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v12 = 0x8000000100222BD0LL;
    if (a2 == 0x8000000100222BD0LL) {
      goto LABEL_42;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100222BD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
LABEL_42:
    swift_bridgeObjectRelease(v12);
    return 6LL;
  }

  if (a1 == 0x6E776F6E6B6E75LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v13 = 0xE700000000000000LL;
LABEL_48:
    swift_bridgeObjectRelease(v13);
    return 7LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E776F6E6B6E75LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v13 = a2;
    goto LABEL_48;
  }

  if (a1 == 0x636E614372657375LL && a2 == 0xED000064656C6C65LL)
  {
    unint64_t v14 = 0xED000064656C6C65LL;
LABEL_54:
    swift_bridgeObjectRelease(v14);
    return 8LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x636E614372657375LL, 0xED000064656C6C65LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_54;
  }

  if (a1 == 0x4D746E756F636361LL && a2 == 0xEE00676E69737369LL)
  {
    swift_bridgeObjectRelease(0xEE00676E69737369LL);
    return 9LL;
  }

  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(0x4D746E756F636361LL, 0xEE00676E69737369LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v15 & 1) != 0) {
      return 9LL;
    }
    else {
      return 10LL;
    }
  }

uint64_t sub_1001CD034(void *a1)
{
  uint64_t v2 = sub_1000175B0(&qword_1002B9F28);
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v54 = v2;
  __chkstk_darwin(v2);
  uint64_t v59 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1000175B0(&qword_1002B9F30);
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  __chkstk_darwin(v4);
  unint64_t v63 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000175B0(&qword_1002B9F38);
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  __chkstk_darwin(v6);
  id v62 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = sub_1000175B0(&qword_1002B9F40);
  uint64_t v45 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v61 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002B9F48);
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  __chkstk_darwin(v9);
  uint64_t v60 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = sub_1000175B0(&qword_1002B9F50);
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v58 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = sub_1000175B0(&qword_1002B9F58);
  uint64_t v41 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v57 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = sub_1000175B0(&qword_1002B9F60);
  uint64_t v39 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v56 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = sub_1000175B0(&qword_1002B9F68);
  uint64_t v37 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  int v55 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_1000175B0(&qword_1002B9F70);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_1000175B0(&qword_1002B9F78);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = a1[3];
  uint64_t v24 = a1[4];
  unsigned int v64 = a1;
  sub_100019F58(a1, v23);
  unint64_t v25 = sub_1001CC628();
  uint64_t v26 = v65;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for StoreKitInternalError.CodingKeys,  &type metadata for StoreKitInternalError.CodingKeys,  v25,  v23,  v24);
  if (!v26)
  {
    v35[3] = v18;
    v35[1] = v16;
    v35[2] = v15;
    uint64_t v36 = v20;
    uint64_t v65 = v22;
    uint64_t v27 = KeyedDecodingContainer.allKeys.getter(v19);
    if (*(void *)(v27 + 16) == 1LL)
    {
      v35[0] = v27;
      __asm { BR              X9 }
    }

    uint64_t v28 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v28, &protocol witness table for DecodingError, 0LL, 0LL);
    id v30 = v29;
    sub_1000175B0(&qword_1002B9F80);
    *id v30 = &type metadata for StoreKitInternalError;
    uint64_t v31 = v65;
    uint64_t v32 = KeyedDecodingContainer.codingPath.getter(v19);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v32,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v33 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v28 - 8) + 104LL))( v30,  enum case for DecodingError.typeMismatch(_:),  v28);
    swift_willThrow(v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v31, v19);
  }

  sub_100019F7C(v64);
  return v19;
}

uint64_t _s15StoreKit_Shared0aB11ServerErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if (a1 <= 3503)
  {
    if (a1 > 2054)
    {
      switch(a1)
      {
        case 3027LL:
          return 9LL;
        case 3028LL:
        case 3029LL:
        case 3030LL:
        case 3031LL:
        case 3032LL:
        case 3033LL:
        case 3034LL:
        case 3035LL:
        case 3036LL:
        case 3037LL:
        case 3039LL:
        case 3040LL:
        case 3041LL:
        case 3042LL:
        case 3043LL:
        case 3044LL:
        case 3045LL:
        case 3046LL:
        case 3047LL:
        case 3048LL:
        case 3049LL:
        case 3050LL:
        case 3051LL:
        case 3052LL:
        case 3053LL:
        case 3054LL:
        case 3055LL:
        case 3056LL:
        case 3057LL:
        case 3058LL:
          return 26LL;
        case 3038LL:
          return 10LL;
        case 3059LL:
          return 11LL;
        case 3060LL:
          return 12LL;
        default:
          if (a1 == 2055)
          {
            uint64_t result = 7LL;
          }

          else
          {
            if (a1 != 3004) {
              return 26LL;
            }
            uint64_t result = 8LL;
          }

          break;
      }
    }

    else
    {
      uint64_t v1 = a1 - 1001;
      uint64_t result = 1LL;
      switch(v1)
      {
        case 0LL:
          uint64_t result = 0LL;
          break;
        case 2LL:
          return result;
        case 3LL:
          uint64_t result = 2LL;
          break;
        case 4LL:
          uint64_t result = 3LL;
          break;
        case 5LL:
          uint64_t result = 4LL;
          break;
        default:
          return 26LL;
      }
    }

    return result;
  }

  if (a1 <= 3899)
  {
    if (a1 <= 3602)
    {
      if (a1 == 3504) {
        return 13LL;
      }
      if (a1 == 3513) {
        return 14LL;
      }
    }

    else
    {
      switch(a1)
      {
        case 3603LL:
          return 15LL;
        case 3604LL:
          return 16LL;
        case 3705LL:
          return 17LL;
      }
    }

    return 26LL;
  }

  if (a1 > 500316)
  {
    switch(a1)
    {
      case 500317LL:
        return 23LL;
      case 500328LL:
        return 24LL;
      case 4000029LL:
        return 25LL;
    }

    return 26LL;
  }

  switch(a1)
  {
    case 3900LL:
      uint64_t result = 18LL;
      break;
    case 3901LL:
      uint64_t result = 19LL;
      break;
    case 3902LL:
      uint64_t result = 20LL;
      break;
    case 3903LL:
      uint64_t result = 21LL;
      break;
    case 3904LL:
      uint64_t result = 22LL;
      break;
    default:
      return 26LL;
  }

  return result;
}

unint64_t sub_1001CDA48()
{
  unint64_t result = qword_1002B9E50;
  if (!qword_1002B9E50)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for StoreKitInternalError,  &type metadata for StoreKitInternalError);
    atomic_store(result, (unint64_t *)&qword_1002B9E50);
  }

  return result;
}

unint64_t sub_1001CDA90()
{
  unint64_t result = qword_1002B9E58;
  if (!qword_1002B9E58)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for StoreKitServerError,  &type metadata for StoreKitServerError);
    atomic_store(result, (unint64_t *)&qword_1002B9E58);
  }

  return result;
}

ValueMetadata *type metadata accessor for StoreKitInternalError()
{
  return &type metadata for StoreKitInternalError;
}

uint64_t getEnumTagSinglePayload for StoreKitServerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
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
      return (*a1 | (v4 << 8)) - 25;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }

uint64_t storeEnumTagSinglePayload for StoreKitServerError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE6) {
    return ((uint64_t (*)(void))((char *)&loc_1001CDBC8 + 4 * byte_10020D3D0[v4]))();
  }
  *a1 = a2 + 25;
  return ((uint64_t (*)(void))((char *)sub_1001CDBFC + 4 * byte_10020D3CB[v4]))();
}

uint64_t sub_1001CDBFC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CDC04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001CDC0CLL);
  }
  return result;
}

uint64_t sub_1001CDC18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001CDC20LL);
  }
  *(_BYTE *)unint64_t result = a2 + 25;
  return result;
}

uint64_t sub_1001CDC24(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CDC2C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoreKitServerError()
{
  return &type metadata for StoreKitServerError;
}

uint64_t _s15StoreKit_Shared21StoreKitInternalErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }

uint64_t _s15StoreKit_Shared21StoreKitInternalErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF6) {
    return ((uint64_t (*)(void))((char *)&loc_1001CDD24 + 4 * byte_10020D3DA[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1001CDD58 + 4 * byte_10020D3D5[v4]))();
}

uint64_t sub_1001CDD58(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CDD60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001CDD68LL);
  }
  return result;
}

uint64_t sub_1001CDD74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001CDD7CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 9;
  return result;
}

uint64_t sub_1001CDD80(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CDD88(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.CodingKeys()
{
  return &type metadata for StoreKitInternalError.CodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.FeatureDisabledCodingKeys()
{
  return &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.InvalidAppCodingKeys()
{
  return &type metadata for StoreKitInternalError.InvalidAppCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NotAvailableInStorefrontCodingKeys()
{
  return &type metadata for StoreKitInternalError.NotAvailableInStorefrontCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NotEntitledCodingKeys()
{
  return &type metadata for StoreKitInternalError.NotEntitledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NoUIContextCodingKeys()
{
  return &type metadata for StoreKitInternalError.NoUIContextCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.PurchasesDisabledCodingKeys()
{
  return &type metadata for StoreKitInternalError.PurchasesDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UnimplementedFlowCodingKeys()
{
  return &type metadata for StoreKitInternalError.UnimplementedFlowCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UnknownCodingKeys()
{
  return &type metadata for StoreKitInternalError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UserCancelledCodingKeys()
{
  return &type metadata for StoreKitInternalError.UserCancelledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.AccountMissingCodingKeys()
{
  return &type metadata for StoreKitInternalError.AccountMissingCodingKeys;
}

unint64_t sub_1001CDE48()
{
  unint64_t result = qword_1002B9E60;
  if (!qword_1002B9E60)
  {
    unint64_t result = swift_getWitnessTable("-Q\b", &type metadata for StoreKitInternalError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E60);
  }

  return result;
}

unint64_t sub_1001CDE90()
{
  unint64_t result = qword_1002B9E68;
  if (!qword_1002B9E68)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DA7C, &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E68);
  }

  return result;
}

unint64_t sub_1001CDED8()
{
  unint64_t result = qword_1002B9E70;
  if (!qword_1002B9E70)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DAA4, &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E70);
  }

  return result;
}

unint64_t sub_1001CDF20()
{
  unint64_t result = qword_1002B9E78;
  if (!qword_1002B9E78)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DA2C, &type metadata for StoreKitInternalError.InvalidAppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E78);
  }

  return result;
}

unint64_t sub_1001CDF68()
{
  unint64_t result = qword_1002B9E80;
  if (!qword_1002B9E80)
  {
    unint64_t result = swift_getWitnessTable(byte_10020DA54, &type metadata for StoreKitInternalError.InvalidAppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E80);
  }

  return result;
}

unint64_t sub_1001CDFB0()
{
  unint64_t result = qword_1002B9E88;
  if (!qword_1002B9E88)
  {
    unint64_t result = swift_getWitnessTable("MS\b", &type metadata for StoreKitInternalError.NotAvailableInStorefrontCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E88);
  }

  return result;
}

unint64_t sub_1001CDFF8()
{
  unint64_t result = qword_1002B9E90;
  if (!qword_1002B9E90)
  {
    unint64_t result = swift_getWitnessTable("5S\b", &type metadata for StoreKitInternalError.NotAvailableInStorefrontCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E90);
  }

  return result;
}

unint64_t sub_1001CE040()
{
  unint64_t result = qword_1002B9E98;
  if (!qword_1002B9E98)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D98C, &type metadata for StoreKitInternalError.NotEntitledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9E98);
  }

  return result;
}

unint64_t sub_1001CE088()
{
  unint64_t result = qword_1002B9EA0;
  if (!qword_1002B9EA0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D9B4, &type metadata for StoreKitInternalError.NotEntitledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EA0);
  }

  return result;
}

unint64_t sub_1001CE0D0()
{
  unint64_t result = qword_1002B9EA8;
  if (!qword_1002B9EA8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D93C, &type metadata for StoreKitInternalError.NoUIContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EA8);
  }

  return result;
}

unint64_t sub_1001CE118()
{
  unint64_t result = qword_1002B9EB0;
  if (!qword_1002B9EB0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D964, &type metadata for StoreKitInternalError.NoUIContextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EB0);
  }

  return result;
}

unint64_t sub_1001CE160()
{
  unint64_t result = qword_1002B9EB8;
  if (!qword_1002B9EB8)
  {
    unint64_t result = swift_getWitnessTable("=T\b", &type metadata for StoreKitInternalError.PurchasesDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EB8);
  }

  return result;
}

unint64_t sub_1001CE1A8()
{
  unint64_t result = qword_1002B9EC0;
  if (!qword_1002B9EC0)
  {
    unint64_t result = swift_getWitnessTable("%T\b", &type metadata for StoreKitInternalError.PurchasesDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EC0);
  }

  return result;
}

unint64_t sub_1001CE1F0()
{
  unint64_t result = qword_1002B9EC8;
  if (!qword_1002B9EC8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D89C, &type metadata for StoreKitInternalError.UnimplementedFlowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EC8);
  }

  return result;
}

unint64_t sub_1001CE238()
{
  unint64_t result = qword_1002B9ED0;
  if (!qword_1002B9ED0)
  {
    unint64_t result = swift_getWitnessTable("uT\b", &type metadata for StoreKitInternalError.UnimplementedFlowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9ED0);
  }

  return result;
}

unint64_t sub_1001CE280()
{
  unint64_t result = qword_1002B9ED8;
  if (!qword_1002B9ED8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D84C, &type metadata for StoreKitInternalError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9ED8);
  }

  return result;
}

unint64_t sub_1001CE2C8()
{
  unint64_t result = qword_1002B9EE0;
  if (!qword_1002B9EE0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D874, &type metadata for StoreKitInternalError.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EE0);
  }

  return result;
}

unint64_t sub_1001CE310()
{
  unint64_t result = qword_1002B9EE8;
  if (!qword_1002B9EE8)
  {
    unint64_t result = swift_getWitnessTable("-U\b", &type metadata for StoreKitInternalError.UserCancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EE8);
  }

  return result;
}

unint64_t sub_1001CE358()
{
  unint64_t result = qword_1002B9EF0;
  if (!qword_1002B9EF0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020D824, &type metadata for StoreKitInternalError.UserCancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EF0);
  }

  return result;
}

unint64_t sub_1001CE3A0()
{
  unint64_t result = qword_1002B9EF8;
  if (!qword_1002B9EF8)
  {
    unint64_t result = swift_getWitnessTable("}U\b", &type metadata for StoreKitInternalError.AccountMissingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9EF8);
  }

  return result;
}

unint64_t sub_1001CE3E8()
{
  unint64_t result = qword_1002B9F00;
  if (!qword_1002B9F00)
  {
    unint64_t result = swift_getWitnessTable("eU\b", &type metadata for StoreKitInternalError.AccountMissingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9F00);
  }

  return result;
}

unint64_t sub_1001CE430()
{
  unint64_t result = qword_1002B9F08;
  if (!qword_1002B9F08)
  {
    unint64_t result = swift_getWitnessTable("]R\b", &type metadata for StoreKitInternalError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9F08);
  }

  return result;
}

unint64_t sub_1001CE478()
{
  unint64_t result = qword_1002B9F10;
  if (!qword_1002B9F10)
  {
    unint64_t result = swift_getWitnessTable("ER\b", &type metadata for StoreKitInternalError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9F10);
  }

  return result;
}

unint64_t sub_1001CE4BC()
{
  unint64_t result = qword_1002B9F18;
  if (!qword_1002B9F18)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for StoreKitServerError,  &type metadata for StoreKitServerError);
    atomic_store(result, (unint64_t *)&qword_1002B9F18);
  }

  return result;
}

unint64_t sub_1001CE500()
{
  unint64_t result = qword_1002B9F20;
  if (!qword_1002B9F20)
  {
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1002B9F20);
  }

  return result;
}

char *sub_1001CE544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v8 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, a4);
  uint64_t v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v10 = v8;
    v29[0] = _swiftEmptyArrayStorage;
    unint64_t result = sub_1001D4E20(0LL, v8 & ~(v8 >> 63), 0);
    if ((v10 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = (void *)v29[0];
      uint64_t v12 = a1;
      uint64_t v28 = v4;
      while (1)
      {
        uint64_t v14 = Substring.subscript.getter(v12, a1, a2, a3, v4);
        unint64_t v15 = v13;
        if (v14 == 45 && v13 == 0xE100000000000000LL)
        {
          unint64_t v15 = 0xE100000000000000LL;
          swift_bridgeObjectRelease();
          uint64_t v14 = 43LL;
        }

        else if ((_stringCompareWithSmolCheck(_:_:expecting:)(45LL, 0xE100000000000000LL, v14, v13, 0LL) & 1) != 0)
        {
          swift_bridgeObjectRelease();
          unint64_t v15 = 0xE100000000000000LL;
          uint64_t v14 = 43LL;
        }

        else
        {
          if (v14 == 95 && v15 == 0xE100000000000000LL)
          {
            unint64_t v15 = 0xE100000000000000LL;
            swift_bridgeObjectRelease();
LABEL_14:
            uint64_t v14 = 47LL;
            goto LABEL_15;
          }

          if ((_stringCompareWithSmolCheck(_:_:expecting:)(95LL, 0xE100000000000000LL, v14, v15, 0LL) & 1) != 0)
          {
            swift_bridgeObjectRelease();
            unint64_t v15 = 0xE100000000000000LL;
            goto LABEL_14;
          }
        }

Swift::String __swiftcall StringProtocol.base64URLEncodedToBase64()()
{
  uint64_t v15 = sub_1001CE958( (void (*)(char *, char *))sub_1001CE8A0,  0LL,  v0,  (uint64_t)&type metadata for Character,  (uint64_t)&type metadata for Never,  *(void *)(*(void *)(v1 + 8) + 8LL),  (uint64_t)&protocol witness table for Never,  v2);
  uint64_t v3 = sub_1000175B0(&qword_1002B9F88);
  unint64_t v4 = sub_1001CEC48();
  uint64_t v5 = String.init<A>(_:)(&v15, v3, v4);
  BOOL v7 = v6;
  uint64_t v15 = v5;
  unint64_t v16 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = String.count.getter(v5, v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = v8 & 3;
  if (v8 <= 0) {
    uint64_t v9 = -(-v8 & 3);
  }
  if (v9)
  {
    v10._uint64_t countAndFlagsBits = 61LL;
    v10._object = (void *)0xE100000000000000LL;
    Swift::String v11 = String.init(repeating:count:)(v10, 4 - v9);
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
  }

  uint64_t v12 = v15;
  unint64_t v13 = v16;
  result._object = v13;
  result._uint64_t countAndFlagsBits = v12;
  return result;
}

uint64_t sub_1001CE8A0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)result;
  uint64_t v3 = *(void *)(result + 8);
  BOOL v5 = *(void *)result == 45LL && v3 == 0xE100000000000000LL;
  if (v5
    || (Swift::String result = _stringCompareWithSmolCheck(_:_:expecting:)(45LL, 0xE100000000000000LL, v4, v3, 0LL), (result & 1) != 0))
  {
    *a2 = 43LL;
    a2[1] = 0xE100000000000000LL;
  }

  else
  {
    BOOL v6 = v4 == 95 && v3 == 0xE100000000000000LL;
    if (v6
      || (Swift::String result = _stringCompareWithSmolCheck(_:_:expecting:)(95LL, 0xE100000000000000LL, v4, v3, 0LL),
          (result & 1) != 0))
    {
      *a2 = 47LL;
      a2[1] = 0xE100000000000000LL;
    }

    else
    {
      *a2 = v4;
      a2[1] = v3;
      return swift_bridgeObjectRetain(v3);
    }
  }

  return result;
}

uint64_t sub_1001CE958( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a5;
  uint64_t v41 = a8;
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v39 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  uint64_t v50 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  *(void *)(v13 + 8),  v14,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v19 = (char *)&v39 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = swift_getAssociatedTypeWitness( 0LL,  a6,  a3,  &protocol requirements base descriptor for Collection,  &associated type descriptor for Collection.Index);
  uint64_t v42 = *(void *)(v22 - 8);
  uint64_t v43 = v22;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v39 - v23;
  uint64_t v25 = dispatch thunk of Collection.count.getter(a3, a6);
  if (!v25) {
    return static Array._allocateUninitialized(_:)(0LL, a4);
  }
  uint64_t v46 = AssociatedTypeWitness;
  uint64_t v26 = v8;
  uint64_t v27 = a4;
  Swift::Int v28 = v25;
  uint64_t v54 = ContiguousArray.init()(v27);
  uint64_t v44 = type metadata accessor for ContiguousArray(0LL);
  ContiguousArray.reserveCapacity(_:)(v28);
  uint64_t v47 = v26;
  uint64_t result = dispatch thunk of Collection.startIndex.getter(a3, a6);
  if ((v28 & 0x8000000000000000LL) == 0)
  {
    Swift::Int v30 = v28;
    uint64_t v45 = v21;
    while (v30)
    {
      Swift::Int v51 = v30;
      uint64_t v31 = (void (*)(_BYTE *, void))dispatch thunk of Collection.subscript.read(v53, v24, a3, a6);
      uint64_t v32 = *(void (**)(char *))(v16 + 16);
      uint64_t v33 = v16;
      uint64_t v34 = v46;
      v32(v19);
      v31(v53, 0LL);
      uint64_t v35 = v24;
      uint64_t v36 = v19;
      uint64_t v37 = v45;
      uint64_t v38 = v52;
      v48(v36, v50);
      if (v38)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v34);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
        swift_release(v54);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v41, v50, v40);
      }

      uint64_t v52 = 0LL;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v34);
      ContiguousArray.append(_:)(v37, v44);
      uint64_t result = dispatch thunk of Collection.formIndex(after:)(v35, a3, a6);
      Swift::Int v30 = v51 - 1;
      uint64_t v16 = v33;
      uint64_t v19 = v36;
      uint64_t v24 = v35;
      if (v51 == 1)
      {
        (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
        return v54;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

unint64_t sub_1001CEC48()
{
  unint64_t result = qword_1002B9F90;
  if (!qword_1002B9F90)
  {
    uint64_t v1 = sub_100018EC0(&qword_1002B9F88);
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002B9F90);
  }

  return result;
}

uint64_t Data.init<A>(base64URLEncoded:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::String v6 = StringProtocol.base64URLEncodedToBase64()();
  uint64_t v7 = Data.init(base64Encoded:options:)(v6._countAndFlagsBits, v6._object, a2);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_10003AA74(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a1, a3);
  if (v9 >> 60 != 15) {
    sub_10003AACC(v7, v9);
  }
  return v7;
}

uint64_t LazyJWS.rawHeader.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[3]);
  return v1;
}

uint64_t LazyJWS.rawPayload.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain(*(void *)(v0 + 56));
  return v1;
}

uint64_t LazyJWS.rawSignature.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain(*(void *)(v0 + 88));
  return v1;
}

uint64_t LazyJWS.init(rawValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1001CF0B8((uint64_t)v5, a3);
}

uint64_t LazyJWS.payloadJSONString.getter()
{
  uint64_t v1 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v1);
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  swift_bridgeObjectRetain();
  Swift::String v6 = sub_1001CE544(v2, v3, v4, v5);
  uint64_t v8 = Data.init(base64Encoded:options:)(v6, v7, 0LL);
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_10003AA74(v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = 0LL;
  if (v10 >> 60 != 15)
  {
    uint64_t v12 = sub_10003AACC(v8, v10);
    static String.Encoding.utf8.getter(v12);
    uint64_t v11 = String.init(data:encoding:)(v8);
    sub_10003AACC(v8, v10);
  }

  return v11;
}

uint64_t sub_1001CEF34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1001CF0B8((uint64_t)v4, a2);
}

uint64_t sub_1001CEF74@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_1001CEF80@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  v22[0] = 46LL;
  v22[1] = 0xE100000000000000LL;
  uint64_t v21 = v22;
  swift_bridgeObjectRetain();
  Swift::String v6 = sub_1001D5194(3LL, 1, sub_1001CF390, (uint64_t)v20, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (*((void *)v6 + 2) == 3LL)
  {
    uint64_t v18 = *((void *)v6 + 5);
    uint64_t v19 = *((void *)v6 + 4);
    uint64_t v7 = *((void *)v6 + 7);
    uint64_t v10 = *((void *)v6 + 11);
    uint64_t v16 = *((void *)v6 + 10);
    uint64_t v17 = *((void *)v6 + 6);
    uint64_t v8 = *((void *)v6 + 8);
    uint64_t v9 = *((void *)v6 + 9);
    uint64_t v11 = *((void *)v6 + 12);
    uint64_t v12 = *((void *)v6 + 13);
    uint64_t v13 = *((void *)v6 + 14);
    uint64_t v14 = *((void *)v6 + 15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v19;
  a3[1] = v18;
  a3[2] = v17;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
  a3[6] = v16;
  a3[7] = v10;
  a3[8] = v11;
  a3[9] = v12;
  a3[10] = v13;
  a3[11] = v14;
  return result;
}

uint64_t sub_1001CF0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002B9F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t destroy for LazyJWS(void *a1)
{
  return swift_bridgeObjectRelease(a1[11]);
}

uint64_t initializeWithCopy for LazyJWS(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *assignWithCopy for LazyJWS(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  uint64_t v5 = a1[3];
  a1[3] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  uint64_t v6 = a2[7];
  uint64_t v7 = a1[7];
  a1[7] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  uint64_t v8 = a2[11];
  uint64_t v9 = a1[11];
  a1[11] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for LazyJWS(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for LazyJWS(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease(v7);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 88);
  uint64_t v9 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LazyJWS(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LazyJWS(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 96) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for LazyJWS()
{
  return &type metadata for LazyJWS;
}

uint64_t sub_1001CF390(uint64_t *a1)
{
  return sub_1001D57B8(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_1001CF3AC(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000013LL;
  unint64_t v3 = 0x8000000100222910LL;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000015LL;
    }
    else {
      unint64_t v5 = 0xD000000000000013LL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000100222930LL;
    }
    else {
      unint64_t v6 = 0x8000000100222950LL;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }

  else
  {
    unint64_t v5 = 0xD000000000000013LL;
    unint64_t v6 = 0x8000000100222910LL;
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }

  if (v7 == 1)
  {
    unint64_t v2 = 0xD000000000000015LL;
    unint64_t v3 = 0x8000000100222930LL;
  }

  else
  {
    unint64_t v3 = 0x8000000100222950LL;
  }

void sub_1001CF4A0(char a1)
{
  __asm { BR              X10 }

uint64_t sub_1001CF4E8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1001CF54C + 4 * byte_10020E024[a2]))(0x49746375646F7270LL);
}

uint64_t sub_1001CF54C(uint64_t a1)
{
  if (a1 == 0x49746375646F7270LL && v1 == 0xE900000000000044LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x49746375646F7270LL, 0xE900000000000044LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE900000000000044LL);
  return v2 & 1;
}

void sub_1001CF5F4(char *a1)
{
}

void sub_1001CF600()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v2);
  __asm { BR              X9 }

Swift::Int sub_1001CF648()
{
  return Hasher._finalize()();
}

void sub_1001CF6B8()
{
  __asm { BR              X10 }

uint64_t sub_1001CF6F0(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE900000000000044LL);
}

void sub_1001CF74C()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v2);
  __asm { BR              X9 }

Swift::Int sub_1001CF790()
{
  return Hasher._finalize()();
}

unint64_t sub_1001CF800@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001D18E8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001CF82C()
{
  return ((uint64_t (*)(void))((char *)sub_1001CF858 + 4 * byte_10020E034[*v0]))();
}

void sub_1001CF858(void *a1@<X8>)
{
  *a1 = 0x49746375646F7270LL;
  a1[1] = 0xE900000000000044LL;
}

void sub_1001CF878(void *a1@<X8>)
{
  *a1 = 0x69666F725079656BLL;
  a1[1] = 0xEA0000000000656CLL;
}

void sub_1001CF898(void *a1@<X8>)
{
  *a1 = 0x736D61726170LL;
  a1[1] = v1;
}

uint64_t sub_1001CF8AC()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001CF8D8 + 4 * byte_10020E038[*v0]))( 0x79654B676F6CLL,  0xE600000000000000LL);
}

uint64_t sub_1001CF8D8()
{
  return 0x49746375646F7270LL;
}

uint64_t sub_1001CF8F4()
{
  return 0x69666F725079656BLL;
}

uint64_t sub_1001CF910()
{
  return 0x736D61726170LL;
}

unint64_t sub_1001CF920@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1001D18E8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001CF944(uint64_t a1)
{
  unint64_t v2 = sub_1001CFC44();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CF96C(uint64_t a1)
{
  unint64_t v2 = sub_1001CFC44();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AcknowledgeMessageRequest.messageType.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t ProductPageLookupRequest.ParameterRequest.parameters.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 48));
}

void __swiftcall ProductPageLookupRequest.ParameterRequest.init(productID:logKey:keyProfile:parameters:)( StoreKit_Shared::ProductPageLookupRequest::ParameterRequest *__return_ptr retstr, Swift::String productID, Swift::String logKey, Swift::String keyProfile, Swift::OpaquePointer parameters)
{
  retstr->logKey = logKey;
  retstr->productID = productID;
  retstr->keyProfile = keyProfile;
  retstr->parameters = parameters;
}

uint64_t ProductPageLookupRequest.ParameterRequest.encode(to:)(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B9FA0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v30[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001CFC44();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys,  &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = v3[2];
  uint64_t v13 = v3[3];
  LOBYTE(v30[0]) = 1;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, v30, v5);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v14 = *v3;
  uint64_t v15 = v3[1];
  LOBYTE(v30[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v30, v5);
  uint64_t v16 = v3[4];
  uint64_t v17 = v3[5];
  LOBYTE(v30[0]) = 2;
  KeyedEncodingContainer.encode(_:forKey:)(v16, v17, v30, v5);
  uint64_t v19 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v30[0] = 0LL;
  id v21 = [v19 dataWithJSONObject:isa options:0 error:v30];

  id v22 = v30[0];
  if (!v21)
  {
    uint64_t v27 = v22;
    _convertNSErrorToError(_:)(v22);

    swift_willThrow(v28);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  uint64_t v23 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v21);
  uint64_t v25 = v24;

  v30[0] = v23;
  v30[1] = v25;
  HIBYTE(v29) = 3;
  unint64_t v26 = sub_1001C73A8();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v30, (char *)&v29 + 7, v5, &type metadata for Data, v26);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_10003A9EC((uint64_t)v23, (unint64_t)v25);
}

unint64_t sub_1001CFC44()
{
  unint64_t result = qword_1002B9FA8;
  if (!qword_1002B9FA8)
  {
    unint64_t result = swift_getWitnessTable("-M\b", &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9FA8);
  }

  return result;
}

double ProductPageLookupRequest.ParameterRequest.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }

  return result;
}

uint64_t sub_1001CFCD4(void *a1)
{
  return ProductPageLookupRequest.ParameterRequest.encode(to:)(a1);
}

uint64_t ProductPageLookupRequest.URLRequest.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ProductPageLookupRequest.URLRequest(0LL) + 28);
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t ProductPageLookupRequest.URLRequest.init(productID:url:keyProfile:logKey:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  a8[2] = a6;
  a8[3] = a7;
  a8[4] = a4;
  a8[5] = a5;
  uint64_t v12 = (char *)a8 + *(int *)(type metadata accessor for ProductPageLookupRequest.URLRequest(0LL) + 28);
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32LL))(v12, a3, v13);
  *a8 = a1;
  a8[1] = a2;
  return result;
}

uint64_t ProductPageLookupRequest.URLRequest.parameters.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URLQueryItem(0LL);
  uint64_t v51 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002B9FB0);
  __chkstk_darwin(v5);
  __int128 v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (void *)sub_1001D029C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v9 = type metadata accessor for ProductPageLookupRequest.URLRequest(0LL);
  URLComponents.init(url:resolvingAgainstBaseURL:)((char *)v1 + *(int *)(v9 + 28), 1LL);
  uint64_t v10 = type metadata accessor for URLComponents(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1LL, v10) != 1)
  {
    uint64_t v39 = URLComponents.queryItems.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    if (v39) {
      uint64_t v12 = (void *)v39;
    }
    else {
      uint64_t v12 = _swiftEmptyArrayStorage;
    }
    uint64_t v13 = v12[2];
    if (v13) {
      goto LABEL_3;
    }
LABEL_31:
    swift_bridgeObjectRelease();
LABEL_32:
    *(void *)&__int128 v54 = 25705LL;
    *((void *)&v54 + 1) = 0xE200000000000000LL;
    AnyHashable.init<A>(_:)(v56, &v54, &type metadata for String, &protocol witness table for String);
    if (v8[2] && (unint64_t v40 = sub_1001CA7F4((uint64_t)v56), (v41 & 1) != 0))
    {
      sub_10002C010(v8[7] + 32 * v40, (uint64_t)&v54);
    }

    else
    {
      __int128 v54 = 0u;
      __int128 v55 = 0u;
    }

    sub_1001BD878((uint64_t)v56);
    uint64_t v42 = *((void *)&v55 + 1);
    sub_100043F40((uint64_t)&v54, &qword_1002B9D20);
    if (!v42)
    {
      *(void *)&__int128 v54 = 25705LL;
      *((void *)&v54 + 1) = 0xE200000000000000LL;
      AnyHashable.init<A>(_:)(v56, &v54, &type metadata for String, &protocol witness table for String);
      uint64_t v43 = *v1;
      uint64_t v44 = v1[1];
      *((void *)&v55 + 1) = &type metadata for String;
      *(void *)&__int128 v54 = v43;
      *((void *)&v54 + 1) = v44;
      sub_100034728(&v54, v53);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
      uint64_t v52 = v8;
      sub_1001D139C(v53, (uint64_t)v56, isUniquelyReferenced_nonNull_native);
      uint64_t v8 = v52;
      swift_bridgeObjectRelease();
      sub_1001BD878((uint64_t)v56);
    }

    return (uint64_t)v8;
  }

  sub_100043F40((uint64_t)v7, &qword_1002B9FB0);
  uint64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v13 = _swiftEmptyArrayStorage[2];
  if (!v13) {
    goto LABEL_31;
  }
LABEL_3:
  uint64_t v47 = v12;
  uint64_t v48 = v1;
  uint64_t v14 = (char *)v12 + ((*(unsigned __int8 *)(v51 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
  uint64_t v49 = *(void *)(v51 + 72);
  uint64_t v15 = &type metadata for String;
  uint64_t v50 = *(uint64_t (**)(char *, char *, uint64_t))(v51 + 16);
  for (uint64_t i = v50(v4, v14, v2); ; uint64_t i = v50(v4, v14, v2))
  {
    *(void *)&__int128 v54 = URLQueryItem.name.getter(i);
    *((void *)&v54 + 1) = v18;
    uint64_t v19 = AnyHashable.init<A>(_:)(v56, &v54, v15, &protocol witness table for String);
    uint64_t v20 = URLQueryItem.value.getter(v19);
    if (v21) {
      break;
    }
    swift_bridgeObjectRetain();
    unint64_t v32 = sub_1001CA7F4((uint64_t)v56);
    char v34 = v33;
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
    {
      char v35 = swift_isUniquelyReferenced_nonNull_native(v8);
      *(void *)&v53[0] = v8;
      if ((v35 & 1) == 0)
      {
        sub_1001D154C();
        uint64_t v8 = *(void **)&v53[0];
      }

      sub_1001BD878(v8[6] + 40 * v32);
      sub_100034728((_OWORD *)(v8[7] + 32 * v32), &v54);
      sub_1001D11D4(v32, (uint64_t)v8);
      swift_bridgeObjectRelease();
    }

    else
    {
      __int128 v54 = 0u;
      __int128 v55 = 0u;
    }

    sub_1001BD878((uint64_t)v56);
    sub_100043F40((uint64_t)&v54, &qword_1002B9D20);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v4, v2);
    v14 += v49;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v1 = v48;
      goto LABEL_32;
    }
  }

  id v22 = v15;
  *((void *)&v55 + 1) = v15;
  *(void *)&__int128 v54 = v20;
  *((void *)&v54 + 1) = v21;
  sub_100034728(&v54, v53);
  uint64_t v23 = swift_isUniquelyReferenced_nonNull_native(v8);
  uint64_t v52 = v8;
  unint64_t v25 = sub_1001CA7F4((uint64_t)v56);
  uint64_t v26 = v8[2];
  BOOL v27 = (v24 & 1) == 0;
  uint64_t v28 = v26 + v27;
  if (!__OFADD__(v26, v27))
  {
    char v29 = v24;
    if (v8[3] < v28)
    {
      sub_1001D0B9C(v28, v23);
      unint64_t v30 = sub_1001CA7F4((uint64_t)v56);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_41;
      }
      unint64_t v25 = v30;
      uint64_t v8 = v52;
      if ((v29 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_4:
      uint64_t v17 = (void *)(v8[7] + 32 * v25);
      sub_100019F7C(v17);
      sub_100034728(v53, v17);
LABEL_5:
      swift_bridgeObjectRelease();
      sub_1001BD878((uint64_t)v56);
      uint64_t v15 = v22;
      goto LABEL_6;
    }

    if ((v23 & 1) != 0)
    {
      uint64_t v8 = v52;
      if ((v24 & 1) != 0) {
        goto LABEL_4;
      }
    }

    else
    {
      sub_1001D154C();
      uint64_t v8 = v52;
      if ((v29 & 1) != 0) {
        goto LABEL_4;
      }
    }

unint64_t sub_1001D029C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000175B0(&qword_1002BA0A8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1001D2C14(v7, (uint64_t)v16);
    unint64_t result = sub_1001CA7F4((uint64_t)v16);
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
    unint64_t result = (unint64_t)sub_100034728(&v18, (_OWORD *)(v4[7] + 32 * result));
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
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1001D03C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000175B0(&qword_1002BA0A0);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v6 = *(v5 - 3);
    uint64_t v7 = *(v5 - 2);
    uint64_t v9 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1001CA790(v6, v7);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    __int128 v12 = (uint64_t *)(v3[6] + 16 * result);
    *__int128 v12 = v6;
    v12[1] = v7;
    uint64_t v13 = (void *)(v3[7] + 16 * result);
    *uint64_t v13 = v9;
    v13[1] = v8;
    uint64_t v14 = v3[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5 += 4;
    _OWORD v3[2] = v16;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t static ProductPageLookupRequest.URLRequest.productID(from:)()
{
  uint64_t v0 = type metadata accessor for CharacterSet(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)v17 - v6;
  v17[0] = URL.lastPathComponent.getter(v5);
  v17[1] = v8;
  uint64_t v9 = static CharacterSet.decimalDigits.getter(v17[0], v8);
  CharacterSet.inverted.getter(v9);
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v7, v0);
  unint64_t v11 = sub_1001D1F48();
  uint64_t v12 = StringProtocol.trimmingCharacters(in:)(v4, &type metadata for String, v11);
  unint64_t v14 = v13;
  v10(v4, v0);
  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000LL) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v15)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  return v12;
}

uint64_t sub_1001D0600()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001D0634 + 4 * byte_10020E03C[*v0]))( 0x49746375646F7270LL,  0xE900000000000044LL);
}

uint64_t sub_1001D0634()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001D0648()
{
  return 0x69666F725079656BLL;
}

uint64_t sub_1001D0664()
{
  return 7107189LL;
}

uint64_t sub_1001D0674@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001D2A5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001D0698(uint64_t a1)
{
  unint64_t v2 = sub_1001D1F8C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D06C0(uint64_t a1)
{
  unint64_t v2 = sub_1001D1F8C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductPageLookupRequest.URLRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002B9FC0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001D1F8C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys,  &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v26 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v26, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v25 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v25, v5);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v24 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v24, v5);
    __int128 v18 = (char *)v3 + *(int *)(type metadata accessor for ProductPageLookupRequest.URLRequest(0LL) + 28);
    char v23 = 3;
    uint64_t v19 = type metadata accessor for URL(0LL);
    uint64_t v20 = sub_1001D1FD0(&qword_1002B9AF8, (const char *)&protocol conformance descriptor for URL);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v18, &v23, v5, v19, v20);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ProductPageLookupRequest.URLRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = type metadata accessor for URL(0LL);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  BOOL v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = sub_1000175B0(&qword_1002B9FD0);
  uint64_t v4 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ProductPageLookupRequest.URLRequest(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100019F58(a1, v10);
  unint64_t v12 = sub_1001D1F8C();
  uint64_t v13 = v29;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys,  &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys,  v12,  v10,  v11);
  if (v13) {
    return sub_100019F7C(a1);
  }
  uint64_t v29 = v7;
  uint64_t v14 = v4;
  uint64_t v15 = v27;
  uint64_t v16 = v28;
  char v33 = 0;
  uint64_t v17 = (uint64_t)v9;
  *uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)(&v33, v28);
  v9[1] = v18;
  char v32 = 1;
  v9[2] = KeyedDecodingContainer.decode(_:forKey:)(&v32, v16);
  v9[3] = v19;
  char v31 = 2;
  v9[4] = KeyedDecodingContainer.decode(_:forKey:)(&v31, v16);
  v9[5] = v20;
  char v30 = 3;
  sub_1001D1FD0(&qword_1002B9AC8, (const char *)&protocol conformance descriptor for URL);
  uint64_t v21 = v15;
  uint64_t v22 = v26;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v26, &v30, v16, v26);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v17 + *(int *)(v29 + 28), v21, v22);
  sub_1001D2010(v17, v25);
  sub_100019F7C(a1);
  return sub_1001D2054(v17);
}

uint64_t sub_1001D0B74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProductPageLookupRequest.URLRequest.init(from:)(a1, a2);
}

uint64_t sub_1001D0B88(void *a1)
{
  return ProductPageLookupRequest.URLRequest.encode(to:)(a1);
}

uint64_t sub_1001D0B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_1000175B0(&qword_1002BA0A8);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
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
  uint64_t result = swift_retain();
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }

    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v22 >= v12) {
      break;
    }
    char v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v12) {
        goto LABEL_37;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v15);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v15 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_46;
            }
            if (v15 >= v12) {
              goto LABEL_37;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v15);
            ++v25;
            if (v24) {
              goto LABEL_24;
            }
          }
        }

        int64_t v15 = v25;
      }
    }

uint64_t sub_1001D0EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_1000175B0(&qword_1002BA0A0);
  char v43 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v42 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  __int128 v40 = v3;
  int64_t v41 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v24 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v24 >= v41) {
      break;
    }
    int64_t v25 = (void *)(v5 + 64);
    unint64_t v26 = *(void *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      int64_t v14 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_36;
      }
      unint64_t v26 = *(void *)(v42 + 8 * v14);
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release();
          uint64_t v3 = v40;
          if ((v43 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v26 = *(void *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            int64_t v14 = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v41) {
              goto LABEL_36;
            }
            unint64_t v26 = *(void *)(v42 + 8 * v14);
            ++v27;
            if (v26) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v27;
      }
    }

unint64_t sub_1001D11D4(unint64_t result, uint64_t a2)
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
        sub_1001CBA50(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        uint64_t result = sub_1001BD878((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              __int128 v17 = *v16;
              __int128 v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }

            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            unint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              __int128 v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }

        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1LL << v3) - 1;
  }

  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1LL << result) - 1;
  }

  *unint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1LL);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

_OWORD *sub_1001D139C(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1001CA7F4(a2);
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
        __int128 v17 = (void *)(v16[7] + 32 * v10);
        sub_100019F7C(v17);
        return sub_100034728(a1, v17);
      }

      goto LABEL_11;
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1001D154C();
      goto LABEL_7;
    }

    sub_1001D0B9C(v13, a3 & 1);
    unint64_t v19 = sub_1001CA7F4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_1001CBA50(a2, (uint64_t)v21);
      return sub_1001D14D4(v10, (uint64_t)v21, a1, v16);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_1001D14D4(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_100034728(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_1001D154C()
{
  uint64_t v1 = v0;
  sub_1000175B0(&qword_1002BA0A8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

void *sub_1001D1730()
{
  uint64_t v1 = v0;
  sub_1000175B0(&qword_1002BA0A0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }

unint64_t sub_1001D18E8(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100291E58, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001D1930@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v62 = a2;
  uint64_t v3 = type metadata accessor for DecodingError.Context(0LL);
  uint64_t v63 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000175B0(&qword_1002BA0B8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v11);
  unint64_t v12 = sub_1001CFC44();
  int64_t v13 = v65;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys,  &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys,  v12,  v11,  v10);
  if (v13) {
    return sub_100019F7C(a1);
  }
  unint64_t v61 = v12;
  uint64_t v65 = v5;
  unint64_t v15 = a1;
  uint64_t v16 = v64;
  uint64_t v17 = v7;
  LOBYTE(v67) = 0;
  uint64_t v18 = v9;
  uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)(&v67, v6);
  uint64_t v20 = v6;
  uint64_t v22 = v21;
  uint64_t v58 = v19;
  LOBYTE(v67) = 1;
  swift_bridgeObjectRetain();
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)(&v67, v6);
  uint64_t v59 = v24;
  uint64_t v60 = v15;
  uint64_t v55 = v23;
  LOBYTE(v67) = 2;
  swift_bridgeObjectRetain();
  uint64_t v56 = 0LL;
  uint64_t v54 = KeyedDecodingContainer.decode(_:forKey:)(&v67, v6);
  LOBYTE(v66) = 3;
  uint64_t v26 = v25;
  sub_1001C784C();
  uint64_t v57 = v26;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v66, v6, &type metadata for Data);
  uint64_t v53 = v18;
  unint64_t v29 = v67;
  unint64_t v28 = v68;
  BOOL v30 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  unint64_t v52 = v28;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v67 = 0LL;
  id v32 = [v30 JSONObjectWithData:isa options:0 error:&v67];

  if (v32)
  {
    unint64_t v33 = v67;
    _bridgeAnyObjectToAny(_:)(&v67, v32);
    swift_unknownObjectRelease(v32);
    uint64_t v34 = sub_1000175B0(&qword_1002BA0C0);
    char v35 = swift_dynamicCast(&v66, &v67, (char *)&type metadata for Any + 8, v34, 6LL);
    uint64_t v36 = v59;
    if ((v35 & 1) != 0)
    {
      sub_10003A9EC((uint64_t)v29, v52);
      uint64_t v37 = v66;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v53, v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100019F7C(v60);
      swift_bridgeObjectRelease();
      uint64_t v38 = v57;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v39 = v62;
      *id v62 = v58;
      v39[1] = v22;
      v39[2] = v55;
      v39[3] = v36;
      v39[4] = v54;
      v39[5] = v38;
      v39[6] = v37;
      return result;
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = sub_1000175B0(&qword_1002B9D98);
    uint64_t v44 = swift_allocObject(v43, 72LL, 7LL);
    id v62 = v29;
    uint64_t v45 = v44;
    *(_OWORD *)(v44 + 16) = xmmword_1001F3C00;
    unint64_t v46 = v61;
    *(void *)(v44 + 56) = &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys;
    *(void *)(v44 + 64) = v46;
    *(_BYTE *)(v44 + 32) = 3;
    uint64_t v67 = 0LL;
    unint64_t v68 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(37LL);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v45,  0xD00000000000003FLL,  0x8000000100222BF0LL,  0LL);
    uint64_t v47 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v47, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v49 = v48;
    uint64_t v50 = v63;
    (*(void (**)(uint64_t, char *, uint64_t))(v63 + 16))(v48, v65, v16);
    uint64_t v51 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v47 - 8) + 104LL))( v49,  enum case for DecodingError.dataCorrupted(_:),  v47);
    swift_willThrow(v51);
    sub_10003A9EC((uint64_t)v62, v52);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v65, v16);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v53, v20);
    uint64_t v27 = v56;
  }

  else
  {
    __int128 v40 = v67;
    int64_t v41 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)(v40);

    swift_willThrow(v42);
    sub_10003A9EC((uint64_t)v29, v52);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v53, v20);
    uint64_t v27 = v56;
    unint64_t v15 = v60;
  }

  sub_100019F7C(v15);
  swift_bridgeObjectRelease();
  if (!v27) {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ProductPageLookupRequest.URLRequest(uint64_t a1)
{
  uint64_t result = qword_1002BA030;
  if (!qword_1002BA030) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ProductPageLookupRequest.URLRequest);
  }
  return result;
}

unint64_t sub_1001D1F48()
{
  unint64_t result = qword_1002B9FB8;
  if (!qword_1002B9FB8)
  {
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1002B9FB8);
  }

  return result;
}

unint64_t sub_1001D1F8C()
{
  unint64_t result = qword_1002B9FC8;
  if (!qword_1002B9FC8)
  {
    unint64_t result = swift_getWitnessTable("}M\b", &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B9FC8);
  }

  return result;
}

uint64_t sub_1001D1FD0(unint64_t *a1, const char *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for URL(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1001D2010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProductPageLookupRequest.URLRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001D2054(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ProductPageLookupRequest.URLRequest(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest()
{
  return &type metadata for ProductPageLookupRequest;
}

uint64_t destroy for ProductPageLookupRequest.ParameterRequest(void *a1)
{
  return swift_bridgeObjectRelease(a1[6]);
}

void *initializeWithCopy for ProductPageLookupRequest.ParameterRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[6];
  a1[6] = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

void *assignWithCopy for ProductPageLookupRequest.ParameterRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[6];
  uint64_t v11 = a1[6];
  a1[6] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

void *assignWithTake for ProductPageLookupRequest.ParameterRequest(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  a1[4] = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(a1[5]);
  uint64_t v8 = a1[6];
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductPageLookupRequest.ParameterRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductPageLookupRequest.ParameterRequest( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
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

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest.ParameterRequest()
{
  return &type metadata for ProductPageLookupRequest.ParameterRequest;
}

uint64_t *initializeBufferWithCopyOfBuffer for ProductPageLookupRequest.URLRequest( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v13);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = type metadata accessor for URL(0LL);
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    v12(v10, v9, v11);
  }

  return v3;
}

uint64_t destroy for ProductPageLookupRequest.URLRequest(void *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

void *initializeWithCopy for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[4] = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  unint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24LL))(v13, v14, v15);
  return a1;
}

_OWORD *initializeWithTake for ProductPageLookupRequest.URLRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  unint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40LL))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductPageLookupRequest.URLRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001D2654);
}

uint64_t sub_1001D2654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 28),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for ProductPageLookupRequest.URLRequest( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001D26DC);
}

uint64_t sub_1001D26DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 28),  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_1001D2750(uint64_t a1)
{
  v4[0] = &unk_10020E140;
  v4[1] = &unk_10020E140;
  v4[2] = &unk_10020E140;
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest.URLRequest.CodingKeys()
{
  return &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys;
}

uint64_t _s15StoreKit_Shared24ProductPageLookupRequestV10URLRequestV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001D282C + 4 * byte_10020E045[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001D2860 + 4 * byte_10020E040[v4]))();
}

uint64_t sub_1001D2860(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D2868(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001D2870LL);
  }
  return result;
}

uint64_t sub_1001D287C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001D2884LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001D2888(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D2890(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest.ParameterRequest.CodingKeys()
{
  return &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys;
}

unint64_t sub_1001D28B0()
{
  unint64_t result = qword_1002BA070;
  if (!qword_1002BA070)
  {
    unint64_t result = swift_getWitnessTable("MN\b", &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA070);
  }

  return result;
}

unint64_t sub_1001D28F8()
{
  unint64_t result = qword_1002BA078;
  if (!qword_1002BA078)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E2E4, &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA078);
  }

  return result;
}

unint64_t sub_1001D2940()
{
  unint64_t result = qword_1002BA080;
  if (!qword_1002BA080)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E254, &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA080);
  }

  return result;
}

unint64_t sub_1001D2988()
{
  unint64_t result = qword_1002BA088;
  if (!qword_1002BA088)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E27C, &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA088);
  }

  return result;
}

unint64_t sub_1001D29D0()
{
  unint64_t result = qword_1002BA090;
  if (!qword_1002BA090)
  {
    unint64_t result = swift_getWitnessTable( byte_10020E164,  &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA090);
  }

  return result;
}

unint64_t sub_1001D2A18()
{
  unint64_t result = qword_1002BA098;
  if (!qword_1002BA098)
  {
    unint64_t result = swift_getWitnessTable( byte_10020E18C,  &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA098);
  }

  return result;
}

uint64_t sub_1001D2A5C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x49746375646F7270LL && a2 == 0xE900000000000044LL)
  {
    unint64_t v5 = 0xE900000000000044LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x49746375646F7270LL, 0xE900000000000044LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v7 = 0xE600000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x69666F725079656BLL && a2 == 0xEA0000000000656CLL)
  {
    unint64_t v8 = 0xEA0000000000656CLL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x69666F725079656BLL, 0xEA0000000000656CLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 7107189 && a2 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease(0xE300000000000000LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(7107189LL, 0xE300000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_1001D2C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002BA0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t ProductResponse.Key.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001D2C94 + 4 * byte_10020E3AC[a1]))( 0x6B726F77747261LL,  0xE700000000000000LL);
}

uint64_t sub_1001D2C94()
{
  return 0x7475626972747461LL;
}

uint64_t sub_1001D2CB0()
{
  return 0x79636E6572727563LL;
}

uint64_t sub_1001D2CD0()
{
  return 0x7470697263736564LL;
}

uint64_t sub_1001D2CF0()
{
  return 0x746E756F63736964LL;
}

uint64_t sub_1001D2D10()
{
  return 1701667182LL;
}

uint64_t sub_1001D2D20()
{
  return 0x726F466563697270LL;
}

uint64_t sub_1001D2D44()
{
  return 0x6F43646574736F68LL;
}

uint64_t sub_1001D2D68()
{
  return 0x6E6F6973726576LL;
}

uint64_t sub_1001D2D7C()
{
  return 1702521203LL;
}

unint64_t sub_1001D2D8C()
{
  return 0xD000000000000011LL;
}

uint64_t sub_1001D2EF4()
{
  return 1701869940LL;
}

uint64_t sub_1001D2F04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = ProductResponse.Key.rawValue.getter(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = ProductResponse.Key.rawValue.getter(v2);
  if (v3 == v6 && v5 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_1001D2F8C()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v5);
  uint64_t v2 = ProductResponse.Key.rawValue.getter(v1);
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_1001D2FEC(uint64_t a1)
{
  uint64_t v3 = ProductResponse.Key.rawValue.getter(*v1);
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1001D302C()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v5);
  uint64_t v2 = ProductResponse.Key.rawValue.getter(v1);
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_1001D3088@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = _s15StoreKit_Shared15ProductResponseV3KeyO8rawValueAESgSS_tcfC_0(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_1001D30B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ProductResponse.Key.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ProductResponse.serverCorrelationID.getter(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t ProductResponse.init(from:)(void *a1)
{
  uint64_t result = sub_1001D3520(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t ProductResponse.encode(to:)(void *a1, void *a2, unint64_t a3)
{
  unint64_t v28 = a2;
  uint64_t v6 = sub_1000175B0(&qword_1002BA0C8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  sub_1000175B0(&qword_1002B9D90);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v30 = 0LL;
  id v12 = [v10 dataWithJSONObject:isa options:0 error:&v30];

  id v13 = v30;
  if (v12)
  {
    unint64_t v14 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
    unint64_t v27 = v15;

    uint64_t v17 = a1[3];
    uint64_t v16 = a1[4];
    sub_100019F58(a1, v17);
    unint64_t v18 = sub_1001D39D8();
    dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductResponse.CodingKeys,  &type metadata for ProductResponse.CodingKeys,  v18,  v17,  v16);
    id v30 = v28;
    unint64_t v31 = a3;
    char v29 = 0;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000175B0(&qword_1002B9D40);
    uint64_t v20 = sub_1001D3F4C( (unint64_t *)&qword_1002B9D48,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> A?);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v30, &v29, v6, v19, v20);
    if (v3)
    {
      sub_10003A9EC((uint64_t)v14, v27);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }

    else
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = (uint64_t)v14;
      id v30 = v14;
      unint64_t v25 = v27;
      unint64_t v31 = v27;
      char v29 = 1;
      unint64_t v26 = sub_1001C73A8();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v30, &v29, v6, &type metadata for Data, v26);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return sub_10003A9EC(v24, v25);
    }
  }

  else
  {
    uint64_t v22 = v13;
    _convertNSErrorToError(_:)(v13);

    return swift_willThrow(v23);
  }

BOOL sub_1001D33BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1001D33D4()
{
  if (*v0) {
    return 0x73746375646F7270LL;
  }
  else {
    return 0xD000000000000013LL;
  }
}

uint64_t sub_1001D3414@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001D3E60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001D3438(uint64_t a1)
{
  unint64_t v2 = sub_1001D39D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D3460(uint64_t a1)
{
  unint64_t v2 = sub_1001D39D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001D3488@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1001D3520(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }

  return result;
}

uint64_t sub_1001D34B4(void *a1)
{
  return ProductResponse.encode(to:)(a1, *(void **)v1, *(void *)(v1 + 8));
}

uint64_t _s15StoreKit_Shared15ProductResponseV3KeyO8rawValueAESgSS_tcfC_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_100291ED8, a1, a2, &unk_1002B9A50);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x1B) {
    return 27LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1001D3520(void *a1)
{
  uint64_t v42 = type metadata accessor for DecodingError.Context(0LL);
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = sub_1000175B0(&qword_1002BA0F8);
  uint64_t v5 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100019F58(a1, v8);
  unint64_t v10 = sub_1001D39D8();
  uint64_t v11 = v44;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductResponse.CodingKeys,  &type metadata for ProductResponse.CodingKeys,  v10,  v8,  v9);
  if (v11) {
    return sub_100019F7C(a1);
  }
  int64_t v41 = v4;
  uint64_t v44 = v2;
  uint64_t v12 = sub_1000175B0(&qword_1002B9D40);
  LOBYTE(v45) = 0;
  sub_1001D3F4C( &qword_1002BA100,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> A?);
  uint64_t v13 = v43;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v12, &v45, v43, v12);
  id v15 = v46;
  LOBYTE(v45) = 1;
  sub_1001C784C();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v45, v13, &type metadata for Data);
  id v38 = v15;
  uint64_t v39 = a1;
  uint64_t v17 = (uint64_t)v46;
  unint64_t v16 = v47;
  unint64_t v18 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  unint64_t v40 = v16;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v46 = 0LL;
  id v20 = [v18 JSONObjectWithData:isa options:0 error:&v46];

  id v21 = v46;
  if (v20)
  {
    uint64_t v37 = v17;
    id v22 = v46;
    _bridgeAnyObjectToAny(_:)(&v46, v20);
    swift_unknownObjectRelease(v20);
    uint64_t v23 = sub_1000175B0(&qword_1002BA108);
    uint64_t v24 = v5;
    if ((swift_dynamicCast(&v45, &v46, (char *)&type metadata for Any + 8, v23, 6LL) & 1) != 0)
    {
      sub_10003A9EC(v37, v40);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
      swift_bridgeObjectRetain();
      sub_100019F7C(v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v38;
    }

    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1000175B0(&qword_1002B9D98);
    uint64_t v28 = swift_allocObject(v27, 72LL, 7LL);
    *(_OWORD *)(v28 + 16) = xmmword_1001F3C00;
    *(void *)(v28 + 56) = &type metadata for ProductResponse.CodingKeys;
    *(void *)(v28 + 64) = v10;
    *(_BYTE *)(v28 + 32) = 1;
    id v46 = 0LL;
    unint64_t v47 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(29LL);
    swift_bridgeObjectRelease();
    char v29 = v41;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v28,  0xD000000000000039LL,  0x8000000100222C50LL,  0LL);
    uint64_t v30 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v30, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v32 = v31;
    unint64_t v33 = v7;
    uint64_t v34 = v44;
    uint64_t v35 = v42;
    (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v31, v29, v42);
    uint64_t v36 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v30 - 8) + 104LL))( v32,  enum case for DecodingError.dataCorrupted(_:),  v30);
    swift_willThrow(v36);
    sub_10003A9EC(v37, v40);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v35);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v33, v43);
  }

  else
  {
    id v25 = v46;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)(v21);

    swift_willThrow(v26);
    sub_10003A9EC(v17, v40);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
  }

  sub_100019F7C(v39);
  return swift_bridgeObjectRelease();
}

unint64_t sub_1001D39D8()
{
  unint64_t result = qword_1002BA0D0;
  if (!qword_1002BA0D0)
  {
    unint64_t result = swift_getWitnessTable("AM\b", &type metadata for ProductResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA0D0);
  }

  return result;
}

unint64_t sub_1001D3A20()
{
  unint64_t result = qword_1002BA0D8;
  if (!qword_1002BA0D8)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductResponse.Key,  &type metadata for ProductResponse.Key);
    atomic_store(result, (unint64_t *)&qword_1002BA0D8);
  }

  return result;
}

__n128 initializeWithTake for ProductResponse(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ProductResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_10001762C(v0, 1LL, 1LL, v2) = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for ProductResponse()
{
  return &type metadata for ProductResponse;
}

uint64_t getEnumTagSinglePayload for ProductResponse.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE6) {
    goto LABEL_17;
  }
  if (a2 + 26 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 26) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 26;
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
      return (*a1 | (v4 << 8)) - 26;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }

uint64_t storeEnumTagSinglePayload for ProductResponse.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 26 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 26) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xE6) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE5) {
    return ((uint64_t (*)(void))((char *)&loc_1001D3BAC + 4 * byte_10020E3CC[v4]))();
  }
  *a1 = a2 + 26;
  return ((uint64_t (*)(void))((char *)sub_1001D3BE0 + 4 * byte_10020E3C7[v4]))();
}

uint64_t sub_1001D3BE0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D3BE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001D3BF0LL);
  }
  return result;
}

uint64_t sub_1001D3BFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001D3C04LL);
  }
  *(_BYTE *)__n128 result = a2 + 26;
  return result;
}

uint64_t sub_1001D3C08(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D3C10(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductResponse.Key()
{
  return &type metadata for ProductResponse.Key;
}

uint64_t getEnumTagSinglePayload for ProductResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for ProductResponse.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001D3D08 + 4 * byte_10020E3D6[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001D3D3C + 4 * byte_10020E3D1[v4]))();
}

uint64_t sub_1001D3D3C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D3D44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001D3D4CLL);
  }
  return result;
}

uint64_t sub_1001D3D58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001D3D60LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_1001D3D64(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D3D6C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductResponse.CodingKeys()
{
  return &type metadata for ProductResponse.CodingKeys;
}

unint64_t sub_1001D3D8C()
{
  unint64_t result = qword_1002BA0E0;
  if (!qword_1002BA0E0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E590, &type metadata for ProductResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA0E0);
  }

  return result;
}

unint64_t sub_1001D3DD4()
{
  unint64_t result = qword_1002BA0E8;
  if (!qword_1002BA0E8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E500, &type metadata for ProductResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA0E8);
  }

  return result;
}

unint64_t sub_1001D3E1C()
{
  unint64_t result = qword_1002BA0F0;
  if (!qword_1002BA0F0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E528, &type metadata for ProductResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA0F0);
  }

  return result;
}

uint64_t sub_1001D3E60(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v4 = 0x8000000100222C30LL;
    if (a2 == 0x8000000100222C30LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100222C30LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x73746375646F7270LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73746375646F7270LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1001D3F4C(unint64_t *a1, uint64_t a2, const char *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100018EC0(&qword_1002B9D40);
    uint64_t v8 = a2;
    uint64_t result = swift_getWitnessTable(a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t PurchaseIntentInternal.productName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain(*(void *)(v0 + 56));
  return v1;
}

uint64_t PurchaseIntentInternal.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseIntentInternal(0LL) + 32);
  uint64_t v4 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t type metadata accessor for PurchaseIntentInternal(uint64_t a1)
{
  uint64_t result = qword_1002BA190;
  if (!qword_1002BA190) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PurchaseIntentInternal);
  }
  return result;
}

uint64_t PurchaseIntentInternal.additionalBuyParams.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentInternal(0LL) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntentInternal.init(appName:bundleID:productID:productName:timestamp:additionalBuyParams:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v13 = type metadata accessor for PurchaseIntentInternal(0LL);
  unint64_t v14 = (char *)a9 + *(int *)(v13 + 32);
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))(v14, a10, v15);
  uint64_t v17 = (void *)((char *)a9 + *(int *)(v13 + 36));
  *uint64_t v17 = a11;
  v17[1] = a12;
  return result;
}

unint64_t PurchaseIntentInternal.additionalBuyParamsDictionary.getter()
{
  uint64_t v1 = type metadata accessor for PurchaseIntentInternal(0LL);
  int v2 = (uint64_t *)(v0 + *(int *)(v1 + 36));
  unint64_t v3 = v2[1];
  if (!v3) {
    return sub_1001D03C8((uint64_t)_swiftEmptyArrayStorage);
  }
  uint64_t v4 = *v2;
  uint64_t v63 = 38LL;
  unint64_t v64 = 0xE100000000000000LL;
  __chkstk_darwin(v1);
  uint64_t v56 = &v63;
  swift_bridgeObjectRetain_n(v3, 2LL);
  uint64_t v5 = 0LL;
  char v6 = sub_1001D5194(0x7FFFFFFFFFFFFFFFLL, 1, sub_1001D580C, (uint64_t)v55, v4, v3);
  swift_bridgeObjectRelease();
  int64_t v7 = *((void *)v6 + 2);
  if (v7)
  {
    id v62 = _swiftEmptyArrayStorage;
    sub_1001D4E3C(0LL, v7, 0);
    uint64_t v8 = 0LL;
    uint64_t v57 = v6;
    int64_t v58 = v7;
    uint64_t v59 = v6 + 32;
    do
    {
      uint64_t v9 = &v59[32 * v8];
      uint64_t v10 = *(void *)v9;
      uint64_t v11 = *((void *)v9 + 3);
      swift_bridgeObjectRetain();
      uint64_t v12 = static String._fromSubstring(_:)(v10);
      unint64_t v14 = v13;
      uint64_t v63 = 61LL;
      unint64_t v64 = 0xE100000000000000LL;
      __chkstk_darwin(v12);
      uint64_t v56 = &v63;
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_1001D5194(0x7FFFFFFFFFFFFFFFLL, 1, sub_1001D580C, (uint64_t)v55, v12, v14);
      swift_bridgeObjectRelease();
      int64_t v16 = *((void *)v15 + 2);
      if (v16)
      {
        uint64_t v60 = v11;
        uint64_t v61 = v5;
        uint64_t v63 = (uint64_t)_swiftEmptyArrayStorage;
        sub_1001D4E58(0LL, v16, 0);
        uint64_t v17 = (void *)v63;
        unint64_t v18 = v15 + 56;
        do
        {
          uint64_t v19 = *((void *)v18 - 3);
          swift_bridgeObjectRetain();
          uint64_t v20 = static String._fromSubstring(_:)(v19);
          uint64_t v22 = v21;
          swift_bridgeObjectRelease();
          uint64_t v63 = (uint64_t)v17;
          unint64_t v24 = v17[2];
          unint64_t v23 = v17[3];
          if (v24 >= v23 >> 1)
          {
            sub_1001D4E58((char *)(v23 > 1), v24 + 1, 1);
            uint64_t v17 = (void *)v63;
          }

          void v17[2] = v24 + 1;
          id v25 = &v17[2 * v24];
          v25[4] = v20;
          v25[5] = v22;
          v18 += 32;
          --v16;
        }

        while (v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int64_t v7 = v58;
        uint64_t v5 = v61;
      }

      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v17 = _swiftEmptyArrayStorage;
      }

      uint64_t v26 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native(v62) & 1) == 0)
      {
        sub_1001D4E3C(0LL, v26[2] + 1LL, 1);
        uint64_t v26 = v62;
      }

      unint64_t v28 = v26[2];
      unint64_t v27 = v26[3];
      if (v28 >= v27 >> 1)
      {
        sub_1001D4E3C((void *)(v27 > 1), v28 + 1, 1);
        uint64_t v26 = v62;
      }

      ++v8;
      v26[2] = v28 + 1;
      v26[v28 + 4] = v17;
    }

    while (v8 != v7);
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = _swiftEmptyArrayStorage;
  }

  unint64_t v30 = sub_1001D03C8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v31 = (char *)v26[2];
  if (!v31)
  {
    swift_bridgeObjectRelease();
    return v30;
  }

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v32 = 0LL;
  int64_t v58 = v30;
  uint64_t v59 = v31;
  while (1)
  {
    uint64_t v35 = (void *)v26[v32 + 4];
    if (v35[2] != 2LL) {
      goto LABEL_23;
    }
    uint64_t v36 = v35[4];
    uint64_t v37 = v35[5];
    uint64_t v38 = v35[7];
    uint64_t v60 = v35[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v61 = v38;
    swift_bridgeObjectRetain();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
    uint64_t v63 = v30;
    unint64_t v41 = sub_1001CA790(v36, v37);
    uint64_t v42 = *(void *)(v30 + 16);
    BOOL v43 = (v40 & 1) == 0;
    uint64_t v44 = v42 + v43;
    if (__OFADD__(v42, v43)) {
      break;
    }
    char v45 = v40;
    if (*(void *)(v30 + 24) >= v44)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v48 = (void *)v63;
        if ((v40 & 1) == 0) {
          goto LABEL_32;
        }
      }

      else
      {
        sub_1001D1730();
        uint64_t v48 = (void *)v63;
        if ((v45 & 1) == 0) {
          goto LABEL_32;
        }
      }
    }

    else
    {
      sub_1001D0EB0(v44, isUniquelyReferenced_nonNull_native);
      unint64_t v46 = sub_1001CA790(v36, v37);
      if ((v45 & 1) != (v47 & 1)) {
        goto LABEL_41;
      }
      unint64_t v41 = v46;
      uint64_t v48 = (void *)v63;
      if ((v45 & 1) == 0)
      {
LABEL_32:
        v48[(v41 >> 6) + 8] |= 1LL << v41;
        uint64_t v49 = (uint64_t *)(v48[6] + 16 * v41);
        uint64_t *v49 = v36;
        v49[1] = v37;
        uint64_t v50 = (void *)(v48[7] + 16 * v41);
        uint64_t v51 = v61;
        *uint64_t v50 = v60;
        v50[1] = v51;
        uint64_t v52 = v48[2];
        BOOL v53 = __OFADD__(v52, 1LL);
        uint64_t v54 = v52 + 1;
        if (v53) {
          goto LABEL_40;
        }
        v48[2] = v54;
        swift_bridgeObjectRetain();
        goto LABEL_22;
      }
    }

    unint64_t v33 = (void *)(v48[7] + 16 * v41);
    swift_bridgeObjectRelease();
    uint64_t v34 = v61;
    *unint64_t v33 = v60;
    v33[1] = v34;
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v30 = (unint64_t)v48;
    uint64_t v31 = v59;
LABEL_23:
    if (v31 == (char *)++v32)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n(v26, 2LL);
      return v30;
    }
  }

  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t PurchaseIntentInternal.buyParamsOfferID.getter()
{
  unint64_t v0 = PurchaseIntentInternal.additionalBuyParamsDictionary.getter();
  if (*(void *)(v0 + 16) && (unint64_t v1 = sub_1001CA790(0x66664F636F486461LL, 0xEC00000064497265LL), (v2 & 1) != 0))
  {
    uint64_t v3 = *(void *)(*(void *)(v0 + 56) + 16 * v1);
    swift_bridgeObjectRetain();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1001D46FC()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001D472C + 4 * byte_10020E610[*v0]))( 0x656D614E707061LL,  0xE700000000000000LL);
}

uint64_t sub_1001D472C()
{
  return 0x4449656C646E7562LL;
}

uint64_t sub_1001D4744()
{
  return 0x49746375646F7270LL;
}

uint64_t sub_1001D4760()
{
  return 0x4E746375646F7270LL;
}

uint64_t sub_1001D4780()
{
  return 0x6D617473656D6974LL;
}

unint64_t sub_1001D47A0()
{
  return 0xD000000000000013LL;
}

uint64_t sub_1001D47BC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001D6154(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001D47E0(uint64_t a1)
{
  unint64_t v2 = sub_1001D5878();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D4808(uint64_t a1)
{
  unint64_t v2 = sub_1001D5878();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentInternal.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA110);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001D5878();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentInternal.CodingKeys,  &type metadata for PurchaseIntentInternal.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v34 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v12, v13, &v34, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v33 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v33, v5);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v32 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v32, v5);
    uint64_t v18 = v3[6];
    uint64_t v19 = v3[7];
    char v31 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, &v31, v5);
    uint64_t v20 = type metadata accessor for PurchaseIntentInternal(0LL);
    uint64_t v21 = (char *)v3 + *(int *)(v20 + 32);
    char v30 = 4;
    uint64_t v22 = type metadata accessor for Date(0LL);
    uint64_t v23 = sub_1001D58BC(&qword_1002BA120, (const char *)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v30, v5, v22, v23);
    unint64_t v24 = (uint64_t *)((char *)v3 + *(int *)(v20 + 36));
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    char v29 = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v25, v26, &v29, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t PurchaseIntentInternal.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = sub_1000175B0(&qword_1002BA128);
  uint64_t v6 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PurchaseIntentInternal(0LL);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  char v34 = a1;
  sub_100019F58(a1, v12);
  unint64_t v14 = sub_1001D5878();
  uint64_t v15 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentInternal.CodingKeys,  &type metadata for PurchaseIntentInternal.CodingKeys,  v14,  v12,  v13);
  if (v15) {
    return sub_100019F7C(v34);
  }
  uint64_t v35 = v5;
  uint64_t v16 = v6;
  uint64_t v17 = v32;
  char v41 = 0;
  *(void *)unint64_t v11 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v41, v33);
  *((void *)v11 + 1) = v18;
  char v40 = 1;
  *((void *)v11 + 2) = KeyedDecodingContainer.decode(_:forKey:)(&v40, v33);
  *((void *)v11 + 3) = v19;
  char v39 = 2;
  *((void *)v11 + 4) = KeyedDecodingContainer.decode(_:forKey:)(&v39, v33);
  *((void *)v11 + 5) = v20;
  char v38 = 3;
  uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v38, v33);
  v29[1] = 0LL;
  *((void *)v11 + 6) = v21;
  *((void *)v11 + 7) = v22;
  char v37 = 4;
  sub_1001D58BC(&qword_1002BA130, (const char *)&protocol conformance descriptor for Date);
  uint64_t v23 = v35;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v17, &v37, v33, v17);
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v11[*(int *)(v9 + 32)], v23, v17);
  char v36 = 5;
  uint64_t v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v36, v33);
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v33);
  unint64_t v27 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *unint64_t v27 = v24;
  v27[1] = v26;
  sub_1001D58FC((uint64_t)v11, v30);
  sub_100019F7C(v34);
  return sub_1001D5940((uint64_t)v11);
}

uint64_t sub_1001D4DF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentInternal.init(from:)(a1, a2);
}

uint64_t sub_1001D4E0C(void *a1)
{
  return PurchaseIntentInternal.encode(to:)(a1);
}

char *sub_1001D4E20(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1001D4E74(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1001D4E3C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1001D4F74(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1001D4E58(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1001D5094(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1001D4E74(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000175B0(&qword_1002BA210);
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

  unint64_t v14 = v11 + 32;
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
    swift_arrayInitWithCopy(v14);
  }

  swift_release();
  return v11;
}

void *sub_1001D4F74(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_1000175B0(&qword_1002BA1F8);
    unint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    unint64_t v11 = _swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4]) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    sub_1000175B0(&qword_1002BA200);
    swift_arrayInitWithCopy(v11 + 4);
  }

  swift_release();
  return v11;
}

char *sub_1001D5094(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000175B0(&qword_1002BA1F0);
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

  unint64_t v14 = v11 + 32;
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
    swift_arrayInitWithCopy(v14);
  }

  swift_release();
  return v11;
}

char *sub_1001D5194( uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v48[3] = a4;
  if (a1 < 0)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }

  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject(&unk_1002933D0, 24LL, 7LL);
  *(void *)(v14 + 16) = _swiftEmptyArrayStorage;
  uint64_t v45 = swift_allocObject(&unk_1002933F8, 24LL, 7LL);
  *(void *)(v45 + 16) = 15LL;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000LL) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000LL) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v31 = 7LL;
    if (((a6 >> 60) & ((v11 & 0x800000000000000LL) == 0)) != 0) {
      uint64_t v31 = 11LL;
    }
    sub_1001D55AC(v31 | (v15 << 16), v45, a2 & 1, v14, v11, a6);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_40;
  }

  uint64_t v40 = a1;
  uint64_t v41 = v14;
  uint64_t v17 = 7LL;
  if (((a6 >> 60) & ((v11 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v17 = 11LL;
  }
  uint64_t v39 = v17 | (v16 << 16);
  unint64_t v46 = 4 * v16;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  unint64_t v9 = 15LL;
  unint64_t v8 = 15LL;
  unint64_t v18 = 15LL;
  while (1)
  {
    v48[0] = String.subscript.getter(v9, v11, a6);
    v48[1] = v19;
    uint64_t v20 = a3(v48);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }

    uint64_t v6 = v20;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      break;
    }
    unint64_t v9 = String.index(after:)(v9, v11, a6);
LABEL_11:
    if (v46 == v9 >> 14) {
      goto LABEL_31;
    }
  }

  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = String.index(after:)(v9, v11, a6);
    *(void *)(v45 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v18 = v9;
    goto LABEL_11;
  }

  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_43;
  }

  uint64_t v21 = String.subscript.getter(v8, v9, v11, a6);
  uint64_t v42 = v22;
  uint64_t v43 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0) {
    uint64_t v10 = sub_1001D56B8(0LL, *((void *)v10 + 2) + 1LL, 1, v10);
  }
  unint64_t v28 = *((void *)v10 + 2);
  unint64_t v27 = *((void *)v10 + 3);
  uint64_t v6 = v28 + 1;
  if (v28 >= v27 >> 1) {
    uint64_t v10 = sub_1001D56B8((char *)(v27 > 1), v28 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  char v29 = &v10[32 * v28];
  *((void *)v29 + 4) = v43;
  *((void *)v29 + 5) = v24;
  *((void *)v29 + 6) = v26;
  *((void *)v29 + 7) = v42;
  *(void *)(v41 + 16) = v10;
  uint64_t v30 = String.index(after:)(v9, v11, a6);
  unint64_t v9 = v30;
  *(void *)(v45 + 16) = v30;
  if (*((void *)v10 + 2) != v40)
  {
    unint64_t v8 = v30;
    unint64_t v18 = v30;
    goto LABEL_11;
  }

  unint64_t v18 = v30;
  unint64_t v8 = v30;
LABEL_31:
  if (v46 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }

  if (v46 >= v18 >> 14)
  {
    uint64_t v6 = String.subscript.getter(v18, v39, v11, a6);
    unint64_t v8 = v32;
    unint64_t v9 = v33;
    uint64_t v11 = v34;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_36;
  }

uint64_t sub_1001D55AC( unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v13 = *(void *)(a2 + 16);
  int v14 = (v13 >> 14 == a1 >> 14) & a3;
  if (v14 == 1) {
    return v14 ^ 1u;
  }
  if (a1 >> 14 < v13 >> 14)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v6 = a4;
  uint64_t v7 = String.subscript.getter(v13, a1, a5, a6);
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  uint64_t v11 = *(char **)(v6 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
  *(void *)(v6 + 16) = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    uint64_t v11 = sub_1001D56B8(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    *(void *)(v6 + 16) = v11;
  }

  unint64_t v20 = *((void *)v11 + 2);
  unint64_t v19 = *((void *)v11 + 3);
  if (v20 >= v19 >> 1)
  {
    uint64_t v11 = sub_1001D56B8((char *)(v19 > 1), v20 + 1, 1, v11);
    *(void *)(v6 + 16) = v11;
  }

  *((void *)v11 + 2) = v20 + 1;
  uint64_t v21 = &v11[32 * v20];
  *((void *)v21 + 4) = v7;
  *((void *)v21 + 5) = v8;
  *((void *)v21 + 6) = v9;
  *((void *)v21 + 7) = v10;
  return v14 ^ 1u;
}

char *sub_1001D56B8(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000175B0(&qword_1002BA208);
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
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  int v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v14);
  }

  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1001D57B8(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  if (v4 == *a2 && v5 == v6) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0LL) & 1;
  }
}

uint64_t sub_1001D580C(uint64_t *a1)
{
  return sub_1001D5824(a1) & 1;
}

uint64_t sub_1001D5824(uint64_t *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = v3[1];
  if (v4 == *v3 && v5 == v6) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *v3, v6, 0LL) & 1;
  }
}

unint64_t sub_1001D5878()
{
  unint64_t result = qword_1002BA118;
  if (!qword_1002BA118)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E79C, &type metadata for PurchaseIntentInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA118);
  }

  return result;
}

uint64_t sub_1001D58BC(unint64_t *a1, const char *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for Date(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1001D58FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001D5940(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PurchaseIntentInternal(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for PurchaseIntentInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v19);
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    uint64_t v11 = *(int *)(a3 + 32);
    uint64_t v21 = (char *)a1 + v11;
    int64_t v12 = (char *)a2 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v13 = type metadata accessor for Date(0LL);
    int v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    v14(v21, v12, v13);
    uint64_t v15 = *(int *)(a3 + 36);
    uint64_t v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain(v18);
  }

  return v4;
}

uint64_t destroy for PurchaseIntentInternal(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  return swift_bridgeObjectRelease(*(void *)((char *)a1 + *(int *)(a2 + 36) + 8));
}

void *initializeWithCopy for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v19 = (char *)a1 + v10;
  uint64_t v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  v13(v19, v11, v12);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain(v17);
  return a1;
}

void *assignWithCopy for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[4] = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[6] = a2[6];
  uint64_t v12 = a2[7];
  uint64_t v13 = a1[7];
  a1[7] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  uint64_t v18 = *(int *)(a3 + 36);
  uint64_t v19 = (void *)((char *)a1 + v18);
  unint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  uint64_t v21 = v20[1];
  uint64_t v22 = v19[1];
  v19[1] = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentInternal(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  __int128 v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 36));
  return a1;
}

void *assignWithTake for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a2[7];
  uint64_t v13 = a1[7];
  a1[6] = a2[6];
  a1[7] = v12;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40LL))(v15, v16, v17);
  uint64_t v18 = *(int *)(a3 + 36);
  uint64_t v19 = (void *)((char *)a1 + v18);
  unint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  uint64_t v23 = v19[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease(v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001D5E34);
}

uint64_t sub_1001D5E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for Date(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 32),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for PurchaseIntentInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001D5EBC);
}

uint64_t sub_1001D5EBC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Date(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 32),  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_1001D5F30(uint64_t a1)
{
  v4[0] = &unk_10020E6A8;
  v4[1] = &unk_10020E6C0;
  v4[2] = &unk_10020E6C0;
  void v4[3] = &unk_10020E6A8;
  uint64_t result = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    void v4[4] = *(void *)(result - 8) + 64LL;
    v4[5] = &unk_10020E6A8;
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentInternal.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_1001D5FFC + 4 * byte_10020E61B[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1001D6030 + 4 * byte_10020E616[v4]))();
}

uint64_t sub_1001D6030(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D6038(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001D6040LL);
  }
  return result;
}

uint64_t sub_1001D604C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001D6054LL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_1001D6058(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D6060(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentInternal.CodingKeys()
{
  return &type metadata for PurchaseIntentInternal.CodingKeys;
}

unint64_t sub_1001D6080()
{
  unint64_t result = qword_1002BA1D8;
  if (!qword_1002BA1D8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E774, &type metadata for PurchaseIntentInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA1D8);
  }

  return result;
}

unint64_t sub_1001D60C8()
{
  unint64_t result = qword_1002BA1E0;
  if (!qword_1002BA1E0)
  {
    unint64_t result = swift_getWitnessTable("MM\b", &type metadata for PurchaseIntentInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA1E0);
  }

  return result;
}

unint64_t sub_1001D6110()
{
  unint64_t result = qword_1002BA1E8;
  if (!qword_1002BA1E8)
  {
    unint64_t result = swift_getWitnessTable("5M\b", &type metadata for PurchaseIntentInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA1E8);
  }

  return result;
}

uint64_t sub_1001D6154(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x656D614E707061LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v5 = 0xE700000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656D614E707061LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x4449656C646E7562LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v7 = 0xE800000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4449656C646E7562LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x49746375646F7270LL && a2 == 0xE900000000000044LL)
  {
    unint64_t v8 = 0xE900000000000044LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x49746375646F7270LL, 0xE900000000000044LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x4E746375646F7270LL && a2 == 0xEB00000000656D61LL)
  {
    unint64_t v9 = 0xEB00000000656D61LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4E746375646F7270LL, 0xEB00000000656D61LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x6D617473656D6974LL && a2 == 0xE900000000000070LL)
  {
    unint64_t v10 = 0xE900000000000070LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D617473656D6974LL, 0xE900000000000070LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0xD000000000000013LL && a2 == 0x8000000100222C90LL)
  {
    swift_bridgeObjectRelease(0x8000000100222C90LL);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100222C90LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_1001D63F8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1001D641C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t AcknowledgeMessageRequest.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AcknowledgeMessageRequest(0LL) + 28);
  return sub_1001D6498(v3, a1);
}

uint64_t type metadata accessor for AcknowledgeMessageRequest(uint64_t a1)
{
  uint64_t result = qword_1002BA2C0;
  if (!qword_1002BA2C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AcknowledgeMessageRequest);
  }
  return result;
}

uint64_t sub_1001D6498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t AcknowledgeMessageRequest.clientOverride.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AcknowledgeMessageRequest(0LL) + 28);
  return sub_1001D6510(a1, v3);
}

uint64_t sub_1001D6510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t (*AcknowledgeMessageRequest.clientOverride.modify())(void)
{
  return debugOnly(_:);
}

uint64_t AcknowledgeMessageRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AcknowledgeMessageRequest(0LL) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AcknowledgeMessageRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AcknowledgeMessageRequest(0LL) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AcknowledgeMessageRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t AcknowledgeMessageRequest.init(messageType:bundleID:offerID:overrides:logKey:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v17 = type metadata accessor for AcknowledgeMessageRequest(0LL);
  uint64_t v18 = (uint64_t)a9 + *(int *)(v17 + 28);
  uint64_t v19 = type metadata accessor for ClientOverride(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v18, 1LL, 1LL, v19);
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  uint64_t result = sub_1001D6510(a7, v18);
  uint64_t v21 = (void *)((char *)a9 + *(int *)(v17 + 32));
  void *v21 = a8;
  v21[1] = a10;
  return result;
}

uint64_t AcknowledgeMessageRequest.encode()()
{
  uint64_t v1 = type metadata accessor for JSONEncoder(0LL);
  uint64_t v2 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  JSONEncoder.init()(v2);
  uint64_t v3 = type metadata accessor for AcknowledgeMessageRequest(0LL);
  uint64_t v4 = sub_1000221A8( &qword_1002BA220,  type metadata accessor for AcknowledgeMessageRequest,  (uint64_t)&protocol conformance descriptor for AcknowledgeMessageRequest);
  uint64_t v5 = dispatch thunk of JSONEncoder.encode<A>(_:)(v0, v3, v4);
  swift_release();
  return v5;
}

uint64_t static AcknowledgeMessageRequest.decode(encodedRequest:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  JSONDecoder.init()();
  uint64_t v5 = type metadata accessor for AcknowledgeMessageRequest(0LL);
  sub_1000221A8( &qword_1002BA228,  type metadata accessor for AcknowledgeMessageRequest,  (uint64_t)&protocol conformance descriptor for AcknowledgeMessageRequest);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v5, a1, a2, v5);
  return swift_release();
}

uint64_t sub_1001D6840()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001D6878 + 4 * byte_10020E7F0[*v0]))( 0x546567617373656DLL,  0xEB00000000657079LL);
}

uint64_t sub_1001D6878()
{
  return 0x4449656C646E7562LL;
}

uint64_t sub_1001D6890()
{
  return 0x4449726566666FLL;
}

uint64_t sub_1001D68A8()
{
  return 0x764F746E65696C63LL;
}

uint64_t sub_1001D68CC()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001D68E0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001D7050(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001D6904(uint64_t a1)
{
  unint64_t v2 = sub_1001D6B2C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D692C(uint64_t a1)
{
  unint64_t v2 = sub_1001D6B2C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AcknowledgeMessageRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA230);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001D6B2C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for AcknowledgeMessageRequest.CodingKeys,  &type metadata for AcknowledgeMessageRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v31 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v31, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v30 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, &v30, v5);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v29 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v29, v5);
    uint64_t v18 = type metadata accessor for AcknowledgeMessageRequest(0LL);
    uint64_t v19 = (char *)v3 + *(int *)(v18 + 28);
    char v28 = 3;
    uint64_t v20 = type metadata accessor for ClientOverride(0LL);
    uint64_t v21 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v19, &v28, v5, v20, v21);
    uint64_t v22 = (uint64_t *)((char *)v3 + *(int *)(v18 + 32));
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    char v27 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v23, v24, &v27, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1001D6B2C()
{
  unint64_t result = qword_1002BA238;
  if (!qword_1002BA238)
  {
    unint64_t result = swift_getWitnessTable(byte_10020EA80, &type metadata for AcknowledgeMessageRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA238);
  }

  return result;
}

uint64_t AcknowledgeMessageRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v3);
  uint64_t v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002BA248);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for AcknowledgeMessageRequest(0LL);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v11 = (uint64_t *)((char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = (uint64_t)v11 + *(int *)(v9 + 28);
  uint64_t v13 = type metadata accessor for ClientOverride(0LL);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL);
  uint64_t v37 = v12;
  v14(v12, 1LL, 1LL, v13);
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  sub_100019F58(a1, v15);
  unint64_t v17 = sub_1001D6B2C();
  uint64_t v18 = v38;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for AcknowledgeMessageRequest.CodingKeys,  &type metadata for AcknowledgeMessageRequest.CodingKeys,  v17,  v15,  v16);
  if (v18)
  {
    sub_100019F7C(a1);
    return sub_100043F40(v37, &qword_1002BA218);
  }

  else
  {
    uint64_t v32 = v13;
    char v38 = a1;
    uint64_t v20 = v35;
    uint64_t v19 = v36;
    char v43 = 0;
    *unint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)(&v43, v36);
    v11[1] = v21;
    char v42 = 1;
    v11[2] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v42, v19);
    v11[3] = v22;
    char v41 = 2;
    v11[4] = KeyedDecodingContainer.decode(_:forKey:)(&v41, v19);
    v11[5] = v23;
    char v40 = 3;
    uint64_t v24 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
    uint64_t v25 = (uint64_t)v34;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v32, &v40, v19, v32, v24);
    sub_1001D6510(v25, v37);
    char v39 = 4;
    uint64_t v26 = KeyedDecodingContainer.decode(_:forKey:)(&v39, v19);
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v36);
    char v29 = (void *)((char *)v11 + *(int *)(v8 + 32));
    *char v29 = v26;
    v29[1] = v28;
    sub_1001D6F00((uint64_t)v11, v33);
    sub_100019F7C(v38);
    return sub_1000A77B0((uint64_t)v11, type metadata accessor for AcknowledgeMessageRequest);
  }

uint64_t sub_1001D6F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AcknowledgeMessageRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001D6F44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AcknowledgeMessageRequest.init(from:)(a1, a2);
}

uint64_t sub_1001D6F58(void *a1)
{
  return AcknowledgeMessageRequest.encode(to:)(a1);
}

Swift::Int sub_1001D6F70()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void sub_1001D6FB4()
{
}

Swift::Int sub_1001D6FE0()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void sub_1001D7020(void *a1@<X8>)
{
  *a1 = *v1 + 1LL;
}

uint64_t MessageType.messageTypeString.getter(char a1)
{
  return qword_10020EAD8[a1];
}

uint64_t sub_1001D7050(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079LL)
  {
    unint64_t v5 = 0xEB00000000657079LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x546567617373656DLL, 0xEB00000000657079LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x4449656C646E7562LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v7 = 0xE800000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4449656C646E7562LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x4449726566666FLL && a2 == 0xE700000000000000LL)
  {
    unint64_t v8 = 0xE700000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4449726566666FLL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v9 = 0xEE00656469727265LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 4LL;
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0) {
      return 4LL;
    }
    else {
      return 5LL;
    }
  }

uint64_t sub_1001D72A0(uint64_t a1)
{
  uint64_t result = sub_1000221A8( &qword_1002BA258,  type metadata accessor for AcknowledgeMessageRequest,  (uint64_t)&unk_10020E82C);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001D72DC(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA228,  type metadata accessor for AcknowledgeMessageRequest,  (uint64_t)&protocol conformance descriptor for AcknowledgeMessageRequest);
  uint64_t result = sub_1000221A8( &qword_1002BA220,  type metadata accessor for AcknowledgeMessageRequest,  (uint64_t)&protocol conformance descriptor for AcknowledgeMessageRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

unint64_t sub_1001D733C()
{
  unint64_t result = qword_1002BA260;
  if (!qword_1002BA260)
  {
    unint64_t result = swift_getWitnessTable(protocol conformance descriptor for MessageType, &type metadata for MessageType);
    atomic_store(result, (unint64_t *)&qword_1002BA260);
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AcknowledgeMessageRequest( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    uint64_t v9 = *(int *)(a3 + 28);
    char v10 = (unint64_t *)((char *)a1 + v9);
    unint64_t v11 = (unint64_t *)((char *)a2 + v9);
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v12 = type metadata accessor for ClientOverride(0LL);
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(unint64_t *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1LL, v12))
    {
      uint64_t v15 = sub_1000175B0(&qword_1002BA218);
      memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64LL));
      uint64_t v16 = a3;
    }

    else
    {
      uint64_t v47 = v13;
      unint64_t v18 = v11[1];
      if (v18 >> 60 == 15)
      {
        *(_OWORD *)char v10 = *(_OWORD *)v11;
      }

      else
      {
        unint64_t v19 = *v11;
        sub_10003AA88(*v11, v11[1]);
        *char v10 = v19;
        v10[1] = v18;
      }

      uint64_t v20 = (int *)v12;
      uint64_t v16 = a3;
      unint64_t v21 = v11[3];
      __int128 v10[2] = v11[2];
      v10[3] = v21;
      unint64_t v22 = v11[5];
      v10[4] = v11[4];
      v10[5] = v22;
      uint64_t v23 = v20[7];
      uint64_t v24 = (char *)v10 + v23;
      uint64_t v25 = (char *)v11 + v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v27 = *(void *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 3LL, v26))
      {
        uint64_t v28 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64LL));
      }

      else
      {
        uint64_t v29 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16LL))(v24, v25, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0LL, 3LL, v26);
      }

      uint64_t v30 = v20[8];
      uint64_t v31 = (char *)v10 + v30;
      uint64_t v32 = (char *)v11 + v30;
      *(void *)uint64_t v31 = *(void *)v32;
      v31[8] = v32[8];
      uint64_t v33 = v20[9];
      uint64_t v34 = (char *)v10 + v33;
      uint64_t v35 = (char *)v11 + v33;
      v34[8] = v35[8];
      *(void *)uint64_t v34 = *(void *)v35;
      uint64_t v36 = v20[10];
      uint64_t v37 = (char *)v10 + v36;
      char v38 = (char *)v11 + v36;
      uint64_t v39 = type metadata accessor for UUID(0LL);
      uint64_t v40 = *(void *)(v39 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1LL, v39))
      {
        uint64_t v41 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0LL, 1LL, v39);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v47 + 56))(v10, 0LL, 1LL, v20);
    }

    uint64_t v42 = *(int *)(v16 + 32);
    char v43 = (uint64_t *)((char *)v4 + v42);
    uint64_t v44 = (uint64_t *)((char *)a2 + v42);
    uint64_t v45 = v44[1];
    *char v43 = *v44;
    v43[1] = v45;
    swift_bridgeObjectRetain();
  }

  return v4;
}

uint64_t destroy for AcknowledgeMessageRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  uint64_t v5 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48LL))(v4, 1LL, v5))
  {
    unint64_t v6 = v4[1];
    if (v6 >> 60 != 15) {
      sub_10003A9EC(*v4, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v4 + *(int *)(v5 + 28);
    uint64_t v8 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 3LL, v8))
    {
      uint64_t v9 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v7, v9);
    }

    char v10 = (char *)v4 + *(int *)(v5 + 40);
    uint64_t v11 = type metadata accessor for UUID(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)((char *)a1 + v8);
  char v10 = (void *)((char *)a2 + v8);
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v11 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(unsigned int (**)(unint64_t *, uint64_t, int *))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1LL, v11))
  {
    uint64_t v14 = sub_1000175B0(&qword_1002BA218);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64LL));
    uint64_t v15 = a3;
  }

  else
  {
    uint64_t v44 = v12;
    unint64_t v16 = v10[1];
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    }

    else
    {
      unint64_t v17 = *v10;
      sub_10003AA88(*v10, v10[1]);
      *uint64_t v9 = v17;
      v9[1] = v16;
    }

    uint64_t v15 = a3;
    unint64_t v18 = v10[3];
    v9[2] = v10[2];
    v9[3] = v18;
    unint64_t v19 = v10[5];
    v9[4] = v10[4];
    v9[5] = v19;
    uint64_t v20 = v11[7];
    unint64_t v21 = (char *)v9 + v20;
    unint64_t v22 = (char *)v10 + v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 3LL, v23))
    {
      uint64_t v25 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64LL));
    }

    else
    {
      uint64_t v26 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v21, v22, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0LL, 3LL, v23);
    }

    uint64_t v27 = v11[8];
    uint64_t v28 = (char *)v9 + v27;
    uint64_t v29 = (char *)v10 + v27;
    *(void *)uint64_t v28 = *(void *)v29;
    v28[8] = v29[8];
    uint64_t v30 = v11[9];
    uint64_t v31 = (char *)v9 + v30;
    uint64_t v32 = (char *)v10 + v30;
    v31[8] = v32[8];
    *(void *)uint64_t v31 = *(void *)v32;
    uint64_t v33 = v11[10];
    uint64_t v34 = (char *)v9 + v33;
    uint64_t v35 = (char *)v10 + v33;
    uint64_t v36 = type metadata accessor for UUID(0LL);
    uint64_t v37 = *(void *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36))
    {
      uint64_t v38 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0LL, 1LL, v36);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v44 + 56))(v9, 0LL, 1LL, v11);
  }

  uint64_t v39 = *(int *)(v15 + 32);
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  uint64_t v42 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v42;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v10 + 48);
  int v12 = v11(v7, 1LL, v9);
  int v13 = v11(v8, 1LL, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1000A77B0((uint64_t)v7, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v16 = v8[1];
    uint64_t v77 = a3;
    if ((unint64_t)v7[1] >> 60 == 15)
    {
      if (v16 >> 60 != 15)
      {
        uint64_t v17 = *v8;
        sub_10003AA88(*v8, v16);
        *uint64_t v7 = v17;
        v7[1] = v16;
        goto LABEL_23;
      }
    }

    else
    {
      if (v16 >> 60 != 15)
      {
        uint64_t v40 = *v8;
        sub_10003AA88(*v8, v16);
        uint64_t v41 = *v7;
        unint64_t v42 = v7[1];
        *uint64_t v7 = v40;
        v7[1] = v16;
        sub_10003A9EC(v41, v42);
LABEL_23:
        _OWORD v7[2] = v8[2];
        v7[3] = v8[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v7[4] = v8[4];
        v7[5] = v8[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v43 = v9[7];
        uint64_t v44 = (char *)v7 + v43;
        uint64_t v45 = (char *)v8 + v43;
        uint64_t v46 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v47 = *(void *)(v46 - 8);
        uint64_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
        uint64_t v75 = (uint64_t)v44;
        LODWORD(v44) = v48(v44, 3LL, v46);
        int v49 = v48(v45, 3LL, v46);
        if ((_DWORD)v44)
        {
          if (v49)
          {
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v75;
LABEL_28:
            memcpy(v51, v45, v50);
            goto LABEL_31;
          }

          uint64_t v52 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v52 - 8) + 16LL))(v75, v45, v52);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v75, 0LL, 3LL, v46);
        }

        else
        {
          if (v49)
          {
            sub_100043F40(v75, &qword_1002B9A70);
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v75;
            goto LABEL_28;
          }

          uint64_t v53 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v53 - 8) + 24LL))(v75, v45, v53);
        }

_OWORD *initializeWithTake for AcknowledgeMessageRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (_OWORD *)((char *)a1 + v7);
  uint64_t v9 = (_OWORD *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v11 + 48))(v9, 1LL, v10))
  {
    uint64_t v12 = sub_1000175B0(&qword_1002BA218);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    __int128 v13 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v13;
    __int128 v8[2] = v9[2];
    uint64_t v14 = v10[7];
    __dst = (char *)v8 + v14;
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3LL, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))(__dst, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0LL, 3LL, v16);
    }

    uint64_t v20 = v10[8];
    unint64_t v21 = (char *)v8 + v20;
    uint64_t v22 = (char *)v9 + v20;
    *(void *)unint64_t v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = v10[9];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    _BYTE v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v10[10];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    uint64_t v29 = type metadata accessor for UUID(0LL);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1LL, v29))
    {
      uint64_t v31 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0LL, 1LL, v29);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  *(_OWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  uint64_t v12 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v13 = *((void *)v12 - 1);
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v13 + 48);
  int v15 = v14(v10, 1LL, v12);
  int v16 = v14(v11, 1LL, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1000A77B0((uint64_t)v10, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v25 = v10[1];
    uint64_t v77 = a3;
    if (v25 >> 60 != 15)
    {
      unint64_t v26 = v11[1];
      if (v26 >> 60 != 15)
      {
        uint64_t v40 = *v10;
        *uint64_t v10 = *v11;
        v10[1] = v26;
        sub_10003A9EC(v40, v25);
LABEL_18:
        uint64_t v41 = v11[3];
        __int128 v10[2] = v11[2];
        v10[3] = v41;
        swift_bridgeObjectRelease();
        uint64_t v42 = v11[5];
        v10[4] = v11[4];
        v10[5] = v42;
        swift_bridgeObjectRelease();
        uint64_t v43 = v12[7];
        uint64_t v44 = (char *)v10 + v43;
        uint64_t v45 = (char *)v11 + v43;
        uint64_t v46 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v47 = *(void *)(v46 - 8);
        uint64_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
        uint64_t v75 = (uint64_t)v44;
        LODWORD(v44) = v48(v44, 3LL, v46);
        int v49 = v48(v45, 3LL, v46);
        if ((_DWORD)v44)
        {
          if (v49)
          {
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v75;
LABEL_23:
            memcpy(v51, v45, v50);
            goto LABEL_26;
          }

          uint64_t v52 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v52 - 8) + 32LL))(v75, v45, v52);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v75, 0LL, 3LL, v46);
        }

        else
        {
          if (v49)
          {
            sub_100043F40(v75, &qword_1002B9A70);
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v75;
            goto LABEL_23;
          }

          uint64_t v53 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v53 - 8) + 40LL))(v75, v45, v53);
        }

uint64_t getEnumTagSinglePayload for AcknowledgeMessageRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001D8780);
}

uint64_t sub_1001D8780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 28),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for AcknowledgeMessageRequest( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001D880C);
}

uint64_t sub_1001D880C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_1000175B0(&qword_1002BA218);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 28),  a2,  a2,  v7);
  }

  return result;
}

void sub_1001D8884(uint64_t a1)
{
  v4[0] = &unk_10020E980;
  v4[1] = &unk_10020E998;
  v4[2] = &unk_10020E980;
  sub_1001D8904(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(v2 - 8) + 64LL;
    void v4[4] = &unk_10020E980;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
  }

void sub_1001D8904(uint64_t a1)
{
  if (!qword_1002BA2D0)
  {
    uint64_t v2 = type metadata accessor for ClientOverride(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1002BA2D0);
    }
  }

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

uint64_t _s15StoreKit_Shared11MessageTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t _s15StoreKit_Shared11MessageTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_1001D8A4C + 4 * byte_10020E7FA[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1001D8A80 + 4 * byte_10020E7F5[v4]))();
}

uint64_t sub_1001D8A80(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D8A88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001D8A90LL);
  }
  return result;
}

uint64_t sub_1001D8A9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001D8AA4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_1001D8AA8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D8AB0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AcknowledgeMessageRequest.CodingKeys()
{
  return &type metadata for AcknowledgeMessageRequest.CodingKeys;
}

unint64_t sub_1001D8AD0()
{
  unint64_t result = qword_1002BA310;
  if (!qword_1002BA310)
  {
    unint64_t result = swift_getWitnessTable("1L\b", &type metadata for AcknowledgeMessageRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA310);
  }

  return result;
}

unint64_t sub_1001D8B18()
{
  unint64_t result = qword_1002BA318;
  if (!qword_1002BA318)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E9C8, &type metadata for AcknowledgeMessageRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA318);
  }

  return result;
}

unint64_t sub_1001D8B60()
{
  unint64_t result = qword_1002BA320;
  if (!qword_1002BA320)
  {
    unint64_t result = swift_getWitnessTable(byte_10020E9F0, &type metadata for AcknowledgeMessageRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA320);
  }

  return result;
}

uint64_t ClientOverrideRequest.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverrideRequest(0LL) + 20);
  return sub_1001D6498(v3, a1);
}

uint64_t type metadata accessor for ClientOverrideRequest(uint64_t a1)
{
  uint64_t result = qword_1002BA3B0;
  if (!qword_1002BA3B0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ClientOverrideRequest);
  }
  return result;
}

uint64_t ClientOverrideRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ClientOverrideRequest(0LL) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientOverrideRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ClientOverrideRequest(0LL) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ClientOverrideRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverrideRequest.until.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverrideRequest(0LL) + 28);
  uint64_t v4 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t ClientOverrideRequest.init(bundleID:clientOverride:until:logKey:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  uint64_t v12 = (int *)type metadata accessor for ClientOverrideRequest(0LL);
  sub_1001D8D90(a3, (uint64_t)a7 + v12[5]);
  uint64_t v13 = (char *)a7 + v12[7];
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v13, a4, v14);
  int v16 = (void *)((char *)a7 + v12[6]);
  *int v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t sub_1001D8D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001D8DD8()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001D8E08 + 4 * byte_10020EB30[*v0]))( 0x4449656C646E7562LL,  0xE800000000000000LL);
}

uint64_t sub_1001D8E08()
{
  return 0x764F746E65696C63LL;
}

uint64_t sub_1001D8E2C()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001D8E40()
{
  return 0x6C69746E75LL;
}

uint64_t sub_1001D8E54@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001DAD64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001D8E78(uint64_t a1)
{
  unint64_t v2 = sub_1001D90B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D8EA0(uint64_t a1)
{
  unint64_t v2 = sub_1001D90B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverrideRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA328);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001D90B0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ClientOverrideRequest.CodingKeys,  &type metadata for ClientOverrideRequest.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v29 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v29, v5);
  if (!v2)
  {
    uint64_t v14 = (int *)type metadata accessor for ClientOverrideRequest(0LL);
    int v15 = (char *)v3 + v14[5];
    char v28 = 1;
    uint64_t v16 = type metadata accessor for ClientOverride(0LL);
    uint64_t v17 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v15, &v28, v5, v16, v17);
    uint64_t v18 = (uint64_t *)((char *)v3 + v14[6]);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    char v27 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v19, v20, &v27, v5);
    uint64_t v21 = (char *)v3 + v14[7];
    char v26 = 3;
    uint64_t v22 = type metadata accessor for Date(0LL);
    uint64_t v23 = sub_1000221A8( &qword_1002BA120,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v26, v5, v22, v23);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1001D90B0()
{
  unint64_t result = qword_1002BA330;
  if (!qword_1002BA330)
  {
    unint64_t result = swift_getWitnessTable(byte_10020ECF4, &type metadata for ClientOverrideRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA330);
  }

  return result;
}

uint64_t ClientOverrideRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v35 = type metadata accessor for Date(0LL);
  uint64_t v33 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v36 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = sub_1000175B0(&qword_1002BA338);
  uint64_t v7 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for ClientOverrideRequest(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_100019F58(a1, v14);
  unint64_t v15 = sub_1001D90B0();
  uint64_t v38 = v9;
  uint64_t v16 = v39;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ClientOverrideRequest.CodingKeys,  &type metadata for ClientOverrideRequest.CodingKeys,  v15,  v14,  v13);
  if (v16) {
    return sub_100019F7C(a1);
  }
  uint64_t v17 = v7;
  uint64_t v18 = a1;
  char v43 = 0;
  uint64_t v19 = v37;
  uint64_t v20 = (uint64_t)v12;
  *uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v43, v37);
  v12[1] = v21;
  uint64_t v22 = type metadata accessor for ClientOverride(0LL);
  char v42 = 1;
  uint64_t v23 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v22, &v42, v19, v22, v23);
  uint64_t v24 = v10;
  sub_1001D8D90((uint64_t)v6, v20 + *(int *)(v10 + 20));
  char v41 = 2;
  uint64_t v25 = KeyedDecodingContainer.decode(_:forKey:)(&v41, v19);
  char v26 = (uint64_t *)(v20 + *(int *)(v10 + 24));
  *char v26 = v25;
  v26[1] = v27;
  char v40 = 3;
  sub_1000221A8( &qword_1002BA130,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v28 = v19;
  uint64_t v30 = v35;
  char v29 = v36;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v35, &v40, v28, v35);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v38, v37);
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v20 + *(int *)(v24 + 28), v29, v30);
  sub_1001D9494(v20, v34);
  sub_100019F7C(v18);
  return sub_1000A77B0(v20, type metadata accessor for ClientOverrideRequest);
}

uint64_t sub_1001D9494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverrideRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001D94D8(uint64_t a1)
{
  uint64_t result = sub_1000221A8(&qword_1002BA340, type metadata accessor for ClientOverrideRequest, (uint64_t)&unk_10020EB6C);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001D9514(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA348,  type metadata accessor for ClientOverrideRequest,  (uint64_t)&protocol conformance descriptor for ClientOverrideRequest);
  uint64_t result = sub_1000221A8( &qword_1002BA350,  type metadata accessor for ClientOverrideRequest,  (uint64_t)&protocol conformance descriptor for ClientOverrideRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1001D9570@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverrideRequest.init(from:)(a1, a2);
}

uint64_t sub_1001D9584(void *a1)
{
  return ClientOverrideRequest.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverrideRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (unint64_t *)((char *)a1 + v8);
    uint64_t v10 = (unint64_t *)((char *)a2 + v8);
    uint64_t v11 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v12 = *((void *)v11 - 1);
    uint64_t v13 = *(unsigned int (**)(unint64_t *, uint64_t, int *))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1LL, v11))
    {
      uint64_t v14 = sub_1000175B0(&qword_1002BA218);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      unint64_t v16 = v10[1];
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      }

      else
      {
        unint64_t v17 = *v10;
        sub_10003AA88(*v10, v10[1]);
        *uint64_t v9 = v17;
        v9[1] = v16;
      }

      unint64_t v18 = v10[3];
      v9[2] = v10[2];
      v9[3] = v18;
      unint64_t v19 = v10[5];
      v9[4] = v10[4];
      v9[5] = v19;
      uint64_t v20 = v11[7];
      __dst = (char *)v9 + v20;
      uint64_t v21 = (char *)v10 + v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 3LL, v22))
      {
        uint64_t v24 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64LL));
      }

      else
      {
        uint64_t v25 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16LL))(__dst, v21, v25);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0LL, 3LL, v22);
      }

      uint64_t v26 = v11[8];
      uint64_t v27 = (char *)v9 + v26;
      uint64_t v28 = (char *)v10 + v26;
      *(void *)uint64_t v27 = *(void *)v28;
      v27[8] = v28[8];
      uint64_t v29 = v11[9];
      uint64_t v30 = (char *)v9 + v29;
      uint64_t v31 = (char *)v10 + v29;
      v30[8] = v31[8];
      *(void *)uint64_t v30 = *(void *)v31;
      uint64_t v32 = v11[10];
      uint64_t v33 = (char *)v9 + v32;
      uint64_t v34 = (char *)v10 + v32;
      uint64_t v35 = type metadata accessor for UUID(0LL);
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1LL, v35))
      {
        uint64_t v37 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0LL, 1LL, v35);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v12 + 56))(v9, 0LL, 1LL, v11);
    }

    uint64_t v38 = a3[6];
    uint64_t v39 = a3[7];
    char v40 = (uint64_t *)((char *)v4 + v38);
    char v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    *char v40 = *v41;
    v40[1] = v42;
    char v43 = (char *)v4 + v39;
    uint64_t v44 = (char *)a2 + v39;
    uint64_t v45 = type metadata accessor for Date(0LL);
    uint64_t v46 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16LL);
    swift_bridgeObjectRetain();
    v46(v43, v44, v45);
  }

  return v4;
}

uint64_t destroy for ClientOverrideRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v5 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48LL))(v4, 1LL, v5))
  {
    unint64_t v6 = v4[1];
    if (v6 >> 60 != 15) {
      sub_10003A9EC(*v4, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v4 + *(int *)(v5 + 28);
    uint64_t v8 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 3LL, v8))
    {
      uint64_t v9 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v7, v9);
    }

    uint64_t v10 = (char *)v4 + *(int *)(v5 + 40);
    uint64_t v11 = type metadata accessor for UUID(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
  }

  swift_bridgeObjectRelease();
  uint64_t v13 = a1 + *(int *)(a2 + 28);
  uint64_t v14 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(v13, v14);
}

void *initializeWithCopy for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(unsigned int (**)(unint64_t *, uint64_t, int *))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1LL, v10))
  {
    uint64_t v13 = sub_1000175B0(&qword_1002BA218);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    unint64_t v14 = v9[1];
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    }

    else
    {
      unint64_t v15 = *v9;
      sub_10003AA88(*v9, v9[1]);
      *uint64_t v8 = v15;
      v8[1] = v14;
    }

    unint64_t v16 = v9[3];
    __int128 v8[2] = v9[2];
    v8[3] = v16;
    unint64_t v17 = v9[5];
    v8[4] = v9[4];
    v8[5] = v17;
    uint64_t v18 = v10[7];
    __dst = (char *)v8 + v18;
    unint64_t v19 = (char *)v9 + v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 3LL, v20))
    {
      uint64_t v22 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64LL));
    }

    else
    {
      uint64_t v23 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16LL))(__dst, v19, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0LL, 3LL, v20);
    }

    uint64_t v24 = v10[8];
    uint64_t v25 = (char *)v8 + v24;
    uint64_t v26 = (char *)v9 + v24;
    *(void *)uint64_t v25 = *(void *)v26;
    v25[8] = v26[8];
    uint64_t v27 = v10[9];
    uint64_t v28 = (char *)v8 + v27;
    uint64_t v29 = (char *)v9 + v27;
    v28[8] = v29[8];
    *(void *)uint64_t v28 = *(void *)v29;
    uint64_t v30 = v10[10];
    uint64_t v31 = (char *)v8 + v30;
    uint64_t v32 = (char *)v9 + v30;
    uint64_t v33 = type metadata accessor for UUID(0LL);
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1LL, v33))
    {
      uint64_t v35 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0LL, 1LL, v33);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  uint64_t v36 = a3[6];
  uint64_t v37 = a3[7];
  uint64_t v38 = (void *)((char *)a1 + v36);
  uint64_t v39 = (void *)((char *)a2 + v36);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  char v41 = (char *)a1 + v37;
  uint64_t v42 = (char *)a2 + v37;
  uint64_t v43 = type metadata accessor for Date(0LL);
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16LL);
  swift_bridgeObjectRetain();
  v44(v41, v42, v43);
  return a1;
}

void *assignWithCopy for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v10 + 48);
  int v12 = v11(v7, 1LL, v9);
  int v13 = v11(v8, 1LL, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1000A77B0((uint64_t)v7, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v16 = v8[1];
    uint64_t v81 = a3;
    if ((unint64_t)v7[1] >> 60 == 15)
    {
      if (v16 >> 60 != 15)
      {
        uint64_t v17 = *v8;
        sub_10003AA88(*v8, v16);
        *uint64_t v7 = v17;
        v7[1] = v16;
        goto LABEL_23;
      }
    }

    else
    {
      if (v16 >> 60 != 15)
      {
        uint64_t v40 = *v8;
        sub_10003AA88(*v8, v16);
        uint64_t v41 = *v7;
        unint64_t v42 = v7[1];
        *uint64_t v7 = v40;
        v7[1] = v16;
        sub_10003A9EC(v41, v42);
LABEL_23:
        _OWORD v7[2] = v8[2];
        v7[3] = v8[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v7[4] = v8[4];
        v7[5] = v8[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v43 = v9[7];
        uint64_t v44 = (char *)v7 + v43;
        uint64_t v45 = (char *)v8 + v43;
        uint64_t v46 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v47 = *(void *)(v46 - 8);
        uint64_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
        uint64_t v79 = (uint64_t)v44;
        LODWORD(v44) = v48(v44, 3LL, v46);
        int v49 = v48(v45, 3LL, v46);
        if ((_DWORD)v44)
        {
          if (v49)
          {
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v79;
LABEL_28:
            memcpy(v51, v45, v50);
            goto LABEL_31;
          }

          uint64_t v52 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v52 - 8) + 16LL))(v79, v45, v52);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v79, 0LL, 3LL, v46);
        }

        else
        {
          if (v49)
          {
            sub_100043F40(v79, &qword_1002B9A70);
            size_t v50 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v51 = (void *)v79;
            goto LABEL_28;
          }

          uint64_t v53 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v53 - 8) + 24LL))(v79, v45, v53);
        }

_OWORD *initializeWithTake for ClientOverrideRequest(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  uint64_t v8 = (_OWORD *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1LL, v9))
  {
    uint64_t v11 = sub_1000175B0(&qword_1002BA218);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    __int128 v12 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v12;
    _OWORD v7[2] = v8[2];
    uint64_t v13 = v9[7];
    __dst = (char *)v7 + v13;
    unint64_t v14 = (char *)v8 + v13;
    uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3LL, v15))
    {
      uint64_t v17 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(__dst, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
    }

    else
    {
      uint64_t v18 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32LL))(__dst, v14, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0LL, 3LL, v15);
    }

    uint64_t v19 = v9[8];
    uint64_t v20 = (char *)v7 + v19;
    uint64_t v21 = (char *)v8 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = v9[9];
    uint64_t v23 = (char *)v7 + v22;
    uint64_t v24 = (char *)v8 + v22;
    _BYTE v23[8] = v24[8];
    *(void *)uint64_t v23 = *(void *)v24;
    uint64_t v25 = v9[10];
    uint64_t v26 = (char *)v7 + v25;
    uint64_t v27 = (char *)v8 + v25;
    uint64_t v28 = type metadata accessor for UUID(0LL);
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1LL, v28))
    {
      uint64_t v30 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0LL, 1LL, v28);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0LL, 1LL, v9);
  }

  uint64_t v31 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32LL))(v32, v33, v34);
  return a1;
}

void *assignWithTake for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  __int128 v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1LL, v10);
  int v14 = v12(v9, 1LL, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1000A77B0((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v23 = v8[1];
    uint64_t v79 = a3;
    if (v23 >> 60 != 15)
    {
      unint64_t v24 = v9[1];
      if (v24 >> 60 != 15)
      {
        uint64_t v38 = *v8;
        *uint64_t v8 = *v9;
        v8[1] = v24;
        sub_10003A9EC(v38, v23);
LABEL_18:
        uint64_t v39 = v9[3];
        __int128 v8[2] = v9[2];
        v8[3] = v39;
        swift_bridgeObjectRelease();
        uint64_t v40 = v9[5];
        v8[4] = v9[4];
        v8[5] = v40;
        swift_bridgeObjectRelease();
        uint64_t v41 = v10[7];
        unint64_t v42 = (char *)v8 + v41;
        uint64_t v43 = (char *)v9 + v41;
        uint64_t v44 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v45 = *(void *)(v44 - 8);
        uint64_t v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
        uint64_t v77 = (uint64_t)v42;
        LODWORD(v42) = v46(v42, 3LL, v44);
        int v47 = v46(v43, 3LL, v44);
        if ((_DWORD)v42)
        {
          if (v47)
          {
            size_t v48 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            int v49 = (void *)v77;
LABEL_23:
            memcpy(v49, v43, v48);
            goto LABEL_26;
          }

          uint64_t v50 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v50 - 8) + 32LL))(v77, v43, v50);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v77, 0LL, 3LL, v44);
        }

        else
        {
          if (v47)
          {
            sub_100043F40(v77, &qword_1002B9A70);
            size_t v48 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            int v49 = (void *)v77;
            goto LABEL_23;
          }

          uint64_t v51 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v51 - 8) + 40LL))(v77, v43, v51);
        }

uint64_t getEnumTagSinglePayload for ClientOverrideRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001DA9E0);
}

uint64_t sub_1001DA9E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v10 = type metadata accessor for Date(0LL);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a3 + 28);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }

uint64_t storeEnumTagSinglePayload for ClientOverrideRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001DAA90);
}

uint64_t sub_1001DAA90(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v10 = type metadata accessor for Date(0LL);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 28);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }

  return result;
}

void sub_1001DAB30(uint64_t a1)
{
  v6[0] = &unk_10020EC18;
  sub_1001D8904(319LL);
  if (v3 <= 0x3F)
  {
    v6[1] = *(void *)(v2 - 8) + 64LL;
    _OWORD v6[2] = &unk_10020EC18;
    uint64_t v4 = type metadata accessor for Date(319LL);
    if (v5 <= 0x3F)
    {
      v6[3] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 4LL, v6, a1 + 16);
    }
  }

uint64_t storeEnumTagSinglePayload for ClientOverrideRequest.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001DAC0C + 4 * byte_10020EB39[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001DAC40 + 4 * byte_10020EB34[v4]))();
}

uint64_t sub_1001DAC40(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001DAC48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001DAC50LL);
  }
  return result;
}

uint64_t sub_1001DAC5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001DAC64LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001DAC68(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001DAC70(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClientOverrideRequest.CodingKeys()
{
  return &type metadata for ClientOverrideRequest.CodingKeys;
}

unint64_t sub_1001DAC90()
{
  unint64_t result = qword_1002BA3F0;
  if (!qword_1002BA3F0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020ECCC, &type metadata for ClientOverrideRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA3F0);
  }

  return result;
}

unint64_t sub_1001DACD8()
{
  unint64_t result = qword_1002BA3F8;
  if (!qword_1002BA3F8)
  {
    unint64_t result = swift_getWitnessTable("5L\b", &type metadata for ClientOverrideRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA3F8);
  }

  return result;
}

unint64_t sub_1001DAD20()
{
  unint64_t result = qword_1002BA400;
  if (!qword_1002BA400)
  {
    unint64_t result = swift_getWitnessTable(byte_10020EC64, &type metadata for ClientOverrideRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA400);
  }

  return result;
}

uint64_t sub_1001DAD64(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x4449656C646E7562LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v5 = 0xE800000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4449656C646E7562LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v7 = 0xEE00656469727265LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x6C69746E75LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease(0xE500000000000000LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6C69746E75LL, 0xE500000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_1001DAF30()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001DAF64 + 4 * byte_10020ED50[*v0]))( 0x6C7561666544736FLL,  0xE900000000000074LL);
}

uint64_t sub_1001DAF64()
{
  return 1684099177LL;
}

uint64_t sub_1001DAF74()
{
  return 0x656E6F685069LL;
}

uint64_t sub_1001DAF88()
{
  return 6513005LL;
}

uint64_t sub_1001DAF98()
{
  return 0x7974696C616572LL;
}

uint64_t sub_1001DAFB0()
{
  return 30324LL;
}

uint64_t sub_1001DAFBC()
{
  return 0x6863746177LL;
}

uint64_t sub_1001DAFD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001DDA68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001DAFF4(uint64_t a1)
{
  unint64_t v2 = sub_1001DB700();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB01C(uint64_t a1)
{
  unint64_t v2 = sub_1001DB700();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB044(uint64_t a1)
{
  unint64_t v2 = sub_1001DB898();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB06C(uint64_t a1)
{
  unint64_t v2 = sub_1001DB898();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB094(uint64_t a1)
{
  unint64_t v2 = sub_1001DB854();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB0BC(uint64_t a1)
{
  unint64_t v2 = sub_1001DB854();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB0E4(uint64_t a1)
{
  unint64_t v2 = sub_1001DB810();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB10C(uint64_t a1)
{
  unint64_t v2 = sub_1001DB810();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB134(uint64_t a1)
{
  unint64_t v2 = sub_1001DB8DC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB15C(uint64_t a1)
{
  unint64_t v2 = sub_1001DB8DC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB184(uint64_t a1)
{
  unint64_t v2 = sub_1001DB7CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB1AC(uint64_t a1)
{
  unint64_t v2 = sub_1001DB7CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB1D4(uint64_t a1)
{
  unint64_t v2 = sub_1001DB788();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB1FC(uint64_t a1)
{
  unint64_t v2 = sub_1001DB788();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DB224(uint64_t a1)
{
  unint64_t v2 = sub_1001DB744();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DB24C(uint64_t a1)
{
  unint64_t v2 = sub_1001DB744();
  return CodingKey.debugDescription.getter(a1, v2);
}

void ProductRequest.Platform.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA408);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002BA410);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  __chkstk_darwin(v5);
  uint64_t v29 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002BA418);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  __chkstk_darwin(v7);
  uint64_t v26 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002BA420);
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  __chkstk_darwin(v9);
  unint64_t v23 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_1000175B0(&qword_1002BA428);
  uint64_t v21 = *(void *)(v11 - 8);
  uint64_t v22 = v11;
  __chkstk_darwin(v11);
  uint64_t v20 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_1000175B0(&qword_1002BA430);
  __chkstk_darwin(v19);
  uint64_t v13 = sub_1000175B0(&qword_1002BA438);
  __chkstk_darwin(v13);
  uint64_t v14 = sub_1000175B0(&qword_1002BA440);
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v37 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  sub_100019F58(a1, v16);
  unint64_t v17 = sub_1001DB700();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductRequest.Platform.CodingKeys,  &type metadata for ProductRequest.Platform.CodingKeys,  v17,  v16,  v15);
  __asm { BR              X10 }

uint64_t sub_1001DB4E8()
{
  *(_BYTE *)(v4 - 71) = 0;
  sub_1001DB8DC();
  uint64_t v5 = *(void *)(v4 - 96);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.Platform.OsDefaultCodingKeys,  v4 - 71,  v5,  &type metadata for ProductRequest.Platform.OsDefaultCodingKeys);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v3, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 104) + 8LL))(v1, v5);
}

unint64_t sub_1001DB700()
{
  unint64_t result = qword_1002BA448;
  if (!qword_1002BA448)
  {
    unint64_t result = swift_getWitnessTable(")@\b", &type metadata for ProductRequest.Platform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA448);
  }

  return result;
}

unint64_t sub_1001DB744()
{
  unint64_t result = qword_1002BA450;
  if (!qword_1002BA450)
  {
    unint64_t result = swift_getWitnessTable("y@\b", &type metadata for ProductRequest.Platform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA450);
  }

  return result;
}

unint64_t sub_1001DB788()
{
  unint64_t result = qword_1002BA458;
  if (!qword_1002BA458)
  {
    unint64_t result = swift_getWitnessTable(byte_100210108, &type metadata for ProductRequest.Platform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA458);
  }

  return result;
}

unint64_t sub_1001DB7CC()
{
  unint64_t result = qword_1002BA460;
  if (!qword_1002BA460)
  {
    unint64_t result = swift_getWitnessTable(byte_1002100B8, &type metadata for ProductRequest.Platform.RealityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA460);
  }

  return result;
}

unint64_t sub_1001DB810()
{
  unint64_t result = qword_1002BA468;
  if (!qword_1002BA468)
  {
    unint64_t result = swift_getWitnessTable("iA\b", &type metadata for ProductRequest.Platform.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA468);
  }

  return result;
}

unint64_t sub_1001DB854()
{
  unint64_t result = qword_1002BA470;
  if (!qword_1002BA470)
  {
    unint64_t result = swift_getWitnessTable(byte_100210018, &type metadata for ProductRequest.Platform.IPhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA470);
  }

  return result;
}

unint64_t sub_1001DB898()
{
  unint64_t result = qword_1002BA478;
  if (!qword_1002BA478)
  {
    unint64_t result = swift_getWitnessTable("\tB\b", &type metadata for ProductRequest.Platform.IPadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA478);
  }

  return result;
}

unint64_t sub_1001DB8DC()
{
  unint64_t result = qword_1002BA480;
  if (!qword_1002BA480)
  {
    unint64_t result = swift_getWitnessTable("YB\b", &type metadata for ProductRequest.Platform.OsDefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA480);
  }

  return result;
}

uint64_t ProductRequest.Platform.init(from:)(void *a1)
{
  return sub_1001DDD10(a1);
}

uint64_t sub_1001DB938@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001DDD10(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_1001DB960(void *a1)
{
}

unint64_t sub_1001DB978()
{
  uint64_t v1 = 0x654D79636167656CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x495041616964656DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000019LL;
  }
}

uint64_t sub_1001DB9E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001DE438(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001DBA08(uint64_t a1)
{
  unint64_t v2 = sub_1001DE328();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBA30(uint64_t a1)
{
  unint64_t v2 = sub_1001DE328();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DBA58(uint64_t a1)
{
  unint64_t v2 = sub_1001DE3F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBA80(uint64_t a1)
{
  unint64_t v2 = sub_1001DE3F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DBAA8(uint64_t a1)
{
  unint64_t v2 = sub_1001DE3B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBAD0(uint64_t a1)
{
  unint64_t v2 = sub_1001DE3B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DBAF8(uint64_t a1)
{
  unint64_t v2 = sub_1001DE36C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBB20(uint64_t a1)
{
  unint64_t v2 = sub_1001DE36C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.RequestKind.encode(to:)(void *a1, int a2)
{
  int v27 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA488);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  __chkstk_darwin(v3);
  unint64_t v23 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002BA490);
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_1000175B0(&qword_1002BA498);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_1000175B0(&qword_1002BA4A0);
  uint64_t v26 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  sub_100019F58(a1, v16);
  unint64_t v17 = sub_1001DE328();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductRequest.RequestKind.CodingKeys,  &type metadata for ProductRequest.RequestKind.CodingKeys,  v17,  v16,  v15);
  if ((_BYTE)v27)
  {
    if (v27 == 1)
    {
      char v29 = 1;
      sub_1001DE3B0();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys,  &v29,  v12,  &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
    }

    else
    {
      char v30 = 2;
      sub_1001DE36C();
      uint64_t v18 = v23;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys,  &v30,  v12,  &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v25);
    }
  }

  else
  {
    char v28 = 0;
    sub_1001DE3F4();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys,  &v28,  v12,  &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
}

void *ProductRequest.RequestKind.init(from:)(void *a1)
{
  return sub_1001DE5AC(a1);
}

void *sub_1001DBDC0@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001DE5AC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1001DBDE8(void *a1)
{
  return ProductRequest.RequestKind.encode(to:)(a1, *v1);
}

uint64_t sub_1001DBE00()
{
  if (*v0) {
    return 0xD000000000000012LL;
  }
  else {
    return 0x73746375646F7270LL;
  }
}

uint64_t sub_1001DBE40@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001DEA50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001DBE64(uint64_t a1)
{
  unint64_t v2 = sub_1001DE984();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBE8C(uint64_t a1)
{
  unint64_t v2 = sub_1001DE984();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DBEB8()
{
  return 7554121LL;
}

uint64_t sub_1001DBECC(uint64_t a1)
{
  unint64_t v2 = sub_1001DEA0C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBEF4(uint64_t a1)
{
  unint64_t v2 = sub_1001DEA0C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DBF1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  if (a1 == 7554121 && a2 == 0xE300000000000000LL)
  {
    uint64_t result = swift_bridgeObjectRelease(0xE300000000000000LL);
    char v8 = 0;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(7554121LL, 0xE300000000000000LL, a1, a2, 0LL);
    uint64_t result = swift_bridgeObjectRelease(a2);
    char v8 = v6 ^ 1;
  }

  *a3 = v8 & 1;
  return result;
}

uint64_t sub_1001DBFA0(uint64_t a1)
{
  unint64_t v2 = sub_1001DE9C8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DBFC8(uint64_t a1)
{
  unint64_t v2 = sub_1001DE9C8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.IdentifierKind.encode(to:)(void *a1, uint64_t a2, int a3)
{
  int v27 = a3;
  uint64_t v25 = a2;
  uint64_t v4 = sub_1000175B0(&qword_1002BA4C8);
  uint64_t v24 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002BA4D0);
  uint64_t v23 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_1000175B0(&qword_1002BA4D8);
  uint64_t v26 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_100019F58(a1, v14);
  unint64_t v15 = sub_1001DE984();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductRequest.IdentifierKind.CodingKeys,  &type metadata for ProductRequest.IdentifierKind.CodingKeys,  v15,  v14,  v13);
  if ((v27 & 1) != 0)
  {
    LOBYTE(v28) = 1;
    sub_1001DE9C8();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys,  &v28,  v10,  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    uint64_t v28 = v25;
    uint64_t v19 = sub_1000175B0(&qword_1002BA200);
    uint64_t v20 = sub_1001E24B0( &qword_1002BA4F0,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, v21, v4, v19, v20);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
  }

  else
  {
    LOBYTE(v28) = 0;
    sub_1001DEA0C();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys,  &v28,  v10,  &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    uint64_t v28 = v25;
    uint64_t v16 = sub_1000175B0(&qword_1002BA200);
    uint64_t v17 = sub_1001E24B0( &qword_1002BA4F0,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, v18, v7, v16, v17);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v7);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v12, v10);
}

void *ProductRequest.IdentifierKind.init(from:)(void *a1)
{
  uint64_t result = sub_1001DEB3C(a1);
  if (v1) {
    return (void *)v3;
  }
  return result;
}

void *sub_1001DC2A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1001DEB3C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5 & 1;
  }

  return result;
}

uint64_t sub_1001DC2D4(void *a1)
{
  return ProductRequest.IdentifierKind.encode(to:)(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

void *static ProductRequest.IncludedResource.all.getter()
{
  uint64_t v3 = &_swiftEmptySetSingleton;
  sub_1001DD11C(&v2, 0);
  sub_1001DD11C(&v1, 1);
  return v3;
}

_UNKNOWN **static ProductRequest.IncludedResource.allCases.getter()
{
  return &off_100292180;
}

uint64_t sub_1001DC34C()
{
  if (*v0) {
    return 0x4F6B6361426E6977LL;
  }
  else {
    return 0xD000000000000011LL;
  }
}

uint64_t sub_1001DC398@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001DF05C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001DC3BC(uint64_t a1)
{
  unint64_t v2 = sub_1001DEF90();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DC3E4(uint64_t a1)
{
  unint64_t v2 = sub_1001DEF90();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DC40C(uint64_t a1)
{
  unint64_t v2 = sub_1001DF018();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DC434(uint64_t a1)
{
  unint64_t v2 = sub_1001DF018();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001DC45C(uint64_t a1)
{
  unint64_t v2 = sub_1001DEFD4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DC484(uint64_t a1)
{
  unint64_t v2 = sub_1001DEFD4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.IncludedResource.encode(to:)(void *a1, int a2)
{
  int v20 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA500);
  uint64_t v18 = *(void *)(v3 - 8);
  uint64_t v19 = v3;
  __chkstk_darwin(v3);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_1000175B0(&qword_1002BA508);
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002BA510);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_100019F58(a1, v13);
  unint64_t v15 = sub_1001DEF90();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductRequest.IncludedResource.CodingKeys,  &type metadata for ProductRequest.IncludedResource.CodingKeys,  v15,  v13,  v14);
  if ((v20 & 1) != 0)
  {
    char v22 = 1;
    sub_1001DEFD4();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys,  &v22,  v9,  &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
  }

  else
  {
    char v21 = 0;
    sub_1001DF018();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys,  &v21,  v9,  &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t ProductRequest.IncludedResource.init(from:)(void *a1)
{
  return sub_1001DF16C(a1) & 1;
}

uint64_t sub_1001DC694@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001DF16C(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1001DC6C0(void *a1)
{
  return ProductRequest.IncludedResource.encode(to:)(a1, *v1);
}

void sub_1001DC6D8(void *a1@<X8>)
{
  *a1 = &off_1002921A8;
}

uint64_t PurchaseIntentRequest.Remove.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1001D6498(v1, a1);
}

uint64_t ProductRequest.identifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ProductRequest(0LL) + 20));
  uint64_t v2 = *v1;
  ChannelOptions.Storage._storage.getter(*v1, *((unsigned __int8 *)v1 + 8));
  return v2;
}

uint64_t ProductRequest.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProductRequest(0LL) + 24));
}

uint64_t ProductRequest.includedResources.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ProductRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ProductRequest(0LL) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProductRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + *(int *)(type metadata accessor for ProductRequest(0LL) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *char v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ProductRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ProductRequest.platform.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProductRequest(0LL) + 36));
}

int *ProductRequest.init(identifier:kind:resources:logKey:platform:clientOverride:)@<X0>( uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t result = (int *)type metadata accessor for ProductRequest(0LL);
  uint64_t v18 = a9 + result[5];
  *(void *)uint64_t v18 = a1;
  *(_BYTE *)(v18 + 8) = a2 & 1;
  *(_BYTE *)(a9 + result[6]) = a3;
  *(void *)(a9 + result[7]) = a4;
  uint64_t v19 = (void *)(a9 + result[8]);
  *uint64_t v19 = a5;
  v19[1] = a6;
  *(_BYTE *)(a9 + result[9]) = a7;
  return result;
}

uint64_t sub_1001DC8DC()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001DC918 + 4 * byte_10020ED5E[*v0]))( 0x764F746E65696C63LL,  0xEE00656469727265LL);
}

uint64_t sub_1001DC918()
{
  return 0x696669746E656469LL;
}

uint64_t sub_1001DC934()
{
  return 1684957547LL;
}

unint64_t sub_1001DC944()
{
  return 0xD000000000000011LL;
}

uint64_t sub_1001DC960()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001DC974()
{
  return 0x6D726F6674616C70LL;
}

uint64_t sub_1001DC98C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001E2220(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001DC9B0(uint64_t a1)
{
  unint64_t v2 = sub_1001DF4D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001DC9D8(uint64_t a1)
{
  unint64_t v2 = sub_1001DF4D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA530);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001DF4D4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ProductRequest.CodingKeys,  &type metadata for ProductRequest.CodingKeys,  v11,  v9,  v10);
  LOBYTE(v28) = 0;
  uint64_t v12 = type metadata accessor for ClientOverride(0LL);
  uint64_t v13 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v3, &v28, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = (int *)type metadata accessor for ProductRequest(0LL);
    unint64_t v15 = (uint64_t *)(v3 + v14[5]);
    uint64_t v16 = *v15;
    LOBYTE(v15) = *((_BYTE *)v15 + 8);
    uint64_t v28 = v16;
    char v29 = (char)v15;
    char v27 = 1;
    unint64_t v17 = sub_1001DF518();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v27, v5, &type metadata for ProductRequest.IdentifierKind, v17);
    LOBYTE(v28) = *(_BYTE *)(v3 + v14[6]);
    char v27 = 2;
    unint64_t v18 = sub_1001DF55C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v27, v5, &type metadata for ProductRequest.RequestKind, v18);
    uint64_t v28 = *(void *)(v3 + v14[7]);
    char v27 = 3;
    uint64_t v19 = sub_1000175B0(&qword_1002BA550);
    uint64_t v20 = sub_1001DF6B4( &qword_1002BA558,  (uint64_t (*)(void))sub_1001DF5A0,  (const char *)&protocol conformance descriptor for <> Set<A>);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v27, v5, v19, v20);
    char v21 = (uint64_t *)(v3 + v14[8]);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    LOBYTE(v28) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v22, v23, &v28, v5);
    LOBYTE(v28) = *(_BYTE *)(v3 + v14[9]);
    char v27 = 5;
    unint64_t v24 = sub_1001DF5E4();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v27, v5, &type metadata for ProductRequest.Platform, v24);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ProductRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = sub_1000175B0(&qword_1002BA570);
  uint64_t v7 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (int *)type metadata accessor for ProductRequest(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  char v30 = a1;
  sub_100019F58(a1, v14);
  unint64_t v15 = sub_1001DF4D4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductRequest.CodingKeys,  &type metadata for ProductRequest.CodingKeys,  v15,  v14,  v13);
  if (v2) {
    return sub_100019F7C(v30);
  }
  uint64_t v16 = v7;
  uint64_t v17 = type metadata accessor for ClientOverride(0LL);
  LOBYTE(v31) = 0;
  uint64_t v18 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  uint64_t v19 = v29;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v17, &v31, v29, v17, v18);
  sub_1001D8D90((uint64_t)v6, (uint64_t)v12);
  char v33 = 1;
  sub_1001DF62C();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for ProductRequest.IdentifierKind,  &v33,  v19,  &type metadata for ProductRequest.IdentifierKind);
  char v20 = v32;
  char v21 = &v12[v10[5]];
  *(void *)char v21 = v31;
  _BYTE v21[8] = v20;
  char v33 = 2;
  sub_1001DF670();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for ProductRequest.RequestKind,  &v33,  v19,  &type metadata for ProductRequest.RequestKind);
  v12[v10[6]] = v31;
  uint64_t v22 = sub_1000175B0(&qword_1002BA550);
  char v33 = 3;
  sub_1001DF6B4( &qword_1002BA588,  (uint64_t (*)(void))sub_1001DF71C,  (const char *)&protocol conformance descriptor for <> Set<A>);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v22, &v33, v19, v22);
  *(void *)&v12[v10[7]] = v31;
  LOBYTE(v31) = 4;
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)(&v31, v19);
  unint64_t v24 = (uint64_t *)&v12[v10[8]];
  *unint64_t v24 = v23;
  v24[1] = v25;
  char v33 = 5;
  sub_1001DF760();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for ProductRequest.Platform,  &v33,  v19,  &type metadata for ProductRequest.Platform);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v19);
  v12[v10[9]] = v31;
  sub_1001DF7A4((uint64_t)v12, v28);
  sub_100019F7C(v30);
  return sub_1000A77B0((uint64_t)v12, type metadata accessor for ProductRequest);
}

uint64_t sub_1001DD0F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProductRequest.init(from:)(a1, a2);
}

uint64_t sub_1001DD108(void *a1)
{
  return ProductRequest.encode(to:)(a1);
}

uint64_t sub_1001DD11C(_BYTE *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = a2 & 1;
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v15);
  Hasher._combine(_:)(a2 & 1);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v15[0] = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_1001DD4FC(v6, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v15[0];
    swift_bridgeObjectRelease();
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

Swift::Int sub_1001DD254(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_1000175B0(&qword_1002BA800);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  Swift::Int v6 = result;
  if (*(void *)(v3 + 16))
  {
    uint64_t v29 = v2;
    int64_t v7 = 0LL;
    Swift::Int v8 = (void *)(v3 + 56);
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
                  *Swift::Int v8 = -1LL << v28;
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

uint64_t sub_1001DD4FC(uint64_t result, unint64_t a2, char a3)
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
    sub_1001DD254(v8);
  }

  else
  {
    if (v7 > v6)
    {
      Swift::Int result = (uint64_t)sub_1001DD660();
      goto LABEL_14;
    }

    sub_1001DD7F0(v8);
  }

  uint64_t v9 = *v3;
  Hasher.init(_seed:)(v17);
  Hasher._combine(_:)(v5);
  Swift::Int result = Hasher._finalize()();
  uint64_t v10 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 48);
    if (((((_DWORD)v5 == 0) ^ *(unsigned __int8 *)(v11 + a2)) & 1) != 0)
    {
LABEL_13:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for ProductRequest.IncludedResource);
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

void *sub_1001DD660()
{
  uint64_t v1 = v0;
  sub_1000175B0(&qword_1002BA800);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
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

uint64_t sub_1001DD7F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_1000175B0(&qword_1002BA800);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = result;
  if (!*(void *)(v3 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v28 = v2;
  int64_t v7 = 0LL;
  uint64_t v8 = v3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = result + 56;
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

uint64_t sub_1001DDA68(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6C7561666544736FLL && a2 == 0xE900000000000074LL)
  {
    unint64_t v5 = 0xE900000000000074LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C7561666544736FLL, 0xE900000000000074LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 1684099177 && a2 == 0xE400000000000000LL)
  {
    unint64_t v7 = 0xE400000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684099177LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x656E6F685069LL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656E6F685069LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 6513005 && a2 == 0xE300000000000000LL)
  {
    unint64_t v9 = 0xE300000000000000LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(6513005LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x7974696C616572LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v10 = 0xE700000000000000LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7974696C616572LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 30324 && a2 == 0xE200000000000000LL)
  {
    unint64_t v11 = 0xE200000000000000LL;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(30324LL, 0xE200000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_38;
  }

  if (a1 == 0x6863746177LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease(0xE500000000000000LL);
    return 6LL;
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6863746177LL, 0xE500000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v12 & 1) != 0) {
      return 6LL;
    }
    else {
      return 7LL;
    }
  }

uint64_t sub_1001DDD10(void *a1)
{
  uint64_t v33 = sub_1000175B0(&qword_1002BA848);
  v32[7] = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v39 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_1000175B0(&qword_1002BA850);
  v32[12] = *(void *)(v3 - 8);
  v32[13] = v3;
  __chkstk_darwin(v3);
  uint64_t v38 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000175B0(&qword_1002BA858);
  v32[10] = *(void *)(v5 - 8);
  v32[11] = v5;
  __chkstk_darwin(v5);
  uint64_t v36 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002BA860);
  _BYTE v32[8] = *(void *)(v7 - 8);
  v32[9] = v7;
  __chkstk_darwin(v7);
  uint64_t v37 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002BA868);
  v32[5] = *(void *)(v9 - 8);
  v32[6] = v9;
  __chkstk_darwin(v9);
  uint64_t v35 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_1000175B0(&qword_1002BA870);
  v32[3] = *(void *)(v11 - 8);
  v32[4] = v11;
  __chkstk_darwin(v11);
  uint64_t v34 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_1000175B0(&qword_1002BA878);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_1000175B0(&qword_1002BA880);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  Swift::UInt v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = a1[3];
  uint64_t v22 = a1[4];
  uint64_t v40 = a1;
  sub_100019F58(a1, v21);
  unint64_t v23 = sub_1001DB700();
  uint64_t v24 = v41;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductRequest.Platform.CodingKeys,  &type metadata for ProductRequest.Platform.CodingKeys,  v23,  v21,  v22);
  if (!v24)
  {
    v32[2] = v16;
    v32[0] = v14;
    v32[1] = v13;
    uint64_t v41 = v18;
    uint64_t v25 = KeyedDecodingContainer.allKeys.getter(v17);
    if (*(void *)(v25 + 16) == 1LL) {
      __asm { BR              X9 }
    }

    uint64_t v26 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v26, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v28 = v27;
    sub_1000175B0(&qword_1002B9F80);
    *uint64_t v28 = &type metadata for ProductRequest.Platform;
    uint64_t v29 = KeyedDecodingContainer.codingPath.getter(v17);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v29,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v30 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104LL))( v28,  enum case for DecodingError.typeMismatch(_:),  v26);
    swift_willThrow(v30);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v17);
  }

  return sub_100019F7C(v40);
}

unint64_t sub_1001DE328()
{
  unint64_t result = qword_1002BA4A8;
  if (!qword_1002BA4A8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FF28, &type metadata for ProductRequest.RequestKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4A8);
  }

  return result;
}

unint64_t sub_1001DE36C()
{
  unint64_t result = qword_1002BA4B0;
  if (!qword_1002BA4B0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FED8, &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4B0);
  }

  return result;
}

unint64_t sub_1001DE3B0()
{
  unint64_t result = qword_1002BA4B8;
  if (!qword_1002BA4B8)
  {
    unint64_t result = swift_getWitnessTable("IC\b", &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4B8);
  }

  return result;
}

unint64_t sub_1001DE3F4()
{
  unint64_t result = qword_1002BA4C0;
  if (!qword_1002BA4C0)
  {
    unint64_t result = swift_getWitnessTable( byte_10020FE38,  &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4C0);
  }

  return result;
}

uint64_t sub_1001DE438(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000019LL)
  {
    unint64_t v4 = 0x8000000100222CB0LL;
    if (a2 == 0x8000000100222CB0LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019LL, 0x8000000100222CB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x654D79636167656CLL && a2 == 0xEE00495041616964LL)
  {
    unint64_t v6 = 0xEE00495041616964LL;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x654D79636167656CLL, 0xEE00495041616964LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
    goto LABEL_11;
  }

  if (a1 == 0x495041616964656DLL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 2LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x495041616964656DLL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

void *sub_1001DE5AC(void *a1)
{
  uint64_t v32 = sub_1000175B0(&qword_1002BA828);
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_1000175B0(&qword_1002BA830);
  uint64_t v28 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = sub_1000175B0(&qword_1002BA838);
  uint64_t v4 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  unint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002BA840);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_100019F58(a1, v11);
  unint64_t v13 = sub_1001DE328();
  uint64_t v14 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductRequest.RequestKind.CodingKeys,  &type metadata for ProductRequest.RequestKind.CodingKeys,  v13,  v11,  v12);
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v26 = v4;
  uint64_t v27 = v8;
  uint64_t v15 = v34;
  uint64_t v35 = a1;
  unint64_t v16 = v10;
  uint64_t v17 = KeyedDecodingContainer.allKeys.getter(v7);
  uint64_t v18 = v7;
  if (*(void *)(v17 + 16) != 1LL)
  {
    uint64_t v21 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v21, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v10 = v22;
    sub_1000175B0(&qword_1002B9F80);
    *uint64_t v10 = &type metadata for ProductRequest.RequestKind;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter(v7);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v23,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v24 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104LL))( v10,  enum case for DecodingError.typeMismatch(_:),  v21);
    swift_willThrow(v24);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v27 + 8))(v16, v7);
    a1 = v35;
LABEL_7:
    sub_100019F7C(a1);
    return v10;
  }

  uint64_t v10 = (void *)*(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      char v37 = 1;
      sub_1001DE3B0();
      uint64_t v19 = v33;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys,  &v37,  v7,  &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys);
      uint64_t v20 = v27;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v31);
    }

    else
    {
      char v38 = 2;
      sub_1001DE36C();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys,  &v38,  v7,  &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys);
      uint64_t v20 = v27;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v32);
    }

    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v18);
  }

  else
  {
    char v36 = 0;
    sub_1001DE3F4();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys,  &v36,  v7,  &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v27 + 8))(v16, v7);
  }

  sub_100019F7C(v35);
  return v10;
}

unint64_t sub_1001DE984()
{
  unint64_t result = qword_1002BA4E0;
  if (!qword_1002BA4E0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FDE8, &type metadata for ProductRequest.IdentifierKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4E0);
  }

  return result;
}

unint64_t sub_1001DE9C8()
{
  unint64_t result = qword_1002BA4E8;
  if (!qword_1002BA4E8)
  {
    unint64_t result = swift_getWitnessTable( "9D\b",  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4E8);
  }

  return result;
}

unint64_t sub_1001DEA0C()
{
  unint64_t result = qword_1002BA4F8;
  if (!qword_1002BA4F8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FD48, &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA4F8);
  }

  return result;
}

uint64_t sub_1001DEA50(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x73746375646F7270LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v5 = 0xE800000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73746375646F7270LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000012LL && a2 == 0x80000001002178A0LL)
  {
    swift_bridgeObjectRelease(0x80000001002178A0LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x80000001002178A0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

void *sub_1001DEB3C(void *a1)
{
  uint64_t v36 = sub_1000175B0(&qword_1002BA808);
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_1000175B0(&qword_1002BA810);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000175B0(&qword_1002BA818);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  char v37 = a1;
  unint64_t v13 = sub_100019F58(a1, v11);
  unint64_t v14 = sub_1001DE984();
  uint64_t v15 = v38;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductRequest.IdentifierKind.CodingKeys,  &type metadata for ProductRequest.IdentifierKind.CodingKeys,  v14,  v11,  v12);
  if (v15) {
    goto LABEL_6;
  }
  uint64_t v33 = v4;
  unint64_t v16 = v35;
  uint64_t v17 = v36;
  uint64_t v38 = v8;
  uint64_t v18 = KeyedDecodingContainer.allKeys.getter(v7);
  if (*(void *)(v18 + 16) != 1LL)
  {
    uint64_t v20 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v20, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v22 = v21;
    sub_1000175B0(&qword_1002B9F80);
    *uint64_t v22 = &type metadata for ProductRequest.IdentifierKind;
    unint64_t v13 = v10;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter(v7);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v23,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v24 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104LL))( v22,  enum case for DecodingError.typeMismatch(_:),  v20);
    swift_willThrow(v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v7);
LABEL_6:
    sub_100019F7C(v37);
    return v13;
  }

  uint64_t v32 = v7;
  if ((*(_BYTE *)(v18 + 32) & 1) != 0)
  {
    LOBYTE(sub_1001B968C(v5, v6, v7, v8, v9, v10, v11, v12, v30, (uint64_t)v33, v37, v39) = 1;
    sub_1001DE9C8();
    uint64_t v19 = v32;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys,  &v39,  v32,  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    uint64_t v26 = sub_1000175B0(&qword_1002BA200);
    sub_1001E24B0( &qword_1002BA820,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v26, v27, v17, v26);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v17);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v19);
  }

  else
  {
    LOBYTE(sub_1001B968C(v5, v6, v7, v8, v9, v10, v11, v12, v30, (uint64_t)v33, v37, v39) = 0;
    sub_1001DEA0C();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys,  &v39,  v32,  &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    uint64_t v28 = sub_1000175B0(&qword_1002BA200);
    sub_1001E24B0( &qword_1002BA820,  (uint64_t)&protocol witness table for String,  (const char *)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v28, v29, v3, v28);
    uint64_t v30 = v38;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v32);
  }

  unint64_t v13 = v39;
  sub_100019F7C(v37);
  return v13;
}

unint64_t sub_1001DEF90()
{
  unint64_t result = qword_1002BA518;
  if (!qword_1002BA518)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FCF8, &type metadata for ProductRequest.IncludedResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA518);
  }

  return result;
}

unint64_t sub_1001DEFD4()
{
  unint64_t result = qword_1002BA520;
  if (!qword_1002BA520)
  {
    unint64_t result = swift_getWitnessTable(")E\b", &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA520);
  }

  return result;
}

unint64_t sub_1001DF018()
{
  unint64_t result = qword_1002BA528;
  if (!qword_1002BA528)
  {
    unint64_t result = swift_getWitnessTable( "yE\b",  &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA528);
  }

  return result;
}

uint64_t sub_1001DF05C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v4 = 0x8000000100222CD0LL;
    if (a2 == 0x8000000100222CD0LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100222CD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x4F6B6361426E6977LL && a2 == 0xED00007372656666LL)
  {
    swift_bridgeObjectRelease(0xED00007372656666LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x4F6B6361426E6977LL, 0xED00007372656666LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1001DF16C(void *a1)
{
  uint64_t v29 = sub_1000175B0(&qword_1002BA7E8);
  uint64_t v27 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v30 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = sub_1000175B0(&qword_1002BA7F0);
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000175B0(&qword_1002BA7F8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100019F58(a1, v10);
  unint64_t v12 = sub_1001DEF90();
  uint64_t v13 = v31;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ProductRequest.IncludedResource.CodingKeys,  &type metadata for ProductRequest.IncludedResource.CodingKeys,  v12,  v10,  v11);
  if (v13) {
    goto LABEL_7;
  }
  unint64_t v14 = v5;
  uint64_t v15 = v30;
  uint64_t v26 = a1;
  uint64_t v31 = v7;
  uint64_t v16 = KeyedDecodingContainer.allKeys.getter(v6);
  uint64_t v17 = v6;
  if (*(void *)(v16 + 16) != 1LL)
  {
    uint64_t v19 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v19, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v20 = v9;
    uint64_t v22 = v21;
    sub_1000175B0(&qword_1002B9F80);
    *uint64_t v22 = &type metadata for ProductRequest.IncludedResource;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter(v6);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v23,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v24 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104LL))( v22,  enum case for DecodingError.typeMismatch(_:),  v19);
    swift_willThrow(v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v6);
    a1 = v26;
LABEL_7:
    sub_100019F7C(a1);
    return v6;
  }

  uint64_t v6 = *(unsigned __int8 *)(v16 + 32);
  if ((v6 & 1) != 0)
  {
    char v33 = 1;
    sub_1001DEFD4();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys,  &v33,  v17,  &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys);
    uint64_t v18 = v31;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v29);
  }

  else
  {
    char v32 = 0;
    sub_1001DF018();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys,  &v32,  v17,  &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys);
    uint64_t v18 = v31;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v28);
  }

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v17);
  sub_100019F7C(v26);
  return v6;
}

uint64_t type metadata accessor for ProductRequest(uint64_t a1)
{
  uint64_t result = qword_1002BA638;
  if (!qword_1002BA638) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ProductRequest);
  }
  return result;
}

unint64_t sub_1001DF4D4()
{
  unint64_t result = qword_1002BA538;
  if (!qword_1002BA538)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FC08, &type metadata for ProductRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA538);
  }

  return result;
}

unint64_t sub_1001DF518()
{
  unint64_t result = qword_1002BA540;
  if (!qword_1002BA540)
  {
    unint64_t result = swift_getWitnessTable(")R\b", &type metadata for ProductRequest.IdentifierKind);
    atomic_store(result, (unint64_t *)&qword_1002BA540);
  }

  return result;
}

unint64_t sub_1001DF55C()
{
  unint64_t result = qword_1002BA548;
  if (!qword_1002BA548)
  {
    unint64_t result = swift_getWitnessTable("yR\b", &type metadata for ProductRequest.RequestKind);
    atomic_store(result, (unint64_t *)&qword_1002BA548);
  }

  return result;
}

unint64_t sub_1001DF5A0()
{
  unint64_t result = qword_1002BA560;
  if (!qword_1002BA560)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductRequest.IncludedResource,  &type metadata for ProductRequest.IncludedResource);
    atomic_store(result, (unint64_t *)&qword_1002BA560);
  }

  return result;
}

unint64_t sub_1001DF5E4()
{
  unint64_t result = qword_1002BA568;
  if (!qword_1002BA568)
  {
    unint64_t result = swift_getWitnessTable("1S\b", &type metadata for ProductRequest.Platform);
    atomic_store(result, (unint64_t *)&qword_1002BA568);
  }

  return result;
}

unint64_t sub_1001DF62C()
{
  unint64_t result = qword_1002BA578;
  if (!qword_1002BA578)
  {
    unint64_t result = swift_getWitnessTable("AR\b", &type metadata for ProductRequest.IdentifierKind);
    atomic_store(result, (unint64_t *)&qword_1002BA578);
  }

  return result;
}

unint64_t sub_1001DF670()
{
  unint64_t result = qword_1002BA580;
  if (!qword_1002BA580)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductRequest.RequestKind,  &type metadata for ProductRequest.RequestKind);
    atomic_store(result, (unint64_t *)&qword_1002BA580);
  }

  return result;
}

uint64_t sub_1001DF6B4(unint64_t *a1, uint64_t (*a2)(void), const char *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100018EC0(&qword_1002BA550);
    uint64_t v8 = a2();
    uint64_t result = swift_getWitnessTable(a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1001DF71C()
{
  unint64_t result = qword_1002BA590;
  if (!qword_1002BA590)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductRequest.IncludedResource,  &type metadata for ProductRequest.IncludedResource);
    atomic_store(result, (unint64_t *)&qword_1002BA590);
  }

  return result;
}

unint64_t sub_1001DF760()
{
  unint64_t result = qword_1002BA598;
  if (!qword_1002BA598)
  {
    unint64_t result = swift_getWitnessTable("IS\b", &type metadata for ProductRequest.Platform);
    atomic_store(result, (unint64_t *)&qword_1002BA598);
  }

  return result;
}

uint64_t sub_1001DF7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProductRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1001DF7EC()
{
  unint64_t result = qword_1002BA5A0;
  if (!qword_1002BA5A0)
  {
    unint64_t result = swift_getWitnessTable("yS\b", &type metadata for ProductRequest.Platform);
    atomic_store(result, (unint64_t *)&qword_1002BA5A0);
  }

  return result;
}

unint64_t sub_1001DF834()
{
  unint64_t result = qword_1002BA5A8;
  if (!qword_1002BA5A8)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductRequest.RequestKind,  &type metadata for ProductRequest.RequestKind);
    atomic_store(result, (unint64_t *)&qword_1002BA5A8);
  }

  return result;
}

unint64_t sub_1001DF87C()
{
  unint64_t result = qword_1002BA5B0;
  if (!qword_1002BA5B0)
  {
    uint64_t v1 = sub_100018EC0(&qword_1002BA5B8);
    unint64_t result = swift_getWitnessTable((const char *)&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002BA5B0);
  }

  return result;
}

unint64_t sub_1001DF8CC()
{
  unint64_t result = qword_1002BA5C0;
  if (!qword_1002BA5C0)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for ProductRequest.IncludedResource,  &type metadata for ProductRequest.IncludedResource);
    atomic_store(result, (unint64_t *)&qword_1002BA5C0);
  }

  return result;
}

uint64_t sub_1001DF910(uint64_t a1)
{
  uint64_t result = sub_1000221A8(&qword_1002BA5C8, type metadata accessor for ProductRequest, (uint64_t)&unk_10020F07C);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001DF94C(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA5D0,  type metadata accessor for ProductRequest,  (uint64_t)&protocol conformance descriptor for ProductRequest);
  uint64_t result = sub_1000221A8( &qword_1002BA5D8,  type metadata accessor for ProductRequest,  (uint64_t)&protocol conformance descriptor for ProductRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

unint64_t *initializeBufferWithCopyOfBuffer for ProductRequest( unint64_t *a1, unint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1LL, v7))
    {
      uint64_t v9 = sub_1000175B0(&qword_1002BA218);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    }

    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }

      else
      {
        unint64_t v12 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }

      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3LL, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64LL));
      }

      else
      {
        uint64_t v21 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0LL, 3LL, v18);
      }

      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      _BYTE v23[8] = v24[8];
      uint64_t v25 = v7[9];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      uint64_t v31 = type metadata accessor for UUID(0LL);
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1LL, v31))
      {
        uint64_t v33 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0LL, 1LL, v31);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0LL, 1LL, v7);
    }

    uint64_t v34 = a3[5];
    uint64_t v35 = (char *)a1 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = *(void *)v36;
    unsigned __int8 v38 = v36[8];
    ChannelOptions.Storage._storage.getter(*(void *)v36, v38);
    *(void *)uint64_t v35 = v37;
    v35[8] = v38;
    uint64_t v39 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    *(unint64_t *)((char *)a1 + sub_1001B968C(v5, v6, v7, v8, v9, v10, v11, v12, v30, (uint64_t)v33, v37, v39) = *(unint64_t *)((char *)a2 + v39);
    uint64_t v40 = a3[8];
    uint64_t v41 = a3[9];
    unint64_t v42 = (unint64_t *)((char *)a1 + v40);
    uint64_t v43 = (unint64_t *)((char *)a2 + v40);
    uint64_t v44 = v43[1];
    *unint64_t v42 = *v43;
    v42[1] = v44;
    *((_BYTE *)a1 + v41) = *((_BYTE *)a2 + v41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t destroy for ProductRequest(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, 1LL, v4))
  {
    unint64_t v5 = a1[1];
    if (v5 >> 60 != 15) {
      sub_10003A9EC(*a1, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = (char *)a1 + *(int *)(v4 + 28);
    uint64_t v7 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(v6, 3LL, v7))
    {
      uint64_t v8 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v6, v8);
    }

    uint64_t v9 = (char *)a1 + *(int *)(v4 + 40);
    uint64_t v10 = type metadata accessor for UUID(0LL);
    uint64_t v11 = *(void *)(v10 - 8);
  }

  j__swift_bridgeObjectRelease(*(uint64_t *)((char *)a1 + *(int *)(a2 + 20)));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for ProductRequest(unint64_t *a1, unint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }

    else
    {
      unint64_t v10 = *a2;
      sub_10003AA88(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }

    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3LL, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 3LL, v16);
    }

    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    _BYTE v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = type metadata accessor for UUID(0LL);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1LL, v29))
    {
      uint64_t v31 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0LL, 1LL, v29);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v32 = a3[5];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = *(void *)v34;
  unsigned __int8 v36 = v34[8];
  ChannelOptions.Storage._storage.getter(*(void *)v34, v36);
  *(void *)uint64_t v33 = v35;
  v33[8] = v36;
  uint64_t v37 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *(unint64_t *)((char *)a1 + v37) = *(unint64_t *)((char *)a2 + v37);
  uint64_t v38 = a3[8];
  uint64_t v39 = a3[9];
  uint64_t v40 = (unint64_t *)((char *)a1 + v38);
  uint64_t v41 = (unint64_t *)((char *)a2 + v38);
  uint64_t v42 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v42;
  *((_BYTE *)a1 + sub_1001B968C(v5, v6, v7, v8, v9, v10, v11, v12, v30, (uint64_t)v33, v37, v39) = *((_BYTE *)a2 + v39);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for ProductRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v15 = a2[1];
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }

    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v49 = *a2;
        sub_10003AA88(*a2, a2[1]);
        uint64_t v50 = *a1;
        unint64_t v51 = a1[1];
        *a1 = v49;
        a1[1] = v15;
        sub_10003A9EC(v50, v51);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v52 = v6[7];
        uint64_t v53 = (char *)a1 + v52;
        uint64_t v54 = (char *)a2 + v52;
        uint64_t v55 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v56 = *(void *)(v55 - 8);
        uint64_t v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
        int v58 = v57(v53, 3LL, v55);
        int v59 = v57(v54, 3LL, v55);
        if (v58)
        {
          if (!v59)
          {
            uint64_t v60 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16LL))(v53, v54, v60);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0LL, 3LL, v55);
LABEL_31:
            uint64_t v62 = v6[8];
            uint64_t v63 = (char *)a1 + v62;
            int v64 = (char *)a2 + v62;
            uint64_t v65 = *(void *)v64;
            _BYTE v63[8] = v64[8];
            *(void *)uint64_t v63 = v65;
            uint64_t v66 = v6[9];
            uint64_t v67 = (char *)a1 + v66;
            int v68 = (char *)a2 + v66;
            uint64_t v69 = *(void *)v68;
            v67[8] = v68[8];
            *(void *)uint64_t v67 = v69;
            uint64_t v70 = v6[10];
            uint64_t v71 = (char *)a1 + v70;
            uint64_t v72 = (char *)a2 + v70;
            uint64_t v73 = type metadata accessor for UUID(0LL);
            uint64_t v74 = *(void *)(v73 - 8);
            uint64_t v75 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 48);
            int v76 = v75(v71, 1LL, v73);
            int v77 = v75(v72, 1LL, v73);
            if (v76)
            {
              if (!v77)
              {
                (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v71, v72, v73);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56))(v71, 0LL, 1LL, v73);
                goto LABEL_20;
              }
            }

            else
            {
              if (!v77)
              {
                (*(void (**)(char *, char *, uint64_t))(v74 + 24))(v71, v72, v73);
                goto LABEL_20;
              }

              (*(void (**)(char *, uint64_t))(v74 + 8))(v71, v73);
            }

            size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v13 = (uint64_t *)v71;
            unint64_t v14 = (uint64_t *)v72;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v59)
          {
            uint64_t v78 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 24LL))(v53, v54, v78);
            goto LABEL_31;
          }

          sub_100043F40((uint64_t)v53, &qword_1002B9A70);
        }

        uint64_t v61 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v53, v54, *(void *)(*(void *)(v61 - 8) + 64LL));
        goto LABEL_31;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }

  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }

  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    uint64_t v17 = *a2;
    sub_10003AA88(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }

  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3LL, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64LL));
  }

  else
  {
    uint64_t v24 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 3LL, v21);
  }

  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = type metadata accessor for UUID(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36))
  {
    uint64_t v38 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0LL, 1LL, v36);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_20:
  uint64_t v39 = a3[5];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  uint64_t v42 = *(void *)v41;
  unsigned __int8 v43 = v41[8];
  ChannelOptions.Storage._storage.getter(*(void *)v41, v43);
  uint64_t v44 = *(void *)v40;
  *(void *)uint64_t v40 = v42;
  v40[8] = v43;
  j__swift_bridgeObjectRelease(v44);
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[8];
  uint64_t v46 = (uint64_t *)((char *)a1 + v45);
  int v47 = (uint64_t *)((char *)a2 + v45);
  void *v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

_OWORD *initializeWithTake for ProductRequest(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    __int128 v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3LL, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
    }

    else
    {
      uint64_t v16 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32LL))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 3LL, v13);
    }

    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    _BYTE v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = type metadata accessor for UUID(0LL);
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26))
    {
      uint64_t v28 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0LL, 1LL, v26);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v29 = a3[5];
  uint64_t v30 = a3[6];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v32[8];
  *((_BYTE *)a1 + v30) = *((_BYTE *)a2 + v30);
  uint64_t v33 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v33) = *(_OWORD *)((char *)a2 + v33);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

uint64_t *assignWithTake for ProductRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v21 = a1[1];
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v48 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003A9EC(v48, v21);
LABEL_20:
        uint64_t v49 = a2[3];
        a1[2] = a2[2];
        a1[3] = v49;
        swift_bridgeObjectRelease();
        uint64_t v50 = a2[5];
        a1[4] = a2[4];
        a1[5] = v50;
        swift_bridgeObjectRelease();
        uint64_t v51 = v6[7];
        uint64_t v52 = (char *)a1 + v51;
        uint64_t v53 = (char *)a2 + v51;
        uint64_t v54 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v55 = *(void *)(v54 - 8);
        uint64_t v56 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v55 + 48);
        int v57 = v56(v52, 3LL, v54);
        int v58 = v56(v53, 3LL, v54);
        if (v57)
        {
          if (!v58)
          {
            uint64_t v59 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 32LL))(v52, v53, v59);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0LL, 3LL, v54);
LABEL_26:
            uint64_t v61 = v6[8];
            uint64_t v62 = (char *)a1 + v61;
            uint64_t v63 = (char *)a2 + v61;
            *(void *)uint64_t v62 = *(void *)v63;
            v62[8] = v63[8];
            uint64_t v64 = v6[9];
            uint64_t v65 = (char *)a1 + v64;
            uint64_t v66 = (char *)a2 + v64;
            v65[8] = v66[8];
            *(void *)uint64_t v65 = *(void *)v66;
            uint64_t v67 = v6[10];
            int v68 = (char *)a1 + v67;
            uint64_t v69 = (char *)a2 + v67;
            uint64_t v70 = type metadata accessor for UUID(0LL);
            uint64_t v71 = *(void *)(v70 - 8);
            uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
            int v73 = v72(v68, 1LL, v70);
            int v74 = v72(v69, 1LL, v70);
            if (v73)
            {
              if (!v74)
              {
                (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v68, v69, v70);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0LL, 1LL, v70);
                goto LABEL_18;
              }
            }

            else
            {
              if (!v74)
              {
                (*(void (**)(char *, char *, uint64_t))(v71 + 40))(v68, v69, v70);
                goto LABEL_18;
              }

              (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
            }

            size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v19 = (uint64_t *)v68;
            uint64_t v20 = (uint64_t *)v69;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v58)
          {
            uint64_t v75 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 40LL))(v52, v53, v75);
            goto LABEL_26;
          }

          sub_100043F40((uint64_t)v52, &qword_1002B9A70);
        }

        uint64_t v60 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v52, v53, *(void *)(*(void *)(v60 - 8) + 64LL));
        goto LABEL_26;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }

  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }

  __int128 v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3LL, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    uint64_t v23 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32LL))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 3LL, v15);
  }

  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = type metadata accessor for UUID(0LL);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1LL, v33))
  {
    uint64_t v35 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0LL, 1LL, v33);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_18:
  uint64_t v36 = a3[5];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = *(void *)v38;
  LOBYTE(v38) = v38[8];
  uint64_t v40 = *(void *)v37;
  *(void *)uint64_t v37 = v39;
  v37[8] = (char)v38;
  j__swift_bridgeObjectRelease(v40);
  uint64_t v41 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *(uint64_t *)((char *)a1 + v41) = *(uint64_t *)((char *)a2 + v41);
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[8];
  unsigned __int8 v43 = (uint64_t *)((char *)a1 + v42);
  uint64_t v44 = (uint64_t *)((char *)a2 + v42);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  *unsigned __int8 v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001E0D38);
}

uint64_t sub_1001E0D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002BA218);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001E0DC4);
}

uint64_t sub_1001E0DC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000175B0(&qword_1002BA218);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_1001E0E40(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = "\t";
    v4[2] = &unk_10020F138;
    void v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    void v4[4] = &unk_10020F150;
    void v4[5] = &unk_10020F168;
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
  }

ValueMetadata *type metadata accessor for ProductRequest.Platform()
{
  return &type metadata for ProductRequest.Platform;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind()
{
  return &type metadata for ProductRequest.RequestKind;
}

uint64_t initializeBufferWithCopyOfBuffer for ProductRequest.IdentifierKind(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unsigned __int8 v4 = *((_BYTE *)a2 + 8);
  ChannelOptions.Storage._storage.getter(*a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for ProductRequest.IdentifierKind(void *a1)
{
  return j__swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for ProductRequest.IdentifierKind(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unsigned __int8 v4 = *((_BYTE *)a2 + 8);
  ChannelOptions.Storage._storage.getter(*a2, v4);
  uint64_t v5 = *a1;
  *a1 = v3;
  *((_BYTE *)a1 + 8) = v4;
  j__swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t initializeWithTake for ProductRequest.IdentifierKind(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t *assignWithTake for ProductRequest.IdentifierKind(uint64_t *a1, uint64_t *a2)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v4 = *a1;
  *a1 = *a2;
  *((_BYTE *)a1 + 8) = v3;
  j__swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductRequest.IdentifierKind(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductRequest.IdentifierKind( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1001E108C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1001E1094(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind()
{
  return &type metadata for ProductRequest.IdentifierKind;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource()
{
  return &type metadata for ProductRequest.IncludedResource;
}

uint64_t storeEnumTagSinglePayload for ProductRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_1001E1114 + 4 * byte_10020ED70[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1001E1148 + 4 * byte_10020ED6B[v4]))();
}

uint64_t sub_1001E1148(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E1150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E1158LL);
  }
  return result;
}

uint64_t sub_1001E1164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E116CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_1001E1170(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E1178(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.CodingKeys()
{
  return &type metadata for ProductRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.CodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.PromotionalOffersCodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.WinBackOffersCodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys;
}

uint64_t _s15StoreKit_Shared14ProductRequestV16IncludedResourceOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001E1210 + 4 * byte_10020ED7A[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001E1244 + 4 * byte_10020ED75[v4]))();
}

uint64_t sub_1001E1244(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E124C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E1254LL);
  }
  return result;
}

uint64_t sub_1001E1260(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E1268LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1001E126C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E1274(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.CodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.ProductsCodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys;
}

uint64_t _s15StoreKit_Shared14ProductRequestV14IdentifierKindO18ProductsCodingKeysOwst_0( uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1001E12E4 + 4 * byte_10020ED7F[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1001E1304 + 4 * byte_10020ED84[v4]))();
  }
}

_BYTE *sub_1001E12E4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1001E1304(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1001E130C(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1001E1314(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1001E131C(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1001E1324(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys;
}

uint64_t _s15StoreKit_Shared14ProductRequestV11RequestKindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1001E138C + 4 * byte_10020ED8E[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001E13C0 + 4 * byte_10020ED89[v4]))();
}

uint64_t sub_1001E13C0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E13C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E13D0LL);
  }
  return result;
}

uint64_t sub_1001E13DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E13E4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1001E13E8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E13F0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.CodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.LegacyMediaAPICodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.MediaAPICodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys;
}

uint64_t _s15StoreKit_Shared14ProductRequestV8PlatformOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_1001E1488 + 4 * byte_10020ED98[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1001E14BC + 4 * byte_10020ED93[v4]))();
}

uint64_t sub_1001E14BC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E14C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E14CCLL);
  }
  return result;
}

uint64_t sub_1001E14D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E14E0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_1001E14E4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E14EC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.CodingKeys()
{
  return &type metadata for ProductRequest.Platform.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.OsDefaultCodingKeys()
{
  return &type metadata for ProductRequest.Platform.OsDefaultCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.IPadCodingKeys()
{
  return &type metadata for ProductRequest.Platform.IPadCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.IPhoneCodingKeys()
{
  return &type metadata for ProductRequest.Platform.IPhoneCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.MacCodingKeys()
{
  return &type metadata for ProductRequest.Platform.MacCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.RealityCodingKeys()
{
  return &type metadata for ProductRequest.Platform.RealityCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.TvCodingKeys()
{
  return &type metadata for ProductRequest.Platform.TvCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.WatchCodingKeys()
{
  return &type metadata for ProductRequest.Platform.WatchCodingKeys;
}

unint64_t sub_1001E157C()
{
  unint64_t result = qword_1002BA680;
  if (!qword_1002BA680)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F600, &type metadata for ProductRequest.Platform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA680);
  }

  return result;
}

unint64_t sub_1001E15C4()
{
  unint64_t result = qword_1002BA688;
  if (!qword_1002BA688)
  {
    unint64_t result = swift_getWitnessTable("qI\b", &type metadata for ProductRequest.RequestKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA688);
  }

  return result;
}

unint64_t sub_1001E160C()
{
  unint64_t result = qword_1002BA690;
  if (!qword_1002BA690)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F860,  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA690);
  }

  return result;
}

unint64_t sub_1001E1654()
{
  unint64_t result = qword_1002BA698;
  if (!qword_1002BA698)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F918, &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA698);
  }

  return result;
}

unint64_t sub_1001E169C()
{
  unint64_t result = qword_1002BA6A0;
  if (!qword_1002BA6A0)
  {
    unint64_t result = swift_getWitnessTable("IG\b", &type metadata for ProductRequest.IdentifierKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6A0);
  }

  return result;
}

unint64_t sub_1001E16E4()
{
  unint64_t result = qword_1002BA6A8;
  if (!qword_1002BA6A8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FB28, &type metadata for ProductRequest.IncludedResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6A8);
  }

  return result;
}

unint64_t sub_1001E172C()
{
  unint64_t result = qword_1002BA6B0;
  if (!qword_1002BA6B0)
  {
    unint64_t result = swift_getWitnessTable("9E\b", &type metadata for ProductRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6B0);
  }

  return result;
}

unint64_t sub_1001E1774()
{
  unint64_t result = qword_1002BA6B8;
  if (!qword_1002BA6B8)
  {
    unint64_t result = swift_getWitnessTable("aF\b", &type metadata for ProductRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6B8);
  }

  return result;
}

unint64_t sub_1001E17BC()
{
  unint64_t result = qword_1002BA6C0;
  if (!qword_1002BA6C0)
  {
    unint64_t result = swift_getWitnessTable("IF\b", &type metadata for ProductRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6C0);
  }

  return result;
}

unint64_t sub_1001E1804()
{
  unint64_t result = qword_1002BA6C8;
  if (!qword_1002BA6C8)
  {
    unint64_t result = swift_getWitnessTable( "iG\b",  &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6C8);
  }

  return result;
}

unint64_t sub_1001E184C()
{
  unint64_t result = qword_1002BA6D0;
  if (!qword_1002BA6D0)
  {
    unint64_t result = swift_getWitnessTable( "QG\b",  &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6D0);
  }

  return result;
}

unint64_t sub_1001E1894()
{
  unint64_t result = qword_1002BA6D8;
  if (!qword_1002BA6D8)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F9F8,  &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6D8);
  }

  return result;
}

unint64_t sub_1001E18DC()
{
  unint64_t result = qword_1002BA6E0;
  if (!qword_1002BA6E0)
  {
    unint64_t result = swift_getWitnessTable( byte_10020FA20,  &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6E0);
  }

  return result;
}

unint64_t sub_1001E1924()
{
  unint64_t result = qword_1002BA6E8;
  if (!qword_1002BA6E8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FA98, &type metadata for ProductRequest.IncludedResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6E8);
  }

  return result;
}

unint64_t sub_1001E196C()
{
  unint64_t result = qword_1002BA6F0;
  if (!qword_1002BA6F0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020FAC0, &type metadata for ProductRequest.IncludedResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6F0);
  }

  return result;
}

unint64_t sub_1001E19B4()
{
  unint64_t result = qword_1002BA6F8;
  if (!qword_1002BA6F8)
  {
    unint64_t result = swift_getWitnessTable(")I\b", &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA6F8);
  }

  return result;
}

unint64_t sub_1001E19FC()
{
  unint64_t result = qword_1002BA700;
  if (!qword_1002BA700)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F8B0, &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA700);
  }

  return result;
}

unint64_t sub_1001E1A44()
{
  unint64_t result = qword_1002BA708;
  if (!qword_1002BA708)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F7D0,  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA708);
  }

  return result;
}

unint64_t sub_1001E1A8C()
{
  unint64_t result = qword_1002BA710;
  if (!qword_1002BA710)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F7F8,  &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA710);
  }

  return result;
}

unint64_t sub_1001E1AD4()
{
  unint64_t result = qword_1002BA718;
  if (!qword_1002BA718)
  {
    unint64_t result = swift_getWitnessTable("qH\b", &type metadata for ProductRequest.IdentifierKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA718);
  }

  return result;
}

unint64_t sub_1001E1B1C()
{
  unint64_t result = qword_1002BA720;
  if (!qword_1002BA720)
  {
    unint64_t result = swift_getWitnessTable("YH\b", &type metadata for ProductRequest.IdentifierKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA720);
  }

  return result;
}

unint64_t sub_1001E1B64()
{
  unint64_t result = qword_1002BA728;
  if (!qword_1002BA728)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F6C8,  &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA728);
  }

  return result;
}

unint64_t sub_1001E1BAC()
{
  unint64_t result = qword_1002BA730;
  if (!qword_1002BA730)
  {
    unint64_t result = swift_getWitnessTable( byte_10020F6F0,  &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA730);
  }

  return result;
}

unint64_t sub_1001E1BF4()
{
  unint64_t result = qword_1002BA738;
  if (!qword_1002BA738)
  {
    unint64_t result = swift_getWitnessTable("9K\b", &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA738);
  }

  return result;
}

unint64_t sub_1001E1C3C()
{
  unint64_t result = qword_1002BA740;
  if (!qword_1002BA740)
  {
    unint64_t result = swift_getWitnessTable("!K\b", &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA740);
  }

  return result;
}

unint64_t sub_1001E1C84()
{
  unint64_t result = qword_1002BA748;
  if (!qword_1002BA748)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F628, &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA748);
  }

  return result;
}

unint64_t sub_1001E1CCC()
{
  unint64_t result = qword_1002BA750;
  if (!qword_1002BA750)
  {
    unint64_t result = swift_getWitnessTable("qK\b", &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA750);
  }

  return result;
}

unint64_t sub_1001E1D14()
{
  unint64_t result = qword_1002BA758;
  if (!qword_1002BA758)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F718, &type metadata for ProductRequest.RequestKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA758);
  }

  return result;
}

unint64_t sub_1001E1D5C()
{
  unint64_t result = qword_1002BA760;
  if (!qword_1002BA760)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F740, &type metadata for ProductRequest.RequestKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA760);
  }

  return result;
}

unint64_t sub_1001E1DA4()
{
  unint64_t result = qword_1002BA768;
  if (!qword_1002BA768)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F520, &type metadata for ProductRequest.Platform.OsDefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA768);
  }

  return result;
}

unint64_t sub_1001E1DEC()
{
  unint64_t result = qword_1002BA770;
  if (!qword_1002BA770)
  {
    unint64_t result = swift_getWitnessTable("yL\b", &type metadata for ProductRequest.Platform.OsDefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA770);
  }

  return result;
}

unint64_t sub_1001E1E34()
{
  unint64_t result = qword_1002BA778;
  if (!qword_1002BA778)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F4D0, &type metadata for ProductRequest.Platform.IPadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA778);
  }

  return result;
}

unint64_t sub_1001E1E7C()
{
  unint64_t result = qword_1002BA780;
  if (!qword_1002BA780)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F4F8, &type metadata for ProductRequest.Platform.IPadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA780);
  }

  return result;
}

unint64_t sub_1001E1EC4()
{
  unint64_t result = qword_1002BA788;
  if (!qword_1002BA788)
  {
    unint64_t result = swift_getWitnessTable("1M\b", &type metadata for ProductRequest.Platform.IPhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA788);
  }

  return result;
}

unint64_t sub_1001E1F0C()
{
  unint64_t result = qword_1002BA790;
  if (!qword_1002BA790)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F4A8, &type metadata for ProductRequest.Platform.IPhoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA790);
  }

  return result;
}

unint64_t sub_1001E1F54()
{
  unint64_t result = qword_1002BA798;
  if (!qword_1002BA798)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F430, &type metadata for ProductRequest.Platform.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA798);
  }

  return result;
}

unint64_t sub_1001E1F9C()
{
  unint64_t result = qword_1002BA7A0;
  if (!qword_1002BA7A0)
  {
    unint64_t result = swift_getWitnessTable("iM\b", &type metadata for ProductRequest.Platform.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7A0);
  }

  return result;
}

unint64_t sub_1001E1FE4()
{
  unint64_t result = qword_1002BA7A8;
  if (!qword_1002BA7A8)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F3E0, &type metadata for ProductRequest.Platform.RealityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7A8);
  }

  return result;
}

unint64_t sub_1001E202C()
{
  unint64_t result = qword_1002BA7B0;
  if (!qword_1002BA7B0)
  {
    unint64_t result = swift_getWitnessTable(byte_10020F408, &type metadata for ProductRequest.Platform.RealityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7B0);
  }

  return result;
}

unint64_t sub_1001E2074()
{
  unint64_t result = qword_1002BA7B8;
  if (!qword_1002BA7B8)
  {
    unint64_t result = swift_getWitnessTable("!N\b", &type metadata for ProductRequest.Platform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7B8);
  }

  return result;
}

unint64_t sub_1001E20BC()
{
  unint64_t result = qword_1002BA7C0;
  if (!qword_1002BA7C0)
  {
    unint64_t result = swift_getWitnessTable("\tN\b", &type metadata for ProductRequest.Platform.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7C0);
  }

  return result;
}

unint64_t sub_1001E2104()
{
  unint64_t result = qword_1002BA7C8;
  if (!qword_1002BA7C8)
  {
    unint64_t result = swift_getWitnessTable("qN\b", &type metadata for ProductRequest.Platform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7C8);
  }

  return result;
}

unint64_t sub_1001E214C()
{
  unint64_t result = qword_1002BA7D0;
  if (!qword_1002BA7D0)
  {
    unint64_t result = swift_getWitnessTable("YN\b", &type metadata for ProductRequest.Platform.WatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7D0);
  }

  return result;
}

unint64_t sub_1001E2194()
{
  unint64_t result = qword_1002BA7D8;
  if (!qword_1002BA7D8)
  {
    unint64_t result = swift_getWitnessTable("AL\b", &type metadata for ProductRequest.Platform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7D8);
  }

  return result;
}

unint64_t sub_1001E21DC()
{
  unint64_t result = qword_1002BA7E0;
  if (!qword_1002BA7E0)
  {
    unint64_t result = swift_getWitnessTable(")L\b", &type metadata for ProductRequest.Platform.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA7E0);
  }

  return result;
}

uint64_t sub_1001E2220(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v5 = 0xEE00656469727265LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x696669746E656469LL && a2 == 0xEA00000000007265LL)
  {
    unint64_t v7 = 0xEA00000000007265LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469LL, 0xEA00000000007265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v8 = 0xE400000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v9 = 0x8000000100222CF0LL;
    if (a2 == 0x8000000100222CF0LL) {
      goto LABEL_25;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100222CF0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v10 = 0xE600000000000000LL;
LABEL_31:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_31;
  }

  if (a1 == 0x6D726F6674616C70LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6D726F6674616C70LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_1001E24B0(unint64_t *a1, uint64_t a2, const char *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100018EC0(&qword_1002BA200);
    uint64_t v8 = a2;
    uint64_t result = swift_getWitnessTable(a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1001E2518(uint64_t a1)
{
  unint64_t v2 = sub_1001E28B4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E2540(uint64_t a1)
{
  unint64_t v2 = sub_1001E28B4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001E2568(uint64_t a1)
{
  unint64_t v2 = sub_1001E2870();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E2590(uint64_t a1)
{
  unint64_t v2 = sub_1001E2870();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001E25B8()
{
  if (*v0) {
    return 0x746E65696C63LL;
  }
  else {
    return 7105633LL;
  }
}

uint64_t sub_1001E25E8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001E402C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001E260C(uint64_t a1)
{
  unint64_t v2 = sub_1001E282C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E2634(uint64_t a1)
{
  unint64_t v2 = sub_1001E282C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Kind.encode(to:)(void *a1, int a2)
{
  int v20 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA888);
  uint64_t v18 = *(void *)(v3 - 8);
  uint64_t v19 = v3;
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_1000175B0(&qword_1002BA890);
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000175B0(&qword_1002BA898);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_100019F58(a1, v13);
  unint64_t v15 = sub_1001E282C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Kind.CodingKeys,  &type metadata for PurchaseIntentRequest.Kind.CodingKeys,  v15,  v13,  v14);
  if ((v20 & 1) != 0)
  {
    char v22 = 1;
    sub_1001E2870();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys,  &v22,  v9,  &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
  }

  else
  {
    char v21 = 0;
    sub_1001E28B4();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys,  &v21,  v9,  &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_1001E282C()
{
  unint64_t result = qword_1002BA8A0;
  if (!qword_1002BA8A0)
  {
    unint64_t result = swift_getWitnessTable("m<\b", &type metadata for PurchaseIntentRequest.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA8A0);
  }

  return result;
}

unint64_t sub_1001E2870()
{
  unint64_t result = qword_1002BA8A8;
  if (!qword_1002BA8A8)
  {
    unint64_t result = swift_getWitnessTable(byte_100210A24, &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA8A8);
  }

  return result;
}

unint64_t sub_1001E28B4()
{
  unint64_t result = qword_1002BA8B0;
  if (!qword_1002BA8B0)
  {
    unint64_t result = swift_getWitnessTable("\r=\b", &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA8B0);
  }

  return result;
}

uint64_t PurchaseIntentRequest.Kind.init(from:)(void *a1)
{
  return sub_1001E4104(a1) & 1;
}

uint64_t sub_1001E2910@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1001E4104(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1001E293C(void *a1)
{
  return PurchaseIntentRequest.Kind.encode(to:)(a1, *v1);
}

uint64_t PurchaseIntentRequest.Add.intent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1001C7890(v1, a1, type metadata accessor for PurchaseIntentInternal);
}

uint64_t PurchaseIntentRequest.Add.launchApp.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Add(0LL) + 20));
}

uint64_t PurchaseIntentRequest.Add.logKey.getter()
{
  return sub_1001E3034(type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t PurchaseIntentRequest.Add.logKey.setter(uint64_t a1, uint64_t a2)
{
  return sub_1001E3080(a1, a2, type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t (*PurchaseIntentRequest.Add.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Add.notify.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Add(0LL) + 28));
}

int *PurchaseIntentRequest.Add.init(intent:launchApp:notify:logKey:)@<X0>( uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t result = (int *)type metadata accessor for PurchaseIntentRequest.Add(0LL);
  *(_BYTE *)(a6 + result[5]) = a2;
  uint64_t v12 = (void *)(a6 + result[6]);
  *uint64_t v12 = a4;
  v12[1] = a5;
  *(_BYTE *)(a6 + result[7]) = a3;
  return result;
}

uint64_t sub_1001E2A60()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001E2A8C + 4 * byte_100210200[*v0]))( 0x746E65746E69LL,  0xE600000000000000LL);
}

uint64_t sub_1001E2A8C()
{
  return 0x704168636E75616CLL;
}

uint64_t sub_1001E2AA8()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001E2AB8()
{
  return 0x796669746F6ELL;
}

uint64_t sub_1001E2AC8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001E7F90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001E2AEC(uint64_t a1)
{
  unint64_t v2 = sub_1001E4488();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E2B14(uint64_t a1)
{
  unint64_t v2 = sub_1001E4488();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Add.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA8B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001E4488();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Add.CodingKeys,  &type metadata for PurchaseIntentRequest.Add.CodingKeys,  v11,  v9,  v10);
  char v25 = 0;
  uint64_t v12 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v13 = sub_1000221A8( &qword_1002BA8C8,  type metadata accessor for PurchaseIntentInternal,  (uint64_t)&protocol conformance descriptor for PurchaseIntentInternal);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v25, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = (int *)type metadata accessor for PurchaseIntentRequest.Add(0LL);
    uint64_t v15 = *(unsigned __int8 *)(v3 + v14[5]);
    char v24 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v24, v5);
    uint64_t v16 = (uint64_t *)(v3 + v14[6]);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    char v23 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v17, v18, &v23, v5);
    uint64_t v19 = *(unsigned __int8 *)(v3 + v14[7]);
    char v22 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v19, &v22, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t PurchaseIntentRequest.Add.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal(0LL);
  __chkstk_darwin(v4);
  char v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = sub_1000175B0(&qword_1002BA8D0);
  uint64_t v6 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (int *)type metadata accessor for PurchaseIntentRequest.Add(0LL);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v12 = a1[4];
  uint64_t v27 = a1;
  sub_100019F58(a1, v13);
  unint64_t v14 = sub_1001E4488();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Add.CodingKeys,  &type metadata for PurchaseIntentRequest.Add.CodingKeys,  v14,  v13,  v12);
  if (v2) {
    return sub_100019F7C(v27);
  }
  uint64_t v15 = v6;
  uint64_t v16 = (uint64_t)v11;
  char v31 = 0;
  sub_1000221A8( &qword_1002BA8D8,  type metadata accessor for PurchaseIntentInternal,  (uint64_t)&protocol conformance descriptor for PurchaseIntentInternal);
  uint64_t v18 = (uint64_t)v25;
  uint64_t v17 = v26;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v4, &v31, v26, v4);
  sub_1001E4444(v18, v16);
  char v30 = 1;
  *(_BYTE *)(v16 + v9[5]) = KeyedDecodingContainer.decode(_:forKey:)(&v30, v17) & 1;
  char v29 = 2;
  uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)(&v29, v17);
  int v20 = (uint64_t *)(v16 + v9[6]);
  *int v20 = v19;
  v20[1] = v21;
  char v28 = 3;
  char v22 = KeyedDecodingContainer.decode(_:forKey:)(&v28, v17);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v17);
  *(_BYTE *)(v16 + v9[7]) = v22 & 1;
  sub_1001C7890(v16, v24, type metadata accessor for PurchaseIntentRequest.Add);
  sub_100019F7C(v27);
  return sub_1000A77B0(v16, type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t sub_1001E2FE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Add.init(from:)(a1, a2);
}

uint64_t sub_1001E2FF4(void *a1)
{
  return PurchaseIntentRequest.Add.encode(to:)(a1);
}

uint64_t PurchaseIntentRequest.Remove.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Remove(0LL) + 20));
}

uint64_t PurchaseIntentRequest.Remove.logKey.getter()
{
  return sub_1001E3034(type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_1001E3034(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0LL) + 24));
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t PurchaseIntentRequest.Remove.logKey.setter(uint64_t a1, uint64_t a2)
{
  return sub_1001E3080(a1, a2, type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_1001E3080(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0LL) + 24));
  uint64_t result = swift_bridgeObjectRelease(v6[1]);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*PurchaseIntentRequest.Remove.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Remove.productID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Remove(0LL) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

int *PurchaseIntentRequest.Remove.init(clientOverride:kind:logKey:productID:)@<X0>( uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v12 = a2 & 1;
  sub_1001D8D90(a1, a7);
  uint64_t result = (int *)type metadata accessor for PurchaseIntentRequest.Remove(0LL);
  *(_BYTE *)(a7 + result[5]) = v12;
  unint64_t v14 = (void *)(a7 + result[6]);
  void *v14 = a3;
  v14[1] = a4;
  uint64_t v15 = (void *)(a7 + result[7]);
  *uint64_t v15 = a5;
  v15[1] = a6;
  return result;
}

uint64_t sub_1001E3198()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001E31D4 + 4 * byte_100210204[*v0]))( 0x764F746E65696C63LL,  0xEE00656469727265LL);
}

uint64_t sub_1001E31D4()
{
  return 1684957547LL;
}

uint64_t sub_1001E31E4()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001E31F8()
{
  return 0x49746375646F7270LL;
}

uint64_t sub_1001E3214@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001E813C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001E3238(uint64_t a1)
{
  unint64_t v2 = sub_1001E44E0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E3260(uint64_t a1)
{
  unint64_t v2 = sub_1001E44E0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Remove.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA8E0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001E44E0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Remove.CodingKeys,  &type metadata for PurchaseIntentRequest.Remove.CodingKeys,  v11,  v9,  v10);
  char v28 = 0;
  uint64_t v12 = type metadata accessor for ClientOverride(0LL);
  uint64_t v13 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v3, &v28, v5, v12, v13);
  if (!v2)
  {
    unint64_t v14 = (int *)type metadata accessor for PurchaseIntentRequest.Remove(0LL);
    char v27 = *(_BYTE *)(v3 + v14[5]);
    char v26 = 1;
    unint64_t v15 = sub_1001E4524();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v27, &v26, v5, &type metadata for PurchaseIntentRequest.Kind, v15);
    uint64_t v16 = (uint64_t *)(v3 + v14[6]);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    char v25 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v17, v18, &v25, v5);
    uint64_t v19 = (uint64_t *)(v3 + v14[7]);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    char v24 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, &v24, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t PurchaseIntentRequest.Remove.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = sub_1000175B0(&qword_1002BA8F8);
  uint64_t v7 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (int *)type metadata accessor for PurchaseIntentRequest.Remove(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  char v31 = a1;
  sub_100019F58(a1, v14);
  unint64_t v15 = sub_1001E44E0();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Remove.CodingKeys,  &type metadata for PurchaseIntentRequest.Remove.CodingKeys,  v15,  v14,  v13);
  if (v2) {
    return sub_100019F7C(v31);
  }
  uint64_t v16 = (uint64_t)v12;
  uint64_t v17 = type metadata accessor for ClientOverride(0LL);
  char v35 = 0;
  uint64_t v18 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  uint64_t v19 = v30;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v17, &v35, v30, v17, v18);
  sub_1001D8D90((uint64_t)v6, v16);
  v34[0] = 1;
  sub_1001E4568();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for PurchaseIntentRequest.Kind,  v34,  v19,  &type metadata for PurchaseIntentRequest.Kind);
  *(_BYTE *)(v16 + v10[5]) = v34[1];
  char v33 = 2;
  uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)(&v33, v19);
  uint64_t v21 = (uint64_t *)(v16 + v10[6]);
  uint64_t *v21 = v20;
  v21[1] = v22;
  char v32 = 3;
  uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v32, v30);
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
  char v26 = (uint64_t *)(v16 + v10[7]);
  *char v26 = v23;
  v26[1] = v25;
  sub_1001C7890(v16, v29, type metadata accessor for PurchaseIntentRequest.Remove);
  sub_100019F7C(v31);
  return sub_1000A77B0(v16, type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_1001E3778@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Remove.init(from:)(a1, a2);
}

uint64_t sub_1001E378C(void *a1)
{
  return PurchaseIntentRequest.Remove.encode(to:)(a1);
}

uint64_t PurchaseIntentRequest.Query.after.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t PurchaseIntentRequest.Query.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0LL) + 20);
  return sub_1001D6498(v3, a1);
}

uint64_t PurchaseIntentRequest.Query.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0LL) + 24));
}

uint64_t PurchaseIntentRequest.Query.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0LL) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntentRequest.Query.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0LL) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*PurchaseIntentRequest.Query.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Query.init(after:clientOverride:kind:logKey:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v11 = a3 & 1;
  uint64_t v12 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(a6, a1, v12);
  uint64_t v13 = (int *)type metadata accessor for PurchaseIntentRequest.Query(0LL);
  uint64_t result = sub_1001D8D90(a2, a6 + v13[5]);
  *(_BYTE *)(a6 + v13[6]) = v11;
  unint64_t v15 = (void *)(a6 + v13[7]);
  *unint64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t sub_1001E3960()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001E398C + 4 * byte_100210208[*v0]))( 0x7265746661LL,  0xE500000000000000LL);
}

uint64_t sub_1001E398C()
{
  return 0x764F746E65696C63LL;
}

uint64_t sub_1001E39B0()
{
  return 1684957547LL;
}

uint64_t sub_1001E39C0()
{
  return 0x79654B676F6CLL;
}

uint64_t sub_1001E39D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001E830C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001E39F8(uint64_t a1)
{
  unint64_t v2 = sub_1001E45C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E3A20(uint64_t a1)
{
  unint64_t v2 = sub_1001E45C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Query.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BA908);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001E45C0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Query.CodingKeys,  &type metadata for PurchaseIntentRequest.Query.CodingKeys,  v11,  v9,  v10);
  char v28 = 0;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = sub_1000221A8( &qword_1002BA120,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v28, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = (int *)type metadata accessor for PurchaseIntentRequest.Query(0LL);
    uint64_t v15 = v3 + v14[5];
    char v27 = 1;
    uint64_t v16 = type metadata accessor for ClientOverride(0LL);
    uint64_t v17 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v15, &v27, v5, v16, v17);
    char v26 = *(_BYTE *)(v3 + v14[6]);
    char v25 = 2;
    unint64_t v18 = sub_1001E4524();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v26, &v25, v5, &type metadata for PurchaseIntentRequest.Kind, v18);
    uint64_t v19 = (uint64_t *)(v3 + v14[7]);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    char v24 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v24, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t PurchaseIntentRequest.Query.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v3);
  uint64_t v36 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v38 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v39 = sub_1000175B0(&qword_1002BA918);
  uint64_t v7 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for PurchaseIntentRequest.Query(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_100019F58(a1, v14);
  unint64_t v15 = sub_1001E45C0();
  uint64_t v40 = v9;
  uint64_t v16 = v41;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Query.CodingKeys,  &type metadata for PurchaseIntentRequest.Query.CodingKeys,  v15,  v14,  v13);
  if (v16) {
    return sub_100019F7C(a1);
  }
  uint64_t v17 = (uint64_t)v36;
  uint64_t v33 = v10;
  uint64_t v34 = v5;
  uint64_t v41 = a1;
  unint64_t v18 = v12;
  char v45 = 0;
  sub_1000221A8( &qword_1002BA130,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v20 = v37;
  uint64_t v19 = v38;
  uint64_t v21 = v39;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v37, &v45, v39, v37);
  uint64_t v22 = (uint64_t)v18;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v18, v19, v20);
  uint64_t v23 = type metadata accessor for ClientOverride(0LL);
  char v44 = 1;
  uint64_t v24 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v23, &v44, v21, v23, v24);
  uint64_t v25 = v21;
  uint64_t v26 = v33;
  sub_1001D8D90(v17, (uint64_t)&v18[*(int *)(v33 + 20)]);
  v43[0] = 2;
  sub_1001E4568();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for PurchaseIntentRequest.Kind,  v43,  v25,  &type metadata for PurchaseIntentRequest.Kind);
  v18[*(int *)(v26 + 24)] = v43[1];
  char v42 = 3;
  uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)(&v42, v39);
  uint64_t v29 = v28;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v40, v39);
  uint64_t v30 = (uint64_t *)(v22 + *(int *)(v26 + 28));
  *uint64_t v30 = v27;
  v30[1] = v29;
  sub_1001C7890(v22, v35, type metadata accessor for PurchaseIntentRequest.Query);
  sub_100019F7C(v41);
  return sub_1000A77B0(v22, type metadata accessor for PurchaseIntentRequest.Query);
}

uint64_t sub_1001E4004@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Query.init(from:)(a1, a2);
}

uint64_t sub_1001E4018(void *a1)
{
  return PurchaseIntentRequest.Query.encode(to:)(a1);
}

uint64_t sub_1001E402C(uint64_t a1, unint64_t a2)
{
  if (a1 == 7105633 && a2 == 0xE300000000000000LL)
  {
    unint64_t v5 = 0xE300000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(7105633LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x746E65696C63LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746E65696C63LL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1001E4104(void *a1)
{
  uint64_t v29 = sub_1000175B0(&qword_1002BABB0);
  uint64_t v27 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v30 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = sub_1000175B0(&qword_1002BABB8);
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  unint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000175B0(&qword_1002BABC0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100019F58(a1, v10);
  unint64_t v12 = sub_1001E282C();
  uint64_t v13 = v31;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PurchaseIntentRequest.Kind.CodingKeys,  &type metadata for PurchaseIntentRequest.Kind.CodingKeys,  v12,  v10,  v11);
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v14 = v5;
  unint64_t v15 = v30;
  uint64_t v26 = a1;
  uint64_t v31 = v7;
  uint64_t v16 = KeyedDecodingContainer.allKeys.getter(v6);
  uint64_t v17 = v6;
  if (*(void *)(v16 + 16) != 1LL)
  {
    uint64_t v19 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v19, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v20 = v9;
    uint64_t v22 = v21;
    sub_1000175B0(&qword_1002B9F80);
    *uint64_t v22 = &type metadata for PurchaseIntentRequest.Kind;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter(v6);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v23,  0xD00000000000002BLL,  0x800000010021E870LL,  0LL);
    uint64_t v24 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104LL))( v22,  enum case for DecodingError.typeMismatch(_:),  v19);
    swift_willThrow(v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v6);
    a1 = v26;
LABEL_7:
    sub_100019F7C(a1);
    return v6;
  }

  uint64_t v6 = *(unsigned __int8 *)(v16 + 32);
  if ((v6 & 1) != 0)
  {
    char v33 = 1;
    sub_1001E2870();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys,  &v33,  v17,  &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys);
    uint64_t v18 = v31;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v29);
  }

  else
  {
    char v32 = 0;
    sub_1001E28B4();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys,  &v32,  v17,  &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys);
    uint64_t v18 = v31;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v28);
  }

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v17);
  sub_100019F7C(v26);
  return v6;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Add(uint64_t a1)
{
  return sub_1001C696C(a1, qword_1002BA9C0, (uint64_t)&nominal type descriptor for PurchaseIntentRequest.Add);
}

uint64_t sub_1001E4444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1001E4488()
{
  unint64_t result = qword_1002BA8C0;
  if (!qword_1002BA8C0)
  {
    unint64_t result = swift_getWitnessTable("]=\b", &type metadata for PurchaseIntentRequest.Add.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA8C0);
  }

  return result;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Remove(uint64_t a1)
{
  return sub_1001C696C(a1, qword_1002BAA58, (uint64_t)&nominal type descriptor for PurchaseIntentRequest.Remove);
}

unint64_t sub_1001E44E0()
{
  unint64_t result = qword_1002BA8E8;
  if (!qword_1002BA8E8)
  {
    unint64_t result = swift_getWitnessTable(byte_100210934, &type metadata for PurchaseIntentRequest.Remove.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA8E8);
  }

  return result;
}

unint64_t sub_1001E4524()
{
  unint64_t result = qword_1002BA8F0;
  if (!qword_1002BA8F0)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for PurchaseIntentRequest.Kind,  &type metadata for PurchaseIntentRequest.Kind);
    atomic_store(result, (unint64_t *)&qword_1002BA8F0);
  }

  return result;
}

unint64_t sub_1001E4568()
{
  unint64_t result = qword_1002BA900;
  if (!qword_1002BA900)
  {
    unint64_t result = swift_getWitnessTable( protocol conformance descriptor for PurchaseIntentRequest.Kind,  &type metadata for PurchaseIntentRequest.Kind);
    atomic_store(result, (unint64_t *)&qword_1002BA900);
  }

  return result;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Query(uint64_t a1)
{
  return sub_1001C696C(a1, qword_1002BAAF0, (uint64_t)&nominal type descriptor for PurchaseIntentRequest.Query);
}

unint64_t sub_1001E45C0()
{
  unint64_t result = qword_1002BA910;
  if (!qword_1002BA910)
  {
    unint64_t result = swift_getWitnessTable(byte_1002108E4, &type metadata for PurchaseIntentRequest.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BA910);
  }

  return result;
}

unint64_t sub_1001E4608()
{
  unint64_t result = qword_1002BA920;
  if (!qword_1002BA920)
  {
    unint64_t result = swift_getWitnessTable(")D\b", &type metadata for PurchaseIntentRequest.Kind);
    atomic_store(result, (unint64_t *)&qword_1002BA920);
  }

  return result;
}

uint64_t sub_1001E464C(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA928,  type metadata accessor for PurchaseIntentRequest.Add,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Add);
  uint64_t result = sub_1000221A8( &qword_1002BA930,  type metadata accessor for PurchaseIntentRequest.Add,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Add);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1001E46A8(uint64_t a1)
{
  uint64_t result = sub_1000221A8( &qword_1002BA938,  type metadata accessor for PurchaseIntentRequest.Remove,  (uint64_t)&unk_100210380);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001E46E4(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA940,  type metadata accessor for PurchaseIntentRequest.Remove,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Remove);
  uint64_t result = sub_1000221A8( &qword_1002BA948,  type metadata accessor for PurchaseIntentRequest.Remove,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Remove);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1001E4740(uint64_t a1)
{
  uint64_t result = sub_1000221A8( &qword_1002BA950,  type metadata accessor for PurchaseIntentRequest.Query,  (uint64_t)&unk_100210428);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001E477C(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BA958,  type metadata accessor for PurchaseIntentRequest.Query,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Query);
  uint64_t result = sub_1000221A8( &qword_1002BA960,  type metadata accessor for PurchaseIntentRequest.Query,  (uint64_t)&protocol conformance descriptor for PurchaseIntentRequest.Query);
  *(void *)(a1 + 24) = result;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest()
{
  return &type metadata for PurchaseIntentRequest;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind()
{
  return &type metadata for PurchaseIntentRequest.Kind;
}

void *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v11 = type metadata accessor for PurchaseIntentInternal(0LL);
    uint64_t v12 = *(int *)(v11 + 32);
    uint64_t v25 = (char *)a2 + v12;
    uint64_t v26 = (char *)v4 + v12;
    uint64_t v13 = type metadata accessor for Date(0LL);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v26, v25, v13);
    uint64_t v15 = *(int *)(v11 + 36);
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[6];
    *((_BYTE *)v4 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return v4;
}

uint64_t destroy for PurchaseIntentRequest.Add(uint64_t a1)
{
  uint64_t v2 = a1 + *(int *)(type metadata accessor for PurchaseIntentInternal(0LL) + 32);
  uint64_t v3 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v10 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v23 = (char *)a2 + v11;
  uint64_t v24 = (char *)a1 + v11;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v24, v23, v12);
  uint64_t v14 = *(int *)(v10 + 36);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v7 = *(int *)(v6 + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(v6 + 36);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentRequest.Add(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  __int128 v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v9 = *(int *)(v8 + 32);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(v8 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 36));
  uint64_t v13 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

void *assignWithTake for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  uint64_t v15 = *(int *)(v10 + 36);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001E4DF8);
}

uint64_t sub_1001E4DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Add( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001E4E84);
}

uint64_t sub_1001E4E84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PurchaseIntentInternal(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1001E4F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001E62E8(a1, a2, a3, type metadata accessor for PurchaseIntentInternal, (uint64_t)&unk_1002104E0);
}

unint64_t *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Remove( unint64_t *a1, unint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1LL, v7))
    {
      uint64_t v9 = sub_1000175B0(&qword_1002BA218);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    }

    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }

      else
      {
        unint64_t v12 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }

      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3LL, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64LL));
      }

      else
      {
        uint64_t v21 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0LL, 3LL, v18);
      }

      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      _BYTE v23[8] = v24[8];
      uint64_t v25 = v7[9];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      uint64_t v31 = type metadata accessor for UUID(0LL);
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1LL, v31))
      {
        uint64_t v33 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0LL, 1LL, v31);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0LL, 1LL, v7);
    }

    uint64_t v34 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    uint64_t v35 = (unint64_t *)((char *)a1 + v34);
    uint64_t v36 = (unint64_t *)((char *)a2 + v34);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = a3[7];
    uint64_t v39 = (unint64_t *)((char *)a1 + v38);
    uint64_t v40 = (unint64_t *)((char *)a2 + v38);
    uint64_t v41 = v40[1];
    *uint64_t v39 = *v40;
    v39[1] = v41;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t destroy for PurchaseIntentRequest.Remove(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(a1, 1LL, v2))
  {
    unint64_t v3 = a1[1];
    if (v3 >> 60 != 15) {
      sub_10003A9EC(*a1, v3);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48LL))(v4, 3LL, v5))
    {
      uint64_t v6 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
    }

    uint64_t v7 = (char *)a1 + *(int *)(v2 + 40);
    uint64_t v8 = type metadata accessor for UUID(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for PurchaseIntentRequest.Remove( unint64_t *a1, unint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }

    else
    {
      unint64_t v10 = *a2;
      sub_10003AA88(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }

    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3LL, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 3LL, v16);
    }

    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    _BYTE v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = type metadata accessor for UUID(0LL);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1LL, v29))
    {
      uint64_t v31 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0LL, 1LL, v29);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v32 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v33 = (unint64_t *)((char *)a1 + v32);
  uint64_t v34 = (unint64_t *)((char *)a2 + v32);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  uint64_t v36 = a3[7];
  uint64_t v37 = (unint64_t *)((char *)a1 + v36);
  uint64_t v38 = (unint64_t *)((char *)a2 + v36);
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for PurchaseIntentRequest.Remove(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v15 = a2[1];
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }

    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v46 = *a2;
        sub_10003AA88(*a2, a2[1]);
        uint64_t v47 = *a1;
        unint64_t v48 = a1[1];
        *a1 = v46;
        a1[1] = v15;
        sub_10003A9EC(v47, v48);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v49 = v6[7];
        uint64_t v50 = (char *)a1 + v49;
        uint64_t v51 = (char *)a2 + v49;
        uint64_t v52 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v53 = *(void *)(v52 - 8);
        uint64_t v54 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
        int v55 = v54(v50, 3LL, v52);
        int v56 = v54(v51, 3LL, v52);
        if (v55)
        {
          if (!v56)
          {
            uint64_t v57 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16LL))(v50, v51, v57);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0LL, 3LL, v52);
LABEL_31:
            uint64_t v59 = v6[8];
            uint64_t v60 = (char *)a1 + v59;
            uint64_t v61 = (char *)a2 + v59;
            uint64_t v62 = *(void *)v61;
            v60[8] = v61[8];
            *(void *)uint64_t v60 = v62;
            uint64_t v63 = v6[9];
            uint64_t v64 = (char *)a1 + v63;
            uint64_t v65 = (char *)a2 + v63;
            uint64_t v66 = *(void *)v65;
            v64[8] = v65[8];
            *(void *)uint64_t v64 = v66;
            uint64_t v67 = v6[10];
            int v68 = (char *)a1 + v67;
            uint64_t v69 = (char *)a2 + v67;
            uint64_t v70 = type metadata accessor for UUID(0LL);
            uint64_t v71 = *(void *)(v70 - 8);
            uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
            int v73 = v72(v68, 1LL, v70);
            int v74 = v72(v69, 1LL, v70);
            if (v73)
            {
              if (!v74)
              {
                (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v68, v69, v70);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0LL, 1LL, v70);
                goto LABEL_20;
              }
            }

            else
            {
              if (!v74)
              {
                (*(void (**)(char *, char *, uint64_t))(v71 + 24))(v68, v69, v70);
                goto LABEL_20;
              }

              (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
            }

            size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v13 = (uint64_t *)v68;
            unint64_t v14 = (uint64_t *)v69;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v56)
          {
            uint64_t v75 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 24LL))(v50, v51, v75);
            goto LABEL_31;
          }

          sub_100043F40((uint64_t)v50, &qword_1002B9A70);
        }

        uint64_t v58 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v50, v51, *(void *)(*(void *)(v58 - 8) + 64LL));
        goto LABEL_31;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }

  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }

  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    uint64_t v17 = *a2;
    sub_10003AA88(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }

  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3LL, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64LL));
  }

  else
  {
    uint64_t v24 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 3LL, v21);
  }

  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = type metadata accessor for UUID(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36))
  {
    uint64_t v38 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0LL, 1LL, v36);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_20:
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v39 = a3[6];
  uint64_t v40 = (uint64_t *)((char *)a1 + v39);
  uint64_t v41 = (uint64_t *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[7];
  unsigned __int8 v43 = (uint64_t *)((char *)a1 + v42);
  char v44 = (uint64_t *)((char *)a2 + v42);
  *unsigned __int8 v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentRequest.Remove(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    __int128 v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3LL, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
    }

    else
    {
      uint64_t v16 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32LL))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 3LL, v13);
    }

    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    _BYTE v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = type metadata accessor for UUID(0LL);
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26))
    {
      uint64_t v28 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0LL, 1LL, v26);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v29 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_OWORD *)((char *)a1 + v29) = *(_OWORD *)((char *)a2 + v29);
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  return a1;
}

uint64_t *assignWithTake for PurchaseIntentRequest.Remove(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v21 = a1[1];
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v47 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003A9EC(v47, v21);
LABEL_20:
        uint64_t v48 = a2[3];
        a1[2] = a2[2];
        a1[3] = v48;
        swift_bridgeObjectRelease();
        uint64_t v49 = a2[5];
        a1[4] = a2[4];
        a1[5] = v49;
        swift_bridgeObjectRelease();
        uint64_t v50 = v6[7];
        uint64_t v51 = (char *)a1 + v50;
        uint64_t v52 = (char *)a2 + v50;
        uint64_t v53 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v54 = *(void *)(v53 - 8);
        int v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
        int v56 = v55(v51, 3LL, v53);
        int v57 = v55(v52, 3LL, v53);
        if (v56)
        {
          if (!v57)
          {
            uint64_t v58 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32LL))(v51, v52, v58);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0LL, 3LL, v53);
LABEL_26:
            uint64_t v60 = v6[8];
            uint64_t v61 = (char *)a1 + v60;
            uint64_t v62 = (char *)a2 + v60;
            *(void *)uint64_t v61 = *(void *)v62;
            v61[8] = v62[8];
            uint64_t v63 = v6[9];
            uint64_t v64 = (char *)a1 + v63;
            uint64_t v65 = (char *)a2 + v63;
            v64[8] = v65[8];
            *(void *)uint64_t v64 = *(void *)v65;
            uint64_t v66 = v6[10];
            uint64_t v67 = (char *)a1 + v66;
            int v68 = (char *)a2 + v66;
            uint64_t v69 = type metadata accessor for UUID(0LL);
            uint64_t v70 = *(void *)(v69 - 8);
            uint64_t v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
            int v72 = v71(v67, 1LL, v69);
            int v73 = v71(v68, 1LL, v69);
            if (v72)
            {
              if (!v73)
              {
                (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v67, v68, v69);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v67, 0LL, 1LL, v69);
                goto LABEL_18;
              }
            }

            else
            {
              if (!v73)
              {
                (*(void (**)(char *, char *, uint64_t))(v70 + 40))(v67, v68, v69);
                goto LABEL_18;
              }

              (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v69);
            }

            size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v19 = (uint64_t *)v67;
            uint64_t v20 = (uint64_t *)v68;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v57)
          {
            uint64_t v74 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 40LL))(v51, v52, v74);
            goto LABEL_26;
          }

          sub_100043F40((uint64_t)v51, &qword_1002B9A70);
        }

        uint64_t v59 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v51, v52, *(void *)(*(void *)(v59 - 8) + 64LL));
        goto LABEL_26;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }

  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }

  __int128 v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3LL, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    uint64_t v23 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32LL))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 3LL, v15);
  }

  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = type metadata accessor for UUID(0LL);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1LL, v33))
  {
    uint64_t v35 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0LL, 1LL, v33);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_18:
  uint64_t v36 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  uint64_t v37 = (uint64_t *)((char *)a1 + v36);
  uint64_t v38 = (uint64_t *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[7];
  uint64_t v42 = (uint64_t *)((char *)a1 + v41);
  unsigned __int8 v43 = (uint64_t *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001E61C4);
}

uint64_t sub_1001E61C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002BA218);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Remove( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001E6254);
}

uint64_t sub_1001E6254(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000175B0(&qword_1002BA218);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1001E62D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001E62E8(a1, a2, a3, (uint64_t (*)(uint64_t))sub_1001D8904, (uint64_t)&unk_100210518);
}

uint64_t sub_1001E62E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t result = a4(319LL);
  if (v8 <= 0x3F)
  {
    v9[0] = *(void *)(result - 8) + 64LL;
    v9[1] = &unk_1002104E0;
    v9[2] = &unk_1002104F8;
    v9[3] = a5;
    swift_initStructMetadata(a1, 256LL, 4LL, v9, a1 + 16);
    return 0LL;
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Query(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for Date(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    int v10 = (void *)((char *)a2 + v8);
    __int128 v11 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v12 = *((void *)v11 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v12 + 48))(v10, 1LL, v11))
    {
      uint64_t v13 = sub_1000175B0(&qword_1002BA218);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      unint64_t v15 = v10[1];
      if (v15 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      }

      else
      {
        unint64_t v16 = *v10;
        sub_10003AA88(*v10, v10[1]);
        *uint64_t v9 = v16;
        v9[1] = v15;
      }

      unint64_t v17 = v10[3];
      v9[2] = v10[2];
      v9[3] = v17;
      unint64_t v18 = v10[5];
      void v9[4] = v10[4];
      v9[5] = v18;
      uint64_t v19 = v11[7];
      __dst = (char *)v9 + v19;
      uint64_t v20 = (char *)v10 + v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3LL, v21))
      {
        uint64_t v23 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64LL));
      }

      else
      {
        uint64_t v24 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16LL))(__dst, v20, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0LL, 3LL, v21);
      }

      uint64_t v25 = v11[8];
      uint64_t v26 = (char *)v9 + v25;
      uint64_t v27 = (char *)v10 + v25;
      *(void *)uint64_t v26 = *(void *)v27;
      v26[8] = v27[8];
      uint64_t v28 = v11[9];
      uint64_t v29 = (char *)v9 + v28;
      uint64_t v30 = (char *)v10 + v28;
      v29[8] = v30[8];
      *(void *)uint64_t v29 = *(void *)v30;
      uint64_t v31 = v11[10];
      uint64_t v32 = (char *)v9 + v31;
      uint64_t v33 = (char *)v10 + v31;
      uint64_t v34 = type metadata accessor for UUID(0LL);
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1LL, v34))
      {
        uint64_t v36 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0LL, 1LL, v34);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v12 + 56))(v9, 0LL, 1LL, v11);
    }

    uint64_t v37 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    uint64_t v38 = (void *)((char *)a1 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t destroy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  int v5 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v6 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(v5, 1LL, v6))
  {
    unint64_t v7 = v5[1];
    if (v7 >> 60 != 15) {
      sub_10003A9EC(*v5, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = (char *)v5 + *(int *)(v6 + 28);
    uint64_t v9 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48LL))(v8, 3LL, v9))
    {
      uint64_t v10 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL))(v8, v10);
    }

    __int128 v11 = (char *)v5 + *(int *)(v6 + 40);
    uint64_t v12 = type metadata accessor for UUID(0LL);
    uint64_t v13 = *(void *)(v12 - 8);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (unint64_t *)(a1 + v7);
  uint64_t v9 = (unint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v11 + 48))(v9, 1LL, v10))
  {
    uint64_t v12 = sub_1000175B0(&qword_1002BA218);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    unint64_t v13 = v9[1];
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    }

    else
    {
      unint64_t v14 = *v9;
      sub_10003AA88(*v9, v9[1]);
      *uint64_t v8 = v14;
      v8[1] = v13;
    }

    unint64_t v15 = v9[3];
    __int128 v8[2] = v9[2];
    v8[3] = v15;
    unint64_t v16 = v9[5];
    v8[4] = v9[4];
    v8[5] = v16;
    uint64_t v17 = v10[7];
    __dst = (char *)v8 + v17;
    unint64_t v18 = (char *)v9 + v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 3LL, v19))
    {
      uint64_t v21 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64LL));
    }

    else
    {
      uint64_t v22 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16LL))(__dst, v18, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0LL, 3LL, v19);
    }

    uint64_t v23 = v10[8];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    *(void *)uint64_t v24 = *(void *)v25;
    _BYTE v24[8] = v25[8];
    uint64_t v26 = v10[9];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    v27[8] = v28[8];
    *(void *)uint64_t v27 = *(void *)v28;
    uint64_t v29 = v10[10];
    uint64_t v30 = (char *)v8 + v29;
    uint64_t v31 = (char *)v9 + v29;
    uint64_t v32 = type metadata accessor for UUID(0LL);
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1LL, v32))
    {
      uint64_t v34 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0LL, 1LL, v32);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  uint64_t v35 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1LL, v10);
  int v14 = v12(v9, 1LL, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1000A77B0((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v17 = v9[1];
    uint64_t v78 = a3;
    if ((unint64_t)v8[1] >> 60 == 15)
    {
      if (v17 >> 60 != 15)
      {
        uint64_t v18 = *v9;
        sub_10003AA88(*v9, v17);
        *uint64_t v8 = v18;
        v8[1] = v17;
        goto LABEL_23;
      }
    }

    else
    {
      if (v17 >> 60 != 15)
      {
        uint64_t v41 = *v9;
        sub_10003AA88(*v9, v17);
        uint64_t v42 = *v8;
        unint64_t v43 = v8[1];
        *uint64_t v8 = v41;
        v8[1] = v17;
        sub_10003A9EC(v42, v43);
LABEL_23:
        __int128 v8[2] = v9[2];
        v8[3] = v9[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v8[4] = v9[4];
        v8[5] = v9[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v44 = v10[7];
        uint64_t v45 = (char *)v8 + v44;
        uint64_t v46 = (char *)v9 + v44;
        uint64_t v47 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v48 = *(void *)(v47 - 8);
        uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
        uint64_t v76 = (uint64_t)v45;
        LODWORD(v45) = v49(v45, 3LL, v47);
        int v50 = v49(v46, 3LL, v47);
        if ((_DWORD)v45)
        {
          if (v50)
          {
            size_t v51 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v52 = (void *)v76;
LABEL_28:
            memcpy(v52, v46, v51);
            goto LABEL_31;
          }

          uint64_t v53 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v53 - 8) + 16LL))(v76, v46, v53);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v76, 0LL, 3LL, v47);
        }

        else
        {
          if (v50)
          {
            sub_100043F40(v76, &qword_1002B9A70);
            size_t v51 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v52 = (void *)v76;
            goto LABEL_28;
          }

          uint64_t v54 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v54 - 8) + 24LL))(v76, v46, v54);
        }

uint64_t initializeWithTake for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v11 + 48))(v9, 1LL, v10))
  {
    uint64_t v12 = sub_1000175B0(&qword_1002BA218);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    __int128 v13 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v13;
    __int128 v8[2] = v9[2];
    uint64_t v14 = v10[7];
    __dst = (char *)v8 + v14;
    unint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3LL, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))(__dst, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0LL, 3LL, v16);
    }

    uint64_t v20 = v10[8];
    uint64_t v21 = (char *)v8 + v20;
    uint64_t v22 = (char *)v9 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = v10[9];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    _BYTE v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v10[10];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    uint64_t v29 = type metadata accessor for UUID(0LL);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1LL, v29))
    {
      uint64_t v31 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0LL, 1LL, v29);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  uint64_t v32 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v32) = *(_OWORD *)(a2 + v32);
  return a1;
}

uint64_t assignWithTake for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1LL, v10);
  int v14 = v12(v9, 1LL, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1000A77B0((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v23 = v8[1];
    uint64_t v75 = a3;
    if (v23 >> 60 != 15)
    {
      unint64_t v24 = v9[1];
      if (v24 >> 60 != 15)
      {
        uint64_t v38 = *v8;
        *uint64_t v8 = *v9;
        v8[1] = v24;
        sub_10003A9EC(v38, v23);
LABEL_18:
        uint64_t v39 = v9[3];
        __int128 v8[2] = v9[2];
        v8[3] = v39;
        swift_bridgeObjectRelease();
        uint64_t v40 = v9[5];
        v8[4] = v9[4];
        v8[5] = v40;
        swift_bridgeObjectRelease();
        uint64_t v41 = v10[7];
        uint64_t v42 = (char *)v8 + v41;
        unint64_t v43 = (char *)v9 + v41;
        uint64_t v44 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v45 = *(void *)(v44 - 8);
        uint64_t v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
        uint64_t v73 = (uint64_t)v42;
        LODWORD(v42) = v46(v42, 3LL, v44);
        int v47 = v46(v43, 3LL, v44);
        if ((_DWORD)v42)
        {
          if (v47)
          {
            size_t v48 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v49 = (void *)v73;
LABEL_23:
            memcpy(v49, v43, v48);
            goto LABEL_26;
          }

          uint64_t v50 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v50 - 8) + 32LL))(v73, v43, v50);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v73, 0LL, 3LL, v44);
        }

        else
        {
          if (v47)
          {
            sub_100043F40(v73, &qword_1002B9A70);
            size_t v48 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0LL) - 8) + 64LL);
            uint64_t v49 = (void *)v73;
            goto LABEL_23;
          }

          uint64_t v51 = type metadata accessor for URL(0LL);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v51 - 8) + 40LL))(v73, v43, v51);
        }

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001E7734);
}

uint64_t sub_1001E7734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
    return v9(v10, a2, v8);
  }

  uint64_t v11 = sub_1000175B0(&qword_1002BA218);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }

  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Query( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001E77F0);
}

uint64_t sub_1001E77F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
    return v11(v12, a2, a2, v10);
  }

  uint64_t result = sub_1000175B0(&qword_1002BA218);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }

  *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

void sub_1001E789C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_1001D8904(319LL);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      _OWORD v6[2] = &unk_1002104E0;
      v6[3] = &unk_1002104F8;
      swift_initStructMetadata(a1, 256LL, 4LL, v6, a1 + 16);
    }
  }

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Query.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Query.CodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Remove.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Remove.CodingKeys;
}

uint64_t _s15StoreKit_Shared21PurchaseIntentRequestO5QueryV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1001E79A4 + 4 * byte_100210211[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001E79D8 + 4 * byte_10021020C[v4]))();
}

uint64_t sub_1001E79D8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E79E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E79E8LL);
  }
  return result;
}

uint64_t sub_1001E79F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E79FCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1001E7A00(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E7A08(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Add.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Add.CodingKeys;
}

uint64_t _s15StoreKit_Shared21PurchaseIntentRequestO4KindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001E7A70 + 4 * byte_10021021B[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001E7AA4 + 4 * byte_100210216[v4]))();
}

uint64_t sub_1001E7AA4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E7AAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E7AB4LL);
  }
  return result;
}

uint64_t sub_1001E7AC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E7AC8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1001E7ACC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E7AD4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.CodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.AllCodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.ClientCodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys;
}

unint64_t sub_1001E7B14()
{
  unint64_t result = qword_1002BAB30;
  if (!qword_1002BAB30)
  {
    unint64_t result = swift_getWitnessTable(byte_100210694, &type metadata for PurchaseIntentRequest.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB30);
  }

  return result;
}

unint64_t sub_1001E7B5C()
{
  unint64_t result = qword_1002BAB38;
  if (!qword_1002BAB38)
  {
    unint64_t result = swift_getWitnessTable(byte_10021074C, &type metadata for PurchaseIntentRequest.Add.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB38);
  }

  return result;
}

unint64_t sub_1001E7BA4()
{
  unint64_t result = qword_1002BAB40;
  if (!qword_1002BAB40)
  {
    unint64_t result = swift_getWitnessTable("E>\b", &type metadata for PurchaseIntentRequest.Remove.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB40);
  }

  return result;
}

unint64_t sub_1001E7BEC()
{
  unint64_t result = qword_1002BAB48;
  if (!qword_1002BAB48)
  {
    unint64_t result = swift_getWitnessTable(byte_1002108BC, &type metadata for PurchaseIntentRequest.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB48);
  }

  return result;
}

unint64_t sub_1001E7C34()
{
  unint64_t result = qword_1002BAB50;
  if (!qword_1002BAB50)
  {
    unint64_t result = swift_getWitnessTable(byte_10021082C, &type metadata for PurchaseIntentRequest.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB50);
  }

  return result;
}

unint64_t sub_1001E7C7C()
{
  unint64_t result = qword_1002BAB58;
  if (!qword_1002BAB58)
  {
    unint64_t result = swift_getWitnessTable("}>\b", &type metadata for PurchaseIntentRequest.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB58);
  }

  return result;
}

unint64_t sub_1001E7CC4()
{
  unint64_t result = qword_1002BAB60;
  if (!qword_1002BAB60)
  {
    unint64_t result = swift_getWitnessTable("M?\b", &type metadata for PurchaseIntentRequest.Remove.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB60);
  }

  return result;
}

unint64_t sub_1001E7D0C()
{
  unint64_t result = qword_1002BAB68;
  if (!qword_1002BAB68)
  {
    unint64_t result = swift_getWitnessTable("5?\b", &type metadata for PurchaseIntentRequest.Remove.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB68);
  }

  return result;
}

unint64_t sub_1001E7D54()
{
  unint64_t result = qword_1002BAB70;
  if (!qword_1002BAB70)
  {
    unint64_t result = swift_getWitnessTable(byte_1002106BC, &type metadata for PurchaseIntentRequest.Add.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB70);
  }

  return result;
}

unint64_t sub_1001E7D9C()
{
  unint64_t result = qword_1002BAB78;
  if (!qword_1002BAB78)
  {
    unint64_t result = swift_getWitnessTable(byte_1002106E4, &type metadata for PurchaseIntentRequest.Add.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB78);
  }

  return result;
}

unint64_t sub_1001E7DE4()
{
  unint64_t result = qword_1002BAB80;
  if (!qword_1002BAB80)
  {
    unint64_t result = swift_getWitnessTable("\rA\b", &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB80);
  }

  return result;
}

unint64_t sub_1001E7E2C()
{
  unint64_t result = qword_1002BAB88;
  if (!qword_1002BAB88)
  {
    unint64_t result = swift_getWitnessTable(byte_1002105DC, &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB88);
  }

  return result;
}

unint64_t sub_1001E7E74()
{
  unint64_t result = qword_1002BAB90;
  if (!qword_1002BAB90)
  {
    unint64_t result = swift_getWitnessTable("]A\b", &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB90);
  }

  return result;
}

unint64_t sub_1001E7EBC()
{
  unint64_t result = qword_1002BAB98;
  if (!qword_1002BAB98)
  {
    unint64_t result = swift_getWitnessTable("EA\b", &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAB98);
  }

  return result;
}

unint64_t sub_1001E7F04()
{
  unint64_t result = qword_1002BABA0;
  if (!qword_1002BABA0)
  {
    unint64_t result = swift_getWitnessTable(byte_100210604, &type metadata for PurchaseIntentRequest.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BABA0);
  }

  return result;
}

unint64_t sub_1001E7F4C()
{
  unint64_t result = qword_1002BABA8;
  if (!qword_1002BABA8)
  {
    unint64_t result = swift_getWitnessTable(byte_10021062C, &type metadata for PurchaseIntentRequest.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BABA8);
  }

  return result;
}

uint64_t sub_1001E7F90(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x746E65746E69LL && a2 == 0xE600000000000000LL)
  {
    unint64_t v5 = 0xE600000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x746E65746E69LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x704168636E75616CLL && a2 == 0xE900000000000070LL)
  {
    unint64_t v7 = 0xE900000000000070LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x704168636E75616CLL, 0xE900000000000070LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x796669746F6ELL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x796669746F6ELL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_1001E813C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v5 = 0xEE00656469727265LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v7 = 0xE400000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    unint64_t v8 = 0xE600000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x49746375646F7270LL && a2 == 0xE900000000000044LL)
  {
    swift_bridgeObjectRelease(0xE900000000000044LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x49746375646F7270LL, 0xE900000000000044LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_1001E830C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x7265746661LL && a2 == 0xE500000000000000LL)
  {
    unint64_t v5 = 0xE500000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7265746661LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v7 = 0xEE00656469727265LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v8 = 0xE400000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 3LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t StorefrontRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StorefrontRequest(0LL) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for StorefrontRequest(uint64_t a1)
{
  uint64_t result = qword_1002BAC50;
  if (!qword_1002BAC50) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StorefrontRequest);
  }
  return result;
}

uint64_t StorefrontRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StorefrontRequest(0LL) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StorefrontRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t StorefrontRequest.init(clientOverride:logKey:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = type metadata accessor for StorefrontRequest(0LL);
  unint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *unint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_1001E85F4()
{
  if (*v0) {
    return 0x79654B676F6CLL;
  }
  else {
    return 0x764F746E65696C63LL;
  }
}

uint64_t sub_1001E8638@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001EA0C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001E865C(uint64_t a1)
{
  unint64_t v2 = sub_1001E8800();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001E8684(uint64_t a1)
{
  unint64_t v2 = sub_1001E8800();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t StorefrontRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BABC8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001E8800();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for StorefrontRequest.CodingKeys,  &type metadata for StorefrontRequest.CodingKeys,  v11,  v9,  v10);
  char v20 = 0;
  uint64_t v12 = type metadata accessor for ClientOverride(0LL);
  uint64_t v13 = sub_1000221A8( &qword_1002BA240,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v3, &v20, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = (uint64_t *)(v3 + *(int *)(type metadata accessor for StorefrontRequest(0LL) + 20));
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    char v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16, &v19, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1001E8800()
{
  unint64_t result = qword_1002BABD0;
  if (!qword_1002BABD0)
  {
    unint64_t result = swift_getWitnessTable(byte_100210CF4, &type metadata for StorefrontRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BABD0);
  }

  return result;
}

uint64_t StorefrontRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v4 = sub_1000175B0(&qword_1002BA218);
  __chkstk_darwin(v4);
  uint64_t v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = sub_1000175B0(&qword_1002BABD8);
  uint64_t v6 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for StorefrontRequest(0LL);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_100019F58(a1, v12);
  unint64_t v14 = sub_1001E8800();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for StorefrontRequest.CodingKeys,  &type metadata for StorefrontRequest.CodingKeys,  v14,  v12,  v13);
  if (v2) {
    return sub_100019F7C(a1);
  }
  uint64_t v27 = v9;
  uint64_t v15 = v6;
  uint64_t v16 = (uint64_t)v11;
  uint64_t v17 = v28;
  uint64_t v18 = type metadata accessor for ClientOverride(0LL);
  char v32 = 0;
  uint64_t v19 = sub_1000221A8( &qword_1002BA250,  type metadata accessor for ClientOverride,  (uint64_t)&protocol conformance descriptor for ClientOverride);
  uint64_t v21 = (uint64_t)v29;
  uint64_t v20 = v30;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v18, &v32, v30, v18, v19);
  sub_1001D8D90(v21, v16);
  char v31 = 1;
  uint64_t v22 = KeyedDecodingContainer.decode(_:forKey:)(&v31, v20);
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v20);
  uint64_t v25 = (uint64_t *)(v16 + *(int *)(v27 + 20));
  uint64_t *v25 = v22;
  v25[1] = v24;
  sub_1001E8AB8(v16, v17);
  sub_100019F7C(a1);
  return sub_1000A77B0(v16, type metadata accessor for StorefrontRequest);
}

uint64_t sub_1001E8AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorefrontRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001E8AFC(uint64_t a1)
{
  uint64_t result = sub_1000221A8(&qword_1002BABE0, type metadata accessor for StorefrontRequest, (uint64_t)&unk_100210B68);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001E8B38(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1000221A8( &qword_1002BABE8,  type metadata accessor for StorefrontRequest,  (uint64_t)&protocol conformance descriptor for StorefrontRequest);
  uint64_t result = sub_1000221A8( &qword_1002BABF0,  type metadata accessor for StorefrontRequest,  (uint64_t)&protocol conformance descriptor for StorefrontRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1001E8B94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StorefrontRequest.init(from:)(a1, a2);
}

uint64_t sub_1001E8BA8(void *a1)
{
  return StorefrontRequest.encode(to:)(a1);
}

unint64_t *initializeBufferWithCopyOfBuffer for StorefrontRequest( unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0LL);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1LL, v7))
    {
      uint64_t v9 = sub_1000175B0(&qword_1002BA218);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    }

    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }

      else
      {
        unint64_t v12 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }

      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1000175B0(&qword_1002B9A70);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3LL, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64LL));
      }

      else
      {
        uint64_t v21 = type metadata accessor for URL(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0LL, 3LL, v18);
      }

      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      _BYTE v23[8] = v24[8];
      uint64_t v25 = v7[9];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      uint64_t v31 = type metadata accessor for UUID(0LL);
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1LL, v31))
      {
        uint64_t v33 = sub_1000175B0(&qword_1002B9B18);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0LL, 1LL, v31);
      }

      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0LL, 1LL, v7);
    }

    uint64_t v34 = *(int *)(a3 + 20);
    uint64_t v35 = (unint64_t *)((char *)a1 + v34);
    uint64_t v36 = (unint64_t *)((char *)a2 + v34);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t destroy for StorefrontRequest(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for ClientOverride(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(a1, 1LL, v2))
  {
    unint64_t v3 = a1[1];
    if (v3 >> 60 != 15) {
      sub_10003A9EC(*a1, v3);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_1000175B0(&qword_1002B9A70);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48LL))(v4, 3LL, v5))
    {
      uint64_t v6 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
    }

    uint64_t v7 = (char *)a1 + *(int *)(v2 + 40);
    uint64_t v8 = type metadata accessor for UUID(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
  }

  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for StorefrontRequest( unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }

    else
    {
      unint64_t v10 = *a2;
      sub_10003AA88(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }

    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3LL, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      uint64_t v19 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 3LL, v16);
    }

    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    _BYTE v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    _BYTE v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = type metadata accessor for UUID(0LL);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1LL, v29))
    {
      uint64_t v31 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0LL, 1LL, v29);
    }

    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = (unint64_t *)((char *)a1 + v32);
  uint64_t v34 = (unint64_t *)((char *)a2 + v32);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for StorefrontRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v15 = a2[1];
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_10003AA88(*a2, a2[1]);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }

    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v43 = *a2;
        sub_10003AA88(*a2, a2[1]);
        uint64_t v44 = *a1;
        unint64_t v45 = a1[1];
        *a1 = v43;
        a1[1] = v15;
        sub_10003A9EC(v44, v45);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v46 = v6[7];
        int v47 = (char *)a1 + v46;
        size_t v48 = (char *)a2 + v46;
        uint64_t v49 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v50 = *(void *)(v49 - 8);
        uint64_t v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 48);
        int v52 = v51(v47, 3LL, v49);
        int v53 = v51(v48, 3LL, v49);
        if (v52)
        {
          if (!v53)
          {
            uint64_t v54 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16LL))(v47, v48, v54);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0LL, 3LL, v49);
LABEL_31:
            uint64_t v56 = v6[8];
            int v57 = (char *)a1 + v56;
            uint64_t v58 = (char *)a2 + v56;
            uint64_t v59 = *(void *)v58;
            v57[8] = v58[8];
            *(void *)int v57 = v59;
            uint64_t v60 = v6[9];
            uint64_t v61 = (char *)a1 + v60;
            uint64_t v62 = (char *)a2 + v60;
            uint64_t v63 = *(void *)v62;
            v61[8] = v62[8];
            *(void *)uint64_t v61 = v63;
            uint64_t v64 = v6[10];
            int v65 = (char *)a1 + v64;
            uint64_t v66 = (char *)a2 + v64;
            uint64_t v67 = type metadata accessor for UUID(0LL);
            uint64_t v68 = *(void *)(v67 - 8);
            int v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v68 + 48);
            int v70 = v69(v65, 1LL, v67);
            int v71 = v69(v66, 1LL, v67);
            if (v70)
            {
              if (!v71)
              {
                (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v65, v66, v67);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v65, 0LL, 1LL, v67);
                goto LABEL_20;
              }
            }

            else
            {
              if (!v71)
              {
                (*(void (**)(char *, char *, uint64_t))(v68 + 24))(v65, v66, v67);
                goto LABEL_20;
              }

              (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v67);
            }

            size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v13 = (uint64_t *)v65;
            unint64_t v14 = (uint64_t *)v66;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v53)
          {
            uint64_t v72 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 24LL))(v47, v48, v72);
            goto LABEL_31;
          }

          sub_100043F40((uint64_t)v47, &qword_1002B9A70);
        }

        uint64_t v55 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v47, v48, *(void *)(*(void *)(v55 - 8) + 64LL));
        goto LABEL_31;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }

  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }

  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    uint64_t v17 = *a2;
    sub_10003AA88(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }

  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3LL, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64LL));
  }

  else
  {
    uint64_t v24 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 3LL, v21);
  }

  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = type metadata accessor for UUID(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36))
  {
    uint64_t v38 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0LL, 1LL, v36);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_20:
  uint64_t v39 = *(int *)(a3 + 20);
  uint64_t v40 = (uint64_t *)((char *)a1 + v39);
  uint64_t v41 = (uint64_t *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for StorefrontRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_1000175B0(&qword_1002BA218);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    __int128 v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_1000175B0(&qword_1002B9A70);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3LL, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0LL);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
    }

    else
    {
      uint64_t v16 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32LL))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 3LL, v13);
    }

    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    _BYTE v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = type metadata accessor for UUID(0LL);
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26))
    {
      uint64_t v28 = sub_1000175B0(&qword_1002B9B18);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0LL, 1LL, v26);
    }

    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t *assignWithTake for StorefrontRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1000A77B0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }

    unint64_t v21 = a1[1];
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v42 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003A9EC(v42, v21);
LABEL_20:
        uint64_t v43 = a2[3];
        a1[2] = a2[2];
        a1[3] = v43;
        swift_bridgeObjectRelease();
        uint64_t v44 = a2[5];
        a1[4] = a2[4];
        a1[5] = v44;
        swift_bridgeObjectRelease();
        uint64_t v45 = v6[7];
        uint64_t v46 = (char *)a1 + v45;
        int v47 = (char *)a2 + v45;
        uint64_t v48 = sub_1000175B0(&qword_1002B9A70);
        uint64_t v49 = *(void *)(v48 - 8);
        uint64_t v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
        int v51 = v50(v46, 3LL, v48);
        int v52 = v50(v47, 3LL, v48);
        if (v51)
        {
          if (!v52)
          {
            uint64_t v53 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 32LL))(v46, v47, v53);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0LL, 3LL, v48);
LABEL_26:
            uint64_t v55 = v6[8];
            uint64_t v56 = (char *)a1 + v55;
            int v57 = (char *)a2 + v55;
            *(void *)uint64_t v56 = *(void *)v57;
            v56[8] = v57[8];
            uint64_t v58 = v6[9];
            uint64_t v59 = (char *)a1 + v58;
            uint64_t v60 = (char *)a2 + v58;
            v59[8] = v60[8];
            *(void *)uint64_t v59 = *(void *)v60;
            uint64_t v61 = v6[10];
            uint64_t v62 = (char *)a1 + v61;
            uint64_t v63 = (char *)a2 + v61;
            uint64_t v64 = type metadata accessor for UUID(0LL);
            uint64_t v65 = *(void *)(v64 - 8);
            uint64_t v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 48);
            int v67 = v66(v62, 1LL, v64);
            int v68 = v66(v63, 1LL, v64);
            if (v67)
            {
              if (!v68)
              {
                (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v62, v63, v64);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v62, 0LL, 1LL, v64);
                goto LABEL_18;
              }
            }

            else
            {
              if (!v68)
              {
                (*(void (**)(char *, char *, uint64_t))(v65 + 40))(v62, v63, v64);
                goto LABEL_18;
              }

              (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v64);
            }

            size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002B9B18) - 8) + 64LL);
            uint64_t v19 = (uint64_t *)v62;
            uint64_t v20 = (uint64_t *)v63;
            goto LABEL_8;
          }
        }

        else
        {
          if (!v52)
          {
            uint64_t v69 = type metadata accessor for URL(0LL);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 40LL))(v46, v47, v69);
            goto LABEL_26;
          }

          sub_100043F40((uint64_t)v46, &qword_1002B9A70);
        }

        uint64_t v54 = type metadata accessor for ClientOverride.Server(0LL);
        memcpy(v46, v47, *(void *)(*(void *)(v54 - 8) + 64LL));
        goto LABEL_26;
      }

      sub_100047E84((uint64_t)a1);
    }

    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }

  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_1000175B0(&qword_1002BA218) - 8) + 64LL);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }

  __int128 v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1000175B0(&qword_1002B9A70);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3LL, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0LL);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    uint64_t v23 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32LL))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 3LL, v15);
  }

  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = type metadata accessor for UUID(0LL);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1LL, v33))
  {
    uint64_t v35 = sub_1000175B0(&qword_1002B9B18);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0LL, 1LL, v33);
  }

  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
LABEL_18:
  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = (uint64_t *)((char *)a1 + v36);
  uint64_t v38 = (uint64_t *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001E9DA4);
}

uint64_t sub_1001E9DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000175B0(&qword_1002BA218);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for StorefrontRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001E9E34);
}

uint64_t sub_1001E9E34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000175B0(&qword_1002BA218);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

void sub_1001E9EB4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = &unk_100210C18;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
  }

uint64_t storeEnumTagSinglePayload for StorefrontRequest.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001E9F70 + 4 * byte_100210B35[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001E9FA4 + 4 * asc_100210B30[v4]))();
}

uint64_t sub_1001E9FA4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E9FAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001E9FB4LL);
  }
  return result;
}

uint64_t sub_1001E9FC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001E9FC8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1001E9FCC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001E9FD4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StorefrontRequest.CodingKeys()
{
  return &type metadata for StorefrontRequest.CodingKeys;
}

unint64_t sub_1001E9FF4()
{
  unint64_t result = qword_1002BAC88;
  if (!qword_1002BAC88)
  {
    unint64_t result = swift_getWitnessTable(byte_100210CCC, &type metadata for StorefrontRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAC88);
  }

  return result;
}

unint64_t sub_1001EA03C()
{
  unint64_t result = qword_1002BAC90;
  if (!qword_1002BAC90)
  {
    unint64_t result = swift_getWitnessTable("%<\b", &type metadata for StorefrontRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAC90);
  }

  return result;
}

unint64_t sub_1001EA084()
{
  unint64_t result = qword_1002BAC98;
  if (!qword_1002BAC98)
  {
    unint64_t result = swift_getWitnessTable("\r<\b", &type metadata for StorefrontRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAC98);
  }

  return result;
}

uint64_t sub_1001EA0C8(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x764F746E65696C63LL && a2 == 0xEE00656469727265LL)
  {
    unint64_t v5 = 0xEE00656469727265LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x764F746E65696C63LL, 0xEE00656469727265LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x79654B676F6CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t StorefrontInternal.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StorefrontInternal(0LL) + 24);
  uint64_t v4 = type metadata accessor for Locale(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t type metadata accessor for StorefrontInternal(uint64_t a1)
{
  uint64_t result = qword_1002BAD20;
  if (!qword_1002BAD20) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StorefrontInternal);
  }
  return result;
}

uint64_t StorefrontInternal.init(id:countryCode:locale:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  char v7 = (char *)a6 + *(int *)(type metadata accessor for StorefrontInternal(0LL) + 24);
  uint64_t v8 = type metadata accessor for Locale(0LL);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v7, a5, v8);
}

uint64_t sub_1001EA2B0()
{
  uint64_t v1 = 0x437972746E756F63LL;
  if (*v0 != 1) {
    uint64_t v1 = 0x656C61636F6CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 25705LL;
  }
}

uint64_t sub_1001EA304@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1001EAF70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001EA328(uint64_t a1)
{
  unint64_t v2 = sub_1001EA840();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001EA350(uint64_t a1)
{
  unint64_t v2 = sub_1001EA840();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t StorefrontInternal.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000175B0(&qword_1002BACA0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100019F58(a1, v9);
  unint64_t v11 = sub_1001EA840();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for StorefrontInternal.CodingKeys,  &type metadata for StorefrontInternal.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v23 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v23, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v22, v5);
    uint64_t v16 = (char *)v3 + *(int *)(type metadata accessor for StorefrontInternal(0LL) + 24);
    char v21 = 2;
    uint64_t v17 = type metadata accessor for Locale(0LL);
    uint64_t v18 = sub_1001EA884(&qword_1002BACB0, (const char *)&protocol conformance descriptor for Locale);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v16, &v21, v5, v17, v18);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t StorefrontInternal.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v25 = type metadata accessor for Locale(0LL);
  uint64_t v23 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = sub_1000175B0(&qword_1002BACB8);
  uint64_t v6 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for StorefrontInternal(0LL);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v27 = a1;
  sub_100019F58(a1, v12);
  unint64_t v14 = sub_1001EA840();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for StorefrontInternal.CodingKeys,  &type metadata for StorefrontInternal.CodingKeys,  v14,  v12,  v13);
  if (v2) {
    return sub_100019F7C(v27);
  }
  uint64_t v22 = v9;
  uint64_t v15 = v6;
  uint64_t v16 = v5;
  uint64_t v18 = v25;
  uint64_t v17 = v26;
  char v30 = 0;
  *(void *)unint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)(&v30, v26);
  *((void *)v11 + 1) = v19;
  char v29 = 1;
  *((void *)v11 + 2) = KeyedDecodingContainer.decode(_:forKey:)(&v29, v17);
  *((void *)v11 + 3) = v20;
  char v28 = 2;
  sub_1001EA884(&qword_1002BACC0, (const char *)&protocol conformance descriptor for Locale);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v18, &v28, v17, v18);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v17);
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(&v11[*(int *)(v22 + 24)], v16, v18);
  sub_1001EA8C4((uint64_t)v11, v24);
  sub_100019F7C(v27);
  return sub_1001EA908((uint64_t)v11);
}

uint64_t sub_1001EA784@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StorefrontInternal.init(from:)(a1, a2);
}

uint64_t sub_1001EA798(void *a1)
{
  return StorefrontInternal.encode(to:)(a1);
}

uint64_t sub_1001EA7AC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t _s15StoreKit_Shared18StorefrontInternalV23__derived_struct_equalsySbAC_ACtFZ_0( uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  BOOL v7 = v4 == *a2 && v5 == v6;
  if (!v7 && (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0LL) & 1) == 0) {
    return 0LL;
  }
  uint64_t v8 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v10 = a2[2];
  uint64_t v11 = a2[3];
  BOOL v12 = v8 == v10 && v9 == v11;
  if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(v8, v9, v10, v11, 0LL) & 1) == 0) {
    return 0LL;
  }
  uint64_t v13 = *(int *)(type metadata accessor for StorefrontInternal(0LL) + 24);
  return static Locale.== infix(_:_:)((char *)a1 + v13, (char *)a2 + v13);
}

unint64_t sub_1001EA840()
{
  unint64_t result = qword_1002BACA8;
  if (!qword_1002BACA8)
  {
    unint64_t result = swift_getWitnessTable(byte_100210F14, &type metadata for StorefrontInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BACA8);
  }

  return result;
}

uint64_t sub_1001EA884(unint64_t *a1, const char *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for Locale(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1001EA8C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorefrontInternal(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001EA908(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StorefrontInternal(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_1001EA944()
{
  return &protocol witness table for String;
}

uint64_t *initializeBufferWithCopyOfBuffer for StorefrontInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v12);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for Locale(0LL);
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    v11(v8, v9, v10);
  }

  return v3;
}

uint64_t destroy for StorefrontInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Locale(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

void *initializeWithCopy for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Locale(0LL);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for StorefrontInternal(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
  return a1;
}

void *assignWithTake for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40LL))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001EAC5C);
}

uint64_t sub_1001EAC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for Locale(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 24),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for StorefrontInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001EACE4);
}

uint64_t sub_1001EACE4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Locale(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 24),  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_1001EAD58(uint64_t a1)
{
  v4[0] = &unk_100210E38;
  v4[1] = &unk_100210E38;
  uint64_t result = type metadata accessor for Locale(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for StorefrontInternal.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1001EAE18 + 4 * byte_100210D55[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001EAE4C + 4 * byte_100210D50[v4]))();
}

uint64_t sub_1001EAE4C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001EAE54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001EAE5CLL);
  }
  return result;
}

uint64_t sub_1001EAE68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001EAE70LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1001EAE74(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001EAE7C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StorefrontInternal.CodingKeys()
{
  return &type metadata for StorefrontInternal.CodingKeys;
}

unint64_t sub_1001EAE9C()
{
  unint64_t result = qword_1002BAD60;
  if (!qword_1002BAD60)
  {
    unint64_t result = swift_getWitnessTable(byte_100210EEC, &type metadata for StorefrontInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAD60);
  }

  return result;
}

unint64_t sub_1001EAEE4()
{
  unint64_t result = qword_1002BAD68;
  if (!qword_1002BAD68)
  {
    unint64_t result = swift_getWitnessTable("u;\b", &type metadata for StorefrontInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAD68);
  }

  return result;
}

unint64_t sub_1001EAF2C()
{
  unint64_t result = qword_1002BAD70;
  if (!qword_1002BAD70)
  {
    unint64_t result = swift_getWitnessTable("];\b", &type metadata for StorefrontInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002BAD70);
  }

  return result;
}

uint64_t sub_1001EAF70(uint64_t a1, unint64_t a2)
{
  if (a1 == 25705 && a2 == 0xE200000000000000LL)
  {
    unint64_t v5 = 0xE200000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(25705LL, 0xE200000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x437972746E756F63LL && a2 == 0xEB0000000065646FLL)
  {
    unint64_t v7 = 0xEB0000000065646FLL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x437972746E756F63LL, 0xEB0000000065646FLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 2LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656C61636F6CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

void sub_1001EB0BC()
{
}

void sub_1001EB0E4()
{
  __assert_rtn( "c_nio_http_parser_execute",  "c_nio_http_parser.c",  2143,  "((header_field_mark ? 1 : 0) + (header_value_mark ? 1 : 0) + (url_mark ? 1 : 0) + (body_mark ? 1 : 0) + (status_mark ? 1 : 0)) <= 1");
}

void sub_1001EB10C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2149, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB134()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2148, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB15C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2147, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB184()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2146, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB1AC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2145, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB1D4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 746, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB1FC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 788, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB224()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 914, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB24C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 920, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB274()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 970, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB29C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1080, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB2C4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1089, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB2EC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1389, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB314()
{
}

void sub_1001EB33C()
{
}

void sub_1001EB364()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1495, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB38C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1503, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB3B4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1794, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB3DC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1806, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB404()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1929, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB42C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1937, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB454()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1898, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB47C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1892, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB4A4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1977, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB4CC()
{
  __assert_rtn( "c_nio_http_parser_execute",  "c_nio_http_parser.c",  1954,  "parser->content_length != 0 && parser->content_length != ULLONG_MAX");
}

void sub_1001EB4F4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1993, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB51C()
{
}

void sub_1001EB544()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2002, "nread == 1");
}

void sub_1001EB56C()
{
}

void sub_1001EB594()
{
}

void sub_1001EB5BC()
{
}

void sub_1001EB5E4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2078, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB60C()
{
}

void sub_1001EB634()
{
  __assert_rtn( "c_nio_http_parser_execute",  "c_nio_http_parser.c",  2089,  "parser->content_length != 0 && parser->content_length != ULLONG_MAX");
}

void sub_1001EB65C()
{
}

void sub_1001EB684()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2110, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB6AC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2107, "parser->content_length == 0");
}

void sub_1001EB6D4()
{
}

void sub_1001EB6FC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2119, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_1001EB724()
{
}

void sub_1001EB74C()
{
}

void sub_1001EB774()
{
}

void sub_1001EB79C()
{
  __assert_rtn( "c_nio_http_parser_parse_url",  "c_nio_http_parser.c",  2531,  "(size_t) (off + len) <= buflen && Port number overflow");
}

void sub_1001EB7C4()
{
}

void sub_1001EB7EC()
{
}

void sub_1001EB84C()
{
}

void sub_1001EB8AC()
{
}

void sub_1001EB91C(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to determine container path error: %llu",  (uint8_t *)&v3,  0xCu);
  sub_1000078BC();
}

void sub_1001EB990()
{
}

void sub_1001EB9F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001EBA58( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001EBAC0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001EBB28(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)a1 + 8LL);
  unint64_t v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databasePath]);
  uint64_t v8 = *(void *)(a3 + 56);
  int v9 = 138543618;
  uint64_t v10 = v7;
  __int16 v11 = 2048;
  uint64_t v12 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Migrating %{public}@ to %llu failed!",  (uint8_t *)&v9,  0x16u);
}

void sub_1001EBBFC()
{
  __assert_rtn("CNIODarwin_CMSG_FIRSTHDR", "shim.c", 57, "mhdr != NULL");
}

void sub_1001EBC24()
{
  __assert_rtn("CNIODarwin_CMSG_NXTHDR", "shim.c", 62, "mhdr != NULL");
}

void sub_1001EBC4C()
{
  __assert_rtn("CNIODarwin_CMSG_NXTHDR", "shim.c", 63, "cmsg != NULL");
}

void sub_1001EBC74()
{
  __assert_rtn("CNIODarwin_CMSG_DATA", "shim.c", 68, "cmsg != NULL");
}

void sub_1001EBC9C()
{
  __assert_rtn("CNIODarwin_CMSG_DATA_MUTABLE", "shim.c", 73, "cmsg != NULL");
}

void sub_1001EBCC4(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 options]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 databasePath]);
  int v6 = 138543362;
  unint64_t v7 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Requring all stores to migrate after truncating corrupt database at: %{public}@",  (uint8_t *)&v6,  0xCu);
}

void sub_1001EBD80(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
}

void sub_1001EBDE4(uint64_t a1, void *a2)
{
  id v3 = sub_1000138C0(a1, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 databasePath]);
  sub_100013844( (void *)&_mh_execute_header,  v5,  v6,  "Connection taken down HARD, please call close before deallocating: %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_100013868();
}

void sub_1001EBE68(void *a1)
{
  id v2 = sub_1000138B8(a1);
  id v3 = sub_100011798(7u);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (sub_1000138DC(v4)) {
    sub_100013844( (void *)&_mh_execute_header,  v5,  v6,  "Encountered exception while executing query: %{public}@",  v7,  v8,  v9,  v10,  2u);
  }

  objc_end_catch();
  sub_100013868();
}

void sub_1001EBEFC(void *a1)
{
  id v2 = objc_begin_catch(a1);
  id v3 = sub_100011798(7u);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (sub_1000138DC(v4)) {
    sub_100013844( (void *)&_mh_execute_header,  v5,  v6,  "Encountered exception while in transaction: %{public}@",  v7,  v8,  v9,  v10,  2u);
  }

  objc_end_catch();
  sub_100013868();
}

void sub_1001EBF9C(uint64_t a1, void *a2)
{
  id v3 = sub_1000138C0(a1, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 databasePath]);
  sub_100013844( (void *)&_mh_execute_header,  v5,  v6,  "Can't define application function since the connection is not open: %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_100013868();
}

void sub_1001EC020( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001EC054(uint64_t a1, void *a2)
{
  id v3 = (os_log_s *)sub_1000138C0(a1, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 databasePath]);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Can't remove client function since the connection is not open: %{public}@",  (uint8_t *)&v5,  0xCu);

  sub_100013868();
}

void sub_1001EC0E8(void *a1)
{
  id v3 = sub_1000138B8(a1);
  int v5 = (void *)sub_1000138AC((uint64_t)v3, v4);
  sub_1000138A0(v5);
  id v6 = [(id)sub_1000138E8() databasePath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100013888();
  sub_100013874( (void *)&_mh_execute_header,  v8,  v9,  "[%@]: Asking delegate to reset database after corruption: %{public}@",  v10,  v11,  v12,  v13,  v14);

  sub_100013858();
}

void sub_1001EC178(void *a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)sub_1000138B8(a1);
  id v6 = (void *)objc_opt_class(a2, v5);
  id v7 = v6;
  id v8 = [(id)sub_1000138E8() databasePath];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int v10 = 138412546;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[%@]: Truncating database after corruption: %{public}@",  (uint8_t *)&v10,  0x16u);

  sub_100013858();
}

void sub_1001EC23C(void *a1)
{
  id v3 = sub_1000138B8(a1);
  uint64_t v5 = (void *)sub_1000138AC((uint64_t)v3, v4);
  sub_1000138A0(v5);
  id v6 = [(id)sub_1000138E8() databasePath];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100013888();
  sub_100013874( (void *)&_mh_execute_header,  v8,  v9,  "[%@]: Asking delegate to reset database after reopen: %{public}@",  v10,  v11,  v12,  v13,  v14);

  sub_100013858();
}

void sub_1001EC2CC(void *a1)
{
  id v3 = sub_1000138B8(a1);
  uint64_t v5 = (void *)sub_1000138AC((uint64_t)v3, v4);
  sub_1000138A0(v5);
  id v6 = [(id)sub_1000138E8() databasePath];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100013888();
  sub_100013874( (void *)&_mh_execute_header,  v8,  v9,  "[%@]: Reopening database after IO error: %{public}@",  v10,  v11,  v12,  v13,  v14);

  sub_100013858();
}

void sub_1001EC35C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  int v8 = 138543618;
  id v9 = (id)objc_opt_class(a2, v6);
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  id v7 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[%{public}@] Error: %@",  (uint8_t *)&v8,  0x16u);
}

uint64_t _s25ASOctaneSupportXPCService4HeapV10startIndexSivg_0()
{
  return ContiguousArray.startIndex.getter();
}

uint64_t _s25ASOctaneSupportXPCService4HeapV19underestimatedCountSivg_0()
{
  return ContiguousArray.count.getter();
}

uint64_t _s25ASOctaneSupportXPCService4HeapVyxSicig_0()
{
  return ContiguousArray.subscript.getter();
}

id objc_msgSend_JSONObjectForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectForColumnIndex:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SQL(void *a1, const char *a2, ...)
{
  return _[a1 SQL];
}

id objc_msgSend_SQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLForEntityClass:");
}

id objc_msgSend_SQLJoinClausesForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLJoinClausesForEntityClass:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForColumnIndex:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDForColumnIndex:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addKnownDatabasePath:");
}

id objc_msgSend__aggregateValueForProperty_function_predicate_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:");
}

id objc_msgSend__baseQueryForKeyID_additionalCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baseQueryForKeyID:additionalCapacity:");
}

id objc_msgSend__close(void *a1, const char *a2, ...)
{
  return _[a1 _close];
}

id objc_msgSend__columnTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_columnTypeForColumnIndex:");
}

id objc_msgSend__comparisonTypeString(void *a1, const char *a2, ...)
{
  return _[a1 _comparisonTypeString];
}

id objc_msgSend__containerURL(void *a1, const char *a2, ...)
{
  return _[a1 _containerURL];
}

id objc_msgSend__copyErrorForOSStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyErrorForOSStatus:");
}

id objc_msgSend__copyTableClusteredValuesWithValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyTableClusteredValuesWithValues:");
}

id objc_msgSend__createDirectoryAtBaseURL_withPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDirectoryAtBaseURL:withPathComponent:");
}

id objc_msgSend__dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _dateFormatter];
}

id objc_msgSend__declaredTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_declaredTypeForColumnIndex:");
}

id objc_msgSend__deleteRowFromTable_usingColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteRowFromTable:usingColumn:");
}

id objc_msgSend__encodePayload(void *a1, const char *a2, ...)
{
  return _[a1 _encodePayload];
}

id objc_msgSend__encodePayloadForIAPReceipt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodePayloadForIAPReceipt:");
}

id objc_msgSend__executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeStatement:error:");
}

id objc_msgSend__executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeWithError:usingBlock:");
}

id objc_msgSend__finalizeAllStatements(void *a1, const char *a2, ...)
{
  return _[a1 _finalizeAllStatements];
}

id objc_msgSend__flushAfterTransactionBlocks(void *a1, const char *a2, ...)
{
  return _[a1 _flushAfterTransactionBlocks];
}

id objc_msgSend__insertValues_intoTable_withPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertValues:intoTable:withPersistentID:onConnection:");
}

id objc_msgSend__isKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isKnownDatabasePath:");
}

id objc_msgSend__modifyUsingTransactionClass_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyUsingTransactionClass:withBlock:");
}

id objc_msgSend__newSelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:");
}

id objc_msgSend__newSelectSQLWithProperties_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:columns:");
}

id objc_msgSend__open(void *a1, const char *a2, ...)
{
  return _[a1 _open];
}

id objc_msgSend__performMigrationIfNeededForStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMigrationIfNeededForStore:");
}

id objc_msgSend__performResetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _performResetAfterCorruptionError];
}

id objc_msgSend__prepareStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareStatement:error:");
}

id objc_msgSend__readUsingSession_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readUsingSession:withBlock:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_IA5String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:IA5String:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_UTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:UTF8String:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:data:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_integer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:integer:");
}

id objc_msgSend__reentrantSafePerformBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reentrantSafePerformBlock:");
}

id objc_msgSend__removeKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeKnownDatabasePath:");
}

id objc_msgSend__resetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterCorruptionError];
}

id objc_msgSend__resetAfterIOError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterIOError];
}

id objc_msgSend__saveValueToKeychain_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveValueToKeychain:forKey:error:");
}

id objc_msgSend__setUserVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserVersion:");
}

id objc_msgSend__smallestInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smallestInt:");
}

id objc_msgSend__statementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statementForPreparedStatement:error:");
}

id objc_msgSend__transformedSQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformedSQLForEntityClass:");
}

id objc_msgSend__valueFromKeychainForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueFromKeychainForKey:error:");
}

id objc_msgSend__verifiedStatementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForPreparedStatement:error:");
}

id objc_msgSend__verifiedStatementForSQL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForSQL:error:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBinding:atIndex:");
}

id objc_msgSend_applyTransformBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransformBinding:atIndex:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bindArray_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindArray:atPosition:");
}

id objc_msgSend_bindData_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindData:atPosition:");
}

id objc_msgSend_bindDictionary_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDictionary:atPosition:");
}

id objc_msgSend_bindDouble_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDouble:atPosition:");
}

id objc_msgSend_bindInt64_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt64:atPosition:");
}

id objc_msgSend_bindNullAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtPosition:");
}

id objc_msgSend_bindNumber_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNumber:atPosition:");
}

id objc_msgSend_bindString_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindString:atPosition:");
}

id objc_msgSend_bindUUID_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindUUID:atPosition:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cacheSize(void *a1, const char *a2, ...)
{
  return _[a1 cacheSize];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_clearBindings(void *a1, const char *a2, ...)
{
  return _[a1 clearBindings];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_columnIndexForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnIndexForColumnName:");
}

id objc_msgSend_comparisonType(void *a1, const char *a2, ...)
{
  return _[a1 comparisonType];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionNeedsResetForCorruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForCorruption:");
}

id objc_msgSend_connectionNeedsResetForReopen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForReopen:");
}

id objc_msgSend_connectionPointer(void *a1, const char *a2, ...)
{
  return _[a1 connectionPointer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copySelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySelectSQLWithProperties:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createOrMigrateStoreUsingSchema_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrMigrateStoreUsingSchema:");
}

id objc_msgSend_currentSchemaVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentSchemaVersion];
}

id objc_msgSend_dataForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForColumnIndex:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 databaseEntityClass];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return _[a1 databasePath];
}

id objc_msgSend_databaseTable(void *a1, const char *a2, ...)
{
  return _[a1 databaseTable];
}

id objc_msgSend_dateForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateForColumnIndex:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProperties(void *a1, const char *a2, ...)
{
  return _[a1 defaultProperties];
}

id objc_msgSend_deleteFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 deleteFromDatabase];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return _[a1 deviceID];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_disambiguatedSQLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguatedSQLForProperty:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForColumnIndex:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_encryptionKeyId(void *a1, const char *a2, ...)
{
  return _[a1 encryptionKeyId];
}

id objc_msgSend_entityClass(void *a1, const char *a2, ...)
{
  return _[a1 entityClass];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesWithProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesWithProperties:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratePersistentIDsAndProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsAndProperties:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsUsingBlock:");
}

id objc_msgSend_enumerateRowsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRowsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeQuery_withResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withResults:");
}

id objc_msgSend_executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:");
}

id objc_msgSend_executeStatement_error_bindings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:bindings:");
}

id objc_msgSend_executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithError:usingBlock:");
}

id objc_msgSend_externalPropertyValues(void *a1, const char *a2, ...)
{
  return _[a1 externalPropertyValues];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_finalizeStatement(void *a1, const char *a2, ...)
{
  return _[a1 finalizeStatement];
}

id objc_msgSend_firstInt64Value(void *a1, const char *a2, ...)
{
  return _[a1 firstInt64Value];
}

id objc_msgSend_foreignDatabaseColumnForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseColumnForProperty:");
}

id objc_msgSend_foreignDatabaseTableForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseTableForProperty:");
}

id objc_msgSend_foreignDatabaseTablesToDelete(void *a1, const char *a2, ...)
{
  return _[a1 foreignDatabaseTablesToDelete];
}

id objc_msgSend_foreignKeyColumnForTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignKeyColumnForTable:");
}

id objc_msgSend_getValuesForProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesForProperties:");
}

id objc_msgSend_hasRows(void *a1, const char *a2, ...)
{
  return _[a1 hasRows];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_inMemoryDatabaseFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseFlag];
}

id objc_msgSend_inMemoryDatabaseSharedCacheFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseSharedCacheFlag];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initOnConnection_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnConnection:descriptor:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_SQL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:SQL:");
}

id objc_msgSend_initWithConnection_schemaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:schemaName:");
}

id objc_msgSend_initWithDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseEntity:properties:");
}

id objc_msgSend_initWithDatabaseID_propertyValues_externalPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseID:propertyValues:externalPropertyValues:");
}

id objc_msgSend_initWithDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabasePath:");
}

id objc_msgSend_initWithEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:");
}

id objc_msgSend_initWithEntityClass_memoryEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:memoryEntityClass:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:onConnection:");
}

id objc_msgSend_initWithStatement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:");
}

id objc_msgSend_initWithStatement_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:onConnection:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_int64ForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "int64ForColumnIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNegative(void *a1, const char *a2, ...)
{
  return _[a1 isNegative];
}

id objc_msgSend_isReadOnly(void *a1, const char *a2, ...)
{
  return _[a1 isReadOnly];
}

id objc_msgSend_joinClauseForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClauseForProperty:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_limitCount(void *a1, const char *a2, ...)
{
  return _[a1 limitCount];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_matchesNull(void *a1, const char *a2, ...)
{
  return _[a1 matchesNull];
}

id objc_msgSend_memoryEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 memoryEntityClass];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForColumnIndex:");
}

id objc_msgSend_numberValueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberValueForProperty:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oct_dataWithHexString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oct_dataWithHexString:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performSavepoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSavepoint:");
}

id objc_msgSend_performTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransaction:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateMatchingAnyPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAnyPredicates:");
}

id objc_msgSend_predicateWithProperty_equalToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToValue:");
}

id objc_msgSend_predicateWithProperty_value_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:value:comparisonType:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyValues(void *a1, const char *a2, ...)
{
  return _[a1 propertyValues];
}

id objc_msgSend_protectionType(void *a1, const char *a2, ...)
{
  return _[a1 protectionType];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryOnConnection_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryOnConnection:predicate:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reloadFromDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromDatabaseEntity:properties:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_schemaName(void *a1, const char *a2, ...)
{
  return _[a1 schemaName];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _[a1 sessionClass];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setCacheSizeWithNumberOfKilobytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheSizeWithNumberOfKilobytes:");
}

id objc_msgSend_setDatabaseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseID:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrderingDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingDirections:");
}

id objc_msgSend_setOrderingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingProperties:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setReadOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadOnly:");
}

id objc_msgSend_setResourceValues_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceValues:error:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTransporterConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransporterConfiguration:");
}

id objc_msgSend_setValues_forExternalProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forExternalProperties:count:");
}

id objc_msgSend_setValues_forProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forProperties:count:");
}

id objc_msgSend_setValuesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesWithDictionary:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_sqlite3_stmt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sqlite3_stmt");
}

id objc_msgSend_storeDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 storeDescriptor];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnIndex:");
}

id objc_msgSend_stringForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnName:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_tableExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableExists:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_transactionClass(void *a1, const char *a2, ...)
{
  return _[a1 transactionClass];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _[a1 transactions];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transformSQLWithRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformSQLWithRoot:");
}

id objc_msgSend_transporterConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 transporterConfiguration];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}