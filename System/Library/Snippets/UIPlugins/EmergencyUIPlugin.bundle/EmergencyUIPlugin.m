uint64_t EmergencyUIPlugin.__allocating_init()()
{
  uint64_t v0;
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t EmergencyUIPlugin.snippet(for:mode:idiom:)(const void *a1)
{
  uint64_t v1 = v15;
  uint64_t v2 = v16;
  uint64_t v3 = v17;
  uint64_t v4 = v18;
  unint64_t v5 = v19;
  uint64_t v6 = v20;
  unint64_t v7 = v21;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  outlined copy of Data._Representation(v4, v5);
  outlined copy of Data._Representation(v6, v7);
  uint64_t v8 = type metadata accessor for Context(0LL);
  uint64_t v9 = lazy protocol witness table accessor for type Context and conformance Context( &lazy protocol witness table cache variable for type Context and conformance Context,  (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  v13 = (void *)EnvironmentObject.init()(v8, v9);
  unint64_t v10 = lazy protocol witness table accessor for type EmergencyConfirmationView and conformance EmergencyConfirmationView();
  uint64_t v11 = View.eraseToAnyView()(&type metadata for EmergencyConfirmationView, v10);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v1);

  outlined consume of Data._Representation(v4, v5);
  outlined consume of Data._Representation(v6, v7);
  return v11;
}

uint64_t EmergencyUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for EmergencyUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC17EmergencyUIPlugin17EmergencyUIPlugin);
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel and conformance EmergencySnippetModel()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel,  &type metadata for EmergencySnippetModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel,  &type metadata for EmergencySnippetModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel,  &type metadata for EmergencySnippetModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel and conformance EmergencySnippetModel);
  }

  return result;
}

uint64_t protocol witness for SnippetProviding.init() in conformance EmergencyUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EmergencyUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance EmergencyUIPlugin( const void *a1)
{
  return EmergencyUIPlugin.snippet(for:mode:idiom:)(v2);
}

void *outlined init with take of EmergencySnippetModel(const void *a1, void *a2)
{
  return a2;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t lazy protocol witness table accessor for type EmergencyConfirmationView and conformance EmergencyConfirmationView()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencyConfirmationView and conformance EmergencyConfirmationView;
  if (!lazy protocol witness table cache variable for type EmergencyConfirmationView and conformance EmergencyConfirmationView)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencyConfirmationView,  &type metadata for EmergencyConfirmationView);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencyConfirmationView and conformance EmergencyConfirmationView);
  }

  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t initializeBufferWithCopyOfBuffer for EmergencyConfirmationView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for EmergencyConfirmationView(uint64_t a1)
{
  return outlined consume of Data._Representation(*(void *)(a1 + 80), *(void *)(a1 + 88));
}

uint64_t initializeWithCopy for EmergencyConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v7;
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  unint64_t v11 = *(void *)(a2 + 72);
  id v12 = v4;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  outlined copy of Data._Representation(v10, v11);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v11;
  uint64_t v14 = *(void *)(a2 + 80);
  unint64_t v13 = *(void *)(a2 + 88);
  outlined copy of Data._Representation(v14, v13);
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v13;
  return a1;
}

uint64_t assignWithCopy for EmergencyConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void *)(a2 + 64);
  unint64_t v14 = *(void *)(a2 + 72);
  outlined copy of Data._Representation(v13, v14);
  uint64_t v15 = *(void *)(a1 + 64);
  unint64_t v16 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  outlined consume of Data._Representation(v15, v16);
  uint64_t v18 = *(void *)(a2 + 80);
  unint64_t v17 = *(void *)(a2 + 88);
  outlined copy of Data._Representation(v18, v17);
  uint64_t v19 = *(void *)(a1 + 80);
  unint64_t v20 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = v18;
  *(void *)(a1 + 88) = v17;
  outlined consume of Data._Representation(v19, v20);
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for EmergencyConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a1 + 64);
  unint64_t v11 = *(void *)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  outlined consume of Data._Representation(v10, v11);
  uint64_t v12 = *(void *)(a1 + 80);
  unint64_t v13 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  outlined consume of Data._Representation(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyConfirmationView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for EmergencyConfirmationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for EmergencyConfirmationView()
{
  return &type metadata for EmergencyConfirmationView;
}

uint64_t associated type witness table accessor for View.Body : View in EmergencyConfirmationView(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of EmergencyConfirmationView.body>>,  1LL);
}

