uint64_t *sub_4CCC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    v7 = type metadata accessor for InteractionDelegate(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_4D74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_4DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_4E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_4EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_4F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_4FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4FCC);
}

uint64_t sub_4FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_5040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_504C);
}

uint64_t sub_504C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for AppLaunchButton(uint64_t a1)
{
  uint64_t result = qword_C108;
  if (!qword_C108) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppLaunchButton);
  }
  return result;
}

uint64_t sub_5104(uint64_t a1)
{
  uint64_t result = type metadata accessor for InteractionDelegate(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_5188(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_79E0, 1LL);
}

uint64_t sub_5198()
{
  uint64_t v0 = type metadata accessor for InteractionDelegateWrapper(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  unint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [objc_allocWithZone(SAAppsLaunchApp) init];
  type metadata accessor for AppLaunchButton(0LL);
  SiriKitSnippets.AppLaunchSnippetModel.appIdentifier.getter();
  if (v5)
  {
    uint64_t v6 = v5;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    NSString v7 = 0LL;
  }

  [v4 setLaunchId:v7];

  InteractionDelegate.wrappedValue.getter(v8);
  id v9 = v4;
  InteractionDelegateWrapper.perform(aceCommand:)();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_52A4@<X0>(uint64_t a1@<X8>)
{
  v8[0] = SiriKitSnippets.AppLaunchSnippetModel.label.getter();
  v8[1] = v2;
  unint64_t v3 = sub_5764();
  uint64_t result = Text.init<A>(_:)(v8, &type metadata for String, v3);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_531C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_5334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  v24[1] = a2;
  uint64_t v5 = type metadata accessor for ButtonItemButtonStyle(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(a1 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v7);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_54E4(&qword_C140);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_5524(v4, (uint64_t)v12);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (v17 + 16) & ~v17;
  uint64_t v19 = swift_allocObject(&unk_83E8, v18 + v11, v17 | 7);
  sub_5608((uint64_t)v12, v19 + v18);
  uint64_t v26 = v4;
  uint64_t v20 = Button.init(action:label:)( sub_564C,  v19,  sub_5684,  v25,  &type metadata for Text,  &protocol witness table for Text);
  static ButtonStyle<>.buttonItemPreferred.getter(v20);
  unint64_t v21 = sub_568C();
  unint64_t v22 = sub_571C();
  View.buttonStyle<A>(_:)(v9, v13, v5, v21, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_54E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchButton(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5568()
{
  uint64_t v1 = type metadata accessor for AppLaunchButton(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  uint64_t v9 = v7 + *(int *)(v1 + 20);
  uint64_t v10 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_5608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchButton(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_564C()
{
  return sub_5198();
}

uint64_t sub_5684@<X0>(uint64_t a1@<X8>)
{
  return sub_52A4(a1);
}

unint64_t sub_568C()
{
  unint64_t result = qword_C148;
  if (!qword_C148)
  {
    uint64_t v1 = sub_56D8(&qword_C140);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Button<A>, v1);
    atomic_store(result, (unint64_t *)&qword_C148);
  }

  return result;
}

uint64_t sub_56D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_571C()
{
  unint64_t result = qword_C150;
  if (!qword_C150)
  {
    uint64_t v1 = type metadata accessor for ButtonItemButtonStyle(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ButtonItemButtonStyle, v1);
    atomic_store(result, (unint64_t *)&qword_C150);
  }

  return result;
}

unint64_t sub_5764()
{
  unint64_t result = qword_C158;
  if (!qword_C158)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_C158);
  }

  return result;
}

uint64_t sub_57A8()
{
  v1[0] = sub_56D8(&qword_C140);
  v1[1] = type metadata accessor for ButtonItemButtonStyle(255LL);
  v1[2] = sub_568C();
  v1[3] = sub_571C();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>,  1LL);
}

uint64_t *sub_5814(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for InteractionDelegate(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_58BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_5918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_5994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_5A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_5A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_5B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5B14);
}

uint64_t sub_5B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_5B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5B94);
}

uint64_t sub_5B94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ConfirmationView(uint64_t a1)
{
  uint64_t result = qword_C1B8;
  if (!qword_C1B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConfirmationView);
  }
  return result;
}

uint64_t sub_5C4C(uint64_t a1)
{
  uint64_t result = type metadata accessor for InteractionDelegate(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_5CD0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_7A30, 1LL);
}

uint64_t sub_5CE0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v23 = a3;
  uint64_t v24 = a4;
  uint64_t v6 = type metadata accessor for ConfirmationView(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_60B8(a1, (uint64_t)v9);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  uint64_t v22 = v10 | 7;
  unint64_t v12 = (v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v13 = swift_allocObject(&unk_8470, v12 + 8, v10 | 7);
  sub_61C8((uint64_t)v9, v13 + v11);
  *(void *)(v13 + v12) = a2;
  uint64_t v28 = a1;
  uint64_t v14 = sub_54E4(&qword_C140);
  v30[3] = v14;
  uint64_t v15 = sub_645C(&qword_C1F8, &qword_C140, (uint64_t)&protocol conformance descriptor for Button<A>);
  v30[4] = v15;
  sub_62D8(v30);
  id v16 = a2;
  Button.init(action:label:)(sub_62B4, v13, sub_62B8, v27, &type metadata for Text, &protocol witness table for Text);
  sub_60B8(a1, (uint64_t)v9);
  uint64_t v17 = swift_allocObject(&unk_8498, v12 + 8, v22);
  sub_61C8((uint64_t)v9, v17 + v11);
  uint64_t v18 = v23;
  *(void *)(v17 + v12) = v23;
  uint64_t v26 = a1;
  v29[3] = v14;
  v29[4] = v15;
  sub_62D8(v29);
  id v19 = v18;
  Button.init(action:label:)(sub_62B4, v17, sub_6410, v25, &type metadata for Text, &protocol witness table for Text);
  return BinaryButtonView.init(primaryButton:secondaryButton:)(v30, v29);
}

uint64_t sub_5EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for InteractionDelegateWrapper(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  InteractionDelegate.wrappedValue.getter(v5);
  InteractionDelegateWrapper.perform(directInvocation:)(a2);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_5F50@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  v10[0] = a1();
  v10[1] = v4;
  unint64_t v5 = sub_5764();
  uint64_t result = Text.init<A>(_:)(v10, &type metadata for String, v5);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_5FC4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = __chkstk_darwin(a1);
  unint64_t v5 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = static InvocationFactory.makeConfirmAndRejectActions()(v4);
  uint64_t v8 = v7;
  sub_60B8(v1, (uint64_t)v5);
  uint64_t v9 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  unint64_t v11 = (v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v13 = swift_allocObject(&unk_8448, v12 + 8, v9 | 7);
  sub_61C8((uint64_t)v5, v13 + v10);
  *(void *)(v13 + v11) = v6;
  *(void *)(v13 + v12) = v8;
  uint64_t v14 = type metadata accessor for BinaryButtonView(0LL);
  unint64_t v15 = sub_6268();
  return ComponentStack.init(content:)(sub_620C, v13, v14, v15);
}

uint64_t sub_60B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_60FC()
{
  uint64_t v1 = type metadata accessor for ConfirmationView(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v8 = v0 + v4;
  uint64_t v9 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  uint64_t v10 = v8 + *(int *)(v1 + 20);
  uint64_t v11 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);

  return swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_61C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_620C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ConfirmationView(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_5CE0(v1 + v4, *(void **)(v1 + v5), *(void **)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFF8LL)), a1);
}

unint64_t sub_6268()
{
  unint64_t result = qword_C1F0;
  if (!qword_C1F0)
  {
    uint64_t v1 = type metadata accessor for BinaryButtonView(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for BinaryButtonView, v1);
    atomic_store(result, (unint64_t *)&qword_C1F0);
  }

  return result;
}

uint64_t sub_62B8@<X0>(uint64_t a1@<X8>)
{
  return sub_5F50((uint64_t (*)(void))&SiriKitSnippets.ConfirmationSnippetModel.yesLabel.getter, a1);
}

void *sub_62D8(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_6318()
{
  uint64_t v1 = type metadata accessor for ConfirmationView(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  uint64_t v9 = v7 + *(int *)(v1 + 20);
  uint64_t v10 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_63CC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ConfirmationView(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_5EC0(v0 + v2, *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_6410@<X0>(uint64_t a1@<X8>)
{
  return sub_5F50((uint64_t (*)(void))&SiriKitSnippets.ConfirmationSnippetModel.noLabel.getter, a1);
}

uint64_t sub_6430()
{
  return sub_645C(&qword_C200, &qword_C208, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
}

uint64_t sub_645C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_56D8(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t *sub_649C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for InteractionDelegate(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_6544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_65A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_661C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_6698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_6714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_6790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_679C);
}

uint64_t sub_679C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_6810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_681C);
}

uint64_t sub_681C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for PunchOutButton(uint64_t a1)
{
  uint64_t result = qword_C268;
  if (!qword_C268) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PunchOutButton);
  }
  return result;
}

uint64_t sub_68D4(uint64_t a1)
{
  uint64_t result = type metadata accessor for InteractionDelegate(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_6958(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_7A80, 1LL);
}

uint64_t sub_6968()
{
  uint64_t v1 = type metadata accessor for InteractionDelegateWrapper(0LL);
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  __chkstk_darwin(v1);
  unint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_54E4(&qword_C2A0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v15 = [objc_allocWithZone(SAUIAppPunchOut) init];
  type metadata accessor for PunchOutButton(0LL);
  uint64_t v28 = v0;
  SiriKitSnippets.PunchOutSnippetModel.punchOutURL.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
  {

    return sub_6F54((uint64_t)v10);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    id v17 = v15;
    uint64_t v18 = UUID.init()();
    UUID.uuidString.getter(v18);
    uint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    [v17 setAceId:v21];

    URL._bridgeToObjectiveC()(v22);
    uint64_t v24 = v23;
    [v17 setPunchOutUri:v23];

    InteractionDelegate.wrappedValue.getter(v25);
    id v26 = v17;
    InteractionDelegateWrapper.perform(aceCommand:)();

    (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_6BCC@<X0>(uint64_t a1@<X8>)
{
  v8[0] = SiriKitSnippets.PunchOutSnippetModel.label.getter();
  v8[1] = v2;
  unint64_t v3 = sub_5764();
  uint64_t result = Text.init<A>(_:)(v8, &type metadata for String, v3);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_6C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  v24[1] = a2;
  uint64_t v5 = type metadata accessor for ButtonItemButtonStyle(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(a1 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v7);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_54E4(&qword_C140);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_6DEC(v4, (uint64_t)v12);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (v17 + 16) & ~v17;
  uint64_t v19 = swift_allocObject(&unk_84F8, v18 + v11, v17 | 7);
  sub_6ED0((uint64_t)v12, v19 + v18);
  uint64_t v26 = v4;
  uint64_t v20 = Button.init(action:label:)( sub_6F14,  v19,  sub_6F4C,  v25,  &type metadata for Text,  &protocol witness table for Text);
  static ButtonStyle<>.buttonItemPreferred.getter(v20);
  unint64_t v21 = sub_568C();
  unint64_t v22 = sub_571C();
  View.buttonStyle<A>(_:)(v9, v13, v5, v21, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_6DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchOutButton(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6E30()
{
  uint64_t v1 = type metadata accessor for PunchOutButton(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  uint64_t v9 = v7 + *(int *)(v1 + 20);
  uint64_t v10 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_6ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchOutButton(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6F14()
{
  return sub_6968();
}

uint64_t sub_6F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_6BCC(a1);
}

uint64_t sub_6F54(uint64_t a1)
{
  uint64_t v2 = sub_54E4(&qword_C2A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_6F94()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SiriKitFlowSnippetUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC26SiriKitFlowSnippetUIPlugin26SiriKitFlowSnippetUIPlugin);
}

uint64_t sub_6FC4()
{
  return sub_7458( &qword_C340,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriKitSnippets,  (uint64_t)&protocol conformance descriptor for SiriKitSnippets);
}

uint64_t sub_6FF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject(v1, 16LL, 7LL);
  *a1 = result;
  return result;
}

uint64_t sub_7020(uint64_t a1)
{
  return sub_7034(a1);
}

uint64_t sub_7034(uint64_t a1)
{
  uint64_t v46 = a1;
  uint64_t v45 = type metadata accessor for ConfirmationView(0LL);
  __chkstk_darwin(v45);
  v44 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel(0LL);
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  __chkstk_darwin(v2);
  v41 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = type metadata accessor for PunchOutButton(0LL);
  __chkstk_darwin(v40);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriKitSnippets.PunchOutSnippetModel(0LL);
  uint64_t v38 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  __chkstk_darwin(v6);
  v37 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for AppLaunchButton(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for SiriKitSnippets(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v46, v15);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v18, v15);
  if (v19 == enum case for SiriKitSnippets.appLaunchButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v18, v11);
    uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 16))(&v10[*(int *)(v8 + 20)], v14, v11);
    InteractionDelegate.init()(v20);
    uint64_t v21 = sub_7458(&qword_C358, type metadata accessor for AppLaunchButton, (uint64_t)&unk_782C);
    uint64_t v22 = View.eraseToAnyView()(v8, v21);
    sub_7498((uint64_t)v10, type metadata accessor for AppLaunchButton);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return v22;
  }

  if (v19 == enum case for SiriKitSnippets.punchOutButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    uint64_t v24 = v37;
    uint64_t v23 = v38;
    uint64_t v25 = v39;
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v37, v18, v39);
    uint64_t v26 = v40;
    uint64_t v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v23 + 16))(&v5[*(int *)(v40 + 20)], v24, v25);
    InteractionDelegate.init()(v27);
    uint64_t v28 = sub_7458(&qword_C350, type metadata accessor for PunchOutButton, (uint64_t)&unk_78FC);
    uint64_t v22 = View.eraseToAnyView()(v26, v28);
    sub_7498((uint64_t)v5, type metadata accessor for PunchOutButton);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
    return v22;
  }

  if (v19 == enum case for SiriKitSnippets.confirmationSnippet(_:))
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    uint64_t v30 = v41;
    uint64_t v29 = v42;
    uint64_t v31 = v43;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v18, v43);
    uint64_t v33 = (uint64_t)v44;
    uint64_t v32 = v45;
    uint64_t v34 = (*(uint64_t (**)(char *, char *, uint64_t))(v29 + 16))(&v44[*(int *)(v45 + 20)], v30, v31);
    InteractionDelegate.init()(v34);
    uint64_t v35 = sub_7458(&qword_C348, type metadata accessor for ConfirmationView, (uint64_t)&unk_7894);
    uint64_t v22 = View.eraseToAnyView()(v32, v35);
    sub_7498(v33, type metadata accessor for ConfirmationView);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    return v22;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v15, v15);
  __break(1u);
  return result;
}

uint64_t sub_7458(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_7498(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}