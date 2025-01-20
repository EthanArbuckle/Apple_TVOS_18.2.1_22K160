uint64_t sub_4818(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  v3[2] = a2;
  v3[3] = v2;
  v4 = type metadata accessor for Logger(0LL);
  v3[4] = v4;
  v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  v3[6] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return sub_4DC8();
}

uint64_t sub_4870()
{
  v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[7] = v4;
  v0[8] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[9] = ObjectType;
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return swift_task_switch(sub_48F4, v8, v9);
}

uint64_t sub_48F4()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_25074();
  *(_BYTE *)(v0 + 80) = v2;
  swift_unknownObjectRelease(v1);
  return sub_4DC8();
}

uint64_t sub_4938()
{
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  char v1 = *(_BYTE *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = sub_4D70(v4, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  _StringGuts.grow(_:)(27LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v8 = *(void **)(v5 + 24);
  swift_bridgeObjectRetain(v8);
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  unint64_t v10 = 0xE400000000000000LL;
  v11._countAndFlagsBits = 544175136LL;
  v11._object = (void *)0xE400000000000000LL;
  String.append(_:)(v11);
  if ((v1 & 1) != 0) {
    uint64_t v12 = 1702195828LL;
  }
  else {
    uint64_t v12 = 0x65736C6166LL;
  }
  if ((v1 & 1) == 0) {
    unint64_t v10 = 0xE500000000000000LL;
  }
  unint64_t v13 = v10;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease(v10);
  v14._countAndFlagsBits = 0xD000000000000013LL;
  v15._countAndFlagsBits = 0xD00000000000008BLL;
  v15._object = (void *)0x8000000000032930LL;
  v14._object = (void *)0x8000000000032910LL;
  Logger.debug(output:test:caller:)(v14, 0, v15);
  swift_bridgeObjectRelease(0x8000000000032910LL);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v16 = sub_4D88(&qword_48EF0);
  uint64_t v17 = swift_allocObject(v16, 64LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_2FE90;
  *(void *)(v17 + 56) = &type metadata for Bool;
  *(_BYTE *)(v17 + 32) = v1 & 1;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t sub_4B08()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for HasTargetedMoreThanOneEntityResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions36HasTargetedMoreThanOneEntityResolver);
}

uint64_t sub_4B4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.hasTargetedMoreThanOneEntity(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_4BF4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 24LL));
  return v1;
}

uint64_t sub_4C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_48EEC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_4818((uint64_t)v4, a2);
}

uint64_t sub_4C74(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_4CC8()
{
  return sub_4D10((unint64_t *)&unk_48ED0, (uint64_t)&unk_2FEF8);
}

uint64_t sub_4CEC()
{
  return sub_4D10(&qword_48EE0, (uint64_t)&unk_2FF20);
}

uint64_t sub_4D10(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t HasTargetedMoreThanOneEntityResolver = type metadata accessor for HasTargetedMoreThanOneEntityResolver();
    uint64_t result = swift_getWitnessTable(a2, HasTargetedMoreThanOneEntityResolver);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_4D4C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_4D70(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_4D88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_4DC8()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

void sub_4DD4()
{
  unk_48F07 = -18;
}

uint64_t sub_4E04()
{
  uint64_t v0 = type metadata accessor for CoreSignalTypes(0LL);
  v5[3] = v0;
  v5[4] = sub_621C( &qword_48FD8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  uint64_t v1 = sub_6128(v5);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  enum case for CoreSignalTypes.app(_:),  v0);
  if (qword_48C48 != -1) {
    swift_once(&qword_48C48, sub_4DD4);
  }
  uint64_t v2 = qword_48EF8;
  uint64_t v3 = unk_48F00;
  swift_bridgeObjectRetain(unk_48F00);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)(v5, v2, v3, &_swiftEmptyArrayStorage);
  qword_4C890 = result;
  return result;
}

uint64_t sub_4EEC(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return swift_task_switch(sub_4F08, v2, 0LL);
}

uint64_t sub_4F08()
{
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v1 = *(void **)(v0 + 96);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_4D70(v2, (uint64_t)static Log.suggestions);
  v3._countAndFlagsBits = 0xD00000000000007ALL;
  v4._object = (void *)0x8000000000032A20LL;
  v3._object = (void *)0x8000000000032A40LL;
  v4._countAndFlagsBits = 0xD00000000000001ALL;
  Logger.debug(output:test:caller:)(v4, 0, v3);
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  sub_4D4C(v1, v5);
  uint64_t v7 = Interaction.getMentionedAppIds()(v5, v6);
  if (qword_48C48 != -1) {
    swift_once(&qword_48C48, sub_4DD4);
  }
  uint64_t v8 = *(void *)(v0 + 104);
  char v9 = sub_6338();
  swift_bridgeObjectRelease(v7);
  sub_60C4(v8, v0 + 16);
  if ((v9 & 1) != 0)
  {
    sub_6108((void *)(v0 + 16));
  }

  else
  {
    uint64_t v10 = *(void *)(v0 + 40);
    uint64_t v11 = *(void *)(v0 + 48);
    sub_4D4C((void *)(v0 + 16), v10);
    uint64_t v12 = dispatch thunk of EnvironmentSnapshot.openAppIds.getter(v10, v11);
    LOBYTE(v10) = sub_6338();
    swift_bridgeObjectRelease(v12);
    sub_6108((void *)(v0 + 16));
    if ((v10 & 1) == 0)
    {
      Swift::String v14 = &_swiftEmptyArrayStorage;
      return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v14);
    }
  }

  sub_60C4(*(void *)(v0 + 104), v0 + 56);
  sub_51FC(v0 + 56);
  sub_61B8(v0 + 56, &qword_48FC8);
  uint64_t v13 = sub_4D88(&qword_48FD0);
  Swift::String v14 = (_OWORD *)swift_allocObject(v13, 40LL, 7LL);
  v14[1] = xmmword_2FF90;
  if (qword_48C50 != -1) {
    swift_once(&qword_48C50, sub_4E04);
  }
  uint64_t v15 = qword_4C890;
  *((void *)v14 + 4) = qword_4C890;
  specialized Array._endMutation()();
  swift_retain(v15);
  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v14);
}

uint64_t sub_5138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1LL;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

void sub_51FC(uint64_t a1)
{
  v52[1] = *v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v52 - v7;
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v9 = sub_4D70(v3, (uint64_t)static Log.suggestions);
  unint64_t v53 = (unint64_t)"Extracting home signals...";
  sub_6360();
  Logger.debug(output:test:caller:)(v10, v11, v12);
  type metadata accessor for HomeStore(0LL);
  uint64_t v13 = (void *)((uint64_t (*)(void))static HomeStore.shared.getter)();
  int v14 = dispatch thunk of HomeStore.waitForInitialization(label:refresh:)( 0x6767755369726973LL,  0xEF736E6F69747365LL,  1LL);

  if (v14 == 2)
  {
    sub_6360();
    Logger.warning(output:test:file:function:line:)(v15, v16, v17, v18, 34LL);
    return;
  }

  v19 = (void *)((uint64_t (*)(void))static HomeStore.shared.getter)();
  unint64_t v20 = dispatch thunk of HomeStore.homes.getter();

  unint64_t v21 = v20 >> 62;
  if (v20 >> 62)
  {
    sub_62D0();
    uint64_t v22 = sub_634C();
    sub_62A4();
  }

  else
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v22 != 1)
  {
    sub_6164(a1, (uint64_t)&v58);
    uint64_t v30 = v59;
    if (v59)
    {
      uint64_t v31 = v60;
      sub_4D4C(&v58, v59);
      uint64_t v32 = dispatch thunk of EnvironmentSnapshot.salientEntities.getter(v30, v31);
      sub_6108(&v58);
    }

    else
    {
      sub_61B8((uint64_t)&v58, &qword_48FC8);
      uint64_t v32 = 0LL;
    }

    uint64_t v36 = sub_5718();
    uint64_t v37 = swift_bridgeObjectRelease(v32);
    if (v36)
    {
      sub_62A4();
      sub_62E4();
      v58._countAndFlagsBits = 0LL;
      v58._object = (void *)0xE000000000000000LL;
      swift_retain(v36);
      _StringGuts.grow(_:)(38LL);
      sub_6344();
      uint64_t v38 = sub_62FC(0xD000000000000024LL);
      uint64_t v39 = Entity.name.getter(v38);
      uint64_t v41 = v40;
      sub_6374();
      uint64_t v56 = v39;
      uint64_t v57 = v41;
      uint64_t v42 = sub_4D88(&qword_48FE0);
      v43._countAndFlagsBits = sub_632C(v42);
      String.append(_:)(v43);
      sub_62A4();
      sub_62AC();
      sub_6374();
    }

    else
    {
      v44 = (void *)static HomeStore.shared.getter(v37);
      uint64_t v36 = dispatch thunk of HomeStore.currentHome.getter();

      if (!v36)
      {
        if (v21)
        {
          sub_62D0();
          uint64_t v50 = sub_634C();
          sub_62A4();
        }

        else
        {
          uint64_t v50 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8LL));
        }

        if (v50)
        {
          if ((v20 & 0xC000000000000001LL) != 0) {
            goto LABEL_39;
          }
          __break(1u);
        }

LABEL_36:
        sub_62A4();
        uint64_t v36 = 0LL;
        goto LABEL_37;
      }

      sub_62A4();
      sub_62E4();
      sub_6310();
      sub_6344();
      uint64_t v45 = sub_62FC(0xD000000000000013LL);
      uint64_t v46 = Entity.name.getter(v45);
      v48 = v47;
      sub_6374();
      v49._countAndFlagsBits = v46;
      v49._object = v48;
      String.append(_:)(v49);
      sub_6324();
      sub_62AC();
    }

    sub_62A4();
    MEMORY[0xD000000000000082](v6, v3);
    goto LABEL_37;
  }

  uint64_t v23 = v54;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v8, v9, v3);
  sub_6310();
  sub_6344();
  v58._countAndFlagsBits = 0xD000000000000013LL;
  v58._object = (void *)0x8000000000032B90LL;
  if (v21)
  {
    sub_62D0();
    uint64_t v24 = sub_634C();
    if (v24) {
      goto LABEL_10;
    }
LABEL_17:
    sub_62A4();
    uint64_t v27 = 0LL;
    uint64_t v29 = 0LL;
    goto LABEL_18;
  }

  uint64_t v24 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v20);
  if (!v24) {
    goto LABEL_17;
  }
LABEL_10:
  if ((v20 & 0xC000000000000001LL) != 0)
  {
    uint64_t v25 = sub_6354();
  }

  else
  {
    if (!*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8LL)))
    {
      __break(1u);
      goto LABEL_42;
    }

    uint64_t v25 = *(void *)(v20 + 32);
    swift_retain(v25);
  }

  uint64_t v26 = sub_62A4();
  uint64_t v27 = Entity.name.getter(v26);
  uint64_t v29 = v28;
  swift_release(v25);
LABEL_18:
  uint64_t v56 = v27;
  uint64_t v57 = v29;
  uint64_t v33 = sub_4D88(&qword_48FE0);
  v34._countAndFlagsBits = sub_632C(v33);
  String.append(_:)(v34);
  sub_6324();
  v35._object = (void *)(v53 | 0x8000000000000000LL);
  v35._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v58, 0, v35);
  sub_6324();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v3);
  if (!v24) {
    goto LABEL_36;
  }
  if ((v20 & 0xC000000000000001LL) != 0)
  {
LABEL_39:
    uint64_t v36 = sub_6354();
    goto LABEL_22;
  }

  if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8LL)))
  {
LABEL_21:
    uint64_t v36 = *(void *)(v20 + 32);
    swift_retain(v36);
LABEL_22:
    sub_62A4();
LABEL_37:
    uint64_t v51 = *(void *)(v55 + 112);
    *(void *)(v55 + 112) = v36;
    swift_release(v51);
    return;
  }

LABEL_42:
  __break(1u);
}

    swift_once(&qword_48D38, sub_1FB8C);
    goto LABEL_16;
  }

  uint64_t v29 = *(void *)(v1 + 32);
  uint64_t v3 = dispatch thunk of Home.accessories.getter(a1);
  if (v3 >> 62)
  {
    uint64_t v2 = sub_2DC50();
    if (v2) {
      goto LABEL_4;
    }
  }

  else
  {
    sub_2DE64();
    if (v2)
    {
LABEL_4:
      if (v2 >= 1)
      {
        for (uint64_t i = 0LL; i != v2; ++i)
        {
          if ((v3 & 0xC000000000000001LL) != 0) {
            sub_2DD00(i);
          }
          else {
            sub_2DCA8();
          }
          uint64_t v5 = sub_2DE9C();
          if ((v5 & 1) != 0)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v5);
            sub_2DE08();
            uint64_t v6 = sub_2DD34();
            specialized ContiguousArray._endMutation()(v6);
          }

          else
          {
            sub_2DDE0();
          }
        }

        sub_1A090();
        goto LABEL_19;
      }

      __break(1u);
      goto LABEL_42;
    }
  }

  sub_1A090();
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) == 0)
  {
    Swift::String v12 = _swiftEmptyArrayStorage[2];
    if (v12 > 1)
    {
      sub_2DCF8();
LABEL_22:
      uint64_t v13 = 0LL;
      int v14 = (char *)_swiftEmptyArrayStorage;
      do
      {
        else {
          swift_retain(_swiftEmptyArrayStorage[v13 + 4]);
        }
        Swift::String v15 = dispatch thunk of Entity.room.getter();
        if (v15)
        {
          Swift::Bool v16 = v15;
          Swift::String v17 = Entity.name.getter(v15);
          v19 = v18;
          swift_release(v16);
          sub_2DC20();
          if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0) {
            int v14 = sub_2DDFC(0LL, *((void *)v14 + 2) + 1LL);
          }
          unint64_t v21 = *((void *)v14 + 2);
          unint64_t v20 = *((void *)v14 + 3);
          if (v21 >= v20 >> 1) {
            int v14 = sub_2DDFC((char *)(v20 > 1), v21 + 1);
          }
          *((void *)v14 + 2) = v21 + 1;
          uint64_t v22 = &v14[16 * v21];
          *((void *)v22 + 4) = v17;
          *((void *)v22 + 5) = v19;
        }

        else
        {
          sub_2DC20();
        }

        ++v13;
      }

      while (v12 != v13);
      goto LABEL_44;
    }

uint64_t sub_5718()
{
  uint64_t v0 = type metadata accessor for SalientEntityType(0LL);
  uint64_t v68 = *(void *)(v0 - 8);
  uint64_t v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v60 - v4;
  uint64_t v6 = type metadata accessor for SalientEntity(0LL);
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  Swift::Bool v11 = (char *)&v60 - v10;
  uint64_t v12 = sub_4D88(&qword_48FE8);
  __chkstk_darwin(v12);
  uint64_t v67 = (uint64_t)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for HomeEntity(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  Swift::String v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for Logger(0LL);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!v19) {
    return 0LL;
  }
  uint64_t v69 = *(void *)(v19 + 16);
  if (!v69) {
    return 0LL;
  }
  uint64_t v71 = v20;
  v62 = v11;
  uint64_t v66 = v19;
  uint64_t v60 = v17;
  uint64_t v61 = v15;
  uint64_t v65 = v14;
  if (qword_48D38 != -1) {
LABEL_20:
  }
    swift_once(&qword_48D38, sub_1FB8C);
  uint64_t v23 = sub_4D70(v18, (uint64_t)static Log.suggestions);
  uint64_t v24 = v71;
  uint64_t v25 = *(void (**)(char *))(v71 + 16);
  uint64_t v64 = v23;
  v25(v22);
  v78[0]._countAndFlagsBits = 0LL;
  v78[0]._object = (void *)0xE000000000000000LL;
  _StringGuts.grow(_:)(42LL);
  swift_bridgeObjectRelease(v78[0]._object);
  v78[0]._countAndFlagsBits = 0xD000000000000028LL;
  v78[0]._object = (void *)0x8000000000032BB0LL;
  uint64_t v26 = v66;
  v27._countAndFlagsBits = Array.description.getter(v66, v73);
  object = v27._object;
  String.append(_:)(v27);
  swift_bridgeObjectRelease(object);
  uint64_t v29 = v78[0]._object;
  unint64_t v63 = (unint64_t)"Extracting home signals...";
  v30._object = (void *)0x8000000000032A40LL;
  v30._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v78[0], 0, v30);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v18);
  uint64_t v71 = v26 + ((*(unsigned __int8 *)(v72 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
  unsigned int v70 = enum case for SalientEntityType.activeHome(_:);
  swift_bridgeObjectRetain(v26);
  uint64_t v31 = 0LL;
  uint64_t v32 = v68;
  while (1)
  {
    uint64_t v18 = v31 + 1;
    if (__OFADD__(v31, 1LL))
    {
      __break(1u);
      goto LABEL_20;
    }

    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 16))(v9, v71 + *(void *)(v72 + 72) * v31, v73);
    SalientEntity.type.getter(v33);
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v3, v70, v0);
    uint64_t v34 = sub_621C( &qword_48FF0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for SalientEntityType,  (uint64_t)&protocol conformance descriptor for SalientEntityType);
    dispatch thunk of RawRepresentable.rawValue.getter(&v76, v0, v34);
    dispatch thunk of RawRepresentable.rawValue.getter(&v74, v0, v34);
    Swift::String v35 = v77;
    uint64_t v22 = v75;
    if (v76 == v74 && v77 == v75) {
      break;
    }
    char v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v77, v74, v75, 0LL);
    swift_bridgeObjectRelease(v35);
    swift_bridgeObjectRelease(v22);
    uint64_t v38 = *(void (**)(char *, uint64_t))(v32 + 8);
    v38(v3, v0);
    v38(v5, v0);
    if ((v37 & 1) != 0) {
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v9, v73);
    ++v31;
    if (v18 == v69)
    {
      swift_bridgeObjectRelease(v66);
      uint64_t v39 = v67;
      sub_61AC(v67, 1LL, 1LL, v65);
      goto LABEL_15;
    }
  }

  swift_bridgeObjectRelease_n(v77, 2LL);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v32 + 8);
  v40(v3, v0);
  v40(v5, v0);
LABEL_14:
  swift_bridgeObjectRelease(v66);
  uint64_t v42 = v72;
  uint64_t v41 = v73;
  Swift::String v43 = v62;
  uint64_t v44 = (*(uint64_t (**)(char *, char *, uint64_t))(v72 + 32))(v62, v9, v73);
  SalientEntity.value.getter(v78, v44);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
  uint64_t v45 = sub_4D88(&qword_48FF8);
  uint64_t v39 = v67;
  uint64_t v46 = v65;
  int v47 = swift_dynamicCast(v67, v78, v45, v65, 6LL);
  sub_61AC(v39, v47 ^ 1u, 1LL, v46);
  if (sub_61F4(v39, 1LL, v46) == 1)
  {
LABEL_15:
    sub_61B8(v39, &qword_48FE8);
    v48._countAndFlagsBits = 0xD00000000000001ALL;
    v48._object = (void *)0x8000000000032BE0LL;
    v49._object = (void *)(v63 | 0x8000000000000000LL);
    v49._countAndFlagsBits = 0xD00000000000007ALL;
    Logger.debug(output:test:caller:)(v48, 0, v49);
    return 0LL;
  }

  uint64_t v52 = v61;
  unint64_t v53 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v60, v39, v46);
  v78[0]._countAndFlagsBits = 0LL;
  v78[0]._object = (void *)0xE000000000000000LL;
  _StringGuts.grow(_:)(19LL);
  v54._countAndFlagsBits = 0xD000000000000011LL;
  v54._object = (void *)0x8000000000032C00LL;
  String.append(_:)(v54);
  _print_unlocked<A, B>(_:_:)(v53, v78, v46);
  uint64_t v55 = v78[0]._object;
  v56._object = (void *)(v63 | 0x8000000000000000LL);
  v56._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v78[0], 0, v56);
  swift_bridgeObjectRelease(v55);
  type metadata accessor for HomeStore(0LL);
  uint64_t v57 = (void *)static HomeStore.shared.getter();
  uint64_t v58 = dispatch thunk of HomeStore.homes.getter();

  __chkstk_darwin(v59);
  *(&v60 - 2) = v53;
  uint64_t v50 = sub_5D90((uint64_t (*)(uint64_t *))sub_6200, (uint64_t)(&v60 - 4), v58);
  swift_bridgeObjectRelease(v58);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v46);
  return v50;
}

uint64_t sub_5D90(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a3);
  for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v13))
  {
    uint64_t v8 = 4LL;
    while (1)
    {
      if ((a3 & 0xC000000000000001LL) != 0)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a3);
      }

      else
      {
        uint64_t v9 = *(void *)(a3 + 8 * v8);
        swift_retain(v9);
      }

      uint64_t v10 = v8 - 3;
      if (__OFADD__(v8 - 4, 1LL)) {
        break;
      }
      uint64_t v14 = v9;
      char v11 = a1(&v14);
      if (v4)
      {
        swift_bridgeObjectRelease(a3);
        swift_release(v9);
        return v9;
      }

      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease(a3);
        return v9;
      }

      swift_release(v9);
      ++v8;
      if (v10 == v7) {
        goto LABEL_11;
      }
    }

    __break(1u);
LABEL_16:
    if (a3 < 0) {
      uint64_t v13 = a3;
    }
    else {
      uint64_t v13 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
  }

LABEL_11:
  swift_bridgeObjectRelease(a3);
  return 0LL;
}

uint64_t sub_5EBC()
{
  uint64_t v0 = Entity.name.getter();
  uint64_t v2 = v1;
  uint64_t v3 = HomeEntity.name.getter();
  if (v0 == v3 && v2 == v4)
  {
    char v7 = 1;
    uint64_t v6 = v2;
  }

  else
  {
    uint64_t v6 = v4;
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v0, v2, v3, v4, 0LL);
  }

  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

uint64_t sub_5F54()
{
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for HomeAutomationSignalExtractor()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions29HomeAutomationSignalExtractor);
}

uint64_t sub_5F98()
{
  return v0;
}

uint64_t sub_5FA4()
{
  return sub_5F98();
}

uint64_t sub_5FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_48FC4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_4C74;
  return sub_4EEC(a1, a2);
}

uint64_t sub_601C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_621C( &qword_49000,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor,  (uint64_t)&unk_2FFF8);
  return SignalExtractor.description.getter(a1, v3);
}

uint64_t sub_605C(uint64_t a1, uint64_t a2)
{
  return sub_621C( (unint64_t *)&unk_48FB0,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor,  (uint64_t)&unk_2FFD0);
}

uint64_t sub_6088()
{
  uint64_t v0 = type metadata accessor for HomeAutomationSignalExtractor();
  uint64_t v1 = swift_allocObject(v0, 120LL, 15LL);
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v1 + 112) = 0LL;
  qword_4C898 = v1;
  return result;
}

uint64_t sub_60C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6108(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_6128(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_6164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4D88(&qword_48FC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_61AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_61B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4D88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_61F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_6200()
{
  return sub_5EBC() & 1;
}

uint64_t sub_621C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

unint64_t sub_6260(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

unint64_t sub_6280(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_62A4()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_62AC()
{
  v1._object = (void *)(*(void *)(v0 - 160) | 0x8000000000000000LL);
  v1._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(*(Swift::String *)(v0 - 120), 0, v1);
}

uint64_t sub_62D0()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_62E4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 152) + 16LL))(v1, v2, v0);
}

uint64_t sub_62FC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 120) = a1;
  *(void *)(v3 - 112) = (v1 - 32) | 0x8000000000000000LL;
  return swift_retain(v2);
}

void sub_6310()
{
  *(void *)(v0 - 120) = 0LL;
  *(void *)(v0 - 112) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(21LL);
}

uint64_t sub_6324()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_632C(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 136, a1);
}

uint64_t sub_6338()
{
  return sub_5138(*v1, v1[1], v0);
}

uint64_t sub_6344()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 112));
}

uint64_t sub_634C()
{
  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_6354()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v0);
}

  ;
}

uint64_t sub_6374()
{
  return swift_release(v0);
}

void static UnitSemantic.< infix(_:_:)(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_63CC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_6430 + 4 * byte_30054[a2]))(0x746E6563726570LL);
}

uint64_t sub_6430(uint64_t a1)
{
  if (a1 == 0x746E6563726570LL && v1 == 0xE700000000000000LL) {
    char v3 = 0;
  }
  else {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x746E6563726570LL, 0xE700000000000000LL, 1LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE700000000000000LL);
  return v3 & 1;
}

uint64_t UnitSemantic.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_64F8 + 4 * byte_30058[a1]))( 0xD000000000000011LL,  0x8000000000031E80LL);
}

uint64_t sub_64F8()
{
  return 0x746E6563726570LL;
}

uint64_t sub_6510()
{
  return 0x4773656572676564LL;
}

uint64_t sub_6534()
{
  return 0x4373656572676564LL;
}

HomeAutomationSiriSuggestions::UnitSemantic_optional __swiftcall UnitSemantic.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_40D28, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return (HomeAutomationSiriSuggestions::UnitSemantic_optional)4;
  }
  else {
    return (HomeAutomationSiriSuggestions::UnitSemantic_optional)v3;
  }
}

_UNKNOWN **static UnitSemantic.allCases.getter()
{
  return &off_40DA8;
}

void sub_65AC(char *a1)
{
}

void sub_65B8()
{
}

void sub_65C0(uint64_t a1)
{
}

void sub_65C8(uint64_t a1)
{
}

HomeAutomationSiriSuggestions::UnitSemantic_optional sub_65D0@<W0>( Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::UnitSemantic_optional *a2@<X8>)
{
  result.value = UnitSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_65FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UnitSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_6624(char *a1)
{
}

BOOL sub_6630(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13C20(*a1, *a2);
}

BOOL sub_663C(char *a1)
{
  return sub_13CD0(*a1);
}

void sub_6648(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_6654(void *a1@<X8>)
{
  *a1 = &off_40DA8;
}

uint64_t sub_6664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_6AB4();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_66C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_6AB4();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_670C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_6A3C();
  unint64_t v5 = sub_6A78();
  unint64_t v6 = sub_6AB4();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

uint64_t sub_676C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

unint64_t sub_6780()
{
  unint64_t result = qword_49008;
  if (!qword_49008)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49008);
  }

  return result;
}

unint64_t sub_67C0()
{
  unint64_t result = qword_49010;
  if (!qword_49010)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49010);
  }

  return result;
}

unint64_t sub_6800()
{
  unint64_t result = qword_49018;
  if (!qword_49018)
  {
    uint64_t v1 = sub_6844(&qword_49020);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_49018);
  }

  return result;
}

uint64_t sub_6844(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_688C()
{
  unint64_t result = qword_49028;
  if (!qword_49028)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49028);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for UnitSemantic(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UnitSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFD)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x4D;
  int v5 = v6 - 77;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2C5;
  int v5 = v6 - 709;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x34;
  int v5 = v6 - 52;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x42;
  int v5 = v6 - 66;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

    sub_20FA0(a2);
    sub_20F84();
    sub_20FA0(v14);
    goto LABEL_18;
  }

  if (!v28) {
    goto LABEL_17;
  }
  uint64_t v29 = sub_20FB4(32LL);
  uint64_t v44 = (uint64_t (*)(os_log_s *))sub_20FB4(96LL);
  Swift::String v48 = (uint64_t (*)(void))v44;
  *(_DWORD *)uint64_t v29 = 136315650;
  sub_210E0();
  int v47 = sub_21044(v42, v30, (uint64_t *)&v48);
  sub_20F90();
  sub_2103C(v14);
  *(_WORD *)(v29 + 12) = 2082;
  uint64_t v31 = sub_21030(v22, 1LL);
  if (v43 >> 14 >= v31 >> 14)
  {
    sub_20FE8(v31, v43);
    sub_21144();
    sub_2104C();
    int v47 = sub_21044(a5, v32, (uint64_t *)&v48);
    sub_20F90();
    sub_20F84();
    sub_6324();
    *(_WORD *)(v29 + 22) = 2080;
    sub_1A480();
    int v47 = sub_21120();
    sub_20F90();
    sub_2103C(a2);
    _os_log_impl(&dword_0, v26, (os_log_type_t)v27, "%s%{public}s: %s", (uint8_t *)v29, 0x20u);
    uint64_t v33 = (uint64_t)v44;
    swift_arrayDestroy(v44, 3LL, (char *)&type metadata for Any + 8);
    sub_20FA8(v33);
    uint64_t v34 = v29;
LABEL_16:
    sub_20FA8(v34);
LABEL_18:

    sub_21084();
    return;
  }

  __break(1u);
}

    int v5 = (v14 - 1) & v14;
    uint64_t v12 = __clz(__rbit64(v14)) + (v6 << 6);
LABEL_18:
    uint64_t v16 = *(void *)(*(void *)(v308 + 48) + 8 * v12);
    sub_15DB8(v16, v332[22]);
    uint64_t v18 = v17;
    uint64_t v19 = dispatch thunk of Home.accessories.getter(v17);
    if (v19 >> 62) {
      uint64_t v1 = sub_2DC50();
    }
    else {
      sub_2DE64();
    }
    v333 = v16;
    v317 = v5;
    v318 = v6;
    v320 = v18;
    if (v1)
    {
      if (v1 < 1) {
        goto LABEL_186;
      }
      for (uint64_t i = 0LL; i != v1; ++i)
      {
        if ((v19 & 0xC000000000000001LL) != 0)
        {
          uint64_t v21 = sub_2DD00(i);
        }

        else
        {
          uint64_t v21 = *(void *)(v19 + 8 * i + 32);
          swift_retain(v21);
        }

        uint64_t v22 = dispatch thunk of Accessory.has(type:)(v16);
        if ((v22 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
          uint64_t v23 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
          uint64_t v24 = v23;
          uint64_t v16 = v333;
          uint64_t v25 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v21);
          specialized ContiguousArray._endMutation()(v25);
        }

        else
        {
          swift_release(v21);
        }
      }
    }

    sub_1A090();
    uint64_t v26 = v332;
    if (qword_48D38 != -1)
    {
      swift_once(&qword_48D38, sub_1FB8C);
      uint64_t v26 = v332;
    }

    Swift::String v27 = v26[33];
    v324 = v26[32];
    uint64_t v28 = v26[24];
    uint64_t v29 = (void *)sub_4D70(v28, (uint64_t)static Log.suggestions);
    Swift::String v30 = *(void (**)(uint64_t, void *, uint64_t))(v325 + 16);
    sub_2DE7C(v27);
    uint64_t v31 = sub_239AC(17LL);
    sub_2DD64(v31, v32);
    v341._countAndFlagsBits = HomeDeviceType.description.getter(v16);
    sub_2DC98(v341);
    sub_62A4();
    sub_2DC7C();
    uint64_t v34 = *(void *)(v310 + 32);
    uint64_t v33 = *(void **)(v310 + 40);
    sub_2DE10();
    sub_149B4();
    v35._countAndFlagsBits = 0x6574726F70707573LL;
    v35._object = (void *)0xEF203A6570795464LL;
    v327 = v34;
    v36._countAndFlagsBits = v34;
    v36._object = v33;
    Logger.debug(output:test:caller:)(v35, 1, v36);
    sub_1A488();
    sub_62A4();
    v329 = *(void (**)(uint64_t, uint64_t))(v325 + 8);
    v329(v27, v28);
    v322 = v29;
    sub_2DE7C(v324);
    char v37 = sub_239AC(38LL);
    sub_2DD64(v37, v38);
    sub_2DC14();
    v335 = v39;
    uint64_t v40 = (uint64_t)_swiftEmptyArrayStorage < 0
       || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) != 0;
    v316 = v40;
    if (v40)
    {
      uint64_t v55 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
      uint64_t v41 = _CocoaArrayWrapper.endIndex.getter(v55);
      sub_2DC20();
      if (v41)
      {
LABEL_37:
        sub_2DEA8(0LL, v41 & ~(v41 >> 63));
        if (v41 < 0) {
          goto LABEL_187;
        }
        uint64_t v42 = 0LL;
        uint64_t v29 = (void *)((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001LL);
        do
        {
          if (v29) {
            Swift::String v43 = specialized _ArrayBuffer._getElementSlowPath(_:)(v42, _swiftEmptyArrayStorage);
          }
          else {
            Swift::String v43 = sub_2DE50();
          }
          Swift::String v49 = dispatch thunk of Entity.description.getter(v43, v44, v45, v46, v47, v48);
          uint64_t v51 = v50;
          sub_1A0DC();
          unint64_t v53 = _swiftEmptyArrayStorage[2];
          uint64_t v52 = _swiftEmptyArrayStorage[3];
          if (v53 >= v52 >> 1) {
            sub_2DD08(v52);
          }
          ++v42;
          _swiftEmptyArrayStorage[2] = v53 + 1;
          Swift::String v54 = &_swiftEmptyArrayStorage[2 * v53];
          v54[4] = v49;
          v54[5] = v51;
        }

        while (v41 != v42);
      }
    }

    else
    {
      uint64_t v41 = _swiftEmptyArrayStorage[2];
      if (v41) {
        goto LABEL_37;
      }
    }

    uint64_t v57 = v332[31];
    Swift::String v56 = v332[32];
    uint64_t v58 = v332[24];
    v342._countAndFlagsBits = Array.description.getter(_swiftEmptyArrayStorage, &type metadata for String);
    sub_2DC98(v342);
    sub_149B4();
    sub_1A15C();
    sub_2DC7C();
    sub_2DD4C();
    sub_1A15C();
    sub_2DD20(v335, v306);
    sub_15A64();
    sub_149B4();
    v329(v56, v58);
    v30(v57, v322, v58);
    uint64_t v59 = sub_239AC(23LL);
    sub_2DD64(v59, v60);
    sub_2DC14();
    v336 = v61 - 15;
    if (v320)
    {
      if (*(void *)(v320 + 16))
      {
        sub_6260(0LL, 1, v320);
        v62 = HomeAttributeType.description.getter(*(void *)(v320 + 32));
      }

      else
      {
        v62 = sub_2DE88();
      }
    }

    else
    {
      v62 = 0LL;
      unint64_t v63 = 1LL;
    }

    uint64_t v64 = v332[31];
    uint64_t v1 = v332[24];
    v332[12] = v62;
    v332[13] = v63;
    uint64_t v65 = sub_4D88(&qword_49E20);
    v343._countAndFlagsBits = String.init<A>(describing:)(v304, v65);
    sub_2DC98(v343);
    sub_62A4();
    sub_2DC7C();
    sub_2DD4C();
    sub_149B4();
    v66._countAndFlagsBits = v336;
    v66._object = v302;
    v67._countAndFlagsBits = v327;
    v67._object = v29;
    Logger.debug(output:test:caller:)(v66, 1, v67);
    sub_15A64();
    sub_62A4();
    sub_2DD78(v64);
    if (v316)
    {
      uint64_t v68 = swift_retain(_swiftEmptyArrayStorage);
      uint64_t v69 = _CocoaArrayWrapper.endIndex.getter(v68);
      sub_2DC20();
      if (v69) {
        goto LABEL_59;
      }
LABEL_63:
      sub_2DC20();
      sub_6324();
      sub_1A480();
      v84 = sub_18F38(v333);
      v86 = v85;
      v87 = sub_149B4();
      unsigned int v6 = v318;
      if ((v86 & 1) != 0)
      {
        v95 = sub_2DD40( v87,  v88,  v89,  v90,  v91,  v92,  v93,  v94,  v275,  v276,  v277,  v278,  v280,  v282,  v284,  v286,  v288,  v290,  v292,  v294,  (uint64_t)output,  v298,  v300,  (uint64_t)v302,  v304,  v306,  v308,  v310,  v312,  v314);
        v96 = *(void *)(v86 + 24);
        sub_4D88(&qword_49E30);
        _NativeDictionary.ensureUnique(isUnique:capacity:)(v95, v96);
        v97 = sub_4D88(&qword_49448);
        v98 = sub_19F90();
        v314 = v86;
        _NativeDictionary._delete(at:)(v84, v86, &type metadata for HomeDeviceType, v97, v98);
        swift_bridgeObjectRelease();
        sub_1A0A4();
      }
    }

    else
    {
      if (!_swiftEmptyArrayStorage[2]) {
        goto LABEL_63;
      }
LABEL_59:
      uint64_t v1 = v332[24];
      if (v320)
      {
        sub_210E0();
        v99 = sub_2A758((unint64_t)_swiftEmptyArrayStorage, v320);
        sub_6324();
        sub_2DC20();
        v100 = sub_2DB7C();
        v101 = Array<A>.removeDuplicates()(v99, &type metadata for HomeAttributeType, v100);
        sub_62A4();
        sub_2DD84();
        v102 = sub_239AC(37LL);
        sub_2DD64(v102, v103);
        sub_2DC14();
        v337 = v104 - 1;
        v105 = *(void *)(v101 + 16);
        if (v105)
        {
          sub_2DEA8(0LL, v105);
          v106 = (uint64_t *)(v101 + 32);
          do
          {
            v107 = *v106++;
            v108 = HomeAttributeType.description.getter(v107);
            v110 = v109;
            v112 = _swiftEmptyArrayStorage[2];
            v111 = _swiftEmptyArrayStorage[3];
            if (v112 >= v111 >> 1) {
              sub_2DD08(v111);
            }
            _swiftEmptyArrayStorage[2] = v112 + 1;
            v113 = &_swiftEmptyArrayStorage[2 * v112];
            v113[4] = v108;
            v113[5] = v110;
            --v105;
          }

          while (v105);
        }

        v114 = v332[30];
        uint64_t v1 = v332[24];
        v344._countAndFlagsBits = Array.description.getter(_swiftEmptyArrayStorage, &type metadata for String);
        sub_2DC98(v344);
        sub_6324();
        sub_1A090();
        sub_2DC7C();
        sub_2DD4C();
        sub_6324();
        sub_2DD20(v337, v280);
        sub_15A64();
        sub_1A090();
        v115 = sub_2DD78(v114);
        v82 = sub_2DD40( v115,  v116,  v117,  v118,  v119,  v120,  v121,  v122,  v275,  v276,  v277,  v278,  v280,  v282,  v284,  v286,  v288,  v290,  v292,  v294,  (uint64_t)output,  v298,  v300,  (uint64_t)v302,  v304,  v306,  v308,  v310,  v312,  v314);
        v83 = (void *)v101;
      }

      else
      {
        unsigned int v70 = v332[29];
        sub_2DC20();
        sub_2DD84();
        sub_2DC7C();
        sub_1A480();
        sub_62A4();
        sub_2DC14();
        v72._countAndFlagsBits = v71 + 44;
        v72._object = output;
        v73._countAndFlagsBits = v327;
        v73._object = v33;
        Logger.debug(output:test:caller:)(v72, 0, v73);
        sub_149B4();
        uint64_t v74 = sub_2DD78(v70);
        v82 = sub_2DD40( v74,  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v275,  v276,  v277,  v278,  v280,  v282,  v284,  v286,  v288,  v290,  v292,  v294,  (uint64_t)output,  v298,  v300,  (uint64_t)v302,  v304,  v306,  v308,  v310,  v312,  v314);
        v337 = v70;
        v83 = _swiftEmptyArrayStorage;
      }

      sub_2C728((uint64_t)v83, v333, v82);
      v314 = v337;
      swift_bridgeObjectRelease();
      int v5 = v317;
      unsigned int v6 = v318;
    }
  }

  uint64_t v12 = *(void *)(v3 + 16);
  unint64_t result = v46[0];
  uint64_t v14 = v46[1];
  uint64_t v15 = v47;
  uint64_t v16 = v48;
  if (!v49)
  {
LABEL_46:
    uint64_t v36 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      goto LABEL_64;
    }
    uint64_t v22 = (unint64_t)(v15 + 64) >> 6;
    if (v36 >= v22) {
      goto LABEL_14;
    }
    char v37 = *(void *)(v14 + 8 * v36);
    uint64_t v38 = v16 + 1;
    if (!v37)
    {
      uint64_t v38 = v16 + 2;
      if (v16 + 2 >= v22) {
        goto LABEL_14;
      }
      uint64_t v39 = (unint64_t)(v15 + 64) >> 6;
      char v37 = *(void *)(v14 + 8 * v38);
      if (!v37)
      {
        uint64_t v38 = v16 + 3;
        if (v16 + 3 >= v22) {
          goto LABEL_14;
        }
        char v37 = *(void *)(v14 + 8 * v38);
        if (!v37)
        {
          uint64_t v38 = v16 + 4;
          if (v16 + 4 >= v39) {
            goto LABEL_14;
          }
          char v37 = *(void *)(v14 + 8 * v38);
          uint64_t v22 = (unint64_t)(v15 + 64) >> 6;
          if (!v37)
          {
            uint64_t v38 = v16 + 5;
            if (v16 + 5 >= v39) {
              goto LABEL_14;
            }
            char v37 = *(void *)(v14 + 8 * v38);
            uint64_t v22 = (unint64_t)(v15 + 64) >> 6;
            if (!v37)
            {
              uint64_t v40 = v16 + 6;
              do
              {
                if (v40 >= v39) {
                  goto LABEL_14;
                }
                char v37 = *(void *)(v14 + 8 * v40++);
              }

              while (!v37);
              uint64_t v38 = v40 - 1;
              uint64_t v22 = (unint64_t)(v15 + 64) >> 6;
            }
          }
        }
      }
    }

    uint64_t v20 = (v37 - 1) & v37;
    uint64_t v21 = __clz(__rbit64(v37)) + (v38 << 6);
    uint64_t v16 = v38;
    goto LABEL_19;
  }

  uint64_t v20 = (v49 - 1) & v49;
  uint64_t v21 = __clz(__rbit64(v49)) | (v48 << 6);
  uint64_t v22 = (unint64_t)(v47 + 64) >> 6;
LABEL_19:
  uint64_t v23 = *(void *)(*(void *)(result + 48) + 8 * v21);
  uint64_t v24 = &qword_49408;
  while (1)
  {
    uint64_t v25 = *(void *)(v3 + 24);
    uint64_t v26 = v25 >> 1;
    if ((uint64_t)(v25 >> 1) < v12 + 1)
    {
      uint64_t v44 = v14;
      uint64_t v45 = result;
      uint64_t v42 = v16;
      Swift::String v43 = v15;
      uint64_t v33 = v3;
      uint64_t v34 = v24;
      uint64_t v41 = v23;
      sub_2BCEC(v25 > 1, v12 + 1, 1, v33, v24, (void (*)(uint64_t, uint64_t, char *))sub_18920);
      uint64_t v23 = v41;
      uint64_t v16 = v42;
      uint64_t v24 = v34;
      uint64_t v15 = v43;
      uint64_t v14 = v44;
      int v3 = v35;
      unint64_t result = v45;
      uint64_t v26 = *(void *)(v3 + 24) >> 1;
    }

    if (v12 < v26) {
      break;
    }
LABEL_42:
    *(void *)(v3 + 16) = v12;
  }

  while (1)
  {
    *(void *)(v3 + 32 + 8 * v12++) = v23;
    if (v20)
    {
      Swift::String v27 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      uint64_t v28 = v27 | (v16 << 6);
      goto LABEL_41;
    }

    uint64_t v29 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v29 >= v22) {
      goto LABEL_43;
    }
    Swift::String v30 = *(void *)(v14 + 8 * v29);
    uint64_t v31 = v16 + 1;
    if (!v30)
    {
      uint64_t v31 = v16 + 2;
      if (v16 + 2 >= v22) {
        goto LABEL_43;
      }
      Swift::String v30 = *(void *)(v14 + 8 * v31);
      if (!v30)
      {
        uint64_t v31 = v16 + 3;
        if (v16 + 3 >= v22) {
          goto LABEL_43;
        }
        Swift::String v30 = *(void *)(v14 + 8 * v31);
        if (!v30)
        {
          uint64_t v31 = v16 + 4;
          if (v16 + 4 >= v22) {
            goto LABEL_43;
          }
          Swift::String v30 = *(void *)(v14 + 8 * v31);
          if (!v30)
          {
            uint64_t v31 = v16 + 5;
            if (v16 + 5 >= v22) {
              goto LABEL_43;
            }
            Swift::String v30 = *(void *)(v14 + 8 * v31);
            if (!v30)
            {
              uint64_t v32 = v16 + 6;
              while (v32 < v22)
              {
                Swift::String v30 = *(void *)(v14 + 8 * v32++);
                if (v30)
                {
                  uint64_t v31 = v32 - 1;
                  goto LABEL_40;
                }
              }

uint64_t storeEnumTagSinglePayload for UnitSemantic(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_69AC + 4 * byte_30061[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_69E0 + 4 * byte_3005C[v4]))();
}

uint64_t sub_69E0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_69E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x69F0LL);
  }
  return result;
}

uint64_t sub_69FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x6A04LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_6A08(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_6A10(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_6A1C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_6A24(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnitSemantic()
{
  return &type metadata for UnitSemantic;
}

unint64_t sub_6A3C()
{
  unint64_t result = qword_49030;
  if (!qword_49030)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49030);
  }

  return result;
}

unint64_t sub_6A78()
{
  unint64_t result = qword_49038;
  if (!qword_49038)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49038);
  }

  return result;
}

unint64_t sub_6AB4()
{
  unint64_t result = qword_49040;
  if (!qword_49040)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UnitSemantic, &type metadata for UnitSemantic);
    atomic_store(result, (unint64_t *)&qword_49040);
  }

  return result;
}

uint64_t sub_6AF0()
{
  return 0x656572676564LL;
}

  ;
}

uint64_t sub_6B18()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C8A0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfWindows(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_6B64()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C8B8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24898();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t *sub_6BC0(uint64_t a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for GetStateOfWindows()
{
  return &type metadata for GetStateOfWindows;
}

uint64_t sub_6C10@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&__int128 v38 = a1;
  uint64_t v39 = a2;
  uint64_t v37 = sub_4D88(&qword_49048);
  uint64_t v36 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_4D88(&qword_49050);
  uint64_t v9 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = swift_allocObject(v8, v13 + v11, v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_2FE90;
  uint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:),  v4);
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  swift_allocObject(IsSingleAccessoryOfTypeInHomeResolver, 32LL, 7LL);
  uint64_t v17 = sub_1BB78();
  uint64_t v18 = (uint64_t *)(v15 + v9[5]);
  v18[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v18[4] = sub_6F50();
  *uint64_t v18 = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v15, v7, v4);
  *(_BYTE *)(v15 + v9[6]) = 1;
  *(_BYTE *)(v15 + v9[7]) = 0;
  uint64_t v19 = sub_4D88(&qword_49060);
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v19);
  sub_6F90(v38, (uint64_t)&v44);
  LODWORD(IsSingleAccessoryOfTypeInHomeResolver) = *(unsigned __int8 *)(v15 + v9[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v20 = swift_bridgeObjectRetain(v14);
  uint64_t v21 = SuggestionParameter.rawValue.getter(v20);
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t v25 = v9[6];
  uint64_t v26 = *(unsigned __int8 *)(v15 + v25);
  if ((_DWORD)IsSingleAccessoryOfTypeInHomeResolver == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v3, v15 + v9[8], v37);
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v23, v24, v26, v3);
  }

  else
  {
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v21, v22, *(unsigned __int8 *)(v15 + v25));
  }

  uint64_t v28 = v27;
  uint64_t v29 = v46;
  __int128 v38 = v45;
  uint64_t v30 = v45;
  uint64_t v31 = sub_4D4C(&v44, v45);
  uint64_t v32 = SuggestionParameter.rawValue.getter(v31);
  uint64_t v34 = v33;
  sub_60C4(v15 + v9[5], (uint64_t)v40);
  __int128 v42 = v38;
  uint64_t v43 = v29;
  sub_6128(v41);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v34, v40, v28, v30, v29);
  swift_release(v28);
  swift_bridgeObjectRelease(v34);
  sub_6FD4((uint64_t)v40);
  sub_6108(v41);
  swift_bridgeObjectRelease(v14);
  sub_7014(&v44, v39);
  swift_setDeallocating(v14);
  return sub_1E9F4();
}

void *sub_6F40()
{
  return &_swiftEmptyArrayStorage;
}

unint64_t sub_6F50()
{
  unint64_t result = qword_49058;
  if (!qword_49058)
  {
    uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
    unint64_t result = swift_getWitnessTable(&unk_31668, IsSingleAccessoryOfTypeInHomeResolver);
    atomic_store(result, (unint64_t *)&qword_49058);
  }

  return result;
}

uint64_t sub_6F90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6FD4(uint64_t a1)
{
  uint64_t v2 = sub_4D88(&qword_49068);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

_OWORD *sub_7014(__int128 *a1, _OWORD *a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_702C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_7034()
{
  return sub_4D70(v0, v1);
}

uint64_t static StateSemantic.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v3 = StateSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  uint64_t v6 = StateSemantic.rawValue.getter(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 0;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 1LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t StateSemantic.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_7100 + 4 * word_30290[a1]))( 0xD000000000000011LL,  0x8000000000031EB0LL);
}

uint64_t sub_7100()
{
  return 28271LL;
}

uint64_t sub_710C()
{
  return 6710895LL;
}

uint64_t sub_711C()
{
  return 0x646574756DLL;
}

uint64_t sub_7548()
{
  return 0x676E69676E697773LL;
}

uint64_t sub_7560()
{
  return 0x64656D6D616ALL;
}

uint64_t sub_7570()
{
  return 0x6E61656C63LL;
}

void sub_7584()
{
}

uint64_t sub_7598()
{
  return 7368557LL;
}

uint64_t sub_75A8()
{
  return 0x6E416D7575636176LL;
}

uint64_t sub_75C8()
{
  return 0x61656C4370656564LL;
}

uint64_t sub_75E8()
{
  return 0x6B63697571LL;
}

uint64_t sub_75F8()
{
  return 0x7465697571LL;
}

void sub_760C()
{
}

uint64_t sub_76A0()
{
  return 0x6573756170LL;
}

uint64_t sub_76B4()
{
  return 0x656D75736572LL;
}

uint64_t sub_76C8()
{
  return 0x64656B636F64LL;
}

void sub_76D8()
{
}

void sub_76EC()
{
}

void sub_7700()
{
}

uint64_t sub_7718()
{
  return 0x646570706F7473LL;
}

HomeAutomationSiriSuggestions::StateSemantic_optional __swiftcall StateSemantic.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  unint64_t v2 = _findStringSwitchCaseWithCache(cases:string:cache:)( &off_40DD0,  rawValue._countAndFlagsBits,  rawValue._object,  &unk_48E00);
  swift_bridgeObjectRelease(object);
  if (v2 >= 0x4D) {
    return (HomeAutomationSiriSuggestions::StateSemantic_optional)77;
  }
  else {
    return (HomeAutomationSiriSuggestions::StateSemantic_optional)v2;
  }
}

_UNKNOWN **static StateSemantic.allCases.getter()
{
  return &off_41528;
}

void sub_778C(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_7798()
{
}

uint64_t sub_77A0(uint64_t a1)
{
  return sub_13A80(a1, *v1);
}

void sub_77A8(uint64_t a1)
{
}

HomeAutomationSiriSuggestions::StateSemantic_optional sub_77B0@<W0>( Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::StateSemantic_optional *a2@<X8>)
{
  result.value = StateSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_77DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = StateSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_7804(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static StateSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_7810(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13C3C(*a1, *a2);
}

BOOL sub_781C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13CE8(*a1, *a2);
}

uint64_t sub_7828(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13D54(*a1, *a2);
}

void sub_7834(void *a1@<X8>)
{
  *a1 = &off_41528;
}

uint64_t sub_7844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_7C20();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_78A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_7C20();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_78EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_7BA8();
  unint64_t v5 = sub_7BE4();
  unint64_t v6 = sub_7C20();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_7950()
{
  unint64_t result = qword_49070;
  if (!qword_49070)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_49070);
  }

  return result;
}

unint64_t sub_7990()
{
  unint64_t result = qword_49078;
  if (!qword_49078)
  {
    uint64_t v1 = sub_6844(&qword_49080);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_49078);
  }

  return result;
}

unint64_t sub_79D8()
{
  unint64_t result = qword_49088;
  if (!qword_49088)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_49088);
  }

  return result;
}

unint64_t sub_7A18()
{
  unint64_t result = qword_49090;
  if (!qword_49090)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_49090);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for StateSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xB4)
  {
    if (a2 + 76 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 76) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 77;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for StateSemantic(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 76 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 76) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xB4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xB3) {
    return ((uint64_t (*)(void))((char *)&loc_7B28 + 4 * byte_3032F[v4]))();
  }
  *a1 = a2 + 76;
  return ((uint64_t (*)(void))((char *)sub_7B5C + 4 * byte_3032A[v4]))();
}

uint64_t sub_7B5C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_7B64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x7B6CLL);
  }
  return result;
}

uint64_t sub_7B78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x7B80LL);
  }
  *(_BYTE *)unint64_t result = a2 + 76;
  return result;
}

uint64_t sub_7B84(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_7B8C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StateSemantic()
{
  return &type metadata for StateSemantic;
}

unint64_t sub_7BA8()
{
  unint64_t result = qword_49098;
  if (!qword_49098)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_49098);
  }

  return result;
}

unint64_t sub_7BE4()
{
  unint64_t result = qword_490A0;
  if (!qword_490A0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_490A0);
  }

  return result;
}

unint64_t sub_7C20()
{
  unint64_t result = qword_490A8;
  if (!qword_490A8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StateSemantic, &type metadata for StateSemantic);
    atomic_store(result, (unint64_t *)&qword_490A8);
  }

  return result;
}

uint64_t sub_7C5C()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C8D0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfHumidity(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_7CA8()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C8E8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_248B4();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfHumidity()
{
  return &type metadata for GetStateOfHumidity;
}

uint64_t sub_7D14()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C900);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfLightsPower(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_7D60()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C918);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_248D0();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfLightsPower()
{
  return &type metadata for GetStateOfLightsPower;
}

uint64_t sub_7DCC@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v46.n128_u64[0] = a1;
  uint64_t v50 = a2;
  v49.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v47 = *(void *)(v49.n128_u64[0] - 8);
  __chkstk_darwin(v49.n128_u64[0]);
  Swift::String v48 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v45 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 2 * v45, v10 | 7);
  uint64_t v51 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30550;
  uint64_t v13 = v12 + v11;
  sub_8314(v12, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:));
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  sub_8308(IsSingleAccessoryOfTypeInHomeResolver);
  uint64_t v15 = sub_1BB78();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v16[4] = sub_825C( (unint64_t *)&qword_49058,  (uint64_t (*)(uint64_t))type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver,  (uint64_t)&unk_31668);
  *uint64_t v16 = v15;
  __int128 v44 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  v44(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  sub_4D88(&qword_49060);
  uint64_t v17 = sub_82E8((uint64_t)sub_2E8A0);
  uint64_t v18 = v13 + v45;
  sub_8314(v17, enum case for SuggestionParameter.roomName(_:));
  uint64_t v19 = type metadata accessor for RoomNameResolver();
  sub_8308(v19);
  uint64_t v20 = sub_1B2BC();
  uint64_t v21 = (uint64_t *)(v18 + v8[5]);
  v21[3] = v19;
  v21[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *uint64_t v21 = v20;
  v44(v18, v6, v3);
  *(_BYTE *)(v18 + v8[6]) = 1;
  *(_BYTE *)(v18 + v8[7]) = 0;
  sub_82E8((uint64_t)sub_2E8A0);
  sub_6F90(v46.n128_i64[0], (uint64_t)&v54);
  LODWORD(v19) = *(unsigned __int8 *)(v13 + v8[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v22 = swift_bridgeObjectRetain(v51);
  uint64_t v23 = SuggestionParameter.rawValue.getter(v22);
  if ((_DWORD)v19 == 1)
  {
    sub_829C(v23, v13 + v8[8]);
    uint64_t v24 = sub_82BC();
  }

  else
  {
    uint64_t v24 = sub_82D4();
  }

  uint64_t v25 = v24;
  uint64_t v26 = v56;
  __n128 v46 = v55;
  unint64_t v27 = v55.n128_u64[0];
  uint64_t v28 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v29 = SuggestionParameter.rawValue.getter(v28);
  uint64_t v31 = v30;
  sub_60C4(v13 + v8[5], (uint64_t)v52);
  sub_82F8(v46);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v29, v31, v52, v25, v27, v26);
  swift_release(v25);
  swift_bridgeObjectRelease(v31);
  sub_6FD4((uint64_t)v52);
  uint64_t v32 = sub_6108(v53);
  LODWORD(v26) = *(unsigned __int8 *)(v18 + v8[7]);
  uint64_t v33 = SuggestionParameter.rawValue.getter(v32);
  if ((_DWORD)v26 == 1)
  {
    sub_829C(v33, v18 + v8[8]);
    uint64_t v34 = sub_82BC();
  }

  else
  {
    uint64_t v34 = sub_82D4();
  }

  uint64_t v35 = v34;
  uint64_t v36 = v56;
  __n128 v49 = v55;
  unint64_t v37 = v55.n128_u64[0];
  __int128 v38 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v39 = SuggestionParameter.rawValue.getter(v38);
  uint64_t v41 = v40;
  sub_60C4(v18 + v8[5], (uint64_t)v52);
  sub_82F8(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v39, v41, v52, v35, v37, v36);
  swift_release(v35);
  swift_bridgeObjectRelease(v41);
  sub_6FD4((uint64_t)v52);
  sub_6108(v53);
  uint64_t v42 = v51;
  swift_bridgeObjectRelease(v51);
  sub_7014(&v54, v50);
  swift_setDeallocating(v42);
  return sub_1E9F4();
}

uint64_t sub_825C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_829C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v2 - 272) + 16LL))( *(void *)(v2 - 264),  a2,  *(void *)(v2 - 256));
}

uint64_t sub_82BC()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v2, v0, v3, v1);
}

uint64_t sub_82D4()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)(v1, v0, v2);
}

uint64_t sub_82E8(uint64_t a1)
{
  return Transformer.init(transform:)(a1, 0LL, v2, v1);
}

void *sub_82F8(__n128 a1)
{
  *(__n128 *)(v2 - 160) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_6128((void *)(v2 - 184));
}

uint64_t sub_8308(uint64_t a1)
{
  return swift_allocObject(a1, 32LL, 7LL);
}

uint64_t sub_8314(uint64_t a1, uint64_t a2)
{
  return v3(v2, a2, v4);
}

uint64_t sub_8320()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C930);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.openCloseSecureAccessories(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_836C()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C948);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_248EC();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for OpenCloseSecureAccessoriesSuggestion()
{
  return &type metadata for OpenCloseSecureAccessoriesSuggestion;
}

uint64_t sub_83D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v11 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48C90 != -1) {
    swift_once(&qword_48C90, sub_8320);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  sub_4D70(v4, (uint64_t)qword_4C930);
  uint64_t v5 = HomeSuggestionType.rawValue.getter();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject(v8, 40LL, 7LL);
  uint64_t v9 = sub_15E34(v5, v7);
  v12[3] = v8;
  v12[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v12, v3, v11);
  return sub_6108(v12);
}

uint64_t sub_850C@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v68.n128_u64[0] = a1;
  uint64_t v69 = a2;
  v71.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v70 = *(void *)(v71.n128_u64[0] - 8);
  __chkstk_darwin(v71.n128_u64[0]);
  v73.n128_u64[0] = (unint64_t)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v67 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 3 * v67, v10 | 7);
  uint64_t v74 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30590;
  uint64_t v13 = v12 + v11;
  uint64_t v72 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v72(v6, enum case for SuggestionParameter.accessoryType(_:), v3);
  uint64_t v14 = type metadata accessor for AccessoryTypeResolver();
  sub_8308(v14);
  uint64_t v15 = sub_284F0();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  v16[4] = sub_825C( &qword_490B8,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryTypeResolver,  (uint64_t)&unk_31D58);
  *uint64_t v16 = v15;
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v63 = v3;
  v66(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 1;
  uint64_t v17 = sub_4D88(&qword_49060);
  uint64_t v64 = (char *)&type metadata for Any + 8;
  uint64_t v65 = v17;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v18 = v67;
  uint64_t v19 = v13 + v67;
  sub_8BE0();
  uint64_t v20 = type metadata accessor for RoomNameResolver();
  sub_8308(v20);
  uint64_t v21 = sub_1B2BC();
  uint64_t v22 = (uint64_t *)(v19 + v8[5]);
  v22[3] = v20;
  v22[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *uint64_t v22 = v21;
  uint64_t v23 = v63;
  uint64_t v24 = v66;
  v66(v13 + v18, v6, v63);
  *(_BYTE *)(v19 + v8[6]) = 1;
  *(_BYTE *)(v19 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v25 = v13 + 2 * v18;
  uint64_t v26 = v23;
  sub_8BE0();
  uint64_t v27 = type metadata accessor for AccessoryNameResolver();
  sub_8308(v27);
  uint64_t v28 = sub_23FA8();
  uint64_t v29 = (uint64_t *)(v25 + v8[5]);
  v29[3] = v27;
  v29[4] = sub_825C( &qword_490C0,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryNameResolver,  (uint64_t)&unk_319C8);
  *uint64_t v29 = v28;
  v24(v25, v6, v26);
  uint64_t v30 = v25;
  *(_BYTE *)(v25 + v8[6]) = 0;
  *(_BYTE *)(v25 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, v64, v65);
  sub_6F90(v68.n128_i64[0], (uint64_t)&v76);
  LODWORD(v6) = *(unsigned __int8 *)(v13 + v8[7]);
  uint64_t v31 = type metadata accessor for ResolvableParameter(0LL);
  uint64_t v32 = swift_bridgeObjectRetain(v74);
  SuggestionParameter.rawValue.getter(v32);
  sub_8BA8();
  uint64_t v34 = *(unsigned __int8 *)(v13 + v33);
  BOOL v35 = (_DWORD)v6 == 1;
  unint64_t v36 = v73.n128_u64[0];
  uint64_t v72 = (void (*)(char *, void, uint64_t))v31;
  if (v35)
  {
    (*(void (**)(unint64_t, uint64_t, unint64_t))(v70 + 16))( v73.n128_u64[0],  v13 + v8[8],  v71.n128_u64[0]);
    ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v13, v26, v34, v36);
  }

  else
  {
    ResolvableParameter.__allocating_init(typeIdentifier:required:)(v13, v26, v34);
  }

  __n128 v68 = v77;
  unint64_t v37 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v37);
  uint64_t v39 = v38;
  sub_8BFC(v13 + v8[5]);
  sub_82F8(v68);
  uint64_t v40 = sub_8BD0();
  sub_8B40(v40, v39, v41);
  sub_8BF4();
  swift_bridgeObjectRelease(v39);
  sub_8BEC();
  uint64_t v42 = sub_6108(v75);
  char v43 = *(_BYTE *)(v19 + v8[7]);
  SuggestionParameter.rawValue.getter(v42);
  sub_8BA8();
  if ((v43 & 1) != 0)
  {
    uint64_t v44 = sub_8BB8();
    v45(v44);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v71 = v77;
  __n128 v46 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v46);
  uint64_t v48 = v47;
  sub_8BFC(v19 + v8[5]);
  sub_82F8(v71);
  uint64_t v49 = sub_8BD0();
  sub_8B40(v49, v48, v50);
  sub_8BF4();
  swift_bridgeObjectRelease(v48);
  sub_8BEC();
  uint64_t v51 = sub_6108(v75);
  char v52 = *(_BYTE *)(v30 + v8[7]);
  SuggestionParameter.rawValue.getter(v51);
  sub_8BA8();
  if ((v52 & 1) != 0)
  {
    uint64_t v53 = sub_8BB8();
    v54(v53);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v73 = v77;
  __n128 v55 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v55);
  uint64_t v57 = v56;
  sub_8BFC(v30 + v8[5]);
  sub_82F8(v73);
  uint64_t v58 = sub_8BD0();
  sub_8B40(v58, v57, v59);
  sub_8BF4();
  swift_bridgeObjectRelease(v57);
  sub_8BEC();
  sub_6108(v75);
  uint64_t v60 = v74;
  swift_bridgeObjectRelease(v74);
  sub_7014(&v76, v69);
  swift_setDeallocating(v60);
  return sub_1E9F4();
}

uint64_t sub_8B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(a1, a2, a3, v3, v5, v4);
}

uint64_t sub_8B54()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v1, v0, v2, v3);
}

void *sub_8B70(double a1)
{
  return sub_4D4C((void *)(v1 - 136), *(uint64_t *)&a1);
}

uint64_t sub_8B90()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)(v1, v0, v2);
}

  ;
}

uint64_t sub_8BB8()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_8BD0()
{
  return v0;
}

uint64_t sub_8BE0()
{
  return (*(uint64_t (**)(void))(v0 - 264))();
}

uint64_t sub_8BEC()
{
  return sub_6FD4(v0 - 224);
}

uint64_t sub_8BF4()
{
  return swift_release(v0);
}

uint64_t sub_8BFC(uint64_t a1)
{
  return sub_60C4(a1, v1 - 224);
}

uint64_t sub_8C04()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C960);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfGarageDoors(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_8C50()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C978);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24908();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfGarageDoors()
{
  return &type metadata for GetStateOfGarageDoors;
}

uint64_t sub_8CBC()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C990);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfAirQuality(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_8D08()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C9A8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24924();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfAirQuality()
{
  return &type metadata for GetStateOfAirQuality;
}

uint64_t sub_8D74@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&__int128 v38 = a1;
  uint64_t v39 = a2;
  uint64_t v37 = sub_4D88(&qword_49048);
  uint64_t v36 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_4D88(&qword_49050);
  uint64_t v9 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = swift_allocObject(v8, v13 + v11, v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_2FE90;
  uint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for SuggestionParameter.roomName(_:), v4);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject(v16, 32LL, 7LL);
  uint64_t v17 = sub_1B2BC();
  uint64_t v18 = (uint64_t *)(v15 + v9[5]);
  v18[3] = v16;
  v18[4] = sub_90A4();
  *uint64_t v18 = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v15, v7, v4);
  *(_BYTE *)(v15 + v9[6]) = 0;
  *(_BYTE *)(v15 + v9[7]) = 0;
  uint64_t v19 = sub_4D88(&qword_49060);
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v19);
  sub_6F90(v38, (uint64_t)&v44);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v9[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v20 = swift_bridgeObjectRetain(v14);
  uint64_t v21 = SuggestionParameter.rawValue.getter(v20);
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t v25 = v9[6];
  uint64_t v26 = *(unsigned __int8 *)(v15 + v25);
  if ((_DWORD)v16 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v3, v15 + v9[8], v37);
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v23, v24, v26, v3);
  }

  else
  {
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v21, v22, *(unsigned __int8 *)(v15 + v25));
  }

  uint64_t v28 = v27;
  uint64_t v29 = v46;
  __int128 v38 = v45;
  uint64_t v30 = v45;
  uint64_t v31 = sub_4D4C(&v44, v45);
  uint64_t v32 = SuggestionParameter.rawValue.getter(v31);
  uint64_t v34 = v33;
  sub_60C4(v15 + v9[5], (uint64_t)v40);
  __int128 v42 = v38;
  uint64_t v43 = v29;
  sub_6128(v41);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v34, v40, v28, v30, v29);
  swift_release(v28);
  swift_bridgeObjectRelease(v34);
  sub_6FD4((uint64_t)v40);
  sub_6108(v41);
  swift_bridgeObjectRelease(v14);
  sub_7014(&v44, v39);
  swift_setDeallocating(v14);
  return sub_1E9F4();
}

unint64_t sub_90A4()
{
  unint64_t result = qword_490B0;
  if (!qword_490B0)
  {
    uint64_t v1 = type metadata accessor for RoomNameResolver();
    unint64_t result = swift_getWitnessTable(&unk_315A4, v1);
    atomic_store(result, (unint64_t *)&qword_490B0);
  }

  return result;
}

uint64_t HueSemantic.rawValue.getter(unsigned __int16 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_911C + 4 * word_30640[a1]))( 0xD000000000000010LL,  0x8000000000034FB0LL);
}

uint64_t sub_911C()
{
  return 0x6873696E65657267LL;
}

uint64_t sub_9548()
{
  return sub_112A4(0x756C622075616562LL);
}

void sub_9554()
{
}

uint64_t sub_9568()
{
  return 0x657571736962LL;
}

uint64_t sub_957C()
{
  return 0x657274736962LL;
}

uint64_t sub_9590()
{
  return 0x7773726574746962LL;
}

uint64_t sub_95B4()
{
  return 0x6B63616C62LL;
}

uint64_t sub_95C8()
{
  return 0x646568636E616C62LL;
}

void sub_95EC()
{
}

uint64_t sub_9610()
{
  return 0x646E6F6C62LL;
}

uint64_t sub_9624()
{
  return 1702194274LL;
}

uint64_t sub_9634()
{
  return 0x6172672065756C62LL;
}

uint64_t sub_9654()
{
  return 0x6572672065756C62LL;
}

uint64_t sub_9660()
{
  return 0x7275702065756C62LL;
}

void sub_9684()
{
}

uint64_t sub_96A0()
{
  return 0x6873756C62LL;
}

uint64_t sub_96B4()
{
  return sub_11370(0x2069646E6F62LL, 0xEA00000000006575LL);
}

void sub_96D0()
{
}

uint64_t sub_96E0(uint64_t a1)
{
  return a1 + 5;
}

void sub_96F0()
{
}

uint64_t sub_9700()
{
  return sub_11338(0x65626E6573796F62LL, 7959154LL);
}

void sub_971C()
{
}

uint64_t sub_9730()
{
  return 0x7373617262LL;
}

uint64_t sub_9744()
{
  return 0x6572206B63697262LL;
}

uint64_t sub_9760()
{
  return 0x61696E6F676562LL;
}

uint64_t sub_9778()
{
  return sub_11308(0x746867697262LL);
}

uint64_t sub_9794()
{
  return sub_11378(0x7720746867697262LL, 1702127976LL);
}

void sub_97B0()
{
}

uint64_t sub_97C0()
{
  return sub_11338(0x6220746867697262LL, 6649196LL);
}

uint64_t sub_97DC()
{
  return 0x6320746867697262LL;
}

void sub_97FC()
{
}

uint64_t sub_980C()
{
  return 0x6C20746867697262LL;
}

void sub_982C()
{
}

uint64_t sub_9850()
{
  return sub_11338(0x7020746867697262LL, 7040617LL);
}

  ;
}

uint64_t sub_986C(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_987C()
{
  return 0x6E61696C6C697262LL;
}

uint64_t sub_98A0(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_98B0()
{
  return 0x657A6E6F7262LL;
}

uint64_t sub_98C4()
{
  return 0x6E776F7262LL;
}

uint64_t sub_98D8()
{
  return 0x6720656C62627562LL;
}

uint64_t sub_98F8()
{
  return 1717990754LL;
}

uint64_t sub_9908()
{
  return sub_1135C(0x61697261676C7562LL, 0x65736F72206ELL);
}

uint64_t sub_9928()
{
  return 0x79646E7567727562LL;
}

void sub_9940()
{
}

uint64_t sub_9960()
{
  return sub_11348(0x20746E727562LL);
}

uint64_t sub_9980()
{
  return 0x697320746E727562LL;
}

uint64_t sub_99A4()
{
  return sub_11338(0x6D7520746E727562LL, 7497058LL);
}

void sub_99C0()
{
}

uint64_t sub_99D4()
{
  return 0x7569746E617A7962LL;
}

void sub_99F4()
{
}

void sub_9A0C()
{
}

uint64_t sub_9A20()
{
  return 0x7465646163LL;
}

uint64_t sub_9A34()
{
  return sub_11370(0x207465646163LL, 0xEA00000000006575LL);
}

uint64_t sub_9A50()
{
  return 0x7267207465646163LL;
}

void sub_9A70()
{
}

uint64_t sub_9A90()
{
  return sub_1135C(0x206D75696D646163LL, 0x65676E61726FLL);
}

uint64_t sub_9AB0()
{
  return sub_11338(0x206D75696D646163LL, 6579570LL);
}

uint64_t sub_9AE4(uint64_t a1)
{
  return a1 + 5;
}

  ;
}

uint64_t sub_9B20()
{
  return 0x7972616E6163LL;
}

void sub_9B30()
{
}

void sub_9B40()
{
}

uint64_t sub_9B5C()
{
  return sub_11324(0x2079646E6163LL);
}

uint64_t sub_9B78()
{
  return 0x6972706163LL;
}

uint64_t sub_9B8C()
{
  return 0x6F6D207475706163LL;
}

uint64_t sub_9BB0()
{
  return 0x6C616E6964726163LL;
}

uint64_t sub_9BC4()
{
  return 0x6165626269726163LL;
}

uint64_t sub_9BEC()
{
  return 0x656E696D726163LL;
}

uint64_t sub_9BFC()
{
  return sub_11378(0x20656E696D726163LL, 1802398064LL);
}

void sub_9C18()
{
}

uint64_t sub_9C2C()
{
  return sub_1135C(0x6F6974616E726163LL, 0x6B6E6970206ELL);
}

uint64_t sub_9C4C()
{
  return 0x61696C656E726163LL;
}

uint64_t sub_9CE8()
{
  return 0x657369726563LL;
}

uint64_t sub_9D18()
{
  return 0x6E61656C75726563LL;
}

void sub_9D2C()
{
}

void sub_9D40()
{
}

void sub_9D54()
{
}

uint64_t sub_9D68()
{
  return 0x6C616F6372616863LL;
}

uint64_t sub_9D7C()
{
  return 0x7565727472616863LL;
}

void sub_9D9C()
{
}

uint64_t sub_9DB0(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_9DC0()
{
  return 0x74756E7473656863LL;
}

void sub_9DD8()
{
}

uint64_t sub_9E0C()
{
  return 0x756F6572656E6963LL;
}

uint64_t sub_9E2C()
{
  return sub_112EC(0x62616E6E6963LL);
}

uint64_t sub_9E40()
{
  return 0x6E6F6D616E6E6963LL;
}

void sub_9E58()
{
}

uint64_t sub_9E70()
{
  return sub_11378(0x2063697373616C63LL, 1702063986LL);
}

uint64_t sub_9E8C()
{
  return 0x746C61626F63LL;
}

uint64_t sub_9EA0()
{
  return sub_11338(0x726220616F636F63LL, 7239535LL);
}

uint64_t sub_9EBC()
{
  return 0x656566666F63LL;
}

void sub_9ED0()
{
}

uint64_t sub_9EE4()
{
  return sub_11298(0x6C6F6F63u);
}

uint64_t sub_9EFC()
{
  return 0x657267206C6F6F63LL;
}

uint64_t sub_9F18()
{
  return 0x726570706F63LL;
}

uint64_t sub_9F2C()
{
  return sub_11308(0x726570706F63LL, 0xEB0000000065736FLL);
}

uint64_t sub_9F4C()
{
  return 0x63696C6575716F63LL;
}

uint64_t sub_9F6C()
{
  return 0x6C61726F63LL;
}

void sub_9F80()
{
}

uint64_t sub_9F9C()
{
  return 0x6572206C61726F63LL;
}

uint64_t sub_9FB8()
{
  return 0x6E61766F64726F63LL;
}

uint64_t sub_9FCC()
{
  return sub_113B0(1852993379LL);
}

void sub_9FDC()
{
}

uint64_t sub_9FF0()
{
  return 0x776F6C666E726F63LL;
}

uint64_t sub_A010()
{
  return 0x776F6C666E726F63LL;
}

uint64_t sub_A038()
{
  return 0x6B6C69736E726F63LL;
}

void sub_A050()
{
}

void sub_A074()
{
}

uint64_t sub_A094()
{
  return 0x6D61657263LL;
}

void sub_A0A8()
{
}

void sub_A0C0()
{
}

uint64_t sub_A0D4()
{
  return 0x206E6F736D697263LL;
}

uint64_t sub_A0F8()
{
  return 1851881827LL;
}

uint64_t sub_A108()
{
  return 0x6C69646F66666164LL;
}

uint64_t sub_A11C()
{
  return 0x6F696C65646E6164LL;
}

uint64_t sub_A13C()
{
  return sub_112A4(0x756C62206B726164LL);
}

uint64_t sub_A148()
{
  return 0x6F7262206B726164LL;
}

uint64_t sub_A168()
{
  return 0x7A7962206B726164LL;
}

uint64_t sub_A18C(uint64_t a1)
{
  return a1 + 4;
}

void sub_A19C()
{
}

void sub_A1BC()
{
}

uint64_t sub_A1C8()
{
  return sub_11348(0x63206B726164LL);
}

uint64_t sub_A1E4()
{
  return 0x617963206B726164LL;
}

uint64_t sub_A204(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_A214()
{
  return sub_1135C(0x6C6F67206B726164LL, 0x646F726E6564LL);
}

uint64_t sub_A234()
{
  return 0x617267206B726164LL;
}

uint64_t sub_A314()
{
  return 0x63726F206B726164LL;
}

  ;
}

uint64_t sub_A344(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_A354(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_A364()
{
  return 0x736170206B726164LL;
}

uint64_t sub_A3CC()
{
  return 0x646572206B726164LL;
}

void sub_A3E4()
{
}

uint64_t sub_A40C()
{
  return 0x616373206B726164LL;
}

void sub_A430()
{
}

uint64_t sub_A450()
{
  return 0x656973206B726164LL;
}

uint64_t sub_A474()
{
  return 0x616C73206B726164LL;
}

uint64_t sub_A494()
{
  return 0x616C73206B726164LL;
}

uint64_t sub_A4B8(uint64_t a1)
{
  return a1 + 1;
}

void sub_A4C8()
{
}

uint64_t sub_A4F4()
{
  return sub_11390(0x6B726164u);
}

  ;
}

uint64_t sub_A518()
{
  return 0x727574206B726164LL;
}

uint64_t sub_A53C()
{
  return sub_11338(0x6F6976206B726164LL, 7628140LL);
}

uint64_t sub_A558()
{
  return 0x6C6579206B726164LL;
}

uint64_t sub_A578()
{
  return 0x74756F6D74726164LL;
}

void sub_A5A0()
{
}

uint64_t sub_A5C0()
{
  return sub_11378(0x7261632070656564LL, 1701734765LL);
}

uint64_t sub_A5DC(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_A5EC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_A5FC()
{
  return 0x7265632070656564LL;
}

void sub_A620()
{
}

uint64_t sub_A664()
{
  return 0x666F632070656564LL;
}

uint64_t sub_A688()
{
  return sub_11378(0x6375662070656564LL, 1634300776LL);
}

uint64_t sub_A6A4(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_A6B4()
{
  return 0x6C696C2070656564LL;
}

uint64_t sub_A6EC()
{
  return sub_11364(0x70656564u);
}

void sub_A704()
{
}

uint64_t sub_A720()
{
  return 0x6661732070656564LL;
}

void sub_A744()
{
}

uint64_t sub_A758()
{
  return 0x6D696E6564LL;
}

uint64_t sub_A76C()
{
  return 0x747265736564LL;
}

uint64_t sub_A780()
{
  return 0x7320747265736564LL;
}

uint64_t sub_A7A4()
{
  return 0x79617267206D6964LL;
}

uint64_t sub_A7BC()
{
  return sub_11338(0x6220726567646F64LL, 6649196LL);
}

uint64_t sub_A7CC()
{
  return sub_11378(0x20646F6F77676F64LL, 1702063986LL);
}

uint64_t sub_A7E8()
{
  return 0x622072616C6C6F64LL;
}

uint64_t sub_A80C()
{
  return 1650553444LL;
}

uint64_t sub_A81C()
{
  return sub_112A4(0x756C6220656B7564LL);
}

uint64_t sub_A828()
{
  return sub_11378(0x6579206874726165LL, 2003790956LL);
}

uint64_t sub_A838()
{
  return 1970430821LL;
}

uint64_t sub_A848()
{
  return 0x746E616C70676765LL;
}

uint64_t sub_A860()
{
  return 0x6C6C656873676765LL;
}

void sub_A878()
{
}

  ;
}

uint64_t sub_A8B8()
{
  return 0x6369727463656C65LL;
}

uint64_t sub_A90C()
{
  return 0x6369727463656C65LL;
}

uint64_t sub_A92C(uint64_t a1)
{
  return a1 + 4;
}

void sub_A93C()
{
}

void sub_A950()
{
}

void sub_A978()
{
}

uint64_t sub_A988()
{
  return 0x64657220756C6166LL;
}

void sub_A99C()
{
}

uint64_t sub_A9B0()
{
  return sub_113B0(1853317478LL);
}

uint64_t sub_A9BC()
{
  return sub_113B0(1852990822LL);
}

uint64_t sub_AA00()
{
  return 0x726420646C656966LL;
}

uint64_t sub_AA20()
{
  return 0x676E652065726966LL;
}

void sub_AA48()
{
}

uint64_t sub_AA68()
{
  return 0x656D616C66LL;
}

void sub_AA78()
{
}

uint64_t sub_AA98()
{
  return 0x6563736576616C66LL;
}

uint64_t sub_AAB8()
{
  return sub_113B0(2019650662LL);
}

uint64_t sub_AAC4()
{
  return sub_11378(0x77206C61726F6C66LL, 1702127976LL);
}

uint64_t sub_AAE0(uint64_t a1)
{
  return a1 + 2;
}

  ;
}

uint64_t sub_AAFC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_AB0C()
{
  return 0x796C6C6F66LL;
}

void sub_AB1C()
{
}

uint64_t sub_AB2C()
{
  return sub_11378(0x622068636E657266LL, 1701276005LL);
}

uint64_t sub_AB64()
{
  return sub_11378(0x6C2068636E657266LL, 1667329129LL);
}

void sub_AB80()
{
}

uint64_t sub_ABA0()
{
  return sub_11380(0x61697368637566LL);
}

uint64_t sub_ABB4()
{
  return sub_11378(0x2061697368637566LL, 1802398064LL);
}

uint64_t sub_ABD0()
{
  return 0x757720797A7A7566LL;
}

void sub_ABF8()
{
}

uint64_t sub_AC18()
{
  return sub_11380(0x65676F626D6167LL);
}

uint64_t sub_AC2C()
{
  return 0x68772074736F6867LL;
}

uint64_t sub_AC50()
{
  return sub_113B8(0x7265676E6967LL);
}

uint64_t sub_AC60()
{
  return 0x73756F6375616C67LL;
}

uint64_t sub_AC74()
{
  return sub_11380(0x72657474696C67LL);
}

uint64_t sub_AC88()
{
  return sub_113B0(1684828007LL);
}

uint64_t sub_AC94()
{
  return sub_11378(0x62206E65646C6F67LL, 1853321074LL);
}

uint64_t sub_ACB0()
{
  return sub_11378(0x70206E65646C6F67LL, 2037411951LL);
}

void sub_ACCC()
{
}

uint64_t sub_ACEC()
{
  return 0x6F726E65646C6F67LL;
}

uint64_t sub_AD08(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_AD24()
{
  return 0x6E65657267LL;
}

void sub_AD34()
{
}

void sub_AD50()
{
}

uint64_t sub_AD60()
{
  return sub_113B8(0x6F6C6C757267LL);
}

uint64_t sub_AD8C()
{
  return 0x65756C62206E6168LL;
}

uint64_t sub_ADA0()
{
  return 0x70727570206E6168LL;
}

void sub_ADDC()
{
}

void sub_ADFC()
{
}

uint64_t sub_AE18()
{
  return 0x6F67207472616568LL;
}

uint64_t sub_AE38()
{
  return 0x6F72746F696C6568LL;
}

  ;
}

uint64_t sub_AE60()
{
  return 0x77656479656E6F68LL;
}

void sub_AE74()
{
}

uint64_t sub_AE90()
{
  return 0x6B6E697020746F68LL;
}

uint64_t sub_AEA4()
{
  return 0x656E697265746369LL;
}

void sub_AEB8()
{
}

uint64_t sub_AED4()
{
  return sub_113B8(0x6F6769646E69LL);
}

uint64_t sub_AEE4(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_AEF4(uint64_t a1)
{
  return a1 + 4;
}

void sub_AF04()
{
}

uint64_t sub_AF10()
{
  return 0x696C6C6562617369LL;
}

uint64_t sub_AF2C()
{
  return 0x79726F7669LL;
}

uint64_t sub_AF3C()
{
  return sub_113B0(1701077354LL);
}

void sub_AF48()
{
}

uint64_t sub_AF54()
{
  return sub_113B8(0x72657073616ALL);
}

void sub_AF64()
{
}

uint64_t sub_AF84()
{
  return sub_11380(0x6C6975716E6F6ALL);
}

uint64_t sub_AF94()
{
  return 0x64756220656E756ALL;
}

void sub_AFA8()
{
}

void sub_AFB8()
{
}

uint64_t sub_AFC8()
{
  return 0x696B61686BLL;
}

void sub_AFD8()
{
}

  ;
}

uint64_t sub_AFF8()
{
  return sub_11378(0x616C20736970616CLL, 1768715642LL);
}

uint64_t sub_B014()
{
  return 0x656C20726573616CLL;
}

void sub_B03C()
{
}

uint64_t sub_B04C()
{
  return sub_113B0(1635148140LL);
}

uint64_t sub_B058()
{
  return sub_11310();
}

void sub_B068()
{
}

void sub_B078()
{
}

void sub_B094()
{
}

void sub_B0B0()
{
}

void sub_B0C0()
{
}

uint64_t sub_B0D8()
{
  return sub_113A8(0x7265646E6576616CLL, 0x6B6E697020LL);
}

void sub_B0F8()
{
}

void sub_B11C()
{
}

uint64_t sub_B134()
{
  return 0x657267206E77616CLL;
}

uint64_t sub_B140()
{
  return 0x6E6F6D656CLL;
}

uint64_t sub_B14C()
{
  return sub_11378(0x6579206E6F6D656CLL, 2003790956LL);
}

uint64_t sub_B15C()
{
  return sub_113A8(0x6863206E6F6D656CLL, 0x6E6F666669LL);
}

void sub_B178()
{
}

void sub_B198()
{
}

uint64_t sub_B1B4(uint64_t a1)
{
  return a1 + 2;
}

void sub_B1C4()
{
}

uint64_t sub_B1E0()
{
  return sub_11370(0x20746867696CLL);
}

void sub_B1FC()
{
}

uint64_t sub_B20C(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_B21C()
{
  return sub_11338(0x6F6320746867696CLL, 7102834LL);
}

uint64_t sub_B238(uint64_t a1)
{
  return a1 + 5;
}

uint64_t sub_B248()
{
  return 0x796320746867696CLL;
}

uint64_t sub_B268(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_B278(uint64_t a1)
{
  return a1 + 6;
}

void sub_B288()
{
}

void sub_B2A0()
{
}

uint64_t sub_B2B0()
{
  return sub_11338(0x686B20746867696CLL, 6908769LL);
}

uint64_t sub_B2CC(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_B2DC()
{
  return sub_11324(0x20746867696CLL);
}

uint64_t sub_B2F8()
{
  return sub_11378(0x617320746867696CLL, 1852796268LL);
}

uint64_t sub_B314(uint64_t a1)
{
  return a1 + 1;
}

void sub_B324()
{
}

uint64_t sub_B344()
{
  return 0x6B7320746867696CLL;
}

  ;
}

void sub_B378()
{
}

uint64_t sub_B3A4()
{
  return 0x63616C696CLL;
}

uint64_t sub_B3B4()
{
  return sub_113B0(1701669228LL);
}

uint64_t sub_B3C0()
{
  return 0x65726720656D696CLL;
}

void sub_B3CC()
{
}

void sub_B3E8()
{
}

uint64_t sub_B3F4()
{
  return sub_113B0(1852795244LL);
}

uint64_t sub_B400()
{
  return sub_1139C(0x2075736Du);
}

uint64_t sub_B418()
{
  return sub_11380(0x61746E6567616DLL);
}

uint64_t sub_B42C()
{
  return 0x696D20636967616DLL;
}

uint64_t sub_B44C()
{
  return 0x61696C6F6E67616DLL;
}

uint64_t sub_B460()
{
  return 0x796E61676F68616DLL;
}

void sub_B474()
{
}

void sub_B480()
{
}

void sub_B494()
{
}

uint64_t sub_B4A8()
{
  return sub_11338(0x6174206F676E616DLL, 7300974LL);
}

uint64_t sub_B4C4()
{
  return sub_113B8(0x6E6F6F72616DLL);
}

void sub_B4D4()
{
}

uint64_t sub_B4F8()
{
  return 0x756F6C657675616DLL;
}

uint64_t sub_B518(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_B528(uint64_t a1)
{
  return a1 + 1;
}

void sub_B538()
{
}

uint64_t sub_B548(uint64_t a1)
{
  return a1 + 6;
}

void sub_B558()
{
}

  ;
}

uint64_t sub_B584(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_B594(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_B5A4(uint64_t a1)
{
  return a1 + 7;
}

uint64_t sub_B5B4()
{
  return sub_113A8(0x6F206D756964656DLL, 0x6469686372LL);
}

void sub_B5D4()
{
}

uint64_t sub_B5F0(uint64_t a1)
{
  return a1 + 1;
}

  ;
}

uint64_t sub_B60C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_B61C(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_B62C()
{
  return sub_11378(0x74206D756964656DLL, 1701868897LL);
}

  ;
}

  ;
}

uint64_t sub_B660(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_B69C()
{
  return sub_1135C(0x746867696E64696DLL, 0x6E6565726720LL);
}

uint64_t sub_B6B0()
{
  return sub_113A8(0x79206F64616B696DLL, 0x776F6C6C65LL);
}

uint64_t sub_B6C0()
{
  return sub_113B0(1953393005LL);
}

uint64_t sub_B6CC()
{
  return 0x65726320746E696DLL;
}

uint64_t sub_B6EC()
{
  return 0x65726720746E696DLL;
}

uint64_t sub_B6F8()
{
  return 0x6F7220797473696DLL;
}

uint64_t sub_B714()
{
  return 0x6E69736163636F6DLL;
}

uint64_t sub_B728()
{
  return 0x6965622065646F6DLL;
}

void sub_B768()
{
}

uint64_t sub_B788()
{
  return 0x6572672073736F6DLL;
}

uint64_t sub_B794()
{
  return 0x6E6961746E756F6DLL;
}

  ;
}

uint64_t sub_B7C4()
{
  return 0x79727265626C756DLL;
}

uint64_t sub_B7EC()
{
  return sub_11380(0x6472617473756DLL);
}

uint64_t sub_B800()
{
  return sub_113B8(0x656C7472796DLL);
}

uint64_t sub_B810()
{
  return 0x6B6968736564616ELL;
}

void sub_B838()
{
}

void sub_B848()
{
}

uint64_t sub_B858()
{
  return sub_11378(0x77206F6A6176616ELL, 1702127976LL);
}

uint64_t sub_B874()
{
  return sub_112A4(0x756C62207976616ELL);
}

uint64_t sub_B880()
{
  return sub_112EC(0x63206E6F656ELL);
}

uint64_t sub_B8A0()
{
  return sub_11378(0x637566206E6F656ELL, 1634300776LL);
}

uint64_t sub_B8BC()
{
  return 0x657267206E6F656ELL;
}

uint64_t sub_B8C8(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_B8D8()
{
  return 0x6F62206E6165636FLL;
}

void sub_B900()
{
}

void sub_B90C()
{
}

uint64_t sub_B91C()
{
  return 0x646C6F6720646C6FLL;
}

uint64_t sub_B930()
{
  return 0x6563616C20646C6FLL;
}

uint64_t sub_B944()
{
  return sub_11378(0x6576616C20646C6FLL, 1919247470LL);
}

uint64_t sub_B960()
{
  return sub_112A4(0x7675616D20646C6FLL);
}

uint64_t sub_B9A0()
{
  return 0x7264206576696C6FLL;
}

uint64_t sub_B9EC()
{
  return sub_113B0(2021224047LL);
}

uint64_t sub_B9F8()
{
  return 0x616D20617265706FLL;
}

uint64_t sub_BA1C()
{
  return sub_113B8(0x65676E61726FLL);
}

uint64_t sub_BA4C()
{
  return 0x702065676E61726FLL;
}

uint64_t sub_BA70()
{
  return sub_11308(0x65676E61726FLL);
}

void sub_BA9C()
{
}

uint64_t sub_BAAC()
{
  return 0x707320726574756FLL;
}

uint64_t sub_BAD0(uint64_t a1)
{
  return a1 + 1;
}

void sub_BAE0()
{
}

uint64_t sub_BAF0()
{
  return sub_11378(0x2063696669636170LL, 1702194274LL);
}

uint64_t sub_BB0C()
{
  return 0x75716120656C6170LL;
}

void sub_BB40()
{
}

uint64_t sub_BB64()
{
  return sub_11378(0x72616320656C6170LL, 1701734765LL);
}

void sub_BB80()
{
}

void sub_BBA0()
{
}

uint64_t sub_BBC0()
{
  return 0x706F6320656C6170LL;
}

uint64_t sub_BBE4(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_BBF4()
{
  return sub_1132C(0x656C6170u);
}

void sub_BC0C()
{
}

uint64_t sub_BC2C()
{
  return 0x65726720656C6170LL;
}

uint64_t sub_BC38()
{
  return sub_113A8(0x76616C20656C6170LL, 0x7265646E65LL);
}

uint64_t sub_BC58()
{
  return sub_11378(0x67616D20656C6170LL, 1635020389LL);
}

uint64_t sub_BC74()
{
  return sub_11340(0x7020656C6170LL);
}

uint64_t sub_BC90()
{
  return 0x756C7020656C6170LL;
}

void sub_BCB0()
{
}

uint64_t sub_BCC4(uint64_t a1)
{
  return a1 + 3;
}

void sub_BCD4()
{
}

uint64_t sub_BCFC()
{
  return sub_11390(0x656C6170u);
}

void sub_BD14()
{
}

uint64_t sub_BD30()
{
  return sub_11338(0x7720617961706170LL, 7367016LL);
}

void sub_BD4C()
{
}

void sub_BD64()
{
}

uint64_t sub_BD74()
{
  return sub_11378(0x62206C6574736170LL, 1853321074LL);
}

uint64_t sub_BD84()
{
  return sub_11338(0x67206C6574736170LL, 7954802LL);
}

void sub_BDA0()
{
}

void sub_BDB0()
{
}

void sub_BDD0()
{
}

uint64_t sub_BDE0()
{
  return sub_11338(0x70206C6574736170LL, 7040617LL);
}

void sub_BDF0()
{
}

uint64_t sub_BE0C()
{
  return sub_11308(0x6C6574736170LL);
}

uint64_t sub_BE28()
{
  return sub_113A8(0x76206C6574736170LL, 0x74656C6F69LL);
}

uint64_t sub_BE48()
{
  return sub_113A8(0x79206C6574736170LL, 0x776F6C6C65LL);
}

uint64_t sub_BE68()
{
  return 0x726720656E796170LL;
}

uint64_t sub_BE88()
{
  return 0x6863616570LL;
}

uint64_t sub_BE98()
{
  return 0x7570206863616570LL;
}

uint64_t sub_BEB8()
{
  return sub_11378(0x6579206863616570LL, 2003790956LL);
}

uint64_t sub_BED4()
{
  return sub_113B0(1918985584LL);
}

uint64_t sub_BEE0()
{
  return 0x6C72616570LL;
}

uint64_t sub_BEF0()
{
  return 0x7161206C72616570LL;
}

void sub_BF10()
{
}

uint64_t sub_BF20()
{
  return 0x6B6E697769726570LL;
}

void sub_BF40()
{
}

uint64_t sub_C00C()
{
  return sub_113A8(0x206F6C6168746870LL, 0x6E65657267LL);
}

uint64_t sub_C02C()
{
  return sub_11324(0x207967676970LL);
}

uint64_t sub_C044()
{
  return 0x65726720656E6970LL;
}

uint64_t sub_C050()
{
  return sub_113B0(1802398064LL);
}

uint64_t sub_C05C()
{
  return sub_113A8(0x616C66206B6E6970LL, 0x6F676E696DLL);
}

uint64_t sub_C07C()
{
  return sub_11378(0x656873206B6E6970LL, 1952801394LL);
}

uint64_t sub_C098()
{
  return sub_11364(0x6B6E6970u);
}

uint64_t sub_C0B0()
{
  return 0x6968636174736970LL;
}

uint64_t sub_C0D4()
{
  return 0x6D756E6974616C70LL;
}

uint64_t sub_C0E8()
{
  return sub_113B0(1836412016LL);
}

uint64_t sub_C0F4()
{
  return 0x646E616C74726F70LL;
}

  ;
}

void sub_C138()
{
}

uint64_t sub_C154(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_C164()
{
  return sub_113B0(1701016944LL);
}

uint64_t sub_C170()
{
  return sub_11380(0x6E696B706D7570LL);
}

void sub_C180()
{
}

uint64_t sub_C190()
{
  return sub_11378(0x6820656C70727570LL, 1953653093LL);
}

uint64_t sub_C1AC(uint64_t a1)
{
  return a1 + 9;
}

uint64_t sub_C1BC(uint64_t a1)
{
  return a1 + 7;
}

void sub_C1CC()
{
}

uint64_t sub_C1EC()
{
  return sub_11378(0x7420656C70727570LL, 1701868897LL);
}

uint64_t sub_C224()
{
  return 0x7272656270736172LL;
}

uint64_t sub_C28C()
{
  return 0x6E65697320776172LL;
}

uint64_t sub_C2AC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_C2BC()
{
  return 0x6174616D7A7A6172LL;
}

uint64_t sub_C2DC()
{
  return 6579570LL;
}

uint64_t sub_C2EC()
{
  return 0x6E61726F20646572LL;
}

uint64_t sub_C30C()
{
  return 0x776F726220646572LL;
}

uint64_t sub_C32C()
{
  return 0x6C6F697620646572LL;
}

uint64_t sub_C34C()
{
  return sub_11298(0x68636972u);
}

uint64_t sub_C364()
{
  return sub_11378(0x7261632068636972LL, 1701734765LL);
}

uint64_t sub_C380(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_C390()
{
  return 0x6C696C2068636972LL;
}

uint64_t sub_C3B0()
{
  return sub_112EC(0x6D2068636972LL);
}

  ;
}

uint64_t sub_C3E0()
{
  return sub_113B0(1702063986LL);
}

uint64_t sub_C3EC()
{
  return 0x6E6F622065736F72LL;
}

uint64_t sub_C410()
{
  return 0x6F62652065736F72LL;
}

uint64_t sub_C430()
{
  return 0x64616D2065736F72LL;
}

uint64_t sub_C454()
{
  return sub_11340(0x702065736F72LL);
}

uint64_t sub_C470()
{
  return sub_11338(0x6175712065736F72LL, 8025202LL);
}

void sub_C48C()
{
}

uint64_t sub_C4A4()
{
  return sub_112A4(0x6C61762065736F72LL);
}

uint64_t sub_C4B8()
{
  return 0x646F6F7765736F72LL;
}

uint64_t sub_C4CC()
{
  return 0x6F63206F73736F72LL;
}

uint64_t sub_C4EC()
{
  return 0x6F72622079736F72LL;
}

uint64_t sub_C508()
{
  return 0x7A61206C61796F72LL;
}

uint64_t sub_C52C()
{
  return sub_11370(0x206C61796F72LL);
}

uint64_t sub_C544()
{
  return sub_113A8(0x7566206C61796F72LL, 0x6169736863LL);
}

uint64_t sub_C564()
{
  return sub_11378(0x7570206C61796F72LL, 1701605490LL);
}

uint64_t sub_C580()
{
  return sub_113B0(2036495730LL);
}

void sub_C58C()
{
}

void sub_C598()
{
}

uint64_t sub_C5B4()
{
  return sub_113B8(0x73756F667572LL);
}

uint64_t sub_C5C4()
{
  return sub_113B8(0x746573737572LL);
}

uint64_t sub_C5D0()
{
  return sub_113B0(1953723762LL);
}

uint64_t sub_C5DC(uint64_t a1)
{
  return a1 + 6;
}

void sub_C608()
{
}

uint64_t sub_C62C(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_C63C()
{
  return sub_113B8(0x6E6F6D6C6173LL);
}

uint64_t sub_C668()
{
  return sub_113B0(1684955507LL);
}

uint64_t sub_C674()
{
  return sub_112A4(0x6E756420646E6173LL);
}

uint64_t sub_C688()
{
  return sub_11348(0x7473646E6173LL);
}

void sub_C6C0()
{
}

uint64_t sub_C6DC()
{
  return sub_1139C(0x20706173u);
}

uint64_t sub_C6F4()
{
  return 0x6572696870706173LL;
}

  ;
}

uint64_t sub_C728(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_C738()
{
  return sub_1135C(0x6E696D6165726373LL, 0x6E6565726720LL);
}

uint64_t sub_C74C()
{
  return 0x65756C6220616573LL;
}

uint64_t sub_C758()
{
  return sub_1139C(543253875LL, 0xE90000000000006ELL);
}

void sub_C770()
{
}

uint64_t sub_C794()
{
  return 0x6C6C656873616573LL;
}

  ;
}

uint64_t sub_C7B4()
{
  return 0x6169706573LL;
}

uint64_t sub_C7C4()
{
  return sub_113B8(0x776F64616873LL);
}

uint64_t sub_C7D4()
{
  return 0x6B636F726D616873LL;
}

uint64_t sub_C808()
{
  return sub_113A8(0x676E696B636F6873LL, 0x6B6E697020LL);
}

uint64_t sub_C828()
{
  return sub_113B8(0x616E6E656973LL);
}

uint64_t sub_C838()
{
  return sub_113B8(0x7265766C6973LL);
}

uint64_t sub_C848()
{
  return 0x666F6C65626F6B73LL;
}

uint64_t sub_C87C()
{
  return sub_11338(0x6567616D20796B73LL, 6386798LL);
}

uint64_t sub_C898()
{
  return sub_11370(0x206574616C73LL, 0xEA00000000006575LL);
}

void sub_C8B4()
{
}

uint64_t sub_C8C0()
{
  return 0x746C616D73LL;
}

uint64_t sub_C8D0()
{
  return 0x742079656B6F6D73LL;
}

uint64_t sub_C8F4()
{
  return sub_11370(0x20796B6F6D73LL, 0xEB000000006B6361LL);
}

uint64_t sub_C914()
{
  return sub_113B0(2003791475LL);
}

  ;
}

void sub_C948()
{
}

uint64_t sub_C964(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_C974()
{
  return sub_113B8(0x617A7A697473LL);
}

uint64_t sub_C984()
{
  return 0x6F6C636D726F7473LL;
}

uint64_t sub_C9A4()
{
  return 0x7761727473LL;
}

uint64_t sub_C9B4()
{
  return sub_11380(0x776F6C676E7573LL);
}

uint64_t sub_C9C8()
{
  return 0x746867696C6E7573LL;
}

void sub_C9DC()
{
}

uint64_t sub_CA08()
{
  return 7233908LL;
}

uint64_t sub_CA18()
{
  return sub_11380(0x6F6C65676E6174LL);
}

uint64_t sub_CA2C()
{
  return sub_112A4(0x6E697265676E6174LL);
}

  ;
}

uint64_t sub_CA4C()
{
  return 0x6570756174LL;
}

uint64_t sub_CA74()
{
  return 0x796E776174LL;
}

uint64_t sub_CA84()
{
  return 0x6565726720616574LL;
}

uint64_t sub_CAA8()
{
  return 0x65736F7220616574LL;
}

void sub_CAF8()
{
}

uint64_t sub_CB1C()
{
  return sub_11380(0x656C7473696874LL);
}

void sub_CB2C()
{
}

uint64_t sub_CB48()
{
  return sub_11378(0x20796E6166666974LL, 1702194274LL);
}

void sub_CB64()
{
}

uint64_t sub_CB78()
{
  return 0x6F777265626D6974LL;
}

uint64_t sub_CB98()
{
  return 0x6D75696E61746974LL;
}

uint64_t sub_CBAC()
{
  return sub_113B8(0x6F74616D6F74LL);
}

uint64_t sub_CBBC()
{
  return 0x7A61706F74LL;
}

void sub_CBCC()
{
}

uint64_t sub_CBE0()
{
  return sub_11378(0x2079656C6C6F7274LL, 2036691559LL);
}

uint64_t sub_CBFC(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_CC0C()
{
  return sub_112A4(0x756C622065757274LL);
}

void sub_CC18()
{
}

uint64_t sub_CC34()
{
  return 0x6577656C626D7574LL;
}

uint64_t sub_CC54()
{
  return sub_11378(0x206873696B727574LL, 1702063986LL);
}

uint64_t sub_CC70()
{
  return sub_112A4(0x73696F7571727574LL);
}

void sub_CC84()
{
}

uint64_t sub_CCA4()
{
  return 0x73696F7571727574LL;
}

uint64_t sub_CCCC()
{
  return sub_11308(0x6E6163737574LL);
}

uint64_t sub_CCE8(uint64_t a1)
{
  return a1 + 1;
}

void sub_CCF8()
{
}

uint64_t sub_CD28()
{
  return sub_113B8(0x646572206175LL);
}

uint64_t sub_CD4C()
{
  return sub_1132C(0x616C6375u);
}

void sub_CD64()
{
}

uint64_t sub_CD7C()
{
  return 0x7365726F66207075LL;
}

uint64_t sub_CDA4()
{
  return 0x6F6F72616D207075LL;
}

uint64_t sub_CDC4()
{
  return sub_11378(0x6472616320637375LL, 1818324585LL);
}

uint64_t sub_CDE0()
{
  return 0x646C6F6720637375LL;
}

uint64_t sub_CDF4()
{
  return 6644341LL;
}

void sub_CE04()
{
}

uint64_t sub_CE20()
{
  return sub_112EC(0x6D6172746C75LL);
}

  ;
}

uint64_t sub_CE4C()
{
  return 0x7265626D75LL;
}

uint64_t sub_CE64(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_CE74(uint64_t a1)
{
  return a1 + 13;
}

uint64_t sub_CED8()
{
  return 0x6F67207361676576LL;
}

uint64_t sub_CEF8()
{
  return sub_11378(0x6E616974656E6576LL, 1684369952LL);
}

uint64_t sub_CF14()
{
  return 0x6972676964726576LL;
}

uint64_t sub_CF34()
{
  return 0x6F696C696D726576LL;
}

uint64_t sub_CF54()
{
  return 0x6163696E6F726576LL;
}

void sub_CF78()
{
}

void sub_CF94()
{
}

uint64_t sub_CFB0()
{
  return 0x6E61696469726976LL;
}

uint64_t sub_CFC4()
{
  return sub_11378(0x7561206469766976LL, 1852994914LL);
}

void sub_CFE0()
{
}

uint64_t sub_D000()
{
  return 0x6563206469766976LL;
}

void sub_D024()
{
}

uint64_t sub_D048()
{
  return 0x6976206469766976LL;
}

uint64_t sub_D06C()
{
  return sub_11298(0x6D726177u);
}

uint64_t sub_D084()
{
  return 0x6F70737265746177LL;
}

uint64_t sub_D0A4()
{
  return 0x65676E6577LL;
}

uint64_t sub_D0D4()
{
  return 0x6D73206574696877LL;
}

uint64_t sub_D0F8()
{
  return 0x72747320646C6977LL;
}

void sub_D11C()
{
}

  ;
}

void sub_D148()
{
}

uint64_t sub_D16C()
{
  return sub_113B8(0x7564616E6178LL);
}

void sub_D17C()
{
}

uint64_t sub_D198()
{
  return sub_113B8(0x776F6C6C6579LL);
}

void sub_D1AC()
{
}

void sub_D1CC()
{
}

void sub_D1F8()
{
}

uint64_t static HueSemantic.< infix(_:_:)(unsigned __int16 a1, unsigned __int16 a2)
{
  uint64_t v3 = HueSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  uint64_t v6 = HueSemantic.rawValue.getter(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 0;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 1LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

HomeAutomationSiriSuggestions::HueSemantic_optional __swiftcall HueSemantic.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  uint64_t string = rawValue._countAndFlagsBits;
  uint64_t v2 = sub_4D88(&qword_490D0);
  uint64_t v3 = swift_allocObject(v2, 17048LL, 7LL);
  uint64_t v10 = sub_676C(v3, 709LL);
  *(void *)uint64_t v4 = "greenish";
  *(void *)(v4 + 8) = 8LL;
  *(_BYTE *)(v4 + 16) = 2;
  *(void *)(v4 + 24) = "candle";
  *(void *)(v4 + 32) = 6LL;
  *(_BYTE *)(v4 + 40) = 2;
  *(void *)(v4 + 48) = "40w tungsten";
  *(void *)(v4 + 56) = 12LL;
  *(_BYTE *)(v4 + 64) = 2;
  *(void *)(v4 + 72) = "100w tungsten";
  *(void *)(v4 + 80) = 13LL;
  *(_BYTE *)(v4 + 88) = 2;
  *(void *)(v4 + 96) = "halogen";
  *(void *)(v4 + 104) = 7LL;
  *(_BYTE *)(v4 + 112) = 2;
  *(void *)(v4 + 120) = "carbon arc";
  *(void *)(v4 + 128) = 10LL;
  *(_BYTE *)(v4 + 136) = 2;
  *(void *)(v4 + 144) = "high noon sun";
  *(void *)(v4 + 152) = 13LL;
  *(_BYTE *)(v4 + 160) = 2;
  *(void *)(v4 + 168) = "overcast sky";
  *(void *)(v4 + 176) = 12LL;
  *(_BYTE *)(v4 + 184) = 2;
  *(void *)(v4 + 192) = "clear blue sky";
  *(void *)(v4 + 200) = 14LL;
  *(_BYTE *)(v4 + 208) = 2;
  *(void *)(v4 + 216) = "warm fluorescent";
  *(void *)(v4 + 224) = 16LL;
  *(_BYTE *)(v4 + 232) = 2;
  *(void *)(v4 + 240) = "standard fluorescent";
  *(void *)(v4 + 248) = 20LL;
  *(_BYTE *)(v4 + 256) = 2;
  *(void *)(v4 + 264) = "cool white fluorescent";
  *(void *)(v4 + 272) = 22LL;
  *(_BYTE *)(v4 + 280) = 2;
  *(void *)(v4 + 288) = "full spectrum fluorescent";
  *(void *)(v4 + 296) = 25LL;
  *(_BYTE *)(v4 + 304) = 2;
  *(void *)(v4 + 312) = "black light fluorescent";
  *(void *)(v4 + 320) = 23LL;
  *(_BYTE *)(v4 + 328) = 2;
  *(void *)(v4 + 336) = "mercury vapor";
  *(void *)(v4 + 344) = 13LL;
  *(_BYTE *)(v4 + 352) = 2;
  *(void *)(v4 + 360) = "sodium vapor";
  *(void *)(v4 + 368) = 12LL;
  *(_BYTE *)(v4 + 376) = 2;
  *(void *)(v4 + 384) = "metal halide";
  *(void *)(v4 + 392) = 12LL;
  *(_BYTE *)(v4 + 400) = 2;
  *(void *)(v4 + 408) = "high pressure sodium";
  *(void *)(v4 + 416) = 20LL;
  *(_BYTE *)(v4 + 424) = 2;
  *(void *)(v4 + 432) = "air force blue";
  *(void *)(v4 + 440) = 14LL;
  *(_BYTE *)(v4 + 448) = 2;
  *(void *)(v4 + 456) = "alice blue";
  *(void *)(v4 + 464) = 10LL;
  *(_BYTE *)(v4 + 472) = 2;
  *(void *)(v4 + 480) = "alizarin crimson";
  *(void *)(v4 + 488) = 16LL;
  *(_BYTE *)(v4 + 496) = 2;
  *(void *)(v4 + 504) = "almond";
  *(void *)(v4 + 512) = 6LL;
  *(_BYTE *)(v4 + 520) = 2;
  *(void *)(v4 + 528) = "amaranth";
  *(void *)(v4 + 536) = 8LL;
  *(_BYTE *)(v4 + 544) = 2;
  *(void *)(v4 + 552) = "amber";
  *(void *)(v4 + 560) = 5LL;
  *(_BYTE *)(v4 + 568) = 2;
  *(void *)(v4 + 576) = "american rose";
  *(void *)(v4 + 584) = 13LL;
  *(_BYTE *)(v4 + 592) = 2;
  *(void *)(v4 + 600) = "amethyst";
  *(void *)(v4 + 608) = 8LL;
  *(_BYTE *)(v4 + 616) = 2;
  *(void *)(v4 + 624) = "antique brass";
  *(void *)(v4 + 632) = 13LL;
  *(_BYTE *)(v4 + 640) = 2;
  *(void *)(v4 + 648) = "antique fuchsia";
  *(void *)(v4 + 656) = 15LL;
  *(_BYTE *)(v4 + 664) = 2;
  *(void *)(v4 + 672) = "antique white";
  *(void *)(v4 + 680) = 13LL;
  *(_BYTE *)(v4 + 688) = 2;
  *(void *)(v4 + 696) = "apricot";
  *(void *)(v4 + 704) = 7LL;
  *(_BYTE *)(v4 + 712) = 2;
  *(void *)(v4 + 720) = "aqua";
  *(void *)(v4 + 728) = 4LL;
  *(_BYTE *)(v4 + 736) = 2;
  *(void *)(v4 + 744) = "aquamarine";
  *(void *)(v4 + 752) = 10LL;
  *(_BYTE *)(v4 + 760) = 2;
  *(void *)(v4 + 768) = "army green";
  *(void *)(v4 + 776) = 10LL;
  *(_BYTE *)(v4 + 784) = 2;
  *(void *)(v4 + 792) = "arylide yellow";
  *(void *)(v4 + 800) = 14LL;
  *(_BYTE *)(v4 + 808) = 2;
  *(void *)(v4 + 816) = "ash grey";
  *(void *)(v4 + 824) = 8LL;
  *(_BYTE *)(v4 + 832) = 2;
  *(void *)(v4 + 840) = "asparagus";
  *(void *)(v4 + 848) = 9LL;
  *(_BYTE *)(v4 + 856) = 2;
  *(void *)(v4 + 864) = "atomic tangerine";
  *(void *)(v4 + 872) = 16LL;
  *(_BYTE *)(v4 + 880) = 2;
  *(void *)(v4 + 888) = "auburn";
  *(void *)(v4 + 896) = 6LL;
  *(_BYTE *)(v4 + 904) = 2;
  *(void *)(v4 + 912) = "aureolin";
  *(void *)(v4 + 920) = 8LL;
  *(_BYTE *)(v4 + 928) = 2;
  *(void *)(v4 + 936) = "aurometalsaurus";
  *(void *)(v4 + 944) = 15LL;
  *(_BYTE *)(v4 + 952) = 2;
  *(void *)(v4 + 960) = "azure";
  *(void *)(v4 + 968) = 5LL;
  *(_BYTE *)(v4 + 976) = 2;
  *(void *)(v4 + 984) = "baby blue";
  *(void *)(v4 + 992) = 9LL;
  *(_BYTE *)(v4 + 1000) = 2;
  *(void *)(v4 + 1008) = "baby pink";
  *(void *)(v4 + 1016) = 9LL;
  *(_BYTE *)(v4 + 1024) = 2;
  *(void *)(v4 + 1032) = "banana mania";
  *(void *)(v4 + 1040) = 12LL;
  *(_BYTE *)(v4 + 1048) = 2;
  *(void *)(v4 + 1056) = "banana yellow";
  *(void *)(v4 + 1064) = 13LL;
  *(_BYTE *)(v4 + 1072) = 2;
  *(void *)(v4 + 1080) = "battleship grey";
  *(void *)(v4 + 1088) = 15LL;
  *(_BYTE *)(v4 + 1096) = 2;
  *(void *)(v4 + 1104) = "beau blue";
  *(void *)(v4 + 1112) = 9LL;
  *(_BYTE *)(v4 + 1120) = 2;
  *(void *)(v4 + 1128) = "beige";
  *(void *)(v4 + 1136) = 5LL;
  *(_BYTE *)(v4 + 1144) = 2;
  *(void *)(v4 + 1152) = "bisque";
  *(void *)(v4 + 1160) = 6LL;
  *(_BYTE *)(v4 + 1168) = 2;
  *(void *)(v4 + 1176) = "bistre";
  *(void *)(v4 + 1184) = 6LL;
  *(_BYTE *)(v4 + 1192) = 2;
  *(void *)(v4 + 1200) = "bittersweet";
  *(void *)(v4 + 1208) = 11LL;
  *(_BYTE *)(v4 + 1216) = 2;
  *(void *)(v4 + 1224) = "black";
  *(void *)(v4 + 1232) = 5LL;
  *(_BYTE *)(v4 + 1240) = 2;
  *(void *)(v4 + 1248) = "blanched almond";
  *(void *)(v4 + 1256) = 15LL;
  *(_BYTE *)(v4 + 1264) = 2;
  *(void *)(v4 + 1272) = "bleu de france";
  *(void *)(v4 + 1280) = 14LL;
  *(_BYTE *)(v4 + 1288) = 2;
  *(void *)(v4 + 1296) = "blond";
  *(void *)(v4 + 1304) = 5LL;
  *(_BYTE *)(v4 + 1312) = 2;
  *(void *)(v4 + 1320) = "blue";
  *(void *)(v4 + 1328) = 4LL;
  *(_BYTE *)(v4 + 1336) = 2;
  *(void *)(v4 + 1344) = "blue gray";
  *(void *)(v4 + 1352) = 9LL;
  *(_BYTE *)(v4 + 1360) = 2;
  *(void *)(v4 + 1368) = "blue green";
  *(void *)(v4 + 1376) = 10LL;
  *(_BYTE *)(v4 + 1384) = 2;
  *(void *)(v4 + 1392) = "blue purple";
  *(void *)(v4 + 1400) = 11LL;
  *(_BYTE *)(v4 + 1408) = 2;
  *(void *)(v4 + 1416) = "blue violet";
  *(void *)(v4 + 1424) = 11LL;
  *(_BYTE *)(v4 + 1432) = 2;
  *(void *)(v4 + 1440) = "blush";
  *(void *)(v4 + 1448) = 5LL;
  *(_BYTE *)(v4 + 1456) = 2;
  *(void *)(v4 + 1464) = "bondi blue";
  *(void *)(v4 + 1472) = 10LL;
  *(_BYTE *)(v4 + 1480) = 2;
  *(void *)(v4 + 1488) = "bone";
  *(void *)(v4 + 1496) = 4LL;
  *(_BYTE *)(v4 + 1504) = 2;
  *(void *)(v4 + 1512) = "boston university red";
  *(void *)(v4 + 1520) = 21LL;
  *(_BYTE *)(v4 + 1528) = 2;
  *(void *)(v4 + 1536) = "bottle green";
  *(void *)(v4 + 1544) = 12LL;
  *(_BYTE *)(v4 + 1552) = 2;
  *(void *)(v4 + 1560) = "boysenberry";
  *(void *)(v4 + 1568) = 11LL;
  *(_BYTE *)(v4 + 1576) = 2;
  *(void *)(v4 + 1584) = "brandeis blue";
  *(void *)(v4 + 1592) = 13LL;
  *(_BYTE *)(v4 + 1600) = 2;
  *(void *)(v4 + 1608) = "brass";
  *(void *)(v4 + 1616) = 5LL;
  *(_BYTE *)(v4 + 1624) = 2;
  *(void *)(v4 + 1632) = "brick red";
  *(void *)(v4 + 1640) = 9LL;
  *(_BYTE *)(v4 + 1648) = 2;
  *(void *)(v4 + 1656) = "begonia";
  *(void *)(v4 + 1664) = 7LL;
  *(_BYTE *)(v4 + 1672) = 2;
  *(void *)(v4 + 1680) = "bright red";
  *(void *)(v4 + 1688) = 10LL;
  *(_BYTE *)(v4 + 1696) = 2;
  *(void *)(v4 + 1704) = "bright white";
  *(void *)(v4 + 1712) = 12LL;
  *(_BYTE *)(v4 + 1720) = 2;
  *(void *)(v4 + 1728) = "bright yellow";
  *(void *)(v4 + 1736) = 13LL;
  *(_BYTE *)(v4 + 1744) = 2;
  *(void *)(v4 + 1752) = "bright blue";
  *(void *)(v4 + 1760) = 11LL;
  *(void *)(v4 + 1776) = "bright cerulean";
  *(void *)(v4 + 1800) = "bright green";
  *(void *)(v4 + 1824) = "bright lavender";
  *(void *)(v4 + 1848) = "bright maroon";
  *(void *)(v4 + 1872) = "bright pink";
  *(void *)(v4 + 1896) = "bright turquoise";
  *(void *)(v4 + 1920) = "brilliant lavender";
  *(void *)(v4 + 1944) = "brilliant rose";
  *(void *)(v4 + 1968) = "british racing green";
  *(void *)(v4 + 2640) = "candy pink";
  *(void *)(v4 + 2736) = "caribbean green";
  *(void *)(v4 + 2832) = "carnation pink";
  *(void *)(v4 + 2928) = "celadon";
  *(void *)(v4 + 3024) = "cerise pink";
  *(void *)(v4 + 3120) = "champagne";
  *(void *)(v4 + 3360) = "cinnamon";
  *(void *)(v4 + 3456) = "cocoa brown";
  *(void *)(v4 + 3552) = "cool grey";
  *(void *)(v4 + 3648) = "coral";
  *(void *)(v4 + 3744) = "corn";
  *(void *)(v4 + 3840) = "cornsilk";
  *(void *)(v4 + 3936) = "crimson";
  *(void *)(v4 + 4032) = "daffodil";
  *(void *)(v4 + 4128) = "dark byzantium";
  *(_BYTE *)(v4 + 1768) = 2;
  *(void *)(v4 + 4440) = "dark lavender";
  *(void *)(v4 + 4424) = 9LL;
  *(_BYTE *)(v4 + 4432) = 2;
  *(void *)(v4 + 4224) = "dark coral";
  *(void *)(v4 + 4400) = 10LL;
  *(_BYTE *)(v4 + 4408) = 2;
  *(void *)(v4 + 4416) = "dark lava";
  *(void *)(v4 + 4392) = "dark khaki";
  *(void *)(v4 + 4376) = 17LL;
  *(_BYTE *)(v4 + 4384) = 2;
  *(void *)(v4 + 4344) = "dark green";
  *(void *)(v4 + 4352) = 10LL;
  *(_BYTE *)(v4 + 4360) = 2;
  *(void *)(v4 + 4368) = "dark jungle green";
  *(_BYTE *)(v4 + 4312) = 2;
  *(void *)(v4 + 4320) = "dark gray";
  *(void *)(v4 + 4328) = 9LL;
  *(_BYTE *)(v4 + 4336) = 2;
  *(void *)(v4 + 4296) = "dark goldenrod";
  *(_BYTE *)(v4 + 4288) = 2;
  *(void *)(v4 + 4304) = 14LL;
  *(void *)(v4 + 4272) = "dark electric blue";
  *(void *)(v4 + 4256) = 9LL;
  *(_BYTE *)(v4 + 4264) = 2;
  *(void *)(v4 + 4280) = 18LL;
  *(void *)(v4 + 1784) = 15LL;
  *(void *)(v4 + 4248) = "dark cyan";
  *(void *)(v4 + 4232) = 10LL;
  *(_BYTE *)(v4 + 4240) = 2;
  *(void *)(v4 + 4200) = "dark chestnut";
  *(_BYTE *)(v4 + 4192) = 2;
  *(void *)(v4 + 4208) = 13LL;
  *(_BYTE *)(v4 + 4216) = 2;
  *(void *)(v4 + 4176) = "dark cerulean";
  *(void *)(v4 + 4160) = 20LL;
  *(_BYTE *)(v4 + 4168) = 2;
  *(void *)(v4 + 4184) = 13LL;
  *(_BYTE *)(v4 + 1792) = 2;
  *(void *)(v4 + 4152) = "dark candy apple red";
  *(void *)(v4 + 4136) = 14LL;
  *(_BYTE *)(v4 + 4144) = 2;
  *(void *)(v4 + 4104) = "dark brown";
  *(_BYTE *)(v4 + 4096) = 2;
  *(void *)(v4 + 4112) = 10LL;
  *(_BYTE *)(v4 + 4120) = 2;
  *(void *)(v4 + 4080) = "dark blue";
  *(void *)(v4 + 4064) = 9LL;
  *(_BYTE *)(v4 + 4072) = 2;
  *(void *)(v4 + 4088) = 9LL;
  *(void *)(v4 + 1808) = 12LL;
  *(void *)(v4 + 4056) = "dandelion";
  *(void *)(v4 + 4040) = 8LL;
  *(_BYTE *)(v4 + 4048) = 2;
  *(void *)(v4 + 4008) = "cyan";
  *(_BYTE *)(v4 + 4000) = 2;
  *(void *)(v4 + 4016) = 4LL;
  *(_BYTE *)(v4 + 4024) = 2;
  *(void *)(v4 + 3984) = "crimson glory";
  *(void *)(v4 + 3968) = 11LL;
  *(_BYTE *)(v4 + 3976) = 2;
  *(void *)(v4 + 3992) = 13LL;
  *(_BYTE *)(v4 + 1816) = 2;
  *(void *)(v4 + 3960) = "crimson red";
  *(void *)(v4 + 3944) = 7LL;
  *(_BYTE *)(v4 + 3952) = 2;
  *(void *)(v4 + 3912) = "cream";
  *(_BYTE *)(v4 + 3904) = 2;
  *(void *)(v4 + 3920) = 5LL;
  *(_BYTE *)(v4 + 3928) = 2;
  *(void *)(v4 + 3888) = "cotton candy";
  *(void *)(v4 + 3872) = 12LL;
  *(_BYTE *)(v4 + 3880) = 2;
  *(void *)(v4 + 3896) = 12LL;
  *(void *)(v4 + 1832) = 15LL;
  *(void *)(v4 + 3864) = "cosmic latte";
  *(void *)(v4 + 3848) = 8LL;
  *(_BYTE *)(v4 + 3856) = 2;
  *(void *)(v4 + 3816) = "cornflower blue";
  *(_BYTE *)(v4 + 3808) = 2;
  *(void *)(v4 + 3824) = 15LL;
  *(_BYTE *)(v4 + 3832) = 2;
  *(void *)(v4 + 3792) = "cornflower";
  *(void *)(v4 + 3776) = 11LL;
  *(_BYTE *)(v4 + 3784) = 2;
  *(void *)(v4 + 3800) = 10LL;
  *(_BYTE *)(v4 + 1840) = 2;
  *(void *)(v4 + 3768) = "cornell red";
  *(void *)(v4 + 3752) = 4LL;
  *(_BYTE *)(v4 + 3760) = 2;
  *(void *)(v4 + 3720) = "cordovan";
  *(_BYTE *)(v4 + 3712) = 2;
  *(void *)(v4 + 3728) = 8LL;
  *(_BYTE *)(v4 + 3736) = 2;
  *(void *)(v4 + 3696) = "coral red";
  *(void *)(v4 + 3680) = 10LL;
  *(_BYTE *)(v4 + 3688) = 2;
  *(void *)(v4 + 3704) = 9LL;
  *(void *)(v4 + 1856) = 13LL;
  *(void *)(v4 + 3672) = "coral pink";
  *(void *)(v4 + 3656) = 5LL;
  *(_BYTE *)(v4 + 3664) = 2;
  *(void *)(v4 + 3624) = "coquelicot";
  *(_BYTE *)(v4 + 3616) = 2;
  *(void *)(v4 + 3632) = 10LL;
  *(_BYTE *)(v4 + 3640) = 2;
  *(void *)(v4 + 3600) = "copper rose";
  *(void *)(v4 + 3584) = 6LL;
  *(_BYTE *)(v4 + 3592) = 2;
  *(void *)(v4 + 3608) = 11LL;
  *(_BYTE *)(v4 + 1864) = 2;
  *(void *)(v4 + 3576) = "copper";
  *(void *)(v4 + 3560) = 9LL;
  *(_BYTE *)(v4 + 3568) = 2;
  *(void *)(v4 + 3528) = "cool black";
  *(_BYTE *)(v4 + 3520) = 2;
  *(void *)(v4 + 3536) = 10LL;
  *(_BYTE *)(v4 + 3544) = 2;
  *(void *)(v4 + 3504) = "columbia blue";
  *(void *)(v4 + 3488) = 6LL;
  *(_BYTE *)(v4 + 3496) = 2;
  *(void *)(v4 + 3512) = 13LL;
  *(void *)(v4 + 1880) = 11LL;
  *(void *)(v4 + 3480) = "coffee";
  *(void *)(v4 + 3464) = 11LL;
  *(_BYTE *)(v4 + 3472) = 2;
  *(void *)(v4 + 3432) = "cobalt";
  *(_BYTE *)(v4 + 3424) = 2;
  *(void *)(v4 + 3440) = 6LL;
  *(_BYTE *)(v4 + 3448) = 2;
  *(void *)(v4 + 3408) = "classic rose";
  *(void *)(v4 + 3392) = 7LL;
  *(_BYTE *)(v4 + 3400) = 2;
  *(void *)(v4 + 3416) = 12LL;
  *(_BYTE *)(v4 + 1888) = 2;
  *(void *)(v4 + 3384) = "citrine";
  *(void *)(v4 + 3368) = 8LL;
  *(_BYTE *)(v4 + 3376) = 2;
  *(void *)(v4 + 3336) = "cinnabar";
  *(_BYTE *)(v4 + 3328) = 2;
  *(void *)(v4 + 3344) = 8LL;
  *(_BYTE *)(v4 + 3352) = 2;
  *(void *)(v4 + 3312) = "cinereous";
  *(void *)(v4 + 3296) = 13LL;
  *(_BYTE *)(v4 + 3304) = 2;
  *(void *)(v4 + 3320) = 9LL;
  *(void *)(v4 + 1904) = 16LL;
  *(void *)(v4 + 3288) = "chrome yellow";
  *(void *)(v4 + 3272) = 9LL;
  *(_BYTE *)(v4 + 3280) = 2;
  *(void *)(v4 + 3216) = "cherry blossom pink";
  *(void *)(v4 + 3248) = 8LL;
  *(_BYTE *)(v4 + 3256) = 2;
  *(void *)(v4 + 3264) = "chocolate";
  *(void *)(v4 + 3240) = "chestnut";
  *(void *)(v4 + 3224) = 19LL;
  *(_BYTE *)(v4 + 3232) = 2;
  *(void *)(v4 + 3192) = "cherry";
  *(_BYTE *)(v4 + 3184) = 2;
  *(void *)(v4 + 3200) = 6LL;
  *(_BYTE *)(v4 + 3208) = 2;
  *(void *)(v4 + 3168) = "chartreuse";
  *(void *)(v4 + 3152) = 8LL;
  *(_BYTE *)(v4 + 3160) = 2;
  *(void *)(v4 + 3176) = 10LL;
  *(_BYTE *)(v4 + 1912) = 2;
  *(void *)(v4 + 3144) = "charcoal";
  *(void *)(v4 + 3128) = 9LL;
  *(_BYTE *)(v4 + 3136) = 2;
  *(void *)(v4 + 3096) = "chamoisee";
  *(_BYTE *)(v4 + 3088) = 2;
  *(void *)(v4 + 3104) = 9LL;
  *(_BYTE *)(v4 + 3112) = 2;
  *(void *)(v4 + 3072) = "cerulean blue";
  *(void *)(v4 + 3056) = 8LL;
  *(_BYTE *)(v4 + 3064) = 2;
  *(void *)(v4 + 3080) = 13LL;
  *(void *)(v4 + 1928) = 18LL;
  *(void *)(v4 + 3048) = "cerulean";
  *(void *)(v4 + 3032) = 11LL;
  *(_BYTE *)(v4 + 3040) = 2;
  *(void *)(v4 + 3000) = "cerise";
  *(_BYTE *)(v4 + 2992) = 2;
  *(void *)(v4 + 3008) = 6LL;
  *(_BYTE *)(v4 + 3016) = 2;
  *(void *)(v4 + 2976) = "celestial blue";
  *(void *)(v4 + 2960) = 7LL;
  *(_BYTE *)(v4 + 2968) = 2;
  *(void *)(v4 + 2984) = 14LL;
  *(_BYTE *)(v4 + 1936) = 2;
  *(void *)(v4 + 2952) = "celeste";
  *(void *)(v4 + 2936) = 7LL;
  *(_BYTE *)(v4 + 2944) = 2;
  *(void *)(v4 + 2904) = "carrot orange";
  *(_BYTE *)(v4 + 2896) = 2;
  *(void *)(v4 + 2912) = 13LL;
  *(_BYTE *)(v4 + 2920) = 2;
  *(void *)(v4 + 2880) = "carolina blue";
  *(void *)(v4 + 2864) = 9LL;
  *(_BYTE *)(v4 + 2872) = 2;
  *(void *)(v4 + 2888) = 13LL;
  *(void *)(v4 + 1952) = 14LL;
  *(void *)(v4 + 2856) = "carnelian";
  *(void *)(v4 + 2840) = 14LL;
  *(_BYTE *)(v4 + 2848) = 2;
  *(void *)(v4 + 2808) = "carmine red";
  *(_BYTE *)(v4 + 2800) = 2;
  *(void *)(v4 + 2816) = 11LL;
  *(_BYTE *)(v4 + 2824) = 2;
  *(void *)(v4 + 2784) = "carmine pink";
  *(void *)(v4 + 2768) = 7LL;
  *(_BYTE *)(v4 + 2776) = 2;
  *(void *)(v4 + 2792) = 12LL;
  *(_BYTE *)(v4 + 1960) = 2;
  *(void *)(v4 + 2760) = "carmine";
  *(void *)(v4 + 2744) = 15LL;
  *(_BYTE *)(v4 + 2752) = 2;
  *(void *)(v4 + 2712) = "cardinal";
  *(_BYTE *)(v4 + 2704) = 2;
  *(void *)(v4 + 2720) = 8LL;
  *(_BYTE *)(v4 + 2728) = 2;
  *(void *)(v4 + 2688) = "caput mortuum";
  *(void *)(v4 + 2672) = 5LL;
  *(_BYTE *)(v4 + 2680) = 2;
  *(void *)(v4 + 2696) = 13LL;
  *(void *)(v4 + 1976) = 20LL;
  *(void *)(v4 + 2664) = "capri";
  *(void *)(v4 + 2648) = 10LL;
  *(_BYTE *)(v4 + 2656) = 2;
  *(void *)(v4 + 2616) = "candy apple red";
  *(_BYTE *)(v4 + 2608) = 2;
  *(void *)(v4 + 2624) = 15LL;
  *(_BYTE *)(v4 + 2632) = 2;
  *(void *)(v4 + 2592) = "canary yellow";
  *(void *)(v4 + 2576) = 6LL;
  *(_BYTE *)(v4 + 2584) = 2;
  *(void *)(v4 + 2600) = 13LL;
  *(_BYTE *)(v4 + 1984) = 2;
  *(void *)(v4 + 2568) = "canary";
  *(void *)(v4 + 2552) = 16LL;
  *(_BYTE *)(v4 + 2560) = 2;
  *(void *)(v4 + 2520) = "cambridge blue";
  *(void *)(v4 + 2528) = 14LL;
  *(_BYTE *)(v4 + 2536) = 2;
  *(void *)(v4 + 2544) = "camouflage green";
  *(_BYTE *)(v4 + 2488) = 2;
  *(void *)(v4 + 2496) = "cal poly pomona green";
  *(void *)(v4 + 2504) = 21LL;
  *(_BYTE *)(v4 + 2512) = 2;
  *(void *)(v4 + 1992) = "bronze";
  *(void *)(v4 + 2000) = 6LL;
  *(_BYTE *)(v4 + 2008) = 2;
  *(void *)(v4 + 2480) = 14LL;
  *(void *)(v4 + 2016) = "brown";
  *(void *)(v4 + 2024) = 5LL;
  *(_BYTE *)(v4 + 2032) = 2;
  *(void *)(v4 + 2040) = "bubble gum";
  *(void *)(v4 + 2048) = 10LL;
  *(_BYTE *)(v4 + 2056) = 2;
  *(void *)(v4 + 2064) = "buff";
  *(void *)(v4 + 2072) = 4LL;
  *(_BYTE *)(v4 + 2080) = 2;
  *(void *)(v4 + 2088) = "bulgarian rose";
  *(void *)(v4 + 2096) = 14LL;
  *(_BYTE *)(v4 + 2104) = 2;
  *(void *)(v4 + 2112) = "burgundy";
  *(void *)(v4 + 2120) = 8LL;
  *(_BYTE *)(v4 + 2128) = 2;
  *(void *)(v4 + 2136) = "burlywood";
  *(void *)(v4 + 2144) = 9LL;
  *(_BYTE *)(v4 + 2152) = 2;
  *(void *)(v4 + 2160) = "burnt orange";
  *(void *)(v4 + 2168) = 12LL;
  *(_BYTE *)(v4 + 2176) = 2;
  *(void *)(v4 + 2184) = "burnt sienna";
  *(void *)(v4 + 2192) = 12LL;
  *(_BYTE *)(v4 + 2200) = 2;
  *(void *)(v4 + 2208) = "burnt umber";
  *(void *)(v4 + 2216) = 11LL;
  *(_BYTE *)(v4 + 2224) = 2;
  *(void *)(v4 + 2232) = "byzantine";
  *(void *)(v4 + 2240) = 9LL;
  *(_BYTE *)(v4 + 2248) = 2;
  *(void *)(v4 + 2256) = "byzantium";
  *(void *)(v4 + 2264) = 9LL;
  *(_BYTE *)(v4 + 2272) = 2;
  *(void *)(v4 + 2280) = "cg blue";
  *(void *)(v4 + 2288) = 7LL;
  *(_BYTE *)(v4 + 2296) = 2;
  *(void *)(v4 + 2304) = "cg red";
  *(void *)(v4 + 2312) = 6LL;
  *(_BYTE *)(v4 + 2320) = 2;
  *(void *)(v4 + 2328) = "cadet";
  *(void *)(v4 + 2336) = 5LL;
  *(_BYTE *)(v4 + 2344) = 2;
  *(void *)(v4 + 2352) = "cadet blue";
  *(void *)(v4 + 2360) = 10LL;
  *(_BYTE *)(v4 + 2368) = 2;
  *(void *)(v4 + 2376) = "cadet grey";
  *(void *)(v4 + 2384) = 10LL;
  *(_BYTE *)(v4 + 2392) = 2;
  *(void *)(v4 + 2400) = "cadmium green";
  *(void *)(v4 + 2408) = 13LL;
  *(_BYTE *)(v4 + 2416) = 2;
  *(void *)(v4 + 2424) = "cadmium orange";
  *(void *)(v4 + 2432) = 14LL;
  *(_BYTE *)(v4 + 2440) = 2;
  *(void *)(v4 + 2448) = "cadmium red";
  *(void *)(v4 + 2456) = 11LL;
  *(_BYTE *)(v4 + 2464) = 2;
  *(void *)(v4 + 2472) = "cadmium yellow";
  *(void *)(v4 + 4448) = 13LL;
  *(_BYTE *)(v4 + 4456) = 2;
  *(void *)(v4 + 4464) = "dark magenta";
  *(void *)(v4 + 4472) = 12LL;
  *(_BYTE *)(v4 + 4480) = 2;
  *(void *)(v4 + 4488) = "dark midnight blue";
  *(void *)(v4 + 4496) = 18LL;
  *(_BYTE *)(v4 + 4504) = 2;
  *(void *)(v4 + 4512) = "dark olive green";
  *(void *)(v4 + 4520) = 16LL;
  *(_BYTE *)(v4 + 4528) = 2;
  *(void *)(v4 + 4536) = "dark orange";
  *(void *)(v4 + 4544) = 11LL;
  *(_BYTE *)(v4 + 4552) = 2;
  *(void *)(v4 + 4560) = "dark orchid";
  *(void *)(v4 + 4568) = 11LL;
  *(_BYTE *)(v4 + 4576) = 2;
  *(void *)(v4 + 4584) = "dark pastel blue";
  *(void *)(v4 + 4592) = 16LL;
  *(_BYTE *)(v4 + 4600) = 2;
  *(void *)(v4 + 4608) = "dark pastel green";
  *(void *)(v4 + 4616) = 17LL;
  *(_BYTE *)(v4 + 4624) = 2;
  *(void *)(v4 + 4632) = "dark pastel purple";
  *(void *)(v4 + 4640) = 18LL;
  *(_BYTE *)(v4 + 4648) = 2;
  *(void *)(v4 + 4656) = "dark pastel red";
  *(void *)(v4 + 4664) = 15LL;
  *(_BYTE *)(v4 + 4672) = 2;
  *(void *)(v4 + 4680) = "dark pink";
  *(void *)(v4 + 4688) = 9LL;
  *(_BYTE *)(v4 + 4696) = 2;
  *(void *)(v4 + 4704) = "dark powder blue";
  *(void *)(v4 + 4712) = 16LL;
  *(_BYTE *)(v4 + 4720) = 2;
  *(void *)(v4 + 4728) = "dark raspberry";
  *(void *)(v4 + 4736) = 14LL;
  *(_BYTE *)(v4 + 4744) = 2;
  *(void *)(v4 + 4752) = "dark red";
  *(void *)(v4 + 4760) = 8LL;
  *(_BYTE *)(v4 + 4768) = 2;
  *(void *)(v4 + 4776) = "dark salmon";
  *(void *)(v4 + 4784) = 11LL;
  *(_BYTE *)(v4 + 4792) = 2;
  *(void *)(v4 + 4800) = "dark scarlet";
  *(void *)(v4 + 4808) = 12LL;
  *(_BYTE *)(v4 + 4816) = 2;
  *(void *)(v4 + 4824) = "dark sea green";
  *(void *)(v4 + 4832) = 14LL;
  *(_BYTE *)(v4 + 4840) = 2;
  *(void *)(v4 + 4848) = "dark sienna";
  *(void *)(v4 + 4856) = 11LL;
  *(_BYTE *)(v4 + 4864) = 2;
  *(void *)(v4 + 4872) = "dark slate blue";
  *(void *)(v4 + 4880) = 15LL;
  *(_BYTE *)(v4 + 4888) = 2;
  *(void *)(v4 + 4896) = "dark slate gray";
  *(void *)(v4 + 4904) = 15LL;
  *(_BYTE *)(v4 + 4912) = 2;
  *(void *)(v4 + 4920) = "dark spring green";
  *(void *)(v4 + 4928) = 17LL;
  *(_BYTE *)(v4 + 4936) = 2;
  *(void *)(v4 + 4944) = "dark tan";
  *(void *)(v4 + 4952) = 8LL;
  *(_BYTE *)(v4 + 4960) = 2;
  *(void *)(v4 + 4968) = "dark tangerine";
  *(void *)(v4 + 4976) = 14LL;
  *(_BYTE *)(v4 + 4984) = 2;
  *(void *)(v4 + 4992) = "dark taupe";
  *(void *)(v4 + 5000) = 10LL;
  *(_BYTE *)(v4 + 5008) = 2;
  *(void *)(v4 + 5016) = "dark terra cotta";
  *(void *)(v4 + 5040) = "dark turquoise";
  *(void *)(v4 + 5064) = "dark violet";
  *(void *)(v4 + 5088) = "dark yellow";
  *(void *)(v4 + 5112) = "dartmouth green";
  *(void *)(v4 + 5136) = "davy grey";
  *(void *)(v4 + 5160) = "deep carmine";
  *(void *)(v4 + 5184) = "deep carmine pink";
  *(void *)(v4 + 5208) = "deep carrot orange";
  *(void *)(v4 + 5232) = "deep cerise";
  *(void *)(v4 + 5256) = "deep champagne";
  *(void *)(v4 + 5280) = "deep chestnut";
  *(void *)(v4 + 5304) = "deep coffee";
  *(void *)(v4 + 5328) = "deep fuchsia";
  *(void *)(v4 + 5352) = "deep jungle green";
  *(void *)(v4 + 5376) = "deep lilac";
  *(void *)(v4 + 5400) = "deep magenta";
  *(void *)(v4 + 5424) = "deep peach";
  *(void *)(v4 + 5448) = "deep pink";
  *(void *)(v4 + 5472) = "deep saffron";
  *(void *)(v4 + 5496) = "deep sky blue";
  *(void *)(v4 + 5520) = "denim";
  *(void *)(v4 + 5544) = "desert";
  *(void *)(v4 + 5568) = "desert sand";
  *(void *)(v4 + 5592) = "dim gray";
  *(void *)(v4 + 5616) = "dodger blue";
  *(void *)(v4 + 5640) = "dogwood rose";
  *(void *)(v4 + 5664) = "dollar bill";
  *(void *)(v4 + 5688) = "drab";
  *(void *)(v4 + 5712) = "duke blue";
  *(void *)(v4 + 5736) = "earth yellow";
  *(void *)(v4 + 5760) = "ecru";
  *(void *)(v4 + 5784) = "eggplant";
  *(void *)(v4 + 5808) = "eggshell";
  *(void *)(v4 + 5832) = "egyptian blue";
  *(void *)(v4 + 5856) = "electric blue";
  *(void *)(v4 + 5880) = "electric crimson";
  *(void *)(v4 + 5904) = "electric cyan";
  *(void *)(v4 + 5928) = "electric indigo";
  *(void *)(v4 + 5952) = "electric lavender";
  *(void *)(v4 + 5976) = "electric lime";
  *(void *)(v4 + 6000) = "electric purple";
  *(void *)(v4 + 6024) = "electric ultramarine";
  *(void *)(v4 + 6048) = "electric violet";
  *(void *)(v4 + 6072) = "emerald";
  *(void *)(v4 + 6096) = "eton blue";
  *(void *)(v4 + 6120) = "fallow";
  *(void *)(v4 + 6144) = "falu red";
  *(void *)(v4 + 6168) = "fashion fuchsia";
  *(void *)(v4 + 6192) = "fawn";
  *(void *)(v4 + 6216) = "fern";
  *(void *)(v4 + 6240) = "fern green";
  *(void *)(v4 + 6264) = "ferrari red";
  *(void *)(v4 + 6288) = "field drab";
  *(void *)(v4 + 6312) = "fire engine red";
  *(void *)(v4 + 6336) = "firebrick";
  *(void *)(v4 + 6360) = "flame";
  *(void *)(v4 + 6384) = "flamingo pink";
  *(void *)(v4 + 6408) = "flavescent";
  *(void *)(v4 + 6432) = "flax";
  *(void *)(v4 + 6456) = "floral white";
  *(void *)(v4 + 6480) = "fluorescent orange";
  *(void *)(v4 + 6504) = "fluorescent pink";
  *(void *)(v4 + 6528) = "fluorescent yellow";
  *(void *)(v4 + 6552) = "folly";
  *(void *)(v4 + 6576) = "forest green";
  *(void *)(v4 + 6600) = "french beige";
  *(void *)(v4 + 6624) = "french blue";
  *(void *)(v4 + 6648) = "french lilac";
  *(void *)(v4 + 6672) = "french rose";
  *(void *)(v4 + 6696) = "fuchsia";
  *(void *)(v4 + 6720) = "fuchsia pink";
  *(void *)(v4 + 6744) = "fuzzy wuzzy";
  *(void *)(v4 + 6768) = "gainsboro";
  *(void *)(v4 + 6792) = "gamboge";
  *(void *)(v4 + 6816) = "ghost white";
  *(void *)(v4 + 6840) = "ginger";
  *(void *)(v4 + 6864) = "glaucous";
  *(void *)(v4 + 6888) = "glitter";
  *(void *)(v4 + 6912) = "gold";
  *(void *)(v4 + 6936) = "golden brown";
  *(void *)(v4 + 6960) = "golden poppy";
  *(void *)(v4 + 6984) = "golden yellow";
  *(void *)(v4 + 7008) = "goldenrod";
  *(void *)(v4 + 7032) = "granny smith apple";
  *(void *)(v4 + 7056) = "gray";
  *(void *)(v4 + 7080) = "green";
  *(void *)(v4 + 7104) = "green blue";
  *(void *)(v4 + 7128) = "green yellow";
  *(void *)(v4 + 7152) = "grullo";
  *(void *)(v4 + 7176) = "guppie green";
  *(void *)(v4 + 7200) = "han blue";
  *(void *)(v4 + 7224) = "han purple";
  *(void *)(v4 + 7248) = "hansa yellow";
  *(void *)(v4 + 7272) = "harvard crimson";
  *(void *)(v4 + 7296) = "harvest gold";
  *(void *)(v4 + 7320) = "heart gold";
  *(void *)(v4 + 7344) = "heliotrope";
  *(void *)(v4 + 7368) = "hollywood cerise";
  *(void *)(v4 + 7392) = "honeydew";
  *(void *)(v4 + 7416) = "hot magenta";
  *(void *)(v4 + 7440) = "hot pink";
  *(void *)(v4 + 7464) = "icterine";
  *(void *)(v4 + 7488) = "incandescent";
  *(void *)(v4 + 7512) = "indigo";
  *(void *)(v4 + 7536) = "international klein blue";
  *(void *)(v4 + 7544) = 24LL;
  *(void *)(v4 + 7560) = "international orange";
  *(void *)(v4 + 7584) = "iris";
  *(void *)(v4 + 7608) = "isabelline";
  *(void *)(v4 + 7632) = "ivory";
  *(void *)(v4 + 7656) = "jade";
  *(void *)(v4 + 7680) = "jasmine";
  *(void *)(v4 + 7704) = "jasper";
  *(void *)(v4 + 7728) = "jazzberry jam";
  *(void *)(v4 + 7752) = "jonquil";
  *(void *)(v4 + 7776) = "june bud";
  *(void *)(v4 + 7800) = "jungle green";
  *(void *)(v4 + 7824) = "kelly green";
  *(void *)(v4 + 7848) = "khaki";
  *(void *)(v4 + 7872) = "la salle green";
  *(void *)(v4 + 7896) = "languid lavender";
  *(void *)(v4 + 7920) = "lapis lazuli";
  *(void *)(v4 + 7944) = "laser lemon";
  *(void *)(v4 + 7992) = "lava";
  *(void *)(v4 + 8016) = "lavender";
  *(void *)(v4 + 8040) = "lavender blue";
  *(void *)(v4 + 8064) = "lavender blush";
  *(void *)(v4 + 8088) = "lavender gray";
  *(void *)(v4 + 8112) = "lavender indigo";
  *(void *)(v4 + 8136) = "lavender mist";
  *(void *)(v4 + 8160) = "lavender pink";
  *(void *)(v4 + 8184) = "lavender purple";
  *(void *)(v4 + 8208) = "lavender rose";
  *(void *)(v4 + 8232) = "lawn green";
  *(void *)(v4 + 8256) = "lemon";
  *(void *)(v4 + 8280) = "lemon yellow";
  *(void *)(v4 + 8304) = "lemon chiffon";
  *(void *)(v4 + 8328) = "lemon lime";
  *(void *)(v4 + 8352) = "light crimson";
  *(void *)(v4 + 8376) = "light thulian pink";
  *(void *)(v4 + 8400) = "light apricot";
  *(void *)(v4 + 8424) = "light blue";
  *(void *)(v4 + 8448) = "light brown";
  *(void *)(v4 + 8472) = "light carmine pink";
  *(void *)(v4 + 8496) = "light coral";
  *(void *)(v4 + 8520) = "light cornflower blue";
  *(void *)(v4 + 8528) = 21LL;
  *(void *)(v4 + 8544) = "light cyan";
  *(void *)(v4 + 8568) = "light fuchsia pink";
  *(void *)(v4 + 8592) = "light goldenrod yellow";
  *(void *)(v4 + 8616) = "light gray";
  *(void *)(v4 + 8640) = "light green";
  *(void *)(v4 + 8648) = 11LL;
  *(_BYTE *)(v4 + 8656) = 2;
  *(void *)(v4 + 8664) = "light khaki";
  *(void *)(v4 + 8672) = 11LL;
  *(_BYTE *)(v4 + 8680) = 2;
  *(void *)(v4 + 8688) = "light pastel purple";
  *(void *)(v4 + 8696) = 19LL;
  *(_BYTE *)(v4 + 8704) = 2;
  *(void *)(v4 + 8712) = "light pink";
  *(void *)(v4 + 8720) = 10LL;
  *(_BYTE *)(v4 + 8728) = 2;
  *(void *)(v4 + 8736) = "light salmon";
  *(void *)(v4 + 8744) = 12LL;
  *(_BYTE *)(v4 + 8752) = 2;
  *(void *)(v4 + 8760) = "light salmon pink";
  *(void *)(v4 + 8768) = 17LL;
  *(_BYTE *)(v4 + 8776) = 2;
  *(void *)(v4 + 8784) = "light sea green";
  *(void *)(v4 + 8792) = 15LL;
  *(_BYTE *)(v4 + 8800) = 2;
  *(void *)(v4 + 8808) = "light sky blue";
  *(void *)(v4 + 8816) = 14LL;
  *(_BYTE *)(v4 + 8824) = 2;
  *(void *)(v4 + 8832) = "light slate gray";
  *(void *)(v4 + 8856) = "light taupe";
  *(void *)(v4 + 8880) = "light yellow";
  *(void *)(v4 + 8904) = "lilac";
  *(void *)(v4 + 8928) = "lime";
  *(void *)(v4 + 8952) = "lime green";
  *(void *)(v4 + 8976) = "lincoln green";
  *(void *)(v4 + 9000) = "linen";
  *(void *)(v4 + 9024) = "lion";
  *(_BYTE *)(v4 + 9040) = 2;
  *(void *)(v4 + 9048) = "msu green";
  *(void *)(v4 + 9072) = "magenta";
  *(void *)(v4 + 9096) = "magic mint";
  *(void *)(v4 + 9120) = "magnolia";
  *(void *)(v4 + 9144) = "mahogany";
  *(void *)(v4 + 9168) = "maize";
  *(void *)(v4 + 9192) = "majorelle blue";
  *(void *)(v4 + 9216) = "malachite";
  *(void *)(v4 + 9240) = "mango tango";
  *(void *)(v4 + 9264) = "maroon";
  *(void *)(v4 + 9288) = "mauve";
  *(void *)(v4 + 9312) = "mauve taupe";
  *(void *)(v4 + 9336) = "mauvelous";
  *(void *)(v4 + 9360) = "medium persian blue";
  *(void *)(v4 + 9384) = "medium aquamarine";
  *(void *)(v4 + 9408) = "medium blue";
  *(void *)(v4 + 9432) = "medium candy apple red";
  *(void *)(v4 + 9456) = "medium carmine";
  *(void *)(v4 + 9480) = "medium champagne";
  *(void *)(v4 + 9504) = "medium electric blue";
  *(void *)(v4 + 9528) = "medium jungle green";
  *(void *)(v4 + 9552) = "medium lavender magenta";
  *(void *)(v4 + 9576) = "medium orchid";
  *(void *)(v4 + 9600) = "medium purple";
  *(void *)(v4 + 9624) = "medium red violet";
  *(void *)(v4 + 9648) = "medium sea green";
  *(void *)(v4 + 9672) = "medium slate blue";
  *(void *)(v4 + 9696) = "medium spring green";
  *(void *)(v4 + 9720) = "medium taupe";
  *(void *)(v4 + 9744) = "medium teal blue";
  *(void *)(v4 + 9768) = "medium turquoise";
  *(void *)(v4 + 9792) = "medium violet red";
  *(void *)(v4 + 9816) = "melon";
  *(void *)(v4 + 9840) = "midnight blue";
  *(void *)(v4 + 9864) = "midnight green";
  *(void *)(v4 + 9888) = "mikado yellow";
  *(void *)(v4 + 9912) = "mint";
  *(void *)(v4 + 9936) = "mint cream";
  *(void *)(v4 + 9960) = "mint green";
  *(void *)(v4 + 9984) = "misty rose";
  *(void *)(v4 + 10008) = "moccasin";
  *(void *)(v4 + 10032) = "mode beige";
  *(void *)(v4 + 10056) = "moonstone blue";
  *(void *)(v4 + 10080) = "mordant red 19";
  *(void *)(v4 + 10104) = "moss green";
  *(void *)(v4 + 10128) = "mountain meadow";
  *(void *)(v4 + 10152) = "mountbatten pink";
  *(void *)(v4 + 10176) = "mulberry";
  *(void *)(v4 + 10200) = "munsell";
  *(void *)(v4 + 10224) = "mustard";
  *(void *)(v4 + 10248) = "myrtle";
  *(void *)(v4 + 10272) = "nadeshiko pink";
  *(void *)(v4 + 10296) = "napier green";
  *(void *)(v4 + 10320) = "naples yellow";
  *(void *)(v4 + 10344) = "navajo white";
  *(void *)(v4 + 10368) = "navy blue";
  *(void *)(v4 + 10392) = "neon carrot";
  *(void *)(v4 + 10416) = "neon fuchsia";
  *(void *)(v4 + 10440) = "neon green";
  *(void *)(v4 + 10464) = "north texas green";
  *(void *)(v4 + 10488) = "ocean boat blue";
  *(void *)(v4 + 10512) = "ochre";
  *(void *)(v4 + 10536) = "office green";
  *(void *)(v4 + 10560) = "old gold";
  *(void *)(v4 + 10584) = "old lace";
  *(void *)(v4 + 10608) = "old lavender";
  *(void *)(v4 + 10632) = "old mauve";
  *(void *)(v4 + 10656) = "old rose";
  *(void *)(v4 + 10680) = "olive";
  *(void *)(v4 + 10704) = "olive drab";
  *(void *)(v4 + 10728) = "olive green";
  *(void *)(v4 + 10752) = "olivine";
  *(void *)(v4 + 10776) = "onyx";
  *(void *)(v4 + 10800) = "opera mauve";
  *(void *)(v4 + 10824) = "orange";
  *(void *)(v4 + 10848) = "orange yellow";
  *(void *)(v4 + 10872) = "orange peel";
  *(void *)(v4 + 10896) = "orange red";
  *(void *)(v4 + 10920) = "orchid";
  *(void *)(v4 + 10944) = "otter brown";
  *(void *)(v4 + 10968) = "outer space";
  *(void *)(v4 + 10992) = "outrageous orange";
  *(void *)(v4 + 11568) = "paris green";
  *(void *)(v4 + 11664) = "pastel green";
  *(void *)(v4 + 11760) = "pastel purple";
  *(void *)(v4 + 11856) = "payne grey";
  *(void *)(v4 + 11952) = "pear";
  *(void *)(v4 + 12048) = "periwinkle";
  *(void *)(v4 + 12144) = "persian pink";
  *(void *)(v4 + 12240) = "phlox";
  *(void *)(v4 + 8600) = 22LL;
  *(_BYTE *)(v4 + 8608) = 2;
  *(void *)(v4 + 8624) = 10LL;
  *(_BYTE *)(v4 + 8632) = 2;
  *(void *)(v4 + 5024) = 16LL;
  *(_BYTE *)(v4 + 5032) = 2;
  *(void *)(v4 + 8552) = 10LL;
  *(_BYTE *)(v4 + 8560) = 2;
  *(void *)(v4 + 8576) = 18LL;
  *(_BYTE *)(v4 + 8584) = 2;
  *(void *)(v4 + 5048) = 14LL;
  *(_BYTE *)(v4 + 5056) = 2;
  *(void *)(v4 + 5072) = 11LL;
  *(void *)(v4 + 8504) = 11LL;
  *(_BYTE *)(v4 + 8512) = 2;
  *(_BYTE *)(v4 + 8536) = 2;
  *(_BYTE *)(v4 + 5080) = 2;
  *(void *)(v4 + 5096) = 11LL;
  *(void *)(v4 + 8456) = 11LL;
  *(_BYTE *)(v4 + 8464) = 2;
  *(void *)(v4 + 8480) = 18LL;
  *(_BYTE *)(v4 + 8488) = 2;
  *(_BYTE *)(v4 + 5104) = 2;
  *(void *)(v4 + 5120) = 15LL;
  *(void *)(v4 + 8408) = 13LL;
  *(_BYTE *)(v4 + 8416) = 2;
  *(void *)(v4 + 8432) = 10LL;
  *(_BYTE *)(v4 + 8440) = 2;
  *(_BYTE *)(v4 + 5128) = 2;
  *(void *)(v4 + 5144) = 9LL;
  *(void *)(v4 + 8360) = 13LL;
  *(_BYTE *)(v4 + 8368) = 2;
  *(void *)(v4 + 8384) = 18LL;
  *(_BYTE *)(v4 + 8392) = 2;
  *(_BYTE *)(v4 + 5152) = 2;
  *(void *)(v4 + 5168) = 12LL;
  *(void *)(v4 + 8312) = 13LL;
  *(_BYTE *)(v4 + 8320) = 2;
  *(void *)(v4 + 8336) = 10LL;
  *(_BYTE *)(v4 + 8344) = 2;
  *(_BYTE *)(v4 + 5176) = 2;
  *(void *)(v4 + 5192) = 17LL;
  *(void *)(v4 + 8264) = 5LL;
  *(_BYTE *)(v4 + 8272) = 2;
  *(void *)(v4 + 8288) = 12LL;
  *(_BYTE *)(v4 + 8296) = 2;
  *(_BYTE *)(v4 + 5200) = 2;
  *(void *)(v4 + 5216) = 18LL;
  *(void *)(v4 + 8216) = 13LL;
  *(_BYTE *)(v4 + 8224) = 2;
  *(void *)(v4 + 8240) = 10LL;
  *(_BYTE *)(v4 + 8248) = 2;
  *(_BYTE *)(v4 + 5224) = 2;
  *(void *)(v4 + 8168) = 13LL;
  *(_BYTE *)(v4 + 8176) = 2;
  *(void *)(v4 + 0x2000) = 15LL;
  *(void *)(v4 + 7952) = 11LL;
  *(_BYTE *)(v4 + 8200) = 2;
  *(void *)(v4 + 5240) = 11LL;
  *(_BYTE *)(v4 + 5248) = 2;
  *(void *)(v4 + 8120) = 15LL;
  *(_BYTE *)(v4 + 8128) = 2;
  *(void *)(v4 + 8144) = 13LL;
  *(_BYTE *)(v4 + 8152) = 2;
  *(void *)(v4 + 5264) = 14LL;
  *(_BYTE *)(v4 + 5272) = 2;
  *(void *)(v4 + 8072) = 14LL;
  *(_BYTE *)(v4 + 8080) = 2;
  *(void *)(v4 + 8096) = 13LL;
  *(_BYTE *)(v4 + 8104) = 2;
  *(void *)(v4 + 5288) = 13LL;
  *(_BYTE *)(v4 + 5296) = 2;
  *(void *)(v4 + 8024) = 8LL;
  *(_BYTE *)(v4 + 8032) = 2;
  *(void *)(v4 + 8048) = 13LL;
  *(_BYTE *)(v4 + 8056) = 2;
  *(void *)(v4 + 5312) = 11LL;
  *(_BYTE *)(v4 + 5320) = 2;
  *(void *)(v4 + 5336) = 12LL;
  *(_BYTE *)(v4 + 7984) = 2;
  *(void *)(v4 + 8000) = 4LL;
  *(_BYTE *)(v4 + 8008) = 2;
  *(_BYTE *)(v4 + 5344) = 2;
  *(void *)(v4 + 5360) = 17LL;
  *(void *)(v4 + 7904) = 16LL;
  *(_BYTE *)(v4 + 7912) = 2;
  *(void *)(v4 + 7928) = 12LL;
  *(_BYTE *)(v4 + 7936) = 2;
  *(_BYTE *)(v4 + 5368) = 2;
  *(void *)(v4 + 5384) = 10LL;
  *(void *)(v4 + 7856) = 5LL;
  *(_BYTE *)(v4 + 7864) = 2;
  *(void *)(v4 + 7880) = 14LL;
  *(_BYTE *)(v4 + 7888) = 2;
  *(_BYTE *)(v4 + 5392) = 2;
  *(void *)(v4 + 5408) = 12LL;
  *(void *)(v4 + 7808) = 12LL;
  *(_BYTE *)(v4 + 7816) = 2;
  *(void *)(v4 + 7832) = 11LL;
  *(_BYTE *)(v4 + 7840) = 2;
  *(_BYTE *)(v4 + 5416) = 2;
  *(void *)(v4 + 5432) = 10LL;
  *(void *)(v4 + 7760) = 7LL;
  *(_BYTE *)(v4 + 7768) = 2;
  *(void *)(v4 + 7784) = 8LL;
  *(_BYTE *)(v4 + 7792) = 2;
  *(_BYTE *)(v4 + 5440) = 2;
  *(void *)(v4 + 5456) = 9LL;
  *(void *)(v4 + 7712) = 6LL;
  *(_BYTE *)(v4 + 7720) = 2;
  *(void *)(v4 + 7736) = 13LL;
  *(_BYTE *)(v4 + 7744) = 2;
  *(_BYTE *)(v4 + 5464) = 2;
  *(void *)(v4 + 5480) = 12LL;
  *(void *)(v4 + 7664) = 4LL;
  *(_BYTE *)(v4 + 7672) = 2;
  *(void *)(v4 + 7688) = 7LL;
  *(_BYTE *)(v4 + 7696) = 2;
  *(_BYTE *)(v4 + 5488) = 2;
  *(void *)(v4 + 5504) = 13LL;
  *(void *)(v4 + 7616) = 10LL;
  *(_BYTE *)(v4 + 7624) = 2;
  *(void *)(v4 + 7640) = 5LL;
  *(_BYTE *)(v4 + 7648) = 2;
  *(_BYTE *)(v4 + 5512) = 2;
  *(void *)(v4 + 5528) = 5LL;
  *(void *)(v4 + 7568) = 20LL;
  *(_BYTE *)(v4 + 7576) = 2;
  *(void *)(v4 + 7592) = 4LL;
  *(_BYTE *)(v4 + 7600) = 2;
  *(_BYTE *)(v4 + 5536) = 2;
  *(void *)(v4 + 5552) = 6LL;
  *(_BYTE *)(v4 + 5560) = 2;
  *(void *)(v4 + 7520) = 6LL;
  *(_BYTE *)(v4 + 7528) = 2;
  *(_BYTE *)(v4 + 7552) = 2;
  *(void *)(v4 + 5576) = 11LL;
  *(_BYTE *)(v4 + 5584) = 2;
  *(void *)(v4 + 7472) = 8LL;
  *(_BYTE *)(v4 + 7480) = 2;
  *(void *)(v4 + 7496) = 12LL;
  *(_BYTE *)(v4 + 7504) = 2;
  *(void *)(v4 + 5600) = 8LL;
  *(_BYTE *)(v4 + 5608) = 2;
  *(void *)(v4 + 7424) = 11LL;
  *(_BYTE *)(v4 + 7432) = 2;
  *(void *)(v4 + 7448) = 8LL;
  *(_BYTE *)(v4 + 7456) = 2;
  *(void *)(v4 + 5624) = 11LL;
  *(_BYTE *)(v4 + 5632) = 2;
  *(void *)(v4 + 7376) = 16LL;
  *(_BYTE *)(v4 + 7384) = 2;
  *(void *)(v4 + 7400) = 8LL;
  *(_BYTE *)(v4 + 7408) = 2;
  *(void *)(v4 + 5648) = 12LL;
  *(_BYTE *)(v4 + 5656) = 2;
  *(void *)(v4 + 7328) = 10LL;
  *(_BYTE *)(v4 + 7336) = 2;
  *(void *)(v4 + 7352) = 10LL;
  *(_BYTE *)(v4 + 7360) = 2;
  *(void *)(v4 + 5672) = 11LL;
  *(_BYTE *)(v4 + 5680) = 2;
  *(void *)(v4 + 7280) = 15LL;
  *(_BYTE *)(v4 + 7288) = 2;
  *(void *)(v4 + 7304) = 12LL;
  *(_BYTE *)(v4 + 7312) = 2;
  *(void *)(v4 + 5696) = 4LL;
  *(_BYTE *)(v4 + 5704) = 2;
  *(void *)(v4 + 7232) = 10LL;
  *(_BYTE *)(v4 + 7240) = 2;
  *(void *)(v4 + 7256) = 12LL;
  *(_BYTE *)(v4 + 7264) = 2;
  *(void *)(v4 + 5720) = 9LL;
  *(_BYTE *)(v4 + 5728) = 2;
  *(void *)(v4 + 7184) = 12LL;
  *(_BYTE *)(v4 + 7192) = 2;
  *(void *)(v4 + 7208) = 8LL;
  *(_BYTE *)(v4 + 7216) = 2;
  *(void *)(v4 + 5744) = 12LL;
  *(_BYTE *)(v4 + 5752) = 2;
  *(void *)(v4 + 7136) = 12LL;
  *(_BYTE *)(v4 + 7144) = 2;
  *(void *)(v4 + 7160) = 6LL;
  *(_BYTE *)(v4 + 7168) = 2;
  *(void *)(v4 + 5768) = 4LL;
  *(_BYTE *)(v4 + 5776) = 2;
  *(void *)(v4 + 7088) = 5LL;
  *(_BYTE *)(v4 + 7096) = 2;
  *(void *)(v4 + 7112) = 10LL;
  *(_BYTE *)(v4 + 7120) = 2;
  *(void *)(v4 + 5792) = 8LL;
  *(_BYTE *)(v4 + 5800) = 2;
  *(void *)(v4 + 7040) = 18LL;
  *(_BYTE *)(v4 + 7048) = 2;
  *(void *)(v4 + 7064) = 4LL;
  *(_BYTE *)(v4 + 7072) = 2;
  *(void *)(v4 + 5816) = 8LL;
  *(_BYTE *)(v4 + 5824) = 2;
  *(void *)(v4 + 6992) = 13LL;
  *(_BYTE *)(v4 + 7000) = 2;
  *(void *)(v4 + 7016) = 9LL;
  *(_BYTE *)(v4 + 7024) = 2;
  *(void *)(v4 + 5840) = 13LL;
  *(_BYTE *)(v4 + 5848) = 2;
  *(void *)(v4 + 6944) = 12LL;
  *(_BYTE *)(v4 + 6952) = 2;
  *(void *)(v4 + 6968) = 12LL;
  *(_BYTE *)(v4 + 6976) = 2;
  *(void *)(v4 + 5864) = 13LL;
  *(_BYTE *)(v4 + 5872) = 2;
  *(void *)(v4 + 6896) = 7LL;
  *(_BYTE *)(v4 + 6904) = 2;
  *(void *)(v4 + 6920) = 4LL;
  *(_BYTE *)(v4 + 6928) = 2;
  *(void *)(v4 + 5888) = 16LL;
  *(_BYTE *)(v4 + 5896) = 2;
  *(void *)(v4 + 6848) = 6LL;
  *(_BYTE *)(v4 + 6856) = 2;
  *(void *)(v4 + 6872) = 8LL;
  *(_BYTE *)(v4 + 6880) = 2;
  *(void *)(v4 + 5912) = 13LL;
  *(_BYTE *)(v4 + 5920) = 2;
  *(void *)(v4 + 6800) = 7LL;
  *(_BYTE *)(v4 + 6808) = 2;
  *(void *)(v4 + 6824) = 11LL;
  *(_BYTE *)(v4 + 6832) = 2;
  *(void *)(v4 + 5936) = 15LL;
  *(_BYTE *)(v4 + 5944) = 2;
  *(void *)(v4 + 6752) = 11LL;
  *(_BYTE *)(v4 + 6760) = 2;
  *(void *)(v4 + 6776) = 9LL;
  *(_BYTE *)(v4 + 6784) = 2;
  *(void *)(v4 + 5960) = 17LL;
  *(_BYTE *)(v4 + 5968) = 2;
  *(void *)(v4 + 6704) = 7LL;
  *(_BYTE *)(v4 + 6712) = 2;
  *(void *)(v4 + 6728) = 12LL;
  *(_BYTE *)(v4 + 6736) = 2;
  *(void *)(v4 + 5984) = 13LL;
  *(_BYTE *)(v4 + 5992) = 2;
  *(void *)(v4 + 6656) = 12LL;
  *(_BYTE *)(v4 + 6664) = 2;
  *(void *)(v4 + 6680) = 11LL;
  *(_BYTE *)(v4 + 6688) = 2;
  *(void *)(v4 + 6008) = 15LL;
  *(_BYTE *)(v4 + 6016) = 2;
  *(void *)(v4 + 6608) = 12LL;
  *(_BYTE *)(v4 + 6616) = 2;
  *(void *)(v4 + 6632) = 11LL;
  *(_BYTE *)(v4 + 6640) = 2;
  *(void *)(v4 + 6032) = 20LL;
  *(_BYTE *)(v4 + 6040) = 2;
  *(void *)(v4 + 6560) = 5LL;
  *(_BYTE *)(v4 + 6568) = 2;
  *(void *)(v4 + 6584) = 12LL;
  *(_BYTE *)(v4 + 6592) = 2;
  *(void *)(v4 + 6056) = 15LL;
  *(_BYTE *)(v4 + 6064) = 2;
  *(void *)(v4 + 6512) = 16LL;
  *(_BYTE *)(v4 + 6520) = 2;
  *(void *)(v4 + 6536) = 18LL;
  *(_BYTE *)(v4 + 6544) = 2;
  *(void *)(v4 + 6080) = 7LL;
  *(_BYTE *)(v4 + 6088) = 2;
  *(void *)(v4 + 6464) = 12LL;
  *(_BYTE *)(v4 + 6472) = 2;
  *(void *)(v4 + 6488) = 18LL;
  *(_BYTE *)(v4 + 6496) = 2;
  *(void *)(v4 + 6104) = 9LL;
  *(_BYTE *)(v4 + 6112) = 2;
  *(void *)(v4 + 6416) = 10LL;
  *(_BYTE *)(v4 + 6424) = 2;
  *(void *)(v4 + 6440) = 4LL;
  *(_BYTE *)(v4 + 6448) = 2;
  *(void *)(v4 + 6128) = 6LL;
  *(_BYTE *)(v4 + 6136) = 2;
  *(void *)(v4 + 6368) = 5LL;
  *(_BYTE *)(v4 + 6376) = 2;
  *(void *)(v4 + 6392) = 13LL;
  *(_BYTE *)(v4 + 6400) = 2;
  *(void *)(v4 + 6152) = 8LL;
  *(_BYTE *)(v4 + 6160) = 2;
  *(void *)(v4 + 6320) = 15LL;
  *(_BYTE *)(v4 + 6328) = 2;
  *(void *)(v4 + 6344) = 9LL;
  *(_BYTE *)(v4 + 6352) = 2;
  *(void *)(v4 + 6176) = 15LL;
  *(_BYTE *)(v4 + 6184) = 2;
  *(void *)(v4 + 6272) = 11LL;
  *(_BYTE *)(v4 + 6280) = 2;
  *(void *)(v4 + 6296) = 10LL;
  *(_BYTE *)(v4 + 6304) = 2;
  *(void *)(v4 + 6200) = 4LL;
  *(_BYTE *)(v4 + 6208) = 2;
  *(void *)(v4 + 6224) = 4LL;
  *(_BYTE *)(v4 + 6232) = 2;
  *(void *)(v4 + 6248) = 10LL;
  *(_BYTE *)(v4 + 6256) = 2;
  *(void *)(v4 + 8840) = 16LL;
  *(_BYTE *)(v4 + 8848) = 2;
  *(void *)(v4 + 8864) = 11LL;
  *(_BYTE *)(v4 + 8872) = 2;
  *(void *)(v4 + 8888) = 12LL;
  *(_BYTE *)(v4 + 8896) = 2;
  *(void *)(v4 + 8912) = 5LL;
  *(_BYTE *)(v4 + 8920) = 2;
  *(void *)(v4 + 8936) = 4LL;
  *(_BYTE *)(v4 + 8944) = 2;
  *(void *)(v4 + 8960) = 10LL;
  *(_BYTE *)(v4 + 8968) = 2;
  *(void *)(v4 + 8984) = 13LL;
  *(_BYTE *)(v4 + 8992) = 2;
  *(void *)(v4 + 9008) = 5LL;
  *(_BYTE *)(v4 + 9016) = 2;
  *(void *)(v4 + 9032) = 4LL;
  *(void *)(v4 + 9056) = 9LL;
  *(_BYTE *)(v4 + 9064) = 2;
  *(void *)(v4 + 9080) = 7LL;
  *(_BYTE *)(v4 + 9088) = 2;
  *(void *)(v4 + 9104) = 10LL;
  *(_BYTE *)(v4 + 9112) = 2;
  *(void *)(v4 + 9128) = 8LL;
  *(_BYTE *)(v4 + 9136) = 2;
  *(void *)(v4 + 9152) = 8LL;
  *(_BYTE *)(v4 + 9160) = 2;
  *(void *)(v4 + 9176) = 5LL;
  *(_BYTE *)(v4 + 9184) = 2;
  *(void *)(v4 + 9200) = 14LL;
  *(_BYTE *)(v4 + 9208) = 2;
  *(void *)(v4 + 9224) = 9LL;
  *(_BYTE *)(v4 + 9232) = 2;
  *(void *)(v4 + 9248) = 11LL;
  *(_BYTE *)(v4 + 9256) = 2;
  *(void *)(v4 + 9272) = 6LL;
  *(_BYTE *)(v4 + 9280) = 2;
  *(void *)(v4 + 9296) = 5LL;
  *(_BYTE *)(v4 + 9304) = 2;
  *(void *)(v4 + 9320) = 11LL;
  *(_BYTE *)(v4 + 9328) = 2;
  *(void *)(v4 + 9344) = 9LL;
  *(_BYTE *)(v4 + 9352) = 2;
  *(void *)(v4 + 9368) = 19LL;
  *(_BYTE *)(v4 + 9376) = 2;
  *(void *)(v4 + 9392) = 17LL;
  *(_BYTE *)(v4 + 9400) = 2;
  *(void *)(v4 + 9416) = 11LL;
  *(_BYTE *)(v4 + 9424) = 2;
  *(void *)(v4 + 9440) = 22LL;
  *(_BYTE *)(v4 + 9448) = 2;
  *(void *)(v4 + 9464) = 14LL;
  *(_BYTE *)(v4 + 9472) = 2;
  *(void *)(v4 + 9488) = 16LL;
  *(_BYTE *)(v4 + 9496) = 2;
  *(void *)(v4 + 9512) = 20LL;
  *(_BYTE *)(v4 + 9520) = 2;
  *(void *)(v4 + 9536) = 19LL;
  *(_BYTE *)(v4 + 9544) = 2;
  *(void *)(v4 + 9560) = 23LL;
  *(_BYTE *)(v4 + 9568) = 2;
  *(void *)(v4 + 9584) = 13LL;
  *(_BYTE *)(v4 + 9592) = 2;
  *(void *)(v4 + 9608) = 13LL;
  *(_BYTE *)(v4 + 9616) = 2;
  *(void *)(v4 + 9632) = 17LL;
  *(_BYTE *)(v4 + 9640) = 2;
  *(void *)(v4 + 9656) = 16LL;
  *(_BYTE *)(v4 + 9664) = 2;
  *(void *)(v4 + 9680) = 17LL;
  *(_BYTE *)(v4 + 9688) = 2;
  *(void *)(v4 + 9704) = 19LL;
  *(_BYTE *)(v4 + 9712) = 2;
  *(void *)(v4 + 9728) = 12LL;
  *(_BYTE *)(v4 + 9736) = 2;
  *(void *)(v4 + 9752) = 16LL;
  *(_BYTE *)(v4 + 9760) = 2;
  *(void *)(v4 + 9776) = 16LL;
  *(_BYTE *)(v4 + 9784) = 2;
  *(void *)(v4 + 9800) = 17LL;
  *(_BYTE *)(v4 + 9808) = 2;
  *(void *)(v4 + 9824) = 5LL;
  *(_BYTE *)(v4 + 9832) = 2;
  *(void *)(v4 + 9848) = 13LL;
  *(_BYTE *)(v4 + 9856) = 2;
  *(void *)(v4 + 9872) = 14LL;
  *(_BYTE *)(v4 + 9880) = 2;
  *(void *)(v4 + 9896) = 13LL;
  *(_BYTE *)(v4 + 9904) = 2;
  *(void *)(v4 + 9920) = 4LL;
  *(_BYTE *)(v4 + 9928) = 2;
  *(void *)(v4 + 9944) = 10LL;
  *(_BYTE *)(v4 + 9952) = 2;
  *(void *)(v4 + 9968) = 10LL;
  *(_BYTE *)(v4 + 9976) = 2;
  *(void *)(v4 + 9992) = 10LL;
  *(_BYTE *)(v4 + 10000) = 2;
  *(void *)(v4 + 10016) = 8LL;
  *(_BYTE *)(v4 + 10024) = 2;
  *(void *)(v4 + 10040) = 10LL;
  *(_BYTE *)(v4 + 10048) = 2;
  *(void *)(v4 + 10064) = 14LL;
  *(_BYTE *)(v4 + 10072) = 2;
  *(void *)(v4 + 10088) = 14LL;
  *(_BYTE *)(v4 + 10096) = 2;
  *(void *)(v4 + 10112) = 10LL;
  *(_BYTE *)(v4 + 10120) = 2;
  *(void *)(v4 + 10136) = 15LL;
  *(_BYTE *)(v4 + 10144) = 2;
  *(void *)(v4 + 10160) = 16LL;
  *(_BYTE *)(v4 + 10168) = 2;
  *(void *)(v4 + 10184) = 8LL;
  *(_BYTE *)(v4 + 10192) = 2;
  *(void *)(v4 + 10208) = 7LL;
  *(_BYTE *)(v4 + 10216) = 2;
  *(void *)(v4 + 10232) = 7LL;
  *(_BYTE *)(v4 + 10240) = 2;
  *(void *)(v4 + 10256) = 6LL;
  *(_BYTE *)(v4 + 10264) = 2;
  *(void *)(v4 + 10280) = 14LL;
  *(_BYTE *)(v4 + 10288) = 2;
  *(void *)(v4 + 10304) = 12LL;
  *(_BYTE *)(v4 + 10312) = 2;
  *(void *)(v4 + 10328) = 13LL;
  *(_BYTE *)(v4 + 10336) = 2;
  *(void *)(v4 + 10352) = 12LL;
  *(_BYTE *)(v4 + 10360) = 2;
  *(void *)(v4 + 10376) = 9LL;
  *(_BYTE *)(v4 + 10384) = 2;
  *(void *)(v4 + 10400) = 11LL;
  *(_BYTE *)(v4 + 10408) = 2;
  *(void *)(v4 + 10424) = 12LL;
  *(_BYTE *)(v4 + 10432) = 2;
  *(void *)(v4 + 10448) = 10LL;
  *(_BYTE *)(v4 + 10456) = 2;
  *(void *)(v4 + 10472) = 17LL;
  *(_BYTE *)(v4 + 10480) = 2;
  *(void *)(v4 + 10496) = 15LL;
  *(_BYTE *)(v4 + 10504) = 2;
  *(void *)(v4 + 10520) = 5LL;
  *(_BYTE *)(v4 + 10528) = 2;
  *(void *)(v4 + 10544) = 12LL;
  *(_BYTE *)(v4 + 10552) = 2;
  *(void *)(v4 + 10568) = 8LL;
  *(_BYTE *)(v4 + 7960) = 2;
  *(void *)(v4 + 12360) = "pink";
  *(void *)(v4 + 12456) = "pistachio";
  *(void *)(v4 + 12552) = "powder blue";
  *(void *)(v4 + 12624) = "psychedelic purple";
  *(void *)(v4 + 12648) = "puce";
  *(void *)(v4 + 12720) = "purple heart";
  *(void *)(v4 + 12752) = 25LL;
  *(void *)(v4 + 12768) = "purple mountain majesty";
  *(void *)(v4 + 12936) = "raspberry rose";
  *(void *)(v4 + 13032) = "red";
  *(void *)(v4 + 13104) = "red violet";
  *(void *)(v4 + 13200) = "rich lilac";
  *(void *)(v4 + 13296) = "rose bonbon";
  *(void *)(v4 + 13392) = "rose quartz";
  *(void *)(v4 + 13488) = "rosso corsa";
  *(void *)(v4 + 13584) = "royal fuchsia";
  *(void *)(v4 + 13680) = "ruddy pink";
  *(void *)(v4 + 13776) = "sacramento state green";
  *(void *)(v4 + 13896) = "salmon";
  *(void *)(v4 + 13992) = "sandstorm";
  *(void *)(v4 + 14088) = "sapphire";
  *(void *)(v4 + 14184) = "screamin green";
  *(void *)(v4 + 14280) = "seashell";
  *(void *)(v4 + 14376) = "shamrock";
  *(void *)(v4 + 14472) = "silver";
  *(void *)(v4 + 14568) = "slate blue";
  *(void *)(v4 + 14664) = "smoky black";
  *(void *)(v4 + 14760) = "steel blue";
  *(void *)(v4 + 14856) = "straw";
  *(_BYTE *)(v4 + 10576) = 2;
  *(void *)(v4 + 14952) = "sunset orange";
  *(void *)(v4 + 14960) = 13LL;
  *(_BYTE *)(v4 + 14968) = 2;
  *(void *)(v4 + 14928) = "sunset";
  *(_BYTE *)(v4 + 14920) = 2;
  *(void *)(v4 + 14936) = 6LL;
  *(_BYTE *)(v4 + 14944) = 2;
  *(void *)(v4 + 14904) = "sunlight";
  *(void *)(v4 + 14888) = 7LL;
  *(_BYTE *)(v4 + 14896) = 2;
  *(void *)(v4 + 14912) = 8LL;
  *(void *)(v4 + 10592) = 8LL;
  *(void *)(v4 + 14880) = "sunglow";
  *(void *)(v4 + 14864) = 5LL;
  *(_BYTE *)(v4 + 14872) = 2;
  *(void *)(v4 + 14832) = "stormcloud";
  *(_BYTE *)(v4 + 14824) = 2;
  *(void *)(v4 + 14840) = 10LL;
  *(_BYTE *)(v4 + 14848) = 2;
  *(void *)(v4 + 14808) = "stizza";
  *(void *)(v4 + 14792) = 20LL;
  *(_BYTE *)(v4 + 14800) = 2;
  *(void *)(v4 + 14816) = 6LL;
  *(_BYTE *)(v4 + 10600) = 2;
  *(void *)(v4 + 14784) = "stil de grain yellow";
  *(void *)(v4 + 14768) = 10LL;
  *(_BYTE *)(v4 + 14776) = 2;
  *(void *)(v4 + 14736) = "spring green";
  *(_BYTE *)(v4 + 14728) = 2;
  *(void *)(v4 + 14744) = 12LL;
  *(_BYTE *)(v4 + 14752) = 2;
  *(void *)(v4 + 14712) = "spiro disco ball";
  *(void *)(v4 + 14696) = 4LL;
  *(_BYTE *)(v4 + 14704) = 2;
  *(void *)(v4 + 14720) = 16LL;
  *(void *)(v4 + 10616) = 12LL;
  *(void *)(v4 + 14688) = "snow";
  *(void *)(v4 + 14672) = 11LL;
  *(_BYTE *)(v4 + 14680) = 2;
  *(void *)(v4 + 14640) = "smokey topaz";
  *(_BYTE *)(v4 + 14632) = 2;
  *(void *)(v4 + 14648) = 12LL;
  *(_BYTE *)(v4 + 14656) = 2;
  *(void *)(v4 + 14616) = "smalt";
  *(void *)(v4 + 14600) = 10LL;
  *(_BYTE *)(v4 + 14608) = 2;
  *(void *)(v4 + 14624) = 5LL;
  *(_BYTE *)(v4 + 10624) = 2;
  *(void *)(v4 + 14592) = "slate gray";
  *(void *)(v4 + 14576) = 10LL;
  *(_BYTE *)(v4 + 14584) = 2;
  *(void *)(v4 + 14544) = "sky magenta";
  *(_BYTE *)(v4 + 14536) = 2;
  *(void *)(v4 + 14552) = 11LL;
  *(_BYTE *)(v4 + 14560) = 2;
  *(void *)(v4 + 14520) = "sky blue";
  *(void *)(v4 + 14504) = 9LL;
  *(_BYTE *)(v4 + 14512) = 2;
  *(void *)(v4 + 14528) = 8LL;
  *(void *)(v4 + 10640) = 9LL;
  *(void *)(v4 + 14496) = "skobeloff";
  *(void *)(v4 + 14480) = 6LL;
  *(_BYTE *)(v4 + 14488) = 2;
  *(void *)(v4 + 14448) = "sienna";
  *(_BYTE *)(v4 + 14440) = 2;
  *(void *)(v4 + 14456) = 6LL;
  *(_BYTE *)(v4 + 14464) = 2;
  *(void *)(v4 + 14424) = "shocking pink";
  *(void *)(v4 + 14408) = 14LL;
  *(_BYTE *)(v4 + 14416) = 2;
  *(void *)(v4 + 14432) = 13LL;
  *(_BYTE *)(v4 + 10648) = 2;
  *(void *)(v4 + 14400) = "shamrock green";
  *(void *)(v4 + 14384) = 8LL;
  *(_BYTE *)(v4 + 14392) = 2;
  *(void *)(v4 + 14352) = "shadow";
  *(_BYTE *)(v4 + 14344) = 2;
  *(void *)(v4 + 14360) = 6LL;
  *(_BYTE *)(v4 + 14368) = 2;
  *(void *)(v4 + 14328) = "sepia";
  *(void *)(v4 + 14312) = 16LL;
  *(_BYTE *)(v4 + 14320) = 2;
  *(void *)(v4 + 14336) = 5LL;
  *(void *)(v4 + 10664) = 8LL;
  *(void *)(v4 + 14304) = "selective yellow";
  *(void *)(v4 + 14288) = 8LL;
  *(_BYTE *)(v4 + 14296) = 2;
  *(void *)(v4 + 14256) = "seal brown";
  *(_BYTE *)(v4 + 14248) = 2;
  *(void *)(v4 + 14264) = 10LL;
  *(_BYTE *)(v4 + 14272) = 2;
  *(void *)(v4 + 14232) = "sea green";
  *(void *)(v4 + 14216) = 8LL;
  *(_BYTE *)(v4 + 14224) = 2;
  *(void *)(v4 + 14240) = 9LL;
  *(_BYTE *)(v4 + 10672) = 2;
  *(void *)(v4 + 14208) = "sea blue";
  *(void *)(v4 + 14192) = 14LL;
  *(_BYTE *)(v4 + 14200) = 2;
  *(void *)(v4 + 14160) = "school bus yellow";
  *(_BYTE *)(v4 + 14152) = 2;
  *(void *)(v4 + 14168) = 17LL;
  *(_BYTE *)(v4 + 14176) = 2;
  *(void *)(v4 + 14136) = "scarlet";
  *(void *)(v4 + 14120) = 16LL;
  *(_BYTE *)(v4 + 14128) = 2;
  *(void *)(v4 + 14144) = 7LL;
  *(void *)(v4 + 10688) = 5LL;
  *(void *)(v4 + 14112) = "satin sheen gold";
  *(void *)(v4 + 14096) = 8LL;
  *(_BYTE *)(v4 + 14104) = 2;
  *(void *)(v4 + 14064) = "sap green";
  *(_BYTE *)(v4 + 14056) = 2;
  *(void *)(v4 + 14072) = 9LL;
  *(_BYTE *)(v4 + 14080) = 2;
  *(void *)(v4 + 14040) = "sandy taupe";
  *(void *)(v4 + 14024) = 11LL;
  *(_BYTE *)(v4 + 14032) = 2;
  *(void *)(v4 + 14048) = 11LL;
  *(_BYTE *)(v4 + 10696) = 2;
  *(void *)(v4 + 14016) = "sandy brown";
  *(void *)(v4 + 14000) = 9LL;
  *(_BYTE *)(v4 + 14008) = 2;
  *(void *)(v4 + 13968) = "sand dune";
  *(_BYTE *)(v4 + 13960) = 2;
  *(void *)(v4 + 13976) = 9LL;
  *(_BYTE *)(v4 + 13984) = 2;
  *(void *)(v4 + 13944) = "sand";
  *(void *)(v4 + 13928) = 11LL;
  *(_BYTE *)(v4 + 13936) = 2;
  *(void *)(v4 + 13952) = 4LL;
  *(void *)(v4 + 10712) = 10LL;
  *(void *)(v4 + 13920) = "salmon pink";
  *(void *)(v4 + 13904) = 6LL;
  *(_BYTE *)(v4 + 13912) = 2;
  *(void *)(v4 + 13872) = "saint patrick blue";
  *(_BYTE *)(v4 + 13864) = 2;
  *(void *)(v4 + 13880) = 18LL;
  *(_BYTE *)(v4 + 13888) = 2;
  *(void *)(v4 + 13848) = "saffron";
  *(void *)(v4 + 13832) = 13LL;
  *(_BYTE *)(v4 + 13840) = 2;
  *(void *)(v4 + 13856) = 7LL;
  *(void *)(v4 + 13784) = 22LL;
  *(void *)(v4 + 13808) = 12LL;
  *(_BYTE *)(v4 + 13816) = 2;
  *(void *)(v4 + 13824) = "safety orange";
  *(void *)(v4 + 13800) = "saddle brown";
  *(_BYTE *)(v4 + 13792) = 2;
  *(void *)(v4 + 13752) = "rust";
  *(_BYTE *)(v4 + 13744) = 2;
  *(void *)(v4 + 13760) = 4LL;
  *(_BYTE *)(v4 + 13768) = 2;
  *(void *)(v4 + 13728) = "russet";
  *(void *)(v4 + 13712) = 6LL;
  *(_BYTE *)(v4 + 13720) = 2;
  *(void *)(v4 + 13736) = 6LL;
  *(_BYTE *)(v4 + 10720) = 2;
  *(void *)(v4 + 13704) = "rufous";
  *(void *)(v4 + 13688) = 10LL;
  *(_BYTE *)(v4 + 13696) = 2;
  *(void *)(v4 + 13656) = "ruddy brown";
  *(_BYTE *)(v4 + 13648) = 2;
  *(void *)(v4 + 13664) = 11LL;
  *(_BYTE *)(v4 + 13672) = 2;
  *(void *)(v4 + 13632) = "ruby";
  *(void *)(v4 + 13616) = 12LL;
  *(_BYTE *)(v4 + 13624) = 2;
  *(void *)(v4 + 13640) = 4LL;
  *(void *)(v4 + 10736) = 11LL;
  *(void *)(v4 + 13608) = "royal purple";
  *(void *)(v4 + 13592) = 13LL;
  *(_BYTE *)(v4 + 13600) = 2;
  *(void *)(v4 + 13560) = "royal blue";
  *(_BYTE *)(v4 + 13552) = 2;
  *(void *)(v4 + 13568) = 10LL;
  *(_BYTE *)(v4 + 13576) = 2;
  *(void *)(v4 + 13536) = "royal azure";
  *(void *)(v4 + 13520) = 10LL;
  *(_BYTE *)(v4 + 13528) = 2;
  *(void *)(v4 + 13544) = 11LL;
  *(_BYTE *)(v4 + 10744) = 2;
  *(void *)(v4 + 13512) = "rosy brown";
  *(void *)(v4 + 13496) = 11LL;
  *(_BYTE *)(v4 + 13504) = 2;
  *(void *)(v4 + 13464) = "rosewood";
  *(_BYTE *)(v4 + 13456) = 2;
  *(void *)(v4 + 13472) = 8LL;
  *(_BYTE *)(v4 + 13480) = 2;
  *(void *)(v4 + 13440) = "rose vale";
  *(void *)(v4 + 13424) = 10LL;
  *(_BYTE *)(v4 + 13432) = 2;
  *(void *)(v4 + 13448) = 9LL;
  *(void *)(v4 + 10760) = 7LL;
  *(void *)(v4 + 13416) = "rose taupe";
  *(void *)(v4 + 13400) = 11LL;
  *(_BYTE *)(v4 + 13408) = 2;
  *(void *)(v4 + 13368) = "rose pink";
  *(_BYTE *)(v4 + 13360) = 2;
  *(void *)(v4 + 13376) = 9LL;
  *(_BYTE *)(v4 + 13384) = 2;
  *(void *)(v4 + 13344) = "rose madder";
  *(void *)(v4 + 13328) = 10LL;
  *(_BYTE *)(v4 + 13336) = 2;
  *(void *)(v4 + 13352) = 11LL;
  *(_BYTE *)(v4 + 10768) = 2;
  *(void *)(v4 + 13320) = "rose ebony";
  *(void *)(v4 + 13304) = 11LL;
  *(_BYTE *)(v4 + 13312) = 2;
  *(void *)(v4 + 13272) = "rose";
  *(_BYTE *)(v4 + 13264) = 2;
  *(void *)(v4 + 13280) = 4LL;
  *(_BYTE *)(v4 + 13288) = 2;
  *(void *)(v4 + 13248) = "robin's egg blue";
  *(void *)(v4 + 13232) = 11LL;
  *(_BYTE *)(v4 + 13240) = 2;
  *(void *)(v4 + 13256) = 16LL;
  *(void *)(v4 + 10784) = 4LL;
  *(void *)(v4 + 13224) = "rich maroon";
  *(void *)(v4 + 13208) = 10LL;
  *(_BYTE *)(v4 + 13216) = 2;
  *(void *)(v4 + 13176) = "rich electric blue";
  *(_BYTE *)(v4 + 13168) = 2;
  *(void *)(v4 + 13184) = 18LL;
  *(_BYTE *)(v4 + 13192) = 2;
  *(void *)(v4 + 13152) = "rich carmine";
  *(void *)(v4 + 13136) = 10LL;
  *(_BYTE *)(v4 + 13144) = 2;
  *(void *)(v4 + 13160) = 12LL;
  *(_BYTE *)(v4 + 10792) = 2;
  *(void *)(v4 + 13128) = "rich black";
  *(void *)(v4 + 13112) = 10LL;
  *(_BYTE *)(v4 + 13120) = 2;
  *(void *)(v4 + 13080) = "red brown";
  *(_BYTE *)(v4 + 13072) = 2;
  *(void *)(v4 + 13088) = 9LL;
  *(_BYTE *)(v4 + 13096) = 2;
  *(void *)(v4 + 10808) = 11LL;
  *(void *)(v4 + 13056) = "red orange";
  *(void *)(v4 + 13040) = 3LL;
  *(_BYTE *)(v4 + 13048) = 2;
  *(void *)(v4 + 13064) = 10LL;
  *(void *)(v4 + 13008) = "razzmatazz";
  *(_BYTE *)(v4 + 13000) = 2;
  *(void *)(v4 + 13016) = 10LL;
  *(_BYTE *)(v4 + 13024) = 2;
  *(void *)(v4 + 12984) = "razzle dazzle rose";
  *(void *)(v4 + 12968) = 10LL;
  *(_BYTE *)(v4 + 12976) = 2;
  *(void *)(v4 + 12992) = 18LL;
  *(_BYTE *)(v4 + 10816) = 2;
  *(void *)(v4 + 12960) = "raw sienna";
  *(void *)(v4 + 12944) = 14LL;
  *(_BYTE *)(v4 + 12952) = 2;
  *(void *)(v4 + 12912) = "raspberry pink";
  *(_BYTE *)(v4 + 12904) = 2;
  *(void *)(v4 + 12920) = 14LL;
  *(_BYTE *)(v4 + 12928) = 2;
  *(void *)(v4 + 12888) = "raspberry glace";
  *(void *)(v4 + 12872) = 9LL;
  *(_BYTE *)(v4 + 12880) = 2;
  *(void *)(v4 + 12896) = 15LL;
  *(void *)(v4 + 10832) = 6LL;
  *(void *)(v4 + 12864) = "raspberry";
  *(void *)(v4 + 12848) = 11LL;
  *(_BYTE *)(v4 + 12856) = 2;
  *(void *)(v4 + 12816) = "purple taupe";
  *(void *)(v4 + 12824) = 12LL;
  *(_BYTE *)(v4 + 12832) = 2;
  *(void *)(v4 + 12840) = "radical red";
  *(_BYTE *)(v4 + 12784) = 2;
  *(void *)(v4 + 12792) = "purple pizzazz";
  *(void *)(v4 + 12800) = 14LL;
  *(_BYTE *)(v4 + 12808) = 2;
  *(void *)(v4 + 12776) = 23LL;
  *(_BYTE *)(v4 + 12760) = 2;
  *(_BYTE *)(v4 + 10840) = 2;
  *(void *)(v4 + 12744) = "purple mountain's majesty";
  *(void *)(v4 + 12728) = 12LL;
  *(_BYTE *)(v4 + 12736) = 2;
  *(void *)(v4 + 12696) = "purple";
  *(_BYTE *)(v4 + 12688) = 2;
  *(void *)(v4 + 12704) = 6LL;
  *(_BYTE *)(v4 + 12712) = 2;
  *(void *)(v4 + 12672) = "pumpkin";
  *(void *)(v4 + 12656) = 4LL;
  *(_BYTE *)(v4 + 12664) = 2;
  *(void *)(v4 + 12680) = 7LL;
  *(void *)(v4 + 10856) = 13LL;
  *(void *)(v4 + 12632) = 18LL;
  *(_BYTE *)(v4 + 12616) = 2;
  *(_BYTE *)(v4 + 12640) = 2;
  *(void *)(v4 + 12600) = "prussian blue";
  *(void *)(v4 + 12584) = 16LL;
  *(_BYTE *)(v4 + 12592) = 2;
  *(void *)(v4 + 12608) = 13LL;
  *(_BYTE *)(v4 + 10864) = 2;
  *(void *)(v4 + 12576) = "princeton orange";
  *(void *)(v4 + 12560) = 11LL;
  *(_BYTE *)(v4 + 12568) = 2;
  *(void *)(v4 + 12528) = "portland orange";
  *(_BYTE *)(v4 + 12520) = 2;
  *(void *)(v4 + 12536) = 15LL;
  *(_BYTE *)(v4 + 12544) = 2;
  *(void *)(v4 + 12504) = "plum";
  *(void *)(v4 + 12488) = 8LL;
  *(_BYTE *)(v4 + 12496) = 2;
  *(void *)(v4 + 12512) = 4LL;
  *(void *)(v4 + 10880) = 11LL;
  *(void *)(v4 + 12480) = "platinum";
  *(void *)(v4 + 12464) = 9LL;
  *(_BYTE *)(v4 + 12472) = 2;
  *(void *)(v4 + 12432) = "pink pearl";
  *(_BYTE *)(v4 + 12424) = 2;
  *(void *)(v4 + 12440) = 10LL;
  *(_BYTE *)(v4 + 12448) = 2;
  *(void *)(v4 + 12408) = "pink sherbet";
  *(void *)(v4 + 12392) = 13LL;
  *(_BYTE *)(v4 + 12400) = 2;
  *(void *)(v4 + 12416) = 12LL;
  *(_BYTE *)(v4 + 10888) = 2;
  *(void *)(v4 + 12384) = "pink flamingo";
  *(void *)(v4 + 12368) = 4LL;
  *(_BYTE *)(v4 + 12376) = 2;
  *(void *)(v4 + 12336) = "pine green";
  *(_BYTE *)(v4 + 12328) = 2;
  *(void *)(v4 + 12344) = 10LL;
  *(_BYTE *)(v4 + 12352) = 2;
  *(void *)(v4 + 10904) = 10LL;
  *(void *)(v4 + 12312) = "piggy pink";
  *(_BYTE *)(v4 + 12304) = 2;
  *(void *)(v4 + 12320) = 10LL;
  *(void *)(v4 + 12288) = "phthalo green";
  *(void *)(v4 + 12272) = 12LL;
  *(_BYTE *)(v4 + 12280) = 2;
  *(void *)(v4 + 12296) = 13LL;
  *(_BYTE *)(v4 + 10912) = 2;
  *(void *)(v4 + 12264) = "phthalo blue";
  *(void *)(v4 + 12248) = 5LL;
  *(_BYTE *)(v4 + 12256) = 2;
  *(void *)(v4 + 12216) = "persian rose";
  *(_BYTE *)(v4 + 12208) = 2;
  *(void *)(v4 + 12224) = 12LL;
  *(_BYTE *)(v4 + 12232) = 2;
  *(void *)(v4 + 12192) = "persian red";
  *(void *)(v4 + 12176) = 12LL;
  *(_BYTE *)(v4 + 12184) = 2;
  *(void *)(v4 + 12200) = 11LL;
  *(void *)(v4 + 10928) = 6LL;
  *(void *)(v4 + 12168) = "persian plum";
  *(void *)(v4 + 12152) = 12LL;
  *(_BYTE *)(v4 + 12160) = 2;
  *(void *)(v4 + 12120) = "persian orange";
  *(_BYTE *)(v4 + 12112) = 2;
  *(void *)(v4 + 12128) = 14LL;
  *(_BYTE *)(v4 + 12136) = 2;
  *(void *)(v4 + 12096) = "persian indigo";
  *(void *)(v4 + 12080) = 12LL;
  *(_BYTE *)(v4 + 12088) = 2;
  *(void *)(v4 + 12104) = 14LL;
  *(_BYTE *)(v4 + 10936) = 2;
  *(void *)(v4 + 12072) = "persian blue";
  *(void *)(v4 + 12056) = 10LL;
  *(_BYTE *)(v4 + 12064) = 2;
  *(void *)(v4 + 12024) = "peridot";
  *(_BYTE *)(v4 + 12016) = 2;
  *(void *)(v4 + 12032) = 7LL;
  *(_BYTE *)(v4 + 12040) = 2;
  *(void *)(v4 + 12000) = "pearl aqua";
  *(void *)(v4 + 11984) = 5LL;
  *(_BYTE *)(v4 + 11992) = 2;
  *(void *)(v4 + 12008) = 10LL;
  *(void *)(v4 + 10952) = 11LL;
  *(void *)(v4 + 11976) = "pearl";
  *(void *)(v4 + 11960) = 4LL;
  *(_BYTE *)(v4 + 11968) = 2;
  *(void *)(v4 + 11928) = "peach yellow";
  *(_BYTE *)(v4 + 11920) = 2;
  *(void *)(v4 + 11936) = 12LL;
  *(_BYTE *)(v4 + 11944) = 2;
  *(void *)(v4 + 11904) = "peach puff";
  *(void *)(v4 + 11888) = 5LL;
  *(_BYTE *)(v4 + 11896) = 2;
  *(void *)(v4 + 11912) = 10LL;
  *(_BYTE *)(v4 + 10960) = 2;
  *(void *)(v4 + 11880) = "peach";
  *(void *)(v4 + 11864) = 10LL;
  *(_BYTE *)(v4 + 11872) = 2;
  *(void *)(v4 + 11832) = "pastel yellow";
  *(_BYTE *)(v4 + 11824) = 2;
  *(void *)(v4 + 11840) = 13LL;
  *(_BYTE *)(v4 + 11848) = 2;
  *(void *)(v4 + 11808) = "pastel violet";
  *(void *)(v4 + 11792) = 10LL;
  *(_BYTE *)(v4 + 11800) = 2;
  *(void *)(v4 + 11816) = 13LL;
  *(void *)(v4 + 10976) = 11LL;
  *(void *)(v4 + 11784) = "pastel red";
  *(void *)(v4 + 11768) = 13LL;
  *(_BYTE *)(v4 + 11776) = 2;
  *(void *)(v4 + 11736) = "pastel pink";
  *(_BYTE *)(v4 + 11728) = 2;
  *(void *)(v4 + 11744) = 11LL;
  *(_BYTE *)(v4 + 11752) = 2;
  *(void *)(v4 + 11712) = "pastel orange";
  *(void *)(v4 + 11696) = 14LL;
  *(_BYTE *)(v4 + 11704) = 2;
  *(void *)(v4 + 11720) = 13LL;
  *(_BYTE *)(v4 + 10984) = 2;
  *(void *)(v4 + 11688) = "pastel magenta";
  *(void *)(v4 + 11672) = 12LL;
  *(_BYTE *)(v4 + 11680) = 2;
  *(void *)(v4 + 11640) = "pastel gray";
  *(_BYTE *)(v4 + 11632) = 2;
  *(void *)(v4 + 11648) = 11LL;
  *(_BYTE *)(v4 + 11656) = 2;
  *(void *)(v4 + 11616) = "pastel brown";
  *(void *)(v4 + 11600) = 11LL;
  *(_BYTE *)(v4 + 11608) = 2;
  *(void *)(v4 + 11624) = 12LL;
  *(void *)(v4 + 11000) = 17LL;
  *(void *)(v4 + 11592) = "pastel blue";
  *(void *)(v4 + 11576) = 11LL;
  *(_BYTE *)(v4 + 11584) = 2;
  *(void *)(v4 + 11544) = "papaya whip";
  *(_BYTE *)(v4 + 11536) = 2;
  *(void *)(v4 + 11552) = 11LL;
  *(_BYTE *)(v4 + 11560) = 2;
  *(void *)(v4 + 11520) = "pale violet red";
  *(void *)(v4 + 11504) = 10LL;
  *(_BYTE *)(v4 + 11512) = 2;
  *(void *)(v4 + 11528) = 15LL;
  *(_BYTE *)(v4 + 11008) = 2;
  *(void *)(v4 + 11496) = "pale taupe";
  *(void *)(v4 + 11480) = 11LL;
  *(_BYTE *)(v4 + 11488) = 2;
  *(void *)(v4 + 11016) = "oxford blue";
  *(void *)(v4 + 11456) = 19LL;
  *(_BYTE *)(v4 + 11464) = 2;
  *(void *)(v4 + 11472) = "pale silver";
  *(void *)(v4 + 11424) = "pale red violet";
  *(void *)(v4 + 11432) = 15LL;
  *(_BYTE *)(v4 + 11440) = 2;
  *(void *)(v4 + 11448) = "pale robin egg blue";
  *(_BYTE *)(v4 + 11392) = 2;
  *(void *)(v4 + 11400) = "pale plum";
  *(void *)(v4 + 11408) = 9LL;
  *(_BYTE *)(v4 + 11416) = 2;
  *(void *)(v4 + 11360) = 12LL;
  *(_BYTE *)(v4 + 11368) = 2;
  *(void *)(v4 + 11376) = "pale pink";
  *(void *)(v4 + 11384) = 9LL;
  *(void *)(v4 + 11024) = 11LL;
  *(void *)(v4 + 11336) = 13LL;
  *(_BYTE *)(v4 + 11344) = 2;
  *(void *)(v4 + 11352) = "pale magenta";
  *(void *)(v4 + 11304) = "pale green";
  *(void *)(v4 + 11312) = 10LL;
  *(_BYTE *)(v4 + 11320) = 2;
  *(void *)(v4 + 11328) = "pale lavender";
  *(_BYTE *)(v4 + 11272) = 2;
  *(void *)(v4 + 11280) = "pale goldenrod";
  *(void *)(v4 + 11288) = 14LL;
  *(_BYTE *)(v4 + 11296) = 2;
  *(void *)(v4 + 11240) = 20LL;
  *(_BYTE *)(v4 + 11248) = 2;
  *(void *)(v4 + 11256) = "pale gold";
  *(void *)(v4 + 11264) = 9LL;
  *(_BYTE *)(v4 + 11032) = 2;
  *(void *)(v4 + 11216) = 11LL;
  *(_BYTE *)(v4 + 11224) = 2;
  *(void *)(v4 + 11232) = "pale cornflower blue";
  *(void *)(v4 + 11040) = "pacific blue";
  *(void *)(v4 + 11192) = 13LL;
  *(_BYTE *)(v4 + 11200) = 2;
  *(void *)(v4 + 11208) = "pale copper";
  *(void *)(v4 + 11160) = "pale cerulean";
  *(void *)(v4 + 11168) = 13LL;
  *(_BYTE *)(v4 + 11176) = 2;
  *(void *)(v4 + 11184) = "pale chestnut";
  *(_BYTE *)(v4 + 11128) = 2;
  *(void *)(v4 + 11136) = "pale carmine";
  *(void *)(v4 + 11144) = 12LL;
  *(_BYTE *)(v4 + 11152) = 2;
  *(void *)(v4 + 11096) = 9LL;
  *(_BYTE *)(v4 + 11104) = 2;
  *(void *)(v4 + 11112) = "pale brown";
  *(void *)(v4 + 11120) = 10LL;
  *(void *)(v4 + 11048) = 12LL;
  *(void *)(v4 + 11072) = 9LL;
  *(_BYTE *)(v4 + 11080) = 2;
  *(void *)(v4 + 11088) = "pale blue";
  *(_BYTE *)(v4 + 11056) = 2;
  *(void *)(v4 + 11064) = "pale aqua";
  *(void *)(v4 + 14976) = "tan";
  *(void *)(v4 + 14984) = 3LL;
  *(_BYTE *)(v4 + 14992) = 2;
  *(void *)(v4 + 15000) = "tangelo";
  *(void *)(v4 + 15008) = 7LL;
  *(_BYTE *)(v4 + 15016) = 2;
  *(void *)(v4 + 15024) = "tangerine";
  *(void *)(v4 + 15032) = 9LL;
  *(_BYTE *)(v4 + 15040) = 2;
  *(void *)(v4 + 15048) = "tangerine yellow";
  *(void *)(v4 + 15056) = 16LL;
  *(_BYTE *)(v4 + 15064) = 2;
  *(void *)(v4 + 15072) = "taupe";
  *(void *)(v4 + 15080) = 5LL;
  *(_BYTE *)(v4 + 15088) = 2;
  *(void *)(v4 + 15096) = "taupe gray";
  *(void *)(v4 + 15104) = 10LL;
  *(_BYTE *)(v4 + 15112) = 2;
  *(void *)(v4 + 15120) = "tawny";
  *(void *)(v4 + 15128) = 5LL;
  *(_BYTE *)(v4 + 15136) = 2;
  *(void *)(v4 + 15144) = "tea green";
  *(void *)(v4 + 15152) = 9LL;
  *(_BYTE *)(v4 + 15160) = 2;
  *(void *)(v4 + 15168) = "tea rose";
  *(void *)(v4 + 15176) = 8LL;
  *(_BYTE *)(v4 + 15184) = 2;
  *(void *)(v4 + 15192) = "teal";
  *(void *)(v4 + 15200) = 4LL;
  *(_BYTE *)(v4 + 15208) = 2;
  *(void *)(v4 + 15216) = "teal blue";
  *(void *)(v4 + 15224) = 9LL;
  *(_BYTE *)(v4 + 15232) = 2;
  *(void *)(v4 + 15240) = "teal green";
  *(void *)(v4 + 15248) = 10LL;
  *(_BYTE *)(v4 + 15256) = 2;
  *(void *)(v4 + 15264) = "terra cotta";
  *(void *)(v4 + 15272) = 11LL;
  *(_BYTE *)(v4 + 15280) = 2;
  *(void *)(v4 + 15288) = "thistle";
  *(void *)(v4 + 15296) = 7LL;
  *(_BYTE *)(v4 + 15304) = 2;
  *(void *)(v4 + 15312) = "thulian pink";
  *(void *)(v4 + 15320) = 12LL;
  *(_BYTE *)(v4 + 15328) = 2;
  *(void *)(v4 + 15336) = "tiffany blue";
  *(void *)(v4 + 15344) = 12LL;
  *(_BYTE *)(v4 + 15352) = 2;
  *(void *)(v4 + 15360) = "tiger eye";
  *(void *)(v4 + 15368) = 9LL;
  *(_BYTE *)(v4 + 15376) = 2;
  *(void *)(v4 + 15384) = "timberwolf";
  *(void *)(v4 + 15392) = 10LL;
  *(_BYTE *)(v4 + 15400) = 2;
  *(void *)(v4 + 15408) = "titanium yellow";
  *(void *)(v4 + 15416) = 15LL;
  *(_BYTE *)(v4 + 15424) = 2;
  *(void *)(v4 + 15432) = "tomato";
  *(void *)(v4 + 15440) = 6LL;
  *(_BYTE *)(v4 + 15448) = 2;
  *(void *)(v4 + 15456) = "topaz";
  *(void *)(v4 + 15464) = 5LL;
  *(_BYTE *)(v4 + 15472) = 2;
  *(void *)(v4 + 15480) = "tractor red";
  *(void *)(v4 + 15488) = 11LL;
  *(_BYTE *)(v4 + 15496) = 2;
  *(void *)(v4 + 15504) = "trolley grey";
  *(void *)(v4 + 15512) = 12LL;
  *(_BYTE *)(v4 + 15520) = 2;
  *(void *)(v4 + 15528) = "tropical rain forest";
  *(void *)(v4 + 15536) = 20LL;
  *(_BYTE *)(v4 + 15544) = 2;
  *(void *)(v4 + 15552) = "true blue";
  *(void *)(v4 + 15560) = 9LL;
  *(_BYTE *)(v4 + 15568) = 2;
  *(void *)(v4 + 15576) = "tufts blue";
  *(void *)(v4 + 15584) = 10LL;
  *(_BYTE *)(v4 + 15592) = 2;
  *(void *)(v4 + 15600) = "tumbleweed";
  *(void *)(v4 + 15608) = 10LL;
  *(_BYTE *)(v4 + 15616) = 2;
  *(void *)(v4 + 15624) = "turkish rose";
  *(void *)(v4 + 15632) = 12LL;
  *(_BYTE *)(v4 + 15640) = 2;
  *(void *)(v4 + 15648) = "turquoise";
  *(void *)(v4 + 15656) = 9LL;
  *(_BYTE *)(v4 + 15664) = 2;
  *(void *)(v4 + 15672) = "turquoise blue";
  *(void *)(v4 + 15680) = 14LL;
  *(_BYTE *)(v4 + 15688) = 2;
  *(void *)(v4 + 15696) = "turquoise green";
  *(void *)(v4 + 15704) = 15LL;
  *(_BYTE *)(v4 + 15712) = 2;
  *(void *)(v4 + 15720) = "tuscan red";
  *(void *)(v4 + 15728) = 10LL;
  *(_BYTE *)(v4 + 15736) = 2;
  *(void *)(v4 + 15744) = "twilight lavender";
  *(void *)(v4 + 15752) = 17LL;
  *(_BYTE *)(v4 + 15760) = 2;
  *(void *)(v4 + 15768) = "tyrian purple";
  *(void *)(v4 + 15776) = 13LL;
  *(_BYTE *)(v4 + 15784) = 2;
  *(void *)(v4 + 15792) = "ua blue";
  *(void *)(v4 + 15800) = 7LL;
  *(_BYTE *)(v4 + 15808) = 2;
  *(void *)(v4 + 15816) = "ua red";
  *(void *)(v4 + 15824) = 6LL;
  *(_BYTE *)(v4 + 15832) = 2;
  *(void *)(v4 + 15840) = "ucla blue";
  *(void *)(v4 + 15848) = 9LL;
  *(_BYTE *)(v4 + 15856) = 2;
  *(void *)(v4 + 15864) = "ucla gold";
  *(void *)(v4 + 15872) = 9LL;
  *(_BYTE *)(v4 + 15880) = 2;
  *(void *)(v4 + 15888) = "ufo green";
  *(void *)(v4 + 15896) = 9LL;
  *(_BYTE *)(v4 + 15904) = 2;
  *(void *)(v4 + 15912) = "up forest green";
  *(void *)(v4 + 15920) = 15LL;
  *(_BYTE *)(v4 + 15928) = 2;
  *(void *)(v4 + 15936) = "up maroon";
  *(void *)(v4 + 15944) = 9LL;
  *(_BYTE *)(v4 + 15952) = 2;
  *(void *)(v4 + 15960) = "usc cardinal";
  *(void *)(v4 + 15968) = 12LL;
  *(_BYTE *)(v4 + 15976) = 2;
  *(void *)(v4 + 15984) = "usc gold";
  *(void *)(v4 + 15992) = 8LL;
  *(_BYTE *)(v4 + 16000) = 2;
  *(void *)(v4 + 16008) = "ube";
  *(void *)(v4 + 16016) = 3LL;
  *(_BYTE *)(v4 + 16024) = 2;
  *(void *)(v4 + 16032) = "ultra pink";
  *(void *)(v4 + 16040) = 10LL;
  *(_BYTE *)(v4 + 16048) = 2;
  *(void *)(v4 + 16056) = "ultramarine";
  *(void *)(v4 + 16064) = 11LL;
  *(_BYTE *)(v4 + 16072) = 2;
  *(void *)(v4 + 16080) = "ultramarine blue";
  *(void *)(v4 + 16088) = 16LL;
  *(_BYTE *)(v4 + 16096) = 2;
  *(void *)(v4 + 16104) = "umber";
  *(void *)(v4 + 16112) = 5LL;
  *(_BYTE *)(v4 + 16120) = 2;
  *(void *)(v4 + 16128) = "united nations blue";
  *(void *)(v4 + 16136) = 19LL;
  *(_BYTE *)(v4 + 16144) = 2;
  *(void *)(v4 + 16152) = "university of california gold";
  *(void *)(v4 + 16160) = 29LL;
  *(_BYTE *)(v4 + 16168) = 2;
  *(void *)(v4 + 16176) = "unmellow yellow";
  *(void *)(v4 + 16184) = 15LL;
  *(_BYTE *)(v4 + 16192) = 2;
  *(void *)(v4 + 16200) = "upsdell red";
  *(void *)(v4 + 16208) = 11LL;
  *(_BYTE *)(v4 + 16216) = 2;
  *(void *)(v4 + 16224) = "vanilla";
  *(void *)(v4 + 16232) = 7LL;
  *(_BYTE *)(v4 + 16240) = 2;
  *(void *)(v4 + 16248) = "vegas gold";
  *(void *)(v4 + 16256) = 10LL;
  *(_BYTE *)(v4 + 16264) = 2;
  *(void *)(v4 + 16272) = "venetian red";
  *(void *)(v4 + 16280) = 12LL;
  *(_BYTE *)(v4 + 16288) = 2;
  *(void *)(v4 + 16296) = "verdigris";
  *(void *)(v4 + 16304) = 9LL;
  *(_BYTE *)(v4 + 16312) = 2;
  *(void *)(v4 + 16320) = "vermilion";
  *(void *)(v4 + 16328) = 9LL;
  *(_BYTE *)(v4 + 16336) = 2;
  *(void *)(v4 + 16344) = "veronica";
  *(void *)(v4 + 16352) = 8LL;
  *(_BYTE *)(v4 + 16360) = 2;
  *(void *)(v4 + 16368) = "violet";
  *(void *)(v4 + 16376) = 6LL;
  *(_BYTE *)(v4 + 0x4000) = 2;
  *(void *)(v4 + 16392) = "violet blue";
  *(void *)(v4 + 16400) = 11LL;
  *(void *)(v4 + 7968) = "laurel green";
  *(_BYTE *)(v4 + 16408) = 2;
  *(void *)(v4 + 16416) = "violet red";
  *(void *)(v4 + 16424) = 10LL;
  *(_BYTE *)(v4 + 16432) = 2;
  *(void *)(v4 + 16440) = "viridian";
  *(void *)(v4 + 16448) = 8LL;
  *(_BYTE *)(v4 + 16456) = 2;
  *(void *)(v4 + 16464) = "vivid auburn";
  *(void *)(v4 + 16472) = 12LL;
  *(_BYTE *)(v4 + 16480) = 2;
  *(void *)(v4 + 16488) = "vivid burgundy";
  *(void *)(v4 + 16496) = 14LL;
  *(_BYTE *)(v4 + 16504) = 2;
  *(void *)(v4 + 16512) = "vivid cerise";
  *(void *)(v4 + 16520) = 12LL;
  *(_BYTE *)(v4 + 16528) = 2;
  *(void *)(v4 + 16536) = "vivid tangerine";
  *(void *)(v4 + 16544) = 15LL;
  *(_BYTE *)(v4 + 16552) = 2;
  *(void *)(v4 + 16560) = "vivid violet";
  *(void *)(v4 + 16568) = 12LL;
  *(_BYTE *)(v4 + 16576) = 2;
  *(void *)(v4 + 16584) = "warm black";
  *(void *)(v4 + 16592) = 10LL;
  *(_BYTE *)(v4 + 16600) = 2;
  *(void *)(v4 + 16608) = "waterspout";
  *(void *)(v4 + 16616) = 10LL;
  *(_BYTE *)(v4 + 16624) = 2;
  *(void *)(v4 + 16632) = "wenge";
  *(void *)(v4 + 16640) = 5LL;
  *(_BYTE *)(v4 + 16648) = 2;
  *(void *)(v4 + 16656) = "wheat";
  *(void *)(v4 + 16664) = 5LL;
  *(_BYTE *)(v4 + 16672) = 2;
  *(void *)(v4 + 16680) = "white";
  *(void *)(v4 + 16688) = 5LL;
  *(_BYTE *)(v4 + 16696) = 2;
  *(void *)(v4 + 16704) = "white smoke";
  *(void *)(v4 + 16712) = 11LL;
  *(_BYTE *)(v4 + 16720) = 2;
  *(void *)(v4 + 16728) = "wild strawberry";
  *(void *)(v4 + 16736) = 15LL;
  *(_BYTE *)(v4 + 16744) = 2;
  *(void *)(v4 + 16752) = "wild watermelon";
  *(void *)(v4 + 16760) = 15LL;
  *(_BYTE *)(v4 + 16768) = 2;
  *(void *)(v4 + 16776) = "wild blue yonder";
  *(void *)(v4 + 16784) = 16LL;
  *(_BYTE *)(v4 + 16792) = 2;
  *(void *)(v4 + 16800) = "wine";
  *(void *)(v4 + 16808) = 4LL;
  *(_BYTE *)(v4 + 16816) = 2;
  *(void *)(v4 + 16824) = "wisteria";
  *(void *)(v4 + 16832) = 8LL;
  *(_BYTE *)(v4 + 16840) = 2;
  *(void *)(v4 + 16848) = "xanadu";
  *(void *)(v4 + 16856) = 6LL;
  *(_BYTE *)(v4 + 16864) = 2;
  *(void *)(v4 + 16872) = "yale blue";
  *(void *)(v4 + 16880) = 9LL;
  *(_BYTE *)(v4 + 16888) = 2;
  *(void *)(v4 + 16896) = "yellow";
  *(void *)(v4 + 16904) = 6LL;
  *(_BYTE *)(v4 + 16912) = 2;
  *(void *)(v4 + 16920) = "yellow orange";
  *(void *)(v4 + 16928) = 13LL;
  *(_BYTE *)(v4 + 16936) = 2;
  *(void *)(v4 + 16944) = "yellow green";
  *(void *)(v4 + 16952) = 12LL;
  *(_BYTE *)(v4 + 16960) = 2;
  *(void *)(v4 + 16968) = "zaffre";
  *(void *)(v4 + 16976) = 6LL;
  *(_BYTE *)(v4 + 16984) = 2;
  *(void *)(v4 + 16992) = "zinnwaldite brown";
  *(void *)(v4 + 17000) = 17LL;
  *(_BYTE *)(v4 + 17008) = 2;
  *(void *)(v4 + 7976) = 12LL;
  v5._rawValue = (void *)nullsub_1(v10);
  v6._countAndFlagsBits = string;
  v6._object = object;
  unint64_t v7 = _findStringSwitchCase(cases:string:)(v5, v6);
  swift_bridgeObjectRelease(v5._rawValue);
  swift_bridgeObjectRelease(object);
  if (v7 < 0x80
    || v7 - 128 < 0x40
    || v7 - 192 < 0x40
    || v7 - 256 < 0x40
    || v7 - 320 < 0x40
    || v7 - 384 < 0x40
    || v7 - 448 < 0x40
    || v7 - 512 < 0x40)
  {
    return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
  }

  unint64_t v9 = v7 - 576;
  result.value = HomeAutomationSiriSuggestions_HueSemantic_sunset;
  LOWORD(v7) = 576;
  switch(v9)
  {
    case 0uLL:
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 1uLL:
      LOWORD(v7) = 577;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 2uLL:
      LOWORD(v7) = 578;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 3uLL:
      LOWORD(v7) = 579;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 4uLL:
      LOWORD(v7) = 580;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 5uLL:
      LOWORD(v7) = 581;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 6uLL:
      LOWORD(v7) = 582;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 7uLL:
      LOWORD(v7) = 583;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 8uLL:
      LOWORD(v7) = 584;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 9uLL:
      LOWORD(v7) = 585;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xAuLL:
      LOWORD(v7) = 586;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xBuLL:
      LOWORD(v7) = 587;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xCuLL:
      LOWORD(v7) = 588;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xDuLL:
      LOWORD(v7) = 589;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xEuLL:
      LOWORD(v7) = 590;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0xFuLL:
      LOWORD(v7) = 591;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x10uLL:
      LOWORD(v7) = 592;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x11uLL:
      LOWORD(v7) = 593;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x12uLL:
      LOWORD(v7) = 594;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x13uLL:
      LOWORD(v7) = 595;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x14uLL:
      LOWORD(v7) = 596;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x15uLL:
      LOWORD(v7) = 597;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x16uLL:
      LOWORD(v7) = 598;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x17uLL:
      LOWORD(v7) = 599;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x18uLL:
      LOWORD(v7) = 600;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x19uLL:
      LOWORD(v7) = 601;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1AuLL:
      LOWORD(v7) = 602;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1BuLL:
      LOWORD(v7) = 603;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1CuLL:
      LOWORD(v7) = 604;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1DuLL:
      LOWORD(v7) = 605;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1EuLL:
      LOWORD(v7) = 606;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x1FuLL:
      LOWORD(v7) = 607;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x20uLL:
      LOWORD(v7) = 608;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x21uLL:
      LOWORD(v7) = 609;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x22uLL:
      LOWORD(v7) = 610;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x23uLL:
      LOWORD(v7) = 611;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x24uLL:
      LOWORD(v7) = 612;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x25uLL:
      LOWORD(v7) = 613;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x26uLL:
      LOWORD(v7) = 614;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x27uLL:
      LOWORD(v7) = 615;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x28uLL:
      LOWORD(v7) = 616;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x29uLL:
      LOWORD(v7) = 617;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x2AuLL:
      LOWORD(v7) = 618;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x2BuLL:
      LOWORD(v7) = 619;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x2CuLL:
      LOWORD(v7) = 620;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x2DuLL:
      LOWORD(v7) = 621;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v7;
    case 0x2EuLL:
      return result;
    case 0x2FuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_sunset_orange;
      break;
    case 0x30uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tan;
      break;
    case 0x31uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangelo;
      break;
    case 0x32uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangerine;
      break;
    case 0x33uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangerine_yellow;
      break;
    case 0x34uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_taupe;
      break;
    case 0x35uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_taupe_gray;
      break;
    case 0x36uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tawny;
      break;
    case 0x37uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tea_green;
      break;
    case 0x38uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tea_rose;
      break;
    case 0x39uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal;
      break;
    case 0x3AuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal_blue;
      break;
    case 0x3BuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal_green;
      break;
    case 0x3CuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_terra_cotta;
      break;
    case 0x3DuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_thistle;
      break;
    case 0x3EuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_thulian_pink;
      break;
    case 0x3FuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tiffany_blue;
      break;
    default:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_unknownDefault;
      break;
  }

  return result;
}

_UNKNOWN **static HueSemantic.allCases.getter()
{
  return &off_418B8;
}

void sub_10DA4(unsigned __int16 *a1, unsigned __int16 *a2)
{
}

void sub_10DB0()
{
}

uint64_t sub_10DB8(uint64_t a1)
{
  return sub_13B50(a1, *v1);
}

void sub_10DC0(uint64_t a1)
{
}

HomeAutomationSiriSuggestions::HueSemantic_optional sub_10DC8@<W0>( Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::HueSemantic_optional *a2@<X8>)
{
  result.value = HueSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_10DF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HueSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10E1C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return static HueSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_10E28(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_13C58(*a1, *a2);
}

BOOL sub_10E34(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_13CB8(*a1, *a2);
}

uint64_t sub_10E40(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_13D34(*a1, *a2);
}

void sub_10E4C(void *a1@<X8>)
{
  *a1 = &off_418B8;
}

uint64_t sub_10E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1125C();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1125C();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10F04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_111E4();
  unint64_t v5 = sub_11220();
  unint64_t v6 = sub_1125C();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_10F68()
{
  unint64_t result = qword_490D8;
  if (!qword_490D8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_490D8);
  }

  return result;
}

unint64_t sub_10FA8()
{
  unint64_t result = qword_490E0;
  if (!qword_490E0)
  {
    uint64_t v1 = sub_6844(&qword_490E8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_490E0);
  }

  return result;
}

unint64_t sub_10FF0()
{
  unint64_t result = qword_490F0;
  if (!qword_490F0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_490F0);
  }

  return result;
}

unint64_t sub_11030()
{
  unint64_t result = qword_490F8;
  if (!qword_490F8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_490F8);
  }

  return result;
}

_WORD *initializeBufferWithCopyOfBuffer for HueSemantic(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HueSemantic(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFD3C)
  {
    if (a2 + 708 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 708 < 0xFF0000) {
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
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((_BYTE *)a1 + 2)) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 16)) - 709;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for HueSemantic(_WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 708 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 708 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD3C) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (a2 <= 0xFD3B) {
    return ((uint64_t (*)(void))((char *)&loc_11150 + 4 * byte_30C0F[v5]))();
  }
  *a1 = a2 + 708;
  return ((uint64_t (*)(void))((char *)sub_11188 + 4 * byte_30C0A[v5]))();
}

uint64_t sub_11188(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_11190(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x11198LL);
  }
  return result;
}

uint64_t sub_111A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x111ACLL);
  }
  *(_WORD *)unint64_t result = a2 + 708;
  return result;
}

uint64_t sub_111B0(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_111B8(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_111C4(unsigned __int16 *a1)
{
  return *a1;
}

_WORD *sub_111CC(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HueSemantic()
{
  return &type metadata for HueSemantic;
}

unint64_t sub_111E4()
{
  unint64_t result = qword_49100;
  if (!qword_49100)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_49100);
  }

  return result;
}

unint64_t sub_11220()
{
  unint64_t result = qword_49108;
  if (!qword_49108)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_49108);
  }

  return result;
}

unint64_t sub_1125C()
{
  unint64_t result = qword_49110;
  if (!qword_49110)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HueSemantic, &type metadata for HueSemantic);
    atomic_store(result, (unint64_t *)&qword_49110);
  }

  return result;
}

uint64_t sub_11298(unsigned int a1)
{
  return a1 | 0x616C622000000000LL;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_112EC(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x7261000000000000LL;
}

uint64_t sub_112F4()
{
  return 0x206E616973726570LL;
}

uint64_t sub_11308(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x7220000000000000LL;
}

uint64_t sub_11310()
{
  return 0x7265646E6576616CLL;
}

uint64_t sub_11324(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6970000000000000LL;
}

uint64_t sub_1132C(unsigned int a1)
{
  return a1 | 0x6C6F672000000000LL;
}

  ;
}

uint64_t sub_11340(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000LL;
}

uint64_t sub_11348(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x726F000000000000LL;
}

  ;
}

  ;
}

uint64_t sub_11364(unsigned int a1)
{
  return a1 | 0x6165702000000000LL;
}

uint64_t sub_11370(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6C62000000000000LL;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_11390(unsigned int a1)
{
  return a1 | 0x7561742000000000LL;
}

uint64_t sub_1139C(unsigned int a1)
{
  return a1 | 0x6565726700000000LL;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_113C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_4D88(&qword_49188);
  *(void *)(v4 + 56) = sub_11BBC(v5);
  *(void *)(v4 + 64) = sub_11C5C();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_11408()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_4D88(&qword_49190);
  int v3 = (__n128 *)sub_11C70(v2);
  v0[9] = v3;
  sub_11B78(v3, (__n128)xmmword_30590);
  sub_11C54(v1, v4, &qword_49188);
  uint64_t v5 = sub_11CE4();
  uint64_t v6 = sub_11BF8(v5);
  if (v7)
  {
    sub_11C44(v6, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[4].n128_u64[1] = v1;
    uint64_t v8 = sub_11C4C();
    sub_11AF8((uint64_t)v8);
  }

  uint64_t v9 = sub_11B0C();
  sub_11C54(v9, v10, &qword_49188);
  uint64_t v11 = sub_11C20();
  if (v7)
  {
    sub_11C44(v11, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[7].n128_u64[1] = v1;
    uint64_t v12 = sub_11C4C();
    sub_11AF8((uint64_t)v12);
  }

  uint64_t v13 = sub_11B9C();
  if (v1)
  {
    uint64_t v13 = type metadata accessor for HomeAutomationEntityStateValue(v13);
  }

  else
  {
    v3[9].n128_u64[1] = 0LL;
    v3[10].n128_u64[0] = 0LL;
  }

  v3[9].n128_u64[0] = v1;
  v3[10].n128_u64[1] = v13;
  sub_11BE0();
  uint64_t v14 = (void *)sub_11CEC();
  v0[10] = v14;
  sub_11C94(v14);
  sub_11CD4();
  sub_11CBC();
  return sub_11B64(v15, v16, v17, v18, v19);
}

uint64_t sub_11520()
{
  if (v0)
  {
    sub_11C7C();
    return sub_11BD4();
  }

  else
  {
    sub_11C64();
    sub_11CCC();
    sub_11CB4();
    return sub_11B38(*(uint64_t (**)(void))(v1 + 8));
  }

uint64_t sub_1156C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_4D88(&qword_49188);
  *(void *)(v4 + 56) = sub_11BBC(v5);
  *(void *)(v4 + 64) = sub_11C5C();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_115B4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_4D88(&qword_49190);
  int v3 = (__n128 *)sub_11C70(v2);
  v0[9] = v3;
  sub_11B78(v3, (__n128)xmmword_30590);
  sub_11C54(v1, v4, &qword_49188);
  uint64_t v5 = sub_11CE4();
  uint64_t v6 = sub_11BF8(v5);
  if (v7)
  {
    sub_11C44(v6, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[4].n128_u64[1] = v1;
    uint64_t v8 = sub_11C4C();
    sub_11AF8((uint64_t)v8);
  }

  uint64_t v9 = sub_11B0C();
  sub_11C54(v9, v10, &qword_49188);
  uint64_t v11 = sub_11C20();
  if (v7)
  {
    sub_11C44(v11, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[7].n128_u64[1] = v1;
    uint64_t v12 = sub_11C4C();
    sub_11AF8((uint64_t)v12);
  }

  uint64_t v13 = sub_11B9C();
  if (v1)
  {
    uint64_t v13 = type metadata accessor for HomeAutomationEntityStateValue(v13);
  }

  else
  {
    v3[9].n128_u64[1] = 0LL;
    v3[10].n128_u64[0] = 0LL;
  }

  v3[9].n128_u64[0] = v1;
  v3[10].n128_u64[1] = v13;
  sub_11BE0();
  uint64_t v14 = (void *)sub_11CEC();
  v0[10] = v14;
  sub_11C94(v14);
  sub_11CD4();
  sub_11CBC();
  return sub_11B64(v15, v16, v17, v18, v19);
}

uint64_t sub_116CC()
{
  if (v0)
  {
    sub_11C7C();
    return sub_11BD4();
  }

  else
  {
    sub_11C64();
    sub_11CCC();
    sub_11CB4();
    return sub_11B38(*(uint64_t (**)(void))(v1 + 8));
  }

uint64_t sub_11718()
{
  return sub_11B38(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_11750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_4D88(&qword_49188);
  *(void *)(v4 + 56) = sub_11BBC(v5);
  *(void *)(v4 + 64) = sub_11C5C();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_11798()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_4D88(&qword_49190);
  int v3 = (__n128 *)sub_11C70(v2);
  v0[9] = v3;
  sub_11B78(v3, (__n128)xmmword_30590);
  sub_11C54(v1, v4, &qword_49188);
  uint64_t v5 = sub_11CE4();
  uint64_t v6 = sub_11BF8(v5);
  if (v7)
  {
    sub_11C44(v6, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[4].n128_u64[1] = v1;
    uint64_t v8 = sub_11C4C();
    sub_11AF8((uint64_t)v8);
  }

  uint64_t v9 = sub_11B0C();
  sub_11C54(v9, v10, &qword_49188);
  uint64_t v11 = sub_11C20();
  if (v7)
  {
    sub_11C44(v11, &qword_49188);
    sub_11C88();
  }

  else
  {
    v3[7].n128_u64[1] = v1;
    uint64_t v12 = sub_11C4C();
    sub_11AF8((uint64_t)v12);
  }

  uint64_t v13 = sub_11B9C();
  if (v1)
  {
    uint64_t v13 = type metadata accessor for HomeAutomationEntityStateValue(v13);
  }

  else
  {
    v3[9].n128_u64[1] = 0LL;
    v3[10].n128_u64[0] = 0LL;
  }

  v3[9].n128_u64[0] = v1;
  v3[10].n128_u64[1] = v13;
  sub_11BE0();
  uint64_t v14 = (void *)sub_11CEC();
  v0[10] = v14;
  sub_11C94(v14);
  sub_11CD4();
  sub_11CBC();
  return sub_11B64(v15, v16, v17, v18, v19);
}

uint64_t HomeSuggestionCATs.__allocating_init(templateDir:options:globals:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return HomeSuggestionCATs.init(templateDir:options:globals:)(a1, a2, a3);
}

uint64_t HomeSuggestionCATs.init(templateDir:options:globals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4D88(&qword_49118);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_11AB0(a1, (uint64_t)v12, &qword_49118);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v13 = CATWrapper.init(templateDir:options:globals:)(v12, v9, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_61B8(a1, &qword_49118);
  return v13;
}

uint64_t HomeSuggestionCATs.__deallocating_deinit()
{
  uint64_t v0 = _s29HomeAutomationSiriSuggestions0A14SuggestionCATsCfd_0();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for HomeSuggestionCATs(uint64_t a1)
{
  uint64_t result = qword_49120;
  if (!qword_49120) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HomeSuggestionCATs);
  }
  return result;
}

uint64_t sub_11A6C(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + class metadata base offset for HomeSuggestionCATs);
}

uint64_t sub_11AA8()
{
  return type metadata accessor for HomeSuggestionCATs(0LL);
}

uint64_t sub_11AB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4D88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_11AF8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))(a1, v2, v1);
}

uint64_t sub_11B0C()
{
  uint64_t result = *(void *)(v0 + 32);
  *(void *)(v1 + 80) = 0x7475626972747461LL;
  *(void *)(v1 + 88) = 0xE900000000000065LL;
  return result;
}

uint64_t sub_11B38(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_11B44()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 80);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 88) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_11B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

__n128 *sub_11B78(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x656D614E6D6F6F72LL;
  result[2].n128_u64[1] = 0xE800000000000000LL;
  return result;
}

uint64_t sub_11B9C()
{
  *(void *)(v0 + 128) = 0x65756C6176LL;
  *(void *)(v0 + 136) = 0xE500000000000000LL;
  return 0LL;
}

uint64_t sub_11BBC(uint64_t a1)
{
  return swift_task_alloc((*(void *)(*(void *)(a1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_11BD4()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_11BE0()
{
  return swift_retain(v0);
}

uint64_t sub_11BF8(uint64_t a1)
{
  return sub_61F4(v1, 1LL, a1);
}

uint64_t sub_11C20()
{
  return sub_61F4(v1, 1LL, v0);
}

uint64_t sub_11C44(uint64_t a1, uint64_t *a2)
{
  return sub_61B8(v2, a2);
}

void *sub_11C4C()
{
  return sub_6128(v0);
}

uint64_t sub_11C54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_11AB0(a1, v3, a3);
}

uint64_t sub_11C5C()
{
  return swift_task_alloc(v0);
}

uint64_t sub_11C64()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 72));
}

uint64_t sub_11C70(uint64_t a1)
{
  return swift_allocObject(a1, 176LL, 7LL);
}

  ;
}

double sub_11C88()
{
  double result = 0.0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_11C94(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 16);
}

uint64_t sub_11CA4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = result;
  return result;
}

uint64_t sub_11CB4()
{
  return swift_task_dealloc(v0);
}

  ;
}

uint64_t sub_11CCC()
{
  return swift_task_dealloc(v0);
}

  ;
}

uint64_t sub_11CE4()
{
  return type metadata accessor for SpeakableString(0LL);
}

uint64_t sub_11CEC()
{
  return swift_task_alloc(v0);
}

uint64_t sub_11CF4()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4C9D0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setColor(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_11D40()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4C9E8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24940();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for SetColorSuggestion()
{
  return &type metadata for SetColorSuggestion;
}

uint64_t sub_11DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v11 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48CC0 != -1) {
    swift_once(&qword_48CC0, sub_11CF4);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  sub_4D70(v4, (uint64_t)qword_4C9D0);
  uint64_t v5 = HomeSuggestionType.rawValue.getter();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v8, 40LL);
  uint64_t v9 = sub_15E34(v5, v7);
  v12[3] = v8;
  v12[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v12, v3, v11);
  return sub_6108(v12);
}

uint64_t sub_11EDC@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v68.n128_u64[0] = a1;
  uint64_t v69 = a2;
  v71.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v70 = *(void *)(v71.n128_u64[0] - 8);
  __chkstk_darwin(v71.n128_u64[0]);
  v73.n128_u64[0] = (unint64_t)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v67 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 3 * v67, v10 | 7);
  uint64_t v74 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30590;
  uint64_t v13 = v12 + v11;
  uint64_t v72 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v72(v6, enum case for SuggestionParameter.roomName(_:), v3);
  uint64_t v14 = type metadata accessor for RoomNameResolver();
  sub_1251C(v14, 32LL);
  uint64_t v15 = sub_1B2BC();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  v16[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *uint64_t v16 = v15;
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v63 = v3;
  v66(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  uint64_t v17 = sub_4D88(&qword_49060);
  uint64_t v64 = (char *)&type metadata for Any + 8;
  uint64_t v65 = v17;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v18 = v67;
  uint64_t v19 = v13 + v67;
  sub_8BE0();
  uint64_t v20 = type metadata accessor for AttributeResolver();
  sub_1251C(v20, 40LL);
  uint64_t v21 = sub_26ED0();
  uint64_t v22 = (void *)(v19 + v8[5]);
  v22[3] = v20;
  v22[4] = sub_825C( &qword_49198,  (uint64_t (*)(uint64_t))type metadata accessor for AttributeResolver,  (uint64_t)&unk_31B94);
  *uint64_t v22 = v21;
  uint64_t v23 = v63;
  uint64_t v24 = v66;
  v66(v13 + v18, v6, v63);
  *(_BYTE *)(v19 + v8[6]) = 1;
  *(_BYTE *)(v19 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v25 = v13 + 2 * v18;
  uint64_t v26 = v23;
  sub_8BE0();
  uint64_t v27 = type metadata accessor for ValueResolver();
  sub_1251C(v27, 64LL);
  uint64_t v28 = sub_23868();
  uint64_t v29 = (void *)(v25 + v8[5]);
  v29[3] = v27;
  v29[4] = sub_825C( &qword_491A0,  (uint64_t (*)(uint64_t))type metadata accessor for ValueResolver,  (uint64_t)&unk_3190C);
  *uint64_t v29 = v28;
  v24(v25, v6, v26);
  uint64_t v30 = v25;
  *(_BYTE *)(v25 + v8[6]) = 0;
  *(_BYTE *)(v25 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, v64, v65);
  sub_6F90(v68.n128_i64[0], (uint64_t)&v76);
  LODWORD(v6) = *(unsigned __int8 *)(v13 + v8[7]);
  uint64_t v31 = type metadata accessor for ResolvableParameter(0LL);
  uint64_t v32 = swift_bridgeObjectRetain(v74);
  SuggestionParameter.rawValue.getter(v32);
  sub_8BA8();
  uint64_t v34 = *(unsigned __int8 *)(v13 + v33);
  BOOL v35 = (_DWORD)v6 == 1;
  unint64_t v36 = v73.n128_u64[0];
  uint64_t v72 = (void (*)(char *, void, uint64_t))v31;
  if (v35)
  {
    (*(void (**)(unint64_t, uint64_t, unint64_t))(v70 + 16))( v73.n128_u64[0],  v13 + v8[8],  v71.n128_u64[0]);
    ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v13, v26, v34, v36);
  }

  else
  {
    ResolvableParameter.__allocating_init(typeIdentifier:required:)(v13, v26, v34);
  }

  __n128 v68 = v77;
  uint64_t v37 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v37);
  uint64_t v39 = v38;
  sub_8BFC(v13 + v8[5]);
  sub_82F8(v68);
  uint64_t v40 = sub_8BD0();
  sub_8B40(v40, v39, v41);
  sub_8BF4();
  swift_bridgeObjectRelease(v39);
  sub_8BEC();
  uint64_t v42 = sub_6108(v75);
  char v43 = *(_BYTE *)(v19 + v8[7]);
  SuggestionParameter.rawValue.getter(v42);
  sub_8BA8();
  if ((v43 & 1) != 0)
  {
    uint64_t v44 = sub_8BB8();
    v45(v44);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v71 = v77;
  uint64_t v46 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v46);
  uint64_t v48 = v47;
  sub_8BFC(v19 + v8[5]);
  sub_82F8(v71);
  uint64_t v49 = sub_8BD0();
  sub_8B40(v49, v48, v50);
  sub_8BF4();
  swift_bridgeObjectRelease(v48);
  sub_8BEC();
  uint64_t v51 = sub_6108(v75);
  char v52 = *(_BYTE *)(v30 + v8[7]);
  SuggestionParameter.rawValue.getter(v51);
  sub_8BA8();
  if ((v52 & 1) != 0)
  {
    uint64_t v53 = sub_8BB8();
    v54(v53);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v73 = v77;
  __n128 v55 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v55);
  uint64_t v57 = v56;
  sub_8BFC(v30 + v8[5]);
  sub_82F8(v73);
  uint64_t v58 = sub_8BD0();
  sub_8B40(v58, v57, v59);
  sub_8BF4();
  swift_bridgeObjectRelease(v57);
  sub_8BEC();
  sub_6108(v75);
  uint64_t v60 = v74;
  swift_bridgeObjectRelease(v74);
  sub_7014(&v76, v69);
  swift_setDeallocating(v60);
  return sub_1E9F4();
}

uint64_t sub_1251C(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t AccessoryTypeSemantic.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1255C + 4 * word_30E50[a1]))( 0xD000000000000011LL,  0x80000000000321F0LL);
}

uint64_t sub_1255C()
{
  return 0x6C7562746867696CLL;
}

uint64_t sub_12578()
{
  return 0x6B636F4C726F6F64LL;
}

uint64_t sub_12590()
{
  return 0x6172656D61437069LL;
}

uint64_t sub_125A8()
{
  return 0x65526172656D6163LL;
}

uint64_t sub_125CC(uint64_t a1)
{
  return a1 - 1;
}

uint64_t sub_12A50()
{
  return 0x706F4D746F626F72LL;
}

uint64_t static AccessoryTypeSemantic.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v3 = AccessoryTypeSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  uint64_t v6 = AccessoryTypeSemantic.rawValue.getter(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 0;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 1LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional __swiftcall AccessoryTypeSemantic.init(rawValue:)( Swift::String rawValue)
{
  object = rawValue._object;
  unint64_t v2 = _findStringSwitchCaseWithCache(cases:string:cache:)( &off_41F90,  rawValue._countAndFlagsBits,  rawValue._object,  &unk_48E10);
  swift_bridgeObjectRelease(object);
  if (v2 >= 0x34) {
    return (HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional)52;
  }
  else {
    return (HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional)v2;
  }
}

_UNKNOWN **static AccessoryTypeSemantic.allCases.getter()
{
  return &off_42490;
}

void sub_12B48(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_12B54()
{
}

uint64_t sub_12B5C(uint64_t a1)
{
  return sub_13A74(a1, *v1);
}

void sub_12B64(uint64_t a1)
{
}

HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional sub_12B6C@<W0>( Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional *a2@<X8>)
{
  result.value = AccessoryTypeSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_12B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AccessoryTypeSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_12BC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static AccessoryTypeSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_12BCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13C74(*a1, *a2);
}

BOOL sub_12BD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13D1C(*a1, *a2);
}

uint64_t sub_12BE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13D74(*a1, *a2);
}

void sub_12BF0(void *a1@<X8>)
{
  *a1 = &off_42490;
}

uint64_t sub_12C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_12FDC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_12C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_12FDC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_12CA8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_12F64();
  unint64_t v5 = sub_12FA0();
  unint64_t v6 = sub_12FDC();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_12D0C()
{
  unint64_t result = qword_491A8;
  if (!qword_491A8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491A8);
  }

  return result;
}

unint64_t sub_12D4C()
{
  unint64_t result = qword_491B0;
  if (!qword_491B0)
  {
    uint64_t v1 = sub_6844(&qword_491B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_491B0);
  }

  return result;
}

unint64_t sub_12D94()
{
  unint64_t result = qword_491C0;
  if (!qword_491C0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491C0);
  }

  return result;
}

unint64_t sub_12DD4()
{
  unint64_t result = qword_491C8;
  if (!qword_491C8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491C8);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for AccessoryTypeSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xCD)
  {
    if (a2 + 51 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 51) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 52;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for AccessoryTypeSemantic(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 51 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 51) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xCD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xCC) {
    return ((uint64_t (*)(void))((char *)&loc_12EE4 + 4 * byte_30EBD[v4]))();
  }
  *a1 = a2 + 51;
  return ((uint64_t (*)(void))((char *)sub_12F18 + 4 * byte_30EB8[v4]))();
}

uint64_t sub_12F18(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_12F20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x12F28LL);
  }
  return result;
}

uint64_t sub_12F34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x12F3CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 51;
  return result;
}

uint64_t sub_12F40(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_12F48(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccessoryTypeSemantic()
{
  return &type metadata for AccessoryTypeSemantic;
}

unint64_t sub_12F64()
{
  unint64_t result = qword_491D0;
  if (!qword_491D0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491D0);
  }

  return result;
}

unint64_t sub_12FA0()
{
  unint64_t result = qword_491D8;
  if (!qword_491D8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491D8);
  }

  return result;
}

unint64_t sub_12FDC()
{
  unint64_t result = qword_491E0;
  if (!qword_491E0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AccessoryTypeSemantic,  &type metadata for AccessoryTypeSemantic);
    atomic_store(result, (unint64_t *)&qword_491E0);
  }

  return result;
}

uint64_t sub_13018(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[6] = swift_task_alloc(v6);
  v3[7] = swift_task_alloc(v6);
  return swift_task_switch(sub_13088, 0LL, 0LL);
}

uint64_t sub_13088()
{
  __int16 v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[8] = v4;
  v0[9] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[10] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_135CC();
}

uint64_t sub_13100()
{
  uint64_t v1 = v0[8];
  sub_251E0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  swift_unknownObjectRelease(v1);
  v0[11] = v3;
  v0[12] = v5;
  return sub_135CC();
}

uint64_t sub_13150()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = sub_4D70(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v29._countAndFlagsBits = 0xD000000000000013LL;
    v29._object = (void *)0x8000000000032910LL;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain(v9);
    v10._countAndFlagsBits = v8;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(v9);
    v11._countAndFlagsBits = 544175136LL;
    v11._object = (void *)0xE400000000000000LL;
    String.append(_:)(v11);
    v12._countAndFlagsBits = v2;
    v12._object = v1;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0xD000000000000013LL;
    v14._object = (void *)0x8000000000035110LL;
    v13._object = (void *)0x8000000000032910LL;
    v14._countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v13, 0, v14);
    swift_bridgeObjectRelease(0x8000000000032910LL);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v15 = sub_4D88(&qword_48EF0);
    uint64_t v16 = (_OWORD *)swift_allocObject(v15, 64LL, 7LL);
    v16[1] = xmmword_2FE90;
    *((void *)v16 + 7) = &type metadata for String;
    *((void *)v16 + 4) = v2;
    *((void *)v16 + 5) = v1;
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v18 = *(void *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v20 = *(void *)(v0 + 24);
    uint64_t v19 = *(void *)(v0 + 32);
    uint64_t v21 = sub_4D70(v19, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v21, v19);
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    strcpy((char *)&v29, "Couldn't find ");
    HIBYTE(v29._object) = -18;
    uint64_t v22 = *(void *)(v20 + 16);
    uint64_t v23 = *(void **)(v20 + 24);
    swift_bridgeObjectRetain(v23);
    v24._countAndFlagsBits = v22;
    v24._object = v23;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(v23);
    v25._countAndFlagsBits = 0xD00000000000003FLL;
    v26._object = (void *)0x8000000000035110LL;
    v25._object = (void *)0x8000000000035190LL;
    v26._countAndFlagsBits = 0xD00000000000007CLL;
    Logger.warning(output:test:file:function:line:)(v29, 0, v26, v25, 19LL);
    swift_bridgeObjectRelease(v29._object);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v16 = &_swiftEmptyArrayStorage;
  }

  uint64_t v27 = *(void *)(v0 + 48);
  swift_task_dealloc(*(void *)(v0 + 56));
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v16);
}

uint64_t type metadata accessor for ContainerNameResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions21ContainerNameResolver);
}

uint64_t sub_13450()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.containerName(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_134F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_492A4);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_13018((uint64_t)v4, a2);
}

uint64_t sub_13548()
{
  return sub_13590((unint64_t *)&unk_49288, (uint64_t)&unk_310D8);
}

uint64_t sub_1356C()
{
  return sub_13590(&qword_49298, (uint64_t)&unk_31100);
}

uint64_t sub_13590(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for ContainerNameResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_135CC()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_135DC()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CA00);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfTemperature(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_13628()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CA18);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_2495C();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfTemperature()
{
  return &type metadata for GetStateOfTemperature;
}

uint64_t sub_13694@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&__int128 v38 = a1;
  uint64_t v39 = a2;
  uint64_t v37 = sub_4D88(&qword_49048);
  uint64_t v36 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_4D88(&qword_49050);
  uint64_t v9 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = swift_allocObject(v8, v13 + v11, v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_2FE90;
  uint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for SuggestionParameter.roomName(_:), v4);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject(v16, 32LL, 7LL);
  uint64_t v17 = sub_1B2BC();
  uint64_t v18 = (uint64_t *)(v15 + v9[5]);
  v18[3] = v16;
  v18[4] = sub_90A4();
  *uint64_t v18 = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v15, v7, v4);
  *(_BYTE *)(v15 + v9[6]) = 1;
  *(_BYTE *)(v15 + v9[7]) = 0;
  uint64_t v19 = sub_4D88(&qword_49060);
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v19);
  sub_6F90(v38, (uint64_t)&v44);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v9[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v20 = swift_bridgeObjectRetain(v14);
  uint64_t v21 = SuggestionParameter.rawValue.getter(v20);
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t v25 = v9[6];
  uint64_t v26 = *(unsigned __int8 *)(v15 + v25);
  if ((_DWORD)v16 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v3, v15 + v9[8], v37);
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v23, v24, v26, v3);
  }

  else
  {
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v21, v22, *(unsigned __int8 *)(v15 + v25));
  }

  uint64_t v28 = v27;
  uint64_t v29 = v46;
  __int128 v38 = v45;
  uint64_t v30 = v45;
  uint64_t v31 = sub_4D4C(&v44, v45);
  uint64_t v32 = SuggestionParameter.rawValue.getter(v31);
  uint64_t v34 = v33;
  sub_60C4(v15 + v9[5], (uint64_t)v40);
  __int128 v42 = v38;
  uint64_t v43 = v29;
  sub_6128(v41);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v34, v40, v28, v30, v29);
  swift_release(v28);
  swift_bridgeObjectRelease(v34);
  sub_6FD4((uint64_t)v40);
  sub_6108(v41);
  swift_bridgeObjectRelease(v14);
  sub_7014(&v44, v39);
  swift_setDeallocating(v14);
  return sub_1E9F4();
}

void sub_139C8(uint64_t a1)
{
  uint64_t v1 = sub_149BC(a1);
  sub_149C8((uint64_t)v1);
  sub_149AC();
  sub_14964();
}

void sub_139F0(uint64_t a1)
{
}

void sub_139FC(uint64_t a1)
{
  unsigned __int16 v1 = a1;
  sub_149BC(a1);
  uint64_t v2 = HueSemantic.rawValue.getter(v1);
  sub_1494C(v2, v3, v4);
  sub_149B4();
  sub_149AC();
  sub_14964();
}

void sub_13A30(uint64_t a1)
{
}

void sub_13A3C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a2(a1);
  sub_1494C(v4, v5, v6);
  sub_149B4();
  sub_149AC();
  sub_14964();
}

uint64_t sub_13A74(uint64_t a1, uint64_t a2)
{
  return sub_13A8C(a1, a2, (uint64_t (*)(uint64_t))AccessoryTypeSemantic.rawValue.getter);
}

uint64_t sub_13A80(uint64_t a1, uint64_t a2)
{
  return sub_13A8C(a1, a2, (uint64_t (*)(uint64_t))StateSemantic.rawValue.getter);
}

uint64_t sub_13A8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = a3(a2);
  sub_14984(v4, v5);
  return sub_14970(v3);
}

void sub_13AB4(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_13AF8(uint64_t a1)
{
  return sub_14970(0xE700000000000000LL);
}

uint64_t sub_13B50(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v3 = HueSemantic.rawValue.getter(a2);
  sub_14984(v3, v4);
  return sub_14970(v2);
}

void sub_13B78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = HueSemantic.rawValue.getter(v2);
  sub_1494C(v3, v4, v5);
  sub_149B4();
  sub_149AC();
  sub_14964();
}

void sub_13BA8(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = sub_149D4(a1, a2);
  sub_149C8((uint64_t)v2);
  sub_149AC();
  sub_14964();
}

void sub_13BCC(uint64_t a1, uint64_t a2)
{
}

void sub_13BD8(uint64_t a1, uint64_t a2)
{
}

void sub_13BE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = a3(a2);
  sub_1494C(v5, v6, v7);
  sub_149B4();
  sub_149AC();
  sub_14964();
}

BOOL sub_13C20(uint64_t a1, uint64_t a2)
{
  char v2 = sub_1499C(a1, a2);
  static UnitSemantic.< infix(_:_:)(v2);
  return sub_14978(v3);
}

BOOL sub_13C3C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_1499C(a1, a2);
  char v4 = static StateSemantic.< infix(_:_:)(v2, v3);
  return sub_14978(v4);
}

BOOL sub_13C58(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = sub_1499C(a1, a2);
  char v4 = static HueSemantic.< infix(_:_:)(v2, v3);
  return sub_14978(v4);
}

BOOL sub_13C74(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_1499C(a1, a2);
  char v4 = static AccessoryTypeSemantic.< infix(_:_:)(v2, v3);
  return sub_14978(v4);
}

BOOL sub_13C90(unsigned __int8 a1, unsigned __int8 a2)
{
  return (static AttributeSemantic.< infix(_:_:)(a2, a1) & 1) == 0;
}

BOOL sub_13CB8(unsigned __int16 a1, unsigned __int16 a2)
{
  char v2 = static HueSemantic.< infix(_:_:)(a1, a2);
  return sub_14978(v2);
}

BOOL sub_13CD0(char a1)
{
  return sub_14978(v1);
}

BOOL sub_13CE8(unsigned __int8 a1, unsigned __int8 a2)
{
  char v2 = static StateSemantic.< infix(_:_:)(a1, a2);
  return sub_14978(v2);
}

BOOL sub_13D00(unsigned __int8 a1, unsigned __int8 a2)
{
  return (static AttributeSemantic.< infix(_:_:)(a1, a2) & 1) == 0;
}

BOOL sub_13D1C(unsigned __int8 a1, unsigned __int8 a2)
{
  char v2 = static AccessoryTypeSemantic.< infix(_:_:)(a1, a2);
  return sub_14978(v2);
}

uint64_t sub_13D34(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = sub_1499C(a1, a2);
  return static HueSemantic.< infix(_:_:)(v2, v3);
}

void sub_13D44(uint64_t a1, uint64_t a2)
{
  char v2 = sub_1499C(a1, a2);
  static UnitSemantic.< infix(_:_:)(v2);
}

uint64_t sub_13D54(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_1499C(a1, a2);
  return static StateSemantic.< infix(_:_:)(v2, v3);
}

uint64_t sub_13D64(unsigned __int8 a1, unsigned __int8 a2)
{
  return static AttributeSemantic.< infix(_:_:)(a2, a1);
}

uint64_t sub_13D74(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_1499C(a1, a2);
  return static AccessoryTypeSemantic.< infix(_:_:)(v2, v3);
}

uint64_t AttributeSemantic.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_13DC0 + 4 * word_31194[a1]))( 0xD000000000000011LL,  0x8000000000031EB0LL);
}

uint64_t sub_13DC0()
{
  return 0x74617265706D6574LL;
}

uint64_t sub_13DE4()
{
  return 0x656E746867697262LL;
}

uint64_t sub_13E04()
{
  return 0x6974617275746173LL;
}

uint64_t sub_13E24()
{
  return 0x726F6C6F63LL;
}

uint64_t sub_14310()
{
  return 0x6E6964726F636572LL;
}

void sub_14334()
{
}

uint64_t sub_1434C()
{
  return 1701670760LL;
}

uint64_t static AttributeSemantic.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v3 = AttributeSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  uint64_t v6 = AttributeSemantic.rawValue.getter(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 0;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 1LL);
  }

  sub_149B4();
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

HomeAutomationSiriSuggestions::AttributeSemantic_optional __swiftcall AttributeSemantic.init(rawValue:)( Swift::String rawValue)
{
  unint64_t v1 = _findStringSwitchCaseWithCache(cases:string:cache:)( &off_424E8,  rawValue._countAndFlagsBits,  rawValue._object,  &unk_48E20);
  sub_149B4();
  if (v1 >= 0x42) {
    return (HomeAutomationSiriSuggestions::AttributeSemantic_optional)66;
  }
  else {
    return (HomeAutomationSiriSuggestions::AttributeSemantic_optional)v1;
  }
}

_UNKNOWN **static AttributeSemantic.allCases.getter()
{
  return &off_42B38;
}

void sub_14434()
{
}

uint64_t sub_14454(uint64_t a1)
{
  return sub_13A8C(a1, *v1, (uint64_t (*)(uint64_t))AttributeSemantic.rawValue.getter);
}

void sub_14474(uint64_t a1)
{
}

HomeAutomationSiriSuggestions::AttributeSemantic_optional sub_14494@<W0>( Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::AttributeSemantic_optional *a2@<X8>)
{
  result.value = AttributeSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_144C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttributeSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_144E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static AttributeSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_144F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13C90(*a1, *a2);
}

BOOL sub_14500(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13D00(*a1, *a2);
}

uint64_t sub_1450C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_13D64(*a1, *a2);
}

void sub_14518(void *a1@<X8>)
{
  *a1 = &off_42B38;
}

uint64_t sub_14528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_14910();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_14584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_14910();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

void sub_145D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

uint64_t sub_145DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_14898();
  unint64_t v5 = sub_148D4();
  unint64_t v6 = sub_14910();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_14640()
{
  unint64_t result = qword_492A8;
  if (!qword_492A8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492A8);
  }

  return result;
}

unint64_t sub_14680()
{
  unint64_t result = qword_492B0;
  if (!qword_492B0)
  {
    uint64_t v1 = sub_6844(&qword_492B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_492B0);
  }

  return result;
}

unint64_t sub_146C8()
{
  unint64_t result = qword_492C0;
  if (!qword_492C0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492C0);
  }

  return result;
}

unint64_t sub_14708()
{
  unint64_t result = qword_492C8;
  if (!qword_492C8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492C8);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for AttributeSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xBF)
  {
    if (a2 + 65 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 65) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 66;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for AttributeSemantic(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 65) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xBF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xBE) {
    return ((uint64_t (*)(void))((char *)&loc_14818 + 4 * byte_3121D[v4]))();
  }
  *a1 = a2 + 65;
  return ((uint64_t (*)(void))((char *)sub_1484C + 4 * byte_31218[v4]))();
}

uint64_t sub_1484C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_14854(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1485CLL);
  }
  return result;
}

uint64_t sub_14868(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x14870LL);
  }
  *(_BYTE *)unint64_t result = a2 + 65;
  return result;
}

uint64_t sub_14874(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1487C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributeSemantic()
{
  return &type metadata for AttributeSemantic;
}

unint64_t sub_14898()
{
  unint64_t result = qword_492D0;
  if (!qword_492D0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492D0);
  }

  return result;
}

unint64_t sub_148D4()
{
  unint64_t result = qword_492D8;
  if (!qword_492D8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492D8);
  }

  return result;
}

unint64_t sub_14910()
{
  unint64_t result = qword_492E0;
  if (!qword_492E0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AttributeSemantic,  &type metadata for AttributeSemantic);
    atomic_store(result, (unint64_t *)&qword_492E0);
  }

  return result;
}

uint64_t sub_1494C(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return String.hash(into:)(va, a1, a2);
}

  ;
}

uint64_t sub_14970(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

BOOL sub_14978(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t sub_14984(uint64_t a1, uint64_t a2)
{
  return String.hash(into:)(v2, a1, a2);
}

uint64_t sub_1499C(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int sub_149AC()
{
  return Hasher._finalize()();
}

uint64_t sub_149B4()
{
  return swift_bridgeObjectRelease(v0);
}

void *sub_149BC(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, 0LL);
}

void sub_149C8(uint64_t a1, ...)
{
}

void *sub_149D4(uint64_t a1, uint64_t a2, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

  ;
}

uint64_t sub_149F4()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CA30);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setBrightness(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_14A40()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CA48);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = &unk_492E8;
  v1[1] = 0LL;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catTemplateCallback(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_14A98(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)swift_task_alloc(dword_492F4);
  *(void *)(v2 + 16) = v5;
  *int v5 = v2;
  v5[1] = sub_14AF0;
  return sub_14B38(a1, a2);
}

uint64_t sub_14AF0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_14B38(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  unint64_t v3 = (*(void *)(*(void *)(sub_4D88(&qword_49188) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[26] = swift_task_alloc(v3);
  v2[27] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for CATOption(0LL);
  v2[28] = sub_15A18(*(void *)(v4 - 8));
  uint64_t v5 = sub_4D88(&qword_49118);
  v2[29] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for TemplatingResult(0LL);
  v2[30] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[31] = v7;
  v2[32] = sub_15A18(v7);
  return swift_task_switch(sub_14BEC, 0LL, 0LL);
}

uint64_t sub_14BEC()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_4D4C(v1, v1[3]);
  uint64_t v2 = sub_15A28();
  sub_15D68(0x656D614E6D6F6F72LL, 0xE800000000000000LL, v2, (_OWORD *)(v0 + 16));
  sub_15A64();
  if (*(void *)(v0 + 40))
  {
    int v3 = sub_15A34(v0 + 144, v0 + 16, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v4 = *(void *)(v0 + 144);
    if (!v3) {
      uint64_t v4 = 0LL;
    }
    uint64_t v30 = v4;
    if (v3) {
      uint64_t v5 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 16, &qword_49060);
    uint64_t v30 = 0LL;
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = sub_15A28();
  sub_15D68(0x7475626972747461LL, 0xE900000000000065LL, v6, (_OWORD *)(v0 + 48));
  sub_15A64();
  if (*(void *)(v0 + 72))
  {
    int v7 = sub_15A34(v0 + 160, v0 + 48, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v8 = *(void *)(v0 + 160);
    if (!v7) {
      uint64_t v8 = 0LL;
    }
    uint64_t v29 = v8;
    if (v7) {
      uint64_t v9 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 48, &qword_49060);
    uint64_t v29 = 0LL;
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = sub_15A28();
  sub_15D68(0x65756C6176LL, 0xE500000000000000LL, v10, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease(v10);
  if (!*(void *)(v0 + 104))
  {
    sub_15994(v0 + 80, &qword_49060);
LABEL_22:
    uint64_t v12 = 0LL;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_23;
  }

  uint64_t v11 = type metadata accessor for HomeAutomationEntityStateValue(0LL);
  uint64_t v12 = *(void *)(v0 + 176);
  sub_4D4C(*(void **)(v0 + 200), v1[3]);
  swift_retain(v12);
  uint64_t v13 = sub_15A3C();
  dispatch thunk of HomeAutomationEntityStateValue.mockGlobals.setter(v13);
  swift_release(v12);
  if (!v12) {
    goto LABEL_22;
  }
  swift_retain(v12);
  dispatch thunk of HomeAutomationEntityStateValue.getProperty(_:)(0x56636972656D756ELL, 0xEC00000065756C61LL);
  swift_release(v12);
  if (!*(void *)(v0 + 136))
  {
LABEL_23:
    sub_15994(v0 + 112, &qword_49060);
    goto LABEL_24;
  }

  uint64_t v14 = type metadata accessor for HomeAutomationAbstractMeasurement(0LL);
  if ((sub_15A34(v0 + 184, v0 + 112, (uint64_t)&type metadata for Any + 8, v14) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v0 + 184);
    sub_4D4C(*(void **)(v0 + 200), v1[3]);
    swift_retain(v15);
    uint64_t v16 = sub_15A3C();
    dispatch thunk of HomeAutomationAbstractMeasurement.mockGlobals.setter(v16);
    swift_release(v15);
    goto LABEL_25;
  }

LABEL_24:
  uint64_t v15 = 0LL;
LABEL_25:
  *(void *)(v0 + 264) = v12;
  *(void *)(v0 + 272) = v15;
  if (qword_48D68 != -1) {
    swift_once(&qword_48D68, sub_21424);
  }
  uint64_t v18 = *(void *)(v0 + 224);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v19 = *(void **)(v0 + 200);
  URL.init(string:)(qword_4CB88, unk_4CB90);
  uint64_t v21 = v1[3];
  uint64_t v20 = v1[4];
  sub_4D4C(v19, v21);
  uint64_t v22 = dispatch thunk of DialogProperties.globals.getter(v21, v20);
  static CATOption.defaultMode.getter();
  uint64_t v23 = type metadata accessor for HomeSuggestionCATs(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v17, v18, v22);
  if (v5)
  {
    String.toSpeakableString.getter(v30, v5);
    swift_bridgeObjectRelease(v5);
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v24 = 1LL;
  }

  uint64_t v25 = *(void *)(v0 + 216);
  type metadata accessor for SpeakableString(0LL);
  uint64_t v26 = 1LL;
  sub_15A50(v25, v24);
  if (v9)
  {
    String.toSpeakableString.getter(v29, v9);
    sub_15A64();
    uint64_t v26 = 0LL;
  }

  sub_15A50(*(void *)(v0 + 208), v26);
  uint64_t v27 = (void *)swift_task_alloc(dword_49134);
  *(void *)(v0 + 288) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_15000;
  return sub_113C0(*(void *)(v0 + 256), *(void *)(v0 + 216), *(void *)(v0 + 208), v12);
}

  uint64_t v15 = 0LL;
LABEL_25:
  *(void *)(v0 + 264) = v12;
  *(void *)(v0 + 272) = v15;
  if (qword_48D68 != -1) {
    swift_once(&qword_48D68, sub_21424);
  }
  uint64_t v18 = *(void *)(v0 + 224);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v19 = *(void **)(v0 + 200);
  URL.init(string:)(qword_4CB88, unk_4CB90);
  uint64_t v21 = v1[3];
  uint64_t v20 = v1[4];
  sub_4D4C(v19, v21);
  uint64_t v22 = dispatch thunk of DialogProperties.globals.getter(v21, v20);
  static CATOption.defaultMode.getter();
  uint64_t v23 = type metadata accessor for HomeSuggestionCATs(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v17, v18, v22);
  if (v5)
  {
    String.toSpeakableString.getter(v30, v5);
    swift_bridgeObjectRelease();
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v24 = 1LL;
  }

  uint64_t v25 = *(void *)(v0 + 216);
  type metadata accessor for SpeakableString(0LL);
  uint64_t v26 = 1LL;
  sub_15A50(v25, v24);
  if (v9)
  {
    String.toSpeakableString.getter(v29, v9);
    sub_15A64();
    uint64_t v26 = 0LL;
  }

  sub_15A50(*(void *)(v0 + 208), v26);
  uint64_t v27 = (void *)swift_task_alloc(dword_49144);
  *(void *)(v0 + 288) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_15000;
  return sub_11750(*(void *)(v0 + 256), *(void *)(v0 + 216), *(void *)(v0 + 208), v12);
}

  uint64_t v15 = 0LL;
LABEL_25:
  *(void *)(v0 + 264) = v12;
  *(void *)(v0 + 272) = v15;
  if (qword_48D68 != -1) {
    swift_once(&qword_48D68, sub_21424);
  }
  uint64_t v18 = *(void *)(v0 + 224);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v19 = *(void **)(v0 + 200);
  URL.init(string:)(qword_4CB88, unk_4CB90);
  uint64_t v21 = v1[3];
  uint64_t v20 = v1[4];
  sub_4D4C(v19, v21);
  uint64_t v22 = dispatch thunk of DialogProperties.globals.getter(v21, v20);
  static CATOption.defaultMode.getter();
  uint64_t v23 = type metadata accessor for HomeSuggestionCATs(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v17, v18, v22);
  if (v5)
  {
    String.toSpeakableString.getter(v30, v5);
    swift_bridgeObjectRelease();
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v24 = 1LL;
  }

  uint64_t v25 = *(void *)(v0 + 216);
  type metadata accessor for SpeakableString(0LL);
  uint64_t v26 = 1LL;
  sub_15A50(v25, v24);
  if (v9)
  {
    String.toSpeakableString.getter(v29, v9);
    sub_15A64();
    uint64_t v26 = 0LL;
  }

  sub_15A50(*(void *)(v0 + 208), v26);
  uint64_t v27 = (void *)swift_task_alloc(dword_4913C);
  *(void *)(v0 + 288) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_15000;
  return sub_1156C(*(void *)(v0 + 256), *(void *)(v0 + 216), *(void *)(v0 + 208), v12);
}

uint64_t sub_15000()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 288LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 208LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 216LL);
  *(void *)(*(void *)v1 + 296LL) = v0;
  swift_task_dealloc(v2);
  sub_8BF4();
  sub_15994(v4, &qword_49188);
  sub_15994(v3, &qword_49188);
  if (v0) {
    uint64_t v5 = sub_15144;
  }
  else {
    uint64_t v5 = sub_15094;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_15094()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v8 = *(void **)(v0 + 192);
  v8[3] = *(void *)(v0 + 240);
  sub_1595C(v8);
  (*(void (**)(void))(v3 + 32))();
  swift_release(v1);
  sub_8BF4();
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_15144()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 216);
  swift_release(*(void *)(v0 + 272));
  swift_release(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_151C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48CE0 != -1) {
    swift_once(&qword_48CE0, sub_149F4);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  sub_4D70(v4, (uint64_t)qword_4CA30);
  uint64_t v5 = HomeSuggestionType.rawValue.getter();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v8, 40LL);
  uint64_t v9 = sub_15E34(v5, v7);
  v13[3] = v8;
  sub_159CC( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[4] = v10;
  v13[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_1595C((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_152F4@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v74.n128_u64[0] = a1;
  v75 = a2;
  v77.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v76 = *(void *)(v77.n128_u64[0] - 8);
  __chkstk_darwin(v77.n128_u64[0]);
  v79.n128_u64[0] = (unint64_t)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v73 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 3 * v73, v10 | 7);
  uint64_t v80 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30590;
  uint64_t v13 = v12 + v11;
  v78 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v78(v6, enum case for SuggestionParameter.roomName(_:), v3);
  uint64_t v14 = type metadata accessor for RoomNameResolver();
  sub_1251C(v14, 32LL);
  uint64_t v15 = sub_1B2BC();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  sub_159CC( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  v16[4] = v17;
  *uint64_t v16 = v15;
  uint64_t v72 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v69 = v3;
  v72(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  uint64_t v18 = sub_4D88(&qword_49060);
  uint64_t v70 = (char *)&type metadata for Any + 8;
  uint64_t v71 = v18;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v18);
  uint64_t v19 = v73;
  uint64_t v20 = v13 + v73;
  sub_8BE0();
  uint64_t v21 = type metadata accessor for AttributeResolver();
  sub_1251C(v21, 40LL);
  uint64_t v22 = sub_26ED0();
  uint64_t v23 = (void *)(v20 + v8[5]);
  v23[3] = v21;
  sub_159CC( &qword_49198,  (uint64_t (*)(uint64_t))type metadata accessor for AttributeResolver,  (uint64_t)&unk_31B94);
  v23[4] = v24;
  *uint64_t v23 = v22;
  uint64_t v25 = v69;
  uint64_t v26 = v72;
  v72(v13 + v19, v6, v69);
  *(_BYTE *)(v20 + v8[6]) = 1;
  *(_BYTE *)(v20 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v18);
  uint64_t v27 = v13 + 2 * v19;
  uint64_t v28 = v25;
  sub_8BE0();
  uint64_t v29 = type metadata accessor for ValueResolver();
  sub_1251C(v29, 64LL);
  uint64_t v30 = sub_23868();
  uint64_t v31 = (void *)(v27 + v8[5]);
  v31[3] = v29;
  sub_159CC( &qword_491A0,  (uint64_t (*)(uint64_t))type metadata accessor for ValueResolver,  (uint64_t)&unk_3190C);
  v31[4] = v32;
  *uint64_t v31 = v30;
  v26(v27, v6, v28);
  uint64_t v33 = v27;
  *(_BYTE *)(v27 + v8[6]) = 0;
  *(_BYTE *)(v27 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, v70, v71);
  sub_6F90(v74.n128_i64[0], (uint64_t)&v82);
  LODWORD(v6) = *(unsigned __int8 *)(v13 + v8[7]);
  uint64_t v34 = type metadata accessor for ResolvableParameter(0LL);
  uint64_t v35 = swift_bridgeObjectRetain(v80);
  SuggestionParameter.rawValue.getter(v35);
  sub_8BA8();
  uint64_t v37 = *(unsigned __int8 *)(v13 + v36);
  BOOL v38 = (_DWORD)v6 == 1;
  unint64_t v39 = v79.n128_u64[0];
  v78 = (void (*)(char *, void, uint64_t))v34;
  if (v38)
  {
    (*(void (**)(unint64_t, uint64_t, unint64_t))(v76 + 16))( v79.n128_u64[0],  v13 + v8[8],  v77.n128_u64[0]);
    ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v13, v28, v37, v39);
  }

  else
  {
    ResolvableParameter.__allocating_init(typeIdentifier:required:)(v13, v28, v37);
  }

  __n128 v74 = v83;
  uint64_t v40 = sub_8B70(v83.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v40);
  uint64_t v42 = v41;
  sub_8BFC(v13 + v8[5]);
  sub_15A08(v74);
  uint64_t v43 = sub_8BD0();
  sub_8B40(v43, v42, v44);
  sub_8BF4();
  uint64_t v45 = swift_bridgeObjectRelease(v42);
  sub_15A48(v45, &qword_49068);
  uint64_t v46 = sub_6108(v81);
  char v47 = *(_BYTE *)(v20 + v8[7]);
  SuggestionParameter.rawValue.getter(v46);
  sub_8BA8();
  if ((v47 & 1) != 0)
  {
    uint64_t v48 = sub_8BB8();
    v49(v48);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v77 = v83;
  uint64_t v50 = sub_8B70(v83.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v50);
  uint64_t v52 = v51;
  sub_8BFC(v20 + v8[5]);
  sub_15A08(v77);
  uint64_t v53 = sub_8BD0();
  sub_8B40(v53, v52, v54);
  sub_8BF4();
  uint64_t v55 = swift_bridgeObjectRelease(v52);
  sub_15A48(v55, &qword_49068);
  uint64_t v56 = sub_6108(v81);
  char v57 = *(_BYTE *)(v33 + v8[7]);
  SuggestionParameter.rawValue.getter(v56);
  sub_8BA8();
  if ((v57 & 1) != 0)
  {
    uint64_t v58 = sub_8BB8();
    v59(v58);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v79 = v83;
  uint64_t v60 = sub_8B70(v83.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v60);
  uint64_t v62 = v61;
  sub_8BFC(v33 + v8[5]);
  sub_15A08(v79);
  uint64_t v63 = sub_8BD0();
  sub_8B40(v63, v62, v64);
  sub_8BF4();
  uint64_t v65 = swift_bridgeObjectRelease(v62);
  sub_15A48(v65, &qword_49068);
  sub_6108(v81);
  uint64_t v66 = v80;
  swift_bridgeObjectRelease(v80);
  sub_7014(&v82, v75);
  swift_setDeallocating(v66);
  return sub_1E9F4();
}

ValueMetadata *type metadata accessor for SetBrightnessSuggestion()
{
  return &type metadata for SetBrightnessSuggestion;
}

void sub_1595C(void *a1)
{
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0) {
    *a1 = swift_allocBox();
  }
  sub_15A5C();
}

void sub_15994(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4D88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_15A5C();
}

void sub_159CC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_15A5C();
}

void sub_15A08(__n128 a1)
{
  *(__n128 *)(v2 - 160) = a1;
  *(void *)(v2 - 144) = v1;
  sub_1595C((void *)(v2 - 184));
}

uint64_t sub_15A18@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_15A28()
{
  return dispatch thunk of DialogProperties.getParameters()(v0, v1);
}

uint64_t sub_15A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 6LL);
}

uint64_t sub_15A3C()
{
  return dispatch thunk of DialogProperties.globals.getter(v0, v1);
}

void sub_15A48(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_15A50(uint64_t a1, uint64_t a2)
{
  return sub_61AC(a1, a2, 1LL, v2);
}

  ;
}

uint64_t sub_15A64()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_15A6C(uint64_t a1, uint64_t a2)
{
}

void sub_15A78(uint64_t a1, uint64_t a2)
{
}

void sub_15A84(uint64_t a1, uint64_t a2)
{
}

void sub_15A90(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v7 = v6;
  uint64_t v8 = ((uint64_t (*)(uint64_t))a3)(a2);
  if (v5 != v8 || v7 != v9) {
    sub_1A140(v5, v7, v8, v9);
  }
  sub_149B4();
  sub_1A0A4();
  sub_1A338();
}

void sub_15B04(char a1)
{
  __asm { BR              X11 }

uint64_t sub_15B50(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_15BB4 + 4 * byte_31444[a2]))(0x746E6563726570LL);
}

void sub_15BB4(uint64_t a1)
{
  if (a1 != 0x746E6563726570LL || v1 != 0xE700000000000000LL) {
    sub_1A140(a1, v1, 0x746E6563726570LL, 0xE700000000000000LL);
  }
  sub_149B4();
  sub_1A0A4();
  sub_1A338();
}

void sub_15C30(unsigned __int16 a1, unsigned __int16 a2)
{
  uint64_t v3 = HueSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  uint64_t v6 = HueSemantic.rawValue.getter(a2);
  if (v3 != v6 || v5 != v7) {
    sub_1A140(v3, v5, v6, v7);
  }
  sub_149B4();
  sub_1A0A4();
  sub_1A338();
}

uint64_t sub_15CA0()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_159CC( &qword_49400,  (uint64_t (*)(uint64_t))&type metadata accessor for HomeSuggestionType,  (uint64_t)&protocol conformance descriptor for HomeSuggestionType);
  uint64_t v2 = v1;
  dispatch thunk of RawRepresentable.rawValue.getter(&v10, v0, v1);
  dispatch thunk of RawRepresentable.rawValue.getter(&v8, v0, v2);
  uint64_t v3 = v11;
  uint64_t v4 = v9;
  if (v10 == v8 && v11 == v9)
  {
    char v6 = 1;
    uint64_t v4 = v11;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v8, v9, 0LL);
  }

  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  return v6 & 1;
}

double sub_15D68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_18EDC(a1, a2), (v7 & 1) != 0))
  {
    sub_19F18(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

void sub_15DB8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v3 = sub_18F38(a1);
    if ((v4 & 1) != 0) {
      swift_bridgeObjectRetain(*(void *)(*(void *)(a2 + 56) + 8 * v3));
    }
  }

  sub_15A5C();
}

uint64_t sub_15DF4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_18F8C(a1), (v4 & 1) != 0)) {
    return swift_bridgeObjectRetain(*(void *)(*(void *)(a2 + 56) + 8 * v3));
  }
  else {
    return 0LL;
  }
}

void *sub_15E34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_4D88(&qword_49430);
  uint64_t v3 = sub_4D88(&qword_49438);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v82 = swift_allocObject(v2, v7 + 9 * v5, v6 | 7);
  *(_OWORD *)(v82 + 16) = xmmword_314D0;
  uint64_t v8 = v82 + v7;
  uint64_t v77 = *(int *)(v3 + 48);
  uint64_t v9 = enum case for HomeSuggestionType.createAutomation(_:);
  uint64_t v10 = sub_1A6DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104LL))(v82 + v7, v9, v10);
  uint64_t v11 = sub_4D88(&qword_49440);
  uint64_t inited = swift_initStackObject(v11);
  *(_OWORD *)(inited + 16) = xmmword_2FE90;
  *(void *)(inited + 32) = 1LL;
  *(void *)(inited + 40) = &_swiftEmptyArrayStorage;
  sub_4D88(&qword_49448);
  sub_19F90();
  uint64_t v13 = sub_1A098(inited, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + v77) = v13;
  uint64_t v14 = *(int *)(v3 + 48);
  sub_1A0F0(v13, enum case for HomeSuggestionType.getStateSmokeSensor(_:));
  uint64_t v15 = (__n128 *)sub_1A2C8();
  sub_1A69C(v15, v16, v17, v18, v19, v20, v21, v22, v77, v80, v82, a1, v92, a2, v23);
  *(void *)(v24 + 32) = 20LL;
  *(void *)(v24 + 40) = &off_41598;
  uint64_t v25 = sub_1A098(v24, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + v5 + v14) = v25;
  uint64_t v26 = *(int *)(v3 + 48);
  sub_1A0F0(v25, enum case for HomeSuggestionType.openCloseSecureAccessories(_:));
  uint64_t v27 = sub_1A2C8();
  *(_OWORD *)(v27 + 16) = xmmword_314E0;
  *(void *)(v27 + 32) = 4LL;
  *(void *)(v27 + 40) = &off_415C0;
  *(void *)(v27 + 48) = 27LL;
  *(void *)(v27 + 56) = &off_415E8;
  *(void *)(v27 + 64) = 28LL;
  *(void *)(v27 + 72) = &off_41610;
  *(void *)(v27 + 80) = 7LL;
  *(void *)(v27 + 88) = &off_41638;
  *(void *)(v27 + 96) = 22LL;
  *(void *)(v27 + 104) = &off_41660;
  *(void *)(v27 + 112) = 13LL;
  *(void *)(v27 + 120) = &off_41688;
  uint64_t v28 = sub_1A098(v27, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 2 * v5 + v26) = v28;
  uint64_t v29 = *(int *)(v3 + 48);
  sub_1A0F0(v28, enum case for HomeSuggestionType.powerAccessories(_:));
  uint64_t v30 = sub_1A2C8();
  *(_OWORD *)(v30 + 16) = xmmword_314E0;
  *(void *)(v30 + 32) = 1LL;
  *(void *)(v30 + 40) = &off_416B0;
  *(void *)(v30 + 48) = 6LL;
  *(void *)(v30 + 56) = &off_416D8;
  *(void *)(v30 + 64) = 2LL;
  *(void *)(v30 + 72) = &off_41700;
  *(void *)(v30 + 80) = 41LL;
  *(void *)(v30 + 88) = &off_41728;
  *(void *)(v30 + 96) = 36LL;
  *(void *)(v30 + 104) = &off_41750;
  *(void *)(v30 + 112) = 3LL;
  *(void *)(v30 + 120) = &off_41778;
  uint64_t v31 = sub_1A098(v30, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 3 * v5 + v29) = v31;
  uint64_t v32 = *(int *)(v3 + 48);
  sub_1A0F0(v31, enum case for HomeSuggestionType.setBrightness(_:));
  uint64_t v33 = (__n128 *)sub_1A2C8();
  sub_1A69C(v33, v34, v35, v36, v37, v38, v39, v40, 6LL, 12LL, v83, v88, v93, v98, v41);
  *(void *)(v42 + 32) = 1LL;
  *(void *)(v42 + 40) = &off_417A0;
  uint64_t v43 = sub_1A098(v42, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 4 * v5 + v32) = v43;
  uint64_t v44 = *(int *)(v3 + 48);
  sub_1A0F0(v43, enum case for HomeSuggestionType.setClimateMode(_:));
  uint64_t v45 = sub_1A2C8();
  *(_OWORD *)(v45 + 16) = xmmword_30550;
  *(void *)(v45 + 32) = 3LL;
  *(void *)(v45 + 40) = &off_417C8;
  *(void *)(v45 + 48) = 29LL;
  *(void *)(v45 + 56) = &off_417F0;
  uint64_t v46 = sub_1A098(v45, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 5 * v5 + v44) = v46;
  uint64_t v47 = *(int *)(v3 + 48);
  sub_1A0F0(v46, enum case for HomeSuggestionType.setColor(_:));
  uint64_t v48 = (__n128 *)sub_1A2C8();
  sub_1A69C(v48, v49, v50, v51, v52, v53, v54, v55, 2LL, 4LL, v84, v89, v94, v99, v56);
  *(void *)(v57 + 32) = 1LL;
  *(void *)(v57 + 40) = &off_41818;
  uint64_t v58 = sub_1A098(v57, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 6 * v5 + v47) = v58;
  uint64_t v59 = *(int *)(v3 + 48);
  sub_1A0F0(v58, enum case for HomeSuggestionType.setFanSpeed(_:));
  uint64_t v60 = (__n128 *)sub_1A2C8();
  sub_1A69C(v60, v61, v62, v63, v64, v65, v66, v67, v78, v81, v85, v90, v95, v100, v68);
  *(void *)(v69 + 32) = 5LL;
  *(void *)(v69 + 40) = &off_41840;
  uint64_t v70 = sub_1A098(v69, (uint64_t)&type metadata for HomeDeviceType);
  *(void *)(v8 + 7 * v5 + v59) = v70;
  uint64_t v71 = *(int *)(v3 + 48);
  sub_1A0F0(v70, enum case for HomeSuggestionType.setTemperature(_:));
  uint64_t v72 = sub_1A2C8();
  *(_OWORD *)(v72 + 16) = v79;
  *(void *)(v72 + 32) = 29LL;
  *(void *)(v72 + 40) = &off_41868;
  *(void *)(v72 + 48) = 3LL;
  *(void *)(v72 + 56) = &off_41890;
  *(void *)(v8 + 8 * v5 + v71) = sub_1A098(v72, (uint64_t)&type metadata for HomeDeviceType);
  uint64_t v73 = sub_4D88(&qword_49458);
  sub_159CC( &qword_493D8,  (uint64_t (*)(uint64_t))&type metadata accessor for HomeSuggestionType,  (uint64_t)&protocol conformance descriptor for HomeSuggestionType);
  uint64_t v75 = Dictionary.init(dictionaryLiteral:)(v86, v10, v73, v74);
  v96[2] = v91;
  v96[3] = v101;
  v96[4] = v75;
  return v96;
}

uint64_t sub_162E0(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[22] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[23] = v4;
  v2[24] = sub_15A18(v4);
  uint64_t v5 = sub_4D88(&qword_493F0);
  v2[25] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = sub_4D88(&qword_493B8);
  v2[26] = sub_15A18(*(void *)(v6 - 8));
  uint64_t v7 = sub_1A6DC();
  v2[27] = v7;
  v2[28] = *(void *)(v7 - 8);
  v2[29] = sub_11C5C();
  v2[30] = sub_11C5C();
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  v2[31] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[32] = v9;
  v2[33] = sub_15A18(v9);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_163A0(uint64_t a1)
{
  if (qword_48D48 != -1) {
    a1 = swift_once(&qword_48D48, sub_1FD60);
  }
  uint64_t v3 = *(void *)(v1 + 208);
  uint64_t v2 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 168);
  uint64_t v5 = static Log.OSLogs.suggestions;
  uint64_t v6 = static Signpost.Name.updateSuggestionContext.getter(a1);
  static Signpost.begin(logging:_:)(v5, v6, v7, v8);
  uint64_t v9 = *(void *)(v4 + 16);
  *(void *)(v1 + 272) = v9;
  uint64_t v10 = *(void **)(v4 + 24);
  *(void *)(v1 + 280) = v10;
  sub_1A0C8();
  HomeSuggestionType.init(rawValue:)(v9, v10);
  if (sub_61F4(v3, 1LL, v2) == 1)
  {
    sub_15994(*(void *)(v1 + 208), &qword_493B8);
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v11 = *(void *)(v1 + 264);
    uint64_t v13 = *(void *)(v1 + 192);
    uint64_t v12 = *(void *)(v1 + 200);
    uint64_t v14 = *(void *)(v1 + 176);
    uint64_t v15 = *(void *)(v1 + 184);
    uint64_t v16 = sub_4D70(v14, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    sub_1A58C();
    _StringGuts.grow(_:)(58LL);
    sub_1A5C4(0xD000000000000038LL, (uint64_t)"Couldn't find HomeAutomationSuggestion for suggestionId ");
    sub_1A0C8();
    v17._countAndFlagsBits = v9;
    v17._object = v10;
    String.append(_:)(v17);
    sub_1A090();
    sub_1A2F8();
    Logger.warning(output:test:file:function:line:)(v18, v19, v20, v21, 72LL);
    sub_1A090();
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    uint64_t v23 = static Signpost.Name.updateSuggestionContext.getter(v22);
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v28 = sub_1A358();
    uint64_t v29 = sub_1A2A4(v28);
    uint64_t v30 = v11;
    uint64_t v31 = v23;
    uint64_t v32 = v25;
    goto LABEL_20;
  }

  uint64_t v12 = *(void *)(v1 + 232);
  uint64_t v33 = *(void *)(v1 + 216);
  uint64_t v27 = *(void *)(v1 + 224);
  (*(void (**)(void, void, uint64_t))(v27 + 32))(*(void *)(v1 + 240), *(void *)(v1 + 208), v33);
  uint64_t v34 = *(void (**)(uint64_t, void, uint64_t))(v27 + 104);
  v34(v12, enum case for HomeSuggestionType.setScene(_:), v33);
  char v35 = sub_15CA0();
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(void *)(v1 + 288) = v36;
  sub_1A648(v12);
  if ((v35 & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v37 = *(void *)(v1 + 264);
    uint64_t v38 = sub_1A6F0();
    sub_4D70(v38, (uint64_t)static Log.suggestions);
    sub_1A6BC();
    sub_1A2F8();
    Logger.debug(output:test:caller:)(v39, v40, v41);
    uint64_t v42 = sub_1A648(v9);
    static Signpost.Name.updateSuggestionContext.getter(v42);
    uint64_t v43 = sub_1A148();
    uint64_t v29 = sub_1A2A4(v43);
    uint64_t v30 = v37;
LABEL_19:
    uint64_t v31 = v9;
    uint64_t v32 = v33;
LABEL_20:
    uint64_t v62 = static Signpost.end(logging:_:_:_:)(v29, v30, v31, v32, v27, v12);
    sub_1A478(v62, &qword_493F0);
    sub_19FE4();
    sub_11CCC();
    sub_11CB4();
    sub_1A3E8();
    sub_1A3A0();
    sub_1A398();
    sub_1A388();
    return sub_1A228(*(uint64_t (**)(void))(v1 + 8));
  }

  uint64_t v44 = *(void *)(*(void *)(v1 + 168) + 32LL);
  uint64_t v45 = sub_15DF4(*(void *)(v1 + 240), v44);
  *(void *)(v1 + 296) = v45;
  if (!v45)
  {
LABEL_16:
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v65 = *(void *)(v1 + 264);
    uint64_t v54 = sub_1A6F0();
    sub_4D70(v54, (uint64_t)static Log.suggestions);
    sub_1A58C();
    _StringGuts.grow(_:)(53LL);
    *(void *)(v1 + 112) = v66;
    *(void *)(v1 + 120) = v67;
    sub_1A6BC();
    String.append(_:)(v55);
    _print_unlocked<A, B>(_:_:)(v9, v1 + 112, v33);
    uint64_t v27 = *(void *)(v1 + 120);
    sub_1A52C();
    sub_1A2F8();
    Logger.warning(output:test:file:function:line:)(v56, v57, v58, v59, 82LL);
    sub_6324();
    uint64_t v60 = sub_1A648(v9);
    static Signpost.Name.updateSuggestionContext.getter(v60);
    uint64_t v61 = sub_1A148();
    uint64_t v29 = sub_1A2A4(v61);
    uint64_t v30 = v65;
    goto LABEL_19;
  }

  uint64_t v12 = v45;
  if (!*(void *)(v44 + 16))
  {
    sub_149B4();
    goto LABEL_16;
  }

  uint64_t v46 = *(void *)(v1 + 232);
  uint64_t v47 = *(void *)(v1 + 216);
  v34(v46, enum case for HomeSuggestionType.createAutomation(_:), v47);
  char v48 = sub_15CA0();
  v36(v46, v47);
  uint64_t v49 = type metadata accessor for SuggestionEntityRetrieval();
  if ((v48 & 1) != 0)
  {
    *(void *)(v1 + 304) = swift_initStackObject(v49);
    sub_1A0C8();
    *(void *)(v1 + 312) = sub_1A690();
    uint64_t v50 = sub_1A480();
    *(void *)(v1 + 320) = sub_19620(v50);
    sub_149B4();
    uint64_t v51 = (void *)swift_task_alloc(dword_49D2C);
    *(void *)(v1 + 328) = v51;
    *uint64_t v51 = v1;
    v51[1] = sub_16900;
    sub_1A5D4();
    return sub_290EC(v52);
  }

  else
  {
    *(void *)(v1 + 344) = swift_initStackObject(v49);
    sub_1A0C8();
    *(void *)(v1 + 352) = sub_1A690();
    uint64_t v63 = (void *)swift_task_alloc(dword_49D34);
    *(void *)(v1 + 360) = v63;
    *uint64_t v63 = v1;
    v63[1] = sub_16B98;
    sub_1A5D4();
    return sub_29260(v64);
  }

uint64_t sub_16900()
{
  *(void *)(v1 + 336) = v0;
  sub_1A634(v2);
  sub_1A0DC();
  sub_8BF4();
  sub_11C7C();
  return swift_task_switch(v3, v4, v5);
}

uint64_t sub_16950()
{
  uint64_t v5 = *(void *)(v2 + 336);
  *(_BYTE *)(v2 + 473) = 1;
  *(void *)(v2 + 384) = 0LL;
  *(void *)(v2 + 392) = v5;
  if (v5)
  {
    sub_1A63C();
    sub_1A0A4();
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_1A620();
    uint64_t v6 = sub_4D70(v1, (uint64_t)static Log.suggestions);
    sub_1A310(v6);
    sub_1A420();
    uint64_t v7 = swift_bridgeObjectRelease();
    v77._countAndFlagsBits = sub_1A4E0(v7, v8, v9, v10, v11, v12);
    sub_1A4F4(v77);
    sub_15A64();
    v78._countAndFlagsBits = 0xD00000000000001CLL;
    v78._object = (void *)0x8000000000035680LL;
    sub_1A4F4(v78);
    int v13 = sub_1A470();
    sub_1A4FC(v13, v14, v15, v16, v17, v18, v19, v20, v61, v65, v69, v72, v74);
    sub_1A15C();
    sub_1A10C(v75, (uint64_t)"ggestion. Invalidating ");
    sub_1A15C();
    sub_1A4B8();
    uint64_t v21 = sub_1A3F0();
    *(void *)(v2 + 440) = v21;
    sub_1A490(v21);
    return sub_1A260();
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_1A2D0();
    uint64_t v23 = sub_4D70(v4, (uint64_t)static Log.suggestions);
    sub_1A448(v23);
    sub_1A434();
    unint64_t v32 = sub_1A3BC(v24, v25, v26, v27, v28, v29, v30, v31, v61, v65, v69, v72, v74, v76);
    sub_1A134(v32, (uint64_t)"Couldn't get preferred accessory for suggestion: ");
    sub_1A5F0();
    sub_1A134(v3 - 121, (uint64_t)" and accessories ");
    uint64_t v33 = sub_1A5B4();
    sub_1A3A8();
    v34._countAndFlagsBits = Array.description.getter(v33, &type metadata for String);
    String.append(_:)(v34);
    sub_1A15C();
    sub_1A090();
    sub_1A200(*v0, v3 - 108, (uint64_t)"ggestion. Invalidating ");
    uint64_t v35 = sub_1A090();
    uint64_t v43 = sub_1A45C(v35, v36, v37, v38, v39, v40, v41, v42, v62, v66);
    uint64_t v51 = sub_1A59C(v43, v44, v45, v46, v47, v48, v49, v50, v63, v67, v70);
    static Signpost.Name.updateSuggestionContext.getter(v51);
    uint64_t v52 = sub_1A358();
    uint64_t v60 = sub_1A190(v52, v53, v54, v55, v56, v57, v58, v59, v64, v68, v71, v73);
    sub_1A478(v60, &qword_493F0);
    sub_19FE4();
    sub_11CCC();
    sub_11CB4();
    sub_1A3E8();
    sub_1A3A0();
    sub_1A398();
    sub_1A388();
    return sub_1A244(*(uint64_t (**)(void))(v2 + 8));
  }

uint64_t sub_16B98()
{
  *(void *)(v2 + 368) = v0;
  *(void *)(v2 + 376) = v1;
  *(_BYTE *)(v2 + 472) = v3;
  sub_1A634(v4);
  sub_1A0DC();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_16BDC()
{
  uint64_t v6 = *(void *)(v2 + 368);
  uint64_t v5 = *(void *)(v2 + 376);
  *(_BYTE *)(v2 + 473) = *(_BYTE *)(v2 + 472) & 1;
  *(void *)(v2 + 384) = v5;
  *(void *)(v2 + 392) = v6;
  if (v6)
  {
    sub_1A63C();
    sub_1A0A4();
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_1A620();
    uint64_t v7 = sub_4D70(v1, (uint64_t)static Log.suggestions);
    sub_1A310(v7);
    sub_1A420();
    uint64_t v8 = swift_bridgeObjectRelease();
    v78._countAndFlagsBits = sub_1A4E0(v8, v9, v10, v11, v12, v13);
    sub_1A4F4(v78);
    sub_15A64();
    v79._countAndFlagsBits = 0xD00000000000001CLL;
    v79._object = (void *)0x8000000000035680LL;
    sub_1A4F4(v79);
    int v14 = sub_1A470();
    sub_1A4FC(v14, v15, v16, v17, v18, v19, v20, v21, v62, v66, v70, v73, v75);
    sub_1A15C();
    sub_1A10C(v76, (uint64_t)"ggestion. Invalidating ");
    sub_1A15C();
    sub_1A4B8();
    uint64_t v22 = sub_1A3F0();
    *(void *)(v2 + 440) = v22;
    sub_1A490(v22);
    return sub_1A260();
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_1A2D0();
    uint64_t v24 = sub_4D70(v4, (uint64_t)static Log.suggestions);
    sub_1A448(v24);
    sub_1A434();
    unint64_t v33 = sub_1A3BC(v25, v26, v27, v28, v29, v30, v31, v32, v62, v66, v70, v73, v75, v77);
    sub_1A134(v33, (uint64_t)"Couldn't get preferred accessory for suggestion: ");
    sub_1A5F0();
    sub_1A134(v3 - 121, (uint64_t)" and accessories ");
    uint64_t v34 = sub_1A5B4();
    sub_1A3A8();
    v35._countAndFlagsBits = Array.description.getter(v34, &type metadata for String);
    String.append(_:)(v35);
    sub_1A15C();
    sub_1A090();
    sub_1A200(*v0, v3 - 108, (uint64_t)"ggestion. Invalidating ");
    uint64_t v36 = sub_1A090();
    uint64_t v44 = sub_1A45C(v36, v37, v38, v39, v40, v41, v42, v43, v63, v67);
    uint64_t v52 = sub_1A59C(v44, v45, v46, v47, v48, v49, v50, v51, v64, v68, v71);
    static Signpost.Name.updateSuggestionContext.getter(v52);
    uint64_t v53 = sub_1A358();
    uint64_t v61 = sub_1A190(v53, v54, v55, v56, v57, v58, v59, v60, v65, v69, v72, v74);
    sub_1A478(v61, &qword_493F0);
    sub_19FE4();
    sub_11CCC();
    sub_11CB4();
    sub_1A3E8();
    sub_1A3A0();
    sub_1A398();
    sub_1A388();
    return sub_1A244(*(uint64_t (**)(void))(v2 + 8));
  }

uint64_t sub_16E28()
{
  return sub_4DC8();
}

uint64_t sub_16E60()
{
  if (*(_BYTE *)(v0 + 473) == 1)
  {
    sub_1A664();
    uint64_t v1 = sub_1A360();
    static Signpost.Name.updateSuggestionContext.getter(v1);
    uint64_t v2 = sub_1A148();
    uint64_t v3 = sub_1A1C8(v2);
    sub_1A478(v3, &qword_493F0);
    sub_19FE4();
    sub_11CCC();
    sub_11CB4();
    sub_1A3E8();
    sub_1A3A0();
    sub_1A398();
    sub_1A388();
    return sub_1A228(*(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    uint64_t v6 = *(void *)(v0 + 384);
    uint64_t v8 = *(void *)(v0 + 272);
    uint64_t v7 = *(void **)(v0 + 280);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 176);
    uint64_t v11 = *(uint64_t **)(v0 + 160);
    sub_1A34C(*(void *)(v0 + 400), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 408));
    sub_1A58C();
    _StringGuts.grow(_:)(50LL);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 152) = HomeAttributeType.rawValue.getter(v6);
    unint64_t v12 = sub_19E34();
    v13._countAndFlagsBits = BinaryInteger.description.getter(&type metadata for Int, v12);
    String.append(_:)(v13);
    sub_6324();
    sub_1A5C4(0xD00000000000001CLL, (uint64_t)" in Context for suggestion: ");
    sub_1A470();
    v14._countAndFlagsBits = v8;
    v14._object = v7;
    String.append(_:)(v14);
    sub_1A15C();
    v15._countAndFlagsBits = 0xD000000000000012LL;
    v16._countAndFlagsBits = 0xD00000000000008ALL;
    v16._object = (void *)0x80000000000352D0LL;
    v15._object = (void *)0x80000000000356A0LL;
    Logger.debug(output:test:caller:)(v15, 0, v16);
    sub_1A15C();
    v5(v9, v10);
    uint64_t v17 = *v11;
    *(void *)(v0 + 448) = *v11;
    *(void *)(v0 + 456) = v11[1];
    uint64_t ObjectType = swift_getObjectType(v17);
    *(void *)(v0 + 464) = ObjectType;
    sub_1A490(ObjectType);
    sub_1A5D4();
    return swift_task_switch(v19, v20, v21);
  }

uint64_t sub_17014()
{
  return sub_4DC8();
}

uint64_t sub_1704C()
{
  uint64_t v1 = sub_1A360();
  static Signpost.Name.updateSuggestionContext.getter(v1);
  uint64_t v2 = sub_1A148();
  uint64_t v3 = sub_1A1C8(v2);
  sub_1A478(v3, &qword_493F0);
  sub_19FE4();
  sub_11CCC();
  sub_11CB4();
  sub_1A3E8();
  sub_1A3A0();
  sub_1A398();
  sub_1A388();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_170CC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  sub_19300(0LL, v1, 0);
  uint64_t result = sub_19E70(a1);
  if ((result & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = result;
    if (result < 1LL << *(_BYTE *)(a1 + 32))
    {
      uint64_t v6 = a1 + 64;
      uint64_t v14 = a1 + 64;
      while ((*(void *)(v6 + 8 * (v5 >> 6)) & (1LL << v5)) != 0)
      {
        if (v4 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_18;
        }
        int64_t v15 = v1;
        int v16 = v4;
        uint64_t result = HomeDeviceType.description.getter(*(void *)(*(void *)(a1 + 48) + 8 * v5));
        uint64_t v7 = result;
        uint64_t v9 = v8;
        unint64_t v11 = _swiftEmptyArrayStorage[2];
        unint64_t v10 = _swiftEmptyArrayStorage[3];
        if (v11 >= v10 >> 1) {
          uint64_t result = (uint64_t)sub_19300((char *)(v10 > 1), v11 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v11 + 1;
        unint64_t v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
        *((void *)v12 + 4) = v7;
        *((void *)v12 + 5) = v9;
        uint64_t v13 = -1LL << *(_BYTE *)(a1 + 32);
        uint64_t v6 = a1 + 64;
        if ((*(void *)(v14 + 8 * (v5 >> 6)) & (1LL << v5)) == 0) {
          goto LABEL_20;
        }
        if (v16 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_21;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)(v5, v14, ~v13);
        int64_t v1 = v15 - 1;
        if (v15 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
        unint64_t v5 = result;
        if ((result & 0x8000000000000000LL) == 0)
        {
          int v4 = *(_DWORD *)(a1 + 36);
          if (result < 1LL << *(_BYTE *)(a1 + 32)) {
            continue;
          }
        }

        goto LABEL_22;
      }

      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }

LABEL_22:
  __break(1u);
  return result;
}

            unint64_t v11 = (v16 - 1) & v16;
            uint64_t v52 = v17;
            uint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
          }

          uint64_t v19 = *(void *)(*(void *)(a4 + 48) + 8 * v14);
          Hasher.init(_seed:)(v54, *(void *)(v5 + 40));
          uint64_t v20 = HomeAttributeType.rawValue.getter(v19);
          Hasher._combine(_:)(v20);
          uint64_t result = Hasher._finalize()();
          unint64_t v5 = v55;
          uint64_t v21 = -1LL << *(_BYTE *)(v55 + 32);
          uint64_t v22 = result & ~v21;
          uint64_t v23 = v22 >> 6;
          uint64_t v24 = 1LL << v22;
        }

        while (((1LL << v22) & *(void *)(v12 + 8 * (v22 >> 6))) == 0);
        uint64_t v25 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v55 + 48) + 8 * v22));
        uint64_t result = HomeAttributeType.rawValue.getter(v19);
        if (v25 == result) {
          break;
        }
        uint64_t v26 = ~v21;
        for (uint64_t i = v22 + 1; ; uint64_t i = v28 + 1)
        {
          uint64_t v28 = i & v26;
          unint64_t v5 = v55;
          uint64_t v29 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v55 + 48) + 8 * v28));
          uint64_t result = HomeAttributeType.rawValue.getter(v19);
          if (v29 == result)
          {
            uint64_t v23 = v28 >> 6;
            uint64_t v24 = 1LL << v28;
            goto LABEL_30;
          }
        }
      }

uint64_t sub_17280()
{
  v1[9] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = sub_11C5C();
  v1[13] = sub_11C5C();
  v1[14] = sub_11C5C();
  uint64_t v3 = sub_4D88(&qword_493B8);
  v1[15] = sub_15A18(*(void *)(v3 - 8));
  uint64_t v4 = sub_1A6DC();
  v1[16] = v4;
  v1[17] = *(void *)(v4 - 8);
  v1[18] = sub_11C5C();
  v1[19] = sub_11C5C();
  v1[20] = sub_11C5C();
  v1[21] = sub_11C5C();
  v1[22] = sub_11C5C();
  v1[23] = sub_11C5C();
  v1[24] = sub_11C5C();
  v1[25] = sub_11C5C();
  v1[26] = sub_11C5C();
  v1[27] = sub_11C5C();
  v1[28] = sub_11C5C();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_17370()
{
  uint64_t v1 = type metadata accessor for SuggestionEntityRetrieval();
  v0[29] = swift_initStackObject(v1);
  sub_1A6BC();
  v0[30] = sub_28D90(0xD000000000000017LL, v2);
  uint64_t v3 = (void *)swift_task_alloc(dword_49D24);
  v0[31] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_173F0;
  return sub_28E34();
}

uint64_t sub_173F0()
{
  *(void *)(v1 + 256) = v0;
  sub_1A634(v2);
  sub_1A0DC();
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_17430()
{
  uint64_t v1 = *((void *)v0 + 32);
  if (!v1)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v15 = *((void *)v0 + 13);
    uint64_t v16 = *((void *)v0 + 10);
    uint64_t v17 = *((void *)v0 + 11);
    uint64_t v18 = *((void *)v0 + 9);
    uint64_t v19 = sub_4D70(v16, (uint64_t)static Log.suggestions);
    sub_1A34C(v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
    sub_1A378();
    _StringGuts.grow(_:)(57LL);
    sub_1A134(0xD000000000000037LL, (uint64_t)"Couldn't get home to validate suggestion. Invalidating ");
    uint64_t v20 = *(void *)(v18 + 16);
    uint64_t v21 = *(void **)(v18 + 24);
    swift_bridgeObjectRetain(v21);
    v22._countAndFlagsBits = v20;
    v22._object = v21;
    String.append(_:)(v22);
    sub_15A64();
    sub_1A52C();
    sub_1A2F8();
    Logger.warning(output:test:file:function:line:)(v23, v24, v25, v26, 112LL);
    sub_1A15C();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    goto LABEL_9;
  }

  uint64_t v2 = *((void *)v0 + 15);
  uint64_t v3 = *((void *)v0 + 16);
  uint64_t v4 = *((void *)v0 + 9);
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *(char **)(v4 + 24);
  sub_1A5AC();
  HomeSuggestionType.init(rawValue:)(v5, v6);
  if (sub_61F4(v2, 1LL, v3) == 1)
  {
    sub_15994(*((void *)v0 + 15), &qword_493B8);
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v7 = *((void *)v0 + 13);
    uint64_t v9 = *((void *)v0 + 10);
    uint64_t v8 = *((void *)v0 + 11);
    uint64_t v10 = sub_4D70(v9, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    sub_1A378();
    _StringGuts.grow(_:)(44LL);
    swift_bridgeObjectRelease();
    sub_1A5AC();
    sub_1A6A8();
    sub_1A3A8();
    sub_1A52C();
    sub_1A2F8();
    Logger.warning(output:test:file:function:line:)(v11, v12, v13, v14, 119LL);
    swift_release(v1);
    sub_149B4();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
LABEL_9:
    unsigned int v338 = 0;
    goto LABEL_96;
  }

  uint64_t v27 = *((void *)v0 + 28);
  uint64_t v28 = *((void *)v0 + 9);
  (*(void (**)(uint64_t, void, void))(*((void *)v0 + 17) + 32LL))( v27,  *((void *)v0 + 15),  *((void *)v0 + 16));
  uint64_t v330 = v1;
  unint64_t v29 = sub_1A390();
  uint64_t v30 = sub_15DF4(v27, *(void *)(v28 + 32));
  if (v30)
  {
    v336 = sub_19620(v30);
    sub_1A0A4();
  }

  else
  {
    v336 = _swiftEmptyArrayStorage;
  }

  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v31 = *((void *)v0 + 14);
  uint64_t v32 = *((void *)v0 + 10);
  uint64_t v33 = *((void *)v0 + 11);
  v340 = v0;
  uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))sub_4D70(v32, (uint64_t)static Log.suggestions);
  v328 = *(void (**)(uint64_t, void (*)(void, void), uint64_t))(v33 + 16);
  v328(v31, (void (*)(void, void))v34, v32);
  sub_1A378();
  _StringGuts.grow(_:)(87LL);
  v35._countAndFlagsBits = 0x676E696B63656843LL;
  v35._object = (void *)0xEC00000020666920LL;
  String.append(_:)(v35);
  sub_1A5AC();
  uint64_t v339 = v5;
  sub_1A6A8();
  sub_1A3A8();
  sub_1A134(0xD000000000000021LL, (uint64_t)" is valid for\n- home accessories ");
  uint64_t v329 = (uint64_t)v34;
  if (v29 >> 62)
  {
    sub_19FD0();
    uint64_t v36 = sub_634C();
    sub_1A488();
  }

  else
  {
    uint64_t v36 = *(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8LL));
  }

  v334 = v6;
  if (v36)
  {
    sub_19300(0LL, v36 & ~(v36 >> 63), 0);
    if (v36 < 0) {
      goto LABEL_196;
    }
    uint64_t v37 = 0LL;
    do
    {
      if ((v29 & 0xC000000000000001LL) != 0) {
        uint64_t v38 = sub_1A164(v37);
      }
      else {
        uint64_t v38 = swift_retain(*(void *)(v29 + 8 * v37 + 32));
      }
      uint64_t v44 = dispatch thunk of Entity.description.getter(v38, v39, v40, v41, v42, v43);
      uint64_t v46 = v45;
      sub_1A0DC();
      unint64_t v48 = _swiftEmptyArrayStorage[2];
      unint64_t v47 = _swiftEmptyArrayStorage[3];
      if (v48 >= v47 >> 1) {
        sub_1A408(v47);
      }
      ++v37;
      _swiftEmptyArrayStorage[2] = v48 + 1;
      uint64_t v49 = &_swiftEmptyArrayStorage[2 * v48];
      v49[4] = v44;
      v49[5] = v46;
    }

    while (v36 != v37);
  }

  sub_1A488();
  v343._countAndFlagsBits = Array.description.getter(_swiftEmptyArrayStorage, &type metadata for String);
  sub_1A6B4(v343);
  sub_149B4();
  sub_1A3A8();
  sub_1A134(0xD000000000000024LL, (uint64_t)"\n- supported suggestion accessories ");
  int64_t v50 = v336[2];
  if (v50)
  {
    sub_1A5AC();
    sub_19300(0LL, v50, 0);
    uint64_t v51 = 0LL;
    do
    {
      uint64_t v52 = HomeDeviceType.description.getter(v336[v51 + 4]);
      uint64_t v54 = v53;
      unint64_t v56 = _swiftEmptyArrayStorage[2];
      unint64_t v55 = _swiftEmptyArrayStorage[3];
      if (v56 >= v55 >> 1) {
        sub_1A408(v55);
      }
      ++v51;
      _swiftEmptyArrayStorage[2] = v56 + 1;
      uint64_t v57 = &_swiftEmptyArrayStorage[2 * v56];
      v57[4] = v52;
      v57[5] = v54;
    }

    while (v50 != v51);
    sub_1A3A8();
  }

  uint64_t v58 = *((void *)v340 + 27);
  uint64_t v59 = *((void *)v340 + 16);
  uint64_t v60 = *((void *)v340 + 17);
  uint64_t v61 = *((void *)v340 + 14);
  uint64_t v62 = *((void *)v340 + 10);
  uint64_t v63 = *((void *)v340 + 11);
  v344._countAndFlagsBits = Array.description.getter(_swiftEmptyArrayStorage, &type metadata for String);
  sub_1A6B4(v344);
  swift_bridgeObjectRelease();
  sub_1A15C();
  v332 = "ggestion. Invalidating ";
  sub_1A10C(v342, (uint64_t)"ggestion. Invalidating ");
  sub_1A15C();
  uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
  v64(v61, v62);
  uint64_t v34 = *(uint64_t (**)(uint64_t, void, uint64_t))(v60 + 104);
  uint64_t v65 = v34(v58, enum case for HomeSuggestionType.createAutomation(_:), v59);
  uint64_t v32 = HomeSuggestionType.rawValue.getter(v65);
  uint64_t v67 = v66;
  uint64_t v6 = *(char **)(v60 + 8);
  ((void (*)(uint64_t, uint64_t))v6)(v58, v59);
  uint64_t v36 = v339;
  BOOL v68 = v32 == v339 && v67 == (void)v334;
  v327 = (uint64_t (*)(uint64_t, uint64_t))v6;
  if (v68)
  {
    uint64_t v69 = sub_6324();
    uint64_t v70 = v330;
    goto LABEL_84;
  }

  sub_1A010();
  uint64_t v69 = sub_1A070();
  uint64_t v70 = v330;
  if ((v32 & 1) != 0)
  {
LABEL_84:
    if ((dispatch thunk of Home.hasHub.getter(v69) & 1) != 0)
    {
      int v137 = 1;
LABEL_86:
      uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v329;
      goto LABEL_89;
    }

    sub_1A6BC();
    sub_1A2F8();
    uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v329;
    Logger.warning(output:test:file:function:line:)(v138, v139, v140, v141, 142LL);
    goto LABEL_88;
  }

  v326 = v64;
  uint64_t v64 = v340;
  sub_1A0AC(v69, enum case for HomeSuggestionType.getStateSmokeSensor(_:));
  sub_1A27C();
  sub_1A04C();
  if (v32 == v339 && v67 == (void)v334)
  {
    sub_6324();
LABEL_98:
    sub_1A390();
    sub_1A32C();
    if (v166)
    {
      sub_19FD0();
      uint64_t v36 = sub_634C();
    }

    else
    {
      sub_1A03C();
    }

    sub_1A670();
    if (v36)
    {
      uint64_t v64 = (void (*)(uint64_t, uint64_t))v34;
      uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))(v330 & 0xC000000000000001LL);
      if ((v330 & 0xC000000000000001LL) != 0) {
        goto LABEL_219;
      }
      swift_retain(*(void *)(v330 + 32));
LABEL_103:
      char v167 = dispatch thunk of Accessory.has(type:)(20LL);
      sub_1A0DC();
      if ((v167 & 1) != 0)
      {
        sub_1A0E4();
        int v137 = 1;
      }

      else
      {
        if (v36 != 1)
        {
          uint64_t v188 = 5LL;
          while (1)
          {
            if (v34)
            {
              uint64_t v32 = sub_1A164(v188 - 4);
            }

            else
            {
              uint64_t v32 = *(void *)(v70 + 8 * v188);
              swift_retain(v32);
            }

            uint64_t v189 = v188 - 3;
            if (__OFADD__(v188 - 4, 1LL)) {
              goto LABEL_197;
            }
            char v190 = dispatch thunk of Accessory.has(type:)(20LL);
            sub_8BF4();
            if ((v190 & 1) != 0) {
              break;
            }
            ++v188;
            if (v189 == v36)
            {
              sub_1A0E4();
              int v137 = 0;
LABEL_136:
              uint64_t v70 = v330;
              uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v64;
              goto LABEL_262;
            }
          }

          sub_1A0E4();
          int v137 = 1;
          goto LABEL_136;
        }

        sub_1A0E4();
        int v137 = 0;
      }

      uint64_t v70 = v330;
      uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v64;
      uint64_t v64 = v326;
      goto LABEL_89;
    }

    goto LABEL_175;
  }

  sub_1A010();
  uint64_t v72 = sub_1A070();
  if ((v32 & 1) != 0) {
    goto LABEL_98;
  }
  sub_1A0AC(v72, enum case for HomeSuggestionType.openCloseSecureAccessories(_:));
  sub_1A27C();
  sub_1A04C();
  if (v32 == v339 && v67 == (void)v334)
  {
    sub_6324();
LABEL_109:
    sub_1A390();
    sub_1A32C();
    if (v168)
    {
      sub_19FD0();
      uint64_t v36 = sub_634C();
    }

    else
    {
      sub_1A03C();
    }

    sub_1A670();
    if (v36)
    {
      sub_1A07C();
      while (1)
      {
        if (v34) {
          sub_1A0D0();
        }
        else {
          sub_1A060(v169, v170, v171, v172, v173, v174, v175, v176, v324, v325);
        }
        BOOL v177 = __OFADD__(v6++, 1LL);
        if (v177) {
          goto LABEL_218;
        }
        uint64_t v178 = sub_1A0C8();
        dispatch thunk of Accessory.type.getter(v178);
        uint64_t v179 = v336[2];
        if (v179)
        {
          sub_1A0B8();
          sub_1A344();
          if (v32 == sub_1A004())
          {
LABEL_259:
            sub_1A0DC();
            sub_1A0E4();
            swift_bridgeObjectRelease_n(v336, 2LL);
            goto LABEL_260;
          }

          if (v179 != 1)
          {
            while (1)
            {
              sub_1A3DC();
              if (v177) {
                break;
              }
              sub_1A128( v180,  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
              if (v32 == sub_1A004()) {
                goto LABEL_259;
              }
              sub_1A3B0();
              if (v68) {
                goto LABEL_124;
              }
            }

            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            sub_6324();
LABEL_199:
            sub_1A688();
            sub_1A32C();
            if (v232) {
              goto LABEL_291;
            }
            sub_1A03C();
            if (v36) {
              goto LABEL_201;
            }
            goto LABEL_258;
          }

LABEL_124:
          sub_1A090();
        }

        sub_1A0DC();
        uint64_t v169 = sub_1A090();
        uint64_t v64 = v326;
        if (v6 == (char *)v36)
        {
LABEL_174:
          sub_1A0E4();
          int v137 = 0;
          uint64_t v70 = v330;
          goto LABEL_86;
        }
      }
    }

    goto LABEL_175;
  }

  sub_1A010();
  uint64_t v74 = sub_1A070();
  if ((v32 & 1) != 0) {
    goto LABEL_109;
  }
  sub_1A0AC(v74, enum case for HomeSuggestionType.powerAccessories(_:));
  sub_1A27C();
  sub_1A04C();
  if (v32 == v339 && v67 == (void)v334)
  {
    sub_6324();
LABEL_138:
    sub_1A390();
    sub_1A32C();
    if (v191)
    {
      sub_19FD0();
      uint64_t v36 = sub_634C();
    }

    else
    {
      sub_1A03C();
    }

    sub_1A670();
    if (v36)
    {
      sub_1A07C();
      while (1)
      {
        if (v34) {
          uint64_t v109 = sub_1A0D0();
        }
        else {
          uint64_t v109 = sub_1A060(v192, v193, v194, v195, v196, v197, v198, v199, v324, v325);
        }
        BOOL v177 = __OFADD__(v6++, 1LL);
        if (v177) {
          goto LABEL_240;
        }
        uint64_t v200 = sub_1A0C8();
        dispatch thunk of Accessory.type.getter(v200);
        uint64_t v201 = v336[2];
        if (v201)
        {
          sub_1A0B8();
          sub_1A344();
          if (v32 == sub_1A004()) {
            goto LABEL_259;
          }
          if (v201 != 1)
          {
            while (1)
            {
              sub_1A3DC();
              if (v177) {
                break;
              }
              sub_1A128( v202,  v203,  v204,  v205,  v206,  v207,  v208,  v209,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
              if (v32 == sub_1A004()) {
                goto LABEL_259;
              }
              sub_1A3B0();
              if (v68) {
                goto LABEL_153;
              }
            }

            __break(1u);
LABEL_218:
            __break(1u);
LABEL_219:
            sub_1A164(0LL);
            goto LABEL_103;
          }

LABEL_153:
          sub_1A090();
        }

        sub_1A0DC();
        uint64_t v192 = sub_1A090();
        uint64_t v64 = v326;
      }
    }

    goto LABEL_175;
  }

  sub_1A010();
  uint64_t v76 = sub_1A070();
  if ((v32 & 1) != 0) {
    goto LABEL_138;
  }
  sub_1A0AC(v76, enum case for HomeSuggestionType.setBrightness(_:));
  sub_1A27C();
  sub_1A04C();
  if (v32 == v339 && v67 == (void)v334)
  {
    sub_6324();
  }

  else
  {
    sub_1A010();
    uint64_t v78 = sub_1A070();
    if ((v32 & 1) == 0)
    {
      sub_1A0AC(v78, enum case for HomeSuggestionType.setClimateMode(_:));
      sub_1A27C();
      sub_1A04C();
      if (v32 == v339 && v67 == (void)v334)
      {
        sub_6324();
      }

      else
      {
        sub_1A010();
        uint64_t v80 = sub_1A070();
        if ((v32 & 1) == 0)
        {
          sub_1A0AC(v80, enum case for HomeSuggestionType.setColor(_:));
          sub_1A27C();
          sub_1A04C();
          if (v32 == v339 && v67 == (void)v334) {
            goto LABEL_198;
          }
          sub_1A140(v32, v67, v339, (uint64_t)v334);
          uint64_t v82 = sub_1A070();
          if ((v32 & 1) != 0) {
            goto LABEL_199;
          }
          sub_1A0AC(v82, enum case for HomeSuggestionType.setFanSpeed(_:));
          uint64_t v83 = sub_1A27C();
          uint64_t v91 = sub_1A178( v83,  v84,  v85,  v86,  v87,  v88,  v89,  v90,  v324,  v325,  (uint64_t)v326,  (uint64_t (*)(uint64_t, uint64_t))v6);
          if (v32 == v339 && v67 == (void)v334)
          {
            sub_1A704( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)"ggestion. Invalidating ",  (uint64_t)v334);
          }

          else
          {
            sub_1A140(v32, v67, v339, (uint64_t)v334);
            uint64_t v100 = sub_1A070();
            if ((v32 & 1) == 0)
            {
              sub_1A0AC(v100, enum case for HomeSuggestionType.setTemperature(_:));
              uint64_t v101 = sub_1A27C();
              uint64_t v109 = sub_1A178(v101, v102, v103, v104, v105, v106, v107, v108, v324, v325, (uint64_t)v326, v327);
              if (v32 == v339 && v67 == (void)v334) {
                goto LABEL_241;
              }
              sub_1A140(v32, v67, v339, (uint64_t)v334);
              uint64_t v118 = sub_1A070();
              if ((v32 & 1) != 0) {
                goto LABEL_242;
              }
              sub_1A0AC(v118, enum case for HomeSuggestionType.setScene(_:));
              uint64_t v119 = sub_1A27C();
              uint64_t v127 = sub_1A178(v119, v120, v121, v122, v123, v124, v125, v126, v324, v325, (uint64_t)v326, v327);
              if (v32 != v339 || v67 != (void)v334)
              {
                sub_1A140(v32, v67, v339, (uint64_t)v334);
                uint64_t v136 = sub_1A070();
                if ((v32 & 1) == 0)
                {
LABEL_260:
                  int v137 = 1;
                  goto LABEL_261;
                }

LABEL_267:
                uint64_t result = dispatch thunk of Home.scenes.getter(v136);
                uint64_t v305 = result;
                if ((unint64_t)result >> 62)
                {
                  if (result >= 0) {
                    result &= 0xFFFFFFFFFFFFFF8uLL;
                  }
                  uint64_t result = _CocoaArrayWrapper.endIndex.getter(result);
                  uint64_t v306 = result;
                  if (result) {
                    goto LABEL_269;
                  }
                }

                else
                {
                  uint64_t v306 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFF8LL));
                  if (v306)
                  {
LABEL_269:
                    if (v306 < 1)
                    {
                      __break(1u);
                      return result;
                    }

                    for (uint64_t i = 0LL; i != v306; ++i)
                    {
                      if ((v305 & 0xC000000000000001LL) != 0)
                      {
                        uint64_t v308 = sub_1A0D0();
                      }

                      else
                      {
                        uint64_t v308 = *(void *)(v305 + 8 * i + 32);
                        swift_retain(v308);
                      }

                      uint64_t v309 = dispatch thunk of Scene.actions.getter();
                      if ((unint64_t)v309 >> 62)
                      {
                        if (v309 >= 0) {
                          v309 &= 0xFFFFFFFFFFFFFF8uLL;
                        }
                        uint64_t v310 = _CocoaArrayWrapper.endIndex.getter(v309);
                      }

                      else
                      {
                        uint64_t v310 = *(void *)((char *)&dword_10 + (v309 & 0xFFFFFFFFFFFFF8LL));
                      }

                      uint64_t v311 = sub_1A0A4();
                      if (v310)
                      {
                        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v311);
                        uint64_t v312 = _swiftEmptyArrayStorage[2];
                        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v312);
                        uint64_t v313 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)( v312,  v308);
                        specialized ContiguousArray._endMutation()(v313);
                      }

                      else
                      {
                        swift_release(v308);
                      }
                    }
                  }
                }

                sub_1A488();
                if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000LL) != 0
                  || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) != 0)
                {
                  uint64_t v323 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
                  uint64_t v314 = _CocoaArrayWrapper.endIndex.getter(v323);
                  sub_1A0DC();
                }

                else
                {
                  uint64_t v314 = _swiftEmptyArrayStorage[2];
                }

                sub_1A0DC();
                if (v314) {
                  goto LABEL_260;
                }
                uint64_t v315 = *((void *)v340 + 13);
                uint64_t v316 = *((void *)v340 + 10);
                v328(v315, (void (*)(void, void))v329, v316);
                sub_239AC(45LL);
                swift_bridgeObjectRelease();
                uint64_t v70 = v330;
                *((void *)v340 + 8) = v330;
                uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v329;
                uint64_t v317 = type metadata accessor for Home(0LL);
                sub_159CC( (unint64_t *)&qword_493C0,  (uint64_t (*)(uint64_t))&type metadata accessor for Home,  (uint64_t)&protocol conformance descriptor for Entity);
                v345._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v317, v318);
                sub_1A6B4(v345);
                sub_149B4();
                sub_1A2F8();
                Logger.warning(output:test:file:function:line:)(v319, v320, v321, v322, 173LL);
                sub_149B4();
                uint64_t v64 = v326;
                v326(v315, v316);
LABEL_88:
                int v137 = 0;
                goto LABEL_89;
              }

LABEL_266:
              uint64_t v136 = sub_1A704( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334);
              goto LABEL_267;
            }
          }

          sub_1A688();
          sub_1A32C();
          if (v251) {
            goto LABEL_295;
          }
          sub_1A03C();
          if (v339) {
            goto LABEL_223;
          }
          goto LABEL_258;
        }
      }

      sub_1A390();
      sub_1A32C();
      if (v221) {
        goto LABEL_287;
      }
      sub_1A03C();
      if (v339) {
        goto LABEL_180;
      }
      goto LABEL_258;
    }
  }

  sub_1A390();
  sub_1A32C();
  if (v210)
  {
    sub_19FD0();
    uint64_t v36 = sub_634C();
  }

  else
  {
    sub_1A03C();
  }

  sub_1A670();
  if (!v36)
  {
LABEL_175:
    sub_1A0E4();
    int v137 = 0;
    uint64_t v70 = v330;
    goto LABEL_89;
  }

  sub_1A07C();
  while (1)
  {
    if (v34) {
      uint64_t v127 = sub_1A0D0();
    }
    else {
      uint64_t v127 = sub_1A060(v211, v212, v213, v214, v215, v216, v217, v218, v324, v325);
    }
    BOOL v177 = __OFADD__(v6++, 1LL);
    if (v177)
    {
LABEL_265:
      __break(1u);
      goto LABEL_266;
    }

    uint64_t v219 = sub_1A0C8();
    dispatch thunk of Accessory.type.getter(v219);
    uint64_t v220 = v336[2];
    if (v220) {
      break;
    }
LABEL_173:
    sub_1A0DC();
    uint64_t v211 = sub_1A090();
    uint64_t v64 = v326;
  }

  sub_1A0B8();
  sub_1A344();
  if (v32 == sub_1A004()) {
    goto LABEL_259;
  }
  if (v220 == 1)
  {
LABEL_172:
    sub_1A090();
    goto LABEL_173;
  }

  while (1)
  {
    sub_1A3DC();
    if (v177) {
      break;
    }
    sub_1A128( v109,  v110,  v111,  v112,  v113,  v114,  v115,  v116,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
    if (v32 == sub_1A004()) {
      goto LABEL_259;
    }
    sub_1A3B0();
    if (v68) {
      goto LABEL_172;
    }
  }

  __break(1u);
LABEL_240:
  __break(1u);
LABEL_241:
  sub_1A704( v109,  v110,  v111,  v112,  v113,  v114,  v115,  v116,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334);
LABEL_242:
  sub_1A688();
  sub_1A32C();
  if (v270)
  {
LABEL_298:
    sub_19FD0();
    uint64_t v36 = sub_634C();
    if (!v36) {
      goto LABEL_258;
    }
  }

  else
  {
    sub_1A03C();
    if (!v36) {
      goto LABEL_258;
    }
  }

  sub_1A07C();
  while (2)
  {
    if (v34) {
      sub_1A0D0();
    }
    else {
      sub_1A060(v271, v272, v273, v274, v275, v276, v277, v278, v324, v325);
    }
    BOOL v177 = __OFADD__(v6++, 1LL);
    if (v177)
    {
      __break(1u);
      goto LABEL_298;
    }

    uint64_t v279 = sub_1A480();
    dispatch thunk of Accessory.type.getter(v279);
    uint64_t v280 = v336[2];
    if (!v280)
    {
LABEL_257:
      uint64_t v297 = sub_1A0DC();
      uint64_t v271 = sub_1A650( v297,  v298,  v299,  v300,  v301,  v302,  v303,  v304,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
      continue;
    }

    break;
  }

  uint64_t v32 = v336[4];
  swift_bridgeObjectRetain(v336);
  sub_1A344();
  uint64_t v281 = sub_1A004();
  if (v32 == v281) {
    goto LABEL_259;
  }
  if (v280 == 1)
  {
LABEL_256:
    sub_1A650( v281,  v282,  v283,  v284,  v285,  v286,  v287,  v288,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
    goto LABEL_257;
  }

  while (1)
  {
    sub_1A3DC();
    if (v177) {
      break;
    }
    sub_1A128( v289,  v290,  v291,  v292,  v293,  v294,  v295,  v296,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
    if (v32 == sub_1A004()) {
      goto LABEL_259;
    }
    sub_1A3B0();
    if (v68) {
      goto LABEL_256;
    }
  }

  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_295:
    sub_19FD0();
    uint64_t v36 = sub_634C();
    if (!v36) {
      break;
    }
LABEL_223:
    sub_1A07C();
    while (1)
    {
      if (v34) {
        sub_1A0D0();
      }
      else {
        sub_1A060(v252, v253, v254, v255, v256, v257, v258, v259, v324, v325);
      }
      BOOL v177 = __OFADD__(v6++, 1LL);
      if (v177) {
        break;
      }
      uint64_t v260 = sub_1A0C8();
      dispatch thunk of Accessory.type.getter(v260);
      uint64_t v261 = v336[2];
      if (v261)
      {
        sub_1A0B8();
        sub_1A344();
        if (v32 == sub_1A004()) {
          goto LABEL_259;
        }
        if (v261 != 1)
        {
          while (1)
          {
            sub_1A3DC();
            if (v177) {
              break;
            }
            sub_1A128( v262,  v263,  v264,  v265,  v266,  v267,  v268,  v269,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
            if (v32 == sub_1A004()) {
              goto LABEL_259;
            }
            sub_1A3B0();
            if (v68) {
              goto LABEL_235;
            }
          }

          __break(1u);
          while (1)
          {
            __break(1u);
LABEL_291:
            sub_19FD0();
            uint64_t v36 = sub_634C();
            if (!v36) {
              goto LABEL_258;
            }
LABEL_201:
            sub_1A07C();
            while (1)
            {
              if (v34) {
                sub_1A0D0();
              }
              else {
                sub_1A060(v233, v234, v235, v236, v237, v238, v239, v240, v324, v325);
              }
              BOOL v177 = __OFADD__(v6++, 1LL);
              if (v177) {
                break;
              }
              uint64_t v241 = sub_1A0C8();
              dispatch thunk of Accessory.type.getter(v241);
              uint64_t v242 = v336[2];
              if (v242)
              {
                sub_1A0B8();
                sub_1A344();
                if (v32 == sub_1A004()) {
                  goto LABEL_259;
                }
                if (v242 != 1)
                {
                  while (1)
                  {
                    sub_1A3DC();
                    if (v177) {
                      break;
                    }
                    sub_1A128( v243,  v244,  v245,  v246,  v247,  v248,  v249,  v250,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
                    if (v32 == sub_1A004()) {
                      goto LABEL_259;
                    }
                    sub_1A3B0();
                    if (v68) {
                      goto LABEL_213;
                    }
                  }

                  __break(1u);
                  while (1)
                  {
                    __break(1u);
LABEL_287:
                    sub_19FD0();
                    uint64_t v36 = sub_634C();
                    if (!v36) {
                      goto LABEL_258;
                    }
LABEL_180:
                    sub_1A07C();
                    while (1)
                    {
                      if (v34) {
                        sub_1A0D0();
                      }
                      else {
                        sub_1A060(v222, v223, v224, v225, v226, v227, v228, v229, v324, v325);
                      }
                      BOOL v177 = __OFADD__(v6++, 1LL);
                      if (v177) {
                        break;
                      }
                      uint64_t v230 = sub_1A0C8();
                      dispatch thunk of Accessory.type.getter(v230);
                      uint64_t v231 = v336[2];
                      if (v231)
                      {
                        sub_1A0B8();
                        sub_1A344();
                        if (v32 == sub_1A004()) {
                          goto LABEL_259;
                        }
                        if (v231 != 1)
                        {
                          while (1)
                          {
                            sub_1A3DC();
                            if (v177) {
                              break;
                            }
                            sub_1A128( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
                            if (v32 == sub_1A004()) {
                              goto LABEL_259;
                            }
                            sub_1A3B0();
                            if (v68) {
                              goto LABEL_192;
                            }
                          }

                          __break(1u);
                          goto LABEL_265;
                        }

LABEL_192:
                        sub_1A090();
                      }

                      sub_1A0DC();
                      uint64_t v222 = sub_1A090();
                    }
                  }
                }

LABEL_213:
                sub_1A090();
              }

              sub_1A0DC();
              uint64_t v233 = sub_1A090();
            }
          }
        }

LABEL_235:
        sub_1A090();
      }

      sub_1A0DC();
      uint64_t v252 = sub_1A090();
    }
  }

LABEL_258:
  sub_1A0E4();
  int v137 = 0;
LABEL_261:
  uint64_t v34 = (uint64_t (*)(uint64_t, void, uint64_t))v329;
  uint64_t v70 = v330;
LABEL_262:
  uint64_t v64 = v326;
LABEL_89:
  uint64_t v142 = *((void *)v340 + 28);
  uint64_t v143 = *((void *)v340 + 16);
  uint64_t v144 = *((void *)v340 + 12);
  uint64_t v145 = *((void *)v340 + 10);
  v328(v144, (void (*)(void, void))v34, v145);
  sub_1A378();
  _StringGuts.grow(_:)(29LL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain(v334);
  v146._countAndFlagsBits = v339;
  v146._object = v334;
  String.append(_:)(v146);
  swift_bridgeObjectRelease();
  v147._countAndFlagsBits = 0x64696C6156736920LL;
  v147._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v147);
  unsigned int v338 = v137;
  if (v137) {
    uint64_t v148 = 1702195828LL;
  }
  else {
    uint64_t v148 = 0x65736C6166LL;
  }
  if (v137) {
    unint64_t v149 = 0xE400000000000000LL;
  }
  else {
    unint64_t v149 = 0xE500000000000000LL;
  }
  unint64_t v150 = v149;
  String.append(_:)(*(Swift::String *)&v148);
  sub_149B4();
  sub_1A2F8();
  Logger.debug(output:test:caller:)(v151, v152, v153);
  sub_149B4();
  swift_release(v70);
  v64(v144, v145);
  uint64_t v0 = v340;
  uint64_t v154 = v327(v142, v143);
  sub_1A650( v154,  v155,  v156,  v157,  v158,  v159,  v160,  v161,  v324,  v325,  (uint64_t)v326,  (uint64_t)v327,  (uint64_t)v328,  v329,  v330,  (uint64_t)v332,  (uint64_t)v334,  (uint64_t)v336);
LABEL_96:
  uint64_t v162 = *((void *)v0 + 21);
  uint64_t v163 = *((void *)v0 + 19);
  uint64_t v164 = *((void *)v0 + 20);
  uint64_t v331 = *((void *)v0 + 18);
  uint64_t v333 = *((void *)v0 + 15);
  uint64_t v335 = *((void *)v0 + 14);
  uint64_t v337 = *((void *)v0 + 13);
  uint64_t v341 = *((void *)v0 + 12);
  swift_task_dealloc(*((void *)v0 + 28));
  sub_11CCC();
  sub_11CB4();
  sub_1A3E8();
  sub_1A3A0();
  sub_1A398();
  sub_1A388();
  swift_task_dealloc(v162);
  swift_task_dealloc(v164);
  swift_task_dealloc(v163);
  swift_task_dealloc(v331);
  swift_task_dealloc(v333);
  swift_task_dealloc(v335);
  swift_task_dealloc(v337);
  swift_task_dealloc(v341);
  return (*((uint64_t (**)(void))v0 + 1))(v338);
}

uint64_t sub_187C4()
{
  return v0;
}

uint64_t sub_187E8()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for HomeAutomationCandidateSuggestionConfigurator()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions45HomeAutomationCandidateSuggestionConfigurator);
}

uint64_t sub_18828(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_493EC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_18878;
  return sub_162E0(a1);
}

uint64_t sub_18878()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_188A4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_493B4);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_188EC;
  return sub_17280();
}

uint64_t sub_188EC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

char *sub_18924(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }

  return __src;
}

char *sub_189A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[2 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 2 * a2);
  }

  return __src;
}

char *sub_18A2C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1A028();
    uint64_t result = (char *)sub_1A16C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_1A0FC(a3, result);
  }

  return result;
}

char *sub_18A90(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1A028();
    uint64_t result = (char *)sub_1A16C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_1A0FC(a3, result);
  }

  return result;
}

char *sub_18AF4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1A028();
    uint64_t result = (char *)sub_1A16C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)sub_1A0FC(a3, result);
  }

  return result;
}

void *sub_18B60(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_18C28(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[2 * a2] <= __src || &__src[2 * a2] <= __dst) {
      return memcpy(__dst, __src, 2 * a2);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_18CF0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_1A028();
    sub_1A610();
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    sub_1A028();
    sub_1A600();
  }

  uint64_t result = (void *)sub_1A16C(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

uint64_t sub_18D88(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_1A028();
    sub_1A610();
  }

  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    sub_1A028();
    sub_1A600();
  }

  uint64_t result = sub_1A16C(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

uint64_t sub_18E24(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_1A028();
    sub_1A610();
  }

  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      a4(0LL);
      return swift_arrayInitWithCopy(a3);
    }

    sub_1A028();
    sub_1A600();
  }

  uint64_t result = sub_1A16C(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  __break(1u);
  return result;
}

unint64_t sub_18EDC(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = Hasher._finalize()();
  return sub_18FF8(a1, a2, v4);
}

unint64_t sub_18F38(uint64_t a1)
{
  Swift::UInt v2 = HomeDeviceType.rawValue.getter(a1);
  Hasher._combine(_:)(v2);
  Swift::Int v3 = Hasher._finalize()();
  return sub_190D8(a1, v3);
}

unint64_t sub_18F8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for HomeSuggestionType(0LL);
  sub_159CC( &qword_493D8,  (uint64_t (*)(uint64_t))&type metadata accessor for HomeSuggestionType,  (uint64_t)&protocol conformance descriptor for HomeSuggestionType);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_191C0(a1, v7);
}

unint64_t sub_18FF8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_190D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v7 = HomeDeviceType.rawValue.getter(*(void *)(*(void *)(v2 + 48) + 8 * i));
    if (v7 != HomeDeviceType.rawValue.getter(a1))
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        uint64_t v9 = HomeDeviceType.rawValue.getter(*(void *)(*(void *)(v2 + 48) + 8 * i));
        if (v9 == HomeDeviceType.rawValue.getter(a1)) {
          break;
        }
      }
    }
  }

  return i;
}

unint64_t sub_191C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_159CC( &qword_493E0,  (uint64_t (*)(uint64_t))&type metadata accessor for HomeSuggestionType,  (uint64_t)&protocol conformance descriptor for HomeSuggestionType);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

char *sub_19300(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1951C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_1931C(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_19328(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    sub_1A57C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_1A55C();
    }
  }

  sub_1A54C();
  if (v4)
  {
    uint64_t v10 = sub_4D88(&qword_49460);
    uint64_t v11 = (const void *)sub_1A304(v10, 8 * v4);
    size_t v12 = j__malloc_size(v11);
    sub_1A51C(v12 - 32);
  }

  uint64_t v13 = (char *)sub_1A50C();
  if ((a1 & 1) != 0)
  {
    sub_18924(v13, v14, v15);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18B60(v13, v14, v15);
  }

  sub_8BF4();
  sub_1A338();
}

void sub_193CC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    sub_1A57C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_1A55C();
    }
  }

  sub_1A54C();
  if (v4)
  {
    uint64_t v10 = sub_4D88(&qword_49468);
    uint64_t v11 = (const void *)sub_1A304(v10, 2 * v4);
    size_t v12 = j__malloc_size(v11);
    sub_1A51C(v12 - 32);
  }

  uint64_t v13 = (char *)sub_1A50C();
  if ((a1 & 1) != 0)
  {
    sub_189A8(v13, v14, v15);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18C28(v13, v14, v15);
  }

  sub_8BF4();
  sub_1A338();
}

void sub_19470(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1947C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    sub_1A57C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_1A55C();
    }
  }

  sub_1A54C();
  if (v4)
  {
    uint64_t v11 = sub_4D88(v10);
    size_t v12 = (const void *)sub_1A304(v11, 8 * v4);
    size_t v13 = j__malloc_size(v12);
    sub_1A51C(v13 - 32);
  }

  uint64_t v14 = (char *)sub_1A50C();
  if ((a1 & 1) != 0)
  {
    sub_18A2C(v14, v15, v16);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18CF0(v14, v15, v16);
  }

  sub_8BF4();
  sub_1A338();
}

char *sub_1951C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
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
  if (v9)
  {
    uint64_t v10 = sub_4D88(&qword_493D0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  size_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_18A90(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18D88((unint64_t)v14, v8, (unint64_t)v13);
  }

  swift_release(a4);
  return v11;
}

void *sub_195FC(uint64_t a1)
{
  return sub_19724( a1,  (void (*)(void))&type metadata accessor for Accessory,  &qword_49418,  &qword_49410,  (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_199E8);
}

void *sub_19620(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_4D88(&qword_493C8);
  uint64_t v4 = (void *)swift_allocObject(v3, 8 * v1 + 32, 7LL);
  size_t v5 = j__malloc_size(v4);
  v4[2] = v1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 8);
  unint64_t v6 = sub_19C94(&v9, v4 + 4, v1, a1);
  uint64_t v7 = v9;
  swift_bridgeObjectRetain(a1);
  sub_19E28(v7);
  if (v6 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

void *sub_19700(uint64_t a1)
{
  return sub_19724( a1,  (void (*)(void))&type metadata accessor for Scene,  &qword_49428,  &qword_49420,  (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_19A1C);
}

void *sub_19724( uint64_t a1, void (*a2)(void), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (!v10) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v10 <= 0)
    {
      size_t v12 = _swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v11 = sub_4D88(&qword_48FD0);
      size_t v12 = (void *)sub_1A304(v11, 8 * v10);
      size_t v13 = j__malloc_size(v12);
      v12[2] = v10;
      v12[3] = (2 * ((uint64_t)(v13 - 32) / 8)) | 1;
    }

    sub_1A470();
    sub_1986C((uint64_t)(v12 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v14;
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_8:
    if (a1 < 0) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_1A470();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v15);
    sub_1A15C();
    if (!v10) {
      return _swiftEmptyArrayStorage;
    }
  }

  return v12;
}

uint64_t sub_19834@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1LL;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1LL << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0LL;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1986C( uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  unint64_t v13 = result;
  unint64_t v14 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    sub_1A480();
    uint64_t v15 = sub_634C();
    uint64_t result = sub_149B4();
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
      sub_1A480();
      uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v16);
      uint64_t result = sub_149B4();
      if (v17 <= a2)
      {
        if (v15 >= 1)
        {
          sub_19F54(a5, a6);
          uint64_t v19 = v18;
          sub_1A480();
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            uint64_t v21 = sub_4D88(a6);
            Swift::String v22 = (void (*)(_BYTE *, void))a7(v25, i, a3, v21, v19);
            uint64_t v24 = *v23;
            swift_retain(*v23);
            v22(v25, 0LL);
            *(void *)(v13 + 8 * i) = v24;
          }

          sub_149B4();
          return a3;
        }

        goto LABEL_19;
      }
    }

    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL)) <= a2)
      {
        sub_18E24((a3 & 0xFFFFFFFFFFFFFF8LL) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL)), v13, a4);
        return a3;
      }

      __break(1u);
    }

    __break(1u);
LABEL_19:
    __break(1u);
  }

  __break(1u);
  return result;
}

void sub_199E8()
{
  uint64_t v1 = sub_1A4CC();
  uint64_t v2 = sub_1A6C8((uint64_t)v1);
  sub_19A78(v2, v3);
  *(void *)(v0 + 32) = v4;
  sub_1A338();
}

void sub_19A1C()
{
  uint64_t v1 = sub_1A4CC();
  uint64_t v2 = sub_1A6C8((uint64_t)v1);
  sub_19AB8(v2, v3);
  *(void *)(v0 + 32) = v4;
  sub_1A338();
}

void sub_19A4C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void sub_19A78(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1A49C(a1, a2);
  sub_625C(v4, v5, v6);
  if (v3) {
    uint64_t v7 = sub_1A6E4();
  }
  else {
    uint64_t v7 = sub_1A658();
  }
  *uint64_t v2 = v7;
  sub_1A338();
}

void sub_19AB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1A49C(a1, a2);
  sub_625C(v4, v5, v6);
  if (v3) {
    uint64_t v7 = sub_1A6E4();
  }
  else {
    uint64_t v7 = sub_1A658();
  }
  *uint64_t v2 = v7;
  sub_1A338();
}

uint64_t sub_19AF8(void *a1)
{
  return swift_release(*a1);
}

void *sub_19B00(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1LL;
  uint64_t v6 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0LL;
    a3 = 0LL;
LABEL_36:
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
    goto LABEL_36;
  }

  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }

  int64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }

  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
    goto LABEL_38;
  }

  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2LL;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13;
    goto LABEL_35;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }

  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }

  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0LL;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
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
      goto LABEL_35;
    }

    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

    sub_2DCA0();
    swift_release(v29);
    return (*(uint64_t (**)(void *))(v1 + 8))(_swiftEmptyArrayStorage);
  }

void *sub_19C94(void *result, void *a2, uint64_t a3, uint64_t a4)
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
LABEL_36:
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
    goto LABEL_36;
  }

  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }

  int64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }

  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
    goto LABEL_38;
  }

  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2LL;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13;
    goto LABEL_35;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }

  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }

  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0LL;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }

  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
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
      goto LABEL_35;
    }

    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }

uint64_t sub_19E28(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_19E34()
{
  unint64_t result = qword_493F8;
  if (!qword_493F8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_493F8);
  }

  return result;
}

uint64_t sub_19E70(uint64_t a1)
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

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192LL;
    return __clz(__rbit64(v1)) + v2;
  }

  uint64_t v2 = 192LL;
  for (uint64_t i = 12LL; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64LL;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

uint64_t sub_19F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_19F54(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_6844(a2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for [A], v3), a1);
  }

  sub_15A5C();
}

unint64_t sub_19F90()
{
  unint64_t result = qword_49450;
  if (!qword_49450)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for HomeDeviceType,  &type metadata for HomeDeviceType);
    atomic_store(result, (unint64_t *)&qword_49450);
  }

  return result;
}

uint64_t sub_19FD0()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_19FE4()
{
  return (*(uint64_t (**)(void, void))(v0[32] + 8LL))(v0[33], v0[31]);
}

uint64_t sub_1A004()
{
  return HomeDeviceType.rawValue.getter(v0);
}

uint64_t sub_1A010()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(v0, v1, v3, v2, 0LL);
}

  ;
}

uint64_t sub_1A03C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1A04C()
{
  return v2(v0, v1);
}

uint64_t sub_1A060( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_retain(*(void *)(a10 + 8 * v10));
}

uint64_t sub_1A070()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_1A090()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1A098(uint64_t a1, uint64_t a2)
{
  return Dictionary.init(dictionaryLiteral:)(a1, a2, v3, v2);
}

uint64_t sub_1A0A4()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1A0AC(uint64_t a1, uint64_t a2)
{
  return v3(v2, a2, v4);
}

uint64_t sub_1A0B8()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1A0C8()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1A0D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

uint64_t sub_1A0DC()
{
  return swift_release(v0);
}

uint64_t sub_1A0E4()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t sub_1A0F0(uint64_t a1, uint64_t a2)
{
  return v2(v3, a2, v4);
}

void *sub_1A0FC@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void sub_1A10C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v3._object = (void *)(a2 | 0x8000000000000000LL);
  uint64_t v4 = v2;
  v3._countAndFlagsBits = 0xD00000000000008ALL;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, v3);
}

uint64_t sub_1A128( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return HomeDeviceType.rawValue.getter(*(void *)(a18 + 8 * v18));
}

void sub_1A134(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2 = (a2 - 32) | 0x8000000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_1A140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_1A148()
{
  return type metadata accessor for Signpost.Context(0LL);
}

uint64_t sub_1A15C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1A164(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

uint64_t sub_1A16C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 25LL, a9, a10, a11);
}

uint64_t sub_1A178( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t))
{
  return a12(v12, v13);
}

uint64_t sub_1A190( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Signpost.end(logging:_:_:_:)(v13, a12, v14, v15, v16, v12);
}

uint64_t sub_1A1C8(uint64_t a1)
{
  return static Signpost.end(logging:_:_:_:)(v3, v2, v4, v5, v6, v1);
}

void sub_1A200(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  v5._object = (void *)(a3 | 0x8000000000000000LL);
  unint64_t v6 = (v3 - 32) | 0x8000000000000000LL;
  uint64_t v7 = v4;
  v5._countAndFlagsBits = 0xD00000000000008ALL;
  Logger.warning(output:test:file:function:line:)(*(Swift::String *)&a1, 0, v5, *(Swift::String *)&a2, 97LL);
}

uint64_t sub_1A228(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1A244(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1A260()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_1A27C()
{
  return HomeSuggestionType.rawValue.getter();
}

uint64_t sub_1A284()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_1A2A4(uint64_t a1)
{
  return v2;
}

uint64_t sub_1A2C8()
{
  return swift_initStackObject(v0);
}

  ;
}

  ;
}

uint64_t sub_1A304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_allocObject(a1, a2 + 32, 7LL);
}

uint64_t sub_1A310(uint64_t a1)
{
  *(void *)(v3 + 400) = a1;
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v3 + 408) = v5;
  return v5(v1, a1, v2);
}

  ;
}

  ;
}

uint64_t sub_1A344()
{
  return HomeDeviceType.rawValue.getter(v0);
}

uint64_t sub_1A34C@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

uint64_t sub_1A358()
{
  return type metadata accessor for Signpost.Context(0LL);
}

uint64_t sub_1A360()
{
  return (*(uint64_t (**)(void, void))(v0 + 288))(*(void *)(v0 + 240), *(void *)(v0 + 216));
}

void sub_1A378()
{
  *(void *)(v0 - 88) = 0LL;
  *(void *)(v0 - 80) = 0xE000000000000000LL;
}

uint64_t sub_1A388()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1A390()
{
  return dispatch thunk of Home.accessories.getter();
}

uint64_t sub_1A398()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1A3A0()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1A3A8()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

unint64_t sub_1A3BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v14 + 128) = a13;
  *(void *)(v14 + 136) = a14;
  return 0xD000000000000031LL;
}

  ;
}

uint64_t sub_1A3E8()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1A3F0()
{
  uint64_t v2 = *v1;
  *(void *)(v0 + 424) = *v1;
  *(void *)(v0 + 432) = v1[1];
  return swift_getObjectType(v2);
}

char *sub_1A408@<X0>(unint64_t a1@<X8>)
{
  return sub_19300((char *)(a1 > 1), v1, 1);
}

void sub_1A420()
{
}

void sub_1A434()
{
}

uint64_t sub_1A448(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, a1, v3);
}

uint64_t sub_1A45C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(v10, v11);
}

uint64_t sub_1A470()
{
  return swift_bridgeObjectRetain(v0);
}

void sub_1A478(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_1A480()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1A488()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1A490(uint64_t a1)
{
  return dispatch thunk of Actor.unownedExecutor.getter(a1, *(void *)(*(void *)(v1 + 8) + 8LL));
}

uint64_t sub_1A49C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A4B8()
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v2 + 416) = v4;
  return v4(v0, v1);
}

void *sub_1A4CC()
{
  return malloc(0x28uLL);
}

uint64_t sub_1A4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return dispatch thunk of Entity.description.getter(a1, a2, a3, a4, a5, a6);
}

void sub_1A4F4(Swift::String a1)
{
}

void sub_1A4FC( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  v15._countAndFlagsBits = v14;
  v15._object = v13;
  String.append(_:)(v15);
}

uint64_t sub_1A50C()
{
  return v0 + 32;
}

void sub_1A51C(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

  ;
}

void sub_1A53C()
{
  *(void *)(v1 - 8) = *v0;
}

  ;
}

  ;
}

void sub_1A56C()
{
  *(void *)(v1 - 8) = *v0;
}

  ;
}

  ;
}

uint64_t sub_1A59C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t))
{
  return a11(a9, v11);
}

uint64_t sub_1A5AC()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1A5B4()
{
  return sub_170CC(v0);
}

void sub_1A5C4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2 = (a2 - 32) | 0x8000000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

  ;
}

uint64_t sub_1A5F0()
{
  return _print_unlocked<A, B>(_:_:)(v1, v0, v2);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_1A634@<X0>(uint64_t a1@<X8>)
{
  return swift_task_dealloc(a1);
}

uint64_t sub_1A63C()
{
  return swift_retain(v0);
}

uint64_t sub_1A648(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_1A650( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return swift_bridgeObjectRelease(a18);
}

uint64_t sub_1A658()
{
  return swift_retain(*(void *)(v0 + 8 * v1 + 32));
}

uint64_t sub_1A664()
{
  return swift_release_n(*(void *)(v0 + 392), 2LL);
}

  ;
}

void *sub_1A67C(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, *(void *)(v1 + 40));
}

uint64_t sub_1A688()
{
  return dispatch thunk of Home.accessories.getter();
}

void *sub_1A690()
{
  return sub_28D90(v1, v0);
}

__n128 sub_1A69C( __n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

void sub_1A6A8()
{
  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

void sub_1A6B4(Swift::String a1)
{
}

  ;
}

uint64_t sub_1A6C8(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t sub_1A6DC()
{
  return type metadata accessor for HomeSuggestionType(0LL);
}

uint64_t sub_1A6E4()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

uint64_t sub_1A6F0()
{
  return *(void *)(v0 + 176);
}

uint64_t sub_1A704( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_bridgeObjectRelease(a17);
}

double sub_1A70C(uint64_t a1, double result)
{
  if (a1 == 3)
  {
    double v2 = (result + -32.0) * 5.0 / 9.0;
  }

  else
  {
    if (a1 != 2) {
      return result;
    }
    double v2 = result * 9.0 / 5.0 + 32.0;
  }

  return round(v2 * 10.0) / 10.0;
}

uint64_t sub_1A76C()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CA60);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.createAutomation(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_1A7B8()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CA78);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24978();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for CreateAutomationSuggestion()
{
  return &type metadata for CreateAutomationSuggestion;
}

uint64_t sub_1A824()
{
  uint64_t v0 = sub_4D88(&qword_49470);
  uint64_t v1 = type metadata accessor for DeviceType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = swift_allocObject(v0, v4 + *(void *)(v2 + 72), v3 | 7);
  *(_OWORD *)(v5 + 16) = xmmword_2FE90;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5 + v4, enum case for DeviceType.watch(_:), v1);
  return v5;
}

uint64_t sub_1A8B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48CF0 != -1) {
    swift_once(&qword_48CF0, sub_1A76C);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CA60);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v9, 40LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v13[3] = v9;
  v13[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_1A9E4@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v46.n128_u64[0] = a1;
  int64_t v50 = a2;
  v49.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v47 = *(void *)(v49.n128_u64[0] - 8);
  __chkstk_darwin(v49.n128_u64[0]);
  unint64_t v48 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v45 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 2 * v45, v10 | 7);
  uint64_t v51 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30550;
  uint64_t v13 = v12 + v11;
  sub_8314(v12, enum case for SuggestionParameter.accessoryType(_:));
  uint64_t v14 = type metadata accessor for AccessoryTypeResolver();
  sub_1251C(v14, 32LL);
  uint64_t v15 = sub_284F0();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  v16[4] = sub_825C( &qword_490B8,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryTypeResolver,  (uint64_t)&unk_31D58);
  *uint64_t v16 = v15;
  uint64_t v44 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  v44(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  sub_4D88(&qword_49060);
  uint64_t v17 = sub_82E8((uint64_t)sub_2E8A0);
  uint64_t v18 = v13 + v45;
  sub_8314(v17, enum case for SuggestionParameter.roomName(_:));
  uint64_t v19 = type metadata accessor for RoomNameResolver();
  sub_1251C(v19, 32LL);
  uint64_t v20 = sub_1B2BC();
  uint64_t v21 = (uint64_t *)(v18 + v8[5]);
  v21[3] = v19;
  v21[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *uint64_t v21 = v20;
  v44(v18, v6, v3);
  *(_BYTE *)(v18 + v8[6]) = 1;
  *(_BYTE *)(v18 + v8[7]) = 0;
  sub_82E8((uint64_t)sub_2E8A0);
  sub_6F90(v46.n128_i64[0], (uint64_t)&v54);
  LODWORD(v19) = *(unsigned __int8 *)(v13 + v8[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v22 = swift_bridgeObjectRetain(v51);
  uint64_t v23 = SuggestionParameter.rawValue.getter(v22);
  if ((_DWORD)v19 == 1)
  {
    sub_829C(v23, v13 + v8[8]);
    uint64_t v24 = sub_82BC();
  }

  else
  {
    uint64_t v24 = sub_82D4();
  }

  uint64_t v25 = v24;
  uint64_t v26 = v56;
  __n128 v46 = v55;
  unint64_t v27 = v55.n128_u64[0];
  uint64_t v28 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v29 = SuggestionParameter.rawValue.getter(v28);
  uint64_t v31 = v30;
  sub_60C4(v13 + v8[5], (uint64_t)v52);
  sub_82F8(v46);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v29, v31, v52, v25, v27, v26);
  swift_release(v25);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v52);
  uint64_t v32 = sub_6108(v53);
  LODWORD(v26) = *(unsigned __int8 *)(v18 + v8[7]);
  uint64_t v33 = SuggestionParameter.rawValue.getter(v32);
  if ((_DWORD)v26 == 1)
  {
    sub_829C(v33, v18 + v8[8]);
    uint64_t v34 = sub_82BC();
  }

  else
  {
    uint64_t v34 = sub_82D4();
  }

  uint64_t v35 = v34;
  uint64_t v36 = v56;
  __n128 v49 = v55;
  unint64_t v37 = v55.n128_u64[0];
  uint64_t v38 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v39 = SuggestionParameter.rawValue.getter(v38);
  uint64_t v41 = v40;
  sub_60C4(v18 + v8[5], (uint64_t)v52);
  sub_82F8(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v39, v41, v52, v35, v37, v36);
  swift_release(v35);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v52);
  sub_6108(v53);
  uint64_t v42 = v51;
  swift_bridgeObjectRelease();
  sub_7014(&v54, v50);
  swift_setDeallocating(v42);
  return sub_1E9F4();
}

uint64_t sub_1AE84(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[6] = swift_task_alloc(v6);
  v3[7] = swift_task_alloc(v6);
  return swift_task_switch(sub_1AEF4, 0LL, 0LL);
}

uint64_t sub_1AEF4()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[8] = v4;
  v0[9] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[10] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_135CC();
}

uint64_t sub_1AF6C()
{
  uint64_t v1 = v0[8];
  sub_25820();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  swift_unknownObjectRelease(v1);
  v0[11] = v3;
  v0[12] = v5;
  return sub_135CC();
}

uint64_t sub_1AFBC()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = sub_4D70(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease();
    v29._countAndFlagsBits = 0xD000000000000013LL;
    v29._object = (void *)0x8000000000032910LL;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain(v9);
    v10._countAndFlagsBits = v8;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 544175136LL;
    v11._object = (void *)0xE400000000000000LL;
    String.append(_:)(v11);
    v12._countAndFlagsBits = v2;
    v12._object = v1;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0xD000000000000013LL;
    v14._object = (void *)0x8000000000035740LL;
    v13._object = (void *)0x8000000000032910LL;
    v14._countAndFlagsBits = 0xD000000000000077LL;
    Logger.debug(output:test:caller:)(v13, 0, v14);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v15 = sub_4D88(&qword_48EF0);
    uint64_t v16 = (void *)swift_allocObject(v15, 64LL, 7LL);
    *((_OWORD *)v16 + 1) = xmmword_2FE90;
    v16[7] = &type metadata for String;
    v16[4] = v2;
    v16[5] = v1;
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v18 = *(void *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v20 = *(void *)(v0 + 24);
    uint64_t v19 = *(void *)(v0 + 32);
    uint64_t v21 = sub_4D70(v19, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v21, v19);
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease();
    strcpy((char *)&v29, "Couldn't find ");
    HIBYTE(v29._object) = -18;
    uint64_t v22 = *(void *)(v20 + 16);
    uint64_t v23 = *(void **)(v20 + 24);
    swift_bridgeObjectRetain(v23);
    v24._countAndFlagsBits = v22;
    v24._object = v23;
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._countAndFlagsBits = 0xD00000000000003FLL;
    v26._object = (void *)0x8000000000035740LL;
    v25._object = (void *)0x8000000000035190LL;
    v26._countAndFlagsBits = 0xD000000000000077LL;
    Logger.warning(output:test:file:function:line:)(v29, 0, v26, v25, 18LL);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v16 = _swiftEmptyArrayStorage;
  }

  uint64_t v27 = *(void *)(v0 + 48);
  swift_task_dealloc(*(void *)(v0 + 56));
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void *))(v0 + 8))(v16);
}

uint64_t type metadata accessor for RoomNameResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions16RoomNameResolver);
}

uint64_t sub_1B2BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.roomName(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_1B364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_49534);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_1AE84((uint64_t)v4, a2);
}

uint64_t sub_1B3B4()
{
  return sub_1B3FC((unint64_t *)&unk_49518, (uint64_t)&unk_31544);
}

uint64_t sub_1B3D8()
{
  return sub_1B3FC(&qword_49528, (uint64_t)&unk_3156C);
}

uint64_t sub_1B3FC(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for RoomNameResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1B438(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[12] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[13] = v5;
  v3[14] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_1B48C()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  v0[15] = v2;
  uint64_t v3 = v1[4];
  v0[16] = v3;
  v0[17] = sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  v0[18] = v4;
  v0[19] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[20] = ObjectType;
  uint64_t v7 = sub_1A490(ObjectType);
  return swift_task_switch(sub_1B518, v7, v8);
}

uint64_t sub_1B518()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_2598C();
  *(_BYTE *)(v0 + 216) = v2;
  swift_unknownObjectRelease(v1);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_1B558()
{
  int v1 = *(unsigned __int8 *)(v0 + 216);
  if (v1 == 2)
  {
    uint64_t v2 = dispatch thunk of CandidateSuggestion.context.getter(*(void *)(v0 + 120), *(void *)(v0 + 128));
    *(void *)(v0 + 168) = v2;
    *(void *)(v0 + 176) = v3;
    uint64_t ObjectType = swift_getObjectType(v2);
    *(void *)(v0 + 184) = ObjectType;
    uint64_t v5 = sub_1A490(ObjectType);
    return swift_task_switch(sub_1B704, v5, v6);
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v10 = sub_4D70(*(void *)(v0 + 96), (uint64_t)static Log.suggestions);
    sub_1A34C(v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
    sub_1BD94();
    swift_bridgeObjectRelease();
    sub_1BD58();
    sub_1BDA8();
    sub_15A64();
    sub_1BD48();
    if ((v1 & 1) != 0) {
      uint64_t v11 = 1702195828LL;
    }
    else {
      uint64_t v11 = 0x65736C6166LL;
    }
    sub_1BDCC(v11);
    sub_1A15C();
    sub_1BD70( v16,  0xD00000000000008CLL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/IsSingle AccessoryOfTypeInHomeResolver.swift");
    sub_1A15C();
    sub_1BDC4(v8, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    uint64_t v12 = sub_4D88(&qword_48EF0);
    uint64_t v13 = sub_1BD88(v12);
    *(_OWORD *)(v13 + 16) = xmmword_2FE90;
    *(void *)(v13 + 56) = &type metadata for Bool;
    *(_BYTE *)(v13 + 32) = v1 & 1;
    sub_11CB4();
    uint64_t v14 = sub_1BDB8();
    return sub_1BD3C(v14, v15);
  }

uint64_t sub_1B704()
{
  uint64_t v1 = *(void *)(v0 + 168);
  sub_25B08();
  char v3 = v2;
  *(void *)(v0 + 64) = v4;
  *(_BYTE *)(v0 + 72) = v2;
  swift_unknownObjectRelease(v1);
  *(_BYTE *)(v0 + 217) = v3;
  sub_11C7C();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_1B758()
{
  if ((*(_BYTE *)(v0 + 217) & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_4D70(*(void *)(v0 + 96), (uint64_t)static Log.suggestions);
    sub_1BDD8();
    Logger.debug(output:test:caller:)(v8, v9, v10);
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v15 = sub_4D70(v13, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v15, v13);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v14 + 16);
    uint64_t v17 = *(void **)(v14 + 24);
    swift_bridgeObjectRetain(v17);
    v18._countAndFlagsBits = v16;
    v18._object = v17;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    sub_1BD48();
    v19._countAndFlagsBits = 0x65736C6166LL;
    v19._object = (void *)0xE500000000000000LL;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    sub_1BDD8();
    Logger.debug(output:test:caller:)(v20, v21, v22);
    sub_15A64();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v23 = sub_4D88(&qword_48EF0);
    uint64_t v24 = sub_1BD88(v23);
    *(_OWORD *)(v24 + 16) = xmmword_2FE90;
    *(void *)(v24 + 56) = &type metadata for Bool;
    *(_BYTE *)(v24 + 32) = 0;
    sub_11CB4();
    uint64_t v25 = sub_1BDB8();
    return sub_1BD3C(v25, v26);
  }

  else
  {
    uint64_t v1 = *(void *)(v0 + 64);
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = *(void **)(v2 + 24);
    uint64_t v5 = type metadata accessor for SuggestionEntityRetrieval();
    *(void *)(v0 + 192) = swift_initStackObject(v5);
    swift_bridgeObjectRetain(v4);
    *(void *)(v0 + 200) = sub_28D90(v3, v4);
    uint64_t v6 = (void *)swift_task_alloc(dword_49D44);
    *(void *)(v0 + 208) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1B9B8;
    return sub_2ADA0(v1);
  }

uint64_t sub_1B9B8(char a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 200LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 208LL);
  *(_BYTE *)(*(void *)v1 + 218LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_1BA10()
{
  int v1 = *(unsigned __int8 *)(v0 + 218);
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = sub_4D70(*(void *)(v0 + 96), (uint64_t)static Log.suggestions);
  sub_1A34C(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  sub_1BD94();
  swift_bridgeObjectRelease();
  sub_1BD58();
  sub_1BDA8();
  sub_15A64();
  sub_1BD48();
  if (v1) {
    uint64_t v5 = 1702195828LL;
  }
  else {
    uint64_t v5 = 0x65736C6166LL;
  }
  sub_1BDCC(v5);
  sub_1A15C();
  sub_1BD70( v11,  0xD00000000000008CLL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/IsSingleAc cessoryOfTypeInHomeResolver.swift");
  sub_1A15C();
  sub_1BDC4(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  uint64_t v6 = sub_4D88(&qword_48EF0);
  uint64_t v7 = sub_1BD88(v6);
  *(_OWORD *)(v7 + 16) = xmmword_2FE90;
  *(void *)(v7 + 56) = &type metadata for Bool;
  *(_BYTE *)(v7 + 32) = v1;
  sub_11CB4();
  uint64_t v8 = sub_1BDB8();
  return sub_1BD3C(v8, v9);
}

uint64_t type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions37IsSingleAccessoryOfTypeInHomeResolver);
}

uint64_t sub_1BB78()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  sub_1BDC4((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_1BC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_495F4);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1BC6C;
  return sub_1B438((uint64_t)v4, a2);
}

uint64_t sub_1BC6C()
{
  uint64_t v1 = sub_1BDB8();
  return v2(v1);
}

uint64_t sub_1BCB8()
{
  return sub_1BD00((unint64_t *)&unk_495D8, (uint64_t)&unk_31608);
}

uint64_t sub_1BCDC()
{
  return sub_1BD00(&qword_495E8, (uint64_t)&unk_31630);
}

uint64_t sub_1BD00(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
    uint64_t result = swift_getWitnessTable(a2, IsSingleAccessoryOfTypeInHomeResolver);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1BD3C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_1BD48()
{
  v0._countAndFlagsBits = 544175136LL;
  v0._object = (void *)0xE400000000000000LL;
  String.append(_:)(v0);
}

uint64_t sub_1BD58()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 24));
}

void sub_1BD70(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  unint64_t v4 = (a3 - 32) | 0x8000000000000000LL;
  uint64_t v5 = v3;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_1BD88(uint64_t a1)
{
  return swift_allocObject(a1, 64LL, 7LL);
}

void sub_1BD94()
{
}

void sub_1BDA8()
{
  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

uint64_t sub_1BDB8()
{
  return v0;
}

uint64_t sub_1BDC4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

void sub_1BDCC(uint64_t a1)
{
  uint64_t v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

  ;
}

uint64_t sub_1BDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[35] = a1;
  v3[36] = a3;
  uint64_t v4 = type metadata accessor for Objective(0LL);
  v3[37] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[38] = v5;
  v3[39] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[40] = sub_4D88(&qword_49600);
  v3[41] = sub_11C5C();
  v3[42] = sub_11C5C();
  v3[43] = sub_11C5C();
  v3[44] = sub_4D88(&qword_49608);
  v3[45] = sub_11C5C();
  v3[46] = sub_11C5C();
  v3[47] = sub_11C5C();
  v3[48] = sub_11C5C();
  v3[49] = sub_11C5C();
  v3[50] = sub_11C5C();
  v3[51] = sub_11C5C();
  v3[52] = sub_11C5C();
  v3[53] = sub_11C5C();
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v3[54] = v6;
  v3[55] = *(void *)(v6 - 8);
  v3[56] = sub_11C5C();
  v3[57] = sub_11C5C();
  return swift_task_switch(sub_1BF1C, 0LL, 0LL);
}

uint64_t sub_1BF1C()
{
  uint64_t v1 = *(void **)(v0 + 280);
  unint64_t v2 = v1[3];
  sub_4D4C(v1, v2);
  uint64_t v3 = sub_1E28C();
  uint64_t v4 = dispatch thunk of Interaction.verb.getter(v3);
  if (!v5) {
    goto LABEL_7;
  }
  if (v4 == 7628147 && v5 == 0xE300000000000000LL)
  {
    sub_1A0A4();
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, 7628147LL, 0xE300000000000000LL, 0LL);
    sub_1A0A4();
    if ((v7 & 1) == 0)
    {
LABEL_7:
      uint64_t v8 = v0 + 264;
      if (qword_48D38 != -1) {
LABEL_80:
      }
        swift_once(&qword_48D38, sub_1FB8C);
      uint64_t v9 = *(void *)(v0 + 456);
      uint64_t v10 = *(void *)(v0 + 432);
      uint64_t v11 = *(void *)(v0 + 440);
      uint64_t v12 = sub_4D70(v10, (uint64_t)static Log.suggestions);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v12, v10);
      sub_1E254();
      _StringGuts.grow(_:)(36LL);
      sub_1E29C();
      sub_1E22C(0xD000000000000022LL);
      *(void *)(v0 + 264) = dispatch thunk of Interaction.verb.getter(v2);
      *(void *)(v0 + 272) = v13;
      uint64_t v14 = sub_4D88(&qword_48FE0);
      v15._countAndFlagsBits = String.init<A>(describing:)(v8, v14);
      String.append(_:)(v15);
      sub_149B4();
      sub_1E1EC();
      Logger.warning(output:test:file:function:line:)(v16, v17, v18, v19, 22LL);
      sub_149B4();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
      goto LABEL_69;
    }
  }

  sub_4D4C(*(void **)(v0 + 280), v1[3]);
  uint64_t v20 = sub_1E28C();
  uint64_t v21 = dispatch thunk of Interaction.executionParameters.getter(v20);
  unint64_t v2 = sub_1DB34(v21);
  *(void *)(v0 + 464) = v2;
  sub_1A0A4();
  if (!v2)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v110 = *(void *)(v0 + 456);
    uint64_t v111 = *(void *)(v0 + 432);
    uint64_t v112 = *(void *)(v0 + 440);
    uint64_t v113 = *(void **)(v0 + 280);
    uint64_t v114 = sub_4D70(v111, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 16))(v110, v114, v111);
    sub_1E254();
    _StringGuts.grow(_:)(29LL);
    sub_1E29C();
    sub_1E22C(0xD00000000000001BLL);
    uint64_t v115 = v1[3];
    sub_4D4C(v113, v115);
    uint64_t v116 = dispatch thunk of Interaction.executionParameters.getter(v115);
    uint64_t v117 = sub_4D88(&qword_48FF8);
    v118._countAndFlagsBits = Dictionary.description.getter( v116,  &type metadata for String,  v117,  &protocol witness table for String);
    String.append(_:)(v118);
    sub_15A64();
    sub_1A090();
    sub_1E1EC();
    Logger.warning(output:test:file:function:line:)(v119, v120, v121, v122, 27LL);
    sub_1A090();
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v110, v111);
LABEL_69:
    uint64_t v123 = *(void *)(v0 + 448);
    uint64_t v125 = *(void *)(v0 + 416);
    uint64_t v124 = *(void *)(v0 + 424);
    uint64_t v127 = *(void *)(v0 + 400);
    uint64_t v126 = *(void *)(v0 + 408);
    uint64_t v129 = *(void *)(v0 + 384);
    uint64_t v128 = *(void *)(v0 + 392);
    uint64_t v131 = *(void *)(v0 + 368);
    uint64_t v130 = *(void *)(v0 + 376);
    uint64_t v186 = *(void *)(v0 + 360);
    uint64_t v188 = *(void *)(v0 + 344);
    uint64_t v190 = *(void *)(v0 + 336);
    uint64_t v193 = *(void *)(v0 + 328);
    uint64_t v197 = *(void *)(v0 + 312);
    swift_task_dealloc(*(void *)(v0 + 456));
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v126);
    swift_task_dealloc(v127);
    swift_task_dealloc(v128);
    swift_task_dealloc(v129);
    swift_task_dealloc(v130);
    swift_task_dealloc(v131);
    swift_task_dealloc(v186);
    swift_task_dealloc(v188);
    swift_task_dealloc(v190);
    swift_task_dealloc(v193);
    swift_task_dealloc(v197);
    return sub_1E1D0((uint64_t)_swiftEmptyArrayStorage, *(uint64_t (**)(void))(v0 + 8));
  }

  uint64_t v174 = (void *)(v0 + 16);
  uint64_t v8 = v0 + 56;
  uint64_t v185 = v0 + 168;
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v173 = (_BYTE *)(v0 + 673);
  uint64_t v22 = *(void *)(v0 + 456);
  uint64_t v24 = *(void *)(v0 + 432);
  uint64_t v23 = *(void *)(v0 + 440);
  uint64_t v25 = sub_4D70(v24, (uint64_t)static Log.suggestions);
  *(void *)(v0 + 472) = v25;
  Swift::String v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  *(void *)(v0 + 480) = v26;
  v26(v22, v25, v24);
  sub_1E254();
  _StringGuts.grow(_:)(21LL);
  sub_1E29C();
  sub_1E22C(0xD000000000000013LL);
  uint64_t v27 = type metadata accessor for SuggestionParameters(0LL);
  *(void *)(v0 + 488) = v27;
  v28._countAndFlagsBits = Dictionary.description.getter( v2,  &type metadata for String,  v27,  &protocol witness table for String);
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  sub_1E1EC();
  Logger.debug(output:test:caller:)(v29, v30, v31);
  swift_bridgeObjectRelease();
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 496) = v32;
  v32(v22, v24);
  uint64_t v33 = 0LL;
  char v34 = *(_BYTE *)(v2 + 32);
  uint64_t v35 = 1LL << v34;
  *(_BYTE *)(v0 + 672) = v34;
  uint64_t v36 = -1LL << (1LL << v34);
  if (v35 < 64) {
    uint64_t v37 = ~v36;
  }
  else {
    uint64_t v37 = -1LL;
  }
  uint64_t v38 = v37 & *(void *)(v2 + 64);
  *(_DWORD *)(v0 + 632) = enum case for SiriHintUseCase.dimLights(_:);
  *(_DWORD *)(v0 + 636) = enum case for SiriHintUseCase.getStateOfAirQuality(_:);
  *(_DWORD *)(v0 + 640) = enum case for SiriHintUseCase.getStateOfDoorLocks(_:);
  uint64_t v176 = (__int128 *)(v0 + 56);
  *(_DWORD *)(v0 + 644) = enum case for SiriHintUseCase.getStateOfGarageDoors(_:);
  *(_DWORD *)(v0 + 648) = enum case for SiriHintUseCase.getStateOfSecuritySystems(_:);
  *(_DWORD *)(v0 + 652) = enum case for SiriHintUseCase.getStateOfHumidity(_:);
  *(_DWORD *)(v0 + 656) = enum case for SiriHintUseCase.getStateOfLightsPower(_:);
  *(_DWORD *)(v0 + 660) = enum case for SiriHintUseCase.getStateOfTemperature(_:);
  *(_DWORD *)(v0 + 664) = enum case for SiriHintUseCase.getStateOfWindows(_:);
  *(_DWORD *)(v0 + 668) = enum case for Objective.discoverability(_:);
  for (uint64_t i = v0; ; v33 = *(void *)(i + 512))
  {
    *(void *)(v0 + 504) = _swiftEmptyArrayStorage;
    if (v38)
    {
      sub_1E274();
      uint64_t v42 = *(void *)(v0 + 464);
    }

    else
    {
      int64_t v43 = v33 + 1;
      if (__OFADD__(v33, 1LL))
      {
        __break(1u);
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }

      unint64_t v44 = (1LL << *(_BYTE *)(v0 + 672)) + 63;
      uint64_t v45 = *(void *)(v0 + 464);
      uint64_t v46 = v45 + 64;
      if (!*(void *)(v45 + 64 + 8 * v43))
      {
        int64_t v47 = v44 >> 6;
        if (v33 + 2 >= v47) {
          goto LABEL_70;
        }
        if (!*(void *)(v46 + 8 * (v33 + 2)))
        {
          if (v33 + 3 >= v47) {
            goto LABEL_70;
          }
          if (!*(void *)(v46 + 8 * (v33 + 3)))
          {
            uint64_t v48 = v33 + 4;
            if (v33 + 4 >= v47)
            {
LABEL_70:
              swift_release(v45);
              goto LABEL_69;
            }

            if (!*(void *)(v46 + 8 * v48))
            {
              do
              {
                int64_t v49 = v48 + 1;
                if (__OFADD__(v48, 1LL)) {
                  goto LABEL_79;
                }
                if (v49 >= v47) {
                  goto LABEL_70;
                }
                ++v48;
              }

              while (!*(void *)(v46 + 8 * v49));
            }
          }
        }
      }

      sub_1E23C();
    }

    *(void *)(v0 + 520) = v41;
    *(void *)(v0 + 512) = v39;
    uint64_t v50 = *(void *)(v0 + 488);
    uint64_t v52 = *(void **)(v0 + 416);
    uint64_t v51 = *(uint64_t **)(v0 + 424);
    uint64_t v53 = v0;
    __int128 v54 = *(void **)(v0 + 408);
    uint64_t v55 = *(void *)(v53 + 352);
    uint64_t v194 = *(void *)(v53 + 344);
    uint64_t v56 = (uint64_t *)(*(void *)(v42 + 48) + 16 * v40);
    uint64_t v57 = *v56;
    uint64_t v58 = v56[1];
    *uint64_t v51 = *v56;
    v51[1] = v58;
    sub_1E2FC();
    uint64_t v60 = v59 + *(int *)(v55 + 48);
    uint64_t v61 = *(void (**)(uint64_t))(v8 + 16);
    v61(v60);
    uint64_t v62 = (char *)v52 + *(int *)(v55 + 48);
    *uint64_t v52 = v57;
    v52[1] = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v62, v60, v50);
    uint64_t v63 = (char *)v54 + *(int *)(v55 + 48);
    *__int128 v54 = v57;
    v54[1] = v58;
    uint64_t v0 = i;
    uint64_t v64 = v62;
    uint64_t v65 = v62;
    uint64_t v66 = (void (*)(char *, char *, uint64_t))v61;
    ((void (*)(char *, char *, uint64_t))v61)(v63, v65, v50);
    sub_1E2C4();
    SiriHintUseCase.init(rawValue:)(v57, v58);
    uint64_t v67 = *(void (**)(char *, uint64_t))(v8 + 8);
    v67(v63, v50);
    uint64_t v68 = type metadata accessor for SiriHintUseCase(0LL);
    uint64_t v192 = v67;
    uint64_t v178 = v64;
    uint64_t v180 = (uint64_t (*)(char *, char *, uint64_t))v61;
    int v82 = *(_DWORD *)(i + 632);
    uint64_t v83 = *(void *)(i + 336);
    sub_1E124(*(void *)(i + 344), v83);
    uint64_t v84 = *(void *)(v68 - 8);
    int v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 88))(v83, v68);
    uint64_t v196 = v58;
    uint64_t v175 = v57;
    if (v85 == v82)
    {
      uint64_t v86 = qword_4CA90;
      if (qword_48D00 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48D00;
      uint64_t v88 = sub_1E310;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 636))
    {
      uint64_t v86 = qword_4C990;
      if (qword_48CB0 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48CB0;
      uint64_t v88 = sub_8CBC;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 640))
    {
      uint64_t v86 = qword_4CC38;
      if (qword_48DB0 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48DB0;
      uint64_t v88 = sub_2683C;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 644))
    {
      uint64_t v86 = qword_4C960;
      if (qword_48CA0 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48CA0;
      uint64_t v88 = sub_8C04;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 648))
    {
      uint64_t v86 = qword_4CC68;
      if (qword_48DC0 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48DC0;
      uint64_t v88 = sub_27094;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 652))
    {
      uint64_t v86 = qword_4C8D0;
      if (qword_48C70 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48C70;
      uint64_t v88 = sub_7C5C;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 656))
    {
      uint64_t v86 = qword_4C900;
      if (qword_48C80 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48C80;
      uint64_t v88 = sub_7D14;
      goto LABEL_61;
    }

    if (v85 == *(_DWORD *)(i + 660))
    {
      uint64_t v86 = qword_4CA00;
      if (qword_48CD0 == -1) {
        goto LABEL_62;
      }
      uint64_t v87 = &qword_48CD0;
      uint64_t v88 = sub_135DC;
      goto LABEL_61;
    }

    if (v85 != *(_DWORD *)(i + 664))
    {
      (*(void (**)(void, uint64_t))(v84 + 8))(*(void *)(i + 336), v68);
      uint64_t v64 = v178;
      uint64_t v66 = (void (*)(char *, char *, uint64_t))v61;
LABEL_33:
      uint64_t v177 = *(void *)(i + 488);
      uint64_t v179 = *(void *)(i + 456);
      uint64_t v181 = *(void *)(i + 432);
      uint64_t v183 = *(void (**)(uint64_t, uint64_t))(i + 496);
      uint64_t v69 = *(void **)(i + 408);
      uint64_t v70 = *(void *)(i + 352);
      uint64_t v195 = *(void *)(i + 344);
      uint64_t v71 = v58;
      uint64_t v73 = *(void *)(i + 320);
      uint64_t v72 = *(void *)(i + 328);
      (*(void (**)(void))(i + 480))();
      *(void *)(i + 184) = 0LL;
      *(void *)(i + 192) = 0xE000000000000000LL;
      _StringGuts.grow(_:)(29LL);
      swift_bridgeObjectRelease();
      *(void *)(i + 200) = 0xD00000000000001BLL;
      *(void *)(i + 208) = 0x8000000000035A40LL;
      uint64_t v74 = (char *)v69 + *(int *)(v70 + 48);
      *uint64_t v69 = v57;
      v69[1] = v71;
      v66(v74, v64, v177);
      swift_bridgeObjectRetain(v71);
      SiriHintUseCase.init(rawValue:)(v57, v71);
      v192(v74, v177);
      v75._countAndFlagsBits = String.init<A>(describing:)(v72, v73);
      String.append(_:)(v75);
      sub_1A090();
      sub_1E1EC();
      v76._object = (void *)0x80000000000359C0LL;
      Logger.warning(output:test:file:function:line:)(v77, v78, v79, v76, 64LL);
      sub_1A090();
      v183(v179, v181);
      sub_61B8(v195, &qword_49600);
      sub_1A15C();
      uint64_t v80 = 0LL;
      uint64_t v81 = 0LL;
      goto LABEL_64;
    }

    uint64_t v86 = qword_4C8A0;
    if (qword_48C60 != -1)
    {
      uint64_t v87 = &qword_48C60;
      uint64_t v88 = sub_6B18;
LABEL_61:
      swift_once(v87, v88);
    }

LABEL_62:
    unsigned int v184 = *(_DWORD *)(i + 668);
    uint64_t v89 = *(void *)(i + 344);
    uint64_t v90 = *(void *)(i + 304);
    uint64_t v91 = *(void *)(i + 312);
    uint64_t v93 = *(void **)(i + 288);
    uint64_t v92 = *(void *)(i + 296);
    uint64_t v94 = type metadata accessor for HomeSuggestionType(0LL);
    uint64_t v95 = sub_4D70(v94, (uint64_t)v86);
    uint64_t v80 = HomeSuggestionType.rawValue.getter(v95);
    uint64_t v81 = v96;
    *(void *)(i + 528) = v96;
    *(void *)(i + 536) = v80;
    sub_61B8(v89, &qword_49600);
    uint64_t v97 = v93[3];
    uint64_t v182 = v93[4];
    sub_4D4C(v93, v97);
    swift_bridgeObjectRetain(v81);
    uint64_t v98 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    uint64_t v99 = (void (*)(char *, uint64_t))v90;
    (*(void (**)(uint64_t, void, uint64_t))(v90 + 104))(v91, v184, v92);
    CandidateSuggestionFactory.create(suggestionId:params:objective:)(v80, v81, v98, v91, v97, v182);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v91, v92);
    if (*(void *)(i + 80)) {
      break;
    }
    sub_149B4();
    swift_bridgeObjectRelease();
    sub_61B8((uint64_t)v176, &qword_49610);
LABEL_64:
    uint64_t v100 = *(void (**)(uint64_t, uint64_t))(i + 496);
    uint64_t v101 = *(void *)(i + 456);
    uint64_t v8 = *(void *)(i + 432);
    uint64_t v102 = *(void *)(i + 416);
    sub_1E2A4(v101, *(void *)(i + 472), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(i + 480));
    *(void *)(i + 152) = 0LL;
    *(void *)(i + 160) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(44LL);
    swift_bridgeObjectRelease();
    *(void *)(i + 136) = 0xD00000000000002ALL;
    *(void *)(i + 144) = 0x8000000000035A60LL;
    *(void *)(i + 168) = v80;
    *(void *)(i + 176) = v81;
    uint64_t v103 = sub_4D88(&qword_48FE0);
    v104._countAndFlagsBits = String.init<A>(describing:)(v185, v103);
    String.append(_:)(v104);
    sub_149B4();
    unint64_t v2 = *(void *)(i + 144);
    sub_1E2E8();
    Logger.warning(output:test:file:function:line:)(v105, v106, v107, v108, v109);
    sub_149B4();
    v100(v101, v8);
    sub_61B8(v102, &qword_49608);
    uint64_t v38 = *(void *)(i + 520);
  }

  uint64_t v133 = *(void *)(i + 488);
  uint64_t v134 = *(char **)(i + 400);
  uint64_t v135 = *(void *)(i + 352);
  sub_149B4();
  sub_1E16C(v176, (uint64_t)v174);
  uint64_t v136 = *(int *)(v135 + 48);
  *(void *)uint64_t v134 = v175;
  *((void *)v134 + 1) = v196;
  uint64_t v137 = v180(&v134[v136], v178, v133);
  uint64_t v138 = SuggestionParameters.accessoryType.getter(v137);
  if ((v139 & 1) != 0)
  {
    sub_1E2AC();
    uint64_t v141 = sub_1E2DC();
  }

  else
  {
    uint64_t v140 = v138;
    sub_1E2AC();
    uint64_t v141 = HomeDeviceType.init(rawValue:)(v140);
    char v143 = v142 & 1;
  }

  *uint64_t v173 = v143;
  *(void *)(i + 544) = v141;
  uint64_t v144 = *(void *)(i + 488);
  uint64_t v145 = *(void **)(i + 392);
  Swift::String v146 = (char *)v145 + *(int *)(*(void *)(i + 352) + 48LL);
  *uint64_t v145 = v175;
  v145[1] = v196;
  uint64_t v147 = v180(v146, v178, v144);
  uint64_t v148 = SuggestionParameters.accessoryType.getter(v147);
  char v150 = v149;
  uint64_t v151 = *(void *)(i + 488);
  if ((v150 & 1) != 0)
  {
    v99(v146, v151);
    uint64_t v153 = sub_1E2DC();
  }

  else
  {
    uint64_t v152 = v148;
    v99(v146, v151);
    uint64_t v153 = HomeAttributeType.init(rawValue:)(v152);
    char v155 = v154 & 1;
  }

  v173[1] = v155;
  *(void *)(i + 552) = v153;
  uint64_t v156 = *(void **)(i + 408);
  uint64_t v157 = *(void **)(i + 384);
  uint64_t v158 = *(void *)(i + 352);
  uint64_t v159 = *(void *)(i + 40);
  uint64_t v160 = *(void *)(i + 48);
  sub_4D4C(v174, v159);
  uint64_t v161 = dispatch thunk of CandidateSuggestion.context.getter(v159, v160);
  uint64_t v189 = v162;
  uint64_t v187 = sub_1E2D0(v161, v162);
  *(void *)(i + 576) = v187;
  uint64_t v163 = (uint64_t)v156 + *(int *)(v158 + 48);
  *uint64_t v156 = v175;
  v156[1] = v196;
  uint64_t v164 = sub_1E208(v163);
  *(void *)(i + 584) = SuggestionParameters.accessoryName.getter(v164);
  *(void *)(i + 592) = v165;
  sub_1E220();
  uint64_t v166 = (uint64_t)v157 + *(int *)(v158 + 48);
  *uint64_t v157 = v175;
  v157[1] = v196;
  uint64_t v167 = sub_1E208(v166);
  *(void *)(i + 600) = SuggestionParameters.roomName.getter(v167);
  *(void *)(i + 608) = v168;
  sub_1E220();
  uint64_t v169 = sub_1E19C(*(int *)(v158 + 48));
  *(void *)(i + 616) = SuggestionParameters.containerName.getter(v169);
  *(void *)(i + 624) = v170;
  sub_1E220();
  uint64_t v171 = sub_1E19C(*(int *)(v158 + 48));
  v173[2] = SuggestionParameters.hasTargetedMoreThanOneEntity.getter(v171) & 1;
  sub_1E220();
  sub_1E19C(*(int *)(v158 + 48));
  uint64_t v172 = sub_1A15C();
  v173[3] = SuggestionParameters.isSingleAccessoryOfTypeInHome.getter(v172) & 1;
  sub_1E220();
  dispatch thunk of Actor.unownedExecutor.getter(v187, *(void *)(*(void *)(v189 + 8) + 8LL));
  return sub_1E1B4();
}

uint64_t sub_1CE30()
{
  uint64_t v1 = *(void *)(v0 + 560);
  sub_25CA0( *(void *)(v0 + 544),  *(_BYTE *)(v0 + 673),  *(void *)(v0 + 584),  *(void *)(v0 + 592),  *(void *)(v0 + 600),  *(void *)(v0 + 608),  *(void *)(v0 + 552),  *(_BYTE *)(v0 + 674),  *(void *)(v0 + 616),  *(void *)(v0 + 624),  *(_BYTE *)(v0 + 675),  *(_BYTE *)(v0 + 676),  *(void *)(v0 + 576),  *(void *)(v0 + 568));
  swift_unknownObjectRelease(v1);
  sub_149B4();
  sub_1A090();
  sub_1A15C();
  return swift_task_switch(sub_1CEE4, 0LL, 0LL);
}

uint64_t sub_1CEE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 536);
  uint64_t v3 = *(void **)(v0 + 528);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
  uint64_t v174 = *(void *)(v0 + 504);
  uint64_t v5 = *(void *)(v0 + 448);
  uint64_t v6 = *(void *)(v0 + 432);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 480))(v5, *(void *)(v0 + 472), v6);
  *(void *)(v0 + 232) = 0LL;
  *(void *)(v0 + 240) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(41LL);
  uint64_t v7 = *(void *)(v0 + 240);
  *(void *)(v0 + 216) = *(void *)(v0 + 232);
  *(void *)(v0 + 224) = v7;
  v8._countAndFlagsBits = 0xD000000000000016LL;
  v8._object = (void *)0x8000000000035A90LL;
  String.append(_:)(v8);
  v9._countAndFlagsBits = v2;
  v9._object = v3;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6F63206874697720LL;
  v10._object = (void *)0xEF203A747865746ELL;
  String.append(_:)(v10);
  uint64_t v11 = *(void *)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + 48);
  sub_4D4C((void *)(v0 + 16), v11);
  uint64_t v13 = dispatch thunk of CandidateSuggestion.context.getter(v11, v12);
  *(void *)(v0 + 248) = v13;
  uint64_t v14 = v0 + 248;
  Swift::String v15 = (__int128 *)(v0 + 96);
  *(void *)(v0 + 256) = v16;
  uint64_t v17 = sub_4D88(&qword_49618);
  _print_unlocked<A, B>(_:_:)(v0 + 248, v0 + 216, v17);
  swift_unknownObjectRelease(v13);
  sub_1E1EC();
  Logger.debug(output:test:caller:)(v18, v19, v20);
  swift_bridgeObjectRelease();
  v4(v5, v6);
  char v154 = (void *)(v0 + 16);
  sub_60C4(v0 + 16, v0 + 96);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v174);
  uint64_t v169 = *(void *)(v0 + 504);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_64:
    sub_2BDD0(0, *(void *)(v169 + 16) + 1LL, 1, v169);
    uint64_t v169 = v150;
  }

  uint64_t v164 = v14 - 80;
  unint64_t v23 = *(void *)(v169 + 16);
  unint64_t v22 = *(void *)(v169 + 24);
  uint64_t v157 = (__int128 *)(v14 - 192);
  if (v23 >= v22 >> 1)
  {
    sub_2BDD0(v22 > 1, v23 + 1, 1, v169);
    uint64_t v169 = v151;
  }

  uint64_t v152 = v14 + 425;
  uint64_t v24 = *(void *)(v1 + 416);
  *(void *)(v169 + 16) = v23 + 1;
  sub_1E16C(v15, v169 + 40 * v23 + 32);
  sub_61B8(v24, &qword_49608);
  sub_6108(v154);
  uint64_t v179 = v1;
  while (1)
  {
    uint64_t v25 = *(void *)(v1 + 520);
    uint64_t v26 = *(void *)(v1 + 512);
    *(void *)(v1 + 504) = v169;
    if (v25)
    {
      sub_1E274();
      uint64_t v30 = *(void *)(v1 + 464);
    }

    else
    {
      int64_t v31 = v26 + 1;
      if (__OFADD__(v26, 1LL))
      {
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }

      unint64_t v32 = (1LL << *(_BYTE *)(v1 + 672)) + 63;
      uint64_t v33 = *(void *)(v1 + 464);
      uint64_t v34 = v33 + 64;
      if (!*(void *)(v33 + 64 + 8 * v31))
      {
        int64_t v35 = v32 >> 6;
        if (v26 + 2 >= v35) {
          goto LABEL_54;
        }
        if (!*(void *)(v34 + 8 * (v26 + 2)))
        {
          if (v26 + 3 >= v35) {
            goto LABEL_54;
          }
          if (!*(void *)(v34 + 8 * (v26 + 3)))
          {
            uint64_t v36 = v26 + 4;
            if (v26 + 4 >= v35)
            {
LABEL_54:
              swift_release(v33);
              uint64_t v92 = *(void *)(v1 + 448);
              uint64_t v94 = *(void *)(v1 + 416);
              uint64_t v93 = *(void *)(v1 + 424);
              uint64_t v96 = *(void *)(v1 + 400);
              uint64_t v95 = *(void *)(v1 + 408);
              uint64_t v98 = *(void *)(v1 + 384);
              uint64_t v97 = *(void *)(v1 + 392);
              uint64_t v100 = *(void *)(v1 + 368);
              uint64_t v99 = *(void *)(v1 + 376);
              uint64_t v165 = *(void *)(v1 + 360);
              uint64_t v167 = *(void *)(v1 + 344);
              uint64_t v171 = *(void *)(v1 + 336);
              uint64_t v173 = *(void *)(v1 + 328);
              uint64_t v178 = *(void *)(v1 + 312);
              swift_task_dealloc(*(void *)(v1 + 456));
              swift_task_dealloc(v92);
              swift_task_dealloc(v93);
              swift_task_dealloc(v94);
              swift_task_dealloc(v95);
              swift_task_dealloc(v96);
              swift_task_dealloc(v97);
              swift_task_dealloc(v98);
              swift_task_dealloc(v99);
              swift_task_dealloc(v100);
              swift_task_dealloc(v165);
              swift_task_dealloc(v167);
              swift_task_dealloc(v171);
              swift_task_dealloc(v173);
              swift_task_dealloc(v178);
              return sub_1E1D0(v169, *(uint64_t (**)(void))(v1 + 8));
            }

            if (!*(void *)(v34 + 8 * v36))
            {
              do
              {
                int64_t v37 = v36 + 1;
                if (__OFADD__(v36, 1LL)) {
                  goto LABEL_63;
                }
                if (v37 >= v35) {
                  goto LABEL_54;
                }
                ++v36;
              }

              while (!*(void *)(v34 + 8 * v37));
            }
          }
        }
      }

      sub_1E23C();
    }

    *(void *)(v1 + 520) = v29;
    *(void *)(v1 + 512) = v27;
    uint64_t v38 = *(void *)(v1 + 488);
    uint64_t v40 = *(void **)(v1 + 416);
    uint64_t v39 = *(uint64_t **)(v1 + 424);
    uint64_t v41 = *(void **)(v1 + 408);
    uint64_t v42 = *(void *)(v1 + 352);
    uint64_t v175 = *(void *)(v1 + 344);
    int64_t v43 = (uint64_t *)(*(void *)(v30 + 48) + 16 * v28);
    uint64_t v44 = *v43;
    uint64_t v45 = v43[1];
    *uint64_t v39 = *v43;
    v39[1] = v45;
    sub_1E2FC();
    uint64_t v47 = v46 + *(int *)(v42 + 48);
    uint64_t v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    ((void (*)(uint64_t))v48)(v47);
    int64_t v49 = (char *)v40 + *(int *)(v42 + 48);
    *uint64_t v40 = v44;
    v40[1] = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v49, v47, v38);
    uint64_t v50 = (char *)v41 + *(int *)(v42 + 48);
    *uint64_t v41 = v44;
    v41[1] = v45;
    uint64_t v170 = (uint64_t)v49;
    uint64_t v172 = v48;
    v48((uint64_t)v50, (uint64_t)v49, v38);
    sub_1E2C4();
    sub_1E264();
    uint64_t v51 = *(uint64_t (**)(uint64_t))(v12 + 8);
    ((void (*)(char *, uint64_t))v51)(v50, v38);
    uint64_t v52 = type metadata accessor for SiriHintUseCase(0LL);
    uint64_t v156 = v51;
    int v65 = *(_DWORD *)(v179 + 632);
    uint64_t v66 = *(void *)(v179 + 336);
    sub_1E124(*(void *)(v179 + 344), v66);
    uint64_t v67 = *(void *)(v52 - 8);
    int v68 = (*(uint64_t (**)(uint64_t, uint64_t))(v67 + 88))(v66, v52);
    uint64_t v177 = v45;
    uint64_t v159 = v44;
    if (v68 == v65)
    {
      uint64_t v69 = qword_4CA90;
      if (qword_48D00 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48D00;
      uint64_t v71 = sub_1E310;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 636))
    {
      uint64_t v69 = qword_4C990;
      if (qword_48CB0 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48CB0;
      uint64_t v71 = sub_8CBC;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 640))
    {
      uint64_t v69 = qword_4CC38;
      if (qword_48DB0 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48DB0;
      uint64_t v71 = sub_2683C;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 644))
    {
      uint64_t v69 = qword_4C960;
      if (qword_48CA0 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48CA0;
      uint64_t v71 = sub_8C04;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 648))
    {
      uint64_t v69 = qword_4CC68;
      if (qword_48DC0 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48DC0;
      uint64_t v71 = sub_27094;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 652))
    {
      uint64_t v69 = qword_4C8D0;
      if (qword_48C70 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48C70;
      uint64_t v71 = sub_7C5C;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 656))
    {
      uint64_t v69 = qword_4C900;
      if (qword_48C80 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48C80;
      uint64_t v71 = sub_7D14;
      goto LABEL_49;
    }

    if (v68 == *(_DWORD *)(v179 + 660))
    {
      uint64_t v69 = qword_4CA00;
      if (qword_48CD0 == -1) {
        goto LABEL_50;
      }
      uint64_t v70 = &qword_48CD0;
      uint64_t v71 = sub_135DC;
      goto LABEL_49;
    }

    if (v68 != *(_DWORD *)(v179 + 664))
    {
      (*(void (**)(void, uint64_t))(v67 + 8))(*(void *)(v179 + 336), v52);
      uint64_t v51 = v156;
LABEL_21:
      uint64_t v53 = *(void *)(v179 + 488);
      uint64_t v54 = *(void *)(v179 + 456);
      uint64_t v160 = *(void *)(v179 + 432);
      uint64_t v162 = *(void (**)(uint64_t, uint64_t))(v179 + 496);
      uint64_t v55 = *(void **)(v179 + 408);
      uint64_t v56 = *(void *)(v179 + 352);
      uint64_t v176 = *(void *)(v179 + 344);
      uint64_t v57 = *(void *)(v179 + 328);
      uint64_t v158 = *(void *)(v179 + 320);
      (*(void (**)(uint64_t, void))(v179 + 480))(v54, *(void *)(v179 + 472));
      *(void *)(v179 + 184) = 0LL;
      *(void *)(v179 + 192) = 0xE000000000000000LL;
      _StringGuts.grow(_:)(29LL);
      swift_bridgeObjectRelease();
      *(void *)(v179 + 200) = 0xD00000000000001BLL;
      *(void *)(v179 + 208) = 0x8000000000035A40LL;
      uint64_t v58 = (uint64_t)v55 + *(int *)(v56 + 48);
      *uint64_t v55 = v44;
      v55[1] = v45;
      sub_1E2A4(v58, v170, v172);
      swift_bridgeObjectRetain(v45);
      sub_1E264();
      ((void (*)(uint64_t, uint64_t))v51)(v58, v53);
      v59._countAndFlagsBits = String.init<A>(describing:)(v57, v158);
      String.append(_:)(v59);
      sub_149B4();
      sub_1E1EC();
      v61._object = (void *)0x80000000000359C0LL;
      v60._object = (void *)0x8000000000035920LL;
      Logger.warning(output:test:file:function:line:)(v62, v63, v60, v61, 64LL);
      sub_149B4();
      v162(v54, v160);
      sub_61B8(v176, &qword_49600);
      swift_bridgeObjectRelease();
      uint64_t v64 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v1 = v179;
      goto LABEL_52;
    }

    uint64_t v69 = qword_4C8A0;
    if (qword_48C60 != -1)
    {
      uint64_t v70 = &qword_48C60;
      uint64_t v71 = sub_6B18;
LABEL_49:
      swift_once(v70, v71);
    }

LABEL_50:
    unsigned int v163 = *(_DWORD *)(v179 + 668);
    uint64_t v72 = *(void *)(v179 + 344);
    uint64_t v73 = *(void *)(v179 + 304);
    uint64_t v74 = *(void *)(v179 + 312);
    Swift::String v76 = *(void **)(v179 + 288);
    uint64_t v75 = *(void *)(v179 + 296);
    uint64_t v77 = type metadata accessor for HomeSuggestionType(0LL);
    uint64_t v78 = sub_4D70(v77, (uint64_t)v69);
    uint64_t v64 = HomeSuggestionType.rawValue.getter(v78);
    uint64_t v14 = v79;
    *(void *)(v179 + 528) = v79;
    *(void *)(v179 + 536) = v64;
    sub_61B8(v72, &qword_49600);
    uint64_t v80 = v76[3];
    uint64_t v161 = v76[4];
    uint64_t v81 = (void (*)(char *, uint64_t))sub_4D4C(v76, v80);
    swift_bridgeObjectRetain(v14);
    uint64_t v82 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    (*(void (**)(uint64_t, void, uint64_t))(v73 + 104))(v74, v163, v75);
    CandidateSuggestionFactory.create(suggestionId:params:objective:)(v64, v14, v82, v74, v80, v161);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v75);
    if (*(void *)(v179 + 80)) {
      break;
    }
    sub_15A64();
    swift_bridgeObjectRelease();
    sub_61B8((uint64_t)v157, &qword_49610);
    uint64_t v1 = v179;
LABEL_52:
    Swift::String v15 = *(__int128 **)(v1 + 496);
    uint64_t v83 = *(void *)(v1 + 456);
    uint64_t v12 = *(void *)(v1 + 432);
    uint64_t v84 = *(void *)(v1 + 416);
    sub_1E2A4(v83, *(void *)(v1 + 472), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 480));
    *(void *)(v1 + 152) = 0LL;
    *(void *)(v1 + 160) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(44LL);
    swift_bridgeObjectRelease();
    *(void *)(v1 + 136) = 0xD00000000000002ALL;
    *(void *)(v1 + 144) = 0x8000000000035A60LL;
    *(void *)(v1 + 168) = v64;
    *(void *)(v1 + 176) = v14;
    uint64_t v85 = sub_4D88(&qword_48FE0);
    v86._countAndFlagsBits = String.init<A>(describing:)(v164, v85);
    String.append(_:)(v86);
    sub_1A090();
    sub_1E2E8();
    Logger.warning(output:test:file:function:line:)(v87, v88, v89, v90, v91);
    sub_1A090();
    ((void (*)(uint64_t, uint64_t))v15)(v83, v12);
    sub_61B8(v84, &qword_49608);
  }

  uint64_t v102 = *(void *)(v179 + 488);
  uint64_t v103 = *(void **)(v179 + 400);
  uint64_t v104 = *(void *)(v179 + 352);
  sub_15A64();
  sub_1E16C(v157, (uint64_t)v154);
  uint64_t v105 = *(int *)(v104 + 48);
  *uint64_t v103 = v159;
  v103[1] = v177;
  uint64_t v106 = v172((uint64_t)v103 + v105, v170, v102);
  uint64_t v107 = SuggestionParameters.accessoryType.getter(v106);
  char v115 = v114;
  uint64_t v116 = *(void *)(v179 + 488);
  if ((v115 & 1) != 0)
  {
    sub_1E2B8(v107, v116, v108, v109, v110, v111, v112, v113, v152, (uint64_t)v154, v156);
    uint64_t v118 = sub_1E2DC();
  }

  else
  {
    uint64_t v117 = v107;
    sub_1E2B8(v107, v116, v108, v109, v110, v111, v112, v113, v152, (uint64_t)v154, v156);
    uint64_t v118 = HomeDeviceType.init(rawValue:)(v117);
    char v120 = v119 & 1;
  }

  *uint64_t v153 = v120;
  *(void *)(v179 + 544) = v118;
  uint64_t v121 = *(void *)(v179 + 488);
  Swift::String v122 = *(void **)(v179 + 392);
  uint64_t v123 = (char *)v122 + *(int *)(*(void *)(v179 + 352) + 48LL);
  *Swift::String v122 = v159;
  v122[1] = v177;
  uint64_t v124 = v172((uint64_t)v123, v170, v121);
  uint64_t v125 = SuggestionParameters.accessoryType.getter(v124);
  char v127 = v126;
  uint64_t v128 = *(void *)(v179 + 488);
  if ((v127 & 1) != 0)
  {
    v81(v123, v128);
    uint64_t v130 = sub_1E2DC();
  }

  else
  {
    uint64_t v129 = v125;
    v81(v123, v128);
    uint64_t v130 = HomeAttributeType.init(rawValue:)(v129);
    char v132 = v131 & 1;
  }

  v153[1] = v132;
  *(void *)(v179 + 552) = v130;
  uint64_t v133 = *(void **)(v179 + 408);
  uint64_t v134 = *(void **)(v179 + 384);
  uint64_t v135 = *(void *)(v179 + 352);
  sub_4D4C(v155, *(void *)(v179 + 40));
  uint64_t v136 = sub_1E28C();
  uint64_t v138 = dispatch thunk of CandidateSuggestion.context.getter(v136, v137);
  uint64_t v168 = v139;
  uint64_t v166 = sub_1E2D0(v138, v139);
  *(void *)(v179 + 576) = v166;
  uint64_t v140 = (uint64_t)v133 + *(int *)(v135 + 48);
  *uint64_t v133 = v159;
  v133[1] = v177;
  uint64_t v141 = sub_1E1FC(v140);
  *(void *)(v179 + 584) = SuggestionParameters.accessoryName.getter(v141);
  *(void *)(v179 + 592) = v142;
  sub_1E214();
  uint64_t v143 = (uint64_t)v134 + *(int *)(v135 + 48);
  *uint64_t v134 = v159;
  v134[1] = v177;
  uint64_t v144 = sub_1E1FC(v143);
  *(void *)(v179 + 600) = SuggestionParameters.roomName.getter(v144);
  *(void *)(v179 + 608) = v145;
  sub_1E214();
  uint64_t v146 = sub_1E184(*(int *)(v135 + 48));
  *(void *)(v179 + 616) = SuggestionParameters.containerName.getter(v146);
  *(void *)(v179 + 624) = v147;
  sub_1E214();
  uint64_t v148 = sub_1E184(*(int *)(v135 + 48));
  v153[2] = SuggestionParameters.hasTargetedMoreThanOneEntity.getter(v148) & 1;
  sub_1E214();
  sub_1E184(*(int *)(v135 + 48));
  uint64_t v149 = sub_149B4();
  v153[3] = SuggestionParameters.isSingleAccessoryOfTypeInHome.getter(v149) & 1;
  sub_1E214();
  dispatch thunk of Actor.unownedExecutor.getter(v166, *(void *)(*(void *)(v168 + 8) + 8LL));
  return sub_1E1B4();
}

unint64_t sub_1DB34(uint64_t a1)
{
  uint64_t v2 = sub_4D88(&qword_49620);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = sub_4D88(&qword_49608);
  __chkstk_darwin(v58);
  uint64_t v57 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v56 = sub_4D88(&qword_49628);
  __chkstk_darwin(v56);
  uint64_t v7 = (void *)((char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = type metadata accessor for SuggestionParameters(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  Swift::String v62 = (char *)v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v55 = (char *)v50 - v13;
  __chkstk_darwin(v12);
  uint64_t v54 = (char *)v50 - v14;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    sub_4D88(&qword_49630);
    uint64_t v16 = (void *)static _DictionaryStorage.allocate(capacity:)(v15);
  }

  else
  {
    uint64_t v16 = &_swiftEmptyDictionarySingleton;
  }

  sub_19830(a1);
  uint64_t v60 = v67[6];
  uint64_t v53 = v67[7];
  int64_t v17 = v69;
  unint64_t v18 = v70;
  v50[1] = v68;
  int64_t v52 = (unint64_t)(v68 + 64) >> 6;
  Swift::String v59 = v67;
  uint64_t v51 = v16 + 8;
  unint64_t result = swift_bridgeObjectRetain(a1);
  uint64_t v61 = v9;
  if (!v18) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v64 = (v18 - 1) & v18;
  unint64_t v20 = __clz(__rbit64(v18)) | (v17 << 6);
  for (int64_t i = v17; ; v20 = __clz(__rbit64(v23)) + (i << 6))
  {
    uint64_t v25 = (uint64_t *)(*(void *)(v60 + 48) + 16 * v20);
    uint64_t v26 = *v25;
    uint64_t v27 = v25[1];
    uint64_t v28 = (uint64_t)v59;
    sub_6F90(*(void *)(v60 + 56) + 48 * v20, (uint64_t)v59);
    v66[0] = v26;
    v66[1] = v27;
    sub_6F90(v28, (uint64_t)v65);
    swift_bridgeObjectRetain_n(v27, 2LL);
    sub_61B8((uint64_t)v66, &qword_49638);
    uint64_t v29 = sub_4D88(&qword_48FF8);
    if (!swift_dynamicCast(v4, v65, v29, v8, 6LL))
    {
      sub_61AC((uint64_t)v4, 1LL, 1LL, v8);
      swift_bridgeObjectRelease();
      sub_61B8((uint64_t)v4, &qword_49620);
      sub_19E28(v60);
      swift_release(v16);
      return 0LL;
    }

    int64_t v63 = i;
    sub_61AC((uint64_t)v4, 0LL, 1LL, v8);
    uint64_t v30 = v4;
    uint64_t v31 = v61;
    unint64_t v32 = *(void (**)(char *))(v61 + 32);
    uint64_t v33 = v55;
    uint64_t v34 = v30;
    v32(v55);
    int64_t v35 = &v57[*(int *)(v58 + 48)];
    ((void (*)(char *, char *, uint64_t))v32)(v35, v33, v8);
    uint64_t v36 = v56;
    int64_t v37 = (char *)v7 + *(int *)(v56 + 48);
    *uint64_t v7 = v26;
    v7[1] = v27;
    ((void (*)(char *, char *, uint64_t))v32)(v37, v35, v8);
    uint64_t v38 = (char *)v7 + *(int *)(v36 + 48);
    uint64_t v39 = *v7;
    uint64_t v40 = v7[1];
    uint64_t v41 = v54;
    ((void (*)(char *, char *, uint64_t))v32)(v54, v38, v8);
    uint64_t v42 = v62;
    ((void (*)(char *, char *, uint64_t))v32)(v62, v41, v8);
    unint64_t result = sub_18EDC(v39, v40);
    unint64_t v43 = result;
    if ((v44 & 1) != 0)
    {
      uint64_t v45 = (uint64_t *)(v16[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v45 = v39;
      v45[1] = v40;
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 40))( v16[7] + *(void *)(v31 + 72) * v43,  v62,  v8);
      goto LABEL_28;
    }

    if (v16[2] >= v16[3]) {
      break;
    }
    *(void *)((char *)v51 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v46 = (uint64_t *)(v16[6] + 16 * result);
    *uint64_t v46 = v39;
    v46[1] = v40;
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)( v16[7] + *(void *)(v61 + 72) * result,  v42,  v8);
    uint64_t v47 = v16[2];
    BOOL v48 = __OFADD__(v47, 1LL);
    uint64_t v49 = v47 + 1;
    if (v48) {
      goto LABEL_34;
    }
    v16[2] = v49;
LABEL_28:
    int64_t v17 = v63;
    unint64_t v18 = v64;
    uint64_t v4 = v34;
    if (v64) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      goto LABEL_35;
    }
    if (v22 >= v52) {
      goto LABEL_31;
    }
    unint64_t v23 = *(void *)(v53 + 8 * v22);
    int64_t i = v17 + 1;
    if (!v23)
    {
      int64_t i = v17 + 2;
      if (v17 + 2 >= v52) {
        goto LABEL_31;
      }
      unint64_t v23 = *(void *)(v53 + 8 * i);
      if (!v23)
      {
        int64_t i = v17 + 3;
        if (v17 + 3 >= v52) {
          goto LABEL_31;
        }
        unint64_t v23 = *(void *)(v53 + 8 * i);
        if (!v23)
        {
          int64_t i = v17 + 4;
          if (v17 + 4 >= v52) {
            goto LABEL_31;
          }
          unint64_t v23 = *(void *)(v53 + 8 * i);
          if (!v23)
          {
            int64_t i = v17 + 5;
            if (v17 + 5 >= v52) {
              goto LABEL_31;
            }
            unint64_t v23 = *(void *)(v53 + 8 * i);
            if (!v23)
            {
              int64_t v24 = v17 + 6;
              while (v24 < v52)
              {
                unint64_t v23 = *(void *)(v53 + 8 * v24++);
                if (v23)
                {
                  int64_t i = v24 - 1;
                  goto LABEL_21;
                }
              }

LABEL_31:
              sub_19E28(v60);
              return (unint64_t)v16;
            }
          }
        }
      }
    }

LABEL_21:
    uint64_t v64 = (v23 - 1) & v23;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1E124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4D88(&qword_49600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E16C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1E184@<X0>(uint64_t a1@<X8>)
{
  *(void *)uint64_t v1 = v4;
  *((void *)v1 + 1) = v2;
  return v6(&v1[a1], v5, v3);
}

uint64_t sub_1E19C@<X0>(uint64_t a1@<X8>)
{
  *(void *)uint64_t v1 = v3;
  *((void *)v1 + 1) = v4;
  return v5(&v1[a1], v6, v2);
}

uint64_t sub_1E1B4()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_1E1D0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

  ;
}

uint64_t sub_1E1FC(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t sub_1E208(uint64_t a1)
{
  return v2(a1, v3, v1);
}

uint64_t sub_1E214()
{
  return v2(v0, v1);
}

uint64_t sub_1E220()
{
  return v2(v1, v0);
}

void sub_1E22C(uint64_t a1@<X8>)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 88) = (v1 - 32) | 0x8000000000000000LL;
}

  ;
}

void sub_1E254()
{
  *(void *)(v0 - 96) = 0LL;
  *(void *)(v0 - 88) = 0xE000000000000000LL;
}

uint64_t sub_1E264()
{
  return SiriHintUseCase.init(rawValue:)(v0, v1);
}

  ;
}

uint64_t sub_1E28C()
{
  return v0;
}

uint64_t sub_1E29C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 88));
}

uint64_t sub_1E2A4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_1E2AC()
{
  return (*(uint64_t (**)(uint64_t))(v1 - 112))(v0);
}

uint64_t sub_1E2B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t))
{
  return a11(v11);
}

uint64_t sub_1E2C4()
{
  return swift_bridgeObjectRetain_n(v0, 3LL);
}

uint64_t sub_1E2D0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 560) = a1;
  *(void *)(v2 + 568) = a2;
  return swift_getObjectType(a1);
}

uint64_t sub_1E2DC()
{
  return 0LL;
}

  ;
}

  ;
}

uint64_t sub_1E310()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CA90);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.dimLights(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_1E35C()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CAA8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24994();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for DimLightsSuggestion()
{
  return &type metadata for DimLightsSuggestion;
}

uint64_t sub_1E3C8@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v68.n128_u64[0] = a1;
  uint64_t v69 = a2;
  v71.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v70 = *(void *)(v71.n128_u64[0] - 8);
  __chkstk_darwin(v71.n128_u64[0]);
  v73.n128_u64[0] = (unint64_t)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v67 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 3 * v67, v10 | 7);
  uint64_t v74 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30590;
  uint64_t v13 = v12 + v11;
  uint64_t v72 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v72(v6, enum case for SuggestionParameter.hasTargetedMoreThanOneEntity(_:), v3);
  uint64_t HasTargetedMoreThanOneEntityResolver = type metadata accessor for HasTargetedMoreThanOneEntityResolver();
  sub_8308(HasTargetedMoreThanOneEntityResolver);
  uint64_t v15 = sub_4B4C();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = HasTargetedMoreThanOneEntityResolver;
  v16[4] = sub_825C( &qword_49640,  (uint64_t (*)(uint64_t))type metadata accessor for HasTargetedMoreThanOneEntityResolver,  (uint64_t)&unk_2FF58);
  *uint64_t v16 = v15;
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v63 = v3;
  v66(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  uint64_t v17 = sub_4D88(&qword_49060);
  uint64_t v64 = (char *)&type metadata for Any + 8;
  uint64_t v65 = v17;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v18 = v67;
  uint64_t v19 = v13 + v67;
  sub_8BE0();
  uint64_t v20 = type metadata accessor for ContainerNameResolver();
  sub_8308(v20);
  uint64_t v21 = sub_13450();
  int64_t v22 = (uint64_t *)(v19 + v8[5]);
  v22[3] = v20;
  v22[4] = sub_825C( &qword_49648,  (uint64_t (*)(uint64_t))type metadata accessor for ContainerNameResolver,  (uint64_t)&unk_31138);
  *int64_t v22 = v21;
  uint64_t v23 = v63;
  int64_t v24 = v66;
  v66(v13 + v18, v6, v63);
  *(_BYTE *)(v19 + v8[6]) = 0;
  *(_BYTE *)(v19 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v25 = v13 + 2 * v18;
  uint64_t v26 = v23;
  sub_8BE0();
  uint64_t v27 = type metadata accessor for AccessoryNameResolver();
  sub_8308(v27);
  uint64_t v28 = sub_23FA8();
  uint64_t v29 = (uint64_t *)(v25 + v8[5]);
  v29[3] = v27;
  v29[4] = sub_825C( &qword_490C0,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryNameResolver,  (uint64_t)&unk_319C8);
  *uint64_t v29 = v28;
  v24(v25, v6, v26);
  uint64_t v30 = v25;
  *(_BYTE *)(v25 + v8[6]) = 0;
  *(_BYTE *)(v25 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, v64, v65);
  sub_6F90(v68.n128_i64[0], (uint64_t)&v76);
  LODWORD(v6) = *(unsigned __int8 *)(v13 + v8[7]);
  uint64_t v31 = type metadata accessor for ResolvableParameter(0LL);
  uint64_t v32 = swift_bridgeObjectRetain(v74);
  SuggestionParameter.rawValue.getter(v32);
  sub_8BA8();
  uint64_t v34 = *(unsigned __int8 *)(v13 + v33);
  BOOL v35 = (_DWORD)v6 == 1;
  unint64_t v36 = v73.n128_u64[0];
  uint64_t v72 = (void (*)(char *, void, uint64_t))v31;
  if (v35)
  {
    (*(void (**)(unint64_t, uint64_t, unint64_t))(v70 + 16))( v73.n128_u64[0],  v13 + v8[8],  v71.n128_u64[0]);
    ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v13, v26, v34, v36);
  }

  else
  {
    ResolvableParameter.__allocating_init(typeIdentifier:required:)(v13, v26, v34);
  }

  __n128 v68 = v77;
  int64_t v37 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v37);
  uint64_t v39 = v38;
  sub_8BFC(v13 + v8[5]);
  sub_82F8(v68);
  uint64_t v40 = sub_8BD0();
  sub_8B40(v40, v39, v41);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  uint64_t v42 = sub_6108(v75);
  char v43 = *(_BYTE *)(v19 + v8[7]);
  SuggestionParameter.rawValue.getter(v42);
  sub_8BA8();
  if ((v43 & 1) != 0)
  {
    uint64_t v44 = sub_8BB8();
    v45(v44);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v71 = v77;
  uint64_t v46 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v46);
  uint64_t v48 = v47;
  sub_8BFC(v19 + v8[5]);
  sub_82F8(v71);
  uint64_t v49 = sub_8BD0();
  sub_8B40(v49, v48, v50);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  uint64_t v51 = sub_6108(v75);
  char v52 = *(_BYTE *)(v30 + v8[7]);
  SuggestionParameter.rawValue.getter(v51);
  sub_8BA8();
  if ((v52 & 1) != 0)
  {
    uint64_t v53 = sub_8BB8();
    v54(v53);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v73 = v77;
  uint64_t v55 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v55);
  uint64_t v57 = v56;
  sub_8BFC(v30 + v8[5]);
  sub_82F8(v73);
  uint64_t v58 = sub_8BD0();
  sub_8B40(v58, v57, v59);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  sub_6108(v75);
  uint64_t v60 = v74;
  swift_bridgeObjectRelease();
  sub_7014(&v76, v69);
  swift_setDeallocating(v60);
  return sub_1E9F4();
}

uint64_t sub_1E9F4()
{
  uint64_t v1 = type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL);
  swift_arrayDestroy(v0 + ((v2 + 32) & ~v2), *(void *)(v0 + 16), v1);
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_1EA38()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CAC0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setScene(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_1EA84()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CAD8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_249B0();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for SetSceneSuggestion()
{
  return &type metadata for SetSceneSuggestion;
}

uint64_t sub_1EAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48D10 != -1) {
    swift_once(&qword_48D10, sub_1EA38);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CAC0);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject(v9, 40LL, 7LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v13[3] = v9;
  v13[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_1EC24@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&__int128 v40 = a1;
  uint64_t v41 = a2;
  uint64_t v39 = sub_4D88(&qword_49048);
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = *(void *)(v9 + 72);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 32) & ~v11;
  uint64_t v13 = swift_allocObject(v7, v12 + v10, v11 | 7);
  *(_OWORD *)(v13 + 16) = xmmword_2FE90;
  uint64_t v14 = v13 + v12;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for SuggestionParameter.sceneName(_:), v3);
  uint64_t v15 = type metadata accessor for SceneNameResolver();
  swift_allocObject(v15, 32LL, 7LL);
  uint64_t v16 = sub_27DD4();
  uint64_t v17 = (uint64_t *)(v14 + v8[5]);
  v17[3] = v15;
  v17[4] = sub_825C( &qword_49650,  (uint64_t (*)(uint64_t))type metadata accessor for SceneNameResolver,  (uint64_t)&unk_31CA4);
  *uint64_t v17 = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v14, v6, v3);
  *(_BYTE *)(v14 + v8[6]) = 1;
  *(_BYTE *)(v14 + v8[7]) = 0;
  uint64_t v18 = sub_4D88(&qword_49060);
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v18);
  sub_6F90(v40, (uint64_t)&v46);
  LODWORD(v15) = *(unsigned __int8 *)(v14 + v8[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v19 = swift_bridgeObjectRetain(v13);
  uint64_t v20 = SuggestionParameter.rawValue.getter(v19);
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  uint64_t v24 = v8[6];
  uint64_t v25 = *(unsigned __int8 *)(v14 + v24);
  if ((_DWORD)v15 == 1)
  {
    uint64_t v26 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v38, v14 + v8[8], v39);
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v22, v23, v25, v26);
  }

  else
  {
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v20, v21, *(unsigned __int8 *)(v14 + v24));
  }

  uint64_t v28 = v27;
  uint64_t v29 = v48;
  __int128 v40 = v47;
  uint64_t v30 = v47;
  uint64_t v31 = sub_4D4C(&v46, v47);
  uint64_t v32 = SuggestionParameter.rawValue.getter(v31);
  uint64_t v34 = v33;
  sub_60C4(v14 + v8[5], (uint64_t)v42);
  __int128 v44 = v40;
  uint64_t v45 = v29;
  sub_6128(v43);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v34, v42, v28, v30, v29);
  swift_release(v28);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v42);
  sub_6108(v43);
  swift_bridgeObjectRelease();
  sub_7014(&v46, v41);
  swift_setDeallocating(v13);
  return sub_1E9F4();
}

uint64_t sub_1EF88()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CAF0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setClimateMode(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_1EFD4()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CB08);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_249CC();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for SetClimateModeSuggestion()
{
  return &type metadata for SetClimateModeSuggestion;
}

uint64_t sub_1F040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48D20 != -1) {
    swift_once(&qword_48D20, sub_1EF88);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CAF0);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v9, 40LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v13[3] = v9;
  v13[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_1F170@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v46.n128_u64[0] = a1;
  uint64_t v50 = a2;
  v49.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v47 = *(void *)(v49.n128_u64[0] - 8);
  __chkstk_darwin(v49.n128_u64[0]);
  uint64_t v48 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v45 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 2 * v45, v10 | 7);
  uint64_t v51 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30550;
  uint64_t v13 = v12 + v11;
  sub_1F60C(v12, enum case for SuggestionParameter.roomName(_:));
  uint64_t v14 = type metadata accessor for RoomNameResolver();
  sub_1251C(v14, 32LL);
  uint64_t v15 = sub_1B2BC();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  v16[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *uint64_t v16 = v15;
  __int128 v44 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  v44(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 0;
  sub_4D88(&qword_49060);
  uint64_t v17 = sub_82E8((uint64_t)sub_2E8A0);
  uint64_t v18 = v13 + v45;
  sub_1F60C(v17, enum case for SuggestionParameter.attribute(_:));
  uint64_t v19 = type metadata accessor for AttributeResolver();
  sub_1251C(v19, 40LL);
  uint64_t v20 = sub_26ED0();
  uint64_t v21 = (void *)(v18 + v8[5]);
  v21[3] = v19;
  v21[4] = sub_825C( &qword_49198,  (uint64_t (*)(uint64_t))type metadata accessor for AttributeResolver,  (uint64_t)&unk_31B94);
  *uint64_t v21 = v20;
  v44(v18, v6, v3);
  *(_BYTE *)(v18 + v8[6]) = 1;
  *(_BYTE *)(v18 + v8[7]) = 0;
  sub_82E8((uint64_t)sub_2E8A0);
  sub_6F90(v46.n128_i64[0], (uint64_t)&v54);
  LODWORD(v21) = *(unsigned __int8 *)(v13 + v8[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v22 = swift_bridgeObjectRetain(v51);
  uint64_t v23 = SuggestionParameter.rawValue.getter(v22);
  if ((_DWORD)v21 == 1)
  {
    sub_829C(v23, v13 + v8[8]);
    uint64_t v24 = sub_82BC();
  }

  else
  {
    uint64_t v24 = sub_82D4();
  }

  uint64_t v25 = v24;
  uint64_t v26 = v56;
  __n128 v46 = v55;
  unint64_t v27 = v55.n128_u64[0];
  uint64_t v28 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v29 = SuggestionParameter.rawValue.getter(v28);
  uint64_t v31 = v30;
  sub_60C4(v13 + v8[5], (uint64_t)v52);
  sub_82F8(v46);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v29, v31, v52, v25, v27, v26);
  swift_release(v25);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v52);
  uint64_t v32 = sub_6108(v53);
  LODWORD(v26) = *(unsigned __int8 *)(v18 + v8[7]);
  uint64_t v33 = SuggestionParameter.rawValue.getter(v32);
  if ((_DWORD)v26 == 1)
  {
    sub_829C(v33, v18 + v8[8]);
    uint64_t v34 = sub_82BC();
  }

  else
  {
    uint64_t v34 = sub_82D4();
  }

  uint64_t v35 = v34;
  uint64_t v36 = v56;
  __n128 v49 = v55;
  unint64_t v37 = v55.n128_u64[0];
  uint64_t v38 = sub_4D4C(&v54, v55.n128_i64[0]);
  uint64_t v39 = SuggestionParameter.rawValue.getter(v38);
  uint64_t v41 = v40;
  sub_60C4(v18 + v8[5], (uint64_t)v52);
  sub_82F8(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v39, v41, v52, v35, v37, v36);
  swift_release(v35);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v52);
  sub_6108(v53);
  uint64_t v42 = v51;
  swift_bridgeObjectRelease();
  sub_7014(&v54, v50);
  swift_setDeallocating(v42);
  return sub_1E9F4();
}

uint64_t sub_1F60C(uint64_t a1, uint64_t a2)
{
  return v3(v2, a2, v4);
}

uint64_t sub_1F618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_495FC);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_4C74;
  return sub_1BDEC(a1, a2, a3);
}

uint64_t sub_1F67C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for HomeAutomationGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions23HomeAutomationGenerator);
}

uint64_t sub_1F6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_49684);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1F798;
  return sub_1F618(a1, a2, a3);
}

uint64_t sub_1F714()
{
  return sub_1F75C((unint64_t *)&unk_49700, (uint64_t)&unk_31738);
}

uint64_t sub_1F738()
{
  return sub_1F75C(&qword_49710, (uint64_t)&unk_31760);
}

uint64_t sub_1F75C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for HomeAutomationGenerator();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t Log.suggestions.unsafeMutableAddressor()
{
  return sub_1FB38(&qword_48D38, (uint64_t)static Log.suggestions, (uint64_t)sub_1FB8C);
}

Swift::Void __swiftcall Logger.debug(output:test:caller:)(Swift::String output, Swift::Bool test, Swift::String caller)
{
  object = caller._object;
  uint64_t countAndFlagsBits = caller._countAndFlagsBits;
  uint64_t v5 = output._object;
  uint64_t v38 = output._countAndFlagsBits;
  uint64_t v42 = 46LL;
  unint64_t v43 = 0xE100000000000000LL;
  uint64_t v40 = &v42;
  unint64_t v6 = sub_21110(sub_20EF4, (uint64_t)v39, test, caller._countAndFlagsBits, (unint64_t)caller._object);
  if ((v7 & 1) != 0)
  {
    sub_20FF4();
    BOOL v11 = (v9 & v10) == 0;
    uint64_t v12 = 7LL;
    if (!v11) {
      uint64_t v12 = 11LL;
    }
    unint64_t v6 = sub_21030(v12 | (v8 << 16), -1LL);
  }

  unint64_t v13 = v6;
  uint64_t v42 = 47LL;
  unint64_t v43 = 0xE100000000000000LL;
  __chkstk_darwin();
  v37[2] = &v42;
  unint64_t v14 = sub_21138(sub_20F6C, (uint64_t)v37);
  char v16 = v15;
  sub_2105C((uint64_t)object);
  uint64_t v17 = sub_2105C((uint64_t)v5);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  BOOL v20 = sub_21154(v19);
  if ((v16 & 1) != 0)
  {
    if (v20)
    {
      uint64_t v21 = sub_20FB4(22LL);
      uint64_t v22 = sub_20FB4(64LL);
      uint64_t v42 = v22;
      *(_DWORD *)uint64_t v21 = 136446466;
      sub_20FE8(15LL, v13);
      uint64_t v31 = sub_21130();
      unint64_t v33 = v32;
      sub_15A64();
      uint64_t v34 = sub_20624(v31, v33, &v42);
      uint64_t v35 = sub_210C4(v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v35, v36, v21 + 4);
      sub_20F84();
      unint64_t v30 = v33;
      goto LABEL_11;
    }

LABEL_12:
    sub_20FA0((uint64_t)v5);
    sub_20F84();
    goto LABEL_13;
  }

  if (!v20) {
    goto LABEL_12;
  }
  uint64_t v21 = sub_20FB4(22LL);
  uint64_t v22 = sub_20FB4(64LL);
  uint64_t v42 = v22;
  *(_DWORD *)uint64_t v21 = 136446466;
  unint64_t v23 = sub_21030(v14, 1LL);
  if (v13 >> 14 >= v23 >> 14)
  {
    sub_20FE8(v23, v13);
    uint64_t v24 = sub_21130();
    unint64_t v26 = v25;
    sub_15A64();
    uint64_t v27 = sub_20624(v24, v26, &v42);
    uint64_t v28 = sub_210C4(v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v28, v29, v21 + 4);
    sub_20F84();
    unint64_t v30 = v26;
LABEL_11:
    swift_bridgeObjectRelease(v30);
    *(_WORD *)(v21 + 12) = 2080;
    sub_1A480();
    uint64_t v41 = sub_20624(v38, (unint64_t)v5, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, countAndFlagsBits, v21 + 14);
    sub_2103C((uint64_t)v5);
    _os_log_impl(&dword_0, v18, v19, "%{public}s: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 2LL, (char *)&type metadata for Any + 8);
    sub_20FA8(v22);
    sub_20FA8(v21);
LABEL_13:

    sub_21084();
    return;
  }

  __break(1u);
}

Swift::Void __swiftcall Logger.warning(output:test:file:function:line:)( Swift::String output, Swift::Bool test, Swift::String file, Swift::String function, Swift::Int line)
{
}

uint64_t *Log.OSLogs.suggestions.unsafeMutableAddressor()
{
  if (qword_48D48 != -1) {
    swift_once(&qword_48D48, sub_1FD60);
  }
  return &static Log.OSLogs.suggestions;
}

uint64_t sub_1FAB8(uint64_t a1)
{
  return sub_1FBB0(a1, static Log.general, &qword_48D40, (id *)&static Log.OSLogs.general, (uint64_t)sub_1FCB0);
}

uint64_t *Log.OSLogs.general.unsafeMutableAddressor()
{
  if (qword_48D40 != -1) {
    swift_once(&qword_48D40, sub_1FCB0);
  }
  return &static Log.OSLogs.general;
}

uint64_t Log.general.unsafeMutableAddressor()
{
  return sub_1FB38(&qword_48D30, (uint64_t)static Log.general, (uint64_t)sub_1FAB8);
}

uint64_t sub_1FB38(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    sub_2114C((uint64_t)a1, a2, a3);
  }
  uint64_t v4 = sub_21160();
  return sub_4D70(v4, a2);
}

uint64_t static Log.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1FC50(&qword_48D30, (uint64_t)static Log.general, (uint64_t)sub_1FAB8, a1);
}

uint64_t sub_1FB8C(uint64_t a1)
{
  return sub_1FBB0(a1, static Log.suggestions, &qword_48D48, (id *)&static Log.OSLogs.suggestions, (uint64_t)sub_1FD60);
}

uint64_t sub_1FBB0(uint64_t a1, uint64_t *a2, void *a3, id *a4, uint64_t a5)
{
  uint64_t v9 = sub_21160();
  sub_6BC0(v9, a2);
  sub_4D70(v9, (uint64_t)a2);
  if (*a3 != -1LL) {
    swift_once(a3, a5);
  }
  return Logger.init(_:)(*a4);
}

uint64_t static Log.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1FC50(&qword_48D38, (uint64_t)static Log.suggestions, (uint64_t)sub_1FB8C, a1);
}

uint64_t sub_1FC50@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    sub_2114C((uint64_t)a1, a2, a3);
  }
  uint64_t v6 = sub_21160();
  uint64_t v7 = sub_4D70(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t sub_1FCB0()
{
  if (qword_48D50 != -1) {
    swift_once(&qword_48D50, sub_1FE44);
  }
  uint64_t v0 = qword_4CB60;
  uint64_t v1 = *(void *)algn_4CB68;
  swift_bridgeObjectRetain(*(void *)algn_4CB68);
  uint64_t result = OS_os_log.init(subsystem:category:)(0xD00000000000001DLL, 0x8000000000035B00LL, v0, v1);
  static Log.OSLogs.general = result;
  return result;
}

id static Log.OSLogs.general.getter()
{
  return sub_1FE10(&qword_48D40, (id *)&static Log.OSLogs.general, (uint64_t)sub_1FCB0);
}

uint64_t sub_1FD60()
{
  if (qword_48D58 != -1) {
    swift_once(&qword_48D58, sub_1FE68);
  }
  uint64_t v0 = qword_4CB70;
  uint64_t v1 = *(void *)algn_4CB78;
  swift_bridgeObjectRetain(*(void *)algn_4CB78);
  uint64_t result = OS_os_log.init(subsystem:category:)(0xD00000000000001DLL, 0x8000000000035B00LL, v0, v1);
  static Log.OSLogs.suggestions = result;
  return result;
}

id static Log.OSLogs.suggestions.getter()
{
  return sub_1FE10(&qword_48D48, (id *)&static Log.OSLogs.suggestions, (uint64_t)sub_1FD60);
}

id sub_1FE10(void *a1, id *a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    sub_2114C((uint64_t)a1, (uint64_t)a2, a3);
  }
  return *a2;
}

void sub_1FE44()
{
  qword_4CB60 = 0x6C6172656E6547LL;
  *(void *)algn_4CB68 = 0xE700000000000000LL;
}

void sub_1FE68()
{
  qword_4CB70 = 0x6974736567677553LL;
  *(void *)algn_4CB78 = 0xEB00000000736E6FLL;
}

Swift::Void __swiftcall Logger.info(output:addToSummary:test:caller:)( Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
}

Swift::Void __swiftcall Logger.notice(output:addToSummary:test:caller:)( Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
}

void sub_1FEFC( uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void *), uint64_t (*a8)(void *), uint64_t (*a9)(os_log_s *))
{
  v41[4] = a1;
  __int128 v44 = a9;
  uint64_t v13 = 0x65725F7261646172LL;
  uint64_t v48 = (uint64_t (*)(void))(&stru_20 + 14);
  unint64_t v49 = 0xE100000000000000LL;
  if ((a3 & 1) != 0) {
    uint64_t v14 = 0xEF202D2074726F70LL;
  }
  else {
    uint64_t v14 = 0xE000000000000000LL;
  }
  __n128 v46 = (uint64_t *)&v48;
  if ((a3 & 1) == 0) {
    uint64_t v13 = 0LL;
  }
  uint64_t v42 = v13;
  unint64_t v15 = sub_20DCC(a7, (uint64_t)v45, a5, a6);
  if ((v16 & 1) != 0)
  {
    sub_20FF4();
    BOOL v20 = (v18 & v19) == 0;
    uint64_t v21 = 7LL;
    if (!v20) {
      uint64_t v21 = 11LL;
    }
    unint64_t v15 = sub_21030(v21 | (v17 << 16), -1LL);
  }

  unint64_t v43 = v15;
  uint64_t v48 = (uint64_t (*)(void))(&stru_20 + 15);
  unint64_t v49 = 0xE100000000000000LL;
  __chkstk_darwin(v15);
  v41[2] = &v48;
  unint64_t v22 = sub_21138(a8, (uint64_t)v41);
  char v24 = v23;
  sub_2105C(a6);
  sub_2105C(a2);
  uint64_t v25 = sub_210E0();
  unint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
  int v27 = v44(v26);
  BOOL v28 = sub_21154((os_log_type_t)v27);
  if ((v24 & 1) != 0)
  {
    if (v28)
    {
      uint64_t v35 = sub_20FB4(32LL);
      uint64_t v36 = sub_20FB4(96LL);
      uint64_t v48 = (uint64_t (*)(void))v36;
      *(_DWORD *)uint64_t v35 = 136315650;
      sub_210E0();
      uint64_t v47 = sub_21044(v42, v37, (uint64_t *)&v48);
      sub_20F90();
      sub_2103C(v14);
      *(_WORD *)(v35 + 12) = 2082;
      sub_20FE8(15LL, v43);
      uint64_t v38 = sub_21130();
      LODWORD(v44) = v27;
      unint64_t v40 = v39;
      sub_15A64();
      uint64_t v47 = sub_20624(v38, v40, (uint64_t *)&v48);
      sub_20F90();
      sub_20F84();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2080;
      sub_1A480();
      uint64_t v47 = sub_21120();
      sub_20F90();
      sub_2103C(a2);
      _os_log_impl(&dword_0, v26, (os_log_type_t)v44, "%s%{public}s: %s", (uint8_t *)v35, 0x20u);
      swift_arrayDestroy(v36, 3LL, (char *)&type metadata for Any + 8);
      sub_20FA8(v36);
      uint64_t v34 = v35;
      goto LABEL_16;
    }

void sub_202B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(void *))
{
  v134[0] = 47LL;
  v134[1] = 0xE100000000000000LL;
  char v131 = v134;
  unint64_t v13 = sub_21110(a9, (uint64_t)v130, a3, a4, a5);
  char v15 = v14;
  sub_2105C(a7);
  sub_2105C(a2);
  uint64_t v16 = sub_2105C(a5);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  int v18 = static os_log_type_t.error.getter();
  BOOL v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
  if ((v15 & 1) != 0)
  {
    if (v19)
    {
      uint64_t v20 = sub_20FB4(52LL);
      uint64_t v70 = sub_20FB4(128LL);
      v134[0] = v70;
      *(_DWORD *)uint64_t v20 = 136316162;
      HIDWORD(v124) = v18;
      uint64_t v132 = sub_20FBC(v70, v71, v72, v73, v74, v75, v76, v77, v120, v124);
      sub_21020(v132, v78, v79, v20 + 12, v80, v81, v82, v83);
      uint64_t v84 = sub_210B0();
      uint64_t v132 = sub_21100(v84, v85, v86, v87, v88, v89, v90, v91, v123, v126);
      sub_21020(v132, v92, v93, v20 + 22, v94, v95, v96, v97);
      sub_2103C(a7);
      sub_2109C();
      uint64_t v132 = sub_21044(a1, v98, v134);
      sub_21020(v132, v99, v100, v20 + 32, v101, v102, v103, v104);
      sub_2103C(a2);
      *(_WORD *)(v20 + 32) = 2082;
      sub_20FF4();
      BOOL v108 = (v106 & v107) == 0;
      uint64_t v109 = 7LL;
      if (!v108) {
        uint64_t v109 = 11LL;
      }
      sub_20FE8(15LL, v109 | (v105 << 16));
      sub_21144();
      sub_2104C();
      uint64_t v132 = sub_21044(a4, v110, v134);
      sub_21020(v132, v111, v112, v20 + 42, v113, v114, v115, v116);
      sub_20F84();
      sub_6324();
      sub_21064();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v117, &v133, v118);
      sub_210F0(&dword_0, v119, v128, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld");
      swift_arrayDestroy(v70, 4LL, (char *)&type metadata for Any + 8);
      uint64_t v69 = v70;
      goto LABEL_13;
    }

LABEL_14:
    sub_20F84();
    sub_20FA0(a2);
    sub_20FA0(a7);
    goto LABEL_15;
  }

  if (!v19) {
    goto LABEL_14;
  }
  HIDWORD(v124) = v18;
  uint64_t v20 = sub_20FB4(52LL);
  uint64_t v21 = sub_20FB4(128LL);
  v134[0] = v21;
  *(_DWORD *)uint64_t v20 = 136316162;
  uint64_t v132 = sub_20FBC(v21, v22, v23, v24, v25, v26, v27, v28, v21, v124);
  sub_21010(v132, v29, v30, v20 + 12, v31, v32, v33, v34);
  uint64_t v35 = sub_210B0();
  uint64_t v132 = sub_21100(v35, v36, v37, v38, v39, v40, v41, v42, v121, v125);
  sub_21010(v132, v43, v44, v20 + 22, v45, v46, v47, v48);
  sub_2103C(a7);
  sub_2109C();
  uint64_t v132 = sub_21044(a1, v49, v134);
  sub_21010(v132, v50, v51, v20 + 32, v52, v53, v54, v55);
  sub_2103C(a2);
  *(_WORD *)(v20 + 32) = 2082;
  unint64_t v56 = sub_21030(v13, 1LL);
  uint64_t v57 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000LL) == 0) {
    uint64_t v57 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v57 >= v56 >> 14)
  {
    uint64_t v58 = 7LL;
    if (((a5 >> 60) & ((a4 & 0x800000000000000LL) == 0)) != 0) {
      uint64_t v58 = 11LL;
    }
    sub_20FE8(v56, v58 | (v57 << 16));
    sub_21144();
    sub_2104C();
    uint64_t v132 = sub_21044(a4, v59, v134);
    sub_21010(v132, v60, v61, v20 + 42, v62, v63, v64, v65);
    sub_20F84();
    sub_6324();
    sub_21064();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v66, &v133, v67);
    sub_210F0(&dword_0, v68, v127, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld");
    swift_arrayDestroy(v122, 4LL, (char *)&type metadata for Any + 8);
    uint64_t v69 = v122;
LABEL_13:
    sub_20FA8(v69);
    sub_20FA8(v20);
LABEL_15:

    return;
  }

  __break(1u);
}

  uint64_t v16 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = v6;
  uint64_t v17 = *(void *)(v16 + 16);
  int v18 = __OFADD__(v17, 1LL);
  BOOL v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
  return result;
}

uint64_t sub_20624(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_206F4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19F18((uint64_t)v12, *a3);
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
      sub_19F18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_6108(v12);
  return v7;
}

void *sub_206F4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_20848((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      uint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_2090C(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_20848(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_2090C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_209A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_20B74(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_20B74((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_209A0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  uint64_t v5 = sub_20B10(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_20B10(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_4D88(&qword_49720);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_20B74(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_4D88(&qword_49720);
    BOOL v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    BOOL v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v13 = v11 + 32;
  char v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_20D0C(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_20C48(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_20C48(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_20D0C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

uint64_t sub_20D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL) & 1;
  }
}

unint64_t sub_20DCC(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0LL;
  }
  uint64_t v9 = 7LL;
  if (((a4 >> 60) & ((a3 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v9 = 11LL;
  }
  unint64_t v10 = v9 | (v5 << 16);
  while (1)
  {
    unint64_t v10 = String.index(before:)(v10, a3, a4);
    uint64_t v11 = String.subscript.getter(v10, a3, a4);
    uint64_t v13 = v12;
    v17[0] = v11;
    v17[1] = v12;
    char v14 = a1(v17);
    if (v4) {
      break;
    }
    char v15 = v14;
    swift_bridgeObjectRelease(v13);
    if ((v15 & 1) != 0) {
      return v10;
    }
    if (v10 < 0x4000) {
      return 0LL;
    }
  }

  swift_bridgeObjectRelease(v13);
  return v10;
}

uint64_t sub_20ECC(uint64_t *a1, uint64_t *a2)
{
  return sub_20D8C(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_20EF4(uint64_t *a1)
{
  return sub_20ECC(a1, *(uint64_t **)(v1 + 16)) & 1;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.OSLogs()
{
  return &type metadata for Log.OSLogs;
}

unint64_t sub_20F30()
{
  unint64_t result = qword_49718;
  if (!qword_49718)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_49718);
  }

  return result;
}

uint64_t sub_20F6C(uint64_t *a1)
{
  return sub_20EF4(a1) & 1;
}

uint64_t sub_20F84()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t sub_20F90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 112, v1, v0);
}

uint64_t sub_20FA0(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2LL);
}

uint64_t sub_20FA8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_20FB4(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_20FBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return sub_20624(0x65725F7261646172LL, 0xEF202D2074726F70LL, (uint64_t *)va);
}

uint64_t sub_20FE8(uint64_t a1, uint64_t a2)
{
  return String.subscript.getter(a1, a2, v3, v2);
}

  ;
}

uint64_t sub_21010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v9, v8);
}

uint64_t sub_21020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v9, v8);
}

uint64_t sub_21030(uint64_t a1, uint64_t a2)
{
  return String.index(_:offsetBy:)(a1, a2, v3, v2);
}

uint64_t sub_2103C(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3LL);
}

uint64_t sub_21044(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_20624(a1, v3, a3);
}

uint64_t sub_2104C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_2105C(uint64_t a1)
{
  return swift_bridgeObjectRetain_n(a1, 2LL);
}

void sub_21064()
{
  *(_WORD *)(v0 + 42) = 2050;
}

  ;
}

uint64_t sub_2109C()
{
  *(_WORD *)(v0 + 22) = 2080;
  return swift_bridgeObjectRetain(v1);
}

uint64_t sub_210B0()
{
  *(_WORD *)(v0 + 12) = 2082;
  return swift_bridgeObjectRetain(v1);
}

uint64_t sub_210C4(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_210E0()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

void sub_210F0(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_21100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return sub_20624(v10, v11, (uint64_t *)va);
}

unint64_t sub_21110( uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_20DCC(a1, a2, a4, a5);
}

uint64_t sub_21120()
{
  return sub_20624(*(void *)(v1 - 176), v0, (uint64_t *)(v1 - 96));
}

uint64_t sub_21130()
{
  return static String._fromSubstring(_:)();
}

unint64_t sub_21138(uint64_t (*a1)(void *), uint64_t a2)
{
  return sub_20DCC(a1, a2, v3, v2);
}

uint64_t sub_21144()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_2114C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_once(a1, a3);
}

BOOL sub_21154(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_21160()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_21168()
{
  return sub_2137C(&qword_48CF0, (uint64_t)qword_4CA60, (uint64_t)sub_1A76C);
}

uint64_t sub_21184()
{
  return sub_2137C(&qword_48C60, (uint64_t)qword_4C8A0, (uint64_t)sub_6B18);
}

uint64_t sub_211A0()
{
  return sub_2137C(&qword_48C70, (uint64_t)qword_4C8D0, (uint64_t)sub_7C5C);
}

uint64_t sub_211BC()
{
  return sub_2137C(&qword_48CC0, (uint64_t)qword_4C9D0, (uint64_t)sub_11CF4);
}

uint64_t sub_211D8()
{
  return sub_2137C(&qword_48D10, (uint64_t)qword_4CAC0, (uint64_t)sub_1EA38);
}

uint64_t sub_211F4()
{
  return sub_2137C(&qword_48D00, (uint64_t)qword_4CA90, (uint64_t)sub_1E310);
}

uint64_t sub_21210()
{
  return sub_2137C(&qword_48DB0, (uint64_t)qword_4CC38, (uint64_t)sub_2683C);
}

uint64_t sub_2122C()
{
  return sub_2137C(&qword_48CB0, (uint64_t)qword_4C990, (uint64_t)sub_8CBC);
}

uint64_t sub_21248()
{
  return sub_2137C(&qword_48CA0, (uint64_t)qword_4C960, (uint64_t)sub_8C04);
}

uint64_t sub_21264()
{
  return sub_2137C(&qword_48C80, (uint64_t)qword_4C900, (uint64_t)sub_7D14);
}

uint64_t sub_21280()
{
  return sub_2137C(&qword_48CD0, (uint64_t)qword_4CA00, (uint64_t)sub_135DC);
}

uint64_t sub_2129C()
{
  return sub_2137C(&qword_48DF0, (uint64_t)qword_4CCF8, (uint64_t)sub_2DEB0);
}

uint64_t sub_212B8()
{
  return sub_2137C(&qword_48CE0, (uint64_t)qword_4CA30, (uint64_t)sub_149F4);
}

uint64_t sub_212D4()
{
  return sub_2137C(&qword_48D20, (uint64_t)qword_4CAF0, (uint64_t)sub_1EF88);
}

uint64_t sub_212F0()
{
  return sub_2137C(&qword_48DE0, (uint64_t)qword_4CCC8, (uint64_t)sub_28688);
}

uint64_t sub_2130C()
{
  return sub_2137C(&qword_48DC0, (uint64_t)qword_4CC68, (uint64_t)sub_27094);
}

uint64_t sub_21328()
{
  return sub_2137C(&qword_48DD0, (uint64_t)qword_4CC98, (uint64_t)sub_2714C);
}

uint64_t sub_21344()
{
  return sub_2137C(&qword_48D78, (uint64_t)qword_4CBC0, (uint64_t)sub_24B14);
}

uint64_t sub_21360()
{
  return sub_2137C(&qword_48C90, (uint64_t)qword_4C930, (uint64_t)sub_8320);
}

uint64_t sub_2137C(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, a2);
  return HomeSuggestionType.rawValue.getter(v5);
}

uint64_t sub_213C8()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x6F747541656D6F48LL, 0xEE006E6F6974616DLL);
  qword_4CB80 = result;
  return result;
}

void sub_21424()
{
  uint64_t v0 = sub_4D88(&qword_49118);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = type metadata accessor for HomeAutomationCATs(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v12);
  id v14 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  id v15 = [v14 resourceURL];

  if (v15)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);

    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  sub_61AC((uint64_t)v3, v16, 1LL, v6);
  sub_22E10((uint64_t)v3, (uint64_t)v5);
  if (sub_61F4((uint64_t)v5, 1LL, v6) == 1)
  {
    sub_22E58((uint64_t)v5, &qword_49118);
    object = (void *)0x8000000000035E90LL;
    uint64_t countAndFlagsBits = 0xD00000000000004DLL;
  }

  else
  {
    URL.appendingPathComponent(_:)(0x6574616C706D6554LL, 0xE900000000000073LL);
    uint64_t v19 = sub_22F38((uint64_t)v5);
    URL.absoluteURL.getter(v19);
    sub_22F38((uint64_t)v11);
    Swift::String v20 = URL.path(percentEncoded:)(1);
    uint64_t countAndFlagsBits = v20._countAndFlagsBits;
    object = v20._object;
    sub_22F38((uint64_t)v9);
  }

  qword_4CB88 = countAndFlagsBits;
  unk_4CB90 = object;
}

uint64_t sub_2163C()
{
  qword_4CBB0 = type metadata accessor for FeatureFlagProvider(0LL);
  unk_4CBB8 = &protocol witness table for FeatureFlagProvider;
  sub_1595C(qword_4CB98);
  return FeatureFlagProvider.init()();
}

uint64_t sub_21678(uint64_t a1, uint64_t a2)
{
  v2[22] = a1;
  v2[23] = a2;
  uint64_t v3 = type metadata accessor for DialogDetails(0LL);
  v2[24] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[25] = v4;
  v2[26] = sub_15A18(v4);
  uint64_t v5 = sub_4D88(&qword_493F0);
  v2[27] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  v2[28] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[29] = v7;
  v2[30] = sub_15A18(v7);
  return sub_4DC8();
}

uint64_t sub_216F8(uint64_t a1)
{
  if (qword_48D48 != -1) {
    a1 = swift_once(&qword_48D48, sub_1FD60);
  }
  uint64_t v2 = static Log.OSLogs.suggestions;
  uint64_t v3 = static Signpost.Name.createOwnerDefinition.getter(a1);
  static Signpost.begin(logging:_:)(v2, v3, v4, v5);
  if (qword_48D70 != -1) {
    swift_once(&qword_48D70, sub_2163C);
  }
  uint64_t v6 = qword_4CBB0;
  uint64_t v7 = unk_4CBB8;
  uint64_t v8 = sub_4D4C(qword_4CB98, qword_4CBB0);
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t v10 = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v10, v8, v6);
  LOBYTE(v8) = dispatch thunk of FeatureFlagProtocol.isSiriSuggestionsEnabled.getter(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v6);
  swift_task_dealloc(v10);
  if ((v8 & 1) != 0)
  {
    if (qword_48D60 != -1) {
      swift_once(&qword_48D60, sub_213C8);
    }
    unint64_t v11 = *(int **)(v1 + 176);
    uint64_t v12 = qword_4CB80;
    *(void *)(v1 + 40) = type metadata accessor for DomainOwner(0LL);
    sub_159CC( &qword_497D0,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
    *(void *)(v1 + 48) = v13;
    *(void *)(v1 + 16) = v12;
    uint64_t v14 = v11[1];
    uint64_t v36 = (uint64_t (*)(uint64_t))((char *)v11 + *v11);
    swift_retain(v12);
    id v15 = (void *)swift_task_alloc(v14);
    *(void *)(v1 + 248) = v15;
    *id v15 = v1;
    v15[1] = sub_21A18;
    return v36(v1 + 16);
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v17 = *(void *)(v1 + 240);
    uint64_t v18 = *(void *)(v1 + 216);
    uint64_t v19 = type metadata accessor for Logger(0LL);
    sub_4D70(v19, (uint64_t)static Log.suggestions);
    v20._uint64_t countAndFlagsBits = 0xD000000000000031LL;
    v21._uint64_t countAndFlagsBits = 0xD000000000000081LL;
    v20._object = (void *)0x8000000000035D90LL;
    v21._object = (void *)0x8000000000035DD0LL;
    v22._object = (void *)0x8000000000035E60LL;
    v22._uint64_t countAndFlagsBits = 0xD000000000000027LL;
    Logger.warning(output:test:file:function:line:)(v20, 0, v21, v22, 38LL);
    uint64_t v23 = static Log.OSLogs.suggestions;
    uint64_t v25 = static Signpost.Name.createOwnerDefinition.getter(v24);
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v30 = type metadata accessor for Signpost.Context(0LL);
    sub_22F2C(v18, v31, v32, v30);
    static Signpost.end(logging:_:_:_:)(v23, v17, v25, v27, v29, v18);
    sub_22E58(v18, &qword_493F0);
    uint64_t v33 = *(void *)(v1 + 240);
    uint64_t v34 = *(void *)(v1 + 216);
    uint64_t v35 = *(void *)(v1 + 208);
    (*(void (**)(uint64_t, void))(*(void *)(v1 + 232) + 8LL))(v33, *(void *)(v1 + 224));
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    return (*(uint64_t (**)(void *))(v1 + 8))(_swiftEmptyArrayStorage);
  }

uint64_t sub_21A18(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 248LL);
  *(void *)(*(void *)v1 + 256LL) = a1;
  swift_task_dealloc(v3);
  sub_6108(v2);
  return sub_4DC8();
}

uint64_t sub_21A78()
{
  uint64_t v1 = type metadata accessor for HomeAutomationGenerator();
  uint64_t v2 = swift_allocObject(v1, 16LL, 7LL);
  *(void *)(v0 + 80) = v1;
  sub_159CC( &qword_497D8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationGenerator,  (uint64_t)&unk_31790);
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)(v0 + 56);
  sub_1A0DC();
  sub_6108((void *)(v0 + 56));
  if (qword_48D00 != -1) {
    swift_once(&qword_48D00, sub_1E310);
  }
  uint64_t v5 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v6 = sub_4D70(v5, (uint64_t)qword_4CA90);
  HomeSuggestionType.rawValue.getter(v6);
  sub_22F14();
  if (qword_48D08 != -1) {
    swift_once(&qword_48D08, sub_1E35C);
  }
  uint64_t v8 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v9 = *(void *)(v0 + 192);
  uint64_t v10 = sub_4D70(v9, (uint64_t)qword_4CAA8);
  uint64_t v235 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v235(v7, v10, v9);
  uint64_t v11 = sub_22F00();
  *(void *)(v11 + 16) = &type metadata for DimLightsSuggestion;
  *(void *)(v11 + 24) = &off_439C0;
  sub_22EB0(v11, v12, v13, (uint64_t)sub_22E08);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v14 = sub_22EE0();
  if (qword_48CB0 != -1) {
    uint64_t v14 = swift_once(&qword_48CB0, sub_8CBC);
  }
  sub_22EC8(v14, (uint64_t)qword_4C990);
  sub_22F14();
  if (qword_48CB8 != -1) {
    swift_once(&qword_48CB8, sub_8D08);
  }
  sub_22F08();
  sub_22E8C(v15, (uint64_t)qword_4C9A8, v16, v17, v18, v19, v20, v21, v235);
  uint64_t v22 = sub_22F00();
  *(void *)(v22 + 16) = &type metadata for GetStateOfAirQuality;
  *(void *)(v22 + 24) = &off_431B8;
  sub_22EB0(v22, v23, v24, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v25 = sub_22EE0();
  if (qword_48DB0 != -1) {
    uint64_t v25 = swift_once(&qword_48DB0, sub_2683C);
  }
  sub_22EC8(v25, (uint64_t)qword_4CC38);
  sub_22F14();
  if (qword_48DB8 != -1) {
    swift_once(&qword_48DB8, sub_26888);
  }
  sub_22F08();
  sub_22E8C(v26, (uint64_t)qword_4CC50, v27, v28, v29, v30, v31, v32, v236);
  uint64_t v33 = sub_22F00();
  *(void *)(v33 + 16) = &type metadata for GetStateOfDoorLocks;
  *(void *)(v33 + 24) = &off_43D10;
  sub_22EB0(v33, v34, v35, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v36 = sub_22EE0();
  if (qword_48CA0 != -1) {
    uint64_t v36 = swift_once(&qword_48CA0, sub_8C04);
  }
  sub_22EC8(v36, (uint64_t)qword_4C960);
  sub_22F14();
  if (qword_48CA8 != -1) {
    swift_once(&qword_48CA8, sub_8C50);
  }
  sub_22F08();
  sub_22E8C(v37, (uint64_t)qword_4C978, v38, v39, v40, v41, v42, v43, v237);
  uint64_t v44 = sub_22F00();
  *(void *)(v44 + 16) = &type metadata for GetStateOfGarageDoors;
  *(void *)(v44 + 24) = &off_43138;
  sub_22EB0(v44, v45, v46, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v47 = sub_22EE0();
  if (qword_48C70 != -1) {
    uint64_t v47 = swift_once(&qword_48C70, sub_7C5C);
  }
  sub_22EC8(v47, (uint64_t)qword_4C8D0);
  sub_22F14();
  if (qword_48C78 != -1) {
    swift_once(&qword_48C78, sub_7CA8);
  }
  sub_22F08();
  sub_22E8C(v48, (uint64_t)qword_4C8E8, v49, v50, v51, v52, v53, v54, v238);
  uint64_t v55 = sub_22F00();
  *(void *)(v55 + 16) = &type metadata for GetStateOfHumidity;
  *(void *)(v55 + 24) = &off_42FB8;
  sub_22EB0(v55, v56, v57, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v58 = sub_22EE0();
  if (qword_48C80 != -1) {
    uint64_t v58 = swift_once(&qword_48C80, sub_7D14);
  }
  sub_22EC8(v58, (uint64_t)qword_4C900);
  sub_22F14();
  if (qword_48C88 != -1) {
    swift_once(&qword_48C88, sub_7D60);
  }
  sub_22F08();
  sub_22E8C(v59, (uint64_t)qword_4C918, v60, v61, v62, v63, v64, v65, v239);
  uint64_t v66 = sub_22F00();
  *(void *)(v66 + 16) = &type metadata for GetStateOfLightsPower;
  *(void *)(v66 + 24) = &off_43038;
  sub_22EB0(v66, v67, v68, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v69 = sub_22EE0();
  if (qword_48DC0 != -1) {
    uint64_t v69 = swift_once(&qword_48DC0, sub_27094);
  }
  sub_22EC8(v69, (uint64_t)qword_4CC68);
  sub_22F14();
  if (qword_48DC8 != -1) {
    swift_once(&qword_48DC8, sub_270E0);
  }
  sub_22F08();
  sub_22E8C(v70, (uint64_t)qword_4CC80, v71, v72, v73, v74, v75, v76, v240);
  uint64_t v77 = sub_22F00();
  *(void *)(v77 + 16) = &type metadata for GetStateOfSecuritySystems;
  *(void *)(v77 + 24) = &off_43DD0;
  sub_22EB0(v77, v78, v79, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v80 = sub_22EE0();
  if (qword_48CD0 != -1) {
    uint64_t v80 = swift_once(&qword_48CD0, sub_135DC);
  }
  sub_22EC8(v80, (uint64_t)qword_4CA00);
  sub_22F14();
  if (qword_48CD8 != -1) {
    swift_once(&qword_48CD8, sub_13628);
  }
  sub_22F08();
  sub_22E8C(v81, (uint64_t)qword_4CA18, v82, v83, v84, v85, v86, v87, v241);
  uint64_t v88 = sub_22F00();
  *(void *)(v88 + 16) = &type metadata for GetStateOfTemperature;
  *(void *)(v88 + 24) = &off_43620;
  sub_22EB0(v88, v89, v90, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v91 = sub_22EE0();
  if (qword_48C60 != -1) {
    uint64_t v91 = swift_once(&qword_48C60, sub_6B18);
  }
  sub_22EC8(v91, (uint64_t)qword_4C8A0);
  sub_22F14();
  if (qword_48C68 != -1) {
    swift_once(&qword_48C68, sub_6B64);
  }
  sub_22F08();
  sub_22E8C(v92, (uint64_t)qword_4C8B8, v93, v94, v95, v96, v97, v98, v242);
  uint64_t v99 = sub_22F00();
  *(void *)(v99 + 16) = &type metadata for GetStateOfWindows;
  *(void *)(v99 + 24) = &off_42DB8;
  sub_22EB0(v99, v100, v101, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v102 = sub_22EE0();
  if (qword_48CF0 != -1) {
    uint64_t v102 = swift_once(&qword_48CF0, sub_1A76C);
  }
  sub_22EC8(v102, (uint64_t)qword_4CA60);
  sub_22F14();
  if (qword_48CF8 != -1) {
    swift_once(&qword_48CF8, sub_1A7B8);
  }
  sub_22F08();
  sub_22E8C(v103, (uint64_t)qword_4CA78, v104, v105, v106, v107, v108, v109, v243);
  uint64_t v110 = sub_22F00();
  *(void *)(v110 + 16) = &type metadata for CreateAutomationSuggestion;
  *(void *)(v110 + 24) = &off_438C0;
  sub_22EB0(v110, v111, v112, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v113 = sub_22EE0();
  if (qword_48D10 != -1) {
    uint64_t v113 = swift_once(&qword_48D10, sub_1EA38);
  }
  sub_22EC8(v113, (uint64_t)qword_4CAC0);
  sub_22F14();
  if (qword_48D18 != -1) {
    swift_once(&qword_48D18, sub_1EA84);
  }
  sub_22F08();
  sub_22E8C(v114, (uint64_t)qword_4CAD8, v115, v116, v117, v118, v119, v120, v244);
  uint64_t v121 = sub_22F00();
  *(void *)(v121 + 16) = &type metadata for SetSceneSuggestion;
  *(void *)(v121 + 24) = &off_43A40;
  sub_22EB0(v121, v122, v123, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v124 = sub_22EE0();
  if (qword_48DE0 != -1) {
    uint64_t v124 = swift_once(&qword_48DE0, sub_28688);
  }
  sub_22EC8(v124, (uint64_t)qword_4CCC8);
  sub_22F14();
  if (qword_48DE8 != -1) {
    swift_once(&qword_48DE8, sub_286D4);
  }
  sub_22F08();
  sub_22E8C(v125, (uint64_t)qword_4CCE0, v126, v127, v128, v129, v130, v131, v245);
  uint64_t v132 = sub_22F00();
  *(void *)(v132 + 16) = &type metadata for SetTemperatureSuggestion;
  *(void *)(v132 + 24) = &off_43F50;
  sub_22EB0(v132, v133, v134, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v135 = sub_22EE0();
  if (qword_48C90 != -1) {
    uint64_t v135 = swift_once(&qword_48C90, sub_8320);
  }
  sub_22EC8(v135, (uint64_t)qword_4C930);
  sub_22F14();
  if (qword_48C98 != -1) {
    swift_once(&qword_48C98, sub_836C);
  }
  sub_22F08();
  sub_22E8C(v136, (uint64_t)qword_4C948, v137, v138, v139, v140, v141, v142, v246);
  uint64_t v143 = sub_22F00();
  *(void *)(v143 + 16) = &type metadata for OpenCloseSecureAccessoriesSuggestion;
  *(void *)(v143 + 24) = &off_430B8;
  sub_22EB0(v143, v144, v145, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v146 = sub_22EE0();
  if (qword_48DD0 != -1) {
    uint64_t v146 = swift_once(&qword_48DD0, sub_2714C);
  }
  sub_22EC8(v146, (uint64_t)qword_4CC98);
  sub_22F14();
  if (qword_48DD8 != -1) {
    swift_once(&qword_48DD8, sub_27198);
  }
  sub_22F08();
  sub_22E8C(v147, (uint64_t)qword_4CCB0, v148, v149, v150, v151, v152, v153, v247);
  uint64_t v154 = sub_22F00();
  *(void *)(v154 + 16) = &type metadata for PowerAccessoriesSuggestion;
  *(void *)(v154 + 24) = &off_43E50;
  sub_22EB0(v154, v155, v156, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v157 = sub_22EE0();
  if (qword_48CE0 != -1) {
    uint64_t v157 = swift_once(&qword_48CE0, sub_149F4);
  }
  sub_22EC8(v157, (uint64_t)qword_4CA30);
  sub_22F14();
  if (qword_48CE8 != -1) {
    swift_once(&qword_48CE8, sub_14A40);
  }
  sub_22F08();
  sub_22E8C(v158, (uint64_t)qword_4CA48, v159, v160, v161, v162, v163, v164, v248);
  uint64_t v165 = sub_22F00();
  *(void *)(v165 + 16) = &type metadata for SetBrightnessSuggestion;
  *(void *)(v165 + 24) = &off_43820;
  sub_22EB0(v165, v166, v167, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v168 = sub_22EE0();
  if (qword_48D20 != -1) {
    uint64_t v168 = swift_once(&qword_48D20, sub_1EF88);
  }
  sub_22EC8(v168, (uint64_t)qword_4CAF0);
  sub_22F14();
  if (qword_48D28 != -1) {
    swift_once(&qword_48D28, sub_1EFD4);
  }
  sub_22F08();
  sub_22E8C(v169, (uint64_t)qword_4CB08, v170, v171, v172, v173, v174, v175, v249);
  uint64_t v176 = sub_22F00();
  *(void *)(v176 + 16) = &type metadata for SetClimateModeSuggestion;
  *(void *)(v176 + 24) = &off_43AC0;
  sub_22EB0(v176, v177, v178, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v179 = sub_22EE0();
  if (qword_48CC0 != -1) {
    uint64_t v179 = swift_once(&qword_48CC0, sub_11CF4);
  }
  sub_22EC8(v179, (uint64_t)qword_4C9D0);
  sub_22F14();
  if (qword_48CC8 != -1) {
    swift_once(&qword_48CC8, sub_11D40);
  }
  sub_22F08();
  sub_22E8C(v180, (uint64_t)qword_4C9E8, v181, v182, v183, v184, v185, v186, v250);
  uint64_t v187 = sub_22F00();
  *(void *)(v187 + 16) = &type metadata for SetColorSuggestion;
  *(void *)(v187 + 24) = &off_433E0;
  sub_22EB0(v187, v188, v189, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v190 = sub_22EE0();
  if (qword_48DF0 != -1) {
    uint64_t v190 = swift_once(&qword_48DF0, sub_2DEB0);
  }
  sub_22EC8(v190, (uint64_t)qword_4CCF8);
  sub_22F14();
  if (qword_48DF8 != -1) {
    swift_once(&qword_48DF8, sub_2DEFC);
  }
  sub_22F08();
  sub_22E8C(v191, (uint64_t)qword_4CD10, v192, v193, v194, v195, v196, v197, v251);
  uint64_t v198 = sub_22F00();
  *(void *)(v198 + 16) = &type metadata for SetFanSpeedSuggestion;
  *(void *)(v198 + 24) = &off_43FD0;
  sub_22EB0(v198, v199, v200, (uint64_t)sub_22E88);
  sub_22EEC();
  sub_1A0DC();
  sub_22EF8();
  uint64_t v201 = sub_22EE0();
  if (qword_48D78 != -1) {
    uint64_t v201 = swift_once(&qword_48D78, sub_24B14);
  }
  uint64_t v202 = (void *)(v0 + 136);
  uint64_t v203 = sub_22EC8(v201, (uint64_t)qword_4CBC0);
  uint64_t v205 = v204;
  if (qword_48D80 != -1) {
    swift_once(&qword_48D80, sub_24B5C);
  }
  sub_22F08();
  sub_22E8C(v206, (uint64_t)qword_4CBD8, v207, v208, v209, v210, v211, v212, v252);
  uint64_t v213 = sub_22F00();
  *(void *)(v213 + 16) = &type metadata for GetStateSmokeSensorSuggestion;
  *(void *)(v213 + 24) = &off_43C90;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( v203,  v205,  v7,  sub_22E88,  v213);
  swift_bridgeObjectRelease();
  sub_1A0DC();
  sub_22EF8();
  sub_22EE0();
  if (qword_48C58 != -1) {
    swift_once(&qword_48C58, sub_6088);
  }
  uint64_t v214 = *(void *)(v0 + 240);
  uint64_t v215 = *(void *)(v0 + 216);
  uint64_t v216 = qword_4C898;
  *(void *)(v0 + 160) = type metadata accessor for HomeAutomationSignalExtractor();
  sub_159CC( &qword_49000,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor,  (uint64_t)&unk_2FFF8);
  *(void *)(v0 + 168) = v217;
  *(void *)(v0 + 136) = v216;
  swift_retain(v216);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.withSiriHelpSignalExtractor(_:)(v202);
  uint64_t v218 = sub_6108(v202);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()(v218);
  sub_1A0DC();
  uint64_t v219 = sub_4D88(&qword_497E0);
  uint64_t v220 = swift_allocObject(v219, 72LL, 7LL);
  *(_OWORD *)(v220 + 16) = xmmword_2FE90;
  sub_1E16C((__int128 *)(v0 + 96), v220 + 32);
  uint64_t v221 = swift_release(v4);
  uint64_t v222 = static Log.OSLogs.suggestions;
  uint64_t v223 = static Signpost.Name.createOwnerDefinition.getter(v221);
  uint64_t v225 = v224;
  uint64_t v227 = v226;
  uint64_t v228 = type metadata accessor for Signpost.Context(0LL);
  sub_22F2C(v215, v229, v230, v228);
  static Signpost.end(logging:_:_:_:)(v222, v214, v223, v225, v227, v215);
  sub_22E58(v215, &qword_493F0);
  uint64_t v231 = *(void *)(v0 + 240);
  uint64_t v232 = *(void *)(v0 + 216);
  uint64_t v233 = *(void *)(v0 + 208);
  sub_22F20(*(void *)(v0 + 232));
  swift_task_dealloc(v231);
  swift_task_dealloc(v232);
  swift_task_dealloc(v233);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v220);
}

_OWORD *sub_22958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  __int128 v39 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v6);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  *(void *)uint64_t v59 = v6;
  *(_OWORD *)&v59[8] = v39;
  sub_1595C(&v58);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v7, v6, v39);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)&v59[16];
  __int128 v40 = *(_OWORD *)v59;
  uint64_t v9 = *(void *)v59;
  sub_4D4C(&v58, *(uint64_t *)v59);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  __int128 v56 = v40;
  uint64_t v57 = v8;
  sub_1595C(v55);
  dispatch thunk of SuggestionDetailsBuilder.disabledDevices(_:)(v10, v9, v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = v57;
  __int128 v41 = v56;
  uint64_t v12 = v56;
  sub_4D4C(v55, v56);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v15 = v14;
  __int128 v53 = v41;
  uint64_t v54 = v11;
  sub_1595C(v52);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v13, v15, v12, v11);
  swift_bridgeObjectRelease();
  uint64_t v16 = v54;
  __int128 v42 = v53;
  uint64_t v17 = v53;
  sub_4D4C(v52, v53);
  if (qword_48D68 != -1) {
    swift_once(&qword_48D68, sub_21424);
  }
  uint64_t v18 = qword_4CB88;
  uint64_t v19 = unk_4CB90;
  __int128 v50 = v42;
  uint64_t v51 = v16;
  sub_1595C(v49);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)(v18, v19, v17, v16);
  uint64_t v20 = v51;
  __int128 v37 = v50;
  uint64_t v21 = v50;
  sub_4D4C(v49, v50);
  uint64_t v22 = sub_4D88(&qword_497E8);
  uint64_t v23 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v26 = (v25 + 32) & ~v25;
  uint64_t v27 = swift_allocObject(v22, v26 + *(void *)(v24 + 72), v25 | 7);
  *(_OWORD *)(v27 + 16) = xmmword_2FE90;
  uint64_t v28 = v27 + v26;
  uint64_t v29 = enum case for SiriHintsMode.spoken(_:);
  uint64_t v30 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104LL))(v28, v29, v30);
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v28, enum case for DeliveryVehicle.siriHints(_:), v23);
  __int128 v47 = v37;
  uint64_t v48 = v20;
  sub_1595C(v46);
  dispatch thunk of SuggestionDetailsBuilder.disabledDeliveryVehicles(_:)(v27, v21, v20);
  swift_bridgeObjectRelease();
  uint64_t v31 = v48;
  __int128 v38 = v47;
  uint64_t v32 = v47;
  sub_4D4C(v46, v47);
  uint64_t v33 = sub_4D88(&qword_497F0);
  uint64_t v34 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v35 = swift_allocObject( v33,  ((*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL))
        + *(void *)(*(void *)(v34 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v35 + 16) = xmmword_2FE90;
  static VersionedInvocations.HintsDawnA.getter();
  __int128 v44 = v38;
  uint64_t v45 = v31;
  sub_1595C(v43);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v35, v32, v31);
  swift_bridgeObjectRelease();
  sub_6108(v43);
  sub_6108(v46);
  sub_6108(v49);
  sub_6108(v52);
  sub_6108(v55);
  sub_6108(&v58);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 56))(&v58, a1, a2, a3);
  sub_6108((void *)a1);
  sub_7014(&v58, (_OWORD *)a1);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 64))(&v58, a1, a2, a3);
  sub_6108((void *)a1);
  return sub_7014(&v58, (_OWORD *)a1);
}

uint64_t type metadata accessor for HomeAutomationOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions36HomeAutomationOwnerDefinitionFactory);
}

uint64_t sub_22DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_497CC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_4C74;
  return sub_21678(a1, a2);
}

_OWORD *sub_22E08(uint64_t a1)
{
  return sub_22958(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4D88(&qword_49118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_22E58(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_4D88(a2);
  sub_22F20(*(void *)(v2 - 8));
  sub_15A5C();
}

uint64_t sub_22E8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = sub_4D70(v10, a2);
  return a9(v9, v11, v10);
}

uint64_t sub_22EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)(v4, v5, v6, a4, v7);
}

uint64_t sub_22EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_4D70(v2, a2);
  return HomeSuggestionType.rawValue.getter(v3);
}

uint64_t sub_22EE0()
{
  return v2(v0, v1);
}

uint64_t sub_22EEC()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_22EF8()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_22F00()
{
  return swift_task_alloc(32LL);
}

  ;
}

  ;
}

uint64_t sub_22F20@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_22F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_61AC(a1, 1LL, 1LL, a4);
}

uint64_t sub_22F38(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_22F40(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[7] = v5;
  v3[8] = sub_15A18(v5);
  uint64_t v6 = sub_4D88(&qword_49188);
  v3[9] = sub_15A18(*(void *)(v6 - 8));
  return swift_task_switch(sub_22FAC, 0LL, 0LL);
}

uint64_t sub_22FAC()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[10] = v4;
  v0[11] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[12] = ObjectType;
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return swift_task_switch(sub_23030, v8, v9);
}

uint64_t sub_23030()
{
  uint64_t v1 = *(void *)(v0 + 80);
  sub_260D8();
  char v3 = v2;
  *(void *)(v0 + 16) = v4;
  *(_BYTE *)(v0 + 24) = v2;
  swift_unknownObjectRelease(v1);
  *(_BYTE *)(v0 + 104) = v3;
  return swift_task_switch(sub_23088, 0LL, 0LL);
}

uint64_t sub_23088()
{
  if ((*(_BYTE *)(v0 + 104) & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v6 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 40);
    uint64_t v8 = *(void *)(v0 + 48);
    uint64_t v10 = sub_4D70(v8, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v10, v8);
    _StringGuts.grow(_:)(31LL);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v9 + 16);
    uint64_t v12 = *(void **)(v9 + 24);
    swift_bridgeObjectRetain(v12);
    v13._uint64_t countAndFlagsBits = v11;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    v14._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v15._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v16._uint64_t countAndFlagsBits = 0xD000000000000074LL;
    v16._object = (void *)0x8000000000035EE0LL;
    v15._object = (void *)0x8000000000035190LL;
    v14._object = (void *)0x8000000000036080LL;
    Logger.warning(output:test:file:function:line:)(v14, 0, v16, v15, 48LL);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
LABEL_7:
    uint64_t v17 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v1 = *(void *)(v0 + 16);
    uint64_t v2 = type metadata accessor for HomeAutomationEntityStateValue.Builder(0LL);
    swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
    uint64_t v3 = HomeAutomationEntityStateValue.Builder.init()();
    uint64_t v4 = v3;
    switch(v1)
    {
      case 2LL:
        uint64_t v5 = *(void *)(*(void *)(v0 + 40) + 40LL);
        goto LABEL_13;
      case 5LL:
        uint64_t v18 = *(void *)(*(void *)(v0 + 40) + 32LL);
        if (*(void *)(v18 + 16))
        {
          uint64_t v19 = *(void *)(v0 + 72);
          uint64_t v20 = HueSemantic.rawValue.getter(*(_WORD *)(v18 + 32));
          SpeakableString.init(print:speak:)(v20);
          uint64_t v21 = type metadata accessor for SpeakableString(0LL);
          sub_61AC(v19, 0LL, 1LL, v21);
          uint64_t v22 = dispatch thunk of HomeAutomationEntityStateValue.Builder.withStringValue(_:)(v19);
          swift_release(v22);
          sub_23A94(v19);
        }

        goto LABEL_15;
      case 6LL:
        uint64_t v23 = *(void *)(*(void *)(v0 + 40) + 48LL);
        if (!*(void *)(v23 + 16)) {
          goto LABEL_17;
        }
        unint64_t v24 = *(void *)(v23 + 32);
        sub_23B50();
        v25.n128_u64[0] = v24;
        uint64_t v26 = (void *)HomeAttributeValue.__allocating_init(doubleValue:unit:)(3LL, v25);
        id v27 = HomeAttributeValue.localizedValue.getter();

        type metadata accessor for HomeAutomationAbstractMeasurement(0LL);
        [v27 doubleValue];
        uint64_t v29 = HomeAutomationAbstractMeasurement.__allocating_init(value:unit:)([v27 unit], 0, v28);
        uint64_t v30 = dispatch thunk of HomeAutomationEntityStateValue.Builder.withNumericValue(_:)();
        swift_release(v30);
        swift_release(v29);

        goto LABEL_15;
      case 11LL:
        uint64_t v5 = *(void *)(*(void *)(v0 + 40) + 56LL);
LABEL_13:
        if (!*(void *)(v5 + 16))
        {
LABEL_17:
          swift_release(v3);
          goto LABEL_7;
        }

        double v31 = *(double *)(v5 + 32);
        type metadata accessor for HomeAutomationAbstractMeasurement(0LL);
        uint64_t v32 = HomeAutomationAbstractMeasurement.__allocating_init(value:unit:)(1LL, 0LL, v31);
        uint64_t v33 = dispatch thunk of HomeAutomationEntityStateValue.Builder.withNumericValue(_:)();
        swift_release(v33);
        swift_release(v32);
LABEL_15:
        uint64_t v34 = sub_4D88(&qword_48EF0);
        uint64_t v17 = (void *)swift_allocObject(v34, 64LL, 7LL);
        *((_OWORD *)v17 + 1) = xmmword_2FE90;
        uint64_t v35 = dispatch thunk of HomeAutomationEntityStateValue.Builder.build()();
        v17[7] = type metadata accessor for HomeAutomationEntityStateValue(0LL);
        v17[4] = v35;
        swift_release(v4);
        break;
      default:
        goto LABEL_15;
    }
  }

  uint64_t v36 = *(void *)(v0 + 64);
  swift_task_dealloc(*(void *)(v0 + 72));
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(void *))(v0 + 8))(v17);
}

id HomeAttributeValue.localizedValue.getter()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_4D88(&qword_497F8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_23B24();
  id v4 = [objc_allocWithZone(NSMeasurementFormatter) init];
  id v5 = [(id)objc_opt_self(NSUnitTemperature) celsius];
  unint64_t v6 = sub_23794();
  Measurement.init(value:unit:)(v5, v6, 0.0);
  NSMeasurement v31 = Measurement._bridgeToObjectiveC()();
  Class isa = v31.super.isa;
  (*(void (**)(uint64_t, uint64_t, __n128))(v3 + 8))(v0, v2, *(__n128 *)&v31._doubleValue);
  id v8 = [v4 stringFromMeasurement:isa];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  v30[0] = v9;
  v30[1] = v11;
  v29[0] = 67LL;
  v29[1] = 0xE100000000000000LL;
  unint64_t v12 = sub_237D0();
  char v13 = StringProtocol.contains<A>(_:)(v29, &type metadata for String, &type metadata for String, v12, v12);
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0) {
    uint64_t v14 = 3LL;
  }
  else {
    uint64_t v14 = 2LL;
  }
  id v15 = sub_23B18();
  uint64_t v16 = HomeAttributeUnit.rawValue.getter(v15);
  if (v16 != HomeAttributeUnit.rawValue.getter(v14)
    && ((id v17 = sub_23B18(), v18 = HomeAttributeUnit.rawValue.getter(v17), v18 == HomeAttributeUnit.rawValue.getter(3LL))
     || (v19 = sub_23B18(), uint64_t v20 = HomeAttributeUnit.rawValue.getter(v19), v20 == HomeAttributeUnit.rawValue.getter(2LL))))
  {
    sub_23B0C();
    if ((v13 & 1) != 0)
    {
      double v22 = sub_1A70C(3LL, v21);
      if (qword_48D30 != -1) {
        swift_once(&qword_48D30, sub_1FAB8);
      }
      sub_4D70(v1, (uint64_t)static Log.general);
      sub_23B3C();
      _StringGuts.grow(_:)(49LL);
      sub_23AF8((uint64_t)"Converted value: ");
      sub_23B0C();
      sub_23AD4((uint64_t)v30);
      sub_1A134(0xD00000000000001CLL, (uint64_t)" to localized unit celsius: ");
      sub_23AD4((uint64_t)v30);
      sub_23AE0( v30[0],  0xD000000000000074LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/ValueResolver.swift");
      swift_bridgeObjectRelease();
      sub_23B50();
      v23.n128_f64[0] = v22;
      uint64_t v24 = 3LL;
    }

    else
    {
      double v26 = sub_1A70C(2LL, v21);
      if (qword_48D30 != -1) {
        swift_once(&qword_48D30, sub_1FAB8);
      }
      sub_4D70(v1, (uint64_t)static Log.general);
      sub_23B3C();
      _StringGuts.grow(_:)(52LL);
      sub_23AF8((uint64_t)"Converted value: ");
      sub_23B0C();
      sub_23AD4((uint64_t)v30);
      sub_1A134(0xD00000000000001FLL, (uint64_t)" to localized unit fahrenheit: ");
      sub_23AD4((uint64_t)v30);
      sub_23AE0( v30[0],  0xD000000000000074LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/ValueResolver.swift");
      swift_bridgeObjectRelease();
      sub_23B50();
      v23.n128_f64[0] = v26;
      uint64_t v24 = 2LL;
    }

    uint64_t v27 = HomeAttributeValue.__allocating_init(doubleValue:unit:)(v24, v23);

    return (id)v27;
  }

  else
  {

    return v28;
  }

unint64_t sub_23794()
{
  unint64_t result = qword_49800;
  if (!qword_49800)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSUnit);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_49800);
  }

  return result;
}

unint64_t sub_237D0()
{
  unint64_t result = qword_49808;
  if (!qword_49808)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_49808);
  }

  return result;
}

void *sub_2380C()
{
  return v0;
}

uint64_t sub_23848()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

void *sub_23868()
{
  uint64_t v1 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_23B24();
  uint64_t v3 = (*(uint64_t (**)(void *, void, uint64_t))(v2 + 104))( v0,  enum case for SuggestionParameter.value(_:),  v1);
  uint64_t v4 = SuggestionParameter.rawValue.getter(v3);
  uint64_t v6 = v5;
  uint64_t v7 = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v0, v1);
  v0[2] = v4;
  v0[3] = v6;
  sub_2C394(v7, v8, v9, v10, v11, v12, v13, v14);
  v0[4] = &off_41EB8;
  sub_23B58(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)&off_41EE8);
  v0[5] = &off_41EB8;
  sub_23B58(v23, v24, v25, v26, v27, v28, v29, v30, (uint64_t)&off_41F20);
  v0[6] = &off_41EB8;
  sub_23B58(v31, v32, v33, v34, v35, v36, v37, v38, (uint64_t)&off_41F58);
  v0[7] = &off_41EB8;
  return v0;
}

uint64_t sub_2395C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_498EC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_22F40((uint64_t)v4, a2);
}

uint64_t sub_239AC(Swift::Int a1)
{
  if (a1 < 16) {
    return 0LL;
  }
  _StringGuts.grow(_:)(a1);
  return 0LL;
}

uint64_t type metadata accessor for ValueResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions13ValueResolver);
}

uint64_t sub_23A10()
{
  return sub_23A58((unint64_t *)&unk_498D0, (uint64_t)&unk_318AC);
}

uint64_t sub_23A34()
{
  return sub_23A58(&qword_498E0, (uint64_t)&unk_318D4);
}

uint64_t sub_23A58(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for ValueResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_23A94(uint64_t a1)
{
  uint64_t v2 = sub_4D88(&qword_49188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_23AD4(uint64_t a1)
{
  return Double.write<A>(to:)(a1, v1, v2);
}

void sub_23AE0(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  unint64_t v4 = (a3 - 32) | 0x8000000000000000LL;
  uint64_t v5 = v3;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

void sub_23AF8(uint64_t a1@<X8>)
{
  v1._object = (void *)((a1 - 32) | 0x8000000000000000LL);
  v1._uint64_t countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v1);
}

id sub_23B0C()
{
  return [*(id *)(v1 - 104) *(SEL *)(v0 + 3064)];
}

id sub_23B18()
{
  return [*(id *)(v1 - 104) *(SEL *)(v0 + 3048)];
}

  ;
}

void sub_23B3C()
{
  *(void *)(v0 - 80) = 0LL;
  *(void *)(v0 - 72) = 0xE000000000000000LL;
}

uint64_t sub_23B50()
{
  return type metadata accessor for HomeAttributeValue(0LL);
}

void sub_23B58( uint64_t isUniquelyReferenced_nonNull_native@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)(v9 - 56) = a9;
  sub_2C288(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_23B60(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[6] = swift_task_alloc(v6);
  v3[7] = swift_task_alloc(v6);
  return swift_task_switch(sub_23BD0, 0LL, 0LL);
}

uint64_t sub_23BD0()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[8] = v4;
  v0[9] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[10] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_135CC();
}

uint64_t sub_23C48()
{
  uint64_t v1 = v0[8];
  sub_2625C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  swift_unknownObjectRelease(v1);
  v0[11] = v3;
  v0[12] = v5;
  return sub_135CC();
}

uint64_t sub_23C98()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = sub_4D70(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease();
    v29._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v29._object = (void *)0x8000000000032910LL;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain(v9);
    v10._uint64_t countAndFlagsBits = v8;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = 544175136LL;
    v11._object = (void *)0xE400000000000000LL;
    String.append(_:)(v11);
    swift_bridgeObjectRetain(v1);
    v12._uint64_t countAndFlagsBits = v2;
    v12._object = v1;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v14._object = (void *)0x80000000000360E0LL;
    v13._object = (void *)0x8000000000032910LL;
    v14._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v13, 0, v14);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v15 = sub_4D88(&qword_48EF0);
    uint64_t v16 = (void *)swift_allocObject(v15, 64LL, 7LL);
    *((_OWORD *)v16 + 1) = xmmword_2FE90;
    v16[7] = &type metadata for String;
    v16[4] = v2;
    v16[5] = v1;
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v18 = *(void *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v20 = *(void *)(v0 + 24);
    uint64_t v19 = *(void *)(v0 + 32);
    uint64_t v21 = sub_4D70(v19, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v21, v19);
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease();
    strcpy((char *)&v29, "Couldn't find ");
    HIBYTE(v29._object) = -18;
    uint64_t v22 = *(void *)(v20 + 16);
    uint64_t v23 = *(void **)(v20 + 24);
    swift_bridgeObjectRetain(v23);
    v24._uint64_t countAndFlagsBits = v22;
    v24._object = v23;
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v26._object = (void *)0x80000000000360E0LL;
    v25._object = (void *)0x8000000000035190LL;
    v26._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.warning(output:test:file:function:line:)(v29, 0, v26, v25, 18LL);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v16 = _swiftEmptyArrayStorage;
  }

  uint64_t v27 = *(void *)(v0 + 48);
  swift_task_dealloc(*(void *)(v0 + 56));
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void *))(v0 + 8))(v16);
}

uint64_t type metadata accessor for AccessoryNameResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions21AccessoryNameResolver);
}

uint64_t sub_23FA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.accessoryName(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_24050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_499AC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_23B60((uint64_t)v4, a2);
}

uint64_t sub_240A0()
{
  return sub_240E8((unint64_t *)&unk_49990, (uint64_t)&unk_31968);
}

uint64_t sub_240C4()
{
  return sub_240E8(&qword_499A0, (uint64_t)&unk_31990);
}

uint64_t sub_240E8(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AccessoryNameResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_24124(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[12] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[13] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[14] = swift_task_alloc(v6);
  v3[15] = swift_task_alloc(v6);
  return sub_4DC8();
}

uint64_t sub_2418C()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[16] = v4;
  v0[17] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[18] = ObjectType;
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return swift_task_switch(sub_24210, v8, v9);
}

uint64_t sub_24210()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_25B08();
  char v3 = v2;
  *(void *)(v0 + 64) = v4;
  *(_BYTE *)(v0 + 72) = v2;
  swift_unknownObjectRelease(v1);
  *(_BYTE *)(v0 + 200) = v3;
  return swift_task_switch(sub_24268, 0LL, 0LL);
}

uint64_t sub_24268()
{
  if ((*(_BYTE *)(v0 + 200) & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v11 = *(void *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 96);
    uint64_t v12 = sub_4D70(v10, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v12, v10);
    _StringGuts.grow(_:)(33LL);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v11 + 16);
    Swift::String v14 = *(void **)(v11 + 24);
    swift_bridgeObjectRetain(v14);
    v15._uint64_t countAndFlagsBits = v13;
    v15._object = v14;
    String.append(_:)(v15);
    sub_15A64();
    v16._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    v17._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v18._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    v18._object = (void *)0x80000000000361D0LL;
    v17._object = (void *)0x8000000000035190LL;
    v16._object = (void *)0x80000000000361B0LL;
    Logger.warning(output:test:file:function:line:)(v16, 0, v18, v17, 19LL);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v19 = *(void *)(v0 + 112);
    swift_task_dealloc(*(void *)(v0 + 120));
    swift_task_dealloc(v19);
    return sub_1BD3C((uint64_t)_swiftEmptyArrayStorage, *(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    uint64_t v1 = *(void *)(v0 + 64);
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v2 + 16);
    *(void *)(v0 + 152) = v3;
    uint64_t v4 = *(void **)(v2 + 24);
    *(void *)(v0 + 160) = v4;
    uint64_t v5 = type metadata accessor for SuggestionEntityRetrieval();
    *(void *)(v0 + 168) = swift_initStackObject(v5);
    swift_bridgeObjectRetain(v4);
    *(void *)(v0 + 176) = sub_28D90(v3, v4);
    uint64_t v6 = (void *)swift_task_alloc(dword_49D4C);
    *(void *)(v0 + 184) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24454;
    return sub_2AFD0(v1);
  }

uint64_t sub_24454(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 176LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 184LL);
  *(void *)(*(void *)v1 + 192LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return sub_4DC8();
}

uint64_t sub_244B0()
{
  uint64_t v1 = *(void *)(v0 + 192);
  if (*(void *)(v1 + 16) < 2uLL)
  {
    swift_bridgeObjectRelease();
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    sub_4D70(*(void *)(v0 + 96), (uint64_t)static Log.suggestions);
    v15._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v15._object = (void *)0x8000000000036250LL;
    v16._object = (void *)0x80000000000361D0LL;
    v16._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v15, 0, v16);
    Swift::String v14 = _swiftEmptyArrayStorage;
  }

  else
  {
    if (qword_48D38 != -1)
    {
      swift_once(&qword_48D38, sub_1FB8C);
      uint64_t v1 = *(void *)(v0 + 192);
    }

    uint64_t v3 = *(void *)(v0 + 152);
    uint64_t v2 = *(void **)(v0 + 160);
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 104);
    uint64_t v7 = sub_4D70(v5, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain(v2);
    v8._uint64_t countAndFlagsBits = v3;
    v8._object = v2;
    String.append(_:)(v8);
    sub_15A64();
    v9._uint64_t countAndFlagsBits = 544175136LL;
    v9._object = (void *)0xE400000000000000LL;
    String.append(_:)(v9);
    v10._uint64_t countAndFlagsBits = Array.description.getter(v1, &type metadata for String);
    String.append(_:)(v10);
    sub_15A64();
    v11._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v12._object = (void *)0x80000000000361D0LL;
    v11._object = (void *)0x8000000000032910LL;
    v12._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v11, 0, v12);
    sub_15A64();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v13 = sub_4D88(&qword_48EF0);
    Swift::String v14 = (void *)swift_allocObject(v13, 64LL, 7LL);
    *((_OWORD *)v14 + 1) = xmmword_2FE90;
    v14[7] = sub_4D88(&qword_49A70);
    v14[4] = v1;
  }

  uint64_t v17 = *(void *)(v0 + 112);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v17);
  return sub_1BD3C((uint64_t)v14, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for SameTypeMultipleRoomsResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions29SameTypeMultipleRoomsResolver);
}

uint64_t sub_2471C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.sameTypeMultipleRooms(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_247C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_49A6C);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_24124((uint64_t)v4, a2);
}

uint64_t sub_24814()
{
  return sub_2485C((unint64_t *)&unk_49A50, (uint64_t)&unk_31A20);
}

uint64_t sub_24838()
{
  return sub_2485C(&qword_49A60, (uint64_t)&unk_31A48);
}

uint64_t sub_2485C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for SameTypeMultipleRoomsResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_24898()
{
  return sub_24A3C(&qword_48C60, (uint64_t)qword_4C8A0, (uint64_t)sub_6B18);
}

uint64_t sub_248B4()
{
  return sub_24A3C(&qword_48C70, (uint64_t)qword_4C8D0, (uint64_t)sub_7C5C);
}

uint64_t sub_248D0()
{
  return sub_24A3C(&qword_48C80, (uint64_t)qword_4C900, (uint64_t)sub_7D14);
}

uint64_t sub_248EC()
{
  return sub_24A3C(&qword_48C90, (uint64_t)qword_4C930, (uint64_t)sub_8320);
}

uint64_t sub_24908()
{
  return sub_24A3C(&qword_48CA0, (uint64_t)qword_4C960, (uint64_t)sub_8C04);
}

uint64_t sub_24924()
{
  return sub_24A3C(&qword_48CB0, (uint64_t)qword_4C990, (uint64_t)sub_8CBC);
}

uint64_t sub_24940()
{
  return sub_24A3C(&qword_48CC0, (uint64_t)qword_4C9D0, (uint64_t)sub_11CF4);
}

uint64_t sub_2495C()
{
  return sub_24A3C(&qword_48CD0, (uint64_t)qword_4CA00, (uint64_t)sub_135DC);
}

uint64_t sub_24978()
{
  return sub_24A3C(&qword_48CF0, (uint64_t)qword_4CA60, (uint64_t)sub_1A76C);
}

uint64_t sub_24994()
{
  return sub_24A3C(&qword_48D00, (uint64_t)qword_4CA90, (uint64_t)sub_1E310);
}

uint64_t sub_249B0()
{
  return sub_24A3C(&qword_48D10, (uint64_t)qword_4CAC0, (uint64_t)sub_1EA38);
}

uint64_t sub_249CC()
{
  return sub_24A3C(&qword_48D20, (uint64_t)qword_4CAF0, (uint64_t)sub_1EF88);
}

uint64_t sub_249E8()
{
  return sub_24A3C(&qword_48DB0, (uint64_t)qword_4CC38, (uint64_t)sub_2683C);
}

uint64_t sub_24A04()
{
  return sub_24A3C(&qword_48DC0, (uint64_t)qword_4CC68, (uint64_t)sub_27094);
}

uint64_t sub_24A20()
{
  return sub_24A3C(&qword_48DD0, (uint64_t)qword_4CC98, (uint64_t)sub_2714C);
}

uint64_t sub_24A3C(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = sub_1A6DC();
  uint64_t v7 = sub_4D70(v6, a2);
  HomeSuggestionType.rawValue.getter(v7);
  Swift::String v8 = String.capitalizeFirstLetter()();
  swift_bridgeObjectRelease();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  return 0x67677553656D6F48LL;
}

uint64_t sub_24B14()
{
  uint64_t v0 = sub_1A6DC();
  sub_6BC0(v0, qword_4CBC0);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateSmokeSensor(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_24B5C()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CBD8);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24A3C(&qword_48D78, (uint64_t)qword_4CBC0, (uint64_t)sub_24B14);
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_24BD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48D78 != -1) {
    swift_once(&qword_48D78, sub_24B14);
  }
  uint64_t v4 = sub_1A6DC();
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CBC0);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject(v9, 40LL, 7LL);
  Swift::String v10 = sub_15E34(v6, v8);
  v13[3] = v9;
  v13[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_24D00@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&__int128 v40 = a1;
  __int128 v41 = a2;
  uint64_t v39 = sub_4D88(&qword_49048);
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = *(void *)(v9 + 72);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 32) & ~v11;
  uint64_t v13 = swift_allocObject(v7, v12 + v10, v11 | 7);
  *(_OWORD *)(v13 + 16) = xmmword_2FE90;
  uint64_t v14 = v13 + v12;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))( v6,  enum case for SuggestionParameter.accessoryType(_:),  v3);
  uint64_t v15 = type metadata accessor for AccessoryTypeResolver();
  swift_allocObject(v15, 32LL, 7LL);
  uint64_t v16 = sub_284F0();
  uint64_t v17 = (uint64_t *)(v14 + v8[5]);
  v17[3] = v15;
  v17[4] = sub_825C( &qword_490B8,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryTypeResolver,  (uint64_t)&unk_31D58);
  *uint64_t v17 = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v14, v6, v3);
  *(_BYTE *)(v14 + v8[6]) = 1;
  *(_BYTE *)(v14 + v8[7]) = 0;
  uint64_t v18 = sub_4D88(&qword_49060);
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v18);
  sub_6F90(v40, (uint64_t)&v46);
  LODWORD(v15) = *(unsigned __int8 *)(v14 + v8[7]);
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v19 = swift_bridgeObjectRetain(v13);
  uint64_t v20 = SuggestionParameter.rawValue.getter(v19);
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  uint64_t v24 = v8[6];
  uint64_t v25 = *(unsigned __int8 *)(v14 + v24);
  if ((_DWORD)v15 == 1)
  {
    Swift::String v26 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v38, v14 + v8[8], v39);
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v22, v23, v25, v26);
  }

  else
  {
    uint64_t v27 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v20, v21, *(unsigned __int8 *)(v14 + v24));
  }

  uint64_t v28 = v27;
  uint64_t v29 = v48;
  __int128 v40 = v47;
  uint64_t v30 = v47;
  uint64_t v31 = sub_4D4C(&v46, v47);
  uint64_t v32 = SuggestionParameter.rawValue.getter(v31);
  uint64_t v34 = v33;
  sub_60C4(v14 + v8[5], (uint64_t)v42);
  __int128 v44 = v40;
  uint64_t v45 = v29;
  sub_6128(v43);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v34, v42, v28, v30, v29);
  swift_release(v28);
  swift_bridgeObjectRelease();
  sub_6FD4((uint64_t)v42);
  sub_6108(v43);
  swift_bridgeObjectRelease();
  sub_7014(&v46, v41);
  swift_setDeallocating(v13);
  return sub_1E9F4();
}

ValueMetadata *type metadata accessor for GetStateSmokeSensorSuggestion()
{
  return &type metadata for GetStateSmokeSensorSuggestion;
}

void sub_25074()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v0 = qword_4CBF0;
  sub_26674();
  sub_26700();
  uint64_t v1 = sub_26728();
  sub_2667C(v1, 0xD00000000000001CLL, v2);
  sub_266B8();
  if (v3) {
    uint64_t v4 = sub_265D0((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Any);
  }
  else {
    uint64_t v4 = sub_26708();
  }
  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  sub_26744();
  sub_266F8();
  sub_2679C((uint64_t)"Retrieved hasTargetedMoreThanOneEntity: ");
  uint64_t v5 = sub_4D88(&qword_49A78);
  v6._uint64_t countAndFlagsBits = sub_26688(v5);
  String.append(_:)(v6);
  sub_1A15C();
  sub_26694(v0, v8, v7, 0xD000000000000073LL, 0x80000000000362C0LL);
  sub_1A15C();
  sub_26638();
  sub_266D0();
}

void sub_251E0()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v1 = sub_26674();
  sub_26830(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_48DA8;
  sub_26700();
  if (v2 != -1) {
    swift_once(&qword_48DA8, sub_2653C);
  }
  sub_2665C(&qword_4CC28);
  sub_266B8();
  if (v3)
  {
    sub_265D0((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any);
    sub_2678C();
  }

  else
  {
    uint64_t v4 = sub_26708();
  }

  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  _StringGuts.grow(_:)(27LL);
  sub_266F8();
  sub_266A0((uint64_t)"Retrieved containerName: ");
  uint64_t v5 = sub_4D88(&qword_48FE0);
  v6._uint64_t countAndFlagsBits = sub_26688(v5);
  sub_2676C(v6);
  sub_15A64();
  sub_2660C( 0LL,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_15A64();
  sub_26638();
  sub_267C8();
  sub_266D0();
}

void sub_2535C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_265E4();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_26774();
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v7 = sub_4D70(v5, (uint64_t)static Log.suggestions);
  sub_2680C(v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  sub_26758();
  uint64_t v8 = swift_bridgeObjectRelease();
  v41[0] = 0xD00000000000001DLL;
  v41[1] = 0x80000000000363A0LL;
  v14._uint64_t countAndFlagsBits = dispatch thunk of Entity.description.getter(v8, v9, v10, v11, v12, v13);
  String.append(_:)(v14);
  sub_1A488();
  sub_26710( 0xD00000000000001DLL,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_1A488();
  sub_26800(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v15 = qword_4CBF0;
  uint64_t v16 = sub_26674();
  uint64_t v42 = v16;
  uint64_t v43 = &protocol witness table for DefaultOwner;
  v41[0] = v15;
  uint64_t v17 = qword_48D98;
  uint64_t v18 = swift_retain(v15);
  if (v17 != -1) {
    uint64_t v18 = swift_once(&qword_48D98, sub_264DC);
  }
  __int128 v40 = &type metadata for String;
  uint64_t v38 = Entity.name.getter(v18);
  uint64_t v39 = v19;
  uint64_t v20 = sub_267EC();
  Context.setParam(for:key:value:)(v20, v21, v22, v23, v3, a3);
  sub_6108(&v38);
  sub_6108(v41);
  uint64_t v42 = v16;
  uint64_t v43 = &protocol witness table for DefaultOwner;
  v41[0] = qword_4CBF0;
  uint64_t v24 = qword_48DA0;
  swift_retain(qword_4CBF0);
  if (v24 != -1) {
    swift_once(&qword_48DA0, sub_2650C);
  }
  __int128 v40 = (void *)sub_4D88(&qword_48FE0);
  uint64_t v25 = dispatch thunk of Entity.room.getter();
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = Entity.name.getter(v25);
    uint64_t v29 = v28;
    swift_release(v26);
  }

  else
  {
    uint64_t v27 = 0LL;
    uint64_t v29 = 0LL;
  }

  uint64_t v38 = v27;
  uint64_t v39 = v29;
  uint64_t v30 = sub_267EC();
  sub_26818(v30, v31, v32, v33, v3);
  sub_6108(&v38);
  sub_6108(v41);
  uint64_t v42 = v16;
  uint64_t v43 = &protocol witness table for DefaultOwner;
  v41[0] = qword_4CBF0;
  uint64_t v34 = qword_48D90;
  swift_retain(qword_4CBF0);
  if (v34 != -1) {
    swift_once(&qword_48D90, sub_264AC);
  }
  uint64_t v35 = qword_4CBF8;
  uint64_t v36 = unk_4CC00;
  uint64_t v37 = dispatch thunk of Accessory.type.getter();
  __int128 v40 = &type metadata for HomeDeviceType;
  uint64_t v38 = v37;
  sub_26818((uint64_t)v41, v35, v36, (uint64_t)&v38, v3);
  sub_6108(&v38);
  sub_6108(v41);
  sub_21084();
}

void sub_25660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_265E4();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_26774();
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v8 = sub_4D70(v6, (uint64_t)static Log.suggestions);
  sub_2680C(v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  sub_26758();
  swift_bridgeObjectRelease(v15);
  unint64_t v14 = 0xD00000000000001DLL;
  unint64_t v15 = 0x8000000000036360LL;
  v9._uint64_t countAndFlagsBits = HomeAttributeType.description.getter(v4);
  String.append(_:)(v9);
  sub_1A488();
  sub_26710( 0xD00000000000001DLL,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_1A488();
  sub_26800(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  uint64_t v10 = HomeAttributeType.rawValue.getter(v4);
  uint64_t v11 = HomeAttributeType.rawValue.getter(4LL);
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  if (v10 == v11) {
    uint64_t v4 = 5LL;
  }
  uint64_t v12 = qword_4CBF0;
  uint64_t v16 = sub_26674();
  uint64_t v17 = &protocol witness table for DefaultOwner;
  unint64_t v14 = v12;
  v13[3] = &type metadata for HomeAttributeType;
  v13[0] = v4;
  swift_retain(v12);
  Context.setParam(for:key:value:)(&v14, 0xD000000000000012LL, 0x8000000000036380LL, v13, v3, a3);
  sub_6108(v13);
  sub_6108(&v14);
  sub_21084();
}

void sub_25820()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v1 = sub_26674();
  sub_26830(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_48DA0;
  sub_26700();
  if (v2 != -1) {
    swift_once(&qword_48DA0, sub_2650C);
  }
  sub_2665C(&qword_4CC18);
  sub_266B8();
  if (v3)
  {
    sub_265D0((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any);
    sub_2678C();
  }

  else
  {
    uint64_t v4 = sub_26708();
  }

  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  sub_266E4();
  sub_266F8();
  sub_266A0((uint64_t)"Retrieved accessory room: ");
  uint64_t v5 = sub_4D88(&qword_48FE0);
  v7._uint64_t countAndFlagsBits = sub_26688(v5);
  sub_2676C(v7);
  sub_15A64();
  sub_2660C( v6,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_15A64();
  sub_26638();
  sub_267C8();
  sub_266D0();
}

void sub_2598C()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  sub_26674();
  sub_26700();
  uint64_t v1 = sub_26728();
  sub_2667C(v1, 0xD00000000000001DLL, v2);
  sub_266B8();
  if (v3) {
    uint64_t v4 = sub_265D0((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Any);
  }
  else {
    uint64_t v4 = sub_26708();
  }
  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  _StringGuts.grow(_:)(43LL);
  sub_266F8();
  sub_2679C((uint64_t)"Retrieved isSingleAccessoryOfTypeInHome: ");
  uint64_t v5 = sub_4D88(&qword_49A78);
  v6._uint64_t countAndFlagsBits = sub_26688(v5);
  String.append(_:)(v6);
  sub_1A15C();
  sub_26694(0LL, 0xE000000000000000LL, v7, 0xD000000000000073LL, 0x80000000000362C0LL);
  sub_1A15C();
  sub_26638();
  sub_266D0();
}

void sub_25B08()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v1 = sub_26674();
  sub_26830(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_48D90;
  sub_26700();
  if (v2 != -1) {
    swift_once(&qword_48D90, sub_264AC);
  }
  sub_2665C(&qword_4CBF8);
  sub_266B8();
  if (v3)
  {
    uint64_t v4 = sub_265D0((uint64_t)&type metadata for HomeDeviceType, (uint64_t)&type metadata for Any);
    if ((_DWORD)v4)
    {
      char v5 = 0;
      uint64_t v6 = v8;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v4 = sub_26708();
  }

  uint64_t v6 = 0LL;
  char v5 = 1;
LABEL_10:
  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  sub_266E4();
  sub_266F8();
  if ((v5 & 1) == 0) {
    HomeDeviceType.rawValue.getter(v6);
  }
  uint64_t v7 = sub_4D88(&qword_49A88);
  v9._uint64_t countAndFlagsBits = sub_26688(v7);
  sub_2676C(v9);
  sub_15A64();
  sub_2660C( 0xD00000000000001ALL,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_15A64();
  sub_26638();
  sub_266D0();
}

uint64_t sub_25CA0( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, char a12, uint64_t a13, uint64_t a14)
{
  uint64_t v19 = &HasTargetedMoreThanOneEntityResolver;
  if ((a2 & 1) == 0)
  {
    if (qword_48D88 != -1) {
      swift_once(&qword_48D88, sub_263C8);
    }
    uint64_t v14 = qword_4CBF0;
    sub_26674();
    sub_267BC();
    uint64_t v21 = qword_48D90;
    uint64_t v22 = sub_2673C();
    if (v21 != -1) {
      uint64_t v22 = swift_once(&qword_48D90, sub_264AC);
    }
    uint64_t v85 = &type metadata for HomeDeviceType;
    uint64_t v83 = a1;
    sub_26624(v22, qword_4CBF8, unk_4CC00, v23, v24, v25);
    sub_6108(&v83);
    sub_6108(v86);
    uint64_t v19 = &HasTargetedMoreThanOneEntityResolver;
  }

  if (a4)
  {
    uint64_t v26 = qword_48D88;
    swift_bridgeObjectRetain(a4);
    if (v26 != -1) {
      swift_once(&qword_48D88, sub_263C8);
    }
    uint64_t v14 = qword_4CBF0;
    sub_26674();
    sub_267BC();
    uint64_t v27 = qword_48D98;
    uint64_t v28 = sub_2673C();
    if (v27 != -1) {
      uint64_t v28 = swift_once(&qword_48D98, sub_264DC);
    }
    uint64_t v85 = &type metadata for String;
    uint64_t v83 = a3;
    uint64_t v84 = a4;
    sub_26624(v28, qword_4CC08, unk_4CC10, v29, v30, v31);
    sub_6108(&v83);
    sub_6108(v86);
    uint64_t v19 = &HasTargetedMoreThanOneEntityResolver;
  }

  if (a6)
  {
    sub_26824();
    if (v14 != -1) {
      swift_once(&qword_48D88, sub_263C8);
    }
    uint64_t v14 = qword_4CBF0;
    sub_26674();
    sub_267BC();
    uint64_t v32 = qword_48DA0;
    uint64_t v33 = sub_2673C();
    if (v32 != -1) {
      uint64_t v33 = swift_once(&qword_48DA0, sub_2650C);
    }
    uint64_t v85 = &type metadata for String;
    uint64_t v83 = a5;
    uint64_t v84 = a6;
    sub_26624(v33, qword_4CC18, unk_4CC20, v34, v35, v36);
    sub_6108(&v83);
    sub_6108(v86);
    uint64_t v19 = &HasTargetedMoreThanOneEntityResolver;
  }

  if ((a8 & 1) == 0)
  {
    if (*(void *)&v19[48].ivar_base_size != -1LL) {
      swift_once(&qword_48D88, sub_263C8);
    }
    uint64_t v14 = qword_4CBF0;
    sub_26674();
    sub_267BC();
    uint64_t v85 = &type metadata for HomeAttributeType;
    uint64_t v83 = a7;
    sub_2673C();
    Context.setParam(for:key:value:)(v86, 0xD000000000000012LL, 0x8000000000036380LL, &v83, a13, a14);
    uint64_t v37 = sub_6108(&v83);
    sub_267B4(v37, v38, v39, v40, v41, v42, v43);
  }

  if (a10)
  {
    sub_26824();
    if (v14 != -1) {
      swift_once(&qword_48D88, sub_263C8);
    }
    sub_26674();
    sub_267BC();
    uint64_t v44 = qword_48DA8;
    uint64_t v45 = sub_2673C();
    if (v44 != -1) {
      uint64_t v45 = swift_once(&qword_48DA8, sub_2653C);
    }
    uint64_t v85 = &type metadata for String;
    uint64_t v83 = a9;
    uint64_t v84 = a10;
    sub_26624(v45, qword_4CC28, unk_4CC30, v46, v47, v48);
    uint64_t v49 = sub_6108(&v83);
    sub_267B4(v49, v50, v51, v52, v53, v54, v55);
  }

  if (*(void *)&v19[48].ivar_base_size != -1LL) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v56 = qword_4CBF0;
  uint64_t v57 = sub_26674();
  uint64_t v87 = v57;
  uint64_t v88 = &protocol witness table for DefaultOwner;
  v86[0] = v56;
  uint64_t v85 = &type metadata for Bool;
  LOBYTE(v83) = a11 & 1;
  uint64_t v58 = sub_2673C();
  sub_26624(v58, 0xD00000000000001CLL, 0x8000000000036270LL, v59, v60, v61);
  uint64_t v62 = sub_6108(&v83);
  sub_267B4(v62, v63, v64, v65, v66, v67, v68);
  uint64_t v87 = v57;
  uint64_t v88 = &protocol witness table for DefaultOwner;
  uint64_t v85 = &type metadata for Bool;
  v86[0] = qword_4CBF0;
  LOBYTE(v83) = a12 & 1;
  uint64_t v69 = swift_retain(qword_4CBF0);
  sub_26624(v69, 0xD00000000000001DLL, 0x8000000000036400LL, v70, v71, v72);
  uint64_t v73 = sub_6108(&v83);
  return sub_267B4(v73, v74, v75, v76, v77, v78, v79);
}

void sub_260D8()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v1 = qword_4CBF0;
  sub_26674();
  sub_26700();
  uint64_t v2 = sub_26728();
  sub_2667C(v2, 0xD000000000000012LL, v3);
  sub_266B8();
  if (v4)
  {
    uint64_t v5 = sub_265D0((uint64_t)&type metadata for HomeAttributeType, (uint64_t)&type metadata for Any);
    if ((_DWORD)v5)
    {
      char v6 = 0;
      uint64_t v7 = v1;
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v5 = sub_26708();
  }

  uint64_t v7 = 0LL;
  char v6 = 1;
LABEL_8:
  if (qword_48D38 != -1) {
    uint64_t v5 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v5, (uint64_t)static Log.suggestions);
  sub_26744();
  sub_266F8();
  if ((v6 & 1) == 0) {
    HomeAttributeType.rawValue.getter(v7);
  }
  uint64_t v8 = sub_4D88(&qword_49A88);
  v9._uint64_t countAndFlagsBits = sub_26688(v8);
  sub_2676C(v9);
  sub_15A64();
  sub_2660C( 0xD000000000000028LL,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_15A64();
  sub_26638();
  sub_266D0();
}

void sub_2625C()
{
  if (qword_48D88 != -1) {
    swift_once(&qword_48D88, sub_263C8);
  }
  uint64_t v1 = sub_26674();
  sub_26830(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_48D98;
  sub_26700();
  if (v2 != -1) {
    swift_once(&qword_48D98, sub_264DC);
  }
  sub_2665C(&qword_4CC08);
  sub_266B8();
  if (v3)
  {
    sub_265D0((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any);
    sub_2678C();
  }

  else
  {
    uint64_t v4 = sub_26708();
  }

  if (qword_48D38 != -1) {
    uint64_t v4 = swift_once(&qword_48D38, sub_1FB8C);
  }
  sub_265AC(v4, (uint64_t)static Log.suggestions);
  sub_266E4();
  sub_266F8();
  sub_266A0((uint64_t)"Retrieved accessory name: ");
  uint64_t v5 = sub_4D88(&qword_48FE0);
  v7._uint64_t countAndFlagsBits = sub_26688(v5);
  sub_2676C(v7);
  sub_15A64();
  sub_2660C( v6,  0xD000000000000073LL,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  sub_15A64();
  sub_26638();
  sub_267C8();
  sub_266D0();
}

uint64_t sub_263C8()
{
  uint64_t v0 = type metadata accessor for CoreSuggestionGroups(0LL);
  v4[3] = v0;
  v4[4] = sub_2656C();
  uint64_t v1 = sub_6128(v4);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  enum case for CoreSuggestionGroups.domain(_:),  v0);
  uint64_t v2 = type metadata accessor for DefaultOwner(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t result = DefaultOwner.init(group:identifier:)(v4, 0x6F747541656D6F48LL, 0xEE006E6F6974616DLL);
  qword_4CBF0 = result;
  return result;
}

uint64_t sub_2646C(uint64_t a1)
{
  uint64_t v2 = sub_4D88(&qword_49060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_264AC()
{
  unk_4CC06 = -4864;
}

void sub_264DC()
{
  unk_4CC16 = -4864;
}

void sub_2650C()
{
  unk_4CC26 = -4864;
}

void sub_2653C()
{
  unk_4CC36 = -4864;
}

unint64_t sub_2656C()
{
  unint64_t result = qword_49A80;
  if (!qword_49A80)
  {
    uint64_t v1 = type metadata accessor for CoreSuggestionGroups(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CoreSuggestionGroups, v1);
    atomic_store(result, (unint64_t *)&qword_49A80);
  }

  return result;
}

uint64_t sub_265AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_4D70(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t sub_265D0@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return swift_dynamicCast(v2 - 136, v2 - 96, a2 + 8, a1, 6LL);
}

uint64_t sub_265E4()
{
  return type metadata accessor for Logger(0LL);
}

  ;
}

void sub_2660C(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  unint64_t v4 = (a3 - 32) | 0x8000000000000000LL;
  uint64_t v5 = v3;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_26624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  return Context.setParam(for:key:value:)(va1, a2, a3, (uint64_t *)va, v7, v6);
}

uint64_t sub_26638()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

  ;
}

uint64_t sub_2665C@<X0>(void *a1@<X8>)
{
  return Context.getParam(for:key:)(v3 - 136, *a1, a1[1], v2, v1);
}

uint64_t sub_26674()
{
  return type metadata accessor for DefaultOwner(0LL);
}

uint64_t sub_2667C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Context.getParam(for:key:)(a1, a2, a3, v4, v3);
}

uint64_t sub_26688(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 96, a1);
}

void sub_26694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_266A0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v4 - 136) = v3;
  *(void *)(v4 - 128) = (a1 - 32) | 0x8000000000000000LL;
  *(void *)(v4 - 96) = v1;
  *(void *)(v4 - 88) = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_266B8()
{
  return sub_6108((void *)(v0 - 136));
}

  ;
}

void sub_266E4()
{
  *(void *)(v0 - 136) = 0LL;
  *(void *)(v0 - 128) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(28LL);
}

uint64_t sub_266F8()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 128));
}

uint64_t sub_26700()
{
  return swift_retain(v0);
}

uint64_t sub_26708()
{
  return sub_2646C(v0 - 96);
}

void sub_26710(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  unint64_t v4 = (a3 - 32) | 0x8000000000000000LL;
  uint64_t v5 = v3;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_26728()
{
  return v0 - 136;
}

uint64_t sub_2673C()
{
  return swift_retain(v0);
}

void sub_26744()
{
  *(void *)(v0 - 136) = 0LL;
  *(void *)(v0 - 128) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(42LL);
}

void sub_26758()
{
  *(void *)(v0 - 120) = 0LL;
  *(void *)(v0 - 112) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(31LL);
}

void sub_2676C(Swift::String a1)
{
}

  ;
}

  ;
}

void sub_2679C(uint64_t a1@<X8>)
{
  *(void *)(v3 - 136) = v2 + 12;
  *(void *)(v3 - 128) = (a1 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(v3 - 96) = v1;
}

uint64_t sub_267B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return sub_6108((uint64_t *)va);
}

  ;
}

uint64_t sub_267C8()
{
  return v0;
}

  ;
}

uint64_t sub_267EC()
{
  return v0 - 120;
}

uint64_t sub_26800@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_2680C@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

uint64_t sub_26818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Context.setParam(for:key:value:)(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_26824()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_26830@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 112) = result;
  *(void *)(v3 - 104) = a2;
  *(void *)(v3 - 136) = v2;
  return result;
}

uint64_t sub_2683C()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CC38);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfDoorLocks(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_26888()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CC50);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_249E8();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfDoorLocks()
{
  return &type metadata for GetStateOfDoorLocks;
}

uint64_t sub_268F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[6] = a2;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = sub_11C5C();
  v4[12] = sub_11C5C();
  v4[13] = sub_11C5C();
  uint64_t v6 = sub_4D88(&qword_49188);
  v4[14] = sub_15A18(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for SpeakableString(0LL);
  v4[15] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[16] = v8;
  v4[17] = sub_15A18(v8);
  return swift_task_switch(sub_2699C, 0LL, 0LL);
}

uint64_t sub_2699C()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[18] = v4;
  v0[19] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[20] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_135CC();
}

uint64_t sub_26A14()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_260D8();
  uint64_t v3 = v2;
  char v5 = v4;
  swift_unknownObjectRelease(v1);
  *(void *)(v0 + 168) = v3;
  *(_BYTE *)(v0 + 176) = v5;
  return sub_135CC();
}

uint64_t sub_26A68()
{
  if ((*(_BYTE *)(v0 + 176) & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v13 = *(void *)(v0 + 80);
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v14 = *(void *)(v0 + 64);
    uint64_t v15 = *(void *)(v0 + 56);
    uint64_t v16 = sub_4D70(*(void *)(v0 + 72), (uint64_t)static Log.suggestions);
    sub_1A34C(v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
    sub_1A58C();
    _StringGuts.grow(_:)(19LL);
    *(void *)(v0 + 16) = v48;
    *(void *)(v0 + 24) = v49;
    v50._uint64_t countAndFlagsBits = 0x74276E646C756F43LL;
    v50._object = (void *)0xEE0020646E696620LL;
    sub_2708C(v50);
    uint64_t v17 = *(void *)(v14 + 16);
    uint64_t v18 = *(void **)(v14 + 24);
    swift_bridgeObjectRetain(v18);
    v51._uint64_t countAndFlagsBits = v17;
    v51._object = v18;
    sub_2708C(v51);
    swift_bridgeObjectRelease();
    v19._uint64_t countAndFlagsBits = 32LL;
    v19._object = (void *)0xE100000000000000LL;
    String.append(_:)(v19);
    uint64_t v20 = sub_4D88(&qword_49B58);
    _print_unlocked<A, B>(_:_:)(v15, v0 + 16, v20);
    sub_27078();
    Logger.warning(output:test:file:function:line:)(v21, v22, v23, v24, 27LL);
    sub_1A15C();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    goto LABEL_9;
  }

  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  static SemanticMapper.getSemanticKey(for:)(*(void *)(v0 + 168), 0LL);
  if (sub_61F4(v1, 1LL, v2) == 1)
  {
    sub_23A94(*(void *)(v0 + 112));
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v3 = *(void *)(v0 + 168);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 80);
    uint64_t v6 = sub_4D70(*(void *)(v0 + 72), (uint64_t)static Log.suggestions);
    sub_1A34C(v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_1A58C();
    _StringGuts.grow(_:)(35LL);
    swift_bridgeObjectRelease();
    v7._uint64_t countAndFlagsBits = HomeAttributeType.description.getter(v3);
    String.append(_:)(v7);
    sub_1A15C();
    sub_27078();
    Logger.warning(output:test:file:function:line:)(v8, v9, v10, v11, 31LL);
    sub_1A15C();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
LABEL_9:
    sub_1BDC4(v4, v12);
    uint64_t v25 = _swiftEmptyArrayStorage;
    goto LABEL_13;
  }

  (*(void (**)(void, void, void))(*(void *)(v0 + 128) + 32LL))( *(void *)(v0 + 136),  *(void *)(v0 + 112),  *(void *)(v0 + 120));
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v26 = *(void *)(v0 + 136);
  uint64_t v47 = *(void *)(v0 + 128);
  uint64_t v27 = *(void *)(v0 + 120);
  uint64_t v28 = *(void *)(v0 + 104);
  uint64_t v29 = *(void *)(v0 + 72);
  uint64_t v30 = *(void *)(v0 + 80);
  uint64_t v31 = *(void *)(v0 + 64);
  uint64_t v32 = sub_4D70(v29, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v28, v32, v29);
  sub_1A58C();
  _StringGuts.grow(_:)(27LL);
  *(void *)(v0 + 32) = v48;
  *(void *)(v0 + 40) = v49;
  v52._uint64_t countAndFlagsBits = 0xD000000000000013LL;
  v52._object = (void *)0x8000000000032910LL;
  sub_2708C(v52);
  uint64_t v33 = *(void *)(v31 + 16);
  uint64_t v34 = *(void **)(v31 + 24);
  swift_bridgeObjectRetain(v34);
  v53._uint64_t countAndFlagsBits = v33;
  v53._object = v34;
  sub_2708C(v53);
  swift_bridgeObjectRelease();
  v35._uint64_t countAndFlagsBits = 544175136LL;
  v35._object = (void *)0xE400000000000000LL;
  String.append(_:)(v35);
  _print_unlocked<A, B>(_:_:)(v26, v0 + 32, v27);
  sub_27078();
  Logger.debug(output:test:caller:)(v36, v37, v38);
  sub_1A15C();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
  uint64_t v39 = sub_4D88(&qword_48EF0);
  uint64_t v25 = (void *)swift_allocObject(v39, 64LL, 7LL);
  *((_OWORD *)v25 + 1) = xmmword_2FE90;
  uint64_t v40 = SpeakableString.speak.getter();
  v25[7] = &type metadata for String;
  v25[4] = v40;
  v25[5] = v41;
  sub_1BDC4(v26, *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
LABEL_13:
  uint64_t v42 = *(void *)(v0 + 104);
  uint64_t v43 = *(void *)(v0 + 112);
  uint64_t v45 = *(void *)(v0 + 88);
  uint64_t v44 = *(void *)(v0 + 96);
  swift_task_dealloc(*(void *)(v0 + 136));
  swift_task_dealloc(v43);
  swift_task_dealloc(v42);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  return (*(uint64_t (**)(void *))(v0 + 8))(v25);
}

uint64_t type metadata accessor for AttributeResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions17AttributeResolver);
}

void *sub_26ED0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.attribute(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  uint64_t v10 = sub_1BDC4((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v1[2] = v7;
  v1[3] = v9;
  uint64_t v20 = &off_41E68;
  sub_2C27C(v10, v11, v12, v13, v14, v15, v16, v17);
  v1[4] = v20;
  return v1;
}

uint64_t sub_26F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_49B54);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_4C74;
  return sub_268F4((uint64_t)v6, a2, a3);
}

uint64_t sub_26FF4()
{
  return sub_2703C((unint64_t *)&unk_49B38, (uint64_t)&unk_31B34);
}

uint64_t sub_27018()
{
  return sub_2703C(&qword_49B48, (uint64_t)&unk_31B5C);
}

uint64_t sub_2703C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AttributeResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

  ;
}

void sub_2708C(Swift::String a1)
{
}

uint64_t sub_27094()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CC68);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.getStateOfSecuritySystems(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_270E0()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CC80);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24A04();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for GetStateOfSecuritySystems()
{
  return &type metadata for GetStateOfSecuritySystems;
}

uint64_t sub_2714C()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CC98);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.powerAccessories(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_27198()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CCB0);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = sub_24A20();
  v1[1] = v2;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catId(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

ValueMetadata *type metadata accessor for PowerAccessoriesSuggestion()
{
  return &type metadata for PowerAccessoriesSuggestion;
}

uint64_t sub_27204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v12 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48DD0 != -1) {
    swift_once(&qword_48DD0, sub_2714C);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CC98);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject(v9, 40LL, 7LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v13[3] = v9;
  void v13[4] = sub_825C( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v13[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v12;
  sub_6128((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v13, v3, v12);
  return sub_6108(v13);
}

uint64_t sub_27338@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v68.n128_u64[0] = a1;
  uint64_t v69 = a2;
  v71.n128_u64[0] = sub_4D88(&qword_49048);
  uint64_t v70 = *(void *)(v71.n128_u64[0] - 8);
  __chkstk_darwin(v71.n128_u64[0]);
  v73.n128_u64[0] = (unint64_t)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4D88(&qword_49050);
  uint64_t v8 = (int *)type metadata accessor for ResolverParameterProperties(0LL);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v67 = *(void *)(v9 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + 3 * v67, v10 | 7);
  uint64_t v74 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_30590;
  uint64_t v13 = v12 + v11;
  uint64_t v72 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v72(v6, enum case for SuggestionParameter.accessoryType(_:), v3);
  uint64_t v14 = type metadata accessor for AccessoryTypeResolver();
  sub_8308(v14);
  uint64_t v15 = sub_284F0();
  uint64_t v16 = (uint64_t *)(v13 + v8[5]);
  v16[3] = v14;
  v16[4] = sub_825C( &qword_490B8,  (uint64_t (*)(uint64_t))type metadata accessor for AccessoryTypeResolver,  (uint64_t)&unk_31D58);
  *uint64_t v16 = v15;
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v63 = v3;
  v66(v13, v6, v3);
  *(_BYTE *)(v13 + v8[6]) = 1;
  *(_BYTE *)(v13 + v8[7]) = 1;
  uint64_t v17 = sub_4D88(&qword_49060);
  uint64_t v64 = (char *)&type metadata for Any + 8;
  uint64_t v65 = v17;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v18 = v67;
  uint64_t v19 = v13 + v67;
  sub_8BE0();
  uint64_t v20 = type metadata accessor for RoomNameResolver();
  sub_8308(v20);
  uint64_t v21 = sub_1B2BC();
  Swift::Bool v22 = (uint64_t *)(v19 + v8[5]);
  v22[3] = v20;
  v22[4] = sub_825C( (unint64_t *)&qword_490B0,  (uint64_t (*)(uint64_t))type metadata accessor for RoomNameResolver,  (uint64_t)&unk_315A4);
  *Swift::Bool v22 = v21;
  uint64_t v23 = v63;
  Swift::String v24 = v66;
  v66(v13 + v18, v6, v63);
  *(_BYTE *)(v19 + v8[6]) = 1;
  *(_BYTE *)(v19 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, (char *)&type metadata for Any + 8, v17);
  uint64_t v25 = v13 + 2 * v18;
  uint64_t v26 = v23;
  sub_8BE0();
  uint64_t v27 = type metadata accessor for SameTypeMultipleRoomsResolver();
  sub_8308(v27);
  uint64_t v28 = sub_2471C();
  uint64_t v29 = (uint64_t *)(v25 + v8[5]);
  v29[3] = v27;
  v29[4] = sub_825C( &qword_49B60,  (uint64_t (*)(uint64_t))type metadata accessor for SameTypeMultipleRoomsResolver,  (uint64_t)&unk_31A80);
  *uint64_t v29 = v28;
  v24(v25, v6, v26);
  uint64_t v30 = v25;
  *(_BYTE *)(v25 + v8[6]) = 0;
  *(_BYTE *)(v25 + v8[7]) = 0;
  Transformer.init(transform:)(sub_2E8A0, 0LL, v64, v65);
  sub_6F90(v68.n128_i64[0], (uint64_t)&v76);
  LODWORD(v6) = *(unsigned __int8 *)(v13 + v8[7]);
  uint64_t v31 = type metadata accessor for ResolvableParameter(0LL);
  uint64_t v32 = swift_bridgeObjectRetain(v74);
  SuggestionParameter.rawValue.getter(v32);
  sub_8BA8();
  uint64_t v34 = *(unsigned __int8 *)(v13 + v33);
  BOOL v35 = (_DWORD)v6 == 1;
  unint64_t v36 = v73.n128_u64[0];
  uint64_t v72 = (void (*)(char *, void, uint64_t))v31;
  if (v35)
  {
    (*(void (**)(unint64_t, uint64_t, unint64_t))(v70 + 16))( v73.n128_u64[0],  v13 + v8[8],  v71.n128_u64[0]);
    ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v13, v26, v34, v36);
  }

  else
  {
    ResolvableParameter.__allocating_init(typeIdentifier:required:)(v13, v26, v34);
  }

  __n128 v68 = v77;
  Swift::Bool v37 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v37);
  uint64_t v39 = v38;
  sub_8BFC(v13 + v8[5]);
  sub_82F8(v68);
  uint64_t v40 = sub_8BD0();
  sub_8B40(v40, v39, v41);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  uint64_t v42 = sub_6108(v75);
  char v43 = *(_BYTE *)(v19 + v8[7]);
  SuggestionParameter.rawValue.getter(v42);
  sub_8BA8();
  if ((v43 & 1) != 0)
  {
    uint64_t v44 = sub_8BB8();
    v45(v44);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v71 = v77;
  uint64_t v46 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v46);
  uint64_t v48 = v47;
  sub_8BFC(v19 + v8[5]);
  sub_82F8(v71);
  uint64_t v49 = sub_8BD0();
  sub_8B40(v49, v48, v50);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  uint64_t v51 = sub_6108(v75);
  char v52 = *(_BYTE *)(v30 + v8[7]);
  SuggestionParameter.rawValue.getter(v51);
  sub_8BA8();
  if ((v52 & 1) != 0)
  {
    uint64_t v53 = sub_8BB8();
    v54(v53);
    sub_8B54();
  }

  else
  {
    sub_8B90();
  }

  __n128 v73 = v77;
  uint64_t v55 = sub_8B70(v77.n128_f64[0]);
  SuggestionParameter.rawValue.getter(v55);
  uint64_t v57 = v56;
  sub_8BFC(v30 + v8[5]);
  sub_82F8(v73);
  uint64_t v58 = sub_8BD0();
  sub_8B40(v58, v57, v59);
  sub_8BF4();
  swift_bridgeObjectRelease();
  sub_8BEC();
  sub_6108(v75);
  uint64_t v60 = v74;
  swift_bridgeObjectRelease();
  sub_7014(&v76, v69);
  swift_setDeallocating(v60);
  return sub_1E9F4();
}

uint64_t sub_2796C()
{
  v1[8] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[9] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[10] = v3;
  unint64_t v4 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[11] = swift_task_alloc(v4);
  v1[12] = swift_task_alloc(v4);
  return sub_4DC8();
}

uint64_t sub_279D4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = *(void *)(v1 + 16);
  v0[13] = v2;
  uint64_t v3 = *(void **)(v1 + 24);
  v0[14] = v3;
  uint64_t v4 = type metadata accessor for SuggestionEntityRetrieval();
  v0[15] = swift_initStackObject(v4);
  swift_bridgeObjectRetain(v3);
  v0[16] = sub_28D90(v2, v3);
  uint64_t v5 = (void *)swift_task_alloc(dword_49D3C);
  v0[17] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_27A6C;
  return sub_2A9A0();
}

uint64_t sub_27A6C(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 128LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 136LL);
  *(void *)(*(void *)v1 + 144LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return sub_4DC8();
}

uint64_t sub_27AC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 144);
  if (v2)
  {
    uint64_t v3 = Entity.name.getter(a1);
    uint64_t v5 = v4;
    swift_release(v2);
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v7 = *(void *)(v1 + 104);
    uint64_t v6 = *(void **)(v1 + 112);
    uint64_t v8 = *(void *)(v1 + 96);
    uint64_t v9 = *(void *)(v1 + 72);
    uint64_t v10 = *(void *)(v1 + 80);
    uint64_t v11 = sub_4D70(v9, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease();
    v30._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v30._object = (void *)0x8000000000032910LL;
    swift_bridgeObjectRetain(v6);
    v12._uint64_t countAndFlagsBits = v7;
    v12._object = v6;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = 544175136LL;
    v13._object = (void *)0xE400000000000000LL;
    String.append(_:)(v13);
    v14._uint64_t countAndFlagsBits = v3;
    v14._object = v5;
    String.append(_:)(v14);
    v15._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v16._object = (void *)0x80000000000365F0LL;
    v15._object = (void *)0x8000000000032910LL;
    v16._uint64_t countAndFlagsBits = 0xD000000000000078LL;
    Logger.debug(output:test:caller:)(v15, 0, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    uint64_t v17 = sub_4D88(&qword_48EF0);
    uint64_t v18 = (void *)swift_allocObject(v17, 64LL, 7LL);
    *((_OWORD *)v18 + 1) = xmmword_2FE90;
    v18[7] = &type metadata for String;
    v18[4] = v3;
    v18[5] = v5;
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v20 = *(void *)(v1 + 104);
    uint64_t v19 = *(void **)(v1 + 112);
    uint64_t v22 = *(void *)(v1 + 80);
    uint64_t v21 = *(void *)(v1 + 88);
    uint64_t v23 = *(void *)(v1 + 72);
    uint64_t v24 = sub_4D70(v23, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v24, v23);
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease();
    strcpy((char *)&v30, "Couldn't find ");
    HIBYTE(v30._object) = -18;
    swift_bridgeObjectRetain(v19);
    v25._uint64_t countAndFlagsBits = v20;
    v25._object = v19;
    String.append(_:)(v25);
    swift_bridgeObjectRelease();
    v26._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v27._object = (void *)0x80000000000365F0LL;
    v26._object = (void *)0x8000000000035190LL;
    v27._uint64_t countAndFlagsBits = 0xD000000000000078LL;
    Logger.warning(output:test:file:function:line:)(v30, 0, v27, v26, 18LL);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    uint64_t v18 = _swiftEmptyArrayStorage;
  }

  uint64_t v28 = *(void *)(v1 + 88);
  swift_task_dealloc(*(void *)(v1 + 96));
  swift_task_dealloc(v28);
  return (*(uint64_t (**)(void *))(v1 + 8))(v18);
}

uint64_t type metadata accessor for SceneNameResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions17SceneNameResolver);
}

uint64_t sub_27DD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.sceneName(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_27E7C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_49C24);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_4C74;
  return sub_2796C();
}

uint64_t sub_27EC4()
{
  return sub_27F0C((unint64_t *)&unk_49C08, (uint64_t)&unk_31C44);
}

uint64_t sub_27EE8()
{
  return sub_27F0C(&qword_49C18, (uint64_t)&unk_31C6C);
}

uint64_t sub_27F0C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for SceneNameResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_27F48(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = sub_11C5C();
  v3[10] = sub_11C5C();
  v3[11] = sub_11C5C();
  uint64_t v5 = sub_4D88(&qword_49188);
  v3[12] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  v3[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[14] = v7;
  v3[15] = sub_15A18(v7);
  return swift_task_switch(sub_27FEC, 0LL, 0LL);
}

uint64_t sub_27FEC()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_4D4C(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[16] = v4;
  v0[17] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[18] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_135CC();
}

uint64_t sub_28064()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_25B08();
  uint64_t v3 = v2;
  char v5 = v4;
  swift_unknownObjectRelease(v1);
  *(void *)(v0 + 152) = v3;
  *(_BYTE *)(v0 + 160) = v5;
  return sub_135CC();
}

uint64_t sub_280B8()
{
  if ((*(_BYTE *)(v0 + 160) & 1) != 0)
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 48);
    uint64_t v15 = sub_4D70(*(void *)(v0 + 56), (uint64_t)static Log.suggestions);
    sub_1A34C(v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
    sub_1A58C();
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v14 + 16);
    uint64_t v17 = *(void **)(v14 + 24);
    swift_bridgeObjectRetain(v17);
    v18._uint64_t countAndFlagsBits = v16;
    v18._object = v17;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    sub_28668();
    Logger.warning(output:test:file:function:line:)(v19, v20, v21, v22, 18LL);
    sub_1A15C();
    Swift::String v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    goto LABEL_9;
  }

  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  static SemanticMapper.getSemanticKey(for:)(*(void *)(v0 + 152), 0LL);
  if (sub_61F4(v1, 1LL, v2) == 1)
  {
    sub_23A94(*(void *)(v0 + 96));
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v3 = *(void *)(v0 + 152);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v6 = sub_4D70(*(void *)(v0 + 56), (uint64_t)static Log.suggestions);
    sub_1A34C(v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_1A58C();
    _StringGuts.grow(_:)(35LL);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = v3;
    v7._uint64_t countAndFlagsBits = String.init<A>(describing:)(v0 + 32, &type metadata for HomeDeviceType);
    String.append(_:)(v7);
    sub_1A15C();
    sub_28668();
    Logger.warning(output:test:file:function:line:)(v8, v9, v10, v11, 23LL);
    sub_1A15C();
    Swift::String v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
LABEL_9:
    sub_1BDC4(v4, v12);
    uint64_t v23 = _swiftEmptyArrayStorage;
    goto LABEL_13;
  }

  (*(void (**)(void, void, void))(*(void *)(v0 + 112) + 32LL))( *(void *)(v0 + 120),  *(void *)(v0 + 96),  *(void *)(v0 + 104));
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v24 = *(void *)(v0 + 120);
  uint64_t v45 = *(void *)(v0 + 112);
  uint64_t v25 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 88);
  uint64_t v27 = *(void *)(v0 + 56);
  uint64_t v28 = *(void *)(v0 + 64);
  uint64_t v29 = *(void *)(v0 + 48);
  uint64_t v30 = sub_4D70(v27, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v30, v27);
  sub_1A58C();
  _StringGuts.grow(_:)(27LL);
  *(void *)(v0 + 16) = v46;
  *(void *)(v0 + 24) = v47;
  v31._uint64_t countAndFlagsBits = 0xD000000000000013LL;
  v31._object = (void *)0x8000000000032910LL;
  String.append(_:)(v31);
  uint64_t v32 = *(void *)(v29 + 16);
  uint64_t v33 = *(void **)(v29 + 24);
  swift_bridgeObjectRetain(v33);
  v34._uint64_t countAndFlagsBits = v32;
  v34._object = v33;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  v35._uint64_t countAndFlagsBits = 544175136LL;
  v35._object = (void *)0xE400000000000000LL;
  String.append(_:)(v35);
  _print_unlocked<A, B>(_:_:)(v24, v0 + 16, v25);
  v36._object = (void *)0x80000000000366B0LL;
  v36._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
  Logger.debug(output:test:caller:)(*(Swift::String *)(v0 + 16), 0, v36);
  sub_1A15C();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  uint64_t v37 = sub_4D88(&qword_48EF0);
  uint64_t v23 = (void *)swift_allocObject(v37, 64LL, 7LL);
  *((_OWORD *)v23 + 1) = xmmword_2FE90;
  uint64_t v38 = SpeakableString.speak.getter();
  v23[7] = &type metadata for String;
  v23[4] = v38;
  v23[5] = v39;
  sub_1BDC4(v24, *(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
LABEL_13:
  uint64_t v40 = *(void *)(v0 + 88);
  uint64_t v41 = *(void *)(v0 + 96);
  uint64_t v43 = *(void *)(v0 + 72);
  uint64_t v42 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v41);
  swift_task_dealloc(v40);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  return (*(uint64_t (**)(void *))(v0 + 8))(v23);
}

uint64_t type metadata accessor for AccessoryTypeResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions21AccessoryTypeResolver);
}

uint64_t sub_284F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SuggestionParameter(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for SuggestionParameter.accessoryType(_:),  v2);
  uint64_t v7 = SuggestionParameter.rawValue.getter(v6);
  uint64_t v9 = v8;
  sub_1BDC4((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  *(void *)(v1 + 16) = v7;
  *(void *)(v1 + 24) = v9;
  return v1;
}

uint64_t sub_28594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_49CE4);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_4C74;
  return sub_27F48((uint64_t)v4, a2);
}

uint64_t sub_285E4()
{
  return sub_2862C((unint64_t *)&unk_49CC8, (uint64_t)&unk_31CF8);
}

uint64_t sub_28608()
{
  return sub_2862C(&qword_49CD8, (uint64_t)&unk_31D20);
}

uint64_t sub_2862C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AccessoryTypeResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

  ;
}

uint64_t sub_28688()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CCC8);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setTemperature(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_286D4()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CCE0);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = &unk_49CE8;
  v1[1] = 0LL;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catTemplateCallback(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_2872C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_49CF4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_14AF0;
  return sub_28784(a1, a2);
}

uint64_t sub_28784(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  unint64_t v3 = (*(void *)(*(void *)(sub_4D88(&qword_49188) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[26] = swift_task_alloc(v3);
  v2[27] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for CATOption(0LL);
  v2[28] = sub_15A18(*(void *)(v4 - 8));
  uint64_t v5 = sub_4D88(&qword_49118);
  v2[29] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for TemplatingResult(0LL);
  v2[30] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[31] = v7;
  v2[32] = sub_15A18(v7);
  return swift_task_switch(sub_28838, 0LL, 0LL);
}

uint64_t sub_28838()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_4D4C(v1, v1[3]);
  uint64_t v2 = sub_15A28();
  sub_15D68(0x656D614E6D6F6F72LL, 0xE800000000000000LL, v2, (_OWORD *)(v0 + 16));
  sub_15A64();
  if (*(void *)(v0 + 40))
  {
    int v3 = sub_15A34(v0 + 144, v0 + 16, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v4 = *(void *)(v0 + 144);
    if (!v3) {
      uint64_t v4 = 0LL;
    }
    uint64_t v30 = v4;
    if (v3) {
      uint64_t v5 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 16, &qword_49060);
    uint64_t v30 = 0LL;
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = sub_15A28();
  sub_15D68(0x7475626972747461LL, 0xE900000000000065LL, v6, (_OWORD *)(v0 + 48));
  sub_15A64();
  if (*(void *)(v0 + 72))
  {
    int v7 = sub_15A34(v0 + 160, v0 + 48, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v8 = *(void *)(v0 + 160);
    if (!v7) {
      uint64_t v8 = 0LL;
    }
    uint64_t v29 = v8;
    if (v7) {
      uint64_t v9 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 48, &qword_49060);
    uint64_t v29 = 0LL;
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = sub_15A28();
  sub_15D68(0x65756C6176LL, 0xE500000000000000LL, v10, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
    sub_15994(v0 + 80, &qword_49060);
LABEL_22:
    uint64_t v12 = 0LL;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_23;
  }

  uint64_t v11 = type metadata accessor for HomeAutomationEntityStateValue(0LL);
  uint64_t v12 = *(void *)(v0 + 176);
  sub_4D4C(*(void **)(v0 + 200), v1[3]);
  swift_retain(v12);
  uint64_t v13 = sub_15A3C();
  dispatch thunk of HomeAutomationEntityStateValue.mockGlobals.setter(v13);
  swift_release(v12);
  if (!v12) {
    goto LABEL_22;
  }
  swift_retain(v12);
  dispatch thunk of HomeAutomationEntityStateValue.getProperty(_:)(0x56636972656D756ELL, 0xEC00000065756C61LL);
  swift_release(v12);
  if (!*(void *)(v0 + 136))
  {
LABEL_23:
    sub_15994(v0 + 112, &qword_49060);
    goto LABEL_24;
  }

  uint64_t v14 = type metadata accessor for HomeAutomationAbstractMeasurement(0LL);
  if ((sub_15A34(v0 + 184, v0 + 112, (uint64_t)&type metadata for Any + 8, v14) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v0 + 184);
    sub_4D4C(*(void **)(v0 + 200), v1[3]);
    swift_retain(v15);
    uint64_t v16 = sub_15A3C();
    dispatch thunk of HomeAutomationAbstractMeasurement.mockGlobals.setter(v16);
    swift_release(v15);
    goto LABEL_25;
  }

ValueMetadata *type metadata accessor for SetTemperatureSuggestion()
{
  return &type metadata for SetTemperatureSuggestion;
}

uint64_t sub_28C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v13 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48DE0 != -1) {
    swift_once(&qword_48DE0, sub_28688);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CCC8);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v9, 40LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v14[3] = v9;
  sub_159CC( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v14[4] = v11;
  v14[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v13;
  sub_1595C((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v14, v3, v13);
  return sub_6108(v14);
}

void *sub_28D90(uint64_t a1, void *a2)
{
  v2[2] = a1;
  v2[3] = a2;
  swift_bridgeObjectRetain(a2);
  _StringGuts.grow(_:)(29LL);
  sub_2DE94(v5, v6, v7, v8, v9, v10, v11, v12, 0LL, 0xE000000000000000LL);
  v13._uint64_t countAndFlagsBits = a1;
  v13._object = a2;
  String.append(_:)(v13);
  sub_1A090();
  v14._uint64_t countAndFlagsBits = 46LL;
  v14._object = (void *)0xE100000000000000LL;
  String.append(_:)(v14);
  v2[4] = 0xD00000000000001ALL;
  v2[5] = 0x8000000000036790LL;
  return v2;
}

uint64_t sub_28E34()
{
  uint64_t v1 = sub_21160();
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = sub_15A18(v2);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_28E74()
{
  if (qword_48C58 != -1) {
    swift_once(&qword_48C58, sub_6088);
  }
  *(void *)(v0 + 40) = qword_4C898;
  sub_2DE50();
  return sub_4DC8();
}

uint64_t sub_28ED8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + 112LL);
  *(void *)(v0 + 48) = v1;
  swift_retain(v1);
  sub_1A0DC();
  sub_11C7C();
  return sub_4DC8();
}

#error "28F8C: call analysis failed (funcsize=96)"
uint64_t sub_290EC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = (void *)swift_task_alloc(dword_49D24);
  v2[4] = v3;
  sub_2DDC0(v3, (uint64_t)sub_29128);
  return sub_2DC08();
}

uint64_t sub_29128()
{
  *(void *)(v1 + 40) = v0;
  sub_1A634(v2);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_29164()
{
  if (*(void *)(v0 + 40))
  {
    uint64_t v1 = *(void **)(v0 + 16);
    int64_t v2 = dispatch thunk of Home.accessories.getter();
    uint64_t v3 = sub_2B340(v1, v2, 0LL, 1);
    sub_15A64();
    sub_8BF4();
  }

  else
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v4 = sub_21160();
    sub_2DE34(v4, (uint64_t)static Log.suggestions);
    sub_1A6BC();
    sub_2DC84();
    v5._uint64_t countAndFlagsBits = 0xD000000000000027LL;
    Logger.warning(output:test:file:function:line:)(v6, v7, v8, v5, 47LL);
    uint64_t v3 = 0LL;
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_29260(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  uint64_t v3 = sub_21160();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = sub_11C5C();
  v2[27] = sub_11C5C();
  v2[28] = sub_11C5C();
  v2[29] = sub_11C5C();
  v2[30] = sub_11C5C();
  v2[31] = sub_11C5C();
  v2[32] = sub_11C5C();
  v2[33] = sub_11C5C();
  uint64_t v4 = (void *)swift_task_alloc(dword_49D24);
  v2[34] = v4;
  sub_2DDC0(v4, (uint64_t)sub_292F8);
  return sub_2DC08();
}

uint64_t sub_292F8()
{
  *(void *)(v1 + 280) = v0;
  sub_1A634(v2);
  sub_11C7C();
  return sub_4DC8();
}

uint64_t sub_29334()
{
  uint64_t v312 = v0[35];
  if (!v312)
  {
    if (qword_48D38 != -1) {
      goto LABEL_195;
    }
    goto LABEL_114;
  }

  uint64_t v304 = (uint64_t)(v0 + 12);
  uint64_t v292 = (uint64_t)(v0 + 14);
  uint64_t v294 = (uint64_t)(v0 + 7);
  uint64_t v284 = (uint64_t)(v0 + 2);
  uint64_t v286 = (uint64_t)(v0 + 16);
  uint64_t v288 = (uint64_t)(v0 + 18);
  uint64_t v290 = (uint64_t)(v0 + 20);
  uint64_t v2 = v0[22];
  uint64_t v310 = v0[23];
  uint64_t v298 = v2 + 64;
  uint64_t v325 = v0[25];
  uint64_t v3 = -1LL;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1LL << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v2 + 64);
  int64_t v300 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain_n(v2, 2LL);
  uint64_t v282 = 0LL;
  int64_t v6 = 0LL;
  sub_2DDD4();
  uint64_t v306 = v7;
  uint64_t v308 = v2;
  sub_2DDD4();
  uint64_t v302 = v8;
  sub_2DDD4();
  output = v9;
  sub_2DDD4();
  uint64_t v280 = v10;
  uint64_t v314 = v2;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_18;
    }

    BOOL v13 = __OFADD__(v6++, 1LL);
    if (v13) {
      goto LABEL_189;
    }
    if (v6 >= v300) {
      break;
    }
    unint64_t v14 = *(void *)(v298 + 8 * v6);
    if (!v14)
    {
      int64_t v15 = v6 + 1;
      if (v6 + 1 >= v300) {
        break;
      }
      unint64_t v14 = *(void *)(v298 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v6 + 2;
        if (v6 + 2 >= v300) {
          break;
        }
        unint64_t v14 = *(void *)(v298 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v6 + 3;
          if (v6 + 3 >= v300) {
            break;
          }
          unint64_t v14 = *(void *)(v298 + 8 * v15);
          if (!v14)
          {
            while (1)
            {
              int64_t v6 = v15 + 1;
              if (__OFADD__(v15, 1LL)) {
                break;
              }
              if (v6 >= v300) {
                goto LABEL_71;
              }
              unint64_t v14 = *(void *)(v298 + 8 * v6);
              ++v15;
              if (v14) {
                goto LABEL_17;
              }
            }

LABEL_194:
            __break(1u);
LABEL_195:
            swift_once(&qword_48D38, sub_1FB8C);
            uint64_t v0 = v332;
LABEL_114:
            sub_2DE34(v0[24], (uint64_t)static Log.suggestions);
            sub_2DC14();
            sub_1A6BC();
            sub_2DC84();
            Logger.warning(output:test:file:function:line:)(v148, v149, v150, v151, 59LL);
            uint64_t v152 = 0LL;
            uint64_t v153 = 0LL;
            char v328 = 1;
LABEL_182:
            uint64_t v265 = v0[32];
            uint64_t v267 = v0[30];
            uint64_t v266 = v0[31];
            uint64_t v269 = v0[28];
            uint64_t v268 = v0[29];
            uint64_t v271 = v0[26];
            uint64_t v270 = v0[27];
            swift_task_dealloc(v0[33]);
            swift_task_dealloc(v265);
            swift_task_dealloc(v266);
            swift_task_dealloc(v267);
            swift_task_dealloc(v268);
            swift_task_dealloc(v269);
            swift_task_dealloc(v270);
            swift_task_dealloc(v271);
            return ((uint64_t (*)(uint64_t, uint64_t, void))v0[1])(v152, v153, v328 & 1);
          }
        }
      }

      int64_t v6 = v15;
    }

LABEL_71:
  swift_release(v332[22]);
  if (!*(void *)(v314 + 16))
  {
    if (qword_48D38 != -1) {
      swift_once(&qword_48D38, sub_1FB8C);
    }
    uint64_t v0 = v332;
    uint64_t v188 = v332[29];
    uint64_t v189 = v332[24];
    uint64_t v190 = sub_4D70(v189, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v325 + 16))(v188, v190, v189);
    sub_2DC7C();
    uint64_t v192 = *(void *)(v310 + 32);
    uint64_t v191 = *(void **)(v310 + 40);
    swift_bridgeObjectRetain(v191);
    sub_149B4();
    sub_2DC14();
    sub_1A6BC();
    char v328 = 1;
    v193._uint64_t countAndFlagsBits = v192;
    v193._object = v191;
    Logger.debug(output:test:caller:)(v194, 1, v193);
    swift_release(v312);
    sub_1A15C();
    uint64_t v195 = (*(uint64_t (**)(uint64_t, uint64_t))(v325 + 8))(v188, v189);
    sub_2DE2C( v195,  v196,  v197,  v198,  v199,  v200,  v201,  v202,  v275,  v276,  v277,  v278,  v280,  v282,  v284,  v286,  v288,  v290,  v292,  v294,  (uint64_t)output,  v298,  v300,  (uint64_t)v302,  v304,  v306,  v308,  v310,  v312,  v314);
    uint64_t v152 = 0LL;
    uint64_t v153 = 0LL;
    goto LABEL_182;
  }

  sub_19830(v314);
  uint64_t v123 = v332[7];
  uint64_t v124 = v332[8];
  int64_t v125 = v332[10];
  unint64_t v126 = v332[11];
  int64_t v127 = (unint64_t)(v332[9] + 64LL) >> 6;
  swift_bridgeObjectRetain_n(v314, 2LL);
  uint64_t v128 = _swiftEmptyArrayStorage;
  if (!v126) {
    goto LABEL_74;
  }
  while (2)
  {
    unint64_t v129 = __clz(__rbit64(v126));
    v126 &= v126 - 1;
    unint64_t v130 = v129 | (v125 << 6);
LABEL_87:
    uint64_t v134 = *(void *)(v123 + 56);
    uint64_t v135 = *(void *)(v134 + 8 * v130);
    uint64_t v136 = *(void *)(v135 + 16);
    int64_t v137 = v128[2];
    int64_t v138 = v137 + v136;
    if (__OFADD__(v137, v136)) {
      goto LABEL_184;
    }
    swift_bridgeObjectRetain(*(void *)(v134 + 8 * v130));
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v128);
    if (!isUniquelyReferenced_nonNull_native || v138 > v128[3] >> 1)
    {
      if (v137 <= v138) {
        int64_t v140 = v137 + v136;
      }
      else {
        int64_t v140 = v137;
      }
      sub_2BCEC( isUniquelyReferenced_nonNull_native,  v140,  1,  (uint64_t)v128,  &qword_49408,  (void (*)(uint64_t, uint64_t, char *))sub_18920);
      uint64_t v128 = v141;
    }

    if (*(void *)(v135 + 16))
    {
      uint64_t v142 = v128[2];
      if ((v128[3] >> 1) - v142 < v136) {
        goto LABEL_188;
      }
      uint64_t v143 = &v128[v142 + 4];
      memcpy(v143, (const void *)(v135 + 32), 8 * v136);
      if (v136)
      {
        uint64_t v145 = v128[2];
        BOOL v13 = __OFADD__(v145, v136);
        uint64_t v146 = v145 + v136;
        if (v13) {
          goto LABEL_190;
        }
        v128[2] = v146;
      }
    }

    else if (v136)
    {
      goto LABEL_185;
    }

    sub_1A15C();
    if (v126) {
      continue;
    }
    break;
  }

LABEL_74:
  int64_t v131 = v125 + 1;
  if (__OFADD__(v125, 1LL)) {
    goto LABEL_191;
  }
  if (v131 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v131);
  if (v132)
  {
LABEL_86:
    unint64_t v126 = (v132 - 1) & v132;
    unint64_t v130 = __clz(__rbit64(v132)) + (v131 << 6);
    int64_t v125 = v131;
    goto LABEL_87;
  }

  int64_t v133 = v125 + 2;
  if (v125 + 2 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v133);
  if (v132) {
    goto LABEL_85;
  }
  int64_t v133 = v125 + 3;
  if (v125 + 3 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v133);
  if (v132) {
    goto LABEL_85;
  }
  int64_t v133 = v125 + 4;
  if (v125 + 4 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v133);
  if (v132) {
    goto LABEL_85;
  }
  int64_t v133 = v125 + 5;
  if (v125 + 5 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v133);
  if (v132)
  {
LABEL_85:
    int64_t v131 = v133;
    goto LABEL_86;
  }

  int64_t v131 = v125 + 6;
  if (v125 + 6 >= v127) {
    goto LABEL_115;
  }
  unint64_t v132 = *(void *)(v124 + 8 * v131);
  if (v132) {
    goto LABEL_86;
  }
  int64_t v147 = v125 + 7;
  while (v147 < v127)
  {
    unint64_t v132 = *(void *)(v124 + 8 * v147++);
    if (v132)
    {
      int64_t v131 = v147 - 1;
      goto LABEL_86;
    }
  }

LABEL_115:
  uint64_t v154 = sub_1A0DC();
  sub_2DE2C( v154,  v155,  v156,  v157,  v158,  v159,  v160,  v161,  v275,  v276,  v277,  v278,  v280,  v282,  v284,  v286,  v288,  v290,  v292,  v294,  (uint64_t)output,  v298,  v300,  (uint64_t)v302,  v304,  v306,  v308,  v310,  v312,  v314);
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v162 = v332[28];
  uint64_t v321 = sub_4D70(v332[24], (uint64_t)static Log.suggestions);
  Swift::String v319 = *(void (**)(uint64_t))(v325 + 16);
  v319(v162);
  uint64_t v163 = sub_239AC(32LL);
  sub_2DD64(v163, v164);
  sub_2DC14();
  uint64_t v338 = v165 - 6;
  int64_t v166 = v128[2];
  if (v166)
  {
    sub_2DEA8(0LL, v166);
    uint64_t v167 = v128 + 4;
    do
    {
      uint64_t v168 = *v167++;
      uint64_t v169 = HomeAttributeType.description.getter(v168);
      uint64_t v171 = v170;
      unint64_t v173 = _swiftEmptyArrayStorage[2];
      unint64_t v172 = _swiftEmptyArrayStorage[3];
      if (v173 >= v172 >> 1) {
        sub_19300((char *)(v172 > 1), v173 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v173 + 1;
      uint64_t v174 = &_swiftEmptyArrayStorage[2 * v173];
      v174[4] = v169;
      v174[5] = v171;
      --v166;
    }

    while (v166);
  }

  uint64_t v175 = v332[27];
  uint64_t v176 = v332[28];
  uint64_t v177 = v332[24];
  v345._uint64_t countAndFlagsBits = Array.description.getter(_swiftEmptyArrayStorage, &type metadata for String);
  sub_2DC98(v345);
  sub_15A64();
  sub_149B4();
  sub_2DC7C();
  uint64_t v179 = *(void *)(v311 + 32);
  uint64_t v178 = *(void **)(v311 + 40);
  sub_210E0();
  sub_15A64();
  v180._uint64_t countAndFlagsBits = v338;
  v180._object = (void *)0x8000000000036B00LL;
  v323._uint64_t countAndFlagsBits = v179;
  v181._uint64_t countAndFlagsBits = v179;
  v181._object = v178;
  Logger.debug(output:test:caller:)(v180, 1, v181);
  v323._object = v178;
  sub_6324();
  sub_149B4();
  v326 = *(void (**)(uint64_t, uint64_t))(v325 + 8);
  v326(v176, v177);
  uint64_t v153 = sub_2B864((uint64_t)v128);
  char v183 = v182;
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t, uint64_t))v319)(v175, v321, v177);
  v339._uint64_t countAndFlagsBits = sub_239AC(58LL);
  v339._object = v184;
  sub_2DC14();
  v346._uint64_t countAndFlagsBits = v185 - 12;
  v346._object = (void *)0x8000000000036B20LL;
  sub_2DC98(v346);
  if ((v183 & 1) != 0) {
    uint64_t v186 = sub_2DE88();
  }
  else {
    uint64_t v186 = HomeAttributeType.description.getter(v153);
  }
  uint64_t v203 = v332;
  uint64_t v204 = v332[27];
  uint64_t v205 = v332[24];
  v332[14] = v186;
  v332[15] = v187;
  sub_4D88(&qword_48FE0);
  v206._uint64_t countAndFlagsBits = sub_2DDCC(v293);
  String.append(_:)(v206);
  sub_1A15C();
  sub_2DC14();
  sub_1A134(v207 - 4, (uint64_t)". Setting as preferred attribute");
  sub_2DC7C();
  swift_bridgeObjectRetain(v323._object);
  sub_1A488();
  v208._uint64_t countAndFlagsBits = v179;
  v208._object = v323._object;
  Logger.debug(output:test:caller:)(v339, 1, v208);
  swift_bridgeObjectRelease();
  sub_1A15C();
  v326(v204, v205);
  char v328 = v183;
  if ((v183 & 1) != 0)
  {
    uint64_t v209 = 0LL;
LABEL_172:
    ((void (*)(void, uint64_t, void))v319)(v203[26], v321, v203[24]);
    v340._uint64_t countAndFlagsBits = sub_239AC(90LL);
    v340._object = v234;
    v235._object = (void *)0x8000000000036B70LL;
    v235._uint64_t countAndFlagsBits = 0xD000000000000024LL;
    String.append(_:)(v235);
    if ((v183 & 1) != 0) {
      uint64_t v236 = sub_2DE88();
    }
    else {
      uint64_t v236 = HomeAttributeType.description.getter(v153);
    }
    v332[16] = v236;
    v332[17] = v237;
    v238._uint64_t countAndFlagsBits = sub_2DDCC(v287);
    String.append(_:)(v238);
    sub_62A4();
    sub_2DC14();
    sub_1A134(v239 + 3, (uint64_t)".\n        Resolved preferredAccessory: ");
    if (v209)
    {
      uint64_t v240 = swift_retain(v209);
      uint64_t v246 = dispatch thunk of Entity.description.getter(v240, v241, v242, v243, v244, v245);
      uint64_t v248 = v247;
      swift_release(v209);
    }

    else
    {
      uint64_t v246 = 0LL;
      uint64_t v248 = 0LL;
    }

    v332[18] = v246;
    v332[19] = v248;
    v347._uint64_t countAndFlagsBits = sub_2DDCC(v289);
    sub_2DC98(v347);
    sub_62A4();
    v249._uint64_t countAndFlagsBits = 0x3A65707974202D20LL;
    v249._object = (void *)0xE900000000000020LL;
    String.append(_:)(v249);
    if (v209)
    {
      uint64_t v250 = swift_retain(v209);
      uint64_t v251 = dispatch thunk of Accessory.type.getter(v250);
      uint64_t v252 = v209;
      swift_release(v209);
      uint64_t v253 = HomeDeviceType.description.getter(v251);
    }

    else
    {
      uint64_t v252 = 0LL;
      uint64_t v253 = sub_2DE88();
    }

    uint64_t v0 = v332;
    uint64_t v255 = v332[26];
    uint64_t v256 = v332[24];
    v332[20] = v253;
    v332[21] = v254;
    v348._uint64_t countAndFlagsBits = sub_2DDCC(v291);
    sub_2DC98(v348);
    sub_1A488();
    sub_2DC7C();
    sub_1A0C8();
    swift_bridgeObjectRelease();
    Logger.debug(output:test:caller:)(v340, 1, v323);
    sub_1A090();
    sub_1A488();
    swift_release(v313);
    uint64_t v257 = ((uint64_t (*)(uint64_t, uint64_t))v326)(v255, v256);
    sub_2DE2C( v257,  v258,  v259,  v260,  v261,  v262,  v263,  v264,  v275,  v276,  v277,  v279,  v281,  v283,  v285,  v287,  v289,  v291,  v293,  v295,  outputa,  v299,  v301,  v303,  v305,  v307,  v309,  v311,  v313,  v315);
    uint64_t v152 = v252;
    goto LABEL_182;
  }

  uint64_t v210 = v332[22];
  sub_19830(v210);
  uint64_t v211 = v332[2];
  uint64_t v331 = v332[3];
  int64_t v212 = v332[5];
  unint64_t v213 = v332[6];
  int64_t v334 = (unint64_t)(v332[4] + 64LL) >> 6;
  swift_bridgeObjectRetain(v210);
  for (j = _swiftEmptyArrayStorage; ; j[v228 + 4] = v223)
  {
    do
    {
LABEL_131:
      if (v213)
      {
        unint64_t v214 = __clz(__rbit64(v213));
        v213 &= v213 - 1;
        unint64_t v215 = v214 | (v212 << 6);
      }

      else
      {
        int64_t v216 = v212 + 1;
        if (__OFADD__(v212, 1LL))
        {
          __break(1u);
          goto LABEL_194;
        }

        if (v216 >= v334) {
          goto LABEL_171;
        }
        unint64_t v217 = *(void *)(v331 + 8 * v216);
        if (!v217)
        {
          sub_2DE70();
          if (v218 == v13) {
            goto LABEL_171;
          }
          sub_2DE58();
          if (v217) {
            goto LABEL_148;
          }
          sub_2DE70();
          if (v218 == v13) {
            goto LABEL_171;
          }
          sub_2DE58();
          if (v217) {
            goto LABEL_148;
          }
          sub_2DE70();
          if (v218 == v13) {
            goto LABEL_171;
          }
          sub_2DE58();
          if (v217) {
            goto LABEL_148;
          }
          sub_2DE70();
          if (v218 == v13) {
            goto LABEL_171;
          }
          sub_2DE58();
          if (v217)
          {
LABEL_148:
            int64_t v216 = v219;
          }

          else
          {
            int64_t v216 = v220 + 5;
            if (v216 >= v334) {
              goto LABEL_171;
            }
            unint64_t v217 = *(void *)(v331 + 8 * v216);
            if (!v217)
            {
              int64_t v229 = v212 + 7;
              while (v229 < v334)
              {
                unint64_t v217 = *(void *)(v331 + 8 * v229++);
                if (v217)
                {
                  int64_t v216 = v229 - 1;
                  goto LABEL_149;
                }
              }

LABEL_171:
              uint64_t v203 = v332;
              uint64_t v232 = sub_1A0DC();
              int64_t v233 = dispatch thunk of Home.accessories.getter(v232);
              uint64_t v209 = sub_2B340(j, v233, v153, 0);
              sub_1A090();
              sub_1A15C();
              char v183 = v328;
              goto LABEL_172;
            }
          }
        }

LABEL_149:
        unint64_t v213 = (v217 - 1) & v217;
        unint64_t v215 = __clz(__rbit64(v217)) + (v216 << 6);
        int64_t v212 = v216;
      }

      uint64_t v221 = *(void **)(*(void *)(v211 + 56) + 8 * v215);
      uint64_t v222 = v221[2];
    }

    while (!v222);
    uint64_t v223 = *(void *)(*(void *)(v211 + 48) + 8 * v215);
    uint64_t v224 = v221[4];
    sub_1A0C8();
    HomeAttributeType.rawValue.getter(v224);
    if (v224 != sub_2DD6C())
    {
      if (v222 == 1) {
        goto LABEL_159;
      }
      HomeAttributeType.rawValue.getter(v221[5]);
      if (v224 != sub_2DD6C()) {
        break;
      }
    }

LABEL_160:
    sub_1A090();
    if ((swift_isUniquelyReferenced_nonNull_native(j) & 1) == 0)
    {
      sub_2BCEC(0, j[2] + 1LL, 1, (uint64_t)j, &qword_493C8, (void (*)(uint64_t, uint64_t, char *))sub_18920);
      j = v230;
    }

    unint64_t v228 = j[2];
    unint64_t v227 = j[3];
    if (v228 >= v227 >> 1)
    {
      sub_2BCEC( v227 > 1,  v228 + 1,  1,  (uint64_t)j,  &qword_493C8,  (void (*)(uint64_t, uint64_t, char *))sub_18920);
      j = v231;
    }

    j[2] = v228 + 1;
  }

  if (v222 == 2)
  {
LABEL_159:
    sub_1A090();
    goto LABEL_131;
  }

  uint64_t v225 = 6LL;
  while (1)
  {
    uint64_t v226 = v225 - 3;
    if (__OFADD__(v225 - 4, 1LL)) {
      break;
    }
    HomeAttributeType.rawValue.getter(v221[v225]);
    if (v224 == sub_2DD6C()) {
      goto LABEL_160;
    }
    ++v225;
    if (v226 == v222) {
      goto LABEL_159;
    }
  }

  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  sub_1A028();
  return sub_1A16C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.initialize overlapping range",  49LL,  v273,  (uint64_t)"Swift/UnsafePointer.swift",  v274,  v275,  v276,  v277);
}

void *sub_2A758(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v33 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v26))
  {
    uint64_t v5 = 0LL;
    unint64_t v30 = v3 & 0xC000000000000001LL;
    uint64_t v28 = v3;
    uint64_t v27 = v3 + 32;
    int64_t v6 = &type metadata for HomeAttributeType;
    uint64_t v29 = v4;
    while (1)
    {
      if (v30)
      {
        uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v28);
      }

      else
      {
        uint64_t v7 = *(void *)(v27 + 8 * v5);
        swift_retain(v7);
      }

      if (__OFADD__(v5++, 1LL)) {
        break;
      }
      uint64_t v9 = dispatch thunk of Accessory.attributes.getter();
      uint64_t v10 = *(void *)(v9 + 16);
      unint64_t v11 = sub_2DBB8();
      unint64_t v12 = v6;
      uint64_t v13 = Set.init(minimumCapacity:)(v10, v6, v11);
      uint64_t v32 = v13;
      uint64_t v14 = *(void *)(v9 + 16);
      if (v14)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          uint64_t v16 = *(void *)(v9 + 8 * i + 32);
          sub_2C884(&v31, v16);
        }

        swift_bridgeObjectRelease();
        uint64_t v17 = v32;
      }

      else
      {
        uint64_t v17 = v13;
        swift_bridgeObjectRelease();
      }

      uint64_t v18 = *(void *)(a2 + 16);
      swift_bridgeObjectRetain(a2);
      int64_t v6 = v12;
      uint64_t v19 = Set.init(minimumCapacity:)(v18, v12, v11);
      uint64_t v32 = v19;
      uint64_t v20 = *(void *)(a2 + 16);
      if (v20)
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          uint64_t v22 = *(void *)(a2 + 8 * j + 32);
          sub_2C884(&v31, v22);
        }

        swift_bridgeObjectRelease();
        uint64_t v23 = v32;
      }

      else
      {
        uint64_t v23 = v19;
        swift_bridgeObjectRelease();
      }

      uint64_t v24 = sub_2CCA0(v23, v17);
      swift_release(v7);
      swift_bridgeObjectRelease();
      uint64_t v3 = (uint64_t)&v33;
      sub_2B92C(v24);
      if (v5 == v29)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v33;
      }
    }

    __break(1u);
LABEL_21:
    if (v3 < 0) {
      uint64_t v26 = v3;
    }
    else {
      uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_2A9A0()
{
  uint64_t v1 = sub_21160();
  v0[3] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[4] = v2;
  v0[5] = sub_15A18(v2);
  uint64_t v3 = (void *)swift_task_alloc(dword_49D24);
  v0[6] = v3;
  sub_2DDC0(v3, (uint64_t)sub_2A9F0);
  return sub_2DC08();
}

uint64_t sub_2A9F0()
{
  *(void *)(v1 + 56) = v0;
  sub_1A634(v2);
  sub_11C7C();
  return sub_4DC8();
}

#error "2AC8C: call analysis failed (funcsize=208)"
uint64_t sub_2ADA0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc(dword_49D24);
  *(void *)(v1 + 24) = v2;
  sub_2DDC0(v2, (uint64_t)sub_2ADDC);
  return sub_2DC08();
}

uint64_t sub_2ADDC(uint64_t a1)
{
  return sub_4DC8();
}

uint64_t sub_2AE08()
{
  uint64_t v3 = *(void **)(v0 + 32);
  if (v3)
  {
    unint64_t v4 = dispatch thunk of Home.accessories.getter(v2);
    if (v4 >> 62)
    {
      uint64_t v1 = sub_2DC50();
      if (v1) {
        goto LABEL_4;
      }
    }

    else
    {
      sub_2DE64();
      if (v1)
      {
LABEL_4:
        if (v1 >= 1)
        {
          for (uint64_t i = 0LL; i != v1; ++i)
          {
            if ((v4 & 0xC000000000000001LL) != 0) {
              sub_2DD00(i);
            }
            else {
              sub_2DCA8();
            }
            uint64_t v6 = sub_2DE9C();
            if ((v6 & 1) != 0)
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v6);
              sub_2DE08();
              uint64_t v7 = sub_2DD34();
              specialized ContiguousArray._endMutation()(v7);
            }

            else
            {
              sub_2DDE0();
            }
          }

          sub_1A090();
LABEL_19:
          if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) == 0)
          {
            uint64_t v14 = _swiftEmptyArrayStorage[2];
            sub_8BF4();
            int64_t v15 = _swiftEmptyArrayStorage;
LABEL_21:
            swift_release(v15);
            BOOL v13 = v14 == 1;
            return (*(uint64_t (**)(BOOL))(v0 + 8))(v13);
          }

LABEL_23:
          uint64_t v17 = sub_2DE48();
          uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v17);
          swift_release_n(_swiftEmptyArrayStorage, 2LL);
          int64_t v15 = v3;
          goto LABEL_21;
        }

        __break(1u);
        goto LABEL_25;
      }
    }

    sub_1A090();
    goto LABEL_19;
  }

  if (qword_48D38 != -1) {
LABEL_25:
  }
    swift_once(&qword_48D38, sub_1FB8C);
  uint64_t v8 = sub_21160();
  sub_2DE34(v8, (uint64_t)static Log.suggestions);
  sub_1A6BC();
  sub_2DC84();
  v9._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  Logger.warning(output:test:file:function:line:)(v10, v11, v12, v9, 144LL);
  BOOL v13 = 0LL;
  return (*(uint64_t (**)(BOOL))(v0 + 8))(v13);
}

      Swift::String v10 = (v18 - 1) & v18;
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    Swift::String v10 = (v16 - 1) & v16;
    uint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    Hasher.init(_seed:)(v30, v9[5]);
    uint64_t v19 = HomeAttributeType.rawValue.getter(v18);
    Hasher._combine(_:)(v19);
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1LL << *((_BYTE *)v9 + 32);
    uint64_t v21 = result & ~v20;
    uint64_t v22 = v21 >> 6;
    if (((-1LL << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) == 0)
    {
      uint64_t v24 = 0;
      uint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        uint64_t v26 = v22 == v25;
        if (v22 == v25) {
          uint64_t v22 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
        if (v27 != -1)
        {
          uint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    uint64_t v23 = __clz(__rbit64((-1LL << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    *(void *)(v9[6] + 8 * v23) = v18;
    ++v9[2];
    if (__OFSUB__(v5--, 1LL)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }

  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_35;
  }
  uint64_t v16 = v29[v17];
  if (v16)
  {
    Swift::Bool v11 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    Swift::Bool v11 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_35;
    }
    uint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

    Swift::String v10 = (v18 - 1) & v18;
  }

  uint64_t v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_35:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_37;
  }

  uint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    uint64_t v14 = v19;
    goto LABEL_23;
  }

  while (1)
  {
    uint64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_35;
    }
    uint64_t v18 = *(void *)(v8 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }

uint64_t sub_2AFD0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc(dword_49D24);
  *(void *)(v1 + 24) = v2;
  sub_2DDC0(v2, (uint64_t)sub_2B00C);
  return sub_2DC08();
}

uint64_t sub_2B00C(uint64_t a1)
{
  return sub_4DC8();
}

uint64_t sub_2B038(uint64_t a1)
{
  if (!*(void *)(v1 + 32))
  {
    if (qword_48D38 == -1)
    {
LABEL_16:
      uint64_t v7 = sub_21160();
      sub_2DE34(v7, (uint64_t)static Log.suggestions);
      sub_1A6BC();
      sub_2DC84();
      v8._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      Logger.warning(output:test:file:function:line:)(v9, v10, v11, v8, 154LL);
      return (*(uint64_t (**)(void *))(v1 + 8))(_swiftEmptyArrayStorage);
    }

LABEL_35:
  uint64_t v23 = sub_1A0C8();
  uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v23);
  sub_2DCA0();
  if (v24 <= 1) {
    goto LABEL_39;
  }
  uint64_t v25 = sub_2DCF8();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v25);
  if (v26)
  {
    unint64_t v12 = v26;
    if (v26 < 1)
    {
      __break(1u);
      goto LABEL_39;
    }

    goto LABEL_22;
  }

  uint64_t v14 = (char *)_swiftEmptyArrayStorage;
LABEL_44:
  swift_release_n(_swiftEmptyArrayStorage, 2LL);
  uint64_t v28 = Array<A>.removeDuplicates()(v14, &type metadata for String, &protocol witness table for String);
  sub_15A64();
  swift_release(v29);
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v28);
}

uint64_t sub_2B340(void *a1, int64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = v4;
  uint64_t v74 = a3;
  uint64_t v10 = sub_21160();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v75 = (unint64_t)a1;
  uint64_t v14 = sub_2DE48();
  sub_2C4A0(v14, (uint64_t (*)(uint64_t))sub_2DB14, v15, v16, v17, v18, v19, v20);
  uint64_t v21 = v75;
  uint64_t v73 = *(void *)(v75 + 16);
  if (!v73)
  {
    sub_2DC20();
    uint64_t v23 = (uint64_t)_swiftEmptyArrayStorage;
    if ((a4 & 1) != 0) {
      goto LABEL_66;
    }
    goto LABEL_30;
  }

  int v71 = a4;
  uint64_t v69 = v11;
  uint64_t v70 = v10;
  uint64_t v67 = v6;
  uint64_t v68 = v13;
  uint64_t v5 = *(void **)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
LABEL_4:
  unint64_t v22 = 0LL;
  uint64_t v72 = v21 + 32;
  uint64_t v23 = (uint64_t)_swiftEmptyArrayStorage;
  while (1)
  {
    if (v22 >= *(void *)(v21 + 16))
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      if (a2 < 0) {
        uint64_t v52 = a2;
      }
      else {
        uint64_t v52 = a2 & 0xFFFFFFFFFFFFFF8LL;
      }
      sub_2DE10();
      uint64_t v5 = (void *)_CocoaArrayWrapper.endIndex.getter(v52);
      sub_1A488();
      goto LABEL_4;
    }

    uint64_t v24 = *(void *)(v72 + 8 * v22);
    unint64_t v75 = (unint64_t)_swiftEmptyArrayStorage;
    if (v5)
    {
      sub_2DE10();
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if ((a2 & 0xC000000000000001LL) != 0)
        {
          uint64_t v26 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
        }

        else
        {
          uint64_t v26 = *(void *)(a2 + 8LL * (void)i + 32);
          swift_retain(v26);
        }

        if ((dispatch thunk of Accessory.has(type:)(v24) & 1) != 0)
        {
          ((void (*)(void))specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique())();
          uint64_t v27 = *(void *)(v75 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v27);
          uint64_t v28 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v26);
          specialized ContiguousArray._endMutation()(v28);
        }

        else
        {
          swift_release(v26);
        }
      }

      sub_1A488();
      uint64_t v23 = v75;
    }

    if ((v23 & 0x8000000000000000LL) == 0 && (v23 & 0x4000000000000000LL) == 0)
    {
      if (*(void *)(v23 + 16)) {
        break;
      }
      goto LABEL_20;
    }

    uint64_t v29 = sub_2DCF8();
    uint64_t v30 = _CocoaArrayWrapper.endIndex.getter(v29);
    sub_2DCA0();
    if (v30) {
      break;
    }
LABEL_20:
    ++v22;
    sub_2DCA0();
    uint64_t v23 = (uint64_t)_swiftEmptyArrayStorage;
    if (v22 == v73)
    {
      sub_2DC20();
      if ((v71 & 1) != 0) {
        goto LABEL_66;
      }
LABEL_30:
      unint64_t v75 = (unint64_t)_swiftEmptyArrayStorage;
      if ((unint64_t)v23 >> 62)
      {
        if (v23 < 0) {
          uint64_t v53 = v23;
        }
        else {
          uint64_t v53 = v23 & 0xFFFFFFFFFFFFFF8LL;
        }
        sub_1A0C8();
        uint64_t v42 = _CocoaArrayWrapper.endIndex.getter(v53);
        sub_1A090();
        if (v42) {
          goto LABEL_32;
        }
      }

      else
      {
        uint64_t v42 = *(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFF8LL));
        if (v42)
        {
LABEL_32:
          unint64_t v43 = 0LL;
          a2 = v23 & 0xC000000000000001LL;
          uint64_t v72 = v23 + 32;
          uint64_t v73 = v23 & 0xFFFFFFFFFFFFFF8LL;
          do
          {
            if (a2)
            {
              uint64_t v44 = sub_2DD00(v43);
            }

            else
            {
              if (v43 >= *(void *)(v73 + 16)) {
                goto LABEL_56;
              }
              uint64_t v44 = *(void *)(v72 + 8 * v43);
              swift_retain(v44);
            }

            if (__OFADD__(v43++, 1LL)) {
              goto LABEL_53;
            }
            uint64_t v46 = dispatch thunk of Accessory.attributes.getter();
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)(v46 + 16);
            if (v48)
            {
              HomeAttributeType.rawValue.getter(*(void *)(v46 + 32));
              if (v48 != 1)
              {
                HomeAttributeType.rawValue.getter(*(void *)(v47 + 40));
                if (v5 == (void *)sub_2DD58())
                {
LABEL_43:
                  uint64_t v49 = sub_1A0A4();
                  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v49);
                  uint64_t v5 = *(void **)(v75 + 16);
                  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v5);
                  uint64_t v50 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v5, v44);
                  specialized ContiguousArray._endMutation()(v50);
                  continue;
                }

                if (v48 != 2)
                {
                  uint64_t v21 = 6LL;
                  do
                  {
                    uint64_t v51 = v21 - 3;
                    if (__OFADD__(v21 - 4, 1LL)) {
                      goto LABEL_55;
                    }
                    HomeAttributeType.rawValue.getter(*(void *)(v47 + 8 * v21));
                    ++v21;
                  }

                  while (v51 != v48);
                }
              }
            }

            swift_release(v44);
            sub_1A0A4();
          }

          while (v43 != v42);
        }
      }

      sub_1A090();
      uint64_t v23 = v75;
      goto LABEL_66;
    }
  }

  sub_2DC20();
  char v31 = v71;
  if (qword_48D38 != -1) {
    swift_once(&qword_48D38, sub_1FB8C);
  }
  uint64_t v32 = v70;
  uint64_t v33 = sub_4D70(v70, (uint64_t)static Log.suggestions);
  uint64_t v21 = (uint64_t)v68;
  uint64_t v34 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v33, v32);
  unint64_t v75 = 0LL;
  unint64_t v76 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(38LL);
  swift_bridgeObjectRelease();
  sub_2DC14();
  unint64_t v75 = (unint64_t)v35;
  unint64_t v76 = 0x80000000000367B0LL;
  v36._uint64_t countAndFlagsBits = HomeDeviceType.description.getter(v24);
  String.append(_:)(v36);
  sub_62A4();
  uint64_t v37 = v75;
  uint64_t v38 = (void *)v76;
  uint64_t v39 = *(void *)(v67 + 32);
  uint64_t v5 = *(void **)(v67 + 40);
  sub_210E0();
  v40._uint64_t countAndFlagsBits = v37;
  v40._object = v38;
  v41._uint64_t countAndFlagsBits = v39;
  v41._object = v5;
  Logger.debug(output:test:caller:)(v40, 0, v41);
  sub_62A4();
  sub_6324();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v21, v32);
  if ((v31 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_66:
  if (v23 < 0 || (v23 & 0x4000000000000000LL) != 0)
  {
    uint64_t v65 = sub_1A0C8();
    uint64_t v54 = (uint64_t)sub_195FC(v65);
    uint64_t v55 = sub_1A090();
  }

  else
  {
    uint64_t v54 = v23 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v55 = sub_1A0C8();
  }

  unint64_t v75 = v54;
  sub_2C5B8(v55, sub_2DBF4, v56, v57, v58, v59, v60, v61);
  sub_1A090();
  uint64_t v62 = v75;
  if ((v75 & 0x8000000000000000LL) != 0 || (v75 & 0x4000000000000000LL) != 0)
  {
    uint64_t v66 = sub_1A480();
    uint64_t v63 = _CocoaArrayWrapper.endIndex.getter(v66);
    sub_8BF4();
    if (v63) {
      goto LABEL_72;
    }
  }

  else
  {
    uint64_t v63 = *(void *)(v75 + 16);
    if (v63)
    {
LABEL_72:
      sub_625C(0LL, (v62 & 0xC000000000000001LL) == 0, v62);
      if ((v62 & 0xC000000000000001LL) != 0)
      {
        uint64_t v63 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v62);
      }

      else
      {
        uint64_t v63 = *(void *)(v62 + 32);
        sub_2DE50();
      }
    }
  }

  sub_8BF4();
  return v63;
}

uint64_t sub_2B864(uint64_t a1)
{
  uint64_t v1 = swift_bridgeObjectRetain(a1);
  sub_2C4A0(v1, (uint64_t (*)(uint64_t))sub_2DAD8, v2, v3, v4, v5, v6, v7);
  if (*(void *)(a1 + 16)) {
    uint64_t v8 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v8 = 0LL;
  }
  swift_release(a1);
  return v8;
}

uint64_t sub_2B8C8()
{
  return v0;
}

uint64_t sub_2B8EC()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t type metadata accessor for SuggestionEntityRetrieval()
{
  return objc_opt_self(&OBJC_CLASS____TtC29HomeAutomationSiriSuggestions25SuggestionEntityRetrieval);
}

uint64_t sub_2B92C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!isUniquelyReferenced_nonNull_native || (int64_t v8 = *(void *)(v3 + 24) >> 1, v8 < v5))
  {
    if (v4 <= v5) {
      int64_t v9 = v4 + v2;
    }
    else {
      int64_t v9 = v4;
    }
    sub_2BCEC( isUniquelyReferenced_nonNull_native,  v9,  1,  v3,  &qword_49408,  (void (*)(uint64_t, uint64_t, char *))sub_18920);
    uint64_t v3 = v10;
    int64_t v8 = *(void *)(v10 + 24) >> 1;
  }

  uint64_t v11 = *(void *)(v3 + 16);
  int64_t v12 = v8 - v11;
  uint64_t result = (uint64_t)sub_19B00(v46, (void *)(v3 + 8 * v11 + 32), v8 - v11, a1);
  if (result < v2) {
    goto LABEL_16;
  }
  if (result)
  {
    uint64_t v17 = *(void *)(v3 + 16);
    BOOL v18 = __OFADD__(v17, result);
    uint64_t v19 = v17 + result;
    if (v18)
    {
      __break(1u);
      goto LABEL_46;
    }

    *(void *)(v3 + 16) = v19;
  }

  if (result != v12)
  {
    uint64_t result = v46[0];
LABEL_14:
    uint64_t result = sub_19E28(result);
    uint64_t *v1 = v3;
    return result;
  }

LABEL_43:
              *(void *)(v3 + 16) = v12;
              goto LABEL_14;
            }
          }
        }
      }
    }

LABEL_40:
    unint64_t v20 = (v30 - 1) & v30;
    unint64_t v28 = __clz(__rbit64(v30)) + (v31 << 6);
    int64_t v16 = v31;
LABEL_41:
    uint64_t v23 = *(void *)(*(void *)(result + 48) + 8 * v28);
    if (v12 >= v26) {
      goto LABEL_42;
    }
  }

  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void sub_2BCEC( char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, char *))
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
        return;
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
  if (v12)
  {
    uint64_t v13 = sub_4D88(a5);
    uint64_t v14 = (char *)swift_allocObject(v13, 8 * v12 + 32, 7LL);
    size_t v15 = j__malloc_size(v14);
    *((void *)v14 + 2) = v11;
    *((void *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 8);
  }

  else
  {
    uint64_t v14 = (char *)_swiftEmptyArrayStorage;
  }

  int64_t v16 = v14 + 32;
  if ((a1 & 1) != 0)
  {
    a6(a4 + 32, v11, v16);
    *(void *)(a4 + 16) = 0LL;
    sub_149B4();
  }

  else
  {
    sub_2BFA0(0LL, v11, v16, a4);
  }

  sub_2DDB0();
}

void sub_2BDD0(char a1, int64_t a2, char a3, uint64_t a4)
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
        return;
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
  if (v9)
  {
    uint64_t v10 = sub_4D88(&qword_49E48);
    uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  if ((a1 & 1) != 0)
  {
    sub_18AF4((char *)(a4 + 32), v8, v13);
    *(void *)(a4 + 16) = 0LL;
    sub_149B4();
  }

  else
  {
    sub_2C06C(0LL, v8, (unint64_t)v13, a4);
  }

  sub_2DDB0();
}

char *sub_2BEB4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
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
  if (v9)
  {
    uint64_t v10 = sub_4D88(&qword_493D0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_18A90((char *)(a4 + 32), v8, v13);
    *(void *)(a4 + 16) = 0LL;
    swift_bridgeObjectRelease();
  }

  else
  {
    sub_2C188(0LL, v8, (unint64_t)v13, a4);
  }

  return v11;
}

char *sub_2BFA0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    sub_1A028();
    uint64_t v11 = "UnsafeMutablePointer.initialize with negative count";
    uint64_t v12 = 51LL;
    goto LABEL_11;
  }

  char v5 = (char *)(a4 + 8 * a1 + 32);
  unint64_t v6 = &__dst[8 * v4];
  if (v5 >= v6 || &v5[8 * v4] <= __dst)
  {
    memcpy(__dst, v5, 8 * v4);
    sub_149B4();
    return v6;
  }

  sub_1A028();
  uint64_t v11 = "UnsafeMutablePointer.initialize overlapping range";
  uint64_t v12 = 49LL;
LABEL_11:
  uint64_t result = (char *)sub_1A16C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)v11,  v12,  v9,  (uint64_t)"Swift/UnsafePointer.swift",  v10,  v13,  v14,  v15);
  __break(1u);
  return result;
}

uint64_t sub_2C06C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    sub_4D88(&qword_49E50);
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease();
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2C188(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_2C27C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2C288( uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *v8;
  unint64_t v11 = *(void *)(*v8 + 16);
  unint64_t v12 = v11 - 2;
  if (v11 >= 2)
  {
    unint64_t v13 = 0LL;
    while (1)
    {
      sub_2DBF8(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
      sub_2DE18();
      if (!v16 & v15)
      {
        sub_2DDE8();
        if (!v16 & v15)
        {
          do
            int isUniquelyReferenced_nonNull_native = sub_2DBF8( isUniquelyReferenced_nonNull_native,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v21,  v22);
          while (v9 > v22 * v11);
          uint64_t v14 = ((unint64_t)v22 * (unsigned __int128)v11) >> 64;
        }
      }

      unint64_t v9 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v9)
      {
        unint64_t v17 = *(void *)(v10 + 16);
        if (v13 >= v17) {
          goto LABEL_22;
        }
        if (v9 >= v17) {
          goto LABEL_23;
        }
        uint64_t v18 = *(void *)(v10 + 32 + 8 * v13);
        uint64_t v19 = *(void *)(v10 + 32 + 8 * v9);
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2DAEC(v10);
          uint64_t v10 = isUniquelyReferenced_nonNull_native;
        }

        unint64_t v20 = *(void *)(v10 + 16);
        if (v13 >= v20) {
          goto LABEL_24;
        }
        *(void *)(v10 + 32 + 8 * v13) = v19;
        if (v9 >= v20) {
          goto LABEL_25;
        }
        *(void *)(v10 + 32 + 8 * v9) = v18;
        *uint64_t v8 = v10;
      }

      --v11;
      BOOL v16 = v13++ == v12;
      if (v16) {
        return;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }

void sub_2C394( uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *v8;
  unint64_t v11 = *(void *)(*v8 + 16);
  unint64_t v12 = v11 - 2;
  if (v11 >= 2)
  {
    unint64_t v13 = 0LL;
    while (1)
    {
      sub_2DBF8(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
      sub_2DE18();
      if (!v16 & v15)
      {
        sub_2DDE8();
        if (!v16 & v15)
        {
          do
            int isUniquelyReferenced_nonNull_native = sub_2DBF8( isUniquelyReferenced_nonNull_native,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v21,  v22);
          while (v9 > v22 * v11);
          uint64_t v14 = ((unint64_t)v22 * (unsigned __int128)v11) >> 64;
        }
      }

      unint64_t v9 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v9)
      {
        unint64_t v17 = *(void *)(v10 + 16);
        if (v13 >= v17) {
          goto LABEL_22;
        }
        if (v9 >= v17) {
          goto LABEL_23;
        }
        __int16 v18 = *(_WORD *)(v10 + 32 + 2 * v13);
        __int16 v19 = *(_WORD *)(v10 + 32 + 2 * v9);
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2DB00(v10);
          uint64_t v10 = isUniquelyReferenced_nonNull_native;
        }

        unint64_t v20 = *(void *)(v10 + 16);
        if (v13 >= v20) {
          goto LABEL_24;
        }
        *(_WORD *)(v10 + 32 + 2 * v13) = v19;
        if (v9 >= v20) {
          goto LABEL_25;
        }
        *(_WORD *)(v10 + 32 + 2 * v9) = v18;
        *uint64_t v8 = v10;
      }

      --v11;
      BOOL v16 = v13++ == v12;
      if (v16) {
        return;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }

void sub_2C4A0( uint64_t isUniquelyReferenced_nonNull_native, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *v8;
  unint64_t v10 = *(void *)(*v8 + 16);
  unint64_t v11 = v10 - 2;
  if (v10 < 2)
  {
LABEL_18:
    sub_2DCB8();
  }

  else
  {
    unint64_t v13 = 0LL;
    while (1)
    {
      int isUniquelyReferenced_nonNull_native = sub_2DBF8( isUniquelyReferenced_nonNull_native,  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  v22,  v23);
      uint64_t v14 = ((unint64_t)v23 * (unsigned __int128)v10) >> 64;
      if (v10 > v23 * v10)
      {
        unint64_t v15 = -(uint64_t)v10 % v10;
        if (v15 > v23 * v10)
        {
          do
            int isUniquelyReferenced_nonNull_native = sub_2DBF8( isUniquelyReferenced_nonNull_native,  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  v22,  v23);
          while (v15 > v23 * v10);
          uint64_t v14 = ((unint64_t)v23 * (unsigned __int128)v10) >> 64;
        }
      }

      unint64_t v16 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v16)
      {
        unint64_t v17 = *(void *)(v9 + 16);
        if (v13 >= v17) {
          goto LABEL_20;
        }
        if (v16 >= v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(v9 + 32 + 8 * v13);
        uint64_t v19 = *(void *)(v9 + 32 + 8 * v16);
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          int isUniquelyReferenced_nonNull_native = a2(v9);
          uint64_t v9 = isUniquelyReferenced_nonNull_native;
        }

        unint64_t v20 = *(void *)(v9 + 16);
        if (v13 >= v20) {
          goto LABEL_22;
        }
        *(void *)(v9 + 32 + 8 * v13) = v19;
        if (v16 >= v20) {
          goto LABEL_23;
        }
        *(void *)(v9 + 32 + 8 * v16) = v18;
        *uint64_t v8 = v9;
      }

      --v10;
      if (v13++ == v11) {
        goto LABEL_18;
      }
    }

    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }

void sub_2C5B8( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *(void *)(*v8 + 16);
  unint64_t v10 = v9 - 2;
  if (v9 < 2)
  {
LABEL_20:
    sub_2DCB8();
  }

  else
  {
    unint64_t v12 = 0LL;
    while (1)
    {
      a1 = sub_2DBF8(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v30, v31);
      uint64_t v13 = ((unint64_t)v31 * (unsigned __int128)v9) >> 64;
      if (v9 > v31 * v9)
      {
        unint64_t v14 = -(uint64_t)v9 % v9;
        if (v14 > v31 * v9)
        {
          do
            a1 = sub_2DBF8(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v30, v31);
          while (v14 > v31 * v9);
          uint64_t v13 = ((unint64_t)v31 * (unsigned __int128)v9) >> 64;
        }
      }

      unint64_t v15 = v12 + v13;
      if (__OFADD__(v12, v13)) {
        break;
      }
      if (v12 != v15)
      {
        uint64_t v16 = *v8;
        unint64_t v17 = *(void *)(*v8 + 16);
        if (v12 >= v17) {
          goto LABEL_22;
        }
        if (v15 >= v17) {
          goto LABEL_23;
        }
        uint64_t v18 = *(void *)(v16 + 32 + 8 * v12);
        uint64_t v19 = *(void *)(v16 + 32 + 8 * v15);
        sub_2DCF8();
        swift_retain(v19);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v16);
        *uint64_t v8 = v16;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v16 = a2(v16);
          *uint64_t v8 = v16;
        }

        if (v12 >= *(void *)(v16 + 16)) {
          goto LABEL_24;
        }
        uint64_t v21 = v16 + 8 * v12;
        uint64_t v22 = *(void *)(v21 + 32);
        *(void *)(v21 + 32) = v19;
        uint64_t v23 = swift_release(v22);
        specialized ContiguousArray._endMutation()(v23);
        uint64_t v24 = *v8;
        char v25 = swift_isUniquelyReferenced_nonNull_native(*v8);
        *uint64_t v8 = v24;
        if ((v25 & 1) == 0)
        {
          uint64_t v24 = a2(v24);
          *uint64_t v8 = v24;
        }

        if (v15 >= *(void *)(v24 + 16)) {
          goto LABEL_25;
        }
        uint64_t v26 = v24 + 8 * v15;
        uint64_t v27 = *(void *)(v26 + 32);
        *(void *)(v26 + 32) = v18;
        uint64_t v28 = swift_release(v27);
        a1 = specialized ContiguousArray._endMutation()(v28);
      }

      --v9;
      if (v12++ == v10) {
        goto LABEL_20;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }

unint64_t sub_2C728(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_18F38(a2);
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
  sub_4D88(&qword_49E30);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_18F38(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for HomeDeviceType);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if ((v15 & 1) == 0) {
    return sub_2C824(v14, a2, a1, v18);
  }
  uint64_t v19 = v18[7];
  unint64_t result = swift_bridgeObjectRelease();
  *(void *)(v19 + 8 * v14) = a1;
  return result;
}

unint64_t sub_2C824(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
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

uint64_t sub_2C868(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

uint64_t sub_2C884(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  Hasher.init(_seed:)(v16, *(void *)(*v2 + 40LL));
  swift_bridgeObjectRetain(v6);
  Swift::UInt v7 = HomeAttributeType.rawValue.getter(a2);
  Hasher._combine(_:)(v7);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v16[0] = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_2D544(a2, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16[0];
    swift_bridgeObjectRelease();
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v11 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v6 + 48) + 8 * v10));
  if (v11 != HomeAttributeType.rawValue.getter(a2))
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v13 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v6 + 48) + 8 * v10));
    }

    while (v13 != HomeAttributeType.rawValue.getter(a2));
  }

  swift_bridgeObjectRelease();
  uint64_t result = 0LL;
  a2 = *(void *)(*(void *)(*v3 + 48LL) + 8 * v10);
LABEL_8:
  *a1 = a2;
  return result;
}

Swift::Int sub_2C9E8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_4D88(&qword_49E40);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v31 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    Swift::Int v8 = (void *)(v3 + 56);
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
    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      uint64_t v20 = *(void *)(*(void *)(v3 + 48) + 8 * i);
      Hasher.init(_seed:)(v32, *(void *)(v6 + 40));
      Swift::UInt v21 = HomeAttributeType.rawValue.getter(v20);
      Hasher._combine(_:)(v21);
      Swift::Int result = Hasher._finalize()();
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0LL;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
      *(void *)(*(void *)(v6 + 48) + 8 * v25) = v20;
      ++*(void *)(v6 + 16);
      if (v10) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = v8[v17];
      ++v14;
      if (!v18)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = v8[v14];
        if (!v18)
        {
          int64_t v14 = v17 + 2;
          if (v17 + 2 >= v11) {
            goto LABEL_35;
          }
          unint64_t v18 = v8[v14];
          if (!v18)
          {
            int64_t v19 = v17 + 3;
            if (v19 >= v11)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v31;
              uint64_t v30 = 1LL << *(_BYTE *)(v3 + 32);
              if (v30 > 63) {
                sub_2C868(0LL, (unint64_t)(v30 + 63) >> 6, (void *)(v3 + 56));
              }
              else {
                *Swift::Int v8 = -1LL << v30;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v18 = v8[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v14 = v19 + 1;
                if (__OFADD__(v19, 1LL)) {
                  goto LABEL_42;
                }
                if (v14 >= v11) {
                  goto LABEL_35;
                }
                unint64_t v18 = v8[v14];
                ++v19;
                if (v18) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v14 = v19;
          }
        }
      }

uint64_t sub_2CCA0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(_BYTE *)(a2 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (1LL << v4) + 63;
  uint64_t v7 = v6 >> 6;
  uint64_t v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v9 = (uint64_t *)((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL));
    sub_2C868(0LL, v7, v9);
    uint64_t v10 = sub_2CE2C((uint64_t)v9, v7, a2, v3);
    swift_release(a2);
  }

  else
  {
    int64_t v11 = (void *)swift_slowAlloc(v8, -1LL);
    sub_2C868(0LL, v7, v11);
    uint64_t v10 = sub_2CE2C((uint64_t)v11, v7, a2, v3);
    swift_release(a2);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  return v10;
}

uint64_t sub_2CE2C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v47 = (unint64_t *)result;
  unint64_t v6 = *(void *)(a3 + 16);
  unint64_t v7 = *(void *)(a4 + 16);
  uint64_t v55 = a3;
  uint64_t v8 = 0LL;
  if (v7 < v6)
  {
    int64_t v52 = 0LL;
    uint64_t v48 = a4 + 56;
    uint64_t v9 = 1LL << *(_BYTE *)(a4 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(a4 + 56);
    int64_t v49 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = a3 + 56;
    while (2)
    {
      uint64_t v51 = v8;
      while (1)
      {
        do
        {
          if (v11)
          {
            unint64_t v13 = __clz(__rbit64(v11));
            v11 &= v11 - 1;
            unint64_t v14 = v13 | (v52 << 6);
          }

          else
          {
            int64_t v15 = v52 + 1;
            if (__OFADD__(v52, 1LL))
            {
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
              return result;
            }

            if (v15 >= v49) {
              goto LABEL_62;
            }
            unint64_t v16 = *(void *)(v48 + 8 * v15);
            int64_t v17 = v52 + 1;
            if (!v16)
            {
              int64_t v17 = v52 + 2;
              if (v52 + 2 >= v49) {
                goto LABEL_62;
              }
              unint64_t v16 = *(void *)(v48 + 8 * v17);
              if (!v16)
              {
                int64_t v17 = v52 + 3;
                if (v52 + 3 >= v49) {
                  goto LABEL_62;
                }
                unint64_t v16 = *(void *)(v48 + 8 * v17);
                if (!v16)
                {
                  int64_t v18 = v52 + 4;
                  if (v52 + 4 >= v49) {
                    goto LABEL_62;
                  }
                  unint64_t v16 = *(void *)(v48 + 8 * v18);
                  if (!v16)
                  {
                    while (1)
                    {
                      int64_t v17 = v18 + 1;
                      if (__OFADD__(v18, 1LL)) {
                        goto LABEL_65;
                      }
                      if (v17 >= v49) {
                        goto LABEL_62;
                      }
                      unint64_t v16 = *(void *)(v48 + 8 * v17);
                      ++v18;
                      if (v16) {
                        goto LABEL_22;
                      }
                    }
                  }

                  int64_t v17 = v52 + 4;
                }
              }
            }

LABEL_30:
      uint64_t v5 = v55;
      v47[v23] |= v24;
      uint64_t v8 = v51 + 1;
      if (!__OFADD__(v51, 1LL)) {
        continue;
      }
      break;
    }

    __break(1u);
  }

  int64_t v30 = 0LL;
  uint64_t v50 = v5 + 56;
  uint64_t v31 = 1LL << *(_BYTE *)(v5 + 32);
  if (v31 < 64) {
    uint64_t v32 = ~(-1LL << v31);
  }
  else {
    uint64_t v32 = -1LL;
  }
  unint64_t v33 = v32 & *(void *)(v5 + 56);
  int64_t v53 = (unint64_t)(v31 + 63) >> 6;
  uint64_t v34 = a4 + 56;
  while (2)
  {
    uint64_t v51 = v8;
    while (1)
    {
      do
      {
        if (v33)
        {
          unint64_t v35 = __clz(__rbit64(v33));
          v33 &= v33 - 1;
          unint64_t v36 = v35 | (v30 << 6);
          uint64_t v5 = v55;
        }

        else
        {
          int64_t v37 = v30 + 1;
          uint64_t v5 = v55;
          if (__OFADD__(v30, 1LL)) {
            goto LABEL_64;
          }
          if (v37 >= v53) {
            goto LABEL_62;
          }
          unint64_t v38 = *(void *)(v50 + 8 * v37);
          int64_t v39 = v30 + 1;
          if (!v38)
          {
            int64_t v39 = v30 + 2;
            if (v30 + 2 >= v53) {
              goto LABEL_62;
            }
            unint64_t v38 = *(void *)(v50 + 8 * v39);
            if (!v38)
            {
              int64_t v39 = v30 + 3;
              if (v30 + 3 >= v53) {
                goto LABEL_62;
              }
              unint64_t v38 = *(void *)(v50 + 8 * v39);
              if (!v38)
              {
                int64_t v40 = v30 + 4;
                if (v30 + 4 >= v53) {
                  goto LABEL_62;
                }
                unint64_t v38 = *(void *)(v50 + 8 * v40);
                if (!v38)
                {
                  while (1)
                  {
                    int64_t v39 = v40 + 1;
                    if (__OFADD__(v40, 1LL)) {
                      goto LABEL_66;
                    }
                    if (v39 >= v53) {
                      goto LABEL_62;
                    }
                    unint64_t v38 = *(void *)(v50 + 8 * v39);
                    ++v40;
                    if (v38) {
                      goto LABEL_53;
                    }
                  }
                }

                int64_t v39 = v30 + 4;
              }
            }
          }

  __break(1u);
  return result;
}

LABEL_53:
          unint64_t v33 = (v38 - 1) & v38;
          int64_t v30 = v39;
          unint64_t v36 = __clz(__rbit64(v38)) + (v39 << 6);
        }

        uint64_t v41 = *(void *)(*(void *)(v5 + 48) + 8 * v36);
        Hasher.init(_seed:)(v54, *(void *)(a4 + 40));
        Swift::UInt v42 = HomeAttributeType.rawValue.getter(v41);
        Hasher._combine(_:)(v42);
        Swift::Int result = Hasher._finalize()();
        uint64_t v43 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v44 = result & ~v43;
      }

      while (((*(void *)(v34 + ((v44 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v44) & 1) == 0);
      uint64_t v5 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(a4 + 48) + 8 * v44));
      Swift::Int result = HomeAttributeType.rawValue.getter(v41);
      if (v5 == result) {
        break;
      }
      uint64_t v45 = ~v43;
      while (1)
      {
        unint64_t v44 = (v44 + 1) & v45;
        if (((*(void *)(v34 + ((v44 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v44) & 1) == 0) {
          break;
        }
        uint64_t v5 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(a4 + 48) + 8 * v44));
        Swift::Int result = HomeAttributeType.rawValue.getter(v41);
        if (v5 == result) {
          goto LABEL_59;
        }
      }
    }

LABEL_59:
    *(unint64_t *)((char *)v47 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v36;
    uint64_t v8 = v51 + 1;
    if (!__OFADD__(v51, 1LL)) {
      continue;
    }
    break;
  }

  __break(1u);
LABEL_62:
  swift_retain(v5);
  return sub_2D2E0(v47, a2, v51, v5);
}

Swift::Int sub_2D2E0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_35:
    swift_release(v4);
    return (Swift::Int)v9;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_4D88(&qword_49E40);
  Swift::Int result = static _SetStorage.allocate(capacity:)(v5);
  uint64_t v9 = (void *)result;
  uint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  Swift::Int v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }

    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1LL)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_35;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_35;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_35;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }

uint64_t sub_2D544(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2C9E8(v9);
  }

  else
  {
    if (v8 > v7)
    {
      Swift::Int result = (uint64_t)sub_2D6C0();
      goto LABEL_14;
    }

    sub_2D854(v9);
  }

  uint64_t v10 = *v3;
  Hasher.init(_seed:)(v20, *(void *)(*v3 + 40));
  Swift::UInt v11 = HomeAttributeType.rawValue.getter(v6);
  Hasher._combine(_:)(v11);
  Swift::Int result = Hasher._finalize()();
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = result & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v10 + 48) + 8 * a2));
    Swift::Int result = HomeAttributeType.rawValue.getter(v6);
    if (v13 == result)
    {
LABEL_13:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for HomeAttributeType);
      __break(1u);
    }

    else
    {
      uint64_t v14 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t v15 = HomeAttributeType.rawValue.getter(*(void *)(*(void *)(v10 + 48) + 8 * a2));
        Swift::Int result = HomeAttributeType.rawValue.getter(v6);
        if (v15 == result) {
          goto LABEL_13;
        }
      }
    }
  }

void *sub_2D6C0()
{
  uint64_t v1 = v0;
  sub_4D88(&qword_49E40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
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

LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }

Swift::Int sub_2D854(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_4D88(&qword_49E40);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    *uint64_t v2 = v6;
    return result;
  }

  int64_t v30 = v2;
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
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    uint64_t v20 = *(void *)(*(void *)(v3 + 48) + 8 * i);
    Hasher.init(_seed:)(v31, *(void *)(v6 + 40));
    Swift::UInt v21 = HomeAttributeType.rawValue.getter(v20);
    Hasher._combine(_:)(v21);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    *(void *)(*(void *)(v6 + 48) + 8 * v25) = v20;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      goto LABEL_39;
    }
    if (v17 >= v11) {
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }

void sub_2DAD8(uint64_t a1)
{
}

void sub_2DAEC(uint64_t a1)
{
}

void sub_2DB00(uint64_t a1)
{
}

void sub_2DB14(uint64_t a1)
{
}

unint64_t sub_2DB28()
{
  unint64_t result = qword_493C0;
  if (!qword_493C0)
  {
    uint64_t v1 = type metadata accessor for Home(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Entity, v1);
    atomic_store(result, (unint64_t *)&qword_493C0);
  }

  return result;
}

uint64_t sub_2DB68(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16),  0LL,  a1);
}

unint64_t sub_2DB7C()
{
  unint64_t result = qword_49E28;
  if (!qword_49E28)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for HomeAttributeType,  &type metadata for HomeAttributeType);
    atomic_store(result, (unint64_t *)&qword_49E28);
  }

  return result;
}

unint64_t sub_2DBB8()
{
  unint64_t result = qword_49E38;
  if (!qword_49E38)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for HomeAttributeType,  &type metadata for HomeAttributeType);
    atomic_store(result, (unint64_t *)&qword_49E38);
  }

  return result;
}

uint64_t sub_2DBF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a10 = 0LL;
  return swift_stdlib_random(&a10, 8LL);
}

uint64_t sub_2DC08()
{
  return sub_28E34();
}

  ;
}

uint64_t sub_2DC20()
{
  return swift_release(v0);
}

uint64_t sub_2DC28(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 - 8) = *v1;
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v2 - 8) = *v1;
  *(void *)(v3 + 32) = a1;
  return swift_task_dealloc(v4);
}

uint64_t sub_2DC50()
{
  if (v0 < 0) {
    return _CocoaArrayWrapper.endIndex.getter(v0);
  }
  else {
    return _CocoaArrayWrapper.endIndex.getter(v0 & 0xFFFFFFFFFFFFFF8LL);
  }
}

uint64_t sub_2DC60(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2DC7C()
{
  return sub_239AC(2LL);
}

  ;
}

void sub_2DC98(Swift::String a1)
{
}

uint64_t sub_2DCA0()
{
  return swift_release(v0);
}

uint64_t sub_2DCA8()
{
  return swift_retain(*(void *)(v0 + 8 * v1 + 32));
}

  ;
}

  ;
}

uint64_t sub_2DCF8()
{
  return swift_retain(v0);
}

uint64_t sub_2DD00(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

char *sub_2DD08@<X0>(unint64_t a1@<X8>)
{
  return sub_19300((char *)(a1 > 1), v1, 1);
}

void sub_2DD20(uint64_t a1, uint64_t a2)
{
  v4._uint64_t countAndFlagsBits = *(void *)(v3 - 152);
  v4._object = v2;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 1, v4);
}

uint64_t sub_2DD34()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v1, v0);
}

uint64_t sub_2DD40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  return swift_isUniquelyReferenced_nonNull_native(a30);
}

uint64_t sub_2DD4C()
{
  return swift_bridgeObjectRetain(*(void *)(v0 - 136));
}

uint64_t sub_2DD58()
{
  return HomeAttributeType.rawValue.getter(*(void *)(v0 - 104));
}

uint64_t sub_2DD64(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_2DD6C()
{
  return HomeAttributeType.rawValue.getter(v0);
}

uint64_t sub_2DD78(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 144))(a1, v1);
}

uint64_t sub_2DD84()
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 - 168))(v0, *(void *)(v2 - 176), v1);
}

  ;
}

  ;
}

void *sub_2DDC0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *unint64_t result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_2DDCC(uint64_t a1)
{
  return String.init<A>(describing:)(a1, v1);
}

  ;
}

uint64_t sub_2DDE0()
{
  return swift_release(v0);
}

  ;
}

char *sub_2DDFC(char *a1, int64_t a2)
{
  return sub_2BEB4(a1, a2, 1, v2);
}

uint64_t sub_2DE08()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v0);
}

uint64_t sub_2DE10()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

uint64_t sub_2DE2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  return swift_bridgeObjectRelease(a30);
}

uint64_t sub_2DE34(uint64_t a1, uint64_t a2)
{
  return sub_4D70(a1, a2);
}

uint64_t sub_2DE48()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_2DE50()
{
  return swift_retain(v0);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_2DE7C(uint64_t a1)
{
  return v2(a1, v3, v1);
}

uint64_t sub_2DE88()
{
  return 0LL;
}

uint64_t sub_2DE94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_bridgeObjectRelease(a10);
}

uint64_t sub_2DE9C()
{
  return dispatch thunk of Accessory.has(type:)(*(void *)(v0 + 16));
}

char *sub_2DEA8(char *a1, int64_t a2)
{
  return sub_19300(a1, a2, 0);
}

uint64_t sub_2DEB0()
{
  uint64_t v0 = type metadata accessor for HomeSuggestionType(0LL);
  sub_6BC0(v0, qword_4CCF8);
  uint64_t v1 = sub_7034();
  return sub_702C( v1,  enum case for HomeSuggestionType.setFanSpeed(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_2DEFC()
{
  uint64_t v0 = type metadata accessor for DialogDetails(0LL);
  sub_6BC0(v0, qword_4CD10);
  uint64_t v1 = (void *)sub_7034();
  void *v1 = &unk_49E58;
  v1[1] = 0LL;
  return sub_702C( (uint64_t)v1,  enum case for DialogDetails.catTemplateCallback(_:),  v0,  *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL));
}

uint64_t sub_2DF54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_49E64);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_14AF0;
  return sub_2DFAC(a1, a2);
}

uint64_t sub_2DFAC(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  unint64_t v3 = (*(void *)(*(void *)(sub_4D88(&qword_49188) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[26] = swift_task_alloc(v3);
  v2[27] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for CATOption(0LL);
  v2[28] = sub_15A18(*(void *)(v4 - 8));
  uint64_t v5 = sub_4D88(&qword_49118);
  v2[29] = sub_15A18(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for TemplatingResult(0LL);
  v2[30] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[31] = v7;
  v2[32] = sub_15A18(v7);
  return swift_task_switch(sub_2E060, 0LL, 0LL);
}

uint64_t sub_2E060()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_4D4C(v1, v1[3]);
  uint64_t v2 = sub_15A28();
  sub_15D68(0x656D614E6D6F6F72LL, 0xE800000000000000LL, v2, (_OWORD *)(v0 + 16));
  sub_15A64();
  if (*(void *)(v0 + 40))
  {
    int v3 = sub_15A34(v0 + 144, v0 + 16, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v4 = *(void *)(v0 + 144);
    if (!v3) {
      uint64_t v4 = 0LL;
    }
    uint64_t v30 = v4;
    if (v3) {
      uint64_t v5 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 16, &qword_49060);
    uint64_t v30 = 0LL;
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = sub_15A28();
  sub_15D68(0x7475626972747461LL, 0xE900000000000065LL, v6, (_OWORD *)(v0 + 48));
  sub_15A64();
  if (*(void *)(v0 + 72))
  {
    int v7 = sub_15A34(v0 + 160, v0 + 48, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
    uint64_t v8 = *(void *)(v0 + 160);
    if (!v7) {
      uint64_t v8 = 0LL;
    }
    uint64_t v29 = v8;
    if (v7) {
      uint64_t v9 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    sub_15994(v0 + 48, &qword_49060);
    uint64_t v29 = 0LL;
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = sub_15A28();
  sub_15D68(0x65756C6176LL, 0xE500000000000000LL, v10, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
    sub_15994(v0 + 80, &qword_49060);
LABEL_22:
    uint64_t v12 = 0LL;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_23;
  }

  uint64_t v11 = type metadata accessor for HomeAutomationEntityStateValue(0LL);
  uint64_t v12 = *(void *)(v0 + 176);
  sub_4D4C(*(void **)(v0 + 200), v1[3]);
  swift_retain(v12);
  uint64_t v13 = sub_15A3C();
  dispatch thunk of HomeAutomationEntityStateValue.mockGlobals.setter(v13);
  swift_release(v12);
  if (!v12) {
    goto LABEL_22;
  }
  swift_retain(v12);
  dispatch thunk of HomeAutomationEntityStateValue.getProperty(_:)(0x56636972656D756ELL, 0xEC00000065756C61LL);
  swift_release(v12);
  if (!*(void *)(v0 + 136))
  {
LABEL_23:
    sub_15994(v0 + 112, &qword_49060);
    goto LABEL_24;
  }

  uint64_t v14 = type metadata accessor for HomeAutomationAbstractMeasurement(0LL);
  if ((sub_15A34(v0 + 184, v0 + 112, (uint64_t)&type metadata for Any + 8, v14) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v0 + 184);
    sub_4D4C(*(void **)(v0 + 200), v1[3]);
    swift_retain(v15);
    uint64_t v16 = sub_15A3C();
    dispatch thunk of HomeAutomationAbstractMeasurement.mockGlobals.setter(v16);
    swift_release(v15);
    goto LABEL_25;
  }

ValueMetadata *type metadata accessor for SetFanSpeedSuggestion()
{
  return &type metadata for SetFanSpeedSuggestion;
}

uint64_t sub_2E484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  __int128 v13 = *(_OWORD *)(a1 + 32);
  sub_4D4C((void *)a1, v3);
  if (qword_48DF0 != -1) {
    swift_once(&qword_48DF0, sub_2DEB0);
  }
  uint64_t v4 = type metadata accessor for HomeSuggestionType(0LL);
  uint64_t v5 = sub_4D70(v4, (uint64_t)qword_4CCF8);
  uint64_t v6 = HomeSuggestionType.rawValue.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  sub_1251C(v9, 40LL);
  uint64_t v10 = sub_15E34(v6, v8);
  v14[3] = v9;
  sub_159CC( &qword_490C8,  (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator,  (uint64_t)&unk_31490);
  v14[4] = v11;
  v14[0] = v10;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v13;
  sub_1595C((void *)a2);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v14, v3, v13);
  return sub_6108(v14);
}

uint64_t sub_2E5C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_6F90(a1, a2);
}

void *sub_2E5D8()
{
  return sub_2E5EC();
}

void *sub_2E5EC()
{
  uint64_t v29 = (uint64_t)_swiftEmptyArrayStorage;
  if (qword_48D70 != -1) {
    swift_once(&qword_48D70, sub_2163C);
  }
  uint64_t v0 = qword_4CBB0;
  uint64_t v1 = unk_4CBB8;
  uint64_t v2 = sub_4D4C(qword_4CB98, qword_4CBB0);
  uint64_t v3 = *(void *)(v0 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v3 + 16))(v5);
  LOBYTE(sub_13AB4((uint64_t)va, v1) = dispatch thunk of FeatureFlagProtocol.isSiriHelpEnabled.getter(v0, v1);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v0);
  if ((v1 & 1) == 0) {
    return _swiftEmptyArrayStorage;
  }
  type metadata accessor for Signal(0LL);
  uint64_t v6 = static Signal.Fallback.getter();
  uint64_t v7 = static Signal.HomeScreen.getter();
  uint64_t v8 = static Signal.DeviceLocked.getter();
  if (qword_48C50 != -1) {
    swift_once(&qword_48C50, sub_4E04);
  }
  uint64_t v9 = qword_4C890;
  uint64_t v10 = v29;
  if ((unint64_t)v29 >> 62)
  {
    if (v29 < 0) {
      uint64_t v27 = v29;
    }
    else {
      uint64_t v27 = v29 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_2F210();
    swift_bridgeObjectRetain(v10);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8LL));
    sub_2F210();
  }

  if (__OFADD__(v11, 4LL))
  {
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v13 = sub_2E920(v11 + 4, 1);
  specialized Array._endMutation()(v13);
  uint64_t v14 = swift_retain(v6);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v14);
  sub_2F1EC();
  if (v15) {
LABEL_23:
  }
    sub_2F1D8(v12);
  uint64_t v16 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v6);
  specialized Array._endMutation()(v16);
  uint64_t v17 = swift_retain(v7);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v17);
  sub_2F1EC();
  if (v15) {
    sub_2F1D8(v18);
  }
  uint64_t v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v7);
  specialized Array._endMutation()(v19);
  uint64_t v20 = swift_retain(v8);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
  sub_2F1EC();
  if (v15) {
    sub_2F1D8(v21);
  }
  uint64_t v22 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v8);
  specialized Array._endMutation()(v22);
  uint64_t v23 = sub_2F210();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v23);
  sub_2F1EC();
  if (v15) {
    sub_2F1D8(v24);
  }
  uint64_t v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
  specialized Array._endMutation()(v25);
  swift_release(v9);
  swift_release(v8);
  swift_release(v7);
  swift_release(v6);
  return (void *)v29;
}

uint64_t sub_2E8A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = swift_dynamicCast(v6, v7, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
  if ((result & 1) != 0)
  {
    uint64_t v4 = v6[1];
    *a2 = v6[0];
    a2[1] = v4;
    uint64_t v5 = &type metadata for String;
  }

  else
  {
    *(_BYTE *)a2 = 0;
    uint64_t v5 = &type metadata for Bool;
  }

  a2[3] = v5;
  return result;
}

uint64_t sub_2E920(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *uint64_t v2 = v5;
  uint64_t v7 = 0LL;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000LL) == 0 && (v5 & 0x4000000000000000LL) == 0)
  {
    uint64_t v7 = 1LL;
  }

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v7,  v9,  a2 & 1,  v5);
  *uint64_t v2 = result;
  return result;
}

void *sub_2E9DC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v15);
  }

  else
  {
    uint64_t v7 = type metadata accessor for SuggestionParameter(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    __int128 v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    uint64_t v11 = a3[8];
    unint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_4D88(&qword_49048);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
  }

  return a1;
}

uint64_t sub_2EAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SuggestionParameter(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  sub_6108((void *)(a1 + *(int *)(a2 + 20)));
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t v6 = sub_4D88(&qword_49048);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_2EB2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionParameter(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  __int128 v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_4D88(&qword_49048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
  return a1;
}

uint64_t sub_2EBE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionParameter(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  sub_2EC8C((void *)(a1 + a3[5]), (void *)(a2 + a3[5]));
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_4D88(&qword_49048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

void *sub_2EC8C(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v11);
        *uint64_t v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

uint64_t sub_2EDF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionParameter(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = (__int128 *)(a2 + v7);
  __int128 v11 = *v10;
  __int128 v12 = v10[1];
  *(void *)(v9 + 32) = *((void *)v10 + 4);
  *(_OWORD *)uint64_t v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  uint64_t v13 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_4D88(&qword_49048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL))(v14, v15, v16);
  return a1;
}

uint64_t sub_2EEA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionParameter(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_6108((void *)(a1 + v7));
  __int128 v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_4D88(&qword_49048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40LL))(v13, v14, v15);
  return a1;
}

uint64_t sub_2EF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_2EF6C);
}

uint64_t sub_2EF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2F200();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4;
    return sub_61F4(v8, v3, v7);
  }

  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    uint64_t v7 = sub_4D88(&qword_49048);
    uint64_t v8 = v4 + *(int *)(a3 + 32);
    return sub_61F4(v8, v3, v7);
  }

  unint64_t v9 = *(void *)(v4 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_2F004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2F010);
}

uint64_t sub_2F010(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2F200();
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = v5;
  }

  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(v5 + *(int *)(a4 + 20) + 24) = (v4 - 1);
      return result;
    }

    uint64_t v9 = sub_4D88(&qword_49048);
    uint64_t v10 = v5 + *(int *)(a4 + 32);
  }

  return sub_61AC(v10, v4, v4, v9);
}

uint64_t type metadata accessor for ResolverParameterProperties(uint64_t a1)
{
  uint64_t result = qword_49EC0;
  if (!qword_49EC0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ResolverParameterProperties);
  }
  return result;
}

void sub_2F0DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionParameter(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = "(";
    void v6[2] = &unk_31E68;
    v6[3] = &unk_31E68;
    sub_2F174(319LL);
    if (v5 <= 0x3F)
    {
      v6[4] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 5LL, v6, a1 + 16);
    }
  }

void sub_2F174(uint64_t a1)
{
  if (!qword_49ED0)
  {
    uint64_t v2 = sub_6844(&qword_49060);
    unint64_t v3 = type metadata accessor for Transformer(a1, (char *)&type metadata for Any + 8, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_49ED0);
    }
  }

uint64_t sub_2F1D8@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1, v1 + 1, 1LL);
}

  ;
}

uint64_t sub_2F200()
{
  return type metadata accessor for SuggestionParameter(0LL);
}

uint64_t sub_2F210()
{
  return swift_retain(v0);
}

uint64_t _s29HomeAutomationSiriSuggestions0A14SuggestionCATsCfd_0()
{
  return CATWrapper.deinit();
}