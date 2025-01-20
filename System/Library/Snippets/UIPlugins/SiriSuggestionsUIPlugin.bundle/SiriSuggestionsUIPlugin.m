uint64_t sub_4130()
{
  uint64_t v0;
  uint64_t v1;
  v0 = sub_428C();
  sub_424C(v0, static Logger.uiCategory);
  sub_41C8(v0, (uint64_t)static Logger.uiCategory);
  v1 = static Logger.subsystem.getter();
  return Logger.init(subsystem:category:)(v1);
}

uint64_t Logger.uiCategory.unsafeMutableAddressor()
{
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v0 = sub_428C();
  return sub_41C8(v0, (uint64_t)static Logger.uiCategory);
}

uint64_t sub_41C8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.uiCategory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v2 = sub_428C();
  uint64_t v3 = sub_41C8(v2, (uint64_t)static Logger.uiCategory);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t *sub_424C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_428C()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t HintComponentView.init(text1:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = sub_4A18((uint64_t)a1, v2);
  __chkstk_darwin(v4, v4);
  sub_51A8();
  uint64_t v7 = v6 - v5;
  (*(void (**)(uint64_t))(v8 + 16))(v6 - v5);
  uint64_t v9 = sub_49C8(v7, v2, v3);
  sub_4A40(a1);
  return v9;
}

uint64_t HintComponentView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_4A60(&qword_1C168);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  sub_51A8();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for Context(0LL);
  unint64_t v11 = sub_4AA0();
  swift_retain(a1);
  v12 = (void *)EnvironmentObject.init()(v10, v11);
  uint64_t v14 = v13;
  uint64_t v15 = static Alignment.center.getter();
  sub_4600(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v47, 0.0, 1, 0.0, 1, v15, v16, a1, v12, v14);
  swift_release(a1);

  unsigned int v17 = static Edge.Set.bottom.getter();
  unsigned int v18 = static Edge.Set.top.getter();
  uint64_t v19 = Edge.Set.init(rawValue:)(0LL);
  int v20 = Edge.Set.init(rawValue:)(v19);
  int v21 = Edge.Set.init(rawValue:)(v19);
  double v22 = EdgeInsets.init(_all:)(14.0);
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  unsigned int v29 = static Edge.Set.leading.getter();
  unsigned int v30 = static Edge.Set.trailing.getter();
  uint64_t v31 = Edge.Set.init(rawValue:)(0LL);
  int v32 = Edge.Set.init(rawValue:)(v31);
  int v33 = Edge.Set.init(rawValue:)(v31);
  memcpy(v46, v47, 0x88uLL);
  v45[248] = 0;
  double v34 = EdgeInsets.init(_all:)(16.0);
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  v45[256] = 0;
  uint64_t KeyPath = swift_getKeyPath(&unk_15140);
  LOBYTE(v46[17]) = v19;
  *(double *)&v46[18] = v22;
  v46[19] = v24;
  v46[20] = v26;
  v46[21] = v28;
  LOBYTE(v46[22]) = 0;
  LOBYTE(v46[23]) = v31;
  *(double *)&v46[24] = v34;
  v46[25] = v36;
  v46[26] = v38;
  v46[27] = v40;
  LOBYTE(v46[28]) = 0;
  v46[29] = KeyPath;
  LOBYTE(v46[30]) = 1;
  memcpy(v45, v46, 0xF1uLL);
  uint64_t v42 = sub_4A60(&qword_1C178);
  unint64_t v43 = sub_4B24();
  View.privacySensitive(_:)(1LL, v42, v43);
  sub_4D64(v46);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a2, v9, v4);
}

uint64_t sub_4600@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, void *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  uint64_t v19 = a17;
  uint64_t v20 = a15;
  uint64_t v21 = a14;
  double v22 = a12;
  double v23 = a10;
  uint64_t v24 = a2 & 1;
  double v25 = a1;
  if ((_DWORD)v24) {
    double v25 = -INFINITY;
  }
  uint64_t v26 = a4 & 1;
  double v27 = a3;
  if ((_DWORD)v26) {
    double v27 = v25;
  }
  uint64_t v28 = a6 & 1;
  uint64_t v29 = a8 & 1;
  double v30 = a5;
  if ((a6 & 1) != 0) {
    double v30 = v27;
  }
  if (v25 > v27 || v27 > v30) {
    goto LABEL_22;
  }
  double v32 = a7;
  if ((a8 & 1) != 0) {
    double v32 = -INFINITY;
  }
  double v33 = a10;
  if ((a11 & 1) != 0) {
    double v33 = v32;
  }
  double v34 = a12;
  if ((a13 & 1) != 0) {
    double v34 = v33;
  }
  if (v32 > v33 || v33 > v34)
  {
LABEL_22:
    double v45 = a7;
    double v46 = a5;
    double v43 = a1;
    double v44 = a3;
    unsigned int v42 = v24;
    unsigned int v41 = v26;
    uint64_t v36 = static os_log_type_t.fault.getter();
    uint64_t v37 = (void *)static Log.runtimeIssuesLog.getter();
    uint64_t v38 = v36;
    uint64_t v19 = a17;
    os_log(_:dso:log:_:_:)( v38,  &dword_0,  v37,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v26 = v41;
    uint64_t v21 = a14;
    uint64_t v20 = a15;
    uint64_t v24 = v42;
    double v23 = a10;
    double v22 = a12;
    a1 = v43;
    a3 = v44;
    a7 = v45;
    a5 = v46;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v24,  *(void *)&a3,  v26,  *(void *)&a5,  v28,  *(void *)&a7,  v29,  *(void *)&v23,  a11 & 1,  *(void *)&v22,  a13 & 1,  v21,  v20);
  *a9 = a16;
  a9[1] = v19;
  a9[2] = a18;
  memcpy(a9 + 3, __src, 0x70uLL);
  id v39 = v19;
  return swift_retain(a16);
}

uint64_t sub_4798()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_47AC()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_47C0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_47D8@<X0>(uint64_t a1@<X8>)
{
  return HintComponentView.body.getter(*v1, a1);
}

uint64_t sub_47E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_4A60(&qword_1C1E0);
  __chkstk_darwin(v4, v5);
  sub_51A8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = static Font.subheadline.getter();
  uint64_t v10 = type metadata accessor for Font.Leading(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  sub_51A8();
  uint64_t v15 = v14 - v13;
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v14 - v13, enum case for Font.Leading.tight(_:), v10);
  uint64_t v16 = Font.leading(_:)(v15, v9);
  swift_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v10);
  uint64_t KeyPath = swift_getKeyPath(&unk_15278);
  uint64_t v18 = sub_4A60(&qword_1C1E8);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16LL))(v8, a1, v18);
  uint64_t v20 = (uint64_t *)(v8 + *(int *)(v4 + 36));
  *uint64_t v20 = KeyPath;
  v20[1] = v16;
  uint64_t v21 = static Color.gray.getter(v19);
  sub_4FB8(v8, a2);
  *(void *)(a2 + *(int *)(sub_4A60(&qword_1C1F0) + 36)) = v21;
  return sub_5000(v8);
}

uint64_t sub_4944()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_4958()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_496C()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

void sub_4988()
{
  *uint64_t v0 = sub_51C0();
  sub_51B8();
}

void sub_49A4(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  EnvironmentValues.font.setter(v1);
  sub_51B8();
}

uint64_t sub_49C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = dispatch thunk of AnyViewConvertible.asAnyView()(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  return v5;
}

uint64_t sub_4A18(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_4A40(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4A60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_4AA0()
{
  unint64_t result = qword_1C170;
  if (!qword_1C170)
  {
    uint64_t v1 = type metadata accessor for Context(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Context, v1);
    atomic_store(result, (unint64_t *)&qword_1C170);
  }

  return result;
}

void sub_4AE0(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.multilineTextAlignment.getter();
  sub_51B8();
}

void sub_4B04(unsigned __int8 *a1)
{
}

unint64_t sub_4B24()
{
  unint64_t result = qword_1C180;
  if (!qword_1C180)
  {
    uint64_t v1 = sub_4BC8(&qword_1C178);
    sub_4C30(&qword_1C188, &qword_1C190, (void (*)(void))sub_4C0C);
    sub_5164( &qword_1C1D0,  &qword_1C1D8,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C180);
  }

  return result;
}

uint64_t sub_4BC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_4C0C()
{
  return sub_4C30(&qword_1C198, &qword_1C1A0, (void (*)(void))sub_4C98);
}

uint64_t sub_4C30(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_4BC8(a2);
    a3();
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_4C98()
{
  return sub_4C30(&qword_1C1A8, &qword_1C1B0, (void (*)(void))sub_4CBC);
}

unint64_t sub_4CBC()
{
  unint64_t result = qword_1C1B8;
  if (!qword_1C1B8)
  {
    uint64_t v1 = sub_4BC8(&qword_1C1C0);
    sub_4D28();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C1B8);
  }

  return result;
}

unint64_t sub_4D28()
{
  unint64_t result = qword_1C1C8;
  if (!qword_1C1C8)
  {
    unint64_t result = swift_getWitnessTable("9>", &type metadata for TextAppearanceModifier);
    atomic_store(result, (unint64_t *)&qword_1C1C8);
  }

  return result;
}

uint64_t *sub_4D64(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[1];
  swift_release(a1[29]);
  swift_release(v2);

  return a1;
}

uint64_t sub_4DA4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of HintComponentView.body>>,  1LL);
}

ValueMetadata *type metadata accessor for HintComponentView()
{
  return &type metadata for HintComponentView;
}

uint64_t sub_4DC4()
{
  v1[0] = sub_4BC8(&qword_1C178);
  v1[1] = sub_4B24();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
}

void *initializeBufferWithCopyOfBuffer for TextAppearanceModifier(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for TextAppearanceModifier(id *a1)
{
}

uint64_t assignWithCopy for TextAppearanceModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

__n128 initializeWithTake for TextAppearanceModifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for TextAppearanceModifier(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for TextAppearanceModifier(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }

    else
    {
      uint64_t v3 = *a1;
      int v2 = v3 - 1;
      if (v2 < 0) {
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

uint64_t storeEnumTagSinglePayload for TextAppearanceModifier( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TextAppearanceModifier()
{
  return &type metadata for TextAppearanceModifier;
}

uint64_t sub_4F88(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_16B34, 1LL);
}

void sub_4F98()
{
  *uint64_t v0 = sub_51C0();
  sub_51B8();
}

uint64_t sub_4FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4A60(&qword_1C1E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5000(uint64_t a1)
{
  uint64_t v2 = sub_4A60(&qword_1C1E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_5044()
{
  unint64_t result = qword_1C1F8;
  if (!qword_1C1F8)
  {
    uint64_t v1 = sub_4BC8(&qword_1C1F0);
    sub_50C8();
    sub_5164(&qword_1C220, &qword_1C228, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C1F8);
  }

  return result;
}

unint64_t sub_50C8()
{
  unint64_t result = qword_1C200;
  if (!qword_1C200)
  {
    uint64_t v1 = sub_4BC8(&qword_1C1E0);
    sub_5164(&qword_1C208, &qword_1C1E8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_5164( (unint64_t *)&qword_1C210,  &qword_1C218,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C200);
  }

  return result;
}

uint64_t sub_5164(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_4BC8(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

  ;
}

  ;
}

uint64_t sub_51C0()
{
  return EnvironmentValues.font.getter();
}

uint64_t *sub_51CC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v23);
  }

  else
  {
    uint64_t v7 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (char *)a1 + v9;
    uint64_t v15 = (char *)a2 + v9;
    *uint64_t v14 = *v15;
    uint64_t v16 = *((void *)v15 + 1);
    *((void *)v14 + 1) = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for ActionHandler(0LL);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16LL);
    id v22 = v13;
    swift_retain(v16);
    v21(v18, v19, v20);
  }

  return a1;
}

uint64_t sub_52C0(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);

  swift_release(*(void *)(a1 + a2[6] + 8));
  uint64_t v5 = a1 + a2[7];
  uint64_t v6 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_5338(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = a1 + v8;
  uint64_t v14 = a2 + v8;
  *(_BYTE *)uint64_t v13 = *(_BYTE *)v14;
  uint64_t v15 = *(void *)(v14 + 8);
  *(void *)(v13 + 8) = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for ActionHandler(0LL);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16LL);
  id v21 = v12;
  swift_retain(v15);
  v20(v17, v18, v19);
  return a1;
}

uint64_t sub_5400(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(_BYTE *)uint64_t v14 = *(_BYTE *)v15;
  uint64_t v16 = *(void *)(v14 + 8);
  uint64_t v17 = *(void *)(v15 + 8);
  *(void *)(v14 + 8) = v17;
  swift_retain(v17);
  swift_release(v16);
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24LL))(v19, v20, v21);
  return a1;
}

uint64_t sub_54D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  return a1;
}

uint64_t sub_5568(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(_BYTE *)uint64_t v12 = *(_BYTE *)v13;
  uint64_t v14 = *(void *)(v12 + 8);
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release(v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40LL))(v16, v17, v18);
  return a1;
}

uint64_t sub_5634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5640);
}

void sub_5640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_D198();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
  }

  else
  {
    if ((_DWORD)a2 == 2147483646)
    {
      sub_D254(*(void *)(a1 + *(int *)(a3 + 20)));
      sub_D2FC();
      return;
    }

    uint64_t v7 = sub_D190();
    uint64_t v8 = a1 + *(int *)(a3 + 28);
  }

  sub_D2C4(v8, a2, v7);
}

uint64_t sub_56B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_56C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_56D0);
}

void sub_56D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_D198();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      sub_D2FC();
      return;
    }

    uint64_t v9 = sub_D190();
    uint64_t v10 = a1 + *(int *)(a4 + 28);
  }

  sub_D2D0(v10, a2, a2, v9);
}

uint64_t sub_5750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t type metadata accessor for SiriHelpSMARTView(uint64_t a1)
{
  return sub_5CFC(a1, qword_1C288, (uint64_t)&nominal type descriptor for SiriHelpSMARTView);
}

uint64_t sub_5770(uint64_t a1)
{
  uint64_t result = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = &unk_15308;
    v5[2] = &unk_15308;
    uint64_t result = type metadata accessor for ActionHandler(319LL);
    if (v4 <= 0x3F)
    {
      v5[3] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 4LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

char *sub_5800(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16LL) & ~(unint64_t)v3];
    swift_retain(v4);
  }

  else
  {
    uint64_t v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = type metadata accessor for ActionHandler(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
  }

  return v7;
}

uint64_t sub_58D8(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
}

void *sub_594C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
  return a1;
}

uint64_t sub_59F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24LL))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24LL))(v14, v15, v16);
  return a1;
}

_OWORD *sub_5AA0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
  return a1;
}

uint64_t sub_5B38(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_5BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5BEC);
}

void sub_5BEC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    sub_D254(*a1);
    sub_D2FC();
  }

  else
  {
    uint64_t v6 = sub_D198();
    if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v7 = sub_D190();
      uint64_t v8 = *(int *)(a3 + 24);
    }

    sub_D2C4((uint64_t)a1 + v8, a2, v7);
  }
}

uint64_t sub_5C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5C6C);
}

void sub_5C6C(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 2147483646)
  {
    *a1 = a2;
    sub_D2FC();
  }

  else
  {
    uint64_t v8 = sub_D198();
    if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v9 = sub_D190();
      uint64_t v10 = *(int *)(a4 + 24);
    }

    sub_D2D0((uint64_t)a1 + v10, a2, a2, v9);
  }

uint64_t type metadata accessor for SiriHelpSnippetView(uint64_t a1)
{
  return sub_5CFC(a1, qword_1C320, (uint64_t)&nominal type descriptor for SiriHelpSnippetView);
}

uint64_t sub_5CFC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_5D2C(uint64_t a1)
{
  v5[0] = &unk_15308;
  uint64_t result = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(319LL);
  if (v3 <= 0x3F)
  {
    v5[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for ActionHandler(319LL);
    if (v4 <= 0x3F)
    {
      v5[2] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 3LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_5DBC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_16BD4, 1LL);
}

void sub_5DCC(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = (int *)sub_4A60(&qword_1C458);
  sub_D09C(a1[1], a2 + v4[12], &qword_1C398);
  sub_D09C(a1[2], a2 + v4[16], &qword_1C3A8);
  sub_D09C(a1[3], a2 + v4[20], &qword_1C3C8);
  sub_D09C(a1[4], a2 + v4[24], &qword_1C3A8);
  sub_D09C(a1[5], a2 + v4[28], &qword_1C3D0);
  sub_D09C(a1[6], a2 + v4[32], &qword_1C3D8);
}

uint64_t sub_5EA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ImageElement(0LL);
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for SiriHelpSnippetView(0LL);
  uint64_t v21 = SuggestionsRFDataModels.SuggestionHelpDataModel.appBundleId.getter();
  uint64_t v11 = v10;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))( v5,  enum case for ImageElement.ImageStyle.default(_:),  v1);
  uint64_t v12 = sub_4A60(&qword_1C4A8);
  uint64_t v13 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (v15 + 32) & ~v15;
  uint64_t v17 = swift_allocObject(v12, v16 + *(void *)(v14 + 72), v15 | 7);
  *(_OWORD *)(v17 + 16) = xmmword_152B0;
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v17 + v16, enum case for _ProtoIdiom.default(_:), v13);
  uint64_t v18 = sub_C09C(v17);
  static ImageElement.appIcon(_:imageStyle:idioms:)(v21, v11, v5, v18);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  VisualPropertyConvertible<>.asVisualProperty()( v6,  &protocol witness table for ImageElement,  &protocol witness table for ImageElement);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v9, v6);
}

uint64_t sub_607C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v83 = a2;
  uint64_t v3 = type metadata accessor for SiriHelpSnippetView(0LL);
  uint64_t v77 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v78 = v5;
  uint64_t v80 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriHelpSuggestion(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (char *)&v63 - v14;
  uint64_t v16 = SiriHelpSuggestion.formattedDisplayText.getter(v13);
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v84 = a1;
  v67 = v19;
  uint64_t v20 = ((uint64_t (*)(char *, uint64_t, uint64_t))v19)(v15, a1, v6);
  if (!v18)
  {
    uint64_t v16 = SiriHelpSuggestion.displayText.getter(v20);
    uint64_t v18 = v21;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  uint64_t v93 = v16;
  uint64_t v94 = v18;
  unint64_t v22 = sub_C468();
  uint64_t v23 = Text.init<A>(_:)(&v93, &type metadata for String, v22);
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v64 = v6;
  int v29 = v28 & 1;
  uint64_t v79 = sub_4A60(&qword_1C480);
  v82 = &v63;
  uint64_t v81 = *(void *)(v79 - 8);
  __chkstk_darwin(v79, v30);
  v73 = (char *)&v63 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v71 = sub_4A60(&qword_1C488);
  v75 = &v63;
  uint64_t v72 = *(void *)(v71 - 8);
  __chkstk_darwin(v71, v32);
  double v34 = (char *)&v63 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = type metadata accessor for SimpleItemReverseRichView(0LL);
  v66 = &v63;
  uint64_t v65 = *(void *)(v35 - 8);
  __chkstk_darwin(v35, v36);
  uint64_t v38 = (char *)&v63 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v95 = &type metadata for Text;
  v96 = &protocol witness table for Text;
  uint64_t v39 = swift_allocObject(&unk_19128, 48LL, 7LL);
  uint64_t v93 = v39;
  uint64_t v70 = v23;
  *(void *)(v39 + 16) = v23;
  *(void *)(v39 + 24) = v25;
  uint64_t v69 = v25;
  int v68 = v29;
  *(_BYTE *)(v39 + 32) = v29;
  uint64_t v74 = v27;
  *(void *)(v39 + 40) = v27;
  uint64_t v92 = 0LL;
  memset(v91, 0, sizeof(v91));
  uint64_t v90 = 0LL;
  memset(v89, 0, sizeof(v89));
  uint64_t v88 = 0LL;
  memset(v87, 0, sizeof(v87));
  uint64_t v86 = 0LL;
  memset(v85, 0, sizeof(v85));
  swift_bridgeObjectRetain(v27);
  sub_C898(v23, v25, v29);
  SimpleItemReverseRichView.init(text1:text2:text3:text4:thumbnail:)(&v93, v91, v89, v87, v85);
  uint64_t v40 = v64;
  v67(v11, v84, v64);
  uint64_t v41 = v80;
  sub_C9F8(v76, v80, type metadata accessor for SiriHelpSnippetView);
  uint64_t v42 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v43 = (v42 + 16) & ~v42;
  uint64_t v44 = *(unsigned __int8 *)(v77 + 80);
  uint64_t v45 = (v8 + v44 + v43) & ~v44;
  uint64_t v46 = swift_allocObject(&unk_191C8, v45 + v78, v42 | v44 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v46 + v43, v11, v40);
  sub_CA28(v41, v46 + v45, type metadata accessor for SiriHelpSnippetView);
  sub_CEF8(&qword_1C490, (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemReverseRichView);
  uint64_t v48 = v47;
  View.onTapGesture(count:perform:)(1LL, sub_C940, v46, v35, v47);
  swift_release(v46);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v35);
  uint64_t v93 = v35;
  uint64_t v94 = v48;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v93,  &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>,  1LL);
  v50 = v73;
  uint64_t v51 = v71;
  View.componentSpacing(top:bottom:)(v71, OpaqueTypeConformance2, 12.0, 12.0);
  uint64_t v52 = v51;
  uint64_t v53 = (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v34, v51);
  uint64_t v54 = SiriHelpSuggestion.suggestionId.getter(v53);
  if (v55) {
    uint64_t v56 = v54;
  }
  else {
    uint64_t v56 = 0LL;
  }
  if (v55) {
    unint64_t v57 = v55;
  }
  else {
    unint64_t v57 = 0xE000000000000000LL;
  }
  uint64_t v58 = sub_4A60(&qword_1C498);
  v59 = v83;
  v83[3] = v58;
  uint64_t v93 = v52;
  uint64_t v94 = OpaqueTypeConformance2;
  uint64_t v60 = swift_getOpaqueTypeConformance2( &v93,  &opaque type descriptor for <<opaque return type of View.componentSpacing(top:bottom:)>>,  1LL);
  uint64_t v61 = v79;
  uint64_t v93 = v79;
  uint64_t v94 = v60;
  v59[4] = swift_getOpaqueTypeConformance2( &v93,  &opaque type descriptor for <<opaque return type of View.componentName(_:)>>,  1LL);
  sub_C72C(v59);
  View.componentName(_:)(v56, v57, v61, v60);
  sub_C4D4(v70, v69, v68);
  swift_bridgeObjectRelease(v57);
  swift_bridgeObjectRelease(v74);
  return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v50, v61);
}

