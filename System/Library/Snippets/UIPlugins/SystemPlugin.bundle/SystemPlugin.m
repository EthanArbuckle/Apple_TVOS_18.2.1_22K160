unint64_t sub_471C()
{
  unint64_t result;
  uint64_t v1;
  result = qword_24358;
  if (!qword_24358)
  {
    v1 = type metadata accessor for Context(255LL);
    result = swift_getWitnessTable(&protocol conformance descriptor for Context, v1);
    atomic_store(result, (unint64_t *)&qword_24358);
  }

  return result;
}

uint64_t variable initialization expression of SashStandardView._appIcon()
{
  return sub_4A90();
}

uint64_t variable initialization expression of SashStandardView._appTitle()
{
  return 0LL;
}

uint64_t variable initialization expression of AppIconView._componentPreferredImageStyle@<X0>( void *a1@<X8>)
{
  return sub_4850((uint64_t)&unk_1BB20, &qword_24360, a1);
}

uint64_t sub_47B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of AppIconView._displayScale()
{
  return swift_getKeyPath(&unk_1BB50);
}

uint64_t variable initialization expression of IntentsUIStandardView._responseModel@<X0>(void *a1@<X8>)
{
  return sub_4850((uint64_t)&unk_1BB80, &qword_24368, a1);
}

uint64_t variable initialization expression of TVContactMonogramView._colorScheme@<X0>(void *a1@<X8>)
{
  return sub_4850((uint64_t)&unk_1BBB0, &qword_24370, a1);
}

uint64_t sub_4850@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  *a3 = swift_getKeyPath(a1);
  sub_47B4(a2);
  return sub_4A90();
}

uint64_t _s12SystemPlugin21IntentsUIStandardViewV8_context33_B186D5490C027C03FE29A950973ABEA6LL7SwiftUI17EnvironmentObjectVy07SnippetO07ContextCGvpfi_0()
{
  uint64_t v0 = type metadata accessor for Context(0LL);
  unint64_t v1 = sub_471C();
  return EnvironmentObject.init()(v0, v1);
}

uint64_t variable initialization expression of MapIdentifiablePlace.canvas@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for CustomCanvas(0LL);
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, 1LL, 1LL, v2);
}

uint64_t _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

__n128 initializeWithTake for PlaceholderView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for VRXIdiom(uint64_t a1)
{
}

uint64_t sub_4938(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_4968(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_4974(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_4994(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
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

  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_49E8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_4A08(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
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

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
}

void sub_4A44(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_4A90()
{
  return ((uint64_t (*)(void))swift_storeEnumTagMultiPayload)();
}

uint64_t _s12SystemPlugin21TVContactMonogramViewV6_image33_7BB11BAE10496D40910CA6FDBE7CEF5DLL7SwiftUI5StateVyAF5ImageVSgGvpfi_0()
{
  return 0LL;
}

void property wrapper backing initializer of SashStandardView.appIcon(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SashStandardView.AppIcon(0LL);
  sub_8E6C();
  __chkstk_darwin();
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_66B4(a1, (uint64_t)v6, type metadata accessor for SashStandardView.AppIcon);
  State.init(wrappedValue:)(a2, v6, v4);
  sub_8DF0(a1, type metadata accessor for SashStandardView.AppIcon);
}

uint64_t type metadata accessor for SashStandardView.AppIcon(uint64_t a1)
{
  return sub_4DE4(a1, qword_24548, (uint64_t)&nominal type descriptor for SashStandardView.AppIcon);
}

uint64_t property wrapper backing initializer of SashStandardView.appTitle(uint64_t a1, uint64_t a2)
{
  v3[0] = a1;
  v3[1] = a2;
  State.init(wrappedValue:)(&v4, v3, &type metadata for String);
  return v4;
}

uint64_t SashStandardView.init(modelData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v4 = type metadata accessor for SashStandard(0LL);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  sub_8E6C();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SashStandardView.AppIcon(0LL);
  sub_8E6C();
  uint64_t v10 = __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  v14 = (char *)&v30 - v13;
  v15 = (int *)type metadata accessor for SashStandardView(0LL);
  uint64_t v16 = a3 + v15[5];
  uint64_t v17 = type metadata accessor for Context(0LL);
  sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  *(void *)uint64_t v16 = EnvironmentObject.init()(v17, v18);
  *(void *)(v16 + 8) = v19;
  v20 = (void *)(a3 + v15[6]);
  swift_storeEnumTagMultiPayload(v14, v8, 2LL);
  sub_66B4((uint64_t)v14, (uint64_t)v12, type metadata accessor for SashStandardView.AppIcon);
  State.init(wrappedValue:)(v20, v12, v8);
  v21 = v7;
  sub_8DF0((uint64_t)v14, type metadata accessor for SashStandardView.AppIcon);
  uint64_t v22 = a3 + v15[7];
  v35[0] = 0LL;
  v35[1] = 0xE000000000000000LL;
  State.init(wrappedValue:)(&v36, v35, &type metadata for String);
  uint64_t v23 = v37;
  *(_OWORD *)uint64_t v22 = v36;
  *(void *)(v22 + 16) = v23;
  uint64_t v24 = v32;
  _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA6LL9SnippetUI06ActionG0Vvpfi_0();
  sub_8DBC(&qword_243A0, (uint64_t (*)(uint64_t))&type metadata accessor for SashStandard);
  uint64_t v25 = v38;
  ProtobufBuilder.init(serializedData:)(v33, v34, v24, v26);
  if (!v25) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(a3, v21, v24);
  }

  sub_8D84((uint64_t)v20, &qword_243A8);
  swift_bridgeObjectRelease(*(void *)(v22 + 8));
  swift_release(*(void *)(v22 + 16));
  type metadata accessor for ActionHandler(0LL);
  uint64_t v27 = sub_8E88();
  return v28(v27);
}

uint64_t type metadata accessor for SashStandardView(uint64_t a1)
{
  return sub_4DE4(a1, (uint64_t *)&unk_24478, (uint64_t)&nominal type descriptor for SashStandardView);
}

uint64_t sub_4DE4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t SashStandardView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  uint64_t v67 = *(void *)(v2 - 8);
  uint64_t v68 = v2;
  sub_8E6C();
  __chkstk_darwin(v3);
  sub_8E34();
  uint64_t v66 = v4;
  uint64_t v5 = type metadata accessor for SashStandardView(0LL);
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v60 + 64);
  __chkstk_darwin(v5);
  uint64_t v7 = sub_47B4(&qword_243B0);
  uint64_t v64 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  sub_8E6C();
  __chkstk_darwin(v8);
  sub_8E34();
  uint64_t v63 = v9;
  uint64_t v61 = sub_47B4(&qword_243B8);
  sub_8E6C();
  __chkstk_darwin(v10);
  sub_8E34();
  uint64_t v62 = v11;
  uint64_t v59 = static VerticalAlignment.center.getter();
  sub_522C((uint64_t)v71);
  __int128 v58 = *(_OWORD *)v71;
  int v57 = v71[16];
  uint64_t v55 = *(void *)&v71[32];
  uint64_t v56 = *(void *)&v71[24];
  uint64_t v53 = *(void *)&v71[48];
  uint64_t v54 = *(void *)&v71[40];
  char v12 = v71[56];
  uint64_t v52 = *(void *)&v71[64];
  char v13 = v71[72];
  unsigned int v14 = static Edge.Set.leading.getter();
  unsigned int v15 = static Edge.Set.top.getter();
  unsigned int v16 = static Edge.Set.trailing.getter();
  uint64_t v17 = Edge.Set.init(rawValue:)(0LL);
  int v18 = Edge.Set.init(rawValue:)(v17);
  int v19 = Edge.Set.init(rawValue:)(v17);
  int v20 = Edge.Set.init(rawValue:)(v17);
  double v21 = EdgeInsets.init(_all:)(16.0);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  char v75 = 0;
  char v74 = v12;
  char v73 = v13;
  char v72 = 0;
  uint64_t v28 = sub_5CE8();
  uint64_t v29 = v1;
  if (!v28) {
    uint64_t v28 = static Color.clear.getter();
  }
  *(void *)v71 = v28;
  uint64_t v30 = AnyShapeStyle.init<A>(_:)(v71, &type metadata for Color, &protocol witness table for Color);
  char v31 = v75;
  char v32 = v74;
  char v33 = v73;
  char v34 = v72;
  char v35 = static Edge.Set.all.getter();
  v70[0] = v59;
  v70[1] = 0LL;
  LOBYTE(v70[2]) = v31;
  *(_OWORD *)&v70[3] = v58;
  LOBYTE(v70[5]) = v57;
  v70[6] = v56;
  v70[7] = v55;
  v70[8] = v54;
  v70[9] = v53;
  LOBYTE(v70[10]) = v32;
  v70[11] = v52;
  LOBYTE(v70[12]) = v33;
  LOBYTE(v70[13]) = v17;
  *(double *)&v70[14] = v21;
  v70[15] = v23;
  v70[16] = v25;
  v70[17] = v27;
  LOBYTE(v70[18]) = v34;
  v70[19] = v30;
  LOBYTE(v70[20]) = v35;
  uint64_t v36 = v29;
  sub_66B4(v29, (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), type metadata accessor for SashStandardView);
  uint64_t v37 = sub_8EC4((uint64_t)&unk_21320);
  sub_8ED0(v37);
  uint64_t v38 = sub_47B4(&qword_243C0);
  unint64_t v39 = sub_6748();
  uint64_t v40 = v63;
  View.onTapGestureWhereSupported(perform:)(sub_6728, v37, v38, v39);
  swift_release(v37);
  memcpy(v71, v70, sizeof(v71));
  sub_68F8(v71);
  sub_66B4(v36, (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), type metadata accessor for SashStandardView);
  uint64_t v41 = sub_8EC4((uint64_t)&unk_21348);
  uint64_t v42 = sub_8ED0(v41);
  uint64_t v43 = v66;
  static TaskPriority.userInitiated.getter(v42);
  uint64_t v44 = v62;
  v45 = (char *)(v62 + *(int *)(v61 + 36));
  uint64_t v46 = type metadata accessor for _TaskModifier(0LL);
  uint64_t v48 = v67;
  uint64_t v47 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(&v45[*(int *)(v46 + 20)], v43, v68);
  *(void *)v45 = &unk_24418;
  *((void *)v45 + 1) = v41;
  uint64_t v50 = v64;
  uint64_t v49 = v65;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v44, v40, v65);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v43, v47);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v40, v49);
  return sub_6B88(v44, v69);
}

void sub_522C(uint64_t a1@<X8>)
{
  uint64_t v2 = v9;
  sub_58F8(&v9);
  uint64_t v3 = v9;
  char v4 = static Edge.Set.leading.getter();
  double v5 = EdgeInsets.init(_all:)(8.0);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(double *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0LL;
  *(_BYTE *)(a1 + 72) = 0;
}

void sub_52A0(uint64_t *a1@<X8>)
{
  v82 = a1;
  uint64_t v75 = sub_47B4(&qword_24628);
  uint64_t v72 = *(void *)(v75 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v70 = (char *)&v68 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = sub_47B4(&qword_24630);
  uint64_t v76 = *(void *)(v2 - 8);
  uint64_t v77 = v2;
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v71 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  char v74 = (char *)&v68 - v5;
  uint64_t v73 = type metadata accessor for VisualProperty(0LL);
  uint64_t v81 = *(void *)(v73 - 8);
  uint64_t v6 = __chkstk_darwin(v73);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v80 = (char *)&v68 - v9;
  uint64_t v10 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v78 = *(void *)(v10 - 8);
  uint64_t v79 = v10;
  __chkstk_darwin(v10);
  char v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = type metadata accessor for ImageElement.AppIcon(0LL);
  uint64_t v13 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  unsigned int v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v16 = (int *)type metadata accessor for AppIconView(0LL);
  uint64_t v17 = __chkstk_darwin(v16);
  int v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  double v21 = (char *)&v68 - v20;
  uint64_t v22 = type metadata accessor for SashStandardView.AppIcon(0LL);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for SashStandardView(0LL);
  uint64_t v25 = sub_47B4(&qword_243A8);
  State.wrappedValue.getter(v25);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v24, v22);
  if ((_DWORD)EnumCaseMultiPayload)
  {
    if ((_DWORD)EnumCaseMultiPayload == 1)
    {
      uint64_t v28 = v80;
      uint64_t v27 = v81;
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
      uint64_t v30 = v24;
      uint64_t v31 = v73;
      v29(v80, v30, v73);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v8, v28, v31);
      char v32 = &v21[v16[5]];
      uint64_t v33 = type metadata accessor for Context(0LL);
      sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
      *(void *)char v32 = EnvironmentObject.init()(v33, v34);
      *((void *)v32 + 1) = v35;
      uint64_t v36 = &v21[v16[6]];
      *(void *)uint64_t v36 = swift_getKeyPath(&unk_1BD78);
      uint64_t v37 = sub_47B4(&qword_24360);
      swift_storeEnumTagMultiPayload(v36, v37, 0LL);
      uint64_t v38 = &v21[v16[7]];
      *(void *)uint64_t v38 = swift_getKeyPath(&unk_1BDA8);
      v38[8] = 0;
      uint64_t v39 = v16[8];
      uint64_t v83 = 0LL;
      uint64_t v40 = sub_47B4(&qword_24638);
      State.init(wrappedValue:)(&v84, &v83, v40);
      *(_OWORD *)&v21[v39] = v84;
      v29(v21, v8, v31);
      uint64_t v41 = type metadata accessor for AppIconView.Model(0LL);
      swift_storeEnumTagMultiPayload(v21, v41, 2LL);
      uint64_t v43 = v78;
      uint64_t v42 = v79;
      (*(void (**)(char *, void, uint64_t))(v78 + 104))( v12,  enum case for ImageElement.ImageStyle.appIcon2(_:),  v79);
      sub_8DBC(&qword_24640, type metadata accessor for AppIconView);
      uint64_t v45 = v44;
      uint64_t v46 = v70;
      View.imageStyle(_:)(v12, v16, v44);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v42);
      sub_8DF0((uint64_t)v21, type metadata accessor for AppIconView);
      *(void *)&__int128 v84 = v16;
      *((void *)&v84 + 1) = v45;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v84,  &opaque type descriptor for <<opaque return type of View.imageStyle(_:)>>,  1LL);
      uint64_t v49 = v74;
      uint64_t v48 = v75;
      View.imageFixedSize(horizontal:vertical:)(0LL, 1LL, v75, OpaqueTypeConformance2);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v46, v48);
      uint64_t v51 = v76;
      uint64_t v50 = v77;
      uint64_t v52 = v71;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v71, v49, v77);
      *(void *)&__int128 v84 = v48;
      *((void *)&v84 + 1) = OpaqueTypeConformance2;
      uint64_t v53 = swift_getOpaqueTypeConformance2( &v84,  &opaque type descriptor for <<opaque return type of View.imageFixedSize(horizontal:vertical:)>>,  1LL);
      uint64_t v54 = AnyView.init<A>(_:)(v52, v50, v53);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v49, v50);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v80, v31);
    }

    else
    {
      uint64_t v54 = AnyView.init<A>(_:)( EnumCaseMultiPayload,  &type metadata for EmptyView,  &protocol witness table for EmptyView);
    }
  }

  else
  {
    uint64_t v55 = *(void *)v24;
    uint64_t v56 = *((void *)v24 + 1);
    (*(void (**)(char *, void, uint64_t))(v78 + 104))( v12,  enum case for ImageElement.ImageStyle.appIcon2(_:),  v79);
    ImageElement.AppIcon.init(_:imageStyle:)(v55, v56, v12);
    int v57 = &v21[v16[5]];
    uint64_t v58 = type metadata accessor for Context(0LL);
    sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    *(void *)int v57 = EnvironmentObject.init()(v58, v59);
    *((void *)v57 + 1) = v60;
    uint64_t v61 = &v21[v16[6]];
    *(void *)uint64_t v61 = swift_getKeyPath(&unk_1BD78);
    uint64_t v62 = sub_47B4(&qword_24360);
    swift_storeEnumTagMultiPayload(v61, v62, 0LL);
    uint64_t v63 = &v21[v16[7]];
    *(void *)uint64_t v63 = swift_getKeyPath(&unk_1BDA8);
    v63[8] = 0;
    uint64_t v64 = v16[8];
    uint64_t v83 = 0LL;
    uint64_t v65 = sub_47B4(&qword_24638);
    State.init(wrappedValue:)(&v84, &v83, v65);
    *(_OWORD *)&v21[v64] = v84;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v15, v69);
    uint64_t v66 = type metadata accessor for AppIconView.Model(0LL);
    swift_storeEnumTagMultiPayload(v21, v66, 1LL);
    sub_66B4((uint64_t)v21, (uint64_t)v19, type metadata accessor for AppIconView);
    sub_8DBC(&qword_24640, type metadata accessor for AppIconView);
    uint64_t v54 = AnyView.init<A>(_:)(v19, v16, v67);
    sub_8DF0((uint64_t)v21, type metadata accessor for AppIconView);
  }

  uint64_t *v82 = v54;
}

void sub_58F8(uint64_t *a1@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v2 = sub_47B4(&qword_245D0);
  __chkstk_darwin(v2);
  uint64_t v54 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_47B4(&qword_245D8);
  __chkstk_darwin(v4);
  uint64_t v48 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = type metadata accessor for TextElement(0LL);
  uint64_t v47 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = sub_47B4(&qword_245E0);
  uint64_t v49 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v46 = sub_47B4(&qword_245E8);
  __chkstk_darwin(v46);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = sub_47B4(&qword_245F0);
  uint64_t v12 = __chkstk_darwin(v53);
  uint64_t v51 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unsigned int v15 = (char *)&v45 - v14;
  uint64_t v16 = *(int *)(type metadata accessor for SashStandardView(0LL) + 28);
  uint64_t v55 = v1;
  uint64_t v17 = (uint64_t *)(v1 + v16);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v20 = v17[2];
  *(void *)&__int128 v57 = *v17;
  *((void *)&v57 + 1) = v19;
  *(void *)&__int128 v58 = v20;
  uint64_t v21 = sub_47B4(&qword_24588);
  State.wrappedValue.getter(v21);
  uint64_t v22 = v60;
  unint64_t v23 = v61;
  uint64_t v24 = swift_bridgeObjectRelease(v61);
  uint64_t v25 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000LL) == 0) {
    uint64_t v25 = v22 & 0xFFFFFFFFFFFFLL;
  }
  if (v25)
  {
    *(void *)&__int128 v57 = v18;
    *((void *)&v57 + 1) = v19;
    *(void *)&__int128 v58 = v20;
    State.wrappedValue.getter(v21);
    uint64_t v26 = v60;
    unint64_t v27 = v61;
    uint64_t v28 = type metadata accessor for TextElement.Font(0LL);
    uint64_t v29 = v48;
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v48, 1LL, 1LL, v28);
    uint64_t v30 = type metadata accessor for _ProtoTextElement.Font.Weight(0LL);
    uint64_t v31 = v54;
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v54, 1LL, 1LL, v30);
    uint64_t v59 = 0LL;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    char v44 = 1;
    uint64_t v32 = TextElement.init(_:font:fontWeight:fontColor:italic:bold:lineLimit:idioms:)( v26,  v27,  v29,  v31,  &v57,  2LL,  2LL,  0LL,  v44,  &_swiftEmptySetSingleton);
    TextElement.asView()(v32);
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v7, v50);
    int v34 = static HierarchicalShapeStyle.secondary.getter(v33);
    uint64_t v35 = v49;
    uint64_t v36 = v52;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v11, v9, v52);
    *(_DWORD *)&v11[*(int *)(v46 + 36)] = v34;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v36);
    uint64_t v37 = sub_7550();
    uint64_t KeyPath = swift_getKeyPath(&unk_1BD48);
    sub_8C10((uint64_t)v11, (uint64_t)v15, &qword_245E8);
    uint64_t v39 = v53;
    uint64_t v40 = (uint64_t *)&v15[*(int *)(v53 + 36)];
    *uint64_t v40 = KeyPath;
    v40[1] = v37;
    sub_8D84((uint64_t)v11, &qword_245E8);
    uint64_t v41 = v51;
    sub_8C10((uint64_t)v15, v51, &qword_245F0);
    unint64_t v42 = sub_8C3C();
    uint64_t v43 = AnyView.init<A>(_:)(v41, v39, v42);
    sub_8D84((uint64_t)v15, &qword_245F0);
  }

  else
  {
    uint64_t v43 = AnyView.init<A>(_:)(v24, &type metadata for EmptyView, &protocol witness table for EmptyView);
  }

  *uint64_t v56 = v43;
}

uint64_t sub_5CE8()
{
  uint64_t v1 = type metadata accessor for Color(0LL);
  uint64_t v45 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v44 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for ColorElement(0LL);
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  __chkstk_darwin(v3);
  uint64_t v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_47B4(&qword_245A0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_47B4(&qword_245C8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for VisualElement(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v46 = (char *)&v39 - v20;
  SashStandard.backgroundColor.getter(v19);
  uint64_t v21 = type metadata accessor for VisualProperty(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1LL, v21) == 1)
  {
    sub_8D84((uint64_t)v10, &qword_245A0);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 1LL, 1LL, v14);
    goto LABEL_5;
  }

  uint64_t v40 = v1;
  uint64_t v22 = VisualProperty.allVisualElements.getter();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8LL))(v10, v21);
  uint64_t v23 = v0 + *(int *)(type metadata accessor for SashStandardView(0LL) + 20);
  if (*(void *)v23)
  {
    id v24 = *(id *)v23;
    uint64_t v25 = dispatch thunk of Context.currentIdiom.getter();

    VRXIdiom.idiom.getter(v25);
    Array<A>.element(for:)(v7, v22, v14, &protocol witness table for VisualElement);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v13, 1LL, v14) != 1)
    {
      uint64_t v28 = v46;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v46, v13, v14);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v28, v14);
      if ((*(unsigned int (**)(char *, uint64_t))(v15 + 88))(v18, v14) == enum case for VisualElement.color(_:))
      {
        (*(void (**)(char *, uint64_t))(v15 + 96))(v18, v14);
        uint64_t v30 = v41;
        uint64_t v29 = v42;
        uint64_t v31 = v43;
        uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v42 + 32))(v41, v18, v43);
        uint64_t v33 = v44;
        uint64_t v34 = ColorElement.color.getter(v32);
        uint64_t v26 = Color.swiftValue.getter(v34);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v40);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
        (*(void (**)(char *, uint64_t))(v15 + 8))(v28, v14);
        return v26;
      }

      uint64_t v35 = *(void (**)(char *, uint64_t))(v15 + 8);
      v35(v28, v14);
      v35(v18, v14);
      return 0LL;
    }

LABEL_5:
    sub_8D84((uint64_t)v13, &qword_245C8);
    return 0LL;
  }

  uint64_t v36 = *(void *)(v23 + 8);
  uint64_t v37 = type metadata accessor for Context(0LL);
  sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = EnvironmentObject.error()(0LL, v36, v37, v38);
  __break(1u);
  return result;
}

    sub_8D84((uint64_t)v13, &qword_245C8);
    return static Color.secondary.getter();
  }

  uint64_t v36 = *(void *)(v23 + 8);
  uint64_t v37 = type metadata accessor for Context(0LL);
  sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = EnvironmentObject.error()(0LL, v36, v37, v38);
  __break(1u);
  return result;
}

void sub_60F4()
{
  uint64_t v0 = type metadata accessor for Command(0LL);
  uint64_t v61 = *(void *)(v0 - 8);
  uint64_t v62 = v0;
  __chkstk_darwin(v0);
  uint64_t v60 = (char **)((char *)&v54 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  __chkstk_darwin(v2);
  uint64_t v56 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SashStandardView.AppIcon(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = sub_47B4(&qword_245A8);
  __chkstk_darwin(v7);
  uint64_t v55 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_47B4(&qword_245B0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_47B4(&qword_245B8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v59 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v54 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v54 - v18;
  type metadata accessor for SashStandardView(0LL);
  ((void (*)(void))ActionHandler.wrappedValue.getter)();
  uint64_t v20 = type metadata accessor for StandardActionHandler(0LL);
  int v21 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1LL, v20);
  uint64_t v63 = v20;
  uint64_t v54 = v11;
  if (v21 == 1)
  {
    sub_8D84((uint64_t)v19, &qword_245B8);
LABEL_6:
    uint64_t v27 = sub_47B4(&qword_243A8);
    State.wrappedValue.getter(v27);
    if (swift_getEnumCaseMultiPayload(v6, v4))
    {
      sub_8DF0((uint64_t)v6, type metadata accessor for SashStandardView.AppIcon);
      return;
    }

    uint64_t v29 = *v6;
    uint64_t v28 = v6[1];
    id v30 = [objc_allocWithZone(SAUIAppPunchOut) init];
    uint64_t v31 = v56;
    uint64_t v32 = UUID.init()();
    uint64_t v33 = UUID.uuidString.getter(v32);
    uint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v31, v58);
    sub_8AE4(v33, v35, v30, (SEL *)&selRef_setAceId_);
    [v30 setAppAvailableInStorefront:1];
    sub_8AE4(v29, v28, v30, (SEL *)&selRef_setBundleId_);
    uint64_t v37 = v60;
    uint64_t v36 = v61;
    *uint64_t v60 = v30;
    *((_BYTE *)v37 + 8) = 0;
    uint64_t v38 = v62;
    (*(void (**)(void *, void, uint64_t))(v36 + 104))(v37, enum case for Command.aceCommand(_:), v62);
    id v39 = v30;
    uint64_t v40 = (uint64_t)v59;
    ActionHandler.wrappedValue.getter(v39);
    uint64_t v41 = v63;
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v40, 1LL, v63) == 1)
    {
      (*(void (**)(void *, uint64_t))(v36 + 8))(v37, v38);

      uint64_t v26 = v40;
      goto LABEL_10;
    }

    uint64_t v42 = sub_47B4(&qword_245C0);
    uint64_t v43 = swift_allocObject(v42, 72LL, 7LL);
    *(_OWORD *)(v43 + 16) = xmmword_1BC50;
    *(void *)(v43 + 56) = v38;
    *(void *)(v43 + 64) = &protocol witness table for Command;
    char v44 = sub_8BA8((void *)(v43 + 32));
    (*(void (**)(void *, void *, uint64_t))(v36 + 16))(v44, v37, v38);
    uint64_t v45 = (uint64_t)v54;
    ActionProperty.init(_:)(v43);
    uint64_t v46 = type metadata accessor for ActionProperty(0LL);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v45, 0LL, 1LL, v46);
    uint64_t v47 = enum case for InteractionType.componentTapped(_:);
    uint64_t v48 = type metadata accessor for InteractionType(0LL);
    uint64_t v49 = (uint64_t)v55;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 104LL))(v55, v47, v48);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v49, 0LL, 1LL, v48);
    StandardActionHandler.perform(_:interactionType:)(v45, v49);

    sub_8D84(v49, &qword_245A8);
    sub_8D84(v45, &qword_245B0);
    (*(void (**)(void *, uint64_t))(v36 + 8))(v37, v38);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8LL))(v40, v41);
    return;
  }

  SashStandard.action.getter();
  char v22 = StandardActionHandler.canPerform(_:)(v11);
  sub_8D84((uint64_t)v11, &qword_245B0);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8LL);
  uint64_t v24 = v23(v19, v20);
  if ((v22 & 1) == 0) {
    goto LABEL_6;
  }
  ActionHandler.wrappedValue.getter(v24);
  uint64_t v25 = v63;
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1LL, v63) == 1)
  {
    uint64_t v26 = (uint64_t)v17;
LABEL_10:
    sub_8D84(v26, &qword_245B8);
    return;
  }

  uint64_t v50 = (uint64_t)v54;
  SashStandard.action.getter();
  uint64_t v51 = enum case for InteractionType.componentTapped(_:);
  uint64_t v52 = type metadata accessor for InteractionType(0LL);
  uint64_t v53 = (uint64_t)v55;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104LL))(v55, v51, v52);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v53, 0LL, 1LL, v52);
  StandardActionHandler.perform(_:interactionType:)(v50, v53);
  sub_8D84(v53, &qword_245A8);
  sub_8D84(v50, &qword_245B0);
  v23(v17, v25);
}

void sub_66B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3(0LL);
  sub_8E48(v3);
  sub_8E2C();
}

uint64_t sub_66E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SashStandardView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_6728()
{
}

unint64_t sub_6748()
{
  unint64_t result = qword_243C8;
  if (!qword_243C8)
  {
    uint64_t v1 = sub_67CC(&qword_243C0);
    sub_6810();
    sub_8D50(&qword_24400, &qword_24408);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_243C8);
  }

  return result;
}

uint64_t sub_67CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_6810()
{
  unint64_t result = qword_243D0;
  if (!qword_243D0)
  {
    uint64_t v1 = sub_67CC(&qword_243D8);
    sub_6874();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_243D0);
  }

  return result;
}

unint64_t sub_6874()
{
  unint64_t result = qword_243E0;
  if (!qword_243E0)
  {
    uint64_t v1 = sub_67CC(&qword_243E8);
    sub_8D50(&qword_243F0, &qword_243F8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_243E0);
  }

  return result;
}

void *sub_68F8(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  swift_release(a1[19]);
  swift_release(v3);
  swift_release(v2);
  return a1;
}

uint64_t sub_693C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  *(void *)(v1 + 24) = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_69A8, v3, v4);
}

uint64_t sub_69A8()
{
  return sub_8E60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_69DC()
{
  uint64_t v1 = (int *)type metadata accessor for SashStandardView(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for SashStandard(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v0 + v4, v6);

  uint64_t v7 = v0 + v4 + v1[6];
  uint64_t v8 = type metadata accessor for SashStandardView.AppIcon(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v7, v8);
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for VisualProperty(0LL);
    uint64_t v10 = sub_8E88();
    v11(v10);
  }

  else if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease(*(void *)(v7 + 8));
  }

  uint64_t v12 = sub_47B4(&qword_243A8);
  swift_release(*(void *)(v7 + *(int *)(v12 + 28)));
  uint64_t v13 = v0 + v4 + v1[7];
  swift_bridgeObjectRelease(*(void *)(v13 + 8));
  swift_release(*(void *)(v13 + 16));
  uint64_t v14 = sub_8EBC();
  sub_8E18(v14);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_6AF0()
{
  uint64_t v3 = v0 + v2;
  uint64_t v4 = (void *)swift_task_alloc(dword_24414);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_6B48;
  return sub_693C(v3);
}

uint64_t sub_6B48()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return sub_8E60(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_6B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B4(&qword_243B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6BD0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of SashStandardView.body>>,  1LL);
}

void sub_6BE0()
{
  uint64_t v0 = sub_47B4(&qword_24580);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SashStandardView.AppIcon(0LL);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t *)((char *)&v23 - v7);
  uint64_t v9 = sub_47B4(&qword_245A0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for VisualProperty(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  SashStandard.thumbnail.getter(v14);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1LL, v12) == 1)
  {
    sub_8D84((uint64_t)v11, &qword_245A0);
    SashStandard.title.getter();
    uint64_t v17 = type metadata accessor for SashStandard.Title(0LL);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v2, 1LL, v17) == 1)
    {
      sub_8D84((uint64_t)v2, &qword_24580);
    }

    else
    {
      uint64_t v19 = SashStandard.Title.applicationBundleIdentifier.getter();
      uint64_t v21 = v20;
      (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8LL))(v2, v17);
      if (v21)
      {
        *uint64_t v8 = v19;
        v8[1] = v21;
        swift_storeEnumTagMultiPayload(v8, v3, 0LL);
        type metadata accessor for SashStandardView(0LL);
        sub_66B4((uint64_t)v8, (uint64_t)v6, type metadata accessor for SashStandardView.AppIcon);
        uint64_t v22 = sub_47B4(&qword_243A8);
        State.wrappedValue.setter(v6, v22);
        sub_8DF0((uint64_t)v8, type metadata accessor for SashStandardView.AppIcon);
      }
    }
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(v8, v16, v12);
    swift_storeEnumTagMultiPayload(v8, v3, 1LL);
    type metadata accessor for SashStandardView(0LL);
    sub_66B4((uint64_t)v8, (uint64_t)v6, type metadata accessor for SashStandardView.AppIcon);
    uint64_t v18 = sub_47B4(&qword_243A8);
    State.wrappedValue.setter(v6, v18);
    sub_8DF0((uint64_t)v8, type metadata accessor for SashStandardView.AppIcon);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }

