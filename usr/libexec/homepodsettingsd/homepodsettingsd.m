void sub_100002260()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  id v3;
  id v4;
  _BYTE v5[24];
  sub_100003138();
  v0 = sub_1000031B0(26LL);
  v1 = (_BYTE *)DeviceClass.local.unsafeMutableAddressor(v0);
  v2 = sub_1000031A4((uint64_t)v1, (uint64_t)v5);
  if (*v1 == 1)
  {
    v3 = *(id *)BetaEnrollmentManager.shared.unsafeMutableAddressor(v2);
    BetaEnrollmentManager.start(completion:)(sub_10000283C, 0LL);

    sub_10000232C();
    sub_1000023F8();
    sub_1000025D8();
    sub_100002764();
  }

  sub_1000027F0();
  notify_post(kHPSDaemonReadyNotificationKey);
  v4 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  [v4 run];

  sub_1000031E0();
}

uint64_t sub_10000232C()
{
  id v0 = *(id *)ProfileControllerService.shared.unsafeMutableAddressor();
  _StringGuts.grow(_:)(50LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  id v1 = [v0 description];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;

  v5._countAndFlagsBits = v2;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v4);
  sub_1000031B8(0xD000000000000030LL);

  return swift_bridgeObjectRelease(0x8000000100003650LL);
}

uint64_t sub_1000023F8()
{
  unsigned int v1 = [(id)objc_opt_self(HPSFeatureStatus) isOpalEnabled];
  int v2 = IsAppleInternalBuild();
  v3 = (unsigned __int8 *)DeviceClass.local.unsafeMutableAddressor();
  sub_1000031A4((uint64_t)v3, (uint64_t)v21);
  int v4 = *v3;
  if (v1 && v2 && v4 == 1)
  {
    uint64_t v5 = type metadata accessor for TaskPriority(0LL);
    sub_100002E98(v0, 1LL, 1LL, v5);
    uint64_t v6 = sub_100003198((uint64_t)&unk_100004360);
    *(void *)(v6 + 16) = 0LL;
    *(void *)(v6 + 24) = 0LL;
    uint64_t v7 = sub_100002AE4(v0, (uint64_t)&unk_100008188, v6);
    return swift_release(v7);
  }

  else
  {
    _StringGuts.grow(_:)(100LL);
    sub_100003138();
    sub_1000031EC(68LL, v9);
    if (v1) {
      uint64_t v10 = 1702195828LL;
    }
    else {
      uint64_t v10 = 0x65736C6166LL;
    }
    if (v1) {
      unint64_t v11 = 0xE400000000000000LL;
    }
    else {
      unint64_t v11 = 0xE500000000000000LL;
    }
    unint64_t v12 = v11;
    String.append(_:)(*(Swift::String *)&v10);
    sub_1000031F4();
    v13._countAndFlagsBits = 0x616E7265746E690ALL;
    v13._object = (void *)0xEF3D646C6975426CLL;
    String.append(_:)(v13);
    if (v2) {
      uint64_t v14 = 1702195828LL;
    }
    else {
      uint64_t v14 = 0x65736C6166LL;
    }
    if (v2) {
      unint64_t v15 = 0xE400000000000000LL;
    }
    else {
      unint64_t v15 = 0xE500000000000000LL;
    }
    unint64_t v16 = v15;
    String.append(_:)(*(Swift::String *)&v14);
    sub_100003210();
    v17._countAndFlagsBits = 0x50656D6F4873690ALL;
    v17._object = (void *)0xEB000000003D646FLL;
    String.append(_:)(v17);
    if (v4 == 1) {
      uint64_t v18 = 1702195828LL;
    }
    else {
      uint64_t v18 = 0x65736C6166LL;
    }
    if (v4 == 1) {
      unint64_t v19 = 0xE400000000000000LL;
    }
    else {
      unint64_t v19 = 0xE500000000000000LL;
    }
    unint64_t v20 = v19;
    String.append(_:)(*(Swift::String *)&v18);
    sub_100003210();
    NSLog(_:_:)(0LL);
    return sub_100003210();
  }
}