void sub_6640(uint64_t *a1, uint64_t a2)
{
  uint64_t v62 = a2;
  uint64_t v3 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v58 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Command(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v59 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for SiriHelpSuggestion(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  sub_41C8(v15, (uint64_t)static Logger.uiCategory);
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t *, uint64_t))(v11 + 16))(v14, a1, v10);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc(12LL, -1LL);
    uint64_t v55 = v7;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    unint64_t v57 = a1;
    uint64_t v22 = v21;
    uint64_t v64 = v21;
    uint64_t v56 = v6;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v23 = ((uint64_t (*)(void))SiriHelpSuggestion.suggestionId.getter)();
    if (v24)
    {
      unint64_t v25 = v24;
    }

    else
    {
      uint64_t v23 = 0LL;
      unint64_t v25 = 0xE000000000000000LL;
    }

    uint64_t v63 = sub_DF60(v23, v25, &v64);
    uint64_t v6 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    _os_log_impl(&dword_0, v17, v18, "SiriHelp Component was tapped for suggestionID: %s", v20, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    uint64_t v26 = v20;
    uint64_t v7 = v55;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }

  uint64_t v27 = v59;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v59, enum case for Command.noOp(_:), v6);
  uint64_t v28 = type metadata accessor for InteractionType(0LL);
  unint64_t v57 = &v55;
  __chkstk_darwin(v28, v29);
  uint64_t v31 = (char *)&v55 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v32 + 104))(v31, enum case for InteractionType.buttonTapped(_:));
  uint64_t v33 = sub_4A60(&qword_1C4A0);
  uint64_t v35 = __chkstk_darwin(v33, v34);
  uint64_t v37 = (char *)&v55 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static ComponentType.customCanvas.getter(v35);
  uint64_t v38 = type metadata accessor for ComponentType(0LL);
  sub_5750((uint64_t)v37, 0LL, 1LL, v38);
  uint64_t v40 = v60;
  uint64_t v39 = v61;
  uint64_t v41 = v58;
  uint64_t v42 = (*(uint64_t (**)(char *, void, uint64_t))(v60 + 104))( v58,  enum case for DeliveryVehicle.siriHelp(_:),  v61);
  uint64_t v43 = SiriHelpSuggestion.suggestionId.getter(v42);
  if (v44)
  {
    unint64_t v45 = v44;
  }

  else
  {
    uint64_t v43 = 0LL;
    unint64_t v45 = 0xE000000000000000LL;
  }

  unint64_t v46 = v45;
  Swift::String v47 = DeliveryVehicle.getComponentName(suggestionId:)(*(Swift::String *)&v43);
  swift_bridgeObjectRelease(v45);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
  id v48 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed(0LL));
  uint64_t v49 = RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)( 0x706C6548706174LL,  0xE700000000000000LL,  v27,  v31,  v37,  v47._countAndFlagsBits,  v47._object,  0LL,  1);
  if (*(void *)v62)
  {
    v50 = (void *)v49;
    id v51 = *(id *)v62;
    dispatch thunk of Context.emit(_:)(v50);
  }

  else
  {
    uint64_t v52 = *(void *)(v62 + 8);
    uint64_t v53 = type metadata accessor for Context(0LL);
    sub_CEF8((unint64_t *)&qword_1C170, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    EnvironmentObject.error()(0LL, v52, v53, v54);
    __break(1u);
  }

void sub_6AD4()
{
  uint64_t v1 = sub_D38C();
  uint64_t v3 = __chkstk_darwin(v1, v2);
  sub_D1C8(v3, v4, v5, v6, v7, v8, v9, v10, v15);
  sub_D308();
  uint64_t v13 = swift_allocObject(&unk_190B0, v11, v12);
  sub_D2DC(v13);
  uint64_t v14 = sub_4A60(&qword_1C360);
  sub_D120(&qword_1C368, &qword_1C360);
  ComponentStack.init(content:)(sub_C088, v0, v14);
  sub_D214();
}

void sub_6B7C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v367 = a2;
  uint64_t v3 = type metadata accessor for SiriHelpSnippetView(0LL);
  v375 = *(char **)(v3 - 8);
  uint64_t v370 = *((void *)v375 + 8);
  __chkstk_darwin(v3, v4);
  v377 = (uint64_t *)((char *)&v331 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = type metadata accessor for SecondaryHeaderStandard(0LL);
  __chkstk_darwin(v6, v7);
  v373 = (char *)&v331 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_4A60(&qword_1C370);
  uint64_t v11 = __chkstk_darwin(v9, v10);
  v374 = (uint64_t *)((char *)&v331 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v11, v13);
  v372 = (uint64_t *)((char *)&v331 - v14);
  uint64_t v15 = sub_4A60(&qword_1C378);
  __chkstk_darwin(v15, v16);
  v364 = (uint64_t *)((char *)&v331 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v18 = type metadata accessor for SashStandard.Title(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (uint64_t *)((char *)&v331 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v23 = type metadata accessor for SashStandard(0LL);
  __chkstk_darwin(v23, v24);
  v366 = (char *)&v331 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v378 = sub_4A60(&qword_1C380);
  uint64_t v27 = __chkstk_darwin(v378, v26);
  uint64_t v379 = (uint64_t)&v331 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v352 = v28;
  __chkstk_darwin(v27, v29);
  v371 = (char *)&v331 - v30;
  uint64_t v31 = sub_4A60(&qword_1C388);
  unint64_t v368 = *(void *)(v31 - 8);
  v369 = (uint64_t *)v31;
  __chkstk_darwin(v31, v32);
  uint64_t v34 = (char *)&v331 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = type metadata accessor for SashStandardView(0LL);
  v365 = *(uint64_t **)(v35 - 8);
  uint64_t v37 = __chkstk_darwin(v35, v36);
  uint64_t v39 = (char *)&v331 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = *(int *)(v3 + 20);
  v376 = (char *)a1;
  v380 = (uint64_t *)(a1 + v40);
  *uint64_t v22 = SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpWithAppNameCat.getter(v37);
  v22[1] = v41;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v22, enum case for SashStandard.Title.text(_:), v18);
  uint64_t v42 = (uint64_t)v364;
  sub_5EA8((uint64_t)v364);
  uint64_t v43 = type metadata accessor for VisualProperty(0LL);
  sub_5750(v42, 0LL, 1LL, v43);
  uint64_t v44 = type metadata accessor for Color(0LL);
  uint64_t v45 = (uint64_t)v372;
  sub_5750((uint64_t)v372, 1LL, 1LL, v44);
  uint64_t v46 = (uint64_t)v374;
  uint64_t v47 = sub_5750((uint64_t)v374, 1LL, 1LL, v44);
  v395 = 0LL;
  __int128 v393 = 0u;
  __int128 v394 = 0u;
  uint64_t v48 = SuggestionsRFDataModels.SuggestionHelpDataModel.appBundleId.getter(v47);
  uint64_t v49 = v366;
  SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)( v22,  v42,  v45,  v46,  &v393,  v48,  v50,  0LL);
  SashStandardView.init(model:)(v49);
  sub_CEF8(&qword_1C390, (uint64_t (*)(uint64_t))&type metadata accessor for SashStandardView);
  View.componentName(_:)(0x6C646E7542707061LL, 0xEB00000000644965LL, v35, v51);
  ((void (*)(char *, uint64_t))v365[1])(v39, v35);
  unint64_t v53 = v368;
  uint64_t v52 = v369;
  uint64_t v54 = (uint64_t)v371;
  (*(void (**)(char *, char *, uint64_t *))(v368 + 16))(v371, v34, v369);
  uint64_t v55 = v54 + *(int *)(v378 + 52);
  strcpy((char *)v55, "Response_sash");
  *(_WORD *)(v55 + 14) = -4864;
  (*(void (**)(char *, uint64_t *))(v53 + 8))(v34, v52);
  sub_CC5C(v54, v379, &qword_1C380);
  uint64_t v56 = sub_4A60(&qword_1C398);
  v366 = (char *)&v331;
  uint64_t v58 = __chkstk_darwin(v56, v57);
  uint64_t v378 = (uint64_t)&v331 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v374 = &v331;
  v372 = (uint64_t *)v59;
  __chkstk_darwin(v58, v60);
  v348 = v61;
  uint64_t v62 = (char *)((char *)&v331 - v61);
  uint64_t v63 = sub_4A60(&qword_1C3A0);
  v371 = (char *)&v331;
  __chkstk_darwin(v63, v64);
  v346 = (char *)((unint64_t)(v65 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v347 = v65;
  v66 = (char *)((char *)&v331 - v346);
  uint64_t v67 = type metadata accessor for SecondaryHeaderStandardView(0LL);
  v369 = &v331;
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v70 = __chkstk_darwin(v67, v69);
  v345 = v71;
  v343 = (char *)((unint64_t)(v71 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v72 = (char *)((char *)&v331 - v343);
  uint64_t v73 = SuggestionsRFDataModels.SuggestionHelpDataModel.trySayingCat.getter(v70);
  *((void *)&v394 + 1) = &type metadata for String;
  v395 = &protocol witness table for String;
  *(void *)&__int128 v393 = v73;
  *((void *)&v393 + 1) = v74;
  uint64_t v400 = 0LL;
  __int128 v398 = 0u;
  __int128 v399 = 0u;
  uint64_t v75 = (uint64_t)v373;
  SecondaryHeaderStandard.init(text1:action:)(&v393, &v398);
  uint64_t v76 = SecondaryHeaderStandardView.init(model:)(v75);
  uint64_t v77 = static Font.subheadline.getter(v76);
  uint64_t KeyPath = swift_getKeyPath(&unk_153D8);
  v344 = *(uint64_t **)(v68 + 16);
  ((void (*)(char *, char *, uint64_t))v344)(v66, v72, v67);
  uint64_t v349 = v67;
  v350 = (uint64_t *)v63;
  uint64_t v79 = (uint64_t *)&v66[*(int *)(v63 + 36)];
  *uint64_t v79 = KeyPath;
  v79[1] = v77;
  v342 = *(uint64_t **)(v68 + 8);
  ((void (*)(char *, uint64_t))v342)(v72, v67);
  sub_D09C((uint64_t)v66, (uint64_t)v62, &qword_1C3A0);
  uint64_t v356 = v56;
  uint64_t v80 = &v62[*(int *)(v56 + 52)];
  strcpy(v80, "Response-tag");
  v80[13] = 0;
  *((_WORD *)v80 + 7) = -5120;
  sub_CE14((uint64_t)v66, &qword_1C3A0);
  sub_CC5C((uint64_t)v62, v378, &qword_1C398);
  uint64_t v81 = sub_4A60(&qword_1C3A8);
  v365 = &v331;
  uint64_t v83 = __chkstk_darwin(v81, v82);
  v85 = (char *)&v331 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v364 = &v331;
  v374 = (uint64_t *)v84;
  __chkstk_darwin(v83, v86);
  v355 = (char *)v87;
  uint64_t v88 = (char *)&v331 - v87;
  uint64_t v89 = sub_4A60(&qword_1C3B0);
  v363 = &v331;
  uint64_t v90 = *(void *)(v89 - 8);
  __chkstk_darwin(v89, v91);
  v353 = (char *)(((unint64_t)v92 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v354 = v92;
  uint64_t v93 = (char *)((char *)&v331 - v353);
  uint64_t v94 = (uint64_t)v377;
  sub_C9F8((uint64_t)v376, (uint64_t)v377, type metadata accessor for SiriHelpSnippetView);
  unint64_t v95 = v375[80];
  uint64_t v96 = (v95 + 16) & ~v95;
  v361 = (uint64_t *)(v96 + v370);
  unint64_t v368 = v95;
  v369 = (uint64_t *)(v95 | 7);
  uint64_t v97 = swift_allocObject(&unk_190D8, v96 + v370, v95 | 7);
  uint64_t v362 = v96;
  sub_CA28(v94, v97 + v96, type metadata accessor for SiriHelpSnippetView);
  uint64_t v98 = sub_4A60(&qword_1C3B8);
  v359 = (uint64_t *)sub_C3EC();
  ComponentStack.init(content:)(sub_C384, v97, v98);
  v99 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
  v99(v88, v93, v89);
  v371 = (char *)v81;
  v100 = &v88[*(int *)(v81 + 52)];
  strcpy(v100, "Response_full");
  *((_WORD *)v100 + 7) = -4864;
  v357 = *(void (**)(char *, uint64_t))(v90 + 8);
  v357(v93, v89);
  v375 = v85;
  sub_CC5C((uint64_t)v88, (uint64_t)v85, &qword_1C3A8);
  uint64_t v101 = sub_4A60(&qword_1C3C8);
  uint64_t v102 = *(void *)(*(void *)(v101 - 8) + 64LL);
  uint64_t v104 = __chkstk_darwin(v101, v103);
  v105 = (char *)&v331 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v106 = SuggestionsRFDataModels.SuggestionHelpDataModel.otherSuggestions.getter(v104);
  uint64_t v107 = *(void *)(v106 + 16);
  uint64_t v108 = swift_bridgeObjectRelease(v106);
  v364 = &v331;
  uint64_t v351 = v102;
  v360 = (uint64_t *)v98;
  v358 = (uint64_t *)v99;
  if (v107)
  {
    uint64_t v110 = __chkstk_darwin(v108, v109);
    v111 = (char *)((char *)&v331 - v348);
    v363 = &v331;
    uint64_t v113 = __chkstk_darwin(v110, v112);
    v114 = (char *)((char *)&v331 - v346);
    v348 = (char *)&v331;
    uint64_t v116 = __chkstk_darwin(v113, v115);
    v117 = (char *)((char *)&v331 - v343);
    uint64_t v118 = SuggestionsRFDataModels.SuggestionHelpDataModel.otherIntro.getter(v116);
    *((void *)&v394 + 1) = &type metadata for String;
    v395 = &protocol witness table for String;
    *(void *)&__int128 v393 = v118;
    *((void *)&v393 + 1) = v119;
    uint64_t v400 = 0LL;
    __int128 v398 = 0u;
    __int128 v399 = 0u;
    uint64_t v120 = (uint64_t)v373;
    SecondaryHeaderStandard.init(text1:action:)(&v393, &v398);
    uint64_t v121 = SecondaryHeaderStandardView.init(model:)(v120);
    uint64_t v122 = static Font.subheadline.getter(v121);
    uint64_t v123 = swift_getKeyPath(&unk_153D8);
    uint64_t v124 = v349;
    ((void (*)(char *, char *, uint64_t))v344)(v114, v117, v349);
    v125 = (uint64_t *)&v114[*((int *)v350 + 9)];
    uint64_t *v125 = v123;
    v125[1] = v122;
    ((void (*)(char *, uint64_t))v342)(v117, v124);
    sub_D09C((uint64_t)v114, (uint64_t)v111, &qword_1C3A0);
    uint64_t v126 = v356;
    v127 = &v111[*(int *)(v356 + 52)];
    *(void *)v127 = 0xD000000000000013LL;
    *((void *)v127 + 1) = 0x8000000000016EA0LL;
    sub_CE14((uint64_t)v114, &qword_1C3A0);
    sub_CC5C((uint64_t)v111, (uint64_t)v105, &qword_1C398);
    uint64_t v128 = 0LL;
    uint64_t v129 = v126;
  }

  else
  {
    uint64_t v129 = v356;
    uint64_t v128 = 1LL;
  }

  uint64_t v130 = (uint64_t)v355;
  uint64_t v131 = (uint64_t)v353;
  uint64_t v356 = ~v368;
  v373 = v105;
  uint64_t v132 = sub_5750((uint64_t)v105, v128, 1LL, v129);
  v363 = &v331;
  uint64_t v134 = __chkstk_darwin(v132, v133);
  uint64_t v136 = __chkstk_darwin(v134, v135);
  __chkstk_darwin(v136, v137);
  v138 = (char *)&v331 - v131;
  uint64_t v139 = (uint64_t)v377;
  sub_C9F8((uint64_t)v376, (uint64_t)v377, type metadata accessor for SiriHelpSnippetView);
  uint64_t v140 = swift_allocObject(&unk_19100, v361, v369);
  sub_CA28(v139, v140 + v362, type metadata accessor for SiriHelpSnippetView);
  ComponentStack.init(content:)(sub_C44C, v140, v360);
  ((void (*)(char *, char *, uint64_t))v358)((char *)&v331 - v130, v138, v89);
  v141 = (char *)&v331 + *((int *)v371 + 13) - v130;
  strcpy(v141, "Response_full2");
  v141[15] = -18;
  v357(v138, v89);
  uint64_t v362 = (uint64_t)&v331 - v130;
  sub_CC5C(v362, v362, &qword_1C3A8);
  uint64_t v142 = sub_4A60(&qword_1C3D0);
  v143 = *(uint64_t **)(*(void *)(v142 - 8) + 64LL);
  uint64_t v145 = __chkstk_darwin(v142, v144);
  v146 = (char *)&v331 - (((unint64_t)v143 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  SuggestionsRFDataModels.SuggestionHelpDataModel.moreSuggestionsDirectInvocation.getter(v145);
  uint64_t v148 = v147;
  swift_bridgeObjectRelease(v147);
  uint64_t v149 = sub_4A60(&qword_1C3D8);
  uint64_t v151 = v149;
  v360 = v143;
  v361 = &v331;
  v371 = v146;
  if (v148)
  {
    v359 = &v331;
    uint64_t v152 = __chkstk_darwin(v149, v150);
    v154 = (char *)&v331 - ((v153 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v155 = SuggestionsRFDataModels.SuggestionHelpDataModel.moreSuggestionsDirectInvocation.getter(v152);
    if (v156)
    {
      uint64_t v157 = v155;
      uint64_t v158 = v156;
      v357 = (void (*)(char *, uint64_t))sub_4A60(&qword_1C3E0);
      v358 = &v331;
      __chkstk_darwin(v357, v159);
      v161 = (char *)&v331 - ((v160 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v162 = Data.init(base64Encoded:options:)(v157, v158, 0LL);
      unint64_t v164 = v163;
      swift_bridgeObjectRelease(v158);
      uint64_t v165 = sub_4A60(&qword_1C3E8);
      if (v164 >> 60 == 15)
      {
        sub_5750((uint64_t)v161, 1LL, 1LL, v165);
        uint64_t v167 = (uint64_t)v372;
      }

      else
      {
        v354 = &v331;
        v355 = (char *)v165;
        __chkstk_darwin(v165, v166);
        v353 = (char *)&v331 - ((v169 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        sub_C768(0LL, &qword_1C428, &OBJC_CLASS___SAIntentGroupRunSiriKitExecutor_ptr);
        sub_C590(v162, v164);
        id v170 = sub_8FEC(v162, v164);
        if (v170)
        {
          id v340 = v170;
          uint64_t v349 = sub_4A60(&qword_1C3F0);
          v350 = &v331;
          __chkstk_darwin(v349, v171);
          v347 = (char *)&v331 - ((v172 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v173 = sub_4A60(&qword_1C3F8);
          v348 = (char *)&v331;
          v345 = *(char **)(v173 - 8);
          v346 = (char *)v173;
          __chkstk_darwin(v173, v174);
          v343 = (char *)&v331 - ((v175 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v176 = sub_4A60(&qword_1C400);
          v344 = &v331;
          v177 = *(uint64_t **)(v176 - 8);
          v341 = (char *)v176;
          v342 = v177;
          __chkstk_darwin(v176, v178);
          v338 = (char *)&v331 - ((v179 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v335 = sub_4A60(&qword_1C408);
          v339 = &v331;
          __chkstk_darwin(v335, v180);
          v337 = v161;
          v182 = (char *)&v331 - ((v181 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v333 = type metadata accessor for SimpleItemStandardView(0LL);
          v334 = &v331;
          uint64_t v331 = *(void *)(v333 - 8);
          uint64_t v184 = __chkstk_darwin(v333, v183);
          v186 = (char *)&v331 - ((v185 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          *(void *)&__int128 v393 = SuggestionsRFDataModels.SuggestionHelpDataModel.moreCat.getter(v184);
          *((void *)&v393 + 1) = v187;
          unint64_t v188 = sub_C468();
          uint64_t v189 = Text.init<A>(_:)(&v393, &type metadata for String, v188);
          uint64_t v191 = v190;
          v336 = (char *)v162;
          char v193 = v192;
          uint64_t v195 = v194;
          *((void *)&v394 + 1) = &type metadata for Text;
          v395 = &protocol witness table for Text;
          uint64_t v196 = swift_allocObject(&unk_19128, 48LL, 7LL);
          *(void *)&__int128 v393 = v196;
          *(void *)(v196 + 16) = v189;
          *(void *)(v196 + 24) = v191;
          *(_BYTE *)(v196 + 32) = v193 & 1;
          *(void *)(v196 + 40) = v195;
          uint64_t v400 = 0LL;
          __int128 v398 = 0u;
          __int128 v399 = 0u;
          uint64_t v392 = 0LL;
          __int128 v390 = 0u;
          __int128 v391 = 0u;
          uint64_t v389 = 0LL;
          __int128 v387 = 0u;
          __int128 v388 = 0u;
          uint64_t v386 = 0LL;
          __int128 v384 = 0u;
          __int128 v385 = 0u;
          uint64_t v383 = 0LL;
          __int128 v381 = 0u;
          __int128 v382 = 0u;
          uint64_t v197 = SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)( &v393,  &v398,  &v390,  &v387,  &v384,  &v381);
          uint64_t v198 = static Font.footnote.getter(v197);
          uint64_t v199 = swift_getKeyPath(&unk_153D8);
          uint64_t v200 = v331;
          uint64_t v201 = v333;
          (*(void (**)(char *, char *, uint64_t))(v331 + 16))(v182, v186, v333);
          unint64_t v332 = v164;
          uint64_t v202 = v335;
          v203 = (uint64_t *)&v182[*(int *)(v335 + 36)];
          uint64_t *v203 = v199;
          v203[1] = v198;
          (*(void (**)(char *, uint64_t))(v200 + 8))(v186, v201);
          uint64_t v204 = (uint64_t)v377;
          sub_C9F8((uint64_t)v376, (uint64_t)v377, type metadata accessor for SiriHelpSnippetView);
          uint64_t v205 = (v368 + 24) & v356;
          uint64_t v206 = swift_allocObject(&unk_19178, v205 + v370, v369);
          id v207 = v340;
          *(void *)(v206 + 16) = v340;
          sub_CA28(v204, v206 + v205, type metadata accessor for SiriHelpSnippetView);
          unint64_t v208 = sub_C5D4();
          id v340 = v207;
          v209 = v338;
          View.componentTapped(isNavigation:perform:)(1LL, sub_C6FC, v206, v202, v208);
          swift_release(v206);
          uint64_t v210 = (uint64_t)v182;
          v161 = v337;
          sub_CE14(v210, &qword_1C408);
          *(void *)&__int128 v393 = v202;
          *((void *)&v393 + 1) = v208;
          uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v393,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
          v212 = v343;
          v213 = v341;
          View.componentName(_:)(0x45524F4D5F454553LL, 0xEF4E4F545455425FLL, v341, OpaqueTypeConformance2);
          ((void (*)(char *, char *))v342[1])(v209, v213);
          sub_C670((uint64_t)v336, v332);

          v215 = v345;
          v214 = v346;
          v216 = v347;
          v217 = v212;
          (*((void (**)(char *, char *, char *))v345 + 2))(v347, v212, v346);
          uint64_t v218 = v349;
          v219 = &v216[*(int *)(v349 + 52)];
          *(void *)v219 = 0xD000000000000018LL;
          *((void *)v219 + 1) = 0x8000000000016F00LL;
          (*((void (**)(char *, char *))v215 + 1))(v217, v214);
          uint64_t v220 = (uint64_t)v216;
          uint64_t v221 = (uint64_t)v353;
          sub_CC5C(v220, (uint64_t)v353, &qword_1C3F0);
          uint64_t v222 = v221;
          uint64_t v223 = 0LL;
          uint64_t v224 = v218;
        }

        else
        {
          sub_C670(v162, v164);
          uint64_t v224 = sub_4A60(&qword_1C3F0);
          uint64_t v221 = (uint64_t)v353;
          uint64_t v222 = (uint64_t)v353;
          uint64_t v223 = 1LL;
        }

        sub_5750(v222, v223, 1LL, v224);
        uint64_t v167 = (uint64_t)v372;
        sub_CC5C(v221, (uint64_t)v161, &qword_1C3E8);
        sub_5750((uint64_t)v161, 0LL, 1LL, (uint64_t)v355);
      }

      v146 = v371;
      sub_CC5C((uint64_t)v161, (uint64_t)v154, &qword_1C3E0);
      sub_5750((uint64_t)v154, 0LL, 1LL, (uint64_t)v357);
    }

    else
    {
      uint64_t v168 = sub_4A60(&qword_1C3E0);
      sub_5750((uint64_t)v154, 1LL, 1LL, v168);
      uint64_t v167 = (uint64_t)v372;
    }

    sub_CC5C((uint64_t)v154, (uint64_t)v146, &qword_1C3D8);
    sub_5750((uint64_t)v146, 0LL, 1LL, v151);
  }

  else
  {
    sub_5750((uint64_t)&v331 - (((unint64_t)v143 + 15) & 0xFFFFFFFFFFFFFFF0LL), 1LL, 1LL, v149);
    uint64_t v167 = (uint64_t)v372;
  }

  uint64_t v225 = sub_4A60(&qword_1C3D8);
  v226 = *(uint64_t **)(*(void *)(v225 - 8) + 64LL);
  uint64_t v228 = __chkstk_darwin(v225, v227);
  SuggestionsRFDataModels.SuggestionHelpDataModel.learnMorePunchout.getter(v228);
  uint64_t v230 = v229;
  swift_bridgeObjectRelease(v229);
  v231 = (void (*)(void, void))sub_4A60(&qword_1C3E0);
  v358 = v226;
  v359 = &v331;
  if (v230)
  {
    v354 = &v331;
    v355 = (char *)&v331 - (((unint64_t)v226 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v357 = (void (*)(char *, uint64_t))v231;
    uint64_t v233 = __chkstk_darwin(v231, v232);
    v235 = (char *)&v331 - ((v234 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v236 = SuggestionsRFDataModels.SuggestionHelpDataModel.learnMorePunchout.getter(v233);
    if (v237)
    {
      uint64_t v238 = v236;
      uint64_t v239 = v237;
      uint64_t v240 = sub_4A60(&qword_1C3E8);
      v353 = (char *)&v331;
      v350 = (uint64_t *)v240;
      __chkstk_darwin(v240, v241);
      uint64_t v349 = (uint64_t)&v331 - ((v242 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v243 = Data.init(base64Encoded:options:)(v238, v239, 0LL);
      unint64_t v245 = (unint64_t)v244;
      swift_bridgeObjectRelease(v239);
      if (v245 >> 60 == 15)
      {
        uint64_t v246 = sub_4A60(&qword_1C3F0);
        uint64_t v247 = v349;
        uint64_t v248 = v349;
        uint64_t v249 = 1LL;
      }

      else
      {
        v347 = (char *)sub_4A60(&qword_1C3F0);
        v348 = (char *)&v331;
        __chkstk_darwin(v347, v256);
        v345 = (char *)&v331 - ((v257 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v258 = sub_4A60(&qword_1C3F8);
        v346 = (char *)&v331;
        v343 = *(char **)(v258 - 8);
        v344 = (uint64_t *)v258;
        __chkstk_darwin(v258, v259);
        v341 = (char *)&v331 - ((v260 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v261 = sub_4A60(&qword_1C400);
        v342 = &v331;
        v262 = *(void **)(v261 - 8);
        v339 = (uint64_t *)v261;
        id v340 = v262;
        __chkstk_darwin(v261, v263);
        v337 = (char *)&v331 - ((v264 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v335 = sub_4A60(&qword_1C408);
        v338 = (char *)&v331;
        __chkstk_darwin(v335, v265);
        v336 = v235;
        v267 = (char *)&v331 - ((v266 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v268 = type metadata accessor for SimpleItemStandardView(0LL);
        v334 = &v331;
        uint64_t v269 = *(void *)(v268 - 8);
        uint64_t v271 = __chkstk_darwin(v268, v270);
        v273 = (char *)&v331 - ((v272 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        *(void *)&__int128 v393 = SuggestionsRFDataModels.SuggestionHelpDataModel.learnMoreCat.getter(v271);
        *((void *)&v393 + 1) = v274;
        unint64_t v275 = sub_C468();
        uint64_t v276 = Text.init<A>(_:)(&v393, &type metadata for String, v275);
        uint64_t v333 = v243;
        uint64_t v278 = v277;
        v380 = (uint64_t *)v245;
        char v280 = v279;
        uint64_t v282 = v281;
        *((void *)&v394 + 1) = &type metadata for Text;
        v395 = &protocol witness table for Text;
        uint64_t v283 = swift_allocObject(&unk_19128, 48LL, 7LL);
        *(void *)&__int128 v393 = v283;
        *(void *)(v283 + 16) = v276;
        *(void *)(v283 + 24) = v278;
        *(_BYTE *)(v283 + 32) = v280 & 1;
        *(void *)(v283 + 40) = v282;
        uint64_t v400 = 0LL;
        __int128 v398 = 0u;
        __int128 v399 = 0u;
        uint64_t v392 = 0LL;
        __int128 v390 = 0u;
        __int128 v391 = 0u;
        uint64_t v389 = 0LL;
        __int128 v387 = 0u;
        __int128 v388 = 0u;
        uint64_t v386 = 0LL;
        __int128 v384 = 0u;
        __int128 v385 = 0u;
        uint64_t v383 = 0LL;
        __int128 v381 = 0u;
        __int128 v382 = 0u;
        uint64_t v284 = SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)( &v393,  &v398,  &v390,  &v387,  &v384,  &v381);
        uint64_t v285 = static Font.footnote.getter(v284);
        uint64_t v286 = swift_getKeyPath(&unk_153D8);
        (*(void (**)(char *, char *, uint64_t))(v269 + 16))(v267, v273, v268);
        uint64_t v287 = v335;
        v288 = (uint64_t *)&v267[*(int *)(v335 + 36)];
        uint64_t *v288 = v286;
        v288[1] = v285;
        (*(void (**)(char *, uint64_t))(v269 + 8))(v273, v268);
        uint64_t v289 = (uint64_t)v377;
        sub_C9F8((uint64_t)v376, (uint64_t)v377, type metadata accessor for SiriHelpSnippetView);
        uint64_t v290 = (v368 + 32) & v356;
        uint64_t v291 = swift_allocObject(&unk_19150, v290 + v370, v369);
        uint64_t v292 = v333;
        unint64_t v293 = (unint64_t)v380;
        *(void *)(v291 + 16) = v333;
        *(void *)(v291 + 24) = v293;
        uint64_t v294 = v289;
        uint64_t v167 = (uint64_t)v372;
        sub_CA28(v294, v291 + v290, type metadata accessor for SiriHelpSnippetView);
        unint64_t v295 = v293;
        sub_C590(v292, v293);
        unint64_t v296 = sub_C5D4();
        v297 = v337;
        View.componentTapped(isNavigation:perform:)(0LL, sub_C57C, v291, v287, v296);
        swift_release(v291);
        uint64_t v298 = (uint64_t)v267;
        v235 = v336;
        sub_CE14(v298, &qword_1C408);
        *(void *)&__int128 v393 = v287;
        *((void *)&v393 + 1) = v296;
        uint64_t v299 = swift_getOpaqueTypeConformance2( &v393,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
        v300 = v341;
        v301 = v339;
        View.componentName(_:)(0xD000000000000011LL, 0x8000000000016EC0LL, v339, v299);
        (*((void (**)(char *, uint64_t *))v340 + 1))(v297, v301);
        sub_C670(v292, v295);
        v302 = (void (**)(char *, uint64_t *))v343;
        uint64_t v303 = (uint64_t)v345;
        v304 = v300;
        v305 = v300;
        v306 = v344;
        (*((void (**)(char *, char *, uint64_t *))v343 + 2))(v345, v304, v344);
        v307 = v347;
        v308 = (void *)(v303 + *((int *)v347 + 13));
        void *v308 = 0xD000000000000019LL;
        v308[1] = 0x8000000000016EE0LL;
        v302[1](v305, v306);
        uint64_t v247 = v349;
        sub_CC5C(v303, v349, &qword_1C3F0);
        uint64_t v248 = v247;
        uint64_t v249 = 0LL;
        uint64_t v246 = (uint64_t)v307;
      }

      sub_5750(v248, v249, 1LL, v246);
      uint64_t v253 = v351;
      uint64_t v252 = v352;
      v254 = v355;
      sub_CC5C(v247, (uint64_t)v235, &qword_1C3E8);
      sub_5750((uint64_t)v235, 0LL, 1LL, (uint64_t)v350);
    }

    else
    {
      uint64_t v255 = sub_4A60(&qword_1C3E8);
      sub_5750((uint64_t)v235, 1LL, 1LL, v255);
      uint64_t v253 = v351;
      uint64_t v252 = v352;
      v254 = v355;
    }

    sub_CC5C((uint64_t)v235, (uint64_t)v254, &qword_1C3E0);
    uint64_t v250 = sub_5750((uint64_t)v254, 0LL, 1LL, (uint64_t)v357);
  }

  else
  {
    uint64_t v250 = sub_5750((uint64_t)&v331 - (((unint64_t)v226 + 15) & 0xFFFFFFFFFFFFFFF0LL), 1LL, 1LL, (uint64_t)v231);
    uint64_t v253 = v351;
    uint64_t v252 = v352;
    v254 = (char *)&v331 - (((unint64_t)v226 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  }

  v380 = &v331;
  __chkstk_darwin(v250, v251);
  v309 = (char *)&v331 - ((v252 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v376 = v309;
  sub_D09C(v379, (uint64_t)v309, &qword_1C380);
  v377 = &v331;
  *(void *)&__int128 v393 = v309;
  __chkstk_darwin(v310, v311);
  uint64_t v370 = (uint64_t)&v331 - ((v167 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_D09C(v378, v370, &qword_1C398);
  v372 = &v331;
  *((void *)&v393 + 1) = (char *)&v331 - ((v167 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v312 = (uint64_t)v374;
  __chkstk_darwin(v313, v314);
  v315 = (char *)&v331 - ((v312 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_D09C((uint64_t)v375, (uint64_t)v315, &qword_1C3A8);
  v369 = &v331;
  *(void *)&__int128 v394 = v315;
  __chkstk_darwin(v316, v317);
  v318 = (char *)&v331 - ((v253 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_D09C((uint64_t)v373, (uint64_t)v318, &qword_1C3C8);
  unint64_t v368 = (unint64_t)&v331;
  *((void *)&v394 + 1) = v318;
  __chkstk_darwin(v319, v320);
  uint64_t v321 = v362;
  sub_D09C(v362, (uint64_t)v315, &qword_1C3A8);
  v374 = &v331;
  v395 = v315;
  __chkstk_darwin(v322, v323);
  v325 = (char *)&v331 - ((v324 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v326 = (uint64_t)v371;
  sub_D09C((uint64_t)v371, (uint64_t)v325, &qword_1C3D0);
  v360 = &v331;
  v396 = v325;
  __chkstk_darwin(v327, v328);
  v330 = (char *)&v331 - ((v329 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_D09C((uint64_t)v254, (uint64_t)v330, &qword_1C3D8);
  v397 = v330;
  sub_5DCC((uint64_t *)&v393, v367);
  sub_CE14((uint64_t)v254, &qword_1C3D8);
  sub_CE14(v326, &qword_1C3D0);
  sub_CE14(v321, &qword_1C3A8);
  sub_CE14((uint64_t)v373, &qword_1C3C8);
  sub_CE14((uint64_t)v375, &qword_1C3A8);
  sub_CE14(v378, &qword_1C398);
  sub_CE14(v379, &qword_1C380);
  sub_CE14((uint64_t)v330, &qword_1C3D8);
  sub_CE14((uint64_t)v325, &qword_1C3D0);
  sub_CE14((uint64_t)v315, &qword_1C3A8);
  sub_CE14((uint64_t)v318, &qword_1C3C8);
  sub_CE14((uint64_t)v315, &qword_1C3A8);
  sub_CE14(v370, &qword_1C398);
  sub_CE14((uint64_t)v376, &qword_1C380);
}

uint64_t sub_87C0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain(v2);
  return SiriHelpSuggestion.suggestionId.setter(v1, v2);
}

void sub_87FC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_D38C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8, v11);
  uint64_t v20 = a2();
  uint64_t KeyPath = swift_getKeyPath(&unk_15408);
  sub_C9F8(a1, (uint64_t)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), type metadata accessor for SiriHelpSnippetView);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = (v13 + 16) & ~v13;
  uint64_t v15 = swift_allocObject(a3, v14 + v10, v13 | 7);
  sub_CA28( (uint64_t)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v15 + v14,  type metadata accessor for SiriHelpSnippetView);
  uint64_t v16 = sub_4A60(&qword_1C460);
  unint64_t v17 = sub_C7D4();
  unint64_t v18 = sub_C818();
  ForEach<>.init(_:id:content:)( &v20,  KeyPath,  a4,  v15,  v16,  &type metadata for AnyView,  v17,  v18,  &protocol witness table for AnyView);
  sub_D274();
}

uint64_t sub_892C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  sub_C874(v7, v8);
  uint64_t v5 = View.eraseToAnyView()(v3, v4);
  uint64_t result = sub_4A40(v7);
  *a2 = v5;
  return result;
}

void sub_8998(void *a1)
{
  uint64_t v2 = sub_4A60(&qword_1C430);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ActionProperty(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_4A60(&qword_1C438);
  uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_152B0;
  uint64_t v13 = type metadata accessor for Command(0LL);
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = &protocol witness table for Command;
  uint64_t v14 = sub_C72C((void *)(v12 + 32));
  *uint64_t v14 = a1;
  *((_BYTE *)v14 + 8) = 1;
  (*(void (**)(void))(*(void *)(v13 - 8) + 104LL))();
  id v15 = a1;
  ActionProperty.init(_:actionName:)(v12, 0x45524F4D5F454553LL, 0xEF4445505041545FLL);
  uint64_t v16 = sub_4A60(&qword_1C440);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for SiriHelpSnippetView(0LL);
  ActionHandler.wrappedValue.getter();
  uint64_t v20 = type metadata accessor for StandardActionHandler(0LL);
  if (sub_56B8((uint64_t)v19, 1LL, v20) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_CE14((uint64_t)v19, &qword_1C440);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v10, v6);
    sub_5750((uint64_t)v5, 0LL, 1LL, v6);
    uint64_t v21 = sub_4A60(&qword_1C448);
    __chkstk_darwin(v21, v22);
    uint64_t v24 = (char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = type metadata accessor for InteractionType(0LL);
    sub_5750((uint64_t)v24, 1LL, 1LL, v25);
    StandardActionHandler.perform(_:interactionType:)(v5, v24);
    sub_CE14((uint64_t)v24, &qword_1C448);
    sub_CE14((uint64_t)v5, &qword_1C430);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8LL))(v19, v20);
  }

void sub_8C68(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_4A60(&qword_1C430);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionProperty(0LL);
  uint64_t v34 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Command(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_C768(0LL, &qword_1C450, &OBJC_CLASS___SAUIAppPunchOut_ptr);
  sub_C590(a1, a2);
  id v17 = sub_8FEC(a1, a2);
  if (v17)
  {
    *(void *)uint64_t v16 = v17;
    v16[8] = 0;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for Command.aceCommand(_:), v12);
    uint64_t v18 = sub_4A60(&qword_1C438);
    uint64_t v19 = swift_allocObject(v18, 72LL, 7LL);
    *(_OWORD *)(v19 + 16) = xmmword_152B0;
    *(void *)(v19 + 56) = v12;
    *(void *)(v19 + 64) = &protocol witness table for Command;
    uint64_t v20 = sub_C72C((void *)(v19 + 32));
    (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v20, v16, v12);
    ActionProperty.init(_:actionName:)(v19, 0xD000000000000011LL, 0x8000000000016F20LL);
    uint64_t v21 = sub_4A60(&qword_1C440);
    __chkstk_darwin(v21, v22);
    uint64_t v24 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    type metadata accessor for SiriHelpSnippetView(0LL);
    ActionHandler.wrappedValue.getter();
    uint64_t v25 = type metadata accessor for StandardActionHandler(0LL);
    if (sub_56B8((uint64_t)v24, 1LL, v25) == 1)
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v8);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      sub_CE14((uint64_t)v24, &qword_1C440);
    }

    else
    {
      v33[2] = v33;
      uint64_t v26 = (uint64_t)v7;
      uint64_t v27 = v34;
      (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v26, v11, v8);
      sub_5750(v26, 0LL, 1LL, v8);
      uint64_t v28 = sub_4A60(&qword_1C448);
      v33[1] = v33;
      __chkstk_darwin(v28, v29);
      v33[0] = v8;
      uint64_t v31 = (char *)v33 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v32 = type metadata accessor for InteractionType(0LL);
      sub_5750((uint64_t)v31, 1LL, 1LL, v32);
      StandardActionHandler.perform(_:interactionType:)(v26, v31);
      sub_CE14((uint64_t)v31, &qword_1C448);
      sub_CE14(v26, &qword_1C430);
      (*(void (**)(char *, void))(v27 + 8))(v11, v33[0]);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8LL))(v24, v25);
    }
  }

  else
  {
    __break(1u);
  }

id sub_8FEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_C670(a1, a2);
  }

  id v6 = [(id)swift_getObjCClassFromMetadata(v2) aceObjectWithPlistData:isa];

  return v6;
}

uint64_t sub_906C@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  uint64_t v122 = a1;
  uint64_t v118 = a3;
  uint64_t v4 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v115 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v116 = v6;
  uint64_t v117 = (uint64_t)&v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4A60(&qword_1C430);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for SiriHelpSuggestion(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v110 = v15;
  v111 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  uint64_t v19 = (char *)&v99 - v18;
  uint64_t v113 = v17;
  if ((a2 & 1) != 0)
  {
    uint64_t v20 = SiriHelpSuggestion.displayText.getter(v17);
    uint64_t v22 = v21;
  }

  else
  {
    uint64_t v23 = v122;
    uint64_t v20 = SiriHelpSuggestion.formattedDisplayText.getter(v17);
    uint64_t v22 = v24;
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v19, v23, v11);
    if (!v22)
    {
      uint64_t v20 = SiriHelpSuggestion.displayText.getter(v25);
      uint64_t v22 = v26;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
  }

  uint64_t v112 = v12;
  uint64_t v139 = v20;
  uint64_t v140 = v22;
  unint64_t v27 = sub_C468();
  uint64_t v28 = Text.init<A>(_:)(&v139, &type metadata for String, v27);
  uint64_t v120 = v29;
  uint64_t v121 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  uint64_t v109 = swift_allocBox(v7);
  uint64_t v35 = v34;
  uint64_t v36 = type metadata accessor for ActionProperty(0LL);
  uint64_t v37 = sub_5750(v35, 1LL, 1LL, v36);
  if ((a2 & 1) != 0)
  {
    uint64_t v38 = SiriHelpSuggestion.directInvocation.getter(v37);
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = Data.init(base64Encoded:options:)(v38, v39, 0LL);
      unint64_t v43 = v42;
      swift_bridgeObjectRelease(v40);
      if (v43 >> 60 != 15)
      {
        sub_C768(0LL, &qword_1C428, &OBJC_CLASS___SAIntentGroupRunSiriKitExecutor_ptr);
        sub_C590(v41, v43);
        id v44 = sub_8FEC(v41, v43);
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = sub_4A60(&qword_1C438);
          uint64_t v47 = swift_allocObject(v46, 72LL, 7LL);
          uint64_t v119 = v41;
          uint64_t v48 = v47;
          *(_OWORD *)(v47 + 16) = xmmword_152B0;
          uint64_t v108 = (uint64_t *)(v47 + 32);
          uint64_t v49 = type metadata accessor for Command(0LL);
          *(void *)(v48 + 56) = v49;
          *(void *)(v48 + 64) = &protocol witness table for Command;
          uint64_t v50 = sub_C72C(v108);
          void *v50 = v45;
          *((_BYTE *)v50 + 8) = 0;
          (*(void (**)(void))(*(void *)(v49 - 8) + 104LL))();
          id v51 = v45;
          ActionProperty.init(_:actionName:)(v48, 0xD000000000000012LL, 0x8000000000016F40LL);
          sub_C670(v119, v43);

          sub_5750((uint64_t)v10, 0LL, 1LL, v36);
          sub_D054((uint64_t)v10, v35);
        }

        else
        {
          sub_C670(v41, v43);
        }
      }
    }
  }

  uint64_t v52 = sub_4A60(&qword_1C608);
  uint64_t v108 = &v99;
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v106 = v52;
  uint64_t v107 = v53;
  __chkstk_darwin(v52, v54);
  v100 = (char *)&v99 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v119 = sub_4A60(&qword_1C610);
  uint64_t v104 = &v99;
  uint64_t v102 = *(void *)(v119 - 8);
  __chkstk_darwin(v119, v56);
  uint64_t v58 = (char *)&v99 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v59 = type metadata accessor for SimpleItemRichView(0LL);
  uint64_t v101 = &v99;
  uint64_t v60 = *(void *)(v59 - 8);
  __chkstk_darwin(v59, v61);
  uint64_t v63 = (char *)&v99 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v141 = &type metadata for Text;
  uint64_t v142 = &protocol witness table for Text;
  uint64_t v64 = swift_allocObject(&unk_19128, 48LL, 7LL);
  uint64_t v139 = v64;
  uint64_t v66 = v120;
  uint64_t v65 = v121;
  *(void *)(v64 + 16) = v121;
  *(void *)(v64 + 24) = v66;
  int v105 = v31 & 1;
  *(_BYTE *)(v64 + 32) = v31 & 1;
  *(void *)(v64 + 40) = v33;
  uint64_t v138 = 0LL;
  memset(v137, 0, sizeof(v137));
  uint64_t v136 = 0LL;
  memset(v135, 0, sizeof(v135));
  uint64_t v134 = 0LL;
  memset(v133, 0, sizeof(v133));
  uint64_t v132 = 0LL;
  memset(v131, 0, sizeof(v131));
  uint64_t v130 = 0LL;
  memset(v129, 0, sizeof(v129));
  uint64_t v128 = 0LL;
  memset(v127, 0, sizeof(v127));
  uint64_t v126 = 0LL;
  memset(v125, 0, sizeof(v125));
  uint64_t v124 = 0LL;
  memset(v123, 0, sizeof(v123));
  swift_bridgeObjectRetain(v33);
  sub_C898(v65, v66, v31 & 1);
  uint64_t v67 = SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)( &v139,  v137,  v135,  v133,  v131,  v129,  v127,  v125,  v123);
  double v68 = static Font.Weight.regular.getter(v67);
  uint64_t v69 = v122;
  double v70 = v68;
  sub_CEF8(&qword_1C618, (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  uint64_t v103 = v33;
  uint64_t v72 = v71;
  View.fontWeight(_:)(*(void *)&v70, 0LL, v59, v71);
  uint64_t v73 = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v63, v59);
  uint64_t v74 = SiriHelpSuggestion.suggestionId.getter(v73);
  if (v75) {
    uint64_t v76 = v74;
  }
  else {
    uint64_t v76 = 0LL;
  }
  if (v75) {
    unint64_t v77 = v75;
  }
  else {
    unint64_t v77 = 0xE000000000000000LL;
  }
  uint64_t v139 = v59;
  uint64_t v140 = v72;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v139,  &opaque type descriptor for <<opaque return type of View.fontWeight(_:)>>,  1LL);
  uint64_t v79 = v119;
  View.componentName(_:)(v76, v77, v119, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v77);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v58, v79);
  uint64_t v80 = v111;
  uint64_t v81 = v112;
  uint64_t v82 = v113;
  (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v111, v69, v113);
  uint64_t v83 = v117;
  sub_C9F8(v114, v117, type metadata accessor for SiriHelpSMARTView);
  uint64_t v84 = *(unsigned __int8 *)(v81 + 80);
  uint64_t v85 = (v84 + 16) & ~v84;
  unint64_t v86 = (v110 + v85 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v87 = *(unsigned __int8 *)(v115 + 80);
  uint64_t v88 = (v87 + v86 + 8) & ~v87;
  uint64_t v89 = swift_allocObject(&unk_19308, v88 + v116, v84 | v87 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v89 + v85, v80, v82);
  uint64_t v90 = v109;
  *(void *)(v89 + v86) = v109;
  sub_CA28(v83, v89 + v88, type metadata accessor for SiriHelpSMARTView);
  uint64_t v91 = sub_4A60(&qword_1C620);
  uint64_t v93 = v118;
  uint64_t v92 = v119;
  v118[3] = v91;
  uint64_t v139 = v92;
  uint64_t v140 = OpaqueTypeConformance2;
  uint64_t v94 = swift_getOpaqueTypeConformance2( &v139,  &opaque type descriptor for <<opaque return type of View.componentName(_:)>>,  1LL);
  uint64_t v95 = v106;
  uint64_t v139 = v106;
  uint64_t v140 = v94;
  v93[4] = swift_getOpaqueTypeConformance2( &v139,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
  sub_C72C(v93);
  swift_retain(v90);
  uint64_t v96 = v94;
  uint64_t v97 = v100;
  View.componentTapped(isNavigation:perform:)(0LL, sub_CFF4, v89, v95, v96);
  swift_release(v89);
  sub_C4D4(v121, v120, v105);
  swift_bridgeObjectRelease(v103);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v97, v95);
  return swift_release(v90);
}

void sub_97A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v97 = a3;
  uint64_t v5 = sub_4A60(&qword_1C430);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  unint64_t v86 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v9);
  uint64_t v96 = (uint64_t *)((char *)&v85 - v10);
  uint64_t v98 = type metadata accessor for ActionProperty(0LL);
  uint64_t v88 = *(void *)(v98 - 8);
  __chkstk_darwin(v98, v11);
  uint64_t v87 = (char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v93 = *(void *)(v13 - 8);
  uint64_t v94 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v90 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for Command(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v92 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for SiriHelpSuggestion(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v22);
  uint64_t v24 = (char *)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v91 = swift_projectBox(a2);
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v25 = type metadata accessor for Logger(0LL);
  sub_41C8(v25, (uint64_t)static Logger.uiCategory);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v95 = a1;
  uint64_t v27 = v26(v24, a1, v20);
  uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
  os_log_type_t v29 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc(12LL, -1LL);
    uint64_t v85 = v17;
    char v31 = (uint8_t *)v30;
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    uint64_t v89 = (uint64_t *)v16;
    uint64_t v33 = v32;
    v100[0] = v32;
    *(_DWORD *)char v31 = 136315138;
    uint64_t v34 = SiriHelpSuggestion.suggestionId.getter(v32);
    if (v35)
    {
      unint64_t v36 = v35;
    }

    else
    {
      uint64_t v34 = 0LL;
      unint64_t v36 = 0xE000000000000000LL;
    }

    uint64_t v99 = sub_DF60(v34, v36, v100);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, v100, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease(v36);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    _os_log_impl(&dword_0, v28, v29, "SiriHelp Component was tapped for suggestionID: %s", v31, 0xCu);
    swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v37 = v33;
    uint64_t v16 = (uint64_t)v89;
    swift_slowDealloc(v37, -1LL, -1LL);
    uint64_t v38 = v31;
    uint64_t v17 = v85;
    swift_slowDealloc(v38, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }

  uint64_t v39 = v92;
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v92, enum case for Command.noOp(_:), v16);
  uint64_t v40 = type metadata accessor for InteractionType(0LL);
  uint64_t v89 = &v85;
  __chkstk_darwin(v40, v41);
  unint64_t v43 = (char *)&v85 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = *(void (**)(char *, void))(v44 + 104);
  uint64_t v85 = v46;
  v45(v43, enum case for InteractionType.buttonTapped(_:));
  uint64_t v47 = sub_4A60(&qword_1C4A0);
  uint64_t v49 = __chkstk_darwin(v47, v48);
  id v51 = (char *)&v85 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static ComponentType.customCanvas.getter(v49);
  uint64_t v52 = type metadata accessor for ComponentType(0LL);
  sub_5750((uint64_t)v51, 0LL, 1LL, v52);
  uint64_t v53 = v93;
  uint64_t v54 = v94;
  uint64_t v55 = v90;
  uint64_t v56 = (*(uint64_t (**)(char *, void, uint64_t))(v93 + 104))( v90,  enum case for DeliveryVehicle.siriHelp(_:),  v94);
  uint64_t v57 = SiriHelpSuggestion.suggestionId.getter(v56);
  if (v58)
  {
    unint64_t v59 = v58;
  }

  else
  {
    uint64_t v57 = 0LL;
    unint64_t v59 = 0xE000000000000000LL;
  }

  unint64_t v60 = v59;
  Swift::String v61 = DeliveryVehicle.getComponentName(suggestionId:)(*(Swift::String *)&v57);
  swift_bridgeObjectRelease(v59);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v54);
  id v62 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed(0LL));
  uint64_t v63 = (void *)RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)( 0x706C6548706174LL,  0xE700000000000000LL,  v39,  v43,  v51,  v61._countAndFlagsBits,  v61._object,  0LL,  1);
  uint64_t v64 = v91;
  swift_beginAccess(v91, v100, 0LL, 0LL);
  uint64_t v65 = v64;
  uint64_t v66 = (uint64_t)v96;
  sub_D09C(v65, (uint64_t)v96, &qword_1C430);
  if (sub_56B8(v66, 1LL, v98) == 1)
  {
    sub_CE14(v66, &qword_1C430);
  }

  else
  {
    double v68 = v87;
    uint64_t v67 = v88;
    (*(void (**)(char *, uint64_t, uint64_t))(v88 + 32))(v87, v66, v98);
    uint64_t v69 = sub_4A60(&qword_1C440);
    __chkstk_darwin(v69, v70);
    uint64_t v72 = (char *)&v85 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    type metadata accessor for SiriHelpSMARTView(0LL);
    ActionHandler.wrappedValue.getter();
    uint64_t v73 = type metadata accessor for StandardActionHandler(0LL);
    if (sub_56B8((uint64_t)v72, 1LL, v73) == 1)
    {
      (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v98);
      sub_CE14((uint64_t)v72, &qword_1C440);
    }

    else
    {
      uint64_t v74 = v98;
      uint64_t v75 = (uint64_t)v86;
      (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v86, v68, v98);
      sub_5750(v75, 0LL, 1LL, v74);
      uint64_t v76 = sub_4A60(&qword_1C448);
      uint64_t v96 = &v85;
      __chkstk_darwin(v76, v77);
      uint64_t v79 = (char *)&v85 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_5750((uint64_t)v79, 1LL, 1LL, v85);
      StandardActionHandler.perform(_:interactionType:)(v75, v79);
      sub_CE14((uint64_t)v79, &qword_1C448);
      sub_CE14(v75, &qword_1C430);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v74);
      (*(void (**)(char *, uint64_t))(*(void *)(v73 - 8) + 8LL))(v72, v73);
    }
  }

  uint64_t v80 = v97 + *(int *)(type metadata accessor for SiriHelpSMARTView(0LL) + 20);
  if (*(void *)v80)
  {
    id v81 = *(id *)v80;
    dispatch thunk of Context.emit(_:)(v63);
  }

  else
  {
    uint64_t v82 = *(void *)(v80 + 8);
    uint64_t v83 = type metadata accessor for Context(0LL);
    sub_CEF8((unint64_t *)&qword_1C170, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    EnvironmentObject.error()(0LL, v82, v83, v84);
    __break(1u);
  }

void sub_9EEC(uint64_t a1@<X8>)
{
}

void sub_9EF8(uint64_t a1@<X8>)
{
}

void sub_9F04(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_4A60(&qword_1C590);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  sub_51A8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_4A60(&qword_1C598);
  __chkstk_darwin(v9, v10);
  sub_51A8();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for PrimaryHeaderRichView(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  sub_51A8();
  uint64_t v19 = v18 - v17;
  v36[3] = &type metadata for String;
  v36[4] = &protocol witness table for String;
  v36[0] = a1();
  v36[1] = v20;
  uint64_t v35 = 0LL;
  memset(v34, 0, sizeof(v34));
  uint64_t v33 = 0LL;
  memset(v32, 0, sizeof(v32));
  uint64_t v31 = 0LL;
  memset(v30, 0, sizeof(v30));
  uint64_t v29 = 0LL;
  memset(v28, 0, sizeof(v28));
  uint64_t v21 = PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)(v36, v34, v32, v30, v28, 0LL);
  uint64_t v22 = static Font.headline.getter(v21);
  uint64_t KeyPath = swift_getKeyPath(&unk_153D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v19, v14);
  uint64_t v24 = (uint64_t *)(v13 + *(int *)(v9 + 36));
  *uint64_t v24 = KeyPath;
  v24[1] = v22;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v14);
  unint64_t v25 = sub_CCD8();
  View.componentName(_:)(0x6C646E7542707061LL, 0xEB00000000644965LL, v9, v25);
  sub_CE14(v13, &qword_1C598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, v8, v3);
  uint64_t v26 = a2 + *(int *)(sub_4A60(&qword_1C528) + 52);
  strcpy((char *)v26, "Response_sash");
  *(_WORD *)(v26 + 14) = -4864;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
  sub_D274();
}

uint64_t sub_A13C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char v4 = SuggestionsRFDataModels.SuggestionHelpDataModel.isSaeEnabled.getter(a1);
  sub_906C(a1, v4 & 1, v9);
  uint64_t v5 = v10;
  uint64_t v6 = v11;
  sub_C874(v9, v10);
  uint64_t v7 = View.eraseToAnyView()(v5, v6);
  uint64_t result = sub_4A40(v9);
  *a2 = v7;
  return result;
}

uint64_t sub_A1B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4, v7);
  uint64_t v8 = type metadata accessor for SeparatorStyle(0LL);
  uint64_t v104 = *(void *)(v8 - 8);
  uint64_t v105 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for RFImage(0LL);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = (char *)v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  SuggestionsRFDataModels.SuggestionHelpDataModel.learnMorePunchout.getter(v14);
  uint64_t v18 = v17;
  uint64_t result = swift_bridgeObjectRelease(v17);
  if (v18
    && (uint64_t result = SuggestionsRFDataModels.SuggestionHelpDataModel.learnMorePunchout.getter(result), v20)
    && (uint64_t v21 = v20,
        uint64_t v22 = Data.init(base64Encoded:options:)(result, v20, 0LL),
        unint64_t v24 = v23,
        uint64_t result = swift_bridgeObjectRelease(v21),
        v24 >> 60 != 15))
  {
    uint64_t v101 = sub_4A60(&qword_1C5B0);
    uint64_t v102 = v83;
    uint64_t v100 = *(void *)(v101 - 8);
    __chkstk_darwin(v101, v25);
    uint64_t v98 = (char *)v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v96 = sub_4A60(&qword_1C5B8);
    uint64_t v99 = v83;
    uint64_t v97 = *(void *)(v96 - 8);
    __chkstk_darwin(v96, v27);
    uint64_t v93 = (char *)v83 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v92 = sub_4A60(&qword_1C5C0);
    uint64_t v95 = v83;
    uint64_t v94 = *(void *)(v92 - 8);
    __chkstk_darwin(v92, v29);
    uint64_t v103 = (char *)v83 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v88 = type metadata accessor for ReferenceRichView(0LL);
    uint64_t v91 = v83;
    uint64_t v90 = *(void *)(v88 - 8);
    uint64_t v32 = __chkstk_darwin(v88, v31);
    uint64_t v85 = (char *)v83 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v109 = SuggestionsRFDataModels.SuggestionHelpDataModel.learnMoreCat.getter(v32);
    uint64_t v110 = v34;
    unint64_t v35 = sub_C468();
    uint64_t v36 = Text.init<A>(_:)(&v109, &type metadata for String, v35);
    unint64_t v89 = v24;
    uint64_t v38 = v37;
    uint64_t v86 = (uint64_t)v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    char v40 = v39;
    uint64_t v87 = v5;
    uint64_t v42 = v41;
    v111 = &type metadata for Text;
    uint64_t v112 = &protocol witness table for Text;
    uint64_t v43 = swift_allocObject(&unk_19128, 48LL, 7LL);
    uint64_t v109 = v43;
    *(void *)(v43 + 16) = v36;
    *(void *)(v43 + 24) = v38;
    *(_BYTE *)(v43 + 32) = v40 & 1;
    *(void *)(v43 + 40) = v42;
    uint64_t v108 = 0LL;
    memset(v107, 0, sizeof(v107));
    uint64_t v44 = sub_4A60(&qword_1C5C8);
    v83[2] = v83;
    __chkstk_darwin(v44, v45);
    uint64_t v47 = (char *)v83 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v48 = type metadata accessor for RFImageView(0LL);
    v83[1] = v83;
    uint64_t v84 = v22;
    uint64_t v49 = *(void *)(v48 - 8);
    __chkstk_darwin(v48, v50);
    uint64_t v52 = (char *)v83 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    static RFImage.symbol(_:dark:)(0x6F6C2E656C707061LL, 0xEA00000000006F67LL, 0LL, 0LL);
    uint64_t v53 = RFImageView.init(_:)(v16);
    int v54 = static HierarchicalShapeStyle.secondary.getter(v53);
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v47, v52, v48);
    *(_DWORD *)&v47[*(int *)(v44 + 36)] = v54;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v52, v48);
    unint64_t v55 = sub_CD78();
    uint64_t v56 = View.eraseToAnyView()(v44, v55);
    sub_CE14((uint64_t)v47, &qword_1C5C8);
    v106[3] = &type metadata for AnyView;
    v106[4] = &protocol witness table for AnyView;
    v106[0] = v56;
    uint64_t v57 = v85;
    ReferenceRichView.init(text1:text2:thumbnail:addTint:)(&v109, v107, v106, 0LL);
    uint64_t v59 = v104;
    uint64_t v58 = v105;
    (*(void (**)(char *, void, uint64_t))(v104 + 104))(v11, enum case for SeparatorStyle.remove(_:), v105);
    sub_CEF8(&qword_1C5F0, (uint64_t (*)(uint64_t))&type metadata accessor for ReferenceRichView);
    uint64_t v61 = v60;
    uint64_t v62 = v88;
    View.separators(_:isOverride:)(v11, 0LL, v88, v60);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v11, v58);
    uint64_t v63 = v62;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v57, v62);
    uint64_t v64 = v86;
    sub_C9F8(v2, v86, type metadata accessor for SiriHelpSMARTView);
    uint64_t v65 = *(unsigned __int8 *)(v87 + 80);
    uint64_t v66 = (v65 + 32) & ~v65;
    uint64_t v67 = swift_allocObject(&unk_192E0, v66 + v6, v65 | 7);
    uint64_t v68 = v84;
    unint64_t v69 = v89;
    *(void *)(v67 + 16) = v84;
    *(void *)(v67 + 24) = v69;
    sub_CA28(v64, v67 + v66, type metadata accessor for SiriHelpSMARTView);
    sub_CEE4(v68, v69);
    uint64_t v109 = v63;
    uint64_t v110 = v61;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v109,  &opaque type descriptor for <<opaque return type of View.separators(_:isOverride:)>>,  1LL);
    uint64_t v71 = v93;
    uint64_t v72 = v92;
    uint64_t v73 = v103;
    View.componentTapped(isNavigation:perform:)(0LL, sub_CE8C, v67, v92, OpaqueTypeConformance2);
    swift_release(v67);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v73, v72);
    uint64_t v109 = v72;
    uint64_t v110 = OpaqueTypeConformance2;
    uint64_t v74 = swift_getOpaqueTypeConformance2( &v109,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
    uint64_t v75 = v98;
    uint64_t v76 = v96;
    View.componentName(_:)(0xD000000000000011LL, 0x8000000000016EC0LL, v96, v74);
    (*(void (**)(char *, uint64_t))(v97 + 8))(v71, v76);
    sub_C670(v68, v69);
    uint64_t v77 = sub_4A60(&qword_1C5F8);
    *(void *)(a1 + 24) = v77;
    sub_D120(&qword_1C600, &qword_1C5F8);
    *(void *)(a1 + 32) = v78;
    uint64_t v79 = sub_C72C((void *)a1);
    uint64_t v80 = v100;
    uint64_t v81 = v101;
    (*(void (**)(void *, char *, uint64_t))(v100 + 16))(v79, v75, v101);
    uint64_t v82 = (void *)((char *)v79 + *(int *)(v77 + 52));
    void *v82 = 0xD000000000000019LL;
    v82[1] = 0x8000000000016EE0LL;
    return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v75, v81);
  }

  else
  {
    *(void *)(a1 + 32) = 0LL;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

void sub_A90C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_4A60(&qword_1C430);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionProperty(0LL);
  uint64_t v34 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Command(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_C768(0LL, &qword_1C450, &OBJC_CLASS___SAUIAppPunchOut_ptr);
  sub_C590(a1, a2);
  id v17 = sub_8FEC(a1, a2);
  if (v17)
  {
    *(void *)uint64_t v16 = v17;
    v16[8] = 1;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for Command.aceCommand(_:), v12);
    uint64_t v18 = sub_4A60(&qword_1C438);
    uint64_t v19 = swift_allocObject(v18, 72LL, 7LL);
    *(_OWORD *)(v19 + 16) = xmmword_152B0;
    *(void *)(v19 + 56) = v12;
    *(void *)(v19 + 64) = &protocol witness table for Command;
    uint64_t v20 = sub_C72C((void *)(v19 + 32));
    (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v20, v16, v12);
    ActionProperty.init(_:actionName:)(v19, 0xD000000000000011LL, 0x8000000000016F20LL);
    uint64_t v21 = sub_4A60(&qword_1C440);
    __chkstk_darwin(v21, v22);
    unint64_t v24 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    type metadata accessor for SiriHelpSMARTView(0LL);
    ActionHandler.wrappedValue.getter();
    uint64_t v25 = type metadata accessor for StandardActionHandler(0LL);
    if (sub_56B8((uint64_t)v24, 1LL, v25) == 1)
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v8);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      sub_CE14((uint64_t)v24, &qword_1C440);
    }

    else
    {
      v33[2] = v33;
      uint64_t v26 = (uint64_t)v7;
      uint64_t v27 = v34;
      (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v26, v11, v8);
      sub_5750(v26, 0LL, 1LL, v8);
      uint64_t v28 = sub_4A60(&qword_1C448);
      v33[1] = v33;
      __chkstk_darwin(v28, v29);
      v33[0] = v8;
      uint64_t v31 = (char *)v33 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v32 = type metadata accessor for InteractionType(0LL);
      sub_5750((uint64_t)v31, 1LL, 1LL, v32);
      StandardActionHandler.perform(_:interactionType:)(v26, v31);
      sub_CE14((uint64_t)v31, &qword_1C448);
      sub_CE14(v26, &qword_1C430);
      (*(void (**)(char *, void))(v27 + 8))(v11, v33[0]);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8LL))(v24, v25);
    }
  }

  else
  {
    __break(1u);
  }

void sub_AC94()
{
  uint64_t v1 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v3 = __chkstk_darwin(v1, v2);
  sub_D1C8(v3, v4, v5, v6, v7, v8, v9, v10, v15);
  sub_D308();
  uint64_t v13 = swift_allocObject(&unk_19218, v11, v12);
  sub_D2DC(v13);
  uint64_t v14 = sub_4A60(&qword_1C4C8);
  sub_CAA8();
  ComponentStack.init(content:)(sub_CA54, v0, v14);
  sub_D214();
}

void sub_AD28(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SeparatorStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v181 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v13 = a1 + *(int *)(__chkstk_darwin(v9, v12) + 24);
  char v14 = *(_BYTE *)v13;
  uint64_t v15 = *(void *)(v13 + 8);
  LOBYTE(v200) = v14;
  uint64_t v201 = v15;
  uint64_t v16 = sub_4A60(&qword_1C518);
  id v17 = State.wrappedValue.getter(&v197, v16);
  uint64_t v196 = a2;
  if (v197 == 1)
  {
    uint64_t v18 = sub_4A60(&qword_1C528);
    uint64_t v195 = &v181;
    uint64_t v19 = *(void *)(*(void *)(v18 - 8) + 64LL);
    __chkstk_darwin(v18, v20);
    uint64_t v187 = (char *)((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v194 = (uint64_t *)((char *)&v181 - v187);
    sub_9F04( (uint64_t (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.unsupportedAppHeader.getter,  (char *)&v181 - v187);
    uint64_t v21 = sub_4A60(&qword_1C580);
    char v192 = &v181;
    char v193 = (uint64_t *)v21;
    uint64_t v22 = *(void **)(v21 - 8);
    uint64_t v23 = (char *)&v181 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v24 = v22[8];
    uint64_t v26 = __chkstk_darwin(v21, v25);
    uint64_t v185 = (char *)((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = (char *)((char *)&v181 - v185);
    uint64_t v200 = SuggestionsRFDataModels.SuggestionHelpDataModel.seeOtherSuggestionsButton.getter(v26);
    uint64_t v201 = v28;
    sub_C9F8(a1, (uint64_t)v23, type metadata accessor for SiriHelpSMARTView);
    uint64_t v29 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v30 = (v29 + 16) & ~v29;
    uint64_t v31 = swift_allocObject(&unk_19290, v30 + v11, v29 | 7);
    sub_CA28((uint64_t)v23, v31 + v30, type metadata accessor for SiriHelpSMARTView);
    unint64_t v32 = sub_C468();
    v186 = (uint64_t *)v27;
    Button<>.init<A>(_:action:)(&v200, sub_CCBC, v31, &type metadata for String, v32);
    uint64_t v189 = (uint64_t *)sub_4A60(&qword_1C4E0);
    uint64_t v191 = &v181;
    __chkstk_darwin(v189, v33);
    unint64_t v35 = (char *)&v181 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v36 = sub_4A60(&qword_1C4F0);
    uint64_t v190 = &v181;
    uint64_t v38 = __chkstk_darwin(v36, v37);
    char v40 = (char *)&v181 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v188 = &v181;
    __chkstk_darwin(v38, v41);
    uint64_t v42 = (char *)((char *)&v181 - v187);
    sub_D09C((uint64_t)v194, (char *)&v181 - v187, &qword_1C528);
    uint64_t v187 = (char *)&v181;
    __chkstk_darwin(v43, v44);
    uint64_t v45 = (char *)((char *)&v181 - v185);
    uint64_t v46 = (void (*)(int64_t, char *, uint64_t *))v22[2];
    uint64_t v47 = v193;
    v46((char *)&v181 - v185, v27, v193);
    sub_D09C((uint64_t)v42, (uint64_t)v40, &qword_1C528);
    uint64_t v48 = sub_4A60(&qword_1C588);
    v46((int64_t)&v40[*(int *)(v48 + 48)], v45, v47);
    uint64_t v185 = (char *)v22[1];
    ((void (*)(char *, uint64_t *))v185)(v45, v47);
    sub_CE14((uint64_t)v42, &qword_1C528);
    uint64_t v49 = sub_4A60(&qword_1C578);
    __chkstk_darwin(v49, v50);
    uint64_t v52 = (char *)&v181 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_D09C((uint64_t)v40, (uint64_t)v52, &qword_1C4F0);
    swift_storeEnumTagMultiPayload(v52, v49, 0LL);
    uint64_t v53 = sub_4A60(&qword_1C500);
    sub_D120(&qword_1C4E8, &qword_1C4F0);
    uint64_t v55 = v54;
    sub_D120(&qword_1C4F8, &qword_1C500);
    _ConditionalContent<>.init(storage:)(v52, v36, v53, v55, v56);
    sub_CE14((uint64_t)v40, &qword_1C4F0);
    uint64_t v57 = sub_4A60(&qword_1C550);
    __chkstk_darwin(v57, v58);
    uint64_t v60 = (char *)&v181 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_D09C((uint64_t)v35, (uint64_t)v60, &qword_1C4E0);
    swift_storeEnumTagMultiPayload(v60, v57, 0LL);
    uint64_t v61 = sub_4A60(&qword_1C510);
    unint64_t v62 = sub_CB2C();
    sub_D120(&qword_1C508, &qword_1C510);
    _ConditionalContent<>.init(storage:)(v60, v189, v61, v62, v63);
    sub_CE14((uint64_t)v35, &qword_1C4E0);
    ((void (*)(uint64_t *, uint64_t *))v185)(v186, v193);
    sub_CE14((uint64_t)v194, &qword_1C528);
  }

  else
  {
    char v193 = (uint64_t *)v10;
    uint64_t v194 = (uint64_t *)((char *)&v181 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if ((SuggestionsRFDataModels.SuggestionHelpDataModel.isSaeEnabled.getter(v17) & 1) != 0)
    {
      uint64_t v64 = sub_4A60(&qword_1C558);
      uint64_t v195 = &v181;
      uint64_t v191 = *(uint64_t **)(v64 - 8);
      char v192 = (uint64_t *)v64;
      __chkstk_darwin(v64, v65);
      uint64_t v190 = v66;
      uint64_t v67 = (char *)&v181 - (((unint64_t)v66 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v68 = type metadata accessor for DisambiguationTitle(0LL);
      uint64_t v69 = *(void *)(v68 - 8);
      uint64_t v71 = __chkstk_darwin(v68, v70);
      uint64_t v73 = (char *)&v181 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v75 = __chkstk_darwin(v71, v74);
      uint64_t v77 = (char *)&v181 - v76;
      uint64_t v78 = SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpHeader.getter(v75);
      uint64_t v202 = &type metadata for String;
      v203 = &protocol witness table for String;
      uint64_t v200 = v78;
      uint64_t v201 = v79;
      uint64_t v199 = 0LL;
      __int128 v197 = 0u;
      __int128 v198 = 0u;
      DisambiguationTitle.init(text1:thumbnail:)(&v200, &v197);
      sub_CEF8(&qword_1C560, (uint64_t (*)(uint64_t))&type metadata accessor for DisambiguationTitle);
      uint64_t v81 = View.eraseToAnyView()(v68, v80);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v77, v68);
      uint64_t v202 = &type metadata for AnyView;
      v203 = &protocol witness table for AnyView;
      uint64_t v200 = v81;
      uint64_t v199 = 0LL;
      __int128 v197 = 0u;
      __int128 v198 = 0u;
      DisambiguationTitle.init(text1:thumbnail:)(&v200, &v197);
      uint64_t v82 = (uint64_t)v194;
      sub_C9F8(a1, (uint64_t)v194, type metadata accessor for SiriHelpSMARTView);
      uint64_t v83 = *((unsigned __int8 *)v193 + 80);
      uint64_t v84 = (v83 + 16) & ~v83;
      uint64_t v85 = swift_allocObject(&unk_19268, v84 + v11, v83 | 7);
      sub_CA28(v82, v85 + v84, type metadata accessor for SiriHelpSMARTView);
      uint64_t v86 = sub_4A60(&qword_1C538);
      sub_D120(&qword_1C568, &qword_1C538);
      uint64_t v87 = v67;
      DisambiguationView.init(title:content:)(v73, sub_CCA4, v85, v86, v88);
      sub_A1B8((uint64_t)&v197);
      if (*((void *)&v198 + 1))
      {
        sub_CC88(&v197, (uint64_t)&v200);
        unint64_t v89 = v202;
        uint64_t v90 = v203;
        sub_C874(&v200, (uint64_t)v202);
        uint64_t v91 = View.eraseToAnyView()(v89, v90);
        sub_4A40(&v200);
      }

      else
      {
        sub_CE14((uint64_t)&v197, &qword_1C540);
        uint64_t v91 = 0LL;
      }

      uint64_t v189 = (uint64_t *)sub_4A60(&qword_1C4E0);
      uint64_t v194 = &v181;
      __chkstk_darwin(v189, v129);
      uint64_t v131 = (char *)&v181 - ((v130 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v186 = (uint64_t *)sub_4A60(&qword_1C500);
      char v193 = &v181;
      uint64_t v133 = __chkstk_darwin(v186, v132);
      uint64_t v135 = (char *)&v181 - ((v134 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      unint64_t v188 = &v181;
      __chkstk_darwin(v133, v136);
      uint64_t v138 = (char *)&v181 - ((v137 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v139 = v191;
      uint64_t v140 = v192;
      v141 = (void (*)(char *, char *, uint64_t *))v191[2];
      uint64_t v187 = v87;
      v141(v138, v87, v192);
      v141(v135, v138, v140);
      *(void *)&v135[*(int *)(sub_4A60(&qword_1C570) + 48)] = v91;
      uint64_t v142 = (uint64_t *)v139[1];
      uint64_t v191 = v142;
      swift_retain(v91);
      ((void (*)(char *, uint64_t *))v142)(v138, v140);
      uint64_t v143 = sub_4A60(&qword_1C578);
      __chkstk_darwin(v143, v144);
      v146 = (char *)&v181 - ((v145 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_D09C((uint64_t)v135, (uint64_t)v146, &qword_1C500);
      swift_storeEnumTagMultiPayload(v146, v143, 1LL);
      uint64_t v147 = sub_4A60(&qword_1C4F0);
      sub_D120(&qword_1C4E8, &qword_1C4F0);
      uint64_t v149 = v148;
      sub_D120(&qword_1C4F8, &qword_1C500);
      _ConditionalContent<>.init(storage:)(v146, v147, v186, v149, v150);
      sub_CE14((uint64_t)v135, &qword_1C500);
      uint64_t v151 = sub_4A60(&qword_1C550);
      __chkstk_darwin(v151, v152);
      v154 = (char *)&v181 - ((v153 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_D09C((uint64_t)v131, (uint64_t)v154, &qword_1C4E0);
      swift_storeEnumTagMultiPayload(v154, v151, 0LL);
      uint64_t v155 = sub_4A60(&qword_1C510);
      unint64_t v156 = sub_CB2C();
      sub_D120(&qword_1C508, &qword_1C510);
      _ConditionalContent<>.init(storage:)(v154, v189, v155, v156, v157);
      swift_release(v91);
      sub_CE14((uint64_t)v131, &qword_1C4E0);
      ((void (*)(char *, uint64_t *))v191)(v187, v140);
    }

    else
    {
      char v192 = (uint64_t *)sub_4A60(&qword_1C520);
      uint64_t v195 = &v181;
      uint64_t v190 = (uint64_t *)*(v192 - 1);
      uint64_t v93 = __chkstk_darwin(v192, v92);
      uint64_t v95 = (char *)&v181 - (((unint64_t)v94 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      unint64_t v188 = v94;
      uint64_t v189 = &v181;
      __chkstk_darwin(v93, v96);
      uint64_t v98 = (char *)&v181 - v97;
      uint64_t v99 = sub_4A60(&qword_1C528);
      uint64_t v191 = &v181;
      __chkstk_darwin(v99, v100);
      uint64_t v102 = (char *)&v181 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_9F04((uint64_t (*)(void))&SuggestionsRFDataModels.SuggestionHelpDataModel.siriHelpHeader.getter, (uint64_t)v102);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for SeparatorStyle.remove(_:), v4);
      sub_D120(&qword_1C530, &qword_1C528);
      View.separators(_:isOverride:)(v8, 0LL, v99, v103);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      sub_CE14((uint64_t)v102, &qword_1C528);
      uint64_t v104 = (void (*)(char *, char *, uint64_t *))v190[4];
      uint64_t v191 = (uint64_t *)v95;
      v104(v95, v98, v192);
      uint64_t v184 = sub_4A60(&qword_1C538);
      uint64_t v189 = &v181;
      uint64_t v106 = __chkstk_darwin(v184, v105);
      uint64_t v185 = (char *)&v181 - ((unint64_t)(v107 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v186 = &v181;
      uint64_t v187 = v107;
      __chkstk_darwin(v106, v108);
      uint64_t v110 = (char *)&v181 - v109;
      uint64_t v111 = sub_4A60(&qword_1C3B8);
      uint64_t v183 = &v181;
      uint64_t v112 = *(void *)(v111 - 8);
      uint64_t v114 = __chkstk_darwin(v111, v113);
      uint64_t v116 = (char *)&v181 - ((v115 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v200 = SuggestionsRFDataModels.SuggestionHelpDataModel.suggestions.getter(v114);
      uint64_t KeyPath = swift_getKeyPath(&unk_15408);
      uint64_t v117 = (uint64_t)v194;
      sub_C9F8(a1, (uint64_t)v194, type metadata accessor for SiriHelpSMARTView);
      uint64_t v118 = *((unsigned __int8 *)v193 + 80);
      uint64_t v119 = (v118 + 16) & ~v118;
      uint64_t v120 = swift_allocObject(&unk_19240, v119 + v11, v118 | 7);
      sub_CA28(v117, v120 + v119, type metadata accessor for SiriHelpSMARTView);
      uint64_t v121 = sub_4A60(&qword_1C460);
      unint64_t v122 = sub_C7D4();
      unint64_t v123 = sub_C818();
      ForEach<>.init(_:id:content:)( &v200,  KeyPath,  sub_CC24,  v120,  v121,  &type metadata for AnyView,  v122,  v123,  &protocol witness table for AnyView);
      (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v110, v116, v111);
      uint64_t v124 = &v110[*(int *)(v184 + 52)];
      strcpy(v124, "Response_full");
      *((_WORD *)v124 + 7) = -4864;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v116, v111);
      v125 = v185;
      sub_CC5C((uint64_t)v110, (uint64_t)v185, &qword_1C538);
      sub_A1B8((uint64_t)&v197);
      if (*((void *)&v198 + 1))
      {
        sub_CC88(&v197, (uint64_t)&v200);
        uint64_t v126 = v202;
        v127 = v203;
        sub_C874(&v200, (uint64_t)v202);
        uint64_t v128 = View.eraseToAnyView()(v126, v127);
        sub_4A40(&v200);
      }

      else
      {
        sub_CE14((uint64_t)&v197, &qword_1C540);
        uint64_t v128 = 0LL;
      }

      v186 = (uint64_t *)sub_4A60(&qword_1C510);
      uint64_t v194 = &v181;
      uint64_t v159 = __chkstk_darwin(v186, v158);
      v161 = (char *)&v181 - ((v160 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      char v193 = &v181;
      __chkstk_darwin(v159, v162);
      unint64_t v164 = (char *)&v181 - ((v163 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v165 = v190;
      uint64_t v166 = (uint64_t (*)(char *, uint64_t *, uint64_t *))v190[2];
      uint64_t v167 = v192;
      uint64_t v168 = v166(v164, v191, v192);
      unint64_t v188 = &v181;
      __chkstk_darwin(v168, v169);
      uint64_t v171 = (char *)&v181 - ((v170 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_D09C((uint64_t)v125, (uint64_t)v171, &qword_1C538);
      v166(v161, (uint64_t *)v164, v167);
      uint64_t v172 = sub_4A60(&qword_1C548);
      sub_D09C((uint64_t)v171, (uint64_t)&v161[*(int *)(v172 + 48)], &qword_1C538);
      *(void *)&v161[*(int *)(v172 + 64)] = v128;
      swift_retain(v128);
      sub_CE14((uint64_t)v171, &qword_1C538);
      uint64_t v173 = (void (*)(char *, uint64_t *))v165[1];
      v173(v164, v167);
      uint64_t v174 = sub_4A60(&qword_1C550);
      __chkstk_darwin(v174, v175);
      v177 = (char *)&v181 - ((v176 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_D09C((uint64_t)v161, (uint64_t)v177, &qword_1C510);
      swift_storeEnumTagMultiPayload(v177, v174, 1LL);
      uint64_t v178 = sub_4A60(&qword_1C4E0);
      unint64_t v179 = sub_CB2C();
      sub_D120(&qword_1C508, &qword_1C510);
      _ConditionalContent<>.init(storage:)(v177, v178, v186, v179, v180);
      swift_release(v128);
      sub_CE14((uint64_t)v161, &qword_1C510);
      sub_CE14((uint64_t)v125, &qword_1C538);
      v173((char *)v191, v167);
    }
  }

uint64_t sub_BE38(uint64_t a1)
{
  uint64_t v1 = (char *)(a1 + *(int *)(type metadata accessor for SiriHelpSMARTView(0LL) + 24));
  char v2 = *v1;
  uint64_t v3 = *((void *)v1 + 1);
  v6[1] = v2;
  uint64_t v7 = v3;
  v6[0] = 0;
  uint64_t v4 = sub_4A60(&qword_1C518);
  return State.wrappedValue.setter(v6, v4);
}

uint64_t sub_BE9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4, v7);
  uint64_t v8 = sub_4A60(&qword_1C3B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = SuggestionsRFDataModels.SuggestionHelpDataModel.suggestions.getter(v11);
  uint64_t KeyPath = swift_getKeyPath(&unk_15408);
  sub_C9F8(a1, (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), type metadata accessor for SiriHelpSMARTView);
  uint64_t v15 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v17 = swift_allocObject(&unk_192B8, v16 + v6, v15 | 7);
  sub_CA28((uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), v17 + v16, type metadata accessor for SiriHelpSMARTView);
  uint64_t v18 = sub_4A60(&qword_1C460);
  unint64_t v19 = sub_C7D4();
  unint64_t v20 = sub_C818();
  ForEach<>.init(_:id:content:)( &v24,  KeyPath,  sub_CC24,  v17,  v18,  &type metadata for AnyView,  v19,  v20,  &protocol witness table for AnyView);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a2, v13, v8);
  uint64_t v21 = a2 + *(int *)(sub_4A60(&qword_1C538) + 52);
  strcpy((char *)v21, "Response_full");
  *(_WORD *)(v21 + 14) = -4864;
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v8);
}

uint64_t sub_C074(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_16BAC, 1LL);
}

uint64_t sub_C088()
{
  return sub_CA68(type metadata accessor for SiriHelpSnippetView, (uint64_t (*)(uint64_t))sub_6B7C);
}

uint64_t sub_C09C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2, v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4, v7);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10)
  {
    uint64_t v12 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_4A60(&qword_1C4B0);
  uint64_t result = static _SetStorage.allocate(capacity:)(v10);
  uint64_t v12 = (void *)result;
  uint64_t v34 = *(void *)(a1 + 16);
  if (!v34)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v12;
  }

  unint64_t v13 = 0LL;
  uint64_t v36 = result + 56;
  uint64_t v14 = *(unsigned __int8 *)(v37 + 80);
  uint64_t v32 = a1;
  uint64_t v33 = a1 + ((v14 + 32) & ~v14);
  while (v13 < *(void *)(a1 + 16))
  {
    uint64_t v15 = *(void *)(v37 + 72);
    uint64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
    v16(v9, v33 + v15 * v13, v2);
    uint64_t v17 = v12[5];
    sub_C9C4(&qword_1C4B8);
    uint64_t v19 = dispatch thunk of Hashable._rawHashValue(seed:)(v17, v2, v18);
    uint64_t v20 = -1LL << *((_BYTE *)v12 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    uint64_t v23 = *(void *)(v36 + 8 * (v21 >> 6));
    uint64_t v24 = 1LL << v21;
    if (((1LL << v21) & v23) != 0)
    {
      unint64_t v35 = v13;
      uint64_t v25 = ~v20;
      while (1)
      {
        v16(v6, v12[6] + v21 * v15, v2);
        sub_C9C4(&qword_1C4C0);
        char v27 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v9, v2, v26);
        uint64_t v28 = *(void (**)(char *, uint64_t))(v37 + 8);
        v28(v6, v2);
        if ((v27 & 1) != 0) {
          break;
        }
        unint64_t v21 = (v21 + 1) & v25;
        unint64_t v22 = v21 >> 6;
        uint64_t v23 = *(void *)(v36 + 8 * (v21 >> 6));
        uint64_t v24 = 1LL << v21;
        if ((v23 & (1LL << v21)) == 0)
        {
          a1 = v32;
          unint64_t v13 = v35;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v9, v2);
      a1 = v32;
      unint64_t v13 = v35;
    }

    else
    {
LABEL_10:
      *(void *)(v36 + 8 * v22) = v24 | v23;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32))(v12[6] + v21 * v15, v9, v2);
      uint64_t v29 = v12[2];
      BOOL v30 = __OFADD__(v29, 1LL);
      uint64_t v31 = v29 + 1;
      if (v30) {
        goto LABEL_18;
      }
      v12[2] = v31;
    }

    if (++v13 == v34) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_C330()
{
  uint64_t v0 = sub_D198();
  sub_D17C(v0);
  uint64_t v1 = sub_D190();
  sub_D158(v1);
  sub_D1EC();
  return sub_D16C();
}

void sub_C384()
{
}

void sub_C3A0(uint64_t (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriHelpSnippetView(0LL);
  uint64_t v7 = sub_D1FC(v6);
  sub_87FC(v7, a1, a2, a3);
  sub_D214();
}

unint64_t sub_C3EC()
{
  unint64_t result = qword_1C3C0;
  if (!qword_1C3C0)
  {
    uint64_t v1 = sub_4BC8(&qword_1C3B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_1C3C0);
  }

  return result;
}

void sub_C44C()
{
}

unint64_t sub_C468()
{
  unint64_t result = qword_1C410;
  if (!qword_1C410)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1C410);
  }

  return result;
}

uint64_t sub_C4A4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_C4D4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_C4E4()
{
  uint64_t v0 = sub_D198();
  sub_D17C(v0);
  uint64_t v1 = sub_D190();
  sub_D158(v1);
  sub_D1EC();
  return sub_D16C();
}

uint64_t sub_C538(uint64_t result, unint64_t a2)
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

uint64_t sub_C57C()
{
  return sub_CEA0( type metadata accessor for SiriHelpSnippetView,  (uint64_t (*)(void, void, uint64_t))sub_8C68);
}

uint64_t sub_C590(uint64_t result, unint64_t a2)
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

unint64_t sub_C5D4()
{
  unint64_t result = qword_1C418;
  if (!qword_1C418)
  {
    uint64_t v1 = sub_4BC8(&qword_1C408);
    sub_CEF8(&qword_1C420, (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemStandardView);
    sub_D120((unint64_t *)&qword_1C210, &qword_1C218);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C418);
  }

  return result;
}

uint64_t sub_C670(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_C538(result, a2);
  }
  return result;
}

uint64_t sub_C684()
{
  sub_D370();
  uint64_t v1 = sub_D198();
  sub_D17C(v1);
  uint64_t v2 = sub_D190();
  sub_D158(v2);
  sub_D1EC();
  return sub_D16C();
}

void sub_C6FC()
{
}

void *sub_C72C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_C768(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_C7A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriHelpSuggestion.suggestionId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_C7D4()
{
  unint64_t result = qword_1C468;
  if (!qword_1C468)
  {
    uint64_t v1 = sub_4BC8(&qword_1C460);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1C468);
  }

  return result;
}

unint64_t sub_C818()
{
  unint64_t result = qword_1C470;
  if (!qword_1C470)
  {
    uint64_t v1 = sub_4BC8(&qword_1C478);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1C470);
  }

  return result;
}

void *sub_C874(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_C898(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_C8A8()
{
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(sub_D38C() - 8);
  sub_D2AC();
  sub_D370();
  uint64_t v7 = sub_D198();
  sub_D158(v7);
  uint64_t v8 = sub_D190();
  sub_D158(v8);
  return swift_deallocObject(v0, v6, v1);
}

void sub_C940()
{
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriHelpSnippetView(0LL) - 8) + 80LL);
  sub_6640((uint64_t *)(v1 + v0), v1 + ((v0 + v3 + v4) & ~v4));
}

void sub_C994()
{
  uint64_t v0 = sub_D28C();
  sub_892C(v0, v1);
  sub_D2FC();
}

void sub_C9C4(unint64_t *a1)
{
  if (!*a1)
  {
    uint64_t v2 = type metadata accessor for _ProtoIdiom(255LL);
    atomic_store(sub_D2F0(v2), a1);
  }

  sub_51B8();
}

void sub_C9F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_D330(a1, a2, a3);
  sub_D248(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_51B8();
}

void sub_CA28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_D330(a1, a2, a3);
  sub_D248(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_51B8();
}

uint64_t sub_CA54()
{
  return sub_CA68(type metadata accessor for SiriHelpSMARTView, (uint64_t (*)(uint64_t))sub_AD28);
}

uint64_t sub_CA68(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = a1(0LL);
  uint64_t v3 = sub_D1FC(v2);
  return a2(v3);
}

unint64_t sub_CAA8()
{
  unint64_t result = qword_1C4D0;
  if (!qword_1C4D0)
  {
    uint64_t v1 = sub_4BC8(&qword_1C4C8);
    sub_CB2C();
    sub_D120(&qword_1C508, &qword_1C510);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C4D0);
  }

  return result;
}

unint64_t sub_CB2C()
{
  unint64_t result = qword_1C4D8;
  if (!qword_1C4D8)
  {
    uint64_t v1 = sub_4BC8(&qword_1C4E0);
    sub_D120(&qword_1C4E8, &qword_1C4F0);
    sub_D120(&qword_1C4F8, &qword_1C500);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C4D8);
  }

  return result;
}

uint64_t sub_CBD4()
{
  uint64_t v0 = sub_D198();
  sub_D17C(v0);
  sub_D394();
  sub_D360();
  uint64_t v1 = sub_D190();
  sub_D158(v1);
  sub_D1EC();
  return sub_D16C();
}

uint64_t sub_CC28()
{
  uint64_t v0 = sub_D28C();
  return sub_A13C(v0, v1);
}

void sub_CC5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_D320(a1, a2, a3);
  sub_D248(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_51B8();
}

uint64_t sub_CC88(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_CCA4()
{
  return sub_CA68(type metadata accessor for SiriHelpSMARTView, (uint64_t (*)(uint64_t))sub_BE9C);
}

uint64_t sub_CCBC()
{
  uint64_t v0 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v1 = sub_D1FC(v0);
  return sub_BE38(v1);
}

unint64_t sub_CCD8()
{
  unint64_t result = qword_1C5A0;
  if (!qword_1C5A0)
  {
    uint64_t v1 = sub_4BC8(&qword_1C598);
    sub_CEF8(&qword_1C5A8, (uint64_t (*)(uint64_t))&type metadata accessor for PrimaryHeaderRichView);
    sub_D120((unint64_t *)&qword_1C210, &qword_1C218);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C5A0);
  }

  return result;
}

unint64_t sub_CD78()
{
  unint64_t result = qword_1C5D0;
  if (!qword_1C5D0)
  {
    uint64_t v1 = sub_4BC8(&qword_1C5C8);
    sub_CEF8(&qword_1C5D8, (uint64_t (*)(uint64_t))&type metadata accessor for RFImageView);
    sub_D120(&qword_1C5E0, &qword_1C5E8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C5D0);
  }

  return result;
}

void sub_CE14(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_4A60(a2);
  sub_D158(v2);
  sub_51B8();
}

uint64_t sub_CE3C()
{
  uint64_t v0 = sub_D198();
  sub_D17C(v0);
  sub_D394();
  sub_D360();
  uint64_t v1 = sub_D190();
  sub_D158(v1);
  sub_D1EC();
  return sub_D16C();
}

uint64_t sub_CE8C()
{
  return sub_CEA0( type metadata accessor for SiriHelpSMARTView,  (uint64_t (*)(void, void, uint64_t))sub_A90C);
}

uint64_t sub_CEA0(uint64_t (*a1)(void), uint64_t (*a2)(void, void, uint64_t))
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1(0LL) - 8) + 80LL);
  return a2(*(void *)(v2 + 16), *(void *)(v2 + 24), v2 + ((v3 + 32) & ~v3));
}

uint64_t sub_CEE4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_C590(result, a2);
  }
  return result;
}

void sub_CEF8(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_D2F0(v3), a1);
  }

  sub_51B8();
}

uint64_t sub_CF2C()
{
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v5 = type metadata accessor for SiriHelpSMARTView(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = v7 + *(void *)(v6 + 64);
  sub_D2AC();
  swift_release(*(void *)(v0 + v4));
  uint64_t v9 = sub_D198();
  sub_D158(v9);

  swift_release(*(void *)(v0 + v7 + *(int *)(v5 + 24) + 8));
  uint64_t v10 = sub_D190();
  sub_D158(v10);
  return swift_deallocObject(v0, v8, v1);
}

void sub_CFF4()
{
  unint64_t v3 = (*(void *)(v2 + 64) + v0 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriHelpSMARTView(0LL) - 8) + 80LL);
  sub_97A4(v1 + v0, *(void *)(v1 + v3), v1 + ((v3 + v4 + 8) & ~v4));
}

uint64_t sub_D054(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4A60(&qword_1C430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

void sub_D09C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_D320(a1, a2, a3);
  sub_D248(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_51B8();
}

void sub_D0C8()
{
}

void sub_D0F4()
{
}

void sub_D120(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_4BC8(a2);
    atomic_store(sub_D2F0(v3), a1);
  }

  sub_51B8();
}

uint64_t sub_D158(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_D16C()
{
  return ((uint64_t (*)(void))swift_deallocObject)();
}

uint64_t sub_D17C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_D190()
{
  return type metadata accessor for ActionHandler(0LL);
}

uint64_t sub_D198()
{
  return type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(0LL);
}

uint64_t sub_D1A0()
{
  return sub_C538(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_D1C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_D1EC()
{
  return v0;
}

uint64_t sub_D1FC(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL);
  return v1 + ((v2 + 16) & ~v2);
}

  ;
}

  ;
}

uint64_t sub_D248@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_D254@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  int v1 = a1 - 1;
  if (v1 < 0) {
    int v1 = -1;
  }
  return (v1 + 1);
}

  ;
}

uint64_t sub_D28C()
{
  return v0;
}

uint64_t sub_D2AC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t sub_D2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_56B8(a1, a2, a3);
}

uint64_t sub_D2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_5750(a1, a2, a3, a4);
}

void sub_D2DC(uint64_t a1)
{
}

uint64_t sub_D2F0(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

  ;
}

  ;
}

uint64_t sub_D320(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_4A60(a3);
}

uint64_t sub_D330(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_D340()
{
  return type metadata accessor for SiriHelpSuggestion(0LL);
}

  ;
}

uint64_t sub_D360()
{
  return swift_release(*(void *)(v1 + *(int *)(v0 + 24) + 8));
}

void sub_D370()
{
}

  ;
}

uint64_t sub_D38C()
{
  return type metadata accessor for SiriHelpSnippetView(0LL);
}

void sub_D394()
{
}

uint64_t SiriSuggestionsUIPlugin.__allocating_init()()
{
  uint64_t v1 = v0;
  type metadata accessor for SiriSuggestionsFacade(0LL);
  uint64_t v2 = SiriSuggestionsFacade.__allocating_init()();
  uint64_t result = sub_E88C(v1);
  *(void *)(result + 16) = v2;
  return result;
}

void SiriSuggestionsUIPlugin.__allocating_init(suggestionsFacade:)(uint64_t a1)
{
  *(void *)(sub_E88C(v1) + 16) = a1;
  sub_51B8();
}

uint64_t SiriSuggestionsUIPlugin.init(suggestionsFacade:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t SiriSuggestionsUIPlugin.snippet(for:mode:idiom:)(void (*a1)(void, void))
{
  uint64_t v139 = a1;
  uint64_t v2 = v1;
  uint64_t v128 = type metadata accessor for SiriHelpSnippetView(0LL);
  sub_E810();
  __chkstk_darwin(v3, v4);
  sub_E7D4();
  uint64_t v129 = v5;
  uint64_t v6 = sub_E828();
  uint64_t v130 = type metadata accessor for SiriHelpSMARTView(v6);
  sub_E810();
  __chkstk_darwin(v7, v8);
  sub_E7D4();
  uint64_t v131 = v9;
  uint64_t v10 = sub_E828();
  uint64_t v11 = type metadata accessor for SuggestionsRFDataModels.SuggestionHelpDataModel(v10);
  uint64_t v133 = *(void *)(v11 - 8);
  uint64_t v134 = v11;
  __chkstk_darwin(v11, v12);
  sub_E7D4();
  uint64_t v132 = v13;
  uint64_t v14 = sub_E828();
  uint64_t v125 = type metadata accessor for SiriFeatureAnnouncementSnippetView(v14);
  sub_E810();
  __chkstk_darwin(v15, v16);
  sub_E7D4();
  uint64_t v127 = v17;
  uint64_t v18 = sub_E828();
  uint64_t v126 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(v18);
  uint64_t v124 = *(void *)(v126 - 8);
  __chkstk_darwin(v126, v19);
  sub_E7D4();
  uint64_t v123 = v20;
  uint64_t v21 = sub_E828();
  uint64_t v22 = type metadata accessor for SiriHintsSnippetView(v21);
  sub_E810();
  __chkstk_darwin(v23, v24);
  uint64_t v26 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v29);
  sub_E870();
  uint64_t v135 = v30;
  __chkstk_darwin(v31, v32);
  uint64_t v136 = (uint8_t *)&v120 - v33;
  uint64_t v34 = sub_E828();
  uint64_t v138 = type metadata accessor for SuggestionsRFDataModels(v34);
  uint64_t v35 = *(void *)(v138 - 8);
  __chkstk_darwin(v138, v36);
  sub_E870();
  uint64_t v121 = v37;
  uint64_t v40 = __chkstk_darwin(v38, v39);
  unint64_t v122 = (char *)&v120 - v41;
  __chkstk_darwin(v40, v42);
  uint64_t v44 = (char *)&v120 - v43;
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v45 = type metadata accessor for Logger(0LL);
  uint64_t v137 = sub_41C8(v45, (uint64_t)static Logger.uiCategory);
  uint64_t v46 = (os_log_s *)Logger.logObject.getter(v137);
  os_log_type_t v47 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)sub_E804();
    uint64_t v120 = v28;
    uint64_t v49 = v35;
    uint64_t v50 = v22;
    uint64_t v51 = v27;
    uint64_t v52 = v44;
    uint64_t v53 = v26;
    uint64_t v54 = v2;
    uint64_t v55 = v48;
    *(_WORD *)uint64_t v48 = 0;
    _os_log_impl(&dword_0, v46, v47, "Running Suggestions UI plugin", v48, 2u);
    uint64_t v56 = (uint64_t)v55;
    uint64_t v2 = v54;
    uint64_t v26 = v53;
    uint64_t v44 = v52;
    uint64_t v27 = v51;
    uint64_t v22 = v50;
    uint64_t v35 = v49;
    uint64_t v28 = v120;
    sub_E7E8(v56);
  }

  uint64_t v57 = *(void (**)(void, void))(v2 + 16);
  if (v57)
  {
    uint64_t v58 = *(void (**)(char *, void (*)(void, void), uint64_t))(v35 + 16);
    uint64_t v59 = v138;
    v58(v44, v139, v138);
    int v60 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v44, v59);
    if (v60 == enum case for SuggestionsRFDataModels.hintsView(_:))
    {
      sub_E7F4();
      uint64_t v61 = v136;
      (*(void (**)(uint8_t *, char *, uint64_t))(v28 + 32))(v136, v44, v27);
      uint64_t v62 = v135;
      (*(void (**)(uint64_t, uint8_t *, uint64_t))(v28 + 16))(v135, v61, v27);
      uint64_t v63 = swift_retain_n(v57, 2LL);
      sub_F000(v63, v62, (uint64_t)v26);
      sub_E85C(&qword_1C668);
      uint64_t v64 = (uint64_t)v26;
      View.eraseToAnyView()(v22, v65);
      sub_E834();
      sub_E8B8((uint64_t)v26);
      (*(void (**)(uint8_t *, uint64_t))(v28 + 8))(v61, v27);
    }

    else if (v60 == enum case for SuggestionsRFDataModels.helpView(_:))
    {
      sub_E7F4();
      uint64_t v71 = v132;
      uint64_t v70 = v133;
      uint64_t v72 = v134;
      (*(void (**)(uint64_t, char *, uint64_t))(v133 + 32))(v132, v44, v134);
      uint64_t v73 = sub_E898();
      char v74 = SuggestionsRFDataModels.SuggestionHelpDataModel.isSmartSnippet.getter(v73);
      uint64_t v75 = (os_log_s *)sub_E884();
      os_log_type_t v76 = static os_log_type_t.info.getter();
      BOOL v77 = os_log_type_enabled(v75, v76);
      if ((v74 & 1) != 0)
      {
        if (v77)
        {
          uint64_t v78 = (_WORD *)sub_E804();
          *uint64_t v78 = 0;
          sub_E840(&dword_0, v75, v76, "returning Siri Help SMART snippet");
          sub_E7E8((uint64_t)v78);
        }

        uint64_t v79 = v131;
        uint64_t v80 = sub_E8A0(v131, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 16));
        char v81 = SuggestionsRFDataModels.SuggestionHelpDataModel.isUnsupportedSnippet.getter(v80);
        uint64_t v82 = v130;
        uint64_t v83 = (void *)(v79 + *(int *)(v130 + 20));
        type metadata accessor for Context(0LL);
        sub_4AA0();
        uint64_t v84 = sub_E8AC();
        void *v83 = EnvironmentObject.init()(v84, v85);
        v83[1] = v86;
        uint64_t v87 = v79 + *(int *)(v82 + 24);
        LOBYTE(v142) = v81 & 1;
        uint64_t v88 = sub_E864();
        uint64_t v89 = v141;
        *(_BYTE *)uint64_t v87 = v140;
        *(void *)(v87 + 8) = v89;
        ActionHandler.init()(v88);
        sub_E85C(&qword_1C658);
        uint64_t v64 = v79;
        View.eraseToAnyView()(v82, v90);
        sub_E834();
        uint64_t v91 = v79;
      }

      else
      {
        if (v77)
        {
          uint64_t v100 = (_WORD *)sub_E804();
          _WORD *v100 = 0;
          sub_E840(&dword_0, v75, v76, "returning old RF2 snippet");
          sub_E7E8((uint64_t)v100);
        }

        uint64_t v101 = v129;
        sub_E8A0((uint64_t)v129 + *(int *)(v128 + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 16));
        uint64_t v102 = type metadata accessor for Context(0LL);
        unint64_t v103 = sub_4AA0();
        uint64_t v104 = EnvironmentObject.init()(v102, v103);
        *uint64_t v101 = v104;
        v101[1] = v105;
        ActionHandler.init()(v104);
        sub_E85C(&qword_1C650);
        uint64_t v106 = sub_E8AC();
        uint64_t v64 = (uint64_t)v101;
        View.eraseToAnyView()(v106, v107);
        sub_E834();
        uint64_t v91 = (uint64_t)v101;
      }

      sub_E8B8(v91);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v72);
    }

    else if (v60 == enum case for SuggestionsRFDataModels.announcementsView(_:))
    {
      sub_E7F4();
      uint64_t v93 = v123;
      uint64_t v92 = v124;
      uint64_t v94 = v126;
      (*(void (**)(uint64_t, char *, uint64_t))(v124 + 32))(v123, v44, v126);
      uint64_t v95 = v127;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 16))(v127 + *(int *)(v125 + 20), v93, v94);
      LOBYTE(v142) = 1;
      sub_E898();
      uint64_t v96 = sub_E864();
      uint64_t v97 = v141;
      *(_BYTE *)uint64_t v95 = v140;
      *(void *)(v95 + 8) = v97;
      ActionHandler.init()(v96);
      sub_E85C(&qword_1C660);
      uint64_t v98 = sub_E8AC();
      uint64_t v64 = View.eraseToAnyView()(v98, v99);
      swift_release(v57);
      sub_E8B8(v95);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v93, v94);
    }

    else
    {
      uint64_t v108 = v122;
      v58(v122, v139, v59);
      uint64_t v139 = v57;
      sub_E898();
      uint64_t v109 = v59;
      uint64_t v110 = (os_log_s *)sub_E884();
      os_log_type_t v111 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v110, v111))
      {
        uint64_t v112 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v137 = swift_slowAlloc(32LL, -1LL);
        uint64_t v140 = v137;
        uint64_t v113 = v112;
        uint64_t v136 = v112;
        *(_DWORD *)uint64_t v112 = 136315138;
        uint64_t v57 = (void (*)(void, void))(v112 + 12);
        uint64_t v135 = (uint64_t)(v113 + 4);
        uint64_t v114 = v121;
        v58(v121, (void (*)(void, void))v108, v109);
        uint64_t v115 = String.init<A>(describing:)(v114, v109);
        unint64_t v117 = v116;
        uint64_t v142 = sub_DF60(v115, v116, &v140);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v142, &v143, v135, v57);
        swift_bridgeObjectRelease(v117);
        sub_E84C();
        uint64_t v118 = v136;
        _os_log_impl(&dword_0, v110, v111, "Unknown model type: %s", v136, 0xCu);
        uint64_t v119 = v137;
        swift_arrayDestroy(v137, 1LL, (char *)&type metadata for Any + 8);
        sub_E7E8(v119);
        sub_E7E8((uint64_t)v118);
      }

      else
      {
        sub_E84C();
      }

      uint64_t v64 = View.eraseToAnyView()(&type metadata for EmptyView, &protocol witness table for EmptyView);
      swift_release(v139);
      v57(v44, v109);
    }

    return v64;
  }

  else
  {
    uint64_t v66 = (os_log_s *)sub_E884();
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (_WORD *)sub_E804();
      *uint64_t v68 = 0;
      sub_E840(&dword_0, v66, v67, "Unable to fetch suggestions from facade. Check initalisation errors");
      sub_E7E8((uint64_t)v68);
    }

    return View.eraseToAnyView()(&type metadata for EmptyView, &protocol witness table for EmptyView);
  }

uint64_t SiriSuggestionsUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriSuggestionsUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t sub_DE48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriSuggestionsUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_DE6C(void (*a1)(void, void))
{
  return SiriSuggestionsUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t sub_DE8C(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_DE9C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_DED0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_DEF0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_DF60(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_DF60(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_E030(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_E794((uint64_t)v12, *a3);
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
      sub_E794((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_4A40(v12);
  return v7;
}

void *sub_E030(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_E184((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_E248(a5, a6);
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

void *sub_E184(char *__src, size_t __n, char *__dst)
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

void *sub_E248(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_E2DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_E4B0(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_E4B0((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_E2DC(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_E44C(v4, 0LL);
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
    LOBYTE(sub_C9F8(v9, (uint64_t)&a9 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v10) = 2;
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

void *sub_E44C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_4A60(&qword_1C718);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  void v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_E4B0(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_4A60(&qword_1C718);
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
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_E648(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_E584(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_E584(char *__src, size_t __n, char *__dst)
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

char *sub_E648(char *__src, size_t __len, char *__dst)
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

_BYTE **sub_E6C8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_E6D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_51B8();
}

void sub_E710()
{
}

void sub_E73C(unint64_t *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255LL);
    uint64_t v3 = sub_E8AC();
    atomic_store(swift_getWitnessTable(v3, v4), a1);
  }

  sub_51B8();
}

uint64_t type metadata accessor for SiriSuggestionsUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC23SiriSuggestionsUIPlugin23SiriSuggestionsUIPlugin);
}

uint64_t sub_E794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

  ;
}

uint64_t sub_E7E8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_E7F4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

uint64_t sub_E804()
{
  return swift_slowAlloc(2LL, -1LL);
}

  ;
}

uint64_t sub_E820()
{
  return swift_errorRelease(v0);
}

uint64_t sub_E828()
{
  return 0LL;
}

uint64_t sub_E834()
{
  return swift_release(v0);
}

void sub_E840(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_E84C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void sub_E85C(unint64_t *a1)
{
}

uint64_t sub_E864()
{
  return State.init(wrappedValue:)(v0 - 72);
}

  ;
}

uint64_t sub_E884()
{
  return Logger.logObject.getter();
}

uint64_t sub_E88C(uint64_t a1)
{
  return swift_allocObject(a1, 24LL, 7LL);
}

uint64_t sub_E898()
{
  return swift_retain(v0);
}

uint64_t sub_E8A0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v3, v2);
}

uint64_t sub_E8AC()
{
  return v0;
}

void sub_E8B8(uint64_t a1)
{
}

uint64_t sub_E8C0()
{
  return swift_errorRetain(v0);
}

char *sub_E8C8(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    char v5 = &v4[(v3 + 16LL) & ~(unint64_t)v3];
    swift_retain(v4);
  }

  else
  {
    char v5 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    unint64_t v6 = a2[3];
    int64_t v7 = a2[4];
    *((void *)a1 + 3) = v6;
    *((void *)a1 + 4) = v7;
    int64_t v8 = a2[6];
    *((void *)a1 + 5) = a2[5];
    *((void *)a1 + 6) = v8;
    uint64_t v10 = a2[7];
    int64_t v9 = a2[8];
    *((void *)a1 + 7) = v10;
    *((void *)a1 + 8) = v9;
    size_t v12 = a2[9];
    uint64_t v11 = a2[10];
    a1[88] = *((_BYTE *)a2 + 88);
    *((void *)a1 + 9) = v12;
    *((void *)a1 + 10) = v11;
    uint64_t v13 = a2[12];
    uint64_t v14 = a2[13];
    uint64_t v15 = *(int *)(a3 + 40);
    uint64_t v20 = (uint64_t)a2 + v15;
    uint64_t v21 = &a1[v15];
    *((void *)a1 + 12) = v13;
    *((void *)a1 + 13) = v14;
    uint64_t v16 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL);
    uint64_t v17 = v4;
    swift_bridgeObjectRetain(v6);
    swift_retain(v7);
    swift_bridgeObjectRetain(v8);
    swift_retain(v10);
    swift_retain(v12);
    swift_retain(v13);
    swift_retain(v14);
    v19(v21, v20, v16);
  }

  return v5;
}

uint64_t sub_E9EC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease(*(void *)(a1 + 24));
  swift_release(*(void *)(a1 + 32));
  swift_bridgeObjectRelease(*(void *)(a1 + 48));
  swift_release(*(void *)(a1 + 56));
  swift_release(*(void *)(a1 + 72));
  swift_release(*(void *)(a1 + 96));
  swift_release(*(void *)(a1 + 104));
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_EA6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v8;
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v10;
  uint64_t v12 = *(void *)(a2 + 96);
  uint64_t v13 = *(void *)(a2 + 104);
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v19 = a2 + v14;
  uint64_t v20 = a1 + v14;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  uint64_t v15 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL);
  id v16 = v4;
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v9);
  swift_retain(v11);
  swift_retain(v12);
  swift_retain(v13);
  v18(v20, v19, v15);
  return a1;
}

uint64_t sub_EB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v12;
  swift_retain(v12);
  swift_release(v11);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v13 = *(void *)(a2 + 48);
  uint64_t v14 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v16;
  swift_retain(v16);
  swift_release(v15);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v18 = *(void *)(a2 + 72);
  *(void *)(a1 + 72) = v18;
  swift_retain(v18);
  swift_release(v17);
  uint64_t v19 = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 80) = v19;
  uint64_t v20 = *(void *)(a1 + 96);
  uint64_t v21 = *(void *)(a2 + 96);
  *(void *)(a1 + 96) = v21;
  swift_retain(v21);
  swift_release(v20);
  uint64_t v22 = *(void *)(a2 + 104);
  uint64_t v23 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v22;
  swift_retain(v22);
  swift_release(v23);
  uint64_t v24 = *(int *)(a3 + 40);
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24LL))(v25, v26, v27);
  return a1;
}

uint64_t sub_ECB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v10 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v8, v10);
  return a1;
}

uint64_t sub_ED34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release(v8);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release(v11);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release(v12);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release(v13);
  uint64_t v14 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release(v14);
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40LL))(v16, v17, v18);
  return a1;
}

uint64_t sub_EE30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_EE3C);
}

uint64_t sub_EE3C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_117F0();
    return sub_56B8(a1 + *(int *)(a3 + 40), a2, v8);
  }

uint64_t sub_EEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_EEB8);
}

uint64_t sub_EEB8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_117F0();
    return sub_5750(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for SiriHintsSnippetView(uint64_t a1)
{
  uint64_t result = qword_1C778;
  if (!qword_1C778) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriHintsSnippetView);
  }
  return result;
}

uint64_t sub_EF58(uint64_t a1)
{
  v4[0] = &unk_154E8;
  v4[1] = &unk_15500;
  v4[2] = &unk_15500;
  v4[3] = &unk_154E8;
  v4[4] = &unk_15518;
  v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[6] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 7LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_EFF0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_16C60, 1LL);
}

uint64_t sub_F000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_118E8();
  sub_1165C( (unint64_t *)&qword_1C170,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  uint64_t v8 = EnvironmentObject.init()(v6, v7);
  *(void *)a3 = v8;
  *(void *)(a3 + 8) = v9;
  uint64_t v10 = sub_11840(v8);
  *(_OWORD *)(a3 + 16) = v16;
  *(void *)(a3 + 32) = v17;
  uint64_t v11 = sub_11840(v10);
  *(_OWORD *)(a3 + 40) = v16;
  *(void *)(a3 + 56) = v17;
  sub_11930(v11, &type metadata for CGFloat);
  *(_OWORD *)(a3 + 64) = v16;
  uint64_t v12 = sub_4A60(&qword_1C870);
  sub_11930(v12, v12);
  *(void *)(a3 + 80) = v16;
  *(_BYTE *)(a3 + 88) = BYTE8(v16);
  *(void *)(a3 + 96) = v17;
  *(void *)(a3 + 104) = a1;
  uint64_t v13 = a3 + *(int *)(sub_11784() + 40);
  uint64_t v14 = sub_117F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v13, a2, v14);
}

uint64_t sub_F150@<X0>(uint64_t a1@<X8>)
{
  uint64_t v181 = a1;
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v178 = *(void *)(v3 - 8);
  uint64_t v179 = v3;
  sub_11764();
  __chkstk_darwin(v4, v5);
  sub_E7D4();
  uint64_t v177 = v6;
  uint64_t v7 = sub_11784();
  uint64_t v176 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v176 + 64);
  __chkstk_darwin(v7, v9);
  sub_4A60(&qword_1C7C8);
  sub_E810();
  __chkstk_darwin(v10, v11);
  sub_11868();
  uint64_t v12 = sub_118F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v16 = __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = (char *)&v159 - v20;
  uint64_t v175 = v1;
  SuggestionsRFDataModels.SuggestionHintsDataModel.crossDomainHint.getter(v19);
  if (sub_56B8((uint64_t)v2, 1LL, v12) == 1)
  {
    sub_CE14((uint64_t)v2, &qword_1C7C8);
    uint64_t v22 = sub_4A60(&qword_1C7D0);
    uint64_t v180 = &v159;
    uint64_t v172 = *(void *)(v22 - 8);
    uint64_t v173 = v22;
    sub_11764();
    __chkstk_darwin(v23, v24);
    sub_E870();
    uint64_t v170 = v25;
    uint64_t v171 = &v159;
    __chkstk_darwin(v26, v27);
    sub_11894((uint64_t)&v159 - v28);
    uint64_t v167 = (uint64_t *)sub_4A60(&qword_1C7D8);
    uint64_t v169 = &v159;
    sub_E810();
    __chkstk_darwin(v29, v30);
    sub_E7D4();
    sub_11894(v31);
    unint64_t v164 = (uint64_t *)sub_4A60(&qword_1C7E0);
    uint64_t v166 = &v159;
    sub_E810();
    __chkstk_darwin(v32, v33);
    sub_E7D4();
    sub_11894(v34);
    uint64_t v174 = sub_4A60(&qword_1C7E8);
    uint64_t v163 = &v159;
    sub_E810();
    __chkstk_darwin(v35, v36);
    sub_51A8();
    uint64_t v39 = (uint64_t *)(v38 - v37);
    uint64_t v40 = v175;
    uint64_t v41 = *(void *)(v175 + 32);
    __int128 v184 = *(_OWORD *)(v175 + 16);
    *(void *)&__int128 v185 = v41;
    sub_4A60(&qword_1C7F0);
    sub_11918();
    uint64_t v42 = v182;
    unint64_t v43 = v183;
    swift_bridgeObjectRetain(v183);
    uint64_t v44 = String.asAnyView()(v42);
    uint64_t v45 = swift_bridgeObjectRelease_n(v43, 2LL);
    sub_118F8(v45, v46, type metadata accessor for SiriHintsSnippetView);
    uint64_t v47 = *(unsigned __int8 *)(v176 + 80);
    uint64_t v161 = ((v47 + 16) & ~v47) + v8;
    uint64_t v48 = (v47 + 16) & ~v47;
    uint64_t v176 = v48;
    uint64_t v160 = v47 | 7;
    uint64_t v49 = swift_allocObject(&unk_193A0, v161, v47 | 7);
    uint64_t v50 = sub_1109C((uint64_t)&v159 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v49 + v48);
    uint64_t v51 = v177;
    static TaskPriority.userInitiated.getter(v50);
    type metadata accessor for _TaskModifier(0LL);
    uint64_t v159 = (uint64_t)&v159 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_E810();
    __chkstk_darwin(v52, v53);
    sub_51A8();
    uint64_t v56 = (void *)(v55 - v54);
    uint64_t v58 = v178;
    uint64_t v59 = v179;
    sub_11880(v55 - v54 + *(int *)(v57 + 20), v51, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v178 + 16));
    *uint64_t v56 = &unk_1C800;
    v56[1] = v49;
    sub_1117C( (uint64_t)v56,  (uint64_t)v39 + *(int *)(v174 + 36),  (uint64_t (*)(void))&type metadata accessor for _TaskModifier);
    *uint64_t v39 = v44;
    swift_retain(v44);
    sub_11634((uint64_t)v56, (uint64_t (*)(void))&type metadata accessor for _TaskModifier);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v51, v59);
    swift_release(v44);
    uint64_t v60 = *(void *)(v40 + 72);
    *(void *)&__int128 v184 = *(void *)(v40 + 64);
    *((void *)&v184 + 1) = v60;
    sub_4A60(&qword_1C808);
    sub_11918();
    uint64_t v61 = v182;
    char v62 = *(_BYTE *)(v40 + 88);
    uint64_t v63 = *(void *)(v40 + 96);
    *(void *)&__int128 v184 = *(void *)(v40 + 80);
    BYTE8(v184) = v62;
    *(void *)&__int128 v185 = v63;
    uint64_t v64 = sub_4A60(&qword_1C810);
    uint64_t v65 = State.wrappedValue.getter(&v182, v64);
    uint64_t v66 = v182;
    uint64_t v67 = v183;
    uint64_t v68 = static Alignment.center.getter(v65);
    _FrameLayout.init(width:height:alignment:)(&v184, v61, 0LL, v66, v67, v68, v69);
    uint64_t v70 = v162;
    sub_111B0((uint64_t)v39, v162, &qword_1C7E8);
    uint64_t v71 = (_OWORD *)(v70 + *((int *)v164 + 9));
    __int128 v72 = v185;
    *uint64_t v71 = v184;
    v71[1] = v72;
    v71[2] = v186;
    sub_CE14((uint64_t)v39, &qword_1C7E8);
    sub_118B4();
    uint64_t v73 = static Font.caption.getter();
    uint64_t KeyPath = swift_getKeyPath(&unk_15580);
    uint64_t v75 = v165;
    sub_111B0(v70, v165, &qword_1C7E0);
    os_log_type_t v76 = (uint64_t *)(v75 + *((int *)v167 + 9));
    *os_log_type_t v76 = KeyPath;
    v76[1] = v73;
    sub_CE14(v70, &qword_1C7E0);
    sub_118B4();
    uint64_t v77 = v159;
    sub_1117C(v40, v159, type metadata accessor for SiriHintsSnippetView);
    uint64_t v78 = swift_allocObject(&unk_193C8, v161, v160);
    sub_1109C(v77, v78 + v176);
    unint64_t v79 = sub_111EC();
    uint64_t v80 = v168;
    uint64_t v81 = sub_11828();
    View.onTapGesture(count:perform:)(v81, v82, v83, v84, v85);
    swift_release(v78);
    sub_CE14(v75, &qword_1C7D8);
    uint64_t v86 = v170;
    uint64_t v87 = v172;
    uint64_t v88 = v80;
    uint64_t v89 = v173;
    sub_11880(v170, v88, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v172 + 32));
    uint64_t v90 = sub_4A60(&qword_1C840);
    sub_11764();
    __chkstk_darwin(v91, v92);
    sub_11850();
    uint64_t v93 = v89;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16))(v78, v86, v89);
    swift_storeEnumTagMultiPayload(v78, v90, 1LL);
    uint64_t v94 = sub_4A60(&qword_1C848);
    unint64_t v95 = sub_112C4();
    uint64_t v182 = v174;
    unint64_t v183 = v95;
    uint64_t v96 = sub_11810();
    uint64_t v182 = v40;
    unint64_t v183 = v79;
    uint64_t v97 = sub_11810();
    _ConditionalContent<>.init(storage:)(v78, v94, v93, v96, v97);
    uint64_t v98 = sub_11904();
  }

  else
  {
    unint64_t v164 = *(uint64_t **)(v13 + 32);
    ((void (*)(char *, void *, uint64_t))v164)(v21, v2, v12);
    uint64_t v101 = sub_4A60(&qword_1C848);
    uint64_t v180 = &v159;
    uint64_t v171 = *(uint64_t **)(v101 - 8);
    uint64_t v172 = v101;
    sub_11764();
    __chkstk_darwin(v102, v103);
    sub_E870();
    uint64_t v168 = v104;
    uint64_t v169 = &v159;
    __chkstk_darwin(v105, v106);
    sub_11894((uint64_t)&v159 - v107);
    uint64_t v165 = sub_4A60(&qword_1C7E8);
    uint64_t v167 = &v159;
    sub_E810();
    __chkstk_darwin(v108, v109);
    sub_11868();
    uint64_t v174 = (uint64_t)v21;
    uint64_t v110 = CrossDomainHint.hintText.getter();
    uint64_t v111 = v13;
    uint64_t v113 = v112;
    uint64_t v162 = String.asAnyView()(v110);
    uint64_t v114 = swift_bridgeObjectRelease(v113);
    uint64_t v115 = v175;
    sub_118F8(v114, v116, type metadata accessor for SiriHintsSnippetView);
    uint64_t v173 = v111;
    (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v17, v21, v12);
    uint64_t v117 = *(unsigned __int8 *)(v176 + 80);
    uint64_t v170 = v12;
    uint64_t v118 = (v117 + 16) & ~v117;
    uint64_t v161 = v118;
    uint64_t v176 = v118 + v8;
    uint64_t v119 = v117 | 7;
    uint64_t v163 = (uint64_t *)(v117 | 7);
    uint64_t v120 = *(unsigned __int8 *)(v111 + 80);
    uint64_t v121 = (char *)&v159 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v122 = (v176 + v120) & ~v120;
    uint64_t v123 = swift_allocObject(&unk_193F0, v122 + v14, v119 | v120);
    sub_1109C((uint64_t)v121, v123 + v118);
    uint64_t v124 = ((uint64_t (*)(uint64_t, char *, uint64_t))v164)(v123 + v122, v17, v12);
    uint64_t v125 = v177;
    static TaskPriority.userInitiated.getter(v124);
    type metadata accessor for _TaskModifier(0LL);
    unint64_t v164 = &v159;
    sub_E810();
    __chkstk_darwin(v126, v127);
    sub_51A8();
    uint64_t v130 = (void *)(v129 - v128);
    uint64_t v132 = v115;
    uint64_t v133 = v178;
    uint64_t v134 = v179;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 16))(v129 - v128 + *(int *)(v131 + 20), v125, v179);
    *uint64_t v130 = &unk_1C858;
    v130[1] = v123;
    sub_1117C( (uint64_t)v130,  (uint64_t)v2 + *(int *)(v165 + 36),  (uint64_t (*)(void))&type metadata accessor for _TaskModifier);
    uint64_t v135 = v162;
    *uint64_t v2 = v162;
    swift_retain(v135);
    sub_11634((uint64_t)v130, (uint64_t (*)(void))&type metadata accessor for _TaskModifier);
    sub_118B4();
    (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v125, v134);
    swift_release(v135);
    sub_1117C(v132, (uint64_t)v121, type metadata accessor for SiriHintsSnippetView);
    uint64_t v136 = swift_allocObject(&unk_19418, v176, v163);
    sub_1109C((uint64_t)v121, v136 + v161);
    unint64_t v137 = sub_112C4();
    uint64_t v138 = v166;
    uint64_t v139 = sub_11828();
    View.onTapGesture(count:perform:)(v139, v140, v141, v142, v143);
    swift_release(v136);
    sub_CE14((uint64_t)v2, &qword_1C7E8);
    sub_118B4();
    uint64_t v145 = v171;
    uint64_t v144 = v172;
    uint64_t v146 = v168;
    ((void (*)(uint64_t, uint64_t *, uint64_t))v171[4])(v168, v138, v172);
    uint64_t v147 = sub_4A60(&qword_1C840);
    sub_E810();
    __chkstk_darwin(v148, v149);
    sub_11850();
    uint64_t v150 = v144;
    ((void (*)(uint64_t, uint64_t, uint64_t))v145[2])(v136, v146, v144);
    swift_storeEnumTagMultiPayload(v136, v147, 0LL);
    uint64_t v151 = sub_4A60(&qword_1C7D0);
    *(void *)&__int128 v184 = v134;
    *((void *)&v184 + 1) = v137;
    uint64_t v152 = sub_11800();
    uint64_t v153 = sub_4BC8(&qword_1C7D8);
    unint64_t v154 = sub_111EC();
    *(void *)&__int128 v184 = v153;
    *((void *)&v184 + 1) = v154;
    uint64_t v155 = sub_11800();
    _ConditionalContent<>.init(storage:)(v136, v150, v151, v152, v155);
    uint64_t v156 = sub_11904();
    v157(v156);
    uint64_t v98 = v174;
    uint64_t v100 = *(uint64_t (**)(uint64_t, uint64_t))(v173 + 8);
    uint64_t v99 = v170;
  }

  return v100(v98, v99);
}

uint64_t sub_FB7C(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  uint64_t v3 = type metadata accessor for CrossDomainHintType(0LL);
  v2[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[15] = v4;
  v2[16] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  v2[17] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_FC10, v6, v7);
}

uint64_t sub_FC10()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  swift_release(*(void *)(v0 + 136));
  _StringGuts.grow(_:)(18LL);
  uint64_t v5 = swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v6 = CrossDomainHint.hintType.getter(v5);
  uint64_t v7 = CrossDomainHintType.rawValue.getter(v6);
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v9);
  uint64_t v11 = *(void *)(v4 + 40);
  uint64_t v12 = *(void *)(v4 + 48);
  uint64_t v13 = *(void *)(v4 + 56);
  *(void *)(v0 + 16) = v11;
  *(void *)(v0 + 24) = v12;
  *(void *)(v0 + 32) = v13;
  *(void *)(v0 + 64) = 0xD000000000000010LL;
  *(void *)(v0 + 72) = 0x80000000000172D0LL;
  uint64_t v14 = sub_4A60(&qword_1C7F0);
  State.wrappedValue.setter(v0 + 64, v14);
  *(void *)(v0 + 40) = v11;
  *(void *)(v0 + 48) = v12;
  *(void *)(v0 + 56) = v13;
  State.wrappedValue.getter((void *)(v0 + 80), v14);
  uint64_t v15 = *(void *)(v0 + 80);
  uint64_t v16 = *(void **)(v0 + 88);
  uint64_t v17 = sub_4A60(&qword_1C4A0);
  sub_11770(v17);
  sub_118A0();
  uint64_t v18 = type metadata accessor for ComponentType(0LL);
  id v19 = objc_allocWithZone((Class)sub_117B8(v18));
  uint64_t v20 = (void *)sub_117A4(v15, (uint64_t)v16);
  sub_11820();
  if (*(void *)v4)
  {
    id v21 = *(id *)v4;
    sub_1193C();

    sub_11820();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    sub_118E8();
    sub_1165C( (unint64_t *)&qword_1C170,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    return sub_117DC(v23);
  }

void sub_FDE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Command(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriHintsSnippetView(0LL);
  __chkstk_darwin(v7, v8);
  Swift::String v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  sub_41C8(v11, (uint64_t)static Logger.uiCategory);
  sub_1117C(a1, (uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v45 = v6;
    uint64_t v46 = v16;
    uint64_t v17 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v44 = a1;
    uint64_t v18 = *((void *)v10 + 7);
    __int128 v47 = *(_OWORD *)(v10 + 40);
    uint64_t v48 = v18;
    uint64_t v19 = sub_4A60(&qword_1C7F0);
    State.wrappedValue.getter(&v49, v19);
    unint64_t v20 = v50;
    *(void *)&__int128 v47 = sub_DF60(v49, v50, &v46);
    a1 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, (char *)&v47 + 8, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v20);
    sub_11634((uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
    _os_log_impl(&dword_0, v13, v14, "Component was tapped for suggestion with loggingId: %s", v15, 0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v21 = v17;
    uint64_t v6 = v45;
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {
    sub_11634((uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
  }

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for Command.noOp(_:), v2);
  uint64_t v22 = type metadata accessor for InteractionType(0LL);
  __chkstk_darwin(v22, v23);
  uint64_t v25 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v26 + 104))(v25, enum case for InteractionType.buttonTapped(_:));
  uint64_t v27 = sub_4A60(&qword_1C4A0);
  uint64_t v29 = __chkstk_darwin(v27, v28);
  uint64_t v31 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static ComponentType.customCanvas.getter(v29);
  uint64_t v32 = type metadata accessor for ComponentType(0LL);
  sub_5750((uint64_t)v31, 0LL, 1LL, v32);
  uint64_t v33 = *(void *)(a1 + 56);
  __int128 v47 = *(_OWORD *)(a1 + 40);
  uint64_t v48 = v33;
  uint64_t v34 = sub_4A60(&qword_1C7F0);
  State.wrappedValue.getter(&v49, v34);
  uint64_t v35 = v49;
  unint64_t v36 = v50;
  id v37 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed(0LL));
  uint64_t v38 = RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)( 0x746E6948706174LL,  0xE700000000000000LL,  v6,  v25,  v31,  v35,  v36,  0LL,  1);
  if (*(void *)a1)
  {
    uint64_t v39 = (void *)v38;
    id v40 = *(id *)a1;
    dispatch thunk of Context.emit(_:)(v39);
  }

  else
  {
    uint64_t v41 = *(void *)(a1 + 8);
    uint64_t v42 = type metadata accessor for Context(0LL);
    sub_1165C( (unint64_t *)&qword_1C170,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    EnvironmentObject.error()(0LL, v41, v42, v43);
    __break(1u);
  }

uint64_t sub_101F8(uint64_t a1)
{
  v1[32] = a1;
  uint64_t v2 = type metadata accessor for Action(0LL);
  v1[33] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[34] = v3;
  v1[35] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SiriSuggestions.SuggestionPresentation(0LL);
  v1[36] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[37] = v5;
  v1[38] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriSuggestions.Suggestion(0LL);
  v1[39] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[40] = v7;
  v1[41] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DeliveryVehicle(0LL);
  v1[42] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v1[43] = v9;
  v1[44] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4A60(&qword_1C860);
  v1[45] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for PreGeneratedSiriHint(0LL);
  v1[46] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v1[47] = v12;
  v1[48] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for SiriHintsSnippetView(0LL);
  v1[49] = v13;
  unint64_t v14 = (*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[50] = swift_task_alloc(v14);
  v1[51] = swift_task_alloc(v14);
  uint64_t v15 = type metadata accessor for MainActor(0LL);
  v1[52] = static MainActor.shared.getter();
  uint64_t v16 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v1[53] = v16;
  v1[54] = v17;
  return swift_task_switch(sub_10384, v16, v17);
}

uint64_t sub_10384()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  v0[55] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[56] = v2;
  uint64_t v3 = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[57] = v3;
  uint64_t v4 = sub_4A60(&qword_1C868);
  uint64_t v5 = sub_11770(v4);
  uint64_t v6 = SuggestionsRFDataModels.SuggestionHintsDataModel.requestId.getter();
  UUID.init(uuidString:)(v6);
  sub_118AC();
  if (sub_56B8(v5, 1LL, v1) == 1)
  {
    sub_CE14(v5, &qword_1C868);
    sub_118E0();
    if (qword_1C160 != -1) {
      swift_once(&qword_1C160, sub_4130);
    }
    uint64_t v7 = v0[51];
    uint64_t v8 = v0[32];
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_41C8(v9, (uint64_t)static Logger.uiCategory);
    sub_1117C(v8, v7, type metadata accessor for SiriHintsSnippetView);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = v0[51];
    if (v13)
    {
      uint64_t v15 = (_DWORD *)sub_117F8(12LL);
      uint64_t v28 = sub_117F8(32LL);
      uint64_t v16 = v28;
      *uint64_t v15 = 136315138;
      uint64_t v17 = SuggestionsRFDataModels.SuggestionHintsDataModel.requestId.getter();
      v0[31] = sub_DF60(v17, v18, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 31, v0 + 32, v15 + 1, v15 + 3);
      sub_118AC();
      sub_11634(v14, type metadata accessor for SiriHintsSnippetView);
      sub_11924(&dword_0, v11, v12, "unable to create requestID from %s");
      swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
      sub_E7E8(v16);
      sub_E7E8((uint64_t)v15);
    }

    else
    {
      sub_11634(v0[51], type metadata accessor for SiriHintsSnippetView);
    }

    UUID.init()();
  }

  else
  {
    sub_11880(v3, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
    sub_118E0();
  }

  uint64_t v20 = v0[43];
  uint64_t v19 = v0[44];
  uint64_t v21 = v0[42];
  uint64_t v22 = enum case for SiriHintsMode.display(_:);
  uint64_t v23 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104LL))(v19, v22, v23);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v20 + 104))( v19,  enum case for DeliveryVehicle.siriHints(_:),  v21);
  double v25 = SuggestionsRFDataModels.SuggestionHintsDataModel.uiDisplayTimeout.getter(v24);
  uint64_t v26 = (void *)swift_task_alloc(async function pointer to SiriSuggestionsFacade.fetchTopPreGeneratedSiriHint(requestUUID:forDeliveryVehicle:timeoutSeconds:)[1]);
  v0[58] = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_10690;
  return SiriSuggestionsFacade.fetchTopPreGeneratedSiriHint(requestUUID:forDeliveryVehicle:timeoutSeconds:)( v0[45],  v3,  v0[44],  v25);
}

uint64_t sub_10690()
{
  uint64_t v1 = *v0;
  uint64_t v3 = *(void *)(*v0 + 344);
  uint64_t v2 = *(void *)(*v0 + 352);
  uint64_t v4 = *(void *)(*v0 + 336);
  swift_task_dealloc(*(void *)(*v0 + 464));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(sub_106FC, *(void *)(v1 + 424), *(void *)(v1 + 432));
}

uint64_t sub_106FC()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 368);
  swift_release(*(void *)(v0 + 416));
  if (sub_56B8(v1, 1LL, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 360);
    (*(void (**)(void, void))(*(void *)(v0 + 448) + 8LL))(*(void *)(v0 + 456), *(void *)(v0 + 440));
    sub_CE14(v3, &qword_1C860);
LABEL_10:
    uint64_t v61 = *(void *)(v0 + 400);
    uint64_t v62 = *(void *)(v0 + 408);
    uint64_t v63 = *(void *)(v0 + 360);
    uint64_t v64 = *(void *)(v0 + 328);
    uint64_t v65 = *(void *)(v0 + 304);
    uint64_t v66 = *(void *)(v0 + 280);
    swift_task_dealloc(*(void *)(v0 + 456));
    swift_task_dealloc(v62);
    swift_task_dealloc(v61);
    sub_11820();
    swift_task_dealloc(v63);
    sub_118E0();
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v4 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 328);
  uint64_t v6 = *(void *)(v0 + 304);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 296);
  uint64_t v69 = *(void *)(v0 + 288);
  uint64_t v70 = v7;
  uint64_t v71 = *(void *)(v0 + 280);
  uint64_t v72 = *(void *)(v0 + 272);
  uint64_t v9 = *(void *)(v0 + 256);
  uint64_t v73 = *(void *)(v0 + 264);
  (*(void (**)(void, void, void))(*(void *)(v0 + 376) + 32LL))( *(void *)(v0 + 384),  *(void *)(v0 + 360),  *(void *)(v0 + 368));
  uint64_t v10 = sub_118C0();
  SiriSuggestions.Suggestion.presentation.getter(v10);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v12 = v11(v5, v7);
  uint64_t v13 = SiriSuggestions.SuggestionPresentation.displayText.getter(v12);
  uint64_t v15 = v14;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v69);
  uint64_t v16 = *(void *)(v9 + 32);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v9 + 16);
  *(void *)(v0 + 32) = v16;
  *(void *)(v0 + 200) = v13;
  *(void *)(v0 + 208) = v15;
  uint64_t v17 = sub_4A60(&qword_1C7F0);
  State.wrappedValue.setter(v0 + 200, v17);
  uint64_t v18 = sub_118C0();
  SiriSuggestions.Suggestion.loggingAction.getter(v18);
  uint64_t v19 = v11(v5, v70);
  uint64_t v20 = Action.loggingId.getter(v19);
  uint64_t v22 = v21;
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v23 = *(void *)(v9 + 56);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v9 + 40);
  *(void *)(v0 + 80) = v23;
  *(void *)(v0 + 152) = v20;
  *(void *)(v0 + 160) = v22;
  State.wrappedValue.setter(v0 + 152, v17);
  uint64_t v24 = *(void *)(v9 + 72);
  *(void *)(v0 + 136) = *(void *)(v9 + 64);
  *(void *)(v0 + 144) = v24;
  *(void *)(v0 + 232) = 0x7FF0000000000000LL;
  uint64_t v25 = sub_4A60(&qword_1C808);
  sub_11888(v25);
  char v26 = *(_BYTE *)(v9 + 88);
  uint64_t v27 = *(void *)(v9 + 96);
  *(void *)(v0 + 88) = *(void *)(v9 + 80);
  *(_BYTE *)(v0 + 96) = v26;
  *(void *)(v0 + 104) = v27;
  *(void *)(v0 + 216) = 0LL;
  *(_BYTE *)(v0 + 224) = 1;
  uint64_t v28 = sub_4A60(&qword_1C810);
  sub_11888(v28);
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v29 = *(void *)(v0 + 400);
  uint64_t v30 = *(void *)(v0 + 256);
  uint64_t v31 = type metadata accessor for Logger(0LL);
  sub_41C8(v31, (uint64_t)static Logger.uiCategory);
  sub_1117C(v30, v29, type metadata accessor for SiriHintsSnippetView);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.info.getter();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v36 = *(void *)(v0 + 400);
  if (v35)
  {
    id v37 = (_DWORD *)sub_117F8(12LL);
    uint64_t v38 = sub_117F8(32LL);
    *id v37 = 136315138;
    uint64_t v74 = v38;
    uint64_t v39 = *(void *)(v36 + 56);
    *(_OWORD *)(v0 + 112) = *(_OWORD *)(v36 + 40);
    *(void *)(v0 + 128) = v39;
    State.wrappedValue.getter((void *)(v0 + 168), v17);
    *(void *)(v0 + 240) = sub_DF60(*(void *)(v0 + 168), *(void *)(v0 + 176), &v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248, v37 + 1, v37 + 3);
    sub_118AC();
    sub_11634(v36, type metadata accessor for SiriHintsSnippetView);
    sub_11924(&dword_0, v33, v34, "Showing suggestion with loggingId - %s");
    swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
    sub_E7E8(v38);
    sub_E7E8((uint64_t)v37);
  }

  else
  {
    sub_11634(*(void *)(v0 + 400), type metadata accessor for SiriHintsSnippetView);
  }

  id v40 = *(void ***)(v0 + 256);
  uint64_t v41 = (void (*)(void))PreGeneratedSiriHint.exposureCallback.getter();
  uint64_t v43 = v42;
  v41();
  swift_release(v43);
  uint64_t v74 = 0x746E694869726953LL;
  unint64_t v75 = 0xE900000000000023LL;
  uint64_t v44 = *(void *)(v9 + 56);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v9 + 40);
  *(void *)(v0 + 56) = v44;
  State.wrappedValue.getter((void *)(v0 + 184), v17);
  v45._countAndFlagsBits = *(void *)(v0 + 184);
  uint64_t v46 = *(void **)(v0 + 192);
  v45._object = v46;
  String.append(_:)(v45);
  swift_bridgeObjectRelease(v46);
  uint64_t v48 = (void *)v74;
  uint64_t v47 = v75;
  uint64_t v49 = sub_4A60(&qword_1C4A0);
  sub_11770(v49);
  sub_118A0();
  uint64_t v50 = type metadata accessor for ComponentType(0LL);
  id v51 = objc_allocWithZone((Class)sub_117B8(v50));
  uint64_t v52 = (void *)sub_117A4((uint64_t)v48, v47);
  sub_11820();
  uint64_t v53 = *v40;
  if (*v40)
  {
    uint64_t v55 = *(void *)(v0 + 448);
    uint64_t v54 = *(void *)(v0 + 456);
    uint64_t v56 = *(void *)(v0 + 440);
    uint64_t v58 = *(void *)(v0 + 376);
    uint64_t v57 = *(void *)(v0 + 384);
    uint64_t v59 = *(void *)(v0 + 368);
    id v60 = v53;
    sub_1193C();

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
    goto LABEL_10;
  }

  sub_118E8();
  sub_1165C( (unint64_t *)&qword_1C170,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  return sub_117DC(v68);
}