void sub_6EB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_47B4(&qword_24580);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v55 - v7;
  SashStandard.title.getter(v6);
  uint64_t v9 = type metadata accessor for SashStandard.Title(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v8, 1LL, v9) == 1)
  {
    if (qword_24340 != -1) {
      swift_once(&qword_24340, sub_E514);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_89CC(v10, (uint64_t)qword_263C0);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_15;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "App title missing for sash.";
LABEL_14:
    _os_log_impl(&dword_0, v12, v13, v15, v14, 2u);
    swift_slowDealloc(v14, -1LL, -1LL);
LABEL_15:

    goto LABEL_16;
  }

  sub_8C10((uint64_t)v8, (uint64_t)v5, &qword_24580);
  uint64_t v16 = *(void *)(v9 - 8);
  int v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v16 + 88))(v5, v9);
  if (v17 == enum case for SashStandard.Title.applicationBundleIdentifier(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v16 + 96))(v5, v9);
    uint64_t v19 = *v5;
    uint64_t v18 = v5[1];
    id v20 = objc_allocWithZone(&OBJC_CLASS___LSApplicationRecord);
    swift_bridgeObjectRetain(v18);
    id v29 = sub_89E4(v19, v18, 1);
    swift_bridgeObjectRelease(v18);
    id v30 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
    uint64_t v31 = sub_8B3C(v30);
    if (v32)
    {
      uint64_t v33 = v31;
      uint64_t v34 = v32;
      uint64_t v35 = sub_47B4(&qword_24598);
      uint64_t v36 = swift_allocObject(v35, 48LL, 7LL);
      *(_OWORD *)(v36 + 16) = xmmword_1BC50;
      *(void *)(v36 + 32) = v33;
      *(void *)(v36 + 40) = v34;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v36);
      id v38 = [v29 localizedNameWithPreferredLocalizations:isa];

      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
      uint64_t v41 = v40;

      uint64_t v42 = (void *)(v1 + *(int *)(type metadata accessor for SashStandardView(0LL) + 28));
      uint64_t v43 = v42[1];
      uint64_t v44 = v42[2];
      *(void *)&__int128 v58 = *v42;
      *((void *)&v58 + 1) = v43;
      uint64_t v59 = v44;
      uint64_t v56 = v39;
      uint64_t v57 = v41;
      swift_retain(v44);
      swift_bridgeObjectRetain(v43);
      uint64_t v45 = sub_47B4(&qword_24588);
      State.wrappedValue.setter(&v56, v45);
      swift_release(v44);
      uint64_t v46 = v43;
    }

    else
    {
      id v47 = [v29 localizedName];
      uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
      uint64_t v50 = v49;

      uint64_t v51 = (void *)(v1 + *(int *)(type metadata accessor for SashStandardView(0LL) + 28));
      uint64_t v52 = v51[1];
      uint64_t v53 = v51[2];
      *(void *)&__int128 v58 = *v51;
      *((void *)&v58 + 1) = v52;
      uint64_t v59 = v53;
      uint64_t v56 = v48;
      uint64_t v57 = v50;
      swift_retain(v53);
      swift_bridgeObjectRetain(v52);
      uint64_t v54 = sub_47B4(&qword_24588);
      State.wrappedValue.setter(&v56, v54);
      swift_release(v53);
      uint64_t v46 = v52;
    }

    swift_bridgeObjectRelease(v46);
  }

  else
  {
    if (v17 != enum case for SashStandard.Title.text(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v16 + 8))(v5, v9);
      if (qword_24340 != -1) {
        swift_once(&qword_24340, sub_E514);
      }
      uint64_t v27 = type metadata accessor for Logger(0LL);
      uint64_t v28 = sub_89CC(v27, (uint64_t)qword_263C0);
      uint64_t v12 = (os_log_s *)Logger.logObject.getter(v28);
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v12, v13)) {
        goto LABEL_15;
      }
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      uint64_t v15 = "Unknown app title type.";
      goto LABEL_14;
    }

    (*(void (**)(uint64_t *, uint64_t))(v16 + 96))(v5, v9);
    uint64_t v21 = *v5;
    uint64_t v22 = v5[1];
    uint64_t v23 = (__int128 *)(v1 + *(int *)(type metadata accessor for SashStandardView(0LL) + 28));
    __int128 v24 = *v23;
    uint64_t v25 = *((void *)v23 + 2);
    __int128 v58 = v24;
    uint64_t v59 = v25;
    uint64_t v56 = v21;
    uint64_t v57 = v22;
    uint64_t v26 = sub_47B4(&qword_24588);
    State.wrappedValue.setter(&v56, v26);
  }

LABEL_16:
  sub_8D84((uint64_t)v8, &qword_24580);
}

uint64_t sub_7550()
{
  uint64_t v1 = type metadata accessor for Color(0LL);
  uint64_t v45 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v44 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for ColorElement(0LL);
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  __chkstk_darwin(v3);
  uint64_t v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_47B4(&qword_245A0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_47B4(&qword_245C8);
  __chkstk_darwin(v11);
  os_log_type_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for VisualElement(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v46 = (char *)&v39 - v20;
  SashStandard.titleColor.getter(v19);
  uint64_t v21 = type metadata accessor for VisualProperty(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1LL, v21) == 1)
  {
    sub_8D84((uint64_t)v10, &qword_245A0);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 1LL, 1LL, v14);
    goto LABEL_5;
  }

  uint64_t v40 = v1;
  uint64_t v22 = VisualProperty.allVisualElements.getter();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8LL))(v10, v21);
  uint64_t v23 = v0 + *(int *)(type metadata accessor for SashStandardView(0LL) + 20);
  if (*(void *)v23)
  {
    id v24 = *(id *)v23;
    uint64_t v25 = dispatch thunk of Context.currentIdiom.getter();

    VRXIdiom.idiom.getter(v25);
    Array<A>.element(for:)(v7, v22, v14, &protocol witness table for VisualElement);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v13, 1LL, v14) != 1)
    {
      uint64_t v28 = v46;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v46, v13, v14);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v28, v14);
      if ((*(unsigned int (**)(char *, uint64_t))(v15 + 88))(v18, v14) == enum case for VisualElement.color(_:))
      {
        (*(void (**)(char *, uint64_t))(v15 + 96))(v18, v14);
        id v30 = v41;
        uint64_t v29 = v42;
        uint64_t v31 = v43;
        uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v42 + 32))(v41, v18, v43);
        uint64_t v33 = v44;
        uint64_t v34 = ColorElement.color.getter(v32);
        uint64_t v26 = Color.swiftValue.getter(v34);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v40);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
        (*(void (**)(char *, uint64_t))(v15 + 8))(v28, v14);
        return v26;
      }

      uint64_t v35 = *(void (**)(char *, uint64_t))(v15 + 8);
      v35(v28, v14);
      v35(v18, v14);
      return static Color.secondary.getter();
    }

uint64_t sub_7968()
{
  return static View._viewListCount(inputs:)();
}

uint64_t *initializeBufferWithCopyOfBuffer for SashStandardView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = type metadata accessor for SashStandard(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    os_log_type_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (uint64_t *)((char *)a1 + v9);
    uint64_t v15 = (uint64_t *)((char *)a2 + v9);
    uint64_t v16 = type metadata accessor for SashStandardView.AppIcon(0LL);
    id v17 = v13;
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v15, v16);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v24 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v14, v15, v24);
      uint64_t v20 = v14;
      uint64_t v21 = v16;
      uint64_t v22 = 1LL;
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64LL));
        goto LABEL_9;
      }

      uint64_t v19 = v15[1];
      void *v14 = *v15;
      v14[1] = v19;
      swift_bridgeObjectRetain(v19);
      uint64_t v20 = v14;
      uint64_t v21 = v16;
      uint64_t v22 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v20, v21, v22);
LABEL_9:
    uint64_t v25 = *(int *)(sub_47B4(&qword_243A8) + 28);
    uint64_t v26 = *(void *)((char *)v15 + v25);
    *(void *)((char *)v14 + v25) = v26;
    uint64_t v27 = a3[7];
    uint64_t v28 = a3[8];
    uint64_t v29 = (uint64_t *)((char *)a1 + v27);
    id v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = v30[2];
    v29[2] = v32;
    uint64_t v33 = (char *)a1 + v28;
    uint64_t v34 = (char *)a2 + v28;
    uint64_t v35 = type metadata accessor for ActionHandler(0LL);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16LL);
    swift_retain(v26);
    swift_bridgeObjectRetain(v31);
    swift_retain(v32);
    v36(v33, v34, v35);
    return a1;
  }

  uint64_t v23 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
  swift_retain(v23);
  return a1;
}

uint64_t destroy for SashStandardView(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SashStandard(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);

  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = type metadata accessor for SashStandardView.AppIcon(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v5, v6);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v5, v8);
  }

  else if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease(*(void *)(v5 + 8));
  }

  uint64_t v9 = sub_47B4(&qword_243A8);
  swift_release(*(void *)(v5 + *(int *)(v9 + 28)));
  uint64_t v10 = a1 + a2[7];
  swift_bridgeObjectRelease(*(void *)(v10 + 8));
  swift_release(*(void *)(v10 + 16));
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(v11, v12);
}

uint64_t initializeWithCopy for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SashStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  os_log_type_t v13 = (void *)(a1 + v8);
  uint64_t v14 = (void *)(a2 + v8);
  uint64_t v15 = type metadata accessor for SashStandardView.AppIcon(0LL);
  id v16 = v12;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v14, v15);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v22 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16LL))(v13, v14, v22);
    uint64_t v19 = v13;
    uint64_t v20 = v15;
    uint64_t v21 = 1LL;
  }

  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
      goto LABEL_7;
    }

    uint64_t v18 = v14[1];
    *os_log_type_t v13 = *v14;
    v13[1] = v18;
    swift_bridgeObjectRetain(v18);
    uint64_t v19 = v13;
    uint64_t v20 = v15;
    uint64_t v21 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v19, v20, v21);
LABEL_7:
  uint64_t v23 = *(int *)(sub_47B4(&qword_243A8) + 28);
  uint64_t v24 = *(void *)((char *)v14 + v23);
  *(void *)((char *)v13 + v23) = v24;
  uint64_t v25 = a3[7];
  uint64_t v26 = a3[8];
  uint64_t v27 = (void *)(a1 + v25);
  uint64_t v28 = (void *)(a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = v28[2];
  v27[2] = v30;
  uint64_t v31 = a1 + v26;
  uint64_t v32 = a2 + v26;
  uint64_t v33 = type metadata accessor for ActionHandler(0LL);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16LL);
  swift_retain(v24);
  swift_bridgeObjectRetain(v29);
  swift_retain(v30);
  v34(v31, v32, v33);
  return a1;
}

uint64_t assignWithCopy for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SashStandard(0LL);
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
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  if (a1 != a2)
  {
    sub_8DF0(a1 + v13, type metadata accessor for SashStandardView.AppIcon);
    uint64_t v16 = type metadata accessor for SashStandardView.AppIcon(0LL);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v15, v16);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v22 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16LL))(v14, v15, v22);
      uint64_t v19 = v14;
      uint64_t v20 = v16;
      uint64_t v21 = 1LL;
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64LL));
        goto LABEL_8;
      }

      void *v14 = *v15;
      uint64_t v18 = v15[1];
      v14[1] = v18;
      swift_bridgeObjectRetain(v18);
      uint64_t v19 = v14;
      uint64_t v20 = v16;
      uint64_t v21 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v19, v20, v21);
  }

LABEL_8:
  uint64_t v23 = *(int *)(sub_47B4(&qword_243A8) + 28);
  uint64_t v24 = *(void *)((char *)v14 + v23);
  uint64_t v25 = *(void *)((char *)v15 + v23);
  *(void *)((char *)v14 + v23) = v25;
  swift_retain(v25);
  swift_release(v24);
  uint64_t v26 = a3[7];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = a2 + v26;
  *uint64_t v27 = *(void *)(a2 + v26);
  uint64_t v29 = *(void *)(a2 + v26 + 8);
  uint64_t v30 = *(void *)(a1 + v26 + 8);
  v27[1] = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  uint64_t v31 = v27[2];
  uint64_t v32 = *(void *)(v28 + 16);
  v27[2] = v32;
  swift_retain(v32);
  swift_release(v31);
  uint64_t v33 = a3[8];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 24LL))(v34, v35, v36);
  return a1;
}

  uint64_t v13 = a3[5];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void **)&a1[v13];
  *(void *)uint64_t v14 = *(void *)v15;

  *((void *)v14 + 1) = *((void *)v15 + 1);
  if (a1 != a2)
  {
    id v17 = a3[6];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    sub_8D84((uint64_t)&a1[v17], &qword_24360);
    uint64_t v20 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
    {
      uint64_t v21 = type metadata accessor for ImageElement.ImageStyle(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1LL, v21))
      {
        uint64_t v22 = sub_47B4(&qword_24838);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32LL))(v18, v19, v21);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v18, 0LL, 1LL, v21);
      }

      swift_storeEnumTagMultiPayload(v18, v20, 1LL);
    }

    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64LL));
    }
  }

  uint64_t v23 = a3[7];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = *(void *)v25;
  LOBYTE(v25) = v25[8];
  uint64_t v27 = *(void *)v24;
  uint64_t v28 = v24[8];
  *(void *)uint64_t v24 = v26;
  v24[8] = (char)v25;
  sub_BDD8(v27, v28);
  uint64_t v29 = a3[8];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  uint64_t v32 = *(void *)&a1[v29];
  *(void *)&a1[v29] = *(void *)v31;
  swift_release(v32);
  uint64_t v33 = *((void *)v30 + 1);
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_release(v33);
  return a1;
}

uint64_t initializeWithTake for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SashStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SashStandardView.AppIcon(0LL);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    uint64_t v11 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v8, v9, v11);
    swift_storeEnumTagMultiPayload(v8, v10, 1LL);
  }

  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  uint64_t v12 = sub_47B4(&qword_243A8);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  uint64_t v17 = a1 + v14;
  uint64_t v18 = a2 + v14;
  uint64_t v19 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32LL))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SashStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  if (a1 != a2)
  {
    sub_8DF0(a1 + v11, type metadata accessor for SashStandardView.AppIcon);
    uint64_t v14 = type metadata accessor for SashStandardView.AppIcon(0LL);
    if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
    {
      uint64_t v15 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32LL))(v12, v13, v15);
      swift_storeEnumTagMultiPayload(v12, v14, 1LL);
    }

    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
    }
  }

  uint64_t v16 = *(int *)(sub_47B4(&qword_243A8) + 28);
  uint64_t v17 = *(void *)&v12[v16];
  *(void *)&v12[v16] = *(void *)&v13[v16];
  swift_release(v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)(a2 + v18 + 8);
  uint64_t v22 = *(void *)(a1 + v18 + 8);
  *uint64_t v19 = *(void *)(a2 + v18);
  v19[1] = v21;
  swift_bridgeObjectRelease(v22);
  uint64_t v23 = v19[2];
  v19[2] = *(void *)(v20 + 16);
  swift_release(v23);
  uint64_t v24 = a3[8];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 40LL))(v25, v26, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for SashStandardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8228);
}

uint64_t sub_8228(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_8E78();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, v3, v7);
  }

  uint64_t v9 = sub_47B4(&qword_243A8);
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)v3)
  {
    uint64_t v7 = v9;
    uint64_t v10 = a3[6];
LABEL_10:
    uint64_t v8 = v4 + v10;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, v3, v7);
  }

  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    uint64_t v7 = sub_8EBC();
    uint64_t v10 = a3[8];
    goto LABEL_10;
  }

  unint64_t v11 = *(void *)(v4 + a3[7] + 8);
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  return (v11 + 1);
}

uint64_t _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t storeEnumTagSinglePayload for SashStandardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_82F8);
}

uint64_t sub_82F8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_8E78();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v5;
  }

  else
  {
    uint64_t result = sub_47B4(&qword_243A8);
    if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3)
    {
      uint64_t v9 = result;
      uint64_t v12 = a4[6];
    }

    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(v5 + a4[7] + 8) = (v4 - 1);
        return result;
      }

      uint64_t v9 = sub_8EBC();
      uint64_t v12 = a4[8];
    }

    uint64_t v10 = v5 + v12;
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v10, v4, v4, v9);
}

void sub_83AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SashStandard(319LL);
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    v8[1] = &unk_1BCF8;
    sub_845C(319LL);
    if (v5 <= 0x3F)
    {
      v8[2] = *(void *)(v4 - 8) + 64LL;
      v8[3] = &unk_1BD10;
      uint64_t v6 = type metadata accessor for ActionHandler(319LL);
      if (v7 <= 0x3F)
      {
        v8[4] = *(void *)(v6 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 5LL, v8, a1 + 16);
      }
    }
  }

void sub_845C(uint64_t a1)
{
  if (!qword_24488)
  {
    uint64_t v2 = type metadata accessor for SashStandardView.AppIcon(255LL);
    unint64_t v3 = type metadata accessor for State(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_24488);
    }
  }

unint64_t sub_84B4()
{
  unint64_t result = qword_244C8;
  if (!qword_244C8)
  {
    uint64_t v1 = sub_67CC(&qword_243B8);
    v2[0] = sub_67CC(&qword_243C0);
    v2[1] = sub_6748();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.onTapGestureWhereSupported(perform:)>>,  1LL);
    sub_8DBC(&qword_244D0, (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_244C8);
  }

  return result;
}

uint64_t *sub_8560(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v13);
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16LL))(a1, a2, v14);
      uint64_t v10 = a1;
      uint64_t v11 = a3;
      uint64_t v12 = 1LL;
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v5 + 64));
        return a1;
      }

      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      swift_bridgeObjectRetain();
      uint64_t v10 = a1;
      uint64_t v11 = a3;
      uint64_t v12 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v10, v11, v12);
  }

  return a1;
}

uint64_t sub_8634(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 1)
  {
    uint64_t v4 = type metadata accessor for VisualProperty(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  }

  else if (!(_DWORD)result)
  {
    return swift_bridgeObjectRelease(*(void *)(a1 + 8));
  }

  return result;
}

void *sub_8694(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 1LL;
  }

  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      return a1;
    }

    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  return a1;
}

void *sub_8740(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for SashStandardView.AppIcon);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        return a1;
      }

      *a1 = *a2;
      uint64_t v7 = a2[1];
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

void *sub_880C(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

void *sub_8898(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for SashStandardView.AppIcon);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v6 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_894C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_895C(uint64_t a1)
{
  v4[0] = &unk_1BD30;
  uint64_t result = type metadata accessor for VisualProperty(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t sub_89CC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_89E4(uint64_t a1, uint64_t a2, char a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v12 = 0LL;
  id v7 = [v3 initWithBundleIdentifier:v6 allowPlaceholder:a3 & 1 error:&v12];

  id v8 = v12;
  if (v7)
  {
    id v9 = v12;
  }

  else
  {
    id v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }

  return v7;
}

uint64_t sub_8ABC(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

void sub_8AE4(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

uint64_t sub_8B3C(void *a1)
{
  id v2 = [a1 languageCode];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void *sub_8BA8(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_8BE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

void sub_8C10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_47B4(a3);
  sub_8E48(v3);
  sub_8E2C();
}

unint64_t sub_8C3C()
{
  unint64_t result = qword_245F8;
  if (!qword_245F8)
  {
    uint64_t v1 = sub_67CC(&qword_245F0);
    sub_8CC0();
    sub_8D50(&qword_24618, &qword_24620);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_245F8);
  }

  return result;
}

unint64_t sub_8CC0()
{
  unint64_t result = qword_24600;
  if (!qword_24600)
  {
    uint64_t v1 = sub_67CC(&qword_245E8);
    swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of TextElement.asView()>>, 1LL);
    sub_8D50(&qword_24608, &qword_24610);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24600);
  }

  return result;
}

void sub_8D50(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_67CC(a2);
    atomic_store(sub_8E9C(v3), a1);
  }

  sub_8E2C();
}

void sub_8D84(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_47B4(a2);
  sub_8E18(v2);
  sub_8E2C();
}

void sub_8DBC(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_8E9C(v3), a1);
  }

  sub_8E2C();
}

void sub_8DF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = a2(0LL);
  sub_8E18(v2);
  sub_8E2C();
}

uint64_t sub_8E18(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

  ;
}

  ;
}

uint64_t sub_8E48(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(v1, v2, a1);
}

uint64_t sub_8E60(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_8E78()
{
  return type metadata accessor for SashStandard(0LL);
}

uint64_t sub_8E88()
{
  return v0;
}

uint64_t sub_8E9C(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

  ;
}

uint64_t sub_8EBC()
{
  return type metadata accessor for ActionHandler(0LL);
}

uint64_t sub_8EC4(uint64_t a1)
{
  return swift_allocObject(a1, v1, v2);
}

uint64_t sub_8ED0(uint64_t a1)
{
  return sub_66E4(v2, a1 + v1);
}

void sub_8EDC()
{
}

Swift::Int sub_8F00()
{
  return Hasher._finalize()();
}

uint64_t sub_8F40()
{
  return 1LL;
}

Swift::Int sub_8F50(uint64_t a1)
{
  return Hasher._finalize()();
}

void sub_8F9C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v164 = a3;
  unint64_t v165 = a4;
  type metadata accessor for String.Encoding(0LL);
  sub_A76C();
  __chkstk_darwin(v7);
  sub_8E34();
  uint64_t v9 = sub_A78C(v8);
  type metadata accessor for BinaryDecodingOptions(v9);
  sub_A76C();
  __chkstk_darwin(v10);
  sub_8E34();
  uint64_t v12 = sub_A78C(v11);
  uint64_t v147 = type metadata accessor for _ProtoImageElement.Contact(v12);
  sub_A76C();
  __chkstk_darwin(v13);
  sub_8E34();
  uint64_t v15 = sub_A78C(v14);
  uint64_t v146 = type metadata accessor for ImageElement.Contact(v15);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  sub_8E34();
  uint64_t v17 = sub_A78C(v16);
  uint64_t v145 = type metadata accessor for ContactImageSourceView(v17);
  sub_A76C();
  __chkstk_darwin(v18);
  sub_8E34();
  uint64_t v20 = sub_A78C(v19);
  uint64_t v150 = type metadata accessor for AppIconView(v20);
  sub_A76C();
  __chkstk_darwin(v21);
  sub_8E34();
  uint64_t v23 = sub_A78C(v22);
  uint64_t v152 = type metadata accessor for SashStandardView(v23);
  sub_A76C();
  __chkstk_darwin(v24);
  sub_8E34();
  uint64_t v26 = sub_A78C(v25);
  uint64_t v156 = type metadata accessor for MapOverlayModel(v26);
  uint64_t v154 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  sub_8E34();
  uint64_t v158 = v27;
  uint64_t v157 = type metadata accessor for MapsOverlayView(0LL);
  sub_A76C();
  __chkstk_darwin(v28);
  sub_8E34();
  v155 = v29;
  uint64_t v162 = type metadata accessor for IntentsUIStandard(0LL);
  uint64_t v159 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  sub_8E34();
  uint64_t v160 = v30;
  uint64_t v161 = type metadata accessor for IntentsUIStandardView(0LL);
  sub_A76C();
  __chkstk_darwin(v31);
  sub_A7B4();
  uint64_t v34 = (__int128 *)(v33 - v32);
  uint64_t v35 = type metadata accessor for CoreChartPluginView(0LL);
  sub_A76C();
  __chkstk_darwin(v36);
  sub_A7B4();
  uint64_t v39 = (__int128 *)(v38 - v37);
  uint64_t v40 = type metadata accessor for TVContactMonogramView(0LL);
  sub_A76C();
  __chkstk_darwin(v41);
  sub_A7B4();
  uint64_t v44 = v43 - v42;
  type metadata accessor for ContactImage(0LL);
  sub_A76C();
  uint64_t v46 = __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v138 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v46);
  uint64_t v50 = (uint64_t *)((char *)&v138 - v49);
  uint64_t v139 = a1;
  unint64_t v140 = a2;
  Swift::String v51 = String.lowercased()();
  BOOL v52 = v51._countAndFlagsBits == 0x6D69656C63726963LL && v51._object == (void *)0xEB00000000656761LL;
  if (!v52 && (sub_A75C(0x6D69656C63726963LL, 0xEB00000000656761LL) & 1) == 0)
  {
    BOOL v60 = v51._countAndFlagsBits == 0x6D6172676F6E6F6DLL && v51._object == (void *)0xED00006567616D69LL;
    if (v60 || (sub_A75C(0x6D6172676F6E6F6DLL, 0xED00006567616D69LL) & 1) != 0)
    {
      sub_A79C();
      uint64_t v62 = v164;
      unint64_t v61 = v165;
      sub_9DA4(v164, v165);
      uint64_t v63 = v163;
      ContactImage.init(_:)(v62, v61);
      if (v63) {
        return;
      }
      TVContactMonogramView.init(model:)((uint64_t)v48, v44);
      unint64_t v57 = sub_9EB0( &qword_24730,  type metadata accessor for TVContactMonogramView,  (uint64_t)&protocol conformance descriptor for TVContactMonogramView);
      uint64_t v59 = (__int128 *)v44;
      goto LABEL_23;
    }

    BOOL v64 = v51._countAndFlagsBits == 0x7261686365726F63LL && v51._object == (void *)0xE900000000000074LL;
    if (v64 || (sub_A75C(0x7261686365726F63LL, 0xE900000000000074LL) & 1) != 0)
    {
      sub_A79C();
      uint64_t v66 = v164;
      unint64_t v65 = v165;
      sub_9DA4(v164, v165);
      CoreChart.init(data:)(v66, v65);
      unint64_t v57 = sub_9EB0( &qword_24728,  type metadata accessor for CoreChartPluginView,  (uint64_t)&protocol conformance descriptor for CoreChartPluginView);
      uint64_t v59 = v39;
      __int128 v58 = (ValueMetadata *)v35;
      goto LABEL_22;
    }

    uint64_t v67 = 0xD000000000000010LL;
    if (v51._countAndFlagsBits == 0xD000000000000011LL)
    {
      object = (void *)0x800000000001F1D0LL;
      if (v51._object == (void *)0x800000000001F1D0LL)
      {
LABEL_28:
        swift_bridgeObjectRelease(object);
        uint64_t v69 = v161;
        v70 = (char *)v34 + *(int *)(v161 + 20);
        uint64_t v72 = v164;
        unint64_t v71 = v165;
        sub_9DA4(v164, v165);
        type metadata accessor for Context(0LL);
        uint64_t v73 = sub_9EB0( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
        *(void *)v70 = sub_A7C4(v73);
        *((void *)v70 + 1) = v74;
        uint64_t v75 = (void *)((char *)v34 + *(int *)(v69 + 24));
        *uint64_t v75 = swift_getKeyPath(&unk_1BE30);
        uint64_t v76 = sub_47B4(&qword_24368);
        swift_storeEnumTagMultiPayload(v75, v76, 0LL);
        uint64_t v77 = (char *)v34 + *(int *)(v69 + 28);
        _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA6LL9SnippetUI06ActionG0Vvpfi_0();
        uint64_t v78 = sub_9EB0( &qword_24710,  (uint64_t (*)(uint64_t))&type metadata accessor for IntentsUIStandard,  (uint64_t)&protocol conformance descriptor for IntentsUIStandard);
        uint64_t v79 = v160;
        unint64_t v80 = v71;
        uint64_t v81 = v162;
        uint64_t v82 = v163;
        ProtobufBuilder.init(serializedData:)(v72, v80, v162, v78);
        if (!v82)
        {
          (*(void (**)(__int128 *, uint64_t, uint64_t))(v159 + 32))(v34, v79, v81);
          unint64_t v57 = sub_9EB0( &qword_24720,  type metadata accessor for IntentsUIStandardView,  (uint64_t)&protocol conformance descriptor for IntentsUIStandardView);
          uint64_t v59 = v34;
          __int128 v58 = (ValueMetadata *)v69;
          goto LABEL_22;
        }

        sub_9E70((uint64_t)v75);
        uint64_t v83 = type metadata accessor for ActionHandler(0LL);
        (*(void (**)(char *, uint64_t))(*(void *)(v83 - 8) + 8LL))(v77, v83);
        return;
      }
    }

    if ((sub_A75C(0xD000000000000011LL, 0x800000000001F1D0LL) & 1) != 0)
    {
      object = v51._object;
      goto LABEL_28;
    }

    BOOL v84 = v51._countAndFlagsBits == 0x6C7265766F70616DLL && v51._object == (void *)0xEA00000000007961LL;
    if (v84 || (sub_A75C(0x6C7265766F70616DLL, 0xEA00000000007961LL) & 1) != 0)
    {
      sub_A79C();
      uint64_t v86 = v164;
      unint64_t v85 = v165;
      sub_9DA4(v164, v165);
      uint64_t v87 = v158;
      uint64_t v88 = v163;
      MapOverlayModel.init(_:)(v86, v85);
      if (v88) {
        return;
      }
      uint64_t v40 = v157;
      v89 = v155;
      v90 = (uint64_t *)((char *)v155 + *(int *)(v157 + 24));
      type metadata accessor for Context(0LL);
      uint64_t v91 = sub_9EB0( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
      uint64_t *v90 = sub_A7C4(v91);
      v90[1] = v92;
      uint64_t v93 = v154;
      uint64_t v94 = v156;
      uint64_t v95 = (*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v154 + 16))(v89, v87, v156);
      double v96 = MapOverlayModel.latitude.getter(v95);
      double v97 = MapOverlayModel.longitude.getter();
      double v98 = COERCE_DOUBLE(MapOverlayModel.latitudeSpan.getter());
      if ((v99 & 1) != 0) {
        double v100 = 0.01;
      }
      else {
        double v100 = v98;
      }
      *(double *)&uint64_t v101 = COERCE_DOUBLE(MapOverlayModel.longitudeSpan.getter());
      char v103 = v102;
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v87, v94);
      double v104 = *(double *)&v101;
      if ((v103 & 1) != 0) {
        double v104 = 0.01;
      }
      v105 = (double *)((char *)v89 + *(int *)(v40 + 20));
      double *v105 = v96;
      v105[1] = v97;
      v105[2] = v100;
      v105[3] = v104;
      v105[4] = 0.0;
      unint64_t v57 = sub_9EB0( &qword_24708,  type metadata accessor for MapsOverlayView,  (uint64_t)&protocol conformance descriptor for MapsOverlayView);
      uint64_t v59 = v89;
LABEL_23:
      __int128 v58 = (ValueMetadata *)v40;
      goto LABEL_22;
    }

    if (v51._countAndFlagsBits != 0xD000000000000010LL
      || (v106 = (void *)0x800000000001F1F0LL, v51._object != (void *)0x800000000001F1F0LL))
    {
      if ((sub_A75C(0xD000000000000010LL, 0x800000000001F1F0LL) & 1) == 0)
      {
        BOOL v112 = v51._countAndFlagsBits == 0x766E6F6369707061LL && v51._object == (void *)0xEB00000000776569LL;
        if (v112 || (sub_A75C(0x766E6F6369707061LL, 0xEB00000000776569LL) & 1) != 0)
        {
          sub_A79C();
          v113 = v151;
          sub_A77C();
          uint64_t v114 = sub_A7A4();
          AppIconView.init(modelData:)(v114, v115, v116);
          if (v4) {
            return;
          }
          unint64_t v57 = sub_9EB0( &qword_24640,  type metadata accessor for AppIconView,  (uint64_t)&protocol conformance descriptor for AppIconView);
          uint64_t v59 = v113;
          v111 = &v171;
        }

        else
        {
          if (v51._countAndFlagsBits == 0xD000000000000016LL && v51._object == (void *)0x800000000001F210LL)
          {
            v117 = (void *)0x800000000001F210LL;
          }

          else
          {
            if ((sub_A75C(0xD000000000000016LL, 0x800000000001F210LL) & 1) == 0)
            {
              if (v51._countAndFlagsBits == 0x6C6F686563616C70LL && v51._object == (void *)0xEB00000000726564LL)
              {
                sub_A79C();
              }

              else
              {
                uint64_t v67 = sub_A75C(0x6C6F686563616C70LL, 0xEB00000000726564LL);
                sub_A79C();
                if ((v67 & 1) == 0)
                {
                  if (qword_24340 != -1) {
                    swift_once(&qword_24340, sub_E514);
                  }
                  uint64_t v124 = type metadata accessor for Logger(0LL);
                  sub_89CC(v124, (uint64_t)qword_263C0);
                  uint64_t v125 = swift_bridgeObjectRetain_n(v140, 2LL);
                  v126 = (os_log_s *)Logger.logObject.getter(v125);
                  os_log_type_t v127 = static os_log_type_t.error.getter();
                  if (os_log_type_enabled(v126, v127))
                  {
                    v128 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                    uint64_t v129 = swift_slowAlloc(32LL, -1LL);
                    *(void *)&__int128 v166 = v129;
                    *(_DWORD *)v128 = 136446210;
                    unint64_t v130 = v140;
                    swift_bridgeObjectRetain(v140);
                    uint64_t v169 = sub_9CD4(v139, v130, (uint64_t *)&v166);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v128 + 4, v128 + 12);
                    swift_bridgeObjectRelease_n(v130, 3LL);
                    _os_log_impl(&dword_0, v126, v127, "Unhandled view ID: %{public}s", v128, 0xCu);
                    swift_arrayDestroy(v129, 1LL);
                    sub_A7D0(v129);
                    sub_A7D0((uint64_t)v128);
                  }

                  else
                  {

                    swift_bridgeObjectRelease_n(v140, 2LL);
                  }

                  unint64_t v137 = sub_9C98();
                  swift_allocError(&type metadata for SystemPlugin.Error, v137, 0LL, 0LL);
                  swift_willThrow();
                  return;
                }
              }

              uint64_t v131 = sub_A77C();
              uint64_t v132 = v141;
              static String.Encoding.utf8.getter(v131);
              uint64_t v133 = String.init(data:encoding:)(v44, v67, v132);
              if (v134)
              {
                uint64_t v135 = v133;
                unint64_t v136 = v134;
                sub_9DE8(v164, v165);
              }

              else
              {
                sub_9DE8(v164, v165);
                uint64_t v135 = 0LL;
                unint64_t v136 = 0xE000000000000000LL;
              }

              *(void *)&__int128 v166 = v135;
              *((void *)&v166 + 1) = v136;
              unint64_t v57 = sub_9E2C();
              __int128 v58 = &type metadata for PlaceholderView;
              uint64_t v59 = &v166;
              goto LABEL_22;
            }

            v117 = v51._object;
          }

          swift_bridgeObjectRelease(v117);
          uint64_t v168 = 0LL;
          __int128 v166 = 0u;
          __int128 v167 = 0u;
          uint64_t v118 = sub_A77C();
          uint64_t v119 = v148;
          BinaryDecodingOptions.init()(v118);
          sub_9EB0( &qword_246F0,  (uint64_t (*)(uint64_t))&type metadata accessor for _ProtoImageElement.Contact,  (uint64_t)&protocol conformance descriptor for _ProtoImageElement.Contact);
          uint64_t v120 = v163;
          Message.init(serializedData:extensions:partial:options:)(v44, 0xD000000000000010LL, &v166, 0LL, v119);
          if (v120) {
            return;
          }
          uint64_t v121 = v143;
          ImageElement.Contact.init(proto:)(v149);
          v122 = v142;
          (*(void (**)(__int128 *, uint64_t, uint64_t))(v144 + 32))(v142, v121, v146);
          unint64_t v57 = sub_9EB0(&qword_246F8, type metadata accessor for ContactImageSourceView, (uint64_t)"QT");
          uint64_t v59 = v122;
          v111 = &v169;
        }

LABEL_63:
        __int128 v58 = (ValueMetadata *)*(v111 - 32);
        goto LABEL_22;
      }

      v106 = v51._object;
    }

    swift_bridgeObjectRelease(v106);
    sub_A77C();
    v107 = v153;
    uint64_t v108 = sub_A7A4();
    SashStandardView.init(modelData:)(v108, v109, v110);
    if (v4) {
      return;
    }
    unint64_t v57 = sub_9EB0( &qword_24700,  type metadata accessor for SashStandardView,  (uint64_t)&protocol conformance descriptor for SashStandardView);
    uint64_t v59 = v107;
    v111 = &v172;
    goto LABEL_63;
  }

  sub_A79C();
  sub_A77C();
  uint64_t v53 = sub_A7A4();
  ContactImage.init(_:)(v53, v54);
  if (!v4)
  {
    *(void *)&__int128 v166 = CircleImageView.init(model:)(v50);
    *((void *)&v166 + 1) = v55;
    *(void *)&__int128 v167 = v56;
    unint64_t v57 = sub_9EF0();
    __int128 v58 = &type metadata for CircleImageView;
    uint64_t v59 = &v166;
LABEL_22:
    AnyView.init<A>(_:)(v59, v58, v57);
  }

