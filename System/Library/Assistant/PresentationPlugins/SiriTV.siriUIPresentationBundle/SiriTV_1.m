uint64_t sub_728E4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC6SiriTV27ConversationViewCoordinator *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _TtC6SiriTV27ConversationViewCoordinator *v16;
  _TtC6SiriTV27ConversationViewCoordinator *v17;
  uint64_t v19;
  unsigned __int8 *viewController;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27[2];
  char v28[24];
  v1 = v0;
  sub_6F998();
  v3 = v2;
  v4 = *(void *)&v2[qword_E2368];
  sub_1AE10();

  if (*(_BYTE *)(v4 + OBJC_IVAR____TtC6SiriTV24ContentPlattersViewModel_alwaysShowRecognizedSpeech) != 1) {
    return swift_release(v4);
  }
  v5 = sub_53D70();
  sub_73CB8(v5, v6);
  if (!v4) {
    return swift_release(v4);
  }
  v23 = v4;
  sub_1ADC4(v1 + 24, (uint64_t)v28);
  v7 = *(void *)(v1 + 24);
  v8 = *(void *)(v7 + 16);
  if (v8)
  {
    sub_1AE04();
    v9 = 0LL;
    v10 = &_swiftEmptyArrayStorage;
    do
    {
      v27[0] = *(_OWORD *)(v7 + 16 * v9 + 32);
      sub_1AE48(*(uint64_t *)&v27[0]);
      v11 = sub_1B108();
      v12 = sub_1B53C();
      if ((sub_1AE38((uint64_t)&v24, (uint64_t)v27, v11, v12) & 1) == 0)
      {
        v26 = 0LL;
        v24 = 0u;
        v25 = 0u;
      }

      sub_58218();
      if (*((void *)&v25 + 1))
      {
        sub_9F74(&v24, (uint64_t)v27);
        if ((sub_58144(v27, (uint64_t)&v24) & 1) == 0)
        {
          sub_1B638(0LL, *(void *)v10->super.viewControllers + 1LL);
          v10 = v16;
        }

        v14 = *(void *)v10->super.viewControllers;
        v13 = *(void *)v10->super.childCoordinators;
        if (v14 >= v13 >> 1)
        {
          sub_1B638(v13 > 1, v14 + 1);
          v10 = v17;
        }

        sub_73E38();
        sub_9F74(&v24, v15);
      }

      else
      {
        sub_A068((uint64_t)&v24, &qword_E41C0);
      }

      ++v9;
    }

    while (v8 != v9);
    sub_1ADF8();
  }

  else
  {
    v10 = &_swiftEmptyArrayStorage;
  }

  v19 = *(void *)v10->super.viewControllers;
  if (v19)
  {
    viewController = v10->super.viewController;
    sub_1AFF0();
    do
    {
      sub_58194(viewController, *((void *)viewController + 3));
      v21 = sub_27A44();
      v22(v21);
      viewController += 40;
      --v19;
    }

    while (v19);
    swift_release(v23);
    return sub_1AE18((uint64_t)v10);
  }

  else
  {
    sub_A418();
    return swift_release(v23);
  }

void sub_72B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = v6;
  sub_6F998();
  v16 = (void *)v15;
  sub_73DCC(v15, qword_E2368);

  uint64_t v17 = sub_53D48();
  sub_73CB8(v17, v18);
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v19 = sub_53D70();
  if (!v20)
  {
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  if (!a6)
  {
    sub_A208();
    goto LABEL_13;
  }

  if (v19 == a5 && v20 == a6)
  {
    sub_A208();
    goto LABEL_15;
  }

  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, a5, a6, 0LL);
  sub_A208();
  if ((v22 & 1) == 0)
  {
LABEL_13:
    sub_73E18();
    sub_70FC0(0LL, 0LL);
  }

void sub_72E0C()
{
  uint64_t v3 = v0;
  sub_1B440();
  sub_73EBC();
  __chkstk_darwin(v4);
  sub_73CE8();
  uint64_t v6 = (void *)v5;
  sub_73C58(v5, qword_E2368);

  sub_73E08();
  sub_1B1F0();
  sub_73EDC();
  uint64_t v8 = (void *)v7;
  sub_73C58(v7, qword_E2368);

  uint64_t v10 = UUID.init()(v9);
  UUID.uuidString.getter(v10);
  sub_73D38();
  sub_73DE0(v1, (uint64_t)&qword_E2368);
  sub_1B1F0();
  sub_1ADC4(v3 + 24, (uint64_t)&v26);
  uint64_t v11 = *(void *)(v3 + 24);
  if (*(void *)(v11 + 16))
  {
    sub_1AE04();
    v12 = &_swiftEmptyArrayStorage;
    do
    {
      v24[0] = *(_OWORD *)(v11 + 32);
      sub_1AE48(*(uint64_t *)&v24[0]);
      sub_1B5B8();
      uint64_t v13 = sub_1AF78();
      sub_1B158();
      if (v23[3])
      {
        if ((sub_73D00() & 1) == 0)
        {
          sub_73C64();
          v12 = v17;
        }

        sub_1B35C();
        if (v15)
        {
          sub_580B0(v14);
          v12 = v18;
        }

        sub_73D90();
      }

      else
      {
        sub_73E9C();
      }

      sub_73E4C();
    }

    while (!v16);
    sub_1ADF8();
  }

  else
  {
    v12 = &_swiftEmptyArrayStorage;
  }

  uint64_t v19 = *(void *)v12->super.viewControllers;
  if (v19)
  {
    viewController = v12->super.viewController;
    uint64_t v21 = sub_1B0E4();
    do
    {
      sub_73E60(v21, (uint64_t)v24);
      uint64_t v22 = v25;
      sub_73DD8(v24);
      sub_581E8(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 24));
      uint64_t v21 = sub_DBAC(v24);
      viewController += 40;
      --v19;
    }

    while (v19);
    sub_1AE18((uint64_t)v12);
  }

  else
  {
    sub_A470();
  }

  sub_A174();
}

void sub_72FD0()
{
  uint64_t v3 = v0;
  sub_1B440();
  sub_73EBC();
  __chkstk_darwin(v4);
  sub_73CE8();
  uint64_t v6 = (void *)v5;
  sub_73C58(v5, qword_E2368);

  sub_73E08();
  sub_1B1F0();
  sub_73EDC();
  uint64_t v8 = (void *)v7;
  sub_73C58(v7, qword_E2368);

  uint64_t v10 = UUID.init()(v9);
  UUID.uuidString.getter(v10);
  sub_73D38();
  sub_73DE0(v1, (uint64_t)&qword_E2368);
  sub_1B1F0();
  sub_1ADC4(v3 + 24, (uint64_t)&v26);
  uint64_t v11 = *(void *)(v3 + 24);
  if (*(void *)(v11 + 16))
  {
    sub_1AE04();
    v12 = &_swiftEmptyArrayStorage;
    do
    {
      v24[0] = *(_OWORD *)(v11 + 32);
      sub_1AE48(*(uint64_t *)&v24[0]);
      sub_1B5B8();
      uint64_t v13 = sub_1AF78();
      sub_1B158();
      if (v23[3])
      {
        if ((sub_73D00() & 1) == 0)
        {
          sub_73C64();
          v12 = v17;
        }

        sub_1B35C();
        if (v15)
        {
          sub_580B0(v14);
          v12 = v18;
        }

        sub_73D90();
      }

      else
      {
        sub_73E9C();
      }

      sub_73E4C();
    }

    while (!v16);
    sub_1ADF8();
  }

  else
  {
    v12 = &_swiftEmptyArrayStorage;
  }

  uint64_t v19 = *(void *)v12->super.viewControllers;
  if (v19)
  {
    viewController = v12->super.viewController;
    uint64_t v21 = sub_1B0E4();
    do
    {
      sub_73E60(v21, (uint64_t)v24);
      uint64_t v22 = v25;
      sub_73DD8(v24);
      sub_581E8(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32));
      uint64_t v21 = sub_DBAC(v24);
      viewController += 40;
      --v19;
    }

    while (v19);
    sub_1AE18((uint64_t)v12);
  }

  else
  {
    sub_A470();
  }

  sub_A174();
}

void sub_73194()
{
  uint64_t v2 = v0;
  sub_1B440();
  sub_73D28();
  __chkstk_darwin(v3);
  sub_A1F8();
  uint64_t v6 = v5 - v4;
  sub_6F998();
  uint64_t v8 = (void *)v7;
  sub_73DCC(v7, qword_E2368);

  sub_73E18();
  sub_1B48C();
  sub_6F998();
  uint64_t v10 = (void *)v9;
  sub_73DCC(v9, qword_E2368);

  uint64_t v12 = UUID.init()(v11);
  uint64_t v13 = UUID.uuidString.getter(v12);
  uint64_t v15 = v14;
  sub_1B4F0(v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_53DEC(v13, v15);
  sub_1B48C();
  sub_1ADC4(v2 + 24, (uint64_t)&v34);
  uint64_t v16 = *(void *)(v2 + 24);
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    sub_1AE04();
    uint64_t v18 = 0LL;
    uint64_t v19 = &_swiftEmptyArrayStorage;
    do
    {
      v33[0] = *(_OWORD *)(v16 + 16 * v18 + 32);
      sub_1AE48(*(uint64_t *)&v33[0]);
      uint64_t v20 = sub_9E24((uint64_t *)&unk_E41B0);
      uint64_t v21 = sub_1B53C();
      sub_58218();
      if (v32)
      {
        sub_9F74(&v31, (uint64_t)v33);
        if ((sub_58144(v33, (uint64_t)&v31) & 1) == 0)
        {
          sub_1B638(0LL, *(void *)v19->super.viewControllers + 1LL);
          uint64_t v19 = v25;
        }

        unint64_t v23 = *(void *)v19->super.viewControllers;
        unint64_t v22 = *(void *)v19->super.childCoordinators;
        if (v23 >= v22 >> 1)
        {
          sub_1B638(v22 > 1, v23 + 1);
          uint64_t v19 = v26;
        }

        sub_73E38();
        sub_9F74(&v31, v24);
      }

      else
      {
        sub_A068((uint64_t)&v31, &qword_E41C0);
      }

      ++v18;
    }

    while (v17 != v18);
    sub_1ADF8();
  }

  else
  {
    uint64_t v19 = &_swiftEmptyArrayStorage;
  }

  uint64_t v27 = *(void *)v19->super.viewControllers;
  if (v27)
  {
    viewController = v19->super.viewController;
    sub_1AFF0();
    do
    {
      sub_58194(viewController, *((void *)viewController + 3));
      uint64_t v29 = sub_27A44();
      v30(v29);
      viewController += 40;
      --v27;
    }

    while (v27);
    sub_A418();
  }

  sub_A418();
  sub_A174();
}

uint64_t sub_733CC()
{
  return sub_721F4() & 1;
}

void sub_733F0()
{
}

void sub_73410()
{
}

void sub_73430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void sub_73450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_73470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
}

uint64_t sub_73490()
{
  return sub_728E4();
}

void sub_734B0()
{
}

void sub_734D0(uint64_t a1)
{
}

void sub_734F0(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_9E0F8(a1);
  sub_DCEC(v3);
}

void sub_73528(uint64_t a1)
{
}

void sub_73548()
{
  uint64_t v3 = v2;
  sub_9E10C(v1, v0);
  sub_73CA8(v3);
}

void sub_73580()
{
}

void sub_735A0()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_A5F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_A1F8();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_73E94( v12 - v11,  v0 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.debug.getter(v15);
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)sub_5827C();
    *(_WORD *)uint64_t v17 = 0;
    sub_DD8C(&dword_0, v15, v16, v4, v17);
    sub_A15C((uint64_t)v17);
  }

  sub_1B4F0(v13, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  uint64_t v18 = sub_1AFD0(v2, 32LL);
  *(void *)(v18 + 16) = v8;
  *(void *)(v18 + 24) = v6;
  uint64_t v19 = sub_27A44();
  sub_1A920(v19, v20);
  sub_6FFEC();
  sub_1ADD0();
  sub_A174();
}

void sub_736B0()
{
}

void sub_736E8()
{
}

uint64_t sub_73720()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[qword_E2368];
  sub_1ADD8();

  sub_73ED0();
  return sub_3CC20(v2);
}

uint64_t sub_7375C()
{
  return sub_73720();
}

void sub_7377C(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = v3;
  id v6 = [v3 view];

  if (v6)
  {
    uint64_t v5 = type metadata accessor for ContentPlattersView(0LL);
    if (swift_dynamicCastClass(v6, v5)) {
      a2();
    }
    sub_DCEC(v6);
  }

void sub_737F8(uint64_t a1)
{
}

void sub_73820(uint64_t a1)
{
}

id sub_73848(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v5 = [a3 cardWithProto2Data:isa];

  return v5;
}

uint64_t sub_73894(void *a1)
{
  id v1 = [a1 cardSections];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_DCB4(0LL, &qword_E1740, &OBJC_CLASS___SFCardSection_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_73900(void *a1)
{
  id v1 = [a1 cardSectionDetail];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

uint64_t sub_73964()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_73988(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_73998(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_739A0()
{
  unint64_t result = qword_E0340;
  if (!qword_E0340)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_E0340);
  }

  return result;
}

unint64_t sub_739E0()
{
  unint64_t result = qword_E0350;
  if (!qword_E0350)
  {
    uint64_t v1 = sub_1A990((uint64_t *)&unk_E4680);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_E0350);
  }

  return result;
}

uint64_t sub_73A28()
{
  if (v0[3]) {
    swift_release(v0[4]);
  }
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_73A5C()
{
  return sub_6FF98(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

void sub_73A68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = sub_A5F0();
  sub_73D28();
  __chkstk_darwin(v29);
  sub_A344();
  uint64_t v32 = v30 - v31;
  __chkstk_darwin(v33);
  uint64_t v35 = (char *)&a9 - v34;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v25 + 40);
  if (Strong)
  {
    uint64_t v37 = Strong;
    uint64_t v38 = *(void *)(v25 + 48);
    if ([v27 shouldHideContentPlatterIfPerformed])
    {
      uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))( v32,  v25 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v28);
      unint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
      os_log_type_t v41 = static os_log_type_t.info.getter(v40);
      if (sub_73DE8(v41))
      {
        uint64_t v42 = (uint8_t *)sub_5827C();
        *(_WORD *)uint64_t v42 = 0;
        sub_DD8C(&dword_0, v40, v20, "#tv clearing ContentPlatterView on performAceCommand", v42);
        sub_A15C((uint64_t)v42);
      }

      sub_1B1B4(v32, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
      sub_6F998();
      uint64_t v44 = v43;
      sub_1ADD8();

      sub_73ED0();
      sub_73E58(0LL);
      sub_1ADD0();
    }

    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void *, uint64_t, uint64_t))(v38 + 136))(v27, ObjectType, v38);
    swift_unknownObjectRelease(v37);
  }

  else
  {
    uint64_t v46 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 16))( v35,  v25 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v28);
    v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.error.getter(v47);
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)sub_5827C();
      *(_WORD *)v49 = 0;
      sub_DD8C(&dword_0, v47, v48, "#tv parentCoordinator is nil", v49);
      sub_A15C((uint64_t)v49);
    }

    sub_1B1B4((uint64_t)v35, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  }

  sub_A174();
}

uint64_t sub_73C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_retain(*(void *)(a1 + a2));
}

void sub_73C64()
{
}

  ;
}

uint64_t sub_73C98()
{
  return sub_53DEC(0LL, 0LL);
}

void sub_73CA8(id a1)
{
}

uint64_t sub_73CB8(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

void sub_73CC4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_73CD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, __int128 a38)
{
  *(void *)(v39 + 16) = v40;
  return sub_9F74(&a38, v39 + 40 * v38 + 32);
}

void sub_73CE8()
{
}

uint64_t sub_73D00()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

  ;
}

uint64_t sub_73D38()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_73D50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  *(void *)(v9 + 16) = v10;
  return sub_9F74(&a9, v9 + 40 * v11 + 32);
}

uint64_t sub_73D68(__int128 *a1, uint64_t a2)
{
  return swift_isUniquelyReferenced_nonNull_native(v2);
}

uint64_t sub_73D7C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_73D90()
{
  *(void *)(v0 + 16) = v1;
  return sub_9F74((__int128 *)(v4 - 192), v0 + v2 * v3 + 32);
}

uint64_t sub_73DA4@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1, v3, v4);
}

uint64_t sub_73DB8(uint64_t a1, ...)
{
  return swift_beginAccess(v1, va, 33LL, 0LL);
}

uint64_t sub_73DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_retain(*(void *)(a1 + a2));
}

void *sub_73DD8(void *a1)
{
  return sub_109B4(a1, v1);
}

uint64_t sub_73DE0(uint64_t a1, uint64_t a2)
{
  return sub_53DEC(a1, a2);
}

BOOL sub_73DE8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

double sub_73DF8()
{
  *(void *)(v0 - 160) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - sub_9F74((__int128 *)(v1 - 144), v1 - 192) = 0u;
  *(_OWORD *)(v0 - 176) = 0u;
  return result;
}

uint64_t sub_73E08()
{
  return sub_53D5C(0LL, 0LL);
}

uint64_t sub_73E18()
{
  return sub_53D5C(0LL, 0LL);
}

uint64_t sub_73E28()
{
  return sub_294D0(*(void *)(*(void *)(v0 + 24) + 16LL));
}

void sub_73E38()
{
  *(void *)(v0 + 16) = v1;
}

  ;
}

uint64_t sub_73E58(uint64_t a1)
{
  return sub_53D5C(a1, 0LL);
}

void sub_73E60(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_73E68()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_73E70(uint64_t a1)
{
  return sub_53D5C(a1, v1);
}

void sub_73E7C()
{
}

void sub_73E88()
{
}

uint64_t sub_73E94@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

void sub_73E9C()
{
}

  ;
}

  ;
}

uint64_t sub_73ED0()
{
  return sub_53DEC(0LL, 0LL);
}

void sub_73EDC()
{
}

uint64_t sub_73EE4@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v3;
  return swift_endAccess(va);
}

void sub_73EF0()
{
  *(void *)(*(void *)(v0 + 24) + 16LL) = v1 + 1;
}

void sub_73F04()
{
}

uint64_t sub_73F10()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_73F1C()
{
  return v0();
}

uint64_t sub_73F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_unknownObjectWeakInit(v3 + qword_E9A70, 0LL);
  swift_unknownObjectWeakAssign(v7, a3);
  uint64_t v8 = sub_5E94C(a1, a2);
  swift_unknownObjectRelease(a3);
  return v8;
}

void sub_73F88()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[qword_E2368];
  uint64_t Strong = swift_weakLoadStrong(&v1[qword_E2360]);
  uint64_t v4 = swift_unknownObjectWeakLoadStrong(&v1[qword_E9A70]);
  id v5 = objc_allocWithZone((Class)type metadata accessor for ConversationView(0LL));
  uint64_t v6 = swift_retain(v2);
  id v7 = (id)sub_23730(v6, 0LL, Strong, v4);
  [v1 setView:v7];
}

void sub_74040(void *a1)
{
  id v1 = a1;
  sub_73F88();
}

uint64_t sub_74074()
{
  return sub_ADC4(v0 + qword_E9A70);
}

id sub_74084()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConversationViewController(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_740B8(uint64_t a1)
{
  return sub_ADC4(a1 + qword_E9A70);
}

uint64_t type metadata accessor for ConversationViewController(uint64_t a1)
{
  uint64_t result = qword_E46B8;
  if (!qword_E46B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConversationViewController);
  }
  return result;
}

uint64_t sub_74100(uint64_t a1)
{
  objc_super v2 = "\b";
  return swift_initClassMetadata2(a1, 256LL, 1LL, &v2, a1 + 192);
}

uint64_t sub_74140()
{
  return type metadata accessor for ConversationViewController(0LL);
}

uint64_t type metadata accessor for ContentContainerViewModel()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV25ContentContainerViewModel);
}

void sub_74168()
{
}

void *sub_74174()
{
  uint64_t v1 = *(void *)(v0 + qword_E4880);
  if (v1)
  {
    objc_super v2 = *(void **)(v0 + qword_E4880);
  }

  else
  {
    objc_super v2 = &_swiftEmptyArrayStorage;
    *(void *)(v0 + qword_E4880) = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(0LL);
    uint64_t v1 = 0LL;
  }

  swift_bridgeObjectRetain(v1);
  return v2;
}

uint64_t sub_741C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + qword_E4880);
  *(void *)(v1 + qword_E4880) = a1;
  return swift_bridgeObjectRelease(v2);
}

double sub_741D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[qword_E3F50];
  if (swift_weakLoadStrong(&v0[qword_E3F50]))
  {
    sub_76ABC();
    sub_1ADD0();
    char v3 = sub_54CD4();
    sub_1B0A0();
    if ((v3 & 1) == 0)
    {
      if (!swift_weakLoadStrong(v2)) {
        goto LABEL_17;
      }
      sub_76ABC();
      sub_1ADD0();
      sub_54F24();
      sub_1AE58();
      sub_6F998();
      id v5 = v4;
      sub_1ADD0();
      sub_1B098();

      sub_53D48();
      uint64_t v7 = v6;
      sub_1B0A0();
      if (!v7)
      {
LABEL_17:
        [*(id *)&v1[qword_E9A78] bounds];
        return CGRectGetWidth(v22);
      }

      sub_A208();
    }
  }

  sub_76A2C();
  id v9 = [v8 subviews];

  uint64_t v11 = sub_3CA48(v10, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v11);

  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0) {
      uint64_t v20 = v12;
    }
    else {
      uint64_t v20 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v12);
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter(v20);
    if (v13) {
      goto LABEL_8;
    }
LABEL_22:
    double v16 = 0.0;
    goto LABEL_23;
  }

  uint64_t v13 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v12);
  if (!v13) {
    goto LABEL_22;
  }
LABEL_8:
  if (v13 < 1)
  {
    __break(1u);
    return result;
  }

  uint64_t v15 = 0LL;
  double v16 = 0.0;
  do
  {
    if ((v12 & 0xC000000000000001LL) != 0) {
      id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v12);
    }
    else {
      id v17 = *(id *)(v12 + 8 * v15 + 32);
    }
    uint64_t v18 = v17;
    [v17 bounds];
    double Width = CGRectGetWidth(v21);

    if (v16 <= Width) {
      double v16 = Width;
    }
    ++v15;
  }

  while (v13 != v15);
LABEL_23:
  swift_bridgeObjectRelease_n(v12, 2LL);
  [*(id *)&v1[qword_E9A78] bounds];
  double result = CGRectGetWidth(v23);
  if (v16 > result) {
    return v16;
  }
  return result;
}

void sub_74414()
{
}

void sub_74420()
{
  uint64_t v2 = *(void **)(v0 + qword_E4890);
  if (!v2)
  {
    uint64_t v3 = type metadata accessor for RequestHandlingStatusView();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) init];
    sub_27904(v4, "setTranslatesAutoresizingMaskIntoConstraints:");
    sub_279F4();

    uint64_t v2 = 0LL;
  }

  id v5 = v2;
  sub_ADE8();
}

void sub_74494()
{
  uint64_t v2 = v0;
  uint64_t v3 = qword_E9A80;
  [v0 addSubview:*(void *)&v0[qword_E9A80]];
  sub_76268(v0[qword_E9A90], v0[qword_E9A88], v0[qword_E9A98]);
  sub_76A2C();
  sub_4FCF8(v4, "addSubview:");

  uint64_t v5 = qword_E9A78;
  [v0 addSubview:*(void *)&v0[qword_E9A78]];
  sub_769C0();
  sub_4FCF8(v6, "addSubview:");

  id v92 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v90 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v7 = sub_1AFD0(v90, 152LL);
  *(_OWORD *)(v7 + 16) = xmmword_AD6C0;
  id v8 = sub_76AAC(*(void **)&v0[v3]);
  id v9 = sub_DDAC((uint64_t)v8, "bottomAnchor");
  id v10 = [v8 constraintEqualToAnchor:v9];
  sub_32C48();

  *(void *)(v7 + 32) = v1;
  id v11 = sub_76A70(*(void **)&v2[v3]);
  id v12 = sub_DDAC((uint64_t)v11, "trailingAnchor");
  id v13 = sub_76980((uint64_t)v12);
  sub_32C48();

  *(void *)(v7 + 40) = v1;
  id v14 = sub_DDAC((uint64_t)[*(id *)&v2[v3] topAnchor], "topAnchor");
  id v15 = sub_76980((uint64_t)v14);
  sub_32C48();

  *(void *)(v7 + 48) = v1;
  id v16 =  sub_DDAC( (uint64_t)[*(id *)&v2[v3] leadingAnchor],  "leadingAnchor");
  id v17 = sub_76980((uint64_t)v16);
  sub_32C48();

  *(void *)(v7 + 56) = v1;
  id v18 = sub_76AAC(*(void **)&v2[v5]);
  id v19 = sub_DDAC((uint64_t)v18, "bottomAnchor");
  id v20 = sub_76980((uint64_t)v19);
  sub_32C48();

  *(void *)(v7 + 64) = v1;
  id v21 = sub_76A70(*(void **)&v2[v5]);
  id v22 = sub_DDAC((uint64_t)v21, "trailingAnchor");
  id v23 = sub_76980((uint64_t)v22);
  sub_32C48();

  *(void *)(v7 + 72) = v1;
  id v24 =  sub_3CD84( [*(id *)&v2[v5] widthAnchor],  "constraintEqualToConstant:");
  sub_3CC64();
  *(void *)(v7 + 80) = &off_D9000;
  id v25 =  sub_3CD84( [*(id *)&v2[v5] heightAnchor],  "constraintEqualToConstant:");
  sub_3CC64();
  *(void *)(v7 + 88) = &off_D9000;
  sub_76A2C();
  id v27 = sub_76AAC(v26);
  sub_3CC64();
  id v29 = sub_DDAC(v28, "bottomAnchor");
  id v30 = sub_76A20((uint64_t)v29, "constraintEqualToAnchor:constant:");
  sub_279D4();

  *(void *)(v7 + 96) = v1;
  sub_76A2C();
  id v32 = sub_76A70(v31);
  sub_3CC64();
  id v34 = sub_DDAC(v33, "trailingAnchor");
  id v35 = sub_76A20((uint64_t)v34, "constraintEqualToAnchor:constant:");
  sub_279D4();

  *(void *)(v7 + 104) = v1;
  sub_74168();
  uint64_t v37 = v36;
  id v38 = [v36 widthAnchor];
  sub_3CD54();
  if (qword_DECB0 != -1) {
    swift_once(&qword_DECB0, sub_4651C);
  }
  id v39 = [v2 constraintEqualToConstant:*(double *)&qword_E9920];
  sub_3CC64();
  *(void *)(v7 + 112) = v37;
  sub_76A2C();
  id v41 = [v40 topAnchor];
  sub_3CC64();
  id v43 = sub_DDAC(v42, "topAnchor");
  id v44 = sub_76A20((uint64_t)v43, "constraintEqualToAnchor:constant:");
  sub_279D4();

  *(void *)(v7 + 120) = &off_D9000;
  sub_769C0();
  id v46 = [v45 bottomAnchor];
  sub_3CC64();
  id v48 = sub_DDAC(v47, "bottomAnchor");
  id v49 = sub_76A04();
  sub_279D4();

  *(void *)(v7 + 128) = &off_D9000;
  sub_769C0();
  id v51 = sub_76A70(v50);
  sub_3CC64();
  id v53 = sub_DDAC(v52, "trailingAnchor");
  id v54 = sub_76A04();
  sub_279D4();

  *(void *)(v7 + 136) = &off_D9000;
  sub_769C0();
  id v56 = [v55 leadingAnchor];
  sub_3CC64();
  id v58 = sub_DDAC(v57, "leadingAnchor");
  id v59 = sub_76A04();
  sub_279D4();

  *(void *)(v7 + sub_9F74((__int128 *)(v1 - 192), v1 - 144) = &off_D9000;
  uint64_t v62 = sub_76A40(v60, v61);
  sub_3CA48(v62, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  sub_A208();
  [v92 activateConstraints:isa];

  [v2 bringSubviewToFront:*(void *)&v2[v5]];
  sub_769C0();
  sub_4FCF8(v64, "bringSubviewToFront:");

  if (AFIsInternalInstall())
  {
    id v65 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
    id v66 = [v65 siriXDebugStatusEnabled];

    if ((_DWORD)v66)
    {
      sub_76AEC();
      v68 = (void *)v67;
      sub_4FCF8(v67, "addSubview:");

      uint64_t v69 = sub_1AFD0(v90, 48LL);
      *(_OWORD *)(v69 + 16) = xmmword_AB590;
      sub_76AEC();
      id v71 = [v70 bottomAnchor];
      sub_3CC64();
      id v73 = sub_DDAC(v72, "bottomAnchor");
      id v74 = sub_76A20((uint64_t)v73, "constraintEqualToAnchor:constant:");
      sub_279D4();

      *(void *)(v69 + 32) = &off_D9000;
      sub_76AEC();
      v76 = v75;
      id v77 = [v75 rightAnchor];
      sub_3CC64();
      id v79 = sub_DDAC(v78, "rightAnchor");
      id v80 = [v66 constraintEqualToAnchor:v79 constant:-20.0];
      sub_3CD54();

      *(void *)(v69 + 40) = v76;
      sub_76A40(v81, v82);
      Class v91 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v69, v83, v84, v85, v86, v87, v88, v89);
      [v92 activateConstraints:v91];
      sub_769D4(v91);
    }
  }

uint64_t sub_74BC8()
{
  uint64_t v1 = v0;
  uint64_t v55 = sub_9E24(&qword_E0B20);
  uint64_t v56 = *(void *)(v55 - 8);
  sub_A13C();
  __chkstk_darwin(v2);
  sub_A118();
  uint64_t v57 = sub_9E24(&qword_E0B28);
  uint64_t v58 = *(void *)(v57 - 8);
  sub_A13C();
  __chkstk_darwin(v3);
  sub_A118();
  uint64_t v54 = v4;
  uint64_t v51 = sub_9E24(&qword_E4B50);
  uint64_t v52 = *(void *)(v51 - 8);
  sub_A13C();
  __chkstk_darwin(v5);
  sub_A118();
  uint64_t v50 = v6;
  uint64_t v53 = *(void *)(sub_9E24(&qword_E4B58) - 8);
  sub_A13C();
  __chkstk_darwin(v7);
  sub_A118();
  sub_9E24(&qword_E0B30);
  sub_A13C();
  __chkstk_darwin(v8);
  sub_A1F8();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_9E24(&qword_E4B60);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_A1F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_9E24(&qword_E4B68);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_A1F8();
  uint64_t v21 = v20 - v19;
  uint64_t v49 = qword_E3F38;
  uint64_t v22 = *(void *)(v0 + qword_E3F38);
  sub_AAD4(v22 + OBJC_IVAR____TtC6SiriTV20CompactMainViewModel__mode, (uint64_t)v59);
  swift_retain(v22);
  uint64_t v23 = sub_9E24(&qword_E3040);
  Published.projectedValue.getter(v23);
  sub_3CB90();
  uint64_t v24 = sub_1AF0C();
  uint64_t v25 = sub_3CA48(v24, (unint64_t *)&qword_E0540, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v59[0] = static OS_dispatch_queue.main.getter(v25);
  uint64_t v48 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
  uint64_t v26 = sub_76A80();
  sub_9E64(v26, v27, v28, v29);
  uint64_t v30 = sub_27494(&qword_E4B70, &qword_E4B60, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  sub_27320();
  Publisher.receive<A>(on:options:)(v59, v11, v12, v25, v30);
  sub_27914();
  sub_3CE70();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  uint64_t v31 = sub_1AFD0((uint64_t)&unk_CCAE8, 24LL);
  sub_76A48(v31);
  sub_27494(&qword_E4B78, &qword_E4B68, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  Publisher<>.sink(receiveValue:)(sub_76928);
  sub_1B0A0();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
  uint64_t v32 = v1 + qword_E3F40;
  sub_AAD4(v1 + qword_E3F40, (uint64_t)v59);
  sub_76AB4();
  sub_3CB90();
  sub_1ADD0();
  sub_AAD4(*(void *)(v1 + v49) + OBJC_IVAR____TtC6SiriTV20CompactMainViewModel__protectionMode, (uint64_t)v59);
  sub_1B098();
  uint64_t v33 = sub_9E24(&qword_E3048);
  Published.projectedValue.getter(v33);
  sub_3CB90();
  uint64_t v34 = sub_1B0A0();
  v59[0] = static OS_dispatch_queue.main.getter(v34);
  uint64_t v35 = sub_76A80();
  sub_9E64(v35, v36, v37, v48);
  uint64_t v38 = sub_27494(&qword_E4B80, &qword_E4B50, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  Publisher.receive<A>(on:options:)(v59, v11, v51, v25, v38);
  sub_27914();
  sub_3CE70();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
  uint64_t v39 = sub_1AFD0((uint64_t)&unk_CCAE8, 24LL);
  sub_76A48(v39);
  sub_27494(&qword_E4B88, &qword_E4B58, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  Publisher<>.sink(receiveValue:)(sub_76930);
  sub_1B0A0();
  sub_76A60(v53);
  sub_AAD4(v32, (uint64_t)v59);
  sub_76AB4();
  sub_3CB90();
  sub_1ADD0();
  sub_AAD4(*(void *)(v1 + v49) + OBJC_IVAR____TtC6SiriTV20CompactMainViewModel__hasPresentedResults, (uint64_t)v59);
  sub_1B098();
  uint64_t v40 = sub_9E24((uint64_t *)&unk_E0B70);
  Published.projectedValue.getter(v40);
  sub_3CB90();
  uint64_t v41 = sub_1B0A0();
  v59[0] = static OS_dispatch_queue.main.getter(v41);
  uint64_t v42 = sub_76A80();
  sub_9E64(v42, v43, v44, v48);
  uint64_t v45 = sub_27494( (unint64_t *)&unk_E1720,  &qword_E0B20,  (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  Publisher.receive<A>(on:options:)(v59, v11, v55, v25, v45);
  sub_27914();
  sub_3CE70();
  sub_76A60(v56);
  uint64_t v46 = sub_1AFD0((uint64_t)&unk_CCAE8, 24LL);
  sub_76A48(v46);
  sub_27494(&qword_E0B80, &qword_E0B28, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  Publisher<>.sink(receiveValue:)(sub_76938);
  sub_1AF0C();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v54, v57);
  sub_AAD4(v32, (uint64_t)v59);
  sub_76AB4();
  sub_3CB90();
  return sub_1ADD0();
}

void sub_75150(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (_BYTE *)Strong;
    uint64_t v6 = qword_E9A88;
    if (v2 != *(unsigned __int8 *)(Strong + qword_E9A88))
    {
      sub_752F4();
      v5[v6] = v2;
      sub_76268(v5[qword_E9A90], v2, v5[qword_E9A98]);
    }
  }

void sub_751E4(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    if (v2 != *(unsigned __int8 *)(Strong + qword_E9A90))
    {
      *(_BYTE *)(Strong + qword_E9A90) = v2;
      sub_76268(v2, *(_BYTE *)(Strong + qword_E9A88), *(_BYTE *)(Strong + qword_E9A98));
    }
  }

void sub_7526C(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    if (v2 != *(unsigned __int8 *)(Strong + qword_E9A98))
    {
      *(_BYTE *)(Strong + qword_E9A98) = v2;
      sub_76268(*(_BYTE *)(Strong + qword_E9A90), *(_BYTE *)(Strong + qword_E9A88), v2);
    }
  }

void sub_752F4()
{
  uint64_t v1 = v0;
  uint64_t Strong = swift_weakLoadStrong(&v0[qword_E3F50]);
  if (!Strong)
  {
LABEL_12:
    oslog = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v24 = static os_log_type_t.error.getter(oslog);
    if (os_log_type_enabled(oslog, v24))
    {
      uint64_t v25 = (uint8_t *)sub_5827C();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, oslog, v24, "setupSubviews expected viewController missing", v25, 2u);
      sub_A15C((uint64_t)v25);
    }

    goto LABEL_35;
  }

  sub_76ABC();
  oslog = (os_log_s *)sub_54E94();
  sub_1ADD0();
  uint64_t v3 = (os_log_s *)sub_9A1BC();
  if (!v3)
  {
    sub_1AE58();
    uint64_t v15 = oslog;
LABEL_11:

    goto LABEL_12;
  }

  uint64_t v4 = v3;
  id v141 = (id)swift_unknownObjectWeakLoadStrong(&v0[qword_E3F48]);
  if (!v141)
  {
    int v16 = sub_1AE58();
    sub_76A78(v16, v17, v18, v19, v20, v21, v22, v23, v138, 0LL, oslog);
    uint64_t v15 = v4;
    goto LABEL_11;
  }

  uint64_t v5 = qword_E3F38;
  sub_76A14();
  sub_50840();
  int v7 = v6;
  sub_1ADD0();
  if (v7 == 2)
  {
    sub_119C0();
    id v9 = *(id *)(v8 + 32);
    id v10 = v9;
    uint64_t v11 = sub_1ADD0();
    if (!v9)
    {
      uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
      os_log_type_t v13 = static os_log_type_t.error.getter(v12);
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)sub_5827C();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_0, v12, v13, "setupSubviews expected viewController missing", v14, 2u);
        sub_A15C((uint64_t)v14);
      }

      sub_1AE58();

      goto LABEL_34;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  int v26 = -[os_log_s removeFromParentViewController](oslog, "removeFromParentViewController");
  id v33 = sub_76A98(v26, "view", v27, v28, v29, v30, v31, v32, v138, (uint64_t)v141, oslog);
  if (!v33)
  {
    __break(1u);
    goto LABEL_37;
  }

  uint64_t v34 = v33;
  [v33 removeFromSuperview];

  id v35 = sub_DDAC((uint64_t)-[os_log_s removeFromParentViewController]( v4,  "removeFromParentViewController"), "view");
  if (!v35)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  sub_76AC4(v35);

  int v36 = [v9 removeFromParentViewController];
  if (!v9) {
    goto LABEL_20;
  }
  id v43 = [v9 view];
  if (v43)
  {
    sub_76AC4(v43);

LABEL_20:
    id v44 = sub_76A98(v36, "view", v37, v38, v39, v40, v41, v42, v139, (uint64_t)v142, osloga);
    uint64_t v45 = &selRef_constraintEqualToConstant_;
    uint64_t v46 = &off_D9000;
    uint64_t v140 = v5;
    if (v44)
    {
      uint64_t v47 = v44;
      sub_76A2C();
      sub_76AE4(v141, "addWithChild:in:", (uint64_t)oslog);

      sub_27904(v47, "setTranslatesAutoresizingMaskIntoConstraints:");
      uint64_t v48 = sub_9E24((uint64_t *)&unk_DF980);
      uint64_t v49 = sub_1AFD0(v48, 64LL);
      *(_OWORD *)(v49 + 16) = xmmword_AB340;
      id v50 = sub_769B8(v49, "leadingAnchor");
      sub_76A2C();
      id v52 = [v51 leadingAnchor];
      sub_3CC64();
      id v53 = [v50 constraintEqualToAnchor:&off_D9000];

      *(void *)(v49 + 32) = v53;
      id v55 = sub_769B8(v54, "trailingAnchor");
      sub_76A2C();
      id v57 = [v56 trailingAnchor];
      sub_3CB24();
      id v58 = sub_76994();
      sub_3CD54();

      *(void *)(v49 + 40) = v1;
      id v60 = sub_769B8(v59, "bottomAnchor");
      sub_76A2C();
      id v62 = [v61 bottomAnchor];
      sub_3CB24();
      id v63 = sub_76994();
      sub_3CD54();

      *(void *)(v49 + 48) = v1;
      uint64_t v45 = &off_D9000;
      id v65 = sub_769B8(v64, "topAnchor");
      sub_76A2C();
      id v67 = [v66 topAnchor];
      sub_3CB24();
      id v68 = sub_76994();
      sub_3CD54();

      *(void *)(v49 + 56) = v1;
      sub_76A40(v69, v70);
      uint64_t v71 = sub_76AD0();
      sub_76A54(v71, (unint64_t *)&qword_E1040);
      Class isa = sub_DDE8().super.isa;
      id v73 = (void *)v71;
      uint64_t v46 = &off_D9000;
      [v73 activateConstraints:isa];

      sub_A208();
    }

    id v74 = (objc_class *)sub_DDAC((uint64_t)v44, "view");
    if (v74)
    {
      Class v75 = v74;
      sub_76A14();
      sub_50840();
      int v77 = v76;
      sub_1ADD0();
      if (v77 == 1 || (sub_76A14(), sub_50840(), int v79 = v78, sub_1ADD0(), v79 == 2))
      {
        uint64_t v80 = qword_E9A78;
        objc_msgSend(v141, "addWithChild:in:", v4, *(void *)&v1[qword_E9A78], v140);
        sub_27904(v75, "setTranslatesAutoresizingMaskIntoConstraints:");
        uint64_t v81 = sub_9E24((uint64_t *)&unk_DF980);
        uint64_t v82 = sub_1AFD0(v81, 64LL);
        *(_OWORD *)(v82 + 16) = xmmword_AB340;
        id v83 = sub_769B8(v82, "bottomAnchor");
        id v84 = [*(id *)&v1[v80] bottomAnchor];
        id v85 = [v83 constraintEqualToAnchor:v84];

        *(void *)(v82 + 32) = v85;
        id v87 = sub_769B8(v86, "trailingAnchor");
        id v88 = [v1 trailingAnchor];
        id v89 = [v87 constraintEqualToAnchor:v88 constant:-60.0];

        *(void *)(v82 + 40) = v89;
        id v91 = sub_769B8(v90, "widthAnchor");
        uint64_t v45 = &selRef_constraintEqualToConstant_;
        id v92 = sub_3CD84(v91, "constraintEqualToConstant:");

        *(void *)(v82 + 48) = v92;
        id v94 = sub_769B8(v93, "heightAnchor");
        id v95 = sub_3CD84(v94, "constraintEqualToConstant:");

        *(void *)(v82 + 56) = v95;
        sub_76A40(v96, v97);
        v98 = (void *)sub_76AD0();
        sub_76A54((uint64_t)v98, (unint64_t *)&qword_E1040);
        Class v99 = sub_DDE8().super.isa;
        [v98 activateConstraints:v99];

        sub_A208();
        Class v75 = v99;
      }

      uint64_t v46 = &off_D9000;
    }

    sub_76A14();
    sub_50840();
    int v101 = v100;
    sub_1ADD0();
    if (v101 == 2)
    {
      if (!v9)
      {
LABEL_33:
        sub_1AE58();
LABEL_34:

LABEL_35:
        sub_769D4(oslog);
        return;
      }

      id v9 = v9;
      id v102 = [v9 view];
      if (v102)
      {
        v103 = v102;
        sub_769C0();
        sub_76AE4(v141, "addWithChild:in:", (uint64_t)v9);

        sub_27904(v103, "setTranslatesAutoresizingMaskIntoConstraints:");
        uint64_t v104 = sub_9E24((uint64_t *)&unk_DF980);
        uint64_t v105 = sub_1AFD0(v104, 64LL);
        *(_OWORD *)(v105 + 16) = xmmword_AB340;
        id v106 = sub_769B8(v105, v46[391]);
        sub_769C0();
        id v108 = [v107 v46[391]];
        sub_3CB24();
        id v109 = sub_76994();
        sub_3CD54();

        *(void *)(v105 + 32) = v1;
        id v111 = sub_769B8(v110, "trailingAnchor");
        sub_769C0();
        id v113 = [v112 trailingAnchor];
        sub_3CB24();
        id v114 = sub_76994();
        sub_3CD54();

        *(void *)(v105 + 40) = v1;
        id v116 = sub_769B8(v115, "bottomAnchor");
        sub_769C0();
        id v118 = [v117 bottomAnchor];
        sub_3CB24();
        id v119 = sub_76994();
        sub_3CD54();

        *(void *)(v105 + 48) = v1;
        id v121 = sub_769B8(v120, "topAnchor");
        v122 = v1;
        sub_769C0();
        id v124 = [v123 topAnchor];

        id v125 = [v121 constraintEqualToAnchor:v124];
        sub_3CD54();

        *(void *)(v105 + 56) = v122;
        sub_76A40(v126, v127);
        v128 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
        sub_76AD8((uint64_t)v128, (unint64_t *)&qword_E1040);
        Class v129 = sub_DDE8().super.isa;
        [v128 activateConstraints:v129];

        sub_A208();
        sub_1AE58();

        sub_76A78(v130, v131, v132, v133, v134, v135, v136, v137, v140, (uint64_t)v141, oslog);
        sub_769D4(v129);
        return;
      }
    }

    goto LABEL_33;
  }

void sub_75C0C(void *a1)
{
  uint64_t v3 = v1;
  id v133 = [objc_allocWithZone(UIView) init];
  sub_27904(v133, "setTranslatesAutoresizingMaskIntoConstraints:");
  [v1 addSubview:v133];
  id v112 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v5 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v6 = sub_1AFD0(v5, 64LL);
  *(_OWORD *)(v6 + 16) = xmmword_AB340;
  id v13 = sub_769F4(v6, "bottomAnchor", v7, v8, v9, v10, v11, v12, v104, (uint64_t)v112, 4LL, 9LL, v133);
  id v14 = sub_DDAC((uint64_t)v13, "bottomAnchor");
  id v15 = sub_DCF8();
  sub_DD84();

  *(void *)(v6 + 32) = v2;
  id v23 = sub_769F4(v16, "trailingAnchor", v17, v18, v19, v20, v21, v22, v105, (uint64_t)v113, v120, v127, v134);
  id v24 = sub_DDAC((uint64_t)v23, "trailingAnchor");
  id v25 = sub_DCF8();
  sub_DD84();

  *(void *)(v6 + 40) = v2;
  id v33 = sub_769F4(v26, "leadingAnchor", v27, v28, v29, v30, v31, v32, v106, (uint64_t)v114, v121, v128, v135);
  id v34 = sub_DDAC((uint64_t)v33, "leadingAnchor");
  id v35 = sub_DCF8();
  sub_DD84();

  *(void *)(v6 + 48) = v2;
  id v43 = sub_769F4(v36, "topAnchor", v37, v38, v39, v40, v41, v42, v107, (uint64_t)v115, v122, v129, v136);
  id v44 = sub_DDAC((uint64_t)v43, "topAnchor");
  id v45 = sub_DCF8();
  sub_DD84();

  *(void *)(v6 + 56) = v2;
  uint64_t v48 = sub_3CD1C(v46, v47);
  sub_76AD8(v48, (unint64_t *)&qword_E1040);
  Class isa = sub_76AA0().super.isa;
  sub_A208();
  id v50 = v116;
  [v116 activateConstraints:isa];

  [v137 addSubview:a1];
  sub_27904(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
  uint64_t v51 = sub_1AFD0(v5, 64LL);
  *(_OWORD *)(v51 + 16) = *(_OWORD *)v123;
  id v52 = sub_3CB1C(v51, "leadingAnchor");
  id v59 =  sub_769F4( (int)v52,  "leadingAnchor",  v53,  v54,  v55,  v56,  v57,  v58,  v108,  (uint64_t)v116,  v123[0],  v123[1],  v137);
  id v60 = sub_769A4((uint64_t)v59);
  sub_76A90();

  *(void *)(v51 + 32) = v44;
  id v62 = sub_3CB1C(v61, "trailingAnchor");
  id v69 = sub_769F4((int)v62, "trailingAnchor", v63, v64, v65, v66, v67, v68, v109, (uint64_t)v117, v124, v130, v138);
  id v70 = sub_769A4((uint64_t)v69);
  sub_76A90();

  *(void *)(v51 + 40) = v44;
  id v72 = sub_3CB1C(v71, "topAnchor");
  id v79 = sub_769F4((int)v72, "topAnchor", v73, v74, v75, v76, v77, v78, v110, (uint64_t)v118, v125, v131, v139);
  id v80 = sub_769A4((uint64_t)v79);
  sub_76A90();

  *(void *)(v51 + 48) = v44;
  id v82 = sub_3CB1C(v81, "bottomAnchor");
  id v89 = sub_769F4((int)v82, "bottomAnchor", v83, v84, v85, v86, v87, v88, v111, (uint64_t)v119, v126, v132, v140);
  id v90 = sub_769A4((uint64_t)v89);
  sub_76A90();

  *(void *)(v51 + 56) = v44;
  sub_3CD1C(v91, v92);
  Class v93 = sub_76AA0().super.isa;
  sub_A208();
  [v50 activateConstraints:v93];

  sub_74174();
  char v94 = sub_8D910();
  sub_A208();
  if ((v94 & 1) == 0)
  {
    id v95 = a1;
    uint64_t v142 = (uint64_t)sub_74174();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v97 = *(void *)((char *)&dword_10 + (v142 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v96 = *(void *)((char *)&dword_18 + (v142 & 0xFFFFFFFFFFFFFF8LL));
    if (v97 >= v96 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v96 > 1);
    }
    uint64_t v98 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v97, v95);
    sub_3CD1C(v98, v99);
    sub_741C0(v142);
    [v95 setAlpha:0.0];
    unsigned __int8 v100 = (void *)sub_1AFD0((uint64_t)&unk_CCB10, 40LL);
    v100[2] = v3;
    v100[3] = v95;
    v100[4] = v141;
    id v101 = v95;
    id v102 = v3;
    id v103 = v141;
    sub_88814(2LL, 0, (uint64_t)sub_76974, (uint64_t)v100);
    sub_1B0A0();
  }
}

void sub_76094(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  oslog = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v8 = static os_log_type_t.info.getter(oslog);
  if (os_log_type_enabled(oslog, v8))
  {
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    int v10 = (void *)swift_slowAlloc(16LL, -1LL);
    *(_DWORD *)uint64_t v9 = 138412546;
    id v14 = v6;
    id v11 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 4, v9 + 12);
    *int v10 = v6;

    *(_WORD *)(v9 + 12) = 2112;
    id v14 = v7;
    id v12 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 14, v9 + 22);
    v10[1] = v7;

    _os_log_impl(&dword_0, oslog, v8, "#canonical Added AceView - %@ to container - %@", (uint8_t *)v9, 0x16u);
    sub_9E24(&qword_E02C0);
    swift_arrayDestroy(v10, 2LL);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
  }

void sub_76268(char a1, char a2, char a3)
{
  if ((a1 & 1) != 0)
  {
    char v4 = 0;
    if (a2 != 2 && (a3 & 1) == 0) {
      char v4 = [*(id *)(v3 + qword_E9A80) isHidden];
    }
  }

  else
  {
    char v4 = 1;
  }

  id v5 = *(id *)(v3 + qword_E9A80);
  sub_21EDC(v4, 1);
}

void sub_762F4()
{
  uint64_t Strong = swift_weakLoadStrong(&v0[qword_E3F50]);
  if (Strong)
  {
    uint64_t v2 = Strong;
    swift_retain(*(void *)&v0[qword_E3F38]);
    sub_50840();
    int v4 = v3;
    sub_1ADD0();
    if (v4 == 2 && (sub_119C0(), id v6 = *(void **)(v5 + 32), v64 = v6, sub_1ADD0(), v6))
    {
      uint64_t v7 = swift_unknownObjectWeakLoadStrong(&v0[qword_E3F48]);
      if (v7)
      {
        id v14 = sub_76A98(v7, "view", v8, v9, v10, v11, v12, v13, v57, v7, v64);
        if (v14)
        {
          uint64_t v15 = v14;
          sub_769C0();
          sub_76AE4(v61, "addWithChild:in:", (uint64_t)v65);

          sub_27904(v15, "setTranslatesAutoresizingMaskIntoConstraints:");
          uint64_t v16 = sub_9E24((uint64_t *)&unk_DF980);
          uint64_t v17 = sub_1AFD0(v16, 64LL);
          *(_OWORD *)(v17 + 16) = xmmword_AB340;
          id v18 = sub_3CB1C(v17, "leadingAnchor");
          sub_769C0();
          id v20 = [v19 leadingAnchor];
          sub_32C48();
          id v21 = sub_769FC(v18, "constraintEqualToAnchor:");
          sub_3CD54();

          *(void *)(v17 + 32) = v0;
          id v23 = sub_3CB1C(v22, "trailingAnchor");
          sub_769C0();
          id v25 = [v24 trailingAnchor];
          sub_32C48();
          id v26 = sub_769FC(v23, "constraintEqualToAnchor:");
          sub_3CD54();

          *(void *)(v17 + 40) = v0;
          id v28 = sub_3CB1C(v27, "bottomAnchor");
          sub_769C0();
          id v30 = [v29 bottomAnchor];
          sub_32C48();
          id v31 = sub_769FC(v28, "constraintEqualToAnchor:");
          sub_3CD54();

          *(void *)(v17 + 48) = v0;
          id v33 = sub_3CB1C(v32, "topAnchor");
          sub_769C0();
          id v35 = [v34 topAnchor];

          id v36 = [v33 constraintEqualToAnchor:v35];
          sub_3CD54();

          *(void *)(v17 + 56) = v0;
          sub_76A40(v37, v38);
          int v39 = (void *)sub_76AD0();
          sub_76A54((uint64_t)v39, (unint64_t *)&qword_E1040);
          Class isa = sub_DDE8().super.isa;
          [v39 activateConstraints:isa];
          int v40 = sub_1AF0C();
          sub_76A78(v40, v41, v42, v43, v44, v45, v46, v47, (uint64_t)isa, (uint64_t)v61, v65);

          sub_A208();
          uint64_t v48 = (void *)v60;
        }

        else
        {
          int v49 = sub_1AF0C();
          sub_76A78(v49, v50, v51, v52, v53, v54, v55, v56, v58, (uint64_t)v61, v65);
          uint64_t v48 = v63;
        }
      }

      else
      {
        sub_1AF0C();
        uint64_t v48 = v64;
      }
    }

    else
    {
      swift_release(v2);
    }
  }

uint64_t sub_76634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[qword_E4878] = 0LL;
  uint64_t v7 = qword_E9A78;
  id v8 = objc_allocWithZone(&OBJC_CLASS___UIView);
  int v9 = v3;
  id v10 = [v8 init];
  sub_27904(v10, "setTranslatesAutoresizingMaskIntoConstraints:");
  *(void *)&v3[v7] = v10;
  uint64_t v11 = qword_E9A80;
  uint64_t v12 = type metadata accessor for ProtectionView();
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v12)) init];
  sub_27904(v13, "setTranslatesAutoresizingMaskIntoConstraints:");
  *(void *)&v9[v11] = v13;
  *(void *)&v9[qword_E4880] = 0LL;
  *(void *)&v9[qword_E4888] = 0LL;
  *(void *)&v9[qword_E4890] = 0LL;
  v9[qword_E9A88] = 0;
  v9[qword_E9A90] = 1;
  v9[qword_E9A98] = 0;

  return sub_34D4C(a1, a2, a3);
}

void sub_7675C()
{
}

id sub_767B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompactMainView(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_767EC(uint64_t a1)
{
  sub_1B4DC(qword_E9A78);
  sub_1B4DC(qword_E9A80);
  swift_bridgeObjectRelease( *(_TtC6SiriTV27ConversationViewCoordinator **)(a1 + qword_E4880),  v2,  v3,  v4,  v5,  v6,  v7,  v8);
  sub_1B4DC(qword_E4888);
}

uint64_t type metadata accessor for CompactMainView(uint64_t a1)
{
  uint64_t result = qword_E48C0;
  if (!qword_E48C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CompactMainView);
  }
  return result;
}

uint64_t sub_76890(uint64_t a1)
{
  v2[0] = "\b";
  v2[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[3] = "\b";
  v2[4] = "\b";
  v2[5] = "\b";
  v2[6] = &unk_AD700;
  v2[7] = &unk_AD718;
  v2[8] = &unk_AD718;
  return swift_initClassMetadata2(a1, 256LL, 9LL, v2, a1 + 272);
}

uint64_t sub_768FC()
{
  return type metadata accessor for CompactMainView(0LL);
}

uint64_t sub_76904()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_76928(unsigned __int8 *a1)
{
}

void sub_76930(unsigned __int8 *a1)
{
}

void sub_76938(unsigned __int8 *a1)
{
}

uint64_t sub_76940()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_76974()
{
}

id sub_76980(uint64_t a1)
{
  return objc_msgSend(v1, *(SEL *)(v2 + 3120), a1);
}

id sub_76994()
{
  return objc_msgSend(v1, *(SEL *)(v0 + 3120), v2);
}

id sub_769A4(uint64_t a1)
{
  return objc_msgSend(v1, *(SEL *)(v2 + 3120), a1);
}

id sub_769B8(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_769C0()
{
}

void sub_769D4(id a1)
{
}

id sub_769F4( int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  return [a13 a2];
}

id sub_769FC(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

id sub_76A04()
{
  return objc_msgSend(v2, *(SEL *)(v1 + 3120), v0);
}

uint64_t sub_76A14()
{
  return swift_retain(*(void *)(v0 + v1));
}

id sub_76A20(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

void sub_76A2C()
{
}

uint64_t sub_76A40(uint64_t a1, uint64_t a2)
{
  return specialized Array._endMutation()(a1, a2);
}

uint64_t sub_76A48(uint64_t a1)
{
  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

uint64_t sub_76A54(uint64_t a1, unint64_t *a2)
{
  return sub_DCB4(0LL, a2, v2);
}

uint64_t sub_76A60@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

id sub_76A70(void *a1)
{
  return [a1 *(SEL *)(v1 + 3184)];
}

void sub_76A78( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
}

uint64_t sub_76A80()
{
  return v0;
}

void sub_76A90()
{
}

id sub_76A98( int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  return [a11 a2];
}

NSArray sub_76AA0()
{
  return Array._bridgeToObjectiveC()();
}

id sub_76AAC(void *a1)
{
  return [a1 *(SEL *)(v1 + 4088)];
}

uint64_t sub_76AB4()
{
  return AnyCancellable.store(in:)(v0);
}

void sub_76ABC()
{
}

id sub_76AC4(void *a1)
{
  return [a1 *(SEL *)(v1 + 3176)];
}

uint64_t sub_76AD0()
{
  return objc_opt_self(*v0);
}

uint64_t sub_76AD8(uint64_t a1, unint64_t *a2)
{
  return sub_DCB4(0LL, a2, v2);
}

id sub_76AE4(id a1, SEL a2, uint64_t a3)
{
  return objc_msgSend(a1, a2, a3, v3);
}

void sub_76AEC()
{
}

uint64_t sub_76AF4@<X0>( void *a1@<X0>, uint64_t (*a2)(void, void, void)@<X1>, uint64_t a3@<X2>, int a4@<W3>, unsigned int a5@<W4>, void *a6@<X8>)
{
  unsigned int v302 = a5;
  uint64_t v269 = a3;
  v268 = a2;
  v278 = a6;
  uint64_t v297 = type metadata accessor for ImageElement.SourceType(0LL);
  id v8 = *(void (***)(uint64_t, void, uint64_t))(v297 - 8);
  __chkstk_darwin(v297);
  sub_A118();
  uint64_t v10 = sub_A19C(v9);
  uint64_t v11 = type metadata accessor for ImageElement.Background(v10);
  uint64_t v298 = *(void *)(v11 - 8);
  uint64_t v299 = v11;
  sub_A13C();
  __chkstk_darwin(v12);
  sub_A118();
  uint64_t v14 = sub_A19C(v13);
  uint64_t v15 = type metadata accessor for ImageElement(v14);
  sub_A228(v15, (uint64_t)&v308);
  uint64_t v282 = v16;
  sub_A13C();
  __chkstk_darwin(v17);
  sub_A118();
  uint64_t v281 = v18;
  sub_9E24(&qword_E0F80);
  sub_A13C();
  __chkstk_darwin(v19);
  sub_A118();
  uint64_t v21 = sub_A19C(v20);
  uint64_t v22 = type metadata accessor for ImageElement.CornerRoundingMode(v21);
  sub_A228(v22, (uint64_t)&v298);
  uint64_t v265 = v23;
  sub_A13C();
  __chkstk_darwin(v24);
  sub_A118();
  uint64_t v26 = sub_A19C(v25);
  uint64_t v27 = type metadata accessor for ImageElement.RenderingMode(v26);
  sub_A228(v27, (uint64_t)&v292);
  uint64_t v260 = v28;
  sub_A13C();
  __chkstk_darwin(v29);
  sub_A118();
  uint64_t v31 = sub_A19C(v30);
  uint64_t v32 = type metadata accessor for ImageElement.ContentMode(v31);
  sub_A228(v32, (uint64_t)&v287);
  uint64_t v257 = v33;
  sub_A13C();
  __chkstk_darwin(v34);
  sub_A118();
  uint64_t v263 = v35;
  sub_9E24(&qword_DF5E0);
  sub_A13C();
  __chkstk_darwin(v36);
  sub_A118();
  uint64_t v38 = sub_A19C(v37);
  uint64_t v39 = type metadata accessor for ImageElement.Url(v38);
  sub_A228(v39, (uint64_t)&v293);
  uint64_t v261 = v40;
  sub_A13C();
  __chkstk_darwin(v41);
  sub_A118();
  uint64_t v43 = sub_A19C(v42);
  uint64_t v44 = type metadata accessor for URL(v43);
  sub_A228(v44, (uint64_t)&v309);
  uint64_t v274 = v45;
  sub_A13C();
  __chkstk_darwin(v46);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v47);
  sub_A258();
  uint64_t v272 = v48;
  sub_9E24(&qword_DF5E8);
  sub_A13C();
  __chkstk_darwin(v49);
  sub_A148();
  sub_A12C();
  uint64_t v51 = __chkstk_darwin(v50);
  uint64_t v300 = (uint64_t)&v254 - v52;
  __chkstk_darwin(v51);
  sub_A258();
  uint64_t v304 = v53;
  sub_9E24((uint64_t *)&unk_DF5F0);
  sub_A13C();
  __chkstk_darwin(v54);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v55);
  sub_A258();
  uint64_t v305 = v56;
  uint64_t v291 = sub_9E24(&qword_E4B90);
  sub_A13C();
  __chkstk_darwin(v57);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v58);
  sub_A12C();
  __chkstk_darwin(v59);
  sub_A258();
  uint64_t v294 = v60;
  sub_9E24(&qword_DF5C8);
  sub_A13C();
  __chkstk_darwin(v61);
  sub_A118();
  uint64_t v296 = v62;
  uint64_t v63 = type metadata accessor for ImageElement.Symbol(0LL);
  sub_A228(v63, (uint64_t)&v310);
  uint64_t v289 = v64;
  sub_A13C();
  __chkstk_darwin(v65);
  sub_A1F8();
  uint64_t v68 = v67 - v66;
  sub_9E24((uint64_t *)&unk_DF5D0);
  sub_A13C();
  __chkstk_darwin(v69);
  sub_A148();
  uint64_t v292 = v70;
  __chkstk_darwin(v71);
  int v73 = (char *)&v254 - v72;
  sub_9E24(&qword_E3480);
  sub_A13C();
  __chkstk_darwin(v74);
  sub_A148();
  sub_A12C();
  uint64_t v76 = __chkstk_darwin(v75);
  int v78 = (char *)&v254 - v77;
  __chkstk_darwin(v76);
  id v80 = (char *)&v254 - v79;
  uint64_t v303 = *(void *)(sub_77E60() - 8);
  sub_A13C();
  __chkstk_darwin(v81);
  sub_A148();
  sub_A12C();
  uint64_t v83 = __chkstk_darwin(v82);
  int v85 = (char *)&v254 - v84;
  uint64_t v86 = __chkstk_darwin(v83);
  int v88 = (char *)&v254 - v87;
  uint64_t v89 = __chkstk_darwin(v86);
  uint64_t v91 = (char *)&v254 - v90;
  __chkstk_darwin(v89);
  sub_A258();
  uint64_t v306 = v92;
  uint64_t v307 = v93;
  sub_A3BC((uint64_t)v80, v94, v95, v92);
  uint64_t v96 = type metadata accessor for Color(0LL);
  v293 = v73;
  uint64_t v284 = v96;
  sub_9E64((uint64_t)v73, 1LL, 1LL, v96);
  if (qword_DED78 != -1) {
    swift_once(&qword_DED78, sub_77C14);
  }
  uint64_t v97 = qword_E9AA0;
  uint64_t v295 = *(void *)algn_E9AA8;
  sub_A068((uint64_t)v80, &qword_E3480);
  uint64_t v98 = objc_opt_self(&OBJC_CLASS___SASportsTeam);
  uint64_t v99 = sub_77E6C(v98);
  v301 = v80;
  v280 = v8;
  id v288 = a1;
  uint64_t v285 = v97;
  v255 = v85;
  if (v99)
  {
    uint64_t v100 = v307;
    id v101 = v268;
    v268 = *(uint64_t (**)(void, void, void))(v303 + 16);
    uint64_t v102 = v268(v307, v101, v306);
    sub_77E50(v102, v103, &qword_E3480);
    uint64_t v104 = v294;
  }

  else
  {
    uint64_t v105 = objc_opt_self(&OBJC_CLASS___SASportsAthlete);
    uint64_t v106 = sub_77E6C(v105);
    uint64_t v107 = v306;
    if (v106)
    {
      uint64_t v108 = v269;
      sub_9F98(v269, (uint64_t)v78, &qword_E3480);
      uint64_t v109 = v303;
      sub_77E3C((uint64_t)v88, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v303 + 16));
      if (sub_77E98((uint64_t)v78) == 1)
      {
        sub_53D2C((uint64_t)v91, (uint64_t)v88);
        sub_A068((uint64_t)v78, &qword_E3480);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v109 + 8))(v88, v107);
        sub_53D2C((uint64_t)v91, (uint64_t)v78);
      }

      uint64_t v100 = v307;
      sub_53D2C(v307, (uint64_t)v91);
      sub_9F98(v108, (uint64_t)v301, &qword_E3480);
      uint64_t v112 = v292;
      static Color.white.getter();
      uint64_t v113 = (uint64_t)v293;
      sub_629D0((uint64_t)v293);
      sub_77E30();
      sub_77E78(v114, v115, v116);
      sub_A03C(v112, v113, (uint64_t *)&unk_DF5D0);
    }

    else
    {
      uint64_t v100 = v307;
      uint64_t v110 = sub_77E3C(v307, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v303 + 16));
      sub_77E50(v110, v111, &qword_E3480);
    }

    uint64_t v104 = v294;
    uint64_t v97 = v285;
  }

  uint64_t v117 = v291;
  uint64_t v118 = v296;
  sub_A58C();
  sub_9E64(v119, v120, v121, v299);
  sub_77C38(v97, v295, v100, v118);
  sub_A068(v118, &qword_DF5C8);
  double v122 = static ImageElement.size(for:idiom:)(v100, 5LL);
  double v124 = v123;
  LODWORD(v291) = a4;
  char v125 = (v302 == 2) | v302;
  uint64_t v126 = v104 + *(int *)(v117 + 48);
  uint64_t v127 = (double *)(v104 + *(int *)(v117 + 64));
  id v128 = [(id)objc_opt_self(UIScreen) mainScreen];
  id v129 = [v128 traitCollection];

  [v129 displayScale];
  double v131 = v130;

  double v132 = sub_53180(v104, v126, (a4 == 2) | (a4 & 1), v125 & 1, v122, v124, v131);
  double v134 = v133;
  *uint64_t v127 = v132;
  v127[1] = v133;
  uint64_t v135 = type metadata accessor for ImageElement.AspectRatio(0LL);
  uint64_t v136 = v305;
  sub_A58C();
  sub_9E64(v137, v138, v139, v135);
  sub_A58C();
  sub_9E64(v140, v141, v142, v297);
  uint64_t v143 = v270;
  uint64_t v144 = v270 + *(int *)(v117 + 48);
  v145 = (double *)(v270 + *(int *)(v117 + 64));
  sub_9F98(v104, v270, (uint64_t *)&unk_E0280);
  sub_9F98(v126, v144, (uint64_t *)&unk_E0280);
  double *v145 = v132;
  v145[1] = v134;
  int v146 = sub_9F8C(v143, 1LL, v286);
  uint64_t v276 = v68;
  if (v146 == 1)
  {
    sub_629D0(v144);
    sub_629D0(v143);
    v147 = v280;
    uint64_t v148 = v302;
    uint64_t v149 = v136;
    uint64_t v150 = v306;
    uint64_t v151 = v275;
    uint64_t v152 = v297;
  }

  else
  {
    v153 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v274 + 32);
    uint64_t v154 = v274;
    uint64_t v269 = v126;
    uint64_t v155 = v272;
    sub_1B1AC(v272, v143, v153);
    sub_A068(v144, (uint64_t *)&unk_E0280);
    float v156 = v132;
    float v157 = v134;
    uint64_t v158 = v287;
    ImageElement.AspectRatio.init(width:height:)(v159, v156, v157);
    sub_A068(v136, (uint64_t *)&unk_DF5F0);
    sub_77E30();
    sub_9E64(v160, v161, v162, v135);
    sub_A03C(v158, v136, (uint64_t *)&unk_DF5F0);
    sub_1B1AC(v273, v155, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 16));
    uint64_t v163 = v256;
    uint64_t v270 = v256 + *(int *)(v117 + 48);
    uint64_t v164 = v270;
    v165 = (double *)(v256 + *(int *)(v117 + 64));
    sub_9F98(v104, v256, (uint64_t *)&unk_E0280);
    sub_9F98(v269, v164, (uint64_t *)&unk_E0280);
    double *v165 = v132;
    v165[1] = v134;
    uint64_t v166 = v258;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v289 + 16))(v258, v68, v290);
    uint64_t v167 = enum case for ImageElement.SourceType.LoadingImage.symbol(_:);
    uint64_t v168 = type metadata accessor for ImageElement.SourceType.LoadingImage(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v168 - 8) + 104LL))(v166, v167, v168);
    sub_77E30();
    sub_9E64(v169, v170, v171, v168);
    v172 = v255;
    uint64_t v173 = v306;
    v268(v255, v307, v306);
    uint64_t v174 = v305;
    sub_9F98(v305, v158, (uint64_t *)&unk_DF5F0);
    uint64_t v175 = v292;
    sub_9F98((uint64_t)v293, v292, (uint64_t *)&unk_DF5D0);
    uint64_t v176 = v263;
    sub_A420( v263,  enum case for ImageElement.ContentMode.fit(_:),  *(uint64_t (**)(uint64_t, uint64_t, void))(v257 + 104));
    uint64_t v177 = v264;
    sub_A420( v264,  enum case for ImageElement.RenderingMode.original(_:),  *(uint64_t (**)(uint64_t, uint64_t, void))(v260 + 104));
    uint64_t v178 = v266;
    sub_A420( v266,  enum case for ImageElement.CornerRoundingMode.default(_:),  *(uint64_t (**)(uint64_t, uint64_t, void))(v265 + 104));
    uint64_t v253 = v175;
    uint64_t v179 = v259;
    v180 = v172;
    uint64_t v150 = v173;
    uint64_t v181 = v158;
    uint64_t v148 = v302;
    ImageElement.Url.init(_:darkModeSource:loadingImage:contentMode:imageStyle:aspectRatio:fixedWidth:fixedHeight:renderingMode:backgroundColor:cornerRoundingMode:insetPadding:)( v273,  v270,  v166,  v176,  v180,  v181,  v291,  v302,  0.0,  v177,  v253,  v178);
    sub_A4C0();
    sub_A55C(v272, v182);
    uint64_t v183 = v304;
    sub_A068(v304, &qword_DF5E8);
    sub_A068(v163, (uint64_t *)&unk_E0280);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v261 + 32))(v183, v179, v262);
    v147 = v280;
    uint64_t v152 = v297;
    v280[13](v183, enum case for ImageElement.SourceType.url(_:), v297);
    sub_77E30();
    sub_9E64(v184, v185, v186, v152);
    uint64_t v149 = v174;
    uint64_t v151 = v275;
  }

  sub_A58C();
  sub_9E64(v187, v188, v189, v152);
  uint64_t v190 = v271;
  sub_9F98((uint64_t)v301, v271, &qword_E3480);
  v191 = (void (**)(uint64_t, void, uint64_t))&unk_AB000;
  if (sub_77E98(v190) == 1)
  {
    v191 = v147;
    sub_A068(v190, &qword_E3480);
  }

  else
  {
    uint64_t v192 = v303;
    uint64_t v193 = sub_1B1AC(v267, v190, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v303 + 32));
    id v194 = (id)SRUIFGetLocale(v193);
    if (v194)
    {
      v195 = v194;
      static Locale._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v196 = type metadata accessor for Locale(0LL);
      sub_77E30();
      sub_9E64(v197, v198, v199, v196);
      Class isa = 0LL;
      if (sub_9F8C(v151, 1LL, v196) != 1)
      {
        Class isa = Locale._bridgeToObjectiveC()().super.isa;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v196 - 8) + 8LL))(v151, v196);
      }
    }

    else
    {
      uint64_t v201 = type metadata accessor for Locale(0LL);
      sub_A3BC(v151, v202, v203, v201);
      Class isa = 0LL;
    }

    id v204 = objc_msgSend(v288, "siritv_monogram:", isa);

    if (v204)
    {
      uint64_t v205 = static String._unconditionallyBridgeFromObjectiveC(_:)(v204);
      unint64_t v207 = v206;

      uint64_t v208 = HIBYTE(v207) & 0xF;
      if ((v207 & 0x2000000000000000LL) == 0) {
        uint64_t v208 = v205 & 0xFFFFFFFFFFFFLL;
      }
      if (v208)
      {
        uint64_t v209 = sub_9E24((uint64_t *)&unk_E0F90);
        uint64_t v210 = type metadata accessor for _ProtoIdiom(0LL);
        sub_77E84();
        uint64_t v211 = v152;
        uint64_t v214 = v213 & ~v212;
        uint64_t v216 = swift_allocObject(v209, v214 + v215, v212 | 7);
        *(_OWORD *)(v216 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
        uint64_t v217 = v216 + v214;
        uint64_t v152 = v211;
        v191 = v147;
        uint64_t v149 = v305;
        (*(void (**)(uint64_t, void, uint64_t))(v150 + 104))( v217,  enum case for _ProtoIdiom.default(_:),  v210);
        uint64_t v218 = sub_29D48(v216);
        uint64_t v219 = v281;
        uint64_t v220 = v267;
        static ImageElement.contactImageMonogram(letters:imageStyle:idioms:)(v205, v207, v267, v218);
        swift_bridgeObjectRelease(v218);
        uint64_t v221 = sub_A470();
        uint64_t v222 = ImageElement.sourceTypes.getter(v221);
        uint64_t v223 = v254;
        sub_11254(v222, v254);
        sub_A470();
        sub_A4C0();
        sub_A55C(v219, v224);
        (*(void (**)(uint64_t, uint64_t))(v192 + 8))(v220, v306);
        uint64_t v225 = v300;
        sub_A068(v300, &qword_DF5E8);
        sub_A03C(v223, v225, &qword_DF5E8);
      }

      else
      {
        sub_77E18();
        sub_A470();
      }
    }

    else
    {
      sub_77E18();
    }

    uint64_t v148 = v302;
  }

  uint64_t v226 = v292;
  sub_77E78(v292, 1LL, 1LL);
  uint64_t v227 = v287;
  sub_9F98(v149, v287, (uint64_t *)&unk_DF5F0);
  uint64_t v228 = v277;
  ImageElement.Background.init(color:aspectRatio:fixedWidth:fixedHeight:)(v226, v227, v291, v148);
  uint64_t v229 = v299;
  uint64_t v230 = v296;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v298 + 16))(v296, v228, v299);
  sub_77E30();
  sub_9E64(v231, v232, v233, v229);
  uint64_t v234 = v279;
  sub_77C38(v285, v295, v307, v230);
  sub_A068(v230, &qword_DF5C8);
  v235 = v191;
  v191[13](v234, enum case for ImageElement.SourceType.symbol(_:), v152);
  uint64_t v236 = sub_9E24((uint64_t *)&unk_E0F90);
  uint64_t v237 = type metadata accessor for _ProtoIdiom(0LL);
  sub_77E84();
  uint64_t v240 = v239 & ~v238;
  uint64_t v242 = swift_allocObject(v236, v240 + v241, v238 | 7);
  *(_OWORD *)(v242 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
  (*(void (**)(uint64_t, void, uint64_t))(v226 + 104))( v242 + v240,  enum case for _ProtoIdiom.default(_:),  v237);
  uint64_t v243 = sub_29D48(v242);
  uint64_t v244 = v281;
  uint64_t v245 = v304;
  uint64_t v246 = v300;
  static ImageElement.siritv_sources(primarySource:secondarySource:fallbackSource:idioms:)(v304, v300, v234, v281);
  swift_bridgeObjectRelease(v243);
  uint64_t v247 = type metadata accessor for VisualProperty(0LL);
  v248 = v278;
  v278[3] = v247;
  v248[4] = &protocol witness table for VisualProperty;
  sub_9F38(v248);
  uint64_t v249 = v283;
  VisualPropertyConvertible<>.asVisualProperty()(v283);
  sub_A4C0();
  v250(v244, v249);
  ((void (*)(uint64_t, uint64_t))v235[1])(v234, v152);
  (*(void (**)(uint64_t, uint64_t))(v298 + 8))(v228, v229);
  sub_629D0(v246);
  sub_629D0(v245);
  sub_A068(v305, (uint64_t *)&unk_DF5F0);
  sub_A068(v294, &qword_E4B90);
  sub_A4C0();
  sub_A55C(v276, v251);
  sub_A068((uint64_t)v293, (uint64_t *)&unk_DF5D0);
  sub_A068((uint64_t)v301, &qword_E3480);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v303 + 8))(v307, v306);
}

void sub_77C14()
{
  qword_E9AA0 = 0x73697370696C6C65LL;
  *(void *)algn_E9AA8 = 0xE800000000000000LL;
}

uint64_t sub_77C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = type metadata accessor for Vibrancy(0LL);
  uint64_t v4 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  sub_A1F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for ImageElement.SymbolRenderingMode(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_A1F8();
  uint64_t v12 = v11 - v10;
  sub_9E24(&qword_DF5C8);
  sub_A13C();
  __chkstk_darwin(v13);
  sub_A1F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_77E60();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_A1F8();
  uint64_t v21 = v20 - v19;
  sub_9E24((uint64_t *)&unk_DF5D0);
  sub_A13C();
  __chkstk_darwin(v22);
  sub_A1F8();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = type metadata accessor for Color(0LL);
  sub_A3BC(v25, v27, v28, v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, a3, v17);
  sub_9F98(a4, v16, &qword_DF5C8);
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))( v12,  enum case for ImageElement.SymbolRenderingMode.default(_:),  v8);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v7, enum case for Vibrancy.default(_:), v33);
  swift_bridgeObjectRetain(a2);
  char v30 = 0;
  return ImageElement.Symbol.init(_:darkModeName:tintColor:symbolRenderingMode:imageStyle:background:punchesThroughBackground:vibrancy:)( a1,  a2,  0LL,  0LL,  v25,  v12,  v21,  v16,  v30,  v7);
}

uint64_t sub_77E18()
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 8))(*(void *)(v2 - 448), v0);
}

  ;
}

uint64_t sub_77E3C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v4 = *(void *)(v3 - 440);
  *(void *)(v3 - 440) = a2;
  return a2(a1, v4, v2);
}

void sub_77E50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_77E60()
{
  return type metadata accessor for ImageElement.ImageStyle(0LL);
}

uint64_t sub_77E6C(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_77E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9E64(a1, a2, a3, *(void *)(v3 - 312));
}

  ;
}

uint64_t sub_77E98(uint64_t a1)
{
  return sub_9F8C(a1, 1LL, v1);
}

void sub_77EA4()
{
  unk_E4BA7 = -18;
}

void sub_77ED4()
{
  qword_E4BA8 = 0x474E49444E415453LL;
  unk_E4BB0 = 0xE900000000000053LL;
}

uint64_t sub_77EFC()
{
  uint64_t v0 = type metadata accessor for Color(0LL);
  sub_9DCC(v0, qword_E4BB8);
  sub_9E0C(v0, (uint64_t)qword_E4BB8);
  return static Color.secondary.getter();
}

void sub_77F44()
{
  uint64_t v59 = v2;
  uint64_t v60 = v3;
  uint64_t v5 = v4;
  id v7 = v6;
  uint64_t v8 = (void *)type metadata accessor for Logger(0LL);
  uint64_t v9 = *(v8 - 1);
  __chkstk_darwin(v8);
  sub_A344();
  sub_7C094();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___SASportsStandingsSnippet);
  uint64_t v14 = swift_dynamicCastObjCClass(v5, v13);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    id v55 = v5;
    sub_78314(v15);
    if (v16)
    {
      sub_7841C(v15);

      return;
    }

    uint64_t v54 = v9;
    if (AFSiriLogContextConnection)
    {
      uint64_t v37 = Logger.init(_:)(AFSiriLogContextConnection);
      os_log_type_t v38 = static os_log_type_t.error.getter(v37);
      id v39 = v55;
      uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
      os_log_type_t v41 = v38;
      if (os_log_type_enabled(v40, v38))
      {
        uint64_t v42 = (uint8_t *)sub_A1D0(12LL);
        uint64_t v52 = (void *)sub_A1D0(8LL);
        id v55 = v7;
        *(_DWORD *)uint64_t v42 = 138412290;
        uint64_t v57 = (uint64_t)v15;
        id v43 = v39;
        id v53 = v39;
        id v44 = v43;
        id v7 = v55;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, v42 + 4, v42 + 12);
        uint64_t v45 = (uint64_t)v52;
        *uint64_t v52 = v15;

        id v39 = v53;
        _os_log_impl(&dword_0, v40, v41, "#aceshim Unrecognized format - %@", v42, 0xCu);
        sub_9E24(&qword_E02C0);
        swift_arrayDestroy(v45, 1LL);
        sub_A15C(v45);
        sub_A15C((uint64_t)v42);
      }

      else
      {

        uint64_t v40 = (os_log_s *)v39;
      }

      uint64_t v48 = v54;

      uint64_t v46 = *(void (**)(char *, void *))(v48 + 8);
      uint64_t v47 = v12;
      goto LABEL_13;
    }
  }

  else
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v17 = Logger.init(_:)(AFSiriLogContextConnection);
      os_log_type_t v18 = static os_log_type_t.debug.getter(v17);
      id v19 = v0;
      uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
      if (os_log_type_enabled(v20, v18))
      {
        uint64_t v21 = sub_A1D0(22LL);
        uint64_t v22 = sub_A1D0(64LL);
        uint64_t v54 = v9;
        uint64_t v23 = v22;
        uint64_t v57 = v22;
        *(_DWORD *)uint64_t v21 = 136315394;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v24 = sub_9E24(&qword_E4BF8);
        id v55 = v8;
        uint64_t v25 = String.init<A>(describing:)(&ObjectType, v24);
        uint64_t v27 = sub_7C120(v25, v26);
        sub_7BF90(v27, v28, v29, v21 + 12);

        uint64_t v30 = sub_A208();
        *(_WORD *)(v21 + 12) = 2080;
        sub_3CA48(v30, &qword_E4C00, &OBJC_CLASS___SASportsStandingsSnippet_ptr);
        uint64_t ObjectType = sub_9E24(&qword_E4C08);
        uint64_t v31 = sub_9E24(&qword_E4C10);
        uint64_t v32 = String.init<A>(describing:)(&ObjectType, v31);
        uint64_t v34 = sub_7C120(v32, v33);
        sub_7BF90(v34, v35, v36, v21 + 22);
        sub_A208();
        _os_log_impl(&dword_0, v20, v18, "#aceshim %s expecting %s", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy(v23, 2LL);
        sub_A15C(v23);
        sub_A15C(v21);

        (*(void (**)(char *, id))(v54 + 8))(v1, v55);
LABEL_14:
        uint64_t v49 = sub_A600();
        sub_A3BC((uint64_t)v7, v50, v51, v49);
        sub_A174();
        return;
      }

      uint64_t v46 = *(void (**)(char *, void *))(v9 + 8);
      uint64_t v47 = v1;
LABEL_13:
      v46(v47, v8);
      goto LABEL_14;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_78314(void *a1)
{
  uint64_t v3 = sub_5CA80(a1);
  sub_7C22C(v3);
  if (!v1) {
    goto LABEL_8;
  }
  uint64_t v4 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_5CA80(a1);
  if (!v4)
  {
    __break(1u);
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v12 = *(void *)v4->super.viewControllers;
  swift_bridgeObjectRelease(v4, v5, v6, v7, v8, v9, v10, v11);
  if (!v12)
  {
LABEL_8:
    uint64_t v15 = sub_5CAD4(a1);
    sub_7C22C(v15);
    return;
  }

  sub_7BD24(a1, (SEL *)&selRef_selectedEntities);
  sub_7C22C(v13);
  sub_7BD24(a1, (SEL *)&selRef_selectedEntities);
  if (!v14)
  {
LABEL_10:
    __break(1u);
    return;
  }

  if (v14 >> 62) {
    sub_40434(v14 & 0xFFFFFFFFFFFFFF8LL);
  }
  sub_A470();
}

void sub_7841C(void *a1)
{
  uint64_t v3 = sub_7C1B0();
  sub_9E64(v3, v4, v5, v6);
  sub_78314(a1);
  __asm { BR              X10 }

uint64_t sub_78490()
{
  uint64_t v1 = sub_7C1B0();
  return sub_9E64(v1, v2, v3, v4);
}

#error "784C4: call analysis failed (funcsize=18)"
void sub_78524( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  unint64_t v66;
  _TtC6SiriTV27ConversationViewCoordinator *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t (*v80)(void);
  uint64_t v81;
  uint64_t (*v82)(void);
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  _TtC6SiriTV27ConversationViewCoordinator *v112;
  uint64_t v113;
  void (*v114)(void, void, void);
  uint64_t (*v115)(void, void, void);
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  unint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  unint64_t v131;
  double v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  SEL v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  BOOL v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  id v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  _TtC6SiriTV27ConversationViewCoordinator *v202;
  void *v203;
  SEL v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  char *v213;
  unint64_t v214;
  uint64_t v215;
  void *v216;
  unsigned int v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unsigned int v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t (*v236)(void, void, void);
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  __int128 v257;
  __int128 v258;
  void *v259;
  __int128 v260;
  void *v261;
  void *v262;
  sub_A36C();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v225 = v26;
  uint64_t v215 = sub_7C1FC();
  uint64_t v27 = *(void *)(v215 - 8);
  __chkstk_darwin(v215);
  uint64_t v29 = (char *)&v211 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9E24(&qword_E0F80);
  sub_A13C();
  __chkstk_darwin(v30);
  sub_A344();
  unint64_t v33 = v31 - v32;
  __chkstk_darwin(v34);
  sub_A258();
  sub_A398(v35);
  sub_9E24(&qword_E3468);
  sub_A13C();
  __chkstk_darwin(v36);
  sub_A118();
  os_log_type_t v38 = sub_A19C(v37);
  id v39 = type metadata accessor for Table(v38);
  sub_A228(v39, (uint64_t)&v250);
  uint64_t v223 = v40;
  sub_A13C();
  __chkstk_darwin(v41);
  sub_A118();
  uint64_t v230 = sub_7C0D0(v42);
  uint64_t v229 = *(void *)(v230 - 8);
  sub_A13C();
  __chkstk_darwin(v43);
  sub_A118();
  uint64_t v45 = sub_A19C(v44);
  uint64_t v46 = type metadata accessor for TableRow.Content(v45);
  uint64_t v247 = *(void *)(v46 - 8);
  sub_A13C();
  __chkstk_darwin(v47);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v48);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v49);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v50);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v51);
  sub_A258();
  sub_A398(v52);
  sub_9E24(&qword_E3480);
  sub_A13C();
  __chkstk_darwin(v53);
  sub_A118();
  uint64_t v239 = v54;
  id v55 = sub_7C010();
  sub_A228(v55, (uint64_t)&v261);
  uint64_t v237 = v56;
  sub_A13C();
  __chkstk_darwin(v57);
  sub_A118();
  uint64_t v59 = sub_A19C(v58);
  uint64_t v60 = type metadata accessor for Table.Column(v59);
  uint64_t v61 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v62);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v63);
  sub_7C094();
  __chkstk_darwin(v64);
  sub_7C084();
  uint64_t v220 = v25;
  sub_5B724();
  uint64_t v66 = (unint64_t)v65;
  swift_bridgeObjectRelease(v67, (SEL)v67, v65, v68, v69, v70, v71, v72);
  sub_A1C8();
  int v73 = v66 >> 62;
  uint64_t v242 = v66;
  if (v66 >> 62)
  {
    uint64_t v214 = v66 >> 62;
    if ((v66 & 0x8000000000000000LL) != 0LL) {
      uint64_t v198 = v242;
    }
    else {
      uint64_t v198 = v66 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v242);
    uint64_t v199 = v198;
    uint64_t v66 = v242;
    uint64_t v74 = _CocoaArrayWrapper.endIndex.getter(v199);
    sub_A208();
    int v73 = v214;
    if (v74) {
      goto LABEL_3;
    }
LABEL_63:
    v200 = sub_A600();
    sub_9E64(v225, 1LL, 1LL, v200);
    sub_7BDD0(v66);
    return;
  }

  uint64_t v74 = *(void *)((char *)&dword_10 + (v66 & 0xFFFFFFFFFFFFF8LL));
  if (!v74) {
    goto LABEL_63;
  }
LABEL_3:
  uint64_t v214 = v73;
  uint64_t v240 = v74;
  sub_7BFBC();
  v248 = v46;
  v235 = v74;
  sub_3CE84();
  uint64_t v201 = sub_1B040(0LL);
  uint64_t v202 = (_TtC6SiriTV27ConversationViewCoordinator *)v66;
  uint64_t v203 = (void *)v201;
  swift_bridgeObjectRelease(v202, v204, v205, v206, v207, v208, v209, v210);
  uint64_t v76 = sub_ED8C(v75, "siritv_firstMetadata");

  uint64_t v216 = v76;
  if (!v76)
  {
    sub_7BECC((uint64_t)&a10);
    sub_A600();
    sub_7C064();
    sub_7BDE8(v96, v97, v98, v99);
    return;
  }

  uint64_t v234 = v33;
  uint64_t v213 = v29;
  uint64_t v77 = sub_FAB8(0LL, 4LL, 0LL, (uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v233 = sub_9E24(&qword_E3470);
  int v78 = enum case for Table.ColumnSize.auto(_:);
  sub_7C204();
  sub_7BF50();
  uint64_t v232 = v78;
  uint64_t v231 = v79;
  sub_A4EC(v80);
  type metadata accessor for Table.ColumnAlignment(0LL);
  sub_7BF50();
  uint64_t v226 = v81;
  sub_A4EC(v82);
  uint64_t v217 = enum case for Table.Column.cell(_:);
  sub_7C028(v20, enum case for Table.Column.cell(_:));
  uint64_t v84 = *(void *)(v77 + 16);
  uint64_t v83 = *(void *)(v77 + 24);
  int v85 = v77;
  uint64_t v212 = v27;
  if (v84 >= v83 >> 1) {
    int v85 = sub_FAB8(v83 > 1, v84 + 1, 1LL, v77);
  }
  *(void *)(v85 + swift_unknownObjectWeakDestroy(v0 + 16) = v84 + 1;
  uint64_t v86 = (*(unsigned __int8 *)(v61 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v87 = *(void *)(v61 + 72);
  sub_7BEA4(v85 + v86 + v87 * v84);
  sub_7C0F4();
  sub_A4CC((uint64_t)&v254);
  sub_A4CC((uint64_t)&v248);
  sub_7C028(v21, v217);
  sub_7BF78();
  if (v89) {
    int v85 = sub_7BE14(v88);
  }
  uint64_t v90 = v243;
  sub_7BF60();
  sub_7C028(v245, enum case for Table.Column.spacer(_:));
  sub_7BF78();
  if (v89) {
    int v85 = sub_7BE14(v91);
  }
  sub_7BF60();
  sub_7C0F4();
  uint64_t v93 = v90 + v92;
  sub_A4CC((uint64_t)&v254);
  sub_A4CC((uint64_t)&v248);
  sub_7C028(v90, v217);
  uint64_t v94 = *(void *)(v85 + 16);
  sub_7BF78();
  if (v89) {
    int v85 = sub_7BE14(v95);
  }
  *(void *)(v85 + swift_unknownObjectWeakDestroy(v0 + 16) = v93;
  sub_7BEA4(v85 + v86 + v94 * v87);
  if (v214)
  {
    if (v242 < 0) {
      uint64_t v100 = v242;
    }
    else {
      uint64_t v100 = v242 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v242);
    _CocoaArrayWrapper.endIndex.getter(v100);
    sub_A470();
  }

  id v101 = v248;
  uint64_t v102 = v241;
  uint64_t v103 = sub_7C158();
  uint64_t v107 = sub_F8E8(v103, v104, v105, v106);
  if (v240 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v243 = v107;
    uint64_t v218 = v85;
    uint64_t v108 = 0LL;
    LODWORD(v233) = enum case for ImageElement.ImageStyle.image3(_:);
    uint64_t v232 = enum case for ImageElement.ImageStyle.contactImage3(_:);
    LODWORD(v231) = enum case for TableRow.Content.visual(_:);
    LODWORD(v245) = enum case for TableRow.Content.text(_:);
    LODWORD(v226) = enum case for TableRow.Content.empty(_:);
    uint64_t v227 = 0x80000000000A59C0LL;
    uint64_t v109 = v242;
    do
    {
      if (v235) {
        uint64_t v110 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v108, v109);
      }
      else {
        uint64_t v110 = sub_1AFC0(v109 + 8 * v108);
      }
      uint64_t v111 = v110;
      uint64_t v112 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_F8FC(0LL, 3LL, 0LL, (uint64_t)&_swiftEmptyArrayStorage);
      uint64_t v113 = v237;
      uint64_t v114 = *(void (**)(void, void, void))(v237 + 104);
      uint64_t v115 = v236;
      uint64_t v116 = v238;
      v114(v236, v233, v238);
      uint64_t v117 = v239;
      v114(v239, v232, v116);
      sub_9E64(v117, 0LL, 1LL, v116);
      sub_7BFB0(v111, v115, v117, &v260);
      sub_A068(v117, &qword_E3480);
      (*(void (**)(uint64_t (*)(void, void, void), uint64_t))(v113 + 8))(v115, v116);
      sub_7C220((uint64_t)&v260, (uint64_t)&a14);
      sub_7C01C((uint64_t)v114, (uint64_t)&v258);
      uint64_t v119 = *(void *)v112->super.viewControllers;
      uint64_t v118 = *(void *)v112->super.childCoordinators;
      if (v119 >= v118 >> 1) {
        uint64_t v112 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_7BE2C(v118);
      }
      *(void *)v112->super.viewControllers = v119 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v247 + 32))( (unint64_t)v112 + ((*(unsigned __int8 *)(v247 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v247 + 80))
      + *(void *)(v247 + 72) * v119,
        v246,
        v101);
      sub_7BD80(v111, (SEL *)&selRef_siriui_displayName);
      if (v121)
      {
        double v122 = v228;
        *(void *)(v228 + 24) = &type metadata for String;
        *(void *)double v122 = v120;
        *(void *)(v122 + 8) = v121;
        *(void *)(v122 + 32) = &protocol witness table for String;
        *(void *)(v122 + 40) = 2LL;
        *(_BYTE *)(v122 + 48) = 0;
        double v123 = v122;
        double v124 = &a13;
      }

      else
      {
        double v123 = v102;
        double v124 = &v252;
      }

      sub_7C01C(v123, (uint64_t)v124);
      sub_7BF78();
      if (v89) {
        uint64_t v112 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_7BE2C(v125);
      }
      sub_7BE84();
      uint64_t v126 = objc_msgSend(v111, "siritv_firstMetadata");
      if (v126 && (sub_6C810(v126, (SEL *)&selRef_value), v128))
      {
        id v129 = &v253;
      }

      else
      {
        sub_44E28();
        uint64_t v127 = sub_6F00C(0xD000000000000017LL, v227);
        id v129 = &v255;
      }

      double v130 = *(v129 - 32);
      *(void *)(v130 + 24) = &type metadata for String;
      *(void *)(v130 + 32) = &protocol witness table for String;
      *(void *)(v130 + 40) = 0LL;
      *(void *)double v130 = v127;
      *(void *)(v130 + 8) = v128;
      *(_BYTE *)(v130 + 48) = 1;
      sub_7C01C(v130, (uint64_t)&a13);
      id v101 = *(void *)v112->super.viewControllers;
      sub_7BF78();
      if (v89) {
        uint64_t v112 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_7BE2C(v131);
      }
      sub_7BE84();
      if (*(void *)v112->super.viewControllers)
      {
        double v132 = sub_7C10C();
        TableRow.init(cells:backgrounds:action:)(v112, &_swiftEmptyArrayStorage, v132);
        double v133 = v243;
        uint64_t v135 = *(void *)(v243 + 16);
        double v134 = *(void *)(v243 + 24);
        uint64_t v136 = v234;
        uint64_t v102 = v241;
        if (v135 >= v134 >> 1)
        {
          v153 = sub_7C20C(v134);
          double v133 = sub_F8E8(v153, v154, v155, v156);
        }

        *(void *)(v133 + swift_unknownObjectWeakDestroy(v0 + 16) = v135 + 1;
        sub_7BE00();
        uint64_t v243 = v137;
        sub_7C234( v137 + v138 + *(void *)(v139 + 72) * v135,  v244,  *(uint64_t (**)(uint64_t, uint64_t, void))(v139 + 32));

        sub_7C184();
      }

      else
      {

        sub_7C184();
        swift_bridgeObjectRelease(v112, v146, v147, v148, v149, v150, v151, v152);
        uint64_t v136 = v234;
        uint64_t v102 = v241;
      }

      ++v108;
      uint64_t v109 = v242;
    }

    while (v240 != v108);
    swift_bridgeObjectRelease( (_TtC6SiriTV27ConversationViewCoordinator *)v242,  (SEL)v242,  v140,  v141,  v142,  v143,  v144,  v145);
    float v157 = v243;
    if (!*(void *)(v243 + 16))
    {
      sub_7BECC((uint64_t)&v248);
      sub_3CEA0();
      sub_7C178();
      uint64_t v181 = sub_A600();
      v182 = v225;
      uint64_t v183 = 1LL;
LABEL_58:
      sub_9E64(v182, v183, 1LL, v181);
      sub_A174();
      return;
    }

    uint64_t v158 = type metadata accessor for TableHeader(0LL);
    uint64_t v159 = v219;
    sub_A3BC(v219, v160, v161, v158);
    uint64_t v162 = v218;
    sub_1AFF0();
    sub_58288();
    uint64_t v163 = v222;
    Table.init(separatorLines:columns:header:rows:)(1LL, v162, v159, v157);
    uint64_t v164 = sub_9E24(&qword_DFD00);
    v165 = sub_1AFD0(v164, 72LL);
    *(_OWORD *)(v165 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
    uint64_t v166 = v224;
    *(void *)(v165 + 56) = v224;
    *(void *)(v165 + 64) = &protocol witness table for Table;
    uint64_t v167 = sub_9F38((void *)(v165 + 32));
    (*(void (**)(void *, uint64_t, uint64_t))(v223 + 16))(v167, v163, v166);
    uint64_t v256 = v165;
    uint64_t v168 = [v220 league];
    uint64_t v169 = v225;
    if (v168)
    {
      uint64_t v170 = v168;
      sub_A418();
      sub_3CEA0();
      sub_6C810(v170, (SEL *)&selRef_displayedText);
      uint64_t v173 = v213;
      if (v172)
      {
        uint64_t v174 = v171;
        uint64_t v175 = v172;
        uint64_t v176 = (id)SRUIFGetLocale(v171);
        if (v176)
        {
          uint64_t v179 = v176;
          static Locale._unconditionallyBridgeFromObjectiveC(_:)(v176, v177, v178);

          v180 = 0LL;
        }

        else
        {
          v180 = 1LL;
        }

        uint64_t v184 = sub_53D10();
        sub_3D68C(v136, v180, v185, v184);
        uint64_t v186 = v136;
        uint64_t v187 = v221;
        sub_A03C(v186, v221, &qword_E0F80);
        sub_7BD80(v216, (SEL *)&selRef_name);
        uint64_t v190 = v188;
        if (v189)
        {
          *(void *)&uint64_t v260 = v188;
          *((void *)&v260 + 1) = v189;
          v191 = sub_9FC4();
          uint64_t v190 = StringProtocol.capitalized(with:)(v187, &type metadata for String, v191);
          uint64_t v193 = v192;
          sub_A418();
        }

        else
        {
          uint64_t v193 = 0LL;
        }

        id v194 = v212;
        uint64_t v261 = &type metadata for String;
        uint64_t v262 = &protocol witness table for String;
        *(void *)&uint64_t v260 = v174;
        *((void *)&v260 + 1) = v175;
        if (v193)
        {
          *((void *)&v258 + 1) = &type metadata for String;
          uint64_t v259 = &protocol witness table for String;
          *(void *)&uint64_t v257 = v190;
          *((void *)&v257 + 1) = v193;
        }

        else
        {
          uint64_t v259 = 0LL;
          uint64_t v257 = 0u;
          uint64_t v258 = 0u;
        }

        v195 = v221;
        sub_7BF30();
        PrimaryHeaderStandard.init(text1:text2:text3:action:)(&v260, &v257, &v251, &v249);
        uint64_t v196 = v215;
        uint64_t v261 = (void *)v215;
        uint64_t v262 = &protocol witness table for PrimaryHeaderStandard;
        uint64_t v197 = sub_9F38(&v260);
        (*(void (**)(void *, char *, uint64_t))(v194 + 16))(v197, v173, v196);
        sub_9F74(&v260, (uint64_t)&v257);
        sub_1A154();
        (*(void (**)(char *, uint64_t))(v194 + 8))(v173, v196);
        sub_A068(v195, &qword_E0F80);
      }

      sub_7BFA4(v256, (uint64_t)&_swiftEmptyArrayStorage);
      sub_7C178();
      (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v222, v224);
      uint64_t v181 = sub_A600();
      v182 = v169;
      uint64_t v183 = 0LL;
      goto LABEL_58;
    }
  }

  __break(1u);
}

void sub_792C8()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_9E24(&qword_E3480);
  sub_A13C();
  __chkstk_darwin(v6);
  sub_A118();
  uint64_t v183 = v7;
  uint64_t v8 = sub_7C010();
  uint64_t v181 = *(void *)(v8 - 8);
  uint64_t v182 = v8;
  sub_A13C();
  __chkstk_darwin(v9);
  sub_A118();
  v180 = v10;
  uint64_t v11 = type metadata accessor for SummaryItemStandard(0LL);
  uint64_t v185 = *(void *)(v11 - 8);
  sub_A13C();
  __chkstk_darwin(v12);
  sub_A118();
  uint64_t v184 = v13;
  sub_9E24(&qword_DF5C0);
  sub_A13C();
  __chkstk_darwin(v14);
  sub_A344();
  id v17 = (id)(v15 - v16);
  __chkstk_darwin(v18);
  sub_A258();
  uint64_t v186 = v19;
  uint64_t v20 = sub_7C1FC();
  uint64_t v178 = *(void *)(v20 - 8);
  uint64_t v179 = (void *)v20;
  sub_A13C();
  __chkstk_darwin(v21);
  sub_A118();
  uint64_t v177 = v22;
  sub_9E24(&qword_E3478);
  sub_A13C();
  __chkstk_darwin(v23);
  uint64_t v24 = (void *)sub_7BEB0();
  uint64_t v195 = *(v24 - 1);
  sub_A13C();
  __chkstk_darwin(v25);
  sub_A148();
  uint64_t v194 = v26;
  sub_A168();
  __chkstk_darwin(v27);
  sub_A258();
  uint64_t v193 = v28;
  sub_9E24(&qword_E0F80);
  sub_A13C();
  __chkstk_darwin(v29);
  sub_1B010();
  uint64_t v196 = v3;
  sub_7BD24(v3, (SEL *)&selRef_selectedEntities);
  if (!v30) {
    goto LABEL_12;
  }
  uint64_t v31 = v30;
  if (!((unint64_t)v30 >> 62))
  {
    uint64_t v32 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8LL));
    if (v32) {
      goto LABEL_4;
    }
LABEL_51:
    uint64_t v125 = type metadata accessor for Response(v32);
    sub_9E64(v5, 1LL, 1LL, v125);
    sub_7BDD0(v31);
    return;
  }

  if (v30 >= 0) {
    v30 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  uint64_t v32 = _CocoaArrayWrapper.endIndex.getter(v30);
  if (!v32) {
    goto LABEL_51;
  }
LABEL_4:
  uint64_t v176 = v11;
  sub_7BFBC();
  if (v11) {
    id v33 = (id)sub_1B040(0LL);
  }
  else {
    id v33 = *(id *)(v31 + 32);
  }
  uint64_t v34 = v33;
  sub_A208();
  uint64_t v35 = objc_opt_self(&OBJC_CLASS___SASportsTeam);
  uint64_t v36 = sub_7C1D0(v35);
  if (!v36)
  {

    uint64_t v30 = 0LL;
LABEL_12:
    type metadata accessor for Response(v30);
    sub_7C064();
    sub_7BDE8(v55, v56, v57, v58);
    return;
  }

  uint64_t v37 = (void *)v36;
  uint64_t v172 = (uint64_t)v17;
  uint64_t v188 = sub_5B724();
  uint64_t v39 = v38;
  uint64_t v190 = v40;
  id v41 = v34;
  uint64_t v189 = v37;
  uint64_t v42 = sub_526EC(v37, v39);
  uint64_t v192 = v41;

  if (v42)
  {
    id v17 = sub_ED8C(v43, "siriui_displayName");

    if (v17)
    {
      uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      uint64_t v46 = v45;

      id v48 = (id)SRUIFGetLocale(v47);
      if (v48)
      {
        uint64_t v51 = v48;
        static Locale._unconditionallyBridgeFromObjectiveC(_:)(v48, v49, v50);

        uint64_t v53 = sub_53D10();
        uint64_t v54 = 0LL;
      }

      else
      {
        uint64_t v53 = type metadata accessor for Locale(0LL);
        uint64_t v54 = 1LL;
      }

      sub_3D68C(v0, v54, v52, v53);
      sub_664A4(v0);
      uint64_t v60 = v59;
      uint64_t v62 = v61;
      sub_A068(v0, &qword_E0F80);
      if (v62)
      {
        sub_44E28();
        uint64_t v173 = sub_6F00C(0xD000000000000018LL, 0x80000000000A5A00LL);
        uint64_t v71 = v70;
        uint64_t v72 = sub_9E24((uint64_t *)&unk_DF640);
        id v17 = (id)sub_1AFD0(v72, 112LL);
        *((_OWORD *)v17 + 1) = xmmword_AB6D0;
        *((void *)v17 + 7) = &type metadata for String;
        unint64_t v73 = sub_A0DC();
        *((void *)v17 + 4) = v60;
        *((void *)v17 + 5) = v62;
        *((void *)v17 + 12) = &type metadata for String;
        *((void *)v17 + 13) = v73;
        *((void *)v17 + 8) = v73;
        *((void *)v17 + 9) = v44;
        *((void *)v17 + 10) = v46;
        uint64_t v74 = String.init(format:_:)(v173, v71, v17);
        uint64_t v170 = (uint64_t)v75;
        uint64_t v171 = v74;
        swift_bridgeObjectRelease(v71, v75, v76, v77, v78, v79, v80, v81);
        sub_7BD80(v189, (SEL *)&selRef_siriui_displayNameAndLocation);
        unint64_t v168 = v83;
        uint64_t v169 = v82;
        if (!v83)
        {
LABEL_84:
          __break(1u);
          return;
        }

        uint64_t v84 = (uint64_t)v189;
        sub_660C4(v82);
        if (v86) {
          uint64_t v87 = v85;
        }
        else {
          uint64_t v87 = 0LL;
        }
        unint64_t v88 = 0xE000000000000000LL;
        if (v86) {
          unint64_t v88 = v86;
        }
        uint64_t v174 = v88;
        uint64_t v175 = v87;
        goto LABEL_31;
      }

      swift_bridgeObjectRelease(v46, v63, v64, v65, v66, v67, v68, v69);
    }
  }

  uint64_t v84 = (uint64_t)v189;
  sub_7BD80(v189, (SEL *)&selRef_siriui_displayNameAndLocation);
  uint64_t v170 = v90;
  uint64_t v171 = v89;
  if (!v90)
  {
    __break(1u);
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }

  sub_660C4(v89);
  if (v92) {
    uint64_t v93 = v91;
  }
  else {
    uint64_t v93 = 0LL;
  }
  uint64_t v174 = 0xE000000000000000LL;
  uint64_t v175 = 0LL;
  if (v92) {
    unint64_t v94 = v92;
  }
  else {
    unint64_t v94 = 0xE000000000000000LL;
  }
  unint64_t v168 = v94;
  uint64_t v169 = v93;
LABEL_31:
  uint64_t v95 = v190;
  uint64_t v214 = &_swiftEmptyArrayStorage;
  sub_5C18C();
  v191 = v96;
  sub_A1C8();
  sub_A49C();
  uint64_t v104 = v188;
  uint64_t v167 = v5;
  if ((unint64_t)v188 >> 62)
  {
    if (v188 < 0) {
      uint64_t v126 = v188;
    }
    else {
      uint64_t v126 = v188 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_3CE84();
    uint64_t v127 = v126;
    uint64_t v84 = (uint64_t)v189;
    uint64_t v105 = _CocoaArrayWrapper.endIndex.getter(v127);
    sub_A208();
    if (!v105) {
      goto LABEL_57;
    }
  }

  else
  {
    uint64_t v105 = *(void *)((char *)&dword_10 + (v188 & 0xFFFFFFFFFFFFF8LL));
    if (!v105) {
      goto LABEL_57;
    }
  }

  if (v105 < 1)
  {
    __break(1u);
    goto LABEL_81;
  }

  uint64_t v106 = 0LL;
  uint64_t v187 = v105;
  do
  {
    if ((v188 & 0xC000000000000001LL) != 0) {
      uint64_t v107 = sub_1B040(v106);
    }
    else {
      uint64_t v107 = (uint64_t)sub_1AFC0(v104 + 8 * v106);
    }
    uint64_t v108 = (void *)v107;
    id v109 = [v196 showCardinalPositions];
    id v110 = v192;
    sub_7A1B8( (uint64_t)v108,  (uint64_t)v191,  (uint64_t)v109,  v84,  v111,  v112,  v113,  v114,  v166,  v167,  v168,  v169,  v170,  v171,  v172,  v174,  v175,  v176,  v177,  v178);

    sub_7C030(v1, 1LL);
    if (v115)
    {

      sub_A068(v1, &qword_E3478);
    }

    else
    {
      sub_73E94(v193, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v195 + 32));
      uint64_t v116 = *(void (**)(uint64_t, uint64_t, void *))(v195 + 16);
      v116(v194, v193, v24);
      uint64_t v117 = v214;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v214);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_7C18C(0LL, *(void *)v214->super.viewControllers + 1LL);
        uint64_t v117 = v123;
        uint64_t v214 = v123;
      }

      unint64_t v120 = *(void *)v117->super.viewControllers;
      unint64_t v119 = *(void *)v117->super.childCoordinators;
      if (v120 >= v119 >> 1)
      {
        sub_7C18C(v119 > 1, v120 + 1);
        uint64_t v117 = v124;
        uint64_t v214 = v124;
      }

      uint64_t v212 = v24;
      uint64_t v213 = &protocol witness table for Table;
      uint64_t v121 = sub_A5C0();
      v116((uint64_t)v121, v194, v24);
      *(void *)v117->super.viewControllers = v120 + 1;
      sub_7C138((uint64_t)v117 + 40 * v120);
      double v122 = *(void (**)(uint64_t, void *))(v195 + 8);
      v122(v194, v24);

      v122(v193, v24);
      uint64_t v104 = v188;
      uint64_t v84 = (uint64_t)v189;
      uint64_t v105 = v187;
    }

    ++v106;
  }

  while (v105 != v106);
LABEL_57:
  swift_bridgeObjectRelease(v191, v97, v98, v99, v100, v101, v102, v103);
  sub_A208();
  uint64_t v128 = (uint64_t)v214;
  uint64_t v95 = &protocol witness table for String;
  if (!*(void *)v214->super.viewControllers)
  {
    uint64_t v1 = v167;
    id v17 = v186;
    goto LABEL_63;
  }

  id v129 = [v196 league];
  id v17 = v186;
  uint64_t v24 = &type metadata for String;
  if (!v129) {
    goto LABEL_83;
  }
  sub_6C810(v129, (SEL *)&selRef_displayedText);
  uint64_t v1 = v167;
  if (v131)
  {
    uint64_t v212 = &type metadata for String;
    uint64_t v213 = &protocol witness table for String;
    uint64_t v210 = v130;
    uint64_t v211 = v131;
    sub_44E28();
    if (qword_DED88 == -1)
    {
LABEL_61:
      *((void *)&v208 + 1) = v24;
      uint64_t v209 = v95;
      *(void *)&__int128 v207 = sub_6F00C(qword_E4BA8, unk_E4BB0);
      *((void *)&v207 + 1) = v132;
      unint64_t v206 = 0LL;
      __int128 v204 = 0u;
      __int128 v205 = 0u;
      uint64_t v203 = 0LL;
      __int128 v201 = 0u;
      __int128 v202 = 0u;
      uint64_t v133 = sub_7C144();
      PrimaryHeaderStandard.init(text1:text2:text3:action:)(v133, v134, v135, v136);
      uint64_t v212 = v179;
      uint64_t v213 = &protocol witness table for PrimaryHeaderStandard;
      uint64_t v137 = sub_A5C0();
      (*(void (**)(void *, uint64_t, void *))(v178 + 16))(v137, v177, v179);
      sub_7BF08();
      sub_A5A0(v177, *(uint64_t (**)(uint64_t, uint64_t))(v178 + 8));
      uint64_t v128 = (uint64_t)v214;
      goto LABEL_63;
    }

LABEL_81:
    swift_once(&qword_DED88, sub_77ED4);
    goto LABEL_61;
  }

  __break(1u);
}

void sub_79D74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v24;
  a20 = v25;
  uint64_t v27 = v26;
  uint64_t v78 = v28;
  uint64_t v29 = sub_7C1FC();
  sub_A228(v29, (uint64_t)&v93);
  uint64_t v76 = v30;
  sub_A13C();
  __chkstk_darwin(v31);
  sub_A118();
  sub_A398(v32);
  sub_9E24(&qword_E3478);
  sub_A13C();
  __chkstk_darwin(v33);
  uint64_t v34 = sub_7BEB0();
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v36);
  sub_7C084();
  sub_5C18C();
  uint64_t v85 = v37;
  unint64_t v92 = &_swiftEmptyArrayStorage;
  uint64_t v38 = sub_5B724();
  swift_bridgeObjectRelease(v39, (SEL)v39, v40, v41, v42, v43, v44, v45);
  sub_A470();
  if ((unint64_t)v38 >> 62)
  {
    if (v38 < 0) {
      uint64_t v66 = v38;
    }
    else {
      uint64_t v66 = v38 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v38);
    uint64_t v46 = (void *)_CocoaArrayWrapper.endIndex.getter(v66);
    sub_A49C();
    if (v46) {
      goto LABEL_3;
    }
LABEL_22:
    sub_7BECC((uint64_t)&a16);
    uint64_t v64 = sub_A49C();
    uint64_t v65 = &_swiftEmptyArrayStorage;
    goto LABEL_23;
  }

  uint64_t v46 = *(void **)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFF8LL));
  if (!v46) {
    goto LABEL_22;
  }
LABEL_3:
  if ((uint64_t)v46 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }

  uint64_t v47 = 0LL;
  unint64_t v48 = v38 & 0xC000000000000001LL;
  uint64_t v83 = (uint64_t)v27;
  uint64_t v82 = v35;
  uint64_t v81 = v38;
  uint64_t v80 = v23;
  unint64_t v79 = v38 & 0xC000000000000001LL;
  do
  {
    if (v48) {
      id v49 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v47, v38);
    }
    else {
      id v49 = sub_1AFC0(v38 + 8LL * (void)v47);
    }
    uint64_t v50 = v49;
    id v51 = [v27 showCardinalPositions];
    sub_7A1B8( (uint64_t)v50,  v85,  (uint64_t)v51,  0LL,  v52,  v53,  v54,  v55,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  v83,  v84,  v85);
    sub_7C030(v22, 1LL);
    if (v56)
    {

      sub_A068(v22, &qword_E3478);
    }

    else
    {
      sub_73E94(v23, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 32));
      sub_7BEA4(v84);
      uint64_t v57 = v92;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v92);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_7C198(0LL, *(void *)v92->super.viewControllers + 1LL);
        uint64_t v57 = v62;
        unint64_t v92 = v62;
      }

      unint64_t v60 = *(void *)v57->super.viewControllers;
      unint64_t v59 = *(void *)v57->super.childCoordinators;
      if (v60 >= v59 >> 1)
      {
        sub_7C198(v59 > 1, v60 + 1);
        uint64_t v57 = v63;
        unint64_t v92 = v63;
      }

      uint64_t v90 = (void *)v34;
      uint64_t v91 = &protocol witness table for Table;
      uint64_t v61 = sub_A5C0();
      sub_7BEA4((uint64_t)v61);
      *(void *)v57->super.viewControllers = v60 + 1;
      sub_7C138((uint64_t)v57 + 40 * v60);
      uint64_t v35 = v82;
      sub_7C12C();

      uint64_t v23 = v80;
      sub_7C12C();
      uint64_t v27 = (void *)v83;
      uint64_t v38 = v81;
      unint64_t v48 = v79;
    }

    uint64_t v47 = (char *)v47 + 1;
  }

  while (v46 != v47);
  sub_7BECC((uint64_t)&a16);
  uint64_t v64 = sub_A49C();
  uint64_t v65 = v92;
LABEL_23:
  uint64_t v21 = v78;
  if (*(void *)v65->super.viewControllers)
  {
    id v67 = sub_ED8C(v64, "league");
    if (!v67)
    {
      __break(1u);
      return;
    }

    sub_6C810(v67, (SEL *)&selRef_displayedText);
    if (v69)
    {
      uint64_t v46 = &type metadata for String;
      uint64_t v20 = &protocol witness table for String;
      uint64_t v90 = &type metadata for String;
      uint64_t v91 = &protocol witness table for String;
      v89[0] = v68;
      v89[1] = v69;
      sub_44E28();
      if (qword_DED88 == -1)
      {
LABEL_27:
        v88[3] = v46;
        v88[4] = v20;
        v88[0] = sub_6F00C(qword_E4BA8, unk_E4BB0);
        v88[1] = v70;
        sub_7BF30();
        PrimaryHeaderStandard.init(text1:text2:text3:action:)(v89, v88, &v87, &v86);
        uint64_t v90 = (void *)v77;
        uint64_t v91 = &protocol witness table for PrimaryHeaderStandard;
        uint64_t v71 = sub_A5C0();
        (*(void (**)(void *, uint64_t, uint64_t))(v76 + 16))(v71, v75, v77);
        sub_7BF08();
        (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
        uint64_t v65 = v92;
        goto LABEL_28;
      }

LABEL_33:
      swift_once(&qword_DED88, sub_77ED4);
      goto LABEL_27;
    }
  }

    __break(1u);
    goto LABEL_34;
  }

  uint64_t v24 = v23;
  type metadata accessor for CommandConverter();
  sub_44E70(v24, (uint64_t)v16);
  sub_A418();
  sub_A2E0((uint64_t)v16, 1LL, v17);
  if (!v25)
  {
    uint64_t v46 = v18;
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v16, v17);
    sub_6C620(v5);
    v80[3] = (uint64_t)&type metadata for String;
    v80[4] = (uint64_t)&protocol witness table for String;
    if (v48) {
      id v49 = v47;
    }
    else {
      id v49 = 0LL;
    }
    if (v48) {
      uint64_t v50 = v48;
    }
    else {
      uint64_t v50 = 0xE000000000000000LL;
    }
    v80[0] = v49;
    v80[1] = v50;
    memset(v79, 0, 40);
    uint64_t v78 = 0LL;
    memset(v77, 0, sizeof(v77));
    uint64_t v76 = 0LL;
    memset(v75, 0, sizeof(v75));
    uint64_t v74 = 0LL;
    memset(v73, 0, sizeof(v73));
    uint64_t v72 = 0LL;
    memset(v71, 0, sizeof(v71));
    uint64_t v70 = 0LL;
    memset(v69, 0, sizeof(v69));
    uint64_t v68 = 0LL;
    memset(v67, 0, sizeof(v67));
    uint64_t v52 = v59;
    id v51 = v60;
    (*(void (**)(uint64_t, void, uint64_t))(v59 + 104))( v3,  enum case for ImageElement.ImageStyle.appIcon3(_:),  v60);
    uint64_t v53 = (void *)sub_868B4();
    sub_83508(v53, v54, v55);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v3, v51);
    v65[3] = v17;
    v65[4] = &protocol witness table for Command;
    char v56 = sub_9F38(v65);
    (*(void (**)(void *, uint64_t, uint64_t))(v46 + 16))(v56, v21, v17);
    id v44 = v64;
    SimpleItemRich.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:action:componentName:linkIdentifier:)( v80,  v79,  v77,  v75,  v73,  v71,  v69,  v67,  &v66,  v65,  0LL,  0xE000000000000000LL,  0LL,  0LL);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v21, v17);
    uint64_t v39 = 0LL;
    goto LABEL_24;
  }

  sub_A068((uint64_t)v16, &qword_DF5C0);
  if (AFSiriLogContextConnection)
  {
    uint64_t v26 = AFSiriLogContextConnection;
    uint64_t v2 = v58;
    uint64_t v27 = sub_861B8((uint64_t)v26);
    uint64_t v28 = static os_log_type_t.error.getter(v27);
    uint64_t v29 = (os_log_s *)sub_860B0(v28);
    if (sub_86098(v29))
    {
      uint64_t v30 = (uint8_t *)sub_A1D0(2LL);
      *(_WORD *)uint64_t v30 = 0;
      sub_DD8C(&dword_0, v29, (os_log_type_t)v21, "#aceshim unable to create command", v30);
      sub_A15C((uint64_t)v30);
    }

  uint64_t v31 = sub_A5F8();
  uint64_t v32 = &protocol witness table for Color;
  sub_86938(v31);
  static Color.secondary.getter();
  uint64_t v27 = sub_863D0();
  sub_A068(v27, v28);
  uint64_t v29 = (_OWORD *)a2;
LABEL_37:
  sub_A03C((uint64_t)v30, (uint64_t)v29, &qword_E4D10);
LABEL_38:
  sub_A03C((uint64_t)v33, a1, &qword_E4D10);
}

void sub_7A1B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v23;
  a20 = v24;
  uint64_t v379 = v25;
  int v380 = v26;
  unint64_t v385 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_9E24(&qword_E3468);
  sub_A13C();
  __chkstk_darwin(v32);
  sub_A118();
  uint64_t v377 = sub_7C0D0(v33);
  uint64_t v376 = *(void *)(v377 - 8);
  sub_A13C();
  __chkstk_darwin(v34);
  sub_1B010();
  sub_9E24(&qword_E3480);
  sub_A13C();
  __chkstk_darwin(v35);
  sub_A118();
  uint64_t v375 = v36;
  uint64_t v37 = sub_7C010();
  sub_A228(v37, (uint64_t)&v406);
  uint64_t v373 = v38;
  sub_A13C();
  __chkstk_darwin(v39);
  sub_A118();
  sub_A398(v40);
  sub_9E24((uint64_t *)&unk_DF5D0);
  sub_A13C();
  __chkstk_darwin(v41);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v42);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v43);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v44);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v45);
  sub_A258();
  uint64_t v399 = v46;
  uint64_t v398 = type metadata accessor for Table.Column(0LL);
  uint64_t v47 = *(void *)(v398 - 8);
  __chkstk_darwin(v398);
  sub_A148();
  v400 = v48;
  sub_A168();
  __chkstk_darwin(v49);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v50);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v51);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v52);
  sub_A258();
  uint64_t v54 = sub_A19C(v53);
  uint64_t v55 = type metadata accessor for Table.ColumnAlignment(v54);
  v401 = *(void (**)(void))(v55 - 8);
  uint64_t v402 = v55;
  sub_A13C();
  __chkstk_darwin(v56);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v57);
  sub_A258();
  sub_A398(v58);
  sub_9E24(&qword_E3AD0);
  sub_A13C();
  __chkstk_darwin(v59);
  sub_A148();
  uint64_t v406 = v60;
  sub_A168();
  __chkstk_darwin(v61);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v62);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v63);
  sub_7C084();
  sub_9E24(&qword_E10E8);
  sub_A13C();
  __chkstk_darwin(v64);
  sub_A148();
  uint64_t v405 = v65;
  sub_A168();
  __chkstk_darwin(v66);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v67);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v68);
  uint64_t v70 = (char *)&v340 - v69;
  unint64_t ObjCClassFromMetadata = type metadata accessor for TableRow.Content(0LL);
  uint64_t v386 = *(void *)(ObjCClassFromMetadata - 8);
  sub_A13C();
  __chkstk_darwin(v72);
  sub_A148();
  uint64_t v407 = v73;
  sub_A168();
  uint64_t v75 = __chkstk_darwin(v74);
  uint64_t v77 = (unint64_t *)((char *)&v340 - v76);
  __chkstk_darwin(v75);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v78);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v79);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v80);
  sub_7C094();
  __chkstk_darwin(v81);
  sub_A258();
  uint64_t v83 = sub_A19C(v82);
  uint64_t v84 = type metadata accessor for TableHeader.HeaderCell(v83);
  sub_A228(v84, (uint64_t)&a18);
  uint64_t v394 = v85;
  sub_A13C();
  __chkstk_darwin(v86);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v87);
  sub_A258();
  sub_A398(v88);
  sub_9E24(&qword_E0F80);
  sub_A13C();
  __chkstk_darwin(v89);
  sub_A344();
  unint64_t v92 = (void *)(v90 - v91);
  __chkstk_darwin(v93);
  sub_A258();
  sub_A398(v94);
  v404 = v29;
  sub_7BD24(v29, (SEL *)&selRef_entities);
  if (!v95)
  {
    type metadata accessor for Table(0LL);
    sub_7C064();
    sub_7BDE8(v102, v103, v104, v105);
    return;
  }

  uint64_t v96 = v95;
  uint64_t v356 = v47;
  unint64_t v97 = v95 >> 62;
  if (v95 >> 62) {
    goto LABEL_144;
  }
  uint64_t v98 = *(void *)((char *)&dword_10 + (v95 & 0xFFFFFFFFFFFFF8LL));
  if (!v98)
  {
LABEL_148:
    uint64_t v337 = type metadata accessor for Table(0LL);
    sub_A3BC((uint64_t)v31, v338, v339, v337);
    sub_7BDD0(v96);
    return;
  }

LABEL_35:
    if ((v380 & 1) != 0) {
      uint64_t v128 = 3LL;
    }
    else {
      uint64_t v128 = 2LL;
    }
    unint64_t v129 = v385;
    uint64_t v31 = *(char ***)(v385 + 16);
    uint64_t v130 = (uint64_t)v31 + v128;
    if (__OFADD__(v31, v128))
    {
      __break(1u);
    }

    else
    {
      uint64_t v131 = sub_7C158();
      uint64_t v135 = sub_FAA4(v131, v132, v133, v134);
      unint64_t v129 = v130 + 1;
      if (!__OFADD__(v130, 1LL))
      {
        uint64_t v384 = v135;
        uint64_t v136 = sub_7C158();
        uint64_t v383 = sub_FAB8(v136, v137, v138, v139);
        id v140 = (id)SRUIFGetLocale(v383);
        if (v140)
        {
          uint64_t v143 = v140;
          static Locale._unconditionallyBridgeFromObjectiveC(_:)(v140, v141, v142);

          uint64_t v145 = sub_53D10();
          uint64_t v146 = 0LL;
        }

        else
        {
          uint64_t v145 = type metadata accessor for Locale(0LL);
          uint64_t v146 = 1LL;
        }

        unint64_t ObjCClassFromMetadata = v403;
        v341 = (char *)v31 + v128;
        v368 = v31;
        sub_3D68C((uint64_t)v92, v146, v144, v145);
        sub_A03C((uint64_t)v92, v347, &qword_E0F80);
        sub_7C164();
        if (v147)
        {
          uint64_t v148 = v128;
          uint64_t v149 = sub_33CF8();
          uint64_t v130 = (uint64_t)v350;
          uint64_t v152 = sub_33C8C((uint64_t)v350, v150, v151, v149);
          uint64_t v153 = v351;
          sub_A3BC(v351, v154, v155, v152);
          if (qword_DED90 != -1) {
            swift_once(&qword_DED90, sub_77EFC);
          }
          uint64_t v156 = sub_A5F8();
          uint64_t v157 = sub_9E0C(v156, (uint64_t)qword_E4BB8);
          *((void *)&v412 + 1) = v156;
          uint64_t v158 = sub_22F98((uint64_t)&protocol witness table for Color);
          sub_1B1AC( (uint64_t)v158,  v157,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v156 - 8) + 16LL));
          uint64_t v159 = sub_33D30();
          unint64_t v92 = v365;
          v365[3] = v159;
          v92[4] = &protocol witness table for TextElement;
          sub_9F38(v92);
          sub_33C64(v96, v122, v130, v153, (uint64_t)&v411);
          v92[5] = 0LL;
          *((_BYTE *)v92 + 48) = 1;
          unint64_t ObjCClassFromMetadata = v403;
          sub_7C1A4( (uint64_t)v92,  enum case for TableRow.Content.text(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v386 + 104));
          uint64_t v128 = v148;
        }

        else
        {
          sub_A208();
          unint64_t v92 = v365;
          sub_7C1A4( (uint64_t)v365,  enum case for TableRow.Content.empty(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v386 + 104));
        }

        uint64_t v160 = (void (*)(void))*((void *)v401 + 13);
        int v349 = enum case for Table.ColumnAlignment.leading(_:);
        v401 = v160;
        v160(v395);
        uint64_t v122 = v388;
        TableHeader.HeaderCell.init(_:columnSpan:alignment:)(v92, v128);
        sub_7C0E0();
        uint64_t v96 = v398;
        uint64_t v31 = v352;
        if (!v161) {
          goto LABEL_49;
        }
        goto LABEL_151;
      }
    }

    __break(1u);
LABEL_151:
    uint64_t v123 = sub_7BFF0(v123, v129);
LABEL_49:
    *(void *)(v123 + swift_unknownObjectWeakDestroy(v0 + 16) = v92;
    sub_7BE00();
    uint64_t v384 = v162;
    uint64_t v359 = v163;
    uint64_t v358 = *(void *)(v164 + 72);
    v357 = *(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 32);
    v357(v162 + v163 + v358 * v130, v122, v397);
    uint64_t v165 = enum case for Table.ColumnSize.auto(_:);
    LODWORD(v395) = enum case for Table.ColumnSize.auto(_:);
    if ((v380 & 1) != 0)
    {
      uint64_t v166 = sub_9E24(&qword_E3470);
      uint64_t v167 = v364;
      uint64_t v168 = v364 + *(int *)(v166 + 48);
      sub_7C204();
      sub_7BF50();
      v169(v167, v165);
      sub_7BE5C();
      uint64_t v170 = v167;
      LODWORD(v167) = enum case for Table.Column.cell(_:);
      (*(void (**)(uint64_t, void, uint64_t))(v356 + 104))(v170, enum case for Table.Column.cell(_:), v96);
      sub_7C0E0();
      LODWORD(v365) = v167;
      if (v161) {
        uint64_t v171 = sub_7BFDC(v171, v172);
      }
      *(void *)(v171 + swift_unknownObjectWeakDestroy(v0 + 16) = v168;
      uint64_t v173 = v356;
      uint64_t v174 = v171;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v356 + 32))( v171 + ((*(unsigned __int8 *)(v173 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v173 + 80))
      + *(void *)(v173 + 72) * (void)&enum case for Table.Column.cell(_:),
        v364,
        v96);
    }

    else
    {
      LODWORD(v365) = enum case for Table.Column.cell(_:);
      uint64_t v174 = v383;
      uint64_t v173 = v356;
    }

    uint64_t v364 = sub_9E24(&qword_E3470);
    sub_7C204();
    sub_7BF50();
    uint64_t v363 = v175;
    sub_A4EC(v176);
    sub_7BE5C();
    uint64_t v177 = *(uint64_t (**)(void))(v173 + 104);
    uint64_t v178 = v365;
    sub_A4EC(v177);
    unint64_t v180 = *(void *)(v174 + 16);
    unint64_t v179 = *(void *)(v174 + 24);
    uint64_t v181 = v174;
    if (v180 >= v179 >> 1) {
      uint64_t v181 = sub_7BFDC(v174, v179);
    }
    uint64_t v77 = (unint64_t *)v393;
    *(void *)(v181 + swift_unknownObjectWeakDestroy(v0 + 16) = v180 + 1;
    sub_7BE00();
    v393 = v182;
    uint64_t v388 = *(void *)(v184 + 72);
    uint64_t v185 = v387;
    v387 = *(unint64_t **)(v184 + 32);
    ((void (*)(char *, unint64_t *, uint64_t))v387)(&v182[v183 + v388 * v180], v185, v96);
    sub_7C0F4();
    sub_A4CC((uint64_t)&v392);
    sub_7BE5C();
    sub_A4CC((uint64_t)&a15);
    sub_7BF78();
    if (v161) {
      uint64_t v186 = sub_7BE70(v186, v187);
    }
    unint64_t v92 = v355;
    *(void *)(v186 + swift_unknownObjectWeakDestroy(v0 + 16) = v178;
    sub_7BFD0();
    sub_A4CC((uint64_t)&a15);
    sub_7BF78();
    if (v161)
    {
      uint64_t v188 = sub_7BE70(v191, v192);
      uint64_t v191 = v188;
    }

    sub_7BED4(v188, v189, v190, v191);
    sub_7BFD0();
    uint64_t v20 = (uint64_t)v368;
    if (v368)
    {
      uint64_t v345 = v391 & 0xFFFFFFFFFFFFFF8LL;
      int v349 = enum case for TableRow.Content.text(_:);
      int v346 = enum case for TableRow.Content.empty(_:);
      LODWORD(v356) = enum case for Table.ColumnAlignment.center(_:);
      LODWORD(v355) = enum case for Table.ColumnAlignment.trailing(_:);
      uint64_t v77 = (unint64_t *)(sub_7C1E8() + 40);
      while (1)
      {
        if ((_DWORD)v70)
        {
          unint64_t ObjCClassFromMetadata = *v77;
          if (v392)
          {
            uint64_t v193 = (_TtC6SiriTV27ConversationViewCoordinator *)v391;
            sub_58288();
            sub_1AFF0();
            id v194 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v193);
            uint64_t v195 = v193;
            uint64_t v96 = v398;
            swift_bridgeObjectRelease(v195, v196, v197, v198, v199, v200, v201, v202);
          }

          else
          {
            if (!*(void *)(v345 + 16)) {
              goto LABEL_143;
            }
            uint64_t v203 = *v353;
            sub_1AFF0();
            id v194 = v203;
          }

          uint64_t v204 = objc_opt_self(&OBJC_CLASS___SASportsTeam);
          if (sub_7C1D0(v204))
          {
            uint64_t v205 = sub_7BEF8();
            sub_669FC(v205, v206);
            uint64_t v208 = v207;
            uint64_t v210 = v209;
            sub_A418();
            if (v210)
            {
              *(void *)&__int128 v411 = v208;
              *((void *)&v411 + 1) = v210;
              unint64_t v211 = sub_9FC4();
              uint64_t v212 = StringProtocol.uppercased(with:)(v347, &type metadata for String, v211);
              unint64_t v214 = v213;
              sub_3CEA0();
            }

            else
            {

              uint64_t v212 = 0LL;
              unint64_t v214 = 0xE000000000000000LL;
            }

            uint64_t v96 = v398;
            goto LABEL_74;
          }

          sub_A418();
        }

        uint64_t v212 = 0LL;
        unint64_t v214 = 0xE000000000000000LL;
LABEL_74:
        uint64_t v215 = HIBYTE(v214) & 0xF;
        if ((v214 & 0x2000000000000000LL) == 0) {
          uint64_t v215 = v212 & 0xFFFFFFFFFFFFLL;
        }
        if (v215)
        {
          uint64_t v216 = sub_33CF8();
          uint64_t v217 = (uint64_t)v350;
          uint64_t v220 = sub_33C8C((uint64_t)v350, v218, v219, v216);
          uint64_t v221 = v351;
          sub_A3BC(v351, v222, v223, v220);
          if (qword_DED90 != -1) {
            swift_once(&qword_DED90, sub_77EFC);
          }
          uint64_t v224 = sub_A5F8();
          uint64_t v225 = sub_9E0C(v224, (uint64_t)qword_E4BB8);
          *((void *)&v412 + 1) = v224;
          uint64_t v226 = sub_22F98((uint64_t)&protocol witness table for Color);
          sub_1B1AC( (uint64_t)v226,  v225,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v224 - 8) + 16LL));
          *(void *)v22->super.childCoordinators = sub_33D30();
          *(void *)v22->super.viewController = &protocol witness table for TextElement;
          sub_9F38(v22);
          sub_33C64(v212, v214, v217, v221, (uint64_t)&v411);
          *(void *)v22->super.parentCoordinator = 0LL;
          v22->super.parentCoordinator[8] = 1;
          sub_7C240((uint64_t)v22, (uint64_t)&v381 + 4);
          uint64_t v96 = v398;
          uint64_t v21 = v379;
          uint64_t v31 = v352;
        }

        else
        {
          sub_A208();
          sub_7C240((uint64_t)v22, (uint64_t)&v378 + 4);
        }

        sub_7C074();
        TableHeader.HeaderCell.init(_:columnSpan:alignment:)(v22, 1LL);
        uint64_t v227 = v384;
        unint64_t v229 = *(void *)(v384 + 16);
        unint64_t v228 = *(void *)(v384 + 24);
        if (v229 >= v228 >> 1) {
          uint64_t v227 = sub_7BFF0(v384, v228);
        }
        *(void *)(v227 + swift_unknownObjectWeakDestroy(v0 + 16) = v229 + 1;
        uint64_t v384 = v227;
        v357(v227 + v359 + v229 * v358, (uint64_t)v31, v397);
        sub_7C0F4();
        sub_A4CC((uint64_t)&v392);
        sub_7C074();
        uint64_t v230 = sub_A4CC((uint64_t)&a15);
        uint64_t v233 = v383;
        unint64_t v92 = *(void **)(v383 + 16);
        unint64_t v234 = *(void *)(v383 + 24);
        if ((unint64_t)v92 >= v234 >> 1)
        {
          uint64_t v230 = sub_7BE70(v383, v234);
          uint64_t v233 = v230;
        }

        unint64_t ObjCClassFromMetadata = v403;
        v77 += 2;
        sub_7BED4(v230, v231, v232, v233);
        sub_7BFD0();
        if (!--v20)
        {
          sub_7BECC((uint64_t)&v412 + 8);
          break;
        }
      }
    }

    uint64_t v235 = v391;
    uint64_t v236 = (uint64_t)v341;
    if (v343)
    {
      if (v391 < 0) {
        uint64_t v237 = v391;
      }
      else {
        uint64_t v237 = v391 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v391);
      _CocoaArrayWrapper.endIndex.getter(v237);
      sub_A1C8();
    }

    uint64_t v22 = &_swiftEmptyArrayStorage;
    uint64_t v238 = sub_7C158();
    uint64_t v96 = sub_F8E8(v238, v239, v240, (uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v241 = 0LL;
    uint64_t v366 = v236 & ~(v236 >> 63);
    LODWORD(v397) = enum case for TableRow.Content.text(_:);
    v360 = (uint64_t *)(v385 + 40);
    LODWORD(v365) = enum case for ImageElement.ImageStyle.image1(_:);
    LODWORD(v364) = enum case for ImageElement.ImageStyle.contactImage1(_:);
    LODWORD(v363) = enum case for TableRow.Content.visual(_:);
    LODWORD(v395) = enum case for TableRow.Content.empty(_:);
    v393 = "ndingsSnippetShim";
    uint64_t v394 = 0x80000000000A59C0LL;
    while (1)
    {
      unint64_t v242 = v392;
      sub_3C4A0(v241, v392 == 0, v235);
      if (v242) {
        id v243 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v241, v235);
      }
      else {
        id v243 = sub_7BF84((uint64_t)&v385);
      }
      v400 = v243;
      uint64_t v31 = v378;
      unint64_t v92 = &unk_DF5D0;
      BOOL v244 = __OFADD__(v241, 1LL);
      uint64_t v20 = (uint64_t)v241 + 1;
      if (v244)
      {
        __break(1u);
        goto LABEL_141;
      }

      uint64_t v70 = (char *)sub_F8FC(0LL, v366, 0LL, (uint64_t)&_swiftEmptyArrayStorage);
      uint64_t v245 = sub_A5F8();
      sub_A3E4(v399, 1LL);
      if (v21)
      {
        else {
          static Color.secondary.getter();
        }
        uint64_t v246 = v399;
        sub_A068(v399, (uint64_t *)&unk_DF5D0);
        sub_A3E4((uint64_t)v31, 0LL);
        sub_A03C((uint64_t)v31, v246, (uint64_t *)&unk_DF5D0);
      }

      uint64_t v398 = v245;
      v387 = (unint64_t *)v20;
      if ((v380 & 1) != 0)
      {
        uint64_t v247 = (void *)objc_opt_self(&OBJC_CLASS___NSNumberFormatter);
        id v248 = [objc_allocWithZone(NSNumber) initWithInteger:v20];
        id v249 = objc_msgSend(v247, "sruif_localizedStringFromNumber:", v248);

        static String._unconditionallyBridgeFromObjectiveC(_:)(v249);
        sub_7C0B4();

        uint64_t v250 = sub_33CF8();
        uint64_t v253 = sub_33C8C(v370, v251, v252, v250);
        uint64_t v256 = sub_7C048(v371, v254, v255, v253);
        uint64_t v257 = v354;
        sub_9F98(v256, v354, (uint64_t *)&unk_DF5D0);
        sub_7C030(v257, 1LL);
        if (v110)
        {
          sub_A068(v257, (uint64_t *)&unk_DF5D0);
          __int128 v411 = 0u;
          __int128 v412 = 0u;
          uint64_t v413 = 0LL;
        }

        else
        {
          *((void *)&v412 + 1) = v245;
          uint64_t v259 = sub_22F98((uint64_t)&protocol witness table for Color);
          sub_73E94( (uint64_t)v259,  v257,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v245 - 8) + 32LL));
        }

        uint64_t v260 = sub_33D30();
        uint64_t v261 = v369;
        *(void *)(v369 + 24) = v260;
        sub_7C004((uint64_t)&protocol witness table for TextElement);
        uint64_t v262 = sub_7BEF8();
        sub_33C64(v262, v263, v370, v371, v264);
        *(void *)(v261 + 40) = 1LL;
        *(_BYTE *)(v261 + 48) = 0;
        unint64_t v258 = v403;
        ((void (*)(uint64_t, void, unint64_t))v404)(v261, v397, v403);
        sub_7C0A4();
        if (v161) {
          uint64_t v70 = (char *)sub_7BE44(v265);
        }
        *((void *)v70 + 2) = v261;
        sub_7BE00();
        sub_73E94( (uint64_t)&v70[v266 + *(void *)(v267 + 72) * (void)v248],  v369,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v267 + 32));
      }

      else
      {
        unint64_t v258 = ObjCClassFromMetadata;
      }

      uint64_t v268 = v373;
      uint64_t v269 = *(void (**)(unint64_t, void, uint64_t))(v373 + 104);
      unint64_t ObjCClassFromMetadata = v372;
      uint64_t v270 = v374;
      v269(v372, v365, v374);
      uint64_t v271 = v375;
      v269(v375, v364, v270);
      sub_9E64(v271, 0LL, 1LL, v270);
      sub_7BFB0(v400, (uint64_t (*)(void, void, void))ObjCClassFromMetadata, v271, &v411);
      sub_A068(v271, &qword_E3480);
      sub_A5A0(ObjCClassFromMetadata, *(uint64_t (**)(uint64_t, uint64_t))(v268 + 8));
      sub_7C220((uint64_t)&v411, (uint64_t)&a11);
      sub_7C0C0((uint64_t)v269, (uint64_t)&v395);
      sub_7C0A4();
      if (v161) {
        uint64_t v70 = (char *)sub_7BE44(v272);
      }
      *((void *)v70 + 2) = v269;
      sub_7BE00();
      uint64_t v402 = v273;
      v401 = *(void (**)(void))(v274 + 72);
      uint64_t v275 = *(void (**)(char *, uint64_t, unint64_t))(v274 + 32);
      v275(&v70[v273 + (void)v401 * v271], v390, v258);
      uint64_t v276 = v400;
      sub_7BD80(v400, (SEL *)&selRef_siriui_displayName);
      uint64_t v388 = v96;
      if (v277) {
        break;
      }
      uint64_t v287 = (uint64_t)v348;
      sub_7C0C0((uint64_t)v348, (uint64_t)&a16);
      unint64_t v289 = *((void *)v70 + 2);
      unint64_t v288 = *((void *)v70 + 3);
      unint64_t v290 = v289 + 1;
      unint64_t ObjCClassFromMetadata = v258;
      if (v289 >= v288 >> 1) {
        goto LABEL_116;
      }
LABEL_119:
      *((void *)v70 + 2) = v290;
      v275(&v70[v402 + v289 * (void)v401], v287, ObjCClassFromMetadata);
      uint64_t v299 = v368;
      if (v368)
      {
        sub_7C1E8();
        uint64_t v300 = v360;
        uint64_t v301 = v396;
        do
        {
          uint64_t v303 = *(v300 - 1);
          uint64_t v302 = *v300;
          uint64_t v304 = objc_opt_self(&OBJC_CLASS___SASportsTeam);
          uint64_t v305 = swift_dynamicCastObjCClass(v276, v304);
          if (v305)
          {
            unint64_t ObjCClassFromMetadata = v305;
            swift_bridgeObjectRetain(v302);
            id v306 = v276;
            uint64_t v307 = v303;
            uint64_t v308 = ObjCClassFromMetadata;
            sub_66A9C(v307, v302);
            sub_7C0B4();
            sub_A470();

            uint64_t v301 = v396;
          }

          else
          {
            uint64_t v308 = type metadata accessor for Localizer();
            sub_6F00C(0xD000000000000017LL, v394);
            sub_7C0B4();
          }

          uint64_t v309 = v407;
          uint64_t v310 = HIBYTE(ObjCClassFromMetadata) & 0xF;
          if ((ObjCClassFromMetadata & 0x2000000000000000LL) == 0) {
            uint64_t v310 = v308 & 0xFFFFFFFFFFFFLL;
          }
          if (v310)
          {
            uint64_t v311 = sub_33CF8();
            uint64_t v314 = sub_33C8C(v405, v312, v313, v311);
            uint64_t v317 = sub_7C048(v406, v315, v316, v314);
            sub_9F98(v317, v301, (uint64_t *)&unk_DF5D0);
            uint64_t v318 = v398;
            sub_7C030(v301, 1LL);
            if (v110)
            {
              sub_A068(v301, (uint64_t *)&unk_DF5D0);
              __int128 v408 = 0u;
              __int128 v409 = 0u;
              uint64_t v410 = 0LL;
            }

            else
            {
              *((void *)&v409 + 1) = v318;
              v320 = sub_7C1DC((uint64_t)&protocol witness table for Color);
              sub_73E94( (uint64_t)v320,  v301,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v318 - 8) + 32LL));
            }

            *(void *)(v309 + 24) = sub_33D30();
            sub_7C004((uint64_t)&protocol witness table for TextElement);
            uint64_t v321 = sub_7BEF8();
            sub_33C64(v321, v322, v405, v406, v323);
            *(void *)(v309 + 40) = 1LL;
            *(_BYTE *)(v309 + 48) = 0;
            uint64_t v319 = v397;
            uint64_t v276 = v400;
          }

          else
          {
            sub_A418();
            uint64_t v319 = v395;
          }

          sub_7C1C4(v309, v319);
          sub_7C0A4();
          if (v161) {
            uint64_t v70 = (char *)sub_7BE44(v324);
          }
          v300 += 2;
          *((void *)v70 + 2) = v309;
          v275(&v70[v402 + v308 * (void)v401], v407, ObjCClassFromMetadata);
          uint64_t v299 = (char **)((char *)v299 - 1);
        }

        while (v299);
        sub_7BECC((uint64_t)&v412 + 8);
        uint64_t v21 = v379;
      }

      double v325 = sub_7C10C();
      uint64_t v326 = v367;
      uint64_t v22 = &_swiftEmptyArrayStorage;
      TableRow.init(cells:backgrounds:action:)(v70, &_swiftEmptyArrayStorage, v325);
      uint64_t v96 = v388;
      unint64_t v328 = *(void *)(v388 + 16);
      unint64_t v327 = *(void *)(v388 + 24);
      if (v328 >= v327 >> 1) {
        uint64_t v96 = sub_F8E8(v327 > 1, v328 + 1, 1LL, v388);
      }
      uint64_t v235 = v391;
      uint64_t v77 = v389;
      *(void *)(v96 + swift_unknownObjectWeakDestroy(v0 + 16) = v328 + 1;
      sub_7BE00();
      sub_7C234( v96 + v329 + *(void *)(v330 + 72) * v328,  v326,  *(uint64_t (**)(uint64_t, uint64_t, void))(v330 + 32));

      sub_7C184();
      sub_A068(v399, (uint64_t *)&unk_DF5D0);
      uint64_t v241 = v387;
      if (v387 == v77)
      {
        sub_A1C8();
        uint64_t v331 = v344;
        TableHeader.init(_:)(v384);
        uint64_t v332 = type metadata accessor for TableHeader(0LL);
        sub_3D68C(v331, 0LL, v333, v332);
        uint64_t v334 = (uint64_t)v342;
        Table.init(separatorLines:columns:header:rows:)(1LL, v383, v331, v96);
        sub_A068(v347, &qword_E0F80);
        uint64_t v335 = type metadata accessor for Table(0LL);
        sub_9E64(v334, 0LL, 1LL, v335);
        sub_A174();
        return;
      }
    }

    sub_7C0B4();
    uint64_t v278 = sub_33CF8();
    uint64_t v281 = sub_33C8C(v381, v279, v280, v278);
    uint64_t v284 = sub_7C048(v382, v282, v283, v281);
    uint64_t v285 = v362;
    sub_9F98(v284, v362, (uint64_t *)&unk_DF5D0);
    uint64_t v286 = v398;
    if (sub_9F8C(v285, 1LL, v398) == 1)
    {
      sub_A068(v285, (uint64_t *)&unk_DF5D0);
      __int128 v408 = 0u;
      __int128 v409 = 0u;
      uint64_t v410 = 0LL;
    }

    else
    {
      *((void *)&v409 + 1) = v286;
      uint64_t v294 = sub_7C1DC((uint64_t)&protocol witness table for Color);
      sub_1B1AC( (uint64_t)v294,  v285,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v286 - 8) + 32LL));
    }

    uint64_t v295 = sub_33D30();
    uint64_t v287 = v361;
    *(void *)(v361 + 24) = v295;
    sub_7C004((uint64_t)&protocol witness table for TextElement);
    uint64_t v296 = sub_7BEF8();
    sub_33C64(v296, v297, v381, v382, v298);
    *(void *)(v287 + 40) = 0LL;
    *(_BYTE *)(v287 + 48) = 1;
    sub_7C1C4(v287, v397);
    unint64_t v289 = *((void *)v70 + 2);
    unint64_t v288 = *((void *)v70 + 3);
    unint64_t v290 = v289 + 1;
    uint64_t v276 = v400;
    if (v289 < v288 >> 1) {
      goto LABEL_119;
    }
LABEL_116:
    BOOL v291 = sub_7C20C(v288);
    uint64_t v70 = (char *)sub_F8FC(v291, v292, v293, (uint64_t)v70);
    goto LABEL_119;
  }

  sub_7BD80(v111, (SEL *)&selRef_name);
  if (v121)
  {
    uint64_t v96 = v120;
    uint64_t v122 = v121;
    goto LABEL_27;
  }

  __break(1u);
}

id sub_7BC60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StandingsSnippetShim();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_7BCB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StandingsSnippetShim();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StandingsSnippetShim()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV20StandingsSnippetShim);
}

void sub_7BD00(void *a1)
{
}

void sub_7BD0C(void *a1)
{
}

void sub_7BD18(void *a1)
{
}

void sub_7BD24(void *a1, SEL *a2)
{
  id v2 = sub_42754(a1, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_3CA48((uint64_t)v2, &qword_E3080, &OBJC_CLASS___SASportsEntity_ptr);
    static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);
  }

  sub_6518();
}

void sub_7BD80(void *a1, SEL *a2)
{
  id v2 = sub_42754(a1, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_ADE8();
}

uint64_t sub_7BDD0(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_7BDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_9E64(a1, a2, a3, a4);
}

  ;
}

uint64_t sub_7BE14@<X0>(unint64_t a1@<X8>)
{
  return sub_FAB8(a1 > 1, v1, 1LL, v2);
}

uint64_t sub_7BE2C@<X0>(unint64_t a1@<X8>)
{
  return sub_F8FC(a1 > 1, v1, 1LL, v2);
}

uint64_t sub_7BE44@<X0>(unint64_t a1@<X8>)
{
  return sub_F8FC(a1 > 1, v1, 1LL, v2);
}

uint64_t sub_7BE5C()
{
  return (*(uint64_t (**)(uint64_t, void, void))(v1 - 232))( v0,  *(unsigned int *)(v1 - 644),  *(void *)(v1 - 224));
}

uint64_t sub_7BE70@<X0>(uint64_t a1@<X3>, unint64_t a2@<X8>)
{
  return sub_FAB8(a2 > 1, v2, 1LL, a1);
}

uint64_t sub_7BE84()
{
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  return v0(v5 + v6 + v2 * v3, v4, *(void *)(v7 - 280));
}

uint64_t sub_7BEA4(uint64_t a1)
{
  return v1(a1, v3, v2);
}

uint64_t sub_7BEB0()
{
  return type metadata accessor for Table(0LL);
}

uint64_t sub_7BECC@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(a1 - 256));
}

void sub_7BED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(v5 - 376) = a4;
}

uint64_t sub_7BEF8()
{
  return v0;
}

void sub_7BF08()
{
}

double sub_7BF30()
{
  *(void *)(v0 - sub_9F74((__int128 *)(v1 - 144), v1 - 192) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - 224) = 0u;
  *(_OWORD *)(v0 - sub_1AD30(v0 - 160, v0 - 208) = 0u;
  *(void *)(v0 - 240) = 0LL;
  *(_OWORD *)(v0 - 256) = 0u;
  *(_OWORD *)(v0 - 272) = 0u;
  return result;
}

  ;
}

uint64_t sub_7BF60()
{
  *(void *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  return v0(v6 + v3 + v2 * v4, v7, v5);
}

  ;
}

id sub_7BF84@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(*(void *)(a1 - 256) + 8 * v1);
}

uint64_t sub_7BF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v6 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v6 - 96, v5 + 8, v4, a4);
}

uint64_t sub_7BFA4(uint64_t a1, uint64_t a2)
{
  return Response.init(_:backgrounds:ornaments:hideRedactedElements:)(a1, a2, a2, 0LL);
}

uint64_t sub_7BFB0@<X0>( void *a1@<X0>, uint64_t (*a2)(void, void, void)@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_76AF4(a1, a2, a3, 2, 2u, a4);
}

uint64_t sub_7BFBC()
{
  return sub_3C4A0(0LL, (v0 & 0xC000000000000001LL) == 0, v0);
}

uint64_t sub_7BFD0()
{
  return (*(uint64_t (**)(void))(v0 - 344))();
}

uint64_t sub_7BFDC@<X0>(uint64_t a1@<X3>, unint64_t a2@<X8>)
{
  return sub_FAB8(a2 > 1, v2, 1LL, a1);
}

uint64_t sub_7BFF0@<X0>(uint64_t a1@<X3>, unint64_t a2@<X8>)
{
  return sub_FAA4(a2 > 1, v2, 1LL, a1);
}

void *sub_7C004@<X0>(uint64_t a1@<X8>)
{
  v1[4] = a1;
  return sub_9F38(v1);
}

uint64_t sub_7C010()
{
  return type metadata accessor for ImageElement.ImageStyle(0LL);
}

uint64_t sub_7C01C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return v3(a1, *(unsigned int *)(a2 - 256), v2);
}

uint64_t sub_7C028(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_7C030(uint64_t a1, uint64_t a2)
{
  return sub_9F8C(a1, a2, v2);
}

uint64_t sub_7C048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(void *)(v4 - 248);
}

  ;
}

uint64_t sub_7C074()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 - 232))(v1, v0, *(void *)(v2 - 224));
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_7C0C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 - 208))(a1, *(unsigned int *)(a2 - 256), v2);
}

uint64_t sub_7C0D0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for TableRow(0LL);
}

  ;
}

  ;
}

uint64_t sub_7C100(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, *(void *)(v1 - 312));
}

double sub_7C10C()
{
  *(void *)(v0 - sub_9F74((__int128 *)(v1 - 192), v1 - 144) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - sub_9F74((__int128 *)(v0 - 136), v0 - 176) = 0u;
  *(_OWORD *)(v0 - sub_1AD30(v0, v1 - 160) = 0u;
  return result;
}

uint64_t sub_7C120(uint64_t a1, unint64_t a2)
{
  return sub_CC88(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_7C12C()
{
  return v0(v2, v1);
}

uint64_t sub_7C138@<X0>(uint64_t a1@<X8>)
{
  return sub_9F74((__int128 *)(v1 - 136), a1 + 32);
}

uint64_t sub_7C144()
{
  return v0 - 136;
}

uint64_t sub_7C158()
{
  return 0LL;
}

  ;
}

void sub_7C178()
{
}

uint64_t sub_7C184()
{
  return sub_DBAC((void *)(v0 - 128));
}

void sub_7C18C(uint64_t a1, uint64_t a2)
{
}

void sub_7C198(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_7C1A4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  *(void *)(v4 - sub_1AD30(v0 - 160, v0 - 208) = a3;
  return a3(a1, a2, v3);
}

uint64_t sub_7C1B0()
{
  return v0;
}

uint64_t sub_7C1C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 - 208))(a1, a2, *(void *)(v2 - 216));
}

uint64_t sub_7C1D0(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

void *sub_7C1DC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - sub_9F74((__int128 *)(v1 - 192), v1 - 144) = a1;
  return sub_9F38((void *)(v1 - 176));
}

uint64_t sub_7C1E8()
{
  return swift_bridgeObjectRetain(*(void *)(v0 - 360));
}

uint64_t sub_7C1F4()
{
  return type metadata accessor for Command(0LL);
}

uint64_t sub_7C1FC()
{
  return type metadata accessor for PrimaryHeaderStandard(0LL);
}

uint64_t sub_7C204()
{
  return type metadata accessor for Table.ColumnSize(0LL);
}

BOOL sub_7C20C@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_7C220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22F00(a1, *(void *)(a2 - 256));
}

uint64_t sub_7C22C(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_7C234@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, void)@<X8>)
{
  return a3(a1, a2, *(void *)(v3 - 424));
}

uint64_t sub_7C240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void, void))(v2 - 208))( a1,  *(unsigned int *)(a2 - 256),  *(void *)(v2 - 216));
}

void sub_7C24C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v25;
  a20 = v26;
  unint64_t v27 = v20;
  uint64_t v29 = v28;
  uint64_t v30 = sub_A5F0();
  uint64_t v112 = *(void *)(v30 - 8);
  sub_A13C();
  __chkstk_darwin(v31);
  sub_1B028();
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v32);
  sub_5E888();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v33);
  sub_215D0();
  sub_9E24(&qword_E2300);
  sub_33C54();
  __chkstk_darwin(v34);
  sub_48FB8();
  uint64_t v36 = __chkstk_darwin(v35);
  uint64_t v38 = (char *)&v103 - v37;
  id v39 = sub_ED8C(v36, "league");
  if (!v39)
  {
    type metadata accessor for PrimaryHeaderStandard(0LL);
    sub_7C064();
    sub_7BDE8(v60, v61, v62, v63);
    return;
  }

  id v40 = v39;
  uint64_t v108 = v30;
  sub_44E28();
  if (qword_DED98 != -1) {
    swift_once(&qword_DED98, sub_846C0);
  }
  uint64_t v111 = sub_6F00C(qword_E4C18, unk_E4C20);
  uint64_t v110 = v41;
  uint64_t v42 = type metadata accessor for PrimaryHeaderStandard(0LL);
  uint64_t v43 = sub_862BC();
  uint64_t v46 = sub_9E64(v43, v44, v45, v42);
  id v109 = v40;
  sub_86850(v46, (SEL *)&selRef_displayedText);
  if (v48)
  {
    uint64_t v49 = v47;
    uint64_t v50 = v48;
    sub_2AF38();
    if (v51)
    {
      sub_33CF8();
      uint64_t v107 = v29;
      sub_2FD8C(v22);
      uint64_t v52 = v42;
      sub_86064();
      sub_86020();
      uint64_t v53 = sub_33D30();
      sub_86120();
      uint64_t v120 = v54;
      uint64_t v121 = &protocol witness table for TextElement;
      sub_A584();
      sub_86288();
      sub_33C64(v49, v50, v22, v23, (uint64_t)&v116);
      sub_2FD8C(v22);
      sub_86020();
      uint64_t v115 = 0LL;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      *((void *)&v117 + 1) = v53;
      id v118 = &protocol witness table for TextElement;
      sub_867B4();
      sub_86288();
      uint64_t v55 = sub_8638C();
      sub_33C64(v55, v56, v57, v23, v58);
      uint64_t v115 = 0LL;
      sub_8606C((__n128)0);
      sub_A264((uint64_t)&a13);
      sub_860FC(v59, &qword_E2300);
LABEL_14:
      sub_9E64(v21, 0LL, 1LL, v52);
      sub_A03C(v21, (uint64_t)v38, &qword_E2300);
      uint64_t v100 = sub_86580();
      sub_A03C(v100, v101, v102);
      sub_A174();
      return;
    }

    sub_A208();
  }

  uint64_t v105 = v42;
  uint64_t v106 = v23;
  if (AFSiriLogContextConnection)
  {
    uint64_t v64 = Logger.init(_:)(AFSiriLogContextConnection);
    os_log_type_t v65 = static os_log_type_t.debug.getter(v64);
    id v66 = v27;
    uint64_t v67 = v24;
    uint64_t v68 = (os_log_s *)Logger.logObject.getter(v66);
    os_log_type_t v69 = v65;
    if (os_log_type_enabled(v68, v65))
    {
      uint64_t v104 = v21;
      uint64_t v70 = sub_A1D0(12LL);
      uint64_t v107 = v29;
      uint64_t v71 = (uint8_t *)v70;
      uint64_t v72 = sub_A1D0(32LL);
      uint64_t v119 = v72;
      *(_DWORD *)uint64_t v71 = 136315138;
      uint64_t v67 = (uint64_t)(v71 + 12);
      uint64_t v103 = v71 + 4;
      *(void *)&__int128 v116 = swift_getObjectType();
      uint64_t v73 = sub_9E24(&qword_E4CE8);
      uint64_t v74 = sub_86118(v73, v73);
      uint64_t v76 = (_TtC6SiriTV27ConversationViewCoordinator *)v75;
      *(void *)&__int128 v116 = sub_2FD9C(v74, v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, (char *)&v116 + 8, v103, v71 + 12);

      uint64_t v77 = v76;
      uint64_t v21 = v104;
      swift_bridgeObjectRelease(v77, v78, v79, v80, v81, v82, v83, v84);
      sub_A284(&dword_0, v68, v69, "#aceshim %s league missing description", v71);
      sub_85F4C();
      sub_A15C(v72);
      sub_A15C((uint64_t)v71);
    }

    else
    {
    }

    sub_A4C0();
    sub_A55C(v24, v85);
    uint64_t v86 = v109;
    uint64_t v87 = sub_33CF8();
    sub_33C8C(v22, v88, v89, v87);
    uint64_t v90 = sub_86208((uint64_t)&a10);
    sub_9E64(v90, v91, v92, v93);
    sub_33D30();
    sub_86120();
    uint64_t v120 = v94;
    uint64_t v121 = &protocol witness table for TextElement;
    sub_A584();
    uint64_t v95 = sub_8638C();
    sub_33C64(v95, v96, v97, v67, v98);
    id v118 = 0LL;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    uint64_t v115 = 0LL;
    sub_8606C((__n128)0);

    sub_860FC(v99, &qword_E2300);
    uint64_t v52 = v105;
    goto LABEL_14;
  }

  __break(1u);
}

void sub_7C720(uint64_t a1@<X8>)
{
  if ((sub_41D28() & 1) != 0)
  {
    sub_868B4();
    sub_7D56C();
  }

  else
  {
    sub_868CC();
    sub_7C808();
    uint64_t v4 = sub_86428();
    uint64_t v5 = sub_A2E0(v1, 1LL, v4);
    if (v6)
    {
      sub_A488(v5, (uint64_t *)&unk_E4D70);
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
      *(void *)(a1 + 32) = 0LL;
    }

    else
    {
      uint64_t v7 = sub_86900((uint64_t)&protocol witness table for SummaryItemPairV2);
      sub_860CC((uint64_t)v7, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL));
    }

    sub_10E90();
  }

void sub_7C808()
{
  uint64_t v84 = v4;
  id v85 = v0;
  uint64_t v6 = v5;
  uint64_t v7 = (void *)sub_A5F0();
  uint64_t v82 = *(v7 - 1);
  id v83 = v7;
  sub_A13C();
  __chkstk_darwin(v8);
  sub_A148();
  uint64_t v81 = v9;
  sub_A168();
  __chkstk_darwin(v10);
  sub_A258();
  uint64_t v77 = v11;
  uint64_t v78 = *(void *)(sub_A274() - 8);
  sub_A13C();
  __chkstk_darwin(v12);
  uint64_t v80 = (uint64_t)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A168();
  __chkstk_darwin(v14);
  sub_A258();
  uint64_t v79 = v15;
  sub_9E24(&qword_DF620);
  sub_33C54();
  __chkstk_darwin(v16);
  sub_1AEE8();
  sub_9E24(&qword_E0E58);
  sub_33C54();
  __chkstk_darwin(v17);
  id v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_A600();
  sub_1B110();
  __chkstk_darwin(v21);
  sub_1B028();
  uint64_t v22 = sub_41D28();
  if ((v22 & 1) != 0)
  {
    sub_86428();
    sub_7C064();
    sub_7BDE8(v23, v24, v25, v26);
    return;
  }

  uint64_t v76 = v6;
  id v27 = sub_DDA4(v22, "siriui_firstEntity");
  if (!v27)
  {
    if (!AFSiriLogContextConnection)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }

    id v34 = AFSiriLogContextConnection;
    uint64_t v35 = v81;
    uint64_t v36 = Logger.init(_:)(v34);
    static os_log_type_t.debug.getter(v36);
    id v37 = sub_86890();
    uint64_t v38 = (os_log_s *)sub_8681C((uint64_t)v37);
    if (sub_860A4(v38))
    {
      uint64_t v39 = sub_A1D0(12LL);
      uint64_t v40 = sub_A1D0(32LL);
      sub_868A8(v40);
      v94[0] = sub_860E8(4.8149e-34);
      uint64_t v41 = sub_9E24(&qword_E4CE8);
      uint64_t v42 = sub_864AC(v41);
      uint64_t v44 = sub_863A8(v42, v43);
      sub_862A4(v44);

      sub_A3C8();
      sub_85FC0(&dword_0, v38, v45, "#aceshim %s missing first team");
      sub_85F4C();
      sub_A15C(v35);
      sub_A15C(v39);

      (*(void (**)(uint64_t, void *))(v82 + 8))(v81, v83);
LABEL_22:
      uint64_t v74 = v76;
      uint64_t v71 = sub_86428();
      uint64_t v72 = v74;
      uint64_t v73 = 1LL;
LABEL_23:
      sub_9E64(v72, v73, 1LL, v71);
      sub_A174();
      return;
    }

LABEL_21:
    (*(void (**)(uint64_t, void *))(v82 + 8))(v35, v83);
    goto LABEL_22;
  }

  uint64_t v28 = v27;
  id v29 = sub_DDA4((uint64_t)v27, "siriui_secondEntity");
  if (v29)
  {
    id v83 = v29;
    uint64_t v98 = 0LL;
    memset(v97, 0, sizeof(v97));
    sub_7CE38();
    uint64_t v30 = sub_A490();
    uint64_t v32 = sub_A2E0(v30, v31, v20);
    if (v33)
    {
      sub_A488(v32, &qword_E0E58);
    }

    else
    {
      sub_863C8(v3, (uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
      uint64_t v57 = sub_7C1F4();
      uint64_t v95 = (void *)v57;
      uint64_t v96 = &protocol witness table for Command;
      uint64_t v58 = sub_9F38(v94);
      uint64_t v82 = *(int *)(sub_9E24(&qword_E0730) + 48);
      sub_863C8((uint64_t)v58, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      *((_BYTE *)v58 + v82) = 1;
      sub_860CC( (uint64_t)v58,  enum case for Command.response(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104LL));
      sub_86698(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_629D0((uint64_t)v97);
      sub_A03C((uint64_t)v94, (uint64_t)v97, &qword_E0738);
    }

    sub_8687C(v59, (SEL *)&selRef_siriui_teamVsTeam);
    if (v61)
    {
      uint64_t v95 = &type metadata for String;
      uint64_t v96 = &protocol witness table for String;
      v94[0] = v60;
      v94[1] = v61;
      sub_8264C();
      uint64_t v62 = sub_33D30();
      uint64_t v63 = sub_A2E0(v1, 1LL, v62);
      if (v33)
      {
        sub_A410(v63, &qword_DF620);
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        uint64_t v93 = 0LL;
      }

      else
      {
        *((void *)&v92 + 1) = v62;
        uint64_t v93 = &protocol witness table for TextElement;
        uint64_t v64 = sub_9F38(&v91);
        sub_860CC((uint64_t)v64, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 32LL));
      }

      uint64_t v90 = 0LL;
      memset(v89, 0, sizeof(v89));
      uint64_t v65 = enum case for ImageElement.ImageStyle.image3(_:);
      uint64_t v66 = v79;
      sub_86530(v79, enum case for ImageElement.ImageStyle.image3(_:));
      uint64_t v67 = enum case for ImageElement.ImageStyle.contactImage3(_:);
      uint64_t v68 = v80;
      sub_86530(v80, enum case for ImageElement.ImageStyle.contactImage3(_:));
      sub_867FC(v28, v88);
      sub_8663C(v68);
      sub_8663C(v66);
      sub_86530(v66, v65);
      sub_86530(v68, v67);
      os_log_type_t v69 = v83;
      sub_867FC(v83, v87);
      sub_8663C(v68);
      sub_8663C(v66);
      sub_9F98((uint64_t)v97, (uint64_t)v86, &qword_E0738);
      uint64_t v70 = v76;
      sub_86750((uint64_t)v94, (uint64_t)&v91, (uint64_t)v89, (uint64_t)v88, (uint64_t)v87, (uint64_t)v86);

      sub_629D0((uint64_t)v97);
      uint64_t v71 = sub_86428();
      uint64_t v72 = v70;
      uint64_t v73 = 0LL;
      goto LABEL_23;
    }

    __break(1u);
    goto LABEL_25;
  }

  if (AFSiriLogContextConnection)
  {
    id v46 = AFSiriLogContextConnection;
    uint64_t v35 = v77;
    uint64_t v47 = Logger.init(_:)(v46);
    static os_log_type_t.debug.getter(v47);
    id v48 = sub_86890();
    uint64_t v49 = (os_log_s *)sub_8681C((uint64_t)v48);
    if (sub_860A4(v49))
    {
      id v85 = v28;
      uint64_t v50 = sub_A1D0(12LL);
      uint64_t v51 = sub_A1D0(32LL);
      sub_868A8(v51);
      v94[0] = sub_860E8(4.8149e-34);
      uint64_t v52 = sub_9E24(&qword_E4CE8);
      uint64_t v53 = sub_864AC(v52);
      uint64_t v55 = sub_863A8(v53, v54);
      sub_862A4(v55);

      sub_A3C8();
      sub_85FC0(&dword_0, v49, v56, "#aceshim %s missing second team");
      sub_85F4C();
      sub_A15C(v35);
      sub_A15C(v50);

      (*(void (**)(uint64_t, void *))(v82 + 8))(v77, v83);
      goto LABEL_22;
    }

    goto LABEL_21;
  }

void sub_7CE38()
{
  id v104 = v0;
  uint64_t v97 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = (void *)sub_A5F0();
  uint64_t v101 = *(v9 - 1);
  uint64_t v102 = v9;
  sub_A13C();
  __chkstk_darwin(v10);
  sub_6CCF4();
  __chkstk_darwin(v11);
  sub_A258();
  uint64_t v96 = v12;
  uint64_t v13 = sub_A274();
  __chkstk_darwin(v13);
  sub_6CD10();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v93 - v15;
  sub_9E24(&qword_DF620);
  sub_33C54();
  __chkstk_darwin(v17);
  uint64_t v18 = sub_A1AC();
  uint64_t v19 = type metadata accessor for SummaryItemPairV2(v18);
  uint64_t v99 = *(void *)(v19 - 8);
  uint64_t v100 = v19;
  sub_A13C();
  __chkstk_darwin(v20);
  uint64_t v98 = (char *)&v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A168();
  __chkstk_darwin(v22);
  sub_A258();
  uint64_t v103 = v23;
  uint64_t v24 = sub_41D28();
  if ((v24 & 1) != 0)
  {
    sub_A600();
    sub_7C064();
    sub_7BDE8(v25, v26, v27, v28);
    return;
  }

  uint64_t v95 = v8;
  id v29 = sub_8645C(v24, "siriui_firstEntity");
  if (!v29)
  {
    if (!AFSiriLogContextConnection)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }

    uint64_t v36 = sub_3CBC8((uint64_t)AFSiriLogContextConnection);
    static os_log_type_t.debug.getter(v36);
    id v30 = v104;
    id v37 = (os_log_s *)sub_86730((uint64_t)v30);
    if (sub_860A4(v37))
    {
      uint64_t v38 = sub_A1D0(12LL);
      uint64_t v39 = sub_A1D0(32LL);
      *(void *)&__int128 v115 = v39;
      *(void *)&__int128 v112 = sub_860D4(4.8149e-34);
      uint64_t v40 = sub_9E24(&qword_E4CE8);
      uint64_t v41 = sub_86118(v40, v40);
      *(void *)&__int128 v112 = sub_8619C(v41, v42);
      sub_DDB4((uint64_t)&v112, (uint64_t)&v112 + 8);

      sub_A49C();
      sub_85FC0(&dword_0, v37, v43, "#aceshim %s missing first team");
      sub_85F4C();
      sub_A15C(v39);
      sub_A15C(v38);

LABEL_33:
      (*(void (**)(uint64_t, void *))(v101 + 8))(v2, v102);
      goto LABEL_34;
    }

LABEL_32:
    goto LABEL_33;
  }

  id v30 = v29;
  id v94 = sub_8645C((uint64_t)v29, "siriui_secondEntity");
  if (v94)
  {
    uint64_t v102 = v30;
    id v118 = &_swiftEmptyArrayStorage;
    sub_85C70(v6, (SEL *)&selRef_siriui_teamVsTeam);
    if (v32)
    {
      __int128 v116 = &type metadata for String;
      __int128 v117 = &protocol witness table for String;
      *(void *)&__int128 v115 = v31;
      *((void *)&v115 + 1) = v32;
      sub_8264C();
      uint64_t v33 = sub_33D30();
      uint64_t v34 = sub_A2E0(v1, 1LL, v33);
      if (v35)
      {
        sub_A410(v34, &qword_DF620);
        sub_86120();
      }

      else
      {
        uint64_t v113 = v33;
        __int128 v114 = &protocol witness table for TextElement;
        uint64_t v53 = sub_867B4();
        sub_860CC((uint64_t)v53, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 32LL));
      }

      uint64_t v54 = sub_41EEC(2LL);
      if (v55)
      {
        *((void *)&v110 + 1) = &type metadata for String;
        uint64_t v111 = &protocol witness table for String;
        *(void *)&__int128 v109 = v54;
        *((void *)&v109 + 1) = v55;
      }

      else
      {
        uint64_t v111 = 0LL;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
      }

      uint64_t v56 = enum case for ImageElement.ImageStyle.image3(_:);
      sub_86474((uint64_t)v16, enum case for ImageElement.ImageStyle.image3(_:));
      uint64_t v57 = enum case for ImageElement.ImageStyle.contactImage3(_:);
      sub_86474(v3, enum case for ImageElement.ImageStyle.contactImage3(_:));
      sub_86940(v102, v108);
      sub_86444(v3);
      sub_86444((uint64_t)v16);
      sub_86474((uint64_t)v16, v56);
      sub_86474(v3, v57);
      sub_86940(v94, v107);
      sub_86444(v3);
      sub_86444((uint64_t)v16);
      uint64_t v106 = 0LL;
      memset(v105, 0, sizeof(v105));
      uint64_t v58 = v103;
      sub_86750((uint64_t)&v115, (uint64_t)&v112, (uint64_t)&v109, (uint64_t)v108, (uint64_t)v107, (uint64_t)v105);
      uint64_t v60 = v98;
      uint64_t v59 = v99;
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v99 + 16);
      uint64_t v62 = (void *)v100;
      v61(v98, (uint64_t)v58, v100);
      if ((sub_86678() & 1) == 0)
      {
        sub_7C198(0LL, *((void *)v58 + 2) + 1LL);
        sub_86308(v86);
      }

      unint64_t v64 = *((void *)v58 + 2);
      unint64_t v63 = *((void *)v58 + 3);
      if (v64 >= v63 >> 1)
      {
        sub_7C198(v63 > 1, v64 + 1);
        sub_86308(v87);
      }

      __int128 v116 = v62;
      __int128 v117 = &protocol witness table for SummaryItemPairV2;
      uint64_t v65 = (char *)sub_9F38(&v115);
      v61(v65, (uint64_t)v60, (uint64_t)v62);
      sub_86658();
      sub_9F74(&v115, v66);
      uint64_t v67 = *(void (**)(char *, void *))(v59 + 8);
      v67(v60, v62);
      uint64_t v68 = (uint64_t)v118;
      sub_81230();
      if (v113)
      {
        sub_9F74(&v112, (uint64_t)&v115);
        sub_86320();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v68);
        uint64_t v71 = v95;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_F8D4(0LL, *(void *)(v68 + 16) + 1LL, 1LL, v68);
          uint64_t v68 = (uint64_t)v88;
          id v118 = v88;
        }

        unint64_t v72 = *(void *)(v68 + 24);
        if (*(void *)(v68 + 16) >= v72 >> 1)
        {
          BOOL v89 = sub_862D4(v72);
          sub_F8D4(v89, v90, v91, v68);
          id v118 = v92;
        }

        uint64_t v73 = v113;
        uint64_t v74 = (uint64_t)v114;
        sub_1A800((uint64_t)&v112, v113);
        sub_86430();
        __chkstk_darwin(v75);
        sub_A5C8( (uint64_t)&v93 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v78,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 16));
        uint64_t v79 = sub_868CC();
        sub_85D2C(v79, v80, v81, v73, v74);
        sub_867AC();
        sub_86690();
        uint64_t v68 = (uint64_t)v118;
      }

      else
      {
        sub_867C8(v69, &qword_E2340);
        uint64_t v71 = v95;
      }

      sub_7BFA4(v68, (uint64_t)&_swiftEmptyArrayStorage);

      v67(v103, v62);
      uint64_t v82 = sub_A600();
      uint64_t v83 = v71;
      uint64_t v84 = 0LL;
      goto LABEL_35;
    }

    __break(1u);
    goto LABEL_37;
  }

  if (AFSiriLogContextConnection)
  {
    id v44 = AFSiriLogContextConnection;
    uint64_t v2 = v96;
    uint64_t v45 = sub_3CBC8((uint64_t)v44);
    static os_log_type_t.debug.getter(v45);
    id v46 = v104;
    uint64_t v47 = (os_log_s *)sub_86730((uint64_t)v46);
    if (sub_86360(v47))
    {
      id v48 = (uint8_t *)sub_A1D0(12LL);
      uint64_t v49 = sub_A1D0(32LL);
      *(void *)&__int128 v115 = v49;
      *(void *)&__int128 v112 = sub_8634C(4.8149e-34);
      uint64_t v50 = sub_9E24(&qword_E4CE8);
      uint64_t v51 = sub_86118(v50, v50);
      *(void *)&__int128 v112 = sub_8619C(v51, v52);
      sub_DDB4((uint64_t)&v112, (uint64_t)&v112 + 8);

      sub_A49C();
      sub_A284(&dword_0, v47, (os_log_type_t)v16, "#aceshim %s missing second team", v48);
      sub_A27C(v49);
      sub_A15C(v49);
      sub_A15C((uint64_t)v48);

      (*(void (**)(uint64_t, void *))(v101 + 8))(v96, v102);
LABEL_34:
      uint64_t v85 = v95;
      uint64_t v82 = sub_A600();
      uint64_t v83 = v85;
      uint64_t v84 = 1LL;
LABEL_35:
      sub_9E64(v83, v84, 1LL, v82);
      sub_A174();
      return;
    }

    goto LABEL_32;
  }

void sub_7D56C()
{
  uint64_t v30 = v0;
  int v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_9E24(&qword_E4D68);
  sub_33C54();
  __chkstk_darwin(v12);
  sub_1B010();
  sub_9E24(&qword_E0E58);
  sub_33C54();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_A600();
  sub_4EEB0();
  __chkstk_darwin(v17);
  sub_1B028();
  if ((sub_41D28() & 1) != 0)
  {
    uint64_t v33 = 0LL;
    memset(v32, 0, sizeof(v32));
    int v28 = v5;
    uint64_t v29 = v9;
    sub_7D7B8();
    uint64_t v18 = sub_A2E0((uint64_t)v15, 1LL, v16);
    if (v19)
    {
      sub_860FC(v18, &qword_E0E58);
    }

    else
    {
      sub_863C8(v3, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
      uint64_t v20 = sub_7C1F4();
      v31[3] = v20;
      v31[4] = &protocol witness table for Command;
      uint64_t v21 = sub_9F38(v31);
      uint64_t v22 = sub_9E24(&qword_E0730);
      v27[1] = v7;
      uint64_t v23 = *(int *)(v22 + 48);
      sub_863C8((uint64_t)v21, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      *((_BYTE *)v21 + v23) = 1;
      sub_860CC( (uint64_t)v21,  enum case for Command.response(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104LL));
      sub_86698(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_629D0((uint64_t)v32);
      sub_A03C((uint64_t)v31, (uint64_t)v32, &qword_E0738);
    }

    sub_7DC50();
    uint64_t v24 = sub_86420();
    sub_A2E0(v1, 1LL, v24);
    if (v19)
    {
      sub_A068((uint64_t)v32, &qword_E0738);
      sub_A488(v25, &qword_E4D68);
      *(_OWORD *)uint64_t v11 = 0u;
      *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
      *(void *)(v11 + 32) = 0LL;
    }

    else
    {
      uint64_t v26 = sub_86900((uint64_t)&protocol witness table for SummaryItemPairNumberV2);
      sub_860CC((uint64_t)v26, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32LL));
      sub_A068((uint64_t)v32, &qword_E0738);
    }
  }

  else
  {
    *(void *)(v11 + 32) = 0LL;
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
  }

  sub_A174();
}

void sub_7D7B8()
{
  LODWORD(v80) = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_9E24(&qword_E4D60);
  sub_33C54();
  __chkstk_darwin(v9);
  uint64_t v77 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_A24C();
  uint64_t v76 = type metadata accessor for ReferenceStandard(v11);
  uint64_t v79 = *(void *)(v76 - 8);
  sub_A13C();
  __chkstk_darwin(v12);
  sub_A148();
  uint64_t v75 = v13;
  sub_A168();
  __chkstk_darwin(v14);
  sub_A258();
  uint64_t v78 = v15;
  sub_9E24(&qword_E4D68);
  sub_33C54();
  __chkstk_darwin(v16);
  uint64_t v17 = sub_86404();
  uint64_t v18 = type metadata accessor for SummaryItemPairNumberV2(v17);
  sub_4EEB0();
  __chkstk_darwin(v19);
  sub_860BC();
  __chkstk_darwin(v20);
  sub_A258();
  uint64_t v81 = v21;
  if ((sub_41D28() & 1) != 0)
  {
    uint64_t v74 = v8;
    uint64_t v87 = &_swiftEmptyArrayStorage;
    sub_865A0();
    sub_7DC50();
    sub_A068((uint64_t)v84, &qword_E0738);
    sub_A2E0(v3, 1LL, v18);
    if (v22)
    {
      swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
      sub_A068(v3, &qword_E4D68);
      uint64_t v23 = sub_A600();
      uint64_t v24 = v74;
      uint64_t v25 = 1LL;
    }

    else
    {
      uint64_t v80 = (uint8_t *)v6;
      uint64_t v73 = v0;
      uint64_t v30 = v81;
      sub_863C8(v81, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
      uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
      v31(v1, v30, v18);
      uint64_t v32 = v87;
      char v33 = sub_86148();
      uint64_t v34 = v18;
      if ((v33 & 1) == 0)
      {
        sub_4626C(0LL, v32[2] + 1LL);
        sub_86298(v67);
      }

      uint64_t v35 = v76;
      unint64_t v37 = v32[2];
      unint64_t v36 = v32[3];
      if (v37 >= v36 >> 1)
      {
        sub_85FE0(v36);
        sub_86298(v68);
      }

      uint64_t v85 = v34;
      uint64_t v86 = &protocol witness table for SummaryItemPairNumberV2;
      uint64_t v38 = sub_86280();
      v31((uint64_t)v38, v1, v34);
      v32[2] = v37 + 1;
      sub_861FC((uint64_t)&v32[5 * v37]);
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
      uint64_t v76 = v34;
      v39(v1, v34);
      uint64_t v40 = v80;
      uint64_t v41 = v73;
      sub_7E6A0((uint64_t)v80);
      sub_895AC(v42);
      sub_7E4A8(v40);
      uint64_t v43 = sub_A490();
      uint64_t v45 = sub_A2E0(v43, v44, v35);
      if (v22)
      {
        sub_A488(v45, &qword_E4D60);
        uint64_t v46 = v74;
      }

      else
      {
        uint64_t v48 = v78;
        uint64_t v47 = v79;
        uint64_t v49 = sub_863D0();
        sub_867E4(v49, v50, v51);
        unint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
        uint64_t v53 = v75;
        v52(v75, v48, v35);
        uint64_t v54 = v87;
        char v55 = sub_86148();
        uint64_t v46 = v74;
        if ((v55 & 1) == 0)
        {
          sub_4626C(0LL, v54[2] + 1LL);
          sub_86298(v71);
        }

        unint64_t v57 = v54[2];
        unint64_t v56 = v54[3];
        if (v57 >= v56 >> 1)
        {
          sub_85FE0(v56);
          sub_86298(v72);
        }

        uint64_t v85 = v35;
        uint64_t v86 = &protocol witness table for ReferenceStandard;
        uint64_t v58 = sub_86280();
        v52((uint64_t)v58, v53, v35);
        v54[2] = v57 + 1;
        sub_861FC((uint64_t)&v54[5 * v57]);
        uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
        v59(v53, v35);
        v59(v78, v35);
        uint64_t v41 = v73;
      }

      uint64_t v60 = v41;
      sub_81230();
      if (v83)
      {
        sub_9F74(&v82, (uint64_t)v84);
        sub_22F00((uint64_t)v84, (uint64_t)&v82);
        if ((sub_86678() & 1) == 0)
        {
          sub_7C198(0LL, *(void *)(v41 + 16) + 1LL);
          sub_86308(v69);
        }

        unint64_t v62 = *(void *)(v41 + 16);
        unint64_t v61 = *(void *)(v60 + 24);
        if (v62 >= v61 >> 1)
        {
          sub_7C198(v61 > 1, v62 + 1);
          uint64_t v87 = v70;
        }

        sub_867EC((uint64_t)&v82);
        sub_86430();
        __chkstk_darwin(v63);
        sub_85F5C(v64, v65, v73);
        sub_861EC(v62, v66, (uint64_t *)&v87);
        sub_DBAC(&v82);
        sub_867F4();
      }

      else
      {
        sub_A068((uint64_t)&v82, &qword_E2340);
      }

      sub_7BFA4((uint64_t)v87, (uint64_t)&_swiftEmptyArrayStorage);
      v39(v81, v76);
      uint64_t v23 = sub_A600();
      uint64_t v24 = v46;
      uint64_t v25 = 0LL;
    }

    sub_9E64(v24, v25, 1LL, v23);
    sub_A174();
  }

  else
  {
    sub_A600();
    sub_7C064();
    sub_7BDE8(v26, v27, v28, v29);
  }

void sub_7DC50()
{
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  char v71 = v6;
  uint64_t v8 = v7;
  uint64_t v80 = v9;
  uint64_t v75 = *(void *)(sub_A5F0() - 8);
  sub_A13C();
  __chkstk_darwin(v10);
  sub_6CCF4();
  __chkstk_darwin(v11);
  sub_A274();
  sub_A13C();
  __chkstk_darwin(v12);
  sub_A148();
  uint64_t v74 = v13;
  sub_A168();
  __chkstk_darwin(v14);
  sub_A258();
  uint64_t v73 = v15;
  sub_9E24(&qword_DF620);
  sub_33C54();
  __chkstk_darwin(v16);
  sub_A118();
  uint64_t v72 = v17;
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v18);
  sub_5E888();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v19);
  sub_48FB8();
  __chkstk_darwin(v20);
  sub_A258();
  uint64_t v79 = v21;
  id v23 = sub_ED8C(v22, "siriui_firstEntity");
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = sub_ED8C((uint64_t)v23, "siriui_secondEntity");
    if (v25)
    {
      uint64_t v78 = v25;
      sub_83120((uint64_t)v101, (uint64_t)v102, v8);
      sub_83338(v79);
      uint64_t v26 = sub_415E4();
      if (v27) {
        uint64_t v28 = v26;
      }
      else {
        uint64_t v28 = 0LL;
      }
      uint64_t v76 = v28;
      unint64_t v29 = 0xE000000000000000LL;
      if (v27) {
        unint64_t v29 = v27;
      }
      uint64_t v69 = v29;
      sub_9F98(v79, v1, &qword_E10E8);
      sub_86064();
      sub_86020();
      sub_9F98((uint64_t)v101, (uint64_t)&v96, &qword_E4D10);
      sub_9F98((uint64_t)v102, (uint64_t)v99, &qword_E4D10);
      uint64_t v30 = sub_33D30();
      v100[3] = v30;
      v100[4] = &protocol witness table for TextElement;
      sub_9F38(v100);
      sub_86288();
      sub_33C64(v76, v69, v1, v2, (uint64_t)&v96);
      sub_A068((uint64_t)v99, &qword_E4D10);
      uint64_t v77 = v8;
      sub_415F0();
      sub_864BC();
      sub_9F98(v79, v1, &qword_E10E8);
      sub_86020();
      sub_86848((uint64_t)v101, (uint64_t)&v96);
      sub_86848((uint64_t)v102, (uint64_t)v99);
      uint64_t v70 = v30;
      v95[3] = v30;
      v95[4] = &protocol witness table for TextElement;
      sub_9F38(v95);
      sub_86288();
      uint64_t v31 = sub_868B4();
      sub_33C64(v31, v32, v1, v2, (uint64_t)v99);
      sub_A068((uint64_t)&v96, &qword_E4D10);
      if ((v71 & 1) != 0)
      {
        v33.super.Class isa = sub_866BC().super.isa;
        id v34 = objc_msgSend(v24, "siritv_abbreviatedName:", v33.super.isa);

        if (v34)
        {
          sub_865D4();
          sub_86810();
          *((void *)&v97 + 1) = &type metadata for String;
          uint64_t v98 = &protocol witness table for String;
          *(NSLocale *)&__int128 v96 = v33;
          *((void *)&v96 + 1) = v102;
        }

        else
        {
          uint64_t v98 = 0LL;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
        }

        v57.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
        id v58 = objc_msgSend(v78, "siritv_abbreviatedName:", v57.super.isa);

        if (v58)
        {
          sub_865D4();
          sub_86810();
          *((void *)&v93 + 1) = &type metadata for String;
          id v94 = &protocol witness table for String;
          *(NSLocale *)&__int128 v92 = v57;
          *((void *)&v92 + 1) = v84;
LABEL_27:
          sub_82280(v77);
          if (v60)
          {
            *((void *)&v90 + 1) = &type metadata for String;
            uint64_t v91 = &protocol witness table for String;
            *(void *)&__int128 v89 = v59;
            *((void *)&v89 + 1) = v60;
          }

          else
          {
            uint64_t v91 = 0LL;
            __int128 v89 = 0u;
            __int128 v90 = 0u;
          }

          sub_8264C();
          uint64_t v61 = sub_A490();
          uint64_t v63 = sub_A2E0(v61, v62, v70);
          if (v64)
          {
            sub_A488(v63, &qword_DF620);
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            uint64_t v88 = 0LL;
          }

          else
          {
            *((void *)&v87 + 1) = v70;
            uint64_t v88 = &protocol witness table for TextElement;
            uint64_t v65 = sub_9F38(&v86);
            sub_860CC( (uint64_t)v65,  v72,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 32LL));
          }

          uint64_t v85 = 0LL;
          memset(v84, 0, sizeof(v84));
          uint64_t v66 = enum case for ImageElement.ImageStyle.image3(_:);
          sub_862CC(v73, enum case for ImageElement.ImageStyle.image3(_:));
          uint64_t v67 = enum case for ImageElement.ImageStyle.contactImage3(_:);
          sub_862CC(v74, enum case for ImageElement.ImageStyle.contactImage3(_:));
          sub_8666C(v24, v83);
          sub_86538(v74);
          sub_86538(v73);
          sub_862CC(v73, v66);
          sub_862CC(v74, v67);
          sub_8666C(v78, v82);
          sub_86538(v74);
          sub_86538(v73);
          sub_9F98(v5, (uint64_t)v81, &qword_E0738);
          SummaryItemPairNumberV2.init(number1:number2:text1:text2:text3:text4:text5:thumbnail1:thumbnail2:action:componentName:linkIdentifier:)( v100,  v95,  &v96,  &v92,  &v89,  &v86,  v84,  v83,  v82,  v81,  0LL,  0xE000000000000000LL,  0LL,  0LL);

          sub_A068(v79, &qword_E10E8);
          sub_867C8(v68, &qword_E4D58);
          uint64_t v54 = sub_86420();
          uint64_t v55 = v80;
          uint64_t v56 = 0LL;
          goto LABEL_34;
        }
      }

      else
      {
        uint64_t v98 = 0LL;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
      }

      id v94 = 0LL;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      goto LABEL_27;
    }

    if (AFSiriLogContextConnection)
    {
      uint64_t v45 = sub_216EC((uint64_t)AFSiriLogContextConnection);
      static os_log_type_t.debug.getter(v45);
      id v46 = v3;
      uint64_t v47 = (os_log_s *)sub_1B2C4((uint64_t)v46);
      if (sub_86360(v47))
      {
        uint64_t v48 = (uint8_t *)sub_A1D0(12LL);
        uint64_t v49 = sub_A1D0(32LL);
        v101[0] = v49;
        *(_DWORD *)uint64_t v48 = 136315138;
        *(void *)&__int128 v96 = swift_getObjectType();
        uint64_t v50 = sub_9E24(&qword_E4CE8);
        uint64_t v51 = sub_8670C(v50);
        *(void *)&__int128 v96 = sub_86724(v51, v52);
        sub_DDB4((uint64_t)&v96, (uint64_t)&v96 + 8);

        sub_A49C();
        sub_A284(&dword_0, v47, (os_log_type_t)v5, "#aceshim %s missing second team", v48);
        sub_A27C(v49);
        uint64_t v53 = v80;
        sub_A15C(v49);
        sub_A15C((uint64_t)v48);

        sub_8644C();
      }

      else
      {

        sub_8644C();
        uint64_t v53 = v80;
      }

      uint64_t v54 = sub_86420();
      uint64_t v55 = v53;
LABEL_22:
      uint64_t v56 = 1LL;
LABEL_34:
      sub_9E64(v55, v56, 1LL, v54);
      sub_A174();
      return;
    }
  }

  else
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v35 = sub_3CBC8((uint64_t)AFSiriLogContextConnection);
      static os_log_type_t.debug.getter(v35);
      id v36 = v3;
      unint64_t v37 = (os_log_s *)sub_86730((uint64_t)v36);
      if (sub_86360(v37))
      {
        uint64_t v38 = (uint8_t *)sub_A1D0(12LL);
        uint64_t v39 = sub_A1D0(32LL);
        v101[0] = v39;
        *(void *)&__int128 v96 = sub_8634C(4.8149e-34);
        uint64_t v40 = sub_9E24(&qword_E4CE8);
        uint64_t v41 = sub_8670C(v40);
        *(void *)&__int128 v96 = sub_86724(v41, v42);
        sub_DDB4((uint64_t)&v96, (uint64_t)&v96 + 8);

        sub_A49C();
        sub_A284(&dword_0, v37, (os_log_type_t)v5, "#aceshim %s missing first team", v38);
        sub_A27C(v39);
        uint64_t v43 = v39;
        uint64_t v44 = v80;
        sub_A15C(v43);
        sub_A15C((uint64_t)v38);

        sub_8632C(v75);
      }

      else
      {

        sub_8632C(v75);
        uint64_t v44 = v80;
      }

      uint64_t v54 = sub_86420();
      uint64_t v55 = v44;
      goto LABEL_22;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_7E4A8(uint8_t *a1)
{
  uint64_t v4 = sub_A5F0();
  __chkstk_darwin(v4);
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v5);
  sub_1AED0();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v6);
  sub_1AEE8();
  sub_86850(v7, (SEL *)&selRef_siriui_venueLocation);
  if (v9)
  {
    uint64_t v10 = v8;
    a1 = v9;
    sub_2AF38();
    if (v11)
    {
      uint64_t v12 = sub_33CF8();
      uint64_t v15 = sub_33C8C(v2, v13, v14, v12);
      sub_9E64(v1, 1LL, 1LL, v15);
      memset(v28, 0, sizeof(v28));
      uint64_t v29 = 0LL;
      v30[3] = sub_33D30();
      v30[4] = &protocol witness table for TextElement;
      sub_9F38(v30);
      TextElement.init(_:font:fontWeight:fontColor:italic:bold:lineLimit:idioms:)(v10, a1, v2, v1, v28, 2LL, 2LL);
      double v16 = sub_865A0();
      ReferenceStandard.init(text1:action:)(v30, v28, v16);
LABEL_9:
      type metadata accessor for ReferenceStandard(0LL);
      uint64_t v24 = sub_86770();
      sub_9E64(v24, v25, v26, v27);
      sub_1AEA4();
      return;
    }

    sub_3CBD0();
  }

  if (AFSiriLogContextConnection)
  {
    uint64_t v17 = sub_21444((uint64_t)AFSiriLogContextConnection);
    uint64_t v18 = static os_log_type_t.debug.getter(v17);
    os_log_type_t v19 = v18;
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v18);
    if (sub_21568(v20))
    {
      uint64_t v21 = (_WORD *)sub_A1D0(2LL);
      sub_1B594(v21);
      sub_DD8C(&dword_0, v20, v19, "#aceshim missing location name", a1);
      sub_A15C((uint64_t)a1);
    }

    uint64_t v22 = sub_863D0();
    v23(v22);
    goto LABEL_9;
  }

  __break(1u);
}

void sub_7E6A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
  if (!v4)
  {
    sub_3CBD0();
    goto LABEL_9;
  }

  if (v5 != v2 || v4 != v6)
  {
    char v8 = sub_A244(v5, v6, v2, v4);
    sub_3CBD0();
    sub_A418();
    if ((v8 & 1) != 0) {
      goto LABEL_11;
    }
LABEL_9:
    sub_86580();
    sub_7EFE8();
    return;
  }

  sub_3CBD0();
  sub_A418();
LABEL_11:
  sub_86580();
  sub_7E764();
}

void sub_7E764()
{
  uint64_t v4 = v0;
  id v160 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v159 = sub_A5F0();
  sub_1B110();
  __chkstk_darwin(v10);
  sub_A344();
  uint64_t v13 = v11 - v12;
  __chkstk_darwin(v14);
  double v16 = (char *)v153 - v15;
  uint64_t v17 = type metadata accessor for Table(0LL);
  uint64_t v155 = *(void *)(v17 - 8);
  sub_A13C();
  __chkstk_darwin(v18);
  uint64_t v156 = (char *)v153 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A168();
  uint64_t v21 = __chkstk_darwin(v20);
  id v23 = (char *)v153 - v22;
  __chkstk_darwin(v21);
  sub_A1EC();
  uint64_t v154 = v24;
  sub_A168();
  uint64_t v26 = __chkstk_darwin(v25);
  sub_868D8(v26, v27, v28, v29, v30, v31, v32, v33, v153[0]);
  sub_9E24(&qword_E0F80);
  sub_33C54();
  __chkstk_darwin(v34);
  sub_1AED0();
  v166[0] = (uint64_t)&_swiftEmptyArrayStorage;
  id v35 = objc_msgSend(v9, "siriui_firstEntity");
  if (v35)
  {
    id v36 = v35;
    id v37 = objc_msgSend(v9, "siriui_secondEntity");
    uint64_t v158 = v37;
    if (v37)
    {
      id v38 = (id)SRUIFGetLocale(v37);
      if (v38)
      {
        uint64_t v41 = v38;
        static Locale._unconditionallyBridgeFromObjectiveC(_:)(v38, v39, v40);

        uint64_t v43 = sub_53D10();
        uint64_t v44 = 0LL;
      }

      else
      {
        uint64_t v43 = type metadata accessor for Locale(0LL);
        uint64_t v44 = 1LL;
      }

      sub_3D68C(v1, v44, v42, v43);
      sub_416D4(v1);
      uint64_t v159 = v63;
      sub_860FC(v63, &qword_E0F80);
      Class isa = sub_866BC().super.isa;
      id v65 = objc_msgSend(v9, "siritv_additionalLineTotals:", isa);

      uint64_t v66 = sub_8691C();
      v153[2] = sub_8648C(v66);

      sub_85C70(v7, (SEL *)&selRef_sport);
      if (v68) {
        uint64_t v69 = v67;
      }
      else {
        uint64_t v69 = 0LL;
      }
      if (v68) {
        uint64_t v70 = v68;
      }
      else {
        uint64_t v70 = 0xE000000000000000LL;
      }
      uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
      BOOL v73 = v69 == v71 && v70 == v72;
      v153[0] = (uint64_t)v23;
      v153[1] = v69;
      uint64_t v157 = v36;
      v153[3] = (uint64_t)v4;
      if (v73)
      {
        sub_A470();
      }

      else
      {
        char v74 = sub_A244(v69, v70, v71, v72);
        sub_A208();
        if ((v74 & 1) == 0)
        {
          uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeSoccerValue);
          if (v69 == v75 && v70 == v76)
          {
            sub_A470();
          }

          else
          {
            char v78 = sub_A244(v69, v70, v75, v76);
            sub_A208();
            if ((v78 & 1) == 0)
            {
              sub_44E28();
              sub_86924();
              sub_33D4C();
LABEL_33:
              uint64_t v81 = sub_6F190(v79, v80);
              uint64_t v83 = v82;
LABEL_34:
              uint64_t v84 = (uint64_t)v9;
              uint64_t v85 = sub_415E4();
              if (v86) {
                uint64_t v87 = v85;
              }
              else {
                uint64_t v87 = 0LL;
              }
              if (v86) {
                uint64_t v88 = v86;
              }
              else {
                uint64_t v88 = 0xE000000000000000LL;
              }
              sub_415F0();
              sub_864BC();
              if (v73) {
                uint64_t v90 = 0xE000000000000000LL;
              }
              else {
                uint64_t v90 = v89;
              }
              id v91 = objc_allocWithZone((Class)v3);
              id v92 = sub_4125C(v81, v83, v87, v88, v84, v90);
              uint64_t v151 = (uint64_t)v160;
              sub_86798();
              sub_7FABC(v93, v94, v95, v96, v97, v98, v99, v100, v101, v70, 1u, v151);
              sub_7BD0C(v157);
              sub_864BC();
              uint64_t v102 = type metadata accessor for SectionHeaderStandard(0LL);
              uint64_t v163 = v102;
              uint64_t v164 = &protocol witness table for SectionHeaderStandard;
              sub_86280();
              sub_7F688();
              sub_A1C8();
              uint64_t v103 = v166[0];
              if ((swift_isUniquelyReferenced_nonNull_native(v166[0]) & 1) == 0)
              {
                sub_863B0(0LL, *(void *)(v103 + 16) + 1LL);
                uint64_t v103 = v143;
                v166[0] = v143;
              }

              uint64_t v104 = v154;
              unint64_t v105 = *(void *)(v103 + 24);
              if (*(void *)(v103 + 16) >= v105 >> 1)
              {
                BOOL v144 = sub_862D4(v105);
                sub_F8D4(v144, v145, v146, v103);
                v166[0] = v147;
              }

              uint64_t v106 = v163;
              uint64_t v107 = (uint64_t)v164;
              sub_1A800((uint64_t)v162, v163);
              sub_86430();
              __chkstk_darwin(v108);
              sub_1B3BC();
              sub_1B1AC(v87, v110, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v109 + 16));
              uint64_t v111 = sub_868B4();
              sub_85D2C(v111, v112, v113, v106, v107);
              sub_867F4();
              uint64_t v114 = v166[0];
              sub_8662C(v104, v161);
              v166[0] = v114;
              unint64_t v116 = *(void *)(v114 + 16);
              unint64_t v115 = *(void *)(v114 + 24);
              if (v116 >= v115 >> 1)
              {
                sub_7C198(v115 > 1, v116 + 1);
                sub_86308(v148);
              }

              uint64_t v163 = v17;
              uint64_t v164 = &protocol witness table for Table;
              __int128 v117 = sub_86280();
              sub_8662C((uint64_t)v117, v104);
              *(void *)(v114 + swift_unknownObjectWeakDestroy(v0 + 16) = v116 + 1;
              sub_861FC(v114 + 40 * v116);
              sub_8643C(v104);
              uint64_t v118 = v166[0];
              uint64_t v152 = (uint64_t)v160;
              uint64_t v119 = v153[0];
              id v160 = v92;
              sub_86798();
              sub_7FABC(v120, v121, v122, v123, v124, v125, v126, v127, v128, v70, 2u, v152);
              sub_A470();
              sub_A4F4();
              sub_A418();
              sub_7BD0C(v158);
              uint64_t v163 = v102;
              uint64_t v164 = &protocol witness table for SectionHeaderStandard;
              sub_86280();
              sub_1B404();
              sub_7F688();
              sub_A208();
              unint64_t v130 = *(void *)(v118 + 16);
              unint64_t v129 = *(void *)(v118 + 24);
              if (v130 >= v129 >> 1)
              {
                sub_863B0(v129 > 1, v130 + 1);
                v166[0] = v149;
              }

              sub_867EC((uint64_t)v162);
              sub_86430();
              __chkstk_darwin(v131);
              sub_85F5C(v132, v133, v153[0]);
              sub_861EC(v130, v134, v166);
              sub_867F4();
              uint64_t v135 = v166[0];
              uint64_t v136 = (uint64_t)v156;
              uint64_t v137 = sub_866DC();
              sub_8662C(v137, v138);
              v166[0] = v135;
              unint64_t v140 = *(void *)(v135 + 16);
              unint64_t v139 = *(void *)(v135 + 24);
              if (v140 >= v139 >> 1)
              {
                sub_85FE0(v139);
                sub_86298(v150);
              }

              uint64_t v141 = v160;
              uint64_t v163 = v17;
              uint64_t v164 = &protocol witness table for Table;
              uint64_t v142 = sub_86280();
              sub_8662C((uint64_t)v142, v136);
              *(void *)(v135 + swift_unknownObjectWeakDestroy(v0 + 16) = v140 + 1;
              sub_861FC(v135 + 40 * v140);
              sub_8643C(v136);

              sub_8643C(v119);
              sub_8643C(v161);
              goto LABEL_56;
            }
          }

          uint64_t v81 = 0LL;
          uint64_t v83 = 0xE000000000000000LL;
          goto LABEL_34;
        }
      }

      sub_44E28();
      unint64_t v79 = sub_867D0();
      goto LABEL_33;
    }

    if (AFSiriLogContextConnection)
    {
      uint64_t v54 = sub_21444((uint64_t)AFSiriLogContextConnection);
      static os_log_type_t.debug.getter(v54);
      id v55 = v4;
      uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
      if (sub_860A4(v56))
      {
        uint64_t v57 = sub_A1D0(12LL);
        uint64_t v58 = sub_A1D0(32LL);
        uint64_t v157 = v36;
        sub_868A8(v58);
        uint64_t v165 = sub_860D4(4.8149e-34);
        uint64_t v59 = sub_9E24(&qword_E4CE8);
        uint64_t v60 = sub_2155C(v59);
        uint64_t v165 = sub_863A8(v60, v61);
        sub_DDB4((uint64_t)&v165, (uint64_t)v166);

        sub_A49C();
        sub_85FC0(&dword_0, v56, v62, "#aceshim %s missing second team");
        sub_85F4C();
        sub_A15C((uint64_t)v36);
        sub_A15C(v57);
      }

      else
      {
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v16, v159);
LABEL_56:
      sub_A174();
      return;
    }
  }

  else
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v45 = Logger.init(_:)(AFSiriLogContextConnection);
      static os_log_type_t.debug.getter(v45);
      id v46 = v4;
      uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      if (sub_860A4(v47))
      {
        uint64_t v48 = sub_A1D0(12LL);
        uint64_t v49 = sub_A1D0(32LL);
        sub_868A8(v49);
        uint64_t v165 = sub_860D4(4.8149e-34);
        uint64_t v50 = sub_9E24(&qword_E4CE8);
        uint64_t v51 = sub_2155C(v50);
        uint64_t v165 = sub_863A8(v51, v52);
        sub_DDB4((uint64_t)&v165, (uint64_t)v166);

        sub_A49C();
        sub_85FC0(&dword_0, v47, v53, "#aceshim %s missing first team");
        sub_85F4C();
        sub_A15C(v2);
        sub_A15C(v48);
      }

      else
      {
      }

      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v13, v159);
      goto LABEL_56;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_7EFE8()
{
  uint64_t v126 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = sub_A5F0();
  sub_1B110();
  __chkstk_darwin(v8);
  sub_6CD10();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v117 - v10;
  uint64_t v12 = type metadata accessor for Table(0LL);
  uint64_t v123 = *(void *)(v12 - 8);
  sub_A13C();
  __chkstk_darwin(v13);
  sub_A148();
  uint64_t v122 = v14;
  sub_A168();
  uint64_t v16 = __chkstk_darwin(v15);
  sub_868D8(v16, v17, v18, v19, v20, v21, v22, v23, v117);
  sub_9E24(&qword_E0F80);
  sub_33C54();
  __chkstk_darwin(v24);
  sub_1B3BC();
  id v26 = sub_8645C(v25, "siriui_firstEntity");
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = sub_8645C((uint64_t)v26, "siriui_secondEntity");
    uint64_t v125 = v28;
    if (v28)
    {
      uint64_t v120 = v0;
      id v29 = (id)SRUIFGetLocale(v28);
      if (v29)
      {
        uint64_t v32 = v29;
        static Locale._unconditionallyBridgeFromObjectiveC(_:)(v29, v30, v31);

        uint64_t v34 = sub_53D10();
        uint64_t v35 = 0LL;
      }

      else
      {
        uint64_t v34 = type metadata accessor for Locale(0LL);
        uint64_t v35 = 1LL;
      }

      sub_3D68C(v1, v35, v33, v34);
      sub_416D4(v1);
      uint64_t v62 = v61;
      sub_A068(v1, &qword_E0F80);
      Class isa = sub_866BC().super.isa;
      id v64 = objc_msgSend(v6, "siritv_additionalLineTotals:", isa);

      uint64_t v65 = sub_8691C();
      uint64_t v66 = sub_8648C(v65);

      sub_8687C(v67, (SEL *)&selRef_sport);
      if (v69) {
        uint64_t v70 = v68;
      }
      else {
        uint64_t v70 = 0LL;
      }
      if (v69) {
        uint64_t v71 = v69;
      }
      else {
        uint64_t v71 = 0xE000000000000000LL;
      }
      uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
      BOOL v74 = v70 == v73 && v71 == v72;
      uint64_t v121 = v27;
      unint64_t v118 = v70;
      uint64_t v119 = v12;
      uint64_t v117 = v66;
      if (v74)
      {
        sub_A3C8();
      }

      else
      {
        char v75 = sub_1AF00(v70, v71, v73);
        sub_A470();
        if ((v75 & 1) == 0)
        {
          uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeSoccerValue);
          if (v70 == v76 && v71 == v77)
          {
            uint64_t v80 = v62;
            sub_A3C8();
          }

          else
          {
            char v79 = sub_1AF00(v70, v71, v76);
            sub_A470();
            uint64_t v80 = v62;
            if ((v79 & 1) == 0)
            {
              sub_44E28();
              sub_86924();
              sub_33D4C();
LABEL_33:
              uint64_t v83 = sub_6F190(v81, v82);
              uint64_t v85 = v84;
LABEL_34:
              uint64_t v86 = (uint64_t)v6;
              uint64_t v87 = sub_415E4();
              if (v88) {
                uint64_t v89 = v87;
              }
              else {
                uint64_t v89 = 0LL;
              }
              if (v88) {
                uint64_t v90 = v88;
              }
              else {
                uint64_t v90 = 0xE000000000000000LL;
              }
              sub_415F0();
              sub_864BC();
              if (v74) {
                uint64_t v92 = 0xE000000000000000LL;
              }
              else {
                uint64_t v92 = v91;
              }
              id v93 = objc_allocWithZone((Class)v2);
              id v94 = sub_4125C(v83, v85, v89, v90, v86, v92);
              uint64_t v95 = v121;
              sub_7BD0C(v121);
              uint64_t v97 = v96;
              unint64_t v99 = v98;
              sub_7BD0C(v125);
              uint64_t v100 = v124;
              sub_7FABC(v80, (uint64_t)v94, v117, v97, v99, v101, v102, v118, v124, v71, 0, v126);
              sub_3CEA0();
              sub_1B0A8();
              sub_A3C8();
              sub_3CBD0();
              sub_A1C8();
              uint64_t v104 = v122;
              uint64_t v103 = v123;
              unint64_t v105 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v123 + 16);
              uint64_t v106 = v119;
              uint64_t v107 = v105(v122, v100, v119);
              sub_861DC(v107, v108, v109, (uint64_t)&_swiftEmptyArrayStorage);
              uint64_t v111 = v110;
              unint64_t v113 = *(void *)(v110 + 16);
              unint64_t v112 = *(void *)(v110 + 24);
              if (v113 >= v112 >> 1)
              {
                sub_7C198(v112 > 1, v113 + 1);
                uint64_t v111 = v116;
              }

              uint64_t v128 = v106;
              unint64_t v129 = &protocol witness table for Table;
              uint64_t v114 = sub_A584();
              v105((uint64_t)v114, v104, v106);
              *(void *)(v111 + swift_unknownObjectWeakDestroy(v0 + 16) = v113 + 1;
              sub_9F74(&v127, v111 + 40 * v113 + 32);
              unint64_t v115 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
              v115(v104, v106);

              v115(v100, v106);
LABEL_48:
              sub_A174();
              return;
            }
          }

          uint64_t v83 = 0LL;
          uint64_t v85 = 0xE000000000000000LL;
          goto LABEL_34;
        }
      }

      uint64_t v80 = v62;
      sub_44E28();
      unint64_t v81 = sub_867D0();
      goto LABEL_33;
    }

    uint64_t v126 = v7;
    if (AFSiriLogContextConnection)
    {
      uint64_t v48 = Logger.init(_:)(AFSiriLogContextConnection);
      os_log_type_t v49 = static os_log_type_t.debug.getter(v48);
      id v50 = v0;
      uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
      if (os_log_type_enabled(v51, v49))
      {
        uint64_t v52 = sub_A1D0(12LL);
        uint64_t v121 = v27;
        uint64_t v53 = (uint8_t *)v52;
        uint64_t v54 = sub_A1D0(32LL);
        *(void *)&__int128 v127 = v54;
        *(_DWORD *)uint64_t v53 = 136315138;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v55 = sub_9E24(&qword_E4CE8);
        uint64_t v56 = sub_86700(v55);
        uint64_t v58 = sub_2FD9C(v56, v57);
        uint64_t v59 = sub_2FDF0(v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v59, v60, v53 + 4, v53 + 12);

        sub_A49C();
        sub_A284(&dword_0, v51, v49, "#aceshim %s missing second team", v53);
        sub_A27C(v54);
        sub_A15C(v54);
        sub_A15C((uint64_t)v53);
      }

      else
      {
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v126);
      goto LABEL_48;
    }
  }

  else
  {
    uint64_t v126 = v7;
    if (AFSiriLogContextConnection)
    {
      uint64_t v36 = sub_8690C((uint64_t)AFSiriLogContextConnection);
      os_log_type_t v37 = static os_log_type_t.debug.getter(v36);
      id v38 = v0;
      uint64_t v39 = (os_log_s *)sub_DDD8();
      if (sub_6CDF4(v39))
      {
        uint64_t v40 = (uint8_t *)sub_A1D0(12LL);
        uint64_t v41 = sub_A1D0(32LL);
        *(void *)&__int128 v127 = v41;
        *(_DWORD *)uint64_t v40 = 136315138;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v42 = sub_9E24(&qword_E4CE8);
        uint64_t v43 = sub_86700(v42);
        uint64_t v45 = sub_2FD9C(v43, v44);
        uint64_t v46 = sub_2FDF0(v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v46, v47, v40 + 4, v40 + 12);

        sub_A49C();
        sub_A284(&dword_0, v39, v37, "#aceshim %s missing first team", v40);
        sub_A27C(v41);
        sub_A15C(v41);
        sub_A15C((uint64_t)v40);
      }

      else
      {
      }

      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v126);
      goto LABEL_48;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_7F688()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v5);
  sub_1AEE8();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v6);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = sub_33D30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = sub_33CF8();
  uint64_t v16 = sub_33C8C((uint64_t)v8, v14, v15, v13);
  sub_A3BC(v0, v17, v18, v16);
  uint64_t v24 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  sub_3CE84();
  sub_33C64(v4, v2, (uint64_t)v8, v0, (uint64_t)&v22);
  *((void *)&v23 + 1) = v9;
  uint64_t v24 = &protocol witness table for TextElement;
  uint64_t v19 = sub_A584();
  sub_1B1AC((uint64_t)v19, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  double v20 = sub_6CC84();
  SectionHeaderStandard.init(text1:action:)(&v22, v21, v20);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  sub_A174();
}

uint64_t sub_7F7E0()
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
  if (v3 == v1 && v4 == v0)
  {
    sub_A470();
    return 12LL;
  }

  sub_85F28(v3, v4);
  sub_2D100();
  if ((v2 & 1) != 0) {
    return 12LL;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBasketballValue);
  if (v6 == v1 && v7 == v0)
  {
    sub_A470();
    return 8LL;
  }

  sub_85F28(v6, v7);
  sub_2D100();
  if ((v2 & 1) != 0) {
    return 8LL;
  }
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeFootballValue);
  if (v9 == v1 && v10 == v0) {
    goto LABEL_33;
  }
  sub_85F28(v9, v10);
  sub_2D100();
  if ((v2 & 1) != 0) {
    return 6LL;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeHockeyValue);
  if (v12 == v1 && v13 == v0)
  {
LABEL_33:
    sub_A470();
    return 6LL;
  }

  sub_85F28(v12, v13);
  sub_2D100();
  if ((v2 & 1) == 0)
  {
    if (qword_DEDE0 != -1) {
      swift_once(&qword_DEDE0, sub_84864);
    }
    BOOL v15 = qword_E4CB0 == v1 && *(void *)algn_E4CB8 == v0;
    return 8LL;
  }

  return 6LL;
}

void sub_7F914()
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
  if (v3 == v1 && v4 == v0)
  {
    sub_A470();
  }

  else
  {
    sub_85F28(v3, v4);
    sub_2D100();
    if ((v2 & 1) == 0)
    {
      if (qword_DEDE0 != -1) {
        swift_once(&qword_DEDE0, sub_84864);
      }
      if (qword_E4CB0 != v1 || *(void *)algn_E4CB8 != v0) {
        sub_85F3C(qword_E4CB0, *(uint64_t *)algn_E4CB8);
      }
    }
  }

  sub_ADE8();
}

void sub_7F9CC()
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBaseballValue);
  if (v3 == v1 && v4 == v0) {
    goto LABEL_18;
  }
  sub_85F28(v3, v4);
  sub_2D100();
  if ((v2 & 1) != 0) {
    goto LABEL_19;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsTypeBasketballValue);
  if (v6 == v1 && v7 == v0)
  {
LABEL_18:
    sub_A470();
    goto LABEL_19;
  }

  sub_85F28(v6, v7);
  sub_2D100();
  if ((v2 & 1) == 0)
  {
    if (qword_DEDE0 != -1) {
      swift_once(&qword_DEDE0, sub_84864);
    }
    if (qword_E4CB0 != v1 || *(void *)algn_E4CB8 != v0) {
      sub_85F3C(qword_E4CB0, *(uint64_t *)algn_E4CB8);
    }
  }

uint64_t sub_7FABC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, unsigned __int8 a11, uint64_t a12)
{
  unint64_t v231 = a8;
  unint64_t v206 = a7;
  uint64_t v203 = a6;
  unint64_t v205 = a5;
  uint64_t v202 = a4;
  uint64_t v224 = a2;
  sub_9E24(&qword_E3468);
  sub_33C54();
  __chkstk_darwin(v18);
  double v20 = (char *)&v197 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for TableRow(0LL);
  sub_4EEB0();
  __chkstk_darwin(v22);
  sub_863E8();
  __chkstk_darwin(v23);
  sub_A258();
  uint64_t v232 = sub_865FC(v24);
  uint64_t v230 = *(void *)(v232 - 8);
  sub_A13C();
  __chkstk_darwin(v25);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v26);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v27);
  sub_A258();
  uint64_t v29 = sub_865EC(v28);
  sub_A228(v29, (uint64_t)&v240);
  uint64_t v208 = v30;
  sub_A13C();
  __chkstk_darwin(v31);
  sub_A118();
  uint64_t v33 = sub_A19C(v32);
  uint64_t v34 = type metadata accessor for TableHeader.HeaderCell(v33);
  sub_A228(v34, (uint64_t)v239);
  uint64_t v211 = v35;
  sub_A13C();
  __chkstk_darwin(v36);
  sub_A118();
  sub_A398(v37);
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v38);
  sub_215D0();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v39);
  sub_A118();
  uint64_t v41 = sub_865DC(v40);
  uint64_t v228 = *(void *)(v41 - 8);
  uint64_t v229 = v41;
  sub_A13C();
  __chkstk_darwin(v42);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v43);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v44);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v45);
  sub_A12C();
  __chkstk_darwin(v46);
  sub_A258();
  sub_A398(v47);
  unint64_t v223 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    sub_6CE58();
    uint64_t v48 = sub_1B644();
    sub_3CBD0();
  }

  else
  {
    uint64_t v48 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v49 = v48 + 1;
  if (__OFADD__(v48, 1LL))
  {
    __break(1u);
    goto LABEL_132;
  }

  uint64_t v220 = v14;
  uint64_t v221 = v12;
  uint64_t v222 = v21;
  uint64_t v50 = sub_7F7E0();
  if (__OFSUB__(v50, v49))
  {
LABEL_132:
    __break(1u);
    goto LABEL_133;
  }

  int v233 = a11;
  uint64_t v51 = ((unint64_t)a1 >> 62) & 1;
  if (a1 < 0) {
    LODWORD(v51) = 1;
  }
  uint64_t v21 = (v50 - v49) & ~((v50 - v49) >> 63);
  int v227 = v51;
  if ((_DWORD)v51 != 1)
  {
    uint64_t v52 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    goto LABEL_9;
  }

LABEL_133:
  sub_861A4();
  uint64_t v52 = sub_1B644();
  sub_A4F4();
LABEL_9:
  if (v21 >= v52) {
    uint64_t v53 = v52;
  }
  else {
    uint64_t v53 = v21;
  }
  uint64_t v235 = 0LL;
  uint64_t v236 = 0LL;
  uint64_t v54 = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v219 = v20;
  uint64_t v225 = v52;
  uint64_t v226 = v21;
  if ((_BYTE)v233)
  {
    if (v233 == 1)
    {
      uint64_t v55 = 0LL;
      uint64_t v56 = 0LL;
      uint64_t v236 = &_swiftEmptyArrayStorage;
      char v57 = 1;
    }

    else
    {
      char v57 = 0;
      uint64_t v235 = &_swiftEmptyArrayStorage;
      uint64_t v56 = 1LL;
      uint64_t v55 = &_swiftEmptyArrayStorage;
      uint64_t v54 = 0LL;
    }
  }

  else
  {
    char v57 = 0;
    uint64_t v56 = 0LL;
    uint64_t v235 = &_swiftEmptyArrayStorage;
    uint64_t v236 = &_swiftEmptyArrayStorage;
    uint64_t v55 = &_swiftEmptyArrayStorage;
  }

  BOOL v58 = __OFADD__(v53, v49);
  uint64_t v59 = v53 + v49;
  if (v58)
  {
    __break(1u);
    goto LABEL_135;
  }

  uint64_t v218 = a9;
  BOOL v60 = (_BYTE)v233 == 0;
  uint64_t v61 = v59 + v60;
  if (__OFADD__(v59, v60))
  {
LABEL_135:
    __break(1u);
    goto LABEL_136;
  }

  uint64_t v62 = sub_FAA4(0LL, v61 & ~(v61 >> 63), 0LL, (uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v238 = v62;
  if (__OFADD__(v61, 1LL))
  {
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
    uint64_t v54 = sub_86864(0LL, *(void *)(v54 + 16) + 1LL);
    goto LABEL_105;
  }

  uint64_t v204 = v62;
  uint64_t v63 = sub_FAB8(0LL, (v61 + 1) & ~((v61 + 1) >> 63), 0LL, (uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v237 = v63;
  if ((v56 & 1) == 0)
  {
    uint64_t v64 = sub_86148();
    if (!(_DWORD)v64 || v61 > *(void *)(v54 + 24) >> 1)
    {
      if (*(void *)(v54 + 16) <= v61) {
        uint64_t v65 = v61;
      }
      else {
        uint64_t v65 = *(void *)(v54 + 16);
      }
      uint64_t v54 = sub_F8FC(v64, v65, 0LL, v54);
    }

    uint64_t v236 = (void *)v54;
  }

  if ((v57 & 1) == 0)
  {
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v55);
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || v61 > v55[3] >> 1)
    {
      if (v55[2] <= v61) {
        uint64_t v67 = v61;
      }
      else {
        uint64_t v67 = v55[2];
      }
      uint64_t v55 = (void *)sub_F8FC(isUniquelyReferenced_nonNull_native, v67, 0LL, (uint64_t)v55);
    }

    uint64_t v235 = v55;
  }

  int v68 = v233;
  uint64_t v217 = sub_F8E8(0LL, 2LL, 0LL, (uint64_t)&_swiftEmptyArrayStorage);
  unint64_t v69 = v231;
  sub_866DC();
  sub_7F914();
  sub_866DC();
  sub_7F9CC();
  if (v68) {
    goto LABEL_76;
  }
  uint64_t v70 = v205;
  if (!v205) {
    goto LABEL_47;
  }
  unint64_t v71 = HIBYTE(v205) & 0xF;
  if ((v205 & 0x2000000000000000LL) == 0) {
    unint64_t v71 = v202 & 0xFFFFFFFFFFFFLL;
  }
  if (v71)
  {
    uint64_t v72 = v228;
    if (v54)
    {
      uint64_t v73 = sub_33CF8();
      uint64_t v74 = v199;
      uint64_t v77 = sub_33C8C(v199, v75, v76, v73);
      sub_9E64(v13, 1LL, 1LL, v77);
      sub_33D30();
      sub_86120();
      uint64_t v72 = v198;
      *(void *)(v198 + 24) = v78;
      sub_86738((uint64_t)&protocol witness table for TextElement);
      swift_bridgeObjectRetain(v70);
      sub_86550();
      sub_33C64(v202, v70, v74, v13, v79);
      *(void *)(v72 + 40) = 0LL;
      *(_BYTE *)(v72 + 48) = v69;
      sub_1B1AC( v72,  enum case for TableRow.Content.text(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v228 + 104));
      uint64_t v80 = (uint64_t)v236;
      if ((sub_86148() & 1) == 0) {
        uint64_t v80 = sub_85FA8();
      }
      sub_864D8();
      if (v82) {
        uint64_t v80 = sub_5ADE4(v81 > 1, v72);
      }
      unint64_t v83 = sub_85F80();
      sub_1B1AC(v83, v198, v84);
      uint64_t v236 = (void *)v80;
    }
  }

  else
  {
LABEL_47:
    uint64_t v72 = v228;
    if (v54)
    {
      uint64_t v85 = v197;
      sub_1B1AC( v197,  enum case for TableRow.Content.empty(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v228 + 104));
      uint64_t v86 = (uint64_t)v236;
      if ((sub_86148() & 1) == 0) {
        uint64_t v86 = sub_85FA8();
      }
      unint64_t v88 = *(void *)(v86 + 16);
      unint64_t v87 = *(void *)(v86 + 24);
      if (v88 >= v87 >> 1) {
        uint64_t v86 = sub_5ADE4(v87 > 1, v88 + 1);
      }
      *(void *)(v86 + swift_unknownObjectWeakDestroy(v0 + 16) = v88 + 1;
      uint64_t v89 = v86
      uint64_t v72 = v228;
      sub_1B1AC(v89, v85, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v228 + 32));
      uint64_t v236 = (void *)v86;
    }
  }

  uint64_t v90 = v206;
  if (v206)
  {
    unint64_t v91 = v203 & 0xFFFFFFFFFFFFLL;
    if ((v206 & 0x2000000000000000LL) != 0) {
      unint64_t v91 = HIBYTE(v206) & 0xF;
    }
    uint64_t v92 = v235;
    if (v91)
    {
      if (v235)
      {
        uint64_t v93 = sub_33CF8();
        uint64_t v94 = v199;
        uint64_t v97 = sub_33C8C(v199, v95, v96, v93);
        sub_9E64(v13, 1LL, 1LL, v97);
        sub_33D30();
        sub_86120();
        uint64_t v72 = v200;
        *(void *)(v200 + 24) = v98;
        sub_86738((uint64_t)&protocol witness table for TextElement);
        swift_bridgeObjectRetain(v90);
        sub_86550();
        sub_33C64(v203, v90, v94, v13, v99);
        *(void *)(v72 + 40) = 0LL;
        *(_BYTE *)(v72 + 48) = v69;
        sub_1B1AC( v72,  enum case for TableRow.Content.text(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v228 + 104));
        uint64_t v100 = (uint64_t)v235;
        if ((sub_86148() & 1) == 0) {
          uint64_t v100 = sub_85FA8();
        }
        sub_864D8();
        if (v82) {
          uint64_t v100 = sub_5ADE4(v101 > 1, v72);
        }
        unint64_t v102 = sub_85F80();
        sub_1B1AC(v102, v200, v103);
        uint64_t v235 = (void *)v100;
      }

      goto LABEL_70;
    }
  }

  else
  {
    uint64_t v92 = v235;
  }

  uint64_t v104 = v201;
  if (v92)
  {
    sub_1B1AC( v201,  enum case for TableRow.Content.empty(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 104));
    uint64_t v105 = (uint64_t)v235;
    if ((sub_86148() & 1) == 0) {
      uint64_t v105 = sub_85FA8();
    }
    sub_864D8();
    if (v82) {
      uint64_t v105 = sub_5ADE4(v106 > 1, v72);
    }
    unint64_t v107 = sub_85F80();
    sub_1B1AC(v107, v104, v108);
    uint64_t v235 = (void *)v105;
  }

LABEL_70:
  uint64_t v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 104);
  uint64_t v110 = v207;
  sub_1B1AC(v207, enum case for TableRow.Content.empty(_:), v109);
  uint64_t v111 = sub_866A4((uint64_t)&v236);
  sub_862CC(v111, v112);
  unint64_t v69 = v210;
  sub_863BC(v110);
  uint64_t v113 = v204;
  unint64_t v115 = *(void *)(v204 + 16);
  unint64_t v114 = *(void *)(v204 + 24);
  uint64_t v54 = v115 + 1;
  if (v115 >= v114 >> 1) {
    goto LABEL_149;
  }
  while (1)
  {
    uint64_t v116 = v213;
    *(void *)(v113 + swift_unknownObjectWeakDestroy(v0 + 16) = v54;
    sub_8649C();
    uint64_t v120 = v119;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v118 + 32))( v119 + v117 + *(void *)(v118 + 72) * v115,  v69,  v212);
    uint64_t v238 = v120;
    uint64_t v121 = sub_9E24(&qword_E3470);
    uint64_t v122 = v216;
    uint64_t v123 = v216 + *(int *)(v121 + 48);
    uint64_t v124 = enum case for Table.ColumnSize.auto(_:);
    uint64_t v125 = type metadata accessor for Table.ColumnSize(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 104LL))(v122, v124, v125);
    sub_862CC(v123, enum case for Table.ColumnAlignment.leading(_:));
    uint64_t v126 = *(void (**)(uint64_t, void, uint64_t))(v230 + 104);
    v126(v122, enum case for Table.Column.cell(_:), v232);
    unint64_t v128 = *(void *)(v63 + 16);
    unint64_t v127 = *(void *)(v63 + 24);
    if (v128 >= v127 >> 1) {
      uint64_t v63 = sub_862E8(v127);
    }
    *(void *)(v63 + swift_unknownObjectWeakDestroy(v0 + 16) = v128 + 1;
    unint64_t v69 = (*(unsigned __int8 *)(v230 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v230 + 80);
    uint64_t v129 = *(void *)(v230 + 72);
    unint64_t v130 = v63 + v69 + v129 * v128;
    uint64_t v131 = *(void (**)(unint64_t, uint64_t, uint64_t))(v230 + 32);
    uint64_t v132 = v232;
    v131(v130, v216, v232);
    v126(v116, enum case for Table.Column.spacer(_:), v132);
    unint64_t v134 = *(void *)(v63 + 16);
    unint64_t v133 = *(void *)(v63 + 24);
    if (v134 >= v133 >> 1) {
      uint64_t v63 = sub_862E8(v133);
    }
    *(void *)(v63 + swift_unknownObjectWeakDestroy(v0 + 16) = v134 + 1;
    v131(v63 + v69 + v134 * v129, v116, v232);
    uint64_t v237 = v63;
LABEL_76:
    uint64_t v63 = v225 - v226;
    if (v225 > v226)
    {
      if (v227) {
        goto LABEL_145;
      }
      uint64_t v135 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
      if (v135 >= v63) {
        goto LABEL_82;
      }
      __break(1u);
    }

    if ((v227 & 1) == 0)
    {
      uint64_t v63 = 0LL;
      uint64_t v135 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
LABEL_82:
      sub_861A4();
      uint64_t v56 = 0LL;
      uint64_t v54 = v135;
      goto LABEL_83;
    }

    uint64_t v63 = 0LL;
LABEL_145:
    sub_86104();
    uint64_t result = sub_1B3B4();
    if (result < v63)
    {
      __break(1u);
      return result;
    }

    uint64_t v54 = result;
    sub_861A4();
    uint64_t v135 = sub_1B3B4();
    sub_A4F4();
    uint64_t v56 = 1LL;
LABEL_83:
    if (v135 < v63) {
      goto LABEL_137;
    }
    if (v63 < 0) {
      goto LABEL_138;
    }
    if ((_DWORD)v56)
    {
      sub_86104();
      unint64_t v115 = sub_1B3B4();
      sub_A4F4();
    }

    else
    {
      unint64_t v114 = a1 & 0xFFFFFFFFFFFFF8LL;
      unint64_t v115 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    }

    if (v54 < 0) {
      goto LABEL_140;
    }
    if ((a1 & 0xC000000000000001LL) != 0 && v63 != v54)
    {
      if (v63 >= (unint64_t)v54)
      {
        __break(1u);
        goto LABEL_148;
      }

      sub_8691C();
      Swift::Int v136 = v63;
      do
      {
        unint64_t v69 = v136 + 1;
        _ArrayBuffer._typeCheckSlowPath(_:)(v136);
        Swift::Int v136 = v69;
      }

      while (v54 != v69);
    }

    if ((_DWORD)v56)
    {
      sub_86104();
      uint64_t v137 = sub_865C8();
      unint64_t v115 = _CocoaArrayWrapper.subscript.getter(v137);
      uint64_t v56 = v138;
      uint64_t v63 = v139;
      unint64_t v141 = v140;
      sub_1AE18(a1);
      uint64_t v54 = v141 >> 1;
    }

    else
    {
      unint64_t v115 = a1 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v56 = (a1 & 0xFFFFFFFFFFFFFF8LL) + 32;
    }

    a1 = a12;
    uint64_t v142 = v54 - v63;
    if (v54 == v63) {
      goto LABEL_103;
    }
    if (v54 > v63) {
      break;
    }
LABEL_148:
    __break(1u);
LABEL_149:
    uint64_t v113 = sub_FAA4(v114 > 1, v54, 1LL, v113);
  }

  sub_86064();
  swift_unknownObjectRetain(v115);
  uint64_t v143 = (void **)(v56 + 8 * v63);
  do
  {
    BOOL v144 = *v143++;
    sub_2FD8C(v13);
    uint64_t v56 = v144;
    char v234 = 0;
    sub_86130();
    sub_863DC( v145,  v146,  v147,  v148,  v149,  v150,  v151,  v152,  v197,  v198,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208);
    sub_629D0(v13);

    --v142;
  }

  while (v142);
  swift_unknownObjectRelease(v115);
LABEL_103:
  int v153 = v233;
  swift_unknownObjectRelease(v115);
  if (!v153) {
    goto LABEL_108;
  }
  uint64_t v56 = v215;
  (*(void (**)(uint64_t, void, uint64_t))(v230 + 104))(v215, enum case for Table.Column.spacer(_:), v232);
  uint64_t v54 = v237;
  if ((sub_86148() & 1) == 0) {
    goto LABEL_141;
  }
LABEL_105:
  unint64_t v115 = *(void *)(v54 + 16);
  unint64_t v154 = *(void *)(v54 + 24);
  if (v115 >= v154 >> 1) {
    uint64_t v54 = sub_86864(v154 > 1, v115 + 1);
  }
  *(void *)(v54 + swift_unknownObjectWeakDestroy(v0 + 16) = v115 + 1;
  unint64_t v155 = sub_86044();
  v156(v155, v56, v232);
  uint64_t v237 = v54;
LABEL_108:
  uint64_t v157 = sub_86064();
  sub_9E64(v13, 1LL, 1LL, v157);
  char v234 = 0;
  sub_86130();
  sub_863DC( v224,  v158,  v159,  v160,  v161,  v162,  v163,  v164,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210);
  sub_86834(v165, &qword_E3AD0);
  if (v223)
  {
    if (a3 < 0) {
      uint64_t v168 = a3;
    }
    else {
      uint64_t v168 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_6CE58();
    uint64_t v166 = _CocoaArrayWrapper.endIndex.getter(v168);
    if (v166) {
      goto LABEL_115;
    }
LABEL_121:
    sub_3CBD0();
    if (v236)
    {
      sub_6CC84();
      uint64_t v179 = sub_1B0E4();
      uint64_t v56 = v214;
      TableRow.init(cells:backgrounds:action:)(v179, &_swiftEmptyArrayStorage, v180);
      uint64_t v181 = v217;
      unint64_t v115 = *(void *)(v217 + 16);
      unint64_t v167 = *(void *)(v217 + 24);
      uint64_t v166 = v115 + 1;
      uint64_t v13 = v221;
      a1 = v220;
      if (v115 >= v167 >> 1) {
        goto LABEL_143;
      }
      goto LABEL_123;
    }

    uint64_t v13 = v221;
    a1 = v220;
    uint64_t v181 = v217;
  }

  else
  {
    uint64_t v166 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
    sub_6CE58();
    if (!v166) {
      goto LABEL_121;
    }
LABEL_115:
    if (v166 >= 1)
    {
      uint64_t v169 = 0LL;
      do
      {
        if ((a3 & 0xC000000000000001LL) != 0) {
          id v170 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v169, a3);
        }
        else {
          id v170 = *(id *)(a3 + 8 * v169 + 32);
        }
        uint64_t v171 = v170;
        ++v169;
        sub_9E64(v13, 1LL, 1LL, v157);
        char v234 = 0;
        sub_86130();
        sub_863DC( (uint64_t)v171,  v172,  v173,  v174,  v175,  v176,  v177,  v178,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212);

        sub_A068(v13, &qword_E3AD0);
      }

      while (v166 != v169);
      goto LABEL_121;
    }

    __break(1u);
LABEL_143:
    uint64_t v181 = sub_86858(v167 > 1, v166);
LABEL_123:
    *(void *)(v181 + swift_unknownObjectWeakDestroy(v0 + 16) = v166;
    sub_86568();
    sub_73E94(v182 + v183 * v115, v56, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
  }

  if (v235)
  {
    sub_6CC84();
    uint64_t v184 = sub_3CE84();
    TableRow.init(cells:backgrounds:action:)(v184, &_swiftEmptyArrayStorage, v185);
    unint64_t v187 = *(void *)(v181 + 16);
    unint64_t v186 = *(void *)(v181 + 24);
    if (v187 >= v186 >> 1) {
      uint64_t v181 = sub_86858(v186 > 1, v187 + 1);
    }
    *(void *)(v181 + swift_unknownObjectWeakDestroy(v0 + 16) = v187 + 1;
    sub_86568();
    sub_73E94(v188 + v189 * v187, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
  }

  uint64_t v190 = v237;
  uint64_t v191 = v238;
  swift_bridgeObjectRetain(v237);
  uint64_t v192 = swift_bridgeObjectRetain(v191);
  uint64_t v193 = (uint64_t)v219;
  TableHeader.init(_:)(v192);
  uint64_t v194 = type metadata accessor for TableHeader(0LL);
  sub_3D68C(v193, 0LL, v195, v194);
  Table.init(separatorLines:columns:header:rows:)(0LL, v190, v193, v181);
  sub_A1C8();
  sub_1B0A8();
  sub_A208();
  return sub_A470();
}

void sub_80A00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v22;
  a20 = v23;
  unsigned int v139 = v24;
  uint64_t v137 = v25;
  uint64_t v27 = v26;
  unint64_t v133 = v28;
  unint64_t v134 = v29;
  unint64_t v141 = v30;
  uint64_t v32 = v31;
  uint64_t v147 = v33;
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v34);
  sub_A118();
  uint64_t v138 = v35;
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v36);
  uint64_t v136 = (uint64_t)v127 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9E24(&qword_E0F80);
  sub_33C54();
  __chkstk_darwin(v38);
  sub_A118();
  uint64_t v40 = sub_A19C(v39);
  uint64_t v135 = type metadata accessor for TextElement(v40);
  uint64_t v128 = *(void *)(v135 - 8);
  sub_A13C();
  __chkstk_darwin(v41);
  sub_A118();
  uint64_t v140 = sub_865EC(v42);
  uint64_t v129 = *(void *)(v140 - 8);
  sub_A13C();
  __chkstk_darwin(v43);
  sub_A118();
  uint64_t v45 = sub_865DC(v44);
  uint64_t v145 = *(void *)(v45 - 8);
  uint64_t v146 = v45;
  sub_A13C();
  __chkstk_darwin(v46);
  uint64_t v47 = sub_86404();
  uint64_t v132 = type metadata accessor for TableHeader.HeaderCell(v47);
  uint64_t v131 = *(void *)(v132 - 8);
  sub_A13C();
  __chkstk_darwin(v48);
  sub_A118();
  uint64_t v50 = sub_865FC(v49);
  uint64_t v51 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v53 = (char *)v127 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v54 = type metadata accessor for Table.ColumnSize(0LL);
  uint64_t v55 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  sub_215D0();
  sub_86828(v56, enum case for Table.ColumnSize.auto(_:));
  if ((v27 & 0x100000000LL) == 0)
  {
    uint64_t v57 = (*(uint64_t (**)(_DWORD *, uint64_t))(v55 + 8))(v20, v54);
    *double v20 = v27;
    sub_86828(v57, enum case for Table.ColumnSize.fixed(_:));
  }

  BOOL v58 = &v53[*(int *)(sub_9E24(&qword_E3470) + 48)];
  uint64_t v142 = v55;
  uint64_t v143 = v54;
  uint64_t v59 = *(void (**)(char *, _DWORD *, uint64_t))(v55 + 16);
  BOOL v144 = v20;
  v59(v53, v20, v54);
  BOOL v60 = *(void (**)(char *))(v129 + 104);
  LODWORD(v129) = enum case for Table.ColumnAlignment.center(_:);
  v60(v58);
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v53, enum case for Table.Column.cell(_:), v50);
  sub_1A0F0();
  uint64_t v61 = *(void *)(*v32 + 16);
  sub_294C4(v61);
  uint64_t v62 = *v32;
  *(void *)(v62 + swift_unknownObjectWeakDestroy(v0 + 16) = v61 + 1;
  uint64_t v63 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v51 + 32))( v62 + ((*(unsigned __int8 *)(v51 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))
        + *(void *)(v51 + 72) * v61,
          v53,
          v50);
  uint64_t *v32 = v62;
  uint64_t v64 = *(void *)(v147 + OBJC_IVAR____TtC6SiriTV9LineScore_period);
  unint64_t v65 = *(void *)(v147 + OBJC_IVAR____TtC6SiriTV9LineScore_period + 8);
  uint64_t v66 = HIBYTE(v65) & 0xF;
  if ((v65 & 0x2000000000000000LL) == 0) {
    uint64_t v66 = v64 & 0xFFFFFFFFFFFFLL;
  }
  if (v66)
  {
    v127[0] = v60;
    v148[0] = v64;
    v148[1] = v65;
    sub_53D10();
    uint64_t v67 = v127[1];
    uint64_t v68 = sub_1B404();
    sub_A5C8(v68, v69, v70);
    sub_53CB8(v67, 0LL);
    unint64_t v71 = sub_9FC4();
    swift_bridgeObjectRetain(v65);
    uint64_t v72 = StringProtocol.uppercased(with:)(v67, &type metadata for String, v71);
    uint64_t v74 = v73;
    sub_86300(v72, &qword_E0F80);
    sub_A418();
    uint64_t v75 = sub_33CF8();
    uint64_t v76 = v136;
    sub_A3BC(v136, v77, v78, v75);
    uint64_t v79 = v138;
    sub_9F98(v137, v138, &qword_E3AD0);
    uint64_t v80 = v134;
    if (qword_DEDD8 != -1) {
      swift_once(&qword_DEDD8, sub_8481C);
    }
    uint64_t v81 = sub_A5F8();
    uint64_t v82 = sub_9E0C(v81, (uint64_t)qword_E4C98);
    v148[3] = v81;
    v148[4] = &protocol witness table for Color;
    unint64_t v83 = sub_A584();
    sub_A5C8((uint64_t)v83, v82, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 16LL));
    uint64_t v84 = v127[2];
    sub_86018(v72, v74, v76, v79, (uint64_t)v148, 2LL, v139);
    uint64_t v85 = v135;
    *(void *)(v21 + 24) = v135;
    uint64_t v86 = sub_86380((uint64_t)&protocol witness table for TextElement);
    uint64_t v87 = v128;
    uint64_t v88 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v128 + 16))(v86, v84, v85);
    *(void *)(v21 + 40) = 0LL;
    *(_BYTE *)(v21 + 48) = 1;
    sub_864F8(v88, enum case for TableRow.Content.text(_:));
    sub_866A4((uint64_t)&a16);
    sub_A4CC((uint64_t)&a11);
    uint64_t v89 = v130;
    sub_863BC(v21);
    uint64_t v90 = v133;
    sub_1A0E4();
    sub_86520();
    uint64_t v91 = *v90;
    *(void *)(*v90 + swift_unknownObjectWeakDestroy(v0 + 16) = 2LL;
    unint64_t v92 = sub_86044();
    v93(v92, v89, v132);
    *uint64_t v90 = v91;
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v84, v85);
  }

  else
  {
    sub_864F8(v63, enum case for TableRow.Content.empty(_:));
    uint64_t v94 = sub_866A4((uint64_t)&a16);
    v60((char *)v94);
    uint64_t v95 = v130;
    sub_863BC(v21);
    uint64_t v90 = v133;
    sub_1A0E4();
    sub_86520();
    uint64_t v91 = *v90;
    *(void *)(*v90 + swift_unknownObjectWeakDestroy(v0 + 16) = v61 + 1;
    unint64_t v96 = sub_86044();
    v97(v96, v95, v132);
    *uint64_t v90 = v91;
    uint64_t v80 = v134;
  }

  sub_86234();
  uint64_t v98 = v142;
  uint64_t v99 = *v141;
  uint64_t v101 = v143;
  uint64_t v100 = v144;
  if (v102)
  {
    if (!v99) {
      goto LABEL_16;
    }
    uint64_t v103 = sub_33CF8();
    uint64_t v104 = v136;
    uint64_t v107 = sub_A3BC(v136, v105, v106, v103);
    sub_866E8(v107, v108, &qword_E3AD0);
    sub_865B0();
    sub_86380((uint64_t)&protocol witness table for TextElement);
    sub_3CE84();
    uint64_t v109 = v104;
    uint64_t v110 = v101;
    uint64_t v98 = v142;
    uint64_t v101 = v143;
    sub_86018(v91, (uint64_t)v90, v109, v110, (uint64_t)v148, 2LL, v139);
    *(void *)(v21 + 40) = 0LL;
    *(_BYTE *)(v21 + 48) = 1;
    uint64_t v111 = (unsigned int *)&enum case for TableRow.Content.text(_:);
  }

  else
  {
    if (!v99) {
      goto LABEL_16;
    }
    uint64_t v111 = (unsigned int *)&enum case for TableRow.Content.empty(_:);
  }

  sub_86338(v111);
  uint64_t v90 = v141;
  sub_1A0D8();
  sub_8683C(*v90);
  uint64_t v112 = *v90;
  *(void *)(*v90 + swift_unknownObjectWeakDestroy(v0 + 16) = v91 + 1;
  sub_8649C();
  sub_8625C(v112 + v113);
  *uint64_t v90 = v112;
  uint64_t v100 = v144;
LABEL_16:
  sub_86234();
  uint64_t v114 = *v80;
  if (v115)
  {
    if (v114)
    {
      uint64_t v116 = sub_33CF8();
      uint64_t v117 = v136;
      uint64_t v120 = sub_A3BC(v136, v118, v119, v116);
      sub_866E8(v120, v121, &qword_E3AD0);
      sub_865B0();
      sub_86380((uint64_t)&protocol witness table for TextElement);
      sub_3CE84();
      uint64_t v122 = v117;
      uint64_t v123 = v101;
      uint64_t v98 = v142;
      uint64_t v101 = v143;
      sub_86018(v91, (uint64_t)v90, v122, v123, (uint64_t)v148, 2LL, v139);
      *(void *)(v21 + 40) = 0LL;
      *(_BYTE *)(v21 + 48) = 1;
      uint64_t v100 = v144;
      uint64_t v124 = (unsigned int *)&enum case for TableRow.Content.text(_:);
LABEL_21:
      sub_86338(v124);
      sub_1A0D8();
      sub_8683C(*v80);
      uint64_t v125 = *v80;
      *(void *)(*v80 + swift_unknownObjectWeakDestroy(v0 + 16) = v91 + 1;
      sub_8649C();
      sub_8625C(v125 + v126);
      *uint64_t v80 = v125;
    }
  }

  else if (v114)
  {
    uint64_t v124 = (unsigned int *)&enum case for TableRow.Content.empty(_:);
    goto LABEL_21;
  }

  (*(void (**)(_DWORD *, uint64_t))(v98 + 8))(v100, v101);
  sub_A174();
}

uint64_t sub_81188(void *a1)
{
  if (v1)
  {
    sub_2AF38();
    if (v4)
    {
      v16[3] = &type metadata for String;
      v16[4] = &protocol witness table for String;
      v16[0] = v2;
      v16[1] = v3;
      uint64_t v15 = 0LL;
      memset(v14, 0, sizeof(v14));
      uint64_t v13 = 0LL;
      memset(v12, 0, sizeof(v12));
      uint64_t v11 = 0LL;
      memset(v10, 0, sizeof(v10));
      PrimaryHeaderStandard.init(text1:text2:text3:action:)(v16, v14, v12, v10);
    }

    else
    {
      swift_bridgeObjectRelease(v3);
    }
  }

  type metadata accessor for PrimaryHeaderStandard(0LL);
  uint64_t v5 = sub_86770();
  return sub_9E64(v5, v6, v7, v8);
}

void sub_81230()
{
  uint64_t v5 = v4;
  uint64_t v158 = v6;
  sub_9E24(&qword_E4D20);
  sub_33C54();
  __chkstk_darwin(v7);
  sub_A118();
  uint64_t v151 = v8;
  uint64_t v9 = sub_A5F0();
  uint64_t v156 = *(void *)(v9 - 8);
  uint64_t v157 = v9;
  sub_A13C();
  __chkstk_darwin(v10);
  uint64_t v148 = (char *)&v144 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A168();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v144 - v14;
  __chkstk_darwin(v13);
  sub_860BC();
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v144 - v18;
  __chkstk_darwin(v17);
  sub_A1EC();
  uint64_t v155 = v20;
  sub_A168();
  __chkstk_darwin(v21);
  sub_A1EC();
  uint64_t v154 = v22;
  sub_A168();
  __chkstk_darwin(v23);
  sub_A1EC();
  uint64_t v153 = v24;
  sub_A168();
  __chkstk_darwin(v25);
  uint64_t v149 = (char *)&v144 - v26;
  sub_9E24(&qword_E4D28);
  sub_33C54();
  __chkstk_darwin(v27);
  sub_A148();
  uint64_t v152 = v28;
  sub_A168();
  __chkstk_darwin(v29);
  sub_A1EC();
  uint64_t v150 = v30;
  sub_A168();
  __chkstk_darwin(v31);
  sub_7C084();
  sub_9E24(&qword_E4D30);
  sub_33C54();
  __chkstk_darwin(v32);
  sub_1B028();
  uint64_t v33 = sub_86914();
  sub_4EEB0();
  __chkstk_darwin(v34);
  uint64_t v36 = (char *)&v144 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_81BBC(v5, v3);
  sub_A2E0(v3, 1LL, v33);
  if (v37)
  {
    sub_A068(v3, &qword_E4D30);
    if (AFSiriLogContextConnection)
    {
      uint64_t v38 = Logger.init(_:)(AFSiriLogContextConnection);
      uint64_t v39 = static os_log_type_t.error.getter(v38);
      uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
      BOOL v41 = sub_85FD0(v40);
      uint64_t v42 = v156;
      if (v41)
      {
        uint64_t v43 = (_WORD *)sub_A1D0(2LL);
        sub_48FA4(v43);
        sub_48F84(&dword_0, v44, v45, "#aceshim live tune in button is missing for fallback");
        sub_A15C(v39);
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v157);
      uint64_t v46 = (_OWORD *)v158;
      *(void *)(v158 + 32) = 0LL;
      *uint64_t v46 = 0u;
      v46[1] = 0u;
      goto LABEL_26;
    }

    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }

  uint64_t v145 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
  uint64_t v146 = v33;
  sub_860CC((uint64_t)v36, v3, v145);
  uint64_t v47 = type metadata accessor for CustomCanvas(0LL);
  uint64_t v147 = v2;
  uint64_t v48 = sub_33D84(v2, 1LL);
  id v49 = sub_2780C(v48, "getAppsCommand");
  if (!v49
    || (id v50 = v49,
        uint64_t v51 = objc_opt_self(&OBJC_CLASS___SABaseCommand),
        uint64_t v52 = sub_86718(v51),
        uint64_t v53 = swift_unknownObjectRelease(v50),
        !v52))
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v82 = sub_216EC((uint64_t)AFSiriLogContextConnection);
      uint64_t v83 = static os_log_type_t.error.getter(v82);
      uint64_t v84 = (os_log_s *)sub_1B2C4(v83);
      BOOL v85 = sub_85FD0(v84);
      uint64_t v86 = v147;
      if (v85)
      {
        uint64_t v87 = (_WORD *)sub_A1D0(2LL);
        sub_48FA4(v87);
        sub_48F84(&dword_0, v88, v89, "#aceshim invalid matchup get apps command");
        sub_A15C(v83);
      }

      (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v0, v157);
      goto LABEL_24;
    }

    goto LABEL_53;
  }

  sub_86850(v53, (SEL *)&selRef_siritvui_canonicalIdentifier);
  if (!v55)
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v92 = Logger.init(_:)(AFSiriLogContextConnection);
      uint64_t v93 = static os_log_type_t.debug.getter(v92);
      uint64_t v94 = (os_log_s *)Logger.logObject.getter(v93);
      os_log_type_t v95 = v93;
      BOOL v96 = os_log_type_enabled(v94, (os_log_type_t)v93);
      uint64_t v86 = v147;
      if (v96)
      {
        uint64_t v97 = (uint8_t *)sub_A1D0(2LL);
        *(_WORD *)uint64_t v97 = 0;
        sub_DD8C(&dword_0, v94, v95, "#aceshim matchup is missing canonical identifier", v97);
        sub_A15C((uint64_t)v97);
      }

      (*(void (**)(char *, uint64_t))(v156 + 8))(v19, v157);
      goto LABEL_24;
    }

    goto LABEL_54;
  }

  uint64_t v56 = v54;
  uint64_t v57 = v55;
  id v58 = sub_2780C(v54, "isAvailable");
  if (!(_DWORD)v58)
  {
    sub_A3C8();
    if (AFSiriLogContextConnection)
    {
      uint64_t v98 = sub_861B8((uint64_t)AFSiriLogContextConnection);
      uint64_t v99 = static os_log_type_t.debug.getter(v98);
      uint64_t v100 = (os_log_s *)sub_860B0(v99);
      BOOL v101 = sub_85FD0(v100);
      uint64_t v102 = v147;
      if (v101)
      {
        uint64_t v103 = (_WORD *)sub_A1D0(2LL);
        sub_48FA4(v103);
        uint64_t v106 = "#aceshim matchup is not available to watch";
LABEL_41:
        sub_48F84(&dword_0, v104, v105, v106);
        sub_A15C((uint64_t)v19);
      }

LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }

  id v61 = sub_2780C((uint64_t)v60, "dictionary");
  if (!v61)
  {
    if (AFSiriLogContextConnection)
    {
      id v120 = AFSiriLogContextConnection;
      uint64_t v121 = v149;
      uint64_t v122 = sub_861B8((uint64_t)v120);
      uint64_t v123 = static os_log_type_t.error.getter(v122);
      uint64_t v124 = (os_log_s *)sub_860B0(v123);
      BOOL v125 = sub_85FD0(v124);
      uint64_t v126 = v156;
      if (v125)
      {
        unint64_t v127 = (_WORD *)sub_A1D0(2LL);
        sub_48FA4(v127);
        sub_48F84(&dword_0, v128, v129, "#aceshim matchup is missing dictionary");
        sub_A15C((uint64_t)v19);
      }

      uint64_t v131 = v157;
      uint64_t v130 = (void *)v158;
      goto LABEL_51;
    }

    goto LABEL_58;
  }

  uint64_t v62 = v61;
  uint64_t v63 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
  v159[0] = 0LL;
  id v64 = [v63 dataWithPropertyList:v62 format:200 options:0 error:v159];
  unint64_t v65 = (char *)v159[0];
  if (v64)
  {
    uint64_t v66 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v64);
    uint64_t v68 = v67;

    uint64_t v69 = sub_8675C();
    uint64_t v70 = v151;
    static TaskPriority.userInitiated.getter(v69);
    uint64_t v71 = type metadata accessor for TaskPriority(0LL);
    sub_3D68C(v70, 0LL, v72, v71);
    uint64_t v73 = (void *)swift_allocObject(&unk_CCB70, 48LL, 7LL);
    v73[2] = 0LL;
    v73[3] = 0LL;
    v73[4] = v56;
    v73[5] = v57;
    uint64_t v74 = sub_855BC(v70, (uint64_t)&unk_E4D40, (uint64_t)v73);
    uint64_t v75 = swift_release(v74);
    sub_A410(v75, &qword_E4D20);
    uint64_t v76 = v147;
    if (qword_DEDC8 != -1) {
      swift_once(&qword_DEDC8, sub_847CC);
    }
    uint64_t v77 = qword_E4C78;
    uint64_t v78 = unk_E4C80;
    sub_8675C();
    swift_bridgeObjectRetain(v78);
    BYTE2(v143) = 0;
    LOWORD(v143) = 0;
    uint64_t v79 = v150;
    CustomCanvas.init(bundleName:viewId:viewData:componentName:safeForLogging:requestsKeyWindow:hideConversationKeyline:)( v77,  v78,  0xD000000000000013LL,  0x80000000000A5B10LL,  v66,  v68,  0LL,  0xE000000000000000LL,  v143);
    sub_A068(v76, &qword_E4D28);
    sub_33D84(v79, 0LL);
    sub_A03C(v79, v76, &qword_E4D28);
    uint64_t v80 = v152;
    sub_9F98(v76, v152, &qword_E4D28);
    sub_A2E0(v80, 1LL, v47);
    if (v37)
    {
      sub_861AC();
      sub_861AC();
      sub_A26C(v76);
      sub_86540();
      sub_A26C(v80);
      uint64_t v81 = v158;
      *(_OWORD *)uint64_t v158 = 0u;
      *(_OWORD *)(v81 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
      *(void *)(v81 + 32) = 0LL;
    }

    else
    {
      unint64_t v141 = (void *)v158;
      *(void *)(v158 + 24) = v47;
      v141[4] = &protocol witness table for CustomCanvas;
      uint64_t v142 = sub_9F38(v141);
      sub_860CC((uint64_t)v142, v80, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 32LL));
      sub_861AC();
      sub_861AC();
      sub_A068(v76, &qword_E4D28);
      sub_86540();
    }

    goto LABEL_26;
  }

  uint64_t v36 = v65;
  uint64_t v132 = _convertNSErrorToError(_:)(v65);

  swift_willThrow();
  if (AFSiriLogContextConnection)
  {
    id v133 = AFSiriLogContextConnection;
    uint64_t v121 = v148;
    uint64_t v134 = sub_861B8((uint64_t)v133);
    uint64_t v135 = static os_log_type_t.error.getter(v134);
    uint64_t v136 = (os_log_s *)sub_860B0(v135);
    if (sub_85FD0(v136))
    {
      uint64_t v137 = (_WORD *)sub_A1D0(2LL);
      sub_48FA4(v137);
      sub_48F84(&dword_0, v138, v139, "#aceshim unable to serialize matchup");
      sub_A15C(v132);
    }

    swift_errorRelease(v132);
    uint64_t v131 = v157;
    uint64_t v130 = (void *)v158;
    uint64_t v126 = v156;
LABEL_51:

    (*(void (**)(char *, uint64_t))(v126 + 8))(v121, v131);
    sub_A3C8();
    v130[3] = v146;
    v130[4] = &protocol witness table for SimpleItemRich;
    uint64_t v140 = sub_9F38(v130);
    sub_861C0((uint64_t)v140);
    uint64_t v91 = v147;
    goto LABEL_25;
  }

LABEL_59:
  __break(1u);
}

void sub_81BBC(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = sub_A5F0();
  sub_1B110();
  __chkstk_darwin(v7);
  sub_860BC();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - v10;
  id v12 = sub_2780C(v9, "isOnNow");
  if ((_DWORD)v12)
  {
    id v13 = sub_2780C((uint64_t)v12, "liveTuneInButton");
    if (v13)
    {
      id v28 = v13;
      sub_81D8C();

      return;
    }

    if (AFSiriLogContextConnection)
    {
      uint64_t v19 = sub_861B8((uint64_t)AFSiriLogContextConnection);
      uint64_t v20 = static os_log_type_t.debug.getter(v19);
      os_log_type_t v21 = v20;
      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v20);
      if (sub_6CDF4(v22))
      {
        uint64_t v23 = (_WORD *)sub_A1D0(2LL);
        sub_1B594(v23);
        sub_DD8C(&dword_0, v22, v21, "#aceshim matchup is missing live tune in button", a1);
        sub_A15C((uint64_t)a1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v6);
LABEL_12:
      uint64_t v24 = sub_86914();
      sub_A3BC(a2, v25, v26, v24);
      sub_1AEA4();
      return;
    }
  }

  else
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v14 = sub_216EC((uint64_t)AFSiriLogContextConnection);
      uint64_t v15 = static os_log_type_t.debug.getter(v14);
      os_log_type_t v16 = v15;
      uint64_t v17 = (os_log_s *)sub_1B2C4(v15);
      if (sub_21568(v17))
      {
        uint64_t v18 = (_WORD *)sub_A1D0(2LL);
        sub_1B594(v18);
        sub_DD8C(&dword_0, v17, v16, "#aceshim matchup is not live", a1);
        sub_A15C((uint64_t)a1);
      }

      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v6);
      goto LABEL_12;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_81D8C()
{
  uint64_t v61 = v0;
  uint64_t v5 = v4;
  uint64_t v64 = v6;
  uint64_t v7 = sub_A5F0();
  uint64_t v62 = *(void *)(v7 - 8);
  uint64_t v63 = v7;
  sub_A13C();
  __chkstk_darwin(v8);
  sub_48FB8();
  __chkstk_darwin(v9);
  sub_860BC();
  __chkstk_darwin(v10);
  sub_A258();
  uint64_t v58 = v11;
  uint64_t v12 = sub_A274();
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v60 = v12;
  sub_A13C();
  __chkstk_darwin(v13);
  sub_1B3BC();
  sub_9E24(&qword_DF5C0);
  sub_33C54();
  __chkstk_darwin(v14);
  os_log_type_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_7C1F4();
  uint64_t v18 = *(void *)(v17 - 8);
  sub_A13C();
  __chkstk_darwin(v19);
  sub_A118();
  uint64_t v21 = v20;
  char v22 = sub_305EC();
  if ((v22 - 1) > 1u)
  {
    if (AFSiriLogContextConnection)
    {
      char v31 = v22;
      uint64_t v32 = sub_861B8((uint64_t)AFSiriLogContextConnection);
      uint64_t v33 = static os_log_type_t.debug.getter(v32);
      uint64_t v29 = (os_log_s *)sub_860B0(v33);
      os_log_type_t v34 = v21;
      if (sub_6CDF4(v29))
      {
        uint64_t v35 = (uint8_t *)sub_A1D0(12LL);
        uint64_t v36 = sub_A1D0(32LL);
        *(_DWORD *)uint64_t v35 = 136315138;
        v80[0] = v36;
        if (v31) {
          uint64_t v37 = 1868983881LL;
        }
        else {
          uint64_t v37 = 0x6E776F6E6B6E55LL;
        }
        if (v31) {
          unint64_t v38 = 0xE400000000000000LL;
        }
        else {
          unint64_t v38 = 0xE700000000000000LL;
        }
        v79[0] = sub_CC88(v37, v38, v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v79, &v79[1], v35 + 4, v35 + 12);
        sub_A4F4();
        sub_A284(&dword_0, v29, v34, "#aceshim unsupported button type %s", v35);
        uint64_t v39 = 1LL;
        sub_A27C(v36);
        sub_A15C(v36);
        sub_A15C((uint64_t)v35);

        sub_866B0(v62);
        goto LABEL_23;
      }

      goto LABEL_17;
    }

    __break(1u);
    goto LABEL_33;
  }

  uint64_t v23 = sub_9ED8(v5);
  if (!v23)
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v40 = sub_216EC((uint64_t)AFSiriLogContextConnection);
      uint64_t v41 = static os_log_type_t.error.getter(v40);
      uint64_t v42 = (os_log_s *)sub_1B2C4(v41);
      if (sub_86098(v42))
      {
        uint64_t v43 = (uint8_t *)sub_A1D0(2LL);
        *(_WORD *)uint64_t v43 = 0;
        sub_DD8C(&dword_0, v42, (os_log_type_t)v41, "#aceshim liveTuneInButton is missing a command", v43);
        sub_A15C((uint64_t)v43);
      }

      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v1, v63);
      goto LABEL_22;
    }

void sub_82280(void *a1)
{
  if (v7) {
    uint64_t v4 = 0xE000000000000000LL;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusInProgressValue);
  BOOL v7 = v5 == v1 && v6 == v4;
  if (v7)
  {
    sub_A470();
    goto LABEL_31;
  }

  sub_85F28(v5, v6);
  sub_2D100();
  if ((v2 & 1) != 0)
  {
LABEL_31:
    sub_A470();
    if (qword_DEDA0 != -1) {
      swift_once(&qword_DEDA0, sub_846F0);
    }
    uint64_t v23 = &qword_E4C28;
    goto LABEL_50;
  }

  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusCompletedValue);
  if (v8 == v1 && v9 == v4)
  {
    sub_A470();
    goto LABEL_35;
  }

  sub_85F28(v8, v9);
  sub_2D100();
  if ((v2 & 1) != 0)
  {
LABEL_35:
    sub_A470();
    if (qword_DEDA8 != -1) {
      swift_once(&qword_DEDA8, sub_84718);
    }
    uint64_t v23 = &qword_E4C38;
    goto LABEL_50;
  }

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusCanceledValue);
  if (v11 == v1 && v12 == v4)
  {
    sub_A470();
    goto LABEL_39;
  }

  sub_85F28(v11, v12);
  sub_2D100();
  if ((v2 & 1) != 0)
  {
LABEL_39:
    sub_A470();
    if (qword_DEDB0 != -1) {
      swift_once(&qword_DEDB0, sub_84740);
    }
    uint64_t v23 = &qword_E4C48;
    goto LABEL_50;
  }

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusPostponedValue);
  if (v14 == v1 && v15 == v4)
  {
    sub_A470();
    goto LABEL_43;
  }

  sub_85F28(v14, v15);
  sub_2D100();
  if ((v2 & 1) != 0)
  {
LABEL_43:
    sub_A470();
    if (qword_DEDB8 != -1) {
      swift_once(&qword_DEDB8, sub_84770);
    }
    uint64_t v23 = &qword_E4C58;
    goto LABEL_50;
  }

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusDelayedValue);
  if (v17 == v1 && v18 == v4)
  {
    sub_1AE18(v4);
  }

  else
  {
    char v20 = sub_85F28(v17, v18);
    sub_A470();
    sub_1B0A8();
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = 0LL;
      unint64_t v22 = 0xE000000000000000LL;
      goto LABEL_51;
    }
  }

  if (qword_DEDC0 != -1) {
    swift_once(&qword_DEDC0, sub_847A0);
  }
  uint64_t v23 = &qword_E4C68;
LABEL_50:
  uint64_t v21 = *v23;
  unint64_t v22 = v23[1];
  sub_1B0E4();
LABEL_51:
  uint64_t v24 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000LL) == 0) {
    uint64_t v24 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    sub_44E28();
    uint64_t v25 = sub_865C8();
    sub_6F00C(v25, v26);
  }

  sub_A470();
  sub_863D0();
  sub_ADE8();
}

void sub_82504()
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusCompletedValue);
  if (v3 == v1 && v4 == v0)
  {
    sub_A470();
    goto LABEL_23;
  }

  sub_85F28(v3, v4);
  sub_2D100();
  if ((v2 & 1) != 0)
  {
LABEL_23:
    sub_44E28();
    sub_33D4C();
    uint64_t v17 = 0xD000000000000015LL;
    goto LABEL_26;
  }

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusCanceledValue);
  if (v6 == v1 && v7 == v0)
  {
    sub_A470();
  }

  else
  {
    sub_85F28(v6, v7);
    sub_2D100();
    if ((v2 & 1) == 0)
    {
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusPostponedValue);
      if (v9 == v1 && v10 == v0)
      {
        sub_A470();
      }

      else
      {
        sub_85F28(v9, v10);
        sub_2D100();
        if ((v2 & 1) == 0)
        {
          uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusDelayedValue);
          if (v12 == v1 && v13 == v0)
          {
            sub_A470();
          }

          else
          {
            char v15 = sub_85F28(v12, v13);
            sub_1B0A8();
            if ((v15 & 1) == 0) {
              goto LABEL_27;
            }
          }
        }
      }
    }
  }

  sub_44E28();
  sub_8661C();
  sub_33D4C();
LABEL_26:
  sub_6F190(v17, v16);
LABEL_27:
  sub_ADE8();
}

void sub_8264C()
{
  uint64_t v133 = v4;
  uint64_t v134 = v5;
  id v127 = v0;
  uint64_t v128 = v6;
  uint64_t v8 = v7;
  uint64_t v129 = v9;
  sub_9E24(&qword_E3AD0);
  sub_33C54();
  __chkstk_darwin(v10);
  sub_1B028();
  sub_9E24(&qword_E10E8);
  sub_33C54();
  __chkstk_darwin(v11);
  sub_A118();
  uint64_t v124 = v12;
  uint64_t v13 = sub_A5F0();
  uint64_t v116 = *(void *)(v13 - 8);
  uint64_t v117 = v13;
  sub_A13C();
  __chkstk_darwin(v14);
  sub_A118();
  uint64_t v118 = v15;
  uint64_t v16 = sub_A24C();
  uint64_t v17 = type metadata accessor for Calendar(v16);
  uint64_t v122 = *(void *)(v17 - 8);
  uint64_t v123 = v17;
  sub_A13C();
  __chkstk_darwin(v18);
  uint64_t v121 = (uint64_t)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9E24(&qword_E4D18);
  sub_33C54();
  __chkstk_darwin(v20);
  sub_A344();
  uint64_t v23 = (void *)(v21 - v22);
  __chkstk_darwin(v24);
  sub_860BC();
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v114 - v26;
  uint64_t v28 = type metadata accessor for Date(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v125 = v28;
  uint64_t v126 = v29;
  sub_A13C();
  __chkstk_darwin(v30);
  sub_A148();
  uint64_t v119 = v31;
  sub_A168();
  uint64_t v33 = __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v114 - v34;
  __chkstk_darwin(v33);
  sub_A1EC();
  uint64_t v120 = v36;
  sub_A168();
  __chkstk_darwin(v37);
  sub_7C084();
  sub_85C70(v8, (SEL *)&selRef_status);
  if (v39) {
    uint64_t v40 = v38;
  }
  else {
    uint64_t v40 = 0LL;
  }
  if (v39) {
    unint64_t v41 = v39;
  }
  else {
    unint64_t v41 = 0xE000000000000000LL;
  }
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusInProgressValue);
  BOOL v44 = v40 == v42 && v41 == v43;
  if (v44)
  {
    sub_3CBD0();
    goto LABEL_22;
  }

  uint64_t v115 = v3;
  char v45 = sub_A244(v40, v41, v42, v43);
  sub_A418();
  if ((v45 & 1) != 0)
  {
LABEL_22:
    sub_3CBD0();
    sub_82E64(v8, v129);
    return;
  }

  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusScheduledValue);
  if (v40 == v46 && v41 == v47)
  {
    sub_3CBD0();
    uint64_t v50 = v125;
LABEL_24:
    uint64_t v57 = sub_3CBD0();
    id v58 = sub_ED8C(v57, "timeTBD");
    if (v58)
    {
      uint64_t v23 = v58;
      unsigned __int8 v59 = [v58 BOOLValue];
    }

    else
    {
      unsigned __int8 v59 = 0;
    }

    uint64_t v55 = v129;
    uint64_t v53 = v115;
    uint64_t v56 = v124;
    if (sub_ED8C((uint64_t)v58, "startTime"))
    {
      sub_8660C();

      sub_86254((uint64_t)v27, (uint64_t)v23);
      sub_454E8((uint64_t)v27, 0LL);
      uint64_t v60 = sub_A2E0((uint64_t)v27, 1LL, v50);
      if (!v44)
      {
        sub_86254(v2, (uint64_t)v27);
LABEL_32:
        sub_4F3F0(v121);
        char v62 = ((uint64_t (*)(uint64_t))Calendar.isDateInToday(_:))(v2);
        sub_8632C(v122);
        char v63 = sub_4F7B8(v2);
        if ((v62 & 1) != 0)
        {
          if ((v59 & 1) != 0)
          {
            sub_44E28();
            sub_33D4C();
            sub_6F190(0xD000000000000010LL, v64);
          }

          else
          {
            sub_4F544(v2);
          }
        }

        else
        {
          sub_4F5A4(v2, v63 & 1);
        }

        uint64_t v35 = (char *)v2;
        goto LABEL_38;
      }
    }

    else
    {
      uint64_t v60 = sub_454E8((uint64_t)v27, 1LL);
    }

    uint64_t v61 = static Date.now.getter(v60);
    sub_86834(v61, &qword_E4D18);
    goto LABEL_32;
  }

  char v49 = sub_A244(v40, v41, v46, v47);
  sub_A418();
  uint64_t v50 = v125;
  if ((v49 & 1) != 0) {
    goto LABEL_24;
  }
  if ((sub_41D28() & 1) != 0)
  {
    uint64_t v51 = sub_3CBD0();
    id v52 = sub_ED8C(v51, "startTime");
    uint64_t v53 = v115;
    if (v52)
    {
      sub_8660C();

      sub_86254(v1, (uint64_t)v23);
      sub_454E8(v1, 0LL);
      uint64_t v54 = sub_A2E0(v1, 1LL, v50);
      uint64_t v55 = v129;
      uint64_t v56 = v124;
      if (!v44)
      {
        sub_86254((uint64_t)v35, v1);
LABEL_46:
        char v93 = sub_4F7B8((uint64_t)v35);
        sub_4F61C((uint64_t)v35, v93 & 1, 1);
LABEL_38:
        (*(void (**)(char *, uint64_t))(v126 + 8))(v35, v50);
        uint64_t v65 = sub_33CF8();
        uint64_t v68 = sub_33C8C(v56, v66, v67, v65);
        sub_A3BC(v53, v69, v70, v68);
        sub_865A0();
        uint64_t v71 = sub_863D0();
        sub_33C64(v71, v72, v56, v53, v73);
        uint64_t v74 = sub_33D30();
        uint64_t v75 = v55;
        uint64_t v76 = 0LL;
LABEL_39:
        sub_9E64(v75, v76, 1LL, v74);
        sub_A174();
        return;
      }
    }

    else
    {
      uint64_t v89 = sub_862BC();
      uint64_t v54 = sub_9E64(v89, v90, v91, v50);
      uint64_t v55 = v129;
      uint64_t v56 = v124;
    }

    uint64_t v92 = static Date.now.getter(v54);
    sub_860FC(v92, &qword_E4D18);
    goto LABEL_46;
  }

  sub_82504();
  uint64_t v53 = v115;
  if (v78)
  {
    uint64_t v79 = v77;
    uint64_t v80 = v78;
    uint64_t v81 = sub_3CBD0();
    id v82 = sub_ED8C(v81, "startTime");
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = v120;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      sub_86254((uint64_t)v23, v84);
      sub_454E8((uint64_t)v23, 0LL);
      uint64_t v85 = sub_A490();
      uint64_t v87 = sub_A2E0(v85, v86, v50);
      uint64_t v55 = v129;
      uint64_t v56 = v124;
      uint64_t v88 = v119;
      if (!v44)
      {
        sub_86254(v119, (uint64_t)v23);
LABEL_52:
        char v108 = sub_4F7B8(v88);
        uint64_t v109 = sub_4F61C(v88, v108 & 1, 1);
        uint64_t v111 = v110;
        uint64_t v112 = sub_9E24((uint64_t *)&unk_DF640);
        uint64_t v113 = swift_allocObject(v112, 72LL, 7LL);
        *(_OWORD *)(v113 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
        *(void *)(v113 + 56) = &type metadata for String;
        *(void *)(v113 + 64) = sub_A0DC();
        *(void *)(v113 + 32) = v109;
        *(void *)(v113 + 40) = v111;
        String.init(format:_:)(v79, v80, v113);
        sub_A470();
        uint64_t v35 = (char *)v88;
        uint64_t v50 = v125;
        goto LABEL_38;
      }
    }

    else
    {
      uint64_t v87 = sub_9E64((uint64_t)v23, 1LL, 1LL, v50);
      uint64_t v55 = v129;
      uint64_t v56 = v124;
      uint64_t v88 = v119;
    }

    uint64_t v107 = static Date.now.getter(v87);
    sub_A488(v107, &qword_E4D18);
    goto LABEL_52;
  }

  if (AFSiriLogContextConnection)
  {
    id v94 = AFSiriLogContextConnection;
    uint64_t v95 = v118;
    uint64_t v96 = sub_216EC((uint64_t)v94);
    static os_log_type_t.error.getter(v96);
    id v97 = v127;
    uint64_t v98 = sub_6CE58();
    uint64_t v99 = (void *)sub_1B2C4(v98);
    if (sub_86098((os_log_s *)v99))
    {
      uint64_t v100 = (_DWORD *)sub_A1D0(22LL);
      uint64_t v101 = sub_A1D0(64LL);
      v130[0] = v101;
      *uint64_t v100 = 136315394;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v102 = sub_9E24(&qword_E4CE8);
      uint64_t v103 = String.init<A>(describing:)(&ObjectType, v102);
      uint64_t ObjectType = sub_863A8(v103, v104);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&ObjectType, v132, v100 + 1, v100 + 3);

      sub_A4F4();
      sub_86464();
      sub_6CE58();
      uint64_t ObjectType = sub_CC88(v40, v41, v130);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&ObjectType, v132, v97, (char *)v100 + 22);
      swift_bridgeObjectRelease_n(v41, 3LL);
      sub_46278(&dword_0, v105, v106, "#aceshim %s unexpected status: %s");
      sub_86160();
      sub_A15C(v101);
      sub_A15C((uint64_t)v100);

      (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v118, v117);
    }

    else
    {

      sub_1AE18(v41);
      (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v95, v117);
    }

    uint64_t v74 = sub_33D30();
    uint64_t v75 = v129;
    uint64_t v76 = 1LL;
    goto LABEL_39;
  }

  __break(1u);
}

void sub_82E64(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___SASportsBaseballMatchup);
  uint64_t v9 = swift_dynamicCastObjCClass(a1, v8);
  if (v9)
  {
    uint64_t v10 = v9;
    id v22 = a1;
    sub_82FEC(v10, a2);
  }

  else
  {
    v11.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
    id v12 = sub_866D0((uint64_t)v11.super.isa, "siritv_inProgressStatusDescription:");

    if (v12)
    {
      sub_865D4();
      sub_866F4();
      uint64_t v13 = sub_33CF8();
      uint64_t v16 = sub_33C8C(v3, v14, v15, v13);
      sub_9E64(v2, 1LL, 1LL, v16);
      sub_86644();
      sub_33C64((uint64_t)a1, (uint64_t)v11.super.isa, v3, v2, (uint64_t)v23);
      uint64_t v17 = sub_33D30();
      sub_9E64(a2, 0LL, 1LL, v17);
      sub_10E90();
    }

    else
    {
      sub_33D30();
      uint64_t v18 = sub_86508();
      sub_86034(v18, v19, v20, v21);
    }
  }

void sub_82FEC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v8.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v9 = sub_866D0((uint64_t)v8.super.isa, "siritv_inProgressStatusDescription:");

  if (v9)
  {
    sub_865D4();
    sub_866F4();
    uint64_t v10 = sub_33CF8();
    uint64_t v13 = sub_33C8C(v3, v11, v12, v10);
    sub_9E64(v2, 1LL, 1LL, v13);
    sub_86644();
    uint64_t v20 = &_swiftEmptySetSingleton;
    v19[0] = 1;
    sub_33C64(a1, (uint64_t)v8.super.isa, v3, v2, (uint64_t)v19);
    uint64_t v14 = sub_33D30();
    sub_9E64(a2, 0LL, 1LL, v14);
    sub_10E90();
  }

  else
  {
    sub_33D30();
    uint64_t v15 = sub_86508();
    sub_86034(v15, v16, v17, v18);
  }

void sub_83120(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = 0LL;
  memset(v33, 0, sizeof(v33));
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
  *(void *)(a2 + 32) = 0LL;
  sub_85C70(a3, (SEL *)&selRef_status);
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0xE000000000000000LL;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupStatusCompletedValue);
  if (v8 == v10 && v9 == v11)
  {
    uint64_t v14 = sub_861D0();
  }

  else
  {
    char v13 = sub_A244(v8, v9, v10, v11);
    sub_A1C8();
    uint64_t v14 = sub_A418();
    if ((v13 & 1) == 0) {
      goto LABEL_38;
    }
  }

  sub_86768(v14, (SEL *)&selRef_winningEntity);
  if (v16) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = 0LL;
  }
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = 0xE000000000000000LL;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupWinningEntityHomeValue);
  if (v19 == v17 && v20 == v18)
  {
    sub_A1C8();
  }

  else
  {
    char v22 = sub_A244(v19, v20, v17, v18);
    sub_3CBD0();
    if ((v22 & 1) == 0)
    {
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(SASportsMatchupWinningEntityAwayValue);
      if (v23 == v17 && v24 == v18)
      {
        sub_861D0();
      }

      else
      {
        char v26 = sub_A244(v23, v24, v17, v18);
        sub_A1C8();
        sub_3CBD0();
        if ((v26 & 1) == 0) {
          goto LABEL_38;
        }
      }

      goto LABEL_33;
    }
  }

  sub_A1C8();
  if (!objc_msgSend(a3, "siriui_homeIsFirst"))
  {
LABEL_36:
    uint64_t v31 = sub_A5F8();
    uint64_t v32 = &protocol witness table for Color;
    sub_86938(v31);
    static Color.secondary.getter();
    sub_629D0((uint64_t)v33);
    uint64_t v29 = v33;
    goto LABEL_37;
  }

uint64_t sub_83338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_33CF8();
  uint64_t v3 = sub_33D84(a1, 1LL);
  sub_86768(v3, (SEL *)&selRef_sport);
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  if (qword_DEDE0 == -1)
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_12:
    sub_86300(v4, &qword_E10E8);
LABEL_13:
    uint64_t v12 = 1LL;
    return sub_86034(a1, v12, 1LL, v2);
  }

  uint64_t v4 = swift_once(&qword_DEDE0, sub_84864);
  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  if (qword_E4CB0 == v6 && v7 == *(void *)algn_E4CB8)
  {
    sub_86870();
    uint64_t v11 = sub_1B0A8();
    sub_86300(v11, &qword_E10E8);
    sub_861D0();
  }

  else
  {
    char v9 = sub_A244(qword_E4CB0, *(uint64_t *)algn_E4CB8, v6, v7);
    sub_86870();
    uint64_t v10 = sub_1B0A8();
    sub_86300(v10, &qword_E10E8);
    sub_861D0();
    if ((v9 & 1) == 0) {
      goto LABEL_13;
    }
  }

  sub_860CC( a1,  enum case for TextElement.Font.body(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 104LL));
  uint64_t v12 = 0LL;
  return sub_86034(a1, v12, 1LL, v2);
}

void sub_83454( void *a1@<X0>, uint64_t (*a2)(void, void, void)@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_A274();
  sub_867E4((uint64_t)v10, a3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL));
  sub_86150((uint64_t)v10);
  sub_76AF4(a1, a2, (uint64_t)v10, 1, 1u, a4);
  sub_A068((uint64_t)v10, &qword_E3480);
  sub_1AEA4();
}

uint64_t sub_83508@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v294 = a2;
  uint64_t v269 = a3;
  uint64_t v290 = type metadata accessor for ImageElement.SourceType(0LL);
  uint64_t v282 = *(void *)(v290 - 8);
  sub_A13C();
  __chkstk_darwin(v7);
  sub_A118();
  uint64_t v9 = sub_A19C(v8);
  uint64_t v10 = type metadata accessor for ImageElement(v9);
  sub_A228(v10, (uint64_t)&v295);
  v268[0] = v11;
  sub_A13C();
  __chkstk_darwin(v12);
  sub_A118();
  uint64_t v14 = sub_A19C(v13);
  uint64_t v15 = type metadata accessor for ImageElement.Background(v14);
  uint64_t v284 = *(void *)(v15 - 8);
  uint64_t v285 = v15;
  sub_A13C();
  __chkstk_darwin(v16);
  uint64_t v283 = (char *)v241 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_A24C();
  uint64_t v19 = type metadata accessor for ImageElement.CornerRoundingMode(v18);
  sub_A228(v19, (uint64_t)&v277);
  uint64_t v249 = v20;
  sub_A13C();
  __chkstk_darwin(v21);
  sub_A118();
  uint64_t v23 = sub_A19C(v22);
  uint64_t v24 = type metadata accessor for ImageElement.RenderingMode(v23);
  sub_A228(v24, (uint64_t)&v270);
  uint64_t v245 = v25;
  sub_A13C();
  __chkstk_darwin(v26);
  sub_A118();
  uint64_t v28 = sub_A19C(v27);
  uint64_t v29 = type metadata accessor for ImageElement.ContentMode(v28);
  sub_A228(v29, (uint64_t)v268);
  uint64_t v243 = v30;
  sub_A13C();
  __chkstk_darwin(v31);
  sub_A118();
  sub_A398(v32);
  sub_9E24(&qword_DF5E0);
  sub_33C54();
  __chkstk_darwin(v33);
  sub_A118();
  uint64_t v35 = sub_A19C(v34);
  uint64_t v36 = type metadata accessor for ImageElement.Url(v35);
  sub_A228(v36, (uint64_t)&v274);
  uint64_t v247 = v37;
  sub_A13C();
  __chkstk_darwin(v38);
  sub_A118();
  uint64_t v40 = sub_A19C(v39);
  uint64_t v41 = type metadata accessor for URL(v40);
  sub_A228(v41, (uint64_t)&v286);
  uint64_t v276 = v42;
  sub_A13C();
  __chkstk_darwin(v43);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v44);
  sub_A258();
  sub_A398(v45);
  sub_9E24((uint64_t *)&unk_E0280);
  sub_33C54();
  __chkstk_darwin(v46);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v47);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v48);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v49);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v50);
  sub_A1EC();
  sub_A12C();
  uint64_t v52 = __chkstk_darwin(v51);
  sub_868EC(v52, v53, v54, v55, v56, v57, v58, v59, v241[0]);
  sub_9E24((uint64_t *)&unk_DF5F0);
  sub_33C54();
  __chkstk_darwin(v60);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v61);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v62);
  sub_A12C();
  __chkstk_darwin(v63);
  sub_A258();
  uint64_t v293 = (uint8_t *)v64;
  uint64_t v65 = sub_A5F0();
  sub_A228(v65, (uint64_t)&v265);
  v241[2] = v66;
  sub_A13C();
  __chkstk_darwin(v67);
  sub_A118();
  uint64_t v69 = sub_A19C(v68);
  uint64_t v70 = type metadata accessor for ImageElement.AppIcon(v69);
  sub_A228(v70, (uint64_t)&v280);
  uint64_t v252 = v71;
  sub_A13C();
  __chkstk_darwin(v72);
  sub_A118();
  sub_A398(v73);
  sub_9E24(&qword_DF5E8);
  sub_33C54();
  __chkstk_darwin(v74);
  sub_A148();
  uint64_t v292 = v75;
  sub_A168();
  __chkstk_darwin(v76);
  uint64_t v287 = (uint64_t)v241 - v77;
  uint64_t v78 = sub_A24C();
  uint64_t v286 = type metadata accessor for Vibrancy(v78);
  uint64_t v278 = *(void *)(v286 - 8);
  sub_A13C();
  __chkstk_darwin(v79);
  sub_A118();
  uint64_t v288 = v80;
  uint64_t v81 = sub_A24C();
  uint64_t v291 = type metadata accessor for ImageElement.SymbolRenderingMode(v81);
  uint64_t v271 = *(void (**)(void))(v291 - 8);
  sub_A13C();
  __chkstk_darwin(v82);
  sub_1B028();
  sub_9E24(&qword_DF5C8);
  sub_33C54();
  __chkstk_darwin(v83);
  uint64_t v85 = (char *)v241 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v86 = sub_A274();
  uint64_t v87 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  sub_1AEE8();
  sub_9E24((uint64_t *)&unk_DF5D0);
  sub_33C54();
  __chkstk_darwin(v88);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v89);
  uint64_t v91 = (char *)v241 - v90;
  uint64_t v92 = type metadata accessor for ImageElement.Symbol(0LL);
  sub_A228(v92, (uint64_t)&v297);
  uint64_t v289 = v93;
  sub_A13C();
  __chkstk_darwin(v94);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v95);
  sub_7C084();
  uint64_t v277 = a1;
  LODWORD(v270) = sub_305EC();
  if (qword_DEDD0 != -1) {
    swift_once(&qword_DEDD0, sub_847F8);
  }
  uint64_t v97 = qword_E4C88;
  uint64_t v96 = unk_E4C90;
  uint64_t v273 = sub_A5F8();
  sub_9E64((uint64_t)v91, 1LL, 1LL, v273);
  uint64_t v280 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 16);
  uint64_t v281 = v86;
  sub_1B1AC(v3, v294, v280);
  sub_9E64((uint64_t)v85, 1LL, 1LL, v285);
  sub_A2F4();
  int v260 = v98;
  uint64_t v271 = v99;
  v99(v5);
  uint64_t v100 = *(void (**)(void))(v278 + 104);
  uint64_t v101 = v288;
  int v258 = enum case for Vibrancy.default(_:);
  uint64_t v259 = v100;
  v100(v288);
  sub_1B0E4();
  ImageElement.Symbol.init(_:darkModeName:tintColor:symbolRenderingMode:imageStyle:background:punchesThroughBackground:vibrancy:)( v97,  v96,  0LL,  0LL,  v91,  v5,  v3,  v85,  0,  v101);
  uint64_t v102 = v287;
  uint64_t v103 = sub_862BC();
  uint64_t v106 = sub_9E64(v103, v104, v105, v290);
  uint64_t v107 = v4;
  uint64_t v108 = v101;
  uint64_t v278 = v3;
  uint64_t v275 = v107;
  uint64_t v262 = v5;
  uint64_t v261 = v85;
  uint64_t v274 = v91;
  if (v270 == 2)
  {
    uint64_t v120 = v294;
    sub_86314(v3);
    sub_33D4C();
    uint64_t v127 = v251;
    uint64_t v128 = ImageElement.AppIcon.init(_:imageStyle:)(0xD000000000000014LL);
    sub_860FC(v128, &qword_DF5E8);
    uint64_t v129 = sub_86784();
    uint64_t v131 = sub_A420(v129, v127, v130);
    sub_8636C(v131, enum case for ImageElement.SourceType.appIcon(_:));
    sub_53CB8(v102, 0LL);
    uint64_t v109 = v292;
    uint64_t v132 = v293;
    goto LABEL_28;
  }

  uint64_t v109 = v292;
  if (v270 != 1)
  {
    sub_860FC(v106, &qword_DF5E8);
    sub_53CB8(v102, 1LL);
    uint64_t v120 = v294;
    goto LABEL_16;
  }

  uint64_t v110 = (void *)sub_86884();
  uint64_t result = sub_9ED8(v110);
  if (result)
  {
    uint64_t v112 = result;
    if ((unint64_t)result >> 62)
    {
      if (result >= 0) {
        result &= 0xFFFFFFFFFFFFFF8uLL;
      }
      if (_CocoaArrayWrapper.endIndex.getter(result)) {
        goto LABEL_8;
      }
    }

    else if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8LL)))
    {
LABEL_8:
      sub_3C4A0(0LL, (v112 & 0xC000000000000001LL) == 0, v112);
      if ((v112 & 0xC000000000000001LL) != 0)
      {
        uint64_t v101 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v112);
      }

      else
      {
        uint64_t v101 = *(void *)(v112 + 32);
        swift_unknownObjectRetain(v101);
      }

      sub_3CEA0();
      uint64_t v113 = objc_opt_self(&OBJC_CLASS___SAUIAppPunchOut);
      uint64_t v114 = (void *)swift_dynamicCastObjCClass(v101, v113);
      if (!v114 || (sub_85C70(v114, (SEL *)&selRef_bundleId), !v116))
      {
        uint64_t result = sub_1AEC8();
        goto LABEL_24;
      }

      uint64_t v117 = v115;
      unint64_t v118 = v116;
      id v119 = sub_856BC(v115, v116);

      if (v119)
      {
        uint64_t v120 = v294;
        sub_86314(v278);
        uint64_t v121 = v117;
        uint64_t v122 = v251;
        ImageElement.AppIcon.init(_:imageStyle:)(v121);
        uint64_t v123 = sub_1AEC8();
        sub_860FC(v123, &qword_DF5E8);
        uint64_t v124 = sub_86784();
        uint64_t v126 = sub_A420(v124, v122, v125);
        sub_8636C(v126, enum case for ImageElement.SourceType.appIcon(_:));
        sub_53CB8(v102, 0LL);
LABEL_16:
        uint64_t v132 = v293;
        goto LABEL_28;
      }

      sub_1AEC8();
      unint64_t v133 = v118;
      goto LABEL_23;
    }

    unint64_t v133 = v112;
LABEL_23:
    uint64_t result = swift_bridgeObjectRelease(v133);
  }

void sub_846C0()
{
  qword_E4C18 = 0x535F5354524F5053LL;
  unk_E4C20 = 0xEF454C5544454843LL;
}

void sub_846F0()
{
  qword_E4C28 = 0x56494C5F454D4147LL;
  unk_E4C30 = 0xE900000000000045LL;
}

void sub_84718()
{
  qword_E4C38 = 0x4E49465F454D4147LL;
  unk_E4C40 = 0xEA00000000004C41LL;
}

void sub_84740()
{
  unk_E4C56 = -4864;
}

void sub_84770()
{
  unk_E4C67 = -18;
}

void sub_847A0()
{
  unk_E4C75 = 0;
  unk_E4C76 = -5120;
}

void sub_847CC()
{
  unk_E4C85 = 0;
  unk_E4C86 = -5120;
}

void sub_847F8()
{
  qword_E4C88 = 0x65726F7473707061LL;
  unk_E4C90 = 0xE800000000000000LL;
}

uint64_t sub_8481C()
{
  uint64_t v0 = type metadata accessor for Color(0LL);
  sub_9DCC(v0, qword_E4C98);
  sub_9E0C(v0, (uint64_t)qword_E4C98);
  return static Color.secondary.getter();
}

void sub_84864()
{
  qword_E4CB0 = 0x74656B63697243LL;
  *(void *)algn_E4CB8 = 0xE700000000000000LL;
}

void sub_84888()
{
  uint64_t v190 = v0;
  uint64_t v6 = v5;
  uint64_t v187 = v7;
  uint64_t v188 = sub_A5F0();
  uint64_t v186 = *(void *)(v188 - 8);
  sub_A13C();
  __chkstk_darwin(v8);
  sub_6CD10();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v175 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  sub_868EC(v13, v14, v15, v16, v17, v18, v19, v20, v175);
  sub_9E24(&qword_E2300);
  sub_33C54();
  __chkstk_darwin(v21);
  sub_863E8();
  __chkstk_darwin(v22);
  sub_A258();
  uint64_t v24 = sub_A19C(v23);
  uint64_t v25 = type metadata accessor for PrimaryHeaderStandard(v24);
  uint64_t v183 = *(void *)(v25 - 8);
  uint64_t v184 = v25;
  sub_A13C();
  __chkstk_darwin(v26);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v27);
  sub_A1EC();
  uint64_t v181 = v28;
  sub_A168();
  __chkstk_darwin(v29);
  sub_A1EC();
  sub_A12C();
  __chkstk_darwin(v30);
  sub_A258();
  sub_A398(v31);
  sub_9E24(&qword_E0F80);
  sub_33C54();
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)&v175 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = sub_53D10();
  sub_4EEB0();
  __chkstk_darwin(v36);
  sub_860BC();
  __chkstk_darwin(v37);
  uint64_t v39 = (char *)&v175 - v38;
  uint64_t v40 = objc_opt_self(&OBJC_CLASS___SASportsScheduleSnippet);
  uint64_t v41 = sub_86718(v40);
  if (!v41)
  {
    if (AFSiriLogContextConnection)
    {
      uint64_t v56 = sub_8690C((uint64_t)AFSiriLogContextConnection);
      static os_log_type_t.debug.getter(v56);
      id v57 = sub_86808();
      uint64_t v58 = (void *)sub_DDD8();
      if (sub_86098((os_log_s *)v58))
      {
        uint64_t v59 = sub_A1D0(22LL);
        uint64_t v60 = sub_A1D0(64LL);
        *(void *)&__int128 v194 = v60;
        *(void *)&__int128 v191 = sub_8647C(4.8151e-34);
        uint64_t v61 = sub_9E24(&qword_E4CE8);
        uint64_t v62 = sub_86118(v61, v61);
        *(void *)&__int128 v191 = sub_8619C(v62, v63);
        sub_867BC(v191, (uint64_t)&v191 + 8, v64, v59 + 12);

        sub_3CEA0();
        sub_86464();
        sub_3CA48(v65, &qword_E4CF0, &OBJC_CLASS___SASportsScheduleSnippet_ptr);
        *(void *)&__int128 v191 = sub_9E24(&qword_E4CF8);
        uint64_t v66 = sub_9E24(&qword_E4D00);
        uint64_t v67 = sub_86118(v66, v66);
        uint64_t v69 = sub_8619C(v67, v68);
        sub_8621C(v69);
        sub_3CBD0();
        sub_46278(&dword_0, v70, v71, "#aceshim %s expecting %s");
        sub_86160();
        sub_A15C(v60);
        sub_A15C(v59);
      }

      else
      {
      }

      (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v3, v188);
      uint64_t v72 = sub_A600();
      uint64_t v73 = (uint64_t)v187;
      goto LABEL_74;
    }

LABEL_80:
    __break(1u);
    goto LABEL_81;
  }

  uint64_t v42 = (void *)v41;
  id v43 = v6;
  unint64_t v44 = sub_85CC0(v42);
  id v185 = v43;
  if (!v44)
  {
LABEL_68:
    if (AFSiriLogContextConnection)
    {
      uint64_t v161 = sub_21444((uint64_t)AFSiriLogContextConnection);
      static os_log_type_t.error.getter(v161);
      id v162 = sub_86808();
      uint64_t v163 = (os_log_s *)Logger.logObject.getter(v162);
      if (sub_860A4(v163))
      {
        uint64_t v164 = sub_A1D0(12LL);
        uint64_t v165 = sub_A1D0(32LL);
        *(void *)&__int128 v194 = v165;
        *(void *)&__int128 v191 = sub_860E8(4.8149e-34);
        uint64_t v166 = sub_9E24(&qword_E4CE8);
        uint64_t v167 = sub_86118(v166, v166);
        *(void *)&__int128 v191 = sub_8619C(v167, v168);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v191, (char *)&v191 + 8, 12LL, v34);

        sub_A3C8();
        sub_85FC0(&dword_0, v163, v169, "#aceshim %s expecting at least one matchup in schedule");
        sub_85F4C();
        sub_A15C(v165);
        sub_A15C(v164);
      }

      else
      {
      }

      (*(void (**)(char *, uint64_t))(v186 + 8))(v12, v188);
      goto LABEL_73;
    }

    __break(1u);
    goto LABEL_80;
  }

  unint64_t v45 = v44;
  uint64_t v46 = v44 >> 62;
  if (!(v44 >> 62))
  {
    id v47 = *(id *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFF8LL));
    if (v47) {
      goto LABEL_5;
    }
    goto LABEL_67;
  }

  if ((v44 & 0x8000000000000000LL) != 0LL) {
    uint64_t v160 = v44;
  }
  else {
    uint64_t v160 = v44 & 0xFFFFFFFFFFFFFF8LL;
  }
  uint64_t v176 = v44 >> 62;
  swift_bridgeObjectRetain(v44);
  id v47 = (id)_CocoaArrayWrapper.endIndex.getter(v160);
  sub_A4F4();
  uint64_t v46 = v176;
  if (!v47)
  {
LABEL_67:
    sub_A4F4();
    id v43 = v185;
    goto LABEL_68;
  }

uint64_t sub_8546C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v8 = (void *)swift_task_alloc(dword_E28FC);
  v5[4] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_854C4;
  return sub_4C980(a4, a5);
}

uint64_t sub_854C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_85520, 0LL, 0LL);
}

uint64_t sub_85520()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = [(id)objc_opt_self(SiriTVUILockingCache) sharedInstance];
    id v3 = v1;
    sub_1B404();
    NSString v4 = String._bridgeToObjectiveC()();
    [v2 setObject:v3 forKey:v4];
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_855BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_85A18(a1, 0, 0, 0, 1, 0, 0);
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    swift_unknownObjectRetain(v6);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v7);
    uint64_t v11 = v10;
    swift_unknownObjectRelease(v6);
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = swift_allocObject(&unk_CCB98, 32LL, 7LL);
  *(void *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  if (v11 | v9)
  {
    v15[0] = 0LL;
    v15[1] = 0LL;
    uint64_t v13 = v15;
    v15[2] = v9;
    v15[3] = v11;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return swift_task_create(v5, v13, (char *)&type metadata for () + 8, &unk_E4D50, v12);
}

id sub_856BC(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_A1AC();
  uint64_t v7 = type metadata accessor for URL(v6);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_A344();
  uint64_t v11 = v9 - v10;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v16) {
    return 0LL;
  }
  sub_3CA48(v13, &qword_E4D08, &OBJC_CLASS___LSApplicationProxy_ptr);
  sub_3CE84();
  id v17 = sub_8590C(a1, a2);
  if (!v17) {
    return 0LL;
  }
  uint64_t v18 = v17;
  id v19 = [v17 bundleURL];
  if (!v19)
  {
    sub_2FD8C(v2);
    goto LABEL_10;
  }

  uint64_t v20 = v19;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  v21(v2, v11, v7);
  sub_9E64(v2, 0LL, 1LL, v7);
  sub_A2E0(v2, 1LL, v7);
  if (v22)
  {
LABEL_10:

    sub_A410(v37, (uint64_t *)&unk_E0280);
    return 0LL;
  }

  uint64_t v23 = ((uint64_t (*)(char *, uint64_t, uint64_t))v21)(v15, v2, v7);
  sub_8687C(v23, (SEL *)&selRef__tvsui_applicationIconName);
  if (!v24)
  {
    sub_864C8();

    return 0LL;
  }

  uint64_t v25 = v24;
  uint64_t v26 = (void *)objc_opt_self(&OBJC_CLASS___UIImage);
  URL._bridgeToObjectiveC()(v27);
  uint64_t v29 = v28;
  id v30 = [(id)objc_opt_self(UIScreen) mainScreen];
  id v31 = [v30 traitCollection];

  [v31 displayScale];
  double v33 = v32;

  uint64_t v34 = sub_868CC();
  id v36 = sub_85BF0(v34, v33, v35, v25, v26);

  sub_864C8();
  return v36;
}

id sub_8590C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [(id)swift_getObjCClassFromMetadata(v2) applicationProxyForIdentifier:v4];

  return v5;
}

id sub_85978()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleSnippetShim();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_859C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleSnippetShim();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ScheduleSnippetShim()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV19ScheduleSnippetShim);
}

uint64_t sub_85A18(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14 = sub_9E24(&qword_E4D20);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9F98(a1, (uint64_t)v16, &qword_E4D20);
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  if (sub_9F8C((uint64_t)v16, 1LL, v17) == 1)
  {
    sub_A068((uint64_t)v16, &qword_E4D20);
    uint64_t result = 0LL;
    if ((a2 & 1) == 0) {
      goto LABEL_3;
    }
  }

  else
  {
    unsigned __int8 v19 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8LL))(v16, v17);
    uint64_t result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a3 & 1) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  result |= 0x100uLL;
  if ((a3 & 1) != 0)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

uint64_t sub_85B58(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  NSString v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *NSString v4 = v2;
  v4[1] = sub_85BBC;
  return v6(a1);
}

uint64_t sub_85BBC()
{
  return sub_86274(*(uint64_t (**)(void))(v0 + 8));
}

void sub_85BE4(void *a1)
{
}

id sub_85BF0(uint64_t a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v10 = objc_msgSend(a5, "tvsui_applicationIconImageForBundleURL:iconName:scale:", a1, v9, a2);

  return v10;
}

void sub_85C70(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    id v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_1B404();
  sub_ADE8();
}

uint64_t sub_85CC0(void *a1)
{
  id v1 = [a1 matchups];
  if (!v1) {
    return 0LL;
  }
  id v2 = v1;
  uint64_t v3 = sub_DCB4(0LL, &qword_E2348, &OBJC_CLASS___SASportsMatchup_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_85D2C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  NSString v9 = sub_86938(a1);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + swift_unknownObjectWeakDestroy(v0 + 16) = a1 + 1;
  return sub_9F74(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_85DA0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_85DCC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc(dword_E4D3C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_85E44;
  return sub_8546C(a1, v4, v5, v7, v6);
}

uint64_t sub_85E44()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_85E70()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_85E94(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_E4D4C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_85F04;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_E4D48 + dword_E4D48))(a1, v4);
}

uint64_t sub_85F04()
{
  return sub_86274(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_85F28(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

uint64_t sub_85F3C(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

uint64_t sub_85F4C()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_85F5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3)
{
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))( (char *)&a3 - ((a2 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v4);
}

unint64_t sub_85F80()
{
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  return v0
}

uint64_t sub_85FA8()
{
  return sub_F8FC(0LL, *(void *)(v0 + 16) + 1LL, 1LL, v0);
}

void sub_85FC0(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

BOOL sub_85FD0(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

void sub_85FE0(unint64_t a1@<X8>)
{
}

uint64_t sub_85FF8()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_86018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return TextElement.init(_:font:fontWeight:fontColor:italic:bold:lineLimit:idioms:)(a1, a2, a3, a4, a5, a6, a7, 0LL);
}

uint64_t sub_86020()
{
  return sub_9E64(v1, 1LL, 1LL, v0);
}

uint64_t sub_86034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_9E64(a1, a2, a3, a4);
}

unint64_t sub_86044()
{
  return v1
}

uint64_t sub_86064()
{
  return type metadata accessor for _ProtoTextElement.Font.Weight(0LL);
}

uint64_t sub_8606C(__n128 a1)
{
  *(__n128 *)(v1 - 224) = a1;
  *(__n128 *)(v1 - sub_1AD30(v0 - 160, v0 - 208) = a1;
  *(void *)(v1 - 240) = 0LL;
  *(__n128 *)(v1 - 256) = a1;
  *(__n128 *)(v1 - 272) = a1;
  return PrimaryHeaderStandard.init(text1:text2:text3:action:)(v1 - 128, v1 - 176, v1 - 224, v1 - 272);
}

BOOL sub_86098(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

BOOL sub_860A4(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_860B0(uint64_t a1)
{
  return Logger.logObject.getter(a1);
}

  ;
}

uint64_t sub_860CC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_860D4(float a1)
{
  *uint64_t v2 = a1;
  return swift_getObjectType(v1);
}

uint64_t sub_860E8(float a1)
{
  *uint64_t v2 = a1;
  return swift_getObjectType(v1);
}

void sub_860FC(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_86104()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_86118(uint64_t a1, uint64_t a2)
{
  return String.init<A>(describing:)(v2 - 176, a2);
}

double sub_86120()
{
  double result = 0.0;
  *(_OWORD *)(v0 - sub_9F74((__int128 *)(v0 - 136), v0 - 176) = 0u;
  *(_OWORD *)(v0 - sub_1AD30(v0, v1 - 160) = 0u;
  *(void *)(v0 - sub_9F74((__int128 *)(v1 - 192), v1 - 144) = 0LL;
  return result;
}

  ;
}

uint64_t sub_86148()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_86150(uint64_t a1)
{
  return sub_9E64(a1, 0LL, 1LL, v1);
}

uint64_t sub_86160()
{
  return swift_arrayDestroy(v0, 2LL);
}

void sub_86170()
{
}

uint64_t sub_8619C(uint64_t a1, unint64_t a2)
{
  return sub_CC88(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t sub_861A4()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_861AC()
{
  return sub_DA84(v1, v0);
}

uint64_t sub_861B8(uint64_t a1)
{
  return Logger.init(_:)(a1);
}

uint64_t sub_861C0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 216))(a1, v2, v1);
}

uint64_t sub_861D0()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

void sub_861DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_861EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_85D2C(a1, v5, a3, v3, v4);
}

uint64_t sub_861FC@<X0>(uint64_t a1@<X8>)
{
  return sub_9F74((__int128 *)(v1 - 144), a1 + 32);
}

uint64_t sub_86208@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_8621C(uint64_t a1)
{
  *(void *)(v4 - sub_9F74((__int128 *)(v0 - 136), v0 - 176) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v4 - 176, v3 + 8, v2, v1 + 22);
}

  ;
}

uint64_t sub_86254(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_8625C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(a1 + *(void *)(v1 + 72) * v2, v4, v3);
}

uint64_t sub_86274(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_86280()
{
  return sub_9F38((void *)(v0 - 144));
}

  ;
}

uint64_t sub_86298(uint64_t result)
{
  *(void *)(v1 - 96) = result;
  return result;
}

uint64_t sub_862A4(uint64_t a1)
{
  *(void *)(v4 - 184) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v4 - 184, v3 + 8, v2, v1);
}

uint64_t sub_862BC()
{
  return v0;
}

uint64_t sub_862CC(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

BOOL sub_862D4@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_862E8@<X0>(unint64_t a1@<X8>)
{
  return sub_FAB8(a1 > 1, v1, 1LL, v2);
}

void sub_86300(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_86308(uint64_t result)
{
  *(void *)(v1 - 96) = result;
  return result;
}

uint64_t sub_86314(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 - 240))(a1, v1, *(void *)(v2 - 232));
}

uint64_t sub_86320()
{
  return sub_22F00(v0 - 136, v0 - 176);
}

uint64_t sub_8632C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_86338@<X0>(unsigned int *a1@<X8>)
{
  return v1(v2, *a1, *(void *)(v3 - 144));
}

uint64_t sub_8634C(float a1)
{
  *uint64_t v2 = a1;
  return swift_getObjectType(v1);
}

BOOL sub_86360(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_8636C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 224) + 104LL))(v3, a2, v2);
}

void *sub_86380@<X0>(uint64_t a1@<X8>)
{
  v1[4] = a1;
  return sub_9F38(v1);
}

uint64_t sub_8638C()
{
  return *(void *)(v0 - 288);
}

uint64_t sub_863A8(uint64_t a1, unint64_t a2)
{
  return sub_CC88(a1, a2, (uint64_t *)(v2 - 144));
}

void sub_863B0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_863BC(uint64_t a1)
{
  return TableHeader.HeaderCell.init(_:columnSpan:alignment:)(a1, 1LL, v1);
}

uint64_t sub_863C8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_863D0()
{
  return v0;
}

void sub_863DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
}

  ;
}

uint64_t sub_86404()
{
  return 0LL;
}

uint64_t sub_86420()
{
  return type metadata accessor for SummaryItemPairNumberV2(0LL);
}

uint64_t sub_86428()
{
  return type metadata accessor for SummaryItemPairV2(0LL);
}

  ;
}

uint64_t sub_8643C(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_86444(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_8644C()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v0 + 88) + 8LL))(v1, *(void *)(v0 + 96));
}

id sub_8645C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_86464()
{
  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t sub_86474(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_8647C(float a1)
{
  *uint64_t v1 = a1;
  return swift_getObjectType(v2);
}

uint64_t sub_8648C(uint64_t a1)
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, a1);
}

  ;
}

uint64_t sub_864AC(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 184, a1);
}

  ;
}

uint64_t sub_864C8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

  ;
}

  ;
}

uint64_t sub_864F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v3 - 152) + 104LL))( v2,  a2,  *(void *)(v3 - 144));
}

uint64_t sub_86508()
{
  return v0;
}

uint64_t sub_86520()
{
  return sub_294B8(*(void *)(*(void *)v0 + 16LL));
}

uint64_t sub_86530(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_86538(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_86540()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 8))(v1, *(void *)(v2 - 208));
}

  ;
}

  ;
}

uint64_t sub_86580()
{
  return v0;
}

void *sub_86590@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 - 112);
  v2[3] = *(void *)(v1 - 208);
  v2[4] = a1;
  return sub_9F38(v2);
}

double sub_865A0()
{
  *(void *)(v0 - 112) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - sub_9F74((__int128 *)(v1 - 192), v1 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

double sub_865B0()
{
  *(void *)(v1 - 96) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v1 - 128) = 0u;
  *(_OWORD *)(v1 - 112) = 0u;
  *(void *)(v0 + 24) = *(void *)(v1 - 232);
  return result;
}

uint64_t sub_865C8()
{
  return v0;
}

uint64_t sub_865D4()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

uint64_t sub_865DC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for TableRow.Content(0LL);
}

uint64_t sub_865EC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for Table.ColumnAlignment(0LL);
}

uint64_t sub_865FC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for Table.Column(0LL);
}

uint64_t sub_8660C()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

  ;
}

uint64_t sub_8662C(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_86634(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_8663C(uint64_t a1)
{
  return v1(a1, v2);
}

double sub_86644()
{
  *(void *)(v0 - 64) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 - 96) = 0u;
  *(_OWORD *)(v0 - 80) = 0u;
  return result;
}

void sub_86658()
{
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
}

void sub_8666C(void *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_86678()
{
  return swift_isUniquelyReferenced_nonNull_native(*(void *)(v0 - 96));
}

  ;
}

uint64_t sub_86690()
{
  return sub_DBAC((void *)(v0 - 136));
}

uint64_t sub_86698@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_866A4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_866B0@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

NSLocale sub_866BC()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_866C4()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

id sub_866D0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_866DC()
{
  return v0;
}

void sub_866E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_866F4()
{
}

uint64_t sub_86700(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 88, a1);
}

uint64_t sub_8670C(uint64_t a1)
{
  return String.init<A>(describing:)(v1 + 464, a1);
}

uint64_t sub_86718(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_86724(uint64_t a1, unint64_t a2)
{
  return sub_CC88(a1, a2, (uint64_t *)(v2 - 176));
}

uint64_t sub_86730(uint64_t a1)
{
  return Logger.logObject.getter(a1);
}

void *sub_86738@<X0>(uint64_t a1@<X8>)
{
  v1[4] = a1;
  return sub_9F38(v1);
}

id sub_86744()
{
  return [v1 *(SEL *)(v0 + 2792)];
}

uint64_t sub_86750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return SummaryItemPairV2.init(text1:text2:text3:thumbnail1:thumbnail2:action:componentName:linkIdentifier:)( a1,  a2,  a3,  a4,  a5,  a6,  0LL,  0xE000000000000000LL);
}

uint64_t sub_8675C()
{
  return sub_DA40(v1, v0);
}

void sub_86768(uint64_t a1, SEL *a2)
{
}

uint64_t sub_86770()
{
  return v0;
}

uint64_t sub_86784()
{
  return v0;
}

  ;
}

uint64_t sub_867AC()
{
  return sub_DBAC((void *)(v0 - 176));
}

void *sub_867B4()
{
  return sub_9F38((void *)(v0 - 176));
}

uint64_t sub_867BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v5 - 176, a2, v4, a4);
}

void sub_867C8(uint64_t a1, uint64_t *a2)
{
}

unint64_t sub_867D0()
{
  return 0xD000000000000011LL;
}

uint64_t sub_867E4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_867EC(uint64_t a1)
{
  return sub_1A800(a1, v1);
}

uint64_t sub_867F4()
{
  return sub_DBAC((void *)(v0 - 144));
}

void sub_867FC(void *a1@<X0>, void *a2@<X8>)
{
}

id sub_86808()
{
  return *(id *)(v0 - 184);
}

void sub_86810()
{
}

uint64_t sub_8681C(uint64_t a1)
{
  return Logger.logObject.getter(a1);
}

uint64_t sub_86828(uint64_t a1, uint64_t a2)
{
  return v2(v3, a2, v4);
}

void sub_86834(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_8683C@<X0>(uint64_t a1@<X8>)
{
  return sub_294AC(*(void *)(a1 + 16));
}

void sub_86848(uint64_t a1, uint64_t a2)
{
}

void sub_86850(uint64_t a1, SEL *a2)
{
}

uint64_t sub_86858(uint64_t a1, uint64_t a2)
{
  return sub_F8E8(a1, a2, 1LL, v2);
}

uint64_t sub_86864(uint64_t a1, uint64_t a2)
{
  return sub_FAB8(a1, a2, 1LL, v2);
}

uint64_t sub_86870()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

void sub_8687C(uint64_t a1, SEL *a2)
{
}

uint64_t sub_86884()
{
  return *(void *)(v0 - 264);
}

id sub_86890()
{
  return *(id *)(v0 + 80);
}

void sub_8689C(uint64_t a1@<X8>)
{
}

uint64_t sub_868A8(uint64_t result)
{
  *(void *)(v1 - sub_9F74((__int128 *)(v1 - 192), v1 - 144) = result;
  return result;
}

uint64_t sub_868B4()
{
  return v0;
}

void sub_868C0()
{
}

uint64_t sub_868CC()
{
  return v0;
}

void sub_868D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 152) = (char *)&a9 - v9;
}

void sub_868EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 248) = (char *)&a9 - v9;
}

void *sub_86900@<X0>(uint64_t a1@<X8>)
{
  v1[3] = v2;
  v1[4] = a1;
  return sub_9F38(v1);
}

uint64_t sub_8690C(uint64_t a1)
{
  return Logger.init(_:)(a1);
}

uint64_t sub_86914()
{
  return type metadata accessor for SimpleItemRich(0LL);
}

uint64_t sub_8691C()
{
  return type metadata accessor for LineScore();
}

unint64_t sub_86924()
{
  return 0xD000000000000012LL;
}

void *sub_86938(uint64_t a1, ...)
{
  return sub_9F38((uint64_t *)va);
}

void sub_86940(void *a1@<X0>, void *a2@<X8>)
{
}

void *sub_8694C()
{
  uint64_t v1 = v0;
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  sub_4FCF8((uint64_t)isa, "setFromValue:");

  Class v3 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_4FCF8((uint64_t)v3, "setToValue:");

  Class v4 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_4FCF8((uint64_t)v4, "setByValue:");

  [v1 setDuration:1.0];
  [v1 setRemovedOnCompletion:0];
  LODWORD(v5) = 2139095040;
  [v1 setRepeatCount:v5];
  return v1;
}

void sub_86A30(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [(id)swift_getObjCClassFromMetadata(v2) animationWithKeyPath:v4];

  sub_ADE8();
}

void sub_86A94(uint64_t a1, uint64_t a2)
{
  id v5 = v4;
  [v4 setFromValue:a1];
  [v5 setToValue:a2];
  [v5 setRemovedOnCompletion:1];
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
  id v7 = v5;
  [v6 animationDuration];
  objc_msgSend(v7, "setDuration:");

  sub_ADE8();
}

void sub_86B4C(uint64_t a1, void *a2)
{
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    uint64_t v2 = *(void **)(*sub_109B4(a2, a2[3]) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
    sub_883EC();
    id v3 = v2;
    id v4 = sub_8694C();
    sub_87D14((uint64_t)v4, 0x6E6F697461746F72LL, 0xE800000000000000LL, v3);
  }

double sub_86BE0()
{
  return 24.0;
}

uint64_t sub_86BEC()
{
  return swift_deallocClassInstance(v0, 17LL, 7LL);
}

uint64_t type metadata accessor for IndeterminateProgressConfiguration()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV34IndeterminateProgressConfiguration);
}

uint64_t sub_86C1C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_86C34(a1, a2, a3, (uint64_t (*)(void, uint64_t))sub_87E28);
}

uint64_t sub_86C28(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_86C34(a1, a2, a3, (uint64_t (*)(void, uint64_t))sub_87D7C);
}

uint64_t sub_86C34(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  uint64_t v5 = *v4;
  uint64_t v6 = sub_109B4(a1, a1[3]);
  return a4(*v6, v5);
}

uint64_t sub_86C70(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = (void **)sub_109B4(a1, a1[3]);
  return sub_88284(*v9, a2, a3, a4, a5);
}

uint64_t sub_86CCC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_86CE4(a1, a2, a3, (uint64_t (*)(void, double, double))nullsub_1);
}

uint64_t sub_86CD8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_86CE4(a1, a2, a3, (uint64_t (*)(void, double, double))j_nullsub_1);
}

uint64_t sub_86CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, double, double))
{
  double v5 = *v4;
  double v6 = v4[1];
  id v7 = sub_109B4(a1, a1[3]);
  return a4(*v7, v5, v6);
}

uint64_t sub_86D24(void *a1)
{
  uint64_t v1 = sub_109B4(a1, a1[3]);
  return nullsub_1(*v1);
}

double sub_86D84()
{
  return *(double *)v0;
}

void sub_86D8C(void *a1)
{
  uint64_t v3 = sub_216C0();
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  sub_109B4(a1, v4);
  uint64_t v40 = (void *)v3;
  uint64_t v41 = (void (*)())&off_CCBC0;
  aBlock[0] = v1;
  double v6 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 16);
  id v7 = v1;
  v6(aBlock, v4, v5);
  sub_88490();
  uint64_t v8 = a1[3];
  uint64_t v9 = sub_109B4(a1, v8);
  uint64_t DynamicType = swift_getDynamicType(v9, v8, 1LL);
  uint64_t v11 = &v7[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration];
  sub_1ADC4((uint64_t)&v7[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration], (uint64_t)v44);
  sub_884B0();
  __int128 v12 = v40;
  uint64_t v13 = sub_88498();
  uint64_t v14 = swift_getDynamicType(v13, v12, 1LL);
  sub_88490();
  if (DynamicType != v14) {
    sub_87038();
  }
  sub_884B0();
  uint64_t v15 = v40;
  uint64_t v16 = v41;
  sub_88498();
  v43[3] = v3;
  v43[4] = &off_CCBC0;
  v43[0] = v7;
  uint64_t v17 = (void (*)(void *, void *, void (*)()))*((void *)v16 + 1);
  uint64_t v18 = v7;
  v17(v43, v15, v16);
  sub_DBAC(v43);
  sub_88490();
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  sub_109B4(a1, v19);
  double v21 = (*(double (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
  double v23 = v22;
  uint64_t v24 = *((void *)v11 + 3);
  uint64_t v25 = *((void *)v11 + 4);
  uint64_t v26 = sub_109B4(v11, v24);
  uint64_t v27 = *(void *)(v24 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)aBlock - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v27 + 16))(v29);
  double v30 = (*(double (**)(uint64_t, uint64_t))(v25 + 32))(v24, v25);
  double v32 = v31;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v24);
  BOOL v33 = v23 == v32 && v21 == v30;
  uint64_t v34 = (void *)objc_opt_self(&OBJC_CLASS___UIView);
  uint64_t v35 = swift_allocObject(&unk_CCC80, 25LL, 7LL);
  *(void *)(v35 + swift_unknownObjectWeakDestroy(v0 + 16) = v18;
  *(_BYTE *)(v35 + 24) = v33;
  uint64_t v41 = sub_8844C;
  uint64_t v42 = v35;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_6F768;
  uint64_t v40 = &unk_CCC98;
  id v36 = _Block_copy(aBlock);
  uint64_t v37 = v42;
  uint64_t v38 = v18;
  swift_release(v37);
  [v34 animateWithDuration:v36 animations:0.3];
  _Block_release(v36);
}

void sub_87038()
{
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape];
  [v9 setHidden:0];
  objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v11 = [v10 clearColor];
  id v12 = [v11 CGColor];

  [v9 setFillColor:v12];
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape];
  [v13 setHidden:0];
  objc_msgSend(v13, "setFrame:", v2, v4, v6, v8);
  id v14 = [v10 clearColor];
  id v15 = [v14 CGColor];

  [v13 setFillColor:v15];
  uint64_t v16 = *(void **)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_imageView];
  [v16 setHidden:0];
  objc_msgSend(v16, "setFrame:", v2, v4, v6, v8);
  uint64_t v17 = *(void **)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_label];
  [v17 setHidden:0];
  objc_msgSend(v17, "setFrame:", v2, v4, v6, v8);
  [v17 setTextAlignment:1];
  [v17 setNumberOfLines:1];
  [*(id *)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_subtitleLabel] setAlpha:0.0];
  id v18 = v9;
  id v19 = v13;
  [v18 setStrokeStart:0.0];
  [v18 setStrokeEnd:1.0];

  id v20 = v19;
  [v20 setStrokeStart:0.0];
  [v20 setStrokeEnd:1.0];
}

void sub_872E8(char *a1, char a2)
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong(&a1[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_layoutDelegate]);
  if (!Strong) {
    id Strong = [a1 superview];
  }
  if ((a2 & 1) == 0)
  {
    [a1 invalidateIntrinsicContentSize];
    [Strong setNeedsLayout];
  }

  [a1 setNeedsLayout];
  [a1 layoutIfNeeded];
  [Strong layoutIfNeeded];
}

id sub_8739C()
{
  return objc_msgSend(v0, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

char *sub_873DC(double a1, double a2, double a3, double a4)
{
  double v5 = v4;
  uint64_t v10 = (objc_class *)sub_216C0();
  uint64_t v11 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape;
  id v12 = objc_allocWithZone(&OBJC_CLASS___CAShapeLayer);
  uint64_t v13 = v4;
  *(void *)&v5[v11] = [v12 init];
  uint64_t v14 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape;
  *(void *)&v13[v14] = sub_88488(objc_allocWithZone(&OBJC_CLASS___CAShapeLayer));
  uint64_t v15 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_imageView;
  *(void *)&v13[v15] = sub_88488(objc_allocWithZone(&OBJC_CLASS___UIImageView));
  uint64_t v16 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_label;
  *(void *)&v13[v16] = sub_88488(objc_allocWithZone(&OBJC_CLASS___UILabel));
  uint64_t v17 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_subtitleLabel;
  *(void *)&v13[v17] = sub_88488(objc_allocWithZone(&OBJC_CLASS___UILabel));
  id v18 = &v13[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_presenter];
  *(_OWORD *)id v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  sub_2D124(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_layoutDelegate);
  *(void *)&v13[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_tapOutsideGestureRecognizer] = 0LL;
  id v19 = &v13[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration];
  *((void *)v19 + 3) = &type metadata for SiriTVSpinnerView.EmptyConfiguration;
  *((void *)v19 + 4) = &off_CCD40;
  *(void *)id v19 = 0LL;
  *((void *)v19 + 1) = 0LL;

  v41.receiver = v13;
  v41.super_class = v10;
  id v20 = objc_msgSendSuper2(&v41, "initWithFrame:", a1, a2, a3, a4);
  double v21 = (void *)objc_opt_self(&OBJC_CLASS___UIScreen);
  double v22 = (char *)v20;
  id v23 = [v21 mainScreen];
  [v23 scale];
  double v25 = v24;

  uint64_t v26 = *(void **)&v22[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape];
  [v26 setContentsScale:v25];
  uint64_t v27 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape;
  [*(id *)&v22[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape] setContentsScale:v25];
  id v28 = sub_884A4();
  [v28 addSublayer:v26];

  id v29 = sub_884A4();
  [v29 addSublayer:*(void *)&v22[v27]];

  sub_8847C();
  sub_8847C();
  sub_8847C();
  sub_87038();
  uint64_t v30 = (uint64_t)&v22[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration];
  sub_1ADC4((uint64_t)&v22[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration], (uint64_t)v40);
  sub_22F00(v30, (uint64_t)v37);
  uint64_t v31 = v38;
  uint64_t v32 = v39;
  sub_109B4(v37, v38);
  v36[3] = v10;
  v36[4] = &off_CCBC0;
  v36[0] = v22;
  BOOL v33 = *(void (**)(void *, uint64_t, uint64_t))(v32 + 8);
  uint64_t v34 = v22;
  v33(v36, v31, v32);
  sub_DBAC(v36);
  sub_DBAC(v37);
  objc_msgSend(v34, "invalidateIntrinsicContentSize", v36[0]);

  return v34;
}

void sub_876FC()
{
  uint64_t v1 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape;
  *(void *)&v0[v1] = sub_88474(objc_allocWithZone(&OBJC_CLASS___CAShapeLayer));
  uint64_t v2 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape;
  *(void *)&v0[v2] = sub_88474(objc_allocWithZone(&OBJC_CLASS___CAShapeLayer));
  uint64_t v3 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_imageView;
  *(void *)&v0[v3] = sub_88474(objc_allocWithZone(&OBJC_CLASS___UIImageView));
  uint64_t v4 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_label;
  *(void *)&v0[v4] = sub_88474(objc_allocWithZone(&OBJC_CLASS___UILabel));
  uint64_t v5 = OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_subtitleLabel;
  *(void *)&v0[v5] = sub_88474(objc_allocWithZone(&OBJC_CLASS___UILabel));
  double v6 = &v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_presenter];
  *(_OWORD *)double v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  sub_2D124(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_layoutDelegate);
  *(void *)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_tapOutsideGestureRecognizer] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000A2020LL,  "SiriTV/SiriTVSpinnerView.swift",  30LL,  2LL);
  __break(1u);
}

uint64_t sub_8782C()
{
  uint64_t v1 = (objc_class *)sub_216C0();
  v11.receiver = v0;
  v11.super_class = v1;
  objc_msgSendSuper2(&v11, "layoutSubviews");
  uint64_t v2 = (uint64_t)v0 + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration;
  sub_1ADC4((uint64_t)v0 + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration, (uint64_t)v10);
  sub_22F00(v2, (uint64_t)v7);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  sub_109B4(v7, v8);
  v6[3] = v1;
  v6[4] = &off_CCBC0;
  v6[0] = v0;
  [v0 bounds];
  (*(void (**)(void *, uint64_t, uint64_t))(v4 + 24))(v6, v3, v4);
  sub_DBAC(v6);
  return sub_DBAC(v7);
}

uint64_t sub_8796C()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration);
  sub_1ADC4(v0 + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration, (uint64_t)v10);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  uint64_t v4 = sub_109B4(v1, v2);
  uint64_t v5 = *(void *)(v2 - 8);
  __chkstk_darwin(v4);
  double v7 = &v10[-v6 - 8];
  (*(void (**)(_BYTE *))(v5 + 16))(&v10[-v6 - 8]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v2);
}

id sub_87AB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)sub_216C0();
  return objc_msgSendSuper2(&v2, "isHighlighted");
}

uint64_t sub_87B28(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)sub_216C0();
  objc_msgSendSuper2(&v4, "setHighlighted:", a1 & 1);
  return sub_87B6C();
}

uint64_t sub_87B6C()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration];
  swift_beginAccess(&v0[OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration], v10, 0LL, 0LL);
  sub_22F00(v2, (uint64_t)v7);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  sub_109B4(v7, v8);
  v6[3] = ObjectType;
  v6[4] = &off_CCBC0;
  v6[0] = v0;
  [v0 bounds];
  (*(void (**)(void *, uint64_t, uint64_t))(v4 + 24))(v6, v3, v4);
  sub_DBAC(v6);
  return sub_DBAC(v7);
}

id sub_87C30()
{
  v2.receiver = v0;
  v2.super_class = (Class)sub_216C0();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriTVSpinnerView()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV17SiriTVSpinnerView);
}

void sub_87D14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  [a4 addAnimation:a1 forKey:v7];
}

uint64_t sub_87D7C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriTVSpinnerView();
  v10[3] = v4;
  v10[4] = &off_CCBC0;
  v10[0] = a1;
  *(_BYTE *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = 1;
  uint64_t v5 = *(void **)(*sub_109B4(v10, v4) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  id v6 = a1;
  id v7 = v5;
  NSString v8 = String._bridgeToObjectiveC()();
  [v7 removeAnimationForKey:v8];

  return sub_DBAC(v10);
}

uint64_t sub_87E28(void *a1, uint64_t a2)
{
  uint64_t v31 = type metadata accessor for SiriTVSpinnerView();
  uint64_t v32 = &off_CCBC0;
  v30[0] = a1;
  id v4 = a1;
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 24.0;
  v33.size.height = 24.0;
  CGFloat v5 = CGRectGetWidth(v33) * 0.5;
  id v6 =  objc_msgSend( (id)objc_opt_self(UIBezierPath),  "bezierPathWithRoundedRect:cornerRadius:",  0.0,  0.0,  24.0,  24.0,  v5);
  id v7 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*sub_109B4(v30, v31)
                                                             + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape), "path"));
  if (v7)
  {
    NSString v8 = v7;
    sub_883EC();
    id v9 = [v6 CGPath];
    sub_86A94((uint64_t)v8, (uint64_t)v9);
    objc_super v11 = v10;

    id v12 = sub_109B4(v30, v31);
    sub_87D14( (uint64_t)v11,  0x6D696E4168746170LL,  0xED00006E6F697461LL,  *(void **)(*v12 + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape));
  }

  id v13 = *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  id v14 = [v6 CGPath];
  [v13 setPath:v14];

  objc_msgSend( *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape),  "setStrokeStart:",  0.1);
  objc_msgSend( *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape),  "setStrokeEnd:",  0.9);
  id v15 = *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  CGColorRef GenericRGB = CGColorCreateGenericRGB(20.0, 20.0, 20.0, 20.0);
  [v15 setStrokeColor:GenericRGB];

  uint64_t v17 = *(void **)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  id v18 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v19 = v17;
  id v20 = [v18 clearColor];
  id v21 = [v20 CGColor];

  [v19 setFillColor:v21];
  objc_msgSend( *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape),  "setLineWidth:",  2.0);
  objc_msgSend(*(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_imageView), "setHidden:", 1);
  objc_msgSend(*(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_label), "setHidden:", 1);
  objc_msgSend( *(id *)(*sub_109B4(v30, v31) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape),  "setHidden:",  1);
  double v22 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
  sub_22F00((uint64_t)v30, (uint64_t)v29);
  uint64_t v23 = swift_allocObject(&unk_CCC30, 64LL, 7LL);
  *(void *)(v23 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  sub_9F74(v29, v23 + 24);
  v27[4] = sub_883C8;
  uint64_t v28 = v23;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 1107296256LL;
  void v27[2] = sub_6F768;
  v27[3] = &unk_CCC48;
  double v24 = _Block_copy(v27);
  uint64_t v25 = v28;
  swift_retain(a2);
  objc_msgSend(v22, "setCompletionBlock:", v24, swift_release(v25).n128_f64[0]);
  _Block_release(v24);

  return sub_DBAC(v30);
}

uint64_t sub_88284(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v16 = type metadata accessor for SiriTVSpinnerView();
  uint64_t v17 = &off_CCBC0;
  v15[0] = a1;
  uint64_t v10 = *(void **)(*sub_109B4(v15, v16) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  id v11 = a1;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, 24.0, 24.0);
  id v12 = *(id *)(*sub_109B4(v15, v16) + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  double MidX = CGRectGetMidX(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  objc_msgSend(v12, "setPosition:", MidX, CGRectGetMidY(v19));

  return sub_DBAC(v15);
}

uint64_t sub_8839C()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_883C8()
{
}

uint64_t sub_883D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_883E4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_883EC()
{
  unint64_t result = qword_E4F28;
  if (!qword_E4F28)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___CABasicAnimation);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_E4F28);
  }

  return result;
}

uint64_t sub_88428()
{
  return swift_deallocObject(v0, 25LL, 7LL);
}

void sub_8844C()
{
}

ValueMetadata *type metadata accessor for SiriTVSpinnerView.EmptyConfiguration()
{
  return &type metadata for SiriTVSpinnerView.EmptyConfiguration;
}

id sub_88474(void *a1)
{
  return [a1 *(SEL *)(v1 + 2888)];
}

id sub_8847C()
{
  return [v0 *(SEL *)(v1 + 2992)];
}

id sub_88488(void *a1)
{
  return [a1 *(SEL *)(v1 + 2888)];
}

uint64_t sub_88490()
{
  return sub_DBAC((void *)(v0 - 224));
}

void *sub_88498()
{
  return sub_109B4((void *)(v1 - 224), v0);
}

id sub_884A4()
{
  return [v0 *(SEL *)(v1 + 3000)];
}

uint64_t sub_884B0()
{
  return sub_22F00(v0, v1 - 224);
}

void sub_884BC(uint64_t a1)
{
  id v2 = sub_ED8C(a1, "traitCollection");
  uint64_t v3 = (char *)[v2 userInterfaceStyle];

  if (v3 == (_BYTE *)&dword_0 + 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  id v5 = [(id)objc_opt_self(UIBlurEffect) effectWithStyle:v4];
  id v65 = [objc_allocWithZone(UIVisualEffectView) initWithEffect:v5];

  sub_89884(0xD000000000000029LL, 0x80000000000A3EA0LL, v65);
  [v65 _setCornerRadius:1 continuous:15 maskedCorners:30.0];
  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_89920(0x706F72646B636162LL, 0xEC00000077656956LL, v65);
  sub_277AC(v6, "addSubview:", v7, v8, v9, v10, v11, v12, (uint64_t)v65);
  uint64_t v13 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v14 = sub_1AFD0(v13, 64LL);
  *(_OWORD *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB340;
  id v21 = sub_32C00(v14, "topAnchor", v15, v16, v17, v18, v19, v20, v66);
  id v22 = sub_DDAC((uint64_t)v21, "topAnchor");
  id v23 = sub_89BF4();
  sub_3CEA8();

  *(void *)(v14 + 32) = v1;
  id v31 = sub_32C00(v24, "bottomAnchor", v25, v26, v27, v28, v29, v30, v67);
  id v32 = sub_DDAC((uint64_t)v31, "bottomAnchor");
  id v33 = sub_89BF4();
  sub_3CEA8();

  *(void *)(v14 + 40) = v1;
  id v41 = sub_32C00(v34, "leadingAnchor", v35, v36, v37, v38, v39, v40, v68);
  id v42 = sub_DDAC((uint64_t)v41, "leadingAnchor");
  id v43 = sub_89BF4();
  sub_3CEA8();

  *(void *)(v14 + 48) = v1;
  id v51 = sub_32C00(v44, "trailingAnchor", v45, v46, v47, v48, v49, v50, v69);
  id v52 = sub_DDAC((uint64_t)v51, "trailingAnchor");
  id v53 = sub_89BF4();
  sub_3CEA8();

  *(void *)(v14 + 56) = v1;
  specialized Array._endMutation()(v54, v55);
  uint64_t v56 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  sub_DCB4(0LL, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  sub_89C04(v56, "activateConstraints:");

  sub_277AC(v58, "sendSubviewToBack:", v59, v60, v61, v62, v63, v64, (uint64_t)v70);
}

void sub_887A0()
{
  id v0 = sub_DDCC();
  [v0 setCornerRadius:30.0];

  id v1 = sub_DDCC();
  [v1 setMasksToBounds:1];
}

void sub_88814(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id v8 = sub_ED8C(a1, "layer");
  uint64_t v9 = sub_898C0(v8);
  if (!v9 || (v10 = *(void *)(v9 + 16), uint64_t v9 = swift_bridgeObjectRelease(v9), !v10))
  {
    id v11 = sub_ED8C(v9, "layer");
    [v11 removeAllAnimations];

    id v13 = sub_ED8C(v12, "layer");
    uint64_t v14 = v13;
    LODWORD(v15) = 0;
    if (!a2) {
      *(float *)&double v15 = 1.0;
    }
    [v13 setOpacity:v15];

    sub_88FBC(a1);
    int v16 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
    [v16 begin];
    uint64_t v17 = sub_1AFD0((uint64_t)&unk_CCDF0, 32LL);
    *(void *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = a3;
    *(void *)(v17 + 24) = a4;
    uint64_t v27 = v17;
    int v18 = sub_89C64((uint64_t)sub_6F768, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v25, v26);
    sub_1A920(a3, a4);
    swift_release(v27);
    [v16 setCompletionBlock:v18];
    _Block_release(v18);
    id v19 = sub_89138(a1, a2);
    id v20 = sub_ED8C((uint64_t)v19, "layer");
    sub_87D14((uint64_t)v19, 0x6E612E656C616373LL, 0xEF6E6F6974616D69LL, v20);

    double v21 = dbl_AD8B0[(char)a1];
    id v22 = sub_89354(a1);
    id v23 = sub_893B4(v22, kCAFillModeForwards, v21);
    id v24 = sub_ED8C((uint64_t)v23, "layer");
    sub_87D14((uint64_t)v23, 0xD000000000000011LL, 0x80000000000A5D00LL, v24);

    [v16 commit];
  }

_TtC6SiriTV27ConversationViewCoordinator *sub_88A94()
{
  id v1 = [v0 subviews];
  uint64_t v2 = sub_3CA48((uint64_t)v1, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  id v19 = &_swiftEmptyArrayStorage;
  if (!((unint64_t)v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
    unint64_t result = (_TtC6SiriTV27ConversationViewCoordinator *)sub_1B0E4();
    if (v4) {
      goto LABEL_3;
    }
LABEL_14:
    sub_279DC();
    return &_swiftEmptyArrayStorage;
  }

  if (v3 < 0) {
    uint64_t v15 = v3;
  }
  else {
    uint64_t v15 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_1B0E4();
  unint64_t result = (_TtC6SiriTV27ConversationViewCoordinator *)_CocoaArrayWrapper.endIndex.getter(v15);
  uint64_t v4 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = 0LL;
    unint64_t v16 = v3 & 0xC000000000000001LL;
    uint64_t v7 = v3;
    do
    {
      if (v16) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      ++v6;
      uint64_t v10 = sub_9E24((uint64_t *)&unk_DF980);
      uint64_t inited = swift_initStackObject(v10, v18);
      *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB350;
      *(void *)(inited + 32) = v9;
      uint64_t v17 = inited;
      specialized Array._endMutation()(inited, v12);
      id v13 = v9;
      uint64_t v14 = sub_88A94();
      sub_89C18(v14);

      sub_89C18(v17);
      uint64_t v3 = v7;
    }

    while (v4 != v6);
    sub_279DC();
    return v19;
  }

  return result;
}

BOOL sub_88C54(void *a1)
{
  uint64_t v2 = sub_88A94();
  char v3 = sub_8D910();
  swift_bridgeObjectRelease(v2, v4, v5, v6, v7, v8, v9, v10);
  if ((v3 & 1) == 0) {
    return 0LL;
  }
  [a1 contentOffset];
  double v12 = v11;
  double v14 = v13;
  sub_3FE08();
  if (v14 >= v15) {
    return 0LL;
  }
  sub_3FE08();
  return v12 < v16;
}

void sub_88CE4(uint64_t a1)
{
  uint64_t v2 = v1;
  [v1 bounds];
  CGImageRef v6 = (CGImageRef)objc_msgSend(objc_allocWithZone(UIGraphicsImageRenderer), "initWithSize:", v4, v5);
  uint64_t v7 = sub_1AFD0((uint64_t)&unk_CCD78, 24LL);
  *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v8 = sub_1AFD0((uint64_t)&unk_CCDA0, 32LL);
  *(void *)(v8 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_89B08;
  *(void *)(v8 + 24) = v7;
  int v28 = sub_29474;
  uint64_t v29 = v8;
  id v9 = sub_89C64((uint64_t)sub_88F88, (uint64_t)_NSConcreteStackBlock, 1107296256LL, *(uint64_t *)&v26, *(uint64_t *)&v27);
  id v10 = v2;
  swift_retain(v8);
  double v11 = -[CGImage imageWithActions:](v6, "imageWithActions:", v9, swift_release(v8).n128_f64[0]);
  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation(v8, "", 111LL, 69LL, 40LL, 1LL);
  swift_release(v8);
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    id v13 = sub_3CB1C(v12, "imageRendererFormat");
    [v13 scale];
    double v15 = v14;

    uint64_t v16 = sub_89B38(a1, (uint64_t)v25);
    double v17 = *(double *)v25;
    double v18 = *(double *)&v25[1];
    double v19 = v26;
    double v20 = v27;
    double v21 = (CGImage *)sub_3CB1C(v16, "CGImage");
    if (!v21) {
      goto LABEL_6;
    }
    id v22 = v21;
    v30.size.height = v15 * v20;
    v30.size.width = v15 * v19;
    v30.origin.y = v15 * v18;
    v30.origin.x = v15 * v17;
    CGImageRef v23 = CGImageCreateWithImageInRect(v21, v30);

    if (v23)
    {
      objc_msgSend( objc_allocWithZone(UIImage),  "initWithCGImage:scale:orientation:",  v23,  sub_3CB1C(v24, "imageOrientation"),  v15);
      swift_release(v7);

      CGImageRef v6 = v23;
    }

    else
    {
LABEL_6:
      swift_release(v7);
    }
  }

id sub_88F4C(int a1, id a2)
{
  return objc_msgSend(a2, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

void sub_88F88(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_88FBC(char a1)
{
  if (a1 != 2)
  {
    sub_89C70();
    double v2 = v1;
    sub_89C70();
    double v4 = v3;
    CGFloat v5 = v2 * 0.5;
    id v6 = sub_DDCC();
    [v6 anchorPoint];
    double v8 = v7;

    CGFloat v9 = v2 * v8;
    id v10 = sub_DDCC();
    [v10 anchorPoint];
    double v12 = v11;

    sub_89C44();
    sub_89C2C(v13, v14, v15, v16, v17, v18, v19, v20, v40);
    v42.x = v5;
    v42.y = v4;
    CGPoint v22 = CGPointApplyAffineTransform(v42, v21);
    sub_89C44();
    sub_89C2C(v23, v24, v25, v26, v27, v28, v29, v30, v41);
    v43.x = v9;
    v43.y = v4 * v12;
    CGPoint v32 = CGPointApplyAffineTransform(v43, v31);
    id v33 = sub_DDCC();
    [v33 position];
    double v35 = v34;
    double v37 = v36;

    id v38 = sub_DDCC();
    objc_msgSend(v38, "setPosition:", v22.x + v35 - v32.x, v22.y + v37 - v32.y);

    id v39 = sub_DDCC();
    objc_msgSend(v39, "setAnchorPoint:", 0.5, 1.0);
  }

id sub_89138(uint64_t a1, char a2)
{
  unint64_t v3 = a1;
  sub_3CA48(a1, &qword_E4F58, &OBJC_CLASS___CASpringAnimation_ptr);
  id v4 = sub_8951C(0x726F66736E617274LL, 0xEF656C6163732E6DLL);
  double v5 = 1.0;
  id v6 = [v4 setMass:1.0];
  if (v3 > 1)
  {
    id v14 = sub_DDAC((uint64_t)v6, "setStiffness:");
    id v15 = sub_DDAC((uint64_t)v14, "setDamping:");
    sub_DDAC((uint64_t)v15, "setInitialVelocity:");
    id v16 = v4;
    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    sub_89C04(v16, "setFromValue:");

    Class v18 = Double._bridgeToObjectiveC()().super.super.isa;
    sub_89C04(v16, "setToValue:");
  }

  else
  {
    id v7 = sub_DDAC((uint64_t)v6, "setStiffness:");
    id v8 = sub_DDAC((uint64_t)v7, "setDamping:");
    sub_DDAC((uint64_t)v8, "setInitialVelocity:");
    if (a2) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.5;
    }
    CGPoint v22 = &type metadata for Double;
    *(double *)double v21 = v9;
    if (a2) {
      double v5 = 0.5;
    }
    sub_109B4(v21, (uint64_t)&type metadata for Double);
    id v10 = v4;
    uint64_t v11 = sub_89C54();
    sub_DBAC(v21);
    sub_89C04((id)v3, "setFromValue:");

    swift_unknownObjectRelease(v11);
    CGPoint v22 = &type metadata for Double;
    *(double *)double v21 = v5;
    sub_109B4(v21, (uint64_t)&type metadata for Double);
    id v12 = (id)v3;
    uint64_t v13 = sub_89C54();
    sub_DBAC(v21);
    [(id)v3 setToValue:v13];

    swift_unknownObjectRelease(v13);
  }

  id v19 = v4;
  sub_DDAC((uint64_t)[v19 settlingDuration], "setDuration:");

  return v19;
}

id sub_89354(unsigned __int8 a1)
{
  int v1 = a1;
  id v2 = objc_allocWithZone(&OBJC_CLASS___CAMediaTimingFunction);
  if (v1 == 1)
  {
    LODWORD(v5) = 1053609165;
    LODWORD(sub_9E64(v2, v0, 1LL, v3) = 0.25;
  }

  else
  {
    LODWORD(sub_9E64(v2, v0, 1LL, v3) = 1051260355;
    LODWORD(v5) = 1059816735;
  }

  LODWORD(sub_A03C(v2, v1, v4) = 0;
  LODWORD(v6) = 1.0;
  return [v2 initWithControlPoints:v3 :v4 :v5 :v6];
}

void *sub_893B4(void *a1, NSString *a2, double a3)
{
  id v7 = v6;
  Class isa = CGFloat._bridgeToObjectiveC()().super.super.isa;
  sub_89C0C((uint64_t)isa, "setFromValue:");

  Class v9 = CGFloat._bridgeToObjectiveC()().super.super.isa;
  sub_89C0C((uint64_t)v9, "setToValue:");

  [v7 setDuration:a3];
  if (a1)
  {
    id v10 = v7;
    id v11 = a1;
  }

  else
  {
    id v12 = objc_allocWithZone(&OBJC_CLASS___CAMediaTimingFunction);
    id v13 = v7;
    LODWORD(v14) = 1051260355;
    LODWORD(v15) = 1059816735;
    LODWORD(vswift_unknownObjectWeakDestroy(v0 + 16) = 0;
    LODWORD(v17) = 1.0;
    id v11 = [v12 initWithControlPoints:v14 :v16 :v15 :v17];
  }

  sub_89C0C((uint64_t)a1, "setTimingFunction:");

  if (a2) {
    Class v18 = a2;
  }
  else {
    Class v18 = kCAFillModeForwards;
  }
  id v19 = a2;
  sub_89C04(v7, "setFillMode:");

  return v7;
}

id sub_8951C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [(id)swift_getObjCClassFromMetadata(v2) animationWithKeyPath:v4];

  return v5;
}

uint64_t sub_89588(uint64_t a1)
{
  return sub_89684(a1, (unint64_t *)sub_107D4, &qword_E4F68, &qword_E4F60, (uint64_t *)sub_655B8);
}

void sub_895AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_F8D4(isUniquelyReferenced_nonNull_native, v8, 1LL, v3);
    uint64_t v3 = v9;
  }

  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  uint64_t v10 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  sub_1072C(a1 + 32, v2, v3 + 40 * v10 + 32);
  if (!v2)
  {
LABEL_14:
    sub_A470();
    *int v1 = v3;
    return;
  }

  uint64_t v11 = *(void *)(v3 + 16);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = v13;
    goto LABEL_14;
  }

uint64_t sub_89684(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v25 = a1;
    }
    else {
      uint64_t v25 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v25);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v12 = *v5;
  if ((unint64_t)*v5 >> 62)
  {
    if (v12 < 0) {
      uint64_t v26 = *v5;
    }
    else {
      uint64_t v26 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_861A4();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v12);
  }

  else
  {
    uint64_t v13 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v14 = v13 + v11;
  if (__OFADD__(v13, v11))
  {
    __break(1u);
    goto LABEL_30;
  }

  uint64_t v12 = *v5;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v5);
  *uint64_t v5 = v12;
  uint64_t v13 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v12 & 0x8000000000000000LL) == 0
    && (v12 & 0x4000000000000000LL) == 0)
  {
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v13 = 1LL;
  }

  uint64_t v28 = v11;
  uint64_t v11 = (uint64_t)a2;
  a2 = a3;
  a3 = (unint64_t *)a4;
  a4 = a5;
  uint64_t v17 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    if (v17 <= v14) {
      uint64_t v17 = v14;
    }
    sub_861A4();
    uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v13,  v17,  1LL,  v12);
    swift_bridgeObjectRelease(*v5);
    *uint64_t v5 = v12;
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFFF8LL;
    a5 = a4;
    a4 = (uint64_t *)a3;
    a3 = a2;
    a2 = (unint64_t *)v11;
    uint64_t v11 = v28;
LABEL_16:
    uint64_t result = sub_89968( v16 + 8LL * *(void *)(v16 + 16) + 32,  (*(void *)(v16 + 24) >> 1) - *(void *)(v16 + 16),  a1,  (void (*)(uint64_t, void, uint64_t))a2,  a3,  a4,  (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))a5);
    if (v19 >= v11) {
      break;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    if (v12 < 0) {
      uint64_t v27 = v12;
    }
    else {
      uint64_t v27 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_861A4();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v12);
  }

  if (v19 < 1) {
    goto LABEL_20;
  }
  uint64_t v20 = *(void *)((char *)&dword_10 + (*v5 & 0xFFFFFFFFFFFFFF8LL));
  BOOL v21 = __OFADD__(v20, v19);
  uint64_t v22 = v20 + v19;
  if (!v21)
  {
    *(void *)((char *)&dword_10 + (*v5 & 0xFFFFFFFFFFFFFF8LL)) = v22;
LABEL_20:
    uint64_t v23 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v23, v24);
  }

  __break(1u);
  return result;
}

void sub_89884(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a3 _setGroupName:v4];
  sub_DCEC(v4);
}

uint64_t sub_898C0(void *a1)
{
  id v2 = [a1 animationKeys];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);

  return v3;
}

void sub_89920(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setAccessibilityIdentifier:v5];
  sub_DCEC(v5);
}

uint64_t sub_89968( uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void, uint64_t), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = result;
  unint64_t v14 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v24 = a3;
    }
    else {
      uint64_t v24 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_1B0E4();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v24);
    uint64_t result = sub_A470();
    if (!v15) {
      return a3;
    }
  }

  else
  {
    uint64_t v15 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
    if (!v15) {
      return a3;
    }
  }

  if (v13)
  {
    if (v14)
    {
      if (a3 < 0) {
        uint64_t v16 = a3;
      }
      else {
        uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
      }
      sub_1B0E4();
      uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v16);
      uint64_t result = sub_A470();
      if (v17 <= a2)
      {
        if (v15 >= 1)
        {
          uint64_t v18 = sub_89BAC(a5, a6);
          sub_1B0E4();
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            uint64_t v20 = sub_9E24(a6);
            BOOL v21 = (void (*)(_BYTE *, void))a7(v25, i, a3, v20, v18);
            id v23 = *v22;
            v21(v25, 0LL);
            *(void *)(v13 + 8 * i) = v23;
          }

          sub_A470();
          return a3;
        }

        goto LABEL_22;
      }
    }

    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL)) <= a2)
      {
        a4((a3 & 0xFFFFFFFFFFFFFF8LL) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL)), v13);
        return a3;
      }

      __break(1u);
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_89AE4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_89B08(int a1)
{
  return sub_88F4C(a1, *(id *)(v1 + 16));
}

uint64_t sub_89B10()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_89B20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_89B30(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_89B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9E24(&qword_E4F50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_89B80()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_89BAC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_1A990(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

id sub_89BF4()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 3120), v1);
}

id sub_89C04(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

id sub_89C0C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_89C18(uint64_t a1)
{
  return sub_89684(a1, v1, v2, v3, v4);
}

double sub_89C2C( double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a9;
}

id sub_89C44()
{
  return [v1 *(SEL *)(v0 + 3424)];
}

uint64_t sub_89C54()
{
  return _bridgeAnythingToObjectiveC<A>(_:)(v1, v0);
}

void *sub_89C64@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

id sub_89C70()
{
  return [v1 *(SEL *)(v0 + 696)];
}

id sub_89C7C()
{
  uint64_t v1 = qword_E4F70;
  uint64_t v2 = *(void **)(v0 + qword_E4F70);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_E4F70);
  }

  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(SUICOrbView), "initWithFrame:", 0.0, 0.0, 300.0, 300.0);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + sub_A068(v0, v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0LL;
  }

  id v6 = v2;
  return v3;
}

void sub_89D14()
{
  id v2 = sub_89C7C();
  [v0 addSubview:v2];

  id v3 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v4 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v5 = sub_1AFD0(v4, 64LL);
  *(_OWORD *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB340;
  id v6 = [sub_89C7C() bottomAnchor];
  sub_276A0();
  id v8 = sub_ED8C(v7, "bottomAnchor");
  id v9 = sub_DDC0((uint64_t)v8, "constraintEqualToAnchor:constant:");
  sub_279D4();

  *(void *)(v5 + 32) = &off_D9000;
  id v10 = [sub_89C7C() widthAnchor];
  sub_276A0();
  id v12 = sub_ED8C(v11, "widthAnchor");
  id v13 = [v1 constraintEqualToAnchor:v12];
  sub_279D4();

  *(void *)(v5 + 40) = &off_D9000;
  id v14 = [sub_89C7C() trailingAnchor];
  sub_276A0();
  id v16 = sub_ED8C(v15, "trailingAnchor");
  id v17 = sub_DDC0((uint64_t)v16, "constraintEqualToAnchor:constant:");
  sub_279D4();

  *(void *)(v5 + 48) = &off_D9000;
  id v18 = [sub_89C7C() heightAnchor];
  sub_276A0();
  id v20 = sub_ED8C(v19, "heightAnchor");
  id v21 = [v1 constraintEqualToAnchor:v20];

  *(void *)(v5 + 56) = v21;
  specialized Array._endMutation()(v22, v23);
  sub_DCB4(0LL, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v5, v24, v25, v26, v27, v28, v29, v30);
  [v3 activateConstraints:isa];
}

double sub_89F68()
{
  uint64_t v38 = sub_9E24(&qword_E5148);
  uint64_t v39 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  sub_A118();
  uint64_t v36 = v1;
  uint64_t v40 = sub_9E24(&qword_E5150);
  uint64_t v41 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  sub_A118();
  uint64_t v37 = v2;
  uint64_t v3 = sub_9E24(&qword_E0B30);
  __chkstk_darwin(v3);
  sub_A1F8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_9E24(&qword_E5158);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_A1F8();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_9E24(&qword_E5160);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_A1F8();
  uint64_t v16 = v15 - v14;
  uint64_t v35 = qword_E3F38;
  uint64_t v17 = *(void *)(v0 + qword_E3F38);
  sub_AAD4(v17 + OBJC_IVAR____TtC6SiriTV15StatusViewModel__siriStateEvent, (uint64_t)v42);
  swift_retain(v17);
  uint64_t v18 = sub_9E24(&qword_DF7B8);
  Published.projectedValue.getter(v18);
  sub_3CB90();
  swift_release(v17);
  uint64_t v19 = sub_DCB4(0LL, (unint64_t *)&qword_E0540, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v42[0] = (id)static OS_dispatch_queue.main.getter(v19);
  uint64_t v34 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
  sub_9E64(v6, 1LL, 1LL, v34);
  uint64_t v20 = sub_27494(&qword_E5168, &qword_E5158, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  sub_27320();
  Publisher.receive<A>(on:options:)(v42, v6, v7, v19, v20);
  sub_27370(v6);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  uint64_t v21 = sub_1AFD0((uint64_t)&unk_CCE40, 24LL);
  swift_unknownObjectWeakInit(v21 + 16);
  sub_27494(&qword_E5170, &qword_E5160, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  uint64_t v22 = Publisher<>.sink(receiveValue:)(sub_8ADE4);
  __n128 v23 = swift_release(v21);
  (*(void (**)(uint64_t, uint64_t, __n128))(v13 + 8))(v16, v12, v23);
  uint64_t v24 = v33 + qword_E3F40;
  sub_AAD4(v33 + qword_E3F40, (uint64_t)v42);
  AnyCancellable.store(in:)(v24);
  sub_3CB90();
  swift_release(v22);
  uint64_t v25 = *(void *)(v33 + v35);
  sub_AAD4(v25 + OBJC_IVAR____TtC6SiriTV15StatusViewModel__powerLevel, (uint64_t)v42);
  swift_retain(v25);
  uint64_t v26 = sub_9E24(&qword_DF7C0);
  Published.projectedValue.getter(v26);
  sub_3CB90();
  swift_release(v25);
  v42[0] = (id)static OS_dispatch_queue.main.getter(v27);
  sub_9E64(v6, 1LL, 1LL, v34);
  uint64_t v28 = sub_27494(&qword_E5178, &qword_E5148, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  Publisher.receive<A>(on:options:)(v42, v6, v38, v19, v28);
  sub_27370(v6);

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v36, v38);
  uint64_t v29 = sub_1AFD0((uint64_t)&unk_CCE40, 24LL);
  swift_unknownObjectWeakInit(v29 + 16);
  sub_27494(&qword_E5180, &qword_E5150, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  uint64_t v30 = Publisher<>.sink(receiveValue:)(sub_8ADEC);
  __n128 v31 = swift_release(v29);
  (*(void (**)(uint64_t, uint64_t, __n128))(v41 + 8))(v37, v40, v31);
  sub_AAD4(v24, (uint64_t)v42);
  AnyCancellable.store(in:)(v24);
  sub_3CB90();
  *(void *)&double result = swift_release(v30).n128_u64[0];
  return result;
}

void sub_8A3D0(unint64_t *a1, uint64_t a2)
{
  unint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v12, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    uint64_t v7 = (char *)Strong;
    unint64_t v8 = sub_4B4BC(v4, v3);
    if (v8 != 6)
    {
      if (*(_BYTE *)(*(void *)&v7[qword_E3F38] + OBJC_IVAR____TtC6SiriTV15StatusViewModel_dismissOnFinish) == 1
        && v3 == 6)
      {
        uint64_t v10 = swift_allocObject(&unk_CCE68, 32LL, 7LL);
        *(void *)(v10 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
        *(void *)(v10 + 24) = v7;
        swift_retain(a2);
        uint64_t v11 = v7;
        sub_8A74C(4LL, (void (*)(uint64_t))sub_8AE20, v10);
        swift_release(v10);
      }

      else
      {
        sub_8A74C(v8, 0LL, 0LL);
      }
    }
  }

void sub_8A4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v15, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    uint64_t v6 = swift_weakLoadStrong(Strong + qword_E3F50);

    if (v6)
    {
      uint64_t v7 = sub_9A1BC();
      swift_release(v6);
      if (v7)
      {
        uint64_t v8 = type metadata accessor for StatusViewController(0LL);
        uint64_t v9 = (void *)swift_dynamicCastClass(v7, v8);
        if (v9)
        {
          id v10 = [v9 parentViewController];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = type metadata accessor for CompactMainViewController(0LL);
            uint64_t v13 = swift_dynamicCastClass(v11, v12);
            if (v13)
            {
              uint64_t v14 = swift_weakLoadStrong(v13 + qword_E2360);

              if (v14)
              {
                sub_12070(1LL, 1LL, 0LL, 0LL);
                swift_release(v14);
              }
            }

            else
            {
            }
          }

          *(_BYTE *)(*(void *)(a2 + qword_E3F38) + OBJC_IVAR____TtC6SiriTV15StatusViewModel_dismissOnFinish) = 0;
        }

        else
        {
        }
      }
    }
  }

void sub_8A614(float *a1, uint64_t a2)
{
  float v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_8A674(Strong, v2);
  }

void sub_8A674(uint64_t a1, float a2)
{
  if (*(_BYTE *)(v2 + qword_E9AB0) == 2)
  {
    os_log_t oslog = (os_log_t)sub_89C7C();
    *(float *)&double v4 = a2;
    -[os_log_s setPowerLevel:](oslog, "setPowerLevel:", v4);
  }

  else
  {
    os_log_t oslog = (os_log_t)Logger.logObject.getter(a1);
    os_log_type_t v5 = static os_log_type_t.error.getter(oslog);
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, oslog, v5, "Trying to set power level when mode is not Listening, Returning", v6, 2u);
      swift_slowDealloc(v6, -1LL, -1LL);
    }
  }
}

uint64_t sub_8A74C(uint64_t result, void (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned __int8 *)(v3 + qword_E9AB0) != result)
  {
    uint64_t v7 = result;
    *(_BYTE *)(v3 + qword_E9AB0) = result;
    uint64_t v8 = sub_1AFD0((uint64_t)&unk_CCEB8, 32LL);
    *(void *)(v8 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
    *(void *)(v8 + 24) = a3;
    __asm { BR              X9 }
  }

  if (a2)
  {
    uint64_t v6 = swift_retain(a3);
    a2(v6);
    return sub_1A7D0((uint64_t)a2, a3);
  }

  return result;
}

uint64_t sub_8A99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v21 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_DCB4(0LL, (unint64_t *)&qword_E0540, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject(&unk_CCF08, 32LL, 7LL);
  *(void *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_8AE78;
  uint64_t v23 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_6F768;
  void aBlock[3] = &unk_CCF20;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = v23;
  sub_1A920(a1, a2);
  uint64_t v15 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v15);
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v16 = sub_739A0();
  uint64_t v17 = sub_9E24((uint64_t *)&unk_E4680);
  uint64_t v18 = sub_27494( (unint64_t *)&qword_E0350,  (uint64_t *)&unk_E4680,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v4, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_8ABA0(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (void (*)(uint64_t))result;
    uint64_t v4 = swift_retain(a2);
    v3(v4);
    return sub_1A7D0((uint64_t)v3, a2);
  }

  return result;
}

uint64_t sub_8ABDC(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)(v2 + qword_E9AB0))
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_1AFD0((uint64_t)&unk_CCE90, 32LL);
    *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
    *(void *)(v5 + 24) = a2;
    sub_1A920(v4, a2);
    sub_8A74C(4LL, (void (*)(uint64_t))sub_8AE48, v5);
    return swift_release(v5);
  }

  return result;
}

uint64_t sub_8AC60(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (void (*)(uint64_t))result;
    swift_retain(a2);
    v3(1LL);
    return sub_1A7D0((uint64_t)v3, a2);
  }

  return result;
}

void sub_8ACA0()
{
}

id sub_8ACB0()
{
  id v1 = sub_89C7C();
  [v1 invalidate];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for StatusView(0LL);
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_8AD04(void *a1)
{
  id v1 = a1;
  return sub_8ACB0();
}

void sub_8AD28(uint64_t a1)
{
}

uint64_t type metadata accessor for StatusView(uint64_t a1)
{
  uint64_t result = qword_E4FA0;
  if (!qword_E4FA0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StatusView);
  }
  return result;
}

uint64_t sub_8AD70(uint64_t a1)
{
  v2[0] = &unk_AD908;
  v2[1] = &unk_AD920;
  return swift_initClassMetadata2(a1, 256LL, 2LL, v2, a1 + 272);
}

uint64_t sub_8ADB8()
{
  return type metadata accessor for StatusView(0LL);
}

uint64_t sub_8ADC0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_8ADE4(unint64_t *a1)
{
}

void sub_8ADEC(float *a1)
{
}

uint64_t sub_8ADF4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_8AE20()
{
}

uint64_t sub_8AE28()
{
  *(_BYTE *)(v0 + qword_E9AB0) = 0;
  *(void *)(v0 + qword_E4F70) = 0LL;
  return sub_34A8C();
}

uint64_t sub_8AE48()
{
  return sub_8AC60(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_8AE54()
{
  return sub_8A99C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_8AE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_8AE6C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_8AE78()
{
  return sub_8ABA0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

id sub_8AE88()
{
  return sub_89C7C();
}

id sub_8AEA0(void *a1)
{
  return [a1 *(SEL *)(v1 + 88)];
}

uint64_t sub_8AEAC()
{
  return sub_8A99C(v1, v0);
}

id sub_8AEB8()
{
  if (!v2) {
    return v34;
  }
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  uint64_t v5 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000LL) == 0) {
    uint64_t v5 = v1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5 || (uint64_t v6 = sub_5ACFC(v34)) == 0)
  {
LABEL_28:
    sub_A470();
    return v34;
  }

  unint64_t v7 = v6;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 >= 0) {
      uint64_t v31 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v31 = v6;
    }
    swift_bridgeObjectRetain(v6);
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter(v31);
    sub_A1C8();
    if (v32 == 1)
    {
      swift_bridgeObjectRetain(v7);
      uint64_t v33 = _CocoaArrayWrapper.endIndex.getter(v31);
      sub_A1C8();
      if (v33) {
        goto LABEL_8;
      }
    }

    goto LABEL_27;
  }

  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8LL)) != 1LL)
  {
LABEL_27:
    sub_A1C8();
    goto LABEL_28;
  }

void sub_8B1A4(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

unint64_t sub_8B1FC()
{
  unint64_t result = qword_E3058;
  if (!qword_E3058)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SASportsMetadataGroup);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_E3058);
  }

  return result;
}

uint64_t sub_8B238(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t AFPineBoardSystemState.description.getter(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = 0xD000000000000011LL;
  switch(a1)
  {
    case 0LL:
      uint64_t result = 0x6669636570736E55LL;
      break;
    case 1LL:
      uint64_t result = 0x656B617741LL;
      break;
    case 2LL:
      return result;
    case 3LL:
      uint64_t v7 = 0x6974696C6948LL;
      goto LABEL_8;
    case 4LL:
      uint64_t result = 0xD000000000000016LL;
      break;
    case 5LL:
      uint64_t result = 0x53206E6565726353LL;
      break;
    case 6LL:
      uint64_t v7 = 0x697065656C53LL;
LABEL_8:
      uint64_t result = v7 & 0xFFFFFFFFFFFFLL | 0x676E000000000000LL;
      break;
    case 7LL:
      uint64_t result = 0x7065656C7341LL;
      break;
    case 8LL:
      uint64_t result = 0x676E696B617741LL;
      break;
    default:
      if (!AFSiriLogContextConnection)
      {
        __break(1u);
        JUMPOUT(0x8B490LL);
      }

      uint64_t v8 = Logger.init(_:)(AFSiriLogContextConnection);
      uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v11 = 134217984;
        uint64_t v13 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v11 + 4, v11 + 12);
        _os_log_impl(&dword_0, v9, v10, "Received unknown AFPineBoardSystemState - %ld", v11, 0xCu);
        swift_slowDealloc(v11, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t result = 0x6E776F6E6B6E55LL;
      break;
  }

  return result;
}

uint64_t sub_8B4B4()
{
  return AFPineBoardSystemState.description.getter(*v0);
}

uint64_t MRContentItemMediaSubType.description.getter(unint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin();
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1 < 8) {
    return *(void *)&aNone_2[8 * a1];
  }
  if (AFSiriLogContextConnection)
  {
    uint64_t v7 = Logger.init(_:)(AFSiriLogContextConnection);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)os_log_type_t v10 = 134217984;
      unint64_t v12 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v10 + 4, v10 + 12);
      _os_log_impl(&dword_0, v8, v9, "Received unknown MRContentItemMediaSubType - %ld", v10, 0xCu);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0x6E776F6E6B6E55LL;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_8B62C()
{
  return MRContentItemMediaSubType.description.getter(*v0);
}

uint64_t sub_8B634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = 0LL;
  v3[3] = &_swiftEmptyArrayStorage;
  v3[4] = 0LL;
  v3[6] = 0LL;
  uint64_t result = swift_unknownObjectWeakInit(v3 + 5, 0LL);
  v3[7] = 0LL;
  if (AFSiriLogContextConnection)
  {
    Logger.init(_:)(AFSiriLogContextConnection);
    uint64_t v8 = (void *)v3[7];
    v3[7] = a1;

    v3[6] = a3;
    swift_unknownObjectWeakAssign(v3 + 5, a2);
    swift_unknownObjectRelease(a2);
    return (uint64_t)v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_8B6E4()
{
  sub_ADC4(v0 + 40);
  uint64_t v1 = v0 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return v0;
}

void sub_8B750(uint64_t a1)
{
  uint64_t v3 = sub_8BA80();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 136))(a1, ObjectType, v5);
    sub_8BA74(v4);
  }

  else
  {
    sub_ADE8();
  }

uint64_t sub_8B7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_8BA80();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 152))(a1, a2, a3, ObjectType, v9);
    return swift_unknownObjectRelease(v8);
  }

  return result;
}

uint64_t sub_8B824(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (a3) {
    return a3(0LL);
  }
  return result;
}

void sub_8B84C()
{
  uint64_t v1 = sub_8BA80();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v3 + 160))(ObjectType, v3);
    sub_8BA74(v2);
  }

  else
  {
    sub_ADE8();
  }

uint64_t sub_8B894(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return sub_8BA04(a1, v2, ObjectType, a2);
}

uint64_t sub_8B8D0()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_8B8F4()
{
  return type metadata accessor for BaseCoordinator(0LL);
}

uint64_t type metadata accessor for BaseCoordinator(uint64_t a1)
{
  uint64_t result = qword_E51B0;
  if (!qword_E51B0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BaseCoordinator);
  }
  return result;
}

uint64_t sub_8B934(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[2] = "\b";
  v4[3] = &unk_ADAA0;
  v4[4] = "\b";
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[5] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_8B9C8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304LL))();
}

uint64_t sub_8B9D4()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280LL))();
}

uint64_t sub_8B9E0()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296LL))();
}

uint64_t sub_8B9EC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312LL))();
}

uint64_t sub_8B9F8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320LL))();
}

uint64_t sub_8BA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong(a2 + 40);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)(a2 + 48);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 168))(a1, a4, ObjectType, v9);
    return swift_unknownObjectRelease(v8);
  }

  return result;
}

uint64_t sub_8BA74(uint64_t a1)
{
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_8BA80()
{
  return swift_unknownObjectWeakLoadStrong(v0 + 40);
}

void sub_8BA88(char a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  __chkstk_darwin(v2);
  sub_A1F8();
  __asm { BR              X10 }

void sub_8BAFC()
{
  if (qword_DEDE8 != -1) {
    swift_once(&qword_DEDE8, sub_8BE60);
  }
  *(_BYTE *)(v1 - 88) = v0 & 1;
  sub_1ADD8();
  CurrentValueSubject.send(_:)(v1 - 88);
  sub_1ADD0();
  sub_A174();
}

void sub_8BD30()
{
  if (qword_DEDE8 != -1) {
    swift_once(&qword_DEDE8, sub_8BE60);
  }
  char v6 = 0;
  sub_1ADD8();
  CurrentValueSubject.send(_:)(&v6);
  sub_1ADD0();
  char v5 = 0;
  sub_1ADD8();
  CurrentValueSubject.send(_:)(&v5);
  sub_1ADD0();
  char v4 = 0;
  sub_1ADD8();
  CurrentValueSubject.send(_:)(&v4);
  uint64_t v0 = sub_1ADD0();
  uint64_t v1 = (os_log_s *)Logger.logObject.getter(v0);
  os_log_type_t v2 = static os_log_type_t.debug.getter(v1);
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "#tv  #idleTimer DismissalSignals reset", v3, 2u);
    sub_A15C((uint64_t)v3);
  }
}

void sub_8BE60()
{
  uint64_t v0 = type metadata accessor for DismissalSignals(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  sub_8BE9C();
  qword_E9AC0 = v1;
}

void sub_8BE9C()
{
  if (AFSiriLogContextConnection)
  {
    Logger.init(_:)(AFSiriLogContextConnection);
    uint64_t v1 = OBJC_IVAR____TtC6SiriTV16DismissalSignals_canonicalDisplaying;
    char v8 = 0;
    uint64_t v2 = sub_9E24(&qword_E5418);
    swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
    *(void *)(v0 + sub_A068(v0, v1) = CurrentValueSubject.init(_:)(&v8);
    uint64_t v3 = OBJC_IVAR____TtC6SiriTV16DismissalSignals_airpodsInvocation;
    char v7 = 0;
    swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
    *(void *)(v0 + sub_9E64(v2, v0, 1LL, v3) = CurrentValueSubject.init(_:)(&v7);
    uint64_t v4 = OBJC_IVAR____TtC6SiriTV16DismissalSignals_typeToSiri;
    char v6 = 0;
    swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
    *(void *)(v0 + sub_A03C(v2, v1, v4) = CurrentValueSubject.init(_:)(&v6);
    if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000LL) != 0
      && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
    {
      char v5 = sub_8C9B4((unint64_t)&_swiftEmptyArrayStorage);
    }

    else
    {
      char v5 = &_swiftEmptySetSingleton;
    }

    *(void *)(v0 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_subscriptions) = v5;
    sub_8BFD4();
  }

  else
  {
    __break(1u);
  }

void sub_8BFD4()
{
  uint64_t v1 = v0;
  uint64_t v47 = *v0;
  uint64_t v2 = sub_9E24(&qword_E0B30);
  __chkstk_darwin(v2);
  sub_A1F8();
  uint64_t v5 = v4 - v3;
  uint64_t v41 = sub_9E24(&qword_E5438);
  uint64_t v44 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  sub_A1F8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_9E24(&qword_E5440);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  uint64_t v46 = v10;
  __chkstk_darwin(v9);
  sub_A1F8();
  uint64_t v40 = v12 - v11;
  uint64_t v13 = sub_9E24(&qword_E5448);
  uint64_t v43 = *(void *)(v13 - 8);
  uint64_t v14 = v43;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v40 - v18;
  v48[0] = *(id *)((char *)v0 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_airpodsInvocation);
  uint64_t v49 = *(void *)((char *)v0 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_typeToSiri);
  swift_retain(v48[0]);
  sub_1ADD8();
  uint64_t v20 = sub_9E24(&qword_E5418);
  sub_8CCC8(&qword_E5450, &qword_E5418);
  uint64_t v22 = v21;
  CGPoint v42 = v19;
  Publishers.CombineLatest.init(_:_:)(v48, &v49, v20, v20, v22, v22);
  v48[0] = *(id *)((char *)v1 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_canonicalDisplaying);
  id v23 = v48[0];
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  sub_8CCC8(&qword_E5458, &qword_E5448);
  uint64_t v25 = v24;
  swift_retain(v23);
  uint64_t v26 = v17;
  uint64_t v27 = v13;
  Publishers.CombineLatest.init(_:_:)(v48, v26, v20, v13, v22, v25);
  unint64_t v28 = sub_8CC08();
  v48[0] = (id)static OS_dispatch_queue.main.getter();
  uint64_t v29 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
  sub_9E64(v5, 1LL, 1LL, v29);
  sub_8CCC8(&qword_E5460, &qword_E5438);
  uint64_t v31 = v30;
  sub_8CC44((unint64_t *)&qword_E0B60, (uint64_t (*)(uint64_t))sub_8CC08);
  uint64_t v33 = v40;
  uint64_t v32 = v41;
  Publisher.receive<A>(on:options:)(v48, v5, v41, v28, v31, v34);
  sub_27370(v5);

  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v8, v32);
  uint64_t v35 = swift_allocObject(&unk_CD078, 24LL, 7LL);
  swift_weakInit(v35 + 16, v1);
  uint64_t v36 = swift_allocObject(&unk_CD0A0, 32LL, 7LL);
  uint64_t v37 = v47;
  *(void *)(v36 + swift_unknownObjectWeakDestroy(v0 + 16) = v35;
  *(void *)(v36 + 24) = v37;
  sub_8CCC8(&qword_E5468, &qword_E5440);
  uint64_t v38 = v45;
  Publisher<>.sink(receiveValue:)(sub_8CCC0, v36, v45);
  swift_release(v36);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v33, v38);
  uint64_t v39 = (char *)v1 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_subscriptions;
  swift_beginAccess(v39, v48, 33LL, 0LL);
  AnyCancellable.store(in:)(v39);
  swift_endAccess(v48);
  sub_1ADD0();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v27);
  sub_A174();
}

void sub_8C398(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = a1[2];
  uint64_t v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v28, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v5);
  if (Strong)
  {
    uint64_t v7 = Strong;
    int v25 = v4;
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(Strong);
    os_log_type_t v9 = static os_log_type_t.debug.getter(v8);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v11 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v27 = v11;
      LOBYTE(v26) = v2;
      BYTE1(v26) = v3;
      BYTE2(v26) = v25;
      uint64_t v12 = sub_9E24(&qword_E5470);
      uint64_t v13 = String.init<A>(describing:)(&v26, v12);
      unint64_t v15 = v14;
      uint64_t v26 = sub_CC88(v13, v14, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease(v15);
      _os_log_impl( &dword_0,  v8,  v9,  "#tv #idleTimer (canonicalDisplaying, (airpodsInvocation, typeToSiri)): %s",  v10,  0xCu);
      swift_arrayDestroy(v11, 1LL);
      swift_slowDealloc(v11, -1LL, -1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    if (v2)
    {
      if (qword_DEDF0 != -1) {
        uint64_t v16 = swift_once(&qword_DEDF0, sub_8C800);
      }
      double v17 = *(double *)&qword_E9AC8;
    }

    else
    {
      double v17 = 60.0;
      if (v25) {
        double v17 = 300.0;
      }
      if (v3) {
        double v17 = 30.0;
      }
    }

    qword_E5320 = *(void *)&v17;
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v21 = swift_slowAlloc(32LL, -1LL);
      uint64_t v27 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v22 = Double.description.getter(*(double *)&qword_E5320);
      unint64_t v24 = v23;
      uint64_t v26 = sub_CC88(v22, v23, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v24);
      _os_log_impl(&dword_0, v18, v19, "#tv #idleTimer dismissalTime: %s", v20, 0xCu);
      swift_arrayDestroy(v21, 1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    swift_release(v7);
  }

void sub_8C69C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  sub_1B290(OBJC_IVAR____TtC6SiriTV16DismissalSignals_canonicalDisplaying);
  sub_1B290(OBJC_IVAR____TtC6SiriTV16DismissalSignals_airpodsInvocation);
  sub_1B290(OBJC_IVAR____TtC6SiriTV16DismissalSignals_typeToSiri);
  swift_bridgeObjectRelease( *(_TtC6SiriTV27ConversationViewCoordinator **)(v0 + OBJC_IVAR____TtC6SiriTV16DismissalSignals_subscriptions),  v3,  v4,  v5,  v6,  v7,  v8,  v9);
  sub_6518();
}

uint64_t sub_8C710()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_8C734()
{
  return type metadata accessor for DismissalSignals(0LL);
}

uint64_t type metadata accessor for DismissalSignals(uint64_t a1)
{
  uint64_t result = qword_E5350;
  if (!qword_E5350) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DismissalSignals);
  }
  return result;
}

uint64_t sub_8C774(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void sub_8C800()
{
  qword_E9AC8 = 0x7FF0000000000000LL;
}

uint64_t sub_8C810(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptySetSingleton;
    goto LABEL_25;
  }

  sub_9E24(&qword_E3050);
  uint64_t result = sub_8CD20();
  unint64_t v3 = (_BYTE *)result;
  uint64_t v26 = *(void *)(a1 + 16);
  if (!v26)
  {
LABEL_25:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v3;
  }

  unint64_t v4 = 0LL;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    id v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    Hasher.init(_seed:)(v27);
    swift_bridgeObjectRetain(v7);
    String.hash(into:)(v27, v8, v7);
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1LL << v3[32];
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1LL << v10;
    if (((1LL << v10) & v12) != 0)
    {
      uint64_t v14 = *((void *)v3 + 6);
      unint64_t v15 = (uint64_t *)(v14 + 16 * v10);
      uint64_t v16 = v15[1];
      BOOL v17 = *v15 == v8 && v16 == v7;
      if (v17 || (uint64_t result = sub_8CD10(*v15, v16), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = sub_A1C8();
        goto LABEL_22;
      }

      uint64_t v18 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v18;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1LL << v10;
        if ((v12 & (1LL << v10)) == 0) {
          break;
        }
        os_log_type_t v19 = (uint64_t *)(v14 + 16 * v10);
        uint64_t v20 = v19[1];
        if (*v19 != v8 || v20 != v7)
        {
          uint64_t result = sub_8CD10(*v19, v20);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_11;
      }
    }

    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v22 = (void *)(*((void *)v3 + 6) + 16 * v10);
    *uint64_t v22 = v8;
    v22[1] = v7;
    uint64_t v23 = *((void *)v3 + 2);
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_27;
    }
    *((void *)v3 + 2) = v25;
LABEL_22:
    if (++v4 == v26) {
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_8C9B4(unint64_t a1)
{
  unint64_t v2 = a1;
  uint64_t v3 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v1 = *(void **)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (!v1) {
    goto LABEL_25;
  }
LABEL_3:
  sub_9E24(&qword_E5420);
  unint64_t v4 = (void *)sub_8CD20();
  if (v3)
  {
    while (1)
    {
      sub_8CCFC();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v1);
      sub_A1C8();
      if (!v3) {
        break;
      }
LABEL_5:
      unint64_t v5 = 0LL;
      id v6 = (char *)(v4 + 7);
      unint64_t v27 = v2;
      unint64_t v28 = v2 & 0xC000000000000001LL;
      unint64_t v24 = v2 + 32;
      uint64_t v25 = v2 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v26 = v3;
      while (1)
      {
        if (v28)
        {
          uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v27);
        }

        else
        {
          if (v5 >= *(void *)(v25 + 16)) {
            goto LABEL_23;
          }
          uint64_t v7 = swift_retain(*(void *)(v24 + 8 * v5));
        }

        BOOL v8 = __OFADD__(v5++, 1LL);
        if (v8) {
          break;
        }
        uint64_t v29 = v7;
        uint64_t v31 = v7;
        uint64_t v9 = v4[5];
        uint64_t v10 = type metadata accessor for AnyCancellable(0LL);
        sub_8CC44(&qword_E5428, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable);
        uint64_t v1 = &v31;
        uint64_t v12 = dispatch thunk of Hashable._rawHashValue(seed:)(v9, v10, v11);
        uint64_t v13 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v2 = v12 & ~v13;
        unint64_t v14 = v2 >> 6;
        uint64_t v15 = *(void *)&v6[8 * (v2 >> 6)];
        uint64_t v16 = 1LL << v2;
        if (((1LL << v2) & v15) != 0)
        {
          uint64_t v17 = ~v13;
          sub_8CC44(&qword_E5430, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable);
          uint64_t v19 = v18;
          while (1)
          {
            uint64_t v30 = *(void *)(v4[6] + 8 * v2);
            uint64_t v1 = (void *)v10;
            if ((dispatch thunk of static Equatable.== infix(_:_:)(&v30, &v31, v10, v19) & 1) != 0) {
              break;
            }
            unint64_t v2 = (v2 + 1) & v17;
            unint64_t v14 = v2 >> 6;
            uint64_t v15 = *(void *)&v6[8 * (v2 >> 6)];
            uint64_t v16 = 1LL << v2;
            if ((v15 & (1LL << v2)) == 0)
            {
              uint64_t v3 = v26;
              goto LABEL_16;
            }
          }

          swift_release(v29);
          uint64_t v3 = v26;
        }

        else
        {
LABEL_16:
          *(void *)&v6[8 * v14] = v16 | v15;
          *(void *)(v4[6] + 8 * v2) = v29;
          uint64_t v20 = v4[2];
          BOOL v8 = __OFADD__(v20, 1LL);
          uint64_t v21 = v20 + 1;
          if (v8) {
            goto LABEL_22;
          }
          v4[2] = v21;
        }

        if (v5 == v3)
        {
          unint64_t v22 = v27;
          goto LABEL_28;
        }
      }

      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      sub_8CCFC();
      uint64_t v1 = (void *)_CocoaArrayWrapper.endIndex.getter(v1);
      sub_A1C8();
      if (v1) {
        goto LABEL_3;
      }
LABEL_25:
      unint64_t v4 = &_swiftEmptySetSingleton;
      if (!v3) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    if (v3) {
      goto LABEL_5;
    }
  }

  unint64_t v22 = v2;
LABEL_28:
  swift_bridgeObjectRelease(v22);
  return v4;
}

unint64_t sub_8CC08()
{
  unint64_t result = qword_E0540;
  if (!qword_E0540)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_E0540);
  }

  return result;
}

void sub_8CC44(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_8CD30(v3), a1);
  }

  sub_6518();
}

uint64_t sub_8CC78(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

uint64_t sub_8CC9C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_8CCC0(unsigned __int8 *a1)
{
}

void sub_8CCC8(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_1A990(a2);
    atomic_store(sub_8CD30(v3), a1);
  }

  sub_6518();
}

uint64_t sub_8CCFC()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_8CD10(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

uint64_t sub_8CD20()
{
  return static _SetStorage.allocate(capacity:)(v0);
}

uint64_t sub_8CD30(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_8CD3C(uint64_t a1, double a2, double a3)
{
  if ([v3 view]
    && (sub_8D05C(), uint64_t v7 = sub_9E24(&qword_E55A8), (sub_3CB60(v7, v8) & 1) != 0))
  {
    uint64_t v9 = *((void *)&v13 + 1);
    if (*((void *)&v13 + 1))
    {
      uint64_t v10 = v14;
      sub_109B4(&v12, *((uint64_t *)&v13 + 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t, double, double))(v10 + 8))(a1, v9, v10, a2, a3);
      return sub_DBAC(&v12);
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
  }

  return sub_22EC4((uint64_t)&v12, &qword_E55A0);
}

uint64_t sub_8CE10(uint64_t a1)
{
  if ([v1 view]
    && (sub_8D05C(), uint64_t v3 = sub_9E24(&qword_E55B0), (sub_3CB60(v3, v4) & 1) != 0))
  {
    uint64_t v5 = *((void *)&v9 + 1);
    if (*((void *)&v9 + 1))
    {
      uint64_t v6 = v10;
      sub_109B4(&v8, *((uint64_t *)&v9 + 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, v5, v6);
      return sub_DBAC(&v8);
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
  }

  return sub_22EC4((uint64_t)&v8, (uint64_t *)&unk_E6860);
}

void sub_8CECC()
{
  uint64_t v1 = *(void *)&v0[qword_E2368];
  swift_weakLoadStrong(&v0[qword_E2360]);
  id v2 = objc_allocWithZone((Class)type metadata accessor for ContentPlattersDetailView(0LL));
  swift_retain(v1);
  uint64_t v3 = v0;
  id v4 = (id)sub_91B80();
  [v3 setView:v4];
}

void sub_8CF74(void *a1)
{
  id v1 = a1;
  sub_8CECC();
}

id sub_8CFA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentPlattersDetailViewController(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContentPlattersDetailViewController(uint64_t a1)
{
  uint64_t result = qword_E54A0;
  if (!qword_E54A0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContentPlattersDetailViewController);
  }
  return result;
}

uint64_t sub_8D014()
{
  return type metadata accessor for ContentPlattersDetailViewController(0LL);
}

uint64_t sub_8D01C(uint64_t a1, double a2, double a3)
{
  return sub_8CD3C(a1, a2, a3);
}

uint64_t sub_8D03C(uint64_t a1)
{
  return sub_8CE10(a1);
}

unint64_t sub_8D05C()
{
  return sub_6F72C();
}

void sub_8D068()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_ADD20);
  sub_8D898(KeyPath);
  sub_1AF0C();
  sub_1AE58();
  sub_DD3C();
}

void sub_8D0B0()
{
  uint64_t v0 = sub_8D8D0();
  sub_8D8B0(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  sub_8D874();
}

void sub_8D0FC()
{
}

void sub_8D110(uint64_t a1, uint64_t a2)
{
}

void sub_8D124()
{
}

void sub_8D138(uint64_t a1, uint64_t a2)
{
}

void sub_8D14C()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_ADC48);
  sub_8D898(KeyPath);
  sub_1AF0C();
  sub_1AE58();
  sub_DD3C();
}

void sub_8D194()
{
  uint64_t v0 = sub_8D8D0();
  sub_8D8B0(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  sub_8D874();
}

void sub_8D1E0()
{
}

void sub_8D1F4(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(a1);
  uint64_t v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(v2, KeyPath, v5);
  sub_1AE58();
  sub_1AF0C();
  sub_DD3C();
}

void sub_8D248(uint64_t a1, uint64_t a2)
{
}

void sub_8D25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath(a3);
  uint64_t v9 = swift_getKeyPath(a4);
  v10[0] = a1;
  v10[1] = a2;
  swift_retain(v4);
  static Published.subscript.setter(v10, v4, KeyPath, v9);
  sub_8D874();
}

uint64_t sub_8D2C0( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14 = sub_9E24(&qword_E0BB8);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = v12 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__bundleName;
  uint64_t v17 = sub_9E24((uint64_t *)&unk_E1730);
  sub_8D888();
  sub_8D8C4(v16);
  uint64_t v18 = v12 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__viewIdentifier;
  sub_8D888();
  sub_8D8C4(v18);
  uint64_t v19 = v12 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__responseViewId;
  v31[0] = 0LL;
  v31[1] = 0LL;
  sub_8D888();
  sub_8D8C4(v19);
  sub_8D85C(OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__identifier);
  uint64_t v29 = a1;
  unint64_t v30 = a2;
  sub_8D8E0();
  sub_3CB90();
  sub_AAD4(v18, (uint64_t)v31);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v20(v18, v14);
  uint64_t v29 = a7;
  unint64_t v30 = a8;
  Published.init(initialValue:)(&v29, v17);
  sub_3CB90();
  sub_8D85C(OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__data);
  uint64_t v29 = a3;
  unint64_t v30 = a4;
  sub_DA40(a3, a4);
  Published.init(initialValue:)(&v29, &type metadata for Data);
  sub_3CB90();
  sub_AAD4(v16, (uint64_t)v31);
  v20(v16, v14);
  uint64_t v29 = a5;
  unint64_t v30 = a6;
  Published.init(initialValue:)(&v29, v17);
  sub_3CB90();
  sub_8D85C(OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__viewId);
  uint64_t v29 = a9;
  unint64_t v30 = a10;
  sub_8D8E0();
  sub_3CB90();
  sub_8D248(a11, a12);
  sub_DA84(a3, a4);
  return v12;
}

uint64_t sub_8D4D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__identifier;
  uint64_t v2 = sub_9E24(&qword_E3D60);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__data;
  uint64_t v5 = sub_9E24(&qword_E57E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__bundleName;
  uint64_t v7 = sub_9E24(&qword_E0BB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  sub_8D8F0(OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__viewIdentifier);
  v3(v0 + OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__viewId, v2);
  sub_8D8F0(OBJC_IVAR____TtC6SiriTV23VisualResponseViewModel__responseViewId);
  return v0;
}

uint64_t sub_8D5BC()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_8D5E0()
{
  return type metadata accessor for VisualResponseViewModel(0LL);
}

uint64_t type metadata accessor for VisualResponseViewModel(uint64_t a1)
{
  uint64_t result = qword_E5610;
  if (!qword_E5610) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VisualResponseViewModel);
  }
  return result;
}

void sub_8D620(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    v9[0] = v4;
    sub_A9D4(319LL, (unint64_t *)&unk_E5620, (uint64_t)&type metadata for Data);
    if (v6 <= 0x3F)
    {
      v9[1] = *(void *)(v5 - 8) + 64LL;
      sub_540E4(319LL);
      if (v8 <= 0x3F)
      {
        uint64_t v10 = *(void *)(v7 - 8) + 64LL;
        uint64_t v11 = v10;
        uint64_t v12 = v4;
        uint64_t v13 = v10;
        swift_updateClassMetadata2(a1, 256LL, 6LL, v9, a1 + 80);
      }
    }
  }

void sub_8D6E4(uint64_t a1)
{
}

void sub_8D724(uint64_t a1)
{
}

void sub_8D760()
{
  *uint64_t v0 = v1;
  v0[1] = v2;
  sub_6518();
}

uint64_t sub_8D780(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_3E844(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_8D248);
}

void sub_8D79C()
{
  *uint64_t v0 = v1;
  v0[1] = v2;
  sub_6518();
}

void sub_8D7C0()
{
  *uint64_t v0 = v1;
  v0[1] = v2;
  sub_6518();
}

uint64_t sub_8D7E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_3E844(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_8D138);
}

void sub_8D7FC()
{
  *uint64_t v0 = v1;
  v0[1] = v2;
  sub_6518();
}

uint64_t sub_8D81C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_3E844(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_8D110);
}

void sub_8D838()
{
  *uint64_t v0 = v1;
  v0[1] = v2;
  sub_6518();
}

uint64_t sub_8D85C@<X0>(uint64_t a1@<X8>)
{
  return swift_beginAccess(v1 + a1, v2 - 104, 33LL, 0LL);
}

  ;
}

uint64_t sub_8D888()
{
  return Published.init(initialValue:)(v1 - 104, v0);
}

uint64_t sub_8D898(uint64_t a1)
{
  return static Published.subscript.getter(v2, v1, a1);
}

uint64_t sub_8D8B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return static Published.subscript.setter(&a9, v9, v10, v11);
}

uint64_t sub_8D8C4(uint64_t a1)
{
  return v2(a1, v1, v3);
}

uint64_t sub_8D8D0()
{
  return swift_retain(v0);
}

uint64_t sub_8D8E0()
{
  return Published.init(initialValue:)(v1 - 120, v0);
}

uint64_t sub_8D8F0@<X0>(uint64_t a1@<X8>)
{
  return v3(v1 + a1, v2);
}

uint64_t sub_8D8FC()
{
  return sub_8D924();
}

uint64_t sub_8D910()
{
  return sub_8D924();
}

uint64_t sub_8D924()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  if (v0 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v0);
  if (v6)
  {
    while (1)
    {
      id v7 = (v5 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v5)
         : *(id *)(v5 + 32);
      unint64_t v8 = v7;
      uint64_t v2 = (void *)sub_DCB4(0LL, v4, v2);
      char v9 = sub_8F144();

      if ((v9 & 1) != 0) {
        break;
      }
      if (v6 != 1)
      {
        uint64_t v12 = 5LL;
        while (1)
        {
          uint64_t v4 = (unint64_t *)(v12 - 4);
          id v13 = (v5 & 0xC000000000000001LL) != 0
              ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12 - 4, v5)
              : *(id *)(v5 + 8 * v12);
          uint64_t v14 = v13;
          uint64_t v15 = v12 - 3;
          if (__OFADD__(v4, 1LL)) {
            break;
          }
          char v10 = sub_8F144();

          if ((v10 & 1) == 0)
          {
            ++v12;
            if (v15 != v6) {
              continue;
            }
          }

          goto LABEL_9;
        }

        __break(1u);
LABEL_19:
        uint64_t v16 = v5 < 0 ? v5 : v5 & 0xFFFFFFFFFFFFFF8LL;
        swift_bridgeObjectRetain(v5);
        uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v16);
        if (v6) {
          continue;
        }
      }

      goto LABEL_8;
    }

    char v10 = 1;
  }

  else
  {
LABEL_8:
    char v10 = 0;
  }

uint64_t sub_8DA64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  if (v7 == a1 && v8 == a2) {
    return 1LL;
  }
  uint64_t result = sub_A244(v7, v8, a1, a2);
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  uint64_t v11 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = v14 == a1 && v15 == a2;
    if (v16 || (sub_A244(v14, v15, a1, a2) & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v11 += 2;
    if (v13 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

id sub_8DB20()
{
  uint64_t v1 = OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___navigationControllerDelegate;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___navigationControllerDelegate);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___navigationControllerDelegate);
  }

  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for VisualResponseNavigationDelegate(0)) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + sub_A068(v0, v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0LL;
  }

  id v6 = v2;
  return v3;
}

id sub_8DB90()
{
  uint64_t v1 = OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___interactionDelegate;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___interactionDelegate);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___interactionDelegate);
  }

  else
  {
    uint64_t v4 = v0;
    v10[0] = v0;
    v10[1] = &off_CCF98;
    void v10[2] = &off_CD1D0;
    v10[3] = &off_CD1E0;
    v10[4] = &off_CD1A0;
    id v5 = objc_allocWithZone((Class)type metadata accessor for InteractionDelegate(0LL));
    swift_retain(v0);
    id v6 = (void *)sub_497D8(v10);
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v4 + sub_A068(v0, v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0LL;
  }

  id v8 = v2;
  return v3;
}

uint64_t sub_8DC40()
{
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_supportsNextResponseNavigation) == 1)
  {
    sub_8DD08();
    uint64_t v2 = v1;
    swift_beginAccess(v0 + 24, v8, 33LL, 0LL);
    sub_1A0FC();
    uint64_t v3 = *(void *)(*(void *)(v0 + 24) + 16LL);
    sub_294D0(v3);
    uint64_t v4 = *(void *)(v0 + 24);
    *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v3 + 1;
    uint64_t v5 = v4 + 16 * v3;
    *(void *)(v5 + 32) = v2;
    *(void *)(v5 + 40) = &off_CCF98;
    return swift_endAccess(v8);
  }

  else
  {
    swift_beginAccess(v0 + 24, v8, 1LL, 0LL);
    uint64_t v7 = *(void *)(v0 + 24);
    *(void *)(v0 + 24) = &_swiftEmptyArrayStorage;
    return swift_bridgeObjectRelease(v7);
  }

void sub_8DD08()
{
  uint64_t v1 = OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___detailViewCoordinator;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___detailViewCoordinator);
  if (!v2)
  {
    uint64_t v3 = v0;
    uint64_t v4 = *(void **)(v0 + 56);
    if (v4) {
      id v5 = *(id *)(v0 + 56);
    }
    else {
      id v5 = [objc_allocWithZone(UINavigationController) init];
    }
    uint64_t v6 = type metadata accessor for ContentPlattersDetailViewCoordinator(0LL);
    sub_10EFC(v6);
    id v7 = v4;
    swift_retain(v3);
    sub_EF64(v5, v3, (uint64_t)&off_CCF98);
    uint64_t v8 = *(void *)(v3 + v1);
    *(void *)(v3 + sub_A068(v0, v1) = v9;
    swift_retain(v9);
    swift_release(v8);
    uint64_t v2 = 0LL;
  }

  swift_retain(v2);
  sub_10E90();
}

void sub_8DDC8()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController);
  sub_6518();
}

void sub_8DDF0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v4 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___navigationControllerDelegate) = 0LL;
  *(void *)(v4 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___interactionDelegate) = 0LL;
  *(void *)(v4 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController) = 0LL;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_supportsNextResponseNavigation) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___detailViewCoordinator) = 0LL;
  swift_unknownObjectRetain(a2);
  id v9 = a1;
  uint64_t v10 = sub_8B634((uint64_t)v9, a2, a3);
  swift_retain(v10);
  id v11 = sub_8DB20();
  [v9 setDelegate:v11];

  *(_BYTE *)(v10 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_supportsNextResponseNavigation) = a4;
  sub_8DC40();
  sub_1ADD0();

  swift_unknownObjectRelease(a2);
  sub_10E90();
}

uint64_t sub_8DEBC(uint64_t a1)
{
  uint64_t v3 = sub_A5F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_8BA80();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v1 + 48);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 136))(a1, ObjectType, v9);
    return swift_unknownObjectRelease(v8);
  }

  else
  {
    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))( v6,  v1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v3);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.error.getter(v13);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)sub_A1D0(2LL);
      *(_WORD *)uint64_t v15 = 0;
      sub_DD8C(&dword_0, v13, v14, "#tv parentCoordinator is nil", v15);
      sub_A15C((uint64_t)v15);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

void sub_8DFF8(uint64_t a1)
{
  if (a1 || *(void *)(v1 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController))
  {
    if (sub_8BA80())
    {
      id v3 = sub_8F11C();
      sub_9E24((uint64_t *)&unk_E41B0);
      uint64_t v4 = sub_9E24(&qword_E55A8);
      if ((sub_8F0C4(v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16[0]) & 1) != 0)
      {
        if (v16[3])
        {
          id v12 = sub_8F128(v16);
          uint64_t v13 = sub_8F150();
          v2(v13);

          sub_DBAC(v16);
          return;
        }
      }

      else
      {
        sub_580F0();
      }
    }

    else
    {
      sub_580F0();
    }

    sub_A068((uint64_t)v16, &qword_E55A0);
  }

void sub_8E0EC(uint64_t a1)
{
  if (a1 || *(void *)(v1 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController))
  {
    if (sub_8BA80())
    {
      id v3 = sub_8F11C();
      sub_9E24((uint64_t *)&unk_E41B0);
      uint64_t v4 = sub_9E24(&qword_E55B0);
      if ((sub_8F0C4(v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16[0]) & 1) != 0)
      {
        if (v16[3])
        {
          id v12 = sub_8F128(v16);
          uint64_t v13 = sub_8F150();
          v2(v13);

          sub_DBAC(v16);
          return;
        }
      }

      else
      {
        sub_580F0();
      }
    }

    else
    {
      sub_580F0();
    }

    sub_A068((uint64_t)v16, (uint64_t *)&unk_E6860);
  }

void sub_8E1C8()
{
  uint64_t v1 = *(void **)(v0 + 56);
  if (v1) {

  }
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_supportsNextResponseNavigation) == 1)
  {
    sub_8DD08();
    uint64_t v3 = v2;
    sub_EDA8(0LL);
    swift_release(v3);
  }

double sub_8E238()
{
  *(void *)&double result = swift_release(*(void *)(v0
                                               + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___detailViewCoordinator)).n128_u64[0];
  return result;
}

void sub_8E278()
{
  uint64_t v0 = sub_8B6E4();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___navigationControllerDelegate));

  swift_release(*(void *)(v0
                          + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator____lazy_storage___detailViewCoordinator));
  sub_6518();
}

uint64_t sub_8E2D8()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_8E2F8()
{
  return type metadata accessor for VisualResponseViewCoordinator(0LL);
}

uint64_t type metadata accessor for VisualResponseViewCoordinator(uint64_t a1)
{
  uint64_t result = qword_E5830;
  if (!qword_E5830) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VisualResponseViewCoordinator);
  }
  return result;
}

uint64_t sub_8E338(uint64_t a1)
{
  v2[0] = "\b";
  v2[1] = "\b";
  void v2[2] = "\b";
  v2[3] = &unk_ADD88;
  v2[4] = "\b";
  return swift_updateClassMetadata2(a1, 256LL, 5LL, v2, a1 + 328);
}

void sub_8E388(uint64_t a1)
{
}

void sub_8E3A8(uint64_t a1)
{
}

void sub_8E3C8()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v60 = v4;
  int v61 = (uint8_t *)v5;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v11 = v10;
  uint64_t v64 = v12;
  unint64_t v14 = v13;
  uint64_t v15 = sub_A5F0();
  uint64_t v16 = sub_8F194(v15);
  __chkstk_darwin(v16);
  sub_A148();
  uint64_t v63 = v17;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v59 - v19;
  uint64_t v62 = OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController;
  uint64_t v21 = *(void *)(v0 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController);
  if (!v21 || (sub_8F17C(v21), sub_8D124(), uint64_t v23 = v22, v25 = v24, sub_1ADD0(), !v25))
  {
LABEL_8:
    sub_8E1C8();
    uint64_t v28 = type metadata accessor for VisualResponseViewModel(0LL);
    sub_10EFC(v28);
    swift_bridgeObjectRetain(v14);
    sub_DA40(v9, v7);
    swift_bridgeObjectRetain(v3);
    swift_bridgeObjectRetain(v11);
    sub_8D2C0(v60, v14, v9, v7, 0LL, 0LL, v64, v11, (uint64_t)v61, (unint64_t)v3, 0LL, 0LL);
    sub_8F0F0();
    swift_retain(v11);
    sub_8DB90();
    id v29 = objc_allocWithZone((Class)sub_8F110());
    uint64_t v30 = sub_8F0DC();
    uint64_t v31 = v65;
    uint64_t v32 = v66;
    uint64_t v33 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))( v63,  v1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v66);
    uint64_t v34 = sub_8F170();
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.debug.getter(v35);
    if (sub_8F1A8(v35))
    {
      uint64_t v37 = (uint8_t *)sub_A1D0(12LL);
      uint64_t v38 = sub_A1D0(32LL);
      uint64_t v64 = v30;
      uint64_t v39 = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      int v61 = v37 + 4;
      uint64_t v40 = v62;
      sub_8F188(v38);
      uint64_t v41 = sub_9E24(&qword_E5A60);
      uint64_t v42 = String.init<A>(describing:)(&v67, v41);
      uint64_t v67 = sub_8F164(v42, v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v61, v37 + 12);
      sub_8F0B8();
      swift_bridgeObjectRelease(v3, v44, v45, v46, v47, v48, v49, v50);
      _os_log_impl(&dword_0, v35, v36, "#tv updating view model of %s", v37, 0xCu);
      sub_8F100();
      uint64_t v51 = v39;
      uint64_t v30 = v64;
      sub_A15C(v51);
      sub_A15C((uint64_t)v37);
      sub_1B1F0();

      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v66);
    }

    else
    {

      sub_8F0B8();
      sub_1B1F0();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
      uint64_t v40 = v62;
    }

    id v52 = *(void **)(v1 + v40);
    *(void *)(v1 + v40) = v30;

    goto LABEL_16;
  }

  if (v23 == v64 && v25 == v11)
  {
    sub_3CBD0();
  }

  else
  {
    char v27 = sub_A244(v64, v11, v23, v25);
    sub_3CBD0();
    if ((v27 & 1) == 0) {
      goto LABEL_8;
    }
  }

  uint64_t v54 = v65;
  uint64_t v53 = v66;
  uint64_t v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 16))( v20,  v1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v66);
  uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
  os_log_type_t v57 = static os_log_type_t.debug.getter(v56);
  if (os_log_type_enabled(v56, v57))
  {
    int v58 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)int v58 = 0;
    sub_DD8C( &dword_0,  v56,  v57,  "#tv new visual response has identifier viewIdentifer as current view controller. Not updating.",  v58);
    sub_A15C((uint64_t)v58);
  }

  (*(void (**)(char *, uint64_t))(v54 + 8))(v20, v53);
LABEL_16:
  sub_A174();
}

void sub_8E73C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, unint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v25 = v24;
  uint64_t v105 = v26;
  uint64_t v106 = v27;
  unint64_t v29 = v28;
  uint64_t v103 = v30;
  uint64_t v104 = v31;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  unint64_t v37 = v36;
  uint64_t v38 = sub_A5F0();
  uint64_t v39 = sub_8F194(v38);
  __chkstk_darwin(v39);
  sub_A148();
  uint64_t v107 = v40;
  __chkstk_darwin(v41);
  unint64_t v43 = (char *)&v100 - v42;
  uint64_t v44 = OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController;
  uint64_t v45 = *(void *)(v24 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController);
  if (!v45 || (sub_8F17C(v45), sub_8D124(), uint64_t v47 = v46, v49 = v48, sub_1ADD0(), !v49))
  {
LABEL_8:
    uint64_t v101 = a23;
    uint64_t v102 = v44;
    uint64_t v100 = a21;
    sub_8E1C8();
    uint64_t v66 = type metadata accessor for VisualResponseViewModel(0LL);
    sub_10EFC(v66);
    unint64_t v67 = v37;
    swift_bridgeObjectRetain(v37);
    uint64_t v68 = v104;
    sub_DA40(v104, v29);
    swift_bridgeObjectRetain(a24);
    swift_bridgeObjectRetain(v33);
    unint64_t v69 = v33;
    uint64_t v70 = v35;
    unint64_t v71 = (unint64_t)v106;
    swift_bridgeObjectRetain(v106);
    swift_bridgeObjectRetain(a22);
    sub_8D2C0(v103, v67, v68, v29, v105, v71, v70, v69, v100, a22, v101, a24);
    sub_8F0F0();
    swift_retain(v69);
    sub_8DB90();
    id v72 = objc_allocWithZone((Class)sub_8F110());
    uint64_t v73 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_8F0DC();
    uint64_t v75 = v107;
    uint64_t v74 = v108;
    uint64_t v76 = v109;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v108 + 16))( v107,  v25 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v109);
    uint64_t v77 = sub_8F170();
    id v78 = (os_log_s *)Logger.logObject.getter(v77);
    os_log_type_t v79 = static os_log_type_t.debug.getter(v78);
    if (sub_8F1A8(v78))
    {
      uint64_t v80 = (uint8_t *)sub_A1D0(12LL);
      uint64_t v81 = sub_A1D0(32LL);
      *(_DWORD *)uint64_t v80 = 136315138;
      uint64_t v106 = v80 + 4;
      uint64_t v82 = v102;
      sub_8F188(v81);
      uint64_t v83 = sub_9E24(&qword_E5A60);
      uint64_t v84 = String.init<A>(describing:)(&v110, v83);
      uint64_t v110 = sub_8F164(v84, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v106, v80 + 12);
      sub_8F0B8();
      swift_bridgeObjectRelease(v73, v86, v87, v88, v89, v90, v91, v92);
      _os_log_impl(&dword_0, v78, v79, "#tv updating view model of %s", v80, 0xCu);
      sub_8F100();
      sub_A15C(v81);
      sub_A15C((uint64_t)v80);
      sub_1B1F0();

      (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v109);
    }

    else
    {

      sub_8F0B8();
      sub_1B1F0();
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v75, v76);
      uint64_t v82 = v102;
    }

    uint64_t v93 = *(void **)(v25 + v82);
    *(void *)(v25 + v82) = v73;

    goto LABEL_16;
  }

  if (v47 == v35 && v49 == (_TtC6SiriTV27ConversationViewCoordinator *)v33)
  {
    swift_bridgeObjectRelease(v49, v50, v51, v52, v53, v54, v55, v56);
  }

  else
  {
    char v58 = sub_A244(v35, v33, v47, (uint64_t)v49);
    swift_bridgeObjectRelease(v49, v59, v60, v61, v62, v63, v64, v65);
    if ((v58 & 1) == 0) {
      goto LABEL_8;
    }
  }

  uint64_t v95 = v108;
  uint64_t v94 = v109;
  uint64_t v96 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v108 + 16))( v43,  v25 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v109);
  uint64_t v97 = (os_log_s *)Logger.logObject.getter(v96);
  os_log_type_t v98 = static os_log_type_t.debug.getter(v97);
  if (os_log_type_enabled(v97, v98))
  {
    uint64_t v99 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)uint64_t v99 = 0;
    sub_DD8C( &dword_0,  v97,  v98,  "#tv new visual response has identifier viewIdentifer as current view controller. Not updating.",  v99);
    sub_A15C((uint64_t)v99);
  }

  (*(void (**)(char *, uint64_t))(v95 + 8))(v43, v94);
LABEL_16:
  sub_A174();
}

void sub_8ECB8(void (*a1)(void))
{
  uint64_t v3 = *(void **)(v1 + 56);
  if (v3) {

  }
  if (a1) {
    a1();
  }
}

void sub_8ED10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  unint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = sub_A5F0();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 16))( v31,  v23 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v28);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.debug.getter(v33);
  if (sub_8F1A8(v33))
  {
    uint64_t v35 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)uint64_t v35 = 0;
    sub_DD8C(&dword_0, v33, v34, "#tv pushing new visualResponseView on navigation stack.", v35);
    sub_A15C((uint64_t)v35);
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  sub_8DD08();
  sub_F174(v27, v25);
  sub_1ADD0();
  sub_8DD08();
  sub_EE78();
  unint64_t v37 = v36;
  sub_1ADD0();
  uint64_t v38 = *(void **)(v23 + 56);
  if (v38)
  {
    id v39 = v38;
    id v40 = [v39 viewControllers];
    uint64_t v41 = sub_DCB4(0LL, (unint64_t *)&qword_E02C8, &OBJC_CLASS___UIViewController_ptr);
    uint64_t v42 = (_TtC6SiriTV27ConversationViewCoordinator *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, v41);

    LOBYTE(v40) = sub_8D924();
    swift_bridgeObjectRelease(v42, v43, v44, v45, v46, v47, v48, v49);
    if ((v40 & 1) == 0)
    {
      sub_8B84C();
      [v39 pushViewController:v37 animated:1];
    }
  }

  else
  {
    id v39 = v37;
  }

  sub_A174();
}

void sub_8EEDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _TtC6SiriTV27ConversationViewCoordinator *a8)
{
  uint64_t v9 = *(void **)(v8 + OBJC_IVAR____TtC6SiriTV29VisualResponseViewCoordinator_visualResponseViewController);
  if (v9)
  {
    uint64_t v12 = (objc_class *)[v9 view];
    if (v12)
    {
      Class isa = v12;
      uint64_t v13 = type metadata accessor for VisualResponseView(0LL);
      if (!swift_dynamicCastClass(isa, v13)) {
        goto LABEL_14;
      }
      unint64_t v14 = (objc_class *)sub_927AC();

      if (v14)
      {
        id v15 = -[objc_class viewId](v14, "viewId");
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        uint64_t v18 = v17;

        if (v16 == a7 && v18 == (void)a8)
        {
          swift_bridgeObjectRelease(a8, v19, v20, v21, v22, v23, v24, v25);
        }

        else
        {
          char v27 = sub_A244(v16, v18, a7, (uint64_t)a8);
          sub_3CBD0();
          Class v28 = v14;
          if ((v27 & 1) == 0) {
            goto LABEL_15;
          }
        }

        Class isa = Data._bridgeToObjectiveC()().super.isa;
        -[objc_class updateSharedStateData:](v14, "updateSharedStateData:", isa);

LABEL_14:
        Class v28 = isa;
LABEL_15:
      }
    }
  }

void sub_8F030()
{
}

#error "8F068: call analysis failed (funcsize=8)"
void sub_8F078(void (*a1)(void))
{
  sub_8ECB8(a1);
}

void sub_8F098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _TtC6SiriTV27ConversationViewCoordinator *a8)
{
}

uint64_t sub_8F0B8()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_8F0C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  return swift_dynamicCast(&a11, &a9, v11, a1, 6LL);
}

uint64_t sub_8F0DC()
{
  return sub_5EA6C(v1, v2, v0);
}

uint64_t sub_8F0F0()
{
  return swift_retain(v0);
}

uint64_t sub_8F100()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_8F110()
{
  return type metadata accessor for VisualResponseViewController(0LL);
}

id sub_8F11C()
{
  return v0;
}

id sub_8F128(void *a1)
{
  return v1;
}

uint64_t sub_8F144()
{
  return static NSObject.== infix(_:_:)(v1, v0);
}

uint64_t sub_8F150()
{
  return v0;
}

uint64_t sub_8F164(uint64_t a1, unint64_t a2)
{
  return sub_CC88(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_8F170()
{
  return swift_retain_n(v0, 2LL);
}

uint64_t sub_8F17C@<X0>(uint64_t a1@<X8>)
{
  return swift_retain(*(void *)(a1 + v1));
}

id sub_8F188(uint64_t a1)
{
  uint64_t v4 = *(void **)(v1 + v2);
  *(void *)(v3 - 96) = v4;
  *(void *)(v3 - 88) = a1;
  return v4;
}

uint64_t sub_8F194(uint64_t result)
{
  *(void *)(v1 - 112) = *(void *)(result - 8);
  *(void *)(v1 - 104) = result;
  return result;
}

BOOL sub_8F1A8(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

void sub_8F1B0()
{
  qword_E9B08 = 0x4034000000000000LL;
}

id sub_8F1C0()
{
  id v0 = [objc_allocWithZone(UIView) init];
  id v1 = sub_DDAC((uint64_t)[v0 setTranslatesAutoresizingMaskIntoConstraints:0], "layer");
  if (qword_DEDF8 != -1) {
    swift_once(&qword_DEDF8, sub_8F1B0);
  }
  [v1 setCornerRadius:*(double *)&qword_E9B08 * 0.5];

  id v2 = [(id)objc_opt_self(UIColor) grayColor];
  [v0 setBackgroundColor:v2];

  return v0;
}

char *sub_8F2A8()
{
  uint64_t v2 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_asrStatus;
  uint64_t v3 = v0;
  *(void *)&v0[v2] = sub_8F1C0();
  uint64_t v4 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_executionInputSystem;
  *(void *)&v3[v4] = sub_8F1C0();

  v44.receiver = v3;
  v44.super_class = (Class)type metadata accessor for RequestHandlingStatusView();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v44, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v6 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_asrStatus;
  uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_asrStatus];
  uint64_t v8 = v5;
  [v8 addSubview:v7];
  uint64_t v9 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_executionInputSystem;
  unint64_t v10 = *(void **)&v8[OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_executionInputSystem];
  [v8 addSubview:v10];
  id v42 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v11 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v12 = swift_allocObject(v11, 96LL, 7LL);
  *(_OWORD *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB7C0;
  id v13 = sub_DDAC((uint64_t)[v10 bottomAnchor], "bottomAnchor");
  id v14 = sub_866D0((uint64_t)v13, "constraintEqualToAnchor:");
  sub_276C4();

  *(void *)(v12 + 32) = v1;
  id v15 = sub_8F7A0(*(void **)&v8[v9]);
  id v16 = sub_DDAC((uint64_t)v15, "rightAnchor");
  id v17 = sub_866D0((uint64_t)v16, "constraintEqualToAnchor:");
  sub_276C4();

  *(void *)(v12 + 40) = v1;
  id v18 = [*(id *)&v8[v9] widthAnchor];
  if (qword_DEDF8 != -1) {
    swift_once(&qword_DEDF8, sub_8F1B0);
  }
  id v19 = objc_msgSend(v18, "constraintEqualToConstant:", *(double *)&qword_E9B08, v42);
  sub_276A0();
  *(void *)(v12 + 48) = v16;
  id v20 = sub_8F798([*(id *)&v8[v9] heightAnchor]);
  sub_276A0();
  *(void *)(v12 + 56) = v16;
  id v21 = [*(id *)&v5[v6] bottomAnchor];
  id v22 = [*(id *)&v8[v9] topAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22 constant:-5.0];
  sub_276C4();

  *(void *)(v12 + 64) = &unk_E9000;
  id v24 = sub_8F7A0(*(void **)&v5[v6]);
  id v25 = sub_8F7A0(*(void **)&v8[v9]);
  id v26 = sub_866D0((uint64_t)v25, "constraintEqualToAnchor:");
  sub_276C4();

  *(void *)(v12 + 72) = &unk_E9000;
  id v27 = sub_8F798([*(id *)&v5[v6] widthAnchor]);
  sub_276A0();
  *(void *)(v12 + 80) = v25;
  id v28 = [*(id *)&v5[v6] heightAnchor];
  id v29 = sub_8F798(v28);

  *(void *)(v12 + 88) = v29;
  specialized Array._endMutation()(v30, v31);
  uint64_t v32 = (_TtC6SiriTV27ConversationViewCoordinator *)v12;
  sub_21D1C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32, v34, v35, v36, v37, v38, v39, v40);
  [v43 activateConstraints:isa];

  return v8;
}

void sub_8F678()
{
  uint64_t v1 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_asrStatus;
  *(void *)&v0[v1] = sub_8F1C0();
  uint64_t v2 = OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_executionInputSystem;
  *(void *)&v0[v2] = sub_8F1C0();

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000A2020LL,  "SiriTV/RequestHandlingStatusView.swift",  38LL,  2LL);
  __break(1u);
}

id sub_8F710()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RequestHandlingStatusView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RequestHandlingStatusView()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV25RequestHandlingStatusView);
}

id sub_8F798(void *a1)
{
  return [a1 *v1];
}

id sub_8F7A0(void *a1)
{
  return [a1 *(SEL *)(v1 + 976)];
}

void sub_8F7A8()
{
}

id sub_8F7BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FocusableScrollView();
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)) init];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setDelegate:a1];
  [v3 setClipsToBounds:0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setIndexDisplayMode:1];
  [v3 setContentInsetAdjustmentBehavior:2];
  return v3;
}

void sub_8F870()
{
}

id sub_8F884()
{
  id v0 = [objc_allocWithZone(UIView) init];
  id v1 = [(id)objc_opt_self(UIColor) clearColor];
  [v0 setBackgroundColor:v1];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v0;
}

void sub_8F90C()
{
}

id sub_8F920()
{
  uint64_t v1 = qword_E5AC0;
  uint64_t v2 = *(void **)&v0[qword_E5AC0];
  if (v2)
  {
    id v3 = *(id *)&v0[qword_E5AC0];
  }

  else
  {
    id v4 = [v0 traitCollection];
    uint64_t v5 = (char *)[v4 userInterfaceStyle];

    if (v5 == (_BYTE *)&dword_0 + 1) {
      uint64_t v6 = 4LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    id v7 = [(id)objc_opt_self(UIBlurEffect) effectWithStyle:v6];
    id v8 = [objc_allocWithZone(UIVisualEffectView) initWithEffect:v7];
    sub_89884(0xD000000000000029LL, 0x80000000000A3EA0LL, v8);
    [v8 _setCornerRadius:1 continuous:15 maskedCorners:30.0];
    [v8 setAlpha:0.0];

    uint64_t v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    uint64_t v2 = 0LL;
  }

  id v10 = v2;
  return v3;
}

void sub_8FA5C()
{
  uint64_t v1 = qword_E5AC8;
  uint64_t v2 = *(void **)(v0 + qword_E5AC8);
  if (!v2)
  {
    sub_8F90C();
    id v4 = v3;
    id v5 = [v3 heightAnchor];

    id v6 = [v5 constraintEqualToConstant:0.0];
    sub_2790C();
    LODWORD(swift_bridgeObjectRelease( *(_TtC6SiriTV27ConversationViewCoordinator **)(v0 + qword_E4880),  v1,  v2,  v3,  v4,  v5,  v6, v7) = 1148846080;
    [v4 setPriority:v7];
    *(void *)(v0 + sub_A068(v0, v1) = v4;
    id v8 = v4;
    sub_2790C();
    uint64_t v2 = 0LL;
  }

  id v9 = v2;
  sub_ADE8();
}

void sub_8FB04()
{
}

id sub_8FB18(void *a1)
{
  id v3 = v2;
  id v4 = [v2 bottomAnchor];

  id v5 = [a1 bottomAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5 constant:-195.0];

  return v6;
}

void sub_8FBAC(uint64_t a1)
{
}

uint64_t sub_8FBB8(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(v2 + qword_E9B18);
  uint64_t v4 = *(void *)(v2 + qword_E9B18 + 8);
  *id v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

void sub_8FBD4(uint64_t a1)
{
}

uint64_t sub_8FBE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + qword_E9B28);
  *(void *)(v1 + qword_E9B28) = a1;
  return swift_unknownObjectRelease(v2);
}

void sub_8FBF8(uint64_t a1)
{
}

Class sub_8FC04(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_8FC58();

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2, v4, v5, v6, v7, v8, v9, v10);
  return isa;
}

_TtC6SiriTV27ConversationViewCoordinator *sub_8FC58()
{
  uint64_t v33 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void **)(v0 + qword_E9B10);
  if (v2)
  {
    id v3 = v2;
    sub_92768();
    sub_92730();
    if (v5) {
      sub_92678(v4);
    }
    uint64_t v6 = sub_926E4();
    specialized Array._endMutation()(v6, v7);
  }

  sub_926C4();
  id v9 = v8;
  sub_92768();
  sub_92730();
  if (v5) {
    sub_92678(v10);
  }
  uint64_t v11 = sub_926E4();
  specialized Array._endMutation()(v11, v12);

  id v14 = (os_log_s *)sub_3CB50(v13);
  os_log_type_t v15 = static os_log_type_t.error.getter(v14);
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)sub_A1D0(12LL);
    uint64_t v17 = sub_A1D0(32LL);
    v32[0] = v17;
    *(_DWORD *)id v16 = 136315138;
    sub_DE14((uint64_t)&v33, (uint64_t)v31, 0LL);
    id v18 = v33;
    swift_bridgeObjectRetain(v33);
    uint64_t v19 = sub_9E24((uint64_t *)&unk_DFA00);
    uint64_t v20 = Array.description.getter(v18, v19);
    unint64_t v22 = (unint64_t)v21;
    swift_bridgeObjectRelease(v18, v21, v23, v24, v25, v26, v27, v28);
    uint64_t v30 = sub_CC88(v20, v22, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, v31, v16 + 4, v16 + 12);
    sub_A3C8();
    _os_log_impl(&dword_0, v14, v15, "#tv environments: %s", v16, 0xCu);
    sub_A27C(v17);
    sub_A15C(v17);
    sub_A15C((uint64_t)v16);
  }

  sub_DE14((uint64_t)&v33, (uint64_t)v32, 0LL);
  return v33;
}

void sub_8FE48()
{
}

void sub_8FE5C()
{
  uint64_t v2 = v0;
  sub_8F7A8();
  unint64_t v4 = v3;
  sub_3CC78(v2, "addSubview:");

  id v92 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v5 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v6 = sub_1AFD0(v5, 64LL);
  *(_OWORD *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB340;
  sub_92638();
  id v8 = sub_92754(v7);
  sub_32C48();
  id v10 = sub_DDAC(v9, "topAnchor");
  id v11 = sub_926B8((uint64_t)v10, "constraintEqualToAnchor:constant:");
  sub_3CD34();

  *(void *)(v6 + 32) = v1;
  sub_92638();
  id v13 = [v12 leftAnchor];
  sub_32C48();
  id v15 = sub_DDAC(v14, "leftAnchor");
  id v16 = sub_926B8((uint64_t)v15, "constraintEqualToAnchor:constant:");
  sub_3CD34();

  *(void *)(v6 + 40) = &selRef_constraintEqualToConstant_;
  sub_92638();
  id v18 = [v17 rightAnchor];
  sub_32C48();
  id v20 = sub_DDAC(v19, "rightAnchor");
  id v21 = sub_926B8((uint64_t)v20, "constraintEqualToAnchor:constant:");
  sub_3CD34();

  *(void *)(v6 + 48) = &selRef_constraintEqualToConstant_;
  sub_8FB04();
  *(void *)(v6 + 56) = v22;
  sub_3CD1C(v22, v23);
  sub_DCB4(0LL, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
  sub_92780();
  sub_9275C();
  [v92 activateConstraints:v6];

  sub_926C4();
  id v25 = v24;
  sub_8F870();
  id v27 = v26;
  sub_3CC78(v25, "addSubview:");

  uint64_t v28 = sub_1AFD0(v5, 72LL);
  *(_OWORD *)(v28 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB7D0;
  sub_92650();
  id v30 = sub_92754(v29);
  sub_32C48();
  sub_92638();
  id v32 = sub_92754(v31);
  sub_3CBC0();
  id v33 = sub_DCF8();
  sub_279AC();

  *(void *)(v28 + 32) = v27;
  sub_92650();
  id v35 = [v34 leftAnchor];
  sub_32C48();
  sub_92638();
  id v37 = [v36 leftAnchor];
  sub_3CBC0();
  id v38 = sub_DCF8();
  sub_279AC();

  *(void *)(v28 + 40) = v27;
  sub_92650();
  id v40 = [v39 rightAnchor];
  sub_32C48();
  sub_92638();
  id v42 = [v41 rightAnchor];
  sub_3CBC0();
  id v43 = sub_DCF8();
  sub_279AC();

  *(void *)(v28 + 48) = v27;
  sub_92650();
  id v45 = [v44 bottomAnchor];
  sub_32C48();
  sub_92638();
  id v47 = [v46 bottomAnchor];
  sub_3CBC0();
  id v48 = sub_DCF8();
  sub_279AC();

  *(void *)(v28 + 56) = v27;
  sub_92650();
  id v50 = sub_9270C(v49);
  sub_32C48();
  sub_92638();
  id v52 = sub_9270C(v51);
  sub_3CBC0();
  id v53 = sub_DCF8();
  sub_279AC();

  *(void *)(v28 + 64) = v27;
  sub_3CD1C(v54, v55);
  sub_92780();
  sub_9275C();
  [v92 activateConstraints:v28];

  sub_8FA5C();
  os_log_type_t v57 = (void *)v56;
  sub_DDAC(v56, "frame");
  [v57 setConstant:CGRectGetHeight(v94)];

  sub_8F870();
  SEL v59 = v58;
  sub_8F90C();
  id v61 = v60;
  sub_3CC78(v59, "addSubview:");

  uint64_t v62 = sub_1AFD0(v5, 72LL);
  *(_OWORD *)(v62 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB7D0;
  sub_926CC();
  id v64 = [v63 topAnchor];
  sub_3CC64();
  sub_92638();
  id v66 = [v65 topAnchor];
  sub_32C48();
  id v67 = sub_3CA74();
  sub_3CD54();

  *(void *)(v62 + 32) = v61;
  sub_926CC();
  id v69 = [v68 leftAnchor];
  sub_3CC64();
  sub_92638();
  id v71 = [v70 leftAnchor];
  sub_32C48();
  id v72 = sub_3CA74();
  sub_3CD54();

  *(void *)(v62 + 40) = v61;
  sub_926CC();
  id v74 = [v73 rightAnchor];
  sub_3CC64();
  sub_92638();
  id v76 = [v75 rightAnchor];
  sub_32C48();
  id v77 = sub_3CA74();
  sub_3CD54();

  *(void *)(v62 + 48) = v61;
  sub_926CC();
  id v79 = sub_9270C(v78);
  sub_3CC64();
  sub_92650();
  id v81 = sub_9270C(v80);
  sub_32C48();
  id v82 = sub_3CA74();
  sub_3CD54();

  *(void *)(v62 + 56) = v61;
  sub_8FA5C();
  *(void *)(v62 + 64) = v83;
  sub_3CD1C(v83, v84);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v62, v85, v86, v87, v88, v89, v90, v91);
  [v92 activateConstraints:isa];
}

void sub_9040C()
{
  uint64_t v1 = v0;
  uint64_t Strong = swift_weakLoadStrong(v0 + qword_E3F50);
  if (Strong)
  {
    uint64_t v3 = Strong;
    id v60 = sub_EF0C();
    swift_release(v3);
    uint64_t v4 = swift_unknownObjectWeakLoadStrong(v1 + qword_E3F48);
    if (!v4)
    {
      sub_926B0(v60);
      return;
    }

    uint64_t v5 = (void *)v4;
    id v6 = [v60 view];
    if (!v6)
    {
      uint64_t v14 = v60;
LABEL_14:

      sub_926B0(v5);
      return;
    }

    uint64_t v7 = v6;
    id v8 = (char *)qword_E9B10;
    uint64_t v9 = *(void **)(v1 + qword_E9B10);
    if (v9)
    {
      sub_3CA48((uint64_t)v6, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
      id v10 = v7;
      id v11 = v9;
      char v12 = static NSObject.== infix(_:_:)(v11, v10);

      if ((v12 & 1) != 0)
      {
        id v13 = v60;
LABEL_13:

        uint64_t v14 = v5;
        uint64_t v5 = v10;
        goto LABEL_14;
      }

      id v15 = *(void **)&v8[v1];
    }

    else
    {
      id v15 = 0LL;
    }

    objc_msgSend(v15, "removeFromSuperview", v60);
    id v16 = v7;
    sub_8FBAC((uint64_t)v7);
    sub_27904(v16, "setTranslatesAutoresizingMaskIntoConstraints:");
    sub_8F870();
    id v18 = v17;
    [v5 addWithChild:v61 in:v17];

    id v20 = sub_DDA4(v19, "topAnchor");
    sub_8F90C();
    id v22 = [v21 bottomAnchor];
    sub_32C48();
    id v23 = sub_3CA74();

    id v25 =  objc_msgSend( sub_DDA4(v24, "heightAnchor"),  "constraintEqualToConstant:",  0.0);
    sub_32C48();
    LODWORD(v26) = 1148846080;
    [v8 setPriority:v26];
    sub_27904(*(id *)(v1 + qword_E9B20), "setActive:");
    id v27 = v8;
    sub_8FBD4((uint64_t)v8);
    uint64_t v28 = sub_9E24((uint64_t *)&unk_DF980);
    uint64_t v29 = sub_1AFD0(v28, 72LL);
    *(_OWORD *)(v29 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB7D0;
    *(void *)(v29 + 32) = v23;
    id v30 = v23;
    id v31 = sub_DDA4((uint64_t)v30, "leftAnchor");
    sub_8F870();
    id v33 = v32;
    id v34 = [v32 leftAnchor];
    sub_92744();
    id v35 = sub_92668();
    sub_927A4();

    *(void *)(v29 + 40) = v33;
    id v37 = sub_DDA4(v36, "rightAnchor");
    sub_8F870();
    id v39 = v38;
    id v40 = [v38 rightAnchor];
    sub_92744();
    id v41 = sub_92668();
    sub_927A4();

    *(void *)(v29 + 48) = v39;
    id v43 = sub_DDA4(v42, "bottomAnchor");
    sub_8F870();
    id v45 = v44;
    id v46 = [v44 bottomAnchor];
    sub_92744();
    id v47 = sub_92668();
    sub_927A4();

    *(void *)(v29 + 56) = v45;
    *(void *)(v29 + 64) = v27;
    specialized Array._endMutation()(v48, v49);
    id v50 = (_TtC6SiriTV27ConversationViewCoordinator *)v29;
    uint64_t v51 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    sub_DCB4(0LL, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
    id v10 = v27;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v51 activateConstraints:isa];
    swift_bridgeObjectRelease(v50, v53, v54, v55, v56, v57, v58, v59);

    sub_91754(v16);
    id v13 = v16;
    uint64_t v5 = v30;
    goto LABEL_13;
  }

double sub_90830()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_9E24(&qword_E0B30);
  __chkstk_darwin(v2);
  sub_A1F8();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_9E24(&qword_E5F10);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_A1F8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_9E24(&qword_E5F18);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_A1F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = *(void *)(v0 + qword_E3F38);
  sub_DE14(v16 + OBJC_IVAR____TtC6SiriTV30ContentPlattersDetailViewModel__responseIdentifier, (uint64_t)v27, 33LL);
  swift_retain(v16);
  uint64_t v17 = sub_9E24(&qword_E3D60);
  Published.projectedValue.getter(v17);
  swift_endAccess(v27);
  swift_release(v16);
  uint64_t v19 = sub_3CA48(v18, (unint64_t *)&qword_E0540, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v27[0] = (id)static OS_dispatch_queue.main.getter(v19);
  uint64_t v20 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
  sub_9E64(v5, 1LL, 1LL, v20);
  uint64_t v21 = sub_27494( (unint64_t *)&unk_E5F20,  &qword_E5F10,  (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  sub_27320();
  Publisher.receive<A>(on:options:)(v27, v5, v6, v19, v21);
  sub_22EC4(v5, &qword_E0B30);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v22 = sub_1AFD0((uint64_t)&unk_CD270, 24LL);
  swift_unknownObjectWeakInit(v22 + 16);
  sub_27494( (unint64_t *)&unk_E5F30,  &qword_E5F18,  (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  uint64_t v23 = Publisher<>.sink(receiveValue:)(sub_92630);
  __n128 v24 = swift_release(v22);
  (*(void (**)(uint64_t, uint64_t, __n128))(v12 + 8))(v15, v11, v24);
  uint64_t v25 = v1 + qword_E3F40;
  sub_DE14(v25, (uint64_t)v27, 33LL);
  AnyCancellable.store(in:)(v25);
  swift_endAccess(v27);
  *(void *)&double result = swift_release(v23).n128_u64[0];
  return result;
}

void sub_90ABC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (_TtC6SiriTV27ConversationViewCoordinator *)a1[1];
  uint64_t v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v52, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    uint64_t v8 = *(void *)(Strong + qword_E9B18);
    uint64_t v7 = *(_TtC6SiriTV27ConversationViewCoordinator **)(Strong + qword_E9B18 + 8);
    uint64_t v9 = *(void **)(Strong + qword_E9B10);
    uint64_t v10 = swift_weakLoadStrong(Strong + qword_E3F50);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = v9;
      swift_bridgeObjectRetain(v7);
      id v13 = sub_EF0C();
      id v14 = objc_msgSend(v13, "view", swift_release(v11).n128_f64[0]);

      if (v9)
      {
        if (v14)
        {
          sub_DCB4(0LL, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
          id v22 = v12;
          char v23 = static NSObject.== infix(_:_:)(v22, v14);

          if (v8 == v2 && v7 == v3)
          {
            swift_bridgeObjectRelease(v3, v24, v25, v26, v27, v28, v29, v30);
LABEL_26:
            if ((v23 & 1) != 0)
            {
LABEL_30:
              swift_bridgeObjectRetain(v3);
              sub_8FBB8(v2, (uint64_t)v3);

              return;
            }

void sub_90CD0(uint64_t a1)
{
  os_log_type_t v3 = sub_1AF14();
  if (sub_1AE80(v3))
  {
    uint64_t v4 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)uint64_t v4 = 0;
    sub_DD8C(&dword_0, v1, v2, "#tv #contentPlatter Resetting Scroll View fade", v4);
    sub_A15C((uint64_t)v4);
  }

  sub_92638();
  sub_3CA64(v5, "setContentInset:", 0.0);

  sub_92638();
  sub_3CA64(v6, "_setGradientMaskEdgeInsets:", 0.0);

  sub_92638();
  sub_3CA64(v7, "_setGradientMaskLengths:", 0.0);

  id v8 = sub_8F920();
  [v8 alpha];
  double v10 = v9;

  if (v10 > 0.0)
  {
    id v11 = sub_8F920();
    [v11 removeFromSuperview];
    sub_48FB0(v11);
  }

void sub_90DFC(uint64_t a1)
{
  if (*(_BYTE *)(v1 + qword_E9B30) == 1)
  {
    sub_8F7A8();
    os_log_type_t v3 = v2;
    [v2 setContentInsetAdjustmentBehavior:2];

    sub_8F7A8();
    id v5 = v4;
    objc_msgSend(v4, "setContentInset:", 0.0, 0.0, 5.0, 0.0);

    sub_8F7A8();
    id v7 = v6;
    sub_3CA64(v6, "_setGradientMaskEdgeInsets:", 30.0);

    sub_8F7A8();
    double v9 = v8;
    objc_msgSend(v8, "_setGradientMaskLengths:", 90.0, -60.0, 90.0, -60.0);

    sub_8F7A8();
    uint64_t v28 = v10;
    sub_27904(v10, "setClipsToBounds:");
  }

  else
  {
    uint64_t v29 = (os_log_s *)sub_3CA94(a1);
    os_log_type_t v11 = static os_log_type_t.debug.getter(v29);
    if (sub_3CCB4(v11, v12, v13, v14, v15, v16, v17, v18, v26, v29))
    {
      uint64_t v19 = (_WORD *)sub_A1D0(2LL);
      *uint64_t v19 = 0;
      sub_92690( &dword_0,  v20,  v21,  "#tv #contentPlattersDetail Not Long form content, returning configuring masking gradients",  v22,  v23,  v24,  v25,  v27,  v28);
      sub_A15C((uint64_t)v19);
    }
  }
}

void sub_90F28(uint64_t a1, CGFloat a2, double a3)
{
  if (*(_BYTE *)(v3 + qword_E9B30) != 1)
  {
    id v41 = (os_log_s *)sub_3CB50(a1);
    os_log_type_t v22 = static os_log_type_t.debug.getter(v41);
    if (sub_3CCB4(v22, v23, v24, v25, v26, v27, v28, v29, v38, v41))
    {
      id v30 = (_WORD *)sub_A1D0(2LL);
      _WORD *v30 = 0;
      sub_92690( &dword_0,  v31,  v32,  "#tv #contentPlatter Not Long form content, returning...",  v33,  v34,  v35,  v36,  v39,  v40);
      sub_A15C((uint64_t)v30);
    }

    goto LABEL_15;
  }

  id v4 = *(id *)(v3 + qword_E9B10);
  if (v4)
  {
    uint64_t v7 = type metadata accessor for VisualResponseView(0LL);
    uint64_t v8 = sub_92798(v7);
    double v9 = (os_log_s *)v4;
    id v40 = v9;
    if (v8)
    {
      id v4 = sub_92D80();
      [v4 alpha];
      if (v10 != 0.0) {
        [v4 setAlpha:0.0];
      }

      double v9 = v40;
    }

    -[os_log_s frame](v9, "frame");
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    sub_92714();
    CGFloat v18 = v17;

    sub_92714();
    CGFloat v20 = v19;

    v42.size.height = 1.0;
    v42.origin.x = v12;
    v42.origin.y = v14;
    v42.size.width = v16;
    v43.origin.x = a2;
    v43.origin.y = a3 + 30.0;
    v43.size.width = v18;
    v43.size.height = v20;
    if (CGRectIntersectsRect(v42, v43) || a3 <= 0.0)
    {
      -[os_log_s frame](v40, "frame");
      double v21 = v37 - a3;
    }

    else
    {
      double v21 = 30.0;
    }

    sub_91A7C(v21);
LABEL_15:
  }

void sub_910F8()
{
  id v2 = sub_8F920();
  [v2 alpha];
  double v4 = v3;

  if (v4 > 0.0)
  {
    id v5 = sub_8F920();
    [v5 removeFromSuperview];
  }

  id v6 = *(void **)&v0[qword_E9B10];
  if (v6)
  {
    id v7 = v6;
    id v8 = sub_8F920();
    id v9 = sub_3CAC8(v8);

    sub_8F7A8();
    double v11 = v10;
    id v1 = sub_3CAC8(v10);

    sub_DDAC(v12, "frame");
    id v14 = [v9 constraintEqualToAnchor:v1 constant:v13];

    sub_8FBF8((uint64_t)v14);
  }

  id v15 = sub_8F920();
  sub_27904(v15, "setTranslatesAutoresizingMaskIntoConstraints:");

  id v16 = sub_8F920();
  [v16 setAlpha:1.0];

  id v17 = sub_8F920();
  sub_8F7A8();
  double v19 = v18;
  [v0 insertSubview:v17 belowSubview:v18];

  CGFloat v20 = *(void **)&v0[qword_E9B38];
  if (v20)
  {
    id v21 = *(id *)&v0[qword_E9B38];
  }

  else
  {
    id v22 = sub_8F920();
    id v23 = sub_3CAC8(v22);

    sub_8F7A8();
    int v25 = v24;
    id v1 = sub_3CAC8(v24);

    id v21 = [v23 constraintEqualToAnchor:v1];
    CGFloat v20 = 0LL;
  }

  uint64_t v26 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v27 = sub_1AFD0(v26, 64LL);
  *(_OWORD *)(v27 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB340;
  id v28 = v20;
  sub_8F7A8();
  id v30 = [v29 leadingAnchor];
  sub_EDA0();
  id v31 = sub_8F920();
  id v32 = [v31 leadingAnchor];

  id v33 = sub_926F4();
  *(void *)(v27 + 32) = v33;
  id v34 = [sub_8F920() trailingAnchor];
  sub_EDA0();
  sub_8F7A8();
  int v36 = v35;
  id v37 = [v35 trailingAnchor];

  id v38 = sub_926F4();
  *(void *)(v27 + 40) = v38;
  *(void *)(v27 + 48) = v21;
  id v39 = v21;
  sub_8F7A8();
  id v41 = [v40 bottomAnchor];
  sub_EDA0();
  id v42 = sub_8F920();
  id v43 = [v42 bottomAnchor];

  id v44 = [v1 constraintEqualToAnchor:v43 constant:5.0];
  *(void *)(v27 + 56) = v44;
  specialized Array._endMutation()(v45, v46);
  id v47 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  sub_DCB4(0LL, (unint64_t *)&qword_E1040, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v47 activateConstraints:isa];

  swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v27, v48, v49, v50, v51, v52, v53, v54);
  sub_926B0(isa);
}

void sub_914A8(uint64_t a1, uint64_t a2, char a3)
{
  id v5 = v3;
  if ((a3 & 1) == 0)
  {
    id v6 = *(void **)((char *)v3 + qword_E9B20);
    if (v6)
    {
      id v8 = v6;
      id v9 = sub_9274C(v8);
      if (v10 != *(double *)&a2)
      {
        sub_3CB50((uint64_t)v9);
        os_log_type_t v11 = sub_1AF14();
        if (sub_1B2B4(v11))
        {
          uint64_t v12 = (_DWORD *)sub_A1D0(12LL);
          uint64_t v52 = sub_A1D0(32LL);
          uint64_t v54 = v52;
          _DWORD *v12 = 136315138;
          id v51 = v12 + 1;
          uint64_t v13 = Double.description.getter(*(double *)&a2);
          uint64_t v53 = sub_9278C(v13, v14, v15, v16, v17);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v12 + 1, v12 + 3);
          sub_A3C8();
          sub_926A4(&dword_0, v3, v4, "#tv ContentPlattersDetailView responseViewContentSize.height: %s");
          sub_A27C(v52);
          sub_A15C(v52);
          sub_A15C((uint64_t)v12);
        }

        [v8 setConstant:*(double *)&a2];
      }
    }
  }

  CGFloat v18 = *(void **)((char *)v3 + qword_E9B20);
  if (v18)
  {
    sub_9274C(v18);
    double v20 = v19 + 0.0;
  }

  else
  {
    double v20 = 0.0;
  }

  sub_92638();
  [v21 frame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v55.origin.x = v23;
  v55.origin.y = v25;
  v55.size.width = v27;
  v55.size.height = v29;
  BOOL v30 = CGRectGetHeight(v55) < v20;
  uint64_t v31 = qword_E9B30;
  *((_BYTE *)v3 + qword_E9B30) = v30;
  sub_8FB04();
  id v33 = v32;
  [v32 setConstant:-195.0];

  if (*((_BYTE *)v5 + v31) == 1)
  {
    sub_8FA5C();
    int v36 = v35;
    objc_msgSend(v35, "setConstant:", 30.0, v51);
  }

  else
  {
    sub_90CD0(v34);
    sub_8FA5C();
    int v36 = (void *)v37;
    sub_DDAC(v37, "frame");
    double Height = CGRectGetHeight(v56);
    sub_8FB04();
    id v40 = v39;
    sub_9274C(v39);
    double v42 = v41;

    objc_msgSend(v36, "setConstant:", fmax(Height - fabs(v42) - v20, 30.0), v51);
  }

  sub_90DFC(v43);
  sub_8F7A8();
  uint64_t v45 = v44;
  [v44 contentOffset];
  CGFloat v47 = v46;
  double v49 = v48;

  sub_90F28(v50, v47, v49);
  sub_910F8();
}

void sub_91754(void *a1)
{
  uint64_t v2 = sub_9E24(&qword_DFC88);
  uint64_t inited = swift_initStackObject(v2, v51);
  *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
  *(void *)(inited + 32) = 0LL;
  uint64_t v45 = a1;
  uint64_t v4 = sub_3CA48(inited, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
  id v5 = a1;
  uint64_t v6 = sub_9E24((uint64_t *)&unk_E16B0);
  if ((swift_dynamicCast(v46, &v45, v4, v6, 6LL) & 1) == 0)
  {
    uint64_t v47 = 0LL;
    memset(v46, 0, sizeof(v46));
    sub_22EC4((uint64_t)v46, &qword_E16A8);
    goto LABEL_5;
  }

  sub_9F74(v46, (uint64_t)v48);
  uint64_t v7 = v49;
  uint64_t v8 = v50;
  id v9 = (os_log_s *)sub_109B4(v48, v49);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if ((v10 & 1) != 0)
  {
    sub_DBAC(v48);
LABEL_5:
    char v11 = 0;
    goto LABEL_11;
  }

  sub_3CB50(v10);
  os_log_type_t v12 = sub_1AF14();
  if (sub_1AEB8(v12))
  {
    uint64_t v13 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)uint64_t v13 = 0;
    sub_DD8C(&dword_0, v9, (os_log_type_t)v7, "#tv setup indirect scrolling.", v13);
    sub_A15C((uint64_t)v13);
  }

  unint64_t v15 = *(void *)(inited + 16);
  unint64_t v14 = *(void *)(inited + 24);
  if (v15 >= v14 >> 1)
  {
    sub_FC94(v14 > 1, v15 + 1, 1, inited);
    uint64_t inited = v44;
  }

  *(void *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = v15 + 1;
  uint64_t v16 = inited + 8 * v15;
  char v11 = 1;
  *(void *)(v16 + 32) = 1LL;
  sub_DBAC(v48);
LABEL_11:
  sub_926C4();
  v17[OBJC_IVAR____TtC6SiriTV19FocusableScrollView_contentRequiresIndirectScrolling] = v11;

  uint64_t v25 = *(void *)(inited + 16);
  if (v25)
  {
    v48[0] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(inited);
    specialized ContiguousArray.reserveCapacity(_:)(v25);
    uint64_t v26 = 0LL;
    do
    {
      uint64_t v27 = v26 + 1;
      id v28 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)(inited + 8 * v26 + 32)];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v29 = *(void *)(v48[0] + 16LL);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v29);
      uint64_t v30 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v28);
      specialized ContiguousArray._endMutation()(v30);
      uint64_t v26 = v27;
    }

    while (v25 != v27);
    uint64_t v31 = (_TtC6SiriTV27ConversationViewCoordinator *)v48[0];
    swift_bridgeObjectRelease_n(inited, 2LL);
  }

  else
  {
    swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)inited, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v31 = &_swiftEmptyArrayStorage;
  }

  sub_926C4();
  id v33 = v32;
  id v34 = [v32 panGestureRecognizer];

  sub_3CA48(v35, (unint64_t *)&qword_E16C0, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v31, v37, v38, v39, v40, v41, v42, v43);
  [v34 setAllowedTouchTypes:isa];
}

id sub_91A7C(double a1)
{
  uint64_t v4 = qword_E9B38;
  id result = *(id *)((char *)v1 + qword_E9B38);
  if (!result || (id result = [result constant], v6 != a1))
  {
    sub_3CB50((uint64_t)result);
    os_log_type_t v7 = sub_1AF14();
    if (sub_1AE80(v7))
    {
      uint64_t v8 = (_DWORD *)sub_A1D0(12LL);
      *uint64_t v8 = 134217984;
      double v9 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v8 + 1, v8 + 3);
      sub_926A4(&dword_0, v1, v2, "#tv #contentPlattersDetail Setting VisualEffectView's top to %f");
      sub_A15C((uint64_t)v8);
    }

    [*(id *)((char *)v1 + v4) setConstant:a1];
    return -[os_log_s layoutIfNeeded](v1, "layoutIfNeeded");
  }

  return result;
}

uint64_t sub_91B80()
{
  *(void *)(v0 + qword_E5AA0) = 0LL;
  *(void *)(v0 + qword_E5AA8) = 0LL;
  *(void *)(v0 + qword_E5AB0) = 0LL;
  *(void *)(v0 + qword_E5AB8) = 0LL;
  *(void *)(v0 + qword_E5AC0) = 0LL;
  *(void *)(v0 + qword_E5AC8) = 0LL;
  *(void *)(v0 + qword_E5AD0) = 0LL;
  *(void *)(v0 + qword_E5AD8) = 0LL;
  *(void *)(v0 + qword_E5AE0) = 0LL;
  *(void *)(v0 + qword_E5AE8) = 0LL;
  *(void *)(v0 + qword_E9B10) = 0LL;
  id v1 = (void *)(v0 + qword_E9B18);
  *id v1 = 0LL;
  v1[1] = 0xE000000000000000LL;
  *(void *)(v0 + qword_E9B20) = 0LL;
  *(void *)(v0 + qword_E9B28) = 0LL;
  *(_BYTE *)(v0 + qword_E9B30) = 0;
  *(void *)(v0 + qword_E9B38) = 0LL;
  return sub_35008();
}

void sub_91C4C()
{
}

id sub_91D1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentPlattersDetailView(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_91D50(uint64_t a1)
{
  sub_1B4DC(qword_E5AA8);
  sub_1B4DC(qword_E5AB0);
  sub_1B4DC(qword_E5AB8);
  sub_1B4DC(qword_E5AC0);
  sub_1B4DC(qword_E5AC8);
  sub_1B4DC(qword_E5AD0);
  sub_1B4DC(qword_E5AD8);
  sub_1B4DC(qword_E5AE0);
  sub_1B4DC(qword_E5AE8);
  sub_1B4DC(qword_E9B10);
  swift_bridgeObjectRelease( *(_TtC6SiriTV27ConversationViewCoordinator **)(a1 + qword_E9B18 + 8),  v2,  v3,  v4,  v5,  v6,  v7,  v8);
  sub_1B4DC(qword_E9B20);
  swift_unknownObjectRelease(*(void *)(a1 + qword_E9B28));
}

uint64_t type metadata accessor for ContentPlattersDetailView(uint64_t a1)
{
  uint64_t result = qword_E5B18;
  if (!qword_E5B18) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContentPlattersDetailView);
  }
  return result;
}

uint64_t sub_91E68(uint64_t a1)
{
  v2[0] = "\b";
  v2[1] = "\b";
  void v2[2] = "\b";
  v2[3] = "\b";
  v2[4] = "\b";
  void v2[5] = "\b";
  v2[6] = "\b";
  v2[7] = "\b";
  v2[8] = "\b";
  void v2[9] = "\b";
  v2[10] = "\b";
  v2[11] = &unk_ADE58;
  v2[12] = "\b";
  v2[13] = "\b";
  v2[14] = &unk_ADE70;
  v2[15] = "\b";
  return swift_initClassMetadata2(a1, 256LL, 16LL, v2, a1 + 272);
}

uint64_t sub_91ED4()
{
  return type metadata accessor for ContentPlattersDetailView(0LL);
}

void sub_91EDC(void *a1, double a2, double a3)
{
  os_log_type_t v8 = sub_1AF14();
  if (sub_1B2B4(v8))
  {
    double v9 = (_DWORD *)sub_A1D0(12LL);
    uint64_t v10 = sub_A1D0(32LL);
    v23[1] = v10;
    *double v9 = 136315138;
    uint64_t v22 = *(void *)&a2;
    *(double *)CGFloat v23 = a3;
    type metadata accessor for CGSize(0LL);
    uint64_t v12 = String.init<A>(describing:)(&v22, v11);
    uint64_t v22 = sub_9278C(v12, v13, v14, v15, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v9 + 1, v9 + 3);
    sub_A3C8();
    sub_926A4(&dword_0, v3, v4, "#tv ContentPlattersDetailView responseViewContentSizeChanged to :%s");
    sub_A27C(v10);
    sub_A15C(v10);
    sub_A15C((uint64_t)v9);
  }

  if (a1)
  {
    id v17 = [a1 view];
    if (v17)
    {
      CGFloat v18 = v17;
      double v19 = *(void **)((char *)v3 + qword_E9B10);
      if (!v19
        || (sub_3CA48((uint64_t)v17, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr),
            id v20 = v19,
            char v21 = static NSObject.== infix(_:_:)(v18, v20),
            v20,
            (v21 & 1) != 0))
      {
        sub_914A8((uint64_t)v17, *(uint64_t *)&a3, 0);
      }
    }
  }

void sub_92084(void *a1, double a2, double a3)
{
}

void sub_920A4(void *a1)
{
  id v3 = v1;
  sub_3CA94((uint64_t)a1);
  os_log_type_t v5 = sub_1AF14();
  if (sub_1AEB8(v5))
  {
    id v6 = (uint8_t *)sub_A1D0(2LL);
    *(_WORD *)id v6 = 0;
    sub_DD8C(&dword_0, v1, v2, "#tv ContentPlattersDetailView responseViewContainsComponentWithActionChanged", v6);
    sub_A15C((uint64_t)v6);
  }

  if (a1)
  {
    id v7 = [a1 view];
    if (v7)
    {
      os_log_type_t v8 = v7;
      uint64_t v9 = qword_E9B10;
      uint64_t v10 = *(void **)((char *)v1 + qword_E9B10);
      uint64_t v15 = v7;
      if (v10)
      {
        sub_3CA48((uint64_t)v7, (unint64_t *)&qword_E0BD0, &OBJC_CLASS___UIView_ptr);
        id v11 = v10;
        char v12 = static NSObject.== infix(_:_:)(v15, v11);

        if ((v12 & 1) == 0)
        {
LABEL_11:
          sub_48FB0(v15);
          return;
        }

        os_log_type_t v8 = v15;
        if (*(void *)((char *)v3 + v9))
        {
          uint64_t v13 = type metadata accessor for VisualResponseView(0LL);
          uint64_t v14 = sub_92798(v13);
          os_log_type_t v8 = v15;
          if (v14) {
            *(_BYTE *)(v14 + qword_E9B50) = 1;
          }
        }
      }

      sub_91754(v8);
      goto LABEL_11;
    }
  }

void sub_921FC(void *a1)
{
}

double sub_9221C()
{
  uint64_t Strong = swift_weakLoadStrong(v0 + qword_E3F50);
  if (Strong)
  {
    uint64_t v3 = Strong;
    sub_8B84C();
    *(void *)&double result = swift_release(v3).n128_u64[0];
  }

  return result;
}

void sub_922B0(void *a1)
{
  if (v2 != 0.0)
  {
    sub_92774();
    [a1 setContentOffset:0.0];
  }

  id v3 = sub_92774();
  sub_90F28((uint64_t)v3, v4, v5);
}

void sub_92358(void *a1)
{
  id v1 = [a1 nextFocusedView];
  id v2 = sub_DDAC((uint64_t)v1, "nextFocusedItem");
  sub_923C0(v1, (uint64_t)v2);

  sub_1B25C();
  sub_ADE8();
}

void sub_923C0(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = type metadata accessor for SpacerView();
    if (!swift_dynamicCastClass(a1, v5))
    {
      id v6 = *(void **)(v2 + qword_E9B10);
      if (v6)
      {
        if (a2)
        {
          id v7 = a1;
          id v8 = v6;
          sub_92704();
          if ([v7 isDescendantOfView:v8])
          {
            uint64_t v9 = sub_92704();
            sub_8FBE0(v9);
          }

          sub_1B25C();
        }
      }
    }
  }

  sub_ADE8();
}

uint64_t sub_924A8(void *a1)
{
  id v1 = [a1 nextFocusedView];
  id v2 = sub_DDAC((uint64_t)v1, "nextFocusedItem");
  sub_92510(v1, (uint64_t)v2);

  return swift_unknownObjectRelease(v2);
}

void sub_92510(void *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      id v3 = *(void **)(v2 + qword_E9B10);
      if (v3)
      {
        id v6 = a1;
        sub_92704();
        id v4 = v3;
        if ([v6 isDescendantOfView:v4])
        {
          uint64_t v5 = sub_92704();
          sub_8FBE0(v5);
        }

        sub_1B25C();
      }
    }
  }

uint64_t sub_9260C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_92630(uint64_t *a1)
{
}

void sub_92638()
{
}

void sub_92650()
{
}

id sub_92668()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 3120), v1);
}

uint64_t sub_92678@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1);
}

void sub_92690( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
}

void sub_926A4(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

void sub_926B0(id a1)
{
}

id sub_926B8(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

void sub_926C4()
{
}

void sub_926CC()
{
}

uint64_t sub_926E4()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v1, v0);
}

id sub_926F4()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 3120), v1);
}

uint64_t sub_92704()
{
  return swift_unknownObjectRetain(v0);
}

id sub_9270C(void *a1)
{
  return [a1 *(SEL *)(v1 + 3136)];
}

id sub_92714()
{
  return [v1 *(SEL *)(v0 + 3296)];
}

  ;
}

void sub_92744()
{
}

id sub_9274C(void *a1)
{
  return [a1 *(SEL *)(v1 + 96)];
}

id sub_92754(void *a1)
{
  return [a1 *(SEL *)(v1 + 3112)];
}

uint64_t sub_9275C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_92768()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

id sub_92774()
{
  return [v0 *(SEL *)(v1 + 704)];
}

NSArray sub_92780()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_9278C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return sub_CC88(a1, a2, (uint64_t *)va);
}

uint64_t sub_92798(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

void sub_927A4()
{
}

void *sub_927AC()
{
  uint64_t v1 = qword_E5F40;
  uint64_t v2 = *(char **)(v0 + qword_E5F40);
  id v3 = v2;
  if (v2 == (_BYTE *)&dword_0 + 1)
  {
    id v3 = sub_92818(v0);
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + sub_A068(v0, v1) = v3;
    id v5 = v3;
    sub_2D0B0(v4);
  }

  sub_2D0C0(v2);
  return v3;
}

void *sub_92818(uint64_t a1)
{
  uint64_t v2 = qword_E3F38;
  uint64_t v3 = *(void *)(a1 + qword_E3F38);
  swift_retain(v3);
  sub_8D14C();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  swift_release(v3);
  sub_92B60(0LL, v5, v7);
  uint64_t v8 = *(void *)(a1 + v2);
  swift_retain(v8);
  sub_8D0FC();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_release(v8);
  sub_109B4((void *)(a1 + qword_E9B40), *(void *)(a1 + qword_E9B40 + 24));
  uint64_t v13 = *(void *)(a1 + v2);
  swift_retain(v13);
  sub_8D068();
  if (v12)
  {
    uint64_t v16 = v14;
    unint64_t v17 = v15;
    swift_release(v13);
    CGFloat v18 = (void *)VisualResponseProvider.view(for:bundleName:mode:)(v16, v17, v10, v12, 1LL);
    swift_bridgeObjectRelease(v12);
    uint64_t v19 = v16;
    unint64_t v20 = v17;
  }

  else
  {
    uint64_t v21 = v14;
    unint64_t v22 = v15;
    swift_release(v13);
    CGFloat v18 = (void *)VisualResponseProvider.view(for:mode:overload:)(v21, v22, 1LL, 0LL);
    uint64_t v19 = v21;
    unint64_t v20 = v22;
  }

  uint64_t v23 = sub_DA84(v19, v20);
  if (v18)
  {
    id v24 = v18;
    NSString v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    [v24 setViewId:v25];

    [v24 setCurrentIdiom:5];
    [v24 setSnippetWidth:656.0];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1 + qword_E9B58);
    [v24 setInteractionDelegate:Strong];
    swift_unknownObjectRelease(Strong);
    uint64_t v27 = *(void *)(a1 + v2);
    swift_retain(v27);
    sub_8D0FC();
    uint64_t v29 = v28;
    swift_release(v27);
    if (v29)
    {
      swift_bridgeObjectRelease(v29);
      uint64_t v30 = *(void *)(a1 + v2);
      swift_retain(v30);
      sub_8D1E0();
      uint64_t v32 = v31;
      swift_release(v30);
      if (v32)
      {
        NSString v33 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v32);
        [v24 setResponseViewId:v33];
      }
    }

    unsigned __int8 v34 = [v24 containsComponentsWithAction];

    *(_BYTE *)(a1 + qword_E9B50) = v34;
  }

  else
  {
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v36 = static os_log_type_t.error.getter(v35);
    if (os_log_type_enabled(v35, v36))
    {
      SEL v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)SEL v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "VisualResponseProvider returned nil for model.", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    sub_92B60(1LL, v5, v7);
    swift_bridgeObjectRelease(v7);
  }

  return v18;
}

uint64_t sub_92B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_9E24(&qword_E0370);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v26 - v15;
  id v17 = [*(id *)(v3 + qword_E9B60) currentInstrumentationTurnContext];
  id v18 = [v17 turnIdentifier];

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v18);
  id v19 = objc_allocWithZone((Class)type metadata accessor for RFSnippetRenderingContext(0LL));
  unint64_t v20 = (void *)RFSnippetRenderingContext.init(_:)(a1);
  UUID.init(uuidString:)(a2, a3);
  if (sub_9F8C((uint64_t)v9, 1LL, v10) == 1)
  {
    sub_4B1F0((uint64_t)v9);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v20 emitWithTurnIdentifier:isa];

    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v9, v10);
    Class v23 = UUID._bridgeToObjectiveC()().super.isa;
    Class v24 = UUID._bridgeToObjectiveC()().super.isa;
    [v20 emitWithTurnIdentifier:v23 aceViewId:v24];

    NSString v25 = *(void (**)(char *, uint64_t))(v11 + 8);
    v25(v14, v10);
    return ((uint64_t (*)(char *, uint64_t))v25)(v16, v10);
  }

void sub_92D6C(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + qword_E9B48);
  *(void *)(v1 + qword_E9B48) = a1;
}

id sub_92D80()
{
  uint64_t v1 = qword_E5F48;
  uint64_t v2 = *(void **)(v0 + qword_E5F48);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_E5F48);
  }

  else
  {
    uint64_t v4 = v0;
    id v5 = [objc_allocWithZone(UIView) init];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    sub_887A0();
    uint64_t v6 = *(void **)(v4 + v1);
    *(void *)(v4 + sub_A068(v0, v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0LL;
  }

  id v7 = v2;
  return v3;
}

uint64_t sub_92E0C()
{
  return *(unsigned __int8 *)(v0 + qword_E9B50);
}

void sub_92E20()
{
  uint64_t v2 = sub_927AC();
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    id v4 = v2;
    sub_92D6C(v3);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v0 addSubview:v4];
    id v5 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    uint64_t v6 = sub_9E24((uint64_t *)&unk_DF980);
    uint64_t v7 = swift_allocObject(v6, 64LL, 7LL);
    *(_OWORD *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB340;
    id v8 = sub_DDAC(v7, "bottomAnchor");
    id v9 = sub_ED8C((uint64_t)v8, "bottomAnchor");
    id v10 = sub_926F4();
    sub_276C4();

    *(void *)(v7 + 32) = v1;
    id v12 = sub_DDAC(v11, "centerXAnchor");
    id v13 = sub_ED8C((uint64_t)v12, "centerXAnchor");
    id v14 = sub_926F4();
    sub_276C4();

    *(void *)(v7 + 40) = v1;
    id v16 = sub_DDAC(v15, "leadingAnchor");
    id v17 = sub_ED8C((uint64_t)v16, "leadingAnchor");
    id v18 = sub_926F4();
    sub_276C4();

    *(void *)(v7 + 48) = v1;
    id v20 = sub_DDAC(v19, "topAnchor");
    id v21 = sub_ED8C((uint64_t)v20, "topAnchor");
    id v22 = [v20 constraintEqualToAnchor:v21];

    *(void *)(v7 + 56) = v22;
    specialized Array._endMutation()(v23, v24);
    sub_21D1C();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v7, v25, v26, v27, v28, v29, v30, v31);
    [v5 activateConstraints:isa];
  }

Class sub_93078()
{
  uint64_t v0 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_930C4();
  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v0, v2, v3, v4, v5, v6, v7, v8);
  return isa;
}

uint64_t sub_930C4()
{
  uint64_t v1 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v3 = swift_allocObject(v1, 40LL, 7LL);
  *(_OWORD *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB350;
  id v4 = *(void **)&v0[qword_E9B48];
  if (v4) {
    id v5 = *(char **)&v0[qword_E9B48];
  }
  else {
    id v5 = v0;
  }
  *(void *)(v3 + 32) = v5;
  specialized Array._endMutation()(v5, v2);
  id v6 = v4;
  return v3;
}

void sub_9314C()
{
  sub_ADC4(v0 + qword_E9B58);
}

id sub_931B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VisualResponseView(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_931EC(uint64_t a1)
{
  sub_ADC4(a1 + qword_E9B58);
}

uint64_t type metadata accessor for VisualResponseView(uint64_t a1)
{
  uint64_t result = qword_E5F78;
  if (!qword_E5F78) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VisualResponseView);
  }
  return result;
}

uint64_t sub_9329C(uint64_t a1)
{
  v2[0] = "(";
  v2[1] = &unk_ADF10;
  void v2[2] = &unk_ADF28;
  v2[3] = &unk_ADF28;
  v2[4] = &unk_ADF40;
  void v2[5] = &unk_ADF58;
  v2[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  return swift_initClassMetadata2(a1, 256LL, 7LL, v2, a1 + 272);
}

uint64_t sub_93314()
{
  return type metadata accessor for VisualResponseView(0LL);
}

uint64_t sub_9331C()
{
  return sub_92E0C() & 1;
}

uint64_t sub_93340(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v6);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1) {
    return 0LL;
  }
  id v9 = objc_allocWithZone(&OBJC_CLASS___NSNumberFormatter);
  id v10 = a1;
  id v11 = [v9 init];
  id v12 = (id)SRUIFGetLocale(v11);
  if (v12)
  {
    uint64_t v15 = v12;
    static Locale._unconditionallyBridgeFromObjectiveC(_:)(v12, v13, v14);

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
    sub_2FE1C((uint64_t)v8, 0LL);
    if (sub_9F8C((uint64_t)v8, 1LL, v2) != 1)
    {
      v16.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      goto LABEL_7;
    }
  }

  else
  {
    sub_2FE1C((uint64_t)v8, 1LL);
  }

  v16.super.Class isa = 0LL;
LABEL_7:
  [v11 setLocale:v16.super.isa];

  id v17 = sub_93538((uint64_t)[v11 setNumberStyle:1], "setMaximumFractionDigits:");
  sub_93538((uint64_t)v17, "setMinimumFractionDigits:");
  id v18 = [v11 stringFromNumber:v10];
  if (!v18)
  {

    return 0LL;
  }

  uint64_t v19 = v18;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);

  return v20;
}

id sub_93538(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 2);
}

uint64_t sub_93544(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v4 = 0x80000000000A6200LL;
    if (a2 == 0x80000000000A6200LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x80000000000A6200LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  BOOL v6 = a1 == 0x74706D6F7270LL && a2 == 0xE600000000000000LL;
  if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74706D6F7270LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x736D657469LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x736D657469LL, 0xE500000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_93674()
{
  return 3LL;
}

uint64_t sub_9367C(char a1)
{
  if (!a1) {
    return 0xD000000000000011LL;
  }
  if (a1 == 1) {
    return 0x74706D6F7270LL;
  }
  return 0x736D657469LL;
}

uint64_t sub_936D4()
{
  return sub_9367C(*v0);
}

uint64_t sub_936DC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_93544(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_93700@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_93674();
  *a1 = result;
  return result;
}

uint64_t sub_93724(uint64_t a1)
{
  unint64_t v2 = sub_96A20();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9374C(uint64_t a1)
{
  unint64_t v2 = sub_96A20();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_93774()
{
  unint64_t v3 = sub_96A20();
  sub_9758C((uint64_t)&type metadata for DisambiguationItemsModel.CodingKeys, v4, v3);
  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  char v11 = 0;
  sub_9755C(v5, v6, (uint64_t)&v11);
  if (!v1)
  {
    uint64_t v7 = v0[2];
    uint64_t v8 = v0[3];
    char v10 = 1;
    sub_9755C(v7, v8, (uint64_t)&v10);
    sub_9E24(&qword_E61C8);
    uint64_t v9 = sub_96BC4( &qword_E6238,  &qword_E61C8,  (void (*)(void))sub_96C28,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    sub_975B4(v9);
  }

  sub_975E4();
  sub_975A0();
}

void sub_93878(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_9E24(&qword_E61B8);
  sub_73D28();
  __chkstk_darwin(v6);
  sub_2FD74();
  uint64_t v7 = a1[3];
  sub_109B4(a1, v7);
  unint64_t v8 = sub_96A20();
  sub_976F0( (uint64_t)&type metadata for DisambiguationItemsModel.CodingKeys,  (uint64_t)&type metadata for DisambiguationItemsModel.CodingKeys,  v8,  v7);
  if (v2)
  {
    sub_976A8();
  }

  else
  {
    char v31 = 0;
    uint64_t v9 = sub_97698((uint64_t)&v31);
    uint64_t v11 = v10;
    uint64_t v27 = v9;
    sub_97678(v9, v10);
    uint64_t v12 = sub_97698((uint64_t)&v30);
    uint64_t v14 = v13;
    uint64_t v25 = v12;
    uint64_t v15 = sub_9E24(&qword_E61C8);
    char v29 = 2;
    uint64_t v16 = sub_96BC4( &qword_E61D0,  &qword_E61C8,  (void (*)(void))sub_96A5C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    id v26 = v14;
    sub_3CE84();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v28, v15, &v29, v5, v15, v16);
    sub_9756C();
    uint64_t v17 = v28;
    sub_3CE84();
    sub_976A8();
    sub_A208();
    swift_bridgeObjectRelease(v26, v18, v19, v20, v21, v22, v23, v24);
    sub_3CEA0();
    *a2 = v27;
    a2[1] = v11;
    a2[2] = v25;
    a2[3] = (uint64_t)v26;
    a2[4] = v17;
  }

  sub_97544();
}

unint64_t sub_93A3C(unint64_t result)
{
  if (result >= 5) {
    return 5LL;
  }
  return result;
}

uint64_t sub_93A4C(uint64_t result)
{
  return result;
}

double sub_93A54@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    double result = *(double *)v6;
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }

  return result;
}

void sub_93A98()
{
}

uint64_t sub_93AAC()
{
  return sub_6CF64(*v0);
}

uint64_t sub_93AB4(uint64_t a1)
{
  return sub_6D010(a1, *v1);
}

unint64_t sub_93ABC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_93A3C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_93AE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_93A4C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_93B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_97164();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_93B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_97164();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_93BB4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_3CE84();
  return v1;
}

void sub_93BDC(uint64_t a1)
{
  uint64_t v4 = *v1;
  unint64_t v3 = (_TtC6SiriTV27ConversationViewCoordinator *)v1[1];
  sub_3CE84();
  String.hash(into:)(a1, v4, v3);
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_93C1C(uint64_t a1)
{
  uint64_t v3 = sub_97628(a1);
  BOOL v7 = v7 && v4 == v6;
  if ((v7 || (sub_A244(v3, v4, v5, v6) & 1) != 0)
    && ((uint64_t v8 = *(void *)(v2 + 16),
         uint64_t v9 = *(void *)(v2 + 24),
         uint64_t v10 = *(void *)(v1 + 16),
         uint64_t v11 = *(void *)(v1 + 24),
         v8 == v10)
      ? (BOOL v12 = v9 == v11)
      : (BOOL v12 = 0),
        (v12 || (sub_A244(v8, v9, v10, v11) & 1) != 0) && *(unsigned __int8 *)(v2 + 32) == *(unsigned __int8 *)(v1 + 32)))
  {
    return sub_9630C(*(void *)(v2 + 40), *(void *)(v1 + 40));
  }

  else
  {
    return 0LL;
  }

uint64_t sub_93C8C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974LL && a2 == 0xE500000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x696669746E656469LL && a2 == 0xEA00000000007265LL;
    if (v6
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469LL, 0xEA00000000007265LL, a1, a2, 0LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 1701869940 && a2 == 0xE400000000000000LL;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)(1701869940LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(a2);
        return 2LL;
      }

      else if (a1 == 0x736567616D69LL && a2 == 0xE600000000000000LL)
      {
        swift_bridgeObjectRelease(a2);
        return 3LL;
      }

      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x736567616D69LL, 0xE600000000000000LL, a1, a2, 0LL);
        swift_bridgeObjectRelease(a2);
        if ((v9 & 1) != 0) {
          return 3LL;
        }
        else {
          return 4LL;
        }
      }
    }
  }

uint64_t sub_93E08()
{
  return 4LL;
}

uint64_t sub_93E10()
{
  return 0LL;
}

uint64_t sub_93E1C(char a1)
{
  return *(void *)&aTitle_2[8 * a1];
}

void sub_93E3C()
{
  unint64_t v4 = sub_96A98();
  sub_9758C((uint64_t)&type metadata for DisambiguationItem.CodingKeys, v5, v4);
  uint64_t v6 = *(void *)v1;
  uint64_t v7 = *(void *)(v1 + 8);
  char v15 = 0;
  sub_9755C(v6, v7, (uint64_t)&v15);
  if (!v2)
  {
    uint64_t v8 = *(void *)(v1 + 16);
    uint64_t v9 = *(void *)(v1 + 24);
    char v14 = 1;
    sub_9755C(v8, v9, (uint64_t)&v14);
    char v13 = *(_BYTE *)(v1 + 32);
    sub_976D8();
    unint64_t v10 = sub_96B4C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v13, &v12, v0, &unk_CD640, v10);
    sub_9E24(&qword_E61F8);
    uint64_t v11 = sub_96BC4( &qword_E6220,  &qword_E61F8,  (void (*)(void))sub_96B88,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    sub_975B4(v11);
  }

  sub_975E4();
  sub_975A0();
}

void sub_93F7C(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = (_TtC6SiriTV27ConversationViewCoordinator *)v1[1];
  sub_3CE84();
  String.hash(into:)(v11, v2, v3);
  swift_bridgeObjectRelease(v3, v4, v5, v6, v7, v8, v9, v10);
  sub_976C0();
  sub_6D11C();
}

void sub_93FBC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = a1[3];
  sub_109B4(a1, v6);
  unint64_t v7 = sub_96A98();
  sub_976F0( (uint64_t)&type metadata for DisambiguationItem.CodingKeys,  (uint64_t)&type metadata for DisambiguationItem.CodingKeys,  v7,  v6);
  if (v2)
  {
    sub_DBAC(a1);
  }

  else
  {
    char v26 = 0;
    uint64_t v8 = sub_976B0((uint64_t)&v26);
    uint64_t v10 = v9;
    sub_97678(v8, v9);
    uint64_t v11 = sub_976B0((uint64_t)&v25);
    char v13 = v12;
    uint64_t v22 = v11;
    sub_976D8();
    unint64_t v14 = sub_96AD4();
    sub_3CE84();
    sub_976E4();
    if (v14)
    {
      sub_9757C();
      sub_3CBD0();
      sub_A208();
      sub_DBAC(a1);
      sub_A208();
      sub_3CBD0();
    }

    else
    {
      sub_9E24(&qword_E61F8);
      sub_96BC4( &qword_E6200,  &qword_E61F8,  (void (*)(void))sub_96B10,  (uint64_t)&protocol conformance descriptor for <A> [A]);
      sub_976E4();
      sub_9757C();
      sub_3CE84();
      sub_DBAC(a1);
      sub_A208();
      swift_bridgeObjectRelease(v13, v15, v16, v17, v18, v19, v20, v21);
      sub_3CBD0();
      *(void *)a2 = v8;
      *(void *)(a2 + 8) = v10;
      *(void *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v22;
      *(void *)(a2 + 24) = v13;
      *(_BYTE *)(a2 + 32) = v24;
      *(void *)(a2 + 40) = v23;
    }
  }

  sub_97544();
}

unint64_t sub_941C0(unint64_t result)
{
  if (result >= 3) {
    return 3LL;
  }
  return result;
}

void sub_941D0()
{
}

uint64_t sub_941E8()
{
  return sub_93E1C(*v0);
}

uint64_t sub_941F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_93C8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_94214()
{
  return sub_93E10();
}

uint64_t sub_94230@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_93E08();
  *a1 = result;
  return result;
}

uint64_t sub_94254(uint64_t a1)
{
  unint64_t v2 = sub_96A98();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9427C(uint64_t a1)
{
  unint64_t v2 = sub_96A98();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_942A4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
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

void sub_942E4()
{
}

Swift::Int sub_94300()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)(v4);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v4, v1, v2);
  swift_bridgeObjectRelease(v2);
  return Hasher._finalize()();
}

uint64_t sub_94354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_93BB4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_9437C(uint64_t a1)
{
}

unint64_t sub_94384@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_941C0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_943AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_974E8();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_94408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_974E8();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_94454()
{
  uint64_t v1 = *v0;
  sub_3CE84();
  return v1;
}

uint64_t sub_9447C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  return sub_5E7B0((uint64_t)v1);
}

BOOL sub_944C0(uint64_t a1)
{
  uint64_t v3 = sub_97628(a1);
  BOOL v7 = v7 && v4 == v6;
  if (v7) {
    return *(unsigned __int8 *)(v2 + 16) == *(unsigned __int8 *)(v1 + 16)
  }
        && *(void *)(v2 + 24) == *(void *)(v1 + 24)
        && *(void *)(v2 + 32) == *(void *)(v1 + 32);
  char v8 = sub_A244(v3, v4, v5, v6);
  BOOL result = 0LL;
  if ((v8 & 1) != 0) {
    return *(unsigned __int8 *)(v2 + 16) == *(unsigned __int8 *)(v1 + 16)
  }
        && *(void *)(v2 + 24) == *(void *)(v1 + 24)
        && *(void *)(v2 + 32) == *(void *)(v1 + 32);
  return result;
}

uint64_t sub_9452C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574616C706D6574LL && a2 == 0xEB000000006C7255LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574616C706D6574LL, 0xEB000000006C7255LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x7079546567616D69LL && a2 == 0xE900000000000065LL;
    if (v6
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7079546567616D69LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x6874646977LL && a2 == 0xE500000000000000LL;
      if (v7
        || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6874646977LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(a2);
        return 2LL;
      }

      else if (a1 == 0x746867696568LL && a2 == 0xE600000000000000LL)
      {
        swift_bridgeObjectRelease(a2);
        return 3LL;
      }

      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746867696568LL, 0xE600000000000000LL, a1, a2, 0LL);
        swift_bridgeObjectRelease(a2);
        if ((v9 & 1) != 0) {
          return 3LL;
        }
        else {
          return 4LL;
        }
      }
    }
  }

void sub_946C8(uint64_t a1)
{
  unsigned __int8 v1 = a1;
  sub_97644(a1);
  Hasher._combine(_:)(v1);
  sub_976C0();
  sub_6D11C();
}

uint64_t sub_946F8(char a1)
{
  return *(void *)&aTemplateimaget[8 * a1];
}

void sub_94718()
{
  unint64_t v4 = sub_971A0();
  sub_9758C((uint64_t)&type metadata for DisambiguationImage.CodingKeys, v5, v4);
  uint64_t v6 = *v1;
  uint64_t v7 = v1[1];
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v6, v7, &v15, v0);
  if (!v2)
  {
    char v14 = *((_BYTE *)v1 + 16);
    char v13 = 1;
    unint64_t v8 = sub_97218();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v14, &v13, v0, &unk_CD760, v8);
    sub_976D8();
    sub_976C8(v9, (uint64_t)&v12);
    uint64_t v10 = v1[4];
    char v11 = 3;
    sub_976C8(v10, (uint64_t)&v11);
  }

  sub_975E4();
  sub_975A0();
}

Swift::Int sub_94830(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v5, v2, v3);
  sub_5E7B0((uint64_t)v1);
  return sub_976C0();
}

void sub_94884(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_9E24(&qword_E6290);
  sub_73D28();
  __chkstk_darwin(v6);
  sub_A1F8();
  uint64_t v7 = a1[3];
  sub_109B4(a1, v7);
  unint64_t v8 = sub_971A0();
  sub_976F0( (uint64_t)&type metadata for DisambiguationImage.CodingKeys,  (uint64_t)&type metadata for DisambiguationImage.CodingKeys,  v8,  v7);
  if (v2)
  {
    sub_976A8();
  }

  else
  {
    BYTE1(v19) = 0;
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)((char *)&v19 + 1, v5);
    uint64_t v11 = v10;
    char v18 = 1;
    unint64_t v12 = sub_971DC();
    swift_bridgeObjectRetain(v11);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v19, &unk_CD760, &v18, v5, &unk_CD760, v12);
    char v15 = v19;
    sub_976D8();
    uint64_t v14 = sub_97688((uint64_t)&v17);
    char v16 = 3;
    uint64_t v13 = sub_97688((uint64_t)&v16);
    sub_975D4();
    sub_DBAC(a1);
    sub_A4F4();
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v11;
    *(_BYTE *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v15;
    *(void *)(a2 + 24) = v14;
    *(void *)(a2 + 32) = v13;
  }

  sub_97544();
}

void sub_94A20()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v2);
  Hasher._combine(_:)(v1);
  sub_976C0();
  sub_6D11C();
}

uint64_t sub_94A54()
{
  return sub_946F8(*v0);
}

uint64_t sub_94A5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_9452C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_94A80(uint64_t a1)
{
  unint64_t v2 = sub_971A0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_94AA8(uint64_t a1)
{
  unint64_t v2 = sub_971A0();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_94AD0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    double result = *(double *)v6;
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }

  return result;
}

void sub_94B14()
{
}

Swift::Int sub_94B28(uint64_t a1)
{
  return sub_94830(a1);
}

uint64_t sub_94B60(uint64_t a1)
{
  return sub_9447C(a1);
}

uint64_t sub_94B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_94454();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_94BC0@<X0>(void *a1@<X8>)
{
  uint64_t v244 = a1;
  sub_9E24(&qword_DF5E8);
  sub_A13C();
  __chkstk_darwin(v2);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v3);
  sub_A258();
  uint64_t v219 = v4;
  uint64_t v5 = sub_A24C();
  uint64_t v6 = type metadata accessor for ImageElement(v5);
  sub_A228(v6, (uint64_t)&v248);
  uint64_t v223 = v7;
  sub_A13C();
  __chkstk_darwin(v8);
  sub_A118();
  uint64_t v221 = v9;
  uint64_t v10 = sub_A24C();
  uint64_t v246 = type metadata accessor for ImageElement.Background(v10);
  uint64_t v243 = *(void *)(v246 - 8);
  sub_A13C();
  __chkstk_darwin(v11);
  sub_A118();
  uint64_t v242 = v12;
  uint64_t v13 = sub_A24C();
  uint64_t v14 = type metadata accessor for ImageElement.SourceType(v13);
  sub_A228(v14, (uint64_t)&v247);
  uint64_t v241 = v15;
  sub_A13C();
  __chkstk_darwin(v16);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v17);
  sub_A258();
  uint64_t v218 = v18;
  uint64_t v19 = sub_A24C();
  uint64_t v20 = type metadata accessor for ImageElement.CornerRoundingMode(v19);
  sub_A228(v20, (uint64_t)&v246);
  uint64_t v214 = v21;
  sub_A13C();
  __chkstk_darwin(v22);
  sub_A118();
  uint64_t v215 = v23;
  uint64_t v24 = sub_A24C();
  uint64_t v25 = type metadata accessor for ImageElement.RenderingMode(v24);
  sub_A228(v25, (uint64_t)&v241);
  uint64_t v211 = v26;
  sub_A13C();
  __chkstk_darwin(v27);
  sub_A118();
  uint64_t v213 = v28;
  uint64_t v29 = sub_A24C();
  uint64_t v30 = type metadata accessor for ImageElement.ContentMode(v29);
  sub_A228(v30, (uint64_t)&v239);
  uint64_t v209 = v31;
  sub_A13C();
  __chkstk_darwin(v32);
  sub_A118();
  sub_A398(v33);
  sub_9E24((uint64_t *)&unk_DF5F0);
  sub_A13C();
  __chkstk_darwin(v34);
  sub_A118();
  sub_A398(v35);
  sub_9E24(&qword_DF5E0);
  sub_A13C();
  __chkstk_darwin(v36);
  sub_A118();
  sub_A398(v37);
  sub_9E24((uint64_t *)&unk_E0280);
  sub_A13C();
  __chkstk_darwin(v38);
  sub_A118();
  uint64_t v227 = v39;
  uint64_t v40 = sub_A24C();
  uint64_t v41 = type metadata accessor for ImageElement.Url(v40);
  uint64_t v239 = *(void *)(v41 - 8);
  uint64_t v240 = v41;
  sub_A13C();
  __chkstk_darwin(v42);
  sub_A118();
  uint64_t v238 = v43;
  uint64_t v44 = sub_A24C();
  uint64_t v45 = type metadata accessor for ImageElement.AspectRatio(v44);
  uint64_t v236 = *(void *)(v45 - 8);
  uint64_t v237 = v45;
  sub_A13C();
  __chkstk_darwin(v46);
  sub_A118();
  uint64_t v235 = v47;
  uint64_t v48 = sub_A24C();
  uint64_t v230 = type metadata accessor for Vibrancy(v48);
  uint64_t v206 = *(void *)(v230 - 8);
  sub_A13C();
  __chkstk_darwin(v49);
  sub_A118();
  uint64_t v229 = v50;
  uint64_t v51 = sub_A24C();
  uint64_t v52 = type metadata accessor for ImageElement.ImageStyle(v51);
  uint64_t v207 = *(void *)(v52 - 8);
  sub_A13C();
  __chkstk_darwin(v53);
  sub_A118();
  uint64_t v228 = v54;
  uint64_t v55 = sub_A24C();
  uint64_t v56 = type metadata accessor for ImageElement.SymbolRenderingMode(v55);
  sub_A228(v56, (uint64_t)&v249);
  uint64_t v205 = (char *)v57;
  sub_A13C();
  __chkstk_darwin(v58);
  sub_A118();
  sub_A398(v59);
  sub_9E24(&qword_DF5C8);
  sub_A13C();
  __chkstk_darwin(v60);
  sub_A118();
  uint64_t v62 = v61;
  sub_9E24((uint64_t *)&unk_DF5D0);
  sub_A13C();
  __chkstk_darwin(v63);
  sub_A1F8();
  uint64_t v66 = v65 - v64;
  uint64_t v234 = type metadata accessor for ImageElement.Symbol(0LL);
  uint64_t v232 = *(void *)(v234 - 8);
  sub_A13C();
  __chkstk_darwin(v67);
  sub_A148();
  uint64_t v231 = v68;
  __chkstk_darwin(v69);
  sub_A258();
  uint64_t v233 = v70;
  uint64_t v71 = sub_A24C();
  uint64_t v72 = type metadata accessor for URL(v71);
  uint64_t v245 = *(void *)(v72 - 8);
  sub_A13C();
  __chkstk_darwin(v73);
  sub_A148();
  sub_A12C();
  __chkstk_darwin(v74);
  sub_A258();
  uint64_t v76 = v75;
  uint64_t v77 = sub_9E24(&qword_E0F88);
  sub_A13C();
  uint64_t v79 = __chkstk_darwin(v78);
  id v81 = (char *)&v191 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v79);
  uint64_t v83 = (char *)&v191 - v82;
  if (qword_DEC00 != -1) {
    swift_once(&qword_DEC00, sub_6570);
  }
  uint64_t v204 = sub_9E0C(v52, (uint64_t)qword_E9788);
  double v84 = static ImageElement.size(for:idiom:)(v204, 5LL);
  SEL v85 = &v83[*(int *)(v77 + 48)];
  sub_95EBC((uint64_t)v83, *(void *)(v1 + 40), 0, 1, v84, v86);
  double v88 = v87;
  double v90 = v89;
  *(double *)SEL v85 = v87;
  *((double *)v85 + 1) = v89;
  id v91 = (double *)&v81[*(int *)(v77 + 48)];
  sub_965AC((uint64_t)v83, (uint64_t)v81);
  *id v91 = v88;
  v91[1] = v90;
  if (sub_9F8C((uint64_t)v81, 1LL, v72) == 1)
  {
    sub_22EC4((uint64_t)v83, &qword_E0F88);
    uint64_t result = sub_22EC4((uint64_t)v81, (uint64_t *)&unk_E0280);
    uint64_t v93 = v244;
    *(_OWORD *)uint64_t v244 = 0u;
    *((_OWORD *)v93 + 1) = 0u;
    v93[4] = 0LL;
  }

  else
  {
    uint64_t v94 = v72;
    uint64_t v95 = *(void (**)(uint64_t, char *, uint64_t))(v245 + 32);
    uint64_t v208 = v76;
    v95(v76, v81, v72);
    uint64_t v96 = *(char *)(v1 + 32);
    uint64_t v197 = *(void *)&aEllipsisfilm[8 * v96];
    uint64_t v97 = v197;
    uint64_t v98 = *(void *)&aAppstoreellips[8 * v96 + 16];
    uint64_t v192 = type metadata accessor for Color(0LL);
    sub_A58C();
    sub_9E64(v99, v100, v101, v102);
    uint64_t v103 = v62;
    uint64_t v194 = v62;
    sub_A58C();
    sub_9E64(v104, v105, v106, v246);
    int v203 = enum case for ImageElement.SymbolRenderingMode.default(_:);
    sub_A2F4();
    uint64_t v202 = v107;
    uint64_t v205 = v83;
    uint64_t v108 = v226;
    sub_A420(v226, v109, v107);
    int v200 = enum case for ImageElement.ImageStyle.default(_:);
    uint64_t v110 = v52;
    uint64_t v111 = v207;
    uint64_t v201 = *(void (**)(uint64_t))(v207 + 104);
    uint64_t v112 = v228;
    uint64_t v113 = v66;
    uint64_t v114 = v110;
    uint64_t v193 = v110;
    v201(v228);
    int v199 = enum case for Vibrancy.default(_:);
    sub_A2F4();
    uint64_t v198 = v115;
    uint64_t v116 = v229;
    v115();
    uint64_t v196 = v98;
    swift_bridgeObjectRetain(v98);
    uint64_t v189 = v116;
    uint64_t v117 = v233;
    uint64_t v118 = v97;
    uint64_t v119 = v112;
    ImageElement.Symbol.init(_:darkModeName:tintColor:symbolRenderingMode:imageStyle:background:punchesThroughBackground:vibrancy:)( v118,  v98,  0LL,  0LL,  v113,  v108,  v112,  v103,  0,  v189);
    float v120 = v88;
    float v121 = v90;
    uint64_t v122 = v235;
    ImageElement.AspectRatio.init(width:height:)(v123, v120, v121);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v245 + 16))(v225, v208, v94);
    sub_A58C();
    sub_9E64(v124, v125, v126, v94);
    uint64_t v195 = *(void (**)(uint64_t, uint64_t, uint64_t))(v232 + 16);
    uint64_t v127 = v210;
    v195(v210, v117, v234);
    uint64_t v128 = enum case for ImageElement.SourceType.LoadingImage.symbol(_:);
    uint64_t v129 = type metadata accessor for ImageElement.SourceType.LoadingImage(0LL);
    uint64_t v206 = v94;
    uint64_t v130 = v129;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v129 - 8) + 104LL))(v127, v128, v129);
    sub_9E64(v127, 0LL, 1LL, v130);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16))(v119, v204, v114);
    uint64_t v207 = *(void *)(v236 + 16);
    uint64_t v131 = v216;
    uint64_t v132 = v122;
    uint64_t v133 = v122;
    uint64_t v134 = v237;
    ((void (*)(uint64_t, uint64_t, uint64_t))v207)(v216, v132, v237);
    sub_97650();
    sub_A58C();
    sub_9E64(v135, v136, v137, v192);
    sub_A2F4();
    uint64_t v138 = v212;
    sub_A420(v212, v139, v140);
    sub_A2F4();
    uint64_t v141 = v213;
    sub_A420(v213, v142, v143);
    sub_A2F4();
    uint64_t v144 = v215;
    sub_A420(v215, v145, v146);
    uint64_t v187 = v144;
    uint64_t v147 = v238;
    ImageElement.Url.init(_:darkModeSource:loadingImage:contentMode:imageStyle:aspectRatio:fixedWidth:fixedHeight:renderingMode:backgroundColor:cornerRoundingMode:insetPadding:)( v225,  v227,  v127,  v138,  v119,  v131,  0LL,  2LL,  0.0,  v141,  v113,  v187);
    uint64_t v148 = v218;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v239 + 16))(v218, v147, v240);
    uint64_t v149 = v241;
    uint64_t v227 = *(void (**)(uint64_t, void, uint64_t))(v241 + 104);
    uint64_t v150 = v222;
    v227(v148, enum case for ImageElement.SourceType.url(_:), v222);
    sub_97664();
    ((void (*)(uint64_t, uint64_t, uint64_t))v207)(v131, v133, v134);
    sub_97650();
    uint64_t v151 = v242;
    ImageElement.Background.init(color:aspectRatio:fixedWidth:fixedHeight:)(v113, v131, 0LL, 2LL);
    sub_97664();
    uint64_t v152 = v194;
    uint64_t v153 = v151;
    uint64_t v154 = v246;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v243 + 16))(v194, v153, v246);
    sub_9E64(v152, 0LL, 1LL, v154);
    uint64_t v155 = v226;
    sub_A4CC((uint64_t)&v230);
    uint64_t v156 = v228;
    sub_A4CC((uint64_t)&v229);
    uint64_t v157 = v229;
    sub_A4CC((uint64_t)&v227);
    uint64_t v190 = v157;
    LOBYTE(v188) = 0;
    uint64_t v158 = v231;
    __n128 v159 = ImageElement.Symbol.init(_:darkModeName:tintColor:symbolRenderingMode:imageStyle:background:punchesThroughBackground:vibrancy:)( v197,  v196,  0LL,  0LL,  v113,  v155,  v156,  v152,  v188,  v190);
    uint64_t v160 = v217;
    uint64_t v161 = v234;
    ((void (*)(uint64_t, uint64_t, uint64_t, __n128))v195)(v217, v158, v234, v159);
    sub_A4CC((uint64_t)&v250);
    uint64_t v162 = v219;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 16))(v219, v148, v150);
    sub_9E64(v162, 0LL, 1LL, v150);
    uint64_t v163 = v220;
    sub_A58C();
    sub_9E64(v164, v165, v166, v150);
    uint64_t v167 = sub_9E24((uint64_t *)&unk_E0F90);
    uint64_t v168 = type metadata accessor for _ProtoIdiom(0LL);
    uint64_t v169 = *(void *)(v168 - 8);
    uint64_t v170 = *(unsigned __int8 *)(v169 + 80);
    uint64_t v171 = (v170 + 32) & ~v170;
    uint64_t v172 = swift_allocObject(v167, v171 + *(void *)(v169 + 72), v170 | 7);
    *(_OWORD *)(v172 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
    (*(void (**)(uint64_t, void, uint64_t))(v169 + 104))( v172 + v171,  enum case for _ProtoIdiom.default(_:),  v168);
    uint64_t v173 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_29D48(v172);
    uint64_t v174 = v221;
    static ImageElement.siritv_sources(primarySource:secondarySource:fallbackSource:idioms:)(v162, v163, v160, v221);
    swift_bridgeObjectRelease(v173, v175, v176, v177, v178, v179, v180, v181);
    sub_22EC4(v163, &qword_DF5E8);
    sub_22EC4(v162, &qword_DF5E8);
    uint64_t v182 = type metadata accessor for VisualProperty(0LL);
    uint64_t v183 = v244;
    v244[3] = v182;
    v183[4] = &protocol witness table for VisualProperty;
    sub_9F38(v183);
    uint64_t v184 = v224;
    VisualPropertyConvertible<>.asVisualProperty()(v224);
    (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v174, v184);
    id v185 = *(void (**)(uint64_t, uint64_t))(v241 + 8);
    v185(v160, v150);
    uint64_t v186 = *(void (**)(uint64_t, uint64_t))(v232 + 8);
    v186(v231, v161);
    (*(void (**)(uint64_t, uint64_t))(v243 + 8))(v242, v246);
    v185(v148, v150);
    (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v238, v240);
    (*(void (**)(uint64_t, uint64_t))(v236 + 8))(v235, v237);
    v186(v233, v161);
    (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v208, v206);
    return sub_22EC4((uint64_t)v205, &qword_E0F88);
  }

  return result;
}

void sub_9581C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_A1F8();
  uint64_t v15 = v14 - v13;
  uint64_t v17 = *(void *)(v3 + 16);
  uint64_t v16 = *(_TtC6SiriTV27ConversationViewCoordinator **)(v3 + 24);
  uint64_t v18 = sub_95B58(v17, (uint64_t)v16);
  if (v19 >> 60 == 15) {
    goto LABEL_6;
  }
  uint64_t v57 = v10;
  uint64_t v58 = a3;
  if (!a2)
  {
    sub_DB98(v18, v19);
LABEL_6:
    uint64_t v38 = sub_9E24((uint64_t *)&unk_E0380);
    uint64_t v39 = swift_allocObject(v38, 64LL, 7LL);
    *(_OWORD *)(v39 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
    _StringGuts.grow(_:)(60LL);
    v40._object = (void *)0x80000000000A6190LL;
    v40._countAndFlagsBits = 0xD00000000000003ALL;
    String.append(_:)(v40);
    swift_bridgeObjectRetain(v16);
    v41._countAndFlagsBits = v17;
    v41._object = v16;
    String.append(_:)(v41);
    swift_bridgeObjectRelease(v16, v42, v43, v44, v45, v46, v47, v48);
    *(void *)(v39 + 56) = &type metadata for String;
    *(void *)(v39 + 32) = 0LL;
    *(void *)(v39 + 40) = 0xE000000000000000LL;
    print(_:separator:terminator:)(v39, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
    swift_bridgeObjectRelease((_TtC6SiriTV27ConversationViewCoordinator *)v39, v49, v50, v51, v52, v53, v54, v55);
    *(void *)(a3 + 32) = 0LL;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
    return;
  }

  uint64_t v20 = v18;
  unint64_t v21 = v19;
  id v22 = [objc_allocWithZone(SARemoteDevice) init];
  sub_964E8(a1, a2, v22);
  id v23 = [objc_allocWithZone(SAExecuteOnRemoteRequest) init];
  uint64_t v24 = UUID.init()(v23);
  uint64_t v25 = UUID.uuidString.getter(v24);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  sub_D38C(v25);
  [v23 setRemoteDevice:v22];
  sub_9652C(v20, v21, v23);
  type metadata accessor for CommandConverter();
  uint64_t v26 = sub_9E24((uint64_t *)&unk_DF980);
  uint64_t v27 = swift_allocObject(v26, 40LL, 7LL);
  *(_OWORD *)(v27 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB350;
  *(void *)(v27 + 32) = v23;
  uint64_t v59 = (_TtC6SiriTV27ConversationViewCoordinator *)v27;
  specialized Array._endMutation()(v27, v28);
  id v29 = v23;
  sub_44E70((unint64_t)v59, v57);
  swift_bridgeObjectRelease(v59, v30, v31, v32, v33, v34, v35, v36);
  uint64_t v37 = type metadata accessor for Command(0LL);
  if (sub_9F8C(v57, 1LL, v37) == 1)
  {
    sub_DB98(v20, v21);

    sub_22EC4(v57, &qword_DF5C0);
    *(_OWORD *)uint64_t v58 = 0u;
    *(_OWORD *)(v58 + swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
    *(void *)(v58 + 32) = 0LL;
  }

  else
  {
    *(void *)(v58 + 24) = v37;
    *(void *)(v58 + 32) = &protocol witness table for Command;
    uint64_t v56 = sub_9F38((void *)v58);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 32LL))(v56, v57, v37);
    sub_DB98(v20, v21);
  }

uint64_t sub_95B58(uint64_t a1, uint64_t a2)
{
  id v4 = sub_95E4C(0xD00000000000002CLL, 0x80000000000A61D0LL);
  uint64_t v5 = sub_9E24(&qword_E2910);
  uint64_t inited = swift_initStackObject(v5, v24);
  *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
  v23[0] = (id)0x696669746E656469LL;
  v23[1] = (id)0xEA00000000007265LL;
  AnyHashable.init<A>(_:)(v23, &type metadata for String, &protocol witness table for String);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v7 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  sub_9647C(v7, v4);
  id v8 = [objc_allocWithZone(SKIDirectInvocationContext) init];
  [v8 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v8 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___SKIDirectInvocation);
  id v10 = [v9 runSiriKitExecutorCommandWithContext:v8 payload:v4];
  id v11 = [v9 wrapCommandInStartLocalRequest:v10];
  id v12 = [objc_allocWithZone(SAStartUIRequest) init];
  [v12 setStartLocalRequest:v11];
  id v13 = [v12 dictionary];
  if (!v13)
  {

LABEL_6:
    return 0LL;
  }

  uint64_t v14 = v13;
  uint64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
  v23[0] = 0LL;
  id v16 = [v15 dataWithPropertyList:v14 format:200 options:0 error:v23];
  id v17 = v23[0];
  if (!v16)
  {
    unint64_t v19 = v17;
    uint64_t v20 = _convertNSErrorToError(_:)(v17);

    swift_willThrow(v21);
    swift_errorRelease(v20);
    goto LABEL_6;
  }

  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);

  return v18;
}

id sub_95E4C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithIdentifier:v5];

  return v6;
}

void sub_95EBC(uint64_t a1, uint64_t a2, char a3, char a4, double a5, double a6)
{
  uint64_t v7 = *(void *)(a2 + 16);
  if (!v7) {
    goto LABEL_9;
  }
  if (*(_BYTE *)(a2 + 48) == 2)
  {
    id v12 = (uint64_t *)(a2 + 32);
    id v13 = (uint64_t *)(a2 + 64);
    uint64_t v14 = (uint64_t *)(a2 + 56);
    uint64_t v15 = (_TtC6SiriTV27ConversationViewCoordinator **)(a2 + 40);
LABEL_11:
    uint64_t v19 = *v13;
    uint64_t v20 = *v14;
    uint64_t v21 = *v15;
    uint64_t v22 = *v12;
    swift_bridgeObjectRetain(*v15);
    id v23 = [(id)objc_opt_self(UIScreen) mainScreen];
    id v24 = [v23 traitCollection];

    [v24 displayScale];
    double v26 = v25;

    if (v26 <= 1.0) {
      double v26 = 1.0;
    }
    if (v20 >= 1 && v19 >= 1)
    {
      v30.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      if ((a3 & 1) != 0) {
        v29.n128_f64[0] = a5;
      }
      else {
        v29.n128_f64[0] = 1.79769313e308;
      }
      if ((a4 & 1) != 0) {
        v30.n128_f64[0] = a6;
      }
      v28.n128_f64[0] = (double)v19;
      a5 = SiriUIAspectFitSizeInSizeWithScale(v27, (double)v20, v28, v29, v30, v26);
      a6 = v32;
    }

    sub_96098( 7496556LL,  (_TtC6SiriTV27ConversationViewCoordinator *)0xE300000000000000LL,  v22,  v21,  a1,  v26 * a5,  v26 * a6);
    swift_bridgeObjectRelease(v21, v33, v34, v35, v36, v37, v38, v39);
    return;
  }

  if (v7 == 1)
  {
LABEL_9:
    uint64_t v18 = type metadata accessor for URL(0LL);
    sub_9E64(a1, 1LL, 1LL, v18);
    return;
  }

  id v13 = (uint64_t *)(a2 + 104);
  uint64_t v16 = 1LL;
  while (1)
  {
    uint64_t v17 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (*((_BYTE *)v13 - 16) == 2)
    {
      id v12 = v13 - 4;
      uint64_t v15 = (_TtC6SiriTV27ConversationViewCoordinator **)(v13 - 3);
      uint64_t v14 = v13 - 1;
      goto LABEL_11;
    }

    v13 += 5;
    ++v16;
    if (v17 == v7) {
      goto LABEL_9;
    }
  }

  __break(1u);
}

void sub_96098( uint64_t a1@<X0>, _TtC6SiriTV27ConversationViewCoordinator *a2@<X1>, uint64_t a3@<X2>, _TtC6SiriTV27ConversationViewCoordinator *a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  if (a2)
  {
    uint64_t v72 = a3;
    uint64_t v73 = a4;
    uint64_t v70 = 8222587LL;
    unint64_t v71 = 0xE300000000000000LL;
    uint64_t v11 = sub_9E24((uint64_t *)&unk_DF640);
    uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
    *(_OWORD *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_AB130;
    *(void *)(v12 + 56) = &type metadata for CGFloat;
    unint64_t v13 = sub_965F4();
    *(void *)(v12 + 64) = v13;
    *(double *)(v12 + 32) = a6;
    uint64_t v14 = String.init(format:_:)(1714433573LL, 0xE400000000000000LL, v12);
    uint64_t v16 = v15;
    uint64_t v68 = v14;
    uint64_t v69 = v15;
    unint64_t v17 = sub_9FC4();
    uint64_t v18 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v70,  &v68,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17,  1LL,  2LL);
    uint64_t v20 = (_TtC6SiriTV27ConversationViewCoordinator *)v19;
    swift_bridgeObjectRelease(v16, v19, v21, v22, v23, v24, v25, v26);
    uint64_t v72 = v18;
    uint64_t v73 = v20;
    uint64_t v70 = 8218747LL;
    unint64_t v71 = 0xE300000000000000LL;
    uint64_t v27 = swift_allocObject(v11, 72LL, 7LL);
    *(_OWORD *)(v27 + swift_unknownObjectWeakDestroy(v0 + 16) = v64;
    *(void *)(v27 + 56) = &type metadata for CGFloat;
    *(void *)(v27 + 64) = v13;
    *(double *)(v27 + 32) = a7;
    uint64_t v28 = String.init(format:_:)(1714433573LL, 0xE400000000000000LL, v27);
    __n128 v30 = v29;
    uint64_t v68 = v28;
    uint64_t v69 = v29;
    uint64_t v31 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v70,  &v68,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17,  v64,  *((void *)&v64 + 1));
    SEL v33 = (_TtC6SiriTV27ConversationViewCoordinator *)v32;
    swift_bridgeObjectRelease(v20, v32, v34, v35, v36, v37, v38, v39);
    swift_bridgeObjectRelease(v30, v40, v41, v42, v43, v44, v45, v46);
    uint64_t v72 = v31;
    uint64_t v73 = v33;
    uint64_t v70 = 8218235LL;
    unint64_t v71 = 0xE300000000000000LL;
    uint64_t v68 = a1;
    uint64_t v69 = a2;
    uint64_t v47 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v70,  &v68,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17,  v65,  v66);
    SEL v49 = (_TtC6SiriTV27ConversationViewCoordinator *)v48;
    swift_bridgeObjectRelease(v33, v48, v50, v51, v52, v53, v54, v55);
    URL.init(string:)(v47, v49);
    swift_bridgeObjectRelease(v49, v56, v57, v58, v59, v60, v61, v62);
  }

  else
  {
    uint64_t v63 = type metadata accessor for URL(0LL);
    sub_9E64(a5, 1LL, 1LL, v63);
  }

uint64_t sub_9630C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (!v2) {
    return 1LL;
  }
  uint64_t v3 = a2;
  if (a1 == a2) {
    return 1LL;
  }
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(v3 + 32);
  uint64_t v11 = *(void *)(v3 + 40);
  int v12 = *(unsigned __int8 *)(v3 + 48);
  uint64_t v14 = *(void *)(v3 + 56);
  uint64_t v13 = *(void *)(v3 + 64);
  BOOL v15 = result == v10 && v6 == v11;
  uint64_t v39 = v3;
  if (v15)
  {
    if (v7 == v12 && v9 == v14 && v8 == v13) {
      goto LABEL_25;
    }
    return 0LL;
  }

  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(result, v6, v10, v11, 0LL);
  uint64_t result = 0LL;
  if ((v16 & 1) == 0) {
    return result;
  }
  BOOL v17 = v7 == v12 && v9 == v14;
  BOOL v18 = v17 && v8 == v13;
  uint64_t v3 = v39;
  if (!v18) {
    return result;
  }
LABEL_25:
  if (v2 == 1) {
    return 1LL;
  }
  uint64_t v21 = 0LL;
  unint64_t v22 = 1LL;
  while (v22 < v2)
  {
    uint64_t v23 = *(void *)(a1 + v21 + 72);
    uint64_t v24 = *(void *)(a1 + v21 + 80);
    int v25 = *(unsigned __int8 *)(a1 + v21 + 88);
    uint64_t v27 = *(void *)(a1 + v21 + 96);
    uint64_t v26 = *(void *)(a1 + v21 + 104);
    uint64_t v28 = *(void *)(v3 + v21 + 72);
    uint64_t v29 = *(void *)(v3 + v21 + 80);
    int v30 = *(unsigned __int8 *)(v3 + v21 + 88);
    uint64_t v32 = *(void *)(v3 + v21 + 96);
    uint64_t v31 = *(void *)(v3 + v21 + 104);
    if (v23 == v28 && v24 == v29)
    {
      if (v25 != v30 || v27 != v32 || v26 != v31) {
        return 0LL;
      }
    }

    else
    {
      char v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v28, v29, 0LL);
      uint64_t result = 0LL;
      if ((v34 & 1) == 0) {
        return result;
      }
      BOOL v35 = v25 == v30 && v27 == v32;
      BOOL v36 = v35 && v26 == v31;
      uint64_t v3 = v39;
      if (!v36) {
        return result;
      }
    }

    ++v22;
    v21 += 40LL;
    uint64_t result = 1LL;
    if (v2 == v22) {
      return result;
    }
  }

  __break(1u);
  return result;
}

void sub_9647C(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  [a2 setUserData:isa];
}

void sub_964E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = String._bridgeToObjectiveC()();
  [a3 setAssistantId:v4];
}

void sub_9652C(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [a3 setSerializedCommand:isa];
}

unint64_t sub_96570()
{
  unint64_t result = qword_E61A0;
  if (!qword_E61A0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SKIDirectInvocationPayload);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_E61A0);
  }

  return result;
}

uint64_t sub_965AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9E24((uint64_t *)&unk_E0280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_965F4()
{
  unint64_t result = qword_E61A8;
  if (!qword_E61A8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_E61A8);
  }

  return result;
}

uint64_t sub_96630(void *a1)
{
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t sub_96660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t sub_966BC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 sub_96748(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_9675C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t sub_967B8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t sub_967F8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
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

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for DisambiguationItem()
{
}

uint64_t sub_96850(void *a1)
{
  return swift_bridgeObjectRelease(a1[4]);
}

void *sub_96880(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[4];
  a1[4] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *sub_968D4(void *a1, void *a2)
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
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 sub_96958(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

void *sub_9696C(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(a1[3]);
  uint64_t v6 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  return a1;
}

void type metadata accessor for DisambiguationItemsModel()
{
}

void *sub_969D4()
{
  return &protocol witness table for String;
}

unint64_t sub_969E4()
{
  unint64_t result = qword_E61B0;
  if (!qword_E61B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE004, &unk_CD370);
    atomic_store(result, (unint64_t *)&qword_E61B0);
  }

  return result;
}

unint64_t sub_96A20()
{
  unint64_t result = qword_E61C0;
  if (!qword_E61C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE4F0, &type metadata for DisambiguationItemsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E61C0);
  }

  return result;
}

unint64_t sub_96A5C()
{
  unint64_t result = qword_E61D8;
  if (!qword_E61D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE08C, &unk_CD370);
    atomic_store(result, (unint64_t *)&qword_E61D8);
  }

  return result;
}

unint64_t sub_96A98()
{
  unint64_t result = qword_E61E8;
  if (!qword_E61E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE4A0, &type metadata for DisambiguationItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E61E8);
  }

  return result;
}

unint64_t sub_96AD4()
{
  unint64_t result = qword_E61F0;
  if (!qword_E61F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE478, &unk_CD640);
    atomic_store(result, (unint64_t *)&qword_E61F0);
  }

  return result;
}

unint64_t sub_96B10()
{
  unint64_t result = qword_E6208;
  if (!qword_E6208)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE450, &unk_CD5A0);
    atomic_store(result, (unint64_t *)&qword_E6208);
  }

  return result;
}

unint64_t sub_96B4C()
{
  unint64_t result = qword_E6218;
  if (!qword_E6218)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE428, &unk_CD640);
    atomic_store(result, (unint64_t *)&qword_E6218);
  }

  return result;
}

unint64_t sub_96B88()
{
  unint64_t result = qword_E6228;
  if (!qword_E6228)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE400, &unk_CD5A0);
    atomic_store(result, (unint64_t *)&qword_E6228);
  }

  return result;
}

uint64_t sub_96BC4(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_1A990(a2);
    a3();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_96C28()
{
  unint64_t result = qword_E6240;
  if (!qword_E6240)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE064, &unk_CD370);
    atomic_store(result, (unint64_t *)&qword_E6240);
  }

  return result;
}

ValueMetadata *type metadata accessor for DisambiguationItem.CodingKeys()
{
  return &type metadata for DisambiguationItem.CodingKeys;
}

ValueMetadata *type metadata accessor for DisambiguationItemsModel.CodingKeys()
{
  return &type metadata for DisambiguationItemsModel.CodingKeys;
}

uint64_t sub_96C94(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t sub_96C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t sub_96CD8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_96D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t sub_96D80(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t sub_96DC0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for DisambiguationImage()
{
}

uint64_t sub_96E14(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }

uint64_t sub_96E9C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(sub_A03C(v2, v1, v4) = 1;
  }
  else {
    LODWORD(sub_A03C(v2, v1, v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_96EE8 + 4 * byte_ADF85[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_96F1C + 4 * byte_ADF80[v4]))();
}

uint64_t sub_96F1C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_96F24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x96F2CLL);
  }
  return result;
}

uint64_t sub_96F38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x96F40LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_96F44(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_96F4C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DisambiguationItem.ItemType()
{
}

unint64_t sub_96F68()
{
  unint64_t result = qword_E6248;
  if (!qword_E6248)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE1C8, &unk_CD640);
    atomic_store(result, (unint64_t *)&qword_E6248);
  }

  return result;
}

unint64_t sub_96FA8()
{
  unint64_t result = qword_E6250;
  if (!qword_E6250)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE1F0, &unk_CD5A0);
    atomic_store(result, (unint64_t *)&qword_E6250);
  }

  return result;
}

unint64_t sub_96FE8()
{
  unint64_t result = qword_E6258;
  if (!qword_E6258)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE320, &type metadata for DisambiguationItemsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6258);
  }

  return result;
}

unint64_t sub_97028()
{
  unint64_t result = qword_E6260;
  if (!qword_E6260)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE3D8, &type metadata for DisambiguationItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6260);
  }

  return result;
}

unint64_t sub_97068()
{
  unint64_t result = qword_E6268;
  if (!qword_E6268)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE348, &type metadata for DisambiguationItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6268);
  }

  return result;
}

unint64_t sub_970A8()
{
  unint64_t result = qword_E6270;
  if (!qword_E6270)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE370, &type metadata for DisambiguationItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6270);
  }

  return result;
}

unint64_t sub_970E8()
{
  unint64_t result = qword_E6278;
  if (!qword_E6278)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE290, &type metadata for DisambiguationItemsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6278);
  }

  return result;
}

unint64_t sub_97128()
{
  unint64_t result = qword_E6280;
  if (!qword_E6280)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE2B8, &type metadata for DisambiguationItemsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6280);
  }

  return result;
}

unint64_t sub_97164()
{
  unint64_t result = qword_E6288;
  if (!qword_E6288)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE150, &unk_CD640);
    atomic_store(result, (unint64_t *)&qword_E6288);
  }

  return result;
}

unint64_t sub_971A0()
{
  unint64_t result = qword_E6298;
  if (!qword_E6298)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE6F4, &type metadata for DisambiguationImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E6298);
  }

  return result;
}

unint64_t sub_971DC()
{
  unint64_t result = qword_E62A0;
  if (!qword_E62A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE6CC, &unk_CD760);
    atomic_store(result, (unint64_t *)&qword_E62A0);
  }

  return result;
}

unint64_t sub_97218()
{
  unint64_t result = qword_E62B0;
  if (!qword_E62B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE6A4, &unk_CD760);
    atomic_store(result, (unint64_t *)&qword_E62B0);
  }

  return result;
}

uint64_t _s6SiriTV18DisambiguationItemV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(sub_A03C(v2, v1, v4) = 1;
  }
  else {
    LODWORD(sub_A03C(v2, v1, v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_972A0 + 4 * byte_ADF8F[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_972D4 + 4 * byte_ADF8A[v4]))();
}

uint64_t sub_972D4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_972DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x972E4LL);
  }
  return result;
}

uint64_t sub_972F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x972F8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_972FC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_97304(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationImage.CodingKeys()
{
  return &type metadata for DisambiguationImage.CodingKeys;
}

uint64_t _s6SiriTV24DisambiguationItemsModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_A03C(v2, v1, v4) = 1;
  }
  else {
    LODWORD(sub_A03C(v2, v1, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_9736C + 4 * byte_ADF99[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_973A0 + 4 * byte_ADF94[v4]))();
}

uint64_t sub_973A0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_973A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x973B0LL);
  }
  return result;
}

uint64_t sub_973BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x973C4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_973C8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_973D0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DisambiguationImage.ImageType()
{
}

unint64_t sub_973EC()
{
  unint64_t result = qword_E62B8;
  if (!qword_E62B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE5C4, &unk_CD760);
    atomic_store(result, (unint64_t *)&qword_E62B8);
  }

  return result;
}

unint64_t sub_9742C()
{
  unint64_t result = qword_E62C0;
  if (!qword_E62C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE67C, &type metadata for DisambiguationImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E62C0);
  }

  return result;
}

unint64_t sub_9746C()
{
  unint64_t result = qword_E62C8;
  if (!qword_E62C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE5EC, &type metadata for DisambiguationImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E62C8);
  }

  return result;
}

unint64_t sub_974AC()
{
  unint64_t result = qword_E62D0;
  if (!qword_E62D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE614, &type metadata for DisambiguationImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_E62D0);
  }

  return result;
}

unint64_t sub_974E8()
{
  unint64_t result = qword_E62D8;
  if (!qword_E62D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE54C, &unk_CD760);
    atomic_store(result, (unint64_t *)&qword_E62D8);
  }

  return result;
}

  ;
}

uint64_t sub_9755C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_9756C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_9757C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_9758C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

  ;
}

uint64_t sub_975B4(uint64_t a1)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(v3 - 80, v3 - 81, v1, v2, a1);
}

uint64_t sub_975D4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_975E4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void *sub_975F4()
{
  return sub_109B4(v0, v0[3]);
}

  ;
}

uint64_t sub_97628(uint64_t a1)
{
  return *(void *)a1;
}

void *sub_97644(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va);
}

uint64_t sub_97650()
{
  return sub_9E64(v1, 0LL, 1LL, v0);
}

uint64_t sub_97664()
{
  return sub_9E64(v0, 1LL, 1LL, v1);
}

uint64_t sub_97678(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(v2 - 66) = 1;
  return swift_bridgeObjectRetain(a2);
}

uint64_t sub_97688(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_97698(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_976A8()
{
  return sub_DBAC(v0);
}

uint64_t sub_976B0(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

Swift::Int sub_976C0()
{
  return Hasher._finalize()();
}

uint64_t sub_976C8(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v2);
}

void sub_976D8()
{
  *(_BYTE *)(v0 - 68) = 2;
}

uint64_t sub_976E4()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_976F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)(a1, a2, a3, a4, v4);
}

id sub_976F8(void *a1)
{
  double v4 = v3;
  [a1 frame];
  double v5 = v4 / CGRectGetHeight(v10);
  double v6 = 1.0 - v5;
  if (v5 < 0.0) {
    double v6 = 1.0;
  }
  BOOL v7 = v5 < 1.0;
  double v8 = 0.0;
  if (v7) {
    double v8 = v6;
  }
  return [a1 setAlpha:v8];
}

void *sub_97770()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_9E24(&qword_E0FB0);
  __chkstk_darwin(v2);
  sub_A1F8();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for PersonNameComponents(0LL);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  id v58 = (char *)&v57 - v10;
  uint64_t v11 = type metadata accessor for Locale(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_A1F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v16);
  sub_A1F8();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_9E70(v1);
  uint64_t v22 = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAVCSContentTypePersonValue);
  if (!v22)
  {
    sub_A3C8();
    return &_swiftEmptyArrayStorage;
  }

  if (v20 == v23 && v22 == v24)
  {
    swift_bridgeObjectRelease(v22);
    sub_A3C8();
  }

  else
  {
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, v23, v24, 0LL);
    swift_bridgeObjectRelease(v22);
    sub_A3C8();
    if ((v26 & 1) == 0) {
      return &_swiftEmptyArrayStorage;
    }
  }

  sub_6C620(v1);
  if (!v27) {
    return &_swiftEmptyArrayStorage;
  }
  id v28 = [objc_allocWithZone(NSPersonNameComponentsFormatter) init];
  id v29 = (id)SRUIFGetLocale();
  if (v29)
  {
    int v30 = v29;
    static Locale._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v19, v15, v11);
    sub_2FE28(v19, 0LL);
    if (sub_9F8C(v19, 1LL, v11) != 1)
    {
      v31.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v19, v11);
      goto LABEL_16;
    }
  }

  else
  {
    sub_2FE28(v19, 1LL);
  }

  v31.super.Class isa = 0LL;
LABEL_16:
  [v28 setLocale:v31.super.isa];

  NSString v32 = String._bridgeToObjectiveC()();
  sub_A3C8();
  id v33 = [v28 personNameComponentsFromString:v32];

  uint64_t v34 = v60;
  if (!v33)
  {
    sub_2FE28(v5, 1LL);
    goto LABEL_23;
  }

  static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)(v33);

  BOOL v35 = *(void (**)(uint64_t, char *, uint64_t))(v59 + 32);
  v35(v5, v9, v34);
  sub_2FE28(v5, 0LL);
  if (sub_9F8C(v5, 1LL, v34) == 1)
  {
LABEL_23:
    sub_3055C(v5);

    return &_swiftEmptyArrayStorage;
  }

  uint64_t v36 = ((uint64_t (*)(char *, uint64_t, uint64_t))v35)(v58, v5, v34);
  uint64_t v37 = PersonNameComponents.givenName.getter(v36);
  if (v38)
  {
    uint64_t v39 = v37;
    uint64_t v40 = v38;
    sub_F8B8(0LL, 1LL, 1LL, (uint64_t)&_swiftEmptyArrayStorage);
    id v42 = v41;
    unint64_t v44 = v41[2];
    unint64_t v43 = v41[3];
    if (v44 >= v43 >> 1)
    {
      sub_97B88(v43);
      id v42 = v54;
    }

    v42[2] = v44 + 1;
    id v45 = (char *)&v42[2 * v44];
    *((void *)v45 + 4) = v39;
    *((void *)v45 + 5) = v40;
  }

  else
  {
    id v42 = &_swiftEmptyArrayStorage;
  }

  uint64_t v47 = PersonNameComponents.familyName.getter();
  if (v48)
  {
    uint64_t v49 = v47;
    uint64_t v50 = v48;
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
    {
      sub_F8B8(0LL, v42[2] + 1LL, 1LL, (uint64_t)v42);
      id v42 = v55;
    }

    unint64_t v52 = v42[2];
    unint64_t v51 = v42[3];
    if (v52 >= v51 >> 1)
    {
      sub_97B88(v51);
      id v42 = v56;
    }

    v42[2] = v52 + 1;
    id v53 = (char *)&v42[2 * v52];
    *((void *)v53 + 4) = v49;
    *((void *)v53 + 5) = v50;

    sub_A448();
  }

  else
  {
    sub_A448();
  }

  return v42;
}

void sub_97B88(unint64_t a1@<X8>)
{
}

void sub_97BA0(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_shadowView);
  *(void *)(v1 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_shadowView) = a1;
}

void *sub_97BB4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_animationContext;
  sub_DE14(v3, (uint64_t)v5, 1LL);
  sub_3F84C(v3, (uint64_t)v6);
  sub_3F84C(a1, v3);
  return sub_99F24( v6,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_99F88);
}

uint64_t (*sub_97C1C(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

double sub_97C60()
{
  return 0.4;
}

void sub_97C78()
{
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_direction) & 1) != 0) {
    sub_98098();
  }
  else {
    sub_97C90();
  }
}

void sub_97C90()
{
  __int128 v64 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v65 = *(void *)(v10 - 8);
  uint64_t v66 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v67 = type metadata accessor for DispatchTime(0LL);
  uint64_t v13 = *(void *)(v67 - 8);
  uint64_t v14 = __chkstk_darwin(v67);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v57 - v17;
  uint64_t v19 = sub_1AFD0((uint64_t)&unk_CD900, 176LL);
  sub_3F2C0(v5, (uint64_t)v81);
  sub_3F84C((uint64_t)v81, (uint64_t)v82);
  if (sub_98A64(v82) == 1)
  {
    swift_deallocUninitializedObject(v19, 176LL, 7LL);
    [v5 completeTransition:1];
  }

  else
  {
    sub_9A1A0((void *)(v19 + 16), v82);
    id v20 = [v5 containerView];
    uint64_t v63 = v9;
    id v21 = v20;
    sub_27904(v20, "setClipsToBounds:");
    uint64_t v22 = *(void *)(v19 + 24);
    uint64_t v23 = *(void *)(v19 + 48);
    uint64_t v24 = *(void *)(v19 + 56);
    v70[0] = *(void *)(v19 + 16);
    v70[1] = v22;
    __int128 v71 = *(_OWORD *)(v19 + 32);
    uint64_t v72 = v23;
    uint64_t v73 = v24;
    __int128 v25 = *(_OWORD *)(v19 + 80);
    __int128 v74 = *(_OWORD *)(v19 + 64);
    __int128 v75 = v25;
    __int128 v26 = *(_OWORD *)(v19 + 112);
    __int128 v76 = *(_OWORD *)(v19 + 96);
    __int128 v77 = v26;
    __int128 v27 = *(_OWORD *)(v19 + 144);
    __int128 v78 = *(_OWORD *)(v19 + 128);
    __int128 v79 = v27;
    __int128 v80 = *(_OWORD *)(v19 + 160);
    id v28 = (id)v74;
    uint64_t v62 = v7;
    id v29 = v28;
    uint64_t v30 = sub_98A7C((uint64_t)v70);
    uint64_t v61 = v6;
    sub_3CB1C(v30, "frame");
    sub_9A15C();
    sub_3CB1C(v31, "bounds");
    CGFloat Width = CGRectGetWidth(v83);
    sub_3CB1C(v33, "frame");
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v42 = sub_98B10((uint64_t)v70);
    sub_9A108(v42, "setFrame:");
    [v21 addSubview:v29];
    unint64_t v43 = sub_8CC08();
    uint64_t v59 = static OS_dispatch_queue.main.getter(v43);
    static DispatchTime.now()();
    + infix(_:_:)(v16, 0.5);
    uint64_t v60 = *(void (**)(char *, uint64_t))(v13 + 8);
    v60(v16, v67);
    unint64_t v44 = (CGFloat *)sub_1AFD0((uint64_t)&unk_CD928, 120LL);
    id v45 = v64;
    *((void *)v44 + 2) = v64;
    *((void *)v44 + 3) = v21;
    *((void *)v44 + 4) = v19;
    *((void *)v44 + 5) = v29;
    v44[6] = Width;
    *((void *)v44 + 7) = v1;
    *((void *)v44 + 8) = v2;
    *((void *)v44 + 9) = v3;
    *((void *)v44 + 10) = v35;
    *((void *)v44 + 11) = v37;
    *((void *)v44 + 12) = v39;
    *((void *)v44 + 13) = v41;
    *((void *)v44 + 14) = v5;
    v68[4] = sub_995FC;
    uint64_t v69 = v44;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 1107296256LL;
    v68[2] = sub_6F768;
    v68[3] = &unk_CD940;
    id v46 = _Block_copy(v68);
    uint64_t v47 = v69;
    id v58 = v29;
    id v48 = v45;
    id v49 = v21;
    swift_retain(v19);
    swift_unknownObjectRetain(v5);
    swift_release(v47);
    static DispatchQoS.unspecified.getter(v50);
    v68[0] = &_swiftEmptyArrayStorage;
    unint64_t v51 = sub_739A0();
    uint64_t v52 = sub_9E24((uint64_t *)&unk_E4680);
    unint64_t v53 = sub_739E0();
    id v54 = v63;
    uint64_t v55 = v61;
    dispatch thunk of SetAlgebra.init<A>(_:)(v68, v52, v53, v61, v51);
    SEL v56 = (void *)v59;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v18, v12, v54, v46);
    _Block_release(v46);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v54, v55);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v12, v66);
    v60(v18, v67);
    sub_3C96C();
  }

  sub_9A0CC();
}

void sub_98098()
{
  uint64_t v124 = v1;
  uint64_t v125 = v5;
  uint64_t v7 = v6;
  id v8 = [v6 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (v8)
  {
    uint64_t v110 = v8;
    uint64_t v9 = type metadata accessor for ContentPlattersViewController(0LL);
    uint64_t v10 = (void *)swift_dynamicCastClass(v110, v9);
    if (v10)
    {
      id v11 = [v10 view];
      if (v11)
      {
        uint64_t v104 = (uint64_t)v11;
        id v12 = [v7 viewControllerForKey:UITransitionContextFromViewControllerKey];
        if (v12)
        {
          uint64_t v98 = v12;
          uint64_t v20 = type metadata accessor for ContentPlattersDetailViewController(0LL);
          id v21 = (void *)swift_dynamicCastClass(v98, v20);
          if (v21)
          {
            id v29 = [v21 view];
            if (v29)
            {
              uint64_t v37 = v29;
              uint64_t v38 = (uint64_t)&v0[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_animationContext];
              sub_DE14((uint64_t)&v0[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_animationContext], (uint64_t)v120, 0LL);
              sub_3F84C(v38, (uint64_t)v121);
              sub_3F84C((uint64_t)v121, (uint64_t)v122);
              if (sub_98A64(v122) == 1)
              {
                sub_9A144(1, v39, v40, v41, v42, v43, v44, v45, v92, (uint64_t)v98, v104, v110);

                sub_4EEC0(v46, v47, v48, v49, v50, v51, v52, v53, v93, v99);
              }

              else
              {
                sub_9A1A0(v123, v122);
                sub_3F84C((uint64_t)v121, (uint64_t)v119);
                sub_98A7C((uint64_t)v119);
                id v55 = [v7 containerView];
                sub_27904(v55, "setClipsToBounds:");
                [v55 addSubview:v104];
                SEL v56 = (void *)v122[10];
                uint64_t v57 = v122[11];
                uint64_t v58 = v122[12];
                uint64_t v59 = v122[13];
                uint64_t v60 = v122[14];
                if (v122[9]) {
                  objc_msgSend(v55, "bringSubviewToFront:");
                }
                [v55 bringSubviewToFront:v37];
                [v37 frame];
                sub_9A15C();
                CGFloat Width = CGRectGetWidth(v126);
                id v62 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:*(void *)&v0[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_timingParameters] timingParameters:0.0];
                sub_27904(v62, "setUserInteractionEnabled:");
                uint64_t v63 = (CGFloat *)sub_1AFD0((uint64_t)&unk_CDB08, 216LL);
                *((void *)v63 + 2) = v37;
                v63[3] = Width;
                *((void *)v63 + 4) = v2;
                *((void *)v63 + 5) = v3;
                *((void *)v63 + 6) = v4;
                sub_9A1A0(v63 + 7, v123);
                uint64_t v117 = sub_99D30;
                uint64_t v118 = v63;
                __int128 v64 = sub_9A0F4( (uint64_t)&unk_CDB20,  v92,  (uint64_t)v98,  v104,  (uint64_t)v110,  (char)_NSConcreteStackBlock,  1107296256LL,  (uint64_t)v115,  (uint64_t)v116);
                uint64_t v65 = v118;
                sub_99F24( v121,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_99D44);
                id v94 = v37;
                objc_msgSend(v62, "addAnimations:", v64, swift_release(v118).n128_f64[0]);
                _Block_release(v64);
                id v66 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:*(void *)&v0[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_opacityTimingParameters] timingParameters:0.0];
                if (v56)
                {
                  uint64_t v67 = (void *)sub_1AFD0((uint64_t)&unk_CDC48, 56LL);
                  v67[2] = v56;
                  v67[3] = v57;
                  v67[4] = v58;
                  v67[5] = v59;
                  v67[6] = v60;
                  sub_9A120();
                  sub_9A0F4( (uint64_t)&unk_CDC60,  (uint64_t)v94,  v101,  v108,  v111,  v113,  v114,  (uint64_t)v115,  (uint64_t)v116);
                  id v68 = sub_9A194();
                  sub_9A1B0();
                  sub_9A14C();
                  _Block_release(v65);
                }

                uint64_t v69 = *(void **)&v0[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_shadowView];
                if (v69)
                {
                  *(void *)(sub_1AFD0((uint64_t)&unk_CDBF8, 24LL) + swift_unknownObjectWeakDestroy(v0 + 16) = v69;
                  sub_9A120();
                  sub_9A0F4( (uint64_t)&unk_CDC10,  (uint64_t)v94,  v101,  v108,  v111,  v113,  v114,  (uint64_t)v115,  (uint64_t)v116);
                  id v70 = sub_9A194();
                  sub_9A1B0();
                  sub_9A14C();
                  _Block_release(v65);
                }

                *(void *)(sub_1AFD0((uint64_t)&unk_CDB58, 24LL) + swift_unknownObjectWeakDestroy(v0 + 16) = v108;
                sub_9A120();
                __int128 v71 = sub_9A0F4( (uint64_t)&unk_CDB70,  (uint64_t)v94,  v101,  v108,  v111,  v113,  v114,  (uint64_t)v115,  (uint64_t)v116);
                id v72 = v109;
                sub_3C96C();
                [v66 addAnimations:v71 delayFactor:0.8];
                _Block_release(v71);
                uint64_t v73 = sub_1AFD0((uint64_t)&unk_CDBA8, 32LL);
                *(void *)(v73 + swift_unknownObjectWeakDestroy(v0 + 16) = v0;
                *(void *)(v73 + 24) = v7;
                sub_9A120();
                uint64_t v115 = sub_20820;
                uint64_t v116 = &unk_CDBC0;
                __int128 v74 = _Block_copy(&v113);
                __int128 v75 = v0;
                swift_unknownObjectRetain(v7);
                sub_3C96C();
                [v62 addCompletion:v74];
                _Block_release(v74);
                [v66 startAnimation];
                [v62 startAnimation];

                sub_4EEC0(v76, v77, v78, v79, v80, v81, v82, v83, (uint64_t)v95, v102);
                sub_9A144(v84, v85, v86, v87, v88, v89, v90, v91, v96, v103, (uint64_t)v109, v112);
                sub_99F24( v121,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_99F88);
              }

              goto LABEL_21;
            }

            sub_9A144(0, v30, v31, v32, v33, v34, v35, v36, v92, (uint64_t)v98, v104, v110);

            id v54 = v100;
LABEL_12:

            return;
          }

          sub_4EEC0(0, v22, v23, v24, v25, v26, v27, v28, v92, v98);
        }

        sub_9A144((int)v12, v13, v14, v15, v16, v17, v18, v19, v92, v97, v104, v110);
        id v54 = v106;
        goto LABEL_12;
      }
    }

    id v54 = v110;
    goto LABEL_12;
  }

void sub_98628()
{
  uint64_t v1 = (void *)AFSiriLogContextConnection;
  if (AFSiriLogContextConnection)
  {
    uint64_t v2 = v0;
    Logger.init(_:)(v1);
    uint64_t v3 = OBJC_IVAR____TtC6SiriTV18TransitionAnimator_timingParameters;
    id v4 = objc_allocWithZone(&OBJC_CLASS___UISpringTimingParameters);
    *(void *)&v2[v3] = sub_9A130(v4, "initWithMass:stiffness:damping:initialVelocity:", v5, 125.0);
    uint64_t v6 = OBJC_IVAR____TtC6SiriTV18TransitionAnimator_opacityTimingParameters;
    id v7 = objc_allocWithZone(&OBJC_CLASS___UISpringTimingParameters);
    *(void *)&v2[v6] = sub_9A130(v7, "initWithMass:stiffness:damping:initialVelocity:", v8, 250.0);
    *(void *)&v2[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_shadowView] = 0LL;
    v2[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_direction] = 0;
    uint64_t v9 = (uint64_t)&v2[OBJC_IVAR____TtC6SiriTV18TransitionAnimator_animationContext];
    sub_3F844(v11);
    sub_3F84C((uint64_t)v11, v9);

    v10.receiver = v2;
    v10.super_class = (Class)type metadata accessor for TransitionAnimator(0LL);
    objc_msgSendSuper2(&v10, "init");
  }

  else
  {
    __break(1u);
  }

id sub_9874C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TransitionAnimator(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_98814()
{
  return type metadata accessor for TransitionAnimator(0LL);
}

uint64_t type metadata accessor for TransitionAnimator(uint64_t a1)
{
  uint64_t result = qword_E6370;
  if (!qword_E6370) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TransitionAnimator);
  }
  return result;
}

uint64_t sub_98854(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = "\b";
    v4[4] = &unk_AE890;
    void v4[5] = &unk_AE8A8;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for TransitionDirection(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_A03C(v2, v1, v4) = 1;
  }
  else {
    LODWORD(sub_A03C(v2, v1, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_98938 + 4 * byte_AE855[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_9896C + 4 * byte_AE850[v4]))();
}

uint64_t sub_9896C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_98974(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9897CLL);
  }
  return result;
}

uint64_t sub_98988(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x98990LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_98994(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9899C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TransitionDirection()
{
  return &type metadata for TransitionDirection;
}

unint64_t sub_989BC()
{
  unint64_t result = qword_E6380;
  if (!qword_E6380)
  {
    unint64_t result = swift_getWitnessTable(&unk_AE914, &type metadata for TransitionDirection);
    atomic_store(result, (unint64_t *)&qword_E6380);
  }

  return result;
}

uint64_t sub_989F8()
{
  sub_9A1A8();
  return swift_deallocObject(v0, 176LL, 7LL);
}

uint64_t sub_98A64(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

uint64_t sub_98A7C(uint64_t a1)
{
  objc_super v2 = *(void **)a1;
  int v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  double v5 = *(void **)(a1 + 24);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  double v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 64);
  objc_super v10 = *(void **)(a1 + 72);
  int v23 = *(void **)(a1 + 80);
  id v11 = *(id *)(a1 + 120);
  id v12 = v2;
  id v13 = v3;
  id v14 = v4;
  id v15 = v5;
  id v16 = v6;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v23;
  return a1;
}

uint64_t sub_98B10(uint64_t a1)
{
  objc_super v2 = *(void **)a1;
  int v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  double v5 = *(void **)(a1 + 24);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  double v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 72);
  objc_super v10 = *(void **)(a1 + 80);
  id v12 = *(void **)(a1 + 120);

  return a1;
}

void sub_98BA4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v101 = *a5;
  uint64_t v111 = a5[2];
  uint64_t v112 = a5[1];
  uint64_t v109 = a5[4];
  uint64_t v110 = a5[3];
  uint64_t v107 = a5[6];
  uint64_t v108 = a5[5];
  uint64_t v106 = a5[7];
  objc_super v10 = (const void *)(a3 + 16);
  id v11 = sub_99650(a2);
  swift_beginAccess(v10, v134, 1LL, 0LL);
  id v12 = *(void **)(a3 + 80);
  *(void *)(a3 + 80) = v11;
  id v13 = v11;

  swift_beginAccess(v10, v133, 0LL, 0LL);
  memcpy(__dst, v10, sizeof(__dst));
  sub_98A7C((uint64_t)__dst);
  id v14 = sub_99714();
  sub_98B10((uint64_t)__dst);
  swift_beginAccess(v10, v132, 1LL, 0LL);
  id v15 = *(void **)(a3 + 88);
  *(void *)(a3 + 88) = v14;
  id v16 = v14;

  swift_beginAccess(v10, v131, 0LL, 0LL);
  uint64_t v17 = *(void *)(a3 + 24);
  uint64_t v18 = *(void *)(a3 + 48);
  uint64_t v19 = *(void *)(a3 + 72);
  *(void *)&__src[0] = *(void *)(a3 + 16);
  *((void *)&__src[0] + 1) = v17;
  __src[1] = *(_OWORD *)(a3 + 32);
  *(void *)&__src[2] = v18;
  *(_OWORD *)((char *)&__src[2] + 8) = *(_OWORD *)(a3 + 56);
  *((void *)&__src[3] + 1) = v19;
  __int128 v20 = *(_OWORD *)(a3 + 96);
  __src[4] = *(_OWORD *)(a3 + 80);
  __src[5] = v20;
  __int128 v21 = *(_OWORD *)(a3 + 128);
  __src[6] = *(_OWORD *)(a3 + 112);
  __src[7] = v21;
  __int128 v22 = *(_OWORD *)(a3 + 160);
  __src[8] = *(_OWORD *)(a3 + 144);
  __src[9] = v22;
  memcpy(v138, __src, sizeof(v138));
  id v23 = *(id *)&__src[1];
  sub_98A7C((uint64_t)__src);
  uint64_t v116 = v13;
  uint64_t v24 = a1;
  id v25 = sub_997C8(v23);
  sub_98B10((uint64_t)__src);

  id v26 = [objc_allocWithZone(UIView) init];
  id v27 = [(id)objc_opt_self(UIColor) blackColor];
  [v26 setBackgroundColor:v27];

  uint64_t v99 = 0LL;
  objc_msgSend(v26, "setAlpha:");
  [v25 bounds];
  objc_msgSend(v26, "setFrame:");
  [v16 addSubview:v26];
  id v117 = v26;
  uint64_t v118 = v24;
  sub_97BA0((uint64_t)v26);
  [v25 frame];
  CGFloat v29 = v28;
  uint64_t v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  swift_beginAccess(v10, v130, 1LL, 0LL);
  int v36 = *(void **)(a3 + 136);
  *(void *)(a3 + 136) = v25;
  *(CGFloat *)(a3 + sub_9F74((__int128 *)(v1 - 192), v1 - 144) = v29;
  *(void *)(a3 + 152) = v31;
  *(CGFloat *)(a3 + sub_1AD30(v0, v1 - 160) = v33;
  *(CGFloat *)(a3 + 168) = v35;
  id v37 = v25;

  swift_beginAccess(v10, &v129, 0LL, 0LL);
  memcpy(v137, v10, sizeof(v137));
  uint64_t v38 = sub_98A7C((uint64_t)v137);
  double v39 = sub_3F588(v38);
  double v41 = v40;
  uint64_t v43 = v42;
  uint64_t v100 = v44;
  double v45 = sub_3F760(v39);
  uint64_t v103 = v46;
  double v104 = v45;
  double v48 = v47;
  uint64_t v102 = v49;
  sub_98B10((uint64_t)v137);
  CGFloat v98 = v29;
  v141.origin.x = v29;
  v141.origin.y = v48;
  v141.size.width = v33;
  v141.size.height = v35;
  CGFloat Height = CGRectGetHeight(v141);
  swift_beginAccess(v10, v128, 0LL, 0LL);
  int v51 = *(void **)(a3 + 24);
  uint64_t v114 = v37;
  uint64_t v105 = v43;
  if (v51)
  {
    swift_beginAccess(v10, v120, 0LL, 0LL);
    uint64_t v52 = *(void *)(a3 + 48);
    uint64_t v53 = *(void *)(a3 + 72);
    *(void *)&aBlock[0] = *(void *)(a3 + 16);
    *((void *)&aBlock[0] + 1) = v51;
    aBlock[1] = *(_OWORD *)(a3 + 32);
    *(void *)&aBlock[2] = v52;
    *(_OWORD *)((char *)&aBlock[2] + 8) = *(_OWORD *)(a3 + 56);
    *((void *)&aBlock[3] + 1) = v53;
    __int128 v54 = *(_OWORD *)(a3 + 96);
    aBlock[4] = *(_OWORD *)(a3 + 80);
    void aBlock[5] = v54;
    __int128 v55 = *(_OWORD *)(a3 + 128);
    aBlock[6] = *(_OWORD *)(a3 + 112);
    aBlock[7] = v55;
    __int128 v56 = *(_OWORD *)(a3 + 160);
    aBlock[8] = *(_OWORD *)(a3 + 144);
    aBlock[9] = v56;
    memcpy(v136, aBlock, sizeof(v136));
    id v57 = v51;
    sub_98A7C((uint64_t)aBlock);
    uint64_t v58 = sub_998C0(v57, (uint64_t)v136);
    sub_98B10((uint64_t)aBlock);
    if (v58)
    {
      [v58 frame];
      double v96 = v33;
      uint64_t v60 = v59;
      double v62 = v61;
      uint64_t v64 = v63;
      uint64_t v66 = v65;

      swift_beginAccess(v10, v119, 1LL, 0LL);
      uint64_t v67 = *(void **)(a3 + 96);
      *(void *)(a3 + 96) = v58;
      uint64_t v99 = v60;
      *(void *)(a3 + 104) = v60;
      *(double *)(a3 + 112) = v62;
      CGFloat v33 = v96;
      uint64_t v97 = v64;
      *(void *)(a3 + 120) = v64;
      *(void *)(a3 + 128) = v66;
      double v68 = v62 - (v41 - v48);

      char v69 = 0;
      goto LABEL_6;
    }
  }

  char v69 = 1;
  double v68 = 0.0;
  uint64_t v97 = 0LL;
  uint64_t v66 = 0LL;
LABEL_6:
  objc_msgSend(a2, "bringSubviewToFront:", a4, *(void *)&v96);
  id v70 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:*(void *)(v118 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_timingParameters) timingParameters:0.0];
  [v70 setUserInteractionEnabled:0];
  uint64_t v71 = swift_allocObject(&unk_CD978, 160LL, 7LL);
  *(void *)(v71 + swift_unknownObjectWeakDestroy(v0 + 16) = a3;
  *(void *)(v71 + 24) = v101;
  *(void *)(v71 + 32) = v112;
  *(void *)(v71 + 40) = v111;
  *(void *)(v71 + 48) = v110;
  *(void *)(v71 + 56) = v109;
  *(void *)(v71 + 64) = v108;
  *(void *)(v71 + 72) = v107;
  *(void *)(v71 + 80) = v106;
  *(void *)(v71 + 88) = v16;
  *(double *)(v71 + 96) = v39;
  *(double *)(v71 + 104) = v41;
  *(void *)(v71 + 112) = v100;
  *(void *)(v71 + 120) = v105;
  *(double *)(v71 + 128) = v104;
  *(double *)(v71 + 136) = v48;
  *(void *)(v71 + sub_9F74((__int128 *)(v1 - 192), v1 - 144) = v103;
  *(void *)(v71 + 152) = v102;
  *(void *)&aBlock[2] = sub_99A94;
  *((void *)&aBlock[2] + 1) = v71;
  *(void *)&aBlock[0] = _NSConcreteStackBlock;
  *((void *)&aBlock[0] + 1) = 1107296256LL;
  *(void *)&aBlock[1] = sub_6F768;
  *((void *)&aBlock[1] + 1) = &unk_CD990;
  id v72 = _Block_copy(aBlock);
  uint64_t v73 = *((void *)&aBlock[2] + 1);
  id v113 = v16;
  swift_retain(a3);
  objc_msgSend(v70, "addAnimations:", v72, swift_release(v73).n128_f64[0]);
  _Block_release(v72);
  swift_beginAccess(v10, &v127, 0LL, 0LL);
  __int128 v74 = *(void **)(a3 + 136);
  if (v74)
  {
    uint64_t v75 = swift_allocObject(&unk_CD9C8, 64LL, 7LL);
    *(void *)(v75 + swift_unknownObjectWeakDestroy(v0 + 16) = v74;
    *(CGFloat *)(v75 + 24) = v98;
    *(double *)(v75 + 32) = v48;
    *(CGFloat *)(v75 + 40) = v33;
    *(CGFloat *)(v75 + 48) = Height;
    *(void *)(v75 + 56) = v117;
    *(void *)&aBlock[2] = sub_99B48;
    *((void *)&aBlock[2] + 1) = v75;
    *(void *)&aBlock[0] = _NSConcreteStackBlock;
    *((void *)&aBlock[0] + 1) = 1107296256LL;
    *(void *)&aBlock[1] = sub_6F768;
    *((void *)&aBlock[1] + 1) = &unk_CD9E0;
    int v76 = _Block_copy(aBlock);
    uint64_t v77 = *((void *)&aBlock[2] + 1);
    id v78 = v74;
    id v79 = v117;
    id v80 = v78;
    objc_msgSend(v70, "addAnimations:", v76, swift_release(v77).n128_f64[0]);
    _Block_release(v76);
  }

  swift_beginAccess(v10, &v126, 0LL, 0LL);
  int v81 = *(void **)(a3 + 96);
  if (v81) {
    char v82 = v69;
  }
  else {
    char v82 = 1;
  }
  if ((v82 & 1) == 0)
  {
    uint64_t v83 = swift_allocObject(&unk_CDAB8, 56LL, 7LL);
    *(void *)(v83 + swift_unknownObjectWeakDestroy(v0 + 16) = v81;
    *(void *)(v83 + 24) = v99;
    *(double *)(v83 + 32) = v68;
    *(void *)(v83 + 40) = v97;
    *(void *)(v83 + 48) = v66;
    *(void *)&aBlock[2] = sub_99C0C;
    *((void *)&aBlock[2] + 1) = v83;
    *(void *)&aBlock[0] = _NSConcreteStackBlock;
    *((void *)&aBlock[0] + 1) = 1107296256LL;
    *(void *)&aBlock[1] = sub_6F768;
    *((void *)&aBlock[1] + 1) = &unk_CDAD0;
    int v84 = _Block_copy(aBlock);
    uint64_t v85 = *((void *)&aBlock[2] + 1);
    id v86 = v81;
    objc_msgSend(v70, "addAnimations:", v84, swift_release(v85).n128_f64[0]);
    _Block_release(v84);
  }

  id v87 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:*(void *)(v118 + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_opacityTimingParameters) timingParameters:0.0];
  swift_beginAccess(v10, &v125, 0LL, 0LL);
  int v88 = *(void **)(a3 + 136);
  if (v88)
  {
    uint64_t v89 = swift_allocObject(&unk_CDA18, 24LL, 7LL);
    *(void *)(v89 + swift_unknownObjectWeakDestroy(v0 + 16) = v88;
    *(void *)&aBlock[2] = sub_9A0A0;
    *((void *)&aBlock[2] + 1) = v89;
    *(void *)&aBlock[0] = _NSConcreteStackBlock;
    *((void *)&aBlock[0] + 1) = 1107296256LL;
    *(void *)&aBlock[1] = sub_6F768;
    *((void *)&aBlock[1] + 1) = &unk_CDA30;
    int v90 = _Block_copy(aBlock);
    uint64_t v91 = *((void *)&aBlock[2] + 1);
    id v92 = v88;
    objc_msgSend(v87, "addAnimations:", v90, swift_release(v91).n128_f64[0]);
    _Block_release(v90);
  }

  uint64_t v93 = swift_allocObject(&unk_CDA68, 24LL, 7LL);
  *(void *)(v93 + swift_unknownObjectWeakDestroy(v0 + 16) = a6;
  *(void *)&aBlock[2] = sub_99BD8;
  *((void *)&aBlock[2] + 1) = v93;
  *(void *)&aBlock[0] = _NSConcreteStackBlock;
  *((void *)&aBlock[0] + 1) = 1107296256LL;
  *(void *)&aBlock[1] = sub_20820;
  *((void *)&aBlock[1] + 1) = &unk_CDA80;
  id v94 = _Block_copy(aBlock);
  uint64_t v95 = *((void *)&aBlock[2] + 1);
  swift_unknownObjectRetain(a6);
  objc_msgSend(v70, "addCompletion:", v94, swift_release(v95).n128_f64[0]);
  _Block_release(v94);
  swift_beginAccess(v10, v122, 0LL, 0LL);
  [*(id *)(a3 + 32) setAlpha:0.0];
  swift_beginAccess(v10, v121, 0LL, 0LL);
  memcpy(v123, v10, sizeof(v123));
  memcpy(v124, v10, sizeof(v124));
  nullsub_1(v124);
  sub_3F84C((uint64_t)v124, (uint64_t)aBlock);
  sub_98A7C((uint64_t)v123);
  sub_97BB4((uint64_t)aBlock);
  [v70 startAnimation];
  [v87 startAnimation];
}

uint64_t sub_995BC()
{
  swift_release(*(void *)(v0 + 32));
  swift_unknownObjectRelease(*(void *)(v0 + 112));
  return swift_deallocObject(v0, 120LL, 7LL);
}

void sub_995FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  objc_super v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  __int128 v5 = *(_OWORD *)(v0 + 64);
  v7[0] = *(_OWORD *)(v0 + 48);
  v7[1] = v5;
  __int128 v6 = *(_OWORD *)(v0 + 96);
  v7[2] = *(_OWORD *)(v0 + 80);
  void v7[3] = v6;
  sub_98BA4(v1, v2, v3, v4, (uint64_t *)v7, *(void *)(v0 + 112));
}

uint64_t sub_99638(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_99648(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_99650(void *a1)
{
  id v2 = [objc_allocWithZone(UIView) init];
  id v3 = [(id)objc_opt_self(UIColor) clearColor];
  [v2 setBackgroundColor:v3];

  sub_27904(v2, "setClipsToBounds:");
  [a1 frame];
  objc_msgSend(v2, "setFrame:");
  [a1 addSubview:v2];
  return v2;
}

id sub_99714()
{
  id v0 = [objc_allocWithZone(UIView) init];
  id v1 = sub_27904(v0, "setClipsToBounds:");
  double v2 = sub_3F588((uint64_t)v1);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  sub_3F760(v2);
  sub_884BC((uint64_t)objc_msgSend(v0, "setFrame:", v2, v4, v6, v8));
  sub_887A0();
  sub_277A0(v9, "addSubview:");
  return v0;
}

id sub_997C8(void *a1)
{
  id v1 = [a1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v8 = sub_3F588((uint64_t)v1);
  double v10 = v9;
  sub_3F760(v8);
  double v11 = 0.0;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  if (v10 + -30.0 >= 0.0) {
    double v11 = v10 + -30.0;
  }
  *(double *)uint64_t v17 = v3;
  *(double *)&v17[1] = v10;
  double v12 = v7 - v11;
  *(double *)&v17[2] = v5;
  *(double *)&v17[3] = v12;
  char v18 = 0;
  sub_88CE4((uint64_t)v17);
  id v14 = v13;
  id v15 = [objc_allocWithZone(UIImageView) initWithImage:v13];
  sub_277A0((uint64_t)objc_msgSend(v15, "setFrame:", v3, v10, v5, v12), "addSubview:");

  return v15;
}

void *sub_998C0(void *a1, uint64_t a2)
{
  id v4 = [a1 snapshotViewAfterScreenUpdates:0];
  if (!v4) {
    return 0LL;
  }
  double v5 = v4;
  double v6 = *(void **)(a2 + 40);
  if (sub_88C54(v6))
  {
    double v7 = v5;
    id v8 = v6;
    [a1 bounds];
    objc_msgSend(v8, "convertRect:fromCoordinateSpace:", a1);
    sub_9A15C();
    double v9 = sub_3F588((uint64_t)[v8 adjustedContentInset]);
    sub_3F760(v9);
    id v11 = sub_9A108(v10, "setFrame:");
    sub_277A0((uint64_t)v11, "addSubview:");
    double v5 = v8;
  }

  else
  {
    double v7 = 0LL;
  }

  return v7;
}

id sub_999C0(uint64_t a1, double *a2, void *a3, double *a4)
{
  double v6 = a2[4];
  double v7 = a2[5];
  double v8 = a2[6];
  double v9 = a2[7];
  double v10 = a4[4];
  double v11 = a4[5];
  double v12 = a4[6];
  double v13 = a4[7];
  swift_beginAccess(a1 + 16, v15, 0LL, 0LL);
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", v6, v7, v8, v9);
  return objc_msgSend(a3, "setFrame:", v10, v11, v12, v13);
}

uint64_t sub_99A68()
{
  return swift_deallocObject(v0, 160LL, 7LL);
}

id sub_99A94()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __int128 v2 = *(_OWORD *)(v0 + 40);
  v9[0] = *(_OWORD *)(v0 + 24);
  v9[1] = v2;
  __int128 v3 = *(_OWORD *)(v0 + 72);
  void v9[2] = *(_OWORD *)(v0 + 56);
  v9[3] = v3;
  id v4 = *(void **)(v0 + 88);
  __int128 v5 = *(_OWORD *)(v0 + 112);
  v8[0] = *(_OWORD *)(v0 + 96);
  v8[1] = v5;
  __int128 v6 = *(_OWORD *)(v0 + 144);
  v8[2] = *(_OWORD *)(v0 + 128);
  v8[3] = v6;
  return sub_999C0(v1, (double *)v9, v4, (double *)v8);
}

id sub_99AE8(void *a1, void *a2)
{
  return [a2 setAlpha:0.3];
}

uint64_t sub_99B24()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

id sub_99B48()
{
  return sub_99AE8(*(void **)(v0 + 16), *(void **)(v0 + 56));
}

id sub_99B5C(void *a1)
{
  return [a1 setAlpha:0.0];
}

uint64_t sub_99B94()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_99BB4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_99BD8()
{
  return [*(id *)(v0 + 16) completeTransition:1];
}

uint64_t sub_99BEC()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

id sub_99C0C()
{
  return sub_99B5C(*(void **)(v0 + 16));
}

void sub_99C1C(void *a1, uint64_t a2)
{
  __int128 v3 = *(void **)(a2 + 72);
  if (v3)
  {
    id v11 = v3;
    double v4 = sub_3F588((uint64_t)v11);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    sub_3F760(v4);
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }

uint64_t sub_99CBC()
{
  return swift_deallocObject(v0, 216LL, 7LL);
}

void sub_99D30()
{
}

id sub_99D44( id result, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  if (result)
  {
    __int128 v22 = result;
    id v23 = a16;
    id v24 = v22;
    id v25 = a2;
    id v26 = a3;
    id v27 = a4;
    id v28 = a6;
    id v29 = a7;
    id v30 = a8;
    id v31 = a9;
    id v32 = a10;
    return a11;
  }

  return result;
}

id sub_99DE4(uint64_t a1)
{
  id v1 = *(id *)a1;
  objc_msgSend( *(id *)a1,  "setFrame:",  *(double *)(a1 + 8),  *(double *)(a1 + 16),  *(double *)(a1 + 24),  *(double *)(a1 + 32));
  return [v1 setAlpha:1.0];
}

id sub_99E28()
{
  return [*(id *)(v0 + 16) setAlpha:1.0];
}

id sub_99E3C(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = sub_97C1C((uint64_t)v9);
  sub_3F84C(v5, (uint64_t)v10);
  sub_3F84C((uint64_t)v10, (uint64_t)v11);
  ((void (*)(_BYTE *, void, __n128))v4)(v9, 0LL, v6);
  sub_3F844(v8);
  sub_3F84C((uint64_t)v8, (uint64_t)v9);
  sub_97BB4((uint64_t)v9);
  return [a3 completeTransition:1];
}

uint64_t sub_99EF4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_99F1C(uint64_t a1)
{
  return sub_99E3C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void *sub_99F24( void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

void sub_99F88( void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  if (a1)
  {
  }

id sub_9A024()
{
  return [*(id *)(v0 + 16) setAlpha:0.0];
}

id sub_9A038()
{
  uint64_t v3 = *(void *)(v0 + 16);
  __int128 v1 = *(_OWORD *)(v0 + 40);
  __int128 v4 = *(_OWORD *)(v0 + 24);
  __int128 v5 = v1;
  return sub_99DE4((uint64_t)&v3);
}

  ;
}

void *sub_9A0F4@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char aBlock, uint64_t a7, uint64_t a8, uint64_t a9)
{
  a8 = v9;
  a9 = a1;
  return _Block_copy(&aBlock);
}

void sub_9A100()
{
}

id sub_9A108(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v6, v3, v4, v5);
}

  ;
}

id sub_9A130(id a1, SEL a2, double a3, double a4)
{
  return objc_msgSend(a1, a2, 1.0, a4, 30.0, 0.0, 0.0);
}

void sub_9A144( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

id sub_9A14C()
{
  return objc_msgSend(v0, *(SEL *)(v1 + 3632), v2);
}

  ;
}

  ;
}

id sub_9A194()
{
  return v0;
}

void *sub_9A1A0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

void sub_9A1A8()
{
}

uint64_t sub_9A1B0()
{
  return swift_release(v0);
}

void *sub_9A1BC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_9A1E8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController) = 0LL;
  *(void *)(v1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel) = a1;
  id v2 = objc_allocWithZone(&OBJC_CLASS___UINavigationController);
  sub_1AE10();
  uint64_t v3 = sub_8B634((uint64_t)[v2 init], 0, 0);
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel);
  id v5 = objc_allocWithZone((Class)type metadata accessor for StatusViewController(0LL));
  swift_retain_n(v3, 2LL);
  sub_1ADD8();
  uint64_t v6 = sub_5E964(v3, v4);
  sub_1AE58();
  sub_1AF0C();
  double v7 = *(void **)(v3 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  *(void *)(v3 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController) = v6;

  return v3;
}

void sub_9A2B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_A5F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_1AE20();
  sub_9AED8( a1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  id v9 = a3;
  double v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter(v10);
  if (os_log_type_enabled(v10, v11))
  {
    double v12 = (uint8_t *)sub_5827C();
    *(_WORD *)double v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "#tv #dismissal Asking StatusViewController to dismiss", v12, 2u);
    sub_A15C((uint64_t)v12);
  }

  sub_9AECC(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  uint64_t v13 = OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController;
  id v14 = *(void **)(a1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  if (v14)
  {
    id v15 = v14;
    sub_9AEA8();

    id v14 = *(void **)(a1 + v13);
  }

  *(void *)(a1 + v13) = 0LL;

  id v16 = v9;
  sub_119C0();
  uint64_t v18 = v17;
  sub_1AE10();
  sub_64C94();
  sub_12070(1LL, 5LL, 0LL, 0LL);

  swift_release(v18);
  sub_1B298(a2);
  sub_A174();
}

uint64_t sub_9A410(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))( v9,  a1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v6);
  id v10 = a3;
  os_log_type_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.info.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "#tv #dismissal Asking StatusViewController to dismiss", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v14 = OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController;
  id v15 = *(void **)(a1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  if (v15)
  {
    id v16 = v15;
    sub_3D048(0LL, 0LL);

    id v15 = *(void **)(a1 + v14);
  }

  *(void *)(a1 + v14) = 0LL;

  uint64_t v17 = (char *)v10;
  sub_13C18(1LL, 0LL, a2, v17);

  return swift_release(a2);
}

uint64_t sub_9A594(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, __n128), uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))( v11,  a1 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v8);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.info.getter(v13);
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "#tv #dismissal Asking StatusViewController to dismiss", v15, 2u);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v16 = OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController;
  uint64_t v17 = *(void **)(a1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  if (v17)
  {
    id v18 = v17;
    sub_3D048(0LL, 0LL);

    uint64_t v17 = *(void **)(a1 + v16);
  }

  *(void *)(a1 + vswift_unknownObjectWeakDestroy(v0 + 16) = 0LL;

  __n128 v19 = swift_beginAccess(a2 + 16, v22, 0LL, 0LL);
  if (*(_BYTE *)(a2 + 16) == 1) {
    a3(1LL, 1LL, v19);
  }
  swift_release(a2);
  return swift_release(a4);
}

void sub_9A72C(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = sub_A5F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_1AE20();
  if ((a1 & 1) != 0)
  {
    sub_9AED8( a2 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    id v11 = a4;
    uint64_t v12 = sub_1AF2C();
    uint64_t v13 = (void *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.info.getter(v13);
    if (sub_73DE8(v14))
    {
      id v15 = (_WORD *)sub_5827C();
      *id v15 = 0;
      sub_9AEB8(&dword_0, v16, v17, "#dismissal Asking StatusViewController to dismiss");
      sub_A15C((uint64_t)v15);
    }

    sub_9AECC(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    id v18 = *(void **)(a2 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
    if (v18)
    {
      id v19 = v18;
      sub_9AEA8();
    }

    __int128 v20 = (char *)v11;
    sub_13C18(1LL, 0LL, a3, v20);

    sub_1B298(a3);
  }

  else
  {
    id v21 = a4;
    sub_1AF2C();
    sub_9A410(a2, a3, v21);

    sub_1AE58();
  }

  sub_A174();
}

void sub_9A878(char a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, __n128), uint64_t a5)
{
  uint64_t v11 = sub_A5F0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_1AE20();
  if ((a1 & 1) != 0)
  {
    (*(void (**)(void *, uint64_t, uint64_t))(v12 + 16))( v5,  a2 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v11);
    sub_1AF2C();
    uint64_t v13 = sub_1AE10();
    os_log_type_t v14 = (void *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.info.getter(v14);
    if (sub_73DE8(v15))
    {
      uint64_t v16 = (_WORD *)sub_5827C();
      _WORD *v16 = 0;
      sub_9AEB8(&dword_0, v17, v18, "#dismissal Asking StatusViewController to dismiss");
      sub_A15C((uint64_t)v16);
    }

    (*(void (**)(void *, uint64_t))(v12 + 8))(v5, v11);
    id v19 = *(void **)(a2 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
    if (v19)
    {
      id v20 = v19;
      sub_9AEA8();
    }

    __n128 v21 = swift_beginAccess(a3 + 16, v22, 0LL, 0LL);
    if (*(_BYTE *)(a3 + 16) == 1) {
      a4(1LL, 1LL, v21);
    }
    sub_1AF0C();
    sub_1B298(a3);
  }

  else
  {
    sub_1AE10();
    sub_1AF2C();
    sub_9A594(a2, a3, a4, a5);
    sub_1AE58();
  }

  sub_1AF0C();
  sub_A174();
}

uint64_t sub_9A9D8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject(&unk_CDCF8, 56LL, 7LL);
  *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(_BYTE *)(v9 + 24) = a1;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = a3;
  *(void *)(v9 + 48) = a4;
  sub_1ADD8();
  sub_1A920(a3, a4);
  sub_9AA60(4LL, (void (*)(uint64_t))sub_9AE7C, v9);
  return swift_release(v9);
}

void sub_9AA60(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  id v5 = *(void **)(v3 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewController);
  if (v5)
  {
    id v8 = [v5 view];
    if (v8)
    {
      id v10 = v8;
      uint64_t v9 = type metadata accessor for StatusView(0LL);
      if (swift_dynamicCastClass(v10, v9)) {
        sub_8A74C(a1, a2, a3);
      }
    }
  }

void sub_9AB08()
{
}

uint64_t sub_9AB34()
{
  uint64_t v0 = sub_8B6E4();
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel));

  return v0;
}

uint64_t sub_9AB78()
{
  uint64_t v0 = sub_9AB34();
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_9AB98()
{
  return type metadata accessor for StatusViewCoordinator(0LL);
}

uint64_t type metadata accessor for StatusViewCoordinator(uint64_t a1)
{
  uint64_t result = qword_E6410;
  if (!qword_E6410) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StatusViewCoordinator);
  }
  return result;
}

uint64_t sub_9ABD8(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[1] = "\b";
  return swift_updateClassMetadata2(a1, 256LL, 2LL, v2, a1 + 328);
}

double sub_9AC24(float a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel);
  sub_1ADD8();
  sub_A754(a1);
  *(void *)&double result = swift_release(v3).n128_u64[0];
  return result;
}

void sub_9AC64()
{
  uint64_t v1 = sub_A5F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_1AE20();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v0,  v0 + OBJC_IVAR____TtC6SiriTV15BaseCoordinator_logger,  v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter(v4);
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)sub_5827C();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "#tv #dismissal Asked to dismiss Orb on Finish", v6, 2u);
    sub_A15C((uint64_t)v6);
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  *(_BYTE *)(*(void *)(v0 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel)
           + OBJC_IVAR____TtC6SiriTV15StatusViewModel_dismissOnFinish) = 1;
  sub_1AEA4();
}

double sub_9AD5C(float a1)
{
  return sub_9AC24(a1);
}

void sub_9AD7C()
{
}

void sub_9AD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel;
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC6SiriTV21StatusViewCoordinator_statusViewModel);
  sub_1ADD8();
  uint64_t v8 = sub_A614();
  uint64_t v10 = v9;
  swift_release(v7);
  if (v8 == a1 && v10 == a2)
  {
    sub_1AEA4();
  }

  else
  {
    uint64_t v12 = *(void *)(v3 + v6);
    sub_1ADD8();
    sub_A678(a1, a2);
    swift_release(v12);
  }

void sub_9AE28(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_9AE48()
{
  if (v0[5]) {
    swift_release(v0[6]);
  }
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_9AE7C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 40);
  if (v1) {
    return v1(0LL);
  }
  return result;
}

void sub_9AEA8()
{
}

void sub_9AEB8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_9AECC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_9AED8@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

id sub_9AEE4(void *a1, void *a2)
{
  id result = [a1 view];
  if (result)
  {
    uint64_t v6 = result;
    [a2 addSubview:result];

    return [a1 didMoveToParentViewController:v2];
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t sub_9AFE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  os_log_type_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t result = 0xD000000000000014LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      unint64_t result = 0xD000000000000016LL;
      break;
    case 2LL:
      unint64_t result = 0xD000000000000016LL;
      break;
    case 3LL:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4LL:
      unint64_t result = 0xD000000000000017LL;
      break;
    case 5LL:
      unint64_t result = 0xD000000000000011LL;
      break;
    case 6LL:
    case 13LL:
      unint64_t result = 0xD000000000000010LL;
      break;
    case 7LL:
      unint64_t result = 0x2074736575716552LL;
      break;
    case 8LL:
      unint64_t result = 0x20646E616D6D6F43LL;
      break;
    case 9LL:
    case 10LL:
      unint64_t result = 0x6E69646E65747441LL;
      break;
    case 11LL:
      unint64_t result = 0x4420686365657053LL;
      break;
    case 12LL:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 14LL:
      unint64_t result = 0xD000000000000013LL;
      break;
    case 15LL:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      if (!AFSiriLogContextConnection)
      {
        __break(1u);
        JUMPOUT(0x9B2C0LL);
      }

      uint64_t v7 = Logger.init(_:)(AFSiriLogContextConnection);
      uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
      os_log_type_t v9 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v10 = 134217984;
        uint64_t v12 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v10 + 4, v10 + 12);
        _os_log_impl(&dword_0, v8, v9, "Received unknown SiriUIEvent - %ld", v10, 0xCu);
        swift_slowDealloc(v10, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      unint64_t result = 0x6E776F6E6B6E55LL;
      break;
  }

  return result;
}

uint64_t sub_9B300()
{
  return SiriUISiriEvent.description.getter(*v0);
}

id sub_9B308()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompactViewModelFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_9B358()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompactViewModelFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CompactViewModelFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTV23CompactViewModelFactory);
}

uint64_t sub_9B3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  sub_1ADD8();
  v4(a2);
  return sub_6044C(v3);
}

void sub_9B3D8()
{
}

Swift::Int sub_9B3F8()
{
  return Hasher._finalize()();
}

uint64_t sub_9B438()
{
  return 1LL;
}

Swift::Int sub_9B448()
{
  return Hasher._finalize()();
}

uint64_t sub_9B484()
{
  return 0x746361706D6F63LL;
}

uint64_t sub_9B4C0()
{
  return sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
}

uint64_t sub_9B540()
{
  return sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource);
}

uint64_t sub_9B5A0(uint64_t a1, void *a2)
{
  return sub_6EFB8(a1);
}

void sub_9B5CC(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  sub_9B604(a1, a2);
  sub_ADE8();
}

uint64_t sub_9B604(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_2D124(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  uint64_t result = sub_2D124(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource);
  *(void *)&v2[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator] = 0LL;
  if (AFSiriLogContextConnection)
  {
    Logger.init(_:)(AFSiriLogContextConnection);
    v19.receiver = v2;
    v19.super_class = ObjectType;
    uint64_t v7 = (char *)objc_msgSendSuper2(&v19, "init");
    uint64_t v8 = (os_log_s *)&v7[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_logger];
    os_log_type_t v9 = v7;
    uint64_t v10 = static os_log_type_t.debug.getter(v9);
    os_log_type_t v11 = v10;
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v10);
    if (sub_9DF58(v12))
    {
      uint64_t v13 = (uint8_t *)sub_A1D0(2LL);
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_0, v8, v11, "#tv Initing Presentation", v13, 2u);
      sub_A15C((uint64_t)v13);
    }

    if (qword_DEC38 != -1) {
      swift_once(&qword_DEC38, sub_1C9A8);
    }
    uint64_t v14 = type metadata accessor for CompactMainViewCoordinator(0LL);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    uint64_t v15 = sub_11B74();

    uint64_t v16 = OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator;
    uint64_t v17 = *(void *)&v9[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator];
    *(void *)&v9[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator] = v15;
    swift_release(v17);
    uint64_t v18 = *(void *)&v9[v16];
    if (v18) {
      swift_unknownObjectWeakAssign(v18 + OBJC_IVAR____TtC6SiriTV26CompactMainViewCoordinator_delegate, v9);
    }
    swift_unknownObjectWeakAssign(&v9[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate], a1);
    sub_9DF68();
    swift_unknownObjectWeakAssign(&v9[OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource], a2);
    sub_1B25C();
    return (uint64_t)v9;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_9B814( uint64_t a1, _TtC6SiriTV27ConversationViewCoordinator *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  sub_9DF68();
  sub_1B25C();
  sub_ADE8();
}

#error "9B908: call analysis failed (funcsize=16)"
void __cdecl -[SiriTVUIPresentation shortTapActionWithRequestOptions:]( _TtC6SiriTV20SiriTVUIPresentation *self,  SEL a2,  id a3)
{
  id v4;
  _TtC6SiriTV20SiriTVUIPresentation *v5;
  uint64_t v4 = a3;
  id v5 = self;
  sub_9B8E0(v4);
}

uint64_t sub_9B974()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator))
  {
    sub_1ADD8();
    sub_17140();
    return sub_1ADD0();
  }

  return result;
}

id sub_9BA00(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v2)
  {
    swift_retain(*(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator));
    sub_116D8();
    uint64_t v4 = v3;
    id v5 = (os_log_s *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_logger);
    os_log_type_t v6 = static os_log_type_t.info.getter(v3);
    id v7 = v4;
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    if (sub_9DF58(v8))
    {
      os_log_type_t v9 = (_DWORD *)sub_A1D0(12LL);
      uint64_t v10 = sub_A1D0(32LL);
      uint64_t v29 = v10;
      *os_log_type_t v9 = 136315138;
      id v7 = v7;
      id v11 = [v7 description];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v14 = v13;

      uint64_t v28 = sub_CC88(v12, (unint64_t)v14, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v9 + 1, v9 + 3);

      swift_bridgeObjectRelease(v14, v15, v16, v17, v18, v19, v20, v21);
      sub_926A4(&dword_0, v5, v6, "Presentation View Controller is %s");
      swift_arrayDestroy(v10, 1LL);
      sub_A15C(v10);
      sub_A15C((uint64_t)v9);
    }

    else
    {
    }

    swift_release(v2);

    return v7;
  }

  else
  {
    uint64_t v22 = static os_log_type_t.error.getter(a1);
    os_log_type_t v23 = v22;
    id v24 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v25 = v23;
    if (os_log_type_enabled(v24, v23))
    {
      id v26 = (uint8_t *)sub_A1D0(2LL);
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_0, v24, v25, "Returning Empty View Controller", v26, 2u);
      sub_A15C((uint64_t)v26);
    }

    return [objc_allocWithZone(UIViewController) init];
  }

id sub_9BD28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(v2 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator) siriDidTransitionFrom:a1 event:a2];
}

BOOL sub_9BD90(uint64_t a1)
{
  uint64_t v3 = sub_9E24((uint64_t *)&unk_E0280);
  uint64_t v4 = __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_A1F8();
  uint64_t v13 = v12 - v11;
  if (*(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator))
  {
    sub_33C10(a1, (uint64_t)v8, (uint64_t *)&unk_E0280);
    if (sub_9F8C((uint64_t)v8, 1LL, v9) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v13, v8, v9);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v6, v13, v9);
      sub_9E64((uint64_t)v6, 0LL, 1LL, v9);
      sub_1ADD8();
      BOOL v14 = sub_185A0();
      sub_1ADD0();
      sub_22EC4((uint64_t)v6, (uint64_t *)&unk_E0280);
      uint64_t v15 = sub_27A44();
      v16(v15);
      return v14;
    }

    sub_22EC4((uint64_t)v8, (uint64_t *)&unk_E0280);
  }

  return 0;
}

void sub_9BFE0(float a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v2)
  {
    sub_1ADD8();
    sub_18930(a1);
    swift_release(v2);
  }

void sub_9C0C4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v1)
  {
    sub_1ADD8();
    sub_18B40();
    sub_3CC20(v1);
  }

  else
  {
    sub_6518();
  }

void sub_9C144(void *a1)
{
  uint64_t v2 = v1;
  id v4 = a1;
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.debug.getter(v5);
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_DWORD *)sub_A1D0(12LL);
    uint64_t v15 = sub_A1D0(32LL);
    uint64_t v28 = v15;
    *uint64_t v7 = 136315138;
    if (a1 && (uint64_t v16 = sub_9DEB8(v4), v8))
    {
      id v17 = (_TtC6SiriTV27ConversationViewCoordinator *)v8;
    }

    else
    {
      swift_bridgeObjectRelease(0LL, v8, v9, v10, v11, v12, v13, v14);
      uint64_t v16 = 0LL;
      id v17 = (_TtC6SiriTV27ConversationViewCoordinator *)0xE000000000000000LL;
    }

    uint64_t v27 = sub_CC88(v16, (unint64_t)v17, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v7 + 1, v7 + 3);

    swift_bridgeObjectRelease(v17, v18, v19, v20, v21, v22, v23, v24);
    sub_926A4(&dword_0, v5, v6, "#tv requestHandlingStatus: %s");
    swift_arrayDestroy(v15, 1LL);
    sub_A15C(v15);
    sub_A15C((uint64_t)v7);
  }

  else
  {
  }

  if (AFIsInternalInstall())
  {
    id v25 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
    unsigned int v26 = [v25 siriXDebugStatusEnabled];

    if (v26)
    {
      if (*(void *)(v2 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator))
      {
        sub_1ADD8();
        sub_18E08();
        sub_1ADD0();
      }
    }
  }

void sub_9C374()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v1)
  {
    sub_1ADD8();
    uint64_t v2 = sub_27A44();
    sub_19384(v2, v3);
    sub_6044C(v1);
  }

  else
  {
    sub_ADE8();
  }

uint64_t sub_9C464(uint64_t result)
{
  if (!*(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator)) {
    return 0LL;
  }
  if (result)
  {
    sub_1ADD8();
    unsigned __int8 v2 = sub_170BC();
    sub_1ADD0();
    return v2 & 1;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_9C508(void *a1, void (*a2)(void *))
{
  if (*(void *)(v2 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator) && a1)
  {
    id v5 = a1;
    sub_1ADD8();
    a2(a1);
    sub_1ADD0();
    sub_32BE0(v5);
  }

  else
  {
    sub_DD3C();
  }

double sub_9C5C4(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(v3 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator) && a1)
  {
    if (a2)
    {
      uint64_t v7 = swift_allocObject(&unk_CDE80, 32LL, 7LL);
      *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
      *(void *)(v7 + 24) = a3;
      sub_1ADD8();
      id v8 = a1;
      uint64_t v9 = sub_27A44();
      sub_1A920(v9, v10);
      sub_194F4();
      sub_1ADD0();

      *(void *)&double result = swift_release(v7).n128_u64[0];
    }
  }

  return result;
}

void sub_9C738(void *a1)
{
  uint64_t v3 = sub_1B440();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_A1F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v8)
  {
    uint64_t v9 = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource);
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      if (a1)
      {
        swift_retain_n(v8, 2LL);
        id v11 = a1;
        id v12 = [v10 sessionInfoForSiriPresentation:v1];
        if (v12)
        {
          uint64_t v13 = v12;
          id v14 = [v12 identifier];

          uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
          id v17 = v16;

          SEL v18 = (const char *)sub_50548(v15, (uint64_t)v17);
          id v20 = (_TtC6SiriTV27ConversationViewCoordinator *)v19;
          swift_bridgeObjectRelease(v17, v19, v21, v22, v23, v24, v25, v26);
          if (v20)
          {
            id v11 = v11;
            uint64_t v27 = sub_4B270(v11);
            if (v28)
            {
              uint64_t v29 = (void *)v27;
              id v30 = v28;
            }

            else
            {
              uint64_t v31 = UUID.init()(v27);
              uint64_t v29 = (void *)UUID.uuidString.getter(v31);
              id v30 = v32;
              (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
            }

            sub_19730(v29, v30, v18, v20);
            swift_bridgeObjectRelease(v20, v33, v34, v35, v36, v37, v38, v39);
            swift_bridgeObjectRelease(v30, v40, v41, v42, v43, v44, v45, v46);
          }
        }

        sub_9DF68();

        swift_release_n(v8, 2LL);
      }

      else
      {
        swift_unknownObjectRelease(v9);
      }
    }
  }

void sub_9C954(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (*(void *)(v3 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator) && a1 && a2)
  {
    sub_1ADD8();
    id v7 = a1;
    uint64_t v6 = sub_27A44();
    a3(v6);
    sub_1ADD0();
    sub_32BE0(v7);
  }

  else
  {
    sub_DD3C();
  }

uint64_t sub_9C9C4(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6 = a4;
  if (a4)
  {
    uint64_t v9 = type metadata accessor for IndexPath(0LL);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v9);
  }

  id v10 = a3;
  id v11 = a1;
  sub_9C954(a3, v6, a5);

  return sub_9DF30(v6);
}

void sub_9CA3C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_coordinator);
  if (v1)
  {
    sub_1ADD8();
    sub_13F40();
    sub_3CC20(v1);
  }

  else
  {
    sub_6518();
  }

id sub_9CAA8()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_9DF70(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  sub_9DF70(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource);
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_9CB94()
{
  return type metadata accessor for SiriTVUIPresentation(0LL);
}

uint64_t type metadata accessor for SiriTVUIPresentation(uint64_t a1)
{
  uint64_t result = qword_E66A8;
  if (!qword_E66A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriTVUIPresentation);
  }
  return result;
}

void sub_9CBD4()
{
}

uint64_t sub_9CC0C(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = "\b";
  v4[2] = &unk_AEA60;
  v4[3] = (char *)&value witness table for () + 64;
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

void sub_9CC9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_9E24(&qword_E0370);
  __chkstk_darwin(v10);
  sub_A1F8();
  uint64_t v13 = v12 - v11;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (Strong)
  {
    uint64_t v15 = (void *)Strong;
    sub_33C10(a2, v13, &qword_E0370);
    uint64_t v16 = sub_1B440();
    Class isa = 0LL;
    if (sub_9F8C(v13, 1LL, v16) != 1)
    {
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8LL))(v13, v16);
    }

    if (a3)
    {
      aBlock[4] = a3;
      uint64_t v21 = a4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_9B3A8;
      void aBlock[3] = &unk_CDE20;
      a3 = _Block_copy(aBlock);
      uint64_t v19 = v21;
      swift_retain(a4);
      *(void *)&double v17 = swift_release(v19).n128_u64[0];
    }

    objc_msgSend(v15, "siriPresentation:performAceCommand:conversationItemIdentifier:completion:", v5, a1, isa, a3, v17);
    swift_unknownObjectRelease(v15);
    _Block_release(a3);
  }

  sub_1AEA4();
}

void sub_9CF38()
{
  uint64_t v0 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = v0;
    if ([v0 respondsToSelector:"siriPresentationDidPresentDynamicSnippetWithInfo:"])
    {
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      [v1 siriPresentationDidPresentDynamicSnippetWithInfo:isa];
      sub_1B25C();
      sub_32BE0(isa);
    }

    else
    {
      swift_unknownObjectRelease(v1);
    }
  }

  else
  {
    sub_DD3C();
  }

uint64_t sub_9D08C(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (result)
  {
    uint64_t v8 = (void *)result;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a3);
    NSString v11 = sub_9DF40();
    [v8 siriPresentation:v4 didShowAceViewWithIdentifier:isa aceViewClass:ObjCClassFromMetadata metricsContext:v11 forInterval:a1];

    return swift_unknownObjectRelease(v8);
  }

  return result;
}

void sub_9D240()
{
  uint64_t v0 = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = v0;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    sub_9DF20((uint64_t)isa, "siriPresentation:didPresentConversationItemsWithIdentifiers:");

    sub_8BA74(v1);
  }

  else
  {
    sub_ADE8();
  }

void sub_9D2F8()
{
  uint64_t v0 = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = v0;
    NSString v2 = sub_9DF4C();
    sub_9DF20((uint64_t)v2, "siriPresentation:startRequestForText:");

    sub_8BA74(v1);
  }

  else
  {
    sub_ADE8();
  }

void sub_9D3A4()
{
  uint64_t v0 = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_1B440();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    sub_9DF20((uint64_t)isa, "siriPresentation:willDiscardConversationItemsWithIdentifiers:");

    sub_8BA74(v1);
  }

  else
  {
    sub_ADE8();
  }

uint64_t sub_9D454(double a1)
{
  uint64_t result = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (result)
  {
    uint64_t v4 = (void *)result;
    NSString v5 = sub_9DF4C();
    [v4 siriPresentation:v1 didScrollForInterval:v5 metricsContext:a1];

    return swift_unknownObjectRelease(v4);
  }

  return result;
}

void sub_9D588()
{
  uint64_t v0 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_8BA74((uint64_t)v1);
  }

  else
  {
    sub_ADE8();
  }

void sub_9D69C(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a1;
  sub_9D6F4(v6, (uint64_t)v8, a4);

  swift_bridgeObjectRelease(v8, v10, v11, v12, v13, v14, v15, v16);
}

void sub_9D6F4(uint64_t a1, uint64_t a2, SEL *a3)
{
  NSString v5 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 respondsToSelector:*a3])
    {
      id v7 = sub_9DF40();
      objc_msgSend(v6, *a3, v3, v7);
      sub_9DF68();
    }

    else
    {
      swift_unknownObjectRelease(v6);
    }
  }

void sub_9D7BC()
{
  uint64_t v1 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v1)
  {
    NSString v2 = v1;
    if ([v1 respondsToSelector:"siriPresentation:failTest:withReason:"])
    {
      NSString v3 = String._bridgeToObjectiveC()();
      id v4 = sub_9DF4C();
      [v2 siriPresentation:v0 failTest:v3 withReason:v4];
      sub_1B25C();
    }

    else
    {
      swift_unknownObjectRelease(v2);
    }
  }

void sub_9D924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v7 = sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSString v9 = String._bridgeToObjectiveC()();
    NSString v10 = sub_9DF40();
    objc_msgSend(v8, *a5, v5, v9, v10);

    swift_unknownObjectRelease(v8);
  }

  else
  {
    sub_1AEA4();
  }

uint64_t sub_9D9CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  NSString v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  id v14 = a1;
  sub_9D924(v8, (uint64_t)v10, v11, v13, a5);

  swift_bridgeObjectRelease(v10, v15, v16, v17, v18, v19, v20, v21);
  return sub_9DF30(v13);
}

void sub_9DB48(SEL *a1)
{
  NSString v3 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    objc_msgSend(v3, *a1, v1);
    sub_8BA74(v4);
  }

  else
  {
    sub_ADE8();
  }

void sub_9DBD0(uint64_t a1, SEL *a2)
{
  NSString v3 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    sub_9DF7C(v3, *a2);
    sub_8BA74(v4);
  }

  else
  {
    sub_ADE8();
  }

void sub_9DC60()
{
  uint64_t v0 = (void *)sub_1B5A0(OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
  if (v0)
  {
    uint64_t v1 = (uint64_t)v0;
    [v0 didBeginProcessingConversationItems];
    sub_6EFB8(v1);
  }

  else
  {
    sub_6518();
  }

uint64_t getEnumTagSinglePayload for SiriTVUIPresentationMode(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriTVUIPresentationMode(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(sub_A03C(v2, v1, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_9DD68 + 4 * asc_AE9F0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_9DD88 + 4 * byte_AE9F5[v4]))();
  }
}

_BYTE *sub_9DD68(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_9DD88(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_9DD90(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_9DD98(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_9DDA0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_9DDA8(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_9DDB4()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SiriTVUIPresentationMode()
{
  return &type metadata for SiriTVUIPresentationMode;
}

unint64_t sub_9DDD0()
{
  unint64_t result = qword_E66B8;
  if (!qword_E66B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_AEAEC, &type metadata for SiriTVUIPresentationMode);
    atomic_store(result, (unint64_t *)&qword_E66B8);
  }

  return result;
}

uint64_t sub_9DE0C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_9DE30(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16LL))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_9DE44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_9DE54(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_9DE5C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_9DE6C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_9DE90()
{
}

uint64_t sub_9DEAC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_9DEB8(void *a1)
{
  id v1 = [a1 requestHandlingStatus];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

id sub_9DF20(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4);
}

uint64_t sub_9DF30(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

NSString sub_9DF40()
{
  return String._bridgeToObjectiveC()();
}

NSString sub_9DF4C()
{
  return String._bridgeToObjectiveC()();
}

BOOL sub_9DF58(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_9DF68()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_9DF70@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakAssign(v1 + a1, 0LL);
}

id sub_9DF7C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v3, v2);
}

id sub_9DF88()
{
  id result = [v0 speechRequestOptions];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (char *)[result activationEvent];

    return (id)(v3 == (_BYTE *)&dword_C + 3);
  }

  return result;
}

BOOL sub_9DFDC()
{
  uint64_t v1 = (char *)[v0 requestSource];
  uint64_t v2 = (char *)[v0 inputType];
  return v1 != (_BYTE *)&dword_10 + 2 && v1 != (_BYTE *)&stru_20.cmdsize + 3 && v2 == (_BYTE *)&dword_0 + 1;
}

BOOL sub_9E02C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_9E038(int a1, int a2)
{
  return a1 == a2;
}

void sub_9E044(uint64_t a1, double a2, double a3)
{
  if (![v3 view]
    || (sub_8D05C(), uint64_t v7 = sub_9E24(&qword_E55A8), v9 = sub_3CB60(v7, v8), (v9 & 1) == 0))
  {
    double v12 = sub_580F0();
    goto LABEL_6;
  }

  uint64_t v13 = v18;
  if (!v18)
  {
LABEL_6:
    sub_65734(v9, &qword_E55A0, v10, v11, v12);
    goto LABEL_7;
  }

  uint64_t v14 = v19;
  sub_109B4(v17, v18);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double))(v14 + 8))(a1, v13, v14, a2, a3);
  sub_6572C(v15, v16);
LABEL_7:
  sub_9E548();
}

void sub_9E0F8(uint64_t a1)
{
}

void sub_9E10C(double a1, double a2)
{
  if (![v2 view]
    || (v5 = sub_8D05C(), uint64_t v6 = sub_9E24(&qword_E2B38), v7 = swift_dynamicCast(v16, v15, v5, v6, 6LL), (v7 & 1) == 0))
  {
    double v10 = sub_580F0();
    goto LABEL_6;
  }

  uint64_t v11 = v17;
  if (!v17)
  {
LABEL_6:
    sub_65734(v7, (uint64_t *)&unk_E6870, v8, v9, v10);
    goto LABEL_7;
  }

  uint64_t v12 = v18;
  sub_109B4(v16, v17);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v12 + 8))(v11, v12, a1, a2);
  sub_6572C(v13, v14);
LABEL_7:
  sub_9E548();
}

void sub_9E1CC()
{
  uint64_t v1 = *(void *)&v0[qword_E2368];
  uint64_t Strong = swift_weakLoadStrong(&v0[qword_E2360]);
  id v3 = objc_allocWithZone((Class)type metadata accessor for ContentPlattersView(0LL));
  swift_retain(v1);
  uint64_t v4 = v0;
  id v5 = (id)sub_3879C(v1, v0, Strong);
  [v4 setView:v5];
}

void sub_9E274(void *a1)
{
  id v1 = a1;
  sub_9E1CC();
}

void sub_9E2A8(char a1)
{
  if (![v1 view]
    || (sub_8D05C(), uint64_t v3 = sub_9E24(&qword_DFC98), v5 = sub_3CB60(v3, v4), (v5 & 1) == 0))
  {
    double v8 = sub_580F0();
    goto LABEL_6;
  }

  uint64_t v9 = v14;
  if (!v14)
  {
LABEL_6:
    sub_65734(v5, &qword_E41D0, v6, v7, v8);
    goto LABEL_7;
  }

  uint64_t v10 = v15;
  sub_109B4(v13, v14);
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v10 + 8))(a1 & 1, v9, v10);
  sub_6572C(v11, v12);
LABEL_7:
  sub_3ED10();
}

void sub_9E34C(uint64_t a1)
{
}

void sub_9E360(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = v3;
  if (![v6 view]
    || (unint64_t v8 = sub_8D05C(), v9 = sub_9E24(a2), (swift_dynamicCast(v15, v14, v8, v9, 6LL) & 1) == 0))
  {
    sub_580F0();
    goto LABEL_6;
  }

  uint64_t v10 = v16;
  if (!v16)
  {
LABEL_6:
    sub_22EC4((uint64_t)v15, a3);
    goto LABEL_7;
  }

  uint64_t v11 = v17;
  sub_109B4(v15, v16);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 8))(a1, v10, v11);
  sub_6572C(v12, v13);
LABEL_7:
  sub_3ED10();
}

id sub_9E420()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentPlattersViewController(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContentPlattersViewController(uint64_t a1)
{
  uint64_t result = qword_E6748;
  if (!qword_E6748) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContentPlattersViewController);
  }
  return result;
}

uint64_t sub_9E48C()
{
  return type metadata accessor for ContentPlattersViewController(0LL);
}

void sub_9E494(char a1)
{
}

void sub_9E4B8(uint64_t a1)
{
}

void sub_9E4D8(uint64_t a1, double a2, double a3)
{
}

void sub_9E4F8(uint64_t a1)
{
}

void sub_9E528(double a1, double a2)
{
}

  ;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC6SiriTVP33_DDD80245B92040DCD6388F2132F6DBBF19ResourceBundleClass);
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_dialogIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dialogIdentifier];
}

id objc_msgSend_encodedClassName(void *a1, const char *a2, ...)
{
  return _[a1 encodedClassName];
}

id objc_msgSend_initWithAceConversionMap_deniedDialogIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAceConversionMap:deniedDialogIdentifiers:");
}

id objc_msgSend_initWithAthleteSnippetShim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAthleteSnippetShim:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_makeVisualResponseSnippetWithAceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeVisualResponseSnippetWithAceView:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}