void sub_10C48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Command(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriHintsSnippetView(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  sub_41C8(v11, (uint64_t)static Logger.uiCategory);
  sub_1117C(a1, (uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v47 = v6;
    uint64_t v17 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v46 = a1;
    uint64_t v18 = *((void *)v10 + 7);
    __int128 v48 = *(_OWORD *)(v10 + 40);
    uint64_t v49 = v18;
    v50._countAndFlagsBits = v16;
    uint64_t v19 = sub_4A60(&qword_1C7F0);
    State.wrappedValue.getter(&v51, v19);
    unint64_t v20 = v52;
    *(void *)&__int128 v48 = sub_DF60(v51, v52, &v50._countAndFlagsBits);
    a1 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 8, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v20);
    sub_11634((uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
    _os_log_impl(&dword_0, v13, v14, "Component was tapped for suggestion with loggingID: %s", v15, 0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v21 = v17;
    uint64_t v6 = v47;
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {
    sub_11634((uint64_t)v10, type metadata accessor for SiriHintsSnippetView);
  }

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for Command.noOp(_:), v2);
  uint64_t v22 = type metadata accessor for InteractionType(0LL);
  __chkstk_darwin(v22, v23);
  uint64_t v25 = (char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v26 + 104))(v25, enum case for InteractionType.buttonTapped(_:));
  uint64_t v27 = sub_4A60(&qword_1C4A0);
  uint64_t v29 = __chkstk_darwin(v27, v28);
  uint64_t v31 = (char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static ComponentType.customCanvas.getter(v29);
  uint64_t v32 = type metadata accessor for ComponentType(0LL);
  sub_5750((uint64_t)v31, 0LL, 1LL, v32);
  uint64_t v51 = 0x746E694869726953LL;
  unint64_t v52 = 0xE900000000000023LL;
  uint64_t v33 = *(void *)(a1 + 56);
  __int128 v48 = *(_OWORD *)(a1 + 40);
  uint64_t v49 = v33;
  uint64_t v34 = sub_4A60(&qword_1C7F0);
  State.wrappedValue.getter(&v50, v34);
  object = v50._object;
  String.append(_:)(v50);
  swift_bridgeObjectRelease(object);
  uint64_t v36 = v51;
  unint64_t v37 = v52;
  id v38 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed(0LL));
  uint64_t v39 = RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)( 0x746E6948706174LL,  0xE700000000000000LL,  v6,  v25,  v31,  v36,  v37,  0LL,  1);
  if (*(void *)a1)
  {
    id v40 = (void *)v39;
    id v41 = *(id *)a1;
    dispatch thunk of Context.emit(_:)(v40);
  }

  else
  {
    uint64_t v42 = *(void *)(a1 + 8);
    uint64_t v43 = type metadata accessor for Context(0LL);
    sub_1165C( (unint64_t *)&qword_1C170,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    EnvironmentObject.error()(0LL, v42, v43, v44);
    __break(1u);
  }

uint64_t sub_1109C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriHintsSnippetView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_110E0()
{
  uint64_t v3 = v0 + v2;
  uint64_t v4 = (void *)swift_task_alloc(dword_1C7FC);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_11134;
  return sub_101F8(v3);
}

uint64_t sub_11134()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_1117C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3(0LL);
  sub_1178C(v3);
  sub_51B8();
}

void sub_111B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_4A60(a3);
  sub_1178C(v3);
  sub_51B8();
}

uint64_t sub_111E0()
{
  return sub_11608((uint64_t (*)(uint64_t))sub_10C48);
}

unint64_t sub_111EC()
{
  unint64_t result = qword_1C818;
  if (!qword_1C818)
  {
    uint64_t v1 = sub_4BC8(&qword_1C7D8);
    sub_11258();
    sub_11384();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C818);
  }

  return result;
}

unint64_t sub_11258()
{
  unint64_t result = qword_1C820;
  if (!qword_1C820)
  {
    uint64_t v1 = sub_4BC8(&qword_1C7E0);
    sub_112C4();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C820);
  }

  return result;
}

