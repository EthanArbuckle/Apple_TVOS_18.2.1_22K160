uint64_t sub_100001BB8@<X0>(void *a1@<X8>)
{
  uint64_t v2;
  URL.init(fileURLWithPath:)(a1, 0xD000000000000017LL, 0x8000000100003B90LL);
  v2 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 0LL, 1LL, v2);
}

uint64_t sub_100001C14()
{
  v1 = (char *)&v26 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000209C(&qword_100008010);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  v14 = (char *)&v26 - v13;
  URL.init(fileURLWithPath:)(v7, 0xD000000000000017LL, 0x8000000100003B90LL);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0LL, 1LL, v8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    sub_1000020DC((uint64_t)v7);
    uint64_t v15 = sub_10000209C(&qword_100008018);
    uint64_t v16 = swift_allocObject(v15, 64LL, 7LL);
    *(_OWORD *)(v16 + 16) = xmmword_100003980;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 32) = 0xD000000000000020LL;
    *(void *)(v16 + 40) = 0x8000000100003BB0LL;
    print(_:separator:terminator:)(v16, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
    return swift_bridgeObjectRelease(v16);
  }

  else
  {
    (*(void (**)(char *, void *, uint64_t))(v9 + 32))(v14, v7, v8);
    unint64_t v27 = 0xD000000000000012LL;
    unint64_t v28 = 0x8000000100003BE0LL;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for URL.DirectoryHint.inferFromPath(_:),  v2);
    unint64_t v18 = sub_10000211C();
    URL.appending<A>(path:directoryHint:)(&v27, v5, &type metadata for String, v18);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v19 = swift_bridgeObjectRelease(v28);
    static String.Encoding.utf8.getter(v19);
    uint64_t v20 = String.init(contentsOf:encoding:)(v12, v1);
    uint64_t v22 = v21;
    v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v12, v8);
    uint64_t v24 = sub_10000209C(&qword_100008018);
    uint64_t v25 = swift_allocObject(v24, 64LL, 7LL);
    *(_OWORD *)(v25 + 16) = xmmword_100003980;
    *(void *)(v25 + 56) = &type metadata for String;
    *(void *)(v25 + 32) = v20;
    *(void *)(v25 + 40) = v22;
    print(_:separator:terminator:)(v25, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
    swift_bridgeObjectRelease(v25);
    return ((uint64_t (*)(char *, uint64_t))v23)(v14, v8);
  }
}

uint64_t sub_10000209C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000020DC(uint64_t a1)
{
  uint64_t v2 = sub_10000209C(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_10000211C()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }

  return result;
}

