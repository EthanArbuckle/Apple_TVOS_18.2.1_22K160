__CFString *LocalizedString(void *a1)
{
  id v1;
  __CFString *v2;
  v1 = a1;
  if (qword_C568[0] != -1) {
    dispatch_once(qword_C568, &stru_8528);
  }
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue( [(id)qword_C560 localizedStringForKey:v1 value:@"localized string not found" table:@"DriverKitSettings"]);
  if (v2 == @"localized string not found" && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_63E8((uint64_t)v1);
  }

  return v2;
}

void sub_25D8(id a1)
{
  v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS____TtC17DriverKitSettings31DriverKitSettingsViewController));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_C560;
  qword_C560 = v2;
}
}

void sub_2A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSBundleController__parent));
  [WeakRetained reloadSpecifiers];
}

id sub_2AC8()
{
  if (*(void *)v0) {
    return *(id *)v0;
  }
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = type metadata accessor for DriverManager(0LL);
  uint64_t v4 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  id result = (id)EnvironmentObject.error()(0LL, v2, v3, v4);
  __break(1u);
  return result;
}

uint64_t sub_2B2C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for DriverManager(0LL);
  uint64_t v4 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  return EnvironmentObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_2B88(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType(a1);
  uint64_t v3 = sub_2BD4( &qword_C410,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverApprovalState,  (uint64_t)&protocol conformance descriptor for DriverApprovalState);
  return ObservedObject.init(wrappedValue:)(a1, ObjectType, v3);
}

uint64_t sub_2BD4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

id sub_2C14()
{
  return *(id *)(v0 + 24);
}

void sub_2C1C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t (*sub_2C44())()
{
  return nullsub_1;
}