void closure #1 in EmergencyConfirmationView.primaryButton()(uint64_t a1)
{
  id v2 = static SABaseCommand.from(data:)();
  if (v2)
  {
    if (*(void *)a1)
    {
      uint64_t v3 = v2;
      id v7 = *(id *)a1;
      dispatch thunk of Context.perform(aceCommand:)(v3);
    }

    else
    {
      uint64_t v4 = *(void *)(a1 + 8);
      uint64_t v5 = type metadata accessor for Context(0LL);
      uint64_t v6 = lazy protocol witness table accessor for type Context and conformance Context( &lazy protocol witness table cache variable for type Context and conformance Context,  (uint64_t (*)(uint64_t))&type metadata accessor for Context);
      EnvironmentObject.error()(0LL, v4, v5, v6);
      __break(1u);
    }
  }
}

uint64_t closure #2 in EmergencyConfirmationView.primaryButton()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v9[0] = *(void *)(a1 + 32);
  v9[1] = v3;
  unint64_t v4 = lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain(v3);
  uint64_t result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

void closure #1 in EmergencyConfirmationView.secondaryButton()(uint64_t a1)
{
  id v2 = static SABaseCommand.from(data:)();
  if (v2)
  {
    if (*(void *)a1)
    {
      uint64_t v3 = v2;
      id v7 = *(id *)a1;
      dispatch thunk of Context.perform(aceCommand:)(v3);
    }

    else
    {
      uint64_t v4 = *(void *)(a1 + 8);
      uint64_t v5 = type metadata accessor for Context(0LL);
      uint64_t v6 = lazy protocol witness table accessor for type Context and conformance Context( &lazy protocol witness table cache variable for type Context and conformance Context,  (uint64_t (*)(uint64_t))&type metadata accessor for Context);
      EnvironmentObject.error()(0LL, v4, v5, v6);
      __break(1u);
    }
  }

uint64_t closure #2 in EmergencyConfirmationView.secondaryButton()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 56);
  v9[0] = *(void *)(a1 + 48);
  v9[1] = v3;
  unint64_t v4 = lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain(v3);
  uint64_t result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t EmergencyConfirmationView.body.getter()
{
  uint64_t v1 = swift_allocObject(&unk_84E8, 112LL, 7LL);
  memcpy((void *)(v1 + 16), v0, 0x60uLL);
  outlined retain of EmergencyConfirmationView((uint64_t)v0);
  uint64_t v2 = type metadata accessor for BinaryButtonView(0LL);
  uint64_t v3 = lazy protocol witness table accessor for type Context and conformance Context( &lazy protocol witness table cache variable for type BinaryButtonView and conformance BinaryButtonView,  (uint64_t (*)(uint64_t))&type metadata accessor for BinaryButtonView);
  return ComponentStack.init(content:)( partial apply for closure #1 in EmergencyConfirmationView.body.getter,  v1,  v2,  v3);
}

uint64_t closure #1 in EmergencyConfirmationView.body.getter@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = type metadata accessor for ButtonItemButtonStyle.Role(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v22 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v23 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = swift_allocObject(&unk_8510, 112LL, 7LL);
  memcpy((void *)(v13 + 16), a1, 0x60uLL);
  v28 = a1;
  outlined retain of EmergencyConfirmationView((uint64_t)a1);
  Button.init(action:label:)( partial apply for closure #1 in EmergencyConfirmationView.primaryButton(),  v13,  partial apply for closure #2 in EmergencyConfirmationView.primaryButton(),  v27,  &type metadata for Text,  &protocol witness table for Text);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))( v6,  enum case for ButtonItemButtonStyle.Role.preferred(_:),  v3);
  uint64_t v14 = lazy protocol witness table accessor for type Button<Text> and conformance Button<A>( &lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>,  &demangling cache variable for type metadata for Button<Text>);
  View.buttonRole(_:)(v6, v7, v14);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v22 + 8);
  v15(v9, v7);
  v30[0] = v7;
  v30[1] = v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v30,  &opaque type descriptor for <<opaque return type of View.buttonRole(_:)>>,  1LL);
  uint64_t v17 = View.eraseToAnyView()(v10, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  v30[3] = &type metadata for AnyView;
  v30[4] = &protocol witness table for AnyView;
  v30[0] = v17;
  uint64_t v18 = swift_allocObject(&unk_8538, 112LL, 7LL);
  memcpy((void *)(v18 + 16), a1, 0x60uLL);
  v26 = a1;
  outlined retain of EmergencyConfirmationView((uint64_t)a1);
  Button.init(action:label:)( partial apply for closure #1 in EmergencyConfirmationView.secondaryButton(),  v18,  partial apply for closure #2 in EmergencyConfirmationView.secondaryButton(),  v25,  &type metadata for Text,  &protocol witness table for Text);
  uint64_t v19 = View.eraseToAnyView()(v7, v14);
  v15(v9, v7);
  v29[3] = &type metadata for AnyView;
  v29[4] = &protocol witness table for AnyView;
  v29[0] = v19;
  return BinaryButtonView.init(primaryButton:secondaryButton:)(v30, v29);
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance EmergencyConfirmationView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance EmergencyConfirmationView()
{
  return EmergencyConfirmationView.body.getter();
}

uint64_t partial apply for closure #1 in EmergencyConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in EmergencyConfirmationView.body.getter((const void *)(v1 + 16), a1);
}

uint64_t outlined retain of EmergencyConfirmationView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  unint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  unint64_t v8 = *(void *)(a1 + 88);
  id v9 = *(id *)a1;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  outlined copy of Data._Representation(v5, v6);
  outlined copy of Data._Representation(v7, v8);
  return a1;
}

uint64_t lazy protocol witness table accessor for type Context and conformance Context( unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = a2(255LL);
    uint64_t result = OUTLINED_FUNCTION_0(v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void partial apply for closure #1 in EmergencyConfirmationView.primaryButton()()
{
}

uint64_t partial apply for closure #2 in EmergencyConfirmationView.primaryButton()@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in EmergencyConfirmationView.primaryButton()(*(void *)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  swift_bridgeObjectRelease(*(void *)(v0 + 56));
  swift_bridgeObjectRelease(*(void *)(v0 + 72));
  outlined consume of Data._Representation(*(void *)(v0 + 80), *(void *)(v0 + 88));
  outlined consume of Data._Representation(*(void *)(v0 + 96), *(void *)(v0 + 104));
  return swift_deallocObject(v0, 112LL, 7LL);
}

void partial apply for closure #1 in EmergencyConfirmationView.secondaryButton()()
{
}

uint64_t partial apply for closure #2 in EmergencyConfirmationView.secondaryButton()@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in EmergencyConfirmationView.secondaryButton()(*(void *)(v1 + 16), a1);
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }

  return result;
}