uint64_t sub_100002160()
{
  uint64_t v24 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v0 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v2 = (uint64_t *)((char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v25 = type metadata accessor for DispatchTime(0LL);
  uint64_t v23 = *(void *)(v25 - 8);
  uint64_t v3 = __chkstk_darwin(v25);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  v7 = (char *)&v23 - v6;
  id v8 = [objc_allocWithZone(SoftwareTransparency) initWithApplication:0];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = swift_allocObject(&unk_1000042B0, 32LL, 7LL);
  *(void *)(v10 + 16) = 0LL;
  *(void *)(v10 + 24) = 0LL;
  uint64_t v11 = swift_allocObject(&unk_1000042D8, 32LL, 7LL);
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  aBlock[4] = sub_100002584;
  uint64_t v28 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000258C;
  aBlock[3] = &unk_1000042F0;
  v12 = _Block_copy(aBlock);
  uint64_t v13 = v28;
  swift_retain(v10);
  v14 = v9;
  swift_release(v13);
  id v26 = v8;
  [v8 sysdiagnoseInfoWithCompletion:v12];
  _Block_release(v12);
  static DispatchTime.now()();
  *uint64_t v2 = 2500LL;
  uint64_t v15 = v24;
  (*(void (**)(void *, void, uint64_t))(v0 + 104))( v2,  enum case for DispatchTimeInterval.milliseconds(_:),  v24);
  + infix(_:_:)(v5, v2);
  (*(void (**)(void *, uint64_t))(v0 + 8))(v2, v15);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v17 = v25;
  v16(v5, v25);
  LOBYTE(v15) = OS_dispatch_semaphore.wait(timeout:)(v7);
  v16(v7, v17);
  if ((v15 & 1) != 0 || (swift_beginAccess(v10 + 16, aBlock, 0LL, 0LL), (uint64_t v18 = *(void *)(v10 + 24)) == 0))
  {

    swift_release(v10);
    return 0LL;
  }

  else
  {
    uint64_t v19 = *(void *)(v10 + 16);
    uint64_t v20 = sub_10000209C(&qword_100008018);
    uint64_t v21 = swift_allocObject(v20, 64LL, 7LL);
    *(_OWORD *)(v21 + 16) = xmmword_100003980;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 32) = v19;
    *(void *)(v21 + 40) = v18;
    swift_bridgeObjectRetain(v18);
    print(_:separator:terminator:)(v21, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
    swift_release(v10);
    swift_bridgeObjectRelease(v21);

    return 1LL;
  }

uint64_t sub_100002454()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100002478(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for String.Encoding(0LL);
  uint64_t result = __chkstk_darwin(v6);
  dispatch_semaphore_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (a2 >> 60 != 15)
  {
    uint64_t v10 = sub_1000035F4(a1, a2);
    static String.Encoding.utf8.getter(v10);
    uint64_t v11 = String.init(data:encoding:)(a1, a2, v9);
    if (v12)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      swift_beginAccess(a3 + 16, v17, 1LL, 0LL);
      uint64_t v15 = *(void *)(a3 + 24);
      *(void *)(a3 + 16) = v13;
      *(void *)(a3 + 24) = v14;
      swift_bridgeObjectRelease(v15);
      OS_dispatch_semaphore.signal()();
    }

    return sub_10000359C(a1, a2);
  }

  return result;
}

uint64_t sub_100002558()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100002584(uint64_t a1, unint64_t a2)
{
  return sub_100002478(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000258C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    swift_retain(v5);
    id v7 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    unint64_t v9 = v8;
  }

  else
  {
    swift_retain(v5);
    unint64_t v9 = 0xF000000000000000LL;
  }

  id v10 = a3;
  v6(v4, v9, a3);

  sub_10000359C((uint64_t)v4, v9);
  return swift_release(v5);
}

uint64_t sub_100002620(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100002630(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t transparencySysdiagnose.init()()
{
  uint64_t v1 = (char *)&v7 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for NameSpecification(0LL);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static NameSpecification.long.getter(v2);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013LL, 0x8000000100003C50LL);
  uint64_t v5 = type metadata accessor for ArgumentHelp(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v1, 0LL, 1LL, v5);
  return Flag<A>.init(wrappedValue:name:help:)(0LL, v4, v1);
}

uint64_t variable initialization expression of transparencySysdiagnose._useFallback()
{
  return 0LL;
}

uint64_t property wrapper backing initializer of transparencySysdiagnose.useFallback(uint64_t a1)
{
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for NameSpecification(0LL);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static NameSpecification.long.getter(v4);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013LL, 0x8000000100003C50LL);
  uint64_t v7 = type metadata accessor for ArgumentHelp(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v3, 0LL, 1LL, v7);
  return Flag<A>.init(wrappedValue:name:help:)(a1, v6, v3);
}

uint64_t sub_10000282C()
{
  uint64_t v0 = sub_10000209C(&qword_100008030);
  Flag.wrappedValue.getter(&var1, v0);
  return var1;
}

uint64_t sub_10000285C(char a1)
{
  char v3 = a1;
  uint64_t v1 = sub_10000209C(&qword_100008030);
  return Flag.wrappedValue.setter(&v3, v1);
}

void (*sub_100002890(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  uint64_t v3 = sub_10000209C(&qword_100008030);
  v2[4] = Flag.wrappedValue.modify(v2, v3);
  return sub_1000028E8;
}

void sub_1000028E8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> transparencySysdiagnose.run()()
{
  uint64_t v0 = sub_10000209C(&qword_100008030);
  Flag.wrappedValue.getter(&var1, v0);
  if ((var1 & 1) != 0 || (sub_100002160() & 1) == 0) {
    sub_100001C14();
  }
}

uint64_t sub_100002960()
{
  uint64_t v0 = type metadata accessor for transparencySysdiagnose(0LL);
  uint64_t v1 = sub_10000309C(&qword_100008038, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
  return static ParsableCommand.main()(v0, v1);
}

uint64_t type metadata accessor for transparencySysdiagnose(uint64_t a1)
{
  uint64_t result = qword_100008280;
  if (!qword_100008280) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for transparencySysdiagnose);
  }
  return result;
}

uint64_t sub_1000029E0()
{
  return 1LL;
}

Swift::Int sub_1000029E8()
{
  return Hasher._finalize()();
}

void sub_100002A28()
{
}

Swift::Int sub_100002A4C(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100002A88()
{
  return 0x626C6C6146657375LL;
}

uint64_t sub_100002AA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  if (a1 == 0x626C6C6146657375LL && a2 == 0xEB000000006B6361LL)
  {
    uint64_t result = swift_bridgeObjectRelease(0xEB000000006B6361LL);
    char v8 = 0;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x626C6C6146657375LL, 0xEB000000006B6361LL, a1, a2, 0LL);
    uint64_t result = swift_bridgeObjectRelease(a2);
    char v8 = v6 ^ 1;
  }

  *a3 = v8 & 1;
  return result;
}

uint64_t sub_100002B54()
{
  return 0LL;
}

void sub_100002B60(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100002B6C(uint64_t a1)
{
  unint64_t v2 = sub_100002E64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002B94(uint64_t a1)
{
  unint64_t v2 = sub_100002E64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t transparencySysdiagnose.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_10000209C(&qword_100008030);
  uint64_t v26 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v28 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000209C(&qword_100008040);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000209C(&qword_100008028);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for NameSpecification(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for transparencySysdiagnose(0LL);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static NameSpecification.long.getter(v16);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013LL, 0x8000000100003C50LL);
  uint64_t v19 = type metadata accessor for ArgumentHelp(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v11, 0LL, 1LL, v19);
  Flag<A>.init(wrappedValue:name:help:)(0LL, v14, v11);
  uint64_t v20 = a1[3];
  uint64_t v21 = a1[4];
  sub_100002E40(a1, v20);
  unint64_t v22 = sub_100002E64();
  uint64_t v23 = v29;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for transparencySysdiagnose.CodingKeys,  &type metadata for transparencySysdiagnose.CodingKeys,  v22,  v20,  v21);
  if (!v23)
  {
    sub_100002F04();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v3);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v18, v28, v3);
    sub_100002F94((uint64_t)v18, v27);
  }

  sub_100002EA8(a1);
  return sub_100002EC8((uint64_t)v18);
}