uint64_t sub_9C20()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SystemPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC12SystemPlugin12SystemPlugin);
}

uint64_t sub_9C50()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_9C60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9C50();
  *a1 = result;
  return result;
}

void sub_9C84(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
}

unint64_t sub_9C98()
{
  unint64_t result = qword_246E0;
  if (!qword_246E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BED0, &type metadata for SystemPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_246E0);
  }

  return result;
}

uint64_t sub_9CD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  NSString v6 = sub_9F2C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_A0A0((uint64_t)v12, *a3);
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
      sub_A0A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_A080(v12);
  return v7;
}

uint64_t sub_9DA4(uint64_t result, unint64_t a2)
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

uint64_t sub_9DE8(uint64_t result, unint64_t a2)
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

unint64_t sub_9E2C()
{
  unint64_t result = qword_246E8;
  if (!qword_246E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C9C8, &type metadata for PlaceholderView);
    atomic_store(result, (unint64_t *)&qword_246E8);
  }

  return result;
}

uint64_t sub_9E70(uint64_t a1)
{
  uint64_t v2 = sub_47B4(&qword_24718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_9EB0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_9EF0()
{
  unint64_t result = qword_24738;
  if (!qword_24738)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for CircleImageView,  &type metadata for CircleImageView);
    atomic_store(result, (unint64_t *)&qword_24738);
  }

  return result;
}

void *sub_9F2C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_A0DC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      unint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    unint64_t result = sub_A1A0(a5, a6);
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
      unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
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

uint64_t sub_A080(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_A0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_A0DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_A1A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_A234(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A408(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A408((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  void v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_A234(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_A3A4(v4, 0LL);
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
    unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_A3A4(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_47B4(&qword_24740);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_A408(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_47B4(&qword_24740);
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
    sub_A5A0(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_A4DC(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_A4DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_A5A0(char *__src, size_t __len, char *__dst)
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

uint64_t getEnumTagSinglePayload for SystemPlugin.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SystemPlugin.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_A6B8 + 4 * byte_1BDE8[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_A6D8 + 4 * byte_1BDED[v4]))();
  }
}

_BYTE *sub_A6B8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_A6D8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_A6E0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_A6E8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_A6F0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_A6F8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_A704()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SystemPlugin.Error()
{
  return &type metadata for SystemPlugin.Error;
}

unint64_t sub_A720()
{
  unint64_t result = qword_24748;
  if (!qword_24748)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BEA8, &type metadata for SystemPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_24748);
  }

  return result;
}

uint64_t sub_A75C(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v2, v3, 0LL);
}

  ;
}

uint64_t sub_A77C()
{
  return sub_9DA4(*(void *)(v0 - 176), *(void *)(v0 - 168));
}

uint64_t sub_A78C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0LL;
}

uint64_t sub_A79C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_A7A4()
{
  return v0;
}

  ;
}

uint64_t sub_A7C4(uint64_t a1)
{
  return EnvironmentObject.init()(v1, a1);
}

uint64_t sub_A7D0(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

void sub_A7DC()
{
  uint64_t v0 = sub_B774();
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  sub_B84C();
  sub_8E2C();
}

void sub_A80C(uint64_t a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v73 = type metadata accessor for TaskPriority(0LL);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  sub_8E34();
  uint64_t v70 = v2;
  uint64_t v3 = sub_D0AC();
  uint64_t v66 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v67 = v4;
  uint64_t v68 = (uint64_t)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = sub_47B4(&qword_24918);
  sub_A76C();
  __chkstk_darwin(v5);
  sub_A7B4();
  uint64_t v8 = v7 - v6;
  uint64_t v62 = type metadata accessor for RoundedRectangle(0LL);
  sub_A76C();
  __chkstk_darwin(v9);
  sub_A7B4();
  size_t v12 = (double *)(v11 - v10);
  uint64_t v13 = type metadata accessor for Image.ResizingMode(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_A7B4();
  uint64_t v17 = v16 - v15;
  uint64_t v61 = sub_47B4(&qword_24920);
  sub_A76C();
  __chkstk_darwin(v18);
  sub_A7B4();
  uint64_t v21 = v20 - v19;
  uint64_t v63 = sub_47B4(&qword_24928);
  sub_A76C();
  __chkstk_darwin(v22);
  sub_8E34();
  uint64_t v65 = v23;
  uint64_t v60 = static HorizontalAlignment.center.getter();
  uint64_t v24 = *(int *)(v3 + 24);
  uint64_t v69 = v1;
  uint64_t v25 = (uint64_t *)(v1 + v24);
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = *((unsigned __int8 *)v25 + 16);
  uint64_t v29 = sub_B774();
  sub_8DBC(&qword_24930, type metadata accessor for ContactMonogramView.MonogramLoader);
  uint64_t v31 = StateObject.wrappedValue.getter(v26, v27, v28, v29, v30);
  uint64_t v32 = sub_AC74();
  swift_release(v31);
  if (v32)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))( v17,  enum case for Image.ResizingMode.stretch(_:),  v13);
    uint64_t v33 = Image.resizable(capInsets:resizingMode:)(v17, v32, 0.0, 0.0, 0.0, 0.0);
    swift_release(v32);
    sub_D0C4(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
  }

  else
  {
    uint64_t v33 = 0LL;
  }

  uint64_t v34 = v69;
  double v35 = sub_ACE4();
  uint64_t v36 = (char *)v12 + *(int *)(v62 + 20);
  uint64_t v37 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v38 = type metadata accessor for RoundedCornerStyle(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 104LL))(v36, v37, v38);
  double *v12 = v35;
  v12[1] = v35;
  sub_66B4((uint64_t)v12, v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v8 + *(int *)(v64 + 36)) = 256;
  sub_8C10(v8, v21 + *(int *)(v61 + 36), &qword_24918);
  *(void *)uint64_t v21 = v60;
  *(void *)(v21 + 8) = 0LL;
  *(_BYTE *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = v33;
  swift_retain(v33);
  sub_8D84(v8, &qword_24918);
  sub_8DF0((uint64_t)v12, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release(v33);
  double v39 = sub_AF74();
  double v40 = sub_AF74();
  uint64_t v42 = v41;
  uint64_t v43 = static Alignment.center.getter(v40);
  _FrameLayout.init(width:height:alignment:)(v74, *(void *)&v39, 0LL, v42, 0LL, v43, v44);
  uint64_t v45 = v65;
  sub_8C10(v21, v65, &qword_24920);
  uint64_t v46 = (_OWORD *)(v45 + *(int *)(v63 + 36));
  __int128 v47 = v74[1];
  *uint64_t v46 = v74[0];
  v46[1] = v47;
  v46[2] = v74[2];
  sub_8D84(v21, &qword_24920);
  uint64_t v48 = v68;
  sub_66B4(v34, v68, type metadata accessor for ContactMonogramView);
  uint64_t v49 = *(unsigned __int8 *)(v66 + 80);
  uint64_t v50 = (v49 + 16) & ~v49;
  uint64_t v51 = swift_allocObject(&unk_214D0, v50 + v67, v49 | 7);
  uint64_t v52 = sub_CDA4(v48, v51 + v50);
  uint64_t v53 = v70;
  static TaskPriority.userInitiated.getter(v52);
  uint64_t v54 = sub_47B4(&qword_24948);
  uint64_t v55 = v72;
  uint64_t v56 = (char *)(v72 + *(int *)(v54 + 36));
  uint64_t v57 = type metadata accessor for _TaskModifier(0LL);
  uint64_t v58 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(&v56[*(int *)(v57 + 20)], v53, v73);
  *(void *)uint64_t v56 = &unk_24940;
  *((void *)v56 + 1) = v51;
  sub_8C10(v45, v55, &qword_24928);
  sub_D0C4(*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8));
  sub_8D84(v45, &qword_24928);
  sub_D04C();
}

uint64_t sub_AC74()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1C038);
  uint64_t v2 = swift_getKeyPath(&unk_1C060);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

double sub_ACE4()
{
  uint64_t v1 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v41 = *(void *)(v1 - 8);
  uint64_t v42 = v1;
  __chkstk_darwin(v1);
  uint64_t v36 = (uint64_t)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = (int *)type metadata accessor for ContactImageSizeResolver(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (int *)type metadata accessor for ContactMonogramView(0LL);
  uint64_t v40 = v0 + v6[5];
  uint64_t v7 = v0 + v6[10];
  uint64_t v8 = *(void *)v7;
  char v9 = *(_BYTE *)(v7 + 8);
  sub_BC38(*(void *)v7, v9);
  uint64_t v39 = sub_15F08();
  sub_BDD8(v8, v9);
  uint64_t v10 = v0 + v6[11];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
  char v13 = *(_BYTE *)(v10 + 9);
  sub_BC44(*(void *)v10, v12, v13);
  *(double *)&uint64_t v37 = COERCE_DOUBLE(sub_1601C());
  char v15 = v14;
  int v38 = v14 & 1;
  sub_BDE4(v11, v12, v13);
  uint64_t v16 = v0 + v6[12];
  uint64_t v17 = *(void *)v16;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 8);
  char v19 = *(_BYTE *)(v16 + 9);
  sub_BC44(*(void *)v16, v18, v19);
  double v20 = COERCE_DOUBLE(sub_1601C());
  char v22 = v21;
  uint64_t v23 = v17;
  uint64_t v24 = v18;
  uint64_t v26 = v41;
  uint64_t v25 = v42;
  sub_BDE4(v23, v24, v19);
  uint64_t v27 = v39;
  sub_161B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v5, v40, v25);
  double v28 = *(double *)&v37;
  *(void *)&v5[v3[5]] = v27;
  uint64_t v29 = &v5[v3[6]];
  *(double *)uint64_t v29 = v28;
  v29[8] = v38;
  uint64_t v30 = &v5[v3[7]];
  *(double *)uint64_t v30 = v20;
  v30[8] = v22 & 1;
  if ((v15 & 1) != 0 || (v22 & 1) != 0)
  {
    uint64_t v31 = v36;
    sub_D650(v36);
    id v32 = objc_allocWithZone((Class)type metadata accessor for Context(0LL));
    uint64_t v33 = (void *)Context.init(idiom:)(v27, 0LL);
    double v34 = static ImageElement.cornerRadius(for:context:)(v31, v33);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v31, v25);
  }

  else
  {
    double v34 = v20;
    if (v28 > v20) {
      double v34 = v28;
    }
  }

  sub_8DF0((uint64_t)v5, type metadata accessor for ContactImageSizeResolver);
  return v34;
}

double sub_AF74()
{
  uint64_t v1 = (int *)type metadata accessor for ContactImageSizeResolver(0LL);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = (int *)type metadata accessor for ContactMonogramView(0LL);
  uint64_t v26 = v0 + v4[5];
  uint64_t v5 = v0 + v4[10];
  uint64_t v6 = *(void *)v5;
  char v7 = *(_BYTE *)(v5 + 8);
  sub_BC38(*(void *)v5, v7);
  uint64_t v25 = sub_15F08();
  sub_BDD8(v6, v7);
  uint64_t v8 = v0 + v4[11];
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 8);
  char v11 = *(_BYTE *)(v8 + 9);
  sub_BC44(*(void *)v8, v10, v11);
  uint64_t v24 = sub_1601C();
  char v13 = v12;
  sub_BDE4(v9, v10, v11);
  uint64_t v14 = v0 + v4[12];
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 8);
  LOBYTE(v9) = *(_BYTE *)(v14 + 9);
  sub_BC44(*(void *)v14, v16, v9);
  uint64_t v17 = sub_1601C();
  LOBYTE(v6) = v18;
  sub_BDE4(v15, v16, v9);
  sub_161B8();
  uint64_t v19 = type metadata accessor for ImageElement.ImageStyle(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16LL))(v3, v26, v19);
  *(void *)&v3[v1[5]] = v25;
  double v20 = &v3[v1[6]];
  *(void *)double v20 = v24;
  v20[8] = v13 & 1;
  char v21 = &v3[v1[7]];
  *(void *)char v21 = v17;
  v21[8] = v6 & 1;
  double v22 = ContactImageSizeResolver.imageSize.getter();
  sub_8DF0((uint64_t)v3, type metadata accessor for ContactImageSizeResolver);
  return v22;
}

uint64_t sub_B168(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for LayoutDirection(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  unint64_t v4 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[5] = swift_task_alloc(v4);
  v1[6] = swift_task_alloc(v4);
  uint64_t v5 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  v1[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[8] = v6;
  void v1[9] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  v1[10] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_B234, v8, v9);
}

uint64_t sub_B234()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v20 = *(void *)(v0 + 56);
  uint64_t v21 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v22 = *(void *)(v0 + 24);
  uint64_t v23 = *(void *)(v0 + 40);
  swift_release(*(void *)(v0 + 80));
  uint64_t v5 = sub_D0AC();
  uint64_t v6 = (uint64_t *)(v4 + *(int *)(v5 + 24));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = *((unsigned __int8 *)v6 + 16);
  uint64_t v10 = sub_B774();
  sub_8DBC(&qword_24930, type metadata accessor for ContactMonogramView.MonogramLoader);
  uint64_t v12 = StateObject.wrappedValue.getter(v7, v8, v9, v10, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v20);
  double v13 = sub_AF74();
  double v15 = v14;
  uint64_t v16 = v4 + *(int *)(v5 + 36);
  uint64_t v17 = *(void *)v16;
  LOBYTE(v9) = *(_BYTE *)(v16 + 8);
  sub_BC38(*(void *)v16, v9);
  sub_16200();
  sub_BDD8(v17, v9);
  sub_16318();
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))( v23,  enum case for LayoutDirection.rightToLeft(_:),  v22);
  static LayoutDirection.== infix(_:_:)(v3, v23);
  char v18 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v18(v23, v22);
  v18(v3, v22);
  sub_B3F8(v13, v15);
  swift_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v20);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_B3F8(double a1, double a2)
{
  uint64_t v3 = v2;
  sub_47B4(&qword_24830);
  sub_A76C();
  __chkstk_darwin(v6);
  sub_A7B4();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for ColorScheme(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  double v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v32 - v15;
  id v17 = [(id)objc_opt_self(SiriTVUIMonogrammer) sharedInstance];
  if (v17)
  {
    char v18 = v17;
    ImageElement.Contact.Monogram.letters.getter();
    uint64_t v20 = v19;
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    if (a2 >= a1) {
      a2 = a1;
    }
    sub_8C10(v3 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader__colorScheme, v9, &qword_24830);
    sub_161E0();
    sub_8D84(v9, &qword_24830);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for ColorScheme.dark(_:), v10);
    char v22 = static ColorScheme.== infix(_:_:)(v16, v14);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v11 + 8);
    v23(v14, v10);
    v23(v16, v10);
    if ((v22 & 1) != 0) {
      uint64_t v24 = 2LL;
    }
    else {
      uint64_t v24 = 1LL;
    }
    id v25 = [v18 monogramWithText:v21 diameter:0 isFocused:v24 userInterfaceStyle:a2];

    if (v25)
    {
      uint64_t v26 = (os_log_s *)v25;
      uint64_t v27 = Image.init(nativeImage:)();
      sub_B6AC(v27);
    }

    else
    {
      if (qword_24340 != -1) {
        swift_once(&qword_24340, sub_E514);
      }
      uint64_t v28 = type metadata accessor for Logger(0LL);
      uint64_t v29 = sub_89CC(v28, (uint64_t)qword_263C0);
      uint64_t v26 = (os_log_s *)Logger.logObject.getter(v29);
      os_log_type_t v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_0, v26, v30, "Failed to get an image from SiriTVUIMonogrammer.", v31, 2u);
        swift_slowDealloc(v31, -1LL, -1LL);
      }
    }

    sub_D04C();
  }

  else
  {
    __break(1u);
  }

uint64_t sub_B684(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return sub_B6AC(v1);
}

uint64_t sub_B6AC(uint64_t a1)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1C038);
  uint64_t v4 = swift_getKeyPath(&unk_1C060);
  uint64_t v6 = a1;
  swift_retain(v1);
  return static Published.subscript.setter(&v6, v1, KeyPath, v4);
}

uint64_t sub_B718()
{
  uint64_t v1 = sub_47B4(&qword_24828);
  sub_8E18(v1);
  sub_8D84(v0 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader__colorScheme, &qword_24830);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_B774()
{
  return type metadata accessor for ContactMonogramView.MonogramLoader(0LL);
}

uint64_t type metadata accessor for ContactMonogramView.MonogramLoader(uint64_t a1)
{
  return sub_4DE4(a1, (uint64_t *)&unk_24788, (uint64_t)&nominal type descriptor for ContactMonogramView.MonogramLoader);
}

void sub_B790(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_CBCC( 319LL,  (unint64_t *)&qword_247A0,  (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      swift_updateClassMetadata2(a1, 256LL, 2LL, v6, a1 + 80);
    }
  }

void *sub_B840()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_B84C()
{
  uint64_t v1 = sub_47B4(&qword_24828);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_A7B4();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = v0 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader__image;
  uint64_t v11 = 0LL;
  uint64_t v7 = sub_47B4(&qword_24638);
  Published.init(initialValue:)(&v11, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v5, v1);
  uint64_t v8 = (void *)(v0 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader__colorScheme);
  *uint64_t v8 = swift_getKeyPath(&unk_1C008);
  uint64_t v9 = sub_47B4(&qword_24370);
  swift_storeEnumTagMultiPayload(v8, v9, 0LL);
  return v0;
}

uint64_t sub_B92C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t *sub_B954(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v25);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for ImageElement.ImageStyle(0LL);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    double v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *((void *)v15 + 1);
    char v18 = v15[16];
    sub_BC30(*(void *)v15, v17);
    *(void *)double v14 = v16;
    *((void *)v14 + 1) = v17;
    v14[16] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = (uint64_t *)((char *)a1 + v19);
    NSString v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v21, v22) == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v21, 1LL, v11))
      {
        uint64_t v23 = sub_47B4(&qword_24838);
        memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64LL));
        uint64_t v24 = 1LL;
      }

      else
      {
        v12((char *)v20, (char *)v21, v11);
        uint64_t v24 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v20, 0LL, 1LL, v11);
      }
    }

    else
    {
      uint64_t v26 = *v21;
      uint64_t *v20 = *v21;
      swift_retain(v26);
      uint64_t v24 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v20, v22, v24);
    uint64_t v27 = a3[8];
    uint64_t v28 = (uint64_t *)((char *)a1 + v27);
    uint64_t v29 = (uint64_t *)((char *)a2 + v27);
    uint64_t v30 = sub_47B4(&qword_24840);
    if (swift_getEnumCaseMultiPayload(v29, v30) == 1)
    {
      uint64_t v31 = type metadata accessor for LayoutDirection(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16LL))(v28, v29, v31);
      uint64_t v32 = v28;
      uint64_t v33 = v30;
      uint64_t v34 = 1LL;
    }

    else
    {
      uint64_t v35 = *v29;
      *uint64_t v28 = *v29;
      swift_retain(v35);
      uint64_t v32 = v28;
      uint64_t v33 = v30;
      uint64_t v34 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v32, v33, v34);
    uint64_t v36 = a3[9];
    uint64_t v37 = (char *)a1 + v36;
    int v38 = (char *)a2 + v36;
    uint64_t v39 = *(void *)v38;
    char v40 = v38[8];
    sub_BC38(*(void *)v38, v40);
    *(void *)uint64_t v37 = v39;
    v37[8] = v40;
    uint64_t v41 = a3[10];
    uint64_t v42 = (char *)a1 + v41;
    uint64_t v43 = (char *)a2 + v41;
    uint64_t v44 = *(void *)v43;
    char v45 = v43[8];
    sub_BC38(*(void *)v43, v45);
    *(void *)uint64_t v42 = v44;
    v42[8] = v45;
    uint64_t v46 = a3[11];
    __int128 v47 = (char *)a1 + v46;
    uint64_t v48 = (char *)a2 + v46;
    uint64_t v49 = *(void *)v48;
    char v50 = v48[9];
    LOBYTE(v42) = v48[8];
    sub_BC44(*(void *)v48, v42, v50);
    *(void *)__int128 v47 = v49;
    v47[8] = (char)v42;
    v47[9] = v50;
    uint64_t v51 = a3[12];
    uint64_t v52 = (char *)a1 + v51;
    uint64_t v53 = (char *)a2 + v51;
    uint64_t v54 = *(void *)v53;
    char v55 = v53[9];
    LOBYTE(v49) = v53[8];
    sub_BC44(*(void *)v53, v49, v55);
    *(void *)uint64_t v52 = v54;
    v52[8] = v49;
    v52[9] = v55;
  }

  return a1;
}

uint64_t sub_BC30(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_BC38(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain(result);
  }
  return result;
}

uint64_t sub_BC44(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain(result);
  }
  return result;
}

uint64_t sub_BC50(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  int v5 = (void *)(a1 + a2[5]);
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(void (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  sub_BDD0(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8));
  uint64_t v8 = (void *)(a1 + a2[7]);
  uint64_t v9 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
  }

  else
  {
    swift_release(*v8);
  }

  uint64_t v10 = (void *)(a1 + a2[8]);
  uint64_t v11 = sub_47B4(&qword_24840);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    uint64_t v12 = type metadata accessor for LayoutDirection(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v12 - 8) + 8LL))(v10, v12);
  }

  else
  {
    swift_release(*v10);
  }

  sub_BDD8(*(void *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));
  sub_BDD8(*(void *)(a1 + a2[10]), *(_BYTE *)(a1 + a2[10] + 8));
  sub_BDE4(*(void *)(a1 + a2[11]), *(unsigned __int8 *)(a1 + a2[11] + 8), *(_BYTE *)(a1 + a2[11] + 9));
  return sub_BDE4(*(void *)(a1 + a2[12]), *(unsigned __int8 *)(a1 + a2[12] + 8), *(_BYTE *)(a1 + a2[12] + 9));
}

uint64_t sub_BDD0(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t sub_BDD8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release(result);
  }
  return result;
}

uint64_t sub_BDE4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release(result);
  }
  return result;
}

uint64_t sub_BDF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  char v17 = *(_BYTE *)(v14 + 16);
  sub_BC30(*(void *)v14, v16);
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(_BYTE *)(v13 + 16) = v17;
  uint64_t v18 = a3[7];
  uint64_t v19 = (uint64_t *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v20, v21) == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1LL, v10))
    {
      uint64_t v22 = sub_47B4(&qword_24838);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64LL));
      uint64_t v23 = 1LL;
    }

    else
    {
      v11((uint64_t)v19, (uint64_t)v20, v10);
      uint64_t v23 = 1LL;
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0LL, 1LL, v10);
    }
  }

  else
  {
    uint64_t v24 = *v20;
    *uint64_t v19 = *v20;
    swift_retain(v24);
    uint64_t v23 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v19, v21, v23);
  uint64_t v25 = a3[8];
  uint64_t v26 = (uint64_t *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v28 = sub_47B4(&qword_24840);
  if (swift_getEnumCaseMultiPayload(v27, v28) == 1)
  {
    uint64_t v29 = type metadata accessor for LayoutDirection(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v29 - 8) + 16LL))(v26, v27, v29);
    uint64_t v30 = v26;
    uint64_t v31 = v28;
    uint64_t v32 = 1LL;
  }

  else
  {
    uint64_t v33 = *v27;
    *uint64_t v26 = *v27;
    swift_retain(v33);
    uint64_t v30 = v26;
    uint64_t v31 = v28;
    uint64_t v32 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v30, v31, v32);
  uint64_t v34 = a3[9];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void *)v36;
  char v38 = *(_BYTE *)(v36 + 8);
  sub_BC38(*(void *)v36, v38);
  *(void *)uint64_t v35 = v37;
  *(_BYTE *)(v35 + 8) = v38;
  uint64_t v39 = a3[10];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = *(void *)v41;
  char v43 = *(_BYTE *)(v41 + 8);
  sub_BC38(*(void *)v41, v43);
  *(void *)uint64_t v40 = v42;
  *(_BYTE *)(v40 + 8) = v43;
  uint64_t v44 = a3[11];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = *(void *)v46;
  char v48 = *(_BYTE *)(v46 + 9);
  LOBYTE(v40) = *(_BYTE *)(v46 + 8);
  sub_BC44(*(void *)v46, v40, v48);
  *(void *)uint64_t v45 = v47;
  *(_BYTE *)(v45 + 8) = v40;
  *(_BYTE *)(v45 + 9) = v48;
  uint64_t v49 = a3[12];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  uint64_t v52 = *(void *)v51;
  char v53 = *(_BYTE *)(v51 + 9);
  LOBYTE(v47) = *(_BYTE *)(v51 + 8);
  sub_BC44(*(void *)v51, v47, v53);
  *(void *)uint64_t v50 = v52;
  *(_BYTE *)(v50 + 8) = v47;
  *(_BYTE *)(v50 + 9) = v53;
  return a1;
}

uint64_t sub_C0A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  char v17 = *(_BYTE *)(v14 + 16);
  sub_BC30(*(void *)v14, v16);
  uint64_t v18 = *(void *)v13;
  uint64_t v19 = *(void *)(v13 + 8);
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(_BYTE *)(v13 + 16) = v17;
  sub_BDD0(v18, v19);
  if (a1 != a2)
  {
    uint64_t v20 = a3[7];
    uint64_t v21 = (uint64_t *)(a1 + v20);
    uint64_t v22 = (uint64_t *)(a2 + v20);
    sub_8D84(a1 + v20, &qword_24360);
    uint64_t v23 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v22, v23) == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v22, 1LL, v10))
      {
        uint64_t v24 = sub_47B4(&qword_24838);
        memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64LL));
        uint64_t v25 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(v21, v22, v10);
        uint64_t v25 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v21, 0LL, 1LL, v10);
      }
    }

    else
    {
      uint64_t v26 = *v22;
      uint64_t *v21 = *v22;
      swift_retain(v26);
      uint64_t v25 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v21, v23, v25);
    uint64_t v27 = a3[8];
    uint64_t v28 = (uint64_t *)(a1 + v27);
    uint64_t v29 = (uint64_t *)(a2 + v27);
    sub_8D84(a1 + v27, &qword_24840);
    uint64_t v30 = sub_47B4(&qword_24840);
    if (swift_getEnumCaseMultiPayload(v29, v30) == 1)
    {
      uint64_t v31 = type metadata accessor for LayoutDirection(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16LL))(v28, v29, v31);
      uint64_t v32 = v28;
      uint64_t v33 = v30;
      uint64_t v34 = 1LL;
    }

    else
    {
      uint64_t v35 = *v29;
      *uint64_t v28 = *v29;
      swift_retain(v35);
      uint64_t v32 = v28;
      uint64_t v33 = v30;
      uint64_t v34 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v32, v33, v34);
  }

  uint64_t v36 = a3[9];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)v38;
  char v40 = *(_BYTE *)(v38 + 8);
  sub_BC38(*(void *)v38, v40);
  uint64_t v41 = *(void *)v37;
  char v42 = *(_BYTE *)(v37 + 8);
  *(void *)uint64_t v37 = v39;
  *(_BYTE *)(v37 + 8) = v40;
  sub_BDD8(v41, v42);
  uint64_t v43 = a3[10];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = *(void *)v45;
  char v47 = *(_BYTE *)(v45 + 8);
  sub_BC38(*(void *)v45, v47);
  uint64_t v48 = *(void *)v44;
  char v49 = *(_BYTE *)(v44 + 8);
  *(void *)uint64_t v44 = v46;
  *(_BYTE *)(v44 + 8) = v47;
  sub_BDD8(v48, v49);
  uint64_t v50 = a3[11];
  uint64_t v51 = a1 + v50;
  uint64_t v52 = a2 + v50;
  uint64_t v53 = *(void *)v52;
  char v54 = *(_BYTE *)(v52 + 9);
  LOBYTE(v44) = *(_BYTE *)(v52 + 8);
  sub_BC44(*(void *)v52, v44, v54);
  uint64_t v55 = *(void *)v51;
  char v56 = *(_BYTE *)(v51 + 9);
  *(void *)uint64_t v51 = v53;
  uint64_t v57 = *(unsigned __int8 *)(v51 + 8);
  *(_BYTE *)(v51 + 8) = v44;
  *(_BYTE *)(v51 + 9) = v54;
  sub_BDE4(v55, v57, v56);
  uint64_t v58 = a3[12];
  uint64_t v59 = a1 + v58;
  uint64_t v60 = a2 + v58;
  uint64_t v61 = *(void *)v60;
  char v62 = *(_BYTE *)(v60 + 9);
  LOBYTE(v53) = *(_BYTE *)(v60 + 8);
  sub_BC44(*(void *)v60, v53, v62);
  uint64_t v63 = *(void *)v59;
  char v64 = *(_BYTE *)(v59 + 9);
  *(void *)uint64_t v59 = v61;
  uint64_t v65 = *(unsigned __int8 *)(v59 + 8);
  *(_BYTE *)(v59 + 8) = v53;
  *(_BYTE *)(v59 + 9) = v62;
  sub_BDE4(v63, v65, v64);
  return a1;
}