unint64_t type metadata accessor for SABaseCommand()
{
  unint64_t result = lazy cache variable for type metadata for SABaseCommand;
  if (!lazy cache variable for type metadata for SABaseCommand)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SABaseCommand);
  }

  return result;
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_3F3C()
{
  return lazy protocol witness table accessor for type Button<Text> and conformance Button<A>( &lazy protocol witness table cache variable for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>,  &demangling cache variable for type metadata for ComponentStack<BinaryButtonView>);
}

uint64_t lazy protocol witness table accessor for type Button<Text> and conformance Button<A>( unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = OUTLINED_FUNCTION_0(v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

id static SABaseCommand.from(data:)()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v14[0] = 0LL;
  id v2 = [v0 propertyListWithData:isa options:0 format:0 error:v14];

  id v3 = v14[0];
  if (!v2)
  {
    id v11 = v14[0];
    uint64_t v12 = _convertNSErrorToError(_:)(v3);

    swift_willThrow();
    swift_errorRelease(v12);
    return 0LL;
  }

  id v4 = v14[0];
  _bridgeAnyObjectToAny(_:)(v14, v2);
  swift_unknownObjectRelease(v2);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
  uint64_t v6 = v13;
  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___AceObject);
  id result = outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(v6, v7);
  if (result)
  {
    id v9 = result;
    uint64_t v10 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
    id result = (id)swift_dynamicCastObjCClass(v9, v10);
    if (!result)
    {

      return 0LL;
    }
  }

  return result;
}

