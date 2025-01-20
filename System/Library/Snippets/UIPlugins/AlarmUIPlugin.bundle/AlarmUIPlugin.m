uint64_t AlarmUIPlugin.__allocating_init()()
{
  uint64_t v0;
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t AlarmUIPlugin.deinit()
{
  return v0;
}

uint64_t AlarmUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v57 = a1;
  uint64_t v1 = type metadata accessor for AlarmConfirmation(0LL);
  uint64_t v54 = *(void *)(v1 - 8);
  uint64_t v55 = v1;
  sub_399C();
  ((void (*)(void))__chkstk_darwin)();
  sub_39C8();
  uint64_t v53 = v2;
  uint64_t v3 = sub_39A8();
  uint64_t v4 = type metadata accessor for AlarmConfirmationModel(v3);
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  sub_399C();
  ((void (*)(void))__chkstk_darwin)();
  sub_39B4();
  uint64_t v48 = v5;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v50 = (uint64_t)&v42 - v6;
  uint64_t v7 = sub_39A8();
  uint64_t v49 = type metadata accessor for AlarmSelector(v7);
  uint64_t v47 = *(void *)(v49 - 8);
  sub_399C();
  ((void (*)(void))__chkstk_darwin)();
  sub_39C8();
  uint64_t v46 = v8;
  uint64_t v9 = sub_39A8();
  uint64_t v10 = type metadata accessor for AlarmSelectorModel(v9);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  sub_399C();
  ((void (*)(void))__chkstk_darwin)();
  sub_39B4();
  uint64_t v42 = v11;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v43 = (uint64_t)&v42 - v12;
  uint64_t v13 = sub_39A8();
  uint64_t v14 = type metadata accessor for AlarmSnippet(v13);
  uint64_t v56 = *(void *)(v14 - 8);
  sub_399C();
  ((void (*)(void))__chkstk_darwin)();
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for AlarmSnippetModel(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = ((uint64_t (*)(void))__chkstk_darwin)();
  v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19);
  v23 = (char *)&v42 - v22;
  uint64_t v24 = type metadata accessor for SiriAlarmSnippetModels(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  v27 = (char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v57, v24);
  int v28 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v27, v24);
  if (v28 == enum case for SiriAlarmSnippetModels.alarmMulti(_:))
  {
    sub_3984();
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v27, v17);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
    AlarmSnippet.init(snippetModel:)(v21);
    uint64_t v29 = sub_38EC( &qword_80A0,  (uint64_t (*)(uint64_t))&type metadata accessor for AlarmSnippet,  (uint64_t)&protocol conformance descriptor for AlarmSnippet);
    uint64_t v30 = View.eraseToAnyView()(v14, v29);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v16, v14);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
    return v30;
  }

  if (v28 == enum case for SiriAlarmSnippetModels.alarmSelector(_:))
  {
    sub_3984();
    uint64_t v32 = v43;
    uint64_t v31 = v44;
    uint64_t v33 = v45;
    sub_3994(v43, (uint64_t)v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 32));
    uint64_t v34 = v42;
    sub_3994(v42, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
    uint64_t v35 = v46;
    AlarmSelector.init(snippetModel:)(v34);
    uint64_t v36 = sub_38EC( &qword_8098,  (uint64_t (*)(uint64_t))&type metadata accessor for AlarmSelector,  (uint64_t)&protocol conformance descriptor for AlarmSelector);
    uint64_t v37 = v49;
    uint64_t v30 = View.eraseToAnyView()(v49, v36);
    uint64_t v38 = v47;
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v35, v37);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
    return v30;
  }

  if (v28 == enum case for SiriAlarmSnippetModels.alarmConfirmation(_:))
  {
    sub_3984();
    uint64_t v32 = v50;
    uint64_t v31 = v51;
    uint64_t v33 = v52;
    sub_3994(v50, (uint64_t)v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 32));
    uint64_t v39 = v48;
    sub_3994(v48, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
    uint64_t v35 = v53;
    AlarmConfirmation.init(snippetModel:)(v39);
    uint64_t v40 = sub_38EC( &qword_8090,  (uint64_t (*)(uint64_t))&type metadata accessor for AlarmConfirmation,  (uint64_t)&protocol conformance descriptor for AlarmConfirmation);
    uint64_t v37 = v55;
    uint64_t v30 = View.eraseToAnyView()(v55, v40);
    uint64_t v38 = v54;
    goto LABEL_7;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v24, v24);
  __break(1u);
  return result;
}

uint64_t AlarmUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_38C0()
{
  return sub_38EC( &qword_80A8,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels,  (uint64_t)&protocol conformance descriptor for SiriAlarmSnippetModels);
}

uint64_t sub_38EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_392C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AlarmUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_3950(uint64_t a1)
{
  return AlarmUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for AlarmUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC13AlarmUIPlugin13AlarmUIPlugin);
}

uint64_t sub_3984()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 96))(v1, v2);
}

uint64_t sub_3994@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

  ;
}

uint64_t sub_39A8()
{
  return 0LL;
}

  ;
}

  ;
}

uint64_t static Placeholder.__derived_enum_equals(_:_:)()
{
  return 1LL;
}

void Placeholder.hash(into:)()
{
}

Swift::Int Placeholder.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int sub_3A50(uint64_t a1)
{
  return Hasher._finalize()();
}

unint64_t sub_3A90()
{
  unint64_t result = qword_8148;
  if (!qword_8148)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Placeholder, &type metadata for Placeholder);
    atomic_store(result, (unint64_t *)&qword_8148);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for Placeholder(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Placeholder(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_3B64 + 4 * byte_3D38[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_3B84 + 4 * byte_3D3D[v4]))();
  }
}

_BYTE *sub_3B64(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_3B84(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3B8C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3B94(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3B9C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3BA4(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_3BB0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for Placeholder()
{
  return &type metadata for Placeholder;
}