uint64_t sub_C3C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_BYTE *)(v14 + 16) = *(_BYTE *)(v15 + 16);
  uint64_t v16 = (void *)(a1 + v13);
  char v17 = (const void *)(a2 + v13);
  uint64_t v18 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v17, v18) == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1LL, v10))
    {
      uint64_t v19 = sub_47B4(&qword_24838);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      v11(v16, v17, v10);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0LL, 1LL, v10);
    }

    swift_storeEnumTagMultiPayload(v16, v18, 1LL);
  }

  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = sub_47B4(&qword_24840);
  if (swift_getEnumCaseMultiPayload(v22, v23) == 1)
  {
    uint64_t v24 = type metadata accessor for LayoutDirection(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32LL))(v21, v22, v24);
    swift_storeEnumTagMultiPayload(v21, v23, 1LL);
  }

  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64LL));
  }

  uint64_t v25 = a3[9];
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  uint64_t v29 = a1 + v26;
  uint64_t v30 = a2 + v26;
  *(void *)uint64_t v29 = *(void *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  uint64_t v31 = a3[11];
  uint64_t v32 = a3[12];
  uint64_t v33 = a1 + v31;
  uint64_t v34 = a2 + v31;
  *(void *)uint64_t v33 = *(void *)v34;
  *(_WORD *)(v33 + 8) = *(_WORD *)(v34 + 8);
  uint64_t v35 = a1 + v32;
  uint64_t v36 = a2 + v32;
  *(void *)uint64_t v35 = *(void *)v36;
  *(_WORD *)(v35 + 8) = *(_WORD *)(v36 + 8);
  return a1;
}

uint64_t sub_C5FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(_BYTE *)(v14 + 16);
  uint64_t v16 = *(void *)v13;
  uint64_t v17 = *(void *)(v13 + 8);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_BYTE *)(v13 + 16) = v15;
  sub_BDD0(v16, v17);
  if (a1 != a2)
  {
    uint64_t v18 = a3[7];
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (const void *)(a2 + v18);
    sub_8D84(a1 + v18, &qword_24360);
    uint64_t v21 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v20, v21) == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1LL, v10))
      {
        uint64_t v22 = sub_47B4(&qword_24838);
        memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v19, v20, v10);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0LL, 1LL, v10);
      }

      swift_storeEnumTagMultiPayload(v19, v21, 1LL);
    }

    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64LL));
    }

    uint64_t v23 = a3[8];
    uint64_t v24 = (void *)(a1 + v23);
    uint64_t v25 = (const void *)(a2 + v23);
    sub_8D84(a1 + v23, &qword_24840);
    uint64_t v26 = sub_47B4(&qword_24840);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      uint64_t v27 = type metadata accessor for LayoutDirection(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v27 - 8) + 32LL))(v24, v25, v27);
      swift_storeEnumTagMultiPayload(v24, v26, 1LL);
    }

    else
    {
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64LL));
    }
  }

  uint64_t v28 = a3[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v31 = *v30;
  LOBYTE(v30) = *((_BYTE *)v30 + 8);
  uint64_t v32 = *(void *)v29;
  char v33 = *(_BYTE *)(v29 + 8);
  *(void *)uint64_t v29 = v31;
  *(_BYTE *)(v29 + 8) = (_BYTE)v30;
  sub_BDD8(v32, v33);
  uint64_t v34 = a3[10];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v37 = *v36;
  LOBYTE(v36) = *((_BYTE *)v36 + 8);
  uint64_t v38 = *(void *)v35;
  char v39 = *(_BYTE *)(v35 + 8);
  *(void *)uint64_t v35 = v37;
  *(_BYTE *)(v35 + 8) = (_BYTE)v36;
  sub_BDD8(v38, v39);
  uint64_t v40 = a3[11];
  uint64_t v41 = a1 + v40;
  char v42 = (uint64_t *)(a2 + v40);
  uint64_t v43 = *v42;
  char v44 = *((_BYTE *)v42 + 8);
  LOBYTE(v42) = *((_BYTE *)v42 + 9);
  uint64_t v45 = *(void *)v41;
  char v46 = *(_BYTE *)(v41 + 9);
  *(void *)uint64_t v41 = v43;
  uint64_t v47 = *(unsigned __int8 *)(v41 + 8);
  *(_BYTE *)(v41 + 8) = v44;
  *(_BYTE *)(v41 + 9) = (_BYTE)v42;
  sub_BDE4(v45, v47, v46);
  uint64_t v48 = a3[12];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = (uint64_t *)(a2 + v48);
  uint64_t v51 = *v50;
  char v52 = *((_BYTE *)v50 + 8);
  LOBYTE(v50) = *((_BYTE *)v50 + 9);
  uint64_t v53 = *(void *)v49;
  char v54 = *(_BYTE *)(v49 + 9);
  *(void *)uint64_t v49 = v51;
  uint64_t v55 = *(unsigned __int8 *)(v49 + 8);
  *(_BYTE *)(v49 + 8) = v52;
  *(_BYTE *)(v49 + 9) = (_BYTE)v50;
  sub_BDE4(v53, v55, v54);
  return a1;
}

uint64_t sub_C8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C8D0);
}

uint64_t sub_C8D0(uint64_t a1, uint64_t a2, int *a3)
{
  if (v9)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, v3, v7);
  }

  sub_D0DC();
  sub_D08C();
  if (v9)
  {
    uint64_t v7 = v10;
    uint64_t v11 = a3[5];
LABEL_14:
    uint64_t v8 = v4 + v11;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, v3, v7);
  }

  if ((_DWORD)v3 != 254)
  {
    sub_47B4(&qword_24848);
    sub_D08C();
    if (v9)
    {
      uint64_t v7 = v14;
      uint64_t v11 = a3[7];
    }

    else
    {
      uint64_t v7 = sub_47B4(&qword_24850);
      uint64_t v11 = a3[8];
    }

    goto LABEL_14;
  }

  unsigned int v12 = *(unsigned __int8 *)(v4 + a3[6] + 16);
  if (v12 > 1) {
    return (v12 ^ 0xFF) + 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_C990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C99C);
}

void sub_C99C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (v11)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v5;
  }

  else
  {
    sub_D0DC();
    sub_D07C();
    if (v11)
    {
      uint64_t v9 = v12;
      uint64_t v13 = a4[5];
    }

    else
    {
      if (a3 == 254)
      {
        *(_BYTE *)(v5 + a4[6] + 16) = -(char)v4;
        return;
      }

      sub_47B4(&qword_24848);
      sub_D07C();
      if (v11)
      {
        uint64_t v9 = v14;
        uint64_t v13 = a4[7];
      }

      else
      {
        uint64_t v9 = sub_47B4(&qword_24850);
        uint64_t v13 = a4[8];
      }
    }

    uint64_t v10 = v5 + v13;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v10, v4, v4, v9);
}

uint64_t type metadata accessor for ContactMonogramView(uint64_t a1)
{
  return sub_4DE4(a1, (uint64_t *)&unk_248B0, (uint64_t)&nominal type descriptor for ContactMonogramView);
}

void sub_CA70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImageElement.Contact.Monogram(319LL);
  if (v3 <= 0x3F)
  {
    v10[0] = *(void *)(v2 - 8) + 64LL;
    uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(319LL);
    if (v5 <= 0x3F)
    {
      v10[1] = *(void *)(v4 - 8) + 64LL;
      v10[2] = &unk_1BF70;
      sub_CB74( 319LL,  (unint64_t *)&qword_248C0,  &qword_24838,  (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v7 <= 0x3F)
      {
        v10[3] = *(void *)(v6 - 8) + 64LL;
        sub_CBCC( 319LL,  (unint64_t *)&unk_248C8,  (uint64_t (*)(uint64_t))&type metadata accessor for LayoutDirection);
        if (v9 <= 0x3F)
        {
          v10[4] = *(void *)(v8 - 8) + 64LL;
          v10[5] = &unk_1BF88;
          v10[6] = &unk_1BF88;
          v10[7] = &unk_1BFA0;
          v10[8] = &unk_1BFA0;
          swift_initStructMetadata(a1, 256LL, 9LL, v10, a1 + 16);
        }
      }
    }
  }

void sub_CB74(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_67CC(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }

void sub_CBCC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  if (!*a2)
  {
    uint64_t v5 = a3(255LL);
    unint64_t v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

uint64_t sub_CC18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1DBA4, 1LL);
}

uint64_t sub_CC30()
{
  uint64_t v1 = (int *)sub_D0AC();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v0 + v4;
  uint64_t v7 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v0 + v4, v7);
  uint64_t v8 = sub_D0DC();
  sub_D0D0();
  sub_BDD0(*(void *)(v6 + v1[6]), *(void *)(v6 + v1[6] + 8));
  uint64_t v9 = (void *)(v0 + v4 + v1[7]);
  uint64_t v10 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
  }

  else
  {
    swift_release(*v9);
  }

  char v11 = (void *)(v6 + v1[8]);
  uint64_t v12 = sub_47B4(&qword_24840);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    uint64_t v13 = type metadata accessor for LayoutDirection(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v13 - 8) + 8LL))(v11, v13);
  }

  else
  {
    swift_release(*v11);
  }

  sub_D09C(v1[9]);
  sub_D09C(v1[10]);
  sub_D068(v1[11]);
  sub_D068(v1[12]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_CDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactMonogramView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_CDE8()
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(sub_D0AC() - 8) + 80LL);
  uint64_t v3 = v0 + ((v2 + 16) & ~v2);
  uint64_t v4 = (void *)swift_task_alloc(dword_2493C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_CE48;
  return sub_B168(v3);
}

uint64_t sub_CE48()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_CE90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_AC74();
  *a1 = result;
  return result;
}

unint64_t sub_CEC0()
{
  unint64_t result = qword_24950;
  if (!qword_24950)
  {
    uint64_t v1 = sub_67CC(&qword_24948);
    sub_CF44();
    sub_8DBC(&qword_244D0, (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24950);
  }

  return result;
}

unint64_t sub_CF44()
{
  unint64_t result = qword_24958;
  if (!qword_24958)
  {
    uint64_t v1 = sub_67CC(&qword_24928);
    sub_CFB0();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24958);
  }

  return result;
}

unint64_t sub_CFB0()
{
  unint64_t result = qword_24960;
  if (!qword_24960)
  {
    uint64_t v1 = sub_67CC(&qword_24920);
    sub_8D50(&qword_24968, &qword_24970);
    sub_8D50(&qword_24978, &qword_24918);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24960);
  }

  return result;
}

  ;
}

uint64_t sub_D068@<X0>(uint64_t a1@<X8>)
{
  return sub_BDE4(*(void *)(v1 + a1), *(unsigned __int8 *)(v1 + a1 + 8), *(_BYTE *)(v1 + a1 + 9));
}

  ;
}

  ;
}

uint64_t sub_D09C@<X0>(uint64_t a1@<X8>)
{
  return sub_BDD8(*(void *)(v1 + a1), *(_BYTE *)(v1 + a1 + 8));
}

uint64_t sub_D0AC()
{
  return type metadata accessor for ContactMonogramView(0LL);
}

uint64_t sub_D0B4()
{
  return type metadata accessor for ImageElement.Contact.Monogram(0LL);
}

uint64_t sub_D0C4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_D0D0()
{
  return v2(v1, v0);
}

uint64_t sub_D0DC()
{
  return type metadata accessor for ImageElement.ImageStyle(0LL);
}

double ContactImageSizeResolver.imageSize.getter()
{
  uint64_t v2 = sub_D0DC();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = sub_E4A8();
  sub_A76C();
  __chkstk_darwin(v5);
  sub_A7B4();
  uint64_t v8 = v7 - v6;
  uint64_t v10 = v0 + *(int *)(v9 + 24);
  double v11 = 0.0;
  if ((*(_BYTE *)(v10 + 8) & 1) != 0 || (*(_BYTE *)(v0 + *(int *)(v4 + 28) + 8) & 1) != 0)
  {
    int v12 = 1;
  }

  else
  {
    int v12 = 0;
    double v11 = *(double *)v10;
  }

  sub_D21C(v0, v8);
  if (v12)
  {
    sub_D650(v1);
    id v13 = objc_allocWithZone((Class)type metadata accessor for Context(0LL));
    uint64_t v14 = (void *)sub_E4E4();
    double v11 = static ImageElement.size(for:context:)(v1, v14);

    sub_E508(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }

  sub_D798(v8);
  return v11;
}

uint64_t type metadata accessor for ContactImageSizeResolver(uint64_t a1)
{
  return sub_4DE4(a1, (uint64_t *)&unk_249D8, (uint64_t)&nominal type descriptor for ContactImageSizeResolver);
}

uint64_t sub_D21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactImageSizeResolver(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

double ContactImageSizeResolver.cornerRadius.getter()
{
  uint64_t v2 = sub_D0DC();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = sub_E4A8();
  uint64_t v5 = (_BYTE *)(v0 + *(int *)(v4 + 24));
  if ((v5[8] & 1) != 0 || (uint64_t v6 = (_BYTE *)(v0 + *(int *)(v4 + 28)), (v6[8] & 1) != 0))
  {
    sub_D650(v1);
    id v7 = objc_allocWithZone((Class)type metadata accessor for Context(0LL));
    uint64_t v8 = (void *)sub_E4E4();
    double v9 = static ImageElement.cornerRadius(for:context:)(v1, v8);

    sub_E508(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }

  else if (*(double *)v5 <= *(double *)v6)
  {
    return *(double *)v6;
  }

  else
  {
    return *(double *)v5;
  }

  return v9;
}

uint64_t sub_D334@<X0>(uint64_t *a1@<X8>)
{
  char v42 = a1;
  uint64_t v1 = sub_D0DC();
  uint64_t v40 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  __chkstk_darwin(v1);
  sub_A7B4();
  uint64_t v39 = v3 - v2;
  uint64_t v4 = (int *)type metadata accessor for ContactMonogramView(0LL);
  sub_A76C();
  __chkstk_darwin(v5);
  sub_A7B4();
  uint64_t v8 = (char *)(v7 - v6);
  uint64_t v9 = type metadata accessor for ImageElement.Contact.Monogram(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  char v15 = (char *)&v39 - v14;
  uint64_t v16 = type metadata accessor for ImageElement.Contact.Content(0LL);
  uint64_t v17 = *(uint64_t (***)(uint64_t, uint64_t))(v16 - 8);
  __chkstk_darwin(v16);
  sub_A7B4();
  uint64_t v20 = v19 - v18;
  ImageElement.Contact.content.getter();
  uint64_t v21 = v17[11](v20, v16);
  if ((_DWORD)v21 == enum case for ImageElement.Contact.Content.monogram(_:))
  {
    sub_E4C4(v17[12]);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
    v22(v15, v20, v9);
    uint64_t v23 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    uint64_t v24 = v39;
    ImageElement.Contact.imageStyle.getter(v23);
    uint64_t v25 = &v8[v4[6]];
    *(void *)uint64_t v25 = sub_A7DC;
    *((void *)v25 + 1) = 0LL;
    v25[16] = 0;
    uint64_t v26 = &v8[v4[7]];
    *(void *)uint64_t v26 = swift_getKeyPath(&unk_1C148);
    uint64_t v27 = sub_47B4(&qword_24360);
    sub_E4F8(v27);
    uint64_t v28 = &v8[v4[8]];
    *(void *)uint64_t v28 = swift_getKeyPath(&unk_1C178);
    uint64_t v29 = sub_47B4(&qword_24840);
    sub_E4F8(v29);
    uint64_t v30 = &v8[v4[9]];
    *(void *)uint64_t v30 = swift_getKeyPath(&unk_1C1A8);
    v30[8] = 0;
    uint64_t v31 = &v8[v4[10]];
    *(void *)uint64_t v31 = swift_getKeyPath(&unk_1C1D8);
    v31[8] = 0;
    uint64_t v32 = &v8[v4[11]];
    *(void *)uint64_t v32 = swift_getKeyPath(&unk_1C208);
    *((_WORD *)v32 + 4) = 0;
    char v33 = &v8[v4[12]];
    *(void *)char v33 = swift_getKeyPath(&unk_1C208);
    *((_WORD *)v33 + 4) = 0;
    v22(v8, (uint64_t)v13, v9);
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(&v8[v4[5]], v24, v41);
    unint64_t v34 = sub_E45C();
    uint64_t v35 = AnyView.init<A>(_:)(v8, v4, v34);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    *char v42 = v35;
  }

  else
  {
    uint64_t v37 = v42;
    if ((_DWORD)v21 == enum case for ImageElement.Contact.Content.avatar(_:))
    {
      uint64_t v38 = sub_E4C4(v17[1]);
      uint64_t result = AnyView.init<A>(_:)(v38, &type metadata for EmptyView, &protocol witness table for EmptyView);
      *uint64_t v37 = result;
    }

    else
    {
      *uint64_t v37 = AnyView.init<A>(_:)(v21, &type metadata for EmptyView, &protocol witness table for EmptyView);
      return sub_E4C4(v17[1]);
    }
  }

  return result;
}

uint64_t sub_D650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_47B4(&qword_24838);
  sub_A76C();
  __chkstk_darwin(v4);
  sub_A7B4();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_D0DC();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_A7B4();
  uint64_t v12 = v11 - v10;
  id v13 = *(void (**)(uint64_t, void, uint64_t))(v9 + 104);
  v13(v11 - v10, enum case for ImageElement.ImageStyle.default(_:), v8);
  char v14 = static ImageElement.ImageStyle.== infix(_:_:)(v2, v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  if ((v14 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a1, v2, v8);
  }
  uint64_t v15 = type metadata accessor for ContactImageSizeResolver(0LL);
  sub_E010(v2 + *(int *)(v15 + 32), v7);
  v13(a1, enum case for ImageElement.ImageStyle.contactImage5(_:), v8);
  return sub_E058(v7);
}

uint64_t sub_D798(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactImageSizeResolver(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

char *initializeBufferWithCopyOfBuffer for ContactImageSizeResolver(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v19 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v19);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ImageElement.ImageStyle(0LL);
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = a3[6];
    *(void *)&a1[a3[5]] = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    char v14 = &a1[v12];
    uint64_t v15 = (char *)a2 + v12;
    *(void *)char v14 = *(void *)v15;
    v14[8] = v15[8];
    uint64_t v16 = &a1[v13];
    uint64_t v17 = (char *)a2 + v13;
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1LL, v7))
    {
      uint64_t v18 = sub_47B4(&qword_24838);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      v8(v16, v17, v7);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0LL, 1LL, v7);
    }
  }

  return a1;
}

uint64_t destroy for ContactImageSizeResolver(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v7(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t result = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1LL, v4);
  if (!(_DWORD)result) {
    return v7(v5, v4);
  }
  return result;
}

char *initializeWithCopy for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)uint64_t v9 = *(void *)v10;
  v9[8] = v10[8];
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v11];
  char v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = &a1[v12];
  uint64_t v16 = &a2[v12];
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v16, 1LL, v6))
  {
    uint64_t v17 = sub_47B4(&qword_24838);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    v7(v15, v16, v6);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v15, 0LL, 1LL, v6);
  }

  return a1;
}

char *assignWithCopy for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  char v12 = v11[8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v12;
  uint64_t v13 = a3[7];
  char v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  char v16 = v15[8];
  *(void *)char v14 = *(void *)v15;
  v14[8] = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  int v20 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)&a1[v17], 1LL, v6);
  int v21 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1LL, v6);
  if (!v20)
  {
    if (!v21)
    {
      v8(v18, v19, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
    goto LABEL_6;
  }

  if (v21)
  {
LABEL_6:
    uint64_t v22 = sub_47B4(&qword_24838);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v18, v19, v6);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v18, 0LL, 1LL, v6);
  return a1;
}

char *initializeWithTake for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)uint64_t v9 = *(void *)v10;
  v9[8] = v10[8];
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v11];
  char v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = &a1[v12];
  char v16 = &a2[v12];
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v16, 1LL, v6))
  {
    uint64_t v17 = sub_47B4(&qword_24838);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    v7(v15, v16, v6);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v15, 0LL, 1LL, v6);
  }

  return a1;
}

char *assignWithTake for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  char v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  *(void *)char v14 = *(void *)v15;
  v14[8] = v15[8];
  char v16 = &a1[v13];
  uint64_t v17 = &a2[v13];
  int v18 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)&a1[v13], 1LL, v6);
  int v19 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1LL, v6);
  if (!v18)
  {
    if (!v19)
    {
      v8(v16, v17, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_47B4(&qword_24838);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0LL, 1LL, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactImageSizeResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_DE3C);
}

uint64_t sub_DE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_D0DC();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
  }

  else
  {
    uint64_t v7 = sub_47B4(&qword_24838);
    uint64_t v8 = a1 + *(int *)(a3 + 32);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ContactImageSizeResolver( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_DEB0);
}

uint64_t sub_DEB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_D0DC();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v9 = sub_47B4(&qword_24838);
    uint64_t v10 = a1 + *(int *)(a4 + 32);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v10, a2, a2, v9);
}

void sub_DF20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImageElement.ImageStyle(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = (char *)&value witness table for Builtin.Int64 + 64;
    void v6[2] = "\t";
    v6[3] = "\t";
    sub_DFBC(319LL);
    if (v5 <= 0x3F)
    {
      v6[4] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 5LL, v6, a1 + 16);
    }
  }

void sub_DFBC(uint64_t a1)
{
  if (!qword_249E8)
  {
    uint64_t v2 = type metadata accessor for ImageElement.ImageStyle(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_249E8);
    }
  }

uint64_t sub_E010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B4(&qword_24838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_E058(uint64_t a1)
{
  uint64_t v2 = sub_47B4(&qword_24838);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_E098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_E0D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImageElement.Contact(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_E108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_E14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_E190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_E1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageElement.Contact(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_E218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_E224);
}

uint64_t sub_E224()
{
  uint64_t v2 = sub_E4D0();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v1, v0, v2);
}

uint64_t sub_E248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_E254);
}

uint64_t sub_E254()
{
  uint64_t v2 = sub_E4D0();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v2);
}

uint64_t type metadata accessor for ContactImageSourceView(uint64_t a1)
{
  return sub_4DE4(a1, qword_24A80, (uint64_t)&nominal type descriptor for ContactImageSourceView);
}

uint64_t sub_E290(uint64_t a1)
{
  uint64_t result = type metadata accessor for ImageElement.Contact(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_E2F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1DC1C, 1LL);
}

void sub_E310()
{
}

uint64_t sub_E32C(uint64_t a1)
{
  unint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.layoutDirection.setter(v3);
}

void sub_E3B4(void *a1@<X8>)
{
  *a1 = EnvironmentValues.currentIdiom.getter();
  sub_8E2C();
}

void sub_E3D8(void *a1)
{
}

uint64_t sub_E3F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.imageElementFrameWidth.getter();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_E42C(uint64_t a1)
{
  return EnvironmentValues.imageElementFrameWidth.setter(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

unint64_t sub_E45C()
{
  unint64_t result = qword_24AB8;
  if (!qword_24AB8)
  {
    uint64_t v1 = type metadata accessor for ContactMonogramView(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1BFB8, v1);
    atomic_store(result, (unint64_t *)&qword_24AB8);
  }

  return result;
}

void *sub_E49C()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_E4A8()
{
  return type metadata accessor for ContactImageSizeResolver(0LL);
}

uint64_t sub_E4C4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_E4D0()
{
  return type metadata accessor for ImageElement.Contact(0LL);
}

uint64_t sub_E4E4()
{
  return Context.init(idiom:)(v0, 0LL);
}

uint64_t sub_E4F8(uint64_t a1)
{
  return swift_storeEnumTagMultiPayload(v1, a1, 0LL);
}

uint64_t sub_E508@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_E514()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_E7E8(v0, qword_263C0);
  uint64_t v1 = sub_89CC(v0, (uint64_t)qword_263C0);
  if (qword_24350 != -1) {
    swift_once(&qword_24350, sub_E600);
  }
  uint64_t v2 = sub_89CC(v0, (uint64_t)qword_263D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_E5A4()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000012LL,  0x800000000001F5D0LL,  0x746C7561666564LL,  0xE700000000000000LL);
  qword_24AC0 = result;
  return result;
}

uint64_t sub_E600()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_E7E8(v0, qword_263D8);
  sub_89CC(v0, (uint64_t)qword_263D8);
  if (qword_24348 != -1) {
    swift_once(&qword_24348, sub_E5A4);
  }
  return Logger.init(_:)((id)qword_24AC0);
}

void sub_E680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v9 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v12 = sub_9CD4(0xD00000000000003BLL, 0x800000000001F580LL, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v10 + 4, v10 + 12);
    _os_log_impl(&dword_0, v8, v9, "%{public}s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL);
    sub_A7D0(v11);
    sub_A7D0((uint64_t)v10);
  }

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000003BLL,  0x800000000001F580LL,  a1,  a2,  a3,  a4,  0);
  __break(1u);
}

uint64_t *sub_E7E8(uint64_t a1, uint64_t *a2)
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

unint64_t sub_E828()
{
  unint64_t result = qword_24AC8[0];
  if (!qword_24AC8[0])
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, qword_24AC8);
  }

  return result;
}

uint64_t sub_E868(uint64_t a1)
{
  v2[0] = (char *)&value witness table for () + 64;
  v2[1] = (char *)&value witness table for Builtin.Int64 + 64;
  void v2[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[3] = "\b";
  v2[4] = "\b";
  v2[5] = &unk_1C290;
  return swift_initClassMetadata2(a1, 0LL, 6LL, v2, a1 + 104);
}

uint64_t sub_E8DC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[5];
  uint64_t v3 = *(void *)(*v0 + 80LL);
  uint64_t v4 = *(void *)(v1 + 96);
  uint64_t v5 = type metadata accessor for LRUCache.Entry(0LL, v3, *(void *)(v1 + 88), v4);
  uint64_t v6 = swift_bridgeObjectRetain(v2);
  uint64_t v7 = Dictionary.count.getter(v6, v3, v5, v4);
  swift_bridgeObjectRelease(v2);
  return v7;
}

void *sub_E948()
{
  return v0;
}

uint64_t sub_E97C()
{
  return swift_deallocClassInstance(v0, 73LL, 7LL);
}

uint64_t type metadata accessor for LRUCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_F16C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LRUCache);
}

uint64_t sub_E9A8(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 88));
    if (v4 <= 0x3F)
    {
      v6[1] = *(void *)(result - 8) + 64LL;
      uint64_t result = type metadata accessor for Date(319LL);
      if (v5 <= 0x3F)
      {
        void v6[2] = *(void *)(result - 8) + 64LL;
        v6[3] = "\b";
        v6[4] = "\b";
        uint64_t result = swift_initClassMetadata2(a1, 0LL, 5LL, v6, a1 + 104);
        if (!result) {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_EA60(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  os_log_type_t v9 = v8;
  uint64_t v10 = (void *)*v8;
  if (v8[6])
  {
    uint64_t v55 = v8[6];
    uint64_t v11 = v10[10];
    uint64_t v12 = v10[11];
    uint64_t v13 = v10[12];
    uint64_t v14 = type metadata accessor for LRUCache.Entry(0LL, v11, v12, v13);
    uint64_t WitnessTable = swift_getWitnessTable(&unk_1C318, v14);
    Sequence.lazy.getter(v53, v14, WitnessTable);
    uint64_t v55 = v53[0];
    char v16 = (void *)swift_allocObject(&unk_21728, 40LL, 7LL);
    v16[2] = v11;
    v16[3] = v12;
    v16[4] = v13;
    uint64_t v17 = type metadata accessor for LazySequence(0LL, v14, WitnessTable);
    uint64_t v18 = swift_getWitnessTable(&protocol conformance descriptor for LazySequence<A>, v17);
    LazySequenceProtocol.map<A>(_:)(v56, sub_F0E8, v16, v17, &type metadata for String, v18);
    swift_release(v16);
    swift_release(v55);
    uint64_t v19 = v57;
    __int128 v52 = *(_OWORD *)v56;
    *(_OWORD *)uint64_t v53 = *(_OWORD *)v56;
    uint64_t v54 = v57;
    uint64_t v20 = type metadata accessor for LazyMapSequence(0LL, v14, &type metadata for String, WitnessTable);
    uint64_t v21 = swift_getWitnessTable(&protocol conformance descriptor for LazyMapSequence<A, B>, v20);
    unint64_t v22 = sub_F0F4();
    uint64_t v23 = Sequence<>.joined(separator:)(538970668LL, 0xE400000000000000LL, v20, v21, v22);
    unint64_t v25 = v24;
    swift_release(v19);
    a1 = swift_release(v52);
  }

  else
  {
    uint64_t v23 = 0LL;
    unint64_t v25 = 0xE000000000000000LL;
  }

  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000LL) == 0) {
    uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v26)
  {
    *(void *)&v56[8] = 0xE400000000000000LL;
    sub_F2FC(a1, a2, a3, a4, a5, a6, a7, a8, v52, *((uint64_t *)&v52 + 1), v53[0], v53[1], v54, v55, 91);
    sub_F30C();
    v27._countAndFlagsBits = 23818LL;
    v27._object = (void *)0xE200000000000000LL;
    String.append(_:)(v27);
  }

  else
  {
    sub_F30C();
  }

  *(void *)char v56 = 0LL;
  *(void *)&v56[8] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(40LL);
  uint64_t v28 = *(void *)&v56[8];
  uint64_t v29 = _typeName(_:qualified:)(v10, 0LL);
  uint64_t v31 = v30;
  swift_bridgeObjectRelease(v28);
  *(void *)char v56 = v29;
  *(void *)&v56[8] = v31;
  v32._object = (void *)0xEB00000000203A79LL;
  v32._countAndFlagsBits = 0x7469636170616328LL;
  String.append(_:)(v32);
  if ((v9[9] & 1) != 0)
  {
    unint64_t v33 = 0xE300000000000000LL;
    uint64_t v34 = 7104878LL;
  }

  else
  {
    v53[0] = v9[8];
    unint64_t v35 = sub_F130();
    uint64_t v34 = BinaryInteger.description.getter(&type metadata for Int, v35);
    unint64_t v33 = v36;
  }

  unint64_t v37 = v33;
  String.append(_:)(*(Swift::String *)&v34);
  swift_bridgeObjectRelease(v33);
  v38._countAndFlagsBits = 0x3A746E756F63202CLL;
  v38._object = (void *)0xE900000000000020LL;
  String.append(_:)(v38);
  v53[0] = sub_E8DC();
  v39._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v39._object;
  String.append(_:)(v39);
  swift_bridgeObjectRelease(object);
  v41._countAndFlagsBits = 0x656972746E65202CLL;
  v41._object = (void *)0xEB00000000203A73LL;
  String.append(_:)(v41);
  sub_F2FC(v42, v43, v44, v45, v46, v47, v48, v49, v52, *((uint64_t *)&v52 + 1), v53[0], v53[1], v54, v55, v56[0]);
  sub_F30C();
  v50._countAndFlagsBits = 41LL;
  v50._object = (void *)0xE100000000000000LL;
  String.append(_:)(v50);
  return *(void *)v56;
}

uint64_t sub_EDA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v6 = type metadata accessor for LRUCache.Entry(0LL, a2, a3, a4);
  swift_retain(v10);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_1C3B0, v6);
  uint64_t result = String.init<A>(describing:)(&v10, v6, WitnessTable);
  *a5 = result;
  a5[1] = v9;
  return result;
}

uint64_t sub_EE14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  return sub_EA60(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_EE34()
{
  uint64_t v1 = *v0;
  DefaultStringInterpolation.appendInterpolation<A>(_:)((char *)v0 + *(void *)(*v0 + 104), *(void *)(*v0 + 80));
  v2._countAndFlagsBits = 8250LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  DefaultStringInterpolation.appendInterpolation<A>(_:)((char *)v0 + *(void *)(*v0 + 112), *(void *)(v1 + 88));
  return 0LL;
}

uint64_t sub_EEAC()
{
  return swift_retain(v0);
}

uint64_t sub_EEB4()
{
  uint64_t v1 = *v0;
  swift_retain(*v0);
  sub_EF08(v0);
  return v1;
}

uint64_t sub_EF08(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1) {
    uint64_t Strong = swift_weakLoadStrong(v2 + *(void *)(*(void *)v2 + 136LL));
  }
  else {
    uint64_t Strong = 0LL;
  }
  *a1 = Strong;
  return swift_release(v2);
}

uint64_t sub_EF4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_EEB4();
  *a1 = result;
  return result;
}