BOOL static EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.__derived_enum_equals(_:_:)( int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.init(stringValue:)( uint64_t a1, unint64_t a2)
{
  if (a1 == 0x74706D6F7270LL && a2 == 0xE600000000000000LL)
  {
    unint64_t v5 = 0xE600000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74706D6F7270LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x736C6562616CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 1LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x736C6562616CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.init(intValue:)()
{
  return 2LL;
}

Swift::Int EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x736C6562616CLL;
  }
  else {
    return 0x74706D6F7270LL;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.__derived_enum_equals(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys()
{
  return EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( uint64_t a1)
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys()
{
  return EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys()
{
  return EmergencySnippetModel.ConfirmationModel.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys@<X0>( _BYTE *a1@<X8>)
{
  uint64_t result = EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

void EmergencySnippetModel.EmergencyConfirmationModel.encode(to:)(void *a1)
{
  uint64_t v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys>);
  OUTLINED_FUNCTION_23();
  __chkstk_darwin();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v6 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys();
  OUTLINED_FUNCTION_8((uint64_t)&unk_8860, v7, v6);
  uint64_t v8 = *(void *)v4;
  uint64_t v9 = *(void *)(v4 + 8);
  LOBYTE(v14[0]) = 0;
  OUTLINED_FUNCTION_3(v8, v9, (uint64_t)v14);
  if (!v3)
  {
    __int128 v10 = *(_OWORD *)(v4 + 32);
    v14[0] = *(_OWORD *)(v4 + 16);
    v14[1] = v10;
    __int128 v11 = *(_OWORD *)(v4 + 64);
    v14[2] = *(_OWORD *)(v4 + 48);
    v14[3] = v11;
    char v13 = 1;
    unint64_t v12 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel();
    KeyedEncodingContainer.encode<A>(_:forKey:)( v14,  &v13,  v1,  &type metadata for EmergencySnippetModel.ConfirmationModel,  v12);
  }

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10();
}

void EmergencySnippetModel.EmergencyConfirmationModel.init(from:)()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys>);
  __chkstk_darwin();
  OUTLINED_FUNCTION_14();
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  unint64_t v8 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&unk_8860, &unk_8860, v8, v6, v7);
  if (v0)
  {
    OUTLINED_FUNCTION_24();
  }

  else
  {
    LOBYTE(v24) = 0;
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)(&v24, v5);
    uint64_t v11 = v10;
    unint64_t v12 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel();
    swift_bridgeObjectRetain(v11);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_4();
    if (v12)
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_13();
    }

    else
    {
      uint64_t v13 = v25;
      uint64_t v14 = v27;
      uint64_t v22 = v26;
      uint64_t v23 = v24;
      uint64_t v15 = v28;
      uint64_t v19 = v28;
      uint64_t v20 = v25;
      unint64_t v18 = v29;
      uint64_t v17 = v30;
      unint64_t v16 = v31;
      uint64_t v21 = v30;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v14);
      outlined copy of Data._Representation(v15, v18);
      outlined copy of Data._Representation(v17, v16);
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_24();
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRelease(v20);
      OUTLINED_FUNCTION_13();
      outlined consume of Data._Representation(v19, v18);
      outlined consume of Data._Representation(v21, v16);
      *uint64_t v4 = v9;
      v4[1] = v11;
      v4[2] = v23;
      v4[3] = v20;
      v4[4] = v22;
      v4[5] = v14;
      v4[6] = v19;
      v4[7] = v18;
      v4[8] = v21;
      void v4[9] = v16;
    }
  }

  OUTLINED_FUNCTION_0_0();
}

BOOL static EmergencySnippetModel.ConfirmationModel.CodingKeys.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void EmergencySnippetModel.ConfirmationModel.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t EmergencySnippetModel.ConfirmationModel.CodingKeys.init(stringValue:)( uint64_t a1, unint64_t a2)
{
  if (a1 == 0x4C6D7269666E6F63LL && a2 == 0xEC0000006C656261LL)
  {
    unint64_t v5 = 0xEC0000006C656261LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4C6D7269666E6F63LL, 0xEC0000006C656261LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x614C6C65636E6163LL && a2 == 0xEB000000006C6562LL)
  {
    unint64_t v8 = 0xEB000000006C6562LL;
    goto LABEL_16;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x614C6C65636E6163LL, 0xEB000000006C6562LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1LL;
  }

  if (a1 == 0x446D7269666E6F63LL && a2 == 0xE900000000000049LL)
  {
    unint64_t v10 = 0xE900000000000049LL;
    goto LABEL_24;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x446D7269666E6F63LL, 0xE900000000000049LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v10);
    return 2LL;
  }

  if (a1 == 0x49446C65636E6163LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 3LL;
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(0x49446C65636E6163LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v12 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t EmergencySnippetModel.ConfirmationModel.CodingKeys.init(intValue:)()
{
  return 4LL;
}

Swift::Int EmergencySnippetModel.ConfirmationModel.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t EmergencySnippetModel.ConfirmationModel.CodingKeys.intValue.getter()
{
  return 0LL;
}

uint64_t EmergencySnippetModel.ConfirmationModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_49CC + 4 * byte_6E10[a1]))( 0x4C6D7269666E6F63LL,  0xEC0000006C656261LL);
}

uint64_t sub_49CC()
{
  return 0x614C6C65636E6163LL;
}

uint64_t sub_49EC()
{
  return 0x446D7269666E6F63LL;
}

uint64_t sub_4A08()
{
  return 0x49446C65636E6163LL;
}