unint64_t sub_112C4()
{
  unint64_t result = qword_1C828;
  if (!qword_1C828)
  {
    uint64_t v1 = sub_4BC8(&qword_1C7E8);
    sub_11348();
    sub_1165C( &qword_1C838,  (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier,  (uint64_t)&protocol conformance descriptor for _TaskModifier);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C828);
  }

  return result;
}

unint64_t sub_11348()
{
  unint64_t result = qword_1C830;
  if (!qword_1C830)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for HintComponentView,  &type metadata for HintComponentView);
    atomic_store(result, (unint64_t *)&qword_1C830);
  }

  return result;
}

unint64_t sub_11384()
{
  unint64_t result = qword_1C210;
  if (!qword_1C210)
  {
    uint64_t v1 = sub_4BC8(&qword_1C218);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1C210);
  }

  return result;
}

uint64_t sub_113C8()
{
  uint64_t v1 = sub_11784();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_118F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  uint64_t v12 = v0 + v4;

  swift_bridgeObjectRelease(*(void *)(v12 + 24));
  swift_release(*(void *)(v12 + 32));
  swift_bridgeObjectRelease(*(void *)(v12 + 48));
  swift_release(*(void *)(v12 + 56));
  swift_release(*(void *)(v12 + 72));
  swift_release(*(void *)(v12 + 96));
  swift_release(*(void *)(v12 + 104));
  uint64_t v13 = v12 + *(int *)(v1 + 40);
  uint64_t v14 = sub_117F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_114C0()
{
  uint64_t v2 = *(void *)(sub_11784() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_118F0() - 8) + 80LL);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc(dword_1C854);
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_11760;
  return sub_FB7C(v7, v8);
}