uint64_t *sub_EF70()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 80) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 104));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 112));
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 120);
  uint64_t v3 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  swift_weakDestroy((char *)v0 + *(void *)(*v0 + 128));
  swift_weakDestroy((char *)v0 + *(void *)(*v0 + 136));
  return v0;
}

uint64_t sub_F00C()
{
  uint64_t v0 = sub_EF70();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t type metadata accessor for LRUCache.Entry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_F16C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LRUCache.Entry);
}

uint64_t sub_F038(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1C380, a1);
}

uint64_t sub_F048()
{
  return sub_EE34();
}

uint64_t sub_F068@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_EEAC();
  uint64_t result = swift_release(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_F0A8()
{
  return 2LL;
}

uint64_t sub_F0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_F0D8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_F0E8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_EDA8(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t sub_F0F4()
{
  unint64_t result = qword_24BD0;
  if (!qword_24BD0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_24BD0);
  }

  return result;
}

unint64_t sub_F130()
{
  unint64_t result = qword_24BD8[0];
  if (!qword_24BD8[0])
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, qword_24BD8);
  }

  return result;
}

uint64_t sub_F16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  void v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_F198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32LL);
}

uint64_t *sub_F1A0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  swift_retain(v3);
  return a1;
}

uint64_t sub_F1CC(void *a1)
{
  return swift_release(*a1);
}

uint64_t *sub_F1D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v3);
  return a1;
}

void *sub_F20C(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t *sub_F218(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t sub_F248(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
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

uint64_t sub_F29C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }

  return result;
}

uint64_t type metadata accessor for LRUCache.Entry.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_F16C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LRUCache.Entry.Iterator);
}

void sub_F2FC( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  v17._countAndFlagsBits = v16;
  v17._object = v15;
  String.append(_:)(v17);
}

uint64_t sub_F30C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t AppIconView.init(appIcon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_F348(a1, (uint64_t (*)(void))&type metadata accessor for ImageElement.AppIcon, 1LL, a2);
}

uint64_t type metadata accessor for AppIconView(uint64_t a1)
{
  return sub_4DE4(a1, qword_24CC0, (uint64_t)&nominal type descriptor for AppIconView);
}

uint64_t AppIconView.init(visualProperty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_F348(a1, (uint64_t (*)(void))&type metadata accessor for VisualProperty, 2LL, a2);
}

uint64_t sub_F348@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)sub_124A4();
  uint64_t v9 = (void *)(a4 + v8[5]);
  uint64_t v10 = type metadata accessor for Context(0LL);
  sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  *uint64_t v9 = EnvironmentObject.init()(v10, v11);
  v9[1] = v12;
  uint64_t v13 = (void *)(a4 + v8[6]);
  *uint64_t v13 = swift_getKeyPath(&unk_1C430);
  uint64_t v14 = sub_47B4(&qword_24360);
  sub_124F8((uint64_t)v13, v14);
  uint64_t v15 = a4 + v8[7];
  *(void *)uint64_t v15 = swift_getKeyPath(&unk_1C460);
  *(_BYTE *)(v15 + 8) = 0;
  uint64_t v16 = v8[8];
  uint64_t v17 = sub_47B4(&qword_24638);
  sub_12494(v17, v18);
  *(_OWORD *)(a4 + v16) = v22;
  uint64_t v19 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32LL))(a4, a1, v19);
  uint64_t v20 = type metadata accessor for AppIconView.Model(0LL);
  return swift_storeEnumTagMultiPayload(a4, v20, a3);
}

void AppIconView.init(modelData:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = type metadata accessor for AppIconView.Model(0LL);
  sub_A76C();
  __chkstk_darwin(v7);
  uint64_t v30 = (void **)((char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_47B4(&qword_24C60);
  sub_A76C();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for ImageElement.AppIcon(0LL);
  uint64_t v31 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_124D4();
  uint64_t v13 = (int *)type metadata accessor for AppIconView(0LL);
  uint64_t v14 = (void *)(a3 + v13[5]);
  uint64_t v15 = type metadata accessor for Context(0LL);
  sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  void *v14 = EnvironmentObject.init()(v15, v16);
  v14[1] = v17;
  unint64_t v33 = v14;
  uint64_t v18 = (void *)(a3 + v13[6]);
  *uint64_t v18 = swift_getKeyPath(&unk_1C430);
  uint64_t v19 = sub_47B4(&qword_24360);
  swift_storeEnumTagMultiPayload(v18, v19, 0LL);
  uint64_t v20 = a3 + v13[7];
  *(void *)uint64_t v20 = swift_getKeyPath(&unk_1C460);
  *(_BYTE *)(v20 + 8) = 0;
  uint64_t v21 = (_OWORD *)(a3 + v13[8]);
  uint64_t v37 = 0LL;
  uint64_t v22 = sub_47B4(&qword_24638);
  State.init(wrappedValue:)(&v36, &v37, v22);
  Swift::String v32 = v21;
  _OWORD *v21 = v36;
  sub_9DA4(a1, a2);
  uint64_t v23 = v35;
  ImageElement.AppIcon.init(serializedData:)(a1, a2);
  if (v23)
  {
    uint64_t v24 = v34;
    swift_errorRelease(v23);
    sub_12548((uint64_t)v11, 1LL);
    sub_8D84((uint64_t)v11, &qword_24C60);
    uint64_t v25 = type metadata accessor for JSONDecoder(0LL);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    uint64_t v26 = JSONDecoder.init()();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v36,  &type metadata for String,  a1,  a2,  &type metadata for String,  &protocol witness table for String);
    sub_12500();
    swift_release(v26);
    uint64_t v28 = *((void *)&v36 + 1);
    uint64_t v29 = (uint64_t)v30;
    *uint64_t v30 = v36;
    *(void *)(v29 + 8) = v28;
    swift_storeEnumTagMultiPayload(v29, v24, 0LL);
    sub_1234C(v29, a3, type metadata accessor for AppIconView.Model);
  }

  else
  {
    sub_12548((uint64_t)v11, 0LL);
    sub_12500();
    Swift::String v27 = *(void (**)(uint64_t, char *, uint64_t))(v31 + 32);
    v27((uint64_t)v3, v11, v12);
    v27(a3, v3, v12);
    swift_storeEnumTagMultiPayload(a3, v34, 1LL);
  }

void sub_F79C(char a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  uint64_t v8 = sub_47B4(&qword_24918);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for RoundedRectangle(0LL);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (double *)((char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = (char *)v14 + *(int *)(v12 + 20);
  uint64_t v16 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v17 = type metadata accessor for RoundedCornerStyle(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104LL))(v15, v16, v17);
  double *v14 = a4;
  v14[1] = a4;
  sub_121BC((uint64_t)v14, (uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v18 = &v10[*(int *)(v8 + 36)];
  *uint64_t v18 = 0;
  v18[1] = a1;
  uint64_t v19 = sub_47B4(&qword_24E28);
  sub_12460((uint64_t)v10, (uint64_t)a3 + *(int *)(v19 + 36), &qword_24918);
  *a3 = a2;
  swift_retain(a2);
  sub_8D84((uint64_t)v10, &qword_24918);
  sub_8DF0((uint64_t)v14, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

void sub_F908()
{
}

void sub_F924()
{
}

void sub_F940(uint64_t a1)
{
}

void sub_F9A4()
{
  *uint64_t v0 = v1;
  sub_8E2C();
}

void sub_F9C0()
{
  *uint64_t v0 = v1;
  sub_8E2C();
}

void sub_F9DC(double *a1)
{
}

void sub_F9F4(double *a1)
{
}

uint64_t type metadata accessor for AppIconView.Model(uint64_t a1)
{
  return sub_4DE4(a1, qword_24D78, (uint64_t)&nominal type descriptor for AppIconView.Model);
}

uint64_t property wrapper backing initializer of AppIconView.appIconImage()
{
  uint64_t v0 = sub_47B4(&qword_24638);
  sub_12494(v0, v1);
  return v3;
}

uint64_t AppIconView.init(applicationBundleIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (int *)sub_124A4();
  uint64_t v7 = (void *)((char *)a3 + v6[5]);
  uint64_t v8 = type metadata accessor for Context(0LL);
  sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  *uint64_t v7 = EnvironmentObject.init()(v8, v9);
  v7[1] = v10;
  uint64_t v11 = (void *)((char *)a3 + v6[6]);
  *uint64_t v11 = swift_getKeyPath(&unk_1C430);
  uint64_t v12 = sub_47B4(&qword_24360);
  sub_124F8((uint64_t)v11, v12);
  uint64_t v13 = (char *)a3 + v6[7];
  *(void *)uint64_t v13 = swift_getKeyPath(&unk_1C460);
  v13[8] = 0;
  uint64_t v14 = v6[8];
  uint64_t v15 = sub_47B4(&qword_24638);
  sub_12494(v15, v16);
  *(_OWORD *)((char *)a3 + v14) = v19;
  *a3 = a1;
  a3[1] = a2;
  uint64_t v17 = type metadata accessor for AppIconView.Model(0LL);
  return sub_124F8((uint64_t)a3, v17);
}

uint64_t AppIconView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_FB8C(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_FB8C@<X0>(uint64_t *a1@<X8>)
{
  Swift::String v38 = a1;
  uint64_t v37 = sub_47B4(&qword_24DB0);
  __chkstk_darwin(v37);
  uint64_t v35 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = type metadata accessor for VisualProperty(0LL);
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ImageElement.AppIcon(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_47B4(&qword_24DB8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for AppIconView.Model(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_121BC(v1, (uint64_t)v14, v15);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v14, v12);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = (*(uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 32))(v8, v14, v5);
      uint64_t v18 = ImageElement.AppIcon.applicationBundleIdentifier.getter(v17);
      uint64_t v20 = v19;
      sub_FE34(v18, v19, (uint64_t)v11);
      swift_bridgeObjectRelease(v20);
      unint64_t v21 = sub_12024();
      uint64_t v22 = AnyView.init<A>(_:)(v11, v9, v21);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }

    else
    {
      uint64_t v27 = v34;
      uint64_t v28 = v36;
      uint64_t v29 = (*(uint64_t (**)(char *, uint64_t *, uint64_t))(v34 + 32))(v4, v14, v36);
      uint64_t v30 = v35;
      uint64_t v31 = VisualProperty.view.getter(v29);
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v31,  &opaque type descriptor for <<opaque return type of VisualProperty.view>>,  1LL);
      uint64_t v22 = AnyView.init<A>(_:)(v30, v37, OpaqueTypeConformance2);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v4, v28);
    }
  }

  else
  {
    uint64_t v24 = *v14;
    uint64_t v25 = v14[1];
    sub_FE34(v24, v25, (uint64_t)v11);
    swift_bridgeObjectRelease(v25);
    unint64_t v26 = sub_12024();
    uint64_t result = AnyView.init<A>(_:)(v11, v9, v26);
    uint64_t v22 = result;
  }

  *Swift::String v38 = v22;
  return result;
}

uint64_t sub_FE24(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of AppIconView.body>>,  1LL);
}

uint64_t sub_FE34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v5 = type metadata accessor for TaskPriority(0LL);
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  __chkstk_darwin(v5);
  int v47 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for AppIconView(0LL);
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v43 + 64);
  __chkstk_darwin(v7);
  uint64_t v44 = (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_47B4(&qword_24DF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_47B4(&qword_24DE0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_47B4(&qword_24DD0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_10180();
  if ((v20 & 1) != 0) {
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a3, 1LL, 1LL, v15);
  }
  uint64_t v21 = v18;
  uint64_t v22 = v19;
  *(void *)uint64_t v11 = static HorizontalAlignment.center.getter();
  *((void *)v11 + 1) = 0LL;
  v11[16] = 1;
  uint64_t v23 = sub_47B4(&qword_24DF8);
  sub_10314(v3, (uint64_t)&v11[*(int *)(v23 + 44)]);
  uint64_t v25 = static Alignment.center.getter(v24);
  _FrameLayout.init(width:height:alignment:)(v50, v21, 0LL, v22, 0LL, v25, v26);
  uint64_t v42 = a3;
  sub_12460((uint64_t)v11, (uint64_t)v14, &qword_24DF0);
  uint64_t v27 = &v14[*(int *)(v12 + 36)];
  __int128 v28 = v50[1];
  *(_OWORD *)uint64_t v27 = v50[0];
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v50[2];
  sub_8D84((uint64_t)v11, &qword_24DF0);
  uint64_t v29 = v44;
  sub_121BC(v3, v44, type metadata accessor for AppIconView);
  uint64_t v30 = *(unsigned __int8 *)(v43 + 80);
  uint64_t v31 = (v30 + 48) & ~v30;
  Swift::String v32 = (void *)swift_allocObject(&unk_21828, v31 + v8, v30 | 7);
  uint64_t v33 = v46;
  v32[2] = v45;
  v32[3] = v33;
  v32[4] = v21;
  v32[5] = v22;
  sub_1234C(v29, (uint64_t)v32 + v31, type metadata accessor for AppIconView);
  uint64_t v34 = swift_bridgeObjectRetain(v33);
  uint64_t v35 = v47;
  static TaskPriority.userInitiated.getter(v34);
  uint64_t v36 = &v17[*(int *)(v15 + 36)];
  uint64_t v37 = type metadata accessor for _TaskModifier(0LL);
  uint64_t v39 = v48;
  uint64_t v38 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(&v36[*(int *)(v37 + 20)], v35, v49);
  *(void *)uint64_t v36 = &unk_24E08;
  *((void *)v36 + 1) = v32;
  sub_12460((uint64_t)v14, (uint64_t)v17, &qword_24DE0);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v38);
  sub_8D84((uint64_t)v14, &qword_24DE0);
  uint64_t v40 = v42;
  sub_12438((uint64_t)v17, v42, &qword_24DD0);
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v40, 0LL, 1LL, v15);
}

uint64_t sub_10180()
{
  uint64_t v1 = sub_47B4(&qword_24838);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1097C((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1LL, v4) == 1)
  {
    sub_8D84((uint64_t)v3, &qword_24838);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v9 = v0 + *(int *)(type metadata accessor for AppIconView(0LL) + 20);
    if (*(void *)v9)
    {
      id v10 = *(id *)v9;
      double v11 = static ImageElement.size(for:context:)(v7, v10);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return *(void *)&v11;
    }

    else
    {
      uint64_t v12 = *(void *)(v9 + 8);
      uint64_t v13 = type metadata accessor for Context(0LL);
      sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
      uint64_t result = EnvironmentObject.error()(0LL, v12, v13, v14);
      __break(1u);
    }
  }

  return result;
}

void sub_10314(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_47B4(&qword_24E20);
  __chkstk_darwin(v8);
  id v10 = (void *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __int128 v17 = *(_OWORD *)(a1 + *(int *)(type metadata accessor for AppIconView(0LL) + 32));
  uint64_t v11 = sub_47B4(&qword_24E10);
  State.wrappedValue.getter(v11);
  uint64_t v12 = v18;
  if (v18)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v13 = Image.resizable(capInsets:resizingMode:)(v7, v12, 0.0, 0.0, 0.0, 0.0);
    swift_release(v12);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_104AC();
    sub_F79C(1, v13, v10, v14);
    swift_release(v13);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  uint64_t v16 = sub_47B4(&qword_24E28);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, v15, 1LL, v16);
  sub_12438((uint64_t)v10, a2, &qword_24E20);
}

void sub_104AC()
{
  uint64_t v1 = sub_47B4(&qword_24838);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1097C((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1LL, v4) == 1)
  {
    sub_8D84((uint64_t)v3, &qword_24838);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v8 = v0 + *(int *)(type metadata accessor for AppIconView(0LL) + 20);
    if (*(void *)v8)
    {
      id v9 = *(id *)v8;
      static ImageElement.cornerRadius(for:context:)(v7, v9);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    else
    {
      uint64_t v10 = *(void *)(v8 + 8);
      uint64_t v11 = type metadata accessor for Context(0LL);
      sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
      EnvironmentObject.error()(0LL, v10, v11, v12);
      __break(1u);
    }
  }

uint64_t sub_10628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  v3[8] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[9] = v5;
  v3[10] = v6;
  return swift_task_switch(sub_10698, v5, v6);
}

uint64_t sub_10698()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_10808();
  uint64_t v2 = sub_124A4();
  *(void *)(v0 + 88) = v2;
  uint64_t v3 = v1 + *(int *)(v2 + 28);
  uint64_t v4 = *(void *)v3;
  char v5 = *(_BYTE *)(v3 + 8);
  sub_BC38(*(void *)v3, v5);
  sub_16200();
  sub_BDD8(v4, v5);
  return swift_task_switch(sub_10710, 0LL, 0LL);
}

uint64_t sub_10710()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___UIImage);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = objc_msgSend(v1, "tvsui_applicationIconImageForBundleIdentifier:", v2);

  v0[12] = Image.init(nativeImage:)(v3);
  return swift_task_switch(sub_1079C, v0[9], v0[10]);
}

uint64_t sub_1079C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 56);
  swift_release(*(void *)(v0 + 64));
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v3 + *(int *)(v1 + 32));
  *(void *)(v0 + 32) = v2;
  uint64_t v4 = sub_47B4(&qword_24E10);
  State.wrappedValue.setter(v0 + 32, v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10808()
{
  uint64_t v1 = sub_47B4(&qword_24838);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1097C((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1LL, v4) == 1)
  {
    sub_8D84((uint64_t)v3, &qword_24838);
    char v8 = 0;
    return v8 & 1;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  uint64_t v9 = v0 + *(int *)(type metadata accessor for AppIconView(0LL) + 20);
  if (*(void *)v9)
  {
    id v10 = *(id *)v9;
    char v8 = static ImageElement.isCircularImageStyle(_:context:)(v7, v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v8 & 1;
  }

  uint64_t v12 = *(void *)(v9 + 8);
  uint64_t v13 = type metadata accessor for Context(0LL);
  sub_123FC( (unint64_t *)&qword_24358,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  uint64_t result = EnvironmentObject.error()(0LL, v12, v13, v14);
  __break(1u);
  return result;
}

void sub_1097C(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = sub_47B4(&qword_24838);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v31 - v10;
  uint64_t v12 = type metadata accessor for ImageElement.AppIcon(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for AppIconView.Model(0LL);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v31[1] = v2;
  sub_121BC(v2, (uint64_t)v18, v19);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v18, v16);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v33, 1LL, 1LL, v6);
      sub_8DF0((uint64_t)v18, type metadata accessor for AppIconView.Model);
      return;
    }

    uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v15, v18, v12);
    ImageElement.AppIcon.imageStyle.getter(v21);
    uint64_t v22 = v32;
    (*(void (**)(char *, void, uint64_t))(v32 + 104))( v9,  enum case for ImageElement.ImageStyle.default(_:),  v6);
    sub_123FC( &qword_24E18,  (uint64_t (*)(uint64_t))&type metadata accessor for ImageElement.ImageStyle,  (uint64_t)&protocol conformance descriptor for ImageElement.ImageStyle);
    char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v9, v6, v23);
    uint64_t v25 = *(void (**)(char *, uint64_t))(v22 + 8);
    v25(v9, v6);
    uint64_t v26 = ((uint64_t (*)(char *, uint64_t))v25)(v11, v6);
    if ((v24 & 1) != 0)
    {
      type metadata accessor for AppIconView(0LL);
      sub_161B8();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      return;
    }

    uint64_t v29 = v33;
    ImageElement.AppIcon.imageStyle.getter(v26);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v30 = v29;
  }

  else
  {
    sub_8DF0((uint64_t)v18, type metadata accessor for AppIconView.Model);
    type metadata accessor for AppIconView(0LL);
    sub_161B8();
    int v27 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v5, 1LL, v6);
    uint64_t v28 = v33;
    if (v27 == 1)
    {
      (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))( v33,  enum case for ImageElement.ImageStyle.appIcon2(_:),  v6);
      sub_8D84((uint64_t)v5, &qword_24838);
    }

    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v33, v5, v6);
    }

    uint64_t v30 = v28;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v30, 0LL, 1LL, v6);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppIconView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    uint64_t v7 = type metadata accessor for AppIconView.Model(0LL);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v7);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v14 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v4, a2, v14);
      uint64_t v10 = v4;
      uint64_t v11 = v7;
      uint64_t v12 = 2LL;
    }

    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v4, a2, v9);
      uint64_t v10 = v4;
      uint64_t v11 = v7;
      uint64_t v12 = 1LL;
    }

    else
    {
      uint64_t v15 = a2[1];
      *uint64_t v4 = *a2;
      v4[1] = v15;
      swift_bridgeObjectRetain(v15);
      uint64_t v10 = v4;
      uint64_t v11 = v7;
      uint64_t v12 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v10, v11, v12);
    uint64_t v16 = a3[5];
    uint64_t v17 = a3[6];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (char *)a2 + v16;
    uint64_t v21 = *(void **)v19;
    uint64_t v20 = *((void *)v19 + 1);
    *uint64_t v18 = v21;
    v18[1] = v20;
    uint64_t v22 = (uint64_t *)((char *)v4 + v17);
    uint64_t v23 = (uint64_t *)((char *)a2 + v17);
    id v24 = v21;
    uint64_t v25 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v23, v25) == 1)
    {
      uint64_t v26 = type metadata accessor for ImageElement.ImageStyle(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v23, 1LL, v26))
      {
        uint64_t v27 = sub_47B4(&qword_24838);
        memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64LL));
        uint64_t v28 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v22, v23, v26);
        uint64_t v28 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v22, 0LL, 1LL, v26);
      }
    }

    else
    {
      uint64_t v29 = *v23;
      *uint64_t v22 = *v23;
      swift_retain(v29);
      uint64_t v28 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v22, v25, v28);
    uint64_t v30 = a3[7];
    uint64_t v31 = (char *)v4 + v30;
    uint64_t v32 = (char *)a2 + v30;
    uint64_t v33 = *(void *)v32;
    char v34 = v32[8];
    sub_BC38(*(void *)v32, v34);
    *(void *)uint64_t v31 = v33;
    v31[8] = v34;
    uint64_t v35 = a3[8];
    uint64_t v36 = (uint64_t *)((char *)v4 + v35);
    uint64_t v37 = (uint64_t *)((char *)a2 + v35);
    uint64_t v38 = *v37;
    uint64_t v13 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v13;
    swift_retain(v38);
  }

  swift_retain(v13);
  return v4;
}

uint64_t destroy for AppIconView(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for AppIconView.Model(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a1, v4);
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v6 = type metadata accessor for VisualProperty(0LL);
LABEL_7:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
      break;
    case 1:
      uint64_t v6 = type metadata accessor for ImageElement.AppIcon(0LL);
      goto LABEL_7;
    case 0:
      swift_bridgeObjectRelease(*(void *)(a1 + 8));
      break;
  }

  uint64_t v7 = (void *)(a1 + a2[6]);
  uint64_t v8 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for ImageElement.ImageStyle(0LL);
  }

  else
  {
    swift_release(*v7);
  }

  sub_BDD8(*(void *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  uint64_t v10 = (void *)(a1 + a2[8]);
  swift_release(*v10);
  return swift_release(v10[1]);
}

void *initializeWithCopy for AppIconView(void *a1, void *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppIconView.Model(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v12 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    uint64_t v11 = 2LL;
  }

  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for ImageElement.AppIcon(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    uint64_t v11 = 1LL;
  }

  else
  {
    uint64_t v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    swift_bridgeObjectRetain(v13);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    uint64_t v11 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v9, v10, v11);
  uint64_t v14 = a3[5];
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (char *)a2 + v14;
  uint64_t v19 = *(void **)v17;
  uint64_t v18 = *((void *)v17 + 1);
  *uint64_t v16 = v19;
  v16[1] = v18;
  uint64_t v20 = (void *)((char *)a1 + v15);
  uint64_t v21 = (void *)((char *)a2 + v15);
  id v22 = v19;
  uint64_t v23 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v21, v23) == 1)
  {
    uint64_t v24 = type metadata accessor for ImageElement.ImageStyle(0LL);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v21, 1LL, v24))
    {
      uint64_t v25 = sub_47B4(&qword_24838);
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64LL));
      uint64_t v26 = 1LL;
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v20, v21, v24);
      uint64_t v26 = 1LL;
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v20, 0LL, 1LL, v24);
    }
  }

  else
  {
    uint64_t v27 = *v21;
    uint64_t *v20 = *v21;
    swift_retain(v27);
    uint64_t v26 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v20, v23, v26);
  uint64_t v28 = a3[7];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)v30;
  char v32 = v30[8];
  sub_BC38(*(void *)v30, v32);
  *(void *)uint64_t v29 = v31;
  v29[8] = v32;
  uint64_t v33 = a3[8];
  char v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  uint64_t v36 = *v35;
  uint64_t v37 = v35[1];
  *char v34 = *v35;
  v34[1] = v37;
  swift_retain(v36);
  swift_retain(v37);
  return a1;
}

void *assignWithCopy for AppIconView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for AppIconView.Model);
    uint64_t v6 = type metadata accessor for AppIconView.Model(0LL);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v12 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
      uint64_t v9 = a1;
      uint64_t v10 = v6;
      uint64_t v11 = 2LL;
    }

    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
      uint64_t v9 = a1;
      uint64_t v10 = v6;
      uint64_t v11 = 1LL;
    }

    else
    {
      *a1 = *a2;
      uint64_t v13 = a2[1];
      a1[1] = v13;
      swift_bridgeObjectRetain(v13);
      uint64_t v9 = a1;
      uint64_t v10 = v6;
      uint64_t v11 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v10, v11);
  }

  uint64_t v14 = a3[5];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void **)((char *)a1 + v14);
  uint64_t v18 = *(void **)((char *)a2 + v14);
  void *v15 = v18;
  id v19 = v18;

  v15[1] = *((void *)v16 + 1);
  if (a1 != a2)
  {
    uint64_t v20 = a3[6];
    uint64_t v21 = (void *)((char *)a1 + v20);
    id v22 = (void *)((char *)a2 + v20);
    sub_8D84((uint64_t)a1 + v20, &qword_24360);
    uint64_t v23 = sub_47B4(&qword_24360);
    if (swift_getEnumCaseMultiPayload(v22, v23) == 1)
    {
      uint64_t v24 = type metadata accessor for ImageElement.ImageStyle(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v22, 1LL, v24))
      {
        uint64_t v25 = sub_47B4(&qword_24838);
        memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64LL));
        uint64_t v26 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v24 - 8) + 16LL))(v21, v22, v24);
        uint64_t v26 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v21, 0LL, 1LL, v24);
      }
    }

    else
    {
      uint64_t v27 = *v22;
      uint64_t *v21 = *v22;
      swift_retain(v27);
      uint64_t v26 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v21, v23, v26);
  }

  uint64_t v28 = a3[7];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)v30;
  char v32 = v30[8];
  sub_BC38(*(void *)v30, v32);
  uint64_t v33 = *(void *)v29;
  char v34 = v29[8];
  *(void *)uint64_t v29 = v31;
  v29[8] = v32;
  sub_BDD8(v33, v34);
  uint64_t v35 = a3[8];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v38 = *(void *)((char *)a1 + v35);
  uint64_t v39 = *v37;
  *(void *)((char *)a1 + v35) = *v37;
  swift_retain(v39);
  swift_release(v38);
  uint64_t v40 = *((void *)v36 + 1);
  uint64_t v41 = v37[1];
  *((void *)v36 + 1) = v41;
  swift_retain(v41);
  swift_release(v40);
  return a1;
}

char *initializeWithTake for AppIconView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppIconView.Model(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v12 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a1, a2, v12);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    uint64_t v11 = 2LL;
    goto LABEL_5;
  }

  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for ImageElement.AppIcon(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    uint64_t v11 = 1LL;
LABEL_5:
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    goto LABEL_7;
  }

  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
LABEL_7:
  uint64_t v13 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
  {
    uint64_t v17 = type metadata accessor for ImageElement.ImageStyle(0LL);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1LL, v17))
    {
      uint64_t v18 = sub_47B4(&qword_24838);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32LL))(v14, v15, v17);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0LL, 1LL, v17);
    }

    swift_storeEnumTagMultiPayload(v14, v16, 1LL);
  }

  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  uint64_t v19 = a3[7];
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v19];
  id v22 = &a2[v19];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  *(_OWORD *)&a1[v20] = *(_OWORD *)&a2[v20];
  return a1;
}

char *assignWithTake for AppIconView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for AppIconView.Model);
    uint64_t v6 = type metadata accessor for AppIconView.Model(0LL);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v12 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a1, a2, v12);
      uint64_t v9 = a1;
      uint64_t v10 = v6;
      uint64_t v11 = 2LL;
      goto LABEL_6;
    }

    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
      uint64_t v9 = a1;
      uint64_t v10 = v6;
      uint64_t v11 = 1LL;
LABEL_6:
      swift_storeEnumTagMultiPayload(v9, v10, v11);
      goto LABEL_8;
    }

    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

uint64_t getEnumTagSinglePayload for AppIconView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_118C0);
}

uint64_t sub_118C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_12518();
  if (v7 == (_DWORD)v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, v3, v8);
  }

  if ((_DWORD)v3 != 2147483646)
  {
    uint64_t v8 = sub_47B4(&qword_24848);
    uint64_t v9 = v4 + *(int *)(a3 + 24);
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, v3, v8);
  }

  unint64_t v10 = *(void *)(v4 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIconView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11964);
}

void sub_11964(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_12518();
  if (v9 == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(v5 + *(int *)(a4 + 20)) = v4;
      sub_1253C();
      return;
    }

    uint64_t v10 = sub_47B4(&qword_24848);
    uint64_t v11 = v5 + *(int *)(a4 + 24);
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, v4, v4, v10);
}

void sub_119E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppIconView.Model(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = &unk_1C4F8;
    sub_11A7C(319LL);
    if (v5 <= 0x3F)
    {
      void v6[2] = *(void *)(v4 - 8) + 64LL;
      void v6[3] = &unk_1C510;
      v6[4] = &unk_1C4F8;
      swift_initStructMetadata(a1, 256LL, 5LL, v6, a1 + 16);
    }
  }

void sub_11A7C(uint64_t a1)
{
  if (!qword_248C0)
  {
    uint64_t v2 = sub_67CC(&qword_24838);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_248C0);
    }
  }

void *sub_11AD4()
{
  return &protocol witness table for AnyView;
}

uint64_t *sub_11AE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v12);
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v13 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(a1, a2, v13);
      int v9 = a1;
      uint64_t v10 = a3;
      uint64_t v11 = 2LL;
    }

    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
      int v9 = a1;
      uint64_t v10 = a3;
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
      int v9 = a1;
      uint64_t v10 = a3;
      uint64_t v11 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_11BD4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((_DWORD)result)
  {
    case 2:
      uint64_t v4 = type metadata accessor for VisualProperty(0LL);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
    case 1:
      uint64_t v4 = type metadata accessor for ImageElement.AppIcon(0LL);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
    case 0:
      return swift_bridgeObjectRelease(*(void *)(a1 + 8));
  }

  return result;
}

void *sub_11C48(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v11 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 2LL;
  }

  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = type metadata accessor for ImageElement.AppIcon(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 1LL;
  }

  else
  {
    uint64_t v12 = a2[1];
    *a1 = *a2;
    a1[1] = v12;
    swift_bridgeObjectRetain();
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  return a1;
}