void EmergencySnippetModel.ConfirmationModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EmergencySnippetModel.ConfirmationModel.CodingKeys>);
  OUTLINED_FUNCTION_23();
  __chkstk_darwin();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v5 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys();
  OUTLINED_FUNCTION_8((uint64_t)&unk_8978, v6, v5);
  uint64_t v7 = *(void *)v3;
  uint64_t v8 = *(void *)(v3 + 8);
  LOBYTE(v17) = 0;
  OUTLINED_FUNCTION_3(v7, v8, (uint64_t)&v17);
  if (!v2)
  {
    uint64_t v9 = *(void *)(v3 + 16);
    uint64_t v10 = *(void *)(v3 + 24);
    LOBYTE(v17) = 1;
    OUTLINED_FUNCTION_3(v9, v10, (uint64_t)&v17);
    __int128 v17 = *(_OWORD *)(v3 + 32);
    unint64_t v11 = lazy protocol witness table accessor for type Data and conformance Data();
    uint64_t v14 = OUTLINED_FUNCTION_2(v11, v12, v13, (uint64_t)&type metadata for Data);
    __int128 v17 = *(_OWORD *)(v3 + 48);
    OUTLINED_FUNCTION_2(v14, v15, v16, (uint64_t)&type metadata for Data);
  }

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10();
}

void EmergencySnippetModel.ConfirmationModel.init(from:)()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EmergencySnippetModel.ConfirmationModel.CodingKeys>);
  __chkstk_darwin();
  OUTLINED_FUNCTION_14();
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  unint64_t v7 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&unk_8978, &unk_8978, v7, v5, v6);
  if (v0)
  {
    OUTLINED_FUNCTION_20();
  }

  else
  {
    uint64_t v8 = OUTLINED_FUNCTION_7();
    uint64_t v10 = v9;
    uint64_t v15 = v8;
    LOBYTE(v17) = 1;
    swift_bridgeObjectRetain(v9);
    uint64_t v11 = OUTLINED_FUNCTION_7();
    uint64_t v16 = v12;
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    lazy protocol witness table accessor for type Data and conformance Data();
    swift_bridgeObjectRetain(v13);
    OUTLINED_FUNCTION_28();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    outlined copy of Data._Representation(v17, v18);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_1();
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v16);
    outlined copy of Data._Representation(v17, v18);
    outlined copy of Data._Representation(v17, v18);
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_5();
    swift_bridgeObjectRelease(v16);
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease(v16);
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_19();
    outlined consume of Data._Representation(v17, v18);
    *uint64_t v4 = v15;
    v4[1] = v10;
    v4[2] = v14;
    v4[3] = v16;
    v4[4] = v17;
    v4[5] = v18;
    v4[6] = v17;
    v4[7] = v18;
  }

  OUTLINED_FUNCTION_0_0();
}

uint64_t EmergencySnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015LL && a2 == 0x80000000000074B0LL)
  {
    swift_bridgeObjectRelease(0x80000000000074B0LL);
    char v3 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x80000000000074B0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v3 = v4 ^ 1;
  }

  return v3 & 1;
}

unint64_t EmergencySnippetModel.CodingKeys.stringValue.getter()
{
  return 0xD000000000000015LL;
}

uint64_t static EmergencySnippetModel.EmergencyConfirmationCodingKeys.__derived_enum_equals(_:_:)()
{
  return 1LL;
}

void EmergencySnippetModel.EmergencyConfirmationCodingKeys.hash(into:)()
{
}

uint64_t EmergencySnippetModel.EmergencyConfirmationCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000LL)
  {
    swift_bridgeObjectRelease(0xE200000000000000LL);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(12383LL, 0xE200000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

void EmergencySnippetModel.CodingKeys.hashValue.getter()
{
}

uint64_t EmergencySnippetModel.EmergencyConfirmationCodingKeys.stringValue.getter()
{
  return 12383LL;
}

void EmergencySnippetModel.encode(to:)()
{
  uint64_t v2 = v0;
  uint64_t v27 = v0;
  char v4 = v3;
  outlined init with take of EmergencySnippetModel(v2, v30);
  uint64_t v25 = v30[0];
  uint64_t v19 = v30[1];
  uint64_t v5 = v30[3];
  uint64_t v24 = v30[2];
  uint64_t v6 = v30[5];
  uint64_t v23 = v30[4];
  unint64_t v7 = v30[7];
  uint64_t v20 = v30[6];
  uint64_t v8 = v30[8];
  unint64_t v31 = v30[9];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EmergencySnippetModel.EmergencyConfirmationCodingKeys>);
  uint64_t v26 = *(void *)(v22 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_15();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EmergencySnippetModel.CodingKeys>);
  uint64_t v21 = *(void *)(v28 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = v4[3];
  uint64_t v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  unint64_t v13 = lazy protocol witness table accessor for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&unk_86B0, &unk_86B0, v13, v11, v12);
  uint64_t v14 = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  uint64_t v15 = v20;
  outlined copy of Data._Representation(v20, v7);
  outlined copy of Data._Representation(v8, v31);
  lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  v29[0] = v25;
  v29[1] = v14;
  v29[2] = v24;
  v29[3] = v5;
  v29[4] = v23;
  void v29[5] = v6;
  v29[6] = v15;
  v29[7] = v7;
  v29[8] = v8;
  v29[9] = v31;
  unint64_t v16 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel();
  uint64_t v17 = v22;
  KeyedEncodingContainer.encode<A>(_:forKey:)( v29,  v18,  v22,  &type metadata for EmergencySnippetModel.EmergencyConfirmationModel,  v16);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v1, v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v28);
  outlined release of EmergencySnippetModel(v27);
  OUTLINED_FUNCTION_0_0();
}