uint64_t sub_1000025D8()
{
  uint64_t v1 = type metadata accessor for TaskPriority(0LL);
  sub_100002E98(v0, 1LL, 1LL, v1);
  uint64_t v2 = sub_100003198((uint64_t)&unk_1000042E8);
  *(void *)(v2 + 16) = 0LL;
  *(void *)(v2 + 24) = 0LL;
  if (sub_100002F2C(v0, 1LL, v1) == 1)
  {
    sub_100002F38(v0);
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    uint64_t v5 = 7168LL;
  }

  else
  {
    unsigned __int8 v6 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
    uint64_t v5 = v6 | 0x1C00LL;
    uint64_t v7 = *(void *)(v2 + 16);
    if (v7)
    {
      uint64_t v8 = *(void *)(v2 + 24);
      uint64_t ObjectType = swift_getObjectType(v7);
      swift_unknownObjectRetain(v7);
      uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v8);
      uint64_t v4 = v10;
      swift_unknownObjectRelease(v7);
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v4 = 0LL;
    }
  }

  uint64_t v11 = sub_100003198((uint64_t)&unk_100004310);
  *(void *)(v11 + 16) = &unk_100008198;
  *(void *)(v11 + 24) = v2;
  if (v4 | v3)
  {
    v15[0] = 0LL;
    v15[1] = 0LL;
    unint64_t v12 = v15;
    v15[2] = v3;
    v15[3] = v4;
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  uint64_t v13 = swift_task_create(v5, v12, (char *)&type metadata for () + 8, &unk_1000081A0, v11);
  return swift_release(v13);
}

void sub_100002764()
{
  if ([(id)objc_opt_self(HPSFeatureStatus) isPyreEnabled])
  {
    if (IsAppleInternalBuild())
    {
      uint64_t v0 = (_BYTE *)DeviceClass.local.unsafeMutableAddressor();
      uint64_t v1 = sub_1000031A4((uint64_t)v0, (uint64_t)v3);
      if (*v0 == 1)
      {
        id v2 = *(id *)ReachabilityAssessor.shared.unsafeMutableAddressor(v1);
        ReachabilityAssessor.start()();

        sub_100003138();
        sub_1000031B0(42LL);
      }
    }
  }

  sub_1000031E0();
}

void sub_1000027F0()
{
  id v0 = [(id)objc_opt_self(HPSettingsManager) sharedManager];
  [v0 setupHomeKit];
}

uint64_t sub_10000283C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = 0xE000000000000000LL;
    swift_errorRetain();
    _StringGuts.grow(_:)(55LL);
    sub_100003138();
    String.append(_:)(v2);
    swift_getErrorValue(a1, v6, v5);
    v3._countAndFlagsBits = Error.localizedDescription.getter(v5[1], v5[2]);
    String.append(_:)(v3);
    sub_1000031F4();
    sub_1000031B8(v7);
    sub_1000031D8();
    return sub_100003208();
  }

  else
  {
    sub_100003138();
    return NSLog(_:_:)(0xD000000000000030LL);
  }

uint64_t sub_100002920()
{
  return sub_100003154((uint64_t)sub_10000292C);
}

uint64_t sub_10000292C()
{
  uint64_t v1 = (uint64_t *)CarrySettings.CarrySettingsManager.shared.unsafeMutableAddressor();
  uint64_t v2 = *v1;
  *(void *)(v0 + 48) = *v1;
  uint64_t v3 = async function pointer to CarrySettings.CarrySettingsManager.start()[1];
  swift_retain(v2);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_1000031FC(v4, (uint64_t)sub_100002988);
  return CarrySettings.CarrySettingsManager.start()(v5);
}

uint64_t sub_100002988()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 56);
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_100002A28;
  }

  else
  {
    swift_release(*(void *)(v2 + 48));
    uint64_t v4 = sub_1000029EC;
  }

  return sub_10000316C((uint64_t)v4, 0LL, 0LL);
}