uint64_t sub_11550()
{
  uint64_t v1 = *(void *)(sub_11784() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  unint64_t v6 = (void *)(v0 + v3);

  swift_bridgeObjectRelease(v6[3]);
  swift_release(v6[4]);
  swift_bridgeObjectRelease(v6[6]);
  swift_release(v6[7]);
  swift_release(v6[9]);
  swift_release(v6[12]);
  swift_release(v6[13]);
  uint64_t v7 = sub_117F0();
  sub_D158(v7);
  return swift_deallocObject(v0, v4, v5);
}

uint64_t sub_115FC()
{
  return sub_11608((uint64_t (*)(uint64_t))sub_FDE0);
}

uint64_t sub_11608(uint64_t (*a1)(uint64_t))
{
  return a1(v1 + v2);
}

void sub_11634(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = a2(0LL);
  sub_D158(v2);
  sub_51B8();
}

void sub_1165C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_51B8();
}

unint64_t sub_1169C()
{
  unint64_t result = qword_1C878;
  if (!qword_1C878)
  {
    uint64_t v1 = sub_4BC8(&qword_1C880);
    uint64_t v4 = sub_4BC8(&qword_1C7E8);
    unint64_t v5 = sub_112C4();
    swift_getOpaqueTypeConformance2( &v4,  &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>,  1LL);
    uint64_t v2 = sub_4BC8(&qword_1C7D8);
    unint64_t v3 = sub_111EC();
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    swift_getOpaqueTypeConformance2( &v4,  &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C878);
  }

  return result;
}

  ;
}