void EmergencySnippetModel.init(from:)()
{
  char v3 = v2;
  uint64_t v35 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EmergencySnippetModel.EmergencyConfirmationCodingKeys>);
  __chkstk_darwin();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EmergencySnippetModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_15();
  uint64_t v8 = v3[3];
  uint64_t v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  unint64_t v9 = lazy protocol witness table accessor for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys();
  uint64_t v10 = v8;
  uint64_t v11 = v3;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&unk_86B0, &unk_86B0, v9, v10, v7);
  if (v0) {
    goto LABEL_8;
  }
  uint64_t v30 = v6;
  uint64_t v12 = KeyedDecodingContainer.allKeys.getter(v5);
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    uint64_t v19 = v5;
LABEL_7:
    uint64_t v20 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v20, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v22 = &type metadata for EmergencySnippetModel;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter(v19);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v23,  0xD00000000000002BLL,  0x8000000000007480LL,  0LL);
    uint64_t v24 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104LL))( v22,  enum case for DecodingError.typeMismatch(_:),  v20);
    swift_willThrow(v24);
    OUTLINED_FUNCTION_11();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v1, v19);
    uint64_t v11 = v3;
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1(v11);
    goto LABEL_9;
  }

  uint64_t v14 = v12;
  specialized ArraySlice.subscript.getter(1LL, v13, v12, v12 + 32, 0LL, (2 * v13) | 1);
  uint64_t v16 = v15;
  unint64_t v18 = v17;
  swift_bridgeObjectRelease(v14);
  if (v16 != v18 >> 1)
  {
    uint64_t v19 = v5;
    goto LABEL_7;
  }

  lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9();
  __int128 v29 = v32[1];
  __int128 v31 = v32[0];
  __int128 v27 = v32[3];
  __int128 v28 = v32[2];
  uint64_t v25 = v33;
  uint64_t v26 = v34;
  __swift_destroy_boxed_opaque_existential_1(v3);
  *(_OWORD *)uint64_t v35 = v31;
  *(_OWORD *)(v35 + closure #1 in EmergencyConfirmationView.secondaryButton()(v0 + 16) = v29;
  *(_OWORD *)(v35 + 32) = v28;
  *(_OWORD *)(v35 + 48) = v27;
  *(void *)(v35 + 64) = v25;
  *(void *)(v35 + 72) = v26;
LABEL_9:
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Decodable.init(from:) in conformance EmergencySnippetModel.EmergencyConfirmationModel( void *a1@<X8>)
{
  if (!v1) {
    memcpy(a1, v3, 0x50uLL);
  }
}

void protocol witness for Encodable.encode(to:) in conformance EmergencySnippetModel.EmergencyConfirmationModel( void *a1)
{
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys( char *a1, char *a2)
{
  return static EmergencySnippetModel.ConfirmationModel.CodingKeys.__derived_enum_equals(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys()
{
  return EmergencySnippetModel.ConfirmationModel.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys( uint64_t a1)
{
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys()
{
  return EmergencySnippetModel.ConfirmationModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = EmergencySnippetModel.ConfirmationModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys@<X0>( _BYTE *a1@<X8>)
{
  uint64_t result = EmergencySnippetModel.ConfirmationModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EmergencySnippetModel.ConfirmationModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

double protocol witness for Decodable.init(from:) in conformance EmergencySnippetModel.ConfirmationModel@<D0>( _OWORD *a1@<X8>)
{
  if (!v1)
  {
    *a1 = v4;
    a1[1] = v5;
    double result = *(double *)&v6;
    a1[2] = v6;
    a1[3] = v7;
  }

  return result;
}

void protocol witness for Encodable.encode(to:) in conformance EmergencySnippetModel.ConfirmationModel( void *a1)
{
}

void protocol witness for Hashable.hashValue.getter in conformance EmergencySnippetModel.CodingKeys()
{
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EmergencySnippetModel.CodingKeys@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = EmergencySnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EmergencySnippetModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EmergencySnippetModel.CodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance EmergencySnippetModel.CodingKeys( uint64_t a1)
{
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = EmergencySnippetModel.EmergencyConfirmationCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys()
{
  return EmergencySnippetModel.ConfirmationModel.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys@<X0>( _BYTE *a1@<X8>)
{
  uint64_t result = static EmergencySnippetModel.EmergencyConfirmationCodingKeys.__derived_enum_equals(_:_:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance EmergencySnippetModel()
{
  return 0xD000000000000011LL;
}

void protocol witness for Decodable.init(from:) in conformance EmergencySnippetModel(void *a1@<X8>)
{
  if (!v1) {
    outlined init with take of EmergencySnippetModel(&v3, a1);
  }
}

void protocol witness for Encodable.encode(to:) in conformance EmergencySnippetModel()
{
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EmergencySnippetModel.CodingKeys, &unk_86B0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EmergencySnippetModel.CodingKeys, &unk_86B0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EmergencySnippetModel.CodingKeys, &unk_86B0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EmergencySnippetModel.CodingKeys, &unk_86B0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.CodingKeys and conformance EmergencySnippetModel.CodingKeys);
  }

  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t specialized OptionSet<>.init()()
{
  return 0LL;
}

id outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v5 = [a2 aceObjectWithDictionary:isa];

  return v5;
}

uint64_t specialized ArraySlice.subscript.getter( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if ((a2 & 0x8000000000000000LL) == 0) {
    return swift_unknownObjectRetain(a3);
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationCodingKeys,  &unk_8740);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationCodingKeys,  &unk_8740);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationCodingKeys,  &unk_8740);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationCodingKeys,  &unk_8740);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationCodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationCodingKeys);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel,  &type metadata for EmergencySnippetModel.EmergencyConfirmationModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel,  &type metadata for EmergencySnippetModel.EmergencyConfirmationModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel and conformance EmergencySnippetModel.EmergencyConfirmationModel);
  }

  return result;
}

void *outlined release of EmergencySnippetModel(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[6];
  unint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  unint64_t v7 = a1[9];
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  outlined consume of Data._Representation(v4, v5);
  outlined consume of Data._Representation(v6, v7);
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

void type metadata accessor for EmergencySnippetModel.EmergencyConfirmationModel()
{
}

uint64_t getEnumTag for EmergencySnippetModel.CodingKeys()
{
  return 0LL;
}

void *type metadata accessor for EmergencySnippetModel.CodingKeys()
{
  return &unk_86B0;
}

uint64_t getEnumTagSinglePayload for EmergencySnippetModel.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EmergencySnippetModel.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_5B5C + 4 * byte_6E14[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_5B7C + 4 * byte_6E19[v4]))();
  }
}

_BYTE *sub_5B5C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_5B7C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_5B84(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_5B8C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_5B94(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_5B9C(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

void *type metadata accessor for EmergencySnippetModel.EmergencyConfirmationCodingKeys()
{
  return &unk_8740;
}

uint64_t destroy for EmergencySnippetModel.EmergencyConfirmationModel(void *a1)
{
  return outlined consume of Data._Representation(a1[8], a1[9]);
}

void *initializeWithCopy for EmergencySnippetModel.EmergencyConfirmationModel(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[6];
  unint64_t v8 = a2[7];
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  outlined copy of Data._Representation(v7, v8);
  a1[6] = v7;
  a1[7] = v8;
  uint64_t v10 = a2[8];
  unint64_t v9 = a2[9];
  outlined copy of Data._Representation(v10, v9);
  a1[8] = v10;
  a1[9] = v9;
  return a1;
}

void *assignWithCopy for EmergencySnippetModel.EmergencyConfirmationModel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  OUTLINED_FUNCTION_25();
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  a1[3] = v5;
  swift_bridgeObjectRetain(v5);
  OUTLINED_FUNCTION_25();
  a1[4] = a2[4];
  uint64_t v6 = a2[5];
  a1[5] = v6;
  swift_bridgeObjectRetain(v6);
  OUTLINED_FUNCTION_25();
  uint64_t v7 = a2[6];
  unint64_t v8 = a2[7];
  outlined copy of Data._Representation(v7, v8);
  uint64_t v9 = a1[6];
  unint64_t v10 = a1[7];
  a1[6] = v7;
  a1[7] = v8;
  outlined consume of Data._Representation(v9, v10);
  uint64_t v12 = a2[8];
  unint64_t v11 = a2[9];
  outlined copy of Data._Representation(v12, v11);
  uint64_t v13 = a1[8];
  unint64_t v14 = a1[9];
  a1[8] = v12;
  a1[9] = v11;
  outlined consume of Data._Representation(v13, v14);
  return a1;
}

void *assignWithTake for EmergencySnippetModel.EmergencyConfirmationModel(void *a1, uint64_t a2)
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
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = a1[5];
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a1[6];
  unint64_t v11 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  outlined consume of Data._Representation(v10, v11);
  uint64_t v12 = a1[8];
  unint64_t v13 = a1[9];
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  outlined consume of Data._Representation(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencySnippetModel.EmergencyConfirmationModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for EmergencySnippetModel.EmergencyConfirmationModel( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0LL;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 80) = 1;
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

    *(_BYTE *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for EmergencySnippetModel()
{
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys,  &unk_8860);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys,  &unk_8860);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys,  &unk_8860);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys,  &unk_8860);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys and conformance EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel,  &type metadata for EmergencySnippetModel.ConfirmationModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel,  &type metadata for EmergencySnippetModel.ConfirmationModel);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel and conformance EmergencySnippetModel.ConfirmationModel);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFF)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_6168 + 4 * byte_6E23[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_619C + 4 * byte_6E1E[v4]))();
}