uint64_t sub_1000029EC()
{
  return sub_10000312C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002A28()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release(*(void *)(v0 + 48));
  _StringGuts.grow(_:)(54LL);
  sub_100003138();
  sub_1000031EC(52LL, v2);
  swift_getErrorValue(v1, v0 + 40, v0 + 16);
  v3._countAndFlagsBits = Error.localizedDescription.getter(*(void *)(v0 + 24), *(void *)(v0 + 32));
  String.append(_:)(v3);
  sub_1000031F4();
  sub_1000031B8(0LL);
  sub_1000031D8();
  sub_100003208();
  return sub_100003160(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100002F2C(a1, 1LL, v6) == 1)
  {
    sub_100002F38(a1);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v14 = v13;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = swift_allocObject(&unk_100004338, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    unint64_t v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    unint64_t v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_100008178, v15);
}

uint64_t sub_100002C20()
{
  return sub_100003154((uint64_t)sub_100002C2C);
}

uint64_t sub_100002C2C()
{
  uint64_t v1 = sub_1000031B0(28LL);
  uint64_t v2 = (uint64_t *)OpalTransport.OpalTransportManager.shared.unsafeMutableAddressor(v1);
  uint64_t v3 = *v2;
  *(void *)(v0 + 40) = *v2;
  uint64_t v4 = async function pointer to OpalTransport.OpalTransportManager.activate()[1];
  swift_retain(v3);
  uint64_t v5 = (void *)swift_task_alloc(v4);
  *(void *)(v0 + 48) = v5;
  uint64_t v6 = sub_1000031FC(v5, (uint64_t)sub_100002CA4);
  return OpalTransport.OpalTransportManager.activate()(v6);
}

uint64_t sub_100002CA4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 48);
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_100002D44;
  }

  else
  {
    swift_release(*(void *)(v2 + 40));
    uint64_t v4 = sub_100002D08;
  }

  return sub_10000316C((uint64_t)v4, 0LL, 0LL);
}

uint64_t sub_100002D08()
{
  return sub_10000312C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002D44()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release(*(void *)(v0 + 40));
  _StringGuts.grow(_:)(46LL);
  *(void *)(v0 + 16) = 0LL;
  *(void *)(v0 + 24) = 0xE000000000000000LL;
  sub_100003138();
  sub_1000031EC(44LL, v2);
  *(void *)(v0 + 32) = v1;
  uint64_t v3 = sub_100002E58(&qword_100008190);
  _print_unlocked<A, B>(_:_:)( v0 + 32,  v0 + 16,  v3,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  sub_1000031B8(*(void *)(v0 + 16));
  sub_1000031D8();
  sub_100003208();
  return sub_100003160(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002E00()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for homepodsettingsd()
{
  return objc_opt_self(&OBJC_CLASS____TtC16homepodsettingsd16homepodsettingsd);
}

uint64_t sub_100002E58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100002E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100002EA4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100002EC8()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000816C);
  *(void *)(v0 + 16) = v1;
  sub_1000031FC(v1, (uint64_t)sub_100002F08);
  return sub_100002920();
}

uint64_t sub_100002F08()
{
  return sub_10000312C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100002F38(uint64_t a1)
{
  uint64_t v2 = sub_100002E58(&qword_100008160);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100002F78(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100002FDC;
  return v6(a1);
}

uint64_t sub_100002FDC()
{
  return sub_10000312C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100003004()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100003028()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008174);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_100003178(v1);
  return sub_100003144(v2, v3, v4, v5);
}

uint64_t sub_100003074()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008174);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_100003178(v1);
  return sub_100003144(v2, v3, v4, v5);
}

uint64_t sub_1000030C0()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008184);
  *(void *)(v0 + 16) = v1;
  sub_1000031FC(v1, (uint64_t)sub_100003100);
  return sub_100002C20();
}

uint64_t sub_10000310C()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_10000312C(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_100003144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_100003154(uint64_t a1)
{
  return swift_task_switch(a1, 0LL, 0LL);
}

uint64_t sub_100003160(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000316C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_100003178(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_100003198(uint64_t a1)
{
  return swift_allocObject(a1, 32LL, 7LL);
}

uint64_t sub_1000031A4(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 0LL, 0LL);
}

uint64_t sub_1000031B0(uint64_t a1)
{
  return NSLog(_:_:)(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL);
}

uint64_t sub_1000031B8(uint64_t a1)
{
  return NSLog(_:_:)(a1);
}

  ;
}

uint64_t sub_1000031D8()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

void sub_1000031EC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL;
  String.append(_:)(*(Swift::String *)(&a2 - 1));
}

uint64_t sub_1000031F4()
{
  return swift_bridgeObjectRelease(v0);
}

void *sub_1000031FC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *uint64_t result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_100003208()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100003210()
{
  return swift_bridgeObjectRelease(v0);
}