void *sub_11D10(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for AppIconView.Model);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v11 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 2LL;
    }

    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    else
    {
      *a1 = *a2;
      uint64_t v12 = a2[1];
      a1[1] = v12;
      swift_bridgeObjectRetain(v12);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

void *sub_11DF8(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v11 = type metadata accessor for VisualProperty(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 2LL;
  }

  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      return a1;
    }

    uint64_t v7 = type metadata accessor for ImageElement.AppIcon(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    uint64_t v8 = a1;
    uint64_t v9 = a3;
    uint64_t v10 = 1LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  return a1;
}

void *sub_11EBC(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8DF0((uint64_t)a1, type metadata accessor for AppIconView.Model);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v11 = type metadata accessor for VisualProperty(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 2LL;
    }

    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        return a1;
      }

      uint64_t v7 = type metadata accessor for ImageElement.AppIcon(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

uint64_t sub_11F98(uint64_t a1)
{
  v5[0] = &unk_1C530;
  uint64_t result = type metadata accessor for ImageElement.AppIcon(319LL);
  if (v3 <= 0x3F)
  {
    v5[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for VisualProperty(319LL);
    if (v4 <= 0x3F)
    {
      v5[2] = *(void *)(result - 8) + 64LL;
      swift_initEnumMetadataMultiPayload(a1, 256LL, 3LL, v5);
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_12024()
{
  unint64_t result = qword_24DC0;
  if (!qword_24DC0)
  {
    uint64_t v1 = sub_67CC(&qword_24DB8);
    sub_12088();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_24DC0);
  }

  return result;
}

unint64_t sub_12088()
{
  unint64_t result = qword_24DC8;
  if (!qword_24DC8)
  {
    uint64_t v1 = sub_67CC(&qword_24DD0);
    sub_1210C();
    sub_123FC( &qword_244D0,  (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier,  (uint64_t)&protocol conformance descriptor for _TaskModifier);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24DC8);
  }

  return result;
}

unint64_t sub_1210C()
{
  unint64_t result = qword_24DD8;
  if (!qword_24DD8)
  {
    uint64_t v1 = sub_67CC(&qword_24DE0);
    sub_12178();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24DD8);
  }

  return result;
}

unint64_t sub_12178()
{
  unint64_t result = qword_24DE8;
  if (!qword_24DE8)
  {
    uint64_t v1 = sub_67CC(&qword_24DF0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_24DE8);
  }

  return result;
}

void sub_121BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_124AC(a1, a2, a3);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_8E2C();
}

uint64_t sub_121E4()
{
  uint64_t v1 = (int *)sub_124A4();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  uint64_t v6 = v0 + v4;
  uint64_t v7 = type metadata accessor for AppIconView.Model(0LL);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v0 + v4, v7);
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v9 = type metadata accessor for VisualProperty(0LL);
LABEL_7:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v0 + v4, v9);
      break;
    case 1:
      uint64_t v9 = type metadata accessor for ImageElement.AppIcon(0LL);
      goto LABEL_7;
    case 0:
      swift_bridgeObjectRelease(*(void *)(v6 + 8));
      break;
  }

  uint64_t v10 = (void *)(v6 + v1[6]);
  uint64_t v11 = sub_47B4(&qword_24360);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    uint64_t v12 = type metadata accessor for ImageElement.ImageStyle(0LL);
  }

  else
  {
    swift_release(*v10);
  }

  sub_BDD8(*(void *)(v6 + v1[7]), *(_BYTE *)(v6 + v1[7] + 8));
  uint64_t v13 = (void *)(v6 + v1[8]);
  swift_release(*v13);
  swift_release(v13[1]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_1234C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_124AC(a1, a2, a3);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_8E2C();
}

uint64_t sub_12374()
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(sub_124A4() - 8) + 80LL);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = v0 + ((v2 + 48) & ~v2);
  uint64_t v6 = (void *)swift_task_alloc(dword_24E04);
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_CE48;
  return sub_10628(v3, v4, v5);
}

void sub_123FC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_8E2C();
}

void sub_12438(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_124C0(a1, a2, a3);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_8E2C();
}

void sub_12460(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_124C0(a1, a2, a3);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_8E2C();
}

uint64_t sub_12488@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void *sub_12494(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3 = va_arg(va1, void);
  return State.init(wrappedValue:)((uint64_t *)va1, (uint64_t *)va, a1);
}

uint64_t sub_124A4()
{
  return type metadata accessor for AppIconView(0LL);
}

uint64_t sub_124AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_124C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_47B4(a3);
}

  ;
}

uint64_t sub_124EC()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_124F8(uint64_t a1, uint64_t a2)
{
  return swift_storeEnumTagMultiPayload(a1, a2, 0LL);
}

uint64_t sub_12500()
{
  return sub_9DE8(v1, v0);
}

uint64_t sub_1250C(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_12518()
{
  return type metadata accessor for AppIconView.Model(0LL);
}

  ;
}

uint64_t sub_12548(uint64_t a1, uint64_t a2)
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, a2, 1LL, v2);
}

uint64_t CoreChartPluginView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
}

uint64_t sub_12590(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of CoreChartPluginView.body>>,  1LL);
}

uint64_t initializeBufferWithCopyOfBuffer for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for CoreChartPluginView(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CoreChart(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t initializeWithCopy for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreChart(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CoreChartPluginView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1272C);
}

uint64_t sub_1272C()
{
  uint64_t v2 = sub_12830();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for CoreChartPluginView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1275C);
}

uint64_t sub_1275C()
{
  uint64_t v2 = sub_12830();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v2);
}

uint64_t type metadata accessor for CoreChartPluginView(uint64_t a1)
{
  uint64_t result = qword_24E88;
  if (!qword_24E88) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CoreChartPluginView);
  }
  return result;
}

uint64_t sub_127BC(uint64_t a1)
{
  uint64_t result = type metadata accessor for CoreChart(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void *sub_12824()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_12830()
{
  return type metadata accessor for CoreChart(0LL);
}

uint64_t IntentsUIStandardView.init(modelData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for IntentsUIStandard(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (int *)type metadata accessor for IntentsUIStandardView(0LL);
  uint64_t v11 = a3 + v10[5];
  uint64_t v12 = type metadata accessor for Context(0LL);
  sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  *(void *)uint64_t v11 = EnvironmentObject.init()(v12, v13);
  *(void *)(v11 + 8) = v14;
  uint64_t v15 = (void *)(a3 + v10[6]);
  void *v15 = swift_getKeyPath(&unk_1C5D0);
  uint64_t v16 = sub_47B4(&qword_24368);
  swift_storeEnumTagMultiPayload(v15, v16, 0LL);
  uint64_t v17 = a3 + v10[7];
  _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA6LL9SnippetUI06ActionG0Vvpfi_0();
  sub_8DBC(&qword_24710, (uint64_t (*)(uint64_t))&type metadata accessor for IntentsUIStandard);
  uint64_t v18 = v22[1];
  ProtobufBuilder.init(serializedData:)(a1, a2, v6, v19);
  if (!v18) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
  }

  sub_8D84((uint64_t)v15, &qword_24718);
  uint64_t v20 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8LL))(v17, v20);
}

uint64_t type metadata accessor for IntentsUIStandardView(uint64_t a1)
{
  uint64_t result = qword_24F58;
  if (!qword_24F58) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for IntentsUIStandardView);
  }
  return result;
}

uint64_t IntentsUIStandardView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1419C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_12A54()
{
  return EnvironmentValues.response.getter();
}

uint64_t sub_12A74()
{
  return EnvironmentValues.response.getter();
}

void sub_12A94(uint64_t a1)
{
  uint64_t v3 = sub_47B4(&qword_24EF8);
  __chkstk_darwin(v3);
  sub_124D4();
  sub_140AC(a1, v1, &qword_24EF8);
  EnvironmentValues.response.setter(v1);
  sub_1253C();
}

void IntentsUIStandardView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_141A4();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = sub_47B4(&qword_24EC0);
  __chkstk_darwin(v7);
  sub_124D4();
  *(void *)uint64_t v2 = static HorizontalAlignment.center.getter();
  *(void *)(v2 + 8) = 0LL;
  *(_BYTE *)(v2 + 16) = 1;
  sub_47B4(&qword_24EC8);
  uint64_t v23 = IntentsUIStandard.slots.getter();
  uint64_t KeyPath = swift_getKeyPath(&unk_1C608);
  sub_12E58(v1, (uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  uint64_t v11 = swift_allocObject(&unk_218D0, v10 + v6, v9 | 7);
  sub_12F9C((uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11 + v10);
  uint64_t v12 = sub_47B4(&qword_24ED0);
  uint64_t v13 = sub_47B4(&qword_24ED8);
  sub_8D50(&qword_24EE0, &qword_24ED0);
  uint64_t v15 = v14;
  sub_8DBC(&qword_24EE8, (uint64_t (*)(uint64_t))&type metadata accessor for IntentsUIStandard.Slot);
  uint64_t v17 = v16;
  unint64_t v18 = sub_13028();
  double v19 = ForEach<>.init(_:id:content:)(&v23, KeyPath, sub_12FE0, v11, v12, v13, v15, v17, v18);
  uint64_t v20 = static Alignment.center.getter(v19);
  sub_131F0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v20, v21);
  sub_8D84(v2, &qword_24EC0);
}

void sub_12D08(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Response(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_47B4(&qword_24FB8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  IntentsUIStandard.Slot.fallback.getter(v13, v7);
  sub_13084((uint64_t)v5);
  static AnyComponent.wrapper(for:response:)(v13, v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_A080(v13);
  uint64_t v10 = type metadata accessor for AnyComponent(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1LL, v10) == 1)
  {
    sub_8D84((uint64_t)v9, &qword_24FB8);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = AnyComponent.view.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  }

  *a1 = v11;
}

uint64_t sub_12E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentsUIStandardView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_12E9C()
{
  uint64_t v1 = sub_141A4();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_1419C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v0 + v4, v6);

  uint64_t v7 = (void *)(v0 + v4 + *(int *)(v1 + 24));
  uint64_t v8 = sub_47B4(&qword_24368);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for Response(0LL);
  }

  else
  {
    swift_release(*v7);
  }

  uint64_t v10 = sub_8EBC();
  sub_8E18(v10);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_12F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentsUIStandardView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_12FE0(uint64_t *a1@<X8>)
{
}

unint64_t sub_13028()
{
  unint64_t result = qword_24EF0;
  if (!qword_24EF0)
  {
    uint64_t v1 = sub_67CC(&qword_24ED8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_24EF0);
  }

  return result;
}

uint64_t sub_13084@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_47B4(&qword_24EF8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for IntentsUIStandardView(0LL);
  sub_1648C();
  uint64_t v9 = type metadata accessor for Response(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v8, 1LL, v9) == 1)
  {
    sub_8D84((uint64_t)v8, &qword_24EF8);
    if (qword_24340 != -1) {
      swift_once(&qword_24340, sub_E514);
    }
    uint64_t v11 = sub_89CC(v2, (uint64_t)qword_263C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    sub_E680((uint64_t)"SystemPlugin/IntentsUIStandardView.swift", 40LL, 2LL, 77LL);
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(a1, v8, v9);
}

void *sub_131F0@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  uint64_t v18 = a15;
  double v19 = a12;
  double v20 = a10;
  uint64_t v21 = a2 & 1;
  double v22 = a1;
  if ((_DWORD)v21) {
    double v22 = -INFINITY;
  }
  uint64_t v23 = a4 & 1;
  double v24 = a3;
  if ((a4 & 1) != 0) {
    double v24 = v22;
  }
  uint64_t v25 = a6 & 1;
  uint64_t v26 = a8 & 1;
  double v27 = a5;
  if ((a6 & 1) != 0) {
    double v27 = v24;
  }
  if (v22 > v24 || v24 > v27) {
    goto LABEL_22;
  }
  double v29 = a7;
  if ((a8 & 1) != 0) {
    double v29 = -INFINITY;
  }
  double v30 = a10;
  if ((a11 & 1) != 0) {
    double v30 = v29;
  }
  double v31 = a12;
  if ((a13 & 1) != 0) {
    double v31 = v30;
  }
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    double v40 = a5;
    double v41 = a7;
    double v39 = a3;
    double v38 = a1;
    unsigned int v37 = v21;
    uint64_t v33 = static os_log_type_t.fault.getter();
    char v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v33,  &dword_0,  v34,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v18 = a15;
    uint64_t v21 = v37;
    a1 = v38;
    double v20 = a10;
    a3 = v39;
    double v19 = a12;
    a5 = v40;
    a7 = v41;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v21,  *(void *)&a3,  v23,  *(void *)&a5,  v25,  *(void *)&a7,  v26,  *(void *)&v20,  a11 & 1,  *(void *)&v19,  a13 & 1,  a14,  v18);
  sub_140AC(v16, a9, &qword_24EC0);
  uint64_t v35 = sub_47B4(&qword_24FA8);
  return memcpy((void *)(a9 + *(int *)(v35 + 36)), __src, 0x70uLL);
}

uint64_t sub_1338C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of IntentsUIStandardView.body>>,  1LL);
}

uint64_t *sub_1339C@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  uint64_t v18 = a15;
  double v19 = a12;
  double v20 = a10;
  uint64_t v21 = a2 & 1;
  double v22 = a1;
  if ((_DWORD)v21) {
    double v22 = -INFINITY;
  }
  uint64_t v23 = a4 & 1;
  double v24 = a3;
  if ((a4 & 1) != 0) {
    double v24 = v22;
  }
  uint64_t v25 = a6 & 1;
  uint64_t v26 = a8 & 1;
  double v27 = a5;
  if ((a6 & 1) != 0) {
    double v27 = v24;
  }
  if (v22 > v24 || v24 > v27) {
    goto LABEL_22;
  }
  double v29 = a7;
  if ((a8 & 1) != 0) {
    double v29 = -INFINITY;
  }
  double v30 = a10;
  if ((a11 & 1) != 0) {
    double v30 = v29;
  }
  double v31 = a12;
  if ((a13 & 1) != 0) {
    double v31 = v30;
  }
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    double v40 = a7;
    double v39 = a5;
    double v37 = a1;
    double v38 = a3;
    unsigned int v36 = v21;
    uint64_t v33 = static os_log_type_t.fault.getter();
    char v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v33,  &dword_0,  v34,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v18 = a15;
    uint64_t v21 = v36;
    double v20 = a10;
    a1 = v37;
    a3 = v38;
    double v19 = a12;
    a5 = v39;
    a7 = v40;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v21,  *(void *)&a3,  v23,  *(void *)&a5,  v25,  *(void *)&a7,  v26,  *(void *)&v20,  a11 & 1,  *(void *)&v19,  a13 & 1,  a14,  v18);
  memcpy((void *)a9, v16, 0x60uLL);
  memcpy((void *)(a9 + 96), __src, 0x70uLL);
  return sub_140EC((uint64_t *)v16);
}

uint64_t *initializeBufferWithCopyOfBuffer for IntentsUIStandardView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v21);
  }

  else
  {
    uint64_t v7 = type metadata accessor for IntentsUIStandard(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (uint64_t *)((char *)a1 + v9);
    uint64_t v15 = (uint64_t *)((char *)a2 + v9);
    id v16 = v13;
    uint64_t v17 = sub_47B4(&qword_24368);
    if (swift_getEnumCaseMultiPayload(v15, v17) == 1)
    {
      uint64_t v18 = type metadata accessor for Response(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1LL, v18))
      {
        uint64_t v19 = sub_47B4(&qword_24EF8);
        memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64LL));
        uint64_t v20 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v14, v15, v18);
        uint64_t v20 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0LL, 1LL, v18);
      }
    }

    else
    {
      uint64_t v22 = *v15;
      uint64_t *v14 = *v15;
      swift_retain(v22);
      uint64_t v20 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v14, v17, v20);
    uint64_t v23 = a3[7];
    double v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = type metadata accessor for ActionHandler(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v24, v25, v26);
  }

  return a1;
}

uint64_t destroy for IntentsUIStandardView(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for IntentsUIStandard(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);

  int v5 = (void *)(a1 + a2[6]);
  uint64_t v6 = sub_47B4(&qword_24368);
  if (swift_getEnumCaseMultiPayload(v5, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for Response(0LL);
  }

  else
  {
    swift_release(*v5);
  }

  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = type metadata accessor for ActionHandler(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
}

uint64_t initializeWithCopy for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for IntentsUIStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = (uint64_t *)(a1 + v8);
  uint64_t v14 = (uint64_t *)(a2 + v8);
  id v15 = v12;
  uint64_t v16 = sub_47B4(&qword_24368);
  if (swift_getEnumCaseMultiPayload(v14, v16) == 1)
  {
    uint64_t v17 = type metadata accessor for Response(0LL);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1LL, v17))
    {
      uint64_t v18 = sub_47B4(&qword_24EF8);
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64LL));
      uint64_t v19 = 1LL;
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v13, v14, v17);
      uint64_t v19 = 1LL;
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 0LL, 1LL, v17);
    }
  }

  else
  {
    uint64_t v20 = *v14;
    *uint64_t v13 = *v14;
    swift_retain(v20);
    uint64_t v19 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v13, v16, v19);
  uint64_t v21 = a3[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16LL))(v22, v23, v24);
  return a1;
}

uint64_t assignWithCopy for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for IntentsUIStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  if (a1 != a2)
  {
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)(a1 + v13);
    id v15 = (uint64_t *)(a2 + v13);
    sub_8D84(a1 + v13, &qword_24368);
    uint64_t v16 = sub_47B4(&qword_24368);
    if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
    {
      uint64_t v17 = type metadata accessor for Response(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1LL, v17))
      {
        uint64_t v18 = sub_47B4(&qword_24EF8);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
        uint64_t v19 = 1LL;
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v14, v15, v17);
        uint64_t v19 = 1LL;
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0LL, 1LL, v17);
      }
    }

    else
    {
      uint64_t v20 = *v15;
      uint64_t *v14 = *v15;
      swift_retain(v20);
      uint64_t v19 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v14, v16, v19);
  }

  uint64_t v21 = a3[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24LL))(v22, v23, v24);
  return a1;
}

uint64_t initializeWithTake for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for IntentsUIStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_47B4(&qword_24368);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    uint64_t v11 = type metadata accessor for Response(0LL);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1LL, v11))
    {
      uint64_t v12 = sub_47B4(&qword_24EF8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v8, v9, v11);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v8, 0LL, 1LL, v11);
    }

    swift_storeEnumTagMultiPayload(v8, v10, 1LL);
  }

  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL))(v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for IntentsUIStandard(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  if (a1 != a2)
  {
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_8D84(a1 + v11, &qword_24368);
    uint64_t v14 = sub_47B4(&qword_24368);
    if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
    {
      uint64_t v15 = type metadata accessor for Response(0LL);
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v13, 1LL, v15))
      {
        uint64_t v16 = sub_47B4(&qword_24EF8);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32LL))(v12, v13, v15);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v12, 0LL, 1LL, v15);
      }

      swift_storeEnumTagMultiPayload(v12, v14, 1LL);
    }

    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
    }
  }

  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))(v18, v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentsUIStandardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_13DA0);
}

uint64_t sub_13DA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1419C();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, a2, v7);
  }

  if ((_DWORD)a2 != 2147483646)
  {
    uint64_t v12 = sub_47B4(&qword_24718);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84LL) == (_DWORD)a2)
    {
      uint64_t v7 = v12;
      uint64_t v13 = a3[6];
    }

    else
    {
      uint64_t v7 = sub_8EBC();
      uint64_t v13 = a3[7];
    }

    uint64_t v8 = a1 + v13;
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, a2, v7);
  }

  unint64_t v9 = *(void *)(a1 + a3[5]);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for IntentsUIStandardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_13E74);
}

void sub_13E74(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1419C();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + a4[5]) = a2;
      sub_1253C();
      return;
    }

    uint64_t v11 = sub_47B4(&qword_24718);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v11;
      uint64_t v12 = a4[6];
    }

    else
    {
      uint64_t v9 = sub_8EBC();
      uint64_t v12 = a4[7];
    }

    uint64_t v10 = a1 + v12;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v10, a2, a2, v9);
}

void sub_13F24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntentsUIStandard(319LL);
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    v8[1] = &unk_1C698;
    sub_13FCC(319LL);
    if (v5 <= 0x3F)
    {
      v8[2] = *(void *)(v4 - 8) + 64LL;
      uint64_t v6 = type metadata accessor for ActionHandler(319LL);
      if (v7 <= 0x3F)
      {
        v8[3] = *(void *)(v6 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 4LL, v8, a1 + 16);
      }
    }
  }

void sub_13FCC(uint64_t a1)
{
  if (!qword_24F68)
  {
    uint64_t v2 = sub_67CC(&qword_24EF8);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_24F68);
    }
  }

unint64_t sub_14028()
{
  unint64_t result = qword_24FA0;
  if (!qword_24FA0)
  {
    uint64_t v1 = sub_67CC(&qword_24FA8);
    sub_8D50(&qword_24FB0, &qword_24EC0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24FA0);
  }

  return result;
}

void sub_140AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_47B4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_8E2C();
}

uint64_t *sub_140EC(uint64_t *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[9];
  uint64_t v5 = a1[10];
  uint64_t v6 = a1[11];
  sub_1415C(a1[3], a1[4], a1[5], a1[6]);
  swift_retain(v6);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t sub_1415C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1418C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }

  return result;
}

uint64_t sub_1418C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_1419C()
{
  return type metadata accessor for IntentsUIStandard(0LL);
}

uint64_t sub_141A4()
{
  return type metadata accessor for IntentsUIStandardView(0LL);
}

uint64_t CircleImageView.init(model:)(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for ContactImage(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_14D04();
  uint64_t v6 = type metadata accessor for Context(v5);
  sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v8 = (void *)EnvironmentObject.init()(v6, v7);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16))(v1, a1, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v4 + 88))(v1, v3) == enum case for ContactImage.visual(_:))
  {
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t))(v4 + 8);
    id v10 = v8;
    v9(a1, v3);
    (*(void (**)(uint64_t *, uint64_t))(v4 + 96))(v1, v3);
    uint64_t v3 = *v1;
  }

  else
  {
    uint64_t v11 = *(void (**)(uint64_t *, uint64_t))(v4 + 8);
    v11(v1, v3);
    if (qword_24340 != -1) {
      swift_once(&qword_24340, sub_E514);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_89CC(v12, (uint64_t)qword_263C0);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Provided model is not a visual model.", v16, 2u);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    unint64_t v17 = sub_143C0();
    swift_allocError(&type metadata for CircleImageView.Error, v17, 0LL, 0LL);
    swift_willThrow();

    v11(a1, v3);
  }

  return v3;
}

unint64_t sub_143C0()
{
  unint64_t result = qword_24FC0;
  if (!qword_24FC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C7C8, &type metadata for CircleImageView.Error);
    atomic_store(result, (unint64_t *)&qword_24FC0);
  }

  return result;
}

void sub_143FC()
{
}

uint64_t CircleImageView.body.getter@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = type metadata accessor for ImageElement.ImageStyle(0LL);
  uint64_t v57 = *(void *)(v7 - 8);
  uint64_t v58 = v7;
  sub_8E6C();
  __chkstk_darwin(v8);
  sub_8E34();
  uint64_t v49 = v9;
  uint64_t v47 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v10 = *(void *)(v47 - 8);
  sub_8E6C();
  __chkstk_darwin(v11);
  sub_A7B4();
  uint64_t v14 = v13 - v12;
  sub_47B4(&qword_245C8);
  sub_8E6C();
  __chkstk_darwin(v15);
  uint64_t v16 = sub_14D04();
  uint64_t v17 = type metadata accessor for VisualElementView(v16);
  uint64_t v50 = *(void *)(v17 - 8);
  sub_8E6C();
  __chkstk_darwin(v18);
  sub_A7B4();
  uint64_t v21 = v20 - v19;
  uint64_t v56 = sub_47B4(&qword_24FC8);
  uint64_t v54 = *(void *)(v56 - 8);
  sub_8E6C();
  __chkstk_darwin(v22);
  sub_8E34();
  uint64_t v24 = v23;
  uint64_t v55 = sub_47B4(&qword_24FD0);
  uint64_t v53 = *(void *)(v55 - 8);
  sub_8E6C();
  __chkstk_darwin(v25);
  sub_8E34();
  uint64_t v51 = v26;
  uint64_t v46 = sub_47B4(&qword_24FD8);
  sub_8E6C();
  __chkstk_darwin(v27);
  sub_A7B4();
  uint64_t v30 = v29 - v28;
  uint64_t v48 = sub_47B4(&qword_24FE0);
  sub_8E6C();
  __chkstk_darwin(v31);
  sub_A7B4();
  uint64_t v34 = v33 - v32;
  if (a2)
  {
    id v35 = a2;
    uint64_t v36 = dispatch thunk of Context.currentIdiom.getter();

    VRXIdiom.idiom.getter(v36);
    uint64_t v37 = type metadata accessor for VisualElement(0LL);
    Array<A>.element(for:)(v14, a1, v37, &protocol witness table for VisualElement);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v47);
    VisualElementView.init(model:)(v4);
    (*(void (**)(uint64_t, void, uint64_t))(v57 + 104))( v49,  enum case for ImageElement.ImageStyle.contactImage5(_:),  v58);
    sub_8DBC(&qword_24FE8, (uint64_t (*)(uint64_t))&type metadata accessor for VisualElementView);
    uint64_t v39 = v38;
    View.imageStyle(_:)(v49, v17, v38);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v49, v58);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v21, v17);
    v60[0] = v17;
    v60[1] = v39;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v60,  &opaque type descriptor for <<opaque return type of View.imageStyle(_:)>>,  1LL);
    View.imageElementFixedSize()(v56, OpaqueTypeConformance2);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v24, v56);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v30, v51, v55);
    *(_WORD *)(v30 + *(int *)(v46 + 36)) = 256;
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v55);
    uint64_t KeyPath = swift_getKeyPath(&unk_1C6C0);
    sub_1481C(v30, v34);
    uint64_t v42 = v34 + *(int *)(v48 + 36);
    *(void *)uint64_t v42 = KeyPath;
    *(_BYTE *)(v42 + 8) = 1;
    sub_14864(v30);
    return sub_148A4(v34, a4);
  }

  else
  {
    uint64_t v44 = type metadata accessor for Context(0LL);
    sub_8DBC((unint64_t *)&qword_24358, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = EnvironmentObject.error()(0LL, a3, v44, v45);
    __break(1u);
  }

  return result;
}

void sub_147D4(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.isContactImage.getter() & 1;
  sub_8E2C();
}

void sub_147FC(unsigned __int8 *a1)
{
}

uint64_t sub_1481C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B4(&qword_24FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_14864(uint64_t a1)
{
  uint64_t v2 = sub_47B4(&qword_24FD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_148A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B4(&qword_24FE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_148EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of CircleImageView.body>>,  1LL);
}

uint64_t sub_148FC@<X0>(uint64_t a1@<X8>)
{
  return CircleImageView.body.getter(*(void *)v1, *(void **)(v1 + 8), *(void *)(v1 + 16), a1);
}

void destroy for CircleImageView(uint64_t a1)
{
}

void _s12SystemPlugin15CircleImageViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = (uint64_t)v4;
  a1[2] = a2[2];
  swift_bridgeObjectRetain(v3);
  id v5 = v4;
  sub_8E2C();
}

uint64_t *assignWithCopy for CircleImageView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = (void *)a1[1];
  uint64_t v7 = (void *)a2[1];
  a1[1] = (uint64_t)v7;
  id v8 = v7;

  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for CircleImageView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for CircleImageView(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;

  a1[2] = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CircleImageView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CircleImageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CircleImageView()
{
  return &type metadata for CircleImageView;
}

unint64_t sub_14AB4()
{
  unint64_t result = qword_24FF0;
  if (!qword_24FF0)
  {
    uint64_t v1 = sub_67CC(&qword_24FE0);
    sub_14B38();
    sub_8D50(&qword_25010, &qword_25018);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24FF0);
  }

  return result;
}

unint64_t sub_14B38()
{
  unint64_t result = qword_24FF8;
  if (!qword_24FF8)
  {
    uint64_t v1 = sub_67CC(&qword_24FD8);
    uint64_t v2 = sub_67CC(&qword_24FC8);
    uint64_t v3 = type metadata accessor for VisualElementView(255LL);
    sub_8DBC(&qword_24FE8, (uint64_t (*)(uint64_t))&type metadata accessor for VisualElementView);
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v6,  &opaque type descriptor for <<opaque return type of View.imageStyle(_:)>>,  1LL);
    uint64_t v6 = v2;
    uint64_t v7 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2( &v6,  &opaque type descriptor for <<opaque return type of View.imageElementFixedSize()>>,  1LL);
    sub_8D50(&qword_25000, &qword_25008);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_24FF8);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for CircleImageView.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_14C68 + 4 * byte_1C6B0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_14C88 + 4 * byte_1C6B5[v4]))();
  }
}

_BYTE *sub_14C68(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_14C88(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_14C90(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_14C98(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_14CA0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_14CA8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CircleImageView.Error()
{
  return &type metadata for CircleImageView.Error;
}

unint64_t sub_14CC8()
{
  unint64_t result = qword_25020;
  if (!qword_25020)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C7A0, &type metadata for CircleImageView.Error);
    atomic_store(result, (unint64_t *)&qword_25020);
  }

  return result;
}

uint64_t sub_14D04()
{
  return 0LL;
}

void TVContactMonogramView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ContactImage(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v19 = 0LL;
  uint64_t v8 = sub_47B4(&qword_24638);
  State.init(wrappedValue:)(&v20, &v19, v8);
  *(_OWORD *)(a2 + 16) = v20;
  uint64_t v9 = (void *)(a2 + *(int *)(type metadata accessor for TVContactMonogramView(0LL) + 24));
  *uint64_t v9 = swift_getKeyPath(&unk_1C820);
  uint64_t v10 = sub_47B4(&qword_24370);
  swift_storeEnumTagMultiPayload(v9, v10, 0LL);
  (*(void (**)(void *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(void *, uint64_t))(v5 + 88))(v7, v4) == enum case for ContactImage.letters(_:))
  {
    sub_167BC(a1);
    (*(void (**)(void *, uint64_t))(v5 + 96))(v7, v4);
    uint64_t v11 = v7[1];
    *(void *)a2 = *v7;
    *(void *)(a2 + 8) = v11;
  }

  else
  {
    sub_167BC((uint64_t)v7);
    if (qword_24340 != -1) {
      swift_once(&qword_24340, sub_E514);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_89CC(v12, (uint64_t)qword_263C0);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Provided model is not a monogram model.", v16, 2u);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    unint64_t v17 = sub_15078();
    swift_allocError(&type metadata for TVContactMonogramView.Error, v17, 0LL, 0LL);
    swift_willThrow();
    sub_167BC(a1);
    swift_release(*(void *)(a2 + 16));
    swift_release(*(void *)(a2 + 24));
    sub_8D84((uint64_t)v9, &qword_24830);
  }

uint64_t type metadata accessor for TVContactMonogramView(uint64_t a1)
{
  uint64_t result = qword_25098;
  if (!qword_25098) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TVContactMonogramView);
  }
  return result;
}

uint64_t property wrapper backing initializer of TVContactMonogramView.image(uint64_t a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = sub_47B4(&qword_24638);
  State.init(wrappedValue:)(&v4, &v3, v1);
  return v4;
}

void sub_14FDC()
{
}

void sub_14FF8()
{
}

void sub_15014(uint64_t a1)
{
  uint64_t v3 = sub_167E4();
  __chkstk_darwin(v3);
  sub_16630();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  EnvironmentValues.colorScheme.setter(v1);
  sub_1253C();
}

unint64_t sub_15078()
{
  unint64_t result = qword_25028;
  if (!qword_25028)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C968, &type metadata for TVContactMonogramView.Error);
    atomic_store(result, (unint64_t *)&qword_25028);
  }

  return result;
}

uint64_t TVContactMonogramView.body.getter()
{
  uint64_t v1 = sub_16794();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = static Alignment.center.getter(v5);
  uint64_t v8 = v7;
  sub_151CC(v0, &v17);
  uint64_t v9 = v17;
  uint64_t v10 = v18;
  uint64_t v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  uint64_t v20 = v10;
  sub_152D4(v0, (uint64_t)v4);
  uint64_t v11 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v12 = (v11 + 16) & ~v11;
  uint64_t v13 = swift_allocObject(&unk_21AE8, v12 + v3, v11 | 7);
  sub_153C0((uint64_t)v4, v13 + v12);
  uint64_t v14 = sub_47B4(&qword_25030);
  unint64_t v15 = sub_15450();
  View.readSize(onChange:)(sub_15404, v13, v14, v15);
  swift_release(v13);
  swift_release(v19);
  return swift_release(v20);
}

uint64_t sub_151CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = static Color.clear.getter(v6);
  __int128 v14 = *(_OWORD *)(a1 + 16);
  uint64_t v10 = sub_47B4(&qword_24E10);
  uint64_t result = State.wrappedValue.getter(v10);
  uint64_t v12 = v15;
  if (v15)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v13 = Image.resizable(capInsets:resizingMode:)(v8, v12, 0.0, 0.0, 0.0, 0.0);
    swift_release(v12);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  *a2 = v9;
  a2[1] = v13;
  return result;
}

uint64_t sub_152D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVContactMonogramView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_15318()
{
  uint64_t v1 = sub_16794();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 8));
  swift_release(*(void *)(v0 + v4 + 16));
  swift_release(*(void *)(v0 + v4 + 24));
  uint64_t v6 = (void *)(v0 + v4 + *(int *)(v1 + 24));
  uint64_t v7 = sub_47B4(&qword_24370);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    uint64_t v8 = sub_167E4();
    sub_8E18(v8);
  }

  else
  {
    swift_release(*v6);
  }

  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_153C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVContactMonogramView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_15404(double a1, double a2)
{
}

unint64_t sub_15450()
{
  unint64_t result = qword_25038;
  if (!qword_25038)
  {
    uint64_t v1 = sub_67CC(&qword_25030);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_25038);
  }

  return result;
}