uint64_t sub_619C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_61A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x61ACLL);
  }
  return result;
}

uint64_t sub_61B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x61C0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_61C4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_61CC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys( _BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for EmergencySnippetModel.EmergencyConfirmationModel.CodingKeys()
{
  return &unk_8860;
}

uint64_t destroy for EmergencySnippetModel.ConfirmationModel(void *a1)
{
  return outlined consume of Data._Representation(a1[6], a1[7]);
}

void *initializeWithCopy for EmergencySnippetModel.ConfirmationModel(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[4];
  unint64_t v7 = a2[5];
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  outlined copy of Data._Representation(v6, v7);
  a1[4] = v6;
  a1[5] = v7;
  uint64_t v9 = a2[6];
  unint64_t v8 = a2[7];
  outlined copy of Data._Representation(v9, v8);
  a1[6] = v9;
  a1[7] = v8;
  return a1;
}

void *assignWithCopy for EmergencySnippetModel.ConfirmationModel(void *a1, void *a2)
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
  unint64_t v9 = a2[5];
  outlined copy of Data._Representation(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  a1[4] = v8;
  a1[5] = v9;
  outlined consume of Data._Representation(v10, v11);
  uint64_t v13 = a2[6];
  unint64_t v12 = a2[7];
  outlined copy of Data._Representation(v13, v12);
  uint64_t v14 = a1[6];
  unint64_t v15 = a1[7];
  a1[6] = v13;
  a1[7] = v12;
  outlined consume of Data._Representation(v14, v15);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + closure #1 in EmergencyConfirmationView.secondaryButton()(v0 + 16) = v3;
  return result;
}

void *assignWithTake for EmergencySnippetModel.ConfirmationModel(void *a1, uint64_t a2)
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
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  outlined consume of Data._Representation(v8, v9);
  uint64_t v10 = a1[6];
  unint64_t v11 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  outlined consume of Data._Representation(v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencySnippetModel.ConfirmationModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for EmergencySnippetModel.ConfirmationModel( uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for EmergencySnippetModel.ConfirmationModel()
{
}

unint64_t lazy protocol witness table accessor for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel.CodingKeys,  &unk_8978);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel.CodingKeys,  &unk_8978);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel.CodingKeys,  &unk_8978);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmergencySnippetModel.ConfirmationModel.CodingKeys,  &unk_8978);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type EmergencySnippetModel.ConfirmationModel.CodingKeys and conformance EmergencySnippetModel.ConfirmationModel.CodingKeys);
  }

  return result;
}

  ;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for EmergencySnippetModel.ConfirmationModel.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EmergencySnippetModel.ConfirmationModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_66AC + 4 * byte_6E2D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_66E0 + 4 * byte_6E28[v4]))();
}

uint64_t sub_66E0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_66E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x66F0LL);
  }
  return result;
}

uint64_t sub_66FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x6704LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_6708(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_6710(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for EmergencySnippetModel.ConfirmationModel.CodingKeys( _BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void *type metadata accessor for EmergencySnippetModel.ConfirmationModel.CodingKeys()
{
  return &unk_8978;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(v6 - 80, v6 - 81, v4, a4, v5);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 224) + 8LL))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return KeyedDecodingContainer.decode(_:forKey:)(v1 - 96, v0);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 176) + 8LL))(v0, v1);
}

  ;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return outlined consume of Data._Representation(v0, v1);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return outlined consume of Data._Representation(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

void OUTLINED_FUNCTION_22()
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 104));
}

  ;
}