void *sub_100002E40(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_100002E64()
{
  unint64_t result = qword_1000080F0[0];
  if (!qword_1000080F0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003B5C, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_1000080F0);
  }

  return result;
}

uint64_t sub_100002EA8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002EC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for transparencySysdiagnose(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100002F04()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    uint64_t v1 = sub_100002F50(&qword_100008030);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Flag<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100008048);
  }

  return result;
}

uint64_t sub_100002F50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100002F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for transparencySysdiagnose(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_100002FE0()
{
}

uint64_t sub_100002FF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return transparencySysdiagnose.init(from:)(a1, a2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for transparencySysdiagnose(0LL);
  uint64_t v4 = sub_10000309C(&qword_100008038, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
  static ParsableCommand.main()(v3, v4);
  return 0;
}

uint64_t sub_100003054()
{
  return sub_10000309C(&qword_100008050, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
}

uint64_t sub_100003078()
{
  return sub_10000309C(&qword_100008058, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
}

uint64_t sub_10000309C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for transparencySysdiagnose(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for transparencySysdiagnose(uint64_t a1)
{
  uint64_t v2 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t initializeWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for transparencySysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003280);
}

uint64_t sub_100003280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for transparencySysdiagnose( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000032CC);
}

uint64_t sub_1000032CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

void sub_100003310(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
  }

void sub_100003378()
{
  if (!qword_1000080B8)
  {
    unint64_t v0 = type metadata accessor for Flag(0LL, &type metadata for Bool);
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000080B8);
    }
  }

uint64_t getEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100003464 + 4 * byte_1000039A0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100003484 + 4 * byte_1000039A5[v4]))();
  }
}

_BYTE *sub_100003464(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_100003484(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_10000348C(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100003494(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_10000349C(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000034A4(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for transparencySysdiagnose.CodingKeys()
{
  return &type metadata for transparencySysdiagnose.CodingKeys;
}

unint64_t sub_1000034C8()
{
  unint64_t result = qword_100008390[0];
  if (!qword_100008390[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003B34, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_100008390);
  }

  return result;
}

unint64_t sub_100003510()
{
  unint64_t result = qword_1000084A0;
  if (!qword_1000084A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003AA4, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000084A0);
  }

  return result;
}

unint64_t sub_100003558()
{
  unint64_t result = qword_1000084A8[0];
  if (!qword_1000084A8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003ACC, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_1000084A8);
  }

  return result;
}

uint64_t sub_10000359C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000035B0(result, a2);
  }
  return result;
}

uint64_t sub_1000035B0(uint64_t result, unint64_t a2)
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

uint64_t sub_1000035F4(uint64_t result, unint64_t a2)
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