uint64_t sub_11770(uint64_t a1)
{
  return swift_task_alloc((*(void *)(*(void *)(a1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_11784()
{
  return type metadata accessor for SiriHintsSnippetView(0LL);
}

uint64_t sub_1178C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(v1, v2, a1);
}

uint64_t sub_117A4(uint64_t a1, uint64_t a2)
{
  return RFComponentShown.init(componentName:componentType:componentIndex:)(a1, a2, v2, 0LL, 1LL);
}

uint64_t sub_117B8(uint64_t a1)
{
  return type metadata accessor for RFComponentShown(0LL);
}

uint64_t sub_117DC(uint64_t a1)
{
  return EnvironmentObject.error()(0LL, v1, v2, a1);
}

uint64_t sub_117F0()
{
  return type metadata accessor for SuggestionsRFDataModels.SuggestionHintsDataModel(0LL);
}

uint64_t sub_117F8(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_11800()
{
  return swift_getOpaqueTypeConformance2(v1 - 136, v0, 1LL);
}

uint64_t sub_11810()
{
  return swift_getOpaqueTypeConformance2(v1 - 152, v0, 1LL);
}

uint64_t sub_11820()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_11828()
{
  return 1LL;
}

uint64_t sub_11840(uint64_t a1, ...)
{
  return State.init(wrappedValue:)(va);
}

  ;
}

  ;
}

uint64_t sub_11880@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_11888(uint64_t a1)
{
  return State.wrappedValue.setter(v1, a1);
}

void sub_11894(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_118A0()
{
  return static ComponentType.customCanvas.getter();
}

uint64_t sub_118AC()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_118C0()
{
  return PreGeneratedSiriHint.topHint.getter();
}

  ;
}

uint64_t sub_118E0()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_118E8()
{
  return type metadata accessor for Context(0LL);
}

uint64_t sub_118F0()
{
  return type metadata accessor for CrossDomainHint(0LL);
}

void sub_118F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
}

uint64_t sub_11904()
{
  return v0;
}

uint64_t sub_11918()
{
  return State.wrappedValue.getter();
}

void sub_11924(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_11930(uint64_t a1, ...)
{
  return State.init(wrappedValue:)(va);
}

uint64_t sub_1193C()
{
  return dispatch thunk of Context.emit(_:)(v0);
}

uint64_t *sub_11948(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v17);
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v7 = a2[1];
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_retain(v7);
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for ActionHandler(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
  }

  return v4;
}

uint64_t sub_11A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
}

uint64_t sub_11A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_retain(v6);
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
  return a1;
}