uint64_t sub_15494(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of TVContactMonogramView.body>>,  1LL);
}

void sub_154A4(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_167E4();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v31[-1] - v11;
  id v13 = [(id)objc_opt_self(SiriTVUIMonogrammer) sharedInstance];
  if (v13)
  {
    __int128 v14 = v13;
    NSString v15 = String._bridgeToObjectiveC()();
    if (a2 >= a1) {
      a2 = a1;
    }
    sub_16794();
    sub_16754();
    sub_1634C();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for ColorScheme.dark(_:), v6);
    char v16 = static ColorScheme.== infix(_:_:)(v12, v10);
    uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
    if ((v16 & 1) != 0) {
      uint64_t v18 = 2LL;
    }
    else {
      uint64_t v18 = 1LL;
    }
    id v19 = [v14 monogramWithText:v15 diameter:0 isFocused:v18 userInterfaceStyle:a2];

    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = Image.init(nativeImage:)(v20);
      uint64_t v23 = *(void *)(v3 + 16);
      uint64_t v22 = *(void *)(v3 + 24);
      v31[1] = v23;
      void v31[2] = v22;
      v31[0] = v21;
      sub_16734();
      swift_retain(v23);
      uint64_t v24 = sub_47B4(&qword_24E10);
      State.wrappedValue.setter(v31, v24);
      swift_release(v22);
      sub_16800();
    }

    else
    {
      if (qword_24340 != -1) {
        swift_once(&qword_24340, sub_E514);
      }
      uint64_t v25 = type metadata accessor for Logger(0LL);
      uint64_t v26 = sub_89CC(v25, (uint64_t)qword_263C0);
      uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)sub_165E4(2LL);
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_0, v27, v28, "Failed to get an image from SiriTVUIMonogrammer.", v29, 2u);
        sub_A7D0((uint64_t)v29);
      }
    }
  }

  else
  {
    __break(1u);
  }

uint64_t *initializeBufferWithCopyOfBuffer for TVContactMonogramView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v16);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[2];
    uint64_t v7 = a2[3];
    a1[2] = v6;
    a1[3] = v7;
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain(v5);
    swift_retain(v6);
    swift_retain(v7);
    uint64_t v11 = sub_47B4(&qword_24370);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      uint64_t v12 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v9, v10, v12);
      id v13 = v9;
      uint64_t v14 = v11;
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v17 = *v10;
      *uint64_t v9 = *v10;
      swift_retain(v17);
      id v13 = v9;
      uint64_t v14 = v11;
      uint64_t v15 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v14, v15);
  }

  return a1;
}

uint64_t destroy for TVContactMonogramView(void *a1, uint64_t a2)
{
  int v4 = (void *)((char *)a1 + *(int *)(a2 + 24));
  uint64_t v5 = sub_47B4(&qword_24370);
  uint64_t v6 = type metadata accessor for ColorScheme(0LL);
  return (*(uint64_t (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
}

void *initializeWithCopy for TVContactMonogramView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_bridgeObjectRetain(v4);
  swift_retain(v5);
  swift_retain(v6);
  uint64_t v10 = sub_47B4(&qword_24370);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v8, v9, v11);
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v13 = *v9;
    *uint64_t v8 = *v9;
    swift_retain(v13);
    uint64_t v12 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v10, v12);
  return a1;
}

void *assignWithCopy for TVContactMonogramView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a1[2];
  uint64_t v9 = a2[2];
  a1[2] = v9;
  swift_retain(v9);
  swift_release(v8);
  uint64_t v10 = a1[3];
  uint64_t v11 = a2[3];
  a1[3] = v11;
  swift_retain(v11);
  swift_release(v10);
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    sub_8D84((uint64_t)a1 + v12, &qword_24370);
    uint64_t v15 = sub_47B4(&qword_24370);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      uint64_t v16 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v13, v14, v16);
      uint64_t v17 = 1LL;
    }

    else
    {
      uint64_t v18 = *v14;
      *uint64_t v13 = *v14;
      swift_retain(v18);
      uint64_t v17 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v15, v17);
  }

  return a1;
}

_OWORD *initializeWithTake for TVContactMonogramView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_47B4(&qword_24370);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v6, v7, v9);
    swift_storeEnumTagMultiPayload(v6, v8, 1LL);
  }

  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  return a1;
}

void *assignWithTake for TVContactMonogramView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a1[2];
  a1[2] = a2[2];
  swift_release(v8);
  uint64_t v9 = a1[3];
  a1[3] = a2[3];
  swift_release(v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    sub_8D84((uint64_t)a1 + v10, &qword_24370);
    uint64_t v13 = sub_47B4(&qword_24370);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      uint64_t v14 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v11, v12, v14);
      swift_storeEnumTagMultiPayload(v11, v13, 1LL);
    }

    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for TVContactMonogramView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_15C24);
}

uint64_t sub_15C24(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_47B4(&qword_24830);
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(a1 + *(int *)(a3 + 24), a2, v8);
  }

uint64_t storeEnumTagSinglePayload for TVContactMonogramView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_15CA8);
}

void sub_15CA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + 8) = (a2 - 1);
    sub_1253C();
  }

  else
  {
    uint64_t v7 = sub_47B4(&qword_24830);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }

void sub_15D10(uint64_t a1)
{
  v4[0] = &unk_1C8C8;
  v4[1] = &unk_1C8E0;
  sub_15D8C(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

void sub_15D8C(uint64_t a1)
{
  if (!qword_247A0)
  {
    uint64_t v2 = type metadata accessor for ColorScheme(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_247A0);
    }
  }

uint64_t sub_15DE0()
{
  v1[0] = sub_67CC(&qword_25030);
  v1[1] = sub_15450();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.readSize(onChange:)>>,  1LL);
}

uint64_t storeEnumTagSinglePayload for TVContactMonogramView.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_15E6C + 4 * byte_1C810[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_15E8C + 4 * byte_1C815[v4]))();
  }
}

_BYTE *sub_15E6C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_15E8C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_15E94(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_15E9C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_15EA4(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_15EAC(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TVContactMonogramView.Error()
{
  return &type metadata for TVContactMonogramView.Error;
}

unint64_t sub_15ECC()
{
  unint64_t result = qword_250D8;
  if (!qword_250D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C940, &type metadata for TVContactMonogramView.Error);
    atomic_store(result, (unint64_t *)&qword_250D8);
  }

  return result;
}

uint64_t sub_15F08()
{
  int v3 = v2;
  sub_16720();
  sub_167AC();
  __chkstk_darwin(v4);
  sub_16630();
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = sub_16734();
    ((void (*)(uint64_t))static os_log_type_t.fault.getter)(v5);
    uint64_t v6 = (os_log_s *)((uint64_t (*)(void))static Log.runtimeIssuesLog.getter)();
    if (sub_16784(v6))
    {
      uint64_t v7 = sub_165E4(12LL);
      uint64_t v11 = sub_165E4(32LL);
      sub_167EC(4.8149e-34);
      uint64_t v9 = sub_9CD4(0x6D6F696449585256LL, 0xE800000000000000LL, v8);
      sub_16654(v9);
      sub_16648( &dword_0,  v3,  v1,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      sub_16718(v11);
      sub_A7D0(v11);
      sub_A7D0(v7);
    }

    sub_1674C();
    sub_1673C();
    sub_166F4();
    return v11;
  }

  return v0;
}

uint64_t sub_1601C()
{
  uint64_t v20 = v2;
  uint64_t v21 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = sub_16720();
  sub_167AC();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((v5 & 0x100) == 0)
  {
    uint64_t v10 = sub_16734();
    os_log_type_t v11 = ((uint64_t (*)(uint64_t))static os_log_type_t.fault.getter)(v10);
    uint64_t v12 = (os_log_s *)((uint64_t (*)(void))static Log.runtimeIssuesLog.getter)();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v14 = (uint8_t *)sub_165E4(12LL);
      uint64_t v15 = sub_165E4(32LL);
      v19[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v17 = v14 + 4;
      uint64_t v18 = sub_9CD4(0xD000000000000011LL, 0x800000000001F6F0LL, v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, v19, v17, v14 + 12);
      _os_log_impl( &dword_0,  v12,  v13,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v14,  0xCu);
      sub_16718(v15);
      sub_A7D0(v15);
      sub_A7D0((uint64_t)v14);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v9, v0);
    sub_BDE4(v0, v5, 0);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v6);
    return v19[0];
  }

  return v0;
}

void sub_161B8()
{
}

void sub_161E0()
{
}

void sub_16200()
{
  uint64_t v2 = v1;
  sub_16720();
  sub_167AC();
  __chkstk_darwin(v3);
  sub_16630();
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = sub_16734();
    ((void (*)(uint64_t))static os_log_type_t.fault.getter)(v4);
    uint64_t v5 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    if (sub_16784(v5))
    {
      uint64_t v6 = sub_165E4(12LL);
      uint64_t v9 = sub_165E4(32LL);
      sub_167EC(4.8149e-34);
      uint64_t v8 = sub_9CD4(0x74616F6C464743LL, 0xE700000000000000LL, v7);
      sub_16654(v8);
      sub_16648( &dword_0,  v2,  v0,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      sub_16718(v9);
      sub_A7D0(v9);
      sub_A7D0(v6);
    }

    sub_1674C();
    sub_1673C();
    sub_166F4();
  }

void sub_16318()
{
}

void sub_1634C()
{
  uint64_t v8 = sub_16610(v5, v6, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_1668C();
  sub_167D0();
  __chkstk_darwin(v10);
  sub_165EC(v11, v16);
  if (sub_167C4() == 1)
  {
    uint64_t v12 = v1(0LL);
    (*(void (**)(uint64_t, os_log_s *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v2, v3, v12);
  }

  else
  {
    static os_log_type_t.fault.getter();
    os_log_type_t v13 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    if (sub_16774(v13))
    {
      uint64_t v14 = sub_165E4(12LL);
      uint64_t v17 = sub_165E4(32LL);
      uint64_t v15 = sub_166A8(4.8149e-34);
      sub_16670(v15);
      sub_16648( &dword_0,  v3,  v4,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      sub_16718(v17);
      sub_A7D0(v17);
      sub_A7D0(v14);
    }

    sub_1674C();
    sub_1679C();
    sub_16800();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v8);
  }

  sub_166C4();
}

void sub_1648C()
{
}

void sub_164B4()
{
  uint64_t v8 = sub_16610(v5, v6, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_1668C();
  sub_167D0();
  __chkstk_darwin(v10);
  sub_165EC(v11, v15);
  if (sub_167C4() == 1)
  {
    sub_12438((uint64_t)v3, v2, v1);
  }

  else
  {
    static os_log_type_t.fault.getter();
    uint64_t v12 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    if (sub_16774(v12))
    {
      uint64_t v13 = sub_165E4(12LL);
      uint64_t v16 = sub_165E4(32LL);
      uint64_t v14 = sub_166A8(4.8149e-34);
      sub_16670(v14);
      sub_16648( &dword_0,  v3,  v4,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      sub_16718(v16);
      sub_A7D0(v16);
      sub_A7D0(v13);
    }

    sub_1674C();
    sub_1679C();
    sub_16800();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v8);
  }

  sub_166C4();
}

uint64_t sub_165E4(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

void sub_165EC(uint64_t a1@<X8>, uint64_t a2)
{
}

uint64_t sub_16610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 - 104) = a3;
  return type metadata accessor for EnvironmentValues(0LL);
}

  ;
}

void sub_16648(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_16654(uint64_t a1)
{
  *(void *)(v3 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 96, v3 - 88, v2, v1);
}

uint64_t sub_16670(uint64_t a1)
{
  *(void *)(v3 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 96, v3 - 88, v1, v2);
}

uint64_t sub_1668C()
{
  return sub_47B4(v0);
}

uint64_t sub_166A8(float a1)
{
  *uint64_t v1 = a1;
  return sub_9CD4(*(void *)(v2 - 104), *(void *)(v2 - 120), (uint64_t *)(v2 - 88));
}

  ;
}

  ;
}

uint64_t sub_166F4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
}

uint64_t sub_16718(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

uint64_t sub_16720()
{
  return type metadata accessor for EnvironmentValues(0LL);
}

void sub_1672C()
{
}

uint64_t sub_16734()
{
  return swift_retain(v0);
}

uint64_t sub_1673C()
{
  return swift_getAtKeyPath(v1, v0);
}

uint64_t sub_1674C()
{
  return EnvironmentValues.init()();
}

  ;
}

BOOL sub_16774(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

BOOL sub_16784(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_16794()
{
  return type metadata accessor for TVContactMonogramView(0LL);
}

uint64_t sub_1679C()
{
  return swift_getAtKeyPath(v0, v1);
}

  ;
}

uint64_t sub_167BC(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_167C4()
{
  return swift_getEnumCaseMultiPayload(v0, v1);
}

  ;
}

uint64_t sub_167E4()
{
  return type metadata accessor for ColorScheme(0LL);
}

void sub_167EC(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_16800()
{
  return swift_release(v0);
}

void *initializeBufferWithCopyOfBuffer for PlaceholderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for PlaceholderView(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for PlaceholderView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

void *assignWithTake for PlaceholderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlaceholderView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for PlaceholderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PlaceholderView()
{
  return &type metadata for PlaceholderView;
}

uint64_t sub_16938(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1DF58, 1LL);
}

void *sub_16948@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = __src[0];
  uint64_t v6 = __src[1];
  char v7 = __src[2];
  uint64_t v8 = __src[3];
  uint64_t v9 = __src[5];
  uint64_t v17 = __src[4];
  uint64_t v10 = __src[6];
  uint64_t v11 = __src[7];
  uint64_t v12 = __src[8];
  uint64_t v14 = static Alignment.center.getter(v13);
  sub_1339C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v14, v15);
  sub_16CA4(v5, v6, v7, v8);
  swift_release(v11);
  swift_release(v10);
  swift_release(v9);
  swift_release(v17);
  swift_release(v12);
  return memcpy(a3, __src, 0xD0uLL);
}

uint64_t sub_16A74@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_47B4(&qword_250E0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_47B4(&qword_250E8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    v31[0] = a1;
    v31[1] = a2;
    unint64_t v13 = sub_F0F4();
    swift_bridgeObjectRetain(a2);
    uint64_t v14 = Text.init<A>(_:)(v31, &type metadata for String, v13);
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19 & 1;
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v18 = 0LL;
  }

  uint64_t v21 = Image.init(systemName:)(0x70612E6B72616D78LL, 0xE900000000000070LL);
  static SymbolRenderingMode.palette.getter();
  uint64_t v22 = type metadata accessor for SymbolRenderingMode(0LL);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v11, 0LL, 1LL, v22);
  uint64_t v23 = Image.symbolRenderingMode(_:)(v11, v21);
  swift_release(v21);
  uint64_t v24 = sub_16CE4((uint64_t)v11, &qword_250E8);
  uint64_t v25 = static Color.red.getter(v24);
  uint64_t v26 = static Color.orange.getter();
  uint64_t v27 = type metadata accessor for Font.Design(0LL);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v8, 1LL, 1LL, v27);
  uint64_t v28 = static Font.system(size:weight:design:)(0LL, 1LL, v8, 96.0);
  sub_16CE4((uint64_t)v8, &qword_250E0);
  uint64_t KeyPath = swift_getKeyPath(&unk_1CA18);
  *a3 = v14;
  a3[1] = v16;
  a3[2] = v20;
  a3[3] = v18;
  a3[4] = v23;
  a3[5] = v25;
  a3[6] = v26;
  a3[7] = KeyPath;
  a3[8] = v28;
  sub_1415C(v14, v16, v20, v18);
  return sub_16CA4(v14, v16, v20, v18);
}

void *sub_16C9C@<X0>(void *a1@<X8>)
{
  return sub_16948(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_16CA4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_16CD4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }

  return result;
}

uint64_t sub_16CD4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_16CE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_47B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_16D20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_16D48(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_16D78()
{
  unint64_t result = qword_250F0;
  if (!qword_250F0)
  {
    uint64_t v1 = sub_67CC(&qword_250F8);
    sub_16DE4();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_250F0);
  }

  return result;
}

unint64_t sub_16DE4()
{
  unint64_t result = qword_25100;
  if (!qword_25100)
  {
    uint64_t v1 = sub_67CC(&qword_25108);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_25100);
  }

  return result;
}

uint64_t MapsOverlayView.init(model:)(uint64_t a1)
{
  uint64_t v3 = sub_1AAF8();
  uint64_t v4 = type metadata accessor for MapsOverlayView(v3);
  uint64_t v5 = (void *)(v1 + *(int *)(v4 + 24));
  uint64_t v6 = type metadata accessor for Context(0LL);
  sub_1905C((uint64_t)&qword_24358);
  *uint64_t v5 = EnvironmentObject.init()(v6, v7);
  v5[1] = v8;
  uint64_t v9 = *(void *)(sub_1ABC8() - 8);
  uint64_t v10 = sub_1ABA4(v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  double v11 = MapOverlayModel.latitude.getter(v10);
  double v12 = MapOverlayModel.longitude.getter();
  double v13 = COERCE_DOUBLE(MapOverlayModel.latitudeSpan.getter());
  if ((v14 & 1) != 0) {
    double v15 = 0.01;
  }
  else {
    double v15 = v13;
  }
  *(double *)&uint64_t v16 = COERCE_DOUBLE(MapOverlayModel.longitudeSpan.getter());
  char v18 = v17;
  uint64_t result = sub_1AB68(a1, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  double v20 = *(double *)&v16;
  if ((v18 & 1) != 0) {
    double v20 = 0.01;
  }
  uint64_t v21 = v1 + *(int *)(v4 + 20);
  *(double *)uint64_t v21 = v11;
  *(double *)(v21 + 8) = v12;
  *(double *)(v21 + 16) = v15;
  *(double *)(v21 + 24) = v20;
  *(void *)(v21 + 32) = 0LL;
  return result;
}

uint64_t type metadata accessor for MapsOverlayView(uint64_t a1)
{
  return sub_4DE4(a1, qword_25198, (uint64_t)&nominal type descriptor for MapsOverlayView);
}

double property wrapper backing initializer of MapsOverlayView.region@<D0>( uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(double *)uint64_t v10 = a2;
  *(double *)&v10[1] = a3;
  *(double *)&v10[2] = a4;
  *(double *)&v10[3] = a5;
  type metadata accessor for MKCoordinateRegion(0LL);
  State.init(wrappedValue:)(v11, v10, v6);
  uint64_t v7 = v12;
  double result = *(double *)v11;
  __int128 v9 = v11[1];
  *(_OWORD *)a1 = v11[0];
  *(_OWORD *)(a1 + 16) = v9;
  *(void *)(a1 + 32) = v7;
  return result;
}

void MapsOverlayView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v6 = sub_1AB70();
  sub_A76C();
  __chkstk_darwin(v7);
  sub_16630();
  sub_170BC(v1, v3);
  sub_18FA8();
  uint64_t v8 = v2 + *(int *)(v6 + 36);
  *(void *)uint64_t v8 = 0x3FF0000000000000LL;
  *(_WORD *)(v8 + 8) = 0;
  sub_1A93C((uint64_t)v3, &qword_25110);
  uint64_t KeyPath = swift_getKeyPath(&unk_1CA50);
  uint64_t v10 = swift_allocObject(&unk_21D00, 17LL, 7LL);
  *(_BYTE *)(v10 + 16) = 1;
  sub_18FA8();
  double v11 = (uint64_t *)(a1 + *(int *)(sub_47B4(&qword_25120) + 36));
  *double v11 = KeyPath;
  v11[1] = (uint64_t)sub_18F1C;
  _OWORD v11[2] = v10;
  sub_1A93C(v2, &qword_25118);
  sub_1A9D4();
}

uint64_t sub_170BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v111 = a2;
  uint64_t v113 = sub_47B4(&qword_25410);
  __chkstk_darwin(v113);
  BOOL v112 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for MapInteractionModes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_47B4(&qword_253B0);
  __chkstk_darwin(v7);
  __int128 v9 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_47B4(&qword_25398);
  uint64_t v110 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_47B4(&qword_25418);
  __chkstk_darwin(v13);
  double v15 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for MapItems(0LL);
  char v17 = *(char **)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  double v20 = (char *)&v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MapOverlayModel.annotationItem.getter(v18);
  uint64_t v21 = v16;
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1LL, v16) == 1)
  {
    sub_1A93C((uint64_t)v15, &qword_25418);
    uint64_t v22 = (__int128 *)(a1 + *(int *)(type metadata accessor for MapsOverlayView(0LL) + 20));
    uint64_t v23 = *((void *)v22 + 4);
    __int128 v24 = v22[1];
    __int128 v119 = *v22;
    __int128 v120 = v24;
    *(void *)&__int128 v121 = v23;
    uint64_t v25 = sub_47B4(&qword_25420);
    State.projectedValue.getter(&v124, v25);
    uint64_t v26 = sub_47B4(&qword_253C0);
    uint64_t v27 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 1LL, 1LL, v26);
    static MapInteractionModes.all.getter(v27);
    Map.init<>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:)(&v124, v6, 0LL, v9);
    uint64_t v28 = v110;
    uint64_t v29 = v112;
    (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v112, v12, v10);
    swift_storeEnumTagMultiPayload(v29, v113, 1LL);
    uint64_t v30 = sub_47B4(&qword_25350);
    unint64_t v31 = sub_1A32C();
    sub_1A9A0((uint64_t)&unk_25390);
    _ConditionalContent<>.init(storage:)(v111, v29, v30, v10, v31, v32);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v10);
  }

  uint64_t v109 = v10;
  uint64_t v34 = v111;
  id v35 = (void (*)(char *, char *, uint64_t))*((void *)v17 + 4);
  uint64_t v110 = v21;
  v35(v20, v15, v21);
  MapItems.mapAnnotation.getter();
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v108 = v20;
    uint64_t v38 = v17;
    uint64_t v39 = type metadata accessor for MapsOverlayView(0LL);
    uint64_t v40 = a1 + *(int *)(v39 + 24);
    double v41 = *(void **)v40;
    if (*(void *)v40)
    {
      uint64_t v42 = (__int128 *)(a1 + *(int *)(v39 + 20));
      uint64_t v43 = *((void *)v42 + 4);
      __int128 v44 = v42[1];
      __int128 v119 = *v42;
      __int128 v120 = v44;
      *(void *)&__int128 v121 = v43;
      id v45 = v41;
      uint64_t v46 = sub_47B4(&qword_25420);
      State.projectedValue.getter(&v124, v46);
      __int128 v47 = v124;
      __int128 v48 = v125;
      __int128 v49 = v126;
      *(void *)&__int128 v124 = v37;
      *((void *)&v124 + 1) = v41;
      __int128 v125 = v47;
      __int128 v126 = v48;
      __int128 v127 = v49;
      unsigned __int8 v128 = 0;
      unint64_t v50 = sub_1A444();
      unint64_t v51 = sub_1A480();
      swift_bridgeObjectRetain(v37);
      id v52 = v45;
      swift_retain(v47);
      swift_retain(*((void *)&v47 + 1));
      _ConditionalContent<>.init(storage:)(&v114, &v124, &unk_21E90, &unk_21E08, v50, v51);
      __int128 v119 = v114;
      __int128 v120 = v115;
      __int128 v121 = v116;
      __int128 v122 = v117;
      __int16 v123 = v118;
      uint64_t v53 = sub_47B4(&qword_25370);
      uint64_t v54 = sub_1A420();
      unint64_t v55 = sub_1A4BC();
      _ConditionalContent<>.init(storage:)(&v124, &v119, v53, &unk_21D80, v54, v55);
      swift_release(*((void *)&v47 + 1));
      swift_release(v47);

      swift_bridgeObjectRelease(v37);
      uint64_t v57 = *((void *)&v124 + 1);
      uint64_t v56 = v124;
      uint64_t v59 = *((void *)&v125 + 1);
      uint64_t v58 = v125;
      uint64_t v61 = *((void *)&v126 + 1);
      uint64_t v60 = v126;
      uint64_t v63 = *((void *)&v127 + 1);
      uint64_t v62 = v127;
      if (v129) {
        __int16 v64 = 256;
      }
      else {
        __int16 v64 = 0;
      }
      __int16 v65 = v64 | v128;
      uint64_t v66 = v34;
      uint64_t v67 = v109;
      uint64_t v68 = v113;
      uint64_t v69 = v112;
      char v17 = v38;
      double v20 = v108;
      goto LABEL_23;
    }

LABEL_25:
    uint64_t v105 = *(void *)(v40 + 8);
    uint64_t v106 = type metadata accessor for Context(0LL);
    sub_1905C((uint64_t)&qword_24358);
    uint64_t result = EnvironmentObject.error()(0LL, v105, v106, v107);
    __break(1u);
    return result;
  }

  MapItems.mapMarker.getter();
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v108 = v17;
    uint64_t v72 = type metadata accessor for MapsOverlayView(0LL);
    uint64_t v40 = a1 + *(int *)(v72 + 24);
    uint64_t v73 = *(void **)v40;
    if (*(void *)v40)
    {
      uint64_t v74 = (__int128 *)(a1 + *(int *)(v72 + 20));
      uint64_t v75 = *((void *)v74 + 4);
      __int128 v76 = v74[1];
      __int128 v119 = *v74;
      __int128 v120 = v76;
      *(void *)&__int128 v121 = v75;
      id v77 = v73;
      uint64_t v78 = sub_47B4(&qword_25420);
      State.projectedValue.getter(&v124, v78);
      __int128 v79 = v124;
      __int128 v80 = v125;
      __int128 v81 = v126;
      *(void *)&__int128 v124 = v71;
      *((void *)&v124 + 1) = v73;
      __int128 v125 = v79;
      __int128 v126 = v80;
      __int128 v127 = v81;
      unsigned __int8 v128 = 1;
      unint64_t v82 = sub_1A444();
      unint64_t v83 = sub_1A480();
      swift_bridgeObjectRetain(v71);
      id v84 = v77;
      swift_retain(v79);
      swift_retain(*((void *)&v79 + 1));
      _ConditionalContent<>.init(storage:)(&v114, &v124, &unk_21E90, &unk_21E08, v82, v83);
      __int128 v119 = v114;
      __int128 v120 = v115;
      __int128 v121 = v116;
      __int128 v122 = v117;
      __int16 v123 = v118;
      uint64_t v85 = sub_47B4(&qword_25370);
      uint64_t v86 = sub_1A420();
      unint64_t v87 = sub_1A4BC();
      _ConditionalContent<>.init(storage:)(&v124, &v119, v85, &unk_21D80, v86, v87);
      swift_release(*((void *)&v79 + 1));
      swift_release(v79);

      swift_bridgeObjectRelease(v71);
      uint64_t v57 = *((void *)&v124 + 1);
      uint64_t v56 = v124;
      uint64_t v59 = *((void *)&v125 + 1);
      uint64_t v58 = v125;
      uint64_t v61 = *((void *)&v126 + 1);
      uint64_t v60 = v126;
      uint64_t v63 = *((void *)&v127 + 1);
      uint64_t v62 = v127;
      if (v129) {
        __int16 v88 = 256;
      }
      else {
        __int16 v88 = 0;
      }
      __int16 v65 = v88 | v128;
      uint64_t v66 = v34;
      uint64_t v67 = v109;
      uint64_t v68 = v113;
      uint64_t v69 = v112;
      char v17 = v108;
      goto LABEL_23;
    }

    goto LABEL_25;
  }

  MapItems.mapPin.getter();
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = type metadata accessor for MapsOverlayView(0LL);
    uint64_t v40 = a1 + *(int *)(v91 + 24);
    uint64_t v92 = *(void **)v40;
    if (!*(void *)v40) {
      goto LABEL_25;
    }
    uint64_t v66 = v34;
    uint64_t v93 = (__int128 *)(a1 + *(int *)(v91 + 20));
    uint64_t v94 = *((void *)v93 + 4);
    __int128 v95 = v93[1];
    __int128 v119 = *v93;
    __int128 v120 = v95;
    *(void *)&__int128 v121 = v94;
    id v96 = v92;
    uint64_t v97 = sub_47B4(&qword_25420);
    State.projectedValue.getter(&v124, v97);
    *(void *)&__int128 v119 = v90;
    *((void *)&v119 + 1) = v92;
    __int128 v120 = v124;
    __int128 v121 = v125;
    __int128 v122 = v126;
    __int16 v123 = 256;
    uint64_t v98 = sub_47B4(&qword_25370);
    uint64_t v99 = sub_1A420();
    unint64_t v100 = sub_1A4BC();
    _ConditionalContent<>.init(storage:)(&v124, &v119, v98, &unk_21D80, v99, v100);
    uint64_t v57 = *((void *)&v124 + 1);
    uint64_t v56 = v124;
    uint64_t v59 = *((void *)&v125 + 1);
    uint64_t v58 = v125;
    uint64_t v61 = *((void *)&v126 + 1);
    uint64_t v60 = v126;
    uint64_t v63 = *((void *)&v127 + 1);
    uint64_t v62 = v127;
    if (v129) {
      __int16 v101 = 256;
    }
    else {
      __int16 v101 = 0;
    }
    __int16 v65 = v101 | v128;
  }

  else
  {
    uint64_t v56 = 0LL;
    uint64_t v57 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v59 = 0LL;
    uint64_t v60 = 0LL;
    uint64_t v61 = 0LL;
    uint64_t v62 = 0LL;
    uint64_t v63 = 0LL;
    __int16 v65 = -256;
    uint64_t v66 = v34;
  }

  uint64_t v67 = v109;
  uint64_t v68 = v113;
  uint64_t v69 = v112;
LABEL_23:
  *(void *)uint64_t v69 = v56;
  *((void *)v69 + 1) = v57;
  *((void *)v69 + 2) = v58;
  *((void *)v69 + 3) = v59;
  *((void *)v69 + 4) = v60;
  *((void *)v69 + 5) = v61;
  *((void *)v69 + 6) = v62;
  *((void *)v69 + 7) = v63;
  *((_WORD *)v69 + 32) = v65;
  swift_storeEnumTagMultiPayload(v69, v68, 0LL);
  uint64_t v102 = sub_47B4(&qword_25350);
  unint64_t v103 = sub_1A32C();
  sub_1A9A0((uint64_t)&unk_25390);
  _ConditionalContent<>.init(storage:)(v66, v69, v102, v67, v103, v104);
  return (*((uint64_t (**)(char *, uint64_t))v17 + 1))(v20, v110);
}

void MapItems.mapAnnotation.getter()
{
  uint64_t v53 = type metadata accessor for MapIdentifiablePlace.ViewType(0LL);
  sub_A76C();
  __chkstk_darwin(v2);
  sub_A7B4();
  uint64_t v5 = (void *)(v4 - v3);
  uint64_t v62 = sub_1AA40();
  uint64_t v60 = *(void *)(v62 - 8);
  sub_8E6C();
  __chkstk_darwin(v6);
  sub_8E34();
  uint64_t v63 = v7;
  sub_47B4(&qword_25128);
  sub_A76C();
  __chkstk_darwin(v8);
  sub_A7B4();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for MapItems.MapAnnotationItem(0LL);
  uint64_t v64 = *(void *)(v12 - 8);
  sub_8E6C();
  __chkstk_darwin(v13);
  sub_8E34();
  uint64_t v65 = v14;
  uint64_t v61 = sub_1AA48();
  uint64_t v59 = *(void *)(v61 - 8);
  sub_8E6C();
  __chkstk_darwin(v15);
  sub_1AAC0();
  uint64_t v18 = v16 - v17;
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v51 - v20;
  uint64_t v22 = type metadata accessor for MapItems(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  sub_1A9E8();
  (*(void (**)(void *, uint64_t, uint64_t))(v23 + 16))(v1, v0, v22);
  if ((*(unsigned int (**)(void *, uint64_t))(v23 + 88))(v1, v22) == enum case for MapItems.mapAnnotationItem(_:))
  {
    sub_1ABBC(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 96));
    uint64_t v24 = *v1;
    uint64_t v25 = *(void *)(*v1 + 16LL);
    if (v25)
    {
      id v52 = v5;
      uint64_t v66 = &_swiftEmptyArrayStorage;
      sub_1AB58();
      unint64_t v26 = (*(unsigned __int8 *)(v64 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      uint64_t v51 = v24;
      uint64_t v27 = v24 + v26;
      uint64_t v28 = *(void *)(v64 + 72);
      uint64_t v54 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 16);
      uint64_t v55 = v28;
      uint64_t v29 = v53;
      uint64_t v57 = v12;
      uint64_t v58 = v11;
      uint64_t v56 = v21;
      do
      {
        uint64_t v30 = v54(v65, v27, v12);
        double v31 = MapItems.MapAnnotationItem.latitude.getter(v30);
        double v32 = MapItems.MapAnnotationItem.longitude.getter();
        MapItems.MapAnnotationItem.annotationView.getter();
        swift_storeEnumTagMultiPayload(v11, v29, 1LL);
        sub_1ABB0();
        uint64_t v36 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v33, v34, v35, v29);
        uint64_t v37 = v63;
        UUID.init()(v36);
        uint64_t v38 = v61;
        uint64_t v39 = *(int *)(v61 + 24);
        *(void *)(v18 + v39) = 0LL;
        uint64_t v40 = v18 + *(int *)(v38 + 28);
        uint64_t v41 = sub_1AAF0();
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v40, 1LL, 1LL, v41);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v18, v37, v62);
        uint64_t v42 = (double *)(v18 + *(int *)(v38 + 20));
        *uint64_t v42 = v31;
        v42[1] = v32;
        if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v11, 1LL, v29) == 1)
        {
          sub_1A93C(v11, &qword_25128);
        }

        else
        {
          uint64_t v43 = v29;
          __int128 v44 = v52;
          sub_18F78();
          if (swift_getEnumCaseMultiPayload(v44, v43) == 1)
          {
            sub_1A93C(v40, &qword_25130);
            (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v41 - 8) + 32LL))(v40, v44, v41);
            sub_1ABB0();
            _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v45, v46, v47, v41);
          }

          else
          {
            *(void *)(v18 + v39) = *v44;
          }

          uint64_t v29 = v53;
        }

        sub_18F78();
        uint64_t v12 = v57;
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v65, v57);
        __int128 v48 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) == 0)
        {
          sub_1AAE8(0LL, v48[2] + 1LL);
          __int128 v48 = v66;
        }

        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1)
        {
          sub_1AAE8(v49 > 1, v50 + 1);
          __int128 v48 = v66;
        }

        v48[2] = v50 + 1;
        sub_1AB40();
        sub_18F78();
        v27 += v55;
        --v25;
        uint64_t v11 = v58;
      }

      while (v25);
      swift_bridgeObjectRelease(v51);
    }

    else
    {
      swift_bridgeObjectRelease(*v1);
    }
  }

  else
  {
    sub_1ABBC(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  }

  sub_D04C();
}