uint64_t sub_2C58()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = type metadata accessor for DriverApprovalState(0LL);
  uint64_t v4 = sub_2BD4( &qword_C410,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverApprovalState,  (uint64_t)&protocol conformance descriptor for DriverApprovalState);
  return ObservedObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_2CB4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2CE4(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t sub_2CE4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t sub_2CF8(char a1)
{
  char v2 = a1;
  State.init(wrappedValue:)(&v3, &v2, &type metadata for Bool);
  return v3;
}

uint64_t sub_2D30()
{
  uint64_t v0 = sub_2D74(&qword_C418);
  State.wrappedValue.getter(&v2, v0);
  return v2;
}

uint64_t sub_2D74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_2DB4(char a1)
{
  __int128 v5 = *(_OWORD *)(v1 + 48);
  char v4 = a1;
  uint64_t v2 = sub_2D74(&qword_C418);
  return State.wrappedValue.setter(&v4, v2);
}

void (*sub_2DFC(void *a1))(char **a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 48);
  sub_2ECC((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  _OWORD *v3 = v3[1];
  sub_2F14((void *)v3 + 4);
  uint64_t v4 = sub_2D74(&qword_C418);
  *((void *)v3 + 5) = v4;
  State.wrappedValue.getter((_OWORD *)((char *)v3 + 49), v4);
  return sub_2E84;
}

void sub_2E84(char **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *a1 + 16;
  char v3 = (*a1)[49];
  uint64_t v4 = *((void *)*a1 + 5);
  *(_OWORD *)uint64_t v1 = *v2;
  v1[48] = v3;
  State.wrappedValue.setter(v1 + 48, v4);
  sub_2F3C((uint64_t)v2);
  free(v1);
}

uint64_t sub_2ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2D74(&qword_C420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_2F14(void *a1)
{
  return a1;
}

uint64_t sub_2F3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2F64()
{
  return 0LL;
}

uint64_t sub_2F6C()
{
  uint64_t v0 = sub_2D74(&qword_C418);
  State.projectedValue.getter(&v2, v0);
  return v2;
}

uint64_t sub_2FB4()
{
  uint64_t v1 = type metadata accessor for SettingsApplicationRecord(0LL);
  ((void (*)(void))__chkstk_darwin)();
  char v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DriverKitDriverApp(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v10 = (char *)&v22 - v9;
  uint64_t v11 = type metadata accessor for DriverKitDriverSource(0LL);
  __chkstk_darwin(v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void *)(v0 + 24);
  uint64_t v15 = direct field offset for DriverApprovalState.driver;
  uint64_t v16 = type metadata accessor for DriverKitDriver(0LL);
  sub_4920( v14 + *(int *)(v16 + 20) + v15,  (uint64_t)v13,  (uint64_t (*)(void))&type metadata accessor for DriverKitDriverSource);
  sub_4964((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
  sub_4920((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload(v8, v4) == 1)
  {
    sub_49E4(*(void *)v8, *((void *)v8 + 1));
    uint64_t v17 = sub_55FC(4u);
    v18 = (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp;
    uint64_t v19 = (uint64_t)v10;
  }

  else
  {
    sub_49A8((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for DriverKitDriverApp);
    sub_4964( (uint64_t)v8,  (uint64_t)v3,  (uint64_t (*)(void))&type metadata accessor for SettingsApplicationRecord);
    v20 = (uint64_t *)&v3[*(int *)(v1 + 36)];
    uint64_t v17 = *v20;
    swift_bridgeObjectRetain(v20[1]);
    uint64_t v19 = (uint64_t)v3;
    v18 = (uint64_t (*)(void))&type metadata accessor for SettingsApplicationRecord;
  }

  sub_49A8(v19, v18);
  return v17;
}

uint64_t sub_31CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v53 = a1;
  uint64_t v3 = sub_2D74(&qword_C428);
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for MainActor(0LL);
  uint64_t v6 = sub_3594((uint64_t)v1);
  uint64_t v7 = static MainActor.shared.getter(v6);
  uint64_t v8 = swift_allocObject(&unk_8580, 96LL, 7LL);
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = &protocol witness table for MainActor;
  __int128 v9 = v1[1];
  *(_OWORD *)(v8 + 32) = *v1;
  *(_OWORD *)(v8 + 48) = v9;
  __int128 v10 = v1[3];
  *(_OWORD *)(v8 + 64) = v1[2];
  *(_OWORD *)(v8 + 80) = v10;
  uint64_t v11 = sub_3594((uint64_t)v1);
  uint64_t v12 = static MainActor.shared.getter(v11);
  uint64_t v13 = swift_allocObject(&unk_85A8, 96LL, 7LL);
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  __int128 v14 = v2[1];
  *(_OWORD *)(v13 + 32) = *v2;
  *(_OWORD *)(v13 + 48) = v14;
  __int128 v15 = v2[3];
  *(_OWORD *)(v13 + 64) = v2[2];
  *(_OWORD *)(v13 + 80) = v15;
  Binding.init(get:set:)(&v62, sub_35F4, v8, sub_3698, v13, &type metadata for Bool);
  uint64_t v16 = v62;
  uint64_t v17 = v63;
  uint64_t v18 = v64;
  v58 = v2;
  swift_retain(v62);
  swift_retain(v17);
  uint64_t v19 = sub_2D74(&qword_C430);
  unint64_t v20 = sub_3B48();
  v54 = v5;
  uint64_t v51 = v17;
  uint64_t v52 = v16;
  Toggle.init(isOn:label:)(v16, v17, v18, sub_37DC, v57, v19, v20);
  uint64_t v21 = sub_55FC(0xAu);
  uint64_t v23 = v22;
  uint64_t v24 = sub_2D74(&qword_C450);
  uint64_t v25 = swift_allocObject(v24, 72LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_6BF0;
  v26 = (uint64_t *)(*((void *)v2 + 3) + direct field offset for DriverApprovalState.driver);
  v27 = (uint64_t *)((char *)v26 + *(int *)(type metadata accessor for DriverKitDriver(0LL) + 24));
  uint64_t v28 = v27[1];
  if (v28)
  {
    uint64_t v29 = *v27;
    uint64_t v30 = v27[1];
  }

  else
  {
    uint64_t v29 = *v26;
    uint64_t v30 = v26[1];
    swift_bridgeObjectRetain(v30);
  }

  *(void *)(v25 + 56) = &type metadata for String;
  *(void *)(v25 + 64) = sub_3C10();
  *(void *)(v25 + 32) = v29;
  *(void *)(v25 + 40) = v30;
  swift_bridgeObjectRetain(v28);
  uint64_t v31 = String.init(format:_:)(v21, v23, v25);
  uint64_t v33 = v32;
  swift_bridgeObjectRelease(v23);
  uint64_t v60 = v31;
  uint64_t v61 = v33;
  __int128 v59 = v2[3];
  uint64_t v34 = sub_2D74(&qword_C418);
  v35 = State.projectedValue.getter(&v62, v34);
  v50[1] = v50;
  uint64_t v36 = v62;
  uint64_t v37 = v63;
  uint64_t v38 = v64;
  uint64_t v39 = __chkstk_darwin(v35);
  __chkstk_darwin(v39);
  uint64_t v40 = sub_2D74(&qword_C460);
  uint64_t v41 = sub_2D74(&qword_C468);
  uint64_t v42 = sub_4080(&qword_C470, &qword_C428, (uint64_t)&protocol conformance descriptor for Toggle<A>);
  unint64_t v43 = sub_403C();
  v49[2] = sub_4080(&qword_C480, &qword_C460, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v49[3] = sub_40C0();
  v49[0] = v42;
  v49[1] = v43;
  uint64_t v48 = v40;
  uint64_t v44 = v56;
  uint64_t v45 = v38;
  v46 = v54;
  ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(char *@<X8>), void *, double (*)@<D0>(uint64_t@<X8>), void *, uint64_t, void *, uint64_t, uint64_t))View.alert<A, B, C>(_:isPresented:actions:message:))( &v60,  v36,  v37,  v45,  sub_3EE8,  v49,  sub_3F54,  v49,  v56,  &type metadata for String,  v48,  v41);
  swift_release(v51);
  swift_release(v52);
  swift_release(v37);
  swift_release(v36);
  swift_bridgeObjectRelease(v61);
  return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v46, v44);
}

uint64_t sub_3594(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(id *)a1;
  id v7 = v3;
  sub_2CE4(v2, v4);
  swift_retain(v5);
  return a1;
}

uint64_t sub_35F4@<X0>(BOOL *a1@<X8>)
{
  __int128 v5 = *(_OWORD *)(v1 + 48);
  int v3 = DriverApprovalState.approvalState.getter(*((id *)&v5 + 1));
  uint64_t result = sub_489C((uint64_t)&v5);
  *a1 = v3 == 1;
  return result;
}

uint64_t sub_364C()
{
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release(*(void *)(v0 + 88));
  return swift_deallocObject(v0, 96LL, 7LL);
}

void sub_3698(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  int v3 = *a1;
  __int128 v13 = *(_OWORD *)(v1 + 48);
  uint64_t v4 = DriverApprovalState.updateStatus.getter(*((id *)&v13 + 1));
  sub_489C((uint64_t)&v13);
  if (v4)
  {
    swift_release(v4);
  }

  else
  {
    __int128 v16 = *(_OWORD *)(v2 + 48);
    id v5 = *((id *)&v16 + 1);
    int v6 = DriverApprovalState.approvalState.getter(v5);
    sub_489C((uint64_t)&v16);
    if (v6 == 1)
    {
      if ((v3 & 1) == 0)
      {
        id v7 = *(void **)(v2 + 32);
        if (v7)
        {
          sub_4874((uint64_t)&v16);
          id v8 = v7;
          DriverManager.setDriverState(driverApprovalState:state:)(v5, 2LL);
          sub_489C((uint64_t)&v16);
        }

        else
        {
          uint64_t v10 = *(void *)(v2 + 40);
          uint64_t v11 = type metadata accessor for DriverManager(0LL);
          uint64_t v12 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
          EnvironmentObject.error()(0LL, v10, v11, v12);
          __break(1u);
        }
      }
    }

    else if (v3)
    {
      __int128 v15 = *(_OWORD *)(v2 + 80);
      char v14 = 1;
      uint64_t v9 = sub_2D74(&qword_C418);
      State.wrappedValue.setter(&v14, v9);
    }
  }

void *sub_37DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_48C4(v3 + 32, (uint64_t)v65);
  sub_48C4((uint64_t)v65, (uint64_t)v66);
  unint64_t v4 = v67;
  id v5 = (uint64_t *)(*(void *)(v3 + 24) + direct field offset for DriverApprovalState.driver);
  int v6 = (uint64_t *)((char *)v5 + *(int *)(type metadata accessor for DriverKitDriver(0LL) + 24));
  uint64_t v7 = v6[1];
  if (v4 >= 2)
  {
    if (v7)
    {
      uint64_t v10 = *v6;
      uint64_t v11 = v6[1];
    }

    else
    {
      uint64_t v10 = *v5;
      uint64_t v11 = swift_bridgeObjectRetain(v5[1]);
    }

    *(void *)&__int128 v59 = v10;
    *((void *)&v59 + 1) = v11;
    unint64_t v42 = sub_403C();
    swift_bridgeObjectRetain(v7);
    uint64_t v52 = Text.init<A>(_:)(&v59, &type metadata for String, v42);
    uint64_t v53 = v44;
    uint64_t v54 = v43 & 1;
    uint64_t v55 = v45;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    char v58 = 0;
    uint64_t v46 = sub_2D74(&qword_C448);
    uint64_t v47 = sub_4080(&qword_C440, &qword_C448, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    uint64_t result = _ConditionalContent<>.init(storage:)( &v59,  &v52,  &type metadata for Text,  v46,  &protocol witness table for Text,  v47);
    __int128 v37 = v59;
    __int128 v38 = v60;
    __int128 v39 = v61;
    __int128 v40 = v62;
    char v41 = v63;
  }

  else
  {
    uint64_t v51 = a1;
    if (v7)
    {
      uint64_t v8 = *v6;
      uint64_t v9 = v6[1];
    }

    else
    {
      uint64_t v8 = *v5;
      uint64_t v9 = swift_bridgeObjectRetain(v5[1]);
    }

    *(void *)&__int128 v59 = v8;
    *((void *)&v59 + 1) = v9;
    unint64_t v12 = sub_403C();
    swift_bridgeObjectRetain(v7);
    uint64_t v13 = Text.init<A>(_:)(&v59, &type metadata for String, v12);
    uint64_t v48 = v14;
    uint64_t v49 = v13;
    uint64_t v50 = v15;
    uint64_t v17 = v16 & 1;
    *(void *)&__int128 v59 = sub_2FB4();
    *((void *)&v59 + 1) = v18;
    uint64_t v19 = Text.init<A>(_:)(&v59, &type metadata for String, v12);
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24 & 1;
    uint64_t v26 = static Font.subheadline.getter();
    uint64_t v27 = Text.font(_:)(v26, v19, v21, v25, v23);
    uint64_t v29 = v28;
    char v31 = v30;
    uint64_t v33 = v32;
    swift_release(v26);
    sub_4900(v19, v21, v25);
    swift_bridgeObjectRelease(v23);
    char v64 = v17;
    sub_4910(v49, v48, v17);
    swift_bridgeObjectRetain(v50);
    sub_4910(v27, v29, v31 & 1);
    swift_bridgeObjectRetain(v33);
    sub_4910(v49, v48, v17);
    swift_bridgeObjectRetain(v50);
    sub_4910(v27, v29, v31 & 1);
    swift_bridgeObjectRetain(v33);
    sub_4900(v27, v29, v31 & 1);
    swift_bridgeObjectRelease(v33);
    sub_4900(v49, v48, v64);
    swift_bridgeObjectRelease(v50);
    uint64_t v52 = v49;
    uint64_t v53 = v48;
    uint64_t v54 = v17;
    uint64_t v55 = v50;
    *(void *)&__int128 v56 = v27;
    *((void *)&v56 + 1) = v29;
    *(void *)&__int128 v57 = v31 & 1;
    *((void *)&v57 + 1) = v33;
    char v58 = 1;
    uint64_t v34 = sub_2D74(&qword_C448);
    uint64_t v35 = sub_4080(&qword_C440, &qword_C448, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)( &v59,  &v52,  &type metadata for Text,  v34,  &protocol witness table for Text,  v35);
    sub_4900(v27, v29, v31 & 1);
    swift_bridgeObjectRelease(v33);
    sub_4900(v49, v48, v17);
    uint64_t result = (void *)swift_bridgeObjectRelease(v50);
    __int128 v37 = v59;
    __int128 v38 = v60;
    __int128 v39 = v61;
    __int128 v40 = v62;
    char v41 = v63;
    a1 = v51;
  }

  *(_OWORD *)a1 = v37;
  *(_OWORD *)(a1 + 16) = v38;
  *(_OWORD *)(a1 + 32) = v39;
  *(_OWORD *)(a1 + 48) = v40;
  *(_BYTE *)(a1 + 64) = v41;
  return result;
}

unint64_t sub_3B48()
{
  unint64_t result = qword_C438;
  if (!qword_C438)
  {
    uint64_t v1 = sub_3BCC(&qword_C430);
    sub_4080(&qword_C440, &qword_C448, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_C438);
  }

  return result;
}

uint64_t sub_3BCC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_3C10()
{
  unint64_t result = qword_C458;
  if (!qword_C458)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_C458);
  }

  return result;
}

uint64_t sub_3C54@<X0>(_OWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_2D74(&qword_C490);
  __chkstk_darwin(v3);
  id v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_2D74(&qword_C498);
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v32 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v32 - v17;
  static ButtonRole.cancel.getter(v16);
  uint64_t v19 = type metadata accessor for ButtonRole(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v5, 0LL, 1LL, v19);
  uint64_t v20 = (_OWORD *)swift_allocObject(&unk_8748, 80LL, 7LL);
  __int128 v21 = a1[1];
  v20[1] = *a1;
  v20[2] = v21;
  __int128 v22 = a1[3];
  v20[3] = a1[2];
  v20[4] = v22;
  sub_3594((uint64_t)a1);
  Button.init(role:action:label:)( v5,  sub_4718,  v20,  sub_3EF0,  0LL,  &type metadata for Text,  &protocol witness table for Text);
  uint64_t v23 = (_OWORD *)swift_allocObject(&unk_8770, 80LL, 7LL);
  __int128 v24 = a1[1];
  v23[1] = *a1;
  v23[2] = v24;
  __int128 v25 = a1[3];
  v23[3] = a1[2];
  v23[4] = v25;
  sub_3594((uint64_t)a1);
  Button.init(action:label:)(sub_47A8, v23, sub_3EF8, 0LL, &type metadata for Text, &protocol witness table for Text);
  uint64_t v26 = v32;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v27(v12, v18, v6);
  v27(v9, v15, v6);
  uint64_t v28 = v33;
  v27(v33, v12, v6);
  uint64_t v29 = sub_2D74(&qword_C4A0);
  v27(&v28[*(int *)(v29 + 48)], v9, v6);
  char v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v30(v15, v6);
  v30(v18, v6);
  v30(v9, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v12, v6);
}

uint64_t sub_3EE8@<X0>(char *a1@<X8>)
{
  return sub_3C54(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_3EF0@<X0>(uint64_t a1@<X8>)
{
  return sub_3F00(0xDu, a1);
}

uint64_t sub_3EF8@<X0>(uint64_t a1@<X8>)
{
  return sub_3F00(0xCu, a1);
}

uint64_t sub_3F00@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  v9[0] = sub_55FC(a1);
  v9[1] = v3;
  unint64_t v4 = sub_403C();
  uint64_t result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

double sub_3F54@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + 24LL);
  uint64_t v4 = direct field offset for DriverApprovalState.driver;
  id v5 = (void *)(v3 + *(int *)(type metadata accessor for DriverKitDriver(0LL) + 28) + v4);
  uint64_t v6 = v5[1];
  if (v6)
  {
    *(void *)&v17[0] = *v5;
    *((void *)&v17[0] + 1) = v6;
    unint64_t v7 = sub_403C();
    swift_bridgeObjectRetain(v6);
    *(void *)&__int128 v14 = Text.init<A>(_:)(v17, &type metadata for String, v7);
    *((void *)&v14 + 1) = v8;
    *(void *)&__int128 v15 = v9 & 1;
    *((void *)&v15 + 1) = v10;
    char v16 = 0;
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    char v16 = 1;
  }

  _ConditionalContent<>.init(storage:)( v17,  &v14,  &type metadata for Text,  &type metadata for EmptyView,  &protocol witness table for Text,  &protocol witness table for EmptyView);
  double result = *(double *)v17;
  __int128 v12 = v17[1];
  char v13 = v18;
  *(_OWORD *)a1 = v17[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(_BYTE *)(a1 + 32) = v13;
  return result;
}

unint64_t sub_403C()
{
  unint64_t result = qword_C478;
  if (!qword_C478)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_C478);
  }

  return result;
}

uint64_t sub_4080(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_3BCC(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_40C0()
{
  unint64_t result = qword_C488;
  if (!qword_C488)
  {
    uint64_t v1 = sub_3BCC(&qword_C468);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_C488);
  }

  return result;
}

uint64_t sub_4124()
{
  uint64_t v0 = type metadata accessor for DriverManager(0LL);
  uint64_t v1 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  return EnvironmentObject.init()(v0, v1);
}

void *sub_416C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v14 = type metadata accessor for DriverApprovalState(0LL);
  uint64_t v15 = sub_2BD4( &qword_C410,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverApprovalState,  (uint64_t)&protocol conformance descriptor for DriverApprovalState);
  uint64_t v16 = ObservedObject.init(wrappedValue:)(a3, v14, v15);
  uint64_t v18 = v17;
  char v22 = a6;
  unint64_t result = State.init(wrappedValue:)(v23, &v22, &type metadata for Bool);
  char v20 = v23[0];
  uint64_t v21 = v23[1];
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = v16;
  *(void *)(a7 + 24) = v18;
  *(void *)(a7 + 32) = a4;
  *(void *)(a7 + 40) = a5;
  *(_BYTE *)(a7 + 48) = v20;
  *(void *)(a7 + 56) = v21;
  return result;
}

uint64_t sub_4234(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_7B74, 1LL);
}

uint64_t sub_424C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_4264@<X0>(uint64_t a1@<X8>)
{
  return sub_31CC(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for DriverKitSettingsDriverApprovalToggle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for DriverKitSettingsDriverApprovalToggle(uint64_t a1)
{
  if (*(void *)(a1 + 40) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  return swift_release(*(void *)(a1 + 56));
}

uint64_t initializeWithCopy for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = (void *)(a2 + 32);
  unint64_t v7 = *(void *)(a2 + 40);
  id v8 = v4;
  id v9 = v5;
  if (v7 >= 2)
  {
    *(void *)(a1 + 32) = *v6;
    *(void *)(a1 + 40) = v7;
    swift_bridgeObjectRetain(v7);
  }

  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  }

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v10;
  swift_retain(v10);
  return a1;
}

uint64_t assignWithCopy for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unint64_t v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  unint64_t v10 = *(void *)(a1 + 40);
  unint64_t v11 = *(void *)(a2 + 40);
  if (v10 >= 2)
  {
    if (v11 >= 2)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      uint64_t v13 = *(void *)(a2 + 40);
      *(void *)(a1 + 40) = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v10);
      goto LABEL_8;
    }

    sub_44A0(a1 + 32);
    goto LABEL_6;
  }

  if (v11 < 2)
  {
LABEL_6:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_8;
  }

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v12 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v12;
  swift_bridgeObjectRetain(v12);
LABEL_8:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v15;
  swift_retain(v15);
  swift_release(v14);
  return a1;
}

uint64_t sub_44A0(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DriverKitSettingsDriverApprovalToggle(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = (void *)(a2 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 >= 2)
  {
    unint64_t v8 = *(void *)(a2 + 40);
    if (v8 >= 2)
    {
      *(void *)(a1 + 32) = *v6;
      *(void *)(a1 + 40) = v8;
      swift_bridgeObjectRelease(v7);
      goto LABEL_6;
    }

    sub_44A0(a1 + 32);
  }

  *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
LABEL_6:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitSettingsDriverApprovalToggle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DriverKitSettingsDriverApprovalToggle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsDriverApprovalToggle()
{
  return &type metadata for DriverKitSettingsDriverApprovalToggle;
}

uint64_t sub_463C()
{
  v1[0] = sub_3BCC(&qword_C428);
  v1[1] = &type metadata for String;
  v1[2] = sub_3BCC(&qword_C460);
  v1[3] = sub_3BCC(&qword_C468);
  v1[4] = sub_4080(&qword_C470, &qword_C428, (uint64_t)&protocol conformance descriptor for Toggle<A>);
  v1[5] = sub_403C();
  v1[6] = sub_4080(&qword_C480, &qword_C460, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v1[7] = sub_40C0();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.alert<A, B, C>(_:isPresented:actions:message:)>>,  1LL);
}

uint64_t sub_4718()
{
  __int128 v4 = *(_OWORD *)(v0 + 64);
  char v3 = 0;
  uint64_t v1 = sub_2D74(&qword_C418);
  return State.wrappedValue.setter(&v3, v1);
}

uint64_t sub_4764()
{
  if (*(void *)(v0 + 56) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_release(*(void *)(v0 + 72));
  return swift_deallocObject(v0, 80LL, 7LL);
}

void sub_47A8()
{
  __int128 v9 = *(_OWORD *)(v0 + 64);
  char v8 = 0;
  uint64_t v1 = sub_2D74(&qword_C418);
  State.wrappedValue.setter(&v8, v1);
  unint64_t v2 = *(void **)(v0 + 16);
  if (v2)
  {
    __int128 v9 = *(_OWORD *)(v0 + 32);
    uint64_t v3 = *((void *)&v9 + 1);
    id v4 = v2;
    sub_4874((uint64_t)&v9);
    DriverManager.setDriverState(driverApprovalState:state:)(v3, 1LL);
    sub_489C((uint64_t)&v9);
  }

  else
  {
    uint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = type metadata accessor for DriverManager(0LL);
    uint64_t v7 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
    EnvironmentObject.error()(0LL, v5, v6, v7);
    __break(1u);
  }

uint64_t sub_4874(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_489C(uint64_t a1)
{
  return a1;
}

uint64_t sub_48C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_4900(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_4910(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_4920(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_4964(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_49A8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_49E4(uint64_t result, unint64_t a2)
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

id sub_4A28()
{
  uint64_t v1 = OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController];
LABEL_11:
    id v24 = v2;
    return v3;
  }

  id v4 = v0;
  id result = [v0 specifier];
  if (result)
  {
    uint64_t v6 = result;
    id v7 = [result propertyForKey:PSAppSettingsBundleIDKey];

    if (v7)
    {
      _bridgeAnyObjectToAny(_:)(v30, v7);
      swift_unknownObjectRelease(v7);
    }

    else
    {
      memset(v30, 0, sizeof(v30));
    }

    sub_53F4((uint64_t)v30, (uint64_t)v26);
    if (v27) {
      swift_dynamicCast(&v25, v26, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
    }
    else {
      sub_543C((uint64_t)v26);
    }
    uint64_t v8 = sub_2B28();
    uint64_t v9 = j_nullsub_1(v8);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v16 = *(void **)DriverManager.shared.unsafeMutableAddressor();
    uint64_t v17 = type metadata accessor for DriverManager(0LL);
    unint64_t v18 = sub_547C();
    id v19 = v16;
    uint64_t v20 = static ObservableObject.environmentStore.getter(v17, v18);
    v26[0] = v9;
    v26[1] = v11;
    v26[2] = v13;
    uint64_t v27 = v15;
    uint64_t v28 = v20;
    id v29 = v19;
    id v21 = objc_allocWithZone((Class)sub_2D74(&qword_C4F0));
    char v22 = (void *)UIHostingController.init(rootView:)(v26);
    uint64_t v23 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v22;
    id v3 = v22;

    id v2 = 0LL;
    goto LABEL_11;
  }

  __break(1u);
  return result;
}

uint64_t sub_4BE0()
{
  return 0LL;
}

void sub_4BE8()
{
  v43.receiver = v0;
  v43.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v43, "viewDidLoad");
  sub_55FC(0);
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  [v0 setTitle:v3];

  id v4 = sub_4A28();
  [v0 addChildViewController:v4];

  id v5 = [v0 view];
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  id v7 = sub_4A28();
  id v8 = [v7 view];

  if (!v8)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  [v6 addSubview:v8];

  id v9 = sub_4A28();
  id v10 = [v9 view];

  if (!v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v11 = sub_2D74(&qword_C4A8);
  uint64_t v12 = swift_allocObject(v11, 64LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_6CA0;
  id v13 = sub_4A28();
  id v14 = [v13 view];

  if (!v14)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  id v15 = [v14 trailingAnchor];

  id v16 = [v0 view];
  if (!v16)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v17 = v16;
  id v18 = [v16 trailingAnchor];

  id v19 = [v15 constraintEqualToAnchor:v18];
  *(void *)(v12 + 32) = v19;
  id v20 = sub_4A28();
  id v21 = [v20 view];

  if (!v21)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  id v22 = [v21 leadingAnchor];

  id v23 = [v0 view];
  if (!v23)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  id v24 = v23;
  id v25 = [v23 leadingAnchor];

  id v26 = [v22 constraintEqualToAnchor:v25];
  *(void *)(v12 + 40) = v26;
  id v27 = sub_4A28();
  id v28 = [v27 view];

  if (!v28)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  id v29 = [v28 topAnchor];

  id v30 = [v0 view];
  if (!v30)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  char v31 = v30;
  id v32 = [v30 topAnchor];

  id v33 = [v29 constraintEqualToAnchor:v32];
  *(void *)(v12 + 48) = v33;
  id v34 = sub_4A28();
  id v35 = [v34 view];

  if (!v35)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  id v36 = [v35 bottomAnchor];

  id v37 = [v0 view];
  if (v37)
  {
    __int128 v38 = v37;
    id v39 = [v37 bottomAnchor];

    id v40 = [v36 constraintEqualToAnchor:v39];
    *(void *)(v12 + 56) = v40;
    specialized Array._endMutation()();
    char v41 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    sub_505C();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    [v41 activateConstraints:isa];

    return;
  }

LABEL_23:
  __break(1u);
}

unint64_t sub_505C()
{
  unint64_t result = qword_C4B0;
  if (!qword_C4B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_C4B0);
  }

  return result;
}

id sub_50CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v7 = 0LL;
  }

  id v8 = [objc_allocWithZone(v4) initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_5140(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v3);
  *(void *)&v3[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0LL;
  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v7 = 0LL;
  }

  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_52A4(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_52E4(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  *(void *)&v1[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0LL;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_5390()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DriverKitSettingsViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC17DriverKitSettings31DriverKitSettingsViewController);
}

uint64_t sub_53F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2D74(&qword_C4E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_543C(uint64_t a1)
{
  uint64_t v2 = sub_2D74(&qword_C4E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_547C()
{
  unint64_t result = qword_C408;
  if (!qword_C408)
  {
    uint64_t v1 = type metadata accessor for DriverManager(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DriverManager, v1);
    atomic_store(result, (unint64_t *)&qword_C408);
  }

  return result;
}

BOOL sub_54C4(char a1, char a2)
{
  return a1 == a2;
}

void sub_54D4(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_54F8(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_553C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_5550()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_5594()
{
}

Swift::Int sub_55BC(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_55FC(unsigned __int8 a1)
{
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  uint64_t v4 = LocalizedString(v3);

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  return v5;
}

uint64_t sub_5668(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_56A4 + 4 * byte_6D00[a1]))( 0xD00000000000001BLL,  0x8000000000007250LL);
}

uint64_t sub_56A4()
{
  return v0 - 15;
}

unint64_t sub_5758()
{
  return 0xD000000000000030LL;
}

unint64_t sub_5784()
{
  unint64_t result = qword_C4F8;
  if (!qword_C4F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_6D18, &type metadata for LocalizedStrings);
    atomic_store(result, (unint64_t *)&qword_C4F8);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for LocalizedStrings(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizedStrings(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizedStrings(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF2) {
    return ((uint64_t (*)(void))((char *)&loc_58B4 + 4 * byte_6D13[v4]))();
  }
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_58E8 + 4 * byte_6D0E[v4]))();
}

uint64_t sub_58E8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_58F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x58F8LL);
  }
  return result;
}

uint64_t sub_5904(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x590CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 13;
  return result;
}

uint64_t sub_5910(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_5918(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_5924(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_592C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

uint64_t sub_594C@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for DriverManager(0LL);
  uint64_t v7 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  uint64_t result = EnvironmentObject.init()(v6, v7);
  *a3 = result;
  a3[1] = v9;
  a3[2] = a1;
  a3[3] = a2;
  return result;
}

uint64_t sub_59C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  sub_2CE4(v4, v3);
  uint64_t v5 = type metadata accessor for DriverManager(0LL);
  uint64_t v6 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  uint64_t result = EnvironmentObject.init()(v5, v6);
  *a1 = result;
  a1[1] = v8;
  a1[2] = v4;
  a1[3] = v3;
  return result;
}

id sub_5A30(void *a1, uint64_t a2)
{
  if (a1) {
    return a1;
  }
  uint64_t v4 = type metadata accessor for DriverManager(0LL);
  uint64_t v5 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  id result = (id)EnvironmentObject.error()(0LL, a2, v4, v5);
  __break(1u);
  return result;
}

uint64_t sub_5A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverManager(0LL);
  uint64_t v5 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
  return EnvironmentObject.projectedValue.getter(a1, a2, v4, v5);
}

uint64_t sub_5AE4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return a3;
}

uint64_t sub_5B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v7[5] = a4;
  uint64_t v4 = sub_2D74(&qword_C500);
  unint64_t v5 = sub_5C54();
  return Form.init(content:)(sub_5C48, v7, v4, v5);
}

uint64_t sub_5B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = sub_55FC(1u);
  uint64_t v22 = v8;
  unint64_t v9 = sub_403C();
  uint64_t v21 = Text.init<A>(_:)(&v21, &type metadata for String, v9);
  uint64_t v22 = v10;
  char v23 = v11 & 1;
  uint64_t v24 = v12;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v13 = sub_2D74(&qword_C518);
  unint64_t v14 = sub_5CCC();
  return Section<>.init(header:footer:content:)( v14,  &v21,  sub_6300,  v16,  &type metadata for EmptyView,  v13,  &type metadata for Text,  &protocol witness table for EmptyView,  v14,  &protocol witness table for Text);
}

uint64_t sub_5C48()
{
  return sub_5B74(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_5C54()
{
  unint64_t result = qword_C508;
  if (!qword_C508)
  {
    uint64_t v1 = sub_3BCC(&qword_C500);
    sub_5CCC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_C508);
  }

  return result;
}

unint64_t sub_5CCC()
{
  unint64_t result = qword_C510;
  if (!qword_C510)
  {
    uint64_t v1 = sub_3BCC(&qword_C518);
    sub_5D30();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_C510);
  }

  return result;
}

unint64_t sub_5D30()
{
  unint64_t result = qword_C520;
  if (!qword_C520)
  {
    unint64_t result = swift_getWitnessTable(&unk_6C00, &type metadata for DriverKitSettingsDriverApprovalToggle);
    atomic_store(result, (unint64_t *)&qword_C520);
  }

  return result;
}

uint64_t sub_5D74(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_7C1C, 1LL);
}

uint64_t sub_5D84(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_7C44, 1LL);
}

uint64_t sub_5D94@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_2D74(&qword_C518);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    id v14 = a1;
    uint64_t v15 = DriverManager.driverApprovalStates(filter:)(a3, a4);

    uint64_t v26 = v15;
    id v16 = (void *)swift_allocObject(&unk_8998, 48LL, 7LL);
    v16[2] = a1;
    v16[3] = a2;
    v16[4] = a3;
    v16[5] = a4;
    id v17 = v14;
    sub_2CE4(a3, a4);
    uint64_t v18 = sub_2D74(&qword_C540);
    uint64_t v19 = sub_4080(&qword_C548, &qword_C540, (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v20 = sub_5D30();
    uint64_t v21 = sub_2BD4( (unint64_t *)&unk_C550,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverApprovalState,  (uint64_t)&protocol conformance descriptor for DriverApprovalState);
    ForEach<>.init(_:content:)( &v26,  sub_6340,  v16,  v18,  &type metadata for String,  &type metadata for DriverKitSettingsDriverApprovalToggle,  v19,  v20,  v21);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, v10);
  }

  else
  {
    uint64_t v23 = type metadata accessor for DriverManager(0LL);
    uint64_t v24 = sub_2BD4( (unint64_t *)&qword_C408,  (uint64_t (*)(uint64_t))&type metadata accessor for DriverManager,  (uint64_t)&protocol conformance descriptor for DriverManager);
    uint64_t result = EnvironmentObject.error()(0LL, a2, v23, v24);
    __break(1u);
  }

  return result;
}

uint64_t sub_5F5C()
{
  __int128 v1 = v0[1];
  v5[1] = *v0;
  v5[2] = v1;
  uint64_t v2 = sub_2D74(&qword_C500);
  unint64_t v3 = sub_5C54();
  return Form.init(content:)(sub_63D4, v5, v2, v3);
}

__n128 initializeWithTake for DriverKitSettingsView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsView()
{
  return &type metadata for DriverKitSettingsView;
}

unint64_t destroy for DriverKitSettingsForm(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 24);
  if (result >= 2) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

void *_s17DriverKitSettings21DriverKitSettingsViewVwcp_0(void *a1, uint64_t a2)
{
  __int128 v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v5 = (void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  id v7 = v3;
  if (v6 >= 2)
  {
    a1[2] = *v5;
    a1[3] = v6;
    swift_bridgeObjectRetain(v6);
  }

  else
  {
    *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
  }

  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  unint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = *(void *)(a2 + 24);
  if (v7 >= 2)
  {
    if (v8 >= 2)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v10 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v10;
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRelease(v7);
      return a1;
    }

    sub_44A0(a1 + 16);
    goto LABEL_6;
  }

  if (v8 < 2)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v9;
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwta_0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  unint64_t v5 = a2 + 2;
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6 >= 2)
  {
    unint64_t v7 = a2[3];
    if (v7 >= 2)
    {
      *(void *)(a1 + 16) = *v5;
      *(void *)(a1 + 24) = v7;
      swift_bridgeObjectRelease(v6);
      return a1;
    }

    sub_44A0(a1 + 16);
  }

  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
  return a1;
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s17DriverKitSettings21DriverKitSettingsViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsForm()
{
  return &type metadata for DriverKitSettingsForm;
}

unint64_t sub_6290()
{
  unint64_t result = qword_C528;
  if (!qword_C528)
  {
    unint64_t result = swift_getWitnessTable(&unk_6E10, &type metadata for DriverKitSettingsForm);
    atomic_store(result, (unint64_t *)&qword_C528);
  }

  return result;
}

uint64_t sub_62D4()
{
  return sub_4080(&qword_C530, &qword_C538, (uint64_t)&protocol conformance descriptor for Form<A>);
}

uint64_t sub_6300@<X0>(uint64_t a1@<X8>)
{
  return sub_5D94(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_630C()
{
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >= 2) {
    swift_bridgeObjectRelease(v1);
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

double sub_6340@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 32);
  unint64_t v4 = *(void *)(v2 + 40);
  id v6 = *a1;
  sub_2CE4(v5, v4);
  uint64_t v7 = sub_2B28();
  uint64_t v9 = v8;
  char v10 = sub_2F64();
  sub_416C(v7, v9, (uint64_t)v6, v5, v4, v10 & 1, (uint64_t)v14);
  __int128 v11 = v14[1];
  *a2 = v14[0];
  a2[1] = v11;
  double result = *(double *)&v15;
  __int128 v13 = v16;
  a2[2] = v15;
  a2[3] = v13;
  return result;
}

void sub_63E8(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to get localized string for %@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_driverCountForAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driverCountForAppID:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_registerObserver(void *a1, const char *a2, ...)
{
  return _[a1 registerObserver];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_thirdPartyDriverCount(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDriverCount];
}

id objc_msgSend_unregisterObserver(void *a1, const char *a2, ...)
{
  return _[a1 unregisterObserver];
}