uint64_t sub_11B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v7;
  swift_retain(v7);
  swift_release(v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24LL))(v13, v14, v15);
  return a1;
}

_OWORD *sub_11C00(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
  return a1;
}

uint64_t sub_11C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release(v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_11D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_11D4C);
}

uint64_t sub_11D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
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
    uint64_t v9 = sub_14270();
    if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)a2)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v10 = sub_D190();
      uint64_t v11 = *(int *)(a3 + 24);
    }

    return sub_56B8(a1 + v11, a2, v10);
  }

uint64_t sub_11DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11DF4);
}

void sub_11DF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 2147483646)
  {
    *(void *)(a1 + 8) = a2;
    sub_D2FC();
  }

  else
  {
    uint64_t v8 = sub_14270();
    if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v9 = sub_D190();
      uint64_t v10 = *(int *)(a4 + 24);
    }

    sub_5750(a1 + v10, a2, a2, v9);
  }

uint64_t type metadata accessor for SiriFeatureAnnouncementSnippetView(uint64_t a1)
{
  uint64_t result = qword_1C8E0;
  if (!qword_1C8E0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriFeatureAnnouncementSnippetView);
  }
  return result;
}

uint64_t sub_11EB0(uint64_t a1)
{
  v5[0] = &unk_15618;
  uint64_t result = type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(319LL);
  if (v3 <= 0x3F)
  {
    v5[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for ActionHandler(319LL);
    if (v4 <= 0x3F)
    {
      v5[2] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 3LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_11F40(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_16CB0, 1LL);
}

void sub_11F50(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1;
  BOOL v35 = a1;
  uint64_t v4 = sub_14128();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4, v7);
  uint64_t v8 = sub_4A60(&qword_1C988);
  uint64_t v34 = *(void *)(v8 - 8);
  sub_11764();
  __chkstk_darwin(v9, v10);
  sub_14240();
  uint64_t v11 = sub_4A60(&qword_1C990);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_13938(v3, (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v18 = swift_allocObject(&unk_194F8, v17 + v6, v16 | 7);
  sub_13980((uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), v18 + v17);
  uint64_t v19 = sub_4A60(&qword_1C998);
  unint64_t v20 = sub_13DE0();
  Button.init(action:label:)(sub_13DD4, v18, sub_124F0, 0LL, v19, v20);
  uint64_t v21 = type metadata accessor for PlainButtonStyle(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v24 = __chkstk_darwin(v21, v23);
  uint64_t v26 = (char *)&v34 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  PlainButtonStyle.init()(v24);
  sub_D120(&qword_1C9C8, &qword_1C990);
  uint64_t v28 = v27;
  sub_CEF8(&qword_1C9D0, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v30 = v29;
  View.buttonStyle<A>(_:)(v26, v11, v21, v28, v29);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  v36[0] = v11;
  v36[1] = v21;
  v36[2] = v28;
  v36[3] = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v36,  &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>,  1LL);
  uint64_t v32 = View.eraseToAnyView()(v8, OpaqueTypeConformance2);
  sub_142A4(v2, *(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
  uint64_t v33 = v35;
  v35[3] = (uint64_t)&type metadata for AnyView;
  v33[4] = (uint64_t)&protocol witness table for AnyView;
  *uint64_t v33 = v32;
  sub_D274();
}

uint64_t sub_121B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2, v5);
  sub_13F6C();
  uint64_t v40 = static OS_dispatch_queue.main.getter();
  uint64_t v6 = type metadata accessor for DispatchTime(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v9, v12);
  uint64_t v15 = (char *)&v37 - v14;
  static DispatchTime.now()(v13);
  + infix(_:_:)(v15, 0.001);
  id v38 = *(void (**)(char *, uint64_t))(v7 + 8);
  v38(v15, v6);
  sub_13938(a1, (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v16 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v18 = swift_allocObject(&unk_19520, v17 + v4, v16 | 7);
  sub_13980((uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), v18 + v17);
  aBlock[4] = sub_1401C;
  uint64_t v42 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_124C4;
  aBlock[3] = &unk_19538;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release(v42);
  uint64_t v20 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v25 = (char *)&v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static DispatchQoS.unspecified.getter(v23);
  uint64_t v26 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, &type metadata accessor for DispatchWorkItemFlags);
  uint64_t v29 = (char *)&v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_CEF8(&qword_1C9E8, v30);
  uint64_t v32 = v31;
  uint64_t v33 = sub_4A60(&qword_1C9F0);
  unint64_t v34 = sub_14068();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v33, v34, v26, v32);
  BOOL v35 = (void *)v40;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v11, v25, v29, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v20);
  return ((uint64_t (*)(char *, uint64_t))v38)(v11, v39);
}

uint64_t sub_12474(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  v4[1] = *(_BYTE *)a1;
  uint64_t v5 = v1;
  v4[0] = 0;
  uint64_t v2 = sub_4A60(&qword_1C518);
  return State.wrappedValue.setter(v4, v2);
}

uint64_t sub_124C4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_124F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = Image.init(systemName:)(0x6B72616D78LL, 0xE500000000000000LL);
  uint64_t v3 = sub_4A60(&qword_1C9D8);
  uint64_t v5 = __chkstk_darwin(v3, v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static SymbolRenderingMode.monochrome.getter(v5);
  uint64_t v8 = type metadata accessor for SymbolRenderingMode(0LL);
  sub_5750((uint64_t)v7, 0LL, 1LL, v8);
  uint64_t v9 = Image.symbolRenderingMode(_:)(v7, v2);
  swift_release(v2);
  sub_CE14((uint64_t)v7, &qword_1C9D8);
  uint64_t v11 = static Color.gray.getter(v10);
  uint64_t v12 = type metadata accessor for Image.Scale(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for Image.Scale.medium(_:), v12);
  uint64_t KeyPath = swift_getKeyPath(&unk_156B0);
  uint64_t v18 = sub_4A60(&qword_1C9C0);
  uint64_t v20 = __chkstk_darwin(v18, v19);
  uint64_t v22 = (uint64_t *)((char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v22 + *(int *)(v20 + 28), v16, v12);
  *uint64_t v22 = KeyPath;
  uint64_t v23 = sub_4A60(&qword_1C998);
  sub_13F2C((uint64_t)v22, (uint64_t)a1 + *(int *)(v23 + 36), &qword_1C9C0);
  *a1 = v9;
  a1[1] = v11;
  swift_retain(v9);
  swift_retain(v11);
  sub_CE14((uint64_t)v22, &qword_1C9C0);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  swift_release(v11);
  return swift_release(v9);
}

void sub_12700(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_14128();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v8 = (char *)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (void *)(v1 + *(int *)(__chkstk_darwin(v4, v7) + 20));
  uint64_t v10 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementButtonLabel.getter();
  if (!v11)
  {
    if (qword_1C160 != -1) {
      swift_once(&qword_1C160, sub_4130);
    }
    uint64_t v21 = sub_428C();
    sub_141FC(v21, (uint64_t)static Logger.uiCategory);
    os_log_type_t v22 = sub_14290();
    if (!sub_14118(v22)) {
      goto LABEL_15;
    }
    uint64_t v23 = (_WORD *)sub_E804();
    sub_14298(v23);
    uint64_t v26 = "Button label is nil, returning empty announcement view";
    goto LABEL_14;
  }

  uint64_t v12 = v10;
  uint64_t v13 = v11;
  uint64_t v14 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementPunchOutUri.getter();
  if (v15)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    uint64_t v73 = a1;
    sub_4A60(&qword_1C960);
    sub_11764();
    __chkstk_darwin(v18, v19);
    sub_141E0();
    URL.init(string:)(v16, v17);
    uint64_t v20 = type metadata accessor for URL(0LL);
    if (sub_56B8((uint64_t)v9, 1LL, v20) != 1)
    {
      sub_CE14((uint64_t)v9, &qword_1C960);
      uint64_t v71 = sub_4A60(&qword_1C968);
      uint64_t v72 = v64;
      sub_11764();
      __chkstk_darwin(v30, v31);
      uint64_t v33 = (char *)v64 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      type metadata accessor for LocalizedStringKey.StringInterpolation(0LL);
      uint64_t v70 = v64;
      sub_11764();
      __chkstk_darwin(v34, v35);
      sub_141E0();
      LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v36._countAndFlagsBits = 91LL;
      v36._object = (void *)0xE100000000000000LL;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v36);
      v37._countAndFlagsBits = v12;
      v37._object = v13;
      LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v37);
      sub_14238();
      v38._countAndFlagsBits = 10333LL;
      v38._object = (void *)0xE200000000000000LL;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v38);
      v39._countAndFlagsBits = v16;
      v39._object = v17;
      LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v39);
      v40._countAndFlagsBits = 41LL;
      v40._object = (void *)0xE100000000000000LL;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v40);
      uint64_t v41 = LocalizedStringKey.init(stringInterpolation:)(v9);
      uint64_t v42 = Text.init(_:tableName:bundle:comment:)(v41);
      uint64_t v67 = v43;
      uint64_t v68 = v42;
      uint64_t v69 = v44;
      int v66 = v45 & 1;
      uint64_t KeyPath = swift_getKeyPath(&unk_15680);
      uint64_t v46 = type metadata accessor for OpenURLAction(0LL);
      uint64_t v70 = v64;
      uint64_t v47 = *(void *)(v46 - 8);
      __chkstk_darwin(v46, v48);
      sub_14240();
      sub_13938(v2, (uint64_t)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      uint64_t v49 = *(unsigned __int8 *)(v5 + 80);
      uint64_t v50 = (v49 + 16) & ~v49;
      unint64_t v51 = (v6 + v50 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      unint64_t v52 = (uint64_t *)swift_allocObject(&unk_194D0, v51 + 16, v49 | 7);
      sub_13980((uint64_t)v8, (uint64_t)v52 + v50);
      uint64_t v53 = (uint64_t *)((char *)v52 + v51);
      *uint64_t v53 = v16;
      v53[1] = (uint64_t)v17;
      OpenURLAction.init(handler:)(sub_13BF8, v52);
      sub_4A60(&qword_1C970);
      v64[1] = v64;
      sub_11764();
      __chkstk_darwin(v54, v55);
      sub_14258();
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))((char *)v52 + *(int *)(v56 + 28), v12, v46);
      *unint64_t v52 = KeyPath;
      uint64_t v57 = v71;
      sub_13F2C((uint64_t)v52, (uint64_t)&v33[*(int *)(v71 + 36)], &qword_1C970);
      uint64_t v58 = v67;
      uint64_t v59 = v68;
      *(void *)uint64_t v33 = v68;
      *((void *)v33 + 1) = v58;
      LOBYTE(v51) = v66;
      v33[16] = v66;
      uint64_t v60 = v69;
      *((void *)v33 + 3) = v69;
      sub_C898(v59, v58, v51);
      swift_bridgeObjectRetain(v60);
      sub_CE14((uint64_t)v52, &qword_1C970);
      sub_142A4(v12, *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
      sub_C4D4(v59, v58, v51);
      swift_bridgeObjectRelease(v60);
      unint64_t v61 = sub_13C58();
      uint64_t v62 = View.eraseToAnyView()(v57, v61);
      sub_CE14((uint64_t)v33, &qword_1C968);
      uint64_t v63 = v73;
      v73[3] = (uint64_t)&type metadata for AnyView;
      v63[4] = (uint64_t)&protocol witness table for AnyView;
      *uint64_t v63 = v62;
      goto LABEL_16;
    }

    swift_bridgeObjectRelease(v17);
    sub_14238();
    sub_CE14((uint64_t)v9, &qword_1C960);
    a1 = v73;
  }

  else
  {
    sub_14238();
  }

  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v27 = sub_428C();
  sub_141FC(v27, (uint64_t)static Logger.uiCategory);
  os_log_type_t v28 = sub_14290();
  if (sub_14118(v28))
  {
    uint64_t v29 = (_WORD *)sub_E804();
    sub_14298(v29);
    uint64_t v26 = "Button link is nil, returning empty announcement view";
LABEL_14:
    sub_14130(&dword_0, v24, v25, v26);
    sub_14150();
  }

LABEL_15:
  a1[4] = 0LL;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
LABEL_16:
  sub_D274();
}