void MapItems.mapMarker.getter()
{
}

void MapItems.mapPin.getter()
{
}

void sub_17DA8()
{
  uint64_t v93 = v2;
  uint64_t v94 = v3;
  uint64_t v99 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for MapIdentifiablePlace.ViewType(0LL);
  sub_A76C();
  __chkstk_darwin(v10);
  sub_1AA00();
  sub_1AAB0();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v77 - v12;
  uint64_t v14 = sub_1AA40();
  uint64_t v91 = *(void *)(v14 - 8);
  uint64_t v92 = v14;
  sub_8E6C();
  __chkstk_darwin(v15);
  sub_1AA00();
  sub_1AAB0();
  __chkstk_darwin(v16);
  unint64_t v82 = (char *)&v77 - v17;
  sub_47B4(&qword_25128);
  sub_A76C();
  __chkstk_darwin(v18);
  sub_1AAC0();
  uint64_t v21 = v19 - v20;
  __chkstk_darwin(v22);
  __int128 v81 = (uint64_t *)((char *)&v77 - v23);
  uint64_t v24 = type metadata accessor for Color(0LL);
  uint64_t v97 = *(void *)(v24 - 8);
  uint64_t v98 = v24;
  sub_8E6C();
  __chkstk_darwin(v25);
  sub_8E34();
  uint64_t v96 = v26;
  uint64_t v27 = v8(0LL);
  uint64_t v100 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  unint64_t v103 = (char *)&v77 - v28;
  uint64_t v90 = sub_1AA48();
  uint64_t v95 = *(void *)(v90 - 8);
  sub_8E6C();
  __chkstk_darwin(v29);
  sub_1AA00();
  sub_1AAB0();
  uint64_t v31 = __chkstk_darwin(v30);
  __int16 v101 = (char *)&v77 - v32;
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v77 - v33;
  uint64_t v35 = type metadata accessor for MapItems(0LL);
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  sub_1A9E8();
  sub_1ABA4((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 16));
  if ((*(unsigned int (**)(void *, uint64_t))(v36 + 88))(v0, v35) == *v6)
  {
    sub_1AB68((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v36 + 96));
    uint64_t v37 = *v0;
    uint64_t v38 = *(void *)(*v0 + 16LL);
    if (v38)
    {
      uint64_t v104 = &_swiftEmptyArrayStorage;
      sub_1AB58();
      unint64_t v39 = (*(unsigned __int8 *)(v100 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80);
      uint64_t v78 = v37;
      uint64_t v40 = v37 + v39;
      uint64_t v41 = *(void *)(v100 + 72);
      __int16 v88 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v100 + 16);
      uint64_t v89 = v41;
      uint64_t v42 = v83;
      uint64_t v80 = v21;
      uint64_t v86 = v27;
      uint64_t v87 = v9;
      uint64_t v85 = v34;
      __int128 v79 = v13;
      do
      {
        uint64_t v102 = v38;
        uint64_t v43 = v103;
        uint64_t v44 = v88(v103, v40, v27);
        uint64_t v45 = v96;
        uint64_t v46 = v99(v44);
        uint64_t v47 = Color.swiftValue.getter(v46);
        (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v45, v98);
        if (v47)
        {
          sub_1AB8C();
          sub_1AB98();
          uint64_t v49 = v48;
          uint64_t v50 = (uint64_t)v81;
          *__int128 v81 = v47;
          uint64_t v51 = v87;
          swift_storeEnumTagMultiPayload(v50, v87, 0LL);
          sub_1ABB0();
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v52, v53, v54, v51);
          swift_retain(v47);
          sub_1ABE4();
          uint64_t v55 = v90;
          uint64_t v56 = *(int *)(v90 + 24);
          uint64_t v57 = (uint64_t)v101;
          *(void *)&v101[v56] = 0LL;
          uint64_t v58 = v57 + *(int *)(v55 + 28);
          uint64_t v59 = sub_1AAF0();
          sub_1AA84(v59);
          sub_1ABD0(v57, v60);
          uint64_t v61 = (void *)(v57 + *(int *)(v55 + 20));
          *uint64_t v61 = v1;
          v61[1] = v49;
          if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v50, 1LL, v51) == 1)
          {
            sub_1A93C(v50, &qword_25128);
          }

          else
          {
            uint64_t v72 = v56;
            uint64_t v73 = v79;
            sub_18F78();
            if (swift_getEnumCaseMultiPayload(v73, v51) == 1)
            {
              sub_1A93C(v58, &qword_25130);
              (*(void (**)(uint64_t, void *, char *))(*((void *)v43 - 1) + 32LL))(v58, v73, v43);
              sub_1AA70();
            }

            else
            {
              *(void *)&v101[v72] = *v73;
            }
          }

          uint64_t v42 = v83;
          uint64_t v21 = v80;
          sub_1AA2C();
          sub_18F78();
          swift_release(v47);
        }

        else
        {
          uint64_t v62 = v42;
          sub_1AB8C();
          sub_1AB98();
          uint64_t v64 = v63;
          uint64_t v65 = v87;
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v21, 1LL, 1LL, v87);
          sub_1ABE4();
          uint64_t v66 = v90;
          uint64_t v67 = *(int *)(v90 + 24);
          uint64_t v68 = v84;
          *(void *)(v84 + v67) = 0LL;
          uint64_t v58 = v68 + *(int *)(v66 + 28);
          uint64_t v69 = sub_1AAF0();
          sub_1AA84(v69);
          sub_1ABD0(v68, v70);
          uint64_t v71 = (void *)(v68 + *(int *)(v66 + 20));
          void *v71 = v1;
          v71[1] = v64;
          if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v21, 1LL, v65) == 1)
          {
            sub_1A93C(v21, &qword_25128);
            sub_1AA2C();
            uint64_t v42 = v62;
          }

          else
          {
            uint64_t v42 = v62;
            sub_18F78();
            if (swift_getEnumCaseMultiPayload(v62, v65) == 1)
            {
              sub_1A93C(v58, &qword_25130);
              (*(void (**)(uint64_t, void *, char *))(*((void *)v43 - 1) + 32LL))(v58, v62, v43);
              sub_1AA70();
            }

            else
            {
              *(void *)(v84 + v67) = *v62;
            }

            sub_1AA2C();
          }

          sub_18F78();
        }

        (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v58, v27);
        uint64_t v74 = v104;
        if ((swift_isUniquelyReferenced_nonNull_native(v104) & 1) == 0)
        {
          sub_1AAE8(0LL, v74[2] + 1LL);
          uint64_t v74 = v104;
        }

        unint64_t v76 = v74[2];
        unint64_t v75 = v74[3];
        if (v76 >= v75 >> 1)
        {
          sub_1AAE8(v75 > 1, v76 + 1);
          uint64_t v74 = v104;
        }

        v74[2] = v76 + 1;
        sub_1AB40();
        sub_18F78();
        v40 += v89;
        uint64_t v38 = v102 - 1;
      }

      while (v102 != 1);
      swift_bridgeObjectRelease(v78);
    }

    else
    {
      swift_bridgeObjectRelease(*v0);
    }
  }

  else
  {
    sub_1AB68((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
  }

  sub_D04C();
}

void sub_183E4()
{
  uint64_t v2 = sub_1AAF8();
  type metadata accessor for MapInteractionModes(v2);
  sub_A76C();
  __chkstk_darwin(v3);
  sub_16630();
  sub_47B4(&qword_253B0);
  sub_A76C();
  __chkstk_darwin(v4);
  sub_A7B4();
  uint64_t v7 = v6 - v5;
  sub_1ABF0();
  sub_47B4(&qword_253B8);
  sub_1ABD8();
  uint64_t v8 = sub_47B4(&qword_253C0);
  sub_1AB80(v7, v9, v10, v8);
  v19[0] = *v0;
  uint64_t v11 = swift_bridgeObjectRetain(v19[0]);
  static MapInteractionModes.all.getter(v11);
  uint64_t v12 = sub_1AB70();
  uint64_t v13 = sub_47B4(&qword_253D0);
  sub_1A9A0((uint64_t)&unk_253D8);
  uint64_t v15 = v14;
  sub_1A9A0((uint64_t)&unk_253E0);
  uint64_t v17 = v16;
  sub_1905C((uint64_t)&unk_253E8);
  Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)( v20,  v1,  0LL,  v7,  v19,  sub_18548,  0LL,  v12,  v13,  v15,  v17,  v18);
  sub_1A9D4();
}

uint64_t sub_18548(uint64_t a1)
{
  uint64_t v2 = (double *)(a1 + *(int *)(type metadata accessor for MapIdentifiablePlace(0LL) + 20));
  double v3 = *v2;
  double v4 = v2[1];
  v8[2] = a1;
  uint64_t v5 = sub_47B4(&qword_253F0);
  unint64_t v6 = sub_1A780();
  return MapAnnotation.init(coordinate:anchorPoint:content:)(sub_1A778, v8, v5, v6, v3, v4, 0.5, 0.5);
}

uint64_t sub_185D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = type metadata accessor for CustomCanvasView(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  double v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_47B4(&qword_25130);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for CustomCanvas(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  type metadata accessor for MapIdentifiablePlace(0LL);
  sub_18FA8();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v7, 1LL, v8) == 1)
  {
    sub_1A93C((uint64_t)v7, &qword_25130);
    uint64_t v15 = 1LL;
    uint64_t v16 = v20;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    CustomCanvasView.init(model:)(v12);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v17 = v20;
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v20, v4, v1);
    uint64_t v15 = 0LL;
    uint64_t v16 = v17;
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v16, v15, 1LL, v1);
}

uint64_t sub_187A4(uint64_t a1)
{
  return sub_1892C(a1, (uint64_t (*)(double, double))&MapPin.init(coordinate:tint:));
}

void sub_187B0()
{
}

void sub_187DC(uint64_t (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v11 = sub_47B4(&qword_253C0);
  sub_1AB80(v5, v12, v13, v11);
  v20[0] = *v3;
  uint64_t v14 = swift_bridgeObjectRetain(v20[0]);
  static MapInteractionModes.all.getter(v14);
  uint64_t v15 = sub_1AB70();
  uint64_t v16 = a1(0LL);
  sub_1A9A0((uint64_t)&unk_253D8);
  uint64_t v18 = v17;
  sub_1905C((uint64_t)&unk_253E8);
  Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)( v21,  v4,  0LL,  v5,  v20,  a2,  0LL,  v15,  v16,  v18,  a3,  v19);
  sub_1A9D4();
}

uint64_t sub_18920(uint64_t a1)
{
  return sub_1892C(a1, (uint64_t (*)(double, double))&MapMarker.init(coordinate:tint:));
}

uint64_t sub_1892C(uint64_t a1, uint64_t (*a2)(double, double))
{
  uint64_t v3 = sub_1AA48();
  uint64_t v4 = (double *)(a1 + *(int *)(v3 + 20));
  double v5 = *v4;
  double v6 = v4[1];
  swift_retain(*(void *)(a1 + *(int *)(v3 + 24)));
  return a2(v5, v6);
}

void sub_18988()
{
}

void MapIdentifiablePlace.init(id:lat:lon:view:)()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_1AAF8();
  uint64_t v8 = type metadata accessor for MapIdentifiablePlace.ViewType(v7);
  sub_A76C();
  __chkstk_darwin(v9);
  sub_1AAC0();
  uint64_t v12 = (void *)(v10 - v11);
  __chkstk_darwin(v13);
  uint64_t v14 = (int *)sub_1AA48();
  uint64_t v15 = v14[6];
  *(void *)(v0 + v15) = 0LL;
  uint64_t v16 = v0 + v14[7];
  uint64_t v17 = sub_1AAF0();
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v16, 1LL, 1LL, v17);
  uint64_t v18 = sub_1AA40();
  sub_1ABD0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 32LL));
  uint64_t v19 = (void *)(v0 + v14[5]);
  *uint64_t v19 = v6;
  v19[1] = v4;
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v2, 1LL, v8) == 1)
  {
    sub_1A93C(v2, &qword_25128);
  }

  else
  {
    sub_18F78();
    sub_18F78();
    if (swift_getEnumCaseMultiPayload(v12, v8) == 1)
    {
      sub_1A93C(v16, &qword_25130);
      (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v17 - 8) + 32LL))(v16, v12, v17);
      sub_1ABB0();
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v20, v21, v22, v17);
    }

    else
    {
      *(void *)(v0 + v15) = *v12;
    }
  }

uint64_t MapIdentifiablePlace.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AA40();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

double MapIdentifiablePlace.location.getter()
{
  return *(double *)(v0 + *(int *)(sub_1AA48() + 20));
}

double MapIdentifiablePlace.tint.getter()
{
  uint64_t v1 = type metadata accessor for MapIdentifiablePlace(0LL);
  *(void *)&double result = swift_retain(*(void *)(v0 + *(int *)(v1 + 24))).n128_u64[0];
  return result;
}

void MapIdentifiablePlace.tint.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(sub_1AA48() + 24);
  swift_release(*(void *)(v1 + v3));
  *(void *)(v1 + v3) = a1;
  sub_1253C();
}

uint64_t (*MapIdentifiablePlace.tint.modify())()
{
  return CoreChartPluginView.body.getter;
}

void MapIdentifiablePlace.canvas.getter()
{
  uint64_t v0 = sub_1AAF8();
  type metadata accessor for MapIdentifiablePlace(v0);
  sub_18FA8();
  sub_8E2C();
}

uint64_t MapIdentifiablePlace.canvas.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MapIdentifiablePlace(0LL) + 28);
  return sub_18FD8(a1, v3);
}

uint64_t (*MapIdentifiablePlace.canvas.modify())()
{
  return CoreChartPluginView.body.getter;
}

uint64_t sub_18C9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_18CD4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    char v8 = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v8,  1046LL,  0);
    __break(1u);
  }

  else if (a3 < a1 {
         || (uint64_t result = type metadata accessor for MapIdentifiablePlace(0LL),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for MapIdentifiablePlace(0LL);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }

  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }

  return result;
}

uint64_t sub_18DD0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    uint64_t v6 = type metadata accessor for MapIdentifiablePlace(0LL);
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 72LL) * a2;
    unint64_t v8 = a3 + v7;
    unint64_t v9 = a1 + v7;
    if (v8 <= a1 || v9 <= a3) {
      return swift_arrayInitWithCopy(a3, a1, a2, v6);
    }
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

void sub_18EC4(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.isEnabled.getter() & 1;
  sub_8E2C();
}

void sub_18EEC(unsigned __int8 *a1)
{
}

uint64_t sub_18F0C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE *sub_18F1C(_BYTE *result)
{
  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t type metadata accessor for MapIdentifiablePlace.ViewType(uint64_t a1)
{
  return sub_4DE4(a1, qword_252E8, (uint64_t)&nominal type descriptor for MapIdentifiablePlace.ViewType);
}

uint64_t type metadata accessor for MapIdentifiablePlace(uint64_t a1)
{
  return sub_4DE4(a1, (uint64_t *)&unk_25230, (uint64_t)&nominal type descriptor for MapIdentifiablePlace);
}

size_t sub_18F5C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1A7FC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void sub_18F78()
{
  uint64_t v1 = v0(0LL);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL));
  sub_8E2C();
}

void sub_18FA8()
{
  uint64_t v1 = sub_47B4(v0);
  sub_12488(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL));
  sub_8E2C();
}

uint64_t sub_18FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B4(&qword_25130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_19020(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of MapsOverlayView.body>>,  1LL);
}

void sub_19030()
{
}

void sub_1905C(uint64_t a1)
{
  if (!sub_1AB30(a1))
  {
    uint64_t v3 = v2(255LL);
    atomic_store(sub_8E9C(v3), v1);
  }

  sub_8E2C();
}

uint64_t *initializeBufferWithCopyOfBuffer for MapsOverlayView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v19);
  }

  else
  {
    uint64_t v7 = type metadata accessor for MapOverlayModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    __int128 v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    uint64_t v13 = *((void *)v11 + 4);
    *((void *)v10 + 4) = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v9);
    uint64_t v15 = (char *)a2 + v9;
    uint64_t v17 = *(void **)v15;
    uint64_t v16 = *((void *)v15 + 1);
    void *v14 = v17;
    v14[1] = v16;
    swift_retain(v13);
    id v18 = v17;
  }

  return a1;
}

void destroy for MapsOverlayView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapOverlayModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_release(*(void *)(a1 + *(int *)(a2 + 20) + 32));
}

uint64_t initializeWithCopy for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MapOverlayModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  __int128 v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  uint64_t v12 = *(void *)(v10 + 32);
  *(void *)(v9 + 32) = v12;
  uint64_t v13 = (void *)(a1 + v8);
  uint64_t v14 = a2 + v8;
  uint64_t v16 = *(void **)v14;
  uint64_t v15 = *(void *)(v14 + 8);
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_retain(v12);
  id v17 = v16;
  return a1;
}

uint64_t assignWithCopy for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MapOverlayModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = v8[4];
  uint64_t v11 = v9[4];
  void v8[4] = v11;
  swift_retain(v11);
  swift_release(v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void **)(a1 + v12);
  uint64_t v16 = *(void **)v14;
  *uint64_t v13 = *(void *)v14;
  id v17 = v16;

  v13[1] = *(void *)(v14 + 8);
  return a1;
}

uint64_t initializeWithTake for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MapOverlayModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  __int128 v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MapOverlayModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __int128 v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  uint64_t v11 = *(void *)(v8 + 32);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  swift_release(v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = *(void **)(a1 + v12);
  *uint64_t v13 = *v14;

  v13[1] = v14[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_193E4);
}

void sub_193E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1ABC8();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_1AA20(a1, a2, v6);
  }

  else
  {
    sub_1AA50(*(void *)(a1 + *(int *)(a3 + 20) + 32));
    sub_1253C();
  }

uint64_t storeEnumTagSinglePayload for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1944C);
}

void sub_1944C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1ABC8();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_1AA14(a1, a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 32) = a2;
    sub_1253C();
  }

uint64_t sub_194B0(uint64_t a1)
{
  uint64_t result = type metadata accessor for MapOverlayModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "(";
    void v4[2] = &unk_1CB48;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MapIdentifiablePlace(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v15);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = v9;
    uint64_t v10 = a3[7];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for CustomCanvas(0LL);
    swift_retain(v9);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1LL, v13))
    {
      uint64_t v14 = sub_47B4(&qword_25130);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v11, 0LL, 1LL, v13);
    }
  }

  return a1;
}

uint64_t destroy for MapIdentifiablePlace(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_release(*(void *)(a1 + *(int *)(a2 + 24)));
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = type metadata accessor for CustomCanvas(0LL);
  uint64_t result = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1LL, v6);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = *(void *)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for CustomCanvas(0LL);
  swift_retain(v8);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1LL, v12))
  {
    uint64_t v13 = sub_47B4(&qword_25130);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 0LL, 1LL, v12);
  }

  return a1;
}

uint64_t assignWithCopy for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void *)(a1 + v10);
  uint64_t v12 = *(void *)(a2 + v10);
  *(void *)(a1 + v1sub_BDD8(v0, 0) = v12;
  swift_retain(v12);
  swift_release(v11);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for CustomCanvas(0LL);
  int v17 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1LL, v16);
  int v18 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1LL, v16);
  if (!v17)
  {
    uint64_t v19 = *(void *)(v16 - 8);
    if (!v18)
    {
      (*(void (**)(void *, const void *, uint64_t))(v19 + 24))(v14, v15, v16);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v19 + 8))(v14, v16);
    goto LABEL_6;
  }

  if (v18)
  {
LABEL_6:
    uint64_t v20 = sub_47B4(&qword_25130);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0LL, 1LL, v16);
  return a1;
}

uint64_t initializeWithTake for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for CustomCanvas(0LL);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1LL, v11))
  {
    uint64_t v12 = sub_47B4(&qword_25130);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 0LL, 1LL, v11);
  }

  return a1;
}

uint64_t assignWithTake for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release(v8);
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for CustomCanvas(0LL);
  int v13 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1LL, v12);
  int v14 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1LL, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }

  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_47B4(&qword_25130);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 0LL, 1LL, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapIdentifiablePlace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_19B3C);
}

void sub_19B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AA40();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
  }

  else
  {
    if ((_DWORD)a2 == 2147483646)
    {
      sub_1AA50(*(void *)(a1 + *(int *)(a3 + 24)));
      sub_1253C();
      return;
    }

    uint64_t v7 = sub_47B4(&qword_25130);
    uint64_t v8 = a1 + *(int *)(a3 + 28);
  }

  sub_1AA20(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for MapIdentifiablePlace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_19BC8);
}

void sub_19BC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1AA40();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + swift_release(*(void *)(v0 + 24)) = a2;
      sub_1253C();
      return;
    }

    uint64_t v9 = sub_47B4(&qword_25130);
    uint64_t v10 = a1 + *(int *)(a4 + 28);
  }

  sub_1AA14(v10, a2, a2, v9);
}

void sub_19C50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = &unk_1CB78;
    void v6[2] = &unk_1CB90;
    sub_19CE8(319LL);
    if (v5 <= 0x3F)
    {
      void v6[3] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 4LL, v6, a1 + 16);
    }
  }

void sub_19CE8(uint64_t a1)
{
  if (!qword_25240)
  {
    uint64_t v2 = type metadata accessor for CustomCanvas(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_25240);
    }
  }

uint64_t *initializeBufferWithCopyOfBuffer for MapIdentifiablePlace.ViewType( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v11);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v7 = type metadata accessor for CustomCanvas(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v12 = *a2;
      *a1 = *a2;
      swift_retain(v12);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

uint64_t destroy for MapIdentifiablePlace.ViewType(void *a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CustomCanvas(0LL);
  return (*(uint64_t (**)(void *, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
}

uint64_t *initializeWithCopy for MapIdentifiablePlace.ViewType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = type metadata accessor for CustomCanvas(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    swift_retain(v10);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v7, v8, v9);
  return a1;
}

uint64_t *assignWithCopy for MapIdentifiablePlace.ViewType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_19F78((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v6 = type metadata accessor for CustomCanvas(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
    }

    else
    {
      uint64_t v10 = *a2;
      *a1 = *a2;
      swift_retain(v10);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v7, v8, v9);
  }

  return a1;
}

uint64_t sub_19F78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapIdentifiablePlace.ViewType(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *initializeWithTake for MapIdentifiablePlace.ViewType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = type metadata accessor for CustomCanvas(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

void *assignWithTake for MapIdentifiablePlace.ViewType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_19F78((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v6 = type metadata accessor for CustomCanvas(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_1A0DC(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for CustomCanvas(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

unint64_t sub_1A154()
{
  unint64_t result = qword_25320;
  if (!qword_25320)
  {
    uint64_t v1 = sub_67CC(&qword_25120);
    sub_1A1D8();
    sub_1A9A0((uint64_t)&unk_253A0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_25320);
  }

  return result;
}

unint64_t sub_1A1D8()
{
  unint64_t result = qword_25328;
  if (!qword_25328)
  {
    uint64_t v1 = sub_67CC(&qword_25118);
    sub_1A244();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_25328);
  }

  return result;
}

unint64_t sub_1A244()
{
  unint64_t result = qword_25330;
  if (!qword_25330)
  {
    uint64_t v1 = sub_67CC(&qword_25110);
    sub_1A2A8();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_25330);
  }

  return result;
}

unint64_t sub_1A2A8()
{
  unint64_t result = qword_25338;
  if (!qword_25338)
  {
    uint64_t v1 = sub_67CC(&qword_25340);
    sub_1A32C();
    sub_1A9A0((uint64_t)&unk_25390);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_25338);
  }

  return result;
}

unint64_t sub_1A32C()
{
  unint64_t result = qword_25348;
  if (!qword_25348)
  {
    uint64_t v1 = sub_67CC(&qword_25350);
    sub_1A3B0(&qword_25358, &qword_25360, (void (*)(void))sub_1A420, (void (*)(void))sub_1A4BC);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_25348);
  }

  return result;
}

uint64_t sub_1A3B0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_67CC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1A420()
{
  return sub_1A3B0(&qword_25368, &qword_25370, (void (*)(void))sub_1A444, (void (*)(void))sub_1A480);
}

unint64_t sub_1A444()
{
  unint64_t result = qword_25378;
  if (!qword_25378)
  {
    unint64_t result = swift_getWitnessTable(&unk_1CC84, &unk_21E90);
    atomic_store(result, (unint64_t *)&qword_25378);
  }

  return result;
}

unint64_t sub_1A480()
{
  unint64_t result = qword_25380;
  if (!qword_25380)
  {
    unint64_t result = swift_getWitnessTable(&unk_1CC34, &unk_21E08);
    atomic_store(result, (unint64_t *)&qword_25380);
  }

  return result;
}

unint64_t sub_1A4BC()
{
  unint64_t result = qword_25388;
  if (!qword_25388)
  {
    unint64_t result = swift_getWitnessTable(&unk_1CBE4, &unk_21D80);
    atomic_store(result, (unint64_t *)&qword_25388);
  }

  return result;
}

__n128 sub_1A504(uint64_t a1, uint64_t a2)
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

void type metadata accessor for MapPinView()
{
}

void type metadata accessor for MapMarkerView()
{
}

uint64_t sub_1A53C(uint64_t a1)
{
  uint64_t v2 = sub_1AB30(a1);
  swift_bridgeObjectRelease(v2);

  swift_release(*(void *)(v1 + 16));
  return swift_release(*(void *)(v1 + 24));
}

void sub_1A56C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  __int128 v4 = (void *)a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  __int128 v7 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRetain(v3);
  id v8 = v4;
  swift_retain(v5);
  swift_retain(v6);
  sub_1253C();
}

void sub_1A5BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = (void *)a2[1];
  __int128 v7 = (void *)a1[1];
  a1[1] = (uint64_t)v6;
  id v8 = v6;

  uint64_t v9 = a1[2];
  uint64_t v10 = a2[2];
  a1[2] = v10;
  swift_retain(v10);
  swift_release(v9);
  uint64_t v11 = a2[3];
  uint64_t v12 = a1[3];
  a1[3] = v11;
  swift_retain(v11);
  swift_release(v12);
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  sub_1253C();
}

void sub_1A65C()
{
  uint64_t v3 = *(void **)(v1 + 8);
  *(_OWORD *)uint64_t v1 = *v0;

  swift_release(*(void *)(v1 + 16));
  uint64_t v4 = *(void *)(v1 + 24);
  *(_OWORD *)(v1 + 16) = v0[1];
  swift_release(v4);
  __int128 v5 = v0[3];
  *(_OWORD *)(v1 + 32) = v0[2];
  *(_OWORD *)(v1 + 48) = v5;
  sub_8E2C();
}

uint64_t sub_1A6AC(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t sub_1A6EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 4sub_BDD8(v0, 0) = 0u;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for MapAnnotationView()
{
}

uint64_t sub_1A748(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1E0C4, 1LL);
}

uint64_t sub_1A758(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1E09C, 1LL);
}

uint64_t sub_1A768(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1E074, 1LL);
}

uint64_t sub_1A778@<X0>(uint64_t a1@<X8>)
{
  return sub_185D0(a1);
}

unint64_t sub_1A780()
{
  unint64_t result = qword_253F8;
  if (!qword_253F8)
  {
    uint64_t v1 = sub_67CC(&qword_253F0);
    sub_1905C((uint64_t)&unk_25400);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_253F8);
  }

  return result;
}

size_t sub_1A7FC(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_25:
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
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_47B4(&qword_25408);
  uint64_t v11 = *(void *)(type metadata accessor for MapIdentifiablePlace(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  unint64_t result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if (result - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_24;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  uint64_t v17 = *(unsigned __int8 *)(*(void *)(type metadata accessor for MapIdentifiablePlace(0LL) - 8) + 80LL);
  uint64_t v18 = (v17 + 32) & ~v17;
  unint64_t v19 = (unint64_t)v15 + v18;
  unint64_t v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_18CD4(v20, v8, v19);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18DD0(v20, v8, v19);
  }

  swift_release(a4);
  return (size_t)v15;
}

void sub_1A93C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_47B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_8E2C();
}

void sub_1A974()
{
}

void sub_1A9A0(uint64_t a1)
{
  if (!sub_1AB30(a1))
  {
    uint64_t v3 = sub_67CC(v2);
    atomic_store(sub_8E9C(v3), v1);
  }

  sub_8E2C();
}

  ;
}

  ;
}

  ;
}

uint64_t sub_1AA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, a2, a3, a4);
}

uint64_t sub_1AA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(a1, a2, a3);
}

  ;
}

uint64_t sub_1AA40()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_1AA48()
{
  return type metadata accessor for MapIdentifiablePlace(0LL);
}

uint64_t sub_1AA50@<X0>(unint64_t a1@<X8>)
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

uint64_t sub_1AA70()
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v0, 0LL, 1LL, v1);
}

uint64_t sub_1AA84(uint64_t a1)
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, 1LL, 1LL, a1);
}

void sub_1AAB0()
{
  *(void *)(v1 - 256) = v0;
}

  ;
}

  ;
}

size_t sub_1AAE8(size_t a1, int64_t a2)
{
  return sub_18F5C(a1, a2, 1);
}

uint64_t sub_1AAF0()
{
  return type metadata accessor for CustomCanvas(0LL);
}

uint64_t sub_1AAF8()
{
  return 0LL;
}

  ;
}

  ;
}

uint64_t sub_1AB30(uint64_t a1)
{
  return *(void *)a1;
}

  ;
}

size_t sub_1AB58()
{
  return sub_18F5C(0LL, v0, 0);
}

uint64_t sub_1AB68@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_1AB70()
{
  return sub_47B4(v0);
}

  ;
}

uint64_t sub_1AB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, 1LL, 1LL, a4);
}

uint64_t sub_1AB8C()
{
  return (*(uint64_t (**)(void))(v0 - 200))();
}

uint64_t sub_1AB98()
{
  return (*(uint64_t (**)(void))(v0 - 192))();
}

uint64_t sub_1ABA4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2, v3);
}

  ;
}

uint64_t sub_1ABBC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_1ABC8()
{
  return type metadata accessor for MapOverlayModel(0LL);
}

uint64_t sub_1ABD0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_1ABD8()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_1ABE4()
{
  return UUID.init()();
}

__n128 sub_1ABF0()
{
  __int128 v2 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 - 16sub_BDD8(v0, 0) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 144) = v2;
  __n128 result = *(__n128 *)(v0 + 48);
  *(__n128 *)(v1 - 128) = result;
  return result;
}

uint64_t _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA6LL9SnippetUI06ActionG0Vvpfi_0()
{
  return ActionHandler.init()();
}