id sub_12BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for FeatureType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v38 - v13;
  type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
  SuggestionsRFDataModels.FeatureAnnouncementDataModel.featureType.getter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v11, enum case for FeatureType.panIndia(_:), v6);
  char v15 = sub_12ED4();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v11, v6);
  v16(v14, v6);
  if ((v15 & 1) != 0)
  {
    id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
    if (!result)
    {
LABEL_11:
      __break(1u);
      return result;
    }

    uint64_t v18 = result;
    uint64_t v19 = sub_4A60(&qword_1C960);
    __chkstk_darwin(v19, v20);
    os_log_type_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    URL.init(string:)(0x6F723A7366657270LL, 0xEA0000000000746FLL);
    uint64_t v23 = type metadata accessor for URL(0LL);
    uint64_t v25 = 0LL;
    if (sub_56B8((uint64_t)v22, 1LL, v23) != 1)
    {
      URL._bridgeToObjectiveC()(v24);
      uint64_t v25 = v26;
      (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8LL))(v22, v23);
    }

    uint64_t v27 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    sub_13D50((uint64_t)v25, v27, v18);
  }

  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }

  os_log_type_t v28 = result;
  uint64_t v29 = sub_4A60(&qword_1C960);
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (char *)&v38 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  URL.init(string:)(a3, a4);
  uint64_t v33 = type metadata accessor for URL(0LL);
  uint64_t v35 = 0LL;
  if (sub_56B8((uint64_t)v32, 1LL, v33) != 1)
  {
    URL._bridgeToObjectiveC()(v34);
    uint64_t v35 = v36;
    (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8LL))(v32, v33);
  }

  uint64_t v37 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_13D50((uint64_t)v35, v37, v28);

  return (id)static OpenURLAction.Result.handled.getter();
}

uint64_t sub_12ED4()
{
  uint64_t v0 = type metadata accessor for FeatureType(0LL);
  unint64_t v1 = sub_140AC();
  dispatch thunk of RawRepresentable.rawValue.getter(&v9, v0, v1);
  dispatch thunk of RawRepresentable.rawValue.getter(&v7, v0, v1);
  uint64_t v2 = v10;
  uint64_t v3 = v8;
  if (v9 == v7 && v10 == v8)
  {
    char v5 = 1;
    uint64_t v3 = v10;
  }

  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return v5 & 1;
}

void sub_12F84(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v123 = a1;
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v121 = *(void *)(v4 - 8);
  uint64_t v122 = v4;
  sub_11764();
  __chkstk_darwin(v5, v6);
  sub_E7D4();
  uint64_t v120 = v7;
  uint64_t v8 = type metadata accessor for RFImage.Bundle.Location(0LL);
  uint64_t v118 = *(void *)(v8 - 8);
  uint64_t v119 = v8;
  sub_11764();
  __chkstk_darwin(v9, v10);
  sub_14258();
  type metadata accessor for RFImage(0LL);
  sub_11764();
  __chkstk_darwin(v11, v12);
  sub_E7D4();
  uint64_t v117 = v13;
  uint64_t v14 = type metadata accessor for FeatureType(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  uint64_t v19 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17, v20);
  os_log_type_t v22 = (char *)&v111 - v21;
  uint64_t v23 = &v1[*(int *)(sub_14128() + 20)];
  uint64_t v24 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementThumbnailName.getter();
  if (v25)
  {
    uint64_t v115 = v24;
    uint64_t v116 = v25;
    SuggestionsRFDataModels.FeatureAnnouncementDataModel.featureType.getter();
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v19, enum case for FeatureType.panIndia(_:), v14);
    char v26 = sub_12ED4();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v15 + 8);
    v27(v19, v14);
    uint64_t v28 = ((uint64_t (*)(char *, uint64_t))v27)(v22, v14);
    if ((v26 & 1) != 0)
    {
      sub_12700(&v137);
      if (!v139)
      {
        swift_bridgeObjectRelease(v116);
        sub_CE14((uint64_t)&v137, &qword_1C958);
        if (qword_1C160 != -1) {
          swift_once(&qword_1C160, sub_4130);
        }
        uint64_t v106 = sub_428C();
        sub_141FC(v106, (uint64_t)static Logger.uiCategory);
        os_log_type_t v107 = sub_14290();
        if (sub_14118(v107))
        {
          uint64_t v108 = (_WORD *)sub_E804();
          sub_14298(v108);
          sub_14130(&dword_0, v109, v110, "Announcement button is nil, returning empty announcement view");
          sub_14150();
        }

        uint64_t v103 = sub_142AC();
        uint64_t v104 = v123;
        uint64_t v105 = 1LL;
        goto LABEL_12;
      }

      sub_CE14((uint64_t)&v137, &qword_1C958);
      uint64_t v137 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementTitle.getter(v29);
      uint64_t v138 = v30;
      unint64_t v31 = sub_C468();
      uint64_t v32 = sub_14230((uint64_t)&v137, (uint64_t)&type metadata for String);
      uint64_t v34 = v33;
      char v36 = v35;
      uint64_t v38 = v37;
      uint64_t v139 = &type metadata for Text;
      uint64_t v140 = &protocol witness table for Text;
      uint64_t v39 = sub_14144((uint64_t)&unk_194A8);
      uint64_t v136 = 0LL;
      uint64_t v137 = v39;
      *(void *)(v39 + 16) = v32;
      *(void *)(v39 + 24) = v34;
      *(_BYTE *)(v39 + 32) = v36 & 1;
      *(void *)(v39 + 40) = v38;
      __int128 v134 = 0u;
      __int128 v135 = 0u;
      uint64_t v130 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementText.getter();
      uint64_t v131 = v40;
      sub_14230((uint64_t)&v130, (uint64_t)&type metadata for String);
      sub_142B4();
      uint64_t v132 = &type metadata for Text;
      uint64_t v133 = &protocol witness table for Text;
      uint64_t v41 = sub_14144((uint64_t)&unk_194A8);
      sub_14278(v41);
      uint64_t v42 = v3;
      sub_12700(v129);
      sub_11F50(v128);
      uint64_t v127 = 0LL;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      uint64_t v43 = sub_4A60(&qword_1C950);
      uint64_t v114 = &v111;
      uint64_t v44 = *(void *)(v43 - 8);
      uint64_t v112 = v43;
      uint64_t v113 = v44;
      sub_11764();
      __chkstk_darwin(v45, v46);
      uint64_t v47 = sub_14160();
      sub_141B0(v47, v48, v49, v50, v51, v52, v53, v54, v111);
      __chkstk_darwin(v55, v56);
      uint64_t v57 = sub_1417C();
      *uint64_t v2 = v57;
      v2[1] = v58;
      sub_141CC(v57, enum case for RFImage.Bundle.Location.path(_:));
      uint64_t v60 = v116;
      uint64_t v59 = v117;
      sub_14220(v115, v116);
      swift_bridgeObjectRelease(v60);
      sub_14210();
      uint64_t v61 = v59;
    }

    else
    {
      uint64_t v137 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementTitle.getter(v28);
      uint64_t v138 = v68;
      unint64_t v31 = sub_C468();
      uint64_t v69 = sub_14230((uint64_t)&v137, (uint64_t)&type metadata for String);
      uint64_t v34 = v70;
      char v72 = v71;
      uint64_t v74 = v73;
      uint64_t v139 = &type metadata for Text;
      uint64_t v140 = &protocol witness table for Text;
      uint64_t v75 = sub_14144((uint64_t)&unk_194A8);
      uint64_t v136 = 0LL;
      uint64_t v137 = v75;
      *(void *)(v75 + 16) = v69;
      *(void *)(v75 + 24) = v34;
      *(_BYTE *)(v75 + 32) = v72 & 1;
      *(void *)(v75 + 40) = v74;
      __int128 v134 = 0u;
      __int128 v135 = 0u;
      uint64_t v130 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.announcementText.getter();
      uint64_t v131 = v76;
      sub_14230((uint64_t)&v130, (uint64_t)&type metadata for String);
      sub_142B4();
      uint64_t v132 = &type metadata for Text;
      uint64_t v133 = &protocol witness table for Text;
      uint64_t v77 = sub_14144((uint64_t)&unk_194A8);
      sub_14278(v77);
      memset(v129, 0, sizeof(v129));
      uint64_t v42 = v3;
      sub_11F50(v128);
      uint64_t v127 = 0LL;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      uint64_t v78 = sub_4A60(&qword_1C950);
      uint64_t v114 = &v111;
      uint64_t v79 = *(void *)(v78 - 8);
      uint64_t v112 = v78;
      uint64_t v113 = v79;
      sub_11764();
      __chkstk_darwin(v80, v81);
      uint64_t v82 = sub_14160();
      sub_141B0(v82, v83, v84, v85, v86, v87, v88, v89, v111);
      __chkstk_darwin(v90, v91);
      uint64_t v92 = sub_1417C();
      *uint64_t v2 = v92;
      v2[1] = v93;
      sub_141CC(v92, enum case for RFImage.Bundle.Location.path(_:));
      uint64_t v94 = v117;
      sub_14220(v115, v116);
      sub_14238();
      sub_14210();
      uint64_t v61 = v94;
    }

    RFImageView.init(_:)(v61);
    uint64_t v95 = v120;
    uint64_t v96 = v121;
    uint64_t v97 = v122;
    (*(void (**)(uint64_t, void, uint64_t))(v121 + 104))( v120,  enum case for ImageElement.ImageStyle.image5(_:),  v122);
    sub_CEF8(&qword_1C5D8, (uint64_t (*)(uint64_t))&type metadata accessor for RFImageView);
    uint64_t v99 = v98;
    View.imageStyle(_:)(v95, v31, v98);
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
    (*(void (**)(void *, unint64_t))(v34 + 8))(v42, v31);
    v124[0] = v31;
    v124[1] = v99;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v124,  &opaque type descriptor for <<opaque return type of View.imageStyle(_:)>>,  1LL);
    uint64_t v101 = View.eraseToAnyView()(v112, OpaqueTypeConformance2);
    sub_142A4((uint64_t)v23, *(uint64_t (**)(uint64_t, uint64_t))(v113 + 8));
    v124[3] = &type metadata for AnyView;
    v124[4] = &protocol witness table for AnyView;
    v124[0] = v101;
    uint64_t v102 = v123;
    SummaryItemDetailedTextView.init(text1:text2:text3:text4:text5:text6:thumbnail:)( &v137,  &v134,  &v130,  v129,  v128,  &v125,  v124);
    uint64_t v103 = sub_142AC();
    uint64_t v104 = v102;
    uint64_t v105 = 0LL;
LABEL_12:
    sub_5750(v104, v105, 1LL, v103);
    sub_D274();
    return;
  }

  if (qword_1C160 != -1) {
    swift_once(&qword_1C160, sub_4130);
  }
  uint64_t v62 = sub_428C();
  sub_141FC(v62, (uint64_t)static Logger.uiCategory);
  os_log_type_t v63 = sub_14290();
  if (sub_14118(v63))
  {
    uint64_t v64 = (_WORD *)sub_E804();
    sub_14298(v64);
    sub_14130(&dword_0, v65, v66, "Announcement icon is nil, returning empty announcement view");
    sub_14150();
  }

  uint64_t v67 = sub_142AC();
  sub_5750(v123, 1LL, 1LL, v67);
}

uint64_t sub_13634()
{
  uint64_t v1 = sub_14128();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1, v4);
  sub_13938(v0, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = (v5 + 16) & ~v5;
  uint64_t v7 = swift_allocObject(&unk_19480, v6 + v3, v5 | 7);
  sub_13980((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v7 + v6);
  uint64_t v8 = sub_4A60(&qword_1C920);
  sub_139EC();
  return ComponentStack.init(content:)(sub_139C4, v7, v8);
}

uint64_t sub_13700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FeatureType(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v9 = *(void *)(a1 + 8);
  LOBYTE(v35) = *(_BYTE *)a1;
  unint64_t v36 = v9;
  uint64_t v10 = sub_4A60(&qword_1C518);
  State.wrappedValue.getter(&v37, v10);
  int v11 = v37;
  uint64_t v12 = sub_4A60(&qword_1C948);
  uint64_t v14 = v12;
  if (v11 == 1)
  {
    uint64_t v34 = &v30;
    uint64_t v33 = *(void *)(v12 - 8);
    __chkstk_darwin(v12, v13);
    uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = sub_4A60(&qword_1C930);
    uint64_t v32 = &v30;
    __chkstk_darwin(v31, v17);
    uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_12F84((uint64_t)v19);
    type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
    uint64_t v20 = SuggestionsRFDataModels.FeatureAnnouncementDataModel.featureType.getter();
    uint64_t v21 = FeatureType.rawValue.getter(v20);
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    unint64_t v35 = 0xD000000000000014LL;
    unint64_t v36 = 0x8000000000017310LL;
    v24._countAndFlagsBits = v21;
    v24._object = v23;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(v23);
    unint64_t v25 = v35;
    unint64_t v26 = v36;
    unint64_t v27 = sub_13A78();
    View.componentName(_:)(v25, v26, v31, v27);
    swift_bridgeObjectRelease(v26);
    sub_CE14((uint64_t)v19, &qword_1C930);
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(a2, v16, v14);
    uint64_t v28 = 0LL;
  }

  else
  {
    uint64_t v28 = 1LL;
  }

  return sub_5750(a2, v28, 1LL, v14);
}

uint64_t sub_13938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_13980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_139C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_14128();
  uint64_t v3 = sub_D1FC(v2);
  return sub_13700(v3, a1);
}

unint64_t sub_139EC()
{
  unint64_t result = qword_1C928;
  if (!qword_1C928)
  {
    uint64_t v1 = sub_4BC8(&qword_1C920);
    v2[0] = sub_4BC8(&qword_1C930);
    v2[1] = sub_13A78();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.componentName(_:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1C928);
  }

  return result;
}

unint64_t sub_13A78()
{
  unint64_t result = qword_1C938;
  if (!qword_1C938)
  {
    uint64_t v1 = sub_4BC8(&qword_1C930);
    sub_CEF8(&qword_1C940, (uint64_t (*)(uint64_t))&type metadata accessor for SummaryItemDetailedTextView);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1C938);
  }

  return result;
}

uint64_t sub_13AF4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_13B24()
{
  return EnvironmentValues.openURL.getter();
}

void sub_13B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_13B68()
{
  uint64_t v2 = v1 | 7;
  unint64_t v5 = (v3 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + v4 + 8));
  uint64_t v6 = sub_14270();
  sub_D17C(v6);
  uint64_t v7 = sub_D190();
  sub_D158(v7);
  swift_bridgeObjectRelease(*(void *)(v0 + v5 + 8));
  return swift_deallocObject(v0, v5 + 16, v2);
}

id sub_13BF8(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_14128() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  return sub_12BC0(a1, v1 + v4, *v5, v5[1]);
}

unint64_t sub_13C58()
{
  unint64_t result = qword_1C978;
  if (!qword_1C978)
  {
    uint64_t v1 = sub_4BC8(&qword_1C968);
    sub_D120(&qword_1C980, &qword_1C970);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C978);
  }

  return result;
}

void sub_13CDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(char *))
{
  uint64_t v8 = a5(0LL);
  __chkstk_darwin(v8, v9);
  int v11 = (char *)&v13 - v10;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v13 - v10, a1);
  a6(v11);
  sub_D2FC();
}

id sub_13D50(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2);
  id v7 = [a3 openSensitiveURL:a1 withOptions:isa];

  return v7;
}

uint64_t sub_13DD4()
{
  return sub_14028(sub_121B0);
}

unint64_t sub_13DE0()
{
  unint64_t result = qword_1C9A0;
  if (!qword_1C9A0)
  {
    uint64_t v1 = sub_4BC8(&qword_1C998);
    sub_13E64();
    sub_D120(&qword_1C9B8, &qword_1C9C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C9A0);
  }

  return result;
}

unint64_t sub_13E64()
{
  unint64_t result = qword_1C9A8;
  if (!qword_1C9A8)
  {
    uint64_t v1 = sub_4BC8(&qword_1C9B0);
    sub_D120(&qword_1C220, &qword_1C228);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1C9A8);
  }

  return result;
}

uint64_t sub_13EE8()
{
  return EnvironmentValues.imageScale.getter();
}

void sub_13F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_13F2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4A60(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_51B8();
}

unint64_t sub_13F6C()
{
  unint64_t result = qword_1C9E0;
  if (!qword_1C9E0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1C9E0);
  }

  return result;
}

uint64_t sub_13FAC()
{
  uint64_t v3 = v2 + v1;
  uint64_t v5 = v4 | 7;
  swift_release(*(void *)(v0 + v2 + 8));
  uint64_t v6 = sub_14270();
  sub_D17C(v6);
  uint64_t v7 = sub_D190();
  sub_D158(v7);
  return swift_deallocObject(v0, v3, v5);
}

uint64_t sub_1401C()
{
  return sub_14028(sub_12474);
}

uint64_t sub_14028(uint64_t (*a1)(uint64_t))
{
  uint64_t v1 = sub_14128();
  uint64_t v2 = sub_D1FC(v1);
  return a1(v2);
}

uint64_t sub_14050(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_14060(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_14068()
{
  unint64_t result = qword_1C9F8;
  if (!qword_1C9F8)
  {
    uint64_t v1 = sub_4BC8(&qword_1C9F0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1C9F8);
  }

  return result;
}

unint64_t sub_140AC()
{
  unint64_t result = qword_1CA00;
  if (!qword_1CA00)
  {
    uint64_t v1 = type metadata accessor for FeatureType(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for FeatureType, v1);
    atomic_store(result, (unint64_t *)&qword_1CA00);
  }

  return result;
}

void sub_140EC()
{
}

BOOL sub_14118(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_14128()
{
  return type metadata accessor for SiriFeatureAnnouncementSnippetView(0LL);
}

void sub_14130(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_14144(uint64_t a1)
{
  return swift_allocObject(a1, 48LL, 7LL);
}

uint64_t sub_14150()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

uint64_t sub_14160()
{
  return type metadata accessor for RFImageView(0LL);
}

uint64_t sub_1417C()
{
  return static SuggestionsRFDataModels.bundlePath.getter();
}

  ;
}

void sub_141B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *uint64_t v9 = &a9;
}

uint64_t sub_141CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v2 + 56) + 104LL))( v3,  a2,  *(void *)(v2 + 64));
}

  ;
}

uint64_t sub_141FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_41C8(a1, a2);
  return Logger.logObject.getter(v2);
}

uint64_t sub_14210()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_14220(uint64_t a1, uint64_t a2)
{
  return static RFImage.bundle(_:darkName:location:)(a1, a2, 0LL, 0LL, v2);
}

uint64_t sub_14230(uint64_t a1, uint64_t a2)
{
  return Text.init<A>(_:)(a1, a2, v2);
}

uint64_t sub_14238()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

  ;
}

uint64_t sub_14270()
{
  return type metadata accessor for SuggestionsRFDataModels.FeatureAnnouncementDataModel(0LL);
}

uint64_t sub_14278(uint64_t result)
{
  *(void *)(v5 - 216) = result;
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v2;
  *(_BYTE *)(result + 32) = v3 & 1;
  *(void *)(result + 40) = v4;
  return result;
}

uint64_t sub_14290()
{
  return static os_log_type_t.error.getter();
}

_WORD *sub_14298(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_142A4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_142AC()
{
  return type metadata accessor for SummaryItemDetailedTextView(0LL);
}

  ;
}

uint64_t sub_142C8()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC23SiriSuggestionsUIPluginP33_88B2F8A95E5BA0FEA3C72C65B457EBB319ResourceBundleClass);
}